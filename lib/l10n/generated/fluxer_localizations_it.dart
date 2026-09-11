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
    return 'Manutenzione programmata per le $localizedTime. Durata prevista: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Manutenzione in corso. Durata prevista: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'Manutenzione completata.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Ciao $displayName, rivendica il tuo account per non perdere l\'accesso.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Ciao $displayName, verifica il tuo indirizzo email.';
  }

  @override
  String get nagbarOpenSettings => 'Apri impostazioni';

  @override
  String get systemPermissionSettingsTitle => 'Abilita autorizzazione';

  @override
  String get systemPermissionSettingsOpenSettings => 'Apri impostazioni';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName non ha accesso al tuo microfono. Puoi abilitarlo nelle impostazioni sulla privacy del tuo dispositivo.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName non ha accesso alla tua fotocamera. Puoi abilitarlo nelle impostazioni sulla privacy del tuo dispositivo.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName non ha accesso alla tua libreria foto. Puoi abilitarlo nelle impostazioni sulla privacy del tuo dispositivo.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName non ha il permesso di inviare notifiche. Puoi abilitarlo nelle impostazioni del tuo dispositivo.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'L\'abbonamento non è stato rinnovato, ma hai ancora accesso ai vantaggi di $productName fino al $graceDate. Agisci ora o perderai tutti i vantaggi.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Il tuo abbonamento a $productName è scaduto. Rinnova ora per mantenere i tuoi vantaggi.';
  }

  @override
  String get nagbarManageSubscription => 'Gestisci abbonamento';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Benvenuto in $productFullName. Scopri i vantaggi di $productName e gestisci il tuo abbonamento.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'Visualizza le funzionalità di $productName';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'Hai un nuovo codice regalo che ti aspetta nel tuo inventario regali.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'Hai $count nuovi codici regalo in attesa nel tuo inventario.';
  }

  @override
  String get nagbarViewGiftInventory => 'Visualizza inventario regali';

  @override
  String get nagbarVisionaryMfa =>
      'Abilita l\'autenticazione a due fattori per proteggere il tuo account Visionary.';

  @override
  String get nagbarEnableMfa => 'Abilita l\'autenticazione a due fattori';

  @override
  String get nagbarTermsAcceptance =>
      'Abbiamo aggiornato i nostri termini. Per continuare, esaminali e accettali.';

  @override
  String get nagbarReviewTerms => 'Rivedi i termini';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Unisciti a $communityName per chattare con il team e rimanere sempre aggiornato.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Unisciti a $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'Abilita le notifiche per non perderti messaggi e menzioni.';

  @override
  String get nagbarEnableNotifications => 'Abilita notifiche';

  @override
  String get nagbarBillingPortalFailed =>
      'Impossibile aprire il portale di fatturazione. Riprova tra poco.';

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
  String get next => 'Avanti';

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
  String get registerPendingApproval =>
      'La tua richiesta di account è in attesa di approvazione. Potrai accedere dopo l’approvazione di un amministratore.';

  @override
  String get registerClosed =>
      'La registrazione è attualmente chiusa. Usa un link di registrazione fornito da un amministratore per creare un account.';

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
  String get errorServiceUnavailable =>
      'Questa istanza non è temporaneamente disponibile. Riprova tra un momento.';

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
  String get embedInviteJoinGroup => 'Unisciti al gruppo';

  @override
  String get embedInviteAlreadyJoined => 'Già iscritto';

  @override
  String get embedInviteDisabled => 'Inviti disabilitati';

  @override
  String get embedInvitePaused =>
      'Gli inviti per questa community sono in pausa.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName ha rilevato un potenziale raid, quindi i nuovi utenti non possono unirsi al momento.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Questa community ha sospeso gli inviti. Puoi riprovare più tardi.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName ha rilevato un potenziale raid in questa community. Gli inviti sono in pausa, quindi i nuovi utenti non possono unirsi in questo momento.';
  }

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
  String get invalidDeepLinkTitle => 'Il link non è stato possibile aprirlo';

  @override
  String get invalidDeepLinkDescription =>
      'Questo link potrebbe essere interrotto, disponibile solo sul web o potresti non avere accesso. Controlla il link e riprova.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Vai alla Home';

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
  String embedGiftVisionaryLifetime(String productName) {
    return 'Visionary (a vita $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count giorni di $productName',
      one: '1 giorno di $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count settimane di $productName',
      one: '1 settimana di $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mesi di $productName',
      one: '1 mese di $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count anni di $productName',
      one: '1 anno di $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'Da $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'Tocca per riscattare il tuo regalo!';

  @override
  String get embedGiftAlreadyRedeemed => 'Già riscattato';

  @override
  String get embedGiftClaimAccountHelp =>
      'Registra il tuo account per riscattare questo regalo.';

  @override
  String get embedGiftClaim => 'Riscatta regalo';

  @override
  String get embedGiftClaimed => 'Regalo riscattato';

  @override
  String get embedGiftClaimAccount => 'Accedi per riscattare';

  @override
  String get embedGiftUnknownTitle => 'Regalo sconosciuto';

  @override
  String get embedGiftUnknownSubtitle =>
      'Questo codice regalo non è valido o è già stato utilizzato.';

  @override
  String get embedGiftUnavailable => 'Regalo non disponibile';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Riscatta il tuo regalo per attivare il tuo abbonamento $productName!';
  }

  @override
  String get giftAcceptAlreadyClaimed =>
      'Questo regalo è già stato riscattato.';

  @override
  String get giftAcceptMaybeLater => 'Forse dopo';

  @override
  String get giftRedeemedToast => 'Regalo riscattato!';

  @override
  String get giftRedeemInvalidTitle => 'Codice regalo non valido';

  @override
  String get giftRedeemInvalidMessage =>
      'Questo codice non è valido o è già stato usato.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Regalo già riscattato';

  @override
  String get giftRedeemAlreadyRedeemedMessage =>
      'Questo codice è già stato riscattato.';

  @override
  String get giftRedeemNotFoundTitle => 'Regalo non trovato';

  @override
  String get giftRedeemNotFoundMessage => 'Questo codice non esiste.';

  @override
  String get giftRedeemFailedTitle => 'Impossibile riscattare il regalo';

  @override
  String get giftRedeemFailedMessage =>
      'Non è stato possibile riscattare questo regalo. Riprova.';

  @override
  String get giftVisionaryCannotRedeemTitle =>
      'Impossibile riscattare questo regalo';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Gli account Visionary non possono riscattare i regali Plutonium. Copia il link per condividerlo con un amico.';

  @override
  String get giftCopyLink => 'Copia link regalo';

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
  String get notificationUseCategoryDefault =>
      'Usa le impostazioni predefinite della categoria';

  @override
  String get notificationUseCommunityDefault =>
      'Usa le impostazioni predefinite della community';

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
  String get dmDeleteMyMessagesTitle =>
      'Eliminare i tuoi messaggi in questa conversazione?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Verranno eliminati definitivamente tutti i messaggi che hai inviato in questa conversazione. Questa azione non può essere annullata.';

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
  String get dmUnnamedGroup => 'Gruppo senza nome';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'Gruppo di $resolvedName';
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
  String get dmDebugCategory => 'Debug categoria';

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
  String get addFriendVerifyToSend =>
      'Verifica la tua email prima di inviare richieste di amicizia.';

  @override
  String get addFriendFriendsListFull =>
      'La tua lista amici è piena, o lo è la loro. Rimuovi qualcuno e riprova.';

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
  String emojiInfoDefaultDescription(String productName) {
    return 'Questa è un\'emoji predefinita su $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'Questa emoji proviene da questa community. Puoi usarla ovunque.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'Questa è un\'emoji personalizzata di una community.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'Questa è un\'emoji personalizzata di una community. Chiedi all\'autore un invito per usarla.';

  @override
  String get emojiInfoFromHeader => 'Questa emoji proviene da';

  @override
  String get emojiInfoDiscoverableCommunity => 'Community da scoprire';

  @override
  String get emojiInfoPrivateCommunity => 'Community privata';

  @override
  String get emojiInfoVerifiedCommunity => 'Community verificata';

  @override
  String get emojiInfoAddToFavorites => 'Aggiungi ai preferiti';

  @override
  String get emojiInfoRemoveFromFavorites => 'Rimuovi dai preferiti';

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
  String get gifPickerFavoritesEmptyTitle => 'Ancora nessuna GIF preferita';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Aggiungi una GIF ai preferiti per vederla qui.';

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
  String externalLinkWarningLeaving(String productName) {
    return 'Stai per lasciare $productName';
  }

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
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => 'Cambia il tuo Nome utente';

  @override
  String get fluxerTagInputLabel => 'Nome utente';

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
  String get fluxerTagAlreadyTaken => 'Nome utente già preso';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Il Nome utente $username#$discriminator è già in uso. Continuando, il tuo discriminatore verrà rigenerato automaticamente.';
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
      'Se salvi questo Nome utente, il tuo tag personalizzato di 4 cifre tornerà a essere un numero casuale al termine del tuo abbonamento Plutonium. Se il tuo abbonamento non si rinnova, avrai un periodo di grazia di 3 giorni prima che il tag cambi.';

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
  String get fluxerTagUpdated => 'Nome utente aggiornato';

  @override
  String get fluxerTagUpdateFailed =>
      'Impossibile aggiornare Nome utente. Riprova.';

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
      'Rivendica il tuo account per cambiare il tuo Nome utente';

  @override
  String get changeFluxerTag => 'Cambia Nome utente';

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
  String profilePreviewMemberSince(String productName) {
    return 'Membro $productName dal';
  }

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
  String securityLoginEmailSectionDescription(String productName) {
    return 'Gestisci l\'indirizzo email che usi per accedere a $productName';
  }

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
  String get phoneCountryLabel => 'Paese';

  @override
  String get phoneSearchCountries => 'Cerca Paesi...';

  @override
  String get phoneNumberRequired => 'Numero di telefono obbligatorio';

  @override
  String get phoneEnterValidNumber =>
      'Inserisci un numero di cellulare valido.';

  @override
  String get phoneCannotBeUsed =>
      'Questo numero di telefono non può essere usato. Prova un altro numero di cellulare o contatta l\'assistenza.';

  @override
  String get phoneAlreadyUsed =>
      'Questo numero di telefono è già stato utilizzato. Prova un altro numero o contatta l\'assistenza.';

  @override
  String get phoneCodeDidNotWork =>
      'Il codice non ha funzionato. Controllalo e riprova.';

  @override
  String get phoneTooManyAttempts =>
      'Troppi tentativi. Attendi un attimo, poi riprova.';

  @override
  String get phoneSmsUnavailable =>
      'La verifica SMS non è disponibile al momento. Riprova più tardi o contatta l\'assistenza.';

  @override
  String get phoneNotEligible =>
      'La verifica telefonica non è disponibile per questo account. Usa un altro metodo o contatta l\'assistenza.';

  @override
  String get phoneCaptchaRequired =>
      'È richiesto un controllo del browser prima della verifica telefonica. Riprova dalla pagina di accesso o contatta il supporto.';

  @override
  String get phoneSomethingWentWrong => 'Si è verificato un errore. Riprova.';

  @override
  String get phoneInboundExpensiveDescription =>
      'L\'invio di un SMS a questo numero di telefono è troppo costoso, quindi ti chiediamo di inviarci un SMS. Puoi anche contattare l\'assistenza per farci rimuovere questo requisito dal tuo account.';

  @override
  String get phoneInboundDefaultDescription =>
      'Dobbiamo verificare il tuo numero di telefono inviandoti un SMS.';

  @override
  String get phoneInboundStepOpenMessaging =>
      'Apri l\'app Messaggi del tuo telefono e crea un nuovo SMS.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'Invia il codice $code a $number.';
  }

  @override
  String get phoneInboundStepWait =>
      'Attendi che riceviamo il tuo messaggio. Potrebbe volerci un minuto.';

  @override
  String get phoneInboundGetNewCode => 'Ricevi nuovo codice';

  @override
  String get phoneInboundChallengeCodeLabel => 'Codice da inviare';

  @override
  String get phoneInboundOurNumberLabel => 'Invia a';

  @override
  String get requiredActionTitle => 'Verifica dell\'account richiesta';

  @override
  String requiredActionIntroGeneric(String productName) {
    return 'Completa la verifica richiesta per continuare a usare $productName.';
  }

  @override
  String get requiredActionIntroPhone =>
      'La tua registrazione richiede un controllo anti-spam aggiuntivo prima di poter continuare.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return 'Verifica la tua email o il tuo telefono per continuare a usare $productName.';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return 'Completa i passaggi di verifica dell\'email e del telefono richiesti qui sotto per continuare a usare $productName.';
  }

  @override
  String get requiredActionChooseMethodTitle => 'Scegli un metodo di verifica';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return 'Completa uno dei percorsi di verifica qui sotto per continuare a usare $productName.';
  }

  @override
  String get requiredActionUseEmail => 'Usa l\'email';

  @override
  String get requiredActionUsePhone => 'Usa il telefono';

  @override
  String get requiredActionCheckEmailTitle => 'Controlla la tua email';

  @override
  String get requiredActionCheckEmailDescription =>
      'Abbiamo inviato un link di verifica al tuo indirizzo email. Aprilo per continuare.';

  @override
  String get requiredActionResendVerificationEmail =>
      'Invia di nuovo l\'email di verifica';

  @override
  String get requiredActionVerificationEmailSent =>
      'Email di verifica inviata. Controlla la tua casella di posta.';

  @override
  String get requiredActionSignOut => 'Esci';

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
  String get networkErrorMessage => 'Qualcosa è andato storto. Riprova.';

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
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count settimane fa',
      one: '1 settimana fa',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'tra $count minuti',
      one: 'tra 1 minuto',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'tra $count ore',
      one: 'tra 1 ora',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'tra $count giorni',
      one: 'tra 1 giorno',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'tra $count settimane',
      one: 'tra 1 settimana',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'tra $count mesi',
      one: 'tra 1 mese',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'tra $count anni',
      one: 'tra 1 anno',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'appena adesso';

  @override
  String get authorizedAppsTitle => 'Applicazioni autorizzate';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Queste applicazioni hanno ottenuto l\'accesso al tuo account $productName.';
  }

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
  String get blockedUsersCopyTag => 'Copia Nome utente';

  @override
  String get blockedUsersCopyId => 'Copia ID utente';

  @override
  String get userProfileLoadError => 'Impossibile caricare il profilo';

  @override
  String get userProfileLoading => 'Caricamento profilo';

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
  String userProfileStaffBadgeTooltip(String productName) {
    return 'Staff $productName';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return 'Team della community $productName';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return 'Partner $productName';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return 'Cacciatore di bug di $productName';
  }

  @override
  String userProfilePlutoniumBadgeTooltip(String productName) {
    return 'Plutonio $productName';
  }

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(
    String productName,
    String date,
  ) {
    return 'Abbonato Plutonio $productName dal $date';
  }

  @override
  String userProfileVisionaryBadgeTooltip(String productName) {
    return 'Visionario $productName';
  }

  @override
  String userProfileVisionaryBadgeSinceTooltip(
    String productName,
    String date,
  ) {
    return 'Visionario $productName dal $date';
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
  String get userProfileRoles => 'Ruoli';

  @override
  String get memberRoleAdd => 'Aggiungi ruolo';

  @override
  String memberRoleRemove(String roleName) {
    return 'Rimuovi il ruolo $roleName';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'Questo utente non ha ruoli in questa community.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'Ancora nessun ruolo. Aggiungi ruoli in $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'Nessun ruolo disponibile';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'Al momento non ci sono ruoli da assegnare in questa community, ma puoi crearne uno nuovo in $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Impostazioni community';

  @override
  String get guildSettingsRolesTab => 'Ruoli';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Ora locale';

  @override
  String get userProfileSameTimeAsYou => 'Il tuo stesso fuso orario';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return '$duration prima di te';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return '$duration indietro rispetto a te';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours ore',
      one: '1 ora',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minuti',
      one: '1 minuto',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours ore',
      one: '1 ora',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minuti',
      one: '1 minuto',
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
  String get iarReportGuildTitle => 'Segnala community';

  @override
  String get iarReportGuildPreconfirmBody =>
      'Se questa segnalazione riguarda un messaggio specifico in questa community, segnala quel messaggio. Le segnalazioni dei messaggi forniscono al nostro team di sicurezza il contesto più chiaro e l\'aggiunta di dettagli nei commenti può aiutarci a esaminarla più velocemente. Continua a segnalare la community nel suo complesso solo se la segnalazione di un messaggio non catturerebbe il problema più ampio.';

  @override
  String get iarContinueToReportCommunity =>
      'Continua a segnalare la community';

  @override
  String get iarPreviewCommunitySubtitle => 'Community';

  @override
  String get iarReasonHarassmentGuildLabel => 'Molestie o abusi mirati';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'Le community facilitano gli attacchi di gruppo o gli abusi mirati.';

  @override
  String get iarReasonHateGuildDescription =>
      'Promuove l\'odio contro gruppi protetti.';

  @override
  String get iarReasonTerrorismLabel => 'Terrorismo o estremismo violento';

  @override
  String get iarReasonTerrorismDescription =>
      'Promuove, recluta o coordina attività estremiste violente.';

  @override
  String get iarReasonMatureContentGuildLabel =>
      'Contenuti per adulti o filtro di sicurezza';

  @override
  String get iarReasonMatureContentGuildDescription =>
      'Contenuti per adulti senza le dovute restrizioni.';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      'Mette in pericolo i minori o ospita contenuti di sfruttamento minorile.';

  @override
  String get iarReasonRaidLabel => 'Coordinamento raid';

  @override
  String get iarReasonRaidDescription =>
      'Coordina raid, attacchi organizzati o molestie contro persone o comunità.';

  @override
  String get iarReasonSpamGuildDescription =>
      'La community esiste per fare spam, truffe o abusi sulla piattaforma.';

  @override
  String get iarReasonMalwareGuildLabel => 'Distribuzione di malware';

  @override
  String get iarReasonMalwareGuildDescription =>
      'Distribuisce malware, ruba credenziali o file dannosi.';

  @override
  String get iarReasonPrivacyGuildLabel => 'Violazione della privacy o doxing';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'Condivide informazioni personali, spia gli utenti o coordina abusi della privacy.';

  @override
  String get iarReasonSelfHarmGuildLabel => 'Incitamento all\'autolesionismo';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'Incoraggia il suicidio, l\'autolesionismo o i disturbi alimentari.';

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
  String get slowmodeStatusEnabled => 'Modalità lenta abilitata';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Modalità lenta attiva ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'La modalità lenta è impostata a $durationLabel, ma sei immune.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'La modalità lenta è impostata a $durationLabel. Attendi prima di inviare un altro messaggio.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'La modalità lenta è impostata a $durationLabel per questo canale.';
  }

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
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName supera il limite di dimensione ($fileSize)';
  }

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
  String get voiceMessageSeekForward => 'Avanza';

  @override
  String get voiceMessageSeekBackward => 'Riavvolgi';

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
  String get chatAttachmentDownloadedToast => 'Salvataggio in foto';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Impossibile scaricare l\'allegato';

  @override
  String get chatAttachmentExpiredTooltip => 'Allegato scaduto';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Espandi ($count righe)',
      one: 'Espandi ($count riga)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Riduci ($count righe)',
      one: 'Riduci ($count riga)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Espandi ($count righe)',
      one: 'Espandi ($count riga)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Comprimi ($count righe)',
      one: 'Comprimi ($count riga)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count righe rimaste)',
      one: '... ($count riga rimasta)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count righe rimaste)',
      one: '... ($count riga rimasta)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'Visualizza file completo';

  @override
  String get chatTextualPreviewChangeLanguage => 'Cambia lingua';

  @override
  String get chatTextualPreviewSearchLanguage => 'Cerca lingua…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Evidenziazione sintassi';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'Nessun risultato trovato';

  @override
  String get chatTextualPreviewMoreOptions => 'Altre opzioni';

  @override
  String get chatTextualPreviewWrapText => 'Testo a capo';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'Il file è troppo grande per l\'anteprima in linea (limite $previewLimitKb KB).';
  }

  @override
  String get chatTextualPreviewLoadError =>
      'Impossibile caricare l\'anteprima.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Testo normale';

  @override
  String get chatTextualPreviewCopy => 'Copia';

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
  String connectionsDescription(String productName) {
    return 'Collega account esterni e domini al tuo profilo $productName. Le connessioni verificate verranno visualizzate sul tuo profilo.';
  }

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
  String get lookAndFeelHdrSectionTitle => 'High Dynamic Range';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Controlla come le immagini HDR vengono visualizzate sui monitor compatibili con HDR.';

  @override
  String get lookAndFeelHdrFullName => 'Gamma dinamica completa';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Visualizza le immagini HDR con la massima luminosità e gamma di colori.';

  @override
  String get lookAndFeelHdrStandardName => 'Gamma standard';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Mappa le immagini HDR all\'intervallo standard, riducendo la luminosità di picco.';

  @override
  String get lookAndFeelHdrDisplayModeLabel => 'Modalità display HDR';

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
  String get lookAndFeelChatFontSizeLabel => 'Dimensione carattere chat';

  @override
  String get lookAndFeelAppZoomTitle => 'Livello zoom app';

  @override
  String get lookAndFeelAppZoomDescription =>
      'Regola il livello di zoom dell\'applicazione.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'Sfondo chat';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'Scegli uno sfondo per la chat. Rimane su questo dispositivo.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'Questa impostazione rimane su questo dispositivo';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'Lo sfondo della chat viene salvato solo su questo dispositivo e non viene sincronizzato con altri dispositivi.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'Predefinito';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'Immagine personalizzata';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Colore $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Gradiente $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'Sfondo attenuato';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'Impossibile impostare questa immagine come sfondo.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Messaggi';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Scegli come visualizzare i messaggi nelle chat.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Spaziatura tra i gruppi di messaggi';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel =>
      'Modalità di visualizzazione messaggi';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Comodo';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Layout spazioso con chiara separazione visiva tra i messaggi.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Compatto';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Massimizza i messaggi visibili con una spaziatura minima.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'Nascondi avatar utente';

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
  String get communityTemporarilyUnavailable =>
      'Community temporaneamente non disponibile';

  @override
  String get guildUnavailableDescription =>
      'Qualcosa è andato storto. Ci stiamo lavorando.';

  @override
  String get guildNotFoundTitle =>
      'Questa non è la community che stai cercando.';

  @override
  String get guildNotFoundDescription =>
      'La community che cerchi potrebbe essere stata eliminata o potresti non avere accesso.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return '$communityName è attualmente accessibile solo ai membri dello staff di $productName';
  }

  @override
  String get guildNavbarTemporarilyUnavailable =>
      'temporaneamente non disponibile';

  @override
  String get lookAndFeelCollapseDMsLabel => 'Comprimi DM in cartella';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'Quando abilitato, i DM non letti nella barra laterale della community vengono compressi in una cartella sul pulsante $productName. Fai clic sul pulsante $productName mentre sei nella pagina DM per espandere o comprimere la cartella.';
  }

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
  String get favoritesAddToSavedMedia => 'Aggiungi ai contenuti salvati';

  @override
  String get favoritesRemoveFromSavedMedia => 'Rimuovi dai media salvati';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Aggiungi ai GIF preferiti tramite URL';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Rimuovi dai GIF preferiti salvati tramite URL';

  @override
  String get savedMediaAddTitle => 'Aggiungi ai contenuti salvati';

  @override
  String get savedMediaFormNameLabel => 'Nome';

  @override
  String get savedMediaFormNameHint => 'I miei media fantastici';

  @override
  String get savedMediaFormAltTextLabel => 'Testo alternativo';

  @override
  String get savedMediaFormAltTextHint => 'Descrivi il contenuto multimediale';

  @override
  String get savedMediaFormTagsLabel => 'Tag';

  @override
  String get savedMediaFormTagsHint => 'divertente, reazione, lavoro';

  @override
  String get savedMediaSaveError => 'Impossibile aggiornare i media salvati.';

  @override
  String get savedMediaNameRequired => 'Il nome è obbligatorio.';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'Come vogliamo salvare i tuoi GIF preferiti?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'Puoi salvare i GIF preferiti come preferiti solo URL o caricarli nei tuoi media salvati. Scegli l\'opzione più adatta al tuo utilizzo. Potrai cambiarla in qualsiasi momento in Impostazioni > Avanzate > Media.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'Preferiti solo URL (predefinito): sincronizzati sui tuoi dispositivi, nessun caricamento, non conta per i media salvati. I media originali potrebbero scomparire se il loro host li rimuove.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Media salvati: caricati, taggabili, ricercabili e persistenti, ma contano per il tuo limite di media salvati.';

  @override
  String get gifFavoriteFirstTimeHint => 'Chiederemo solo una volta.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly => 'Usa solo URL (consigliato)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => 'Usa i media salvati';

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
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'Quando caricati direttamente su $productName';
  }

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
  String get messagesMediaCameraUploadsSectionTitle => 'Caricamenti fotocamera';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Scegli se le foto e i video acquisiti con la fotocamera dell\'app vengono conservati sul tuo dispositivo';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel =>
      'Salva sul dispositivo';

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
  String get accessibilitySaturationTitle => 'Saturazione';

  @override
  String get accessibilitySaturationDescription =>
      'Regola l\'intensità dei colori del tema nell\'app.';

  @override
  String get accessibilityVisualGroupTitle => 'Visivo';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'Sottolinea sempre i link';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Attenua il testo barrato';

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
  String get accessibilityScreenReaderGroupTitle => 'Lettore schermo';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Controlla come $productName funziona con gli screen reader.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Annuncia nuovi messaggi';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Consenti ai lettori schermo di annunciare i nuovi messaggi non appena arrivano nel canale aperto. I suoni di notifica non saranno influenzati.';

  @override
  String get accessibilityTtsGroupTitle => 'Sintesi vocale';

  @override
  String get accessibilityTtsGroupDescription =>
      'Scegli una velocità per il testo parlato.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Velocità di riproduzione vocale';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Riproduci esempio';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Esempio silenzioso';

  @override
  String get accessibilityPreviewButtonLabel => 'Pulsante di anteprima';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'Ecco come appaiono i link: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Utente di anteprima';

  @override
  String get accessibilityKeyboardGroupTitle => 'Tastiera';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Mostra l\'anello di messa a fuoco nel campo di testo della chat';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'Il tasto Esc esce dalla modalità tastiera';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Mostra scorciatoie menu contestuale';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Chiedi conferma prima di avviare chiamate';

  @override
  String get accessibilityAnimationGroupTitle => 'Animazione';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'La riduzione del movimento è attiva, quindi le animazioni dei contenuti sono in pausa per impostazione predefinita. Puoi comunque riattivarle per riprodurle.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel => 'Riproduci emoji animate';

  @override
  String get accessibilityAutoPlayGifsMobileLabel =>
      'Riproduci automaticamente le GIF';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'Riproduci automaticamente le GIF quando $productName è in primo piano';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Riproduzione nonostante il movimento ridotto.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'In pausa per la riduzione del movimento. Attiva per mantenere la riproduzione delle emoji animate.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'In pausa per la riduzione del movimento. Attiva per riprodurre le GIF.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'Disattivato di default su mobile per preservare la durata della batteria e l\'utilizzo dei dati.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Animazioni adesivi';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Preferenze animazione sticker';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Anima sempre';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Gli sticker saranno sempre animati';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Anima all\'interazione';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Gli sticker si animeranno quando li tocchi';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Gli sticker si animeranno quando ci passi sopra o interagisci con essi';

  @override
  String get accessibilityStickerNeverAnimateName => 'Non animare mai';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Gli sticker non verranno mai animati';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Sempre animato nonostante il movimento ridotto.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'La riduzione del movimento limita l\'animazione degli adesivi all\'interazione. Scegli \"Anima sempre\" per ignorare l\'impostazione.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'Per impostazione predefinita, le animazioni si attivano con l\'interazione su mobile per preservare la durata della batteria.';

  @override
  String get accessibilityMotionGroupTitle => 'Movimento';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Sincronizza le impostazioni di riduzione del movimento con il sistema';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Usa la preferenza di movimento ridotto del sistema di questo dispositivo, oppure personalizzala qui sotto.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Riduci movimento';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Disattiva animazioni e transizioni. Attualmente controllato dalle impostazioni di sistema.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Disattiva animazioni e transizioni in tutta l\'app.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Le emoji animate, le GIF e gli sticker restano sotto il tuo controllo nella scheda Animazione.';

  @override
  String get accessibilityConfirmStartCallTitle => 'Avviare la chiamata?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Sei sicuro di voler avviare questa chiamata?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Avvia chiamata';

  @override
  String get accessibilityTtsSampleDescription =>
      'Ascolta la frase di esempio pronunciata alla velocità scelta.';

  @override
  String get accessibilityTtsSampleText =>
      'Doc, vengo dal futuro. Sono qui grazie a una macchina del tempo che hai inventato tu. Ora ho bisogno del tuo aiuto per tornare nel 1985.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'La sintesi vocale non è disponibile su questo dispositivo.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Riproduzione vocale non riuscita. Riprova o controlla che l\'audio sia attivo.';

  @override
  String get ttsSubstitutionUnknownUser => 'utente sconosciuto';

  @override
  String get ttsSubstitutionUnknownRole => 'ruolo sconosciuto';

  @override
  String get ttsSubstitutionUnknownChannel => 'canale sconosciuto';

  @override
  String get ttsSubstitutionCodeBlock => 'blocco di codice';

  @override
  String get ttsSubstitutionSpoiler => 'spoiler';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return '$emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return '/$commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName ha detto: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'In risposta a $replyAuthorName, $authorName ha detto: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName di $description';
  }

  @override
  String get ttsSentSticker => 'ha inviato uno sticker';

  @override
  String get ttsSentAttachment => 'ha inviato un allegato';

  @override
  String ttsSentAttachments(int count) {
    return 'inviato $count allegati';
  }

  @override
  String get ttsSentEmbed => 'ha inviato un embed';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author ha inviato $summary';
  }

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
  String get systemCallJoinTheCall => 'Partecipa alla chiamata';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username ha avviato una chiamata durata $duration.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'Hai perso una chiamata da $username durata $duration.';
  }

  @override
  String systemCallMissed(String username) {
    return 'Hai perso una chiamata da $username.';
  }

  @override
  String get systemCallDurationFewSeconds => 'pochi secondi fa';

  @override
  String get systemCallDurationMinute => 'un minuto';

  @override
  String get systemCallDurationOneYear => '1 anno';

  @override
  String get systemCallDurationOneMonth => '1 mese';

  @override
  String get systemCallDurationOneWeek => '1 settimana';

  @override
  String get systemCallDurationOneDay => '1 giorno';

  @override
  String get systemCallDurationOneHour => '1 ora';

  @override
  String systemCallDurationYears(int count) {
    return '$count anni';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count mesi';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count settimane';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count giorni';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count ore';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count minuti';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Aggiorna $productName per visualizzare questo messaggio.';
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
  String get voiceJoinFailedTitle =>
      'Impossibile partecipare alla chiamata vocale';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Impossibile disconnettere gli altri dispositivi. Riprova tra un momento.';

  @override
  String get voiceChannelEmptyDescription =>
      'Questo è un canale vocale. Connettiti per iniziare a parlare!';

  @override
  String get voiceChannelJoin => 'Unisciti al canale vocale';

  @override
  String get voiceCallJoin => 'Partecipa alla chiamata';

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
  String get voiceControlFlipCamera => 'Inverti fotocamera';

  @override
  String get voiceControlScreenShare => 'Condivisione schermo';

  @override
  String get voiceScreenShareNotificationText => 'Condivisione dello schermo.';

  @override
  String get voiceControlMore => 'Altro';

  @override
  String get voiceControlDisconnect => 'Disconnetti';

  @override
  String get voiceInChat => 'In chat vocale';

  @override
  String get voiceConnectionFailed => 'Connessione non riuscita';

  @override
  String get voiceConnectionRetry => 'Riprova';

  @override
  String get voiceConnectionDismiss => 'Ignora';

  @override
  String get voiceConnectionDisconnected => 'Disconnesso';

  @override
  String voicePingMs(int currentLatency) {
    return 'Ping: $currentLatency ms';
  }

  @override
  String get voiceMeasuringLatency => 'Misurazione latenza...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Vai a $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'Connessione vocale';

  @override
  String get voiceConnectionAdvancedStats => 'Avanzate';

  @override
  String get voiceShowCallAvatars => 'Mostra avatar della chiamata';

  @override
  String get voiceShowConnectionId => 'Mostra ID connessione';

  @override
  String get voiceAudioProcessing => 'Elaborazione audio';

  @override
  String get voiceConnectionSessionSection => 'Sessione';

  @override
  String get voiceConnectionDurationLabel => 'Durata';

  @override
  String get voiceConnectionParticipantsLabel => 'Partecipanti';

  @override
  String get voiceConnectionNetworkSection => 'Rete';

  @override
  String get voiceConnectionPingLabel => 'Ping';

  @override
  String get voiceConnectionJitterLabel => 'Jitter';

  @override
  String get voiceConnectionSendLabel => 'Invia';

  @override
  String get voiceConnectionReceiveLabel => 'Ricezione';

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
  String get userAreaMuteMicrophone => 'Disattiva microfono';

  @override
  String get userAreaUnmuteMicrophone => 'Riattiva microfono';

  @override
  String get userAreaUserSettings => 'Impostazioni utente';

  @override
  String get voiceParticipantMenuViewProfile => 'Visualizza profilo';

  @override
  String get voiceParticipantMenuFocus => 'Metti in evidenza questa persona';

  @override
  String get voiceParticipantMenuUnfocus => 'Togli il focus';

  @override
  String get voiceParticipantMenuCommunityMute => 'Disattiva audio membro';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Disattiva audio community';

  @override
  String get voiceParticipantMenuUserVolume => 'Volume utente';

  @override
  String get voiceParticipantMenuStreamVolume => 'Volume streaming';

  @override
  String get voiceParticipantMenuStopStreaming => 'Smetti di trasmettere';

  @override
  String get voiceParticipantModerationFailed =>
      'Impossibile aggiornare il membro. Riprova.';

  @override
  String get voiceControlChat => 'Chat';

  @override
  String get voiceCallViewModeLabel => 'Visualizza';

  @override
  String get voiceCallViewModeGrid => 'Griglia';

  @override
  String get voiceCallViewModeFocus => 'Concentrazione';

  @override
  String get voicePanelSettingsSectionTitle => 'Impostazioni voce';

  @override
  String get voicePanelUseEarpieceLabel => 'Usa la capsula auricolare';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Mostra solo video';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Mostra solo i partecipanti che hanno la videocamera attiva.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Mostra la mia fotocamera';

  @override
  String get voicePrioritizeSpeakersLabel => 'Dai priorità agli oratori';

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
  String get privacyDashboardProfilePrivacySection => 'Privacy del profilo';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Amici e messaggi diretti';

  @override
  String get privacyDashboardActivitySharingSection => 'Condivisione attività';

  @override
  String get privacyDashboardSensitiveContentSection => 'Contenuti sensibili';

  @override
  String get privacyDashboardDataExportSection => 'Esporta dati';

  @override
  String get privacyDashboardDataDeletionSection => 'Eliminazione dati';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Chi può vedere il tuo profilo completo';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Amici e tutte le community';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Il tuo profilo completo è visibile agli amici e a chiunque nelle tue community';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Solo amici e piccole community';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Il tuo profilo completo è visibile ad amici e membri delle tue community con 200 o meno membri';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Solo amici';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Il tuo profilo completo è visibile solo ai tuoi amici';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Richieste di amicizia';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Tutti';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Consenti a chiunque di inviarti richieste di amicizia';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends => 'Amici di amici';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Consenti agli amici dei tuoi amici di inviarti richieste';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Membri della community';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Consenti ai membri delle community a cui appartieni di inviarti richieste';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Messaggi diretti';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Consenti messaggi diretti dai membri della community';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Consenti ai membri delle community a cui appartieni di inviarti messaggi diretti';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Consenti messaggi diretti dai bot della community';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Consenti ai bot delle community a cui appartieni di inviarti messaggi diretti';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Controlla chi può inviarti richieste di amicizia e messaggi diretti';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Controlla chi può chiamarti e aggiungerti alle chat di gruppo';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Chiamate in arrivo';

  @override
  String get privacyDashboardIncomingCallsDesc => 'Controlla chi può chiamarti';

  @override
  String get privacyDashboardAllowedCallers => 'Chiamanti autorizzati';

  @override
  String get privacyDashboardIncomingCallNobody => 'Nessuno';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Blocca tutte le chiamate in entrata';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Solo amici';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Consenti solo agli amici di chiamarti (consigliato)';

  @override
  String get privacyDashboardIncomingCallCustom => 'Amici + Personalizzato';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Consenti ad amici e gruppi aggiuntivi a tua scelta';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Tutti';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Consenti a chiunque di chiamarti, anche sconosciuti';

  @override
  String get privacyDashboardAdditionalGroups => 'Gruppi aggiuntivi';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'Le persone che sono amiche dei tuoi amici possono chiamarti';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'Le persone delle community in cui siete entrambi possono chiamarti';

  @override
  String get privacyDashboardRingBehavior => 'Comportamento anello';

  @override
  String get privacyDashboardSilentCalls => 'Silenzia le chiamate da tutti';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'Tutte le chiamate notificheranno silenziosamente invece di squillare. Per impostazione predefinita, le chiamate dai non amici sono sempre silenziose.';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Chi può aggiungerti alle chat di gruppo';

  @override
  String get privacyDashboardGroupDmDesc =>
      'Controlla chi può aggiungerti alle chat di gruppo senza chiedere. Chiunque può comunque inviarti link di invito per partecipare.';

  @override
  String get privacyDashboardAllowedInvites => 'Inviti consentiti';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Non permettere a nessuno di aggiungerti a chat di gruppo senza chiedere';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Consenti solo agli amici di aggiungerti senza chiedere (consigliato)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Consenti ad amici e gruppi aggiuntivi di aggiungerti';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Consenti a chiunque di aggiungerti alle chat di gruppo senza chiedere';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'Le persone che sono amiche dei tuoi amici possono aggiungerti alle chat di gruppo';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'Le persone delle community in cui siete entrambi possono aggiungerti alle chat di gruppo';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Attività vocale su Attivi ora';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Condividi la tua attività vocale con gli amici';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Condividere l\'attività vocale con tutti gli amici?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Interrompere la condivisione dell\'attività vocale con tutti gli amici?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Stai per iniziare a condividere la tua attività vocale con tutti i tuoi amici, inclusi quelli futuri. Questo invierà un aggiornamento a tutti loro e potrà essere modificato di nuovo solo tra 24 ore.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Stai per interrompere la condivisione della tua attività vocale con tutti i tuoi amici, inclusi quelli futuri. Questo invierà un aggiornamento a tutti loro e potrà essere modificato di nuovo solo tra 24 ore.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Sì, condividi con tutti gli amici';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm =>
      'Sì, interrompi la condivisione';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Disponibile di nuovo tra $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Condivisione attività vocale aggiornata';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Impossibile aggiornare la condivisione dell\'attività vocale in questo momento';

  @override
  String get privacyDashboardDataExportDesc =>
      'Crea un archivio scaricabile dei dati del tuo account, inclusi messaggi e URL degli allegati. La maggior parte delle persone vuole tutto, ma puoi restringere l\'ambito qui sotto.';

  @override
  String get privacyDashboardExportMyData => 'Esporta i miei dati';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Rimuovi in modo permanente i messaggi che hai inviato in DM, DM di gruppo e community. L\'operazione viene eseguita in background e riceverai un DM al termine.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Elimina i miei messaggi';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Consenti messaggi diretti dai membri della community?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Vuoi bloccare i messaggi diretti dai membri della community?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Consentire ai bot di inviarti messaggi diretti?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Vuoi bloccare i bot che ti inviano messaggi diretti?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Vuoi consentire i messaggi diretti anche dai membri delle tue community esistenti?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Vuoi bloccare anche i messaggi diretti dai membri delle tue community esistenti?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Vuoi consentire anche ai bot delle tue community esistenti di inviarti messaggi diretti?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Vuoi bloccare i bot anche dalle tue community esistenti?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'Puoi anche cambiare questa impostazione per community singola tenendo premuto il nome della community e selezionando Impostazioni privacy.';

  @override
  String get privacyDashboardDmConfirmAllowAll =>
      'Consenti per tutte le community';

  @override
  String get privacyDashboardDmConfirmBlockAll =>
      'Blocca per tutte le community';

  @override
  String get privacyDashboardDmConfirmSkip => 'Salta questo passaggio';

  @override
  String get privacyDashboardDataRequestGoBack => 'Indietro';

  @override
  String get privacyDashboardDataRequestExportTitle => 'Esporta i miei dati';

  @override
  String get privacyDashboardDataRequestDeleteTitle =>
      'Elimina i miei messaggi';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'Lo elaboreremo il prima possibile. Riceverai un\'email quando il tuo archivio sarà pronto.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'Lo elaboreremo il prima possibile. Ti invieremo un messaggio diretto quando sarà fatto.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'Cosa includere';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Tutto';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Esporta ogni messaggio che hai inviato, più tutte le impostazioni del tuo account, le iscrizioni e i metadati.';

  @override
  String get privacyDashboardDataRequestExportCustom =>
      'Selezione personalizzata';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Scegli quali tipi di conversazione, community e intervallo di tempo includere nell\'archivio.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Scegli cosa includere';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Scegli quali tipi di conversazioni eliminare.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Solo i luoghi a cui non posso più accedere';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Elimina solo i messaggi dalle community e dalle chat di gruppo da cui sei uscito o da cui sei stato rimosso.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Quali conversazioni';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Attiva i tipi di conversazioni che vuoi includere.';

  @override
  String get privacyDashboardDataRequestKindDms => 'DM aperti';

  @override
  String get privacyDashboardDataRequestKindDmsClosed => 'DM chiusi';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'DM di gruppo';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Community';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Quali community';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Filtro community';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Includi tutti tranne i selezionati';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude =>
      'Solo quelli selezionati';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'Al momento non fai parte di alcuna community.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Intervallo di tempo';

  @override
  String get privacyDashboardDataRequestDateMode => 'Intervallo di tempo';

  @override
  String get privacyDashboardDataRequestAllTime => 'Sempre';

  @override
  String get privacyDashboardDataRequestCustomRange =>
      'Intervallo personalizzato';

  @override
  String get privacyDashboardDataRequestStartDate => 'Data di inizio';

  @override
  String get privacyDashboardDataRequestEndDate => 'Data di fine';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Lascia un campo vuoto per non impostare un limite per l\'intervallo.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Scegli almeno un tipo di conversazione da includere.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'La data di inizio deve essere precedente alla data di fine.';

  @override
  String get privacyDashboardDataRequestConfirmTitle => 'Rivedi e conferma';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'Creeremo un archivio scaricabile di ogni messaggio che hai inviato e ti invieremo un\'email quando sarà pronto. Il link per il download in quell\'email scadrà dopo 7 giorni.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'Creeremo un archivio scaricabile che corrisponde ai filtri qui sotto e ti invieremo un\'email quando sarà pronto. Il link per il download in quell\'email scade dopo 7 giorni.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Elimina definitivamente i messaggi che corrispondono ai filtri qui sotto. Questa azione non può essere annullata.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'Non sarà possibile recuperare i dati una volta avviata l\'operazione. Ti invieremo un messaggio diretto al termine.';

  @override
  String get privacyDashboardDataRequestRequestExport =>
      'Richiedi esportazione';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Elimina messaggi';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Ambito';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'Conversazioni';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Community';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange =>
      'Intervallo di tempo';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'Nessuno';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'Dal $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'Fino al $end';
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
      other: '# community',
      one: '# community',
    );
    return 'Tutte tranne $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# community',
      one: '# community',
    );
    return 'Solo $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Messaggi diretti aperti';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Messaggi diretti chiusi';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Messaggi diretti (aperti e chiusi)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'DM di gruppo';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Community';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# ore',
      one: '# ora',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minuti',
      one: '# minuto',
    );
    return '$_temp0 e $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# ore',
      one: '# ora',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minuti',
      one: '# minuto',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# secondi',
      one: '# secondo',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed =>
      'Impossibile caricare le impostazioni sulla privacy';

  @override
  String get privacyDashboardRetry => 'Riprova';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Impossibile salvare le impostazioni dei contenuti sensibili.';

  @override
  String get privacyDashboardDataRequestFailed => 'Richiesta non completata.';

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
  String get forwardSendSlowmodeBlocked =>
      'In attesa che la modalità lenta scada in uno o più canali selezionati.';

  @override
  String get slowmodeRateLimitedTitle => 'Modalità lenta attiva';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'La modalità lenta è attiva: attendi $duration prima di inviare un altro messaggio.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'L\'upload diretto è disabilitato durante il slow mode.';

  @override
  String get shareMediaTitle => 'Condividi su';

  @override
  String get shareMediaMessageHint => 'Aggiungi un messaggio facoltativo…';

  @override
  String get shareMediaSendButton => 'Invia';

  @override
  String get shareMediaSuccessToast => 'Media condivisa';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'Condiviso su $count destinazioni';
  }

  @override
  String get shareMediaFailedToast => 'Impossibile condividere i media';

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
  String get chatMessageCopyEmbedText => 'Copia testo incorporato';

  @override
  String get chatMessageTranslate => 'Traduci';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Tradotto da $language';
  }

  @override
  String get chatMessageSeeOriginal => 'Vedi originale';

  @override
  String get chatMessageSeeTranslation => 'Vedi traduzione';

  @override
  String get chatMessageTranslating => 'Traduzione in corso…';

  @override
  String get chatMessageTranslateFailed =>
      'Impossibile tradurre questo messaggio.';

  @override
  String get chatMessageTranslateUnavailable =>
      'La traduzione non è disponibile su questo dispositivo.';

  @override
  String get chatMessageSpeak => 'Leggi messaggio';

  @override
  String get chatMessageStopSpeaking => 'Interrompi la riproduzione';

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
  String get chatMessageOpenLink => 'Apri link';

  @override
  String get chatMessageCopyLink => 'Copia link';

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
  String get chatReactionAddFailed => 'Impossibile aggiungere la reazione';

  @override
  String get chatReactionRemoveFailed => 'Impossibile rimuovere la reazione';

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
  String iarReasonOtherDescription(String productName) {
    return 'Usare solo se viola chiaramente le regole di $productName e non rientra nelle categorie precedenti.';
  }

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
  String get chatMessageDeleteAttachment => 'Elimina allegato';

  @override
  String get chatMessageEditAttachmentAltText => 'Modifica testo alternativo';

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
      other: '$count messaggi bloccati',
      one: '1 messaggio bloccato',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count potenziali messaggi spam',
      one: '1 potenziale messaggio spam',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Risposta nascosta perché l\'autore originale è bloccato.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Risposta nascosta perché l\'autore originale è stato segnalato come spammer.';

  @override
  String get devMarkAsSpamLocally => 'Segna come spam (solo per me)';

  @override
  String get devIgnoreSpamFlag => 'Ignora segnalazione spam';

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
  String get mediaViewerOptions => 'Opzioni media';

  @override
  String get mediaViewerCopyLink => 'Copia link';

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
  String mediaViewerAttachmentThumbnail(int index) {
    return 'Allegato $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Ignora';

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
  String get composerAutocompleteSuggestions => 'Suggerimenti';

  @override
  String get composerAutocompleteCommandsHeading => 'Comandi';

  @override
  String get composerAutocompleteChoicesHeading => 'Scelte';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'Argomenti facoltativi';

  @override
  String get composerAutocompleteChannelsHeading => 'Canali';

  @override
  String get composerAutocompleteMembersHeading => 'Membri';

  @override
  String get composerAutocompleteUsersHeading => 'Utenti';

  @override
  String get composerAutocompleteMentionsHeading => 'Menzioni';

  @override
  String get composerAutocompleteRolesHeading => 'Ruoli';

  @override
  String get composerAutocompleteMediaHeading => 'Media';

  @override
  String get composerAutocompleteStickersHeading => 'Sticker';

  @override
  String get composerAutocompleteGifsHeading => 'GIF';

  @override
  String get composerAutocompleteNoGifs => 'Nessuna GIF trovata';

  @override
  String get composerCommandShrugDescription =>
      'Aggiunge ¯\\_(ツ)_/¯ al tuo messaggio.';

  @override
  String get composerCommandTableflipDescription =>
      'Aggiunge (╯°□°)╯︵ ┻━┻ al tuo messaggio.';

  @override
  String get composerCommandUnflipDescription =>
      'Aggiunge ┬─┬ ノ( ゜-゜ノ) al tuo messaggio.';

  @override
  String get composerCommandMeDescription =>
      'Invia un messaggio di azione (visualizzato in corsivo).';

  @override
  String get composerCommandSpoilerDescription =>
      'Invia un messaggio spoiler (lo racchiude tra tag spoiler).';

  @override
  String get composerCommandTtsDescription =>
      'Invia un messaggio con sintesi vocale.';

  @override
  String get composerCommandNickDescription =>
      'Cambia il tuo nickname in questa community.';

  @override
  String get composerCommandKickDescription =>
      'Rimuovi un membro da questa community.';

  @override
  String get composerCommandBanDescription =>
      'Banna un membro da questa community.';

  @override
  String get composerCommandMsgDescription =>
      'Invia un messaggio diretto a un utente.';

  @override
  String get composerCommandSavedDescription =>
      'Invia un elemento multimediale salvato.';

  @override
  String get composerCommandStickerDescription => 'Invia uno sticker.';

  @override
  String get composerCommandGifDescription => 'Cerca e invia una GIF.';

  @override
  String get composerCommandMemberOption => 'Il membro da prendere di mira.';

  @override
  String get composerCommandReasonOption => 'Motivo (facoltativo).';

  @override
  String get composerCommandMessageOption => 'Il messaggio da inviare.';

  @override
  String get composerCommandQueryOption => 'Cosa cercare.';

  @override
  String get composerCommandNicknameOption =>
      'Il tuo nuovo nickname, o lascia vuoto per reimpostarlo.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'Quanto della cronologia dei messaggi recenti del membro eliminare.';

  @override
  String get composerCommandDeleteMessagesNone => 'Non eliminare';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Giorni precedenti $count';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'Ultime 24 ore';

  @override
  String get composerCommandOptionRequired =>
      'Questa opzione è obbligatoria. Fornisci un valore.';

  @override
  String get composerCommandClear => 'Cancella comando';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'Hai cambiato il tuo nickname in questa community da **$previousNickname** a **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'Utente sconosciuto';

  @override
  String composerCommandMsgFailed(String username) {
    return 'Impossibile inviare un messaggio a **$username**. Potrebbe aver disabilitato i DM o averti bloccato.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count in più';
  }

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
  String get addGuildCreateTitle => 'Crea una community';

  @override
  String get addGuildCreateDescription =>
      'Crea una community per chattare con i tuoi amici.';

  @override
  String get addGuildCreateNameLabel => 'Nome della community';

  @override
  String get addGuildCreateSubmit => 'Crea community';

  @override
  String get addGuildCreateFailed =>
      'Impossibile creare la community. Riprova.';

  @override
  String get addGuildCreateClaimTitle => 'Richiedi il tuo account';

  @override
  String get addGuildCreateClaimDescription =>
      'Devi verificare il tuo account prima di poter creare una community.';

  @override
  String get addGuildCreateVerifyTitle => 'Verifica la tua email';

  @override
  String get addGuildCreateVerifyDescription =>
      'Devi verificare il tuo indirizzo email prima di poter creare una community.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Quando si crea una nuova community, le icone animate non sono supportate. Usa un\'immagine statica.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'Creando una community, accetti di seguire e rispettare le ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return 'Linee guida della community di $productName';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'Questa istanza è una singola community, quindi non è possibile crearne altre.';

  @override
  String get addGuildCreateChangeIcon => 'Cambia icona';

  @override
  String get addGuildCreateIconLabel => 'Icona della community';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Max 10 MB. Consigliato: 512×512px';

  @override
  String get addGuildImportDescription =>
      'Incolla un URL di modello Discord per importarne la struttura in una nuova community.';

  @override
  String get addGuildImportUrlLabel => 'URL del modello';

  @override
  String get addGuildImportUrlInvalid =>
      'Inserisci un URL o un codice modello Discord valido.';

  @override
  String get addGuildImportFetchFailed =>
      'Impossibile recuperare il modello della community. Il modello potrebbe non esistere o il servizio esterno non è disponibile.';

  @override
  String get addGuildImportInvalidResponse =>
      'Questa non sembra una risposta valida per un modello.';

  @override
  String get addGuildImportTemplateLabel => 'Modello';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount testuali, $voiceChannelCount vocali, $categoryCount categorie, $roleCount ruoli';
  }

  @override
  String get addGuildImportRemoveIcon => 'Rimuovi icona';

  @override
  String get addGuildImportTemplateInvalid =>
      'I dati del modello della community non sono validi o sono in formato errato.';

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
  String get channelDetailsFallbackTitle => 'Dettagli';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'DM di gruppo · $count membri';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'Chiudere la conversazione con $name?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'Lasciare $name?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Impostazioni canale';

  @override
  String get channelDetailsGroupSettingsTitle => 'Impostazioni gruppo';

  @override
  String get channelDetailsDmSettingsTitle => 'Impostazioni DM';

  @override
  String get channelDetailsInvitePeople => 'Invita persone';

  @override
  String get channelDetailsCopyLink => 'Copia link';

  @override
  String get channelMenuCopyChannelLink => 'Copia link canale';

  @override
  String get channelMenuCopyRedirectLink => 'Copia link di reindirizzamento';

  @override
  String get channelDetailsAddFriendsToGroup => 'Aggiungi amici al gruppo';

  @override
  String get channelDetailsGroupInvites => 'Inviti di gruppo';

  @override
  String get channelDetailsEditChannel => 'Modifica canale';

  @override
  String get channelDetailsDeleteChannel => 'Elimina canale';

  @override
  String get channelSettingsCategorySettingsTitle => 'Impostazioni categoria';

  @override
  String get channelSettingsEditCategory => 'Modifica categoria';

  @override
  String get channelSettingsTabOverview => 'Panoramica';

  @override
  String get channelSettingsTabPermissions => 'Permessi';

  @override
  String get channelSettingsTabInvites => 'Inviti';

  @override
  String get channelSettingsTabWebhooks => 'Webhook';

  @override
  String get channelSettingsDeleteChannel => 'Elimina canale';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'Sei sicuro di voler eliminare $channelName? Questa azione non può essere annullata.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'Sei sicuro di voler eliminare $categoryName? Questa azione non può essere annullata.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Elimina categoria';

  @override
  String get channelSettingsChannelUpdated => 'Canale aggiornato';

  @override
  String get channelSettingsChannelName => 'Nome canale';

  @override
  String get channelSettingsCategoryName => 'Nome categoria';

  @override
  String get channelSettingsMyCategory => 'La mia categoria';

  @override
  String get categoryExpandCategory => 'Espandi categoria';

  @override
  String get categoryCollapseCategory => 'Comprimi categoria';

  @override
  String get categoryExpandAllCategories => 'Espandi tutte le categorie';

  @override
  String get categoryCollapseAllCategories => 'Comprimi tutte le categorie';

  @override
  String get categoryMuteCategory => 'Disattiva categoria';

  @override
  String get categoryUnmuteCategory => 'Riattiva categoria';

  @override
  String get categoryCopyCategoryId => 'Copia ID categoria';

  @override
  String get categoryIdCopied => 'ID categoria copiato';

  @override
  String get channelSettingsChannelNamePlaceholder => 'generale';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'Argomento';

  @override
  String get channelSettingsTopicPlaceholder =>
      'Aggiungi un argomento a questo canale';

  @override
  String get channelSettingsInsertEmoji => 'Inserisci emoji';

  @override
  String get channelSettingsTopicTooLongTitle =>
      'L\'argomento del canale è troppo lungo.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'Accorcia l\'argomento e riprova.';

  @override
  String get channelSettingsSlowmode => 'Modalità lenta';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Tempo di attesa tra i messaggi. \"$bypassSlowmodePermissionLabel\" può aggirare questa impostazione.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Disattivato';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds secondi';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes minuti';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours ore';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute minuto';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour ora';
  }

  @override
  String get channelSettingsVoiceQuality => 'Qualità della voce';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'Bitrate più alto = qualità migliore e maggiore utilizzo della larghezza di banda.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbps';
  }

  @override
  String get channelSettingsParticipantLimit => 'Limite partecipanti';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Numero massimo di membri che possono unirsi contemporaneamente. 0 significa illimitato.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count partecipanti',
      one: '1 partecipante',
      zero: 'Nessun limite',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Limite connessioni';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Numero massimo di connessioni attive che un membro può mantenere in questo canale.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count connessioni',
      one: '1 connessione',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Regione vocale';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Seleziona una regione voce per questo canale. Automatico utilizza la regione più vicina.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Automatico';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'Impossibile caricare le regioni vocali';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Riprova tra un momento.';

  @override
  String get channelSettingsResetSlider =>
      'Reimposta il cursore al valore predefinito';

  @override
  String get channelSettingsAdvanced => 'Avanzate';

  @override
  String get channelSettingsMatureContentOverride =>
      'Ignora contenuti sensibili';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Ignora l\'impostazione di livello $scopeLevel per questo canale. I contenuti per adulti vengono mostrati dietro un filtro prima dell\'accesso.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Eredita';

  @override
  String get channelSettingsMatureContentOn => 'Attivato';

  @override
  String get channelSettingsMatureContentOff => 'Disattivato';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Segna questo canale per contenuti per adulti.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Lascia questo canale senza restrizioni per contenuti per adulti.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Ereditato da $inheritedSourceLabel: attivo';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Ereditato da $inheritedSourceLabel: disattivato';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'Categoria';

  @override
  String get channelSettingsMatureContentCommunitySource => 'community';

  @override
  String get channelSettingsMatureContentCategoryScope => 'Categoria';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Community';

  @override
  String get channelSettingsContentWarningToggle =>
      'Mostra un avviso sui contenuti in questo canale';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Attiva una richiesta di consenso prima di accedere a questo canale.';

  @override
  String get channelSettingsContentWarningText =>
      'Testo di avviso personalizzato';

  @override
  String get channelSettingsContentWarningDefault => 'Contenuto sensibile.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'Per modificare queste autorizzazioni, devi avere l\'autorizzazione \"$manageChannelsPermissionLabel\".';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'Ti serve il permesso \"$manageRolesPermissionLabel\" per modificare queste autorizzazioni.';
  }

  @override
  String get channelSettingsUnknownRole => 'Ruolo sconosciuto';

  @override
  String get channelSettingsUnknownUser => 'Utente sconosciuto';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides =>
      'Sostituzioni accesso';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Modifica l\'accesso per $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'Torna alle eccezioni';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Configura l\'accesso di base per questo canale';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Configura le eccezioni per questo ruolo';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Configura le eccezioni per questo membro';

  @override
  String get channelSettingsPermissionsSearchPlaceholder =>
      'Cerca autorizzazioni…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Accesso al canale aggiornato';

  @override
  String get channelSettingsPermissionsTitle => 'Controllo accessi';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'Questo canale è sincronizzato con la categoria principale ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'Questo canale non è sincronizzato con la categoria principale ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory =>
      'Sincronizza con la categoria';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'Canale sincronizzato con la categoria principale';

  @override
  String get channelSettingsPermissionsAddOverride => 'Aggiungi eccezione';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Cerca ruoli o membri…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => 'Ruoli e membri';

  @override
  String get channelSettingsDeleteInvite => 'Elimina invito';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Eliminare questo invito? Non si potrà annullare.';

  @override
  String get channelSettingsCopyInviteCode => 'Copia codice invito';

  @override
  String get channelSettingsCopyInviteUrl => 'Copia link d\'invito';

  @override
  String get channelSettingsWebhookCreated => 'Webhook creato';

  @override
  String get channelSettingsWebhookCreateFailed =>
      'Impossibile creare il webhook';

  @override
  String get channelSettingsCreateWebhook => 'Crea webhook';

  @override
  String get channelSettingsInvitesDescription =>
      'Gestisci i link di invito per questo canale.';

  @override
  String get channelSettingsInvitesCreate => 'Crea invito';

  @override
  String get channelSettingsInvitesEmpty => 'Nessun link di invito';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'Questo canale non ha ancora link d\'invito. Creane uno per invitare persone a questo canale.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Si è verificato un errore durante il caricamento dei link di invito per questo canale. Riprova.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Gestisci i webhook in entrata che possono pubblicare messaggi in questo canale.';

  @override
  String get channelSettingsWebhooksEmpty => 'Nessun webhook';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'Nessun webhook configurato per questo canale. Creane uno per consentire alle applicazioni esterne di pubblicare messaggi.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Questo canale non supporta i webhook.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'Ti serve il permesso \"$permission\" per visualizzare e modificare i webhook per questo canale.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'Impossibile caricare i webhook';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Si è verificato un errore durante il caricamento dei webhook per questo canale. Riprova.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Creato da $creator il $date';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'Utente sconosciuto';

  @override
  String get channelSettingsWebhooksAvatar => 'Avatar';

  @override
  String get channelSettingsWebhooksUploadImage => 'Carica immagine';

  @override
  String get channelSettingsWebhooksRemove => 'Rimuovi';

  @override
  String get channelSettingsWebhooksName => 'Nome';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Nome webhook';

  @override
  String get channelSettingsWebhooksChannel => 'Canale';

  @override
  String get channelSettingsWebhooksUrl => 'URL webhook';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Copia URL webhook';

  @override
  String get channelSettingsWebhooksDelete => 'Elimina webhook';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'Impossibile eliminare questo webhook';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'Eliminare questo webhook? Non sarà possibile annullare l\'operazione.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Riprova tra un momento.';

  @override
  String get channelMenuOpenChat => 'Apri chat';

  @override
  String get channelMenuDuplicateChannel => 'Duplica canale';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Reimposta lo stato di accettazione dei contenuti per adulti';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Eliminare i tuoi messaggi in questo canale?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Verranno eliminati definitivamente tutti i messaggi che hai inviato in questo canale. Questa azione non può essere annullata.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Elimina i miei messaggi';

  @override
  String get channelMenuDeletedYourMessages => 'Messaggi eliminati';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'Impossibile eliminare i tuoi messaggi';

  @override
  String get channelDetailsSystemMessage => 'Messaggio di sistema';

  @override
  String get channelDetailsTextChannel => 'Canale testuale';

  @override
  String get channelDetailsVoiceChannel => 'Canale vocale';

  @override
  String get channelDetailsCategory => 'Categoria';

  @override
  String get channelDetailsLinkChannel => 'Collega canale';

  @override
  String get channelDetailsGenericChannel => 'Canale';

  @override
  String get channelDetailsMutedConversation => 'Conversazione disattivata';

  @override
  String get channelDetailsUnmutedConversation => 'Conversazione riattivata';

  @override
  String get channelDetailsMutedChannel => 'Canale disattivato';

  @override
  String get channelDetailsUnmutedChannel => 'Canale riattivato';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Impostazioni notifiche aggiornate';

  @override
  String get channelDetailsTabMembers => 'Membri';

  @override
  String get channelDetailsTabPins => 'Messaggi fissati';

  @override
  String get channelDetailsActionMute => 'Disattiva audio';

  @override
  String get channelDetailsActionUnmute => 'Riattiva audio';

  @override
  String get channelDetailsActionSearch => 'Cerca';

  @override
  String get channelDetailsActionMore => 'Altro';

  @override
  String get channelDetailsMembersEmptyTitle => 'Nessun membro da mostrare';

  @override
  String get channelDetailsMembersEmptyBody =>
      'I membri appariranno qui una volta caricati i dati della community.';

  @override
  String get memberListPermissionDeniedTitle => 'Non puoi vedere i membri';

  @override
  String get memberListPermissionDeniedBody =>
      'Non puoi visualizzare i membri di questo canale in questa community';

  @override
  String get memberListUnavailableTitle => 'Elenco membri non disponibile';

  @override
  String get memberListUnavailableBody =>
      'Gli elenchi dei membri non sono temporaneamente disponibili in questa community';

  @override
  String get channelDetailsPinsLoadFailedTitle => 'Impossibile caricare i pin';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'I membri con il permesso \"Invia messaggi\" possono inviare messaggi che tutti possono vedere.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'Puoi fissare i messaggi in questa conversazione perché tutti li vedano.';

  @override
  String get channelDetailsPinsEndReached => 'Sei arrivato alla fine';

  @override
  String get channelHeaderOpenDetails => 'Apri i dettagli del canale';

  @override
  String get channelHeaderPinnedMessages => 'Messaggi fissati';

  @override
  String get channelHeaderPinnedMessagesUnread => 'Messaggi fissati, non letti';

  @override
  String get channelHeaderMemberList => 'Elenco membri';

  @override
  String get channelHeaderInbox => 'Chat';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Impostazioni notifiche, con audio disattivato';

  @override
  String get channelDetailsSearchTitle => 'Cerca';

  @override
  String get channelDetailsSearchHint => 'Cerca messaggi';

  @override
  String get channelDetailsSearchFilterFrom => 'Da';

  @override
  String get channelDetailsSearchFilterHas => 'Ha';

  @override
  String get channelDetailsSearchFilterIn => 'In';

  @override
  String get channelDetailsSearchFilterMentions => 'Menzioni';

  @override
  String get channelDetailsSearchFilterMore => 'Altro';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Attiva';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count canali';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count utenti';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'Utente';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Bot';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => 'Filtra per canale';

  @override
  String get channelDetailsSearchChannelsHint => 'Cerca canali';

  @override
  String get channelDetailsSearchChannelsEmpty => 'Nessun canale trovato';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Fissato';

  @override
  String get channelDetailsSearchPinnedTrue => 'Solo elementi fissati';

  @override
  String get channelDetailsSearchPinnedFalse => 'Escludi i fissati';

  @override
  String get channelDetailsSearchClearFilter => 'Cancella';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Tipo di autore';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Data';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Modalità data';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Scegli una data';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Link hostname';

  @override
  String get channelDetailsSearchMoreFiltersFileName =>
      'Il nome del file contiene';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'Estensione file';

  @override
  String get channelDetailsSearchContentPoll => 'Sondaggio';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'Messaggi con un sondaggio';

  @override
  String get channelDetailsSearchContentForward => 'Inoltra';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Messaggi inoltrati';

  @override
  String get channelDetailsSearchFilterSort => 'Ordina';

  @override
  String get channelHeaderSearchFiltersTitle => 'Filtri di ricerca';

  @override
  String get channelHeaderSearchRecentTitle => 'Ricerche recenti';

  @override
  String get channelHeaderSearchUsersTitle => 'Utenti';

  @override
  String get channelHeaderSearchChannelsTitle => 'Canali';

  @override
  String get channelHeaderSearchValuesTitle => 'Valori';

  @override
  String get channelHeaderSearchDatesTitle => 'Date';

  @override
  String get channelHeaderSearchDefaultBadge => 'Predefinito';

  @override
  String get channelHeaderSearchClearHistory => 'Cancella';

  @override
  String get channelHeaderSearchFilterDescFrom => 'un utente';

  @override
  String get channelHeaderSearchFilterDescMentions => 'un utente';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'link, embed, immagine, video, audio, file, sticker, …';

  @override
  String get channelHeaderSearchFilterDescBefore =>
      'una data o un intervallo di date';

  @override
  String get channelHeaderSearchFilterDescOn =>
      'una data o un intervallo di date';

  @override
  String get channelHeaderSearchFilterDescDuring =>
      'una data o un intervallo di date';

  @override
  String get channelHeaderSearchFilterDescAfter =>
      'una data o un intervallo di date';

  @override
  String get channelHeaderSearchFilterDescIn => 'un canale';

  @override
  String get channelHeaderSearchFilterDescPinned => 'vero o falso';

  @override
  String get channelHeaderSearchFilterDescAuthorType => 'utente, bot o webhook';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'un nome host, ad es. example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'parte del nome di un file allegato';

  @override
  String get channelHeaderSearchFilterDescFileType =>
      'un\'estensione di file, ad es. png';

  @override
  String get channelHeaderSearchFilterDescSort => 'data o pertinenza';

  @override
  String get channelHeaderSearchFilterDescOrder => 'cresc. o decresc';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString risultati',
      one: '1 risultato',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'Filtra per utente';

  @override
  String get channelDetailsSearchFilterByContent => 'Filtra per contenuto';

  @override
  String get channelDetailsSearchSortBy => 'Ordina risultati per';

  @override
  String get channelDetailsSearchIn => 'Cerca in';

  @override
  String get channelDetailsSearchEmptyTitle => 'Cerca in questa conversazione';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Inserisci testo, un autore o un filtro di contenuto per trovare messaggi.';

  @override
  String get channelDetailsSearchIndexingTitle =>
      'I messaggi sono in fase di indicizzazione';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Riprova tra poco, una volta che la ricerca avrà finito di indicizzare questo ambito.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Nessun risultato';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Prova termini o filtri di ricerca diversi.';

  @override
  String get channelDetailsMembersOnline => 'Online';

  @override
  String get channelDetailsMembersOffline => 'Disconnesso';

  @override
  String get channelDetailsMemberYou => 'Tu';

  @override
  String get channelDetailsSearchUsersHint => 'Cerca utenti';

  @override
  String get channelDetailsSearchUsersTypeToSearch =>
      'Scrivi per cercare membri';

  @override
  String get channelDetailsSearchUsersEmpty => 'Nessun utente trovato';

  @override
  String get channelDetailsSearchUsersNoAvailable =>
      'Nessun utente disponibile';

  @override
  String get channelDetailsDone => 'Fatto';

  @override
  String get channelDetailsHasFilterPrompt =>
      'Mostra i messaggi che contengono:';

  @override
  String get channelDetailsRetry => 'Riprova';

  @override
  String get channelDetailsPinnedMessageTitle => 'Messaggio fissato';

  @override
  String get channelDetailsSearchResultTitle => 'Risultato ricerca';

  @override
  String get channelDetailsJumpToMessage => 'Salta al messaggio';

  @override
  String get channelDetailsUnpinMessage => 'Rimuovi dai preferiti';

  @override
  String get channelDetailsCopyMessageLink => 'Copia link messaggio';

  @override
  String get channelDetailsCopyMessageId => 'Copia ID messaggio';

  @override
  String get channelDetailsMessageUnpinned => 'Messaggio sbloccato';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Comunità attuale';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'DM attuale';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Tutte le community';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild => 'Solo DM';

  @override
  String get channelDetailsSearchScopeAllDms => 'Tutte le chat';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild => 'Solo DM aperti';

  @override
  String get channelDetailsSearchScopeOpenDms => 'DM aperti';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Tutte le chat dirette + Community';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'DM e community aperte';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Cerca solo nella community attuale';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Cerca solo in questa chat';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'In tutte le community in cui ti trovi attualmente';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Solo tra tutte le chat dirette in cui hai partecipato';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'In tutte le chat in cui hai partecipato';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'In tutte le tue chat dirette aperte';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'In tutte le chat dirette aperte';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'In tutte le tue chat private e in tutte le community in cui ti trovi';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'In tutte le chat dirette aperte + in tutte le community in cui sei attualmente';

  @override
  String get channelDetailsSearchSortNewest => 'Dal più recente';

  @override
  String get channelDetailsSearchSortOldest => 'Dal più vecchio';

  @override
  String get channelDetailsSearchSortRelevance => 'Più pertinenti';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Mostra prima i messaggi più recenti';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Mostra prima i messaggi meno recenti';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Mostra prima i messaggi più pertinenti';

  @override
  String get channelDetailsSearchContentImage => 'Caricamento immagine';

  @override
  String get channelDetailsSearchContentVideo => 'Caricamento video';

  @override
  String get channelDetailsSearchContentAudio => 'Caricamento audio';

  @override
  String get channelDetailsSearchContentFile => 'Caricamento file';

  @override
  String get channelDetailsSearchContentLink => 'Link';

  @override
  String get channelDetailsSearchContentEmbed =>
      'Anteprima link o incorporamento';

  @override
  String get channelDetailsSearchContentSticker => 'Adesivo';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Solo immagini caricate';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Solo video caricati';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Solo file audio caricati';

  @override
  String get channelDetailsSearchContentFileDescription =>
      'Qualsiasi allegato caricato';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'URL digitato nel testo del messaggio';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Anteprime risolte e rich embed, non caricamenti';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Sticker allegato al messaggio';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count tipi';
  }

  @override
  String get personalNotesTitle => 'Note personali';

  @override
  String get personalNotesSubtitle =>
      'Il tuo spazio privato per pensieri e promemoria';

  @override
  String groupDmWelcome(String displayName) {
    return 'Benvenuto in $displayName. Aggiungi amici per animare il gruppo.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Modifica gruppo';

  @override
  String get groupDmWelcomeAddFriends => 'Aggiungi amici al gruppo';

  @override
  String get dmGroupInvites => 'Inviti';

  @override
  String get groupDmEditTitle => 'Modifica gruppo';

  @override
  String get groupDmEditDetailsTooltip => 'Modifica dettagli gruppo';

  @override
  String get groupDmGroupName => 'Nome del gruppo';

  @override
  String get groupDmMyGroup => 'Il mio gruppo';

  @override
  String get groupDmGroupNameMaxLength =>
      'Il nome del gruppo non può superare i 100 caratteri';

  @override
  String get groupDmGroupIcon => 'Icona gruppo';

  @override
  String get groupDmUploadIcon => 'Carica icona';

  @override
  String get groupDmChangeIcon => 'Cambia icona';

  @override
  String get groupDmRemoveIcon => 'Rimuovi icona';

  @override
  String get groupDmUpdated => 'Gruppo aggiornato';

  @override
  String get groupDmUpdateFailed =>
      'Impossibile aggiornare il gruppo. Riprova.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Le icone animate non sono supportate. Usa un\'immagine statica.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Le icone animate non sono supportate';

  @override
  String get groupDmIconFileTooLargeTitle =>
      'Il file dell\'icona è troppo grande';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'L\'icona è troppo grande. Scegli un file più piccolo di $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'Formato icona non supportato';

  @override
  String get groupDmUnsupportedIconFormatBody => 'Tipo di file non supportato.';

  @override
  String get groupDmCouldntProcessImage => 'Impossibile elaborare l\'immagine';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'Impossibile elaborare l\'immagine ritagliata. Riprova.';

  @override
  String get groupDmInvalidImage => 'Immagine non valida';

  @override
  String get groupDmInvalidImageBody =>
      'L\'immagine non è valida. Provane un\'altra.';

  @override
  String get groupDmAddFriends => 'Aggiungi';

  @override
  String get groupDmOrSendInvite => 'o invia un invito a un amico:';

  @override
  String get groupDmGenerateInviteLink => 'Genera link d\'invito';

  @override
  String get groupDmCreateInvite => 'Crea';

  @override
  String get groupDmInviteExpires24Hours => 'Il tuo invito scade tra 24 ore';

  @override
  String get groupDmAddFriendFailed =>
      'Non è stato possibile aggiungere questo amico al gruppo. Riprova.';

  @override
  String get groupDmAddFailed => 'Impossibile aggiungere al gruppo';

  @override
  String get groupDmGroupFull =>
      'Questo gruppo è al completo. Rimuovi qualcuno prima di aggiungere altre persone.';

  @override
  String get groupDmRateLimited =>
      'Stai andando troppo veloce. Attendi un momento e riprova.';

  @override
  String get groupDmCreateInviteFailed =>
      'Impossibile creare il link d\'invito';

  @override
  String get groupDmCreateInviteFailedBody =>
      'Non è stato possibile generare un link d\'invito. Riprova.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'Impossibile creare un link di invito. Riprova.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'Non hai il permesso di creare un invito in questo canale.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'Questa community ha raggiunto il limite di inviti.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'La creazione di inviti è temporaneamente disabilitata per questa community.';

  @override
  String get groupDmCopyInviteFailed => 'Impossibile copiare il link d\'invito';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Solo il proprietario del gruppo può gestire gli inviti.';

  @override
  String get groupDmNoInvitesCreated => 'Nessun invito creato';

  @override
  String get groupDmLoadingInvites => 'Caricamento inviti...';

  @override
  String get groupDmInvitesLoadFailed =>
      'Impossibile caricare gli inviti. Riprova.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Revocare questo invito? L\'operazione non può essere annullata.';

  @override
  String get groupDmInviteRevoked => 'Invito revocato';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Creato da $name. Scade tra $time.';
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
  String get composerOpenExpressionPicker => 'Apri il selettore di espressioni';

  @override
  String get composerShowKeyboard => 'Mostra tastiera';

  @override
  String get composerCloseAttachmentPanel => 'Chiudi selezione allegati';

  @override
  String get chatAttachmentPanelPhotos => 'Foto';

  @override
  String get chatAttachmentPanelFiles => 'File';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Accesso alla libreria foto necessario';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Consenti l\'accesso alla libreria foto per sfogliare e allegare foto e video recenti.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Apri impostazioni';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', in invio';

  @override
  String get messageAccessibilityFailedSuffix => ', invio non riuscito';

  @override
  String get messageAccessibilityAttachmentSummary => 'un allegato';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count allegati';
  }

  @override
  String get messageAccessibilityImageSummary => 'un\'immagine';

  @override
  String get messageAccessibilityVideoSummary => 'un video';

  @override
  String get messageAccessibilityAudioSummary => 'un file audio';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'adesivo $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'file $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'un allegato spoiler';

  @override
  String get messageAccessibilityEmbedSummary => 'un\'anteprima';

  @override
  String get messageAccessibilityEmptySummary => 'un messaggio';

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
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => 'Cerca nelle impostazioni...';

  @override
  String get userSettingsSearchFieldLabel => 'Cerca nelle impostazioni';

  @override
  String get userSettingsSearchClear => 'Cancella ricerca';

  @override
  String get userSettingsSearchNoResults => 'Nessuna impostazione trovata';

  @override
  String get userSettingsNavProfile => 'Profilo';

  @override
  String get userSettingsNavSecurityLogin => 'Sicurezza e accesso';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Regali e codici';

  @override
  String get giftSettingsClaimAccountTitle => 'Richiedi il tuo account';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Rivendica il tuo account per riscattare o gestire i codici regalo Plutonium.';

  @override
  String get giftSettingsRedeemTitle => 'Riscatta un regalo';

  @override
  String get giftSettingsRedeemDescription =>
      'Inserisci un codice regalo per riscattare Plutonium per il tuo account.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Inserisci codice regalo…';

  @override
  String get giftSettingsRedeemButton => 'Riscatta';

  @override
  String get giftSettingsRedeemSuccess =>
      'Regalo riscattato con successo. Goditi il tuo Plutonium.';

  @override
  String get giftSettingsPurchasedTitle => 'Regali acquistati';

  @override
  String get giftSettingsPurchasedDescription =>
      'Gestisci i tuoi codici regalo Plutonium acquistati. Condividi l\'URL del regalo con qualcuno di speciale o riscattalo per te!';

  @override
  String get giftSettingsEmptyTitle => 'Ancora nessun regalo';

  @override
  String get giftSettingsEmptyDescription =>
      'Acquista un regalo Plutonium dalla scheda Plutonium da condividere con gli amici.';

  @override
  String get giftSettingsGoToPlutonium => 'Vai a Plutonium';

  @override
  String get giftSettingsLoadFailedTitle =>
      'Impossibile caricare l\'inventario regali';

  @override
  String get giftSettingsLoadFailedDescription => 'Riprova più tardi.';

  @override
  String get giftSettingsTryAgain => 'Riprova';

  @override
  String get giftSettingsGiftUrl => 'URL regalo';

  @override
  String get giftSettingsCopy => 'Copia';

  @override
  String get giftSettingsCopied => 'Copiato';

  @override
  String get giftSettingsGiftUrlCopied => 'URL regalo copiato negli appunti!';

  @override
  String get giftSettingsGiftUrlCopyFailed =>
      'Impossibile copiare l\'URL del regalo';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Acquistato il $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Riscatto il $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Riscatto da $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'Regalo già riscattato';

  @override
  String get giftSettingsRedeemForYourself => 'Riscatta per te';

  @override
  String get giftSettingsShareWithFriend => 'Condividi con un amico';

  @override
  String get premiumPlutoniumTagline =>
      'Sblocca limiti più elevati e funzionalità esclusive, supportando al contempo una piattaforma di comunicazione indipendente.';

  @override
  String get premiumPurchaseMode => 'Modalità di acquisto';

  @override
  String get premiumForMe => 'Per me';

  @override
  String get premiumAsAGift => 'Come regalo';

  @override
  String get premiumMonthly => 'Mensile';

  @override
  String get premiumYearly => 'Annuale';

  @override
  String get premiumPerMonth => 'al mese';

  @override
  String get premiumPerYear => 'all\'anno';

  @override
  String get premiumOneTimePurchase => 'Acquisto una tantum';

  @override
  String get premiumSave17 => 'Risparmia il 17%';

  @override
  String get premiumUpgradeNow => 'Aggiorna ora';

  @override
  String get premiumBuyGift => 'Acquista regalo';

  @override
  String get premiumOneYearGift => 'Regalo 1 anno';

  @override
  String get premiumOneMonthGift => 'Regala 1 mese';

  @override
  String get premiumMostPopular => 'Più popolare';

  @override
  String get premiumScrollPrompt =>
      'Scorri verso il basso per vedere tutti i vantaggi inclusi con Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'Gratis o Plutonium';

  @override
  String get premiumFreeColumn => 'Gratis';

  @override
  String get premiumGiftSectionTitle => 'Regala Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'Condividi l\'esperienza Plutonium con i tuoi amici acquistando un abbonamento regalo.';

  @override
  String get premiumGiftBannerOne =>
      'Hai un nuovo codice regalo che ti aspetta!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'Hai $count nuovi codici regalo in attesa!';
  }

  @override
  String get premiumViewGifts => 'Visualizza regali';

  @override
  String get premiumReadyToUpgrade => 'Vuoi fare l\'upgrade?';

  @override
  String get premiumReadyToBuyGift => 'Vuoi fare un regalo?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Mensile $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Annuale $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 anno $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 mese $price';
  }

  @override
  String get premiumManageSubscription => 'Gestisci abbonamento';

  @override
  String get premiumRedeemGiftCode => 'Riscatta codice regalo';

  @override
  String get premiumGiftBadge => 'Regalo';

  @override
  String get premiumCancelSubscriptionTitle => 'Annullare l\'abbonamento?';

  @override
  String get premiumCancelSubscriptionBody =>
      'Manterrai i tuoi vantaggi fino alla prossima data di rinnovo, poi avrai un periodo di tolleranza di 3 giorni per riabbonarti e mantenere la tua cronologia di abbonato.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Annulla abbonamento';

  @override
  String get premiumKeepSubscription => 'Mantieni abbonamento';

  @override
  String get premiumPurchaseHistoryTitle => 'Cronologia acquisti';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Le tue fatture recenti. Per cambiare il metodo di pagamento del tuo abbonamento, aggiungine o scegline uno nel portale di fatturazione e impostalo come predefinito.';

  @override
  String get premiumManagePaymentMethods => 'Gestisci i metodi di pagamento';

  @override
  String get premiumBillingHistory => 'Cronologia pagamenti';

  @override
  String get premiumSelfServeRefundTitle => 'Rimborso self-service';

  @override
  String get premiumSelfServeRefundButton => 'Rimborsa l\'ultimo acquisto';

  @override
  String get premiumDisclaimerAgreementPrefix =>
      'Acquistando, accetti i nostri ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'Acquistando, hai accettato i nostri ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' e ';

  @override
  String premiumActiveUntil(String date) {
    return 'Attivo fino al $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Annullamento in corso';

  @override
  String premiumCancelsOn(String date) {
    return 'Annullamento il $date. I vantaggi rimangono attivi fino ad allora.';
  }

  @override
  String get premiumReactivateSubscription => 'Riattiva';

  @override
  String premiumGiftedUntil(String date) {
    return 'Regalato fino al $date. Il rinnovo non è automatico.';
  }

  @override
  String get premiumComparisonFeatureColumn => 'Funzionalità';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'Acquistando, accetti i nostri $terms e le nostre $privacy.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Rimborsi self-service disponibili entro 3 giorni dal pagamento, una volta ogni 30 giorni. Il rimborso di un abbonamento ne comporta l\'annullamento. Gli acquirenti UE/SEE rinunciano al diritto di recesso di 14 giorni al momento del checkout per accedere immediatamente ai contenuti. Utilizza il pulsante di rimborso in-app anziché un chargeback. I chargeback possono limitare permanentemente il tuo account. Stripe gestisce il pagamento in modo sicuro. Non vediamo mai il numero completo della tua carta.';

  @override
  String get premiumTermsOfService => 'Condizioni d\'uso';

  @override
  String get premiumPrivacyPolicy => 'Informativa sulla privacy';

  @override
  String get premiumCheckoutStartFailedTitle =>
      'Impossibile avviare il checkout';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Si è verificato un errore durante l\'avvio del checkout. Riprova tra qualche istante.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'Hai un abbonamento regalo. Non si rinnoverà. Puoi riscattare altri codici regalo per estenderlo. Gli abbonamenti ricorrenti possono essere attivati al termine del periodo regalo.';

  @override
  String get premiumPlanUnavailable =>
      'Questo piano non è disponibile. Contatta l\'assistenza.';

  @override
  String get premiumCompletePaymentTitle => 'Completa il pagamento';

  @override
  String get premiumCompletePaymentBody =>
      'Ora verrai reindirizzato a Stripe per completare il pagamento. Torna su Fluxer una volta terminato.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Scegli un metodo di pagamento';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Paga con Pix automatico per autorizzare addebiti ricorrenti direttamente dal tuo conto bancario brasiliano. Oppure scegli usa carta per inserire una carta di credito nella schermata successiva di Stripe.';

  @override
  String get premiumUsePix => 'Usa Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Paga con UPI per impostare un e-mandato conforme alla RBI dalla tua banca indiana. In alternativa, scegli \"usa carta\" per inserire una carta di credito nella schermata successiva di Stripe.';

  @override
  String get premiumUseUpi => 'Usa UPI';

  @override
  String get premiumUseCard => 'Usa la carta';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Impossibile aprire il portale di fatturazione';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Si è verificato un problema durante l\'apertura del portale di fatturazione. Riprova tra qualche istante.';

  @override
  String get premiumAlreadyVisionaryTitle => 'Sei già Visionario';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary include già l\'accesso permanente, quindi non è necessario un abbonamento ricorrente. Puoi comunque acquistare regali per altri.';

  @override
  String get premiumExistingSubscriptionTitle => 'Abbonamento già esistente';

  @override
  String get premiumExistingSubscriptionBody =>
      'Abbiamo trovato un abbonamento Fluxer Plutonium esistente per questo account. Gestiscilo nel portale di fatturazione sicuro per aggiornare i dettagli di pagamento o verificare lo stato del rinnovo. Se hai appena pagato, attendi un minuto e riapri questa pagina.';

  @override
  String get premiumPurchasesDisabledTitle => 'Acquisti non disponibili';

  @override
  String get premiumPurchasesDisabledBody =>
      'Gli acquisti sono disabilitati per questo account. Contatta support@fluxer.app se pensi ci sia un errore.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Rivendica il tuo account per acquistare Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Devi verificare la tua email prima di poter acquistare Fluxer Plutonium.';

  @override
  String get premiumPerkCustomUsernameTag => 'Tag nome utente personalizzato';

  @override
  String get premiumPerkPerCommunityProfiles => 'Profili per community';

  @override
  String get premiumPerkMessageScheduling => 'Pianificazione messaggi';

  @override
  String get premiumPerkProfileBadge => 'Badge del profilo';

  @override
  String get premiumPerkCustomVideoBackgrounds => 'Sfondi video personalizzati';

  @override
  String get premiumPerkEntranceSounds => 'Suoni d\'ingresso';

  @override
  String get premiumPerkCommunities => 'Community';

  @override
  String get premiumPerkMessageCharacterLimit =>
      'Limite di caratteri per messaggio';

  @override
  String get premiumPerkBookmarkedMessages => 'Messaggi salvati';

  @override
  String get premiumPerkFileUploadSize => 'Dimensione caricamento file';

  @override
  String get premiumPerkEmojiStickerPacks => 'Pacchetti di emoji e sticker';

  @override
  String get premiumPerkSavedMedia => 'Media salvati';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Usa emoji animate';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Accesso globale a emoji e sticker';

  @override
  String get premiumPerkVideoQuality => 'Qualità video';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Avatar animati e banner del profilo';

  @override
  String get premiumPerkEarlyAccess => 'Accesso anticipato alle nuove funzioni';

  @override
  String get premiumPerkCustomThemes => 'Temi personalizzati';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Fino a 4K/60fps';

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
  String get userSettingsNavShortcuts => 'Scorciatoie';

  @override
  String get audioAndVideoAudioSectionTitle => 'Audio';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'Configura il tuo microfono, gli altoparlanti e l\'elaborazione della voce.';

  @override
  String get audioAndVideoVideoSectionTitle => 'Video';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'Configura la qualità della tua fotocamera e della condivisione dello schermo.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle =>
      'Comportamento durante le chiamate';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Controlla le richieste di conferma durante le chiamate vocali e video.';

  @override
  String get audioAndVideoInputDeviceLabel => 'Dispositivo di input';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Dispositivo di output';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'Predefinito';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Usa altoparlante';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'Quando disattivato, l\'audio viene riprodotto tramite la capsula auricolare o le cuffie collegate.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Volume ingresso';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Volume d\'uscita';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Elaborazione voce';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Voce focalizzata';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Consigliato. Migliora l\'audio del microfono per una voce più chiara.';

  @override
  String get audioAndVideoDirectInputLabel => 'Input diretto';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Invia l\'audio senza modifiche. Ideale se usi software audio esterni.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Personalizzato';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Regola tu stesso ogni impostazione: soppressione del rumore, cancellazione dell\'eco e guadagno.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Soppressione rumore';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Migliorata';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Standard';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Nessuno';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Cancellazione dell\'eco';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Controllo automatico del guadagno';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Uniforma il volume del tuo microfono. Disattivato quando la soppressione avanzata è attiva.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Prova microfono';

  @override
  String get audioAndVideoMicTestStartLabel => 'Avvia test microfono';

  @override
  String get audioAndVideoMicTestStopLabel => 'Interrompi test microfono';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return 'A $productName serve l\'accesso al microfono per testare il tuo input.';
  }

  @override
  String get audioAndVideoCameraLabel => 'Fotocamera';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Rifletti fotocamera';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'Qualità fotocamera';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'Qualità della condivisione schermo';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Frequenza fotogrammi';

  @override
  String get audioAndVideoFrameRate15Label => '15 FPS';

  @override
  String get audioAndVideoFrameRate30Label => '30 FPS';

  @override
  String get audioAndVideoFrameRate60Label => '60 FPS';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080p e 60 FPS richiedono $premiumProductName.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Questa istanza attualmente consente la condivisione dello schermo fino a 720p a 30 FPS.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return '$productName ha bisogno dell\'accesso al microfono per elencare i tuoi dispositivi.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return '$productName ha bisogno dell\'accesso alla fotocamera per elencare i tuoi dispositivi.';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'Non chiedere quando nascondo la mia fotocamera';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'Non chiedere quando nascondo la mia condivisione schermo';

  @override
  String get userSettingsNavNotifications => 'Notifiche';

  @override
  String get notificationsGeneralSectionTitle => 'Generale';

  @override
  String get notificationsEnableNotificationsLabel => 'Abilita notifiche';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Ricevi una notifica quando ricevi messaggi. Potrebbe essere necessario abilitare le notifiche per $productName nelle impostazioni del tuo dispositivo. Per i controlli per canale/community, apri le impostazioni di notifica dal menu di una community.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Abilita le notifiche desktop';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Usa il centro notifiche del sistema operativo. Per i controlli delle singole chat/community, fai clic con il tasto destro sull\'icona di una community e apri le impostazioni delle notifiche.';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'Abilita le notifiche del browser';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'Ricevi una notifica quando ricevi messaggi. Potrebbe essere necessario abilitare le notifiche nelle impostazioni del browser. Per i controlli per canale/community, fai clic destro sull\'icona di una community e apri le impostazioni di notifica.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Timeout inattività notifiche push';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName evita di inviare notifiche push ai tuoi dispositivi mobili quando sei al computer. Scegli per quanto tempo devi essere inattivo sul desktop prima di ricevere le notifiche push.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute minuto';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes minuti';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle =>
      'Preferenze menzioni';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Preferenze menzioni nelle risposte';

  @override
  String get notificationsMentionNoPreferenceName => 'Nessuna preferenza';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Rispetta l\'intenzione del mittente, senza avvisi quando attiva o disattiva la menzione @';

  @override
  String get notificationsMentionPreferMentionName => 'Preferisci @menzionare';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Risposte predefinite per menzionarti e avvisare il mittente se la disattiva';

  @override
  String get notificationsMentionPreferNoMentionName =>
      'Preferisci nessuna menzione';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Le risposte predefinite ometteranno la @menzione e avviseranno il mittente se la abilita';

  @override
  String get notificationsTtsSectionTitle => 'Notifiche con sintesi vocale';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'Abilita la riproduzione vocale /tts';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'Fai leggere il tuo messaggio ad alta voce da /tts. Disattivando l\'impostazione, questi comandi rimarranno come testo normale.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Regola la velocità di riproduzione in ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Accessibilità';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle =>
      'Narrazione automatica dei messaggi';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Converte il contenuto in arrivo in parlato, indipendentemente dal fatto che provenga da /tts.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Ogni canale';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Ogni messaggio in arrivo verrà letto ad alta voce, indipendentemente dal canale aperto.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Solo canale attivo';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Legge solo il canale che stai visualizzando. La lettura ti segue tra i canali.';

  @override
  String get notificationsTtsModeNeverName => 'Mai in automatico';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Rimani in silenzio a meno che qualcuno non esegua /tts manualmente.';

  @override
  String get notificationsTtsModeAriaLabel =>
      'Leggi tutti i messaggi ad alta voce';

  @override
  String get notificationsSoundsSectionTitle => 'Suoni';

  @override
  String get notificationsMasterVolumeLabel => 'Volume principale';

  @override
  String get notificationsMasterVolumeDescription =>
      'Imposta il livello per ogni effetto sonoro. Le impostazioni personalizzate per i singoli suoni ignorano questa impostazione.';

  @override
  String get notificationsResetToDefaultVolume =>
      'Ripristina volume predefinito';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Disattiva tutti i suoni di notifica';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Le impostazioni audio delle notifiche esistenti verranno mantenute.';

  @override
  String get notificationsShowMoreSoundEffects => 'Mostra più effetti sonori';

  @override
  String get notificationsShowFewerSoundEffects => 'Mostra meno effetti sonori';

  @override
  String get notificationsPreviewSound => 'Riproduci suono';

  @override
  String get notificationsPerSoundVolumeTitle => 'Volume per suono';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Imposta volumi personalizzati per i singoli suoni. I suoni senza un\'impostazione personalizzata seguono il volume principale.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Override del volume personalizzato attivi: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Segui master • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'Ripristina $label al volume principale';
  }

  @override
  String get notificationsResetAllOverrides => 'Ripristina tutte le modifiche';

  @override
  String notificationsMuteSound(String label) {
    return 'Disattiva $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'Attiva $label';
  }

  @override
  String get notificationsSoundMessage => 'Notifiche messaggi community';

  @override
  String get notificationsSoundDirectMessage => 'Notifiche messaggi diretti';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Notifiche messaggi canale attuale';

  @override
  String get notificationsSoundMute => 'Audio disattivato';

  @override
  String get notificationsSoundUnmute => 'Audio riattivato';

  @override
  String get notificationsSoundDeaf => 'Audio disattivato';

  @override
  String get notificationsSoundUndeaf => 'Audio riattivato';

  @override
  String get notificationsSoundUserJoin => 'L\'utente si unisce al canale';

  @override
  String get notificationsSoundUserLeave =>
      'L\'utente ha abbandonato il canale';

  @override
  String get notificationsSoundUserMove => 'Utente ha spostato il canale';

  @override
  String get notificationsSoundViewerJoin => 'Spettatore si unisce allo stream';

  @override
  String get notificationsSoundViewerLeave => 'Spettatore abbandona lo stream';

  @override
  String get notificationsSoundVoiceDisconnect => 'Voce disconnessa';

  @override
  String get notificationsSoundIncomingRing => 'Chiamata in arrivo';

  @override
  String get notificationsSoundCameraOn => 'Fotocamera attiva';

  @override
  String get notificationsSoundCameraOff => 'Fotocamera disattivata';

  @override
  String get notificationsSoundScreenShareStart => 'Avvio condivisione schermo';

  @override
  String get notificationsSoundScreenShareStop =>
      'Interrompi condivisione schermo';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'Impossibile aggiornare il timeout delle notifiche push. Riprova.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Impossibile aggiornare la preferenza per le menzioni. Riprova.';

  @override
  String get notificationsPermissionDeniedTitle => 'Notifiche bloccate';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'Impossibile attivare le notifiche. Concedi l\'autorizzazione per le notifiche per continuare.';

  @override
  String get userSettingsNavLanguageAndTime => 'Lingua e ora';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Lingua dell\'interfaccia';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Scegli la lingua da usare nell\'app';

  @override
  String get languageAndTimeOpenLanguageSettings =>
      'Apri le impostazioni della lingua';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Formato ora';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Scegli come visualizzare l\'ora nell\'app';

  @override
  String get languageAndTimeTimeFormatSelectionLabel => 'Selezione formato ora';

  @override
  String get languageAndTimeTimeFormatAuto => 'Automatico';

  @override
  String get languageAndTimeTimeFormat12Hour => '12 ore';

  @override
  String get languageAndTimeTimeFormat24Hour => '24 ore';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'Lingua dell\'app: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Lingua di sistema: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Usa le impostazioni internazionali del sistema per il formato dell\'ora';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'Impossibile aggiornare il formato dell\'ora';

  @override
  String get userSettingsNavDefaultApps => 'App predefinite';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Browser web';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Scegli quale browser si apre quando tocchi un link.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'Se un\'app è installata per un sito, i link si apriranno prima in quell\'app.';

  @override
  String get defaultAppsWebBrowserInApp => 'Browser in-app';

  @override
  String get defaultAppsWebBrowserExternal => 'Browser esterno';

  @override
  String get userSettingsNavAdvanced => 'Avanzate';

  @override
  String get advancedPerformanceReportingTitle => 'Segnalazione prestazioni';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'Aiuta a migliorare $productName condividendo dati anonimi su crash e prestazioni.';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'Invia segnalazioni di crash e prestazioni';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'Tutti i dati segnalati sono anonimi e vengono inviati solo al servizio di monitoraggio di $productName; non vengono utilizzati provider di terze parti.';
  }

  @override
  String get advancedSettingsConfigure => 'Configura';

  @override
  String get advancedSettingsCategoryPrivacy => 'Privacy';

  @override
  String get advancedSettingsCategoryAppearance => 'Aspetto';

  @override
  String get advancedSettingsCategoryAccessibility => 'Accessibilità';

  @override
  String get advancedSettingsCategoryChat => 'Chat';

  @override
  String get advancedSettingsCategoryMedia => 'Media';

  @override
  String get advancedSettingsCategoryVoice => 'Voce';

  @override
  String get advancedSettingsCategoryDeveloper => 'Sviluppatore';

  @override
  String get advancedSettingEnableTextSelectionLabel =>
      'Abilita selezione testo';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Consenti la selezione del testo nell\'app';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Abilita le miniature per la navigazione nei video';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Miniatura o fotogramma in diretta durante la riproduzione del video';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Feedback aptico';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Feedback aptico per tocchi e azioni. Non verrà sincronizzato tra i dispositivi.';

  @override
  String get advancedSettingShowNekoLabel => 'Mostra Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'Gatto Neko che insegue il cursore';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Mostra Neko nell\'input della chat';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Animazione zoom all\'avvio';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Rimpicciolisci il logo all\'uscita dalla schermata di avvio';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Suggerimenti tastiera';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Suggerimenti per le scorciatoie da tastiera nei tooltip';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Abilita preferiti';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Mostra i preferiti in tutta l\'app';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Comportamento all\'unione nei canali vocali';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Conferma o doppio clic per partecipare alle chat vocali';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Richiedi doppio clic per unirti ai canali vocali';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Chiedi conferma prima di unirti ai canali vocali';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Invia automaticamente le GIF quando selezionate';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Invia automaticamente le GIF dal selettore senza conferma';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Salva le GIF preferite come media salvati';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Scegli come salvare le GIF preferite';

  @override
  String get advancedSettingMediaButtonsLabel => 'Pulsanti media';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Personalizza quali pulsanti e indicatori vengono visualizzati sugli allegati multimediali e negli elementi incorporati';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Carica gli allegati prima di inviare';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Inizia a caricare gli allegati non appena vengono aggiunti all\'area di testo del messaggio';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Rimuovi i parametri di tracciamento dagli URL';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Rimuovi automaticamente i parametri di tracciamento dagli URL nei messaggi che invii';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'Fidati di tutti i link esterni';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'Salta l\'avviso per i link esterni per tutti i domini';

  @override
  String get advancedSettingSearchEnginesLabel => 'Motori di ricerca';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Configura i motori di ricerca utilizzati per il testo selezionato';

  @override
  String get advancedSettingTranslatorsLabel => 'Traduttori';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Configura i provider di traduzione utilizzati per il testo selezionato';

  @override
  String get advancedSettingReverseImageSearchLabel =>
      'Ricerca immagini inversa';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Fornitori per la ricerca immagini inversa';

  @override
  String get advancedSettingMessageActionBarLabel => 'Barra azioni messaggio';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Personalizza la barra delle azioni che appare quando passi il mouse sui messaggi';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Completamento automatico espressioni';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Definisci cosa viene visualizzato quando digiti i due punti nella casella di testo dei messaggi';

  @override
  String get advancedSettingInputButtonsLabel =>
      'Pulsanti di input del messaggio';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Scegli quali pulsanti visualizzare nella barra di inserimento dei messaggi';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Scorri in basso quando invii un messaggio';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Scegli come spostarsi nella chat dopo aver inviato un messaggio';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Salta la conferma di \"Segna tutti come letti\"';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Segna subito come letti tutti i canali non letti nella posta in arrivo, senza chiedere conferma';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Nascondi i canali silenziati per impostazione predefinita';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Nascondi i canali silenziati dalle barre laterali della community';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'Mostra indicatore GIF';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Mostra indicatore scadenza allegato';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'Mostra pulsante elimina';

  @override
  String get advancedSettingShowMediaDownloadLabel =>
      'Mostra pulsante download';

  @override
  String get advancedSettingShowMediaFavoriteLabel =>
      'Mostra pulsante preferiti';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Mostra il pulsante \"Nascondi anteprime\"';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Mostra barra azioni messaggio';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel =>
      'Mostra solo il pulsante Altro';

  @override
  String get advancedSettingShowQuickReactionsLabel => 'Mostra reazioni rapide';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Abilita Maiusc per espandere';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Mostra le emoji predefinite nel completamento automatico delle espressioni';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Mostra emoji personalizzate nel completamento automatico delle espressioni';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Mostra gli sticker nel completamento automatico delle espressioni';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Mostra i media salvati nel completamento automatico delle espressioni';

  @override
  String get advancedSettingShowGifsButtonLabel => 'Mostra pulsante GIF';

  @override
  String get advancedSettingShowMediaButtonLabel => 'Mostra pulsante media';

  @override
  String get advancedSettingShowStickersButtonLabel =>
      'Mostra il pulsante adesivi';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Mostra il pulsante emoji';

  @override
  String get advancedSettingShowSendButtonLabel => 'Mostra pulsante invio';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Mostra avvisi nuovo dispositivo';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Richiesta di nuovi dispositivi audio';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Controlli del volume della connessione';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Mostra i controlli del volume dei partecipanti per dispositivo nei menu vocali';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Anteprima della condivisione dello schermo';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Anteprima, comportamento della finestra pop-out e dello streaming';

  @override
  String get advancedSettingScreenShareCodecLabel =>
      'Codec di condivisione schermo';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Codec video per la condivisione dello schermo';

  @override
  String get advancedSettingScreenShareCodecAuto => 'Automatico (consigliato)';

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
      'Metti in pausa l\'anteprima della mia condivisione schermo in background';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Nascondi l\'anteprima della mia trasmissione';

  @override
  String get advancedSettingDeveloperModeLabel =>
      'Abilita la modalità sviluppatore';

  @override
  String get advancedSettingDeveloperModeDescription =>
      'Abilita la modalità sviluppatore';

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
  String get advancedSettingTranslatorGoogle => 'Traduttore Google';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel =>
      'Motore di ricerca predefinito';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Scegli quale motore di ricerca usare come predefinito quando cerchi il testo selezionato.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Motori di ricerca integrati';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Abilita o disabilita i motori di ricerca integrati. Quelli abilitati vengono visualizzati nel menu contestuale del messaggio quando il testo è selezionato.';

  @override
  String get advancedSettingCustomSearchEnginesLabel =>
      'Motori di ricerca personalizzati';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Aggiungi i tuoi motori di ricerca con un pattern URL personalizzato. Usa \"$query\" come segnaposto per il testo della ricerca.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel =>
      'Aggiungi motore di ricerca';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Abilita almeno un motore di ricerca qui sotto.';

  @override
  String get advancedSettingRemoveSearchEngineLabel =>
      'Rimuovi motore di ricerca';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'Traduttore predefinito';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Scegli quale traduttore usare per impostazione predefinita quando traduci il testo selezionato.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Traduttori integrati';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Attiva o disattiva i traduttori integrati. I traduttori attivati appaiono nel menu contestuale del messaggio quando il testo è selezionato.';

  @override
  String get advancedSettingCustomTranslatorsLabel =>
      'Traduttori personalizzati';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Aggiungi i tuoi traduttori con un pattern URL personalizzato. Usa \'$query\' come segnaposto per il testo da tradurre.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Aggiungi traduttore';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Abilita almeno un traduttore qui sotto.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Rimuovi traduttore';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Ricerca immagini inversa predefinita';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Scegli quale servizio di ricerca inversa delle immagini usare come predefinito quando cerchi un\'immagine.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Ricerca immagini inversa integrata';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Abilita o disabilita i provider di ricerca inversa di immagini integrati. I provider abilitati vengono visualizzati nel menu contestuale di immagini, avatar, banner, sticker ed emoji.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Ricerca inversa di immagini personalizzata';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Aggiungi i tuoi provider di ricerca per immagini inversa con un pattern URL personalizzato. Usa \"$url\" come segnaposto per l\'URL dell\'immagine.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Aggiungi ricerca inversa immagini';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Abilita almeno un provider di ricerca inversa di immagini qui sotto.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Rimuovi ricerca inversa immagini';

  @override
  String get advancedSettingAddSearchEngineTitle =>
      'Aggiungi motore di ricerca';

  @override
  String get advancedSettingEditSearchEngineTitle =>
      'Modifica motore di ricerca';

  @override
  String get advancedSettingAddTranslatorTitle =>
      'Aggiungi provider di traduzione';

  @override
  String get advancedSettingEditTranslatorTitle =>
      'Modifica provider di traduzione';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Aggiungi motore di ricerca immagini inverso';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Modifica motore di ricerca immagini inverso';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Nome';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'Pattern URL';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'Il mio motore di ricerca';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Il mio traduttore';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'La mia ricerca inversa di immagini';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Usa \'$query\' dove dovrebbe essere inserito il testo della ricerca.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Usa \'$query\' dove deve essere inserito il testo da tradurre.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Usa \'$url\' dove inserire l\'URL dell\'immagine.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired =>
      'Il nome è obbligatorio.';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'Il formato URL è obbligatorio.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'Il modello URL deve contenere il segnaposto \"$query\".';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'Il modello URL deve contenere il segnaposto \"$url\".';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'Il formato URL deve essere un URL valido.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Aggiungi';

  @override
  String get advancedSettingEditSearchProviderAction => 'Modifica';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Rimuovi';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'Sei sicuro di voler rimuovere $engineName?';
  }

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
  String get userSettingsJoinFluxerLabs => 'Partecipa a Fluxer Labs';

  @override
  String get userSettingsNavAppLicenses => 'Licenze app';

  @override
  String get userSettingsAppLicensesDescription =>
      'Software open source utilizzato da questa app. Questa app è creata con Flutter.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'Impossibile caricare le licenze dell\'app.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count licenze',
      one: '1 licenza',
    );
    return '$_temp0';
  }

  @override
  String get userSettingsNavLogOut => 'Esci';

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
  String get savedMessagesEmptyTitle => 'Nessun messaggio salvato';

  @override
  String get savedMessagesEmptyBody =>
      'Aggiungi messaggi ai preferiti per salvarli e leggerli più tardi.';

  @override
  String get savedMessagesEndBody => 'Non c\'è altro da vedere qui.';

  @override
  String get savedMessagesRemoveTooltip => 'Rimuovi dai preferiti';

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
  String get uiSearch => 'Cerca';

  @override
  String get uiStartCall => 'Avvia chiamata';

  @override
  String get uiStartVideoCall => 'Avvia videochiamata';

  @override
  String get uiPlay => 'Riproduci';

  @override
  String get uiPause => 'Pausa';

  @override
  String get uiDownload => 'Scarica';

  @override
  String get uiMoreActions => 'Altre azioni';

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
    return 'Questo notificherà $count membri con il ruolo $roleName. Continuare?';
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
  String get guildNavbarGuildSelected => 'Selezionato';

  @override
  String get guildNavbarGuildUnread => 'non letto';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count menzioni',
      one: '1 menzione',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'disattivato';

  @override
  String get authShowPassword => 'Mostra password';

  @override
  String get authHidePassword => 'Nascondi password';

  @override
  String get chatLoadingMessages => 'Caricamento messaggi';

  @override
  String get friendsMessageFriend => 'Messaggio';

  @override
  String get friendsFriendActions => 'Azioni amico';

  @override
  String get friendsAcceptRequest => 'Accetta richiesta di amicizia';

  @override
  String get friendsDeclineRequest => 'Rifiuta richiesta di amicizia';

  @override
  String get friendsCancelRequest => 'Annulla richiesta di amicizia';

  @override
  String get friendsOpenInbox => 'Chat';

  @override
  String get profileRemoveFriend => 'Rimuovi amico';

  @override
  String get profileUnblockUser => 'Sblocca utente';

  @override
  String get profileAcceptFriendRequest => 'Accetta richiesta di amicizia';

  @override
  String get profileCancelFriendRequest => 'Annulla richiesta di amicizia';

  @override
  String get profileSendFriendRequest => 'Aggiungi amico';

  @override
  String get accountOverflowMenu => 'Opzioni account';

  @override
  String get navHome => 'Home';

  @override
  String get navNotifications => 'Notifiche';

  @override
  String get navYou => 'Tu';

  @override
  String get guildFolderSettingsTitle => 'Impostazioni cartella';

  @override
  String get guildFolderNameLabel => 'Nome cartella';

  @override
  String get guildFolderColorLabel => 'Colore cartella';

  @override
  String get guildFolderShowIconWhenCollapsed => 'Mostra icona quando è chiusa';

  @override
  String get guildFolderIconLabel => 'Icona cartella';

  @override
  String get guildFolderDelete => 'Elimina cartella';

  @override
  String get guildFolderIconFolder => 'Cartella';

  @override
  String get guildFolderIconStar => 'Speciali';

  @override
  String get guildFolderIconHeart => 'Cuore';

  @override
  String get guildFolderIconBookmark => 'Segnalibro';

  @override
  String get guildFolderIconGameController => 'Controller di gioco';

  @override
  String get guildFolderIconShield => 'Protezione';

  @override
  String get guildFolderIconMusicNote => 'Nota musicale';

  @override
  String get guildFolderMarkAsRead => 'Segna cartella come letta';

  @override
  String get guildBulkMuteCommunities => 'Disattiva audio community';

  @override
  String get guildBulkUnmuteCommunities => 'Riattiva audio community';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Impostazioni notifiche community';

  @override
  String get guildBulkCommunityPrivacySettings =>
      'Impostazioni privacy della community';

  @override
  String get guildBulkAllowEveryoneAndHere => 'Consenti @everyone e @here';

  @override
  String get guildBulkAllowRoleMentions => 'Consenti menzioni di ruolo';

  @override
  String get guildBulkEnableMobilePush =>
      'Abilita le notifiche push su cellulare';

  @override
  String get guildBulkDisableMobilePush =>
      'Disattiva le notifiche push su cellulare';

  @override
  String get guildBulkAllowDirectMessages => 'Consenti messaggi diretti';

  @override
  String get guildBulkBlockDirectMessages => 'Blocca messaggi diretti';

  @override
  String get guildBulkAllowBotDirectMessages =>
      'Consenti messaggi diretti dai bot';

  @override
  String get guildBulkBlockBotDirectMessages =>
      'Blocca messaggi diretti dai bot';

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
  String get guildNavbarChannelTypeSelection => 'Selezione del tipo di canale';

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
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'Accessibile solo allo staff di $productName';
  }

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
  String get guildMenuSettingsChannels => 'Canali';

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
  String get guildSettingsRolesNewRole => 'Nuovo ruolo';

  @override
  String get guildSettingsRolesDeleteRole => 'Elimina ruolo';

  @override
  String get guildSettingsRolesBackToRoles => 'Torna ai ruoli';

  @override
  String get guildSettingsBackToSettings => 'Torna alle impostazioni';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Modifica \"$name\"';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Configura impostazioni e permessi ruolo';

  @override
  String get guildSettingsRolesDisplaySection => 'Visualizzazione';

  @override
  String get guildSettingsRolesRoleName => 'Nome del ruolo';

  @override
  String get guildSettingsRolesRoleColor => 'Colore ruolo';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Digita un colore (hex, rgb(), hsl() o nome) o usa il selettore.';

  @override
  String get guildSettingsRolesShowSeparately =>
      'Mostra questo ruolo separatamente';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Elenca i membri con questo ruolo in una sezione dedicata nell\'elenco dei membri.';

  @override
  String get guildSettingsRolesAllowMentions =>
      'Consenti menzioni per questo ruolo';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'I membri con il permesso \"$permission\" potranno sempre menzionare ruoli, indipendentemente da questa impostazione.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Usa questo pulsante per cancellare rapidamente tutte le autorizzazioni.';

  @override
  String get guildSettingsRolesClearPermissions => 'Cancella permessi';

  @override
  String get guildSettingsRolesPermissionsSection => 'Permessi';

  @override
  String get guildSettingsRolesSearchPermissions => 'Cerca autorizzazioni';

  @override
  String get guildSettingsRolesDenseLayout => 'Layout compatto';

  @override
  String get guildSettingsRolesComfyLayout => 'Layout Comfy';

  @override
  String get guildSettingsRolesSwitchToDenseLayout =>
      'Passa al layout compatto';

  @override
  String get guildSettingsRolesSwitchToComfyLayout => 'Passa al layout comodo';

  @override
  String get guildSettingsRolesSingleColumn => 'Colonna singola';

  @override
  String get guildSettingsRolesTwoColumns => 'Due colonne';

  @override
  String get guildSettingsRolesSwitchToSingleColumn =>
      'Passa a colonna singola';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => 'Passa a due colonne';

  @override
  String get guildSettingsRolesNoPermissionsFound => 'Nessun permesso trovato';

  @override
  String get guildSettingsRolesCustomHoistOrder =>
      'Ordine di visualizzazione personalizzato';

  @override
  String get guildSettingsRolesHoistOrder => 'Ordine di visualizzazione';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Ripristina predefiniti';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Trascina i ruoli per personalizzare l\'ordine in cui appaiono nell\'elenco membri.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Nessun ruolo evidenziato. Abilita \"Mostra questo ruolo separatamente\" su un ruolo per vederlo qui.';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'Non puoi modificare questo ruolo perché è il tuo ruolo più alto o superiore al tuo';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Ti serve il permesso \"$permission\" per modificare questi permessi';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'Non puoi modificare un ruolo uguale o superiore al tuo ruolo più alto';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'Non puoi concedere un permesso che non hai';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'Non puoi rimuovere questo permesso perché lo rimuoveresti anche a te stesso';

  @override
  String get guildSettingsRolesUpdatedSuccess =>
      'Ruoli aggiornati correttamente';

  @override
  String get guildSettingsRolesCreatedSuccess => 'Ruolo creato';

  @override
  String get guildSettingsRolesDeletedSuccess => 'Ruolo eliminato';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'Ordine di visualizzazione ripristinato';

  @override
  String get guildSettingsRolesNameRequiredTitle =>
      'Il nome del ruolo è obbligatorio';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Assegna un nome al ruolo prima di salvare.';

  @override
  String get guildSettingsRolesCreateFailedTitle =>
      'Impossibile creare il ruolo';

  @override
  String get guildSettingsRolesUpdateFailedTitle =>
      'Impossibile aggiornare i ruoli';

  @override
  String get guildSettingsRolesDeleteFailedTitle =>
      'Impossibile eliminare il ruolo';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return 'Impossibile eliminare \"$name\". Riprova.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'Impossibile reimpostare l\'ordine di visualizzazione';

  @override
  String get guildSettingsRolesTryAgainInAMoment => 'Riprova tra un momento.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'Sei sicuro di voler eliminare il ruolo $name? I membri con questo ruolo non lo avranno più.';
  }

  @override
  String get permissionCategoryCommunityWide => 'Tutta la community';

  @override
  String get permissionCategoryMessagesMedia => 'Messaggi e media';

  @override
  String get permissionCategoryModeration => 'Moderazione';

  @override
  String get permissionCategoryChannelAccess => 'Accesso al canale';

  @override
  String get permissionCategoryChannelManagement => 'Gestione canali';

  @override
  String get permissionCategoryAudioVideo => 'Audio e video';

  @override
  String get permissionUnknown => 'Permesso sconosciuto';

  @override
  String get permissionAdministrator => 'Amministratore';

  @override
  String get permissionAdministratorDescription =>
      'Concede tutti i permessi e ignora le restrizioni del canale. Molto sensibile.';

  @override
  String get permissionViewActivityLog => 'Visualizza registro attività';

  @override
  String get permissionViewActivityLogDescription =>
      'Visualizza il registro attività della community con modifiche e azioni di moderazione.';

  @override
  String get permissionManageCommunity => 'Gestisci community';

  @override
  String get permissionManageCommunityDescription =>
      'Modifica le impostazioni globali come nome, descrizione e icona.';

  @override
  String get permissionManageRoles => 'Gestire i ruoli';

  @override
  String get permissionManageRolesDescription =>
      'Crea, modifica o elimina i ruoli inferiori al tuo ruolo più alto. Consente anche di modificare le sovrascritture dei permessi del canale.';

  @override
  String get permissionManageChannels => 'Gestisci canali';

  @override
  String get permissionManageChannel => 'Gestisci canale';

  @override
  String get permissionManageChannelDescription =>
      'Rinomina e modifica le impostazioni di questo canale.';

  @override
  String get permissionManagePermissions => 'Gestisci autorizzazioni';

  @override
  String get permissionManagePermissionsDescription =>
      'Modifica le sovrascritture per ruoli e membri in questo canale.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Crea, modifica o elimina webhook per questo canale.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Visualizza l\'elenco dei membri di questo canale.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Gestisci i link di invito per questo canale.';

  @override
  String get permissionOverwriteDeny => 'Nega';

  @override
  String get permissionOverwriteInherit => 'Neutro (ereditato)';

  @override
  String get permissionOverwriteAllow => 'Consenti';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Usa questi pulsanti per impostare rapidamente tutte le autorizzazioni.';

  @override
  String get permissionManageChannelsDescription =>
      'Crea, modifica o elimina canali e categorie.';

  @override
  String get permissionKickMembers => 'Espelli membri';

  @override
  String get permissionBanMembers => 'Banna membri';

  @override
  String get permissionCreateInviteLinks => 'Creare link d\'invito';

  @override
  String get permissionChangeOwnNickname => 'Cambiare il proprio nickname';

  @override
  String get permissionChangeOwnNicknameDescription =>
      'Aggiorna il tuo nickname.';

  @override
  String get permissionManageNicknames => 'Gestisci soprannomi';

  @override
  String get permissionManageNicknamesDescription =>
      'Cambia i soprannomi degli altri membri.';

  @override
  String get permissionCreateEmojiStickers => 'Crea emoji e sticker';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Carica nuove emoji e sticker e gestisci le tue creazioni.';

  @override
  String get permissionManageEmojiStickers => 'Gestisci emoji e sticker';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Modifica o elimina emoji e sticker creati da altri membri.';

  @override
  String get permissionManageWebhooks => 'Gestisci webhook';

  @override
  String get permissionManageWebhooksDescription =>
      'Crea, modifica o elimina webhook.';

  @override
  String get permissionSendMessages => 'Invia messaggi';

  @override
  String get permissionSendTtsMessages => 'Invia messaggi TTS';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Invia messaggi di sintesi vocale.';

  @override
  String get permissionManageMessages => 'Gestisci messaggi';

  @override
  String get permissionManageMessagesDescription =>
      'Elimina i messaggi degli altri membri. L\'aggiunta in evidenza è gestita separatamente.';

  @override
  String get permissionPinMessages => 'Fissa messaggi';

  @override
  String get permissionEmbedLinks => 'Incorpora link';

  @override
  String get permissionAttachFiles => 'Allega file';

  @override
  String get permissionMentionEveryone => 'Usa @everyone/@here e @ruolo';

  @override
  String get permissionMentionEveryoneDescription =>
      'Menziona tutti o qualsiasi ruolo (anche se il ruolo non è impostato come menzionabile).';

  @override
  String get permissionUseExternalEmoji => 'Usa emoji esterni';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Usa emoji da altre community.';

  @override
  String get permissionUseExternalStickers => 'Usa sticker esterni';

  @override
  String get permissionAddReactions => 'Aggiungi reazioni';

  @override
  String get permissionAddReactionsDescription =>
      'Aggiungi nuove reazioni ai messaggi.';

  @override
  String get permissionBypassSlowmode => 'Ignora modalità lenta';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Ignora i limiti di frequenza dei messaggi per canale.';

  @override
  String get permissionTimeOutMembers => 'Metti in pausa i membri';

  @override
  String get permissionTimeOutMembersDescription =>
      'Impedisci ai membri di inviare messaggi, reagire e partecipare alle chat vocali per un certo periodo.';

  @override
  String get permissionViewChannel => 'Visualizza canale';

  @override
  String get permissionViewChannelMembers => 'Visualizza membri del canale';

  @override
  String get permissionViewChannelMembersDescription =>
      'Vedi l\'elenco dei membri per i canali di questa community.';

  @override
  String get permissionConnect => 'Connetti';

  @override
  String get permissionSpeak => 'Parla';

  @override
  String get permissionStreamVideo => 'Trasmetti video';

  @override
  String get permissionUseVoiceActivity => 'Usa l\'attività vocale';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Senza questo permesso, è richiesto il \"Premi per parlare\".';

  @override
  String get permissionPrioritySpeaker => 'Priorità voce';

  @override
  String get permissionMuteMembers => 'Disattiva l\'audio dei membri';

  @override
  String get permissionDeafenMembers => 'Disattiva audio membri';

  @override
  String get permissionMoveMembers => 'Sposta membri';

  @override
  String get permissionMoveMembersDescription =>
      'Trascina i membri tra i canali a cui possono accedere.';

  @override
  String get permissionSetVoiceRegion => 'Imposta regione vocale';

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
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'Questa community non ha ancora webhook. Vai su $channelSettingsPath per crearne uno.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'Ti serve il permesso \"$permission\" per visualizzare e modificare i webhook per questa community.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle =>
      'Impossibile caricare i webhook';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'Si è verificato un errore durante il caricamento dei webhook. Riprova.';

  @override
  String get guildSettingsWebhooksUpdated => 'Webhook aggiornati';

  @override
  String get guildSettingsWebhooksUpdateFailed =>
      'Impossibile aggiornare i webhook';

  @override
  String get guildSettingsUnknownChannel => 'Canale sconosciuto';

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
  String get guildSettingsDiscoveryNotEnoughMembersTitle => 'Pochi membri';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Sono necessari almeno $count membri per fare domanda.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Stato:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'In sospeso';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Approvato';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Rifiutato';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Rimosso';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Motivo: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'La tua community è in Discovery. Puoi aggiornare i dettagli dell\'inserzione qui sotto o ritirarla per rimuoverla.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'La tua candidatura è in fase di revisione. Puoi comunque aggiornare i dettagli dell\'annuncio o ritirare la candidatura.';

  @override
  String get guildSettingsDiscoveryCategory => 'Categoria';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Scegli la categoria che descrive meglio la tua community. Puoi cambiarla in qualsiasi momento.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Lingua principale';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'La lingua parlata dalla maggior parte della tua community. Usata per filtrare i risultati di \"Scopri\".';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Descrizione';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Descrivi la tua community';

  @override
  String get guildSettingsDiscoveryDescriptionRequired =>
      'È richiesta una descrizione.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'La descrizione deve essere di almeno $minLength caratteri.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'La descrizione non può superare i $maxLength caratteri.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Tag';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Fino a $maxTags tag aiutano le persone a trovare la tua community. Vengono visualizzati nella ricerca di Discovery.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'gaming, arte, musica';

  @override
  String get guildSettingsDiscoveryAddTag => 'Aggiungi';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Rimuovi tag $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle =>
      'Impossibile aggiungere il tag';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'I tag devono essere alfanumerici e avere una lunghezza compresa tra 2 e $maxLength caratteri.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'Puoi aggiungere solo fino a $maxTags tag.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Invia domanda';

  @override
  String get guildSettingsDiscoverySave => 'Salva';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Ritira';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Richiesta di scoperta inviata';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Elenco di scoperta aggiornato';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Candidatura per la scoperta ritirata';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Impossibile ritirare la candidatura';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Riprova tra un momento.';

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
  String get guildMembersRecentTitle => 'Membri recenti';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Visualizzazione di $displayedCount di $totalCount membri totali';
  }

  @override
  String get guildMembersSort => 'Ordina';

  @override
  String get guildSettingsMembersSortNewest => 'Dal più recente';

  @override
  String get guildMembersSortOldest => 'Dal meno recente';

  @override
  String get guildMembersColumnName => 'Nome';

  @override
  String get guildMembersColumnMemberSince => 'Membro da';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'Iscritto a $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Metodo di accesso';

  @override
  String get guildMembersColumnRoles => 'Ruoli';

  @override
  String get guildMembersColumnActions => 'Azioni';

  @override
  String get guildMembersFilterMemberSince => 'Filtra per data iscrizione';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Filtra per data di creazione account';

  @override
  String get guildMembersFilterJoinMethod => 'Filtra per metodo di iscrizione';

  @override
  String get guildMembersFilterRoles => 'Filtra per ruoli';

  @override
  String get guildMembersFilterAll => 'Tutti';

  @override
  String get guildMembersFilterPast1Hour => 'Ultima ora';

  @override
  String get guildMembersFilterPast24Hours => 'Ultime 24 ore';

  @override
  String get guildMembersFilterPast7Days => 'Ultimi 7 giorni';

  @override
  String get guildMembersFilterPast2Weeks => 'Ultime 2 settimane';

  @override
  String get guildMembersFilterPast3Weeks => 'Ultime 3 settimane';

  @override
  String get guildMembersFilterPast4Weeks => 'Ultime 4 settimane';

  @override
  String get guildMembersFilterPast3Months => 'Ultimi 3 mesi';

  @override
  String get guildMembersFilterCustomRange => 'Intervallo personalizzato...';

  @override
  String get guildMembersDateRangeTitle => 'Intervallo di date personalizzato';

  @override
  String get guildMembersDateAfter => 'Dopo il';

  @override
  String get guildMembersDateBefore => 'Data precedente';

  @override
  String get guildMembersClearAll => 'Cancella tutto';

  @override
  String get guildMembersRowsPerPage => 'Righe per pagina';

  @override
  String get guildMembersEmptySearch => 'Nessuno corrisponde alla ricerca.';

  @override
  String get guildMembersLoadError =>
      'Si è verificato un errore durante il caricamento dei membri. Riprova più tardi.';

  @override
  String get guildMembersIndexing => 'Indicizzazione dei membri in corso…';

  @override
  String get guildMembersGoToPage => 'Vai alla pagina';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'Vai alla pagina $page';
  }

  @override
  String get guildMembersJumpToPage => 'Vai a pagina';

  @override
  String get guildMembersJoinSourceCreator => 'Creatore della community';

  @override
  String get guildMembersJoinSourceInvite => 'Invita';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Invita ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Invitato da $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'URL personalizzato';

  @override
  String get guildMembersJoinSourceBotInvite => 'Invito bot';

  @override
  String get guildMembersJoinSourcePlatformAdmin =>
      'Amministratore piattaforma';

  @override
  String get guildMembersJoinSourceDiscovery => 'Scoperta';

  @override
  String get guildMembersJoinMethodUnknown => 'Sconosciuto';

  @override
  String get guildMembersCommunityOwner => 'Proprietario della community';

  @override
  String get guildMembersViewAllRoles => 'Visualizza tutti i ruoli';

  @override
  String get guildMembersJoinedJustNow => 'Adesso';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minuti fa',
      one: '1 minuto fa',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ore fa',
      one: '1 ora fa',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count giorni fa',
      one: '1 giorno fa',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Membri';

  @override
  String get guildMembersChannelListSelected => 'Membri selezionati';

  @override
  String get guildSettingsInvitesTitle => 'Inviti';

  @override
  String get guildSettingsInvitesDescription =>
      'Visualizza e revoca i link di invito attivi.';

  @override
  String get guildSettingsInvitesEmpty => 'Nessun invito attivo.';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Questa community non ha ancora link d\'invito. Vai in un canale e crea un invito per invitare persone.';

  @override
  String get guildSettingsInvitesLoadFailedTitle =>
      'Impossibile caricare gli inviti';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Si è verificato un errore durante il caricamento degli inviti. Riprova.';

  @override
  String get guildSettingsInvitesTryAgain => 'Riprova';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Mostra la data di creazione invece della data di scadenza';

  @override
  String get guildSettingsInvitesPauseInvites => 'Metti in pausa gli inviti';

  @override
  String get guildSettingsInvitesEnableInvites => 'Abilita inviti';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Metti in pausa gli inviti per questa community';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Abilita inviti per questa community';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Mettere in pausa gli inviti? I nuovi utenti non potranno più unirsi tramite link di invito finché non li riattiverai. I membri esistenti non saranno interessati.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Abilitare gli inviti? Gli utenti potranno di nuovo unirsi a questa community tramite link di invito.';

  @override
  String get guildSettingsInvitesPause => 'Pausa';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Gli inviti per questa community sono in pausa.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Gli inviti sono in pausa perché $productName ha rilevato un potenziale raid. I nuovi utenti non possono unirsi in questo momento.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Invitante:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Canale:';

  @override
  String get guildSettingsInvitesLabelCode => 'Codice:';

  @override
  String get guildSettingsInvitesLabelUses => 'Usa:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Creato:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Scade:';

  @override
  String get guildSettingsInvitesUnknown => 'Sconosciuto';

  @override
  String get guildSettingsInvitesNoCategory => 'Nessuna categoria';

  @override
  String get guildSettingsInvitesExpired => 'Scaduto';

  @override
  String get guildSettingsInvitesNever => 'Mai';

  @override
  String get guildSettingsInvitesCopyLink => 'Copia link d\'invito';

  @override
  String get guildSettingsInvitesRevoke => 'Revoca invito';

  @override
  String get guildSettingsInvitesRevokeFailedTitle =>
      'Impossibile revocare l\'invito';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'Il link potrebbe essere ancora attivo. Riprova tra un momento.';

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
  String get guildSettingsEmojiSlotsTitle => 'Slot emoji';

  @override
  String get guildSettingsEmojiDropZone => 'Trascina qui i file emoji';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Impossibile caricare le emoji. Riprova più tardi.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'Nessuna emoji trovata per la tua ricerca.';

  @override
  String get guildSettingsEmojiNoSlots => 'Nessuno slot emoji disponibile';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Hai raggiunto il numero massimo di emoji. Elimina alcune emoji esistenti per fare spazio.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'I nomi delle emoji devono avere almeno 2 caratteri e possono usare lettere, numeri e trattini bassi. Le emoji devono essere inferiori a $maxSize. Le immagini statiche vengono ridimensionate automaticamente a 128x128 pixel e compresse. Le emoji animate e i file SVG devono già rispettare il limite.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'Caricamento emoji';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# emoji',
      one: '# emoji',
    );
    return 'Caricamento di $_temp0. Potrebbe richiedere un po\' di tempo.';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'Caricamento emoji non riuscito. Riprova.';

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Non è stato possibile aggiungere alcune emoji';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'Rivedi questi file e riprova con immagini più piccole o più semplici.';

  @override
  String get guildSettingsEmojiRenameTitle => 'Rinomina emoji';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2-32 caratteri, lettere, numeri, trattini bassi.';

  @override
  String get guildSettingsEmojiColumnEmoji => 'Emoji';

  @override
  String get guildSettingsEmojiColumnName => 'Nome';

  @override
  String get guildSettingsEmojiColumnUploader => 'Caricato da';

  @override
  String get guildSettingsEmojiUnknownUploader => 'Sconosciuto';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Elimina emoji';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'Eliminare :$name:? Non è possibile annullare l\'operazione.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Elimina questa emoji da archivio e CDN';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'Il nome dell\'emoji deve contenere almeno 2 caratteri';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'Il nome dell\'emoji deve avere al massimo 32 caratteri';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Nome emoji non valido';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Impossibile rinominare questa emoji';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'Il nome è stato ripristinato. Riprova tra qualche istante.';

  @override
  String get guildSettingsEmojiGoneTitle => 'Questa emoji non esiste più';

  @override
  String get guildSettingsEmojiGoneBody =>
      'Potrebbe essere stato eliminato. Il nome è stato ripristinato a quello precedente.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'Non puoi rinominare questa emoji';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'Non hai il permesso di rinominare questa emoji. Il nome è stato ripristinato a quello precedente.';

  @override
  String get guildSettingsEmojiRateLimitedTitle => 'Stai andando troppo veloce';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'Attendi un momento e prova a rinominare di nuovo.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Impossibile eliminare questa emoji';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'Non puoi eliminare questa emoji';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'Consenti ad altri di clonare le tue emoji';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'Quando abilitato, i membri di altre community possono usare la scorciatoia \"Clona\" con un tocco nell\'app per le tue emoji personalizzate. Questo non impedisce loro di salvare l\'immagine e caricarla autonomamente.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Consenti ad altri di clonare i tuoi sticker';

  @override
  String get guildSettingsCloneStickerDescription =>
      'Quando è attiva, i membri di altre community possono usare la scorciatoia \"Clona\" one-click nell\'app per i tuoi sticker personalizzati. Questo non impedisce loro di salvare l\'immagine e caricarla autonomamente.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Solo i membri con il permesso \"$permission\" possono modificarlo.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'Impossibile aggiornare la clonazione delle emoji';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Impossibile aggiornare la clonazione degli sticker';

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
  String get guildSettingsStickerSlotsTitle => 'Slot sticker';

  @override
  String get guildSettingsStickerUploadTitle => 'Carica sticker';

  @override
  String get guildSettingsStickerDropZone =>
      'Trascina qui un file sticker (uno alla volta)';

  @override
  String get guildSettingsStickerDensity => 'Densità sticker';

  @override
  String get guildSettingsStickerDensityCozy => 'Accogliente';

  @override
  String get guildSettingsStickerDensityCompact => 'Compatta';

  @override
  String get guildSettingsStickersLoadFailedTitle =>
      'Impossibile caricare gli adesivi';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Si è verificato un errore durante il caricamento degli sticker. Riprova.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Nessun adesivo trovato per la tua ricerca.';

  @override
  String get guildSettingsStickersEmptySearch => 'Nessun adesivo trovato';

  @override
  String get guildSettingsStickerNoSlots => 'Nessuno slot sticker disponibile';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Hai raggiunto il numero massimo di sticker. Elimina alcuni sticker esistenti per fare spazio.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Gli adesivi vengono salvati a 320x320 pixel e devono essere inferiori a $maxSize. Le immagini statiche vengono ridimensionate e compresse automaticamente. Gli adesivi animati e i file SVG devono già rispettare il limite.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle =>
      'File sticker non supportato';

  @override
  String get guildSettingsStickerAddTitle => 'Aggiungi sticker';

  @override
  String get guildSettingsStickerEditTitle => 'Modifica sticker';

  @override
  String get guildSettingsStickerNameLabel => 'Nome';

  @override
  String get guildSettingsStickerNameHint => 'Il mio sticker fantastico';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Descrizione';

  @override
  String get guildSettingsStickerDescriptionHint => 'Descrivi l\'adesivo';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Tag ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Aggiungi un tag';

  @override
  String get guildSettingsStickerTagAdd => 'Aggiungi';

  @override
  String get guildSettingsStickerNameRequired => 'Il nome è obbligatorio';

  @override
  String get guildSettingsStickerNameTooShort =>
      'Il nome deve contenere almeno 2 caratteri';

  @override
  String get guildSettingsStickerNameTooLong =>
      'Il nome deve contenere massimo 30 caratteri';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'La descrizione deve contenere massimo 500 caratteri';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'Impossibile creare questo sticker';

  @override
  String get guildSettingsStickerTooLargeTitle => 'Lo sticker è troppo grande';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'Impossibile comprimere lo sticker a sufficienza';

  @override
  String get guildSettingsStickerDeleteTitle => 'Elimina sticker';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'Eliminare \"$name\"? L\'azione non può essere annullata.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Elimina questo sticker dall\'archivio e dalla CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Impossibile eliminare questo sticker';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'Non puoi eliminare questo sticker';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Crea webhook dalle impostazioni del canale. Modificali qui.';
  }

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
  String get guildSettingsInvitesTableExpires => 'Scade';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtra per utente';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtra per azione';

  @override
  String get createDm => 'Crea messaggio diretto';

  @override
  String get createGroupDm => 'Crea gruppo DM';

  @override
  String get createDmNewMessage => 'Nuovo messaggio';

  @override
  String get createDmSelectFriends => 'Seleziona amici';

  @override
  String get createDmChooseFriendsSubtitle =>
      'Scegli gli amici a cui inviare un messaggio.';

  @override
  String get createDmSearchFriends => 'Cerca amici';

  @override
  String get createDmNoFriendsFound => 'Nessun amico trovato';

  @override
  String get createDmNoFriendsYet => 'Non hai ancora amici';

  @override
  String get createDmClaimToStartDms =>
      'Richiedi il tuo account per avviare le conversazioni dirette.';

  @override
  String get createDmVerifyToStartDms =>
      'Verifica la tua email per avviare le chat.';

  @override
  String get createDmVerifyYourEmail => 'Verifica la tua email';

  @override
  String get createDmNewGroup => 'Nuovo gruppo';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Crea un nuovo gruppo con $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'Conferma nuovo gruppo';

  @override
  String get createDmCreateNewGroup => 'Crea nuovo gruppo';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'Rimuovi $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'Hai già un gruppo con questi utenti. Vuoi davvero crearne uno nuovo? Va bene lo stesso!';

  @override
  String get createDmNoActivityYet => 'Nessuna attività ancora';

  @override
  String get createDmSomeUsersCantBeAdded =>
      'Alcuni utenti non possono essere aggiunti';

  @override
  String get createDmCreateWithoutThem => 'Crea senza di loro';

  @override
  String get createDmUnaddableIntro =>
      'Le seguenti persone non possono essere aggiunte a questa chat di gruppo:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Creare la DM di gruppo con i restanti $count destinatari e saltare gli altri?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Nessun altro destinatario con cui creare una chat di gruppo.';

  @override
  String get createDmUnaddableUserNotFound => 'Utente non trovato';

  @override
  String get createDmUnaddableBlocked =>
      'Non puoi inviare messaggi a questo utente';

  @override
  String get createDmUnaddableNotFriends => 'Non nella tua lista amici';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Non può essere aggiunto alle chat di gruppo';

  @override
  String get createDmFailed => 'Impossibile creare la conversazione. Riprova.';

  @override
  String get dmListMessagesTitle => 'Messaggi';

  @override
  String get dmListDirectMessagesTitle => 'Messaggi diretti';

  @override
  String get keybindsSearchShortcuts => 'Cerca scorciatoie';

  @override
  String get keybindSectionDefaults => 'Predefiniti';

  @override
  String get keybindSectionMessages => 'Messaggi';

  @override
  String get keybindSectionNavigation => 'Navigazione';

  @override
  String get keybindSectionDragAndDrop => 'Trascina e rilascia';

  @override
  String get keybindSectionChat => 'Chat';

  @override
  String get keybindSectionVoiceAndVideo => 'Chiamate vocali e video';

  @override
  String get keybindSectionMisc => 'Varie';

  @override
  String get keybindActionShowShortcutsList =>
      'Mostra elenco scorciatoie da tastiera';

  @override
  String get keybindActionCopyText => 'Copia testo';

  @override
  String get keybindActionMarkUnread => 'Segna come non letto';

  @override
  String get keybindActionFocusTextarea => 'Metti a fuoco l\'area di testo';

  @override
  String get keybindActionSwitchCommunities => 'Cambia community';

  @override
  String get keybindActionSwitchChannels => 'Cambia canale';

  @override
  String get keybindActionHistoryBack =>
      'Torna indietro nella cronologia dei canali visitati';

  @override
  String get keybindActionHistoryForward =>
      'Sposta in avanti nella cronologia dei canali visualizzati';

  @override
  String get keybindActionJumpUnreadChannels =>
      'Passa da un canale non letto all\'altro';

  @override
  String get keybindActionJumpMentionChannels =>
      'Passa tra i canali non letti con menzioni';

  @override
  String get keybindActionJumpCurrentCall => 'Vai alla chiamata attuale';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Passa tra l\'ultima community e i messaggi diretti';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Passa alla community o ai messaggi diretti precedenti';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Passa alla community o ai messaggi diretti successivi';

  @override
  String get keybindActionGoToDms => 'Vai ai messaggi diretti';

  @override
  String get keybindActionGoToFirstCommunity => 'Vai alla prima community';

  @override
  String get keybindActionGoToSecondCommunity => 'Vai alla seconda community';

  @override
  String get keybindActionGoToThirdCommunity => 'Vai alla terza community';

  @override
  String get keybindActionGoToFourthCommunity => 'Vai alla quarta community';

  @override
  String get keybindActionGoToFifthCommunity => 'Vai alla quinta community';

  @override
  String get keybindActionGoToSixthCommunity => 'Vai alla sesta community';

  @override
  String get keybindActionGoToSeventhCommunity => 'Vai alla settima community';

  @override
  String get keybindActionGoToEighthCommunity => 'Vai all\'ottava community';

  @override
  String get keybindActionToggleQuickSwitcher =>
      'Attiva/disattiva cambio rapido';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'Crea o unisciti a una community';

  @override
  String get keybindActionStartDragAndDrop => 'Avvia trascinamento';

  @override
  String get keybindActionMove => 'Sposta';

  @override
  String get keybindActionDropItem => 'Rilascia elemento';

  @override
  String get keybindActionCancel => 'Annulla';

  @override
  String get keybindActionMarkCommunityRead => 'Segna la community come letta';

  @override
  String get keybindActionMarkChannelRead => 'Segna il canale come letto';

  @override
  String get keybindActionStartGroupDm => 'Avvia una chat di gruppo';

  @override
  String get keybindActionTogglePinnedMessages =>
      'Mostra/nascondi messaggi fissati';

  @override
  String get keybindActionToggleInbox => 'Attiva/disattiva la posta in arrivo';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Segna come letto il canale principale della posta in arrivo';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Segna tutti i canali della posta in arrivo come letti';

  @override
  String get keybindActionToggleMemberList =>
      'Attiva/disattiva l\'elenco membri o la chat vocale';

  @override
  String get keybindActionToggleEmojiPicker => 'Apri/chiudi la selezione emoji';

  @override
  String get keybindActionToggleGifPicker => 'Apri/chiudi la selezione GIF';

  @override
  String get keybindActionToggleStickerPicker =>
      'Apri/chiudi la selezione adesivi';

  @override
  String get keybindActionScrollChatUp => 'Scorri la chat verso l\'alto';

  @override
  String get keybindActionScrollChatDown => 'Scorri la chat in basso';

  @override
  String get keybindActionJumpOldestUnread =>
      'Vai al messaggio non letto più vecchio';

  @override
  String get keybindActionFocusComposer => 'Metti a fuoco l\'area di testo';

  @override
  String get keybindActionUploadFile => 'Carica un file';

  @override
  String get keybindActionCopyChannelLink => 'Copia link canale';

  @override
  String get keybindActionToggleSavedMedia => 'Mostra/nascondi media salvati';

  @override
  String get keybindActionSendVoiceMessage => 'Invia messaggio vocale';

  @override
  String get keybindActionAnswerCall => 'Rispondi alla chiamata in arrivo';

  @override
  String get keybindActionDeclineCall => 'Rifiuta la chiamata in arrivo';

  @override
  String get keybindActionStartDmCall =>
      'Avvia una chiamata in una chat o in un gruppo';

  @override
  String get keybindActionToggleSoundboard => 'Attiva/disattiva la soundboard';

  @override
  String get keybindActionToggleCompactCallView =>
      'Espandi o comprimi la visualizzazione compatta della chiamata';

  @override
  String get keybindActionPushToTalkPriority => 'Premi per parlare (priorità)';

  @override
  String get keybindActionVoiceActivityPriority => 'Priorità attività vocale';

  @override
  String get keybindActionOpenHelp => 'Apri la guida';

  @override
  String get keybindActionSearchMessages => 'Cerca messaggi';

  @override
  String get keybindActionOpenContextMenu => 'Apri il menu contestuale';

  @override
  String get keybindActionOpenSettings => 'Apri le impostazioni';

  @override
  String get keybindActionOpenThemeStudio =>
      'Apri la finestra a comparsa dello studio temi';

  @override
  String get keybindActionZoomIn => 'Ingrandisci';

  @override
  String get keybindActionZoomOut => 'Riduci zoom';

  @override
  String get keybindActionZoomReset => 'Reimposta zoom';

  @override
  String get clipboardPasteFailed =>
      'Impossibile incollare. Gli appunti erano vuoti o bloccati per questa app.';

  @override
  String get homeQuickActionDms => 'Messaggi diretti';
}
