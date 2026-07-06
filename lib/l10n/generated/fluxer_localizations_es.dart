// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class FluxerLocalizationsEs extends FluxerLocalizations {
  FluxerLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get reconnectingTitle => '¡Hemos metido la pata!';

  @override
  String get reconnectingBody =>
      'Algo va mal con los servidores.\n¡Se arreglará en un segundo!';

  @override
  String get gatewayReconnectingToast => 'Reconectando…';

  @override
  String get gatewayConnectedToast => 'Conectado';

  @override
  String get sessionExpiredToast =>
      'Your session has expired. Please sign in again.';

  @override
  String splashStartupFailed(String error) {
    return 'Error al iniciar: $error';
  }

  @override
  String get retry => 'Reintentar';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Conexión perdida';

  @override
  String get splashViewOnStatusPage => 'Ver en la página de estado';

  @override
  String get splashConnectionIssuesPrompt => '¿Problemas de conexión?';

  @override
  String get splashStatusPageLink => 'Página de estado';

  @override
  String get splashReadIncident => 'Leer incidente';

  @override
  String get splashIncidentHistory => 'Historial de incidentes';

  @override
  String get welcomeBack => 'Bienvenido/a de nuevo';

  @override
  String get email => 'Correo electrónico';

  @override
  String get emailInvalid =>
      'Por favor, introduce una dirección de correo electrónico válida.';

  @override
  String get password => 'Contraseña';

  @override
  String get forgotPassword => '¿Has olvidado tu contraseña?';

  @override
  String get logIn => 'Iniciar sesión';

  @override
  String get logInWithPasskey => 'Iniciar sesión con una clave de acceso';

  @override
  String continueWithSso(String provider) {
    return 'Continuar con $provider';
  }

  @override
  String get ssoRequired => 'Se requiere SSO para acceder a esta instancia.';

  @override
  String get organizationSsoProvider =>
      'Inicia sesión con el proveedor de inicio de sesión único de tu organización.';

  @override
  String get failedToStartSso => 'Error al iniciar SSO';

  @override
  String get ssoCancelled => 'Se canceló el inicio de sesión SSO';

  @override
  String preferSso(String provider) {
    return '¿Prefieres usar SSO? Continúa con $provider.';
  }

  @override
  String get logInViaBrowser => 'Iniciar sesión a través del navegador';

  @override
  String get needAccountPrompt => '¿Necesitas una cuenta? ';

  @override
  String get register => 'Registrarse';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Verifica que eres humano';

  @override
  String get captchaDescription =>
      'Necesitamos asegurarnos de que no eres un bot. Por favor, completa la verificación a continuación.';

  @override
  String get captchaSwitchToHcaptcha =>
      '¿Tienes problemas? Prueba hCaptcha en su lugar';

  @override
  String get captchaSwitchToTurnstile => 'Prueba Turnstile en su lugar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get ipAuthCheckEmail => 'Revisa tu correo electrónico';

  @override
  String ipAuthDescription(String email) {
    return 'Hemos enviado un enlace por correo electrónico para autorizar este inicio de sesión. Por favor, abre tu bandeja de entrada para $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Conexión perdida';

  @override
  String get ipAuthConnectionLostDescription =>
      'Perdimos la conexión mientras esperábamos la autorización. Por favor, inténtalo de nuevo.';

  @override
  String get ipAuthLinkExpired => 'El enlace de inicio de sesión ha caducado';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Este enlace de autorización ha caducado. Por favor, inicia sesión de nuevo.';

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
  String get mfaTitle => 'Autenticación de dos factores';

  @override
  String get mfaChooseMethod => 'Elige un método de verificación';

  @override
  String get mfaMethodTotp => 'Aplicación de autenticación';

  @override
  String get mfaMethodWebauthn => 'Clave de seguridad / Clave de acceso';

  @override
  String get mfaTotpDescription =>
      'Introduce el código de 6 dígitos de tu aplicación de autenticación o uno de tus códigos de respaldo.';

  @override
  String get mfaCodeLabel => 'Código';

  @override
  String get mfaTryAnotherMethod => 'Probar otro método';

  @override
  String get mfaUseSecurityKey => 'Prueba con una clave de seguridad / passkey';

  @override
  String get accountSelectorTitle => 'Elige una cuenta';

  @override
  String get accountSelectorDescription =>
      'Selecciona una cuenta para continuar o añade otra.';

  @override
  String get accountAdd => 'Añadir cuenta';

  @override
  String get accountRemove => 'Eliminar';

  @override
  String accountRemoveTitle(String username) {
    return 'Eliminar $username';
  }

  @override
  String get accountRemoveDescription =>
      'Esto eliminará la sesión guardada de esta cuenta.';

  @override
  String get accountRemoveOnlyDescription =>
      'Esto eliminará la única cuenta guardada en este dispositivo.';

  @override
  String get accountExpired => 'Expirada';

  @override
  String accountSessionExpired(String identifier) {
    return 'Sesión expirada para $identifier. Inicia sesión de nuevo.';
  }

  @override
  String get accountManageTitle => 'Gestionar cuentas';

  @override
  String get accountSwitchFailed =>
      'No se han podido cambiar las cuentas. Inténtalo de nuevo.';

  @override
  String get profileTabMenuSwitchAccounts => 'Cambiar de cuenta';

  @override
  String get statusChangeSheetTitle => 'Establecer estado';

  @override
  String get statusOnlineStatusSection => 'Estado en línea';

  @override
  String get statusOnline => 'En línea';

  @override
  String get statusIdle => 'Inactivo';

  @override
  String get statusDnd => 'No molestar';

  @override
  String get statusInvisible => 'Invisible';

  @override
  String get statusOffline => 'Desconectado';

  @override
  String get statusUntilIChangeIt => 'Hasta que lo cambie';

  @override
  String get statusDontClear => 'No borrar';

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
      'No recibirás notificaciones en el escritorio';

  @override
  String get statusInvisibleDescription => 'Aparecerás sin conexión';

  @override
  String get customStatusSetTitle => 'Establecer estado personalizado';

  @override
  String get customStatusCurrentHint => 'Estado personalizado';

  @override
  String get customStatusClear => 'Borrar estado personalizado';

  @override
  String get customStatusPlaceholder => '¿Qué está pasando?';

  @override
  String get customStatusChooseEmoji => 'Elige un emoji';

  @override
  String get customStatusClearAfter => 'Borrar después de';

  @override
  String get customStatusSave => 'Guardar';

  @override
  String get accountActive => 'Cuenta activa';

  @override
  String get signOut => 'Cerrar sesión';

  @override
  String get suspendedPermanentTitle => 'Cuenta suspendida permanentemente';

  @override
  String get suspendedTemporaryTitle => 'Cuenta suspendida';

  @override
  String get suspendedPermanentDescription =>
      'Tu cuenta ha sido suspendida permanentemente por infringir nuestros Términos de Servicio.';

  @override
  String get suspendedTemporaryDescription =>
      'Tu cuenta ha sido suspendida temporalmente. Podrás acceder a tu cuenta una vez finalizado el período de suspensión.';

  @override
  String get suspendedIssuedAt => 'Emitido';

  @override
  String get suspendedEndsAt => 'Finaliza';

  @override
  String get suspendedDuration => 'Duración';

  @override
  String get suspendedPermanent => 'Permanente';

  @override
  String get suspendedReason => 'Motivo';

  @override
  String get suspendedAppealDeadline => 'Fecha límite de apelación';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Tu cuenta está programada para ser eliminada el $date.';
  }

  @override
  String get suspendedRecheck => 'Comprobar actualizaciones';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Vuelve a comprobar en ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Volver al inicio de sesión';

  @override
  String get suspendedAppealTitle => 'Apelación';

  @override
  String get suspendedAppealHint =>
      'Explica por qué se debería reconsiderar tu suspensión (mínimo 50 caracteres)...';

  @override
  String get suspendedAppealSubmit => 'Enviar apelación';

  @override
  String get suspendedAppealPending => 'Revisando';

  @override
  String get suspendedAppealAccepted => 'Apelación aceptada';

  @override
  String get suspendedAppealRejected => 'Apelación rechazada';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Tu apelación ha sido aceptada y tu cuenta ha sido restablecida.';

  @override
  String get suspendedSignIn => 'Iniciar sesión en tu cuenta';

  @override
  String get forgotPasswordTitle => '¿Has olvidado tu contraseña?';

  @override
  String get forgotPasswordDescription =>
      'Introduce tu dirección de correo electrónico y te enviaremos un enlace para restablecer tu contraseña.';

  @override
  String get forgotPasswordSubmit => 'Enviar enlace de restablecimiento';

  @override
  String get forgotPasswordSentTitle => 'Revisa tu correo electrónico';

  @override
  String get forgotPasswordSentDescription =>
      'Hemos enviado instrucciones para restablecer tu contraseña a tu dirección de correo electrónico. Por favor, revisa tu bandeja de entrada y sigue el enlace para restablecer tu contraseña.';

  @override
  String get forgotPasswordBackToLogin => 'Volver al inicio de sesión';

  @override
  String get resetPasswordTitle => 'Establecer nueva contraseña';

  @override
  String get resetPasswordDescription =>
      'Introduce tu nueva contraseña a continuación para completar el proceso de restablecimiento.';

  @override
  String get resetPasswordNewPassword => 'Nueva contraseña';

  @override
  String get resetPasswordConfirm => 'Confirmar nueva contraseña';

  @override
  String get resetPasswordSubmit => 'Restablecer contraseña';

  @override
  String get resetPasswordMismatch => 'Las contraseñas no coinciden.';

  @override
  String get registerTitle => 'Crear una cuenta';

  @override
  String get registerDisplayName => 'Nombre para mostrar (Opcional)';

  @override
  String get registerDisplayNameHint => '¿Cómo quieres que te llamen?';

  @override
  String get registerUsername => 'Nombre de usuario (Opcional)';

  @override
  String get registerUsernameHint =>
      'Deja en blanco para un nombre de usuario aleatorio';

  @override
  String get registerUsernameTagHint =>
      'Se añadirá automáticamente una etiqueta de 4 dígitos para garantizar la unicidad';

  @override
  String get registerDateOfBirth => 'Fecha de nacimiento';

  @override
  String get registerMonth => 'Mes';

  @override
  String get registerDay => 'Día';

  @override
  String get registerYear => 'Año';

  @override
  String get registerConsent =>
      'Acepto los Términos de Servicio y la Política de Privacidad';

  @override
  String get registerConsentPrefix => 'Acepto los ';

  @override
  String get registerConsentTerms => 'Términos de Servicio';

  @override
  String get registerConsentAnd => ' y ';

  @override
  String get registerConsentPrivacy => 'Política de Privacidad';

  @override
  String get registerConfirmPassword => 'Confirmar contraseña';

  @override
  String get registerSubmit => 'Crear cuenta';

  @override
  String get registerHaveAccount => '¿Ya tienes una cuenta? ';

  @override
  String get passkeyNoCredentials =>
      'No se han encontrado passkeys para esta aplicación. Inicia sesión con correo electrónico y contraseña en su lugar.';

  @override
  String get passkeyDeviceNotSupported =>
      'Las passkeys no son compatibles con este dispositivo.';

  @override
  String get passkeyDomainNotAssociated =>
      'Las passkeys no están configuradas para esta aplicación. Inicia sesión con correo electrónico y contraseña en su lugar.';

  @override
  String get passkeyTimeout =>
      'La autenticación de passkey ha caducado. Por favor, inténtalo de nuevo.';

  @override
  String get passkeyNotAvailable =>
      'Las passkeys no están disponibles para esta aplicación. Inicia sesión con correo electrónico y contraseña en su lugar.';

  @override
  String get passkeyFailed =>
      'La autenticación de la clave de acceso ha fallado. Inténtalo de nuevo.';

  @override
  String get errorUnableToCreateAccount =>
      'No se ha podido crear la cuenta. Inténtalo de nuevo.';

  @override
  String get errorUnableToSignIn =>
      'No se ha podido iniciar sesión en este momento. Inténtalo de nuevo.';

  @override
  String get errorInvalidEmailOrPassword =>
      'Correo electrónico o contraseña no válidos.';

  @override
  String get errorUnableToSendResetLink =>
      'No se ha podido enviar el enlace de restablecimiento. Inténtalo de nuevo.';

  @override
  String get errorUnableToResetPassword =>
      'No se ha podido restablecer la contraseña. Inténtalo de nuevo.';

  @override
  String get embedInviteJoin => 'Unirse a la comunidad';

  @override
  String get embedInviteGoTo => 'Ir a la comunidad';

  @override
  String embedInviteOnline(String count) {
    return '$count en línea';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count miembros';
  }

  @override
  String get embedInviteUnknownTitle => 'Invitación desconocida';

  @override
  String get embedInviteUnknownSubtitle =>
      'Intenta pedir una nueva invitación.';

  @override
  String get embedInviteUnavailable => 'Invitación no disponible';

  @override
  String get inviteAcceptTitle => 'Has sido invitado a unirte';

  @override
  String get inviteAcceptJoinButton => 'Unirse a la comunidad';

  @override
  String get inviteAcceptGoToButton => 'Ir a la comunidad';

  @override
  String get inviteAcceptInvitesPaused => 'Invitaciones en pausa';

  @override
  String get inviteAcceptNotFoundTitle => 'Invitación no válida';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Esta invitación puede haber caducado o no ser válida.';

  @override
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'Unirse al grupo';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Has sido invitado a unirte a un chat grupal por $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'alguien';

  @override
  String get inviteAcceptEmojiPack => 'Paquete de emojis';

  @override
  String get inviteAcceptStickerPack => 'Paquete de pegatinas';

  @override
  String get inviteAcceptInstallEmojiPack => 'Instalar paquete de emojis';

  @override
  String get inviteAcceptInstallStickerPack => 'Instalar paquete de pegatinas';

  @override
  String get inviteAcceptPackInstallNote =>
      'Al aceptar esta invitación se instalará el paquete automáticamente.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Acceso al canal denegado';

  @override
  String get channelAccessDeniedDescription =>
      'No tienes acceso al canal donde se envió este mensaje.';

  @override
  String get messageJumpLinkNoAccess => 'Sin acceso';

  @override
  String get okay => 'Aceptar';

  @override
  String get embedThemeTitle => 'Tema compartido';

  @override
  String get embedThemeSubtitle =>
      'Este cliente no admite temas personalizados.';

  @override
  String get embedThemeUnavailableButton => 'Temas no disponibles';

  @override
  String get privacySettings => 'Ajustes de privacidad';

  @override
  String get privacyDirectMessages => 'Mensajes directos';

  @override
  String get privacyDirectMessagesDescription =>
      'Permitir mensajes directos de otros miembros de esta comunidad';

  @override
  String get privacyBotDirectMessages => 'Mensajes directos de bots';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Permitir que los bots de esta comunidad te envíen mensajes directos';

  @override
  String get privacyMutualDmsDisabled =>
      'Los administradores de la comunidad han deshabilitado la recepción de mensajes directos únicamente de miembros mutuos en esta comunidad.';

  @override
  String get communityDebug => 'Depurar comunidad';

  @override
  String get copiedToClipboard => 'Copiado al portapapeles';

  @override
  String get notificationSettings => 'Ajustes de notificación';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Silenciar $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Silenciar una comunidad evita que aparezcan indicadores de no leído y notificaciones, a menos que se te mencione.';

  @override
  String get notificationCommunitySettings =>
      'Ajustes de notificación de la comunidad';

  @override
  String get notificationAllMessages => 'Todos los mensajes';

  @override
  String get notificationOnlyMentions => 'Solo menciones';

  @override
  String get notificationNothing => 'Nada';

  @override
  String get notificationSuppressEveryone => 'Suprimir @everyone y @here';

  @override
  String get notificationSuppressRoles => 'Omitir todas las menciones de roles';

  @override
  String get notificationMobilePush => 'Notificaciones push para móvil';

  @override
  String get notificationOverrides => 'Anulaciones de notificaciones';

  @override
  String get notificationSelectChannel => 'Selecciona un canal o categoría';

  @override
  String get notificationOnlyAtMentions => 'Solo @menciones';

  @override
  String get notificationMuteChannel => 'Silenciar canal';

  @override
  String get notificationUnmuteChannel => 'Activar sonido del canal';

  @override
  String get notificationNoCategory => 'Sin categoría';

  @override
  String get dmMarkAsRead => 'Marcar como leído';

  @override
  String get dmMuteConversation => 'Silenciar DM';

  @override
  String get dmUnmuteConversation => 'Activar sonido del DM';

  @override
  String get dmPinDm => 'Fijar DM';

  @override
  String get dmUnpinDm => 'Desfijar DM';

  @override
  String get dmAlwaysShowInSidebar => 'Mostrar siempre en la barra lateral';

  @override
  String get dmRemoveFromAlwaysShown => 'Eliminar de \"Mostrar siempre\"';

  @override
  String get dmCloseDm => 'Cerrar DM';

  @override
  String get dmCloseDmConfirmTitle => 'Cerrar DM';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return '¿Seguro que quieres cerrar tu DM con $username? Siempre puedes volver a abrirlo más tarde.';
  }

  @override
  String get dmCopyChannelId => 'Copiar ID de canal';

  @override
  String get dmChannelIdCopied => 'ID de canal copiado';

  @override
  String get dmCopyUserId => 'Copiar ID de usuario';

  @override
  String get dmUserIdCopied => 'ID de usuario copiado';

  @override
  String get dmViewProfile => 'Ver perfil';

  @override
  String get dmVoiceCall => 'Iniciar llamada de voz';

  @override
  String get incomingVoiceCallTitle => 'Llamada de voz entrante';

  @override
  String get incomingVoiceCallAccept => 'Aceptar';

  @override
  String get incomingVoiceCallDecline => 'Rechazar';

  @override
  String get incomingVoiceCallLabel => 'Llamada entrante';

  @override
  String get incomingVoiceCallIgnore => 'Ignorar';

  @override
  String get directVoiceCallNotEligible =>
      'Esta llamada no se puede iniciar ahora. Inténtalo de nuevo en un momento.';

  @override
  String get voiceJoinCallFailed =>
      'No se ha podido conectar a esta llamada. Comprueba tu conexión e inténtalo de nuevo.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'No se ha podido unir a esta llamada. Comprueba tu conexión e inténtalo de nuevo.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'No se ha podido actualizar esta llamada en el servidor. Comprueba tu conexión e inténtalo de nuevo.';

  @override
  String get dmAddNote => 'Añadir nota';

  @override
  String get dmEditGroup => 'Editar grupo';

  @override
  String get dmInviteToCommunity => 'Invitar a la comunidad';

  @override
  String get dmBlock => 'Bloquear';

  @override
  String get dmLeaveGroup => 'Salir del grupo';

  @override
  String get dmNoCommunitiesAvailable => 'No hay comunidades disponibles';

  @override
  String dmGroupMemberCount(int count) {
    return '$count miembros';
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
  String get dmMuteForever => 'Hasta que lo reactive';

  @override
  String get dmPinGroupDm => 'Fijar DM de grupo';

  @override
  String get dmUnpinGroupDm => 'Desanclar DM de grupo';

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
  String get dmFavoriteGroupDm => 'Marcar DM de grupo como favorito';

  @override
  String get dmUnfavoriteGroupDm => 'Desmarcar DM de grupo como favorito';

  @override
  String get dmChangeFriendNickname => 'Cambiar apodo de amigo';

  @override
  String get dmRemoveFriend => 'Eliminar amigo';

  @override
  String get dmAddFriend => 'Añadir amigo';

  @override
  String get dmAcceptFriendRequest => 'Aceptar solicitud de amistad';

  @override
  String get dmIgnoreFriendRequest => 'Ignorar solicitud de amistad';

  @override
  String get dmFriendRequestSent => 'Solicitud de amistad enviada';

  @override
  String get dmUnblock => 'Desbloquear';

  @override
  String get dmDebugUser => 'Depurar usuario';

  @override
  String get dmDebugChannel => 'Depurar canal';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => 'DM anclado';

  @override
  String get dmUnpinned => 'DM desanclado';

  @override
  String get dmMuted => 'DM silenciado';

  @override
  String get dmUnmuted => 'DM desilenciado';

  @override
  String get dmRemoveFriendConfirmTitle => 'Eliminar amigo';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return '¿Seguro que quieres eliminar a $username como amigo?';
  }

  @override
  String get dmBlockConfirmTitle => 'Bloquear usuario';

  @override
  String dmBlockConfirmDescription(String username) {
    return '¿Seguro que quieres bloquear a $username? No podrá enviarte mensajes ni solicitudes de amistad.';
  }

  @override
  String get dmFriendRequestSentToast => 'Solicitud de amistad enviada';

  @override
  String get dmFriendRequestFailed => 'Error al enviar la solicitud de amistad';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Error al aceptar la solicitud de amistad';

  @override
  String get dmRemoveFriendFailed => 'Error al eliminar al amigo';

  @override
  String get dmBlockFailed => 'Error al bloquear al usuario';

  @override
  String get dmUnblockFailed => 'Error al desbloquear al usuario';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Error al ignorar la solicitud de amistad';

  @override
  String get dmAddFriends => 'Añadir amigos';

  @override
  String get addFriendSheetTitle => 'Añadir amigo';

  @override
  String get addFriendUsernameHint => 'Nombredeusuario#0000';

  @override
  String get addFriendUsernameLabel => 'Nombre de usuario del amigo';

  @override
  String get addFriendSendRequest => 'Enviar solicitud';

  @override
  String get addFriendNoUserFound =>
      'No se ha encontrado ningún usuario con ese nombre de usuario.';

  @override
  String get addFriendInvalidUsername =>
      'Introduce un nombre de usuario válido (Nombredeusuario#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Solicitud de amistad enviada';

  @override
  String get addFriendClaimTitle => 'Reclama tu cuenta';

  @override
  String get addFriendClaimDescription =>
      'Reclama tu cuenta para poder enviar solicitudes de amistad.';

  @override
  String get addFriendVerifyTitle => 'Verifica tu correo electrónico';

  @override
  String get addFriendVerifyDescription =>
      'Debes verificar tu dirección de correo electrónico antes de poder enviar solicitudes de amistad.';

  @override
  String get addFriendVerifyEmail => 'Verificar correo';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Solicitudes de amistad entrantes ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Solicitudes de amistad salientes ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Solicitud de amistad entrante';

  @override
  String get addFriendOutgoingStatus => 'Solicitud de amistad enviada';

  @override
  String get addFriendViewProfile => 'Ver perfil';

  @override
  String get addFriendAccept => 'Aceptar';

  @override
  String get addFriendIgnore => 'Ignorar';

  @override
  String get addFriendAcceptTitle => 'Aceptar solicitud de amistad';

  @override
  String get addFriendIgnoreTitle => 'Ignorar solicitud de amistad';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return '¿Aceptar la solicitud de amistad de $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return '¿Ignorar la solicitud de amistad de $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Cancelar solicitud';

  @override
  String get addFriendCancelRequestFailed =>
      'No se ha podido cancelar la solicitud de amistad. Inténtalo de nuevo.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Ahora mismo no acepta solicitudes de amistad.';

  @override
  String get addFriendUnblockFirst =>
      'Desbloquéalos primero para enviar una solicitud de amistad.';

  @override
  String get addFriendCannotSendToSelf =>
      'No puedes enviarte una solicitud de amistad a ti mismo.';

  @override
  String get addFriendAlreadyFriends => 'Ya sois amigos de este usuario.';

  @override
  String get addFriendClaimToSend =>
      'Termina de registrarte para enviar solicitudes de amistad.';

  @override
  String get addFriendSendFailedGeneric =>
      'No se ha podido enviar la solicitud de amistad. Inténtalo de nuevo.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Sistema';

  @override
  String get emojiSearchPlaceholder => 'Busca el emoji de tus sueños';

  @override
  String get emojiSearchEmpty => 'No hay emojis que coincidan con tu búsqueda';

  @override
  String get emojiAutocompleteDefaultLabel => 'Emoji predeterminado';

  @override
  String get emojiFrequentlyUsed => 'Usados frecuentemente';

  @override
  String get emojiTabGifs => 'GIFs';

  @override
  String get emojiTabMedia => 'Medios';

  @override
  String get emojiTabStickers => 'Pegatinas';

  @override
  String get emojiTabEmojis => 'Emojis';

  @override
  String get gifPickerSearch => 'Buscar GIFs';

  @override
  String get gifPickerSearchKlipy => 'Buscar en KLIPY';

  @override
  String get gifPickerSearchTenor => 'Buscar en Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Favoritos';

  @override
  String get gifPickerTrending => 'GIFs de tendencia';

  @override
  String get gifPickerNoResultsTitle => 'No hay resultados de búsqueda';

  @override
  String get gifPickerNoResultsDescription =>
      'Intenta con otro término de búsqueda';

  @override
  String get gifPickerLoadFailedTitle => 'No se pudieron cargar los GIFs';

  @override
  String get gifPickerLoadFailedBody =>
      'Comprueba tu conexión e inténtalo de nuevo.';

  @override
  String get emojiCategoryPeople => 'Personas';

  @override
  String get emojiCategoryNature => 'Naturaleza';

  @override
  String get emojiCategoryFood => 'Comida y bebida';

  @override
  String get emojiCategoryActivity => 'Actividades';

  @override
  String get emojiCategoryTravel => 'Viajes y lugares';

  @override
  String get emojiCategoryObjects => 'Objetos';

  @override
  String get emojiCategorySymbols => 'Símbolos';

  @override
  String get emojiCategoryFlags => 'Banderas';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Desbloquea $emojiCount de $communityCount con Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Obtener Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'No volver a mostrar';

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
      one: '1 comunidad',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Advertencia de enlace externo';

  @override
  String get externalLinkWarningLeaving => 'Estás a punto de salir de Fluxer';

  @override
  String get externalLinkWarningDescription =>
      'Los enlaces externos pueden ser peligrosos. Ten cuidado.';

  @override
  String get externalLinkWarningDestinationUrl => 'URL de destino:';

  @override
  String get externalLinksSectionTitle => 'Enlaces externos';

  @override
  String get externalLinksSectionDescription =>
      'Configura cómo se manejan las advertencias de enlaces externos.';

  @override
  String get externalLinkWarningTrustPrefix => 'Confiar siempre en ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — omite esta advertencia la próxima vez';

  @override
  String get externalLinkVisitSite => 'Visitar sitio';

  @override
  String get externalLinkTrustAllLabel =>
      'Confiar en todos los enlaces externos';

  @override
  String get externalLinkStripTrackingLabel =>
      'Eliminar parámetros de seguimiento de las URL';

  @override
  String get externalLinkStripTrackingDescription =>
      'Elimina automáticamente los parámetros de seguimiento (como utm_source, fbclid, gclid) de las URL de los mensajes que envías. Limpia el enlace antes de que llegue a nadie más.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      '¿Confiar en todos los enlaces externos?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Esto confiará en todos los enlaces externos y omitirá la advertencia para cada dominio. Tus dominios de confianza actuales se reemplazarán. Esto es menos seguro.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Confiar en todos';

  @override
  String get externalLinkStopTrustingAllTitle =>
      '¿Dejar de confiar en todos los enlaces?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Se volverán a mostrar las advertencias de enlaces externos. Deberás añadir dominios de confianza individualmente.';

  @override
  String get externalLinkStopTrustingAllAction => 'Desactivar confianza total';

  @override
  String get externalLinkTrustedAllDescription =>
      'Se confía en todos los enlaces externos. No se mostrarán advertencias.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Tienes $count dominio(s) de confianza. Añade más marcando la casilla al visitar enlaces externos.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Cuando está activado, no se mostrarán advertencias de enlaces externos. Esto es menos seguro.';

  @override
  String get imageFileTooLarge =>
      'El archivo de imagen es demasiado grande. Por favor, elige un archivo de menos de 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Los avatares animados requieren Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Los banners animados requieren Plutonium';

  @override
  String get animatedAvifNotSupported => 'AVIF animado no compatible';

  @override
  String get animatedAvifNotSupportedBody =>
      'El recorte y la rotación de archivos AVIF animados no son compatibles todavía. Si continúas, se subirá en su forma original.';

  @override
  String get uploadAsIs => 'Subir tal cual';

  @override
  String get croppingAnimatedNotSupported =>
      'El recorte de imágenes animadas no es compatible todavía. Se usará la carga original.';

  @override
  String get cropAvatar => 'Recortar avatar';

  @override
  String get cropBanner => 'Recortar banner';

  @override
  String get skip => 'Omitir';

  @override
  String get crop => 'Recortar';

  @override
  String get changeYourFluxerTag => 'Cambiar tu FluxerTag';

  @override
  String get fluxerTagInputLabel => 'FluxerTag';

  @override
  String get fluxerTagDescriptionBase =>
      'Los nombres de usuario solo pueden contener letras (a-z, A-Z), números (0-9) y guiones bajos. Los nombres de usuario no distinguen entre mayúsculas y minúsculas.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Los nombres de usuario solo pueden contener letras (a-z, A-Z), números (0-9) y guiones bajos. Los nombres de usuario no distinguen entre mayúsculas y minúsculas. Puedes elegir cualquier etiqueta de 4 dígitos disponible del #0000 al #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Los nombres de usuario solo pueden contener letras (a-z, A-Z), números (0-9) y guiones bajos. Los nombres de usuario no distinguen entre mayúsculas y minúsculas. Puedes elegir cualquier etiqueta de 4 dígitos disponible del #0001 al #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Entre $min y $max caracteres';
  }

  @override
  String get validationAllowedChars =>
      'Solo letras (a-z, A-Z), números (0-9) y guiones bajos (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Consigue Plutonium para personalizar tu etiqueta o conservarla al cambiar tu nombre de usuario';

  @override
  String get fluxerTagAlreadyTaken => 'FluxerTag ya en uso';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'El FluxerTag $username#$discriminator ya está en uso. Continuar volverá a generar tu discriminador automáticamente.';
  }

  @override
  String get customTagIsTemporary => 'La etiqueta personalizada es temporal';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Tu etiqueta personalizada de 4 dígitos solo está disponible mientras tu suscripción a Plutonium esté activa. Cuando tu suscripción expire el $date, tu etiqueta volverá a ser un número asignado aleatoriamente después de un período de gracia de 3 días.';
  }

  @override
  String get customTagTemporaryBody =>
      'Tu etiqueta personalizada de 4 dígitos solo está disponible mientras tu suscripción a Plutonium esté activa. Cuando tu suscripción expire, tu etiqueta volverá a ser un número asignado aleatoriamente después de un período de gracia de 3 días.';

  @override
  String get iUnderstandContinue => 'Entendido, continuar';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Si guardas este FluxerTag, tu etiqueta personalizada de 4 dígitos volverá a ser un número aleatorio cuando finalice tu suscripción a Plutonium. Si tu suscripción no se renueva, tendrás un período de gracia de 3 días antes de que cambie la etiqueta.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Tu etiqueta personalizada de 4 dígitos (#$discriminator) está activa mientras tu suscripción a Plutonium esté activa. Si tu suscripción finaliza o no se renueva después de un período de gracia de 3 días, tu etiqueta volverá a ser un número aleatorio.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Personaliza tu etiqueta de 4 dígitos o consérvala al cambiar tu nombre de usuario';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Tu prueba de Plutonium expira el $date. Mejora para conservar tu etiqueta personalizada y obtener una insignia en tu perfil.';
  }

  @override
  String get premiumTrialActive =>
      'Estás en una prueba de Plutonium. Mejora para conservar tu etiqueta personalizada y obtener una insignia en tu perfil.';

  @override
  String get fluxerTagUpdated => 'FluxerTag actualizado';

  @override
  String get fluxerTagUpdateFailed =>
      'Error al actualizar FluxerTag. Inténtalo de nuevo.';

  @override
  String get continueAction => 'Continuar';

  @override
  String get profileCustomizationTitle => 'Personalización del perfil';

  @override
  String get profileCustomizationDescription =>
      'Edita la apariencia de tu perfil y ve una vista previa en directo';

  @override
  String get usernameLabel => 'Nombre de usuario';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Reclama tu cuenta para cambiar tu FluxerTag';

  @override
  String get changeFluxerTag => 'Cambiar FluxerTag';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Personaliza tu etiqueta de 4 dígitos (#$discriminator) a tu gusto con Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Cambia tu nombre de usuario y etiqueta de 4 dígitos';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Tu etiqueta personalizada (#$discriminator) está vinculada a tu suscripción de Plutonium y volverá a ser una etiqueta aleatoria si caduca.';
  }

  @override
  String get displayNameLabel => 'Nombre para mostrar';

  @override
  String get pronounsLabel => 'Pronombres';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Cambiar avatar';

  @override
  String get removeAvatar => 'Eliminar avatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Máx. 10 MB. Recomendado: 512 x 512 píxeles';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get changeBanner => 'Cambiar banner';

  @override
  String get removeBanner => 'Eliminar banner';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Máx. 10 MB. Mínimo: 960 x 540 píxeles (16:9)';

  @override
  String get accentColorLabel => 'Color de acento';

  @override
  String get accentColorDescription =>
      'Personaliza el borde y el color del banner de tu perfil';

  @override
  String get aboutMeLabel => 'Acerca de mí';

  @override
  String get aboutMeHelperText => 'Puedes usar enlaces, emojis y Markdown.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle =>
      'Privacidad de la insignia de Plutonium';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Controla cómo se muestra tu insignia de Plutonium a otros';

  @override
  String get hidePlutoniumBadgeLabel =>
      'Ocultar insignia de Plutonium por completo';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Oculta completamente tu insignia de Plutonium a otros usuarios';

  @override
  String get hidePlutoniumPurchaseDate =>
      'Ocultar fecha de compra de Plutonium';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Ocultar fecha de compra de Plutonium ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Elimina la fecha de tu primera compra de Plutonium de tu insignia';

  @override
  String get maskVisionaryAsSubscription =>
      'Ocultar Visionary como suscripción';

  @override
  String get maskVisionaryDescription =>
      'Muestra tu Visionary como una suscripción normal';

  @override
  String get hideVisionaryIdBadge => 'Ocultar insignia de ID de Visionary';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Ocultar insignia de ID de Visionary (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription =>
      'Elimina tu insignia de ID de Visionary';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Estás en una prueba de Plutonium; tu suscripción comienza el $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Tu suscripción comenzará automáticamente cuando finalice tu prueba. No necesitas hacer nada.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Estás en una prueba de Plutonium que expira el $date';
  }

  @override
  String get premiumTrialActiveProfile => 'Estás en una prueba de Plutonium';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Máx. 10 MB. Recomendado: 512 x 512 píxeles. Los avatares animados (GIF) requieren Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Personaliza tu perfil con una imagen de banner estática o animada para que destaque.';

  @override
  String get getPlutonium => 'Obtener Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Las compras dentro de la aplicación aún no están disponibles en esta plataforma. ¡Mantente atento, pronto estará disponible!';

  @override
  String get profilePreviewLabel => 'Vista previa';

  @override
  String get profilePreviewMessage => 'Mensaje';

  @override
  String get profilePreviewMemberSince => 'Miembro de Fluxer desde';

  @override
  String get unclaimedAccountTitle => 'Cuenta no reclamada';

  @override
  String get unclaimedAccountDescription =>
      'Tu cuenta aún no ha sido reclamada. Sin un correo electrónico y una contraseña, podrías perder el acceso. Reclama tu cuenta ahora para asegurarla.';

  @override
  String get claimAccount => 'Reclamar cuenta';

  @override
  String get profileTypeLabel => 'Tipo de perfil';

  @override
  String get profileTypeGlobal => 'Perfil global';

  @override
  String get profileTypeGuildDescription =>
      'Estás editando tu perfil por comunidad. Este perfil solo será visible en esta comunidad y anulará tu perfil global.';

  @override
  String get communityNicknameLabel => 'Apodo de la comunidad';

  @override
  String get perGuildPremiumUpsellText =>
      'Personalizar tu avatar, banner, color de acento y biografía para comunidades individuales requiere Plutonium. El apodo y los pronombres de la comunidad son gratuitos para todos.';

  @override
  String get avatarModeInherit => 'Usar perfil global';

  @override
  String get avatarModeCustom => 'Usar imagen personalizada';

  @override
  String get avatarModeUnset => 'No mostrar';

  @override
  String get profileSavedToast => 'Perfil actualizado';

  @override
  String get profileEditButton => 'Editar perfil';

  @override
  String get profileNoteLabel => 'Nota';

  @override
  String get profileNoteVisibility => '(solo visible para ti)';

  @override
  String get profileNoteEmpty => 'Aún no hay nota.';

  @override
  String get sudoTitle => 'Verifica tu identidad';

  @override
  String get sudoDescription =>
      'Esta acción requiere verificación para continuar.';

  @override
  String get sudoAuthenticatorCode => 'Código del autenticador';

  @override
  String get sudoMethodPassword => 'Contraseña';

  @override
  String get sudoMethodTotp => 'Autenticador';

  @override
  String get sudoVerificationFailed =>
      'Verificación fallida. Inténtalo de nuevo.';

  @override
  String get securityAccountTitle => 'Cuenta';

  @override
  String get securityAccountDescription =>
      'Gestiona tu correo electrónico, contraseña y ajustes de cuenta';

  @override
  String get securitySectionTitle => 'Seguridad';

  @override
  String get securitySectionDescription =>
      'Protege tu cuenta con autenticación de dos factores y passkeys';

  @override
  String get securityLoginEmailSectionTitle => 'Ajustes de correo electrónico';

  @override
  String get securityLoginEmailSectionDescription =>
      'Gestiona la dirección de correo electrónico que usas para iniciar sesión en Fluxer';

  @override
  String get securityLoginEmailAddressLabel =>
      'Dirección de correo electrónico';

  @override
  String get securityLoginNoEmailSet =>
      'No hay dirección de correo electrónico configurada';

  @override
  String get securityLoginChangeEmail => 'Cambiar correo electrónico';

  @override
  String get securityLoginAddEmail => 'Añadir correo electrónico';

  @override
  String get securityLoginReveal => 'Mostrar';

  @override
  String get securityLoginHide => 'Ocultar';

  @override
  String get securityLoginPasswordSectionTitle => 'Contraseña';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Cambia tu contraseña para mantener tu cuenta segura';

  @override
  String get securityLoginCurrentPasswordLabel => 'Contraseña actual';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Último cambio: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Último cambio: Nunca';

  @override
  String get securityLoginNoPasswordSet => 'No hay contraseña configurada';

  @override
  String get securityLoginChangePassword => 'Cambiar contraseña';

  @override
  String get securityLoginSetPassword => 'Establecer contraseña';

  @override
  String get passwordChangeTitle => 'Cambiar contraseña';

  @override
  String get passwordChangeIntroDescription =>
      'Te enviaremos un código de verificación a tu dirección de correo electrónico para confirmar tu identidad antes de cambiar tu contraseña.';

  @override
  String get passwordChangeStart => 'Empezar';

  @override
  String get passwordChangeVerifyTitle => 'Verifica tu correo electrónico';

  @override
  String get passwordChangeVerifyDescription =>
      'Introduce el código de verificación enviado a tu dirección de correo electrónico.';

  @override
  String get passwordChangeVerificationCode => 'Código de verificación';

  @override
  String get passwordChangeVerify => 'Verificar';

  @override
  String get passwordChangeNewPasswordTitle => 'Establecer nueva contraseña';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Introduce tu nueva contraseña a continuación.';

  @override
  String get passwordChangeNewPassword => 'Nueva contraseña';

  @override
  String get passwordChangeConfirmPassword => 'Confirmar nueva contraseña';

  @override
  String get passwordChangeSubmit => 'Cambiar contraseña';

  @override
  String get passwordChangeSuccess => 'Contraseña cambiada';

  @override
  String get passwordChangePasswordsDoNotMatch =>
      'Las contraseñas no coinciden';

  @override
  String get passwordChangeInvalidCode => 'Código no válido o caducado';

  @override
  String get emailChangeTitle => 'Cambiar correo electrónico';

  @override
  String get emailChangeIntroDescription =>
      'Enviaremos códigos de verificación para confirmar tu identidad antes de cambiar tu dirección de correo electrónico.';

  @override
  String get emailChangeStart => 'Empezar';

  @override
  String get emailChangeVerifyOriginalTitle =>
      'Verificar correo electrónico actual';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Introduce el código de verificación enviado a tu dirección de correo electrónico actual.';

  @override
  String get emailChangeNewEmailTitle =>
      'Introduce el nuevo correo electrónico';

  @override
  String get emailChangeNewEmailDescription =>
      'Introduce la nueva dirección de correo electrónico que deseas utilizar.';

  @override
  String get emailChangeNewEmailLabel => 'Nuevo correo electrónico';

  @override
  String get emailChangeNewEmailSubmit => 'Enviar código de verificación';

  @override
  String get emailChangeVerifyNewTitle => 'Verificar nuevo correo electrónico';

  @override
  String get emailChangeVerifyNewDescription =>
      'Introduce el código de verificación enviado a tu nueva dirección de correo electrónico.';

  @override
  String get emailChangeSuccess => 'Correo electrónico cambiado';

  @override
  String get emailChangeInvalidCode => 'Código no válido o caducado';

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
  String get save => 'Guardar';

  @override
  String get securityTfaSectionTitle => 'Autenticación de dos factores';

  @override
  String get securityTfaSectionDescription =>
      'Añade una capa extra de seguridad a tu cuenta';

  @override
  String get securityTfaAuthenticatorApp => 'Aplicación de autenticación';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'La autenticación de dos factores está activada';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Usa una aplicación de autenticación para generar códigos para la autenticación de dos factores';

  @override
  String get securityTfaBackupCodes => 'Códigos de respaldo';

  @override
  String get securityTfaBackupCodesDescription =>
      'Ver y gestionar tus códigos de respaldo para la recuperación de la cuenta';

  @override
  String get securityTfaViewCodes => 'Ver códigos';

  @override
  String get securityPasskeysSectionTitle => 'Claves de acceso';

  @override
  String get securityPasskeysSectionDescription =>
      'Usa claves de acceso para iniciar sesión sin contraseña y para la autenticación de dos factores';

  @override
  String get securityPasskeysRegistered => 'Claves de acceso registradas';

  @override
  String get securityPasskeysNone => 'No hay claves de acceso registradas';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'claves de acceso',
      one: 'clave de acceso',
    );
    return '$count $_temp0 registradas (máx. 10)';
  }

  @override
  String get securityPasskeysAdd => 'Añadir clave de acceso';

  @override
  String securityPasskeysAdded(String date) {
    return 'Añadida: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Último uso: $date';
  }

  @override
  String get securityPasskeysRename => 'Renombrar';

  @override
  String get securityPasskeysDeleteTitle => 'Eliminar clave de acceso';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return '¿Estás seguro de que quieres eliminar la clave de acceso \"$name\"?';
  }

  @override
  String get securityPasskeyNameTitle => 'Nombrar clave de acceso';

  @override
  String get securityPasskeyNameLabel => 'Nombre de la clave de acceso';

  @override
  String get securityPasskeyNameHint =>
      'p. ej., YubiKey, iPhone, Ordenador del trabajo';

  @override
  String get securityPhoneSectionTitle => 'Número de teléfono';

  @override
  String get securityPhoneSectionDescription =>
      'Gestiona tu número de teléfono.';

  @override
  String get securityPhoneLabel => 'Número de teléfono';

  @override
  String get securityPhoneNone => 'No se ha añadido ningún número de teléfono.';

  @override
  String get securityPhoneAdd => 'Añadir teléfono';

  @override
  String get securityPhoneRemove => 'Eliminar';

  @override
  String get securityPhoneRemoveTitle => 'Eliminar número de teléfono';

  @override
  String get securityPhoneRemoveDescription =>
      '¿Estás seguro de que quieres eliminar tu número de teléfono?';

  @override
  String get securityPhoneRemoved => 'Número de teléfono eliminado';

  @override
  String get securityClaimTitle => 'Funciones de seguridad';

  @override
  String get securityClaimDescription =>
      'Reclama tu cuenta para acceder a funciones de seguridad como la autenticación de dos factores y las claves de acceso.';

  @override
  String get securityVerifyEmailRequired =>
      'Debes verificar tu dirección de correo electrónico antes de poder configurar la autenticación de dos factores, las claves de acceso o la verificación por SMS.';

  @override
  String get totpEnableTitle => 'Configurar aplicación de autenticación';

  @override
  String get totpEnableDescription =>
      'Escanea el código QR con tu aplicación de autenticación para generar códigos para la autenticación de dos factores.';

  @override
  String get totpEnableCodeLabel => 'Código';

  @override
  String get totpEnableCodeHint =>
      'Introduce el código de 6 dígitos de tu aplicación de autenticación';

  @override
  String get totpEnableSuccess =>
      'La autenticación de dos factores se ha activado';

  @override
  String get totpDisableTitle => 'Eliminar aplicación de autenticación';

  @override
  String get totpDisableDescription =>
      'Introduce el código de 6 dígitos de tu aplicación de autenticación para desactivar la autenticación de dos factores.';

  @override
  String get totpDisableSuccess => 'Autenticación de dos factores desactivada';

  @override
  String get backupCodesTitle => 'Códigos de copia de seguridad';

  @override
  String get backupCodesWarning =>
      'Si pierdes el acceso a tu aplicación de autenticación y no tienes estos códigos, se te bloqueará permanentemente el acceso a tu cuenta. Descárgalos o cópialos ahora y guárdalos en un lugar seguro.';

  @override
  String get backupCodesDownload => 'Descargar';

  @override
  String get backupCodesCopy => 'Copiar';

  @override
  String get backupCodesCopied =>
      'Códigos de copia de seguridad copiados en el portapapeles';

  @override
  String get backupCodesAcknowledge =>
      'He descargado o copiado mis códigos de copia de seguridad y los he guardado en un lugar seguro.';

  @override
  String get backupCodesDone => 'Hecho';

  @override
  String get backupCodesViewTitle => 'Ver códigos de copia de seguridad';

  @override
  String get backupCodesViewDescription =>
      'Es posible que se requiera verificación antes de ver tus códigos de copia de seguridad.';

  @override
  String get phoneAddTitle => 'Añadir número de teléfono';

  @override
  String get phoneAddLabel => 'Número de teléfono';

  @override
  String get phoneAddHint => 'Introduce tu número de teléfono';

  @override
  String get phoneAddFooter =>
      'Introduce tu número de teléfono. Te enviaremos un código de verificación por SMS.';

  @override
  String get phoneAddSendCode => 'Enviar código';

  @override
  String get phoneVerifyTitle => 'Verificar número de teléfono';

  @override
  String get phoneVerifyDescription =>
      'Introduce el código de verificación enviado a tu número de teléfono.';

  @override
  String get phoneAddSuccess => 'Número de teléfono añadido';

  @override
  String get dangerZoneSectionTitle => 'Zona de peligro';

  @override
  String get dangerZoneSectionDescription =>
      'Acciones irreversibles y destructivas';

  @override
  String get dangerZoneDisableTitle => 'Desactivar cuenta';

  @override
  String get dangerZoneDisableDescription =>
      'Desactiva temporalmente tu cuenta. Puedes reactivarla más tarde iniciando sesión de nuevo.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Desactivar tu cuenta te cerrará la sesión en todas las sesiones. Puedes reactivar tu cuenta en cualquier momento iniciando sesión de nuevo.';

  @override
  String get dangerZoneDeleteTitle => 'Eliminar cuenta';

  @override
  String get dangerZoneDeleteDescription =>
      'Elimina permanentemente tu cuenta y todos los datos asociados. Esta acción no se puede deshacer.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Cancela tu suscripción activa de Plutonium en la configuración de Plutonium antes de eliminar tu cuenta.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount =>
      'No se puede eliminar la cuenta';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'No puedes eliminar tu cuenta mientras seas propietario de comunidades. Transfiere la propiedad de las siguientes comunidades primero:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'y $count más';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Para transferir la propiedad, ve a $settingsPath y utiliza la opción de transferir propiedad.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      '¿Estás seguro de que quieres eliminar tu cuenta? Esta acción programará tu cuenta para su eliminación permanente.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Puedes cancelar el proceso de eliminación en un plazo de 14 días';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Después de 14 días, tu cuenta se eliminará permanentemente';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Una vez procesada la eliminación, no podrás recuperar el acceso a tu cuenta';

  @override
  String get dangerZoneDeleteBullet4 =>
      'No podrás eliminar tus mensajes enviados después de que se elimine tu cuenta';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Si deseas exportar tus datos o eliminar tus mensajes primero, visita la sección Panel de privacidad en Configuración de usuario antes de continuar.';

  @override
  String get claimAccountTitle => 'Reclamar tu cuenta';

  @override
  String get claimAccountDescription =>
      'Reclama tu cuenta añadiendo un correo electrónico y una contraseña. Te enviaremos un código de verificación para confirmar tu correo electrónico antes de finalizar.';

  @override
  String get claimAccountEmailLabel => 'Correo electrónico';

  @override
  String get claimAccountPasswordLabel => 'Contraseña';

  @override
  String get claimAccountSendCode => 'Enviar código';

  @override
  String get claimAccountVerifyDescription =>
      'Introduce el código que te hemos enviado al correo para verificarlo. Tu contraseña se establecerá una vez confirmado el código.';

  @override
  String get claimAccountSuccess => 'Cuenta reclamada con éxito';

  @override
  String get importantInformation => 'Información importante:';

  @override
  String get genericError => 'Ha ocurrido un error';

  @override
  String get invalidCode => 'Código no válido';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace # años',
      one: 'hace 1 año',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace # meses',
      one: 'hace 1 mes',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace # días',
      one: 'hace 1 día',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace # horas',
      one: 'hace 1 hora',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace # minutos',
      one: 'hace 1 minuto',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'justo ahora';

  @override
  String get authorizedAppsTitle => 'Aplicaciones autorizadas';

  @override
  String get authorizedAppsDescription =>
      'A estas aplicaciones se les ha concedido acceso a tu cuenta de Fluxer.';

  @override
  String get authorizedAppsEmptyTitle => 'Sin aplicaciones autorizadas';

  @override
  String get authorizedAppsEmptyDescription =>
      'Aún no has autorizado ninguna aplicación para acceder a tu cuenta.';

  @override
  String get authorizedAppsLoadError =>
      'Error al cargar las aplicaciones autorizadas';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Autorizado el $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Permisos concedidos';

  @override
  String get authorizedAppsRevoke => 'Revocar';

  @override
  String get authorizedAppsRevokeTitle => 'Revocar acceso a la aplicación';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return '¿Seguro que quieres revocar el acceso a $appName? Esta aplicación ya no tendrá acceso a tu cuenta.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Acceder a la información básica de tu perfil (nombre de usuario, avatar, etc.)';

  @override
  String get authorizedAppsScopeEmail =>
      'Ver tu dirección de correo electrónico';

  @override
  String get authorizedAppsScopeGuilds =>
      'Ver las comunidades de las que eres miembro';

  @override
  String get authorizedAppsScopeConnections => 'Ver tus cuentas conectadas';

  @override
  String get authorizedAppsScopeBot =>
      'Añadir un bot a una comunidad con los permisos solicitados';

  @override
  String get authorizedAppsScopeAdmin =>
      'Acceder a los puntos de conexión administrativos';

  @override
  String get privacyPendingDeletionTitle => 'Pendiente de eliminación';

  @override
  String get blockedUsersTitle => 'Usuarios bloqueados';

  @override
  String get blockedUsersDescription =>
      'Los usuarios bloqueados no pueden enviarte solicitudes de amistad ni mensajes directos.';

  @override
  String get blockedUsersEmptyTitle => 'Sin usuarios bloqueados';

  @override
  String get blockedUsersEmptyDescription => 'Aún no has bloqueado a nadie.';

  @override
  String get blockedUsersLoadError => 'Error al cargar los usuarios bloqueados';

  @override
  String get blockedUsersUnblock => 'Desbloquear';

  @override
  String get blockedUsersUnblockTitle => 'Desbloquear usuario';

  @override
  String blockedUsersUnblockDescription(String username) {
    return '¿Seguro que quieres desbloquear a $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Copiar FluxerTag';

  @override
  String get blockedUsersCopyId => 'Copiar ID de usuario';

  @override
  String get userProfileLoadError => 'No se ha podido cargar el perfil';

  @override
  String get userProfileRetry => 'Reintentar';

  @override
  String get userProfileMessage => 'Mensaje';

  @override
  String get userProfileVoiceCall => 'Llamada de voz';

  @override
  String get userProfileVideoCall => 'Videollamada';

  @override
  String get userProfileEditProfile => 'Editar perfil';

  @override
  String get userProfileStaffBadgeTooltip => 'Equipo de Fluxer';

  @override
  String get userProfileCtpBadgeTooltip => 'Equipo de la comunidad de Fluxer';

  @override
  String get userProfilePartnerBadgeTooltip => 'Socio de Fluxer';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Cazador de errores de Fluxer';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer Plutonium';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Suscriptor de Fluxer Plutonium desde $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Visionario de Fluxer';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Visionario de Fluxer desde $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'ID de visionario #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Amigos en común ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Comunidades en común ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Amigos en común';

  @override
  String get userProfileMutualCommunitiesTitle => 'Comunidades en común';

  @override
  String get userProfileNoMutualFriends =>
      'No se han encontrado amigos en común.';

  @override
  String get userProfileNoMutualCommunities =>
      'No se han encontrado comunidades en común.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Apodo: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Abrir DM';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Has bloqueado a $username. No podrás enviar mensajes a menos que lo desbloquees.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Desbloquear';

  @override
  String get userProfileOpenDm => 'Abrir DM';

  @override
  String get userProfileNoteTitle => 'Nota';

  @override
  String get userProfileNoteVisibility => '(solo visible para ti)';

  @override
  String get userProfileNoteSave => 'Guardar';

  @override
  String get userProfileNoteDelete => 'Eliminar';

  @override
  String get userProfileNoteEmpty => 'Toca para añadir una nota';

  @override
  String get userProfileMemberSince => 'Miembro desde';

  @override
  String get userProfileAboutMe => 'Sobre mí';

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
  String get userProfileCopyUsername => 'Copiar nombre de usuario';

  @override
  String get userProfileCopyUserId => 'Copiar ID de usuario';

  @override
  String get userProfileViewMainProfile => 'Ver perfil principal';

  @override
  String get userProfileViewCommunityProfile => 'Ver perfil de comunidad';

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
    return '¿Seguro que quieres bloquear a $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Desbloquear usuario';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return '¿Seguro que quieres desbloquear a $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Eliminar amigo';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return '¿Seguro que quieres eliminar a $username como amigo?';
  }

  @override
  String get userProfileFailedOpenDm => 'Error al abrir DM';

  @override
  String get userProfileFailedSaveNote => 'Error al guardar la nota';

  @override
  String get userProfileActionFailed => 'La acción falló, inténtalo de nuevo';

  @override
  String get userProfileChangeNickname => 'Cambiar apodo';

  @override
  String get userProfileKick => 'Expulsar';

  @override
  String get userProfileBan => 'Banear';

  @override
  String get userProfileTimeout => 'Silenciar';

  @override
  String get userProfileRemoveTimeout => 'Eliminar silencio';

  @override
  String get userProfileTransferOwnership => 'Transferir propiedad';

  @override
  String get userProfileReportUser => 'Informar sobre el usuario';

  @override
  String get userProfileReportMessage => 'Informar sobre el mensaje';

  @override
  String userProfileKickConfirmTitle(String username) {
    return '¿Expulsar a $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return '¿Seguro que quieres expulsar a $username? Puede volver a unirse con una nueva invitación.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Quitar el silencio?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Al quitar el silencio, $username podrá volver a enviar mensajes, reaccionar y unirse a canales de voz.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Transferir propiedad?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return '¿Transferir la propiedad de esta comunidad a $username? Esto es irreversible y perderás todos los privilegios de propietario.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Expulsar a $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Duración de la expulsión';

  @override
  String get userProfileBanCustomSecondsLabel =>
      'Duración personalizada (segundos)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Cualquier valor entre $min y $max segundos';
  }

  @override
  String get userProfileBanDeleteHistoryLabel =>
      'Eliminar historial de mensajes';

  @override
  String get userProfileBanDeleteNone => 'No eliminar ninguno';

  @override
  String get userProfileBanDelete24h => 'Últimas 24 horas';

  @override
  String get userProfileBanDelete7d => 'Últimos 7 días';

  @override
  String get userProfileBanReasonLabel => 'Motivo (opcional)';

  @override
  String get userProfileBanReasonHint =>
      'Introduce un motivo para la expulsión';

  @override
  String get userProfileBanSubmit => 'Expulsar miembro';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Silenciar a $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Duración del silencio';

  @override
  String get userProfileTimeoutSubmit => 'Silenciar miembro';

  @override
  String get userProfileNicknameLabel => 'Apodo';

  @override
  String get userProfileNicknameHint => 'Introduce un apodo';

  @override
  String get userProfileNicknameSave => 'Guardar';

  @override
  String userProfileKickSuccess(String username) {
    return 'Se ha expulsado a $username';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Se ha expulsado a $username';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Se ha silenciado a $username';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Se ha quitado el silencio a $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Apodo actualizado';

  @override
  String get userProfileTransferSuccess => 'Propiedad transferida';

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
  String get iarReportUserTitle => 'Informar de usuario';

  @override
  String get iarReasonInappropriateProfile => 'Perfil inapropiado';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'El perfil de este usuario contiene contenido inapropiado';

  @override
  String typingIndicatorOne(String name) {
    return 'Escribiendo $name...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return 'Escribiendo $name1 y $name2...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return 'Escribiendo $name1, $name2 y $name3...';
  }

  @override
  String get typingIndicatorMultiple => 'Varias personas están escribiendo...';

  @override
  String get typingIndicatorHandful =>
      'Un puñado de guerreros del teclado se están reuniendo...';

  @override
  String get typingIndicatorSymphony =>
      'Una sinfonía de teclas está en marcha...';

  @override
  String get typingIndicatorFiesta =>
      'Esto es una auténtica fiesta de escritura';

  @override
  String get typingIndicatorApocalypse =>
      'Vaya, es un apocalipsis de escritura';

  @override
  String systemJoinGladYoureHere(String username) {
    return '¡Nos alegra que estés aquí, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return '¡Bienvenido, $username! Ponte cómodo.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return '¡Hola, $username! Nos alegra tenerte aquí.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return '¡Hola, $username! Participa cuando estés listo.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return '¡Hola $username, nos alegra verte por aquí!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return '¡Hola, $username! Esperamos que disfrutes tu estancia.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return '¡Hola, $username, bienvenido a bordo!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return '¡Nos alegra que hayas llegado, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return '¡Bienvenido, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return '¡Bienvenido, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Bienvenido, $username. Nos alegra que estés aquí.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return '¡Bienvenido, $username! Esperamos que disfrutes tu tiempo aquí.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return '¡Bienvenido, $username! Tu próxima conversación empieza aquí.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Bienvenido, $username. Estamos contentos de tenerte aquí.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return '¡Nos alegra verte, $username! Bienvenido.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return '¡Estás aquí, $username! Nos alegra tenerte con nosotros.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return '¡Has llegado, $username! Empecemos.';
  }

  @override
  String get relativeTimeShortNow => 'ahora';

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
  String get linkedDevicesTitle => 'Mis dispositivos';

  @override
  String get linkedDevicesDescription =>
      'Consulta todos los dispositivos que han iniciado sesión actualmente en tu cuenta. Revoca cualquier sesión que no reconozcas.';

  @override
  String get linkedDevicesCurrentDevice => 'Dispositivo actual';

  @override
  String get linkedDevicesOtherDevices => 'Otros dispositivos';

  @override
  String get linkedDevicesEnterSelection => 'Entrar en modo de selección';

  @override
  String get linkedDevicesExitSelection => 'Salir del modo de selección';

  @override
  String get linkedDevicesSelectAll => 'Seleccionar todo';

  @override
  String get linkedDevicesClearSelection => 'Borrar selección';

  @override
  String get linkedDevicesRevokeTooltip => 'Revocar dispositivo';

  @override
  String get linkedDevicesSignOutAll =>
      'Cerrar sesión en todos los demás dispositivos';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cerrar sesión en $count dispositivos',
      one: 'Cerrar sesión en 1 dispositivo',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cerrar sesión en $count dispositivos',
      one: 'Cerrar sesión en 1 dispositivo',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Cerrar sesión en todos los demás dispositivos';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Esto cerrará la sesión de los dispositivos seleccionados en tu cuenta. Deberás iniciar sesión de nuevo en esos dispositivos.',
      one:
          'Esto cerrará la sesión del dispositivo seleccionado en tu cuenta. Deberás iniciar sesión de nuevo en ese dispositivo.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Esto cerrará la sesión de los dispositivos seleccionados en tu cuenta. Deberás iniciar sesión de nuevo en esos dispositivos.';

  @override
  String get linkedDevicesSignOutConfirm => 'Continuar';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Tendrás que volver a iniciar sesión en todos los dispositivos en los que hayas cerrado sesión';

  @override
  String get linkedDevicesLoadErrorTitle => 'Error de red';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Tenemos problemas para conectarnos al continuo espacio-temporal. Comprueba tu conexión e inténtalo de nuevo.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dispositivos revocados',
      one: 'Dispositivo revocado',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'No se ha podido cerrar la sesión. Inténtalo de nuevo.';

  @override
  String get linkedDevicesUnknownOs => 'SO desconocido';

  @override
  String get linkedDevicesUnknownPlatform => 'Plataforma desconocida';

  @override
  String slowmodeLabel(String duration) {
    return 'Modo lento de $duration';
  }

  @override
  String get slowmodeTooltipActive =>
      'Estás en modo lento. Espera antes de enviar otro mensaje.';

  @override
  String get slowmodeTooltipImmune =>
      'El modo lento está activado, pero eres inmune.';

  @override
  String get channelNoSendPermissionHint =>
      'No puedes enviar mensajes en este canal.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Anuncios del sistema del personal de $productName. No puedes responder aquí.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'La mensajería se ha pausado temporalmente en esta comunidad.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Tienes un tiempo de espera. La mensajería, las reacciones y la voz se pausan hasta que expire el tiempo de espera.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Necesitas reclamar tu cuenta para enviar mensajes en esta comunidad.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Necesitas verificar tu correo electrónico para enviar mensajes en esta comunidad.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Tu cuenta es demasiado nueva para enviar mensajes en esta comunidad.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'No has sido miembro de esta comunidad el tiempo suficiente para enviar mensajes.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Necesitas verificar un número de teléfono para enviar mensajes en esta comunidad.';

  @override
  String get channelComposerBarrierVerifyEmail =>
      'Verificar correo electrónico';

  @override
  String get channelComposerBarrierVerifyPhone => 'Verificar teléfono';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Demasiados archivos adjuntos (máx. $max)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'Uno o más archivos superan el límite de tamaño';

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Esos archivos son demasiado grandes para enviarlos juntos';

  @override
  String get chatAttachmentDropToUpload => 'Suelta los archivos para subirlos';

  @override
  String get chatAttachmentDropToSend =>
      'Suelta los archivos para enviarlos ahora';

  @override
  String get chatAttachmentSendVoiceMessage => 'Enviar mensaje de voz';

  @override
  String get voiceMessageTitle => 'Mensaje de voz';

  @override
  String get voiceMessageHoldHint =>
      'Mantén pulsado para grabar. Arrastra hacia arriba para bloquear o suelta para enviar.';

  @override
  String get voiceMessageDiscard => 'Descartar mensaje de voz';

  @override
  String get voiceMessageSend => 'Enviar mensaje de voz';

  @override
  String get voiceMessageMicPermissionDenied =>
      'No se puede iniciar la grabación. Permite el acceso al micrófono.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'La grabación de voz no es compatible en este dispositivo.';

  @override
  String get voiceMessageMicInUse =>
      'Abandona la llamada de voz para grabar un mensaje de voz.';

  @override
  String get voiceMessageRecordingFailed =>
      'La grabación ha fallado. Inténtalo de nuevo.';

  @override
  String get voiceMessageSendFailed =>
      'No se puede enviar el mensaje de voz. Inténtalo de nuevo.';

  @override
  String get voiceMessageRecordingHint =>
      'Habla ahora. Pulsa Detener cuando hayas terminado; puedes recortar después.';

  @override
  String get voiceMessageReviewHint =>
      'Arrastra los manejadores para recortar y luego pulsa Enviar.';

  @override
  String get voiceMessageStop => 'Detener';

  @override
  String get voiceMessageStartRecording => 'Iniciar grabación';

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

    return 'La selección debe tener al menos ${secondsString}s.';
  }

  @override
  String get chatAttachmentEditTitle => 'Editar archivo adjunto';

  @override
  String get chatAttachmentFilenameLabel => 'Nombre de archivo';

  @override
  String get chatAttachmentDescriptionLabel => 'Descripción';

  @override
  String get chatAttachmentDescriptionHint => 'Texto alternativo opcional';

  @override
  String get chatAttachmentSpoilerLabel => 'Marcar como spoiler';

  @override
  String get chatAttachmentRemove => 'Quitar archivo adjunto';

  @override
  String get chatAttachmentDownload => 'Descargar';

  @override
  String get chatAttachmentExpiredTooltip => 'Archivo adjunto caducado';

  @override
  String get chatAttachmentSourceGallery => 'Galería';

  @override
  String get chatAttachmentSourceCamera => 'Cámara';

  @override
  String get chatAttachmentSourceBrowse => 'Explorar archivos';

  @override
  String get chatAttachmentPasteTooltip => 'Pegar imagen del portapapeles';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Revelar spoiler';

  @override
  String get matureMediaRevealButton => 'Revelar';

  @override
  String get matureMediaRevealHint => 'Haz clic para revelar';

  @override
  String get matureContentTitle => 'Contenido para adultos';

  @override
  String get matureCommunityTitle => 'Comunidad para adultos';

  @override
  String get matureCategoryTitle => 'Categoría para adultos';

  @override
  String get matureChannelTitle => 'Canal para adultos';

  @override
  String get communityContentWarningTitle =>
      'Advertencia de contenido de la comunidad';

  @override
  String get categoryContentWarningTitle =>
      'Advertencia de contenido de la categoría';

  @override
  String get channelContentWarningTitle => 'Advertencia de contenido del canal';

  @override
  String get defaultContentWarningBody => 'Esto contiene contenido sensible.';

  @override
  String get matureCommunityBody =>
      'Esta comunidad está marcada para contenido para adultos y puede contener material que no sea apropiado para algunos usuarios.';

  @override
  String get matureCategoryBody =>
      'Esta categoría está marcada para contenido para adultos y puede contener material que no sea apropiado para algunos usuarios.';

  @override
  String get matureChannelBody =>
      'Este canal está marcado para contenido para adultos y puede contener material que no sea apropiado para algunos usuarios.';

  @override
  String get matureVoiceChannelBody =>
      'Este canal de voz está marcado para contenido para adultos y puede contener material que no sea apropiado para algunos usuarios.';

  @override
  String get matureLinkChannelBody =>
      'Este canal de enlaces está marcado para contenido para adultos y puede abrir material que no sea apropiado para algunos usuarios.';

  @override
  String get matureCommunityUnavailableBody =>
      'Esta comunidad para adultos no está disponible para tu cuenta.';

  @override
  String get matureCategoryUnavailableBody =>
      'Esta categoría para adultos no está disponible para tu cuenta.';

  @override
  String get matureChannelUnavailableBody =>
      'Este canal para adultos no está disponible para tu cuenta.';

  @override
  String get matureContentProceedButton => 'Continuar';

  @override
  String get matureContentUnderstandButton => 'Entiendo';

  @override
  String get matureContentOpenLinkButton => 'Abrir enlace';

  @override
  String get sensitiveContentSectionTitle => 'Contenido sensible';

  @override
  String get sensitiveContentSectionDescription =>
      'Controla cómo se filtra el contenido multimedia para adultos o sensible en diferentes contextos';

  @override
  String get sensitiveContentFriendDmLabel => 'Mensajes directos de amigos';

  @override
  String get sensitiveContentNonFriendDmLabel => 'Mensajes directos de otros';

  @override
  String get sensitiveContentGuildLabel =>
      'Mensajes en canales de la comunidad';

  @override
  String get sensitiveContentFilterShow => 'Mostrar';

  @override
  String get sensitiveContentFilterBlur => 'Desenfocar';

  @override
  String get sensitiveContentFilterBlock => 'Bloquear';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Desenfocar multimedia hasta que se complete el escaneo de seguridad';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Cuando está activado, las imágenes y los vídeos se desenfocan hasta que finaliza el escaneo de seguridad del contenido.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Esta configuración está siempre activada para tu cuenta.';

  @override
  String get sensitiveContentResetButton => 'Restablecer';

  @override
  String get sensitiveContentSaveButton => 'Guardar';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count archivos',
      one: '1 archivo',
    );
    return 'Subiendo $_temp0';
  }

  @override
  String get chatCancelUpload => 'Cancelar subida';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Caduca el $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Caduca entre $start y $end';
  }

  @override
  String get connectionsTitle => 'Conexiones';

  @override
  String get connectionsDescription =>
      'Vincula cuentas y dominios externos a tu perfil de Fluxer. Las conexiones verificadas se mostrarán en tu perfil para que otros las vean.';

  @override
  String get connectionsEmptyTitle => 'Aún no hay conexiones';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Vincula tu cuenta de Bluesky o verifica la propiedad de un dominio para mostrarlos en tu perfil.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Verifica la propiedad de un dominio para mostrarlo en tu perfil.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Dominio';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Añadir conexión de Bluesky';

  @override
  String get connectionsAddDomainAriaLabel => 'Añadir conexión de dominio';

  @override
  String get connectionEdit => 'Editar';

  @override
  String get connectionRemove => 'Eliminar';

  @override
  String get connectionVerifiedLabel => 'Esta conexión ha sido verificada.';

  @override
  String get connectionUnverifiedLabel =>
      'Esta conexión no ha sido verificada.';

  @override
  String get connectionAddTitle => 'Añadir conexión';

  @override
  String get connectionTypeLabel => 'Tipo de conexión';

  @override
  String get connectionHandleLabel => 'Nombre de usuario';

  @override
  String get connectionDomainLabel => 'Dominio';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Ya tienes esta conexión.';

  @override
  String get connectionConnectBluesky => 'Conectar con Bluesky';

  @override
  String get connectionContinue => 'Continuar';

  @override
  String get connectionVerifyTitle => 'Verificar conexión';

  @override
  String get connectionVerifyInstructions =>
      'Usa el registro siguiente para demostrar la propiedad del dominio.';

  @override
  String get connectionDnsRecordTitle => 'Registro TXT de DNS';

  @override
  String get connectionDnsHostLabel => 'Host';

  @override
  String get connectionDnsValueLabel => 'Valor';

  @override
  String get connectionCopyHost => 'Copiar host';

  @override
  String get connectionCopyValue => 'Copiar valor';

  @override
  String get connectionCopied => '¡Copiado!';

  @override
  String get connectionTokenFileTitle => 'Servir el archivo de token';

  @override
  String get connectionTokenFileDescription =>
      'Descarga **fluxer-verification** y colócalo en tu carpeta **.well-known** para que podamos validar el dominio.';

  @override
  String get connectionTokenFileDownload => 'Descargar fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'El archivo contiene el token de verificación que obtendremos de **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Guardar fluxer-verification';

  @override
  String get connectionVerifyButton => 'Verificar';

  @override
  String get connectionBack => 'Atrás';

  @override
  String get connectionEditTitle => 'Editar conexión';

  @override
  String get connectionEditDescription =>
      'Elige quién puede ver esta conexión en tu perfil.';

  @override
  String get connectionVisibilityEveryone => 'Todos';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Permitir que cualquiera vea esta conexión en tu perfil';

  @override
  String get connectionVisibilityFriends => 'Amigos';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Permitir que tus amigos vean esta conexión';

  @override
  String get connectionVisibilityCommunityMembers => 'Miembros de la comunidad';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Permitir que los miembros de las comunidades a las que perteneces vean esta conexión';

  @override
  String get connectionRemoveTitle => 'Eliminar conexión';

  @override
  String get connectionRemoveDescription =>
      '¿Estás seguro de que quieres eliminar esta conexión? Esta acción no se puede deshacer.';

  @override
  String get connectionRemoveConfirm => 'Eliminar';

  @override
  String get connectionsLoadError => 'Error al cargar conexiones';

  @override
  String get connectionsReorderError => 'Error al actualizar el orden';

  @override
  String get connectionInitiateFailed =>
      'No se pudo iniciar la verificación. Inténtalo de nuevo.';

  @override
  String get connectionVerifyFailed =>
      'No se pudo verificar. Comprueba tu registro de DNS e inténtalo de nuevo.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'No se pudo iniciar la autorización de Bluesky.';

  @override
  String get connectionUpdateFailed => 'No se pudo actualizar la conexión';

  @override
  String get connectionRemoveFailed => 'No se pudo eliminar la conexión';

  @override
  String get connectionTokenSavedToast => 'Se guardó fluxer-verification';

  @override
  String get connectionTokenSaveFailedToast => 'No se pudo guardar el archivo';

  @override
  String get connectionEnterHandle =>
      'Introduce un nombre de usuario de Bluesky.';

  @override
  String get connectionEnterDomain => 'Introduce un dominio.';

  @override
  String get lookAndFeelTitle => 'Aspecto';

  @override
  String get lookAndFeelThemeSectionTitle => 'Tema';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Elige entre apariencia oscura, carbón o clara.';

  @override
  String get lookAndFeelThemeDark => 'Tema oscuro';

  @override
  String get lookAndFeelThemeCoal => 'Tema carbón';

  @override
  String get lookAndFeelThemeLight => 'Tema claro';

  @override
  String get lookAndFeelThemeSystem => 'Tema del sistema';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Sincronizar tema en todos los dispositivos';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Cuando esté activado, los cambios de tema se sincronizarán en todos tus dispositivos. Cuando esté desactivado, este dispositivo usará su propia configuración de tema.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'El tema del sistema deshabilita automáticamente la sincronización para seguir la preferencia de tu sistema en este dispositivo.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'No se pudo sincronizar el tema en tu cuenta. Inténtalo de nuevo.';

  @override
  String get lookAndFeelChatFontScalingTitle =>
      'Escalado de fuentes en el chat';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Ajusta el tamaño de la fuente en el área de chat.';

  @override
  String get lookAndFeelInterfaceTitle => 'Interfaz';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Personaliza elementos y comportamientos de la interfaz.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Indicadores de escritura en la lista de canales';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Elige cómo aparecen los indicadores de escritura en la lista de canales cuando alguien está escribiendo en uno.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Indicador de escritura + Avatares';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Muestra el indicador de escritura con avatares de usuario en la lista de canales';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Solo indicador de escritura';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Muestra solo el indicador de escritura sin avatares';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Oculto';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'No muestres indicadores de escritura en la lista de canales';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Mostrar escritura en el canal seleccionado';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Cuando está desactivado (por defecto), los indicadores de escritura no aparecerán en el canal que estás viendo actualmente.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'general';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Indicadores de teclado';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Controla si los indicadores de atajos de teclado aparecen en las descripciones emergentes.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Ocultar indicadores de teclado en descripciones emergentes';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Cuando está activado, las insignias de atajos se ocultan en las descripciones emergentes.';

  @override
  String get lookAndFeelNekoTitle => 'Varios';

  @override
  String get lookAndFeelNekoDescription => 'Opciones varias de la interfaz.';

  @override
  String get lookAndFeelShowNekoLabel => 'Mostrar Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Cuando está activado, Neko aparece cerca de la barra de entrada del chat.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Comportamiento al unirse a canales de voz';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Controla cómo te unes a los canales de voz en las comunidades.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Requerir doble clic para unirse a canales de voz';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Cuando está activado, necesitarás hacer doble clic en los canales de voz para unirte. Cuando está desactivado (por defecto), un solo clic te unirá al canal inmediatamente.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'El veloz murciélago hindú comía feliz cardillo y kiwi.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Barra lateral de la comunidad';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Configura cómo la barra lateral de la comunidad muestra los mensajes directos.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count comunidades no están disponibles temporalmente debido a un mal funcionamiento del condensador de flujo.',
      one:
          '1 comunidad no está disponible temporalmente debido a un mal funcionamiento del condensador de flujo.',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel => 'Colapsar DMs en una carpeta';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'Cuando está activado, los DMs no leídos en la barra lateral de la comunidad se colapsan en una carpeta en el botón de Fluxer. Haz clic en el botón de Fluxer mientras estás en la página de DMs para expandir o colapsar la carpeta.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Lista de canales';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Controla el comportamiento del indicador de no leído para canales silenciados en las listas de canales.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Mostrar indicador de no leído en canales silenciados';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Cuando está activado, los canales silenciados muestran un indicador de no leído atenuado en el lado izquierdo. Las menciones aún aparecen independientemente de esta configuración.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Activos ahora';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Controla cómo se muestran los \'Activos ahora\' en la aplicación.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Mostrar \'Activos ahora\' en la pantalla de inicio';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Muestra \'Activos ahora\' en la pantalla de inicio para ver amigos activos en voz. Verás una vista previa, el contexto del canal, quién ya está allí y una forma rápida de unirte.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Favoritos';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Controla la visibilidad de los favoritos en toda la aplicación.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Habilitar Favoritos';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Cuando está activado, puedes marcar canales como favoritos y aparecerán en la sección de Favoritos. Cuando está desactivado, se ocultarán todos los elementos de la interfaz relacionados con favoritos (botones, elementos de menú). Tus favoritos existentes se conservarán.';

  @override
  String get favoritesTitle => 'Favoritos';

  @override
  String get favoritesEmptyTitle => 'Aún no hay favoritos';

  @override
  String get favoritesEmptyDescription =>
      'Marca canales desde la cabecera del chat para mantenerlos aquí.';

  @override
  String get favoritesWelcomeTitle => 'Bienvenido a Favoritos';

  @override
  String get favoritesWelcomeDescription =>
      'Tu espacio personal para acceder rápidamente a los canales, DMs y grupos que te encantan. Pulsa la estrella en cualquier canal para añadirlo aquí.';

  @override
  String get favoritesWelcomeTip =>
      '¿No es para ti? Desactívalo cuando quieras.';

  @override
  String get favoritesDisableButton => 'Desactivar favoritos';

  @override
  String get favoritesAddedToast => 'Añadido a Favoritos';

  @override
  String get favoritesRemovedToast => 'Eliminado de Favoritos';

  @override
  String get favoritesHiddenToast => 'Favoritos ocultos';

  @override
  String get favoritesMute => 'Silenciar favoritos';

  @override
  String get favoritesUnmute => 'Activar sonido de favoritos';

  @override
  String get favoritesHeaderMenu => 'Menú de favoritos';

  @override
  String get favoritesCreateCategory => 'Crear categoría';

  @override
  String get favoritesCategoryNameLabel => 'Nombre de la categoría';

  @override
  String get favoritesHideMutedChannels => 'Ocultar canales silenciados';

  @override
  String get favoritesShowMutedChannels => 'Mostrar canales silenciados';

  @override
  String get favoritesSetNickname => 'Establecer apodo';

  @override
  String get favoritesNicknameLabel => 'Apodo';

  @override
  String get favoritesSaveNickname => 'Guardar apodo';

  @override
  String get favoritesMoveToCategory => 'Mover a categoría';

  @override
  String get favoritesUncategorized => 'Sin categorizar';

  @override
  String get favoritesOtherCategory => 'Otro';

  @override
  String get favoritesRemoveFromFavorites => 'Eliminar de Favoritos';

  @override
  String get favoritesAddToFavorites => 'Añadir a Favoritos';

  @override
  String get favoritesHideConfirmTitle => 'Ocultar favoritos';

  @override
  String get favoritesHideConfirmDescription =>
      'Esto ocultará todos los elementos de la interfaz relacionados con favoritos, incluidos botones y elementos del menú. Tus favoritos actuales se conservarán y podrás volver a activarlos en cualquier momento desde Ajustes > Avanzado > Apariencia.';

  @override
  String get favoritesDirectMessageSubtitle => 'Mensaje Directo';

  @override
  String get messagesMediaDisplayGroupTitle => 'Visualización';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Controla cómo se muestran los mensajes, los medios y otro contenido.';

  @override
  String get messagesMediaMediaGroupTitle => 'Medios';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Personaliza las preferencias de tamaño de los medios y los botones.';

  @override
  String get messagesMediaInputGroupTitle => 'Entrada';

  @override
  String get messagesMediaInputGroupDescription =>
      'Personaliza la configuración de entrada de mensajes.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Barra lateral';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Configura cómo se muestra la barra lateral de la comunidad.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Ocultar canales silenciados por defecto';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Oculta automáticamente los canales silenciados en la barra lateral cuando te unes a nuevas comunidades';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      '¿Ocultar canales silenciados por defecto?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Las nuevas comunidades a las que te unas tendrán automáticamente los canales silenciados ocultos. ¿Quieres aplicar también esta configuración a todas tus comunidades existentes?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      '¿Dejar de ocultar canales silenciados por defecto?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Las nuevas comunidades a las que te unas ya no tendrán los canales silenciados ocultos automáticamente. ¿Quieres también mostrar los canales silenciados en todas tus comunidades existentes?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Aplicar a todas las comunidades';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Mostrar en todas las comunidades';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Solo comunidades nuevas';

  @override
  String get messagesMediaDisplaySectionTitle => 'Visualización de medios';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Controla cómo se muestran las imágenes, vídeos y otros medios. Todos los medios se redimensionan y convierten. Los archivos extremadamente grandes que no se puedan comprimir en una vista previa no se incrustarán independientemente de esta configuración.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Cuando se publican como enlaces al chat';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'Cuando se suben directamente a Fluxer';

  @override
  String get messagesMediaLinkPreviewsSectionTitle =>
      'Vistas previas de enlaces';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Controla cómo se previsualizan los enlaces de sitios web en el chat';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Mostrar incrustaciones y previsualizar enlaces de sitios web';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reacciones';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Configurar reacciones de emoji en los mensajes';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Mostrar reacciones de emoji en los mensajes';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Contenido oculto';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Controlar cómo se muestra el contenido oculto';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Mostrar contenido oculto';

  @override
  String get messagesMediaSpoilersOnClickName => 'Al hacer clic';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Mostrar contenido oculto al hacer clic';

  @override
  String get messagesMediaSpoilersIfModeratorName => 'En canales que modero';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Mostrar siempre el contenido oculto en los canales donde tengas el permiso \"Gestionar mensajes\"';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Siempre';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Mostrar siempre el contenido oculto';

  @override
  String get messagesMediaSizeSectionTitle =>
      'Preferencias de tamaño de medios';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Personaliza el tamaño máximo de visualización de los medios incrustados y adjuntos. Los tamaños más pequeños usan menos espacio en pantalla, mientras que los más grandes muestran más detalles.';

  @override
  String get messagesMediaSizeEmbedLabel =>
      'Medios de enlaces (incrustaciones)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Archivos adjuntos subidos';

  @override
  String get messagesMediaSizeCompactName => 'Compacto (400x300)';

  @override
  String get messagesMediaSizeCompactDescription =>
      'Tamaño de medio más pequeño';

  @override
  String get messagesMediaSizeComfortableName => 'Cómodo (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Tamaño de medio más grande con más detalles';

  @override
  String get messagesMediaGifsSectionTitle => 'Comportamiento de los GIF';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Controlar cómo se insertan los GIF en el chat';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Enviar GIF automáticamente al seleccionarlos';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Autocompletar expresiones (autocompletar con dos puntos)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Controla lo que aparece en el autocompletado de expresiones al escribir dos puntos. Personaliza qué sugerencias aparecen para que coincidan con tus preferencias.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Mostrar emojis predeterminados en el autocompletado de expresiones';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Mostrar emojis personalizados en el autocompletado de expresiones';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Mostrar pegatinas en el autocompletado de expresiones';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Mostrar medios guardados en el autocompletado de expresiones';

  @override
  String get messagesMediaEditingSectionTitle => 'Edición de mensajes';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Controla qué sucede con tu borrador de edición al cancelarlo.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Conservar borrador de edición al cancelar';

  @override
  String get accessibilitySaturationTitle => 'Saturation';

  @override
  String get accessibilitySaturationDescription =>
      'Adjust how vivid theme colors appear across the app.';

  @override
  String get accessibilityUnreadGroupTitle => 'Indicadores de no leídos';

  @override
  String get accessibilityUnreadGroupDescription =>
      'Controlar cómo se muestran los indicadores de mensajes no leídos.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'Mostrar indicador de no leídos atenuado en canales silenciados';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'Mostrar un indicador de no leídos atenuado junto a mensajes directos y canales silenciados para que aún puedas ver de un vistazo cuándo hay actividad.';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'Vistas previas de mensajes de MD';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Controlar cuándo se muestran las vistas previas de mensajes en la lista de MD.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Modo de vista previa de mensajes de MD';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Todos los mensajes';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Mostrar vistas previas de mensajes para todas las conversaciones de MD';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName => 'Solo MD sin leer';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Mostrar solo vistas previas de mensajes para MD con mensajes sin leer';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Ninguno';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'No mostrar vistas previas de mensajes en la lista de MD';

  @override
  String get dmListSentAnAttachment => 'Envió un archivo adjunto';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username fijó un mensaje en este canal.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username añadió a $userName al grupo.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username añadió a alguien al grupo.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username ha abandonado el grupo.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username eliminó a $userName del grupo.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username eliminó a alguien del grupo.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username cambió el nombre del canal a $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username cambió el nombre del canal.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username cambió el icono del canal.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username inició una llamada.';
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
  String get voiceConnectionConfirmTitle => 'Confirmación de conexión de voz';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Ya estás conectado a este canal de voz desde $count dispositivos más. ¿Qué quieres hacer?',
      one:
          'Ya estás conectado a este canal de voz desde 1 dispositivo más. ¿Qué quieres hacer?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Cambiar a este dispositivo';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Unirme (mantener otras conexiones)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'No hacer nada, no quiero unirme';

  @override
  String get voiceChannelEmptyDescription =>
      'Este es un canal de voz. ¡Conéctate para empezar a hablar!';

  @override
  String get voiceChannelJoin => 'Unirse al canal de voz';

  @override
  String get voiceChannelJoinConnect => 'Conectar a voz';

  @override
  String get voiceChannelNoConnectPermission =>
      'No tienes permiso para unirte a este canal de voz';

  @override
  String get voiceChannelE2eeEncrypted =>
      'El micrófono, la cámara y el contenido compartido de pantalla están cifrados de extremo a extremo.';

  @override
  String get voiceCallE2eeEncrypted =>
      'El micrófono, la cámara y el contenido compartido de pantalla están cifrados de extremo a extremo.';

  @override
  String get voiceChannelE2eeBroken =>
      'El cifrado de extremo a extremo no está disponible porque hay un participante no compatible en este canal de voz.';

  @override
  String get voiceCallE2eeBroken =>
      'El cifrado de extremo a extremo no está disponible porque hay un participante no compatible en esta llamada.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Este cliente debe actualizarse antes de unirse a esta llamada cifrada.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'No se pudo iniciar tu micrófono. Sigues en la llamada.';

  @override
  String get voiceChannelStatusConnecting => 'Conectando…';

  @override
  String get voiceChannelStatusConnected => 'Conectado';

  @override
  String get voiceChannelStatusError => 'Error';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Dispositivo móvil';

  @override
  String get voiceParticipantTooltipDesktopDevice =>
      'Dispositivo de escritorio';

  @override
  String get voiceParticipantTooltipCommunityMuted =>
      'Silenciado por la comunidad';

  @override
  String get voiceParticipantTooltipMuted => 'Silenciado';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Enmudecido por la comunidad';

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
  String get voiceChannelLeave => 'Salir';

  @override
  String get voiceControlMute => 'Silenciar';

  @override
  String get voiceControlUnmute => 'Activar sonido';

  @override
  String get voiceControlDeafen => 'Enmudecer';

  @override
  String get voiceControlUndeafen => 'Des-enmudecer';

  @override
  String get voiceControlVideo => 'Vídeo';

  @override
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'Compartir pantalla';

  @override
  String get voiceScreenShareNotificationText => 'Compartiendo tu pantalla.';

  @override
  String get voiceControlMore => 'Más';

  @override
  String get voiceControlDisconnect => 'Desconectar';

  @override
  String get voiceControlChat => 'Chat';

  @override
  String get voiceTextChatShow => 'Mostrar chat';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# mensajes sin leer',
      one: '1 mensaje sin leer',
    );
    return 'Mostrar chat con $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Se requiere permiso de cámara para el vídeo.';

  @override
  String get voiceErrorScreenShareToggle =>
      'No se pudo iniciar el uso compartido de pantalla. Inténtalo de nuevo.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Se denegó el permiso para compartir pantalla.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'El uso compartido de pantalla no está disponible en este dispositivo.';

  @override
  String get voiceWatchStream => 'Ver transmisión';

  @override
  String get voiceStopWatching => 'Dejar de ver';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Dejar de ver la transmisión actual';

  @override
  String get voiceOwnScreenShareTitle => 'Estás transmitiendo';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Tu transmisión está en directo para los participantes.';

  @override
  String get voiceLiveBadge => 'En directo';

  @override
  String get dmVoiceViewCall => 'Ver llamada';

  @override
  String get dmVoiceCallFullScreen => 'Pantalla completa';

  @override
  String get dmVoiceCallFullScreenTooltip =>
      'Abrir llamada en pantalla completa';

  @override
  String get dmVoiceStripStatusConnecting => 'Conectando...';

  @override
  String get dmVoiceStripStatusInCall => 'En llamada';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Llamada de voz';

  @override
  String get dmVoiceCallBarConnecting => 'Conectando...';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Llamada directa';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Llamada grupal';

  @override
  String get dmVoiceCallBarIssueFallback => 'Problema de voz';

  @override
  String get dmVoiceFullscreenTitle => 'Voz';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Voz conectada';

  @override
  String get notificationsPageTitle => 'Notificaciones';

  @override
  String get notificationsFilterUnreads => 'No leídas';

  @override
  String get notificationsFilterMentions => 'Menciones';

  @override
  String get notificationsBookmarksTooltip => 'Marcadores';

  @override
  String get notificationsMentionFilterTooltip => 'Filtrar menciones';

  @override
  String get notificationsMentionFiltersTitle => 'Filtros de menciones';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Incluir menciones de @everyone y @here';

  @override
  String get notificationsMentionIncludeRoles => 'Incluir menciones de roles';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Incluir todas las menciones de comunidades';

  @override
  String get notificationsNoUnreadTitle => 'Sin mensajes sin leer';

  @override
  String get notificationsNoUnreadBody => 'Estás al día.';

  @override
  String get notificationsNoMentionsTitle => 'Sin menciones recientes';

  @override
  String get notificationsNoMentionsBody =>
      'Todas las @menciones tuyas aparecerán aquí durante 7 días.';

  @override
  String get notificationsMentionsEndTitle => 'Has llegado al final';

  @override
  String get notificationsMentionsEndBody =>
      'Has visto todas tus menciones recientes. No te preocupes, pronto aparecerán más aquí.';

  @override
  String get notificationsJump => 'Ir';

  @override
  String get notificationsRemoveMentionTooltip => 'Eliminar mención';

  @override
  String get notificationsViewAllUnread => 'Ver todas las no leídas';

  @override
  String get notificationsMarkAsRead => 'Marcar como leído';

  @override
  String get notificationsExpand => 'Expandir';

  @override
  String get notificationsCollapse => 'Contraer';

  @override
  String get notificationsMessageUnavailable =>
      'No se ha podido cargar este mensaje.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining caracteres restantes';
  }

  @override
  String get characterCounterTooLong => 'El mensaje es demasiado largo';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining caracteres restantes. Obtén $productName para escribir hasta $premiumMaxLength caracteres.';
  }

  @override
  String get chatMessageFailedToSend => 'Error al enviar el mensaje';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'No se ha podido entregar tu mensaje. Normalmente esto se debe a que no compartes una comunidad con el destinatario o este solo acepta mensajes directos de amigos. Es posible que también necesites ajustar tu propia configuración de privacidad de mensajes directos en $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'No se ha podido entregar tu mensaje. Necesitas reclamar tu cuenta para enviar mensajes directos.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'No se ha podido entregar tu mensaje. Necesitas reclamar tu cuenta para enviar mensajes.';

  @override
  String get chatSendFailureContentBlocked =>
      'No se ha podido entregar tu mensaje porque ha sido marcado por nuestros sistemas de seguridad. Si crees que esto es un error, ponte en contacto con soporte.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'No se ha podido entregar tu mensaje porque contiene emojis o pegatinas para adultos que no están permitidos en este contexto.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'Solo tú puedes ver este mensaje.';

  @override
  String get chatClientSystemDismiss => 'Descartar';

  @override
  String get privacyDashboardCommunicationSection => 'Comunicación';

  @override
  String get chatMessageDeleteFailed => 'Error al eliminar mensaje';

  @override
  String get chatMessageAddReaction => 'Añadir reacción';

  @override
  String get chatMessageEdit => 'Editar mensaje';

  @override
  String get chatMessageReply => 'Responder';

  @override
  String get chatMessageForward => 'Reenviar';

  @override
  String get forwardMessageTitle => 'Reenviar mensaje';

  @override
  String get forwardSearchHint => 'Buscar canales o MD';

  @override
  String get forwardDirectMessagesSection => 'Mensajes directos';

  @override
  String get forwardCommentHint => 'Añadir un comentario (opcional)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Enviar ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'No se encontraron canales';

  @override
  String get forwardSuccessToast => 'Mensaje reenviado';

  @override
  String get forwardFailed => 'Error al reenviar mensaje';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Los comentarios no están disponibles porque un canal seleccionado tiene el modo lento activado.';

  @override
  String get forwardDestinationNoSendPermission =>
      'No puedes enviar mensajes aquí';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'No puedes incrustar enlaces aquí';

  @override
  String get forwardDestinationNoAttachPermission =>
      'No puedes adjuntar archivos aquí';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'El envío de mensajes está desactivado en esta comunidad';

  @override
  String get forwardDestinationTimedOut =>
      'Tienes un tiempo de espera en esta comunidad';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Modo lento: espera $remaining';
  }

  @override
  String get chatMessageCopyText => 'Copiar mensaje';

  @override
  String get chatMessagePin => 'Fijar mensaje';

  @override
  String get chatMessageUnpin => 'Desfijar mensaje';

  @override
  String get chatMessageUnpinIt => 'Desfijar';

  @override
  String get chatMessageBookmark => 'Guardar mensaje';

  @override
  String get chatMessageRemoveBookmark => 'Eliminar guardado';

  @override
  String get chatMessageMarkAsUnread => 'Marcar como no leído';

  @override
  String get chatMessageCopyMessageLink => 'Copiar enlace del mensaje';

  @override
  String get chatMessageCopyMessageId => 'Copiar ID del mensaje';

  @override
  String get chatMessageViewReactions => 'Ver reacciones';

  @override
  String get chatMessageRemoveAllReactions => 'Eliminar todas las reacciones';

  @override
  String get chatMessageDebug => 'Depurar mensaje';

  @override
  String get chatMessageDebugSheetTitle => 'Mensaje de depuración';

  @override
  String get chatMessageDebugCopyJson => 'Copiar JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'JSON del mensaje copiado al portapapeles';

  @override
  String get chatReactionsSheetTitle => 'Reacciones';

  @override
  String get chatReactionsSheetEmpty => 'Nadie ha reaccionado todavía.';

  @override
  String get chatMessageReport => 'Informar sobre el mensaje';

  @override
  String get iarReportMessageTitle => 'Informar sobre el mensaje';

  @override
  String get iarThisUserFallback => 'este usuario';

  @override
  String get iarModalDescription =>
      'Informa sobre una infracción de norma o encuentra herramientas para gestionar contactos y preferencias.';

  @override
  String get iarPathStepAriaLabel => '¿Qué necesitas?';

  @override
  String get iarCategoryStepTitle => '¿Qué tipo de norma se infringió?';

  @override
  String get iarReasonStepTitle => '¿Qué norma se infringió?';

  @override
  String get iarReasonSelectHint => 'Selecciona una razón';

  @override
  String get iarPickAnOptionToast => 'Selecciona una opción para continuar.';

  @override
  String get iarPickARuleToast => 'Selecciona la norma que se infringió.';

  @override
  String get iarPathPlatform =>
      'Informar sobre una infracción de norma de la plataforma';

  @override
  String get iarPathCommunity => 'Informar a los moderadores de esta comunidad';

  @override
  String get iarPathPreferenceMessage => 'No me gusta este contenido';

  @override
  String get iarCategoryTargetedHarmLabel => 'Amenazas, acoso o daño';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Acoso, odio, violencia, asaltos o contenido que promueve el autolesionismo.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Seguridad infantil o contenido para adultos';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Menores en riesgo, contenido para adultos en el lugar equivocado o conducta no deseada.';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'Privacidad o suplantación de identidad';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxing, acecho, hacerse pasar por otra persona o un perfil inapropiado.';

  @override
  String get iarCategoryDeceptionLabel => 'Estafas, malware o desinformación';

  @override
  String get iarCategoryDeceptionDescription =>
      'Phishing, fraude, enlaces maliciosos o afirmaciones falsas que probablemente causen daño en el mundo real.';

  @override
  String get iarCategoryIllegalOtherLabel => 'Actividad ilegal o algo más';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Ventas ilegales, facilitación criminal o una clara infracción de las normas que no encaja en las anteriores.';

  @override
  String get iarReasonHarassmentLabel => 'Acoso o amenazas';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Acoso, contacto no deseado repetido, acecho o abuso dirigido.';

  @override
  String get iarReasonHateLabel => 'Discurso de odio';

  @override
  String get iarReasonHateMessageDescription =>
      'Insultos, lenguaje deshumanizador o ataques a grupos protegidos.';

  @override
  String get iarReasonViolenceLabel => 'Violencia o amenazas violentas';

  @override
  String get iarReasonViolenceDescription =>
      'Amenazas creíbles, violencia gráfica o glorificación de la violencia.';

  @override
  String get iarReasonMatureContentLabel => 'Contenido para adultos o acoso';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Conducta no deseada o contenido para adultos en el lugar equivocado.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Seguridad infantil o explotación de menores';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Contenido de captación o explotación infantil.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Desinformación perjudicial';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Afirmaciones falsas que probablemente causen daño en el mundo real.';

  @override
  String get iarReasonSpamLabel => 'Spam, estafas o phishing';

  @override
  String get iarReasonSpamMessageDescription =>
      'Spam masivo, fraude, sorteos falsos o abuso de cuentas.';

  @override
  String get iarReasonMalwareLabel => 'Malware o enlaces peligrosos';

  @override
  String get iarReasonMalwareDescription =>
      'Malware, robo de credenciales o archivos dañinos.';

  @override
  String get iarReasonPrivacyLabel => 'Violación de la privacidad';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxing, información privada expuesta o acecho.';

  @override
  String get iarReasonImpersonationLabel =>
      'Suplantación de identidad o medios engañosos';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Hacerse pasar por otra persona, incluido contenido generado por IA de forma engañosa.';

  @override
  String get iarReasonIllegalLabel => 'Actividad ilegal';

  @override
  String get iarReasonIllegalDescription =>
      'Ventas ilegales, facilitación criminal o actividad ilícita.';

  @override
  String get iarReasonSelfHarmLabel => 'Autolesiones o suicidio';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Promoción o instrucciones que incitan a autolesiones o trastornos alimentarios.';

  @override
  String get iarReasonOtherLabel => 'Otra infracción clara de las normas';

  @override
  String get iarReasonOtherDescription =>
      'Úsalo solo si infringe claramente las normas de Fluxer y no encaja en las anteriores.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Si hay un menor involucrado, usa \"$childSafetyReason\" en su lugar.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Si esto involucra CSAM o explotación de un menor, envíalo ahora y no vuelvas a compartir el material.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Si alguien puede estar en peligro inmediato, contacta con los servicios de emergencia locales si puedes hacerlo de forma segura.';

  @override
  String get iarSafetyNoteViolence =>
      'Si se trata de una amenaza inminente creíble, contacta también con los servicios de emergencia locales.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Si se trata de una amenaza terrorista inminente, contacta también con los servicios de emergencia locales.';

  @override
  String get iarActionBlockUserTitle => 'Bloquear a este usuario';

  @override
  String get iarActionBlockUserDescription =>
      'Detener mensajes y solicitudes de amistad.';

  @override
  String get iarActionBlockUserButton => 'Bloquear';

  @override
  String get iarActionCopyMessageLinkTitle => 'Copiar enlace del mensaje';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Compartir con los moderadores de la comunidad.';

  @override
  String get iarActionCopyMessageLinkButton => 'Copiar';

  @override
  String get iarActionCloseDmTitle => 'Cerrar este DM';

  @override
  String get iarActionCloseDmDescription =>
      'No bloquea. Puedes reabrirlo más tarde.';

  @override
  String get iarActionCloseDmButton => 'Cerrar MP';

  @override
  String get iarActionLeaveCommunityTitle => 'Abandonar la comunidad';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Deja de ver su contenido y miembros.';

  @override
  String get iarActionLeaveCommunityButton => 'Abandonar';

  @override
  String get iarActionDmSettingsTitle =>
      'Ajustes de MP y solicitudes de amistad';

  @override
  String get iarActionDmSettingsDescription =>
      'Cambia quién puede contactarte.';

  @override
  String get iarActionCallSettingsTitle =>
      'Ajustes de llamadas y chats grupales';

  @override
  String get iarActionCallSettingsDescription =>
      'Cambia quién puede llamarte o añadirte.';

  @override
  String get iarActionOpenButton => 'Abrir';

  @override
  String get iarActionDeleteMessageTitle => 'Eliminar este mensaje';

  @override
  String get iarActionDeleteMessageDescription =>
      'Elimínalo del canal para todos.';

  @override
  String get iarActionDeleteMessageButton => 'Eliminar';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Eliminado';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Este mensaje ya ha sido eliminado.';

  @override
  String get iarActionBanUserTitle => 'Expulsar a este usuario';

  @override
  String get iarActionBanUserDescription =>
      'Abre el diálogo de expulsión para esta comunidad.';

  @override
  String get iarActionBanUserButton => 'Expulsar';

  @override
  String get iarActionBanUserBannedButton => 'Expulsado';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Este usuario ya ha sido expulsado de la comunidad.';

  @override
  String get iarCloseDmConfirmTitle => 'Cerrar MP';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Cierra tu MP actual con $name. Esto no te bloquea; puedes reabrirlo más tarde.';
  }

  @override
  String get iarSuccessTitle => 'Informe enviado';

  @override
  String get iarSuccessBody =>
      'Nuestro equipo de seguridad lo está revisando. Te enviaremos un MP y un correo electrónico una vez que hayamos llegado a un veredicto.';

  @override
  String get iarAlreadyReportedTitle => 'Ya informado';

  @override
  String get iarAlreadyReportedBody =>
      'Ya has informado de este mensaje. Nuestro equipo de seguridad lo está revisando.';

  @override
  String get iarBackButton => 'Atrás';

  @override
  String get iarContinueButton => 'Continuar';

  @override
  String get iarSendReportButton => 'Enviar informe';

  @override
  String get iarDoneButton => 'Hecho';

  @override
  String get iarCouldntSendToast =>
      'No se pudo enviar el informe. Inténtalo de nuevo.';

  @override
  String get iarRateLimitedToast =>
      'Estás informando demasiado rápido. Espera un momento e inténtalo de nuevo.';

  @override
  String get iarReportSentToast =>
      'Informe enviado. Nuestro equipo de seguridad lo revisará.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return '¿Bloquear a $name? No podrá enviarte mensajes ni solicitudes de amistad. Puedes desbloquearlo más tarde.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'No se pudo bloquear a este usuario. Inténtalo de nuevo.';

  @override
  String get iarCloseDmSuccessToast => 'MP cerrado.';

  @override
  String get iarCloseDmFailedToast =>
      'No se pudo cerrar este MP. Inténtalo de nuevo.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'No se pudo abandonar esta comunidad. Inténtalo de nuevo.';

  @override
  String get chatMessageSuppressEmbeds => 'Suprimir previsualizaciones';

  @override
  String get chatMessageUnsuppressEmbeds => 'Restablecer previsualizaciones';

  @override
  String get chatMessageDelete => 'Eliminar mensaje';

  @override
  String get chatMessageDeleteConfirmTitle => 'Eliminar mensaje';

  @override
  String get chatMessageDeleteConfirmDescription =>
      '¿Estás seguro de que quieres eliminar este mensaje?';

  @override
  String get chatMessageMore => 'Más';

  @override
  String get chatEditingMessage => 'Editando mensaje';

  @override
  String get chatReplyOriginalDeleted => 'El mensaje original fue eliminado';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'No se pudo cargar el mensaje original';

  @override
  String get chatReplyAttachedMedia =>
      'El mensaje contiene contenido multimedia adjunto';

  @override
  String get chatMessagesLoadError => 'No se pudieron cargar los mensajes.';

  @override
  String get chatReplyMentionOverrideTitle => '¿Anular preferencia de mención?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname prefiere ser @mencionado en las respuestas. ¿Enviar sin la mención de todos modos?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname prefiere que las respuestas no incluyan una mención. ¿Enviar con la mención de todos modos?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ignorar preferencia';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Haz clic para desactivar la notificación al usuario al que respondes.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Haz clic para activar la notificación al usuario al que respondes.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Mencionar al usuario respondido';

  @override
  String get chatReplyMentionOn => 'Activado';

  @override
  String get chatReplyMentionOff => 'Desactivado';

  @override
  String get chatReplyCancel => 'Cancelar respuesta';

  @override
  String get chatEditMessageHint => 'Editar mensaje';

  @override
  String get chatEditNoChanges => 'No hay cambios que guardar';

  @override
  String get chatChannelNotReady =>
      'Este canal aún no está listo. Inténtalo de nuevo en un momento.';

  @override
  String get chatMessageEdited => '(editado)';

  @override
  String get chatMessageSilent => 'Este fue un mensaje @silent.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Hoy a las $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Ayer a las $time';
  }

  @override
  String get mediaViewerImagePreview => 'Vista previa de la imagen';

  @override
  String get mediaViewerClose => 'Cerrar visor de medios';

  @override
  String get mediaViewerOpenInBrowser => 'Abrir en el navegador';

  @override
  String get mediaViewerForward => 'Reenviar';

  @override
  String get mediaViewerZoomIn => 'Acercar';

  @override
  String get mediaViewerZoomOut => 'Alejar';

  @override
  String get mediaViewerPreviousAttachment => 'Archivo adjunto anterior';

  @override
  String get mediaViewerNextAttachment => 'Archivo adjunto siguiente';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String get chatAttachmentVideoToggleControls =>
      'Mostrar u ocultar controles del vídeo';

  @override
  String get chatAttachmentVideoMute => 'Silenciar vídeo';

  @override
  String get chatAttachmentVideoUnmute => 'Activar sonido del vídeo';

  @override
  String get chatAttachmentVideoPlay => 'Reproducir vídeo';

  @override
  String get chatAttachmentVideoPause => 'Pausar vídeo';

  @override
  String get chatAttachmentVideoProgress => 'Progreso del vídeo';

  @override
  String get chatVideoPlaybackFailed =>
      'No se ha podido reproducir este vídeo.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Notificar a los usuarios con este rol que tengan permiso para ver este canal.';

  @override
  String get addGuildModalTitle => 'Añadir una comunidad';

  @override
  String get addGuildModalLandingDescription =>
      'Crea una comunidad nueva o únete a una existente.';

  @override
  String get addGuildCreateCommunity => 'Crear comunidad';

  @override
  String get addGuildJoinCommunity => 'Unirse a la comunidad';

  @override
  String get addGuildImportDiscordTemplate => 'Importar plantilla de Discord';

  @override
  String get addGuildJoinTitle => 'Unirse a una comunidad';

  @override
  String get addGuildJoinDescription =>
      'Introduce el enlace de invitación para unirte a una comunidad.';

  @override
  String get addGuildInviteLinkLabel => 'Enlace de invitación';

  @override
  String get addGuildJoinSubmit => 'Unirse a la comunidad';

  @override
  String get addGuildInviteInvalid =>
      'Esta invitación no es válida o ha caducado.';

  @override
  String get addGuildJoinFailed =>
      'No se ha podido unir a la comunidad. Inténtalo de nuevo.';

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
      'Eliminar todas las reacciones';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      '¿Seguro que quieres eliminar todas las reacciones de este mensaje?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Desanclar mensaje';

  @override
  String get chatMessageUnpinConfirmDescription =>
      '¿Enviar este pin de vuelta al pasado?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return ' $username ha fijado $messageLink en este canal. Ver $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'un mensaje';

  @override
  String get systemPinMessageAllPinsLink => 'todos los mensajes fijados';

  @override
  String get channelPinsEmptyTitle => 'No hay mensajes fijados';

  @override
  String get channelPinsEmptyDescription =>
      'Aquí aparecerán los mensajes fijados.';

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
  String get personalNotesTitle => 'Notas personales';

  @override
  String get personalNotesSubtitle =>
      'Tu espacio privado para pensamientos y recordatorios';

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
    return 'Bienvenido a $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'Al principio, no había nada. Luego, llegó $channelName. Y estuvo bien.';
  }

  @override
  String get personalNotesComposerHint => 'Envíate un mensaje';

  @override
  String get personalNotesPrivateSpace => 'Tu espacio privado';

  @override
  String get purgePersonalNotes => 'Purgar notas personales';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Esto eliminará permanentemente todos los mensajes y archivos adjuntos de tus notas personales. No se puede deshacer.';

  @override
  String get purgePersonalNotesConfirmButton => 'Purgar';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Se han purgado $count mensajes de las notas personales';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Las notas personales ya estaban vacías';

  @override
  String get purgePersonalNotesFailed =>
      'No se pudieron borrar las notas personales';

  @override
  String get userSettingsGroupYourAccount => 'TU CUENTA';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'Perfil';

  @override
  String get userSettingsNavSecurityLogin => 'Seguridad e inicio de sesión';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Regalos y códigos';

  @override
  String get userSettingsNavExpressionPacks => 'Packs de expresiones';

  @override
  String get userSettingsNavPrivacyDashboard => 'Panel de privacidad';

  @override
  String get userSettingsNavAuthorizedApps => 'Aplicaciones autorizadas';

  @override
  String get userSettingsNavBlockedUsers => 'Usuarios bloqueados';

  @override
  String get userSettingsNavLinkedDevices => 'Dispositivos vinculados';

  @override
  String get userSettingsNavConnections => 'Conexiones';

  @override
  String get userSettingsNavLookAndFeel => 'Aspecto';

  @override
  String get userSettingsNavAccessibility => 'Accesibilidad';

  @override
  String get userSettingsNavMessagesAndMedia =>
      'Mensajes y contenido multimedia';

  @override
  String get userSettingsNavAudioAndVideo => 'Audio y vídeo';

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
  String get userSettingsNavSoundsAndAlerts => 'Sonidos y alertas';

  @override
  String get userSettingsNavLanguageAndTime => 'Idioma y hora';

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
  String get advancedPerformanceReportingTitle => 'Informes de rendimiento';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Ayuda a mejorar Fluxer compartiendo datos anónimos de rendimiento y fallos.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Enviar informes de fallos y rendimiento';

  @override
  String get advancedPerformanceReportingDescription =>
      'Todos los datos notificados son anónimos y solo se envían al propio servicio de monitorización de Fluxer; no se utilizan proveedores de terceros.';

  @override
  String get userSettingsNavApplications => 'Aplicaciones';

  @override
  String get userSettingsNavAppLogs => 'Registros de la aplicación';

  @override
  String get userSettingsNavDeveloperTools => 'Herramientas de desarrollador';

  @override
  String get userSettingsNavLimitsConfig => 'Configuración de límites';

  @override
  String get userSettingsNavFeatureFlags => 'Indicadores de funciones';

  @override
  String get userSettingsNavWhatsNew => 'Novedades';

  @override
  String get userSettingsNavLogOut => 'Cerrar sesión';

  @override
  String get betaWarningTitle => 'Software beta';

  @override
  String get betaWarningMessage =>
      'Esto es software beta. Aún no todo está terminado o añadido.';

  @override
  String get betaWarningReportIssues =>
      'Por favor, informa de cualquier problema que encuentres a la comunidad de Fluxer Mobile (actualmente, debes tener Plutonium para poder unirte a la comunidad).';

  @override
  String get betaWarningRepoLink => 'Ver código fuente en GitHub';

  @override
  String get betaWarningGotIt => 'Entendido';

  @override
  String get quickSwitcherTabSearch => 'Buscar';

  @override
  String get quickSwitcherTabFriends => 'Amigos';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Busca canales, personas o comunidades';

  @override
  String get quickSwitcherSearchFriends => 'Busca amigos';

  @override
  String get quickSwitcherNoMatchesFound =>
      'No se han encontrado coincidencias';

  @override
  String get quickSwitcherEmptyHint =>
      'Prueba con un nombre diferente o usa los prefijos @ / # / ! / * para filtrar los resultados.';

  @override
  String get quickSwitcherSectionPeople => 'Personas';

  @override
  String get quickSwitcherSectionGroupMessages => 'Mensajes de grupo';

  @override
  String get quickSwitcherSectionTextChannels => 'Canales de texto';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Canales de voz';

  @override
  String get quickSwitcherSectionCommunities => 'Comunidades';

  @override
  String get quickSwitcherSectionSettings => 'Ajustes';

  @override
  String get quickSwitcherHomeLabel => 'Inicio';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Mensajes directos';

  @override
  String get quickSwitcherFavoritesLabel => 'Favoritos';

  @override
  String get quickSwitcherUserSettingsLabel => 'Ajustes de usuario';

  @override
  String get quickSwitcherNotificationsLabel => 'Notificaciones';

  @override
  String get quickSwitcherBookmarksLabel => 'Marcadores';

  @override
  String get quickSwitcherMentionsLabel => 'Menciones';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Aún no tienes amigos';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Añade un amigo para empezar.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Ningún amigo coincide con la búsqueda';

  @override
  String get quickSwitcherFriendsNoMatchHint =>
      'Prueba con un nombre diferente.';

  @override
  String get quickSwitcherSearchAliasUser => 'Usuario';

  @override
  String get quickSwitcherSearchAliasYou => 'Tú';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'MD';

  @override
  String get quickSwitcherSearchAliasMessages => 'Mensajes';

  @override
  String get quickSwitcherSearchAliasFav => 'Favoritos';

  @override
  String get quickSwitcherSearchAliasStarred => 'Destacados';

  @override
  String get quickSwitcherSearchAliasInbox => 'Bandeja de entrada';

  @override
  String get quickSwitcherSearchAliasSaved => 'Guardados';

  @override
  String get uiClose => 'Cerrar';

  @override
  String get chatJumpToBottom => 'Saltar al final';

  @override
  String get uiConfirm => 'Confirmar';

  @override
  String get uiLoading => 'Cargando';

  @override
  String get uiUnsavedChanges => 'Cambios sin guardar';

  @override
  String get uiReset => 'Restablecer';

  @override
  String get uiOpenColorPicker => 'Abrir selector de color';

  @override
  String get uiSelectPlaceholder => 'Seleccionar';

  @override
  String get uiSearchPlaceholder => 'Buscar';

  @override
  String get uiNoOptionsFound => 'No se encontraron opciones';

  @override
  String get uiDismissNotification => 'Descartar notificación';

  @override
  String get uiColorPickerTitle => 'Selector de color';

  @override
  String get mentionConfirmTitle => '¿Mencionar a todos?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Esto notificará a $count miembros. ¿Continuar?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Esto notificará a $count miembros en línea. ¿Continuar?';
  }

  @override
  String get mentionConfirmButton => 'Mencionar';

  @override
  String get composerEmojiUnavailable => 'No puedes usar este emoji aquí.';

  @override
  String get instanceUrlLabel => 'URL de la instancia';

  @override
  String get instanceUrlPlaceholder =>
      'Introduce la URL de la instancia (p. ej., fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Restablecer a Fluxer';

  @override
  String get instanceConnect => 'Conectar';

  @override
  String get instanceConnecting => 'Conectando…';

  @override
  String get instanceConnectFailed => 'No se ha podido conectar a la instancia';

  @override
  String get recentInstances => 'Instancias recientes';

  @override
  String removeRecentInstance(String domain) {
    return 'Eliminar $domain de las instancias recientes';
  }

  @override
  String get instanceSheetTitle => 'Conectar a la instancia';

  @override
  String get connectToDifferentInstance => 'Conectar a una instancia diferente';

  @override
  String get changeInstance => 'Cambiar';

  @override
  String get instanceConnectionRequired =>
      'Conéctate a la instancia para iniciar sesión';

  @override
  String get comingSoon => 'Próximamente';

  @override
  String get guildNavbarDirectMessages => 'Mensajes directos';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Explorar comunidades descubribles';

  @override
  String get discoveryExplore => 'Explorar';

  @override
  String get discoveryExplorePublicCommunities =>
      'Explorar comunidades públicas';

  @override
  String get discoveryListingSubheading =>
      '¿Quieres que tu comunidad aparezca aquí? Solicítalo si cumples los requisitos en los ajustes de tu comunidad > Descubrimiento.';

  @override
  String get discoverySearchCommunities => 'Buscar comunidades';

  @override
  String get discoveryFilterByLanguage => 'Filtrar por idioma';

  @override
  String get discoveryAllLanguages => 'Todos los idiomas';

  @override
  String get discoveryAllCategories => 'Todas';

  @override
  String get discoveryCategoryGaming => 'Videojuegos';

  @override
  String get discoveryCategoryMusic => 'Música';

  @override
  String get discoveryCategoryEntertainment => 'Entretenimiento';

  @override
  String get discoveryCategoryEducation => 'Educación';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Ciencia y tecnología';

  @override
  String get discoveryCategoryContentCreator => 'Creador de contenido';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime y manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Películas y TV';

  @override
  String get discoveryCategoryOther => 'Otros';

  @override
  String get discoveryNoCommunitiesMatch => 'No hay comunidades que coincidan.';

  @override
  String get discoveryJoinCommunity => 'Unirse a la comunidad';

  @override
  String get discoveryJoined => 'Unido';

  @override
  String discoveryOnlineCount(String count) {
    return '$count en línea';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString miembros',
      one: '1 miembro',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Sin descripción.';

  @override
  String get discoveryCommunities => 'Comunidades';

  @override
  String get discoveryApps => 'Aplicaciones';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'No se ha podido unir a esta comunidad';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Algo ha ido mal. Inténtalo de nuevo en un momento.';

  @override
  String get discoveryJoinErrorFullTitle => 'Esta comunidad está llena';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Esta comunidad ha alcanzado su límite de miembros, por lo que no puedes unirte ahora mismo.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Has alcanzado el límite de comunidades';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Estás en el número máximo de comunidades. Abandona una e inténtalo de nuevo.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'No puedes unirte a esta comunidad';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Has sido expulsado de esta comunidad.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Esta comunidad ya no está disponible';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Es posible que haya salido del descubrimiento o haya desactivado las nuevas incorporaciones. Actualiza la página y no la volverás a ver.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Vas demasiado rápido';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Espera un momento e inténtalo de nuevo.';

  @override
  String get guildNavbarAddCommunity => 'Añadir una comunidad';

  @override
  String get guildNavbarHelp => 'Ayuda';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'NUEVO MENSAJE';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Contraer $folderName';
  }

  @override
  String get guildNavbarGroupDm => 'DM de grupo';

  @override
  String get guildNavbarCreateChannel => 'Crear canal';

  @override
  String get guildNavbarChannelType => 'Tipo de canal';

  @override
  String get guildNavbarTextChannel => 'Canal de texto';

  @override
  String get guildNavbarTextChannelDescription =>
      'Enviar mensajes, imágenes, GIFs y emojis';

  @override
  String get guildNavbarVoiceChannel => 'Canal de voz';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Pasa el rato con voz, vídeo y pantalla compartida';

  @override
  String get guildNavbarLinkChannel => 'Canal de enlace';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Acceso rápido a un sitio web o recurso externo';

  @override
  String get guildNavbarNameLabel => 'Nombre';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarCreateCategory => 'Crear categoría';

  @override
  String get guildNavbarNewCategoryHint => 'Nueva categoría';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Invita a amigos a $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Los destinatarios irán a #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Buscar amigos';

  @override
  String get guildNavbarNoFriendsYet => 'Aún no tienes amigos';

  @override
  String get guildNavbarNoResults => 'Sin resultados';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'O envía un enlace de invitación a un amigo:';

  @override
  String get guildNavbarInviteLink => 'Enlace de invitación';

  @override
  String get guildNavbarCopy => 'Copiar';

  @override
  String get guildNavbarCopied => '¡Copiado!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Tu enlace de invitación caduca en 7 días.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Este enlace de invitación nunca caduca.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Tu enlace de invitación caduca en $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Editar enlace de invitación';

  @override
  String get guildNavbarInviteLinkSettings =>
      'Configuración del enlace de invitación';

  @override
  String get guildNavbarExpireAfter => 'Caduca después de';

  @override
  String get guildNavbarMaxUses => 'Número máximo de usos';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Conceder membresía temporal';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Los miembros serán eliminados cuando se desconecten a menos que se asigne un rol';

  @override
  String get guildNavbarCreateNewLink => 'Crear enlace nuevo';

  @override
  String get guildNavbarSent => 'Enviado';

  @override
  String get guildNavbarInvite => 'Invitar';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Abandonar comunidad';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      '¿Estás seguro de que quieres abandonar esta comunidad? Ya no podrás ver ningún mensaje.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Abandonar comunidad';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      '¿Eliminar tus mensajes en esta comunidad?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Elimina permanentemente todos los mensajes que has enviado aquí, en todos los canales. No se puede deshacer.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Eliminar mis mensajes';

  @override
  String get guildNavbarDeletedYourMessages => 'Se han eliminado tus mensajes';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'No se han podido eliminar tus mensajes';

  @override
  String get guildNavbarRemoveOverride => 'Eliminar anulación';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Silenciado hasta el $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible =>
      'Solo accesible para el personal de Fluxer';

  @override
  String get guildNavbarInvitesPaused =>
      'Las invitaciones están actualmente pausadas en esta comunidad';

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
  String get guildNavbarNoLimit => 'Sin límite';

  @override
  String get guildNavbarOneUse => '1 uso';

  @override
  String guildNavbarUses(int count) {
    return '$count usos';
  }

  @override
  String get guildMenuMarkAsRead => 'Marcar como leído';

  @override
  String get guildPeekMoreOptions => 'Más opciones';

  @override
  String get guildMenuInviteMembers => 'Invitar miembros';

  @override
  String get guildMenuCommunitySettings => 'Ajustes de la comunidad';

  @override
  String get guildMenuEditCommunityProfile => 'Editar perfil de la comunidad';

  @override
  String get guildMenuUnmuteCommunity => 'Activar sonido de la comunidad';

  @override
  String get guildMenuMuteCommunity => 'Silenciar comunidad';

  @override
  String get guildMenuHideMutedChannels => 'Ocultar canales silenciados';

  @override
  String get guildMenuReportCommunity => 'Informar de la comunidad';

  @override
  String get guildMenuDebugCommunity => 'Depurar comunidad';

  @override
  String get guildMenuCopyCommunityId => 'Copiar ID de la comunidad';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Hasta las $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'General';

  @override
  String get guildMenuSettingsRoles => 'Roles y permisos';

  @override
  String get guildMenuSettingsEmoji => 'Emojis personalizados';

  @override
  String get guildMenuSettingsStickers => 'Pegatinas personalizadas';

  @override
  String get guildMenuSettingsSafetyModeration => 'Seguridad y moderación';

  @override
  String get guildMenuSettingsActivityLog => 'Registro de actividad';

  @override
  String get guildMenuSettingsWebhooks => 'Webhooks';

  @override
  String get guildMenuSettingsCustomInviteUrl =>
      'URL de invitación personalizada';

  @override
  String get guildMenuSettingsDiscovery => 'Descubrimiento';

  @override
  String get guildMenuSettingsMembers => 'Miembros';

  @override
  String get guildMenuSettingsInviteLinks => 'Enlaces de invitación';

  @override
  String get guildMenuSettingsBans => 'Prohibiciones';

  @override
  String get guildSettingsNoPermission =>
      'No tienes permiso para ver esta pestaña de ajustes.';

  @override
  String get guildSettingsOverviewIconTitle => 'Icono';

  @override
  String get guildSettingsUploadImage => 'Subir imagen';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Sube un banner para tu servidor.';

  @override
  String get guildSettingsOverviewNameTitle => 'Nombre';

  @override
  String get guildSettingsOverviewNameHint => 'Mi comunidad genial';

  @override
  String get guildSettingsOverviewStatsTitle => 'Estadísticas';

  @override
  String get guildSettingsOverviewMembers => 'Miembros';

  @override
  String get guildSettingsOverviewOnline => 'En línea';

  @override
  String get guildSettingsRolesDescription =>
      'Usa roles para agrupar miembros y asignar permisos.';

  @override
  String get guildSettingsCreateRole => 'Crear rol';

  @override
  String get guildSettingsRolesListTitle => 'Roles';

  @override
  String guildSettingsEmojiSlotInfo(int staticCount, int animatedCount) {
    return '$staticCount emojis estáticos, $animatedCount emojis animados usados';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Aún no hay emojis personalizados.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count pegatinas subidas';
  }

  @override
  String get guildSettingsStickersEmpty =>
      'Aún no hay pegatinas personalizadas.';

  @override
  String get guildSettingsModerationVerificationTitle =>
      'Verificación de miembros';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Elige qué deben tener los miembros antes de poder publicar o enviar mensajes directos a los miembros de la comunidad.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Los miembros con roles pueden omitir estas comprobaciones. Para espacios públicos, recomendamos activar la verificación.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Las comunidades listadas en Descubrimiento requieren al menos un correo electrónico verificado. No se puede seleccionar Ninguno mientras Descubrimiento esté activado.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Contenido para adultos y advertencias de contenido';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Configura el etiquetado de contenido para adultos y las advertencias de contenido opcionales para los miembros.';

  @override
  String get guildSettingsModerationMatureToggle => 'Contenido para adultos';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Marca esta comunidad como que contiene contenido para adultos.';

  @override
  String get guildSettingsVerificationNone => 'Ninguna';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'No se requiere verificación.';

  @override
  String get guildSettingsVerificationLow => 'Baja';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Requiere una dirección de correo electrónico verificada.';

  @override
  String get guildSettingsVerificationMedium => 'Media';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Requiere una dirección de correo electrónico verificada y una cuenta con al menos 5 minutos de antigüedad.';

  @override
  String get guildSettingsVerificationHigh => 'Alta';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Requiere todo lo de media, además de ser miembro de la comunidad durante al menos 10 minutos.';

  @override
  String get guildSettingsVerificationHighest => 'Muy alta';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Requiere un número de teléfono verificado.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Registra las acciones del moderador en toda la comunidad.';

  @override
  String get guildSettingsAuditLogEmpty => 'Aún no hay registros';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Las acciones de moderación y los cambios en la comunidad aparecerán aquí.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Todos los usuarios';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Todas las acciones';

  @override
  String get guildSettingsAuditLogNoReason =>
      'No se proporcionó ninguna razón.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Usuario desconocido';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Algo salió mal al cargar el registro de actividad.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'No se pueden cargar los registros de actividad';

  @override
  String get guildSettingsAuditLogReason => 'Razón';

  @override
  String get guildSettingsAuditLogSomeone => 'alguien';

  @override
  String get guildSettingsAuditLogSomething => 'algo';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'entidad desconocida';

  @override
  String get guildSettingsAuditLogNothing => 'nada';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Destino desconocido';

  @override
  String get auditLogActionGuildUpdate => 'Comunidad actualizada';

  @override
  String get auditLogActionChannelCreate => 'Canal creado';

  @override
  String get auditLogActionChannelUpdate => 'Canal actualizado';

  @override
  String get auditLogActionChannelDelete => 'Canal eliminado';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Se añadió una sobreescritura de canal';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Se actualizó una sobreescritura de canal';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Se eliminó una sobreescritura de canal';

  @override
  String get auditLogActionMemberKick => 'Miembro expulsado';

  @override
  String get auditLogActionMemberPrune => 'Miembros eliminados';

  @override
  String get auditLogActionMemberBanAdd => 'Miembro baneado';

  @override
  String get auditLogActionMemberBanRemove => 'Miembro desbaneado';

  @override
  String get auditLogActionMemberUpdate => 'Miembro actualizado';

  @override
  String get auditLogActionMemberRoleUpdate => 'Roles de miembro actualizados';

  @override
  String get auditLogActionMemberMove => 'Miembro movido';

  @override
  String get auditLogActionMemberDisconnect => 'Miembro desconectado';

  @override
  String get auditLogActionBotAdd => 'Bot añadido';

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
  String get auditLogActionStickerCreate => 'Pegatina creada';

  @override
  String get auditLogActionStickerUpdate => 'Pegatina actualizada';

  @override
  String get auditLogActionStickerDelete => 'Pegatina eliminada';

  @override
  String get auditLogActionMessageDelete => 'Mensaje eliminado';

  @override
  String get auditLogActionMessageBulkDelete => 'Mensajes eliminados';

  @override
  String get auditLogActionMessagePin => 'Mensaje fijado';

  @override
  String get auditLogActionMessageUnpin => 'Mensaje desanclado';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return 'El miembro $actor actualizó los ajustes de la comunidad.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return 'El miembro $actor creó el canal $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return 'El miembro $actor actualizó el canal $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return 'El miembro $actor eliminó el canal $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return 'El miembro $actor añadió permisos de canal para $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'El miembro $actor añadió permisos de canal para $target en $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return 'El miembro $actor actualizó los permisos de canal para $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'El miembro $actor actualizó los permisos de canal para $target en $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return 'El miembro $actor eliminó los permisos de canal para $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'El miembro $actor eliminó los permisos de canal para $target en $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return 'El miembro $actor expulsó a $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return 'El miembro $actor baneó a $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return 'El miembro $actor desbaneó a $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return 'El miembro $actor actualizó a $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return 'El miembro $actor actualizó los roles de $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return 'El miembro $actor eliminó miembros inactivos.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return 'El miembro $actor eliminó miembros inactivos durante $days días.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return 'El miembro $actor movió a $target a otro canal de voz.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'El miembro $actor movió a $target al canal $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return 'El miembro $actor desconectó a $target de voz.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return 'El miembro $actor añadió el bot $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return 'El miembro $actor creó el rol $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return 'El miembro $actor actualizó el rol $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return 'El miembro $actor eliminó el rol $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return 'El miembro $actor creó la invitación $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'El miembro $actor creó la invitación $target para el canal $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return 'El miembro $actor actualizó la invitación $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'El miembro $actor actualizó la invitación $target para el canal $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return 'El miembro $actor eliminó la invitación $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'El miembro $actor eliminó la invitación $target para el canal $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return 'El miembro $actor creó el webhook $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return 'El miembro $actor actualizó el webhook $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return 'El miembro $actor eliminó el webhook $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor añadió el emoji $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor actualizó el emoji $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor eliminó el emoji $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor añadió la pegatina $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor actualizó la pegatina $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor eliminó la pegatina $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor eliminó un mensaje.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor eliminó un mensaje en $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor eliminó varios mensajes.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor eliminó $count mensajes.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor eliminó varios mensajes en $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor eliminó $count mensajes en $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor fijó un mensaje.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor fijó un mensaje en $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor dejó de fijar un mensaje.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor dejó de fijar un mensaje en $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor realizó una acción de auditoría sobre $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Se actualizó $field de $oldValue a $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Se estableció $field en $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Se borró $field (era $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Se actualizó $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Se cambió el nombre de la comunidad a $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Se actualizó el icono de la comunidad.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Se cambió el nombre del canal a $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Se borró el tema.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Se actualizó el tema a $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'Se habilitó el contenido para adultos.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Se deshabilitó el contenido para adultos.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Se estableció el apodo en $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Se eliminó el apodo $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Se silenció al miembro.';

  @override
  String get auditLogChangeUnmutedMember => 'Se dejó de silenciar al miembro.';

  @override
  String get auditLogChangeDeafenedMember => 'Se ensordeció al miembro.';

  @override
  String get auditLogChangeUndeafenedMember =>
      'Se dejó de ensordecer al miembro.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Se añadieron $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Se eliminaron $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Canal: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Mensaje: $value.';
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
      other: 'Se eliminaron # mensajes.',
      one: 'Se eliminó # mensaje.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se eliminaron # miembros.',
      one: 'Se eliminó # miembro.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'Esta invitación nunca caduca.';

  @override
  String get auditLogOptionTemporaryMembership => 'Otorga membresía temporal.';

  @override
  String get auditLogOptionPermanentMembership =>
      'Otorga membresía permanente.';

  @override
  String get guildSettingsLoadMore => 'Cargar más';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Gestiona los webhooks que publican mensajes en los canales.';

  @override
  String get guildSettingsWebhooksEmpty => 'No hay webhooks configurados.';

  @override
  String get guildSettingsCopyUrl => 'Copiar URL';

  @override
  String get guildSettingsCopiedUrl => 'URL copiada al portapapeles';

  @override
  String get guildSettingsDeleteWebhook => 'Eliminar webhook';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Establece un enlace de invitación personalizado para tu servidor.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Guardar';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Uso';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count usos';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Solicita aparecer en la sección de descubrimiento de servidores.';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Se requieren al menos $count miembros para solicitar.';
  }

  @override
  String get guildSettingsDiscoveryFormTitle => 'Solicitud';

  @override
  String get guildSettingsDiscoveryStatusTitle => 'Estado';

  @override
  String get guildSettingsDiscoveryCategory => 'Categoría';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Descripción';

  @override
  String get guildSettingsDiscoveryTags => 'Etiquetas';

  @override
  String get guildSettingsDiscoveryTagsHint => 'gaming, arte, música';

  @override
  String get guildSettingsDiscoveryApply => 'Enviar solicitud';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Retirar';

  @override
  String get guildSettingsMembersDescription =>
      'Busca y administra los miembros del servidor.';

  @override
  String get guildSettingsMembersSearchHint => 'Buscar miembros';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count miembros';
  }

  @override
  String get guildSettingsInvitesDescription =>
      'Ver y revocar enlaces de invitación activos.';

  @override
  String get guildSettingsInvitesEmpty => 'No hay invitaciones activas.';

  @override
  String guildSettingsInviteUses(int uses, int maxUses) {
    return '$uses / $maxUses usos';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Expira el $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Ver y administrar usuarios baneados.';

  @override
  String get guildSettingsBansSearchHint => 'Buscar baneos';

  @override
  String get guildSettingsBansEmpty => 'No hay usuarios baneados.';

  @override
  String get guildSettingsBanPermanent => 'Baneo permanente';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Expira el $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Expira';

  @override
  String get guildSettingsUnban => 'Desbanear';

  @override
  String get guildSettingsBansLoading => 'Cargando usuarios baneados';

  @override
  String get guildSettingsBansNoSearchResults =>
      'No se encontraron baneos que coincidan con tu búsqueda.';

  @override
  String get guildSettingsBanDetailsTitle => 'Detalles del baneo';

  @override
  String get guildSettingsBanViewDetails => 'Ver detalles';

  @override
  String get guildSettingsBannedOn => 'Baneado el';

  @override
  String get guildSettingsBannedBy => 'Baneado por';

  @override
  String get guildSettingsRevokeBanTitle => 'Revocar baneo';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return '¿Estás seguro de que quieres revocar el baneo de $displayName? Podrá volver a unirse a la comunidad.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Baneo revocado para $displayName';
  }

  @override
  String get guildSettingsBansLoadError =>
      'No se pudieron cargar los baneos. Inténtalo de nuevo.';

  @override
  String get guildSettingsRevokeBanError =>
      'No se pudo revocar el baneo. Inténtalo de nuevo.';

  @override
  String get guildSettingsCommunitySettings => 'Ajustes de la comunidad';

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
      'Administra el perfil, los canales y la configuración predeterminada de tu comunidad.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Marca';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Actualiza tu icono, nombre, banner y fondo de invitación';

  @override
  String get guildSettingsOverviewBannerUpload => 'Subir banner';

  @override
  String get guildSettingsOverviewIdleTitle => 'Ajustes de inactividad';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Configura el canal AFK y el tiempo de espera';

  @override
  String get guildSettingsOverviewSystemTitle => 'Sistema y bienvenida';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Elige el destino de los mensajes del sistema y de bienvenida';

  @override
  String get guildSettingsOverviewNotificationsTitle =>
      'Notificaciones predeterminadas';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Las comunidades con más de 250 personas se ven forzadas a la configuración de \"solo menciones\". Tu configuración original se conserva y se restaurará si la comunidad desciende por debajo de los 250 miembros.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Avanzado';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Permitir nombres de canal de texto flexibles';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Ocultar la corona del propietario de la comunidad';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Banner independiente';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Muestra el banner en su propia sección debajo del encabezado de la comunidad.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Subir icono';

  @override
  String get guildSettingsOverviewRemoveImage => 'Eliminar';

  @override
  String get guildSettingsOverviewSplashTitle => 'Fondo de invitación';

  @override
  String get guildSettingsOverviewEmbedSplashTitle =>
      'Fondo de incrustación de chat';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Se muestra en las incrustaciones de invitación en el chat.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Subir fondo';

  @override
  String get guildSettingsOverviewNoCommunityBanner =>
      'Sin banner de comunidad';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'Sin fondo de invitación';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Vista previa';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Mira cómo se ve tu invitación para los visitantes.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Nombres de canales de texto';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Corona del propietario de la comunidad';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Configura si el icono de la corona se muestra junto al propietario de la comunidad';

  @override
  String get guildSettingsSplashCardAlignment => 'Alineación de la tarjeta';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Centro';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Izquierda';

  @override
  String get guildSettingsSplashAlignmentRight => 'Derecha';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Solo se aplica en pantallas anchas.';

  @override
  String get permissionReadMessageHistory => 'Leer historial de mensajes';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Cambiar lo que pueden ver los usuarios sin \"$permission\"';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Usa un modal dedicado para establecer una fecha límite de historial de mensajes para los miembros que no tengan el permiso $permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Abrir umbral del historial de mensajes';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Umbral del historial de mensajes';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Habilitar umbral del historial de mensajes';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Fecha límite';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Los miembros sin Leer historial de mensajes pueden ver los mensajes enviados después de esta fecha.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Umbral del historial de mensajes actualizado';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Permite mayúsculas y espacios en los nombres de los canales de texto. Desactivado restringe los nombres a minúsculas con guiones y guiones bajos.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Oculta el icono de la corona junto al propietario de la comunidad en todas las interfaces.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Los iconos animados requieren la función de comunidad de Icono animado.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Los banners animados requieren la función de comunidad de Banner animado.';

  @override
  String get guildSettingsAfkChannel => 'Canal AFK / inactivo';

  @override
  String get guildSettingsAfkChannelHint =>
      'Mueve a los miembros a este canal cuando estén AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Sin canal AFK';

  @override
  String get guildSettingsAfkTimeout => 'Tiempo de espera AFK';

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
  String get guildSettingsSystemChannel => 'Canal de destino';

  @override
  String get guildSettingsSystemChannelHint =>
      'Los mensajes de bienvenida y del sistema aparecerán aquí.';

  @override
  String get guildSettingsNoSystemChannel => 'Sin canal de sistema';

  @override
  String get guildSettingsHideJoinMessages => 'Ocultar mensajes de unión';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Suprime los mensajes de entrada en el canal de destino.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Ajustes de notificación predeterminados';

  @override
  String get guildSettingsNotificationsAll => 'Todos los mensajes';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Notificar en todos los mensajes';

  @override
  String get guildSettingsNotificationsMentions => 'Solo menciones';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Notificar solo en menciones';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Máx. 10 MB. Mínimo: 960 x 540 píxeles (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Máx. 10 MB. Mínimo: 960 x 540 píxeles (16:9). Se muestra en las incrustaciones de invitación en el chat.';

  @override
  String get guildSettingsModerationDescription =>
      'Configura los ajustes de verificación, filtrado de contenido y contenido para adultos.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Las comunidades listadas en Descubrimiento tienen opciones de moderación restringidas.';

  @override
  String get guildSettingsModerationContentFilterTitle =>
      'Filtrado de contenido';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Examina automáticamente los mensajes en busca de contenido explícito en canales que no estén marcados como para adultos.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Las comunidades listadas en Descubrimiento deben escanear a todos los miembros. Esta configuración no se puede cambiar mientras Descubrimiento esté activado.';

  @override
  String get guildSettingsContentFilterOff => 'Desactivado';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Deja que la comunidad se automode';

  @override
  String get guildSettingsContentFilterNoRole => 'Filtrar miembros sin roles';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Recomendado para la mayoría de las comunidades';

  @override
  String get guildSettingsContentFilterAll => 'Filtrar a todos';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Máxima protección para espacios familiares';

  @override
  String get guildSettingsModerationMatureOff => 'Desactivado';

  @override
  String get guildSettingsModerationMatureOn => 'Activado';

  @override
  String get guildSettingsContentWarningToggle =>
      'Mostrar una advertencia de contenido';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Activa una solicitud de consentimiento antes de entrar en cualquier canal.';

  @override
  String get guildSettingsContentWarningText =>
      'Texto de advertencia personalizado';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Esto contiene contenido sensible.';

  @override
  String get guildSettingsModeration2faTitle => 'Requisito de 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'Requiere autenticación de dos factores para los moderadores antes de que puedan prohibir, expulsar, silenciar temporalmente o eliminar mensajes.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Requerir 2FA para acciones de moderación';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Solo el propietario de la comunidad puede cambiar esta configuración';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Activa la 2FA en tu cuenta para cambiar esta configuración';

  @override
  String get guildSettingsEmojiSearchHint => 'Buscar emojis';

  @override
  String get guildSettingsEmojiUploadTitle => 'Subir emoji';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Emoji no animado ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Emoji animado ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Buscar pegatinas';

  @override
  String get guildSettingsWebhooksInfo =>
      'Crea webhooks desde los ajustes del canal. Edítalos aquí.';

  @override
  String get guildSettingsVanityUrlWarning =>
      'Tu URL personalizada no funcionará a menos que al menos un canal sea visible para todos.';

  @override
  String get guildSettingsVanityUrlRemove => 'Eliminar';

  @override
  String get guildSettingsBannedUsersTitle => 'Usuarios prohibidos';

  @override
  String get guildSettingsInvitesTableInviter => 'Invitador';

  @override
  String get guildSettingsInvitesTableChannel => 'Canal';

  @override
  String get guildSettingsInvitesTableCode => 'Código';

  @override
  String get guildSettingsInvitesTableUses => 'Usos';

  @override
  String get guildSettingsInvitesTableCreated => 'Creado';

  @override
  String get guildSettingsMembersSortNewest => 'Más recientes primero';

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

