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
      'Mit der Instanz stimmt etwas nicht.\nSollte gleich behoben sein!';

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
  String get nagbarLearnMore => 'Mehr erfahren';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'Wartungsarbeiten sind für $localizedTime geplant. Voraussichtliche Dauer: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Wartungsarbeiten laufen. Voraussichtliche Dauer: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'Wartung abgeschlossen.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Hallo $displayName, beanspruche deinen Account, um den Verlust des Zugriffs zu verhindern.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Hallo $displayName, bitte bestätige deine E-Mail-Adresse.';
  }

  @override
  String get nagbarOpenSettings => 'Einstellungen öffnen';

  @override
  String get systemPermissionSettingsTitle => 'Berechtigung aktivieren';

  @override
  String get systemPermissionSettingsOpenSettings => 'Einstellungen öffnen';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName hat keinen Zugriff auf dein Mikrofon. Du kannst den Zugriff in den Datenschutzeinstellungen deines Geräts aktivieren.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName hat keinen Zugriff auf deine Kamera. Du kannst den Zugriff in den Datenschutzeinstellungen deines Geräts aktivieren.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName hat keinen Zugriff auf deine Fotomediathek. Du kannst den Zugriff in den Privatsphäre-Einstellungen deines Geräts aktivieren.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName hat keine Berechtigung, Benachrichtigungen zu senden. Du kannst sie in deinen Geräteeinstellungen aktivieren.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Dein Abonnement konnte nicht erneuert werden, aber du hast bis zum $graceDate weiterhin Zugriff auf die $productName-Vorteile. Handle jetzt, sonst verlierst du alle Vorteile.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Dein $productName-Abonnement ist abgelaufen. Erneuere es jetzt, um deine Vorteile zu behalten.';
  }

  @override
  String get nagbarManageSubscription => 'Abonnement verwalten';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Willkommen bei $productFullName. Entdecke deine $productName-Vorteile und verwalte dein Abonnement.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return '$productName-Funktionen ansehen';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'Du hast einen neuen Geschenkcode in deinem Geschenkelager.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'Du hast $count neue Geschenk-Codes in deinem Inventar.';
  }

  @override
  String get nagbarViewGiftInventory => 'Geschenkinventar ansehen';

  @override
  String get nagbarVisionaryMfa =>
      'Aktiviere die Zwei-Faktor-Authentifizierung, um dein Visionary-Konto zu schützen.';

  @override
  String get nagbarEnableMfa => '2FA aktivieren';

  @override
  String get nagbarTermsAcceptance =>
      'Wir haben unsere Nutzungsbedingungen aktualisiert. Bitte lies sie und stimme ihnen zu, um fortzufahren.';

  @override
  String get nagbarReviewTerms => 'Bedingungen prüfen';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Tritt $communityName bei, um mit dem Team zu chatten und auf dem Laufenden zu bleiben.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Bei $communityName beitreten';
  }

  @override
  String get nagbarPushNotification =>
      'Aktiviere Benachrichtigungen, damit du keine Nachrichten und Erwähnungen verpasst.';

  @override
  String get nagbarEnableNotifications => 'Benachrichtigungen aktivieren';

  @override
  String get nagbarBillingPortalFailed =>
      'Konnte das Abrechnungsportal nicht öffnen. Bitte versuche es gleich noch einmal.';

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
  String get next => 'Weiter';

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
  String get registerPendingApproval =>
      'Deine Accountanfrage wartet auf Genehmigung. Du kannst dich anmelden, nachdem ein Admin sie genehmigt hat.';

  @override
  String get registerClosed =>
      'Die Registrierung ist derzeit geschlossen. Verwende einen Registrierungslink von einem Admin, um einen Account zu erstellen.';

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
  String get errorServiceUnavailable =>
      'Diese Instanz ist vorübergehend nicht verfügbar. Versuche es gleich noch einmal.';

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
  String get embedInviteJoinGroup => 'Gruppe beitreten';

  @override
  String get embedInviteAlreadyJoined => 'Bereits beigetreten';

  @override
  String get embedInviteDisabled => 'Einladungen deaktiviert';

  @override
  String get embedInvitePaused =>
      'Einladungen für diese Community sind pausiert.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName hat einen potenziellen Raid erkannt, daher können neue Nutzer:innen im Moment nicht beitreten.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Diese Community hat Einladungen pausiert. Du kannst es später erneut versuchen.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName hat einen potenziellen Raid in dieser Community erkannt. Einladungen sind pausiert, daher können neue Benutzer derzeit nicht beitreten.';
  }

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
  String get invalidDeepLinkTitle => 'Link konnte nicht geöffnet werden';

  @override
  String get invalidDeepLinkDescription =>
      'Dieser Link ist möglicherweise fehlerhaft, nur im Web verfügbar oder du hast keinen Zugriff darauf. Überprüfe den Link und versuche es erneut.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Zur Startseite';

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
  String embedGiftVisionaryLifetime(String productName) {
    return 'Visionary (lebenslang $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Tage $productName',
      one: '1 Tag $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Wochen $productName',
      one: '1 Woche $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Monate $productName',
      one: '1 Monat $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Jahre $productName',
      one: '1 Jahr $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'Von $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'Hier tippen, um dein Geschenk einzulösen!';

  @override
  String get embedGiftAlreadyRedeemed => 'Bereits eingelöst';

  @override
  String get embedGiftClaimAccountHelp =>
      'Registriere dich, um dieses Geschenk einzulösen.';

  @override
  String get embedGiftClaim => 'Geschenk einlösen';

  @override
  String get embedGiftClaimed => 'Geschenk eingelöst';

  @override
  String get embedGiftClaimAccount => 'Zum Einlösen Account anlegen';

  @override
  String get embedGiftUnknownTitle => 'Unbekanntes Geschenk';

  @override
  String get embedGiftUnknownSubtitle =>
      'Dieser Geschenkcode ist ungültig oder wurde bereits eingelöst.';

  @override
  String get embedGiftUnavailable => 'Geschenk nicht verfügbar';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Fordere dein Geschenk an, um dein $productName-Abonnement zu aktivieren!';
  }

  @override
  String get giftAcceptAlreadyClaimed =>
      'Dieses Geschenk wurde bereits eingelöst.';

  @override
  String get giftAcceptMaybeLater => 'Vielleicht später';

  @override
  String get giftRedeemedToast => 'Geschenk eingelöst!';

  @override
  String get giftRedeemInvalidTitle => 'Ungültiger Geschenkcode';

  @override
  String get giftRedeemInvalidMessage =>
      'Dieser Code ist ungültig oder wurde bereits verwendet.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Geschenk bereits eingelöst';

  @override
  String get giftRedeemAlreadyRedeemedMessage =>
      'Dieser Code wurde bereits eingelöst.';

  @override
  String get giftRedeemNotFoundTitle => 'Geschenk nicht gefunden';

  @override
  String get giftRedeemNotFoundMessage => 'Dieser Code existiert nicht.';

  @override
  String get giftRedeemFailedTitle => 'Geschenk konnte nicht eingelöst werden';

  @override
  String get giftRedeemFailedMessage =>
      'Dieses Geschenk konnte nicht eingelöst werden. Bitte versuche es noch einmal.';

  @override
  String get giftVisionaryCannotRedeemTitle =>
      'Dieses Geschenk kann nicht eingelöst werden';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Visionary-Konten können keine Plutonium-Geschenke einlösen. Kopiere stattdessen den Link, um ihn mit einem Freund zu teilen.';

  @override
  String get giftCopyLink => 'Geschenklink kopieren';

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
  String get notificationUseCategoryDefault => 'Kategorie-Standard verwenden';

  @override
  String get notificationUseCommunityDefault =>
      'Standard der Community verwenden';

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
  String get dmDeleteMyMessagesTitle =>
      'Eigene Nachrichten in dieser Unterhaltung löschen?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Dadurch werden alle Nachrichten, die Sie jemals in dieser Unterhaltung gesendet haben, dauerhaft gelöscht. Dies kann nicht rückgängig gemacht werden.';

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
  String get dmEditGroup => 'Gruppe bearbeiten';

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
  String get dmUnnamedGroup => 'Unbenannte Gruppe';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'Gruppe von $resolvedName';
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
  String get dmDebugCategory => 'Kategorie debuggen';

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
  String get addFriendVerifyToSend =>
      'Bestätige deine E-Mail-Adresse, bevor du Freundschaftsanfragen sendest.';

  @override
  String get addFriendFriendsListFull =>
      'Deine Freundesliste oder die andere ist voll. Entferne jemanden und versuche es erneut.';

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
  String emojiInfoDefaultDescription(String productName) {
    return 'Dies ist ein Standard-Emoji auf $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'Dieses Emoji stammt aus dieser Community. Du kannst es überall verwenden.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'Dies ist ein benutzerdefiniertes Emoji aus einer Community.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'Dies ist ein benutzerdefiniertes Emoji aus einer Community. Bitte den Autor um eine Einladung, um dieses Emoji zu verwenden.';

  @override
  String get emojiInfoFromHeader => 'Dieses Emoji stammt aus';

  @override
  String get emojiInfoDiscoverableCommunity => 'Sichtbare Community';

  @override
  String get emojiInfoPrivateCommunity => 'Private Community';

  @override
  String get emojiInfoVerifiedCommunity => 'Verifizierte Community';

  @override
  String get emojiInfoAddToFavorites => 'Zu Favoriten hinzufügen';

  @override
  String get emojiInfoRemoveFromFavorites => 'Aus Favoriten entfernen';

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
  String get gifPickerFavoritesEmptyTitle => 'Noch keine Lieblings-GIFs';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'GIFs mit einem Stern versehen, um sie hier anzuzeigen.';

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
  String externalLinkWarningLeaving(String productName) {
    return 'Du bist dabei, $productName zu verlassen';
  }

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
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => 'Deinen Benutzername ändern';

  @override
  String get fluxerTagInputLabel => 'Benutzername';

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
  String get fluxerTagAlreadyTaken => 'Benutzername bereits vergeben';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Der Benutzername $username#$discriminator ist bereits vergeben. Wenn du fortfährst, wird dein Diskriminator automatisch neu ausgewürfelt.';
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
      'Wenn du diesen Benutzername speicherst, wird dein benutzerdefinierter 4-stelliger Tag auf eine zufällige Nummer zurückgesetzt, wenn dein Plutonium-Abo endet. Wenn dein Abo nicht erneuert wird, hast du eine 3-tägige Kulanzfrist, bevor sich der Tag ändert.';

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
  String get fluxerTagUpdated => 'Benutzername aktualisiert';

  @override
  String get fluxerTagUpdateFailed =>
      'Benutzername konnte nicht aktualisiert werden. Bitte versuche es erneut.';

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
      'Beanspruche deinen Account, um deinen Benutzername zu ändern';

  @override
  String get changeFluxerTag => 'Benutzername ändern';

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
  String profilePreviewMemberSince(String productName) {
    return '$productName-Mitglied seit';
  }

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
  String securityLoginEmailSectionDescription(String productName) {
    return 'Verwalte die E-Mail-Adresse, mit der du dich bei $productName anmeldest';
  }

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
      'Wir senden einen SMS-Code, sobald einer verfügbar ist. Deine Nummer wird nicht mit deinem Konto verknüpft. Wir speichern nur einen verschlüsselten Marker ohne Benutzer-ID, um maximal 2 Verifizierungen in etwa 30 Tagen zu ermöglichen.';

  @override
  String get phoneAddSendCode => 'Code senden';

  @override
  String get phoneVerifyTitle => 'Telefonnummer verifizieren';

  @override
  String get phoneVerifyDescription =>
      'Gib den Verifizierungscode ein, der an deine Telefonnummer gesendet wurde.';

  @override
  String get phoneAddSuccess => 'Telefonnummer verifiziert';

  @override
  String get phoneCountryLabel => 'Land';

  @override
  String get phoneSearchCountries => 'Länder suchen …';

  @override
  String get phoneNumberRequired => 'Telefonnummer ist erforderlich';

  @override
  String get phoneEnterValidNumber =>
      'Gib eine gültige Mobiltelefonnummer ein.';

  @override
  String get phoneCannotBeUsed =>
      'Diese Telefonnummer kann nicht verwendet werden. Versuche es mit einer anderen Mobilnummer oder kontaktiere den Support.';

  @override
  String get phoneAlreadyUsed =>
      'Diese Telefonnummer wurde bereits verwendet. Versuche es mit einer anderen Nummer oder kontaktiere den Support.';

  @override
  String get phoneCodeDidNotWork =>
      'Der Code hat nicht funktioniert. Bitte überprüfe ihn und versuche es erneut.';

  @override
  String get phoneTooManyAttempts =>
      'Zu viele Versuche. Warte einen Moment und versuche es dann erneut.';

  @override
  String get phoneSmsUnavailable =>
      'Die SMS-Verifizierung ist derzeit nicht verfügbar. Versuche es später erneut oder kontaktiere den Support.';

  @override
  String get phoneNotEligible =>
      'Telefonverifizierung ist für diesen Account nicht verfügbar. Verwende eine andere Methode oder kontaktiere den Support.';

  @override
  String get phoneCaptchaRequired =>
      'Bevor du deine Telefonnummer verifizieren kannst, ist eine Browserprüfung erforderlich. Versuche es noch einmal über die Anmeldeseite oder kontaktiere den Support.';

  @override
  String get phoneSomethingWentWrong =>
      'Es ist ein Fehler aufgetreten. Bitte versuchen Sie es erneut.';

  @override
  String get phoneInboundExpensiveDescription =>
      'Das Senden einer SMS an diese Telefonnummer ist zu teuer. Bitte sende uns stattdessen eine SMS. Du kannst auch den Support kontaktieren, um diese Anforderung für dein Konto aufheben zu lassen.';

  @override
  String get phoneInboundDefaultDescription =>
      'Wir müssen dir eine SMS senden, um deine Telefonnummer zu verifizieren.';

  @override
  String get phoneInboundStepOpenMessaging =>
      'Öffne die Nachrichten-App deines Smartphones und erstelle eine neue Textnachricht.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'Sende den Code $code an $number.';
  }

  @override
  String get phoneInboundStepWait =>
      'Warte, bis wir deine Nachricht erhalten. Das kann einen Moment dauern.';

  @override
  String get phoneInboundGetNewCode => 'Neuen Code anfordern';

  @override
  String get phoneInboundChallengeCodeLabel => 'Code zum Senden';

  @override
  String get phoneInboundOurNumberLabel => 'Senden an';

  @override
  String get requiredActionTitle => 'Accountverifizierung erforderlich';

  @override
  String requiredActionIntroGeneric(String productName) {
    return 'Schließe die erforderliche Verifizierung ab, um $productName weiterhin zu nutzen.';
  }

  @override
  String get requiredActionIntroPhone =>
      'Deine Registrierung erfordert eine zusätzliche Anti-Spam-Prüfung, bevor du fortfahren kannst.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return 'Bestätige deine E-Mail-Adresse oder Telefonnummer, um $productName weiterhin zu nutzen.';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return 'Schließe die erforderlichen Schritte zur E-Mail- und Telefonverifizierung ab, um $productName weiterhin nutzen zu können.';
  }

  @override
  String get requiredActionChooseMethodTitle =>
      'Wähle eine Verifizierungsmethode';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return 'Schließe einen der unten stehenden Verifizierungspfade ab, um $productName weiterhin nutzen zu können.';
  }

  @override
  String get requiredActionUseEmail => 'E-Mail verwenden';

  @override
  String get requiredActionUsePhone => 'Telefon verwenden';

  @override
  String get requiredActionCheckEmailTitle => 'E-Mails checken';

  @override
  String get requiredActionCheckEmailDescription =>
      'Wir haben einen Bestätigungslink an deine E-Mail-Adresse gesendet. Öffne ihn, um fortzufahren.';

  @override
  String get requiredActionResendVerificationEmail =>
      'Verifizierungs-E-Mail erneut senden';

  @override
  String get requiredActionVerificationEmailSent =>
      'Verifizierungs-E-Mail gesendet. Posteingang prüfen.';

  @override
  String get requiredActionSignOut => 'Abmelden';

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
  String get networkErrorMessage =>
      'Etwas ist schiefgelaufen. Bitte versuche es erneut.';

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
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vor $count Wochen',
      one: 'vor 1 Woche',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count Minuten',
      one: 'in einer Minute',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count Stunden',
      one: 'in einer Stunde',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count Tagen',
      one: 'in 1 Tag',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count Wochen',
      one: 'in 1 Woche',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count Monaten',
      one: 'in einem Monat',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count Jahren',
      one: 'in 1 Jahr',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'gerade eben';

  @override
  String get authorizedAppsTitle => 'Autorisierte Anwendungen';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Diesen Anwendungen wurde der Zugriff auf deinen $productName-Account gewährt.';
  }

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
  String get blockedUsersCopyTag => 'Benutzername kopieren';

  @override
  String get blockedUsersCopyId => 'Benutzer-ID kopieren';

  @override
  String get userProfileLoadError => 'Profil konnte nicht geladen werden';

  @override
  String get userProfileLoading => 'Profil wird geladen';

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
  String userProfileStaffBadgeTooltip(String productName) {
    return '$productName Team';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return '$productName Community Team';
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
    return '$productName Plutonium Abonnent seit $date';
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
    return '$productName Visionary seit $date';
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
  String get userProfileRoles => 'Rollen';

  @override
  String get memberRoleAdd => 'Rolle hinzufügen';

  @override
  String memberRoleRemove(String roleName) {
    return 'Rolle \"$roleName\" entfernen';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'Dieser Nutzer hat keine Rollen in dieser Community.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'Noch keine Rollen. Füge Rollen in $rolesSettingsPath hinzu';
  }

  @override
  String get memberRolesNoRolesAvailable => 'Keine Rollen verfügbar';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'Derzeit gibt es in dieser Community keine Rollen zum Zuweisen, aber du kannst eine neue Rolle in $rolesSettingsPath erstellen.';
  }

  @override
  String get guildSettingsTitle => 'Community-Einstellungen';

  @override
  String get guildSettingsRolesTab => 'Rollen';

  @override
  String get memberRolesConfirmOk => 'OK';

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
      other: '$hours Stunden',
      one: '1 Stunde',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes Minuten',
      one: '1 Minute',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours Stunden',
      one: '1 Stunde',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes Minuten',
      one: '1 Minute',
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
  String get iarReportGuildTitle => 'Community melden';

  @override
  String get iarReportGuildPreconfirmBody =>
      'Wenn sich diese Meldung auf eine bestimmte Nachricht in dieser Community bezieht, melde stattdessen diese Nachricht. Nachrichtenmeldungen geben unserem Sicherheitsteam den klarsten Kontext, und das Hinzufügen von Details in den Kommentaren kann uns helfen, die Überprüfung zu beschleunigen. Fahre nur mit der Meldung der gesamten Community fort, wenn die Meldung einer Nachricht das umfassendere Problem nicht erfassen würde.';

  @override
  String get iarContinueToReportCommunity => 'Community weiter melden';

  @override
  String get iarPreviewCommunitySubtitle => 'Community';

  @override
  String get iarReasonHarassmentGuildLabel =>
      'Belästigung oder gezielter Missbrauch';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'Community fördert kollektive Angriffe oder gezielte Belästigung.';

  @override
  String get iarReasonHateGuildDescription =>
      'Fördert Hass gegen geschützte Gruppen.';

  @override
  String get iarReasonTerrorismLabel =>
      'Terrorismus oder gewalttätiger Extremismus';

  @override
  String get iarReasonTerrorismDescription =>
      'Fördert, rekrutiert für oder koordiniert gewalttätige extremistische Aktivitäten.';

  @override
  String get iarReasonMatureContentGuildLabel =>
      'Inhalte für Erwachsene oder unsichere Inhalte';

  @override
  String get iarReasonMatureContentGuildDescription =>
      'Nicht jugendfreie Inhalte ohne entsprechende Altersbeschränkung.';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      'Gefährdet Minderjährige oder enthält Inhalte zur Kinderpornografie.';

  @override
  String get iarReasonRaidLabel => 'Raid-Koordination';

  @override
  String get iarReasonRaidDescription =>
      'Koordiniert Raids, Brigading oder Belästigung gegen Personen oder Communitys.';

  @override
  String get iarReasonSpamGuildDescription =>
      'Die Community existiert, um die Plattform mit Spam, Betrug oder Missbrauch zu überziehen.';

  @override
  String get iarReasonMalwareGuildLabel => 'Malware-Verbreitung';

  @override
  String get iarReasonMalwareGuildDescription =>
      'Verbreitet Malware, stiehlt Anmeldedaten oder schädliche Dateien.';

  @override
  String get iarReasonPrivacyGuildLabel =>
      'Verstoß gegen den Datenschutz oder Doxing';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'Gibt persönliche Informationen weiter, stalkt Nutzer oder koordiniert den Missbrauch der Privatsphäre.';

  @override
  String get iarReasonSelfHarmGuildLabel => 'Fördert Selbstverletzung';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'Fördert Suizid, Selbstverletzung oder Essstörungen.';

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
  String get slowmodeStatusEnabled => 'Slow-Modus ist aktiviert';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Slow-Modus ist aktiv ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'Der Slow-Modus ist auf $durationLabel eingestellt, aber du bist davon ausgenommen.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Der Slow-Modus ist auf $durationLabel eingestellt. Warte, bevor du eine weitere Nachricht sendest.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Der Slow-Modus ist für diesen Kanal auf $durationLabel eingestellt.';
  }

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
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName überschreitet die Größenbeschränkung ($fileSize)';
  }

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
      'Gedrückt halten zum Aufnehmen. Ziehe zum Löschen in den Papierkorb, schiebe nach oben zum Sperren oder lass los zum Senden.';

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
  String get voiceMessageSeekForward => 'Vorwärts spulen';

  @override
  String get voiceMessageSeekBackward => 'Rückwärts spulen';

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
  String get chatAttachmentDownloadedToast => 'Gespeichert in Fotos';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Anhang konnte nicht heruntergeladen werden';

  @override
  String get chatAttachmentExpiredTooltip => 'Anhang abgelaufen';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Erweitern ($count Zeilen)',
      one: 'Erweitern ($count Zeile)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zuklappen ($count Zeilen)',
      one: 'Zuklappen ($count Zeile)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Erweitern ($count Zeilen)',
      one: 'Erweitern ($count Zeile)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ausblenden ($count Zeilen)',
      one: 'Ausblenden ($count Zeile)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count Zeilen übrig)',
      one: '... ($count Zeile übrig)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count Zeilen übrig)',
      one: '... ($count Zeile übrig)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'Ganze Datei ansehen';

  @override
  String get chatTextualPreviewChangeLanguage => 'Sprache ändern';

  @override
  String get chatTextualPreviewSearchLanguage => 'Sprache suchen…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Syntaxhervorhebung';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'Keine Ergebnisse gefunden';

  @override
  String get chatTextualPreviewMoreOptions => 'Weitere Optionen';

  @override
  String get chatTextualPreviewWrapText => 'Text umbrechen';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'Die Datei ist zu groß für die Inline-Vorschau (Limit $previewLimitKb KB).';
  }

  @override
  String get chatTextualPreviewLoadError =>
      'Vorschau konnte nicht geladen werden.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Nur Text';

  @override
  String get chatTextualPreviewCopy => 'Kopieren';

  @override
  String get chatAttachmentSourceGallery => 'Galerie';

  @override
  String get chatAttachmentSourceCamera => 'Kamera';

  @override
  String get chatAttachmentSourceBrowse => 'Dateien durchsuchen';

  @override
  String get chatAttachmentPasteTooltip => 'Datei aus Zwischenablage einfügen';

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
  String connectionsDescription(String productName) {
    return 'Verknüpfe externe Accounts und Domains mit deinem $productName-Profil. Verifizierte Verbindungen werden auf deinem Profil angezeigt.';
  }

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
  String get lookAndFeelHdrSectionTitle => 'Hoher Dynamikbereich';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Lege fest, wie HDR-Bilder auf HDR-fähigen Monitoren angezeigt werden.';

  @override
  String get lookAndFeelHdrFullName => 'Voller Dynamikbereich';

  @override
  String get lookAndFeelHdrFullDescription =>
      'HDR-Bilder mit voller Helligkeit und Farbumfang anzeigen.';

  @override
  String get lookAndFeelHdrStandardName => 'Standardbereich';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'HDR-Bilder auf den Standardbereich tonemappen, wodurch die Spitzenhelligkeit reduziert wird.';

  @override
  String get lookAndFeelHdrDisplayModeLabel => 'HDR-Anzeigemodus';

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
  String get lookAndFeelChatFontScalingTitle =>
      'Skalierung der Chat-Schriftart';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Passe die Schriftgröße im Chatbereich an.';

  @override
  String get lookAndFeelChatFontSizeLabel => 'Schriftgröße im Chat';

  @override
  String get lookAndFeelAppZoomTitle => 'App-Zoomstufe';

  @override
  String get lookAndFeelAppZoomDescription =>
      'Zoomstufe der Anwendung anpassen.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'Chat-Hintergrund';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'Wähle einen Hintergrund für Chats. Dieser bleibt auf diesem Gerät.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'Diese Einstellung bleibt auf diesem Gerät';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'Das Chat-Hintergrundbild wird nur auf diesem Gerät gespeichert und nicht mit anderen Geräten synchronisiert.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'Standard';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'Benutzerdefiniertes Bild';

  @override
  String get lookAndFeelChatWallpaperStarfieldLabel => 'Starfield';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Farbe $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Verlauf $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'Hintergrund abdunkeln';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'Das Bild konnte nicht als Hintergrund festgelegt werden.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Nachrichten';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Wähle aus, wie Nachrichten in Chat-Kanälen angezeigt werden.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Abstand zwischen Nachrichtengruppen';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => 'Nachrichtenanzeige';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Bequem';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Großzügiges Layout mit klarer visueller Trennung zwischen Nachrichten.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Kompakt';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Maximiert die sichtbaren Nachrichten bei minimalem Abstand.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'Benutzer-Avatare ausblenden';

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
  String get communityTemporarilyUnavailable =>
      'Community vorübergehend nicht verfügbar';

  @override
  String get guildUnavailableDescription =>
      'Etwas ist schiefgelaufen. Wir arbeiten daran.';

  @override
  String get guildNotFoundTitle =>
      'Das ist nicht die Community, die du suchst.';

  @override
  String get guildNotFoundDescription =>
      'Die gesuchte Community wurde möglicherweise gelöscht oder du hast keinen Zugriff darauf.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return '$communityName ist derzeit nur für $productName-Mitarbeiter zugänglich';
  }

  @override
  String get guildNavbarTemporarilyUnavailable =>
      'vorübergehend nicht verfügbar';

  @override
  String get lookAndFeelCollapseDMsLabel => 'DMs in Ordner einklappen';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'Wenn aktiviert, werden ungelesene DMs in der Server-Seitenleiste in einem Ordner auf der $productName-Schaltfläche eingeklappt. Klicke auf die $productName-Schaltfläche, während du dich auf der DMs-Seite befindest, um den Ordner ein- oder auszuklappen.';
  }

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
  String get favoritesAddToSavedMedia =>
      'Zu \"Gespeicherte Medien\" hinzufügen';

  @override
  String get favoritesRemoveFromSavedMedia =>
      'Aus den gespeicherten Medien entfernen';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Zu den URL-basierten GIF-Favoriten hinzufügen';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Aus der Liste der per URL gespeicherten GIFs entfernen';

  @override
  String get savedMediaAddTitle => 'Zu \"Gespeicherte Medien\" hinzufügen';

  @override
  String get savedMediaFormNameLabel => 'Name';

  @override
  String get savedMediaFormNameHint => 'Meine tollen Medien';

  @override
  String get savedMediaFormAltTextLabel => 'Alternativtext';

  @override
  String get savedMediaFormAltTextHint => 'Medien beschreiben';

  @override
  String get savedMediaFormTagsLabel => 'Tags';

  @override
  String get savedMediaFormTagsHint => 'lustig, Reaktion, Arbeit';

  @override
  String get savedMediaSaveError =>
      'Gespeicherte Medien konnten nicht aktualisiert werden.';

  @override
  String get savedMediaNameRequired => 'Name ist erforderlich.';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'Wie sollen wir deine GIF-Favoriten speichern?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'Du kannst markierte GIFs als Favoriten nur mit URL speichern oder sie in deine gespeicherten Medien hochladen. Wähle die Option, die am besten zu deiner Nutzung passt. Du kannst dies jederzeit in Einstellungen > Erweitert > Medien ändern.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'URL-Favoriten (Standard): synchronisiert über deine Geräte, kein Upload, zählt nicht zum gespeicherten Speicherplatz. Die Originalmedien können verschwinden, wenn der Host sie entfernt.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Gespeicherte Medien: hochgeladen, tagbar, durchsuchbar und persistent, aber sie zählen zu deinem Limit für gespeicherte Medien.';

  @override
  String get gifFavoriteFirstTimeHint => 'Wir fragen nur einmal.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly => 'Nur URL verwenden (empfohlen)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia =>
      'Gespeicherte Medien verwenden';

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
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'Wenn direkt zu $productName hochgeladen';
  }

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
  String get messagesMediaCameraUploadsSectionTitle => 'Kamera-Uploads';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Wähle aus, ob Fotos und Videos, die mit der In-App-Kamera aufgenommen werden, auf deinem Gerät gespeichert werden sollen';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel =>
      'Auf Gerät speichern';

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
  String get accessibilitySaturationTitle => 'Sättigung';

  @override
  String get accessibilitySaturationDescription =>
      'Lege fest, wie lebendig Farben im gesamten App-Design erscheinen.';

  @override
  String get accessibilityVisualGroupTitle => 'Visuell';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'Links immer unterstreichen';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Durchgestrichenen Text abdunkeln';

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
  String get accessibilityScreenReaderGroupTitle => 'Bildschirmleser';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Steuere, wie $productName mit Screenreadern funktioniert.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Neue Nachrichten ankündigen';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Bildschirmleser neue Nachrichten ankündigen lassen, sobald sie im geöffneten Kanal eingehen. Benachrichtigungstöne sind davon nicht betroffen.';

  @override
  String get accessibilityTtsGroupTitle => 'Text-to-Speech';

  @override
  String get accessibilityTtsGroupDescription =>
      'Wähle eine Geschwindigkeit für den vorgelesenen Text aus.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Wiedergabegeschwindigkeit für Sprache';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Beispiel abspielen';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Beispiel stummschalten';

  @override
  String get accessibilityPreviewButtonLabel => 'Vorschau-Button';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'So werden Links angezeigt: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Vorschau-Benutzer';

  @override
  String get accessibilityKeyboardGroupTitle => 'Tastatur';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Fokusring im Texteingabefeld anzeigen';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'Escape-Taste beendet den Tastaturmodus';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Kontextmenü-Shortcuts anzeigen';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Vor Anrufen bestätigen';

  @override
  String get accessibilityAnimationGroupTitle => 'Animation';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'Reduzierte Bewegung ist aktiviert, daher sind Inhaltsanimationen standardmäßig pausiert. Du kannst sie aber jederzeit wieder aktivieren, um sie abzuspielen.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel =>
      'Animierte Emojis abspielen';

  @override
  String get accessibilityAutoPlayGifsMobileLabel =>
      'GIFs automatisch abspielen';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'GIFs automatisch abspielen, wenn $productName fokussiert ist';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Wird trotz reduzierter Bewegung wiedergegeben.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Angehalten durch reduzierte Bewegung. Einschalten, um animierte Emojis weiterhin abzuspielen.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Angehalten durch reduzierte Bewegung. Einschalten, damit GIFs weiter abgespielt werden.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'Standardmäßig auf Mobilgeräten deaktiviert, um Akku und Datenvolumen zu schonen.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Sticker-Animationen';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Sticker-Animationseinstellungen';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Immer animieren';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Sticker werden immer animiert';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Animation bei Interaktion';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Sticker werden animiert, wenn du sie antippst';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Sticker werden animiert, wenn du mit der Maus darüberfährst oder mit ihnen interagierst';

  @override
  String get accessibilityStickerNeverAnimateName => 'Nie animieren';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Sticker werden nie animiert';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Immer animiert, obwohl Bewegung reduziert ist.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'Bei reduzierter Bewegung werden Sticker nur bei Interaktion animiert. Wähle „Immer animieren“, um dies zu überschreiben.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'Standardmäßig werden Animationen auf Mobilgeräten bei Interaktion abgespielt, um Akkulaufzeit zu sparen.';

  @override
  String get accessibilityMotionGroupTitle => 'Bewegung';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Reduzierte Bewegung mit Systemeinstellungen synchronisieren';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Verwende die Einstellung für reduzierte Bewegung dieses Geräts oder passe sie unten an.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Bewegung reduzieren';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Deaktiviert Animationen und Übergänge. Derzeit über deine Systemeinstellungen gesteuert.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Animationen und Übergänge in der App deaktivieren.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Animierte Emojis, GIFs und Sticker bleiben im Tab „Animation“ unter deiner Kontrolle.';

  @override
  String get accessibilityConfirmStartCallTitle => 'Anruf starten?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Möchtest du diesen Anruf wirklich starten?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Anruf starten';

  @override
  String get accessibilityTtsSampleDescription =>
      'Höre den Beispielsatz in der von dir gewählten Geschwindigkeit.';

  @override
  String get accessibilityTtsSampleText =>
      'Doc, ich komme aus der Zukunft. Ich bin in einer Zeitmaschine hierhergekommen, die du erfunden hast. Jetzt brauche ich deine Hilfe, um zurück ins Jahr 1985 zu gelangen.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'Sprachsynthese ist auf diesem Gerät nicht verfügbar.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Sprachwiedergabe fehlgeschlagen. Versuche es noch einmal oder prüfe, ob die Audioausgabe funktioniert.';

  @override
  String get ttsSubstitutionUnknownUser => 'Unbekannter Nutzer';

  @override
  String get ttsSubstitutionUnknownRole => 'Unbekannte Rolle';

  @override
  String get ttsSubstitutionUnknownChannel => 'Unbekannter Kanal';

  @override
  String get ttsSubstitutionCodeBlock => 'Codeblock';

  @override
  String get ttsSubstitutionSpoiler => 'Spoiler';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'Emoji \"$emojiName\"';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return 'Slash $commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName sagte: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'Antwort auf $replyAuthorName: $authorName sagte: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName von $description';
  }

  @override
  String get ttsSentSticker => 'hat einen Sticker gesendet';

  @override
  String get ttsSentAttachment => 'hat einen Anhang gesendet';

  @override
  String ttsSentAttachments(int count) {
    return '$count Anhänge gesendet';
  }

  @override
  String get ttsSentEmbed => 'hat eine Einbettung gesendet';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author hat $summary gesendet';
  }

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
  String get systemCallJoinTheCall => 'Anruf beitreten';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username hat einen Anruf gestartet, der $duration dauerte.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'Du hast einen Anruf von $username verpasst, der $duration dauerte.';
  }

  @override
  String systemCallMissed(String username) {
    return 'Du hast einen Anruf von $username verpasst.';
  }

  @override
  String get systemCallDurationFewSeconds => 'vor ein paar Sekunden';

  @override
  String get systemCallDurationMinute => 'einer Minute';

  @override
  String get systemCallDurationOneYear => '1 Jahr';

  @override
  String get systemCallDurationOneMonth => '1 Monat';

  @override
  String get systemCallDurationOneWeek => '1 Woche';

  @override
  String get systemCallDurationOneDay => '1 Tag';

  @override
  String get systemCallDurationOneHour => '1 Stunde';

  @override
  String systemCallDurationYears(int count) {
    return '$count Jahre';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count Monate';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count Wochen';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count Tage';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count Stunden';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count Minuten';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Aktualisiere $productName, um diese Nachricht anzuzeigen.';
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
  String get voiceJoinFailedTitle => 'Konnte Stimme nicht beitreten';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Deine anderen Geräte konnten nicht getrennt werden. Versuche es gleich noch einmal.';

  @override
  String get voiceChannelEmptyDescription =>
      'Dies ist ein Sprachkanal. Verbinde dich, um zu sprechen!';

  @override
  String get voiceChannelJoin => 'Sprachkanal beitreten';

  @override
  String get voiceCallJoin => 'Anruf beitreten';

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
  String get voiceControlFlipCamera => 'Kamera wechseln';

  @override
  String get voiceControlScreenShare => 'Bildschirmfreigabe';

  @override
  String get voiceScreenShareNotificationText => 'Bildschirm wird geteilt.';

  @override
  String get voiceControlMore => 'Mehr';

  @override
  String get voiceControlDisconnect => 'Trennen';

  @override
  String get voiceInChat => 'Im Sprach-Chat';

  @override
  String get voiceConnectionFailed => 'Verbindung fehlgeschlagen';

  @override
  String get voiceConnectionRetry => 'Erneut versuchen';

  @override
  String get voiceConnectionDismiss => 'Schließen';

  @override
  String get voiceConnectionDisconnected => 'Getrennt';

  @override
  String voicePingMs(int currentLatency) {
    return 'Ping: $currentLatency ms';
  }

  @override
  String get voiceMeasuringLatency => 'Latenz wird gemessen …';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Zu $channelSourceLabel springen';
  }

  @override
  String get voiceConnectionTitle => 'Sprachverbindung';

  @override
  String get voiceConnectionAdvancedStats => 'Erweitert';

  @override
  String get voiceShowCallAvatars => 'Anruf-Avatare anzeigen';

  @override
  String get voiceShowConnectionId => 'Verbindungs-ID anzeigen';

  @override
  String get voiceAudioProcessing => 'Audioverarbeitung';

  @override
  String get voiceConnectionSessionSection => 'Sitzung';

  @override
  String get voiceConnectionDurationLabel => 'Dauer';

  @override
  String get voiceConnectionParticipantsLabel => 'Teilnehmer';

  @override
  String get voiceConnectionNetworkSection => 'Netzwerk';

  @override
  String get voiceConnectionPingLabel => 'Anpingen';

  @override
  String get voiceConnectionJitterLabel => 'Jitter';

  @override
  String get voiceConnectionSendLabel => 'Senden';

  @override
  String get voiceConnectionReceiveLabel => 'Empfangen';

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
    return '$bandwidth kbit/s';
  }

  @override
  String get userAreaMuteMicrophone => 'Mikrofon stummschalten';

  @override
  String get userAreaUnmuteMicrophone => 'Mikrofon stummschalten aufheben';

  @override
  String get userAreaUserSettings => 'Benutzereinstellungen';

  @override
  String get voiceParticipantMenuViewProfile => 'Profil ansehen';

  @override
  String get voiceParticipantMenuFocus => 'Diese Person fokussieren';

  @override
  String get voiceParticipantMenuUnfocus => 'Fokus aufheben';

  @override
  String get voiceParticipantMenuCommunityMute => 'Community-Stummschaltung';

  @override
  String get voiceParticipantMenuCommunityDeafen =>
      'Community-Stummschaltung (Sprachchat)';

  @override
  String get voiceParticipantMenuUserVolume => 'Nutzerlautstärke';

  @override
  String get voiceParticipantMenuStreamVolume => 'Stream-Lautstärke';

  @override
  String get voiceParticipantMenuStopStreaming => 'Streaming beenden';

  @override
  String get voiceParticipantModerationFailed =>
      'Das Mitglied konnte nicht aktualisiert werden. Bitte versuche es erneut.';

  @override
  String get voiceControlChat => 'Chat';

  @override
  String get voiceCallViewModeLabel => 'Anzeigen';

  @override
  String get voiceCallViewModeGrid => 'Raster';

  @override
  String get voiceCallViewModeFocus => 'Fokus';

  @override
  String get voicePanelSettingsSectionTitle => 'Spracheinstellungen';

  @override
  String get voicePanelUseEarpieceLabel => 'Mit Ohrhörer verwenden';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Nur Videos anzeigen';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Nur Teilnehmer anzeigen, die ihre Kamera eingeschaltet haben.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Eigene Kamera anzeigen';

  @override
  String get voicePrioritizeSpeakersLabel => 'Sprecher priorisieren';

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
  String get privacyDashboardProfilePrivacySection => 'Profil-Datenschutz';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Freunde und Direktnachrichten';

  @override
  String get privacyDashboardActivitySharingSection => 'Aktivitätsfreigabe';

  @override
  String get privacyDashboardSensitiveContentSection => 'Sensible Inhalte';

  @override
  String get privacyDashboardDataExportSection => 'Datenexport';

  @override
  String get privacyDashboardDataDeletionSection => 'Datenlöschung';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Wer dein vollständiges Profil sehen kann';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Freunde und alle Communitys';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Dein vollständiges Profil ist für Freunde und für alle in deinen Communitys sichtbar';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Nur Freunde und kleine Communitys';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Dein vollständiges Profil ist für Freunde und Mitglieder deiner Communitys mit 200 oder weniger Mitgliedern sichtbar';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Nur Freunde';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Dein vollständiges Profil ist nur für deine Freunde sichtbar';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Freundschaftsanfragen';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Jeder';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Jeder kann dir Freundschaftsanfragen senden';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Freunde von Freunden';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Anfragen von Freunden deiner Freunde zulassen';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Community-Mitglieder';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Erlaube Mitgliedern aus Communities, in denen du bist, dir Anfragen zu senden';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Direktnachrichten';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Direktnachrichten von Community-Mitgliedern zulassen';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Erlaube Mitgliedern aus Communities, in denen du bist, dir Direktnachrichten zu senden';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Direktnachrichten von Community-Bots zulassen';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Erlaube Bots aus Communities, in denen du bist, dir Direktnachrichten zu senden';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Lege fest, wer dir Freundschaftsanfragen und Direktnachrichten senden kann';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Lege fest, wer dich anrufen und dich zu Gruppenchats hinzufügen kann';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Anrufe';

  @override
  String get privacyDashboardIncomingCallsDesc =>
      'Lege fest, wer dich anrufen kann';

  @override
  String get privacyDashboardAllowedCallers => 'Erlaubte Anrufer';

  @override
  String get privacyDashboardIncomingCallNobody => 'Niemand';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Alle eingehenden Anrufe blockieren';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Nur Freunde';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Nur Freunde dürfen dich anrufen (empfohlen)';

  @override
  String get privacyDashboardIncomingCallCustom =>
      'Freunde + Benutzerdefiniert';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Freunde plus zusätzliche Gruppen, die du auswählst';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Jeder';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Erlaube jedem, dich anzurufen, auch Fremden';

  @override
  String get privacyDashboardAdditionalGroups => 'Zusätzliche Gruppen';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'Personen, die mit deinen Freunden befreundet sind, können dich anrufen';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'Personen aus Communities, in denen ihr beide Mitglied seid, können dich anrufen';

  @override
  String get privacyDashboardRingBehavior => 'Ring-Verhalten';

  @override
  String get privacyDashboardSilentCalls => 'Anrufe von allen stummschalten';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'Alle Anrufe werden lautlos benachrichtigt, anstatt zu klingeln. Standardmäßig sind Anrufe von Nicht-Freunden immer lautlos.';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Wer kann dich zu Gruppenchats hinzufügen';

  @override
  String get privacyDashboardGroupDmDesc =>
      'Lege fest, wer dich ohne Nachfrage zu Gruppenchats hinzufügen kann. Jeder kann dir weiterhin Einladungslinks zum Beitreten senden.';

  @override
  String get privacyDashboardAllowedInvites => 'Erlaubte Einladungen';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Lass dich nicht ohne deine Zustimmung zu Gruppenchats hinzufügen';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Nur Freunde dürfen dich ohne Anfrage hinzufügen (empfohlen)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Freunde und zusätzliche Gruppen können dich hinzufügen';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Jeder kann dich zu Gruppenchats hinzufügen, ohne zu fragen';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'Personen, die mit deinen Freunden befreundet sind, können dich zu Gruppenchats hinzufügen';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'Personen aus Communities, in denen ihr beide Mitglied seid, können dich zu Gruppenchats hinzufügen';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Sprachaktivität bei „Jetzt aktiv\"';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Sprachaktivität mit Freunden teilen';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Sprachaktivität mit allen Freunden teilen?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Sprachaktivität nicht mehr mit allen Freunden teilen?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Du bist dabei, deine Sprachaktivität mit all deinen Freunden – auch zukünftigen – zu teilen. Dadurch erhalten alle eine Benachrichtigung und die Einstellung kann erst in 24 Stunden wieder geändert werden.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Du bist dabei, deine Sprachaktivität nicht mehr mit deinen aktuellen und zukünftigen Freunden zu teilen. Dadurch wird eine Benachrichtigung an alle gesendet und die Einstellung kann erst in 24 Stunden wieder geändert werden.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Ja, mit allen Freunden teilen';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm =>
      'Ja, Teilen beenden';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Wieder verfügbar in $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Sprachaktivitätsfreigabe aktualisiert';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Sprachaktivität konnte nicht aktualisiert werden';

  @override
  String get privacyDashboardDataExportDesc =>
      'Erstelle ein herunterladbares Archiv deiner Accountdaten, einschließlich Nachrichten und Anhang-URLs. Die meisten Leute möchten alles, aber du kannst den Umfang unten einschränken.';

  @override
  String get privacyDashboardExportMyData => 'Meine Daten exportieren';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Entfernt dauerhaft Nachrichten, die du in DMs, Gruppen-DMs und Communitys gesendet hast. Der Vorgang läuft im Hintergrund und du erhältst eine DM, wenn er abgeschlossen ist.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Meine Nachrichten löschen';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Direktnachrichten von Community-Mitgliedern zulassen?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Direktnachrichten von Community-Mitgliedern blockieren?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Sollen Bots dir Direktnachrichten senden dürfen?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Bots am Senden von Direktnachrichten hindern?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Möchtest du auch Direktnachrichten von Mitgliedern deiner bestehenden Communitys zulassen?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Möchtest du auch Direktnachrichten von Mitgliedern deiner bestehenden Communitys blockieren?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Möchtest du auch Bots aus deinen bestehenden Communitys erlauben, dir Direktnachrichten zu senden?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Möchtest du auch Bots aus deinen bestehenden Communitys blockieren?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'Du kannst diese Einstellung auch pro Community ändern, indem du lange auf den Community-Namen drückst und \"Privatsphäre-Einstellungen\" auswählst.';

  @override
  String get privacyDashboardDmConfirmAllowAll =>
      'Für alle Communitys zulassen';

  @override
  String get privacyDashboardDmConfirmBlockAll =>
      'Für alle Communitys blockieren';

  @override
  String get privacyDashboardDmConfirmSkip => 'Diesen Schritt überspringen';

  @override
  String get privacyDashboardDataRequestGoBack => 'Zurück';

  @override
  String get privacyDashboardDataRequestExportTitle =>
      'Meine Daten exportieren';

  @override
  String get privacyDashboardDataRequestDeleteTitle =>
      'Meine Nachrichten löschen';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'Wir verarbeiten deine Anfrage so schnell wie möglich. Du erhältst eine E-Mail, sobald dein Export fertig ist.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'Wir bearbeiten dies so schnell wie möglich. Du erhältst eine DM von uns, wenn es erledigt ist.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'Was enthalten sein soll';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Alles';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Exportiert jede Nachricht, die du jemals gesendet hast, sowie alle deine Accounteinstellungen, Mitgliedschaften und Metadaten.';

  @override
  String get privacyDashboardDataRequestExportCustom =>
      'Benutzerdefinierte Auswahl';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Wähle aus, welche Arten von Konversationen, Communitys und Zeiträume im Archiv enthalten sein sollen.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Auswählen, was einbezogen werden soll';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Wählen Sie aus, welche Arten von Unterhaltungen bereinigt werden sollen.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Nur Orte, auf die ich nicht mehr zugreifen kann';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Nur Nachrichten aus Communitys und Gruppen-DMs löschen, die du verlassen hast oder aus denen du entfernt wurdest.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Welche Unterhaltungen';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Wähle die Art von Unterhaltungen aus, die du einbeziehen möchtest.';

  @override
  String get privacyDashboardDataRequestKindDms => 'Offene DMs';

  @override
  String get privacyDashboardDataRequestKindDmsClosed => 'Geschlossene DMs';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'Gruppen-DMs';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Communitys';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Welche Communitys';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Community-Filter';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Alle außer ausgewählten einschließen';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude =>
      'Nur die ausgewählten';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'Du bist derzeit in keiner Community.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Zeitraum';

  @override
  String get privacyDashboardDataRequestDateMode => 'Zeitraum';

  @override
  String get privacyDashboardDataRequestAllTime => 'Gesamter Zeitraum';

  @override
  String get privacyDashboardDataRequestCustomRange =>
      'Benutzerdefinierter Bereich';

  @override
  String get privacyDashboardDataRequestStartDate => 'Startdatum';

  @override
  String get privacyDashboardDataRequestEndDate => 'Enddatum';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Lassen Sie ein Feld leer, um das Ende des Zeitraums unbegrenzt zu lassen.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Wähle mindestens eine Konversationsart aus, die einbezogen werden soll.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'Das Startdatum muss vor dem Enddatum liegen.';

  @override
  String get privacyDashboardDataRequestConfirmTitle =>
      'Überprüfen und bestätigen';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'Wir erstellen ein herunterladbares Archiv aller Nachrichten, die Sie jemals gesendet haben, und senden Ihnen eine E-Mail, sobald es fertig ist. Der Download-Link in dieser E-Mail läuft nach 7 Tagen ab.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'Wir erstellen ein herunterladbares Archiv, das den unten stehenden Filtern entspricht, und senden Ihnen eine E-Mail, sobald es fertig ist. Der Download-Link in dieser E-Mail läuft nach 7 Tagen ab.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Die Nachrichten, die den unten stehenden Filtern entsprechen, werden dauerhaft gelöscht. Dies kann nicht rückgängig gemacht werden.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'Sobald dies beginnt, gibt es keine Wiederherstellung mehr. Wir senden dir eine Direktnachricht, wenn es abgeschlossen ist.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'Export anfordern';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Nachrichten löschen';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Umfang';

  @override
  String get privacyDashboardDataRequestSummaryConversations =>
      'Unterhaltungen';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Communitys';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Zeitraum';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'Keine';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'Ab $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'Bis $end';
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
      other: '# Communitys',
      one: '# Community',
    );
    return 'Alle außer $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# Communitys',
      one: '# Community',
    );
    return 'Nur $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Offene Direktnachrichten';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Geschlossene Direktnachrichten';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Direktnachrichten (offen und geschlossen)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'Gruppen-DMs';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Communitys';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# Stunden',
      one: '# Stunde',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# Minuten',
      one: '# Minute',
    );
    return '$_temp0 und $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# Stunden',
      one: '# Stunde',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# Minuten',
      one: '# Minute',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# Sekunden',
      one: '# Sekunde',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed =>
      'Datenschutzeinstellungen konnten nicht geladen werden';

  @override
  String get privacyDashboardRetry => 'Erneut versuchen';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Einstellungen für sensible Inhalte konnten nicht gespeichert werden.';

  @override
  String get privacyDashboardDataRequestFailed =>
      'Anfrage konnte nicht abgeschlossen werden.';

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
  String get forwardSendSlowmodeBlocked =>
      'Warten, bis der Slow Mode in einem oder mehreren ausgewählten Channels abläuft.';

  @override
  String get slowmodeRateLimitedTitle => 'Langsamer Modus aktiv';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'Der Langsam-Modus ist aktiv – warte $duration, bevor du eine weitere Nachricht sendest.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'Direkter Upload ist während des Zeitlimits deaktiviert.';

  @override
  String get shareMediaTitle => 'Teilen mit';

  @override
  String get shareMediaMessageHint => 'Eine optionale Nachricht hinzufügen…';

  @override
  String get shareMediaSendButton => 'Senden';

  @override
  String get shareMediaSuccessToast => 'Medien geteilt';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'An $count Ziele gesendet';
  }

  @override
  String get shareMediaFailedToast => 'Medienfreigabe fehlgeschlagen';

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
  String get chatMessageCopyEmbedText => 'Embed-Text kopieren';

  @override
  String get chatMessageTranslate => 'Übersetzen';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Übersetzt aus $language';
  }

  @override
  String get chatMessageSeeOriginal => 'Original anzeigen';

  @override
  String get chatMessageSeeTranslation => 'Übersetzung anzeigen';

  @override
  String get chatMessageTranslating => 'Übersetze…';

  @override
  String get chatMessageTranslateFailed =>
      'Diese Nachricht konnte nicht übersetzt werden.';

  @override
  String get chatMessageTranslateUnavailable =>
      'Übersetzung ist auf diesem Gerät nicht verfügbar.';

  @override
  String get chatMessageSpeak => 'Nachricht vorlesen';

  @override
  String get chatMessageStopSpeaking => 'Sprachnachricht stoppen';

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
  String get chatMessageOpenLink => 'Link öffnen';

  @override
  String get chatMessageCopyLink => 'Link kopieren';

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
  String get chatReactionAddFailed =>
      'Reaktion konnte nicht hinzugefügt werden';

  @override
  String get chatReactionRemoveFailed =>
      'Reaktion konnte nicht entfernt werden';

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
  String iarReasonOtherDescription(String productName) {
    return 'Nur verwenden, wenn es eindeutig gegen die Regeln von $productName verstößt und nicht oben passt.';
  }

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
  String get chatMessageDeleteAttachment => 'Anhang löschen';

  @override
  String get chatMessageEditAttachmentAltText => 'Alternativtext bearbeiten';

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
      other: '$count blockierte Nachrichten',
      one: '1 blockierte Nachricht',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count potenziell Spam-Nachrichten',
      one: '1 potenziell Spam-Nachricht',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Antwort ausgeblendet, da der ursprüngliche Autor blockiert ist.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Antwort ausgeblendet, da der ursprüngliche Autor als Spammer markiert ist.';

  @override
  String get devMarkAsSpamLocally => 'Lokal als Spam markieren';

  @override
  String get devIgnoreSpamFlag => 'Spam-Markierung ignorieren';

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
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

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
  String get mediaViewerOptions => 'Medienoptionen';

  @override
  String get mediaViewerCopyLink => 'Link kopieren';

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
  String mediaViewerAttachmentThumbnail(int index) {
    return 'Anhang $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Schließen';

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
  String get composerAutocompleteSuggestions => 'Vorschläge';

  @override
  String get composerAutocompleteCommandsHeading => 'Befehle';

  @override
  String get composerAutocompleteChoicesHeading => 'Auswahl';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'Optionale Argumente';

  @override
  String get composerAutocompleteChannelsHeading => 'Kanäle';

  @override
  String get composerAutocompleteMembersHeading => 'Mitglieder';

  @override
  String get composerAutocompleteUsersHeading => 'Nutzer';

  @override
  String get composerAutocompleteMentionsHeading => 'Erwähnungen';

  @override
  String get composerAutocompleteRolesHeading => 'Rollen';

  @override
  String get composerAutocompleteMediaHeading => 'Medien';

  @override
  String get composerAutocompleteStickersHeading => 'Sticker';

  @override
  String get composerAutocompleteGifsHeading => 'Hardware';

  @override
  String get composerAutocompleteNoGifs => 'Keine GIFs gefunden';

  @override
  String get composerCommandShrugDescription =>
      'Fügt ¯\\_(ツ)_/¯ zu deiner Nachricht hinzu.';

  @override
  String get composerCommandTableflipDescription =>
      'Fügt (╯°□°)╯︵ ┻━┻ an deine Nachricht an.';

  @override
  String get composerCommandUnflipDescription =>
      'Fügt ┬─┬ ノ( ゜-゜ノ) zu deiner Nachricht hinzu.';

  @override
  String get composerCommandMeDescription =>
      'Aktionsnachricht senden (wird kursiv angezeigt).';

  @override
  String get composerCommandSpoilerDescription =>
      'Spoiler-Nachricht senden (wird in Spoiler-Tags verpackt).';

  @override
  String get composerCommandTtsDescription =>
      'Text-to-Speech-Nachricht senden.';

  @override
  String get composerCommandNickDescription =>
      'Ändere deinen Anzeigename in dieser Community.';

  @override
  String get composerCommandKickDescription =>
      'Ein Mitglied aus dieser Community entfernen.';

  @override
  String get composerCommandBanDescription =>
      'Ein Mitglied aus dieser Community bannen.';

  @override
  String get composerCommandMsgDescription =>
      'Direktnachricht an einen Nutzer senden.';

  @override
  String get composerCommandSavedDescription => 'Gespeichertes Medium senden.';

  @override
  String get composerCommandStickerDescription => 'Sticker senden.';

  @override
  String get composerCommandGifDescription => 'GIF suchen und senden.';

  @override
  String get composerCommandMemberOption =>
      'Das Mitglied, das angesprochen werden soll.';

  @override
  String get composerCommandReasonOption => 'Grund (optional).';

  @override
  String get composerCommandMessageOption =>
      'Die Nachricht, die gesendet werden soll.';

  @override
  String get composerCommandQueryOption => 'Wonach gesucht werden soll.';

  @override
  String get composerCommandNicknameOption =>
      'Dein neuer Nickname oder leer lassen, um ihn zurückzusetzen.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'Wie viele der letzten Nachrichten des Mitglieds gelöscht werden sollen.';

  @override
  String get composerCommandDeleteMessagesNone => 'Keine löschen';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Vorherige $count Tage';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'Letzte 24 Stunden';

  @override
  String get composerCommandOptionRequired =>
      'Diese Option ist erforderlich. Bitte gib einen Wert an.';

  @override
  String get composerCommandClear => 'Befehl löschen';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'Du hast deinen Anzeigenamen in dieser Community von **$previousNickname** zu **$newNickname** geändert.';
  }

  @override
  String get composerCommandUnknownUser => 'Unbekannter Nutzer';

  @override
  String composerCommandMsgFailed(String username) {
    return 'Nachricht an **$username** konnte nicht gesendet werden. Möglicherweise sind Direktnachrichten für diese Person deaktiviert oder du wurdest blockiert.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+ $count mehr';
  }

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
  String get addGuildCreateTitle => 'Community erstellen';

  @override
  String get addGuildCreateDescription =>
      'Erstelle eine Community, in der du und deine Freunde chatten können.';

  @override
  String get addGuildCreateNameLabel => 'Community-Name';

  @override
  String get addGuildCreateSubmit => 'Community erstellen';

  @override
  String get addGuildCreateFailed =>
      'Konnte die Community nicht erstellen. Bitte versuche es erneut.';

  @override
  String get addGuildCreateClaimTitle => 'Deinen Account beanspruchen';

  @override
  String get addGuildCreateClaimDescription =>
      'Du musst zuerst deinen Account beanspruchen, bevor du eine Community erstellen kannst.';

  @override
  String get addGuildCreateVerifyTitle => 'E-Mail-Adresse bestätigen';

  @override
  String get addGuildCreateVerifyDescription =>
      'Du musst deine E-Mail-Adresse bestätigen, bevor du eine Community erstellen kannst.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Animierte Icons werden beim Erstellen einer neuen Community nicht unterstützt. Verwende ein statisches Bild.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'Mit dem Erstellen einer Community stimmst du zu, die ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return '$productName Community-Richtlinien';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'Auf dieser Instanz gibt es nur eine Community. Zusätzliche Communities können nicht erstellt werden.';

  @override
  String get addGuildCreateChangeIcon => 'Symbol ändern';

  @override
  String get addGuildCreateIconLabel => 'Community-Icon';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Max. 10 MB. Empfohlen: 512×512px';

  @override
  String get addGuildImportDescription =>
      'Füge eine Discord-Vorlagen-URL ein, um deren Struktur in eine neue Community zu importieren.';

  @override
  String get addGuildImportUrlLabel => 'Vorlagen-URL';

  @override
  String get addGuildImportUrlInvalid =>
      'Gib eine gültige Discord-Vorlagen-URL oder einen gültigen Code ein.';

  @override
  String get addGuildImportFetchFailed =>
      'Die Community-Vorlage konnte nicht abgerufen werden. Die Vorlage existiert möglicherweise nicht oder der externe Dienst ist nicht verfügbar.';

  @override
  String get addGuildImportInvalidResponse =>
      'Das sieht nicht wie eine gültige Vorlagenantwort aus.';

  @override
  String get addGuildImportTemplateLabel => 'Vorlage';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount Text, $voiceChannelCount Sprach, $categoryCount Kategorien, $roleCount Rollen';
  }

  @override
  String get addGuildImportRemoveIcon => 'Icon entfernen';

  @override
  String get addGuildImportTemplateInvalid =>
      'Die Community-Vorlagendaten sind ungültig oder fehlerhaft.';

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
  String get channelDetailsFallbackTitle => 'Domain';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'Gruppen-DM · $count Mitglieder';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'Gespräch mit $name schließen?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'Gruppe verlassen $name?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Kanaleinstellungen';

  @override
  String get channelDetailsGroupSettingsTitle => 'Gruppeneinstellungen';

  @override
  String get channelDetailsDmSettingsTitle => 'DM-Einstellungen';

  @override
  String get channelDetailsInvitePeople => 'Leute einladen';

  @override
  String get channelDetailsCopyLink => 'Link kopieren';

  @override
  String get channelMenuCopyChannelLink => 'Kanallink kopieren';

  @override
  String get channelMenuCopyRedirectLink => 'Weiterleitungslink kopieren';

  @override
  String get channelDetailsAddFriendsToGroup => 'Freunde zur Gruppe hinzufügen';

  @override
  String get channelDetailsGroupInvites => 'Gruppeneinladungen';

  @override
  String get channelDetailsEditChannel => 'Kanal bearbeiten';

  @override
  String get channelDetailsDeleteChannel => 'Kanal löschen';

  @override
  String get channelSettingsCategorySettingsTitle => 'Kategorieeinstellungen';

  @override
  String get channelSettingsEditCategory => 'Kategorie bearbeiten';

  @override
  String get channelSettingsTabOverview => 'Übersicht';

  @override
  String get channelSettingsTabPermissions => 'Berechtigungen';

  @override
  String get channelSettingsTabInvites => 'Einladungen';

  @override
  String get channelSettingsTabWebhooks => 'Webhooks';

  @override
  String get channelSettingsDeleteChannel => 'Kanal löschen';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'Möchtest du $channelName wirklich löschen? Das kann nicht rückgängig gemacht werden.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'Möchtest du $categoryName wirklich löschen? Das kann nicht rückgängig gemacht werden.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Kategorie löschen';

  @override
  String get channelSettingsChannelUpdated => 'Kanal aktualisiert';

  @override
  String get channelSettingsChannelName => 'Kanalname';

  @override
  String get channelSettingsCategoryName => 'Kategoriename';

  @override
  String get channelSettingsMyCategory => 'Meine Kategorie';

  @override
  String get categoryExpandCategory => 'Kategorie erweitern';

  @override
  String get categoryCollapseCategory => 'Kategorie einklappen';

  @override
  String get categoryExpandAllCategories => 'Alle Kategorien erweitern';

  @override
  String get categoryCollapseAllCategories => 'Alle Kategorien einklappen';

  @override
  String get categoryMuteCategory => 'Kategorie stummschalten';

  @override
  String get categoryUnmuteCategory => 'Kategorie-Stummschaltung aufheben';

  @override
  String get categoryCopyCategoryId => 'Kategorie-ID kopieren';

  @override
  String get categoryIdCopied => 'Kategorie-ID kopiert';

  @override
  String get channelSettingsChannelNamePlaceholder => 'Allgemein';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'Thema';

  @override
  String get channelSettingsTopicPlaceholder =>
      'Thema zu diesem Kanal hinzufügen';

  @override
  String get channelSettingsInsertEmoji => 'Emoji einfügen';

  @override
  String get channelSettingsTopicTooLongTitle => 'Kanalthema ist zu lang.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'Kürze das Thema und versuche es erneut.';

  @override
  String get channelSettingsSlowmode => 'Slow-Modus';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Wartezeit zwischen Nachrichten. \"$bypassSlowmodePermissionLabel\" kann diese umgehen.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Aus';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds Sekunden';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes Minuten';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours Stunden';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute Minute';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour Stunde';
  }

  @override
  String get channelSettingsVoiceQuality => 'Sprachqualität';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'Höhere Bitrate = bessere Qualität und höherer Bandbreitenverbrauch.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbit/s';
  }

  @override
  String get channelSettingsParticipantLimit => 'Teilnehmerlimit';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Maximale Mitglieder, die gleichzeitig beitreten können. 0 bedeutet unbegrenzt.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Teilnehmer',
      one: '1 Teilnehmer',
      zero: '∞ Keine Beschränkung',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Verbindungslimit';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Maximale aktive Verbindungen, die ein Mitglied in diesem Kanal aufrechterhalten kann.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Verbindungen',
      one: '1 Verbindung',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Sprachregion';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Wähle eine Sprachregion für diesen Kanal. Automatisch verwendet die nächstgelegene Region.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Automatisch';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'Sprachregionen konnten nicht geladen werden';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Versuch es später noch einmal.';

  @override
  String get channelSettingsResetSlider =>
      'Schieberegler auf Standardwert zurücksetzen';

  @override
  String get channelSettingsAdvanced => 'Erweitert';

  @override
  String get channelSettingsMatureContentOverride =>
      'Überschreibung für nicht jugendfreie Inhalte';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Überschreibe die Einstellung auf $scopeLevel-Ebene für diesen Kanal. Inhalte für Erwachsene werden vor dem Betreten hinter einem Tor angezeigt.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Übernehmen';

  @override
  String get channelSettingsMatureContentOn => 'An';

  @override
  String get channelSettingsMatureContentOff => 'Aus';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Kennzeichnet diesen Kanal als für ein erwachsenes Publikum bestimmt.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Lass diesen Kanal für Inhalte für Erwachsene unbeschränkt.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Übernommen von $inheritedSourceLabel: an';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Übernommen von $inheritedSourceLabel: aus';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'Kategorie';

  @override
  String get channelSettingsMatureContentCommunitySource => 'Community';

  @override
  String get channelSettingsMatureContentCategoryScope => 'Kategorie';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Community';

  @override
  String get channelSettingsContentWarningToggle =>
      'In diesem Kanal eine Inhaltswarnung anzeigen';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Zeigt eine Zustimmungsaufforderung an, bevor dieser Kanal betreten wird.';

  @override
  String get channelSettingsContentWarningText =>
      'Benutzerdefinierter Warntext';

  @override
  String get channelSettingsContentWarningDefault =>
      'Dieser Inhalt ist sensibel.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'Du benötigst die Berechtigung \"$manageChannelsPermissionLabel\", um diese Berechtigungen zu bearbeiten.';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'Du benötigst die Berechtigung \"$manageRolesPermissionLabel\", um diese Berechtigungen zu bearbeiten.';
  }

  @override
  String get channelSettingsUnknownRole => 'Unbekannte Rolle';

  @override
  String get channelSettingsUnknownUser => 'Unbekannter Nutzer';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides =>
      'Zugriffsüberschreibungen';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Zugriff für $name bearbeiten';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'Zurück zu den Überschreibungen';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Basiszugriff für diesen Kanal konfigurieren';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Berechtigungen für diese Rolle anpassen';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Berechtigungen für dieses Mitglied anpassen';

  @override
  String get channelSettingsPermissionsSearchPlaceholder =>
      'Berechtigungen suchen …';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Kanalzugriff aktualisiert';

  @override
  String get channelSettingsPermissionsTitle => 'Zugriffskontrolle';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'Dieser Kanal ist mit der übergeordneten Kategorie synchronisiert ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'Dieser Kanal ist nicht mit der übergeordneten Kategorie synchronisiert ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory =>
      'Mit Kategorie synchronisieren';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'Kanal mit übergeordneter Kategorie synchronisiert';

  @override
  String get channelSettingsPermissionsAddOverride => 'Berechtigung hinzufügen';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Rollen oder Mitglieder suchen …';

  @override
  String get channelSettingsPermissionsRolesAndMembers =>
      'Rollen und Mitglieder';

  @override
  String get channelSettingsDeleteInvite => 'Einladung löschen';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Diese Einladung löschen? Kann nicht rückgängig gemacht werden.';

  @override
  String get channelSettingsCopyInviteCode => 'Einladungscode kopieren';

  @override
  String get channelSettingsCopyInviteUrl => 'Einladungs-URL kopieren';

  @override
  String get channelSettingsWebhookCreated => 'Webhook erstellt';

  @override
  String get channelSettingsWebhookCreateFailed =>
      'Webhook konnte nicht erstellt werden';

  @override
  String get channelSettingsCreateWebhook => 'Webhook erstellen';

  @override
  String get channelSettingsInvitesDescription =>
      'Einladungslinks für diesen Kanal verwalten.';

  @override
  String get channelSettingsInvitesCreate => 'Einladung erstellen';

  @override
  String get channelSettingsInvitesEmpty => 'Keine Einladungslinks';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'Dieser Kanal hat noch keine Einladungslinks. Erstelle einen, um Leute in diesen Kanal einzuladen.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Beim Laden der Einladungslinks für diesen Kanal ist ein Fehler aufgetreten. Versuchen Sie es noch einmal.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Eingehende Webhooks verwalten, die Nachrichten in diesen Kanal posten können.';

  @override
  String get channelSettingsWebhooksEmpty => 'Keine Webhooks';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'Für diesen Kanal sind keine Webhooks konfiguriert. Erstelle einen Webhook, damit externe Anwendungen Nachrichten posten können.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Dieser Kanal unterstützt keine Webhooks.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'Du benötigst die Berechtigung \"$permission\", um Webhooks für diesen Kanal anzuzeigen und zu bearbeiten.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'Webhooks konnten nicht geladen werden';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Beim Laden der Webhooks für diesen Kanal ist ein Fehler aufgetreten. Versuchen Sie es noch einmal.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Erstellt von $creator am $date';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'Unbekannter Nutzer';

  @override
  String get channelSettingsWebhooksAvatar => 'Avatar';

  @override
  String get channelSettingsWebhooksUploadImage => 'Bild hochladen';

  @override
  String get channelSettingsWebhooksRemove => 'Entfernen';

  @override
  String get channelSettingsWebhooksName => 'Name';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Webhook-Name';

  @override
  String get channelSettingsWebhooksChannel => 'Kanal';

  @override
  String get channelSettingsWebhooksUrl => 'Webhook-URL';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Webhook-URL kopieren';

  @override
  String get channelSettingsWebhooksDelete => 'Webhook löschen';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'Webhook konnte nicht gelöscht werden';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'Diesen Webhook löschen? Das kann nicht rückgängig gemacht werden.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Versuch es später noch einmal.';

  @override
  String get channelMenuOpenChat => 'Chat öffnen';

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
  String get channelMenuDeleteMyMessagesConfirm => 'Meine Nachrichten löschen';

  @override
  String get channelMenuDeletedYourMessages =>
      'Deine Nachrichten wurden gelöscht';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'Deine Nachrichten konnten nicht gelöscht werden';

  @override
  String get channelDetailsSystemMessage => 'Systemnachricht';

  @override
  String get channelDetailsTextChannel => 'Textkanal';

  @override
  String get channelDetailsVoiceChannel => 'Sprachkanal';

  @override
  String get channelDetailsCategory => 'Kategorie';

  @override
  String get channelDetailsLinkChannel => 'Kanal verknüpfen';

  @override
  String get channelDetailsGenericChannel => 'Kanal';

  @override
  String get channelDetailsMutedConversation =>
      'Unterhaltungen stummgeschaltet';

  @override
  String get channelDetailsUnmutedConversation =>
      'Unterhaltung stummgeschaltet';

  @override
  String get channelDetailsMutedChannel => 'Kanal stummgeschaltet';

  @override
  String get channelDetailsUnmutedChannel => 'Kanal stummgeschaltet';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Benachrichtigungseinstellungen aktualisiert';

  @override
  String get channelDetailsTabMembers => 'Mitglieder';

  @override
  String get channelDetailsTabPins => 'Angepinnte Nachrichten';

  @override
  String get channelDetailsActionMute => 'Stummschalten';

  @override
  String get channelDetailsActionUnmute => 'Stummschaltung aufheben';

  @override
  String get channelDetailsActionSearch => 'Suchen';

  @override
  String get channelDetailsActionMore => 'Mehr';

  @override
  String get channelDetailsMembersEmptyTitle => 'Keine Mitglieder vorhanden';

  @override
  String get channelDetailsMembersEmptyBody =>
      'Mitglieder werden hier angezeigt, sobald die Community-Daten geladen wurden.';

  @override
  String get memberListPermissionDeniedTitle =>
      'Mitglieder können nicht angezeigt werden';

  @override
  String get memberListPermissionDeniedBody =>
      'Du kannst die Mitglieder dieses Kanals in dieser Community nicht sehen';

  @override
  String get memberListUnavailableTitle => 'Mitgliederliste nicht verfügbar';

  @override
  String get memberListUnavailableBody =>
      'Mitgliederlisten sind in dieser Community vorübergehend nicht verfügbar';

  @override
  String get channelDetailsPinsLoadFailedTitle =>
      'Pins konnten nicht geladen werden';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'Mitglieder mit der Berechtigung \"Nachrichten anheften\" können Nachrichten anheften, die für alle sichtbar sind.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'Du kannst Nachrichten in diesem Chat für alle anpinnen.';

  @override
  String get channelDetailsPinsEndReached => 'Du hast das Ende erreicht';

  @override
  String get channelHeaderOpenDetails => 'Kanaldetails öffnen';

  @override
  String get channelHeaderPinnedMessages => 'Angepinnte Nachrichten';

  @override
  String get channelHeaderPinnedMessagesUnread =>
      'Angeheftete Nachrichten, ungelesen';

  @override
  String get channelHeaderMemberList => 'Mitgliederliste';

  @override
  String get channelHeaderInbox => 'Posteingang';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Benachrichtigungseinstellungen, stummgeschaltet';

  @override
  String get channelDetailsSearchTitle => 'Suchen';

  @override
  String get channelDetailsSearchHint => 'Nachrichten durchsuchen';

  @override
  String get channelDetailsSearchFilterFrom => 'Von';

  @override
  String get channelDetailsSearchFilterHas => 'Hat';

  @override
  String get channelDetailsSearchFilterIn => 'Inline';

  @override
  String get channelDetailsSearchFilterMentions => 'Erwähnungen';

  @override
  String get channelDetailsSearchFilterMore => 'Mehr';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Aktiv';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count Kanäle';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count Nutzer';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'Benutzer';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Bot';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => 'Nach Kanal filtern';

  @override
  String get channelDetailsSearchChannelsHint => 'Kanäle suchen';

  @override
  String get channelDetailsSearchChannelsEmpty => 'Keine Kanäle gefunden';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Angeheftet';

  @override
  String get channelDetailsSearchPinnedTrue => 'Nur angeheftete';

  @override
  String get channelDetailsSearchPinnedFalse => 'Ohne angeheftete';

  @override
  String get channelDetailsSearchClearFilter => 'Löschen';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Art des Autors';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Datum';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Datumsmodus';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Datum auswählen';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Link-Hostname';

  @override
  String get channelDetailsSearchMoreFiltersFileName => 'Dateiname enthält';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'Dateiendung';

  @override
  String get channelDetailsSearchContentPoll => 'Umfrage';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'Nachrichten mit einer Umfrage';

  @override
  String get channelDetailsSearchContentForward => 'Weiterleiten';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Weitergeleitete Nachrichten';

  @override
  String get channelDetailsSearchFilterSort => 'Sortieren';

  @override
  String get channelHeaderSearchFiltersTitle => 'Suchfilter';

  @override
  String get channelHeaderSearchRecentTitle => 'Kürzliche Suchen';

  @override
  String get channelHeaderSearchUsersTitle => 'Nutzer';

  @override
  String get channelHeaderSearchChannelsTitle => 'Kanäle';

  @override
  String get channelHeaderSearchValuesTitle => 'Werte';

  @override
  String get channelHeaderSearchDatesTitle => 'Daten';

  @override
  String get channelHeaderSearchDefaultBadge => 'Standard';

  @override
  String get channelHeaderSearchClearHistory => 'Löschen';

  @override
  String get channelHeaderSearchFilterDescFrom => 'ein Nutzer';

  @override
  String get channelHeaderSearchFilterDescMentions => 'ein Nutzer';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'Link, Einbettung, Bild, Video, Ton, Datei, Sticker, …';

  @override
  String get channelHeaderSearchFilterDescBefore =>
      'ein Datum oder Datumsbereich';

  @override
  String get channelHeaderSearchFilterDescOn => 'ein Datum oder Datumsbereich';

  @override
  String get channelHeaderSearchFilterDescDuring =>
      'ein Datum oder Datumsbereich';

  @override
  String get channelHeaderSearchFilterDescAfter =>
      'ein Datum oder Datumsbereich';

  @override
  String get channelHeaderSearchFilterDescIn => 'einem Kanal';

  @override
  String get channelHeaderSearchFilterDescPinned => 'wahr oder falsch';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'Nutzer, Bot oder Webhook';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'ein Hostname, z. B. example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'Teil eines Dateinamens im Anhang';

  @override
  String get channelHeaderSearchFilterDescFileType =>
      'eine Dateierweiterung, z. B. png';

  @override
  String get channelHeaderSearchFilterDescSort => 'Zeitstempel oder Relevanz';

  @override
  String get channelHeaderSearchFilterDescOrder => 'auf- oder absteigend';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Ergebnisse',
      one: '1 Ergebnis',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'Nach Nutzer filtern';

  @override
  String get channelDetailsSearchFilterByContent => 'Nach Inhalt filtern';

  @override
  String get channelDetailsSearchSortBy => 'Suchergebnisse sortieren nach';

  @override
  String get channelDetailsSearchIn => 'In suchen';

  @override
  String get channelDetailsSearchEmptyTitle => 'In dieser Unterhaltung suchen';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Gib Text, einen Autor oder einen Inhaltsfilter ein, um Nachrichten zu finden.';

  @override
  String get channelDetailsSearchIndexingTitle =>
      'Nachrichten werden indiziert';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Versuche es kurz darauf erneut, sobald die Suche diesen Bereich indiziert hat.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Keine Ergebnisse';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Versuche es mit anderen Suchbegriffen oder Filtern.';

  @override
  String get channelDetailsMembersOnline => 'Online';

  @override
  String get channelDetailsMembersOffline => 'Offline';

  @override
  String get channelDetailsMemberYou => 'Du';

  @override
  String get channelDetailsSearchUsersHint => 'Nutzer suchen';

  @override
  String get channelDetailsSearchUsersTypeToSearch =>
      'Tippe, um Mitglieder zu suchen';

  @override
  String get channelDetailsSearchUsersEmpty => 'Keine Benutzer gefunden';

  @override
  String get channelDetailsSearchUsersNoAvailable => 'Keine Benutzer verfügbar';

  @override
  String get channelDetailsDone => 'Fertig';

  @override
  String get channelDetailsHasFilterPrompt =>
      'Nachrichten anzeigen, die Folgendes enthalten:';

  @override
  String get channelDetailsRetry => 'Erneut versuchen';

  @override
  String get channelDetailsPinnedMessageTitle => 'Angeheftete Nachricht';

  @override
  String get channelDetailsSearchResultTitle => 'Suchergebnis';

  @override
  String get channelDetailsJumpToMessage => 'Zur Nachricht springen';

  @override
  String get channelDetailsUnpinMessage => 'Nachricht anheften aufheben';

  @override
  String get channelDetailsCopyMessageLink => 'Nachricht-Link kopieren';

  @override
  String get channelDetailsCopyMessageId => 'Nachrichten-ID kopieren';

  @override
  String get channelDetailsMessageUnpinned => 'Nachricht losgelöst';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Aktuelle Community';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'Aktueller Chat';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Alle Communities';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild => 'Nur DMs';

  @override
  String get channelDetailsSearchScopeAllDms => 'Alle DMs';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild =>
      'Nur Direktnachrichten';

  @override
  String get channelDetailsSearchScopeOpenDms => 'Offene DMs';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Alle DMs + Communities';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Offene Direktnachrichten + Communities';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Nur in dieser Community suchen';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Nur in diesem Chat suchen';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'In allen Communities, in denen du dich gerade befindest';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Nur in allen DMs, in denen du jemals warst';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'In allen DMs, in denen du jemals warst';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'In all deinen offenen DMs';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'In allen offenen Direktnachrichten';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'In allen DMs, in denen du je warst + allen Communities, in denen du gerade bist';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'In allen offenen Direktnachrichten + allen Communities, in denen du gerade bist';

  @override
  String get channelDetailsSearchSortNewest => 'Neueste zuerst';

  @override
  String get channelDetailsSearchSortOldest => 'Älteste zuerst';

  @override
  String get channelDetailsSearchSortRelevance => 'Am relevantesten';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Neueste Nachrichten zuerst anzeigen';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Älteste Nachrichten zuerst anzeigen';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Relevanteste Nachrichten zuerst anzeigen';

  @override
  String get channelDetailsSearchContentImage => 'Bild-Upload';

  @override
  String get channelDetailsSearchContentVideo => 'Video-Upload';

  @override
  String get channelDetailsSearchContentAudio => 'Audio-Upload';

  @override
  String get channelDetailsSearchContentFile => 'Datei-Upload';

  @override
  String get channelDetailsSearchContentLink => 'Link';

  @override
  String get channelDetailsSearchContentEmbed =>
      'Link-Vorschau oder Einbettung';

  @override
  String get channelDetailsSearchContentSticker => 'Sticker';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Nur hochgeladene Bilder';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Nur hochgeladene Videos';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Nur hochgeladene Audiodateien';

  @override
  String get channelDetailsSearchContentFileDescription => 'Beliebiger Anhang';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'URL im Nachrichtentext eingegeben';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Gelöste Vorschauen und Rich Embeds, keine Uploads';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Sticker an die Nachricht angehängt';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count Typen';
  }

  @override
  String get personalNotesTitle => 'Persönliche Notizen';

  @override
  String get personalNotesSubtitle =>
      'Dein privater Bereich für Gedanken und Erinnerungen';

  @override
  String groupDmWelcome(String displayName) {
    return 'Willkommen bei $displayName. Füge Freunde hinzu, um die Gruppe zu beleben.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Gruppe bearbeiten';

  @override
  String get groupDmWelcomeAddFriends => 'Freunde zur Gruppe hinzufügen';

  @override
  String get dmGroupInvites => 'Einladungen';

  @override
  String get groupDmEditTitle => 'Gruppe bearbeiten';

  @override
  String get groupDmEditDetailsTooltip => 'Gruppendetails bearbeiten';

  @override
  String get groupDmGroupName => 'Gruppenname';

  @override
  String get groupDmMyGroup => 'Meine Gruppe';

  @override
  String get groupDmGroupNameMaxLength =>
      'Der Gruppenname darf 100 Zeichen nicht überschreiten';

  @override
  String get groupDmGroupIcon => 'Gruppenicon';

  @override
  String get groupDmUploadIcon => 'Symbol hochladen';

  @override
  String get groupDmChangeIcon => 'Symbol ändern';

  @override
  String get groupDmRemoveIcon => 'Icon entfernen';

  @override
  String get groupDmUpdated => 'Gruppe aktualisiert';

  @override
  String get groupDmUpdateFailed =>
      'Konnte die Gruppe nicht aktualisieren. Versuche es erneut.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Animierte Icons werden nicht unterstützt. Verwende ein statisches Bild.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Animierte Symbole werden nicht unterstützt';

  @override
  String get groupDmIconFileTooLargeTitle => 'Die Symboldatei ist zu groß';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'Das Symbol ist zu groß. Wähle eine Datei, die kleiner als $maxSize ist.';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'Nicht unterstütztes Symbolformat';

  @override
  String get groupDmUnsupportedIconFormatBody =>
      'Nicht unterstützter Dateityp.';

  @override
  String get groupDmCouldntProcessImage =>
      'Bild konnte nicht verarbeitet werden';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'Fehler beim Verarbeiten des zugeschnittenen Bildes. Bitte versuche es noch einmal.';

  @override
  String get groupDmInvalidImage => 'Ungültiges Bild';

  @override
  String get groupDmInvalidImageBody =>
      'Das Bild ist ungültig. Versuche es mit einem anderen.';

  @override
  String get groupDmAddFriends => 'Hinzufügen';

  @override
  String get groupDmOrSendInvite =>
      'oder sende eine Einladung an einen Freund:';

  @override
  String get groupDmGenerateInviteLink => 'Einladungslink erstellen';

  @override
  String get groupDmCreateInvite => 'Erstellen';

  @override
  String get groupDmInviteExpires24Hours =>
      'Deine Einladung läuft in 24 Stunden ab';

  @override
  String get groupDmAddFriendFailed =>
      'Dieser Freund konnte der Gruppe nicht hinzugefügt werden. Bitte versuche es erneut.';

  @override
  String get groupDmAddFailed => 'Konnte nicht zur Gruppe hinzugefügt werden';

  @override
  String get groupDmGroupFull =>
      'Diese Gruppe ist voll. Entferne jemanden, bevor du weitere Personen hinzufügst.';

  @override
  String get groupDmRateLimited =>
      'Du bist zu schnell. Warte einen Moment und versuch es noch einmal.';

  @override
  String get groupDmCreateInviteFailed =>
      'Einladungslink konnte nicht erstellt werden';

  @override
  String get groupDmCreateInviteFailedBody =>
      'Einladungslink konnte nicht erstellt werden. Bitte versuche es erneut.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'Ein Einladungslink konnte nicht erstellt werden. Bitte versuche es erneut.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'Du hast keine Berechtigung, in diesem Kanal eine Einladung zu erstellen.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'Diese Community hat ihr Einladungs­limit erreicht.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'Das Erstellen von Einladungen ist für diese Community vorübergehend deaktiviert.';

  @override
  String get groupDmCopyInviteFailed =>
      'Einladungslink konnte nicht kopiert werden';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Nur der Gruppeneigentümer kann Einladungen verwalten.';

  @override
  String get groupDmNoInvitesCreated => 'Noch keine Einladungen erstellt';

  @override
  String get groupDmLoadingInvites => 'Einladungen werden geladen …';

  @override
  String get groupDmInvitesLoadFailed =>
      'Einladungen konnten nicht geladen werden. Bitte versuche es erneut.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Einladung widerrufen? Dies kann nicht rückgängig gemacht werden.';

  @override
  String get groupDmInviteRevoked => 'Einladung widerrufen';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Erstellt von $name. Läuft ab in $time.';
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
  String get composerOpenExpressionPicker => 'Emoji- und Medienauswahl öffnen';

  @override
  String get composerShowKeyboard => 'Tastatur anzeigen';

  @override
  String get composerCloseAttachmentPanel => 'Anhängeauswahl schließen';

  @override
  String get chatAttachmentPanelPhotos => 'Fotos';

  @override
  String get chatAttachmentPanelFiles => 'Dateien';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Zugriff auf die Fotomediathek erforderlich';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Erlaube den Zugriff auf die Fotomediathek, um aktuelle Fotos und Videos anzuzeigen und anzuhängen.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Einstellungen öffnen';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', wird gesendet';

  @override
  String get messageAccessibilityFailedSuffix =>
      ', konnte nicht gesendet werden';

  @override
  String get messageAccessibilityAttachmentSummary => 'ein Anhang';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count Anhänge';
  }

  @override
  String get messageAccessibilityImageSummary => 'ein Bild';

  @override
  String get messageAccessibilityVideoSummary => 'ein Video';

  @override
  String get messageAccessibilityAudioSummary => 'eine Audiodatei';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'Sticker $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'Datei $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'Ein Spoiler-Anhang';

  @override
  String get messageAccessibilityEmbedSummary => 'eine Einbettung';

  @override
  String get messageAccessibilityEmptySummary => 'eine Nachricht';

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
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => 'Einstellungen durchsuchen...';

  @override
  String get userSettingsSearchFieldLabel => 'Einstellungen durchsuchen';

  @override
  String get userSettingsSearchClear => 'Suche löschen';

  @override
  String get userSettingsSearchNoResults => 'Keine Einstellungen gefunden';

  @override
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Sicherheit & Anmeldung';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Geschenke';

  @override
  String get giftSettingsClaimAccountTitle => 'Deinen Account beanspruchen';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Fordere dein Konto an, um Plutonium-Geschenkeinlösungscodes einzulösen oder zu verwalten.';

  @override
  String get giftSettingsRedeemTitle => 'Geschenk einlösen';

  @override
  String get giftSettingsRedeemDescription =>
      'Gib einen Geschenkcode ein, um Plutonium für dein Konto einzulösen.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Geschenkcode eingeben …';

  @override
  String get giftSettingsRedeemButton => 'Einlösen';

  @override
  String get giftSettingsRedeemSuccess =>
      'Plutonium erfolgreich eingelöst. Viel Spaß damit.';

  @override
  String get giftSettingsPurchasedTitle => 'Gekaufte Geschenke';

  @override
  String get giftSettingsPurchasedDescription =>
      'Verwalte deine gekauften Plutonium-Geschenke. Teile die Geschenk-URL mit jemand Besonderem oder löse sie selbst ein!';

  @override
  String get giftSettingsEmptyTitle => 'Noch keine Geschenke';

  @override
  String get giftSettingsEmptyDescription =>
      'Kaufe ein Plutonium-Geschenk im Plutonium-Tab, um es mit Freunden zu teilen.';

  @override
  String get giftSettingsGoToPlutonium => 'Zu Plutonium gehen';

  @override
  String get giftSettingsLoadFailedTitle =>
      'Geschenkinventar konnte nicht geladen werden';

  @override
  String get giftSettingsLoadFailedDescription => 'Später erneut versuchen.';

  @override
  String get giftSettingsTryAgain => 'Erneut versuchen';

  @override
  String get giftSettingsGiftUrl => 'Geschenk-URL';

  @override
  String get giftSettingsCopy => 'Kopieren';

  @override
  String get giftSettingsCopied => 'Kopiert';

  @override
  String get giftSettingsGiftUrlCopied =>
      'Geschenk-URL in die Zwischenablage kopiert!';

  @override
  String get giftSettingsGiftUrlCopyFailed =>
      'Geschenk-URL konnte nicht kopiert werden';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Gekauft am $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Eingelöst am $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Eingelöst von $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'Dieses Geschenk wurde eingelöst';

  @override
  String get giftSettingsRedeemForYourself => 'Für dich einlösen';

  @override
  String get giftSettingsShareWithFriend => 'Mit einem Freund teilen';

  @override
  String get premiumPlutoniumTagline =>
      'Schalte höhere Limits und exklusive Funktionen frei und unterstütze gleichzeitig eine unabhängige Kommunikationsplattform.';

  @override
  String get premiumPurchaseMode => 'Kaufmodus';

  @override
  String get premiumForMe => 'Für mich';

  @override
  String get premiumAsAGift => 'Als Geschenk';

  @override
  String get premiumMonthly => 'Monatlich';

  @override
  String get premiumYearly => 'Jährlich';

  @override
  String get premiumPerMonth => 'pro Monat';

  @override
  String get premiumPerYear => 'pro Jahr';

  @override
  String get premiumOneTimePurchase => 'Einmalkauf';

  @override
  String get premiumSave17 => '17 % sparen';

  @override
  String get premiumUpgradeNow => 'Jetzt upgraden';

  @override
  String get premiumBuyGift => 'Geschenk kaufen';

  @override
  String get premiumOneYearGift => '1 Jahr Geschenk';

  @override
  String get premiumOneMonthGift => '1 Monat Geschenk';

  @override
  String get premiumMostPopular => 'Am beliebtesten';

  @override
  String get premiumScrollPrompt =>
      'Scrolle nach unten, um alle Vorteile von Plutonium anzuzeigen';

  @override
  String get premiumFreeVsPlutonium => 'Kostenlos vs. Plutonium';

  @override
  String get premiumFreeColumn => 'Kostenlos';

  @override
  String get premiumGiftSectionTitle => 'Plutonium verschenken';

  @override
  String get premiumGiftSectionDescription =>
      'Teile das Plutonium-Erlebnis mit deinen Freunden, indem du ein Geschenk-Abonnement kaufst.';

  @override
  String get premiumGiftBannerOne =>
      'Du hast einen neuen Geschenkcode, der auf dich wartet!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'Du hast $count neue Geschenkcodes, die auf dich warten!';
  }

  @override
  String get premiumViewGifts => 'Geschenke ansehen';

  @override
  String get premiumReadyToUpgrade => 'Bereit zum Upgrade?';

  @override
  String get premiumReadyToBuyGift => 'Möchtest du ein Geschenk kaufen?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Monatlich $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Jährlich $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 Jahr $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 Monat $price';
  }

  @override
  String get premiumManageSubscription => 'Abonnement verwalten';

  @override
  String get premiumRedeemGiftCode => 'Geschenkcode einlösen';

  @override
  String get premiumGiftBadge => 'Geschenk';

  @override
  String get premiumCancelSubscriptionTitle => 'Abo kündigen?';

  @override
  String get premiumCancelSubscriptionBody =>
      'Du behältst deine Vorteile bis zum nächsten Verlängerungsdatum und hast dann eine Nachfrist von 3 Tagen, um dein Abo zu erneuern und deinen Abo-Verlauf zu behalten.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Abo kündigen';

  @override
  String get premiumKeepSubscription => 'Abo behalten';

  @override
  String get premiumPurchaseHistoryTitle => 'Kaufhistorie';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Deine letzten Rechnungen. Um die Zahlungsmethode für dein Abonnement zu ändern, füge eine hinzu oder wähle eine im Abrechnungsportal aus und lege sie als Standard fest.';

  @override
  String get premiumManagePaymentMethods => 'Zahlungsmethoden verwalten';

  @override
  String get premiumBillingHistory => 'Rechnungsverlauf';

  @override
  String get premiumSelfServeRefundTitle => 'Rückerstattung beantragen';

  @override
  String get premiumSelfServeRefundButton => 'Letzte Zahlung zurückerstatten';

  @override
  String get premiumDisclaimerAgreementPrefix =>
      'Mit dem Kauf stimmen Sie unseren ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'Mit dem Kauf haben Sie unseren ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' und ';

  @override
  String premiumActiveUntil(String date) {
    return 'Aktiv bis zum $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Wird gekündigt';

  @override
  String premiumCancelsOn(String date) {
    return 'Wird am $date gekündigt. Die Vorteile bleiben bis dahin aktiv.';
  }

  @override
  String get premiumReactivateSubscription => 'Reaktivieren';

  @override
  String premiumGiftedUntil(String date) {
    return 'Geschenkt bis zum $date. Erneuert sich nicht automatisch.';
  }

  @override
  String get premiumComparisonFeatureColumn => 'Funktion';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'Mit dem Kauf stimmst du unseren $terms und $privacy zu.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Selbstbedienungsrückerstattungen sind innerhalb von 3 Tagen nach Zahlung und einmal alle 30 Tage möglich. Die Rückerstattung eines Abonnements führt zur Kündigung. Käufer aus der EU/dem EWR verzichten beim Checkout auf ihr 14-tägiges Widerrufsrecht, um sofort auf Inhalte zugreifen zu können. Verwenden Sie die In-App-Schaltfläche für Rückerstattungen anstelle einer Rückbuchung. Rückbuchungen können deinen Account dauerhaft einschränken. Stripe wickelt Zahlungen sicher ab. Wir sehen niemals deine vollständige Kartennummer.';

  @override
  String get premiumTermsOfService => 'Nutzungsbedingungen';

  @override
  String get premiumPrivacyPolicy => 'Datenschutzrichtlinie';

  @override
  String get premiumCheckoutStartFailedTitle =>
      'Kauf konnte nicht gestartet werden';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Beim Starten des Bezahlvorgangs ist ein Fehler aufgetreten. Bitte versuche es gleich noch einmal.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'Du hast derzeit ein Geschenk-Abo. Es wird nicht automatisch verlängert. Du kannst weitere Geschenkcose einlösen, um es zu verlängern. Wiederkehrende Abos können nach Ablauf deines Geschenk-Abos gestartet werden.';

  @override
  String get premiumPlanUnavailable =>
      'Dieser Plan ist nicht verfügbar. Kontaktiere den Support.';

  @override
  String get premiumCompletePaymentTitle => 'Zahlung abschließen';

  @override
  String get premiumCompletePaymentBody =>
      'Du wirst jetzt zu Stripe weitergeleitet, um die Zahlung abzuschließen. Kehre zu Fluxer zurück, sobald du fertig bist.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Zahlungsmethode auswählen';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Mit Pix automatisch bezahlen, um wiederkehrende Abbuchungen direkt von deinem brasilianischen Bankkonto zu autorisieren. Oder wähle Karte verwenden, um deine Kreditkarte auf dem nächsten Bildschirm von Stripe einzugeben.';

  @override
  String get premiumUsePix => 'Mit Pix bezahlen';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Zahle mit UPI, um ein RBI-konformes E-Mandat von deiner indischen Bank einzurichten. Oder wähle Karte verwenden, um deine Kreditkarte auf dem nächsten Bildschirm von Stripe einzugeben.';

  @override
  String get premiumUseUpi => 'UPI verwenden';

  @override
  String get premiumUseCard => 'Karte verwenden';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Das Abrechnungsportal konnte nicht geöffnet werden';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Beim Öffnen des Abrechnungsportals ist ein Fehler aufgetreten. Bitte versuchen Sie es in Kürze erneut.';

  @override
  String get premiumAlreadyVisionaryTitle => 'Du hast bereits Visionary';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary beinhaltet bereits permanenten Zugang, daher ist kein wiederkehrendes Abo nötig. Du kannst trotzdem Geschenke für andere kaufen.';

  @override
  String get premiumExistingSubscriptionTitle => 'Abo ist bereits vorhanden';

  @override
  String get premiumExistingSubscriptionBody =>
      'Wir haben ein bestehendes Fluxer Plutonium-Abonnement für dieses Konto gefunden. Verwalte es im sicheren Abrechnungsportal, um Zahlungsdetails zu aktualisieren oder den Verlängerungsstatus zu überprüfen. Wenn du gerade bezahlt hast, warte eine Minute und öffne diese Seite erneut.';

  @override
  String get premiumPurchasesDisabledTitle => 'Käufe nicht verfügbar';

  @override
  String get premiumPurchasesDisabledBody =>
      'Käufe sind für dieses Konto deaktiviert. Kontaktiere support@fluxer.app, falls dies falsch aussieht.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Fordere dein Konto an, um Fluxer Plutonium zu kaufen.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Du musst deine E-Mail verifizieren, bevor du Fluxer Plutonium kaufen kannst.';

  @override
  String get premiumPerkCustomUsernameTag =>
      'Benutzerdefinierter Nutzername-Tag';

  @override
  String get premiumPerkPerCommunityProfiles => 'Profile pro Community';

  @override
  String get premiumPerkMessageScheduling => 'Nachrichtenplanung';

  @override
  String get premiumPerkProfileBadge => 'Profilabzeichen';

  @override
  String get premiumPerkCustomVideoBackgrounds =>
      'Benutzerdefinierte Videohintergründe';

  @override
  String get premiumPerkEntranceSounds => 'Beitritts-Sounds';

  @override
  String get premiumPerkCommunities => 'Communitys';

  @override
  String get premiumPerkMessageCharacterLimit => 'Nachrichten-Zeichenlimit';

  @override
  String get premiumPerkBookmarkedMessages => 'Markierte Nachrichten';

  @override
  String get premiumPerkFileUploadSize => 'Dateigröße für Uploads';

  @override
  String get premiumPerkEmojiStickerPacks => 'Emoji- & Sticker-Pakete';

  @override
  String get premiumPerkSavedMedia => 'Gespeicherte Medien';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Animierte Emojis verwenden';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Globaler Zugriff auf Emojis und Sticker';

  @override
  String get premiumPerkVideoQuality => 'Videoqualität';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Animierte Avatare und Profilbanner';

  @override
  String get premiumPerkEarlyAccess => 'Früher Zugriff auf neue Funktionen';

  @override
  String get premiumPerkCustomThemes => 'Benutzerdefinierte Themes';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Bis zu 4K/60fps';

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
  String get userSettingsNavShortcuts => 'Tastenkombinationen';

  @override
  String get audioAndVideoAudioSectionTitle => 'Audio';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'Mikrofon, Lautsprecher und Sprachverarbeitung einrichten.';

  @override
  String get audioAndVideoVideoSectionTitle => 'Video';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'Lege die Qualität deiner Kamera und Bildschirmfreigabe fest.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle =>
      'Verhalten während des Anrufs';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Bestätigungsaufforderungen während Sprach- und Videoanrufen steuern.';

  @override
  String get audioAndVideoInputDeviceLabel => 'Eingabegerät';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Ausgabegerät';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'Standard';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Lautsprecher verwenden';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'Wenn ausgeschaltet, wird Audio über den Hörer oder angeschlossene Kopfhörer wiedergegeben.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Eingabelautstärke';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Ausgabelautstärke';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Sprachverarbeitung';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Fokussierte Stimme';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Empfohlen. Bereinigt dein Mikrofon für eine klare Sprachausgabe.';

  @override
  String get audioAndVideoDirectInputLabel => 'Direkteingabe';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Sendet Ihr Audio unbearbeitet. Am besten, wenn Sie externe Audiosoftware verwenden.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Benutzerdefiniert';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Jede Einstellung selbst anpassen: Rauschunterdrückung, Echounterdrückung und Verstärkung.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Rauschunterdrückung';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Verbessert';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Standard';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Keine';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Echo-Unterdrückung';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Automatische Lautstärkeregelung';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Gleicht deine Mikrofonlautstärke aus. Aus, wenn die erweiterte Unterdrückung aktiviert ist.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Mikrofon-Test';

  @override
  String get audioAndVideoMicTestStartLabel => 'Mikrofontest starten';

  @override
  String get audioAndVideoMicTestStopLabel => 'Mikrofontest beenden';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '$productName benötigt Mikrofonzugriff, um deine Eingabe zu testen.';
  }

  @override
  String get audioAndVideoCameraLabel => 'Kamera';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Kamera spiegeln';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'Kameraqualität';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'Bildschirmübertragungsqualität';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Bildrate';

  @override
  String get audioAndVideoFrameRate15Label => '15 Bilder/Sek.';

  @override
  String get audioAndVideoFrameRate30Label => '30 Bilder/Sek.';

  @override
  String get audioAndVideoFrameRate60Label => '60 Bilder/Sek.';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080p und 60 FPS erfordern $premiumProductName.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Diese Instanz erlaubt derzeit Bildschirmfreigabe bis zu 720p bei 30 FPS.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return '$productName benötigt Mikrofonzugriff, um deine Geräte aufzulisten.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return '$productName benötigt Kamerazugriff, um deine Geräte aufzulisten.';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'Nicht fragen, wenn ich meine Kamera ausblende';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'Nicht fragen, wenn ich meinen Bildschirm freigebe';

  @override
  String get userSettingsNavNotifications => 'Benachrichtigungen';

  @override
  String get notificationsGeneralSectionTitle => 'Allgemein';

  @override
  String get notificationsEnableNotificationsLabel =>
      'Benachrichtigungen aktivieren';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Benachrichtigungen erhalten, wenn du Nachrichten empfängst. Möglicherweise musst du Benachrichtigungen für $productName in deinen Geräteeinstellungen zulassen. Um Benachrichtigungen pro Kanal/Community zu steuern, öffne die Benachrichtigungseinstellungen über das Menü einer Community.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Desktop-Benachrichtigungen aktivieren';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Verwendet die Benachrichtigungszentrale des Betriebssystems. Für Benachrichtigungseinstellungen pro Kanal/Community klicke mit der rechten Maustaste auf ein Community-Symbol und öffne die Benachrichtigungseinstellungen.';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'Browser-Benachrichtigungen aktivieren';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'Benachrichtigungen erhalten, wenn du neue Nachrichten bekommst. Möglicherweise musst du Benachrichtigungen in deinen Browser-Einstellungen zulassen. Für Benachrichtigungseinstellungen pro Kanal/Community klicke mit der rechten Maustaste auf ein Community-Symbol und öffne die Benachrichtigungseinstellungen.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Inaktivitäts-Timeout für Push-Benachrichtigungen';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName verhindert, dass Push-Benachrichtigungen an deine mobilen Geräte gesendet werden, während du an deinem Computer aktiv bist. Wähle aus, wie lange du am Desktop inaktiv sein musst, bevor du Push-Benachrichtigungen erhältst.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute Minute';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes Minuten';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle =>
      'Erwähnungspräferenz';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Erwähnungspräferenz für Antworten';

  @override
  String get notificationsMentionNoPreferenceName => 'Keine Präferenz';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Absenderabsicht respektieren, keine Warnung beim Umschalten der @-Erwähnung';

  @override
  String get notificationsMentionPreferMentionName => '@-Erwähnung bevorzugen';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Standardmäßig auf @Erwähnungen antworten und den Absender warnen, wenn er dies deaktiviert';

  @override
  String get notificationsMentionPreferNoMentionName =>
      'Keine @-Erwähnungen bevorzugen';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Standardantworten lassen die @-Erwähnung weg und warnen den Absender, wenn er sie aktiviert';

  @override
  String get notificationsTtsSectionTitle =>
      'Text-to-Speech-Benachrichtigungen';

  @override
  String get notificationsTtsEnableCommandLabel =>
      '/tts-Sprachwiedergabe aktivieren';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'Lass /tts deine Nachricht vorlesen. Wenn du die Einstellung deaktivierst, werden diese Befehle als normaler Text angezeigt.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Wiedergabegeschwindigkeit anpassen in ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Bedienungshilfen';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle =>
      'Automatische Nachrichtenvorlesefunktion';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Wandelt eingehende Inhalte in Sprache um, unabhängig davon, ob sie von /tts stammen.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Jeder Kanal';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Jede eingehende Nachricht vorlesen lassen, egal welcher Kanal geöffnet ist.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Nur aktiver Kanal';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Spricht nur den Kanal vor, den du gerade ansiehst. Die Vorlesefunktion folgt dir zwischen den Kanälen.';

  @override
  String get notificationsTtsModeNeverName => 'Nie automatisch';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Bleibe stumm, es sei denn, jemand führt /tts manuell aus.';

  @override
  String get notificationsTtsModeAriaLabel => 'Alle Nachrichten laut vorlesen';

  @override
  String get notificationsSoundsSectionTitle => 'Töne';

  @override
  String get notificationsMasterVolumeLabel => 'Gesamtlautstärke';

  @override
  String get notificationsMasterVolumeDescription =>
      'Legt die Lautstärke für alle Soundeffekte fest. Einzelne Sound-Einstellungen ignorieren dies.';

  @override
  String get notificationsResetToDefaultVolume =>
      'Lautstärke auf Standard zurücksetzen';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Alle Benachrichtigungstöne deaktivieren';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Deine bestehenden Benachrichtigungston-Einstellungen bleiben erhalten.';

  @override
  String get notificationsShowMoreSoundEffects => 'Mehr Soundeffekte anzeigen';

  @override
  String get notificationsShowFewerSoundEffects =>
      'Weniger Soundeffekte anzeigen';

  @override
  String get notificationsPreviewSound => 'Ton vorhören';

  @override
  String get notificationsPerSoundVolumeTitle => 'Lautstärke pro Ton';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Lege individuelle Lautstärken für einzelne Töne fest. Töne ohne eigene Einstellung folgen der Master-Lautstärke.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Aktive benutzerdefinierte Lautstärkeüberschreibungen für Sounds: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Master folgen • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return '$label auf Masterlautstärke zurücksetzen';
  }

  @override
  String get notificationsResetAllOverrides =>
      'Alle Außerkraftsetzungen zurücksetzen';

  @override
  String notificationsMuteSound(String label) {
    return 'Ton für $label stummschalten';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'Ton für $label wieder aktivieren';
  }

  @override
  String get notificationsSoundMessage =>
      'Benachrichtigungen für Community-Nachrichten';

  @override
  String get notificationsSoundDirectMessage =>
      'Benachrichtigungen für Direktnachrichten';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Benachrichtigungen für Nachrichten im aktuellen Kanal';

  @override
  String get notificationsSoundMute => 'Sprachnachrichten stummschalten';

  @override
  String get notificationsSoundUnmute => 'Stummschaltung aufheben';

  @override
  String get notificationsSoundDeaf => 'Sprachausgabe deaktiviert';

  @override
  String get notificationsSoundUndeaf => 'Stummschaltung aufheben (Sprachchat)';

  @override
  String get notificationsSoundUserJoin => 'Nutzer tritt Kanal bei';

  @override
  String get notificationsSoundUserLeave => 'Nutzer verlässt Kanal';

  @override
  String get notificationsSoundUserMove => 'Nutzer hat Kanal verschoben';

  @override
  String get notificationsSoundViewerJoin => 'Zuschauer tritt Stream bei';

  @override
  String get notificationsSoundViewerLeave => 'Zuschauer verlässt Stream';

  @override
  String get notificationsSoundVoiceDisconnect => 'Sprachanruf getrennt';

  @override
  String get notificationsSoundIncomingRing => 'Eingehender Anruf';

  @override
  String get notificationsSoundCameraOn => 'Kamera an';

  @override
  String get notificationsSoundCameraOff => 'Kamera aus';

  @override
  String get notificationsSoundScreenShareStart =>
      'Bildschirmübertragung starten';

  @override
  String get notificationsSoundScreenShareStop => 'Bildschirmfreigabe beenden';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'Push-Benachrichtigungszeitlimit konnte nicht aktualisiert werden. Versuche es erneut.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Aktualisierung der Erwähnungseinstellungen fehlgeschlagen. Bitte versuche es erneut.';

  @override
  String get notificationsPermissionDeniedTitle =>
      'Benachrichtigungen blockiert';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'Benachrichtigungen konnten nicht aktiviert werden. Erlaube Benachrichtigungsberechtigungen, um fortzufahren.';

  @override
  String get userSettingsNavLanguageAndTime => 'Sprache & Uhrzeit';

  @override
  String get languageAndTimeLanguageSectionTitle =>
      'Sprache der Benutzeroberfläche';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Wähle die Sprache, die in der gesamten App verwendet wird';

  @override
  String get languageAndTimeOpenLanguageSettings =>
      'Spracheinstellungen öffnen';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Zeitformat';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Wähle aus, wie Uhrzeiten in der App angezeigt werden';

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
  String get userSettingsNavDefaultApps => 'Standard-Apps';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Webbrowser';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Wähle, welcher Browser geöffnet wird, wenn du auf einen Link tippst.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'Wenn eine App für eine Website installiert ist, werden Links zuerst in dieser App geöffnet.';

  @override
  String get defaultAppsWebBrowserInApp => 'In-App-Browser';

  @override
  String get defaultAppsWebBrowserExternal => 'Externer Browser';

  @override
  String get userSettingsNavAdvanced => 'Erweitert';

  @override
  String get advancedPerformanceReportingTitle => 'Leistungsberichte';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'Hilf mit, $productName zu verbessern, indem du anonyme Absturz- und Leistungsdaten teilst.';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'Absturz- und Leistungsberichte senden';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'Alle gemeldeten Daten sind anonym und werden nur an $productName eigenen Überwachungsdienst gesendet – es werden keine Drittanbieter verwendet.';
  }

  @override
  String get advancedSettingsConfigure => 'Konfigurieren';

  @override
  String get advancedSettingsCategoryPrivacy => 'Datenschutz';

  @override
  String get advancedSettingsCategoryAppearance => 'Erscheinungsbild';

  @override
  String get advancedSettingsCategoryAccessibility => 'Bedienungshilfen';

  @override
  String get advancedSettingsCategoryChat => 'Chat';

  @override
  String get advancedSettingsCategoryMedia => 'Medien';

  @override
  String get advancedSettingsCategoryVoice => 'Sprachanruf';

  @override
  String get advancedSettingsCategoryDeveloper => 'Entwickler';

  @override
  String get advancedSettingEnableTextSelectionLabel =>
      'Textauswahl aktivieren';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Erlaubt die Textauswahl in der App';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Video-Vorschau für die Zeitleiste aktivieren';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Miniaturansicht oder Livebild während der Videowiedergabe';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Haptisches Feedback';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Vibrationsfeedback für Tippen und Aktionen. Wird nicht geräteübergreifend synchronisiert.';

  @override
  String get advancedSettingShowNekoLabel => 'Neko anzeigen';

  @override
  String get advancedSettingShowNekoDescription =>
      'Neko-Katze, die deinem Mauszeiger folgt';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Neko in deiner Chat-Eingabe anzeigen';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Splash-Zoom-Animation';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Das Logo beim Verlassen des Startbildschirms verkleinern';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Tastaturhinweise';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Tastenkombinationshinweise in Tooltips anzeigen';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Favoriten aktivieren';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Favoriten im gesamten App anzeigen';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Verhalten beim Beitreten von Sprachkanälen';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Bestätigung oder Doppelklick zum Beitreten zu einem Sprachkanal in der Community';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Doppelklick zum Beitreten von Sprachkanälen erforderlich';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Vor Beitritt zu Sprachkanälen bestätigen';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'GIFs nach Auswahl automatisch senden';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'GIFs aus der Auswahl ohne Bestätigung automatisch senden';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'GIF-Favoriten als gespeicherte Medien sichern';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Auswählen, wie mit Stern markierte GIF-Favoriten gespeichert werden';

  @override
  String get advancedSettingMediaButtonsLabel => 'Medien-Buttons';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Passe an, welche Schaltflächen und Anzeigen auf Medienanhängen und -einbettungen angezeigt werden';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Anhänge vor dem Senden hochladen';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Beginne mit dem Hochladen von Anhängen, sobald diese zum Nachrichtenfeld hinzugefügt wurden';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Tracking-Parameter aus URLs entfernen';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Tracking-Parameter automatisch aus URLs in deinen gesendeten Nachrichten entfernen';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'Allen externen Links vertrauen';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'Warnung für externe Links für alle Domains überspringen';

  @override
  String get advancedSettingSearchEnginesLabel => 'Suchmaschinen';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Suchmaschinen konfigurieren, die bei der Auswahl von Text verwendet werden';

  @override
  String get advancedSettingTranslatorsLabel => 'Übersetzer';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Konfiguriere die verwendeten Übersetzungsdienste für den ausgewählten Text';

  @override
  String get advancedSettingReverseImageSearchLabel =>
      'Rückwärtssuche für Bilder';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Anbieter für die umgekehrte Bildersuche';

  @override
  String get advancedSettingMessageActionBarLabel =>
      'Nachrichten-Aktionsleiste';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Die Aktionsleiste anpassen, die beim Bewegen des Mauszeigers über Nachrichten angezeigt wird';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Ausdrucksvervollständigung';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Wählen Sie aus, was angezeigt wird, wenn Sie einen Doppelpunkt im Nachrichtenfeld eingeben';

  @override
  String get advancedSettingInputButtonsLabel =>
      'Schaltflächen für die Nachrichteneingabe';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Wähle aus, welche Schaltflächen im Eingabefeld für Nachrichten angezeigt werden sollen';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Beim Senden einer Nachricht nach unten scrollen';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Entscheide wie der Chat nach dem Senden einer Nachricht fortgesetzt werden soll';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Bestätigung für \"Alle als gelesen markieren\" überspringen';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Alle ungelesenen Posteingangskanäle sofort als gelesen markieren, ohne Bestätigung';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Stummgeschaltete Kanäle standardmäßig ausblenden';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Ausgeblendete Kanäle, die du stummgeschaltet hast, aus Community-Seitenleisten';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'GIF-Indikator anzeigen';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Ablaufanzeige für Anhänge zeigen';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'Löschen-Button anzeigen';

  @override
  String get advancedSettingShowMediaDownloadLabel =>
      'Download-Button anzeigen';

  @override
  String get advancedSettingShowMediaFavoriteLabel =>
      'Favoriten-Button anzeigen';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Einbettungen unterdrücken-Schaltfläche anzeigen';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Nachrichten-Aktionsleiste anzeigen';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel =>
      'Nur die Schaltfläche \"Mehr\" anzeigen';

  @override
  String get advancedSettingShowQuickReactionsLabel =>
      'Schnelle Reaktionen anzeigen';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Umschalttaste zum Erweitern aktivieren';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Standard-Emojis in der Ausdrucksvervollständigung anzeigen';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Eigene Emojis in der Ausdrucksvervollständigung anzeigen';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Sticker in der Ausdrucks-Autovervollständigung anzeigen';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Gespeicherte Medien in der Ausdrucksvervollständigung anzeigen';

  @override
  String get advancedSettingShowGifsButtonLabel => 'GIF-Schaltfläche anzeigen';

  @override
  String get advancedSettingShowMediaButtonLabel => 'Medien-Button anzeigen';

  @override
  String get advancedSettingShowStickersButtonLabel =>
      'Sticker-Button anzeigen';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Emoji-Taste anzeigen';

  @override
  String get advancedSettingShowSendButtonLabel => 'Senden-Button anzeigen';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Benachrichtigungen für neue Geräte anzeigen';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Nach neuen Audiogeräten fragen';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Verbindungslautstärkeregelung';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Lautstärkeregler für einzelne Teilnehmer in Sprachmenüs anzeigen';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Verhalten der Bildschirmfreigabe-Vorschau';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Vorschau-, Popout- und Stream-Thumbnail-Verhalten';

  @override
  String get advancedSettingScreenShareCodecLabel =>
      'Codec für Bildschirmfreigabe';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Videocodec für Bildschirmfreigabe';

  @override
  String get advancedSettingScreenShareCodecAuto => 'Automatisch (empfohlen)';

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
      'Bildschirmfreigabe-Vorschau im Hintergrund pausieren';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Vorschaubild meines Streams ausblenden';

  @override
  String get advancedSettingDeveloperModeLabel => 'Entwicklermodus aktivieren';

  @override
  String get advancedSettingDeveloperModeDescription =>
      'Entwicklermodus aktivieren';

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
  String get advancedSettingDefaultSearchEngineLabel => 'Standardsuchmaschine';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Wähle, welche Suchmaschine standardmäßig verwendet wird, wenn du ausgewählten Text suchst.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Integrierte Suchmaschinen';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Integrierte Suchmaschinen aktivieren oder deaktivieren. Aktivierte Suchmaschinen erscheinen im Kontextmenü der Nachricht, wenn Text ausgewählt ist.';

  @override
  String get advancedSettingCustomSearchEnginesLabel =>
      'Benutzerdefinierte Suchmaschinen';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Füge eigene Suchmaschinen mit einem benutzerdefinierten URL-Muster hinzu. Verwende „$query“ als Platzhalter für den Suchtext.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Suchmaschine hinzufügen';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Aktiviere mindestens eine Suchmaschine unten.';

  @override
  String get advancedSettingRemoveSearchEngineLabel => 'Suchmaschine entfernen';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'Standard-Übersetzer';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Wähle, welcher Übersetzer standardmäßig verwendet wird, wenn du ausgewählten Text übersetzt.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Integrierte Übersetzer';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Integrierte Übersetzer aktivieren oder deaktivieren. Aktivierte Übersetzer erscheinen im Nachrichten-Kontextmenü, wenn Text ausgewählt ist.';

  @override
  String get advancedSettingCustomTranslatorsLabel =>
      'Benutzerdefinierte Übersetzer';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Füge eigene Übersetzer mit einem benutzerdefinierten URL-Muster hinzu. Verwende „$query“ als Platzhalter für den zu übersetzenden Text.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Übersetzer hinzufügen';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Aktiviere mindestens einen Übersetzer unten.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Übersetzer entfernen';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Standard-Rückwärtssuche für Bilder';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Wähle, welcher Dienst für die umgekehrte Bildersuche standardmäßig verwendet werden soll, wenn du ein Bild suchst.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Integrierte umgekehrte Bildsuche';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Integrierte Anbieter für die umgekehrte Bildsuche aktivieren oder deaktivieren. Aktivierte Anbieter erscheinen im Kontextmenü von Bildern, Avataren, Bannern, Stickern und Emojis.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Benutzerdefinierte umgekehrte Bildsuche';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Füge eigene Anbieter für die umgekehrte Bildersuche mit einem benutzerdefinierten URL-Muster hinzu. Verwende \'$url\' als Platzhalter für die Bild-URL.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Rückwärtssuche für Bilder hinzufügen';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Aktiviere unten mindestens einen Anbieter für die umgekehrte Bildersuche.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Rückwärtssuche für Bilder entfernen';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Suchmaschine hinzufügen';

  @override
  String get advancedSettingEditSearchEngineTitle => 'Suchmaschine bearbeiten';

  @override
  String get advancedSettingAddTranslatorTitle =>
      'Übersetzungsanbieter hinzufügen';

  @override
  String get advancedSettingEditTranslatorTitle =>
      'Übersetzungsanbieter bearbeiten';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Suchmaschine für umgekehrte Bildersuche hinzufügen';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Suchmaschine für umgekehrte Bildsuche bearbeiten';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Name';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'URL-Muster';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'Meine Suchmaschine';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Mein Übersetzer';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'Meine umgekehrte Bildersuche';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Gib \'$query\' ein, wo der Suchtext eingefügt werden soll.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Verwende „$query“, wo der zu übersetzende Text eingefügt werden soll.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Verwende \'$url\', um die Bild-URL einzufügen.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired =>
      'Name ist erforderlich.';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'URL-Muster ist erforderlich.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'Das URL-Muster muss den Platzhalter „$query“ enthalten.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'Das URL-Muster muss den Platzhalter \"$url\" enthalten.';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'Das URL-Muster muss eine gültige URL sein.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Hinzufügen';

  @override
  String get advancedSettingEditSearchProviderAction => 'Bearbeiten';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Entfernen';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'Möchtest du $engineName wirklich entfernen?';
  }

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
  String get userSettingsJoinFluxerLabs => 'Fluxer Labs beitreten';

  @override
  String get userSettingsNavAppLicenses => 'App-Lizenzen';

  @override
  String get userSettingsAppLicensesDescription =>
      'Open-Source-Software, die von dieser App verwendet wird. Diese App wurde mit Flutter erstellt.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'App-Lizenzen konnten nicht geladen werden.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Lizenzen',
      one: '1 Lizenz',
    );
    return '$_temp0';
  }

  @override
  String get userSettingsNavLogOut => 'Abmelden';

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
  String get savedMessagesEmptyTitle => 'Keine Lesezeichen';

  @override
  String get savedMessagesEmptyBody =>
      'Nachrichten mit Lesezeichen versehen, um sie später zu speichern.';

  @override
  String get savedMessagesEndBody => 'Hier gibt es nichts weiter zu sehen.';

  @override
  String get savedMessagesRemoveTooltip => 'Lesezeichen entfernen';

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
  String get uiSearch => 'Suchen';

  @override
  String get uiStartCall => 'Anruf starten';

  @override
  String get uiStartVideoCall => 'Videoanruf starten';

  @override
  String get uiPlay => 'Wiedergabe';

  @override
  String get uiPause => 'Pause';

  @override
  String get uiDownload => 'Herunterladen';

  @override
  String get uiMoreActions => 'Weitere Aktionen';

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
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'Dies benachrichtigt $count Mitglieder mit der Rolle $roleName. Fortfahren?';
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
  String get guildNavbarGuildSelected => 'Ausgewählt';

  @override
  String get guildNavbarGuildUnread => 'ungelesen';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Erwähnungen',
      one: '1 Erwähnung',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'Stummgeschaltet';

  @override
  String get authShowPassword => 'Passwort anzeigen';

  @override
  String get authHidePassword => 'Passwort ausblenden';

  @override
  String get chatLoadingMessages => 'Nachrichten werden geladen';

  @override
  String get friendsMessageFriend => 'Nachricht';

  @override
  String get friendsFriendActions => 'Aktionen für Freunde';

  @override
  String get friendsAcceptRequest => 'Freundschaftsanfrage annehmen';

  @override
  String get friendsDeclineRequest => 'Freundschaftsanfrage ablehnen';

  @override
  String get friendsCancelRequest => 'Freundschaftsanfrage abbrechen';

  @override
  String get friendsOpenInbox => 'Posteingang';

  @override
  String get profileRemoveFriend => 'Freund entfernen';

  @override
  String get profileUnblockUser => 'Nutzer freigeben';

  @override
  String get profileAcceptFriendRequest => 'Freundschaftsanfrage annehmen';

  @override
  String get profileCancelFriendRequest => 'Freundschaftsanfrage abbrechen';

  @override
  String get profileSendFriendRequest => 'Freund hinzufügen';

  @override
  String get accountOverflowMenu => 'Kontooptionen';

  @override
  String get navHome => 'Startseite';

  @override
  String get navNotifications => 'Benachrichtigungen';

  @override
  String get navYou => 'Du';

  @override
  String get guildFolderSettingsTitle => 'Ordnereinstellungen';

  @override
  String get guildFolderNameLabel => 'Ordnername';

  @override
  String get guildFolderColorLabel => 'Ordnerfarbe';

  @override
  String get guildFolderShowIconWhenCollapsed =>
      'Symbol anzeigen, wenn eingeklappt';

  @override
  String get guildFolderIconLabel => 'Ordnersymbol';

  @override
  String get guildFolderDelete => 'Ordner löschen';

  @override
  String get guildFolderIconFolder => 'Ordner';

  @override
  String get guildFolderIconStar => 'Stern';

  @override
  String get guildFolderIconHeart => 'Herz';

  @override
  String get guildFolderIconBookmark => 'Lesezeichen';

  @override
  String get guildFolderIconGameController => 'Gamecontroller';

  @override
  String get guildFolderIconShield => 'Schild';

  @override
  String get guildFolderIconMusicNote => 'Musiknote';

  @override
  String get guildFolderMarkAsRead => 'Ordner als gelesen markieren';

  @override
  String get guildBulkMuteCommunities => 'Communitys stummschalten';

  @override
  String get guildBulkUnmuteCommunities =>
      'Community-Chats nicht mehr stummschalten';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Benachrichtigungseinstellungen für die Community';

  @override
  String get guildBulkCommunityPrivacySettings =>
      'Datenschutzeinstellungen der Community';

  @override
  String get guildBulkAllowEveryoneAndHere => '@everyone und @here erlauben';

  @override
  String get guildBulkAllowRoleMentions => 'Rollen-Erwähnungen zulassen';

  @override
  String get guildBulkEnableMobilePush =>
      'Mobile Push-Benachrichtigungen aktivieren';

  @override
  String get guildBulkDisableMobilePush =>
      'Mobile Push-Benachrichtigungen deaktivieren';

  @override
  String get guildBulkAllowDirectMessages => 'Direktnachrichten erlauben';

  @override
  String get guildBulkBlockDirectMessages => 'Direktnachrichten blockieren';

  @override
  String get guildBulkAllowBotDirectMessages =>
      'Direktnachrichten von Bots zulassen';

  @override
  String get guildBulkBlockBotDirectMessages =>
      'Direktnachrichten von Bots blockieren';

  @override
  String get guildNavbarGroupDm => 'Gruppen-DM';

  @override
  String get guildNavbarCreateChannel => 'Kanal erstellen';

  @override
  String get guildNavbarChannelType => 'Kanaltyp';

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
  String get guildNavbarChannelTypeSelection => 'Kanaltyp auswählen';

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
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'Nur für $productName-Mitarbeiter zugänglich';
  }

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
  String get guildMenuSettingsEmoji => 'Emojis';

  @override
  String get guildMenuSettingsStickers => 'Sticker';

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
  String get guildMenuSettingsInviteLinks => 'Einladungen';

  @override
  String get guildMenuSettingsBans => 'Sperren';

  @override
  String get guildMenuSettingsChannels => 'Kanäle';

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
  String get guildSettingsRolesNewRole => 'Neue Rolle';

  @override
  String get guildSettingsRolesDeleteRole => 'Rolle löschen';

  @override
  String get guildSettingsRolesBackToRoles => 'Zurück zu Rollen';

  @override
  String get guildSettingsBackToSettings => 'Zurück zu den Einstellungen';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return '\"$name\" bearbeiten';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Rollen-Einstellungen und Berechtigungen konfigurieren';

  @override
  String get guildSettingsRolesDisplaySection => 'Anzeige';

  @override
  String get guildSettingsRolesRoleName => 'Rollenname';

  @override
  String get guildSettingsRolesRoleColor => 'Rollenfarbe';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Gib eine Farbe ein (Hex, RGB(), HSL() oder Name) oder verwende die Pipette.';

  @override
  String get guildSettingsRolesShowSeparately => 'Diese Rolle separat anzeigen';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Listet Mitglieder mit dieser Rolle in einem eigenen Abschnitt in der Mitgliederliste auf.';

  @override
  String get guildSettingsRolesAllowMentions =>
      'Erwähnungen für diese Rolle zulassen';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'Mitglieder mit der Berechtigung \"$permission\" können Rollen immer erwähnen, unabhängig von dieser Einstellung.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Mit dieser Schaltfläche kannst du schnell alle Berechtigungen löschen.';

  @override
  String get guildSettingsRolesClearPermissions => 'Berechtigungen löschen';

  @override
  String get guildSettingsRolesPermissionsSection => 'Berechtigungen';

  @override
  String get guildSettingsRolesSearchPermissions => 'Berechtigungen suchen';

  @override
  String get guildSettingsRolesDenseLayout => 'Kompakte Ansicht';

  @override
  String get guildSettingsRolesComfyLayout => 'Komfortables Layout';

  @override
  String get guildSettingsRolesSwitchToDenseLayout =>
      'Zu kompakter Ansicht wechseln';

  @override
  String get guildSettingsRolesSwitchToComfyLayout =>
      'Zu \"Komfortabel\" wechseln';

  @override
  String get guildSettingsRolesSingleColumn => 'Einspaltig';

  @override
  String get guildSettingsRolesTwoColumns => 'Zwei Spalten';

  @override
  String get guildSettingsRolesSwitchToSingleColumn =>
      'Zu einzelner Spalte wechseln';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => 'Zu zwei Spalten wechseln';

  @override
  String get guildSettingsRolesNoPermissionsFound =>
      'Keine Berechtigungen gefunden';

  @override
  String get guildSettingsRolesCustomHoistOrder =>
      'Benutzerdefinierte Hoist-Reihenfolge';

  @override
  String get guildSettingsRolesHoistOrder => 'Anzeigereihenfolge';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Auf Standard zurücksetzen';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Ziehe Rollen, um die Reihenfolge in der Mitgliederliste anzupassen.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Keine hervorgehobenen Rollen. Aktiviere \"Rolle separat anzeigen\" für eine Rolle, um sie hier zu sehen.';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'Du kannst diese Rolle nicht bearbeiten, da es deine höchste Rolle ist oder über dir liegt';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Du benötigst die Berechtigung \"$permission\", um diese Berechtigungen zu bearbeiten.';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'Du kannst keine Rolle bearbeiten, die auf oder über deiner höchsten Rolle ist';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'Du kannst keine Berechtigung erteilen, die du selbst nicht hast';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'Du kannst diese Berechtigung nicht entfernen, da du sie dir selbst entziehen würdest';

  @override
  String get guildSettingsRolesUpdatedSuccess =>
      'Rollen erfolgreich aktualisiert';

  @override
  String get guildSettingsRolesCreatedSuccess => 'Rolle erfolgreich erstellt';

  @override
  String get guildSettingsRolesDeletedSuccess => 'Rolle erfolgreich gelöscht';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'Reihenfolge der Rollenanzeige auf Standard zurückgesetzt';

  @override
  String get guildSettingsRolesNameRequiredTitle =>
      'Rollenname ist erforderlich';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Bitte gib der Rolle einen Namen, bevor du speicherst.';

  @override
  String get guildSettingsRolesCreateFailedTitle =>
      'Rolle konnte nicht erstellt werden';

  @override
  String get guildSettingsRolesUpdateFailedTitle =>
      'Rollen konnten nicht aktualisiert werden';

  @override
  String get guildSettingsRolesDeleteFailedTitle =>
      'Rolle konnte nicht gelöscht werden';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '„$name“ konnte nicht gelöscht werden. Versuche es erneut.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'Reihenfolge konnte nicht zurückgesetzt werden';

  @override
  String get guildSettingsRolesTryAgainInAMoment =>
      'Versuch es später noch einmal.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'Möchtest du die Rolle $name wirklich löschen? Mitglieder mit dieser Rolle werden sie nicht mehr haben.';
  }

  @override
  String get permissionCategoryCommunityWide => 'Gesamte Community';

  @override
  String get permissionCategoryMessagesMedia => 'Nachrichten & Medien';

  @override
  String get permissionCategoryModeration => 'Moderation';

  @override
  String get permissionCategoryChannelAccess => 'Kanalzugriff';

  @override
  String get permissionCategoryChannelManagement => 'Kanalverwaltung';

  @override
  String get permissionCategoryAudioVideo => 'Audio & Video';

  @override
  String get permissionUnknown => 'Unbekannte Berechtigung';

  @override
  String get permissionAdministrator => 'Administrator';

  @override
  String get permissionAdministratorDescription =>
      'Gewährt alle Berechtigungen und umgeht Kanalbeschränkungen. Hochsensibel.';

  @override
  String get permissionViewActivityLog => 'Aktivitätsprotokoll ansehen';

  @override
  String get permissionViewActivityLogDescription =>
      'Das Aktivitätsprotokoll der Community mit Änderungen und Moderationsaktionen lesen.';

  @override
  String get permissionManageCommunity => 'Community verwalten';

  @override
  String get permissionManageCommunityDescription =>
      'Globale Einstellungen wie Name, Beschreibung und Symbol bearbeiten.';

  @override
  String get permissionManageRoles => 'Rollen verwalten';

  @override
  String get permissionManageRolesDescription =>
      'Rollen erstellen, bearbeiten oder löschen, die unter deiner höchsten Rolle liegen. Ermöglicht auch das Bearbeiten von Kanalberechtigungsüberschreibungen.';

  @override
  String get permissionManageChannels => 'Kanäle verwalten';

  @override
  String get permissionManageChannel => 'Kanal verwalten';

  @override
  String get permissionManageChannelDescription =>
      'Diesen Kanal umbenennen und seine Einstellungen bearbeiten.';

  @override
  String get permissionManagePermissions => 'Berechtigungen verwalten';

  @override
  String get permissionManagePermissionsDescription =>
      'Berechtigungen für Rollen und Mitglieder in diesem Kanal bearbeiten.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Webhooks für diesen Kanal erstellen, bearbeiten oder löschen.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Mitgliederliste dieses Kanals ansehen.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Einladungslinks für diesen Kanal verwalten.';

  @override
  String get permissionOverwriteDeny => 'Ablehnen';

  @override
  String get permissionOverwriteInherit => 'Neutral (übernehmen)';

  @override
  String get permissionOverwriteAllow => 'Zulassen';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Mit diesen Schaltflächen kannst du schnell alle Berechtigungen festlegen.';

  @override
  String get permissionManageChannelsDescription =>
      'Kanäle und Kategorien erstellen, bearbeiten oder löschen.';

  @override
  String get permissionKickMembers => 'Mitglieder entfernen';

  @override
  String get permissionBanMembers => 'Mitglieder bannen';

  @override
  String get permissionCreateInviteLinks => 'Einladungslinks erstellen';

  @override
  String get permissionChangeOwnNickname => 'Eigenen Anzeigename ändern';

  @override
  String get permissionChangeOwnNicknameDescription =>
      'Deinen Anzeigenamen aktualisieren.';

  @override
  String get permissionManageNicknames => 'Anzeigenamen verwalten';

  @override
  String get permissionManageNicknamesDescription =>
      'Anzeigename anderer Mitglieder ändern.';

  @override
  String get permissionCreateEmojiStickers => 'Emoji und Sticker erstellen';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Neue Emojis und Sticker hochladen und eigene Kreationen verwalten.';

  @override
  String get permissionManageEmojiStickers => 'Emoji und Sticker verwalten';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Emojis und Sticker bearbeiten oder löschen, die von anderen Mitgliedern erstellt wurden.';

  @override
  String get permissionManageWebhooks => 'Webhooks verwalten';

  @override
  String get permissionManageWebhooksDescription =>
      'Webhooks erstellen, bearbeiten oder löschen.';

  @override
  String get permissionSendMessages => 'Nachrichten senden';

  @override
  String get permissionSendTtsMessages => 'TTS-Nachrichten senden';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Text-to-Speech-Nachrichten senden.';

  @override
  String get permissionManageMessages => 'Nachrichten verwalten';

  @override
  String get permissionManageMessagesDescription =>
      'Nachrichten anderer Mitglieder löschen. Das Anpinnen wird separat gesteuert.';

  @override
  String get permissionPinMessages => 'Nachrichten anpinnen';

  @override
  String get permissionEmbedLinks => 'Links einbetten';

  @override
  String get permissionAttachFiles => 'Dateien anhängen';

  @override
  String get permissionMentionEveryone =>
      '@everyone/@here und @Rolle verwenden';

  @override
  String get permissionMentionEveryoneDescription =>
      'Alle oder eine beliebige Rolle erwähnen (auch wenn die Rolle nicht als erwähnbar festgelegt ist).';

  @override
  String get permissionUseExternalEmoji => 'Externe Emojis verwenden';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Emojis aus anderen Communitys verwenden.';

  @override
  String get permissionUseExternalStickers => 'Externe Sticker verwenden';

  @override
  String get permissionAddReactions => 'Reaktionen hinzufügen';

  @override
  String get permissionAddReactionsDescription =>
      'Neue Reaktionen zu Nachrichten hinzufügen.';

  @override
  String get permissionBypassSlowmode => 'Slowmode umgehen';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Nachrichten-Ratenbegrenzungen pro Kanal ignorieren.';

  @override
  String get permissionTimeOutMembers => 'Mitglieder stummschalten';

  @override
  String get permissionTimeOutMembersDescription =>
      'Mitglieder für einen bestimmten Zeitraum am Senden von Nachrichten, Reagieren und Beitreten zu Sprachkanälen hindern.';

  @override
  String get permissionViewChannel => 'Kanal ansehen';

  @override
  String get permissionViewChannelMembers => 'Kanalmitglieder anzeigen';

  @override
  String get permissionViewChannelMembersDescription =>
      'Die Mitgliederliste für Kanäle in dieser Community ansehen.';

  @override
  String get permissionConnect => 'Verbinden';

  @override
  String get permissionSpeak => 'Sprechen';

  @override
  String get permissionStreamVideo => 'Video streamen';

  @override
  String get permissionUseVoiceActivity => 'Sprachaktivierung nutzen';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Ohne diese Berechtigung ist Push-to-Talk erforderlich.';

  @override
  String get permissionPrioritySpeaker => 'Prioritätssprecher';

  @override
  String get permissionMuteMembers => 'Mitglieder stummschalten';

  @override
  String get permissionDeafenMembers => 'Mitglieder stummschalten';

  @override
  String get permissionMoveMembers => 'Mitglieder verschieben';

  @override
  String get permissionMoveMembersDescription =>
      'Ziehe Mitglieder zwischen Kanälen, auf die sie zugreifen können.';

  @override
  String get permissionSetVoiceRegion => 'Sprachregion festlegen';

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
      'Alle für deine Community konfigurierten Webhooks ansehen und verwalten.';

  @override
  String get guildSettingsWebhooksEmpty => 'Keine Webhooks';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'Diese Community hat noch keine Webhooks. Gehe zu $channelSettingsPath, um einen zu erstellen.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'Du benötigst die Berechtigung \"$permission\", um Webhooks für diese Community anzuzeigen und zu bearbeiten.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle =>
      'Webhooks konnten nicht geladen werden';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'Beim Laden der Webhooks ist ein Fehler aufgetreten. Versuche es noch einmal.';

  @override
  String get guildSettingsWebhooksUpdated => 'Webhooks aktualisiert';

  @override
  String get guildSettingsWebhooksUpdateFailed =>
      'Webhooks konnten nicht aktualisiert werden';

  @override
  String get guildSettingsUnknownChannel => 'Unbekannter Kanal';

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
      'Füge deine Community zu Discovery hinzu, damit andere sie finden und ihr beitreten können.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Nicht genügend Mitglieder';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Deine Community benötigt mindestens $count Mitglieder, bevor sie in Discovery gelistet werden kann.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Status:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'Ausstehend';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Genehmigt';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Abgelehnt';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Entfernt';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Grund: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'Deine Community ist in der Entdeckung gelistet. Du kannst deine Eintragsdetails unten aktualisieren oder den Eintrag zurückziehen, um ihn zu entfernen.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Deine Bewerbung wird noch geprüft. Du kannst deine Angebotsdetails weiterhin aktualisieren oder die Bewerbung zurückziehen.';

  @override
  String get guildSettingsDiscoveryCategory => 'Kategorie';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Wähle die Kategorie, die deine Community am besten beschreibt. Du kannst dies jederzeit ändern.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Primäre Sprache';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'Die Sprache, die der Großteil deiner Community spricht. Wird zum Filtern der Discovery-Ergebnisse verwendet.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Beschreibung';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Beschreibe, worum es in deiner Community geht';

  @override
  String get guildSettingsDiscoveryDescriptionRequired =>
      'Eine Beschreibung ist erforderlich.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'Beschreibung muss mindestens $minLength Zeichen lang sein.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'Die Beschreibung darf nicht länger als $maxLength Zeichen sein.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Tags';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Bis zu $maxTags Tags helfen Leuten, deine Community zu finden. Sie werden in der Discovery-Suche angezeigt.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint =>
      'Tag hinzufügen und Enter drücken';

  @override
  String get guildSettingsDiscoveryAddTag => 'Hinzufügen';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Tag \"$tag\" entfernen';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle =>
      'Tag konnte nicht hinzugefügt werden';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'Tags müssen 2 bis $maxLength alphanumerische Zeichen lang sein.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'Du kannst nur bis zu $maxTags Tags hinzufügen.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Anwenden';

  @override
  String get guildSettingsDiscoverySave => 'Speichern';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Zurückziehen';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Discovery-Antrag gesendet';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Discovery-Eintrag aktualisiert';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Discovery-Antrag zurückgezogen';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Bewerbung konnte nicht zurückgezogen werden';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Versuch es später noch einmal.';

  @override
  String get guildSettingsMembersDescription =>
      'Servermitglieder suchen und verwalten.';

  @override
  String get guildSettingsMembersSearchHint => 'Nach Nutzername oder ID suchen';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count Mitglieder';
  }

  @override
  String get guildMembersRecentTitle => 'Neue Mitglieder';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Zeigt $displayedCount von insgesamt $totalCount Mitgliedern an';
  }

  @override
  String get guildMembersSort => 'Sortieren';

  @override
  String get guildSettingsMembersSortNewest => 'Neueste zuerst';

  @override
  String get guildMembersSortOldest => 'Älteste zuerst';

  @override
  String get guildMembersColumnName => 'Name';

  @override
  String get guildMembersColumnMemberSince => 'Mitglied seit';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'Beigetreten bei $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Beitrittsmethode';

  @override
  String get guildMembersColumnRoles => 'Rollen';

  @override
  String get guildMembersColumnActions => 'Aktionen';

  @override
  String get guildMembersFilterMemberSince => 'Filtern nach Mitglied seit';

  @override
  String get guildMembersFilterJoinedProduct => 'Nach Erstellungsdatum filtern';

  @override
  String get guildMembersFilterJoinMethod => 'Nach Beitrittsmethode filtern';

  @override
  String get guildMembersFilterRoles => 'Nach Rollen filtern';

  @override
  String get guildMembersFilterAll => 'Alle';

  @override
  String get guildMembersFilterPast1Hour => 'Letzte Stunde';

  @override
  String get guildMembersFilterPast24Hours => 'Letzte 24 Stunden';

  @override
  String get guildMembersFilterPast7Days => 'Letzte 7 Tage';

  @override
  String get guildMembersFilterPast2Weeks => 'Letzte 2 Wochen';

  @override
  String get guildMembersFilterPast3Weeks => 'Letzte 3 Wochen';

  @override
  String get guildMembersFilterPast4Weeks => 'Letzte 4 Wochen';

  @override
  String get guildMembersFilterPast3Months => 'Letzte 3 Monate';

  @override
  String get guildMembersFilterCustomRange => 'Benutzerdefinierter Bereich …';

  @override
  String get guildMembersDateRangeTitle => 'Benutzerdefinierter Datumsbereich';

  @override
  String get guildMembersDateAfter => 'Nach Datum';

  @override
  String get guildMembersDateBefore => 'Datum vor';

  @override
  String get guildMembersClearAll => 'Alle löschen';

  @override
  String get guildMembersRowsPerPage => 'Zeilen pro Seite';

  @override
  String get guildMembersEmptySearch => 'Niemand entspricht dieser Suche.';

  @override
  String get guildMembersLoadError =>
      'Beim Laden der Mitglieder ist ein Fehler aufgetreten. Bitte versuche es später noch einmal.';

  @override
  String get guildMembersIndexing => 'Mitglieder werden indiziert…';

  @override
  String get guildMembersGoToPage => 'Zur Seite';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'Gehe zu Seite $page';
  }

  @override
  String get guildMembersJumpToPage => 'Gehe zu Seite';

  @override
  String get guildMembersJoinSourceCreator => 'Community-Ersteller';

  @override
  String get guildMembersJoinSourceInvite => 'Einladen';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Einladung ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Eingeladen von $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'Vanity-URL';

  @override
  String get guildMembersJoinSourceBotInvite => 'Bot-Einladung';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'Plattform-Admin';

  @override
  String get guildMembersJoinSourceDiscovery => 'Entdecken';

  @override
  String get guildMembersJoinMethodUnknown => 'Unbekannt';

  @override
  String get guildMembersCommunityOwner => 'Community-Eigentümer';

  @override
  String get guildMembersViewAllRoles => 'Alle Rollen ansehen';

  @override
  String get guildMembersJoinedJustNow => 'Gerade eben';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vor $count Minuten',
      one: 'vor 1 Minute',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vor $count Stunden',
      one: 'vor 1 Stunde',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vor $count Tagen',
      one: 'vor 1 Tag',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Mitglieder';

  @override
  String get guildMembersChannelListSelected => 'Mitglieder, ausgewählt';

  @override
  String get guildSettingsInvitesTitle => 'Einladungen';

  @override
  String get guildSettingsInvitesDescription =>
      'Alle Einladungen für diese Community ansehen. Um eine neue Einladung zu erstellen, gehe zu einem Kanal und nutze den Einladungs-Button.';

  @override
  String get guildSettingsInvitesEmpty => 'Keine Einladungslinks';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Diese Community hat noch keine Einladungslinks. Gehe zu einem Kanal und erstelle eine Einladung, um Leute einzuladen.';

  @override
  String get guildSettingsInvitesLoadFailedTitle => 'Einladen fehlgeschlagen';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Beim Laden der Einladungen ist ein Fehler aufgetreten. Versuche es noch einmal.';

  @override
  String get guildSettingsInvitesTryAgain => 'Erneut versuchen';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Erstellungsdatum statt Ablaufdatum anzeigen';

  @override
  String get guildSettingsInvitesPauseInvites => 'Einladungen pausieren';

  @override
  String get guildSettingsInvitesEnableInvites => 'Einladungen aktivieren';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Einladungen für diese Community pausieren';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Einladungen für diese Community aktivieren';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Einladungen pausieren? Neue Nutzer können über Einladungslinks nicht beitreten, bis du sie wieder aktivierst. Bestehende Mitglieder sind davon nicht betroffen.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Einladungen aktivieren? Nutzer können dieser Community dann wieder über Einladungslinks beitreten.';

  @override
  String get guildSettingsInvitesPause => 'Pausieren';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Einladungen für diese Community sind pausiert.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Einladungen sind pausiert, da $productName einen potenziellen Raid erkannt hat. Neue Benutzer können derzeit nicht beitreten.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Einladende Person:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Kanal:';

  @override
  String get guildSettingsInvitesLabelCode => 'Code:';

  @override
  String get guildSettingsInvitesLabelUses => 'Verwendet:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Erstellt:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Läuft ab:';

  @override
  String get guildSettingsInvitesUnknown => 'Unbekannt';

  @override
  String get guildSettingsInvitesNoCategory => 'Keine Kategorie';

  @override
  String get guildSettingsInvitesExpired => 'Abgelaufen';

  @override
  String get guildSettingsInvitesNever => 'Nie';

  @override
  String get guildSettingsInvitesCopyLink => 'Einladungslink kopieren';

  @override
  String get guildSettingsInvitesRevoke => 'Einladung widerrufen';

  @override
  String get guildSettingsInvitesRevokeFailedTitle =>
      'Einladung konnte nicht widerrufen werden';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'Der Link funktioniert möglicherweise noch. Versuchen Sie es in Kürze erneut.';

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
  String get guildSettingsEmojiSlotsTitle => 'Emoji-Slots';

  @override
  String get guildSettingsEmojiDropZone => 'Emoji-Dateien hierher ziehen';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Emojis konnten nicht geladen werden. Bitte versuche es später noch einmal.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'Keine Emojis gefunden, die deiner Suche entsprechen.';

  @override
  String get guildSettingsEmojiNoSlots => 'Keine Emoji-Slots verfügbar';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Du hast die maximale Anzahl an Emojis erreicht. Lösche vorhandene Emojis, um Platz zu schaffen.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Emoji-Namen müssen mindestens 2 Zeichen lang sein und können Buchstaben, Zahlen und Unterstriche enthalten. Emojis dürfen $maxSize nicht überschreiten. Statische Bilder werden automatisch auf 128x128 Pixel skaliert und komprimiert. Animierte Emojis und SVGs müssen bereits die Größenbeschränkung einhalten.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'Emojis werden hochgeladen';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# Emojis',
      one: '# Emoji',
    );
    return 'Lade $_temp0 hoch. Das kann einen Moment dauern.';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'Emojis konnten nicht hochgeladen werden. Bitte versuche es noch einmal.';

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Einige Emojis konnten nicht hinzugefügt werden';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'Überprüfe diese Dateien und versuche es noch einmal mit kleineren oder einfacheren Bildern.';

  @override
  String get guildSettingsEmojiRenameTitle => 'Emoji umbenennen';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2–32 Zeichen, Buchstaben, Zahlen, Unterstriche.';

  @override
  String get guildSettingsEmojiColumnEmoji => 'Emojis';

  @override
  String get guildSettingsEmojiColumnName => 'Name';

  @override
  String get guildSettingsEmojiColumnUploader => 'Hochgeladen von';

  @override
  String get guildSettingsEmojiUnknownUploader => 'Unbekannt';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Emoji löschen';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'Löschen Sie :$name:? Dies kann nicht rückgängig gemacht werden.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Dieses Emoji aus Speicher und CDN löschen';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'Der Emoji-Name muss mindestens 2 Zeichen lang sein';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'Der Emoji-Name darf höchstens 32 Zeichen lang sein';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Ungültiger Emoji-Name';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Emoji konnte nicht umbenannt werden';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'Der Name wurde auf den vorherigen Zustand zurückgesetzt. Bitte versuche es in Kürze erneut.';

  @override
  String get guildSettingsEmojiGoneTitle => 'Dieses Emoji existiert nicht mehr';

  @override
  String get guildSettingsEmojiGoneBody =>
      'Sie wurde möglicherweise gelöscht. Der Name wurde auf den vorherigen Zustand zurückgesetzt.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'Du kannst dieses Emoji nicht umbenennen';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'Du hast keine Berechtigung, dieses Emoji umzubenennen. Der Name wurde auf den vorherigen Zustand zurückgesetzt.';

  @override
  String get guildSettingsEmojiRateLimitedTitle => 'Du bist zu schnell';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'Bitte warten Sie einen Moment und versuchen Sie, die Umbenennung erneut durchzuführen.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Emoji konnte nicht gelöscht werden';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'Du kannst dieses Emoji nicht löschen';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'Anderen erlauben, deine Emojis zu klonen';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'Wenn aktiviert, können Mitglieder anderer Communitys den In-App-\"Klonen\"-Shortcut für deine benutzerdefinierten Emojis verwenden. Dies hindert sie nicht daran, das Bild zu speichern und selbst hochzuladen.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Anderen erlauben, deine Sticker zu klonen';

  @override
  String get guildSettingsCloneStickerDescription =>
      'Wenn aktiviert, können Mitglieder anderer Communitys die In-App-\"Klonen\"-Verknüpfung für deine benutzerdefinierten Sticker verwenden. Dies hindert sie nicht daran, das Bild zu speichern und selbst hochzuladen.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Nur Mitglieder mit der Berechtigung \"$permission\" können dies ändern.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'Emoji-Klonen konnte nicht aktualisiert werden';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Sticker-Klonen konnte nicht aktualisiert werden';

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
  String get guildSettingsStickerSlotsTitle => 'Sticker-Slots';

  @override
  String get guildSettingsStickerUploadTitle => 'Sticker hochladen';

  @override
  String get guildSettingsStickerDropZone =>
      'Ziehe eine Sticker-Datei hierher (immer nur eine)';

  @override
  String get guildSettingsStickerDensity => 'Sticker-Dichte';

  @override
  String get guildSettingsStickerDensityCozy => 'Gemütlich';

  @override
  String get guildSettingsStickerDensityCompact => 'Kompakt';

  @override
  String get guildSettingsStickersLoadFailedTitle =>
      'Sticker konnten nicht geladen werden';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Beim Laden der Sticker ist ein Fehler aufgetreten. Bitte versuche es erneut.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Keine Sticker gefunden, die deiner Suche entsprechen.';

  @override
  String get guildSettingsStickersEmptySearch => 'Keine Sticker gefunden';

  @override
  String get guildSettingsStickerNoSlots => 'Keine Sticker-Slots verfügbar';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Du hast die maximale Anzahl an Stickern erreicht. Lösche vorhandene Sticker, um Platz zu schaffen.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Sticker werden mit 320x320 Pixeln gespeichert und dürfen $maxSize nicht überschreiten. Statische Bilder werden automatisch skaliert und komprimiert. Animierte Sticker und SVGs müssen bereits die Größenbeschränkung einhalten.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle =>
      'Nicht unterstützte Sticker-Datei';

  @override
  String get guildSettingsStickerAddTitle => 'Sticker hinzufügen';

  @override
  String get guildSettingsStickerEditTitle => 'Sticker bearbeiten';

  @override
  String get guildSettingsStickerNameLabel => 'Name';

  @override
  String get guildSettingsStickerNameHint => 'Mein toller Sticker';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Beschreibung';

  @override
  String get guildSettingsStickerDescriptionHint => 'Sticker beschreiben';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Tags ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Tag hinzufügen';

  @override
  String get guildSettingsStickerTagAdd => 'Hinzufügen';

  @override
  String get guildSettingsStickerNameRequired => 'Name ist erforderlich';

  @override
  String get guildSettingsStickerNameTooShort =>
      'Name muss mindestens 2 Zeichen lang sein';

  @override
  String get guildSettingsStickerNameTooLong =>
      'Name muss aus maximal 30 Zeichen bestehen';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'Beschreibung muss 500 Zeichen oder weniger haben';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'Sticker konnte nicht erstellt werden';

  @override
  String get guildSettingsStickerTooLargeTitle => 'Sticker ist zu groß';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'Sticker konnte nicht ausreichend komprimiert werden';

  @override
  String get guildSettingsStickerDeleteTitle => 'Sticker löschen';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return '„$name“ löschen? Das kann nicht rückgängig gemacht werden.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Diesen Sticker aus Speicher und CDN löschen';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Dieser Sticker konnte nicht gelöscht werden';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'Du kannst diesen Sticker nicht löschen';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Um einen Webhook zu erstellen, öffne $channelSettingsPath. Du kannst alle vorhandenen Webhooks hier weiterhin bearbeiten und organisieren.';
  }

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
  String get guildSettingsInvitesTableExpires => 'Läuft ab';

  @override
  String get guildSettingsAuditLogFilterUser => 'Nach Benutzer filtern';

  @override
  String get guildSettingsAuditLogFilterAction => 'Nach Aktion filtern';

  @override
  String get createDm => 'Neue Direktnachricht';

  @override
  String get createGroupDm => 'Gruppen-DM erstellen';

  @override
  String get createDmNewMessage => 'Neue Nachricht';

  @override
  String get createDmSelectFriends => 'Freunde auswählen';

  @override
  String get createDmChooseFriendsSubtitle => 'Wähle Freunde zum Chatten aus.';

  @override
  String get createDmSearchFriends => 'Freunde suchen';

  @override
  String get createDmNoFriendsFound => 'Keine Freunde gefunden';

  @override
  String get createDmNoFriendsYet => 'Du hast noch keine Freunde';

  @override
  String get createDmClaimToStartDms =>
      'Beanspruche deinen Account, um DMs zu beginnen.';

  @override
  String get createDmVerifyToStartDms =>
      'Bestätige deine E-Mail-Adresse, um DMs zu starten.';

  @override
  String get createDmVerifyYourEmail => 'E-Mail-Adresse bestätigen';

  @override
  String get createDmNewGroup => 'Neue Gruppe';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Neue Gruppe mit $userName erstellen';
  }

  @override
  String get createDmConfirmNewGroup => 'Neue Gruppe bestätigen';

  @override
  String get createDmCreateNewGroup => 'Neue Gruppe erstellen';

  @override
  String createDmRemoveFriend(String displayName) {
    return '$displayName entfernen';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'Du hast bereits eine Gruppe mit diesen Nutzern. Möchtest du wirklich eine neue erstellen? Das ist auch in Ordnung!';

  @override
  String get createDmNoActivityYet => 'Noch keine Aktivität';

  @override
  String get createDmSomeUsersCantBeAdded =>
      'Einige Nutzer können nicht hinzugefügt werden';

  @override
  String get createDmCreateWithoutThem => 'Ohne sie erstellen';

  @override
  String get createDmUnaddableIntro =>
      'Die folgenden Personen können dieser Gruppen-DM nicht hinzugefügt werden:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Die Gruppen-DM mit den verbleibenden $count Empfänger(n) erstellen und die anderen überspringen?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Keine verbleibenden Empfänger, um eine Gruppen-DM zu erstellen.';

  @override
  String get createDmUnaddableUserNotFound => 'Nutzer nicht gefunden';

  @override
  String get createDmUnaddableBlocked =>
      'Du kannst diesem Nutzer keine Nachricht senden';

  @override
  String get createDmUnaddableNotFriends => 'Nicht auf deiner Freundesliste';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Kann nicht zu Gruppen-DMs hinzugefügt werden';

  @override
  String get createDmFailed =>
      'Konversation konnte nicht erstellt werden. Versuche es erneut.';

  @override
  String get dmListMessagesTitle => 'Nachrichten';

  @override
  String get dmListDirectMessagesTitle => 'Direktnachrichten';

  @override
  String get keybindsSearchShortcuts => 'Tastenkürzel suchen';

  @override
  String get keybindSectionDefaults => 'Standard';

  @override
  String get keybindSectionMessages => 'Nachrichten';

  @override
  String get keybindSectionNavigation => 'Navigation';

  @override
  String get keybindSectionDragAndDrop => 'Ziehen und ablegen';

  @override
  String get keybindSectionChat => 'Chat';

  @override
  String get keybindSectionVoiceAndVideo => 'Sprach- und Videoanrufe';

  @override
  String get keybindSectionMisc => 'Verschiedenes';

  @override
  String get keybindActionShowShortcutsList => 'Tastenkombinationen anzeigen';

  @override
  String get keybindActionCopyText => 'Text kopieren';

  @override
  String get keybindActionMarkUnread => 'Als ungelesen markieren';

  @override
  String get keybindActionFocusTextarea => 'Textfeld fokussieren';

  @override
  String get keybindActionSwitchCommunities => 'Zwischen Communitys wechseln';

  @override
  String get keybindActionSwitchChannels => 'Zwischen Channels wechseln';

  @override
  String get keybindActionHistoryBack => 'Im Kanalverlauf zurückgehen';

  @override
  String get keybindActionHistoryForward =>
      'Im Kanalverlauf vorwärts navigieren';

  @override
  String get keybindActionJumpUnreadChannels =>
      'Zwischen ungelesenen Kanälen springen';

  @override
  String get keybindActionJumpMentionChannels =>
      'Zwischen ungelesenen Channels mit Erwähnungen springen';

  @override
  String get keybindActionJumpCurrentCall => 'Zum aktuellen Anruf springen';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Zwischen letzter Community und DMs wechseln';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Zum vorherigen Community- oder DM-Chat wechseln';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Zum nächsten Community- oder DM-Chat wechseln';

  @override
  String get keybindActionGoToDms => 'Direktnachrichten öffnen';

  @override
  String get keybindActionGoToFirstCommunity => 'Zur ersten Community';

  @override
  String get keybindActionGoToSecondCommunity => 'Zur zweiten Community';

  @override
  String get keybindActionGoToThirdCommunity => 'Zur dritten Community';

  @override
  String get keybindActionGoToFourthCommunity => 'Zur vierten Community';

  @override
  String get keybindActionGoToFifthCommunity => 'Zur fünften Community gehen';

  @override
  String get keybindActionGoToSixthCommunity => 'Zur sechsten Community';

  @override
  String get keybindActionGoToSeventhCommunity => 'Zur siebten Community';

  @override
  String get keybindActionGoToEighthCommunity => 'Zur achten Community gehen';

  @override
  String get keybindActionToggleQuickSwitcher => 'Schnellwechsler umschalten';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'Community erstellen oder beitreten';

  @override
  String get keybindActionStartDragAndDrop => 'Ziehen und Ablegen starten';

  @override
  String get keybindActionMove => 'Verschieben';

  @override
  String get keybindActionDropItem => 'Objekt ablegen';

  @override
  String get keybindActionCancel => 'Abbrechen';

  @override
  String get keybindActionMarkCommunityRead =>
      'Community als gelesen markieren';

  @override
  String get keybindActionMarkChannelRead => 'Kanal als gelesen markieren';

  @override
  String get keybindActionStartGroupDm => 'Gruppen-DM starten';

  @override
  String get keybindActionTogglePinnedMessages =>
      'Angepinnte Nachrichten umschalten';

  @override
  String get keybindActionToggleInbox => 'Posteingang umschalten';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Obersten Posteingangskanal als gelesen markieren';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Alle Posteingangskanäle als gelesen markieren';

  @override
  String get keybindActionToggleMemberList =>
      'Mitgliederliste oder Sprach-Chat umschalten';

  @override
  String get keybindActionToggleEmojiPicker => 'Emoji-Auswahl ein-/ausschalten';

  @override
  String get keybindActionToggleGifPicker => 'GIF-Auswahl ein-/ausschalten';

  @override
  String get keybindActionToggleStickerPicker =>
      'Sticker-Auswahl ein-/ausblenden';

  @override
  String get keybindActionScrollChatUp => 'Chat nach oben scrollen';

  @override
  String get keybindActionScrollChatDown => 'Chat nach unten scrollen';

  @override
  String get keybindActionJumpOldestUnread =>
      'Zur ältesten ungelesenen Nachricht springen';

  @override
  String get keybindActionFocusComposer => 'Textfeld fokussieren';

  @override
  String get keybindActionUploadFile => 'Datei hochladen';

  @override
  String get keybindActionCopyChannelLink => 'Kanallink kopieren';

  @override
  String get keybindActionToggleSavedMedia => 'Gespeicherte Medien umschalten';

  @override
  String get keybindActionSendVoiceMessage => 'Sprachnachricht senden';

  @override
  String get keybindActionAnswerCall => 'Eingehenden Anruf annehmen';

  @override
  String get keybindActionDeclineCall => 'Eingehenden Anruf ablehnen';

  @override
  String get keybindActionStartDmCall =>
      'Anruf in einem DM oder einer Gruppe starten';

  @override
  String get keybindActionToggleSoundboard => 'Soundboard umschalten';

  @override
  String get keybindActionToggleCompactCallView =>
      'Kompakte Anrufansicht erweitern oder minimieren';

  @override
  String get keybindActionPushToTalkPriority => 'Push-to-Talk (Priorität)';

  @override
  String get keybindActionVoiceActivityPriority => 'Sprachaktivitätspriorität';

  @override
  String get keybindActionOpenHelp => 'Hilfe öffnen';

  @override
  String get keybindActionSearchMessages => 'Nachrichten suchen';

  @override
  String get keybindActionOpenContextMenu => 'Kontextmenü öffnen';

  @override
  String get keybindActionOpenSettings => 'Einstellungen öffnen';

  @override
  String get keybindActionOpenThemeStudio => 'Designstudio-Pop-out öffnen';

  @override
  String get keybindActionZoomIn => 'Vergrößern';

  @override
  String get keybindActionZoomOut => 'Verkleinern';

  @override
  String get keybindActionZoomReset => 'Zoom zurücksetzen';

  @override
  String get clipboardPasteFailed =>
      'Konnte nicht einfügen. Die Zwischenablage war leer oder für diese App gesperrt.';

  @override
  String get homeQuickActionDms => 'Direktnachrichten';
}
