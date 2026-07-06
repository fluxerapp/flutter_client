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
      'Your session has expired. Please sign in again.';

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
  String get voiceControlChat => 'Chat';

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
  String get userSettingsNavExpressionPacks => 'Pacchetti espressioni';

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
  String get userSettingsNavMessagesAndMedia => 'Messaggi e media';

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
  String get userSettingsNavSoundsAndAlerts => 'Suoni e avvisi';

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
  String get guildSettingsInvitesDescription =>
      'Visualizza e revoca i link di invito attivi.';

  @override
  String get guildSettingsInvitesEmpty => 'Nessun invito attivo.';

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