/// The translations for Spanish Castilian, as used in Latin America and the Caribbean (`es_419`).
class FluxerLocalizationsEs419 extends FluxerLocalizationsEs {
  FluxerLocalizationsEs419() : super('es_419');

  @override
  String get reconnectingTitle => '¡Fluxer ha dejado el grupo!';

  @override
  String get reconnectingBody =>
      'Hay un problema con los servidores.\n¡Se solucionara en breve!';

  @override
  String get gatewayReconnectingToast => 'Reconectando…';

  @override
  String get gatewayConnectedToast => 'Conexión Restablecida';

  @override
  String splashStartupFailed(String error) {
    return 'Error al iniciar: $error';
  }

  @override
  String get retry => 'Reintentar';

  @override
  String get connectingCaps => 'CONECTANDO';

  @override
  String get splashConnectionLost => 'Conexión perdida';

  @override
  String get splashViewOnStatusPage => 'Ver página de estado';

  @override
  String get splashConnectionIssuesPrompt => '¿Problemas de conexión?';

  @override
  String get splashStatusPageLink => 'Página de estado';

  @override
  String get splashReadIncident => 'Ver reporte del incidente';

  @override
  String get splashIncidentHistory => 'Historial de incidentes';

  @override
  String get welcomeBack => 'Hola de nuevo';

