// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class FluxerLocalizationsCs extends FluxerLocalizations {
  FluxerLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get reconnectingTitle => 'Něco jsme pokazili!';

  @override
  String get reconnectingBody =>
      'S instancí je něco v nepořádku.\nMělo by se to za chvilku opravit!';

  @override
  String get gatewayReconnectingToast => 'Opětovné připojování…';

  @override
  String get gatewayConnectedToast => 'Připojeno';

  @override
  String get sessionExpiredToast =>
      'Vaše relace vypršela. Přihlaste se prosím znovu.';

  @override
  String splashStartupFailed(String error) {
    return 'Spuštění selhalo: $error';
  }

  @override
  String get retry => 'Zkusit znovu';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Připojení ztraceno';

  @override
  String get splashViewOnStatusPage => 'Zobrazit na stránce stavu';

  @override
  String get splashConnectionIssuesPrompt => 'Problémy s připojením?';

  @override
  String get splashStatusPageLink => 'Stránka stavu';

  @override
  String get splashReadIncident => 'Přečíst incident';

  @override
  String get splashIncidentHistory => 'Historie incidentů';

  @override
  String get nagbarLearnMore => 'Zjistit více';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'Údržba je naplánována na $localizedTime. Předpokládaná doba trvání: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Probíhá údržba. Předpokládaná doba trvání: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'Údržba je dokončena.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Zdravíme, $displayName! Dokončete registraci svého účtu, abyste k němu neztratili přístup.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Zdravíme, $displayName! Ověřte prosím svou e-mailovou adresu.';
  }

  @override
  String get nagbarOpenSettings => 'Otevřít nastavení';

  @override
  String get systemPermissionSettingsTitle => 'Povolit oprávnění';

  @override
  String get systemPermissionSettingsOpenSettings => 'Otevřít nastavení';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName nemá přístup k vašemu mikrofonu. Můžete ho povolit v nastavení soukromí vašeho zařízení.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName nemá přístup k vašemu fotoaparátu. Můžete ho povolit v nastavení soukromí vašeho zařízení.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName nemá přístup k vaší fotogalerii. Můžete ho povolit v nastavení soukromí vašeho zařízení.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName nemá oprávnění odesílat oznámení. Můžete ho povolit v nastavení zařízení.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Vaše předplatné se neobnovilo, ale stále máte přístup k výhodám $productName do $graceDate. Podnikněte kroky hned teď, jinak přijdete o všechny výhody.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Vaše předplatné $productName vypršelo. Obnovte si ho a zachovejte si své výhody.';
  }

  @override
  String get nagbarManageSubscription => 'Spravovat předplatné';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Vítejte v $productFullName. Prozkoumejte výhody svého členství v $productName a spravujte své předplatné.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'Zobrazit funkce $productName';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'Čeká na vás nový kód dárku ve vaší inventáři dárků.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'Máte $count nových kódů dárků čekajících ve vaší inventáři dárků.';
  }

  @override
  String get nagbarViewGiftInventory => 'Zobrazit inventář dárků';

  @override
  String get nagbarVisionaryMfa =>
      'Povolte dvoufaktorové ověřování k ochraně svého účtu Visionary.';

  @override
  String get nagbarEnableMfa => 'Zapnout 2FA';

  @override
  String get nagbarTermsAcceptance =>
      'Aktualizovali jsme naše podmínky. Chcete-li pokračovat, zkontrolujte je a přijměte je.';

  @override
  String get nagbarReviewTerms => 'Zkontrolovat podmínky';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Připojte se ke komunitě $communityName, povídejte si s týmem a sledujte novinky.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Připojit se k $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'Povolte oznámení, abyste nepřišli o zprávy a zmínky.';

  @override
  String get nagbarEnableNotifications => 'Zapnout oznámení';

  @override
  String get nagbarBillingPortalFailed =>
      'Nepodařilo se otevřít fakturační portál. Zkuste to prosím za chvíli znovu.';

  @override
  String get welcomeBack => 'Vítejte zpět';

  @override
  String get email => 'E-mail';

  @override
  String get emailInvalid => 'Zadejte platnou e-mailovou adresu.';

  @override
  String get password => 'Heslo';

  @override
  String get forgotPassword => 'Zapomněli jste heslo?';

  @override
  String get logIn => 'Přihlásit se';

  @override
  String get logInWithPasskey => 'Přihlásit se pomocí klíče';

  @override
  String continueWithSso(String provider) {
    return 'Pokračovat s $provider';
  }

  @override
  String get ssoRequired => 'Pro přístup k této instanci je vyžadováno SSO.';

  @override
  String get organizationSsoProvider =>
      'Přihlaste se pomocí poskytovatele jednotného přihlášení vaší organizace.';

  @override
  String get failedToStartSso => 'Nepodařilo se spustit jednotné přihlášení';

  @override
  String get ssoCancelled => 'Přihlášení SSO bylo zrušeno';

  @override
  String preferSso(String provider) {
    return 'Preferujete SSO? Pokračujte s $provider.';
  }

  @override
  String get logInViaBrowser => 'Přihlásit se přes prohlížeč';

  @override
  String get needAccountPrompt => 'Potřebujete účet? ';

  @override
  String get register => 'Registrovat se';

  @override
  String get orDivider => 'OR';

  @override
  String get cancel => 'Zrušit';

  @override
  String get ipAuthCheckEmail => 'Zkontrolujte svůj e-mail';

  @override
  String ipAuthDescription(String email) {
    return 'Poslali jsme e-mail s odkazem pro autorizaci tohoto přihlášení. Otevřete si prosím schránku pro $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Připojení ztraceno';

  @override
  String get ipAuthConnectionLostDescription =>
      'Ztratili jsme spojení při čekání na autorizaci. Zkuste to prosím znovu.';

  @override
  String get ipAuthLinkExpired => 'Platnost odkazu pro přihlášení vypršela';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Platnost tohoto odkazu pro autorizaci vypršela. Znovu se prosím přihlaste.';

  @override
  String get ipAuthResendEmail => 'Znovu odeslat e-mail';

  @override
  String get ipAuthResent => 'Znovu odesláno';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Zpět';

  @override
  String get next => 'Další';

  @override
  String get mfaTitle => 'Dvoufaktorové ověřování';

  @override
  String get mfaChooseMethod => 'Vyberte metodu ověření';

  @override
  String get mfaMethodTotp => 'Aplikace pro ověření';

  @override
  String get mfaMethodWebauthn => 'Bezpečnostní klíč / přístupový klíč';

  @override
  String get mfaTotpDescription =>
      'Zadejte 6místný kód z vaší aplikace pro ověření nebo jeden z vašich záložních kódů.';

  @override
  String get mfaCodeLabel => 'Kód';

  @override
  String get mfaTryAnotherMethod => 'Zkusit jinou metodu';

  @override
  String get mfaUseSecurityKey =>
      'Zkusit místo toho bezpečnostní klíč / přístupový klíč';

  @override
  String get accountSelectorTitle => 'Vyberte účet';

  @override
  String get accountSelectorDescription => 'Vyberte účet, nebo přidejte jiný.';

  @override
  String get accountAdd => 'Přidat účet';

  @override
  String get accountRemove => 'Odebrat';

  @override
  String accountRemoveTitle(String username) {
    return 'Odebrat účet $username';
  }

  @override
  String get accountRemoveDescription =>
      'Tímto odstraníte uloženou relaci pro tento účet.';

  @override
  String get accountRemoveOnlyDescription =>
      'Tímto odstraníte jediný uložený účet v tomto zařízení.';

  @override
  String get accountExpired => 'Vypršela platnost';

  @override
  String accountSessionExpired(String identifier) {
    return 'Platnost relace pro $identifier vypršela. Přihlaste se znovu.';
  }

  @override
  String get accountManageTitle => 'Spravovat účty';

  @override
  String get accountSwitchFailed =>
      'Nepodařilo se přepnout účty. Zkuste to znovu.';

  @override
  String get profileTabMenuSwitchAccounts => 'Přepnout účty';

  @override
  String get statusChangeSheetTitle => 'Nastavit stav';

  @override
  String get statusOnlineStatusSection => 'Stav online';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusIdle => 'Neaktivní';

  @override
  String get statusDnd => 'Nerušit';

  @override
  String get statusInvisible => 'Neviditelný';

  @override
  String get statusOffline => 'Offline';

  @override
  String get statusUntilIChangeIt => 'Dokud to nezměním';

  @override
  String get statusDontClear => 'Nemazat';

  @override
  String get statusFor10Seconds => 'Na 10 sekund';

  @override
  String get statusClearAfter10Seconds => '10 sekund';

  @override
  String get statusClearAfter15Minutes => '15 minut';

  @override
  String get statusClearAfter30Minutes => '30 minut';

  @override
  String get statusClearAfter1Hour => '1 hodina';

  @override
  String get statusClearAfter3Hours => '3 hodiny';

  @override
  String get statusClearAfter4Hours => '4 hodiny';

  @override
  String get statusClearAfter8Hours => '8 hodin';

  @override
  String get statusClearAfter24Hours => '24 hodin';

  @override
  String get statusClearAfter3Days => '3 dny';

  @override
  String get statusDndDescription => 'Na počítači nebudete dostávat oznámení';

  @override
  String get statusInvisibleDescription => 'Budete vypadat offline';

  @override
  String get customStatusSetTitle => 'Nastavit vlastní stav';

  @override
  String get customStatusCurrentHint => 'Vlastní stav';

  @override
  String get customStatusClear => 'Vymazat vlastní stav';

  @override
  String get customStatusPlaceholder => 'Co se děje?';

  @override
  String get customStatusChooseEmoji => 'Vyberte emoji';

  @override
  String get customStatusClearAfter => 'Vymazat po';

  @override
  String get customStatusSave => 'Uložit';

  @override
  String get accountActive => 'Aktivní účet';

  @override
  String get signOut => 'Odhlásit se';

  @override
  String get suspendedPermanentTitle => 'Účet trvale pozastaven';

  @override
  String get suspendedTemporaryTitle => 'Účet pozastaven';

  @override
  String get suspendedPermanentDescription =>
      'Váš účet byl trvale pozastaven za porušení našich Podmínek služby.';

  @override
  String get suspendedTemporaryDescription =>
      'Váš účet byl dočasně pozastaven. K účtu budete mít přístup po skončení období pozastavení.';

  @override
  String get suspendedIssuedAt => 'Vydáno';

  @override
  String get suspendedEndsAt => 'Končí';

  @override
  String get suspendedDuration => 'Doba trvání';

  @override
  String get suspendedPermanent => 'Trvale';

  @override
  String get suspendedReason => 'Důvod';

  @override
  String get suspendedAppealDeadline => 'Termín odvolání';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Váš účet je naplánován ke smazání $date.';
  }

  @override
  String get suspendedRecheck => 'Zkontrolovat aktualizace';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Zkusit znovu za ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Zpět na přihlášení';

  @override
  String get suspendedAppealTitle => 'Odvolání';

  @override
  String get suspendedAppealHint =>
      'Vysvětlete, proč by mělo být vaše pozastavení přezkoumáno (minimálně 50 znaků)...';

  @override
  String get suspendedAppealSubmit => 'Odeslat odvolání';

  @override
  String get suspendedAppealPending => 'Čeká na přezkoumání';

  @override
  String get suspendedAppealAccepted => 'Odvolání přijato';

  @override
  String get suspendedAppealRejected => 'Odvolání zamítnuto';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Vaše odvolání bylo přijato a váš účet byl obnoven.';

  @override
  String get suspendedSignIn => 'Přihlásit se ke svému účtu';

  @override
  String get forgotPasswordTitle => 'Zapomněli jste heslo?';

  @override
  String get forgotPasswordDescription =>
      'Zadejte svou e-mailovou adresu a my vám pošleme odkaz pro resetování hesla.';

  @override
  String get forgotPasswordSubmit => 'Odeslat odkaz pro resetování';

  @override
  String get forgotPasswordSentTitle => 'Zkontrolujte svůj e-mail';

  @override
  String get forgotPasswordSentDescription =>
      'Odeslali jsme vám pokyny k resetování hesla na vaši e-mailovou adresu. Zkontrolujte prosím svou schránku a klikněte na odkaz pro resetování hesla.';

  @override
  String get forgotPasswordBackToLogin => 'Zpět na přihlášení';

  @override
  String get resetPasswordTitle => 'Nastavit nové heslo';

  @override
  String get resetPasswordDescription =>
      'Zadejte své nové heslo níže, abyste dokončili proces resetování.';

  @override
  String get resetPasswordNewPassword => 'Nové heslo';

  @override
  String get resetPasswordConfirm => 'Potvrďte nové heslo';

  @override
  String get resetPasswordSubmit => 'Obnovit heslo';

  @override
  String get resetPasswordMismatch => 'Hesla se neshodují.';

  @override
  String get recoverAccountTitle => 'Obnovit účet';

  @override
  String get recoverAccountDescription =>
      'Zadejte své uživatelské jméno a obnovovací klíč z vaší obnovovací sady a poté zvolte nové heslo.';

  @override
  String get recoverAccountNoKit =>
      'Žádný záchranný balíček? Požádejte administrátora této instance o odkaz na obnovení hesla.';

  @override
  String get recoveryKitTitle => 'Vaše sada pro obnovení';

  @override
  String get recoveryKitCreatedDescription =>
      'Pokud zapomenete heslo, tato sada je jediný způsob, jak se dostat zpět do svého účtu. Uložte si ji na bezpečné místo, například do správce hesel nebo jako tištěnou kopii.';

  @override
  String get recoveryKitReplacedDescription =>
      'Vaše stará sada pro obnovení již nefunguje. Tuto novou si uložte na bezpečné místo.';

  @override
  String get recoveryKitRecoveredDescription =>
      'Vaše heslo bylo resetováno. Vaše stará sada pro obnovení již nefunguje. Uložte si tuto novou sadu na bezpečné místo.';

  @override
  String get recoveryKitWarning =>
      'Kdokoli s tímto klíčem může resetovat vaše heslo. Nikdy ho nesdílejte.';

  @override
  String get recoveryKitKeyLabel => 'Obnovovací klíč';

  @override
  String recoveryKitDocumentTitle(String productName) {
    return 'Klíč k obnovení $productName';
  }

  @override
  String get recoveryKitDocumentIntro =>
      'Tuto stránku si uložte na bezpečné místo. Pokud zapomenete heslo, můžete ji použít k obnovení přístupu ke svému účtu. Kdokoli s tímto obnovovacím klíčem může resetovat vaše heslo, takže ho nikdy nesdílejte.';

  @override
  String get recoveryKitInstanceLabel => 'Instance';

  @override
  String get recoveryKitCreatedAtLabel => 'Vytvořeno';

  @override
  String get recoveryKitQrCaption =>
      'Naskenujte a otevřete stránku pro obnovení s předvyplněnými údaji.';

  @override
  String get recoveryKitStepsTitle => 'Jak obnovit svůj účet';

  @override
  String recoveryKitStepOpen(String recoverUrl) {
    return 'Přejděte na $recoverUrl nebo naskenujte QR kód.';
  }

  @override
  String get recoveryKitStepEnter =>
      'Zadejte své uživatelské jméno a tento obnovovací klíč.';

  @override
  String get recoveryKitStepPassword =>
      'Zvolte nové heslo. Dostanete novou sadu pro obnovení a tato přestane fungovat.';

  @override
  String get recoveryKitBackupCodesTitle => 'Dvoufaktorové záložní kódy';

  @override
  String get recoveryKitBackupCodesNote =>
      'Každý kód funguje jednou místo vaší aplikace pro ověřování.';

  @override
  String get recoveryKitBackupCodesFailed =>
      'Nepodařilo se načíst vaše záložní kódy.';

  @override
  String get recoveryKitIncludeBackupCodes =>
      'Zahrnout mé záložní kódy dvoufázového ověření do uloženého obrázku';

  @override
  String get recoveryKitCopy => 'Kopírovat';

  @override
  String get recoveryKitCopied => 'Klíč pro obnovení zkopírován';

  @override
  String get recoveryKitSaveImage => 'Uložit obrázek';

  @override
  String get recoveryKitSaved => 'Sada pro obnovení uložena';

  @override
  String get recoveryKitSavedToPhotos => 'Sada pro obnovení uložena do fotek';

  @override
  String get recoveryKitSaveFailed =>
      'Sadu pro obnovení se nepodařilo uložit. Zkus to znovu nebo místo toho zkopíruj klíč.';

  @override
  String get recoveryKitAcknowledge =>
      'Uložil/a jsem si svou sadu pro obnovení na bezpečné místo';

  @override
  String get recoveryKitCreateFailed =>
      'Nepodařilo se vytvořit váš záchranný balíček. Můžete si ho vytvořit později v nastavení účtu.';

  @override
  String get recoveryKitSectionTitle => 'Záchranná sada';

  @override
  String get recoveryKitSectionDescription =>
      'Umožňuje resetovat heslo, pokud ho zapomenete.';

  @override
  String get recoveryKitNone => 'Ještě nemáte záchrannou sadu';

  @override
  String recoveryKitCreatedRelative(String time) {
    return 'Vytvořeno $time';
  }

  @override
  String get recoveryKitCreate => 'Vytvořit záchrannou sadu';

  @override
  String get recoveryKitCreateNew => 'Vytvořit novou sadu';

  @override
  String get recoveryKitReplaceTitle => 'Vytvořit nový obnovovací klíč?';

  @override
  String get recoveryKitReplaceDescription =>
      'Vaše současná sada přestane fungovat, jakmile bude vytvořena nová.';

  @override
  String get recoveryKitReminderTitle => 'Uložit obnovovací sadu';

  @override
  String get recoveryKitReminderBody =>
      'Váš účet nemá zadanou e-mailovou adresu. Pokud zapomenete heslo, jediná cesta zpět je záchranná sada. Zabere to jen chvilku.';

  @override
  String get registerUsernameSignInHint =>
      'Přihlašujete se tímto uživatelským jménem. Vyberte si takové, které si zapamatujete.';

  @override
  String get registerUsernameTaken => 'Toto uživatelské jméno je již obsazené';

  @override
  String get registerUsernameAvailable =>
      'Toto uživatelské jméno je k dispozici';

  @override
  String get claimAccountUsernameDescription =>
      'Získejte svůj účet výběrem uživatelského jména a hesla. Přihlásíte se s nimi, takže si vyberte takové, na které si vzpomenete.';

  @override
  String get unclaimedAccountDescriptionUsername =>
      'Váš účet ještě není uplatněn. Bez uživatelského jména a hesla se nebudete moci přihlásit z jiných zařízení a můžete ztratit přístup ke svému účtu. Uplatněte svůj účet nyní a zabezpečte ho.';

  @override
  String get addFriendUsernameOnlyHint => 'Uživatelské jméno';

  @override
  String get registerTitle => 'Vytvořit účet';

  @override
  String get registerDisplayName => 'Zobrazované jméno (volitelné)';

  @override
  String get registerDisplayNameHint => 'Jak vám mají lidé říkat?';

  @override
  String get registerUsername => 'Uživatelské jméno (volitelné)';

  @override
  String get registerUsernameHint =>
      'Ponechte prázdné pro náhodné uživatelské jméno';

  @override
  String get registerUsernameTagHint =>
      'Čtyřmístný tag bude automaticky přidán pro zajištění jedinečnosti';

  @override
  String get registerDateOfBirth => 'Datum narození';

  @override
  String get registerMonth => 'Měsíc';

  @override
  String get registerDay => 'Den';

  @override
  String get registerYear => 'Rok';

  @override
  String get registerConsent =>
      'Souhlasím s podmínkami služby a zásadami ochrany osobních údajů';

  @override
  String get registerConsentPrefix => 'Souhlasím s ';

  @override
  String get registerConsentTerms => 'Podmínky služby';

  @override
  String get registerConsentAnd => ' a ';

  @override
  String get registerConsentPrivacy => 'Zásady ochrany osobních údajů';

  @override
  String get registerConfirmPassword => 'Potvrďte heslo';

  @override
  String get registerSubmit => 'Vytvořit účet';

  @override
  String get registerHaveAccount => 'Už máte účet? ';

  @override
  String get registerPendingApproval =>
      'Žádost o váš účet čeká na schválení. Přihlásit se můžete, až ji administrátor schválí.';

  @override
  String get registerClosed =>
      'Registrace je momentálně uzavřena. K vytvoření účtu použijte registrační odkaz od administrátora.';

  @override
  String get passkeyNoCredentials =>
      'Pro tuto aplikaci nebyly nalezeny žádné passkey. Místo toho se přihlaste pomocí e-mailu a hesla.';

  @override
  String get passkeyDeviceNotSupported =>
      'Passkey nejsou na tomto zařízení podporovány.';

  @override
  String get passkeyDomainNotAssociated =>
      'Passkey nejsou pro tuto aplikaci nakonfigurovány. Místo toho se přihlaste pomocí e-mailu a hesla.';

  @override
  String get passkeyTimeout =>
      'Autentizace passkey vypršela. Zkuste to prosím znovu.';

  @override
  String get passkeyNotAvailable =>
      'Passkey nejsou pro tuto aplikaci k dispozici. Místo toho se přihlaste pomocí e-mailu a hesla.';

  @override
  String get passkeyFailed =>
      'Autentizace pomocí hesla selhala. Zkuste to prosím znovu.';

  @override
  String get errorUnableToCreateAccount =>
      'Účet se nepodařilo vytvořit. Zkuste to prosím znovu.';

  @override
  String get errorUnableToSignIn =>
      'Přihlášení právě teď není možné. Zkuste to prosím znovu.';

  @override
  String get errorServiceUnavailable =>
      'Tato instance je dočasně nedostupná. Zkuste to za chvíli znovu.';

  @override
  String get errorInvalidEmailOrPassword => 'Neplatný e-mail nebo heslo.';

  @override
  String get errorInvalidUsernameOrPassword =>
      'Neplatné uživatelské jméno nebo heslo.';

  @override
  String get errorUnableToSendResetLink =>
      'Odkaz pro obnovení hesla se nepodařilo odeslat. Zkuste to prosím znovu.';

  @override
  String get errorUnableToResetPassword =>
      'Heslo se nepodařilo obnovit. Zkuste to prosím znovu.';

  @override
  String get embedInviteJoin => 'Připojit se ke komunitě';

  @override
  String get embedInviteGoTo => 'Přejít do komunity';

  @override
  String embedInviteOnline(String count) {
    return '$count online';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count členů';
  }

  @override
  String get embedInviteUnknownTitle => 'Neznámá pozvánka';

  @override
  String get embedInviteUnknownSubtitle => 'Zkuste požádat o novou pozvánku.';

  @override
  String get embedInviteUnavailable => 'Pozvánka není k dispozici';

  @override
  String get embedInviteJoinGroup => 'Připojit se ke skupině';

  @override
  String get embedInviteAlreadyJoined => 'Již jste se připojili';

  @override
  String get embedInviteDisabled => 'Pozvánky zakázány';

  @override
  String get embedInvitePaused =>
      'Pozvánky pro tuto komunitu jsou pozastaveny.';

  @override
  String embedInvitePausedRaid(String productName) {
    return 'Aplikace $productName zjistila možný nájezd, takže se teď noví uživatelé nemohou připojit.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Tato komunita pozastavila pozvánky. Můžete to zkusit později.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return 'Aplikace $productName zjistila možný nájezd na tuto komunitu. Pozvánky jsou pozastaveny, takže se noví uživatelé momentálně nemohou připojit.';
  }

  @override
  String get inviteAcceptTitle => 'Byli jste pozváni k připojení';

  @override
  String get inviteAcceptJoinButton => 'Připojit se ke komunitě';

  @override
  String get inviteAcceptGoToButton => 'Přejít do komunity';

  @override
  String get inviteAcceptInvitesPaused => 'Pozvánky pozastaveny';

  @override
  String get inviteAcceptNotFoundTitle => 'Pozvání je neplatné';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Toto pozvání může být neplatné nebo vypršelo.';

  @override
  String get invalidDeepLinkTitle => 'Odkaz se nepodařilo otevřít';

  @override
  String get invalidDeepLinkDescription =>
      'Tento odkaz může být poškozený, dostupný pouze na webu, nebo k němu nemusíte mít přístup. Zkontrolujte odkaz a zkuste to znovu.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Přejít na domovskou stránku';

  @override
  String get inviteAcceptJoinGroupButton => 'Připojit se ke skupině';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Byli jste pozváni do skupinového DM od $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'někdo';

  @override
  String get inviteAcceptEmojiPack => 'Balíček emotikonů';

  @override
  String get inviteAcceptStickerPack => 'Balíček samolepek';

  @override
  String get inviteAcceptInstallEmojiPack => 'Nainstalovat balíček emotikonů';

  @override
  String get inviteAcceptInstallStickerPack => 'Nainstalovat balíček samolepek';

  @override
  String get inviteAcceptPackInstallNote =>
      'Přijetím tohoto pozvání se balíček automaticky nainstaluje.';

  @override
  String get mentionUnknownChannel => 'neznámý-kanál';

  @override
  String get channelAccessDeniedTitle => 'Přístup k tomuto kanálu odepřen';

  @override
  String get channelAccessDeniedDescription =>
      'Nemáte přístup ke kanálu, ve kterém byla tato zpráva odeslána.';

  @override
  String get messageJumpLinkNoAccess => 'Bez přístupu';

  @override
  String get okay => 'OK';

  @override
  String get embedThemeTitle => 'Sdílený motiv';

  @override
  String get embedThemeSubtitle => 'Tento klient nepodporuje vlastní témata.';

  @override
  String get embedThemeUnavailableButton => 'Témata nejsou k dispozici';

  @override
  String embedGiftVisionaryLifetime(String productName) {
    return 'Vizionář (celoživotní $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dní $productName',
      one: '1 den $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count týdnů $productName',
      one: '1 týden $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count měsíců $productName',
      one: '1 měsíc $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count let $productName',
      one: '1 rok $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'Od $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'Kliknutím si převezmete dárek!';

  @override
  String get embedGiftAlreadyRedeemed => 'Již uplatněno';

  @override
  String get embedGiftClaimAccountHelp =>
      'Pro uplatnění tohoto dárku dokončete registraci účtu.';

  @override
  String get embedGiftClaim => 'Převzít dárek';

  @override
  String get embedGiftClaimed => 'Dárek převzat';

  @override
  String get embedGiftClaimAccount => 'Pro uplatnění dokončete registraci účtu';

  @override
  String get embedGiftUnknownTitle => 'Neznámý dárek';

  @override
  String get embedGiftUnknownSubtitle =>
      'Tento dárkový kód je neplatný nebo ho již někdo převzal.';

  @override
  String get embedGiftUnavailable => 'Dárek není k dispozici';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Uplatněte svůj dárek a aktivujte si předplatné $productName!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'Tento dárek již někdo převzal.';

  @override
  String get giftAcceptMaybeLater => 'Možná později';

  @override
  String get giftRedeemedToast => 'Dárek uplatněn!';

  @override
  String get giftRedeemInvalidTitle => 'Neplatný dárkový kód';

  @override
  String get giftRedeemInvalidMessage =>
      'Tento kód je neplatný nebo již byl použit.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Dárek již byl uplatněn';

  @override
  String get giftRedeemAlreadyRedeemedMessage => 'Tento kód již byl uplatněn.';

  @override
  String get giftRedeemNotFoundTitle => 'Dárek nenalezen';

  @override
  String get giftRedeemNotFoundMessage => 'Tento kód neexistuje.';

  @override
  String get giftRedeemFailedTitle => 'Nepodařilo se uplatnit dárek';

  @override
  String get giftRedeemFailedMessage =>
      'Nepodařilo se uplatnit tento dárek. Zkuste to znovu.';

  @override
  String get giftVisionaryCannotRedeemTitle => 'Tento dárek nelze uplatnit';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Účty Visionary nemohou uplatnit dárky Plutonium. Zkopírujte odkaz a sdílejte ho s přítelem.';

  @override
  String get giftCopyLink => 'Kopírovat odkaz na dárek';

  @override
  String get privacySettings => 'Nastavení soukromí';

  @override
  String get privacyDirectMessages => 'Přímé zprávy';

  @override
  String get privacyDirectMessagesDescription =>
      'Povolit přímé zprávy od ostatních členů této komunity';

  @override
  String get privacyBotDirectMessages => 'Přímé zprávy od botů';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Povolit botům z této komunity, aby vám posílali přímé zprávy';

  @override
  String get privacyMutualDmsDisabled =>
      'Správci komunity zakázali přijímání přímých zpráv výhradně od vzájemných členů v této komunitě.';

  @override
  String get communityDebug => 'Ladění komunity';

  @override
  String get copiedToClipboard => 'Zkopírováno do schránky';

  @override
  String get notificationSettings => 'Nastavení oznámení';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Ztlumit komunitu $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Ztlumení komunity zabrání zobrazování indikátorů nepřečtených zpráv a oznámení, pokud nejste zmíněni.';

  @override
  String get notificationCommunitySettings => 'Nastavení oznámení komunity';

  @override
  String get notificationAllMessages => 'Všechny zprávy';

  @override
  String get notificationOnlyMentions => 'Pouze zmínky';

  @override
  String get notificationNothing => 'Nic';

  @override
  String get notificationSuppressEveryone => 'Potlačit @everyone a @here';

  @override
  String get notificationSuppressRoles => 'Potlačit všechna @zmínění rolí';

  @override
  String get notificationMobilePush => 'Push oznámení na mobilu';

  @override
  String get notificationOverrides => 'Vlastní nastavení oznámení';

  @override
  String get notificationSelectChannel => 'Vyberte kanál nebo kategorii';

  @override
  String get notificationOnlyAtMentions => 'Pouze @zmínění';

  @override
  String get notificationMuteChannel => 'Ztlumit kanál';

  @override
  String get notificationUnmuteChannel => 'Zrušit ztlumení kanálu';

  @override
  String get notificationUseCategoryDefault =>
      'Použít výchozí nastavení kategorie';

  @override
  String get notificationUseCommunityDefault =>
      'Použít výchozí nastavení komunity';

  @override
  String get notificationNoCategory => 'Bez kategorie';

  @override
  String get dmMarkAsRead => 'Označit jako přečtené';

  @override
  String get dmMuteConversation => 'Ztlumit soukromou konverzaci';

  @override
  String get dmUnmuteConversation => 'Zrušit ztlumení soukromé konverzace';

  @override
  String get dmPinDm => 'Připnout soukromou konverzaci';

  @override
  String get dmUnpinDm => 'Odepnout soukromou konverzaci';

  @override
  String get dmAlwaysShowInSidebar => 'Vždy zobrazit v postranním panelu';

  @override
  String get dmRemoveFromAlwaysShown => 'Odebrat z vždy zobrazených';

  @override
  String get dmCloseDm => 'Zavřít soukromou konverzaci';

  @override
  String get dmCloseDmConfirmTitle => 'Zavřít soukromou konverzaci';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Opravdu chcete zavřít váš DM s $username? Můžete ho kdykoli znovu otevřít.';
  }

  @override
  String get dmDeleteMyMessagesTitle => 'Smazat vaše zprávy v této konverzaci?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Tímto trvale smažete všechny zprávy, které jste kdy odeslali v této konverzaci. Tuto akci nelze vrátit zpět.';

  @override
  String get dmCopyChannelId => 'Kopírovat ID kanálu';

  @override
  String get dmChannelIdCopied => 'ID kanálu zkopírováno';

  @override
  String get dmCopyUserId => 'Kopírovat ID uživatele';

  @override
  String get dmUserIdCopied => 'ID uživatele zkopírováno';

  @override
  String get dmViewProfile => 'Zobrazit profil';

  @override
  String get dmVoiceCall => 'Zahájit hlasový hovor';

  @override
  String get incomingVoiceCallTitle => 'Příchozí hlasový hovor';

  @override
  String get incomingVoiceCallAccept => 'Přijmout';

  @override
  String get incomingVoiceCallDecline => 'Odmítnout';

  @override
  String get incomingVoiceCallLabel => 'Příchozí hovor';

  @override
  String get incomingVoiceCallIgnore => 'Ignorovat';

  @override
  String get directVoiceCallNotEligible =>
      'Tento hovor nelze právě zahájit. Zkuste to za chvíli znovu.';

  @override
  String get voiceJoinCallFailed =>
      'Nepodařilo se připojit k tomuto hovoru. Zkontrolujte své připojení a zkuste to znovu.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Nepodařilo se připojit k tomuto hovoru. Zkontrolujte své připojení a zkuste to znovu.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Nepodařilo se aktualizovat tento hovor na serveru. Zkontrolujte své připojení a zkuste to znovu.';

  @override
  String get dmAddNote => 'Přidat poznámku';

  @override
  String get dmEditGroup => 'Upravit skupinu';

  @override
  String get dmInviteToCommunity => 'Pozvat do komunity';

  @override
  String get dmBlock => 'Blokovat';

  @override
  String get dmLeaveGroup => 'Opustit skupinu';

  @override
  String get dmNoCommunitiesAvailable => 'Žádné dostupné komunity';

  @override
  String dmGroupMemberCount(int count) {
    return '$count členů';
  }

  @override
  String get dmMuteFor15Min => 'Na 15 minut';

  @override
  String get dmMuteFor30Min => 'Na 30 minut';

  @override
  String get dmMuteFor1Hour => 'Na 1 hodinu';

  @override
  String get dmMuteFor3Hours => 'Na 3 hodiny';

  @override
  String get dmMuteFor4Hours => 'Na 4 hodiny';

  @override
  String get dmMuteFor8Hours => 'Na 8 hodin';

  @override
  String get dmMuteFor24Hours => 'Na 24 hodin';

  @override
  String get dmMuteFor3Days => 'Na 3 dny';

  @override
  String get dmMuteForever => 'Dokud to znovu nezapnu';

  @override
  String get dmPinGroupDm => 'Připnout skupinovou konverzaci';

  @override
  String get dmUnpinGroupDm => 'Odepnout skupinovou konverzaci';

  @override
  String get dmUnnamedGroup => 'Nepojmenovaná skupina';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'Skupina uživatele $resolvedName';
  }

  @override
  String get dmFavoriteDm => 'Přidat soukromou konverzaci do oblíbených';

  @override
  String get dmUnfavoriteDm => 'Odebrat soukromou konverzaci z oblíbených';

  @override
  String get dmFavoriteGroupDm => 'Přidat skupinovou konverzaci do oblíbených';

  @override
  String get dmUnfavoriteGroupDm =>
      'Odebrat skupinovou konverzaci z oblíbených';

  @override
  String get dmChangeFriendNickname => 'Změnit přezdívku přítele';

  @override
  String get dmRemoveFriend => 'Odebrat z přátel';

  @override
  String get dmAddFriend => 'Přidat přítele';

  @override
  String get dmAcceptFriendRequest => 'Přijmout žádost o přátelství';

  @override
  String get dmIgnoreFriendRequest => 'Ignorovat žádost o přátelství';

  @override
  String get dmFriendRequestSent => 'Žádost o přátelství odeslána';

  @override
  String get dmUnblock => 'Odblokovat';

  @override
  String get dmDebugUser => 'Ladit uživatele';

  @override
  String get dmDebugChannel => 'Ladit kanál';

  @override
  String get dmDebugCategory => 'Ladit kategorii';

  @override
  String get dmPinned => 'Připnutá soukromá konverzace';

  @override
  String get dmUnpinned => 'Soukromá konverzace odepnuta';

  @override
  String get dmMuted => 'Ztlumená DM';

  @override
  String get dmUnmuted => 'Zrušit ztlumení DM';

  @override
  String get dmRemoveFriendConfirmTitle => 'Odebrat z přátel';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Opravdu chcete odebrat $username jako přítele?';
  }

  @override
  String get dmBlockConfirmTitle => 'Blokovat uživatele';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Opravdu chcete zablokovat $username? Nebude vám moci posílat zprávy ani žádosti o přátelství.';
  }

  @override
  String get dmFriendRequestSentToast => 'Žádost o přátelství odeslána';

  @override
  String get dmFriendRequestFailed => 'Odeslání žádosti o přátelství selhalo';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Přijetí žádosti o přátelství selhalo';

  @override
  String get dmRemoveFriendFailed => 'Odebrání přítele selhalo';

  @override
  String get dmBlockFailed => 'Blokování uživatele selhalo';

  @override
  String get dmUnblockFailed => 'Odblokování uživatele selhalo';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Ignorování žádosti o přátelství selhalo';

  @override
  String get dmAddFriends => 'Přidat přátele';

  @override
  String get addFriendSheetTitle => 'Přidat přítele';

  @override
  String get addFriendUsernameHint => 'Uživatelské jméno#0000';

  @override
  String get addFriendUsernameLabel => 'Uživatelské jméno přítele';

  @override
  String get addFriendSendRequest => 'Odeslat žádost';

  @override
  String get addFriendNoUserFound =>
      'Uživatel s tímto uživatelským jménem nebyl nalezen.';

  @override
  String get addFriendInvalidUsername =>
      'Zadejte platné uživatelské jméno (Uživatelské jméno#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Žádost o přátelství odeslána';

  @override
  String get addFriendClaimTitle => 'Dokončit registraci účtu';

  @override
  String get addFriendClaimDescription =>
      'Pro odesílání žádostí o přátelství dokončete registraci účtu.';

  @override
  String get addFriendVerifyTitle => 'Ověřte svůj e-mail';

  @override
  String get addFriendVerifyDescription =>
      'Než budete moct posílat žádosti o přátelství, musíte si ověřit svou e-mailovou adresu.';

  @override
  String get addFriendVerifyEmail => 'Ověřit e-mail';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Příchozí žádosti o přátelství ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Odchozí žádosti o přátelství ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Příchozí žádost o přátelství';

  @override
  String get addFriendOutgoingStatus => 'Žádost o přátelství odeslána';

  @override
  String get addFriendViewProfile => 'Zobrazit profil';

  @override
  String get addFriendAccept => 'Přijmout';

  @override
  String get addFriendIgnore => 'Ignorovat';

  @override
  String get addFriendAcceptTitle => 'Přijmout žádost o přátelství';

  @override
  String get addFriendIgnoreTitle => 'Ignorovat žádost o přátelství';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Přijmout žádost o přátelství od uživatele $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Ignorovat žádost o přátelství od uživatele $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Zrušit žádost';

  @override
  String get addFriendCancelRequestFailed =>
      'Nepodařilo se zrušit žádost o přátelství. Zkuste to znovu.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Tento uživatel momentálně nepřijímá žádosti o přátelství.';

  @override
  String get addFriendUnblockFirst =>
      'Nejprve tohoto uživatele odblokujte, abyste mu mohli poslat žádost o přátelství.';

  @override
  String get addFriendCannotSendToSelf =>
      'Nemůžete si poslat žádost o přátelství sami sobě.';

  @override
  String get addFriendAlreadyFriends => 'S tímto uživatelem už jste přátelé.';

  @override
  String get addFriendClaimToSend =>
      'Dokončete registraci a poté můžete posílat žádosti o přátelství.';

  @override
  String get addFriendVerifyToSend =>
      'Před odesláním žádostí o přátelství si ověřte svůj e-mail.';

  @override
  String get addFriendFriendsListFull =>
      'Váš seznam přátel nebo seznam druhého uživatele je plný. Někoho odeberte a zkuste to znovu.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Systém';

  @override
  String get emojiSearchPlaceholder => 'Najděte emoji svých snů';

  @override
  String get emojiSearchEmpty =>
      'Žádné emotikony neodpovídají vašemu vyhledávání';

  @override
  String get emojiAutocompleteDefaultLabel => 'Výchozí emoji';

  @override
  String emojiInfoDefaultDescription(String productName) {
    return 'Toto je výchozí emoji v aplikaci $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'Tato emotikona pochází z této komunity. Můžete ji použít kdekoli.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'Toto je vlastní emoji z komunity.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'Toto je vlastní emoji z komunity. Požádejte autora o pozvánku k použití tohoto emoji.';

  @override
  String get emojiInfoFromHeader => 'Tato emoji pochází z';

  @override
  String get emojiInfoDiscoverableCommunity => 'Komunita v Objevování';

  @override
  String get emojiInfoPrivateCommunity => 'Soukromé společenství';

  @override
  String get emojiInfoVerifiedCommunity => 'Ověřená komunita';

  @override
  String get emojiInfoAddToFavorites => 'Přidat k oblíbeným';

  @override
  String get emojiInfoRemoveFromFavorites => 'Odebrat z oblíbených';

  @override
  String get emojiFrequentlyUsed => 'Často používané';

  @override
  String get emojiTabGifs => 'GIFy';

  @override
  String get emojiTabMedia => 'Média';

  @override
  String get emojiTabStickers => 'Samolepky';

  @override
  String get emojiTabEmojis => 'Emoji';

  @override
  String get gifPickerSearch => 'Hledat GIFy';

  @override
  String get gifPickerSearchKlipy => 'Hledat KLIPY';

  @override
  String get gifPickerSearchTenor => 'Hledat Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Oblíbené';

  @override
  String get gifPickerFavoritesEmptyTitle => 'Zatím žádné oblíbené GIFy';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Připněte si GIF a uvidíte ho tady.';

  @override
  String get gifPickerTrending => 'Populární GIFy';

  @override
  String get gifPickerNoResultsTitle => 'Žádné výsledky vyhledávání';

  @override
  String get gifPickerNoResultsDescription => 'Zkuste jiný výraz';

  @override
  String get gifPickerLoadFailedTitle => 'Nepodařilo se načíst GIFy';

  @override
  String get gifPickerLoadFailedBody =>
      'Zkontrolujte připojení a zkuste to znovu.';

  @override
  String get emojiCategoryPeople => 'Lidé';

  @override
  String get emojiCategoryNature => 'Příroda';

  @override
  String get emojiCategoryFood => 'Jídlo a pití';

  @override
  String get emojiCategoryActivity => 'Aktivity';

  @override
  String get emojiCategoryTravel => 'Cestování a místa';

  @override
  String get emojiCategoryObjects => 'Předměty';

  @override
  String get emojiCategorySymbols => 'Symboly';

  @override
  String get emojiCategoryFlags => 'Vlajky';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Odemkněte $emojiCount z $communityCount s Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Získat Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Už nezobrazovat';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vlastních emodži',
      one: '1 vlastní emoji',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count komunity',
      one: '1 komunita',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Upozornění na externí odkaz';

  @override
  String externalLinkWarningLeaving(String productName) {
    return 'Chystáte se opustit aplikaci $productName';
  }

  @override
  String get externalLinkWarningDescription =>
      'Externí odkazy mohou být nebezpečné. Buďte prosím opatrní.';

  @override
  String get externalLinkWarningDestinationUrl => 'Cílová adresa URL:';

  @override
  String get externalLinksSectionTitle => 'Externí odkazy';

  @override
  String get externalLinksSectionDescription =>
      'Nastavte, jak se budou zpracovávat varování před externími odkazy.';

  @override
  String get externalLinkWarningTrustPrefix => 'Vždy důvěřovat ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — příště tento varovný hlásek přeskočit';

  @override
  String get externalLinkVisitSite => 'Navštívit web';

  @override
  String get externalLinkTrustAllLabel => 'Důvěřovat všem externím odkazům';

  @override
  String get externalLinkStripTrackingLabel =>
      'Odstranit parametry sledování z URL';

  @override
  String get externalLinkStripTrackingDescription =>
      'Automaticky odstranit parametry sledování (jako utm_source, fbclid, gclid) z URL v odesílaných zprávách. Odkaz se vyčistí dříve, než se dostane k někomu jinému.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Důvěřovat všem externím odkazům?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Tímto se budou důvěryhodně otevírat všechny externí odkazy a přeskočí se upozornění pro každou doménu. Vaše stávající důvěryhodné domény budou nahrazeny. Toto je méně bezpečné.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Důvěřovat všem';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Přestat důvěřovat všem odkazům?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Znovu se budou zobrazovat upozornění na externí odkazy. Důvěryhodné domény budete muset přidat jednotlivě.';

  @override
  String get externalLinkStopTrustingAllAction =>
      'Vypnout důvěru ke všem doménám';

  @override
  String get externalLinkTrustedAllDescription =>
      'Všechny externí odkazy jsou důvěryhodné. Upozornění se nebudou zobrazovat.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Máte $count důvěryhodnou doménu/domény. Přidejte další zaškrtnutím políčka při návštěvě externích odkazů.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Když je povoleno, nezobrazí se žádná varování před externími odkazy. Je to méně bezpečné.';

  @override
  String get imageFileTooLarge =>
      'Soubor obrázku je příliš velký. Vyberte soubor menší než 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Animované avatary vyžadují Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Animované bannery vyžadují Plutonium';

  @override
  String get animatedAvifNotSupported => 'Animovaný AVIF není podporován';

  @override
  String get animatedAvifNotSupportedBody =>
      'Ořezávání a otáčení animovaných souborů AVIF zatím není podporováno. Pokud budete pokračovat, nahraje se v původní podobě.';

  @override
  String get uploadAsIs => 'Nahrát tak, jak je';

  @override
  String get croppingAnimatedNotSupported =>
      'Ořezávání animovaných obrázků zatím není podporováno. Použije se původní nahrávka.';

  @override
  String get cropAvatar => 'Oříznout avatar';

  @override
  String get cropBanner => 'Oříznout banner';

  @override
  String get skip => 'Přeskočit';

  @override
  String get crop => 'Oříznout';

  @override
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => 'Změnit uživatelské jméno';

  @override
  String get fluxerTagInputLabel => 'Uživatelské jméno';

  @override
  String get fluxerTagDescriptionBase =>
      'Uživatelská jména mohou obsahovat pouze písmena (a-z, A-Z), číslice (0-9) a podtržítka. Na velikosti písmen nezáleží.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Uživatelská jména mohou obsahovat pouze písmena (a-z, A-Z), čísla (0-9) a podtržítka. Uživatelská jména nerozlišují malá a velká písmena. Můžete si vybrat jakýkoli dostupný 4místný tag od #0000 do #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Uživatelská jména mohou obsahovat pouze písmena (a-z, A-Z), čísla (0-9) a podtržítka. Uživatelská jména nerozlišují malá a velká písmena. Můžete si vybrat jakýkoli dostupný 4místný tag od #0001 do #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Mezi $min a $max znaky';
  }

  @override
  String get validationAllowedChars =>
      'Pouze písmena (a-z, A-Z), čísla (0-9) a podtržítka (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Získejte Plutonium pro úpravu svého tagu nebo si ho ponechte při změně uživatelského jména';

  @override
  String get fluxerTagAlreadyTaken => 'Uživatelské jméno je již obsazeno';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Uživatelské jméno $username#$discriminator je již obsazen. Pokračováním automaticky znovu vygenerujeme váš diskriminátor.';
  }

  @override
  String get customTagIsTemporary => 'Vlastní tag je dočasný';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Vaše vlastní 4místné označení je dostupné pouze po dobu trvání vašeho předplatného Plutonia. Když vaše předplatné vyprší $date, vaše označení se po 3denní lhůtě vrátí na náhodně přiřazené číslo.';
  }

  @override
  String get customTagTemporaryBody =>
      'Váš vlastní 4místný tag je k dispozici pouze po dobu aktivního předplatného Plutonium. Když vaše předplatné vyprší, váš tag se po 3denní lhůtě vrátí na náhodně přiřazené číslo.';

  @override
  String get iUnderstandContinue => 'Rozumím, pokračovat';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Pokud uložíte tento Uživatelské jméno, váš vlastní 4místný tag se po skončení předplatného Plutonium vrátí na náhodné číslo. Pokud se vaše předplatné neobnoví, budete mít 3denní lhůtu, než se tag změní.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Váš vlastní 4místný tag (#$discriminator) je aktivní po dobu aktivního předplatného Plutonium. Pokud vaše předplatné skončí nebo se po 3denní lhůtě neobnoví, váš tag se vrátí na náhodné číslo.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Upravte si svůj 4místný tag nebo si ho ponechte při změně uživatelského jména';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Vaše zkušební verze Plutonia vyprší $date. Vylepšete si ji a ponechte si vlastní značku a získejte odznak na svém profilu.';
  }

  @override
  String get premiumTrialActive =>
      'Jste ve zkušební verzi Plutonium. Upgradujte, abyste si ponechali vlastní tag a získali odznak na svém profilu.';

  @override
  String get fluxerTagUpdated => 'Uživatelské jméno aktualizováno';

  @override
  String get fluxerTagUpdateFailed =>
      'Nepodařilo se aktualizovat Uživatelské jméno. Zkuste to prosím znovu.';

  @override
  String get continueAction => 'Pokračovat';

  @override
  String get profileCustomizationTitle => 'Přizpůsobení profilu';

  @override
  String get profileCustomizationDescription =>
      'Upravte si vzhled profilu a podívejte se na živý náhled';

  @override
  String get usernameLabel => 'Uživatelské jméno';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Pro změnu uživatelského jména dokončete registraci účtu';

  @override
  String get changeFluxerTag => 'Změnit uživatelské jméno';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Přizpůsobte si svůj 4místný tag (#$discriminator) podle svého gusta s Plutoniem';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Změňte své uživatelské jméno a 4místný tag';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Váš vlastní tag (#$discriminator) je vázán na vaše předplatné Plutonia a po jeho vypršení bude vrácen na náhodný tag.';
  }

  @override
  String get displayNameLabel => 'Zobrazované jméno';

  @override
  String get pronounsLabel => 'Zájmena';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Změnit avatar';

  @override
  String get removeAvatar => 'Odebrat avatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Max 10 MB. Doporučeno: 512×512px';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get changeBanner => 'Změnit banner';

  @override
  String get removeBanner => 'Odebrat banner';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Max 10MB. Minimum: 680×240px (17:6)';

  @override
  String get accentColorLabel => 'Barva zvýraznění';

  @override
  String get accentColorDescription =>
      'Upravuje barvu okraje a banneru na vašem profilu';

  @override
  String get aboutMeLabel => 'O mně';

  @override
  String get aboutMeHelperText => 'Můžete použít odkazy, emoji a Markdown.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle => 'Soukromí odznaku Plutonia';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Ovládejte, jak se váš odznak Plutonia zobrazuje ostatním';

  @override
  String get hidePlutoniumBadgeLabel => 'Skrýt odznak Plutonia úplně';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Úplně skryjte svůj odznak Plutonia před ostatními uživateli';

  @override
  String get hidePlutoniumPurchaseDate => 'Skrýt datum nákupu Plutonia';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Skrýt datum nákupu Plutonia ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Odstraňte z odznaku datum prvního nákupu Plutonia';

  @override
  String get maskVisionaryAsSubscription =>
      'Maskovat Visionary jako předplatné';

  @override
  String get maskVisionaryDescription =>
      'Zobrazit Visionary jako běžné předplatné';

  @override
  String get hideVisionaryIdBadge => 'Skrýt odznak Visionary ID';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Skrýt odznak Visionary ID (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Odstranit odznak Visionary ID';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Jste na zkušební verzi Plutonia — vaše předplatné začíná $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Vaše předplatné se automaticky spustí po skončení zkušební verze. Není třeba nic dělat.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Jste na zkušební verzi Plutonia, která končí $date';
  }

  @override
  String get premiumTrialActiveProfile => 'Jste na zkušební verzi Plutonia';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Max 10 MB. Doporučeno: 512×512px. Animované avatary (GIF) vyžadují Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Přizpůsobte si svůj profil statickým nebo animovaným obrázkem banneru, aby vynikl.';

  @override
  String get getPlutonium => 'Získat Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Nákupy v aplikaci zatím nejsou na této platformě k dispozici. Zůstaňte naladěni — brzy to bude!';

  @override
  String get profilePreviewLabel => 'Náhled';

  @override
  String get profilePreviewMessage => 'Zpráva';

  @override
  String profilePreviewMemberSince(String productName) {
    return 'Členem $productName od';
  }

  @override
  String get unclaimedAccountTitle => 'Účet s nedokončenou registrací';

  @override
  String get unclaimedAccountDescription =>
      'Váš účet ještě není vyžádán. Bez e-mailu a hesla můžete ztratit přístup. Vyžádejte si svůj účet nyní a zabezpečte ho.';

  @override
  String get claimAccount => 'Dokončit registraci účtu';

  @override
  String get profileTypeLabel => 'Typ profilu';

  @override
  String get profileTypeGlobal => 'Globální profil';

  @override
  String get profileTypeGuildDescription =>
      'Upravujete svůj profil pro tuto komunitu. Bude viditelný pouze zde a bude mít přednost před vaším globálním profilem.';

  @override
  String get communityNicknameLabel => 'Přezdívka v komunitě';

  @override
  String get perGuildPremiumUpsellText =>
      'Přizpůsobení vašeho avatara, banneru, akcentové barvy a biografie pro jednotlivé komunity vyžaduje Plutonium. Přezdívka v komunitě a zájmena jsou zdarma pro všechny.';

  @override
  String get avatarModeInherit => 'Použít globální profil';

  @override
  String get avatarModeCustom => 'Použít vlastní obrázek';

  @override
  String get avatarModeUnset => 'Nezobrazovat';

  @override
  String get profileSavedToast => 'Profil aktualizován';

  @override
  String get profileEditButton => 'Upravit profil';

  @override
  String get profileNoteLabel => 'Poznámka';

  @override
  String get profileNoteVisibility => '(viditelné jen vám)';

  @override
  String get profileNoteEmpty => 'Zatím žádná poznámka.';

  @override
  String get sudoTitle => 'Ověřte svou identitu';

  @override
  String get sudoDescription => 'Tato akce vyžaduje ověření k pokračování.';

  @override
  String get sudoAuthenticatorCode => 'Kód z ověřovací aplikace';

  @override
  String get sudoMethodPassword => 'Heslo';

  @override
  String get sudoMethodTotp => 'Ověřovací aplikace';

  @override
  String get sudoVerificationFailed => 'Ověření selhalo. Zkuste to znovu.';

  @override
  String get securityAccountTitle => 'Účet';

  @override
  String get securityAccountDescription =>
      'Spravujte svůj e-mail, heslo a nastavení účtu';

  @override
  String get securitySectionTitle => 'Zabezpečení';

  @override
  String get securitySectionDescription =>
      'Chraňte svůj účet dvoufaktorovým ověřením a heslovými klíči';

  @override
  String get securityLoginEmailSectionTitle => 'Nastavení e-mailu';

  @override
  String securityLoginEmailSectionDescription(String productName) {
    return 'Spravujte e-mailovou adresu, kterou používáte k přihlášení do $productName';
  }

  @override
  String get securityLoginEmailAddressLabel => 'E-mailová adresa';

  @override
  String get securityLoginNoEmailSet => 'E-mailová adresa nenastavena';

  @override
  String get securityLoginChangeEmail => 'Změnit e-mail';

  @override
  String get securityLoginAddEmail => 'Přidat e-mail';

  @override
  String get securityLoginReveal => 'Zobrazit';

  @override
  String get securityLoginHide => 'Skrýt';

  @override
  String get securityLoginPasswordSectionTitle => 'Heslo';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Změňte své heslo, abyste svůj účet udrželi v bezpečí';

  @override
  String get securityLoginCurrentPasswordLabel => 'Aktuální heslo';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Poslední změna: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Poslední změna: Nikdy';

  @override
  String get securityLoginNoPasswordSet => 'Heslo nenastaveno';

  @override
  String get securityLoginChangePassword => 'Změnit heslo';

  @override
  String get securityLoginSetPassword => 'Nastavit heslo';

  @override
  String get passwordChangeTitle => 'Změnit heslo';

  @override
  String get passwordChangeIntroDescription =>
      'Před změnou hesla vám zašleme ověřovací kód na vaši e-mailovou adresu, abychom potvrdili vaši totožnost.';

  @override
  String get passwordChangeStart => 'Začít';

  @override
  String get passwordChangeVerifyTitle => 'Ověřte svůj e-mail';

  @override
  String get passwordChangeVerifyDescription =>
      'Zadejte ověřovací kód zaslaný na vaši e-mailovou adresu.';

  @override
  String get passwordChangeVerificationCode => 'Ověřovací kód';

  @override
  String get passwordChangeVerify => 'Ověřit';

  @override
  String get passwordChangeNewPasswordTitle => 'Nastavit nové heslo';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Zadejte své nové heslo níže.';

  @override
  String get passwordChangeNewPassword => 'Nové heslo';

  @override
  String get passwordChangeConfirmPassword => 'Potvrďte nové heslo';

  @override
  String get passwordChangeSubmit => 'Změnit heslo';

  @override
  String get passwordChangeSuccess => 'Heslo změněno';

  @override
  String get passwordChangePasswordsDoNotMatch => 'Hesla se neshodují';

  @override
  String get passwordChangeInvalidCode =>
      'Kód je neplatný nebo jeho platnost vypršela';

  @override
  String get emailChangeTitle => 'Změnit e-mail';

  @override
  String get emailChangeIntroDescription =>
      'Před změnou e-mailové adresy vám zašleme ověřovací kódy k ověření vaší identity.';

  @override
  String get emailChangeStart => 'Začít';

  @override
  String get emailChangeVerifyOriginalTitle => 'Ověřit aktuální e-mail';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Zadejte ověřovací kód zaslaný na vaši aktuální e-mailovou adresu.';

  @override
  String get emailChangeNewEmailTitle => 'Zadejte nový e-mail';

  @override
  String get emailChangeNewEmailDescription =>
      'Zadejte novou e-mailovou adresu, kterou chcete použít.';

  @override
  String get emailChangeNewEmailLabel => 'Nový e-mail';

  @override
  String get emailChangeNewEmailSubmit => 'Odeslat ověřovací kód';

  @override
  String get emailChangeVerifyNewTitle => 'Ověřit nový e-mail';

  @override
  String get emailChangeVerifyNewDescription =>
      'Zadejte ověřovací kód zaslaný na vaši novou e-mailovou adresu.';

  @override
  String get emailChangeSuccess => 'E-mail změněn';

  @override
  String get emailChangeInvalidCode =>
      'Kód je neplatný nebo jeho platnost vypršela';

  @override
  String get resend => 'Znovu odeslat';

  @override
  String resendCountdown(int seconds) {
    return 'Znovu odeslat (${seconds}s)';
  }

  @override
  String get verificationCode => 'Ověřovací kód';

  @override
  String get verify => 'Ověřit';

  @override
  String get enable => 'Zapnout';

  @override
  String get disable => 'Vypnout';

  @override
  String get delete => 'Smazat';

  @override
  String get save => 'Uložit';

  @override
  String get securityTfaSectionTitle => 'Dvoufaktorové ověřování';

  @override
  String get securityTfaSectionDescription =>
      'Přidejte ke svému účtu další vrstvu zabezpečení';

  @override
  String get securityTfaAuthenticatorApp => 'Aplikace pro ověřování';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Dvoufaktorové ověřování je zapnuté';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Používejte ověřovací aplikaci ke generování kódů pro dvoufaktorové ověřování';

  @override
  String get securityTfaBackupCodes => 'Záložní kódy';

  @override
  String get securityTfaBackupCodesDescription =>
      'Zobrazit a spravovat záložní kódy pro obnovení účtu';

  @override
  String get securityTfaViewCodes => 'Zobrazit kódy';

  @override
  String get securityPasskeysSectionTitle => 'Přístupové klíče';

  @override
  String get securityPasskeysSectionDescription =>
      'Používejte heslové klíče pro přihlašování bez hesla a dvoufaktorové ověřování';

  @override
  String get securityPasskeysRegistered => 'Registrované přístupové klíče';

  @override
  String get securityPasskeysNone => 'Žádné registrované heslové klíče';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'heslové klíče',
      one: 'heslový klíč',
    );
    return '$count $_temp0 registrovaných (max. 10)';
  }

  @override
  String get securityPasskeysAdd => 'Přidat přístupový klíč';

  @override
  String securityPasskeysAdded(String date) {
    return 'Přidáno: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Naposledy použito: $date';
  }

  @override
  String get securityPasskeysRename => 'Přejmenovat';

  @override
  String get securityPasskeysDeleteTitle => 'Smazat přístupový klíč';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Opravdu chcete smazat heslový klíč „$name“?';
  }

  @override
  String get securityPasskeyNameTitle => 'Pojmenovat přístupový klíč';

  @override
  String get securityPasskeyNameLabel => 'Název přístupového klíče';

  @override
  String get securityPasskeyNameHint =>
      'např. YubiKey, iPhone, pracovní počítač';

  @override
  String get securityPhoneSectionTitle => 'Telefonní číslo';

  @override
  String get securityPhoneSectionDescription =>
      'Spravujte své telefonní číslo.';

  @override
  String get securityPhoneLabel => 'Telefonní číslo';

  @override
  String get securityPhoneNone => 'Není přidáno žádné telefonní číslo.';

  @override
  String get securityPhoneAdd => 'Přidat telefonní číslo';

  @override
  String get securityPhoneRemove => 'Odebrat';

  @override
  String get securityPhoneRemoveTitle => 'Odebrat telefonní číslo';

  @override
  String get securityPhoneRemoveDescription =>
      'Opravdu chcete odebrat své telefonní číslo?';

  @override
  String get securityPhoneRemoved => 'Telefonní číslo odebráno';

  @override
  String get securityClaimTitle => 'Funkce zabezpečení';

  @override
  String get securityClaimDescription =>
      'Dokončete registraci účtu, abyste mohli používat funkce zabezpečení, jako je dvoufaktorové ověřování a přístupové klíče.';

  @override
  String get securityVerifyEmailRequired =>
      'Před nastavením dvoufaktorového ověřování, hesel nebo ověření přes SMS musíte ověřit svou e-mailovou adresu.';

  @override
  String get totpEnableTitle => 'Nastavit aplikaci pro ověřování';

  @override
  String get totpEnableDescription =>
      'Naskenujte QR kód pomocí své aplikace pro ověřování a vygenerujte kódy pro dvoufaktorové ověřování.';

  @override
  String get totpEnableCodeLabel => 'Kód';

  @override
  String get totpEnableCodeHint =>
      'Zadejte 6místný kód ze své aplikace pro ověřování';

  @override
  String get totpEnableSuccess => 'Dvoufaktorové ověřování bylo povoleno';

  @override
  String get totpDisableTitle => 'Odebrat ověřovací aplikaci';

  @override
  String get totpDisableDescription =>
      'Zadejte 6místný kód ze své aplikace pro ověřování pro deaktivaci dvoufaktorového ověřování.';

  @override
  String get totpDisableSuccess => 'Dvoufaktorové ověřování vypnuto';

  @override
  String get backupCodesTitle => 'Záložní kódy';

  @override
  String get backupCodesWarning =>
      'Pokud ztratíte přístup ke své aplikaci pro ověřování a nebudete mít tyto kódy, budete trvale zablokováni ze svého účtu. Stáhněte si je nebo si je zkopírujte a uložte je na bezpečné místo.';

  @override
  String get backupCodesDownload => 'Stáhnout';

  @override
  String get backupCodesCopy => 'Kopírovat';

  @override
  String get backupCodesCopied => 'Záložní kódy zkopírovány do schránky';

  @override
  String get backupCodesAcknowledge =>
      'Stáhl/a jsem si nebo zkopíroval/a záložní kódy a uložil/a je na bezpečné místo.';

  @override
  String get backupCodesDone => 'Hotovo';

  @override
  String get backupCodesViewTitle => 'Zobrazit záložní kódy';

  @override
  String get backupCodesViewDescription =>
      'Před zobrazením záložních kódů může být vyžadováno ověření.';

  @override
  String get phoneAddTitle => 'Přidat telefonní číslo';

  @override
  String get phoneAddLabel => 'Telefonní číslo';

  @override
  String get phoneAddHint => 'Zadejte své telefonní číslo';

  @override
  String get phoneAddFooter =>
      'Pošleme SMS kód, jakmile bude dostupný. Vaše číslo není propojeno s vaším účtem. Uchováváme pouze šifrovaný identifikátor bez ID uživatele, abychom umožnili maximálně 2 ověření přibližně za 30 dní.';

  @override
  String get phoneAddSendCode => 'Odeslat kód';

  @override
  String get phoneVerifyTitle => 'Ověřit telefonní číslo';

  @override
  String get phoneVerifyDescription =>
      'Zadejte ověřovací kód zaslaný na vaše telefonní číslo.';

  @override
  String get phoneAddSuccess => 'Telefonní číslo ověřeno';

  @override
  String get phoneCountryLabel => 'Země';

  @override
  String get phoneSearchCountries => 'Hledat země...';

  @override
  String get phoneNumberRequired => 'Je vyžadováno telefonní číslo';

  @override
  String get phoneEnterValidNumber =>
      'Zadejte platné číslo mobilního telefonu.';

  @override
  String get phoneCannotBeUsed =>
      'Toto telefonní číslo nelze použít. Zkuste jiné mobilní číslo nebo kontaktujte podporu.';

  @override
  String get phoneAlreadyUsed =>
      'Toto telefonní číslo již bylo použito. Zkuste jiné číslo nebo kontaktujte podporu.';

  @override
  String get phoneCodeDidNotWork =>
      'Tento kód nefungoval. Zkontrolujte ho a zkuste to znovu.';

  @override
  String get phoneTooManyAttempts =>
      'Příliš mnoho pokusů. Chvíli počkejte a zkuste to znovu.';

  @override
  String get phoneSmsUnavailable =>
      'Ověření SMS zprávou momentálně není k dispozici. Zkuste to prosím později, nebo kontaktujte podporu.';

  @override
  String get phoneNotEligible =>
      'Ověření telefonního čísla není pro tento účet k dispozici. Použijte jinou metodu nebo kontaktujte podporu.';

  @override
  String get phoneSomethingWentWrong => 'Něco se pokazilo. Zkuste to znovu.';

  @override
  String get phoneInboundExpensiveDescription =>
      'Odeslání SMS na toto telefonní číslo je příliš drahé, proto potřebujeme, abyste nám místo toho poslali SMS. Můžete také kontaktovat podporu a požádat o zrušení tohoto požadavku pro váš účet.';

  @override
  String get phoneInboundDefaultDescription =>
      'Potřebujeme, abyste nám poslali SMS pro ověření vašeho telefonního čísla.';

  @override
  String get phoneInboundStepOpenMessaging =>
      'Otevřete v telefonu aplikaci pro zprávy a vytvořte novou SMS.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'Odešli kód $code na číslo $number.';
  }

  @override
  String get phoneInboundStepWait =>
      'Počkejte, až obdržíme vaši zprávu. Může to chvíli trvat.';

  @override
  String get phoneInboundGetNewCode => 'Získat nový kód';

  @override
  String get phoneInboundChallengeCodeLabel => 'Kód k odeslání';

  @override
  String get phoneInboundOurNumberLabel => 'Odeslat na';

  @override
  String get requiredActionTitle => 'Je potřeba ověřit účet';

  @override
  String requiredActionIntroGeneric(String productName) {
    return 'Dokončete požadované ověření, abyste mohli nadále používat $productName.';
  }

  @override
  String get requiredActionIntroPhone =>
      'Než budete moct pokračovat, je potřeba provést dodatečnou kontrolu proti spamu.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return 'Ověřte svůj e-mail nebo telefon, abyste mohli nadále používat $productName.';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return 'Pro další používání aplikace $productName dokončete níže uvedené kroky ověření e-mailu a telefonu.';
  }

  @override
  String get requiredActionChooseMethodTitle => 'Vyberte metodu ověření';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return 'Pro další používání aplikace $productName dokončete jeden z níže uvedených způsobů ověření.';
  }

  @override
  String get requiredActionUseEmail => 'Použít e-mail';

  @override
  String get requiredActionUsePhone => 'Použít telefon';

  @override
  String get requiredActionCheckEmailTitle => 'Zkontrolujte svůj e-mail';

  @override
  String get requiredActionCheckEmailDescription =>
      'Odeslali jsme odkaz k ověření na vaši e-mailovou adresu. Otevřete ho pro pokračování.';

  @override
  String get requiredActionResendVerificationEmail =>
      'Znovu poslat ověřovací e-mail';

  @override
  String get requiredActionVerificationEmailSent =>
      'Ověřovací e-mail byl odeslán. Zkontrolujte si doručenou poštu.';

  @override
  String get requiredActionSignOut => 'Odhlásit se';

  @override
  String get dangerZoneSectionTitle => 'Nebezpečná zóna';

  @override
  String get dangerZoneSectionDescription => 'Nevratné a destruktivní akce';

  @override
  String get dangerZoneDisableTitle => 'Deaktivovat účet';

  @override
  String get dangerZoneDisableDescription =>
      'Dočasně deaktivovat účet. Později ho můžete znovu aktivovat přihlášením.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Deaktivace vašeho účtu vás odhlásí ze všech relací. Svůj účet můžete kdykoli znovu aktivovat přihlášením.';

  @override
  String get dangerZoneDeleteTitle => 'Smazat účet';

  @override
  String get dangerZoneDeleteDescription =>
      'Trvale smazat váš účet a všechna související data. Tuto akci nelze vrátit zpět.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Před smazáním účtu zrušte svou aktivní předplatné Plutonium v nastavení Plutonium.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'Účet nelze smazat';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Nemůžete smazat svůj účet, pokud vlastníte komunity. Nejprve převeďte vlastnictví těchto komunit:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'a ještě $count';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Chcete-li přenést vlastnictví, přejděte na $settingsPath a použijte možnost přenosu vlastnictví.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Opravdu chcete smazat svůj účet? Tato akce naplánuje trvalé smazání vašeho účtu.';

  @override
  String get dangerZoneDeleteBullet1 => 'Smazání účtu můžete zrušit do 14 dnů';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Po 14 dnech bude váš účet trvale smazán';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Po smazání už nebude možné obnovit přístup k vašemu účtu';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Po smazání účtu nebudete moci smazat své odeslané zprávy';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Pokud chcete nejprve exportovat svá data nebo smazat zprávy, navštivte prosím sekci Dashboard ochrany soukromí v Nastavení uživatele, než budete pokračovat.';

  @override
  String get claimAccountTitle => 'Dokončit registraci účtu';

  @override
  String get claimAccountDescription =>
      'Dokončete registraci účtu přidáním e-mailu a hesla. Před dokončením vám pošleme ověřovací kód pro potvrzení e-mailu.';

  @override
  String get claimAccountEmailLabel => 'E-mail';

  @override
  String get claimAccountPasswordLabel => 'Heslo';

  @override
  String get claimAccountSendCode => 'Odeslat kód';

  @override
  String get claimAccountVerifyDescription =>
      'Zadejte kód, který jsme vám poslali na e-mail, abyste ho ověřili. Heslo se nastaví po potvrzení kódu.';

  @override
  String get claimAccountSuccess => 'Registrace účtu byla úspěšně dokončena';

  @override
  String get importantInformation => 'Důležité informace:';

  @override
  String get genericError => 'Došlo k chybě';

  @override
  String get networkErrorMessage => 'Něco se pokazilo. Zkuste to znovu.';

  @override
  String get invalidCode => 'Neplatný kód';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'před # lety',
      one: 'před 1 rokem',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'před # měsíci',
      one: 'před 1 měsícem',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'před # dny',
      one: 'před 1 dnem',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'před # hodinami',
      one: 'před 1 hodinou',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'před # minutami',
      one: 'před 1 minutou',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'před # týdny',
      one: 'před týdnem',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'za $count minut',
      one: 'za 1 minutu',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'za $count hodin',
      one: 'za 1 hodinu',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'za $count dní',
      one: 'za 1 den',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'za $count týdnů',
      one: 'za 1 týden',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'za $count měsíců',
      one: 'za 1 měsíc',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'za $count let',
      one: 'za 1 rok',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'právě teď';

  @override
  String get authorizedAppsTitle => 'Autorizované aplikace';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Těmto aplikacím byl udělen přístup k vašemu účtu $productName.';
  }

  @override
  String get authorizedAppsEmptyTitle => 'Žádné autorizované aplikace';

  @override
  String get authorizedAppsEmptyDescription =>
      'Zatím jste neschválili žádné aplikace pro přístup k vašemu účtu.';

  @override
  String get authorizedAppsLoadError =>
      'Nepodařilo se načíst autorizované aplikace';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Autorizováno $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Udělená oprávnění';

  @override
  String get authorizedAppsRevoke => 'Zrušit';

  @override
  String get authorizedAppsRevokeTitle => 'Odebrat přístup k aplikaci';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Opravdu chcete odebrat přístup aplikaci $appName? Tato aplikace již nebude mít přístup k vašemu účtu.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Přístup k základním informacím o profilu (uživatelské jméno, avatar atd.)';

  @override
  String get authorizedAppsScopeEmail => 'Zobrazit e-mailovou adresu';

  @override
  String get authorizedAppsScopeGuilds =>
      'Zobrazit komunity, ve kterých jste členem';

  @override
  String get authorizedAppsScopeConnections => 'Zobrazit propojené účty';

  @override
  String get authorizedAppsScopeBot =>
      'Přidat bota do komunity s požadovanými oprávněními';

  @override
  String get authorizedAppsScopeAdmin =>
      'Přístup k administrativním koncovým bodům';

  @override
  String get applicationsTitle => 'Aplikace';

  @override
  String get applicationsCreate => 'Vytvořit aplikaci';

  @override
  String get applicationsCreateSubmit => 'Vytvořit';

  @override
  String get applicationsCreateClaimTooltip =>
      'Dokončete registraci účtu, abyste mohli vytvářet aplikace.';

  @override
  String applicationsDocsLink(String domain) {
    return 'Přečtěte si dokumentaci ($domain)';
  }

  @override
  String get applicationsLoadError => 'Nepodařilo se načíst aplikace';

  @override
  String get applicationsLoadErrorDescription =>
      'Zkontrolujte připojení a zkuste to znovu.';

  @override
  String get applicationsEmptyTitle => 'Zatím žádné aplikace';

  @override
  String applicationsEmptyDescription(String apiName) {
    return 'Vytvořte svou první aplikaci a začněte používat $apiName.';
  }

  @override
  String applicationsCreated(String date) {
    return 'Vytvořeno $date';
  }

  @override
  String get applicationsName => 'Název aplikace';

  @override
  String get applicationsNameHint => 'Moje aplikace';

  @override
  String get applicationsNameRequired => 'Je vyžadován název aplikace';

  @override
  String get applicationsBackToList => 'Zpět na seznam';

  @override
  String get applicationsDetailLoadError =>
      'Nepodařilo se načíst tuto aplikaci';

  @override
  String get applicationsDetailLoadErrorDescription =>
      'Zkusit znovu, nebo se vrátit na seznam aplikací.';

  @override
  String get applicationsId => 'ID aplikace';

  @override
  String get applicationsCopyId => 'Kopírovat ID';

  @override
  String get applicationsSecretsTitle => 'Tajné klíče a tokeny';

  @override
  String get applicationsSecretsDescription =>
      'Uchovávejte je v bezpečí. Opětovné vygenerování přeruší stávající integrace.';

  @override
  String get applicationsClientSecret => 'Tajný klíč klienta';

  @override
  String get applicationsBotToken => 'Token bota';

  @override
  String get applicationsRegenerate => 'Znovu vygenerovat';

  @override
  String get applicationsRegenerateClientSecretTitle =>
      'Znovu vygenerovat klientský tajný klíč?';

  @override
  String get applicationsRegenerateBotTokenTitle =>
      'Znovu vygenerovat token bota?';

  @override
  String get applicationsRegenerateClientSecretDescription =>
      'Opětovné vygenerování zneplatní aktuální tajný klíč. Aktualizujte veškerý kód, který používá starou hodnotu.';

  @override
  String get applicationsRegenerateBotTokenDescription =>
      'Opětovné vygenerování zneplatní aktuální token. Aktualizujte veškerý kód, který používá starou hodnotu.';

  @override
  String get applicationsClientSecretRegenerated =>
      'Klientský tajný klíč byl vygenerován znovu. Aktualizujte veškerý kód, který používá starý klíč.';

  @override
  String get applicationsBotTokenRegenerated =>
      'Token bota byl znovu vygenerován. Aktualizujte veškerý kód, který používá starý token.';

  @override
  String get applicationsRegenerateFailed =>
      'Nepodařilo se znovu vygenerovat tajný klíč';

  @override
  String get applicationsInfoTitle => 'Informace o aplikaci';

  @override
  String get applicationsInfoDescription =>
      'Základní nastavení a povolené URI pro přesměrování.';

  @override
  String get applicationsPublicBot => 'Veřejný bot';

  @override
  String get applicationsPublicBotDescription =>
      'Povolit komukoli pozvat tohoto bota do svých komunit.';

  @override
  String get applicationsRequireCodeGrant =>
      'Vyžadovat autorizační tok OAuth2 s kódem';

  @override
  String get applicationsRequireCodeGrantDescription =>
      'Při pozvání tohoto bota vyžaduje URI přesměrování a autorizační kód.';

  @override
  String get applicationsRedirectUris => 'URI pro přesměrování';

  @override
  String get applicationsAddRedirect => 'Přidat přesměrování';

  @override
  String get applicationsDeleteRedirect => 'Smazat URI přesměrování';

  @override
  String get applicationsBotProfileTitle => 'Profil bota';

  @override
  String get applicationsBotProfileDescription =>
      'Avatar, uživatelský tag a podrobné údaje profilu vašeho bota.';

  @override
  String get applicationsBotAvatar => 'Avatar bota';

  @override
  String get applicationsUsernameRequired => 'Uživatelské jméno je povinné';

  @override
  String get applicationsUsernameTooLong =>
      'Uživatelské jméno může mít maximálně 32 znaků';

  @override
  String get applicationsUsernameInvalid =>
      'Uživatelské jméno může obsahovat pouze písmena, čísla a podtržítka';

  @override
  String get applicationsBotUsername => 'Uživatelské jméno bota';

  @override
  String get applicationsDiscriminator => 'Čtyřmístný identifikátor';

  @override
  String get applicationsBotBio => 'Popis bota';

  @override
  String get applicationsBotBioHint => 'Užitečný bot, který umí úžasné věci!';

  @override
  String get applicationsNoBotBanner => 'Žádný banner bota';

  @override
  String get applicationsFriendlyBot => 'Přátelský bot';

  @override
  String get applicationsFriendlyBotDescription =>
      'Povolit uživatelům posílat tomuto botovi žádosti o přátelství k ručnímu schválení.';

  @override
  String get applicationsManualFriendApproval =>
      'Vyžadovat ruční schválení žádosti o přátelství';

  @override
  String get applicationsManualFriendApprovalDescription =>
      'Žádosti o přátelství odeslané tomuto botovi vyžadují ruční schválení.';

  @override
  String get applicationsOauthBuilderTitle => 'Nástroj pro tvorbu OAuth2 URL';

  @override
  String get applicationsOauthBuilderDescription =>
      'Sestavte autorizační URL s rozsahy a oprávněními.';

  @override
  String get applicationsScopes => 'Oprávnění';

  @override
  String get applicationsRedirectUri => 'URI pro přesměrování';

  @override
  String get applicationsSelectRedirectUri => 'Vyberte URI přesměrování';

  @override
  String get applicationsRedirectRequiredCodeGrant =>
      'URI pro přesměrování je povinné, protože tento bot vyžaduje autorizační tok OAuth2 s kódem.';

  @override
  String get applicationsRedirectRequiredScopes =>
      'URI pro přesměrování je povinné, pokud nepoužíváte pouze rozsah „bot“.';

  @override
  String get applicationsBotPermissions => 'Oprávnění bota';

  @override
  String get applicationsAuthorizeUrl => 'Autorizační URL';

  @override
  String get applicationsAuthorizeUrlPlaceholder =>
      'Vyberte oprávnění (a v případě potřeby URI pro přesměrování)';

  @override
  String get applicationsCopyAuthorizeUrl => 'Kopírovat autorizační URL';

  @override
  String get applicationsCopiedUrl => 'Adresa URL zkopírována do schránky';

  @override
  String get applicationsDangerTitle => 'Nebezpečná zóna';

  @override
  String get applicationsDangerSubtitle =>
      'Tuto akci nelze vrátit zpět. Odebráním aplikace se odstraní i její bot.';

  @override
  String get applicationsDangerHelper =>
      'Po smazání budou aplikace a její přihlašovací údaje trvale odstraněny.';

  @override
  String get applicationsDelete => 'Smazat aplikaci';

  @override
  String applicationsDeleteConfirmDescription(String name) {
    return 'Opravdu chcete smazat $name? Tuto akci nelze vrátit zpět. Všechna související data, včetně uživatele bota, budou trvale smazána.';
  }

  @override
  String get applicationsDeleteFailed => 'Aplikaci se nepodařilo smazat';

  @override
  String get applicationsUpdated => 'Aplikace byla úspěšně aktualizována';

  @override
  String get applicationsNoChanges => 'Žádné změny k uložení';

  @override
  String get applicationsSearchBots => 'Aplikace a boti';

  @override
  String get applicationsSearchBotsDescription =>
      'Vytvářejte a spravujte aplikace a boty pro svůj účet';

  @override
  String get applicationsSearchInfoDescription =>
      'Upravit základní údaje aplikace a URI pro přesměrování';

  @override
  String get applicationsSearchBotProfileDescription =>
      'Upravit avatar, uživatelský tag, popis, banner a přijímání žádostí o přátelství u bota';

  @override
  String get applicationsSearchOauthDescription =>
      'Vytvořit autorizační URL s rozsahy, přesměrováními a oprávněními bota';

  @override
  String get applicationsSearchSecretsDescription =>
      'Zobrazit a znovu vygenerovat klientské tajné klíče a tokeny bota';

  @override
  String get applicationsSearchBotsKeyword => 'Boti';

  @override
  String get applicationsSearchDocumentation => 'Dokumentace';

  @override
  String get privacyPendingDeletionTitle => 'Čeká na smazání';

  @override
  String get blockedUsersTitle => 'Blokovaní uživatelé';

  @override
  String get blockedUsersDescription =>
      'Zablokovaní uživatelé vám nemohou posílat žádosti o přátelství ani vám přímo psát zprávy.';

  @override
  String get blockedUsersEmptyTitle => 'Žádní blokovaní uživatelé';

  @override
  String get blockedUsersEmptyDescription => 'Ještě jste nikoho nezablokovali.';

  @override
  String get blockedUsersLoadError =>
      'Nepodařilo se načíst blokované uživatele';

  @override
  String get blockedUsersUnblock => 'Odblokovat';

  @override
  String get blockedUsersUnblockTitle => 'Odblokovat uživatele';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Opravdu chcete odblokovat uživatele $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Kopírovat uživatelské jméno';

  @override
  String get blockedUsersCopyId => 'Kopírovat ID uživatele';

  @override
  String get userProfileLoadError => 'Nepodařilo se načíst profil';

  @override
  String get userProfileLoading => 'Načítání profilu';

  @override
  String get userProfileRetry => 'Zkusit znovu';

  @override
  String get userProfileMessage => 'Zpráva';

  @override
  String get userProfileVoiceCall => 'Hlasový hovor';

  @override
  String get userProfileVideoCall => 'Videohovor';

  @override
  String get userProfileEditProfile => 'Upravit profil';

  @override
  String userProfileStaffBadgeTooltip(String productName) {
    return 'Tým $productName';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return 'Komunitní tým $productName';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return 'Partner $productName';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return 'Lovec chyb $productName';
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
    return 'Předplatitel $productName Plutonium od $date';
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
    return 'Vizionář $productName od $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'ID vizionáře #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Společní přátelé ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Společné komunity ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Společní přátelé';

  @override
  String get userProfileMutualCommunitiesTitle => 'Společné komunity';

  @override
  String get userProfileNoMutualFriends => 'Žádní společní přátelé nenalezeni.';

  @override
  String get userProfileNoMutualCommunities =>
      'Nebyly nalezeny žádné společné komunity.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Přezdívka: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Otevřít soukromou konverzaci';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Blokovali jste $username. Nebudete moci posílat zprávy, dokud je neodblokujete.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Odblokovat';

  @override
  String get userProfileOpenDm => 'Otevřít soukromou konverzaci';

  @override
  String get userProfileNoteTitle => 'Poznámka';

  @override
  String get userProfileNoteVisibility => '(viditelné jen vám)';

  @override
  String get userProfileNoteSave => 'Uložit';

  @override
  String get userProfileNoteDelete => 'Smazat';

  @override
  String get userProfileNoteEmpty => 'Kliknutím přidáte poznámku';

  @override
  String get userProfileMemberSince => 'Členem od';

  @override
  String get userProfileAboutMe => 'O mně';

  @override
  String get userProfileRoles => 'Role';

  @override
  String get memberRoleAdd => 'Přidat roli';

  @override
  String memberRoleRemove(String roleName) {
    return 'Odebrat roli $roleName';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'Tento uživatel nemá v této komunitě žádné role.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'Zatím žádné role. Přidejte role v $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'Žádné role nejsou k dispozici';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'V této komunitě momentálně nejsou žádné role k přiřazení, ale novou roli můžete vytvořit v $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Nastavení komunity';

  @override
  String get guildSettingsRolesTab => 'Role';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Místní čas';

  @override
  String get profileLocalTimeSettingsTitle => 'Místní čas v profilu';

  @override
  String profileLocalTimeSettingsSummary(String productName) {
    return 'Nastavte si časové pásmo jednou a $productName bude průběžně aktualizovat váš UTC posun při změnách letního času. Ostatní uživatelé uvidí pouze váš UTC posun, nikoli přesný identifikátor vašeho časového pásma.';
  }

  @override
  String get profileLocalTimeEditButton => 'Upravit místní čas profilu';

  @override
  String get profileLocalTimeTimezoneLabel => 'Časové pásmo';

  @override
  String profileLocalTimeTimezoneHelp(String productName) {
    return 'Vyberte časové pásmo, které aplikace $productName používá pro výpočet vašeho UTC posunu a zobrazení místního času v profilu.';
  }

  @override
  String get profileLocalTimeSearchTimezones => 'Hledat časová pásma';

  @override
  String get profileLocalTimeNotSet => 'Nenastaveno';

  @override
  String profileLocalTimePrivacyNote(
    String timezoneIdentifierExample,
    String productName,
  ) {
    return 'Ostatní uživatelé vidí pouze váš aktuální UTC posun, pokud se rozhodnete sdílet místní čas ve svém profilu. Neuvidí přesný identifikátor vašeho časového pásma, například $timezoneIdentifierExample. Aplikace $productName si tento identifikátor ukládá pouze proto, aby mohl posun automaticky aktualizovat při změnách letního času.';
  }

  @override
  String get profileLocalTimePrivacyEveryone => 'Všichni';

  @override
  String get profileLocalTimePrivacyEveryoneDesc =>
      'Povolit všem, kdo si mohou zobrazit váš celý profil, zobrazit také váš místní čas';

  @override
  String get profileLocalTimePrivacyFriends => 'Přátelé';

  @override
  String get profileLocalTimePrivacyFriendsDesc =>
      'Povolit přátelům, aby viděli váš místní čas v profilu';

  @override
  String get profileLocalTimePrivacyCommunityMembers => 'Členové komunity';

  @override
  String get profileLocalTimePrivacyCommunityMembersDesc =>
      'Povolit členům komunit, ve kterých jste, aby viděli místní čas ve vašem profilu';

  @override
  String get userProfileSameTimeAsYou => 'Má stejný čas jako vy';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return 'O $duration před vámi';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return 'O $duration za vámi';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours hodin',
      one: '1 hodina',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minut',
      one: '1 minuta',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours hodin',
      one: '1 hodina',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minut',
      one: '1 minuta',
    );
    return '$_temp0';
  }

  @override
  String get userProfileCopyUsername => 'Kopírovat uživatelské jméno';

  @override
  String get userProfileCopyUserId => 'Kopírovat ID uživatele';

  @override
  String get userProfileViewMainProfile => 'Zobrazit hlavní profil';

  @override
  String get userProfileViewCommunityProfile =>
      'Zobrazit profil pro tuto komunitu';

  @override
  String get userProfileBlockUser => 'Blokovat uživatele';

  @override
  String get userProfileUnblockUser => 'Odblokovat uživatele';

  @override
  String get userProfileRemoveFriend => 'Odebrat z přátel';

  @override
  String get userProfileBlockConfirmTitle => 'Blokovat uživatele';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Opravdu chcete zablokovat uživatele $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Odblokovat uživatele';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Opravdu chcete odblokovat uživatele $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Odebrat z přátel';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Opravdu chcete odstranit $username z přátel?';
  }

  @override
  String get userProfileFailedOpenDm => 'Nepodařilo se otevřít DM';

  @override
  String get userProfileFailedSaveNote => 'Nepodařilo se uložit poznámku';

  @override
  String get userProfileActionFailed =>
      'Akce se nezdařila, zkuste to prosím znovu';

  @override
  String get userProfileChangeNickname => 'Změnit přezdívku';

  @override
  String get userProfileKick => 'Vyhodit';

  @override
  String get userProfileBan => 'Zabanovat';

  @override
  String get userProfileTimeout => 'Dočasné omezení';

  @override
  String get userProfileRemoveTimeout => 'Zrušit dočasné omezení';

  @override
  String get userProfileTransferOwnership => 'Převést vlastnictví';

  @override
  String get userProfileReportMessage => 'Nahlásit zprávu';

  @override
  String get userProfileReportUserProfile => 'Nahlásit profil';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Vyloučit $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Opravdu chcete vyloučit $username? Může se znovu připojit s novým pozváním.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Odebrat dočasný zákaz?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Odebráním dočasného zákazu umožníte $username znovu posílat zprávy, reagovat a připojovat se k hlasovým kanálům.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Předat vlastnictví?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Předat vlastnictví této komunity uživateli $username? Toto je nevratné a ztratíte všechna vlastnická oprávnění.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Zablokovat $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Doba trvání banu';

  @override
  String get userProfileBanCustomSecondsLabel => 'Vlastní doba (sekundy)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Jakákoli hodnota od $min do $max sekund';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Smazat historii zpráv';

  @override
  String get userProfileBanDeleteNone => 'Žádné nemazat';

  @override
  String get userProfileBanDelete24h => 'Posledních 24 hodin';

  @override
  String get userProfileBanDelete7d => 'Posledních 7 dní';

  @override
  String get userProfileBanReasonLabel => 'Důvod (volitelné)';

  @override
  String get userProfileBanReasonHint => 'Zadejte důvod banu';

  @override
  String get userProfileBanSubmit => 'Zabanovat člena';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Dočasně omezit $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Délka dočasného omezení';

  @override
  String get userProfileTimeoutSubmit => 'Dočasně omezit člena';

  @override
  String get userProfileNicknameLabel => 'Přezdívka';

  @override
  String get userProfileNicknameHint => 'Zadejte přezdívku';

  @override
  String get userProfileNicknameSave => 'Uložit';

  @override
  String userProfileKickSuccess(String username) {
    return 'Uživatel $username byl vyloučen';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Uživatel $username byl zablokován';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Uživatel $username byl dočasně omezen';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Dočasné omezení pro $username bylo odebráno';
  }

  @override
  String get userProfileNicknameSuccess => 'Přezdívka aktualizována';

  @override
  String get userProfileTransferSuccess => 'Vlastnictví bylo převedeno';

  @override
  String get durationPermanent => 'Trvale';

  @override
  String get duration60Seconds => '60 sekund';

  @override
  String get duration5Minutes => '5 minut';

  @override
  String get duration10Minutes => '10 minut';

  @override
  String get duration1Hour => '1 hodina';

  @override
  String get duration12Hours => '12 hodin';

  @override
  String get duration1Day => '1 den';

  @override
  String get duration3Days => '3 dny';

  @override
  String get duration5Days => '5 dní';

  @override
  String get duration1Week => '1 týden';

  @override
  String get duration2Weeks => '2 týdny';

  @override
  String get duration1Month => '1 měsíc';

  @override
  String get durationCustom => 'Vlastní…';

  @override
  String typingIndicatorOne(String name) {
    return 'Uživatel $name píše...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return 'Uživatelé $name1 a $name2 píší...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return 'Uživatelé $name1, $name2 a $name3 píší...';
  }

  @override
  String get typingIndicatorMultiple => 'Několik lidí píše...';

  @override
  String get typingIndicatorHandful =>
      'Hrstka válečníků s klávesnicemi se shromažďuje...';

  @override
  String get typingIndicatorSymphony =>
      'Symphonie klapajících kláves je v plném proudu...';

  @override
  String get typingIndicatorFiesta =>
      'Tady je plnohodnotná fiesta psaní na klávesnici';

  @override
  String get typingIndicatorApocalypse => 'Páni, to je apokalypsa psaní';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Jsme rádi, že jste tady, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Vítejte, $username! Udělejte si pohodlí.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Vítejte, $username! Jsme rádi, že jste tady.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Vítejte, $username! Zapojte se, až budete připraveni.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Zdravíme, $username! Rádi vás tady vidíme!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Vítejte, $username! Doufáme, že se vám tady bude líbit.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Zdravíme, $username! Vítejte na palubě!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Jsme rádi, že jste dorazili, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Vítejte, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Vítejte, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Vítejte, $username! Jsme rádi, že jste tu.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Vítejte, $username! Doufáme, že se vám tu bude líbit.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Vítejte, $username! Váš další rozhovor začíná zde.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Vítejte, $username. Jsme rádi, že jste tu.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Rádi vás vidíme, $username! Vítejte.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Už jste tu, $username! Jsme rádi, že jste s námi.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Ahoj, $username! Pojďme na to.';
  }

  @override
  String get relativeTimeShortNow => 'teď';

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
      other: '$count měsíců',
      one: '1 měsíc',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count let',
      one: '1 rok',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'Moje zařízení';

  @override
  String get linkedDevicesDescription =>
      'Zobrazte všechna zařízení, která jsou aktuálně přihlášena k vašemu účtu. Zrušte platnost všech relací, které nepoznáváte.';

  @override
  String get linkedDevicesCurrentDevice => 'Toto zařízení';

  @override
  String get linkedDevicesOtherDevices => 'Další zařízení';

  @override
  String get linkedDevicesEnterSelection => 'Přejít do režimu výběru';

  @override
  String get linkedDevicesExitSelection => 'Ukončit režim výběru';

  @override
  String get linkedDevicesSelectAll => 'Vybrat vše';

  @override
  String get linkedDevicesClearSelection => 'Zrušit výběr';

  @override
  String get linkedDevicesRevokeTooltip => 'Zrušit přístup zařízení';

  @override
  String get linkedDevicesSignOutAll => 'Odhlásit všechna ostatní zařízení';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Odhlásit $count zařízení',
      one: 'Odhlásit 1 zařízení',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Odhlásit $count zařízení',
      one: 'Odhlásit 1 zařízení',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Odhlásit všechna ostatní zařízení';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Tímto se odhlásí vybraná zařízení z vašeho účtu. Na těchto zařízeních se budete muset znovu přihlásit.',
      one:
          'Tímto se odhlásí vybrané zařízení z vašeho účtu. Na tomto zařízení se budete muset znovu přihlásit.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Tímto se odhlásí vybraná zařízení z vašeho účtu. Na těchto zařízeních se budete muset znovu přihlásit.';

  @override
  String get linkedDevicesSignOutConfirm => 'Pokračovat';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Na všech odhlášených zařízeních se budete muset znovu přihlásit';

  @override
  String get linkedDevicesLoadErrorTitle => 'Chyba sítě';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Máme potíže s připojením k časoprostoru. Zkontrolujte své připojení a zkuste to znovu.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zařízení odebrána',
      one: 'Zařízení odebráno',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'Nepodařilo se odhlásit. Zkuste to znovu.';

  @override
  String get linkedDevicesUnknownOs => 'Neznámý OS';

  @override
  String get linkedDevicesUnknownPlatform => 'Neznámá platforma';

  @override
  String get linkedDevicesViewDetails => 'Zobrazit podrobnosti';

  @override
  String get linkedDevicesDetailsTitle => 'Podrobnosti o zařízení';

  @override
  String get linkedDevicesDetailsDevice => 'Zařízení';

  @override
  String get linkedDevicesDetailsClient => 'Klient';

  @override
  String get linkedDevicesDetailsLocation => 'Poloha';

  @override
  String get linkedDevicesDetailsIp => 'IP adresa';

  @override
  String get linkedDevicesDetailsLastUsed => 'Poslední použití';

  @override
  String get linkedDevicesCurrentSession => 'Aktuální relace';

  @override
  String get linkedDevicesUnknown => 'Neznámý';

  @override
  String slowmodeLabel(String duration) {
    return '$duration režim zpoždění';
  }

  @override
  String get slowmodeTooltipActive =>
      'Jste v režimu zpoždění. Pošlete další zprávu později.';

  @override
  String get slowmodeTooltipImmune =>
      'Režim zpoždění je zapnutý, ale vy jste imunní.';

  @override
  String get slowmodeStatusEnabled => 'Pomalý režim je zapnutý';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Pomalý režim aktivní ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'Pomalý režim je nastaven na $durationLabel, ale vy jste vyjmuti.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Pomalý režim je nastaven na $durationLabel. Před odesláním další zprávy počkejte.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Pomalý režim je v tomto kanálu nastaven na $durationLabel.';
  }

  @override
  String get channelNoSendPermissionHint =>
      'V tomto kanálu nemůžete odesílat zprávy.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Systémová oznámení od zaměstnanců $productName. Zde nelze odpovídat.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Zasílání zpráv je v této komunitě dočasně pozastaveno.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Máte dočasné omezení. Dokud nevyprší, nemůžete posílat zprávy, přidávat reakce ani používat hlasové kanály.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Abyste mohli v této komunitě posílat zprávy, musíte dokončit registraci svého účtu.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Abyste mohli v této komunitě posílat zprávy, musíte si ověřit e-mail.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Váš účet je příliš nový na odesílání zpráv v této komunitě.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'V této komunitě ještě nejste členem dostatečně dlouho, abyste mohli posílat zprávy.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Abyste mohli v této komunitě posílat zprávy, musíte si ověřit telefonní číslo.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Ověřit e-mail';

  @override
  String get channelComposerBarrierVerifyPhone => 'Ověřit telefon';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Příliš mnoho příloh (max $max)';
  }

  @override
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName přesahuje limit velikosti ($fileSize)';
  }

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Tyto soubory jsou příliš velké na odeslání společně';

  @override
  String get chatAttachmentDropToUpload => 'Pusťte soubory pro nahrání';

  @override
  String get chatAttachmentDropToSend => 'Pusťte soubory pro okamžité odeslání';

  @override
  String get chatAttachmentSendVoiceMessage => 'Odeslat hlasovou zprávu';

  @override
  String get voiceMessageTitle => 'Hlasová zpráva';

  @override
  String get voiceMessageHoldHint =>
      'Podržte pro nahrávání. Přetáhněte do koše pro smazání, posuňte nahoru pro uzamčení nebo pusťte pro odeslání.';

  @override
  String get voiceMessageDiscard => 'Zahodit hlasovou zprávu';

  @override
  String get voiceMessageSend => 'Odeslat hlasovou zprávu';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Nahrávání nelze spustit. Povolte přístup k mikrofonu.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Nahrávání hlasu není na tomto zařízení podporováno.';

  @override
  String get voiceMessageMicInUse =>
      'Opusťte hlasový hovor a nahrajte hlasovou zprávu.';

  @override
  String get voiceMessageRecordingFailed =>
      'Nahrávání se nezdařilo. Zkuste to znovu.';

  @override
  String get voiceMessageSendFailed =>
      'Nepodařilo se odeslat hlasovou zprávu. Zkuste to znovu.';

  @override
  String get voiceMessageRecordingHint =>
      'Mluvte. Až budete hotovi, stiskněte Zastavit – nahrávku pak můžete oříznout.';

  @override
  String get voiceMessageReviewHint =>
      'Přetažením úchytů zprávu ořízněte a poté stiskněte Odeslat.';

  @override
  String get voiceMessageStop => 'Zastavit';

  @override
  String get voiceMessageStartRecording => 'Spustit nahrávání';

  @override
  String get voiceMessageRerecord => 'Nahrát znovu';

  @override
  String get voiceMessagePlay => 'Přehrát';

  @override
  String get voiceMessagePause => 'Pozastavit';

  @override
  String get voiceMessageSeekForward => 'Posunout vpřed';

  @override
  String get voiceMessageSeekBackward => 'Přehrát zpět';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Výběr musí trvat alespoň $secondsString s.';
  }

  @override
  String get chatAttachmentEditTitle => 'Upravit přílohu';

  @override
  String get chatAttachmentFilenameLabel => 'Název souboru';

  @override
  String get chatAttachmentDescriptionLabel => 'Popis';

  @override
  String get chatAttachmentDescriptionHint => 'Volitelný alternativní text';

  @override
  String get chatAttachmentSpoilerLabel => 'Označit jako spoiler';

  @override
  String get chatAttachmentRemove => 'Odebrat přílohu';

  @override
  String get chatAttachmentDownload => 'Stáhnout';

  @override
  String get chatAttachmentDownloadedToast => 'Uloženo do fotek';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Nepodařilo se stáhnout přílohu';

  @override
  String get chatAttachmentExpiredTooltip => 'Platnost přílohy vypršela';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Rozbalit ($count řádků)',
      one: 'Rozbalit ($count řádek)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Skrýt ($count řádků)',
      one: 'Skrýt ($count řádek)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zobrazit ($count řádků)',
      one: 'Zobrazit ($count řádek)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Skrýt ($count řádků)',
      one: 'Skrýt ($count řádek)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count řádků zbývá)',
      one: '... ($count řádek zbývá)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... (zbývá $count řádků)',
      many: '... (zbývá $count řádků)',
      few: '... (zbývají $count řádky)',
      one: '... (zbývá $count řádek)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'Zobrazit celý soubor';

  @override
  String get chatTextualPreviewChangeLanguage => 'Změnit jazyk';

  @override
  String get chatTextualPreviewSearchLanguage => 'Hledat jazyk…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Zvýraznění syntaxe';

  @override
  String get chatTextualPreviewNoLanguagesFound =>
      'Nebyly nalezeny žádné výsledky';

  @override
  String get chatTextualPreviewMoreOptions => 'Další možnosti';

  @override
  String get chatTextualPreviewWrapText => 'Zalamovat text';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'Soubor je příliš velký pro náhled (limit $previewLimitKb KB).';
  }

  @override
  String get chatTextualPreviewLoadError => 'Náhled nelze načíst.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Prostý text';

  @override
  String get chatTextualPreviewCopy => 'Kopírovat';

  @override
  String get chatAttachmentSourceGallery => 'Galerie';

  @override
  String get chatAttachmentSourceCamera => 'Kamera';

  @override
  String get chatAttachmentSourceBrowse => 'Procházet soubory';

  @override
  String get chatAttachmentPasteTooltip => 'Vložit soubor ze schránky';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Zobrazit spoiler';

  @override
  String get matureMediaRevealButton => 'Zobrazit';

  @override
  String get matureMediaRevealHint => 'Kliknutím odhalíte';

  @override
  String get matureContentTitle => 'Obsah pro dospělé';

  @override
  String get matureCommunityTitle => 'Komunita pro dospělé';

  @override
  String get matureCategoryTitle => 'Kategorie pro dospělé';

  @override
  String get matureChannelTitle => 'Kanál pro dospělé';

  @override
  String get communityContentWarningTitle => 'Upozornění na obsah komunity';

  @override
  String get categoryContentWarningTitle => 'Upozornění na obsah kategorie';

  @override
  String get channelContentWarningTitle => 'Upozornění na obsah kanálu';

  @override
  String get defaultContentWarningBody => 'Obsahuje citlivý obsah.';

  @override
  String get matureCommunityBody =>
      'Tato komunita je označena jako komunita pro dospělé a může obsahovat materiál, který nemusí být vhodný pro některé uživatele.';

  @override
  String get matureCategoryBody =>
      'Tato kategorie je označena jako obsah pro dospělé a může obsahovat materiál, který je pro některé uživatele nevhodný.';

  @override
  String get matureChannelBody =>
      'Tento kanál je označen jako kanál pro dospělé a může obsahovat materiál, který nemusí být vhodný pro některé uživatele.';

  @override
  String get matureVoiceChannelBody =>
      'Tento hlasový kanál je označen jako kanál pro dospělé a může obsahovat materiál, který nemusí být vhodný pro některé uživatele.';

  @override
  String get matureLinkChannelBody =>
      'Tento kanál s odkazem je označen jako kanál pro dospělé a může otevřít materiál, který nemusí být vhodný pro některé uživatele.';

  @override
  String get matureCommunityUnavailableBody =>
      'Tato komunita pro dospělé není pro váš účet dostupná.';

  @override
  String get matureCategoryUnavailableBody =>
      'Tato kategorie pro dospělé není pro váš účet dostupná.';

  @override
  String get matureChannelUnavailableBody =>
      'Tento kanál s obsahem pro dospělé není pro váš účet dostupný.';

  @override
  String get matureContentProceedButton => 'Pokračovat';

  @override
  String get matureContentUnderstandButton => 'Rozumím';

  @override
  String get matureContentOpenLinkButton => 'Otevřít odkaz';

  @override
  String get sensitiveContentSectionTitle => 'Citlivý obsah';

  @override
  String get sensitiveContentSectionDescription =>
      'Ovládejte, jak je nevhodný nebo citlivý obsah filtrován v různých kontextech.';

  @override
  String get sensitiveContentFriendDmLabel => 'Přímé zprávy od přátel';

  @override
  String get sensitiveContentNonFriendDmLabel => 'Přímé zprávy od ostatních';

  @override
  String get sensitiveContentGuildLabel => 'Zprávy v komunitních kanálech';

  @override
  String get sensitiveContentFilterShow => 'Zobrazit';

  @override
  String get sensitiveContentFilterBlur => 'Rozmazat';

  @override
  String get sensitiveContentFilterBlock => 'Blokovat';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Rozmazat média do dokončení kontroly bezpečnosti';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Pokud je povoleno, obrázky a videa se rozmažou, dokud se nedokončí kontrola bezpečnosti obsahu.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Toto nastavení je pro váš účet vždy zapnuté.';

  @override
  String get sensitiveContentResetButton => 'Resetovat';

  @override
  String get sensitiveContentSaveButton => 'Uložit';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count souborů',
      one: '1 souboru',
    );
    return 'Nahrávání $_temp0';
  }

  @override
  String get chatCancelUpload => 'Zrušit nahrávání';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Platí do $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Platnost vyprší mezi $start a $end';
  }

  @override
  String get connectionsTitle => 'Propojení';

  @override
  String connectionsDescription(String productName) {
    return 'Propojte externí účty a domény s vaším profilem $productName. Ověřená propojení se zobrazí ve vašem profilu.';
  }

  @override
  String get connectionsEmptyTitle => 'Zatím žádná propojení';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Propojte svůj účet Bluesky nebo ověřte vlastnictví domény a zobrazte je ve svém profilu.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Ověřte vlastnictví domény a zobrazte ji ve svém profilu.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Doména';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Přidat propojení Bluesky';

  @override
  String get connectionsAddDomainAriaLabel => 'Přidat propojení domény';

  @override
  String get connectionEdit => 'Upravit';

  @override
  String get connectionRemove => 'Odebrat';

  @override
  String get connectionVerifiedLabel => 'Toto propojení bylo ověřeno.';

  @override
  String get connectionUnverifiedLabel => 'Toto propojení nebylo ověřeno.';

  @override
  String get connectionAddTitle => 'Přidat propojení';

  @override
  String get connectionTypeLabel => 'Typ propojení';

  @override
  String get connectionHandleLabel => 'Uživatelské jméno';

  @override
  String get connectionDomainLabel => 'Doména';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Toto propojení už máte.';

  @override
  String get connectionConnectBluesky => 'Připojit přes Bluesky';

  @override
  String get connectionContinue => 'Pokračovat';

  @override
  String get connectionVerifyTitle => 'Ověřit propojení';

  @override
  String get connectionVerifyInstructions =>
      'Pomocí níže uvedeného záznamu prokažte vlastnictví domény.';

  @override
  String get connectionDnsRecordTitle => 'Záznam DNS TXT';

  @override
  String get connectionDnsHostLabel => 'Hostitel';

  @override
  String get connectionDnsValueLabel => 'Hodnota';

  @override
  String get connectionCopyHost => 'Kopírovat adresu hostitele';

  @override
  String get connectionCopyValue => 'Kopírovat hodnotu';

  @override
  String get connectionCopied => 'Zkopírováno!';

  @override
  String get connectionTokenFileTitle => 'Poskytnout soubor tokenu';

  @override
  String get connectionTokenFileDescription =>
      'Stáhněte si **fluxer-verification** a umístěte jej do složky **.well-known**, abychom mohli ověřit doménu.';

  @override
  String get connectionTokenFileDownload => 'Stáhnout fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Soubor obsahuje ověřovací token, který načteme z **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Uložit fluxer-verification';

  @override
  String get connectionVerifyButton => 'Ověřit';

  @override
  String get connectionBack => 'Zpět';

  @override
  String get connectionEditTitle => 'Upravit propojení';

  @override
  String get connectionEditDescription =>
      'Vyberte, kdo uvidí toto propojení na vašem profilu.';

  @override
  String get connectionVisibilityEveryone => 'Všichni';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Povolit komukoli zobrazit toto propojení na vašem profilu';

  @override
  String get connectionVisibilityFriends => 'Přátelé';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Povolit přátelům zobrazit toto propojení';

  @override
  String get connectionVisibilityCommunityMembers => 'Členové komunity';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Povolit členům komunit, ve kterých jste, zobrazit toto propojení';

  @override
  String get connectionRemoveTitle => 'Odstranit propojení';

  @override
  String get connectionRemoveDescription =>
      'Opravdu chcete toto spojení odebrat? Tuto akci nelze vrátit zpět.';

  @override
  String get connectionRemoveConfirm => 'Odebrat';

  @override
  String get connectionsLoadError => 'Nepodařilo se načíst spojení';

  @override
  String get connectionsReorderError => 'Nepodařilo se aktualizovat pořadí';

  @override
  String get connectionInitiateFailed =>
      'Nepodařilo se zahájit ověření. Zkuste to znovu.';

  @override
  String get connectionVerifyFailed =>
      'Nepodařilo se ověřit. Zkontrolujte svůj záznam DNS a zkuste to znovu.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Nepodařilo se zahájit autorizaci Bluesky.';

  @override
  String get connectionUpdateFailed => 'Nepodařilo se aktualizovat spojení';

  @override
  String get connectionRemoveFailed => 'Nepodařilo se odebrat spojení';

  @override
  String get connectionTokenSavedToast => 'Soubor fluxer-verification uložen';

  @override
  String get connectionTokenSaveFailedToast => 'Nepodařilo se uložit soubor';

  @override
  String get connectionEnterHandle => 'Zadejte handle pro Bluesky.';

  @override
  String get connectionEnterDomain => 'Zadejte doménu.';

  @override
  String get lookAndFeelTitle => 'Vzhled a chování';

  @override
  String get lookAndFeelThemeSectionTitle => 'Motiv';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Vyberte si mezi tmavým, uhlovým nebo světlým vzhledem.';

  @override
  String get lookAndFeelHdrSectionTitle => 'Vysoký dynamický rozsah';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Určete, jak se budou HDR obrázky zobrazovat na monitorech s podporou HDR.';

  @override
  String get lookAndFeelHdrFullName => 'Plný dynamický rozsah';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Zobrazovat HDR snímky s plným jasem a rozsahem barev.';

  @override
  String get lookAndFeelHdrStandardName => 'Standardní rozsah';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Převést HDR snímky do standardního rozsahu, čímž se sníží maximální jas.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'Režim zobrazení s vysokým dynamickým rozsahem';

  @override
  String get lookAndFeelThemeDark => 'Tmavý motiv';

  @override
  String get lookAndFeelThemeDarkLegacy => 'Tmavý (starší) motiv';

  @override
  String get lookAndFeelThemeCoal => 'Uhelný motiv';

  @override
  String get lookAndFeelThemeLight => 'Světlý motiv';

  @override
  String get lookAndFeelThemeSystem => 'Systémový motiv';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Synchronizovat motiv napříč zařízeními';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Když je povoleno, změny motivu se synchronizují na všechna vaše zařízení. Když je zakázáno, toto zařízení použije vlastní nastavení motivu.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Motiv systému automaticky zakáže synchronizaci, aby sledoval preference vašeho systému na tomto zařízení.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Motiv se nepodařilo synchronizovat s vaším účtem. Zkuste to prosím znovu.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Měřítko písma chatu';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Upravte velikost písma v chatu.';

  @override
  String get lookAndFeelChatFontSizeLabel => 'Velikost písma chatu';

  @override
  String get lookAndFeelAppZoomTitle => 'Úroveň přiblížení aplikace';

  @override
  String get lookAndFeelAppZoomDescription =>
      'Upravit úroveň přiblížení aplikace.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'Tapeta chatu';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'Vyberte pozadí pro chat. Toto zůstane na tomto zařízení.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'Toto nastavení zůstane na tomto zařízení';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'Tapeta chatu je uložena pouze na tomto zařízení a nesynchronizuje se s ostatními zařízeními.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'Výchozí';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'Vlastní obrázek';

  @override
  String get lookAndFeelChatWallpaperStarfieldLabel => 'Hvězdné pole';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Barva $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Gradient $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'Ztlumit tapetu';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'Nepodařilo se nastavit tento obrázek jako tapetu.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Zprávy';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Vyberte, jak se budou zprávy zobrazovat v chatech.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Mezera mezi skupinami zpráv';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '$spacing px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => 'Režim zobrazení zpráv';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Pohodlné';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Prostorné rozvržení s jasným vizuálním oddělením mezi zprávami.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Zhuštěné';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Zobrazuje co nejvíce zpráv s minimálními mezerami.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'Skrýt avatary uživatelů';

  @override
  String get lookAndFeelInterfaceTitle => 'Rozhraní';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Přizpůsobit prvky a chování rozhraní.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Indikátory psaní v seznamu kanálů';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Vyberte, jak se indikátory psaní zobrazují v seznamu kanálů, když někdo píše v kanálu.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Indikátor psaní + avatary';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Zobrazit indikátor psaní s avatary uživatelů v seznamu kanálů';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Pouze indikátor psaní';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Zobrazit jen indikátor psaní bez avatarů';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Skryté';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Nezobrazovat indikátory psaní v seznamu kanálů';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Zobrazit psaní v aktivním kanálu';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Když je zakázáno (výchozí), indikátory psaní se nezobrazí v kanálu, který právě prohlížíte.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'obecný';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Nápověda klávesnice';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Ovládejte, zda se nápovědy klávesových zkratek zobrazují v popiscích.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Skrýt nápovědy ke klávesnici v popiscích';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Když je povoleno, odznaky zkratek jsou skryty v kontextových oknech.';

  @override
  String get lookAndFeelNekoTitle => 'Různé';

  @override
  String get lookAndFeelNekoDescription => 'Různé možnosti rozhraní.';

  @override
  String get lookAndFeelShowNekoLabel => 'Zobrazit Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Když je povoleno, Neko se zobrazí poblíž vstupního pole chatu.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Chování při připojení k hlasovému kanálu';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Ovládejte, jak se připojujete k hlasovým kanálům v komunitách.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Vyžadovat dvojklik pro připojení k hlasovým kanálům';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Když je povoleno, budete muset dvakrát kliknout na hlasové kanály, abyste se k nim připojili. Když je zakázáno (výchozí), jedním kliknutím se okamžitě připojíte ke kanálu.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Rychlá hnědá liška skáče přes líného psa.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Postranní panel komunity';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Konfigurujte, jak postranní panel komunity zobrazuje přímé zprávy.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count komunit je dočasně nedostupných kvůli poruše časového kondenzátoru.',
      one:
          '1 komunita je dočasně nedostupná kvůli poruše časového kondenzátoru.',
    );
    return '$_temp0';
  }

  @override
  String get communityTemporarilyUnavailable =>
      'Komunita je dočasně nedostupná';

  @override
  String get guildUnavailableDescription =>
      'Něco se pokazilo. Pracujeme na tom.';

  @override
  String get guildNotFoundTitle => 'Tohle není komunita, kterou hledáte.';

  @override
  String get guildNotFoundDescription =>
      'Komunita, kterou hledáte, mohla být smazána nebo k ní nemáte přístup.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return 'Komunita „$communityName“ je nyní přístupná pouze zaměstnancům $productName';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => 'dočasně nedostupné';

  @override
  String get lookAndFeelCollapseDMsLabel => 'Sbalit DM do složky';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'Když je povoleno, nepřečtené DM v postranním panelu komunity jsou sbaleny do složky na tlačítku $productName. Kliknutím na tlačítko $productName na stránce DM složku rozbalíte nebo sbalíte.';
  }

  @override
  String get lookAndFeelChannelListSectionTitle => 'Seznam kanálů';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Nastavte chování indikátoru nepřečtených zpráv pro ztlumené kanály v seznamech kanálů.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Zobrazit indikátor nepřečtených zpráv u ztlumených kanálů';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Když je povoleno, ztlumené kanály zobrazují slabý indikátor nepřečtených zpráv na levé straně. Zmínky se stále zobrazují bez ohledu na toto nastavení.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Právě aktivní';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Ovládejte, jak se funkce Právě aktivní zobrazuje v celé aplikaci.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Zobrazit sekci Právě aktivní na domovské obrazovce';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Zobrazit „Právě aktivní“ na domovské obrazovce, abyste viděli přátele aktivní v hlasovém chatu. Uvidíte náhled, kontext kanálu, kdo už tam je, a rychlý způsob, jak se připojit.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Oblíbené';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Ovládejte viditelnost oblíbených položek v celé aplikaci.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Zapnout oblíbené';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Když je tato funkce povolena, můžete označit kanály jako oblíbené a zobrazí se v sekci Oblíbené. Když je zakázána, skryjí se všechny prvky uživatelského rozhraní související s oblíbenými (tlačítka, položky nabídky). Vaše stávající oblíbené položky budou zachovány.';

  @override
  String get favoritesTitle => 'Oblíbené';

  @override
  String get favoritesEmptyTitle => 'Zatím žádné oblíbené položky';

  @override
  String get favoritesEmptyDescription =>
      'Označte kanály hvězdičkou v záhlaví chatu, abyste je měli zde.';

  @override
  String get favoritesWelcomeTitle => 'Vítejte v oblíbených';

  @override
  String get favoritesWelcomeDescription =>
      'Váš osobní prostor pro rychlý přístup k oblíbeným kanálům, soukromým i skupinovým konverzacím. Kliknutím na hvězdičku u libovolného kanálu ho sem přidáte.';

  @override
  String get favoritesWelcomeTip => 'Nelíbí se vám? Kdykoli to můžete vypnout.';

  @override
  String get favoritesDisableButton => 'Vypnout oblíbené';

  @override
  String get favoritesAddedToast => 'Přidáno k oblíbeným';

  @override
  String get favoritesRemovedToast => 'Odebráno z oblíbených';

  @override
  String get favoritesHiddenToast => 'Oblíbené skryty';

  @override
  String get favoritesMute => 'Ztlumit oblíbené';

  @override
  String get favoritesUnmute => 'Zrušit ztlumení oblíbených';

  @override
  String get favoritesHeaderMenu => 'Nabídka Oblíbených';

  @override
  String get favoritesCreateCategory => 'Vytvořit kategorii';

  @override
  String get favoritesCategoryNameLabel => 'Název kategorie';

  @override
  String get favoritesHideMutedChannels => 'Skrýt ztlumené kanály';

  @override
  String get favoritesShowMutedChannels => 'Zobrazit ztlumené kanály';

  @override
  String get favoritesSetNickname => 'Nastavit přezdívku';

  @override
  String get favoritesNicknameLabel => 'Přezdívka';

  @override
  String get favoritesSaveNickname => 'Uložit přezdívku';

  @override
  String get favoritesMoveToCategory => 'Přesunout do kategorie';

  @override
  String get favoritesUncategorized => 'Nekategorizováno';

  @override
  String get favoritesOtherCategory => 'Jiné';

  @override
  String get favoritesRemoveFromFavorites => 'Odebrat z oblíbených';

  @override
  String get favoritesAddToFavorites => 'Přidat k oblíbeným';

  @override
  String get favoritesAddToSavedMedia => 'Přidat k uloženým médiím';

  @override
  String get favoritesRemoveFromSavedMedia => 'Odstranit z uložených médií';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Přidat mezi oblíbené GIFy uložené pouze jako URL';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Odebrat z oblíbených GIFů uložených pouze jako URL';

  @override
  String get savedMediaAddTitle => 'Přidat k uloženým médiím';

  @override
  String get savedMediaFormNameLabel => 'Název';

  @override
  String get savedMediaFormNameHint => 'Moje super média';

  @override
  String get savedMediaFormAltTextLabel => 'Alternativní text';

  @override
  String get savedMediaFormAltTextHint => 'Popište médium';

  @override
  String get savedMediaFormTagsLabel => 'Štítky';

  @override
  String get savedMediaFormTagsHint => 'vtipné, reakce, práce';

  @override
  String get savedMediaSaveError => 'Nepodařilo se aktualizovat uložená média.';

  @override
  String get savedMediaNameRequired => 'Je potřeba zadat název.';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'Jak si přejete ukládat oblíbené GIFy?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'Oblíbené GIFy můžete ukládat jako oblíbené pouze s adresou URL nebo je nahrát do svého uloženého média. Vyberte si možnost, která vám nejlépe vyhovuje. Kdykoli ji můžete změnit v Nastavení > Pokročilé > Média.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'Oblíbené položky pouze z URL (výchozí): synchronizované napříč vašimi zařízeními, bez nahrávání, nepočítá se do uložených médií. Původní média mohou zmizet, pokud je jejich hostitel odstraní.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Uložená média: nahraná, označená štítky, prohledávatelná a trvalá, ale započítávají se do limitu vašich uložených médií.';

  @override
  String get gifFavoriteFirstTimeHint => 'Zeptáme se jen jednou.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly => 'Použít jen URL (doporučeno)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => 'Použít uložená média';

  @override
  String get favoritesHideConfirmTitle => 'Skrýt oblíbené';

  @override
  String get favoritesHideConfirmDescription =>
      'Tímto skryjete všechny prvky uživatelského rozhraní související s oblíbenými, včetně tlačítek a položek nabídky. Vaše stávající oblíbené položky budou zachovány a lze je kdykoli znovu povolit v Nastavení > Pokročilé > Vzhled.';

  @override
  String get favoritesDirectMessageSubtitle => 'Přímá zpráva';

  @override
  String get messagesMediaDisplayGroupTitle => 'Zobrazení';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Ovládejte, jak se zobrazují zprávy, média a další obsah.';

  @override
  String get messagesMediaMediaGroupTitle => 'Média';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Přizpůsobte si velikost médií a tlačítka.';

  @override
  String get messagesMediaInputGroupTitle => 'Vstup';

  @override
  String get messagesMediaInputGroupDescription =>
      'Přizpůsobte si nastavení vstupu zpráv.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Postranní panel';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Nakonfigurujte, jak se zobrazuje postranní panel komunity.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Ve výchozím nastavení skrýt ztlumené kanály';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Automaticky skryjte ztlumené kanály v postranním panelu, když se připojíte k novým komunitám';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Skrýt ztlumené kanály ve výchozím nastavení?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Nové komunity, do kterých vstoupíte, budou mít automaticky skryté ztlumené kanály. Chcete toto nastavení použít i pro všechny vaše stávající komunity?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Přestat ve výchozím nastavení skrývat ztlumené kanály?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'V komunitách, ke kterým se nově připojíte, už ztlumené kanály nebudou automaticky skryté. Chcete je zobrazit i ve všech svých stávajících komunitách?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Použít pro všechny komunity';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Zobrazit ve všech komunitách';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Pouze nové komunity';

  @override
  String get messagesMediaDisplaySectionTitle => 'Zobrazení médií';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Ovládejte, jak se zobrazují obrázky, videa a další média. Všechna média jsou změněna velikost a převedena. Extrémně velké soubory, které nelze komprimovat do náhledu, nebudou vloženy bez ohledu na tato nastavení.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Při odesílání jako odkazy do chatu';

  @override
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'Při nahrání přímo do $productName';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Náhledy odkazů';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Ovládejte, jak se v chatu zobrazují náhledy webových odkazů';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Zobrazovat náhledy odkazů a vložený obsah';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reakce';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Nastavte si emoji reakce na zprávy';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Zobrazovat reakce emoji u zpráv';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Obsah se spoilerem';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Ovládejte, jak se zobrazuje skrytý obsah';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Zobrazit skrytý obsah';

  @override
  String get messagesMediaSpoilersOnClickName => 'Při kliknutí';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Zobrazit obsah se spoilerem po kliknutí';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'V kanálech, které moderuji';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Vždy zobrazit skrytý obsah v kanálech, kde máte oprávnění „Spravovat zprávy“';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Vždy';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Vždy zobrazovat obsah se spoilerem';

  @override
  String get messagesMediaSizeSectionTitle => 'Preferovaná velikost médií';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Přizpůsobte maximální velikost pro vložená média a přílohy. Menší velikosti zaberou méně místa, větší zobrazí více detailů.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Média z odkazů (vložené prvky)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Nahrané přílohy';

  @override
  String get messagesMediaSizeCompactName => 'Kompaktní (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Menší velikost médií';

  @override
  String get messagesMediaSizeComfortableName => 'Pohodlná (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Větší velikost médií s více detaily';

  @override
  String get messagesMediaGifsSectionTitle => 'Chování GIFů';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Ovládejte, jak se GIFy vkládají do chatu';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Automaticky odesílat GIFy po výběru';

  @override
  String get messagesMediaCameraUploadsSectionTitle =>
      'Nahrávání z fotoaparátu';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Vyberte, zda se fotografie a videa pořízená fotoaparátem v aplikaci uchovají ve vašem zařízení';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel =>
      'Uložit do zařízení';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Automatické doplňování výrazů (doplňování pomocí dvojtečky)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Ovládejte, co se zobrazí v automatickém doplňování výrazů po zadání dvojtečky. Přizpůsobte si návrhy podle svých preferencí.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Zobrazovat výchozí emoji v automatickém doplňování výrazů';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Zobrazovat vlastní emoji v automatickém doplňování výrazů';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Zobrazovat samolepky v automatickém doplňování výrazů';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Zobrazovat uložená média v automatickém doplňování výrazů';

  @override
  String get messagesMediaEditingSectionTitle => 'Úprava zpráv';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Ovládejte, co se stane s návrhem úpravy po zrušení.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Ponechat návrh úpravy při zrušení';

  @override
  String get accessibilitySaturationTitle => 'Sytost';

  @override
  String get accessibilitySaturationDescription =>
      'Upravte, jak živě se zobrazují barvy motivu v celé aplikaci.';

  @override
  String get accessibilityVisualGroupTitle => 'Vzhled';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel => 'Vždy podtrhávat odkazy';

  @override
  String get accessibilityShowAltTextOnImagesLabel =>
      'Zobrazit alternativní text u obrázků';

  @override
  String get accessibilityShowAltTextOnImagesDescription =>
      'Zobrazit alternativní text pod obrázky, pokud je k dispozici.';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Snížit výraznost přeškrtnutého textu';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'Náhledy zpráv v soukromých chatech';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Ovládejte, kdy se zobrazují náhledy zpráv v seznamu přímých zpráv.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Režim náhledu zpráv v soukromých chatech';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Všechny zprávy';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Zobrazovat náhledy zpráv ve všech soukromých konverzacích';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Jen nepřečtené soukromé konverzace';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Zobrazovat náhledy zpráv pouze u soukromých konverzací s nepřečtenými zprávami';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Žádné';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Nezobrazovat náhledy zpráv v seznamu soukromých zpráv';

  @override
  String get accessibilityScreenReaderGroupTitle => 'Čtečka obrazovky';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Ovládejte, jak $productName funguje se čtečkami obrazovky.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Oznamovat nové zprávy';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Povolit čtečkám obrazovky oznamovat nové zprávy, jakmile dorazí do otevřeného kanálu. Zvuky oznámení zůstanou beze změny.';

  @override
  String get accessibilityTtsGroupTitle => 'Převod textu na řeč';

  @override
  String get accessibilityTtsGroupDescription => 'Zvolte rychlost čtení textu.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Rychlost přehrávání řeči';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Přehrát ukázku';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Ztlumit ukázku';

  @override
  String get accessibilityPreviewButtonLabel => 'Tlačítko náhledu';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'Takto se zobrazují odkazy: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Náhledový uživatel';

  @override
  String get accessibilityKeyboardGroupTitle => 'Klávesnice';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Zobrazit rámeček fokusu v textovém poli chatu';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'Klávesa Escape ukončí režim navigace klávesnicí';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Zobrazit zkratky kontextové nabídky';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Vyžadovat potvrzení před zahájením hovorů';

  @override
  String get accessibilityAnimationGroupTitle => 'Animace';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'Snížená animace je zapnutá, takže animace obsahu jsou ve výchozím nastavení pozastaveny. Přesto je můžete znovu zapnout, aby se přehrávaly.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel =>
      'Přehrávat animované emoji';

  @override
  String get accessibilityAutoPlayGifsMobileLabel =>
      'Automaticky přehrávat GIFy';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'Automaticky přehrávat GIFy, když je $productName aktivní';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Přehrává se i přes omezený pohyb.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Pozastaveno kvůli omezenému pohybu. Zapněte pro přehrávání animovaných emoji.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Pozastaveno kvůli omezenému pohybu. Zapněte pro přehrávání GIFů.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'Ve výchozím nastavení vypnuto na mobilu kvůli úspoře baterie a dat.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Animace samolepek';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Nastavení animací samolepek';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Vždy animovat';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Samolepky se budou vždy animovat';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Animovat při interakci';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Samolepky se budou animovat po stisknutí';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Samolepky se budou animovat při najetí myší nebo interakci';

  @override
  String get accessibilityStickerNeverAnimateName => 'Nikdy neanimovat';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Samolepky se nikdy nebudou animovat';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Vždy animovat i přes omezený pohyb.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'Omezený pohyb omezuje animaci nálepek na interakci. Chcete-li to přepsat, zvolte vždy animovat.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'Ve výchozím nastavení se animace na mobilu spouští při interakci, aby se šetřila baterie.';

  @override
  String get accessibilityMotionGroupTitle => 'Pohyb';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Synchronizovat nastavení omezení pohybu se systémem';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Použít předvolbu omezeného pohybu systému tohoto zařízení, nebo si ji přizpůsobit níže.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Omezit pohyb';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Vypnout animace a přechody. Momentálně řízeno nastavením vašeho systému.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Vypnout animace a přechody v celé aplikaci.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Přehrávání animovaných emoji, GIFů a samolepek můžete nastavit na kartě Animace.';

  @override
  String get accessibilityConfirmStartCallTitle => 'Zahájit hovor?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Opravdu chcete zahájit tento hovor?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Zahájit hovor';

  @override
  String get accessibilityTtsSampleDescription =>
      'Poslechněte si ukázkovou větu s vybranou rychlostí.';

  @override
  String get accessibilityTtsSampleText =>
      'Doktore, jsem z budoucnosti. Přicestoval jsem sem ve stroji času, který jste vynalezl. Teď potřebuji vaši pomoc, abych se dostal zpět do roku 1985.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'Syntéza řeči není na tomto zařízení dostupná.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Přehrávání řeči se nezdařilo. Zkuste to znovu, nebo zkontrolujte, zda funguje zvukový výstup.';

  @override
  String get ttsSubstitutionUnknownUser => 'neznámý uživatel';

  @override
  String get ttsSubstitutionUnknownRole => 'neznámá role';

  @override
  String get ttsSubstitutionUnknownChannel => 'neznámý kanál';

  @override
  String get ttsSubstitutionCodeBlock => 'blok kódu';

  @override
  String get ttsSubstitutionSpoiler => 'skryté';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'emoji $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return 'lomítko $commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName řekl(a): $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'Odpověď na zprávu od uživatele $replyAuthorName: $authorName řekl(a): $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'poslal(a) nálepku';

  @override
  String get ttsSentAttachment => 'poslal(a) přílohu';

  @override
  String ttsSentAttachments(int count) {
    return 'odesláno $count příloh';
  }

  @override
  String get ttsSentEmbed => 'odeslal(a) vložený obsah';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author poslal $summary';
  }

  @override
  String get dmListSentAnAttachment => 'Odeslal(a) přílohu';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username připnul(a) zprávu do tohoto kanálu.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username přidal(a) uživatele $userName do skupiny.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username přidal(a) někoho do skupiny.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username opustil(a) skupinu.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username odebral(a) uživatele $userName ze skupiny.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username odebral(a) někoho ze skupiny.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username změnil(a) název kanálu na $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username změnil(a) název kanálu.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username změnil(a) ikonu kanálu.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username zahájil(a) hovor.';
  }

  @override
  String get systemCallJoinTheCall => 'Připojit se k hovoru';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username zahájil hovor, který trval $duration.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'Zmeškali jste hovor od $username, který trval $duration.';
  }

  @override
  String systemCallMissed(String username) {
    return 'Zmeškali jste hovor od $username.';
  }

  @override
  String get systemCallDurationFewSeconds => 'pár sekund';

  @override
  String get systemCallDurationMinute => 'minutu';

  @override
  String get systemCallDurationOneYear => '1 rok';

  @override
  String get systemCallDurationOneMonth => '1 měsíc';

  @override
  String get systemCallDurationOneWeek => '1 týden';

  @override
  String get systemCallDurationOneDay => '1 den';

  @override
  String get systemCallDurationOneHour => '1 hodina';

  @override
  String systemCallDurationYears(int count) {
    return '$count let';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count měsíců';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count týdnů';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count dny';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count hodin';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count minut';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Aktualizujte aplikaci $productName, abyste si mohli tuto zprávu prohlédnout.';
  }

  @override
  String get voiceConnectionConfirmTitle => 'Potvrzení hlasového připojení';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'K tomuto hlasovému kanálu jste již připojeni z $count dalších zařízení. Co chcete udělat?',
      one:
          'K tomuto hlasovému kanálu jste již připojeni z 1 dalšího zařízení. Co chcete udělat?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Přepnout na toto zařízení';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Připojit se (zachovat ostatní připojení)';

  @override
  String get voiceConnectionConfirmDoNothing => 'Nechci se připojit';

  @override
  String get voiceJoinFailedTitle =>
      'Nepodařilo se připojit k hlasovému hovoru';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Nepodařilo se odpojit ostatní zařízení. Zkuste to za chvíli znovu.';

  @override
  String get voiceChannelEmptyDescription =>
      'Toto je hlasový kanál. Připojte se a začněte mluvit!';

  @override
  String get voiceChannelJoin => 'Připojit se k hlasovému kanálu';

  @override
  String get voiceCallJoin => 'Připojit se k hovoru';

  @override
  String get voiceChannelJoinConnect => 'Připojit se k hlasovému hovoru';

  @override
  String get voiceChannelNoConnectPermission =>
      'Nemáte oprávnění připojit se k tomuto hlasovému kanálu';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Zvuk mikrofonu, obraz kamery a sdílená obrazovka jsou chráněny koncovým šifrováním.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Zvuk mikrofonu, obraz kamery a sdílená obrazovka jsou chráněny koncovým šifrováním.';

  @override
  String get voiceChannelE2eeBroken =>
      'Koncové šifrování není k dispozici, protože ho některý z účastníků tohoto hlasového kanálu nepodporuje.';

  @override
  String get voiceCallE2eeBroken =>
      'Koncové šifrování není k dispozici, protože ho některý z účastníků tohoto hovoru nepodporuje.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Tento klient musí být aktualizován před připojením k tomuto šifrovanému hovoru.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Nepodařilo se spustit váš mikrofon. Stále jste v hovoru.';

  @override
  String get voiceChannelStatusConnecting => 'Připojování…';

  @override
  String get voiceChannelStatusConnected => 'Připojeno';

  @override
  String get voiceChannelStatusError => 'Chyba';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Mobilní zařízení';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Počítač';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Ztlumeno komunitou';

  @override
  String get voiceParticipantTooltipMuted => 'Ztlumeno';

  @override
  String get voiceParticipantTooltipCommunityDeafened => 'Neslyšící (komunita)';

  @override
  String get voiceParticipantTooltipDeafened => 'Zvuk vypnutý';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Připojení: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count účastníků',
      one: '1 účastník',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Opustit';

  @override
  String get voiceControlMute => 'Ztlumit';

  @override
  String get voiceControlUnmute => 'Zrušit ztlumení';

  @override
  String get voiceControlDeafen => 'Vypnout zvuk';

  @override
  String get voiceControlUndeafen => 'Zapnout zvuk';

  @override
  String get voiceControlVideo => 'Video';

  @override
  String get voiceControlFlipCamera => 'Otočit kameru';

  @override
  String get voiceControlScreenShare => 'Sdílení obrazovky';

  @override
  String get voiceScreenShareNotificationText => 'Sdílíte obrazovku.';

  @override
  String get voiceControlMore => 'Více';

  @override
  String get voiceControlDisconnect => 'Odpojit';

  @override
  String get voiceInChat => 'V hlasovém hovoru';

  @override
  String get voiceConnectionFailed => 'Připojení se nezdařilo';

  @override
  String get voiceConnectionRetry => 'Zkusit znovu';

  @override
  String get voiceConnectionDismiss => 'Zavřít';

  @override
  String get voiceConnectionDisconnected => 'Odpojeno';

  @override
  String voicePingMs(int currentLatency) {
    return 'Ping: $currentLatency ms';
  }

  @override
  String get voiceMeasuringLatency => 'Měření latence…';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Přejít na $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'Hlasové připojení';

  @override
  String get voiceConnectionAdvancedStats => 'Pokročilé';

  @override
  String get voiceShowCallAvatars => 'Zobrazit avatary hovoru';

  @override
  String get voiceShowConnectionId => 'Zobrazit ID připojení';

  @override
  String get voiceAudioProcessing => 'Zpracování zvuku';

  @override
  String get voiceConnectionSessionSection => 'Relace';

  @override
  String get voiceConnectionDurationLabel => 'Doba trvání';

  @override
  String get voiceConnectionParticipantsLabel => 'Účastníci';

  @override
  String get voiceConnectionNetworkSection => 'Síť';

  @override
  String get voiceConnectionPingLabel => 'Ping';

  @override
  String get voiceConnectionJitterLabel => 'Kolísání';

  @override
  String get voiceConnectionSendLabel => 'Odeslat';

  @override
  String get voiceConnectionReceiveLabel => 'Příjem';

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
    return '$bandwidth kbps';
  }

  @override
  String get userAreaMuteMicrophone => 'Ztlumit mikrofon';

  @override
  String get userAreaUnmuteMicrophone => 'Zapnout mikrofon';

  @override
  String get userAreaUserSettings => 'Uživatelské nastavení';

  @override
  String get voiceParticipantMenuViewProfile => 'Zobrazit profil';

  @override
  String get voiceParticipantMenuFocus => 'Zvýraznit tuto osobu';

  @override
  String get voiceParticipantMenuUnfocus => 'Zrušit zvýraznění';

  @override
  String get voiceParticipantMenuCommunityMute => 'Ztlumit mikrofon v komunitě';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Vypnout zvuk v komunitě';

  @override
  String get voiceParticipantMenuUserVolume => 'Hlasitost uživatele';

  @override
  String get voiceParticipantMenuStreamVolume => 'Hlasitost streamu';

  @override
  String get voiceParticipantMenuStopStreaming => 'Zastavit streamování';

  @override
  String get voiceParticipantModerationFailed =>
      'Nepodařilo se aktualizovat tohoto člena. Zkuste to prosím znovu.';

  @override
  String get voiceControlChat => 'Chat';

  @override
  String get voiceCallViewModeLabel => 'Zobrazit';

  @override
  String get voiceCallViewModeGrid => 'Mřížka';

  @override
  String get voiceCallViewModeFocus => 'Fokus';

  @override
  String get voicePanelSettingsSectionTitle => 'Nastavení hlasu';

  @override
  String get voicePanelUseEarpieceLabel => 'Použít sluchátko';

  @override
  String get voiceOutputRouteSpeaker => 'Reproduktor';

  @override
  String get voiceOutputRouteEarpiece => 'Sluchátko';

  @override
  String get voiceOutputRouteHeadset => 'Sluchátka';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Zobrazit jen videa';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Zobrazit jen účastníky, kteří mají zapnutou kameru.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Zobrazit moji kameru';

  @override
  String get voicePrioritizeSpeakersLabel => 'Upřednostnit mluvčí';

  @override
  String get voiceTextChatShow => 'Zobrazit chat';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# nepřečtenými zprávami',
      one: '# nepřečtenou zprávou',
    );
    return 'Zobrazit chat s $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Pro video je vyžadováno povolení kamery.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Nepodařilo se spustit sdílení obrazovky. Zkuste to znovu.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Oprávnění ke sdílení obrazovky bylo zamítnuto.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Sdílení obrazovky není na tomto zařízení k dispozici.';

  @override
  String get voiceWatchStream => 'Sledovat stream';

  @override
  String get voiceStopWatching => 'Zastavit sledování';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Přestat sledovat aktuální stream';

  @override
  String get voiceOwnScreenShareTitle => 'Vysíláte';

  @override
  String get voiceOwnScreenShareSubtitle => 'Váš stream je pro účastníky živý.';

  @override
  String get voiceLiveBadge => 'Živě';

  @override
  String get dmVoiceViewCall => 'Zobrazit hovor';

  @override
  String get dmVoiceCallFullScreen => 'Celá obrazovka';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Otevřít hovor na celou obrazovku';

  @override
  String get dmVoiceStripStatusConnecting => 'Připojování…';

  @override
  String get dmVoiceStripStatusInCall => 'V hovoru';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Hlasový hovor';

  @override
  String get dmVoiceCallBarConnecting => 'Připojování…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Přímý hovor';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Skupinový hovor';

  @override
  String get dmVoiceCallBarIssueFallback => 'Problém s hlasem';

  @override
  String get dmVoiceFullscreenTitle => 'Hlas';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Hlasové připojení';

  @override
  String get notificationsPageTitle => 'Oznámení';

  @override
  String get notificationsFilterUnreads => 'Nepřečtené';

  @override
  String get notificationsFilterMentions => 'Zmínky';

  @override
  String get notificationsBookmarksTooltip => 'Záložky';

  @override
  String get notificationsMentionFilterTooltip => 'Filtrovat zmínky';

  @override
  String get notificationsMentionFiltersTitle => 'Filtry zmínek';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Zahrnout zmínky @everyone a @here';

  @override
  String get notificationsMentionIncludeRoles => 'Zahrnout zmínky rolí';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Zahrnout všechny zmínky komunity';

  @override
  String get notificationsNoUnreadTitle => 'Žádné nepřečtené zprávy';

  @override
  String get notificationsNoUnreadBody => 'Všechno máte přečteno.';

  @override
  String get notificationsNoMentionsTitle => 'Žádné nedávné zmínky';

  @override
  String get notificationsNoMentionsBody =>
      'Všechny zmínky o vás se zde zobrazí po dobu 7 dnů.';

  @override
  String get notificationsMentionsEndTitle => 'Dostali jste se na konec';

  @override
  String get notificationsMentionsEndBody =>
      'Viděli jste všechny své nedávné zmínky. Nebojte se, brzy se zde objeví další.';

  @override
  String get notificationsJump => 'Přejít';

  @override
  String get notificationsRemoveMentionTooltip => 'Odebrat zmínku';

  @override
  String get notificationsViewAllUnread => 'Zobrazit vše nepřečtené';

  @override
  String get notificationsMarkAsRead => 'Označit jako přečtené';

  @override
  String get notificationsExpand => 'Rozbalit';

  @override
  String get notificationsCollapse => 'Sbalit';

  @override
  String get notificationsMessageUnavailable =>
      'Tuto zprávu se nepodařilo načíst.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining znaků zbývá';
  }

  @override
  String get characterCounterTooLong => 'Zpráva je příliš dlouhá';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining znaků zbývá. Získejte $productName a pište až $premiumMaxLength znaků.';
  }

  @override
  String get chatMessageFailedToSend => 'Zprávu se nepodařilo odeslat';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Vaši zprávu nebylo možné doručit. Obvykle je to proto, že nesdílíte komunitu s příjemcem nebo příjemce přijímá přímé zprávy pouze od přátel. Možná budete muset také upravit svá vlastní nastavení soukromí pro přímé zprávy v části $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Vaši zprávu se nepodařilo doručit. Abyste mohli posílat soukromé zprávy, musíte dokončit registraci svého účtu.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Vaši zprávu se nepodařilo doručit. Abyste mohli posílat zprávy, musíte dokončit registraci svého účtu.';

  @override
  String get chatSendFailureContentBlocked =>
      'Vaše zpráva nemohla být doručena, protože byla označena našimi bezpečnostními systémy. Pokud se domníváte, že jde o chybu, kontaktujte prosím podporu.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Vaše zpráva nemohla být doručena, protože obsahuje nevhodné emoji nebo nálepky, které nejsou v tomto kontextu povoleny.';

  @override
  String get chatClientSystemOnlyYouCanSee => 'Tuto zprávu vidíte pouze vy.';

  @override
  String get chatClientSystemDismiss => 'Zavřít';

  @override
  String get privacyDashboardCommunicationSection => 'Komunikace';

  @override
  String get privacyDashboardProfilePrivacySection => 'Soukromí profilu';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Přátelé a přímé zprávy';

  @override
  String get privacyDashboardActivitySharingSection => 'Sdílení aktivit';

  @override
  String get privacyDashboardSensitiveContentSection => 'Citlivý obsah';

  @override
  String get privacyDashboardDataExportSection => 'Export dat';

  @override
  String get privacyDashboardDataDeletionSection => 'Smazání dat';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Kdo může vidět váš celý profil';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Přátelé a všechny komunity';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Váš celý profil je viditelný pro přátele a pro kohokoli ve vašich komunitách';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Pouze přátelé a malé komunity';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Váš celý profil je viditelný pro přátele a členy vašich komunit s nejvýše 200 členy';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Jen přátelé';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Váš celý profil je viditelný pouze pro vaše přátele';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Žádosti o přátelství';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Všichni';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Povolit komukoli posílat žádosti o přátelství';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends => 'Přátelé přátel';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Povolit přátelům vašich přátel, aby vám mohli posílat žádosti';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Členové komunity';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Povolit členům komunit, ve kterých se nacházíte, aby vám mohli posílat žádosti';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Přímé zprávy';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Povolit přímé zprávy od členů komunity';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Povolit členům komunit, ve kterých se nacházíte, aby vám posílali přímé zprávy';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Povolit přímé zprávy od komunitních botů';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Povolit botům z komunit, ve kterých jste, posílat vám přímé zprávy';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Ovládejte, kdo vám může posílat žádosti o přátelství a přímé zprávy';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Ovládejte, kdo vám může lhat a přidávat vás do skupinových chatů';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Příchozí hovory';

  @override
  String get privacyDashboardIncomingCallsDesc =>
      'Ovládejte, kdo vám může lhat';

  @override
  String get privacyDashboardAllowedCallers => 'Kdo vám může volat';

  @override
  String get privacyDashboardIncomingCallNobody => 'Nikdo';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Blokovat všechny příchozí hovory';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Jen přátelé';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Povolit volání pouze přátelům (doporučeno)';

  @override
  String get privacyDashboardIncomingCallCustom => 'Přátelé + Vlastní';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Povolit přátelům a dalším skupinám, které vyberete';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Všichni';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Povolit komukoli, aby vám volal, i cizím lidem';

  @override
  String get privacyDashboardAdditionalGroups => 'Další skupiny';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'Lidé, kteří jsou přáteli vašich přátel, vám mohou volat';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'Lidé z komunit, ve kterých jste oba, vám mohou volat';

  @override
  String get privacyDashboardRingBehavior => 'Chování vyzvánění';

  @override
  String get privacyDashboardSilentCalls => 'Tiché hovory od všech';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'Všechny hovory budou místo zvonění tiše upozorňovat. Ve výchozím nastavení jsou hovory od neznámých kontaktů vždy tiché.';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Kdo vás může přidat do skupinových chatů';

  @override
  String get privacyDashboardGroupDmDesc =>
      'Ovládejte, kdo vás může přidávat do skupinových chatů bez zeptání. Kdokoli vám stále může poslat odkaz s pozvánkou k připojení.';

  @override
  String get privacyDashboardAllowedInvites =>
      'Kdo vás může přidávat do skupin';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Nikdo vás nesmí přidávat do skupinových chatů bez zeptání';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Povolit jen přátelům, aby vás přidali bez žádosti (doporučeno)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Povolit přátelům a dalším skupinám, aby vás přidaly';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Povolit komukoli přidat vás do skupinových chatů bez zeptání';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'Lidé, kteří jsou přáteli vašich přátel, vás mohou přidat do skupinových chatů';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'Lidé z komunit, ve kterých jste oba, vás mohou přidat do skupinových chatů';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Hlasová aktivita v sekci Právě aktivní';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Sdílet hlasovou aktivitu s přáteli';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Sdílet hlasovou aktivitu se všemi přáteli?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Zastavit sdílení hlasové aktivity se všemi přáteli?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Chystáte se začít sdílet svou hlasovou aktivitu se všemi svými přáteli, včetně těch budoucích. Všem se odešle aktualizace a znovu to budete moct změnit až za 24 hodin.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Chystáte se přestat sdílet svou hlasovou aktivitu se všemi svými přáteli, včetně těch budoucích. Všem se odešle aktualizace a znovu to budete moct změnit až za 24 hodin.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Ano, sdílet se všemi přáteli';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm =>
      'Ano, přestat sdílet';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Znovu k dispozici za $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Sdílení hlasové aktivity aktualizováno';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Teď se nepodařilo aktualizovat sdílení hlasové aktivity';

  @override
  String get privacyDashboardDataExportDesc =>
      'Vytvořte archiv dat svého účtu ke stažení, včetně zpráv a URL příloh. Většina lidí chce vše, ale níže můžete rozsah omezit.';

  @override
  String get privacyDashboardExportMyData => 'Exportovat moje data';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Trvale odstraní vaše zprávy ze soukromých konverzací, skupinových konverzací a komunit. Zpracování probíhá na pozadí a po dokončení dostanete přímou zprávu.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Smazat mé zprávy';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Povolit přímé zprávy od členů komunity?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Blokovat přímé zprávy od členů komunity?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Povolit botům posílat vám přímé zprávy?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Blokovat botům posílání přímých zpráv?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Chcete také povolit přímé zprávy od členů vašich stávajících komunit?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Chcete také blokovat přímé zprávy od členů vašich stávajících komunit?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Chcete také povolit botům z vašich stávajících komunit, aby vám posílali přímé zprávy?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Chcete zablokovat roboty i ze svých stávajících komunit?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'Toto nastavení můžete také změnit pro jednotlivá společenství dlouhým stisknutím názvu společenství a výběrem Nastavení soukromí.';

  @override
  String get privacyDashboardDmConfirmAllowAll =>
      'Povolit pro všechny komunity';

  @override
  String get privacyDashboardDmConfirmBlockAll =>
      'Blokovat ve všech komunitách';

  @override
  String get privacyDashboardDmConfirmSkip => 'Přeskočit tento krok';

  @override
  String get privacyDashboardDataRequestGoBack => 'Zpět';

  @override
  String get privacyDashboardDataRequestExportTitle => 'Exportovat moje data';

  @override
  String get privacyDashboardDataRequestDeleteTitle => 'Smazat mé zprávy';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'Zpracujeme to co nejdříve. Až bude váš archiv připraven, dostanete e-mail.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'Zpracujeme to co nejdříve. Až to bude hotové, pošleme vám soukromou zprávu.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'Co zahrnout';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Vše';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Exportujte každou zprávu, kterou jste kdy odeslali, a k tomu všechna nastavení účtu, členství a metadata.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'Vlastní výběr';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Vyberte typy konverzací, komunity a časové období, které chcete zahrnout do archivu.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Vyberte, co zahrnout';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Vyberte, jaké typy konverzací chcete vyčistit.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Pouze místa, ke kterým už nemám přístup';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Smazat zprávy pouze z komunit a skupinových konverzací, které jste opustili nebo ze kterých jste byli odebráni.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Které konverzace';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Přepněte typy konverzací, které chcete zahrnout.';

  @override
  String get privacyDashboardDataRequestKindDms =>
      'Otevřené soukromé konverzace';

  @override
  String get privacyDashboardDataRequestKindDmsClosed =>
      'Zavřené soukromé konverzace';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'Skupinové konverzace';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Komunity';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Které komunity';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Filtr komunit';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Zahrnout vše kromě vybraných';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude => 'Pouze vybrané';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'Momentálně nejste v žádné komunitě.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Časové období';

  @override
  String get privacyDashboardDataRequestDateMode => 'Časové období';

  @override
  String get privacyDashboardDataRequestAllTime => 'Za celou dobu';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Vlastní rozsah';

  @override
  String get privacyDashboardDataRequestStartDate => 'Datum zahájení';

  @override
  String get privacyDashboardDataRequestEndDate => 'Datum konce';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Chcete-li nechat jeden konec časového okna neomezený, ponechte příslušné pole prázdné.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Vyberte alespoň jeden typ konverzace, který chcete zahrnout.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'Počáteční datum musí být dřívější než koncové datum.';

  @override
  String get privacyDashboardDataRequestConfirmTitle =>
      'Zkontrolovat a potvrdit';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'Vytvoříme stáhnutelný archiv všech zpráv, které jste kdy odeslali, a pošleme vám e-mail, až bude hotový. Odkaz ke stažení v e-mailu vyprší po 7 dnech.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'Vytvoříme archiv ke stažení, který odpovídá níže uvedeným filtrům, a pošleme vám e-mail, až bude připraven. Odkaz ke stažení v e-mailu vyprší po 7 dnech.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Trvale smazat zprávy, které odpovídají níže uvedeným filtrům. Tuto akci nelze vrátit zpět.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'Jakmile to začne, nebude cesty zpět. Až to skončí, pošleme vám soukromou zprávu.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'Vyžádat export';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Smazat zprávy';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Rozsah';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'Konverzace';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Komunity';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Časové období';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'Žádné';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'Od $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'Do $end';
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
      other: '# komunit',
      one: '# komunity',
    );
    return 'Vše kromě $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# komunity',
      one: '# komunita',
    );
    return 'Pouze $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Otevřené soukromé konverzace';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Zavřené soukromé konverzace';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Soukromé konverzace (otevřené i zavřené)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms =>
      'Skupinové konverzace';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Komunity';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# hodin',
      many: '# hodiny',
      few: '# hodiny',
      one: '# hodina',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minut',
      many: '# minuty',
      few: '# minuty',
      one: '# minuta',
    );
    return '$_temp0 a $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# hodin',
      many: '# hodiny',
      few: '# hodiny',
      one: '# hodina',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minuty',
      many: '# minut',
      few: '# minuty',
      one: '# minuta',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# sekundy',
      many: '# sekund',
      few: '# sekundy',
      one: '# sekunda',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed =>
      'Nepodařilo se načíst nastavení soukromí';

  @override
  String get privacyDashboardRetry => 'Zkusit znovu';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Nastavení citlivého obsahu se nepodařilo uložit.';

  @override
  String get privacyDashboardDataRequestFailed =>
      'Nepodařilo se dokončit požadavek.';

  @override
  String get chatMessageDeleteFailed => 'Nepodařilo se odstranit zprávu';

  @override
  String get chatMessageAddReaction => 'Přidat reakci';

  @override
  String get doubleTapReactionHint => 'Dvojitým klepnutím na zprávu reagujete';

  @override
  String get doubleTapReactionEdit => 'Upravit';

  @override
  String get doubleTapReactionEditTitle => 'Upravit výchozí';

  @override
  String get doubleTapReactionEditSubtitle =>
      'Vyberte emoji pro dvojité klepnutí';

  @override
  String get chatMessageEdit => 'Upravit zprávu';

  @override
  String get chatMessageReply => 'Odpovědět';

  @override
  String get notificationReplyPlaceholder => 'Zpráva';

  @override
  String get notificationReplyFailed => 'Odpověď se nepodařilo odeslat';

  @override
  String get chatMessageForward => 'Přeposlat';

  @override
  String get forwardMessageTitle => 'Přeposlat zprávu';

  @override
  String get forwardSearchHint => 'Hledat kanály nebo přímé zprávy';

  @override
  String get forwardDirectMessagesSection => 'Přímé zprávy';

  @override
  String get forwardCommentHint => 'Přidat komentář (volitelné)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Odeslat ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Nebyly nalezeny žádné kanály';

  @override
  String get forwardSuccessToast => 'Zpráva přeposlána';

  @override
  String get forwardFailed => 'Zprávu se nepodařilo přeposlat';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Komentáře nejsou k dispozici, protože vybraný kanál má povolený režim zpomalení.';

  @override
  String get forwardSendSlowmodeBlocked =>
      'Čekání na vypršení pomalého režimu v jednom nebo více vybraných kanálech.';

  @override
  String get slowmodeRateLimitedTitle => 'Pomalý režim aktivní';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'Pomalý režim je zapnutý – před odesláním další zprávy počkejte $duration.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'Přímé nahrávání je během zpomaleného režimu zakázáno.';

  @override
  String get shareMediaTitle => 'Sdílet do';

  @override
  String get shareMediaMessageHint => 'Přidat volitelnou zprávu…';

  @override
  String get shareMediaSendButton => 'Odeslat';

  @override
  String get shareMediaSuccessToast => 'Média sdílena';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'Sdíleno do $count cílů';
  }

  @override
  String get shareMediaFailedToast => 'Nepodařilo se sdílet média';

  @override
  String get forwardDestinationNoSendPermission =>
      'Zprávy sem nemůžete posílat';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Odkazy sem nemůžete vkládat';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Soubory sem nemůžete nahrávat';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'V této komunitě je odesílání zpráv zakázáno';

  @override
  String get forwardDestinationTimedOut =>
      'V této komunitě máte pozastavenou komunikaci';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Režim zpomalení – počkejte $remaining';
  }

  @override
  String get chatMessageCopyText => 'Kopírovat zprávu';

  @override
  String get chatMessageCopyEmbedText => 'Zkopírovat text vloženého obsahu';

  @override
  String get chatMessageTranslate => 'Přeložit';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Přeloženo z $language';
  }

  @override
  String get chatMessageSeeOriginal => 'Zobrazit původní';

  @override
  String get chatMessageSeeTranslation => 'Zobrazit překlad';

  @override
  String get chatMessageTranslating => 'Překládá se…';

  @override
  String get chatMessageTranslateFailed =>
      'Nepodařilo se přeložit tuto zprávu.';

  @override
  String get chatMessageTranslateUnavailable =>
      'Překlad není na tomto zařízení dostupný.';

  @override
  String get chatMessageSpeak => 'Přečíst zprávu nahlas';

  @override
  String get chatMessageStopSpeaking => 'Zastavit předčítání';

  @override
  String get chatMessagePin => 'Připnout zprávu';

  @override
  String get chatMessageUnpin => 'Odepnout zprávu';

  @override
  String get chatMessageUnpinIt => 'Odepnout';

  @override
  String get chatMessageBookmark => 'Uložit zprávu do záložek';

  @override
  String get chatMessageRemoveBookmark => 'Odebrat záložku';

  @override
  String get chatMessageMarkAsUnread => 'Označit jako nepřečtené';

  @override
  String get chatMessageCopyMessageLink => 'Kopírovat odkaz na zprávu';

  @override
  String get chatMessageOpenLink => 'Otevřít odkaz';

  @override
  String get chatMessageCopyLink => 'Kopírovat odkaz';

  @override
  String get chatMessageCopyMessageId => 'Kopírovat ID zprávy';

  @override
  String get chatMessageViewReactions => 'Zobrazit reakce';

  @override
  String get chatMessageRemoveAllReactions => 'Odebrat všechny reakce';

  @override
  String get chatMessageDebug => 'Ladit zprávu';

  @override
  String get chatMessageDebugSheetTitle => 'Ladit zprávu';

  @override
  String get chatMessageDebugCopyJson => 'Zkopírovat JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'JSON zprávy zkopírován do schránky';

  @override
  String get chatReactionsSheetTitle => 'Reakce';

  @override
  String get chatReactionsSheetEmpty => 'Tímto emoji zatím nikdo nezareagoval.';

  @override
  String get chatReactionAddFailed => 'Nepodařilo se přidat reakci';

  @override
  String get chatReactionRemoveFailed => 'Nepodařilo se odebrat reakci';

  @override
  String get chatMessageReport => 'Nahlásit zprávu';

  @override
  String get reportFlowTitleMessage => 'Nahlásit zprávu';

  @override
  String get reportFlowTitleUserProfile => 'Nahlásit profil';

  @override
  String get reportFlowSummaryTitle => 'Zkontrolujte své nahlášení';

  @override
  String get reportFlowSummarySubtitle =>
      'Ujistěte se, že to před odesláním vypadá správně.';

  @override
  String reportFlowDisclaimer(String guidelines) {
    return 'Nahlašujte jen to, o čem jste upřímně přesvědčeni, že porušuje pravidla. Zneužití nahlášení porušuje naše $guidelines.';
  }

  @override
  String get reportFlowCommunityGuidelinesLink => 'pravidla komunity';

  @override
  String get reportFlowDisclaimerNoLink =>
      'Nahlašujte jen to, o čem jste upřímně přesvědčeni, že porušuje pravidla, a prosím, neodesílejte stejné nahlášení dvakrát.';

  @override
  String get reportFlowSelectedMessage => 'Zpráva, kterou nahlašujete';

  @override
  String get reportFlowSelectedUser => 'Profil, který nahlašujete';

  @override
  String get reportFlowReportCategory => 'Vaše odpovědi';

  @override
  String get reportFlowSubmit => 'Odeslat nahlášení';

  @override
  String get reportFlowBack => 'Zpět';

  @override
  String get reportFlowNext => 'Další';

  @override
  String get reportFlowDone => 'Hotovo';

  @override
  String get reportFlowThankYouTitle => 'Nahlášení odesláno';

  @override
  String get reportFlowThankYouNoReportTitle =>
      'Děkujeme, že jste na to upozornili';

  @override
  String reportFlowThankYouBody(String productName) {
    return 'Tým bezpečnosti $productName vaše nahlášení posoudí. Neprozradíme, že pochází od vás.';
  }

  @override
  String get reportFlowThankYouNoReportBody =>
      'Děkujeme, že jste nám to oznámili. Samo o sobě to naše pravidla neporušuje, proto jsme neodeslali žádné nahlášení. Pokud to míří na někoho nebo obsahuje urážky, nahlaste to znovu a vyberte „Zneužívající nebo škodlivý obsah“.';

  @override
  String get reportFlowThankYouNoReportBodyShort =>
      'Děkujeme, že jste nám to oznámili. Samo o sobě to naše pravidla neporušuje, proto jsme neodeslali žádné nahlášení.';

  @override
  String get reportFlowMoreYouCanDo => 'Vaše možnosti';

  @override
  String reportFlowBlockName(String name) {
    return 'Blokovat uživatele $name';
  }

  @override
  String get reportFlowBlockDescription =>
      'Skryje zprávy od této osoby a zabrání jí posílat vám zprávy';

  @override
  String get reportFlowBlockButton => 'Blokovat';

  @override
  String get reportFlowBlockedButton => 'Blokováno';

  @override
  String get reportFlowUrgentBanner =>
      'Pokud je někdo v bezprostředním nebezpečí, nejprve kontaktujte místní záchranné složky.';

  @override
  String get reportFlowLoadFailed => 'Nepodařilo se načíst formulář nahlášení.';

  @override
  String get reportFlowTryAgain => 'Zkusit znovu';

  @override
  String get reportFlowOutdated =>
      'Formulář nahlášení se změnil. Začněte prosím znovu.';

  @override
  String get reportFlowAlreadyReported => 'Tuto zprávu jste již nahlásili.';

  @override
  String get reportFlowAlreadyReportedProfile =>
      'Tento profil jste dnes již nahlásili.';

  @override
  String get reportFlowRateLimited =>
      'Odesíláte nahlášení příliš rychle. Zkuste to později.';

  @override
  String get reportFlowSubmitFailed =>
      'Nahlášení se nepodařilo odeslat. Zkuste to znovu.';

  @override
  String get reportFlowAccountSetupRequired =>
      'Dokončete registraci účtu a ověřte svůj e-mail, abyste mohli odesílat nahlášení.';

  @override
  String get chatMessageSuppressEmbeds => 'Skrýt vložený obsah';

  @override
  String get chatMessageUnsuppressEmbeds => 'Zobrazit vložený obsah';

  @override
  String get chatMessageDelete => 'Smazat zprávu';

  @override
  String get chatMessageDeleteConfirmTitle => 'Smazat zprávu';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Opravdu chcete tuto zprávu smazat?';

  @override
  String get chatMessageDeleteAttachment => 'Smazat přílohu';

  @override
  String get chatMessageDeleteAttachmentConfirmDescription =>
      'Are you sure you want to delete this attachment?';

  @override
  String get chatMessageEditAttachmentAltText => 'Upravit alternativní text';

  @override
  String get chatMessageMore => 'Více';

  @override
  String get chatEditingMessage => 'Úprava zprávy';

  @override
  String get chatReplyOriginalDeleted => 'Původní zpráva byla smazána';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Nepodařilo se načíst původní zprávu';

  @override
  String get chatReplyAttachedMedia => 'Zpráva obsahuje přiložená média';

  @override
  String chatBlockedMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zablokovaných zpráv',
      one: '1 zablokovaná zpráva',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count potenciálně spamových zpráv',
      one: '1 potenciálně spamová zpráva',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Odpověď skryta, protože původní autor je zablokován.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Odpověď skryta, protože původní autor je označen jako spammer.';

  @override
  String get devMarkAsSpamLocally => 'Označit jako spam (jen pro mě)';

  @override
  String get devIgnoreSpamFlag => 'Ignorovat označení spamu';

  @override
  String get chatMessagesLoadError => 'Nepodařilo se načíst zprávy.';

  @override
  String get chatReplyMentionOverrideTitle => 'Ignorovat předvolbu zmínek?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname preferuje odpovědi s @zmínkou. Přesto odeslat bez zmínky?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname preferuje odpovědi bez @zmínky. Přesto odeslat se zmínkou?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ignorovat předvolbu';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Kliknutím vypnete zmínku uživatele, kterému odpovídáte.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Kliknutím zapnete zmínku uživatele, kterému odpovídáte.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Zmínit uživatele v odpovědi';

  @override
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

  @override
  String get chatReplyCancel => 'Zrušit odpověď';

  @override
  String get chatEditMessageHint => 'Upravit zprávu';

  @override
  String get chatEditNoChanges => 'Žádné změny k uložení';

  @override
  String get chatChannelNotReady =>
      'Tento kanál ještě není připraven. Zkuste to za chvíli znovu.';

  @override
  String get chatMessageEdited => '(upraveno)';

  @override
  String get chatMessageSilent => 'Toto byla @silent zpráva.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Dnes v $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Včera v $time';
  }

  @override
  String get mediaViewerImagePreview => 'Náhled obrázku';

  @override
  String get mediaViewerClose => 'Zavřít prohlížeč médií';

  @override
  String get mediaViewerOpenInBrowser => 'Otevřít v prohlížeči';

  @override
  String get mediaViewerOptions => 'Možnosti médií';

  @override
  String get mediaViewerCopyLink => 'Kopírovat odkaz';

  @override
  String get mediaViewerForward => 'Přeposlat';

  @override
  String get mediaViewerZoomIn => 'Přiblížit';

  @override
  String get mediaViewerZoomOut => 'Oddálit';

  @override
  String get mediaViewerPreviousAttachment => 'Předchozí příloha';

  @override
  String get mediaViewerNextAttachment => 'Další příloha';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String mediaViewerAttachmentThumbnail(int index) {
    return 'Příloha $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Zavřít';

  @override
  String get chatAttachmentVideoToggleControls =>
      'Přepnout ovládací prvky videa';

  @override
  String get chatAttachmentVideoMute => 'Ztlumit video';

  @override
  String get chatAttachmentVideoUnmute => 'Zrušit ztlumení videa';

  @override
  String get chatAttachmentVideoPlay => 'Přehrát video';

  @override
  String get chatAttachmentVideoPause => 'Pozastavit video';

  @override
  String get chatAttachmentVideoProgress => 'Průběh videa';

  @override
  String get chatVideoPlaybackFailed => 'Toto video se nepodařilo přehrát.';

  @override
  String get chatImageCouldNotLoad => 'Nepodařilo se načíst tento obrázek.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Upozornit uživatele s touto rolí, kteří mají oprávnění zobrazit tento kanál.';

  @override
  String get composerAutocompleteSuggestions => 'Návrhy';

  @override
  String get composerAutocompleteCommandsHeading => 'Příkazy';

  @override
  String get composerAutocompleteChoicesHeading => 'Volby';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'Volitelné argumenty';

  @override
  String get composerAutocompleteChannelsHeading => 'Kanály';

  @override
  String get composerAutocompleteMembersHeading => 'Členové';

  @override
  String get composerAutocompleteUsersHeading => 'Uživatelé';

  @override
  String get composerAutocompleteMentionsHeading => 'Zmínky';

  @override
  String get composerAutocompleteRolesHeading => 'Role';

  @override
  String get composerAutocompleteMediaHeading => 'Média';

  @override
  String get composerAutocompleteStickersHeading => 'Samolepky';

  @override
  String get composerAutocompleteGifsHeading => 'GIFy';

  @override
  String get composerAutocompleteNoGifs => 'Nebyly nalezeny žádné GIFy';

  @override
  String get composerCommandShrugDescription =>
      'Připojí ¯\\_(ツ)_/¯ k vaší zprávě.';

  @override
  String get composerCommandTableflipDescription =>
      'Připojí (╯°□°)╯︵ ┻━┻ k vaší zprávě.';

  @override
  String get composerCommandUnflipDescription =>
      'Připojí ┬─┬ ノ( ゜-゜ノ) k vaší zprávě.';

  @override
  String get composerCommandMeDescription =>
      'Odeslat zprávu popisující akci (zobrazí se kurzívou).';

  @override
  String get composerCommandSpoilerDescription =>
      'Odeslat zprávu se spoilerem (zabalí do značek spoileru).';

  @override
  String get composerCommandTtsDescription =>
      'Odeslat zprávu s převodem textu na řeč.';

  @override
  String get composerCommandNickDescription =>
      'Měnit svou přezdívku v této komunitě.';

  @override
  String get composerCommandKickDescription => 'Vyhodit člena z této komunity.';

  @override
  String get composerCommandBanDescription => 'Zabanovat člena této komunity.';

  @override
  String get composerCommandMsgDescription =>
      'Poslat soukromou zprávu uživateli.';

  @override
  String get composerCommandSavedDescription =>
      'Odeslat uloženou položku médií.';

  @override
  String get composerCommandStickerDescription => 'Odeslat samolepku.';

  @override
  String get composerCommandGifDescription => 'Vyhledejte a odešlete GIF.';

  @override
  String get composerCommandMemberOption => 'Cílový člen.';

  @override
  String get composerCommandReasonOption => 'Důvod (volitelné).';

  @override
  String get composerCommandMessageOption => 'Zpráva k odeslání.';

  @override
  String get composerCommandQueryOption => 'Co hledat.';

  @override
  String get composerCommandNicknameOption =>
      'Vaše nová přezdívka. Chcete-li ji zrušit, nechte pole prázdné.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'Kolik z nedávné historie zpráv člena chcete smazat.';

  @override
  String get composerCommandDeleteMessagesNone => 'Žádné nemazat';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Předchozích $count dní';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'Posledních 24 hodin';

  @override
  String get composerCommandOptionRequired =>
      'Tato možnost je povinná. Zadejte prosím hodnotu.';

  @override
  String get composerCommandClear => 'Vymazat příkaz';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'Změnili jste si přezdívku v této komunitě z **$previousNickname** na **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'Neznámý uživatel';

  @override
  String composerCommandMsgFailed(String username) {
    return 'Nepodařilo se odeslat zprávu uživateli **$username**. Možná má zakázané přímé zprávy nebo jste byl zablokován.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count more';
  }

  @override
  String get addGuildModalTitle => 'Přidat komunitu';

  @override
  String get addGuildModalLandingDescription =>
      'Vytvořit novou komunitu nebo se připojit k existující.';

  @override
  String get addGuildCreateCommunity => 'Vytvořit komunitu';

  @override
  String get addGuildJoinCommunity => 'Připojit se ke komunitě';

  @override
  String get addGuildImportDiscordTemplate => 'Importovat šablonu Discordu';

  @override
  String get addGuildJoinTitle => 'Připojit se ke komunitě';

  @override
  String get addGuildJoinDescription =>
      'Zadejte odkaz na pozvánku pro připojení ke komunitě.';

  @override
  String get addGuildInviteLinkLabel => 'Odkaz na pozvánku';

  @override
  String get addGuildJoinSubmit => 'Připojit se ke komunitě';

  @override
  String get addGuildInviteInvalid =>
      'Tato pozvánka je neplatná nebo vypršela.';

  @override
  String get addGuildJoinFailed =>
      'Nepodařilo se připojit ke komunitě. Zkuste to prosím znovu.';

  @override
  String get addGuildCreateTitle => 'Vytvořit komunitu';

  @override
  String get addGuildCreateDescription =>
      'Vytvořte komunitu pro sebe a své přátele, kde si můžete povídat.';

  @override
  String get addGuildCreateNameLabel => 'Název komunity';

  @override
  String get addGuildCreateSubmit => 'Vytvořit komunitu';

  @override
  String get addGuildCreateFailed =>
      'Nepodařilo se vytvořit komunitu. Zkuste to prosím znovu.';

  @override
  String get addGuildCreateClaimTitle => 'Dokončit registraci účtu';

  @override
  String get addGuildCreateClaimDescription =>
      'Než budete moci vytvořit komunitu, musíte dokončit registraci svého účtu.';

  @override
  String get addGuildCreateVerifyTitle => 'Ověřte svůj e-mail';

  @override
  String get addGuildCreateVerifyDescription =>
      'Než budete moct vytvořit komunitu, musíte si ověřit e-mailovou adresu.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Animované ikony nejsou podporovány při vytváření nové komunity. Použijte statický obrázek.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'Vytvořením komunity souhlasíte s dodržováním a prosazováním našich ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return 'Pokyny pro komunitu $productName';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'Tato instance je jediná komunita, takže nelze vytvářet další komunity.';

  @override
  String get addGuildCreateChangeIcon => 'Změnit ikonu';

  @override
  String get addGuildCreateIconLabel => 'Ikona komunity';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Max 10 MB. Doporučeno: 512×512 px';

  @override
  String get addGuildImportDescription =>
      'Vložte URL šablony Discordu a importujte její strukturu do nové komunity.';

  @override
  String get addGuildImportUrlLabel => 'Adresa URL šablony';

  @override
  String get addGuildImportUrlInvalid =>
      'Zadejte platnou adresu URL šablony Discordu nebo kód.';

  @override
  String get addGuildImportFetchFailed =>
      'Nepodařilo se načíst šablonu komunity. Šablona nemusí existovat nebo je externí služba nedostupná.';

  @override
  String get addGuildImportInvalidResponse =>
      'Toto nevypadá jako platná odpověď šablony.';

  @override
  String get addGuildImportTemplateLabel => 'Šablona';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount textových, $voiceChannelCount hlasových, $categoryCount kategorií, $roleCount rolí';
  }

  @override
  String get addGuildImportRemoveIcon => 'Odebrat ikonu';

  @override
  String get addGuildImportTemplateInvalid =>
      'Data šablony komunity je neplatná nebo poškozená.';

  @override
  String get addGuildPackInstalled => 'Balíček byl úspěšně nainstalován.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Odebrat všechny reakce';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Opravdu chcete odebrat všechny reakce z této zprávy?';

  @override
  String get chatMessagePinConfirm => 'Připnout';

  @override
  String get chatMessagePinConfirmDescription =>
      'Připnout tuto zprávu do kanálu, aby ji všichni viděli.';

  @override
  String get chatMessageUnpinConfirmTitle => 'Odepnout zprávu';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Poslat tento připnutý příspěvek zpět v čase?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username připnul $messageLink do tohoto kanálu. Viz $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'zprávu';

  @override
  String get systemPinMessageAllPinsLink => 'všechny připnuté zprávy';

  @override
  String get channelPinsEmptyTitle => 'Žádné připnuté zprávy';

  @override
  String get channelPinsEmptyDescription => 'Připnuté zprávy se zobrazí zde.';

  @override
  String get channelDetailsFallbackTitle => 'Podrobnosti';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'Skupinová zpráva · $count členů';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'Zavřít konverzaci s $name?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'Opustit $name?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Nastavení kanálu';

  @override
  String get channelDetailsGroupSettingsTitle => 'Nastavení skupiny';

  @override
  String get channelDetailsDmSettingsTitle => 'Nastavení přímých zpráv';

  @override
  String get channelDetailsInvitePeople => 'Pozvat lidi';

  @override
  String get channelDetailsCopyLink => 'Kopírovat odkaz';

  @override
  String get channelMenuCopyChannelLink => 'Kopírovat odkaz na kanál';

  @override
  String get channelMenuCopyRedirectLink => 'Zkopírovat odkaz přesměrování';

  @override
  String get channelDetailsAddFriendsToGroup => 'Přidat přátele do skupiny';

  @override
  String get channelDetailsGroupInvites => 'Pozvánky do skupiny';

  @override
  String get channelDetailsEditChannel => 'Upravit kanál';

  @override
  String get channelDetailsDeleteChannel => 'Smazat kanál';

  @override
  String get channelSettingsCategorySettingsTitle => 'Nastavení kategorie';

  @override
  String get channelSettingsEditCategory => 'Upravit kategorii';

  @override
  String get channelSettingsTabOverview => 'Přehled';

  @override
  String get channelSettingsTabPermissions => 'Oprávnění';

  @override
  String get channelSettingsTabInvites => 'Pozvánky';

  @override
  String get channelSettingsTabWebhooks => 'Webhooky';

  @override
  String get channelSettingsDeleteChannel => 'Smazat kanál';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'Opravdu chcete smazat kanál $channelName? Tuto akci nelze vrátit zpět.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'Opravdu chcete smazat $categoryName? Tuto akci nelze vrátit zpět.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Smazat kategorii';

  @override
  String get channelSettingsChannelUpdated => 'Kanál aktualizován';

  @override
  String get channelSettingsChannelName => 'Název kanálu';

  @override
  String get channelSettingsCategoryName => 'Název kategorie';

  @override
  String get channelSettingsMyCategory => 'Moje kategorie';

  @override
  String get categoryExpandCategory => 'Rozbalit kategorii';

  @override
  String get categoryCollapseCategory => 'Sbalit kategorii';

  @override
  String get categoryExpandAllCategories => 'Rozbalit všechny kategorie';

  @override
  String get categoryCollapseAllCategories => 'Sbalit všechny kategorie';

  @override
  String get categoryMuteCategory => 'Ztlumit kategorii';

  @override
  String get categoryUnmuteCategory => 'Zrušit ztlumení kategorie';

  @override
  String get categoryCopyCategoryId => 'Kopírovat ID kategorie';

  @override
  String get categoryIdCopied => 'ID kategorie zkopírováno';

  @override
  String get channelSettingsChannelNamePlaceholder => 'obecné';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'Téma';

  @override
  String get channelSettingsTopicPlaceholder => 'Přidat téma k tomuto kanálu';

  @override
  String get channelSettingsInsertEmoji => 'Vložit emoji';

  @override
  String get channelSettingsTopicTooLongTitle =>
      'Téma kanálu je příliš dlouhé.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'Zkraťte téma a zkuste to znovu.';

  @override
  String get channelSettingsSlowmode => 'Pomalý režim';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Čas mezi zprávami. „$bypassSlowmodePermissionLabel“ jej může obejít.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Vypnuto';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds sekund';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes minut';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours hodin';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute minuta';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour hodina';
  }

  @override
  String get channelSettingsVoiceQuality => 'Kvalita hlasu';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'Vyšší datový tok = lepší kvalita a vyšší využití šířky pásma.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbps';
  }

  @override
  String get channelSettingsParticipantLimit => 'Limit účastníků';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Maximální počet členů, kteří se mohou připojit najednou. 0 znamená neomezeně.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count účastníků',
      one: '1 účastník',
      zero: '∞ Bez omezení',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Limit připojení';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Maximální počet aktivních připojení, které může mít jeden člen v tomto kanálu.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count připojení',
      one: '1 připojení',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Hlasový region';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Vyberte hlasovou oblast pro tento kanál. Automatická použije nejbližší oblast.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Automaticky';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'Nepodařilo se načíst hlasové regiony';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Zkuste to znovu za chvíli.';

  @override
  String get channelSettingsResetSlider => 'Obnovit výchozí hodnotu posuvníku';

  @override
  String get channelSettingsAdvanced => 'Pokročilé';

  @override
  String get channelSettingsMatureContentOverride =>
      'Vlastní nastavení obsahu pro dospělé';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Přepsat nastavení úrovně $scopeLevel pro tento kanál. Obsah pro dospělé se zobrazí za bránou před vstupem.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Dědit';

  @override
  String get channelSettingsMatureContentOn => 'Zapnuto';

  @override
  String get channelSettingsMatureContentOff => 'Vypnuto';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Označí tento kanál jako obsah pro dospělé.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Ponechat tento kanál bez omezení pro obsah pro dospělé.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Zděděno z $inheritedSourceLabel: zapnuto';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Vypnuto z $inheritedSourceLabel';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'kategorie';

  @override
  String get channelSettingsMatureContentCommunitySource => 'komunita';

  @override
  String get channelSettingsMatureContentCategoryScope => 'Kategorie';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Komunita';

  @override
  String get channelSettingsContentWarningToggle =>
      'Zobrazit v tomto kanálu upozornění na obsah';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Zapne výzvu k souhlasu před vstupem do tohoto kanálu.';

  @override
  String get channelSettingsContentWarningText => 'Vlastní text upozornění';

  @override
  String get channelSettingsContentWarningDefault => 'Obsahuje citlivý obsah.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'K úpravě těchto oprávnění potřebujete oprávnění \"$manageChannelsPermissionLabel\".';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'K úpravě těchto oprávnění potřebujete oprávnění \"$manageRolesPermissionLabel\".';
  }

  @override
  String get channelSettingsUnknownRole => 'Neznámá role';

  @override
  String get channelSettingsUnknownUser => 'Neznámý uživatel';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides =>
      'Vlastní oprávnění přístupu';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Upravit přístup pro $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'Zpět na vlastní oprávnění';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Nastavit základní přístup pro tento kanál';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Nastavit vlastní oprávnění pro tuto roli';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Nastavit vlastní oprávnění pro tohoto člena';

  @override
  String get channelSettingsPermissionsSearchPlaceholder => 'Hledat oprávnění…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Přístup k kanálu aktualizován';

  @override
  String get channelSettingsPermissionsTitle => 'Správa přístupu';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'Tento kanál je synchronizován s nadřazenou kategorií ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'Tento kanál není synchronizován s nadřazenou kategorií ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory =>
      'Synchronizovat s kategorií';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'Kanál synchronizován s nadřazenou kategorií';

  @override
  String get channelSettingsPermissionsAddOverride =>
      'Přidat vlastní oprávnění';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Hledat role nebo členy…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => 'Role a členové';

  @override
  String get channelSettingsDeleteInvite => 'Smazat pozvánku';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Smazat tuto pozvánku? Nelze vrátit zpět.';

  @override
  String get channelSettingsCopyInviteCode => 'Kopírovat kód pozvánky';

  @override
  String get channelSettingsCopyInviteUrl => 'Kopírovat URL pozvánky';

  @override
  String get channelSettingsWebhookCreated => 'Webhook vytvořen';

  @override
  String get channelSettingsWebhookCreateFailed =>
      'Nepodařilo se vytvořit webhook';

  @override
  String get channelSettingsCreateWebhook => 'Vytvořit webhook';

  @override
  String get channelSettingsInvitesDescription =>
      'Spravujte odkazy na pozvánky pro tento kanál.';

  @override
  String get channelSettingsInvitesCreate => 'Vytvořit pozvánku';

  @override
  String get channelSettingsInvitesEmpty => 'Žádné odkazy na pozvánky';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'Tento kanál zatím nemá žádné odkazy k pozvání. Vytvořte jeden a pozvěte lidi do tohoto kanálu.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Při načítání odkazů na pozvánky pro tento kanál došlo k chybě. Zkuste to znovu.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Spravovat příchozí webhooky, které mohou posílat zprávy do tohoto kanálu.';

  @override
  String get channelSettingsWebhooksEmpty => 'Žádné webhooky';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'Pro tento kanál nejsou nakonfigurovány žádné webhooky. Vytvořte webhook, abyste externím aplikacím umožnili zveřejňovat zprávy.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Tento kanál nepodporuje webhooky.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'K zobrazení a úpravě webhooků pro tento kanál potřebujete oprávnění „$permission“.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'Nepodařilo se načíst webhooky';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Při načítání webhooků pro tento kanál došlo k chybě. Zkuste to znovu.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Vytvořil $creator dne $date';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'Neznámý uživatel';

  @override
  String get channelSettingsWebhooksAvatar => 'Avatar';

  @override
  String get channelSettingsWebhooksUploadImage => 'Nahrát obrázek';

  @override
  String get channelSettingsWebhooksRemove => 'Odebrat';

  @override
  String get channelSettingsWebhooksName => 'Název';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Název webhooku';

  @override
  String get channelSettingsWebhooksChannel => 'Kanál';

  @override
  String get channelSettingsWebhooksUrl => 'Adresa URL webhooku';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Kopírovat URL webhooku';

  @override
  String get channelSettingsWebhooksDelete => 'Smazat webhook';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'Nepodařilo se smazat tento webhook';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'Smazat tento webhook? Nelze vrátit zpět.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Zkuste to znovu za chvíli.';

  @override
  String get channelMenuOpenChat => 'Otevřít chat';

  @override
  String get channelMenuDuplicateChannel => 'Duplikovat kanál';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Resetovat stav souhlasu s obsahem pro dospělé';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Smazat vaše zprávy v tomto kanále?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Tímto trvale smažete všechny zprávy, které jste kdy odeslali v tomto kanálu. Tuto akci nelze vrátit zpět.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Smazat mé zprávy';

  @override
  String get channelMenuDeletedYourMessages => 'Smazali jste své zprávy';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'Zprávy se nepodařilo smazat';

  @override
  String get channelDetailsSystemMessage => 'Systémová zpráva';

  @override
  String get channelDetailsTextChannel => 'Textový kanál';

  @override
  String get channelDetailsVoiceChannel => 'Hlasový kanál';

  @override
  String get channelDetailsCategory => 'Kategorie';

  @override
  String get channelDetailsLinkChannel => 'Propojit kanál';

  @override
  String get channelDetailsGenericChannel => 'Kanál';

  @override
  String get channelDetailsMutedConversation => 'Ztlumený chat';

  @override
  String get channelDetailsUnmutedConversation => 'Zrušeno ztišení konverzace';

  @override
  String get channelDetailsMutedChannel => 'Kanál ztlumen';

  @override
  String get channelDetailsUnmutedChannel => 'Kanál byl zrušen';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Nastavení oznámení aktualizováno';

  @override
  String get channelDetailsTabMembers => 'Členové';

  @override
  String get channelDetailsTabPins => 'Připnuté zprávy';

  @override
  String get channelDetailsActionMute => 'Ztlumit';

  @override
  String get channelDetailsActionUnmute => 'Zrušit ztlumení';

  @override
  String get channelDetailsActionSearch => 'Hledat';

  @override
  String get channelDetailsActionMore => 'Více';

  @override
  String get channelDetailsMembersEmptyTitle => 'Žádní členové k zobrazení';

  @override
  String get channelDetailsMembersEmptyBody =>
      'Členové se zde zobrazí po načtení dat komunity.';

  @override
  String get memberListPermissionDeniedTitle => 'Členy nelze zobrazit';

  @override
  String get memberListPermissionDeniedBody =>
      'V této komunitě nemůžete zobrazit členy tohoto kanálu';

  @override
  String get memberListUnavailableTitle => 'Seznam členů není k dispozici';

  @override
  String get memberListUnavailableBody =>
      'Seznamy členů jsou v této komunitě dočasně nedostupné';

  @override
  String get channelDetailsPinsLoadFailedTitle =>
      'Nepodařilo se načíst připnuté zprávy';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'Členové s oprávněním „Připnout zprávy“ mohou připnout zprávy, které uvidí všichni.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'Zprávy v tomto chatu si můžete připnout, aby je viděli všichni.';

  @override
  String get channelDetailsPinsEndReached => 'Dostali jste se na konec';

  @override
  String get channelHeaderOpenDetails => 'Otevřít podrobnosti kanálu';

  @override
  String get channelHeaderPinnedMessages => 'Připnuté zprávy';

  @override
  String get channelHeaderPinnedMessagesUnread => 'Připnuté zprávy, nepřečtené';

  @override
  String get channelHeaderMemberList => 'Seznam členů';

  @override
  String get channelHeaderInbox => 'Doručené';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Nastavení oznámení, ztlumeno';

  @override
  String get channelDetailsSearchTitle => 'Hledat';

  @override
  String get channelDetailsSearchHint => 'Hledat zprávy';

  @override
  String get channelDetailsSearchFilterFrom => 'Od';

  @override
  String get channelDetailsSearchFilterHas => 'Má';

  @override
  String get channelDetailsSearchFilterIn => 'V';

  @override
  String get channelDetailsSearchFilterMentions => 'Zmínky';

  @override
  String get channelDetailsSearchFilterMore => 'Více';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Aktivní';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count kanálů';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count uživatelů';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'Uživatel';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Bot';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => 'Filtrovat podle kanálu';

  @override
  String get channelDetailsSearchChannelsHint => 'Hledat kanály';

  @override
  String get channelDetailsSearchChannelsEmpty =>
      'Nebyly nalezeny žádné kanály';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Připnuté';

  @override
  String get channelDetailsSearchPinnedTrue => 'Pouze připnuté';

  @override
  String get channelDetailsSearchPinnedFalse => 'Kromě připnutých';

  @override
  String get channelDetailsSearchClearFilter => 'Vymazat';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Typ autora';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Datum';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Režim data';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Vyberte datum';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Odkaz na doménu';

  @override
  String get channelDetailsSearchMoreFiltersFileName =>
      'Název souboru obsahuje';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'Přípona souboru';

  @override
  String get channelDetailsSearchContentPoll => 'Anketa';

  @override
  String get channelDetailsSearchContentPollDescription => 'Zprávy s anketou';

  @override
  String get channelDetailsSearchContentForward => 'Přeposlat';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Přeposlané zprávy';

  @override
  String get channelDetailsSearchFilterSort => 'Seřadit';

  @override
  String get channelHeaderSearchFiltersTitle => 'Filtry vyhledávání';

  @override
  String get channelHeaderSearchRecentTitle => 'Nedávná hledání';

  @override
  String get channelHeaderSearchUsersTitle => 'Uživatelé';

  @override
  String get channelHeaderSearchChannelsTitle => 'Kanály';

  @override
  String get channelHeaderSearchValuesTitle => 'Hodnoty';

  @override
  String get channelHeaderSearchDatesTitle => 'Datumy';

  @override
  String get channelHeaderSearchDefaultBadge => 'Výchozí';

  @override
  String get channelHeaderSearchClearHistory => 'Vymazat';

  @override
  String get channelHeaderSearchFilterDescFrom => 'uživatel';

  @override
  String get channelHeaderSearchFilterDescMentions => 'uživatel';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'odkaz, vložené, obrázek, video, zvuk, soubor, samolepka, …';

  @override
  String get channelHeaderSearchFilterDescBefore => 'datum nebo rozmezí dat';

  @override
  String get channelHeaderSearchFilterDescOn => 'datum nebo rozmezí dat';

  @override
  String get channelHeaderSearchFilterDescDuring => 'datum nebo rozmezí dat';

  @override
  String get channelHeaderSearchFilterDescAfter => 'datum nebo rozmezí dat';

  @override
  String get channelHeaderSearchFilterDescIn => 'kanál';

  @override
  String get channelHeaderSearchFilterDescPinned => 'pravda, nebo lež';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'uživatel, bot nebo webhook';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'hostname, např. example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'část názvu souboru přílohy';

  @override
  String get channelHeaderSearchFilterDescFileType =>
      'přípona souboru, např. png';

  @override
  String get channelHeaderSearchFilterDescSort =>
      'časové razítko nebo relevance';

  @override
  String get channelHeaderSearchFilterDescOrder => 'vzestupně nebo sestupně';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString výsledků',
      one: '1 výsledek',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'Filtrovat podle uživatele';

  @override
  String get channelDetailsSearchFilterByContent => 'Filtrovat podle obsahu';

  @override
  String get channelDetailsSearchSortBy => 'Seřadit výsledky podle';

  @override
  String get channelDetailsSearchIn => 'Hledat v';

  @override
  String get channelDetailsSearchEmptyTitle => 'Hledat v této konverzaci';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Zadejte text, autora nebo filtr obsahu a najděte zprávy.';

  @override
  String get channelDetailsSearchIndexingTitle => 'Zprávy se indexují';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Zkuste to brzy znovu, až se dokončí indexování tohoto rozsahu pro vyhledávání.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Žádné výsledky';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Zkuste jiná vyhledávací slova nebo filtry.';

  @override
  String get channelDetailsMembersOnline => 'Online';

  @override
  String get channelDetailsMembersOffline => 'Offline';

  @override
  String get channelDetailsMemberYou => 'Vy';

  @override
  String get channelDetailsSearchUsersHint => 'Hledat uživatele';

  @override
  String get channelDetailsSearchUsersTypeToSearch =>
      'Zadejte text pro vyhledání členů';

  @override
  String get channelDetailsSearchUsersEmpty => 'Žádní uživatelé nenalezeni';

  @override
  String get channelDetailsSearchUsersNoAvailable =>
      'Žádní uživatelé k dispozici';

  @override
  String get channelDetailsDone => 'Hotovo';

  @override
  String get channelDetailsHasFilterPrompt =>
      'Zobrazit zprávy, které obsahují:';

  @override
  String get channelDetailsRetry => 'Zkusit znovu';

  @override
  String get channelDetailsPinnedMessageTitle => 'Připnutá zpráva';

  @override
  String get channelDetailsSearchResultTitle => 'Výsledek hledání';

  @override
  String get channelDetailsJumpToMessage => 'Přejít na zprávu';

  @override
  String get channelDetailsUnpinMessage => 'Odepnout zprávu';

  @override
  String get channelDetailsCopyMessageLink => 'Kopírovat odkaz na zprávu';

  @override
  String get channelDetailsCopyMessageId => 'Kopírovat ID zprávy';

  @override
  String get channelDetailsMessageUnpinned => 'Zpráva odepnuta';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Aktuální komunita';

  @override
  String get channelDetailsSearchScopeCurrentDm =>
      'Aktuální soukromá konverzace';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Všechny komunity';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild =>
      'Pouze všechny soukromé konverzace';

  @override
  String get channelDetailsSearchScopeAllDms => 'Všechny soukromé konverzace';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild =>
      'Pouze otevřené soukromé konverzace';

  @override
  String get channelDetailsSearchScopeOpenDms => 'Otevřené soukromé konverzace';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Všechny soukromé konverzace + komunity';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Otevřené soukromé konverzace + komunity';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Hledat jen v této komunitě';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Hledat jen v této soukromé konverzaci';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'Ve všech komunitách, ve kterých se právě nacházíte';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Pouze ve všech soukromých konverzacích, kterých jste se kdy účastnili';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'Ve všech soukromých konverzacích, kterých jste se kdy účastnili';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'Ve všech otevřených přímých zprávách, které momentálně máte';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'Ve všech otevřených přímých zprávách';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'Ve všech přímých zprávách, ve kterých jste kdy byli + ve všech komunitách, ve kterých jste aktuálně';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'Ve všech otevřených přímých zprávách + ve všech komunitách, ve kterých právě jste';

  @override
  String get channelDetailsSearchSortNewest => 'Nejnovější nahoře';

  @override
  String get channelDetailsSearchSortOldest => 'Nejstarší napřed';

  @override
  String get channelDetailsSearchSortRelevance => 'Nejrelevantnější';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Zobrazit nejnovější zprávy jako první';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Nejprve zobrazit nejstarší zprávy';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Nejdřív zobrazit nejrelevantnější zprávy';

  @override
  String get channelDetailsSearchContentImage => 'Nahrání obrázku';

  @override
  String get channelDetailsSearchContentVideo => 'Nahrání videa';

  @override
  String get channelDetailsSearchContentAudio => 'Nahrávání zvuku';

  @override
  String get channelDetailsSearchContentFile => 'Nahrání souboru';

  @override
  String get channelDetailsSearchContentLink => 'Odkaz';

  @override
  String get channelDetailsSearchContentEmbed =>
      'Náhled odkazu nebo vložený obsah';

  @override
  String get channelDetailsSearchContentSticker => 'Samolepka';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Pouze nahrané obrázky';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Pouze nahraná videa';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Pouze nahrané zvukové soubory';

  @override
  String get channelDetailsSearchContentFileDescription =>
      'Jakákoli nahraná příloha';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'Napsaná URL v textu zprávy';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Načtené náhledy a bohatý vložený obsah, bez nahraných souborů';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Samolepka připojená ke zprávě';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count typů';
  }

  @override
  String get personalNotesTitle => 'Osobní poznámky';

  @override
  String get personalNotesSubtitle =>
      'Váš soukromý prostor pro myšlenky a připomenutí';

  @override
  String groupDmWelcome(String displayName) {
    return 'Vítejte v konverzaci s $displayName. Přidejte přátele a rozjeďte to.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Upravit skupinu';

  @override
  String get groupDmWelcomeAddFriends => 'Přidat přátele do skupiny';

  @override
  String get dmGroupInvites => 'Pozvánky';

  @override
  String get groupDmEditTitle => 'Upravit skupinu';

  @override
  String get groupDmEditDetailsTooltip => 'Upravit podrobnosti skupiny';

  @override
  String get groupDmGroupName => 'Název skupiny';

  @override
  String get groupDmMyGroup => 'Moje skupina';

  @override
  String get groupDmGroupNameMaxLength =>
      'Název skupiny nesmí přesáhnout 100 znaků';

  @override
  String get groupDmGroupIcon => 'Ikona skupiny';

  @override
  String get groupDmUploadIcon => 'Nahrát ikonu';

  @override
  String get groupDmChangeIcon => 'Změnit ikonu';

  @override
  String get groupDmRemoveIcon => 'Odebrat ikonu';

  @override
  String get groupDmUpdated => 'Skupina aktualizována';

  @override
  String get groupDmUpdateFailed =>
      'Nepodařilo se aktualizovat skupinu. Zkuste to znovu.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Animované ikony nejsou podporovány. Použijte statický obrázek.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Animované ikony nejsou podporovány';

  @override
  String get groupDmIconFileTooLargeTitle => 'Soubor ikony je příliš velký';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'Soubor s ikonou je příliš velký. Vyberte soubor menší než $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'Nepodporovaný formát ikony';

  @override
  String get groupDmUnsupportedIconFormatBody => 'Nepodporovaný typ souboru.';

  @override
  String get groupDmCouldntProcessImage => 'Nepodařilo se zpracovat obrázek';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'Nepodařilo se zpracovat oříznutý obrázek. Zkuste to znovu.';

  @override
  String get groupDmInvalidImage => 'Neplatný obrázek';

  @override
  String get groupDmInvalidImageBody => 'Obrázek je neplatný. Zkuste jiný.';

  @override
  String get groupDmAddFriends => 'Přidat';

  @override
  String get groupDmOrSendInvite => 'nebo pošlete pozvánku příteli:';

  @override
  String get groupDmGenerateInviteLink => 'Vygenerovat odkaz na pozvánku';

  @override
  String get groupDmCreateInvite => 'Vytvořit';

  @override
  String get groupDmInviteExpires24Hours => 'Vaše pozvánka vyprší za 24 hodin';

  @override
  String get groupDmAddFriendFailed =>
      'Nepodařilo se přidat tohoto přítele do skupiny. Zkuste to prosím znovu.';

  @override
  String get groupDmAddFailed => 'Nepodařilo se přidat do skupiny';

  @override
  String get groupDmGroupFull =>
      'Tato skupina je plná. Než přidáte další lidi, někoho odeberte.';

  @override
  String get groupDmRateLimited =>
      'Postupujete příliš rychle. Chvíli počkejte a zkuste to znovu.';

  @override
  String get groupDmCreateInviteFailed =>
      'Nepodařilo se vytvořit odkaz na pozvánku';

  @override
  String get groupDmCreateInviteFailedBody =>
      'Nepodařilo se vygenerovat odkaz na pozvánku. Zkuste to prosím znovu.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'Nepodařilo se vytvořit odkaz k pozvání. Zkuste to prosím znovu.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'Nemáš oprávnění vytvořit pozvánku v tomto kanálu.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'Tato komunita dosáhla limitu pozvánek.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'Vytváření pozvánek je pro tuto komunitu dočasně zakázáno.';

  @override
  String get groupDmCopyInviteFailed =>
      'Odkaz na pozvánku se nepodařilo zkopírovat';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Pozvánky může spravovat pouze vlastník skupiny.';

  @override
  String get groupDmNoInvitesCreated => 'Žádné pozvánky nebyly vytvořeny';

  @override
  String get groupDmLoadingInvites => 'Načítání pozvánek...';

  @override
  String get groupDmInvitesLoadFailed =>
      'Nepodařilo se načíst pozvánky. Zkuste to znovu.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Zrušit tuto pozvánku? Nelze vrátit zpět.';

  @override
  String get groupDmInviteRevoked => 'Pozvánka zrušena';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Vytvořil $name. Vyprší za $time.';
  }

  @override
  String channelWelcomeHeading(String channelName) {
    return 'Vítejte v kanálu $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'Na počátku nebylo nic. Pak přišel $channelName. A bylo to dobré.';
  }

  @override
  String get personalNotesComposerHint => 'Napište si zprávu';

  @override
  String channelComposerHint(String channelName) {
    return 'Napsat do #$channelName';
  }

  @override
  String dmComposerHint(String recipientName) {
    return 'Message @$recipientName';
  }

  @override
  String groupDmNamedComposerHint(String groupName) {
    return 'Napsat do $groupName';
  }

  @override
  String get groupDmComposerHint => 'Skupina zpráv';

  @override
  String get composerHint => 'Message';

  @override
  String get composerOpenExpressionPicker => 'Otevřít výběr emotikonů';

  @override
  String get composerShowKeyboard => 'Zobrazit klávesnici';

  @override
  String get composerCloseAttachmentPanel => 'Zavřít výběr příloh';

  @override
  String get chatAttachmentPanelPhotos => 'Fotky';

  @override
  String get chatAttachmentPanelFiles => 'Soubory';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Potřebujeme přístup k fotkám';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Povolit přístup k fotkám, abyste si mohli prohlížet a připojovat nedávné fotky a videa.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Otevřít nastavení';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', odesílá se';

  @override
  String get messageAccessibilityFailedSuffix => ', odeslání selhalo';

  @override
  String get messageAccessibilityAttachmentSummary => 'příloha';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count příloh';
  }

  @override
  String get messageAccessibilityImageSummary => 'obrázek';

  @override
  String get messageAccessibilityVideoSummary => 'video';

  @override
  String get messageAccessibilityAudioSummary => 'zvukový soubor';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'nálepka $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'soubor $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'příloha se spoilerem';

  @override
  String get messageAccessibilityEmbedSummary => 'vložené médium';

  @override
  String get messageAccessibilityEmptySummary => 'zpráva';

  @override
  String get personalNotesPrivateSpace => 'Váš soukromý prostor';

  @override
  String get purgePersonalNotes => 'Vymazat osobní poznámky';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Tímto trvale smažete každou zprávu a přílohu ve svých osobních poznámkách. Tuto akci nelze vzít zpět.';

  @override
  String get purgePersonalNotesConfirmButton => 'Vyčistit';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Smazáno $count zpráv z osobních poznámek';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Osobní poznámky už byly prázdné';

  @override
  String get purgePersonalNotesFailed =>
      'Osobní poznámky se nepodařilo vymazat';

  @override
  String get userSettingsGroupYourAccount => 'VÁŠ ÚČET';

  @override
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => 'Hledat nastavení...';

  @override
  String get userSettingsSearchFieldLabel => 'Hledat v nastavení';

  @override
  String get userSettingsSearchClear => 'Vymazat hledání';

  @override
  String get userSettingsSearchNoResults => 'Nenalezena žádná nastavení';

  @override
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Zabezpečení a přihlášení';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Dárky';

  @override
  String get giftSettingsClaimAccountTitle => 'Dokončit registraci účtu';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Uplatněte svůj účet k získání nebo správě dárkových kódů Plutonium.';

  @override
  String get giftSettingsRedeemTitle => 'Uplatnit dárek';

  @override
  String get giftSettingsRedeemDescription =>
      'Zadejte dárkový kód pro uplatnění Plutonium pro váš účet.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Zadejte dárkový kód…';

  @override
  String get giftSettingsRedeemButton => 'Uplatnit';

  @override
  String get giftSettingsRedeemSuccess =>
      'Dárek byl úspěšně uplatněn. Užijte si Plutonium.';

  @override
  String get giftSettingsPurchasedTitle => 'Zakoupené dárky';

  @override
  String get giftSettingsPurchasedDescription =>
      'Spravujte své zakoupené dárkové kódy Plutonium. Sdílejte URL dárku s někým výjimečným nebo si jej uplatněte sami!';

  @override
  String get giftSettingsEmptyTitle => 'Zatím žádné dárky';

  @override
  String get giftSettingsEmptyDescription =>
      'Kupte dárek Plutonium v kartě Plutonium a sdílejte ho s přáteli.';

  @override
  String get giftSettingsGoToPlutonium => 'Přejít na Plutonium';

  @override
  String get giftSettingsLoadFailedTitle =>
      'Nepodařilo se načíst inventář dárků';

  @override
  String get giftSettingsLoadFailedDescription => 'Zkuste to prosím později.';

  @override
  String get giftSettingsTryAgain => 'Zkusit znovu';

  @override
  String get giftSettingsGiftUrl => 'Odkaz na dárek';

  @override
  String get giftSettingsCopy => 'Kopírovat';

  @override
  String get giftSettingsCopied => 'Zkopírováno';

  @override
  String get giftSettingsGiftUrlCopied =>
      'Adresa dárku zkopírována do schránky!';

  @override
  String get giftSettingsGiftUrlCopyFailed =>
      'Nepodařilo se zkopírovat URL dárku';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Zakoupeno $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Vyzvednuto $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Vykoupil/a $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'Tento dárek byl uplatněn';

  @override
  String get giftSettingsRedeemForYourself => 'Uplatnit pro sebe';

  @override
  String get giftSettingsShareWithFriend => 'Sdílet s přítelem';

  @override
  String get premiumPlutoniumTagline =>
      'Odemkněte vyšší limity a exkluzivní funkce a zároveň podpořte nezávislou komunikační platformu.';

  @override
  String get premiumPurchaseMode => 'Režim nákupu';

  @override
  String get premiumForMe => 'Pro mě';

  @override
  String get premiumAsAGift => 'Jako dárek';

  @override
  String get premiumMonthly => 'Měsíčně';

  @override
  String get premiumYearly => 'Ročně';

  @override
  String get premiumPerMonth => 'měsíčně';

  @override
  String get premiumPerYear => 'ročně';

  @override
  String get premiumOneTimePurchase => 'jednorázový nákup';

  @override
  String get premiumSave17 => 'Ušetřete 17 %';

  @override
  String get premiumUpgradeNow => 'Upgradovat';

  @override
  String get premiumBuyGift => 'Koupit dárek';

  @override
  String get premiumOneYearGift => 'Dárek na 1 rok';

  @override
  String get premiumOneMonthGift => 'Dárek na 1 měsíc';

  @override
  String get premiumMostPopular => 'Nejoblíbenější';

  @override
  String get premiumScrollPrompt =>
      'Přejděte dolů a zobrazte všechny výhody zahrnuté v Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'Zdarma vs Plutonium';

  @override
  String get premiumFreeColumn => 'Zdarma';

  @override
  String get premiumGiftSectionTitle => 'Darovat Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'Sdílejte zážitek z Plutonium se svými přáteli zakoupením dárkového předplatného.';

  @override
  String get premiumGiftBannerOne => 'Čeká na vás nový dárkový kód!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'Čeká na vás $count nových dárkových kódů!';
  }

  @override
  String get premiumViewGifts => 'Zobrazit dárky';

  @override
  String get premiumReadyToUpgrade => 'Chcete upgradovat?';

  @override
  String get premiumReadyToBuyGift => 'Chcete koupit dárek?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Měsíčně $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Ročně $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 rok $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 měsíc $price';
  }

  @override
  String get premiumManageSubscription => 'Spravovat předplatné';

  @override
  String get premiumRedeemGiftCode => 'Uplatnit dárkový kód';

  @override
  String get premiumGiftBadge => 'Dárek';

  @override
  String get premiumCancelSubscriptionTitle => 'Zrušit předplatné?';

  @override
  String get premiumCancelSubscriptionBody =>
      'Výhody si ponecháte do data příštího obnovení. Poté máte dodatečnou lhůtu 3 dnů na obnovení předplatného a zachování jeho historie.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Zrušit předplatné';

  @override
  String get premiumKeepSubscription => 'Ponechat předplatné';

  @override
  String get premiumPurchaseHistoryTitle => 'Historie nákupů';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Vaše nedávné faktury. Pokud chcete změnit způsob platby pro své předplatné, přidejte nebo vyberte jeden v platebním portálu a nastavte jej jako výchozí.';

  @override
  String get premiumManagePaymentMethods => 'Spravovat platební metody';

  @override
  String get premiumBillingHistory => 'Historie plateb';

  @override
  String get premiumSelfServeRefundTitle => 'Vrácení peněz bez asistence';

  @override
  String get premiumSelfServeRefundButton => 'Vrátit poslední nákup';

  @override
  String get premiumDisclaimerAgreementPrefix =>
      'Zakoupením souhlasíte s našimi ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'Zakoupením jste souhlasili s našimi ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' a ';

  @override
  String premiumActiveUntil(String date) {
    return 'Aktivní do $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Ruší se';

  @override
  String premiumCancelsOn(String date) {
    return 'Zruší se k $date. Výhody zůstanou aktivní do té doby.';
  }

  @override
  String get premiumReactivateSubscription => 'Znovu aktivovat';

  @override
  String premiumGiftedUntil(String date) {
    return 'Darováno do $date. Automaticky se neobnovuje.';
  }

  @override
  String get premiumGiftGraceEnded =>
      'Čas vašeho dárku vypršel. Přihlaste se k odběru a zachovejte si Plutonium.';

  @override
  String get premiumGiftTimeAddedAfterSubscription =>
      'Budeme vám účtovat ihned. Zbývající čas z dárku se přidá po placeném období, takže o nic nepřijdete.';

  @override
  String get premiumComparisonFeatureColumn => 'Funkce';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'Nákupem jste přijali naše $terms a $privacy.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Samoobslužné vrácení peněz je k dispozici do 3 dnů od platby, jednou za 30 dní. Vrácením peněz za předplatné dojde k jeho zrušení. Kupující z EU/EHP se při placení vzdávají 14denního práva na odstoupení od smlouvy, aby získali okamžitý přístup k obsahu. Místo zpětného zúčtování použijte tlačítko pro vrácení peněz v aplikaci. Zpětné zúčtování může trvale omezit váš účet. Platby bezpečně zpracovává Stripe. Nikdy nevidíme celé číslo vaší karty.';

  @override
  String get premiumTermsOfService => 'Podmínky služby';

  @override
  String get premiumPrivacyPolicy => 'Zásady ochrany osobních údajů';

  @override
  String get premiumCheckoutStartFailedTitle => 'Nepodařilo se spustit platbu';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Při zahájení platby se něco pokazilo. Zkuste to prosím za chvíli znovu.';

  @override
  String get premiumPlanUnavailable =>
      'Tento tarif není k dispozici. Kontaktujte podporu.';

  @override
  String get premiumCompletePaymentTitle => 'Dokončit platbu';

  @override
  String get premiumCompletePaymentBody =>
      'Nyní budete přesměrováni na Stripe k dokončení platby. Po dokončení se vraťte do Fluxeru.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Zvolte způsob platby';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Zaplaťte pomocí Pix automático a povolte opakované platby přímo z vaší brazilské banky. Nebo zvolte platbu kartou a zadejte údaje o kreditní kartě na další obrazovce Stripe.';

  @override
  String get premiumUsePix => 'Použít Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Zaplaťte pomocí UPI a nastavte si v bance v Indii e-příkaz v souladu s předpisy RBI. Nebo si vyberte platbu kartou a zadejte údaje o kreditní kartě na další obrazovce Stripe.';

  @override
  String get premiumUseUpi => 'Použít UPI';

  @override
  String get premiumUseCard => 'Použít kartu';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Portál pro platby se nepodařilo otevřít';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Při otevírání portálu pro platby se něco pokazilo. Zkuste to prosím za chvíli znovu.';

  @override
  String get premiumAlreadyVisionaryTitle => 'Už máte Visionary';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary už zahrnuje trvalý přístup, takže opakované předplatné není potřeba. Stále můžete kupovat dárky pro ostatní.';

  @override
  String get premiumExistingSubscriptionTitle => 'Předplatné už existuje';

  @override
  String get premiumExistingSubscriptionBody =>
      'Našli jsme existující předplatné Fluxer Plutonium pro tento účel. Spravujte ho v zabezpečeném platebním portálu pro aktualizaci platebních údajů nebo kontrolu stavu obnovení. Pokud jste právě zaplatili, počkejte minutu a znovu otevřete tuto stránku.';

  @override
  String get premiumPurchasesDisabledTitle => 'Nákupy nejsou k dispozici';

  @override
  String get premiumPurchasesDisabledBody =>
      'Nákupy jsou pro tento účet zakázány. Pokud se vám to nezdá, kontaktujte support@fluxer.app.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Získejte svůj účet a kupte si Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Před nákupem Fluxer Plutonium si musíte ověřit svůj e-mail.';

  @override
  String get premiumPerkCustomUsernameTag => 'Vlastní čtyřmístný identifikátor';

  @override
  String get premiumPerkPerCommunityProfiles =>
      'Profily pro jednotlivé komunity';

  @override
  String get premiumPerkMessageScheduling => 'Plánování zpráv';

  @override
  String get premiumPerkProfileBadge => 'Odznak profilu';

  @override
  String get premiumPerkCustomVideoBackgrounds => 'Vlastní pozadí videa';

  @override
  String get premiumPerkEntranceSounds => 'Zvuky při vstupu';

  @override
  String get premiumPerkCommunities => 'Komunity';

  @override
  String get premiumPerkMessageCharacterLimit => 'Limit znaků zprávy';

  @override
  String get premiumPerkBookmarkedMessages => 'Zprávy se záložkou';

  @override
  String get premiumPerkFileUploadSize => 'Velikost nahrávaného souboru';

  @override
  String get premiumPerkEmojiStickerPacks => 'Balíčky emoji a samolepek';

  @override
  String get premiumPerkSavedMedia => 'Uložená média';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Používat animované emoji';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Globální přístup k emoji a samolepkám';

  @override
  String get premiumPerkVideoQuality => 'Kvalita videa';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Animované avatary a bannery profilu';

  @override
  String get premiumPerkEarlyAccess => 'Předběžný přístup k novým funkcím';

  @override
  String get premiumPerkCustomThemes => 'Vlastní motivy';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Až 4K/60 sn./s';

  @override
  String storePlutoniumPriceLine(String monthly, String yearly) {
    return '$monthly nebo $yearly';
  }

  @override
  String get storePlutoniumMonthSuffix => '/měs.';

  @override
  String get storePlutoniumYearSuffix => '/rok';

  @override
  String get storePlutoniumPriceOr => 'nebo';

  @override
  String get storePlutoniumEmojiTitle => 'Vaše emoji všude';

  @override
  String get storePlutoniumEmojiBody =>
      'Používejte vlastní emoji a samolepky ze všech svých komunit v každém chatu a komunitě, ve které jste.';

  @override
  String get storePlutoniumProfileTitle => 'Profil, který vynikne';

  @override
  String get storePlutoniumProfileBody =>
      'Získejte animovaný avatar a banner, odznak předplatitele, vybraný čtyřmístný tag za uživatelským jménem* a samostatný profil pro každou komunitu.';

  @override
  String get storePlutoniumFilesTitle => 'Posílejte soubory až do 500 MB';

  @override
  String get storePlutoniumFilesBody =>
      'Sdílejte celovečerní videa a velké soubory, aniž byste je museli zmenšovat. Bezplatné účty mohou odesílat až 25 MB.';

  @override
  String get storePlutoniumCompareTitle => 'Porovnání verze zdarma a Plutonium';

  @override
  String get storePlutoniumCompareMobileNote =>
      'Ne všechny tyto funkce jsou v mobilní aplikaci. Některé jsou dostupné pouze na počítači.';

  @override
  String get storePlutoniumNotAvailable => 'Není k dispozici';

  @override
  String get storePlutoniumAvailable => 'K dispozici';

  @override
  String get storePlutoniumCompareTag =>
      'Vyberte 4místné číslo za svým uživatelským jménem*';

  @override
  String get storePlutoniumCompareProfile =>
      'Samostatný profil pro každou komunitu';

  @override
  String get storePlutoniumCompareBadge =>
      'Odznak předplatitele na vašem profilu';

  @override
  String get storePlutoniumCompareBackgrounds =>
      'Video pozadí, která si můžete uložit';

  @override
  String get storePlutoniumCompareCommunities =>
      'Komunity, ke kterým se můžete připojit';

  @override
  String get storePlutoniumCompareCharacters => 'Znaků v jedné zprávě';

  @override
  String get storePlutoniumCompareBookmarks =>
      'Zprávy, které si můžete uložit do záložek';

  @override
  String get storePlutoniumCompareUpload =>
      'Největší soubor, který můžete nahrát';

  @override
  String get storePlutoniumCompareSavedMedia =>
      'Média, která si můžete uložit na později';

  @override
  String get storePlutoniumCompareAnimatedEmoji =>
      'Používat animované emoji ve zprávách';

  @override
  String get storePlutoniumCompareCustomEmoji =>
      'Používejte vlastní emoji a samolepky v jakékoli komunitě';

  @override
  String get storePlutoniumCompareVideo =>
      'Kvalita videohovoru a sdílení obrazovky';

  @override
  String get storePlutoniumCompareAvatar =>
      'Animovaný avatar a profilový banner';

  @override
  String get storePlutoniumCompareEarlyAccess =>
      'Předběžný přístup k novým funkcím';

  @override
  String get storePlutoniumCompareThemes => 'Vlastní motivy pro aplikaci';

  @override
  String get storePlutoniumVideoFree => 'Až 720p při 30 snímcích za sekundu';

  @override
  String get storePlutoniumVideoPlutonium => 'Až 4K při 60 snímcích za sekundu';

  @override
  String get storePlutoniumTagFootnote =>
      'Můžete si vybrat pouze takový tag, který ještě nikdo jiný se stejným uživatelským jménem nemá. Uživatelská jména nerozlišují velká a malá písmena, takže Mina#4821 a mina#4821 se počítají jako stejná. Tag #0000 je vyhrazen pro členy Fluxer Visionary.';

  @override
  String get storePlutoniumLearnVisionary => 'Zjistěte více o Visionary.';

  @override
  String get storePlutoniumDonatePrompt =>
      'Chcete jen podpořit open source vývoj Fluxeru? ';

  @override
  String get storePlutoniumDonateLink => 'Místo toho přispějte.';

  @override
  String get storePlutoniumHighlightsLead =>
      'Předplacením podpoříte Fluxer a odemknete si';

  @override
  String get storePlutoniumHighlightEmoji =>
      'Vlastní emoji a samolepky v jakémkoli chatu';

  @override
  String get storePlutoniumHighlightProfile =>
      'Animovaný profil, odznak a vybrané čtyřmístné číslo';

  @override
  String get storePlutoniumHighlightFiles => 'Nahrávání souborů až do 500 MB';

  @override
  String get storePlutoniumHighlightMessages =>
      'Posílejte zprávy o délce až 4 000 znaků';

  @override
  String get storePlutoniumHighlightCommunityProfile =>
      'Samostatný profil pro každou komunitu';

  @override
  String get storePlutoniumHighlightsMore => 'A další';

  @override
  String get storePlutoniumRenewsThroughPlay =>
      'Automaticky se obnovuje přes Google Play, dokud předplatné nezrušíte.';

  @override
  String get storePlutoniumRenewsThroughAppStore =>
      'Automaticky se obnovuje přes App Store, dokud předplatné nezrušíte.';

  @override
  String get storePlutoniumAlreadySubscribed =>
      'Už máte předplatné Fluxer Plutonium.';

  @override
  String storePlutoniumSavePercent(int percent) {
    return 'Ušetřete $percent%';
  }

  @override
  String get storePlutoniumWaiting =>
      'Nákup přijat. Plutonium se zde zobrazí, jakmile se aktivuje.';

  @override
  String get storePlutoniumUnavailable =>
      'Předplatné v aplikaci zatím na tomto zařízení není k dispozici.';

  @override
  String get storePlutoniumVisionaryStatus =>
      'Visionary již zahrnuje trvalý přístup, takže opakované předplatné není potřeba.';

  @override
  String get userSettingsNavPrivacyDashboard => 'Přehled ochrany soukromí';

  @override
  String get userSettingsNavAuthorizedApps => 'Autorizované aplikace';

  @override
  String get userSettingsNavBlockedUsers => 'Blokovaní uživatelé';

  @override
  String get userSettingsNavLinkedDevices => 'Propojená zařízení';

  @override
  String get userSettingsNavConnections => 'Propojení';

  @override
  String get userSettingsNavLookAndFeel => 'Vzhled';

  @override
  String get userSettingsNavAccessibility => 'Přístupnost';

  @override
  String get userSettingsNavChat => 'Chat';

  @override
  String get userSettingsNavAudioAndVideo => 'Zvuk a video';

  @override
  String get userSettingsNavShortcuts => 'Zkratky';

  @override
  String get audioAndVideoAudioSectionTitle => 'Zvuk';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'Nastavte si mikrofon, reproduktory a zpracování hlasu.';

  @override
  String get audioAndVideoVideoSectionTitle => 'Video';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'Nastavte kvalitu své kamery a sdílení obrazovky.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle => 'Chování během hovoru';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Ovládat výzvy k potvrzení během hlasových a videohovorů.';

  @override
  String get audioAndVideoInputDeviceLabel => 'Vstupní zařízení';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Výstupní zařízení';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'Výchozí';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Použít reproduktor';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'Když je vypnuto, zvuk se přehrává přes sluchátko nebo připojená sluchátka.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Hlasitost vstupu';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Hlasitost výstupu';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Zpracování hlasu';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Hlas v popředí';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Doporučeno. Upravuje zvuk mikrofonu pro srozumitelnou řeč.';

  @override
  String get audioAndVideoDirectInputLabel => 'Přímý vstup';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Odesílá váš zvuk beze změn. Nejlepší, pokud používáte externí zvukový software.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Vlastní';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Upravte si každé nastavení sami: potlačení šumu, potlačení ozvěny a zesílení.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Potlačení šumu';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Vylepšené';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Standardní';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Žádné';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Potlačení ozvěny';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Automatické řízení zesílení';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Vyrovnává hlasitost mikrofonu. Vypnuto, když je zapnuté vylepšené potlačení.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Test mikrofonu';

  @override
  String get audioAndVideoMicTestStartLabel => 'Spustit test mikrofonu';

  @override
  String get audioAndVideoMicTestStopLabel => 'Zastavit test mikrofonu';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '$productName potřebuje přístup k mikrofonu, aby mohl otestovat váš vstup.';
  }

  @override
  String get audioAndVideoCameraLabel => 'Kamera';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Zrcadlit kameru';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'Kvalita kamery';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'Kvalita sdílení obrazovky';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Snímková frekvence';

  @override
  String get audioAndVideoFrameRate15Label => '15 snímků/s';

  @override
  String get audioAndVideoFrameRate30Label => '30 snímků/s';

  @override
  String get audioAndVideoFrameRate60Label => '60 snímků/s';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080p a 60 FPS vyžadují $premiumProductName.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Tato instance momentálně umožňuje sdílení obrazovky až do rozlišení 720p při 30 snímcích za sekundu.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return 'Aplikace $productName potřebuje přístup k mikrofonu, aby mohla zobrazit vaše zařízení.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return 'Aplikace $productName potřebuje přístup ke kameře, aby mohla zobrazit vaše zařízení.';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'Neptej se, když skryji svou kameru';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'Při skrývání mé obrazovky se neptat';

  @override
  String get userSettingsNavNotifications => 'Oznámení';

  @override
  String get notificationsGeneralSectionTitle => 'Obecné';

  @override
  String get notificationsEnableNotificationsLabel => 'Zapnout oznámení';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Dostávejte oznámení o nových zprávách. Možná budete muset povolit oznámení pro aplikaci $productName v nastavení zařízení. Ovládací prvky pro jednotlivé kanály/komunity najdete v nastavení oznámení v nabídce komunity.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Zapnout oznámení na počítači';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Používá oznamovací centrum OS. Pro nastavení oznámení pro jednotlivé kanály/komunity klikněte pravým tlačítkem na ikonu komunity a otevřete nastavení oznámení.';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'Povolit oznámení prohlížeče';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'Dostávejte oznámení, když obdržíte zprávy. Možná budete muset povolit oznámení v nastavení prohlížeče. Pro ovládání oznámení pro jednotlivé kanály/komunity klikněte pravým tlačítkem na ikonu komunity a otevřete nastavení oznámení.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Doba neaktivity před zasíláním oznámení push';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName neposílá push oznámení do vašich mobilních zařízení, když jste u počítače. Zvolte, jak dlouho musíte být na počítači neaktivní, než začnete dostávat push oznámení.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute minuta';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes minut';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle => 'Předvolby zmínek';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Předvolby zmínek v odpovědích';

  @override
  String get notificationsMentionNoPreferenceName => 'Bez předvolby';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Respektovat záměr odesílatele, bez upozornění při přepnutí zmínky @';

  @override
  String get notificationsMentionPreferMentionName =>
      'Preferovat odpovědi s @zmínkou';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Ve výchozím nastavení vás v odpovědích @zmínit a upozornit odesílatele, pokud zmínku vypne';

  @override
  String get notificationsMentionPreferNoMentionName =>
      'Preferovat odpovědi bez @zmínky';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Ve výchozím nastavení vynechat @zmínku v odpovědích a upozornit odesílatele, pokud ji zapne';

  @override
  String get notificationsTtsSectionTitle =>
      'Oznámení pomocí převodu textu na řeč';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'Povolit přehrávání řeči /tts';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'Nechte /tts přečíst vaši zprávu nahlas. Vypnutím tohoto nastavení zůstanou tyto příkazy jako běžný text.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Upravit rychlost přehrávání v ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Přístupnost';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle => 'Automatické čtení zpráv';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Převede příchozí obsah na řeč, bez ohledu na to, zda pochází z /tts.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Všechny kanály';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Nechte si přečíst každou příchozí zprávu, bez ohledu na to, který kanál je otevřený.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Pouze aktivní kanál';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Předčítá pouze zprávy z kanálu, který si prohlížíte. Při přechodu do jiného kanálu se předčítání přesune s vámi.';

  @override
  String get notificationsTtsModeNeverName => 'Nikdy automaticky';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Zůstat zticha, pokud někdo nespustí /tts ručně.';

  @override
  String get notificationsTtsModeAriaLabel => 'Přečíst všechny zprávy nahlas';

  @override
  String get notificationsSoundsSectionTitle => 'Zvuky';

  @override
  String get notificationsMasterVolumeLabel => 'Hlavní hlasitost';

  @override
  String get notificationsMasterVolumeDescription =>
      'Nastaví hlasitost všech zvukových efektů. Zvuky s vlastní nastavenou hlasitostí se touto hodnotou neřídí.';

  @override
  String get notificationsResetToDefaultVolume => 'Obnovit výchozí hlasitost';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Vypnout všechny zvuky oznámení';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Vaše stávající nastavení zvuků oznámení zůstane zachováno.';

  @override
  String get notificationsShowMoreSoundEffects =>
      'Zobrazit více zvukových efektů';

  @override
  String get notificationsShowFewerSoundEffects =>
      'Zobrazit méně zvukových efektů';

  @override
  String get notificationsPreviewSound => 'Přehrát zvuk';

  @override
  String get notificationsPerSoundVolumeTitle => 'Hlasitost jednotlivých zvuků';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Nastavte si vlastní hlasitost pro jednotlivé zvuky. Zvuky bez vlastního nastavení se řídí hlavní hlasitostí.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Aktivní vlastní nastavení hlasitosti zvuků: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Podle hlavního nastavení • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'Resetovat $label na hlavní hlasitost';
  }

  @override
  String get notificationsResetAllOverrides =>
      'Obnovit všechna vlastní nastavení';

  @override
  String notificationsMuteSound(String label) {
    return 'Ztlumit $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'Zapnout zvuk: $label';
  }

  @override
  String get notificationsSoundMessage => 'Oznámení zpráv v komunitě';

  @override
  String get notificationsSoundDirectMessage => 'Oznámení přímých zpráv';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Oznámení zpráv aktuálního kanálu';

  @override
  String get notificationsSoundMute => 'Ztlumení mikrofonu';

  @override
  String get notificationsSoundUnmute => 'Zapnutí mikrofonu';

  @override
  String get notificationsSoundDeaf => 'Vypnutí zvuku hovoru';

  @override
  String get notificationsSoundUndeaf => 'Zapnutí zvuku hovoru';

  @override
  String get notificationsSoundUserJoin => 'Uživatel se připojí ke kanálu';

  @override
  String get notificationsSoundUserLeave => 'Uživatel opustí kanál';

  @override
  String get notificationsSoundUserMove => 'Uživatel přesunul kanál';

  @override
  String get notificationsSoundViewerJoin => 'Divák začne sledovat stream';

  @override
  String get notificationsSoundViewerLeave => 'Divák přestane sledovat stream';

  @override
  String get notificationsSoundVoiceDisconnect => 'Odpojení od hovoru';

  @override
  String get notificationsSoundIncomingRing => 'Příchozí hovor';

  @override
  String get notificationsSoundCameraOn => 'Kamera zapnuta';

  @override
  String get notificationsSoundCameraOff => 'Kamera vypnuta';

  @override
  String get notificationsSoundScreenShareStart => 'Spuštění sdílení obrazovky';

  @override
  String get notificationsSoundScreenShareStop => 'Ukončení sdílení obrazovky';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'Nepodařilo se aktualizovat časový limit oznámení. Zkuste to znovu.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Nepodařilo se aktualizovat předvolbu zmínek. Zkuste to znovu.';

  @override
  String get notificationsPermissionDeniedTitle => 'Oznámení blokována';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'Nepodařilo se povolit oznámení. Pokračujte povolením oprávnění k oznámením.';

  @override
  String get notificationsPushRelaySectionTitle => 'Přenos push oznámení';

  @override
  String notificationsPushRelaySectionDescription(String pushProvider) {
    return '$pushProvider doručuje push oznámení jen přes vlastní službu, takže oznámení pro toto zařízení procházejí přes přenos Fluxeru.';
  }

  @override
  String get notificationsPushRelayConsentLabel =>
      'Používat push přenos Fluxeru';

  @override
  String get notificationsPushRelayConsentDescription =>
      'Vypnutím se odstraní registrace push pro toto zařízení a zařízení přestane dostávat push oznámení.';

  @override
  String get pushRelayConsentTitle => 'Přenos push oznámení';

  @override
  String pushRelayConsentDescription(String pushProvider) {
    return '$pushProvider doručuje push oznámení jen přes vlastní službu, takže oznámení pro toto zařízení procházejí přes přenos Fluxeru.';
  }

  @override
  String get pushRelayConsentNoticePrefix => 'Odsouhlas ';

  @override
  String get pushRelayConsentNoticeLink => 'oznámení o soukromí push přenosu';

  @override
  String get pushRelayConsentNoticeSuffix =>
      ', abys na tomto zařízení zapnul push oznámení. Stačí odsouhlasit jednou na zařízení.';

  @override
  String get pushRelayConsentAgree => 'Souhlasím a pokračovat';

  @override
  String get pushRelayConsentDecline => 'Teď ne';

  @override
  String get userSettingsNavLanguageAndTime => 'Jazyk a čas';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Jazyk rozhraní';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Vyberte jazyk používaný v celé aplikaci';

  @override
  String get languageAndTimeOpenLanguageSettings => 'Otevřít nastavení jazyka';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Formát času';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Zvolte, jak se má zobrazovat čas v celé aplikaci';

  @override
  String get languageAndTimeTimeFormatSelectionLabel => 'Výběr formátu času';

  @override
  String get languageAndTimeTimeFormatAuto => 'Automaticky';

  @override
  String get languageAndTimeTimeFormat12Hour => '12hodinový';

  @override
  String get languageAndTimeTimeFormat24Hour => '24hodinový';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'Čas podle jazyka aplikace: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Čas podle nastavení systému: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Použít systémové nastavení pro formát času';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'Nepodařilo se aktualizovat formát času';

  @override
  String get userSettingsNavDefaultApps => 'Výchozí aplikace';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Webový prohlížeč';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Vyberte, který prohlížeč se otevře po klepnutí na odkaz.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'Pokud je pro danou lokalitu nainstalovaná aplikace, odkazy se nejprve otevřou v ní.';

  @override
  String get defaultAppsWebBrowserInApp => 'Prohlížeč v aplikaci';

  @override
  String get defaultAppsWebBrowserExternal => 'Externí prohlížeč';

  @override
  String get userSettingsNavAppIcon => 'Ikona aplikace';

  @override
  String get appIconSectionTitle => 'Ikona aplikace';

  @override
  String get appIconSectionDescription =>
      'Vyberte, která ikona se zobrazí na vaší domovské obrazovce.';

  @override
  String get appIconOptionDefault => 'Výchozí';

  @override
  String get appIconOptionStarfield => 'Hvězdné pole';

  @override
  String get appIconOptionSweden => 'Švédsko';

  @override
  String get appIconUnsupported =>
      'Změna ikony aplikace není na tomto zařízení k dispozici.';

  @override
  String get userSettingsNavAdvanced => 'Pokročilé';

  @override
  String get advancedPerformanceReportingTitle => 'Hlášení o výkonu';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'Pomozte vylepšit $productName sdílením anonymních dat o pádech a výkonu.';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'Odesílat zprávy o pádech a výkonu';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'Všechna odeslaná data jsou anonymní a odesílají se pouze do vlastních monitorovacích služeb $productName – nepoužívají se žádní poskytovatelé třetích stran.';
  }

  @override
  String get advancedSettingsConfigure => 'Nastavit';

  @override
  String get advancedSettingsCategoryPrivacy => 'Soukromí';

  @override
  String get advancedSettingsCategoryAppearance => 'Vzhled';

  @override
  String get advancedSettingsCategoryAccessibility => 'Přístupnost';

  @override
  String get advancedSettingsCategoryChat => 'Chat';

  @override
  String get advancedSettingsCategoryMedia => 'Média';

  @override
  String get advancedSettingsCategoryVoice => 'Hlas';

  @override
  String get advancedSettingsCategoryDeveloper => 'Vývojář';

  @override
  String get advancedSettingEnableTextSelectionLabel => 'Povolit výběr textu';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Povolit výběr textu v aplikaci';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Povolit náhledy při posouvání videa';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Miniatura nebo živý snímek při procházení videa';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Haptická odezva';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Zpětná vazba vibracemi pro klepnutí a akce. Nebude synchronizována mezi zařízeními.';

  @override
  String get advancedSettingShowNekoLabel => 'Zobrazit Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'Kočka Neko, která honí váš kurzor';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Zobrazit Neko na vašem chatu';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Animace přiblížení při spuštění';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Přiblížit logo při opouštění úvodní obrazovky';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Nápověda klávesnice';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Nápověda klávesových zkratek v popiscích';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Zapnout oblíbené';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Zobrazovat oblíbené položky v celé aplikaci';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Chování při připojení k hlasovému kanálu';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Potvrzení nebo dvojité kliknutí pro připojení k hlasovým kanálům komunity';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Vyžadovat dvojklik pro připojení k hlasovým kanálům';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Vyžadovat potvrzení před připojením k hlasovým kanálům';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Automaticky odesílat GIFy po výběru';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Automaticky odesílat GIFy z výběru bez potvrzení';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Ukládat oblíbené GIFy jako uložená média';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Vyberte, jak se ukládají oblíbené GIFy s hvězdičkou';

  @override
  String get advancedSettingMediaButtonsLabel => 'Tlačítka médií';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Přizpůsobte si, která tlačítka a indikátory se zobrazují na mediálních přílohách a vloženém obsahu';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Nahrávat přílohy před odesláním';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Začít nahrávat přílohy hned po přidání do pole pro psaní zprávy';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Odstranit parametry sledování z URL';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Automaticky odstraňovat sledovací parametry z URL v odesílaných zprávách';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'Důvěřovat všem externím odkazům';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'Přeskočit upozornění na externí odkaz pro všechny domény';

  @override
  String get advancedSettingSearchEnginesLabel => 'Vyhledávače';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Nastavit vyhledávače používané pro vybraný text';

  @override
  String get advancedSettingTranslatorsLabel => 'Překladače';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Nastavit překladatelské služby používané pro vybraný text';

  @override
  String get advancedSettingReverseImageSearchLabel =>
      'Vyhledávání podle obrázku';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Poskytovatelé vyhledávání podle obrázku';

  @override
  String get advancedSettingMessageActionBarLabel => 'Panel akcí zpráv';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Přizpůsobte si panel akcí, který se zobrazí při najetí myší na zprávy';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Automatické doplňování výrazů';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Vyberte, co se zobrazí po napsání dvojtečky do textového pole zprávy';

  @override
  String get advancedSettingInputButtonsLabel => 'Tlačítka pro zadávání zpráv';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Vyberte, která tlačítka se mají zobrazovat ve vstupním poli zpráv';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Po odeslání zprávy se posunout na konec';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Vyberte, jak se chat posune po odeslání zprávy';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Přeskočit potvrzení \"Označit vše jako přečtené\"';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Označit všechny nepřečtené kanály v doručených zprávách jako přečtené ihned, bez potvrzení';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Ve výchozím nastavení skrýt ztlumené kanály';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Skrýt ztlumené kanály z postranních panelů komunit';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'Zobrazit indikátor GIF';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Zobrazit indikátor vypršení přílohy';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'Zobrazit tlačítko smazat';

  @override
  String get advancedSettingShowMediaDownloadLabel =>
      'Zobrazit tlačítko pro stažení';

  @override
  String get advancedSettingShowMediaFavoriteLabel =>
      'Zobrazit tlačítko pro přidání do oblíbených';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Zobrazit tlačítko pro skrytí vloženého obsahu';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Zobrazit panel akcí zpráv';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel =>
      'Zobrazit jen tlačítko \"více\"';

  @override
  String get advancedSettingShowQuickReactionsLabel => 'Zobrazit rychlé reakce';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Povolit Shift pro rozbalení';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Zobrazovat výchozí emoji v automatickém doplňování výrazů';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Zobrazovat vlastní emoji v automatickém doplňování výrazů';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Zobrazovat samolepky v automatickém doplňování výrazů';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Zobrazovat uložená média v automatickém doplňování výrazů';

  @override
  String get advancedSettingShowGifsButtonLabel => 'Zobrazit tlačítko GIFů';

  @override
  String get advancedSettingShowMediaButtonLabel => 'Zobrazit tlačítko médií';

  @override
  String get advancedSettingShowStickersButtonLabel =>
      'Zobrazit tlačítko samolepek';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Zobrazit tlačítko emoji';

  @override
  String get advancedSettingShowSendButtonLabel => 'Zobrazit tlačítko Odeslat';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Zobrazovat upozornění na nová zařízení';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Nabídnout přepnutí při připojení nového zvukového zařízení';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Ovládací prvky hlasitosti připojení';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Zobrazit posuvníky hlasitosti účastníků pro každé zařízení v nabídkách hlasu';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Chování náhledu sdílení obrazovky';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Chování náhledů, samostatných oken a miniatur streamů';

  @override
  String get advancedSettingScreenShareCodecLabel => 'Kodek sdílení obrazovky';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Video kodek pro sdílení obrazovky';

  @override
  String get advancedSettingScreenShareCodecAuto => 'Automaticky (doporučeno)';

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
      'Pozastavit náhled sdílené obrazovky na pozadí';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Skrýt náhled mého streamu';

  @override
  String get advancedSettingDeveloperModeLabel => 'Zapnout režim pro vývojáře';

  @override
  String get advancedSettingDeveloperModeDescription =>
      'Zapnout režim pro vývojáře';

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
  String get advancedSettingTranslatorGoogle => 'Překlad Google';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel => 'Výchozí vyhledávač';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Vyberte, který vyhledávač se bude používat ve výchozím nastavení při vyhledávání vybraného textu.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Vestavěné vyhledávače';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Zapněte nebo vypněte vestavěné vyhledávače. Zapnuté vyhledávače se zobrazují v kontextové nabídce zprávy po výběru textu.';

  @override
  String get advancedSettingCustomSearchEnginesLabel => 'Vlastní vyhledávače';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Přidejte si vlastní vyhledávače s vlastním vzorem URL. Použijte `$query` jako zástupný symbol pro vyhledávaný text.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Přidat vyhledávač';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Povolte alespoň jeden vyhledávač níže.';

  @override
  String get advancedSettingRemoveSearchEngineLabel => 'Odebrat vyhledávač';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'Výchozí překladač';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Vyberte, který překladač se má použít jako výchozí při překladu vybraného textu.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Vestavěné překladače';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Zapněte nebo vypněte vestavěné překladače. Zapnuté překladače se zobrazují v kontextové nabídce zprávy po výběru textu.';

  @override
  String get advancedSettingCustomTranslatorsLabel => 'Vlastní překladače';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Přidejte vlastní překladače pomocí vlastního vzoru URL. Použijte \'$query\' jako zástupný symbol pro text k překladu.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Přidat překladač';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Povolte alespoň jeden překladač níže.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Odebrat překladač';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Výchozí vyhledávání podle obrázku';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Vyberte výchozí službu pro vyhledávání podle obrázku.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Vestavěné vyhledávání podle obrázků';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Zapněte nebo vypněte vestavěné poskytovatele vyhledávání podle obrázku. Zapnutí poskytovatelé se zobrazují v kontextové nabídce obrázků, avatarů, bannerů, samolepek a emoji.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Vlastní vyhledávání podle obrázku';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Přidejte si vlastní poskytovatele zpětného vyhledávání obrázků pomocí vlastního vzoru URL. Použijte \'$url\' jako zástupný symbol pro URL obrázku.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Přidat vyhledávání podle obrázku';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Níže zapněte alespoň jednoho poskytovatele vyhledávání podle obrázku.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Odebrat vyhledávání podle obrázku';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Přidat vyhledávač';

  @override
  String get advancedSettingEditSearchEngineTitle => 'Upravit vyhledávač';

  @override
  String get advancedSettingAddTranslatorTitle =>
      'Přidat poskytovatele překladu';

  @override
  String get advancedSettingEditTranslatorTitle =>
      'Upravit poskytovatele překladu';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Přidat vyhledávač pro vyhledávání podle obrázku';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Upravit vyhledávač pro vyhledávání podle obrázku';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Název';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'Vzor URL';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'Můj vyhledávač';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Můj překladač';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'Moje vyhledávání podle obrázku';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Použijte \'$query\', kam se má vložit hledaný text.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Použijte \'$query\', kamkoli má být vložena přeložená textová část.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Použijte \'$url\' tam, kam má být vložena adresa URL obrázku.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired =>
      'Je potřeba zadat název.';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'Je vyžadován vzor URL.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'Vzor URL musí obsahovat zástupný symbol „$query“.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'Vzor URL musí obsahovat zástupný symbol $url.';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'Vzor URL musí být platná adresa URL.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Přidat';

  @override
  String get advancedSettingEditSearchProviderAction => 'Upravit';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Odebrat';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'Opravdu chcete odebrat $engineName?';
  }

  @override
  String get userSettingsNavApplications => 'Aplikace';

  @override
  String get userSettingsNavAppLogs => 'Protokoly aplikace';

  @override
  String get userSettingsNavDeveloperTools => 'Nástroje pro vývojáře';

  @override
  String get userSettingsNavLimitsConfig => 'Konfigurace limitů';

  @override
  String get userSettingsNavFeatureFlags => 'Příznaky funkcí';

  @override
  String get userSettingsNavWhatsNew => 'Co je nového';

  @override
  String get userSettingsJoinFluxerLabs => 'Připojte se k Fluxer Labs';

  @override
  String get userSettingsNavAppLicenses => 'Licence aplikací';

  @override
  String get userSettingsAppLicensesDescription =>
      'Open-source software používaný touto aplikací. Tato aplikace je postavena na Flutteru.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'Nepodařilo se načíst licence aplikací.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count licencí',
      one: '1 licence',
    );
    return '$_temp0';
  }

  @override
  String get userSettingsNavLogOut => 'Odhlásit se';

  @override
  String get userSettingsLogOutConfirmTitle => 'Odhlásit se?';

  @override
  String get userSettingsLogOutConfirmDescription =>
      'Kdykoli se můžete znovu přihlásit.';

  @override
  String get quickSwitcherTabSearch => 'Hledat';

  @override
  String get quickSwitcherTabFriends => 'Přátelé';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Hledat kanály, lidi nebo komunity';

  @override
  String get quickSwitcherSearchFriends => 'Hledat přátele';

  @override
  String get quickSwitcherNoMatchesFound => 'Nic nebylo nalezeno';

  @override
  String get quickSwitcherEmptyHint =>
      'Zkuste jiné jméno nebo použijte předpony @ / # / ! / * k filtrování výsledků.';

  @override
  String get quickSwitcherSectionPeople => 'Lidé';

  @override
  String get quickSwitcherSectionGroupMessages => 'Skupinové zprávy';

  @override
  String get quickSwitcherSectionTextChannels => 'Textové kanály';

  @override
  String get quickSwitcherSectionThreads => 'Threads';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Hlasové kanály';

  @override
  String get quickSwitcherSectionCommunities => 'Komunity';

  @override
  String get quickSwitcherSectionSettings => 'Nastavení';

  @override
  String get quickSwitcherHomeLabel => 'Domů';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Přímé zprávy';

  @override
  String get quickSwitcherFavoritesLabel => 'Oblíbené';

  @override
  String get quickSwitcherUserSettingsLabel => 'Uživatelské nastavení';

  @override
  String get quickSwitcherNotificationsLabel => 'Oznámení';

  @override
  String get quickSwitcherBookmarksLabel => 'Záložky';

  @override
  String get savedMessagesEmptyTitle => 'Žádné záložky';

  @override
  String get savedMessagesEmptyBody =>
      'Uložte si zprávy do záložek, abyste se k nim mohli později vrátit.';

  @override
  String get savedMessagesEndBody => 'Už tu nic dalšího není.';

  @override
  String get savedMessagesRemoveTooltip => 'Odebrat záložku';

  @override
  String get savedMessagesAddedToast => 'Přidáno do záložek';

  @override
  String get savedMessagesRemovedToast => 'Odebráno ze záložek';

  @override
  String get quickSwitcherMentionsLabel => 'Zmínky';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Zatím žádní přátelé';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Přidejte si přítele a začněte.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Žádní přátelé neodpovídají hledání';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Zkuste jiné jméno.';

  @override
  String get quickSwitcherSearchAliasUser => 'Uživatel';

  @override
  String get quickSwitcherSearchAliasYou => 'Vy';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'SZ';

  @override
  String get quickSwitcherSearchAliasMessages => 'Zprávy';

  @override
  String get quickSwitcherSearchAliasFav => 'Obl.';

  @override
  String get quickSwitcherSearchAliasStarred => 'Označené';

  @override
  String get quickSwitcherSearchAliasInbox => 'Doručené';

  @override
  String get quickSwitcherSearchAliasSaved => 'Uloženo';

  @override
  String get uiClose => 'Zavřít';

  @override
  String get chatJumpToBottom => 'Přejít dolů';

  @override
  String get uiConfirm => 'Potvrdit';

  @override
  String get uiLoading => 'Načítání';

  @override
  String get uiSearch => 'Hledat';

  @override
  String get uiStartCall => 'Zahájit hovor';

  @override
  String get uiStartVideoCall => 'Zahájit videohovor';

  @override
  String get uiPlay => 'Přehrát';

  @override
  String get uiPause => 'Pozastavit';

  @override
  String get uiDownload => 'Stáhnout';

  @override
  String get uiMoreActions => 'Další akce';

  @override
  String get uiUnsavedChanges => 'Neuložené změny';

  @override
  String get uiReset => 'Resetovat';

  @override
  String get uiOpenColorPicker => 'Otevřít výběr barvy';

  @override
  String get uiSelectPlaceholder => 'Vybrat';

  @override
  String get uiSearchPlaceholder => 'Hledat';

  @override
  String get uiNoOptionsFound => 'Nebyly nalezeny žádné možnosti';

  @override
  String get uiDismissNotification => 'Zavřít oznámení';

  @override
  String get uiColorPickerTitle => 'Výběr barvy';

  @override
  String get mentionConfirmTitle => 'Zmínit všechny?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Tímto upozorníme $count členů. Pokračovat?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Tímto upozorníme $count online členů. Pokračovat?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'Tímto upozorníme $count členů s rolí $roleName. Pokračovat?';
  }

  @override
  String get mentionConfirmButton => 'Zmínit';

  @override
  String get composerEmojiUnavailable => 'Tuto emotikonu zde nemůžete použít.';

  @override
  String get instanceUrlLabel => 'URL instance';

  @override
  String get instanceUrlPlaceholder =>
      'Zadejte URL instance (např. fluxer.app)';

  @override
  String get instanceUrlHelper =>
      'Použijte fluxer.app pro oficiální instanci nebo přesnou URL instance hostované na vlastním serveru.';

  @override
  String get resetToDefaultInstance => 'Obnovit na Fluxer';

  @override
  String get instanceConnect => 'Připojit';

  @override
  String get instanceConnecting => 'Připojování…';

  @override
  String get instanceConnectFailed => 'Nepodařilo se připojit k instanci';

  @override
  String get recentInstances => 'Nedávné instance';

  @override
  String removeRecentInstance(String domain) {
    return 'Odebrat $domain z nedávných instancí';
  }

  @override
  String get instanceSheetTitle => 'Připojit k instanci';

  @override
  String get changeInstance => 'Změnit';

  @override
  String get instanceConnectionRequired =>
      'Pro přihlášení se připojte k instanci';

  @override
  String get comingSoon => 'Již brzy';

  @override
  String get guildNavbarDirectMessages => 'Přímé zprávy';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Prozkoumat komunity k objevování';

  @override
  String get discoveryExplore => 'Prozkoumat';

  @override
  String get discoveryExplorePublicCommunities => 'Prozkoumat veřejné komunity';

  @override
  String get discoveryListingSubheading =>
      'Chcete mít svou komunitu uvedenou zde? Požádejte o to, pokud splňujete požadavky v nastavení vaší komunity > Objevování.';

  @override
  String get discoverySearchCommunities => 'Hledat komunity';

  @override
  String get discoveryFilterByLanguage => 'Filtrovat podle jazyka';

  @override
  String get discoveryAllLanguages => 'Všechny jazyky';

  @override
  String get discoveryAllCategories => 'Vše';

  @override
  String get discoveryCategoryGaming => 'Hraní';

  @override
  String get discoveryCategoryMusic => 'Hudba';

  @override
  String get discoveryCategoryEntertainment => 'Zábava';

  @override
  String get discoveryCategoryEducation => 'Vzdělávání';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Věda a technologie';

  @override
  String get discoveryCategoryContentCreator => 'Tvůrce obsahu';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime a manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Filmy a TV';

  @override
  String get discoveryCategoryOther => 'Jiné';

  @override
  String get discoveryNoCommunitiesMatch => 'Žádné komunity neodpovídají.';

  @override
  String get discoveryJoinCommunity => 'Připojit se ke komunitě';

  @override
  String get discoveryJoined => 'Připojeno';

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
      other: '$countString členů',
      one: '1 člen',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Bez popisu.';

  @override
  String get discoveryCommunities => 'Komunity';

  @override
  String get discoveryApps => 'Aplikace';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Nepodařilo se připojit k této komunitě';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Něco se pokazilo. Zkuste to prosím za chvíli znovu.';

  @override
  String get discoveryJoinErrorFullTitle => 'Tato komunita je plná';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Tato komunita dosáhla limitu členů, takže se k ní teď nemůžete připojit.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle => 'Dosáhli jste limitu komunit';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Jste v maximálním počtu komunit. Opusťte jednu a zkuste to znovu.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'K této komunitě se nemůžete připojit';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'V této komunitě jste dostali ban.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Tato komunita již není k dispozici';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Komunita už možná není v Objevování nebo nepřijímá nové členy. Obnovte stránku a už se vám nezobrazí.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Postupujete příliš rychle';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Počkejte chvíli a zkuste to znovu.';

  @override
  String get guildNavbarAddCommunity => 'Přidat komunitu';

  @override
  String get guildNavbarHelp => 'Nápověda';

  @override
  String get scrollIndicatorNew => 'NOVÉ';

  @override
  String get scrollIndicatorNewMessage => 'NOVÁ ZPRÁVA';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Sbalit složku $folderName';
  }

  @override
  String get guildNavbarGuildSelected => 'vybráno';

  @override
  String get guildNavbarGuildUnread => 'nepřečteno';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zmínek',
      one: '1 zmínka',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'ztlumeno';

  @override
  String get authShowPassword => 'Zobrazit heslo';

  @override
  String get authHidePassword => 'Skrýt heslo';

  @override
  String get authCheckStillWorking => 'Ještě pracujeme…';

  @override
  String get authVerificationFailed =>
      'Ověření se nepodařilo dokončit. Zkuste to znovu.';

  @override
  String get chatLoadingMessages => 'Načítání zpráv';

  @override
  String get friendsMessageFriend => 'Zpráva';

  @override
  String get friendsFriendActions => 'Akce s přáteli';

  @override
  String get friendsAcceptRequest => 'Přijmout žádost o přátelství';

  @override
  String get friendsDeclineRequest => 'Odmítnout žádost o přátelství';

  @override
  String get friendsCancelRequest => 'Zrušit žádost o přátelství';

  @override
  String get friendsOpenInbox => 'Doručené';

  @override
  String get profileRemoveFriend => 'Odebrat z přátel';

  @override
  String get profileUnblockUser => 'Odblokovat uživatele';

  @override
  String get profileAcceptFriendRequest => 'Přijmout žádost o přátelství';

  @override
  String get profileCancelFriendRequest => 'Zrušit žádost o přátelství';

  @override
  String get profileSendFriendRequest => 'Přidat přítele';

  @override
  String get accountOverflowMenu => 'Možnosti účtu';

  @override
  String get navHome => 'Domů';

  @override
  String get navNotifications => 'Oznámení';

  @override
  String get navYou => 'Vy';

  @override
  String get guildFolderSettingsTitle => 'Nastavení složky';

  @override
  String get guildFolderNameLabel => 'Název složky';

  @override
  String get guildFolderColorLabel => 'Barva složky';

  @override
  String get guildFolderShowIconWhenCollapsed => 'Zobrazit ikonu po sbalení';

  @override
  String get guildFolderIconLabel => 'Ikona složky';

  @override
  String get guildFolderDelete => 'Smazat složku';

  @override
  String get guildFolderIconFolder => 'Složka';

  @override
  String get guildFolderIconStar => 'Hvězda';

  @override
  String get guildFolderIconHeart => 'Srdce';

  @override
  String get guildFolderIconBookmark => 'Záložka';

  @override
  String get guildFolderIconGameController => 'Herní ovladač';

  @override
  String get guildFolderIconShield => 'Štít';

  @override
  String get guildFolderIconMusicNote => 'Nota';

  @override
  String get guildFolderMarkAsRead => 'Označit složku jako přečtenou';

  @override
  String get guildBulkMuteCommunities => 'Ztlumit komunity';

  @override
  String get guildBulkUnmuteCommunities => 'Zrušit ztlumení komunit';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Nastavení oznámení komunity';

  @override
  String get guildBulkCommunityPrivacySettings => 'Nastavení soukromí komunity';

  @override
  String get guildBulkAllowEveryoneAndHere => 'Povolit @everyone a @here';

  @override
  String get guildBulkAllowRoleMentions => 'Povolit zmínky rolí';

  @override
  String get guildBulkEnableMobilePush => 'Zapnout push oznámení na mobilu';

  @override
  String get guildBulkDisableMobilePush => 'Vypnout push oznámení na mobilu';

  @override
  String get guildBulkAllowDirectMessages => 'Povolit přímé zprávy';

  @override
  String get guildBulkBlockDirectMessages => 'Blokovat přímé zprávy';

  @override
  String get guildBulkAllowBotDirectMessages => 'Povolit přímé zprávy od botů';

  @override
  String get guildBulkBlockBotDirectMessages => 'Blokovat přímé zprávy od botů';

  @override
  String get guildNavbarGroupDm => 'Skupinová konverzace';

  @override
  String get guildNavbarCreateChannel => 'Vytvořit kanál';

  @override
  String get guildNavbarChannelType => 'Typ kanálu';

  @override
  String get guildNavbarTextChannel => 'Textový kanál';

  @override
  String get guildNavbarTextChannelDescription =>
      'Odesílejte zprávy, obrázky, GIFy a emotikony';

  @override
  String get guildNavbarVoiceChannel => 'Hlasový kanál';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Zůstaňte spolu hlasem, videem a sdílením obrazovky';

  @override
  String get guildNavbarLinkChannel => 'Odkaz na kanál';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Rychlý přístup k externí webové stránce nebo zdroji';

  @override
  String get guildNavbarNameLabel => 'Název';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Výběr typu kanálu';

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
  String get guildNavbarCreateCategory => 'Vytvořit kategorii';

  @override
  String get guildNavbarNewCategoryHint => 'Nová kategorie';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Pozvěte přátele do $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Příjemci budou přesměrováni do #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Hledat přátele';

  @override
  String get guildNavbarNoFriendsYet => 'Zatím žádní přátelé';

  @override
  String get guildNavbarNoResults => 'Žádné výsledky';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Nebo pošlete odkaz s pozvánkou příteli:';

  @override
  String get guildNavbarInviteLink => 'Odkaz na pozvánku';

  @override
  String get guildNavbarCopy => 'Kopírovat';

  @override
  String get guildNavbarCopied => 'Zkopírováno!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Váš odkaz s pozvánkou vyprší za 7 dní.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Tento odkaz na pozvánku nikdy nevyprší.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Váš odkaz s pozvánkou vyprší za $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Upravit odkaz na pozvánku';

  @override
  String get guildNavbarInviteLinkSettings => 'Nastavení odkazu na pozvánku';

  @override
  String get guildNavbarExpireAfter => 'Vyprší po';

  @override
  String get guildNavbarMaxUses => 'Max. počet použití';

  @override
  String get guildNavbarGrantTemporaryMembership => 'Udělit dočasné členství';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Členové budou odstraněni, když přejdou do offline režimu, pokud není přiřazena role';

  @override
  String get guildNavbarCreateNewLink => 'Vytvořit nový odkaz';

  @override
  String get guildNavbarSent => 'Odesláno';

  @override
  String get guildNavbarInvite => 'Pozvat';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Opustit komunitu';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Opravdu chcete opustit tuto komunitu? Nebudete již moci zobrazit žádné zprávy.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Opustit komunitu';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Smazat vaše zprávy v této komunitě?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Trvale smažte každou zprávu, kterou jste zde poslali, napříč všemi kanály. Nelze vrátit zpět.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Smazat mé zprávy';

  @override
  String get guildNavbarDeletedYourMessages => 'Vaše zprávy byly smazány';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Zprávy se nepodařilo smazat';

  @override
  String get guildNavbarRemoveOverride => 'Odebrat vlastní nastavení';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Ztlumeno do $formattedDate';
  }

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'Přístupné pouze personálu $productName';
  }

  @override
  String get guildNavbarInvitesPaused =>
      'Pozvánky jsou v této komunitě momentálně pozastaveny';

  @override
  String get guildNavbarDurationNever => 'nikdy';

  @override
  String get guildNavbarDuration30Minutes => '30 minut';

  @override
  String get guildNavbarDuration1Hour => '1 hodina';

  @override
  String get guildNavbarDuration6Hours => '6 hodin';

  @override
  String get guildNavbarDuration12Hours => '12 hodin';

  @override
  String get guildNavbarDuration1Day => '1 den';

  @override
  String get guildNavbarDuration7Days => '7 dní';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count sekund';
  }

  @override
  String get guildNavbarNever => 'Nikdy';

  @override
  String get guildNavbarNoLimit => 'Bez omezení';

  @override
  String get guildNavbarOneUse => '1 použití';

  @override
  String guildNavbarUses(int count) {
    return '$count použití';
  }

  @override
  String get guildMenuMarkAsRead => 'Označit jako přečtené';

  @override
  String get guildPeekMoreOptions => 'Další možnosti';

  @override
  String get guildMenuInviteMembers => 'Pozvat členy';

  @override
  String get guildMenuCommunitySettings => 'Nastavení komunity';

  @override
  String get guildMenuEditCommunityProfile => 'Upravit profil v komunitě';

  @override
  String get guildMenuUnmuteCommunity => 'Zrušit ztlumení komunity';

  @override
  String get guildMenuMuteCommunity => 'Ztlumit komunitu';

  @override
  String get guildMenuHideMutedChannels => 'Skrýt ztlumené kanály';

  @override
  String get guildMenuDebugCommunity => 'Ladit komunitu';

  @override
  String get guildMenuCopyCommunityId => 'Kopírovat ID komunity';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Do $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Obecné';

  @override
  String get guildMenuSettingsRoles => 'Role a oprávnění';

  @override
  String get guildMenuSettingsEmoji => 'Emoji';

  @override
  String get guildMenuSettingsStickers => 'Samolepky';

  @override
  String get guildMenuSettingsSafetyModeration => 'Bezpečnost a moderování';

  @override
  String get guildMenuSettingsActivityLog => 'Historie aktivit';

  @override
  String get guildMenuSettingsWebhooks => 'Webhooky';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'Vlastní odkaz na pozvánku';

  @override
  String get guildMenuSettingsDiscovery => 'Objevování';

  @override
  String get guildMenuSettingsMembers => 'Členové';

  @override
  String get guildMenuSettingsInviteLinks => 'Pozvánky';

  @override
  String get guildMenuSettingsBans => 'Bany';

  @override
  String get guildMenuSettingsChannels => 'Kanály';

  @override
  String get guildSettingsNoPermission =>
      'Nemáte oprávnění zobrazit tuto kartu nastavení.';

  @override
  String get guildSettingsOverviewIconTitle => 'Ikona';

  @override
  String get guildSettingsUploadImage => 'Nahrát obrázek';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Nahrajte banner pro svůj server.';

  @override
  String get guildSettingsOverviewNameTitle => 'Název';

  @override
  String get guildSettingsOverviewNameHint => 'Moje úžasná komunita';

  @override
  String get guildSettingsOverviewStatsTitle => 'Statistiky';

  @override
  String get guildSettingsOverviewMembers => 'Členové';

  @override
  String get guildSettingsOverviewOnline => 'Online';

  @override
  String get guildSettingsRolesDescription =>
      'Použijte role ke seskupení členů a přiřazení oprávnění.';

  @override
  String get guildSettingsCreateRole => 'Vytvořit roli';

  @override
  String get guildSettingsRolesListTitle => 'Role';

  @override
  String get guildSettingsRolesNewRole => 'Nová role';

  @override
  String get guildSettingsRolesDeleteRole => 'Smazat roli';

  @override
  String get guildSettingsRolesBackToRoles => 'Zpět na role';

  @override
  String get guildSettingsBackToSettings => 'Zpět do nastavení';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Upravit \"$name\"';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Upravit nastavení a oprávnění role';

  @override
  String get guildSettingsRolesDisplaySection => 'Zobrazení';

  @override
  String get guildSettingsRolesRoleName => 'Název role';

  @override
  String get guildSettingsRolesRoleColor => 'Barva role';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Zadejte barvu (hex, rgb(), hsl() nebo název) nebo použijte výběr.';

  @override
  String get guildSettingsRolesShowSeparately => 'Zobrazit tuto roli odděleně';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Zobrazuje členy s touto rolí v samostatné sekci v seznamu členů.';

  @override
  String get guildSettingsRolesAllowMentions => 'Povolit zmínky pro tuto roli';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'Členové s oprávněním „$permission“ mohou role vždy zmínit bez ohledu na toto nastavení.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Tlačítkem rychle vymažete všechna oprávnění.';

  @override
  String get guildSettingsRolesClearPermissions => 'Vymazat oprávnění';

  @override
  String get guildSettingsRolesPermissionsSection => 'Oprávnění';

  @override
  String get guildSettingsRolesSearchPermissions => 'Hledat oprávnění';

  @override
  String get guildSettingsRolesDenseLayout => 'Zhuštěné rozvržení';

  @override
  String get guildSettingsRolesComfyLayout => 'Pohodlné rozvržení';

  @override
  String get guildSettingsRolesSwitchToDenseLayout =>
      'Přepnout na zhuštěné rozvržení';

  @override
  String get guildSettingsRolesSwitchToComfyLayout =>
      'Přepnout na pohodlné rozvržení';

  @override
  String get guildSettingsRolesSingleColumn => 'Jeden sloupec';

  @override
  String get guildSettingsRolesTwoColumns => 'Dva sloupce';

  @override
  String get guildSettingsRolesSwitchToSingleColumn =>
      'Přepnout na jeden sloupec';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => 'Přepnout na dva sloupce';

  @override
  String get guildSettingsRolesNoPermissionsFound =>
      'Nenalezena žádná oprávnění';

  @override
  String get guildSettingsRolesCustomHoistOrder => 'Vlastní pořadí zobrazení';

  @override
  String get guildSettingsRolesHoistOrder => 'Pořadí zobrazení';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Obnovit výchozí';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Přetažením rolí si upravíte pořadí, ve kterém se zobrazují v seznamu členů.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Žádné samostatně zobrazené role. Aby se zde role zobrazila, zapněte u ní možnost „Zobrazit tuto roli samostatně“.';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'Tuto roli nemůžete upravit, protože je to vaše nejvyšší role nebo je nad vámi';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Potřebujete oprávnění „$permission“ k úpravě těchto oprávnění';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'Nemůžete upravovat roli, která je na stejné úrovni nebo vyšší než vaše nejvyšší role';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'Nemůžete udělit oprávnění, které sami nemáte';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'Toto oprávnění nelze odebrat, protože byste ho odebrali sami sobě';

  @override
  String get guildSettingsRolesUpdatedSuccess => 'Role úspěšně aktualizovány';

  @override
  String get guildSettingsRolesCreatedSuccess => 'Role byla úspěšně vytvořena';

  @override
  String get guildSettingsRolesDeletedSuccess => 'Role úspěšně smazána';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'Pořadí zobrazení bylo obnoveno na výchozí';

  @override
  String get guildSettingsRolesNameRequiredTitle => 'Název role je povinný';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Před uložením roli pojmenujte.';

  @override
  String get guildSettingsRolesCreateFailedTitle =>
      'Nepodařilo se vytvořit roli';

  @override
  String get guildSettingsRolesUpdateFailedTitle =>
      'Nepodařilo se aktualizovat role';

  @override
  String get guildSettingsRolesDeleteFailedTitle => 'Nepodařilo se smazat roli';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '„$name“ se nepodařilo smazat. Zkuste to znovu.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'Nepodařilo se obnovit pořadí rolí v seznamu členů';

  @override
  String get guildSettingsRolesTryAgainInAMoment =>
      'Zkuste to znovu za chvíli.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'Opravdu chcete smazat roli $name? Všichni členové s touto rolí o ni přijdou.';
  }

  @override
  String get permissionCategoryCommunityWide => 'Celá komunita';

  @override
  String get permissionCategoryMessagesMedia => 'Zprávy a média';

  @override
  String get permissionCategoryModeration => 'Moderování';

  @override
  String get permissionCategoryChannelAccess => 'Přístup k kanálu';

  @override
  String get permissionCategoryChannelManagement => 'Správa kanálů';

  @override
  String get permissionCategoryAudioVideo => 'Zvuk a video';

  @override
  String get permissionUnknown => 'Neznámé oprávnění';

  @override
  String get permissionAdministrator => 'Administrátor';

  @override
  String get permissionAdministratorDescription =>
      'Uděluje všechna oprávnění a obchází omezení kanálů. Jde o vysoce citlivé oprávnění.';

  @override
  String get permissionViewActivityLog => 'Zobrazit protokol aktivit';

  @override
  String get permissionViewActivityLogDescription =>
      'Číst protokol aktivit komunity se změnami a moderátorskými zásahy.';

  @override
  String get permissionManageCommunity => 'Spravovat komunitu';

  @override
  String get permissionManageCommunityDescription =>
      'Upravit globální nastavení, jako je název, popis a ikona.';

  @override
  String get permissionManageRoles => 'Spravovat role';

  @override
  String get permissionManageRolesDescription =>
      'Vytvářet, upravovat nebo mazat role pod vaší nejvyšší rolí. Umožňuje také upravovat vlastní oprávnění kanálů.';

  @override
  String get permissionManageChannels => 'Spravovat kanály';

  @override
  String get permissionManageChannel => 'Spravovat kanál';

  @override
  String get permissionManageChannelDescription =>
      'Přejmenovat a upravit nastavení tohoto kanálu.';

  @override
  String get permissionManagePermissions => 'Spravovat oprávnění';

  @override
  String get permissionManagePermissionsDescription =>
      'Upravovat vlastní oprávnění rolí a členů v tomto kanálu.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Vytvářet, upravovat nebo mazat webhooky pro tento kanál.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Zobrazit seznam členů tohoto kanálu.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Spravujte odkazy na pozvánky pro tento kanál.';

  @override
  String get permissionOverwriteDeny => 'Odepřít';

  @override
  String get permissionOverwriteInherit => 'Neutrální (zdědit)';

  @override
  String get permissionOverwriteAllow => 'Povolit';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Pomocí těchto tlačítek rychle nastavíte všechna oprávnění.';

  @override
  String get permissionManageChannelsDescription =>
      'Vytvářet, upravovat nebo mazat kanály a kategorie.';

  @override
  String get permissionKickMembers => 'Vyhazovat členy';

  @override
  String get permissionBanMembers => 'Banovat členy';

  @override
  String get permissionCreateInviteLinks => 'Vytvářet odkazy na pozvánky';

  @override
  String get permissionChangeOwnNickname => 'Změnit vlastní přezdívku';

  @override
  String get permissionChangeOwnNicknameDescription =>
      'Upravit vlastní přezdívku.';

  @override
  String get permissionManageNicknames => 'Spravovat přezdívky';

  @override
  String get permissionManageNicknamesDescription =>
      'Měnit přezdívky ostatních členů.';

  @override
  String get permissionCreateEmojiStickers => 'Vytvářet emoji a samolepky';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Nahrávat nová emoji a samolepky a spravovat vlastní výtvory.';

  @override
  String get permissionManageEmojiStickers => 'Spravovat emoji a samolepky';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Upravovat nebo mazat emoji a samolepky vytvořené ostatními členy.';

  @override
  String get permissionManageWebhooks => 'Spravovat webhooky';

  @override
  String get permissionManageWebhooksDescription =>
      'Vytvářet, upravovat nebo mazat webhooky.';

  @override
  String get permissionSendMessages => 'Odesílat zprávy';

  @override
  String get permissionSendTtsMessages =>
      'Odesílat zprávy převodem textu na řeč';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Odesílat zprávy převodem textu na řeč.';

  @override
  String get permissionManageMessages => 'Spravovat zprávy';

  @override
  String get permissionManageMessagesDescription =>
      'Mazat zprávy ostatních členů. Připínání se ovládá zvlášť.';

  @override
  String get permissionPinMessages => 'Připínat zprávy';

  @override
  String get permissionEmbedLinks => 'Zobrazovat náhledy odkazů';

  @override
  String get permissionAttachFiles => 'Připojit soubory';

  @override
  String get permissionMentionEveryone => 'Použijte @everyone/@here a @role';

  @override
  String get permissionMentionEveryoneDescription =>
      'Zmiňovat všechny nebo jakoukoli roli, i když u ní nejsou povoleny zmínky.';

  @override
  String get permissionUseExternalEmoji => 'Používat externí emoji';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Používat emoji z jiných komunit.';

  @override
  String get permissionUseExternalStickers => 'Používat externí samolepky';

  @override
  String get permissionAddReactions => 'Přidávat reakce';

  @override
  String get permissionAddReactionsDescription =>
      'Přidávat nové reakce ke zprávám.';

  @override
  String get permissionBypassSlowmode => 'Obejít pomalý režim';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Ignorovat omezení četnosti zpráv pro jednotlivé kanály.';

  @override
  String get permissionTimeOutMembers => 'Dočasně omezit členy';

  @override
  String get permissionTimeOutMembersDescription =>
      'Zabránit členům po určenou dobu odesílat zprávy, reagovat a připojovat se k hlasovým hovorům.';

  @override
  String get permissionViewChannel => 'Zobrazit kanál';

  @override
  String get permissionViewChannelMembers => 'Zobrazit členy kanálu';

  @override
  String get permissionViewChannelMembersDescription =>
      'Zobrazit seznam členů kanálů v této komunitě.';

  @override
  String get permissionConnect => 'Připojit';

  @override
  String get permissionSpeak => 'Mluvit';

  @override
  String get permissionStreamVideo => 'Streamovat video';

  @override
  String get permissionUseVoiceActivity => 'Používat hlasovou aktivitu';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Bez tohoto oprávnění je nutné používat režim Stisknutím mluvit.';

  @override
  String get permissionPrioritySpeaker => 'Prioritní mluvčí';

  @override
  String get permissionMuteMembers => 'Ztlumovat mikrofony členům';

  @override
  String get permissionDeafenMembers => 'Vypínat zvuk členům';

  @override
  String get permissionMoveMembers => 'Přesouvat členy';

  @override
  String get permissionMoveMembersDescription =>
      'Přetáhněte členy mezi kanály, ke kterým mají přístup.';

  @override
  String get permissionSetVoiceRegion => 'Nastavit hlasový region';

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
  String guildSettingsEmojiSlotInfo(int staticCount, int animatedCount) {
    return '$staticCount statických, $animatedCount animovaných slotů pro emotikony obsazeno';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Zatím žádné vlastní emotikony.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count samolepek nahráno';
  }

  @override
  String get guildSettingsStickersEmpty => 'Ještě žádné vlastní nálepky.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Ověření členů';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Zvolte, co musí mít členové, než budou moct přispívat nebo posílat přímé zprávy členům komunity.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Členové s rolemi mohou tyto kontroly obejít. Pro veřejné prostory doporučujeme povolit ověření.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Komunity uvedené v sekci Objevit vyžadují alespoň ověřený e-mail. Při zapnutém Objevit nelze vybrat možnost Žádné.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Obsah pro dospělé a upozornění na obsah';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Nastavte označování obsahu pro dospělé a volitelná varování před obsahem pro členy.';

  @override
  String get guildSettingsModerationMatureToggle => 'Obsah pro dospělé';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Označte tuto komunitu jako obsahující obsah pro dospělé.';

  @override
  String get guildSettingsVerificationNone => 'Žádné';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Ověření není vyžadováno.';

  @override
  String get guildSettingsVerificationLow => 'Nízká';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Vyžaduje ověřenou e-mailovou adresu.';

  @override
  String get guildSettingsVerificationMedium => 'Střední';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Vyžaduje ověřenou e-mailovou adresu a účet starý alespoň 5 minut.';

  @override
  String get guildSettingsVerificationHigh => 'Vysoká';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Vyžaduje vše ze střední úrovně a navíc členství v komunitě po dobu alespoň 10 minut.';

  @override
  String get guildSettingsVerificationHighest => 'Velmi vysoká';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Vyžaduje ověřené telefonní číslo.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Sledujte akce moderátorů napříč komunitou.';

  @override
  String get guildSettingsAuditLogEmpty => 'Zatím žádné záznamy';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Akce moderování a změny komunity se zobrazí zde.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Všichni uživatelé';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Všechny akce';

  @override
  String get guildSettingsAuditLogNoReason => 'Nebyl uveden žádný důvod.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Neznámý uživatel';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Při načítání protokolu aktivit se vyskytla chyba.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Nelze načíst protokoly aktivit';

  @override
  String get guildSettingsAuditLogReason => 'Důvod';

  @override
  String get guildSettingsAuditLogSomeone => 'někdo';

  @override
  String get guildSettingsAuditLogSomething => 'něco';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'neznámá entita';

  @override
  String get guildSettingsAuditLogNothing => 'nic';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Neznámý cíl';

  @override
  String get auditLogActionGuildUpdate => 'Komunita aktualizována';

  @override
  String get auditLogActionChannelCreate => 'Kanál vytvořen';

  @override
  String get auditLogActionChannelUpdate => 'Kanál aktualizován';

  @override
  String get auditLogActionChannelDelete => 'Kanál smazán';

  @override
  String get auditLogActionThreadCreate => 'Thread created';

  @override
  String get auditLogActionThreadUpdate => 'Thread updated';

  @override
  String get auditLogActionThreadDelete => 'Thread deleted';

  @override
  String get auditLogActionChannelOverwriteCreate => 'Přepsání kanálu přidáno';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Přepsání kanálu aktualizováno';

  @override
  String get auditLogActionChannelOverwriteDelete => 'Přepsání kanálu odebráno';

  @override
  String get auditLogActionMemberKick => 'Člen vyhozen';

  @override
  String get auditLogActionMemberPrune => 'Členové pročištěni';

  @override
  String get auditLogActionMemberBanAdd => 'Člen zabanován';

  @override
  String get auditLogActionMemberBanRemove => 'Ban člena zrušen';

  @override
  String get auditLogActionMemberUpdate => 'Člen upraven';

  @override
  String get auditLogActionMemberRoleUpdate => 'Role člena upraveny';

  @override
  String get auditLogActionMemberMove => 'Člen přesunut';

  @override
  String get auditLogActionMemberDisconnect => 'Člen odpojen';

  @override
  String get auditLogActionBotAdd => 'Bot přidán';

  @override
  String get auditLogActionRoleCreate => 'Role vytvořena';

  @override
  String get auditLogActionRoleUpdate => 'Role aktualizována';

  @override
  String get auditLogActionRoleDelete => 'Role smazána';

  @override
  String get auditLogActionInviteCreate => 'Pozvánka vytvořena';

  @override
  String get auditLogActionInviteUpdate => 'Invite updated';

  @override
  String get auditLogActionInviteDelete => 'Pozvánka smazána';

  @override
  String get auditLogActionWebhookCreate => 'Webhook vytvořen';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook aktualizován';

  @override
  String get auditLogActionWebhookDelete => 'Webhook smazán';

  @override
  String get auditLogActionEmojiCreate => 'Emoji vytvořeno';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji aktualizováno';

  @override
  String get auditLogActionEmojiDelete => 'Emoji smazáno';

  @override
  String get auditLogActionStickerCreate => 'Samolepka vytvořena';

  @override
  String get auditLogActionStickerUpdate => 'Samolepka aktualizována';

  @override
  String get auditLogActionStickerDelete => 'Samolepka smazána';

  @override
  String get auditLogActionMessageDelete => 'Zpráva smazána';

  @override
  String get auditLogActionMessageBulkDelete => 'Zprávy smazány';

  @override
  String get auditLogActionMessagePin => 'Zpráva připnuta';

  @override
  String get auditLogActionMessageUnpin => 'Zpráva odepnuta';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor updated the community settings.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor created the channel $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor updated the channel $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor deleted the channel $target.';
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
    return '$actor added channel permissions for $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor added channel permissions for $target in $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor updated channel permissions for $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor updated channel permissions for $target in $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor removed channel permissions for $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor removed channel permissions for $target in $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor kicked $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor banned $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor unbanned $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor updated $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor updated roles for $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor pruned inactive members.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor pruned members inactive for $days days.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor moved $target to another voice channel.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor moved $target to $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor disconnected $target from voice.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor added the bot $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor created the role $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor updated the role $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor deleted the role $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor created the invite $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor created the invite $target for $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor updated the invite $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor updated the invite $target for $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor deleted the invite $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor deleted the invite $target for $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor created the webhook $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor aktualizoval webhook $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor odstranil webhook $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor přidal emoji $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor aktualizoval emoji $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor odstranil emoji $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor přidal samolepku $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor aktualizoval samolepku $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor odstranil samolepku $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor smazal zprávu.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor smazal zprávu v kanálu $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor smazal více zpráv.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor smazal $count zpráv.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor smazal více zpráv v kanálu $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor smazal $count zpráv v kanálu $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor připnul zprávu.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor připnul zprávu v kanálu $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor odepnul zprávu.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor odepnul zprávu v kanálu $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor provedl auditní akci na $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Aktualizováno $field z $oldValue na $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Nastaveno $field na $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Vymazáno $field (bylo $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Aktualizováno $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Přejmenováno společenství na $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Aktualizována ikona společenství.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Přejmenován kanál na $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Vymazáno téma.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Aktualizováno téma na $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent => 'Povoleno zralé obsah.';

  @override
  String get auditLogChangeDisabledMatureContent => 'Zakázáno zralé obsah.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Nastavena přezdívka na $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Odstraněna přezdívka $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Uživatel umlčen.';

  @override
  String get auditLogChangeUnmutedMember => 'Uživatel odmlčen.';

  @override
  String get auditLogChangeDeafenedMember => 'Uživatel ohlušen.';

  @override
  String get auditLogChangeUndeafenedMember => 'Uživatel odohlušen.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Přidány role $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Odebrány role $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Kanál: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Zpráva: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Pozváno kým $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Smazány # zprávy.',
      one: 'Smazána # zpráva.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Odstraněni # členové.',
      one: 'Odstraněn # člen.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires => 'Toto pozvání nikdy nevyprší.';

  @override
  String get auditLogOptionTemporaryMembership => 'Uděluje dočasné členství.';

  @override
  String get auditLogOptionPermanentMembership => 'Uděluje trvalé členství.';

  @override
  String get guildSettingsLoadMore => 'Načíst další';

  @override
  String get guildSettingsLoadingMore => 'Načítání...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Zobrazte a spravujte všechny webhooky nakonfigurované v rámci vaší komunity.';

  @override
  String get guildSettingsWebhooksEmpty => 'Žádné webhooky';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'Tato komunita zatím nemá žádné webhooky. Přejděte na $channelSettingsPath a vytvořte jeden.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'K zobrazení a úpravě webhooků pro tuto komunitu potřebujete oprávnění „$permission“.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle =>
      'Nepodařilo se načíst webhooky';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'Při načítání webhooků došlo k chybě. Zkuste to znovu.';

  @override
  String get guildSettingsWebhooksUpdated => 'Webhooky aktualizovány';

  @override
  String get guildSettingsWebhooksUpdateFailed =>
      'Nepodařilo se aktualizovat webhooky';

  @override
  String get guildSettingsUnknownChannel => 'Neznámý kanál';

  @override
  String get guildSettingsCopyUrl => 'Zkopírovat URL';

  @override
  String get guildSettingsCopiedUrl => 'Adresa URL zkopírována do schránky';

  @override
  String get guildSettingsDeleteWebhook => 'Smazat webhook';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Nastavte vlastní odkaz pro pozvánku na váš server.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Uložit';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Použití';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count použití';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Zařaďte svou komunitu do Objevování, aby ji ostatní mohli najít a připojit se k ní.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle => 'Nedostatek členů';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Vaše komunita musí mít alespoň $count členů, než ji bude možné zařadit do sekce Objevit.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Stav:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'Čekající';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Schváleno';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Odmítnuto';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Odebráno';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Důvod: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'Vaše komunita je uvedena v Objevování. Níže můžete upravit údaje v záznamu nebo ho odstranit stažením žádosti.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Vaše žádost čeká na posouzení. Stále můžete upravovat údaje v záznamu nebo žádost stáhnout.';

  @override
  String get guildSettingsDiscoveryCategory => 'Kategorie';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Vyberte kategorii, která nejlépe popisuje vaši komunitu. Můžete to kdykoli změnit.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Hlavní jazyk';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'Jazyk, kterým mluví většina vaší komunity. Používá se k filtrování výsledků v Objevování.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Popis';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Popište, o čem je vaše komunita';

  @override
  String get guildSettingsDiscoveryDescriptionRequired => 'Je vyžadován popis.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'Popis musí mít alespoň $minLength znaků.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'Popis nesmí být delší než $maxLength znaků.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Vlastní štítky';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Až $maxTags štítků pomůže lidem najít vaši komunitu. Zobrazují se ve vyhledávání v sekci Objevit.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint =>
      'Přidejte štítek a stiskněte Enter';

  @override
  String get guildSettingsDiscoveryAddTag => 'Přidat';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Odebrat značku $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle =>
      'Nepodařilo se přidat štítek';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'Štítky musí mít 2 až $maxLength znaků a musí být alfanumerické.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'Můžete přidat pouze $maxTags značek.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Použít';

  @override
  String get guildSettingsDiscoverySave => 'Uložit';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Stáhnout žádost';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Žádost o zařazení do Objevování odeslána';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Záznam v Objevování aktualizován';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Žádost o zařazení do Objevování stažena';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Žádost se nepodařilo stáhnout';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Zkuste to znovu za chvíli.';

  @override
  String get guildSettingsMembersDescription =>
      'Vyhledávejte a spravujte členy serveru.';

  @override
  String get guildSettingsMembersSearchHint =>
      'Hledat podle uživatelského jména nebo ID';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count členů';
  }

  @override
  String get guildMembersRecentTitle => 'Nedávní členové';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Zobrazuje se $displayedCount z celkového počtu $totalCount členů';
  }

  @override
  String get guildMembersSort => 'Seřadit';

  @override
  String get guildSettingsMembersSortNewest => 'Nejnovější nahoře';

  @override
  String get guildMembersSortOldest => 'Nejstarší napřed';

  @override
  String get guildMembersColumnName => 'Název';

  @override
  String get guildMembersColumnMemberSince => 'Členem od';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'Registrace ve službě $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Způsob připojení';

  @override
  String get guildMembersColumnRoles => 'Role';

  @override
  String get guildMembersColumnActions => 'Akce';

  @override
  String get guildMembersFilterMemberSince => 'Filtrovat podle data připojení';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Filtrovat podle data vytvoření účtu';

  @override
  String get guildMembersFilterJoinMethod =>
      'Filtrovat podle způsobu připojení';

  @override
  String get guildMembersFilterRoles => 'Filtrovat podle rolí';

  @override
  String get guildMembersFilterAll => 'Vše';

  @override
  String get guildMembersFilterPast1Hour => 'Poslední hodina';

  @override
  String get guildMembersFilterPast24Hours => 'Posledních 24 hodin';

  @override
  String get guildMembersFilterPast7Days => 'Posledních 7 dní';

  @override
  String get guildMembersFilterPast2Weeks => 'Poslední 2 týdny';

  @override
  String get guildMembersFilterPast3Weeks => 'Poslední 3 týdny';

  @override
  String get guildMembersFilterPast4Weeks => 'Poslední 4 týdny';

  @override
  String get guildMembersFilterPast3Months => 'Poslední 3 měsíce';

  @override
  String get guildMembersFilterCustomRange => 'Vlastní rozsah...';

  @override
  String get guildMembersDateRangeTitle => 'Vlastní rozmezí dat';

  @override
  String get guildMembersDateAfter => 'Po datu';

  @override
  String get guildMembersDateBefore => 'Před datem';

  @override
  String get guildMembersClearAll => 'Vymazat vše';

  @override
  String get guildMembersRowsPerPage => 'Řádků na stránku';

  @override
  String get guildMembersEmptySearch => 'Nikdo neodpovídá tomuto hledání.';

  @override
  String get guildMembersLoadError =>
      'Při načítání členů se něco pokazilo. Zkuste to prosím později.';

  @override
  String get guildMembersIndexing => 'Indexuji členy…';

  @override
  String get guildMembersGoToPage => 'Přejít na stránku';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'Přejít na stránku $page';
  }

  @override
  String get guildMembersJumpToPage => 'Přejít na stránku';

  @override
  String get guildMembersJoinSourceCreator => 'Tvůrce komunity';

  @override
  String get guildMembersJoinSourceInvite => 'Pozvat';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Pozvánka ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Pozván/a od $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'Vlastní odkaz na pozvánku';

  @override
  String get guildMembersJoinSourceBotInvite => 'Pozvánka bota';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'Správce platformy';

  @override
  String get guildMembersJoinSourceDiscovery => 'Objevování';

  @override
  String get guildMembersJoinMethodUnknown => 'Neznámý';

  @override
  String get guildMembersCommunityOwner => 'Vlastník komunity';

  @override
  String get guildMembersViewAllRoles => 'Zobrazit všechny role';

  @override
  String get guildMembersJoinedJustNow => 'Právě teď';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'před $count minutami',
      one: 'před 1 minutou',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'před # hodinami',
      one: 'před hodinou',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'před # dny',
      one: 'před 1 dnem',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Členové';

  @override
  String get guildMembersChannelListSelected => 'Členové, vybráno';

  @override
  String get guildSettingsInvitesTitle => 'Pozvánky';

  @override
  String get guildSettingsInvitesDescription =>
      'Zobrazit všechny pozvánky pro tuto komunitu. Chcete-li vytvořit novou pozvánku, přejděte na kanál a použijte tlačítko pozvat.';

  @override
  String get guildSettingsInvitesEmpty => 'Žádné odkazy na pozvánky';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Tato komunita zatím nemá žádné odkazy k pozvání. Přejděte na kanál a vytvořte pozvánku, abyste mohli pozvat lidi.';

  @override
  String get guildSettingsInvitesLoadFailedTitle =>
      'Nepodařilo se načíst pozvánky';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Při načítání pozvánek došlo k chybě. Zkuste to znovu.';

  @override
  String get guildSettingsInvitesTryAgain => 'Zkusit znovu';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Zobrazit datum vytvoření místo data vypršení platnosti';

  @override
  String get guildSettingsInvitesPauseInvites => 'Pozastavit pozvánky';

  @override
  String get guildSettingsInvitesEnableInvites => 'Povolit pozvánky';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Pozastavit pozvánky pro tuto komunitu';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Povolit pozvánky pro tuto komunitu';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Pozastavit pozvánky? Noví uživatelé se nebudou moct připojit přes odkazy na pozvánky, dokud je znovu nepovolíte. Stávající členové nebudou ovlivněni.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Povolit pozvánky? Uživatelé se budou moci znovu připojit k této komunitě pomocí odkazů na pozvánky.';

  @override
  String get guildSettingsInvitesPause => 'Pozastavit';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Pozvánky pro tuto komunitu jsou pozastaveny.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Pozvánky jsou pozastaveny, protože aplikace $productName zjistila možný nájezd. Noví uživatelé se teď nemohou připojit.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Autor pozvánky:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Kanál:';

  @override
  String get guildSettingsInvitesLabelCode => 'Kód:';

  @override
  String get guildSettingsInvitesLabelUses => 'Použití:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Vytvořeno:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Vyprší:';

  @override
  String get guildSettingsInvitesUnknown => 'Neznámý';

  @override
  String get guildSettingsInvitesNoCategory => 'Bez kategorie';

  @override
  String get guildSettingsInvitesExpired => 'Vypršela platnost';

  @override
  String get guildSettingsInvitesNever => 'Nikdy';

  @override
  String get guildSettingsInvitesCopyLink => 'Kopírovat odkaz na pozvánku';

  @override
  String get guildSettingsInvitesRevoke => 'Zrušit pozvánku';

  @override
  String get guildSettingsInvitesRevokeFailedTitle =>
      'Nepodařilo se zrušit pozvánku';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'Odkaz může být stále funkční. Zkuste to prosím za chvíli znovu.';

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
      'Zobrazit a spravovat zabanované uživatele.';

  @override
  String get guildSettingsBansSearchHint => 'Hledat bany';

  @override
  String get guildSettingsBansEmpty => 'Žádní zabanovaní uživatelé.';

  @override
  String get guildSettingsBanPermanent => 'Trvalý ban';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Vyprší $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Vyprší';

  @override
  String get guildSettingsUnban => 'Zrušit ban';

  @override
  String get guildSettingsBansLoading => 'Načítání zabanovaných uživatelů';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Nebyly nalezeny žádné bany odpovídající vašemu hledání.';

  @override
  String get guildSettingsBanDetailsTitle => 'Podrobnosti o banu';

  @override
  String get guildSettingsBanViewDetails => 'Zobrazit podrobnosti';

  @override
  String get guildSettingsBannedOn => 'Ban udělen dne';

  @override
  String get guildSettingsBannedBy => 'Ban udělil(a)';

  @override
  String get guildSettingsRevokeBanTitle => 'Zrušit ban';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Opravdu chcete zrušit ban pro $displayName? Bude se moci znovu připojit ke komunitě.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Ban pro $displayName zrušen';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Nepodařilo se načíst bany. Zkuste to znovu.';

  @override
  String get guildSettingsRevokeBanError =>
      'Nepodařilo se zrušit ban. Zkuste to znovu.';

  @override
  String get guildSettingsCommunitySettings => 'Nastavení komunity';

  @override
  String get guildSettingsDeleteCommunity => 'Smazat komunitu';

  @override
  String get guildSettingsDeleteCommunityConfirm =>
      'Opravdu chcete smazat tuto komunitu? Tuto akci nelze vrátit zpět. Všechny kanály, zprávy a nastavení budou trvale smazány.';

  @override
  String get guildSettingsCommunityDeleted => 'Komunita smazána';

  @override
  String get guildSettingsDeleteCommunityFailed =>
      'Nepodařilo se smazat tuto komunitu';

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
      'Spravujte profil své komunity, kanály a výchozí nastavení.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Vizuální identita';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Aktualizujte ikonu, název, banner a pozadí pozvánky';

  @override
  String get guildSettingsOverviewBannerUpload => 'Nahrát banner';

  @override
  String get guildSettingsOverviewIdleTitle => 'Nastavení neaktivity';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Nastavit AFK kanál a časový limit';

  @override
  String get guildSettingsOverviewSystemTitle => 'Systém a uvítání';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Vybrat cíl pro systémové a uvítací zprávy';

  @override
  String get guildSettingsOverviewNotificationsTitle => 'Výchozí oznámení';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Komunity s více než 250 lidmi jsou automaticky přepnuty na nastavení „Pouze zmínky“. Původní nastavení se zachová a obnoví se, pokud počet členů komunity klesne pod 250.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Pokročilé';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Povolit flexibilní názvy textových kanálů';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Skrýt korunku vlastníka komunity';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Odpojený banner';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Zobrazí banner v samostatné sekci pod záhlavím komunity.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Nahrát ikonu';

  @override
  String get guildSettingsOverviewRemoveImage => 'Odebrat';

  @override
  String get guildSettingsOverviewSplashTitle => 'Pozadí pozvánky';

  @override
  String get guildSettingsOverviewEmbedSplashTitle =>
      'Pozadí vložené pozvánky v chatu';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Zobrazuje se ve vložených náhledech pozvánek v chatu.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Nahrát pozadí';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'Žádný banner komunity';

  @override
  String get guildSettingsOverviewNoInviteBackground => 'Žádné pozadí pozvánky';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Náhled';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Podívejte se, jak vaše pozvánka vypadá pro návštěvníky.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Názvy textových kanálů';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Korunka vlastníka komunity';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Nastavte, zda se vedle vlastníka komunity zobrazí ikona koruny';

  @override
  String get guildSettingsSplashCardAlignment => 'Zarovnání karty';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Na střed';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Vlevo';

  @override
  String get guildSettingsSplashAlignmentRight => 'Vpravo';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Platí pouze na dostatečně širokých obrazovkách.';

  @override
  String get permissionReadMessageHistory => 'Číst historii zpráv';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Změnit, co mohou vidět uživatelé bez oprávnění „$permission“';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Použijte vyhrazené modální okno k nastavení prahu historie zpráv pro členy, kteří nemají oprávnění $permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Otevřít nastavení časové hranice historie zpráv';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Časová hranice historie zpráv';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Zapnout časovou hranici historie zpráv';

  @override
  String get guildSettingsMessageHistoryThresholdDate =>
      'Datum zpřístupnění historie';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Členové bez oprávnění Číst historii zpráv si mohou prohlížet zprávy odeslané po tomto datu.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Časová hranice historie zpráv aktualizována';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Povolit velká písmena a mezery v názvech textových kanálů. Při vypnutí mohou názvy obsahovat pouze malá písmena, spojovníky a podtržítka.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Skryje ikonu koruny vedle vlastníka komunity na všech místech.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Animované ikony vyžadují funkci komunity Animovaná ikona.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Animované bannery vyžadují funkci komunity Animovaný banner.';

  @override
  String get guildSettingsAfkChannel => 'Kanál pro neaktivní uživatele (AFK)';

  @override
  String get guildSettingsAfkChannelHint =>
      'Přesunout členy do tohoto kanálu, když jsou AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Žádný AFK kanál';

  @override
  String get guildSettingsAfkTimeout => 'Časový limit neaktivity';

  @override
  String get guildSettingsAfkTimeout1Min => '1 minuta';

  @override
  String get guildSettingsAfkTimeout5Min => '5 minut';

  @override
  String get guildSettingsAfkTimeout15Min => '15 minut';

  @override
  String get guildSettingsAfkTimeout30Min => '30 minut';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 hodina';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds sekund';
  }

  @override
  String get guildSettingsSystemChannel => 'Cílový kanál';

  @override
  String get guildSettingsSystemChannelHint =>
      'Zprávy s uvítáním a systémové zprávy se zobrazí zde.';

  @override
  String get guildSettingsNoSystemChannel => 'Žádný systémový kanál';

  @override
  String get guildSettingsHideJoinMessages => 'Skrýt zprávy o připojení';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Potlačí zprávy o připojení v cílovém kanálu.';

  @override
  String get guildSettingsDefaultNotifications => 'Výchozí nastavení oznámení';

  @override
  String get guildSettingsNotificationsAll => 'Všechny zprávy';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Upozornit na všechny zprávy';

  @override
  String get guildSettingsNotificationsMentions => 'Pouze zmínky';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Upozornit pouze na zmínky';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max 10 MB. Minimum: 960×540 px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max 10 MB. Minimum: 960×540 px (16:9). Zobrazuje se ve vkládaných odkazech v chatu.';

  @override
  String get guildSettingsModerationDescription =>
      'Nastavte ověřování, filtrování obsahu a nastavení pro obsah pro dospělé.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Komunity uvedené v Discovery mají omezené možnosti moderování.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Filtrování obsahu';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Automaticky kontrolovat zprávy na explicitní obsah v kanálech, které nejsou označeny jako určené pro dospělé.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Komunity uvedené v Discovery musí skenovat všechny členy. Toto nastavení nelze změnit, dokud je povoleno Discovery.';

  @override
  String get guildSettingsContentFilterOff => 'Vypnuto';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Nechte komunitu, ať se moderuje sama';

  @override
  String get guildSettingsContentFilterNoRole =>
      'Filtrovat zprávy členů bez rolí';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Doporučeno pro většinu komunit';

  @override
  String get guildSettingsContentFilterAll => 'Filtrovat zprávy všech členů';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Maximální ochrana pro prostory vhodné pro rodiny';

  @override
  String get guildSettingsModerationMatureOff => 'Vypnuto';

  @override
  String get guildSettingsModerationMatureOn => 'Zapnuto';

  @override
  String get guildSettingsContentWarningToggle =>
      'Zobrazit upozornění na obsah';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Přepíná výzvu k souhlasu před vstupem do jakéhokoli kanálu.';

  @override
  String get guildSettingsContentWarningText => 'Vlastní text upozornění';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Obsahuje citlivý obsah.';

  @override
  String get guildSettingsModeration2faTitle => 'Požadavek na 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'Vyžadujte dvoufaktorové ověření pro moderátory, než budou moci zabanovat, vyhodit, ztlumit nebo odstranit zprávy.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Vyžadovat dvoufaktorové ověřování pro moderátorské zásahy';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Toto nastavení může změnit pouze vlastník komunity';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Pro změnu tohoto nastavení zapněte na svém účtu dvoufaktorové ověřování';

  @override
  String get guildSettingsEmojiSearchHint => 'Hledat emoji';

  @override
  String get guildSettingsEmojiUploadTitle => 'Nahrát emoji';

  @override
  String get guildSettingsEmojiSlotsTitle => 'Sloty na emoji';

  @override
  String get guildSettingsEmojiDropZone => 'Přetáhněte sem soubory emoji';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Nepodařilo se načíst emoji. Zkuste to prosím později.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'Nebylo nalezeno žádné emoji odpovídající vašemu hledání.';

  @override
  String get guildSettingsEmojiNoSlots => 'Žádné volné sloty pro emoji';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Dosáhli jste maximálního počtu emoji. Chcete-li uvolnit místo, odstraňte některé stávající emoji.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Názvy emoji musí mít alespoň 2 znaky a mohou obsahovat písmena, čísla a podtržítka. Emoji musí být menší než $maxSize. Statické obrázky se automaticky zmenší na 128 × 128 pixelů a zkomprimují. Animované emoji a soubory SVG musí limit splňovat už před nahráním.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'Nahrávání emoji';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# emojis',
      one: '# emoji',
    );
    return 'Nahrávám $_temp0. Může to chvíli trvat.';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'Nepodařilo se nahrát emoji. Zkuste to znovu.';

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Některé emoji nebylo možné přidat';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'Zkontrolujte tyto soubory a zkuste to znovu s menšími nebo jednoduššími obrázky.';

  @override
  String get guildSettingsEmojiRenameTitle => 'Přejmenovat emoji';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2–32 znaků, písmena, čísla, podtržítka.';

  @override
  String get guildSettingsEmojiColumnEmoji => 'Emoji';

  @override
  String get guildSettingsEmojiColumnName => 'Název';

  @override
  String get guildSettingsEmojiColumnUploader => 'Nahráno uživatelem';

  @override
  String get guildSettingsEmojiUnknownUploader => 'Neznámý';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Smazat emoji';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'Smazat :$name:? Nelze vrátit zpět.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Vymazat toto emoji z úložiště a CDN';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'Název emoji musí mít alespoň 2 znaky';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'Název emoji může mít maximálně 32 znaků';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Neplatný název emoji';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Nepodařilo se přejmenovat toto emoji';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'Název byl vrácen na původní. Zkuste to prosím za chvíli znovu.';

  @override
  String get guildSettingsEmojiGoneTitle => 'Toto emoji již neexistuje';

  @override
  String get guildSettingsEmojiGoneBody =>
      'Možná byla položka smazána. Název byl obnoven na původní.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'Toto emoji nemůžete přejmenovat';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'Nemáte oprávnění přejmenovat toto emoji. Název byl vrácen na původní.';

  @override
  String get guildSettingsEmojiRateLimitedTitle => 'Postupujete příliš rychle';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'Počkejte chvíli a zkuste přejmenování znovu.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Toto emoji se nepodařilo smazat';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'Toto emoji nemůžete smazat';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'Povolit ostatním klonovat vaše emoji';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'Když je tato funkce zapnutá, členové jiných komunit můžou používat zkratku \"Klonovat\" na jedno kliknutí u vašich vlastních emoji. To jim ale nezabrání v tom, aby si obrázek uložili a nahráli ho sami.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Povolit ostatním klonovat vaše nálepky';

  @override
  String get guildSettingsCloneStickerDescription =>
      'Když je tato funkce zapnutá, členové jiných komunit můžou použít zkratku \"Klonovat\" jedním kliknutím v aplikaci na vaše vlastní nálepky. To jim ale nebrání v tom, aby si obrázek uložili a nahráli ho sami.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Tuto možnost mohou změnit pouze členové s oprávněním „$permission“.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'Nepodařilo se aktualizovat klonování emoji';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Nepodařilo se aktualizovat klonování samolepek';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Neanimované emotikony ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Animované emotikony ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Hledat samolepky';

  @override
  String get guildSettingsStickerSlotsTitle => 'Místa pro samolepky';

  @override
  String get guildSettingsStickerUploadTitle => 'Nahrát samolepku';

  @override
  String get guildSettingsStickerDropZone =>
      'Přetáhněte sem soubor se samolepkou (vždy jen jeden)';

  @override
  String get guildSettingsStickerDensity => 'Hustota samolepek';

  @override
  String get guildSettingsStickerDensityCozy => 'Útulné';

  @override
  String get guildSettingsStickerDensityCompact => 'Kompaktní';

  @override
  String get guildSettingsStickersLoadFailedTitle =>
      'Nepodařilo se načíst samolepky';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Při načítání samolepek došlo k chybě. Zkuste to znovu.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Nebyly nalezeny žádné samolepky odpovídající vašemu hledání.';

  @override
  String get guildSettingsStickersEmptySearch =>
      'Nebyly nalezeny žádné samolepky';

  @override
  String get guildSettingsStickerNoSlots => 'Žádné volné sloty pro samolepky';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Dosáhli jste maximálního počtu samolepek. Chcete-li uvolnit místo, smažte některé stávající samolepky.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Samolepky jsou uloženy ve velikosti 320x320 pixelů a musí být menší než $maxSize. Statické obrázky se automaticky upraví a komprimují. Animované samolepky a SVG soubory musí již odpovídat limitu.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle =>
      'Nepodporovaný soubor samolepky';

  @override
  String get guildSettingsStickerAddTitle => 'Přidat samolepku';

  @override
  String get guildSettingsStickerEditTitle => 'Upravit samolepku';

  @override
  String get guildSettingsStickerNameLabel => 'Název';

  @override
  String get guildSettingsStickerNameHint => 'Moje super samolepka';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Popis';

  @override
  String get guildSettingsStickerDescriptionHint => 'Popište samolepku';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Štítky ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Přidat štítek';

  @override
  String get guildSettingsStickerTagAdd => 'Přidat';

  @override
  String get guildSettingsStickerNameRequired => 'Je potřeba zadat název';

  @override
  String get guildSettingsStickerNameTooShort =>
      'Název musí mít alespoň 2 znaky';

  @override
  String get guildSettingsStickerNameTooLong =>
      'Název musí mít maximálně 30 znaků';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'Popis musí mít maximálně 500 znaků';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'Nepodařilo se vytvořit tuto samolepku';

  @override
  String get guildSettingsStickerTooLargeTitle => 'Samolepka je příliš velká';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'Samolepku se nepodařilo dostatečně zkomprimovat';

  @override
  String get guildSettingsStickerDeleteTitle => 'Smazat samolepku';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'Smazat „$name“? Nelze vrátit zpět.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Vymazat tuto samolepku z úložiště a CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Nepodařilo se odstranit tento sticker';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'Tuto nálepku nemůžete smazat';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Chcete-li vytvořit webhook, otevřete $channelSettingsPath. Všechny existující webhooky můžete zde stále upravovat a organizovat.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'Vaše vlastní URL nebude fungovat, pokud alespoň jeden kanál nebude viditelný pro všechny.';

  @override
  String get guildSettingsVanityUrlRemove => 'Odebrat';

  @override
  String get guildSettingsBannedUsersTitle => 'Zabanovaní uživatelé';

  @override
  String get guildSettingsInvitesTableInviter => 'Autor pozvánky';

  @override
  String get guildSettingsInvitesTableChannel => 'Kanál';

  @override
  String get guildSettingsInvitesTableCode => 'Kód';

  @override
  String get guildSettingsInvitesTableUses => 'Použití';

  @override
  String get guildSettingsInvitesTableCreated => 'Vytvořeno';

  @override
  String get guildSettingsInvitesTableExpires => 'Vyprší';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtrovat podle uživatele';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtrovat podle akce';

  @override
  String get createDm => 'Vytvořit soukromou konverzaci';

  @override
  String get createGroupDm => 'Vytvořit skupinovou konverzaci';

  @override
  String get createDmNewMessage => 'Nová zpráva';

  @override
  String get createDmSelectFriends => 'Vybrat přátele';

  @override
  String get createDmChooseFriendsSubtitle =>
      'Vyberte přátele, kterým chcete poslat zprávu.';

  @override
  String get createDmSearchFriends => 'Hledat přátele';

  @override
  String get createDmNoFriendsFound => 'Žádní přátelé nenalezeni';

  @override
  String get createDmNoFriendsYet => 'Ještě nemáte žádné přátele';

  @override
  String get createDmClaimToStartDms =>
      'Pro zahájení soukromých konverzací dokončete registraci účtu.';

  @override
  String get createDmVerifyToStartDms =>
      'Ověřte svůj e-mail, abyste mohli zahajovat soukromé konverzace.';

  @override
  String get createDmVerifyYourEmail => 'Ověřte svůj e-mail';

  @override
  String get createDmNewGroup => 'Nová skupina';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Vytvořit novou skupinu s uživatelem $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'Potvrdit novou skupinu';

  @override
  String get createDmCreateNewGroup => 'Vytvořit novou skupinu';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'Odebrat účet $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'Už máte skupinu s těmito uživateli. Opravdu chcete vytvořit novou? To je taky v pořádku!';

  @override
  String get createDmNoActivityYet => 'Zatím žádná aktivita';

  @override
  String get createDmSomeUsersCantBeAdded => 'Některé uživatele nelze přidat';

  @override
  String get createDmCreateWithoutThem => 'Vytvořit bez nich';

  @override
  String get createDmUnaddableIntro =>
      'Tyto osoby nelze přidat do této skupinové konverzace:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Vytvořit skupinový DM se zbývajícími $count příjemci a ostatní přeskočit?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Nezůstali žádní příjemci, se kterými by bylo možné vytvořit skupinovou konverzaci.';

  @override
  String get createDmUnaddableUserNotFound => 'Uživatel nenalezen';

  @override
  String get createDmUnaddableBlocked =>
      'Tomuto uživateli nemůžete poslat zprávu';

  @override
  String get createDmUnaddableNotFriends => 'Není ve vašem seznamu přátel';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Nepovoluje přidání do skupinových konverzací';

  @override
  String get createDmFailed =>
      'Nepodařilo se vytvořit konverzaci. Zkuste to znovu.';

  @override
  String get dmListMessagesTitle => 'Zprávy';

  @override
  String get dmListDirectMessagesTitle => 'Přímé zprávy';

  @override
  String get keybindsSearchShortcuts => 'Hledat zkratky';

  @override
  String get keybindSectionDefaults => 'Výchozí';

  @override
  String get keybindSectionMessages => 'Zprávy';

  @override
  String get keybindSectionNavigation => 'Navigace';

  @override
  String get keybindSectionDragAndDrop => 'Přetáhnout';

  @override
  String get keybindSectionChat => 'Chat';

  @override
  String get keybindSectionVoiceAndVideo => 'Zvuk a video';

  @override
  String get keybindSectionMisc => 'Různé';

  @override
  String get keybindActionShowShortcutsList =>
      'Zobrazit seznam klávesových zkratek';

  @override
  String get keybindActionCopyText => 'Kopírovat text';

  @override
  String get keybindActionMarkUnread => 'Označit jako nepřečtené';

  @override
  String get keybindActionFocusTextarea => 'Přesunout fokus do textového pole';

  @override
  String get keybindActionSwitchCommunities => 'Přepínat mezi komunitami';

  @override
  String get keybindActionSwitchChannels => 'Přepínat mezi kanály';

  @override
  String get keybindActionHistoryBack =>
      'Přejít zpět v historii zobrazených kanálů';

  @override
  String get keybindActionHistoryForward =>
      'Přejít vpřed v historii zobrazených kanálů';

  @override
  String get keybindActionJumpUnreadChannels => 'Přejít na nepřečtené kanály';

  @override
  String get keybindActionJumpMentionChannels =>
      'Přejít mezi nepřečtenými kanály se zmínkami';

  @override
  String get keybindActionJumpCurrentCall => 'Přejít na aktuální hovor';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Přepínat mezi poslední komunitou a Přímými zprávami';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Přepnout na předchozí komunitu nebo Přímé zprávy';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Přepnout na další komunitu nebo Přímé zprávy';

  @override
  String get keybindActionGoToDms => 'Přejít na přímé zprávy';

  @override
  String get keybindActionGoToFirstCommunity => 'Přejít na první komunitu';

  @override
  String get keybindActionGoToSecondCommunity => 'Přejít na druhou komunitu';

  @override
  String get keybindActionGoToThirdCommunity => 'Přejít na třetí komunitu';

  @override
  String get keybindActionGoToFourthCommunity => 'Přejít na čtvrtou komunitu';

  @override
  String get keybindActionGoToFifthCommunity => 'Přejít na pátou komunitu';

  @override
  String get keybindActionGoToSixthCommunity => 'Přejít na šestou komunitu';

  @override
  String get keybindActionGoToSeventhCommunity => 'Přejít na sedmou komunitu';

  @override
  String get keybindActionGoToEighthCommunity => 'Přejít na osmou komunitu';

  @override
  String get keybindActionToggleQuickSwitcher =>
      'Zobrazit nebo skrýt rychlé přepínání';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'Vytvořit komunitu nebo se k nějaké připojit';

  @override
  String get keybindActionStartDragAndDrop => 'Spustit přetažení';

  @override
  String get keybindActionMove => 'Přesunout';

  @override
  String get keybindActionDropItem => 'Pustit položku';

  @override
  String get keybindActionCancel => 'Zrušit';

  @override
  String get keybindActionMarkCommunityRead =>
      'Označit komunitu jako přečtenou';

  @override
  String get keybindActionMarkChannelRead => 'Označit kanál jako přečtený';

  @override
  String get keybindActionStartGroupDm => 'Založit skupinovou konverzaci';

  @override
  String get keybindActionTogglePinnedMessages =>
      'Zobrazit nebo skrýt připnuté zprávy';

  @override
  String get keybindActionToggleInbox => 'Zobrazit nebo skrýt panel Doručené';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Označit první kanál v doručených zprávách jako přečtený';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Označit všechny kanály v doručených zprávách jako přečtené';

  @override
  String get keybindActionToggleMemberList =>
      'Přepnout seznam členů nebo hlasový chat';

  @override
  String get keybindActionToggleEmojiPicker =>
      'Zobrazit nebo skrýt výběr emoji';

  @override
  String get keybindActionToggleGifPicker => 'Zobrazit nebo skrýt výběr GIFů';

  @override
  String get keybindActionToggleStickerPicker =>
      'Zobrazit nebo skrýt výběr samolepek';

  @override
  String get keybindActionScrollChatUp => 'Posunout chat nahoru';

  @override
  String get keybindActionScrollChatDown => 'Posunout chat dolů';

  @override
  String get keybindActionJumpOldestUnread =>
      'Přejít na nejstarší nepřečtenou zprávu';

  @override
  String get keybindActionFocusComposer => 'Přesunout fokus do textového pole';

  @override
  String get keybindActionUploadFile => 'Nahrát soubor';

  @override
  String get keybindActionCopyChannelLink => 'Kopírovat odkaz na kanál';

  @override
  String get keybindActionToggleSavedMedia =>
      'Zobrazit nebo skrýt uložená média';

  @override
  String get keybindActionSendVoiceMessage => 'Odeslat hlasovou zprávu';

  @override
  String get keybindActionAnswerCall => 'Přijmout příchozí hovor';

  @override
  String get keybindActionDeclineCall => 'Odmítnout příchozí hovor';

  @override
  String get keybindActionStartDmCall =>
      'Zahájit hovor v soukromé nebo skupinové konverzaci';

  @override
  String get keybindActionToggleSoundboard =>
      'Zobrazit nebo skrýt zvukový panel';

  @override
  String get keybindActionToggleCompactCallView =>
      'Rozbalit nebo sbalit kompaktní zobrazení hovoru';

  @override
  String get keybindActionPushToTalkPriority => 'Stisknutím mluvit (priorita)';

  @override
  String get keybindActionVoiceActivityPriority => 'Priorita hlasové aktivity';

  @override
  String get keybindActionOpenHelp => 'Otevřít nápovědu';

  @override
  String get keybindActionSearchMessages => 'Hledat zprávy';

  @override
  String get keybindActionOpenContextMenu => 'Otevřít kontextovou nabídku';

  @override
  String get keybindActionOpenSettings => 'Otevřít nastavení';

  @override
  String get keybindActionOpenThemeStudio =>
      'Otevřít studio motivů v samostatném okně';

  @override
  String get keybindActionZoomIn => 'Přiblížit';

  @override
  String get keybindActionZoomOut => 'Oddálit';

  @override
  String get keybindActionZoomReset => 'Obnovit přiblížení';

  @override
  String get clipboardPasteFailed =>
      'Nepodařilo se vložit. Schránka byla prázdná nebo pro tuto aplikaci zablokovaná.';

  @override
  String get homeQuickActionDms => 'Zprávy';

  @override
  String get assistantNeedsLogin => 'Nejprve otevřete Fluxer a přihlaste se.';

  @override
  String get assistantNotInVoice => 'Nejste v hovoru.';

  @override
  String get assistantNotFound => 'Fluxer to nenašel.';

  @override
  String get assistantDmsDisabled =>
      'Přímé zprávy jsou na této instanci zakázány.';

  @override
  String get assistantFailed => 'Fluxer to nemohl dokončit.';

  @override
  String get assistantOkMuted => 'Mikrofon ztlumen.';

  @override
  String get assistantOkUnmuted => 'Ztlumení mikrofonu zrušeno.';

  @override
  String get assistantOkLeftVoice => 'Opustili jste hlasový kanál.';

  @override
  String get assistantOkJoinedVoice => 'Připojuji se k hlasovému kanálu.';

  @override
  String get assistantOkStartedCall => 'Zahajuji hovor.';

  @override
  String assistantOkStatusSet(String status) {
    return 'Stav nastaven na $status.';
  }

  @override
  String get assistantOkOpened => 'Otevírám Fluxer.';

  @override
  String get assistantOkMessageSent => 'Zpráva odeslána.';

  @override
  String get assistantOkCustomStatusSet => 'Vlastní stav aktualizován.';

  @override
  String get assistantOkCustomStatusCleared => 'Vlastní stav vymazán.';

  @override
  String get guildNavbarAnnouncementChannel => 'Kanál s oznámeními';

  @override
  String get guildNavbarAnnouncementChannelDescription =>
      'Zveřejňujte aktualizace, které mohou ostatní komunity sledovat ve svých vlastních kanálech';

  @override
  String get channelDetailsAnnouncementChannel => 'Kanál s oznámeními';

  @override
  String get channelSettingsAnnouncementChannel => 'Kanál s oznámeními';

  @override
  String get channelSettingsAnnouncementChannelDescription =>
      'Umožní ostatním komunitám sledovat tento kanál a dostávat kopie toho, co publikujete.';

  @override
  String get channelSettingsStopAnnouncementTitle =>
      'Přestat být kanálem s oznámeními?';

  @override
  String channelSettingsStopAnnouncementBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count kanálů sleduje tento kanál. Převodem na textový kanál se tato sledování zruší.',
      many:
          '$count kanálu sleduje tento kanál. Převodem na textový kanál se tato sledování zruší.',
      few:
          '$count kanály sledují tento kanál. Převodem na textový kanál se tato sledování zruší.',
      one:
          '$count kanál sleduje tento kanál. Převodem na textový kanál se toto sledování zruší.',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsStopAnnouncementUnknown =>
      'Převodem tohoto kanálu na textový kanál se zruší sledování všech kanálů, které ho sledují.';

  @override
  String get channelSettingsConvertChannel => 'Převést';

  @override
  String get channelSettingsConvertFailed =>
      'Nepodařilo se převést tento kanál';

  @override
  String get channelSettingsChannelHasFollowers =>
      'Tento kanál stále sledují jiné kanály. Před převodem tato sledování odstraňte.';

  @override
  String get channelMenuFollow => 'Sledovat kanál';

  @override
  String get channelFollowTitle => 'Sledovat tento kanál';

  @override
  String get channelFollowBody =>
      'Vyberte, kam se mají publikované zprávy odesílat. Kdykoli se můžete odhlásit v nastavení komunity → Webhooky.';

  @override
  String get channelFollowCommunity => 'Komunita';

  @override
  String get channelFollowChannel => 'Kanál';

  @override
  String get channelFollowSelectCommunity => 'Select a community';

  @override
  String get channelFollowSelectChannel => 'Select a channel';

  @override
  String get channelFollowAgeWarning =>
      'Toto je kanál s věkovým omezením. Aktualizace mohou jít pouze do kanálů s věkovým omezením.';

  @override
  String get channelFollowContentWarning =>
      'Tento kanál má varování o obsahu. Aktualizace lze posílat pouze do kanálů s varováním o obsahu nebo věkovým omezením.';

  @override
  String get channelFollowHiddenHint =>
      'Komunity a kanály, kde nemůžete spravovat webhooky, jsou skryté.';

  @override
  String get channelFollowEmpty =>
      'Nemůžete spravovat webhooky v žádné komunitě. Požádejte administrátora, aby tento kanál sledoval.';

  @override
  String get channelFollowSubmit => 'Sledovat';

  @override
  String get channelFollowFailed => 'Nepodařilo se sledovat tento kanál.';

  @override
  String get channelFollowSuccessTitle => 'Aktualizace jsou na cestě!';

  @override
  String channelFollowSuccessBody(String sourceName, String targetName) {
    return 'Zprávy publikované v $sourceName se zobrazí v #$targetName.';
  }

  @override
  String get channelFollowSuccessDismiss => 'Rozumím!';

  @override
  String get channelFollowBarrier =>
      'Sledujte tento kanál a dostávejte tato oznámení do kanálu, který si vyberete.';

  @override
  String get channelHeaderFollow => 'Sledovat kanál';

  @override
  String get chatMessagePublish => 'Publikovat';

  @override
  String get chatMessagePublished => 'Publikováno';

  @override
  String get chatMessagePublishConfirmTitle => 'Publikovat zprávu?';

  @override
  String get chatMessagePublishConfirmBody =>
      'Tím se odešle kopie do každého kanálu, který sleduje tento kanál.';

  @override
  String get chatMessagePublishedToast => 'Zpráva publikována';

  @override
  String get chatMessageAlreadyPublished => 'Tato zpráva je již publikována.';

  @override
  String get chatMessagePublishFailedTitle =>
      'Nepodařilo se publikovat tuto zprávu';

  @override
  String get chatMessagePublishFailedBody =>
      'Něco se pokazilo. Zkuste to za chvíli znovu.';

  @override
  String get chatMessagePublishLimitTitle => 'Zpomalte';

  @override
  String chatMessagePublishLimitBody(String duration) {
    return 'Znovu můžete publikovat za $duration.';
  }

  @override
  String get chatMessagePublishLimitUnknown =>
      'Publikujete příliš rychle. Zkuste to za chvíli znovu.';

  @override
  String get chatMessageDeletePublished =>
      'Tím se také odstraní kopie, které byly odeslány do kanálů, které tento kanál sledují.';

  @override
  String get chatMessageEditPublishedTitle => 'Upravit publikovanou zprávu?';

  @override
  String get chatMessageEditPublishedBody =>
      'Tím se aktualizují kopie, které byly odeslány do kanálů, které tento kanál sledují.';

  @override
  String get chatMessageEditPublishedSave => 'Uložit';

  @override
  String get chatMessageEditLimitTitle => 'Zpomalte';

  @override
  String chatMessageEditLimitBody(String duration) {
    return 'Tuto zveřejněnou zprávu můžete znovu upravit za $duration.';
  }

  @override
  String get chatMessageEditLimitUnknown =>
      'Tuto publikovanou zprávu upravujete příliš rychle. Zkuste to znovu za chvíli.';

  @override
  String get chatMessageOriginalDeleted => '[Původní zpráva smazána]';

  @override
  String get userTagCommunity => 'Komunita';

  @override
  String systemFollowAdd(String username, String source) {
    return '$username nastavil(a) tento kanál, aby sledoval $source. Zprávy publikované tam se zobrazí zde.';
  }

  @override
  String systemPreviewFollowAdd(String username, String source) {
    return '$username nastavil(a) tento kanál, aby sledoval $source.';
  }

  @override
  String get publishNudgeNotSent => 'Ještě neodesláno sledujícím.';

  @override
  String get publishNudgeHideForever => 'Znovu nezobrazovat';

  @override
  String get publishNudgeDismiss => 'Zavřít';

  @override
  String get channelSettingsFollowedChannels => 'Sledované kanály';

  @override
  String get channelSettingsFollowedChannelsDescription =>
      'Kanály s oznámeními, které tento kanál sleduje. Přestaňte sledovat, abyste přestali dostávat kopie.';

  @override
  String get guildSettingsFollowedChannelsDescription =>
      'Kanály s oznámeními, které sledují kanály v této komunitě.';

  @override
  String channelSettingsFollowedFrom(String guildName, String channelName) {
    return 'Z $guildName #$channelName';
  }

  @override
  String get channelSettingsFollowedPaused =>
      'Aktualizace jsou pozastaveny, protože zdrojový kanál již není k dispozici.';

  @override
  String channelSettingsUnfollowTitle(String name) {
    return 'Přestat sledovat $name?';
  }

  @override
  String get channelSettingsUnfollowBody =>
      'Tento kanál přestane přijímat kopie z daného kanálu s oznámeními.';

  @override
  String get channelSettingsUnfollow => 'Přestat sledovat';

  @override
  String get channelSettingsUnfollowFailed =>
      'Couldn\'t unfollow this channel.';

  @override
  String channelSettingsDeliveredTo(String channelName) {
    return 'Delivered to #$channelName';
  }

  @override
  String get crosspostCommunityTitle => 'Komunita';

  @override
  String get crosspostGoToCommunity => 'Přejít do komunity';

  @override
  String get crosspostJoinCommunity => 'Připojit se ke komunitě';

  @override
  String get crosspostSourceFailed =>
      'Nepodařilo se načíst tuto komunitu. Zkuste to za chvíli znovu.';

  @override
  String get crosspostSourceUnavailable =>
      'This community is no longer available';

  @override
  String crosspostMembers(int count) {
    return '$count členů';
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
      other: '$count minut',
      many: '$count minuty',
      few: '$count minuty',
      one: '$count minuta',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sekund',
      many: '$count sekundy',
      few: '$count sekundy',
      one: '$count sekunda',
    );
    return '$_temp0';
  }

  @override
  String get channelUnsupportedTitle => 'Nepodporovaný typ kanálu';

  @override
  String get channelUnsupportedBody =>
      'Tato verze aplikace nepodporuje tento typ kanálu.';

  @override
  String get channelDetailsUnsupportedChannel => 'Nepodporovaný kanál';

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
