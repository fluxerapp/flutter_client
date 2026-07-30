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
      'Něco je špatně se servery.\nMělo by se to za chvilku opravit!';

  @override
  String get gatewayReconnectingToast => 'Připojování…';

  @override
  String get gatewayConnectedToast => 'Připojeno';

  @override
  String get sessionExpiredToast =>
      'Your session has expired. Please sign in again.';

  @override
  String splashStartupFailed(String error) {
    return 'Spuštění selhalo: $error';
  }

  @override
  String get retry => 'Zkusit znovu';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Spojení ztraceno';

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
      'Přihlaste se pomocí poskytovatele jednotného přihlašování vaší organizace.';

  @override
  String get failedToStartSso => 'Spuštění SSO selhalo';

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
  String get register => 'Registrovat';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Ověřte, že jste člověk';

  @override
  String get captchaDescription =>
      'Musíme se ujistit, že nejste robot. Dokončete prosím ověření níže.';

  @override
  String get captchaSwitchToHcaptcha =>
      'Máte problémy? Zkuste místo toho hCaptcha';

  @override
  String get captchaSwitchToTurnstile => 'Zkuste místo toho Turnstile';

  @override
  String get cancel => 'Zrušit';

  @override
  String get ipAuthCheckEmail => 'Zkontrolujte svůj e-mail';

  @override
  String ipAuthDescription(String email) {
    return 'Poslali jsme e-mail s odkazem pro autorizaci tohoto přihlášení. Otevřete si prosím schránku pro $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Spojení ztraceno';

  @override
  String get ipAuthConnectionLostDescription =>
      'Ztratili jsme spojení při čekání na autorizaci. Zkuste to prosím znovu.';

  @override
  String get ipAuthLinkExpired => 'Platnost odkazu pro přihlášení vypršela';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Platnost tohoto odkazu pro autorizaci vypršela. Znovu se prosím přihlaste.';

  @override
  String get ipAuthResendEmail => 'Znovu poslat e-mail';

  @override
  String get ipAuthResent => 'Znovu odesláno';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Zpět';

  @override
  String get mfaTitle => 'Dvoufaktorové ověření';

  @override
  String get mfaChooseMethod => 'Vyberte metodu ověření';

  @override
  String get mfaMethodTotp => 'Aplikace pro ověření';

  @override
  String get mfaMethodWebauthn => 'Bezpečnostní klíč / Klíč';

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
  String get accountSelectorDescription =>
      'Vyberte účet pro pokračování nebo přidejte jiný.';

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
      'Tímto odeberete uloženou relaci pro tento účet.';

  @override
  String get accountRemoveOnlyDescription =>
      'Tímto odeberete jediný uložený účet na tomto zařízení.';

  @override
  String get accountExpired => 'Platnost vypršela';

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
  String get statusIdle => 'Nečinný';

  @override
  String get statusDnd => 'Nerušit';

  @override
  String get statusInvisible => 'Neviditelný';

  @override
  String get statusOffline => 'Offline';

  @override
  String get statusUntilIChangeIt => 'Dokud ho nezměním';

  @override
  String get statusDontClear => 'Neodstranit';

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
  String get statusDndDescription => 'Nebudete dostávat oznámení na ploše';

  @override
  String get statusInvisibleDescription => 'Budete se zobrazovat jako offline';

  @override
  String get customStatusSetTitle => 'Nastavit vlastní stav';

  @override
  String get customStatusCurrentHint => 'Vlastní stav';

  @override
  String get customStatusClear => 'Vymazat vlastní stav';

  @override
  String get customStatusPlaceholder => 'Co se děje?';

  @override
  String get customStatusChooseEmoji => 'Vybrat emoji';

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
  String get suspendedPermanent => 'Trvalý';

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
      'Zadejte svou e-mailovou adresu a my vám zašleme odkaz na resetování hesla.';

  @override
  String get forgotPasswordSubmit => 'Odeslat odkaz na resetování';

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
  String get resetPasswordConfirm => 'Potvrdit nové heslo';

  @override
  String get resetPasswordSubmit => 'Resetovat heslo';

  @override
  String get resetPasswordMismatch => 'Hesla se neshodují.';

  @override
  String get registerTitle => 'Vytvořit účet';

  @override
  String get registerDisplayName => 'Zobrazované jméno (volitelné)';

  @override
  String get registerDisplayNameHint => 'Jak vás mají lidé oslovovat?';

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
  String get registerConsentTerms => 'podmínkami služby';

  @override
  String get registerConsentAnd => ' a ';

  @override
  String get registerConsentPrivacy => 'zásadami ochrany osobních údajů';

  @override
  String get registerConfirmPassword => 'Potvrdit heslo';

  @override
  String get registerSubmit => 'Vytvořit účet';

  @override
  String get registerHaveAccount => 'Už máte účet? ';

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
  String get errorInvalidEmailOrPassword => 'Neplatný e-mail nebo heslo.';

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
  String get embedInviteUnknownTitle => 'Neznámé pozvání';

  @override
  String get embedInviteUnknownSubtitle => 'Zkuste požádat o nové pozvání.';

  @override
  String get embedInviteUnavailable => 'Pozvání není k dispozici';

  @override
  String get inviteAcceptTitle => 'Byli jste pozváni do';

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
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'Připojit se do skupiny';

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
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Přístup do kanálu odepřen';

  @override
  String get channelAccessDeniedDescription =>
      'Nemáte přístup do kanálu, kam byla tato zpráva odeslána.';

  @override
  String get messageJumpLinkNoAccess => 'Žádný přístup';

  @override
  String get okay => 'Dobře';

  @override
  String get embedThemeTitle => 'Sdílené téma';

  @override
  String get embedThemeSubtitle => 'Tento klient nepodporuje vlastní témata.';

  @override
  String get embedThemeUnavailableButton => 'Témata nejsou k dispozici';

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
    return 'Ztlumit $guildName';
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
  String get notificationMobilePush => 'Mobilní oznámení push';

  @override
  String get notificationOverrides => 'Přepsání oznámení';

  @override
  String get notificationSelectChannel => 'Vyberte kanál nebo kategorii';

  @override
  String get notificationOnlyAtMentions => 'Pouze @zmínění';

  @override
  String get notificationMuteChannel => 'Ztlumit kanál';

  @override
  String get notificationUnmuteChannel => 'Zrušit ztlumení kanálu';

  @override
  String get notificationUseCategoryDefault => 'Use Category Default';

  @override
  String get notificationUseCommunityDefault => 'Use Community Default';

  @override
  String get notificationNoCategory => 'Žádná kategorie';

  @override
  String get dmMarkAsRead => 'Označit jako přečtené';

  @override
  String get dmMuteConversation => 'Ztlumit DM';

  @override
  String get dmUnmuteConversation => 'Zrušit ztlumení DM';

  @override
  String get dmPinDm => 'Připnout DM';

  @override
  String get dmUnpinDm => 'Odepnout DM';

  @override
  String get dmAlwaysShowInSidebar => 'Vždy zobrazit v postranním panelu';

  @override
  String get dmRemoveFromAlwaysShown => 'Odebrat z vždy zobrazených';

  @override
  String get dmCloseDm => 'Zavřít DM';

  @override
  String get dmCloseDmConfirmTitle => 'Zavřít DM';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Opravdu chcete zavřít váš DM s $username? Můžete ho kdykoli znovu otevřít.';
  }

  @override
  String get dmCopyChannelId => 'Zkopírovat ID kanálu';

  @override
  String get dmChannelIdCopied => 'ID kanálu zkopírováno';

  @override
  String get dmCopyUserId => 'Zkopírovat ID uživatele';

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
  String get dmPinGroupDm => 'Připnout skupinový DM';

  @override
  String get dmUnpinGroupDm => 'Odepnout skupinovou DM';

  @override
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
  }

  @override
  String get dmFavoriteDm => 'Označit DM jako oblíbenou';

  @override
  String get dmUnfavoriteDm => 'Odznačit DM jako oblíbenou';

  @override
  String get dmFavoriteGroupDm => 'Označit skupinovou DM jako oblíbenou';

  @override
  String get dmUnfavoriteGroupDm => 'Odznačit skupinovou DM jako oblíbenou';

  @override
  String get dmChangeFriendNickname => 'Změnit přezdívku přítele';

  @override
  String get dmRemoveFriend => 'Odebrat přítele';

  @override
  String get dmAddFriend => 'Přidat přítele';

  @override
  String get dmAcceptFriendRequest => 'Přijmout žádost o přátelství';

  @override
  String get dmIgnoreFriendRequest => 'Ignorovat žádost o přátelství';

  @override
  String get dmFriendRequestSent => 'Odeslaná žádost o přátelství';

  @override
  String get dmUnblock => 'Odblokovat';

  @override
  String get dmDebugUser => 'Ladit uživatele';

  @override
  String get dmDebugChannel => 'Ladit kanál';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => 'Připnutá DM';

  @override
  String get dmUnpinned => 'Odepnutá DM';

  @override
  String get dmMuted => 'Ztlumená DM';

  @override
  String get dmUnmuted => 'Zrušit ztlumení DM';

  @override
  String get dmRemoveFriendConfirmTitle => 'Odebrat přítele';

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
  String get addFriendClaimTitle => 'Nárokujte si svůj účet';

  @override
  String get addFriendClaimDescription =>
      'Nárokujte si svůj účet, abyste mohli posílat žádosti o přátelství.';

  @override
  String get addFriendVerifyTitle => 'Ověřte svůj e-mail';

  @override
  String get addFriendVerifyDescription =>
      'Před odesláním žádostí o přátelství si musíte ověřit svou e-mailovou adresu.';

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
    return 'Ignorovat žádost o přátelství od $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Zrušit žádost';

  @override
  String get addFriendCancelRequestFailed =>
      'Žádost o přátelství se nepodařilo zrušit. Zkuste to znovu.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Právě teď nepřijímají žádosti o přátelství.';

  @override
  String get addFriendUnblockFirst =>
      'Nejprve je odblokujte a poté odešlete žádost o přátelství.';

  @override
  String get addFriendCannotSendToSelf =>
      'Nemůžete si poslat žádost o přátelství sami sobě.';

  @override
  String get addFriendAlreadyFriends => 'S tímto uživatelem už jste přátelé.';

  @override
  String get addFriendClaimToSend =>
      'Dokončete registraci a odešlete žádosti o přátelství.';

  @override
  String get addFriendSendFailedGeneric =>
      'Žádost o přátelství se nepodařilo odeslat. Zkuste to znovu.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Systém';

  @override
  String get emojiSearchPlaceholder => 'Najděte emotikon svých snů';

  @override
  String get emojiSearchEmpty =>
      'Žádné emotikony neodpovídají vašemu vyhledávání';

  @override
  String get emojiAutocompleteDefaultLabel => 'Výchozí emotikon';

  @override
  String get emojiFrequentlyUsed => 'Často používané';

  @override
  String get emojiTabGifs => 'GIFy';

  @override
  String get emojiTabMedia => 'Média';

  @override
  String get emojiTabStickers => 'Nálepky';

  @override
  String get emojiTabEmojis => 'Emotikony';

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
  String get gifPickerTrending => 'Populární GIFy';

  @override
  String get gifPickerNoResultsTitle => 'Žádné výsledky hledání';

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
  String get externalLinkWarningTitle => 'Varování před externím odkazem';

  @override
  String get externalLinkWarningLeaving => 'Chystáte se opustit Fluxer';

  @override
  String get externalLinkWarningDescription =>
      'Externí odkazy mohou být nebezpečné. Buďte prosím opatrní.';

  @override
  String get externalLinkWarningDestinationUrl => 'Cílová URL:';

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
      'Odstranit sledovací parametry z URL';

  @override
  String get externalLinkStripTrackingDescription =>
      'Automaticky odstraní sledovací parametry (jako utm_source, fbclid, gclid) z URL ve zprávách, které posíláte. Odkaz vyčistí, než se dostane k ostatním.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Důvěřovat všem externím odkazům?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Tímto důvěřujete všem externím odkazům a přeskočíte varování pro každou doménu. Vaše stávající důvěryhodné domény budou nahrazeny. Je to méně bezpečné.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Důvěřovat všem';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Přestat důvěřovat všem odkazům?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Varování před externími odkazy se znovu zobrazí. Budete muset přidávat důvěryhodné domény jednotlivě.';

  @override
  String get externalLinkStopTrustingAllAction => 'Zakázat důvěřovat všem';

  @override
  String get externalLinkTrustedAllDescription =>
      'Všem externím odkazům je důvěřováno. Varování se nebudou zobrazovat.';

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
  String get changeYourFluxerTag => 'Změnit váš FluxerTag';

  @override
  String get fluxerTagInputLabel => 'FluxerTag';

  @override
  String get fluxerTagDescriptionBase =>
      'Uživatelská jména mohou obsahovat pouze písmena (a-z, A-Z), čísla (0-9) a podtržítka. Uživatelská jména nerozlišují malá a velká písmena.';

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
  String get fluxerTagAlreadyTaken => 'FluxerTag je již obsazen';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'FluxerTag $username#$discriminator je již obsazen. Pokračováním automaticky znovu vygenerujeme váš diskriminátor.';
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
      'Pokud uložíte tento FluxerTag, váš vlastní 4místný tag se po skončení předplatného Plutonium vrátí na náhodné číslo. Pokud se vaše předplatné neobnoví, budete mít 3denní lhůtu, než se tag změní.';

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
  String get fluxerTagUpdated => 'FluxerTag aktualizován';

  @override
  String get fluxerTagUpdateFailed =>
      'Nepodařilo se aktualizovat FluxerTag. Zkuste to prosím znovu.';

  @override
  String get continueAction => 'Pokračovat';

  @override
  String get profileCustomizationTitle => 'Přizpůsobení profilu';

  @override
  String get profileCustomizationDescription =>
      'Upravte vzhled svého profilu a zobrazte náhled v reálném čase';

  @override
  String get usernameLabel => 'Uživatelské jméno';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Ověřte svůj účet, abyste mohli změnit svůj FluxerTag';

  @override
  String get changeFluxerTag => 'Změnit FluxerTag';

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
      'Přizpůsobí barvu okraje a banneru na vašem profilu';

  @override
  String get aboutMeLabel => 'O mně';

  @override
  String get aboutMeHelperText => 'Můžete používat odkazy, emoji a Markdown.';

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
  String get maskVisionaryAsSubscription => 'Skrýt Visionary jako předplatné';

  @override
  String get maskVisionaryDescription =>
      'Zobrazit váš Visionary jako běžné předplatné';

  @override
  String get hideVisionaryIdBadge => 'Skrýt odznak Visionary ID';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Skrýt odznak Visionary ID (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Odstraňte svůj odznak Visionary ID';

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
  String get profilePreviewMemberSince => 'Členem Fluxeru od';

  @override
  String get unclaimedAccountTitle => 'Nevyžádaný účet';

  @override
  String get unclaimedAccountDescription =>
      'Váš účet ještě není vyžádán. Bez e-mailu a hesla můžete ztratit přístup. Vyžádejte si svůj účet nyní a zabezpečte ho.';

  @override
  String get claimAccount => 'Vyžádat účet';

  @override
  String get profileTypeLabel => 'Typ profilu';

  @override
  String get profileTypeGlobal => 'Globální profil';

  @override
  String get profileTypeGuildDescription =>
      'Upravujete svůj profil pro tuto komunitu. Tento profil bude viditelný pouze v této komunitě a přepíše váš globální profil.';

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
  String get profileNoteVisibility => '(viditelné pouze pro vás)';

  @override
  String get profileNoteEmpty => 'Zatím žádná poznámka.';

  @override
  String get sudoTitle => 'Ověřte svou identitu';

  @override
  String get sudoDescription => 'Tato akce vyžaduje ověření k pokračování.';

  @override
  String get sudoAuthenticatorCode => 'Ověřovací kód';

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
  String get securityLoginEmailSectionDescription =>
      'Spravujte e-mailovou adresu, kterou používáte k přihlášení do Fluxeru';

  @override
  String get securityLoginEmailAddressLabel => 'E-mailová adresa';

  @override
  String get securityLoginNoEmailSet => 'Není nastavena žádná e-mailová adresa';

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
  String get securityLoginNoPasswordSet => 'Není nastaveno žádné heslo';

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
  String get passwordChangeConfirmPassword => 'Potvrdit nové heslo';

  @override
  String get passwordChangeSubmit => 'Změnit heslo';

  @override
  String get passwordChangeSuccess => 'Heslo změněno';

  @override
  String get passwordChangePasswordsDoNotMatch => 'Hesla se neshodují';

  @override
  String get passwordChangeInvalidCode => 'Neplatný nebo vypršel platnost kódu';

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
  String get emailChangeNewEmailTitle => 'Zadat nový e-mail';

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
  String get emailChangeInvalidCode => 'Neplatný nebo vypršel platnost kódu';

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
  String get enable => 'Povolit';

  @override
  String get disable => 'Zakázat';

  @override
  String get delete => 'Smazat';

  @override
  String get save => 'Uložit';

  @override
  String get securityTfaSectionTitle => 'Dvoufaktorové ověřování';

  @override
  String get securityTfaSectionDescription =>
      'Přidejte svému účtu další vrstvu zabezpečení';

  @override
  String get securityTfaAuthenticatorApp => 'Aplikace pro ověřování';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Dvoufaktorové ověřování je povoleno';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Použijte aplikaci pro ověřování k generování kódů pro dvoufaktorové ověřování';

  @override
  String get securityTfaBackupCodes => 'Záložní kódy';

  @override
  String get securityTfaBackupCodesDescription =>
      'Zobrazte a spravujte své záložní kódy pro obnovení účtu';

  @override
  String get securityTfaViewCodes => 'Zobrazit kódy';

  @override
  String get securityPasskeysSectionTitle => 'Heslové klíče';

  @override
  String get securityPasskeysSectionDescription =>
      'Používejte heslové klíče pro přihlašování bez hesla a dvoufaktorové ověřování';

  @override
  String get securityPasskeysRegistered => 'Registrované heslové klíče';

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
  String get securityPasskeysAdd => 'Přidat heslový klíč';

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
  String get securityPasskeysDeleteTitle => 'Smazat heslový klíč';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Opravdu chcete smazat heslový klíč „$name“?';
  }

  @override
  String get securityPasskeyNameTitle => 'Pojmenovat heslový klíč';

  @override
  String get securityPasskeyNameLabel => 'Název heslového klíče';

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
  String get securityClaimTitle => 'Bezpečnostní funkce';

  @override
  String get securityClaimDescription =>
      'Ověřte svůj účet a získejte přístup k bezpečnostním funkcím, jako je dvoufaktorové ověřování a hesla.';

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
  String get totpDisableTitle => 'Odebrat aplikaci pro ověřování';

  @override
  String get totpDisableDescription =>
      'Zadejte 6místný kód ze své aplikace pro ověřování pro deaktivaci dvoufaktorového ověřování.';

  @override
  String get totpDisableSuccess => 'Dvoufaktorové ověřování deaktivováno';

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
      'Zadejte své telefonní číslo. Pošleme vám ověřovací kód přes SMS.';

  @override
  String get phoneAddSendCode => 'Odeslat kód';

  @override
  String get phoneVerifyTitle => 'Ověřit telefonní číslo';

  @override
  String get phoneVerifyDescription =>
      'Zadejte ověřovací kód zaslaný na vaše telefonní číslo.';

  @override
  String get phoneAddSuccess => 'Telefonní číslo přidáno';

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
  String get dangerZoneSectionTitle => 'Nebezpečná zóna';

  @override
  String get dangerZoneSectionDescription => 'Nevratné a destruktivní akce';

  @override
  String get dangerZoneDisableTitle => 'Deaktivovat účet';

  @override
  String get dangerZoneDisableDescription =>
      'Dočasně deaktivujte svůj účet. Můžete jej později znovu aktivovat přihlášením.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Deaktivace vašeho účtu vás odhlásí ze všech relací. Svůj účet můžete kdykoli znovu aktivovat přihlášením.';

  @override
  String get dangerZoneDeleteTitle => 'Smazat účet';

  @override
  String get dangerZoneDeleteDescription =>
      'Trvale smažte svůj účet a všechna přidružená data. Tuto akci nelze vrátit zpět.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Před smazáním účtu zrušte svou aktivní předplatné Plutonium v nastavení Plutonium.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'Nelze smazat účet';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Nemůžete smazat svůj účet, dokud vlastníte komunity. Nejprve přeneste vlastnictví následujících komunit:';

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
      'Opravdu chcete smazat svůj účet? Tato akce naplánuje váš účet k trvalému smazání.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Proces smazání můžete zrušit do 14 dnů';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Po 14 dnech bude váš účet trvale smazán';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Jakmile bude smazání zpracováno, nebudete moci obnovit přístup ke svému účtu';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Po smazání účtu nebudete moci smazat své odeslané zprávy';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Pokud chcete nejprve exportovat svá data nebo smazat zprávy, navštivte prosím sekci Dashboard ochrany soukromí v Nastavení uživatele, než budete pokračovat.';

  @override
  String get claimAccountTitle => 'Nárokujte si svůj účet';

  @override
  String get claimAccountDescription =>
      'Nárokujte si svůj účet přidáním e-mailu a hesla. Před dokončením vám zašleme ověřovací kód k potvrzení vašeho e-mailu.';

  @override
  String get claimAccountEmailLabel => 'E-mail';

  @override
  String get claimAccountPasswordLabel => 'Heslo';

  @override
  String get claimAccountSendCode => 'Odeslat kód';

  @override
  String get claimAccountVerifyDescription =>
      'Zadejte kód, který jsme vám poslali na e-mail, abyste jej ověřili. Vaše heslo bude nastaveno po potvrzení kódu.';

  @override
  String get claimAccountSuccess => 'Účet byl úspěšně nárokován';

  @override
  String get importantInformation => 'Důležité informace:';

  @override
  String get genericError => 'Došlo k chybě';

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
  String get relativeTimeJustNow => 'právě teď';

  @override
  String get authorizedAppsTitle => 'Autorizované aplikace';

  @override
  String get authorizedAppsDescription =>
      'Těmto aplikacím byl udělen přístup k vašemu účtu Fluxer.';

  @override
  String get authorizedAppsEmptyTitle => 'Žádné autorizované aplikace';

  @override
  String get authorizedAppsEmptyDescription =>
      'Zatím jste neautorizovali žádné aplikace pro přístup k vašemu účtu.';

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
  String get authorizedAppsRevoke => 'Odebrat';

  @override
  String get authorizedAppsRevokeTitle => 'Odebrat přístup k aplikaci';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Opravdu chcete odebrat přístup aplikaci $appName? Tato aplikace již nebude mít přístup k vašemu účtu.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Přístup k základním informacím o vašem profilu (uživatelské jméno, avatar atd.)';

  @override
  String get authorizedAppsScopeEmail => 'Zobrazit vaši e-mailovou adresu';

  @override
  String get authorizedAppsScopeGuilds =>
      'Zobrazit komunity, jejichž jste členem';

  @override
  String get authorizedAppsScopeConnections => 'Zobrazit vaše propojené účty';

  @override
  String get authorizedAppsScopeBot =>
      'Přidat bota do komunity s požadovanými oprávněními';

  @override
  String get authorizedAppsScopeAdmin =>
      'Přístup k administrativním koncovým bodům';

  @override
  String get privacyPendingDeletionTitle => 'Čeká na smazání';

  @override
  String get blockedUsersTitle => 'Blokovaní uživatelé';

  @override
  String get blockedUsersDescription =>
      'Blokovaní uživatelé vám nemohou posílat žádosti o přátelství ani vás přímo kontaktovat.';

  @override
  String get blockedUsersEmptyTitle => 'Žádní blokovaní uživatelé';

  @override
  String get blockedUsersEmptyDescription => 'Zatím jste nikoho neblokovali.';

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
  String get blockedUsersCopyTag => 'Zkopírovat FluxerTag';

  @override
  String get blockedUsersCopyId => 'Zkopírovat ID uživatele';

  @override
  String get userProfileLoadError => 'Nepodařilo se načíst profil';

  @override
  String get userProfileRetry => 'Zkusit znovu';

  @override
  String get userProfileMessage => 'Zpráva';

  @override
  String get userProfileVoiceCall => 'Hlasový hovor';

  @override
  String get userProfileVideoCall => 'Video hovor';

  @override
  String get userProfileEditProfile => 'Upravit profil';

  @override
  String get userProfileStaffBadgeTooltip => 'Tým Fluxeru';

  @override
  String get userProfileCtpBadgeTooltip => 'Komunitní tým Fluxeru';

  @override
  String get userProfilePartnerBadgeTooltip => 'Partner Fluxeru';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Lovec chyb Fluxeru';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer Plutonium';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Předplatitel Fluxer Plutonium od $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Vizionář Fluxeru';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Vizionář Fluxeru od $date';
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
    return 'Společenství ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Společní přátelé';

  @override
  String get userProfileMutualCommunitiesTitle => 'Společenství';

  @override
  String get userProfileNoMutualFriends =>
      'Nebyli nalezeni žádní společní přátelé.';

  @override
  String get userProfileNoMutualCommunities =>
      'Nebyla nalezena žádná společenství.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Přezdívka: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Otevřít DM';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Blokovali jste $username. Nebudete moci posílat zprávy, dokud je neodblokujete.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Odblokovat';

  @override
  String get userProfileOpenDm => 'Otevřít DM';

  @override
  String get userProfileNoteTitle => 'Poznámka';

  @override
  String get userProfileNoteVisibility => '(viditelné pouze pro vás)';

  @override
  String get userProfileNoteSave => 'Uložit';

  @override
  String get userProfileNoteDelete => 'Smazat';

  @override
  String get userProfileNoteEmpty => 'Klikněte pro přidání poznámky';

  @override
  String get userProfileMemberSince => 'Členem od';

  @override
  String get userProfileAboutMe => 'O mně';

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
  String get userProfileCopyUsername => 'Zkopírovat uživatelské jméno';

  @override
  String get userProfileCopyUserId => 'Zkopírovat ID uživatele';

  @override
  String get userProfileViewMainProfile => 'Zobrazit hlavní profil';

  @override
  String get userProfileViewCommunityProfile => 'Zobrazit komunitní profil';

  @override
  String get userProfileBlockUser => 'Blokovat uživatele';

  @override
  String get userProfileUnblockUser => 'Odblokovat uživatele';

  @override
  String get userProfileRemoveFriend => 'Odstranit přítele';

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
  String get userProfileRemoveFriendConfirmTitle => 'Odstranit přítele';

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
  String get userProfileTimeout => 'Uvalit časový postih';

  @override
  String get userProfileRemoveTimeout => 'Odebrat časový postih';

  @override
  String get userProfileTransferOwnership => 'Předat vlastnictví';

  @override
  String get userProfileReportUser => 'Nahlásit uživatele';

  @override
  String get userProfileReportMessage => 'Nahlásit zprávu';

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
  String get userProfileBanDurationLabel => 'Doba blokace';

  @override
  String get userProfileBanCustomSecondsLabel => 'Vlastní doba (sekundy)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Jakákoli hodnota od $min do $max sekund';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Smazat historii zpráv';

  @override
  String get userProfileBanDeleteNone => 'Nesmazat žádné';

  @override
  String get userProfileBanDelete24h => 'Posledních 24 hodin';

  @override
  String get userProfileBanDelete7d => 'Posledních 7 dní';

  @override
  String get userProfileBanReasonLabel => 'Důvod (volitelné)';

  @override
  String get userProfileBanReasonHint => 'Zadejte důvod blokace';

  @override
  String get userProfileBanSubmit => 'Zablokovat člena';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Dočasně omezit $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Doba omezení';

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
  String get userProfileTransferSuccess => 'Vlastnictví předáno';

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
  String get durationCustom => 'Vlastní...';

  @override
  String get iarReportUserTitle => 'Nahlásit uživatele';

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
  String get iarReasonInappropriateProfile => 'Nevhodný profil';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Profil tohoto uživatele obsahuje nevhodný obsah';

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
    return 'Jsme rádi, že jsi tady, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Vítej, $username! Cítíš se jako doma.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Ahoj, $username! Jsme rádi, že tě tu máme.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Ahoj, $username! Zapoj se, kdykoli budeš připraven.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Ahoj $username, skvělé tě tu vidět!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Ahoj, $username! Doufáme, že si svůj pobyt užiješ.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Ahoj, $username, vítej na palubě!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Jsme rádi, že jsi dorazil, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Vítej, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Vítej, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Vítej, $username! Jsme rádi, že jsi tady.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Vítej, $username! Doufáme, že si svůj čas zde užiješ.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Vítej, $username! Tvoje další konverzace začíná zde.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Vítej, $username. Jsme rádi, že tě tu máme.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Skvělé tě vidět, $username! Vítej.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Jsi tady, $username! Jsme rádi, že jsi s námi.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Dorazil jsi, $username! Pojďme začít.';
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
  String get linkedDevicesCurrentDevice => 'Aktuální zařízení';

  @override
  String get linkedDevicesOtherDevices => 'Ostatní zařízení';

  @override
  String get linkedDevicesEnterSelection => 'Přejít do režimu výběru';

  @override
  String get linkedDevicesExitSelection => 'Ukončit režim výběru';

  @override
  String get linkedDevicesSelectAll => 'Vybrat vše';

  @override
  String get linkedDevicesClearSelection => 'Zrušit výběr';

  @override
  String get linkedDevicesRevokeTooltip => 'Odebrat zařízení';

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
  String get channelNoSendPermissionHint =>
      'Do tohoto kanálu nemůžete posílat zprávy.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Systémová oznámení od personálu $productName. Zde nemůžete odpovědět.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Odesílání zpráv je v této komunitě dočasně pozastaveno.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Jste v dočasném zákazu. Zprávy, reakce a hlas jsou pozastaveny, dokud zákaz nevyprší.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Abyste mohli posílat zprávy v této komunitě, musíte si nárokovat svůj účet.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Abyste mohli posílat zprávy v této komunitě, musíte ověřit svůj e-mail.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Váš účet je příliš nový na to, abyste mohli posílat zprávy v této komunitě.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Nejste v této komunitě dostatečně dlouho členem, abyste mohli posílat zprávy.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Abyste mohli posílat zprávy v této komunitě, musíte ověřit telefonní číslo.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Ověřit e-mail';

  @override
  String get channelComposerBarrierVerifyPhone => 'Ověřit telefon';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Příliš mnoho příloh (max $max)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'Jeden nebo více souborů přesahuje limit velikosti';

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
      'Podržte pro nahrávání. Přetáhněte nahoru pro uzamčení, nebo uvolněte pro odeslání.';

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
      'Nahrávání selhalo. Zkuste to znovu.';

  @override
  String get voiceMessageSendFailed =>
      'Hlasovou zprávu nelze odeslat. Zkuste to znovu.';

  @override
  String get voiceMessageRecordingHint =>
      'Mluvte. Po dokončení stiskněte Stop – později můžete oříznout.';

  @override
  String get voiceMessageReviewHint =>
      'Přetáhněte úchyty pro oříznutí, poté stiskněte Odeslat.';

  @override
  String get voiceMessageStop => 'Stop';

  @override
  String get voiceMessageStartRecording => 'Spustit nahrávání';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Přehrát';

  @override
  String get voiceMessagePause => 'Pauza';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Výběr musí mít minimálně ${secondsString}s.';
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
  String get chatAttachmentRemove => 'Odstranit přílohu';

  @override
  String get chatAttachmentDownload => 'Stáhnout';

  @override
  String get chatAttachmentDownloadedToast => 'Saved to photos';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Couldn\'t download attachment';

  @override
  String get chatAttachmentExpiredTooltip => 'Příloha vypršela';

  @override
  String get chatAttachmentSourceGallery => 'Galerie';

  @override
  String get chatAttachmentSourceCamera => 'Fotoaparát';

  @override
  String get chatAttachmentSourceBrowse => 'Procházet soubory';

  @override
  String get chatAttachmentPasteTooltip => 'Vložit obrázek ze schránky';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Odhalit spoiler';

  @override
  String get matureMediaRevealButton => 'Zobrazit';

  @override
  String get matureMediaRevealHint => 'Kliknutím zobrazíte';

  @override
  String get matureContentTitle => 'Nevhodný obsah';

  @override
  String get matureCommunityTitle => 'Nevhodná komunita';

  @override
  String get matureCategoryTitle => 'Nevhodná kategorie';

  @override
  String get matureChannelTitle => 'Nevhodný kanál';

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
      'Tato komunita je označena jako nevhodná a může obsahovat materiál, který není vhodný pro některé uživatele.';

  @override
  String get matureCategoryBody =>
      'Tato kategorie je označena jako nevhodná a může obsahovat materiál, který není vhodný pro některé uživatele.';

  @override
  String get matureChannelBody =>
      'Tento kanál je označen jako nevhodný a může obsahovat materiál, který není vhodný pro některé uživatele.';

  @override
  String get matureVoiceChannelBody =>
      'Tento hlasový kanál je označen jako nevhodný a může obsahovat materiál, který není vhodný pro některé uživatele.';

  @override
  String get matureLinkChannelBody =>
      'Tento odkazový kanál je označen jako nevhodný a může odkazovat na materiál, který není vhodný pro některé uživatele.';

  @override
  String get matureCommunityUnavailableBody =>
      'Tato nevhodná komunita není pro váš účet dostupná.';

  @override
  String get matureCategoryUnavailableBody =>
      'Tato nevhodná kategorie není pro váš účet dostupná.';

  @override
  String get matureChannelUnavailableBody =>
      'Tento nevhodný kanál není pro váš účet dostupný.';

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
  String get sensitiveContentGuildLabel => 'Zprávy v kanálech komunity';

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
    return 'Platnost vyprší $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Platnost vyprší mezi $start a $end';
  }

  @override
  String get connectionsTitle => 'Propojení';

  @override
  String get connectionsDescription =>
      'Propojte externí účty a domény s vaším profilem Fluxer. Ověřená propojení se zobrazí ve vašem profilu.';

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
  String get connectionUnverifiedLabel => 'Tato spojení nebylo ověřeno.';

  @override
  String get connectionAddTitle => 'Přidat spojení';

  @override
  String get connectionTypeLabel => 'Typ spojení';

  @override
  String get connectionHandleLabel => 'Handle';

  @override
  String get connectionDomainLabel => 'Doména';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Toto spojení již máte.';

  @override
  String get connectionConnectBluesky => 'Připojit přes Bluesky';

  @override
  String get connectionContinue => 'Pokračovat';

  @override
  String get connectionVerifyTitle => 'Ověřit spojení';

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
  String get connectionCopyHost => 'Zkopírovat hostitele';

  @override
  String get connectionCopyValue => 'Zkopírovat hodnotu';

  @override
  String get connectionCopied => 'Zkopírováno!';

  @override
  String get connectionTokenFileTitle => 'Poskytněte soubor s tokenem';

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
  String get connectionEditTitle => 'Upravit spojení';

  @override
  String get connectionEditDescription =>
      'Vyberte, kdo může toto spojení vidět na vašem profilu.';

  @override
  String get connectionVisibilityEveryone => 'Každý';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Umožnit komukoli vidět toto spojení na vašem profilu';

  @override
  String get connectionVisibilityFriends => 'Přátelé';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Umožnit vašim přátelům vidět toto spojení';

  @override
  String get connectionVisibilityCommunityMembers => 'Členové komunity';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Umožnit členům komunit, ve kterých jste, vidět toto spojení';

  @override
  String get connectionRemoveTitle => 'Odebrat spojení';

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
  String get lookAndFeelThemeDark => 'Tmavý motiv';

  @override
  String get lookAndFeelThemeCoal => 'Uhelný motiv';

  @override
  String get lookAndFeelThemeLight => 'Světlý motiv';

  @override
  String get lookAndFeelThemeSystem => 'Motiv systému';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Synchronizovat motiv mezi zařízeními';

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
  String get lookAndFeelChatFontScalingTitle => 'Škálování písma chatu';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Upravte velikost písma v oblasti chatu.';

  @override
  String get lookAndFeelInterfaceTitle => 'Rozhraní';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Přizpůsobte prvky a chování rozhraní.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Indikátory psaní v seznamu kanálů';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Vyberte, jak se indikátory psaní zobrazují v seznamu kanálů, když někdo píše v kanálu.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Indikátor psaní + Avatary';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Zobrazit indikátor psaní s avatary uživatelů v seznamu kanálů';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Pouze indikátor psaní';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Zobrazit pouze indikátor psaní bez avatarů';

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
  String get lookAndFeelKeyboardHintsTitle => 'Nápovědy ke klávesnici';

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
  String get lookAndFeelCollapseDMsLabel => 'Sbalit DM do složky';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'Když je povoleno, nepřečtené DM v postranním panelu komunity jsou sbaleny do složky na tlačítku Fluxer. Kliknutím na tlačítko Fluxer na stránce DM složku rozbalíte nebo sbalíte.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Seznam kanálů';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Ovládejte chování indikátoru nepřečtených zpráv u ztlumených kanálů v seznamech kanálů.';

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
      'Zobrazit Právě aktivní na domovské obrazovce';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Zobrazte funkci Právě aktivní na domovské obrazovce, abyste viděli přátele aktivní ve hlase. Uvidíte náhled, kontext kanálu, kdo už je tam, a rychlý způsob, jak se připojit.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Oblíbené';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Ovládejte viditelnost oblíbených položek v celé aplikaci.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Povolit oblíbené';

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
  String get favoritesWelcomeTitle => 'Vítejte v Oblíbených';

  @override
  String get favoritesWelcomeDescription =>
      'Váš osobní prostor pro rychlý přístup ke kanálům, přímým zprávám a skupinám, které máte rádi. Chcete-li je sem přidat, stiskněte hvězdičku u libovolného kanálu.';

  @override
  String get favoritesWelcomeTip => 'Není to pro vás? Kdykoli to vypněte.';

  @override
  String get favoritesDisableButton => 'Zakázat oblíbené';

  @override
  String get favoritesAddedToast => 'Přidáno do Oblíbených';

  @override
  String get favoritesRemovedToast => 'Odebráno z Oblíbených';

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
  String get favoritesUncategorized => 'Nekategorizované';

  @override
  String get favoritesOtherCategory => 'Ostatní';

  @override
  String get favoritesRemoveFromFavorites => 'Odebrat z Oblíbených';

  @override
  String get favoritesAddToFavorites => 'Přidat do Oblíbených';

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
      'Skrýt ztlumené kanály ve výchozím nastavení';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Automaticky skryjte ztlumené kanály v postranním panelu, když se připojíte k novým komunitám';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Skrýt ztlumené kanály ve výchozím nastavení?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Nové komunity, ke kterým se připojíte, budou mít automaticky skryté ztlumené kanály. Chcete toto nastavení použít i na všechny vaše stávající komunity?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Přestat skrývat ztlumené kanály ve výchozím nastavení?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Nové komunity, ke kterým se připojíte, již nebudou mít automaticky skryté ztlumené kanály. Chcete také zobrazit ztlumené kanály ve všech vašich stávajících komunitách?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Použít na všechny komunity';

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
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'Při nahrávání přímo do Fluxeru';

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Náhledy odkazů';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Ovládejte, jak se v chatu zobrazují náhledy webových odkazů';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Zobrazit vložené prvky a náhledy webových odkazů';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reakce';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Nastavte si emoji reakce na zprávy';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Zobrazit emoji reakce na zprávy';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Skrytý obsah';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Ovládejte, jak se zobrazuje skrytý obsah';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Zobrazit skrytý obsah';

  @override
  String get messagesMediaSpoilersOnClickName => 'Po kliknutí';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Zobrazit skrytý obsah po kliknutí';

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
      'Vždy zobrazit skrytý obsah';

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
      'Automaticky odeslat GIFy po výběru';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Automatické doplňování výrazů (doplňování pomocí dvojtečky)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Ovládejte, co se zobrazí v automatickém doplňování výrazů po zadání dvojtečky. Přizpůsobte si návrhy podle svých preferencí.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Zobrazit výchozí emotikony v automatickém doplňování výrazů';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Zobrazit vlastní emotikony v automatickém doplňování výrazů';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Zobrazit samolepky v automatickém doplňování výrazů';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Zobrazit uložená média v automatickém doplňování výrazů';

  @override
  String get messagesMediaEditingSectionTitle => 'Úprava zpráv';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Ovládejte, co se stane s návrhem úpravy po zrušení.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Ponechat návrh úpravy při zrušení';

  @override
  String get accessibilitySaturationTitle => 'Saturation';

  @override
  String get accessibilitySaturationDescription =>
      'Adjust how vivid theme colors appear across the app.';

  @override
  String get accessibilityUnreadGroupTitle => 'Indikátory nepřečtených zpráv';

  @override
  String get accessibilityUnreadGroupDescription =>
      'Ovládejte, jak se zobrazují indikátory nepřečtených zpráv.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'Zobrazit tlumený indikátor nepřečtených zpráv v ztlumených kanálech';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'Zobrazte ztlumený indikátor nepřečtených zpráv u ztlumených přímých zpráv a kanálů, abyste na první pohled viděli aktivitu.';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'Náhledy zpráv v přímých zprávách';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Ovládejte, kdy se zobrazují náhledy zpráv v seznamu přímých zpráv.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Režim náhledu zpráv v přímých zprávách';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Všechny zprávy';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Zobrazit náhledy zpráv pro všechny konverzace v přímých zprávách';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Pouze nepřečtené přímé zprávy';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Zobrazit náhledy zpráv pouze u přímých zpráv s nepřečtenými zprávami';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Žádné';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Nezobrazovat náhledy zpráv v seznamu přímých zpráv';

  @override
  String get accessibilityMediaButtonsGroupTitle => 'Media Buttons';

  @override
  String get accessibilityMediaButtonsGroupDescription =>
      'Customize which buttons appear on media attachments and embeds.';

  @override
  String get accessibilityShowMediaDeleteButtonLabel => 'Show delete button';

  @override
  String get accessibilityShowMediaDownloadButtonLabel =>
      'Show download button';

  @override
  String get accessibilityShowMediaFavoriteButtonLabel =>
      'Show favorite button';

  @override
  String get accessibilityShowSuppressEmbedsButtonLabel =>
      'Show suppress embeds button';

  @override
  String get dmListSentAnAttachment => 'Odeslal přílohu';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username připnul zprávu do tohoto kanálu.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username přidal(a) $userName do skupiny.';
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
    return '$username odebral(a) $userName ze skupiny.';
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
      'Jen se připojit (ponechat ostatní připojení)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Nedělat nic, nechci se připojit';

  @override
  String get voiceJoinFailedTitle => 'Couldn\'t Join Voice';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Couldn\'t disconnect your other devices. Try again in a moment.';

  @override
  String get voiceChannelEmptyDescription =>
      'Toto je hlasový kanál. Připojte se a začněte mluvit!';

  @override
  String get voiceChannelJoin => 'Připojit se k hlasovému kanálu';

  @override
  String get voiceCallJoin => 'Join call';

  @override
  String get voiceChannelJoinConnect => 'Připojit se k hlasu';

  @override
  String get voiceChannelNoConnectPermission =>
      'Nemáte oprávnění připojit se k tomuto hlasovému kanálu';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Obsah mikrofonu, kamery a sdílení obrazovky je šifrován end-to-end.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Obsah mikrofonu, kamery a sdílení obrazovky je šifrován end-to-end.';

  @override
  String get voiceChannelE2eeBroken =>
      'End-to-end šifrování není k dispozici, protože se v tomto hlasovém kanálu nachází nepodporovaný účastník.';

  @override
  String get voiceCallE2eeBroken =>
      'End-to-end šifrování není k dispozici, protože se v tomto hovoru nachází nepodporovaný účastník.';

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
  String get voiceParticipantTooltipDeafened => 'Neslyšící';

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
  String get voiceChannelLeave => 'Odejít';

  @override
  String get voiceControlMute => 'Ztlumit';

  @override
  String get voiceControlUnmute => 'Zrušit ztlumení';

  @override
  String get voiceControlDeafen => 'Znehybnit';

  @override
  String get voiceControlUndeafen => 'Zrušit znehybnění';

  @override
  String get voiceControlVideo => 'Video';

  @override
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'Sdílet obrazovku';

  @override
  String get voiceScreenShareNotificationText => 'Sdílíte obrazovku.';

  @override
  String get voiceControlMore => 'Více';

  @override
  String get voiceControlDisconnect => 'Ukončit spojení';

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
  String get voiceControlChat => 'Chat';

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
  String get voiceStopWatching => 'Přestat sledovat';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Přestat sledovat aktuální stream';

  @override
  String get voiceOwnScreenShareTitle => 'Vysíláte';

  @override
  String get voiceOwnScreenShareSubtitle => 'Váš stream je pro účastníky živý.';

  @override
  String get voiceLiveBadge => 'ŽIVĚ';

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
  String get notificationsNoUnreadBody => 'Vše je aktuální.';

  @override
  String get notificationsNoMentionsTitle => 'Žádné nedávné zmínky';

  @override
  String get notificationsNoMentionsBody =>
      'Všechny zmínky o vás se zde zobrazí po dobu 7 dnů.';

  @override
  String get notificationsMentionsEndTitle => 'Dosáhli jste konce';

  @override
  String get notificationsMentionsEndBody =>
      'Viděli jste všechny své nedávné zmínky. Nebojte se, brzy se zde objeví další.';

  @override
  String get notificationsJump => 'Přejít';

  @override
  String get notificationsRemoveMentionTooltip => 'Odstranit zmínku';

  @override
  String get notificationsViewAllUnread => 'Zobrazit všechny nepřečtené';

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
      'Vaši zprávu nebylo možné doručit. Chcete-li odesílat přímé zprávy, musíte si účet nárokovat.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Vaši zprávu nebylo možné doručit. Chcete-li odesílat zprávy, musíte si účet nárokovat.';

  @override
  String get chatSendFailureContentBlocked =>
      'Vaši zprávu nebylo možné doručit, protože byla označena našimi bezpečnostními systémy. Pokud se domníváte, že jde o chybu, kontaktujte prosím podporu.';

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
  String get chatMessageDeleteFailed => 'Nepodařilo se odstranit zprávu';

  @override
  String get chatMessageAddReaction => 'Přidat reakci';

  @override
  String get chatMessageEdit => 'Upravit zprávu';

  @override
  String get chatMessageReply => 'Odpovědět';

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
  String get forwardSuccessToast => 'Zpráva byla přeposlána';

  @override
  String get forwardFailed => 'Nepodařilo se přeposlat zprávu';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Komentáře nejsou k dispozici, protože vybraný kanál má povolený režim zpomalení.';

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
      'Zprávy sem nemůžete posílat';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Odkazy sem nemůžete vkládat';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Soubory sem nemůžete nahrávat';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Odesílání zpráv je v této komunitě zakázáno';

  @override
  String get forwardDestinationTimedOut =>
      'V této komunitě máte pozastavenou komunikaci';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Režim zpomalení – počkejte $remaining';
  }

  @override
  String get chatMessageCopyText => 'Zkopírovat zprávu';

  @override
  String get chatMessagePin => 'Připnout zprávu';

  @override
  String get chatMessageUnpin => 'Odepnout zprávu';

  @override
  String get chatMessageUnpinIt => 'Odepnout ji';

  @override
  String get chatMessageBookmark => 'Uložit zprávu';

  @override
  String get chatMessageRemoveBookmark => 'Odstranit uloženou zprávu';

  @override
  String get chatMessageMarkAsUnread => 'Označit jako nepřečtené';

  @override
  String get chatMessageCopyMessageLink => 'Zkopírovat odkaz na zprávu';

  @override
  String get chatMessageCopyMessageId => 'Zkopírovat ID zprávy';

  @override
  String get chatMessageViewReactions => 'Zobrazit reakce';

  @override
  String get chatMessageRemoveAllReactions => 'Odstranit všechny reakce';

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
  String get chatReactionsSheetEmpty => 'Zatím nikdo nereagoval.';

  @override
  String get chatReactionAddFailed => 'Failed to add reaction';

  @override
  String get chatReactionRemoveFailed => 'Failed to remove reaction';

  @override
  String get chatMessageReport => 'Nahlásit zprávu';

  @override
  String get iarReportMessageTitle => 'Nahlásit zprávu';

  @override
  String get iarThisUserFallback => 'tohoto uživatele';

  @override
  String get iarModalDescription =>
      'Nahlaste porušení pravidel nebo najděte nástroje pro správu kontaktů a preferencí.';

  @override
  String get iarPathStepAriaLabel => 'Co potřebujete?';

  @override
  String get iarCategoryStepTitle => 'Jaké pravidlo bylo porušeno?';

  @override
  String get iarReasonStepTitle => 'Které pravidlo bylo porušeno?';

  @override
  String get iarReasonSelectHint => 'Vyberte důvod';

  @override
  String get iarPickAnOptionToast => 'Vyberte možnost pro pokračování.';

  @override
  String get iarPickARuleToast => 'Vyberte pravidlo, které bylo porušeno.';

  @override
  String get iarPathPlatform => 'Nahlásit porušení pravidel platformy';

  @override
  String get iarPathCommunity => 'Nahlásit moderátorům této komunity';

  @override
  String get iarPathPreferenceMessage => 'Nelíbí se mi tento obsah';

  @override
  String get iarCategoryTargetedHarmLabel => 'Výhrůžky, obtěžování nebo škody';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Šikana, výhrůžky, nenávist, násilí, nájezdy nebo obsah podporující sebepoškozování.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Bezpečnost dětí nebo nevhodný obsah';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Ohrožené děti, nevhodný obsah na nesprávném místě nebo nežádoucí chování.';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'Soukromí nebo vydávání se za někoho';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxxing, sledování, vydávání se za někoho nebo nevhodný profil.';

  @override
  String get iarCategoryDeceptionLabel => 'Podvody, malware nebo dezinformace';

  @override
  String get iarCategoryDeceptionDescription =>
      'Phishing, podvody, škodlivé odkazy nebo falešná tvrzení, která pravděpodobně způsobí škodu v reálném světě.';

  @override
  String get iarCategoryIllegalOtherLabel =>
      'Nezákonná činnost nebo něco jiného';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Nezákonný prodej, usnadňování trestné činnosti nebo jasné porušení pravidel, které nespadá pod výše uvedené.';

  @override
  String get iarReasonHarassmentLabel => 'Obtěžování nebo výhrůžky';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Šikana, opakovaný nežádoucí kontakt, sledování nebo cílené útoky.';

  @override
  String get iarReasonHateLabel => 'Nenávistné projevy';

  @override
  String get iarReasonHateMessageDescription =>
      'Urážky, dehumanizující jazyk nebo útoky na chráněné skupiny.';

  @override
  String get iarReasonViolenceLabel => 'Násilí nebo násilné výhrůžky';

  @override
  String get iarReasonViolenceDescription =>
      'Důvěryhodné výhrůžky, grafické násilí nebo glorifikace násilí.';

  @override
  String get iarReasonMatureContentLabel => 'Nevhodný obsah nebo obtěžování';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Nežádoucí chování nebo nevhodný obsah na nesprávném místě.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Bezpečnost dětí nebo zneužívání nezletilých';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Obsah týkající se groomingu nebo zneužívání dětí.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Škodlivé dezinformace';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Falešná tvrzení, která pravděpodobně způsobí škodu v reálném světě.';

  @override
  String get iarReasonSpamLabel => 'Spam, podvody nebo phishing';

  @override
  String get iarReasonSpamMessageDescription =>
      'Hromadný spam, podvody, falešné dárky nebo zneužití účtu.';

  @override
  String get iarReasonMalwareLabel => 'Malware nebo nebezpečné odkazy';

  @override
  String get iarReasonMalwareDescription =>
      'Malware, krádež přihlašovacích údajů nebo škodlivé soubory.';

  @override
  String get iarReasonPrivacyLabel => 'Porušení soukromí';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxxing, zveřejněné soukromé informace nebo sledování.';

  @override
  String get iarReasonImpersonationLabel =>
      'Vydávání se za někoho nebo klamavá média';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Vydávání se za někoho jiného, včetně klamavého obsahu generovaného umělou inteligencí.';

  @override
  String get iarReasonIllegalLabel => 'Nezákonná činnost';

  @override
  String get iarReasonIllegalDescription =>
      'Nezákonný prodej, usnadňování trestné činnosti nebo nezákonná činnost.';

  @override
  String get iarReasonSelfHarmLabel => 'Sebepoškozování nebo sebevražda';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Propagace nebo pokyny k podněcování k sebepoškozování nebo poruchám příjmu potravy.';

  @override
  String get iarReasonOtherLabel => 'Další jasné porušení pravidel';

  @override
  String get iarReasonOtherDescription =>
      'Použijte pouze v případě, že jasně porušuje pravidla Fluxeru a nespadá pod výše uvedené.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Pokud se jedná o nezletilou osobu, použijte místo toho „$childSafetyReason“.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Pokud se jedná o CSAM nebo zneužívání nezletilé osoby, odešlete to nyní a znovu nesdílejte materiál.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Pokud je někdo v bezprostředním nebezpečí, pokud to můžete bezpečně udělat, kontaktujte místní pohotovostní služby.';

  @override
  String get iarSafetyNoteViolence =>
      'Pokud se jedná o důvěryhodnou bezprostřední hrozbu, kontaktujte také místní pohotovostní služby.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Pokud se jedná o bezprostřední teroristickou hrozbu, kontaktujte také místní pohotovostní služby.';

  @override
  String get iarActionBlockUserTitle => 'Blokovat tohoto uživatele';

  @override
  String get iarActionBlockUserDescription =>
      'Zastavit zprávy a žádosti o přátelství.';

  @override
  String get iarActionBlockUserButton => 'Blokovat';

  @override
  String get iarActionCopyMessageLinkTitle => 'Zkopírovat odkaz na zprávu';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Sdílet s moderátory komunity.';

  @override
  String get iarActionCopyMessageLinkButton => 'Kopírovat';

  @override
  String get iarActionCloseDmTitle => 'Zavřít tento soukromý chat';

  @override
  String get iarActionCloseDmDescription =>
      'Neblokuje. Můžete znovu otevřít později.';

  @override
  String get iarActionCloseDmButton => 'Zavřít soukromý chat';

  @override
  String get iarActionLeaveCommunityTitle => 'Odejít z komunity';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Přestat zobrazovat její obsah a členy.';

  @override
  String get iarActionLeaveCommunityButton => 'Odejít';

  @override
  String get iarActionDmSettingsTitle =>
      'Nastavení soukromých chatů a žádostí o přátelství';

  @override
  String get iarActionDmSettingsDescription =>
      'Změnit, kdo vás může kontaktovat.';

  @override
  String get iarActionCallSettingsTitle =>
      'Nastavení hovorů a skupinových chatů';

  @override
  String get iarActionCallSettingsDescription =>
      'Změnit, kdo vám může volat nebo vás přidávat.';

  @override
  String get iarActionOpenButton => 'Otevřít';

  @override
  String get iarActionDeleteMessageTitle => 'Smazat tuto zprávu';

  @override
  String get iarActionDeleteMessageDescription =>
      'Odstranit ji z kanálu pro všechny.';

  @override
  String get iarActionDeleteMessageButton => 'Smazat';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Smazáno';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Tato zpráva již byla smazána.';

  @override
  String get iarActionBanUserTitle => 'Zablokovat tohoto uživatele';

  @override
  String get iarActionBanUserDescription =>
      'Otevřít dialog pro zablokování v této komunitě.';

  @override
  String get iarActionBanUserButton => 'Zablokovat';

  @override
  String get iarActionBanUserBannedButton => 'Zablokováno';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Tento uživatel je již v komunitě zablokován.';

  @override
  String get iarCloseDmConfirmTitle => 'Zavřít soukromý chat';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Zavřete svůj aktuální soukromý chat s $name. Tím je neblokujete; můžete je znovu otevřít později.';
  }

  @override
  String get iarSuccessTitle => 'Nahlášení odesláno';

  @override
  String get iarSuccessBody =>
      'Náš bezpečnostní tým jej prověřuje. Až rozhodneme, pošleme vám soukromou zprávu a e-mail.';

  @override
  String get iarAlreadyReportedTitle => 'Již nahlášeno';

  @override
  String get iarAlreadyReportedBody =>
      'Tuto zprávu jste již nahlásili. Náš bezpečnostní tým ji prověřuje.';

  @override
  String get iarBackButton => 'Zpět';

  @override
  String get iarContinueButton => 'Pokračovat';

  @override
  String get iarSendReportButton => 'Odeslat nahlášení';

  @override
  String get iarDoneButton => 'Hotovo';

  @override
  String get iarCouldntSendToast =>
      'Nahlášení se nepodařilo odeslat. Zkuste to prosím znovu.';

  @override
  String get iarRateLimitedToast =>
      'Nahlásili jste příliš rychle. Počkejte prosím chvíli a zkuste to znovu.';

  @override
  String get iarReportSentToast =>
      'Nahlášení odesláno. Náš bezpečnostní tým ho prověří.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Zablokovat $name? Nebude vám moci posílat zprávy ani vám posílat žádosti o přátelství. Můžete je později odblokovat.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Nepodařilo se zablokovat tohoto uživatele. Zkuste to prosím znovu.';

  @override
  String get iarCloseDmSuccessToast => 'Soukromý chat zavřen.';

  @override
  String get iarCloseDmFailedToast =>
      'Nepodařilo se zavřít tento soukromý chat. Zkuste to prosím znovu.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Nepodařilo se opustit tuto komunitu. Zkuste to prosím znovu.';

  @override
  String get chatMessageSuppressEmbeds => 'Potlačit náhledy';

  @override
  String get chatMessageUnsuppressEmbeds => 'Zobrazit náhledy';

  @override
  String get chatMessageDelete => 'Smazat zprávu';

  @override
  String get chatMessageDeleteConfirmTitle => 'Smazat zprávu';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Opravdu chcete tuto zprávu smazat?';

  @override
  String get chatMessageDeleteAttachment => 'Delete Attachment';

  @override
  String get chatMessageEditAttachmentAltText => 'Edit Alt Text';

  @override
  String get chatMessageMore => 'Více';

  @override
  String get chatEditingMessage => 'Upravuje se zpráva';

  @override
  String get chatReplyOriginalDeleted => 'Původní zpráva byla smazána';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Původní zprávu se nepodařilo načíst';

  @override
  String get chatReplyAttachedMedia => 'Zpráva obsahuje připojená média';

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
  String get chatMessagesLoadError => 'Nepodařilo se načíst zprávy.';

  @override
  String get chatReplyMentionOverrideTitle => 'Přepsat předvolbu zmínky?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname preferuje @zmínky v odpovědích. Odeslat bez zmínky i přesto?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname preferuje odpovědi bez @zmínky. Odeslat se zmínkou i přesto?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ignorovat předvolbu';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Kliknutím zakážete pingnutí uživatele, kterému odpovídáte.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Kliknutím povolíte pingnutí uživatele, kterému odpovídáte.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Zmínit uživatele v odpovědi';

  @override
  String get chatReplyMentionOn => 'Zapnuto';

  @override
  String get chatReplyMentionOff => 'Vypnuto';

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
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

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
  String get composerAutocompleteRoleMentionDescription =>
      'Upozornit uživatele s touto rolí, kteří mají oprávnění zobrazit tento kanál.';

  @override
  String get addGuildModalTitle => 'Přidat komunitu';

  @override
  String get addGuildModalLandingDescription =>
      'Vytvořte novou komunitu nebo se připojte k existující.';

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
      'Zadejte odkaz k pozvánce pro připojení ke komunitě.';

  @override
  String get addGuildInviteLinkLabel => 'Odkaz k pozvánce';

  @override
  String get addGuildJoinSubmit => 'Připojit se ke komunitě';

  @override
  String get addGuildInviteInvalid =>
      'Tato pozvánka je neplatná nebo vypršela.';

  @override
  String get addGuildJoinFailed =>
      'Nepodařilo se připojit ke komunitě. Zkuste to prosím znovu.';

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
  String get addGuildPackInstalled => 'Balíček byl úspěšně nainstalován.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Odebrat všechny reakce';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Opravdu chcete odebrat všechny reakce z této zprávy?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Odebrat připnutí zprávy';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Chcete tuto připnutou zprávu vrátit zpět v čase?';

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
  String get personalNotesTitle => 'Osobní poznámky';

  @override
  String get personalNotesSubtitle =>
      'Váš soukromý prostor pro myšlenky a připomínky';

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
  String get personalNotesPrivateSpace => 'Váš soukromý prostor';

  @override
  String get purgePersonalNotes => 'Smazat osobní poznámky';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Tímto trvale smažete každou zprávu a přílohu ve svých osobních poznámkách. Tuto akci nelze vzít zpět.';

  @override
  String get purgePersonalNotesConfirmButton => 'Smazat';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Smazáno $count zpráv z osobních poznámek';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Osobní poznámky již byly prázdné';

  @override
  String get purgePersonalNotesFailed =>
      'Osobní poznámky se nepodařilo vymazat';

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
  String get userSettingsNavSecurityLogin => 'Zabezpečení a přihlášení';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Dárky a kódy';

  @override
  String get userSettingsNavPrivacyDashboard => 'Přehled ochrany soukromí';

  @override
  String get userSettingsNavAuthorizedApps => 'Autorizované aplikace';

  @override
  String get userSettingsNavBlockedUsers => 'Blokovaní uživatelé';

  @override
  String get userSettingsNavLinkedDevices => 'Propojená zařízení';

  @override
  String get userSettingsNavConnections => 'Připojení';

  @override
  String get userSettingsNavLookAndFeel => 'Vzhled';

  @override
  String get userSettingsNavAccessibility => 'Přístupnost';

  @override
  String get userSettingsNavChat => 'Zprávy a média';

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
  String get advancedPerformanceReportingTitle => 'Hlášení o výkonu';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Pomozte vylepšit Fluxer sdílením anonymních dat o pádech a výkonu.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Odesílat zprávy o pádech a výkonu';

  @override
  String get advancedPerformanceReportingDescription =>
      'Všechna odeslaná data jsou anonymní a odesílají se pouze do vlastních monitorovacích služeb Fluxeru – nepoužívají se žádní poskytovatelé třetích stran.';

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
  String get userSettingsNavLogOut => 'Odhlásit se';

  @override
  String get betaWarningTitle => 'Beta software';

  @override
  String get betaWarningMessage =>
      'Toto je beta software. Ještě ne vše je hotové nebo přidané.';

  @override
  String get betaWarningReportIssues =>
      'Jakékoli nalezené problémy prosím nahlaste komunitě Fluxer Mobile (pro vstup do komunity momentálně potřebujete Plutonium).';

  @override
  String get betaWarningRepoLink => 'Zobrazit zdroj na GitHubu';

  @override
  String get betaWarningGotIt => 'Rozumím';

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
  String get quickSwitcherNoMatchesFound => 'Nebyly nalezeny žádné výsledky';

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
  String get quickSwitcherUserSettingsLabel => 'Nastavení uživatele';

  @override
  String get quickSwitcherNotificationsLabel => 'Oznámení';

  @override
  String get quickSwitcherBookmarksLabel => 'Záložky';

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
  String get quickSwitcherMentionsLabel => 'Zmínky';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Zatím žádní přátelé';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Přidejte přítele a začněte.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Žádní přátelé neodpovídají tomuto vyhledávání';

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
  String get quickSwitcherSearchAliasInbox => 'Doručená pošta';

  @override
  String get quickSwitcherSearchAliasSaved => 'Uložené';

  @override
  String get uiClose => 'Zavřít';

  @override
  String get chatJumpToBottom => 'Přejít dolů';

  @override
  String get uiConfirm => 'Potvrdit';

  @override
  String get uiLoading => 'Načítání';

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
    return 'This will notify $count members with the $roleName role. Continue?';
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
  String get connectToDifferentInstance => 'Připojit k jiné instanci';

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
  String get discoveryCategoryGaming => 'Hry';

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
  String get discoveryCategoryOther => 'Ostatní';

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
      'Tato komunita dosáhla limitu členů, takže se k ní nyní nemůžete připojit.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle => 'Dosáhli jste limitu komunit';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Jste v maximálním počtu komunit. Opusťte jednu a zkuste to znovu.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Nemůžete se připojit k této komunitě';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Byli jste z této komunity zabanováni.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Tato komunita již není k dispozici';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Možná opustila objevování nebo vypnula nové přihlašování. Obnovte stránku a už ji neuvidíte.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Jste příliš rychlí';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Počkejte prosím chvíli a zkuste to znovu.';

  @override
  String get guildNavbarAddCommunity => 'Přidat komunitu';

  @override
  String get guildNavbarHelp => 'Nápověda';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'NOVÁ ZPRÁVA';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Sbalit $folderName';
  }

  @override
  String get guildNavbarGroupDm => 'Skupinová DM';

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
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

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
  String get guildNavbarSearchFriends => 'Vyhledat přátele';

  @override
  String get guildNavbarNoFriendsYet => 'Ještě nemáte žádné přátele';

  @override
  String get guildNavbarNoResults => 'Žádné výsledky';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Nebo pošlete odkaz s pozvánkou příteli:';

  @override
  String get guildNavbarInviteLink => 'Odkaz s pozvánkou';

  @override
  String get guildNavbarCopy => 'Kopírovat';

  @override
  String get guildNavbarCopied => 'Zkopírováno!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Váš odkaz s pozvánkou vyprší za 7 dní.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Tento odkaz s pozvánkou nikdy nevyprší.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Váš odkaz s pozvánkou vyprší za $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Upravit odkaz s pozvánkou';

  @override
  String get guildNavbarInviteLinkSettings => 'Nastavení odkazu s pozvánkou';

  @override
  String get guildNavbarExpireAfter => 'Vyprší po';

  @override
  String get guildNavbarMaxUses => 'Maximální počet použití';

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
      'Vaše zprávy nebylo možné smazat';

  @override
  String get guildNavbarRemoveOverride => 'Odebrat přepsání';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Ztlumeno do $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible =>
      'Přístupné pouze personálu Fluxeru';

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
  String get guildMenuEditCommunityProfile => 'Upravit profil komunity';

  @override
  String get guildMenuUnmuteCommunity => 'Zrušit ztišení komunity';

  @override
  String get guildMenuMuteCommunity => 'Ztišit komunitu';

  @override
  String get guildMenuHideMutedChannels => 'Skrýt ztišené kanály';

  @override
  String get guildMenuReportCommunity => 'Nahlásit komunitu';

  @override
  String get guildMenuDebugCommunity => 'Ladit komunitu';

  @override
  String get guildMenuCopyCommunityId => 'Zkopírovat ID komunity';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Do $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Obecné';

  @override
  String get guildMenuSettingsRoles => 'Role a oprávnění';

  @override
  String get guildMenuSettingsEmoji => 'Vlastní emotikony';

  @override
  String get guildMenuSettingsStickers => 'Vlastní samolepky';

  @override
  String get guildMenuSettingsSafetyModeration => 'Bezpečnost a moderování';

  @override
  String get guildMenuSettingsActivityLog => 'Activity Log';

  @override
  String get guildMenuSettingsWebhooks => 'Webhooky';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'Vlastní odkaz na pozvánku';

  @override
  String get guildMenuSettingsDiscovery => 'Objevování';

  @override
  String get guildMenuSettingsMembers => 'Členové';

  @override
  String get guildMenuSettingsInviteLinks => 'Odkazy na pozvánky';

  @override
  String get guildMenuSettingsBans => 'Zákazy';

  @override
  String get guildMenuSettingsChannels => 'Channels';

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
  String get guildSettingsOverviewNameHint => 'Moje skvělá komunita';

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
      'Vyberte, co musí členové splnit, než budou moci posílat zprávy nebo DM členům komunity.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Členové s rolemi mohou tyto kontroly přeskočit. Veřejné prostory doporučujeme ověřovat.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Komunity uvedené v sekci Objevit vyžadují alespoň ověřený e-mail. Při zapnutém Objevit nelze vybrat možnost Žádné.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Obsah pro dospělé a varování před obsahem';

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
      'Nevyžaduje se žádné ověření.';

  @override
  String get guildSettingsVerificationLow => 'Nízké';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Vyžaduje ověřenou e-mailovou adresu.';

  @override
  String get guildSettingsVerificationMedium => 'Střední';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Vyžaduje ověřenou e-mailovou adresu a účet starý alespoň 5 minut.';

  @override
  String get guildSettingsVerificationHigh => 'Vysoké';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Vyžaduje vše ze střední úrovně a navíc členství v komunitě alespoň 10 minut.';

  @override
  String get guildSettingsVerificationHighest => 'Velmi vysoké';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Vyžaduje ověřené telefonní číslo.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Sledujte akce moderátorů v celé komunitě.';

  @override
  String get guildSettingsAuditLogEmpty => 'Žádné záznamy';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Akce moderátorů a změny komunity se zde zobrazí.';

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
      'Při načítání protokolu aktivit se něco pokazilo.';

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
  String get auditLogActionChannelOverwriteCreate => 'Přepsání kanálu přidáno';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Přepsání kanálu aktualizováno';

  @override
  String get auditLogActionChannelOverwriteDelete => 'Přepsání kanálu odebráno';

  @override
  String get auditLogActionMemberKick => 'Člen vyloučen';

  @override
  String get auditLogActionMemberPrune => 'Členové pročištěni';

  @override
  String get auditLogActionMemberBanAdd => 'Člen zablokován';

  @override
  String get auditLogActionMemberBanRemove => 'Člen odblokován';

  @override
  String get auditLogActionMemberUpdate => 'Člen aktualizován';

  @override
  String get auditLogActionMemberRoleUpdate => 'Role členů aktualizovány';

  @override
  String get auditLogActionMemberMove => 'Člen přesunut';

  @override
  String get auditLogActionMemberDisconnect => 'Člen odpojen';

  @override
  String get auditLogActionBotAdd => 'Robot přidán';

  @override
  String get auditLogActionRoleCreate => 'Role created';

  @override
  String get auditLogActionRoleUpdate => 'Role updated';

  @override
  String get auditLogActionRoleDelete => 'Role deleted';

  @override
  String get auditLogActionInviteCreate => 'Invite created';

  @override
  String get auditLogActionInviteUpdate => 'Invite updated';

  @override
  String get auditLogActionInviteDelete => 'Invite deleted';

  @override
  String get auditLogActionWebhookCreate => 'Webhook created';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook updated';

  @override
  String get auditLogActionWebhookDelete => 'Webhook deleted';

  @override
  String get auditLogActionEmojiCreate => 'Emoji created';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji updated';

  @override
  String get auditLogActionEmojiDelete => 'Emoji deleted';

  @override
  String get auditLogActionStickerCreate => 'Sticker created';

  @override
  String get auditLogActionStickerUpdate => 'Sticker updated';

  @override
  String get auditLogActionStickerDelete => 'Sticker deleted';

  @override
  String get auditLogActionMessageDelete => 'Message deleted';

  @override
  String get auditLogActionMessageBulkDelete => 'Messages deleted';

  @override
  String get auditLogActionMessagePin => 'Message pinned';

  @override
  String get auditLogActionMessageUnpin => 'Message unpinned';

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
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Spravujte webhooky, které odesílají zprávy do kanálů.';

  @override
  String get guildSettingsWebhooksEmpty => 'Nenastaveny žádné webhooky.';

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
  String get guildSettingsCopyUrl => 'Zkopírovat URL';

  @override
  String get guildSettingsCopiedUrl => 'URL zkopírována do schránky';

  @override
  String get guildSettingsDeleteWebhook => 'Odstranit webhook';

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
      'Požádejte o zařazení do vyhledávání serverů.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Not enough members';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Pro podání žádosti je potřeba alespoň $count členů.';
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
  String get guildSettingsDiscoveryCategory => 'Kategorie';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Choose the category that best describes your community. You can change this any time.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Primary language';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'The language most of your community speaks. Used to filter Discovery results.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Popis';

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
  String get guildSettingsDiscoveryTags => 'Štítky';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Up to $maxTags tags help people find your community. They show up in Discovery search.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'hra, umění, hudba';

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
  String get guildSettingsDiscoveryApply => 'Odeslat žádost';

  @override
  String get guildSettingsDiscoverySave => 'Save';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Stáhnout';

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
      'Vyhledávejte a spravujte členy serveru.';

  @override
  String get guildSettingsMembersSearchHint => 'Vyhledat členy';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count členů';
  }

  @override
  String get guildSettingsInvitesTitle => 'Invites';

  @override
  String get guildSettingsInvitesDescription =>
      'Zobrazte a zrušte platné odkazy pro pozvánky.';

  @override
  String get guildSettingsInvitesEmpty => 'Žádné aktivní pozvánky.';

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
    return '$uses / $maxUses použití';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Vyprší $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Zobrazte a spravujte zabanované uživatele.';

  @override
  String get guildSettingsBansSearchHint => 'Vyhledat bany';

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
      'Nebyly nalezeny žádné bany odpovídající vašemu vyhledávání.';

  @override
  String get guildSettingsBanDetailsTitle => 'Detaily banu';

  @override
  String get guildSettingsBanViewDetails => 'Zobrazit detaily';

  @override
  String get guildSettingsBannedOn => 'Zabanován dne';

  @override
  String get guildSettingsBannedBy => 'Zabanován kým';

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
  String get guildSettingsOverviewBrandingTitle => 'Značka';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Aktualizujte ikonu, název, banner a pozadí pozvánky';

  @override
  String get guildSettingsOverviewBannerUpload => 'Nahrát banner';

  @override
  String get guildSettingsOverviewIdleTitle => 'Nastavení nečinnosti';

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
      'Komunity s více než 250 členy jsou nuceny do nastavení „pouze zmínky“. Vaše původní nastavení je zachováno a bude obnoveno, pokud komunita klesne pod 250 členů.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Pokročilé';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Povolit flexibilní názvy textových kanálů';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Skrýt korunu vlastníka komunity';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Samostatný banner';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Zobrazí banner ve vlastní sekci pod hlavičkou komunity.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Nahrát ikonu';

  @override
  String get guildSettingsOverviewRemoveImage => 'Odebrat';

  @override
  String get guildSettingsOverviewSplashTitle => 'Pozadí pozvánky';

  @override
  String get guildSettingsOverviewEmbedSplashTitle =>
      'Pozadí pro vkládání do chatu';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Zobrazí se ve vkládaných pozvánkách v chatu.';

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
      'Koruna vlastníka komunity';

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
      'Platí pouze na širokých obrazovkách.';

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
      'Otevřít práh historie zpráv';

  @override
  String get guildSettingsMessageHistoryThresholdTitle => 'Práh historie zpráv';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Povolit práh historie zpráv';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Datum prahu';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Členové bez oprávnění Číst historii zpráv si mohou prohlížet zprávy odeslané po tomto datu.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Práh historie zpráv aktualizován';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Povolit velká písmena a mezery v názvech textových kanálů. Vypnuto omezuje názvy na malá písmena s pomlčkami a podtržítky.';

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
  String get guildSettingsAfkChannel => 'AFK / nečinný kanál';

  @override
  String get guildSettingsAfkChannelHint =>
      'Přesunout členy do tohoto kanálu, když jsou AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Žádný AFK kanál';

  @override
  String get guildSettingsAfkTimeout => 'AFK časový limit';

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
      'Automaticky kontrolujte zprávy na explicitní obsah v kanálech, které nejsou označeny jako pro dospělé.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Komunity uvedené v Discovery musí skenovat všechny členy. Toto nastavení nelze změnit, dokud je povoleno Discovery.';

  @override
  String get guildSettingsContentFilterOff => 'Vypnuto';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Nechte komunitu moderovat se sama';

  @override
  String get guildSettingsContentFilterNoRole => 'Filtrovat členy bez rolí';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Doporučeno pro většinu komunit';

  @override
  String get guildSettingsContentFilterAll => 'Filtrovat všechny';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Maximální ochrana pro rodinné prostory';

  @override
  String get guildSettingsModerationMatureOff => 'Vypnuto';

  @override
  String get guildSettingsModerationMatureOn => 'Zapnuto';

  @override
  String get guildSettingsContentWarningToggle => 'Zobrazit varování o obsahu';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Přepíná výzvu k souhlasu před vstupem do jakéhokoli kanálu.';

  @override
  String get guildSettingsContentWarningText => 'Vlastní text varování';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Toto obsahuje citlivý obsah.';

  @override
  String get guildSettingsModeration2faTitle => 'Požadavek 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'Vyžadujte dvoufaktorové ověření pro moderátory, než budou moci zabanovat, vyhodit, ztlumit nebo odstranit zprávy.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Vyžadovat 2FA pro akce moderování';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Toto nastavení může změnit pouze vlastník komunity';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Povolte 2FA na svém účtu, abyste mohli toto nastavení změnit';

  @override
  String get guildSettingsEmojiSearchHint => 'Hledat emotikony';

  @override
  String get guildSettingsEmojiUploadTitle => 'Nahrát emotikon';

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
    return 'Neanimované emotikony ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Animované emotikony ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Hledat samolepky';

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
    return 'Vytvářejte webhooky z nastavení kanálu. Upravujte je zde.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'Vaše vlastní URL nebude fungovat, pokud alespoň jeden kanál nebude viditelný pro všechny.';

  @override
  String get guildSettingsVanityUrlRemove => 'Odstranit';

  @override
  String get guildSettingsBannedUsersTitle => 'Zabanovaní uživatelé';

  @override
  String get guildSettingsInvitesTableInviter => 'Zval';

  @override
  String get guildSettingsInvitesTableChannel => 'Kanál';

  @override
  String get guildSettingsInvitesTableCode => 'Kód';

  @override
  String get guildSettingsInvitesTableUses => 'Použití';

  @override
  String get guildSettingsInvitesTableCreated => 'Vytvořeno';

  @override
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsMembersSortNewest => 'Nejnovější první';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtrovat podle uživatele';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtrovat podle akce';

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