  @override
  String get email => 'Correo electrónico';

  @override
  String get emailInvalid => 'Por favor, ingresa un correo electrónico valido.';

  @override
  String get password => 'Contraseña';

  @override
  String get forgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get logIn => 'Iniciar sesión';

  @override
  String get logInWithPasskey => 'Iniciar sesión con llave de acceso';

  @override
  String continueWithSso(String provider) {
    return 'Continuar con $provider';
  }

  @override
  String get ssoRequired => 'Se requiere SSO para acceder a esta instancia.';

  @override
  String get organizationSsoProvider =>
      'Inicia sesión con el proveedor de inicio de sesión único de tu organización.';

  @override
  String get failedToStartSso => 'No se pudo iniciar el SSO';

  @override
  String get ssoCancelled => 'Se canceló el inicio de sesión con SSO';

  @override
  String preferSso(String provider) {
    return '¿Prefieres usar SSO? Continúa con $provider.';
  }

  @override
  String get logInViaBrowser => 'Iniciar sesión en el navegador';

  @override
  String get needAccountPrompt => '¿No tienes una cuenta? ';

  @override
  String get register => 'Registrarse';

  @override
  String get orDivider => 'O';

  @override
  String get captchaTitle => 'Verifica que eres humano';

  @override
  String get captchaDescription =>
      'Necesitamos asegurarnos de que no eres un robot. Por favor, completa la verificación a continuación.';

