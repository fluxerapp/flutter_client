// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Galician (`gl`).
class FluxerLocalizationsGl extends FluxerLocalizations {
  FluxerLocalizationsGl([String locale = 'gl']) : super(locale);

  @override
  String get reconnectingTitle => 'Fallamos!';

  @override
  String get reconnectingBody =>
      'Hai un problema cos servidores.\nArrexarase nun segundo!';

  @override
  String get gatewayReconnectingToast => 'Reconectando...';

  @override
  String get gatewayConnectedToast => 'Conectado';

  @override
  String get sessionExpiredToast =>
      'Your session has expired. Please sign in again.';

  @override
  String splashStartupFailed(String error) {
    return 'Fallo ao iniciar: $error';
  }

  @override
  String get retry => 'Tentar de novo';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Conexión perdida';

  @override
  String get splashViewOnStatusPage => 'Ver na páxina de estado';

  @override
  String get splashConnectionIssuesPrompt => 'Problemas de conexión?';

  @override
  String get splashStatusPageLink => 'Páxina de estado';

  @override
  String get splashReadIncident => 'Ler incidente';

  @override
  String get splashIncidentHistory => 'Historial de incidentes';

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
  String get welcomeBack => 'Benvido de volta';

  @override
  String get email => 'Correo electrónico';

  @override
  String get emailInvalid =>
      'Por favor, introduza un enderezo de correo electrónico válido.';

  @override
  String get password => 'Contrasinal';

  @override
  String get forgotPassword => 'Esqueceu o seu contrasinal?';

  @override
  String get logIn => 'Iniciar sesión';

  @override
  String get logInWithPasskey => 'Iniciar sesión cunha chave de acceso';

  @override
  String continueWithSso(String provider) {
    return 'Continuar con $provider';
  }

  @override
  String get ssoRequired => 'Requírese SSO para acceder a esta instancia.';

  @override
  String get organizationSsoProvider =>
      'Inicia sesión co provedor de inicio de sesión único da túa organización.';

  @override
  String get failedToStartSso => 'Fallo ao iniciar SSO';

  @override
  String get ssoCancelled => 'Cancelouse o inicio de sesión SSO';

  @override
  String preferSso(String provider) {
    return 'Prefires usar SSO? Continúa con $provider.';
  }

  @override
  String get logInViaBrowser => 'Iniciar sesión a través do navegador';

  @override
  String get needAccountPrompt => 'Necesitas unha conta? ';

  @override
  String get register => 'Rexistrarse';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Verifica que es humano';

  @override
  String get captchaDescription =>
      'Temos que asegurarnos de que non es un bot. Por favor, completa a verificación a continuación.';

  @override
  String get captchaSwitchToHcaptcha =>
      'Tes problemas? Proba hCaptcha en vez diso';

  @override
  String get captchaSwitchToTurnstile => 'Proba Turnstile en vez diso';

  @override
  String get cancel => 'Cancelar';

  @override
  String get ipAuthCheckEmail => 'Consulta o teu correo electrónico';

  @override
  String ipAuthDescription(String email) {
    return 'Enviamos un correo electrónico cunha ligazón para autorizar este inicio de sesión. Por favor, abre a túa caixa de entrada para $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Conexión perdida';

  @override
  String get ipAuthConnectionLostDescription =>
      'Perdemos a conexión mentres agardabamos a autorización. Por favor, tenta de novo.';

  @override
  String get ipAuthLinkExpired => 'Ligazón de inicio de sesión caducada';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Esta ligazón de autorización caducou. Por favor, inicia sesión de novo.';

  @override
  String get ipAuthResendEmail => 'Reenviar correo electrónico';

  @override
  String get ipAuthResent => 'Reenviado';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Atrás';

  @override
  String get mfaTitle => 'Autenticación de dous factores';

  @override
  String get mfaChooseMethod => 'Elixe un método de verificación';

  @override
  String get mfaMethodTotp => 'Aplicación de autenticación';

  @override
  String get mfaMethodWebauthn => 'Clave de seguranza / Chave de acceso';

  @override
  String get mfaTotpDescription =>
      'Introduce o código de 6 díxitos da túa aplicación de autenticación ou un dos teus códigos de reserva.';

  @override
  String get mfaCodeLabel => 'Código';

  @override
  String get mfaTryAnotherMethod => 'Proba outro método';

  @override
  String get mfaUseSecurityKey =>
      'Proba chave de seguranza / contrasinal en lugar diso';

  @override
  String get accountSelectorTitle => 'Escolle unha conta';

  @override
  String get accountSelectorDescription =>
      'Selecciona unha conta para continuar, ou engade outra.';

  @override
  String get accountAdd => 'Engadir unha conta';

  @override
  String get accountRemove => 'Eliminar';

  @override
  String accountRemoveTitle(String username) {
    return 'Eliminar $username';
  }

  @override
  String get accountRemoveDescription =>
      'Isto eliminará a sesión gardada para esta conta.';

  @override
  String get accountRemoveOnlyDescription =>
      'Isto eliminará a única conta gardada neste dispositivo.';

  @override
  String get accountExpired => 'Caducado';

  @override
  String accountSessionExpired(String identifier) {
    return 'A sesión caducou para $identifier. Inicia sesión de novo.';
  }

  @override
  String get accountManageTitle => 'Xestionar contas';

  @override
  String get accountSwitchFailed =>
      'Non se puido cambiar de conta. Inténtao de novo.';

  @override
  String get profileTabMenuSwitchAccounts => 'Cambiar contas';

  @override
  String get statusChangeSheetTitle => 'Establecer estado';

  @override
  String get statusOnlineStatusSection => 'Estado en liña';

  @override
  String get statusOnline => 'En liña';

  @override
  String get statusIdle => 'Inactivo';

  @override
  String get statusDnd => 'Non molestar';

  @override
  String get statusInvisible => 'Invisible';

  @override
  String get statusOffline => 'Fóra de liña';

  @override
  String get statusUntilIChangeIt => 'Ata que o cambie';

  @override
  String get statusDontClear => 'Non borrar';

  @override
  String get statusFor10Seconds => 'Durante 10 segundos';

  @override
  String get statusClearAfter10Seconds => '10 segundos';

  @override
  String get statusClearAfter15Minutes => '15 minutos';

  @override
  String get statusClearAfter30Minutes => '30 minutos';

  @override
  String get statusClearAfter1Hour => '1 hora';

  @override
  String get statusClearAfter3Hours => '3 horas';

  @override
  String get statusClearAfter4Hours => '4 horas';

  @override
  String get statusClearAfter8Hours => '8 horas';

  @override
  String get statusClearAfter24Hours => '24 horas';

  @override
  String get statusClearAfter3Days => '3 días';

  @override
  String get statusDndDescription =>
      'Non recibirás notificacións no escritorio';

  @override
  String get statusInvisibleDescription => 'Aparecerás fóra de liña';

  @override
  String get customStatusSetTitle => 'Establecer estado personalizado';

  @override
  String get customStatusCurrentHint => 'Estado actual';

  @override
  String get customStatusClear => 'Borrar estado personalizado';

  @override
  String get customStatusPlaceholder => 'Que está a pasar?';

  @override
  String get customStatusChooseEmoji => 'Escolle un emoji';

  @override
  String get customStatusClearAfter => 'Borrar despois de';

  @override
  String get customStatusSave => 'Gardar';

  @override
  String get accountActive => 'Conta activa';

  @override
  String get signOut => 'Pechar sesión';

  @override
  String get suspendedPermanentTitle => 'Conta suspendida permanentemente';

  @override
  String get suspendedTemporaryTitle => 'Conta suspendida';

  @override
  String get suspendedPermanentDescription =>
      'A túa conta foi suspendida permanentemente por violar as nosas Condicións de servizo.';

  @override
  String get suspendedTemporaryDescription =>
      'A túa conta foi suspendida temporalmente. Poderás acceder á túa conta unha vez rematado o período de suspensión.';

  @override
  String get suspendedIssuedAt => 'Emitido';

  @override
  String get suspendedEndsAt => 'Remata';

  @override
  String get suspendedDuration => 'Duración';

  @override
  String get suspendedPermanent => 'Permanente';

  @override
  String get suspendedReason => 'Motivo';

  @override
  String get suspendedAppealDeadline => 'Data límite de apelación';

  @override
  String suspendedDeletionWarning(String date) {
    return 'A túa conta está programada para ser eliminada o $date.';
  }

  @override
  String get suspendedRecheck => 'Comprobar actualizacións';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Volver comprobar en ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Volver ao inicio de sesión';

  @override
  String get suspendedAppealTitle => 'Apelación';

  @override
  String get suspendedAppealHint =>
      'Explica por que se debería reconsiderar a túa suspensión (mínimo 50 caracteres)...';

  @override
  String get suspendedAppealSubmit => 'Enviar apelación';

  @override
  String get suspendedAppealPending => 'En revisión';

  @override
  String get suspendedAppealAccepted => 'Apelación aceptada';

  @override
  String get suspendedAppealRejected => 'Apelación rexeitada';

  @override
  String get suspendedAppealAcceptedDescription =>
      'A túa apelación foi aceptada e a túa conta foi restablecida.';

  @override
  String get suspendedSignIn => 'Iniciar sesión na túa conta';

  @override
  String get forgotPasswordTitle => 'Esqueciches o teu contrasinal?';

  @override
  String get forgotPasswordDescription =>
      'Introduce o teu enderezo de correo electrónico e enviarémosche unha ligazón para restablecer o teu contrasinal.';

  @override
  String get forgotPasswordSubmit => 'Enviar ligazón de restablecemento';

  @override
  String get forgotPasswordSentTitle => 'Comproba o teu correo electrónico';

  @override
  String get forgotPasswordSentDescription =>
      'Enviamos instrucións para restablecer o contrasinal ao teu enderezo de correo electrónico. Comproba a túa caixa de entrada e segue a ligazón para restablecer o teu contrasinal.';

  @override
  String get forgotPasswordBackToLogin => 'Volver ao inicio de sesión';

  @override
  String get resetPasswordTitle => 'Establecer novo contrasinal';

  @override
  String get resetPasswordDescription =>
      'Introduce o teu novo contrasinal a continuación para completar o proceso de restablecemento.';

  @override
  String get resetPasswordNewPassword => 'Novo contrasinal';

  @override
  String get resetPasswordConfirm => 'Confirmar novo contrasinal';

  @override
  String get resetPasswordSubmit => 'Restablecer contrasinal';

  @override
  String get resetPasswordMismatch => 'Os contrasinais non coinciden.';

  @override
  String get registerTitle => 'Crear unha conta';

  @override
  String get registerDisplayName => 'Nome para mostrar (Opcional)';

  @override
  String get registerDisplayNameHint => 'Como queres que te chamen?';

  @override
  String get registerUsername => 'Nome de usuario (Opcional)';

  @override
  String get registerUsernameHint =>
      'Deixa en branco para un nome de usuario aleatorio';

  @override
  String get registerUsernameTagHint =>
      'Engadirase automaticamente unha etiqueta de 4 díxitos para garantir a unicidade';

  @override
  String get registerDateOfBirth => 'Data de nacemento';

  @override
  String get registerMonth => 'Mes';

  @override
  String get registerDay => 'Día';

  @override
  String get registerYear => 'Ano';

  @override
  String get registerConsent =>
      'Acordo cos Termos de servizo e a Política de privacidade';

  @override
  String get registerConsentPrefix => 'Acordo cos ';

  @override
  String get registerConsentTerms => 'Termos de servizo';

  @override
  String get registerConsentAnd => ' e ';

  @override
  String get registerConsentPrivacy => 'Política de privacidade';

  @override
  String get registerConfirmPassword => 'Confirmar contrasinal';

  @override
  String get registerSubmit => 'Crear conta';

  @override
  String get registerHaveAccount => 'Xa tes unha conta? ';

  @override
  String get passkeyNoCredentials =>
      'Non se atoparon passkeys para esta aplicación. Inicia sesión con correo electrónico e contrasinal en vez diso.';

  @override
  String get passkeyDeviceNotSupported =>
      'As passkeys non son compatibles neste dispositivo.';

  @override
  String get passkeyDomainNotAssociated =>
      'As passkeys non están configuradas para esta aplicación. Inicia sesión con correo electrónico e contrasinal en vez diso.';

  @override
  String get passkeyTimeout =>
      'A autenticación de passkey expirou. Tenta de novo.';

  @override
  String get passkeyNotAvailable =>
      'As passkeys non están dispoñibles para esta aplicación. Inicia sesión con correo electrónico e contrasinal en vez diso.';

  @override
  String get passkeyFailed =>
      'A autenticación da chave de acceso fallou. Tenta de novo.';

  @override
  String get errorUnableToCreateAccount =>
      'Non se puido crear a conta. Tenta de novo.';

  @override
  String get errorUnableToSignIn =>
      'Non se pode iniciar sesión agora mesmo. Tenta de novo.';

  @override
  String get errorInvalidEmailOrPassword =>
      'Correo electrónico ou contrasinal incorrectos.';

  @override
  String get errorUnableToSendResetLink =>
      'Non se puido enviar a ligazón de restablecemento. Tenta de novo.';

  @override
  String get errorUnableToResetPassword =>
      'Non se puido restablecer o contrasinal. Tenta de novo.';

  @override
  String get embedInviteJoin => 'Unirse á comunidade';

  @override
  String get embedInviteGoTo => 'Ir á comunidade';

  @override
  String embedInviteOnline(String count) {
    return '$count en liña';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count membros';
  }

  @override
  String get embedInviteUnknownTitle => 'Invitación descoñecida';

  @override
  String get embedInviteUnknownSubtitle => 'Tenta pedir unha nova invitación.';

  @override
  String get embedInviteUnavailable => 'Invitación non dispoñible';

  @override
  String get inviteAcceptTitle => 'Foste invitado a unirte';

  @override
  String get inviteAcceptJoinButton => 'Unirse á comunidade';

  @override
  String get inviteAcceptGoToButton => 'Ir á comunidade';

  @override
  String get inviteAcceptInvitesPaused => 'Invitacións pausadas';

  @override
  String get inviteAcceptNotFoundTitle => 'Invitación inválida';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Esta invitación pode estar caducada ou ser inválida.';

  @override
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'Unirse ao grupo';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Foste invitado a unirte a un DM de grupo por $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'alguén';

  @override
  String get inviteAcceptEmojiPack => 'Paquete de emojis';

  @override
  String get inviteAcceptStickerPack => 'Paquete de adhesivos';

  @override
  String get inviteAcceptInstallEmojiPack => 'Instalar paquete de emojis';

  @override
  String get inviteAcceptInstallStickerPack => 'Instalar paquete de adhesivos';

  @override
  String get inviteAcceptPackInstallNote =>
      'Ao aceptar esta invitación, o paquete instalarase automaticamente.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Acceso á canle denegado';

  @override
  String get channelAccessDeniedDescription =>
      'Non tes acceso á canle onde se enviou esta mensaxe.';

  @override
  String get messageJumpLinkNoAccess => 'Sen acceso';

  @override
  String get okay => 'Aceptar';

  @override
  String get embedThemeTitle => 'Tema compartido';

  @override
  String get embedThemeSubtitle =>
      'Este cliente non admite temas personalizados.';

  @override
  String get embedThemeUnavailableButton => 'Temas non dispoñibles';

  @override
  String get privacySettings => 'Configuración de privacidade';

  @override
  String get privacyDirectMessages => 'Mensaxes directas';

  @override
  String get privacyDirectMessagesDescription =>
      'Permitir mensaxes directas doutros membros nesta comunidade';

  @override
  String get privacyBotDirectMessages => 'Mensaxes directas de bots';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Permitir que os bots desta comunidade che envíen mensaxes directas';

  @override
  String get privacyMutualDmsDisabled =>
      'Os administradores da comunidade desactivaron a recepción de mensaxes directas unicamente de membros mutuos nesta comunidade.';

  @override
  String get communityDebug => 'Depuración da comunidade';

  @override
  String get copiedToClipboard => 'Copiado ao portapapeis';

  @override
  String get notificationSettings => 'Configuración de notificacións';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Silenciar $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Silenciar unha comunidade evita que aparezan indicadores de non lido e notificacións, a menos que sexas mencionado.';

  @override
  String get notificationCommunitySettings =>
      'Configuración de notificacións da comunidade';

  @override
  String get notificationAllMessages => 'Toda a mensaxes';

  @override
  String get notificationOnlyMentions => 'Só mencións';

  @override
  String get notificationNothing => 'Nada';

  @override
  String get notificationSuppressEveryone => 'Suprimir @everyone e @here';

  @override
  String get notificationSuppressRoles =>
      'Suprimir todas as @mencións de roles';

  @override
  String get notificationMobilePush => 'Notificacións push móbiles';

  @override
  String get notificationOverrides => 'Anulacións de notificacións';

  @override
  String get notificationSelectChannel => 'Seleccionar unha canle ou categoría';

  @override
  String get notificationOnlyAtMentions => 'Só @mencións';

  @override
  String get notificationMuteChannel => 'Silenciar canle';

  @override
  String get notificationUnmuteChannel => 'Activar son da canle';

  @override
  String get notificationNoCategory => 'Sen categoría';

  @override
  String get dmMarkAsRead => 'Marcar como lido';

  @override
  String get dmMuteConversation => 'Silenciar DM';

  @override
  String get dmUnmuteConversation => 'Activar son do DM';

  @override
  String get dmPinDm => 'Fixar DM';

  @override
  String get dmUnpinDm => 'Desfijar DM';

  @override
  String get dmAlwaysShowInSidebar => 'Mostrar sempre na barra lateral';

  @override
  String get dmRemoveFromAlwaysShown => 'Eliminar de Sempre Mostrado';

  @override
  String get dmCloseDm => 'Pechar DM';

  @override
  String get dmCloseDmConfirmTitle => 'Pechar DM';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Estás seguro de que queres pechar o teu DM con $username? Sempre podes reabrilo máis tarde.';
  }

  @override
  String get dmCopyChannelId => 'Copiar ID da canle';

  @override
  String get dmChannelIdCopied => 'ID da canle copiado';

  @override
  String get dmCopyUserId => 'Copiar ID de usuario';

  @override
  String get dmUserIdCopied => 'ID de usuario copiado';

  @override
  String get dmViewProfile => 'Ver perfil';

  @override
  String get dmVoiceCall => 'Iniciar chamada de voz';

