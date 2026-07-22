// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class FluxerLocalizationsIt extends FluxerLocalizations {
  FluxerLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get reconnectingTitle => 'Abbiamo fatto un pasticcio!';

  @override
  String get reconnectingBody =>
      'C\'è un problema con i server.\nDovrebbe risolversi in un attimo!';

  @override
  String get gatewayReconnectingToast => 'Riconnessione…';

  @override
  String get gatewayConnectedToast => 'Connesso';

  @override
  String get sessionExpiredToast =>
      'La tua sessione è scaduta. Accedi di nuovo.';

  @override
  String splashStartupFailed(String error) {
    return 'Avvio fallito: $error';
  }

  @override
  String get retry => 'Riprova';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Connessione persa';

  @override
  String get splashViewOnStatusPage => 'Visualizza sulla pagina di stato';

  @override
  String get splashConnectionIssuesPrompt => 'Problemi di connessione?';

  @override
  String get splashStatusPageLink => 'Pagina di stato';

  @override
  String get splashReadIncident => 'Leggi l\'incidente';

  @override
  String get splashIncidentHistory => 'Cronologia incidenti';

  @override
  String get nagbarLearnMore => 'Scopri di più';

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
      'Abilita l\'autenticazione a due fattori per proteggere il tuo account Visionary.';

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
  String get welcomeBack => 'Bentornato';

  @override
  String get email => 'Email';

  @override
  String get emailInvalid => 'Inserisci un indirizzo email valido.';

  @override
  String get password => 'Password';

  @override
  String get forgotPassword => 'Hai dimenticato la password?';

  @override
  String get logIn => 'Accedi';

  @override
  String get logInWithPasskey => 'Accedi con una passkey';

  @override
  String continueWithSso(String provider) {
    return 'Continua con $provider';
  }

  @override
  String get ssoRequired =>
      'L\'accesso SSO è richiesto per accedere a questa istanza.';

  @override
  String get organizationSsoProvider =>
      'Accedi tramite il provider di single sign-on della tua organizzazione.';

  @override
  String get failedToStartSso => 'Impossibile avviare l\'SSO';

  @override
  String get ssoCancelled => 'Accesso SSO annullato';

  @override
  String preferSso(String provider) {
    return 'Preferisci usare l\'SSO? Continua con $provider.';
  }

  @override
  String get logInViaBrowser => 'Accedi tramite browser';

  @override
  String get needAccountPrompt => 'Non hai un account? ';

  @override
  String get register => 'Registrati';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Verifica di essere umano';

  @override
  String get captchaDescription =>
      'Dobbiamo assicurarci che tu non sia un bot. Completa la verifica qui sotto.';

  @override
  String get captchaSwitchToHcaptcha => 'Problemi? Prova hCaptcha';

  @override
  String get captchaSwitchToTurnstile => 'Prova Turnstile';

  @override
  String get cancel => 'Annulla';

  @override
  String get ipAuthCheckEmail => 'Controlla la tua email';

  @override
  String ipAuthDescription(String email) {
    return 'Abbiamo inviato un link via email per autorizzare questo accesso. Apri la tua casella di posta per $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Connessione persa';

  @override
  String get ipAuthConnectionLostDescription =>
      'Abbiamo perso la connessione mentre attendevamo l\'autorizzazione. Riprova.';

  @override
  String get ipAuthLinkExpired => 'Link di accesso scaduto';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Questo link di autorizzazione è scaduto. Accedi di nuovo.';

  @override
  String get ipAuthResendEmail => 'Invia di nuovo l\'email';

  @override
  String get ipAuthResent => 'Inviato di nuovo';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Indietro';

  @override
  String get mfaTitle => 'Autenticazione a due fattori';

  @override
  String get mfaChooseMethod => 'Scegli un metodo di verifica';

  @override
  String get mfaMethodTotp => 'App di autenticazione';

  @override
  String get mfaMethodWebauthn => 'Chiave di sicurezza / Passkey';

  @override
  String get mfaTotpDescription =>
      'Inserisci il codice di 6 cifre dalla tua app di autenticazione o uno dei tuoi codici di backup.';

  @override
  String get mfaCodeLabel => 'Codice';

  @override
  String get mfaTryAnotherMethod => 'Prova un altro metodo';

  @override
  String get mfaUseSecurityKey => 'Prova la chiave di sicurezza / passkey';

  @override
  String get accountSelectorTitle => 'Scegli un account';

  @override
  String get accountSelectorDescription =>
      'Seleziona un account per continuare o aggiungine un altro.';

  @override
  String get accountAdd => 'Aggiungi un account';

  @override
  String get accountRemove => 'Rimuovi';

  @override
  String accountRemoveTitle(String username) {
    return 'Rimuovi $username';
  }

  @override
  String get accountRemoveDescription =>
      'Questo rimuoverà la sessione salvata per questo account.';

  @override
  String get accountRemoveOnlyDescription =>
      'Questo rimuoverà l\'unico account salvato su questo dispositivo.';

  @override
  String get accountExpired => 'Scaduto';

  @override
  String accountSessionExpired(String identifier) {
    return 'Sessione scaduta per $identifier. Accedi di nuovo.';
  }

  @override
  String get accountManageTitle => 'Gestisci account';

  @override
  String get accountSwitchFailed => 'Impossibile cambiare account. Riprova.';

  @override
  String get profileTabMenuSwitchAccounts => 'Cambia account';

  @override
  String get statusChangeSheetTitle => 'Imposta stato';

  @override
  String get statusOnlineStatusSection => 'Stato online';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusIdle => 'Inattivo';

  @override
  String get statusDnd => 'Non disturbare';

  @override
  String get statusInvisible => 'Invisibile';

  @override
  String get statusOffline => 'Offline';

  @override
  String get statusUntilIChangeIt => 'Finché non lo cambio';

  @override
  String get statusDontClear => 'Non cancellare';

  @override
  String get statusFor10Seconds => 'Per 10 secondi';

  @override
  String get statusClearAfter10Seconds => '10 secondi';

  @override
  String get statusClearAfter15Minutes => '15 minuti';

  @override
  String get statusClearAfter30Minutes => '30 minuti';

  @override
  String get statusClearAfter1Hour => '1 ora';

  @override
  String get statusClearAfter3Hours => '3 ore';

  @override
  String get statusClearAfter4Hours => '4 ore';

  @override
  String get statusClearAfter8Hours => '8 ore';

  @override
  String get statusClearAfter24Hours => '24 ore';

  @override
  String get statusClearAfter3Days => '3 giorni';

  @override
  String get statusDndDescription => 'Non riceverai notifiche sul desktop';

  @override
  String get statusInvisibleDescription => 'Apparirai offline';

  @override
  String get customStatusSetTitle => 'Imposta stato personalizzato';

  @override
  String get customStatusCurrentHint => 'Stato personalizzato';

  @override
  String get customStatusClear => 'Cancella stato personalizzato';

  @override
  String get customStatusPlaceholder => 'Cosa sta succedendo?';

  @override
  String get customStatusChooseEmoji => 'Scegli un\'emoji';

  @override
  String get customStatusClearAfter => 'Cancella dopo';

  @override
  String get customStatusSave => 'Salva';

  @override
  String get accountActive => 'Account attivo';

  @override
  String get signOut => 'Esci';

  @override
  String get suspendedPermanentTitle => 'Account sospeso permanentemente';

  @override
  String get suspendedTemporaryTitle => 'Account sospeso';

  @override
  String get suspendedPermanentDescription =>
      'Il tuo account è stato sospeso permanentemente per violazione dei nostri Termini di servizio.';

  @override
  String get suspendedTemporaryDescription =>
      'Il tuo account è stato sospeso temporaneamente. Potrai accedere al tuo account una volta terminato il periodo di sospensione.';

  @override
  String get suspendedIssuedAt => 'Emissione';

  @override
  String get suspendedEndsAt => 'Termina';

  @override
  String get suspendedDuration => 'Durata';

  @override
  String get suspendedPermanent => 'Permanente';

  @override
  String get suspendedReason => 'Motivo';

  @override
  String get suspendedAppealDeadline => 'Scadenza appello';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Il tuo account è programmato per la cancellazione il $date.';
  }

  @override
  String get suspendedRecheck => 'Verifica aggiornamenti';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Riprova tra ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Torna al login';

  @override
  String get suspendedAppealTitle => 'Appello';

  @override
  String get suspendedAppealHint =>
      'Spiega perché la tua sospensione dovrebbe essere riconsiderata (minimo 50 caratteri)...';

  @override
  String get suspendedAppealSubmit => 'Invia appello';

  @override
  String get suspendedAppealPending => 'In attesa di revisione';

  @override
  String get suspendedAppealAccepted => 'Appello accettato';

  @override
  String get suspendedAppealRejected => 'Appello rifiutato';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Il tuo appello è stato accettato e il tuo account è stato ripristinato.';

  @override
  String get suspendedSignIn => 'Accedi al tuo account';

  @override
  String get forgotPasswordTitle => 'Password dimenticata?';

  @override
  String get forgotPasswordDescription =>
      'Inserisci il tuo indirizzo email e ti invieremo un link per reimpostare la password.';

  @override
  String get forgotPasswordSubmit => 'Invia link di reset';

  @override
  String get forgotPasswordSentTitle => 'Controlla la tua email';

  @override
  String get forgotPasswordSentDescription =>
      'Abbiamo inviato le istruzioni per reimpostare la password al tuo indirizzo email. Controlla la tua casella di posta e segui il link per reimpostare la password.';

  @override
  String get forgotPasswordBackToLogin => 'Torna al login';

  @override
  String get resetPasswordTitle => 'Imposta una nuova password';

  @override
  String get resetPasswordDescription =>
      'Inserisci la tua nuova password qui sotto per completare il processo di reset.';

  @override
  String get resetPasswordNewPassword => 'Nuova password';

  @override
  String get resetPasswordConfirm => 'Conferma nuova password';

  @override
  String get resetPasswordSubmit => 'Reimposta password';

  @override
  String get resetPasswordMismatch => 'Le password non corrispondono.';

  @override
  String get registerTitle => 'Crea un account';

  @override
  String get registerDisplayName => 'Nome visualizzato (facoltativo)';

  @override
  String get registerDisplayNameHint => 'Come vuoi essere chiamato?';

  @override
  String get registerUsername => 'Nome utente (facoltativo)';

  @override
  String get registerUsernameHint => 'Lascia vuoto per un nome utente casuale';

  @override
  String get registerUsernameTagHint =>
      'Un tag di 4 cifre verrà aggiunto automaticamente per garantire l\'unicità';

  @override
  String get registerDateOfBirth => 'Data di nascita';

  @override
  String get registerMonth => 'Mese';

  @override
  String get registerDay => 'Giorno';

  @override
  String get registerYear => 'Anno';

  @override
  String get registerConsent =>
      'Accetto i Termini di Servizio e l\'Informativa sulla Privacy';

  @override
  String get registerConsentPrefix => 'Accetto i ';

  @override
  String get registerConsentTerms => 'Termini di Servizio';

  @override
  String get registerConsentAnd => ' e ';

  @override
  String get registerConsentPrivacy => 'Informativa sulla Privacy';

  @override
  String get registerConfirmPassword => 'Conferma password';

  @override
  String get registerSubmit => 'Crea account';

  @override
  String get registerHaveAccount => 'Hai già un account? ';

  @override
  String get passkeyNoCredentials =>
      'Nessuna passkey trovata per questa app. Accedi invece con email e password.';

  @override
  String get passkeyDeviceNotSupported =>
      'Le passkey non sono supportate su questo dispositivo.';

  @override
  String get passkeyDomainNotAssociated =>
      'Le passkey non sono configurate per questa app. Accedi invece con email e password.';

  @override
  String get passkeyTimeout => 'Autenticazione passkey scaduta. Riprova.';

  @override
  String get passkeyNotAvailable =>
      'Le passkey non sono disponibili per questa app. Accedi invece con email e password.';

  @override
  String get passkeyFailed =>
      'Autenticazione con passkey non riuscita. Riprova.';

  @override
  String get errorUnableToCreateAccount =>
      'Impossibile creare l\'account. Riprova.';

  @override
  String get errorUnableToSignIn => 'Impossibile accedere al momento. Riprova.';

  @override
  String get errorInvalidEmailOrPassword => 'Email o password non validi.';

  @override
  String get errorUnableToSendResetLink =>
      'Impossibile inviare il link di reimpostazione. Riprova.';

  @override
  String get errorUnableToResetPassword =>
      'Impossibile reimpostare la password. Riprova.';

  @override
  String get embedInviteJoin => 'Unisciti alla community';

  @override
  String get embedInviteGoTo => 'Vai alla community';

  @override
  String embedInviteOnline(String count) {
    return '$count Online';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count Membri';
  }

  @override
  String get embedInviteUnknownTitle => 'Invito sconosciuto';

  @override
  String get embedInviteUnknownSubtitle => 'Prova a chiedere un nuovo invito.';

  @override
  String get embedInviteUnavailable => 'Invito non disponibile';

  @override
  String get inviteAcceptTitle => 'Sei stato invitato a unirti';

  @override
  String get inviteAcceptJoinButton => 'Unisciti alla community';

  @override
  String get inviteAcceptGoToButton => 'Vai alla community';

  @override
  String get inviteAcceptInvitesPaused => 'Inviti in pausa';

  @override
  String get inviteAcceptNotFoundTitle => 'Invito non valido';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Questo invito potrebbe essere scaduto o non valido.';

  @override
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'Unisciti al gruppo';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Sei stato invitato a unirti a una chat di gruppo da $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'qualcuno';

  @override
  String get inviteAcceptEmojiPack => 'Pacchetto emoji';

  @override
  String get inviteAcceptStickerPack => 'Pacchetto sticker';

  @override
  String get inviteAcceptInstallEmojiPack => 'Installa pacchetto emoji';

  @override
  String get inviteAcceptInstallStickerPack => 'Installa pacchetto sticker';

  @override
  String get inviteAcceptPackInstallNote =>
      'Accettando questo invito, il pacchetto verrà installato automaticamente.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Accesso al canale negato';

  @override
  String get channelAccessDeniedDescription =>
      'Non hai accesso al canale in cui è stato inviato questo messaggio.';

  @override
  String get messageJumpLinkNoAccess => 'Nessun accesso';

  @override
  String get okay => 'Ok';

  @override
  String get embedThemeTitle => 'Tema condiviso';

  @override
  String get embedThemeSubtitle =>
      'Questo client non supporta temi personalizzati.';

  @override
  String get embedThemeUnavailableButton => 'Temi non disponibili';

  @override
  String get privacySettings => 'Impostazioni privacy';

  @override
  String get privacyDirectMessages => 'Messaggi diretti';

  @override
  String get privacyDirectMessagesDescription =>
      'Consenti messaggi diretti da altri membri in questa community';

  @override
  String get privacyBotDirectMessages => 'Messaggi diretti dai bot';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Consenti ai bot di questa community di inviarti messaggi diretti';

  @override
  String get privacyMutualDmsDisabled =>
      'Gli amministratori della community hanno disabilitato la ricezione di messaggi diretti esclusivamente da membri reciproci in questa community.';

  @override
  String get communityDebug => 'Debug community';

  @override
  String get copiedToClipboard => 'Copiato negli appunti';

  @override
  String get notificationSettings => 'Impostazioni notifiche';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Silenzia $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Silenziare una community impedisce la visualizzazione di indicatori di non letto e notifiche, a meno che tu non venga menzionato';

  @override
  String get notificationCommunitySettings =>
      'Impostazioni notifiche community';

  @override
  String get notificationAllMessages => 'Tutti i messaggi';

  @override
  String get notificationOnlyMentions => 'Solo menzioni';

  @override
  String get notificationNothing => 'Niente';

  @override
  String get notificationSuppressEveryone => 'Sopprimi @everyone e @here';

  @override
  String get notificationSuppressRoles =>
      'Sopprimi tutte le @menzioni di ruolo';

  @override
  String get notificationMobilePush => 'Notifiche push da dispositivo mobile';

  @override
  String get notificationOverrides => 'Sostituzioni notifiche';

  @override
  String get notificationSelectChannel => 'Seleziona un canale o una categoria';

  @override
  String get notificationOnlyAtMentions => 'Solo @menzioni';

  @override
  String get notificationMuteChannel => 'Silenzia canale';

  @override
  String get notificationUnmuteChannel => 'Riattiva audio canale';

  @override
  String get notificationNoCategory => 'Nessuna categoria';

  @override
  String get dmMarkAsRead => 'Segna come letto';

  @override
  String get dmMuteConversation => 'Silenzia DM';

  @override
  String get dmUnmuteConversation => 'Riattiva audio DM';

  @override
  String get dmPinDm => 'Fissa DM';

  @override
  String get dmUnpinDm => 'Rimuovi da fissati';

  @override
  String get dmAlwaysShowInSidebar => 'Mostra sempre nella barra laterale';

  @override
  String get dmRemoveFromAlwaysShown => 'Rimuovi da \"Mostra sempre\"';

  @override
  String get dmCloseDm => 'Chiudi DM';

  @override
  String get dmCloseDmConfirmTitle => 'Chiudi DM';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Sei sicuro di voler chiudere il tuo DM con $username? Potrai sempre riaprirlo in seguito.';
  }

  @override
  String get dmCopyChannelId => 'Copia ID canale';

  @override
  String get dmChannelIdCopied => 'ID canale copiato';

  @override
  String get dmCopyUserId => 'Copia ID utente';

  @override
  String get dmUserIdCopied => 'ID utente copiato';

  @override
  String get dmViewProfile => 'Visualizza profilo';

  @override
  String get dmVoiceCall => 'Avvia chiamata vocale';

  @override
  String get incomingVoiceCallTitle => 'Chiamata vocale in arrivo';

  @override
  String get incomingVoiceCallAccept => 'Accetta';

  @override
  String get incomingVoiceCallDecline => 'Rifiuta';

  @override
  String get incomingVoiceCallLabel => 'Chiamata in arrivo';

  @override
  String get incomingVoiceCallIgnore => 'Ignora';

  @override
  String get directVoiceCallNotEligible =>
      'Questa chiamata non può essere avviata al momento. Riprova tra poco.';

  @override
  String get voiceJoinCallFailed =>
      'Impossibile connettersi a questa chiamata. Controlla la tua connessione e riprova.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Impossibile partecipare a questa chiamata. Controlla la tua connessione e riprova.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Impossibile aggiornare questa chiamata sul server. Controlla la tua connessione e riprova.';

  @override
  String get dmAddNote => 'Aggiungi nota';

  @override
  String get dmEditGroup => 'Modifica gruppo';

  @override
  String get dmInviteToCommunity => 'Invita nella community';

  @override
  String get dmBlock => 'Blocca';

  @override
  String get dmLeaveGroup => 'Esci dal gruppo';

  @override
  String get dmNoCommunitiesAvailable => 'Nessuna community disponibile';

  @override
  String dmGroupMemberCount(int count) {
    return '$count membri';
  }

  @override
  String get dmMuteFor15Min => 'Per 15 minuti';

  @override
  String get dmMuteFor30Min => 'Per 30 minuti';

  @override
  String get dmMuteFor1Hour => 'Per 1 ora';

  @override
  String get dmMuteFor3Hours => 'Per 3 ore';

  @override
  String get dmMuteFor4Hours => 'Per 4 ore';

  @override
  String get dmMuteFor8Hours => 'Per 8 ore';

  @override
  String get dmMuteFor24Hours => 'Per 24 ore';

  @override
  String get dmMuteFor3Days => 'Per 3 giorni';

  @override
  String get dmMuteForever => 'Fino a quando non la riattivo';

  @override
  String get dmPinGroupDm => 'Fissa gruppo DM';

  @override
  String get dmUnpinGroupDm => 'Scollega DM di gruppo';

  @override
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
  }

  @override
  String get dmFavoriteDm => 'Aggiungi DM ai preferiti';

  @override
  String get dmUnfavoriteDm => 'Rimuovi DM dai preferiti';

  @override
  String get dmFavoriteGroupDm => 'Aggiungi DM di gruppo ai preferiti';

  @override
  String get dmUnfavoriteGroupDm => 'Rimuovi DM di gruppo dai preferiti';

  @override
  String get dmChangeFriendNickname => 'Cambia soprannome amico';

  @override
  String get dmRemoveFriend => 'Rimuovi amico';

  @override
  String get dmAddFriend => 'Aggiungi amico';

  @override
  String get dmAcceptFriendRequest => 'Accetta richiesta di amicizia';

  @override
  String get dmIgnoreFriendRequest => 'Ignora richiesta di amicizia';

  @override
  String get dmFriendRequestSent => 'Richiesta di amicizia inviata';

  @override
  String get dmUnblock => 'Sblocca';

  @override
  String get dmDebugUser => 'Debug utente';

  @override
  String get dmDebugChannel => 'Debug canale';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => 'DM collegato';

  @override
  String get dmUnpinned => 'DM scollegato';

  @override
  String get dmMuted => 'DM con notifiche disattivate';

  @override
  String get dmUnmuted => 'DM con notifiche attivate';

  @override
  String get dmRemoveFriendConfirmTitle => 'Rimuovi amico';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Sei sicuro di voler rimuovere $username come amico?';
  }

  @override
  String get dmBlockConfirmTitle => 'Blocca utente';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Sei sicuro di voler bloccare $username? Non potrà inviarti messaggi o richieste di amicizia.';
  }

  @override
  String get dmFriendRequestSentToast => 'Richiesta di amicizia inviata';

  @override
  String get dmFriendRequestFailed =>
      'Impossibile inviare la richiesta di amicizia';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Impossibile accettare la richiesta di amicizia';

  @override
  String get dmRemoveFriendFailed => 'Impossibile rimuovere l\'amico';

  @override
  String get dmBlockFailed => 'Impossibile bloccare l\'utente';

  @override
  String get dmUnblockFailed => 'Impossibile sbloccare l\'utente';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Impossibile ignorare la richiesta di amicizia';

  @override
  String get dmAddFriends => 'Aggiungi amici';

  @override
  String get addFriendSheetTitle => 'Aggiungi amico';

  @override
  String get addFriendUsernameHint => 'Nomeutente#0000';

  @override
  String get addFriendUsernameLabel => 'Nome utente dell\'amico';

  @override
  String get addFriendSendRequest => 'Invia richiesta';

  @override
  String get addFriendNoUserFound =>
      'Nessun utente trovato con quel nome utente.';

  @override
  String get addFriendInvalidUsername =>
      'Inserisci un nome utente valido (Nomeutente#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Richiesta di amicizia inviata';

  @override
  String get addFriendClaimTitle => 'Rivendica il tuo account';

  @override
  String get addFriendClaimDescription =>
      'Rivendica il tuo account per inviare richieste di amicizia.';

  @override
  String get addFriendVerifyTitle => 'Verifica la tua email';

  @override
  String get addFriendVerifyDescription =>
      'Devi verificare il tuo indirizzo email prima di poter inviare richieste di amicizia.';

  @override
  String get addFriendVerifyEmail => 'Verifica email';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Richieste di amicizia in arrivo ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Richieste di amicizia in uscita ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Richiesta di amicizia in arrivo';

  @override
  String get addFriendOutgoingStatus => 'Richiesta di amicizia inviata';

  @override
  String get addFriendViewProfile => 'Visualizza profilo';

  @override
  String get addFriendAccept => 'Accetta';

  @override
  String get addFriendIgnore => 'Ignora';

  @override
  String get addFriendAcceptTitle => 'Accetta richiesta di amicizia';

  @override
  String get addFriendIgnoreTitle => 'Ignora richiesta di amicizia';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Accetti la richiesta di amicizia di $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Ignori la richiesta di amicizia di $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Annulla richiesta';

  @override
  String get addFriendCancelRequestFailed =>
      'Impossibile annullare la richiesta di amicizia. Riprova.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Al momento non accetta richieste di amicizia.';

  @override
  String get addFriendUnblockFirst =>
      'Sbloccalo prima per inviare una richiesta di amicizia.';

  @override
  String get addFriendCannotSendToSelf =>
      'Non puoi inviare una richiesta di amicizia a te stesso.';

  @override
  String get addFriendAlreadyFriends => 'Siete già amici.';

  @override
  String get addFriendClaimToSend =>
      'Completa l\'iscrizione per inviare richieste di amicizia.';

  @override
  String get addFriendSendFailedGeneric =>
      'Impossibile inviare la richiesta di amicizia. Riprova.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Sistema';

  @override
  String get emojiSearchPlaceholder => 'Trova l\'emoji dei tuoi sogni';

  @override
  String get emojiSearchEmpty => 'Nessuna emoji corrisponde alla tua ricerca';

  @override
  String get emojiAutocompleteDefaultLabel => 'Emoji predefinita';

  @override
  String get emojiFrequentlyUsed => 'Usate frequentemente';

  @override
  String get emojiTabGifs => 'GIF';

  @override
  String get emojiTabMedia => 'Media';

  @override
  String get emojiTabStickers => 'Adesivi';

  @override
  String get emojiTabEmojis => 'Emoji';

  @override
  String get gifPickerSearch => 'Cerca GIF';

  @override
  String get gifPickerSearchKlipy => 'Cerca KLIPY';

  @override
  String get gifPickerSearchTenor => 'Cerca Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Preferiti';

  @override
  String get gifPickerTrending => 'GIF di tendenza';

  @override
  String get gifPickerNoResultsTitle => 'Nessun risultato di ricerca';

  @override
  String get gifPickerNoResultsDescription =>
      'Prova un altro termine di ricerca';

  @override
  String get gifPickerLoadFailedTitle => 'Impossibile caricare le GIF';

  @override
  String get gifPickerLoadFailedBody =>
      'Controlla la tua connessione e riprova.';

  @override
  String get emojiCategoryPeople => 'Persone';

  @override
  String get emojiCategoryNature => 'Natura';

  @override
  String get emojiCategoryFood => 'Cibo e bevande';

  @override
  String get emojiCategoryActivity => 'Attività';

  @override
  String get emojiCategoryTravel => 'Viaggi e luoghi';

  @override
  String get emojiCategoryObjects => 'Oggetti';

  @override
  String get emojiCategorySymbols => 'Simboli';

  @override
  String get emojiCategoryFlags => 'Bandiere';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Sblocca $emojiCount da $communityCount con Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Ottieni Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Non mostrarlo più';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count emoji personalizzate',
      one: '1 emoji personalizzata',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count community',
      one: '1 community',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Avviso link esterno';

  @override
  String get externalLinkWarningLeaving => 'Stai per lasciare Fluxer';

  @override
  String get externalLinkWarningDescription =>
      'I link esterni possono essere pericolosi. Fai attenzione.';

  @override
  String get externalLinkWarningDestinationUrl => 'URL di destinazione:';

  @override
  String get externalLinksSectionTitle => 'Link esterni';

  @override
  String get externalLinksSectionDescription =>
      'Configura come vengono gestiti gli avvisi sui link esterni.';

  @override
  String get externalLinkWarningTrustPrefix => 'Fidati sempre di ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — salta questo avviso la prossima volta';

  @override
  String get externalLinkVisitSite => 'Visita il sito';

  @override
  String get externalLinkTrustAllLabel =>
      'Considera attendibili tutti i link esterni';

  @override
  String get externalLinkStripTrackingLabel =>
      'Rimuovi i parametri di tracciamento dagli URL';

  @override
  String get externalLinkStripTrackingDescription =>
      'Rimuovi automaticamente i parametri di tracciamento (come utm_source, fbclid, gclid) dagli URL nei messaggi che invii. Pulisce il link prima che raggiunga chiunque altro.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Considerare attendibili tutti i link esterni?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Questo considererà attendibili tutti i link esterni e salterà l\'avviso per ogni dominio. I tuoi domini attendibili esistenti verranno sostituiti. Questo è meno sicuro.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Considera Attendibili Tutti';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Smettere di considerare attendibili tutti i link?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Gli avvisi sui link esterni verranno nuovamente visualizzati. Dovrai aggiungere i domini attendibili singolarmente.';

  @override
  String get externalLinkStopTrustingAllAction =>
      'Disabilita Considera Attendibili Tutti';

  @override
  String get externalLinkTrustedAllDescription =>
      'Tutti i link esterni sono considerati attendibili. Non verranno visualizzati avvisi.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Hai $count dominio/i attendibile/i. Aggiungine altri selezionando la casella quando visiti link esterni.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Quando abilitato, non verranno visualizzati avvisi sui link esterni. Questo è meno sicuro.';

  @override
  String get imageFileTooLarge =>
      'Il file immagine è troppo grande. Scegli un file più piccolo di 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Gli avatar animati richiedono Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'I banner animati richiedono Plutonium';

  @override
  String get animatedAvifNotSupported => 'AVIF animato non supportato';

  @override
  String get animatedAvifNotSupportedBody =>
      'Il ritaglio e la rotazione dei file AVIF animati non sono ancora supportati. Se procedi, verrà caricato nella sua forma originale.';

  @override
  String get uploadAsIs => 'Carica così com\'è';

  @override
  String get croppingAnimatedNotSupported =>
      'Il ritaglio di immagini animate non è ancora supportato. Verrà utilizzata l\'immagine caricata originale.';

  @override
  String get cropAvatar => 'Ritaglia avatar';

  @override
  String get cropBanner => 'Ritaglia banner';

  @override
  String get skip => 'Salta';

  @override
  String get crop => 'Ritaglia';

  @override
  String get changeYourFluxerTag => 'Cambia il tuo FluxerTag';

  @override
  String get fluxerTagInputLabel => 'FluxerTag';

  @override
  String get fluxerTagDescriptionBase =>
      'I nomi utente possono contenere solo lettere (a-z, A-Z), numeri (0-9) e underscore. I nomi utente non fanno distinzione tra maiuscole e minuscole.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'I nomi utente possono contenere solo lettere (a-z, A-Z), numeri (0-9) e underscore. I nomi utente non fanno distinzione tra maiuscole e minuscole. Puoi scegliere qualsiasi tag di 4 cifre disponibile da #0000 a #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'I nomi utente possono contenere solo lettere (a-z, A-Z), numeri (0-9) e underscore. I nomi utente non fanno distinzione tra maiuscole e minuscole. Puoi scegliere qualsiasi tag di 4 cifre disponibile da #0001 a #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Tra $min e $max caratteri';
  }

  @override
  String get validationAllowedChars =>
      'Solo lettere (a-z, A-Z), numeri (0-9) e underscore (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Ottieni Plutonium per personalizzare il tuo tag o mantenerlo quando cambi nome utente';

  @override
  String get fluxerTagAlreadyTaken => 'FluxerTag già preso';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Il FluxerTag $username#$discriminator è già in uso. Continuando, il tuo discriminatore verrà rigenerato automaticamente.';
  }

  @override
  String get customTagIsTemporary => 'Il tag personalizzato è temporaneo';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Il tuo tag personalizzato di 4 cifre è disponibile solo finché il tuo abbonamento Plutonium è attivo. Alla scadenza del tuo abbonamento il $date, il tuo tag tornerà a un numero assegnato casualmente dopo un periodo di grazia di 3 giorni.';
  }

  @override
  String get customTagTemporaryBody =>
      'Il tuo tag personalizzato di 4 cifre è disponibile solo finché il tuo abbonamento Plutonium è attivo. Alla scadenza del tuo abbonamento, il tuo tag tornerà a un numero assegnato casualmente dopo un periodo di grazia di 3 giorni.';

  @override
  String get iUnderstandContinue => 'Ho capito, continua';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Se salvi questo FluxerTag, il tuo tag personalizzato di 4 cifre tornerà a essere un numero casuale al termine del tuo abbonamento Plutonium. Se il tuo abbonamento non si rinnova, avrai un periodo di grazia di 3 giorni prima che il tag cambi.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Il tuo tag personalizzato di 4 cifre (#$discriminator) è attivo finché il tuo abbonamento Plutonium è attivo. Se il tuo abbonamento termina o non si rinnova dopo un periodo di grazia di 3 giorni, il tuo tag tornerà a essere un numero casuale.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Personalizza il tuo tag di 4 cifre o mantienilo quando cambi nome utente';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'La tua prova di Plutonium scade il $date. Esegui l\'upgrade per mantenere il tuo tag personalizzato e ottenere un badge sul tuo profilo.';
  }

  @override
  String get premiumTrialActive =>
      'Sei in prova con Plutonium. Esegui l\'upgrade per mantenere il tuo tag personalizzato e ottenere un badge sul tuo profilo.';

  @override
  String get fluxerTagUpdated => 'FluxerTag aggiornato';

  @override
  String get fluxerTagUpdateFailed =>
      'Impossibile aggiornare FluxerTag. Riprova.';

  @override
  String get continueAction => 'Continua';

  @override
  String get profileCustomizationTitle => 'Personalizzazione del profilo';

  @override
  String get profileCustomizationDescription =>
      'Modifica l\'aspetto del tuo profilo e visualizza un\'anteprima in tempo reale';

  @override
  String get usernameLabel => 'Nome utente';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Rivendica il tuo account per cambiare il tuo FluxerTag';

  @override
  String get changeFluxerTag => 'Cambia FluxerTag';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Personalizza il tuo tag a 4 cifre (#$discriminator) come preferisci con Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Cambia il tuo nome utente e tag a 4 cifre';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Il tuo tag personalizzato (#$discriminator) è legato al tuo abbonamento Plutonium e tornerà a essere un tag casuale se scade.';
  }

  @override
  String get displayNameLabel => 'Nome visualizzato';

  @override
  String get pronounsLabel => 'Pronomi';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Cambia avatar';

  @override
  String get removeAvatar => 'Rimuovi avatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Max 10MB. Consigliato: 512×512px';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get changeBanner => 'Cambia banner';

  @override
  String get removeBanner => 'Rimuovi banner';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Max 10MB. Minimo: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Colore d\'accento';

  @override
  String get accentColorDescription =>
      'Personalizza il bordo e il colore del banner sul tuo profilo';

  @override
  String get aboutMeLabel => 'Informazioni su di me';

  @override
  String get aboutMeHelperText => 'Puoi usare link, emoji e Markdown.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle => 'Privacy badge Plutonium';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Controlla come viene visualizzato il tuo badge Plutonium agli altri';

  @override
  String get hidePlutoniumBadgeLabel =>
      'Nascondi completamente il badge Plutonium';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Nascondi completamente il tuo badge Plutonium agli altri utenti';

  @override
  String get hidePlutoniumPurchaseDate => 'Nascondi data acquisto Plutonium';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Nascondi data acquisto Plutonium ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Rimuovi dal tuo badge quando hai acquistato Plutonium per la prima volta';

  @override
  String get maskVisionaryAsSubscription =>
      'Maschera Visionary come abbonamento';

  @override
  String get maskVisionaryDescription =>
      'Mostra il tuo Visionary come un abbonamento normale';

  @override
  String get hideVisionaryIdBadge => 'Nascondi badge ID Visionary';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Nascondi badge ID Visionary (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Rimuovi il tuo badge ID Visionary';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Sei in prova Plutonium: il tuo abbonamento inizierà il $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Il tuo abbonamento inizierà automaticamente al termine della prova. Non è richiesta alcuna azione.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Sei in prova Plutonium, che scade il $date';
  }

  @override
  String get premiumTrialActiveProfile => 'Sei in prova Plutonium';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Max 10MB. Consigliato: 512×512px. Avatar animati (GIF) richiedono Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Personalizza il tuo profilo con un\'immagine banner statica o animata per farlo risaltare.';

  @override
  String get getPlutonium => 'Ottieni Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Gli acquisti in-app non sono ancora disponibili su questa piattaforma. Resta sintonizzato: in arrivo!';

  @override
  String get profilePreviewLabel => 'Anteprima';

  @override
  String get profilePreviewMessage => 'Messaggio';

  @override
  String get profilePreviewMemberSince => 'Membro Fluxer dal';

  @override
  String get unclaimedAccountTitle => 'Account non rivendicato';

  @override
  String get unclaimedAccountDescription =>
      'Il tuo account non è ancora stato rivendicato. Senza un\'email e una password, potresti perdere l\'accesso. Rivendica subito il tuo account per metterlo in sicurezza.';

  @override
  String get claimAccount => 'Rivendica account';

  @override
  String get profileTypeLabel => 'Tipo di profilo';

  @override
  String get profileTypeGlobal => 'Profilo globale';

  @override
  String get profileTypeGuildDescription =>
      'Stai modificando il tuo profilo per community. Questo profilo sarà visibile solo in questa community e sovrascriverà il tuo profilo globale.';

  @override
  String get communityNicknameLabel => 'Nickname community';

  @override
  String get perGuildPremiumUpsellText =>
      'La personalizzazione del tuo avatar, banner, colore d\'accento e bio per le singole community richiede Plutonium. Soprannome e pronomi della community sono gratuiti per tutti.';

  @override
  String get avatarModeInherit => 'Usa profilo globale';

  @override
  String get avatarModeCustom => 'Usa immagine personalizzata';

  @override
  String get avatarModeUnset => 'Non mostrare';

  @override
  String get profileSavedToast => 'Profilo aggiornato';

  @override
  String get profileEditButton => 'Modifica profilo';

  @override
  String get profileNoteLabel => 'Nota';

  @override
  String get profileNoteVisibility => '(visibile solo a te)';

  @override
  String get profileNoteEmpty => 'Nessuna nota ancora.';

  @override
  String get sudoTitle => 'Verifica la tua identità';

  @override
  String get sudoDescription =>
      'Questa azione richiede la verifica per continuare.';

  @override
  String get sudoAuthenticatorCode => 'Codice dell\'autenticatore';

  @override
  String get sudoMethodPassword => 'Password';

  @override
  String get sudoMethodTotp => 'Autenticatore';

  @override
  String get sudoVerificationFailed => 'Verifica fallita. Riprova.';

  @override
  String get securityAccountTitle => 'Account';

  @override
  String get securityAccountDescription =>
      'Gestisci la tua email, password e impostazioni dell\'account';

  @override
  String get securitySectionTitle => 'Sicurezza';

  @override
  String get securitySectionDescription =>
      'Proteggi il tuo account con l\'autenticazione a due fattori e le passkey';

  @override
  String get securityLoginEmailSectionTitle => 'Impostazioni email';

  @override
  String get securityLoginEmailSectionDescription =>
      'Gestisci l\'indirizzo email che usi per accedere a Fluxer';

  @override
  String get securityLoginEmailAddressLabel => 'Indirizzo email';

  @override
  String get securityLoginNoEmailSet => 'Nessun indirizzo email impostato';

  @override
  String get securityLoginChangeEmail => 'Cambia email';

  @override
  String get securityLoginAddEmail => 'Aggiungi email';

  @override
  String get securityLoginReveal => 'Mostra';

  @override
  String get securityLoginHide => 'Nascondi';

  @override
  String get securityLoginPasswordSectionTitle => 'Password';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Cambia la tua password per mantenere sicuro il tuo account';

  @override
  String get securityLoginCurrentPasswordLabel => 'Password attuale';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Ultimo cambio: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Ultimo cambio: Mai';

  @override
  String get securityLoginNoPasswordSet => 'Nessuna password impostata';

  @override
  String get securityLoginChangePassword => 'Cambia password';

  @override
  String get securityLoginSetPassword => 'Imposta password';

  @override
  String get passwordChangeTitle => 'Cambia password';

  @override
  String get passwordChangeIntroDescription =>
      'Ti invieremo un codice di verifica al tuo indirizzo email per confermare la tua identità prima di cambiare la password.';

  @override
  String get passwordChangeStart => 'Inizia';

  @override
  String get passwordChangeVerifyTitle => 'Verifica la tua email';

  @override
  String get passwordChangeVerifyDescription =>
      'Inserisci il codice di verifica inviato al tuo indirizzo email.';

  @override
  String get passwordChangeVerificationCode => 'Codice di verifica';

  @override
  String get passwordChangeVerify => 'Verifica';

  @override
  String get passwordChangeNewPasswordTitle => 'Imposta nuova password';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Inserisci la tua nuova password qui sotto.';

  @override
  String get passwordChangeNewPassword => 'Nuova password';

  @override
  String get passwordChangeConfirmPassword => 'Conferma nuova password';

  @override
  String get passwordChangeSubmit => 'Cambia password';

  @override
  String get passwordChangeSuccess => 'Password cambiata';

  @override
  String get passwordChangePasswordsDoNotMatch =>
      'Le password non corrispondono';

  @override
  String get passwordChangeInvalidCode => 'Codice non valido o scaduto';

  @override
  String get emailChangeTitle => 'Cambia email';

  @override
  String get emailChangeIntroDescription =>
      'Invieremo codici di verifica per accertare la tua identità prima di cambiare il tuo indirizzo email.';

  @override
  String get emailChangeStart => 'Inizia';

  @override
  String get emailChangeVerifyOriginalTitle => 'Verifica email attuale';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Inserisci il codice di verifica inviato al tuo indirizzo email attuale.';

  @override
  String get emailChangeNewEmailTitle => 'Inserisci nuova email';

  @override
  String get emailChangeNewEmailDescription =>
      'Inserisci il nuovo indirizzo email che desideri utilizzare.';

  @override
  String get emailChangeNewEmailLabel => 'Nuova email';

  @override
  String get emailChangeNewEmailSubmit => 'Invia codice di verifica';

  @override
  String get emailChangeVerifyNewTitle => 'Verifica nuova email';

  @override
  String get emailChangeVerifyNewDescription =>
      'Inserisci il codice di verifica inviato al tuo nuovo indirizzo email.';

  @override
  String get emailChangeSuccess => 'Email cambiata';

  @override
  String get emailChangeInvalidCode => 'Codice non valido o scaduto';

  @override
  String get resend => 'Reinvia';

  @override
  String resendCountdown(int seconds) {
    return 'Reinvia (${seconds}s)';
  }

  @override
  String get verificationCode => 'Codice di verifica';

  @override
  String get verify => 'Verifica';

  @override
  String get enable => 'Abilita';

  @override
  String get disable => 'Disabilita';

  @override
  String get delete => 'Elimina';

  @override
  String get save => 'Salva';

  @override
  String get securityTfaSectionTitle => 'Autenticazione a due fattori';

  @override
  String get securityTfaSectionDescription =>
      'Aggiungi un ulteriore livello di sicurezza al tuo account';

  @override
  String get securityTfaAuthenticatorApp => 'App di autenticazione';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'L\'autenticazione a due fattori è abilitata';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Usa un\'app di autenticazione per generare codici per l\'autenticazione a due fattori';

  @override
  String get securityTfaBackupCodes => 'Codici di backup';

  @override
  String get securityTfaBackupCodesDescription =>
      'Visualizza e gestisci i tuoi codici di backup per il recupero dell\'account';

  @override
  String get securityTfaViewCodes => 'Visualizza codici';

  @override
  String get securityPasskeysSectionTitle => 'Passkey';

  @override
  String get securityPasskeysSectionDescription =>
      'Usa le passkey per l\'accesso senza password e l\'autenticazione a due fattori';

  @override
  String get securityPasskeysRegistered => 'Passkey registrate';

  @override
  String get securityPasskeysNone => 'Nessuna passkey registrata';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'passkey',
      one: 'passkey',
    );
    return '$count $_temp0 registrate (max 10)';
  }

  @override
  String get securityPasskeysAdd => 'Aggiungi passkey';

  @override
  String securityPasskeysAdded(String date) {
    return 'Aggiunta: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Ultimo utilizzo: $date';
  }

  @override
  String get securityPasskeysRename => 'Rinomina';

  @override
  String get securityPasskeysDeleteTitle => 'Elimina passkey';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Sei sicuro di voler eliminare la passkey \"$name\"?';
  }

  @override
  String get securityPasskeyNameTitle => 'Assegna nome alla passkey';

  @override
  String get securityPasskeyNameLabel => 'Nome passkey';

  @override
  String get securityPasskeyNameHint =>
      'es. YubiKey, iPhone, Computer di lavoro';

  @override
  String get securityPhoneSectionTitle => 'Numero di telefono';

  @override
  String get securityPhoneSectionDescription =>
      'Gestisci il tuo numero di telefono.';

  @override
  String get securityPhoneLabel => 'Numero di telefono';

  @override
  String get securityPhoneNone => 'Nessun numero di telefono aggiunto.';

  @override
  String get securityPhoneAdd => 'Aggiungi telefono';

  @override
  String get securityPhoneRemove => 'Rimuovi';

  @override
  String get securityPhoneRemoveTitle => 'Rimuovi numero di telefono';

  @override
  String get securityPhoneRemoveDescription =>
      'Sei sicuro di voler rimuovere il tuo numero di telefono?';

  @override
  String get securityPhoneRemoved => 'Numero di telefono rimosso';

  @override
  String get securityClaimTitle => 'Funzionalità di sicurezza';

  @override
  String get securityClaimDescription =>
      'Richiedi il tuo account per accedere alle funzionalità di sicurezza come l\'autenticazione a due fattori e le passkey.';

  @override
  String get securityVerifyEmailRequired =>
      'Devi verificare il tuo indirizzo email prima di poter configurare l\'autenticazione a due fattori, le passkey o la verifica SMS.';

  @override
  String get totpEnableTitle => 'Configura app di autenticazione';

  @override
  String get totpEnableDescription =>
      'Scansiona il codice QR con la tua app di autenticazione per generare codici per l\'autenticazione a due fattori.';

  @override
  String get totpEnableCodeLabel => 'Codice';

  @override
  String get totpEnableCodeHint =>
      'Inserisci il codice di 6 cifre dalla tua app di autenticazione';

  @override
  String get totpEnableSuccess => 'Autenticazione a due fattori abilitata';

  @override
  String get totpDisableTitle => 'Rimuovi app di autenticazione';

  @override
  String get totpDisableDescription =>
      'Inserisci il codice di 6 cifre dalla tua app di autenticazione per disabilitare l\'autenticazione a due fattori.';

  @override
  String get totpDisableSuccess => 'Autenticazione a due fattori disabilitata';

  @override
  String get backupCodesTitle => 'Codici di backup';

  @override
  String get backupCodesWarning =>
      'Se perdi l\'accesso alla tua app di autenticazione e non hai questi codici, sarai bloccato permanentemente dal tuo account. Scaricali o copiali ora e conservali in un luogo sicuro.';

  @override
  String get backupCodesDownload => 'Scarica';

  @override
  String get backupCodesCopy => 'Copia';

  @override
  String get backupCodesCopied => 'Codici di backup copiati negli appunti';

  @override
  String get backupCodesAcknowledge =>
      'Ho scaricato o copiato i miei codici di backup e li ho conservati in un luogo sicuro.';

  @override
  String get backupCodesDone => 'Fatto';

  @override
  String get backupCodesViewTitle => 'Visualizza codici di backup';

  @override
  String get backupCodesViewDescription =>
      'Potrebbe essere richiesta la verifica prima di visualizzare i tuoi codici di backup.';

  @override
  String get phoneAddTitle => 'Aggiungi numero di telefono';

  @override
  String get phoneAddLabel => 'Numero di telefono';

  @override
  String get phoneAddHint => 'Inserisci il tuo numero di telefono';

  @override
  String get phoneAddFooter =>
      'Inserisci il tuo numero di telefono. Ti invieremo un codice di verifica via SMS.';

  @override
  String get phoneAddSendCode => 'Invia codice';

  @override
  String get phoneVerifyTitle => 'Verifica numero di telefono';

  @override
  String get phoneVerifyDescription =>
      'Inserisci il codice di verifica inviato al tuo numero di telefono.';

  @override
  String get phoneAddSuccess => 'Numero di telefono aggiunto';

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
  String get dangerZoneSectionTitle => 'Area di pericolo';

  @override
  String get dangerZoneSectionDescription =>
      'Azioni irreversibili e distruttive';

  @override
  String get dangerZoneDisableTitle => 'Disabilita account';

  @override
  String get dangerZoneDisableDescription =>
      'Disabilita temporaneamente il tuo account. Potrai riattivarlo in seguito effettuando nuovamente l\'accesso.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'La disabilitazione del tuo account ti disconnetterà da tutte le sessioni. Potrai riabilitare il tuo account in qualsiasi momento effettuando nuovamente l\'accesso.';

  @override
  String get dangerZoneDeleteTitle => 'Elimina account';

  @override
  String get dangerZoneDeleteDescription =>
      'Elimina permanentemente il tuo account e tutti i dati associati. Questa azione non può essere annullata.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Annulla il tuo abbonamento Plutonium attivo nelle impostazioni di Plutonium prima di eliminare il tuo account.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount =>
      'Impossibile eliminare l\'account';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Non puoi eliminare il tuo account mentre possiedi delle community. Trasferisci prima la proprietà delle seguenti community:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'e altre $count';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Per trasferire la proprietà, vai su $settingsPath e usa l\'opzione di trasferimento della proprietà.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Sei sicuro di voler eliminare il tuo account? Questa azione pianificherà l\'eliminazione permanente del tuo account.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Puoi annullare il processo di eliminazione entro 14 giorni';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Dopo 14 giorni, il tuo account verrà eliminato permanentemente';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Una volta elaborata l\'eliminazione, non potrai recuperare l\'accesso al tuo account';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Non potrai eliminare i messaggi inviati dopo l\'eliminazione del tuo account';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Se desideri esportare i tuoi dati o eliminare prima i tuoi messaggi, visita la sezione Dashboard privacy nelle Impostazioni utente prima di procedere.';

  @override
  String get claimAccountTitle => 'Richiedi il tuo account';

  @override
  String get claimAccountDescription =>
      'Richiedi il tuo account aggiungendo un\'email e una password. Ti invieremo un codice di verifica per confermare la tua email prima di completare.';

  @override
  String get claimAccountEmailLabel => 'Email';

  @override
  String get claimAccountPasswordLabel => 'Password';

  @override
  String get claimAccountSendCode => 'Invia codice';

  @override
  String get claimAccountVerifyDescription =>
      'Inserisci il codice che ti abbiamo inviato via email per verificarla. La tua password verrà impostata una volta confermato il codice.';

  @override
  String get claimAccountSuccess => 'Account rivendicato con successo';

  @override
  String get importantInformation => 'Informazioni importanti:';

  @override
  String get genericError => 'Si è verificato un errore';

  @override
  String get invalidCode => 'Codice non valido';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count anni fa',
      one: '1 anno fa',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mesi fa',
      one: '1 mese fa',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count giorni fa',
      one: '1 giorno fa',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ore fa',
      one: '1 ora fa',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minuti fa',
      one: '1 minuto fa',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'appena adesso';

  @override
  String get authorizedAppsTitle => 'Applicazioni autorizzate';

  @override
  String get authorizedAppsDescription =>
      'Queste applicazioni hanno ottenuto l\'accesso al tuo account Fluxer.';

  @override
  String get authorizedAppsEmptyTitle => 'Nessuna applicazione autorizzata';

  @override
  String get authorizedAppsEmptyDescription =>
      'Non hai autorizzato alcuna applicazione ad accedere al tuo account.';

  @override
  String get authorizedAppsLoadError =>
      'Impossibile caricare le applicazioni autorizzate';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Autorizzato il $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Autorizzazioni concesse';

  @override
  String get authorizedAppsRevoke => 'Revoca';

  @override
  String get authorizedAppsRevokeTitle => 'Revoca accesso applicazione';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Sei sicuro di voler revocare l\'accesso a $appName? Questa applicazione non avrà più accesso al tuo account.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Accedi alle informazioni di base del tuo profilo (nome utente, avatar, ecc.)';

  @override
  String get authorizedAppsScopeEmail => 'Visualizza il tuo indirizzo email';

  @override
  String get authorizedAppsScopeGuilds =>
      'Visualizza le community di cui sei membro';

  @override
  String get authorizedAppsScopeConnections =>
      'Visualizza i tuoi account collegati';

  @override
  String get authorizedAppsScopeBot =>
      'Aggiungi un bot a una community con le autorizzazioni richieste';

  @override
  String get authorizedAppsScopeAdmin => 'Accedi agli endpoint amministrativi';

  @override
  String get privacyPendingDeletionTitle => 'In attesa di eliminazione';

  @override
  String get blockedUsersTitle => 'Utenti bloccati';

  @override
  String get blockedUsersDescription =>
      'Gli utenti bloccati non possono inviarti richieste di amicizia o messaggi diretti.';

  @override
  String get blockedUsersEmptyTitle => 'Nessun utente bloccato';

  @override
  String get blockedUsersEmptyDescription => 'Non hai ancora bloccato nessuno.';

  @override
  String get blockedUsersLoadError =>
      'Impossibile caricare gli utenti bloccati';

  @override
  String get blockedUsersUnblock => 'Sblocca';

  @override
  String get blockedUsersUnblockTitle => 'Sblocca utente';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Sei sicuro di voler sbloccare $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Copia FluxerTag';

  @override
  String get blockedUsersCopyId => 'Copia ID utente';

  @override
  String get userProfileLoadError => 'Impossibile caricare il profilo';

  @override
  String get userProfileRetry => 'Riprova';

  @override
  String get userProfileMessage => 'Messaggio';

  @override
  String get userProfileVoiceCall => 'Chiamata vocale';

  @override
  String get userProfileVideoCall => 'Videochiamata';

  @override
  String get userProfileEditProfile => 'Modifica profilo';

  @override
  String get userProfileStaffBadgeTooltip => 'Staff Fluxer';

  @override
  String get userProfileCtpBadgeTooltip => 'Team della community Fluxer';

  @override
  String get userProfilePartnerBadgeTooltip => 'Partner Fluxer';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Cacciatore di bug di Fluxer';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Plutonio Fluxer';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Abbonato Plutonio Fluxer dal $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Visionario Fluxer';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Visionario Fluxer dal $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'ID Visionario #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Amici in comune ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Community in comune ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Amici in comune';

  @override
  String get userProfileMutualCommunitiesTitle => 'Community in comune';

  @override
  String get userProfileNoMutualFriends => 'Nessun amico in comune trovato.';

  @override
  String get userProfileNoMutualCommunities =>
      'Nessuna community in comune trovata.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Nickname: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Apri DM';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Hai bloccato $username. Non potrai inviare messaggi a meno che tu non lo sblocchi.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Sblocca';

  @override
  String get userProfileOpenDm => 'Apri DM';

  @override
  String get userProfileNoteTitle => 'Nota';

  @override
  String get userProfileNoteVisibility => '(visibile solo a te)';

  @override
  String get userProfileNoteSave => 'Salva';

  @override
  String get userProfileNoteDelete => 'Elimina';

  @override
  String get userProfileNoteEmpty => 'Tocca per aggiungere una nota';

  @override
  String get userProfileMemberSince => 'Membro dal';

  @override
  String get userProfileAboutMe => 'Su di me';

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
  String get userProfileCopyUsername => 'Copia nome utente';

  @override
  String get userProfileCopyUserId => 'Copia ID utente';

  @override
  String get userProfileViewMainProfile => 'Visualizza profilo principale';

  @override
  String get userProfileViewCommunityProfile => 'Visualizza profilo community';

  @override
  String get userProfileBlockUser => 'Blocca utente';

  @override
  String get userProfileUnblockUser => 'Sblocca utente';

  @override
  String get userProfileRemoveFriend => 'Rimuovi amico';

  @override
  String get userProfileBlockConfirmTitle => 'Blocca utente';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Sei sicuro di voler bloccare $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Sblocca utente';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Sei sicuro di voler sbloccare $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Rimuovi amico';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Sei sicuro di voler rimuovere $username come amico?';
  }

  @override
  String get userProfileFailedOpenDm => 'Impossibile aprire DM';

  @override
  String get userProfileFailedSaveNote => 'Impossibile salvare la nota';

  @override
  String get userProfileActionFailed => 'Azione fallita, riprova';

  @override
  String get userProfileChangeNickname => 'Cambia nickname';

  @override
  String get userProfileKick => 'Espelli';

  @override
  String get userProfileBan => 'Banna';

  @override
  String get userProfileTimeout => 'Metti in timeout';

  @override
  String get userProfileRemoveTimeout => 'Rimuovi timeout';

  @override
  String get userProfileTransferOwnership => 'Trasferisci proprietà';

  @override
  String get userProfileReportUser => 'Segnala utente';

  @override
  String get userProfileReportMessage => 'Segnala messaggio';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Espellere $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Sei sicuro di voler espellere $username? Potrà partecipare di nuovo con un nuovo invito.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Rimuovere il timeout?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Rimuovere il timeout consentirà a $username di inviare nuovamente messaggi, reagire e unirsi ai canali vocali.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Trasferire la proprietà?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Trasferire la proprietà di questa community a $username? Questa azione è irreversibile e perderai tutti i privilegi di proprietario.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Banna $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Durata del ban';

  @override
  String get userProfileBanCustomSecondsLabel =>
      'Durata personalizzata (secondi)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Qualsiasi valore da $min a $max secondi';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Elimina cronologia messaggi';

  @override
  String get userProfileBanDeleteNone => 'Non eliminare nulla';

  @override
  String get userProfileBanDelete24h => 'Ultime 24 ore';

  @override
  String get userProfileBanDelete7d => 'Ultimi 7 giorni';

  @override
  String get userProfileBanReasonLabel => 'Motivo (facoltativo)';

  @override
  String get userProfileBanReasonHint => 'Inserisci un motivo per il ban';

  @override
  String get userProfileBanSubmit => 'Banna membro';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Metti in timeout $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Durata del timeout';

  @override
  String get userProfileTimeoutSubmit => 'Metti in timeout membro';

  @override
  String get userProfileNicknameLabel => 'Nickname';

  @override
  String get userProfileNicknameHint => 'Inserisci un nickname';

  @override
  String get userProfileNicknameSave => 'Salva';

  @override
  String userProfileKickSuccess(String username) {
    return '$username espulso';
  }

  @override
  String userProfileBanSuccess(String username) {
    return '$username bannato';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Timeout per $username';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Timeout rimosso per $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Nickname aggiornato';

  @override
  String get userProfileTransferSuccess => 'Proprietà trasferita';

  @override
  String get durationPermanent => 'Permanente';

  @override
  String get duration60Seconds => '60 secondi';

  @override
  String get duration5Minutes => '5 minuti';

  @override
  String get duration10Minutes => '10 minuti';

  @override
  String get duration1Hour => '1 ora';

  @override
  String get duration12Hours => '12 ore';

  @override
  String get duration1Day => '1 giorno';

  @override
  String get duration3Days => '3 giorni';

  @override
  String get duration5Days => '5 giorni';

  @override
  String get duration1Week => '1 settimana';

  @override
  String get duration2Weeks => '2 settimane';

  @override
  String get duration1Month => '1 mese';

  @override
  String get durationCustom => 'Personalizzato…';

  @override
  String get iarReportUserTitle => 'Segnala utente';

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
  String get iarReasonInappropriateProfile => 'Profilo inappropriato';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Il profilo di questo utente contiene contenuti inappropriati';

  @override
  String typingIndicatorOne(String name) {
    return 'Sta scrivendo $name...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return 'Stanno scrivendo $name1 e $name2...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return 'Stanno scrivendo $name1, $name2 e $name3...';
  }

  @override
  String get typingIndicatorMultiple => 'Diverse persone stanno scrivendo...';

  @override
  String get typingIndicatorHandful =>
      'Un gruppo di guerrieri della tastiera si sta radunando...';

  @override
  String get typingIndicatorSymphony =>
      'È in corso una sinfonia di tasti che cliccano...';

  @override
  String get typingIndicatorFiesta =>
      'Qui è in corso una vera e propria festa di scrittura';

  @override
  String get typingIndicatorApocalypse =>
      'Whoa, è un\'apocalisse di digitazione';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Felice di averti qui, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Benvenuto, $username! Sentiti a casa.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Ciao, $username! Felice di averti qui.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Ciao, $username! Partecipa quando sei pronto.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Ehi $username, felice di vederti qui!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Ehi $username! Spero ti piaccia il tuo soggiorno.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Ehi, $username, benvenuto a bordo!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Felice che tu sia arrivato, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Benvenuto, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Benvenuto, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Benvenuto, $username! Siamo felici che tu sia qui.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Benvenuto, $username! Spero ti piaccia il tuo tempo qui.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Benvenuto, $username! La tua prossima conversazione inizia qui.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Benvenuto, $username. Siamo felici di averti qui.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Felice di vederti, $username! Benvenuto.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Ci sei, $username! Felici di averti con noi.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Sei arrivato, $username! Iniziamo.';
  }

  @override
  String get relativeTimeShortNow => 'ora';

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
      other: '${count}g',
      one: '1g',
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
      other: '${count}a',
      one: '1a',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'I miei dispositivi';

  @override
  String get linkedDevicesDescription =>
      'Vedi tutti i dispositivi attualmente connessi al tuo account. Revoca le sessioni che non riconosci.';

  @override
  String get linkedDevicesCurrentDevice => 'Dispositivo attuale';

  @override
  String get linkedDevicesOtherDevices => 'Altri dispositivi';

  @override
  String get linkedDevicesEnterSelection => 'Entra in modalità selezione';

  @override
  String get linkedDevicesExitSelection => 'Esci dalla modalità selezione';

  @override
  String get linkedDevicesSelectAll => 'Seleziona tutto';

  @override
  String get linkedDevicesClearSelection => 'Annulla selezione';

  @override
  String get linkedDevicesRevokeTooltip => 'Revoca dispositivo';

  @override
  String get linkedDevicesSignOutAll =>
      'Disconnetti tutti gli altri dispositivi';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Disconnetti $count dispositivi',
      one: 'Disconnetti 1 dispositivo',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Disconnetti $count dispositivi',
      one: 'Disconnetti 1 dispositivo',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Disconnetti tutti gli altri dispositivi';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Questo disconnetterà i dispositivi selezionati dal tuo account. Dovrai accedere di nuovo su quei dispositivi.',
      one:
          'Questo disconnetterà il dispositivo selezionato dal tuo account. Dovrai accedere di nuovo su quel dispositivo.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Questo disconnetterà i dispositivi selezionati dal tuo account. Dovrai accedere di nuovo su quei dispositivi.';

  @override
  String get linkedDevicesSignOutConfirm => 'Continua';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Dovrai accedere di nuovo su tutti i dispositivi disconnessi';

  @override
  String get linkedDevicesLoadErrorTitle => 'Errore di rete';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Stiamo riscontrando problemi di connessione al continuum spazio-temporale. Controlla la tua connessione e riprova.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dispositivi revocati',
      one: 'Dispositivo revocato',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError => 'Impossibile disconnettere. Riprova.';

  @override
  String get linkedDevicesUnknownOs => 'OS sconosciuto';

  @override
  String get linkedDevicesUnknownPlatform => 'Piattaforma sconosciuta';

  @override
  String slowmodeLabel(String duration) {
    return '$duration modalità lenta';
  }

  @override
  String get slowmodeTooltipActive =>
      'Sei in modalità lenta. Attendi prima di inviare un altro messaggio.';

  @override
  String get slowmodeTooltipImmune =>
      'La modalità lenta è attiva, ma sei immune.';

  @override
  String get channelNoSendPermissionHint =>
      'Non puoi inviare messaggi in questo canale.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Annunci di sistema dallo staff di $productName. Non puoi rispondere qui.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'La messaggistica è temporaneamente sospesa in questa community.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Sei stato escluso. Messaggi, reazioni e voce sono sospesi fino alla scadenza del timeout.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Devi riscattare il tuo account per inviare messaggi in questa community.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Devi verificare la tua email per inviare messaggi in questa community.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Il tuo account è troppo recente per inviare messaggi in questa community.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Non sei membro di questa community da abbastanza tempo per inviare messaggi.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Devi verificare un numero di telefono per inviare messaggi in questa community.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Verifica email';

  @override
  String get channelComposerBarrierVerifyPhone => 'Verifica telefono';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Allegati troppo numerosi (max $max)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'Uno o più file superano il limite di dimensione';

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Questi file sono troppo grandi per essere inviati insieme';

  @override
  String get chatAttachmentDropToUpload => 'Trascina i file per caricarli';

  @override
  String get chatAttachmentDropToSend => 'Trascina i file per inviarli ora';

  @override
  String get chatAttachmentSendVoiceMessage => 'Invia messaggio vocale';

  @override
  String get voiceMessageTitle => 'Messaggio vocale';

  @override
  String get voiceMessageHoldHint =>
      'Tieni premuto per registrare. Trascina verso l\'alto per bloccare, o rilascia per inviare.';

  @override
  String get voiceMessageDiscard => 'Elimina messaggio vocale';

  @override
  String get voiceMessageSend => 'Invia messaggio vocale';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Impossibile avviare la registrazione. Consenti l\'accesso al microfono.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'La registrazione vocale non è supportata su questo dispositivo.';

  @override
  String get voiceMessageMicInUse =>
      'Lascia la chiamata vocale per registrare un messaggio vocale.';

  @override
  String get voiceMessageRecordingFailed => 'Registrazione fallita. Riprova.';

  @override
  String get voiceMessageSendFailed =>
      'Impossibile inviare il messaggio vocale. Riprova.';

  @override
  String get voiceMessageRecordingHint =>
      'Parla ora. Premi Stop quando hai finito — potrai tagliare in seguito.';

  @override
  String get voiceMessageReviewHint =>
      'Trascina le maniglie per tagliare, quindi premi Invia.';

  @override
  String get voiceMessageStop => 'Stop';

  @override
  String get voiceMessageStartRecording => 'Avvia registrazione';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Riproduci';

  @override
  String get voiceMessagePause => 'Pausa';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'La selezione deve essere di almeno ${secondsString}s.';
  }

  @override
  String get chatAttachmentEditTitle => 'Modifica allegato';

  @override
  String get chatAttachmentFilenameLabel => 'Nome file';

  @override
  String get chatAttachmentDescriptionLabel => 'Descrizione';

  @override
  String get chatAttachmentDescriptionHint => 'Testo alternativo opzionale';

  @override
  String get chatAttachmentSpoilerLabel => 'Segna come spoiler';

  @override
  String get chatAttachmentRemove => 'Rimuovi allegato';

  @override
  String get chatAttachmentDownload => 'Scarica';

  @override
  String get chatAttachmentExpiredTooltip => 'Allegato scaduto';

  @override
  String get chatAttachmentSourceGallery => 'Galleria';

  @override
  String get chatAttachmentSourceCamera => 'Fotocamera';

  @override
  String get chatAttachmentSourceBrowse => 'Sfoglia file';

  @override
  String get chatAttachmentPasteTooltip => 'Incolla immagine dagli appunti';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Mostra spoiler';

  @override
  String get matureMediaRevealButton => 'Mostra';

  @override
  String get matureMediaRevealHint => 'Clicca per mostrare';

  @override
  String get matureContentTitle => 'Contenuto per adulti';

  @override
  String get matureCommunityTitle => 'Community per adulti';

  @override
  String get matureCategoryTitle => 'Categoria per adulti';

  @override
  String get matureChannelTitle => 'Canale per adulti';

  @override
  String get communityContentWarningTitle => 'Avviso contenuti community';

  @override
  String get categoryContentWarningTitle => 'Avviso contenuti categoria';

  @override
  String get channelContentWarningTitle => 'Avviso contenuti canale';

  @override
  String get defaultContentWarningBody =>
      'Questo contiene contenuti sensibili.';

  @override
  String get matureCommunityBody =>
      'Questa community è contrassegnata per contenuti per adulti e potrebbe contenere materiale inappropriato per alcuni utenti.';

  @override
  String get matureCategoryBody =>
      'Questa categoria è contrassegnata per contenuti per adulti e potrebbe contenere materiale inappropriato per alcuni utenti.';

  @override
  String get matureChannelBody =>
      'Questo canale è contrassegnato per contenuti per adulti e potrebbe contenere materiale inappropriato per alcuni utenti.';

  @override
  String get matureVoiceChannelBody =>
      'Questo canale vocale è contrassegnato per contenuti per adulti e potrebbe contenere materiale inappropriato per alcuni utenti.';

  @override
  String get matureLinkChannelBody =>
      'Questo canale link è contrassegnato per contenuti per adulti e potrebbe aprire materiale inappropriato per alcuni utenti.';

  @override
  String get matureCommunityUnavailableBody =>
      'Questa community per adulti non è disponibile per il tuo account.';

  @override
  String get matureCategoryUnavailableBody =>
      'Questa categoria per adulti non è disponibile per il tuo account.';

  @override
  String get matureChannelUnavailableBody =>
      'Questo canale per adulti non è disponibile per il tuo account.';

  @override
  String get matureContentProceedButton => 'Procedi';

  @override
  String get matureContentUnderstandButton => 'Ho capito';

  @override
  String get matureContentOpenLinkButton => 'Apri link';

  @override
  String get sensitiveContentSectionTitle => 'Contenuti sensibili';

  @override
  String get sensitiveContentSectionDescription =>
      'Controlla come i media per adulti o sensibili vengono filtrati in contesti diversi';

  @override
  String get sensitiveContentFriendDmLabel => 'Messaggi diretti dagli amici';

  @override
  String get sensitiveContentNonFriendDmLabel => 'Messaggi diretti da altri';

  @override
  String get sensitiveContentGuildLabel =>
      'Messaggi nei canali della community';

  @override
  String get sensitiveContentFilterShow => 'Mostra';

  @override
  String get sensitiveContentFilterBlur => 'Sfoca';

  @override
  String get sensitiveContentFilterBlock => 'Blocca';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Sfoca i media fino al completamento della scansione di sicurezza';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Quando abilitato, immagini e video vengono sfocati fino al completamento della scansione di sicurezza dei contenuti.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Questa impostazione è sempre attiva per il tuo account.';

  @override
  String get sensitiveContentResetButton => 'Ripristina';

  @override
  String get sensitiveContentSaveButton => 'Salva';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count file',
      one: '1 file',
    );
    return 'Caricamento di $_temp0';
  }

  @override
  String get chatCancelUpload => 'Annulla caricamento';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Scade il $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Scade tra il $start e il $end';
  }

  @override
  String get connectionsTitle => 'Connessioni';

  @override
  String get connectionsDescription =>
      'Collega account esterni e domini al tuo profilo Fluxer. Le connessioni verificate verranno visualizzate sul tuo profilo.';

  @override
  String get connectionsEmptyTitle => 'Nessuna connessione ancora';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Collega il tuo account Bluesky o verifica la proprietà del dominio per visualizzarli sul tuo profilo.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Verifica la proprietà del dominio per visualizzarla sul tuo profilo.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Dominio';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Aggiungi connessione Bluesky';

  @override
  String get connectionsAddDomainAriaLabel => 'Aggiungi connessione dominio';

  @override
  String get connectionEdit => 'Modifica';

  @override
  String get connectionRemove => 'Rimuovi';

  @override
  String get connectionVerifiedLabel =>
      'Questa connessione è stata verificata.';

  @override
  String get connectionUnverifiedLabel =>
      'Questa connessione non è stata verificata.';

  @override
  String get connectionAddTitle => 'Aggiungi connessione';

  @override
  String get connectionTypeLabel => 'Tipo di connessione';

  @override
  String get connectionHandleLabel => 'Handle';

  @override
  String get connectionDomainLabel => 'Dominio';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Hai già questa connessione.';

  @override
  String get connectionConnectBluesky => 'Connettiti con Bluesky';

  @override
  String get connectionContinue => 'Continua';

  @override
  String get connectionVerifyTitle => 'Verifica connessione';

  @override
  String get connectionVerifyInstructions =>
      'Usa il record qui sotto per dimostrare la proprietà del dominio.';

  @override
  String get connectionDnsRecordTitle => 'Record TXT DNS';

  @override
  String get connectionDnsHostLabel => 'Host';

  @override
  String get connectionDnsValueLabel => 'Valore';

  @override
  String get connectionCopyHost => 'Copia host';

  @override
  String get connectionCopyValue => 'Copia valore';

  @override
  String get connectionCopied => 'Copiato!';

  @override
  String get connectionTokenFileTitle => 'Servi il file del token';

  @override
  String get connectionTokenFileDescription =>
      'Scarica **fluxer-verification** e inseriscilo nella tua cartella **.well-known** in modo che possiamo convalidare il dominio.';

  @override
  String get connectionTokenFileDownload => 'Scarica fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Il file contiene il token di verifica che recupereremo da **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Salva fluxer-verification';

  @override
  String get connectionVerifyButton => 'Verifica';

  @override
  String get connectionBack => 'Indietro';

  @override
  String get connectionEditTitle => 'Modifica connessione';

  @override
  String get connectionEditDescription =>
      'Scegli chi può vedere questa connessione sul tuo profilo.';

  @override
  String get connectionVisibilityEveryone => 'Tutti';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Permetti a chiunque di vedere questa connessione sul tuo profilo';

  @override
  String get connectionVisibilityFriends => 'Amici';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Permetti ai tuoi amici di vedere questa connessione';

  @override
  String get connectionVisibilityCommunityMembers => 'Membri della community';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Permetti ai membri delle community a cui appartieni di vedere questa connessione';

  @override
  String get connectionRemoveTitle => 'Rimuovi connessione';

  @override
  String get connectionRemoveDescription =>
      'Sei sicuro di voler rimuovere questa connessione? Questa azione non può essere annullata.';

  @override
  String get connectionRemoveConfirm => 'Rimuovi';

  @override
  String get connectionsLoadError => 'Impossibile caricare le connessioni';

  @override
  String get connectionsReorderError => 'Impossibile aggiornare l\'ordine';

  @override
  String get connectionInitiateFailed =>
      'Impossibile avviare la verifica. Riprova.';

  @override
  String get connectionVerifyFailed =>
      'Impossibile verificare. Controlla il tuo record DNS e riprova.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Impossibile avviare l\'autorizzazione Bluesky.';

  @override
  String get connectionUpdateFailed => 'Impossibile aggiornare la connessione';

  @override
  String get connectionRemoveFailed => 'Impossibile rimuovere la connessione';

  @override
  String get connectionTokenSavedToast => 'Salvato fluxer-verification';

  @override
  String get connectionTokenSaveFailedToast => 'Impossibile salvare il file';

  @override
  String get connectionEnterHandle => 'Inserisci un handle Bluesky.';

  @override
  String get connectionEnterDomain => 'Inserisci un dominio.';

  @override
  String get lookAndFeelTitle => 'Aspetto';

  @override
  String get lookAndFeelThemeSectionTitle => 'Tema';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Scegli tra aspetto scuro, carbone o chiaro.';

  @override
  String get lookAndFeelThemeDark => 'Tema scuro';

  @override
  String get lookAndFeelThemeCoal => 'Tema carbone';

  @override
  String get lookAndFeelThemeLight => 'Tema chiaro';

  @override
  String get lookAndFeelThemeSystem => 'Tema di sistema';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Sincronizza tema su più dispositivi';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Quando abilitata, le modifiche al tema verranno sincronizzate su tutti i tuoi dispositivi. Quando disabilitata, questo dispositivo utilizzerà la propria impostazione del tema.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Il tema di sistema disabilita automaticamente la sincronizzazione per monitorare le preferenze del tuo sistema su questo dispositivo.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Impossibile sincronizzare il tema con il tuo account. Riprova.';

  @override
  String get lookAndFeelChatFontScalingTitle =>
      'Ridimensionamento carattere chat';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Regola la dimensione del carattere nell\'area della chat.';

  @override
  String get lookAndFeelInterfaceTitle => 'Interfaccia';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Personalizza elementi e comportamenti dell\'interfaccia.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Indicatori di digitazione nell\'elenco canali';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Scegli come appaiono gli indicatori di digitazione nell\'elenco canali quando qualcuno sta digitando in un canale.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Indicatore di digitazione + Avatar';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Mostra l\'indicatore di digitazione con gli avatar degli utenti nell\'elenco canali';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Solo indicatore di digitazione';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Mostra solo l\'indicatore di digitazione senza avatar';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Nascosto';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Non mostrare indicatori di digitazione nell\'elenco canali';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Mostra digitazione sul canale selezionato';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Quando disabilitato (predefinito), gli indicatori di digitazione non appariranno sul canale che stai visualizzando.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'generale';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Suggerimenti tastiera';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Controlla se i suggerimenti delle scorciatoie da tastiera appaiono nei tooltip.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Nascondi suggerimenti tastiera nei tooltip';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Quando abilitato, i badge delle scorciatoie vengono nascosti nei popup dei tooltip.';

  @override
  String get lookAndFeelNekoTitle => 'Varie';

  @override
  String get lookAndFeelNekoDescription => 'Opzioni varie dell\'interfaccia.';

  @override
  String get lookAndFeelShowNekoLabel => 'Mostra Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Quando abilitato, Neko appare vicino alla barra di input della chat.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Comportamento di accesso ai canali vocali';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Controlla come accedi ai canali vocali nelle community.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Richiedi doppio clic per accedere ai canali vocali';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Quando abilitato, dovrai fare doppio clic sui canali vocali per accedervi. Quando disabilitato (predefinito), un singolo clic accederà immediatamente al canale.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Il veloce lupo marrone salta sul pigro cane.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Barra laterale community';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Configura come la barra laterale della community visualizza i messaggi diretti.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count community non sono temporaneamente disponibili a causa di un malfunzionamento del condensatore di flusso.',
      one:
          '1 community non è temporaneamente disponibile a causa di un malfunzionamento del condensatore di flusso.',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel => 'Comprimi DM in cartella';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'Quando abilitato, i DM non letti nella barra laterale della community vengono compressi in una cartella sul pulsante Fluxer. Fai clic sul pulsante Fluxer mentre sei nella pagina DM per espandere o comprimere la cartella.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Elenco canali';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Controlla il comportamento dell\'indicatore di non letti per i canali con notifiche disattivate negli elenchi canali.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Mostra indicatore non letti sui canali con notifiche disattivate';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Quando abilitato, i canali con notifiche disattivate mostrano un indicatore di non letti sbiadito sul lato sinistro. Le menzioni appaiono comunque indipendentemente da questa impostazione.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Attivi ora';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Controlla come Attivi ora viene visualizzato nell\'app.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Mostra Attivi ora nella schermata principale';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Mostra Attivi ora nella schermata principale per visualizzare gli amici attivi in voce. Vedrai un\'anteprima, il contesto del canale, chi è già presente e un modo rapido per unirti.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Preferiti';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Controlla la visibilità dei preferiti in tutta l\'app.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Abilita Preferiti';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Quando abilitato, puoi aggiungere canali ai preferiti e appariranno nella sezione Preferiti. Quando disabilitato, tutti gli elementi dell\'interfaccia relativi ai preferiti (pulsanti, voci di menu) saranno nascosti. I tuoi preferiti esistenti verranno conservati.';

  @override
  String get favoritesTitle => 'Preferiti';

  @override
  String get favoritesEmptyTitle => 'Nessun preferito ancora';

  @override
  String get favoritesEmptyDescription =>
      'Aggiungi canali ai preferiti dalla barra del titolo per tenerli qui.';

  @override
  String get favoritesWelcomeTitle => 'Benvenuto nei preferiti';

  @override
  String get favoritesWelcomeDescription =>
      'Il tuo spazio personale per accedere rapidamente ai canali, ai DM e ai gruppi che ami. Premi la stella su qualsiasi canale per aggiungerlo qui.';

  @override
  String get favoritesWelcomeTip =>
      'Non fa per te? Disattivalo in qualsiasi momento.';

  @override
  String get favoritesDisableButton => 'Disattiva preferiti';

  @override
  String get favoritesAddedToast => 'Aggiunto ai preferiti';

  @override
  String get favoritesRemovedToast => 'Rimosso dai preferiti';

  @override
  String get favoritesHiddenToast => 'Preferiti nascosti';

  @override
  String get favoritesMute => 'Silenzia preferiti';

  @override
  String get favoritesUnmute => 'Riattiva audio preferiti';

  @override
  String get favoritesHeaderMenu => 'Menu preferiti';

  @override
  String get favoritesCreateCategory => 'Crea categoria';

  @override
  String get favoritesCategoryNameLabel => 'Nome categoria';

  @override
  String get favoritesHideMutedChannels =>
      'Nascondi canali con audio disattivato';

  @override
  String get favoritesShowMutedChannels =>
      'Mostra canali con audio disattivato';

  @override
  String get favoritesSetNickname => 'Imposta nickname';

  @override
  String get favoritesNicknameLabel => 'Nickname';

  @override
  String get favoritesSaveNickname => 'Salva nickname';

  @override
  String get favoritesMoveToCategory => 'Sposta nella categoria';

  @override
  String get favoritesUncategorized => 'Senza categoria';

  @override
  String get favoritesOtherCategory => 'Altro';

  @override
  String get favoritesRemoveFromFavorites => 'Rimuovi dai preferiti';

  @override
  String get favoritesAddToFavorites => 'Aggiungi ai preferiti';

  @override
  String get favoritesHideConfirmTitle => 'Nascondi preferiti';

  @override
  String get favoritesHideConfirmDescription =>
      'Questo nasconderà tutti gli elementi dell\'interfaccia utente relativi ai preferiti, inclusi pulsanti e voci di menu. I tuoi preferiti esistenti verranno conservati e potranno essere riattivati in qualsiasi momento da Impostazioni > Avanzate > Aspetto.';

  @override
  String get favoritesDirectMessageSubtitle => 'Messaggio diretto';

  @override
  String get messagesMediaDisplayGroupTitle => 'Visualizzazione';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Controlla come vengono visualizzati messaggi, media e altri contenuti.';

  @override
  String get messagesMediaMediaGroupTitle => 'Media';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Personalizza le preferenze sulle dimensioni dei media e i pulsanti.';

  @override
  String get messagesMediaInputGroupTitle => 'Input';

  @override
  String get messagesMediaInputGroupDescription =>
      'Personalizza le impostazioni di input dei messaggi.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Barra laterale';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Configura come viene visualizzata la barra laterale della community.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Nascondi canali con audio disattivato per impostazione predefinita';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Nascondi automaticamente i canali con audio disattivato nella barra laterale quando ti unisci a nuove community';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Nascondere i canali con audio disattivato per impostazione predefinita?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Le nuove community a cui ti unirai avranno automaticamente i canali con audio disattivato nascosti. Desideri applicare questa impostazione anche a tutte le tue community esistenti?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Smettere di nascondere i canali con audio disattivato per impostazione predefinita?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Le nuove community a cui ti unirai non avranno più i canali con audio disattivato nascosti automaticamente. Desideri anche mostrare i canali con audio disattivato in tutte le tue community esistenti?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Applica a tutte le community';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Mostra in tutte le community';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Solo nuove community';

  @override
  String get messagesMediaDisplaySectionTitle => 'Visualizzazione media';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Controlla come vengono visualizzati immagini, video e altri media. Tutti i media vengono ridimensionati e convertiti. File estremamente grandi che non possono essere compressi in un\'anteprima non verranno incorporati indipendentemente da queste impostazioni.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Quando pubblicati come link nella chat';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'Quando caricati direttamente su Fluxer';

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Anteprime link';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Controlla come vengono visualizzate le anteprime dei link ai siti web nella chat';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Mostra anteprime e incorporamenti dei link ai siti web';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reazioni';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Configura le reazioni emoji ai messaggi';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Mostra reazioni emoji ai messaggi';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Contenuto spoiler';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Controlla come viene visualizzato il contenuto spoiler';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Mostra contenuto spoiler';

  @override
  String get messagesMediaSpoilersOnClickName => 'Al clic';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Mostra il contenuto spoiler quando viene cliccato';

  @override
  String get messagesMediaSpoilersIfModeratorName => 'Nei canali che modero';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Mostra sempre il contenuto spoiler nei canali in cui hai il permesso \"Gestisci messaggi\"';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Sempre';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Mostra sempre il contenuto spoiler';

  @override
  String get messagesMediaSizeSectionTitle => 'Preferenze dimensioni media';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Personalizza la dimensione massima di visualizzazione per i media incorporati e allegati. Dimensioni più piccole utilizzano meno spazio sullo schermo, mentre dimensioni più grandi mostrano più dettagli.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Media da link (embed)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Allegati caricati';

  @override
  String get messagesMediaSizeCompactName => 'Compatto (400x300)';

  @override
  String get messagesMediaSizeCompactDescription =>
      'Dimensioni media più piccole';

  @override
  String get messagesMediaSizeComfortableName => 'Comodo (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Dimensioni media più grandi con maggiori dettagli';

  @override
  String get messagesMediaGifsSectionTitle => 'Comportamento GIF';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Controlla come le GIF vengono inserite nella chat';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Invia automaticamente le GIF quando selezionate';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Completamento automatico espressioni (completamento automatico con due punti)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Controlla cosa appare nel completamento automatico delle espressioni quando digiti i due punti. Personalizza quali suggerimenti vengono visualizzati per adattarli alle tue preferenze.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Mostra emoji predefinite nel completamento automatico espressioni';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Mostra emoji personalizzate nel completamento automatico espressioni';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Mostra sticker nel completamento automatico espressioni';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Mostra media salvati nel completamento automatico espressioni';

  @override
  String get messagesMediaEditingSectionTitle => 'Modifica messaggi';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Controlla cosa succede alla bozza di modifica quando annulli.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Conserva la bozza di modifica in caso di annullamento';

  @override
  String get accessibilitySaturationTitle => 'Saturation';

  @override
  String get accessibilitySaturationDescription =>
      'Adjust how vivid theme colors appear across the app.';

  @override
  String get accessibilityUnreadGroupTitle => 'Indicatori non letti';

  @override
  String get accessibilityUnreadGroupDescription =>
      'Controlla come vengono visualizzati gli indicatori di messaggi non letti.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'Mostra indicatore non letto sbiadito nei canali con notifiche disattivate';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'Visualizza un indicatore non letto attenuato accanto ai messaggi diretti e ai canali con notifiche disattivate, in modo da poter comunque vedere a colpo d\'occhio quando c\'è attività.';

  @override
  String get accessibilityDmMessagePreviewGroupTitle => 'Anteprime messaggi DM';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Controlla quando vengono visualizzate le anteprime dei messaggi nell\'elenco DM.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Modalità anteprima messaggi DM';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Tutti i messaggi';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Mostra anteprime dei messaggi per tutte le conversazioni DM';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName => 'Solo DM non letti';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Mostra anteprime dei messaggi solo per i DM con messaggi non letti';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Nessuna';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Non mostrare anteprime dei messaggi nell\'elenco DM';

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
  String get dmListSentAnAttachment => 'Ha inviato un allegato';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username ha fissato un messaggio in questo canale.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username ha aggiunto $userName al gruppo.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username ha aggiunto qualcuno al gruppo.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username ha lasciato il gruppo.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username ha rimosso $userName dal gruppo.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username ha rimosso qualcuno dal gruppo.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username ha rinominato il canale in $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username ha rinominato il canale.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username ha modificato l\'icona del canale.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username ha avviato una chiamata.';
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
  String get voiceConnectionConfirmTitle => 'Conferma connessione vocale';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Sei già connesso a questo canale vocale da $count altri dispositivi. Cosa desideri fare?',
      one:
          'Sei già connesso a questo canale vocale da 1 altro dispositivo. Cosa desideri fare?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Passa a questo dispositivo';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Unisciti soltanto (mantieni le altre connessioni)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Non fare nulla, non voglio unirmi';

  @override
  String get voiceJoinFailedTitle => 'Couldn\'t Join Voice';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Couldn\'t disconnect your other devices. Try again in a moment.';

  @override
  String get voiceChannelEmptyDescription =>
      'Questo è un canale vocale. Connettiti per iniziare a parlare!';

  @override
  String get voiceChannelJoin => 'Unisciti al canale vocale';

  @override
  String get voiceChannelJoinConnect => 'Connettiti alla voce';

  @override
  String get voiceChannelNoConnectPermission =>
      'Non hai il permesso di unirti a questo canale vocale';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Microfono, videocamera e contenuti della condivisione schermo sono crittografati end-to-end.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Microfono, videocamera e contenuti della condivisione schermo sono crittografati end-to-end.';

  @override
  String get voiceChannelE2eeBroken =>
      'La crittografia end-to-end non è disponibile perché un partecipante non supportato è in questo canale vocale.';

  @override
  String get voiceCallE2eeBroken =>
      'La crittografia end-to-end non è disponibile perché un partecipante non supportato è in questa chiamata.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Questo client deve essere aggiornato prima di unirsi a questa chiamata crittografata.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Impossibile avviare il microfono. Sei ancora in chiamata.';

  @override
  String get voiceChannelStatusConnecting => 'Connessione in corso...';

  @override
  String get voiceChannelStatusConnected => 'Connesso';

  @override
  String get voiceChannelStatusError => 'Errore';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Dispositivo mobile';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Dispositivo desktop';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Muto dalla community';

  @override
  String get voiceParticipantTooltipMuted => 'Muto';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Silenziato dalla community';

  @override
  String get voiceParticipantTooltipDeafened => 'Silenziato';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Connessione: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count partecipanti',
      one: '1 partecipante',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Esci';

  @override
  String get voiceControlMute => 'Muto';

  @override
  String get voiceControlUnmute => 'Riattiva audio';

  @override
  String get voiceControlDeafen => 'Silenziamento';

  @override
  String get voiceControlUndeafen => 'Annulla silenziamento';

  @override
  String get voiceControlVideo => 'Video';

  @override
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'Condivisione schermo';

  @override
  String get voiceScreenShareNotificationText => 'Condivisione dello schermo.';

  @override
  String get voiceControlMore => 'Altro';

  @override
  String get voiceControlDisconnect => 'Disconnetti';

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
  String get voiceTextChatShow => 'Mostra chat';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# messaggi non letti',
      one: '1 messaggio non letto',
    );
    return 'Mostra chat con $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Il permesso della videocamera è necessario per il video.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Impossibile avviare la condivisione schermo. Riprova.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Il permesso di condivisione schermo è stato negato.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'La condivisione schermo non è disponibile su questo dispositivo.';

  @override
  String get voiceWatchStream => 'Guarda lo stream';

  @override
  String get voiceStopWatching => 'Smetti di guardare';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Smetti di guardare lo stream corrente';

  @override
  String get voiceOwnScreenShareTitle => 'Stai trasmettendo';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Il tuo stream è in diretta per i partecipanti.';

  @override
  String get voiceLiveBadge => 'LIVE';

  @override
  String get dmVoiceViewCall => 'Visualizza chiamata';

  @override
  String get dmVoiceCallFullScreen => 'Schermo intero';

  @override
  String get dmVoiceCallFullScreenTooltip =>
      'Apri la chiamata a schermo intero';

  @override
  String get dmVoiceStripStatusConnecting => 'Connessione in corso...';

  @override
  String get dmVoiceStripStatusInCall => 'In chiamata';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Chiamata vocale';

  @override
  String get dmVoiceCallBarConnecting => 'Connessione in corso...';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Chiamata diretta';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Chiamata di gruppo';

  @override
  String get dmVoiceCallBarIssueFallback => 'Problema vocale';

  @override
  String get dmVoiceFullscreenTitle => 'Voce';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Voce connessa';

  @override
  String get notificationsPageTitle => 'Notifiche';

  @override
  String get notificationsFilterUnreads => 'Non lette';

  @override
  String get notificationsFilterMentions => 'Menzioni';

  @override
  String get notificationsBookmarksTooltip => 'Segnalibri';

  @override
  String get notificationsMentionFilterTooltip => 'Filtra menzioni';

  @override
  String get notificationsMentionFiltersTitle => 'Filtri menzioni';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Includi menzioni @everyone e @here';

  @override
  String get notificationsMentionIncludeRoles => 'Includi menzioni di ruolo';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Includi tutte le menzioni della community';

  @override
  String get notificationsNoUnreadTitle => 'Nessun messaggio non letto';

  @override
  String get notificationsNoUnreadBody => 'Hai recuperato tutto.';

  @override
  String get notificationsNoMentionsTitle => 'Nessuna menzione recente';

  @override
  String get notificationsNoMentionsBody =>
      'Tutte le @menzioni a tuo nome appariranno qui per 7 giorni.';

  @override
  String get notificationsMentionsEndTitle => 'Hai raggiunto la fine';

  @override
  String get notificationsMentionsEndBody =>
      'Hai visto tutte le tue menzioni recenti. Non preoccuparti, altre appariranno presto qui.';

  @override
  String get notificationsJump => 'Vai';

  @override
  String get notificationsRemoveMentionTooltip => 'Rimuovi menzione';

  @override
  String get notificationsViewAllUnread => 'Visualizza tutte le non lette';

  @override
  String get notificationsMarkAsRead => 'Segna come letto';

  @override
  String get notificationsExpand => 'Espandi';

  @override
  String get notificationsCollapse => 'Comprimi';

  @override
  String get notificationsMessageUnavailable =>
      'Impossibile caricare questo messaggio.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining caratteri rimasti';
  }

  @override
  String get characterCounterTooLong => 'Il messaggio è troppo lungo';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining caratteri rimasti. Ottieni $productName per scrivere fino a $premiumMaxLength caratteri.';
  }

  @override
  String get chatMessageFailedToSend => 'Invio messaggio fallito';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Il tuo messaggio non è stato recapitato. Di solito ciò accade perché non condividi una community con il destinatario o il destinatario accetta messaggi diretti solo dagli amici. Potrebbe anche essere necessario regolare le tue impostazioni sulla privacy dei messaggi diretti in $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Il tuo messaggio non è stato recapitato. Devi rivendicare il tuo account per inviare messaggi diretti.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Il tuo messaggio non è stato recapitato. Devi rivendicare il tuo account per inviare messaggi.';

  @override
  String get chatSendFailureContentBlocked =>
      'Il tuo messaggio non è stato recapitato perché è stato segnalato dai nostri sistemi di sicurezza. Se ritieni che si tratti di un errore, contatta il supporto.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Il tuo messaggio non è stato recapitato perché contiene emoji o sticker per adulti non consentiti in questo contesto.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'Solo tu puoi vedere questo messaggio.';

  @override
  String get chatClientSystemDismiss => 'Ignora';

  @override
  String get privacyDashboardCommunicationSection => 'Comunicazione';

  @override
  String get chatMessageDeleteFailed => 'Eliminazione messaggio fallita';

  @override
  String get chatMessageAddReaction => 'Aggiungi reazione';

  @override
  String get chatMessageEdit => 'Modifica messaggio';

  @override
  String get chatMessageReply => 'Rispondi';

  @override
  String get chatMessageForward => 'Inoltra';

  @override
  String get forwardMessageTitle => 'Inoltra messaggio';

  @override
  String get forwardSearchHint => 'Cerca canali o DM';

  @override
  String get forwardDirectMessagesSection => 'Messaggi diretti';

  @override
  String get forwardCommentHint => 'Aggiungi un commento (facoltativo)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Invia ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Nessun canale trovato';

  @override
  String get forwardSuccessToast => 'Messaggio inoltrato';

  @override
  String get forwardFailed => 'Impossibile inoltrare il messaggio';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'I commenti non sono disponibili perché un canale selezionato ha la modalità lenta attiva.';

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
      'Non puoi inviare messaggi qui';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Non puoi incorporare link qui';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Non puoi allegare file qui';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'L\'invio di messaggi è disabilitato in questa community';

  @override
  String get forwardDestinationTimedOut => 'Sei in timeout in questa community';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Modalità lenta - attendi $remaining';
  }

  @override
  String get chatMessageCopyText => 'Copia messaggio';

  @override
  String get chatMessagePin => 'Fissa messaggio';

  @override
  String get chatMessageUnpin => 'Rimuovi fissaggio messaggio';

  @override
  String get chatMessageUnpinIt => 'Rimuovi fissaggio';

  @override
  String get chatMessageBookmark => 'Aggiungi segnalibro al messaggio';

  @override
  String get chatMessageRemoveBookmark => 'Rimuovi segnalibro';

  @override
  String get chatMessageMarkAsUnread => 'Segna come non letto';

  @override
  String get chatMessageCopyMessageLink => 'Copia link messaggio';

  @override
  String get chatMessageCopyMessageId => 'Copia ID messaggio';

  @override
  String get chatMessageViewReactions => 'Visualizza reazioni';

  @override
  String get chatMessageRemoveAllReactions => 'Rimuovi tutte le reazioni';

  @override
  String get chatMessageDebug => 'Debug messaggio';

  @override
  String get chatMessageDebugSheetTitle => 'Debug messaggio';

  @override
  String get chatMessageDebugCopyJson => 'Copia JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'JSON del messaggio copiato negli appunti';

  @override
  String get chatReactionsSheetTitle => 'Reazioni';

  @override
  String get chatReactionsSheetEmpty => 'Nessuno ha ancora reagito.';

  @override
  String get chatMessageReport => 'Segnala messaggio';

  @override
  String get iarReportMessageTitle => 'Segnala messaggio';

  @override
  String get iarThisUserFallback => 'questo utente';

  @override
  String get iarModalDescription =>
      'Segnala una violazione delle regole o trova strumenti per gestire contatti e preferenze.';

  @override
  String get iarPathStepAriaLabel => 'Di cosa hai bisogno?';

  @override
  String get iarCategoryStepTitle => 'Che tipo di regola è stata violata?';

  @override
  String get iarReasonStepTitle => 'Quale regola è stata violata?';

  @override
  String get iarReasonSelectHint => 'Seleziona un motivo';

  @override
  String get iarPickAnOptionToast => 'Seleziona un\'opzione per continuare.';

  @override
  String get iarPickARuleToast => 'Seleziona la regola violata.';

  @override
  String get iarPathPlatform =>
      'Segnala una violazione delle regole della piattaforma';

  @override
  String get iarPathCommunity => 'Segnala ai moderatori di questa community';

  @override
  String get iarPathPreferenceMessage => 'Non mi piace questo contenuto';

  @override
  String get iarCategoryTargetedHarmLabel => 'Minacce, molestie o danni';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Bullismo, minacce, incitamento all\'odio, violenza, raid o contenuti che promuovono l\'autolesionismo.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Sicurezza dei minori o contenuti per adulti';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Minori a rischio, contenuti per adulti in luoghi inappropriati o condotta indesiderata.';

  @override
  String get iarCategoryPrivacyIdentityLabel => 'Privacy o impersonificazione';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxing, stalking, fingersi qualcun altro o profilo inappropriato.';

  @override
  String get iarCategoryDeceptionLabel => 'Truffe, malware o disinformazione';

  @override
  String get iarCategoryDeceptionDescription =>
      'Phishing, frodi, link dannosi o affermazioni false che potrebbero causare danni nel mondo reale.';

  @override
  String get iarCategoryIllegalOtherLabel => 'Attività illegale o altro';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Vendite illegali, facilitazione di attività criminali o una chiara violazione delle regole che non rientra nelle categorie precedenti.';

  @override
  String get iarReasonHarassmentLabel => 'Molestie o minacce';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Bullismo, contatti indesiderati ripetuti, stalking o abusi mirati.';

  @override
  String get iarReasonHateLabel => 'Incitamento all\'odio';

  @override
  String get iarReasonHateMessageDescription =>
      'Insulti, linguaggio disumanizzante o attacchi a gruppi protetti.';

  @override
  String get iarReasonViolenceLabel => 'Violenza o minacce violente';

  @override
  String get iarReasonViolenceDescription =>
      'Minacce credibili, violenza grafica o glorificazione della violenza.';

  @override
  String get iarReasonMatureContentLabel => 'Contenuti per adulti o molestie';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Condotta indesiderata o contenuti per adulti in luoghi inappropriati.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Sicurezza dei minori o sfruttamento di minori';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Contenuti di adescamento o sfruttamento di minori.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Disinformazione dannosa';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Affermazioni false che potrebbero causare danni nel mondo reale.';

  @override
  String get iarReasonSpamLabel => 'Spam, truffe o phishing';

  @override
  String get iarReasonSpamMessageDescription =>
      'Spam di massa, frodi, falsi concorsi a premi o abusi dell\'account.';

  @override
  String get iarReasonMalwareLabel => 'Malware o link pericolosi';

  @override
  String get iarReasonMalwareDescription =>
      'Malware, furto di credenziali o file dannosi.';

  @override
  String get iarReasonPrivacyLabel => 'Violazione della privacy';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxing, informazioni private esposte o stalking.';

  @override
  String get iarReasonImpersonationLabel =>
      'Impersonificazione o media ingannevoli';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Fingersi qualcun altro, inclusi contenuti generati da IA ingannevoli.';

  @override
  String get iarReasonIllegalLabel => 'Attività illegale';

  @override
  String get iarReasonIllegalDescription =>
      'Vendite illegali, facilitazione di attività criminali o attività illecite.';

  @override
  String get iarReasonSelfHarmLabel => 'Autolesionismo o suicidio';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Promozione o istruzioni che incoraggiano l\'autolesionismo o i disturbi alimentari.';

  @override
  String get iarReasonOtherLabel => 'Altra chiara violazione delle regole';

  @override
  String get iarReasonOtherDescription =>
      'Usare solo se viola chiaramente le regole di Fluxer e non rientra nelle categorie precedenti.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Se è coinvolto un minore, usa \"$childSafetyReason\" invece.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Se questo riguarda CSAM o lo sfruttamento di un minore, invialo ora e non ricondividere il materiale.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Se qualcuno è in pericolo immediato, contatta i servizi di emergenza locali se puoi farlo in sicurezza.';

  @override
  String get iarSafetyNoteViolence =>
      'Se si tratta di una minaccia imminente credibile, contatta anche i servizi di emergenza locali.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Se si tratta di una minaccia terroristica imminente, contatta anche i servizi di emergenza locali.';

  @override
  String get iarActionBlockUserTitle => 'Blocca questo utente';

  @override
  String get iarActionBlockUserDescription =>
      'Interrompi messaggi e richieste di amicizia.';

  @override
  String get iarActionBlockUserButton => 'Blocca';

  @override
  String get iarActionCopyMessageLinkTitle => 'Copia link del messaggio';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Condividi con i moderatori della community.';

  @override
  String get iarActionCopyMessageLinkButton => 'Copia';

  @override
  String get iarActionCloseDmTitle => 'Chiudi questa chat privata';

  @override
  String get iarActionCloseDmDescription =>
      'Non blocca. Puoi riaprirla in seguito.';

  @override
  String get iarActionCloseDmButton => 'Chiudi DM';

  @override
  String get iarActionLeaveCommunityTitle => 'Lascia la community';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Smetti di vedere i suoi contenuti e membri.';

  @override
  String get iarActionLeaveCommunityButton => 'Lascia';

  @override
  String get iarActionDmSettingsTitle =>
      'Impostazioni DM e richieste di amicizia';

  @override
  String get iarActionDmSettingsDescription => 'Cambia chi può contattarti.';

  @override
  String get iarActionCallSettingsTitle =>
      'Impostazioni chiamate e chat di gruppo';

  @override
  String get iarActionCallSettingsDescription =>
      'Cambia chi può chiamarti o aggiungerti.';

  @override
  String get iarActionOpenButton => 'Apri';

  @override
  String get iarActionDeleteMessageTitle => 'Elimina questo messaggio';

  @override
  String get iarActionDeleteMessageDescription =>
      'Rimuovilo dal canale per tutti.';

  @override
  String get iarActionDeleteMessageButton => 'Elimina';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Eliminato';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Questo messaggio è già stato eliminato.';

  @override
  String get iarActionBanUserTitle => 'Banna questo utente';

  @override
  String get iarActionBanUserDescription =>
      'Apri la finestra di ban per questa community.';

  @override
  String get iarActionBanUserButton => 'Banna';

  @override
  String get iarActionBanUserBannedButton => 'Bannato';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Questo utente è già stato bannato dalla community.';

  @override
  String get iarCloseDmConfirmTitle => 'Chiudi DM';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Chiudi il tuo DM attuale con $name. Questo non ti blocca; puoi riaprirlo in seguito.';
  }

  @override
  String get iarSuccessTitle => 'Segnalazione inviata';

  @override
  String get iarSuccessBody =>
      'Il nostro team di sicurezza la sta esaminando. Ti invieremo un DM e un\'email una volta presa una decisione.';

  @override
  String get iarAlreadyReportedTitle => 'Già segnalato';

  @override
  String get iarAlreadyReportedBody =>
      'Hai già segnalato questo messaggio. Il nostro team di sicurezza lo sta esaminando.';

  @override
  String get iarBackButton => 'Indietro';

  @override
  String get iarContinueButton => 'Continua';

  @override
  String get iarSendReportButton => 'Invia segnalazione';

  @override
  String get iarDoneButton => 'Fatto';

  @override
  String get iarCouldntSendToast =>
      'Impossibile inviare la segnalazione. Riprova.';

  @override
  String get iarRateLimitedToast =>
      'Stai segnalando troppo velocemente. Attendi un momento e riprova.';

  @override
  String get iarReportSentToast =>
      'Segnalazione inviata. Il nostro team di sicurezza la esaminerà.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Bloccare $name? Non potrà inviarti messaggi o richieste di amicizia. Potrai sbloccarlo in seguito.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Impossibile bloccare questo utente. Riprova.';

  @override
  String get iarCloseDmSuccessToast => 'DM chiuso.';

  @override
  String get iarCloseDmFailedToast =>
      'Impossibile chiudere questo DM. Riprova.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Impossibile lasciare questa community. Riprova.';

  @override
  String get chatMessageSuppressEmbeds => 'Sopprimi embed';

  @override
  String get chatMessageUnsuppressEmbeds => 'Ripristina embed';

  @override
  String get chatMessageDelete => 'Elimina messaggio';

  @override
  String get chatMessageDeleteConfirmTitle => 'Elimina messaggio';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Sei sicuro di voler eliminare questo messaggio?';

  @override
  String get chatMessageDeleteAttachment => 'Delete Attachment';

  @override
  String get chatMessageEditAttachmentAltText => 'Edit Alt Text';

  @override
  String get chatMessageMore => 'Altro';

  @override
  String get chatEditingMessage => 'Modifica messaggio';

  @override
  String get chatReplyOriginalDeleted => 'Messaggio originale eliminato';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Impossibile caricare il messaggio originale';

  @override
  String get chatReplyAttachedMedia => 'Il messaggio contiene media allegati';

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
  String get chatMessagesLoadError => 'Impossibile caricare i messaggi.';

  @override
  String get chatReplyMentionOverrideTitle =>
      'Ignorare la preferenza di menzione?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return 'A $authorNickname preferisce essere menzionato con @ nelle risposte. Vuoi comunque inviare senza la menzione?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname preferisce risposte senza @menzione. Vuoi comunque inviare con la menzione?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ignora preferenza';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Fai clic per disattivare il ping dell\'utente a cui stai rispondendo.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Fai clic per attivare il ping dell\'utente a cui stai rispondendo.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Menziona utente a cui si risponde';

  @override
  String get chatReplyMentionOn => 'Attivato';

  @override
  String get chatReplyMentionOff => 'Disattivato';

  @override
  String get chatReplyCancel => 'Annulla risposta';

  @override
  String get chatEditMessageHint => 'Modifica messaggio';

  @override
  String get chatEditNoChanges => 'Nessuna modifica da salvare';

  @override
  String get chatChannelNotReady =>
      'Questo canale non è ancora pronto. Riprova tra un momento.';

  @override
  String get chatMessageEdited => '(modificato)';

  @override
  String get chatMessageSilent => 'Questo era un messaggio @silent.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Oggi alle $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Ieri alle $time';
  }

  @override
  String get mediaViewerImagePreview => 'Anteprima immagine';

  @override
  String get mediaViewerClose => 'Chiudi visualizzatore media';

  @override
  String get mediaViewerOpenInBrowser => 'Apri nel browser';

  @override
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

  @override
  String get mediaViewerForward => 'Inoltra';

  @override
  String get mediaViewerZoomIn => 'Ingrandisci';

  @override
  String get mediaViewerZoomOut => 'Rimpicciolisci';

  @override
  String get mediaViewerPreviousAttachment => 'Allegato precedente';

  @override
  String get mediaViewerNextAttachment => 'Allegato successivo';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String get chatAttachmentVideoToggleControls =>
      'Mostra/nascondi controlli video';

  @override
  String get chatAttachmentVideoMute => 'Disattiva audio video';

  @override
  String get chatAttachmentVideoUnmute => 'Attiva audio video';

  @override
  String get chatAttachmentVideoPlay => 'Riproduci video';

  @override
  String get chatAttachmentVideoPause => 'Metti in pausa video';

  @override
  String get chatAttachmentVideoProgress => 'Avanzamento video';

  @override
  String get chatVideoPlaybackFailed => 'Impossibile riprodurre questo video.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Notifica gli utenti con questo ruolo che hanno il permesso di visualizzare questo canale.';

  @override
  String get addGuildModalTitle => 'Aggiungi una community';

  @override
  String get addGuildModalLandingDescription =>
      'Crea una nuova community o unisciti a una esistente.';

  @override
  String get addGuildCreateCommunity => 'Crea community';

  @override
  String get addGuildJoinCommunity => 'Unisciti alla community';

  @override
  String get addGuildImportDiscordTemplate => 'Importa modello Discord';

  @override
  String get addGuildJoinTitle => 'Unisciti a una community';

  @override
  String get addGuildJoinDescription =>
      'Inserisci il link d\'invito per unirti a una community.';

  @override
  String get addGuildInviteLinkLabel => 'Link d\'invito';

  @override
  String get addGuildJoinSubmit => 'Unisciti alla community';

  @override
  String get addGuildInviteInvalid => 'Questo invito non è valido o è scaduto.';

  @override
  String get addGuildJoinFailed =>
      'Impossibile unirsi alla community. Riprova.';

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
  String get addGuildPackInstalled => 'Pacchetto installato con successo.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Rimuovi tutte le reazioni';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Sei sicuro di voler rimuovere tutte le reazioni da questo messaggio?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Rimuovi pin messaggio';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Vuoi rimandare indietro questo pin nel tempo?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username ha aggiunto $messageLink a questo canale. Vedi $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'un messaggio';

  @override
  String get systemPinMessageAllPinsLink => 'tutti i messaggi con pin';

  @override
  String get channelPinsEmptyTitle => 'Nessun messaggio fissato';

  @override
  String get channelPinsEmptyDescription =>
      'I messaggi fissati appariranno qui.';

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
  String get personalNotesTitle => 'Note personali';

  @override
  String get personalNotesSubtitle =>
      'Il tuo spazio privato per pensieri e promemoria';

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
    return 'Benvenuto in $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'All\'inizio, non c\'era nulla. Poi, c\'è stato $channelName. Ed era cosa buona.';
  }

  @override
  String get personalNotesComposerHint => 'Scriviti un messaggio';

  @override
  String get personalNotesPrivateSpace => 'Il tuo spazio privato';

  @override
  String get purgePersonalNotes => 'Elimina note personali';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Questo eliminerà definitivamente ogni messaggio e allegato nelle tue note personali. Non sarà possibile annullare questa operazione.';

  @override
  String get purgePersonalNotesConfirmButton => 'Elimina';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Eliminati $count messaggi dalle note personali';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Le note personali erano già vuote';

  @override
  String get purgePersonalNotesFailed =>
      'Impossibile svuotare le note personali';

  @override
  String get userSettingsGroupYourAccount => 'IL TUO ACCOUNT';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'Profilo';

  @override
  String get userSettingsNavSecurityLogin => 'Sicurezza e accesso';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Regali e codici';

  @override
  String get userSettingsNavPrivacyDashboard => 'Dashboard privacy';

  @override
  String get userSettingsNavAuthorizedApps => 'App autorizzate';

  @override
  String get userSettingsNavBlockedUsers => 'Utenti bloccati';

  @override
  String get userSettingsNavLinkedDevices => 'Dispositivi collegati';

  @override
  String get userSettingsNavConnections => 'Connessioni';

  @override
  String get userSettingsNavLookAndFeel => 'Aspetto';

  @override
  String get userSettingsNavAccessibility => 'Accessibilità';

  @override
  String get userSettingsNavChat => 'Messaggi e media';

  @override
  String get userSettingsNavAudioAndVideo => 'Audio e video';

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
  String get userSettingsNavLanguageAndTime => 'Lingua e ora';

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
  String get userSettingsNavAdvanced => 'Avanzate';

  @override
  String get advancedPerformanceReportingTitle => 'Segnalazione prestazioni';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Aiuta a migliorare Fluxer condividendo dati anonimi su crash e prestazioni.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Invia segnalazioni di crash e prestazioni';

  @override
  String get advancedPerformanceReportingDescription =>
      'Tutti i dati segnalati sono anonimi e vengono inviati solo al servizio di monitoraggio di Fluxer; non vengono utilizzati provider di terze parti.';

  @override
  String get userSettingsNavApplications => 'Applicazioni';

  @override
  String get userSettingsNavAppLogs => 'Log app';

  @override
  String get userSettingsNavDeveloperTools => 'Strumenti sviluppatore';

  @override
  String get userSettingsNavLimitsConfig => 'Configurazione limiti';

  @override
  String get userSettingsNavFeatureFlags => 'Flag funzionalità';

  @override
  String get userSettingsNavWhatsNew => 'Novità';

  @override
  String get userSettingsNavLogOut => 'Esci';

  @override
  String get betaWarningTitle => 'Software beta';

  @override
  String get betaWarningMessage =>
      'Questo è un software beta. Non tutto è ancora finito o aggiunto.';

  @override
  String get betaWarningReportIssues =>
      'Segnala eventuali problemi riscontrati alla community di Fluxer Mobile (attualmente devi avere Plutonium per poter accedere alla community).';

  @override
  String get betaWarningRepoLink => 'Visualizza sorgente su GitHub';

  @override
  String get betaWarningGotIt => 'Ho capito';

  @override
  String get quickSwitcherTabSearch => 'Cerca';

  @override
  String get quickSwitcherTabFriends => 'Amici';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Cerca canali, persone o community';

  @override
  String get quickSwitcherSearchFriends => 'Cerca amici';

  @override
  String get quickSwitcherNoMatchesFound => 'Nessuna corrispondenza trovata';

  @override
  String get quickSwitcherEmptyHint =>
      'Prova un nome diverso o usa i prefissi @ / # / ! / * per filtrare i risultati.';

  @override
  String get quickSwitcherSectionPeople => 'Persone';

  @override
  String get quickSwitcherSectionGroupMessages => 'Messaggi di gruppo';

  @override
  String get quickSwitcherSectionTextChannels => 'Canali di testo';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Canali vocali';

  @override
  String get quickSwitcherSectionCommunities => 'Community';

  @override
  String get quickSwitcherSectionSettings => 'Impostazioni';

  @override
  String get quickSwitcherHomeLabel => 'Home';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Messaggi diretti';

  @override
  String get quickSwitcherFavoritesLabel => 'Preferiti';

  @override
  String get quickSwitcherUserSettingsLabel => 'Impostazioni utente';

  @override
  String get quickSwitcherNotificationsLabel => 'Notifiche';

  @override
  String get quickSwitcherBookmarksLabel => 'Segnalibri';

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
  String get quickSwitcherMentionsLabel => 'Menzioni';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Nessun amico';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Aggiungi un amico per iniziare.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Nessun amico corrisponde alla ricerca';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Prova un nome diverso.';

  @override
  String get quickSwitcherSearchAliasUser => 'Utente';

  @override
  String get quickSwitcherSearchAliasYou => 'Tu';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'DM';

  @override
  String get quickSwitcherSearchAliasMessages => 'Messaggi';

  @override
  String get quickSwitcherSearchAliasFav => 'Preferiti';

  @override
  String get quickSwitcherSearchAliasStarred => 'Segnalati';

  @override
  String get quickSwitcherSearchAliasInbox => 'Posta in arrivo';

  @override
  String get quickSwitcherSearchAliasSaved => 'Salvati';

  @override
  String get uiClose => 'Chiudi';

  @override
  String get chatJumpToBottom => 'Salta in fondo';

  @override
  String get uiConfirm => 'Conferma';

  @override
  String get uiLoading => 'Caricamento';

  @override
  String get uiUnsavedChanges => 'Modifiche non salvate';

  @override
  String get uiReset => 'Ripristina';

  @override
  String get uiOpenColorPicker => 'Apri selettore colore';

  @override
  String get uiSelectPlaceholder => 'Seleziona';

  @override
  String get uiSearchPlaceholder => 'Cerca';

  @override
  String get uiNoOptionsFound => 'Nessuna opzione trovata';

  @override
  String get uiDismissNotification => 'Ignora notifica';

  @override
  String get uiColorPickerTitle => 'Selettore colore';

  @override
  String get mentionConfirmTitle => 'Menzionare tutti?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Questo notificherà $count membri. Continuare?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Questo notificherà $count membri online. Continuare?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'This will notify $count members with the $roleName role. Continue?';
  }

  @override
  String get mentionConfirmButton => 'Menziona';

  @override
  String get composerEmojiUnavailable => 'Non puoi usare questa emoji qui.';

  @override
  String get instanceUrlLabel => 'URL istanza';

  @override
  String get instanceUrlPlaceholder => 'Inserisci URL istanza (es. fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Ripristina a Fluxer';

  @override
  String get instanceConnect => 'Connetti';

  @override
  String get instanceConnecting => 'Connessione in corso…';

  @override
  String get instanceConnectFailed => 'Impossibile connettersi all\'istanza';

  @override
  String get recentInstances => 'Istanze recenti';

  @override
  String removeRecentInstance(String domain) {
    return 'Rimuovi $domain dalle istanze recenti';
  }

  @override
  String get instanceSheetTitle => 'Connetti all\'istanza';

  @override
  String get connectToDifferentInstance => 'Connettiti a un\'istanza diversa';

  @override
  String get changeInstance => 'Cambia';

  @override
  String get instanceConnectionRequired =>
      'Connettiti all\'istanza per accedere';

  @override
  String get comingSoon => 'Prossimamente';

  @override
  String get guildNavbarDirectMessages => 'Messaggi diretti';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Esplora community individuabili';

  @override
  String get discoveryExplore => 'Esplora';

  @override
  String get discoveryExplorePublicCommunities => 'Esplora community pubbliche';

  @override
  String get discoveryListingSubheading =>
      'Vuoi che la tua community sia presente qui? Candidati se soddisfi i requisiti nelle impostazioni della tua community > Discovery.';

  @override
  String get discoverySearchCommunities => 'Cerca community';

  @override
  String get discoveryFilterByLanguage => 'Filtra per lingua';

  @override
  String get discoveryAllLanguages => 'Tutte le lingue';

  @override
  String get discoveryAllCategories => 'Tutte';

  @override
  String get discoveryCategoryGaming => 'Giochi';

  @override
  String get discoveryCategoryMusic => 'Musica';

  @override
  String get discoveryCategoryEntertainment => 'Intrattenimento';

  @override
  String get discoveryCategoryEducation => 'Istruzione';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Scienza e tecnologia';

  @override
  String get discoveryCategoryContentCreator => 'Creatore di contenuti';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime e manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Film e TV';

  @override
  String get discoveryCategoryOther => 'Altro';

  @override
  String get discoveryNoCommunitiesMatch => 'Nessuna community corrisponde.';

  @override
  String get discoveryJoinCommunity => 'Unisciti alla community';

  @override
  String get discoveryJoined => 'Unito';

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
      other: '$countString membri',
      one: '1 membro',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Nessuna descrizione.';

  @override
  String get discoveryCommunities => 'Community';

  @override
  String get discoveryApps => 'App';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Impossibile unirsi a questa community';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Qualcosa è andato storto. Riprova tra un momento.';

  @override
  String get discoveryJoinErrorFullTitle => 'Questa community è piena';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Questa community ha raggiunto il limite di membri, quindi non puoi unirti al momento.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Hai raggiunto il limite di community';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Sei nel numero massimo di community. Lasciane una e riprova.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Non puoi unirti a questa community';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Sei stato bannato da questa community.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Questa community non è più disponibile';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Potrebbe aver lasciato la discovery o disattivato le nuove iscrizioni. Aggiorna la pagina e non la vedrai più.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Stai andando troppo veloce';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Attendi un momento e riprova.';

  @override
  String get guildNavbarAddCommunity => 'Aggiungi una community';

  @override
  String get guildNavbarHelp => 'Aiuto';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'NUOVO MESSAGGIO';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Riduci $folderName';
  }

  @override
  String get guildNavbarGroupDm => 'DM di gruppo';

  @override
  String get guildNavbarCreateChannel => 'Crea canale';

  @override
  String get guildNavbarChannelType => 'Tipo di canale';

  @override
  String get guildNavbarTextChannel => 'Canale di testo';

  @override
  String get guildNavbarTextChannelDescription =>
      'Invia messaggi, immagini, GIF ed emoji';

  @override
  String get guildNavbarVoiceChannel => 'Canale vocale';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Passa del tempo insieme con voce, video e condivisione schermo';

  @override
  String get guildNavbarLinkChannel => 'Canale link';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Accesso rapido a un sito web o una risorsa esterna';

  @override
  String get guildNavbarNameLabel => 'Nome';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

  @override
  String get guildNavbarCreateCategory => 'Crea categoria';

  @override
  String get guildNavbarNewCategoryHint => 'Nuova categoria';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Invita amici in $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'I destinatari verranno portati in #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Cerca amici';

  @override
  String get guildNavbarNoFriendsYet => 'Nessun amico per ora';

  @override
  String get guildNavbarNoResults => 'Nessun risultato';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Oppure, invia un link d\'invito a un amico:';

  @override
  String get guildNavbarInviteLink => 'Link d\'invito';

  @override
  String get guildNavbarCopy => 'Copia';

  @override
  String get guildNavbarCopied => 'Copiato!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Il tuo link d\'invito scade tra 7 giorni.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Questo link d\'invito non scade mai.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Il tuo link d\'invito scade tra $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Modifica link d\'invito';

  @override
  String get guildNavbarInviteLinkSettings => 'Impostazioni link d\'invito';

  @override
  String get guildNavbarExpireAfter => 'Scade dopo';

  @override
  String get guildNavbarMaxUses => 'Numero massimo di utilizzi';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Concedi appartenenza temporanea';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'I membri verranno rimossi quando vanno offline a meno che non venga assegnato un ruolo';

  @override
  String get guildNavbarCreateNewLink => 'Crea nuovo link';

  @override
  String get guildNavbarSent => 'Inviato';

  @override
  String get guildNavbarInvite => 'Invita';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Lascia community';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Sei sicuro di voler lasciare questa community? Non potrai più vedere alcun messaggio.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Lascia community';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Eliminare i tuoi messaggi in questa community?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Elimina permanentemente ogni messaggio che hai inviato qui, in ogni canale. Non può essere annullato.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Elimina i miei messaggi';

  @override
  String get guildNavbarDeletedYourMessages => 'Messaggi eliminati';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Impossibile eliminare i tuoi messaggi';

  @override
  String get guildNavbarRemoveOverride => 'Rimuovi sovrascrittura';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Silenzioso fino al $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible =>
      'Accessibile solo allo staff di Fluxer';

  @override
  String get guildNavbarInvitesPaused =>
      'Gli inviti sono attualmente in pausa in questa community';

  @override
  String get guildNavbarDurationNever => 'mai';

  @override
  String get guildNavbarDuration30Minutes => '30 minuti';

  @override
  String get guildNavbarDuration1Hour => '1 ora';

  @override
  String get guildNavbarDuration6Hours => '6 ore';

  @override
  String get guildNavbarDuration12Hours => '12 ore';

  @override
  String get guildNavbarDuration1Day => '1 giorno';

  @override
  String get guildNavbarDuration7Days => '7 giorni';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count secondi';
  }

  @override
  String get guildNavbarNever => 'Mai';

  @override
  String get guildNavbarNoLimit => 'Nessun limite';

  @override
  String get guildNavbarOneUse => '1 uso';

  @override
  String guildNavbarUses(int count) {
    return '$count usi';
  }

  @override
  String get guildMenuMarkAsRead => 'Segna come letto';

  @override
  String get guildPeekMoreOptions => 'Altre opzioni';

  @override
  String get guildMenuInviteMembers => 'Invita membri';

  @override
  String get guildMenuCommunitySettings => 'Impostazioni community';

  @override
  String get guildMenuEditCommunityProfile => 'Modifica profilo community';

  @override
  String get guildMenuUnmuteCommunity => 'Disattiva audio community';

  @override
  String get guildMenuMuteCommunity => 'Attiva audio community';

  @override
  String get guildMenuHideMutedChannels =>
      'Nascondi canali con audio disattivato';

  @override
  String get guildMenuReportCommunity => 'Segnala community';

  @override
  String get guildMenuDebugCommunity => 'Debug community';

  @override
  String get guildMenuCopyCommunityId => 'Copia ID community';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Fino alle $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Generale';

  @override
  String get guildMenuSettingsRoles => 'Ruoli e permessi';

  @override
  String get guildMenuSettingsEmoji => 'Emoji personalizzate';

  @override
  String get guildMenuSettingsStickers => 'Adesivi personalizzati';

  @override
  String get guildMenuSettingsSafetyModeration => 'Sicurezza e moderazione';

  @override
  String get guildMenuSettingsActivityLog => 'Registro attività';

  @override
  String get guildMenuSettingsWebhooks => 'Webhook';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'URL invito personalizzato';

  @override
  String get guildMenuSettingsDiscovery => 'Discovery';

  @override
  String get guildMenuSettingsMembers => 'Membri';

  @override
  String get guildMenuSettingsInviteLinks => 'Link invito';

  @override
  String get guildMenuSettingsBans => 'Ban';

  @override
  String get guildMenuSettingsChannels => 'Channels';

  @override
  String get guildSettingsNoPermission =>
      'Non hai il permesso di visualizzare questa scheda delle impostazioni.';

  @override
  String get guildSettingsOverviewIconTitle => 'Icona';

  @override
  String get guildSettingsUploadImage => 'Carica immagine';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Carica un banner per il tuo server.';

  @override
  String get guildSettingsOverviewNameTitle => 'Nome';

  @override
  String get guildSettingsOverviewNameHint => 'La mia fantastica community';

  @override
  String get guildSettingsOverviewStatsTitle => 'Statistiche';

  @override
  String get guildSettingsOverviewMembers => 'Membri';

  @override
  String get guildSettingsOverviewOnline => 'Online';

  @override
  String get guildSettingsRolesDescription =>
      'Usa i ruoli per raggruppare i membri e assegnare permessi.';

  @override
  String get guildSettingsCreateRole => 'Crea ruolo';

  @override
  String get guildSettingsRolesListTitle => 'Ruoli';

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
    return '$staticCount slot emoji statiche, $animatedCount animate usati';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Nessuna emoji personalizzata ancora.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count adesivi caricati';
  }

  @override
  String get guildSettingsStickersEmpty =>
      'Nessun adesivo personalizzato ancora.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Verifica membri';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Scegli cosa devono avere i membri prima di poter inviare messaggi o inviare messaggi diretti ai membri della community.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'I membri con ruoli possono aggirare questi controlli. Per gli spazi pubblici, consigliamo di abilitare la verifica.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Le community elencate in Discovery richiedono almeno un\'email verificata. Non è possibile selezionare Nessuno mentre Discovery è abilitato.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Contenuti per adulti e avvisi sui contenuti';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Configura la marcatura dei contenuti per adulti e gli avvisi sui contenuti opzionali per i membri.';

  @override
  String get guildSettingsModerationMatureToggle => 'Contenuti per adulti';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Segna questa community come contenente contenuti per adulti.';

  @override
  String get guildSettingsVerificationNone => 'Nessuno';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Non è richiesta alcuna verifica.';

  @override
  String get guildSettingsVerificationLow => 'Basso';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Richiede un indirizzo email verificato.';

  @override
  String get guildSettingsVerificationMedium => 'Medio';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Richiede un indirizzo email verificato e un account di almeno 5 minuti.';

  @override
  String get guildSettingsVerificationHigh => 'Alto';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Richiede tutto ciò che è presente in medio, più l\'essere membro della community per almeno 10 minuti.';

  @override
  String get guildSettingsVerificationHighest => 'Molto alto';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Richiede un numero di telefono verificato.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Tieni traccia delle azioni dei moderatori nella community.';

  @override
  String get guildSettingsAuditLogEmpty => 'Nessun log ancora';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Le azioni di moderazione e le modifiche alla community appariranno qui.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Tutti gli utenti';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Tutte le azioni';

  @override
  String get guildSettingsAuditLogNoReason => 'Nessun motivo fornito.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Utente sconosciuto';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Si è verificato un errore durante il caricamento del log delle attività.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Impossibile caricare i log delle attività';

  @override
  String get guildSettingsAuditLogReason => 'Motivo';

  @override
  String get guildSettingsAuditLogSomeone => 'qualcuno';

  @override
  String get guildSettingsAuditLogSomething => 'qualcosa';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'entità sconosciuta';

  @override
  String get guildSettingsAuditLogNothing => 'niente';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Destinazione sconosciuta';

  @override
  String get auditLogActionGuildUpdate => 'Community aggiornata';

  @override
  String get auditLogActionChannelCreate => 'Canale creato';

  @override
  String get auditLogActionChannelUpdate => 'Canale aggiornato';

  @override
  String get auditLogActionChannelDelete => 'Canale eliminato';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Sovrascrittura canale aggiunta';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Sovrascrittura canale aggiornata';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Sovrascrittura canale rimossa';

  @override
  String get auditLogActionMemberKick => 'Membro espulso';

  @override
  String get auditLogActionMemberPrune => 'Membri potati';

  @override
  String get auditLogActionMemberBanAdd => 'Membro bannato';

  @override
  String get auditLogActionMemberBanRemove => 'Membro sbannato';

  @override
  String get auditLogActionMemberUpdate => 'Membro aggiornato';

  @override
  String get auditLogActionMemberRoleUpdate => 'Ruoli membro aggiornati';

  @override
  String get auditLogActionMemberMove => 'Membro spostato';

  @override
  String get auditLogActionMemberDisconnect => 'Membro disconnesso';

  @override
  String get auditLogActionBotAdd => 'Bot aggiunto';

  @override
  String get auditLogActionRoleCreate => 'Ruolo creato';

  @override
  String get auditLogActionRoleUpdate => 'Ruolo aggiornato';

  @override
  String get auditLogActionRoleDelete => 'Ruolo eliminato';

  @override
  String get auditLogActionInviteCreate => 'Invito creato';

  @override
  String get auditLogActionInviteUpdate => 'Invito aggiornato';

  @override
  String get auditLogActionInviteDelete => 'Invito eliminato';

  @override
  String get auditLogActionWebhookCreate => 'Webhook creato';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook aggiornato';

  @override
  String get auditLogActionWebhookDelete => 'Webhook eliminato';

  @override
  String get auditLogActionEmojiCreate => 'Emoji creata';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji aggiornata';

  @override
  String get auditLogActionEmojiDelete => 'Emoji eliminata';

  @override
  String get auditLogActionStickerCreate => 'Sticker creato';

  @override
  String get auditLogActionStickerUpdate => 'Sticker aggiornato';

  @override
  String get auditLogActionStickerDelete => 'Sticker eliminato';

  @override
  String get auditLogActionMessageDelete => 'Messaggio eliminato';

  @override
  String get auditLogActionMessageBulkDelete => 'Messaggi eliminati';

  @override
  String get auditLogActionMessagePin => 'Messaggio fissato';

  @override
  String get auditLogActionMessageUnpin => 'Messaggio non più fissato';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor ha aggiornato le impostazioni della community.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor ha creato il canale $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor ha aggiornato il canale $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor ha eliminato il canale $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor ha aggiunto permessi del canale per $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor ha aggiunto permessi del canale per $target in $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor ha aggiornato i permessi del canale per $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor ha aggiornato i permessi del canale per $target in $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor ha rimosso i permessi del canale per $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor ha rimosso i permessi del canale per $target in $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor ha espulso $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor ha bannato $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor ha rimosso il ban a $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor ha aggiornato $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor ha aggiornato i ruoli per $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor ha eliminato i membri inattivi.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor ha eliminato i membri inattivi da $days giorni.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor ha spostato $target in un altro canale vocale.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor ha spostato $target nel canale $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor ha disconnesso $target dalla voce.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor ha aggiunto il bot $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor ha creato il ruolo $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor ha aggiornato il ruolo $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor ha eliminato il ruolo $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor ha creato l\'invito $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor ha creato l\'invito $target per il canale $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor ha aggiornato l\'invito $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor ha aggiornato l\'invito $target per il canale $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor ha eliminato l\'invito $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor ha eliminato l\'invito $target per il canale $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor ha creato il webhook $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor ha aggiornato il webhook $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor ha eliminato il webhook $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor ha aggiunto l\'emoji $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor ha aggiornato l\'emoji $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor ha eliminato l\'emoji $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor ha aggiunto lo sticker $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor ha aggiornato lo sticker $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor ha eliminato lo sticker $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor ha eliminato un messaggio.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor ha eliminato un messaggio in $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor ha eliminato più messaggi.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor ha eliminato $count messaggi.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor ha eliminato più messaggi in $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor ha eliminato $count messaggi in $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor ha fissato un messaggio.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor ha fissato un messaggio in $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor ha rimosso il fissaggio di un messaggio.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor ha rimosso il fissaggio di un messaggio in $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor ha eseguito un\'azione di controllo su $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Aggiornato $field da $oldValue a $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Impostato $field a $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Pulito $field (era $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Aggiornato $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Rinominata la community in $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Aggiornata l\'icona della community.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Rinominato il canale in $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Pulito l\'argomento.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Argomento aggiornato a $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'Contenuti per adulti abilitati.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Contenuti per adulti disabilitati.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Impostato nickname a $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Rimosso nickname $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Membro silenziato.';

  @override
  String get auditLogChangeUnmutedMember => 'Membro non più silenziato.';

  @override
  String get auditLogChangeDeafenedMember => 'Membro escluso dall\'audio.';

  @override
  String get auditLogChangeUndeafenedMember =>
      'Membro non più escluso dall\'audio.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Aggiunti $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Rimosso $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Canale: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Messaggio: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Invitato da $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Eliminati # messaggi.',
      one: 'Eliminato # messaggio.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Rimossi # membri.',
      one: 'Rimosso # membro.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires => 'Questo invito non scade mai.';

  @override
  String get auditLogOptionTemporaryMembership =>
      'Concede l\'adesione temporanea.';

  @override
  String get auditLogOptionPermanentMembership =>
      'Concede l\'adesione permanente.';

  @override
  String get guildSettingsLoadMore => 'Carica altro';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Gestisci i webhook che inviano messaggi ai canali.';

  @override
  String get guildSettingsWebhooksEmpty => 'Nessun webhook configurato.';

  @override
  String get guildSettingsCopyUrl => 'Copia URL';

  @override
  String get guildSettingsCopiedUrl => 'URL copiato negli appunti';

  @override
  String get guildSettingsDeleteWebhook => 'Elimina webhook';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Imposta un link di invito personalizzato per il tuo server.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Salva';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Utilizzo';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count utilizzi';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Fai domanda per essere inserito nella ricerca community.';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Sono necessari almeno $count membri per fare domanda.';
  }

  @override
  String get guildSettingsDiscoveryFormTitle => 'Domanda';

  @override
  String get guildSettingsDiscoveryStatusTitle => 'Stato';

  @override
  String get guildSettingsDiscoveryCategory => 'Categoria';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Descrizione';

  @override
  String get guildSettingsDiscoveryTags => 'Tag';

  @override
  String get guildSettingsDiscoveryTagsHint => 'gaming, arte, musica';

  @override
  String get guildSettingsDiscoveryApply => 'Invia domanda';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Ritira';

  @override
  String get guildSettingsMembersDescription =>
      'Cerca e gestisci i membri della community.';

  @override
  String get guildSettingsMembersSearchHint => 'Cerca membri';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count membri';
  }

  @override
  String get guildSettingsInvitesTitle => 'Invites';

  @override
  String get guildSettingsInvitesDescription =>
      'Visualizza e revoca i link di invito attivi.';

  @override
  String get guildSettingsInvitesEmpty => 'Nessun invito attivo.';

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
    return '$uses / $maxUses utilizzi';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Scade il $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Visualizza e gestisci gli utenti bannati.';

  @override
  String get guildSettingsBansSearchHint => 'Cerca ban';

  @override
  String get guildSettingsBansEmpty => 'Nessun utente bannato.';

  @override
  String get guildSettingsBanPermanent => 'Ban permanente';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Scade il $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Scade';

  @override
  String get guildSettingsUnban => 'Annulla ban';

  @override
  String get guildSettingsBansLoading => 'Caricamento utenti bannati';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Nessun ban trovato corrispondente alla tua ricerca.';

  @override
  String get guildSettingsBanDetailsTitle => 'Dettagli ban';

  @override
  String get guildSettingsBanViewDetails => 'Visualizza dettagli';

  @override
  String get guildSettingsBannedOn => 'Bannato il';

  @override
  String get guildSettingsBannedBy => 'Bannato da';

  @override
  String get guildSettingsRevokeBanTitle => 'Annulla ban';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Sei sicuro di voler annullare il ban per $displayName? Potrà riunirsi alla community.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Ban annullato per $displayName';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Impossibile caricare i ban. Riprova.';

  @override
  String get guildSettingsRevokeBanError =>
      'Impossibile annullare il ban. Riprova.';

  @override
  String get guildSettingsCommunitySettings => 'Impostazioni community';

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
      'Gestisci il profilo, i canali e le impostazioni predefinite della tua community.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Branding';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Aggiorna la tua icona, nome, banner e sfondo invito';

  @override
  String get guildSettingsOverviewBannerUpload => 'Carica banner';

  @override
  String get guildSettingsOverviewIdleTitle => 'Impostazioni inattive';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Configura il canale AFK e il timeout';

  @override
  String get guildSettingsOverviewSystemTitle => 'Sistema e benvenuto';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Scegli la destinazione per i messaggi di sistema e di benvenuto';

  @override
  String get guildSettingsOverviewNotificationsTitle => 'Notifiche predefinite';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Le community con oltre 250 persone sono forzate all\'impostazione \"solo menzioni\". La tua impostazione originale viene preservata e verrà ripristinata se la community scende sotto i 250 membri.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Avanzate';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Consenti nomi di canali di testo flessibili';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Nascondi la corona del proprietario della community';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Banner separato';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Mostra il banner in una sezione separata sotto l\'intestazione della community.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Carica icona';

  @override
  String get guildSettingsOverviewRemoveImage => 'Rimuovi';

  @override
  String get guildSettingsOverviewSplashTitle => 'Sfondo invito';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'Sfondo embed chat';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Mostrato negli embed di invito nella chat.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Carica sfondo';

  @override
  String get guildSettingsOverviewNoCommunityBanner =>
      'Nessun banner della community';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'Nessuno sfondo per gli inviti';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Anteprima';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Vedi come appare il tuo invito ai visitatori.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Nomi dei canali di testo';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Corona del proprietario della community';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Configura se l\'icona della corona viene mostrata accanto al proprietario della community';

  @override
  String get guildSettingsSplashCardAlignment => 'Allineamento scheda';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Centro';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Sinistra';

  @override
  String get guildSettingsSplashAlignmentRight => 'Destra';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Si applica solo su schermi larghi.';

  @override
  String get permissionReadMessageHistory => 'Leggi cronologia messaggi';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Cambia ciò che gli utenti senza \"$permission\" possono vedere';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Usa una finestra dedicata per impostare una data limite per la cronologia dei messaggi per i membri che non hanno il permesso $permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Apri soglia cronologia messaggi';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Soglia cronologia messaggi';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Abilita soglia cronologia messaggi';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Data soglia';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'I membri senza Leggi cronologia messaggi possono visualizzare i messaggi inviati dopo questa data.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Soglia cronologia messaggi aggiornata';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Consenti lettere maiuscole e spazi nei nomi dei canali di testo. Disattivato limita i nomi a minuscole con trattini e underscore.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Nasconde l\'icona della corona accanto al proprietario della community su tutte le interfacce.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Le icone animate richiedono la funzionalità della community Icone animate.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'I banner animati richiedono la funzionalità della community Banner animati.';

  @override
  String get guildSettingsAfkChannel => 'Canale AFK / inattivo';

  @override
  String get guildSettingsAfkChannelHint =>
      'Sposta i membri in questo canale quando sono AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Nessun canale AFK';

  @override
  String get guildSettingsAfkTimeout => 'Timeout AFK';

  @override
  String get guildSettingsAfkTimeout1Min => '1 minuto';

  @override
  String get guildSettingsAfkTimeout5Min => '5 minuti';

  @override
  String get guildSettingsAfkTimeout15Min => '15 minuti';

  @override
  String get guildSettingsAfkTimeout30Min => '30 minuti';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 ora';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds secondi';
  }

  @override
  String get guildSettingsSystemChannel => 'Canale di destinazione';

  @override
  String get guildSettingsSystemChannelHint =>
      'I messaggi di benvenuto e di sistema appariranno qui.';

  @override
  String get guildSettingsNoSystemChannel => 'Nessun canale di sistema';

  @override
  String get guildSettingsHideJoinMessages => 'Nascondi messaggi di accesso';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Sopprime i messaggi di accesso nel canale di destinazione.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Impostazioni di notifica predefinite';

  @override
  String get guildSettingsNotificationsAll => 'Tutti i messaggi';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Notifica su tutti i messaggi';

  @override
  String get guildSettingsNotificationsMentions => 'Solo menzioni';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Notifica solo sulle menzioni';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max 10 MB. Minimo: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max 10 MB. Minimo: 960×540px (16:9). Mostrato negli embed di invito in chat.';

  @override
  String get guildSettingsModerationDescription =>
      'Configura le impostazioni di verifica, filtro dei contenuti e contenuti per adulti.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Le community elencate in Discovery hanno opzioni di moderazione limitate.';

  @override
  String get guildSettingsModerationContentFilterTitle =>
      'Filtro dei contenuti';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Scansiona automaticamente i messaggi per contenuti espliciti nei canali non contrassegnati per contenuti per adulti.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Le community elencate in Discovery sono tenute a scansionare tutti i membri. Questa impostazione non può essere modificata mentre Discovery è abilitato.';

  @override
  String get guildSettingsContentFilterOff => 'Disattivato';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Lascia che la community si auto-moderi';

  @override
  String get guildSettingsContentFilterNoRole => 'Filtra i membri senza ruoli';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Suggerito per la maggior parte delle community';

  @override
  String get guildSettingsContentFilterAll => 'Filtra tutti';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Massima protezione per spazi adatti alle famiglie';

  @override
  String get guildSettingsModerationMatureOff => 'Disattivato';

  @override
  String get guildSettingsModerationMatureOn => 'Attivato';

  @override
  String get guildSettingsContentWarningToggle =>
      'Mostra un avviso sui contenuti';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Attiva un prompt di consenso prima di accedere a qualsiasi canale.';

  @override
  String get guildSettingsContentWarningText =>
      'Testo personalizzato dell\'avviso';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Questo contiene contenuti sensibili.';

  @override
  String get guildSettingsModeration2faTitle => 'Requisito 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'Richiedi l\'autenticazione a due fattori per i moderatori prima che possano bannare, espellere, mettere in timeout o rimuovere messaggi.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Richiedi 2FA per le azioni di moderazione';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Solo il proprietario della community può modificare questa impostazione';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Abilita la 2FA sul tuo account per modificare questa impostazione';

  @override
  String get guildSettingsEmojiSearchHint => 'Cerca emoji';

  @override
  String get guildSettingsEmojiUploadTitle => 'Carica emoji';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Emoji non animate ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Emoji animate ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Cerca sticker';

  @override
  String get guildSettingsWebhooksInfo =>
      'Crea webhook dalle impostazioni del canale. Modificali qui.';

  @override
  String get guildSettingsVanityUrlWarning =>
      'Il tuo URL personalizzato non funzionerà a meno che almeno un canale non sia visibile a tutti.';

  @override
  String get guildSettingsVanityUrlRemove => 'Rimuovi';

  @override
  String get guildSettingsBannedUsersTitle => 'Utenti bannati';

  @override
  String get guildSettingsInvitesTableInviter => 'Invitante';

  @override
  String get guildSettingsInvitesTableChannel => 'Canale';

  @override
  String get guildSettingsInvitesTableCode => 'Codice';

  @override
  String get guildSettingsInvitesTableUses => 'Utilizzi';

  @override
  String get guildSettingsInvitesTableCreated => 'Creato';

  @override
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsMembersSortNewest => 'Dal più recente';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtra per utente';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtra per azione';

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