  @override
  String get captchaSwitchToHcaptcha =>
      '¿Tienes problemas? Intenta con hCaptcha';

  @override
  String get captchaSwitchToTurnstile => 'Intenta con Turnstile';

  @override
  String get cancel => 'Cancelar';

  @override
  String get ipAuthCheckEmail => 'Revisa tu correo';

  @override
  String ipAuthDescription(String email) {
    return 'Enviamos un enlace por correo para autorizar este inicio de sesión. Por favor, abre tu bandeja de entrada en $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Se perdió la conexión';

  @override
  String get ipAuthConnectionLostDescription =>
      'Se perdió la conexión mientras se esperaba la autorización. Por favor, inténtalo de nuevo.';

  @override
  String get ipAuthLinkExpired => 'El enlace de inicio de sesión ha caducado';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Este enlace de autorización ha caducado. Por favor, inicia sesión de nuevo.';

  @override
  String get ipAuthResendEmail => 'Reenviar correo';

  @override
  String get ipAuthResent => 'Reenviado';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Volver';

  @override
  String get mfaTitle => 'Autenticación en dos pasos';

  @override
  String get mfaChooseMethod => 'Elige un método de verificación';

  @override
  String get mfaMethodTotp => 'Aplicación de Autenticación';

  @override
  String get mfaMethodWebauthn => 'Llave de Seguridad / Llave de acceso';

  @override
  String get mfaTotpDescription =>
      'Ingresa el código de 6 dígitos de tu aplicación de autenticación o uno de tus códigos de respaldo.';

  @override
  String get mfaCodeLabel => 'Código';

  @override
  String get mfaTryAnotherMethod => 'Probar otro método';

  @override
  String get mfaUseSecurityKey =>
      'Llave de seguridad / Llave de acceso en su lugar';

  @override
  String get accountSelectorTitle => 'Elige una cuenta';

  @override
  String get accountSelectorDescription =>
      'Selecciona una cuenta para continuar o añade una diferente.';

  @override
  String get accountAdd => 'Añadir una cuenta';

  @override
  String get accountRemove => 'Eliminar';

  @override
  String accountRemoveTitle(String username) {
    return 'Eliminar $username';
  }

  @override
  String get accountRemoveDescription =>
      'Esto eliminará la sesión guardada para esta cuenta.';

  @override
  String get accountRemoveOnlyDescription =>
      'Esto eliminara la única cuenta guardada en este dispositivo.';

  @override
  String get accountExpired => 'Expirada';

  @override
  String accountSessionExpired(String identifier) {
    return 'La sesión para $identifier ha expirado. Por favor, inicia sesión otra vez.';
  }

  @override
  String get accountManageTitle => 'Administrar cuentas';

  @override
  String get accountSwitchFailed =>
      'No se pudo cambiar de cuenta. Inténtalo de nuevo.';

  @override
  String get profileTabMenuSwitchAccounts => 'Cambiar de cuenta';

  @override
  String get statusChangeSheetTitle => 'Establecer estado';

  @override
  String get statusOnlineStatusSection => 'Estado en línea';

  @override
  String get statusOnline => 'En línea';

  @override
  String get statusIdle => 'Ausente';

  @override
  String get statusDnd => 'No molestar';

  @override
  String get statusInvisible => 'Invisible';

  @override
  String get statusOffline => 'Desconectado';

  @override
  String get statusUntilIChangeIt => 'Hasta que lo cambie';

  @override
  String get statusDontClear => 'No borrar';

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
      'No recibirás notificaciones en el escritorio';

  @override
  String get statusInvisibleDescription => 'Aparecerás como desconectado';

  @override
  String get customStatusSetTitle => 'Establecer estado personalizado';

  @override
  String get customStatusCurrentHint => 'Estado personalizado';

  @override
  String get customStatusClear => 'Borrar estado personalizado';

  @override
  String get customStatusPlaceholder => '¿Que esta pasando?';

  @override
  String get customStatusChooseEmoji => 'elegir un emoji';

  @override
  String get customStatusClearAfter => 'Borrar después de';

  @override
  String get customStatusSave => 'Guardar';

  @override
  String get accountActive => 'Cuenta activa';

  @override
  String get signOut => 'Cerrar sesión';

  @override
  String get suspendedPermanentTitle => 'Cuenta Suspendida Permanentemente';

  @override
  String get suspendedTemporaryTitle => 'Cuenta Suspendida';

  @override
  String get suspendedPermanentDescription =>
      'Tu cuenta ha sido suspendida de forma permanente por infringir nuestros Términos de Servicio.';

  @override
  String get suspendedTemporaryDescription =>
      'Tu cuenta ha sido suspendida temporalmente. Podrás acceder a ella una vez que finalice el periodo de suspensión.';

  @override
  String get suspendedIssuedAt => 'Emitido';

  @override
  String get suspendedEndsAt => 'Finaliza';

  @override
  String get suspendedDuration => 'Duración';

  @override
  String get suspendedPermanent => 'Permanente';

  @override
  String get suspendedReason => 'Razón';

  @override
  String get suspendedAppealDeadline => 'Fecha limite de apelación';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Tu cuenta está programada para ser eliminada el $date.';
  }

