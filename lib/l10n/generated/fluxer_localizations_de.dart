// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class FluxerLocalizationsDe extends FluxerLocalizations {
  FluxerLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get reconnectingTitle => 'Wir haben\'s vermasselt!';

  @override
  String get reconnectingBody =>
      'Irgendetwas stimmt mit den Servern nicht.\nSollte gleich behoben sein!';

  @override
  String get gatewayReconnectingToast => 'Erneut verbinden…';

  @override
  String get gatewayConnectedToast => 'Verbunden';

  @override
  String get sessionExpiredToast =>
      'Deine Sitzung ist abgelaufen. Bitte melde dich erneut an.';

  @override
  String splashStartupFailed(String error) {
    return 'Konnte nicht starten: $error';
  }

  @override
  String get retry => 'Erneut versuchen';

  @override
  String get connectingCaps => 'VERBINDEN';

  @override
  String get splashConnectionLost => 'Verbindung verloren';

  @override
  String get splashViewOnStatusPage => 'Auf der Statusseite anzeigen';

  @override
  String get splashConnectionIssuesPrompt => 'Verbindungsprobleme?';

  @override
  String get splashStatusPageLink => 'Statusseite';

  @override
  String get splashReadIncident => 'Störung anzeigen';

  @override
  String get splashIncidentHistory => 'Störungsverlauf';

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
  String get welcomeBack => 'Willkommen zurück';

  @override
  String get email => 'E-Mail';

  @override
  String get emailInvalid => 'Bitte gib eine gültige E-Mail-Adresse ein.';

  @override
  String get password => 'Passwort';

  @override
  String get forgotPassword => 'Passwort vergessen?';

  @override
  String get logIn => 'Anmelden';

  @override
  String get logInWithPasskey => 'Mit einem Passkey anmelden';

  @override
  String continueWithSso(String provider) {
    return 'Mit $provider fortfahren';
  }

  @override
  String get ssoRequired =>
      'SSO ist erforderlich, um auf diese Instanz zuzugreifen.';

  @override
  String get organizationSsoProvider =>
      'Melde dich mit dem SSO-Anbieter deiner Organisation an.';

  @override
  String get failedToStartSso => 'SSO konnte nicht gestartet werden';

  @override
  String get ssoCancelled => 'SSO-Anmeldung wurde abgebrochen';

  @override
  String preferSso(String provider) {
    return 'Bevorzugst du SSO? Mit $provider fortfahren.';
  }

  @override
  String get logInViaBrowser => 'Über Browser anmelden';

  @override
  String get needAccountPrompt => 'Noch keinen Account? ';

  @override
  String get register => 'Registrieren';

  @override
  String get orDivider => 'ODER';

  @override
  String get captchaTitle => 'Bestätige, dass du ein Mensch bist';

  @override
  String get captchaDescription =>
      'Wir müssen sicherstellen, dass du kein Bot bist. Bitte führe folgende Überprüfung durch.';

  @override
  String get captchaSwitchToHcaptcha =>
      'Probleme? Versuche es stattdessen mit hCaptcha';

  @override
  String get captchaSwitchToTurnstile =>
      'Versuche es stattdessen mit Turnstile';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get ipAuthCheckEmail => 'Überprüfe deine E-Mails';

  @override
  String ipAuthDescription(String email) {
    return 'Wir haben einen Link zur Autorisierung dieser Anmeldung per E-Mail gesendet. Bitte öffne deinen Posteingang für $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Verbindung verloren';

  @override
  String get ipAuthConnectionLostDescription =>
      'Die Verbindung ist während des Wartens auf die Autorisierung verloren gegangen. Bitte versuche es erneut.';

  @override
  String get ipAuthLinkExpired => 'Anmelde-Link abgelaufen';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Dieser Autorisierungslink ist abgelaufen. Bitte melde dich erneut an.';

  @override
  String get ipAuthResendEmail => 'E-Mail erneut senden';

  @override
  String get ipAuthResent => 'Erneut gesendet';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Zurück';

  @override
  String get mfaTitle => 'Zwei-Faktor-Authentifizierung';

  @override
  String get mfaChooseMethod => 'Wähle eine Verifizierungsmethode';

  @override
  String get mfaMethodTotp => 'Authenticator-App';

  @override
  String get mfaMethodWebauthn => 'Sicherheitsschlüssel / Passkey';

  @override
  String get mfaTotpDescription =>
      'Gib den 6-stelligen Code aus deiner Authenticator-App oder einen deiner Backup-Codes ein.';

  @override
  String get mfaCodeLabel => 'Code';

  @override
  String get mfaTryAnotherMethod => 'Andere Methode versuchen';

  @override
  String get mfaUseSecurityKey =>
      'Sicherheitsschlüssel / Passkey stattdessen versuchen';

  @override
  String get accountSelectorTitle => 'Account auswählen';

  @override
  String get accountSelectorDescription =>
      'Wähle einen Account aus, um fortzufahren, oder füge einen anderen hinzu.';

  @override
  String get accountAdd => 'Account hinzufügen';

  @override
  String get accountRemove => 'Entfernen';

  @override
  String accountRemoveTitle(String username) {
    return '$username entfernen';
  }

  @override
  String get accountRemoveDescription =>
      'Dadurch wird die gespeicherte Sitzung für diesen Account entfernt.';

  @override
  String get accountRemoveOnlyDescription =>
      'Dadurch wird der einzige gespeicherte Account auf diesem Gerät entfernt.';

  @override
  String get accountExpired => 'Abgelaufen';

  @override
  String accountSessionExpired(String identifier) {
    return 'Sitzung für $identifier abgelaufen. Bitte melde dich erneut an.';
  }

  @override
  String get accountManageTitle => 'Accounts verwalten';

  @override
  String get accountSwitchFailed =>
      'Konnte Account nicht wechseln. Versuche es erneut.';

  @override
  String get profileTabMenuSwitchAccounts => 'Account wechseln';

  @override
  String get statusChangeSheetTitle => 'Status festlegen';

  @override
  String get statusOnlineStatusSection => 'Online-Status';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusIdle => 'Abwesend';

  @override
  String get statusDnd => 'Nicht stören';

  @override
  String get statusInvisible => 'Unsichtbar';

  @override
  String get statusOffline => 'Offline';

  @override
  String get statusUntilIChangeIt => 'Bis ich es ändere';

  @override
  String get statusDontClear => 'Nicht löschen';

  @override
  String get statusFor10Seconds => 'Für 10 Sekunden';

  @override
  String get statusClearAfter10Seconds => '10 Sekunden';

  @override
  String get statusClearAfter15Minutes => '15 Minuten';

  @override
  String get statusClearAfter30Minutes => '30 Minuten';

  @override
  String get statusClearAfter1Hour => '1 Stunde';

  @override
  String get statusClearAfter3Hours => '3 Stunden';

  @override
  String get statusClearAfter4Hours => '4 Stunden';

  @override
  String get statusClearAfter8Hours => '8 Stunden';

  @override
  String get statusClearAfter24Hours => '24 Stunden';

  @override
  String get statusClearAfter3Days => '3 Tage';

  @override
  String get statusDndDescription =>
      'Du erhältst keine Benachrichtigungen auf dem Desktop';

  @override
  String get statusInvisibleDescription => 'Du erscheinst offline';

  @override
  String get customStatusSetTitle => 'Benutzerdefinierten Status festlegen';

  @override
  String get customStatusCurrentHint => 'Benutzerdefinierter Status';

  @override
  String get customStatusClear => 'Benutzerdefinierten Status löschen';

  @override
  String get customStatusPlaceholder => 'Was passiert gerade?';

  @override
  String get customStatusChooseEmoji => 'Emoji auswählen';

  @override
  String get customStatusClearAfter => 'Löschen nach';

  @override
  String get customStatusSave => 'Speichern';

  @override
  String get accountActive => 'Aktiver Account';

  @override
  String get signOut => 'Abmelden';

  @override
  String get suspendedPermanentTitle => 'Account dauerhaft gesperrt';

  @override
  String get suspendedTemporaryTitle => 'Account gesperrt';

  @override
  String get suspendedPermanentDescription =>
      'Dein Account wurde dauerhaft wegen Verstoßes gegen unsere Nutzungsbedingungen gesperrt.';

  @override
  String get suspendedTemporaryDescription =>
      'Dein Account wurde vorübergehend gesperrt. Du kannst auf deinen Account zugreifen, sobald die Dauer der Sperrung abgelaufen ist.';

  @override
  String get suspendedIssuedAt => 'Ausgestellt';

  @override
  String get suspendedEndsAt => 'Endet';

  @override
  String get suspendedDuration => 'Dauer';

  @override
  String get suspendedPermanent => 'Dauerhaft';

  @override
  String get suspendedReason => 'Grund';

  @override
  String get suspendedAppealDeadline => 'Frist für Überprüfung';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Dein Account ist zur Löschung am $date vorgesehen.';
  }

  @override
  String get suspendedRecheck => 'Auf Updates überprüfen';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'In ${seconds}s erneut prüfen';
  }

  @override
  String get suspendedBackToLogin => 'Zurück zum Login';

  @override
  String get suspendedAppealTitle => 'Überprüfung';

  @override
  String get suspendedAppealHint =>
      'Erkläre, warum deine Sperrung überdacht werden sollte (mindestens 50 Zeichen)...';

  @override
  String get suspendedAppealSubmit => 'Überprüfung einreichen';

  @override
  String get suspendedAppealPending => 'Wartet auf Überprüfung';

  @override
  String get suspendedAppealAccepted => 'Überprüfung akzeptiert';

  @override
  String get suspendedAppealRejected => 'Überprüfung abgelehnt';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Dein Einspruch wurde angenommen und dein Account wurde wiederhergestellt.';

  @override
  String get suspendedSignIn => 'Melde dich bei deinem Account an';

  @override
  String get forgotPasswordTitle => 'Passwort vergessen?';

  @override
  String get forgotPasswordDescription =>
      'Gib deine E-Mail-Adresse ein und wir senden dir einen Link zum Zurücksetzen deines Passworts.';

  @override
  String get forgotPasswordSubmit => 'Link zum Zurücksetzen senden';

  @override
  String get forgotPasswordSentTitle => 'Überprüfe deine E-Mails';

  @override
  String get forgotPasswordSentDescription =>
      'Wir haben Anweisungen zum Zurücksetzen des Passworts an deine E-Mail-Adresse gesendet. Bitte überprüfe deinen Posteingang und folge dem Link, um dein Passwort zurückzusetzen.';

  @override
  String get forgotPasswordBackToLogin => 'Zurück zum Login';

  @override
  String get resetPasswordTitle => 'Neues Passwort festlegen';

  @override
  String get resetPasswordDescription =>
      'Gib unten dein neues Passwort ein, um den Zurücksetzungsvorgang abzuschließen.';

  @override
  String get resetPasswordNewPassword => 'Neues Passwort';

  @override
  String get resetPasswordConfirm => 'Neues Passwort bestätigen';

  @override
  String get resetPasswordSubmit => 'Passwort zurücksetzen';

  @override
  String get resetPasswordMismatch => 'Passwörter stimmen nicht überein.';

  @override
  String get registerTitle => 'Account erstellen';

  @override
  String get registerDisplayName => 'Anzeigename (Optional)';

  @override
  String get registerDisplayNameHint => 'Wie sollen dich die Leute nennen?';

  @override
  String get registerUsername => 'Benutzername (Optional)';

  @override
  String get registerUsernameHint =>
      'Leer lassen für einen zufälligen Benutzernamen';

  @override
  String get registerUsernameTagHint =>
      'Eine 4-stellige Kennung wird automatisch hinzugefügt, um die Einzigartigkeit zu gewährleisten';

  @override
  String get registerDateOfBirth => 'Geburtsdatum';

  @override
  String get registerMonth => 'Monat';

  @override
  String get registerDay => 'Tag';

  @override
  String get registerYear => 'Jahr';

  @override
  String get registerConsent =>
      'Ich stimme den Nutzungsbedingungen und der Datenschutzerklärung zu';

  @override
  String get registerConsentPrefix => 'Ich stimme den ';

  @override
  String get registerConsentTerms => 'Nutzungsbedingungen';

  @override
  String get registerConsentAnd => ' und ';

  @override
  String get registerConsentPrivacy => 'Datenschutzerklärung';

  @override
  String get registerConfirmPassword => 'Passwort bestätigen';

  @override
  String get registerSubmit => 'Account erstellen';

  @override
  String get registerHaveAccount => 'Hast du bereits einen Account? ';

  @override
  String get passkeyNoCredentials =>
      'Keine Passkeys für diese App gefunden. Melde dich stattdessen mit E-Mail und Passwort an.';

  @override
  String get passkeyDeviceNotSupported =>
      'Passkeys werden auf diesem Gerät nicht unterstützt.';

  @override
  String get passkeyDomainNotAssociated =>
      'Passkeys sind für diese App nicht konfiguriert. Melde dich stattdessen mit E-Mail und Passwort an.';

  @override
  String get passkeyTimeout =>
      'Passkey-Authentifizierung Zeitüberschreitung. Bitte versuche es erneut.';

  @override
  String get passkeyNotAvailable =>
      'Passkeys sind für diese App nicht verfügbar. Melde dich stattdessen mit E-Mail und Passwort an.';

  @override
  String get passkeyFailed =>
      'Die Passkey-Authentifizierung ist fehlgeschlagen. Bitte versuche es erneut.';

  @override
  String get errorUnableToCreateAccount =>
      'Account konnte nicht erstellt werden. Bitte versuche es erneut.';

  @override
  String get errorUnableToSignIn =>
      'Anmeldung derzeit nicht möglich. Bitte versuche es erneut.';

  @override
  String get errorInvalidEmailOrPassword =>
      'Ungültige E-Mail-Adresse oder Passwort.';

  @override
  String get errorUnableToSendResetLink =>
      'Zurücksetzungslink konnte nicht gesendet werden. Bitte versuche es erneut.';

  @override
  String get errorUnableToResetPassword =>
      'Passwort konnte nicht zurückgesetzt werden. Bitte versuche es erneut.';

  @override
  String get embedInviteJoin => 'Community beitreten';

  @override
  String get embedInviteGoTo => 'Zur Community';

  @override
  String embedInviteOnline(String count) {
    return '$count Online';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count Mitglieder';
  }

  @override
  String get embedInviteUnknownTitle => 'Unbekannte Einladung';

  @override
  String get embedInviteUnknownSubtitle =>
      'Bitte fordere eine neue Einladung an.';

  @override
  String get embedInviteUnavailable => 'Einladung nicht verfügbar';

  @override
  String get inviteAcceptTitle => 'Du wurdest eingeladen zu';

  @override
  String get inviteAcceptJoinButton => 'Community beitreten';

  @override
  String get inviteAcceptGoToButton => 'Zur Community';

  @override
  String get inviteAcceptInvitesPaused => 'Einladungen pausiert';

  @override
  String get inviteAcceptNotFoundTitle => 'Einladung ungültig';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Diese Einladung ist möglicherweise abgelaufen oder ungültig.';

  @override
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'Gruppe beitreten';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Du wurdest von $inviterName eingeladen, einer Gruppen-DM beizutreten';
  }

  @override
  String get inviteAcceptSomeone => 'jemand';

  @override
  String get inviteAcceptEmojiPack => 'Emoji-Paket';

  @override
  String get inviteAcceptStickerPack => 'Sticker-Paket';

  @override
  String get inviteAcceptInstallEmojiPack => 'Emoji-Paket installieren';

  @override
  String get inviteAcceptInstallStickerPack => 'Sticker-Paket installieren';

  @override
  String get inviteAcceptPackInstallNote =>
      'Durch Annahme dieser Einladung wird das Paket automatisch installiert.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Kanalzugriff verweigert';

  @override
  String get channelAccessDeniedDescription =>
      'Du hast keinen Zugriff auf den Kanal, in dem diese Nachricht gesendet wurde.';

  @override
  String get messageJumpLinkNoAccess => 'Kein Zugriff';

  @override
  String get okay => 'Okay';

  @override
  String get embedThemeTitle => 'Geteiltes Design';

  @override
  String get embedThemeSubtitle =>
      'Dieser Client unterstützt keine benutzerdefinierten Designs.';

  @override
  String get embedThemeUnavailableButton => 'Designs nicht verfügbar';

  @override
  String get privacySettings => 'Datenschutzeinstellungen';

  @override
  String get privacyDirectMessages => 'Direktnachrichten';

  @override
  String get privacyDirectMessagesDescription =>
      'Direktnachrichten von anderen Mitgliedern in dieser Community zulassen';

  @override
  String get privacyBotDirectMessages => 'Bot-Direktnachrichten';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Bots aus dieser Community erlauben, dir Direktnachrichten zu senden';

  @override
  String get privacyMutualDmsDisabled =>
      'Die Community-Administratoren haben den Empfang von Direktnachrichten nur von gemeinsamen Mitgliedern in dieser Community deaktiviert.';

  @override
  String get communityDebug => 'Community-Debug';

  @override
  String get copiedToClipboard => 'In die Zwischenablage kopiert';

  @override
  String get notificationSettings => 'Benachrichtigungseinstellungen';

  @override
  String notificationMuteGuild(String guildName) {
    return '$guildName stummschalten';
  }

  @override
  String get notificationMuteDescription =>
      'Das Stummschalten einer Community verhindert, dass ungelesene Indikatoren und Benachrichtigungen angezeigt werden, es sei denn, du wirst erwähnt.';

  @override
  String get notificationCommunitySettings =>
      'Community-Benachrichtigungseinstellungen';

  @override
  String get notificationAllMessages => 'Alle Nachrichten';

  @override
  String get notificationOnlyMentions => 'Nur Erwähnungen';

  @override
  String get notificationNothing => 'Nichts';

  @override
  String get notificationSuppressEveryone => '@everyone und @here unterdrücken';

  @override
  String get notificationSuppressRoles => 'Alle Rollenerwähnungen unterdrücken';

  @override
  String get notificationMobilePush => 'Mobile Push-Benachrichtigungen';

  @override
  String get notificationOverrides => 'Benachrichtigungs-Overrides';

  @override
  String get notificationSelectChannel => 'Kanal oder Kategorie auswählen';

  @override
  String get notificationOnlyAtMentions => 'Nur @Erwähnungen';

  @override
  String get notificationMuteChannel => 'Kanal stummschalten';

  @override
  String get notificationUnmuteChannel => 'Kanal-Entstummschaltung';

  @override
  String get notificationNoCategory => 'Keine Kategorie';

  @override
  String get dmMarkAsRead => 'Als gelesen markieren';

  @override
  String get dmMuteConversation => 'DM stummschalten';

  @override
  String get dmUnmuteConversation => 'DM-Entstummschaltung';

  @override
  String get dmPinDm => 'DM anheften';

  @override
  String get dmUnpinDm => 'DM lösen';

  @override
  String get dmAlwaysShowInSidebar => 'Immer in der Seitenleiste anzeigen';

  @override
  String get dmRemoveFromAlwaysShown => 'Aus „Immer anzeigen“ entfernen';

  @override
  String get dmCloseDm => 'DM schließen';

  @override
  String get dmCloseDmConfirmTitle => 'DM schließen';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Möchtest du deine Direktnachricht mit $username wirklich schließen? Du kannst sie jederzeit wieder öffnen.';
  }

  @override
  String get dmCopyChannelId => 'Kanal-ID kopieren';

  @override
  String get dmChannelIdCopied => 'Kanal-ID kopiert';

  @override
  String get dmCopyUserId => 'Benutzer-ID kopieren';

  @override
  String get dmUserIdCopied => 'Benutzer-ID kopiert';

  @override
  String get dmViewProfile => 'Profil anzeigen';

  @override
  String get dmVoiceCall => 'Sprachanruf starten';

  @override
  String get incomingVoiceCallTitle => 'Eingehender Sprachanruf';

  @override
  String get incomingVoiceCallAccept => 'Annehmen';

  @override
  String get incomingVoiceCallDecline => 'Ablehnen';

  @override
  String get incomingVoiceCallLabel => 'Eingehender Anruf';

  @override
  String get incomingVoiceCallIgnore => 'Ignorieren';

  @override
  String get directVoiceCallNotEligible =>
      'Dieser Anruf kann gerade nicht gestartet werden. Versuche es gleich noch einmal.';

  @override
  String get voiceJoinCallFailed =>
      'Verbindung zu diesem Anruf konnte nicht hergestellt werden. Überprüfe deine Verbindung und versuche es erneut.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Verbindung zu diesem Anruf konnte nicht hergestellt werden. Überprüfe deine Verbindung und versuche es erneut.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Dieser Anruf konnte auf dem Server nicht aktualisiert werden. Überprüfe deine Verbindung und versuche es erneut.';

  @override
  String get dmAddNote => 'Notiz hinzufügen';

  @override
  String get dmEditGroup => 'Gruppen-DM bearbeiten';

  @override
  String get dmInviteToCommunity => 'Zur Community einladen';

  @override
  String get dmBlock => 'Blockieren';

  @override
  String get dmLeaveGroup => 'Gruppe verlassen';

  @override
  String get dmNoCommunitiesAvailable => 'Keine Communitys verfügbar';

  @override
  String dmGroupMemberCount(int count) {
    return '$count Mitglieder';
  }

  @override
  String get dmMuteFor15Min => 'Für 15 Minuten';

  @override
  String get dmMuteFor30Min => 'Für 30 Minuten';

  @override
  String get dmMuteFor1Hour => 'Für 1 Stunde';

  @override
  String get dmMuteFor3Hours => 'Für 3 Stunden';

  @override
  String get dmMuteFor4Hours => 'Für 4 Stunden';

  @override
  String get dmMuteFor8Hours => 'Für 8 Stunden';

  @override
  String get dmMuteFor24Hours => 'Für 24 Stunden';

  @override
  String get dmMuteFor3Days => 'Für 3 Tage';

  @override
  String get dmMuteForever => 'Bis ich es wieder aktiviere';

  @override
  String get dmPinGroupDm => 'Gruppen-DM anheften';

  @override
  String get dmUnpinGroupDm => 'Gruppen-DM anheften aufheben';

  @override
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
  }

  @override
  String get dmFavoriteDm => 'DM als Favorit markieren';

  @override
  String get dmUnfavoriteDm => 'DM-Favorit entfernen';

  @override
  String get dmFavoriteGroupDm => 'Gruppen-DM als Favorit markieren';

  @override
  String get dmUnfavoriteGroupDm => 'Gruppen-DM-Favorit entfernen';

  @override
  String get dmChangeFriendNickname => 'Anzeigename des Freundes ändern';

  @override
  String get dmRemoveFriend => 'Freund entfernen';

  @override
  String get dmAddFriend => 'Freund hinzufügen';

  @override
  String get dmAcceptFriendRequest => 'Freundschaftsanfrage annehmen';

  @override
  String get dmIgnoreFriendRequest => 'Freundschaftsanfrage ignorieren';

  @override
  String get dmFriendRequestSent => 'Freundschaftsanfrage gesendet';

  @override
  String get dmUnblock => 'Blockieren aufheben';

  @override
  String get dmDebugUser => 'Benutzer debuggen';

  @override
  String get dmDebugChannel => 'Kanal debuggen';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => 'DM angeheftet';

  @override
  String get dmUnpinned => 'DM angeheftet aufgehoben';

  @override
  String get dmMuted => 'DM stummgeschaltet';

  @override
  String get dmUnmuted => 'DM-Stummschaltung aufgehoben';

  @override
  String get dmRemoveFriendConfirmTitle => 'Freund entfernen';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Möchtest du $username wirklich als Freund entfernen?';
  }

  @override
  String get dmBlockConfirmTitle => 'Benutzer blockieren';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Möchtest du $username wirklich blockieren? Er/Sie kann dir dann keine Nachrichten mehr senden oder Freundschaftsanfragen stellen.';
  }

  @override
  String get dmFriendRequestSentToast => 'Freundschaftsanfrage gesendet';

  @override
  String get dmFriendRequestFailed =>
      'Freundschaftsanfrage konnte nicht gesendet werden';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Freundschaftsanfrage konnte nicht angenommen werden';

  @override
  String get dmRemoveFriendFailed => 'Freund konnte nicht entfernt werden';

  @override
  String get dmBlockFailed => 'Benutzer konnte nicht blockiert werden';

  @override
  String get dmUnblockFailed =>
      'Blockierung des Benutzers konnte nicht aufgehoben werden';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Freundschaftsanfrage konnte nicht ignoriert werden';

  @override
  String get dmAddFriends => 'Freunde hinzufügen';

  @override
  String get addFriendSheetTitle => 'Freund hinzufügen';

  @override
  String get addFriendUsernameHint => 'Benutzername#0000';

  @override
  String get addFriendUsernameLabel => 'Benutzername des Freundes';

  @override
  String get addFriendSendRequest => 'Anfrage senden';

  @override
  String get addFriendNoUserFound =>
      'Kein Benutzer mit diesem Benutzernamen gefunden.';

  @override
  String get addFriendInvalidUsername =>
      'Gib einen gültigen Benutzernamen ein (Benutzername#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Freundschaftsanfrage gesendet';

  @override
  String get addFriendClaimTitle => 'Account beanspruchen';

  @override
  String get addFriendClaimDescription =>
      'Beanspruche deinen Account, um Freundschaftsanfragen zu senden.';

  @override
  String get addFriendVerifyTitle => 'E-Mail verifizieren';

  @override
  String get addFriendVerifyDescription =>
      'Du musst deine E-Mail-Adresse verifizieren, bevor du Freundschaftsanfragen senden kannst.';

  @override
  String get addFriendVerifyEmail => 'E-Mail verifizieren';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Eingehende Freundschaftsanfragen ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Ausgehende Freundschaftsanfragen ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Eingehende Freundschaftsanfrage';

  @override
  String get addFriendOutgoingStatus => 'Freundschaftsanfrage gesendet';

  @override
  String get addFriendViewProfile => 'Profil anzeigen';

  @override
  String get addFriendAccept => 'Annehmen';

  @override
  String get addFriendIgnore => 'Ignorieren';

  @override
  String get addFriendAcceptTitle => 'Freundschaftsanfrage annehmen';

  @override
  String get addFriendIgnoreTitle => 'Freundschaftsanfrage ignorieren';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Freundschaftsanfrage von $userName annehmen?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Freundschaftsanfrage von $displayName ignorieren?';
  }

  @override
  String get addFriendCancelRequest => 'Anfrage abbrechen';

  @override
  String get addFriendCancelRequestFailed =>
      'Freundschaftsanfrage konnte nicht abgebrochen werden. Versuche es erneut.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Diese Person nimmt derzeit keine Freundschaftsanfragen an.';

  @override
  String get addFriendUnblockFirst =>
      'Entblockiere die Person zuerst, um eine Freundschaftsanfrage zu senden.';

  @override
  String get addFriendCannotSendToSelf =>
      'Du kannst dir selbst keine Freundschaftsanfrage senden.';

  @override
  String get addFriendAlreadyFriends => 'Ihr seid bereits Freunde.';

  @override
  String get addFriendClaimToSend =>
      'Schließe die Registrierung ab, um Freundschaftsanfragen zu senden.';

  @override
  String get addFriendSendFailedGeneric =>
      'Freundschaftsanfrage konnte nicht gesendet werden. Versuche es erneut.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'System';

  @override
  String get emojiSearchPlaceholder => 'Finde das Emoji deiner Träume';

  @override
  String get emojiSearchEmpty => 'Keine Emojis entsprechen deiner Suche';

  @override
  String get emojiAutocompleteDefaultLabel => 'Standard-Emoji';

  @override
  String get emojiFrequentlyUsed => 'Häufig verwendet';

  @override
  String get emojiTabGifs => 'GIFs';

  @override
  String get emojiTabMedia => 'Medien';

  @override
  String get emojiTabStickers => 'Sticker';

  @override
  String get emojiTabEmojis => 'Emojis';

  @override
  String get gifPickerSearch => 'GIFs suchen';

  @override
  String get gifPickerSearchKlipy => 'KLIPY suchen';

  @override
  String get gifPickerSearchTenor => 'Tenor suchen';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Favoriten';

  @override
  String get gifPickerTrending => 'Trend-GIFs';

  @override
  String get gifPickerNoResultsTitle => 'Keine Suchergebnisse';

  @override
  String get gifPickerNoResultsDescription =>
      'Versuche einen anderen Suchbegriff';

  @override
  String get gifPickerLoadFailedTitle => 'GIFs konnten nicht geladen werden';

  @override
  String get gifPickerLoadFailedBody =>
      'Überprüfe deine Verbindung und versuche es erneut.';

  @override
  String get emojiCategoryPeople => 'Personen';

  @override
  String get emojiCategoryNature => 'Natur';

  @override
  String get emojiCategoryFood => 'Essen & Trinken';

  @override
  String get emojiCategoryActivity => 'Aktivitäten';

  @override
  String get emojiCategoryTravel => 'Reisen & Orte';

  @override
  String get emojiCategoryObjects => 'Objekte';

  @override
  String get emojiCategorySymbols => 'Symbole';

  @override
  String get emojiCategoryFlags => 'Flaggen';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Schalte $emojiCount aus $communityCount mit Plutonium frei.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Plutonium holen';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Dies nicht mehr anzeigen';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count benutzerdefinierte Emojis',
      one: '1 benutzerdefiniertes Emoji',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Communitys',
      one: '1 Community',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Warnung vor externem Link';

  @override
  String get externalLinkWarningLeaving => 'Du bist dabei, Fluxer zu verlassen';

  @override
  String get externalLinkWarningDescription =>
      'Externe Links können gefährlich sein. Bitte sei vorsichtig.';

  @override
  String get externalLinkWarningDestinationUrl => 'Ziel-URL:';

  @override
  String get externalLinksSectionTitle => 'Externe Links';

  @override
  String get externalLinksSectionDescription =>
      'Konfiguriere, wie externe Link-Warnungen behandelt werden.';

  @override
  String get externalLinkWarningTrustPrefix => 'Immer vertrauen ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' – diese Warnung beim nächsten Mal überspringen';

  @override
  String get externalLinkVisitSite => 'Website besuchen';

  @override
  String get externalLinkTrustAllLabel => 'Alle externen Links vertrauen';

  @override
  String get externalLinkStripTrackingLabel =>
      'Tracking-Parameter aus URLs entfernen';

  @override
  String get externalLinkStripTrackingDescription =>
      'Entferne automatisch Tracking-Parameter (wie utm_source, fbclid, gclid) aus URLs in Nachrichten, die du sendest. Bereinigt den Link, bevor er jemanden erreicht.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Allen externen Links vertrauen?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Dadurch werden alle externen Links vertrauenswürdig und die Warnung für jede Domain übersprungen. Deine vorhandenen vertrauenswürdigen Domains werden ersetzt. Dies ist weniger sicher.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Alle vertrauen';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Vertrauen in alle Links beenden?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Warnungen für externe Links werden wieder angezeigt. Du musst vertrauenswürdige Domains einzeln hinzufügen.';

  @override
  String get externalLinkStopTrustingAllAction => 'Vertrauen in alle beenden';

  @override
  String get externalLinkTrustedAllDescription =>
      'Allen externen Links wird vertraut. Warnungen werden nicht angezeigt.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Du hast $count vertrauenswürdige Domain(s). Füge weitere hinzu, indem du das Kästchen anklickst, wenn du externe Links besuchst.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Wenn aktiviert, werden keine Warnungen für externe Links angezeigt. Dies ist weniger sicher.';

  @override
  String get imageFileTooLarge =>
      'Bilddatei ist zu groß. Bitte wähle eine Datei, die kleiner als 10 MB ist.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Animierte Avatare erfordern Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Animierte Banner erfordern Plutonium';

  @override
  String get animatedAvifNotSupported => 'Animiertes AVIF nicht unterstützt';

  @override
  String get animatedAvifNotSupportedBody =>
      'Das Zuschneiden und Drehen von animierten AVIF-Dateien wird noch nicht unterstützt. Wenn du fortfährst, wird es in seiner ursprünglichen Form hochgeladen.';

  @override
  String get uploadAsIs => 'Wie vorhanden hochladen';

  @override
  String get croppingAnimatedNotSupported =>
      'Das Zuschneiden animierter Bilder wird noch nicht unterstützt. Die ursprüngliche Datei wird verwendet.';

  @override
  String get cropAvatar => 'Avatar zuschneiden';

  @override
  String get cropBanner => 'Banner zuschneiden';

  @override
  String get skip => 'Überspringen';

  @override
  String get crop => 'Zuschneiden';

  @override
  String get changeYourFluxerTag => 'Deinen FluxerTag ändern';

  @override
  String get fluxerTagInputLabel => 'FluxerTag';

  @override
  String get fluxerTagDescriptionBase =>
      'Benutzernamen dürfen nur Buchstaben (a-z, A-Z), Zahlen (0-9) und Unterstriche enthalten. Benutzernamen sind nicht case-sensitiv.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Benutzernamen dürfen nur Buchstaben (a-z, A-Z), Zahlen (0-9) und Unterstriche enthalten. Benutzernamen sind nicht case-sensitiv. Du kannst jeden verfügbaren 4-stelligen Tag von #0000 bis #9999 auswählen.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Benutzernamen dürfen nur Buchstaben (a-z, A-Z), Zahlen (0-9) und Unterstriche enthalten. Benutzernamen sind nicht case-sensitiv. Du kannst jeden verfügbaren 4-stelligen Tag von #0001 bis #9999 auswählen.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Zwischen $min und $max Zeichen';
  }

  @override
  String get validationAllowedChars =>
      'Nur Buchstaben (a-z, A-Z), Zahlen (0-9) und Unterstriche (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Hol dir Plutonium, um deinen Tag anzupassen oder ihn beim Ändern deines Benutzernamens zu behalten';

  @override
  String get fluxerTagAlreadyTaken => 'FluxerTag bereits vergeben';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Der FluxerTag $username#$discriminator ist bereits vergeben. Wenn du fortfährst, wird dein Diskriminator automatisch neu ausgewürfelt.';
  }

  @override
  String get customTagIsTemporary => 'Benutzerdefinierter Tag ist temporär';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Dein benutzerdefinierter 4-stelliger Tag ist nur verfügbar, solange dein Plutonium-Abo aktiv ist. Wenn dein Abo am $date abläuft, wird dein Tag nach einer 3-tägigen Kulanzfrist auf eine zufällig zugewiesene Nummer zurückgesetzt.';
  }

  @override
  String get customTagTemporaryBody =>
      'Dein benutzerdefinierter 4-stelliger Tag ist nur verfügbar, solange dein Plutonium-Abo aktiv ist. Wenn dein Abo abläuft, wird dein Tag nach einer 3-tägigen Kulanzfrist auf eine zufällig zugewiesene Nummer zurückgesetzt.';

  @override
  String get iUnderstandContinue => 'Ich verstehe, weiter';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Wenn du diesen FluxerTag speicherst, wird dein benutzerdefinierter 4-stelliger Tag auf eine zufällige Nummer zurückgesetzt, wenn dein Plutonium-Abo endet. Wenn dein Abo nicht erneuert wird, hast du eine 3-tägige Kulanzfrist, bevor sich der Tag ändert.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Dein benutzerdefinierter 4-stelliger Tag (#$discriminator) ist aktiv, solange dein Plutonium-Abo aktiv ist. Wenn dein Abo nach einer 3-tägigen Kulanzfrist endet oder nicht erneuert wird, wird dein Tag auf eine zufällige Nummer zurückgesetzt.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Passe deinen 4-stelligen Tag an oder behalte ihn, wenn du deinen Benutzernamen änderst';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Deine Plutonium-Testversion läuft am $date ab. Upgrade, um deinen benutzerdefinierten Tag zu behalten und eine Auszeichnung auf deinem Profil zu erhalten.';
  }

  @override
  String get premiumTrialActive =>
      'Du befindest dich in einer Plutonium-Testversion. Upgrade, um deinen benutzerdefinierten Tag zu behalten und eine Auszeichnung auf deinem Profil zu erhalten.';

  @override
  String get fluxerTagUpdated => 'FluxerTag aktualisiert';

  @override
  String get fluxerTagUpdateFailed =>
      'FluxerTag konnte nicht aktualisiert werden. Bitte versuche es erneut.';

  @override
  String get continueAction => 'Weiter';

  @override
  String get profileCustomizationTitle => 'Profilanpassung';

  @override
  String get profileCustomizationDescription =>
      'Bearbeite das Aussehen deines Profils und sieh eine Live-Vorschau';

  @override
  String get usernameLabel => 'Benutzername';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Beanspruche deinen Account, um deinen FluxerTag zu ändern';

  @override
  String get changeFluxerTag => 'FluxerTag ändern';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Passe deinen 4-stelligen Tag (#$discriminator) mit Plutonium nach Belieben an';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Ändere deinen Benutzernamen und 4-stelligen Tag';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Dein benutzerdefinierter Tag (#$discriminator) ist an dein Plutonium-Abo gebunden und wird zu einem zufälligen Tag, wenn es abläuft.';
  }

  @override
  String get displayNameLabel => 'Anzeigename';

  @override
  String get pronounsLabel => 'Pronomen';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Avatar ändern';

  @override
  String get removeAvatar => 'Avatar entfernen';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Max. 10 MB. Empfohlen: 512×512px';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get changeBanner => 'Banner ändern';

  @override
  String get removeBanner => 'Banner entfernen';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Max. 10 MB. Mindestens: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Akzentfarbe';

  @override
  String get accentColorDescription =>
      'Passt die Rand- und Bannerfarbe deines Profils an';

  @override
  String get aboutMeLabel => 'Über mich';

  @override
  String get aboutMeHelperText =>
      'Du kannst Links, Emojis und Markdown verwenden.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle => 'Plutonium-Abzeichen-Datenschutz';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Lege fest, wie dein Plutonium-Abzeichen anderen angezeigt wird';

  @override
  String get hidePlutoniumBadgeLabel =>
      'Plutonium-Abzeichen komplett ausblenden';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Blende dein Plutonium-Abzeichen vollständig für andere Benutzer aus';

  @override
  String get hidePlutoniumPurchaseDate => 'Plutonium-Kaufdatum ausblenden';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Plutonium-Kaufdatum ausblenden ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Entferne das Datum deines ersten Plutonium-Kaufs von deinem Abzeichen';

  @override
  String get maskVisionaryAsSubscription => 'Visionary als Abo tarnen';

  @override
  String get maskVisionaryDescription =>
      'Zeige dein Visionary als reguläres Abo an';

  @override
  String get hideVisionaryIdBadge => 'Visionary-ID-Abzeichen ausblenden';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Visionary-ID-Abzeichen ausblenden (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription =>
      'Entferne dein Visionary-ID-Abzeichen';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Du bist in einer Plutonium-Testphase – dein Abo beginnt am $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Dein Abo beginnt automatisch, wenn deine Testphase endet. Keine Aktion erforderlich.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Du bist in einer Plutonium-Testphase, die am $date abläuft';
  }

  @override
  String get premiumTrialActiveProfile =>
      'Du bist in einer Plutonium-Testphase';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Max. 10 MB. Empfohlen: 512×512px. Animierte Avatare (GIF) erfordern Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Passe dein Profil mit einem statischen oder animierten Bannerbild an, um es hervorzuheben.';

  @override
  String get getPlutonium => 'Plutonium erhalten';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'In-App-Käufe sind auf dieser Plattform noch nicht verfügbar. Bleib dran – bald verfügbar!';

  @override
  String get profilePreviewLabel => 'Vorschau';

  @override
  String get profilePreviewMessage => 'Nachricht';

  @override
  String get profilePreviewMemberSince => 'Fluxer-Mitglied seit';

  @override
  String get unclaimedAccountTitle => 'Nicht beanspruchter Account';

  @override
  String get unclaimedAccountDescription =>
      'Dein Account wurde noch nicht beansprucht. Ohne E-Mail und Passwort könntest du den Zugriff verlieren. Beanspruche deinen Account jetzt, um ihn zu sichern.';

  @override
  String get claimAccount => 'Account beanspruchen';

  @override
  String get profileTypeLabel => 'Profiltyp';

  @override
  String get profileTypeGlobal => 'Globales Profil';

  @override
  String get profileTypeGuildDescription =>
      'Du bearbeitest dein Profil pro Community. Dieses Profil ist nur in dieser Community sichtbar und überschreibt dein globales Profil.';

  @override
  String get communityNicknameLabel => 'Community-Anzeigename';

  @override
  String get perGuildPremiumUpsellText =>
      'Das Anpassen deines Avatars, Banners, deiner Akzentfarbe und deines Profils für einzelne Communitys erfordert Plutonium. Community-Anzeigenamen und Pronomen sind für alle kostenlos.';

  @override
  String get avatarModeInherit => 'Globales Profil verwenden';

  @override
  String get avatarModeCustom => 'Benutzerdefiniertes Bild verwenden';

  @override
  String get avatarModeUnset => 'Nicht anzeigen';

  @override
  String get profileSavedToast => 'Profil aktualisiert';

  @override
  String get profileEditButton => 'Profil bearbeiten';

  @override
  String get profileNoteLabel => 'Notiz';

  @override
  String get profileNoteVisibility => '(nur für dich sichtbar)';

  @override
  String get profileNoteEmpty => 'Noch keine Notiz.';

  @override
  String get sudoTitle => 'Identität verifizieren';

  @override
  String get sudoDescription =>
      'Diese Aktion erfordert eine Verifizierung, um fortzufahren.';

  @override
  String get sudoAuthenticatorCode => 'Authenticator-Code';

  @override
  String get sudoMethodPassword => 'Passwort';

  @override
  String get sudoMethodTotp => 'Authenticator';

  @override
  String get sudoVerificationFailed =>
      'Verifizierung fehlgeschlagen. Bitte versuche es erneut.';

  @override
  String get securityAccountTitle => 'Account';

  @override
  String get securityAccountDescription =>
      'Verwalte deine E-Mail-Adresse, dein Passwort und deine Accounteinstellungen';

  @override
  String get securitySectionTitle => 'Sicherheit';

  @override
  String get securitySectionDescription =>
      'Schütze deinen Account mit Zwei-Faktor-Authentifizierung und Passkeys';

  @override
  String get securityLoginEmailSectionTitle => 'E-Mail-Einstellungen';

  @override
  String get securityLoginEmailSectionDescription =>
      'Verwalte die E-Mail-Adresse, mit der du dich bei Fluxer anmeldest';

  @override
  String get securityLoginEmailAddressLabel => 'E-Mail-Adresse';

  @override
  String get securityLoginNoEmailSet => 'Keine E-Mail-Adresse festgelegt';

  @override
  String get securityLoginChangeEmail => 'E-Mail ändern';

  @override
  String get securityLoginAddEmail => 'E-Mail hinzufügen';

  @override
  String get securityLoginReveal => 'Anzeigen';

  @override
  String get securityLoginHide => 'Ausblenden';

  @override
  String get securityLoginPasswordSectionTitle => 'Passwort';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Ändere dein Passwort, um deinen Account zu schützen';

  @override
  String get securityLoginCurrentPasswordLabel => 'Aktuelles Passwort';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Zuletzt geändert: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Zuletzt geändert: Nie';

  @override
  String get securityLoginNoPasswordSet => 'Kein Passwort festgelegt';

  @override
  String get securityLoginChangePassword => 'Passwort ändern';

  @override
  String get securityLoginSetPassword => 'Passwort festlegen';

  @override
  String get passwordChangeTitle => 'Passwort ändern';

  @override
  String get passwordChangeIntroDescription =>
      'Wir senden dir einen Verifizierungscode an deine E-Mail-Adresse, um deine Identität zu bestätigen, bevor du dein Passwort änderst.';

  @override
  String get passwordChangeStart => 'Starten';

  @override
  String get passwordChangeVerifyTitle => 'E-Mail verifizieren';

  @override
  String get passwordChangeVerifyDescription =>
      'Gib den Verifizierungscode ein, der an deine E-Mail-Adresse gesendet wurde.';

  @override
  String get passwordChangeVerificationCode => 'Verifizierungscode';

  @override
  String get passwordChangeVerify => 'Verifizieren';

  @override
  String get passwordChangeNewPasswordTitle => 'Neues Passwort festlegen';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Gib unten dein neues Passwort ein.';

  @override
  String get passwordChangeNewPassword => 'Neues Passwort';

  @override
  String get passwordChangeConfirmPassword => 'Neues Passwort bestätigen';

  @override
  String get passwordChangeSubmit => 'Passwort ändern';

  @override
  String get passwordChangeSuccess => 'Passwort geändert';

  @override
  String get passwordChangePasswordsDoNotMatch =>
      'Passwörter stimmen nicht überein';

  @override
  String get passwordChangeInvalidCode => 'Ungültiger oder abgelaufener Code';

  @override
  String get emailChangeTitle => 'E-Mail ändern';

  @override
  String get emailChangeIntroDescription =>
      'Wir senden dir Verifizierungscodes, um deine Identität zu bestätigen, bevor wir deine E-Mail-Adresse ändern.';

  @override
  String get emailChangeStart => 'Starten';

  @override
  String get emailChangeVerifyOriginalTitle => 'Aktuelle E-Mail verifizieren';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Gib den Verifizierungscode ein, der an deine aktuelle E-Mail-Adresse gesendet wurde.';

  @override
  String get emailChangeNewEmailTitle => 'Neue E-Mail eingeben';

  @override
  String get emailChangeNewEmailDescription =>
      'Gib die neue E-Mail-Adresse ein, die du verwenden möchtest.';

  @override
  String get emailChangeNewEmailLabel => 'Neue E-Mail';

  @override
  String get emailChangeNewEmailSubmit => 'Verifizierungscode senden';

  @override
  String get emailChangeVerifyNewTitle => 'Neue E-Mail verifizieren';

  @override
  String get emailChangeVerifyNewDescription =>
      'Gib den Verifizierungscode ein, der an deine neue E-Mail-Adresse gesendet wurde.';

  @override
  String get emailChangeSuccess => 'E-Mail geändert';

  @override
  String get emailChangeInvalidCode => 'Ungültiger oder abgelaufener Code';

  @override
  String get resend => 'Erneut senden';

  @override
  String resendCountdown(int seconds) {
    return 'Erneut senden (${seconds}s)';
  }

  @override
  String get verificationCode => 'Verifizierungscode';

  @override
  String get verify => 'Verifizieren';

  @override
  String get enable => 'Aktivieren';

  @override
  String get disable => 'Deaktivieren';

  @override
  String get delete => 'Löschen';

  @override
  String get save => 'Speichern';

  @override
  String get securityTfaSectionTitle => 'Zwei-Faktor-Authentifizierung';

  @override
  String get securityTfaSectionDescription =>
      'Füge deinem Account eine zusätzliche Sicherheitsebene hinzu';

  @override
  String get securityTfaAuthenticatorApp => 'Authenticator-App';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Zwei-Faktor-Authentifizierung ist aktiviert';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Verwende eine Authenticator-App, um Codes für die Zwei-Faktor-Authentifizierung zu generieren';

  @override
  String get securityTfaBackupCodes => 'Backup-Codes';

  @override
  String get securityTfaBackupCodesDescription =>
      'Zeige deine Backup-Codes zur Accountwiederherstellung an und verwalte sie';

  @override
  String get securityTfaViewCodes => 'Codes anzeigen';

  @override
  String get securityPasskeysSectionTitle => 'Passkeys';

  @override
  String get securityPasskeysSectionDescription =>
      'Verwende Passkeys für die passwortlose Anmeldung und Zwei-Faktor-Authentifizierung';

  @override
  String get securityPasskeysRegistered => 'Registrierte Passkeys';

  @override
  String get securityPasskeysNone => 'Keine Passkeys registriert';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Passkeys',
      one: 'Passkey',
    );
    return '$count $_temp0 registriert (max. 10)';
  }

  @override
  String get securityPasskeysAdd => 'Passkey hinzufügen';

  @override
  String securityPasskeysAdded(String date) {
    return 'Hinzugefügt: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Zuletzt verwendet: $date';
  }

  @override
  String get securityPasskeysRename => 'Umbenennen';

  @override
  String get securityPasskeysDeleteTitle => 'Passkey löschen';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Möchtest du den Passkey „$name“ wirklich löschen?';
  }

  @override
  String get securityPasskeyNameTitle => 'Passkey benennen';

  @override
  String get securityPasskeyNameLabel => 'Passkey-Name';

  @override
  String get securityPasskeyNameHint =>
      'z. B. YubiKey, iPhone, Arbeitscomputer';

  @override
  String get securityPhoneSectionTitle => 'Telefonnummer';

  @override
  String get securityPhoneSectionDescription => 'Verwalte deine Telefonnummer.';

  @override
  String get securityPhoneLabel => 'Telefonnummer';

  @override
  String get securityPhoneNone => 'Keine Telefonnummer hinzugefügt.';

  @override
  String get securityPhoneAdd => 'Telefon hinzufügen';

  @override
  String get securityPhoneRemove => 'Entfernen';

  @override
  String get securityPhoneRemoveTitle => 'Telefonnummer entfernen';

  @override
  String get securityPhoneRemoveDescription =>
      'Möchtest du deine Telefonnummer wirklich entfernen?';

  @override
  String get securityPhoneRemoved => 'Telefonnummer entfernt';

  @override
  String get securityClaimTitle => 'Sicherheitsfunktionen';

  @override
  String get securityClaimDescription =>
      'Beanspruche deinen Account, um auf Sicherheitsfunktionen wie Zwei-Faktor-Authentifizierung und Passkeys zuzugreifen.';

  @override
  String get securityVerifyEmailRequired =>
      'Du musst deine E-Mail-Adresse verifizieren, bevor du Zwei-Faktor-Authentifizierung, Passkeys oder SMS-Verifizierung einrichten kannst.';

  @override
  String get totpEnableTitle => 'Authenticator-App einrichten';

  @override
  String get totpEnableDescription =>
      'Scanne den QR-Code mit deiner Authenticator-App, um Codes für die Zwei-Faktor-Authentifizierung zu generieren.';

  @override
  String get totpEnableCodeLabel => 'Code';

  @override
  String get totpEnableCodeHint =>
      'Gib den 6-stelligen Code aus deiner Authenticator-App ein';

  @override
  String get totpEnableSuccess =>
      'Zwei-Faktor-Authentifizierung wurde aktiviert';

  @override
  String get totpDisableTitle => 'Authenticator-App entfernen';

  @override
  String get totpDisableDescription =>
      'Gib den 6-stelligen Code aus deiner Authenticator-App ein, um die Zwei-Faktor-Authentifizierung zu deaktivieren.';

  @override
  String get totpDisableSuccess => 'Zwei-Faktor-Authentifizierung deaktiviert';

  @override
  String get backupCodesTitle => 'Backup-Codes';

  @override
  String get backupCodesWarning =>
      'Wenn du den Zugriff auf deine Authenticator-App verlierst und diese Codes nicht hast, wirst du dauerhaft von deinem Account ausgesperrt. Lade sie herunter oder kopiere sie jetzt und bewahre sie sicher auf.';

  @override
  String get backupCodesDownload => 'Herunterladen';

  @override
  String get backupCodesCopy => 'Kopieren';

  @override
  String get backupCodesCopied => 'Backup-Codes in die Zwischenablage kopiert';

  @override
  String get backupCodesAcknowledge =>
      'Ich habe meine Backup-Codes heruntergeladen oder kopiert und sicher aufbewahrt.';

  @override
  String get backupCodesDone => 'Fertig';

  @override
  String get backupCodesViewTitle => 'Backup-Codes anzeigen';

  @override
  String get backupCodesViewDescription =>
      'Zur Anzeige deiner Backup-Codes ist möglicherweise eine Verifizierung erforderlich.';

  @override
  String get phoneAddTitle => 'Telefonnummer hinzufügen';

  @override
  String get phoneAddLabel => 'Telefonnummer';

  @override
  String get phoneAddHint => 'Gib deine Telefonnummer ein';

  @override
  String get phoneAddFooter =>
      'Gib deine Telefonnummer ein. Wir senden dir einen Verifizierungscode per SMS.';

  @override
  String get phoneAddSendCode => 'Code senden';

  @override
  String get phoneVerifyTitle => 'Telefonnummer verifizieren';

  @override
  String get phoneVerifyDescription =>
      'Gib den Verifizierungscode ein, der an deine Telefonnummer gesendet wurde.';

  @override
  String get phoneAddSuccess => 'Telefonnummer hinzugefügt';

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
  String get dangerZoneSectionTitle => 'Gefahrenzone';

  @override
  String get dangerZoneSectionDescription =>
      'Dauerhafte und nicht rückgängig zu machende Aktionen';

  @override
  String get dangerZoneDisableTitle => 'Account deaktivieren';

  @override
  String get dangerZoneDisableDescription =>
      'Deaktiviere deinen Account vorübergehend. Du kannst ihn später reaktivieren, indem du dich wieder anmeldest.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Das Deaktivieren deines Accounts wird dich aus allen Sitzungen abmelden. Du kannst deinen Account jederzeit wieder aktivieren, indem du dich erneut anmeldest.';

  @override
  String get dangerZoneDeleteTitle => 'Account löschen';

  @override
  String get dangerZoneDeleteDescription =>
      'Lösche deinen Account und alle zugehörigen Daten dauerhaft. Diese Aktion kann nicht rückgängig gemacht werden.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Kündige dein aktives Plutonium-Abo in den Plutonium-Einstellungen, bevor du deinen Account löschst.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount =>
      'Account kann nicht gelöscht werden';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Du kannst deinen Account nicht löschen, solange du der Eigentümer von Communitys bist. Übertrage zuerst die Eigentümerschaft der folgenden Communitys:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'und $count weitere';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Um den Besitz zu übertragen, gehe zu $settingsPath und nutze die Option „Besitz übertragen“.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Möchtest du deinen Account wirklich löschen? Diese Aktion sieht die dauerhafte Löschung deines Accounts vor.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Du kannst den Löschvorgang innerhalb von 14 Tagen abbrechen';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Nach 14 Tagen wird dein Account dauerhaft gelöscht';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Nachdem die Löschung verarbeitet wurde, kannst du nicht mehr auf deinen Account zugreifen';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Du kannst deine gesendeten Nachrichten nach der Löschung deines Account nicht mehr löschen';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Wenn du deine Daten exportieren oder zuerst deine Nachrichten löschen möchtest, besuche bitte den Abschnitt „Datenschutz-Dashboard“ in den Benutzereinstellungen, bevor du fortfährst.';

  @override
  String get claimAccountTitle => 'Account beanspruchen';

  @override
  String get claimAccountDescription =>
      'Beanspruche deinen Account, indem du eine E-Mail-Adresse und ein Passwort angibst. Wir senden dir einen Verifizierungscode, um deine E-Mail-Adresse zu bestätigen, bevor wir fertig sind.';

  @override
  String get claimAccountEmailLabel => 'E-Mail';

  @override
  String get claimAccountPasswordLabel => 'Passwort';

  @override
  String get claimAccountSendCode => 'Code senden';

  @override
  String get claimAccountVerifyDescription =>
      'Gib den Code ein, den wir an deine E-Mail gesendet haben, um sie zu verifizieren. Dein Passwort wird festgelegt, sobald der Code bestätigt wurde.';

  @override
  String get claimAccountSuccess => 'Account erfolgreich beansprucht';

  @override
  String get importantInformation => 'Wichtige Informationen:';

  @override
  String get genericError => 'Ein Fehler ist aufgetreten';

  @override
  String get invalidCode => 'Ungültiger Code';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vor $count Jahren',
      one: 'vor 1 Jahr',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vor $count Monaten',
      one: 'vor 1 Monat',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vor $count Tagen',
      one: 'vor 1 Tag',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vor $count Stunden',
      one: 'vor 1 Stunde',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vor $count Minuten',
      one: 'vor 1 Minute',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'gerade eben';

  @override
  String get authorizedAppsTitle => 'Autorisierte Anwendungen';

  @override
  String get authorizedAppsDescription =>
      'Diesen Anwendungen wurde der Zugriff auf deinen Fluxer-Account gewährt.';

  @override
  String get authorizedAppsEmptyTitle => 'Keine autorisierten Anwendungen';

  @override
  String get authorizedAppsEmptyDescription =>
      'Du hast noch keine Anwendungen autorisiert, auf deinen Account zuzugreifen.';

  @override
  String get authorizedAppsLoadError =>
      'Autorisierte Anwendungen konnten nicht geladen werden';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Autorisiert am $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Erteilte Berechtigungen';

  @override
  String get authorizedAppsRevoke => 'Entziehen';

  @override
  String get authorizedAppsRevokeTitle => 'Anwendungszugriff entziehen';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Möchtest du den Zugriff für $appName wirklich entziehen? Diese Anwendung hat dann keinen Zugriff mehr auf deinen Account.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Zugriff auf deine grundlegenden Profilinformationen (Benutzername, Avatar usw.)';

  @override
  String get authorizedAppsScopeEmail => 'Deine E-Mail-Adresse anzeigen';

  @override
  String get authorizedAppsScopeGuilds =>
      'Die Communitys anzeigen, in denen du Mitglied bist';

  @override
  String get authorizedAppsScopeConnections =>
      'Deine verbundenen Accounts anzeigen';

  @override
  String get authorizedAppsScopeBot =>
      'Einen Bot mit den angeforderten Berechtigungen zu einer Community hinzufügen';

  @override
  String get authorizedAppsScopeAdmin =>
      'Auf administrative Endpunkte zugreifen';

  @override
  String get privacyPendingDeletionTitle => 'Löschung ausstehend';

  @override
  String get blockedUsersTitle => 'Blockierte Benutzer';

  @override
  String get blockedUsersDescription =>
      'Blockierte Benutzer können dir keine Freundschaftsanfragen senden oder dich direkt anschreiben.';

  @override
  String get blockedUsersEmptyTitle => 'Keine blockierten Benutzer';

  @override
  String get blockedUsersEmptyDescription =>
      'Du hast noch niemanden blockiert.';

  @override
  String get blockedUsersLoadError =>
      'Blockierte Benutzer konnten nicht geladen werden';

  @override
  String get blockedUsersUnblock => 'Entsperren';

  @override
  String get blockedUsersUnblockTitle => 'Benutzer entsperren';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Möchtest du $username wirklich entsperren?';
  }

  @override
  String get blockedUsersCopyTag => 'FluxerTag kopieren';

  @override
  String get blockedUsersCopyId => 'Benutzer-ID kopieren';

  @override
  String get userProfileLoadError => 'Profil konnte nicht geladen werden';

  @override
  String get userProfileRetry => 'Erneut versuchen';

  @override
  String get userProfileMessage => 'Nachricht';

  @override
  String get userProfileVoiceCall => 'Sprachanruf';

  @override
  String get userProfileVideoCall => 'Videoanruf';

  @override
  String get userProfileEditProfile => 'Profil bearbeiten';

  @override
  String get userProfileStaffBadgeTooltip => 'Fluxer Team';

  @override
  String get userProfileCtpBadgeTooltip => 'Fluxer Community Team';

  @override
  String get userProfilePartnerBadgeTooltip => 'Fluxer Partner';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Fluxer Bug Hunter';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer Plutonium';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Fluxer Plutonium Abonnent seit $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Fluxer Visionary';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Fluxer Visionary seit $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'Visionary ID #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Gemeinsame Freunde ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Gemeinsame Communitys ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Gemeinsame Freunde';

  @override
  String get userProfileMutualCommunitiesTitle => 'Gemeinsame Communitys';

  @override
  String get userProfileNoMutualFriends =>
      'Keine gemeinsamen Freunde gefunden.';

  @override
  String get userProfileNoMutualCommunities =>
      'Keine gemeinsamen Communitys gefunden.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Anzeigename: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'DM öffnen';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Du hast $username blockiert. Du kannst keine Nachrichten senden, es sei denn, du hebst die Blockierung auf.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Blockierung aufheben';

  @override
  String get userProfileOpenDm => 'DM öffnen';

  @override
  String get userProfileNoteTitle => 'Notiz';

  @override
  String get userProfileNoteVisibility => '(nur für dich sichtbar)';

  @override
  String get userProfileNoteSave => 'Speichern';

  @override
  String get userProfileNoteDelete => 'Löschen';

  @override
  String get userProfileNoteEmpty => 'Klicke, um eine Notiz hinzuzufügen';

  @override
  String get userProfileMemberSince => 'Mitglied seit';

  @override
  String get userProfileAboutMe => 'Über mich';

  @override
  String get userProfileLocalTime => 'Ortszeit';

  @override
  String get userProfileSameTimeAsYou => 'Gleiche Zeitzone wie du';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return '$duration voraus';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return '$duration zurück';
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
  String get userProfileCopyUsername => 'Benutzernamen kopieren';

  @override
  String get userProfileCopyUserId => 'Benutzer-ID kopieren';

  @override
  String get userProfileViewMainProfile => 'Hauptprofil anzeigen';

  @override
  String get userProfileViewCommunityProfile => 'Community-Profil anzeigen';

  @override
  String get userProfileBlockUser => 'Benutzer blockieren';

  @override
  String get userProfileUnblockUser => 'Benutzer blockieren aufheben';

  @override
  String get userProfileRemoveFriend => 'Freund entfernen';

  @override
  String get userProfileBlockConfirmTitle => 'Benutzer blockieren';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Möchtest du $username wirklich blockieren?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Benutzer blockieren aufheben';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Möchtest du $username wirklich blockieren aufheben?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Freund entfernen';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Möchtest du $username wirklich als Freund entfernen?';
  }

  @override
  String get userProfileFailedOpenDm => 'DM konnte nicht geöffnet werden';

  @override
  String get userProfileFailedSaveNote =>
      'Notiz konnte nicht gespeichert werden';

  @override
  String get userProfileActionFailed =>
      'Aktion fehlgeschlagen, bitte versuche es erneut';

  @override
  String get userProfileChangeNickname => 'Anzeigename ändern';

  @override
  String get userProfileKick => 'Entfernen';

  @override
  String get userProfileBan => 'Sperren';

  @override
  String get userProfileTimeout => 'Zeitlimit';

  @override
  String get userProfileRemoveTimeout => 'Zeitlimit aufheben';

  @override
  String get userProfileTransferOwnership => 'Besitz übertragen';

  @override
  String get userProfileReportUser => 'Benutzer melden';

  @override
  String get userProfileReportMessage => 'Nachricht melden';

  @override
  String userProfileKickConfirmTitle(String username) {
    return '$username entfernen?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Möchtest du $username wirklich entfernen? Die Person kann mit einer neuen Einladung wieder beitreten.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Zeitlimit aufheben?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Wenn das Zeitlimit aufgehoben wird, kann $username wieder Nachrichten senden, reagieren und an Sprachkanälen teilnehmen.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Besitz übertragen?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Eigentumsrechte dieser Community an $username übertragen? Das kann nicht rückgängig gemacht werden und du verlierst alle Eigentümerrechte.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return '$username sperren';
  }

  @override
  String get userProfileBanDurationLabel => 'Sperrdauer';

  @override
  String get userProfileBanCustomSecondsLabel =>
      'Benutzerdefinierte Dauer (Sekunden)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Jeder Wert von $min bis $max Sekunden';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Nachrichtenverlauf löschen';

  @override
  String get userProfileBanDeleteNone => 'Keine löschen';

  @override
  String get userProfileBanDelete24h => 'Vorherige 24 Stunden';

  @override
  String get userProfileBanDelete7d => 'Vorherige 7 Tage';

  @override
  String get userProfileBanReasonLabel => 'Grund (optional)';

  @override
  String get userProfileBanReasonHint => 'Grund für die Sperre eingeben';

  @override
  String get userProfileBanSubmit => 'Mitglied sperren';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return '$username stummschalten';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Stummschaltungsdauer';

  @override
  String get userProfileTimeoutSubmit => 'Mitglied stummschalten';

  @override
  String get userProfileNicknameLabel => 'Anzeigename';

  @override
  String get userProfileNicknameHint => 'Anzeigename eingeben';

  @override
  String get userProfileNicknameSave => 'Speichern';

  @override
  String userProfileKickSuccess(String username) {
    return '$username wurde gekickt';
  }

  @override
  String userProfileBanSuccess(String username) {
    return '$username wurde gebannt';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return '$username wurde stummgeschaltet';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Zeitlimit für $username aufgehoben';
  }

  @override
  String get userProfileNicknameSuccess => 'Anzeigename aktualisiert';

  @override
  String get userProfileTransferSuccess => 'Besitz übertragen';

  @override
  String get durationPermanent => 'Permanent';

  @override
  String get duration60Seconds => '60 Sekunden';

  @override
  String get duration5Minutes => '5 Minuten';

  @override
  String get duration10Minutes => '10 Minuten';

  @override
  String get duration1Hour => '1 Stunde';

  @override
  String get duration12Hours => '12 Stunden';

  @override
  String get duration1Day => '1 Tag';

  @override
  String get duration3Days => '3 Tage';

  @override
  String get duration5Days => '5 Tage';

  @override
  String get duration1Week => '1 Woche';

  @override
  String get duration2Weeks => '2 Wochen';

  @override
  String get duration1Month => '1 Monat';

  @override
  String get durationCustom => 'Benutzerdefiniert…';

  @override
  String get iarReportUserTitle => 'Benutzer melden';

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
  String get iarReasonInappropriateProfile => 'Unangemessenes Profil';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Dieses Benutzerprofil enthält unangemessene Inhalte';

  @override
  String typingIndicatorOne(String name) {
    return '$name tippt...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 und $name2 tippen...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 und $name3 tippen...';
  }

  @override
  String get typingIndicatorMultiple => 'Mehrere Personen tippen...';

  @override
  String get typingIndicatorHandful =>
      'Eine Handvoll Tastatur-Krieger versammelt sich...';

  @override
  String get typingIndicatorSymphony =>
      'Eine Symphonie aus klappernden Tasten ist im Gange...';

  @override
  String get typingIndicatorFiesta =>
      'Hier ist eine ausgewachsene Tipp-Fiesta im Gange';

  @override
  String get typingIndicatorApocalypse => 'Wer, das ist eine Tipp-Apokalypse';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Schön, dass du da bist, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Willkommen, $username! Mach es dir gemütlich.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Hallo, $username! Schön, dich hier zu haben.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Hallo, $username! Spring rein, wann immer du bereit bist.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Hey $username, schön, dich hier zu sehen!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Hey, $username! Ich hoffe, du genießt deinen Aufenthalt.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Hey, $username, willkommen an Bord!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Schön, dass du es geschafft hast, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Willkommen, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Willkommen, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Willkommen, $username! Wir freuen uns, dass du hier bist.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Willkommen, $username! Ich hoffe, du genießt deine Zeit hier.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Willkommen, $username! Dein nächstes Gespräch beginnt hier.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Willkommen, $username. Wir freuen uns, dich hier zu haben.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Schön, dich zu sehen, $username! Willkommen.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Du bist hier, $username! Gut, dich bei uns zu haben.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Du bist angekommen, $username! Lass uns anfangen.';
  }

  @override
  String get relativeTimeShortNow => 'jetzt';

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
      other: '${count}mo',
      one: '1mo',
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
  String get linkedDevicesTitle => 'Meine Geräte';

  @override
  String get linkedDevicesDescription =>
      'Alle Geräte anzeigen, die derzeit bei deinem Account angemeldet sind. Melde alle Sitzungen ab, die du nicht erkennst.';

  @override
  String get linkedDevicesCurrentDevice => 'Aktuelles Gerät';

  @override
  String get linkedDevicesOtherDevices => 'Andere Geräte';

  @override
  String get linkedDevicesEnterSelection => 'Auswahlmodus aktivieren';

  @override
  String get linkedDevicesExitSelection => 'Auswahlmodus beenden';

  @override
  String get linkedDevicesSelectAll => 'Alle auswählen';

  @override
  String get linkedDevicesClearSelection => 'Auswahl löschen';

  @override
  String get linkedDevicesRevokeTooltip => 'Gerät widerrufen';

  @override
  String get linkedDevicesSignOutAll => 'Alle anderen Geräte abmelden';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Geräte abmelden',
      one: '1 Gerät abmelden',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Geräte abmelden',
      one: '1 Gerät abmelden',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Alle anderen Geräte abmelden';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Dadurch werden die ausgewählten Geräte von deinem Account abgemeldet. Du musst dich auf diesen Geräten erneut anmelden.',
      one:
          'Dadurch wird das ausgewählte Gerät von deinem Account abgemeldet. Du musst dich auf diesem Gerät erneut anmelden.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Dadurch werden die ausgewählten Geräte von deinem Account abgemeldet. Du musst dich auf diesen Geräten erneut anmelden.';

  @override
  String get linkedDevicesSignOutConfirm => 'Fortfahren';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Du musst dich auf allen abgemeldeten Geräten erneut anmelden';

  @override
  String get linkedDevicesLoadErrorTitle => 'Netzwerkfehler';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Wir haben Probleme, eine Verbindung zum Raum-Zeit-Kontinuum herzustellen. Bitte überprüfe deine Verbindung und versuche es erneut.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Geräte widerrufen',
      one: 'Gerät widerrufen',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'Abmeldung fehlgeschlagen. Versuche es erneut.';

  @override
  String get linkedDevicesUnknownOs => 'Unbekanntes Betriebssystem';

  @override
  String get linkedDevicesUnknownPlatform => 'Unbekannte Plattform';

  @override
  String slowmodeLabel(String duration) {
    return '$duration Slow-Modus';
  }

  @override
  String get slowmodeTooltipActive =>
      'Du befindest dich im Slow-Modus. Bitte warte, bevor du eine weitere Nachricht sendest.';

  @override
  String get slowmodeTooltipImmune =>
      'Slow-Modus ist aktiviert, aber du bist ausgenommen.';

  @override
  String get channelNoSendPermissionHint =>
      'Du kannst in diesem Kanal keine Nachrichten senden.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Systemankündigungen von $productName-Mitarbeitern. Du kannst hier nicht antworten.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Das Senden von Nachrichten ist in dieser Community vorübergehend pausiert.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Du wurdest vorübergehend gesperrt. Nachrichten, Reaktionen und Sprache sind bis zum Ablauf der Sperre pausiert.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Du musst deinen Account beanspruchen, um in dieser Community Nachrichten senden zu können.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Du musst deine E-Mail-Adresse verifizieren, um in dieser Community Nachrichten senden zu können.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Dein Account ist zu neu, um in dieser Community Nachrichten senden zu können.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Du bist noch nicht lange genug Mitglied dieser Community, um Nachrichten senden zu können.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Du musst eine Telefonnummer verifizieren, um in dieser Community Nachrichten senden zu können.';

  @override
  String get channelComposerBarrierVerifyEmail => 'E-Mail verifizieren';

  @override
  String get channelComposerBarrierVerifyPhone => 'Telefon verifizieren';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Zu viele Anhänge (max. $max)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'Eine oder mehrere Dateien überschreiten die Größenbeschränkung';

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Diese Dateien sind zu groß, um sie zusammen zu senden';

  @override
  String get chatAttachmentDropToUpload =>
      'Dateien hierher ziehen zum Hochladen';

  @override
  String get chatAttachmentDropToSend =>
      'Dateien hierher ziehen zum sofortigen Senden';

  @override
  String get chatAttachmentSendVoiceMessage => 'Sprachnachricht senden';

  @override
  String get voiceMessageTitle => 'Sprachnachricht';

  @override
  String get voiceMessageHoldHint =>
      'Halten zum Aufnehmen. Nach oben ziehen zum Sperren oder loslassen zum Senden.';

  @override
  String get voiceMessageDiscard => 'Sprachnachricht verwerfen';

  @override
  String get voiceMessageSend => 'Sprachnachricht senden';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Aufnahme kann nicht gestartet werden. Mikrofonzugriff erlauben.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Sprachaufnahmen werden auf diesem Gerät nicht unterstützt.';

  @override
  String get voiceMessageMicInUse =>
      'Verlasse den Sprachanruf, um eine Sprachnachricht aufzunehmen.';

  @override
  String get voiceMessageRecordingFailed =>
      'Aufnahme fehlgeschlagen. Versuche es erneut.';

  @override
  String get voiceMessageSendFailed =>
      'Sprachnachricht kann nicht gesendet werden. Versuche es erneut.';

  @override
  String get voiceMessageRecordingHint =>
      'Sprich jetzt. Drücke Stopp, wenn du fertig bist – du kannst danach schneiden.';

  @override
  String get voiceMessageReviewHint =>
      'Ziehe die Regler zum Schneiden, dann drücke Senden.';

  @override
  String get voiceMessageStop => 'Abbrechen';

  @override
  String get voiceMessageStartRecording => 'Aufnahme starten';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Wiedergabe';

  @override
  String get voiceMessagePause => 'Pause';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Auswahl muss mindestens ${secondsString}s lang sein.';
  }

  @override
  String get chatAttachmentEditTitle => 'Anhang bearbeiten';

  @override
  String get chatAttachmentFilenameLabel => 'Dateiname';

  @override
  String get chatAttachmentDescriptionLabel => 'Beschreibung';

  @override
  String get chatAttachmentDescriptionHint => 'Optionale Alternativtext';

  @override
  String get chatAttachmentSpoilerLabel => 'Als Spoiler markieren';

  @override
  String get chatAttachmentRemove => 'Anhang entfernen';

  @override
  String get chatAttachmentDownload => 'Herunterladen';

  @override
  String get chatAttachmentExpiredTooltip => 'Anhang abgelaufen';

  @override
  String get chatAttachmentSourceGallery => 'Galerie';

  @override
  String get chatAttachmentSourceCamera => 'Kamera';

  @override
  String get chatAttachmentSourceBrowse => 'Dateien durchsuchen';

  @override
  String get chatAttachmentPasteTooltip =>
      'Bild aus der Zwischenablage einfügen';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Spoiler anzeigen';

  @override
  String get matureMediaRevealButton => 'Anzeigen';

  @override
  String get matureMediaRevealHint => 'Zum Anzeigen klicken';

  @override
  String get matureContentTitle => 'Inhalte für Erwachsene';

  @override
  String get matureCommunityTitle => 'Altersbeschränkte Community';

  @override
  String get matureCategoryTitle => 'Altersbeschränkte Kategorie';

  @override
  String get matureChannelTitle => 'Altersbeschränkter Kanal';

  @override
  String get communityContentWarningTitle => 'Community-Inhaltswarnung';

  @override
  String get categoryContentWarningTitle => 'Kategorie-Inhaltswarnung';

  @override
  String get channelContentWarningTitle => 'Kanal-Inhaltswarnung';

  @override
  String get defaultContentWarningBody => 'Dies enthält sensible Inhalte.';

  @override
  String get matureCommunityBody =>
      'Diese Community ist für altersbeschränkte Inhalte gekennzeichnet und kann Material enthalten, dass für einige Nutzer ungeeignet ist.';

  @override
  String get matureCategoryBody =>
      'Diese Kategorie ist für altersbeschränkte Inhalte gekennzeichnet und kann Material enthalten, das für einige Nutzer ungeeignet ist.';

  @override
  String get matureChannelBody =>
      'Dieser Kanal ist für altersbeschränkte Inhalte gekennzeichnet und kann Material enthalten, das für einige Nutzer ungeeignet ist.';

  @override
  String get matureVoiceChannelBody =>
      'Dieser Sprachkanal ist für altersbeschränkte Inhalte gekennzeichnet und kann Material enthalten, das für einige Nutzer ungeeignet ist.';

  @override
  String get matureLinkChannelBody =>
      'Dieser Linkkanal ist für altersbeschränkte Inhalte gekennzeichnet und kann Links öffnen, die für einige Nutzer ungeeignet ist.';

  @override
  String get matureCommunityUnavailableBody =>
      'Diese altersbeschränkte Community ist für deinen Account nicht verfügbar.';

  @override
  String get matureCategoryUnavailableBody =>
      'Diese altersbeschränkte Kategorie ist für deinen Account nicht verfügbar.';

  @override
  String get matureChannelUnavailableBody =>
      'Dieser altersbeschränkte Kanal ist für dein Konto nicht verfügbar.';

  @override
  String get matureContentProceedButton => 'Fortfahren';

  @override
  String get matureContentUnderstandButton => 'Ich verstehe';

  @override
  String get matureContentOpenLinkButton => 'Link öffnen';

  @override
  String get sensitiveContentSectionTitle => 'Sensible Inhalte';

  @override
  String get sensitiveContentSectionDescription =>
      'Lege fest, wie altersbeschränkte oder sensible Medien in verschiedenen Situationen gefiltert werden';

  @override
  String get sensitiveContentFriendDmLabel => 'Direktnachrichten von Freunden';

  @override
  String get sensitiveContentNonFriendDmLabel =>
      'Direktnachrichten von anderen';

  @override
  String get sensitiveContentGuildLabel => 'Nachrichten in Community-Kanälen';

  @override
  String get sensitiveContentFilterShow => 'Anzeigen';

  @override
  String get sensitiveContentFilterBlur => 'Unschärfe';

  @override
  String get sensitiveContentFilterBlock => 'Blockieren';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Medien bis zum Abschluss des Sicherheitsscans unscharf machen';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Wenn aktiviert, werden Bilder und Videos unscharf gemacht, bis der Inhalts-Sicherheitsscan abgeschlossen ist.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Diese Einstellung ist für deinen Account immer aktiviert.';

  @override
  String get sensitiveContentResetButton => 'Zurücksetzen';

  @override
  String get sensitiveContentSaveButton => 'Speichern';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Dateien',
      one: '1 Datei',
    );
    return 'Lade $_temp0 hoch';
  }

  @override
  String get chatCancelUpload => 'Upload abbrechen';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Läuft ab am $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Läuft ab zwischen $start und $end';
  }

  @override
  String get connectionsTitle => 'Verbindungen';

  @override
  String get connectionsDescription =>
      'Verknüpfe externe Accounts und Domains mit deinem Fluxer-Profil. Verifizierte Verbindungen werden auf deinem Profil angezeigt.';

  @override
  String get connectionsEmptyTitle => 'Noch keine Verbindungen';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Verknüpfe deinen Bluesky-Account oder verifiziere den Besitz der Domain, um ihn auf deinem Profil anzuzeigen.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Verifiziere den Domainbesitz, um sie auf deinem Profil anzuzeigen.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Domain';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Bluesky-Verbindung hinzufügen';

  @override
  String get connectionsAddDomainAriaLabel => 'Domain-Verbindung hinzufügen';

  @override
  String get connectionEdit => 'Bearbeiten';

  @override
  String get connectionRemove => 'Entfernen';

  @override
  String get connectionVerifiedLabel => 'Diese Verbindung wurde verifiziert.';

  @override
  String get connectionUnverifiedLabel =>
      'Diese Verbindung wurde nicht verifiziert.';

  @override
  String get connectionAddTitle => 'Verbindung hinzufügen';

  @override
  String get connectionTypeLabel => 'Verbindungstyp';

  @override
  String get connectionHandleLabel => 'Handle';

  @override
  String get connectionDomainLabel => 'Domain';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Diese Verbindung hast du bereits.';

  @override
  String get connectionConnectBluesky => 'Mit Bluesky verbinden';

  @override
  String get connectionContinue => 'Weiter';

  @override
  String get connectionVerifyTitle => 'Verbindung verifizieren';

  @override
  String get connectionVerifyInstructions =>
      'Verwende den unten stehenden Eintrag, um den Besitz der Domain nachzuweisen.';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT-Eintrag';

  @override
  String get connectionDnsHostLabel => 'Host';

  @override
  String get connectionDnsValueLabel => 'Wert';

  @override
  String get connectionCopyHost => 'Host kopieren';

  @override
  String get connectionCopyValue => 'Wert kopieren';

  @override
  String get connectionCopied => 'Kopiert!';

  @override
  String get connectionTokenFileTitle => 'Token-Datei bereitstellen';

  @override
  String get connectionTokenFileDescription =>
      'Lade **fluxer-verification** herunter und lege es in deinem **.well-known**-Ordner ab, damit wir die Domain validieren können.';

  @override
  String get connectionTokenFileDownload => 'fluxer-verification herunterladen';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Die Datei enthält das Verifizierungstoken, das wir von **$dnsUrl** abrufen.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'fluxer-verification speichern';

  @override
  String get connectionVerifyButton => 'Verifizieren';

  @override
  String get connectionBack => 'Zurück';

  @override
  String get connectionEditTitle => 'Verbindung bearbeiten';

  @override
  String get connectionEditDescription =>
      'Wähle aus, wer diese Verbindung auf deinem Profil sehen kann.';

  @override
  String get connectionVisibilityEveryone => 'Alle';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Erlaube jedem, diese Verbindung auf deinem Profil zu sehen';

  @override
  String get connectionVisibilityFriends => 'Freunde';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Erlaube deinen Freunden, diese Verbindung zu sehen';

  @override
  String get connectionVisibilityCommunityMembers => 'Community-Mitglieder';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Erlaube Mitgliedern aus Communitys, in denen du ein Mitglied bist, diese Verbindung zu sehen';

  @override
  String get connectionRemoveTitle => 'Verbindung entfernen';

  @override
  String get connectionRemoveDescription =>
      'Möchtest du diese Verbindung wirklich entfernen? Diese Aktion kann nicht rückgängig gemacht werden.';

  @override
  String get connectionRemoveConfirm => 'Entfernen';

  @override
  String get connectionsLoadError =>
      'Verbindungen konnten nicht geladen werden';

  @override
  String get connectionsReorderError =>
      'Reihenfolge konnte nicht aktualisiert werden';

  @override
  String get connectionInitiateFailed =>
      'Verifizierung konnte nicht gestartet werden. Versuche es erneut.';

  @override
  String get connectionVerifyFailed =>
      'Konnte nicht verifizieren. Überprüfe deinen DNS-Eintrag und versuche es erneut.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Bluesky-Autorisierung konnte nicht gestartet werden.';

  @override
  String get connectionUpdateFailed =>
      'Verbindung konnte nicht aktualisiert werden';

  @override
  String get connectionRemoveFailed =>
      'Verbindung konnte nicht entfernt werden';

  @override
  String get connectionTokenSavedToast => 'fluxer-verification gespeichert';

  @override
  String get connectionTokenSaveFailedToast =>
      'Datei konnte nicht gespeichert werden';

  @override
  String get connectionEnterHandle => 'Gib einen Bluesky-Handle ein.';

  @override
  String get connectionEnterDomain => 'Gib eine Domain ein.';

  @override
  String get lookAndFeelTitle => 'Darstellung';

  @override
  String get lookAndFeelThemeSectionTitle => 'Theme';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Wähle zwischen dunkler, kohlefarbener oder heller Darstellung.';

  @override
  String get lookAndFeelThemeDark => 'Dunkles Theme';

  @override
  String get lookAndFeelThemeCoal => 'Kohle-Theme';

  @override
  String get lookAndFeelThemeLight => 'Helles Theme';

  @override
  String get lookAndFeelThemeSystem => 'System-Theme';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Theme geräteübergreifend synchronisieren';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Wenn aktiviert, werden Designänderungen auf allen deinen Geräten synchronisiert. Wenn deaktiviert, verwendet dieses Gerät seine eigene Designeinstellung.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Das Systemdesign deaktiviert die Synchronisierung automatisch, um deine Systemeinstellungen auf diesem Gerät zu verfolgen.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Das Theme konnte nicht mit deinem Account synchronisiert werden. Bitte versuche es erneut.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Chat-Schriftgröße';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Passe die Schriftgröße im Chatbereich an.';

  @override
  String get lookAndFeelInterfaceTitle => 'Oberfläche';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Passe Oberflächenelemente und -verhalten an.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Tipp-Indikatoren in der Kanalliste';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Wähle aus, wie Tipp-Indikatoren in der Kanalliste angezeigt werden, wenn jemand in einem Kanal tippt.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Tipp-Indikator + Avatare';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Zeige Tipp-Indikator mit Benutzer-Avataren in der Kanalliste an';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName => 'Nur Tipp-Indikator';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Zeige nur den Tipp-Indikator ohne Avatare an';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Ausgeblendet';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Tipp-Indikatoren in der Kanalliste nicht anzeigen';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Tippen im ausgewählten Kanal anzeigen';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Wenn deaktiviert (Standard), werden Tipp-Indikatoren nicht im aktuell angezeigten Kanal angezeigt.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'allgemein';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Tastaturhinweise';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Lege fest, ob Tastaturkürzel-Hinweise in Tooltips angezeigt werden.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Tastaturhinweise in Tooltips ausblenden';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Wenn aktiviert, werden Kürzel-Badges in Tooltip-Popups ausgeblendet.';

  @override
  String get lookAndFeelNekoTitle => 'Sonstiges';

  @override
  String get lookAndFeelNekoDescription => 'Sonstige Oberflächenoptionen.';

  @override
  String get lookAndFeelShowNekoLabel => 'Neko anzeigen';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Wenn aktiviert, erscheint Neko in der Nähe der Chat-Eingabezeile.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Verhalten beim Beitreten zu Sprachkanälen';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Lege fest, wie du Sprachkanälen in Communitys beitrittst.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Doppelklick zum Beitreten zu Sprachkanälen erforderlich';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Wenn aktiviert, musst du auf Sprachkanäle doppelklicken, um ihnen beizutreten. Wenn deaktiviert (Standard), tritt ein einfacher Klick dem Kanal sofort bei.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Der schnelle braune Fuchs springt über den faulen Hund.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Server-Seitenleiste';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Konfiguriere, wie die Server-Seitenleiste Direktnachrichten anzeigt.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count Communitys sind aufgrund einer Störung des Fluxkondensators vorübergehend nicht verfügbar.',
      one:
          '1 Community ist aufgrund einer Störung des Fluxkondensators vorübergehend nicht verfügbar.',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel => 'DMs in Ordner einklappen';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'Wenn aktiviert, werden ungelesene DMs in der Server-Seitenleiste in einem Ordner auf der Fluxer-Schaltfläche eingeklappt. Klicke auf die Fluxer-Schaltfläche, während du dich auf der DMs-Seite befindest, um den Ordner ein- oder auszuklappen.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Kanalliste';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Lege das Verhalten von ungelesenen Indikatoren für stummgeschaltete Kanäle in Kanallisten fest.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Ungelesenen Indikator auf stummgeschalteten Kanälen anzeigen';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Wenn aktiviert, zeigen stummgeschaltete Kanäle einen verblassten ungelesenen Indikator auf der linken Seite an. Erwähnungen erscheinen unabhängig von dieser Einstellung.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Jetzt aktiv';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Lege fest, wie „Jetzt aktiv“ in der App angezeigt wird.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Jetzt aktiv auf der Startseite anzeigen';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Zeige „Jetzt aktiv“ auf der Startseite an, um Freunde anzuzeigen, die in Sprachkanälen aktiv sind. Du siehst eine Vorschau, den Kanal-Kontext, wer bereits dort ist, und eine schnelle Möglichkeit, beizutreten.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Favoriten';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Lege die Sichtbarkeit von Favoriten in der gesamten App fest.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Favoriten aktivieren';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Wenn aktiviert, kannst du Kanäle zu Favoriten hinzufügen und sie werden im Abschnitt „Favoriten“ angezeigt. Wenn deaktiviert, werden alle favoritenbezogenen UI-Elemente (Schaltflächen, Menüpunkte) ausgeblendet. Deine vorhandenen Favoriten bleiben erhalten.';

  @override
  String get favoritesTitle => 'Favoriten';

  @override
  String get favoritesEmptyTitle => 'Noch keine Favoriten';

  @override
  String get favoritesEmptyDescription =>
      'Markiere Kanäle im Chat-Header, um sie hier zu behalten.';

  @override
  String get favoritesWelcomeTitle => 'Willkommen bei Favoriten';

  @override
  String get favoritesWelcomeDescription =>
      'Dein persönlicher Bereich für schnellen Zugriff auf Kanäle, DMs und Gruppen, die du liebst. Drücke auf den Stern bei einem Kanal, um ihn hier hinzuzufügen.';

  @override
  String get favoritesWelcomeTip =>
      'Nichts für dich? Schalte es jederzeit aus.';

  @override
  String get favoritesDisableButton => 'Favoriten deaktivieren';

  @override
  String get favoritesAddedToast => 'Zu Favoriten hinzugefügt';

  @override
  String get favoritesRemovedToast => 'Aus Favoriten entfernt';

  @override
  String get favoritesHiddenToast => 'Favoriten ausgeblendet';

  @override
  String get favoritesMute => 'Favoriten stummschalten';

  @override
  String get favoritesUnmute => 'Favoriten wieder aktivieren';

  @override
  String get favoritesHeaderMenu => 'Favoriten-Menü';

  @override
  String get favoritesCreateCategory => 'Kategorie erstellen';

  @override
  String get favoritesCategoryNameLabel => 'Kategoriename';

  @override
  String get favoritesHideMutedChannels => 'Stummgeschaltete Kanäle ausblenden';

  @override
  String get favoritesShowMutedChannels => 'Stummgeschaltete Kanäle anzeigen';

  @override
  String get favoritesSetNickname => 'Anzeigename festlegen';

  @override
  String get favoritesNicknameLabel => 'Anzeigename';

  @override
  String get favoritesSaveNickname => 'Anzeigename speichern';

  @override
  String get favoritesMoveToCategory => 'In Kategorie verschieben';

  @override
  String get favoritesUncategorized => 'Unkategorisiert';

  @override
  String get favoritesOtherCategory => 'Andere';

  @override
  String get favoritesRemoveFromFavorites => 'Aus Favoriten entfernen';

  @override
  String get favoritesAddToFavorites => 'Zu Favoriten hinzufügen';

  @override
  String get favoritesHideConfirmTitle => 'Favoriten ausblenden';

  @override
  String get favoritesHideConfirmDescription =>
      'Dies blendet alle Favoriten-bezogenen UI-Elemente aus, einschließlich Schaltflächen und Menüpunkte. Deine vorhandenen Favoriten bleiben erhalten und können jederzeit unter Einstellungen > Erweitert > Darstellung wieder aktiviert werden.';

  @override
  String get favoritesDirectMessageSubtitle => 'Direktnachricht';

  @override
  String get messagesMediaDisplayGroupTitle => 'Anzeige';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Lege fest, wie Nachrichten, Medien und andere Inhalte angezeigt werden.';

  @override
  String get messagesMediaMediaGroupTitle => 'Medien';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Passe Medien-Größen und Schaltflächen an.';

  @override
  String get messagesMediaInputGroupTitle => 'Eingabe';

  @override
  String get messagesMediaInputGroupDescription =>
      'Passe die Einstellungen für die Nachrichteneingabe an.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Seitenleiste';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Konfiguriere, wie die Community-Seitenleiste angezeigt wird.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Stummgeschaltete Kanäle standardmäßig ausblenden';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Blendet stummgeschaltete Kanäle in der Seitenleiste automatisch aus, wenn du neuen Communitys beitrittst';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Stummgeschaltete Kanäle standardmäßig ausblenden?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Neue Communitys, denen du beitrittst, blenden stummgeschaltete Kanäle automatisch aus. Möchtest du diese Einstellung auch auf alle deine bestehenden Communitys anwenden?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Stummgeschaltete Kanäle nicht mehr standardmäßig ausblenden?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Neue Communitys, denen du beitrittst, blenden stummgeschaltete Kanäle nicht mehr automatisch aus. Möchtest du stummgeschaltete Kanäle auch in allen deinen bestehenden Communitys anzeigen?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Auf alle Communitys anwenden';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'In allen Communitys anzeigen';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Nur neue Communitys';

  @override
  String get messagesMediaDisplaySectionTitle => 'Medienanzeige';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Lege fest, wie Bilder, Videos und andere Medien angezeigt werden. Alle Medien werden in der Größe angepasst und konvertiert. Extrem große Dateien, die nicht in eine Vorschau komprimiert werden können, werden unabhängig von diesen Einstellungen nicht eingebettet.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Wenn als Links zum Chat gepostet';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'Wenn direkt zu Fluxer hochgeladen';

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Linkvorschau';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Lege fest, wie Website-Links im Chat in der Vorschau angezeigt werden';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Einbettungen anzeigen und Website-Links in der Vorschau anzeigen';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reaktionen';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Emoji-Reaktionen auf Nachrichten konfigurieren';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Emoji-Reaktionen auf Nachrichten anzeigen';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Spoiler-Inhalt';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Steuern, wie Spoiler-Inhalt angezeigt wird';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Spoiler-Inhalt anzeigen';

  @override
  String get messagesMediaSpoilersOnClickName => 'Beim Klicken';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Spoiler-Inhalt beim Klicken anzeigen';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'In Kanälen, die ich moderiere';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Spoiler-Inhalt immer in Kanälen anzeigen, in denen du die Berechtigung „Nachrichten verwalten“ hast';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Immer';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Spoiler-Inhalt immer anzeigen';

  @override
  String get messagesMediaSizeSectionTitle => 'Medien-Größen-Einstellungen';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Passe die maximale Anzeigegröße für eingebettete und angehängte Medien an. Kleinere Größen verbrauchen weniger Speicherplatz, während größere Größen mehr Details anzeigen.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Medien aus Links (Embeds)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Hochgeladene Anhänge';

  @override
  String get messagesMediaSizeCompactName => 'Kompakt (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Kleinere Mediengröße';

  @override
  String get messagesMediaSizeComfortableName => 'Bequem (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Größere Mediengröße mit mehr Details';

  @override
  String get messagesMediaGifsSectionTitle => 'GIF-Verhalten';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Steuern, wie GIFs in den Chat eingefügt werden';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'GIFs automatisch senden, wenn ausgewählt';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Ausdruck-Autovervollständigung (Doppelpunkt-Autovervollständigung)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Steuern Sie, was in der Ausdruck-Autovervollständigung angezeigt wird, wenn Sie einen Doppelpunkt eingeben. Passen Sie an, welche Vorschläge angezeigt werden, um Ihren Vorlieben zu entsprechen.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Standard-Emojis in der Ausdruck-Autovervollständigung anzeigen';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Benutzerdefinierte Emojis in der Ausdruck-Autovervollständigung anzeigen';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Sticker in der Ausdruck-Autovervollständigung anzeigen';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Gespeicherte Medien in der Ausdruck-Autovervollständigung anzeigen';

  @override
  String get messagesMediaEditingSectionTitle => 'Nachrichtenbearbeitung';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Steuern Sie, was mit Ihrem Bearbeitungsentwurf geschieht, wenn Sie abbrechen.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Bearbeitungsentwurf beim Abbrechen beibehalten';

  @override
  String get accessibilitySaturationTitle => 'Saturation';

  @override
  String get accessibilitySaturationDescription =>
      'Adjust how vivid theme colors appear across the app.';

  @override
  String get accessibilityUnreadGroupTitle => 'Ungelesene Indikatoren';

  @override
  String get accessibilityUnreadGroupDescription =>
      'Steuern Sie, wie ungelesene Nachrichtenindikatoren angezeigt werden.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'Abgeblendeten ungelesenen Indikator in stummgeschalteten Kanälen anzeigen';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'Zeigen Sie einen abgeblendeten ungelesenen Indikator neben stummgeschalteten Direktnachrichten und Kanälen an, damit Sie auf einen Blick sehen können, wann Aktivität stattfindet.';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'DM-Nachrichten-Vorschauen';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Steuern Sie, wann Nachrichten-Vorschauen in der DM-Liste angezeigt werden.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'DM-Nachrichten-Vorschau-Modus';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Alle Nachrichten';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Nachrichten-Vorschauen für alle DM-Konversationen anzeigen';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Nur ungelesene DMs';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Nachrichten-Vorschauen nur für DMs mit ungelesenen Nachrichten anzeigen';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Keine';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Keine Nachrichten-Vorschauen in der DM-Liste anzeigen';

  @override
  String get dmListSentAnAttachment => 'Hat einen Anhang gesendet';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username hat eine Nachricht an diesen Kanal angeheftet.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username hat $userName zur Gruppe hinzugefügt.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username hat jemanden zur Gruppe hinzugefügt.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username hat die Gruppe verlassen.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username hat $userName aus der Gruppe entfernt.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username hat jemanden aus der Gruppe entfernt.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username hat den Kanalnamen in $newName geändert.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username hat den Kanalnamen geändert.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username hat das Kanalbild geändert.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username hat einen Anruf gestartet.';
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
  String get voiceConnectionConfirmTitle => 'Sprachverbindungsbestätigung';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Du bist bereits von $count anderen Geräten mit diesem Sprachkanal verbunden. Was möchtest du tun?',
      one:
          'Du bist bereits von 1 anderen Gerät mit diesem Sprachkanal verbunden. Was möchtest du tun?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Zu diesem Gerät wechseln';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Einfach beitreten (andere Verbindungen beibehalten)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Nichts tun, ich möchte nicht beitreten';

  @override
  String get voiceChannelEmptyDescription =>
      'Dies ist ein Sprachkanal. Verbinde dich, um zu sprechen!';

  @override
  String get voiceChannelJoin => 'Sprachkanal beitreten';

  @override
  String get voiceChannelJoinConnect => 'Sprachkanal beitreten';

  @override
  String get voiceChannelNoConnectPermission =>
      'Du hast keine Berechtigung, diesem Sprachkanal beizutreten';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Mikrofon-, Kamera- und Bildschirmfreigabeinhalte sind Ende-zu-Ende-verschlüsselt.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Mikrofon-, Kamera- und Bildschirmfreigabeinhalte sind Ende-zu-Ende-verschlüsselt.';

  @override
  String get voiceChannelE2eeBroken =>
      'Ende-zu-Ende-Verschlüsselung ist nicht verfügbar, da ein nicht unterstützter Teilnehmer in diesem Sprachkanal ist.';

  @override
  String get voiceCallE2eeBroken =>
      'Ende-zu-Ende-Verschlüsselung ist nicht verfügbar, da ein nicht unterstützter Teilnehmer in diesem Anruf ist.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Dieser Client muss aktualisiert werden, bevor er diesem verschlüsselten Anruf beitritt.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Dein Mikrofon konnte nicht gestartet werden. Du bist noch im Anruf.';

  @override
  String get voiceChannelStatusConnecting => 'Verbinden…';

  @override
  String get voiceChannelStatusConnected => 'Verbunden';

  @override
  String get voiceChannelStatusError => 'Fehler';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Mobiles Gerät';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Desktop-Gerät';

  @override
  String get voiceParticipantTooltipCommunityMuted =>
      'Von der Community stummgeschaltet';

  @override
  String get voiceParticipantTooltipMuted => 'Stummgeschaltet';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Von der Community taubgeschaltet';

  @override
  String get voiceParticipantTooltipDeafened => 'Taubgeschaltet';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Verbindung: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Teilnehmer',
      one: '1 Teilnehmer',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Verlassen';

  @override
  String get voiceControlMute => 'Stummschalten';

  @override
  String get voiceControlUnmute => 'Stummschaltung aufheben';

  @override
  String get voiceControlDeafen => 'Taubschalten';

  @override
  String get voiceControlUndeafen => 'Taubschaltung aufheben';

  @override
  String get voiceControlVideo => 'Video';

  @override
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'Bildschirmfreigabe';

  @override
  String get voiceScreenShareNotificationText => 'Bildschirm wird geteilt.';

  @override
  String get voiceControlMore => 'Mehr';

  @override
  String get voiceControlDisconnect => 'Trennen';

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
  String get voiceTextChatShow => 'Chat anzeigen';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# ungelesenen Nachrichten',
      one: '1 ungelesener Nachricht',
    );
    return 'Chat anzeigen mit $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Kamera-Berechtigung ist für Video erforderlich.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Bildschirmfreigabe konnte nicht gestartet werden. Bitte versuche es erneut.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Berechtigung zur Bildschirmfreigabe wurde verweigert.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Bildschirmfreigabe ist auf diesem Gerät nicht verfügbar.';

  @override
  String get voiceWatchStream => 'Stream ansehen';

  @override
  String get voiceStopWatching => 'Nicht mehr ansehen';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Aktuellen Stream nicht mehr ansehen';

  @override
  String get voiceOwnScreenShareTitle => 'Du sendest';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Dein Stream ist für Teilnehmer live.';

  @override
  String get voiceLiveBadge => 'LIVE';

  @override
  String get dmVoiceViewCall => 'Anruf ansehen';

  @override
  String get dmVoiceCallFullScreen => 'Vollbild';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Anruf im Vollbildmodus öffnen';

  @override
  String get dmVoiceStripStatusConnecting => 'Verbinde…';

  @override
  String get dmVoiceStripStatusInCall => 'Im Anruf';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Sprachanruf';

  @override
  String get dmVoiceCallBarConnecting => 'Verbinde…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Direkter Anruf';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Gruppenanruf';

  @override
  String get dmVoiceCallBarIssueFallback => 'Sprachproblem';

  @override
  String get dmVoiceFullscreenTitle => 'Sprachkanal';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Sprachkanal beigetreten';

  @override
  String get notificationsPageTitle => 'Benachrichtigungen';

  @override
  String get notificationsFilterUnreads => 'Ungelesen';

  @override
  String get notificationsFilterMentions => 'Erwähnungen';

  @override
  String get notificationsBookmarksTooltip => 'Lesezeichen';

  @override
  String get notificationsMentionFilterTooltip => 'Erwähnungen filtern';

  @override
  String get notificationsMentionFiltersTitle => 'Erwähnungsfilter';

  @override
  String get notificationsMentionIncludeEveryone =>
      '@everyone und @here-Erwähnungen einschließen';

  @override
  String get notificationsMentionIncludeRoles =>
      'Rollen-Erwähnungen einschließen';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Alle Community-Erwähnungen einschließen';

  @override
  String get notificationsNoUnreadTitle => 'Keine ungelesenen Nachrichten';

  @override
  String get notificationsNoUnreadBody => 'Du bist auf dem neuesten Stand.';

  @override
  String get notificationsNoMentionsTitle => 'Keine aktuellen Erwähnungen';

  @override
  String get notificationsNoMentionsBody =>
      'Alle @-Erwähnungen von dir erscheinen hier für 7 Tage.';

  @override
  String get notificationsMentionsEndTitle => 'Du hast das Ende erreicht';

  @override
  String get notificationsMentionsEndBody =>
      'Du hast alle deine letzten Erwähnungen gesehen. Keine Sorge, hier werden bald mehr erscheinen.';

  @override
  String get notificationsJump => 'Springen';

  @override
  String get notificationsRemoveMentionTooltip => 'Erwähnung entfernen';

  @override
  String get notificationsViewAllUnread => 'Alle ungelesenen anzeigen';

  @override
  String get notificationsMarkAsRead => 'Als gelesen markieren';

  @override
  String get notificationsExpand => 'Erweitern';

  @override
  String get notificationsCollapse => 'Einklappen';

  @override
  String get notificationsMessageUnavailable =>
      'Diese Nachricht konnte nicht geladen werden.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining Zeichen übrig';
  }

  @override
  String get characterCounterTooLong => 'Nachricht ist zu lang';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining Zeichen übrig. Hol dir $productName, um bis zu $premiumMaxLength Zeichen zu schreiben.';
  }

  @override
  String get chatMessageFailedToSend =>
      'Nachricht konnte nicht gesendet werden';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Deine Nachricht konnte nicht zugestellt werden. Das liegt meist daran, dass du keine Community mit dem Empfänger teilst oder der Empfänger nur Direktnachrichten von Freunden akzeptiert. Möglicherweise musst du auch deine eigenen Datenschutzeinstellungen für Direktnachrichten in $settingsPath anpassen.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Deine Nachricht konnte nicht zugestellt werden. Du musst deinen Account beanspruchen, um Direktnachrichten senden zu können.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Deine Nachricht konnte nicht zugestellt werden. Du musst deinen Account beanspruchen, um Nachrichten senden zu können.';

  @override
  String get chatSendFailureContentBlocked =>
      'Deine Nachricht konnte nicht zugestellt werden, da sie von unseren Sicherheitssystemen markiert wurde. Wenn du glaubst, dass dies ein Fehler ist, kontaktiere bitte den Support.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Deine Nachricht konnte nicht zugestellt werden, da sie jugendgefährdende Emoji oder Sticker enthält, die in diesem Kontext nicht erlaubt sind.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'Nur du kannst diese Nachricht sehen.';

  @override
  String get chatClientSystemDismiss => 'Schließen';

  @override
  String get privacyDashboardCommunicationSection => 'Kommunikation';

  @override
  String get chatMessageDeleteFailed =>
      'Nachricht konnte nicht gelöscht werden';

  @override
  String get chatMessageAddReaction => 'Reaktion hinzufügen';

  @override
  String get chatMessageEdit => 'Nachricht bearbeiten';

  @override
  String get chatMessageReply => 'Antworten';

  @override
  String get chatMessageForward => 'Weiterleiten';

  @override
  String get forwardMessageTitle => 'Nachricht weiterleiten';

  @override
  String get forwardSearchHint => 'Kanäle oder Direktnachrichten suchen';

  @override
  String get forwardDirectMessagesSection => 'Direktnachrichten';

  @override
  String get forwardCommentHint => 'Kommentar hinzufügen (optional)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Senden ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Keine Kanäle gefunden';

  @override
  String get forwardSuccessToast => 'Nachricht weitergeleitet';

  @override
  String get forwardFailed => 'Nachricht konnte nicht weitergeleitet werden';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Kommentare sind nicht verfügbar, da in einem ausgewählten Kanal der Zeitlimit-Modus aktiviert ist.';

  @override
  String get forwardDestinationNoSendPermission =>
      'Du kannst hier keine Nachrichten senden';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Du kannst hier keine Links einbetten';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Du kannst hier keine Dateien anhängen';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Nachrichten senden ist in dieser Community deaktiviert';

  @override
  String get forwardDestinationTimedOut =>
      'Du bist in dieser Community im Zeitlimit';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Zeitlimit-Modus – warte $remaining';
  }

  @override
  String get chatMessageCopyText => 'Nachricht kopieren';

  @override
  String get chatMessagePin => 'Nachricht anpinnen';

  @override
  String get chatMessageUnpin => 'Nachricht lösen';

  @override
  String get chatMessageUnpinIt => 'Lösen';

  @override
  String get chatMessageBookmark => 'Nachricht als Lesezeichen speichern';

  @override
  String get chatMessageRemoveBookmark => 'Lesezeichen entfernen';

  @override
  String get chatMessageMarkAsUnread => 'Als ungelesen markieren';

  @override
  String get chatMessageCopyMessageLink => 'Nachrichtenlink kopieren';

  @override
  String get chatMessageCopyMessageId => 'Nachrichten-ID kopieren';

  @override
  String get chatMessageViewReactions => 'Reaktionen anzeigen';

  @override
  String get chatMessageRemoveAllReactions => 'Alle Reaktionen entfernen';

  @override
  String get chatMessageDebug => 'Nachricht debuggen';

  @override
  String get chatMessageDebugSheetTitle => 'Nachricht debuggen';

  @override
  String get chatMessageDebugCopyJson => 'JSON kopieren';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'Nachrichten-JSON in die Zwischenablage kopiert';

  @override
  String get chatReactionsSheetTitle => 'Reaktionen';

  @override
  String get chatReactionsSheetEmpty => 'Niemand hat bisher darauf reagiert.';

  @override
  String get chatMessageReport => 'Nachricht melden';

  @override
  String get iarReportMessageTitle => 'Nachricht melden';

  @override
  String get iarThisUserFallback => 'diesem Nutzer';

  @override
  String get iarModalDescription =>
      'Regelverstoß melden oder Tools zur Verwaltung von Kontakten und Einstellungen finden.';

  @override
  String get iarPathStepAriaLabel => 'Was brauchst du?';

  @override
  String get iarCategoryStepTitle => 'Welche Art von Regel wurde gebrochen?';

  @override
  String get iarReasonStepTitle => 'Welche Regel wurde gebrochen?';

  @override
  String get iarReasonSelectHint => 'Grund auswählen';

  @override
  String get iarPickAnOptionToast => 'Wähle eine Option, um fortzufahren.';

  @override
  String get iarPickARuleToast => 'Wähle die gebrochene Regel aus.';

  @override
  String get iarPathPlatform => 'Regelverstoß auf der Plattform melden';

  @override
  String get iarPathCommunity => 'An die Moderatoren dieser Community melden';

  @override
  String get iarPathPreferenceMessage => 'Ich mag diese Inhalte nicht';

  @override
  String get iarCategoryTargetedHarmLabel =>
      'Bedrohungen, Belästigung oder Schaden';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Mobbing, Drohungen, Hass, Gewalt, Razzien oder Inhalte, die Selbstverletzung fördern.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Kinderschutz oder jugendgefährdende Inhalte';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Minderjährige in Gefahr, jugendgefährdende Inhalte am falschen Ort oder unerwünschtes Verhalten.';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'Privatsphäre oder Identitätsdiebstahl';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxing, Stalking, sich als jemand ausgeben oder ein unangemessenes Profil.';

  @override
  String get iarCategoryDeceptionLabel =>
      'Betrug, Malware oder Fehlinformationen';

  @override
  String get iarCategoryDeceptionDescription =>
      'Phishing, Betrug, bösartige Links oder falsche Behauptungen, die wahrscheinlich echten Schaden verursachen.';

  @override
  String get iarCategoryIllegalOtherLabel =>
      'Illegale Aktivität oder etwas anderes';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Illegale Verkäufe, kriminelle Erleichterung oder ein klarer Regelverstoß, der nicht oben passt.';

  @override
  String get iarReasonHarassmentLabel => 'Belästigung oder Drohungen';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Mobbing, wiederholter unerwünschter Kontakt, Stalking oder gezielte Beleidigung.';

  @override
  String get iarReasonHateLabel => 'Hassrede';

  @override
  String get iarReasonHateMessageDescription =>
      'Schimpfwörter, entmenschlichende Sprache oder Angriffe auf geschützte Gruppen.';

  @override
  String get iarReasonViolenceLabel => 'Gewalt oder Gewaltdrohungen';

  @override
  String get iarReasonViolenceDescription =>
      'Glaubwürdige Drohungen, grafische Gewalt oder Verherrlichung von Gewalt.';

  @override
  String get iarReasonMatureContentLabel =>
      'Jugendgefährdende Inhalte oder Belästigung';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Unerwünschtes Verhalten oder jugendgefährdende Inhalte am falschen Ort.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Kinderschutz oder Ausbeutung von Minderjährigen';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Grooming oder Inhalte zur Ausbeutung von Minderjährigen.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Schädliche Fehlinformationen';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Falsche Behauptungen, die wahrscheinlich echten Schaden verursachen.';

  @override
  String get iarReasonSpamLabel => 'Spam, Betrug oder Phishing';

  @override
  String get iarReasonSpamMessageDescription =>
      'Massen-Spam, Betrug, gefälschte Gewinnspiele oder Missbrauch von Accounts.';

  @override
  String get iarReasonMalwareLabel => 'Malware oder gefährliche Links';

  @override
  String get iarReasonMalwareDescription =>
      'Malware, Diebstahl von Anmeldedaten oder schädliche Dateien.';

  @override
  String get iarReasonPrivacyLabel => 'Verletzung der Privatsphäre';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxing, offengelegte private Informationen oder Stalking.';

  @override
  String get iarReasonImpersonationLabel =>
      'Identitätsdiebstahl oder täuschende Medien';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Sich als jemand anderes ausgeben, einschließlich täuschender KI-generierter Inhalte.';

  @override
  String get iarReasonIllegalLabel => 'Illegale Aktivität';

  @override
  String get iarReasonIllegalDescription =>
      'Illegale Verkäufe, kriminelle Erleichterung oder rechtswidrige Aktivitäten.';

  @override
  String get iarReasonSelfHarmLabel => 'Selbstverletzung oder Suizid';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Förderung oder Anleitungen zur Selbstverletzung oder zu Essstörungen.';

  @override
  String get iarReasonOtherLabel => 'Ein anderer klarer Regelverstoß';

  @override
  String get iarReasonOtherDescription =>
      'Nur verwenden, wenn es eindeutig gegen die Regeln von Fluxer verstößt und nicht oben passt.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Wenn ein Minderjähriger beteiligt ist, verwende stattdessen \"$childSafetyReason\".';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Wenn es sich um CSAM oder die Ausbeutung eines Minderjährigen handelt, sende es jetzt und teile das Material nicht erneut.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Wenn jemand in unmittelbarer Gefahr ist, kontaktiere die örtlichen Rettungsdienste, wenn du dies sicher tun kannst.';

  @override
  String get iarSafetyNoteViolence =>
      'Wenn dies eine glaubwürdige, unmittelbare Bedrohung ist, kontaktiere ebenfalls die örtlichen Rettungsdienste.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Wenn dies eine unmittelbare terroristische Bedrohung ist, kontaktiere ebenfalls die örtlichen Rettungsdienste.';

  @override
  String get iarActionBlockUserTitle => 'Diesen Benutzer blockieren';

  @override
  String get iarActionBlockUserDescription =>
      'Nachrichten und Freundschaftsanfragen stoppen.';

  @override
  String get iarActionBlockUserButton => 'Blockieren';

  @override
  String get iarActionCopyMessageLinkTitle => 'Nachrichtenlink kopieren';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Mit Community-Mods teilen.';

  @override
  String get iarActionCopyMessageLinkButton => 'Kopieren';

  @override
  String get iarActionCloseDmTitle => 'Diese Direktnachricht schließen';

  @override
  String get iarActionCloseDmDescription =>
      'Blockiert nicht. Kann später wieder geöffnet werden.';

  @override
  String get iarActionCloseDmButton => 'DM schließen';

  @override
  String get iarActionLeaveCommunityTitle => 'Community verlassen';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Keine Inhalte und Mitglieder mehr sehen.';

  @override
  String get iarActionLeaveCommunityButton => 'Verlassen';

  @override
  String get iarActionDmSettingsTitle =>
      'DM- & Freundschaftsanfragen-Einstellungen';

  @override
  String get iarActionDmSettingsDescription =>
      'Ändere, wer dich erreichen kann.';

  @override
  String get iarActionCallSettingsTitle => 'Anruf- & Gruppenchat-Einstellungen';

  @override
  String get iarActionCallSettingsDescription =>
      'Ändere, wer dich anrufen oder hinzufügen kann.';

  @override
  String get iarActionOpenButton => 'Öffnen';

  @override
  String get iarActionDeleteMessageTitle => 'Diese Nachricht löschen';

  @override
  String get iarActionDeleteMessageDescription =>
      'Entferne sie für alle aus dem Kanal.';

  @override
  String get iarActionDeleteMessageButton => 'Löschen';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Gelöscht';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Diese Nachricht wurde bereits gelöscht.';

  @override
  String get iarActionBanUserTitle => 'Diesen Nutzer sperren';

  @override
  String get iarActionBanUserDescription =>
      'Öffne den Sperr-Dialog für diese Community.';

  @override
  String get iarActionBanUserButton => 'Sperren';

  @override
  String get iarActionBanUserBannedButton => 'Gebannt';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Dieser Nutzer ist bereits in der Community gebannt.';

  @override
  String get iarCloseDmConfirmTitle => 'DM schließen';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Schließe deine aktuelle DM mit $name. Das blockiert sie nicht; du kannst sie später wieder öffnen.';
  }

  @override
  String get iarSuccessTitle => 'Bericht gesendet';

  @override
  String get iarSuccessBody =>
      'Unser Sicherheitsteam prüft ihn. Wir senden dir eine DM und E-Mail, sobald wir eine Entscheidung getroffen haben.';

  @override
  String get iarAlreadyReportedTitle => 'Bereits gemeldet';

  @override
  String get iarAlreadyReportedBody =>
      'Du hast diese Nachricht bereits gemeldet. Unser Sicherheitsteam prüft sie.';

  @override
  String get iarBackButton => 'Zurück';

  @override
  String get iarContinueButton => 'Weiter';

  @override
  String get iarSendReportButton => 'Bericht senden';

  @override
  String get iarDoneButton => 'Fertig';

  @override
  String get iarCouldntSendToast =>
      'Bericht konnte nicht gesendet werden. Bitte versuche es erneut.';

  @override
  String get iarRateLimitedToast =>
      'Du meldest zu schnell. Bitte warte einen Moment und versuche es erneut.';

  @override
  String get iarReportSentToast =>
      'Bericht gesendet. Unser Sicherheitsteam wird ihn prüfen.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return '$name blockieren? Sie können dir keine Nachrichten mehr senden oder Freundschaftsanfragen stellen. Du kannst sie später wieder entsperren.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Nutzer konnte nicht blockiert werden. Bitte versuche es erneut.';

  @override
  String get iarCloseDmSuccessToast => 'DM geschlossen.';

  @override
  String get iarCloseDmFailedToast =>
      'DM konnte nicht geschlossen werden. Bitte versuche es erneut.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Community konnte nicht verlassen werden. Bitte versuche es erneut.';

  @override
  String get chatMessageSuppressEmbeds => 'Einbettungen unterdrücken';

  @override
  String get chatMessageUnsuppressEmbeds => 'Einbettungen wiederherstellen';

  @override
  String get chatMessageDelete => 'Nachricht löschen';

  @override
  String get chatMessageDeleteConfirmTitle => 'Nachricht löschen';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Möchtest du diese Nachricht wirklich löschen?';

  @override
  String get chatMessageMore => 'Mehr';

  @override
  String get chatEditingMessage => 'Nachricht wird bearbeitet';

  @override
  String get chatReplyOriginalDeleted => 'Originalnachricht wurde gelöscht';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Originalnachricht konnte nicht geladen werden';

  @override
  String get chatReplyAttachedMedia => 'Nachricht enthält angehängte Medien';

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
      'Nachrichten konnten nicht geladen werden.';

  @override
  String get chatReplyMentionOverrideTitle =>
      'Erwähnungseinstellung überschreiben?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname möchte lieber mit @-erwähnt werden, wenn auf Nachrichten geantwortet wird. Trotzdem ohne Erwähnung senden?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname bevorzugt Antworten ohne @-Erwähnung. Trotzdem mit Erwähnung senden?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Präferenz ignorieren';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Klicken, um den Benutzer, auf den Sie antworten, nicht zu pingen.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Klicken, um den Benutzer, auf den Sie antworten, zu pingen.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Antwortenden Benutzer erwähnen';

  @override
  String get chatReplyMentionOn => 'An';

  @override
  String get chatReplyMentionOff => 'Aus';

  @override
  String get chatReplyCancel => 'Antwort abbrechen';

  @override
  String get chatEditMessageHint => 'Nachricht bearbeiten';

  @override
  String get chatEditNoChanges => 'Keine Änderungen zum Speichern';

  @override
  String get chatChannelNotReady =>
      'Dieser Kanal ist noch nicht bereit. Versuchen Sie es in einem Moment erneut.';

  @override
  String get chatMessageEdited => '(bearbeitet)';

  @override
  String get chatMessageSilent => 'Dies war eine @silent-Nachricht.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Heute um $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Gestern um $time';
  }

  @override
  String get mediaViewerImagePreview => 'Bildvorschau';

  @override
  String get mediaViewerClose => 'Medienanzeige schließen';

  @override
  String get mediaViewerOpenInBrowser => 'Im Browser öffnen';

  @override
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

  @override
  String get mediaViewerForward => 'Weiterleiten';

  @override
  String get mediaViewerZoomIn => 'Vergrößern';

  @override
  String get mediaViewerZoomOut => 'Verkleinern';

  @override
  String get mediaViewerPreviousAttachment => 'Vorheriger Anhang';

  @override
  String get mediaViewerNextAttachment => 'Nächster Anhang';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String get chatAttachmentVideoToggleControls => 'Videosteuerung umschalten';

  @override
  String get chatAttachmentVideoMute => 'Video stummschalten';

  @override
  String get chatAttachmentVideoUnmute => 'Video-Ton einschalten';

  @override
  String get chatAttachmentVideoPlay => 'Video abspielen';

  @override
  String get chatAttachmentVideoPause => 'Video anhalten';

  @override
  String get chatAttachmentVideoProgress => 'Video-Fortschritt';

  @override
  String get chatVideoPlaybackFailed =>
      'Dieses Video konnte nicht abgespielt werden.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Benachrichtigen Sie Benutzer mit dieser Rolle, die die Berechtigung haben, diesen Kanal anzuzeigen.';

  @override
  String get addGuildModalTitle => 'Community hinzufügen';

  @override
  String get addGuildModalLandingDescription =>
      'Erstellen Sie eine neue Community oder treten Sie einer bestehenden bei.';

  @override
  String get addGuildCreateCommunity => 'Community erstellen';

  @override
  String get addGuildJoinCommunity => 'Community beitreten';

  @override
  String get addGuildImportDiscordTemplate => 'Discord-Vorlage importieren';

  @override
  String get addGuildJoinTitle => 'Einer Community beitreten';

  @override
  String get addGuildJoinDescription =>
      'Geben Sie den Einladungslink ein, um einer Community beizutreten.';

  @override
  String get addGuildInviteLinkLabel => 'Einladungslink';

  @override
  String get addGuildJoinSubmit => 'Community beitreten';

  @override
  String get addGuildInviteInvalid =>
      'Diese Einladung ist ungültig oder abgelaufen.';

  @override
  String get addGuildJoinFailed =>
      'Der Beitritt zur Community ist fehlgeschlagen. Bitte versuchen Sie es erneut.';

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
  String get addGuildPackInstalled => 'Paket erfolgreich installiert.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Alle Reaktionen entfernen';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Möchten Sie wirklich alle Reaktionen von dieser Nachricht entfernen?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Nachricht anpinnen aufheben';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Diese Anstecknadel in der Zeit zurückschicken?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username hat $messageLink in diesem Kanal angepinnt. Alle angepinnten Nachrichten anzeigen: $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'eine Nachricht';

  @override
  String get systemPinMessageAllPinsLink => 'alle angepinnten Nachrichten';

  @override
  String get channelPinsEmptyTitle => 'Keine angepinnten Nachrichten';

  @override
  String get channelPinsEmptyDescription =>
      'Hier werden angepinnte Nachrichten angezeigt.';

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
  String get channelMenuDuplicateChannel => 'Kanal duplizieren';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Zustimmung zu nicht jugendfreien Inhalten zurücksetzen';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Deine Nachrichten in diesem Kanal löschen?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Alle Nachrichten, die du jemals in diesem Kanal gesendet hast, werden endgültig gelöscht. Dieser Vorgang kann nicht rückgängig gemacht werden.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Delete My Messages';

  @override
  String get channelMenuDeletedYourMessages =>
      'Deine Nachrichten wurden gelöscht';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'Deine Nachrichten konnten nicht gelöscht werden';

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
  String get personalNotesTitle => 'Persönliche Notizen';

  @override
  String get personalNotesSubtitle =>
      'Dein privater Bereich für Gedanken und Erinnerungen';

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
    return 'Willkommen in $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'Am Anfang war nichts. Dann kam $channelName. Und es war gut.';
  }

  @override
  String get personalNotesComposerHint => 'Schreib dir selbst eine Nachricht';

  @override
  String get personalNotesPrivateSpace => 'Dein privater Bereich';

  @override
  String get purgePersonalNotes => 'Persönliche Notizen löschen';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Dadurch werden alle Nachrichten und Anhänge in deinen persönlichen Notizen dauerhaft gelöscht. Dies kann nicht rückgängig gemacht werden.';

  @override
  String get purgePersonalNotesConfirmButton => 'Löschen';

  @override
  String purgePersonalNotesSuccess(int count) {
    return '$count Nachrichten aus persönlichen Notizen gelöscht';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Persönliche Notizen waren bereits leer';

  @override
  String get purgePersonalNotesFailed =>
      'Persönliche Notizen konnten nicht geleert werden';

  @override
  String get userSettingsGroupYourAccount => 'DEIN ACCOUNT';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Sicherheit & Anmeldung';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Geschenke & Codes';

  @override
  String get userSettingsNavPrivacyDashboard => 'Datenschutz-Dashboard';

  @override
  String get userSettingsNavAuthorizedApps => 'Autorisierte Apps';

  @override
  String get userSettingsNavBlockedUsers => 'Blockierte Benutzer';

  @override
  String get userSettingsNavLinkedDevices => 'Verbundene Geräte';

  @override
  String get userSettingsNavConnections => 'Verbindungen';

  @override
  String get userSettingsNavLookAndFeel => 'Darstellung';

  @override
  String get userSettingsNavAccessibility => 'Barrierefreiheit';

  @override
  String get userSettingsNavChat => 'Nachrichten & Medien';

  @override
  String get userSettingsNavAudioAndVideo => 'Audio & Video';

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
  String get userSettingsNavLanguageAndTime => 'Sprache & Uhrzeit';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Interface language';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Choose the language used throughout the app';

  @override
  String get languageAndTimeOpenLanguageSettings => 'Open language settings';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Zeitformat';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Choose how times are displayed throughout the app';

  @override
  String get languageAndTimeTimeFormatSelectionLabel => 'Zeitformat Auswahl';

  @override
  String get languageAndTimeTimeFormatAuto => 'Auto';

  @override
  String get languageAndTimeTimeFormat12Hour => '12-stündig';

  @override
  String get languageAndTimeTimeFormat24Hour => '24-stündig';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'App-Sprache: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'System-Spracheinstellung: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Nutze die System-Spracheinstellung für das Zeitformat';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'Zeitformat konnte nicht aktualisiert werden';

  @override
  String get userSettingsNavAdvanced => 'Erweitert';

  @override
  String get advancedPerformanceReportingTitle => 'Leistungsberichte';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Hilf mit, Fluxer zu verbessern, indem du anonyme Absturz- und Leistungsdaten teilst.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Absturz- und Leistungsberichte senden';

  @override
  String get advancedPerformanceReportingDescription =>
      'Alle gemeldeten Daten sind anonym und werden nur an Fluxers eigenen Überwachungsdienst gesendet – es werden keine Drittanbieter verwendet.';

  @override
  String get userSettingsNavApplications => 'Anwendungen';

  @override
  String get userSettingsNavAppLogs => 'App-Protokolle';

  @override
  String get userSettingsNavDeveloperTools => 'Entwicklertools';

  @override
  String get userSettingsNavLimitsConfig => 'Limits-Konfiguration';

  @override
  String get userSettingsNavFeatureFlags => 'Feature Flags';

  @override
  String get userSettingsNavWhatsNew => 'Neues';

  @override
  String get userSettingsNavLogOut => 'Abmelden';

  @override
  String get betaWarningTitle => 'Beta-Software';

  @override
  String get betaWarningMessage =>
      'Dies ist Beta-Software. Noch ist nicht alles fertig oder hinzugefügt.';

  @override
  String get betaWarningReportIssues =>
      'Bitte melde alle gefundenen Probleme an die Fluxer Mobile Community (derzeit musst du Plutonium haben, um der Community beitreten zu können).';

  @override
  String get betaWarningRepoLink => 'Quelle auf GitHub anzeigen';

  @override
  String get betaWarningGotIt => 'Verstanden';

  @override
  String get quickSwitcherTabSearch => 'Suchen';

  @override
  String get quickSwitcherTabFriends => 'Freunde';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Kanäle, Personen oder Communitys suchen';

  @override
  String get quickSwitcherSearchFriends => 'Freunde suchen';

  @override
  String get quickSwitcherNoMatchesFound => 'Keine Treffer gefunden';

  @override
  String get quickSwitcherEmptyHint =>
      'Versuche einen anderen Namen oder verwende die Präfixe @ / # / ! / *, um Ergebnisse zu filtern.';

  @override
  String get quickSwitcherSectionPeople => 'Personen';

  @override
  String get quickSwitcherSectionGroupMessages => 'Gruppenchats';

  @override
  String get quickSwitcherSectionTextChannels => 'Textkanäle';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Sprachkanäle';

  @override
  String get quickSwitcherSectionCommunities => 'Communities';

  @override
  String get quickSwitcherSectionSettings => 'Einstellungen';

  @override
  String get quickSwitcherHomeLabel => 'Startseite';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Direktnachrichten';

  @override
  String get quickSwitcherFavoritesLabel => 'Favoriten';

  @override
  String get quickSwitcherUserSettingsLabel => 'Benutzereinstellungen';

  @override
  String get quickSwitcherNotificationsLabel => 'Benachrichtigungen';

  @override
  String get quickSwitcherBookmarksLabel => 'Lesezeichen';

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
  String get quickSwitcherMentionsLabel => 'Erwähnungen';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Noch keine Freunde';

  @override
  String get quickSwitcherFriendsEmptyHint =>
      'Füge einen Freund hinzu, um loszulegen.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Keine Freunde entsprechen dieser Suche';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Versuche einen anderen Namen.';

  @override
  String get quickSwitcherSearchAliasUser => 'Benutzer';

  @override
  String get quickSwitcherSearchAliasYou => 'Du';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'DMs';

  @override
  String get quickSwitcherSearchAliasMessages => 'Nachrichten';

  @override
  String get quickSwitcherSearchAliasFav => 'Favoriten';

  @override
  String get quickSwitcherSearchAliasStarred => 'Markiert';

  @override
  String get quickSwitcherSearchAliasInbox => 'Posteingang';

  @override
  String get quickSwitcherSearchAliasSaved => 'Gespeichert';

  @override
  String get uiClose => 'Schließen';

  @override
  String get chatJumpToBottom => 'Zum Ende springen';

  @override
  String get uiConfirm => 'Bestätigen';

  @override
  String get uiLoading => 'Wird geladen';

  @override
  String get uiUnsavedChanges => 'Ungespeicherte Änderungen';

  @override
  String get uiReset => 'Zurücksetzen';

  @override
  String get uiOpenColorPicker => 'Farbauswahl öffnen';

  @override
  String get uiSelectPlaceholder => 'Auswählen';

  @override
  String get uiSearchPlaceholder => 'Suchen';

  @override
  String get uiNoOptionsFound => 'Keine Optionen gefunden';

  @override
  String get uiDismissNotification => 'Benachrichtigung schließen';

  @override
  String get uiColorPickerTitle => 'Farbauswahl';

  @override
  String get mentionConfirmTitle => 'Alle erwähnen?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Dies benachrichtigt $count Mitglieder. Fortfahren?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Dies benachrichtigt $count Mitglieder, die online sind. Fortfahren?';
  }

  @override
  String get mentionConfirmButton => 'Erwähnen';

  @override
  String get composerEmojiUnavailable =>
      'Dieses Emoji kannst du hier nicht verwenden.';

  @override
  String get instanceUrlLabel => 'Instanz-URL';

  @override
  String get instanceUrlPlaceholder =>
      'Instanz-URL eingeben (z. B. fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Auf Fluxer zurücksetzen';

  @override
  String get instanceConnect => 'Verbinden';

  @override
  String get instanceConnecting => 'Verbinde…';

  @override
  String get instanceConnectFailed => 'Verbindung zur Instanz fehlgeschlagen';

  @override
  String get recentInstances => 'Kürzliche Instanzen';

  @override
  String removeRecentInstance(String domain) {
    return '$domain aus kürzlichen Instanzen entfernen';
  }

  @override
  String get instanceSheetTitle => 'Mit Instanz verbinden';

  @override
  String get connectToDifferentInstance =>
      'Mit einer anderen Instanz verbinden';

  @override
  String get changeInstance => 'Ändern';

  @override
  String get instanceConnectionRequired =>
      'Verbinde dich mit der Instanz, um dich anzumelden';

  @override
  String get comingSoon => 'Demnächst verfügbar';

  @override
  String get guildNavbarDirectMessages => 'Direktnachrichten';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Entdeckbare Communitys durchsuchen';

  @override
  String get discoveryExplore => 'Entdecken';

  @override
  String get discoveryExplorePublicCommunities =>
      'Öffentliche Communitys entdecken';

  @override
  String get discoveryListingSubheading =>
      'Möchtest du deine Community hier auflisten? Bewirb dich, wenn du die Anforderungen in den Einstellungen deiner Community > Entdecken erfüllst.';

  @override
  String get discoverySearchCommunities => 'Communitys suchen';

  @override
  String get discoveryFilterByLanguage => 'Nach Sprache filtern';

  @override
  String get discoveryAllLanguages => 'Alle Sprachen';

  @override
  String get discoveryAllCategories => 'Alle';

  @override
  String get discoveryCategoryGaming => 'Gaming';

  @override
  String get discoveryCategoryMusic => 'Musik';

  @override
  String get discoveryCategoryEntertainment => 'Unterhaltung';

  @override
  String get discoveryCategoryEducation => 'Bildung';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Wissenschaft & Technik';

  @override
  String get discoveryCategoryContentCreator => 'Content Creator';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime & Manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Filme & TV';

  @override
  String get discoveryCategoryOther => 'Sonstiges';

  @override
  String get discoveryNoCommunitiesMatch => 'Keine Communitys gefunden.';

  @override
  String get discoveryJoinCommunity => 'Community beitreten';

  @override
  String get discoveryJoined => 'Beigetreten';

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
      other: '$countString Mitglieder',
      one: '1 Mitglied',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Keine Beschreibung.';

  @override
  String get discoveryCommunities => 'Communities';

  @override
  String get discoveryApps => 'Apps';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Diese Community konnte nicht beigetreten werden';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Etwas ist schiefgelaufen. Bitte versuche es gleich noch einmal.';

  @override
  String get discoveryJoinErrorFullTitle => 'Diese Community ist voll';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Diese Community hat ihr Mitgliedslimit erreicht, daher kannst du ihr im Moment nicht beitreten.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Du bist der maximalen Anzahl an Communitys beigetreten';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Du bist der maximalen Anzahl von Communitys beigetreten. Verlasse eine und versuche es erneut.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Du kannst dieser Community nicht beitreten';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Du bist von dieser Community gebannt.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Diese Community ist nicht mehr verfügbar';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Sie hat möglicherweise die Entdeckung verlassen oder neue Beitritte deaktiviert. Lade die Seite neu, und du wirst sie nicht mehr sehen.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Du bist zu schnell';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Bitte warte einen Moment und versuche es erneut.';

  @override
  String get guildNavbarAddCommunity => 'Community hinzufügen';

  @override
  String get guildNavbarHelp => 'Hilfe';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'NEUE NACHRICHT';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Ordner $folderName einklappen';
  }

  @override
  String get guildNavbarGroupDm => 'Gruppen-DM';

  @override
  String get guildNavbarCreateChannel => 'Kanal erstellen';

  @override
  String get guildNavbarChannelType => 'Kanalart';

  @override
  String get guildNavbarTextChannel => 'Textkanal';

  @override
  String get guildNavbarTextChannelDescription =>
      'Nachrichten, Bilder, GIFs und Emojis senden';

  @override
  String get guildNavbarVoiceChannel => 'Sprachkanal';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Gemeinsam per Sprache, Video und Bildschirmfreigabe abhängen';

  @override
  String get guildNavbarLinkChannel => 'Kanal verknüpfen';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Schneller Zugriff auf eine externe Website oder Ressource';

  @override
  String get guildNavbarNameLabel => 'Name';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

  @override
  String get guildNavbarCreateCategory => 'Kategorie erstellen';

  @override
  String get guildNavbarNewCategoryHint => 'Neue Kategorie';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Freunde zu $communityName einladen';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Empfänger gelangen zu #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Freunde suchen';

  @override
  String get guildNavbarNoFriendsYet => 'Noch keine Freunde';

  @override
  String get guildNavbarNoResults => 'Keine Ergebnisse';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Oder sende einen Einladungslink an einen Freund:';

  @override
  String get guildNavbarInviteLink => 'Einladungslink';

  @override
  String get guildNavbarCopy => 'Kopieren';

  @override
  String get guildNavbarCopied => 'Kopiert!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Dein Einladungslink läuft in 7 Tagen ab.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Dieser Einladungslink läuft nie ab.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Dein Einladungslink läuft in $duration ab.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Einladungslink bearbeiten';

  @override
  String get guildNavbarInviteLinkSettings => 'Einladungslink-Einstellungen';

  @override
  String get guildNavbarExpireAfter => 'Ablauf nach';

  @override
  String get guildNavbarMaxUses => 'Max. Anzahl der Nutzungen';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Temporäre Mitgliedschaft gewähren';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Mitglieder werden entfernt, wenn sie offline gehen, es sei denn, eine Rolle ist zugewiesen';

  @override
  String get guildNavbarCreateNewLink => 'Neuen Link erstellen';

  @override
  String get guildNavbarSent => 'Gesendet';

  @override
  String get guildNavbarInvite => 'Einladen';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Community verlassen';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Möchtest du diese Community wirklich verlassen? Du kannst dann keine Nachrichten mehr sehen.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Community verlassen';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Deine Nachrichten in dieser Community löschen?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Alle deine Nachrichten hier, in jedem Kanal, dauerhaft löschen. Kann nicht rückgängig gemacht werden.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Meine Nachrichten löschen';

  @override
  String get guildNavbarDeletedYourMessages => 'Deine Nachrichten gelöscht';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Deine Nachrichten konnten nicht gelöscht werden';

  @override
  String get guildNavbarRemoveOverride => 'Überschreibung entfernen';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Stummgeschaltet bis $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible =>
      'Nur für Fluxer-Mitarbeiter zugänglich';

  @override
  String get guildNavbarInvitesPaused =>
      'Einladungen sind in dieser Community derzeit pausiert';

  @override
  String get guildNavbarDurationNever => 'nie';

  @override
  String get guildNavbarDuration30Minutes => '30 Minuten';

  @override
  String get guildNavbarDuration1Hour => '1 Stunde';

  @override
  String get guildNavbarDuration6Hours => '6 Stunden';

  @override
  String get guildNavbarDuration12Hours => '12 Stunden';

  @override
  String get guildNavbarDuration1Day => '1 Tag';

  @override
  String get guildNavbarDuration7Days => '7 Tage';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count Sekunden';
  }

  @override
  String get guildNavbarNever => 'Niemals';

  @override
  String get guildNavbarNoLimit => 'Kein Limit';

  @override
  String get guildNavbarOneUse => '1 Nutzung';

  @override
  String guildNavbarUses(int count) {
    return '$count Nutzungen';
  }

  @override
  String get guildMenuMarkAsRead => 'Als gelesen markieren';

  @override
  String get guildPeekMoreOptions => 'Weitere Optionen';

  @override
  String get guildMenuInviteMembers => 'Mitglieder einladen';

  @override
  String get guildMenuCommunitySettings => 'Community-Einstellungen';

  @override
  String get guildMenuEditCommunityProfile => 'Community-Profil bearbeiten';

  @override
  String get guildMenuUnmuteCommunity => 'Community stummschalten aufheben';

  @override
  String get guildMenuMuteCommunity => 'Community stummschalten';

  @override
  String get guildMenuHideMutedChannels => 'Stummgeschaltete Kanäle ausblenden';

  @override
  String get guildMenuReportCommunity => 'Community melden';

  @override
  String get guildMenuDebugCommunity => 'Community debuggen';

  @override
  String get guildMenuCopyCommunityId => 'Community-ID kopieren';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Bis $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Allgemein';

  @override
  String get guildMenuSettingsRoles => 'Rollen & Berechtigungen';

  @override
  String get guildMenuSettingsEmoji => 'Benutzerdefinierte Emojis';

  @override
  String get guildMenuSettingsStickers => 'Benutzerdefinierte Sticker';

  @override
  String get guildMenuSettingsSafetyModeration => 'Sicherheit & Moderation';

  @override
  String get guildMenuSettingsActivityLog => 'Aktivitätsprotokoll';

  @override
  String get guildMenuSettingsWebhooks => 'Webhooks';

  @override
  String get guildMenuSettingsCustomInviteUrl =>
      'Benutzerdefinierte Einladungs-URL';

  @override
  String get guildMenuSettingsDiscovery => 'Entdeckung';

  @override
  String get guildMenuSettingsMembers => 'Mitglieder';

  @override
  String get guildMenuSettingsInviteLinks => 'Einladungslinks';

  @override
  String get guildMenuSettingsBans => 'Sperren';

  @override
  String get guildMenuSettingsChannels => 'Channels';

  @override
  String get guildSettingsNoPermission =>
      'Du hast keine Berechtigung, diesen Einstellungsbereich anzuzeigen.';

  @override
  String get guildSettingsOverviewIconTitle => 'Icon';

  @override
  String get guildSettingsUploadImage => 'Bild hochladen';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Lade ein Banner für deinen Server hoch.';

  @override
  String get guildSettingsOverviewNameTitle => 'Name';

  @override
  String get guildSettingsOverviewNameHint => 'Meine tolle Community';

  @override
  String get guildSettingsOverviewStatsTitle => 'Statistiken';

  @override
  String get guildSettingsOverviewMembers => 'Mitglieder';

  @override
  String get guildSettingsOverviewOnline => 'Online';

  @override
  String get guildSettingsRolesDescription =>
      'Verwende Rollen, um Mitglieder zu gruppieren und Berechtigungen zuzuweisen.';

  @override
  String get guildSettingsCreateRole => 'Rolle erstellen';

  @override
  String get guildSettingsRolesListTitle => 'Rollen';

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
    return '$staticCount statische, $animatedCount animierte Emoji-Slots belegt';
  }

  @override
  String get guildSettingsEmojiEmpty =>
      'Noch keine benutzerdefinierten Emojis.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count Sticker hochgeladen';
  }

  @override
  String get guildSettingsStickersEmpty =>
      'Noch keine benutzerdefinierten Sticker.';

  @override
  String get guildSettingsModerationVerificationTitle =>
      'Mitgliederüberprüfung';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Lege fest, was Mitglieder haben müssen, bevor sie Community-Mitgliedern Nachrichten senden oder diese direkt anschreiben können.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Mitglieder mit Rollen können diese Prüfungen umgehen. Für öffentliche Bereiche empfehlen wir die Aktivierung der Verifizierung.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Communitys die in der Suche aufgeführt sind, benötigen mindestens eine verifizierte E-Mail-Adresse. „Keine“ kann nicht ausgewählt werden, wenn die Suche aktiviert ist.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Altersbeschränkte Inhalte & Inhaltswarnungen';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Konfiguriere die Kennzeichnung altersbeschränkter Inhalte und optionale Inhaltswarnungen für Mitglieder.';

  @override
  String get guildSettingsModerationMatureToggle => 'Altersbeschränkte Inhalte';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Markiere diese Community als altersbeschränkte Inhalte enthaltend.';

  @override
  String get guildSettingsVerificationNone => 'Keine';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Es ist keine Verifizierung erforderlich.';

  @override
  String get guildSettingsVerificationLow => 'Niedrig';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Erfordert eine verifizierte E-Mail-Adresse.';

  @override
  String get guildSettingsVerificationMedium => 'Mittel';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Erfordert eine verifizierte E-Mail-Adresse und einen Account, der mindestens 5 Minuten alt ist.';

  @override
  String get guildSettingsVerificationHigh => 'Hoch';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Erfordert alles aus „Mittel“ plus die Mitgliedschaft in der Community für mindestens 10 Minuten.';

  @override
  String get guildSettingsVerificationHighest => 'Sehr hoch';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Erfordert eine verifizierte Telefonnummer.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Verfolge Moderatoraktionen in der gesamten Community.';

  @override
  String get guildSettingsAuditLogEmpty => 'Noch keine Protokolle';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Moderationsaktionen und Community-Änderungen werden hier angezeigt.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Alle Benutzer';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Alle Aktionen';

  @override
  String get guildSettingsAuditLogNoReason => 'Es wurde kein Grund angegeben.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Unbekannter Benutzer';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Beim Laden des Aktivitätsprotokolls ist etwas schiefgelaufen.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Aktivitätsprotokolle konnten nicht geladen werden';

  @override
  String get guildSettingsAuditLogReason => 'Grund';

  @override
  String get guildSettingsAuditLogSomeone => 'jemand';

  @override
  String get guildSettingsAuditLogSomething => 'etwas';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'unbekannte Entität';

  @override
  String get guildSettingsAuditLogNothing => 'nichts';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Unbekanntes Ziel';

  @override
  String get auditLogActionGuildUpdate => 'Community aktualisiert';

  @override
  String get auditLogActionChannelCreate => 'Kanal erstellt';

  @override
  String get auditLogActionChannelUpdate => 'Kanal aktualisiert';

  @override
  String get auditLogActionChannelDelete => 'Kanal gelöscht';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Kanal-Berechtigung hinzugefügt';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Kanal-Berechtigung aktualisiert';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Kanal-Berechtigung entfernt';

  @override
  String get auditLogActionMemberKick => 'Mitglied entfernt';

  @override
  String get auditLogActionMemberPrune => 'Mitglieder bereinigt';

  @override
  String get auditLogActionMemberBanAdd => 'Mitglied gebannt';

  @override
  String get auditLogActionMemberBanRemove => 'Mitglied entperrt';

  @override
  String get auditLogActionMemberUpdate => 'Mitglied aktualisiert';

  @override
  String get auditLogActionMemberRoleUpdate => 'Mitgliederrollen aktualisiert';

  @override
  String get auditLogActionMemberMove => 'Mitglied verschoben';

  @override
  String get auditLogActionMemberDisconnect => 'Mitglied getrennt';

  @override
  String get auditLogActionBotAdd => 'Bot hinzugefügt';

  @override
  String get auditLogActionRoleCreate => 'Rolle erstellt';

  @override
  String get auditLogActionRoleUpdate => 'Rolle aktualisiert';

  @override
  String get auditLogActionRoleDelete => 'Rolle gelöscht';

  @override
  String get auditLogActionInviteCreate => 'Einladung erstellt';

  @override
  String get auditLogActionInviteUpdate => 'Einladung aktualisiert';

  @override
  String get auditLogActionInviteDelete => 'Einladung gelöscht';

  @override
  String get auditLogActionWebhookCreate => 'Webhook erstellt';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook aktualisiert';

  @override
  String get auditLogActionWebhookDelete => 'Webhook gelöscht';

  @override
  String get auditLogActionEmojiCreate => 'Emoji erstellt';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji aktualisiert';

  @override
  String get auditLogActionEmojiDelete => 'Emoji gelöscht';

  @override
  String get auditLogActionStickerCreate => 'Sticker erstellt';

  @override
  String get auditLogActionStickerUpdate => 'Sticker aktualisiert';

  @override
  String get auditLogActionStickerDelete => 'Sticker gelöscht';

  @override
  String get auditLogActionMessageDelete => 'Nachricht gelöscht';

  @override
  String get auditLogActionMessageBulkDelete => 'Nachrichten gelöscht';

  @override
  String get auditLogActionMessagePin => 'Nachricht angepinnt';

  @override
  String get auditLogActionMessageUnpin => 'Nachricht abgepinnt';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor hat die Community-Einstellungen aktualisiert.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor hat den Kanal $target erstellt.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor hat den Kanal $target aktualisiert.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor hat den Kanal $target gelöscht.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor hat Kanalberechtigungen für $target hinzugefügt.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor hat Kanalberechtigungen für $target in $channel hinzugefügt.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor hat Kanalberechtigungen für $target aktualisiert.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor hat Kanalberechtigungen für $target in $channel aktualisiert.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor hat die Berechtigungen für den Kanal für $target entfernt.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor hat die Berechtigungen für den Kanal für $target in $channel entfernt.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor hat $target gekickt.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor hat $target gebannt.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor hat $target entbannt.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor hat $target aktualisiert.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor hat die Rollen für $target aktualisiert.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor hat inaktive Mitglieder bereinigt.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor hat Mitglieder bereinigt, die $days Tage inaktiv waren.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor hat $target in einen anderen Sprachkanal verschoben.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor hat $target nach $channel verschoben.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor hat $target vom Sprachkanal getrennt.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor hat den Bot $target hinzugefügt.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor hat die Rolle $target erstellt.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor hat die Rolle $target aktualisiert.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor hat die Rolle $target gelöscht.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor hat die Einladung $target erstellt.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor hat die Einladung $target für $channel erstellt.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor hat die Einladung $target aktualisiert.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor hat die Einladung $target für $channel aktualisiert.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor hat die Einladung $target gelöscht.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor hat die Einladung $target für $channel gelöscht.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor hat den Webhook $target erstellt.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor hat den Webhook $target aktualisiert.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor hat den Webhook $target gelöscht.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor hat das Emoji $target hinzugefügt.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor hat das Emoji $target aktualisiert.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor hat das Emoji $target gelöscht.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor hat den Sticker $target hinzugefügt.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor hat den Sticker $target aktualisiert.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor hat den Sticker $target gelöscht.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor hat eine Nachricht gelöscht.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor hat eine Nachricht in $channel gelöscht.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor hat mehrere Nachrichten gelöscht.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor hat $count Nachrichten gelöscht.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor hat mehrere Nachrichten in $channel gelöscht.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor hat $count Nachrichten in $channel gelöscht.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor hat eine Nachricht angepinnt.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor hat eine Nachricht in $channel angepinnt.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor hat eine Nachricht entpinnt.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor hat eine Nachricht in $channel entpinnt.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor hat eine Audit-Aktion für $target durchgeführt.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return '$field von $oldValue auf $newValue aktualisiert.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return '$field auf $newValue gesetzt.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return '$field gelöscht (war $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return '$field aktualisiert.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Die Community wurde in $name umbenannt.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Das Community-Icon wurde aktualisiert.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Der Kanal wurde in $name umbenannt.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Das Thema wurde gelöscht.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Das Thema wurde zu $topic geändert.';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'Erwachseneninhalte aktiviert.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Erwachseneninhalte deaktiviert.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Anzeigename auf $nickname gesetzt.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Anzeigename $nickname entfernt.';
  }

  @override
  String get auditLogChangeMutedMember => 'Mitglied stummgeschaltet.';

  @override
  String get auditLogChangeUnmutedMember => 'Mitglied entstummgeschaltet.';

  @override
  String get auditLogChangeDeafenedMember => 'Mitglied taubgeschaltet.';

  @override
  String get auditLogChangeUndeafenedMember => 'Mitglied enttaubgeschaltet.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return '$roles hinzugefügt.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return '$roles entfernt.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Kanal: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Nachricht: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Eingeladen von $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# Nachrichten gelöscht.',
      one: '1 Nachricht gelöscht.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# Mitglieder entfernt.',
      one: '1 Mitglied entfernt.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'Diese Einladung läuft nie ab.';

  @override
  String get auditLogOptionTemporaryMembership =>
      'Gewährt temporäre Mitgliedschaft.';

  @override
  String get auditLogOptionPermanentMembership =>
      'Gewährt permanente Mitgliedschaft.';

  @override
  String get guildSettingsLoadMore => 'Mehr laden';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Webhooks verwalten, die Nachrichten in Kanäle posten.';

  @override
  String get guildSettingsWebhooksEmpty => 'Keine Webhooks konfiguriert.';

  @override
  String get guildSettingsCopyUrl => 'URL kopieren';

  @override
  String get guildSettingsCopiedUrl => 'URL in die Zwischenablage kopiert';

  @override
  String get guildSettingsDeleteWebhook => 'Webhook löschen';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Lege einen benutzerdefinierten Einladungslink für deinen Server fest.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Speichern';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Nutzung';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count Nutzungen';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Bewirb dich für die Aufnahme in die Server-Discovery.';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Benötigt mindestens $count Mitglieder für die Bewerbung.';
  }

  @override
  String get guildSettingsDiscoveryFormTitle => 'Bewerbung';

  @override
  String get guildSettingsDiscoveryStatusTitle => 'Status';

  @override
  String get guildSettingsDiscoveryCategory => 'Kategorie';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Beschreibung';

  @override
  String get guildSettingsDiscoveryTags => 'Tags';

  @override
  String get guildSettingsDiscoveryTagsHint => 'Gaming, Kunst, Musik';

  @override
  String get guildSettingsDiscoveryApply => 'Bewerbung abschicken';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Zurückziehen';

  @override
  String get guildSettingsMembersDescription =>
      'Servermitglieder suchen und verwalten.';

  @override
  String get guildSettingsMembersSearchHint => 'Mitglieder suchen';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count Mitglieder';
  }

  @override
  String get guildSettingsInvitesTitle => 'Invites';

  @override
  String get guildSettingsInvitesDescription =>
      'Aktive Einladungslinks anzeigen und widerrufen.';

  @override
  String get guildSettingsInvitesEmpty => 'Keine Einladungslinks';

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
    return '$uses / $maxUses Nutzungen';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Läuft ab $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Gebannte Nutzer anzeigen und verwalten.';

  @override
  String get guildSettingsBansSearchHint => 'Sperren suchen';

  @override
  String get guildSettingsBansEmpty => 'Keine gebannten Nutzer.';

  @override
  String get guildSettingsBanPermanent => 'Dauerhaft sperren';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Läuft ab $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Läuft ab';

  @override
  String get guildSettingsUnban => 'Entsperren';

  @override
  String get guildSettingsBansLoading => 'Gebannte Nutzer werden geladen';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Keine Sperren gefunden, die deiner Suche entsprechen.';

  @override
  String get guildSettingsBanDetailsTitle => 'Sperrdetails';

  @override
  String get guildSettingsBanViewDetails => 'Details anzeigen';

  @override
  String get guildSettingsBannedOn => 'Gebannt am';

  @override
  String get guildSettingsBannedBy => 'Gebannt von';

  @override
  String get guildSettingsRevokeBanTitle => 'Sperre widerrufen';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Möchtest du die Sperre für $displayName wirklich widerrufen? Die Person kann der Community dann wieder beitreten.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Sperre für $displayName widerrufen';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Sperren konnten nicht geladen werden. Versuche es erneut.';

  @override
  String get guildSettingsRevokeBanError =>
      'Sperre konnte nicht widerrufen werden. Versuche es erneut.';

  @override
  String get guildSettingsCommunitySettings => 'Community-Einstellungen';

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
      'Verwalte das Profil, die Kanäle und die Standardeinstellungen deiner Community.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Branding';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Aktualisiere dein Icon, deinen Namen, dein Banner und den Einladungshintergrund';

  @override
  String get guildSettingsOverviewBannerUpload => 'Banner hochladen';

  @override
  String get guildSettingsOverviewIdleTitle => 'Leerlauf-Einstellungen';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'AFK-Kanal und Timeout konfigurieren';

  @override
  String get guildSettingsOverviewSystemTitle => 'System & Willkommen';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Ziel für System- und Willkommensnachrichten auswählen';

  @override
  String get guildSettingsOverviewNotificationsTitle =>
      'Standardbenachrichtigungen';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Communitys mit über 250 Personen werden auf die Einstellung „Nur Erwähnungen“ gesetzt. Deine ursprüngliche Einstellung bleibt erhalten und wird wiederhergestellt, wenn die Community unter 250 Mitglieder fällt.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Erweitert';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Flexible Textkanalnamen zulassen';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Community-Besitzerkrone ausblenden';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Abgelöster Banner';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Zeigt den Banner in einem eigenen Abschnitt unter dem Community-Header an.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Icon hochladen';

  @override
  String get guildSettingsOverviewRemoveImage => 'Entfernen';

  @override
  String get guildSettingsOverviewSplashTitle => 'Einladungs-Hintergrund';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'Chat-Embed-Hintergrund';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Wird in Einladungs-Embeds im Chat angezeigt.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Hintergrund hochladen';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'Kein Community-Banner';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'Kein Einladungs-Hintergrund';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Vorschau';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Sieh dir an, wie deine Einladung für Besucher aussieht.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle => 'Textkanalnamen';

  @override
  String get guildSettingsOverviewOwnerCrownTitle => 'Community-Besitzerkrone';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Lege fest, ob das Kronen-Icon neben dem Community-Besitzer angezeigt wird';

  @override
  String get guildSettingsSplashCardAlignment => 'Karten-Ausrichtung';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Mitte';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Links';

  @override
  String get guildSettingsSplashAlignmentRight => 'Rechts';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Gilt nur auf breiten Bildschirmen.';

  @override
  String get permissionReadMessageHistory => 'Nachrichtenverlauf lesen';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Ändere, was Benutzer ohne \"$permission\" sehen können';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Verwende ein separates Modal, um ein Datum für den Nachrichtenverlaufsschwellenwert für Mitglieder festzulegen, die nicht über die Berechtigung \"$permission\" verfügen.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Nachrichtenverlaufsschwellenwert öffnen';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Nachrichtenverlaufsschwellenwert';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Nachrichtenverlaufsschwellenwert aktivieren';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Schwellenwert-Datum';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Mitglieder ohne Nachrichtenverlauf lesen können Nachrichten anzeigen, die nach diesem Datum gesendet wurden.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Nachrichtenverlaufsschwellenwert aktualisiert';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Erlaube Großbuchstaben und Leerzeichen in Textkanalnamen. Deaktiviert beschränkt die Namen auf Kleinbuchstaben mit Bindestrichen und Unterstrichen.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Blendet das Kronen-Icon neben dem Community-Besitzer auf allen Oberflächen aus.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Animierte Icons erfordern die Community-Funktion \"Animiertes Icon\".';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Animierte Banner erfordern die Community-Funktion \"Animierter Banner\".';

  @override
  String get guildSettingsAfkChannel => 'AFK / Inaktiv-Kanal';

  @override
  String get guildSettingsAfkChannelHint =>
      'Verschiebe Mitglieder in diesen Kanal, wenn sie AFK sind.';

  @override
  String get guildSettingsNoAfkChannel => 'Kein AFK-Kanal';

  @override
  String get guildSettingsAfkTimeout => 'AFK-Timeout';

  @override
  String get guildSettingsAfkTimeout1Min => '1 Minute';

  @override
  String get guildSettingsAfkTimeout5Min => '5 Minuten';

  @override
  String get guildSettingsAfkTimeout15Min => '15 Minuten';

  @override
  String get guildSettingsAfkTimeout30Min => '30 Minuten';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 Stunde';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds Sekunden';
  }

  @override
  String get guildSettingsSystemChannel => 'Zielkanal';

  @override
  String get guildSettingsSystemChannelHint =>
      'Willkommens- und Systemnachrichten werden hier angezeigt.';

  @override
  String get guildSettingsNoSystemChannel => 'Kein Systemkanal';

  @override
  String get guildSettingsHideJoinMessages => 'Beitrittsnachrichten ausblenden';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Unterdrückt Beitrittsnachrichten im Zielkanal.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Standard-Benachrichtigungseinstellungen';

  @override
  String get guildSettingsNotificationsAll => 'Alle Nachrichten';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Benachrichtige bei allen Nachrichten';

  @override
  String get guildSettingsNotificationsMentions => 'Nur Erwähnungen';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Benachrichtige nur bei Erwähnungen';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max. 10 MB. Minimum: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max. 10 MB. Minimum: 960×540px (16:9). Wird in Einladungs-Embeds im Chat angezeigt.';

  @override
  String get guildSettingsModerationDescription =>
      'Konfiguriere Verifizierungs-, Inhaltsfilter- und Jugendschutzeinstellungen.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'In der Suche gelistete Communitys haben eingeschränkte Moderationsoptionen.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Inhaltsfilterung';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Filtert Nachrichten automatisch auf explizite Inhalte in Kanälen, die nicht als jugendgefährdend gekennzeichnet sind.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'In der Suche gelistete Communitys müssen alle Mitglieder scannen. Diese Einstellung kann nicht geändert werden, solange die Suche aktiviert ist.';

  @override
  String get guildSettingsContentFilterOff => 'Aus';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Überlasse die Moderation der Community selbst';

  @override
  String get guildSettingsContentFilterNoRole =>
      'Mitglieder ohne Rollen filtern';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Empfohlen für die meisten Communitys';

  @override
  String get guildSettingsContentFilterAll => 'Alle filtern';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Maximaler Schutz für familienfreundliche Bereiche';

  @override
  String get guildSettingsModerationMatureOff => 'Aus';

  @override
  String get guildSettingsModerationMatureOn => 'An';

  @override
  String get guildSettingsContentWarningToggle => 'Inhaltswarnung anzeigen';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Schaltet eine Zustimmungsaufforderung vor dem Betreten eines Kanals um.';

  @override
  String get guildSettingsContentWarningText => 'Benutzerdefinierter Warntext';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Dies enthält sensible Inhalte.';

  @override
  String get guildSettingsModeration2faTitle => '2FA-Anforderung';

  @override
  String get guildSettingsModeration2faDescription =>
      'Fordere Zwei-Faktor-Authentifizierung für Moderatoren an, bevor sie verbannen, kicken, stumm schalten oder Nachrichten entfernen können.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      '2FA für Moderationsaktionen erforderlich';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Nur der Community-Besitzer kann diese Einstellung ändern';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Aktiviere 2FA für deinen Account, um diese Einstellung zu ändern';

  @override
  String get guildSettingsEmojiSearchHint => 'Emojis suchen';

  @override
  String get guildSettingsEmojiUploadTitle => 'Emoji hochladen';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Nicht animierte Emojis ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Animierte Emojis ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Sticker suchen';

  @override
  String get guildSettingsWebhooksInfo =>
      'Erstelle Webhooks in den Kanaleinstellungen. Bearbeite sie hier.';

  @override
  String get guildSettingsVanityUrlWarning =>
      'Deine Vanity-URL funktioniert nicht, es sei denn, mindestens ein Kanal ist für alle sichtbar.';

  @override
  String get guildSettingsVanityUrlRemove => 'Entfernen';

  @override
  String get guildSettingsBannedUsersTitle => 'Gebannte Nutzer';

  @override
  String get guildSettingsInvitesTableInviter => 'Einlader';

  @override
  String get guildSettingsInvitesTableChannel => 'Kanal';

  @override
  String get guildSettingsInvitesTableCode => 'Code';

  @override
  String get guildSettingsInvitesTableUses => 'Verwendungen';

  @override
  String get guildSettingsInvitesTableCreated => 'Erstellt';

  @override
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsMembersSortNewest => 'Neueste zuerst';

  @override
  String get guildSettingsAuditLogFilterUser => 'Nach Benutzer filtern';

  @override
  String get guildSettingsAuditLogFilterAction => 'Nach Aktion filtern';

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

/// The translations for German, as used in Switzerland (`de_CH`).
class FluxerLocalizationsDeCh extends FluxerLocalizationsDe {
  FluxerLocalizationsDeCh() : super('de_CH');

  @override
  String get reconnectingTitle => 'Mir isch es verglumpt!';

  @override
  String get reconnectingBody =>
      'Mit de Server stimmt öppis nöd.\nSött bald wieder laufe!';

  @override
  String get gatewayReconnectingToast => 'Verbinde…';

  @override
  String get gatewayConnectedToast => 'Verbunde';

  @override
  String splashStartupFailed(String error) {
    return 'Start fehlgeschlage: $error';
  }

  @override
  String get retry => 'Noh versuäche';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Verbindung verlore';

  @override
  String get splashViewOnStatusPage => 'Uf de Status-Siite aaluege';

  @override
  String get splashConnectionIssuesPrompt => 'Verbindungsproblem?';

  @override
  String get splashStatusPageLink => 'Status-Siite';

  @override
  String get splashReadIncident => 'Vorfall aaluege';

  @override
  String get splashIncidentHistory => 'Vorfall-Historie';

  @override
  String get welcomeBack => 'Willkomme zrugg';

  @override
  String get email => 'E-Mail';

  @override
  String get emailInvalid => 'Bitte gib e gültigi E-Mail-Adress ii.';

  @override
  String get password => 'Passwort';

  @override
  String get forgotPassword => 'Passwort vergässe?';

  @override
  String get logIn => 'Aamälde';

  @override
  String get logInWithPasskey => 'Aamälde mit Passkey';

  @override
  String continueWithSso(String provider) {
    return 'Witer mit $provider';
  }

  @override
  String get ssoRequired => 'Zum Zugriff uf die Instanz isch SSO erforderlich.';

  @override
  String get organizationSsoProvider =>
      'Melde dich mit de Single-Sign-On-Lösig vo dimere Organisation a.';

  @override
  String get failedToStartSso => 'SSO konnt nöd starte';

  @override
  String get ssoCancelled => 'SSO-Aamäldig isch abbroche worde';

  @override
  String preferSso(String provider) {
    return 'Lieber SSO bruuche? Witer mit $provider.';
  }

  @override
  String get logInViaBrowser => 'Aamälde per Browser';

  @override
  String get needAccountPrompt => 'Kei Account? ';

  @override
  String get register => 'Registriere';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Bestätige, dass du ke Roboter bisch';

  @override
  String get captchaDescription =>
      'Mir müend sicher si, dass du ke Bot bisch. Bitte schliesse die Bestätigung ab.';

  @override
  String get captchaSwitchToHcaptcha => 'Problem? Versuechs mit hCaptcha';

  @override
  String get captchaSwitchToTurnstile => 'Versuechs mit Turnstile';

  @override
  String get cancel => 'Abbreche';

  @override
  String get ipAuthCheckEmail => 'Lueg i dim E-Mail-Postfach';

  @override
  String ipAuthDescription(String email) {
    return 'Mir händ dir e Link per E-Mail gschickt zum Aamälde z\'autorisiere. Bitte öffne din Inbox für $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Verbindung verlore';

  @override
  String get ipAuthConnectionLostDescription =>
      'Mir händ d\'Verbindung verlore, währed mir uf d\'Autorisation gwartet händ. Bitte versuechs noh.';

  @override
  String get ipAuthLinkExpired => 'Aamäldig-Link abgloufe';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Dii Autorisations-Link isch abgloufe. Bitte melde dich noh a.';

  @override
  String get ipAuthResendEmail => 'E-Mail nohschicke';

  @override
  String get ipAuthResent => 'Nohg\'schickt';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Zurück';

  @override
  String get mfaTitle => 'Zweifaktor-Authentifizierig';

  @override
  String get mfaChooseMethod => 'Wähle e Bestätigungs-Methode';

  @override
  String get mfaMethodTotp => 'Authenticator App';

  @override
  String get mfaMethodWebauthn => 'Sicherheits-Schlüssel / Passkey';

  @override
  String get mfaTotpDescription =>
      'Gib de 6-stellige Code vo dimere Authenticator-App oder ein vo dine Backup-Codes ii.';

  @override
  String get mfaCodeLabel => 'Code';

  @override
  String get mfaTryAnotherMethod => 'Anderi Methode versuäche';

  @override
  String get mfaUseSecurityKey =>
      'Sicherheitsschlüssel / Passkey stattdessen versuchen';

  @override
  String get accountSelectorTitle => 'Konto auswählen';

  @override
  String get accountSelectorDescription =>
      'Wähle ein Konto aus, um fortzufahren, oder füge ein anderes hinzu.';

  @override
  String get accountAdd => 'Konto hinzufügen';

  @override
  String get accountRemove => 'Entfernen';

  @override
  String accountRemoveTitle(String username) {
    return '$username entfernen';
  }

  @override
  String get accountRemoveDescription =>
      'Dies entfernt die gespeicherte Sitzung für dieses Konto.';

  @override
  String get accountRemoveOnlyDescription =>
      'Dies entfernt das einzige gespeicherte Konto auf diesem Gerät.';

  @override
  String get accountExpired => 'Abgelaufen';

  @override
  String accountSessionExpired(String identifier) {
    return 'Sitzung für $identifier abgelaufen. Bitte melde dich erneut an.';
  }

  @override
  String get accountManageTitle => 'Konten verwalten';

  @override
  String get accountSwitchFailed =>
      'Konnte Konten nicht wechseln. Versuche es erneut.';

  @override
  String get profileTabMenuSwitchAccounts => 'Konten wechseln';

  @override
  String get statusChangeSheetTitle => 'Status festlegen';

  @override
  String get statusOnlineStatusSection => 'Online-Status';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusIdle => 'Abwesend';

  @override
  String get statusDnd => 'Nicht stören';

  @override
  String get statusInvisible => 'Unsichtbar';

  @override
  String get statusOffline => 'Offline';

  @override
  String get statusUntilIChangeIt => 'Bis ich es ändere';

  @override
  String get statusDontClear => 'Nicht löschen';

  @override
  String get statusFor10Seconds => 'Für 10 Sekunden';

  @override
  String get statusClearAfter10Seconds => '10 Sekunden';

  @override
  String get statusClearAfter15Minutes => '15 Minuten';

  @override
  String get statusClearAfter30Minutes => '30 Minuten';

  @override
  String get statusClearAfter1Hour => '1 Stunde';

  @override
  String get statusClearAfter3Hours => '3 Stunden';

  @override
  String get statusClearAfter4Hours => '4 Stunden';

  @override
  String get statusClearAfter8Hours => '8 Stunden';

  @override
  String get statusClearAfter24Hours => '24 Stunden';

  @override
  String get statusClearAfter3Days => '3 Tage';

  @override
  String get statusDndDescription =>
      'Du erhältst keine Benachrichtigungen auf dem Desktop';

  @override
  String get statusInvisibleDescription => 'Du erscheinst als offline';

  @override
  String get customStatusSetTitle => 'Benutzerdefinierten Status festlegen';

  @override
  String get customStatusCurrentHint => 'Benutzerdefinierter Status';

  @override
  String get customStatusClear => 'Benutzerdefinierten Status löschen';

  @override
  String get customStatusPlaceholder => 'Was passiert gerade?';

  @override
  String get customStatusChooseEmoji => 'Emoji auswählen';

  @override
  String get customStatusClearAfter => 'Löschen nach';

  @override
  String get customStatusSave => 'Speichern';

  @override
  String get accountActive => 'Aktives Konto';

  @override
  String get signOut => 'Abmelden';

  @override
  String get suspendedPermanentTitle => 'Konto dauerhaft gesperrt';

  @override
  String get suspendedTemporaryTitle => 'Konto gesperrt';

  @override
  String get suspendedPermanentDescription =>
      'Dein Konto wurde dauerhaft wegen Verstosses gegen unsere Nutzungsbedingungen gesperrt.';

  @override
  String get suspendedTemporaryDescription =>
      'Dein Konto wurde vorübergehend gesperrt. Du kannst auf dein Konto zugreifen, sobald die Sperrfrist abgelaufen ist.';

  @override
  String get suspendedIssuedAt => 'Ausgestellt';

  @override
  String get suspendedEndsAt => 'Endet';

  @override
  String get suspendedDuration => 'Dauer';

  @override
  String get suspendedPermanent => 'Permanent';

  @override
  String get suspendedReason => 'Grund';

  @override
  String get suspendedAppealDeadline => 'Einreichungsfrist';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Dein Konto wird am $date zur Löschung vorgemerkt.';
  }

  @override
  String get suspendedRecheck => 'Aktualisierungen prüfen';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'In ${seconds}s erneut prüfen';
  }

  @override
  String get suspendedBackToLogin => 'Zurück zum Login';

  @override
  String get suspendedAppealTitle => 'Einspruch';

  @override
  String get suspendedAppealHint =>
      'Erkläre, warum deine Sperrung überdacht werden sollte (mindestens 50 Zeichen)...';

  @override
  String get suspendedAppealSubmit => 'Einspruch einreichen';

  @override
  String get suspendedAppealPending => 'Wird geprüft';

  @override
  String get suspendedAppealAccepted => 'Einspruch akzeptiert';

  @override
  String get suspendedAppealRejected => 'Einspruch abgelehnt';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Dein Einspruch wurde akzeptiert und dein Konto wurde wiederhergestellt.';

  @override
  String get suspendedSignIn => 'Melde dich bei deinem Konto an';

  @override
  String get forgotPasswordTitle => 'Passwort vergessen?';

  @override
  String get forgotPasswordDescription =>
      'Gib deine E-Mail-Adresse ein und wir senden dir einen Link zum Zurücksetzen deines Passworts.';

  @override
  String get forgotPasswordSubmit => 'Link zum Zurücksetzen senden';

  @override
  String get forgotPasswordSentTitle => 'Prüfe deine E-Mails';

  @override
  String get forgotPasswordSentDescription =>
      'Wir haben Anweisungen zum Zurücksetzen deines Passworts an deine E-Mail-Adresse gesendet. Bitte überprüfe deinen Posteingang und folge dem Link, um dein Passwort zurückzusetzen.';

  @override
  String get forgotPasswordBackToLogin => 'Zurück zum Login';

  @override
  String get resetPasswordTitle => 'Neues Passwort festlegen';

  @override
  String get resetPasswordDescription =>
      'Gib unten dein neues Passwort ein, um den Zurücksetzungsprozess abzuschliessen.';

  @override
  String get resetPasswordNewPassword => 'Neues Passwort';

  @override
  String get resetPasswordConfirm => 'Neues Passwort bestätigen';

  @override
  String get resetPasswordSubmit => 'Passwort zurücksetzen';

  @override
  String get resetPasswordMismatch => 'Passwörter stimmen nicht überein.';

  @override
  String get registerTitle => 'Konto erstellen';

  @override
  String get registerDisplayName => 'Anzeigename (Optional)';

  @override
  String get registerDisplayNameHint => 'Wie sollen dich die Leute nennen?';

  @override
  String get registerUsername => 'Benutzername (Optional)';

  @override
  String get registerUsernameHint =>
      'Leer lassen für einen zufälligen Benutzernamen';

  @override
  String get registerUsernameTagHint =>
      'Ein 4-stelliger Tag wird automatisch hinzugefügt, um die Einzigartigkeit zu gewährleisten';

  @override
  String get registerDateOfBirth => 'Geburtsdatum';

  @override
  String get registerMonth => 'Monat';

  @override
  String get registerDay => 'Tag';

  @override
  String get registerYear => 'Jahr';

  @override
  String get registerConsent =>
      'Ich stimme den Nutzungsbedingungen und der Datenschutzerklärung zu';

  @override
  String get registerConsentPrefix => 'Ich stimme den ';

  @override
  String get registerConsentTerms => 'Nutzungsbedingungen';

  @override
  String get registerConsentAnd => ' und ';

  @override
  String get registerConsentPrivacy => 'Datenschutzerklärung';

  @override
  String get registerConfirmPassword => 'Passwort bestätigen';

  @override
  String get registerSubmit => 'Konto erstellen';

  @override
  String get registerHaveAccount => 'Haben Sie bereits ein Konto? ';

  @override
  String get passkeyNoCredentials =>
      'Keine Passkeys für diese App gefunden. Melden Sie sich stattdessen mit E-Mail und Passwort an.';

  @override
  String get passkeyDeviceNotSupported =>
      'Passkeys werden auf diesem Gerät nicht unterstützt.';

  @override
  String get passkeyDomainNotAssociated =>
      'Passkeys sind für diese App nicht konfiguriert. Melden Sie sich stattdessen mit E-Mail und Passwort an.';

  @override
  String get passkeyTimeout =>
      'Passkey-Authentifizierung Zeitüberschreitung. Bitte versuchen Sie es erneut.';

  @override
  String get passkeyNotAvailable =>
      'Passkeys sind für diese App nicht verfügbar. Melden Sie sich stattdessen mit E-Mail und Passwort an.';

  @override
  String get passkeyFailed =>
      'Passkey-Authentifizierung fehlgeschlagen. Bitte versuche es erneut.';

  @override
  String get errorUnableToCreateAccount =>
      'Konto konnte nicht erstellt werden. Bitte versuche es erneut.';

  @override
  String get errorUnableToSignIn =>
      'Anmeldung derzeit nicht möglich. Bitte versuche es erneut.';

  @override
  String get errorInvalidEmailOrPassword =>
      'Ungültige E-Mail-Adresse oder Passwort.';

  @override
  String get errorUnableToSendResetLink =>
      'Zurücksetzungslink konnte nicht gesendet werden. Bitte versuche es erneut.';

  @override
  String get errorUnableToResetPassword =>
      'Passwort konnte nicht zurückgesetzt werden. Bitte versuche es erneut.';

  @override
  String get embedInviteJoin => 'Community beitreten';

  @override
  String get embedInviteGoTo => 'Zur Community';

  @override
  String embedInviteOnline(String count) {
    return '$count Online';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count Mitglieder';
  }

  @override
  String get embedInviteUnknownTitle => 'Unbekanntes Invite';

  @override
  String get embedInviteUnknownSubtitle =>
      'Versuche, ein neues Invite anzufordern.';

  @override
  String get embedInviteUnavailable => 'Invite nicht verfügbar';

  @override
  String get inviteAcceptTitle => 'Du wurdest eingeladen, beizutreten';

  @override
  String get inviteAcceptJoinButton => 'Community beitreten';

  @override
  String get inviteAcceptGoToButton => 'Zur Community';

  @override
  String get inviteAcceptInvitesPaused => 'Invites pausiert';

  @override
  String get inviteAcceptNotFoundTitle => 'Invite ungültig';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Dieses Invite ist möglicherweise abgelaufen oder ungültig.';

  @override
  String get inviteAcceptJoinGroupButton => 'Gruppe beitreten';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Du wurdest von $inviterName eingeladen, einer Gruppen-DM beizutreten';
  }

  @override
  String get inviteAcceptSomeone => 'jemand';

  @override
  String get inviteAcceptEmojiPack => 'Emoji-Paket';

  @override
  String get inviteAcceptStickerPack => 'Sticker-Paket';

  @override
  String get inviteAcceptInstallEmojiPack => 'Emoji-Paket installieren';

  @override
  String get inviteAcceptInstallStickerPack => 'Sticker-Paket installieren';

  @override
  String get inviteAcceptPackInstallNote =>
      'Wenn du dieses Invite annimmst, wird das Paket automatisch installiert.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Kanalzugriff verweigert';

  @override
  String get channelAccessDeniedDescription =>
      'Du hast keinen Zugriff auf den Kanal, in dem diese Nachricht gesendet wurde.';

  @override
  String get messageJumpLinkNoAccess => 'Kein Zugriff';

  @override
  String get okay => 'Okay';

  @override
  String get embedThemeTitle => 'Geteiltes Theme';

  @override
  String get embedThemeSubtitle =>
      'Dieser Client unterstützt keine benutzerdefinierten Themes.';

  @override
  String get embedThemeUnavailableButton => 'Themes nicht verfügbar';

  @override
  String get privacySettings => 'Datenschutzeinstellungen';

  @override
  String get privacyDirectMessages => 'Direktnachrichten';

  @override
  String get privacyDirectMessagesDescription =>
      'Direktnachrichten von anderen Mitgliedern dieser Community zulassen';

  @override
  String get privacyBotDirectMessages => 'Bot-Direktnachrichten';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Bots aus dieser Community dürfen dir Direktnachrichten senden';

  @override
  String get privacyMutualDmsDisabled =>
      'Die Community-Admins haben das Empfangen von Direktnachrichten nur von gemeinsamen Mitgliedern in dieser Community deaktiviert.';

  @override
  String get communityDebug => 'Community-Debug';

  @override
  String get copiedToClipboard => 'In die Zwischenablage kopiert';

  @override
  String get notificationSettings => 'Benachrichtigungseinstellungen';

  @override
  String notificationMuteGuild(String guildName) {
    return '$guildName stummschalten';
  }

  @override
  String get notificationMuteDescription =>
      'Das Stummschalten einer Community verhindert, dass ungelesene Indikatoren und Benachrichtigungen angezeigt werden, es sei denn, du wirst erwähnt.';

  @override
  String get notificationCommunitySettings =>
      'Community-Benachrichtigungseinstellungen';

  @override
  String get notificationAllMessages => 'Alle Nachrichten';

  @override
  String get notificationOnlyMentions => 'Nur Erwähnungen';

  @override
  String get notificationNothing => 'Nichts';

  @override
  String get notificationSuppressEveryone => '@everyone und @here unterdrücken';

  @override
  String get notificationSuppressRoles =>
      'Alle @Erwähnungen von Rollen unterdrücken';

  @override
  String get notificationMobilePush => 'Mobile Push-Benachrichtigungen';

  @override
  String get notificationOverrides => 'Benachrichtigungs-Overrides';

  @override
  String get notificationSelectChannel => 'Kanal oder Kategorie auswählen';

  @override
  String get notificationOnlyAtMentions => 'Nur @Erwähnungen';

  @override
  String get notificationMuteChannel => 'Kanal stummschalten';

  @override
  String get notificationUnmuteChannel => 'Kanal stummschalten aufheben';

  @override
  String get notificationNoCategory => 'Keine Kategorie';

  @override
  String get dmMarkAsRead => 'Als gelesen markieren';

  @override
  String get dmMuteConversation => 'DM stummschalten';

  @override
  String get dmUnmuteConversation => 'DM-Stummschaltung aufheben';

  @override
  String get dmPinDm => 'DM anheften';

  @override
  String get dmUnpinDm => 'DM lösen';

  @override
  String get dmAlwaysShowInSidebar => 'Immer in der Seitenleiste anzeigen';

  @override
  String get dmRemoveFromAlwaysShown => 'Aus \"Immer anzeigen\" entfernen';

  @override
  String get dmCloseDm => 'DM schliessen';

  @override
  String get dmCloseDmConfirmTitle => 'DM schliessen';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Möchtest du deinen DM mit $username wirklich schliessen? Du kannst ihn später jederzeit wieder öffnen.';
  }

  @override
  String get dmCopyChannelId => 'Kanal-ID kopieren';

  @override
  String get dmChannelIdCopied => 'Kanal-ID kopiert';

  @override
  String get dmCopyUserId => 'Benutzer-ID kopieren';

  @override
  String get dmUserIdCopied => 'Benutzer-ID kopiert';

  @override
  String get dmViewProfile => 'Profil anzeigen';

  @override
  String get dmVoiceCall => 'Sprachanruf starten';

  @override
  String get incomingVoiceCallTitle => 'Eingehender Sprachanruf';

  @override
  String get incomingVoiceCallAccept => 'Annehmen';

  @override
  String get incomingVoiceCallDecline => 'Ablehnen';

  @override
  String get incomingVoiceCallLabel => 'Eingehender Anruf';

  @override
  String get incomingVoiceCallIgnore => 'Ignorieren';

  @override
  String get directVoiceCallNotEligible =>
      'Dieser Anruf kann gerade nicht gestartet werden. Versuche es später erneut.';

  @override
  String get voiceJoinCallFailed =>
      'Verbindung zu diesem Anruf konnte nicht hergestellt werden. Überprüfe deine Verbindung und versuche es erneut.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Anruf konnte nicht beigetreten werden. Überprüfe deine Verbindung und versuche es erneut.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Anruf konnte auf dem Server nicht aktualisiert werden. Überprüfe deine Verbindung und versuche es erneut.';

  @override
  String get dmAddNote => 'Notiz hinzufügen';

  @override
  String get dmEditGroup => 'Gruppe bearbeiten';

  @override
  String get dmInviteToCommunity => 'Zur Community einladen';

  @override
  String get dmBlock => 'Blockieren';

  @override
  String get dmLeaveGroup => 'Gruppe verlassen';

  @override
  String get dmNoCommunitiesAvailable => 'Keine Communities verfügbar';

  @override
  String dmGroupMemberCount(int count) {
    return '$count Mitglieder';
  }

  @override
  String get dmMuteFor15Min => 'Für 15 Minuten';

  @override
  String get dmMuteFor30Min => 'Für 30 Minuten';

  @override
  String get dmMuteFor1Hour => 'Für 1 Stunde';

  @override
  String get dmMuteFor3Hours => 'Für 3 Stunden';

  @override
  String get dmMuteFor4Hours => 'Für 4 Stunden';

  @override
  String get dmMuteFor8Hours => 'Für 8 Stunden';

  @override
  String get dmMuteFor24Hours => 'Für 24 Stunden';

  @override
  String get dmMuteFor3Days => 'Für 3 Tage';

  @override
  String get dmMuteForever => 'Bis ich es wieder aktiviere';

  @override
  String get dmPinGroupDm => 'Gruppen-DM anheften';

  @override
  String get dmUnpinGroupDm => 'Gruppen-DM ausblenden';

  @override
  String get dmFavoriteDm => 'DM favorisieren';

  @override
  String get dmUnfavoriteDm => 'DM entfavorisieren';

  @override
  String get dmFavoriteGroupDm => 'Gruppen-DM favorisieren';

  @override
  String get dmUnfavoriteGroupDm => 'Gruppen-DM entfavorisieren';

  @override
  String get dmChangeFriendNickname => 'Freundes-Spitznamen ändern';

  @override
  String get dmRemoveFriend => 'Freund entfernen';

  @override
  String get dmAddFriend => 'Freund hinzufügen';

  @override
  String get dmAcceptFriendRequest => 'Freundschaftsanfrage annehmen';

  @override
  String get dmIgnoreFriendRequest => 'Freundschaftsanfrage ignorieren';

  @override
  String get dmFriendRequestSent => 'Freundschaftsanfrage gesendet';

  @override
  String get dmUnblock => 'Blockieren aufheben';

  @override
  String get dmDebugUser => 'Benutzer debuggen';

  @override
  String get dmDebugChannel => 'Kanal debuggen';

  @override
  String get dmPinned => 'DM angeheftet';

  @override
  String get dmUnpinned => 'DM ausgeheftet';

  @override
  String get dmMuted => 'DM stummgeschaltet';

  @override
  String get dmUnmuted => 'DM entstummgeschaltet';

  @override
  String get dmRemoveFriendConfirmTitle => 'Freund entfernen';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Möchtest du $username wirklich als Freund entfernen?';
  }

  @override
  String get dmBlockConfirmTitle => 'Benutzer blockieren';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Möchtest du $username wirklich blockieren? Er/Sie kann dir dann keine Nachrichten oder Freundschaftsanfragen mehr senden.';
  }

  @override
  String get dmFriendRequestSentToast => 'Freundschaftsanfrage gesendet';

  @override
  String get dmFriendRequestFailed =>
      'Freundschaftsanfrage konnte nicht gesendet werden';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Freundschaftsanfrage konnte nicht angenommen werden';

  @override
  String get dmRemoveFriendFailed => 'Freund konnte nicht entfernt werden';

  @override
  String get dmBlockFailed => 'Benutzer konnte nicht blockiert werden';

  @override
  String get dmUnblockFailed => 'Blockierung konnte nicht aufgehoben werden';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Freundschaftsanfrage konnte nicht ignoriert werden';

  @override
  String get dmAddFriends => 'Freunde hinzufügen';

  @override
  String get addFriendSheetTitle => 'Freund hinzufügen';

  @override
  String get addFriendUsernameHint => 'Benutzername#0000';

  @override
  String get addFriendUsernameLabel => 'Benutzername des Freundes';

  @override
  String get addFriendSendRequest => 'Anfrage senden';

  @override
  String get addFriendNoUserFound =>
      'Kein Benutzer mit diesem Benutzernamen gefunden.';

  @override
  String get addFriendInvalidUsername =>
      'Gib einen gültigen Benutzernamen ein (Benutzername#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Freundschaftsanfrage gesendet';

  @override
  String get addFriendClaimTitle => 'Konto beanspruchen';

  @override
  String get addFriendClaimDescription =>
      'Beanspruche dein Konto, um Freundschaftsanfragen zu senden.';

  @override
  String get addFriendVerifyTitle => 'E-Mail verifizieren';

  @override
  String get addFriendVerifyDescription =>
      'Du musst deine E-Mail-Adresse verifizieren, bevor du Freundschaftsanfragen senden kannst.';

  @override
  String get addFriendVerifyEmail => 'E-Mail verifizieren';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Eingehende Freundschaftsanfragen ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Ausgehende Freundschaftsanfragen ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Eingehende Freundschaftsanfrage';

  @override
  String get addFriendOutgoingStatus => 'Freundschaftsanfrage gesendet';

  @override
  String get addFriendViewProfile => 'Profil anzeigen';

  @override
  String get addFriendAccept => 'Annehmen';

  @override
  String get addFriendIgnore => 'Ignorieren';

  @override
  String get addFriendAcceptTitle => 'Freundschaftsanfrage annehmen';

  @override
  String get addFriendIgnoreTitle => 'Freundschaftsanfrage ignorieren';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Freundschaftsanfrage von $userName annehmen?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Freundschaftsanfrage von $displayName ignorieren?';
  }

  @override
  String get addFriendCancelRequest => 'Anfrage abbrechen';

  @override
  String get addFriendCancelRequestFailed =>
      'Freundschaftsanfrage konnte nicht abgebrochen werden. Versuche es erneut.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Diese Person nimmt gerade keine Freundschaftsanfragen an.';

  @override
  String get addFriendUnblockFirst =>
      'Entblockiere diese Person zuerst, um eine Freundschaftsanfrage zu senden.';

  @override
  String get addFriendCannotSendToSelf =>
      'Du kannst dir selbst keine Freundschaftsanfrage senden.';

  @override
  String get addFriendAlreadyFriends => 'Ihr seid bereits Freunde.';

  @override
  String get addFriendClaimToSend =>
      'Schliesse die Anmeldung ab, um Freundschaftsanfragen zu senden.';

  @override
  String get addFriendSendFailedGeneric =>
      'Freundschaftsanfrage konnte nicht gesendet werden. Versuche es erneut.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'System';

  @override
  String get emojiSearchPlaceholder => 'Finde das Emoji deiner Träume';

  @override
  String get emojiSearchEmpty => 'Keine Emojis entsprechen deiner Suche';

  @override
  String get emojiAutocompleteDefaultLabel => 'Standard-Emoji';

  @override
  String get emojiFrequentlyUsed => 'Häufig verwendet';

  @override
  String get emojiTabGifs => 'GIFs';

  @override
  String get emojiTabMedia => 'Medien';

  @override
  String get emojiTabStickers => 'Sticker';

  @override
  String get emojiTabEmojis => 'Emojis';

  @override
  String get gifPickerSearch => 'GIFs suchen';

  @override
  String get gifPickerSearchKlipy => 'KLIPY suchen';

  @override
  String get gifPickerSearchTenor => 'Tenor suchen';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Favoriten';

  @override
  String get gifPickerTrending => 'Aktuelle GIFs';

  @override
  String get gifPickerNoResultsTitle => 'Keine Suchergebnisse';

  @override
  String get gifPickerNoResultsDescription =>
      'Versuche einen anderen Suchbegriff';

  @override
  String get gifPickerLoadFailedTitle => 'GIFs konnten nicht geladen werden';

  @override
  String get gifPickerLoadFailedBody =>
      'Überprüfe deine Verbindung und versuche es erneut.';

  @override
  String get emojiCategoryPeople => 'Personen';

  @override
  String get emojiCategoryNature => 'Natur';

  @override
  String get emojiCategoryFood => 'Essen & Trinken';

  @override
  String get emojiCategoryActivity => 'Aktivitäten';

  @override
  String get emojiCategoryTravel => 'Reisen & Orte';

  @override
  String get emojiCategoryObjects => 'Objekte';

  @override
  String get emojiCategorySymbols => 'Symbole';

  @override
  String get emojiCategoryFlags => 'Flaggen';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Schalte $emojiCount von $communityCount mit Plutonium frei.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Plutonium erhalten';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Dies nicht mehr anzeigen';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count benutzerdefinierte Emojis',
      one: '1 benutzerdefiniertes Emoji',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Communities',
      one: '1 Community',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Warnung: Externer Link';

  @override
  String get externalLinkWarningLeaving => 'Du verlässt Fluxer';

  @override
  String get externalLinkWarningDescription =>
      'Externe Links können gefährlich sein. Bitte sei vorsichtig.';

  @override
  String get externalLinkWarningDestinationUrl => 'Ziel-URL:';

  @override
  String get externalLinksSectionTitle => 'Externe Links';

  @override
  String get externalLinksSectionDescription =>
      'Lege fest, wie Warnungen für externe Links behandelt werden.';

  @override
  String get externalLinkWarningTrustPrefix => 'Immer vertrauen ';

  @override
  String get externalLinkWarningTrustSuffix =>
      '— diese Warnung überspringen, wenn du ihr das nächste Mal begegnest';

  @override
  String get externalLinkVisitSite => 'Webseite besuchen';

  @override
  String get externalLinkTrustAllLabel => 'Alle externen Links vertrauen';

  @override
  String get externalLinkStripTrackingLabel =>
      'Tracking-Parameter aus URLs entfernen';

  @override
  String get externalLinkStripTrackingDescription =>
      'Entferne automatisch Tracking-Parameter (wie utm_source, fbclid, gclid) aus den URLs in Nachrichten, die du sendest. Bereinigt den Link, bevor er jemand anderen erreicht.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Allen externen Links vertrauen?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Dadurch werden alle externen Links vertraut und die Warnung für jede Domain übersprungen. Deine bestehenden vertrauenswürdigen Domains werden ersetzt. Dies ist weniger sicher.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Alle vertrauen';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Vertrauen in alle Links stoppen?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Warnungen für externe Links werden wieder angezeigt. Du musst vertrauenswürdige Domains einzeln hinzufügen.';

  @override
  String get externalLinkStopTrustingAllAction => 'Alle vertrauen deaktivieren';

  @override
  String get externalLinkTrustedAllDescription =>
      'Allen externen Links wird vertraut. Warnungen werden nicht angezeigt.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Du hast $count vertrauenswürdige Domain(s). Füge weitere hinzu, indem du das Kästchen ankreuzt, wenn du externe Links besuchst.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Wenn aktiviert, werden keine Warnungen für externe Links angezeigt. Dies ist weniger sicher.';

  @override
  String get imageFileTooLarge =>
      'Bilddatei ist zu gross. Bitte wähle eine Datei mit weniger als 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Animierte Avatare erfordern Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Animierte Banner erfordern Plutonium';

  @override
  String get animatedAvifNotSupported => 'Animiertes AVIF nicht unterstützt';

  @override
  String get animatedAvifNotSupportedBody =>
      'Das Zuschneiden und Drehen von animierten AVIF-Dateien wird noch nicht unterstützt. Wenn du fortfährst, wird es in seiner ursprünglichen Form hochgeladen.';

  @override
  String get uploadAsIs => 'Wie besehen hochladen';

  @override
  String get croppingAnimatedNotSupported =>
      'Das Zuschneiden animierter Bilder wird noch nicht unterstützt. Die ursprüngliche Datei wird verwendet.';

  @override
  String get cropAvatar => 'Avatar zuschneiden';

  @override
  String get cropBanner => 'Banner zuschneiden';

  @override
  String get skip => 'Überspringen';

  @override
  String get crop => 'Zuschneiden';

  @override
  String get changeYourFluxerTag => 'Deinen FluxerTag ändern';

  @override
  String get fluxerTagInputLabel => 'FluxerTag';

  @override
  String get fluxerTagDescriptionBase =>
      'Benutzernamen dürfen nur Buchstaben (a-z, A-Z), Zahlen (0-9) und Unterstriche enthalten. Benutzernamen sind nicht gross-/kleinschreibungsempfindlich.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Benutzernamen dürfen nur Buchstaben (a-z, A-Z), Zahlen (0-9) und Unterstriche enthalten. Benutzernamen sind nicht gross-/kleinschreibungsempfindlich. Du kannst jeden verfügbaren 4-stelligen Tag von #0000 bis #9999 auswählen.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Benutzernamen dürfen nur Buchstaben (a-z, A-Z), Zahlen (0-9) und Unterstriche enthalten. Benutzernamen sind nicht gross-/kleinschreibungsempfindlich. Du kannst jeden verfügbaren 4-stelligen Tag von #0001 bis #9999 auswählen.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Zwischen $min und $max Zeichen';
  }

  @override
  String get validationAllowedChars =>
      'Nur Buchstaben (a-z, A-Z), Zahlen (0-9) und Unterstriche (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Hol dir Plutonium, um deinen Tag anzupassen oder ihn beim Ändern deines Benutzernamens zu behalten';

  @override
  String get fluxerTagAlreadyTaken => 'FluxerTag bereits vergeben';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Der FluxerTag $username#$discriminator ist bereits vergeben. Wenn du fortfährst, wird dein Diskriminator automatisch neu ausgewürfelt.';
  }

  @override
  String get customTagIsTemporary => 'Benutzerdefinierter Tag ist temporär';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Dein benutzerdefinierter 4-stelliger Tag ist nur verfügbar, solange dein Plutonium-Abonnement aktiv ist. Wenn dein Abonnement am $date abläuft, wird dein Tag nach einer 3-tägigen Kulanzfrist auf eine zufällig zugewiesene Nummer zurückgesetzt.';
  }

  @override
  String get customTagTemporaryBody =>
      'Dein benutzerdefinierter 4-stelliger Tag ist nur verfügbar, solange dein Plutonium-Abonnement aktiv ist. Wenn dein Abonnement abläuft, wird dein Tag nach einer 3-tägigen Kulanzfrist auf eine zufällig zugewiesene Nummer zurückgesetzt.';

  @override
  String get iUnderstandContinue => 'Ich verstehe, weiter';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Wenn du diesen FluxerTag speicherst, wird dein benutzerdefinierter 4-stelliger Tag auf eine zufällige Nummer zurückgesetzt, wenn dein Plutonium-Abonnement endet. Wenn dein Abonnement nicht erneuert wird, hast du eine 3-tägige Kulanzfrist, bevor sich der Tag ändert.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Dein benutzerdefinierter 4-stelliger Tag (#$discriminator) ist aktiv, solange dein Plutonium-Abonnement aktiv ist. Wenn dein Abonnement nach einer 3-tägigen Kulanzfrist endet oder nicht erneuert wird, wird dein Tag auf eine zufällige Nummer zurückgesetzt.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Passe deinen 4-stelligen Tag an oder behalte ihn, wenn du deinen Benutzernamen änderst';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Deine Plutonium-Testversion läuft am $date ab. Upgrade, um deinen benutzerdefinierten Tag zu behalten und eine Auszeichnung auf deinem Profil zu erhalten.';
  }

  @override
  String get premiumTrialActive =>
      'Du befindest dich in einer Plutonium-Testversion. Upgrade, um deinen benutzerdefinierten Tag zu behalten und eine Auszeichnung auf deinem Profil zu erhalten.';

  @override
  String get fluxerTagUpdated => 'FluxerTag aktualisiert';

  @override
  String get fluxerTagUpdateFailed =>
      'FluxerTag konnte nicht aktualisiert werden. Bitte versuche es erneut.';

  @override
  String get continueAction => 'Weiter';

  @override
  String get profileCustomizationTitle => 'Profilanpassung';

  @override
  String get profileCustomizationDescription =>
      'Bearbeite das Erscheinungsbild deines Profils und sieh eine Live-Vorschau';

  @override
  String get usernameLabel => 'Benutzername';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Beanspruche dein Konto, um deinen FluxerTag zu ändern';

  @override
  String get changeFluxerTag => 'FluxerTag ändern';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Passe deine 4-stellige Tag (#$discriminator) mit Plutonium nach Belieben an';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Ändere deinen Benutzernamen und 4-stelligen Tag';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Dein benutzerdefinierter Tag (#$discriminator) ist an dein Plutonium-Abo gebunden und wird zu einem zufälligen Tag zurückgesetzt, wenn es abläuft.';
  }

  @override
  String get displayNameLabel => 'Anzeigename';

  @override
  String get pronounsLabel => 'Pronomen';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Avatar ändern';

  @override
  String get removeAvatar => 'Avatar entfernen';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Max. 10 MB. Empfohlen: 512×512px';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get changeBanner => 'Banner ändern';

  @override
  String get removeBanner => 'Banner entfernen';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Max. 10 MB. Mindestens: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Akzentfarbe';

  @override
  String get accentColorDescription =>
      'Passt die Rahmen- und Bannerfarbe deines Profils an';

  @override
  String get aboutMeLabel => 'Über mich';

  @override
  String get aboutMeHelperText =>
      'Du kannst Links, Emojis und Markdown verwenden.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle => 'Plutonium-Badge-Datenschutz';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Steuere, wie dein Plutonium-Badge anderen angezeigt wird';

  @override
  String get hidePlutoniumBadgeLabel =>
      'Plutonium-Badge vollständig ausblenden';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Blende dein Plutonium-Badge vollständig für andere Benutzer aus';

  @override
  String get hidePlutoniumPurchaseDate => 'Kaufdatum von Plutonium ausblenden';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Kaufdatum von Plutonium ausblenden ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Entferne das Datum deines ersten Plutonium-Kaufs von deinem Badge';

  @override
  String get maskVisionaryAsSubscription =>
      'Visionary als Abonnement maskieren';

  @override
  String get maskVisionaryDescription =>
      'Zeige dein Visionary als reguläres Abonnement an';

  @override
  String get hideVisionaryIdBadge => 'Visionary-ID-Badge ausblenden';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Visionary-ID-Badge ausblenden (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Entferne deinen Visionary-ID-Badge';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Du bist in einer Plutonium-Testphase – dein Abonnement beginnt am $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Dein Abonnement beginnt automatisch, wenn deine Testphase endet. Keine Aktion erforderlich.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Du bist in einer Plutonium-Testphase, die am $date abläuft';
  }

  @override
  String get premiumTrialActiveProfile =>
      'Du bist in einer Plutonium-Testphase';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Max. 10 MB. Empfohlen: 512×512px. Animierte Avatare (GIF) erfordern Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Passe dein Profil mit einem statischen oder animierten Bannerbild an, um es hervorzuheben.';

  @override
  String get getPlutonium => 'Plutonium erhalten';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'In-App-Käufe sind auf dieser Plattform noch nicht verfügbar. Bleib dran – bald verfügbar!';

  @override
  String get profilePreviewLabel => 'Vorschau';

  @override
  String get profilePreviewMessage => 'Nachricht';

  @override
  String get profilePreviewMemberSince => 'Fluxer-Mitglied seit';

  @override
  String get unclaimedAccountTitle => 'Unbeanspruchtes Konto';

  @override
  String get unclaimedAccountDescription =>
      'Dein Konto wurde noch nicht beansprucht. Ohne E-Mail und Passwort könntest du den Zugriff verlieren. Beanspruche dein Konto jetzt, um es zu sichern.';

  @override
  String get claimAccount => 'Konto beanspruchen';

  @override
  String get profileTypeLabel => 'Profiltyp';

  @override
  String get profileTypeGlobal => 'Globales Profil';

  @override
  String get profileTypeGuildDescription =>
      'Du bearbeitest dein Profil pro Community. Dieses Profil ist nur in dieser Community sichtbar und überschreibt dein globales Profil.';

  @override
  String get communityNicknameLabel => 'Community-Nickname';

  @override
  String get perGuildPremiumUpsellText =>
      'Das Anpassen deines Avatars, Banners, deiner Akzentfarbe und deines Profils für einzelne Gemeinschaften erfordert Plutonium. Community-Spitznamen und Pronomen sind für alle kostenlos.';

  @override
  String get avatarModeInherit => 'Globales Profil verwenden';

  @override
  String get avatarModeCustom => 'Benutzerdefiniertes Bild verwenden';

  @override
  String get avatarModeUnset => 'Nicht anzeigen';

  @override
  String get profileSavedToast => 'Profil aktualisiert';

  @override
  String get profileEditButton => 'Profil bearbeiten';

  @override
  String get profileNoteLabel => 'Notiz';

  @override
  String get profileNoteVisibility => '(nur für dich sichtbar)';

  @override
  String get profileNoteEmpty => 'Noch keine Notiz.';

  @override
  String get sudoTitle => 'Identität verifizieren';

  @override
  String get sudoDescription =>
      'Diese Aktion erfordert eine Verifizierung, um fortzufahren.';

  @override
  String get sudoAuthenticatorCode => 'Authenticator-Code';

  @override
  String get sudoMethodPassword => 'Passwort';

  @override
  String get sudoMethodTotp => 'Authenticator';

  @override
  String get sudoVerificationFailed =>
      'Verifizierung fehlgeschlagen. Bitte versuche es erneut.';

  @override
  String get securityAccountTitle => 'Konto';

  @override
  String get securityAccountDescription =>
      'Verwalte deine E-Mail-Adresse, dein Passwort und deine Kontoeinstellungen';

  @override
  String get securitySectionTitle => 'Sicherheit';

  @override
  String get securitySectionDescription =>
      'Schütze dein Konto mit Zwei-Faktor-Authentifizierung und Passkeys';

  @override
  String get securityLoginEmailSectionTitle => 'E-Mail-Einstellungen';

  @override
  String get securityLoginEmailSectionDescription =>
      'Verwalte die E-Mail-Adresse, mit der du dich bei Fluxer anmeldest';

  @override
  String get securityLoginEmailAddressLabel => 'E-Mail-Adresse';

  @override
  String get securityLoginNoEmailSet => 'Keine E-Mail-Adresse festgelegt';

  @override
  String get securityLoginChangeEmail => 'E-Mail ändern';

  @override
  String get securityLoginAddEmail => 'E-Mail hinzufügen';

  @override
  String get securityLoginReveal => 'Anzeigen';

  @override
  String get securityLoginHide => 'Ausblenden';

  @override
  String get securityLoginPasswordSectionTitle => 'Passwort';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Ändere dein Passwort, um dein Konto zu schützen';

  @override
  String get securityLoginCurrentPasswordLabel => 'Aktuelles Passwort';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Zuletzt geändert: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Zuletzt geändert: Nie';

  @override
  String get securityLoginNoPasswordSet => 'Kein Passwort festgelegt';

  @override
  String get securityLoginChangePassword => 'Passwort ändern';

  @override
  String get securityLoginSetPassword => 'Passwort festlegen';

  @override
  String get passwordChangeTitle => 'Passwort ändern';

  @override
  String get passwordChangeIntroDescription =>
      'Wir senden einen Verifizierungscode an deine E-Mail-Adresse, um deine Identität zu bestätigen, bevor du dein Passwort änderst.';

  @override
  String get passwordChangeStart => 'Starten';

  @override
  String get passwordChangeVerifyTitle => 'E-Mail verifizieren';

  @override
  String get passwordChangeVerifyDescription =>
      'Gib den Verifizierungscode ein, der an deine E-Mail-Adresse gesendet wurde.';

  @override
  String get passwordChangeVerificationCode => 'Verifizierungscode';

  @override
  String get passwordChangeVerify => 'Verifizieren';

  @override
  String get passwordChangeNewPasswordTitle => 'Neues Passwort festlegen';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Gib unten dein neues Passwort ein.';

  @override
  String get passwordChangeNewPassword => 'Neues Passwort';

  @override
  String get passwordChangeConfirmPassword => 'Neues Passwort bestätigen';

  @override
  String get passwordChangeSubmit => 'Passwort ändern';

  @override
  String get passwordChangeSuccess => 'Passwort geändert';

  @override
  String get passwordChangePasswordsDoNotMatch =>
      'Passwörter stimmen nicht überein';

  @override
  String get passwordChangeInvalidCode => 'Ungültiger oder abgelaufener Code';

  @override
  String get emailChangeTitle => 'E-Mail ändern';

  @override
  String get emailChangeIntroDescription =>
      'Wir senden Ihnen Verifizierungscodes, um Ihre Identität zu bestätigen, bevor wir Ihre E-Mail-Adresse ändern.';

  @override
  String get emailChangeStart => 'Starten';

  @override
  String get emailChangeVerifyOriginalTitle => 'Aktuelle E-Mail verifizieren';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Geben Sie den Verifizierungscode ein, der an Ihre aktuelle E-Mail-Adresse gesendet wurde.';

  @override
  String get emailChangeNewEmailTitle => 'Neue E-Mail eingeben';

  @override
  String get emailChangeNewEmailDescription =>
      'Geben Sie die neue E-Mail-Adresse ein, die Sie verwenden möchten.';

  @override
  String get emailChangeNewEmailLabel => 'Neue E-Mail';

  @override
  String get emailChangeNewEmailSubmit => 'Verifizierungscode senden';

  @override
  String get emailChangeVerifyNewTitle => 'Neue E-Mail verifizieren';

  @override
  String get emailChangeVerifyNewDescription =>
      'Geben Sie den Verifizierungscode ein, der an Ihre neue E-Mail-Adresse gesendet wurde.';

  @override
  String get emailChangeSuccess => 'E-Mail geändert';

  @override
  String get emailChangeInvalidCode => 'Ungültiger oder abgelaufener Code';

  @override
  String get resend => 'Erneut senden';

  @override
  String resendCountdown(int seconds) {
    return 'Erneut senden (${seconds}s)';
  }

  @override
  String get verificationCode => 'Verifizierungscode';

  @override
  String get verify => 'Verifizieren';

  @override
  String get enable => 'Aktivieren';

  @override
  String get disable => 'Deaktivieren';

  @override
  String get delete => 'Löschen';

  @override
  String get save => 'Speichern';

  @override
  String get securityTfaSectionTitle => 'Zwei-Faktor-Authentifizierung';

  @override
  String get securityTfaSectionDescription =>
      'Fügen Sie Ihrem Konto eine zusätzliche Sicherheitsebene hinzu';

  @override
  String get securityTfaAuthenticatorApp => 'Authentifizierungs-App';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Zwei-Faktor-Authentifizierung ist aktiviert';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Verwende eine Authenticator-App, um Codes für die Zwei-Faktor-Authentifizierung zu generieren';

  @override
  String get securityTfaBackupCodes => 'Backup-Codes';

  @override
  String get securityTfaBackupCodesDescription =>
      'Zeige deine Backup-Codes an und verwalte sie für die Kontowiederherstellung';

  @override
  String get securityTfaViewCodes => 'Codes anzeigen';

  @override
  String get securityPasskeysSectionTitle => 'Passkeys';

  @override
  String get securityPasskeysSectionDescription =>
      'Verwende Passkeys für die passwortlose Anmeldung und Zwei-Faktor-Authentifizierung';

  @override
  String get securityPasskeysRegistered => 'Registrierte Passkeys';

  @override
  String get securityPasskeysNone => 'Keine Passkeys registriert';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Passkeys',
      one: 'Passkey',
    );
    return '$count $_temp0 registriert (max. 10)';
  }

  @override
  String get securityPasskeysAdd => 'Passkey hinzufügen';

  @override
  String securityPasskeysAdded(String date) {
    return 'Hinzugefügt: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Zuletzt verwendet: $date';
  }

  @override
  String get securityPasskeysRename => 'Umbenennen';

  @override
  String get securityPasskeysDeleteTitle => 'Passkey löschen';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Möchtest du den Passkey „$name“ wirklich löschen?';
  }

  @override
  String get securityPasskeyNameTitle => 'Passkey benennen';

  @override
  String get securityPasskeyNameLabel => 'Passkey-Name';

  @override
  String get securityPasskeyNameHint =>
      'z. B. YubiKey, iPhone, Arbeitscomputer';

  @override
  String get securityPhoneSectionTitle => 'Telefonnummer';

  @override
  String get securityPhoneSectionDescription => 'Verwalte deine Telefonnummer';

  @override
  String get securityPhoneLabel => 'Telefonnummer';

  @override
  String get securityPhoneNone => 'Keine Telefonnummer hinzugefügt.';

  @override
  String get securityPhoneAdd => 'Telefon hinzufügen';

  @override
  String get securityPhoneRemove => 'Entfernen';

  @override
  String get securityPhoneRemoveTitle => 'Telefonnummer entfernen';

  @override
  String get securityPhoneRemoveDescription =>
      'Möchtest du deine Telefonnummer wirklich entfernen?';

  @override
  String get securityPhoneRemoved => 'Telefonnummer entfernt';

  @override
  String get securityClaimTitle => 'Sicherheitsfunktionen';

  @override
  String get securityClaimDescription =>
      'Beanspruche dein Konto, um auf Sicherheitsfunktionen wie Zwei-Faktor-Authentifizierung und Passkeys zuzugreifen.';

  @override
  String get securityVerifyEmailRequired =>
      'Du musst deine E-Mail-Adresse verifizieren, bevor du die Zwei-Faktor-Authentifizierung, Passkeys oder SMS-Verifizierung einrichten kannst.';

  @override
  String get totpEnableTitle => 'Authenticator-App einrichten';

  @override
  String get totpEnableDescription =>
      'Scanne den QR-Code mit deiner Authenticator-App, um Codes für die Zwei-Faktor-Authentifizierung zu generieren.';

  @override
  String get totpEnableCodeLabel => 'Code';

  @override
  String get totpEnableCodeHint =>
      'Gib den 6-stelligen Code aus deiner Authenticator-App ein';

  @override
  String get totpEnableSuccess =>
      'Zwei-Faktor-Authentifizierung wurde aktiviert';

  @override
  String get totpDisableTitle => 'Authenticator-App entfernen';

  @override
  String get totpDisableDescription =>
      'Gib den 6-stelligen Code aus deiner Authenticator-App ein, um die Zwei-Faktor-Authentifizierung zu deaktivieren.';

  @override
  String get totpDisableSuccess => 'Zwei-Faktor-Authentifizierung deaktiviert';

  @override
  String get backupCodesTitle => 'Backup-Codes';

  @override
  String get backupCodesWarning =>
      'Wenn du den Zugriff auf deine Authenticator-App verlierst und diese Codes nicht hast, wirst du dauerhaft von deinem Konto ausgesperrt. Lade sie jetzt herunter oder kopiere sie und bewahre sie sicher auf.';

  @override
  String get backupCodesDownload => 'Herunterladen';

  @override
  String get backupCodesCopy => 'Kopieren';

  @override
  String get backupCodesCopied => 'Backup-Codes in die Zwischenablage kopiert';

  @override
  String get backupCodesAcknowledge =>
      'Ich habe meine Backup-Codes heruntergeladen oder kopiert und an einem sicheren Ort gespeichert.';

  @override
  String get backupCodesDone => 'Fertig';

  @override
  String get backupCodesViewTitle => 'Backup-Codes anzeigen';

  @override
  String get backupCodesViewDescription =>
      'Zur Anzeige deiner Backup-Codes ist möglicherweise eine Verifizierung erforderlich.';

  @override
  String get phoneAddTitle => 'Telefonnummer hinzufügen';

  @override
  String get phoneAddLabel => 'Telefonnummer';

  @override
  String get phoneAddHint => 'Gib deine Telefonnummer ein';

  @override
  String get phoneAddFooter =>
      'Gib deine Telefonnummer ein. Wir senden dir per SMS einen Verifizierungscode.';

  @override
  String get phoneAddSendCode => 'Code senden';

  @override
  String get phoneVerifyTitle => 'Telefonnummer verifizieren';

  @override
  String get phoneVerifyDescription =>
      'Gib den Verifizierungscode ein, der an deine Telefonnummer gesendet wurde.';

  @override
  String get phoneAddSuccess => 'Telefonnummer hinzugefügt';

  @override
  String get dangerZoneSectionTitle => 'Gefahrenzone';

  @override
  String get dangerZoneSectionDescription =>
      'Unumkehrbare und destruktive Aktionen';

  @override
  String get dangerZoneDisableTitle => 'Konto deaktivieren';

  @override
  String get dangerZoneDisableDescription =>
      'Deaktiviere dein Konto vorübergehend. Du kannst es später reaktivieren, indem du dich wieder anmeldest.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Das Deaktivieren deines Kontos meldet dich von allen Sitzungen ab. Du kannst dein Konto jederzeit wieder aktivieren, indem du dich erneut anmeldest.';

  @override
  String get dangerZoneDeleteTitle => 'Konto löschen';

  @override
  String get dangerZoneDeleteDescription =>
      'Lösche dein Konto und alle zugehörigen Daten dauerhaft. Diese Aktion kann nicht rückgängig gemacht werden.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Kündige dein aktives Plutonium-Abonnement in den Plutonium-Einstellungen, bevor du dein Konto löschst.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount =>
      'Konto kann nicht gelöscht werden';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Du kannst dein Konto nicht löschen, solange du Communities besitzt. Übertrage zuerst den Besitz der folgenden Communities:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'und $count weitere';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Um den Besitz zu übertragen, gehe zu $settingsPath und verwende die Option \"Besitz übertragen\".';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Möchtest du dein Konto wirklich löschen? Diese Aktion plant dein Konto zur dauerhaften Löschung ein.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Du kannst den Löschvorgang innerhalb von 14 Tagen abbrechen';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Nach 14 Tagen wird dein Konto dauerhaft gelöscht';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Sobald die Löschung verarbeitet wurde, kannst du nicht mehr auf dein Konto zugreifen';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Du kannst deine gesendeten Nachrichten nach der Kontolöschung nicht mehr löschen';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Wenn du deine Daten exportieren oder zuerst deine Nachrichten löschen möchtest, besuche bitte den Abschnitt \"Datenschutz-Dashboard\" in den Benutzereinstellungen, bevor du fortfährst.';

  @override
  String get claimAccountTitle => 'Beanspruche dein Konto';

  @override
  String get claimAccountDescription =>
      'Beanspruche dein Konto, indem du eine E-Mail-Adresse und ein Passwort hinzufügst. Wir senden dir einen Verifizierungscode, um deine E-Mail-Adresse zu bestätigen, bevor wir fertig sind.';

  @override
  String get claimAccountEmailLabel => 'E-Mail';

  @override
  String get claimAccountPasswordLabel => 'Passwort';

  @override
  String get claimAccountSendCode => 'Code senden';

  @override
  String get claimAccountVerifyDescription =>
      'Gib den Code ein, den wir dir per E-Mail gesendet haben, um deine E-Mail zu verifizieren. Dein Passwort wird festgelegt, sobald der Code bestätigt wurde.';

  @override
  String get claimAccountSuccess => 'Konto erfolgreich beansprucht';

  @override
  String get importantInformation => 'Wichtige Informationen:';

  @override
  String get genericError => 'Ein Fehler ist aufgetreten';

  @override
  String get invalidCode => 'Ungültiger Code';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vor $count Jahren',
      one: 'vor 1 Jahr',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vor $count Monaten',
      one: 'vor 1 Monat',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vor $count Tagen',
      one: 'vor 1 Tag',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vor $count Stunden',
      one: 'vor 1 Stunde',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vor $count Minuten',
      one: 'vor 1 Minute',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'gerade eben';

  @override
  String get authorizedAppsTitle => 'Autorisierte Anwendungen';

  @override
  String get authorizedAppsDescription =>
      'Diesen Anwendungen wurde Zugriff auf dein Fluxer-Konto gewährt.';

  @override
  String get authorizedAppsEmptyTitle => 'Keine autorisierten Anwendungen';

  @override
  String get authorizedAppsEmptyDescription =>
      'Du hast noch keine Anwendungen autorisiert, auf dein Konto zuzugreifen.';

  @override
  String get authorizedAppsLoadError =>
      'Autorisierte Anwendungen konnten nicht geladen werden';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Autorisiert am $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Erteilte Berechtigungen';

  @override
  String get authorizedAppsRevoke => 'Entziehen';

  @override
  String get authorizedAppsRevokeTitle => 'Anwendungszugriff entziehen';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Möchtest du den Zugriff für $appName wirklich entziehen? Diese Anwendung hat dann keinen Zugriff mehr auf dein Konto.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Zugriff auf deine Basisprofilinformationen (Benutzername, Avatar usw.)';

  @override
  String get authorizedAppsScopeEmail => 'Deine E-Mail-Adresse anzeigen';

  @override
  String get authorizedAppsScopeGuilds =>
      'Die Gemeinschaften anzeigen, deren Mitglied du bist';

  @override
  String get authorizedAppsScopeConnections =>
      'Deine verbundenen Konten anzeigen';

  @override
  String get authorizedAppsScopeBot =>
      'Einen Bot mit den angeforderten Berechtigungen zu einer Gemeinschaft hinzufügen';

  @override
  String get authorizedAppsScopeAdmin =>
      'Auf administrative Endpunkte zugreifen';

  @override
  String get privacyPendingDeletionTitle => 'Löschung ausstehend';

  @override
  String get blockedUsersTitle => 'Blockierte Benutzer';

  @override
  String get blockedUsersDescription =>
      'Blockierte Benutzer können dir keine Freundschaftsanfragen senden oder dich direkt anschreiben.';

  @override
  String get blockedUsersEmptyTitle => 'Keine blockierten Benutzer';

  @override
  String get blockedUsersEmptyDescription =>
      'Du hast noch niemanden blockiert.';

  @override
  String get blockedUsersLoadError =>
      'Blockierte Benutzer konnten nicht geladen werden';

  @override
  String get blockedUsersUnblock => 'Entsperren';

  @override
  String get blockedUsersUnblockTitle => 'Benutzer entsperren';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Möchtest du $username wirklich entsperren?';
  }

  @override
  String get blockedUsersCopyTag => 'FluxerTag kopieren';

  @override
  String get blockedUsersCopyId => 'Benutzer-ID kopieren';

  @override
  String get userProfileLoadError => 'Profil konnte nicht geladen werden';

  @override
  String get userProfileRetry => 'Erneut versuchen';

  @override
  String get userProfileMessage => 'Nachricht';

  @override
  String get userProfileVoiceCall => 'Sprachanruf';

  @override
  String get userProfileVideoCall => 'Videoanruf';

  @override
  String get userProfileEditProfile => 'Profil bearbeiten';

  @override
  String get userProfileStaffBadgeTooltip => 'Fluxer-Mitarbeiter';

  @override
  String get userProfileCtpBadgeTooltip => 'Fluxer Community Team';

  @override
  String get userProfilePartnerBadgeTooltip => 'Fluxer Partner';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Fluxer Bug Hunter';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer Plutonium';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Fluxer Plutonium Abonnent seit $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Fluxer Visionary';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Fluxer Visionary seit $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'Visionary ID #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Gemeinsame Freunde ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Gemeinsame Communities ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Gemeinsame Freunde';

  @override
  String get userProfileMutualCommunitiesTitle => 'Gemeinsame Communities';

  @override
  String get userProfileNoMutualFriends =>
      'Keine gemeinsamen Freunde gefunden.';

  @override
  String get userProfileNoMutualCommunities =>
      'Keine gemeinsamen Communities gefunden.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Spitzname: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'DM öffnen';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Du hast $username blockiert. Du kannst keine Nachrichten senden, es sei denn, du entfernst die Blockierung.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Blockierung aufheben';

  @override
  String get userProfileOpenDm => 'DM öffnen';

  @override
  String get userProfileNoteTitle => 'Notiz';

  @override
  String get userProfileNoteVisibility => '(nur für dich sichtbar)';

  @override
  String get userProfileNoteSave => 'Speichern';

  @override
  String get userProfileNoteDelete => 'Löschen';

  @override
  String get userProfileNoteEmpty => 'Klicke hier, um eine Notiz hinzuzufügen';

  @override
  String get userProfileMemberSince => 'Mitglied seit';

  @override
  String get userProfileAboutMe => 'Über mich';

  @override
  String get userProfileCopyUsername => 'Benutzernamen kopieren';

  @override
  String get userProfileCopyUserId => 'Benutzer-ID kopieren';

  @override
  String get userProfileViewMainProfile => 'Hauptprofil anzeigen';

  @override
  String get userProfileViewCommunityProfile => 'Community-Profil anzeigen';

  @override
  String get userProfileBlockUser => 'Benutzer blockieren';

  @override
  String get userProfileUnblockUser => 'Benutzer entsperren';

  @override
  String get userProfileRemoveFriend => 'Freund entfernen';

  @override
  String get userProfileBlockConfirmTitle => 'Benutzer blockieren';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Möchtest du $username wirklich blockieren?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Benutzer entsperren';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Möchtest du $username wirklich entsperren?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Freund entfernen';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Möchtest du $username wirklich als Freund entfernen?';
  }

  @override
  String get userProfileFailedOpenDm => 'DM konnte nicht geöffnet werden';

  @override
  String get userProfileFailedSaveNote =>
      'Notiz konnte nicht gespeichert werden';

  @override
  String get userProfileActionFailed =>
      'Aktion fehlgeschlagen, bitte versuche es erneut';

  @override
  String get userProfileChangeNickname => 'Spitznamen ändern';

  @override
  String get userProfileKick => 'Entfernen';

  @override
  String get userProfileBan => 'Sperren';

  @override
  String get userProfileTimeout => 'Zeitlimit';

  @override
  String get userProfileRemoveTimeout => 'Zeitlimit aufheben';

  @override
  String get userProfileTransferOwnership => 'Besitz übertragen';

  @override
  String get userProfileReportUser => 'Benutzer melden';

  @override
  String get userProfileReportMessage => 'Nachricht melden';

  @override
  String userProfileKickConfirmTitle(String username) {
    return '$username entfernen?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Möchtest du $username wirklich entfernen? Er/Sie kann mit einer neuen Einladung wieder beitreten.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Zeitstrafe aufheben?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Wenn die Zeitstrafe aufgehoben wird, kann $username wieder Nachrichten senden, reagieren und an Sprachkanälen teilnehmen.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Besitz übertragen?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Besitz dieser Community an $username übertragen? Dies ist nicht rückgängig zu machen und Sie verlieren alle Inhaberprivilegien.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return '$username sperren';
  }

  @override
  String get userProfileBanDurationLabel => 'Sperrdauer';

  @override
  String get userProfileBanCustomSecondsLabel =>
      'Benutzerdefinierte Dauer (Sekunden)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Jeder Wert zwischen $min und $max Sekunden';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Nachrichtenverlauf löschen';

  @override
  String get userProfileBanDeleteNone => 'Nichts löschen';

  @override
  String get userProfileBanDelete24h => 'Letzte 24 Stunden';

  @override
  String get userProfileBanDelete7d => 'Letzte 7 Tage';

  @override
  String get userProfileBanReasonLabel => 'Grund (optional)';

  @override
  String get userProfileBanReasonHint => 'Grund für die Sperre eingeben';

  @override
  String get userProfileBanSubmit => 'Mitglied sperren';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return '$username eine Zeitstrafe geben';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Zeitstrafedauer';

  @override
  String get userProfileTimeoutSubmit => 'Mitglied Zeitstrafe geben';

  @override
  String get userProfileNicknameLabel => 'Spitzname';

  @override
  String get userProfileNicknameHint => 'Spitzname eingeben';

  @override
  String get userProfileNicknameSave => 'Speichern';

  @override
  String userProfileKickSuccess(String username) {
    return '$username wurde rausgeworfen';
  }

  @override
  String userProfileBanSuccess(String username) {
    return '$username wurde gesperrt';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return '$username hat eine Zeitstrafe erhalten';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Zeitstrafe für $username aufgehoben';
  }

  @override
  String get userProfileNicknameSuccess => 'Spitzname aktualisiert';

  @override
  String get userProfileTransferSuccess => 'Besitz übertragen';

  @override
  String get durationPermanent => 'Permanent';

  @override
  String get duration60Seconds => '60 Sekunden';

  @override
  String get duration5Minutes => '5 Minuten';

  @override
  String get duration10Minutes => '10 Minuten';

  @override
  String get duration1Hour => '1 Stunde';

  @override
  String get duration12Hours => '12 Stunden';

  @override
  String get duration1Day => '1 Tag';

  @override
  String get duration3Days => '3 Tage';

  @override
  String get duration5Days => '5 Tage';

  @override
  String get duration1Week => '1 Woche';

  @override
  String get duration2Weeks => '2 Wochen';

  @override
  String get duration1Month => '1 Monat';

  @override
  String get durationCustom => 'Benutzerdefiniert…';

  @override
  String get iarReportUserTitle => 'Benutzer melden';

  @override
  String get iarReasonInappropriateProfile => 'Unangemessenes Profil';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Dieses Benutzerprofil enthält unangemessene Inhalte';

  @override
  String typingIndicatorOne(String name) {
    return '$name tippt...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 und $name2 tippen...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 und $name3 tippen...';
  }

  @override
  String get typingIndicatorMultiple => 'Mehrere Personen tippen...';

  @override
  String get typingIndicatorHandful =>
      'Eine Handvoll Tastatur-Krieger versammelt sich...';

  @override
  String get typingIndicatorSymphony =>
      'Eine Symphonie von klickenden Tasten ist im Gange...';

  @override
  String get typingIndicatorFiesta =>
      'Hier ist eine ausgewachsene Tipp-Fiesta im Gange';

  @override
  String get typingIndicatorApocalypse => 'Wow, das ist ja ein Tipp-Apokalypse';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Schön, dass du da bist, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Willkommen, $username! Mach es dir gemütlich.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Hallo, $username! Schön, dich hier zu haben.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Hallo, $username! Mach einfach mit, wenn du bereit bist.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Hey $username, schön, dich hier zu sehen!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Hey $username! Wir hoffen, du geniesst deinen Aufenthalt.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Hey, $username, willkommen an Bord!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Schön, dass du es geschafft hast, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Willkommen, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Willkommen, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Willkommen, $username! Wir freuen uns, dass du da bist.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Willkommen, $username! Wir hoffen, du geniesst deine Zeit hier.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Willkommen, $username! Dein nächstes Gespräch beginnt hier.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Willkommen, $username. Wir freuen uns, dich hier zu haben.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Schön, dich zu sehen, $username! Willkommen.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Du bist hier, $username! Schön, dich bei uns zu haben.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Du bist angekommen, $username! Lass uns loslegen.';
  }

  @override
  String get relativeTimeShortNow => 'jetzt';

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
      other: '${count}T',
      one: '1T',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}M',
      one: '1M',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}J',
      one: '1J',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'Meine Geräte';

  @override
  String get linkedDevicesDescription =>
      'Sieh alle Geräte, die gerade in deinem Konto angemeldet sind. Widerrufe alle Sitzungen, die du nicht erkennst.';

  @override
  String get linkedDevicesCurrentDevice => 'Aktuelles Gerät';

  @override
  String get linkedDevicesOtherDevices => 'Andere Geräte';

  @override
  String get linkedDevicesEnterSelection => 'Auswahlmodus aktivieren';

  @override
  String get linkedDevicesExitSelection => 'Auswahlmodus beenden';

  @override
  String get linkedDevicesSelectAll => 'Alle auswählen';

  @override
  String get linkedDevicesClearSelection => 'Auswahl löschen';

  @override
  String get linkedDevicesRevokeTooltip => 'Gerät widerrufen';

  @override
  String get linkedDevicesSignOutAll => 'Alle anderen Geräte abmelden';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Geräte abmelden',
      one: '1 Gerät abmelden',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Geräte abmelden',
      one: '1 Gerät abmelden',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Alle anderen Geräte abmelden';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Dies meldet die ausgewählten Geräte von deinem Konto ab. Du musst dich auf diesen Geräten erneut anmelden.',
      one:
          'Dies meldet das ausgewählte Gerät von deinem Konto ab. Du musst dich auf diesem Gerät erneut anmelden.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Dies meldet die ausgewählten Geräte von deinem Konto ab. Du musst dich auf diesen Geräten erneut anmelden.';

  @override
  String get linkedDevicesSignOutConfirm => 'Weiter';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Du musst dich auf allen abgemeldeten Geräten wieder anmelden';

  @override
  String get linkedDevicesLoadErrorTitle => 'Netzwerkfehler';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Wir haben Probleme, eine Verbindung zum Raum-Zeit-Kontinuum herzustellen. Bitte überprüfe deine Verbindung und versuche es erneut.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Geräte widerrufen',
      one: 'Gerät widerrufen',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'Abmeldung fehlgeschlagen. Versuche es erneut.';

  @override
  String get linkedDevicesUnknownOs => 'Unbekanntes Betriebssystem';

  @override
  String get linkedDevicesUnknownPlatform => 'Unbekannte Plattform';

  @override
  String slowmodeLabel(String duration) {
    return '$duration Zeitlupe';
  }

  @override
  String get slowmodeTooltipActive =>
      'Du bist im Zeitlupenmodus. Bitte warte, bevor du eine weitere Nachricht sendest.';

  @override
  String get slowmodeTooltipImmune =>
      'Zeitlupe ist aktiviert, aber du bist immun.';

  @override
  String get channelNoSendPermissionHint =>
      'Du kannst in diesem Kanal keine Nachrichten senden.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Systemankündigungen von $productName-Mitarbeitern. Du kannst hier nicht antworten.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Das Senden von Nachrichten ist in dieser Community vorübergehend pausiert.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Du wurdest vorübergehend gesperrt. Nachrichten, Reaktionen und Sprache sind bis zum Ablauf der Sperre pausiert.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Du musst dein Konto beanspruchen, um in dieser Community Nachrichten senden zu können.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Du musst deine E-Mail-Adresse verifizieren, um in dieser Community Nachrichten senden zu können.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Dein Konto ist zu neu, um in dieser Community Nachrichten senden zu können.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Du bist noch nicht lange genug Mitglied dieser Community, um Nachrichten senden zu können.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Du musst eine Telefonnummer verifizieren, um in dieser Community Nachrichten senden zu können.';

  @override
  String get channelComposerBarrierVerifyEmail => 'E-Mail verifizieren';

  @override
  String get channelComposerBarrierVerifyPhone => 'Telefon verifizieren';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Zu viele Anhänge (max. $max)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'Eine oder mehrere Dateien überschreiten die Grössenbeschränkung';

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Diese Dateien sind zu gross, um sie zusammen zu senden';

  @override
  String get chatAttachmentDropToUpload =>
      'Dateien hierher ziehen zum Hochladen';

  @override
  String get chatAttachmentDropToSend =>
      'Dateien hierher ziehen zum sofortigen Senden';

  @override
  String get chatAttachmentSendVoiceMessage => 'Sprachnachricht senden';

  @override
  String get voiceMessageTitle => 'Sprachnachricht';

  @override
  String get voiceMessageHoldHint =>
      'Halten zum Aufnehmen. Nach oben ziehen zum Sperren oder loslassen zum Senden.';

  @override
  String get voiceMessageDiscard => 'Sprachnachricht verwerfen';

  @override
  String get voiceMessageSend => 'Sprachnachricht senden';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Aufnahme kann nicht gestartet werden. Mikrofonzugriff erlauben.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Sprachaufnahmen werden auf diesem Gerät nicht unterstützt.';

  @override
  String get voiceMessageMicInUse =>
      'Verlasse den Sprachanruf, um eine Sprachnachricht aufzunehmen.';

  @override
  String get voiceMessageRecordingFailed =>
      'Aufnahme fehlgeschlagen. Versuche es erneut.';

  @override
  String get voiceMessageSendFailed =>
      'Sprachnachricht kann nicht gesendet werden. Versuche es erneut.';

  @override
  String get voiceMessageRecordingHint =>
      'Sprich jetzt. Drücke Stopp, wenn du fertig bist – du kannst danach schneiden.';

  @override
  String get voiceMessageReviewHint =>
      'Ziehe die Regler zum Schneiden, drücke dann Senden.';

  @override
  String get voiceMessageStop => 'Stopp';

  @override
  String get voiceMessageStartRecording => 'Aufnahme starten';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Abspielen';

  @override
  String get voiceMessagePause => 'Pause';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Auswahl muss mindestens ${secondsString}s lang sein.';
  }

  @override
  String get chatAttachmentEditTitle => 'Anhang bearbeiten';

  @override
  String get chatAttachmentFilenameLabel => 'Dateiname';

  @override
  String get chatAttachmentDescriptionLabel => 'Beschreibung';

  @override
  String get chatAttachmentDescriptionHint => 'Optionale Alternativtext';

  @override
  String get chatAttachmentSpoilerLabel => 'Als Spoiler markieren';

  @override
  String get chatAttachmentRemove => 'Anhang entfernen';

  @override
  String get chatAttachmentDownload => 'Herunterladen';

  @override
  String get chatAttachmentExpiredTooltip => 'Anhang abgelaufen';

  @override
  String get chatAttachmentSourceGallery => 'Galerie';

  @override
  String get chatAttachmentSourceCamera => 'Kamera';

  @override
  String get chatAttachmentSourceBrowse => 'Dateien durchsuchen';

  @override
  String get chatAttachmentPasteTooltip => 'Bild aus Zwischenablage einfügen';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Spoiler anzeigen';

  @override
  String get matureMediaRevealButton => 'Anzeigen';

  @override
  String get matureMediaRevealHint => 'Klicken zum Anzeigen';

  @override
  String get matureContentTitle => 'Nicht jugendfreie Inhalte';

  @override
  String get matureCommunityTitle => 'Reife Community';

  @override
  String get matureCategoryTitle => 'Reife Kategorie';

  @override
  String get matureChannelTitle => 'Reifer Kanal';

  @override
  String get communityContentWarningTitle => 'Community-Inhaltswarnung';

  @override
  String get categoryContentWarningTitle => 'Kategorie-Inhaltswarnung';

  @override
  String get channelContentWarningTitle => 'Kanal-Inhaltswarnung';

  @override
  String get defaultContentWarningBody => 'Dies enthält sensible Inhalte.';

  @override
  String get matureCommunityBody =>
      'Diese Community ist für reife Inhalte gekennzeichnet und kann Material enthalten, das für einige Benutzer ungeeignet ist.';

  @override
  String get matureCategoryBody =>
      'Diese Kategorie ist für reife Inhalte gekennzeichnet und kann Material enthalten, das für einige Benutzer ungeeignet ist.';

  @override
  String get matureChannelBody =>
      'Dieser Kanal ist für reife Inhalte gekennzeichnet und kann Material enthalten, das für einige Benutzer ungeeignet ist.';

  @override
  String get matureVoiceChannelBody =>
      'Dieser Sprachkanal ist für reife Inhalte gekennzeichnet und kann Material enthalten, das für einige Benutzer ungeeignet ist.';

  @override
  String get matureLinkChannelBody =>
      'Dieser Linkkanal ist für reife Inhalte gekennzeichnet und kann Material öffnen, das für einige Benutzer ungeeignet ist.';

  @override
  String get matureCommunityUnavailableBody =>
      'Diese reife Community ist für Ihr Konto nicht verfügbar.';

  @override
  String get matureCategoryUnavailableBody =>
      'Diese reife Kategorie ist für Ihr Konto nicht verfügbar.';

  @override
  String get matureChannelUnavailableBody =>
      'Dieser reife Kanal ist für Ihr Konto nicht verfügbar.';

  @override
  String get matureContentProceedButton => 'Weiter';

  @override
  String get matureContentUnderstandButton => 'Ich verstehe';

  @override
  String get matureContentOpenLinkButton => 'Link öffnen';

  @override
  String get sensitiveContentSectionTitle => 'Sensible Inhalte';

  @override
  String get sensitiveContentSectionDescription =>
      'Steuern Sie, wie reife oder sensible Medien in verschiedenen Kontexten gefiltert werden';

  @override
  String get sensitiveContentFriendDmLabel => 'Direktnachrichten von Freunden';

  @override
  String get sensitiveContentNonFriendDmLabel =>
      'Direktnachrichten von anderen';

  @override
  String get sensitiveContentGuildLabel => 'Nachrichten in Community-Kanälen';

  @override
  String get sensitiveContentFilterShow => 'Anzeigen';

  @override
  String get sensitiveContentFilterBlur => 'Unschärfe';

  @override
  String get sensitiveContentFilterBlock => 'Blockieren';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Medien unscharf machen, bis der Sicherheitsscan abgeschlossen ist';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Wenn aktiviert, werden Bilder und Videos unscharf gemacht, bis der Inhalts-Sicherheitsscan abgeschlossen ist.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Diese Einstellung ist für Ihr Konto immer aktiviert.';

  @override
  String get sensitiveContentResetButton => 'Zurücksetzen';

  @override
  String get sensitiveContentSaveButton => 'Speichern';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Dateien',
      one: '1 Datei',
    );
    return 'Lade $_temp0 hoch';
  }

  @override
  String get chatCancelUpload => 'Upload abbrechen';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Läuft ab am $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Läuft ab zwischen $start und $end';
  }

  @override
  String get connectionsTitle => 'Verbindungen';

  @override
  String get connectionsDescription =>
      'Verknüpfe externe Konten und Domains mit deinem Fluxer-Profil. Verifizierte Verbindungen werden auf deinem Profil angezeigt.';

  @override
  String get connectionsEmptyTitle => 'Noch keine Verbindungen';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Verknüpfe dein Bluesky-Konto oder verifiziere die Domain-Inhaberschaft, um sie auf deinem Profil anzuzeigen.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Verifiziere die Domain-Inhaberschaft, um sie auf deinem Profil anzuzeigen.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Domain';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Bluesky-Verbindung hinzufügen';

  @override
  String get connectionsAddDomainAriaLabel => 'Domain-Verbindung hinzufügen';

  @override
  String get connectionEdit => 'Bearbeiten';

  @override
  String get connectionRemove => 'Entfernen';

  @override
  String get connectionVerifiedLabel => 'Diese Verbindung wurde verifiziert.';

  @override
  String get connectionUnverifiedLabel =>
      'Diese Verbindung wurde nicht verifiziert.';

  @override
  String get connectionAddTitle => 'Verbindung hinzufügen';

  @override
  String get connectionTypeLabel => 'Verbindungstyp';

  @override
  String get connectionHandleLabel => 'Handle';

  @override
  String get connectionDomainLabel => 'Domain';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Du hast diese Verbindung bereits.';

  @override
  String get connectionConnectBluesky => 'Mit Bluesky verbinden';

  @override
  String get connectionContinue => 'Weiter';

  @override
  String get connectionVerifyTitle => 'Verbindung verifizieren';

  @override
  String get connectionVerifyInstructions =>
      'Verwende den untenstehenden Eintrag, um den Besitz der Domain nachzuweisen.';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT-Eintrag';

  @override
  String get connectionDnsHostLabel => 'Host';

  @override
  String get connectionDnsValueLabel => 'Wert';

  @override
  String get connectionCopyHost => 'Host kopieren';

  @override
  String get connectionCopyValue => 'Wert kopieren';

  @override
  String get connectionCopied => 'Kopiert!';

  @override
  String get connectionTokenFileTitle => 'Token-Datei bereitstellen';

  @override
  String get connectionTokenFileDescription =>
      'Lade **fluxer-verification** herunter und lege es in deinem **.well-known**-Ordner ab, damit wir die Domain validieren können.';

  @override
  String get connectionTokenFileDownload => 'fluxer-verification herunterladen';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Die Datei enthält das Verifizierungstoken, das wir von **$dnsUrl** abrufen.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'fluxer-verification speichern';

  @override
  String get connectionVerifyButton => 'Verifizieren';

  @override
  String get connectionBack => 'Zurück';

  @override
  String get connectionEditTitle => 'Verbindung bearbeiten';

  @override
  String get connectionEditDescription =>
      'Wähle aus, wer diese Verbindung auf deinem Profil sehen kann.';

  @override
  String get connectionVisibilityEveryone => 'Alle';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Erlaube allen, diese Verbindung auf deinem Profil zu sehen';

  @override
  String get connectionVisibilityFriends => 'Freunde';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Erlaube deinen Freunden, diese Verbindung zu sehen';

  @override
  String get connectionVisibilityCommunityMembers => 'Community-Mitglieder';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Erlaube Mitgliedern aus Communities, in denen du bist, diese Verbindung zu sehen';

  @override
  String get connectionRemoveTitle => 'Verbindung entfernen';

  @override
  String get connectionRemoveDescription =>
      'Bist du sicher, dass du diese Verbindung entfernen möchtest? Diese Aktion kann nicht rückgängig gemacht werden.';

  @override
  String get connectionRemoveConfirm => 'Entfernen';

  @override
  String get connectionsLoadError =>
      'Verbindungen konnten nicht geladen werden';

  @override
  String get connectionsReorderError =>
      'Reihenfolge konnte nicht aktualisiert werden';

  @override
  String get connectionInitiateFailed =>
      'Verifizierung konnte nicht gestartet werden. Versuche es erneut.';

  @override
  String get connectionVerifyFailed =>
      'Verifizierung fehlgeschlagen. Überprüfe deinen DNS-Eintrag und versuche es erneut.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Bluesky-Autorisierung konnte nicht gestartet werden.';

  @override
  String get connectionUpdateFailed =>
      'Verbindung konnte nicht aktualisiert werden';

  @override
  String get connectionRemoveFailed =>
      'Verbindung konnte nicht entfernt werden';

  @override
  String get connectionTokenSavedToast => 'fluxer-verification gespeichert';

  @override
  String get connectionTokenSaveFailedToast =>
      'Datei konnte nicht gespeichert werden';

  @override
  String get connectionEnterHandle => 'Gib einen Bluesky-Handle ein.';

  @override
  String get connectionEnterDomain => 'Gib eine Domain ein.';

  @override
  String get lookAndFeelTitle => 'Aussehen';

  @override
  String get lookAndFeelThemeSectionTitle => 'Theme';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Wähle zwischen dunklem, kohlschwarzem oder hellem Aussehen.';

  @override
  String get lookAndFeelThemeDark => 'Dunkles Theme';

  @override
  String get lookAndFeelThemeCoal => 'Kohle-Theme';

  @override
  String get lookAndFeelThemeLight => 'Helles Theme';

  @override
  String get lookAndFeelThemeSystem => 'System-Theme';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Theme geräteübergreifend synchronisieren';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Wenn aktiviert, werden Designänderungen auf allen deinen Geräten synchronisiert. Wenn deaktiviert, verwendet dieses Gerät seine eigene Designeinstellung.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Das Systemdesign deaktiviert die Synchronisierung automatisch, um die Präferenzen deines Systems auf diesem Gerät zu verfolgen.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Das Design konnte nicht mit deinem Konto synchronisiert werden. Bitte versuche es erneut.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Schriftgrösse im Chat';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Passe die Schriftgrösse im Chatbereich an.';

  @override
  String get lookAndFeelInterfaceTitle => 'Oberfläche';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Passe Oberflächenelemente und -verhalten an.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Tippanzeigen in der Kanalliste';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Wähle aus, wie Tippanzeigen in der Kanalliste erscheinen, wenn jemand in einem Kanal tippt.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Tippanzeige + Avatare';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Zeige die Tippanzeige mit Benutzeravataren in der Kanalliste an';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName => 'Nur Tippanzeige';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Zeige nur die Tippanzeige ohne Avatare an';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Ausgeblendet';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Zeige keine Tippanzeigen in der Kanalliste an';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Tippen im ausgewählten Kanal anzeigen';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Wenn deaktiviert (Standard), werden Tippanzeigen nicht im Kanal angezeigt, den du gerade ansiehst.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'allgemein';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Tastaturhinweise';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Steuere, ob Tastaturkürzelhinweise in Tooltips angezeigt werden.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Tastaturhinweise in Tooltips ausblenden';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Wenn aktiviert, werden Tastaturkürzel-Badges in Tooltip-Popups ausgeblendet.';

  @override
  String get lookAndFeelNekoTitle => 'Sonstiges';

  @override
  String get lookAndFeelNekoDescription => 'Sonstige Oberflächenoptionen.';

  @override
  String get lookAndFeelShowNekoLabel => 'Neko anzeigen';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Wenn aktiviert, erscheint Neko neben dem Chat-Eingabefeld.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Verhalten beim Beitreten zu Sprachkanälen';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Steuere, wie du Sprachkanälen in Gemeinschaften beitrittst.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Doppelklick zum Beitreten zu Sprachkanälen erforderlich';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Wenn aktiviert, musst du auf Sprachkanäle doppelklicken, um ihnen beizutreten. Wenn deaktiviert (Standard), tritt ein einfacher Klick dem Kanal sofort bei.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Franz jagt im komplett verwahrlosten Taxi quer durch Bayern.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Server-Seitenleiste';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Konfiguriere, wie die Server-Seitenleiste Direktnachrichten anzeigt.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count Server sind wegen einer Störung des Flusskondensators vorübergehend nicht verfügbar.',
      one:
          '1 Server ist wegen einer Störung des Flusskondensators vorübergehend nicht verfügbar.',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel => 'DMs in Ordner einklappen';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'Wenn aktiviert, werden ungelesene DMs in der Server-Seitenleiste in einem Ordner auf der Fluxer-Schaltfläche eingeklappt. Klicke auf die Fluxer-Schaltfläche, während du dich auf der DM-Seite befindest, um den Ordner ein- oder auszuklappen.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Kanal-Liste';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Steuere das Verhalten von ungelesenen Markierungen für stummgeschaltete Kanäle in Kanal-Listen.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Ungelesene Markierung in stummgeschalteten Kanälen anzeigen';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Wenn aktiviert, zeigen stummgeschaltete Kanäle eine verblasste Markierung für ungelesene Nachrichten auf der linken Seite an. Erwähnungen erscheinen unabhängig von dieser Einstellung.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Jetzt aktiv';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Steuere, wie „Jetzt aktiv“ in der gesamten App angezeigt wird.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Jetzt aktiv auf der Startseite anzeigen';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Zeige „Jetzt aktiv“ auf der Startseite an, um Freunde anzuzeigen, die in Sprachkanälen aktiv sind. Du siehst eine Vorschau, den Kanal-Kontext, wer bereits da ist, und eine schnelle Möglichkeit, beizutreten.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Favoriten';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Steuere die Sichtbarkeit von Favoriten in der gesamten App.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Favoriten aktivieren';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Wenn aktiviert, kannst du Kanäle zu deinen Favoriten hinzufügen, und sie werden im Abschnitt „Favoriten“ angezeigt. Wenn deaktiviert, werden alle favoritenbezogenen UI-Elemente (Schaltflächen, Menüpunkte) ausgeblendet. Deine vorhandenen Favoriten bleiben erhalten.';

  @override
  String get favoritesTitle => 'Favoriten';

  @override
  String get favoritesEmptyTitle => 'Noch keine Favoriten';

  @override
  String get favoritesEmptyDescription =>
      'Kanalen mit einem Stern im Chat-Header markieren, um sie hier zu behalten.';

  @override
  String get favoritesWelcomeTitle => 'Willkommen bei Favoriten';

  @override
  String get favoritesWelcomeDescription =>
      'Dein persönlicher Bereich für schnellen Zugriff auf Kanäle, Direktnachrichten und Gruppen, die du magst. Tippe auf den Stern bei einem Kanal, um ihn hier hinzuzufügen.';

  @override
  String get favoritesWelcomeTip =>
      'Nichts für dich? Schalte es jederzeit aus.';

  @override
  String get favoritesDisableButton => 'Favoriten deaktivieren';

  @override
  String get favoritesAddedToast => 'Zu Favoriten hinzugefügt';

  @override
  String get favoritesRemovedToast => 'Aus Favoriten entfernt';

  @override
  String get favoritesHiddenToast => 'Favoriten ausgeblendet';

  @override
  String get favoritesMute => 'Favoriten stummschalten';

  @override
  String get favoritesUnmute => 'Favoriten-Stummschaltung aufheben';

  @override
  String get favoritesHeaderMenu => 'Favoriten-Menü';

  @override
  String get favoritesCreateCategory => 'Kategorie erstellen';

  @override
  String get favoritesCategoryNameLabel => 'Kategoriename';

  @override
  String get favoritesHideMutedChannels => 'Stummgeschaltete Kanäle ausblenden';

  @override
  String get favoritesShowMutedChannels => 'Stummgeschaltete Kanäle anzeigen';

  @override
  String get favoritesSetNickname => 'Spitznamen festlegen';

  @override
  String get favoritesNicknameLabel => 'Spitzname';

  @override
  String get favoritesSaveNickname => 'Spitznamen speichern';

  @override
  String get favoritesMoveToCategory => 'In Kategorie verschieben';

  @override
  String get favoritesUncategorized => 'Unkategorisiert';

  @override
  String get favoritesOtherCategory => 'Andere';

  @override
  String get favoritesRemoveFromFavorites => 'Aus Favoriten entfernen';

  @override
  String get favoritesAddToFavorites => 'Zu Favoriten hinzufügen';

  @override
  String get favoritesHideConfirmTitle => 'Favoriten ausblenden';

  @override
  String get favoritesHideConfirmDescription =>
      'Dies blendet alle Favoriten-bezogenen UI-Elemente aus, einschliesslich Schaltflächen und Menüpunkte. Deine bestehenden Favoriten bleiben erhalten und können jederzeit unter Einstellungen > Erweitert > Darstellung wieder aktiviert werden.';

  @override
  String get favoritesDirectMessageSubtitle => 'Direktnachricht';

  @override
  String get messagesMediaDisplayGroupTitle => 'Anzeige';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Steuere, wie Nachrichten, Medien und andere Inhalte angezeigt werden.';

  @override
  String get messagesMediaMediaGroupTitle => 'Medien';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Passe die Grösse von Medien und Schaltflächen an.';

  @override
  String get messagesMediaInputGroupTitle => 'Eingabe';

  @override
  String get messagesMediaInputGroupDescription =>
      'Passe die Einstellungen für die Nachrichteneingabe an.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Seitenleiste';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Konfiguriere, wie die Community-Seitenleiste angezeigt wird.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Stummgeschaltete Kanäle standardmässig ausblenden';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Blendet stummgeschaltete Kanäle in der Seitenleiste automatisch aus, wenn du neuen Communities beitrittst.';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Stummgeschaltete Kanäle standardmässig ausblenden?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Neue Communities, denen du beitrittst, blenden stummgeschaltete Kanäle automatisch aus. Möchtest du diese Einstellung auch auf alle deine bestehenden Communities anwenden?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Stummgeschaltete Kanäle nicht mehr standardmässig ausblenden?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Neue Communities, denen du beitrittst, blenden stummgeschaltete Kanäle nicht mehr automatisch aus. Möchtest du stummgeschaltete Kanäle auch in allen deinen bestehenden Communities anzeigen?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Auf alle Communities anwenden';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'In allen Communities anzeigen';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Nur neue Communities';

  @override
  String get messagesMediaDisplaySectionTitle => 'Medienanzeige';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Steuere, wie Bilder, Videos und andere Medien angezeigt werden. Alle Medien werden skaliert und konvertiert. Extrem grosse Dateien, die nicht in eine Vorschau komprimiert werden können, werden unabhängig von diesen Einstellungen nicht eingebettet.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Wenn als Links im Chat gepostet';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'Wenn direkt in Fluxer hochgeladen';

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Link-Vorschauen';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Steuere, wie Website-Links im Chat in der Vorschau angezeigt werden.';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Embeds anzeigen und Website-Links in der Vorschau anzeigen';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reaktionen';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Emoji-Reaktionen auf Nachrichten konfigurieren';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Emoji-Reaktionen auf Nachrichten anzeigen';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Spoiler-Inhalt';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Steuern, wie Spoiler-Inhalt angezeigt wird';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Spoiler-Inhalt anzeigen';

  @override
  String get messagesMediaSpoilersOnClickName => 'Beim Klicken';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Spoiler-Inhalt beim Klicken anzeigen';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'In Kanälen, die ich moderiere';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Spoiler-Inhalt immer in Kanälen anzeigen, in denen du die Berechtigung „Nachrichten verwalten“ hast';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Immer';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Spoiler-Inhalt immer anzeigen';

  @override
  String get messagesMediaSizeSectionTitle => 'Medien-Grösse';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Die maximale Anzeigegrösse für eingebettete und angehängte Medien anpassen. Kleinere Grössen verbrauchen weniger Speicherplatz, grössere zeigen mehr Details.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Medien von Links (Embeds)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Hochgeladene Anhänge';

  @override
  String get messagesMediaSizeCompactName => 'Kompakt (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Kleinere Mediengrösse';

  @override
  String get messagesMediaSizeComfortableName => 'Komfortabel (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Grössere Mediengrösse mit mehr Details';

  @override
  String get messagesMediaGifsSectionTitle => 'GIF-Verhalten';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Steuern, wie GIFs in den Chat eingefügt werden';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'GIFs automatisch senden, wenn ausgewählt';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Ausdruck-Vervollständigung (Doppelpunkt-Vervollständigung)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Steuern, was in der Ausdruck-Vervollständigung erscheint, wenn du einen Doppelpunkt eingibst. Passe an, welche Vorschläge angezeigt werden, um deinen Vorlieben zu entsprechen.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Standard-Emojis in der Ausdruck-Vervollständigung anzeigen';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Benutzerdefinierte Emojis in der Ausdruck-Vervollständigung anzeigen';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Sticker in der Ausdruck-Vervollständigung anzeigen';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Gespeicherte Medien in der Ausdruck-Vervollständigung anzeigen';

  @override
  String get messagesMediaEditingSectionTitle => 'Nachrichten bearbeiten';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Steuern, was mit deinem Bearbeitungsentwurf geschieht, wenn du abbrichst.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Bearbeitungsentwurf beim Abbrechen beibehalten';

  @override
  String get accessibilityUnreadGroupTitle => 'Ungelesene Anzeigen';

  @override
  String get accessibilityUnreadGroupDescription =>
      'Steuern, wie ungelesene Nachrichtenanzeigen angezeigt werden.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'Gedimmte Anzeige für Ungelesenes in stummgeschalteten Kanälen anzeigen';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'Zeige eine gedimmte Anzeige für Ungelesenes neben stummgeschalteten Direktnachrichten und Kanälen an, damit du auf einen Blick sehen kannst, wenn es Aktivität gibt.';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'DM-Nachrichten-Vorschauen';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Steuern, wann Nachrichten-Vorschauen in der DM-Liste angezeigt werden.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'DM-Nachrichten-Vorschau-Modus';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Alle Nachrichten';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Nachrichten-Vorschauen für alle DM-Konversationen anzeigen';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Nur ungelesene DMs';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Nachrichten-Vorschauen nur für DMs mit ungelesenen Nachrichten anzeigen';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Keine';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Keine Nachrichten-Vorschauen in der DM-Liste anzeigen';

  @override
  String get dmListSentAnAttachment => 'Hat einen Anhang gesendet';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username hat eine Nachricht an diesen Kanal angeheftet.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username hat $userName zur Gruppe hinzugefügt.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username hat jemanden zur Gruppe hinzugefügt.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username hat die Gruppe verlassen.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username hat $userName aus der Gruppe entfernt.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username hat jemanden aus der Gruppe entfernt.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username hat den Kanalnamen in $newName geändert.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username hat den Kanalnamen geändert.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username hat das Kanalbild geändert.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username hat einen Anruf gestartet.';
  }

  @override
  String get voiceConnectionConfirmTitle => 'Stimmverbindungsbestätigung';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Du bist bereits von $count anderen Geräten mit diesem Sprachkanal verbunden. Was möchtest du tun?',
      one:
          'Du bist bereits von 1 anderen Gerät mit diesem Sprachkanal verbunden. Was möchtest du tun?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Zu diesem Gerät wechseln';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Einfach beitreten (andere Verbindungen beibehalten)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Nichts tun, ich möchte nicht beitreten';

  @override
  String get voiceChannelEmptyDescription =>
      'Dies ist ein Sprachkanal. Verbinde dich, um zu sprechen!';

  @override
  String get voiceChannelJoin => 'Sprachkanal beitreten';

  @override
  String get voiceChannelJoinConnect => 'Mit Sprache verbinden';

  @override
  String get voiceChannelNoConnectPermission =>
      'Du hast keine Berechtigung, diesem Sprachkanal beizutreten';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Mikrofon-, Kamera- und Bildschirmfreigabeinhalte sind Ende-zu-Ende-verschlüsselt.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Mikrofon-, Kamera- und Bildschirmfreigabeinhalte sind Ende-zu-Ende-verschlüsselt.';

  @override
  String get voiceChannelE2eeBroken =>
      'Ende-zu-Ende-Verschlüsselung ist nicht verfügbar, da ein nicht unterstützter Teilnehmer in diesem Sprachkanal ist.';

  @override
  String get voiceCallE2eeBroken =>
      'Ende-zu-Ende-Verschlüsselung ist nicht verfügbar, da ein nicht unterstützter Teilnehmer in diesem Anruf ist.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Dieser Client muss aktualisiert werden, bevor er diesem verschlüsselten Anruf beitritt.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Dein Mikrofon konnte nicht gestartet werden. Du bist noch im Anruf.';

  @override
  String get voiceChannelStatusConnecting => 'Verbinde...';

  @override
  String get voiceChannelStatusConnected => 'Verbunden';

  @override
  String get voiceChannelStatusError => 'Fehler';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Mobiles Gerät';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Desktop-Gerät';

  @override
  String get voiceParticipantTooltipCommunityMuted =>
      'Von der Community stummgeschaltet';

  @override
  String get voiceParticipantTooltipMuted => 'Stummgeschaltet';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Von der Community taubgeschaltet';

  @override
  String get voiceParticipantTooltipDeafened => 'Taubgeschaltet';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Verbindung: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Teilnehmer',
      one: '1 Teilnehmer',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Verlassen';

  @override
  String get voiceControlMute => 'Stummschalten';

  @override
  String get voiceControlUnmute => 'Stummschaltung aufheben';

  @override
  String get voiceControlDeafen => 'Taubschalten';

  @override
  String get voiceControlUndeafen => 'Taubschaltung aufheben';

  @override
  String get voiceControlVideo => 'Video';

  @override
  String get voiceControlScreenShare => 'Bildschirmfreigabe';

  @override
  String get voiceScreenShareNotificationText =>
      'Dein Bildschirm wird geteilt.';

  @override
  String get voiceControlMore => 'Mehr';

  @override
  String get voiceControlDisconnect => 'Trennen';

  @override
  String get voiceControlChat => 'Chat';

  @override
  String get voiceTextChatShow => 'Chat anzeigen';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# ungelesenen Nachrichten',
      one: '1 ungelesener Nachricht',
    );
    return 'Chat anzeigen mit $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Kamera-Berechtigung ist für Video erforderlich.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Bildschirmfreigabe konnte nicht gestartet werden. Bitte versuche es erneut.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Berechtigung zur Bildschirmfreigabe wurde verweigert.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Bildschirmfreigabe ist auf diesem Gerät nicht verfügbar.';

  @override
  String get voiceWatchStream => 'Stream ansehen';

  @override
  String get voiceStopWatching => 'Stoppe Beobachtung';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Aktuellen Stream nicht mehr ansehen';

  @override
  String get voiceOwnScreenShareTitle => 'Du sendest';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Dein Stream ist für Teilnehmende live.';

  @override
  String get voiceLiveBadge => 'LIVE';

  @override
  String get dmVoiceViewCall => 'Anruf ansehen';

  @override
  String get dmVoiceCallFullScreen => 'Vollbild';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Anruf im Vollbild öffnen';

  @override
  String get dmVoiceStripStatusConnecting => 'Verbinde…';

  @override
  String get dmVoiceStripStatusInCall => 'Im Anruf';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Sprachanruf';

  @override
  String get dmVoiceCallBarConnecting => 'Verbinde…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Direkter Anruf';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Gruppenanruf';

  @override
  String get dmVoiceCallBarIssueFallback => 'Sprachproblem';

  @override
  String get dmVoiceFullscreenTitle => 'Sprache';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Sprache verbunden';

  @override
  String get notificationsPageTitle => 'Benachrichtigungen';

  @override
  String get notificationsFilterUnreads => 'Ungelesene';

  @override
  String get notificationsFilterMentions => 'Erwähnungen';

  @override
  String get notificationsBookmarksTooltip => 'Lesezeichen';

  @override
  String get notificationsMentionFilterTooltip => 'Erwähnungen filtern';

  @override
  String get notificationsMentionFiltersTitle => 'Erwähnungsfilter';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Einschliesslich @everyone und @here Erwähnungen';

  @override
  String get notificationsMentionIncludeRoles =>
      'Rollen-Erwähnungen einschliessen';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Alle Community-Erwähnungen einschliessen';

  @override
  String get notificationsNoUnreadTitle => 'Keine ungelesenen Nachrichten';

  @override
  String get notificationsNoUnreadBody => 'Du bist auf dem neuesten Stand.';

  @override
  String get notificationsNoMentionsTitle => 'Keine aktuellen Erwähnungen';

  @override
  String get notificationsNoMentionsBody =>
      'Alle @Erwähnungen von dir erscheinen hier für 7 Tage.';

  @override
  String get notificationsMentionsEndTitle => 'Du hast das Ende erreicht';

  @override
  String get notificationsMentionsEndBody =>
      'Du hast alle deine aktuellen Erwähnungen gesehen. Keine Sorge, bald erscheinen hier mehr.';

  @override
  String get notificationsJump => 'Springen';

  @override
  String get notificationsRemoveMentionTooltip => 'Erwähnung entfernen';

  @override
  String get notificationsViewAllUnread => 'Alle ungelesenen anzeigen';

  @override
  String get notificationsMarkAsRead => 'Als gelesen markieren';

  @override
  String get notificationsExpand => 'Erweitern';

  @override
  String get notificationsCollapse => 'Einklappen';

  @override
  String get notificationsMessageUnavailable =>
      'Diese Nachricht konnte nicht geladen werden.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining Zeichen übrig';
  }

  @override
  String get characterCounterTooLong => 'Nachricht ist zu lang';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining Zeichen übrig. Hol dir $productName, um bis zu $premiumMaxLength Zeichen zu schreiben.';
  }

  @override
  String get chatMessageFailedToSend =>
      'Nachricht konnte nicht gesendet werden';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Deine Nachricht konnte nicht zugestellt werden. Das liegt meist daran, dass du keine Community mit dem Empfänger teilst oder der Empfänger nur Direktnachrichten von Freunden akzeptiert. Möglicherweise musst du auch deine eigenen Datenschutzeinstellungen für Direktnachrichten in $settingsPath anpassen.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Deine Nachricht konnte nicht zugestellt werden. Du musst dein Konto beanspruchen, um Direktnachrichten senden zu können.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Deine Nachricht konnte nicht zugestellt werden. Du musst dein Konto beanspruchen, um Nachrichten senden zu können.';

  @override
  String get chatSendFailureContentBlocked =>
      'Deine Nachricht konnte nicht zugestellt werden, da sie von unseren Sicherheitssystemen markiert wurde. Wenn du glaubst, dass dies ein Fehler ist, kontaktiere bitte den Support.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Deine Nachricht konnte nicht zugestellt werden, da sie jugendgefährdende Emojis oder Sticker enthält, die in diesem Kontext nicht erlaubt sind.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'Nur du kannst diese Nachricht sehen.';

  @override
  String get chatClientSystemDismiss => 'Schliessen';

  @override
  String get privacyDashboardCommunicationSection => 'Kommunikation';

  @override
  String get chatMessageDeleteFailed =>
      'Nachricht konnte nicht gelöscht werden';

  @override
  String get chatMessageAddReaction => 'Reaktion hinzufügen';

  @override
  String get chatMessageEdit => 'Nachricht bearbeiten';

  @override
  String get chatMessageReply => 'Antworten';

  @override
  String get chatMessageForward => 'Weiterleiten';

  @override
  String get forwardMessageTitle => 'Nachricht weiterleiten';

  @override
  String get forwardSearchHint => 'Kanäle oder Direktnachrichten suchen';

  @override
  String get forwardDirectMessagesSection => 'Direktnachrichten';

  @override
  String get forwardCommentHint => 'Kommentar hinzufügen (optional)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Senden ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Keine Kanäle gefunden';

  @override
  String get forwardSuccessToast => 'Nachricht weitergeleitet';

  @override
  String get forwardFailed => 'Nachricht konnte nicht weitergeleitet werden';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Kommentare sind nicht verfügbar, da für einen ausgewählten Kanal der Zeitlupenmodus aktiviert ist.';

  @override
  String get forwardDestinationNoSendPermission =>
      'Du kannst hier keine Nachrichten senden';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Du kannst hier keine Links einbetten';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Du kannst hier keine Dateien anhängen';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Nachrichten senden ist in dieser Community deaktiviert';

  @override
  String get forwardDestinationTimedOut =>
      'Du bist in dieser Community auf Zeitlimit';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Zeitlupenmodus – warte $remaining';
  }

  @override
  String get chatMessageCopyText => 'Nachricht kopieren';

  @override
  String get chatMessagePin => 'Nachricht anheften';

  @override
  String get chatMessageUnpin => 'Nachricht lösen';

  @override
  String get chatMessageUnpinIt => 'Lösen';

  @override
  String get chatMessageBookmark => 'Nachricht als Lesezeichen speichern';

  @override
  String get chatMessageRemoveBookmark => 'Lesezeichen entfernen';

  @override
  String get chatMessageMarkAsUnread => 'Als ungelesen markieren';

  @override
  String get chatMessageCopyMessageLink => 'Nachrichtenlink kopieren';

  @override
  String get chatMessageCopyMessageId => 'Nachrichten-ID kopieren';

  @override
  String get chatMessageViewReactions => 'Reaktionen anzeigen';

  @override
  String get chatMessageRemoveAllReactions => 'Alle Reaktionen entfernen';

  @override
  String get chatMessageDebug => 'Nachricht debuggen';

  @override
  String get chatMessageDebugSheetTitle => 'Nachricht debuggen';

  @override
  String get chatMessageDebugCopyJson => 'JSON kopieren';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'Nachrichten-JSON in die Zwischenablage kopiert';

  @override
  String get chatReactionsSheetTitle => 'Reaktionen';

  @override
  String get chatReactionsSheetEmpty => 'Niemand hat bisher darauf reagiert.';

  @override
  String get chatMessageReport => 'Nachricht melden';

  @override
  String get iarReportMessageTitle => 'Nachricht melden';

  @override
  String get iarThisUserFallback => 'diesem Benutzer';

  @override
  String get iarModalDescription =>
      'Regelverstoss melden oder Werkzeuge zur Verwaltung von Kontakten und Präferenzen finden.';

  @override
  String get iarPathStepAriaLabel => 'Was brauchst du?';

  @override
  String get iarCategoryStepTitle => 'Welche Art von Regel wurde gebrochen?';

  @override
  String get iarReasonStepTitle => 'Welche Regel wurde gebrochen?';

  @override
  String get iarReasonSelectHint => 'Grund auswählen';

  @override
  String get iarPickAnOptionToast => 'Wähle eine Option, um fortzufahren.';

  @override
  String get iarPickARuleToast => 'Wähle die gebrochene Regel aus.';

  @override
  String get iarPathPlatform => 'Regelverstoss gegen die Plattform melden';

  @override
  String get iarPathCommunity => 'An die Moderatoren dieser Community melden';

  @override
  String get iarPathPreferenceMessage => 'Ich mag diese Inhalte nicht';

  @override
  String get iarCategoryTargetedHarmLabel =>
      'Bedrohungen, Belästigung oder Schaden';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Mobbing, Drohungen, Hass, Gewalt, Razzien oder Inhalte, die Selbstverletzung fördern.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Kinderschutz oder jugendgefährdende Inhalte';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Minderjährige in Gefahr, jugendgefährdende Inhalte am falschen Ort oder unerwünschtes Verhalten.';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'Privatsphäre oder Identitätsdiebstahl';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxing, Stalking, sich als jemand ausgeben oder ein unangemessenes Profil.';

  @override
  String get iarCategoryDeceptionLabel =>
      'Betrug, Malware oder Fehlinformationen';

  @override
  String get iarCategoryDeceptionDescription =>
      'Phishing, Betrug, bösartige Links oder falsche Behauptungen, die wahrscheinlich zu realem Schaden führen.';

  @override
  String get iarCategoryIllegalOtherLabel =>
      'Illegale Aktivität oder etwas anderes';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Illegale Verkäufe, kriminelle Erleichterung oder ein klarer Regelverstoss, der nicht oben passt.';

  @override
  String get iarReasonHarassmentLabel => 'Belästigung oder Drohungen';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Mobbing, wiederholter unerwünschter Kontakt, Stalking oder gezielte Belästigung.';

  @override
  String get iarReasonHateLabel => 'Hassrede';

  @override
  String get iarReasonHateMessageDescription =>
      'Schimpfwörter, entmenschlichende Sprache oder Angriffe auf geschützte Gruppen.';

  @override
  String get iarReasonViolenceLabel => 'Gewalt oder Gewaltdrohungen';

  @override
  String get iarReasonViolenceDescription =>
      'Glaubwürdige Drohungen, grafische Gewalt oder Verherrlichung von Gewalt.';

  @override
  String get iarReasonMatureContentLabel =>
      'Jugendgefährdende Inhalte oder Belästigung';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Unerwünschtes Verhalten oder jugendgefährdende Inhalte am falschen Ort.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Kinderschutz oder Ausbeutung von Minderjährigen';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Grooming oder Inhalte zur Ausbeutung von Minderjährigen.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Schädliche Fehlinformationen';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Falsche Behauptungen, die wahrscheinlich zu realem Schaden führen.';

  @override
  String get iarReasonSpamLabel => 'Spam, Betrug oder Phishing';

  @override
  String get iarReasonSpamMessageDescription =>
      'Massen-Spam, Betrug, gefälschte Gewinnspiele oder Missbrauch von Konten.';

  @override
  String get iarReasonMalwareLabel => 'Malware oder gefährliche Links';

  @override
  String get iarReasonMalwareDescription =>
      'Malware, Diebstahl von Anmeldedaten oder schädliche Dateien.';

  @override
  String get iarReasonPrivacyLabel => 'Verletzung der Privatsphäre';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxing, offengelegte private Informationen oder Stalking.';

  @override
  String get iarReasonImpersonationLabel =>
      'Identitätsdiebstahl oder täuschende Medien';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Sich als jemand anderes ausgeben, einschliesslich täuschender KI-generierter Inhalte.';

  @override
  String get iarReasonIllegalLabel => 'Illegale Aktivität';

  @override
  String get iarReasonIllegalDescription =>
      'Illegale Verkäufe, kriminelle Erleichterung oder rechtswidrige Aktivitäten.';

  @override
  String get iarReasonSelfHarmLabel => 'Selbstverletzung oder Suizid';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Förderung oder Anleitungen zu Selbstverletzung oder Essstörungen.';

  @override
  String get iarReasonOtherLabel => 'Ein anderer klarer Regelverstoss';

  @override
  String get iarReasonOtherDescription =>
      'Nur verwenden, wenn es eindeutig gegen die Regeln von Fluxer verstösst und nicht oben passt.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Wenn ein Minderjähriger beteiligt ist, verwenden Sie stattdessen \"$childSafetyReason\".';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Wenn es sich um CSAM oder die Ausbeutung eines Minderjährigen handelt, senden Sie es jetzt und teilen Sie das Material nicht erneut.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Wenn jemand in unmittelbarer Gefahr sein könnte, kontaktieren Sie die örtlichen Rettungsdienste, wenn Sie dies sicher tun können.';

  @override
  String get iarSafetyNoteViolence =>
      'Wenn dies eine glaubwürdige unmittelbare Bedrohung ist, kontaktieren Sie ebenfalls die örtlichen Rettungsdienste.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Wenn dies eine unmittelbare terroristische Bedrohung ist, kontaktieren Sie ebenfalls die örtlichen Rettungsdienste.';

  @override
  String get iarActionBlockUserTitle => 'Diesen Benutzer blockieren';

  @override
  String get iarActionBlockUserDescription =>
      'Nachrichten und Freundschaftsanfragen stoppen.';

  @override
  String get iarActionBlockUserButton => 'Blockieren';

  @override
  String get iarActionCopyMessageLinkTitle => 'Nachrichtenlink kopieren';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Mit Community-Mods teilen.';

  @override
  String get iarActionCopyMessageLinkButton => 'Kopieren';

  @override
  String get iarActionCloseDmTitle => 'Diese Direktnachricht schliessen';

  @override
  String get iarActionCloseDmDescription =>
      'Blockiert nicht. Kann später wieder geöffnet werden.';

  @override
  String get iarActionCloseDmButton => 'DM schließen';

  @override
  String get iarActionLeaveCommunityTitle => 'Community verlassen';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Keine Inhalte und Mitglieder mehr sehen.';

  @override
  String get iarActionLeaveCommunityButton => 'Verlassen';

  @override
  String get iarActionDmSettingsTitle =>
      'DM- & Freundschaftsanfragen-Einstellungen';

  @override
  String get iarActionDmSettingsDescription =>
      'Ändere, wer dich erreichen kann.';

  @override
  String get iarActionCallSettingsTitle => 'Anruf- & Gruppenchat-Einstellungen';

  @override
  String get iarActionCallSettingsDescription =>
      'Ändere, wer dich anrufen oder hinzufügen kann.';

  @override
  String get iarActionOpenButton => 'Öffnen';

  @override
  String get iarActionDeleteMessageTitle => 'Diese Nachricht löschen';

  @override
  String get iarActionDeleteMessageDescription =>
      'Entferne sie für alle aus dem Kanal.';

  @override
  String get iarActionDeleteMessageButton => 'Löschen';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Gelöscht';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Diese Nachricht wurde bereits gelöscht.';

  @override
  String get iarActionBanUserTitle => 'Diesen Benutzer sperren';

  @override
  String get iarActionBanUserDescription =>
      'Öffne den Sperrdialog für diese Community.';

  @override
  String get iarActionBanUserButton => 'Sperren';

  @override
  String get iarActionBanUserBannedButton => 'Gesperrt';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Dieser Benutzer ist bereits aus der Community gesperrt.';

  @override
  String get iarCloseDmConfirmTitle => 'DM schließen';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Schliesse deine aktuelle DM mit $name. Das blockiert sie nicht; du kannst sie später wieder öffnen.';
  }

  @override
  String get iarSuccessTitle => 'Meldung gesendet';

  @override
  String get iarSuccessBody =>
      'Unser Sicherheitsteam prüft sie. Wir senden dir eine DM und E-Mail, sobald wir eine Entscheidung getroffen haben.';

  @override
  String get iarAlreadyReportedTitle => 'Bereits gemeldet';

  @override
  String get iarAlreadyReportedBody =>
      'Du hast diese Nachricht bereits gemeldet. Unser Sicherheitsteam prüft sie.';

  @override
  String get iarBackButton => 'Zurück';

  @override
  String get iarContinueButton => 'Weiter';

  @override
  String get iarSendReportButton => 'Meldung senden';

  @override
  String get iarDoneButton => 'Fertig';

  @override
  String get iarCouldntSendToast =>
      'Meldung konnte nicht gesendet werden. Bitte versuche es erneut.';

  @override
  String get iarRateLimitedToast =>
      'Du meldest zu schnell. Bitte warte einen Moment und versuche es erneut.';

  @override
  String get iarReportSentToast =>
      'Meldung gesendet. Unser Sicherheitsteam wird sie prüfen.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Blockiere $name? Sie können dir keine Nachrichten mehr senden oder Freundschaftsanfragen stellen. Du kannst sie später wieder entsperren.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Dieser Benutzer konnte nicht blockiert werden. Bitte versuche es erneut.';

  @override
  String get iarCloseDmSuccessToast => 'DM geschlossen.';

  @override
  String get iarCloseDmFailedToast =>
      'Diese DM konnte nicht geschlossen werden. Bitte versuche es erneut.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Diese Community konnte nicht verlassen werden. Bitte versuche es erneut.';

  @override
  String get chatMessageSuppressEmbeds => 'Einbettungen unterdrücken';

  @override
  String get chatMessageUnsuppressEmbeds => 'Einbettungen wieder anzeigen';

  @override
  String get chatMessageDelete => 'Nachricht löschen';

  @override
  String get chatMessageDeleteConfirmTitle => 'Nachricht löschen';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Möchtest du diese Nachricht wirklich löschen?';

  @override
  String get chatMessageMore => 'Mehr';

  @override
  String get chatEditingMessage => 'Nachricht wird bearbeitet';

  @override
  String get chatReplyOriginalDeleted => 'Originalnachricht wurde gelöscht';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Originalnachricht konnte nicht geladen werden';

  @override
  String get chatReplyAttachedMedia => 'Nachricht enthält angehängte Medien';

  @override
  String get chatMessagesLoadError =>
      'Nachrichten konnten nicht geladen werden.';

  @override
  String get chatReplyMentionOverrideTitle =>
      'Erwähnungseinstellung überschreiben?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname möchte lieber mit @erwähnt werden, wenn geantwortet wird. Trotzdem ohne Erwähnung senden?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname bevorzugt Antworten ohne @Erwähnung. Trotzdem mit Erwähnung senden?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Präferenz ignorieren';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Klicke, um die Person, auf die du antwortest, nicht zu pingen.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Klicke, um die Person, auf die du antwortest, zu pingen.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Antwortende Person erwähnen';

  @override
  String get chatReplyMentionOn => 'An';

  @override
  String get chatReplyMentionOff => 'Aus';

  @override
  String get chatReplyCancel => 'Antwort abbrechen';

  @override
  String get chatEditMessageHint => 'Nachricht bearbeiten';

  @override
  String get chatEditNoChanges => 'Keine Änderungen zum Speichern';

  @override
  String get chatChannelNotReady =>
      'Dieser Kanal ist noch nicht bereit. Versuche es gleich noch einmal.';

  @override
  String get chatMessageEdited => '(bearbeitet)';

  @override
  String get chatMessageSilent => 'Dies war eine @silent-Nachricht.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Heute um $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Gestern um $time';
  }

  @override
  String get mediaViewerImagePreview => 'Bildvorschau';

  @override
  String get mediaViewerClose => 'Medienanzeige schliessen';

  @override
  String get mediaViewerOpenInBrowser => 'Im Browser öffnen';

  @override
  String get mediaViewerForward => 'Weiterleiten';

  @override
  String get mediaViewerZoomIn => 'Vergrössern';

  @override
  String get mediaViewerZoomOut => 'Verkleinern';

  @override
  String get mediaViewerPreviousAttachment => 'Vorheriger Anhang';

  @override
  String get mediaViewerNextAttachment => 'Nächster Anhang';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String get chatAttachmentVideoToggleControls =>
      'Videosteuerung ein-/ausblenden';

  @override
  String get chatAttachmentVideoMute => 'Video stummschalten';

  @override
  String get chatAttachmentVideoUnmute => 'Video-Ton einschalten';

  @override
  String get chatAttachmentVideoPlay => 'Video abspielen';

  @override
  String get chatAttachmentVideoPause => 'Video pausieren';

  @override
  String get chatAttachmentVideoProgress => 'Video-Fortschritt';

  @override
  String get chatVideoPlaybackFailed =>
      'Dieses Video konnte nicht abgespielt werden.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Benachrichtige Benutzer mit dieser Rolle, die Zugriff auf diesen Kanal haben.';

  @override
  String get addGuildModalTitle => 'Community hinzufügen';

  @override
  String get addGuildModalLandingDescription =>
      'Erstelle eine neue Community oder tritt einer bestehenden bei.';

  @override
  String get addGuildCreateCommunity => 'Community erstellen';

  @override
  String get addGuildJoinCommunity => 'Community beitreten';

  @override
  String get addGuildImportDiscordTemplate => 'Discord-Vorlage importieren';

  @override
  String get addGuildJoinTitle => 'Einer Community beitreten';

  @override
  String get addGuildJoinDescription =>
      'Gib den Einladungslink ein, um einer Community beizutreten.';

  @override
  String get addGuildInviteLinkLabel => 'Einladungslink';

  @override
  String get addGuildJoinSubmit => 'Community beitreten';

  @override
  String get addGuildInviteInvalid =>
      'Diese Einladung ist ungültig oder abgelaufen.';

  @override
  String get addGuildJoinFailed =>
      'Der Beitritt zur Community ist fehlgeschlagen. Bitte versuche es erneut.';

  @override
  String get addGuildPackInstalled => 'Paket erfolgreich installiert.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Alle Reaktionen entfernen';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Möchtest du wirklich alle Reaktionen von dieser Nachricht entfernen?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Nachricht lösen';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Diese Markierung in der Zeit zurückschicken?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username hat $messageLink in diesem Kanal angepinnt. Sieh dir $allPinsLink an.';
  }

  @override
  String get systemPinMessageMessageLink => 'eine Nachricht';

  @override
  String get systemPinMessageAllPinsLink => 'alle angepinnten Nachrichten';

  @override
  String get channelPinsEmptyTitle => 'Keine angepinnten Nachrichten';

  @override
  String get channelPinsEmptyDescription =>
      'Hier werden angepinnten Nachrichten angezeigt.';

  @override
  String get personalNotesTitle => 'Persönliche Notizen';

  @override
  String get personalNotesSubtitle =>
      'Dein privater Bereich für Gedanken und Erinnerungen';

  @override
  String channelWelcomeHeading(String channelName) {
    return 'Willkommen in $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'Am Anfang war nichts. Dann kam $channelName. Und es war gut.';
  }

  @override
  String get personalNotesComposerHint => 'Schreib dir selbst eine Nachricht';

  @override
  String get personalNotesPrivateSpace => 'Dein privater Bereich';

  @override
  String get purgePersonalNotes => 'Persönliche Notizen löschen';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Dadurch werden alle Nachrichten und Anhänge in deinen persönlichen Notizen dauerhaft gelöscht. Dies kann nicht rückgängig gemacht werden.';

  @override
  String get purgePersonalNotesConfirmButton => 'Löschen';

  @override
  String purgePersonalNotesSuccess(int count) {
    return '$count Nachrichten aus persönlichen Notizen gelöscht';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Persönliche Notizen waren bereits leer';

  @override
  String get purgePersonalNotesFailed =>
      'Persönliche Notizen konnten nicht geleert werden';

  @override
  String get userSettingsGroupYourAccount => 'DEIN KONTO';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Sicherheit & Anmeldung';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Geschenke & Codes';

  @override
  String get userSettingsNavPrivacyDashboard => 'Datenschutz-Dashboard';

  @override
  String get userSettingsNavAuthorizedApps => 'Autorisierte Apps';

  @override
  String get userSettingsNavBlockedUsers => 'Blockierte Benutzer';

  @override
  String get userSettingsNavLinkedDevices => 'Verbundene Geräte';

  @override
  String get userSettingsNavConnections => 'Verbindungen';

  @override
  String get userSettingsNavLookAndFeel => 'Aussehen';

  @override
  String get userSettingsNavAccessibility => 'Bedienungshilfen';

  @override
  String get userSettingsNavChat => 'Nachrichten & Medien';

  @override
  String get userSettingsNavAudioAndVideo => 'Audio & Video';

  @override
  String get userSettingsNavLanguageAndTime => 'Sprache & Zeit';

  @override
  String get userSettingsNavAdvanced => 'Erweitert';

  @override
  String get advancedPerformanceReportingTitle => 'Leistungsberichte';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Hilf mit, Fluxer zu verbessern, indem du anonyme Absturz- und Leistungsdaten teilst.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Absturz- und Leistungsberichte senden';

  @override
  String get advancedPerformanceReportingDescription =>
      'Alle gemeldeten Daten sind anonym und werden nur an Fluxers eigenen Überwachungsdienst gesendet – es werden keine Drittanbieter verwendet.';

  @override
  String get userSettingsNavApplications => 'Anwendungen';

  @override
  String get userSettingsNavAppLogs => 'App-Protokolle';

  @override
  String get userSettingsNavDeveloperTools => 'Entwicklerwerkzeuge';

  @override
  String get userSettingsNavLimitsConfig => 'Limits-Konfiguration';

  @override
  String get userSettingsNavFeatureFlags => 'Feature Flags';

  @override
  String get userSettingsNavWhatsNew => 'Neues';

  @override
  String get userSettingsNavLogOut => 'Abmelden';

  @override
  String get betaWarningTitle => 'Beta-Software';

  @override
  String get betaWarningMessage =>
      'Dies ist Beta-Software. Noch ist nicht alles fertig oder hinzugefügt.';

  @override
  String get betaWarningReportIssues =>
      'Bitte melde alle Probleme, die du findest, an die Fluxer Mobile Community (du benötigst derzeit Plutonium, um der Community beitreten zu können).';

  @override
  String get betaWarningRepoLink => 'Quelle auf GitHub anzeigen';

  @override
  String get betaWarningGotIt => 'Verstanden';

  @override
  String get quickSwitcherTabSearch => 'Suchen';

  @override
  String get quickSwitcherTabFriends => 'Freunde';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Kanäle, Personen oder Communities suchen';

  @override
  String get quickSwitcherSearchFriends => 'Freunde suchen';

  @override
  String get quickSwitcherNoMatchesFound => 'Keine Treffer gefunden';

  @override
  String get quickSwitcherEmptyHint =>
      'Versuche einen anderen Namen oder benutze die Präfixe @ / # / ! / *, um Ergebnisse zu filtern.';

  @override
  String get quickSwitcherSectionPeople => 'Personen';

  @override
  String get quickSwitcherSectionGroupMessages => 'Gruppennachrichten';

  @override
  String get quickSwitcherSectionTextChannels => 'Textkanäle';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Sprachkanäle';

  @override
  String get quickSwitcherSectionCommunities => 'Communities';

  @override
  String get quickSwitcherSectionSettings => 'Einstellungen';

  @override
  String get quickSwitcherHomeLabel => 'Home';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Direktnachrichten';

  @override
  String get quickSwitcherFavoritesLabel => 'Favoriten';

  @override
  String get quickSwitcherUserSettingsLabel => 'Benutzereinstellungen';

  @override
  String get quickSwitcherNotificationsLabel => 'Benachrichtigungen';

  @override
  String get quickSwitcherBookmarksLabel => 'Lesezeichen';

  @override
  String get quickSwitcherMentionsLabel => 'Erwähnungen';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Noch keine Freunde';

  @override
  String get quickSwitcherFriendsEmptyHint =>
      'Füge einen Freund hinzu, um loszulegen.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Keine Freunde entsprechen dieser Suche';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Versuche einen anderen Namen.';

  @override
  String get quickSwitcherSearchAliasUser => 'Benutzer';

  @override
  String get quickSwitcherSearchAliasYou => 'Du';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'DMs';

  @override
  String get quickSwitcherSearchAliasMessages => 'Nachrichten';

  @override
  String get quickSwitcherSearchAliasFav => 'Fav';

  @override
  String get quickSwitcherSearchAliasStarred => 'Markiert';

  @override
  String get quickSwitcherSearchAliasInbox => 'Posteingang';

  @override
  String get quickSwitcherSearchAliasSaved => 'Gespeichert';

  @override
  String get uiClose => 'Schliessen';

  @override
  String get chatJumpToBottom => 'Zum Ende springen';

  @override
  String get uiConfirm => 'Bestätigen';

  @override
  String get uiLoading => 'Lädt';

  @override
  String get uiUnsavedChanges => 'Ungespeicherte Änderungen';

  @override
  String get uiReset => 'Zurücksetzen';

  @override
  String get uiOpenColorPicker => 'Farbwähler öffnen';

  @override
  String get uiSelectPlaceholder => 'Auswählen';

  @override
  String get uiSearchPlaceholder => 'Suchen';

  @override
  String get uiNoOptionsFound => 'Keine Optionen gefunden';

  @override
  String get uiDismissNotification => 'Benachrichtigung schliessen';

  @override
  String get uiColorPickerTitle => 'Farbwähler';

  @override
  String get mentionConfirmTitle => 'Alle erwähnen?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Dies benachrichtigt $count Mitglieder. Fortfahren?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Dies benachrichtigt $count Online-Mitglieder. Fortfahren?';
  }

  @override
  String get mentionConfirmButton => 'Erwähnen';

  @override
  String get composerEmojiUnavailable =>
      'Du kannst dieses Emoji hier nicht verwenden.';

  @override
  String get instanceUrlLabel => 'Instanz-URL';

  @override
  String get instanceUrlPlaceholder =>
      'Instanz-URL eingeben (z. B. fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Auf Fluxer zurücksetzen';

  @override
  String get instanceConnect => 'Verbinden';

  @override
  String get instanceConnecting => 'Verbinde…';

  @override
  String get instanceConnectFailed => 'Verbindung zur Instanz fehlgeschlagen';

  @override
  String get recentInstances => 'Kürzliche Instanzen';

  @override
  String removeRecentInstance(String domain) {
    return '$domain von kürzlichen Instanzen entfernen';
  }

  @override
  String get instanceSheetTitle => 'Mit Instanz verbinden';

  @override
  String get connectToDifferentInstance => 'Mit anderer Instanz verbinden';

  @override
  String get changeInstance => 'Ändern';

  @override
  String get instanceConnectionRequired =>
      'Verbinde dich mit der Instanz, um dich anzumelden';

  @override
  String get comingSoon => 'Bald verfügbar';

  @override
  String get guildNavbarDirectMessages => 'Direktnachrichten';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Entdeckbare Communities durchsuchen';

  @override
  String get discoveryExplore => 'Entdecken';

  @override
  String get discoveryExplorePublicCommunities =>
      'Öffentliche Communities durchsuchen';

  @override
  String get discoveryListingSubheading =>
      'Möchtest du deine Community hier auflisten? Bewirb dich, wenn du die Anforderungen in den Einstellungen deiner Community > Entdecken erfüllst.';

  @override
  String get discoverySearchCommunities => 'Communities suchen';

  @override
  String get discoveryFilterByLanguage => 'Nach Sprache filtern';

  @override
  String get discoveryAllLanguages => 'Alle Sprachen';

  @override
  String get discoveryAllCategories => 'Alle';

  @override
  String get discoveryCategoryGaming => 'Gaming';

  @override
  String get discoveryCategoryMusic => 'Musik';

  @override
  String get discoveryCategoryEntertainment => 'Unterhaltung';

  @override
  String get discoveryCategoryEducation => 'Bildung';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Wissenschaft & Technik';

  @override
  String get discoveryCategoryContentCreator => 'Content Creator';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime & Manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Filme & TV';

  @override
  String get discoveryCategoryOther => 'Andere';

  @override
  String get discoveryNoCommunitiesMatch => 'Keine Communities passen.';

  @override
  String get discoveryJoinCommunity => 'Community beitreten';

  @override
  String get discoveryJoined => 'Beigetreten';

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
      other: '$countString Mitglieder',
      one: '1 Mitglied',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Keine Beschreibung.';

  @override
  String get discoveryCommunities => 'Communities';

  @override
  String get discoveryApps => 'Apps';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Diese Community konnte nicht beigetreten werden';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Etwas ist schiefgelaufen. Bitte versuche es gleich noch einmal.';

  @override
  String get discoveryJoinErrorFullTitle => 'Diese Community ist voll';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Diese Community hat ihr Mitglied Limit erreicht, du kannst ihr also im Moment nicht beitreten.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Du hast das Community-Limit erreicht';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Du bist in der maximalen Anzahl von Communities. Verlasse eine und versuche es erneut.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Du kannst dieser Community nicht beitreten';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Du wurdest aus dieser Community ausgeschlossen.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Diese Community ist nicht mehr verfügbar';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Sie hat möglicherweise die Entdeckung verlassen oder neue Beitritte deaktiviert. Aktualisiere die Seite und du wirst sie nicht mehr sehen.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Du bist zu schnell';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Bitte warte einen Moment und versuche es erneut.';

  @override
  String get guildNavbarAddCommunity => 'Community hinzufügen';

  @override
  String get guildNavbarHelp => 'Hilfe';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'NEUE NACHRICHT';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Ordner $folderName einklappen';
  }

  @override
  String get guildNavbarGroupDm => 'Gruppen-DM';

  @override
  String get guildNavbarCreateChannel => 'Kanal erstellen';

  @override
  String get guildNavbarChannelType => 'Kanal-Typ';

  @override
  String get guildNavbarTextChannel => 'Textkanal';

  @override
  String get guildNavbarTextChannelDescription =>
      'Nachrichten, Bilder, GIFs und Emojis senden';

  @override
  String get guildNavbarVoiceChannel => 'Sprachkanal';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Gemeinsam per Sprache, Video und Bildschirmfreigabe abhängen';

  @override
  String get guildNavbarLinkChannel => 'Kanal verknüpfen';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Schneller Zugriff auf eine externe Website oder Ressource';

  @override
  String get guildNavbarNameLabel => 'Name';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarCreateCategory => 'Kategorie erstellen';

  @override
  String get guildNavbarNewCategoryHint => 'Neue Kategorie';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Freunde zu $communityName einladen';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Empfänger gelangen zu Kanal #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Freunde suchen';

  @override
  String get guildNavbarNoFriendsYet => 'Noch keine Freunde';

  @override
  String get guildNavbarNoResults => 'Keine Ergebnisse';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Oder sende einen Einladungslink an einen Freund:';

  @override
  String get guildNavbarInviteLink => 'Einladungslink';

  @override
  String get guildNavbarCopy => 'Kopieren';

  @override
  String get guildNavbarCopied => 'Kopiert!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Dein Einladungslink läuft in 7 Tagen ab.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Dieser Einladungslink läuft nie ab.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Dein Einladungslink läuft in $duration ab.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Einladungslink bearbeiten';

  @override
  String get guildNavbarInviteLinkSettings =>
      'Einstellungen für Einladungslink';

  @override
  String get guildNavbarExpireAfter => 'Ablauf nach';

  @override
  String get guildNavbarMaxUses => 'Max. Anzahl Verwendungen';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Temporäre Mitgliedschaft gewähren';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Mitglieder werden entfernt, wenn sie offline gehen, es sei denn, eine Rolle wird zugewiesen';

  @override
  String get guildNavbarCreateNewLink => 'Neuen Link erstellen';

  @override
  String get guildNavbarSent => 'Gesendet';

  @override
  String get guildNavbarInvite => 'Einladen';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Community verlassen';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Möchtest du diese Community wirklich verlassen? Du kannst dann keine Nachrichten mehr sehen.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Community verlassen';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Deine Nachrichten in dieser Community löschen?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Alle deine Nachrichten hier, in jedem Kanal, dauerhaft löschen. Kann nicht rückgängig gemacht werden.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Meine Nachrichten löschen';

  @override
  String get guildNavbarDeletedYourMessages => 'Deine Nachrichten gelöscht';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Deine Nachrichten konnten nicht gelöscht werden';

  @override
  String get guildNavbarRemoveOverride => 'Überschreibung entfernen';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Stummgeschaltet bis $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible =>
      'Nur für Fluxer-Mitarbeiter zugänglich';

  @override
  String get guildNavbarInvitesPaused =>
      'Einladungen sind in dieser Community derzeit pausiert';

  @override
  String get guildNavbarDurationNever => 'nie';

  @override
  String get guildNavbarDuration30Minutes => '30 Minuten';

  @override
  String get guildNavbarDuration1Hour => '1 Stunde';

  @override
  String get guildNavbarDuration6Hours => '6 Stunden';

  @override
  String get guildNavbarDuration12Hours => '12 Stunden';

  @override
  String get guildNavbarDuration1Day => '1 Tag';

  @override
  String get guildNavbarDuration7Days => '7 Tage';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count Sekunden';
  }

  @override
  String get guildNavbarNever => 'Nie';

  @override
  String get guildNavbarNoLimit => 'Kein Limit';

  @override
  String get guildNavbarOneUse => '1 Nutzung';

  @override
  String guildNavbarUses(int count) {
    return '$count Nutzungen';
  }

  @override
  String get guildMenuMarkAsRead => 'Als gelesen markieren';

  @override
  String get guildPeekMoreOptions => 'Weitere Optionen';

  @override
  String get guildMenuInviteMembers => 'Mitglieder einladen';

  @override
  String get guildMenuCommunitySettings => 'Community-Einstellungen';

  @override
  String get guildMenuEditCommunityProfile => 'Community-Profil bearbeiten';

  @override
  String get guildMenuUnmuteCommunity => 'Community stummschalten';

  @override
  String get guildMenuMuteCommunity => 'Community stummschalten';

  @override
  String get guildMenuHideMutedChannels => 'Stummgeschaltete Kanäle ausblenden';

  @override
  String get guildMenuReportCommunity => 'Community melden';

  @override
  String get guildMenuDebugCommunity => 'Community-Debug-Infos';

  @override
  String get guildMenuCopyCommunityId => 'Community-ID kopieren';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Bis $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Allgemein';

  @override
  String get guildMenuSettingsRoles => 'Rollen & Berechtigungen';

  @override
  String get guildMenuSettingsEmoji => 'Benutzerdefinierte Emojis';

  @override
  String get guildMenuSettingsStickers => 'Benutzerdefinierte Sticker';

  @override
  String get guildMenuSettingsSafetyModeration => 'Sicherheit & Moderation';

  @override
  String get guildMenuSettingsActivityLog => 'Aktivitätsprotokoll';

  @override
  String get guildMenuSettingsWebhooks => 'Webhooks';

  @override
  String get guildMenuSettingsCustomInviteUrl =>
      'Benutzerdefinierte Einladungs-URL';

  @override
  String get guildMenuSettingsDiscovery => 'Entdeckung';

  @override
  String get guildMenuSettingsMembers => 'Mitglieder';

  @override
  String get guildMenuSettingsInviteLinks => 'Einladungslinks';

  @override
  String get guildMenuSettingsBans => 'Sperren';

  @override
  String get guildSettingsNoPermission =>
      'Sie haben keine Berechtigung, diesen Einstellungsbereich anzuzeigen.';

  @override
  String get guildSettingsOverviewIconTitle => 'Icon';

  @override
  String get guildSettingsUploadImage => 'Bild hochladen';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Lade ein Banner für deinen Server hoch.';

  @override
  String get guildSettingsOverviewNameTitle => 'Name';

  @override
  String get guildSettingsOverviewNameHint => 'Meine tolle Community';

  @override
  String get guildSettingsOverviewStatsTitle => 'Statistiken';

  @override
  String get guildSettingsOverviewMembers => 'Mitglieder';

  @override
  String get guildSettingsOverviewOnline => 'Online';

  @override
  String get guildSettingsRolesDescription =>
      'Verwende Rollen, um Mitglieder zu gruppieren und Berechtigungen zuzuweisen.';

  @override
  String get guildSettingsCreateRole => 'Rolle erstellen';

  @override
  String get guildSettingsRolesListTitle => 'Rollen';

  @override
  String guildSettingsEmojiSlotInfo(int staticCount, int animatedCount) {
    return '$staticCount statische, $animatedCount animierte Emoji-Slots belegt';
  }

  @override
  String get guildSettingsEmojiEmpty =>
      'Noch keine benutzerdefinierten Emojis.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count Sticker hochgeladen';
  }

  @override
  String get guildSettingsStickersEmpty =>
      'Noch keine benutzerdefinierten Sticker.';

  @override
  String get guildSettingsModerationVerificationTitle =>
      'Mitgliederüberprüfung';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Wähle aus, was Mitglieder haben müssen, bevor sie Community-Mitgliedern schreiben oder Direktnachrichten senden können.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Mitglieder mit Rollen können diese Prüfungen umgehen. Für öffentliche Bereiche empfehlen wir, die Verifizierung zu aktivieren.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Communities, die in der Entdeckung aufgeführt sind, benötigen mindestens eine verifizierte E-Mail-Adresse. „Keine“ kann nicht ausgewählt werden, wenn die Entdeckung aktiviert ist.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Reife Inhalte & Inhaltswarnungen';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Konfiguriere die Kennzeichnung reifer Inhalte und optionale Inhaltswarnungen für Mitglieder.';

  @override
  String get guildSettingsModerationMatureToggle => 'Reife Inhalte';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Markiere diese Community als reife Inhalte enthaltend.';

  @override
  String get guildSettingsVerificationNone => 'Keine';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Es ist keine Verifizierung erforderlich.';

  @override
  String get guildSettingsVerificationLow => 'Niedrig';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Erfordert eine verifizierte E-Mail-Adresse.';

  @override
  String get guildSettingsVerificationMedium => 'Mittel';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Erfordert eine verifizierte E-Mail-Adresse und ein Konto, das mindestens 5 Minuten alt ist.';

  @override
  String get guildSettingsVerificationHigh => 'Hoch';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Erfordert alles aus „Mittel“ plus die Mitgliedschaft in der Community seit mindestens 10 Minuten.';

  @override
  String get guildSettingsVerificationHighest => 'Sehr hoch';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Erfordert eine verifizierte Telefonnummer.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Verfolge Moderatoraktionen in der gesamten Community.';

  @override
  String get guildSettingsAuditLogEmpty => 'Noch keine Protokolle';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Moderationsaktionen und Community-Änderungen werden hier angezeigt.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Alle Benutzer';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Alle Aktionen';

  @override
  String get guildSettingsAuditLogNoReason => 'Es wurde kein Grund angegeben.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Unbekannter Benutzer';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Beim Laden des Aktivitätsprotokolls ist etwas schiefgelaufen.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Aktivitätsprotokolle konnten nicht geladen werden';

  @override
  String get guildSettingsAuditLogReason => 'Grund';

  @override
  String get guildSettingsAuditLogSomeone => 'jemand';

  @override
  String get guildSettingsAuditLogSomething => 'etwas';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'unbekannte Entität';

  @override
  String get guildSettingsAuditLogNothing => 'nichts';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Unbekanntes Ziel';

  @override
  String get auditLogActionGuildUpdate => 'Community aktualisiert';

  @override
  String get auditLogActionChannelCreate => 'Kanal erstellt';

  @override
  String get auditLogActionChannelUpdate => 'Kanal aktualisiert';

  @override
  String get auditLogActionChannelDelete => 'Kanal gelöscht';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Kanal-Berechtigung hinzugefügt';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Kanal-Berechtigung aktualisiert';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Kanal-Berechtigung entfernt';

  @override
  String get auditLogActionMemberKick => 'Mitglied gekickt';

  @override
  String get auditLogActionMemberPrune => 'Mitglieder bereinigt';

  @override
  String get auditLogActionMemberBanAdd => 'Mitglied gesperrt';

  @override
  String get auditLogActionMemberBanRemove => 'Mitglied entsperrt';

  @override
  String get auditLogActionMemberUpdate => 'Mitglied aktualisiert';

  @override
  String get auditLogActionMemberRoleUpdate => 'Mitgliederrollen aktualisiert';

  @override
  String get auditLogActionMemberMove => 'Mitglied verschoben';

  @override
  String get auditLogActionMemberDisconnect => 'Mitglied getrennt';

  @override
  String get auditLogActionBotAdd => 'Bot hinzugefügt';

  @override
  String get auditLogActionRoleCreate => 'Rolle erstellt';

  @override
  String get auditLogActionRoleUpdate => 'Rolle aktualisiert';

  @override
  String get auditLogActionRoleDelete => 'Rolle gelöscht';

  @override
  String get auditLogActionInviteCreate => 'Einladung erstellt';

  @override
  String get auditLogActionInviteUpdate => 'Einladung aktualisiert';

  @override
  String get auditLogActionInviteDelete => 'Einladung gelöscht';

  @override
  String get auditLogActionWebhookCreate => 'Webhook erstellt';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook aktualisiert';

  @override
  String get auditLogActionWebhookDelete => 'Webhook gelöscht';

  @override
  String get auditLogActionEmojiCreate => 'Emoji erstellt';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji aktualisiert';

  @override
  String get auditLogActionEmojiDelete => 'Emoji gelöscht';

  @override
  String get auditLogActionStickerCreate => 'Sticker erstellt';

  @override
  String get auditLogActionStickerUpdate => 'Sticker aktualisiert';

  @override
  String get auditLogActionStickerDelete => 'Sticker gelöscht';

  @override
  String get auditLogActionMessageDelete => 'Nachricht gelöscht';

  @override
  String get auditLogActionMessageBulkDelete => 'Nachrichten gelöscht';

  @override
  String get auditLogActionMessagePin => 'Nachricht angepinnt';

  @override
  String get auditLogActionMessageUnpin => 'Nachricht abgepinnt';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor hat die Community-Einstellungen aktualisiert.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor hat den Kanal $target erstellt.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor hat den Kanal $target aktualisiert.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor hat den Kanal $target gelöscht.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor hat Kanalberechtigungen für $target hinzugefügt.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor hat Kanalberechtigungen für $target im Kanal $channel hinzugefügt.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor hat Kanalberechtigungen für $target aktualisiert.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor hat Kanalberechtigungen für $target im Kanal $channel aktualisiert.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor hat Kanalberechtigungen für $target entfernt.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor hat Kanalberechtigungen für $target im Kanal $channel entfernt.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor hat $target rausgeworfen.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor hat $target gesperrt.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor hat $target entsperrt.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor hat $target aktualisiert.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor hat die Rollen für $target aktualisiert.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor hat inaktive Mitglieder bereinigt.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor hat Mitglieder bereinigt, die seit $days Tagen inaktiv waren.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor hat $target in einen anderen Sprachkanal verschoben.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor hat $target in den Kanal $channel verschoben.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor hat $target vom Sprachkanal getrennt.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor hat den Bot $target hinzugefügt.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor hat die Rolle $target erstellt.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor hat die Rolle $target aktualisiert.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor hat die Rolle $target gelöscht.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor hat die Einladung $target erstellt.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor hat die Einladung $target für den Kanal $channel erstellt.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor hat die Einladung $target aktualisiert.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor hat die Einladung $target für den Kanal $channel aktualisiert.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor hat die Einladung $target gelöscht.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor hat die Einladung $target für den Kanal $channel gelöscht.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor hat den Webhook $target erstellt.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor hat den Webhook $target aktualisiert.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor hat den Webhook $target gelöscht.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor hat das Emoji $target hinzugefügt.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor hat das Emoji $target aktualisiert.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor hat das Emoji $target gelöscht.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor hat den Sticker $target hinzugefügt.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor hat den Sticker $target aktualisiert.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor hat den Sticker $target gelöscht.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor hat eine Nachricht gelöscht.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor hat eine Nachricht in $channel gelöscht.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor hat mehrere Nachrichten gelöscht.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor hat $count Nachrichten gelöscht.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor hat mehrere Nachrichten in $channel gelöscht.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor hat $count Nachrichten in $channel gelöscht.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor hat eine Nachricht angepinnt.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor hat eine Nachricht in $channel angepinnt.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor hat eine Nachricht entpinnt.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor hat eine Nachricht in $channel entpinnt.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor hat eine Audit-Aktion auf $target ausgeführt.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return '$field von $oldValue auf $newValue aktualisiert.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return '$field auf $newValue gesetzt.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return '$field gelöscht (war $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return '$field aktualisiert.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Die Community wurde in $name umbenannt.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Das Community-Symbol wurde aktualisiert.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Der Kanal wurde in $name umbenannt.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Das Thema wurde gelöscht.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Das Thema wurde auf $topic aktualisiert.';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'Erwachsenen-Inhalte aktiviert.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Erwachsenen-Inhalte deaktiviert.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Nickname auf $nickname gesetzt.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Nickname $nickname entfernt.';
  }

  @override
  String get auditLogChangeMutedMember => 'Mitglied stummgeschaltet.';

  @override
  String get auditLogChangeUnmutedMember => 'Mitglied entstummt.';

  @override
  String get auditLogChangeDeafenedMember => 'Mitglied taubgeschaltet.';

  @override
  String get auditLogChangeUndeafenedMember =>
      'Mitglied nicht mehr taubgeschaltet.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return '$roles hinzugefügt.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return '$roles entfernt.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Kanal: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Nachricht: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Eingeladen von $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# Nachrichten gelöscht.',
      one: 'Eine Nachricht gelöscht.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# Mitglieder entfernt.',
      one: 'Ein Mitglied entfernt.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'Diese Einladung läuft nie ab.';

  @override
  String get auditLogOptionTemporaryMembership =>
      'Gewährt temporäre Mitgliedschaft.';

  @override
  String get auditLogOptionPermanentMembership =>
      'Gewährt permanente Mitgliedschaft.';

  @override
  String get guildSettingsLoadMore => 'Mehr laden';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Verwalte Webhooks, die Nachrichten in Kanäle posten.';

  @override
  String get guildSettingsWebhooksEmpty => 'Keine Webhooks konfiguriert.';

  @override
  String get guildSettingsCopyUrl => 'URL kopieren';

  @override
  String get guildSettingsCopiedUrl => 'URL in die Zwischenablage kopiert';

  @override
  String get guildSettingsDeleteWebhook => 'Webhook löschen';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Lege einen benutzerdefinierten Einladungslink für deinen Server fest.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Speichern';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Nutzung';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count Nutzung(en)';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Bewirb dich für die Aufnahme in die Server-Suche.';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Benötigt mindestens $count Mitglieder für die Bewerbung.';
  }

  @override
  String get guildSettingsDiscoveryFormTitle => 'Bewerbung';

  @override
  String get guildSettingsDiscoveryStatusTitle => 'Status';

  @override
  String get guildSettingsDiscoveryCategory => 'Kategorie';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Beschreibung';

  @override
  String get guildSettingsDiscoveryTags => 'Tags';

  @override
  String get guildSettingsDiscoveryTagsHint => 'Gaming, Kunst, Musik';

  @override
  String get guildSettingsDiscoveryApply => 'Bewerbung abschicken';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Zurückziehen';

  @override
  String get guildSettingsMembersDescription =>
      'Servermitglieder suchen und verwalten.';

  @override
  String get guildSettingsMembersSearchHint => 'Mitglieder suchen';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count Mitglied(er)';
  }

  @override
  String get guildSettingsInvitesDescription =>
      'Aktive Einladungslinks anzeigen und widerrufen.';

  @override
  String get guildSettingsInvitesEmpty => 'Keine aktiven Einladungen.';

  @override
  String guildSettingsInviteUses(int uses, int maxUses) {
    return '$uses / $maxUses Nutzung(en)';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Läuft ab $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Gesperrte Benutzer anzeigen und verwalten.';

  @override
  String get guildSettingsBansSearchHint => 'Sperren suchen';

  @override
  String get guildSettingsBansEmpty => 'Keine gesperrten Benutzer.';

  @override
  String get guildSettingsBanPermanent => 'Dauerhafte Sperre';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Läuft ab $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Läuft ab';

  @override
  String get guildSettingsUnban => 'Sperre aufheben';

  @override
  String get guildSettingsBansLoading => 'Gesperrte Benutzer werden geladen';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Keine Sperren gefunden, die deiner Suche entsprechen.';

  @override
  String get guildSettingsBanDetailsTitle => 'Details zur Sperre';

  @override
  String get guildSettingsBanViewDetails => 'Details anzeigen';

  @override
  String get guildSettingsBannedOn => 'Gesperrt am';

  @override
  String get guildSettingsBannedBy => 'Gesperrt von';

  @override
  String get guildSettingsRevokeBanTitle => 'Sperre widerrufen';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Möchtest du die Sperre für $displayName wirklich widerrufen? Sie können der Community wieder beitreten.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Sperre für $displayName widerrufen';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Sperren konnten nicht geladen werden. Versuche es erneut.';

  @override
  String get guildSettingsRevokeBanError =>
      'Sperre konnte nicht widerrufen werden. Versuche es erneut.';

  @override
  String get guildSettingsCommunitySettings => 'Community-Einstellungen';

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
      'Verwalte das Profil, die Kanäle und die Standardeinstellungen deiner Community.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Branding';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Aktualisiere dein Icon, deinen Namen, dein Banner und den Einladungs-Hintergrund';

  @override
  String get guildSettingsOverviewBannerUpload => 'Banner hochladen';

  @override
  String get guildSettingsOverviewIdleTitle => 'Leerlauf-Einstellungen';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'AFK-Kanal und Timeout konfigurieren';

  @override
  String get guildSettingsOverviewSystemTitle => 'System & Willkommen';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Wähle das Ziel für System- und Willkommensnachrichten';

  @override
  String get guildSettingsOverviewNotificationsTitle =>
      'Standardbenachrichtigungen';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Communities mit über 250 Mitgliedern werden auf die Einstellung \"Nur Erwähnungen\" gesetzt. Deine ursprüngliche Einstellung bleibt erhalten und wird wiederhergestellt, wenn die Community unter 250 Mitglieder fällt.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Erweitert';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Flexible Kanalnamen zulassen';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Community-Besitzerkrone ausblenden';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Abgetrennter Banner';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Zeigt den Banner in einem eigenen Abschnitt unter dem Community-Header an.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Symbol hochladen';

  @override
  String get guildSettingsOverviewRemoveImage => 'Entfernen';

  @override
  String get guildSettingsOverviewSplashTitle => 'Einladungs-Hintergrund';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'Chat-Embed-Hintergrund';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Wird in Einladungs-Embeds im Chat angezeigt.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Hintergrund hochladen';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'Kein Community-Banner';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'Kein Einladungs-Hintergrund';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Vorschau';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Sieh dir an, wie deine Einladung für Besucher aussieht.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle => 'Textkanalnamen';

  @override
  String get guildSettingsOverviewOwnerCrownTitle => 'Community-Besitzerkrone';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Konfiguriere, ob das Kronensymbol neben dem Community-Besitzer angezeigt wird';

  @override
  String get guildSettingsSplashCardAlignment => 'Karten-Ausrichtung';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Mitte';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Links';

  @override
  String get guildSettingsSplashAlignmentRight => 'Rechts';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Gilt nur auf breiten Bildschirmen.';

  @override
  String get permissionReadMessageHistory => 'Nachrichtenverlauf lesen';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Ändere, was Benutzer ohne \"$permission\" sehen können';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Verwende ein separates Modal, um ein Nachrichtenverlauf-Schwellendatum für Mitglieder festzulegen, die nicht über die Berechtigung \"$permission\" verfügen.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Schwellenwert für Nachrichtenverlauf öffnen';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Schwellenwert für Nachrichtenverlauf';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Schwellenwert für Nachrichtenverlauf aktivieren';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Schwellendatum';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Mitglieder ohne Nachrichtenverlauf lesen können Nachrichten sehen, die nach diesem Datum gesendet wurden.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Schwellenwert für Nachrichtenverlauf aktualisiert';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Erlaube Grossbuchstaben und Leerzeichen in Textkanalnamen. Deaktiviert beschränkt Namen auf Kleinbuchstaben mit Bindestrichen und Unterstrichen.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Blendet das Kronensymbol neben dem Community-Besitzer auf allen Oberflächen aus.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Animierte Symbole erfordern die Community-Funktion \"Animiertes Symbol\".';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Animierte Banner erfordern die Community-Funktion \"Animierter Banner\".';

  @override
  String get guildSettingsAfkChannel => 'AFK / Inaktiv-Kanal';

  @override
  String get guildSettingsAfkChannelHint =>
      'Verschiebe Mitglieder in diesen Kanal, wenn sie AFK sind.';

  @override
  String get guildSettingsNoAfkChannel => 'Kein AFK-Kanal';

  @override
  String get guildSettingsAfkTimeout => 'AFK-Timeout';

  @override
  String get guildSettingsAfkTimeout1Min => '1 Minute';

  @override
  String get guildSettingsAfkTimeout5Min => '5 Minuten';

  @override
  String get guildSettingsAfkTimeout15Min => '15 Minuten';

  @override
  String get guildSettingsAfkTimeout30Min => '30 Minuten';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 Stunde';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds Sekunden';
  }

  @override
  String get guildSettingsSystemChannel => 'Zielkanal';

  @override
  String get guildSettingsSystemChannelHint =>
      'Willkommens- und Systemnachrichten werden hier angezeigt.';

  @override
  String get guildSettingsNoSystemChannel => 'Kein Systemkanal';

  @override
  String get guildSettingsHideJoinMessages => 'Beitrittsnachrichten ausblenden';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Unterdrückt Beitrittsnachrichten im Zielkanal.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Standard-Benachrichtigungseinstellungen';

  @override
  String get guildSettingsNotificationsAll => 'Alle Nachrichten';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Benachrichtige bei allen Nachrichten';

  @override
  String get guildSettingsNotificationsMentions => 'Nur Erwähnungen';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Benachrichtige nur bei Erwähnungen';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max. 10 MB. Mindestens: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max. 10 MB. Mindestens: 960×540px (16:9). Wird in Einladungs-Embeds im Chat angezeigt.';

  @override
  String get guildSettingsModerationDescription =>
      'Überprüfungs-, Inhaltsfilter- und Jugendschutzeinstellungen konfigurieren.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'In der Discovery gelistete Communities haben eingeschränkte Moderationsoptionen.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Inhaltsfilterung';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Nachrichten automatisch auf explizite Inhalte prüfen in Kanälen, die nicht als jugendgefährdend gekennzeichnet sind.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Communities, die in der Discovery gelistet sind, müssen alle Mitglieder scannen. Diese Einstellung kann nicht geändert werden, solange die Discovery aktiviert ist.';

  @override
  String get guildSettingsContentFilterOff => 'Aus';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Die Community sich selbst moderieren lassen';

  @override
  String get guildSettingsContentFilterNoRole =>
      'Mitglieder ohne Rollen filtern';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Für die meisten Communities empfohlen';

  @override
  String get guildSettingsContentFilterAll => 'Alle filtern';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Maximaler Schutz für familienfreundliche Bereiche';

  @override
  String get guildSettingsModerationMatureOff => 'Aus';

  @override
  String get guildSettingsModerationMatureOn => 'An';

  @override
  String get guildSettingsContentWarningToggle => 'Inhaltswarnung anzeigen';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Schaltet eine Zustimmungsaufforderung vor dem Betreten eines Kanals um.';

  @override
  String get guildSettingsContentWarningText => 'Benutzerdefinierter Warntext';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Dies enthält sensible Inhalte.';

  @override
  String get guildSettingsModeration2faTitle => '2FA-Anforderung';

  @override
  String get guildSettingsModeration2faDescription =>
      'Zwei-Faktor-Authentifizierung für Moderatoren verlangen, bevor sie verbannen, kicken, stummschalten oder Nachrichten entfernen können.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      '2FA für Moderationsaktionen erforderlich';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Nur der Community-Besitzer kann diese Einstellung ändern';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Aktiviere 2FA für dein Konto, um diese Einstellung zu ändern';

  @override
  String get guildSettingsEmojiSearchHint => 'Emojis suchen';

  @override
  String get guildSettingsEmojiUploadTitle => 'Emoji hochladen';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Nicht animierte Emojis ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Animierte Emojis ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Sticker suchen';

  @override
  String get guildSettingsWebhooksInfo =>
      'Webhooks in den Kanaleinstellungen erstellen. Hier bearbeiten.';

  @override
  String get guildSettingsVanityUrlWarning =>
      'Deine Vanity-URL funktioniert nicht, es sei denn, mindestens ein Kanal ist für alle sichtbar.';

  @override
  String get guildSettingsVanityUrlRemove => 'Entfernen';

  @override
  String get guildSettingsBannedUsersTitle => 'Gesperrte Benutzer';

  @override
  String get guildSettingsInvitesTableInviter => 'Einladender';

  @override
  String get guildSettingsInvitesTableChannel => 'Kanal';

  @override
  String get guildSettingsInvitesTableCode => 'Code';

  @override
  String get guildSettingsInvitesTableUses => 'Verwendungen';

  @override
  String get guildSettingsInvitesTableCreated => 'Erstellt';

  @override
  String get guildSettingsMembersSortNewest => 'Neueste zuerst';

  @override
  String get guildSettingsAuditLogFilterUser => 'Nach Benutzer filtern';

  @override
  String get guildSettingsAuditLogFilterAction => 'Nach Aktion filtern';
}