  @override
  String get incomingVoiceCallTitle => 'Chamada de voz entrante';

  @override
  String get incomingVoiceCallAccept => 'Aceptar';

  @override
  String get incomingVoiceCallDecline => 'Rexeitar';

  @override
  String get incomingVoiceCallLabel => 'Chamada entrante';

  @override
  String get incomingVoiceCallIgnore => 'Ignorar';

  @override
  String get directVoiceCallNotEligible =>
      'Esta chamada non se pode iniciar agora. Tenta de novo en breve.';

  @override
  String get voiceJoinCallFailed =>
      'Non se puido conectar a esta chamada. Comproba a túa conexión e tenta de novo.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Non se puido conectar a esta chamada. Comproba a túa conexión e tenta de novo.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Non se puido actualizar esta chamada no servidor. Comproba a túa conexión e tenta de novo.';

  @override
  String get dmAddNote => 'Engadir nota';

  @override
  String get dmEditGroup => 'Editar grupo';

  @override
  String get dmInviteToCommunity => 'Invitar á comunidade';

  @override
  String get dmBlock => 'Bloquear';

  @override
  String get dmLeaveGroup => 'Abandonar grupo';

  @override
  String get dmNoCommunitiesAvailable => 'Ningunha comunidade dispoñible';

  @override
  String dmGroupMemberCount(int count) {
    return '$count membros';
  }

  @override
  String get dmMuteFor15Min => 'Durante 15 minutos';

  @override
  String get dmMuteFor30Min => 'Durante 30 minutos';

  @override
  String get dmMuteFor1Hour => 'Durante 1 hora';

  @override
  String get dmMuteFor3Hours => 'Durante 3 horas';

  @override
  String get dmMuteFor4Hours => 'Durante 4 horas';

  @override
  String get dmMuteFor8Hours => 'Durante 8 horas';

  @override
  String get dmMuteFor24Hours => 'Durante 24 horas';

  @override
  String get dmMuteFor3Days => 'Durante 3 días';

  @override
  String get dmMuteForever => 'Ata que o reactive';

  @override
  String get dmPinGroupDm => 'Fixar DM de grupo';

  @override
  String get dmUnpinGroupDm => 'Desafiar DM grupal';