  @override
  String get suspendedRecheck => 'Buscar Actualizaciones';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Volver a intentar en ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Volver al Inicio de sesión';

  @override
  String get suspendedAppealTitle => 'Apelar';

  @override
  String get suspendedAppealHint =>
      'Explica por qué deberíamos reconsiderar tu suspensión (mínimo 50 caracteres)...';

  @override
  String get suspendedAppealSubmit => 'Enviar Apelación';

  @override
  String get suspendedAppealPending => 'Pendiente de revisión';

  @override
  String get suspendedAppealAccepted => 'Apelación aceptada';

  @override
  String get suspendedAppealRejected => 'Apelación rechazada';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Tu apelación ha sido aceptada y tu cuenta ha sido restablecida.';

  @override
  String get suspendedSignIn => 'Iniciar sesión en tu cuenta';

  @override
  String get forgotPasswordTitle => '¿Olvidaste tu contraseña?';

  @override
  String get forgotPasswordDescription =>
      'Ingresa tu correo electrónico y te enviaremos un enlace para restablecer tu contraseña.';

  @override
  String get forgotPasswordSubmit => 'Enviar enlace de restablecimiento';

  @override
  String get forgotPasswordSentTitle => 'Revisa tu correo';

  @override
  String get forgotPasswordSentDescription =>
      'Hemos enviado las instrucciones para restablecer tu contraseña a tu correo electrónico. Por favor, revisa tu bandeja de entrada y sigue el enlace para restablecer tu contraseña.';

  @override
  String get forgotPasswordBackToLogin => 'Regresar al inicio de sesión';

  @override
  String get resetPasswordTitle => 'Establecer nueva contraseña';

  @override
  String get resetPasswordDescription =>
      'Ingresa tu nueva contraseña a continuación para completar el proceso de restablecimiento.';

  @override
  String get resetPasswordNewPassword => 'Nueva contraseña';

  @override
  String get resetPasswordConfirm => 'Confirmar nueva contraseña';

  @override
  String get resetPasswordSubmit => 'Restablecer contraseña';

  @override
  String get resetPasswordMismatch => 'Las contraseñas no coinciden.';

  @override
  String get registerTitle => 'Crear una cuenta';

  @override
  String get registerDisplayName => 'Nombre visible (Opcional)';

  @override
  String get registerDisplayNameHint => '¿Cómo quieres que te llamen?';

  @override
  String get registerUsername => 'Nombre de usuario (Opcional)';

  @override
  String get registerUsernameHint =>
      'Deja en blanco para un nombre de usuario aleatorio';

  @override
  String get registerUsernameTagHint =>
      'Se añadirá automáticamente una etiqueta de 4 dígitos para garantizar que sea único';

  @override
  String get registerDateOfBirth => 'Fecha de nacimiento';

  @override
  String get registerMonth => 'Mes';

  @override
  String get registerDay => 'Día';

  @override
  String get registerYear => 'Año';

  @override
  String get registerConsent =>
      'Acepto los Términos de Servicio y las Políticas de Privacidad';

  @override
  String get registerConsentPrefix => 'Acepto los ';

  @override
  String get registerConsentTerms => 'Términos de Servicio';

  @override
  String get registerConsentAnd => ' y ';

  @override
  String get registerConsentPrivacy => 'Políticas de Privacidad';

  @override
  String get registerConfirmPassword => 'Confirmar Contraseña';

  @override
  String get registerSubmit => 'Crear cuenta';

  @override
  String get registerHaveAccount => '¿Ya tienes una cuenta? ';

  @override
  String get passkeyNoCredentials =>
      'No se encontraron llaves de acceso para esta aplicación. En su lugar, inicia sesión con tu correo y contraseña.';

  @override
  String get passkeyDeviceNotSupported =>
      'Este dispositivo no admite llaves de acceso.';

  @override
  String get passkeyDomainNotAssociated =>
      'Las llaves de acceso no están configuradas para esta app. En su lugar, inicia sesión con tu correo y contraseña.';

  @override
  String get passkeyTimeout =>
      'Se agotó el tiempo de autenticación con llave de acceso. Por favor, inténtalo de nuevo.';

  @override
  String get passkeyNotAvailable =>
      'Las llaves de acceso no están disponibles para esta app. En su lugar, inicia sesión con tu correo y contraseña.';

  @override
  String get passkeyFailed =>
      'Falló la autenticación con llave de acceso. Por favor, inténtalo de nuevo.';

  @override
  String get errorUnableToCreateAccount =>
      'No se pudo crear la cuenta. Por favor, inténtalo de nuevo.';

  @override
  String get errorUnableToSignIn =>
      'No se puede iniciar sesión en este momento. Por favor, inténtelo de nuevo.';

  @override
  String get errorInvalidEmailOrPassword =>
      'Correo electrónico o contraseña no válidos.';

  @override
  String get errorUnableToSendResetLink =>
      'No se pudo enviar el enlace de restablecimiento. Por favor, Inténtalo de nuevo.';

  @override
  String get errorUnableToResetPassword =>
      'No se pudo restablecer la contraseña. Por favor, inténtalo de nuevo.';

  @override
  String get embedInviteJoin => 'Unirse a la Comunidad';

  @override
  String get embedInviteGoTo => 'Ir a la Comunidad';

  @override
  String embedInviteOnline(String count) {
    return '$count En linea';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count Miembros';
  }

  @override
  String get embedInviteUnknownTitle => 'Invitación desconocida';

  @override
  String get embedInviteUnknownSubtitle =>
      'Intenta pedir una nueva invitación.';

  @override
  String get embedInviteUnavailable => 'Invitación no disponible';

  @override
  String get inviteAcceptTitle => 'Te invitaron a unirte';

  @override
  String get inviteAcceptJoinButton => 'Unirse a la comunidad';

  @override
  String get inviteAcceptGoToButton => 'Ir a la comunidad';

  @override
  String get inviteAcceptInvitesPaused => 'Invitaciones pausadas';

  @override
  String get inviteAcceptNotFoundTitle => 'Invitación inválida';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Esta invitación puede haber expirado o ser inválida.';

  @override
  String get inviteAcceptJoinGroupButton => 'Unirse al grupo';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Fuiste invitado a unirte a un DM grupal por $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'alguien';

  @override
  String get inviteAcceptEmojiPack => 'Paquete de emojis';

  @override
  String get inviteAcceptStickerPack => 'Paquete de stickers';

  @override
  String get inviteAcceptInstallEmojiPack => 'Instalar paquete de emojis';

  @override
  String get inviteAcceptInstallStickerPack => 'Instalar paquete de stickers';

  @override
  String get inviteAcceptPackInstallNote =>
      'Al aceptar esta invitación se instalará el paquete automáticamente.';

  @override
  String get mentionUnknownChannel => 'canal-desconocido';

  @override
  String get channelAccessDeniedTitle => 'No tienes acceso a este canal';

  @override
  String get channelAccessDeniedDescription =>
      'No tienes acceso al canal donde se envió este mensaje.';

  @override
  String get messageJumpLinkNoAccess => 'No tienes acceso';

  @override
  String get okay => 'Aceptar';

  @override
  String get embedThemeTitle => 'Tema compartido';

  @override
  String get embedThemeSubtitle =>
      'Este cliente no admite temas personalizados.';

  @override
  String get embedThemeUnavailableButton => 'Temas no disponibles';

  @override
  String get privacySettings => 'Ajustes de privacidad';

  @override
  String get privacyDirectMessages => 'Mensajes directos';

  @override
  String get privacyDirectMessagesDescription =>
      'Permitir mensajes directos de otros miembros de esta comunidad';

  @override
  String get privacyBotDirectMessages => 'Mensajes directos de Bots';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Permitir que los bots de esta comunidad te envíen mensajes directos';

  @override
  String get privacyMutualDmsDisabled =>
      'Los administradores de la comunidad desactivaron la opción de recibir mensajes directos únicamente de miembros mutuos en esta comunidad.';

  @override
  String get communityDebug => 'Depuración de la comunidad';

  @override
  String get copiedToClipboard => 'Copiado en el portapapeles';

  @override
  String get notificationSettings => 'Ajustes de notificación';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Silenciar $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Silenciar una comunidad evita que aparezcan indicadores de no leídos y notificaciones, a menos que te mencionen';

  @override
  String get notificationCommunitySettings =>
      'Ajustes de notificación de la comunidad';

  @override
  String get notificationAllMessages => 'Todos los mensajes';

  @override
  String get notificationOnlyMentions => 'Solo menciones';

  @override
  String get notificationNothing => 'Nada';

  @override
  String get notificationSuppressEveryone => 'Silenciar @everyone y @here';

  @override
  String get notificationSuppressRoles =>
      'Silenciar todas las @menciones de roles';

  @override
  String get notificationMobilePush => 'Notificaciones push móviles';

  @override
  String get notificationOverrides => 'Excepciones de notificación';

  @override
  String get notificationSelectChannel => 'Seleccionar un canal o categoría';

  @override
  String get notificationOnlyAtMentions => 'Solo @menciones';

  @override
  String get notificationMuteChannel => 'Silenciar canal';

  @override
  String get notificationUnmuteChannel => 'Reactivar sonido del canal';

  @override
  String get notificationNoCategory => 'Sin categoría';

  @override
  String get dmMarkAsRead => 'Marcar como leído';

  @override
  String get dmMuteConversation => 'Silenciar chat';

  @override
  String get dmUnmuteConversation => 'Desactivar silencio de chat';

  @override
  String get dmPinDm => 'Fijar chat';

  @override
  String get dmUnpinDm => 'Desfijar chat';

  @override
  String get dmAlwaysShowInSidebar => 'Mostrar siempre en la barra lateral';

  @override
  String get dmRemoveFromAlwaysShown => 'Quitar de mostrar siempre';

  @override
  String get dmCloseDm => 'Cerrar chat';

  @override
  String get dmCloseDmConfirmTitle => 'Cerrar chat';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return '¿Estás seguro de que quieres cerrar el chat con $username? Puedes volver a abrirlo más tarde.';
  }

  @override
  String get dmCopyChannelId => 'Copiar ID del Canal';

  @override
  String get dmChannelIdCopied => 'ID del canal copiado';

  @override
  String get dmCopyUserId => 'Copiar ID de usuario';

  @override
  String get dmUserIdCopied => 'ID de usuario copiado';

  @override
  String get dmViewProfile => 'Ver perfil';

  @override
  String get dmVoiceCall => 'Iniciar llamada de voz';

  @override
  String get incomingVoiceCallTitle => 'Llamada de voz entrante';

  @override
  String get incomingVoiceCallAccept => 'Aceptar';

  @override
  String get incomingVoiceCallDecline => 'Rechazar';

  @override
  String get incomingVoiceCallLabel => 'Llamada entrante';

  @override
  String get incomingVoiceCallIgnore => 'Ignorar';

  @override
  String get directVoiceCallNotEligible =>
      'No se puede iniciar la llamada ahora mismo. Por favor, inténtalo de nuevo en un momento.';

  @override
  String get voiceJoinCallFailed =>
      'No se pudo conectar a esta llamada. Revisa tu conexión e inténtalo de nuevo.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'No fue posible entrar a esta llamada. Revisa tu conexión e inténtalo de nuevo.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'No se pudo actualizar esta llamada en el servidor. Revisa tu conexión e inténtalo de nuevo.';

  @override
  String get dmAddNote => 'Añadir nota';

  @override
  String get dmEditGroup => 'Editar grupo';

  @override
  String get dmInviteToCommunity => 'Invitar a la comunidad';

  @override
  String get dmBlock => 'Bloquear';

  @override
  String get dmLeaveGroup => 'Abandonar grupo';

  @override
  String get dmNoCommunitiesAvailable => 'No hay comunidades disponibles';

  @override
  String dmGroupMemberCount(int count) {
    return '$count Miembros';
  }

  @override
  String get dmMuteFor15Min => 'Por 15 minutos';

  @override
  String get dmMuteFor30Min => 'Por 30 minutos';

  @override
  String get dmMuteFor1Hour => 'Por 1 hora';

  @override
  String get dmMuteFor3Hours => 'Por 3 horas';

  @override
  String get dmMuteFor4Hours => 'Por 4 horas';

  @override
  String get dmMuteFor8Hours => 'Por 8 horas';

  @override
  String get dmMuteFor24Hours => 'Por 24 horas';

  @override
  String get dmMuteFor3Days => 'Por 3 días';

  @override
  String get dmMuteForever => 'Hasta que lo vuelva a activar';

  @override
  String get dmPinGroupDm => 'Fijar chat grupal';

  @override
  String get dmUnpinGroupDm => 'Desfijar chat grupal';

  @override
  String get dmFavoriteDm => 'Añadir chat a favoritos';

  @override
  String get dmUnfavoriteDm => 'Quitar chat de favoritos';

  @override
  String get dmFavoriteGroupDm => 'Añadir chat grupal a favoritos';

  @override
  String get dmUnfavoriteGroupDm => 'Quitar chat grupal de favoritos';

  @override
  String get dmChangeFriendNickname => 'Cambiar apodo de amigo';

  @override
  String get dmRemoveFriend => 'Eliminar amigo';

  @override
  String get dmAddFriend => 'Añadir amigo';

  @override
  String get dmAcceptFriendRequest => 'Aceptar solicitud de amistad';

  @override
  String get dmIgnoreFriendRequest => 'Ignorar solicitud de amistad';

  @override
  String get dmFriendRequestSent => 'Solicitud de amistad enviada';

  @override
  String get dmUnblock => 'Desbloquear';

  @override
  String get dmDebugUser => 'Depurar usuario';

  @override
  String get dmDebugChannel => 'Depurar canal';

  @override
  String get dmPinned => 'Chat fijado';

  @override
  String get dmUnpinned => 'Chat desfijado';

  @override
  String get dmMuted => 'Chat silenciado';

  @override
  String get dmUnmuted => 'Sonido de chat activado';

  @override
  String get dmRemoveFriendConfirmTitle => 'Eliminar amigo';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return '¿Estás seguro de que quieres eliminar a $username de tus amigos?';
  }

  @override
  String get dmBlockConfirmTitle => 'Bloquear usuario';

  @override
  String dmBlockConfirmDescription(String username) {
    return '¿Estás seguro de que quieres bloquear a $username? No podrá enviarte mensajes ni solicitudes de amistad.';
  }

  @override
  String get dmFriendRequestSentToast => 'Solicitud de amistad enviada';

  @override
  String get dmFriendRequestFailed => 'No se pudo enviar solicitud de amistad';

  @override
  String get dmAcceptFriendRequestFailed =>
      'No se pudo aceptar la solicitud de amistad';

  @override
  String get dmRemoveFriendFailed => 'No se pudo eliminar de tus amigos';

  @override
  String get dmBlockFailed => 'No se pudo bloquear al usuario';

  @override
  String get dmUnblockFailed => 'No se pudo desbloquear al usuario';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'No se pudo ignorar la solicitud de amistad';

  @override
  String get dmAddFriends => 'Añadir amigos';

  @override
  String get addFriendSheetTitle => 'Añadir amigo';

  @override
  String get addFriendUsernameHint => 'Nombredeusuario#0000';

  @override
  String get addFriendUsernameLabel => 'Nombre de usuario del amigo';

  @override
  String get addFriendSendRequest => 'Enviar solicitud';

  @override
  String get addFriendNoUserFound =>
      'No se encontró ningún usuario con ese nombre de usuario.';

  @override
  String get addFriendInvalidUsername =>
      'Ingresa un nombre de usuario valido (Username#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Solicitud de amistad enviada';

  @override
  String get addFriendClaimTitle => 'Reclama tu cuenta';

  @override
  String get addFriendClaimDescription =>
      'Reclama tu cuenta para enviar solicitudes de amistad.';

  @override
  String get addFriendVerifyTitle => 'Verifica tu correo';

  @override
  String get addFriendVerifyDescription =>
      'Debes verificar tu correo electrónico antes de poder enviar solicitudes de amistad.';

  @override
  String get addFriendVerifyEmail => 'Verificar correo';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Solicitudes de amistad recibidas ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Solicitudes de amistad enviadas ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Solicitud de amistad recibida';

  @override
  String get addFriendOutgoingStatus => 'Solicitud de amistad enviada';

  @override
  String get addFriendViewProfile => 'Ver perfil';

  @override
  String get addFriendAccept => 'Aceptar';

  @override
  String get addFriendIgnore => 'Ignorar';

  @override
  String get addFriendAcceptTitle => 'Aceptar solicitud de amistad';

  @override
  String get addFriendIgnoreTitle => 'Ignorar solicitud de amistad';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return '¿Aceptar solicitud de amistad de $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return '¿Ignorar solicitud de amistad de $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Cancelar solicitud';

  @override
  String get addFriendCancelRequestFailed =>
      'No se pudo cancelar la solicitud de amistad. Inténtalo de nuevo.';

  @override
  String get addFriendNotAcceptingRequests =>
      'No se están aceptando solicitudes de amistad en este momento.';

  @override
  String get addFriendUnblockFirst =>
      'Desbloquea a este usuario para enviar una solicitud de amistad.';

  @override
  String get addFriendCannotSendToSelf =>
      'No puedes enviarte una solicitud de amistad a ti mismo.';

  @override
  String get addFriendAlreadyFriends => 'Ya eres amigo de este usuario.';

  @override
  String get addFriendClaimToSend =>
      'Termina de registrarte para enviar solicitudes de amistad.';

  @override
  String get addFriendSendFailedGeneric =>
      'No se pudo enviar la solicitud de amistad. Inténtalo de nuevo.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Sistema';

  @override
  String get emojiSearchPlaceholder => 'Encuentra el emoji de tus sueños';

  @override
  String get emojiSearchEmpty => 'Ningún emoji coincide con tu búsqueda';

  @override
  String get emojiAutocompleteDefaultLabel => 'Emojis predeterminados';

  @override
  String get emojiFrequentlyUsed => 'Usados frecuentemente';

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
  String get gifPickerTrending => 'GIFs en tendencia';

  @override
  String get gifPickerNoResultsTitle => 'Sin resultados de búsqueda';

  @override
  String get gifPickerNoResultsDescription =>
      'Intenta con otro termino de búsqueda';

  @override
  String get gifPickerLoadFailedTitle => 'No se pudieron cargar los GIFs';

  @override
  String get gifPickerLoadFailedBody =>
      'Revisa tu conexión e inténtalo de nuevo.';

  @override
  String get emojiCategoryPeople => 'Personas';

  @override
  String get emojiCategoryNature => 'Naturaleza';

  @override
  String get emojiCategoryFood => 'Comida y bebida';

  @override
  String get emojiCategoryActivity => 'Actividades';

  @override
  String get emojiCategoryTravel => 'Viajes y lugares';

  @override
  String get emojiCategoryObjects => 'Objetos';

  @override
  String get emojiCategorySymbols => 'Símbolos';

  @override
  String get emojiCategoryFlags => 'Banderas';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Desbloquea $emojiCount de $communityCount con Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Obtener Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'No volver a mostrar esto';

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
      one: '1 comunidad',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Aviso de enlace externo';

  @override
  String get externalLinkWarningLeaving => 'Estás a punto de salir de Fluxer';

  @override
  String get externalLinkWarningDescription =>
      'Los enlaces externos pueden ser peligrosos. Por favor, ten cuidado.';

  @override
  String get externalLinkWarningDestinationUrl => 'URL de destino:';

  @override
  String get externalLinksSectionTitle => 'Enlaces externos';

  @override
  String get externalLinksSectionDescription =>
      'Configurar cómo se manejan los avisos de enlaces externos.';

  @override
  String get externalLinkWarningTrustPrefix => 'Confiar siempre en ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — omitir este aviso la próxima vez';

  @override
  String get externalLinkVisitSite => 'Visitar sitio';

  @override
  String get externalLinkTrustAllLabel =>
      'Confiar en todos los enlaces externos';

  @override
  String get externalLinkStripTrackingLabel =>
      'Eliminar parámetros de seguimiento de las URLs';

  @override
  String get externalLinkStripTrackingDescription =>
      'Eliminar automáticamente los parámetros de seguimiento (como utm_source, fbclid, gclid) de las URLs en los mensajes enviados. Limpia el enlace antes de que llegue a otros usuarios.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      '¿Confiar en todos los enlaces externos?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Esto confiará en todos los enlaces externos y omitirá el aviso para cada dominio. Tus dominios confiables existentes serán reemplazados. Esto es menos seguro.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Confiar en todos';

  @override
  String get externalLinkStopTrustingAllTitle =>
      '¿Dejar de confiar en todos los enlaces?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Se volverán a mostrar los avisos de enlaces externos. Tendrás que añadir los dominios confiables de forma individual.';

  @override
  String get externalLinkStopTrustingAllAction =>
      'Desactivar \'Confiar en todos\'';

  @override
  String get externalLinkTrustedAllDescription =>
      'Todos los enlaces externos son de confianza. No se mostrarán avisos.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Tienes $count dominio(s) confiable(s). Puedes añadir más marcando la casilla al visitar enlaces externos.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Cuando está activado, no se mostrarán avisos de enlaces externos. Esto es menos seguro.';

  @override
  String get imageFileTooLarge =>
      'El archivo de imagen es demasiado grande. Por favor, elige un archivo inferior a 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Los avatares animados requieren Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Los banners animados requieren Plutonium';

  @override
  String get animatedAvifNotSupported => 'Formato AVIF animado no compatible';

  @override
  String get animatedAvifNotSupportedBody =>
      'Aún no se admite el recorte ni la rotación de archivos AVIF animados. Si continúas, se subirá en su formato original.';

  @override
  String get uploadAsIs => 'Subir tal cual';

  @override
  String get croppingAnimatedNotSupported =>
      'Aún no se admite el recorte de imágenes animadas. Se usará la carga original.';

  @override
  String get cropAvatar => 'Recortar avatar';

  @override
  String get cropBanner => 'Recortar banner';

  @override
  String get skip => 'Omitir';

  @override
  String get crop => 'Recortar';

  @override
  String get changeYourFluxerTag => 'Cambiar tu FluxerTag';

  @override
  String get fluxerTagInputLabel => 'FluxerTag';

  @override
  String get fluxerTagDescriptionBase =>
      'Los nombres de usuario solo pueden contener letras (a-z, A-Z), números (0-9) y guiones bajos. Los nombres de usuario no distinguen entre mayúsculas y minúsculas.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Los nombres de usuario solo pueden contener letras (a-z, A-Z), números (0-9) y guiones bajos. Los nombres de usuario no distinguen entre mayúsculas y minúsculas. Puedes elegir cualquier etiqueta de 4 dígitos disponible del #0000 al #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Los nombres de usuario solo pueden contener letras (a-z, A-Z), números (0-9) y guiones bajos. Los nombres de usuario no distinguen entre mayúsculas y minúsculas. Puedes elegir cualquier etiqueta de 4 dígitos disponible del #0001 al #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Entre $min y $max caracteres';
  }

  @override
  String get validationAllowedChars =>
      'Solo letras (a-z, A-Z), números (0-9) y guiones bajos (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Obtén Plutonium para personalizar tu etiqueta o conservarla al cambiar tu nombre de usuario';

  @override
  String get fluxerTagAlreadyTaken => 'FluxerTag ya en uso';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'El FluxerTag $username#$discriminator ya está en uso. Si continúas, se volverá a generar tu discriminador automáticamente.';
  }

  @override
  String get customTagIsTemporary => 'La etiqueta personalizada es temporal';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Tu etiqueta personalizada de 4 dígitos solo está disponible mientras tu suscripción a Plutonium esté activa. Cuando tu suscripción expire el $date, tu etiqueta volverá a ser un número asignado aleatoriamente después de un período de gracia de 3 días.';
  }

  @override
  String get customTagTemporaryBody =>
      'Tu etiqueta personalizada de 4 dígitos solo está disponible mientras tu suscripción a Plutonium esté activa. Cuando tu suscripción expire, tu etiqueta volverá a ser un número asignado aleatoriamente después de un período de gracia de 3 días.';

  @override
  String get iUnderstandContinue => 'Entendido, continuar';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Si guardas este FluxerTag, tu etiqueta personalizada de 4 dígitos volverá a ser un número aleatorio cuando finalice tu suscripción a Plutonium. Si tu suscripción no se renueva, tendrás un período de gracia de 3 días antes de que cambie la etiqueta.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Tu etiqueta personalizada de 4 dígitos (#$discriminator) está activa mientras tu suscripción a Plutonium esté activa. Si tu suscripción finaliza o no se renueva después de un período de gracia de 3 días, tu etiqueta volverá a ser un número aleatorio.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Personaliza tu etiqueta de 4 dígitos o consérvala al cambiar tu nombre de usuario';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Tu prueba de Plutonium expira el $date. Actualiza para conservar tu etiqueta personalizada y obtener una insignia en tu perfil.';
  }

  @override
  String get premiumTrialActive =>
      'Estás en una prueba de Plutonium. Actualiza para conservar tu etiqueta personalizada y obtener una insignia en tu perfil.';

  @override
  String get fluxerTagUpdated => 'FluxerTag actualizado';

  @override
  String get fluxerTagUpdateFailed =>
      'No se pudo actualizar el FluxerTag. Inténtalo de nuevo.';

  @override
  String get continueAction => 'Continuar';

  @override
  String get profileCustomizationTitle => 'Personalización del perfil';

  @override
  String get profileCustomizationDescription =>
      'Edita la apariencia de tu perfil y ve una vista previa en vivo';

  @override
  String get usernameLabel => 'Nombre de usuario';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Reclama tu cuenta para cambiar tu FluxerTag';

  @override
  String get changeFluxerTag => 'Cambiar FluxerTag';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Personaliza tu etiqueta de 4 dígitos (#$discriminator) a tu gusto con Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Cambia tu nombre de usuario y tu etiqueta de 4 dígitos';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Tu etiqueta personalizada (#$discriminator) está vinculada a tu suscripción de Plutonium y volverá a ser una etiqueta aleatoria si caduca.';
  }

  @override
  String get displayNameLabel => 'Nombre a mostrar';

  @override
  String get pronounsLabel => 'Pronombres';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Cambiar avatar';

  @override
  String get removeAvatar => 'Eliminar avatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Máximo 10 MB. Recomendado: 512 × 512 px';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get changeBanner => 'Cambiar banner';

  @override
  String get removeBanner => 'Eliminar banner';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Max 10MB. Minimum: 680×240px (17:6)';

  @override
  String get accentColorLabel => 'Color de acento';

  @override
  String get accentColorDescription =>
      'Personaliza el borde y el color del banner de tu perfil';

  @override
  String get aboutMeLabel => 'Acerca de mí';

  @override
  String get aboutMeHelperText => 'Puedes usar enlaces, emojis y Markdown.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle =>
      'Privacidad de la insignia de Plutonium';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Controla cómo se muestra tu insignia de Plutonio a los demás';

  @override
  String get hidePlutoniumBadgeLabel =>
      'Ocultar la insignia de Plutonium por completo';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Ocultar completamente tu insignia de Plutonium a otros usuarios';

  @override
  String get hidePlutoniumPurchaseDate =>
      'Ocultar la fecha de compra de Plutonium';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Ocultar fecha de compra de Plutonium ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Eliminar la fecha de compra de Plutonium de tu insignia';

  @override
  String get maskVisionaryAsSubscription =>
      'Ocultar la insignia de Visionario como suscripción';

  @override
  String get maskVisionaryDescription =>
      'Mostrar Visionario como una suscripción normal';

  @override
  String get hideVisionaryIdBadge => 'Ocultar ID de la insignia de Visionario';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Ocultar ID de Visionario (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription =>
      'Eliminar ID de tu insignia de Visionario';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Estás en una prueba de Plutonium; tu suscripción comienza el $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Tu suscripción comenzará automáticamente cuando finalice tu prueba. No es necesario realizar ninguna acción.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Estás en una prueba de Plutonium que finaliza el $date';
  }

  @override
  String get premiumTrialActiveProfile => 'Estás en una prueba de Plutonium';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Máx. 10 MB. Recomendado: 512×512 px. Los avatares animados (GIF) requieren Plutonio.';

  @override
  String get bannerPlutoniumUpsell =>
      'Personaliza tu perfil con una imagen de fondo, estática o animada, para que destaque.';

  @override
  String get getPlutonium => 'Obtener Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Las compras integradas aún no están disponibles en esta plataforma. ¡Mantente atento, muy pronto estarán aquí!';

  @override
  String get profilePreviewLabel => 'Vista previa';

  @override
  String get profilePreviewMessage => 'Mensaje';

  @override
  String get profilePreviewMemberSince => 'Miembro de Fluxer desde';

  @override
  String get unclaimedAccountTitle => 'Cuenta sin reclamar';

  @override
  String get unclaimedAccountDescription =>
      'Tu cuenta aún no ha sido activada. Sin un correo electrónico y una contraseña, podrías perder el acceso. Activa tu cuenta ahora para protegerla.';

  @override
  String get claimAccount => 'Activar cuenta';

  @override
  String get profileTypeLabel => 'Tipo de perfil';

  @override
  String get profileTypeGlobal => 'Perfil global';

  @override
  String get profileTypeGuildDescription =>
      'Estás editando tu perfil de esta comunidad. Este perfil solo será visible aquí y sobrescribirá tu perfil.';

  @override
  String get communityNicknameLabel => 'Apodo en la comunidad';

  @override
  String get perGuildPremiumUpsellText =>
      'Personalizar tu avatar, banner, color de acento y biografía para comunidades individuales requiere Plutonium. El apodo y los pronombres de la comunidad son gratuitos para todos.';

  @override
  String get avatarModeInherit => 'Usar perfil global';

  @override
  String get avatarModeCustom => 'Usar imagen personalizada';

  @override
  String get avatarModeUnset => 'No mostrar';

  @override
  String get profileSavedToast => 'Perfil actualizado';

  @override
  String get profileEditButton => 'Editar perfil';

  @override
  String get profileNoteLabel => 'Nota';

  @override
  String get profileNoteVisibility => '(Solo visible para ti)';

  @override
  String get profileNoteEmpty => 'Aún sin notas.';

  @override
  String get sudoTitle => 'Verifica tu identidad';

  @override
  String get sudoDescription =>
      'Esta acción requiere verificación para continuar.';

  @override
  String get sudoAuthenticatorCode => 'Código de autenticación';

  @override
  String get sudoMethodPassword => 'Contraseña';

  @override
  String get sudoMethodTotp => 'Autenticador';

  @override
  String get sudoVerificationFailed =>
      'Error de verificación. Por favor, inténtalo de nuevo.';

  @override
  String get securityAccountTitle => 'Cuenta';

  @override
  String get securityAccountDescription =>
      'Gestiona tu correo electrónico, contraseña y la configuración de tu cuenta';

  @override
  String get securitySectionTitle => 'Seguridad';

  @override
  String get securitySectionDescription =>
      'Protege tu cuenta con autenticación de dos factores y llaves de acceso';

  @override
  String get securityLoginEmailSectionTitle => 'Ajustes de correo electrónico';

  @override
  String get securityLoginEmailSectionDescription =>
      'Gestiona la dirección de correo electrónico que usas para iniciar sesión en Fluxer';

  @override
  String get securityLoginEmailAddressLabel => 'Correo electrónico';

  @override
  String get securityLoginNoEmailSet => 'Sin correo electrónico';

  @override
  String get securityLoginChangeEmail => 'Cambiar correo electrónico';

  @override
  String get securityLoginAddEmail => 'Añadir correo electrónico';

  @override
  String get securityLoginReveal => 'Revelar';

  @override
  String get securityLoginHide => 'Ocultar';

  @override
  String get securityLoginPasswordSectionTitle => 'Contraseña';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Cambia tu contraseña para mantener tu cuenta segura';

  @override
  String get securityLoginCurrentPasswordLabel => 'Contraseña actual';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Última modificación: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Última modificación: Nunca';

  @override
  String get securityLoginNoPasswordSet => 'Sin contraseña establecida';

  @override
  String get securityLoginChangePassword => 'Cambiar contraseña';

  @override
  String get securityLoginSetPassword => 'Establecer contraseña';

  @override
  String get passwordChangeTitle => 'Cambiar contraseña';

  @override
  String get passwordChangeIntroDescription =>
      'Te enviaremos un código de verificación a tu correo electrónico para confirmar tu identidad antes de cambiar tu contraseña.';

  @override
  String get passwordChangeStart => 'Iniciar';

  @override
  String get passwordChangeVerifyTitle => 'Verifica tu correo electrónico';

  @override
  String get passwordChangeVerifyDescription =>
      'Introduce el código de verificación que enviamos a tu dirección de correo electrónico.';

  @override
  String get passwordChangeVerificationCode => 'Código de verificación';

  @override
  String get passwordChangeVerify => 'Verificar';

  @override
  String get passwordChangeNewPasswordTitle => 'Establecer nueva contraseña';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Introduce tu nueva contraseña a continuación.';

  @override
  String get passwordChangeNewPassword => 'Nueva contraseña';

  @override
  String get passwordChangeConfirmPassword => 'Confirmar nueva contraseña';

  @override
  String get passwordChangeSubmit => 'Cambiar contraseña';

  @override
  String get passwordChangeSuccess => 'Contraseña actualizada';

  @override
  String get passwordChangePasswordsDoNotMatch =>
      'Las contraseñas no coinciden';

  @override
  String get passwordChangeInvalidCode => 'Código invalido o caducado';

  @override
  String get emailChangeTitle => 'Cambiar correo electrónico';

  @override
  String get emailChangeIntroDescription =>
      'Te enviaremos códigos de verificación para confirmar tu identidad antes de cambiar tu dirección de correo electrónico.';

  @override
  String get emailChangeStart => 'Iniciar';

  @override
  String get emailChangeVerifyOriginalTitle =>
      'Verificar correo electrónico actual';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Ingresa el código de verificación enviado a tu correo electrónico actual.';

  @override
  String get emailChangeNewEmailTitle => 'Ingresa el nuevo correo electrónico';

  @override
  String get emailChangeNewEmailDescription =>
      'Ingresa la nueva dirección de correo electrónico que desees usar.';

  @override
  String get emailChangeNewEmailLabel => 'Nuevo correo electrónico';

  @override
  String get emailChangeNewEmailSubmit => 'Enviar código de verificación';

  @override
  String get emailChangeVerifyNewTitle => 'Verificar nuevo correo electronico';

  @override
  String get emailChangeVerifyNewDescription =>
      'Ingresa el código de verificación enviado a tu nuevo correo electrónico.';

  @override
  String get emailChangeSuccess => 'Se cambió el correo electrónico';

  @override
  String get emailChangeInvalidCode => 'Código inválido o vencido';

  @override
  String get resend => 'Volver a enviar';

  @override
  String resendCountdown(int seconds) {
    return 'Volver a enviar (${seconds}s)';
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
  String get delete => 'Borrar';

  @override
  String get save => 'Guardar';

  @override
  String get securityTfaSectionTitle => 'Verificación en dos pasos';

  @override
  String get securityTfaSectionDescription =>
      'Añadir una capa adicional de seguridad a tu cuenta';

  @override
  String get securityTfaAuthenticatorApp => 'Aplicación de autenticación';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'La verificación en dos pasos está activada';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Usa una aplicación de autenticación para generar códigos de autenticación en dos pasos';

  @override
  String get securityTfaBackupCodes => 'Códigos de respaldo';

  @override
  String get securityTfaBackupCodesDescription =>
      'Consulta y gestiona tus códigos de respaldo para la recuperación de la cuenta';

  @override
  String get securityTfaViewCodes => 'Ver códigos';

  @override
  String get securityPasskeysSectionTitle => 'Llaves de acceso';

  @override
  String get securityPasskeysSectionDescription =>
      'Usa llaves de acceso para iniciar sesión sin contraseña y para la autenticación en dos pasos';

  @override
  String get securityPasskeysRegistered => 'Llaves de acceso registradas';

  @override
  String get securityPasskeysNone => 'No hay llaves de acceso registradas';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# llaves de acceso',
      one: '# llave de acceso',
    );
    return '$_temp0 registradas (máx. 10)';
  }

  @override
  String get securityPasskeysAdd => 'Añadir llave de acceso';

  @override
  String securityPasskeysAdded(String date) {
    return 'Añadido el: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Último uso: $date';
  }

  @override
  String get securityPasskeysRename => 'Renombrar';

  @override
  String get securityPasskeysDeleteTitle => 'Eliminar llave de acceso';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return '¿Estás seguro de que quieres eliminar la llave de acceso \"$name\"?';
  }

  @override
  String get securityPasskeyNameTitle => 'Nombre de llave de acceso';

  @override
  String get securityPasskeyNameLabel => 'Nombre de la llave de acceso';

  @override
  String get securityPasskeyNameHint =>
      'por ejemplo, YubiKey, iPhone, Computadora del trabajo';

  @override
  String get securityPhoneSectionTitle => 'Número de teléfono';

  @override
  String get securityPhoneSectionDescription =>
      'Manage your phone number for SMS two-factor authenticatio.';

  @override
  String get securityPhoneLabel => 'Número de teléfono';

  @override
  String get securityPhoneNone =>
      'Add a phone number to enable SMS two-factor authentication.';

  @override
  String get securityPhoneAdd => 'Añadir teléfono';

  @override
  String get securityPhoneRemove => 'Eliminar';

  @override
  String get securityPhoneRemoveTitle => 'Eliminar número de teléfono';

  @override
  String get securityPhoneRemoveDescription =>
      '¿Seguro que quieres eliminar tu número de teléfono?';

  @override
  String get securityPhoneRemoved => 'Número de teléfono eliminado';

  @override
  String get securityClaimTitle => 'Funciones de seguridad';

  @override
  String get securityClaimDescription =>
      'Reclama tu cuenta para acceder a funciones de seguridad como la autenticación de dos factores y las llaves de acceso.';

  @override
  String get securityVerifyEmailRequired =>
      'Debes verificar tu correo electrónico antes de poder configurar la autenticación de dos factores, llaves de acceso o la verificación por SMS.';

  @override
  String get totpEnableTitle => 'Configurar app de autenticación';

  @override
  String get totpEnableDescription =>
      'Escanea el código QR con tu app de autenticación para generar los códigos de la autenticación de dos factores.';

  @override
  String get totpEnableCodeLabel => 'Código';

  @override
  String get totpEnableCodeHint =>
      'Ingresa el código de 6 dígitos de tu app de autenticación';

  @override
  String get totpEnableSuccess => 'Se activó la autenticación de dos factores';

  @override
  String get totpDisableTitle => 'Eliminar app de autenticación';

  @override
  String get totpDisableDescription =>
      'Ingresa el código de 6 dígitos de tu app de autenticación para desactivar la autenticación de dos factores.';

  @override
  String get totpDisableSuccess =>
      'Se desactivó la autenticación de dos factores';

  @override
  String get backupCodesTitle => 'Códigos de respaldo';

  @override
  String get backupCodesWarning =>
      'Si pierdes el acceso a tu app de autenticación y no tienes estos códigos, se te bloqueara el acceso a tu cuenta de forma permanente. Descárgalos o cópialos ahora y guárdalos en un lugar seguro.';

  @override
  String get backupCodesDownload => 'Descargar';

  @override
  String get backupCodesCopy => 'Copiar';

  @override
  String get backupCodesCopied =>
      'Códigos de respaldo copiados al portapapeles';

  @override
  String get backupCodesAcknowledge =>
      'Descargué o copié mis códigos de respaldo y los guardé en un lugar seguro.';

  @override
  String get backupCodesDone => 'Listo';

  @override
  String get backupCodesViewTitle => 'Ver códigos de respaldo';

  @override
  String get backupCodesViewDescription =>
      'Es posible que se requiera una verificación antes de ver tus códigos de respaldo.';

  @override
  String get phoneAddTitle => 'Añadir número de teléfono';

  @override
  String get phoneAddLabel => 'Número de teléfono';

  @override
  String get phoneAddHint => 'Ingresa tu número de teléfono';

  @override
  String get phoneAddFooter =>
      'Ingresa tu número de teléfono. Te enviaremos un código de verificación por SMS.';

  @override
  String get phoneAddSendCode => 'Enviar código';

  @override
  String get phoneVerifyTitle => 'Verificar número de teléfono';

  @override
  String get phoneVerifyDescription =>
      'Ingresa el código de verificación enviado a tu número de teléfono.';

  @override
  String get phoneAddSuccess => 'Número de teléfono añadido';

  @override
  String get dangerZoneSectionTitle => 'Zona de peligro';

  @override
  String get dangerZoneSectionDescription =>
      'Acciones irreversibles y destructivas';

  @override
  String get dangerZoneDisableTitle => 'Desactivar cuenta';

  @override
  String get dangerZoneDisableDescription =>
      'Desactiva tu cuenta temporalmente. Puedes reactivarla más tarde volviendo a iniciar sesión.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Al desactivar tu cuenta, se cerrarán todas tus sesiones. Puedes volver a activarla en cualquier momento iniciando sesión de nuevo.';

  @override
  String get dangerZoneDeleteTitle => 'Eliminar cuenta';

  @override
  String get dangerZoneDeleteDescription =>
      'Elimina tu cuenta y todos los datos asociados de forma permanente. Esta acción no se puede deshacer.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Cancela tu suscripción activa de Plutonium en los ajustes de Plutonium antes de eliminar tu cuenta.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount =>
      'No se puede eliminar la cuenta';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'No puedes eliminar tu cuenta mientras seas propietario de comunidades. Transfiere la propiedad de las siguientes comunidades primero:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'y $count más';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Para transferir la propiedad, ve a $settingsPath y usa la opción de transferir propiedad.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      '¿Estas seguro de que quieres eliminar tu cuenta? Esta acción programara tu cuenta para su eliminación permanente.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Puedes cancelar el proceso de eliminación dentro de los próximos 14 días';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Después de 14 días, tu cuenta se eliminará de forma permanente';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Una vez procesada la eliminación, no podrás recuperar el acceso a tu cuenta';

  @override
  String get dangerZoneDeleteBullet4 =>
      'No podrás eliminar tus mensajes enviados después de que se elimine tu cuenta';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Si primero quieres exportar tus datos o eliminar tus mensajes, visita la sección Panel de privacidad en los Ajustes de usuario antes de proceder.';

  @override
  String get claimAccountTitle => 'Reclama tu cuenta';

  @override
  String get claimAccountDescription =>
      'Reclama tu cuenta agregando un correo electrónico y una contraseña. Te enviaremos un código de verificación para confirmar tu correo antes de terminar.';

  @override
  String get claimAccountEmailLabel => 'Correo electrónico';

  @override
  String get claimAccountPasswordLabel => 'Contraseña';

  @override
  String get claimAccountSendCode => 'Enviar código';

  @override
  String get claimAccountVerifyDescription =>
      'Ingresa el código que enviamos a tu correo para verificarlo. Tu contraseña se configurará una vez que se confirme el código.';

  @override
  String get claimAccountSuccess => 'Cuenta reclamada con éxito';

  @override
  String get importantInformation => 'Información importante:';

  @override
  String get genericError => 'Ocurrió un error';

  @override
  String get invalidCode => 'Código inválido';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace $count años',
      one: 'hace 1 año',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace $count meses',
      one: 'hace 1 mes',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace $count días',
      one: 'hace 1 día',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace $count horas',
      one: 'hace 1 hora',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace $count minutos',
      one: 'hace 1 minuto',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'Hace un momento';

  @override
  String get authorizedAppsTitle => 'Aplicaciones autorizadas';

  @override
  String get authorizedAppsDescription =>
      'Estas aplicaciones tienen acceso a tu cuenta de Fluxer.';

  @override
  String get authorizedAppsEmptyTitle => 'Aplicaciones no autorizadas';

  @override
  String get authorizedAppsEmptyDescription =>
      'No has autorizado ninguna aplicación para que acceda a tu cuenta.';

  @override
  String get authorizedAppsLoadError =>
      'No se pudieron cargar las aplicaciones autorizadas';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Autorizada el $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Permisos concedidos';

  @override
  String get authorizedAppsRevoke => 'Revocar';

  @override
  String get authorizedAppsRevokeTitle => 'Revocar acceso de la aplicación';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return '¿Seguro que quieres revocar el acceso de $appName? Esta aplicación ya no tendrá acceso a tu cuenta.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Acceder a la información básica de tu perfil (nombre de usuario, avatar, etc.)';

  @override
  String get authorizedAppsScopeEmail =>
      'Ver tu dirección de correo electrónico';

  @override
  String get authorizedAppsScopeGuilds =>
      'Ver las comunidades de las que eres miembro';

  @override
  String get authorizedAppsScopeConnections => 'Ver tus cuentas conectadas';

  @override
  String get authorizedAppsScopeBot =>
      'Añadir un bot a una comunidad con los permisos solicitados';

  @override
  String get authorizedAppsScopeAdmin =>
      'Acceder a las funciones administrativas de la API';

  @override
  String get privacyPendingDeletionTitle => 'Eliminación pendiente';

  @override
  String get blockedUsersTitle => 'Usuarios bloqueados';

  @override
  String get blockedUsersDescription =>
      'Los usuarios bloqueados no pueden enviarte solicitudes de amistad ni mensajes directos.';

  @override
  String get blockedUsersEmptyTitle => 'No hay usuarios bloqueados';

  @override
  String get blockedUsersEmptyDescription => 'Aún no has bloqueado a nadie.';

  @override
  String get blockedUsersLoadError =>
      'No se pudieron cargar los usuarios bloqueados';

  @override
  String get blockedUsersUnblock => 'Desbloquear';

  @override
  String get blockedUsersUnblockTitle => 'Desbloquear usuario';

  @override
  String blockedUsersUnblockDescription(String username) {
    return '¿Seguro que quieres desbloquear a $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Copiar FluxerTag';

  @override
  String get blockedUsersCopyId => 'Copiar ID de usuario';

  @override
  String get userProfileLoadError => 'No se pudo cargar el perfil';

  @override
  String get userProfileRetry => 'Reintentar';

  @override
  String get userProfileMessage => 'Mensaje';

  @override
  String get userProfileVoiceCall => 'Llamada de voz';

  @override
  String get userProfileVideoCall => 'Videollamada';

  @override
  String get userProfileEditProfile => 'Editar perfil';

  @override
  String get userProfileStaffBadgeTooltip => 'Personal de Fluxer';

  @override
  String get userProfileCtpBadgeTooltip => 'Equipo de Comunidad de Fluxer';

  @override
  String get userProfilePartnerBadgeTooltip => 'Socio de Fluxer';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Cazador de errores de Fluxer';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Plutonium de Fluxer';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Suscriptor de Plutonium de Fluxer desde $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Visionario de Fluxer';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Visionario de Fluxer desde $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'ID de Visionario #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Amigos en común ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Comunidades en común ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Amigos en común';

  @override
  String get userProfileMutualCommunitiesTitle => 'Comunidades en común';

  @override
  String get userProfileNoMutualFriends => 'No se encontraron amigos en común.';

  @override
  String get userProfileNoMutualCommunities =>
      'No se encontraron comunidades en común.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Apodo: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Abrir chat';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Bloqueaste a $username. No podrás enviar mensajes a menos que lo desbloquees.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Desbloquear';

  @override
  String get userProfileOpenDm => 'Abrir chat';

  @override
  String get userProfileNoteTitle => 'Nota';

  @override
  String get userProfileNoteVisibility => '(Solo visible para ti)';

  @override
  String get userProfileNoteSave => 'Guardar';

  @override
  String get userProfileNoteDelete => 'Eliminar';

  @override
  String get userProfileNoteEmpty => 'Haz clic para agregar una nota';

  @override
  String get userProfileMemberSince => 'Miembro desde';

  @override
  String get userProfileAboutMe => 'Sobre mí';

  @override
  String get userProfileCopyUsername => 'Copiar nombre de usuario';

  @override
  String get userProfileCopyUserId => 'Copiar ID de usuario';

  @override
  String get userProfileViewMainProfile => 'Ver perfil principal';

  @override
  String get userProfileViewCommunityProfile => 'Ver perfil de la comunidad';

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
    return '¿Estas seguro de que quieres bloquear a $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Desbloquear usuario';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return '¿Estas seguro de que quieres desbloquear a $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Eliminar amigo';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return '¿Estas seguro de que quieres eliminar a $username de tus amigos?';
  }

  @override
  String get userProfileFailedOpenDm => 'No se pudo abrir el chat';

  @override
  String get userProfileFailedSaveNote => 'No se pudo guardar la nota';

  @override
  String get userProfileActionFailed => 'La acción falló, intenta de nuevo';

  @override
  String get userProfileChangeNickname => 'Cambiar apodo';

  @override
  String get userProfileKick => 'Expulsar';

  @override
  String get userProfileBan => 'Banear';

  @override
  String get userProfileTimeout => 'Silenciar';

  @override
  String get userProfileRemoveTimeout => 'Remover silencio';

  @override
  String get userProfileTransferOwnership => 'Transferir propiedad';

  @override
  String get userProfileReportUser => 'Reportar usuario';

  @override
  String get userProfileReportMessage => 'Reportar mensaje';

  @override
  String userProfileKickConfirmTitle(String username) {
    return '¿Expulsar a $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return '¿Estas seguro de quieres expulsar a $username? Podrá volver a unirse con una nueva invitación.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => '¿Remover silencio?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Al remover el silencio, $username podrá volver a enviar mensajes, reaccionar y unirse a canales de voz.';
  }

  @override
  String get userProfileTransferConfirmTitle => '¿Transferir la propiedad?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return '¿Transferir la propiedad de esta comunidad a $username? Esta acción es irreversible y perderás todos tus privilegios de dueño.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Banear a $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Duracion del baneo';

  @override
  String get userProfileBanCustomSecondsLabel =>
      'Duración personalizada (segundos)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Cualquier valor de $min a $max segundos';
  }

  @override
  String get userProfileBanDeleteHistoryLabel =>
      'Eliminar historial de mensajes';

  @override
  String get userProfileBanDeleteNone => 'No eliminar nada';

  @override
  String get userProfileBanDelete24h => 'Últimas 24 horas';

  @override
  String get userProfileBanDelete7d => 'Últimos 7 días';

  @override
  String get userProfileBanReasonLabel => 'Razón (opcional)';

  @override
  String get userProfileBanReasonHint => 'Escribe el motivo del baneo';

  @override
  String get userProfileBanSubmit => 'Banear miembro';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Silenciar a $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Duración del silencio';

  @override
  String get userProfileTimeoutSubmit => 'Silenciar miembro';

  @override
  String get userProfileNicknameLabel => 'Apodo';

  @override
  String get userProfileNicknameHint => 'Escribe un apodo';

  @override
  String get userProfileNicknameSave => 'Guardar';

  @override
  String userProfileKickSuccess(String username) {
    return 'Se ha expulsado a $username';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Se ha baneado a $username';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Se ha silenciado a $username';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Se ha eliminado el silencio a $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Apodo actualizado';

  @override
  String get userProfileTransferSuccess => 'Propiedad transferida';

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
  String get iarReportUserTitle => 'Reportar usuario';

  @override
  String get iarReasonInappropriateProfile => 'Perfil inapropiado';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'El perfil de este usuario contiene contenido inapropiado';

  @override
  String typingIndicatorOne(String name) {
    return 'Escribiendo $name...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return 'Escribiendo $name1 y $name2...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return 'Escribiendo $name1, $name2 y $name3...';
  }

  @override
  String get typingIndicatorMultiple => 'Varias personas están escribiendo...';

  @override
  String get typingIndicatorHandful =>
      'Un puñado de guerreros del teclado se están reuniendo...';

  @override
  String get typingIndicatorSymphony =>
      'Una sinfonía de teclas chocando está en marcha...';

  @override
  String get typingIndicatorFiesta =>
      'Esto es una auténtica fiesta de escritura';

  @override
  String get typingIndicatorApocalypse =>
      'Vaya, es un apocalipsis de escritura';

  @override
  String systemJoinGladYoureHere(String username) {
    return '¡Nos alegra tenerte aquí, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return '¡Bienvenido, $username! Siéntete como en casa.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return '¡Hola, $username! Nos alegra tenerte aquí.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return '¡Hola, $username! Únete cuando estés listo.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return '¡Hola $username, nos alegra verte aquí!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return '¡Hola, $username! Esperamos que disfrutes tu estancia.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return '¡Hola, $username, bienvenido a bordo!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return '¡Me alegra que hayas llegado, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return '¡Bienvenido, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return '¡Bienvenido, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return '¡Bienvenido, $username! Nos alegra que estés aquí.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return '¡Bienvenido, $username! Esperamos que disfrutes tu tiempo aquí.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return '¡Bienvenido, $username! Tu próxima conversación empieza aquí.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Bienvenido, $username. Estamos felices de tenerte aquí.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return '¡Qué bueno verte, $username! Bienvenido.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return '¡Estás aquí, $username! Qué bueno tenerte con nosotros.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return '¡Has llegado, $username! Empecemos.';
  }

  @override
  String get relativeTimeShortNow => 'ahora';

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
  String get linkedDevicesTitle => 'Mis dispositivos';

  @override
  String get linkedDevicesDescription =>
      'Consulta todos los dispositivos que han iniciado sesión actualmente en tu cuenta. Revoca cualquier sesión que no reconozcas.';

  @override
  String get linkedDevicesCurrentDevice => 'Dispositivo actual';

  @override
  String get linkedDevicesOtherDevices => 'Otros dispositivos';

  @override
  String get linkedDevicesEnterSelection => 'Entrar en modo de selección';

  @override
  String get linkedDevicesExitSelection => 'Salir del modo de selección';

  @override
  String get linkedDevicesSelectAll => 'Seleccionar todo';

  @override
  String get linkedDevicesClearSelection => 'Borrar selección';

  @override
  String get linkedDevicesRevokeTooltip => 'Revocar dispositivo';

  @override
  String get linkedDevicesSignOutAll =>
      'Cerrar sesión en todos los demás dispositivos';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cerrar sesión en $count dispositivos',
      one: 'Cerrar sesión en 1 dispositivo',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cerrar sesión en $count dispositivos',
      one: 'Cerrar sesión en 1 dispositivo',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Cerrar sesión en todos los demás dispositivos';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Esto cerrará la sesión de los dispositivos seleccionados en tu cuenta. Deberás iniciar sesión de nuevo en esos dispositivos.',
      one:
          'Esto cerrará la sesión del dispositivo seleccionado en tu cuenta. Deberás iniciar sesión de nuevo en ese dispositivo.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Esto cerrará la sesión de los dispositivos seleccionados en tu cuenta. Deberás iniciar sesión de nuevo en esos dispositivos.';

  @override
  String get linkedDevicesSignOutConfirm => 'Continuar';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Tendrás que volver a iniciar sesión en todos los dispositivos donde se cerró la sesión';

  @override
  String get linkedDevicesLoadErrorTitle => 'Error de red';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Estamos teniendo problemas para conectarnos al continuo espacio-temporal. Por favor, revisa tu conexión e inténtalo de nuevo.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dispositivos revocados',
      one: 'Dispositivo revocado',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'No se pudo cerrar la sesión. Inténtalo de nuevo.';

  @override
  String get linkedDevicesUnknownOs => 'SO desconocido';

  @override
  String get linkedDevicesUnknownPlatform => 'Plataforma desconocida';

  @override
  String slowmodeLabel(String duration) {
    return 'modo lento de $duration';
  }

  @override
  String get slowmodeTooltipActive =>
      'Estás en modo lento. Por favor, espera antes de enviar otro mensaje.';

  @override
  String get slowmodeTooltipImmune =>
      'El modo lento está activado, pero eres inmune.';

  @override
  String get channelNoSendPermissionHint =>
      'No puedes enviar mensajes en este canal.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Anuncios del sistema del personal de $productName. No puedes responder aquí.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'La mensajería se ha pausado temporalmente en esta comunidad.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Tienes un tiempo de espera. La mensajería, las reacciones y la voz están pausadas hasta que expire el tiempo de espera.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Necesitas reclamar tu cuenta para enviar mensajes en esta comunidad.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Necesitas verificar tu correo electrónico para enviar mensajes en esta comunidad.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Tu cuenta es demasiado nueva para enviar mensajes en esta comunidad.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'No has sido miembro de esta comunidad el tiempo suficiente para enviar mensajes.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Necesitas verificar un número de teléfono para enviar mensajes en esta comunidad.';

  @override
  String get channelComposerBarrierVerifyEmail =>
      'Verificar correo electrónico';

  @override
  String get channelComposerBarrierVerifyPhone => 'Verificar teléfono';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Demasiados archivos adjuntos (máx. $max)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'Uno o más archivos superan el límite de tamaño';

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Esos archivos son demasiado grandes para enviarlos juntos';

  @override
  String get chatAttachmentDropToUpload => 'Suelta los archivos para subirlos';

  @override
  String get chatAttachmentDropToSend =>
      'Suelta los archivos para enviarlos ahora';

  @override
  String get chatAttachmentSendVoiceMessage => 'Enviar mensaje de voz';

  @override
  String get voiceMessageTitle => 'Mensaje de voz';

  @override
  String get voiceMessageHoldHint =>
      'Mantén presionado para grabar. Desliza hacia arriba para bloquear o suelta para enviar.';

  @override
  String get voiceMessageDiscard => 'Descartar mensaje de voz';

  @override
  String get voiceMessageSend => 'Enviar mensaje de voz';

  @override
  String get voiceMessageMicPermissionDenied =>
      'No se puede iniciar la grabación. Permite el acceso al micrófono.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'La grabación de voz no es compatible con este dispositivo.';

  @override
  String get voiceMessageMicInUse =>
      'Sal de la llamada para enviar un mensaje de voz.';

  @override
  String get voiceMessageRecordingFailed =>
      'Error al grabar. Inténtalo de nuevo.';

  @override
  String get voiceMessageSendFailed =>
      'No se puede enviar el mensaje de voz. Inténtalo de nuevo.';

  @override
  String get voiceMessageRecordingHint =>
      'Habla ahora. Presiona Detener cuando termines; podrás editar el mensaje después.';

  @override
  String get voiceMessageReviewHint =>
      'Arrastra los controladores para recortar, luego presiona Enviar.';

  @override
  String get voiceMessageStop => 'Detener';

  @override
  String get voiceMessageStartRecording => 'Iniciar grabación';

  @override
  String get voiceMessageRerecord => 'Volver a grabar';

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

    return 'La selección debe durar al menos $secondsString segundos.';
  }

  @override
  String get chatAttachmentEditTitle => 'Editar archivo adjunto';

  @override
  String get chatAttachmentFilenameLabel => 'Nombre del archivo';

  @override
  String get chatAttachmentDescriptionLabel => 'Descripción';

  @override
  String get chatAttachmentDescriptionHint => 'Texto alternativo opcional';

  @override
  String get chatAttachmentSpoilerLabel => 'Marcar como spoiler';

  @override
  String get chatAttachmentRemove => 'Eliminar archivo adjunto';

  @override
  String get chatAttachmentDownload => 'Descargar';

  @override
  String get chatAttachmentExpiredTooltip => 'El archivo adjunto ha caducado';

  @override
  String get chatAttachmentSourceGallery => 'Galería';

  @override
  String get chatAttachmentSourceCamera => 'Cámara';

  @override
  String get chatAttachmentSourceBrowse => 'Explorar archivos';

  @override
  String get chatAttachmentPasteTooltip => 'Pegar imagen del portapapeles';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Revelar spoiler';

  @override
  String get matureMediaRevealButton => 'Revelar';

  @override
  String get matureMediaRevealHint => 'Haz clic para revelar';

  @override
  String get matureContentTitle => 'Contenido para adultos';

  @override
  String get matureCommunityTitle => 'Comunidad para adultos';

  @override
  String get matureCategoryTitle => 'Categoría para adultos';

  @override
  String get matureChannelTitle => 'Canal para adultos';

  @override
  String get communityContentWarningTitle =>
      'Advertencia de contenido de la comunidad';

  @override
  String get categoryContentWarningTitle =>
      'Advertencia de contenido de la categoría';

  @override
  String get channelContentWarningTitle => 'Advertencia de contenido del canal';

  @override
  String get defaultContentWarningBody =>
      'Este contenido contiene material sensible.';

  @override
  String get matureCommunityBody =>
      'Esta comunidad está marcada como contenido para adultos y puede incluir material inapropiado para algunos usuarios.';

  @override
  String get matureCategoryBody =>
      'Esta categoría está marcada como contenido para adultos y puede incluir material inapropiado para algunos usuarios.';

  @override
  String get matureChannelBody =>
      'Este canal está marcado como contenido para adultos y puede incluir material inapropiado para algunos usuarios.';

  @override
  String get matureVoiceChannelBody =>
      'Este canal de voz está marcado como contenido para adultos y puede incluir material inapropiado para algunos usuarios.';

  @override
  String get matureLinkChannelBody =>
      'Este canal de enlaces está marcado como contenido para adultos y puede abrir material que podría resultar inapropiado para algunos usuarios.';

  @override
  String get matureCommunityUnavailableBody =>
      'Esta comunidad para adultos no está disponible para tu cuenta.';

  @override
  String get matureCategoryUnavailableBody =>
      'Esta categoría para adultos no está disponible para tu cuenta.';

  @override
  String get matureChannelUnavailableBody =>
      'Este canal para adultos no está disponible para tu cuenta.';

  @override
  String get matureContentProceedButton => 'Continuar';

  @override
  String get matureContentUnderstandButton => 'Ententido';

  @override
  String get matureContentOpenLinkButton => 'Abrir enlace';

  @override
  String get sensitiveContentSectionTitle => 'Contenido sensible';

  @override
  String get sensitiveContentSectionDescription =>
      'Controla cómo se filtra el contenido para adultos o sensible en diferentes contextos';

  @override
  String get sensitiveContentFriendDmLabel => 'Mensajes directos de amigos';

  @override
  String get sensitiveContentNonFriendDmLabel =>
      'Mensajes directos de otros usuarios';

  @override
  String get sensitiveContentGuildLabel =>
      'Mensajes en canales de la comunidad';

  @override
  String get sensitiveContentFilterShow => 'Mostrar';

  @override
  String get sensitiveContentFilterBlur => 'Desenfocar';

  @override
  String get sensitiveContentFilterBlock => 'Bloquear';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Desenfocar archivos multimedia hasta que se complete el análisis de seguridad';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Cuando está activado, las imágenes y videos se desenfocan hasta que finalice el análisis de seguridad del contenido.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Esta configuración está siempre activada en tu cuenta.';

  @override
  String get sensitiveContentResetButton => 'Restablecer';

  @override
  String get sensitiveContentSaveButton => 'Guardar';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count archivos',
      one: '1 archivo',
    );
    return 'Subiendo $_temp0';
  }

  @override
  String get chatCancelUpload => 'Cancelar subida';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Expira el $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Expira entre el $start y el $end';
  }

  @override
  String get connectionsTitle => 'Conexiones';

  @override
  String get connectionsDescription =>
      'Vincula cuentas y dominios externos a tu perfil de Fluxer. Las conexiones verificadas se mostrarán en tu perfil para que otros las vean.';

  @override
  String get connectionsEmptyTitle => 'Aún no hay conexiones';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Vincula tu cuenta de Bluesky o verifica la propiedad del dominio para mostrarlos en tu perfil.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Verifica la propiedad del dominio para mostrarlo en tu perfil.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Dominio';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Añadir conexión de Bluesky';

  @override
  String get connectionsAddDomainAriaLabel => 'Añadir conexión de dominio';

  @override
  String get connectionEdit => 'Editar';

  @override
  String get connectionRemove => 'Eliminar';

  @override
  String get connectionVerifiedLabel => 'Esta conexión ha sido verificada.';

  @override
  String get connectionUnverifiedLabel =>
      'Esta conexión no ha sido verificada.';

  @override
  String get connectionAddTitle => 'Añadir conexión';

  @override
  String get connectionTypeLabel => 'Tipo de conexión';

  @override
  String get connectionHandleLabel => 'Nombre de usuario';

  @override
  String get connectionDomainLabel => 'Dominio';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'ejemplo.com';

  @override
  String get connectionAlreadyExists => 'Ya tienes esta conexión.';

  @override
  String get connectionConnectBluesky => 'Conectar con Bluesky';

  @override
  String get connectionContinue => 'Continuar';

  @override
  String get connectionVerifyTitle => 'Verificar conexión';

  @override
  String get connectionVerifyInstructions =>
      'Utiliza el registro a continuación para probar la propiedad del dominio.';

  @override
  String get connectionDnsRecordTitle => 'Registro DNS TXT';

  @override
  String get connectionDnsHostLabel => 'Host';

  @override
  String get connectionDnsValueLabel => 'Valor';

  @override
  String get connectionCopyHost => 'Copiar host';

  @override
  String get connectionCopyValue => 'Copiar valor';

  @override
  String get connectionCopied => '¡Copiado!';

  @override
  String get connectionTokenFileTitle => 'Servir el archivo token';

  @override
  String get connectionTokenFileDescription =>
      'Descarga **fluxer-verification** y colócalo en tu carpeta **.well-known** para que podamos validar el dominio.';

  @override
  String get connectionTokenFileDownload => 'Descargar fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'El archivo contiene el token de verificación que obtendremos de **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Guardar fluxer-verification';

  @override
  String get connectionVerifyButton => 'Verificar';

  @override
  String get connectionBack => 'Atrás';

  @override
  String get connectionEditTitle => 'Editar conexión';

  @override
  String get connectionEditDescription =>
      'Elige quién puede ver esta conexión en tu perfil.';

  @override
  String get connectionVisibilityEveryone => 'Todos';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Permitir que cualquiera vea esta conexión en tu perfil';

  @override
  String get connectionVisibilityFriends => 'Amigos';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Permitir que tus amigos vean esta conexión';

  @override
  String get connectionVisibilityCommunityMembers => 'Miembros de la comunidad';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Permitir que los miembros de tus comunidades vean esta conexión';

  @override
  String get connectionRemoveTitle => 'Eliminar conexión';

  @override
  String get connectionRemoveDescription =>
      '¿Estás seguro de que deseas eliminar esta conexión? Esta acción no se puede deshacer.';

  @override
  String get connectionRemoveConfirm => 'Eliminar';

  @override
  String get connectionsLoadError => 'Error al cargar las conexiones';

  @override
  String get connectionsReorderError => 'No se pudo actualizar el orden';

  @override
  String get connectionInitiateFailed =>
      'No se pudo iniciar la verificación. Inténtalo de nuevo.';

  @override
  String get connectionVerifyFailed =>
      'No se pudo verificar. Comprueba tu registro DNS e inténtalo de nuevo.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'No se pudo iniciar la autorización de Bluesky.';

  @override
  String get connectionUpdateFailed => 'No se pudo actualizar la conexión';

  @override
  String get connectionRemoveFailed => 'No se pudo eliminar la conexión';

  @override
  String get connectionTokenSavedToast => 'Verificación de Fluxer guardada';

  @override
  String get connectionTokenSaveFailedToast => 'No se pudo guardar el archivo';

  @override
  String get connectionEnterHandle => 'Ingresa un usuario de Bluesky.';

  @override
  String get connectionEnterDomain => 'Ingresa un dominio.';

  @override
  String get lookAndFeelTitle => 'Apariencia y estilo';

  @override
  String get lookAndFeelThemeSectionTitle => 'Tema';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Escoge el aspecto oscuro, carbón o claro.';

  @override
  String get lookAndFeelThemeDark => 'Tema oscuro';

  @override
  String get lookAndFeelThemeCoal => 'Tema carbón';

  @override
  String get lookAndFeelThemeLight => 'Tema claro';

  @override
  String get lookAndFeelThemeSystem => 'Tema del sistema';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Sincronizar tema en todos los dispositivos';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Cuando está activado, los cambios de tema se sincronizarán en todos tus dispositivos. Cuando está desactivado, este dispositivo usará su propia configuración de tema.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'El tema del sistema desactiva automáticamente la sincronización para seguir la preferencia de tu sistema en este dispositivo.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'No se pudo sincronizar el tema con tu cuenta. Por favor, inténtalo de nuevo.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Tamaño de letra del chat';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Ajusta el tamaño de la fuente en el área de chat.';

  @override
  String get lookAndFeelInterfaceTitle => 'Interfaz';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Personaliza los elementos y el comportamiento de la interfaz.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Indicadores de escritura en la lista de canales';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Elige cómo aparecen los indicadores de escritura en la lista de canales cuando alguien está escribiendo en un canal.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Indicador de escritura + Avatares';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Mostrar indicador de escritura con avatares de usuario en la lista de canales';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Solo indicador de escritura';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Mostrar solo el indicador de escritura sin avatares';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Oculto';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'No mostrar indicadores de escritura en la lista de canales';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Mostrar escritura en el canal seleccionado';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Cuando está desactivado (por defecto), los indicadores de escritura no aparecerán en el canal que estás viendo actualmente.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'general';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Indicadores de teclado';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Controla si los indicadores de atajos de teclado aparecen en las descripciones emergentes.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Ocultar indicadores de teclado en descripciones emergentes';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Cuando está activado, los indicadores de atajos se ocultan en las ventanas emergentes de descripción.';

  @override
  String get lookAndFeelNekoTitle => 'Varios';

  @override
  String get lookAndFeelNekoDescription => 'Opciones varias de la interfaz.';

  @override
  String get lookAndFeelShowNekoLabel => 'Mostrar Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Cuando está activado, Neko aparece cerca de la barra de entrada del chat.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Comportamiento al unirse a canales de voz';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Controla cómo te unes a los canales de voz en las comunidades.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Requerir doble clic para unirse a canales de voz';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Cuando está activado, necesitarás hacer doble clic en los canales de voz para unirte. Cuando está desactivado (por defecto), un solo clic te unirá al canal inmediatamente.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'El veloz zorro marrón salta sobre el perro perezoso.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Barra lateral de gremios';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Configura cómo la barra lateral de gremios muestra los mensajes directos.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count comunidades no están disponibles temporalmente debido a un mal funcionamiento del condensador de flujo.',
      one:
          '1 comunidad no está disponible temporalmente debido a un mal funcionamiento del condensador de flujo.',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel => 'Colapsar DMs en carpeta';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'Cuando está activado, los MD no leídos en la barra lateral del servidor se agrupan en una carpeta en el botón de Fluxer. Haz clic en el botón de Fluxer mientras estás en la página de MD para expandir o contraer la carpeta.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Lista de canales';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Controla el comportamiento del indicador de no leído para los canales silenciados en las listas de canales.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Mostrar indicador de no leído en canales silenciados';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Cuando está activado, los canales silenciados muestran un indicador de no leído atenuado en el lado izquierdo. Las menciones aún aparecen independientemente de esta configuración.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Activos ahora';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Controla cómo se muestran los usuarios activos ahora en la aplicación.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Mostrar Activos ahora en la pantalla de inicio';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Muestra \"Activos ahora\" en la pantalla de inicio para ver amigos que están activos en voz. Verás una vista previa, el contexto del canal, quién está ya allí y una forma rápida de unirte.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Favoritos';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Controla la visibilidad de los favoritos en toda la aplicación.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Habilitar favoritos';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Cuando está activado, puedes marcar canales como favoritos y aparecerán en la sección de Favoritos. Cuando está desactivado, todos los elementos de la interfaz relacionados con los favoritos (botones, opciones de menú) se ocultaran. Tus favoritos existentes se conservarán.';

  @override
  String get favoritesTitle => 'Favoritos';

  @override
  String get favoritesEmptyTitle => 'Aún no tienes favoritos';

  @override
  String get favoritesEmptyDescription =>
      'Marca canales como favoritos desde el encabezado del chat para mantenerlos aquí.';

  @override
  String get favoritesWelcomeTitle => 'Bienvenido a Favoritos';

  @override
  String get favoritesWelcomeDescription =>
      'Tu espacio personal para acceder rápidamente a los canales, mensajes directos y grupos que más te gustan. Presiona la estrella en cualquier canal para añadirlo aquí.';

  @override
  String get favoritesWelcomeTip =>
      '¿No es para ti? Puedes desactivarlo en cualquier momento.';

  @override
  String get favoritesDisableButton => 'Desactivar favoritos';

  @override
  String get favoritesAddedToast => 'Añadido a favoritos';

  @override
  String get favoritesRemovedToast => 'Eliminado de favoritos';

  @override
  String get favoritesHiddenToast => 'Favoritos ocultos';

  @override
  String get favoritesMute => 'Silenciar favoritos';

  @override
  String get favoritesUnmute => 'Reactivar notificaciones de favoritos';

  @override
  String get favoritesHeaderMenu => 'Menú de favoritos';

  @override
  String get favoritesCreateCategory => 'Crear categoría';

  @override
  String get favoritesCategoryNameLabel => 'Nombre de la categoría';

  @override
  String get favoritesHideMutedChannels => 'Ocultar canales silenciados';

  @override
  String get favoritesShowMutedChannels => 'Mostrar canales silenciados';

  @override
  String get favoritesSetNickname => 'Establecer apodo';

  @override
  String get favoritesNicknameLabel => 'Apodo';

  @override
  String get favoritesSaveNickname => 'Guardar apodo';

  @override
  String get favoritesMoveToCategory => 'Mover a categoría';

  @override
  String get favoritesUncategorized => 'Sin categoría';

  @override
  String get favoritesOtherCategory => 'Otros';

  @override
  String get favoritesRemoveFromFavorites => 'Quitar de favoritos';

  @override
  String get favoritesAddToFavorites => 'Añadir a favoritos';

  @override
  String get favoritesHideConfirmTitle => 'Ocultar favoritos';

  @override
  String get favoritesHideConfirmDescription =>
      'Esto ocultará todos los elementos de la interfaz relacionados con favoritos, incluidos los botones y las opciones del menú. Tus favoritos actuales se conservarán y podrás volver a activarlos en cualquier momento desde Ajustes > Avanzado > Apariencia.';

  @override
  String get favoritesDirectMessageSubtitle => 'Mensaje directo';

  @override
  String get messagesMediaDisplayGroupTitle => 'Visualización';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Controla como se muestran los mensajes, archivos multimedia y otros contenidos.';

  @override
  String get messagesMediaMediaGroupTitle => 'Multimedia';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Personaliza los botones y las preferencias de tamaño de los archivos multimedia.';

  @override
  String get messagesMediaInputGroupTitle => 'Entrada';

  @override
  String get messagesMediaInputGroupDescription =>
      'Personaliza la configuración de entrada de mensajes.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Barra lateral';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Configura cómo se muestra la barra lateral de la comunidad.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Ocultar canales silenciados por defecto';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Oculta automáticamente los canales silenciados en la barra lateral cuando te unes a nuevas comunidades';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      '¿Ocultar canales silenciados por defecto?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Las nuevas comunidades a las que te unas tendrán automáticamente los canales silenciados ocultos. ¿También deseas aplicar esta configuración a todas tus comunidades existentes?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      '¿Dejar de ocultar canales silenciados por defecto?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Las nuevas comunidades a las que te unas ya no tendrán los canales silenciados ocultos automáticamente. ¿También deseas mostrar los canales silenciados en todas tus comunidades existentes?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Aplicar a todas las comunidades';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Mostrar en todas las comunidades';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Solo comunidades nuevas';

  @override
  String get messagesMediaDisplaySectionTitle => 'Visualización de medios';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Controla cómo se muestran imágenes, videos y otros medios. Todos los medios se redimensionan y convierten. Los archivos extremadamente grandes que no se pueden comprimir en una vista previa no se incrustarán independientemente de estas configuraciones.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Cuando se publican como enlaces al chat';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'Cuando se suben directamente a Fluxer';

  @override
  String get messagesMediaLinkPreviewsSectionTitle =>
      'Vistas previas de enlaces';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Controla cómo se previsualizan los enlaces de sitios web en el chat';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Mostrar incrustaciones y previsualizar enlaces de sitios web';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reacciones';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Configura las reacciones de emoji en los mensajes';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Mostrar reacciones de emoji en los mensajes';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Contenido de spoilers';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Controla cómo se muestra el contenido de spoilers';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Mostrar contenido de spoilers';

  @override
  String get messagesMediaSpoilersOnClickName => 'Al hacer clic';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Muestra el contenido de spoilers al hacer clic';

  @override
  String get messagesMediaSpoilersIfModeratorName => 'En canales que modero';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Muestra siempre el contenido de spoilers en los canales donde tienes el permiso \"Gestionar mensajes\"';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Siempre';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Muestra siempre el contenido de spoilers';

  @override
  String get messagesMediaSizeSectionTitle =>
      'Preferencias de tamaño de medios';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Personaliza el tamaño máximo de visualización para medios incrustados y adjuntos. Los tamaños más pequeños usan menos espacio en pantalla, mientras que los tamaños más grandes muestran más detalles.';

  @override
  String get messagesMediaSizeEmbedLabel =>
      'Medios de enlaces (incrustaciones)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Archivos adjuntos subidos';

  @override
  String get messagesMediaSizeCompactName => 'Compacto (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Tamaño de medio pequeño';

  @override
  String get messagesMediaSizeComfortableName => 'Cómodo';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Tamaño de archivos multimedia más grande con más detalles';

  @override
  String get messagesMediaGifsSectionTitle => 'Comportamiento de los GIF';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Controla cómo se insertan los GIF en el chat';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Enviar automáticamente los GIF al seleccionarlos';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Autocompletar expresiones (autocompletar con dos puntos)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Controla qué aparece al autocompletar expresiones cuando escribes dos puntos. Personaliza las sugerencias que se muestran según tus preferencias.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Mostrar emojis predeterminados al autocompletar expresiones';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Mostrar emojis personalizados al autocompletar expresiones';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Mostrar stickers al autocompletar expresiones';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Mostrar archivos multimedia guardados al autocompletar expresiones';

  @override
  String get messagesMediaEditingSectionTitle => 'Edición de mensajes';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Controla que sucede con el borrador de edición cuando cancelas.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Conservar el borrador de edición al cancelar';

  @override
  String get accessibilityUnreadGroupTitle => 'Indicadores de no leídos';

  @override
  String get accessibilityUnreadGroupDescription =>
      'Controla como se muestran los indicadores de mensajes no leídos.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'Mostrar el indicador de no leídos difuminado en canales silenciados';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'Muestra un indicador de no leídos difuminado junto a los canales y mensajes directos silenciados para que puedas ver de un vistazo si hay actividad.';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'Vistas previas de mensajes de MD';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Controla cuándo se muestran las vistas previas de mensajes en la lista de MD.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Modo de vista previa de mensajes de MD';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Todos los mensajes';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Muestra vistas previas de mensajes para todas las conversaciones de MD';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Solo DMs no leídos';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Mostrar solo vistas previas de mensajes en DMs con mensajes no leídos';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Ninguna';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'No mostrar vistas previas de mensajes en la lista de DMs';

  @override
  String get dmListSentAnAttachment => 'Envió un archivo adjunto';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username fijó un mensaje en este canal.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username agregó a $userName al grupo.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username agregó a alguien al grupo.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username abandonó el grupo.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username eliminó a $userName del grupo.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username eliminó a alguien del grupo.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username cambió el nombre del canal a $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username cambió el nombre del canal.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username cambió el ícono del canal.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username inició una llamada.';
  }

  @override
  String get voiceConnectionConfirmTitle => 'Confirmación de conexión de voz';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Ya estás conectado a este canal de voz desde $count dispositivos más. ¿Qué quieres hacer?',
      one:
          'Ya estás conectado a este canal de voz desde 1 dispositivo más. ¿Qué quieres hacer?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Cambiar a este dispositivo';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Unirme (mantener otras conexiones)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'No hacer nada, no quiero unirme';

  @override
  String get voiceChannelEmptyDescription =>
      'Este es un canal de voz. ¡Conéctate para empezar a hablar!';

  @override
  String get voiceChannelJoin => 'Unirse al canal de voz';

  @override
  String get voiceChannelJoinConnect => 'Conectar a voz';

  @override
  String get voiceChannelNoConnectPermission =>
      'No tienes permiso para unirte a este canal de voz';

  @override
  String get voiceChannelE2eeEncrypted =>
      'El micrófono, la cámara y el contenido para compartir pantalla están cifrados de extremo a extremo.';

  @override
  String get voiceCallE2eeEncrypted =>
      'El micrófono, la cámara y el contenido para compartir pantalla están cifrados de extremo a extremo.';

  @override
  String get voiceChannelE2eeBroken =>
      'El cifrado de extremo a extremo no está disponible porque hay un participante no compatible en este canal de voz.';

  @override
  String get voiceCallE2eeBroken =>
      'El cifrado de extremo a extremo no está disponible porque hay un participante no compatible en esta llamada.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Este cliente debe actualizarse antes de unirse a esta llamada cifrada.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'No se pudo iniciar tu micrófono. Sigues en la llamada.';

  @override
  String get voiceChannelStatusConnecting => 'Conectando…';

  @override
  String get voiceChannelStatusConnected => 'Conectado';

  @override
  String get voiceChannelStatusError => 'Error';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Dispositivo móvil';

  @override
  String get voiceParticipantTooltipDesktopDevice =>
      'Dispositivo de escritorio';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Comunidad silenciada';

  @override
  String get voiceParticipantTooltipMuted => 'Silenciado';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Comunidad ensordecida';

  @override
  String get voiceParticipantTooltipDeafened => 'Ensordecido';

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
  String get voiceChannelLeave => 'Desconectar';

  @override
  String get voiceControlMute => 'Silenciar';

  @override
  String get voiceControlUnmute => 'Desactivar silencio';

  @override
  String get voiceControlDeafen => 'Ensordecer';

  @override
  String get voiceControlUndeafen => 'Desactivar ensordecimiento';

  @override
  String get voiceControlVideo => 'Activar cámara';

  @override
  String get voiceControlScreenShare => 'Compartir pantalla';

  @override
  String get voiceScreenShareNotificationText => 'Compartiendo tu pantalla.';

  @override
  String get voiceControlMore => 'Más';

  @override
  String get voiceControlDisconnect => 'Desconectar';

  @override
  String get voiceControlChat => 'Chat';

  @override
  String get voiceTextChatShow => 'Mostrar chat';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# mensajes sin leer',
      one: '# mensaje sin leer',
    );
    return 'Mostrar chat con $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Necesitas permitir el acceso a la cámara para el video.';

  @override
  String get voiceErrorScreenShareToggle =>
      'No se pudo compartir pantalla. Inténtalo de nuevo.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Se denegó el permiso para compartir pantalla.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'La transmisión de pantalla no está disponible en este dispositivo.';

  @override
  String get voiceWatchStream => 'Ver transmisión';

  @override
  String get voiceStopWatching => 'Dejar de ver';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Dejar de ver la transmisión actual';

  @override
  String get voiceOwnScreenShareTitle => 'Estás transmitiendo';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Tu transmisión está en vivo para los participantes.';

  @override
  String get voiceLiveBadge => 'EN VIVO';

  @override
  String get dmVoiceViewCall => 'Ver llamada';

  @override
  String get dmVoiceCallFullScreen => 'Pantalla completa';

  @override
  String get dmVoiceCallFullScreenTooltip =>
      'Abrir llamada en pantalla completa';

  @override
  String get dmVoiceStripStatusConnecting => 'Conectando…';

  @override
  String get dmVoiceStripStatusInCall => 'En llamada';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Llamada de voz';

  @override
  String get dmVoiceCallBarConnecting => 'Conectando…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Llamada directa';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Llamada grupal';

  @override
  String get dmVoiceCallBarIssueFallback => 'Problema de voz';

  @override
  String get dmVoiceFullscreenTitle => 'Voz';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Voz conectada';

  @override
  String get notificationsPageTitle => 'Notificaciones';

  @override
  String get notificationsFilterUnreads => 'No leídas';

  @override
  String get notificationsFilterMentions => 'Menciones';

  @override
  String get notificationsBookmarksTooltip => 'Marcadores';

  @override
  String get notificationsMentionFilterTooltip => 'Filtrar menciones';

  @override
  String get notificationsMentionFiltersTitle => 'Filtros de menciones';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Incluir menciones de @everyone y @here';

  @override
  String get notificationsMentionIncludeRoles => 'Incluir mención de roles';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Incluir todas las menciones de la comunidad';

  @override
  String get notificationsNoUnreadTitle => 'No hay mensajes sin leer';

  @override
  String get notificationsNoUnreadBody => 'Estás al día.';

  @override
  String get notificationsNoMentionsTitle => 'No hay menciones recientes';

  @override
  String get notificationsNoMentionsBody =>
      'Todas las menciones con @ aparecerán aquí por 7 días.';

  @override
  String get notificationsMentionsEndTitle => 'Has llegado al final';

  @override
  String get notificationsMentionsEndBody =>
      'Has visto todas tus menciones recientes. No te preocupes, pronto aparecerán más aquí.';

  @override
  String get notificationsJump => 'Ir a';

  @override
  String get notificationsRemoveMentionTooltip => 'Quitar mención';

  @override
  String get notificationsViewAllUnread => 'Ver mensajes sin leer';

  @override
  String get notificationsMarkAsRead => 'Marcar como leído';

  @override
  String get notificationsExpand => 'Ver más';

  @override
  String get notificationsCollapse => 'Ver menos';

  @override
  String get notificationsMessageUnavailable =>
      'No se pudo cargar este mensaje.';

  @override
  String characterCounterRemaining(int remaining) {
    return 'Quedan $remaining caracteres';
  }

  @override
  String get characterCounterTooLong => 'El mensaje es demasiado largo';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return 'Quedan $remaining caracteres. Consigue $productName para escribir hasta $premiumMaxLength caracteres.';
  }

  @override
  String get chatMessageFailedToSend => 'Error al enviar el mensaje';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Tu mensaje no pudo ser entregado. Esto suele deberse a que no compartes una comunidad con el destinatario o este solo acepta mensajes directos de amigos. Es posible que también necesites ajustar tu propia configuración de privacidad de mensajes directos en $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Tu mensaje no pudo ser entregado. Necesitas reclamar tu cuenta para enviar mensajes directos.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Tu mensaje no pudo ser entregado. Necesitas reclamar tu cuenta para enviar mensajes.';

  @override
  String get chatSendFailureContentBlocked =>
      'Tu mensaje no pudo ser entregado porque fue marcado por nuestros sistemas de seguridad. Si crees que esto es un error, por favor contacta a soporte.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Tu mensaje no pudo ser entregado porque contiene emojis o stickers para adultos que no están permitidos en este contexto.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'Solo tú puedes ver este mensaje.';

  @override
  String get chatClientSystemDismiss => 'Descartar';

  @override
  String get privacyDashboardCommunicationSection => 'Comunicación';

  @override
  String get chatMessageDeleteFailed => 'Eliminar mensaje fallido';

  @override
  String get chatMessageAddReaction => 'Añadir reacción';

  @override
  String get chatMessageEdit => 'Editar mensaje';

  @override
  String get chatMessageReply => 'Responder';

  @override
  String get chatMessageForward => 'Reenviar';

  @override
  String get forwardMessageTitle => 'Reenviar mensaje';

  @override
  String get forwardSearchHint => 'Buscar canales o chats';

  @override
  String get forwardDirectMessagesSection => 'Mensajes directos';

  @override
  String get forwardCommentHint => 'Añadir un comentario (opcional)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Enviar ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'No se encontraron canales';

  @override
  String get forwardSuccessToast => 'Mensaje reenviado';

  @override
  String get forwardFailed => 'Error al reenviar mensaje';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Los comentarios no están disponibles porque el canal seleccionado tiene modo lento activado.';

  @override
  String get forwardDestinationNoSendPermission =>
      'No puedes enviar mensajes aquí';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'No puedes incluir enlaces aquí';

  @override
  String get forwardDestinationNoAttachPermission =>
      'No puedes adjuntar archivos aquí';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'El envío de mensajes está desactivado en esta comunidad';

  @override
  String get forwardDestinationTimedOut =>
      'Estás en aislamiento en esta comunidad';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Modo lento: espera $remaining';
  }

  @override
  String get chatMessageCopyText => 'Copiar mensaje';

  @override
  String get chatMessagePin => 'Fijar mensaje';

  @override
  String get chatMessageUnpin => 'Desfijar mensaje';

  @override
  String get chatMessageUnpinIt => 'Desfijar';

  @override
  String get chatMessageBookmark => 'Marcar mensaje';

  @override
  String get chatMessageRemoveBookmark => 'Eliminar marcador';

  @override
  String get chatMessageMarkAsUnread => 'Marcar como no leído';

  @override
  String get chatMessageCopyMessageLink => 'Copiar enlace del mensaje';

  @override
  String get chatMessageCopyMessageId => 'Copiar ID del mensaje';

  @override
  String get chatMessageViewReactions => 'Ver reacciones';

  @override
  String get chatMessageRemoveAllReactions => 'Eliminar todas las reacciones';

  @override
  String get chatMessageDebug => 'Depurar mensaje';

  @override
  String get chatMessageDebugSheetTitle => 'Depurar mensaje';

  @override
  String get chatMessageDebugCopyJson => 'Copiar JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'JSON del mensaje copiado al portapapeles';

  @override
  String get chatReactionsSheetTitle => 'Reacciones';

  @override
  String get chatReactionsSheetEmpty => 'Nadie ha reaccionado a esto todavía.';

  @override
  String get chatMessageReport => 'Reportar mensaje';

  @override
  String get iarReportMessageTitle => 'Reportar mensaje';

  @override
  String get iarThisUserFallback => 'Este usuario';

  @override
  String get iarModalDescription =>
      'Reportar una infracción a las reglas o encontrar herramientas para gestionar el contacto y las preferencias.';

  @override
  String get iarPathStepAriaLabel => '¿Que necesitas?';

  @override
  String get iarCategoryStepTitle => '¿Qué clase de regla se infringió?';

  @override
  String get iarReasonStepTitle => '¿Qué regla se infringió?';

  @override
  String get iarReasonSelectHint => 'Selecciona un motivo';

  @override
  String get iarPickAnOptionToast => 'Elige una opción para continuar.';

  @override
  String get iarPickARuleToast => 'Elige la regla que se infringió.';

  @override
  String get iarPathPlatform =>
      'Reporta una infracción a las reglas de la plataforma';

  @override
  String get iarPathCommunity => 'Reportar a los moderadores de esta comunidad';

  @override
  String get iarPathPreferenceMessage => 'No me gusta este contenido';

  @override
  String get iarCategoryTargetedHarmLabel => 'Amenazas, acoso o daño';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Bullying, amenazas, odio, violencia, raids o contenido que promueva la autolesión.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Seguridad infantil o material explicito';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Menores en riesgo, contenido explícito en el lugar equivocado o conducta no deseada.';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'Privacidad o suplantación de identidad';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxxing, acecho, hacerse pasar por alguien o un perfil inapropiado.';

  @override
  String get iarCategoryDeceptionLabel => 'Estafas, malware o desinformación';

  @override
  String get iarCategoryDeceptionDescription =>
      'Phishing, fraude, enlaces maliciosos o afirmaciones falsas que puedan causar daños en el mundo real.';

  @override
  String get iarCategoryIllegalOtherLabel => 'Actividad ilegal u otro motivo';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Ventas ilegales, facilitación de actividades criminales o una infracción clara de las reglas que no encaje en las categorías anteriores.';

  @override
  String get iarReasonHarassmentLabel => 'Acoso o amenazas';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Bullying, contacto no deseado repetido, acecho o abuso dirigido.';

  @override
  String get iarReasonHateLabel => 'Discurso de odio';

  @override
  String get iarReasonHateMessageDescription =>
      'Insultos, lenguaje denigrante o ataques a grupos protegidos.';

  @override
  String get iarReasonViolenceLabel => 'Violencia o amenazas violentas';

  @override
  String get iarReasonViolenceDescription =>
      'Amenazas creíbles, violencia gráfica o apología de la violencia.';

  @override
  String get iarReasonMatureContentLabel => 'Contenido para adultos o acoso';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Conducta inapropiada o contenido explícito fuera de lugar.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Seguridad infantil o explotación de menores';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Grooming o contenido de explotación infantil.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Desinformación dañina';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Afirmaciones falsas que probablemente causen daño en el mundo real.';

  @override
  String get iarReasonSpamLabel => 'Spam, estafas o phishing';

  @override
  String get iarReasonSpamMessageDescription =>
      'Spam masivo, fraude, sorteos falsos o abuso de cuentas.';

  @override
  String get iarReasonMalwareLabel => 'Malware o enlaces peligrosos';

  @override
  String get iarReasonMalwareDescription =>
      'Malware, robo de credenciales o archivos dañinos.';

  @override
  String get iarReasonPrivacyLabel => 'Violación de la privacidad';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxxing, información privada expuesta o acoso.';

  @override
  String get iarReasonImpersonationLabel =>
      'Suplantación de identidad o medios engañosos';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Hacerse pasar por otra persona, incluido contenido engañoso generado por IA.';

  @override
  String get iarReasonIllegalLabel => 'Actividad ilegal';

  @override
  String get iarReasonIllegalDescription =>
      'Ventas ilegales, facilitación criminal o actividad ilícita.';

  @override
  String get iarReasonSelfHarmLabel => 'Autolesiones o suicidio';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Promoción o instrucciones que alientan la autolesión o los trastornos alimentarios.';

  @override
  String get iarReasonOtherLabel => 'Otra violación clara de las reglas';

  @override
  String get iarReasonOtherDescription =>
      'Úsalo solo si rompe claramente las reglas de Fluxer y no encaja en las opciones anteriores.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Si hay un menor involucrado, usa \"$childSafetyReason\" en su lugar.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Si esto involucra CSAM o explotación de un menor, envíalo ahora y no vuelvas a compartir el material.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Si alguien puede estar en peligro inmediato, contacta a los servicios de emergencia locales si puedes hacerlo de forma segura.';

  @override
  String get iarSafetyNoteViolence =>
      'Si esto es una amenaza inminente creíble, contacta también a los servicios de emergencia locales.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Si esto es una amenaza terrorista inminente, contacta también a los servicios de emergencia locales.';

  @override
  String get iarActionBlockUserTitle => 'Bloquear a este usuario';

  @override
  String get iarActionBlockUserDescription =>
      'Detener mensajes y solicitudes de amistad.';

  @override
  String get iarActionBlockUserButton => 'Bloquear';

  @override
  String get iarActionCopyMessageLinkTitle => 'Copiar enlace del mensaje';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Compartir con los moderadores de la comunidad.';

  @override
  String get iarActionCopyMessageLinkButton => 'Copiar';

  @override
  String get iarActionCloseDmTitle => 'Cerrar este DM';

  @override
  String get iarActionCloseDmDescription =>
      'No bloquea. Puedes reabrirlo más tarde.';

  @override
  String get iarActionCloseDmButton => 'Cerrar DM';

  @override
  String get iarActionLeaveCommunityTitle => 'Abandonar la comunidad';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Dejar de ver su contenido y miembros.';

  @override
  String get iarActionLeaveCommunityButton => 'Abandonar';

  @override
  String get iarActionDmSettingsTitle =>
      'Configuración de DMs y solicitudes de amistad';

  @override
  String get iarActionDmSettingsDescription =>
      'Cambia quién puede contactarte.';

  @override
  String get iarActionCallSettingsTitle =>
      'Configuración de llamadas y chats grupales';

  @override
  String get iarActionCallSettingsDescription =>
      'Cambia quién puede llamarte o agregarte.';

  @override
  String get iarActionOpenButton => 'Abrir';

  @override
  String get iarActionDeleteMessageTitle => 'Eliminar este mensaje';

  @override
  String get iarActionDeleteMessageDescription =>
      'Elimínalo del canal para todos.';

  @override
  String get iarActionDeleteMessageButton => 'Eliminar';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Eliminado';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Este mensaje ya ha sido eliminado.';

  @override
  String get iarActionBanUserTitle => 'Expulsar a este usuario';

  @override
  String get iarActionBanUserDescription =>
      'Abre el diálogo de expulsión para esta comunidad.';

  @override
  String get iarActionBanUserButton => 'Expulsar';

  @override
  String get iarActionBanUserBannedButton => 'Expulsado';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Este usuario ya ha sido expulsado de la comunidad.';

  @override
  String get iarCloseDmConfirmTitle => 'Cerrar DM';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Cierra tu DM actual con $name. Esto no los bloquea; puedes reabrirlo más tarde.';
  }

  @override
  String get iarSuccessTitle => 'Reporte enviado';

  @override
  String get iarSuccessBody =>
      'Nuestro equipo de seguridad lo está revisando. Te enviaremos un DM y un correo electrónico una vez que hayamos llegado a un veredicto.';

  @override
  String get iarAlreadyReportedTitle => 'Ya reportado';

  @override
  String get iarAlreadyReportedBody =>
      'Ya has reportado este mensaje. Nuestro equipo de seguridad lo está revisando.';

  @override
  String get iarBackButton => 'Atrás';

  @override
  String get iarContinueButton => 'Continuar';

  @override
  String get iarSendReportButton => 'Enviar reporte';

  @override
  String get iarDoneButton => 'Listo';

  @override
  String get iarCouldntSendToast =>
      'No se pudo enviar el reporte. Inténtalo de nuevo.';

  @override
  String get iarRateLimitedToast =>
      'Estás reportando muy rápido. Espera un momento e inténtalo de nuevo.';

  @override
  String get iarReportSentToast =>
      'Reporte enviado. Nuestro equipo de seguridad lo revisará.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return '¿Bloquear a $name? No podrán enviarte mensajes ni solicitudes de amistad. Puedes desbloquearlo más tarde.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'No se pudo bloquear a este usuario. Inténtalo de nuevo.';

  @override
  String get iarCloseDmSuccessToast => 'DM cerrado.';

  @override
  String get iarCloseDmFailedToast =>
      'No se pudo cerrar este DM. Inténtalo de nuevo.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'No se pudo abandonar esta comunidad. Inténtalo de nuevo.';

  @override
  String get chatMessageSuppressEmbeds => 'Suprimir previsualizaciones';

  @override
  String get chatMessageUnsuppressEmbeds => 'Restaurar previsualizaciones';

  @override
  String get chatMessageDelete => 'Eliminar mensaje';

  @override
  String get chatMessageDeleteConfirmTitle => 'Eliminar mensaje';

  @override
  String get chatMessageDeleteConfirmDescription =>
      '¿Estás seguro de que quieres eliminar este mensaje?';

  @override
  String get chatMessageMore => 'Más';

  @override
  String get chatEditingMessage => 'Editando mensaje';

  @override
  String get chatReplyOriginalDeleted => 'El mensaje original fue eliminado';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'No se pudo cargar el mensaje original';

  @override
  String get chatReplyAttachedMedia => 'El mensaje contiene medios adjuntos';

  @override
  String get chatMessagesLoadError => 'No se pudieron cargar los mensajes.';

  @override
  String get chatReplyMentionOverrideTitle => '¿Anular preferencia de mención?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname prefiere ser @mencionado en las respuestas. ¿Enviar sin la mención de todos modos?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname prefiere respuestas sin @mención. ¿Enviar con la mención de todos modos?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ignorar preferencia';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Haz clic para desactivar la notificación al usuario al que respondes.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Haz clic para activar la notificación al usuario al que respondes.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Notificar al usuario respondido';

  @override
  String get chatReplyMentionOn => 'Activado';

  @override
  String get chatReplyMentionOff => 'Desactivado';

  @override
  String get chatReplyCancel => 'Cancelar respuesta';

  @override
  String get chatEditMessageHint => 'Editar mensaje';

  @override
  String get chatEditNoChanges => 'No hay cambios que guardar';

  @override
  String get chatChannelNotReady =>
      'Este canal aún no esta listo. Inténtalo de nuevo en un momento.';

  @override
  String get chatMessageEdited => '(Editado)';

  @override
  String get chatMessageSilent => 'Este fue un mensaje @silent.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Hoy a las $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Ayer a las $time';
  }

  @override
  String get mediaViewerImagePreview => 'Vista previa de imagen';

  @override
  String get mediaViewerClose => 'Cerrar visor de archivos adjuntos';

  @override
  String get mediaViewerOpenInBrowser => 'Abrir en el navegador';

  @override
  String get mediaViewerForward => 'Reenviar';

  @override
  String get mediaViewerZoomIn => 'Ampliar';

  @override
  String get mediaViewerZoomOut => 'Alejar';

  @override
  String get mediaViewerPreviousAttachment => 'Archivo adjunto anterior';

  @override
  String get mediaViewerNextAttachment => 'Siguiente archivo adjunto';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String get chatAttachmentVideoToggleControls => 'Alternar controles de video';

  @override
  String get chatAttachmentVideoMute => 'Silenciar video';

  @override
  String get chatAttachmentVideoUnmute => 'Reactivar sonido del video';

  @override
  String get chatAttachmentVideoPlay => 'Reproducir video';

  @override
  String get chatAttachmentVideoPause => 'Pausar video';

  @override
  String get chatAttachmentVideoProgress => 'Progreso del video';

  @override
  String get chatVideoPlaybackFailed => 'No se pudo reproducir este video.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Notificar a los usuarios con este rol que tienen permiso para ver este canal.';

  @override
  String get addGuildModalTitle => 'Añadir comunidad';

  @override
  String get addGuildModalLandingDescription =>
      'Crear una nueva comunidad o unirse a una existente.';

  @override
  String get addGuildCreateCommunity => 'Crear comunidad';

  @override
  String get addGuildJoinCommunity => 'Unirse a la comunidad';

  @override
  String get addGuildImportDiscordTemplate => 'Importar plantilla de Discord';

  @override
  String get addGuildJoinTitle => 'Unirse a una comunidad';

  @override
  String get addGuildJoinDescription =>
      'Introduce el enlace de invitación para unirte a la comunidad.';

  @override
  String get addGuildInviteLinkLabel => 'Enlace de invitación';

  @override
  String get addGuildJoinSubmit => 'Unirse a la comunidad';

  @override
  String get addGuildInviteInvalid =>
      'Esta invitación no es validad o ha caducado.';

  @override
  String get addGuildJoinFailed =>
      'No se pudo unir a la comunidad. Por favor, inténtalo de nuevo.';

  @override
  String get addGuildPackInstalled =>
      'El paquete se ha instalado correctamente.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Eliminar todas las reacciones';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      '¿Estás seguro de que quieres eliminar todas las reacciones de este mensaje?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Desfijar mensaje';

  @override
  String get chatMessageUnpinConfirmDescription =>
      '¿Enviar este fijado de vuelta al pasado?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username fijó $messageLink en este canal. Ver $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'un mensaje';

  @override
  String get systemPinMessageAllPinsLink => 'todos los mensajes fijados';

  @override
  String get channelPinsEmptyTitle => 'No hay mensajes fijados';

  @override
  String get channelPinsEmptyDescription =>
      'Los mensajes fijados aparecerán aquí.';

  @override
  String get personalNotesTitle => 'Notas personales';

  @override
  String get personalNotesSubtitle =>
      'Tu espacio privado para pensamientos y recordatorios';

  @override
  String channelWelcomeHeading(String channelName) {
    return 'Bienvenido a $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'Al principio, no había nada. Luego, existió $channelName. Y estuvo bien.';
  }

  @override
  String get personalNotesComposerHint => 'Escríbete un mensaje';

  @override
  String get personalNotesPrivateSpace => 'Tu espacio privado';

  @override
  String get purgePersonalNotes => 'Purgar notas personales';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Esto eliminará permanentemente todos los mensajes y archivos adjuntos de tus notas personales. No se puede deshacer.';

  @override
  String get purgePersonalNotesConfirmButton => 'Purgar';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Se purgaron $count mensajes de las notas personales';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Las notas personales ya estaban vacías';

  @override
  String get purgePersonalNotesFailed =>
      'No se pudieron borrar las notas personales';

  @override
  String get userSettingsGroupYourAccount => 'TU CUENTA';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'Perfil';

  @override
  String get userSettingsNavSecurityLogin => 'Seguridad e inicio de sesión';

  @override
  String get userSettingsNavFluxerPlutonium => 'Suscripción a Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Regalos y códigos';

  @override
  String get userSettingsNavExpressionPacks => 'Packs de expresiones';

  @override
  String get userSettingsNavPrivacyDashboard => 'Panel de privacidad';

  @override
  String get userSettingsNavAuthorizedApps => 'Aplicaciones autorizadas';

  @override
  String get userSettingsNavBlockedUsers => 'Usuarios bloqueados';

  @override
  String get userSettingsNavLinkedDevices => 'Dispositivos vinculados';

  @override
  String get userSettingsNavConnections => 'Conexiones';

  @override
  String get userSettingsNavLookAndFeel => 'Apariencia';

  @override
  String get userSettingsNavAccessibility => 'Accesibilidad';

  @override
  String get userSettingsNavMessagesAndMedia =>
      'Mensajes y contenido multimedia';

  @override
  String get userSettingsNavAudioAndVideo => 'Audio y video';

  @override
  String get userSettingsNavSoundsAndAlerts => 'Sonidos y alertas';

  @override
  String get userSettingsNavLanguageAndTime => 'Idioma y hora';

  @override
  String get userSettingsNavAdvanced => 'Avanzado';

  @override
  String get advancedPerformanceReportingTitle => 'Informes de rendimiento';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Ayuda a mejorar Fluxer compartiendo datos anónimos sobre errores y rendimiento.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Enviar informes de errores y rendimiento';

  @override
  String get advancedPerformanceReportingDescription =>
      'Todos los datos reportados son anónimos y se envían únicamente al servicio de monitoreo de Fluxer; no se utilizan proveedores externos.';

  @override
  String get userSettingsNavApplications => 'Aplicaciones';

  @override
  String get userSettingsNavAppLogs => 'Registros de la aplicación';

  @override
  String get userSettingsNavDeveloperTools => 'Herramientas de desarrollador';

  @override
  String get userSettingsNavLimitsConfig => 'Configuración de límites';

  @override
  String get userSettingsNavFeatureFlags => 'Indicadores de funciones';

  @override
  String get userSettingsNavWhatsNew => 'Novedades';

  @override
  String get userSettingsNavLogOut => 'Cerrar sesión';

  @override
  String get betaWarningTitle => 'Software en versión beta';

  @override
  String get betaWarningMessage =>
      'Este software está en versión beta. No todo está terminado o añadido todavía.';

  @override
  String get betaWarningReportIssues =>
      'Por favor, informa de cualquier problema que encuentres a la comunidad de Fluxer Mobile (debes tener Plutonium para poder unirte a la comunidad actualmente).';

  @override
  String get betaWarningRepoLink => 'Ver código fuente en GitHub';

  @override
  String get betaWarningGotIt => 'Entendido';

  @override
  String get quickSwitcherTabSearch => 'Buscar';

  @override
  String get quickSwitcherTabFriends => 'Amigos';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Buscar canales, personas o comunidades';

  @override
  String get quickSwitcherSearchFriends => 'Buscar amigos';

  @override
  String get quickSwitcherNoMatchesFound => 'No se encontraron coincidencias';

  @override
  String get quickSwitcherEmptyHint =>
      'Intenta con otro nombre o utiliza los prefijos @ / # / ! / * para filtrar los resultados.';

  @override
  String get quickSwitcherSectionPeople => 'Personas';

  @override
  String get quickSwitcherSectionGroupMessages => 'Mensajes grupales';

  @override
  String get quickSwitcherSectionTextChannels => 'Canales de texto';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Canales de voz';

  @override
  String get quickSwitcherSectionCommunities => 'Comunidades';

  @override
  String get quickSwitcherSectionSettings => 'Ajustes';

  @override
  String get quickSwitcherHomeLabel => 'Inicio';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Mensajes directos';

  @override
  String get quickSwitcherFavoritesLabel => 'Favoritos';

  @override
  String get quickSwitcherUserSettingsLabel => 'Ajustes de usuario';

  @override
  String get quickSwitcherNotificationsLabel => 'Notificaciones';

  @override
  String get quickSwitcherBookmarksLabel => 'Marcadores';

  @override
  String get quickSwitcherMentionsLabel => 'Menciones';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Aún no tienes amigos';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Agrega a un amigo para empezar.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'No hay amigos que coincidan con esa búsqueda';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Prueba con otro nombre.';

  @override
  String get quickSwitcherSearchAliasUser => 'Usuario';

  @override
  String get quickSwitcherSearchAliasYou => 'Tú';

  @override
  String get quickSwitcherSearchAliasDm => 'Chat';

  @override
  String get quickSwitcherSearchAliasDms => 'Chats';

  @override
  String get quickSwitcherSearchAliasMessages => 'Mensajes';

  @override
  String get quickSwitcherSearchAliasFav => 'Fav';

  @override
  String get quickSwitcherSearchAliasStarred => 'Destacado';

  @override
  String get quickSwitcherSearchAliasInbox => 'Bandeja de entrada';

  @override
  String get quickSwitcherSearchAliasSaved => 'Guardado';

  @override
  String get uiClose => 'Cerrar';

  @override
  String get chatJumpToBottom => 'Ir al final';

  @override
  String get uiConfirm => 'Confirmar';

  @override
  String get uiLoading => 'Cargando';

  @override
  String get uiUnsavedChanges => 'Cambios sin guardar';

  @override
  String get uiReset => 'Restablecer';

  @override
  String get uiOpenColorPicker => 'Abrir selector de color';

  @override
  String get uiSelectPlaceholder => 'Seleccionar';

  @override
  String get uiSearchPlaceholder => 'Buscar';

  @override
  String get uiNoOptionsFound => 'No se encontraron opciones';

  @override
  String get uiDismissNotification => 'Descartar notificación';

  @override
  String get uiColorPickerTitle => 'Selector de color';

  @override
  String get mentionConfirmTitle => 'Mencionar a todos';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Esto notificará a $count miembros. ¿Continuar?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Esto notificará a $count miembros conectados. ¿Continuar?';
  }

  @override
  String get mentionConfirmButton => 'Mencionar';

  @override
  String get composerEmojiUnavailable => 'No puedes usar ese emoji aquí.';

  @override
  String get instanceUrlLabel => 'URL de la instancia';

  @override
  String get instanceUrlPlaceholder =>
      'Introduce la URL de la instancia (ej. fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Restablecer a Fluxer';

  @override
  String get instanceConnect => 'Conectar';

  @override
  String get instanceConnecting => 'Conectando…';

  @override
  String get instanceConnectFailed => 'No se pudo conectar a la instancia';

  @override
  String get recentInstances => 'Instancias recientes';

  @override
  String removeRecentInstance(String domain) {
    return 'Eliminar $domain de las instancias recientes';
  }

  @override
  String get instanceSheetTitle => 'Conectarse a la instancia';

  @override
  String get connectToDifferentInstance =>
      'Conectarse a una instancia diferente';

  @override
  String get changeInstance => 'Cambiar';

  @override
  String get instanceConnectionRequired =>
      'Conecta a la instancia para iniciar sesión';

  @override
  String get comingSoon => 'Próximamente';

  @override
  String get guildNavbarDirectMessages => 'Mensajes directos';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Explorar comunidades descubribles';

  @override
  String get discoveryExplore => 'Explorar';

  @override
  String get discoveryExplorePublicCommunities =>
      'Explorar comunidades públicas';

  @override
  String get discoveryListingSubheading =>
      'Quieres listar tu comunidad aquí? Postula si cumples los requisitos en la configuración de tu comunidad > Descubrimiento.';

  @override
  String get discoverySearchCommunities => 'Buscar comunidades';

  @override
  String get discoveryFilterByLanguage => 'Filtrar por idioma';

  @override
  String get discoveryAllLanguages => 'Todos los idiomas';

  @override
  String get discoveryAllCategories => 'Todos';

  @override
  String get discoveryCategoryGaming => 'Videojuegos';

  @override
  String get discoveryCategoryMusic => 'Música';

  @override
  String get discoveryCategoryEntertainment => 'Entretenimiento';

  @override
  String get discoveryCategoryEducation => 'Educación';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Ciencia y Tecnología';

  @override
  String get discoveryCategoryContentCreator => 'Creador de Contenido';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime y Manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Películas y TV';

  @override
  String get discoveryCategoryOther => 'Otro';

  @override
  String get discoveryNoCommunitiesMatch => 'No hay comunidades que coincidan.';

  @override
  String get discoveryJoinCommunity => 'Unirse a la comunidad';

  @override
  String get discoveryJoined => 'Unido';

  @override
  String discoveryOnlineCount(String count) {
    return '$count en línea';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString miembros',
      one: '1 miembro',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Sin descripción.';

  @override
  String get discoveryCommunities => 'Comunidades';

  @override
  String get discoveryApps => 'Apps';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'No se pudo unir a esta comunidad';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Algo salió mal. Intenta de nuevo en un momento.';

  @override
  String get discoveryJoinErrorFullTitle => 'Esta comunidad está llena';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Esta comunidad alcanzó su límite de miembros, así que no puedes unirte ahora.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Alcanzaste el límite de comunidades';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Estás en el número máximo de comunidades. Sal de una e inténtalo de nuevo.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'No puedes unirte a esta comunidad';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Has sido expulsado de esta comunidad.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Esta comunidad ya no está disponible';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Puede que haya salido de Descubrimiento o haya desactivado las nuevas uniones. Actualiza la página y no la volverás a ver.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Vas muy rápido';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Espera un momento e inténtalo de nuevo.';

  @override
  String get guildNavbarAddCommunity => 'Agregar una comunidad';

  @override
  String get guildNavbarHelp => 'Ayuda';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'NUEVO MENSAJE';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Contraer $folderName';
  }

  @override
  String get guildNavbarGroupDm => 'DM Grupal';

  @override
  String get guildNavbarCreateChannel => 'Crear canal';

  @override
  String get guildNavbarChannelType => 'Tipo de canal';

  @override
  String get guildNavbarTextChannel => 'Canal de texto';

  @override
  String get guildNavbarTextChannelDescription =>
      'Envía mensajes, imágenes, GIFs y emojis';

  @override
  String get guildNavbarVoiceChannel => 'Canal de voz';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Pasa tiempo con otros usando voz, video y compartir pantalla';

  @override
  String get guildNavbarLinkChannel => 'Canal de enlace';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Acceso rápido a un sitio web o recurso externo';

  @override
  String get guildNavbarNameLabel => 'Nombre';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarCreateCategory => 'Crear categoría';

  @override
  String get guildNavbarNewCategoryHint => 'Nueva Categoría';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Invita amigos a $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Los destinatarios irán a #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Buscar amigos';

  @override
  String get guildNavbarNoFriendsYet => 'Aún no tienes amigos';

  @override
  String get guildNavbarNoResults => 'Sin resultados';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'O envía un enlace de invitación a un amigo:';

  @override
  String get guildNavbarInviteLink => 'Enlace de invitación';

  @override
  String get guildNavbarCopy => 'Copiar';

  @override
  String get guildNavbarCopied => '¡Copiado!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Tu enlace de invitación expira en 7 días.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Este enlace de invitación nunca expira.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Tu enlace de invitación expira en $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Editar enlace de invitación';

  @override
  String get guildNavbarInviteLinkSettings =>
      'Configuración del enlace de invitación';

  @override
  String get guildNavbarExpireAfter => 'Expirar después de';

  @override
  String get guildNavbarMaxUses => 'Número máximo de usos';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Otorgar membresía temporal';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Los miembros serán eliminados cuando se desconecten, a menos que se les asigne un rol';

  @override
  String get guildNavbarCreateNewLink => 'Crear nuevo enlace';

  @override
  String get guildNavbarSent => 'Enviado';

  @override
  String get guildNavbarInvite => 'Invitar';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Abandonar comunidad';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      '¿Estás seguro de que quieres abandonar esta comunidad? Ya no podrás ver ningún mensaje.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Abandonar Comunidad';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      '¿Eliminar tus mensajes en esta comunidad?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Elimina permanentemente todos los mensajes que has enviado aquí, en todos los canales. No se puede deshacer.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Eliminar Mis Mensajes';

  @override
  String get guildNavbarDeletedYourMessages => 'Se eliminaron tus mensajes';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'No se pudieron eliminar tus mensajes';

  @override
  String get guildNavbarRemoveOverride => 'Eliminar anulación';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Silenciado hasta $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible =>
      'Solo accesible para el personal de Fluxer';

  @override
  String get guildNavbarInvitesPaused =>
      'Las invitaciones están actualmente pausadas en esta comunidad';

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
  String get guildNavbarNoLimit => 'Sin límite';

  @override
  String get guildNavbarOneUse => '1 uso';

  @override
  String guildNavbarUses(int count) {
    return '$count usos';
  }

  @override
  String get guildMenuMarkAsRead => 'Marcar como leído';

  @override
  String get guildPeekMoreOptions => 'Más opciones';

  @override
  String get guildMenuInviteMembers => 'Invitar miembros';

  @override
  String get guildMenuCommunitySettings => 'Configuración de la comunidad';

  @override
  String get guildMenuEditCommunityProfile => 'Editar perfil de la comunidad';

  @override
  String get guildMenuUnmuteCommunity => 'Activar comunidad';

  @override
  String get guildMenuMuteCommunity => 'Silenciar comunidad';

  @override
  String get guildMenuHideMutedChannels => 'Ocultar canales silenciados';

  @override
  String get guildMenuReportCommunity => 'Reportar comunidad';

  @override
  String get guildMenuDebugCommunity => 'Depurar comunidad';

  @override
  String get guildMenuCopyCommunityId => 'Copiar ID de comunidad';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Hasta las $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'General';

  @override
  String get guildMenuSettingsRoles => 'Roles y permisos';

  @override
  String get guildMenuSettingsEmoji => 'Emojis personalizados';

  @override
  String get guildMenuSettingsStickers => 'Stickers personalizados';

  @override
  String get guildMenuSettingsSafetyModeration => 'Seguridad y moderación';

  @override
  String get guildMenuSettingsActivityLog => 'Activity Log';

  @override
  String get guildMenuSettingsWebhooks => 'Webhooks';

  @override
  String get guildMenuSettingsCustomInviteUrl =>
      'URL de invitación personalizada';

  @override
  String get guildMenuSettingsDiscovery => 'Descubrimiento';

  @override
  String get guildMenuSettingsMembers => 'Miembros';

  @override
  String get guildMenuSettingsInviteLinks => 'Enlaces de invitación';

  @override
  String get guildMenuSettingsBans => 'Prohibiciones';

  @override
  String get guildSettingsNoPermission =>
      'No tienes permiso para ver esta pestaña de configuración.';

  @override
  String get guildSettingsOverviewIconTitle => 'Icono';

  @override
  String get guildSettingsUploadImage => 'Subir imagen';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Sube un banner para tu servidor.';

  @override
  String get guildSettingsOverviewNameTitle => 'Nombre';

  @override
  String get guildSettingsOverviewNameHint => 'Mi comunidad genial';

  @override
  String get guildSettingsOverviewStatsTitle => 'Estadísticas';

  @override
  String get guildSettingsOverviewMembers => 'Miembros';

  @override
  String get guildSettingsOverviewOnline => 'En línea';

  @override
  String get guildSettingsRolesDescription =>
      'Usa roles para agrupar miembros y asignar permisos.';

  @override
  String get guildSettingsCreateRole => 'Crear rol';

  @override
  String get guildSettingsRolesListTitle => 'Roles';

  @override
  String guildSettingsEmojiSlotInfo(int staticCount, int animatedCount) {
    return '$staticCount ranuras de emoji estáticas, $animatedCount animadas usadas';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Aún no hay emojis personalizados.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count stickers subidos';
  }

  @override
  String get guildSettingsStickersEmpty =>
      'Aún no hay stickers personalizados.';

  @override
  String get guildSettingsModerationVerificationTitle =>
      'Verificación de miembros';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Elige lo que los miembros deben tener antes de poder publicar o enviar mensajes directos a miembros de la comunidad.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Los miembros con roles pueden omitir estas verificaciones. Para espacios públicos, recomendamos habilitar la verificación.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Las comunidades listadas en Descubrimiento requieren al menos un correo electrónico verificado. No se puede seleccionar Ninguno mientras Descubrimiento esté habilitado.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Contenido para adultos y advertencias de contenido';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Configura el etiquetado de contenido para adultos y las advertencias de contenido opcionales para los miembros.';

  @override
  String get guildSettingsModerationMatureToggle => 'Contenido para adultos';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Marca esta comunidad como que contiene contenido para adultos.';

  @override
  String get guildSettingsVerificationNone => 'Ninguna';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'No se requiere verificación.';

  @override
  String get guildSettingsVerificationLow => 'Baja';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Requiere una dirección de correo electrónico verificada.';

  @override
  String get guildSettingsVerificationMedium => 'Media';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Requiere una dirección de correo electrónico verificada y una cuenta con al menos 5 minutos de antigüedad.';

  @override
  String get guildSettingsVerificationHigh => 'Alta';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Requiere todo lo del nivel medio, además de ser miembro de la comunidad durante al menos 10 minutos.';

  @override
  String get guildSettingsVerificationHighest => 'Muy alto';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Requiere un número de teléfono verificado.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Registra las acciones de los moderadores en toda la comunidad.';

  @override
  String get guildSettingsAuditLogEmpty => 'Aún no hay registros';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Las acciones de moderación y los cambios de la comunidad aparecerán aquí.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Todos los usuarios';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Todas las acciones';

  @override
  String get guildSettingsAuditLogNoReason =>
      'No se proporcionó ninguna razón.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Usuario desconocido';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Ocurrió un error al cargar el registro de actividad.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'No se pueden cargar los registros de actividad';

  @override
  String get guildSettingsAuditLogReason => 'Razón';

  @override
  String get guildSettingsAuditLogSomeone => 'alguien';

  @override
  String get guildSettingsAuditLogSomething => 'algo';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'entidad desconocida';

  @override
  String get guildSettingsAuditLogNothing => 'nada';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Destino desconocido';

  @override
  String get auditLogActionGuildUpdate => 'Comunidad actualizada';

  @override
  String get auditLogActionChannelCreate => 'Canal creado';

  @override
  String get auditLogActionChannelUpdate => 'Canal actualizado';

  @override
  String get auditLogActionChannelDelete => 'Canal eliminado';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Se agregó una sobreescritura de canal';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Se actualizó una sobreescritura de canal';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Se eliminó una sobreescritura de canal';

  @override
  String get auditLogActionMemberKick => 'Miembro expulsado';

  @override
  String get auditLogActionMemberPrune => 'Miembros eliminados';

  @override
  String get auditLogActionMemberBanAdd => 'Miembro prohibido';

  @override
  String get auditLogActionMemberBanRemove => 'Miembro no prohibido';

  @override
  String get auditLogActionMemberUpdate => 'Miembro actualizado';

  @override
  String get auditLogActionMemberRoleUpdate => 'Roles de miembro actualizados';

  @override
  String get auditLogActionMemberMove => 'Miembro movido';

  @override
  String get auditLogActionMemberDisconnect => 'Miembro desconectado';

  @override
  String get auditLogActionBotAdd => 'Bot agregado';

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
  String get auditLogActionStickerCreate => 'Sticker creado';

  @override
  String get auditLogActionStickerUpdate => 'Sticker actualizado';

  @override
  String get auditLogActionStickerDelete => 'Sticker eliminado';

  @override
  String get auditLogActionMessageDelete => 'Mensaje eliminado';

  @override
  String get auditLogActionMessageBulkDelete => 'Mensajes eliminados';

  @override
  String get auditLogActionMessagePin => 'Mensaje fijado';

  @override
  String get auditLogActionMessageUnpin => 'Mensaje desanclado';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor actualizó la configuración de la comunidad.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor creó el canal $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor actualizó el canal $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor eliminó el canal $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor agregó permisos de canal para $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor agregó permisos de canal para $target en $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor actualizó los permisos de canal para $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor actualizó los permisos de canal para $target en $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor eliminó los permisos de canal para $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor eliminó los permisos de canal para $target en $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor expulsó a $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor baneó a $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor desbaneó a $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor actualizó a $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor actualizó los roles de $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor eliminó miembros inactivos.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor eliminó miembros inactivos por $days días.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor movió a $target a otro canal de voz.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor movió a $target a $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor desconectó a $target de voz.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor agregó el bot $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor creó el rol $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor actualizó el rol $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor eliminó el rol $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor creó la invitación $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor creó la invitación $target para $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor actualizó la invitación $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor actualizó la invitación $target para $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor eliminó la invitación $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor eliminó la invitación $target para $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor creó el webhook $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor actualizó el webhook $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor eliminó el webhook $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor agregó el emoji $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor actualizó el emoji $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor eliminó el emoji $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor agregó el sticker $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor actualizó el sticker $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor eliminó el sticker $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor eliminó un mensaje.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor eliminó un mensaje en $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor eliminó varios mensajes.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor eliminó $count mensajes.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor eliminó varios mensajes en $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor eliminó $count mensajes en $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor fijó un mensaje.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor fijó un mensaje en $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor desancló un mensaje.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor desancló un mensaje en $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor realizó una acción de auditoría sobre $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Se actualizó $field de $oldValue a $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Se estableció $field en $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Se borró $field (era $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Se actualizó $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Se cambió el nombre de la comunidad a $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Se actualizó el ícono de la comunidad.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Se cambió el nombre del canal a $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Se borró el tema.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Se actualizó el tema a $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'Se habilitó contenido para adultos.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Se deshabilitó contenido para adultos.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Se estableció el apodo a $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Se eliminó el apodo $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Se silenció al miembro.';

  @override
  String get auditLogChangeUnmutedMember => 'Se dejó de silenciar al miembro.';

  @override
  String get auditLogChangeDeafenedMember =>
      'Se puso en modo sordo al miembro.';

  @override
  String get auditLogChangeUndeafenedMember =>
      'Se quitó el modo sordo al miembro.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Se agregaron $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Se eliminaron $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Canal: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Mensaje: $value.';
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
      other: 'Se eliminaron # mensajes.',
      one: 'Se eliminó # mensaje.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se eliminaron # miembros.',
      one: 'Se eliminó # miembro.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'Esta invitación nunca expira.';

  @override
  String get auditLogOptionTemporaryMembership => 'Otorga membresía temporal.';

  @override
  String get auditLogOptionPermanentMembership =>
      'Otorga membresía permanente.';

  @override
  String get guildSettingsLoadMore => 'Cargar más';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Administra los webhooks que publican mensajes en los canales.';

  @override
  String get guildSettingsWebhooksEmpty => 'No hay webhooks configurados.';

  @override
  String get guildSettingsCopyUrl => 'Copiar URL';

  @override
  String get guildSettingsCopiedUrl => 'URL copiada al portapapeles';

  @override
  String get guildSettingsDeleteWebhook => 'Eliminar webhook';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Establece un enlace de invitación personalizado para tu servidor.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Guardar';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Uso';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count usos';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Solicita ser incluido en la lista de descubrimiento de servidores.';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Se requieren al menos $count miembros para solicitar.';
  }

  @override
  String get guildSettingsDiscoveryFormTitle => 'Solicitud';

  @override
  String get guildSettingsDiscoveryStatusTitle => 'Estado';

  @override
  String get guildSettingsDiscoveryCategory => 'Categoría';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Descripción';

  @override
  String get guildSettingsDiscoveryTags => 'Etiquetas';

  @override
  String get guildSettingsDiscoveryTagsHint => 'juegos, arte, música';

  @override
  String get guildSettingsDiscoveryApply => 'Enviar solicitud';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Retirar';

  @override
  String get guildSettingsMembersDescription =>
      'Busca y administra los miembros de la comunidad.';

  @override
  String get guildSettingsMembersSearchHint => 'Busca miembros';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count miembros';
  }

  @override
  String get guildSettingsInvitesDescription =>
      'Ve y revoca los enlaces de invitación activos.';

  @override
  String get guildSettingsInvitesEmpty => 'No hay invitaciones activas.';

  @override
  String guildSettingsInviteUses(int uses, int maxUses) {
    return '$uses / $maxUses usos';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Expira el $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Ve y administra los usuarios baneados.';

  @override
  String get guildSettingsBansSearchHint => 'Busca baneos';

  @override
  String get guildSettingsBansEmpty => 'No hay usuarios baneados.';

  @override
  String get guildSettingsBanPermanent => 'Baneo permanente';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Expira el $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Expira';

  @override
  String get guildSettingsUnban => 'Desbanear';

  @override
  String get guildSettingsBansLoading => 'Cargando usuarios baneados';

  @override
  String get guildSettingsBansNoSearchResults =>
      'No se encontraron baneos que coincidan con tu búsqueda.';

  @override
  String get guildSettingsBanDetailsTitle => 'Detalles del baneo';

  @override
  String get guildSettingsBanViewDetails => 'Ver detalles';

  @override
  String get guildSettingsBannedOn => 'Baneado el';

  @override
  String get guildSettingsBannedBy => 'Baneado por';

  @override
  String get guildSettingsRevokeBanTitle => 'Revocar baneo';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return '¿Estás seguro de que quieres revocar el baneo de $displayName? Podrá volver a unirse a la comunidad.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Baneo revocado para $displayName';
  }

  @override
  String get guildSettingsBansLoadError =>
      'No se pudieron cargar los baneos. Intenta de nuevo.';

  @override
  String get guildSettingsRevokeBanError =>
      'No se pudo revocar el baneo. Intenta de nuevo.';

  @override
  String get guildSettingsCommunitySettings => 'Configuración de la comunidad';

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
      'Administra el perfil, los canales y la configuración predeterminada de tu comunidad.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Marca';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Actualiza tu ícono, nombre, banner y fondo de invitación';

  @override
  String get guildSettingsOverviewBannerUpload => 'Subir banner';

  @override
  String get guildSettingsOverviewIdleTitle => 'Configuración de inactividad';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Configura el canal AFK y el tiempo de espera';

  @override
  String get guildSettingsOverviewSystemTitle => 'Sistema y bienvenida';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Elige el destino de los mensajes del sistema y de bienvenida';

  @override
  String get guildSettingsOverviewNotificationsTitle =>
      'Notificaciones predeterminadas';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Las comunidades con más de 250 personas se ven forzadas a la configuración de \"solo menciones\". Tu configuración original se conserva y se restaurará si la comunidad desciende por debajo de los 250 miembros.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Avanzado';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Permitir nombres de canales de texto flexibles';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Ocultar la corona del propietario de la comunidad';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Banner separado';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Muestra el banner en su propia sección debajo del encabezado de la comunidad.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Subir ícono';

  @override
  String get guildSettingsOverviewRemoveImage => 'Eliminar';

  @override
  String get guildSettingsOverviewSplashTitle => 'Fondo de invitación';

  @override
  String get guildSettingsOverviewEmbedSplashTitle =>
      'Fondo de incrustación de chat';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Se muestra en las incrustaciones de invitación en el chat.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Subir fondo';

  @override
  String get guildSettingsOverviewNoCommunityBanner =>
      'Sin banner de comunidad';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'Sin fondo de invitación';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Vista previa';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Mira cómo se ve tu invitación para los visitantes.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Nombres de canales de texto';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Corona de propietario de la comunidad';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Configura si el ícono de la corona se muestra junto al propietario de la comunidad';

  @override
  String get guildSettingsSplashCardAlignment => 'Alineación de la tarjeta';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Centro';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Izquierda';

  @override
  String get guildSettingsSplashAlignmentRight => 'Derecha';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Solo aplica en pantallas anchas.';

  @override
  String get permissionReadMessageHistory => 'Leer historial de mensajes';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Cambia lo que los usuarios sin \"$permission\" pueden ver';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Usa un modal dedicado para establecer una fecha límite de historial de mensajes para los miembros que no tengan el permiso $permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Abrir umbral de historial de mensajes';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Umbral de historial de mensajes';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Habilitar umbral de historial de mensajes';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Fecha límite';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Los miembros sin Leer historial de mensajes pueden ver los mensajes enviados después de esta fecha.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Umbral de historial de mensajes actualizado';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Permite mayúsculas y espacios en los nombres de los canales de texto. Desactivado restringe los nombres a minúsculas con guiones y guiones bajos.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Oculta el ícono de la corona junto al propietario de la comunidad en todas las superficies.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Los íconos animados requieren la función de comunidad de Íconos animados.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Los banners animados requieren la función de comunidad de Banner animado.';

  @override
  String get guildSettingsAfkChannel => 'Canal AFK / inactivo';

  @override
  String get guildSettingsAfkChannelHint =>
      'Mueve a los miembros a este canal cuando estén AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Sin canal AFK';

  @override
  String get guildSettingsAfkTimeout => 'Tiempo de espera AFK';

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
  String get guildSettingsSystemChannel => 'Canal de destino';

  @override
  String get guildSettingsSystemChannelHint =>
      'Los mensajes de bienvenida y del sistema aparecerán aquí.';

  @override
  String get guildSettingsNoSystemChannel => 'Sin canal de sistema';

  @override
  String get guildSettingsHideJoinMessages => 'Ocultar mensajes de unión';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Suprime los mensajes de unión en el canal de destino.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Configuración de notificación predeterminada';

  @override
  String get guildSettingsNotificationsAll => 'Todos los mensajes';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Notificar sobre todos los mensajes';

  @override
  String get guildSettingsNotificationsMentions => 'Solo menciones';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Notificar solo sobre menciones';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Máximo 10 MB. Mínimo: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Máximo 10 MB. Mínimo: 960×540px (16:9). Se muestra en las incrustaciones de invitación en el chat.';

  @override
  String get guildSettingsModerationDescription =>
      'Configura la verificación, el filtrado de contenido y los ajustes de contenido para adultos.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Las comunidades listadas en Discovery tienen opciones de moderación restringidas.';

  @override
  String get guildSettingsModerationContentFilterTitle =>
      'Filtrado de contenido';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Examina automáticamente los mensajes en busca de contenido explícito en canales que no están marcados para contenido para adultos.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Las comunidades listadas en Discovery deben escanear a todos los miembros. Esta configuración no se puede cambiar mientras Discovery esté habilitado.';

  @override
  String get guildSettingsContentFilterOff => 'Desactivado';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Permite que la comunidad se automodeere';

  @override
  String get guildSettingsContentFilterNoRole => 'Filtrar miembros sin roles';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Recomendado para la mayoría de las comunidades';

  @override
  String get guildSettingsContentFilterAll => 'Filtrar a todos';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Máxima protección para espacios familiares';

  @override
  String get guildSettingsModerationMatureOff => 'Desactivado';

  @override
  String get guildSettingsModerationMatureOn => 'Activado';

  @override
  String get guildSettingsContentWarningToggle =>
      'Mostrar advertencia de contenido';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Activa una solicitud de consentimiento antes de entrar a cualquier canal.';

  @override
  String get guildSettingsContentWarningText =>
      'Texto personalizado de advertencia';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Esto contiene contenido sensible.';

  @override
  String get guildSettingsModeration2faTitle => 'Requisito de 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'Requiere autenticación de dos factores para los moderadores antes de que puedan prohibir, expulsar, silenciar temporalmente o eliminar mensajes.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Requerir 2FA para acciones de moderación';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Solo el propietario de la comunidad puede cambiar esta configuración';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Activa 2FA en tu cuenta para cambiar esta configuración';

  @override
  String get guildSettingsEmojiSearchHint => 'Buscar emojis';

  @override
  String get guildSettingsEmojiUploadTitle => 'Subir emoji';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Emoji no animado ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Emoji animado ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Buscar stickers';

  @override
  String get guildSettingsWebhooksInfo =>
      'Crea webhooks desde la configuración del canal. Edítalos aquí.';

  @override
  String get guildSettingsVanityUrlWarning =>
      'Tu URL personalizada no funcionará a menos que al menos un canal sea visible para todos.';

  @override
  String get guildSettingsVanityUrlRemove => 'Eliminar';

  @override
  String get guildSettingsBannedUsersTitle => 'Usuarios prohibidos';

  @override
  String get guildSettingsInvitesTableInviter => 'Quien invitó';

  @override
  String get guildSettingsInvitesTableChannel => 'Canal';

  @override
  String get guildSettingsInvitesTableCode => 'Código';

  @override
  String get guildSettingsInvitesTableUses => 'Usos';

  @override
  String get guildSettingsInvitesTableCreated => 'Creado';

  @override
  String get guildSettingsMembersSortNewest => 'Más recientes primero';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtrar por usuario';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtrar por acción';
}