  @override
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
  }

  @override
  String get dmFavoriteDm => 'Marcar DM como favorito';

  @override
  String get dmUnfavoriteDm => 'Desmarcar DM como favorito';

  @override
  String get dmFavoriteGroupDm => 'Marcar DM grupal como favorito';

  @override
  String get dmUnfavoriteGroupDm => 'Desmarcar DM grupal como favorito';

  @override
  String get dmChangeFriendNickname => 'Cambiar alcume do amigo';

  @override
  String get dmRemoveFriend => 'Eliminar amigo';

  @override
  String get dmAddFriend => 'Engadir amigo';

  @override
  String get dmAcceptFriendRequest => 'Aceptar solicitude de amizade';

  @override
  String get dmIgnoreFriendRequest => 'Ignorar solicitude de amizade';

  @override
  String get dmFriendRequestSent => 'Solicitude de amizade enviada';

  @override
  String get dmUnblock => 'Desbloquear';

  @override
  String get dmDebugUser => 'Depurar usuario';

  @override
  String get dmDebugChannel => 'Depurar canle';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => 'DM fixado';

  @override
  String get dmUnpinned => 'DM desfixado';

  @override
  String get dmMuted => 'DM silenciado';

  @override
  String get dmUnmuted => 'DM desilenciado';

  @override
  String get dmRemoveFriendConfirmTitle => 'Eliminar amigo';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Estás seguro de que queres eliminar a $username como amigo?';
  }

  @override
  String get dmBlockConfirmTitle => 'Bloquear usuario';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Estás seguro de que queres bloquear a $username? Non poderá enviarche mensaxes nin solicitudes de amizade.';
  }

  @override
  String get dmFriendRequestSentToast => 'Solicitude de amizade enviada';

  @override
  String get dmFriendRequestFailed =>
      'Produciuse un erro ao enviar a solicitude de amizade';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Produciuse un erro ao aceptar a solicitude de amizade';

  @override
  String get dmRemoveFriendFailed => 'Produciuse un erro ao eliminar o amigo';

  @override
  String get dmBlockFailed => 'Produciuse un erro ao bloquear o usuario';

  @override
  String get dmUnblockFailed => 'Produciuse un erro ao desbloquear o usuario';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Produciuse un erro ao ignorar a solicitude de amizade';

  @override
  String get dmAddFriends => 'Engadir amigos';

  @override
  String get addFriendSheetTitle => 'Engadir amigo';

  @override
  String get addFriendUsernameHint => 'Nome de usuario#0000';

  @override
  String get addFriendUsernameLabel => 'Nome de usuario do amigo';

  @override
  String get addFriendSendRequest => 'Enviar solicitude';

  @override
  String get addFriendNoUserFound =>
      'Non se atopou ningún usuario con ese nome de usuario.';

  @override
  String get addFriendInvalidUsername =>
      'Introduce un nome de usuario válido (Nome de usuario#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Solicitude de amizade enviada';

  @override
  String get addFriendClaimTitle => 'Reclama a túa conta';

  @override
  String get addFriendClaimDescription =>
      'Reclama a túa conta para enviar solicitudes de amizade.';

  @override
  String get addFriendVerifyTitle => 'Verifica o teu correo electrónico';

  @override
  String get addFriendVerifyDescription =>
      'Debes verificar o teu enderezo de correo electrónico antes de poder enviar solicitudes de amizade.';

  @override
  String get addFriendVerifyEmail => 'Verificar correo electrónico';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Solicitudes de amizade entrantes ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Solicitudes de amizade saíntes ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Solicitude de amizade entrante';

  @override
  String get addFriendOutgoingStatus => 'Solicitude de amizade enviada';

  @override
  String get addFriendViewProfile => 'Ver perfil';

  @override
  String get addFriendAccept => 'Aceptar';

  @override
  String get addFriendIgnore => 'Ignorar';

  @override
  String get addFriendAcceptTitle => 'Aceptar solicitude de amizade';

  @override
  String get addFriendIgnoreTitle => 'Ignorar solicitude de amizade';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Aceptar a solicitude de amizade de $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Ignorar a solicitude de amizade de $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Cancelar solicitude';

  @override
  String get addFriendCancelRequestFailed =>
      'Non se puido cancelar a solicitude de amizade. Inténteo de novo.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Agora mesmo non están a aceptar solicitudes de amizade.';

  @override
  String get addFriendUnblockFirst =>
      'Desbloquéaos primeiro para enviar unha solicitude de amizade.';

  @override
  String get addFriendCannotSendToSelf =>
      'Non podes enviar unha solicitude de amizade a ti mesmo.';

  @override
  String get addFriendAlreadyFriends => 'Xa es amigo/a deste usuario/a.';

  @override
  String get addFriendClaimToSend =>
      'Remata de rexistrarte para enviar solicitudes de amizade.';

  @override
  String get addFriendSendFailedGeneric =>
      'Non se puido enviar a solicitude de amizade. Inténteo de novo.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Sistema';

  @override
  String get emojiSearchPlaceholder => 'Atopa o emoji dos teus soños';

  @override
  String get emojiSearchEmpty => 'Ningún emoji coincide coa túa busca';

  @override
  String get emojiAutocompleteDefaultLabel => 'Emoji predeterminado';

  @override
  String get emojiFrequentlyUsed => 'Usados con frecuencia';

  @override
  String get emojiTabGifs => 'GIFs';

  @override
  String get emojiTabMedia => 'Multimedia';

  @override
  String get emojiTabStickers => 'Stickers';

  @override
  String get emojiTabEmojis => 'Emojis';

  @override
  String get gifPickerSearch => 'Buscar GIFs';

  @override
  String get gifPickerSearchKlipy => 'Buscar KLIPY';

  @override
  String get gifPickerSearchTenor => 'Buscar Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Favoritos';

  @override
  String get gifPickerTrending => 'GIFs de tendencia';

  @override
  String get gifPickerNoResultsTitle => 'Ningún resultado de busca';

  @override
  String get gifPickerNoResultsDescription =>
      'Proba cun termo de busca diferente';

  @override
  String get gifPickerLoadFailedTitle => 'Non se puideron cargar os GIFs';

  @override
  String get gifPickerLoadFailedBody =>
      'Comproba a túa conexión e tenta de novo';

  @override
  String get emojiCategoryPeople => 'Persoas';

  @override
  String get emojiCategoryNature => 'Natureza';

  @override
  String get emojiCategoryFood => 'Comida e bebida';

  @override
  String get emojiCategoryActivity => 'Actividades';

  @override
  String get emojiCategoryTravel => 'Viaxes e lugares';

  @override
  String get emojiCategoryObjects => 'Obxectos';

  @override
  String get emojiCategorySymbols => 'Símbolos';

  @override
  String get emojiCategoryFlags => 'Bandeiras';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Desbloquea $emojiCount de $communityCount con Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Obter Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Non volver a mostrar';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count emojis personalizados',
      one: '1 emoji personalizado',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count comunidades',
      one: '1 comunidade',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Advertencia de ligazón externa';

  @override
  String get externalLinkWarningLeaving => 'Estás a piques de saír de Fluxer';

  @override
  String get externalLinkWarningDescription =>
      'As ligazóns externas poden ser perigosas. Ten coidado.';

  @override
  String get externalLinkWarningDestinationUrl => 'URL de destino:';

  @override
  String get externalLinksSectionTitle => 'Ligazóns externas';

  @override
  String get externalLinksSectionDescription =>
      'Configura como se xestionan as advertencias de ligazóns externas.';

  @override
  String get externalLinkWarningTrustPrefix => 'Confiar sempre en ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — salta esta advertencia a próxima vez';

  @override
  String get externalLinkVisitSite => 'Visitar sitio';

  @override
  String get externalLinkTrustAllLabel =>
      'Confiar en todas as ligazóns externas';

  @override
  String get externalLinkStripTrackingLabel =>
      'Eliminar parámetros de seguimento das URL';

  @override
  String get externalLinkStripTrackingDescription =>
      'Elimina automaticamente os parámetros de seguimento (como utm_source, fbclid, gclid) das URL nas mensaxes que envías. Limpa a ligazón antes de que chegue a ninguén máis.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Confiar en todas as ligazóns externas?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Isto confiará en todas as ligazóns externas e omitirá a advertencia para cada dominio. Os teus dominios de confianza actuais serán substituídos. Isto é menos seguro.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Confiar en todas';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Deixar de confiar en todas as ligazóns?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Volveranse a mostrar as advertencias de ligazóns externas. Terás que engadir dominios de confianza individualmente.';

  @override
  String get externalLinkStopTrustingAllAction => 'Desactivar confianza total';

  @override
  String get externalLinkTrustedAllDescription =>
      'Confíase en todas as ligazóns externas. Non se mostrarán advertencias.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Tes $count dominio(s) de confianza. Engade máis marcando a caixa ao visitar ligazóns externas.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Cando estea activado, non se mostrarán advertencias de ligazóns externas. Isto é menos seguro.';

  @override
  String get imageFileTooLarge =>
      'O ficheiro de imaxe é demasiado grande. Selecciona un ficheiro menor de 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Os avatares animados requiren Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Os banners animados requiren Plutonium';

  @override
  String get animatedAvifNotSupported => 'AVIF animado non admitido';

  @override
  String get animatedAvifNotSupportedBody =>
      'A edición e rotación de ficheiros AVIF animados aínda non está admitida. Se continuas, cargarase na súa forma orixinal.';

  @override
  String get uploadAsIs => 'Cargar como está';

  @override
  String get croppingAnimatedNotSupported =>
      'A edición de imaxes animadas aínda non está admitida. Usarase a carga orixinal.';

  @override
  String get cropAvatar => 'Recortar avatar';

  @override
  String get cropBanner => 'Recortar banner';

  @override
  String get skip => 'Omitir';

  @override
  String get crop => 'Recortar';

  @override
  String get changeYourFluxerTag => 'Cambiar a túa FluxerTag';

  @override
  String get fluxerTagInputLabel => 'FluxerTag';

  @override
  String get fluxerTagDescriptionBase =>
      'Os nomes de usuario só poden conter letras (a-z, A-Z), números (0-9) e guións baixos. Os nomes de usuario non distinguen entre maiúsculas e minúsculas.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Os nomes de usuario só poden conter letras (a-z, A-Z), números (0-9) e guións baixos. Os nomes de usuario non distinguen entre maiúsculas e minúsculas. Podes escoller calquera etiqueta de 4 díxitos dispoñible de #0000 a #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Os nomes de usuario só poden conter letras (a-z, A-Z), números (0-9) e guións baixos. Os nomes de usuario non distinguen entre maiúsculas e minúsculas. Podes escoller calquera etiqueta de 4 díxitos dispoñible de #0001 a #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Entre $min e $max caracteres';
  }

  @override
  String get validationAllowedChars =>
      'Só letras (a-z, A-Z), números (0-9) e guións baixos (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Obtén Plutonium para personalizar a túa etiqueta ou mantela ao cambiar o teu nome de usuario';

  @override
  String get fluxerTagAlreadyTaken => 'FluxerTag xa en uso';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'A FluxerTag $username#$discriminator xa está en uso. Continuar volverá a xerar o teu discriminador automaticamente.';
  }

  @override
  String get customTagIsTemporary => 'A etiqueta personalizada é temporal';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'A túa etiqueta personalizada de 4 díxitos só está dispoñible mentres a túa subscrición a Plutonium estea activa. Cando a túa subscrición expire o $date, a túa etiqueta volverá a ser un número asignado aleatoriamente despois dun período de graza de 3 días.';
  }

  @override
  String get customTagTemporaryBody =>
      'A túa etiqueta personalizada de 4 díxitos só está dispoñible mentres a túa subscrición a Plutonium estea activa. Cando a túa subscrición expire, a túa etiqueta volverá a ser un número asignado aleatoriamente despois dun período de graza de 3 días.';

  @override
  String get iUnderstandContinue => 'Entendo, continuar';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Se gardas esta FluxerTag, a túa etiqueta personalizada de 4 díxitos volverá a ser un número aleatorio cando remate a túa subscrición a Plutonium. Se a túa subscrición non se renova, terás un período de graza de 3 días antes de que cambie a etiqueta.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'A túa etiqueta personalizada de 4 díxitos (#$discriminator) está activa mentres a túa subscrición a Plutonium estea activa. Se a túa subscrición remata ou non se renova despois dun período de graza de 3 días, a túa etiqueta volverá a ser un número aleatorio.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Personaliza a túa etiqueta de 4 díxitos ou mantela ao cambiar o teu nome de usuario';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'A túa proba de Plutonium expira o $date. Actualiza para manter a túa etiqueta personalizada e gañar unha insignia no teu perfil.';
  }

  @override
  String get premiumTrialActive =>
      'Estás nunha proba de Plutonium. Actualiza para manter a túa etiqueta personalizada e gañar unha insignia no teu perfil.';

  @override
  String get fluxerTagUpdated => 'FluxerTag actualizada';

  @override
  String get fluxerTagUpdateFailed =>
      'Non se puido actualizar a FluxerTag. Tenta de novo.';

  @override
  String get continueAction => 'Continuar';

  @override
  String get profileCustomizationTitle => 'Personalización do perfil';

  @override
  String get profileCustomizationDescription =>
      'Edita a aparencia do teu perfil e vexa unha vista previa en directo';

  @override
  String get usernameLabel => 'Nome de usuario';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Reclama a túa conta para cambiar a túa FluxerTag';

  @override
  String get changeFluxerTag => 'Cambiar FluxerTag';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Personaliza a túa etiqueta de 4 díxitos (#$discriminator) ao teu gusto con Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Cambia o teu nome de usuario e a túa etiqueta de 4 díxitos';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'A túa etiqueta personalizada (#$discriminator) está ligada á túa subscrición de Plutonium e volverá a unha etiqueta aleatoria se caduca.';
  }

  @override
  String get displayNameLabel => 'Nome para mostrar';

  @override
  String get pronounsLabel => 'Pronomes';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Cambiar avatar';

  @override
  String get removeAvatar => 'Eliminar avatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Máx. 10 MB. Recomendado: 512×512px';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get changeBanner => 'Cambiar banner';

  @override
  String get removeBanner => 'Eliminar banner';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Máx. 10 MB. Mínimo: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Cor de acento';

  @override
  String get accentColorDescription =>
      'Personaliza a cor da fronteira e do banner do teu perfil';

  @override
  String get aboutMeLabel => 'Acerca de min';

  @override
  String get aboutMeHelperText => 'Podes usar ligazóns, emoji e Markdown.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle =>
      'Privacidade da insignia de Plutonium';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Controla como se mostra a túa insignia de Plutonium a outros';

  @override
  String get hidePlutoniumBadgeLabel =>
      'Ocultar completamente a insignia de Plutonium';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Oculta completamente a túa insignia de Plutonium a outros usuarios';

  @override
  String get hidePlutoniumPurchaseDate => 'Ocultar data de compra de Plutonium';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Ocultar data de compra de Plutonium ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Elimina cando compraches Plutonium por primeira vez da túa insignia';

  @override
  String get maskVisionaryAsSubscription =>
      'Ocultar Visionary como subscrición';

  @override
  String get maskVisionaryDescription =>
      'Mostra o teu Visionary como unha subscrición normal';

  @override
  String get hideVisionaryIdBadge => 'Ocultar insignia de ID de Visionary';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Ocultar insignia de ID de Visionary (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription =>
      'Elimina a túa insignia de ID de Visionary';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Estás nunha proba de Plutonium: a túa subscrición comeza o $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'A túa subscrición comezará automaticamente cando remate a túa proba. Non é necesario facer nada.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Estás nunha proba de Plutonium que caduca o $date';
  }

  @override
  String get premiumTrialActiveProfile => 'Estás nunha proba de Plutonium';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Máx. 10 MB. Recomendado: 512×512px. Os avatares animados (GIF) requiren Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Personaliza o teu perfil cunha imaxe de banner estática ou animada para que destaque.';

  @override
  String get getPlutonium => 'Obter Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'As compras dentro da aplicación aínda non están dispoñibles nesta plataforma. Permanece atento: ¡próximamente!';

  @override
  String get profilePreviewLabel => 'Vista previa';

  @override
  String get profilePreviewMessage => 'Mensaxe';

  @override
  String get profilePreviewMemberSince => 'Membro de Fluxer dende';

  @override
  String get unclaimedAccountTitle => 'Conta non reclamada';

  @override
  String get unclaimedAccountDescription =>
      'A túa conta aínda non foi reclamada. Sen un correo electrónico e un contrasinal, poderías perder o acceso. Reclama a túa conta agora para asegurarla.';

  @override
  String get claimAccount => 'Reclamar conta';

  @override
  String get profileTypeLabel => 'Tipo de perfil';

  @override
  String get profileTypeGlobal => 'Perfil global';

  @override
  String get profileTypeGuildDescription =>
      'Estás editando o teu perfil por comunidade. Este perfil só será visible nesta comunidade e substituirá o teu perfil global.';

  @override
  String get communityNicknameLabel => 'Alcume da comunidade';

  @override
  String get perGuildPremiumUpsellText =>
      'Personalizar o teu avatar, banner, cor de acento e biografía para comunidades individuais require Plutonium. O alcume e os pronome da comunidade son gratuítos para todos.';

  @override
  String get avatarModeInherit => 'Usar perfil global';

  @override
  String get avatarModeCustom => 'Usar imaxe personalizada';

  @override
  String get avatarModeUnset => 'Non amosar';

  @override
  String get profileSavedToast => 'Perfil actualizado';

  @override
  String get profileEditButton => 'Editar perfil';

  @override
  String get profileNoteLabel => 'Nota';

  @override
  String get profileNoteVisibility => '(só visible para ti)';

  @override
  String get profileNoteEmpty => 'Aínda non hai nota.';

  @override
  String get sudoTitle => 'Verifica a túa identidade';

  @override
  String get sudoDescription =>
      'Esta acción require verificación para continuar.';

  @override
  String get sudoAuthenticatorCode => 'Código do autenticador';

  @override
  String get sudoMethodPassword => 'Contrasinal';

  @override
  String get sudoMethodTotp => 'Autenticador';

  @override
  String get sudoVerificationFailed => 'A verificación fallou. Tenta de novo.';

  @override
  String get securityAccountTitle => 'Conta';

  @override
  String get securityAccountDescription =>
      'Xestiona o teu correo electrónico, contrasinal e configuración da conta';

  @override
  String get securitySectionTitle => 'Seguranza';

  @override
  String get securitySectionDescription =>
      'Protexe a túa conta coa autenticación de dous factores e as claves de acceso';

  @override
  String get securityLoginEmailSectionTitle =>
      'Configuración do correo electrónico';

  @override
  String get securityLoginEmailSectionDescription =>
      'Xestiona o enderezo de correo electrónico que usas para iniciar sesión en Fluxer';

  @override
  String get securityLoginEmailAddressLabel => 'Enderezo de correo electrónico';

  @override
  String get securityLoginNoEmailSet =>
      'Non hai ningún enderezo de correo electrónico configurado';

  @override
  String get securityLoginChangeEmail => 'Cambiar correo electrónico';

  @override
  String get securityLoginAddEmail => 'Engadir correo electrónico';

  @override
  String get securityLoginReveal => 'Revelar';

  @override
  String get securityLoginHide => 'Ocultar';

  @override
  String get securityLoginPasswordSectionTitle => 'Contrasinal';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Cambia o teu contrasinal para manter a túa conta segura';

  @override
  String get securityLoginCurrentPasswordLabel => 'Contrasinal actual';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Último cambio: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Último cambio: Nunca';

  @override
  String get securityLoginNoPasswordSet =>
      'Non hai ningún contrasinal configurado';

  @override
  String get securityLoginChangePassword => 'Cambiar contrasinal';

  @override
  String get securityLoginSetPassword => 'Establecer contrasinal';

  @override
  String get passwordChangeTitle => 'Cambiar contrasinal';

  @override
  String get passwordChangeIntroDescription =>
      'Enviaremos un código de verificación ao teu enderezo de correo electrónico para confirmar a túa identidade antes de cambiar o teu contrasinal.';

  @override
  String get passwordChangeStart => 'Iniciar';

  @override
  String get passwordChangeVerifyTitle => 'Verifica o teu correo electrónico';

  @override
  String get passwordChangeVerifyDescription =>
      'Introduce o código de verificación enviado ao teu enderezo de correo electrónico.';

  @override
  String get passwordChangeVerificationCode => 'Código de verificación';

  @override
  String get passwordChangeVerify => 'Verificar';

  @override
  String get passwordChangeNewPasswordTitle => 'Establecer novo contrasinal';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Introduce o teu novo contrasinal a continuación.';

  @override
  String get passwordChangeNewPassword => 'Novo contrasinal';

  @override
  String get passwordChangeConfirmPassword => 'Confirmar novo contrasinal';

  @override
  String get passwordChangeSubmit => 'Cambiar contrasinal';

  @override
  String get passwordChangeSuccess => 'Contrasinal cambiado';

  @override
  String get passwordChangePasswordsDoNotMatch =>
      'Os contrasinais non coinciden';

  @override
  String get passwordChangeInvalidCode => 'Código inválido ou caducado';

  @override
  String get emailChangeTitle => 'Cambiar correo';

  @override
  String get emailChangeIntroDescription =>
      'Enviaremos códigos de verificación para confirmar a túa identidade antes de cambiar o teu enderezo de correo.';

  @override
  String get emailChangeStart => 'Comezar';

  @override
  String get emailChangeVerifyOriginalTitle => 'Verificar correo actual';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Introduce o código de verificación enviado ao teu enderezo de correo actual.';

  @override
  String get emailChangeNewEmailTitle => 'Introducir novo correo';

  @override
  String get emailChangeNewEmailDescription =>
      'Introduce o novo enderezo de correo que desexas usar.';

  @override
  String get emailChangeNewEmailLabel => 'Novo correo';

  @override
  String get emailChangeNewEmailSubmit => 'Enviar código de verificación';

  @override
  String get emailChangeVerifyNewTitle => 'Verificar novo correo';

  @override
  String get emailChangeVerifyNewDescription =>
      'Introduce o código de verificación enviado ao teu novo enderezo de correo.';

  @override
  String get emailChangeSuccess => 'Correo cambiado';

  @override
  String get emailChangeInvalidCode => 'Código inválido ou caducado';

  @override
  String get resend => 'Reenviar';

  @override
  String resendCountdown(int seconds) {
    return 'Reenviar (${seconds}s)';
  }

  @override
  String get verificationCode => 'Código de verificación';

  @override
  String get verify => 'Verificar';

  @override
  String get enable => 'Activar';

  @override
  String get disable => 'Desactivar';

  @override
  String get delete => 'Eliminar';

  @override
  String get save => 'Gardar';

  @override
  String get securityTfaSectionTitle => 'Autenticación de dous factores';

  @override
  String get securityTfaSectionDescription =>
      'Engade unha capa extra de seguridade á túa conta';

  @override
  String get securityTfaAuthenticatorApp => 'Aplicación de autenticación';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'A autenticación de dous factores está activada';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Usa unha aplicación de autenticación para xerar códigos para a autenticación de dous factores';

  @override
  String get securityTfaBackupCodes => 'Códigos de copia de seguranza';

  @override
  String get securityTfaBackupCodesDescription =>
      'Ver e xestionar os teus códigos de copia de seguranza para a recuperación da conta';

  @override
  String get securityTfaViewCodes => 'Ver códigos';

  @override
  String get securityPasskeysSectionTitle => 'Chaves de acceso';

  @override
  String get securityPasskeysSectionDescription =>
      'Usa chaves de acceso para iniciar sesión sen contrasinal e para a autenticación de dous factores';

  @override
  String get securityPasskeysRegistered => 'Chaves de acceso rexistradas';

  @override
  String get securityPasskeysNone => 'Non hai chaves de acceso rexistradas';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'chaves de acceso',
      one: 'chave de acceso',
    );
    return '$count $_temp0 rexistradas (máx. 10)';
  }

  @override
  String get securityPasskeysAdd => 'Engadir chave de acceso';

  @override
  String securityPasskeysAdded(String date) {
    return 'Engadida: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Último uso: $date';
  }

  @override
  String get securityPasskeysRename => 'Renomear';

  @override
  String get securityPasskeysDeleteTitle => 'Eliminar chave de acceso';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Estás seguro de que queres eliminar a chave de acceso \"$name\"?';
  }

  @override
  String get securityPasskeyNameTitle => 'Nomear chave de acceso';

  @override
  String get securityPasskeyNameLabel => 'Nome da chave de acceso';

  @override
  String get securityPasskeyNameHint =>
      'por exemplo, YubiKey, iPhone, Ordenador do traballo';

  @override
  String get securityPhoneSectionTitle => 'Número de teléfono';

  @override
  String get securityPhoneSectionDescription =>
      'Xestionar o teu número de teléfono.';

  @override
  String get securityPhoneLabel => 'Número de teléfono';

  @override
  String get securityPhoneNone => 'Non hai ningún número de teléfono engadido.';

  @override
  String get securityPhoneAdd => 'Engadir teléfono';

  @override
  String get securityPhoneRemove => 'Eliminar';

  @override
  String get securityPhoneRemoveTitle => 'Eliminar número de teléfono';

  @override
  String get securityPhoneRemoveDescription =>
      'Estás seguro de que queres eliminar o teu número de teléfono?';

  @override
  String get securityPhoneRemoved => 'Número de teléfono eliminado';

  @override
  String get securityClaimTitle => 'Funcións de seguranza';

  @override
  String get securityClaimDescription =>
      'Reclama a túa conta para acceder a funcións de seguranza como a autenticación de dous factores e as claves de acceso.';

  @override
  String get securityVerifyEmailRequired =>
      'Debes verificar o teu enderezo de correo electrónico antes de poder configurar a autenticación de dous factores, as claves de acceso ou a verificación por SMS.';

  @override
  String get totpEnableTitle => 'Configurar aplicación de autenticación';

  @override
  String get totpEnableDescription =>
      'Escanea o código QR coa túa aplicación de autenticación para xerar códigos para a autenticación de dous factores.';

  @override
  String get totpEnableCodeLabel => 'Código';

  @override
  String get totpEnableCodeHint =>
      'Introduce o código de 6 díxitos da túa aplicación de autenticación';

  @override
  String get totpEnableSuccess => 'Activouse a autenticación de dous factores';

  @override
  String get totpDisableTitle => 'Eliminar aplicación de autenticación';

  @override
  String get totpDisableDescription =>
      'Introduce o código de 6 díxitos da túa aplicación de autenticación para desactivar a autenticación de dous factores.';

  @override
  String get totpDisableSuccess => 'Autenticación de dous factores desactivada';

  @override
  String get backupCodesTitle => 'Códigos de copia de seguranza';

  @override
  String get backupCodesWarning =>
      'Se perdes o acceso á túa aplicación de autenticación e non tes estes códigos, quedarás permanentemente bloqueado da túa conta. Descárgaos ou cópiaos agora e gárdaos nun lugar seguro.';

  @override
  String get backupCodesDownload => 'Descargar';

  @override
  String get backupCodesCopy => 'Copiar';

  @override
  String get backupCodesCopied =>
      'Códigos de copia de seguranza copiados no portapapeis';

  @override
  String get backupCodesAcknowledge =>
      'Descarguei ou copiei os meus códigos de copia de seguranza e gárdeos nun lugar seguro.';

  @override
  String get backupCodesDone => 'Feito';

  @override
  String get backupCodesViewTitle => 'Ver códigos de copia de seguranza';

  @override
  String get backupCodesViewDescription =>
      'Pode ser necesaria a verificación antes de ver os teus códigos de copia de seguranza.';

  @override
  String get phoneAddTitle => 'Engadir número de teléfono';

  @override
  String get phoneAddLabel => 'Número de teléfono';

  @override
  String get phoneAddHint => 'Introduce o teu número de teléfono';

  @override
  String get phoneAddFooter =>
      'Introduce o teu número de teléfono. Enviarémoste un código de verificación por SMS.';

  @override
  String get phoneAddSendCode => 'Enviar código';

  @override
  String get phoneVerifyTitle => 'Verificar número de teléfono';

  @override
  String get phoneVerifyDescription =>
      'Introduce o código de verificación enviado ao teu número de teléfono.';

  @override
  String get phoneAddSuccess => 'Número de teléfono engadido';

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
  String get dangerZoneSectionTitle => 'Zona perigosa';

  @override
  String get dangerZoneSectionDescription =>
      'Accións irreversibles e destrutivas';

  @override
  String get dangerZoneDisableTitle => 'Desactivar conta';

  @override
  String get dangerZoneDisableDescription =>
      'Desactiva temporalmente a túa conta. Podes reactivala máis tarde iniciando sesión de novo.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Desactivar a túa conta pechará a sesión en todas as sesións. Podes reactivar a túa conta en calquera momento iniciando sesión de novo.';

  @override
  String get dangerZoneDeleteTitle => 'Eliminar conta';

  @override
  String get dangerZoneDeleteDescription =>
      'Elimina permanentemente a túa conta e todos os datos asociados. Esta acción non se pode desfacer.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Cancela a túa subscrición activa de Plutonium na configuración de Plutonium antes de eliminar a túa conta.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount =>
      'Non se pode eliminar a conta';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Non podes eliminar a túa conta mentres posúes comunidades. Transfire a propiedade das seguintes comunidades primeiro:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'e $count máis';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Para transferir a propiedade, vai a $settingsPath e usa a opción de transferir a propiedade.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Estás seguro de que queres eliminar a túa conta? Esta acción programará a túa conta para a súa eliminación permanente.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Podes cancelar o proceso de eliminación nun prazo de 14 días';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Despois de 14 días, a túa conta será eliminada permanentemente';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Unha vez procesada a eliminación, non poderás recuperar o acceso á túa conta';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Non poderás eliminar as túas mensaxes enviadas despois de que se elimine a túa conta';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Se queres exportar os teus datos ou eliminar as túas mensaxes primeiro, visita a sección do Panel de privacidade na Configuración do usuario antes de continuar.';

  @override
  String get claimAccountTitle => 'Reclamar a túa conta';

  @override
  String get claimAccountDescription =>
      'Reclama a túa conta engadindo un correo electrónico e un contrasinal. Enviaremos un código de verificación para confirmar o teu correo electrónico antes de rematar.';

  @override
  String get claimAccountEmailLabel => 'Correo electrónico';

  @override
  String get claimAccountPasswordLabel => 'Contrasinal';

  @override
  String get claimAccountSendCode => 'Enviar código';

  @override
  String get claimAccountVerifyDescription =>
      'Introduce o código que che enviamos ao teu correo electrónico para verificalo. O teu contrasinal establecerase unha vez que o código sexa confirmado.';

  @override
  String get claimAccountSuccess => 'Conta reclamada con éxito';

  @override
  String get importantInformation => 'Información importante:';

  @override
  String get genericError => 'Produciuse un erro';

  @override
  String get invalidCode => 'Código incorrecto';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hai $count anos',
      one: 'hai 1 ano',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hai $count meses',
      one: 'hai 1 mes',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hai $count días',
      one: 'hai 1 día',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hai $count horas',
      one: 'hai 1 hora',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hai $count minutos',
      one: 'hai 1 minuto',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'agora mesmo';

  @override
  String get authorizedAppsTitle => 'Aplicacións autorizadas';

  @override
  String get authorizedAppsDescription =>
      'A estas aplicacións concedéuselles acceso á túa conta de Fluxer.';

  @override
  String get authorizedAppsEmptyTitle => 'Ningunha aplicación autorizada';

  @override
  String get authorizedAppsEmptyDescription =>
      'Aínda non autorizaches ningunha aplicación para acceder á túa conta.';

  @override
  String get authorizedAppsLoadError =>
      'Erro ao cargar aplicacións autorizadas';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Autorizado o $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Permisos concedidos';

  @override
  String get authorizedAppsRevoke => 'Revogar';

  @override
  String get authorizedAppsRevokeTitle => 'Revogar acceso á aplicación';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Estás seguro de que queres revogar o acceso a $appName? Esta aplicación xa non terá acceso á túa conta.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Acceder á túa información básica de perfil (nome de usuario, avatar, etc.)';

  @override
  String get authorizedAppsScopeEmail =>
      'Ver o teu enderezo de correo electrónico';

  @override
  String get authorizedAppsScopeGuilds =>
      'Ver as comunidades das que es membro';

  @override
  String get authorizedAppsScopeConnections => 'Ver as túas contas conectadas';

  @override
  String get authorizedAppsScopeBot =>
      'Engadir un bot a unha comunidade con permisos solicitados';

  @override
  String get authorizedAppsScopeAdmin =>
      'Acceder aos puntos finais administrativos';

  @override
  String get privacyPendingDeletionTitle => 'Pendiente de eliminación';

  @override
  String get blockedUsersTitle => 'Usuarios bloqueados';

  @override
  String get blockedUsersDescription =>
      'Os usuarios bloqueados non poden enviarche solicitudes de amizade nin mensaxes directas.';

  @override
  String get blockedUsersEmptyTitle => 'Ningún usuario bloqueado';

  @override
  String get blockedUsersEmptyDescription => 'Aínda non bloqueaches a ninguén.';

  @override
  String get blockedUsersLoadError => 'Erro ao cargar usuarios bloqueados';

  @override
  String get blockedUsersUnblock => 'Desbloquear';

  @override
  String get blockedUsersUnblockTitle => 'Desbloquear usuario';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Estás seguro de que queres desbloquear a $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Copiar FluxerTag';

  @override
  String get blockedUsersCopyId => 'Copiar ID de usuario';

  @override
  String get userProfileLoadError => 'Non se puido cargar o perfil';

  @override
  String get userProfileRetry => 'Tentar de novo';

  @override
  String get userProfileMessage => 'Mensaxe';

  @override
  String get userProfileVoiceCall => 'Chamada de voz';

  @override
  String get userProfileVideoCall => 'Videochamada';

  @override
  String get userProfileEditProfile => 'Editar perfil';

  @override
  String get userProfileStaffBadgeTooltip => 'Persoal de Fluxer';

  @override
  String get userProfileCtpBadgeTooltip => 'Equipo Comunitario de Fluxer';

  @override
  String get userProfilePartnerBadgeTooltip => 'Socio de Fluxer';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Cazador de erros de Fluxer';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Plutonio de Fluxer';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'subscritor de Plutonio de Fluxer dende o $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Visionario de Fluxer';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Visionario de Fluxer dende o $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'ID de Visionario #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Amigos comúns ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Comunidades comúns ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Amigos comúns';

  @override
  String get userProfileMutualCommunitiesTitle => 'Comunidades comúns';

  @override
  String get userProfileNoMutualFriends => 'Non se atoparon amigos comúns.';

  @override
  String get userProfileNoMutualCommunities =>
      'Non se atoparon comunidades comúns.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Alcume: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Abrir DM';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Bloqueaches a $username. Non poderás enviar mensaxes a menos que o desbloquees.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Desbloquear';

  @override
  String get userProfileOpenDm => 'Abrir DM';

  @override
  String get userProfileNoteTitle => 'Nota';

  @override
  String get userProfileNoteVisibility => '(só visible para ti)';

  @override
  String get userProfileNoteSave => 'Gardar';

  @override
  String get userProfileNoteDelete => 'Eliminar';

  @override
  String get userProfileNoteEmpty => 'Toca para engadir unha nota';

  @override
  String get userProfileMemberSince => 'Membro dende';

  @override
  String get userProfileAboutMe => 'Sobre min';

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
  String get userProfileCopyUsername => 'Copiar nome de usuario';

  @override
  String get userProfileCopyUserId => 'Copiar ID de usuario';

  @override
  String get userProfileViewMainProfile => 'Ver perfil principal';

  @override
  String get userProfileViewCommunityProfile => 'Ver perfil da comunidade';

  @override
  String get userProfileBlockUser => 'Bloquear usuario';

  @override
  String get userProfileUnblockUser => 'Desbloquear usuario';

  @override
  String get userProfileRemoveFriend => 'Eliminar amigo';

  @override
  String get userProfileBlockConfirmTitle => 'Bloquear usuario';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Estás seguro de que queres bloquear a $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Desbloquear usuario';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Estás seguro de que queres desbloquear a $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Eliminar amigo';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Estás seguro de que queres eliminar a $username como amigo?';
  }

  @override
  String get userProfileFailedOpenDm => 'Non se puido abrir o DM';

  @override
  String get userProfileFailedSaveNote => 'Non se puido gardar a nota';

  @override
  String get userProfileActionFailed => 'A acción fallou, tenta de novo';

  @override
  String get userProfileChangeNickname => 'Cambiar alcume';

  @override
  String get userProfileKick => 'Expulsar';

  @override
  String get userProfileBan => 'Banear';

  @override
  String get userProfileTimeout => 'Silenciar';

  @override
  String get userProfileRemoveTimeout => 'Eliminar silencio';

  @override
  String get userProfileTransferOwnership => 'Transferir propiedade';

  @override
  String get userProfileReportUser => 'Informar sobre o usuario';

  @override
  String get userProfileReportMessage => 'Informar sobre a mensaxe';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Expulsar a $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Estás seguro de que queres expulsar a $username? Pode volver unirse cunha nova invitación.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle =>
      'Eliminar o tempo de espera?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Eliminar o tempo de espera permitirá que $username envíe mensaxes, reaccione e se una a canles de voz de novo.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Transferir a propiedade?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Transferir a propiedade desta comunidade a $username? Isto é irreversible e perderás todos os privilexios de propietario.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Bloquear $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Duración do bloqueo';

  @override
  String get userProfileBanCustomSecondsLabel =>
      'Duración personalizada (segundos)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Calquera valor entre $min e $max segundos';
  }

  @override
  String get userProfileBanDeleteHistoryLabel =>
      'Eliminar historial de mensaxes';

  @override
  String get userProfileBanDeleteNone => 'Non eliminar ningunha';

  @override
  String get userProfileBanDelete24h => 'Últimas 24 horas';

  @override
  String get userProfileBanDelete7d => 'Últimos 7 días';

  @override
  String get userProfileBanReasonLabel => 'Motivo (opcional)';

  @override
  String get userProfileBanReasonHint => 'Introduce un motivo para o bloqueo';

  @override
  String get userProfileBanSubmit => 'Bloquear membro';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Tempo de espera para $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Duración do tempo de espera';

  @override
  String get userProfileTimeoutSubmit => 'Aplicar tempo de espera ao membro';

  @override
  String get userProfileNicknameLabel => 'Alcume';

  @override
  String get userProfileNicknameHint => 'Introduce un alcume';

  @override
  String get userProfileNicknameSave => 'Gardar';

  @override
  String userProfileKickSuccess(String username) {
    return '$username foi expulsado';
  }

  @override
  String userProfileBanSuccess(String username) {
    return '$username foi bloqueado';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Aplicouse tempo de espera a $username';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Eliminouse o tempo de espera para $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Alcume actualizado';

  @override
  String get userProfileTransferSuccess => 'Propiedade transferida';

  @override
  String get durationPermanent => 'Permanente';

  @override
  String get duration60Seconds => '60 segundos';

  @override
  String get duration5Minutes => '5 minutos';

  @override
  String get duration10Minutes => '10 minutos';

  @override
  String get duration1Hour => '1 hora';

  @override
  String get duration12Hours => '12 horas';

  @override
  String get duration1Day => '1 día';

  @override
  String get duration3Days => '3 días';

  @override
  String get duration5Days => '5 días';

  @override
  String get duration1Week => '1 semana';

  @override
  String get duration2Weeks => '2 semanas';

  @override
  String get duration1Month => '1 mes';

  @override
  String get durationCustom => 'Personalizado…';

  @override
  String get iarReportUserTitle => 'Informar do usuario';

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
  String get iarReasonInappropriateProfile => 'Perfil inapropiado';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'O perfil deste usuario contén contido inapropiado';

  @override
  String typingIndicatorOne(String name) {
    return '$name está escribindo...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 e $name2 están escribindo...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 e $name3 están escribindo...';
  }

  @override
  String get typingIndicatorMultiple => 'Varios usuarios están escribindo...';

  @override
  String get typingIndicatorHandful =>
      'Un puñado de guerreiros do teclado estanse a preparar...';

  @override
  String get typingIndicatorSymphony =>
      'Está en marcha unha sinfonía de teclas...';

  @override
  String get typingIndicatorFiesta =>
      'Isto é unha festa de escritura en toda regra';

  @override
  String get typingIndicatorApocalypse =>
      'Que barbaridade, é unha apocalipse de escritura';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Que ben que estás aquí, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Benvido, $username! Fai como na casa.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Ola, $username! Que ben terche aquí.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Ola, $username! Únete cando esteas listo/a.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Ola $username, que ben verte por aquí!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Ola, $username! Agardo que disfrutes da túa estadía.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Ola, $username, benvido/a a bordo!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Que ben que chegaches, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Benvido/a, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Benvido/a, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Benvido/a, $username! Estamos contentos de terche aquí.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Benvido/a, $username! Agardo que disfrutes do teu tempo aquí.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Benvido/a, $username! A túa próxima conversa comeza aquí.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Benvido/a, $username. Estamos encantados de terche aquí.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Que ben verte, $username! Benvido/a.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Xa estás aquí, $username! Que ben terche connosco.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Chegaches, $username! Imos comezar.';
  }

  @override
  String get relativeTimeShortNow => 'agora';

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
      other: '${count}a',
      one: '1a',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'Os meus dispositivos';

  @override
  String get linkedDevicesDescription =>
      'Consulta todos os dispositivos que teñen iniciada a sesión na túa conta. Revoa calquera sesión que non recoñezas.';

  @override
  String get linkedDevicesCurrentDevice => 'Dispositivo actual';

  @override
  String get linkedDevicesOtherDevices => 'Outros dispositivos';

  @override
  String get linkedDevicesEnterSelection => 'Entrar en modo de selección';

  @override
  String get linkedDevicesExitSelection => 'Saír do modo de selección';

  @override
  String get linkedDevicesSelectAll => 'Seleccionar todo';

  @override
  String get linkedDevicesClearSelection => 'Limpar selección';

  @override
  String get linkedDevicesRevokeTooltip => 'Revogar dispositivo';

  @override
  String get linkedDevicesSignOutAll =>
      'Pechar sesión en todos os demais dispositivos';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pechar sesión en $count dispositivos',
      one: 'Pechar sesión nun dispositivo',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pechar sesión en $count dispositivos',
      one: 'Pechar sesión nun dispositivo',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Pechar sesión en todos os demais dispositivos';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Isto pechará a sesión dos dispositivos seleccionados na túa conta. Terás que iniciar sesión de novo neses dispositivos.',
      one:
          'Isto pechará a sesión do dispositivo seleccionado na túa conta. Terás que iniciar sesión de novo nese dispositivo.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Isto pechará a sesión nos dispositivos seleccionados da túa conta. Terás que iniciar sesión de novo nese dispositivos.';

  @override
  String get linkedDevicesSignOutConfirm => 'Continuar';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Terás que volver iniciar sesión en todos os dispositivos nos que pechaches a sesión';

  @override
  String get linkedDevicesLoadErrorTitle => 'Erro de rede';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Temos problemas para conectarnos ao continuo espazo-temporal. Comproba a túa conexión e téntao de novo.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dispositivos revogados',
      one: 'Dispositivo revogado',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'Non se puido pechar a sesión. Téntao de novo.';

  @override
  String get linkedDevicesUnknownOs => 'SO descoñecido';

  @override
  String get linkedDevicesUnknownPlatform => 'Plataforma descoñecida';

  @override
  String slowmodeLabel(String duration) {
    return 'Modo lento de $duration';
  }

  @override
  String get slowmodeTooltipActive =>
      'Estás en modo lento. Agarda antes de enviar outra mensaxe.';

  @override
  String get slowmodeTooltipImmune =>
      'O modo lento está activado, pero es inmune.';

  @override
  String get channelNoSendPermissionHint =>
      'Non podes enviar mensaxes nesta canle.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Anuncios do sistema do persoal de $productName. Non podes responder aquí.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'A mensaxaría está pausada temporalmente nesta comunidade.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Tes o tempo esgotado. A mensaxaría, as reaccións e a voz están pausadas ata que expire o tempo de espera.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Necesitas reclamar a túa conta para enviar mensaxes nesta comunidade.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Necesitas verificar o teu correo electrónico para enviar mensaxes nesta comunidade.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'A túa conta é demasiado nova para enviar mensaxes nesta comunidade.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Non fuches membro desta comunidade o tempo suficiente para enviar mensaxes.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Necesitas verificar un número de teléfono para enviar mensaxes nesta comunidade.';

  @override
  String get channelComposerBarrierVerifyEmail =>
      'Verificar correo electrónico';

  @override
  String get channelComposerBarrierVerifyPhone => 'Verificar teléfono';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Demasiadas adxuncións (máx. $max)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'Un ou varios ficheiros superan o límite de tamaño';

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Esos ficheiros son demasiado grandes para envialos xuntos';

  @override
  String get chatAttachmentDropToUpload => 'Solta ficheiros para cargar';

  @override
  String get chatAttachmentDropToSend => 'Solta ficheiros para enviar agora';

  @override
  String get chatAttachmentSendVoiceMessage => 'Enviar mensaxe de voz';

  @override
  String get voiceMessageTitle => 'Mensaxe de voz';

  @override
  String get voiceMessageHoldHint =>
      'Mantén premido para gravar. Arrastra cara arriba para bloquear, ou solta para enviar.';

  @override
  String get voiceMessageDiscard => 'Descartar mensaxe de voz';

  @override
  String get voiceMessageSend => 'Enviar mensaxe de voz';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Non se pode iniciar a gravación. Permite o acceso ao micrófono.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'A gravación de voz non é compatible neste dispositivo.';

  @override
  String get voiceMessageMicInUse =>
      'Saia da chamada de voz para gravar unha mensaxe de voz.';

  @override
  String get voiceMessageRecordingFailed =>
      'A gravación fallou. Inténtao de novo.';

  @override
  String get voiceMessageSendFailed =>
      'Non se pode enviar a mensaxe de voz. Inténtao de novo.';

  @override
  String get voiceMessageRecordingHint =>
      'Fala agora. Preme Detener cando remates; podes recortar despois.';

  @override
  String get voiceMessageReviewHint =>
      'Arrastra as asas para recortar, despois preme Enviar.';

  @override
  String get voiceMessageStop => 'Detener';

  @override
  String get voiceMessageStartRecording => 'Iniciar gravación';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Reproducir';

  @override
  String get voiceMessagePause => 'Pausar';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'A selección debe ter polo menos ${secondsString}s.';
  }

  @override
  String get chatAttachmentEditTitle => 'Editar adxunción';

  @override
  String get chatAttachmentFilenameLabel => 'Nome do ficheiro';

  @override
  String get chatAttachmentDescriptionLabel => 'Descrición';

  @override
  String get chatAttachmentDescriptionHint => 'Texto alternativo opcional';

  @override
  String get chatAttachmentSpoilerLabel => 'Marcar como spoiler';

  @override
  String get chatAttachmentRemove => 'Eliminar adxunción';

  @override
  String get chatAttachmentDownload => 'Descargar';

  @override
  String get chatAttachmentExpiredTooltip => 'Adxunción caducada';

  @override
  String get chatAttachmentSourceGallery => 'Galería';

  @override
  String get chatAttachmentSourceCamera => 'Cámara';

  @override
  String get chatAttachmentSourceBrowse => 'Buscar ficheiros';

  @override
  String get chatAttachmentPasteTooltip => 'Pegar imaxe do portapapeis';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Revelar spoiler';

  @override
  String get matureMediaRevealButton => 'Revelar';

  @override
  String get matureMediaRevealHint => 'Fai clic para revelar';

  @override
  String get matureContentTitle => 'Contido para adultos';

  @override
  String get matureCommunityTitle => 'Comunidade para maiores';

  @override
  String get matureCategoryTitle => 'Categoría para maiores';

  @override
  String get matureChannelTitle => 'Canal para maiores';

  @override
  String get communityContentWarningTitle =>
      'Advertencia de contido da comunidade';

  @override
  String get categoryContentWarningTitle =>
      'Advertencia de contido da categoría';

  @override
  String get channelContentWarningTitle => 'Advertencia de contido da canle';

  @override
  String get defaultContentWarningBody => 'Isto contén contido sensible.';

  @override
  String get matureCommunityBody =>
      'Esta comunidade está marcada para contido para maiores e pode conter material que pode ser inapropiado para algúns usuarios.';

  @override
  String get matureCategoryBody =>
      'Esta categoría está marcada para contido para maiores e pode conter material que pode ser inapropiado para algúns usuarios.';

  @override
  String get matureChannelBody =>
      'Esta canle está marcada para contido para maiores e pode conter material que pode ser inapropiado para algúns usuarios.';

  @override
  String get matureVoiceChannelBody =>
      'Esta canle de voz está marcada para contido para maiores e pode conter material que pode ser inapropiado para algúns usuarios.';

  @override
  String get matureLinkChannelBody =>
      'Esta canle de ligazón está marcada para contido para maiores e pode abrir material que pode ser inapropiado para algúns usuarios.';

  @override
  String get matureCommunityUnavailableBody =>
      'Esta comunidade para maiores non está dispoñible para a túa conta.';

  @override
  String get matureCategoryUnavailableBody =>
      'Esta categoría para maiores non está dispoñible para a túa conta.';

  @override
  String get matureChannelUnavailableBody =>
      'Esta canle para maiores non está dispoñible para a túa conta.';

  @override
  String get matureContentProceedButton => 'Continuar';

  @override
  String get matureContentUnderstandButton => 'Entendo';

  @override
  String get matureContentOpenLinkButton => 'Abrir ligazón';

  @override
  String get sensitiveContentSectionTitle => 'Contido sensible';

  @override
  String get sensitiveContentSectionDescription =>
      'Controla como se filtra o contido multimedia para maiores ou sensible en diferentes contextos';

  @override
  String get sensitiveContentFriendDmLabel => 'Mensaxes directas de amigos';

  @override
  String get sensitiveContentNonFriendDmLabel =>
      'Mensaxes directas doutras persoas';

  @override
  String get sensitiveContentGuildLabel => 'Mensaxes en canles da comunidade';

  @override
  String get sensitiveContentFilterShow => 'Mostrar';

  @override
  String get sensitiveContentFilterBlur => 'Desenfocar';

  @override
  String get sensitiveContentFilterBlock => 'Bloquear';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Desenfocar multimedia ata que remate o escaneo de seguridade';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Cando está activado, as imaxes e os vídeos desfanse ata que remata o escaneo de seguridade do contido.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Esta configuración está sempre activada para a túa conta.';

  @override
  String get sensitiveContentResetButton => 'Restablecer';

  @override
  String get sensitiveContentSaveButton => 'Gardar';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ficheiros',
      one: '1 ficheiro',
    );
    return 'Subindo $_temp0';
  }

  @override
  String get chatCancelUpload => 'Cancelar subida';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Caduca o $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Caduca entre o $start e o $end';
  }

  @override
  String get connectionsTitle => 'Conexións';

  @override
  String get connectionsDescription =>
      'Vincula contas e dominios externos ao teu perfil de Fluxer. As conexións verificadas mostraranse no teu perfil para que outros as vexan.';

  @override
  String get connectionsEmptyTitle => 'Aínda non hai conexións';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Vincula a túa conta de Bluesky ou verifica a propiedade do dominio para mostralos no teu perfil.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Verifica a propiedade do dominio para mostralo no teu perfil.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Dominio';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Engadir conexión de Bluesky';

  @override
  String get connectionsAddDomainAriaLabel => 'Engadir conexión de dominio';

  @override
  String get connectionEdit => 'Editar';

  @override
  String get connectionRemove => 'Eliminar';

  @override
  String get connectionVerifiedLabel => 'Esta conexión foi verificada.';

  @override
  String get connectionUnverifiedLabel => 'Esta conexión non foi verificada.';

  @override
  String get connectionAddTitle => 'Engadir conexión';

  @override
  String get connectionTypeLabel => 'Tipo de conexión';

  @override
  String get connectionHandleLabel => 'Nome de usuario';

  @override
  String get connectionDomainLabel => 'Dominio';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Xa tes esta conexión.';

  @override
  String get connectionConnectBluesky => 'Conectar con Bluesky';

  @override
  String get connectionContinue => 'Continuar';

  @override
  String get connectionVerifyTitle => 'Verificar conexión';

  @override
  String get connectionVerifyInstructions =>
      'Usa o rexistro seguinte para probar a propiedade do dominio.';

  @override
  String get connectionDnsRecordTitle => 'Rexistro TXT de DNS';

  @override
  String get connectionDnsHostLabel => 'Host';

  @override
  String get connectionDnsValueLabel => 'Valor';

  @override
  String get connectionCopyHost => 'Copiar host';

  @override
  String get connectionCopyValue => 'Copiar valor';

  @override
  String get connectionCopied => 'Copiado!';

  @override
  String get connectionTokenFileTitle => 'Servir o ficheiro de token';

  @override
  String get connectionTokenFileDescription =>
      'Descarga **fluxer-verification** e colócao no teu cartafol **.well-known** para que poidamos validar o dominio.';

  @override
  String get connectionTokenFileDownload => 'Descargar fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'O ficheiro contén o token de verificación que obteremos de **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Gardar fluxer-verification';

  @override
  String get connectionVerifyButton => 'Verificar';

  @override
  String get connectionBack => 'Atrás';

  @override
  String get connectionEditTitle => 'Editar conexión';

  @override
  String get connectionEditDescription =>
      'Elixe quen pode ver esta conexión no teu perfil.';

  @override
  String get connectionVisibilityEveryone => 'Todos';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Permite que calquera vexa esta conexión no teu perfil';

  @override
  String get connectionVisibilityFriends => 'Amigos';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Permite que os teus amigos vexan esta conexión';

  @override
  String get connectionVisibilityCommunityMembers => 'Membros da comunidade';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Permite que os membros das comunidades ás que pertences vexan esta conexión';

  @override
  String get connectionRemoveTitle => 'Eliminar conexión';

  @override
  String get connectionRemoveDescription =>
      'Estás seguro de que queres eliminar esta conexión? Esta acción non se pode desfacer.';

  @override
  String get connectionRemoveConfirm => 'Eliminar';

  @override
  String get connectionsLoadError => 'Non se puideron cargar as conexións';

  @override
  String get connectionsReorderError => 'Non se puido actualizar a orde';

  @override
  String get connectionInitiateFailed =>
      'Non se puido iniciar a verificación. Tenta de novo.';

  @override
  String get connectionVerifyFailed =>
      'Non se puido verificar. Comproba o teu rexistro de DNS e tenta de novo.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Non se puido iniciar a autorización de Bluesky.';

  @override
  String get connectionUpdateFailed => 'Non se puido actualizar a conexión';

  @override
  String get connectionRemoveFailed => 'Non se puido eliminar a conexión';

  @override
  String get connectionTokenSavedToast => 'Gardouse fluxer-verification';

  @override
  String get connectionTokenSaveFailedToast => 'Non se puido gardar o ficheiro';

  @override
  String get connectionEnterHandle =>
      'Introduce un nome de usuario de Bluesky.';

  @override
  String get connectionEnterDomain => 'Introduce un dominio.';

  @override
  String get lookAndFeelTitle => 'Aspecto';

  @override
  String get lookAndFeelThemeSectionTitle => 'Tema';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Elixe entre a aparencia escura, carbón ou clara.';

  @override
  String get lookAndFeelThemeDark => 'Tema escuro';

  @override
  String get lookAndFeelThemeCoal => 'Tema carbón';

  @override
  String get lookAndFeelThemeLight => 'Tema claro';

  @override
  String get lookAndFeelThemeSystem => 'Tema do sistema';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Sincronizar tema entre dispositivos';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Cando estea activado, os cambios de tema sincronizaranse en todos os teus dispositivos. Cando estea desactivado, este dispositivo usará a súa propia configuración de tema.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'O tema do sistema desactiva automaticamente a sincronización para rastrexar a preferencia do teu sistema neste dispositivo.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Non se puido sincronizar o tema coa túa conta. Tenta de novo.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Escalado de fontes de chat';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Axusta o tamaño da fonte na área de chat.';

  @override
  String get lookAndFeelInterfaceTitle => 'Interface';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Personaliza os elementos e comportamentos da interface.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Indicadores de escritura na lista de canles';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Elixe como aparecen os indicadores de escritura na lista de canles cando alguén está escribindo nunha canle.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Indicador de escritura + avatares';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Mostra o indicador de escritura con avatares de usuario na lista de canles';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Só indicador de escritura';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Mostra só o indicador de escritura sen avatares';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Oculto';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Non mostres indicadores de escritura na lista de canles';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Mostrar escritura na canle seleccionada';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Cando estea desactivado (por defecto), os indicadores de escritura non aparecerán na canle que estás a ver.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'xeral';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Indicadores do teclado';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Controla se os indicadores de atallos de teclado aparecen nas descricións emerxentes.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Ocultar indicadores do teclado nas descricións emerxentes';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Cando estea activado, as insignias de atallos ocultaranse nas fiestras emerxentes.';

  @override
  String get lookAndFeelNekoTitle => 'Miscelánea';

  @override
  String get lookAndFeelNekoDescription => 'Opcións de interface misceláneas.';

  @override
  String get lookAndFeelShowNekoLabel => 'Mostrar Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Cando estea activado, Neko aparece preto da barra de entrada de chat.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Comportamento ao unirse a canles de voz';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Controla como te unes a canles de voz nas comunidades.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Require dobre clic para unirse a canles de voz';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Cando estea activado, necesitarás facer dobre clic nas canles de voz para unirte a elas. Cando estea desactivado (por defecto), un só clic unirá a canle inmediatamente.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'O veloz raposo marrón salta sobre o can preguiceiro.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Barra lateral de gremios';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Configura como a barra lateral de gremios mostra mensaxes directas.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count comunidades non están dispoñibles temporalmente debido a unha avaría no condensador de fluxo.',
      one:
          '1 comunidade non está dispoñible temporalmente debido a unha avaría no condensador de fluxo.',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel => 'Colapsar DMs nun cartafol';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'Cando estea activado, os DMs sen ler na barra lateral de gremios colapsaranse nun cartafol no botón de Fluxer. Fai clic no botón de Fluxer mentres estás na páxina de DMs para expandir ou colapsar o cartafol.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Lista de canles';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Controla o comportamento dos indicadores sen ler para as canles silenciadas nas listas de canles.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Mostrar indicador sen ler en canles silenciadas';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Cando estea activado, as canles silenciadas mostran un indicador sen ler atenuado no lado esquerdo. As mencións aínda aparecen independentemente desta configuración.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Activos agora';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Controla como se mostran os Activos agora na aplicación.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Mostrar Activos agora na pantalla de inicio';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Mostra Activos agora na pantalla de inicio para mostrar amigos activos na voz. Verás unha vista previa, o contexto da canle, quen xa está alí e unha forma rápida de unirte.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Favoritos';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Controla a visibilidade dos favoritos en toda a aplicación.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Activar Favoritos';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Cando estea activado, podes marcar canles como favoritas e aparecerán na sección de Favoritos. Cando estea desactivado, todos os elementos da interface relacionados cos favoritos (botóns, elementos de menú) ocultaranse. Os teus favoritos existentes conservaranse.';

  @override
  String get favoritesTitle => 'Favoritos';

  @override
  String get favoritesEmptyTitle => 'Aínda non hai favoritos';

  @override
  String get favoritesEmptyDescription =>
      'Marca canles na cabeceira do chat para mantelos aquí.';

  @override
  String get favoritesWelcomeTitle => 'Benvido/a a Favoritos';

  @override
  String get favoritesWelcomeDescription =>
      'O teu espazo persoal para acceder rapidamente a canles, DM e grupos que che gustan. Preme a estrela en calquera canle para engadila aquí.';

  @override
  String get favoritesWelcomeTip =>
      'Non é para ti? Desactívao en calquera momento.';

  @override
  String get favoritesDisableButton => 'Desactivar favoritos';

  @override
  String get favoritesAddedToast => 'Engadido a Favoritos';

  @override
  String get favoritesRemovedToast => 'Eliminado de Favoritos';

  @override
  String get favoritesHiddenToast => 'Favoritos ocultos';

  @override
  String get favoritesMute => 'Silenciar favoritos';

  @override
  String get favoritesUnmute => 'Activar o son dos favoritos';

  @override
  String get favoritesHeaderMenu => 'Menú de favoritos';

  @override
  String get favoritesCreateCategory => 'Crear categoría';

  @override
  String get favoritesCategoryNameLabel => 'Nome da categoría';

  @override
  String get favoritesHideMutedChannels => 'Ocultar canles silenciadas';

  @override
  String get favoritesShowMutedChannels => 'Mostrar canles silenciadas';

  @override
  String get favoritesSetNickname => 'Establecer alcume';

  @override
  String get favoritesNicknameLabel => 'Alcume';

  @override
  String get favoritesSaveNickname => 'Gardar alcume';

  @override
  String get favoritesMoveToCategory => 'Mover a categoría';

  @override
  String get favoritesUncategorized => 'Sen categorizar';

  @override
  String get favoritesOtherCategory => 'Outro';

  @override
  String get favoritesRemoveFromFavorites => 'Eliminar de Favoritos';

  @override
  String get favoritesAddToFavorites => 'Engadir a Favoritos';

  @override
  String get favoritesHideConfirmTitle => 'Ocultar favoritos';

  @override
  String get favoritesHideConfirmDescription =>
      'Isto ocultará todos os elementos da interface relacionados cos favoritos, incluíndo botóns e elementos do menú. Os teus favoritos existentes conservaranse e poderán ser reactivados en calquera momento dende Configuración > Avanzado > Aparición.';

  @override
  String get favoritesDirectMessageSubtitle => 'Mensaxe Directa';

  @override
  String get messagesMediaDisplayGroupTitle => 'Visualización';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Controla como se mostran as mensaxes, os medios e outro contido.';

  @override
  String get messagesMediaMediaGroupTitle => 'Medios';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Personaliza as preferencias de tamaño dos medios e os botóns.';

  @override
  String get messagesMediaInputGroupTitle => 'Entrada';

  @override
  String get messagesMediaInputGroupDescription =>
      'Personaliza a configuración de entrada de mensaxes.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Barra lateral';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Configura como se mostra a barra lateral da comunidade.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Ocultar canles silenciadas por defecto';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Oculta automaticamente as canles silenciadas na barra lateral cando te unes a novas comunidades';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Ocultar canles silenciadas por defecto?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'As novas comunidades ás que te unas terán automaticamente as canles silenciadas ocultas. Queres aplicar tamén esta configuración a todas as túas comunidades existentes?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Deixar de ocultar canles silenciadas por defecto?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'As novas comunidades ás que te unas xa non terán as canles silenciadas ocultas automaticamente. Queres tamén mostrar as canles silenciadas en todas as túas comunidades existentes?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Aplicar a todas as comunidades';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Mostrar en todas as comunidades';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Só novas comunidades';

  @override
  String get messagesMediaDisplaySectionTitle => 'Visualización de medios';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Controla como se mostran as imaxes, vídeos e outros medios. Todos os medios son redimensionados e convertidos. Os ficheiros extremadamente grandes que non se poden comprimir nunha vista previa non se incrustarán independentemente destas configuracións.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Cando se publican como ligazóns ao chat';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'Cando se cargan directamente a Fluxer';

  @override
  String get messagesMediaLinkPreviewsSectionTitle =>
      'Vistas previas de ligazóns';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Controla como se previsualizan as ligazóns de sitios web no chat';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Mostrar incrustacións e previsualizar ligazóns de sitios web';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reaccións';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Configurar reaccións de emoji nas mensaxes';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Mostrar reaccións de emoji nas mensaxes';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Contido spoiler';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Controlar como se mostra o contido spoiler';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Mostrar contido spoiler';

  @override
  String get messagesMediaSpoilersOnClickName => 'Ao facer clic';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Mostrar contido spoiler cando se fai clic';

  @override
  String get messagesMediaSpoilersIfModeratorName => 'En canles que modero';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Mostrar sempre o contido spoiler nas canles onde tes o permiso \"Xestionar mensaxes\"';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Sempre';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Mostrar sempre o contido spoiler';

  @override
  String get messagesMediaSizeSectionTitle =>
      'Preferencias de tamaño de medios';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Personaliza o tamaño máximo de visualización para medios incrustados e adxuntos. Os tamaños máis pequenos usan menos espazo na pantalla, mentres que os tamaños máis grandes mostran máis detalles.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Medios de ligazóns (incrustados)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Adxuntos cargados';

  @override
  String get messagesMediaSizeCompactName => 'Compacto (400x300)';

  @override
  String get messagesMediaSizeCompactDescription =>
      'Tamaño de medios máis pequeno';

  @override
  String get messagesMediaSizeComfortableName => 'Confortable (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Tamaño de medios máis grande con máis detalles';

  @override
  String get messagesMediaGifsSectionTitle => 'Comportamento dos GIF';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Controlar como se insiren os GIF no chat';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Enviar GIF automaticamente cando se seleccionan';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Autocompletar expresións (autocompletar dous puntos)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Controla o que aparece no autocompletar de expresións cando escribes dous puntos. Personaliza que suxestións aparecen para que coincidan coas túas preferencias.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Mostrar emojis predeterminados no autocompletar de expresións';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Mostrar emojis personalizados no autocompletar de expresións';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Mostrar adhesivos no autocompletar de expresións';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Mostrar medios gardados no autocompletar de expresións';

  @override
  String get messagesMediaEditingSectionTitle => 'Edición de mensaxes';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Controla o que sucede co teu borrador de edición cando cancelas.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Conservar o borrador de edición ao cancelar';

  @override
  String get accessibilitySaturationTitle => 'Saturation';

  @override
  String get accessibilitySaturationDescription =>
      'Adjust how vivid theme colors appear across the app.';

  @override
  String get accessibilityUnreadGroupTitle => 'Indicadores de non lido';

  @override
  String get accessibilityUnreadGroupDescription =>
      'Controla como se mostran os indicadores de mensaxes non lidas.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'Mostrar indicador de non lido atenuado en canles silenciadas';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'Mostra un indicador de non lido atenuado xunto a mensaxes directas e canles silenciadas para que aínda poidas ver dunha ollada cando hai actividade.';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'Vistas previas de mensaxes DM';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Controla cando se mostran as vistas previas das mensaxes na lista de DM.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Modo de vista previa de mensaxes DM';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Todas as mensaxes';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Mostrar vistas previas de mensaxes para todas as conversas de DM';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName => 'Só DM sen ler';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Mostrar só vistas previas de mensaxes para DM con mensaxes sen ler';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Ningún';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Non mostrar vistas previas de mensaxes na lista de DM';

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
  String get dmListSentAnAttachment => 'Enviou un anexo';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username fixou unha mensaxe nesta canle.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username engadiu a $userName ao grupo.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username engadiu a alguén ao grupo.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username deixou o grupo.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username eliminou $userName do grupo.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username eliminou a alguén do grupo.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username cambiou o nome do canal a $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username cambiou o nome do canal.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username cambiou a icona do canal.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username iniciou unha chamada.';
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
  String get voiceConnectionConfirmTitle => 'Confirmación de conexión de voz';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Xa estás conectado a esta canle de voz desde $count dispositivos máis. Que queres facer?',
      one:
          'Xa estás conectado a esta canle de voz desde 1 dispositivo máis. Que queres facer?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Cambiar a este dispositivo';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Simplemente unirse (manter outras conexións)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Non facer nada, non quero unirme';

  @override
  String get voiceJoinFailedTitle => 'Couldn\'t Join Voice';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Couldn\'t disconnect your other devices. Try again in a moment.';

  @override
  String get voiceChannelEmptyDescription =>
      'Esta é unha canle de voz. Conéctate para comezar a falar!';

  @override
  String get voiceChannelJoin => 'Unirse á canle de voz';

  @override
  String get voiceChannelJoinConnect => 'Conectar á voz';

  @override
  String get voiceChannelNoConnectPermission =>
      'Non tes permiso para unirte a esta canle de voz';

  @override
  String get voiceChannelE2eeEncrypted =>
      'O micrófono, a cámara e o contido para compartir pantalla están cifrados de extremo a extremo.';

  @override
  String get voiceCallE2eeEncrypted =>
      'O micrófono, a cámara e o contido para compartir pantalla están cifrados de extremo a extremo.';

  @override
  String get voiceChannelE2eeBroken =>
      'O cifrado de extremo a extremo non está dispoñible porque hai un participante non compatible nesta canle de voz.';

  @override
  String get voiceCallE2eeBroken =>
      'O cifrado de extremo a extremo non está dispoñible porque hai un participante non compatible nesta chamada.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Este cliente debe actualizarse antes de unirse a esta chamada cifrada.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Non se puido iniciar o teu micrófono. Segues na chamada.';

  @override
  String get voiceChannelStatusConnecting => 'Conectando...';

  @override
  String get voiceChannelStatusConnected => 'Conectado';

  @override
  String get voiceChannelStatusError => 'Erro';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Dispositivo móbil';

  @override
  String get voiceParticipantTooltipDesktopDevice =>
      'Dispositivo de escritorio';

  @override
  String get voiceParticipantTooltipCommunityMuted =>
      'Silenciado pola comunidade';

  @override
  String get voiceParticipantTooltipMuted => 'Silenciado';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Enmudecido pola comunidade';

  @override
  String get voiceParticipantTooltipDeafened => 'Enmudecido';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Conexión: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count participantes',
      one: '1 participante',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Abandonar';

  @override
  String get voiceControlMute => 'Silenciar';

  @override
  String get voiceControlUnmute => 'Activar son';

  @override
  String get voiceControlDeafen => 'Enmudecer';

  @override
  String get voiceControlUndeafen => 'Desemudecer';

  @override
  String get voiceControlVideo => 'Vídeo';

  @override
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'Compartir pantalla';

  @override
  String get voiceScreenShareNotificationText => 'Compartindo a túa pantalla.';

  @override
  String get voiceControlMore => 'Máis';

  @override
  String get voiceControlDisconnect => 'Desconectar';

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
  String get voiceTextChatShow => 'Mostrar chat';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# mensaxes sen ler',
      one: '# mensaxe sen ler',
    );
    return 'Mostrar chat con $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'O permiso da cámara é necesario para o vídeo.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Non se puido iniciar o uso compartido da pantalla. Tenta de novo.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Denegouse o permiso para compartir pantalla.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Compartir pantalla non está dispoñible neste dispositivo.';

  @override
  String get voiceWatchStream => 'Ver transmisión';

  @override
  String get voiceStopWatching => 'Deixar de ver';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Deixar de ver o fluxo actual';

  @override
  String get voiceOwnScreenShareTitle => 'Estás a transmitir';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'O teu fluxo está en directo para os participantes.';

  @override
  String get voiceLiveBadge => 'EN DIRECTO';

  @override
  String get dmVoiceViewCall => 'Ver chamada';

  @override
  String get dmVoiceCallFullScreen => 'Pantalla completa';

  @override
  String get dmVoiceCallFullScreenTooltip =>
      'Abrir a chamada en pantalla completa';

  @override
  String get dmVoiceStripStatusConnecting => 'Conectando...';

  @override
  String get dmVoiceStripStatusInCall => 'En chamada';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Chamada de voz';

  @override
  String get dmVoiceCallBarConnecting => 'Conectando...';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Chamada directa';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Chamada de grupo';

  @override
  String get dmVoiceCallBarIssueFallback => 'Problema de voz';

  @override
  String get dmVoiceFullscreenTitle => 'Voz';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Voz conectada';

  @override
  String get notificationsPageTitle => 'Notificacións';

  @override
  String get notificationsFilterUnreads => 'Non lidas';

  @override
  String get notificationsFilterMentions => 'Mencións';

  @override
  String get notificationsBookmarksTooltip => 'Marcadores';

  @override
  String get notificationsMentionFilterTooltip => 'Filtrar mencións';

  @override
  String get notificationsMentionFiltersTitle => 'Filtros de mencións';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Incluír mencións de @everyone e @here';

  @override
  String get notificationsMentionIncludeRoles => 'Incluír mencións de roles';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Incluír todas as mencións da comunidade';

  @override
  String get notificationsNoUnreadTitle => 'Sen mensaxes sen ler';

  @override
  String get notificationsNoUnreadBody => 'Estás ao día.';

  @override
  String get notificationsNoMentionsTitle => 'Sen mencións recentes';

  @override
  String get notificationsNoMentionsBody =>
      'Todas as @mencións a ti aparecerán aquí durante 7 días.';

  @override
  String get notificationsMentionsEndTitle => 'Chegaches ao final';

  @override
  String get notificationsMentionsEndBody =>
      'Viches todas as túas mencións recentes. Non te preocupes, pronto aparecerán máis aquí.';

  @override
  String get notificationsJump => 'Saltar';

  @override
  String get notificationsRemoveMentionTooltip => 'Eliminar mención';

  @override
  String get notificationsViewAllUnread => 'Ver todas as non lidas';

  @override
  String get notificationsMarkAsRead => 'Marcar como lido';

  @override
  String get notificationsExpand => 'Expandir';

  @override
  String get notificationsCollapse => 'Colapsar';

  @override
  String get notificationsMessageUnavailable =>
      'Non se puido cargar esta mensaxe.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining caracteres restantes';
  }

  @override
  String get characterCounterTooLong => 'A mensaxe é moi longa';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining caracteres restantes. Obtén $productName para escribir ata $premiumMaxLength caracteres.';
  }

  @override
  String get chatMessageFailedToSend => 'Non se puido enviar a mensaxe';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'A túa mensaxe non se puido entregar. Isto adoita deberse a que non compartes unha comunidade co destinatario ou a que o destinatario só acepta mensaxes directas de amigos. Tamén pode ser necesario axustar a túa propia configuración de privacidade de mensaxes directas en $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'A túa mensaxe non se puido entregar. Debes reclamar a túa conta para enviar mensaxes directas.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'A túa mensaxe non se puido entregar. Debes reclamar a túa conta para enviar mensaxes.';

  @override
  String get chatSendFailureContentBlocked =>
      'A túa mensaxe non se puido entregar porque foi sinalada polos nosos sistemas de seguranza. Se cres que isto é un erro, ponte en contacto co soporte.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'A túa mensaxe non se puido entregar porque contén emojis ou adhesivos para adultos que non están permitidos neste contexto.';

  @override
  String get chatClientSystemOnlyYouCanSee => 'Só ti podes ver esta mensaxe.';

  @override
  String get chatClientSystemDismiss => 'Descartar';

  @override
  String get privacyDashboardCommunicationSection => 'Comunicación';

  @override
  String get chatMessageDeleteFailed => 'Fallou a eliminación';

  @override
  String get chatMessageAddReaction => 'Engadir reacción';

  @override
  String get chatMessageEdit => 'Editar mensaxe';

  @override
  String get chatMessageReply => 'Responder';

  @override
  String get chatMessageForward => 'Enviar';

  @override
  String get forwardMessageTitle => 'Enviar mensaxe';

  @override
  String get forwardSearchHint => 'Buscar canles ou DM';

  @override
  String get forwardDirectMessagesSection => 'Mensaxes directas';

  @override
  String get forwardCommentHint => 'Engadir un comentario (opcional)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Enviar ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Non se atoparon canles';

  @override
  String get forwardSuccessToast => 'Mensaxe enviada';

  @override
  String get forwardFailed => 'Non se puido enviar a mensaxe';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Os comentarios non están dispoñibles porque unha canle seleccionada ten activado o modo lento.';

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
      'Non podes enviar mensaxes aquí';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Non podes incrustar ligazóns aquí';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Non podes adxuntar ficheiros aquí';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'O envío de mensaxes está desactivado nesta comunidade';

  @override
  String get forwardDestinationTimedOut =>
      'Tes un tempo de espera nesta comunidade';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Modo lento - agarda $remaining';
  }

  @override
  String get chatMessageCopyText => 'Copiar mensaxe';

  @override
  String get chatMessagePin => 'Fixar mensaxe';

  @override
  String get chatMessageUnpin => 'Desfijar mensaxe';

  @override
  String get chatMessageUnpinIt => 'Desfijar';

  @override
  String get chatMessageBookmark => 'Marcar mensaxe';

  @override
  String get chatMessageRemoveBookmark => 'Eliminar marcador';

  @override
  String get chatMessageMarkAsUnread => 'Marcar como non lida';

  @override
  String get chatMessageCopyMessageLink => 'Copiar ligazón da mensaxe';

  @override
  String get chatMessageCopyMessageId => 'Copiar ID da mensaxe';

  @override
  String get chatMessageViewReactions => 'Ver reaccións';

  @override
  String get chatMessageRemoveAllReactions => 'Eliminar todas as reaccións';

  @override
  String get chatMessageDebug => 'Depurar mensaxe';

  @override
  String get chatMessageDebugSheetTitle => 'Depurar mensaxe';

  @override
  String get chatMessageDebugCopyJson => 'Copiar JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'JSON da mensaxe copiado ao portapapeis';

  @override
  String get chatReactionsSheetTitle => 'Reaccións';

  @override
  String get chatReactionsSheetEmpty => 'Ninguén reaccionou aínda.';

  @override
  String get chatMessageReport => 'Informar sobre a mensaxe';

  @override
  String get iarReportMessageTitle => 'Informar sobre a mensaxe';

  @override
  String get iarThisUserFallback => 'este usuario';

  @override
  String get iarModalDescription =>
      'Informar dunha violación de normas ou atopar ferramentas para xestionar contactos e preferencias.';

  @override
  String get iarPathStepAriaLabel => 'Que necesitas?';

  @override
  String get iarCategoryStepTitle => 'Que tipo de norma se rompeu?';

  @override
  String get iarReasonStepTitle => 'Que norma se rompeu?';

  @override
  String get iarReasonSelectHint => 'Selecciona unha razón';

  @override
  String get iarPickAnOptionToast => 'Selecciona unha opción para continuar.';

  @override
  String get iarPickARuleToast => 'Selecciona a norma que se rompeu.';

  @override
  String get iarPathPlatform =>
      'Informar dunha violación dunha norma da plataforma';

  @override
  String get iarPathCommunity => 'Informar aos moderadores desta comunidade';

  @override
  String get iarPathPreferenceMessage => 'Non me gusta este contido';

  @override
  String get iarCategoryTargetedHarmLabel => 'Ameazas, acoso ou dano';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Bulis, ameazas, odio, violencia, incursións ou contido que fomenta o autolesión.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Seguridade infantil ou contido para adultos';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Menores en risco, contido para adultos no lugar equivocado ou conduta non desexada.';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'Privacidade ou suplantación de identidade';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxxing, acoso, facerse pasar por alguén ou un perfil inapropiado.';

  @override
  String get iarCategoryDeceptionLabel => 'Estafas, malware ou desinformación';

  @override
  String get iarCategoryDeceptionDescription =>
      'Phishing, fraude, ligazóns maliciosas ou afirmacións falsas que probablemente causen danos no mundo real.';

  @override
  String get iarCategoryIllegalOtherLabel => 'Actividade ilegal ou algo máis';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Vendas ilegais, facilitación criminal ou unha violación clara das regras que non encaixa nas anteriores.';

  @override
  String get iarReasonHarassmentLabel => 'Acoso ou ameazas';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Bulis, contacto repetido non desexado, acoso ou abuso dirixido.';

  @override
  String get iarReasonHateLabel => 'Discurso de odio';

  @override
  String get iarReasonHateMessageDescription =>
      'Insultos, linguaxe deshumanizante ou ataques a grupos protexidos.';

  @override
  String get iarReasonViolenceLabel => 'Violencia ou ameazas violentas';

  @override
  String get iarReasonViolenceDescription =>
      'Ameazas críbeis, violencia gráfica ou glorificación da violencia.';

  @override
  String get iarReasonMatureContentLabel => 'Contido para adultos ou acoso';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Conduta non desexada ou contido para adultos no lugar equivocado.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Seguridade infantil ou explotación de menores';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Contido de grooming ou explotación infantil.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Desinformación prexudicial';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Afirmacións falsas que probablemente causen danos no mundo real.';

  @override
  String get iarReasonSpamLabel => 'Spam, estafas ou phishing';

  @override
  String get iarReasonSpamMessageDescription =>
      'Spam masivo, fraude, sorteos falsos ou abuso de contas.';

  @override
  String get iarReasonMalwareLabel => 'Malware ou ligazóns perigosas';

  @override
  String get iarReasonMalwareDescription =>
      'Malware, roubo de credenciais ou ficheiros perigosos.';

  @override
  String get iarReasonPrivacyLabel => 'Violación da privacidade';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxxing, información privada exposta ou acoso.';

  @override
  String get iarReasonImpersonationLabel =>
      'Suplantación de identidade ou medios enganosos';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Facerse pasar por outra persoa, incluído contido xerado por IA enganoso.';

  @override
  String get iarReasonIllegalLabel => 'Actividade ilegal';

  @override
  String get iarReasonIllegalDescription =>
      'Vendas ilegais, facilitación criminal ou actividade ilegal.';

  @override
  String get iarReasonSelfHarmLabel => 'Autolesión ou suicidio';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Promoción ou instrucións que animan á autolesión ou aos trastornos alimentarios.';

  @override
  String get iarReasonOtherLabel => 'Outra violación clara das regras';

  @override
  String get iarReasonOtherDescription =>
      'Use só se viola claramente as regras de Fluxer e non encaixa nas anteriores.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Se se involucra un menor, use \"$childSafetyReason\" no seu lugar.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Se isto implica CSAM ou explotación dun menor, envíeo agora e non o volva compartir.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Se alguén pode estar en perigo inmediato, contacte cos servizos de emerxencia locais se pode facelo de forma segura.';

  @override
  String get iarSafetyNoteViolence =>
      'Se se trata dunha ameaza inminente críbel, contacte tamén cos servizos de emerxencia locais.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Se se trata dunha ameaza terrorista inminente, contacte tamén cos servizos de emerxencia locais.';

  @override
  String get iarActionBlockUserTitle => 'Bloquear este usuario';

  @override
  String get iarActionBlockUserDescription =>
      'Deixa de recibir mensaxes e solicitudes de amizade.';

  @override
  String get iarActionBlockUserButton => 'Bloquear';

  @override
  String get iarActionCopyMessageLinkTitle => 'Copiar ligazón da mensaxe';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Compartir cos moderadores da comunidade.';

  @override
  String get iarActionCopyMessageLinkButton => 'Copiar';

  @override
  String get iarActionCloseDmTitle => 'Pechar este DM';

  @override
  String get iarActionCloseDmDescription =>
      'Non bloquea. Podes reabrir máis tarde.';

  @override
  String get iarActionCloseDmButton => 'Pechar DM';

  @override
  String get iarActionLeaveCommunityTitle => 'Abandonar a comunidade';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Deixa de ver o seu contido e membros.';

  @override
  String get iarActionLeaveCommunityButton => 'Abandonar';

  @override
  String get iarActionDmSettingsTitle =>
      'Configuración de DM e solicitudes de amizade';

  @override
  String get iarActionDmSettingsDescription =>
      'Cambia quen pode contactar contigo.';

  @override
  String get iarActionCallSettingsTitle =>
      'Configuración de chamadas e chats de grupo';

  @override
  String get iarActionCallSettingsDescription =>
      'Cambia quen pode chamarte ou engadirte.';

  @override
  String get iarActionOpenButton => 'Abrir';

  @override
  String get iarActionDeleteMessageTitle => 'Eliminar esta mensaxe';

  @override
  String get iarActionDeleteMessageDescription =>
      'Elimínaa da canle para todos.';

  @override
  String get iarActionDeleteMessageButton => 'Eliminar';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Eliminada';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Esta mensaxe xa foi eliminada.';

  @override
  String get iarActionBanUserTitle => 'Bloquear este usuario';

  @override
  String get iarActionBanUserDescription =>
      'Abre o diálogo de bloqueo para esta comunidade.';

  @override
  String get iarActionBanUserButton => 'Bloquear';

  @override
  String get iarActionBanUserBannedButton => 'Bloqueado';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Este usuario xa está bloqueado na comunidade.';

  @override
  String get iarCloseDmConfirmTitle => 'Pechar DM';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Pecha o teu DM actual con $name. Isto non os bloquea; podes reabrirlo máis tarde.';
  }

  @override
  String get iarSuccessTitle => 'Informe enviado';

  @override
  String get iarSuccessBody =>
      'O noso equipo de seguridade está a revisalo. Enviarémosche un DM e un correo electrónico unha vez que cheguemos a un veredicto.';

  @override
  String get iarAlreadyReportedTitle => 'Xa se informou';

  @override
  String get iarAlreadyReportedBody =>
      'Xa informaches desta mensaxe. O noso equipo de seguridade está a revisalo.';

  @override
  String get iarBackButton => 'Atrás';

  @override
  String get iarContinueButton => 'Continuar';

  @override
  String get iarSendReportButton => 'Enviar informe';

  @override
  String get iarDoneButton => 'Feito';

  @override
  String get iarCouldntSendToast =>
      'Non se puido enviar o informe. Tenta de novo.';

  @override
  String get iarRateLimitedToast =>
      'Estás informando moi rápido. Agarda un momento e tenta de novo.';

  @override
  String get iarReportSentToast =>
      'Informe enviado. O noso equipo de seguridade revisarao.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Bloquear $name? Non poderán enviarche mensaxes nin solicitudes de amizade. Podes desbloquealos máis tarde.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Non se puido bloquear este usuario. Tenta de novo.';

  @override
  String get iarCloseDmSuccessToast => 'DM pechado.';

  @override
  String get iarCloseDmFailedToast =>
      'Non se puido pechar este DM. Tenta de novo.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Non se puido abandonar esta comunidade. Tenta de novo.';

  @override
  String get chatMessageSuppressEmbeds => 'Suprimir incrustacións';

  @override
  String get chatMessageUnsuppressEmbeds => 'Restaurar incrustacións';

  @override
  String get chatMessageDelete => 'Eliminar mensaxe';

  @override
  String get chatMessageDeleteConfirmTitle => 'Eliminar mensaxe';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Estás seguro de que queres eliminar esta mensaxe?';

  @override
  String get chatMessageDeleteAttachment => 'Delete Attachment';

  @override
  String get chatMessageEditAttachmentAltText => 'Edit Alt Text';

  @override
  String get chatMessageMore => 'Máis';

  @override
  String get chatEditingMessage => 'Editando mensaxe';

  @override
  String get chatReplyOriginalDeleted => 'A mensaxe orixinal foi eliminada';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'A mensaxe orixinal non se puido cargar';

  @override
  String get chatReplyAttachedMedia => 'A mensaxe contén medios adxuntos';

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
  String get chatMessagesLoadError => 'Non se puideron cargar as mensaxes.';

  @override
  String get chatReplyMentionOverrideTitle =>
      'Anular a preferencia de mención?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return 'A $authorNickname gústalle ser @mencionada nas respostas. Queres enviar sen a mención de todos os xeitos?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname prefire respostas sen @mención. Queres envialas con mención de todos os xeitos?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ignorar preferencia';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Fai clic para desactivar a notificación ao usuario ao que estás respondendo.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Fai clic para activar a notificación ao usuario ao que estás respondendo.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Mencionar usuario respondido';

  @override
  String get chatReplyMentionOn => 'Activado';

  @override
  String get chatReplyMentionOff => 'Desactivado';

  @override
  String get chatReplyCancel => 'Cancelar resposta';

  @override
  String get chatEditMessageHint => 'Editar mensaxe';

  @override
  String get chatEditNoChanges => 'Non hai cambios que gardar';

  @override
  String get chatChannelNotReady =>
      'Esta canle aínda non está lista. Inténtao de novo en breve.';

  @override
  String get chatMessageEdited => '(editado)';

  @override
  String get chatMessageSilent => 'Esta foi unha mensaxe @silent.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Hoxe ás $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Onte ás $time';
  }

  @override
  String get mediaViewerImagePreview => 'Vista previa da imaxe';

  @override
  String get mediaViewerClose => 'Pechar visor multimedia';

  @override
  String get mediaViewerOpenInBrowser => 'Abrir no navegador';

  @override
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

  @override
  String get mediaViewerForward => 'Enviar';

  @override
  String get mediaViewerZoomIn => 'Ampliar';

  @override
  String get mediaViewerZoomOut => 'Reducir';

  @override
  String get mediaViewerPreviousAttachment => 'Anexo anterior';

  @override
  String get mediaViewerNextAttachment => 'Anexo seguinte';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String get chatAttachmentVideoToggleControls => 'Alternar controis de vídeo';

  @override
  String get chatAttachmentVideoMute => 'Silenciar vídeo';

  @override
  String get chatAttachmentVideoUnmute => 'Activar son do vídeo';

  @override
  String get chatAttachmentVideoPlay => 'Reproducir vídeo';

  @override
  String get chatAttachmentVideoPause => 'Pausar vídeo';

  @override
  String get chatAttachmentVideoProgress => 'Progreso do vídeo';

  @override
  String get chatVideoPlaybackFailed => 'Non se puido reproducir este vídeo.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Notificar aos usuarios con este rol que teñan permiso para ver esta canle.';

  @override
  String get addGuildModalTitle => 'Engadir unha comunidade';

  @override
  String get addGuildModalLandingDescription =>
      'Crea unha nova comunidade ou únete a unha existente.';

  @override
  String get addGuildCreateCommunity => 'Crear comunidade';

  @override
  String get addGuildJoinCommunity => 'Unirse á comunidade';

  @override
  String get addGuildImportDiscordTemplate => 'Importar modelo de Discord';

  @override
  String get addGuildJoinTitle => 'Unirse a unha comunidade';

  @override
  String get addGuildJoinDescription =>
      'Introduce a ligazón de invitación para unirte a unha comunidade.';

  @override
  String get addGuildInviteLinkLabel => 'Ligazón de invitación';

  @override
  String get addGuildJoinSubmit => 'Unirse á comunidade';

  @override
  String get addGuildInviteInvalid =>
      'Esta invitación non é válida ou caducou.';

  @override
  String get addGuildJoinFailed =>
      'Non se puido unirse á comunidade. Tenta de novo.';

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
  String get addGuildPackInstalled => 'Paquete instalado correctamente.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Eliminar todas as reaccións';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Estás seguro de que queres eliminar todas as reaccións desta mensaxe?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Desanexar mensaxe';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Queres enviar esta anexa ao pasado?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username fixo unha anexa a $messageLink nesta canle. Ver $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'unha mensaxe';

  @override
  String get systemPinMessageAllPinsLink => 'todas as mensaxes fixadas';

  @override
  String get channelPinsEmptyTitle => 'Ningunha mensaxe fixada';

  @override
  String get channelPinsEmptyDescription =>
      'As mensaxes fixadas aparecerán aquí.';

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
  String get personalNotesTitle => 'Notas persoais';

  @override
  String get personalNotesSubtitle =>
      'O teu espazo privado para pensamentos e recordatorios';

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
    return 'Benvido/a a $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'Ao principio, non había nada. Logo, houbo $channelName. E estivo ben.';
  }

  @override
  String get personalNotesComposerHint => 'Mándate unha mensaxe';

  @override
  String get personalNotesPrivateSpace => 'O teu espazo privado';

  @override
  String get purgePersonalNotes => 'Purgar notas persoais';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Isto eliminará permanentemente todas as mensaxes e anexos das túas notas persoais. Non se pode desfacer.';

  @override
  String get purgePersonalNotesConfirmButton => 'Purgar';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Purgadas $count mensaxes das notas persoais';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'As notas persoais xa estaban baleiras';

  @override
  String get purgePersonalNotesFailed =>
      'Non se puideron limpar as notas persoais';

  @override
  String get userSettingsGroupYourAccount => 'A TÚA CONTA';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'Perfil';

  @override
  String get userSettingsNavSecurityLogin => 'Seguranza e inicio de sesión';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Agasallos e códigos';

  @override
  String get userSettingsNavPrivacyDashboard => 'Panel de privacidade';

  @override
  String get userSettingsNavAuthorizedApps => 'Aplicacións autorizadas';

  @override
  String get userSettingsNavBlockedUsers => 'Usuarios bloqueados';

  @override
  String get userSettingsNavLinkedDevices => 'Dispositivos vinculados';

  @override
  String get userSettingsNavConnections => 'Conexións';

  @override
  String get userSettingsNavLookAndFeel => 'Aspecto';

  @override
  String get userSettingsNavAccessibility => 'Accesibilidade';

  @override
  String get userSettingsNavChat => 'Mensaxes e multimedia';

  @override
  String get userSettingsNavAudioAndVideo => 'Audio e vídeo';

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
  String get userSettingsNavLanguageAndTime => 'Idioma e hora';

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
  String get userSettingsNavAdvanced => 'Avanzado';

  @override
  String get advancedPerformanceReportingTitle => 'Informes de rendemento';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Axuda a mellorar Fluxer compartindo datos anónimos de fallos e rendemento.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Enviar informes de fallos e rendemento';

  @override
  String get advancedPerformanceReportingDescription =>
      'Todos os datos informados son anónimos e só se envían ao propio servizo de monitorización de Fluxer; non se utilizan provedores de terceiros.';

  @override
  String get userSettingsNavApplications => 'Aplicacións';

  @override
  String get userSettingsNavAppLogs => 'Rexistros da aplicación';

  @override
  String get userSettingsNavDeveloperTools => 'Ferramentas de desenvolvemento';

  @override
  String get userSettingsNavLimitsConfig => 'Configuración de límites';

  @override
  String get userSettingsNavFeatureFlags => 'Indicadores de funcións';

  @override
  String get userSettingsNavWhatsNew => 'Novidades';

  @override
  String get userSettingsNavLogOut => 'Pechar sesión';

  @override
  String get betaWarningTitle => 'Software beta';

  @override
  String get betaWarningMessage =>
      'Este é un software beta. Aínda non todo está rematado ou engadido.';

  @override
  String get betaWarningReportIssues =>
      'Por favor, informa de calquera problema que atopes á comunidade de Fluxer Mobile (actualmente debes ter Plutonium para poder unirte á comunidade).';

  @override
  String get betaWarningRepoLink => 'Ver código fonte en GitHub';

  @override
  String get betaWarningGotIt => 'Entendido';

  @override
  String get quickSwitcherTabSearch => 'Buscar';

  @override
  String get quickSwitcherTabFriends => 'Amigos';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Buscar canles, persoas ou comunidades';

  @override
  String get quickSwitcherSearchFriends => 'Buscar amigos';

  @override
  String get quickSwitcherNoMatchesFound => 'Non se atoparon coincidencias';

  @override
  String get quickSwitcherEmptyHint =>
      'Proba cun nome diferente ou usa os prefixos @ / # / ! / * para filtrar os resultados.';

  @override
  String get quickSwitcherSectionPeople => 'Persoas';

  @override
  String get quickSwitcherSectionGroupMessages => 'Mensaxes de grupo';

  @override
  String get quickSwitcherSectionTextChannels => 'Canles de texto';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Canles de voz';

  @override
  String get quickSwitcherSectionCommunities => 'Comunidades';

  @override
  String get quickSwitcherSectionSettings => 'Configuración';

  @override
  String get quickSwitcherHomeLabel => 'Inicio';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Mensaxes directas';

  @override
  String get quickSwitcherFavoritesLabel => 'Favoritos';

  @override
  String get quickSwitcherUserSettingsLabel => 'Configuración do usuario';

  @override
  String get quickSwitcherNotificationsLabel => 'Notificacións';

  @override
  String get quickSwitcherBookmarksLabel => 'Marcadores';

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
  String get quickSwitcherMentionsLabel => 'Mencións';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Aínda non hai amigos';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Engade un amigo para comezar.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Ningún amigo coincide con esa busca';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Proba cun nome diferente.';

  @override
  String get quickSwitcherSearchAliasUser => 'Usuario';

  @override
  String get quickSwitcherSearchAliasYou => 'Ti';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'MD';

  @override
  String get quickSwitcherSearchAliasMessages => 'Mensaxes';

  @override
  String get quickSwitcherSearchAliasFav => 'Fav';

  @override
  String get quickSwitcherSearchAliasStarred => 'Marcadas';

  @override
  String get quickSwitcherSearchAliasInbox => 'Bandeira';

  @override
  String get quickSwitcherSearchAliasSaved => 'Gardadas';

  @override
  String get uiClose => 'Pechar';

  @override
  String get chatJumpToBottom => 'Saltar ao final';

  @override
  String get uiConfirm => 'Confirmar';

  @override
  String get uiLoading => 'Cargando';

  @override
  String get uiUnsavedChanges => 'Cambios sen gardar';

  @override
  String get uiReset => 'Restablecer';

  @override
  String get uiOpenColorPicker => 'Abrir selector de cores';

  @override
  String get uiSelectPlaceholder => 'Seleccionar';

  @override
  String get uiSearchPlaceholder => 'Buscar';

  @override
  String get uiNoOptionsFound => 'Non se atoparon opcións';

  @override
  String get uiDismissNotification => 'Descartar notificación';

  @override
  String get uiColorPickerTitle => 'Selector de cores';

  @override
  String get mentionConfirmTitle => 'Mencionar a todos?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Isto notificará a $count membros. Continuar?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Isto notificará a $count membros en liña. Continuar?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'This will notify $count members with the $roleName role. Continue?';
  }

  @override
  String get mentionConfirmButton => 'Mencionar';

  @override
  String get composerEmojiUnavailable => 'Non podes usar ese emoji aquí.';

  @override
  String get instanceUrlLabel => 'URL da instancia';

  @override
  String get instanceUrlPlaceholder =>
      'Introduce a URL da instancia (p. ex., fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Restablecer a Fluxer';

  @override
  String get instanceConnect => 'Conectar';

  @override
  String get instanceConnecting => 'Conectando…';

  @override
  String get instanceConnectFailed => 'Non se puido conectar á instancia';

  @override
  String get recentInstances => 'Instancias recentes';

  @override
  String removeRecentInstance(String domain) {
    return 'Eliminar $domain das instancias recentes';
  }

  @override
  String get instanceSheetTitle => 'Conectar á instancia';

  @override
  String get connectToDifferentInstance =>
      'Conectar a unha instancia diferente';

  @override
  String get changeInstance => 'Cambiar';

  @override
  String get instanceConnectionRequired =>
      'Conéctate á instancia para iniciar sesión';

  @override
  String get comingSoon => 'Próximamente';

  @override
  String get guildNavbarDirectMessages => 'Mensaxes directas';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Explorar comunidades descubríbeis';

  @override
  String get discoveryExplore => 'Explorar';

  @override
  String get discoveryExplorePublicCommunities =>
      'Explorar comunidades públicas';

  @override
  String get discoveryListingSubheading =>
      'Queres listar a túa comunidade aquí? Solicita se cumpres os requisitos en configuración da túa comunidade > Descubrimento.';

  @override
  String get discoverySearchCommunities => 'Buscar comunidades';

  @override
  String get discoveryFilterByLanguage => 'Filtrar por idioma';

  @override
  String get discoveryAllLanguages => 'Todos os idiomas';

  @override
  String get discoveryAllCategories => 'Todo';

  @override
  String get discoveryCategoryGaming => 'Xogos';

  @override
  String get discoveryCategoryMusic => 'Música';

  @override
  String get discoveryCategoryEntertainment => 'Entretemento';

  @override
  String get discoveryCategoryEducation => 'Educación';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Ciencia e Tecnoloxía';

  @override
  String get discoveryCategoryContentCreator => 'Creador de contido';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime e Manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Películas e TV';

  @override
  String get discoveryCategoryOther => 'Outro';

  @override
  String get discoveryNoCommunitiesMatch => 'Ningunha comunidade coincide.';

  @override
  String get discoveryJoinCommunity => 'Unirse á comunidade';

  @override
  String get discoveryJoined => 'Unido';

  @override
  String discoveryOnlineCount(String count) {
    return '$count en liña';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString membros',
      one: '1 membro',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Sen descrición.';

  @override
  String get discoveryCommunities => 'Comunidades';

  @override
  String get discoveryApps => 'Aplicacións';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Non se puido unirse a esta comunidade';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Algo saíu mal. Tenta de novo en breve.';

  @override
  String get discoveryJoinErrorFullTitle => 'Esta comunidade está chea';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Esta comunidade alcanzou o seu límite de membros, polo que non podes unirte agora.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Alcanzaches o límite de comunidades';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Estás no número máximo de comunidades. Abandona unha e tenta de novo.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Non podes unirte a esta comunidade';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Fuches expulsado desta comunidade.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Esta comunidade xa non está dispoñible';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Pode que deixase o descubrimento ou desactivase novas incorporacións. Actualiza a páxina e non a verás de novo.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Vas demasiado rápido';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Agarda un momento e tenta de novo.';

  @override
  String get guildNavbarAddCommunity => 'Engadir unha comunidade';

  @override
  String get guildNavbarHelp => 'Axuda';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'NOVA MENSAXE';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Contraer $folderName';
  }

  @override
  String get guildNavbarGroupDm => 'DM de grupo';

  @override
  String get guildNavbarCreateChannel => 'Crear canle';

  @override
  String get guildNavbarChannelType => 'Tipo de canle';

  @override
  String get guildNavbarTextChannel => 'Canle de texto';

  @override
  String get guildNavbarTextChannelDescription =>
      'Enviar mensaxes, imaxes, GIFs e emoji';

  @override
  String get guildNavbarVoiceChannel => 'Canle de voz';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Pasade tempo xuntos con voz, vídeo e compartición de pantalla';

  @override
  String get guildNavbarLinkChannel => 'Canle de enlace';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Acceso rápido a un sitio web ou recurso externo';

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
  String get guildNavbarCreateCategory => 'Crear categoría';

  @override
  String get guildNavbarNewCategoryHint => 'Nova categoría';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Invita amigos a $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Os destinatarios irán a #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Buscar amigos';

  @override
  String get guildNavbarNoFriendsYet => 'Aínda non hai amigos';

  @override
  String get guildNavbarNoResults => 'Sen resultados';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Ou, envía unha ligazón de invitación a un amigo:';

  @override
  String get guildNavbarInviteLink => 'Ligazón de invitación';

  @override
  String get guildNavbarCopy => 'Copiar';

  @override
  String get guildNavbarCopied => 'Copiado!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'A túa ligazón de invitación caduca en 7 días.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Esta ligazón de invitación nunca caduca.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'A túa ligazón de invitación caduca en $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Editar ligazón de invitación';

  @override
  String get guildNavbarInviteLinkSettings =>
      'Configuración da ligazón de invitación';

  @override
  String get guildNavbarExpireAfter => 'Caduca despois de';

  @override
  String get guildNavbarMaxUses => 'Número máximo de usos';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Conceder membresía temporal';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Os membros serán eliminados cando se desconecten a menos que se asigne un rol';

  @override
  String get guildNavbarCreateNewLink => 'Crear nova ligazón';

  @override
  String get guildNavbarSent => 'Enviado';

  @override
  String get guildNavbarInvite => 'Invitar';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Abandonar comunidade';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Estás seguro de que queres abandonar esta comunidade? Xa non poderás ver ningunha mensaxe.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Abandonar comunidade';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Eliminar as túas mensaxes nesta comunidade?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Elimina permanentemente todas as mensaxes que enviaches aquí, en todas as canles. Non se pode desfacer.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Eliminar as miñas mensaxes';

  @override
  String get guildNavbarDeletedYourMessages => 'Elimináronse as túas mensaxes';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Non se puideron eliminar as túas mensaxes';

  @override
  String get guildNavbarRemoveOverride => 'Eliminar anulación';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Silenciado ata $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible =>
      'Só accesible para o persoal de Fluxer';

  @override
  String get guildNavbarInvitesPaused =>
      'As invitacións están actualmente en pausa nesta comunidade';

  @override
  String get guildNavbarDurationNever => 'nunca';

  @override
  String get guildNavbarDuration30Minutes => '30 minutos';

  @override
  String get guildNavbarDuration1Hour => '1 hora';

  @override
  String get guildNavbarDuration6Hours => '6 horas';

  @override
  String get guildNavbarDuration12Hours => '12 horas';

  @override
  String get guildNavbarDuration1Day => '1 día';

  @override
  String get guildNavbarDuration7Days => '7 días';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count segundos';
  }

  @override
  String get guildNavbarNever => 'Nunca';

  @override
  String get guildNavbarNoLimit => 'Sen límite';

  @override
  String get guildNavbarOneUse => '1 uso';

  @override
  String guildNavbarUses(int count) {
    return '$count usos';
  }

  @override
  String get guildMenuMarkAsRead => 'Marcar como lido';

  @override
  String get guildPeekMoreOptions => 'Máis opcións';

  @override
  String get guildMenuInviteMembers => 'Invitar membros';

  @override
  String get guildMenuCommunitySettings => 'Axustes da comunidade';

  @override
  String get guildMenuEditCommunityProfile => 'Editar perfil da comunidade';

  @override
  String get guildMenuUnmuteCommunity => 'Quitar o silencio da comunidade';

  @override
  String get guildMenuMuteCommunity => 'Silenciar comunidade';

  @override
  String get guildMenuHideMutedChannels => 'Ocultar canles silenciadas';

  @override
  String get guildMenuReportCommunity => 'Informar da comunidade';

  @override
  String get guildMenuDebugCommunity => 'Depurar comunidade';

  @override
  String get guildMenuCopyCommunityId => 'Copiar ID da comunidade';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Ata as $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Xeral';

  @override
  String get guildMenuSettingsRoles => 'Roles e permisos';

  @override
  String get guildMenuSettingsEmoji => 'Emoji personalizados';

  @override
  String get guildMenuSettingsStickers => 'Adesivos personalizados';

  @override
  String get guildMenuSettingsSafetyModeration => 'Seguridade e moderación';

  @override
  String get guildMenuSettingsActivityLog => 'Rexistro de actividade';

  @override
  String get guildMenuSettingsWebhooks => 'Webhooks';

  @override
  String get guildMenuSettingsCustomInviteUrl =>
      'URL de invitación personalizada';

  @override
  String get guildMenuSettingsDiscovery => 'Descubrimento';

  @override
  String get guildMenuSettingsMembers => 'Membros';

  @override
  String get guildMenuSettingsInviteLinks => 'Ligazóns de invitación';

  @override
  String get guildMenuSettingsBans => 'Prohibicións';

  @override
  String get guildMenuSettingsChannels => 'Channels';

  @override
  String get guildSettingsNoPermission =>
      'Non tes permiso para ver esta pestana de axustes.';

  @override
  String get guildSettingsOverviewIconTitle => 'Icona';

  @override
  String get guildSettingsUploadImage => 'Cargar imaxe';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Carga un banner para o teu servidor.';

  @override
  String get guildSettingsOverviewNameTitle => 'Nome';

  @override
  String get guildSettingsOverviewNameHint => 'A miña marabillosa comunidade';

  @override
  String get guildSettingsOverviewStatsTitle => 'Estatísticas';

  @override
  String get guildSettingsOverviewMembers => 'Membros';

  @override
  String get guildSettingsOverviewOnline => 'En liña';

  @override
  String get guildSettingsRolesDescription =>
      'Usa roles para agrupar membros e asignar permisos.';

  @override
  String get guildSettingsCreateRole => 'Crear rol';

  @override
  String get guildSettingsRolesListTitle => 'Roles';

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
    return '$staticCount estáticos, $animatedCount animados usados';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Aínda non hai emojis personalizados.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count adesivos cargados';
  }

  @override
  String get guildSettingsStickersEmpty =>
      'Aínda non hai adesivos personalizados.';

  @override
  String get guildSettingsModerationVerificationTitle =>
      'Verificación de membros';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Escolle o que os membros deben ter antes de poder publicar ou enviar mensaxes directas aos membros da comunidade.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Os membros con roles poden omitir estas comprobacións. Para espazos públicos, recomendámosche activar a verificación.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'As comunidades listadas en Descubrimento requiren polo menos un correo electrónico verificado. Non se pode seleccionar Ningún mentres Descubrimento estea activado.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Contido para adultos e avisos de contido';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Configura a etiquetaxe de contido para adultos e avisos de contido opcionais para os membros.';

  @override
  String get guildSettingsModerationMatureToggle => 'Contido para adultos';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Marca esta comunidade como que contén contido para adultos.';

  @override
  String get guildSettingsVerificationNone => 'Ningún';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Non se require verificación.';

  @override
  String get guildSettingsVerificationLow => 'Baixo';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Require un enderezo de correo electrónico verificado.';

  @override
  String get guildSettingsVerificationMedium => 'Medio';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Require un enderezo de correo electrónico verificado e unha conta con polo menos 5 minutos de antigüidade.';

  @override
  String get guildSettingsVerificationHigh => 'Alto';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Require todo o contido medio, ademais de ser membro da comunidade durante polo menos 10 minutos.';

  @override
  String get guildSettingsVerificationHighest => 'Moi alto';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Require un número de teléfono verificado.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Rastrea as accións dos moderadores en toda a comunidade.';

  @override
  String get guildSettingsAuditLogEmpty => 'Aínda non hai rexistros';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'As accións de moderación e os cambios na comunidade aparecerán aquí.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Todos os usuarios';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Todas as accións';

  @override
  String get guildSettingsAuditLogNoReason =>
      'Non se proporcionou ningunha razón.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Usuario descoñecido';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Produciuse un erro ao cargar o rexistro de actividade.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Non se poden cargar os rexistros de actividade';

  @override
  String get guildSettingsAuditLogReason => 'Razón';

  @override
  String get guildSettingsAuditLogSomeone => 'alguén';

  @override
  String get guildSettingsAuditLogSomething => 'algo';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'entidade descoñecida';

  @override
  String get guildSettingsAuditLogNothing => 'nada';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Destino descoñecido';

  @override
  String get auditLogActionGuildUpdate => 'Comunidade actualizada';

  @override
  String get auditLogActionChannelCreate => 'Canle creada';

  @override
  String get auditLogActionChannelUpdate => 'Canle actualizada';

  @override
  String get auditLogActionChannelDelete => 'Canle eliminada';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Engadiuse unha substitución de canle';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Actualizouse unha substitución de canle';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Eliminouse unha substitución de canle';

  @override
  String get auditLogActionMemberKick => 'Membro expulsado';

  @override
  String get auditLogActionMemberPrune => 'Membros podados';

  @override
  String get auditLogActionMemberBanAdd => 'Membro prohibido';

  @override
  String get auditLogActionMemberBanRemove => 'Membro desprohibido';

  @override
  String get auditLogActionMemberUpdate => 'Membro actualizado';

  @override
  String get auditLogActionMemberRoleUpdate => 'Roles de membro actualizados';

  @override
  String get auditLogActionMemberMove => 'Membro movido';

  @override
  String get auditLogActionMemberDisconnect => 'Membro desconectado';

  @override
  String get auditLogActionBotAdd => 'Bot engadido';

  @override
  String get auditLogActionRoleCreate => 'Rol creado';

  @override
  String get auditLogActionRoleUpdate => 'Rol actualizado';

  @override
  String get auditLogActionRoleDelete => 'Rol eliminado';

  @override
  String get auditLogActionInviteCreate => 'Invitación creada';

  @override
  String get auditLogActionInviteUpdate => 'Invitación actualizada';

  @override
  String get auditLogActionInviteDelete => 'Invitación eliminada';

  @override
  String get auditLogActionWebhookCreate => 'Webhook creado';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook actualizado';

  @override
  String get auditLogActionWebhookDelete => 'Webhook eliminado';

  @override
  String get auditLogActionEmojiCreate => 'Emoji creado';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji actualizado';

  @override
  String get auditLogActionEmojiDelete => 'Emoji eliminado';

  @override
  String get auditLogActionStickerCreate => 'Adhesivo creado';

  @override
  String get auditLogActionStickerUpdate => 'Adhesivo actualizado';

  @override
  String get auditLogActionStickerDelete => 'Adhesivo eliminado';

  @override
  String get auditLogActionMessageDelete => 'Mensaxe eliminada';

  @override
  String get auditLogActionMessageBulkDelete => 'Mensaxes eliminadas';

  @override
  String get auditLogActionMessagePin => 'Mensaxe fixada';

  @override
  String get auditLogActionMessageUnpin => 'Mensaxe desfixada';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return 'O $actor actualizou a configuración da comunidade.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return 'O $actor creou a canle $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return 'O $actor actualizou a canle $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return 'O $actor eliminou a canle $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return 'O $actor engadiu permisos de canle para $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'O $actor engadiu permisos de canle para $target en $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return 'O $actor actualizou os permisos de canle para $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'O $actor actualizou os permisos de canle para $target en $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return 'O $actor eliminou os permisos de canle para $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'O $actor eliminou os permisos de canle para $target en $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return 'O $actor expulsou a $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return 'O $actor baneo a $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return 'O $actor desbaneou a $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return 'O $actor actualizou a $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return 'O $actor actualizou os roles de $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return 'O $actor eliminou membros inactivos.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return 'O $actor eliminou membros inactivos durante $days días.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return 'O $actor moveu a $target a outra canle de voz.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'O $actor moveu a $target a $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return 'O $actor desconectou a $target da voz.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return 'O $actor engadiu o bot $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return 'O $actor creou o rol $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return 'O $actor actualizou o rol $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return 'O $actor eliminou o rol $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return 'O $actor creou a invitación $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'O $actor creou a invitación $target para $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return 'O $actor actualizou a invitación $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'O $actor actualizou a invitación $target para $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return 'O $actor eliminou a invitación $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'O $actor eliminou a invitación $target para $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return 'O $actor creou o webhook $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return 'O $actor actualizou o webhook $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return 'O $actor eliminou o webhook $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor engadiu o emoji $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor actualizou o emoji $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor eliminou o emoji $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor engadiu o adhesivo $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor actualizou o adhesivo $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor eliminou o adhesivo $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor eliminou unha mensaxe.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor eliminou unha mensaxe en $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor eliminou varias mensaxes.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor eliminou $count mensaxes.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor eliminou varias mensaxes en $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor eliminou $count mensaxes en $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor fixou unha mensaxe.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor fixou unha mensaxe en $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor desfixou unha mensaxe.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor desfixou unha mensaxe en $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor realizou unha acción de auditoría sobre $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Actualizado $field de $oldValue a $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Establecido $field a $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Borrado $field (era $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Actualizado $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Renomeada a comunidade a $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Actualizada a icona da comunidade.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Renomeada a canle a $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Borrado o tema.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Actualizado o tema a $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'Activado contido para adultos.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Desactivado contido para adultos.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Establecido alcume a $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Eliminado alcume $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Silenciado o membro.';

  @override
  String get auditLogChangeUnmutedMember => 'Desilenciado o membro.';

  @override
  String get auditLogChangeDeafenedMember => 'Silenciado o membro (voz).';

  @override
  String get auditLogChangeUndeafenedMember => 'Desilenciado o membro (voz).';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Engadido/s $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Eliminado/s $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Canle: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Mensaxe: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Invitado por $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Eliminadas # mensaxes.',
      one: 'Eliminada # mensaxe.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Eliminados # membros.',
      one: 'Eliminado # membro.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'Esta invitación nunca caduca.';

  @override
  String get auditLogOptionTemporaryMembership => 'Concede membresía temporal.';

  @override
  String get auditLogOptionPermanentMembership =>
      'Concede membresía permanente.';

  @override
  String get guildSettingsLoadMore => 'Cargar máis';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Xestiona os webhooks que publican mensaxes nas canles.';

  @override
  String get guildSettingsWebhooksEmpty => 'Non hai webhooks configurados.';

  @override
  String get guildSettingsCopyUrl => 'Copiar URL';

  @override
  String get guildSettingsCopiedUrl => 'URL copiado ao portapapeis';

  @override
  String get guildSettingsDeleteWebhook => 'Eliminar webhook';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Define unha ligazón de invitación personalizada para o teu servidor.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Gardar';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Uso';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count usos';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Solicita ser listado na descuberta de servidores.';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Require polo menos $count membros para solicitar.';
  }

  @override
  String get guildSettingsDiscoveryFormTitle => 'Solicitude';

  @override
  String get guildSettingsDiscoveryStatusTitle => 'Estado';

  @override
  String get guildSettingsDiscoveryCategory => 'Categoría';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Descrición';

  @override
  String get guildSettingsDiscoveryTags => 'Etiquetas';

  @override
  String get guildSettingsDiscoveryTagsHint => 'xogos, arte, música';

  @override
  String get guildSettingsDiscoveryApply => 'Enviar solicitude';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Retirar';

  @override
  String get guildSettingsMembersDescription =>
      'Busca e xestiona os membros do servidor.';

  @override
  String get guildSettingsMembersSearchHint => 'Buscar membros';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count membros';
  }

  @override
  String get guildSettingsInvitesTitle => 'Invites';

  @override
  String get guildSettingsInvitesDescription =>
      'Ver e revogar ligazóns de invitación activas.';

  @override
  String get guildSettingsInvitesEmpty => 'Non hai invitacións activas.';

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
    return '$uses / $maxUses usos';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Expira o $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Ver e xestionar usuarios prohibidos.';

  @override
  String get guildSettingsBansSearchHint => 'Buscar prohibicións';

  @override
  String get guildSettingsBansEmpty => 'Non hai usuarios prohibidos.';

  @override
  String get guildSettingsBanPermanent => 'Prohibición permanente';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Expira o $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Expira';

  @override
  String get guildSettingsUnban => 'Desprohibir';

  @override
  String get guildSettingsBansLoading => 'Cargando usuarios prohibidos';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Non se atoparon prohibicións que coincidan coa túa busca.';

  @override
  String get guildSettingsBanDetailsTitle => 'Detalles da prohibición';

  @override
  String get guildSettingsBanViewDetails => 'Ver detalles';

  @override
  String get guildSettingsBannedOn => 'Prohibido o';

  @override
  String get guildSettingsBannedBy => 'Prohibido por';

  @override
  String get guildSettingsRevokeBanTitle => 'Revogar prohibición';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Estás seguro de que queres revogar a prohibición de $displayName? Poderá volver unirse á comunidade.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Prohibición revogada para $displayName';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Non se puideron cargar as prohibicións. Inténtao de novo.';

  @override
  String get guildSettingsRevokeBanError =>
      'Non se puido revogar a prohibición. Inténtao de novo.';

  @override
  String get guildSettingsCommunitySettings => 'Configuración da comunidade';

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
      'Xestiona o perfil, as canles e a configuración predeterminada da túa comunidade.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Marca';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Actualiza a túa icona, nome, banner e fondo de invitación';

  @override
  String get guildSettingsOverviewBannerUpload => 'Cargar banner';

  @override
  String get guildSettingsOverviewIdleTitle => 'Configuración de inactividade';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Configura a canle AFK e o tempo de espera';

  @override
  String get guildSettingsOverviewSystemTitle => 'Sistema e benvida';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Elixe o destino das mensaxes do sistema e de benvida';

  @override
  String get guildSettingsOverviewNotificationsTitle =>
      'Notificacións predeterminadas';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'As comunidades con máis de 250 persoas son forzadas á configuración \"só mencións\". A túa configuración orixinal consérvase e restaurarase se a comunidade baixa de 250 membros.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Avanzado';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Permitir nomes de canles de texto flexibles';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Ocultar a coroa do propietario da comunidade';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Banner separado';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Mostra o banner na súa propia sección debaixo da cabeceira da comunidade.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Cargar icona';

  @override
  String get guildSettingsOverviewRemoveImage => 'Eliminar';

  @override
  String get guildSettingsOverviewSplashTitle => 'Fondo da invitación';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'Fondo do embed do chat';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Mostrado nos embeds de invitación no chat.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Cargar fondo';

  @override
  String get guildSettingsOverviewNoCommunityBanner =>
      'Sen banner da comunidade';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'Sen fondo de invitación';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Vista previa';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Consulta como se ve a túa invitación para os visitantes.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Nomes das canles de texto';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Coroa do propietario da comunidade';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Configura se a icona da coroa se mostra ao lado do propietario da comunidade';

  @override
  String get guildSettingsSplashCardAlignment => 'Aliñamento da tarxeta';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Centro';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Esquerda';

  @override
  String get guildSettingsSplashAlignmentRight => 'Dereita';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Só se aplica en pantallas anchas.';

  @override
  String get permissionReadMessageHistory => 'Ler historial de mensaxes';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Cambiar o que poden ver os usuarios sen \"$permission\"';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Usa unha xanela dedicada para establecer unha data de corte do historial de mensaxes para os membros que non teñan o permiso $permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Abrir limiar do historial de mensaxes';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Limiar do historial de mensaxes';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Activar limiar do historial de mensaxes';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Data do limiar';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Os membros sen Ler historial de mensaxes poden ver as mensaxes enviadas despois desta data.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Limiar do historial de mensaxes actualizado';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Permite maiúsculas e espazos nos nomes das canles de texto. Desactivado restrinxe os nomes a minúsculas con guións e guións baixos.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Oculta a icona da coroa ao lado do propietario da comunidade en todas as superficies.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'As iconas animadas requiren a funcionalidade da comunidade de Icona Animada.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Os banners animados requiren a funcionalidade da comunidade de Banner Animado.';

  @override
  String get guildSettingsAfkChannel => 'Canle AFK / inactiva';

  @override
  String get guildSettingsAfkChannelHint =>
      'Move os membros a esta canle cando estean AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Sen canle AFK';

  @override
  String get guildSettingsAfkTimeout => 'Tempo de espera AFK';

  @override
  String get guildSettingsAfkTimeout1Min => '1 minuto';

  @override
  String get guildSettingsAfkTimeout5Min => '5 minutos';

  @override
  String get guildSettingsAfkTimeout15Min => '15 minutos';

  @override
  String get guildSettingsAfkTimeout30Min => '30 minutos';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 hora';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds segundos';
  }

  @override
  String get guildSettingsSystemChannel => 'Canle de destino';

  @override
  String get guildSettingsSystemChannelHint =>
      'As mensaxes de benvida e do sistema aparecerán aquí.';

  @override
  String get guildSettingsNoSystemChannel => 'Sen canle do sistema';

  @override
  String get guildSettingsHideJoinMessages => 'Ocultar mensaxes de unión';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Suprime as mensaxes de entrada na canle de destino.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Configuración de notificacións predeterminada';

  @override
  String get guildSettingsNotificationsAll => 'Toda a mensaxes';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Notificar sobre todas as mensaxes';

  @override
  String get guildSettingsNotificationsMentions => 'Só mencións';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Notificar só sobre mencións';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Máx. 10 MB. Mínimo: 960×540 px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Máx. 10 MB. Mínimo: 960×540 px (16:9). Móstrase nas incrustacións de invitacións no chat.';

  @override
  String get guildSettingsModerationDescription =>
      'Configura os axustes de verificación, filtrado de contido e contido para adultos.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'As comunidades listadas en Discovery teñen opcións de moderación restrinxidas.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Filtrado de contido';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Analiza automaticamente as mensaxes en busca de contido explícito en canles que non estean marcadas para contido para adultos.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'As comunidades listadas en Discovery están obrigadas a analizar a todos os membros. Esta configuración non se pode cambiar mentres Discovery estea activado.';

  @override
  String get guildSettingsContentFilterOff => 'Desactivado';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Deixa que a comunidade se automode';

  @override
  String get guildSettingsContentFilterNoRole => 'Filtrar membros sen roles';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Suxerido para a maioría das comunidades';

  @override
  String get guildSettingsContentFilterAll => 'Filtrar a todos';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Máxima protección para espazos familiares';

  @override
  String get guildSettingsModerationMatureOff => 'Desactivado';

  @override
  String get guildSettingsModerationMatureOn => 'Activado';

  @override
  String get guildSettingsContentWarningToggle =>
      'Mostrar unha advertencia de contido';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Activa unha solicitude de consentimento antes de entrar en calquera canle.';

  @override
  String get guildSettingsContentWarningText =>
      'Texto de advertencia personalizado';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Isto contén contido sensible.';

  @override
  String get guildSettingsModeration2faTitle => 'Requisito de 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'Require autenticación de dous factores para os moderadores antes de que poidan prohibir, expulsar, silenciar temporalmente ou eliminar mensaxes.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Require 2FA para accións de moderación';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Só o propietario da comunidade pode cambiar esta configuración';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Activa a 2FA na túa conta para cambiar esta configuración';

  @override
  String get guildSettingsEmojiSearchHint => 'Buscar emojis';

  @override
  String get guildSettingsEmojiUploadTitle => 'Cargar emoji';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Emoji non animado ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Emoji animado ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Buscar adhesivos';

  @override
  String get guildSettingsWebhooksInfo =>
      'Crea webhooks desde a configuración da canle. Edítaos aquí.';

  @override
  String get guildSettingsVanityUrlWarning =>
      'O teu URL de vanidade non funcionará a menos que polo menos unha canle sexa visible para todos.';

  @override
  String get guildSettingsVanityUrlRemove => 'Eliminar';

  @override
  String get guildSettingsBannedUsersTitle => 'Usuarios prohibidos';

  @override
  String get guildSettingsInvitesTableInviter => 'Convidado';

  @override
  String get guildSettingsInvitesTableChannel => 'Canle';

  @override
  String get guildSettingsInvitesTableCode => 'Código';

  @override
  String get guildSettingsInvitesTableUses => 'Usos';

  @override
  String get guildSettingsInvitesTableCreated => 'Creado';

  @override
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsMembersSortNewest => 'Máis recentes primeiro';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtrar por usuario';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtrar por acción';

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
