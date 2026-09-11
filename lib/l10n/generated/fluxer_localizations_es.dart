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
      'Tu sesión ha expirado. Por favor inicia sesión de nuevo.';

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
  String get nagbarLearnMore => 'Más información';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'Mantenimiento programado para las $localizedTime. Duración estimada: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Mantenimiento en curso. Duración prevista: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'Mantenimiento completado.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Hola, $displayName: reclama tu cuenta para no perder el acceso.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Hola, $displayName: verifica tu dirección de correo electrónico.';
  }

  @override
  String get nagbarOpenSettings => 'Abrir ajustes';

  @override
  String get systemPermissionSettingsTitle => 'Activar permiso';

  @override
  String get systemPermissionSettingsOpenSettings => 'Abrir ajustes';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName no tiene acceso a tu micrófono. Puedes habilitarlo en los ajustes de privacidad de tu dispositivo.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName no tiene acceso a tu cámara. Puedes habilitarla en los ajustes de privacidad de tu dispositivo.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName no tiene acceso a tu fototeca. Puedes activarlo en los ajustes de privacidad de tu dispositivo.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName no tiene permiso para enviar notificaciones. Puedes habilitarlo en los ajustes de tu dispositivo.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Tu suscripción no se renovó, pero aún tienes acceso a las ventajas de $productName hasta el $graceDate. Actúa ahora o perderás todas las ventajas.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Tu suscripción a $productName ha caducado. Renueva ahora para conservar tus ventajas.';
  }

  @override
  String get nagbarManageSubscription => 'Gestionar suscripción';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Bienvenido a $productFullName. Explora tus ventajas de $productName y gestiona tu suscripción.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'Descubrir las ventajas de $productName';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'Tienes un nuevo código de regalo esperándote en tu inventario de regalos.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'Tienes $count códigos de regalo nuevos esperando en tu inventario de regalos.';
  }

  @override
  String get nagbarViewGiftInventory => 'Ver inventario de regalos';

  @override
  String get nagbarVisionaryMfa =>
      'Activa la autenticación de dos factores para proteger tu cuenta de Visionary.';

  @override
  String get nagbarEnableMfa => 'Activar autenticación de doble factor';

  @override
  String get nagbarTermsAcceptance =>
      'Hemos actualizado nuestros términos. Revísalos y acéptalos para continuar.';

  @override
  String get nagbarReviewTerms => 'Revisar términos';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Únete a $communityName para hablar con el equipo y mantenerte al día.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Unirse a $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'Activa las notificaciones para no perderte mensajes y menciones.';

  @override
  String get nagbarEnableNotifications => 'Activar notificaciones';

  @override
  String get nagbarBillingPortalFailed =>
      'No se pudo abrir el portal de facturación. Inténtalo de nuevo en un momento.';

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
  String get next => 'Siguiente';

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
  String get registerPendingApproval =>
      'Tu solicitud de cuenta está pendiente de aprobación. Podrás iniciar sesión cuando un administrador la apruebe.';

  @override
  String get registerClosed =>
      'El registro está cerrado actualmente. Usa un enlace de registro de un administrador para crear una cuenta.';

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
  String get errorServiceUnavailable =>
      'Esta instancia no está disponible temporalmente. Vuelve a intentarlo en un momento.';

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
  String get embedInviteJoinGroup => 'Unirse al grupo';

  @override
  String get embedInviteAlreadyJoined => 'Ya te has unido';

  @override
  String get embedInviteDisabled => 'Invitaciones deshabilitadas';

  @override
  String get embedInvitePaused =>
      'Las invitaciones están en pausa para esta comunidad.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName ha detectado un posible ataque, por lo que los nuevos usuarios no pueden unirse ahora mismo.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Esta comunidad ha pausado las invitaciones. Puedes intentarlo de nuevo más tarde.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName ha detectado un posible ataque en esta comunidad. Las invitaciones están en pausa, por lo que los nuevos usuarios no pueden unirse ahora mismo.';
  }

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
  String get invalidDeepLinkTitle => 'No se pudo abrir el enlace';

  @override
  String get invalidDeepLinkDescription =>
      'El enlace puede estar roto, solo estar disponible en la web o que no tengas acceso. Comprueba el enlace y prueba de nuevo.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Ir al inicio';

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
  String embedGiftVisionaryLifetime(String productName) {
    return 'Visionario (de por vida $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count días de $productName',
      one: '1 día de $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count semanas de $productName',
      one: '1 semana de $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count meses de $productName',
      one: '1 mes de $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count años de $productName',
      one: '1 año de $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'De $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => '¡Toca para reclamar tu regalo!';

  @override
  String get embedGiftAlreadyRedeemed => 'Ya canjeado';

  @override
  String get embedGiftClaimAccountHelp =>
      'Reclama tu cuenta para canjear este regalo.';

  @override
  String get embedGiftClaim => 'Reclamar regalo';

  @override
  String get embedGiftClaimed => 'Regalo reclamado';

  @override
  String get embedGiftClaimAccount => 'Reclama la cuenta para canjear';

  @override
  String get embedGiftUnknownTitle => 'Regalo desconocido';

  @override
  String get embedGiftUnknownSubtitle =>
      'Este código de regalo no es válido o ya ha sido canjeado.';

  @override
  String get embedGiftUnavailable => 'Regalo no disponible';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return '¡Reclama tu regalo para activar tu suscripción a $productName!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'Este regalo ya ha sido reclamado.';

  @override
  String get giftAcceptMaybeLater => 'Quizá más tarde';

  @override
  String get giftRedeemedToast => '¡Regalo canjeado!';

  @override
  String get giftRedeemInvalidTitle => 'Código de regalo no válido';

  @override
  String get giftRedeemInvalidMessage =>
      'Este código no es válido o ya se ha usado.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Regalo ya canjeado';

  @override
  String get giftRedeemAlreadyRedeemedMessage =>
      'Este código ya ha sido canjeado.';

  @override
  String get giftRedeemNotFoundTitle => 'Regalo no encontrado';

  @override
  String get giftRedeemNotFoundMessage => 'Este código no existe.';

  @override
  String get giftRedeemFailedTitle => 'No se pudo canjear el regalo';

  @override
  String get giftRedeemFailedMessage =>
      'No se ha podido canjear este regalo. Inténtalo de nuevo.';

  @override
  String get giftVisionaryCannotRedeemTitle =>
      'No se puede canjear este regalo';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Las cuentas Visionary no pueden canjear regalos de Plutonium. Copia el enlace para compartirlo con un amigo.';

  @override
  String get giftCopyLink => 'Copiar enlace de regalo';

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
  String get notificationUseCategoryDefault =>
      'Usar predeterminado de la categoría';

  @override
  String get notificationUseCommunityDefault =>
      'Usar predeterminados de la comunidad';

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
  String get dmDeleteMyMessagesTitle =>
      '¿Eliminar tus mensajes en esta conversación?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Se eliminarán permanentemente todos los mensajes que hayas enviado en esta conversación. Esta acción no se puede deshacer.';

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
  String get dmUnnamedGroup => 'Grupo sin nombre';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'Grupo de $resolvedName';
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
  String get dmDebugCategory => 'Depurar categoría';

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
  String get addFriendVerifyToSend =>
      'Verifica tu correo electrónico antes de enviar solicitudes de amistad.';

  @override
  String get addFriendFriendsListFull =>
      'Tu lista de amigos está llena, o la suya lo está. Elimina a alguien e inténtalo de nuevo.';

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
  String emojiInfoDefaultDescription(String productName) {
    return 'Este es un emoji predeterminado en $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'Este emoji es de esta comunidad. Puedes usarlo en cualquier lugar.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'Este es un emoji personalizado de una comunidad.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'Este es un emoji personalizado de una comunidad. Pide al autor una invitación para usar este emoji.';

  @override
  String get emojiInfoFromHeader => 'Este emoji es de';

  @override
  String get emojiInfoDiscoverableCommunity => 'Comunidad visible';

  @override
  String get emojiInfoPrivateCommunity => 'Comunidad privada';

  @override
  String get emojiInfoVerifiedCommunity => 'Comunidad verificada';

  @override
  String get emojiInfoAddToFavorites => 'Añadir a favoritos';

  @override
  String get emojiInfoRemoveFromFavorites => 'Eliminar de favoritos';

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
  String get gifPickerFavoritesEmptyTitle => 'Aún no tienes GIF favoritos';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Marca un GIF para verlo aquí.';

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
  String externalLinkWarningLeaving(String productName) {
    return 'Estás a punto de salir de $productName';
  }

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
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => 'Cambiar tu Nombre de usuario';

  @override
  String get fluxerTagInputLabel => 'Nombre de usuario';

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
  String get fluxerTagAlreadyTaken => 'Nombre de usuario ya en uso';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'El Nombre de usuario $username#$discriminator ya está en uso. Continuar volverá a generar tu discriminador automáticamente.';
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
      'Si guardas este Nombre de usuario, tu etiqueta personalizada de 4 dígitos volverá a ser un número aleatorio cuando finalice tu suscripción a Plutonium. Si tu suscripción no se renueva, tendrás un período de gracia de 3 días antes de que cambie la etiqueta.';

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
  String get fluxerTagUpdated => 'Nombre de usuario actualizado';

  @override
  String get fluxerTagUpdateFailed =>
      'Error al actualizar Nombre de usuario. Inténtalo de nuevo.';

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
      'Reclama tu cuenta para cambiar tu Nombre de usuario';

  @override
  String get changeFluxerTag => 'Cambiar Nombre de usuario';

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
  String profilePreviewMemberSince(String productName) {
    return 'Miembro de $productName desde';
  }

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
      'Protege tu cuenta con autenticación de dos factores y claves de acceso';

  @override
  String get securityLoginEmailSectionTitle => 'Ajustes de correo electrónico';

  @override
  String securityLoginEmailSectionDescription(String productName) {
    return 'Gestiona la dirección de correo electrónico que usas para iniciar sesión en $productName';
  }

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
      'Te enviaremos un código por SMS cuando esté disponible. Tu número no está vinculado a tu cuenta. Solo conservamos un marcador cifrado, sin identificador de usuario, para permitir como máximo 2 verificaciones en unos 30 días.';

  @override
  String get phoneAddSendCode => 'Enviar código';

  @override
  String get phoneVerifyTitle => 'Verificar número de teléfono';

  @override
  String get phoneVerifyDescription =>
      'Introduce el código de verificación enviado a tu número de teléfono.';

  @override
  String get phoneAddSuccess => 'Número de teléfono verificado';

  @override
  String get phoneCountryLabel => 'País';

  @override
  String get phoneSearchCountries => 'Buscar países...';

  @override
  String get phoneNumberRequired => 'Se requiere un número de teléfono';

  @override
  String get phoneEnterValidNumber =>
      'Introduce un número de teléfono móvil válido.';

  @override
  String get phoneCannotBeUsed =>
      'Este número de teléfono no se puede utilizar. Prueba con otro número móvil o contacta con el soporte técnico.';

  @override
  String get phoneAlreadyUsed =>
      'Este número de teléfono ya se ha utilizado. Prueba con otro número o contacta con el soporte técnico.';

  @override
  String get phoneCodeDidNotWork =>
      'El código no funcionó. Compruébalo y prueba de nuevo.';

  @override
  String get phoneTooManyAttempts =>
      'Demasiados intentos. Espera un rato e inténtalo de nuevo.';

  @override
  String get phoneSmsUnavailable =>
      'La verificación por SMS no está disponible ahora mismo. Inténtalo más tarde o contacta a soporte.';

  @override
  String get phoneNotEligible =>
      'La verificación por número de teléfono no está disponible para esta cuenta. Utiliza otro método o contacta a soporte.';

  @override
  String get phoneCaptchaRequired =>
      'Se requiere comprobar el navegador antes de poder verificar tu teléfono. Prueba otra vez desde la página de inicio de sesión o contacta a soporte.';

  @override
  String get phoneSomethingWentWrong => 'Algo salió mal. Inténtalo de nuevo.';

  @override
  String get phoneInboundExpensiveDescription =>
      'Enviar un SMS a este número de teléfono es muy caro, por lo que necesitamos que nos envíes un SMS. También puedes contactar a soporte para que elimine esta restricción de tu cuenta.';

  @override
  String get phoneInboundDefaultDescription =>
      'Necesitamos que nos envíes un SMS para verificar tu número de teléfono.';

  @override
  String get phoneInboundStepOpenMessaging =>
      'Abre la aplicación de mensajes de tu teléfono y crea un nuevo mensaje de texto.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'Envía el código $code a $number.';
  }

  @override
  String get phoneInboundStepWait =>
      'Espera a que recibamos tu mensaje. Puede tardar un rato.';

  @override
  String get phoneInboundGetNewCode => 'Obtener nuevo código';

  @override
  String get phoneInboundChallengeCodeLabel => 'Código a enviar';

  @override
  String get phoneInboundOurNumberLabel => 'Enviar a';

  @override
  String get requiredActionTitle => 'Verificación de cuenta requerida';

  @override
  String requiredActionIntroGeneric(String productName) {
    return 'Completa la verificación para continuar utilizando $productName.';
  }

  @override
  String get requiredActionIntroPhone =>
      'Tu registro necesita una comprobación anti-spam adicional antes de poder continuar.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return 'Verifica tu correo o teléfono para continuar utilizando $productName.';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return 'Completa los pasos de verificación de correo electrónico y teléfono que se indican a continuación para seguir usando $productName.';
  }

  @override
  String get requiredActionChooseMethodTitle =>
      'Escoge un método de verificación';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return 'Completa uno de los siguientes métodos de verificación para continuar utilizando $productName.';
  }

  @override
  String get requiredActionUseEmail => 'Usar el correo electrónico';

  @override
  String get requiredActionUsePhone => 'Utilizar teléfono';

  @override
  String get requiredActionCheckEmailTitle => 'Comprueba tu correo';

  @override
  String get requiredActionCheckEmailDescription =>
      'Hemos enviado un enlace de verificación a tu dirección de correo. Ábrelo para continuar.';

  @override
  String get requiredActionResendVerificationEmail =>
      'Volver a enviar correo de verificación';

  @override
  String get requiredActionVerificationEmailSent =>
      'Correo de verificación enviado. Comprueba tu bandeja de entrada.';

  @override
  String get requiredActionSignOut => 'Cerrar sesión';

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
  String get networkErrorMessage => 'Algo salió mal. Inténtalo de nuevo.';

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
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace # semanas',
      one: 'hace 1 semana',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'en $count minutos',
      one: 'en 1 minuto',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'en $count horas',
      one: 'en 1 hora',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'en $count días',
      one: 'en 1 día',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'en $count semanas',
      one: 'en 1 semana',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'en $count meses',
      one: 'en 1 mes',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'en $count años',
      one: 'en 1 año',
    );
    return 'en $_temp0';
  }

  @override
  String get relativeTimeJustNow => 'justo ahora';

  @override
  String get authorizedAppsTitle => 'Aplicaciones autorizadas';

  @override
  String authorizedAppsDescription(String productName) {
    return 'A estas aplicaciones se les ha concedido acceso a tu cuenta de $productName.';
  }

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
  String get blockedUsersCopyTag => 'Copiar Nombre de usuario';

  @override
  String get blockedUsersCopyId => 'Copiar ID de usuario';

  @override
  String get userProfileLoadError => 'No se ha podido cargar el perfil';

  @override
  String get userProfileLoading => 'Cargando perfil';

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
  String userProfileStaffBadgeTooltip(String productName) {
    return 'Equipo de $productName';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return 'Equipo de la comunidad de $productName';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return 'Socio de $productName';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return 'Cazador de errores de $productName';
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
    return 'Suscriptor de $productName Plutonium desde $date';
  }

  @override
  String userProfileVisionaryBadgeTooltip(String productName) {
    return 'Visionario de $productName';
  }

  @override
  String userProfileVisionaryBadgeSinceTooltip(
    String productName,
    String date,
  ) {
    return 'Visionario de $productName desde $date';
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
  String get userProfileRoles => 'Roles';

  @override
  String get memberRoleAdd => 'Añadir rol';

  @override
  String memberRoleRemove(String roleName) {
    return 'Eliminar rol $roleName';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'Este usuario no tiene ningún rol en esta comunidad.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'Aún no hay roles. Añade roles en $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'No hay roles disponibles';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'En este momento no hay roles para asignar en esta comunidad, pero puedes crear uno nuevo en $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Ajustes de la comunidad';

  @override
  String get guildSettingsRolesTab => 'Roles';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Hora local';

  @override
  String get userProfileSameTimeAsYou => 'Misma hora que tú';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return '$duration más que tú';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return 'A $duration de ti';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours horas',
      one: '1 hora',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minutos',
      one: '1 minuto',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours horas',
      one: '1 hora',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minutos',
      one: '1 minuto',
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
  String get iarReportGuildTitle => 'Reportar comunidad';

  @override
  String get iarReportGuildPreconfirmBody =>
      'Si este informe es sobre un mensaje específico de esta comunidad, informa de ese mensaje en su lugar. Los informes de mensajes proporcionan a nuestro equipo de seguridad el contexto más claro, y añadir detalles en los comentarios puede ayudarnos a revisarlo más rápido. Solo continúa informando sobre la comunidad en su conjunto si informar de un mensaje no reflejaría el problema general.';

  @override
  String get iarContinueToReportCommunity =>
      'Continuar para denunciar a la comunidad';

  @override
  String get iarPreviewCommunitySubtitle => 'Comunidad';

  @override
  String get iarReasonHarassmentGuildLabel => 'Acoso o abuso dirigido';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'La comunidad facilita el acoso colectivo o el abuso dirigido.';

  @override
  String get iarReasonHateGuildDescription =>
      'Promueve el odio contra grupos protegidos.';

  @override
  String get iarReasonTerrorismLabel => 'Terrorismo o extremismo violento';

  @override
  String get iarReasonTerrorismDescription =>
      'Promueve, recluta o coordina actividades extremistas violentas.';

  @override
  String get iarReasonMatureContentGuildLabel =>
      'Contenido para adultos o restricción de seguridad';

  @override
  String get iarReasonMatureContentGuildDescription =>
      'Contenido para adultos sin la clasificación adecuada.';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      'Pone en peligro a menores o aloja contenido de explotación infantil.';

  @override
  String get iarReasonRaidLabel => 'Coordinación de raids';

  @override
  String get iarReasonRaidDescription =>
      'Coordina ataques, acoso organizado o acoso contra personas o comunidades.';

  @override
  String get iarReasonSpamGuildDescription =>
      'La comunidad existe para enviar spam, estafar o abusar de la plataforma.';

  @override
  String get iarReasonMalwareGuildLabel => 'Distribución de malware';

  @override
  String get iarReasonMalwareGuildDescription =>
      'Distribuye malware, robo de credenciales o archivos dañinos.';

  @override
  String get iarReasonPrivacyGuildLabel => 'Violación de privacidad o doxxing';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'Comparte información personal, acosa a usuarios o coordina abusos contra la privacidad.';

  @override
  String get iarReasonSelfHarmGuildLabel => 'Fomenta la autolesión';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'Fomenta el suicidio, las autolesiones o los trastornos alimentarios.';

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
  String get slowmodeStatusEnabled => 'Modo lento activado';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Modo lento activo ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'El modo lento está configurado en $durationLabel, pero eres inmune.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'El modo lento está configurado en $durationLabel. Espera antes de enviar otro mensaje.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'El modo lento está configurado en $durationLabel para este canal.';
  }

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
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName supera el límite de tamaño ($fileSize)';
  }

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
  String get voiceMessageSeekForward => 'Avanzar';

  @override
  String get voiceMessageSeekBackward => 'Retroceder';

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
  String get chatAttachmentDownloadedToast => 'Guardado en fotos';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'No se ha podido descargar el archivo adjunto';

  @override
  String get chatAttachmentExpiredTooltip => 'Archivo adjunto caducado';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Expandir ($count líneas)',
      one: 'Expandir ($count línea)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ocultar ($count líneas)',
      one: 'Ocultar ($count línea)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Expandir ($count filas)',
      one: 'Expandir ($count fila)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ocultar ($count filas)',
      one: 'Ocultar ($count fila)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count líneas restantes)',
      one: '... ($count línea restante)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count filas pendientes)',
      one: '... ($count fila pendiente)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'Ver archivo completo';

  @override
  String get chatTextualPreviewChangeLanguage => 'Cambiar idioma';

  @override
  String get chatTextualPreviewSearchLanguage => 'Buscar idioma…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Resaltado de sintaxis';

  @override
  String get chatTextualPreviewNoLanguagesFound =>
      'No se encontraron resultados';

  @override
  String get chatTextualPreviewMoreOptions => 'Más opciones';

  @override
  String get chatTextualPreviewWrapText => 'Ajustar texto';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'El archivo es demasiado grande para la vista previa en línea (límite $previewLimitKb KB).';
  }

  @override
  String get chatTextualPreviewLoadError =>
      'No se ha podido cargar la vista previa.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Texto sin formato';

  @override
  String get chatTextualPreviewCopy => 'Copiar';

  @override
  String get chatAttachmentSourceGallery => 'Galería';

  @override
  String get chatAttachmentSourceCamera => 'Cámara';

  @override
  String get chatAttachmentSourceBrowse => 'Explorar archivos';

  @override
  String get chatAttachmentPasteTooltip => 'Pegar archivo del portapapeles';

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
  String connectionsDescription(String productName) {
    return 'Vincula cuentas y dominios externos a tu perfil de $productName. Las conexiones verificadas se mostrarán en tu perfil para que otros las vean.';
  }

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
  String get lookAndFeelHdrSectionTitle => 'Alto rango dinámico';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Controla cómo se muestran las imágenes HDR en monitores compatibles con HDR.';

  @override
  String get lookAndFeelHdrFullName => 'Rango dinámico completo';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Muestra imágenes HDR con el brillo y la gama de colores completos.';

  @override
  String get lookAndFeelHdrStandardName => 'Rango estándar';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Mapea el tono de las imágenes HDR al rango estándar, reduciendo el brillo máximo.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'Modo de visualización de alto rango dinámico';

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
  String get lookAndFeelChatFontSizeLabel => 'Tamaño de fuente del chat';

  @override
  String get lookAndFeelAppZoomTitle => 'Nivel de zoom de la aplicación';

  @override
  String get lookAndFeelAppZoomDescription =>
      'Ajusta el nivel de zoom de la aplicación.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'Fondo de chat';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'Elige un fondo para el chat. Se quedará en este dispositivo.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'Este ajuste se queda en este dispositivo';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'El fondo de chat solo se guarda en este dispositivo y no se sincroniza con otros.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'Predeterminado';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'Imagen personalizada';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Color $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Degradado $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'Atenuar fondo';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'No se ha podido establecer esa imagen como fondo de pantalla.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Mensajes';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Elige cómo se muestran los mensajes en los canales de chat.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Espacio entre grupos de mensajes';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel =>
      'Modo de visualización de mensajes';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Cómodo';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Diseño espacioso con una clara separación visual entre mensajes.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Denso';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Maximiza los mensajes visibles con un espaciado mínimo.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'Ocultar avatares de usuario';

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
  String get communityTemporarilyUnavailable =>
      'Comunidad no disponible temporalmente';

  @override
  String get guildUnavailableDescription =>
      'Algo ha ido mal. Estamos trabajando en ello.';

  @override
  String get guildNotFoundTitle => 'Esta no es la comunidad que buscas.';

  @override
  String get guildNotFoundDescription =>
      'Puede que la comunidad que buscas haya sido eliminada o que no tengas acceso a ella.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return '$communityName solo es accesible para los miembros del personal de $productName';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => 'no disponible temporalmente';

  @override
  String get lookAndFeelCollapseDMsLabel => 'Colapsar DMs en una carpeta';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'Cuando está activado, los DMs no leídos en la barra lateral de la comunidad se colapsan en una carpeta en el botón de $productName. Haz clic en el botón de $productName mientras estás en la página de DMs para expandir o colapsar la carpeta.';
  }

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
  String get favoritesAddToSavedMedia => 'Añadir a elementos guardados';

  @override
  String get favoritesRemoveFromSavedMedia =>
      'Eliminar de los elementos multimedia guardados';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Añadir a los GIF favoritos solo por URL';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Eliminar de los GIF favoritos guardados por URL';

  @override
  String get savedMediaAddTitle => 'Añadir a elementos guardados';

  @override
  String get savedMediaFormNameLabel => 'Nombre';

  @override
  String get savedMediaFormNameHint => 'Mi contenido multimedia increíble';

  @override
  String get savedMediaFormAltTextLabel => 'Texto alternativo';

  @override
  String get savedMediaFormAltTextHint => 'Describe el contenido multimedia';

  @override
  String get savedMediaFormTagsLabel => 'Etiquetas';

  @override
  String get savedMediaFormTagsHint => 'divertido, reacción, trabajo';

  @override
  String get savedMediaSaveError =>
      'No se ha podido actualizar el contenido guardado.';

  @override
  String get savedMediaNameRequired => 'El nombre es obligatorio.';

  @override
  String get gifFavoriteFirstTimeTitle => '¿Cómo guardamos tus GIFs favoritos?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'Puedes guardar los GIF marcados como favoritos como enlaces o subirlos a tu contenido multimedia guardado. Elige la opción que mejor se adapte a tu uso. Puedes cambiarla en cualquier momento en Ajustes > Avanzado > Multimedia.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'Favoritos solo con URL (predeterminado): se sincronizan en tus dispositivos, sin subida, no cuentan para los medios guardados. Los medios originales pueden desaparecer si su host los elimina.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Medios guardados: subidos, etiquetables, buscables y persistentes, pero cuentan para tu límite de medios guardados.';

  @override
  String get gifFavoriteFirstTimeHint => 'Solo te lo pediremos una vez.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly => 'Usar solo URL (recomendado)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => 'Usar medios guardados';

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
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'Cuando se suben directamente a $productName';
  }

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
  String get messagesMediaCameraUploadsSectionTitle => 'Subidas de cámara';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Elige si las fotos y vídeos capturados con la cámara de la app se guardan en tu dispositivo';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel =>
      'Guardar en el dispositivo';

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
  String get accessibilitySaturationTitle => 'Saturación';

  @override
  String get accessibilitySaturationDescription =>
      'Ajusta la viveza de los colores del tema en toda la aplicación.';

  @override
  String get accessibilityVisualGroupTitle => 'Visual';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'Subrayar siempre los enlaces';

  @override
  String get accessibilityDimStrikethroughTextLabel => 'Atenuar texto tachado';

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
  String get accessibilityScreenReaderGroupTitle => 'Lector de pantalla';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Controla cómo funciona $productName con lectores de pantalla.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Anunciar mensajes nuevos';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Permitir que los lectores de pantalla anuncien los mensajes nuevos a medida que llegan al canal abierto. Los sonidos de notificación no se verán afectados.';

  @override
  String get accessibilityTtsGroupTitle => 'Texto a voz';

  @override
  String get accessibilityTtsGroupDescription =>
      'Elige una velocidad para el texto hablado.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Velocidad de reproducción de voz';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Reproducir ejemplo';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Silenciar muestra';

  @override
  String get accessibilityPreviewButtonLabel => 'Botón de vista previa';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'Así se muestran los enlaces: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Usuario de vista previa';

  @override
  String get accessibilityKeyboardGroupTitle => 'Teclado';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Mostrar anillo de enfoque en el área de texto del chat';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'La tecla Escape sale del modo teclado';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Mostrar atajos del menú contextual';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Confirmar antes de iniciar llamadas';

  @override
  String get accessibilityAnimationGroupTitle => 'Animación';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'La opción «Reducir movimiento» está activada, por lo que las animaciones de contenido están pausadas de forma predeterminada. Aún puedes volver a activarlas para que se reproduzcan.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel =>
      'Reproducir emojis animados';

  @override
  String get accessibilityAutoPlayGifsMobileLabel =>
      'Reproducir GIF automáticamente';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'Reproducir GIF automáticamente cuando $productName esté en primer plano';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Reproduciendo a pesar del movimiento reducido.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Pausado por movimiento reducido. Actívalo para que los emojis animados sigan reproduciéndose.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'En pausa por movimiento reducido. Actívalo para que los GIF sigan reproduciéndose.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'Desactivado por defecto en móviles para preservar la batería y el uso de datos.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Animaciones de stickers';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Preferencias de animación de stickers';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Siempre animar';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Los stickers siempre se animarán';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Animar al interactuar';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Los stickers se animarán cuando los pulses';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Los stickers se animarán al pasar el ratón por encima o al interactuar con ellos';

  @override
  String get accessibilityStickerNeverAnimateName => 'Nunca animar';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Los stickers nunca se animarán';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Siempre animado a pesar del movimiento reducido.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'El movimiento reducido limita las pegatinas a animarse con la interacción. Elige «animar siempre» para anularlo.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'Por defecto, las animaciones se activan al interactuar en el móvil para ahorrar batería.';

  @override
  String get accessibilityMotionGroupTitle => 'Movimiento';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Sincronizar el ajuste de movimiento reducido con el sistema';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Usa la preferencia de movimiento reducido del sistema de este dispositivo o personalízala a continuación.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Reducir movimiento';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Desactivar animaciones y transiciones. Actualmente controlado por la configuración de tu sistema.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Desactivar animaciones y transiciones en toda la aplicación.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Los emojis animados, los GIF y los stickers permanecen bajo tu control en la pestaña Animación.';

  @override
  String get accessibilityConfirmStartCallTitle => '¿Iniciar llamada?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      '¿Seguro que quieres iniciar esta llamada?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Iniciar llamada';

  @override
  String get accessibilityTtsSampleDescription =>
      'Escucha la frase de ejemplo pronunciada a la velocidad elegida.';

  @override
  String get accessibilityTtsSampleText =>
      'Doc, soy del futuro. Vine aquí en una máquina del tiempo que tú inventaste. Ahora, necesito tu ayuda para volver al año 1985.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'La síntesis de voz no está disponible en este dispositivo.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Error al reproducir el audio. Inténtalo de nuevo o comprueba que la salida de audio funciona.';

  @override
  String get ttsSubstitutionUnknownUser => 'usuario desconocido';

  @override
  String get ttsSubstitutionUnknownRole => 'rol desconocido';

  @override
  String get ttsSubstitutionUnknownChannel => 'canal desconocido';

  @override
  String get ttsSubstitutionCodeBlock => 'bloque de código';

  @override
  String get ttsSubstitutionSpoiler => 'Spoiler';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'emoji $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return 'barra $commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName dijo: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'En respuesta a $replyAuthorName, $authorName dijo: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName de $description';
  }

  @override
  String get ttsSentSticker => 'envió un sticker';

  @override
  String get ttsSentAttachment => 'ha enviado un archivo adjunto';

  @override
  String ttsSentAttachments(int count) {
    return 'enviados $count archivos adjuntos';
  }

  @override
  String get ttsSentEmbed => 'envió un elemento incrustado';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author ha enviado $summary';
  }

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
  String get systemCallJoinTheCall => 'Unirse a la llamada';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username inició una llamada que duró $duration.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'Perdiste una llamada de $username que duró $duration.';
  }

  @override
  String systemCallMissed(String username) {
    return 'Perdiste una llamada de $username.';
  }

  @override
  String get systemCallDurationFewSeconds => 'unos segundos';

  @override
  String get systemCallDurationMinute => 'un minuto';

  @override
  String get systemCallDurationOneYear => '1 año';

  @override
  String get systemCallDurationOneMonth => '1 mes';

  @override
  String get systemCallDurationOneWeek => '1 semana';

  @override
  String get systemCallDurationOneDay => '1 día';

  @override
  String get systemCallDurationOneHour => '1 hora';

  @override
  String systemCallDurationYears(int count) {
    return '$count años';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count meses';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count semanas';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count días';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count horas';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count minutos';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Actualiza $productName para ver este mensaje.';
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
  String get voiceJoinFailedTitle => 'No se pudo unir a la llamada de voz';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'No se pudieron desconectar tus otros dispositivos. Inténtalo de nuevo en un momento.';

  @override
  String get voiceChannelEmptyDescription =>
      'Este es un canal de voz. ¡Conéctate para empezar a hablar!';

  @override
  String get voiceChannelJoin => 'Unirse al canal de voz';

  @override
  String get voiceCallJoin => 'Unirse a la llamada';

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
  String get voiceControlFlipCamera => 'Girar cámara';

  @override
  String get voiceControlScreenShare => 'Compartir pantalla';

  @override
  String get voiceScreenShareNotificationText => 'Compartiendo tu pantalla.';

  @override
  String get voiceControlMore => 'Más';

  @override
  String get voiceControlDisconnect => 'Desconectar';

  @override
  String get voiceInChat => 'En el chat de voz';

  @override
  String get voiceConnectionFailed => 'La conexión ha fallado';

  @override
  String get voiceConnectionRetry => 'Volver a intentar';

  @override
  String get voiceConnectionDismiss => 'Descartar';

  @override
  String get voiceConnectionDisconnected => 'Desconectado';

  @override
  String voicePingMs(int currentLatency) {
    return 'Ping: $currentLatency ms';
  }

  @override
  String get voiceMeasuringLatency => 'Midiendo la latencia...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Ir a $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'Conexión de voz';

  @override
  String get voiceConnectionAdvancedStats => 'Avanzado';

  @override
  String get voiceShowCallAvatars => 'Mostrar avatares de la llamada';

  @override
  String get voiceShowConnectionId => 'Mostrar ID de conexión';

  @override
  String get voiceAudioProcessing => 'Procesando audio';

  @override
  String get voiceConnectionSessionSection => 'Sesión';

  @override
  String get voiceConnectionDurationLabel => 'Duración';

  @override
  String get voiceConnectionParticipantsLabel => 'Participantes';

  @override
  String get voiceConnectionNetworkSection => 'Red';

  @override
  String get voiceConnectionPingLabel => 'Sonido';

  @override
  String get voiceConnectionJitterLabel => 'Fluctuación de retardo';

  @override
  String get voiceConnectionSendLabel => 'Enviar';

  @override
  String get voiceConnectionReceiveLabel => 'Recibir';

  @override
  String get voiceConnectionUnavailable => '—';

  @override
  String voiceConnectionDuration(int minutes, int seconds) {
    return '$minutes min $seconds s';
  }

  @override
  String voiceConnectionLatencyMs(int latency) {
    return '$latency ms';
  }

  @override
  String voiceConnectionJitterMs(String jitter) {
    return '$jitter ms';
  }

  @override
  String voiceConnectionBandwidthKbps(String bandwidth) {
    return '$bandwidth kbps';
  }

  @override
  String get userAreaMuteMicrophone => 'Silenciar micrófono';

  @override
  String get userAreaUnmuteMicrophone => 'Activar micrófono';

  @override
  String get userAreaUserSettings => 'Ajustes de usuario';

  @override
  String get voiceParticipantMenuViewProfile => 'Ver perfil';

  @override
  String get voiceParticipantMenuFocus => 'Centrarse en esta persona';

  @override
  String get voiceParticipantMenuUnfocus => 'Dejar de centrarse';

  @override
  String get voiceParticipantMenuCommunityMute => 'Silenciar';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Ensordecer';

  @override
  String get voiceParticipantMenuUserVolume => 'Volumen del usuario';

  @override
  String get voiceParticipantMenuStreamVolume => 'Volumen del directo';

  @override
  String get voiceParticipantMenuStopStreaming => 'Dejar de compartir';

  @override
  String get voiceParticipantModerationFailed =>
      'No se pudo actualizar a ese miembro. Por favor, inténtalo de nuevo.';

  @override
  String get voiceControlChat => 'Chat';

  @override
  String get voiceCallViewModeLabel => 'Ver';

  @override
  String get voiceCallViewModeGrid => 'Cuadrícula';

  @override
  String get voiceCallViewModeFocus => 'Concentración';

  @override
  String get voicePanelSettingsSectionTitle => 'Ajustes de voz';

  @override
  String get voicePanelUseEarpieceLabel => 'Utilizar el auricular';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Solo mostrar vídeos';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Mostrar solo a los participantes que tengan activada su cámara.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Mostrar mi propia cámara';

  @override
  String get voicePrioritizeSpeakersLabel => 'Priorizar a los que hablan';

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
  String get privacyDashboardProfilePrivacySection => 'Privacidad del perfil';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Amigos y mensajes directos';

  @override
  String get privacyDashboardActivitySharingSection => 'Compartir actividad';

  @override
  String get privacyDashboardSensitiveContentSection => 'Contenido sensible';

  @override
  String get privacyDashboardDataExportSection => 'Exportación de datos';

  @override
  String get privacyDashboardDataDeletionSection => 'Eliminación de datos';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Quién puede ver tu perfil completo';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Amigos y todas las comunidades';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Tu perfil completo es visible para tus amigos y para cualquiera de tus comunidades';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Solo amigos y comunidades pequeñas';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Tu perfil completo es visible para tus amigos y para los miembros de tus comunidades con 200 o menos miembros';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Solo amigos';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Tu perfil completo solo es visible para tus amigos';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Solicitudes de amistad';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Todos';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Permitir que cualquiera te envíe solicitudes de amistad';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Amigos de amigos';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Permitir que los amigos de tus amigos te envíen solicitudes';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Miembros de la comunidad';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Permitir que los miembros de las comunidades en las que estás te envíen solicitudes';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Mensajes directos';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Permitir mensajes directos de miembros de la comunidad';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Permitir que los miembros de las comunidades a las que perteneces te envíen mensajes directos';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Permitir mensajes directos de bots de la comunidad';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Permitir que los bots de las comunidades a las que perteneces te envíen mensajes directos';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Controla quién puede enviarte solicitudes de amistad y mensajes directos';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Controla quién puede llamarte y añadirte a chats grupales';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Llamadas entrantes';

  @override
  String get privacyDashboardIncomingCallsDesc =>
      'Controla quién puede llamarte';

  @override
  String get privacyDashboardAllowedCallers => 'Llamantes permitidos';

  @override
  String get privacyDashboardIncomingCallNobody => 'Nadie';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Bloquear todas las llamadas entrantes';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Solo amigos';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Permitir solo a tus amigos que te llamen (recomendado)';

  @override
  String get privacyDashboardIncomingCallCustom => 'Amigos + Personalizado';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Permitir a amigos y grupos adicionales que elijas';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Todos';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Permite que cualquiera te llame, incluso desconocidos';

  @override
  String get privacyDashboardAdditionalGroups => 'Grupos adicionales';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'Las personas que son amigas de tus amigos pueden llamarte';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'Las personas de comunidades en las que ambos estéis podréis llamarte';

  @override
  String get privacyDashboardRingBehavior => 'Comportamiento del anillo';

  @override
  String get privacyDashboardSilentCalls =>
      'Llamadas silenciosas de todo el mundo';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'Todas las llamadas notificarán de forma silenciosa en lugar de sonar. Por defecto, las llamadas de personas que no son tus contactos siempre son silenciosas.';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Quién puede añadirte a chats grupales';

  @override
  String get privacyDashboardGroupDmDesc =>
      'Controla quién puede añadirte a chats grupales sin preguntar. Aun así, cualquiera puede enviarte enlaces de invitación para unirte.';

  @override
  String get privacyDashboardAllowedInvites => 'Invitaciones permitidas';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Que nadie te añada a chats grupales sin preguntar';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Permitir solo a tus amigos que te añadan sin preguntar (recomendado)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Permitir que amigos y grupos adicionales te añadan';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Permitir que cualquiera te añada a chats grupales sin preguntar';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'Las personas que son amigas de tus amigos pueden añadirte a chats grupales';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'Las personas de comunidades en las que ambos estéis pueden añadirte a chats grupales';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Actividad de voz en En línea ahora';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Compartir tu actividad de voz con amigos';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      '¿Compartir la actividad de voz con todos los amigos?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      '¿Dejar de compartir la actividad de voz con todos los amigos?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Vas a empezar a compartir tu actividad de voz con todos tus amigos, incluidos los futuros. Esto les enviará una actualización a todos y solo podrás volver a cambiarlo en 24 horas.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Estás a punto de dejar de compartir tu actividad de voz con todos tus amigos, incluidos los futuros. Esto les enviará una actualización a todos y solo podrás volver a cambiarlo en 24 horas.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Sí, compartir con todos los amigos';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm =>
      'Sí, dejar de compartir';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Disponible de nuevo en $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Uso compartido de actividad de voz actualizado';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'No se ha podido actualizar la opción de compartir actividad de voz ahora mismo';

  @override
  String get privacyDashboardDataExportDesc =>
      'Crea un archivo descargable con los datos de tu cuenta, incluidos los mensajes y las URL de los archivos adjuntos. La mayoría de la gente quiere todo, pero puedes limitar el alcance a continuación.';

  @override
  String get privacyDashboardExportMyData => 'Exportar mis datos';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Elimina permanentemente los mensajes que has enviado en MD, MD de grupo y comunidades. El proceso se ejecuta en segundo plano y recibirás un mensaje directo cuando termine.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Eliminar mis mensajes';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      '¿Permitir mensajes directos de miembros de la comunidad?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      '¿Bloquear mensajes directos de miembros de la comunidad?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      '¿Permitir que los bots te envíen mensajes directos?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      '¿Bloquear que los bots te envíen mensajes directos?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      '¿Quieres permitir también los mensajes directos de los miembros de tus comunidades existentes?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      '¿Quieres bloquear también los mensajes directos de los miembros de tus comunidades actuales?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      '¿Quieres permitir también que los bots de tus comunidades actuales te envíen mensajes directos?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      '¿Quieres bloquear también los bots de tus comunidades actuales?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'También puedes cambiar esta configuración por comunidad si mantienes pulsada la comunidad y seleccionas Ajustes de privacidad.';

  @override
  String get privacyDashboardDmConfirmAllowAll =>
      'Permitir en todas las comunidades';

  @override
  String get privacyDashboardDmConfirmBlockAll =>
      'Bloquear para todas las comunidades';

  @override
  String get privacyDashboardDmConfirmSkip => 'Omitir este paso';

  @override
  String get privacyDashboardDataRequestGoBack => 'Volver';

  @override
  String get privacyDashboardDataRequestExportTitle => 'Exportar mis datos';

  @override
  String get privacyDashboardDataRequestDeleteTitle => 'Eliminar mis mensajes';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'Lo procesaremos lo antes posible. Recibirás un correo electrónico cuando tu archivo esté listo.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'Lo procesaremos lo antes posible. Te enviaremos un mensaje directo cuando esté listo.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'Qué incluir';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Todo';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Exporta todos los mensajes que hayas enviado, además de todos los ajustes de tu cuenta, suscripciones y metadatos.';

  @override
  String get privacyDashboardDataRequestExportCustom =>
      'Selección personalizada';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Elige qué tipos de conversación, comunidades y periodo de tiempo incluir en el archivo.';

  @override
  String get privacyDashboardDataRequestDeleteSelected => 'Elige qué incluir';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Elige qué tipos de conversaciones quieres limpiar.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Solo los lugares a los que ya no tengo acceso';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Solo eliminar mensajes de comunidades y MD de grupo de los que te hayas ido o te hayan expulsado.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Qué conversaciones';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Elige los tipos de conversaciones que quieres incluir.';

  @override
  String get privacyDashboardDataRequestKindDms => 'Abrir MD';

  @override
  String get privacyDashboardDataRequestKindDmsClosed => 'MD cerrados';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'MD de grupo';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Comunidades';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Qué comunidades';

  @override
  String get privacyDashboardDataRequestGuildFilterMode =>
      'Filtro de comunidades';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Incluir todo excepto lo seleccionado';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude =>
      'Solo los seleccionados';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'No estás en ninguna comunidad ahora mismo.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Periodo de tiempo';

  @override
  String get privacyDashboardDataRequestDateMode => 'Periodo de tiempo';

  @override
  String get privacyDashboardDataRequestAllTime => 'Todo el tiempo';

  @override
  String get privacyDashboardDataRequestCustomRange =>
      'Intervalo personalizado';

  @override
  String get privacyDashboardDataRequestStartDate => 'Fecha de inicio';

  @override
  String get privacyDashboardDataRequestEndDate => 'Fecha de finalización';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Deja cualquiera de los campos en blanco para que ese extremo del periodo no tenga límite.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Selecciona al menos un tipo de conversación para incluir.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'La fecha de inicio debe ser anterior a la fecha de finalización.';

  @override
  String get privacyDashboardDataRequestConfirmTitle => 'Revisa y confirma';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'Crearemos un archivo descargable con todos los mensajes que hayas enviado y te enviaremos un correo electrónico cuando esté listo. El enlace de descarga de ese correo electrónico caducará en 7 días.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'Crearemos un archivo descargable que coincida con los filtros de abajo y te enviaremos un correo electrónico cuando esté listo. El enlace de descarga de ese correo electrónico caduca a los 7 días.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Eliminar permanentemente los mensajes que coincidan con los filtros de abajo. Esto no se puede deshacer.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'No hay recuperación una vez que esto comience. Te enviaremos un mensaje directo cuando termine.';

  @override
  String get privacyDashboardDataRequestRequestExport =>
      'Solicitar exportación';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Eliminar mensajes';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Ámbito';

  @override
  String get privacyDashboardDataRequestSummaryConversations =>
      'Conversaciones';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Comunidades';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Periodo de tiempo';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'Ninguno';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'Desde el $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'Hasta el $end';
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
      other: '# comunidades',
      one: '# comunidad',
    );
    return 'Todas excepto $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# comunidades',
      one: '# comunidad',
    );
    return 'Solo $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Mensajes directos abiertos';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Mensajes directos cerrados';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Mensajes directos (abiertos y cerrados)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'MD de grupo';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Comunidades';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# horas',
      one: '# hora',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minutos',
      one: '# minuto',
    );
    return '$_temp0 y $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# horas',
      one: '# hora',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minutos',
      one: '# minuto',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# segundos',
      one: '# segundo',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed =>
      'No se han podido cargar los ajustes de privacidad';

  @override
  String get privacyDashboardRetry => 'Reintentar';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'No se han podido guardar la configuración del contenido sensible.';

  @override
  String get privacyDashboardDataRequestFailed =>
      'No se ha podido completar la solicitud.';

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
  String get forwardSendSlowmodeBlocked =>
      'Esperando a que el modo lento caduque en uno o más canales seleccionados.';

  @override
  String get slowmodeRateLimitedTitle => 'Modo lento activo';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'El modo lento está activado. Espera $duration antes de enviar otro mensaje.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'La carga directa está desactivada durante el modo de cámara lenta.';

  @override
  String get shareMediaTitle => 'Compartir en';

  @override
  String get shareMediaMessageHint => 'Añade un mensaje opcional…';

  @override
  String get shareMediaSendButton => 'Enviar';

  @override
  String get shareMediaSuccessToast =>
      'Se ha compartido el contenido multimedia';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'Compartido en $count destinos';
  }

  @override
  String get shareMediaFailedToast => 'Error al compartir contenido multimedia';

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
  String get chatMessageCopyEmbedText => 'Copiar texto incrustado';

  @override
  String get chatMessageTranslate => 'Traducir';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Traducido de $language';
  }

  @override
  String get chatMessageSeeOriginal => 'Ver original';

  @override
  String get chatMessageSeeTranslation => 'Ver traducción';

  @override
  String get chatMessageTranslating => 'Traduciendo…';

  @override
  String get chatMessageTranslateFailed =>
      'No se ha podido traducir este mensaje.';

  @override
  String get chatMessageTranslateUnavailable =>
      'La traducción no está disponible en este dispositivo.';

  @override
  String get chatMessageSpeak => 'Leer mensaje en voz alta';

  @override
  String get chatMessageStopSpeaking => 'Dejar de hablar';

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
  String get chatMessageOpenLink => 'Abrir enlace';

  @override
  String get chatMessageCopyLink => 'Copiar enlace';

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
  String get chatReactionAddFailed => 'No se pudo añadir la reacción';

  @override
  String get chatReactionRemoveFailed => 'No se ha podido eliminar la reacción';

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
  String iarReasonOtherDescription(String productName) {
    return 'Úsalo solo si infringe claramente las normas de $productName y no encaja en las anteriores.';
  }

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
  String get chatMessageDeleteAttachment => 'Eliminar archivo adjunto';

  @override
  String get chatMessageEditAttachmentAltText => 'Editar texto alternativo';

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
  String chatBlockedMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mensajes bloqueados',
      one: '1 mensaje bloqueado',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mensajes de posible spammer',
      one: '1 mensaje de posible spammer',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Respuesta oculta porque el autor original está bloqueado.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Respuesta oculta porque el autor original está marcado como spam.';

  @override
  String get devMarkAsSpamLocally => 'Marcar como spam localmente';

  @override
  String get devIgnoreSpamFlag => 'Ignorar marcador de spam';

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
  String get mediaViewerOptions => 'Opciones multimedia';

  @override
  String get mediaViewerCopyLink => 'Copiar enlace';

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
  String mediaViewerAttachmentThumbnail(int index) {
    return 'Archivo adjunto $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Descartar';

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
  String get composerAutocompleteSuggestions => 'Sugerencias';

  @override
  String get composerAutocompleteCommandsHeading => 'Comandos';

  @override
  String get composerAutocompleteChoicesHeading => 'Opciones';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'Argumentos opcionales';

  @override
  String get composerAutocompleteChannelsHeading => 'Canales';

  @override
  String get composerAutocompleteMembersHeading => 'Miembros';

  @override
  String get composerAutocompleteUsersHeading => 'Usuarios';

  @override
  String get composerAutocompleteMentionsHeading => 'Menciones';

  @override
  String get composerAutocompleteRolesHeading => 'Roles';

  @override
  String get composerAutocompleteMediaHeading => 'Archivos multimedia';

  @override
  String get composerAutocompleteStickersHeading => 'Pegatinas';

  @override
  String get composerAutocompleteGifsHeading => 'GIF';

  @override
  String get composerAutocompleteNoGifs => 'No se han encontrado GIFs';

  @override
  String get composerCommandShrugDescription =>
      'Añade ¯\\_(ツ)_/¯ a tu mensaje.';

  @override
  String get composerCommandTableflipDescription =>
      'Añade (╯°□°)╯︵ ┻━┻ a tu mensaje.';

  @override
  String get composerCommandUnflipDescription =>
      'Añade ┬─┬ ノ( ゜-゜ノ) a tu mensaje.';

  @override
  String get composerCommandMeDescription =>
      'Enviar un mensaje de acción (se muestra en cursiva).';

  @override
  String get composerCommandSpoilerDescription =>
      'Enviar un mensaje con spoiler (se envuelve en etiquetas de spoiler).';

  @override
  String get composerCommandTtsDescription =>
      'Enviar un mensaje de texto a voz.';

  @override
  String get composerCommandNickDescription =>
      'Cambia tu apodo en esta comunidad.';

  @override
  String get composerCommandKickDescription =>
      'Expulsar a un miembro de esta comunidad.';

  @override
  String get composerCommandBanDescription =>
      'Expulsar a un miembro de esta comunidad.';

  @override
  String get composerCommandMsgDescription =>
      'Enviar un mensaje directo a un usuario.';

  @override
  String get composerCommandSavedDescription =>
      'Enviar un elemento multimedia guardado.';

  @override
  String get composerCommandStickerDescription => 'Enviar un sticker.';

  @override
  String get composerCommandGifDescription => 'Busca y envía un GIF.';

  @override
  String get composerCommandMemberOption => 'El miembro al que dirigirse.';

  @override
  String get composerCommandReasonOption => 'Motivo (opcional).';

  @override
  String get composerCommandMessageOption => 'El mensaje que se enviará.';

  @override
  String get composerCommandQueryOption => 'Qué buscar.';

  @override
  String get composerCommandNicknameOption =>
      'Tu nuevo apodo, o déjalo en blanco para restablecerlo.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'Cuántos mensajes recientes del miembro se deben eliminar.';

  @override
  String get composerCommandDeleteMessagesNone => 'No eliminar ninguna';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Días anteriores $count';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'Últimas 24 horas';

  @override
  String get composerCommandOptionRequired =>
      'Esta opción es obligatoria. Por favor, proporciona un valor.';

  @override
  String get composerCommandClear => 'Borrar comando';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'Cambiaste tu apodo en esta comunidad de **$previousNickname** a **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'Usuario desconocido';

  @override
  String composerCommandMsgFailed(String username) {
    return 'No se pudo enviar un mensaje a **$username**. Es posible que tenga los mensajes directos desactivados o que te haya bloqueado.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count más';
  }

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
  String get addGuildCreateTitle => 'Crear comunidad';

  @override
  String get addGuildCreateDescription =>
      'Crea una comunidad para hablar con tus amigos.';

  @override
  String get addGuildCreateNameLabel => 'Nombre de la comunidad';

  @override
  String get addGuildCreateSubmit => 'Crear comunidad';

  @override
  String get addGuildCreateFailed =>
      'No se pudo crear la comunidad. Por favor, inténtalo de nuevo.';

  @override
  String get addGuildCreateClaimTitle => 'Reclama tu cuenta';

  @override
  String get addGuildCreateClaimDescription =>
      'Tienes que reclamar tu cuenta antes de poder crear una comunidad.';

  @override
  String get addGuildCreateVerifyTitle => 'Verifica tu correo';

  @override
  String get addGuildCreateVerifyDescription =>
      'Tienes que verificar tu dirección de correo antes de poder crear una comunidad.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Los iconos animados no se pueden utilizar al crear una comunidad nueva. Utiliza una imagen estática.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'Al crear una comunidad, aceptas cumplir las ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return 'normas de la comunidad de $productName';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'Esta instancia es una única comunidad, por lo que no se pueden crear comunidades adicionales.';

  @override
  String get addGuildCreateChangeIcon => 'Cambiar icono';

  @override
  String get addGuildCreateIconLabel => 'Icono de la comunidad';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Máx. 10 MB. Recomendado: 512×512 px';

  @override
  String get addGuildImportDescription =>
      'Pega una URL de plantilla de Discord para importar su estructura a una nueva comunidad.';

  @override
  String get addGuildImportUrlLabel => 'URL de la plantilla';

  @override
  String get addGuildImportUrlInvalid =>
      'Introduce una URL o código de plantilla de Discord válido.';

  @override
  String get addGuildImportFetchFailed =>
      'No se ha podido obtener la plantilla de la comunidad. Es posible que la plantilla no exista o que el servicio externo no esté disponible.';

  @override
  String get addGuildImportInvalidResponse =>
      'Esta respuesta no parece ser una plantilla válida.';

  @override
  String get addGuildImportTemplateLabel => 'Plantilla';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount de texto, $voiceChannelCount de voz, $categoryCount categorías, $roleCount roles';
  }

  @override
  String get addGuildImportRemoveIcon => 'Eliminar icono';

  @override
  String get addGuildImportTemplateInvalid =>
      'Los datos de la plantilla de la comunidad no son válidos o están mal formados.';

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
  String get channelDetailsFallbackTitle => 'Detalles';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'Grupo de MD · $count miembros';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return '¿Cerrar tu conversación con $name?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return '¿Abandonar $name?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Ajustes de canal';

  @override
  String get channelDetailsGroupSettingsTitle => 'Ajustes del grupo';

  @override
  String get channelDetailsDmSettingsTitle => 'Ajustes de MD';

  @override
  String get channelDetailsInvitePeople => 'Invitar personas';

  @override
  String get channelDetailsCopyLink => 'Copiar enlace';

  @override
  String get channelMenuCopyChannelLink => 'Copiar enlace del canal';

  @override
  String get channelMenuCopyRedirectLink => 'Copiar enlace de redirección';

  @override
  String get channelDetailsAddFriendsToGroup => 'Añadir amigos al grupo';

  @override
  String get channelDetailsGroupInvites => 'Invitaciones del grupo';

  @override
  String get channelDetailsEditChannel => 'Editar canal';

  @override
  String get channelDetailsDeleteChannel => 'Eliminar canal';

  @override
  String get channelSettingsCategorySettingsTitle => 'Ajustes de categoría';

  @override
  String get channelSettingsEditCategory => 'Editar categoría';

  @override
  String get channelSettingsTabOverview => 'General';

  @override
  String get channelSettingsTabPermissions => 'Permisos';

  @override
  String get channelSettingsTabInvites => 'Invitaciones';

  @override
  String get channelSettingsTabWebhooks => 'Webhooks';

  @override
  String get channelSettingsDeleteChannel => 'Eliminar canal';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return '¿Seguro que quieres eliminar $channelName? No se podrá deshacer.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return '¿Seguro que quieres eliminar $categoryName? No se podrá deshacer.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Eliminar categoría';

  @override
  String get channelSettingsChannelUpdated => 'Canal actualizado';

  @override
  String get channelSettingsChannelName => 'Nombre del canal';

  @override
  String get channelSettingsCategoryName => 'Nombre de la categoría';

  @override
  String get channelSettingsMyCategory => 'Mi categoría';

  @override
  String get categoryExpandCategory => 'Expandir categoría';

  @override
  String get categoryCollapseCategory => 'Contraer categoría';

  @override
  String get categoryExpandAllCategories => 'Expandir todas las categorías';

  @override
  String get categoryCollapseAllCategories => 'Contraer todas las categorías';

  @override
  String get categoryMuteCategory => 'Silenciar categoría';

  @override
  String get categoryUnmuteCategory => 'Reactivar categoría';

  @override
  String get categoryCopyCategoryId => 'Copiar ID de la categoría';

  @override
  String get categoryIdCopied => 'ID de categoría copiado';

  @override
  String get channelSettingsChannelNamePlaceholder => 'general';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'Tema';

  @override
  String get channelSettingsTopicPlaceholder => 'Añadir un tema a este canal';

  @override
  String get channelSettingsInsertEmoji => 'Insertar emoji';

  @override
  String get channelSettingsTopicTooLongTitle =>
      'El tema del canal es demasiado largo.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'Acorta el tema e inténtalo de nuevo.';

  @override
  String get channelSettingsSlowmode => 'Modo lento';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Tiempo de espera entre mensajes. \"$bypassSlowmodePermissionLabel\" puede omitirlo.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Desactivado';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds segundos';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes minutos';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours horas';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute minuto';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour hora';
  }

  @override
  String get channelSettingsVoiceQuality => 'Calidad de la voz';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'Mayor tasa de bits = mejor calidad y mayor uso de ancho de banda.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbps';
  }

  @override
  String get channelSettingsParticipantLimit => 'Límite de participantes';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Número máximo de miembros que se pueden unir a la vez. 0 significa ilimitado.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count participantes',
      one: '1 participante',
      zero: '∞ Sin límite',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Límite de conexiones';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Número máximo de conexiones que un miembro puede mantener en este canal.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count conexiones',
      one: '1 conexión',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Región de voz';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Selecciona una región de voz para este canal. La opción Automático utiliza la región más cercana.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Automático';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'No se pudieron cargar las regiones de voz';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Inténtalo de nuevo en un rato.';

  @override
  String get channelSettingsResetSlider =>
      'Restablecer el deslizador a su valor predeterminado';

  @override
  String get channelSettingsAdvanced => 'Avanzado';

  @override
  String get channelSettingsMatureContentOverride =>
      'Anulación de contenido para adultos';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Anular la configuración de nivel $scopeLevel para este canal. El contenido para adultos se mostrará tras una pantalla de confirmación antes de entrar.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Heredar';

  @override
  String get channelSettingsMatureContentOn => 'Activado';

  @override
  String get channelSettingsMatureContentOff => 'Desactivado';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Marca este canal como canal con contenido para adultos.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Deja este canal sin advertencia de contenido para adultos.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Hereda de $inheritedSourceLabel: activado';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Hereda de $inheritedSourceLabel: desactivado';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'la categoría';

  @override
  String get channelSettingsMatureContentCommunitySource => 'la comunidad';

  @override
  String get channelSettingsMatureContentCategoryScope => 'Categoría';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Comunidad';

  @override
  String get channelSettingsContentWarningToggle =>
      'Mostrar una advertencia de contenido en este canal';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Activa un aviso de consentimiento antes de entrar al canal.';

  @override
  String get channelSettingsContentWarningText =>
      'Texto de advertencia personalizado';

  @override
  String get channelSettingsContentWarningDefault =>
      'Este canal contiene contenido sensible.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'Necesitas el permiso \"$manageChannelsPermissionLabel\" para editar estos permisos.';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'Necesitas el permiso \"$manageRolesPermissionLabel\" para editar estos permisos.';
  }

  @override
  String get channelSettingsUnknownRole => 'Rol desconocido';

  @override
  String get channelSettingsUnknownUser => 'Usuario desconocido';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides =>
      'Anulaciones de acceso';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Editar acceso para $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'Volver a las anulaciones';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Configura el acceso por defecto para este canal';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Configura las anulaciones para este rol';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Configura las anulaciones para este miembro';

  @override
  String get channelSettingsPermissionsSearchPlaceholder => 'Buscar permisos…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Acceso al canal actualizado';

  @override
  String get channelSettingsPermissionsTitle => 'Control de acceso';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'Este canal está sincronizado con la categoría ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'Este canal no está sincronizado con la categoría ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory =>
      'Sincronizar con la categoría';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'Canal sincronizado con su categoría';

  @override
  String get channelSettingsPermissionsAddOverride => 'Añadir anulación';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Buscar roles o miembros…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => 'Roles y miembros';

  @override
  String get channelSettingsDeleteInvite => 'Eliminar invitación';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      '¿Eliminar esta invitación? No se podrá deshacer.';

  @override
  String get channelSettingsCopyInviteCode => 'Copiar código de invitación';

  @override
  String get channelSettingsCopyInviteUrl => 'Copiar URL de invitación';

  @override
  String get channelSettingsWebhookCreated => 'Webhook creado';

  @override
  String get channelSettingsWebhookCreateFailed =>
      'No se pudo crear el webhook';

  @override
  String get channelSettingsCreateWebhook => 'Crear webhook';

  @override
  String get channelSettingsInvitesDescription =>
      'Gestiona los enlaces de invitación para este canal.';

  @override
  String get channelSettingsInvitesCreate => 'Crear invitación';

  @override
  String get channelSettingsInvitesEmpty => 'No hay enlaces de invitación';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'Este canal aún no tiene enlaces de invitación. Crea uno para invitar a gente a este canal.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Ha ocurrido un error al cargar los enlaces de invitación de este canal. Inténtalo de nuevo.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Gestiona los webhooks entrantes que pueden enviar mensajes en este canal.';

  @override
  String get channelSettingsWebhooksEmpty => 'No hay webhooks';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'No hay webhooks configurados para este canal. Crea un webhook para permitir que aplicaciones externas envíen mensajes.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Este canal no es compatible con los webhooks.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'Necesitas el permiso \"$permission\" para ver y editar webhooks en este canal.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'No se pudieron cargar los webhooks';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Ha ocurrido un error al cargar los webhooks de este canal. Inténtalo de nuevo.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Creado por $creator el $date';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'Usuario desconocido';

  @override
  String get channelSettingsWebhooksAvatar => 'Avatar';

  @override
  String get channelSettingsWebhooksUploadImage => 'Subir imagen';

  @override
  String get channelSettingsWebhooksRemove => 'Eliminar';

  @override
  String get channelSettingsWebhooksName => 'Nombre';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Nombre del webhook';

  @override
  String get channelSettingsWebhooksChannel => 'Canal';

  @override
  String get channelSettingsWebhooksUrl => 'URL del webhook';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Copiar URL del webhook';

  @override
  String get channelSettingsWebhooksDelete => 'Eliminar webhook';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'No se pudo eliminar el webhook';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      '¿Eliminar este webhook? No se podrá deshacer.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Inténtalo de nuevo en un rato.';

  @override
  String get channelMenuOpenChat => 'Abrir chat';

  @override
  String get channelMenuDuplicateChannel => 'Duplicar canal';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Restablecer el estado del acuerdo de contenido para adultos';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      '¿Eliminar tus mensajes en este canal?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Se eliminarán permanentemente todos los mensajes que hayas enviado en este canal. Esta acción no se puede deshacer.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Eliminar mis mensajes';

  @override
  String get channelMenuDeletedYourMessages => 'Se han eliminado tus mensajes';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'No se pudieron eliminar tus mensajes';

  @override
  String get channelDetailsSystemMessage => 'Mensaje del sistema';

  @override
  String get channelDetailsTextChannel => 'Canal de texto';

  @override
  String get channelDetailsVoiceChannel => 'Canal de voz';

  @override
  String get channelDetailsCategory => 'Categoría';

  @override
  String get channelDetailsLinkChannel => 'Canal de enlace';

  @override
  String get channelDetailsGenericChannel => 'Canal';

  @override
  String get channelDetailsMutedConversation => 'Conversación silenciada';

  @override
  String get channelDetailsUnmutedConversation =>
      'Silencio de la conversación desactivado';

  @override
  String get channelDetailsMutedChannel => 'Canal silenciado';

  @override
  String get channelDetailsUnmutedChannel => 'Silencio del canal desactivado';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Ajustes de notificación actualizados';

  @override
  String get channelDetailsTabMembers => 'Miembros';

  @override
  String get channelDetailsTabPins => 'Mensajes fijados';

  @override
  String get channelDetailsActionMute => 'Silenciar';

  @override
  String get channelDetailsActionUnmute => 'Activar notificaciones';

  @override
  String get channelDetailsActionSearch => 'Buscar';

  @override
  String get channelDetailsActionMore => 'Más';

  @override
  String get channelDetailsMembersEmptyTitle => 'No hay miembros que mostrar';

  @override
  String get channelDetailsMembersEmptyBody =>
      'Los miembros aparecerán aquí cuando se carguen los datos de la comunidad.';

  @override
  String get memberListPermissionDeniedTitle => 'No puedes ver a los miembros';

  @override
  String get memberListPermissionDeniedBody =>
      'No puedes ver a los miembros de este canal en esta comunidad';

  @override
  String get memberListUnavailableTitle => 'Lista de miembros no disponible';

  @override
  String get memberListUnavailableBody =>
      'Las listas de miembros no están disponibles temporalmente en esta comunidad';

  @override
  String get channelDetailsPinsLoadFailedTitle =>
      'No se pudieron cargar los mensajes fijados';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'Los miembros con el permiso \"Fijar mensajes\" pueden fijar mensajes para todo el mundo.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'Puedes fijar mensajes en esta conversación para todo el mundo.';

  @override
  String get channelDetailsPinsEndReached => 'Has llegado al final';

  @override
  String get channelHeaderOpenDetails => 'Abrir detalles del canal';

  @override
  String get channelHeaderPinnedMessages => 'Mensajes anclados';

  @override
  String get channelHeaderPinnedMessagesUnread => 'Mensajes fijados, sin leer';

  @override
  String get channelHeaderMemberList => 'Lista de miembros';

  @override
  String get channelHeaderInbox => 'Bandeja de entrada';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Ajustes de notificaciones, silenciado';

  @override
  String get channelDetailsSearchTitle => 'Buscar';

  @override
  String get channelDetailsSearchHint => 'Buscar mensajes';

  @override
  String get channelDetailsSearchFilterFrom => 'De';

  @override
  String get channelDetailsSearchFilterHas => 'Tiene';

  @override
  String get channelDetailsSearchFilterIn => 'En';

  @override
  String get channelDetailsSearchFilterMentions => 'Menciones';

  @override
  String get channelDetailsSearchFilterMore => 'Más';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Activa';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count canales';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count usuarios';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'Usuario';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Bot';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => 'Filtrar por canal';

  @override
  String get channelDetailsSearchChannelsHint => 'Buscar canales';

  @override
  String get channelDetailsSearchChannelsEmpty => 'No se encontraron canales';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Fijado';

  @override
  String get channelDetailsSearchPinnedTrue => 'Solo fijados';

  @override
  String get channelDetailsSearchPinnedFalse => 'Excluir fijados';

  @override
  String get channelDetailsSearchClearFilter => 'Borrar';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Tipo de autor';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Fecha';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Modo de fecha';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Selecciona una fecha';

  @override
  String get channelDetailsSearchMoreFiltersLink =>
      'Enlace al nombre de dominio';

  @override
  String get channelDetailsSearchMoreFiltersFileName =>
      'El nombre del archivo contiene';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'Extensión de archivo';

  @override
  String get channelDetailsSearchContentPoll => 'Encuesta';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'Mensajes con una encuesta';

  @override
  String get channelDetailsSearchContentForward => 'Reenviar';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Mensajes reenviados';

  @override
  String get channelDetailsSearchFilterSort => 'Ordenar';

  @override
  String get channelHeaderSearchFiltersTitle => 'Filtros de búsqueda';

  @override
  String get channelHeaderSearchRecentTitle => 'Búsquedas recientes';

  @override
  String get channelHeaderSearchUsersTitle => 'Usuarios';

  @override
  String get channelHeaderSearchChannelsTitle => 'Canales';

  @override
  String get channelHeaderSearchValuesTitle => 'Valores';

  @override
  String get channelHeaderSearchDatesTitle => 'Fechas';

  @override
  String get channelHeaderSearchDefaultBadge => 'Predeterminado';

  @override
  String get channelHeaderSearchClearHistory => 'Borrar';

  @override
  String get channelHeaderSearchFilterDescFrom => 'un usuario';

  @override
  String get channelHeaderSearchFilterDescMentions => 'un usuario';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'enlace, elemento multimedia, imagen, vídeo, sonido, archivo, pegatina, …';

  @override
  String get channelHeaderSearchFilterDescBefore =>
      'una fecha o un rango de fechas';

  @override
  String get channelHeaderSearchFilterDescOn =>
      'una fecha o un rango de fechas';

  @override
  String get channelHeaderSearchFilterDescDuring =>
      'una fecha o un rango de fechas';

  @override
  String get channelHeaderSearchFilterDescAfter =>
      'una fecha o un rango de fechas';

  @override
  String get channelHeaderSearchFilterDescIn => 'un canal';

  @override
  String get channelHeaderSearchFilterDescPinned => 'verdadero o falso';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'usuario, bot o webhook';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'un nombre de host, por ejemplo, example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'parte del nombre de un archivo adjunto';

  @override
  String get channelHeaderSearchFilterDescFileType =>
      'una extensión de archivo, p. ej., png';

  @override
  String get channelHeaderSearchFilterDescSort => 'fecha o relevancia';

  @override
  String get channelHeaderSearchFilterDescOrder => 'asc o desc';

  @override
  String channelDetailsSearchResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count resultados',
      one: '1 resultado',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'Filtrar por usuario';

  @override
  String get channelDetailsSearchFilterByContent => 'Filtrar por contenido';

  @override
  String get channelDetailsSearchSortBy => 'Ordenar resultados por';

  @override
  String get channelDetailsSearchIn => 'Buscar en';

  @override
  String get channelDetailsSearchEmptyTitle => 'Buscar en esta conversación';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Introduce texto, un autor o un filtro de contenido para buscar mensajes.';

  @override
  String get channelDetailsSearchIndexingTitle =>
      'Los mensajes se están indexando';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Inténtalo de nuevo en cuanto la búsqueda acabe de indexar este ámbito.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Sin resultados';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Prueba con otros términos de búsqueda o filtros.';

  @override
  String get channelDetailsMembersOnline => 'En línea';

  @override
  String get channelDetailsMembersOffline => 'Sin conexión';

  @override
  String get channelDetailsMemberYou => 'Tú';

  @override
  String get channelDetailsSearchUsersHint => 'Buscar usuarios';

  @override
  String get channelDetailsSearchUsersTypeToSearch =>
      'Escribe para buscar miembros';

  @override
  String get channelDetailsSearchUsersEmpty => 'No se encontraron usuarios';

  @override
  String get channelDetailsSearchUsersNoAvailable =>
      'No hay usuarios disponibles';

  @override
  String get channelDetailsDone => 'Hecho';

  @override
  String get channelDetailsHasFilterPrompt => 'Mostrar mensajes que contienen:';

  @override
  String get channelDetailsRetry => 'Reintentar';

  @override
  String get channelDetailsPinnedMessageTitle => 'Mensaje fijado';

  @override
  String get channelDetailsSearchResultTitle => 'Resultado de búsqueda';

  @override
  String get channelDetailsJumpToMessage => 'Saltar al mensaje';

  @override
  String get channelDetailsUnpinMessage => 'Desfijar mensaje';

  @override
  String get channelDetailsCopyMessageLink => 'Copiar enlace del mensaje';

  @override
  String get channelDetailsCopyMessageId => 'Copiar ID del mensaje';

  @override
  String get channelDetailsMessageUnpinned => 'Mensaje desfijado';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Comunidad actual';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'MD actual';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Todas las comunidades';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild => 'Todos los MDs';

  @override
  String get channelDetailsSearchScopeAllDms => 'Todos los MDs';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild => 'Solo MDs abiertos';

  @override
  String get channelDetailsSearchScopeOpenDms => 'MDs abiertos';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Todos los MDs y comunidades';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'MDs abiertos y comunidades';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Buscar solo en la comunidad actual';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Buscar solo en el MD actual';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'En todas las comunidades en las que estás actualmente';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Solo en todos los MD en los que has estado';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'En todos los MD en los que has estado';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'En todos los mensajes directos que tengas abiertos';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'En todos los chats privados que tengas abiertos';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'En todos los mensajes directos en los que hayas estado + todas las comunidades en las que estés actualmente';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'En todos los mensajes directos que tengas abiertos + todas las comunidades en las que estés';

  @override
  String get channelDetailsSearchSortNewest => 'Los más recientes primero';

  @override
  String get channelDetailsSearchSortOldest => 'Los más antiguos primero';

  @override
  String get channelDetailsSearchSortRelevance => 'Más relevantes';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Mostrar los mensajes más recientes primero';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Mostrar los mensajes más antiguos primero';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Mostrar primero los mensajes más relevantes';

  @override
  String get channelDetailsSearchContentImage => 'Carga de imagen';

  @override
  String get channelDetailsSearchContentVideo => 'Subida de vídeo';

  @override
  String get channelDetailsSearchContentAudio => 'Carga de audio';

  @override
  String get channelDetailsSearchContentFile => 'Subida de archivo';

  @override
  String get channelDetailsSearchContentLink => 'Enlace';

  @override
  String get channelDetailsSearchContentEmbed =>
      'Vista previa o incrustación de enlace';

  @override
  String get channelDetailsSearchContentSticker => 'Pegatina';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Solo archivos de imagen subidos';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Solo archivos de vídeo subidos';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Solo archivos de audio subidos';

  @override
  String get channelDetailsSearchContentFileDescription =>
      'Cualquier archivo adjunto';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'URL escrita en el mensaje';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Previsualizaciones generadas y contenido enriquecido incrustado, no archivos subidos';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Sticker adjunto al mensaje';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count tipos';
  }

  @override
  String get personalNotesTitle => 'Notas personales';

  @override
  String get personalNotesSubtitle =>
      'Tu espacio privado para pensamientos y recordatorios';

  @override
  String groupDmWelcome(String displayName) {
    return 'Bienvenido a $displayName. Añade amigos para que el grupo empiece a animarse.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Editar grupo';

  @override
  String get groupDmWelcomeAddFriends => 'Añadir amigos al grupo';

  @override
  String get dmGroupInvites => 'Invitaciones';

  @override
  String get groupDmEditTitle => 'Editar grupo';

  @override
  String get groupDmEditDetailsTooltip => 'Editar detalles del grupo';

  @override
  String get groupDmGroupName => 'Nombre del grupo';

  @override
  String get groupDmMyGroup => 'Mi grupo';

  @override
  String get groupDmGroupNameMaxLength =>
      'El nombre del grupo no puede superar los 100 caracteres';

  @override
  String get groupDmGroupIcon => 'Icono del grupo';

  @override
  String get groupDmUploadIcon => 'Subir icono';

  @override
  String get groupDmChangeIcon => 'Cambiar icono';

  @override
  String get groupDmRemoveIcon => 'Eliminar icono';

  @override
  String get groupDmUpdated => 'Grupo actualizado';

  @override
  String get groupDmUpdateFailed =>
      'No se pudo actualizar el grupo. Inténtalo de nuevo.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Los iconos animados no son compatibles. Utiliza una imagen estática.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Los iconos animados no son compatibles';

  @override
  String get groupDmIconFileTooLargeTitle =>
      'El archivo del icono es demasiado grande';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'El archivo del icono es demasiado grande. Elige un archivo de menos de $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'Formato de icono no compatible';

  @override
  String get groupDmUnsupportedIconFormatBody =>
      'Tipo de archivo no compatible.';

  @override
  String get groupDmCouldntProcessImage => 'No se pudo procesar la imagen';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'No se pudo procesar la imagen recortada. Inténtalo de nuevo.';

  @override
  String get groupDmInvalidImage => 'Imagen inválida';

  @override
  String get groupDmInvalidImageBody =>
      'La imagen es inválida. Inténtalo con otra.';

  @override
  String get groupDmAddFriends => 'Añadir';

  @override
  String get groupDmOrSendInvite => 'o envía una invitación a un amigo:';

  @override
  String get groupDmGenerateInviteLink => 'Crear enlace de invitación';

  @override
  String get groupDmCreateInvite => 'Crear';

  @override
  String get groupDmInviteExpires24Hours => 'Tu invitación expira en 24 horas';

  @override
  String get groupDmAddFriendFailed =>
      'No se pudo añadir a este amigo al grupo. Por favor, inténtalo de nuevo.';

  @override
  String get groupDmAddFailed => 'No se pudo añadir al grupo';

  @override
  String get groupDmGroupFull =>
      'El grupo está lleno. Elimina a alguien antes de añadir a más personas.';

  @override
  String get groupDmRateLimited =>
      'Vas demasiado rápido. Espera un momento e inténtalo de nuevo.';

  @override
  String get groupDmCreateInviteFailed =>
      'No se pudo crear el enlace de invitación';

  @override
  String get groupDmCreateInviteFailedBody =>
      'No se pudo generar un enlace de invitación. Por favor, inténtalo de nuevo.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'No se ha podido crear el enlace de invitación. Vuelve a intentarlo.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'No tienes permiso para crear una invitación en este canal.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'Esta comunidad ha alcanzado su límite de invitaciones.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'La creación de invitaciones está temporalmente desactivada para esta comunidad.';

  @override
  String get groupDmCopyInviteFailed =>
      'No se pudo copiar el enlace de invitación';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Solo el propietario del grupo puede gestionar las invitaciones.';

  @override
  String get groupDmNoInvitesCreated => 'No se han creado invitaciones';

  @override
  String get groupDmLoadingInvites => 'Cargando invitaciones...';

  @override
  String get groupDmInvitesLoadFailed =>
      'No se pudieron cargar las invitaciones. Inténtalo de nuevo.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      '¿Cancelar esta invitación? No se podrá deshacer.';

  @override
  String get groupDmInviteRevoked => 'Invitación cancelada';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Creada por $name. Expira en $time.';
  }

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
  String get composerOpenExpressionPicker => 'Abrir selector de expresiones';

  @override
  String get composerShowKeyboard => 'Mostrar teclado';

  @override
  String get composerCloseAttachmentPanel => 'Cerrar selector de adjuntos';

  @override
  String get chatAttachmentPanelPhotos => 'Fotos';

  @override
  String get chatAttachmentPanelFiles => 'Archivos';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Se necesita acceso a la fototeca';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Permite el acceso a la fototeca para buscar y adjuntar fotos y vídeos recientes.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Abrir ajustes';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => 'enviando';

  @override
  String get messageAccessibilityFailedSuffix => ', no se pudo enviar';

  @override
  String get messageAccessibilityAttachmentSummary => 'un archivo adjunto';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count archivos adjuntos';
  }

  @override
  String get messageAccessibilityImageSummary => 'una imagen';

  @override
  String get messageAccessibilityVideoSummary => 'un vídeo';

  @override
  String get messageAccessibilityAudioSummary => 'un archivo de audio';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'sticker $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'archivo $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'un archivo adjunto oculto';

  @override
  String get messageAccessibilityEmbedSummary => 'un elemento incrustado';

  @override
  String get messageAccessibilityEmptySummary => 'un mensaje';

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
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => 'Buscar en la configuración...';

  @override
  String get userSettingsSearchFieldLabel => 'Buscar ajustes';

  @override
  String get userSettingsSearchClear => 'Borrar búsqueda';

  @override
  String get userSettingsSearchNoResults => 'No se encontraron ajustes';

  @override
  String get userSettingsNavProfile => 'Perfil';

  @override
  String get userSettingsNavSecurityLogin => 'Seguridad e inicio de sesión';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Regalos y códigos';

  @override
  String get giftSettingsClaimAccountTitle => 'Reclama tu cuenta';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Reclama tu cuenta para canjear o gestionar códigos de regalo de Plutonium.';

  @override
  String get giftSettingsRedeemTitle => 'Canjear un regalo';

  @override
  String get giftSettingsRedeemDescription =>
      'Introduce un código de regalo para canjear Plutonium en tu cuenta.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Introduce el código de regalo…';

  @override
  String get giftSettingsRedeemButton => 'Canjear';

  @override
  String get giftSettingsRedeemSuccess =>
      'Regalo canjeado correctamente. Disfruta de tu Plutonium.';

  @override
  String get giftSettingsPurchasedTitle => 'Regalos comprados';

  @override
  String get giftSettingsPurchasedDescription =>
      'Gestiona tus códigos de regalo de Plutonium comprados. ¡Comparte la URL del regalo con alguien especial o canjéalo tú mismo!';

  @override
  String get giftSettingsEmptyTitle => 'Aún no tienes regalos';

  @override
  String get giftSettingsEmptyDescription =>
      'Compra un regalo de Plutonium desde la pestaña Plutonium para compartir con tus amigos.';

  @override
  String get giftSettingsGoToPlutonium => 'Ir a Plutonium';

  @override
  String get giftSettingsLoadFailedTitle =>
      'No se ha podido cargar el inventario de regalos';

  @override
  String get giftSettingsLoadFailedDescription =>
      'Inténtalo de nuevo más tarde.';

  @override
  String get giftSettingsTryAgain => 'Volver a intentar';

  @override
  String get giftSettingsGiftUrl => 'URL del regalo';

  @override
  String get giftSettingsCopy => 'Copiar';

  @override
  String get giftSettingsCopied => 'Copiado';

  @override
  String get giftSettingsGiftUrlCopied =>
      '¡URL de regalo copiada al portapapeles!';

  @override
  String get giftSettingsGiftUrlCopyFailed =>
      'No se pudo copiar la URL del regalo';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Comprado el $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Canjeado el $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Canjeado por $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'Este regalo ya ha sido canjeado';

  @override
  String get giftSettingsRedeemForYourself => 'Canjear para mí';

  @override
  String get giftSettingsShareWithFriend => 'Compartir con un amigo';

  @override
  String get premiumPlutoniumTagline =>
      'Desbloquea límites más altos y funciones exclusivas mientras apoyas una plataforma de comunicación independiente.';

  @override
  String get premiumPurchaseMode => 'Modo de compra';

  @override
  String get premiumForMe => 'Para mí';

  @override
  String get premiumAsAGift => 'Para regalar';

  @override
  String get premiumMonthly => 'Mensual';

  @override
  String get premiumYearly => 'Anual';

  @override
  String get premiumPerMonth => 'al mes';

  @override
  String get premiumPerYear => 'al año';

  @override
  String get premiumOneTimePurchase => 'Compra única';

  @override
  String get premiumSave17 => 'Ahorra un 17 %';

  @override
  String get premiumUpgradeNow => 'Actualizar ahora';

  @override
  String get premiumBuyGift => 'Comprar regalo';

  @override
  String get premiumOneYearGift => 'Regalo de 1 año';

  @override
  String get premiumOneMonthGift => 'Regalo de 1 mes';

  @override
  String get premiumMostPopular => 'Más popular';

  @override
  String get premiumScrollPrompt =>
      'Desplázate hacia abajo para ver todas las ventajas de Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'Gratis frente a Plutonium';

  @override
  String get premiumFreeColumn => 'Gratis';

  @override
  String get premiumGiftSectionTitle => 'Regalar Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'Comparte la experiencia de Plutonium con tus amigos comprando una suscripción de regalo.';

  @override
  String get premiumGiftBannerOne =>
      '¡Tienes un nuevo código de regalo esperándote!';

  @override
  String premiumGiftBannerMany(int count) {
    return '¡Tienes $count códigos de regalo nuevos esperándote!';
  }

  @override
  String get premiumViewGifts => 'Ver regalos';

  @override
  String get premiumReadyToUpgrade => '¿Listo para mejorar?';

  @override
  String get premiumReadyToBuyGift => '¿Listo para comprar un regalo?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Mensual $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Anual $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 año $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 mes $price';
  }

  @override
  String get premiumManageSubscription => 'Gestionar suscripción';

  @override
  String get premiumRedeemGiftCode => 'Canjear código de regalo';

  @override
  String get premiumGiftBadge => 'Regalo';

  @override
  String get premiumCancelSubscriptionTitle => '¿Cancelar suscripción?';

  @override
  String get premiumCancelSubscriptionBody =>
      'Conservarás tus ventajas hasta la próxima fecha de renovación y, después, tendrás un periodo de gracia de 3 días para volver a suscribirte y mantener tu historial de suscriptor.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Cancelar suscripción';

  @override
  String get premiumKeepSubscription => 'Mantener suscripción';

  @override
  String get premiumPurchaseHistoryTitle => 'Historial de compras';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Tus facturas recientes. Para cambiar el método de pago de tu suscripción, añade o elige uno en el portal de facturación y haz que sea el predeterminado.';

  @override
  String get premiumManagePaymentMethods => 'Gestionar métodos de pago';

  @override
  String get premiumBillingHistory => 'Historial de facturación';

  @override
  String get premiumSelfServeRefundTitle => 'Reembolso automático';

  @override
  String get premiumSelfServeRefundButton => 'Reembolsar última compra';

  @override
  String get premiumDisclaimerAgreementPrefix =>
      'Al comprar, aceptas nuestros ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'Al comprar, aceptaste nuestras ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' y ';

  @override
  String premiumActiveUntil(String date) {
    return 'Activo hasta el $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Cancelando';

  @override
  String premiumCancelsOn(String date) {
    return 'Se cancela el $date. Las ventajas seguirán activas hasta entonces.';
  }

  @override
  String get premiumReactivateSubscription => 'Reactivar';

  @override
  String premiumGiftedUntil(String date) {
    return 'Regalo hasta el $date. No se renueva automáticamente.';
  }

  @override
  String get premiumComparisonFeatureColumn => 'Función';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'Al comprar, aceptas nuestras $terms y $privacy.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Reembolsos de autoservicio disponibles en los 3 días siguientes al pago, una vez cada 30 días. El reembolso de una suscripción la cancela. Los compradores de la UE/EEE renuncian al derecho de desistimiento de 14 días al finalizar la compra para acceder al contenido de inmediato. Usa el botón de reembolso de la aplicación en lugar de una devolución de cargo. Las devoluciones de cargo pueden restringir tu cuenta de forma permanente. Stripe gestiona el pago de forma segura. Nunca vemos el número completo de tu tarjeta.';

  @override
  String get premiumTermsOfService => 'Condiciones del servicio';

  @override
  String get premiumPrivacyPolicy => 'Política de privacidad';

  @override
  String get premiumCheckoutStartFailedTitle => 'No se pudo iniciar el pago';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Algo salió mal al iniciar el proceso de pago. Inténtalo de nuevo en un momento.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'Actualmente tienes una suscripción de regalo. No se renovará. Puedes canjear más códigos de regalo para extenderla. Las suscripciones recurrentes se pueden iniciar una vez que finalice tu período de regalo.';

  @override
  String get premiumPlanUnavailable =>
      'Este plan no está disponible. Contacta con el equipo de soporte.';

  @override
  String get premiumCompletePaymentTitle => 'Completar pago';

  @override
  String get premiumCompletePaymentBody =>
      'Ahora te redirigimos a Stripe para completar el pago. Vuelve a Fluxer cuando hayas terminado.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Elige un método de pago';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Paga con Pix automático para autorizar cargos recurrentes directamente desde tu banco brasileño. O elige usar tarjeta para introducir una tarjeta de crédito en la siguiente pantalla de Stripe.';

  @override
  String get premiumUsePix => 'Usar Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Paga con UPI para configurar un mandato electrónico compatible con RBI desde tu banco indio. O elige usar tarjeta para introducir una tarjeta de crédito en la siguiente pantalla de Stripe.';

  @override
  String get premiumUseUpi => 'Usar UPI';

  @override
  String get premiumUseCard => 'Usar tarjeta';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'No se pudo abrir el portal de facturación';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Ha ocurrido un error al abrir el portal de facturación. Vuelve a intentarlo en un momento.';

  @override
  String get premiumAlreadyVisionaryTitle => 'Ya eres Visionario';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary ya incluye acceso permanente, por lo que no es necesaria una suscripción recurrente. Aun así, puedes comprar regalos para otros.';

  @override
  String get premiumExistingSubscriptionTitle => 'La suscripción ya existe';

  @override
  String get premiumExistingSubscriptionBody =>
      'Hemos encontrado una suscripción de Fluxer Plutonium existente para esta cuenta. Gestionarla en el portal de facturación seguro para actualizar los detalles de pago o comprobar el estado de renovación. Si acabas de pagar, espera un minuto y vuelve a abrir esta página.';

  @override
  String get premiumPurchasesDisabledTitle => 'Compras no disponibles';

  @override
  String get premiumPurchasesDisabledBody =>
      'Las compras están desactivadas para esta cuenta. Ponte en contacto con support@fluxer.app si esto parece incorrecto.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Reclama tu cuenta para comprar Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Debes verificar tu correo electrónico antes de poder comprar Fluxer Plutonium.';

  @override
  String get premiumPerkCustomUsernameTag =>
      'Etiqueta de nombre de usuario personalizado';

  @override
  String get premiumPerkPerCommunityProfiles => 'Perfiles por comunidad';

  @override
  String get premiumPerkMessageScheduling => 'Programar mensajes';

  @override
  String get premiumPerkProfileBadge => 'Insignia de perfil';

  @override
  String get premiumPerkCustomVideoBackgrounds =>
      'Fondos de vídeo personalizados';

  @override
  String get premiumPerkEntranceSounds => 'Sonidos de entrada';

  @override
  String get premiumPerkCommunities => 'Comunidades';

  @override
  String get premiumPerkMessageCharacterLimit =>
      'Límite de caracteres del mensaje';

  @override
  String get premiumPerkBookmarkedMessages => 'Mensajes guardados';

  @override
  String get premiumPerkFileUploadSize => 'Tamaño de subida de archivos';

  @override
  String get premiumPerkEmojiStickerPacks => 'Packs de emojis y pegatinas';

  @override
  String get premiumPerkSavedMedia => 'Archivos multimedia guardados';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Usar emojis animados';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Acceso global a emojis y stickers';

  @override
  String get premiumPerkVideoQuality => 'Calidad de vídeo';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Avatares y banners de perfil animados';

  @override
  String get premiumPerkEarlyAccess => 'Acceso anticipado a nuevas funciones';

  @override
  String get premiumPerkCustomThemes => 'Temas personalizados';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Hasta 4K/60 fps';

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
  String get userSettingsNavChat => 'Mensajes y contenido multimedia';

  @override
  String get userSettingsNavAudioAndVideo => 'Audio y vídeo';

  @override
  String get userSettingsNavShortcuts => 'Atajos de teclado';

  @override
  String get audioAndVideoAudioSectionTitle => 'Audio';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'Configura tu micrófono, altavoces y el procesamiento de voz.';

  @override
  String get audioAndVideoVideoSectionTitle => 'Vídeo';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'Configura la calidad de tu cámara y de la pantalla compartida.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle =>
      'Comportamiento durante llamadas';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Controla los diálogos de confirmación durante las llamadas de voz y vídeo.';

  @override
  String get audioAndVideoInputDeviceLabel => 'Dispositivo de entrada';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Dispositivo de salida';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'Por defecto';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Utilizar altavoz';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'Cuando está desactivado, el audio se reproducirá por el auricular o los cascos conectados.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Volumen de entrada';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Volumen de salida';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Procesamiento de voz';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Voz optimizada';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Recomendado. Limpia el sonido de tu micrófono para mayor claridad.';

  @override
  String get audioAndVideoDirectInputLabel => 'Entrada directa';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Envía el audio sin modificar. Preferible si utilizas software externo para ajustar tu audio.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Personalizado';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Cambia cada ajuste manualmente: supresión de ruido, cancelación de eco y ganancia.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Supresión de ruido';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Mejorada';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Estándar';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Ninguna';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Cancelación de eco';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Control automático de ganancia';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Nivela el volumen de tu micrófono. Se desactiva cuando la supresión mejorada está activada.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Prueba de micrófono';

  @override
  String get audioAndVideoMicTestStartLabel => 'Probar micrófono';

  @override
  String get audioAndVideoMicTestStopLabel => 'Detener prueba';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '$productName necesita acceso a tu micrófono para realizar la prueba.';
  }

  @override
  String get audioAndVideoCameraLabel => 'Cámara';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Reflejar cámara';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'Calidad de la cámara';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'Calidad de la pantalla compartida';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Velocidad de fotogramas';

  @override
  String get audioAndVideoFrameRate15Label => '15 FPS';

  @override
  String get audioAndVideoFrameRate30Label => '30 fps';

  @override
  String get audioAndVideoFrameRate60Label => '60 FPS';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080p y 60 FPS requieren $premiumProductName.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Esta instancia permite actualmente compartir pantalla hasta 720p a 30 FPS.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return '$productName necesita acceso al micrófono para mostrar tus dispositivos.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return '$productName necesita acceso a la cámara para mostrar tus dispositivos.';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'No preguntar al ocultar mi cámara';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'No preguntar al ocultar mi pantalla';

  @override
  String get userSettingsNavNotifications => 'Notificaciones';

  @override
  String get notificationsGeneralSectionTitle => 'General';

  @override
  String get notificationsEnableNotificationsLabel => 'Activar notificaciones';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Recibe notificaciones cuando te lleguen mensajes. Puede que tengas que permitir las notificaciones de $productName en los ajustes de tu dispositivo. Para los controles por canal o por comunidad, abre los ajustes de notificaciones desde el menú de una comunidad.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Activar notificaciones de escritorio';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Usa el centro de notificaciones del sistema operativo. Para los controles por canal o por comunidad, haz clic derecho en el icono de una comunidad y abre los ajustes de notificaciones.';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'Activar las notificaciones del navegador';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'Recibe notificaciones cuando te lleguen mensajes. Puede que tengas que permitir las notificaciones en los ajustes de tu navegador. Para controles por canal o comunidad, haz clic derecho en el icono de una comunidad y abre los ajustes de notificaciones.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Tiempo de espera de notificaciones push inactivas';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName evita enviar notificaciones push a tus dispositivos móviles cuando estás usando tu ordenador. Elige durante cuánto tiempo necesitas estar inactivo en el escritorio antes de que empieces a recibir notificaciones push.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute minuto';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes minutos';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle =>
      'Preferencias de mención';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Preferencias de mención en respuestas';

  @override
  String get notificationsMentionNoPreferenceName => 'Sin preferencias';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Respeta la intención del remitente, sin avisar cuando active o desactive la mención con @';

  @override
  String get notificationsMentionPreferMentionName => 'Preferir menciones';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Respuestas predeterminadas para mencionarte, y avisar al remitente si las desactiva';

  @override
  String get notificationsMentionPreferNoMentionName =>
      'No prefiero las menciones';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Las respuestas predeterminadas omiten la mención y advierten al remitente si la activa';

  @override
  String get notificationsTtsSectionTitle =>
      'Notificaciones con conversión de texto a voz';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'Activar la reproducción de voz de /tts';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'Permite que /tts lea tu mensaje en voz alta. Si desactivas este ajuste, esos comandos se mantendrán como texto normal.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Ajustar la velocidad de reproducción en ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Accesibilidad';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle =>
      'Narración automática de mensajes';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Convierte el contenido entrante en voz, independientemente de si proviene de /tts.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Todos los canales';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Reproducir en voz alta cada mensaje entrante, sin importar qué canal esté abierto.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Solo canal activo';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Narra solo el canal que estás viendo. La narración te sigue entre canales.';

  @override
  String get notificationsTtsModeNeverName => 'Nunca automáticamente';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Permanecer en silencio a menos que alguien ejecute /tts manualmente.';

  @override
  String get notificationsTtsModeAriaLabel =>
      'Leer todos los mensajes en voz alta';

  @override
  String get notificationsSoundsSectionTitle => 'Sonidos';

  @override
  String get notificationsMasterVolumeLabel => 'Volumen principal';

  @override
  String get notificationsMasterVolumeDescription =>
      'Establece el nivel para cada efecto de sonido. Las anulaciones de sonido individuales ignoran esto.';

  @override
  String get notificationsResetToDefaultVolume =>
      'Restablecer al volumen predeterminado';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Desactivar todos los sonidos de notificación';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Se conservará tu configuración de sonido de notificaciones actual.';

  @override
  String get notificationsShowMoreSoundEffects =>
      'Mostrar más efectos de sonido';

  @override
  String get notificationsShowFewerSoundEffects =>
      'Mostrar menos efectos de sonido';

  @override
  String get notificationsPreviewSound => 'Previsualizar sonido';

  @override
  String get notificationsPerSoundVolumeTitle => 'Volumen por sonido';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Establece volúmenes personalizados para sonidos individuales. Los sonidos sin una anulación siguen el volumen principal.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Volúmenes personalizados de sonido activos: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Siguiendo a la principal • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'Restablecer $label al volumen principal';
  }

  @override
  String get notificationsResetAllOverrides =>
      'Restablecer todas las anulaciones';

  @override
  String notificationsMuteSound(String label) {
    return 'Silenciar $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'Activar $label';
  }

  @override
  String get notificationsSoundMessage =>
      'Notificaciones de mensajes de la comunidad';

  @override
  String get notificationsSoundDirectMessage =>
      'Notificaciones de mensajes directos';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Notificaciones de mensajes del canal actual';

  @override
  String get notificationsSoundMute => 'Silenciar voz';

  @override
  String get notificationsSoundUnmute => 'Activar voz';

  @override
  String get notificationsSoundDeaf => 'Silenciar audio';

  @override
  String get notificationsSoundUndeaf => 'Dejar de silenciar voz';

  @override
  String get notificationsSoundUserJoin => 'El usuario se une al canal';

  @override
  String get notificationsSoundUserLeave => 'El usuario abandona el canal';

  @override
  String get notificationsSoundUserMove => 'Usuario movió el canal';

  @override
  String get notificationsSoundViewerJoin =>
      'El espectador se une a la retransmisión';

  @override
  String get notificationsSoundViewerLeave =>
      'El espectador abandona la retransmisión';

  @override
  String get notificationsSoundVoiceDisconnect => 'Voz desconectada';

  @override
  String get notificationsSoundIncomingRing => 'Llamada entrante';

  @override
  String get notificationsSoundCameraOn => 'Cámara activada';

  @override
  String get notificationsSoundCameraOff => 'Cámara apagada';

  @override
  String get notificationsSoundScreenShareStart =>
      'Iniciar pantalla compartida';

  @override
  String get notificationsSoundScreenShareStop =>
      'Compartir pantalla (detener)';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'No se ha podido actualizar el tiempo de espera de las notificaciones push. Vuelve a intentarlo.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'No se ha podido actualizar la preferencia de menciones. Inténtalo de nuevo.';

  @override
  String get notificationsPermissionDeniedTitle => 'Notificaciones bloqueadas';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'No se pudieron activar las notificaciones. Permite el acceso a las notificaciones para continuar.';

  @override
  String get userSettingsNavLanguageAndTime => 'Idioma y hora';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Idioma de la interfaz';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Elige el idioma que se usará en toda la aplicación';

  @override
  String get languageAndTimeOpenLanguageSettings => 'Abrir ajustes de idioma';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Formato de hora';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Elige cómo se muestran las horas en la aplicación';

  @override
  String get languageAndTimeTimeFormatSelectionLabel =>
      'Selección del formato de hora';

  @override
  String get languageAndTimeTimeFormatAuto => 'Automático';

  @override
  String get languageAndTimeTimeFormat12Hour => '12 horas';

  @override
  String get languageAndTimeTimeFormat24Hour => '24 horas';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'Idioma de la aplicación: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Idioma del sistema: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Usar el formato de hora del sistema';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'No se pudo actualizar el formato de hora';

  @override
  String get userSettingsNavDefaultApps => 'Aplicaciones predeterminadas';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Navegador web';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Elige qué navegador se abre cuando tocas un enlace.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'Si tienes instalada una aplicación para un sitio, los enlaces se abrirán primero en esa aplicación.';

  @override
  String get defaultAppsWebBrowserInApp => 'Navegador integrado';

  @override
  String get defaultAppsWebBrowserExternal => 'Navegador externo';

  @override
  String get userSettingsNavAdvanced => 'Avanzado';

  @override
  String get advancedPerformanceReportingTitle => 'Informes de rendimiento';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'Ayuda a mejorar $productName compartiendo datos anónimos de rendimiento y fallos.';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'Enviar informes de fallos y rendimiento';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'Todos los datos notificados son anónimos y solo se envían al propio servicio de monitorización de $productName; no se utilizan proveedores de terceros.';
  }

  @override
  String get advancedSettingsConfigure => 'Configurar';

  @override
  String get advancedSettingsCategoryPrivacy => 'Privacidad';

  @override
  String get advancedSettingsCategoryAppearance => 'Apariencia';

  @override
  String get advancedSettingsCategoryAccessibility => 'Accesibilidad';

  @override
  String get advancedSettingsCategoryChat => 'Chat';

  @override
  String get advancedSettingsCategoryMedia => 'Archivos multimedia';

  @override
  String get advancedSettingsCategoryVoice => 'Voz';

  @override
  String get advancedSettingsCategoryDeveloper => 'Desarrollador';

  @override
  String get advancedSettingEnableTextSelectionLabel =>
      'Habilitar selección de texto';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Permite seleccionar texto en la aplicación.';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Activar miniaturas de la barra de búsqueda de vídeo';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Miniatura o fotograma en vivo al reproducir el video.';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Respuesta háptica';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Vibración al tocar y realizar acciones. No se sincronizará entre dispositivos.';

  @override
  String get advancedSettingShowNekoLabel => 'Mostrar Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'Gato Neko que persigue tu cursor';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Mostrar Neko en tu entrada de chat';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Animación de zoom al iniciar';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Reduce el tamaño del logo al salir de la pantalla de inicio';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Sugerencias del teclado';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Muestra sugerencias de atajos de teclado en los consejos.';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Activar favoritos';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Mostrar favoritos en toda la aplicación.';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Comportamiento al unirse a un canal de voz';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Confirmación o doble clic para unirse a los canales de voz de la comunidad.';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Requerir doble clic para unirse a canales de voz';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Confirmar antes de unirte a canales de voz';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Enviar GIF automáticamente al seleccionarlos';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Enviar GIF automáticamente desde el selector sin confirmación';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Guardar GIF favoritos como contenido guardado';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Elige cómo se guardan tus GIF favoritos destacados';

  @override
  String get advancedSettingMediaButtonsLabel =>
      'Botones de contenido multimedia';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Personaliza qué botones e indicadores se muestran en los archivos multimedia y las incrustaciones';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Sube archivos adjuntos antes de enviar';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Comienza a subir los archivos adjuntos tan pronto como se añadan al campo de entrada del mensaje';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Eliminar parámetros de seguimiento de las URL';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Eliminar automáticamente los parámetros de seguimiento de las URL en los mensajes que envías';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'Confiar en todos los enlaces externos';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'Omitir la advertencia de enlace externo para todos los dominios';

  @override
  String get advancedSettingSearchEnginesLabel => 'Motores de búsqueda';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Configurar los motores de búsqueda que se utilizarán para el texto seleccionado';

  @override
  String get advancedSettingTranslatorsLabel => 'Traductores';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Configurar los proveedores de traducción que se utilizarán con el texto seleccionado';

  @override
  String get advancedSettingReverseImageSearchLabel =>
      'Búsqueda inversa de imágenes';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Proveedores de búsqueda inversa de imágenes.';

  @override
  String get advancedSettingMessageActionBarLabel =>
      'Barra de acciones de mensajes';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Personaliza la barra de acciones que aparece al pasar el ratón por encima de los mensajes';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Autocompletar expresiones';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Elige qué aparece cuando escribes dos puntos en el campo de entrada del mensaje';

  @override
  String get advancedSettingInputButtonsLabel =>
      'Botones de entrada de mensajes';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Elige qué botones se muestran en la barra de entrada de mensajes';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Desplazarse abajo al enviar un mensaje';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Elige cómo se desplaza la conversación después de que envíes un mensaje';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Omitir la confirmación de \"Marcar todo como leído\"';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Marcar todos los canales no leídos de la bandeja de entrada como leídos inmediatamente, sin pedir confirmación';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Ocultar canales silenciados por defecto';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Ocultar los canales silenciados de las barras laterales de la comunidad';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'Mostrar indicador de GIF';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Mostrar indicador de caducidad de archivos adjuntos';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'Mostrar botón de eliminar';

  @override
  String get advancedSettingShowMediaDownloadLabel =>
      'Mostrar botón de descarga';

  @override
  String get advancedSettingShowMediaFavoriteLabel =>
      'Mostrar botón de favoritos';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Mostrar el botón para suprimir los elementos incrustados';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Mostrar barra de acciones del mensaje';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel =>
      'Mostrar solo el botón de más';

  @override
  String get advancedSettingShowQuickReactionsLabel =>
      'Mostrar reacciones rápidas';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Habilitar Mayús para expandir';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Mostrar emojis predeterminados en el autocompletado de expresiones';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Mostrar emojis personalizados en el autocompletado de expresiones';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Mostrar stickers en el autocompletado de expresiones';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Mostrar contenido multimedia guardado en el autocompletado de expresiones';

  @override
  String get advancedSettingShowGifsButtonLabel => 'Mostrar botón de GIF';

  @override
  String get advancedSettingShowMediaButtonLabel =>
      'Mostrar botón de contenido multimedia';

  @override
  String get advancedSettingShowStickersButtonLabel =>
      'Mostrar el botón de stickers';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Mostrar botón de emoji';

  @override
  String get advancedSettingShowSendButtonLabel => 'Mostrar botón de enviar';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Mostrar alertas de nuevos dispositivos';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Solicitar nuevos dispositivos de audio.';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Controles de volumen de conexión';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Mostrar controles deslizantes de volumen por participante y dispositivo en los menús de voz';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Comportamiento de la vista previa para compartir pantalla';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Comportamiento de la vista previa, ventana emergente y miniatura del stream.';

  @override
  String get advancedSettingScreenShareCodecLabel =>
      'Códec para compartir pantalla';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Códec de video para compartir pantalla.';

  @override
  String get advancedSettingScreenShareCodecAuto => 'Automático (recomendado)';

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
      'Pausar la vista previa de mi pantalla compartida en segundo plano';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Ocultar la miniatura de la vista previa de mi stream';

  @override
  String get advancedSettingDeveloperModeLabel =>
      'Activar el modo de desarrollador';

  @override
  String get advancedSettingDeveloperModeDescription =>
      'Activar el modo de desarrollador';

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
  String get advancedSettingTranslatorGoogle => 'Traducción de Google';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel =>
      'Motor de búsqueda predeterminado';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Elige qué motor de búsqueda se usa por defecto al buscar el texto seleccionado.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Motores de búsqueda integrados';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Activa o desactiva los motores de búsqueda integrados. Los motores activados aparecen en el menú contextual del mensaje cuando se selecciona texto.';

  @override
  String get advancedSettingCustomSearchEnginesLabel =>
      'Motores de búsqueda personalizados';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Añade tus propios motores de búsqueda con un patrón de URL personalizado. Usa \'$query\' como marcador de posición para el texto de búsqueda.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Añadir buscador';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Habilita al menos un motor de búsqueda a continuación.';

  @override
  String get advancedSettingRemoveSearchEngineLabel =>
      'Eliminar motor de búsqueda';

  @override
  String get advancedSettingDefaultTranslatorLabel =>
      'Traductor predeterminado';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Elige qué traductor se usa por defecto al traducir el texto seleccionado.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Traductores integrados';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Activa o desactiva los traductores integrados. Los traductores activados aparecen en el menú contextual del mensaje cuando se selecciona texto.';

  @override
  String get advancedSettingCustomTranslatorsLabel =>
      'Traductores personalizados';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Añade tus propios traductores con un patrón de URL personalizado. Usa \'$query\' como marcador de posición para el texto a traducir.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Añadir traductor';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Habilita al menos un traductor a continuación.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Eliminar traductor';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Búsqueda inversa de imágenes predeterminada';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Elige qué servicio de búsqueda inversa de imágenes se usa por defecto al buscar una imagen.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Búsqueda inversa de imágenes integrada';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Activa o desactiva los proveedores de búsqueda inversa de imágenes integrados. Los proveedores activados aparecen en el menú contextual de imágenes, avatares, banners, stickers y emojis.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Búsqueda inversa de imágenes personalizada';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Añade tus propios proveedores de búsqueda inversa de imágenes con un patrón de URL personalizado. Usa \'$url\' como marcador de posición para la URL de la imagen.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Añadir búsqueda inversa de imágenes';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Activa al menos un proveedor de búsqueda inversa de imágenes a continuación.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Eliminar búsqueda inversa de imágenes';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Añadir buscador';

  @override
  String get advancedSettingEditSearchEngineTitle => 'Editar motor de búsqueda';

  @override
  String get advancedSettingAddTranslatorTitle =>
      'Añadir proveedor de traducción';

  @override
  String get advancedSettingEditTranslatorTitle =>
      'Editar proveedor de traducción';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Añadir motor de búsqueda de imagen inversa';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Editar motor de búsqueda de imagen inversa';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Nombre';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'Patrón de URL';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'Mi motor de búsqueda';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Mi traductor';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'Mi búsqueda inversa de imágenes';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Usa \'$query\' donde deba insertarse el texto de búsqueda.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Usa \"$query\" donde deba insertarse el texto a traducir.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Usa \'$url\' donde deba insertarse la URL de la imagen.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired =>
      'El nombre es obligatorio.';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'Se requiere un patrón de URL.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'El patrón de URL debe contener el marcador de posición \'$query\'.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'El patrón de URL debe contener el marcador de posición \'$url\'.';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'El patrón de URL debe ser una URL válida.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Añadir';

  @override
  String get advancedSettingEditSearchProviderAction => 'Editar';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Eliminar';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return '¿Seguro que quieres eliminar $engineName?';
  }

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
  String get userSettingsJoinFluxerLabs => 'Únete a Fluxer Labs';

  @override
  String get userSettingsNavAppLicenses => 'Licencias de la aplicación';

  @override
  String get userSettingsAppLicensesDescription =>
      'Software de código abierto utilizado por esta app. Esta app está creada con Flutter.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'No se pudieron cargar las licencias de la aplicación.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count licencias',
      one: '1 licencia',
    );
    return '$_temp0';
  }

  @override
  String get userSettingsNavLogOut => 'Cerrar sesión';

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
  String get savedMessagesEmptyTitle => 'No hay marcadores';

  @override
  String get savedMessagesEmptyBody =>
      'Marca mensajes para guardarlos para más tarde.';

  @override
  String get savedMessagesEndBody => 'No hay nada más que ver aquí.';

  @override
  String get savedMessagesRemoveTooltip => 'Eliminar marcador';

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
  String get uiSearch => 'Buscar';

  @override
  String get uiStartCall => 'Iniciar llamada';

  @override
  String get uiStartVideoCall => 'Iniciar videollamada';

  @override
  String get uiPlay => 'Reproducir';

  @override
  String get uiPause => 'Pausar';

  @override
  String get uiDownload => 'Descargar';

  @override
  String get uiMoreActions => 'Más acciones';

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
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'Esto notificará a $count miembros con el rol de $roleName. ¿Continuar?';
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
  String get guildNavbarGuildSelected => 'seleccionado';

  @override
  String get guildNavbarGuildUnread => 'no leído';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count menciones',
      one: '1 mención',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'silenciado';

  @override
  String get authShowPassword => 'Mostrar contraseña';

  @override
  String get authHidePassword => 'Ocultar contraseña';

  @override
  String get chatLoadingMessages => 'Cargando mensajes';

  @override
  String get friendsMessageFriend => 'Mensaje';

  @override
  String get friendsFriendActions => 'Acciones de amigo';

  @override
  String get friendsAcceptRequest => 'Aceptar solicitud de amistad';

  @override
  String get friendsDeclineRequest => 'Rechazar solicitud de amistad';

  @override
  String get friendsCancelRequest => 'Cancelar solicitud de amistad';

  @override
  String get friendsOpenInbox => 'Bandeja de entrada';

  @override
  String get profileRemoveFriend => 'Eliminar amigo';

  @override
  String get profileUnblockUser => 'Desbloquear usuario';

  @override
  String get profileAcceptFriendRequest => 'Aceptar solicitud de amistad';

  @override
  String get profileCancelFriendRequest => 'Cancelar solicitud de amistad';

  @override
  String get profileSendFriendRequest => 'Añadir amigo';

  @override
  String get accountOverflowMenu => 'Opciones de cuenta';

  @override
  String get navHome => 'Inicio';

  @override
  String get navNotifications => 'Notificaciones';

  @override
  String get navYou => 'Tú';

  @override
  String get guildFolderSettingsTitle => 'Ajustes de la carpeta';

  @override
  String get guildFolderNameLabel => 'Nombre de la carpeta';

  @override
  String get guildFolderColorLabel => 'Color de la carpeta';

  @override
  String get guildFolderShowIconWhenCollapsed => 'Mostrar icono al contraer';

  @override
  String get guildFolderIconLabel => 'Icono de la carpeta';

  @override
  String get guildFolderDelete => 'Eliminar carpeta';

  @override
  String get guildFolderIconFolder => 'Carpeta';

  @override
  String get guildFolderIconStar => 'Destacar';

  @override
  String get guildFolderIconHeart => 'Corazón';

  @override
  String get guildFolderIconBookmark => 'Marcar';

  @override
  String get guildFolderIconGameController => 'Mando de juego';

  @override
  String get guildFolderIconShield => 'Proteger';

  @override
  String get guildFolderIconMusicNote => 'Nota musical';

  @override
  String get guildFolderMarkAsRead => 'Marcar carpeta como leída';

  @override
  String get guildBulkMuteCommunities => 'Silenciar comunidades';

  @override
  String get guildBulkUnmuteCommunities =>
      'Reactivar sonido de las comunidades';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Ajustes de notificaciones de la comunidad';

  @override
  String get guildBulkCommunityPrivacySettings =>
      'Ajustes de privacidad de la comunidad';

  @override
  String get guildBulkAllowEveryoneAndHere => 'Permitir @everyone y @here';

  @override
  String get guildBulkAllowRoleMentions => 'Permitir menciones de rol';

  @override
  String get guildBulkEnableMobilePush =>
      'Activar notificaciones push en el móvil';

  @override
  String get guildBulkDisableMobilePush =>
      'Desactivar las notificaciones push en el móvil';

  @override
  String get guildBulkAllowDirectMessages => 'Permitir mensajes directos';

  @override
  String get guildBulkBlockDirectMessages => 'Bloquear mensajes directos';

  @override
  String get guildBulkAllowBotDirectMessages =>
      'Permitir mensajes directos del bot';

  @override
  String get guildBulkBlockBotDirectMessages =>
      'Bloquear mensajes directos de bots';

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
  String get guildNavbarChannelTypeSelection => 'Selección de tipo de canal';

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
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'Solo accesible para el personal de $productName';
  }

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
  String get guildMenuSettingsChannels => 'Canales';

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
  String get guildSettingsRolesNewRole => 'Nuevo rol';

  @override
  String get guildSettingsRolesDeleteRole => 'Eliminar rol';

  @override
  String get guildSettingsRolesBackToRoles => 'Volver a roles';

  @override
  String get guildSettingsBackToSettings => 'Volver a ajustes';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Editar \"$name\"';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Configura los ajustes y permisos del rol';

  @override
  String get guildSettingsRolesDisplaySection => 'Visualización';

  @override
  String get guildSettingsRolesRoleName => 'Nombre del rol';

  @override
  String get guildSettingsRolesRoleColor => 'Color del rol';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Escribe un color (hex, rgb(), hsl() o nombre) o usa el selector.';

  @override
  String get guildSettingsRolesShowSeparately =>
      'Mostrar este rol por separado';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Muestra a los miembros con este rol en su propia sección en la lista de miembros.';

  @override
  String get guildSettingsRolesAllowMentions =>
      'Permitir menciones para este rol';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'Los miembros con el permiso \"$permission\" siempre pueden mencionar roles, independientemente de este ajuste.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Usa este botón para borrar todos los permisos.';

  @override
  String get guildSettingsRolesClearPermissions => 'Borrar permisos';

  @override
  String get guildSettingsRolesPermissionsSection => 'Permisos';

  @override
  String get guildSettingsRolesSearchPermissions => 'Buscar permisos';

  @override
  String get guildSettingsRolesDenseLayout => 'Diseño denso';

  @override
  String get guildSettingsRolesComfyLayout => 'Diseño cómodo';

  @override
  String get guildSettingsRolesSwitchToDenseLayout =>
      'Cambiar a diseño compacto';

  @override
  String get guildSettingsRolesSwitchToComfyLayout => 'Cambiar a diseño cómodo';

  @override
  String get guildSettingsRolesSingleColumn => 'Una columna';

  @override
  String get guildSettingsRolesTwoColumns => 'Dos columnas';

  @override
  String get guildSettingsRolesSwitchToSingleColumn => 'Cambiar a una columna';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => 'Cambiar a dos columnas';

  @override
  String get guildSettingsRolesNoPermissionsFound =>
      'No se encontraron permisos';

  @override
  String get guildSettingsRolesCustomHoistOrder =>
      'Orden de jerarquía personalizado';

  @override
  String get guildSettingsRolesHoistOrder => 'Orden de elevación';

  @override
  String get guildSettingsRolesResetHoistOrder =>
      'Restablecer a los valores predeterminados';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Arrastra los roles para personalizar el orden en que aparecen en la lista de miembros.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'No hay roles destacados. Activa \"Mostrar este rol por separado\" en un rol para verlo aquí.';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'No puedes editar este rol porque es tu rol más alto o está por encima del tuyo';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Necesitas el permiso \"$permission\" para editar estos permisos';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'No puedes editar un rol igual o superior a tu rol más alto';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'No puedes otorgar un permiso que no tienes';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'No puedes eliminar este permiso porque te lo quitarías a ti mismo';

  @override
  String get guildSettingsRolesUpdatedSuccess =>
      'Roles actualizados correctamente';

  @override
  String get guildSettingsRolesCreatedSuccess => 'Rol creado correctamente';

  @override
  String get guildSettingsRolesDeletedSuccess => 'Rol eliminado correctamente';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'Orden de elevación restablecido a los valores predeterminados';

  @override
  String get guildSettingsRolesNameRequiredTitle =>
      'El nombre del rol es obligatorio';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Asigna un nombre al rol antes de guardar.';

  @override
  String get guildSettingsRolesCreateFailedTitle => 'No se pudo crear el rol';

  @override
  String get guildSettingsRolesUpdateFailedTitle =>
      'No se pudieron actualizar los roles';

  @override
  String get guildSettingsRolesDeleteFailedTitle =>
      'No se pudo eliminar el rol';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return 'No se pudo eliminar \"$name\". Inténtalo de nuevo.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'No se pudo restablecer el orden de elevación';

  @override
  String get guildSettingsRolesTryAgainInAMoment =>
      'Inténtalo de nuevo en un momento.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return '¿Seguro que quieres eliminar el rol $name? Los miembros que tengan este rol ya no lo tendrán.';
  }

  @override
  String get permissionCategoryCommunityWide => 'Toda la comunidad';

  @override
  String get permissionCategoryMessagesMedia =>
      'Mensajes y contenido multimedia';

  @override
  String get permissionCategoryModeration => 'Moderación';

  @override
  String get permissionCategoryChannelAccess => 'Acceso al canal';

  @override
  String get permissionCategoryChannelManagement => 'Gestión de canales';

  @override
  String get permissionCategoryAudioVideo => 'Audio y vídeo';

  @override
  String get permissionUnknown => 'Permiso desconocido';

  @override
  String get permissionAdministrator => 'Administrador';

  @override
  String get permissionAdministratorDescription =>
      'Concede todos los permisos y omite las restricciones del canal. Muy sensible.';

  @override
  String get permissionViewActivityLog => 'Ver registro de actividad';

  @override
  String get permissionViewActivityLogDescription =>
      'Leer el registro de actividad de la comunidad sobre cambios y acciones de moderación.';

  @override
  String get permissionManageCommunity => 'Gestionar comunidad';

  @override
  String get permissionManageCommunityDescription =>
      'Edita los ajustes globales, como el nombre, la descripción y el icono.';

  @override
  String get permissionManageRoles => 'Gestionar roles';

  @override
  String get permissionManageRolesDescription =>
      'Crea, edita o elimina roles por debajo de tu rol más alto. También permite editar la anulación de permisos del canal.';

  @override
  String get permissionManageChannels => 'Gestionar canales';

  @override
  String get permissionManageChannel => 'Gestionar canal';

  @override
  String get permissionManageChannelDescription =>
      'Cambia el nombre y edita los ajustes de este canal.';

  @override
  String get permissionManagePermissions => 'Gestionar permisos';

  @override
  String get permissionManagePermissionsDescription =>
      'Edita las anulaciones para roles y miembros en este canal.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Crea, edita o elimina webhooks para este canal.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Ver la lista de miembros de este canal.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Administra los enlaces de invitación para este canal.';

  @override
  String get permissionOverwriteDeny => 'Denegar';

  @override
  String get permissionOverwriteInherit => 'Neutro (heredado)';

  @override
  String get permissionOverwriteAllow => 'Permitir';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Usa estos botones para configurar rápidamente todos los permisos.';

  @override
  String get permissionManageChannelsDescription =>
      'Crear, editar o eliminar canales y categorías.';

  @override
  String get permissionKickMembers => 'Expulsar miembros';

  @override
  String get permissionBanMembers => 'Expulsar miembros';

  @override
  String get permissionCreateInviteLinks => 'Crear enlaces de invitación';

  @override
  String get permissionChangeOwnNickname => 'Cambiar mi apodo';

  @override
  String get permissionChangeOwnNicknameDescription =>
      'Actualiza tu propio apodo.';

  @override
  String get permissionManageNicknames => 'Gestionar apodos';

  @override
  String get permissionManageNicknamesDescription =>
      'Cambiar los apodos de otros miembros.';

  @override
  String get permissionCreateEmojiStickers => 'Crear emojis y stickers';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Sube nuevos emojis y stickers, y gestiona tus propias creaciones.';

  @override
  String get permissionManageEmojiStickers => 'Gestionar emojis y stickers';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Editar o eliminar emojis y stickers creados por otros miembros.';

  @override
  String get permissionManageWebhooks => 'Gestionar webhooks';

  @override
  String get permissionManageWebhooksDescription =>
      'Crea, edita o elimina webhooks.';

  @override
  String get permissionSendMessages => 'Enviar mensajes';

  @override
  String get permissionSendTtsMessages => 'Enviar mensajes de texto a voz';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Enviar mensajes de texto a voz.';

  @override
  String get permissionManageMessages => 'Gestionar mensajes';

  @override
  String get permissionManageMessagesDescription =>
      'Eliminar mensajes de otros miembros. La fijación se controla por separado.';

  @override
  String get permissionPinMessages => 'Fijar mensajes';

  @override
  String get permissionEmbedLinks => 'Insertar enlaces';

  @override
  String get permissionAttachFiles => 'Adjuntar archivos';

  @override
  String get permissionMentionEveryone => 'Usar @everyone/@here y @rol';

  @override
  String get permissionMentionEveryoneDescription =>
      'Menciona a todos o a cualquier rol (incluso si el rol no está configurado para ser mencionable).';

  @override
  String get permissionUseExternalEmoji => 'Usar emojis externos';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Usar emojis de otras comunidades.';

  @override
  String get permissionUseExternalStickers => 'Usar stickers externos';

  @override
  String get permissionAddReactions => 'Añadir reacciones';

  @override
  String get permissionAddReactionsDescription =>
      'Añade nuevas reacciones a los mensajes.';

  @override
  String get permissionBypassSlowmode => 'Omitir modo lento';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Ignorar los límites de frecuencia de mensajes por canal.';

  @override
  String get permissionTimeOutMembers =>
      'Aplicar tiempo de espera a los miembros';

  @override
  String get permissionTimeOutMembersDescription =>
      'Impide que los miembros envíen mensajes, reaccionen y se unan a chats de voz durante un tiempo determinado.';

  @override
  String get permissionViewChannel => 'Ver canal';

  @override
  String get permissionViewChannelMembers => 'Ver miembros del canal';

  @override
  String get permissionViewChannelMembersDescription =>
      'Ver la lista de miembros de los canales de esta comunidad.';

  @override
  String get permissionConnect => 'Conectar';

  @override
  String get permissionSpeak => 'Hablar';

  @override
  String get permissionStreamVideo => 'Transmitir vídeo';

  @override
  String get permissionUseVoiceActivity => 'Usar actividad de voz';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Sin este permiso, se requiere pulsar para hablar.';

  @override
  String get permissionPrioritySpeaker => 'Prioridad de voz';

  @override
  String get permissionMuteMembers => 'Silenciar miembros';

  @override
  String get permissionDeafenMembers => 'Silenciar a los miembros';

  @override
  String get permissionMoveMembers => 'Mover miembros';

  @override
  String get permissionMoveMembersDescription =>
      'Arrastra miembros entre canales a los que puedan acceder.';

  @override
  String get permissionSetVoiceRegion => 'Establecer región de voz';

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
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'Esta comunidad aún no tiene ningún webhook. Ve a $channelSettingsPath para crear uno.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'Necesitas el permiso \"$permission\" para ver y editar los webhooks de esta comunidad.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle =>
      'No se pudieron cargar los webhooks';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'Ha habido un error al cargar los webhooks. Inténtalo de nuevo.';

  @override
  String get guildSettingsWebhooksUpdated => 'Webhooks actualizados';

  @override
  String get guildSettingsWebhooksUpdateFailed =>
      'No se pudieron actualizar los webhooks';

  @override
  String get guildSettingsUnknownChannel => 'Canal desconocido';

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
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'No hay suficientes miembros';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Se requieren al menos $count miembros para solicitar.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Estado:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'Pendiente';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Aprobado';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Rechazado';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Eliminado';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Motivo: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'Tu comunidad aparece en Descubrir. Puedes actualizar los detalles de tu anuncio a continuación o retirarlo para eliminarlo.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Tu solicitud está pendiente de revisión. Aún puedes actualizar los detalles de tu anuncio o retirar la solicitud.';

  @override
  String get guildSettingsDiscoveryCategory => 'Categoría';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Elige la categoría que mejor describa a tu comunidad. Puedes cambiarla en cualquier momento.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Idioma principal';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'El idioma que habla la mayor parte de tu comunidad. Se usa para filtrar los resultados de Descubrir.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Descripción';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Describe de qué trata tu comunidad';

  @override
  String get guildSettingsDiscoveryDescriptionRequired =>
      'Se requiere una descripción.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'La descripción debe tener al menos $minLength caracteres.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'La descripción no puede tener más de $maxLength caracteres.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Etiquetas';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Hasta $maxTags etiquetas ayudan a la gente a encontrar tu comunidad. Aparecen en la búsqueda de Descubrimiento.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'gaming, arte, música';

  @override
  String get guildSettingsDiscoveryAddTag => 'Añadir';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Eliminar etiqueta $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle =>
      'No se pudo añadir la etiqueta';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'Las etiquetas deben tener entre 2 y $maxLength caracteres alfanuméricos.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'Solo puedes añadir hasta $maxTags etiquetas.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Enviar solicitud';

  @override
  String get guildSettingsDiscoverySave => 'Guardar';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Retirar';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Solicitud de descubrimiento enviada';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Listado de descubrimientos actualizado';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Solicitud de descubrimiento retirada';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'No se pudo retirar la solicitud';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Inténtalo de nuevo en un momento.';

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
  String get guildMembersRecentTitle => 'Miembros recientes';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Mostrando $displayedCount de $totalCount miembros en total';
  }

  @override
  String get guildMembersSort => 'Ordenar';

  @override
  String get guildSettingsMembersSortNewest => 'Más recientes primero';

  @override
  String get guildMembersSortOldest => 'Más antiguos primero';

  @override
  String get guildMembersColumnName => 'Nombre';

  @override
  String get guildMembersColumnMemberSince => 'Miembro desde';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'Se unió a $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Método de unión';

  @override
  String get guildMembersColumnRoles => 'Roles';

  @override
  String get guildMembersColumnActions => 'Acciones';

  @override
  String get guildMembersFilterMemberSince => 'Filtrar por miembro desde';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Filtrar por fecha de creación de la cuenta';

  @override
  String get guildMembersFilterJoinMethod => 'Filtrar por método de unión';

  @override
  String get guildMembersFilterRoles => 'Filtrar por roles';

  @override
  String get guildMembersFilterAll => 'Todo';

  @override
  String get guildMembersFilterPast1Hour => 'Última hora';

  @override
  String get guildMembersFilterPast24Hours => 'Últimas 24 horas';

  @override
  String get guildMembersFilterPast7Days => 'Últimos 7 días';

  @override
  String get guildMembersFilterPast2Weeks => 'Últimas 2 semanas';

  @override
  String get guildMembersFilterPast3Weeks => 'Últimas 3 semanas';

  @override
  String get guildMembersFilterPast4Weeks => 'Últimas 4 semanas';

  @override
  String get guildMembersFilterPast3Months => 'Últimos 3 meses';

  @override
  String get guildMembersFilterCustomRange => 'Rango personalizado...';

  @override
  String get guildMembersDateRangeTitle => 'Intervalo de fechas personalizado';

  @override
  String get guildMembersDateAfter => 'Después de la fecha';

  @override
  String get guildMembersDateBefore => 'Fecha anterior';

  @override
  String get guildMembersClearAll => 'Borrar todo';

  @override
  String get guildMembersRowsPerPage => 'Filas por página';

  @override
  String get guildMembersEmptySearch => 'Nadie coincide con esa búsqueda.';

  @override
  String get guildMembersLoadError =>
      'Ha habido un problema al cargar los miembros. Inténtalo de nuevo más tarde.';

  @override
  String get guildMembersIndexing => 'Indexando miembros…';

  @override
  String get guildMembersGoToPage => 'Ir a la página';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'Ir a la página $page';
  }

  @override
  String get guildMembersJumpToPage => 'Ir a la página';

  @override
  String get guildMembersJoinSourceCreator => 'Creador de la comunidad';

  @override
  String get guildMembersJoinSourceInvite => 'Invitar';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Invitar ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Invitado por $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'URL personalizada';

  @override
  String get guildMembersJoinSourceBotInvite => 'Invitar bot';

  @override
  String get guildMembersJoinSourcePlatformAdmin =>
      'Administrador de la plataforma';

  @override
  String get guildMembersJoinSourceDiscovery => 'Descubrimiento';

  @override
  String get guildMembersJoinMethodUnknown => 'Desconocido';

  @override
  String get guildMembersCommunityOwner => 'Propietario de la comunidad';

  @override
  String get guildMembersViewAllRoles => 'Ver todos los roles';

  @override
  String get guildMembersJoinedJustNow => 'Justo ahora';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hace # minutos',
      one: 'Hace 1 minuto',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hace # horas',
      one: 'Hace 1 hora',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace # días',
      one: 'hace 1 día',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Miembros';

  @override
  String get guildMembersChannelListSelected => 'Miembros, seleccionados';

  @override
  String get guildSettingsInvitesTitle => 'Invitaciones';

  @override
  String get guildSettingsInvitesDescription =>
      'Ver y revocar enlaces de invitación activos.';

  @override
  String get guildSettingsInvitesEmpty => 'No hay invitaciones activas.';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Esta comunidad aún no tiene enlaces de invitación. Ve a un canal y crea una invitación para invitar a gente.';

  @override
  String get guildSettingsInvitesLoadFailedTitle =>
      'No se pudieron cargar las invitaciones';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Ha habido un error al cargar las invitaciones. Inténtalo de nuevo.';

  @override
  String get guildSettingsInvitesTryAgain => 'Volver a intentar';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Mostrar fecha de creación en lugar de fecha de caducidad';

  @override
  String get guildSettingsInvitesPauseInvites => 'Pausar invitaciones';

  @override
  String get guildSettingsInvitesEnableInvites => 'Habilitar invitaciones';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Pausar las invitaciones para esta comunidad';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Habilitar invitaciones para esta comunidad';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      '¿Pausar las invitaciones? Los nuevos usuarios no podrán unirse a través de enlaces de invitación hasta que las vuelvas a activar. Los miembros existentes no se verán afectados.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      '¿Habilitar invitaciones? Los usuarios podrán unirse a esta comunidad a través de enlaces de invitación de nuevo.';

  @override
  String get guildSettingsInvitesPause => 'Pausar';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Las invitaciones están en pausa para esta comunidad.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Las invitaciones están en pausa porque $productName ha detectado un posible ataque. Los usuarios nuevos no pueden unirse ahora mismo.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Invitó:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Canal:';

  @override
  String get guildSettingsInvitesLabelCode => 'Código:';

  @override
  String get guildSettingsInvitesLabelUses => 'Usa:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Creado:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Caduca:';

  @override
  String get guildSettingsInvitesUnknown => 'Desconocido';

  @override
  String get guildSettingsInvitesNoCategory => 'Sin categoría';

  @override
  String get guildSettingsInvitesExpired => 'Caducado';

  @override
  String get guildSettingsInvitesNever => 'Nunca';

  @override
  String get guildSettingsInvitesCopyLink => 'Copiar enlace de invitación';

  @override
  String get guildSettingsInvitesRevoke => 'Revocar invitación';

  @override
  String get guildSettingsInvitesRevokeFailedTitle =>
      'No se pudo revocar la invitación';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'Es posible que el enlace siga funcionando. Inténtalo de nuevo en un momento.';

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
  String get guildSettingsEmojiSlotsTitle => 'Espacios para emojis';

  @override
  String get guildSettingsEmojiDropZone =>
      'Arrastra y suelta aquí los archivos de emoji';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'No se pudieron cargar los emojis. Inténtalo de nuevo más tarde.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'No se han encontrado emojis que coincidan con tu búsqueda.';

  @override
  String get guildSettingsEmojiNoSlots => 'No hay ranuras de emoji disponibles';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Has alcanzado el número máximo de emojis. Elimina algunos emojis existentes para liberar espacio.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Los nombres de los emojis deben tener al menos 2 caracteres y pueden usar letras, números y guiones bajos. Los emojis deben ser inferiores a $maxSize. Las imágenes estáticas se redimensionan automáticamente a 128x128 píxeles y se comprimen. Los emojis animados y los SVG ya deben ajustarse al límite.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'Subiendo emojis';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# emojis',
      one: '# emoji',
    );
    return 'Cargando $_temp0. Esto puede tardar un poco.';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'No se pudieron subir los emojis. Inténtalo de nuevo.';

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'No se pudieron añadir algunos emojis';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'Revisa estos archivos e inténtalo de nuevo con imágenes más pequeñas o sencillas.';

  @override
  String get guildSettingsEmojiRenameTitle => 'Renombrar emoji';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2-32 caracteres, letras, números, guiones bajos.';

  @override
  String get guildSettingsEmojiColumnEmoji => 'Emoji';

  @override
  String get guildSettingsEmojiColumnName => 'Nombre';

  @override
  String get guildSettingsEmojiColumnUploader => 'Subido por';

  @override
  String get guildSettingsEmojiUnknownUploader => 'Desconocido';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Eliminar emoji';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return '¿Eliminar $name?: No se puede deshacer.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Eliminar este emoji del almacenamiento y la CDN';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'El nombre del emoji debe tener al menos 2 caracteres';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'El nombre del emoji debe tener 32 caracteres como máximo';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Nombre de emoji no válido';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'No se pudo cambiar el nombre de este emoji';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'El nombre se ha revertido al anterior. Vuelve a intentarlo en un momento.';

  @override
  String get guildSettingsEmojiGoneTitle => 'Este emoji ya no existe';

  @override
  String get guildSettingsEmojiGoneBody =>
      'Puede que se haya eliminado. El nombre se ha revertido al que tenía antes.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'No puedes cambiar el nombre de este emoji';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'No tienes permiso para cambiar el nombre de este emoji. El nombre se ha revertido al anterior.';

  @override
  String get guildSettingsEmojiRateLimitedTitle => 'Vas demasiado rápido';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'Espera un momento e intenta cambiar el nombre de nuevo.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'No se pudo eliminar este emoji';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'No puedes eliminar este emoji';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'Permitir que otros clonen tus emojis';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'Cuando está activado, los miembros de otras comunidades pueden usar el atajo de un clic de la aplicación \"Clonar\" en tus emojis personalizados. Esto no evita que guarden la imagen y la suban ellos mismos.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Permitir que otros clonen tus stickers';

  @override
  String get guildSettingsCloneStickerDescription =>
      'Cuando está activado, los miembros de otras comunidades pueden usar el atajo de un clic \"Clonar\" en la aplicación para tus stickers personalizados. Esto no evita que guarden la imagen y la suban ellos mismos.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Solo los miembros con el permiso \"$permission\" pueden cambiar esto.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'No se pudo actualizar la clonación de emojis';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'No se pudo actualizar la clonación de stickers';

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
  String get guildSettingsStickerSlotsTitle => 'Espacios para stickers';

  @override
  String get guildSettingsStickerUploadTitle => 'Subir sticker';

  @override
  String get guildSettingsStickerDropZone =>
      'Arrastra y suelta un archivo de sticker aquí (uno a la vez)';

  @override
  String get guildSettingsStickerDensity => 'Densidad de stickers';

  @override
  String get guildSettingsStickerDensityCozy => 'Acogedor';

  @override
  String get guildSettingsStickerDensityCompact => 'Compacto';

  @override
  String get guildSettingsStickersLoadFailedTitle =>
      'No se pudieron cargar los stickers';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Ha habido un error al cargar los stickers. Inténtalo de nuevo.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'No se encontraron stickers que coincidan con tu búsqueda.';

  @override
  String get guildSettingsStickersEmptySearch => 'No se encontraron stickers';

  @override
  String get guildSettingsStickerNoSlots =>
      'No hay ranuras para stickers disponibles';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Has alcanzado el número máximo de stickers. Elimina algunos stickers existentes para hacer espacio.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Los stickers se guardan en 320x320 píxeles y deben ser inferiores a $maxSize. Las imágenes estáticas se redimensionan y comprimen automáticamente. Los stickers animados y los SVG ya deben ajustarse al límite.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle =>
      'Archivo de sticker no compatible';

  @override
  String get guildSettingsStickerAddTitle => 'Añadir sticker';

  @override
  String get guildSettingsStickerEditTitle => 'Editar sticker';

  @override
  String get guildSettingsStickerNameLabel => 'Nombre';

  @override
  String get guildSettingsStickerNameHint => 'Mi sticker increíble';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Descripción';

  @override
  String get guildSettingsStickerDescriptionHint => 'Describe el sticker';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Etiquetas ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Añadir etiqueta';

  @override
  String get guildSettingsStickerTagAdd => 'Añadir';

  @override
  String get guildSettingsStickerNameRequired => 'El nombre es obligatorio';

  @override
  String get guildSettingsStickerNameTooShort =>
      'El nombre debe tener al menos 2 caracteres';

  @override
  String get guildSettingsStickerNameTooLong =>
      'El nombre debe tener 30 caracteres o menos';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'La descripción debe tener 500 caracteres o menos';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'No se pudo crear esta pegatina';

  @override
  String get guildSettingsStickerTooLargeTitle =>
      'La pegatina es demasiado grande';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'No se pudo comprimir la pegatina lo suficiente';

  @override
  String get guildSettingsStickerDeleteTitle => 'Eliminar sticker';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return '¿Eliminar \"$name\"? No se puede deshacer.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Eliminar este sticker del almacenamiento y la CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'No se ha podido eliminar este sticker';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'No puedes eliminar esta pegatina';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Crea webhooks desde los ajustes del canal. Edítalos aquí.';
  }

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
  String get guildSettingsInvitesTableExpires => 'Caduca';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtrar por usuario';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtrar por acción';

  @override
  String get createDm => 'Crear MD';

  @override
  String get createGroupDm => 'Crear grupo de MD';

  @override
  String get createDmNewMessage => 'Nuevo mensaje';

  @override
  String get createDmSelectFriends => 'Seleccionar amigos';

  @override
  String get createDmChooseFriendsSubtitle =>
      'Elige amigos para enviar mensajes.';

  @override
  String get createDmSearchFriends => 'Buscar amigos';

  @override
  String get createDmNoFriendsFound => 'No se han encontrado amigos';

  @override
  String get createDmNoFriendsYet => 'Aún no tienes amigos';

  @override
  String get createDmClaimToStartDms => 'Reclama tu cuenta para iniciar MD.';

  @override
  String get createDmVerifyToStartDms =>
      'Verifica tu correo electrónico para iniciar MD.';

  @override
  String get createDmVerifyYourEmail => 'Verifica tu correo electrónico';

  @override
  String get createDmNewGroup => 'Nuevo grupo';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Crear un grupo nuevo con $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'Confirmar nuevo grupo';

  @override
  String get createDmCreateNewGroup => 'Crear grupo nuevo';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'Eliminar a $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'Ya tienes un grupo con estos usuarios. ¿De verdad quieres crear uno nuevo? ¡También está bien!';

  @override
  String get createDmNoActivityYet => 'Aún no hay actividad';

  @override
  String get createDmSomeUsersCantBeAdded =>
      'No se pueden añadir algunos usuarios';

  @override
  String get createDmCreateWithoutThem => 'Crear sin ellos';

  @override
  String get createDmUnaddableIntro =>
      'Las siguientes personas no pueden añadirse a este grupo de MD:';

  @override
  String createDmUnaddableProceed(int count) {
    return '¿Crear el chat de grupo con los $count destinatario(s) restantes y omitir los demás?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'No quedan destinatarios para crear un grupo de MD.';

  @override
  String get createDmUnaddableUserNotFound => 'Usuario no encontrado';

  @override
  String get createDmUnaddableBlocked =>
      'No puedes enviar mensajes a este usuario';

  @override
  String get createDmUnaddableNotFriends => 'No está en tu lista de amigos';

  @override
  String get createDmUnaddableGroupDisabled =>
      'No permite que se le añada a MD de grupo';

  @override
  String get createDmFailed =>
      'No se ha podido crear la conversación. Inténtalo de nuevo.';

  @override
  String get dmListMessagesTitle => 'Mensajes';

  @override
  String get dmListDirectMessagesTitle => 'Mensajes directos';

  @override
  String get keybindsSearchShortcuts => 'Buscar atajos';

  @override
  String get keybindSectionDefaults => 'Predeterminados';

  @override
  String get keybindSectionMessages => 'Mensajes';

  @override
  String get keybindSectionNavigation => 'Navegación';

  @override
  String get keybindSectionDragAndDrop => 'Arrastrar y soltar';

  @override
  String get keybindSectionChat => 'Chat';

  @override
  String get keybindSectionVoiceAndVideo => 'Voz y vídeo';

  @override
  String get keybindSectionMisc => 'Varios';

  @override
  String get keybindActionShowShortcutsList =>
      'Mostrar lista de atajos de teclado';

  @override
  String get keybindActionCopyText => 'Copiar texto';

  @override
  String get keybindActionMarkUnread => 'Marcar como no leído';

  @override
  String get keybindActionFocusTextarea => 'Enfocar cuadro de texto';

  @override
  String get keybindActionSwitchCommunities => 'Cambiar entre comunidades';

  @override
  String get keybindActionSwitchChannels => 'Cambiar de canal';

  @override
  String get keybindActionHistoryBack =>
      'Retroceder en el historial de canales vistos';

  @override
  String get keybindActionHistoryForward =>
      'Avanzar por el historial de canales vistos';

  @override
  String get keybindActionJumpUnreadChannels =>
      'Saltar entre canales no leídos';

  @override
  String get keybindActionJumpMentionChannels =>
      'Saltar entre canales no leídos con menciones';

  @override
  String get keybindActionJumpCurrentCall => 'Ir a la llamada actual';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Alternar entre el último chat de comunidad y los MD';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Cambiar a la comunidad o MD anteriores';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Cambiar a la siguiente comunidad o MD';

  @override
  String get keybindActionGoToDms => 'Ir a mensajes directos';

  @override
  String get keybindActionGoToFirstCommunity => 'Ir a la primera comunidad';

  @override
  String get keybindActionGoToSecondCommunity => 'Ir a la segunda comunidad';

  @override
  String get keybindActionGoToThirdCommunity => 'Ir a la tercera comunidad';

  @override
  String get keybindActionGoToFourthCommunity => 'Ir a la cuarta comunidad';

  @override
  String get keybindActionGoToFifthCommunity => 'Ir a la quinta comunidad';

  @override
  String get keybindActionGoToSixthCommunity => 'Ir a la sexta comunidad';

  @override
  String get keybindActionGoToSeventhCommunity => 'Ir a la séptima comunidad';

  @override
  String get keybindActionGoToEighthCommunity => 'Ir a la octava comunidad';

  @override
  String get keybindActionToggleQuickSwitcher => 'Alternar el selector rápido';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'Crear o unirse a una comunidad';

  @override
  String get keybindActionStartDragAndDrop => 'Iniciar arrastrar y soltar';

  @override
  String get keybindActionMove => 'Mover';

  @override
  String get keybindActionDropItem => 'Soltar objeto';

  @override
  String get keybindActionCancel => 'Cancelar';

  @override
  String get keybindActionMarkCommunityRead => 'Marcar comunidad como leída';

  @override
  String get keybindActionMarkChannelRead => 'Marcar canal como leído';

  @override
  String get keybindActionStartGroupDm => 'Iniciar un MD de grupo';

  @override
  String get keybindActionTogglePinnedMessages => 'Alternar mensajes anclados';

  @override
  String get keybindActionToggleInbox => 'Alternar la bandeja de entrada';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Marcar como leído el canal superior de la bandeja de entrada';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Marcar todos los canales de la bandeja de entrada como leídos';

  @override
  String get keybindActionToggleMemberList =>
      'Alternar la lista de miembros o el chat de voz';

  @override
  String get keybindActionToggleEmojiPicker => 'Alternar el selector de emojis';

  @override
  String get keybindActionToggleGifPicker => 'Alternar el selector de GIF';

  @override
  String get keybindActionToggleStickerPicker =>
      'Alternar el selector de stickers';

  @override
  String get keybindActionScrollChatUp => 'Desplazar el chat hacia arriba';

  @override
  String get keybindActionScrollChatDown => 'Desplazar el chat hacia abajo';

  @override
  String get keybindActionJumpOldestUnread =>
      'Ir al mensaje no leído más antiguo';

  @override
  String get keybindActionFocusComposer => 'Enfocar el área de texto';

  @override
  String get keybindActionUploadFile => 'Subir un archivo';

  @override
  String get keybindActionCopyChannelLink => 'Copiar enlace del canal';

  @override
  String get keybindActionToggleSavedMedia => 'Alternar contenido guardado';

  @override
  String get keybindActionSendVoiceMessage => 'Enviar mensaje de voz';

  @override
  String get keybindActionAnswerCall => 'Responder a la llamada entrante';

  @override
  String get keybindActionDeclineCall => 'Rechazar la llamada entrante';

  @override
  String get keybindActionStartDmCall => 'Iniciar una llamada en un MD o grupo';

  @override
  String get keybindActionToggleSoundboard => 'Alternar la mesa de sonido';

  @override
  String get keybindActionToggleCompactCallView =>
      'Expandir o contraer la vista compacta de llamada';

  @override
  String get keybindActionPushToTalkPriority =>
      'Pulsar para hablar (prioridad)';

  @override
  String get keybindActionVoiceActivityPriority =>
      'Prioridad de actividad de voz';

  @override
  String get keybindActionOpenHelp => 'Abrir ayuda';

  @override
  String get keybindActionSearchMessages => 'Buscar mensajes';

  @override
  String get keybindActionOpenContextMenu => 'Abrir el menú contextual';

  @override
  String get keybindActionOpenSettings => 'Abrir ajustes';

  @override
  String get keybindActionOpenThemeStudio =>
      'Abrir ventana emergente del estudio de temas';

  @override
  String get keybindActionZoomIn => 'Acercar';

  @override
  String get keybindActionZoomOut => 'Alejar';

  @override
  String get keybindActionZoomReset => 'Restablecer zoom';

  @override
  String get clipboardPasteFailed =>
      'No se ha podido pegar. El portapapeles estaba vacío o bloqueado para esta app.';

  @override
  String get homeQuickActionDms => 'Mensajes directos';
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
  String get sessionExpiredToast =>
      'Tu sesión ha caducado. Por favor, inicia sesión de nuevo.';

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
  String get splashViewOnStatusPage => 'Ver en la página de estado';

  @override
  String get splashConnectionIssuesPrompt => '¿Problemas de conexión?';

  @override
  String get splashStatusPageLink => 'Página de estado';

  @override
  String get splashReadIncident => 'Ver reporte del incidente';

  @override
  String get splashIncidentHistory => 'Historial de incidentes';

  @override
  String get nagbarLearnMore => 'Más información';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'El mantenimiento está programado para $localizedTime. Duración estimada: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'El mantenimiento está en curso. Duración prevista: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'El mantenimiento se ha completado.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Hola $displayName, reclama tu cuenta para evitar perder el acceso.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Hola $displayName, por favor verifica tu dirección de correo electrónico.';
  }

  @override
  String get nagbarOpenSettings => 'Abrir ajustes';

  @override
  String get systemPermissionSettingsTitle => 'Habilitar permiso';

  @override
  String get systemPermissionSettingsOpenSettings => 'Abrir ajustes';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName no tiene acceso a tu micrófono. Puedes activarlo en la configuración de privacidad de tu dispositivo.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName no tiene acceso a tu cámara. Puedes activarla en la configuración de privacidad de tu dispositivo.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName no tiene acceso a tu galería de fotos. Puedes habilitarlo en la configuración de privacidad de tu dispositivo.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName no tiene permiso para enviar notificaciones. Puedes activarlo en la configuración de tu dispositivo.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Tu suscripción no se pudo renovar, pero aún tienes acceso a los beneficios de $productName hasta el $graceDate. Toma medidas ahora o perderás todos los beneficios.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Tu suscripción a $productName ha caducado. Renueva ahora para conservar tus beneficios.';
  }

  @override
  String get nagbarManageSubscription => 'Gestionar suscripción';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Te damos la bienvenida a $productFullName. Explora tus beneficios de $productName y gestiona tu suscripción.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'Ver funciones de $productName';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'Tienes un nuevo código de regalo esperando en tu inventario de regalos.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'Tienes $count nuevos códigos de regalo esperando en tu inventario de regalos.';
  }

  @override
  String get nagbarViewGiftInventory => 'Ver inventario de regalos';

  @override
  String get nagbarVisionaryMfa =>
      'Habilita la autenticación en dos pasos para proteger tu cuenta de Visionario.';

  @override
  String get nagbarEnableMfa => 'Activar 2FA';

  @override
  String get nagbarTermsAcceptance =>
      'Hemos actualizado nuestros términos. Revísalos y acéptalos para continuar.';

  @override
  String get nagbarReviewTerms => 'Revisar términos';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Únete a $communityName para chatear con el equipo y mantenerte al día.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Unirse a $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'Activa las notificaciones para no perderte mensajes y menciones.';

  @override
  String get nagbarEnableNotifications => 'Habilitar notificaciones';

  @override
  String get nagbarBillingPortalFailed =>
      'No se pudo abrir el portal de facturación. Inténtalo de nuevo en un momento.';

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
  String get next => 'Siguiente';

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
      'Prueba la llave de seguridad / llave de acceso en su lugar';

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
  String get registerPendingApproval =>
      'Tu solicitud de cuenta está pendiente de aprobación. Podrás iniciar sesión una vez que un administrador la apruebe.';

  @override
  String get registerClosed =>
      'El registro está cerrado actualmente. Utiliza un enlace de registro proporcionado por un administrador para crear una cuenta.';

  @override
  String get passkeyNoCredentials =>
      'No se encontraron llaves de acceso para esta aplicación. En su lugar, inicia sesión con tu correo y contraseña.';

  @override
  String get passkeyDeviceNotSupported =>
      'Este dispositivo no admite llaves de acceso.';

  @override
  String get passkeyDomainNotAssociated =>
      'Las llaves de acceso no están configuradas para esta aplicación. En su lugar, inicia sesión con tu correo y contraseña.';

  @override
  String get passkeyTimeout =>
      'Se agotó el tiempo de autenticación con llave de acceso. Por favor, inténtalo de nuevo.';

  @override
  String get passkeyNotAvailable =>
      'Las llaves de acceso no están disponibles para esta aplicación. En su lugar, inicia sesión con tu correo y contraseña.';

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
  String get errorServiceUnavailable =>
      'Esta instancia no está disponible temporalmente. Inténtalo de nuevo en un momento.';

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
  String get embedInviteJoinGroup => 'Unirse al grupo';

  @override
  String get embedInviteAlreadyJoined => 'Ya unido';

  @override
  String get embedInviteDisabled => 'Invitaciones desactivadas';

  @override
  String get embedInvitePaused =>
      'Las invitaciones están pausadas para esta comunidad.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName ha detectado un posible ataque masivo, por lo que los nuevos usuarios no pueden unirse en este momento.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Esta comunidad ha pausado las invitaciones. Puedes intentarlo más tarde.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName ha detectado un posible ataque masivo en esta comunidad. Las invitaciones están pausadas, por lo que los nuevos usuarios no pueden unirse en este momento.';
  }

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
  String get invalidDeepLinkTitle => 'No se pudo abrir el enlace';

  @override
  String get invalidDeepLinkDescription =>
      'Es posible que este enlace esté roto, solo esté disponible en la web o no tengas acceso. Comprueba el enlace e inténtalo de nuevo.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Ir a inicio';

  @override
  String get inviteAcceptJoinGroupButton => 'Unirse al grupo';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Fuiste invitado a unirte a un chat privado grupal por $inviterName';
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
  String embedGiftVisionaryLifetime(String productName) {
    return 'Visionario ($productName de por vida)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count días de $productName',
      one: '1 día de $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count semanas de $productName',
      one: '1 semana de $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count meses de $productName',
      one: '1 mes de $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count años de $productName',
      one: '1 año de $productName',
    );
    return '“$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'De $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => '¡Haz clic para reclamar tu regalo!';

  @override
  String get embedGiftAlreadyRedeemed => 'Ya canjeado';

  @override
  String get embedGiftClaimAccountHelp =>
      'Reclama tu cuenta para canjear este regalo.';

  @override
  String get embedGiftClaim => 'Reclamar regalo';

  @override
  String get embedGiftClaimed => 'Regalo reclamado';

  @override
  String get embedGiftClaimAccount => 'Reclamar cuenta para canjear';

  @override
  String get embedGiftUnknownTitle => 'Regalo desconocido';

  @override
  String get embedGiftUnknownSubtitle =>
      'Este código de regalo no es válido o ya ha sido reclamado.';

  @override
  String get embedGiftUnavailable => 'Regalo no disponible';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return '¡Reclama tu regalo para activar tu suscripción a $productName!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'Este regalo ya ha sido reclamado.';

  @override
  String get giftAcceptMaybeLater => 'Tal vez luego';

  @override
  String get giftRedeemedToast => '¡Regalo canjeado!';

  @override
  String get giftRedeemInvalidTitle => 'Código de regalo inválido';

  @override
  String get giftRedeemInvalidMessage =>
      'Este código no es válido o ya ha sido utilizado.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Regalo ya canjeado';

  @override
  String get giftRedeemAlreadyRedeemedMessage =>
      'Este código ya ha sido canjeado.';

  @override
  String get giftRedeemNotFoundTitle => 'Regalo no encontrado';

  @override
  String get giftRedeemNotFoundMessage => 'Este código no existe.';

  @override
  String get giftRedeemFailedTitle => 'Error al canjear el regalo';

  @override
  String get giftRedeemFailedMessage =>
      'No se pudo canjear este regalo. Inténtalo de nuevo.';

  @override
  String get giftVisionaryCannotRedeemTitle =>
      'No se puede canjear este regalo';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Las cuentas Visionary no pueden canjear regalos de Plutonium. Copia el enlace para compartirlo con un amigo en su lugar.';

  @override
  String get giftCopyLink => 'Copiar enlace del regalo';

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
  String get notificationNothing => 'Ninguna';

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
  String get notificationUnmuteChannel => 'Activar notificaciones del canal';

  @override
  String get notificationUseCategoryDefault =>
      'Usar predeterminado de la categoría';

  @override
  String get notificationUseCommunityDefault =>
      'Usar predeterminado de la comunidad';

  @override
  String get notificationNoCategory => 'Sin categoría';

  @override
  String get dmMarkAsRead => 'Marcar como leído';

  @override
  String get dmMuteConversation => 'Silenciar chat privado';

  @override
  String get dmUnmuteConversation => 'Activar notificaciones de chat privado';

  @override
  String get dmPinDm => 'Fijar chat privado';

  @override
  String get dmUnpinDm => 'Desfijar chat privado';

  @override
  String get dmAlwaysShowInSidebar => 'Mostrar siempre en la barra lateral';

  @override
  String get dmRemoveFromAlwaysShown => 'Quitar de mostrar siempre';

  @override
  String get dmCloseDm => 'Cerrar chat privado';

  @override
  String get dmCloseDmConfirmTitle => 'Cerrar chat privado';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return '¿Estás seguro de que quieres cerrar el chat privado con $username? Puedes volver a abrirlo más tarde.';
  }

  @override
  String get dmDeleteMyMessagesTitle =>
      '¿Eliminar tus mensajes en esta conversación?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Esto eliminará permanentemente todos los mensajes que hayas enviado en esta conversación. Esta acción no se puede deshacer.';

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
  String get dmPinGroupDm => 'Fijar chat privado grupal';

  @override
  String get dmUnpinGroupDm => 'Desfijar chat privado grupal';

  @override
  String get dmUnnamedGroup => 'Grupo sin nombre';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'Grupo de $resolvedName';
  }

  @override
  String get dmFavoriteDm => 'Añadir chat privado a favoritos';

  @override
  String get dmUnfavoriteDm => 'Quitar chat privado de favoritos';

  @override
  String get dmFavoriteGroupDm => 'Añadir chat privado grupal a favoritos';

  @override
  String get dmUnfavoriteGroupDm => 'Remover chat privado grupal de favoritos';

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
  String get dmDebugCategory => 'Depurar categoría';

  @override
  String get dmPinned => 'Chat privado fijado';

  @override
  String get dmUnpinned => 'Chat privado desfijado';

  @override
  String get dmMuted => 'Chat privado silenciado';

  @override
  String get dmUnmuted => 'Notificaciones de chat privado activadas';

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
  String get addFriendUsernameHint => 'Usuario#0000';

  @override
  String get addFriendUsernameLabel => 'Nombre de usuario de tu amigo';

  @override
  String get addFriendSendRequest => 'Enviar solicitud';

  @override
  String get addFriendNoUserFound =>
      'No se encontró ningún usuario con ese nombre de usuario.';

  @override
  String get addFriendInvalidUsername =>
      'Ingresa un nombre de usuario valido (Usuario#0000).';

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
  String get addFriendVerifyToSend =>
      'Verifica tu correo electrónico antes de enviar solicitudes de amistad.';

  @override
  String get addFriendFriendsListFull =>
      'Tu lista de amigos está llena, o la de la otra persona. Elimina a alguien e inténtalo de nuevo.';

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
  String emojiInfoDefaultDescription(String productName) {
    return 'Este es un emoji predeterminado en $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'Este emoji es de esta comunidad. Puedes usarlo en todas partes.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'Este es un emoji personalizado de una comunidad.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'Este es un emoji personalizado de una comunidad. Pide una invitación al autor para usar este emoji.';

  @override
  String get emojiInfoFromHeader => 'Este emoji es de';

  @override
  String get emojiInfoDiscoverableCommunity => 'Comunidad pública';

  @override
  String get emojiInfoPrivateCommunity => 'Comunidad privada';

  @override
  String get emojiInfoVerifiedCommunity => 'Comunidad verificada';

  @override
  String get emojiInfoAddToFavorites => 'Añadir a favoritos';

  @override
  String get emojiInfoRemoveFromFavorites => 'Eliminar de favoritos';

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
  String get gifPickerFavoritesEmptyTitle => 'Aún no hay GIF favoritos';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Marca un GIF para verlo aquí.';

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
  String externalLinkWarningLeaving(String productName) {
    return 'Estás a punto de salir de $productName';
  }

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
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => 'Cambiar tu usuario';

  @override
  String get fluxerTagInputLabel => 'Nombre de usuario';

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
  String get fluxerTagAlreadyTaken => 'Nombre de usuario ya en uso';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'El Nombre de usuario $username#$discriminator ya está en uso. Si continúas, se volverá a generar tu discriminador automáticamente.';
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
      'Si guardas este nombre de usuario, tu etiqueta personalizada de 4 dígitos volverá a ser un número aleatorio cuando finalice tu suscripción a Plutonium. Si tu suscripción no se renueva, tendrás un período de gracia de 3 días antes de que cambie la etiqueta.';

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
  String get fluxerTagUpdated => 'Usuario actualizado';

  @override
  String get fluxerTagUpdateFailed =>
      'No se pudo actualizar el Nombre de usuario. Por favor, Inténtalo de nuevo.';

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
      'Reclama tu cuenta para cambiar tu Nombre de usuario';

  @override
  String get changeFluxerTag => 'Cambiar nombre de usuario';

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
  String get aboutMeLabel => 'Sobre mí';

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
  String profilePreviewMemberSince(String productName) {
    return 'Miembro de $productName desde';
  }

  @override
  String get unclaimedAccountTitle => 'Cuenta sin reclamar';

  @override
  String get unclaimedAccountDescription =>
      'Tu cuenta aún no ha sido reclamada. Sin un correo electrónico y una contraseña, podrías perder el acceso. Reclama tu cuenta ahora para protegerla.';

  @override
  String get claimAccount => 'Reclamar cuenta';

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
  String securityLoginEmailSectionDescription(String productName) {
    return 'Gestiona la dirección de correo electrónico que usas para iniciar sesión en $productName';
  }

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
  String get delete => 'Eliminar';

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
      'Reclama tu cuenta para acceder a funciones de seguridad como la autenticación en dos pasos y las llaves de acceso.';

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
  String get phoneAddSuccess => 'Número de teléfono verificado';

  @override
  String get phoneCountryLabel => 'País';

  @override
  String get phoneSearchCountries => 'Buscar países...';

  @override
  String get phoneNumberRequired => 'El número de teléfono es obligatorio';

  @override
  String get phoneEnterValidNumber =>
      'Introduce un número de teléfono móvil válido.';

  @override
  String get phoneCannotBeUsed =>
      'Este número de teléfono no se puede usar. Prueba con otro número de celular o contacta con soporte.';

  @override
  String get phoneAlreadyUsed =>
      'Este número de teléfono ya ha sido utilizado. Prueba con otro número o contacta con soporte.';

  @override
  String get phoneCodeDidNotWork =>
      'Ese código no funcionó. Compruébalo e inténtalo de nuevo.';

  @override
  String get phoneTooManyAttempts =>
      'Demasiados intentos. Espera un poco y vuelve a intentarlo.';

  @override
  String get phoneSmsUnavailable =>
      'La verificación por SMS no está disponible en este momento. Inténtalo más tarde o contacta con soporte.';

  @override
  String get phoneNotEligible =>
      'La verificación por teléfono no está disponible para esta cuenta. Usa otro método o contacta con soporte.';

  @override
  String get phoneCaptchaRequired =>
      'Se requiere una comprobación del navegador antes de la verificación por teléfono. Vuelve a intentarlo desde la página de inicio de sesión o contacta con soporte.';

  @override
  String get phoneSomethingWentWrong => 'Algo salió mal. Inténtalo de nuevo.';

  @override
  String get phoneInboundExpensiveDescription =>
      'Enviar un SMS a este número de teléfono es muy costoso, por lo que necesitamos que tú nos envíes un SMS en su lugar. También puedes contactar con soporte para que retiremos este requisito de tu cuenta.';

  @override
  String get phoneInboundDefaultDescription =>
      'Necesitamos que nos envíes un SMS para verificar tu número de teléfono.';

  @override
  String get phoneInboundStepOpenMessaging =>
      'Abre la aplicación de mensajes de tu teléfono y crea un nuevo mensaje de texto.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'Envía el código $code al $number.';
  }

  @override
  String get phoneInboundStepWait =>
      'Espera a que recibamos tu mensaje. Esto puede tardar un minuto.';

  @override
  String get phoneInboundGetNewCode => 'Obtener nuevo código';

  @override
  String get phoneInboundChallengeCodeLabel => 'Código a enviar';

  @override
  String get phoneInboundOurNumberLabel => 'Enviar a';

  @override
  String get requiredActionTitle => 'Se requiere verificación de cuenta';

  @override
  String requiredActionIntroGeneric(String productName) {
    return 'Completa la verificación requerida para seguir usando $productName.';
  }

  @override
  String get requiredActionIntroPhone =>
      'Tu registro necesita una comprobación anti-spam adicional antes de que puedas continuar.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return 'Verifica tu correo electrónico o teléfono para seguir usando $productName';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return 'Completa los pasos obligatorios de verificación por correo electrónico y teléfono que aparecen a continuación para seguir usando $productName';
  }

  @override
  String get requiredActionChooseMethodTitle =>
      'Elige un método de verificación';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return 'Completa una de las rutas de verificación de abajo para seguir usando $productName.';
  }

  @override
  String get requiredActionUseEmail => 'Usar correo';

  @override
  String get requiredActionUsePhone => 'Usar teléfono';

  @override
  String get requiredActionCheckEmailTitle => 'Revisa tu correo electrónico';

  @override
  String get requiredActionCheckEmailDescription =>
      'Hemos enviado un enlace de verificación a tu dirección de correo electrónico. Ábrelo para continuar.';

  @override
  String get requiredActionResendVerificationEmail =>
      'Reenviar correo de verificación';

  @override
  String get requiredActionVerificationEmailSent =>
      'Correo de verificación enviado. Revisa tu bandeja de entrada.';

  @override
  String get requiredActionSignOut => 'Cerrar sesión';

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
  String get networkErrorMessage =>
      'Algo salió mal. Por favor, inténtalo de nuevo.';

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
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace $count semanas',
      one: 'hace 1 semana',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'en $count minutos',
      one: 'en 1 minuto',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'en $count horas',
      one: 'en 1 hora',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'en $count días',
      one: 'en 1 día',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'en $count semanas',
      one: 'en 1 semana',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'en $count meses',
      one: 'en 1 mes',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'en $count años',
      one: 'en 1 año',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'Hace un momento';

  @override
  String get authorizedAppsTitle => 'Aplicaciones autorizadas';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Estas aplicaciones tienen acceso a tu cuenta de $productName.';
  }

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
  String get blockedUsersCopyTag => 'Copiar Nombre de usuario';

  @override
  String get blockedUsersCopyId => 'Copiar ID de usuario';

  @override
  String get userProfileLoadError => 'No se pudo cargar el perfil';

  @override
  String get userProfileLoading => 'Cargando perfil';

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
  String userProfileStaffBadgeTooltip(String productName) {
    return 'Personal de $productName';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return 'Equipo de Comunidad de $productName';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return 'Socio de $productName';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return 'Cazador de errores de $productName';
  }

  @override
  String userProfilePlutoniumBadgeTooltip(String productName) {
    return 'Plutonium de $productName';
  }

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(
    String productName,
    String date,
  ) {
    return 'Suscriptor de Plutonium de $productName desde $date';
  }

  @override
  String userProfileVisionaryBadgeTooltip(String productName) {
    return 'Visionario de $productName';
  }

  @override
  String userProfileVisionaryBadgeSinceTooltip(
    String productName,
    String date,
  ) {
    return 'Visionario de $productName desde $date';
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
  String get userProfileOpenBlockedDmTitle => 'Abrir chat privado';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Bloqueaste a $username. No podrás enviar mensajes a menos que lo desbloquees.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Desbloquear';

  @override
  String get userProfileOpenDm => 'Abrir chat privado';

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
  String get userProfileRoles => 'Roles';

  @override
  String get memberRoleAdd => 'Añadir rol';

  @override
  String memberRoleRemove(String roleName) {
    return 'Eliminar rol $roleName';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'Este usuario no tiene ningún rol en esta comunidad.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'Aún no hay roles. Añade roles en $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'No hay roles disponibles';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'No hay roles para asignar en esta comunidad en este momento, pero puedes crear uno nuevo en $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Ajustes de la comunidad';

  @override
  String get guildSettingsRolesTab => 'Roles';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Hora local';

  @override
  String get userProfileSameTimeAsYou => 'La misma hora que tú';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return '$duration por delante de ti';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return '$duration por detrás de ti';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours horas',
      one: '1 hora',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minutos',
      one: '1 minuto',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours horas',
      one: '1 hora',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minutos',
      one: '1 minuto',
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
  String get userProfileFailedOpenDm => 'No se pudo abrir el chat privado';

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
  String get iarReportGuildTitle => 'Reportar comunidad';

  @override
  String get iarReportGuildPreconfirmBody =>
      'Si este reporte es sobre un mensaje específico de esta comunidad, reporta ese mensaje en su lugar. Los reportes de mensajes proporcionan al equipo de seguridad el contexto más claro, y añadir detalles en los comentarios puede ayudar a que lo revisemos más rápido. Continúa con el reporte de la comunidad en su conjunto únicamente si reportar un mensaje no reflejaría el problema general.';

  @override
  String get iarContinueToReportCommunity =>
      'Continuar reportando la comunidad';

  @override
  String get iarPreviewCommunitySubtitle => 'Comunidad';

  @override
  String get iarReasonHarassmentGuildLabel => 'Acoso o abuso dirigido';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'La comunidad facilita ataques masivos o acoso dirigido.';

  @override
  String get iarReasonHateGuildDescription =>
      'Promueve el odio contra grupos protegidos.';

  @override
  String get iarReasonTerrorismLabel => 'Terrorismo o extremismo violento';

  @override
  String get iarReasonTerrorismDescription =>
      'Promueve, recluta para, o coordina actividad violenta extremista.';

  @override
  String get iarReasonMatureContentGuildLabel =>
      'Contenido para adultos o acceso inseguro';

  @override
  String get iarReasonMatureContentGuildDescription =>
      'Contenido para adultos sin restricción apropiada.';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      'Pone en peligro a menores o aloja contenido de explotación infantil.';

  @override
  String get iarReasonRaidLabel => 'Coordinación de raideos';

  @override
  String get iarReasonRaidDescription =>
      'Coordina ataques masivos, campañas de asedio o acoso contra personas o comunidades.';

  @override
  String get iarReasonSpamGuildDescription =>
      'La comunidad existe para hacer spam, estafar o abusar de la plataforma.';

  @override
  String get iarReasonMalwareGuildLabel => 'Distribución de malware';

  @override
  String get iarReasonMalwareGuildDescription =>
      'Distribuye malware, robo de credenciales o archivos dañinos.';

  @override
  String get iarReasonPrivacyGuildLabel =>
      'Violación de la privacidad o doxxing';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'Comparte información personal, acosa a usuarios o coordina abusos de privacidad.';

  @override
  String get iarReasonSelfHarmGuildLabel => 'Fomenta la autolesión';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'Fomenta el suicidio, las autolesiones o los trastornos alimentarios.';

  @override
  String get iarReasonInappropriateProfile => 'Perfil inapropiado';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'El perfil de este usuario contiene contenido inapropiado';

  @override
  String typingIndicatorOne(String name) {
    return '$name está escribiendo ...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 y $name2 están escribiendo...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 y $name3 están escribiendo...';
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
  String get slowmodeStatusEnabled => 'El modo lento está activado';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Modo lento activo ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'El modo lento está configurado en $durationLabel, pero eres inmune.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'El modo lento está configurado en $durationLabel. Espera antes de enviar otro mensaje.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'El modo lento está configurado en $durationLabel para este canal.';
  }

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
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName supera el límite de tamaño ($fileSize)';
  }

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
  String get voiceMessageSeekForward => 'Avanzar';

  @override
  String get voiceMessageSeekBackward => 'Retroceder';

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
  String get chatAttachmentDownloadedToast => 'Guardado en fotos';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'No se pudo descargar el archivo adjunto';

  @override
  String get chatAttachmentExpiredTooltip => 'El archivo adjunto ha caducado';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Expandir ($count líneas)',
      one: 'Expandir ($count línea)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Reducir ($count líneas)',
      one: 'Reducir ($count línea)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Expandir ($count filas)',
      one: 'Expandir ($count fila)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Reducir ($count filas)',
      one: 'Reducir ($count fila)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... (quedan $count líneas)',
      one: '... (queda $count línea)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... (quedan $count filas)',
      one: '... (queda $count fila)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'Ver archivo completo';

  @override
  String get chatTextualPreviewChangeLanguage => 'Cambiar idioma';

  @override
  String get chatTextualPreviewSearchLanguage => 'Buscar idioma…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Resaltado de sintaxis';

  @override
  String get chatTextualPreviewNoLanguagesFound =>
      'No se han encontrado resultados';

  @override
  String get chatTextualPreviewMoreOptions => 'Más opciones';

  @override
  String get chatTextualPreviewWrapText => 'Ajustar texto';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'El archivo es demasiado grande para la vista previa integrada (límite de $previewLimitKb KB).';
  }

  @override
  String get chatTextualPreviewLoadError =>
      'No se pudo cargar la vista previa.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Texto plano';

  @override
  String get chatTextualPreviewCopy => 'Copiar';

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
  String connectionsDescription(String productName) {
    return 'Vincula cuentas y dominios externos a tu perfil de $productName. Las conexiones verificadas se mostrarán en tu perfil para que otros las vean.';
  }

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
  String get connectionBack => 'Volver';

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
  String get lookAndFeelTitle => 'Diseño e interfaz';

  @override
  String get lookAndFeelThemeSectionTitle => 'Tema';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Escoge el aspecto oscuro, carbón o claro.';

  @override
  String get lookAndFeelHdrSectionTitle => 'Rango dinámico alto';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Controla cómo se muestran las imágenes HDR en monitores compatibles con HDR.';

  @override
  String get lookAndFeelHdrFullName => 'Rango dinámico completo';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Mostrar las imágenes HDR con el máximo brillo y gama de colores.';

  @override
  String get lookAndFeelHdrStandardName => 'Rango estándar';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Aplicar mapeo de tonos a las imágenes HDR para ajustarlas al rango estándar, reduciendo el brillo máximo.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'Modo de pantalla de rango dinámico alto';

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
  String get lookAndFeelChatFontSizeLabel => 'Tamaño de fuente del chat';

  @override
  String get lookAndFeelAppZoomTitle => 'Nivel de zoom de la aplicación';

  @override
  String get lookAndFeelAppZoomDescription =>
      'Ajusta el nivel de zoom de la aplicación.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'Fondo de chat';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'Elige un fondo para el chat. Esto se queda en este dispositivo.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'Esta configuración se queda en este dispositivo';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'El fondo de chat se guarda solo en este dispositivo y no se sincroniza con otros.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'Predeterminado';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'Imagen personalizada';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Color $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Degradado $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'Atenuar fondo de pantalla';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'No se pudo establecer esa imagen como tu fondo de pantalla.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Mensajes';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Elige cómo se muestran los mensajes en canales de chat.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Espacio entre grupos de mensajes';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel =>
      'Modo de visualización de mensajes';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Cómodo';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Diseño espacioso con una clara separación visual entre los mensajes.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Denso';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Maximiza los mensajes visibles con un espaciado mínimo.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'Ocultar avatares de usuario';

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
  String get communityTemporarilyUnavailable =>
      'Comunidad temporalmente no disponible';

  @override
  String get guildUnavailableDescription =>
      'Algo salió mal. Estamos trabajando en ello.';

  @override
  String get guildNotFoundTitle => 'Esta no es la comunidad que buscas.';

  @override
  String get guildNotFoundDescription =>
      'Es posible que la comunidad que buscas haya sido eliminada o que no tengas acceso a ella.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return 'Actualmente, $communityName solo es accesible para los miembros del personal de $productName';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => 'temporalmente no disponible';

  @override
  String get lookAndFeelCollapseDMsLabel => 'Colapsar DMs en carpeta';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'Cuando está activado, los MD no leídos en la barra lateral del servidor se agrupan en una carpeta en el botón de $productName. Haz clic en el botón de $productName mientras estás en la página de MD para expandir o contraer la carpeta.';
  }

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
  String get favoritesUnmute => 'Activar notificaciones de favoritos';

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
  String get favoritesAddToSavedMedia =>
      'Añadir a contenido multimedia guardado';

  @override
  String get favoritesRemoveFromSavedMedia =>
      'Quitar de contenido multimedia guardado';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Añadir a favoritos de GIF solo por URL';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Quitar de favoritos de GIF solo por URL';

  @override
  String get savedMediaAddTitle => 'Añadir a contenido multimedia guardado';

  @override
  String get savedMediaFormNameLabel => 'Nombre';

  @override
  String get savedMediaFormNameHint => 'Mis increíbles archivos multimedia';

  @override
  String get savedMediaFormAltTextLabel => 'Texto alternativo';

  @override
  String get savedMediaFormAltTextHint => 'Describir el contenido multimedia';

  @override
  String get savedMediaFormTagsLabel => 'Etiquetas';

  @override
  String get savedMediaFormTagsHint => 'divertido, reacción, trabajo';

  @override
  String get savedMediaSaveError =>
      'No se pudo actualizar el contenido multimedia guardado.';

  @override
  String get savedMediaNameRequired => 'El nombre es obligatorio.';

  @override
  String get gifFavoriteFirstTimeTitle =>
      '¿Cómo deberíamos guardar tus GIF favoritos?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'Puedes guardar los GIF destacados como favoritos solo por URL o subirlos a tu contenido multimedia guardado. Elige la opción que mejor se adapte a tu forma de usarlos. Puedes cambiarla en cualquier momento en Ajustes > Avanzado > Multimedia.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'Favoritos solo con URL (predeterminado): se sincronizan en tus dispositivos, sin carga, no cuentan para el almacenamiento de medios. El medio original puede desaparecer si su host lo elimina.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Medios guardados: subidos, etiquetables, buscables y persistentes, pero cuentan para tu límite de medios guardados.';

  @override
  String get gifFavoriteFirstTimeHint => 'Solo te preguntaremos una vez.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly => 'Usar solo URL (recomendado)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => 'Usar medios guardados';

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
  String get messagesMediaInputGroupTitle => 'Escritura';

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
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'Cuando se suben directamente a $productName';
  }

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
  String get messagesMediaCameraUploadsSectionTitle => 'Cargas de la cámara';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Elige si las fotos y videos tomados con la cámara de la app se guardan en tu dispositivo';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel =>
      'Guardar en el dispositivo';

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
  String get accessibilitySaturationTitle => 'Saturación';

  @override
  String get accessibilitySaturationDescription =>
      'Ajusta la viveza de los colores del tema en toda la app.';

  @override
  String get accessibilityVisualGroupTitle => 'Visual';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'Subrayar siempre los enlaces';

  @override
  String get accessibilityDimStrikethroughTextLabel => 'Atenuar texto tachado';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'Vistas previas de mensajes de chats privados';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Controla cuándo se muestran las vistas previas de mensajes en la lista de MD.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Modo de vista previa de mensajes de chats privados';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Todos los mensajes';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Muestra vistas previas de mensajes para todas las conversaciones de MD';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Solo chats privados no leídos';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Mostrar solo vistas previas de mensajes en chats privados con mensajes no leídos';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Ninguno';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'No mostrar vistas previas de mensajes en la lista de chats privados';

  @override
  String get accessibilityScreenReaderGroupTitle => 'Lector de pantalla';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Controla cómo $productName funciona con lectores de pantalla.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Anunciar mensajes nuevos';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Permitir que los lectores de pantalla anuncien los mensajes nuevos a medida que llegan al canal abierto. Los sonidos de notificación no se verán afectados.';

  @override
  String get accessibilityTtsGroupTitle => 'Texto a voz';

  @override
  String get accessibilityTtsGroupDescription =>
      'Elige una velocidad para el texto hablado.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Velocidad de reproducción de voz';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Reproducir muestra';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Silenciar muestra';

  @override
  String get accessibilityPreviewButtonLabel => 'Botón de vista previa';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'Así se muestran los enlaces: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Vista previa de usuario';

  @override
  String get accessibilityKeyboardGroupTitle => 'Teclado';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Mostrar anillo de enfoque en el cuadro de texto del chat';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'La tecla Escape sale del modo teclado';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Mostrar atajos del menú contextual';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Confirmar antes de iniciar llamadas';

  @override
  String get accessibilityAnimationGroupTitle => 'Animación';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'La opción de movimiento reducido está activada, por lo que las animaciones de contenido están en pausa de forma predeterminada. Aún puedes volver a activarlas para que sigan reproduciéndose.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel =>
      'Reproducir emojis animados';

  @override
  String get accessibilityAutoPlayGifsMobileLabel =>
      'Reproducir GIF automáticamente';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'Reproducir GIF automáticamente cuando $productName esté en foco';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Reproduciendo a pesar del movimiento reducido.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Pausado por movimiento reducido. Actívalo para que los emojis animados sigan reproduciéndose.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Pausado por movimiento reducido. Actívalo para que los GIF sigan reproduciéndose.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'Viene desactivado por defecto en celulares para ahorrar batería y datos.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Animaciones de stickers';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Preferencia de animación de stickers';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Animar siempre';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Los stickers siempre se animarán';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Animar al interactuar';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Los stickers se animarán cuando los toques';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Los stickers se animarán cuando pases el cursor sobre ellos o interactúes con ellos';

  @override
  String get accessibilityStickerNeverAnimateName => 'No animar nunca';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Los stickers nunca se animarán';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Siempre animado a pesar del movimiento reducido.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'La opción de movimiento reducido limita las animaciones de los stickers a la interacción. Elige \"animar siempre\" para anular esta opción.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'Por defecto, las animaciones se activan al interactuar en dispositivos móviles para preservar la batería.';

  @override
  String get accessibilityMotionGroupTitle => 'Movimiento';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Sincronizar el ajuste de movimiento reducido con el sistema';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Usa la preferencia de movimiento reducido del sistema de este dispositivo o personalízala a continuación.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Reducir movimiento';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Desactivar animaciones y transiciones. Actualmente controlado por la configuración de tu sistema.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Desactivar animaciones y transiciones en toda la app.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Los emojis, GIF y stickers animados permanecen bajo tu control en la pestaña Animación.';

  @override
  String get accessibilityConfirmStartCallTitle => '¿Iniciar llamada?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      '¿Seguro que quieres iniciar esta llamada?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Iniciar llamada';

  @override
  String get accessibilityTtsSampleDescription =>
      'Escucha la línea de ejemplo pronunciada con la velocidad que elegiste.';

  @override
  String get accessibilityTtsSampleText =>
      'Doc, soy del futuro. Vine en una máquina del tiempo que tú inventaste. Ahora, necesito tu ayuda para volver a 1985.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'La síntesis de voz no está disponible en este dispositivo.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Falló la reproducción de voz. Intenta de nuevo o verifica que la salida de audio funcione.';

  @override
  String get ttsSubstitutionUnknownUser => 'usuario desconocido';

  @override
  String get ttsSubstitutionUnknownRole => 'rol desconocido';

  @override
  String get ttsSubstitutionUnknownChannel => 'canal desconocido';

  @override
  String get ttsSubstitutionCodeBlock => 'bloque de código';

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
    return '$authorName dijo: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'Respondiendo a $replyAuthorName, $authorName dijo: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'envió un sticker';

  @override
  String get ttsSentAttachment => 'envió un archivo adjunto';

  @override
  String ttsSentAttachments(int count) {
    return 'enviados $count archivos adjuntos';
  }

  @override
  String get ttsSentEmbed => 'envió un elemento incrustado';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author envió $summary';
  }

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
  String get systemCallJoinTheCall => 'Unirse a la llamada';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username inició una llamada que duró $duration.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'Te perdiste una llamada de $username que duró $duration.';
  }

  @override
  String systemCallMissed(String username) {
    return 'Te perdiste una llamada de $username.';
  }

  @override
  String get systemCallDurationFewSeconds => 'hace unos segundos';

  @override
  String get systemCallDurationMinute => 'un minuto';

  @override
  String get systemCallDurationOneYear => '1 año';

  @override
  String get systemCallDurationOneMonth => '1 mes';

  @override
  String get systemCallDurationOneWeek => '1 semana';

  @override
  String get systemCallDurationOneDay => '1 día';

  @override
  String get systemCallDurationOneHour => '1 hora';

  @override
  String systemCallDurationYears(int count) {
    return '$count años';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count meses';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count semanas';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count días';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count horas';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count minutos';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Actualiza $productName para ver este mensaje.';
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
  String get voiceJoinFailedTitle => 'No se pudo unir a la llamada de voz';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'No se pudieron desconectar tus otros dispositivos. Intenta de nuevo en un momento.';

  @override
  String get voiceChannelEmptyDescription =>
      'Este es un canal de voz. ¡Conéctate para empezar a hablar!';

  @override
  String get voiceChannelJoin => 'Unirse al canal de voz';

  @override
  String get voiceCallJoin => 'Unirse a la llamada';

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
  String get voiceControlFlipCamera => 'Girar cámara';

  @override
  String get voiceControlScreenShare => 'Compartir pantalla';

  @override
  String get voiceScreenShareNotificationText => 'Compartiendo tu pantalla.';

  @override
  String get voiceControlMore => 'Más';

  @override
  String get voiceControlDisconnect => 'Desconectar';

  @override
  String get voiceInChat => 'En el chat de voz';

  @override
  String get voiceConnectionFailed => 'Error de conexión';

  @override
  String get voiceConnectionRetry => 'Intentar de nuevo';

  @override
  String get voiceConnectionDismiss => 'Descartar';

  @override
  String get voiceConnectionDisconnected => 'Desconectado';

  @override
  String voicePingMs(int currentLatency) {
    return 'Latencia: $currentLatency ms';
  }

  @override
  String get voiceMeasuringLatency => 'Midiendo latencia...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Ir a $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'Conexión de voz';

  @override
  String get voiceConnectionAdvancedStats => 'Avanzado';

  @override
  String get voiceShowCallAvatars => 'Mostrar avatares de la llamada';

  @override
  String get voiceShowConnectionId => 'Mostrar ID de conexión';

  @override
  String get voiceAudioProcessing => 'Procesamiento de audio';

  @override
  String get voiceConnectionSessionSection => 'Sesión';

  @override
  String get voiceConnectionDurationLabel => 'Duración';

  @override
  String get voiceConnectionParticipantsLabel => 'Participantes';

  @override
  String get voiceConnectionNetworkSection => 'Red';

  @override
  String get voiceConnectionPingLabel => 'Ping';

  @override
  String get voiceConnectionJitterLabel => 'Fluctuación';

  @override
  String get voiceConnectionSendLabel => 'Enviar';

  @override
  String get voiceConnectionReceiveLabel => 'Recibir';

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
  String get userAreaMuteMicrophone => 'Silenciar micrófono';

  @override
  String get userAreaUnmuteMicrophone => 'Activar micrófono';

  @override
  String get userAreaUserSettings => 'Ajustes de usuario';

  @override
  String get voiceParticipantMenuViewProfile => 'Ver perfil';

  @override
  String get voiceParticipantMenuFocus => 'Enfocar a esta persona';

  @override
  String get voiceParticipantMenuUnfocus => 'Desenfocado';

  @override
  String get voiceParticipantMenuCommunityMute => 'Silenciar';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Ensordecer';

  @override
  String get voiceParticipantMenuUserVolume => 'Volumen de usuario';

  @override
  String get voiceParticipantMenuStreamVolume => 'Volumen de transmisión';

  @override
  String get voiceParticipantMenuStopStreaming => 'Dejar de transmitir';

  @override
  String get voiceParticipantModerationFailed =>
      'No se pudo actualizar a ese miembro. Inténtalo de nuevo.';

  @override
  String get voiceControlChat => 'Chat';

  @override
  String get voiceCallViewModeLabel => 'Ver';

  @override
  String get voiceCallViewModeGrid => 'Cuadrícula';

  @override
  String get voiceCallViewModeFocus => 'Enfoque';

  @override
  String get voicePanelSettingsSectionTitle => 'Ajustes de voz';

  @override
  String get voicePanelUseEarpieceLabel => 'Usar auricular';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Mostrar solo videos';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Mostrar solo a los participantes que tengan la cámara encendida.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Mostrar mi cámara';

  @override
  String get voicePrioritizeSpeakersLabel => 'Priorizar voz activa';

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
  String get privacyDashboardProfilePrivacySection => 'Privacidad del perfil';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Amigos y mensajes directos';

  @override
  String get privacyDashboardActivitySharingSection => 'Compartir actividad';

  @override
  String get privacyDashboardSensitiveContentSection => 'Contenido sensible';

  @override
  String get privacyDashboardDataExportSection => 'Exportar datos';

  @override
  String get privacyDashboardDataDeletionSection => 'Eliminación de datos';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Quién puede ver tu perfil completo';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Amigos y todas las comunidades';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Tu perfil completo es visible para tus amigos y para cualquiera en tus comunidades';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Solo amigos y comunidades pequeñas';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Tu perfil completo es visible para tus amigos y miembros de tus comunidades con 200 miembros o menos';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Solo amigos';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Tu perfil completo solo es visible para tus amigos';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Solicitudes de amistad';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Todos';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Permitir que cualquiera te envíe solicitudes de amistad';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Amigos de amigos';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Permitir que los amigos de tus amigos te envíen solicitudes';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Miembros de la comunidad';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Permite que los miembros de las comunidades a las que perteneces te envíen solicitudes';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Mensajes directos';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Permitir mensajes directos de miembros de la comunidad';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Permite que los miembros de las comunidades a las que perteneces te envíen mensajes directos';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Permitir mensajes directos de bots de la comunidad';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Permitir que los bots de las comunidades en las que participas te envíen mensajes directos';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Controla quién puede enviarte solicitudes de amistad y mensajes directos';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Controla quién puede llamarte y agregarte a chats grupales';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Llamadas entrantes';

  @override
  String get privacyDashboardIncomingCallsDesc =>
      'Controla quién puede llamarte';

  @override
  String get privacyDashboardAllowedCallers => 'Llamadas permitidas';

  @override
  String get privacyDashboardIncomingCallNobody => 'Nadie';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Bloquear todas las llamadas entrantes';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Solo amigos';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Permitir solo a tus amigos llamarte (recomendado)';

  @override
  String get privacyDashboardIncomingCallCustom => 'Amigos + Personalizado';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Permitir a amigos más grupos adicionales que elijas';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Todos';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Permitir que cualquiera te llame, incluso desconocidos';

  @override
  String get privacyDashboardAdditionalGroups => 'Grupos adicionales';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'Las personas que son amigas de tus amigos pueden llamarte';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'Las personas de comunidades que ambos comparten pueden llamarte';

  @override
  String get privacyDashboardRingBehavior => 'Comportamiento del anillo';

  @override
  String get privacyDashboardSilentCalls => 'Silenciar llamadas de todos';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'Todas las llamadas notificarán en silencio en lugar de sonar. De forma predeterminada, las llamadas de personas que no son tus amigos siempre son silenciosas.';

  @override
  String get privacyDashboardGroupDmTitle =>
      '¿Quién puede agregarte a chats grupales?';

  @override
  String get privacyDashboardGroupDmDesc =>
      'Controla quién puede agregarte a chats grupales sin preguntar. Cualquiera aún puede enviarte enlaces de invitación para unirte.';

  @override
  String get privacyDashboardAllowedInvites => 'Invitaciones permitidas';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Que nadie te agregue a chats grupales sin preguntar';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Permite que solo tus amigos te agreguen sin pedirte permiso (recomendado)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Permitir que amigos y grupos adicionales te agreguen';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Permitir que cualquiera te agregue a chats grupales sin preguntar';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'Las personas que son amigas de tus amigos pueden agregarte a chats grupales';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'Las personas de comunidades en las que ambos estén pueden agregarte a chats grupales';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Actividad de voz en \"Activo ahora\"';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Compartir tu actividad de voz con amigos';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      '¿Compartir actividad de voz con todos los amigos?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      '¿Dejar de compartir la actividad de voz con todos los amigos?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Estás a punto de empezar a compartir tu actividad de voz con todos tus amigos, incluidos los futuros. Esto les enviará una actualización a todos y solo se podrá cambiar de nuevo en 24 horas.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Estás a punto de dejar de compartir tu actividad de voz con todos tus amigos, incluidos los futuros. Esto les enviará una actualización a todos y solo podrás cambiarlo de nuevo en 24 horas.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Sí, compartir con todos mis amigos';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm =>
      'Sí, dejar de compartir';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Disponible de nuevo en $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Se actualizó el uso compartido de la actividad de voz';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'No se pudo actualizar la opción de compartir actividad de voz en este momento';

  @override
  String get privacyDashboardDataExportDesc =>
      'Crea un archivo descargable de los datos de tu cuenta, incluidos los mensajes y las URL de los archivos adjuntos. La mayoría de la gente quiere todo, pero puedes limitar el alcance a continuación.';

  @override
  String get privacyDashboardExportMyData => 'Exportar mis datos';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Elimina permanentemente los mensajes que enviaste en MD, MD grupales y comunidades. El proceso se ejecuta en segundo plano y recibirás un mensaje directo cuando termine.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Eliminar mis mensajes';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      '¿Permitir mensajes directos de miembros de la comunidad?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      '¿Bloquear mensajes directos de miembros de la comunidad?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      '¿Permitir que los bots te envíen mensajes directos?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      '¿Bloquear bots para que no te envíen mensajes directos?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      '¿También quieres permitir mensajes directos de miembros de tus comunidades existentes?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      '¿También quieres bloquear los mensajes directos de los miembros de tus comunidades existentes?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      '¿Quieres permitir también que los bots de tus comunidades existentes te envíen mensajes directos?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      '¿También quieres bloquear bots de tus comunidades existentes?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'También puedes cambiar esta configuración por comunidad si mantienes presionado el nombre de la comunidad y seleccionas Configuración de privacidad.';

  @override
  String get privacyDashboardDmConfirmAllowAll =>
      'Permitir en todas las comunidades';

  @override
  String get privacyDashboardDmConfirmBlockAll =>
      'Bloquear en todas las comunidades';

  @override
  String get privacyDashboardDmConfirmSkip => 'Omitir este paso';

  @override
  String get privacyDashboardDataRequestGoBack => 'Volver';

  @override
  String get privacyDashboardDataRequestExportTitle => 'Exportar mis datos';

  @override
  String get privacyDashboardDataRequestDeleteTitle => 'Eliminar mis mensajes';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'Lo procesaremos lo antes posible. Recibirás un correo electrónico cuando tu archivo esté listo.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'Lo procesaremos lo antes posible. Te enviaremos un mensaje directo cuando esté listo.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'Qué incluir';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Todo';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Exporta todos los mensajes que hayas enviado, además de la configuración de tu cuenta, membresías y metadatos.';

  @override
  String get privacyDashboardDataRequestExportCustom =>
      'Selección personalizada';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Elige qué tipos de conversación, comunidades y período de tiempo incluir en el archivo.';

  @override
  String get privacyDashboardDataRequestDeleteSelected => 'Elige qué incluir';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Elige qué tipos de conversaciones quieres limpiar.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Solo lugares a los que ya no puedo acceder';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Solo eliminar mensajes de comunidades y MD grupales de los que te hayas ido o te hayan eliminado.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Que conversaciones';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Elige los tipos de conversaciones que quieres incluir.';

  @override
  String get privacyDashboardDataRequestKindDms => 'Chats privados abiertos';

  @override
  String get privacyDashboardDataRequestKindDmsClosed =>
      'Chats privados cerrados';

  @override
  String get privacyDashboardDataRequestKindGroupDms =>
      'Chats privados grupales';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Comunidades';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Que comunidades';

  @override
  String get privacyDashboardDataRequestGuildFilterMode =>
      'Filtro de comunidad';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Incluir todos excepto los seleccionados';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude =>
      'Solo los seleccionados';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'No estás en ninguna comunidad en este momento.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Rango de tiempo';

  @override
  String get privacyDashboardDataRequestDateMode => 'Rango de tiempo';

  @override
  String get privacyDashboardDataRequestAllTime => 'Todo el tiempo';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Rango personalizado';

  @override
  String get privacyDashboardDataRequestStartDate => 'Fecha de inicio';

  @override
  String get privacyDashboardDataRequestEndDate => 'Fecha de finalización';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Deja cualquiera de los campos en blanco para que ese extremo del período no tenga límite.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Elige al menos un tipo de conversación para incluir.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'La fecha de inicio debe ser anterior a la fecha de finalización.';

  @override
  String get privacyDashboardDataRequestConfirmTitle => 'Revisar y confirmar';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'Crearemos un archivo descargable de todos los mensajes que hayas enviado y te enviaremos un correo electrónico cuando esté listo. El enlace de descarga de ese correo electrónico caduca después de 7 días.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'Crearemos un archivo descargable que coincida con los filtros a continuación y te enviaremos un correo electrónico cuando esté listo. El enlace de descarga de ese correo electrónico caduca después de 7 días.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Eliminar permanentemente los mensajes que coincidan con los filtros a continuación. Esto no se puede deshacer.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'No hay recuperación una vez que esto comienza. Te enviaremos un mensaje directo cuando termine.';

  @override
  String get privacyDashboardDataRequestRequestExport =>
      'Solicitar exportación';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Eliminar mensajes';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Alcance';

  @override
  String get privacyDashboardDataRequestSummaryConversations =>
      'Conversaciones';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Comunidades';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Rango de tiempo';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'Ninguno';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'De $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'Hasta $end';
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
      other: '# comunidades',
      one: '# comunidad',
    );
    return 'Todas excepto $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# comunidades',
      one: '# comunidad',
    );
    return 'Solo $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Mensajes directos abiertos';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Mensajes directos cerrados';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Mensajes directos (abiertos y cerrados)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms =>
      'Chats privados grupales';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Comunidades';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# horas',
      one: '# hora',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minutos',
      one: '# minuto',
    );
    return '$_temp0 y $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# horas',
      one: '# hora',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minutos',
      one: '# minuto',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# segundos',
      one: '# segundo',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed =>
      'No se pudieron cargar la configuración de privacidad';

  @override
  String get privacyDashboardRetry => 'Reintentar';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'No se pudieron guardar la configuración de contenido sensible.';

  @override
  String get privacyDashboardDataRequestFailed =>
      'No se pudo completar la solicitud.';

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
  String get forwardSearchHint => 'Buscar canales o chats privados';

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
  String get forwardSendSlowmodeBlocked =>
      'Esperando que el modo lento en uno o más canales seleccionados expire.';

  @override
  String get slowmodeRateLimitedTitle => 'Modo lento activo';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'Modo lento activado: espera $duration antes de enviar otro mensaje.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'La carga directa está desactivada durante el modo lento.';

  @override
  String get shareMediaTitle => 'Compartir en';

  @override
  String get shareMediaMessageHint => 'Añade un mensaje opcional…';

  @override
  String get shareMediaSendButton => 'Enviar';

  @override
  String get shareMediaSuccessToast => 'Multimedia compartida';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'Compartido en $count destinos';
  }

  @override
  String get shareMediaFailedToast =>
      'No se pudo compartir el contenido multimedia';

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
  String get chatMessageCopyEmbedText => 'Copiar texto incrustado';

  @override
  String get chatMessageTranslate => 'Traducir';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Traducido de $language';
  }

  @override
  String get chatMessageSeeOriginal => 'Ver original';

  @override
  String get chatMessageSeeTranslation => 'Ver traducción';

  @override
  String get chatMessageTranslating => 'Traduciendo…';

  @override
  String get chatMessageTranslateFailed => 'No se pudo traducir este mensaje.';

  @override
  String get chatMessageTranslateUnavailable =>
      'La traducción no está disponible en este dispositivo.';

  @override
  String get chatMessageSpeak => 'Leer mensaje en voz alta';

  @override
  String get chatMessageStopSpeaking => 'Dejar de hablar';

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
  String get chatMessageOpenLink => 'Abrir enlace';

  @override
  String get chatMessageCopyLink => 'Copiar enlace';

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
  String get chatReactionAddFailed => 'No se pudo agregar la reacción';

  @override
  String get chatReactionRemoveFailed => 'No se pudo quitar la reacción';

  @override
  String get chatMessageReport => 'Reportar mensaje';

  @override
  String get iarReportMessageTitle => 'Reportar mensaje';

  @override
  String get iarThisUserFallback => 'este usuario';

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
  String iarReasonOtherDescription(String productName) {
    return 'Úsalo solo si rompe claramente las reglas de $productName y no encaja en las opciones anteriores.';
  }

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
  String get iarActionCloseDmTitle => 'Cerrar este chat privado';

  @override
  String get iarActionCloseDmDescription =>
      'No bloquea. Puedes reabrirlo más tarde.';

  @override
  String get iarActionCloseDmButton => 'Cerrar chat privado';

  @override
  String get iarActionLeaveCommunityTitle => 'Abandonar la comunidad';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Dejar de ver su contenido y miembros.';

  @override
  String get iarActionLeaveCommunityButton => 'Abandonar';

  @override
  String get iarActionDmSettingsTitle =>
      'Ajustes de chats privados y solicitudes de amistad';

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
  String get iarActionBanUserButton => 'Banear';

  @override
  String get iarActionBanUserBannedButton => 'Expulsado';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Este usuario ya ha sido expulsado de la comunidad.';

  @override
  String get iarCloseDmConfirmTitle => 'Cerrar chat privado';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Cierra tu DM actual con $name. Esto no los bloquea; puedes reabrirlo más tarde.';
  }

  @override
  String get iarSuccessTitle => 'Reporte enviado';

  @override
  String get iarSuccessBody =>
      'Nuestro equipo de seguridad lo está revisando. Te enviaremos un chat privado y un correo electrónico una vez que hayamos llegado a un veredicto.';

  @override
  String get iarAlreadyReportedTitle => 'Ya reportado';

  @override
  String get iarAlreadyReportedBody =>
      'Ya has reportado este mensaje. Nuestro equipo de seguridad lo está revisando.';

  @override
  String get iarBackButton => 'Volver';

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
  String get iarCloseDmSuccessToast => 'Chat privado cerrado.';

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
  String get chatMessageDeleteAttachment => 'Eliminar archivo adjunto';

  @override
  String get chatMessageEditAttachmentAltText => 'Editar texto alternativo';

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
      'El mensaje contiene archivos multimedia adjuntos';

  @override
  String chatBlockedMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mensajes bloqueados',
      one: '1 mensaje bloqueado',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mensajes de posible spammer',
      one: '1 mensaje de posible spammer',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Respuesta oculta porque el autor original está bloqueado.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Respuesta oculta porque el autor original está marcado como spam.';

  @override
  String get devMarkAsSpamLocally => 'Marcar como spam localmente';

  @override
  String get devIgnoreSpamFlag => 'Ignorar reporte de spam';

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
  String get mediaViewerOptions => 'Opciones de multimedia';

  @override
  String get mediaViewerCopyLink => 'Copiar enlace';

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
  String mediaViewerAttachmentThumbnail(int index) {
    return 'Archivo adjunto $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Descartar';

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
  String get composerAutocompleteSuggestions => 'Sugerencias';

  @override
  String get composerAutocompleteCommandsHeading => 'Comandos';

  @override
  String get composerAutocompleteChoicesHeading => 'Opciones';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'Argumentos opcionales';

  @override
  String get composerAutocompleteChannelsHeading => 'Canales';

  @override
  String get composerAutocompleteMembersHeading => 'Miembros';

  @override
  String get composerAutocompleteUsersHeading => 'Usuarios';

  @override
  String get composerAutocompleteMentionsHeading => 'Menciones';

  @override
  String get composerAutocompleteRolesHeading => 'Roles';

  @override
  String get composerAutocompleteMediaHeading => 'Archivos multimedia';

  @override
  String get composerAutocompleteStickersHeading => 'Stickers';

  @override
  String get composerAutocompleteGifsHeading => 'GIFs';

  @override
  String get composerAutocompleteNoGifs => 'No se encontraron GIFs';

  @override
  String get composerCommandShrugDescription =>
      'Agrega ¯\\_(ツ)_/¯ a tu mensaje.';

  @override
  String get composerCommandTableflipDescription =>
      'Agrega (╯°□°)╯︵ ┻━┻ a tu mensaje.';

  @override
  String get composerCommandUnflipDescription =>
      'Agrega ┬─┬ ノ( ゜-゜ノ) a tu mensaje.';

  @override
  String get composerCommandMeDescription =>
      'Enviar un mensaje de acción (se envuelve en cursiva).';

  @override
  String get composerCommandSpoilerDescription =>
      'Enviar un mensaje con spoiler (lo envuelve en etiquetas de spoiler).';

  @override
  String get composerCommandTtsDescription =>
      'Enviar un mensaje de texto a voz.';

  @override
  String get composerCommandNickDescription =>
      'Cambia tu apodo en esta comunidad.';

  @override
  String get composerCommandKickDescription =>
      'Expulsar a un miembro de esta comunidad.';

  @override
  String get composerCommandBanDescription =>
      'Expulsar a un miembro de esta comunidad.';

  @override
  String get composerCommandMsgDescription =>
      'Enviar un mensaje directo a un usuario.';

  @override
  String get composerCommandSavedDescription =>
      'Enviar un elemento multimedia guardado.';

  @override
  String get composerCommandStickerDescription => 'Enviar un sticker.';

  @override
  String get composerCommandGifDescription => 'Busca y envía un GIF.';

  @override
  String get composerCommandMemberOption => 'El miembro al que apuntar.';

  @override
  String get composerCommandReasonOption => 'Razón (opcional).';

  @override
  String get composerCommandMessageOption => 'El mensaje para enviar.';

  @override
  String get composerCommandQueryOption => 'Qué buscar.';

  @override
  String get composerCommandNicknameOption =>
      'Tu nuevo apodo, o déjalo en blanco para restablecerlo.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'Cuánto del historial de mensajes recientes del miembro se eliminará.';

  @override
  String get composerCommandDeleteMessagesNone => 'No eliminar ninguna';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Los últimos $count días';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'Últimas 24 horas';

  @override
  String get composerCommandOptionRequired =>
      'Esta opción es obligatoria. Por favor, proporciona un valor.';

  @override
  String get composerCommandClear => 'Borrar comando';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'Cambiaste tu apodo en esta comunidad de **$previousNickname** a **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'Usuario desconocido';

  @override
  String composerCommandMsgFailed(String username) {
    return 'No se pudo enviar un mensaje a **$username**. Es posible que tenga los mensajes directos desactivados o que te haya bloqueado.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count más';
  }

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
  String get addGuildCreateTitle => 'Crear una comunidad';

  @override
  String get addGuildCreateDescription =>
      'Crea una comunidad para chatear con tus amigos.';

  @override
  String get addGuildCreateNameLabel => 'Nombre de la comunidad';

  @override
  String get addGuildCreateSubmit => 'Crear comunidad';

  @override
  String get addGuildCreateFailed =>
      'No se pudo crear la comunidad. Intenta de nuevo.';

  @override
  String get addGuildCreateClaimTitle => 'Reclama tu cuenta';

  @override
  String get addGuildCreateClaimDescription =>
      'Debes reclamar tu cuenta antes de poder crear una comunidad.';

  @override
  String get addGuildCreateVerifyTitle => 'Verifica tu correo electrónico';

  @override
  String get addGuildCreateVerifyDescription =>
      'Necesitas verificar tu dirección de correo electrónico antes de poder crear una comunidad.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Las animaciones no son compatibles al crear una nueva comunidad. Usa una imagen estática.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'Al crear una comunidad, aceptas seguir y respetar las ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return 'directrices de la comunidad de $productName';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'Esta instancia es una comunidad única, por lo que no se pueden crear comunidades adicionales.';

  @override
  String get addGuildCreateChangeIcon => 'Cambiar icono';

  @override
  String get addGuildCreateIconLabel => 'Icono de la comunidad';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Máx. 10 MB. Recomendado: 512 × 512 px';

  @override
  String get addGuildImportDescription =>
      'Pega una URL de plantilla de Discord para importar su estructura a una nueva comunidad.';

  @override
  String get addGuildImportUrlLabel => 'URL de la plantilla';

  @override
  String get addGuildImportUrlInvalid =>
      'Introduce una URL o código de plantilla de Discord válido.';

  @override
  String get addGuildImportFetchFailed =>
      'No se pudo obtener la plantilla de la comunidad. Es posible que la plantilla no exista o que el servicio externo no esté disponible.';

  @override
  String get addGuildImportInvalidResponse =>
      'Esta no parece ser una respuesta de plantilla válida.';

  @override
  String get addGuildImportTemplateLabel => 'Plantilla';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount de texto, $voiceChannelCount de voz, $categoryCount categorías, $roleCount roles';
  }

  @override
  String get addGuildImportRemoveIcon => 'Quitar ícono';

  @override
  String get addGuildImportTemplateInvalid =>
      'Los datos de la plantilla de la comunidad no son válidos o están mal formados.';

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
  String get channelDetailsFallbackTitle => 'Detalles';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'DM grupal · $count miembros';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return '¿Cerrar tu conversación con $name?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return '¿Salir de $name?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Ajustes del canal';

  @override
  String get channelDetailsGroupSettingsTitle => 'Ajustes del grupo';

  @override
  String get channelDetailsDmSettingsTitle => 'Ajustes de chat privado';

  @override
  String get channelDetailsInvitePeople => 'Invitar usuarios';

  @override
  String get channelDetailsCopyLink => 'Copiar link';

  @override
  String get channelMenuCopyChannelLink => 'Copiar enlace del canal';

  @override
  String get channelMenuCopyRedirectLink => 'Copiar enlace de redirección';

  @override
  String get channelDetailsAddFriendsToGroup => 'Agregar amigos al grupo';

  @override
  String get channelDetailsGroupInvites => 'Invitaciones de grupo';

  @override
  String get channelDetailsEditChannel => 'Editar canal';

  @override
  String get channelDetailsDeleteChannel => 'Eliminar canal';

  @override
  String get channelSettingsCategorySettingsTitle => 'Ajustes de categoría';

  @override
  String get channelSettingsEditCategory => 'Editar categoría';

  @override
  String get channelSettingsTabOverview => 'Vista general';

  @override
  String get channelSettingsTabPermissions => 'Permisos';

  @override
  String get channelSettingsTabInvites => 'Invitaciones';

  @override
  String get channelSettingsTabWebhooks => 'Webhooks';

  @override
  String get channelSettingsDeleteChannel => 'Eliminar canal';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return '¿Estás seguro de que quieres eliminar $channelName? Esta acción no se puede deshacer.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return '¿Estás seguro de que quieres eliminar $categoryName? Esta acción no se puede deshacer.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Eliminar categoría';

  @override
  String get channelSettingsChannelUpdated => 'Canal actualizado';

  @override
  String get channelSettingsChannelName => 'Nombre del canal';

  @override
  String get channelSettingsCategoryName => 'Nombre de la categoría';

  @override
  String get channelSettingsMyCategory => 'Mi categoría';

  @override
  String get categoryExpandCategory => 'Expandir categoría';

  @override
  String get categoryCollapseCategory => 'Contraer categoría';

  @override
  String get categoryExpandAllCategories => 'Expandir todas las categorías';

  @override
  String get categoryCollapseAllCategories => 'Contraer todas las categorías';

  @override
  String get categoryMuteCategory => 'Silenciar categoría';

  @override
  String get categoryUnmuteCategory => 'Desactivar silencio';

  @override
  String get categoryCopyCategoryId => 'Copiar ID de la categoría';

  @override
  String get categoryIdCopied => 'ID de categoría copiado';

  @override
  String get channelSettingsChannelNamePlaceholder => 'general';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://ejemplo.com';

  @override
  String get channelSettingsTopic => 'Tema';

  @override
  String get channelSettingsTopicPlaceholder => 'Agrega un tema a este canal';

  @override
  String get channelSettingsInsertEmoji => 'Insertar emoji';

  @override
  String get channelSettingsTopicTooLongTitle =>
      'El tema del canal es demasiado largo.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'Acorta el tema y vuelve a intentarlo.';

  @override
  String get channelSettingsSlowmode => 'Modo lento';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Tiempo de espera entre mensajes. \"$bypassSlowmodePermissionLabel\" puede omitirlo.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Apagado';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds segundos';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes minutos';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours horas';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute minuto';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour hora';
  }

  @override
  String get channelSettingsVoiceQuality => 'Calidad de voz';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'Mayor tasa de bits = mejor calidad y mayor uso de ancho de banda.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbps';
  }

  @override
  String get channelSettingsParticipantLimit => 'Límite de participantes';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Miembros máximos que pueden unirse a la vez. 0 significa ilimitado.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count participantes',
      one: '1 participante',
      zero: '∞ Sin límite',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Límite de conexión';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Máximo de conexiones activas que un miembro puede mantener en este canal.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count conexiones',
      one: '1 conexión',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Región de voz';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Selecciona una región de voz para este canal. Automático usa la región más cercana.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Automático';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'No se pudieron cargar las regiones de voz';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Intenta de nuevo en un momento.';

  @override
  String get channelSettingsResetSlider =>
      'Restablecer el deslizador al valor predeterminado';

  @override
  String get channelSettingsAdvanced => 'Avanzado';

  @override
  String get channelSettingsMatureContentOverride =>
      'Anulación de contenido para adultos';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Anular la configuración de nivel $scopeLevel para este canal. El contenido para adultos se muestra detrás de una barrera antes de entrar.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Heredar';

  @override
  String get channelSettingsMatureContentOn => 'Activado';

  @override
  String get channelSettingsMatureContentOff => 'Apagado';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Marca este canal como contenido para adultos.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Deja este canal sin restricciones para contenido para adultos.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Heredado de $inheritedSourceLabel: activado';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Heredado de $inheritedSourceLabel: desactivado';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'categoría';

  @override
  String get channelSettingsMatureContentCommunitySource => 'comunidad';

  @override
  String get channelSettingsMatureContentCategoryScope => 'Categoría';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Comunidad';

  @override
  String get channelSettingsContentWarningToggle =>
      'Mostrar una advertencia de contenido en este canal';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Activa una solicitud de consentimiento antes de entrar a este canal.';

  @override
  String get channelSettingsContentWarningText =>
      'Texto de advertencia personalizado';

  @override
  String get channelSettingsContentWarningDefault =>
      'Esto contiene contenido delicado.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'Necesitas el permiso \"$manageChannelsPermissionLabel\" para editar estos permisos.';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'Necesitas el permiso \"$manageRolesPermissionLabel\" para editar estos permisos.';
  }

  @override
  String get channelSettingsUnknownRole => 'Rol desconocido';

  @override
  String get channelSettingsUnknownUser => 'Usuario desconocido';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides =>
      'Anulaciones de acceso';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Editar acceso para $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'Volver a las anulaciones';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Configura el acceso base para este canal';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Configurar anulaciones para este rol';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Configurar anulaciones para este miembro';

  @override
  String get channelSettingsPermissionsSearchPlaceholder => 'Buscar permisos…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Acceso al canal actualizado';

  @override
  String get channelSettingsPermissionsTitle => 'Control de acceso';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'Este canal está sincronizado con la categoría principal ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'Este canal no está sincronizado con la categoría principal ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory =>
      'Sincronizar con la categoría';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'Canal sincronizado con la categoría principal';

  @override
  String get channelSettingsPermissionsAddOverride => 'Añadir anulación';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Buscar roles o miembros…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => 'Roles y miembros';

  @override
  String get channelSettingsDeleteInvite => 'Eliminar invitación';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      '¿Eliminar esta invitación? No se puede deshacer.';

  @override
  String get channelSettingsCopyInviteCode => 'Copiar código de invitación';

  @override
  String get channelSettingsCopyInviteUrl => 'Copiar enlace de invitación';

  @override
  String get channelSettingsWebhookCreated => 'Webhook creada';

  @override
  String get channelSettingsWebhookCreateFailed =>
      'No se pudo crear el webhook';

  @override
  String get channelSettingsCreateWebhook => 'Crear webhook';

  @override
  String get channelSettingsInvitesDescription =>
      'Administra los enlaces de invitación para este canal.';

  @override
  String get channelSettingsInvitesCreate => 'Crear invitación';

  @override
  String get channelSettingsInvitesEmpty => 'No hay enlaces de invitación';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'Este canal aún no tiene enlaces de invitación. Crea uno para invitar a personas a este canal.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Hubo un error al cargar los enlaces de invitación para este canal. Intenta de nuevo.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Administra los webhooks entrantes que pueden publicar mensajes en este canal.';

  @override
  String get channelSettingsWebhooksEmpty => 'No hay webhooks';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'No hay webhooks configurados para este canal. Crea un webhook para permitir que las aplicaciones externas publiquen mensajes.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Este canal no admite webhooks.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'Necesitas el permiso \"$permission\" para ver y editar los webhooks de este canal.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'No se pudieron cargar los webhooks';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Hubo un error al cargar los webhooks de este canal. Intenta de nuevo.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Creado por $creator el $date';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'Usuario desconocido';

  @override
  String get channelSettingsWebhooksAvatar => 'Avatar';

  @override
  String get channelSettingsWebhooksUploadImage => 'Subir imagen';

  @override
  String get channelSettingsWebhooksRemove => 'Eliminar';

  @override
  String get channelSettingsWebhooksName => 'Nombre';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Nombre del webhook';

  @override
  String get channelSettingsWebhooksChannel => 'Canal';

  @override
  String get channelSettingsWebhooksUrl => 'URL del webhook';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Copiar URL del webhook';

  @override
  String get channelSettingsWebhooksDelete => 'Eliminar webhook';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'No se pudo eliminar este webhook';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      '¿Eliminar este webhook? No se puede deshacer.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Intenta de nuevo en un momento.';

  @override
  String get channelMenuOpenChat => 'Abrir chat';

  @override
  String get channelMenuDuplicateChannel => 'Duplicar canal';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Restablecer el estado del acuerdo de contenido para adultos';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      '¿Eliminar tus mensajes en este canal?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Esto eliminará permanentemente todos los mensajes que hayas enviado en este canal. Esta acción no se puede deshacer.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Eliminar mis mensajes';

  @override
  String get channelMenuDeletedYourMessages => 'Mensajes eliminados';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'No se pudieron eliminar tus mensajes';

  @override
  String get channelDetailsSystemMessage => 'Mensaje del sistema';

  @override
  String get channelDetailsTextChannel => 'Canal de texto';

  @override
  String get channelDetailsVoiceChannel => 'Canal de voz';

  @override
  String get channelDetailsCategory => 'Categoría';

  @override
  String get channelDetailsLinkChannel => 'Canal de enlace';

  @override
  String get channelDetailsGenericChannel => 'Canal';

  @override
  String get channelDetailsMutedConversation => 'Conversación silenciada';

  @override
  String get channelDetailsUnmutedConversation =>
      'Notificaciones de la conversación activadas';

  @override
  String get channelDetailsMutedChannel => 'Canal silenciado';

  @override
  String get channelDetailsUnmutedChannel =>
      'Notificaciones del canal activadas';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Configuración de notificaciones actualizada';

  @override
  String get channelDetailsTabMembers => 'Miembros';

  @override
  String get channelDetailsTabPins => 'Fijados';

  @override
  String get channelDetailsActionMute => 'Silenciar';

  @override
  String get channelDetailsActionUnmute => 'Activar notificaciones';

  @override
  String get channelDetailsActionSearch => 'Buscar';

  @override
  String get channelDetailsActionMore => 'Más';

  @override
  String get channelDetailsMembersEmptyTitle => 'No hay miembros para mostrar';

  @override
  String get channelDetailsMembersEmptyBody =>
      'Los miembros aparecerán aquí una vez que se carguen los datos de la comunidad.';

  @override
  String get memberListPermissionDeniedTitle => 'No puedes ver a los miembros';

  @override
  String get memberListPermissionDeniedBody =>
      'No puedes ver a los miembros de este canal en esta comunidad';

  @override
  String get memberListUnavailableTitle => 'Lista de miembros no disponible';

  @override
  String get memberListUnavailableBody =>
      'Las listas de miembros no están disponibles temporalmente en esta comunidad';

  @override
  String get channelDetailsPinsLoadFailedTitle =>
      'No se pudieron cargar los Pines';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'Los miembros con el permiso \"Anclar mensajes\" pueden anclar mensajes para que todos los vean.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'Puedes fijar mensajes en esta conversación para que todos los vean.';

  @override
  String get channelDetailsPinsEndReached => 'Llegaste al final';

  @override
  String get channelHeaderOpenDetails => 'Abrir detalles del canal';

  @override
  String get channelHeaderPinnedMessages => 'Mensajes fijados';

  @override
  String get channelHeaderPinnedMessagesUnread => 'Mensajes fijados, no leídos';

  @override
  String get channelHeaderMemberList => 'Lista de miembros';

  @override
  String get channelHeaderInbox => 'Bandeja de entrada';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Configuración de notificaciones, silenciado';

  @override
  String get channelDetailsSearchTitle => 'Buscar';

  @override
  String get channelDetailsSearchHint => 'Buscar mensajes';

  @override
  String get channelDetailsSearchFilterFrom => 'De';

  @override
  String get channelDetailsSearchFilterHas => 'Tiene';

  @override
  String get channelDetailsSearchFilterIn => 'En';

  @override
  String get channelDetailsSearchFilterMentions => 'Menciones';

  @override
  String get channelDetailsSearchFilterMore => 'Más';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Activo';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count canales';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count usuarios';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'Usuario';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Bot';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => 'Filtrar por canal';

  @override
  String get channelDetailsSearchChannelsHint => 'Buscar canales';

  @override
  String get channelDetailsSearchChannelsEmpty => 'No se encontraron canales';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Fijado';

  @override
  String get channelDetailsSearchPinnedTrue => 'Fijados solamente';

  @override
  String get channelDetailsSearchPinnedFalse => 'Excluir anclados';

  @override
  String get channelDetailsSearchClearFilter => 'Limpiar';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Tipo de autor';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Fecha';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Modo de fecha';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Selecciona una fecha';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Nombre de host del enlace';

  @override
  String get channelDetailsSearchMoreFiltersFileName =>
      'El nombre del archivo contiene';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'Extensión de archivo';

  @override
  String get channelDetailsSearchContentPoll => 'Encuesta';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'Mensajes con una encuesta';

  @override
  String get channelDetailsSearchContentForward => 'Reenviar';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Mensajes reenviados';

  @override
  String get channelDetailsSearchFilterSort => 'Ordenar';

  @override
  String get channelHeaderSearchFiltersTitle => 'Filtros de búsqueda';

  @override
  String get channelHeaderSearchRecentTitle => 'Búsquedas recientes';

  @override
  String get channelHeaderSearchUsersTitle => 'Usuarios';

  @override
  String get channelHeaderSearchChannelsTitle => 'Canales';

  @override
  String get channelHeaderSearchValuesTitle => 'Valores';

  @override
  String get channelHeaderSearchDatesTitle => 'Fechas';

  @override
  String get channelHeaderSearchDefaultBadge => 'Predeterminado';

  @override
  String get channelHeaderSearchClearHistory => 'Borrar';

  @override
  String get channelHeaderSearchFilterDescFrom => 'un usuario';

  @override
  String get channelHeaderSearchFilterDescMentions => 'un usuario';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'enlace, incrustación, imagen, video, sonido, archivo, sticker, …';

  @override
  String get channelHeaderSearchFilterDescBefore =>
      'una fecha o un rango de fechas';

  @override
  String get channelHeaderSearchFilterDescOn =>
      'una fecha o un rango de fechas';

  @override
  String get channelHeaderSearchFilterDescDuring =>
      'una fecha o un rango de fechas';

  @override
  String get channelHeaderSearchFilterDescAfter =>
      'una fecha o un rango de fechas';

  @override
  String get channelHeaderSearchFilterDescIn => 'un canal';

  @override
  String get channelHeaderSearchFilterDescPinned => 'verdadero o falso';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'usuario, bot o webhook';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'un nombre de host, por ejemplo, example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'parte del nombre de un archivo adjunto';

  @override
  String get channelHeaderSearchFilterDescFileType =>
      'una extensión de archivo, p. ej., png';

  @override
  String get channelHeaderSearchFilterDescSort => 'fecha o relevancia';

  @override
  String get channelHeaderSearchFilterDescOrder => 'asc. o desc';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString resultados',
      one: '1 resultado',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'Filtrar por usuario';

  @override
  String get channelDetailsSearchFilterByContent => 'Filtrar por contenido';

  @override
  String get channelDetailsSearchSortBy => 'Ordenar resultados por';

  @override
  String get channelDetailsSearchIn => 'Buscar en';

  @override
  String get channelDetailsSearchEmptyTitle => 'Buscar en esta conversación';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Escribe texto, un autor o un filtro de contenido para encontrar mensajes.';

  @override
  String get channelDetailsSearchIndexingTitle =>
      'Los mensajes se están indexando';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Inténtalo de nuevo en breve una vez que la búsqueda termine de indexar este ámbito.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Sin resultados';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Prueba con otros términos de búsqueda o filtros.';

  @override
  String get channelDetailsMembersOnline => 'En línea';

  @override
  String get channelDetailsMembersOffline => 'Desconectado';

  @override
  String get channelDetailsMemberYou => 'Tú';

  @override
  String get channelDetailsSearchUsersHint => 'Buscar usuarios';

  @override
  String get channelDetailsSearchUsersTypeToSearch =>
      'Escribe para buscar miembros';

  @override
  String get channelDetailsSearchUsersEmpty => 'No se encontraron usuarios';

  @override
  String get channelDetailsSearchUsersNoAvailable =>
      'No hay usuarios disponibles';

  @override
  String get channelDetailsDone => 'Hecho';

  @override
  String get channelDetailsHasFilterPrompt => 'Mostrar mensajes que contengan:';

  @override
  String get channelDetailsRetry => 'Reintentar';

  @override
  String get channelDetailsPinnedMessageTitle => 'Mensaje fijado';

  @override
  String get channelDetailsSearchResultTitle => 'Resultado de búsqueda';

  @override
  String get channelDetailsJumpToMessage => 'Ir al mensaje';

  @override
  String get channelDetailsUnpinMessage => 'Desfijar mensaje';

  @override
  String get channelDetailsCopyMessageLink => 'Copiar enlace del mensaje';

  @override
  String get channelDetailsCopyMessageId => 'Copiar ID del mensaje';

  @override
  String get channelDetailsMessageUnpinned => 'Mensaje desfijado';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Comunidad actual';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'Chat privado actual';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Todas las comunidades';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild => 'Solo chats privados';

  @override
  String get channelDetailsSearchScopeAllDms => 'Todos los chats privados';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild =>
      'Solo chats privados abiertos';

  @override
  String get channelDetailsSearchScopeOpenDms => 'Abrir chats privados';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Todos los chats privados + comunidades';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Chats privados abiertos + comunidades';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Buscar solo en esta comunidad';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Buscar solo en el chat privado actual';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'En todas las comunidades en las que te encuentras actualmente';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Solo en todos los chats privados en los que has estado';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'En todos los chats privados en los que has estado';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'Solo en todos los chats privados que tienes abiertos actualmente';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'En todos los chats privados que tienes abiertos actualmente';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'En todos los chats privados en los que has estado alguna vez + todas las comunidades en las que estás actualmente';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'En todos los chats privados que tienes abiertos actualmente + todas las comunidades en las que estás actualmente';

  @override
  String get channelDetailsSearchSortNewest => 'Más recientes primero';

  @override
  String get channelDetailsSearchSortOldest => 'Más antiguos primero';

  @override
  String get channelDetailsSearchSortRelevance => 'Más relevantes';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Mostrar los mensajes más recientes primero';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Mostrar los mensajes más antiguos primero';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Mostrar primero los mensajes más relevantes';

  @override
  String get channelDetailsSearchContentImage => 'Imagen subida';

  @override
  String get channelDetailsSearchContentVideo => 'Video subido';

  @override
  String get channelDetailsSearchContentAudio => 'Audio subido';

  @override
  String get channelDetailsSearchContentFile => 'Archivo subido';

  @override
  String get channelDetailsSearchContentLink => 'Enlace';

  @override
  String get channelDetailsSearchContentEmbed =>
      'Vista previa o incrustación de enlace';

  @override
  String get channelDetailsSearchContentSticker => 'Sticker';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Solo archivos de imagen subidos';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Solo archivos de video subidos';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Solo archivos de audio subidos';

  @override
  String get channelDetailsSearchContentFileDescription =>
      'Cualquier archivo adjunto subido';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'URL escrita en el texto del mensaje';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Previsualizaciones y contenido enriquecido resueltos, no archivos subidos';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Sticker adjunto al mensaje';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count tipos';
  }

  @override
  String get personalNotesTitle => 'Notas personales';

  @override
  String get personalNotesSubtitle =>
      'Tu espacio privado para pensamientos y recordatorios';

  @override
  String groupDmWelcome(String displayName) {
    return 'Te damos la bienvenida a $displayName. Agrega amigos para poner en marcha el grupo.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Editar grupo';

  @override
  String get groupDmWelcomeAddFriends => 'Añadir amigos al grupo';

  @override
  String get dmGroupInvites => 'Invitaciones';

  @override
  String get groupDmEditTitle => 'Editar grupo';

  @override
  String get groupDmEditDetailsTooltip => 'Editar detalles del grupo';

  @override
  String get groupDmGroupName => 'Nombre del grupo';

  @override
  String get groupDmMyGroup => 'Mi grupo';

  @override
  String get groupDmGroupNameMaxLength =>
      'El nombre del grupo no debe exceder los 100 caracteres';

  @override
  String get groupDmGroupIcon => 'Icono del grupo';

  @override
  String get groupDmUploadIcon => 'Subir icono';

  @override
  String get groupDmChangeIcon => 'Cambiar icono';

  @override
  String get groupDmRemoveIcon => 'Eliminar icono';

  @override
  String get groupDmUpdated => 'Grupo actualizado';

  @override
  String get groupDmUpdateFailed =>
      'No se pudo actualizar el grupo. Inténtalo de nuevo.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Los iconos animados no son compatibles. Usa una imagen estática.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Los iconos animados no son compatibles';

  @override
  String get groupDmIconFileTooLargeTitle => 'Archivo demasiado grande';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'Archivo demasiado grande. Elige un archivo menor a $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'Formato de icono no compatible';

  @override
  String get groupDmUnsupportedIconFormatBody =>
      'Tipo de archivo no compatible.';

  @override
  String get groupDmCouldntProcessImage => 'No se pudo procesar la imagen';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'No se pudo procesar la imagen recortada. Inténtalo de nuevo.';

  @override
  String get groupDmInvalidImage => 'Imagen invalida';

  @override
  String get groupDmInvalidImageBody =>
      'Esa imagen no es válida. Prueba con otra.';

  @override
  String get groupDmAddFriends => 'Añadir';

  @override
  String get groupDmOrSendInvite => 'o envía una invitación a un amigo:';

  @override
  String get groupDmGenerateInviteLink => 'Generar enlace de invitación';

  @override
  String get groupDmCreateInvite => 'Crear';

  @override
  String get groupDmInviteExpires24Hours => 'Tu invitación vence en 24 horas';

  @override
  String get groupDmAddFriendFailed =>
      'No se pudo añadir a este amigo al grupo. Intenta de nuevo.';

  @override
  String get groupDmAddFailed => 'No se pudo añadir al grupo';

  @override
  String get groupDmGroupFull =>
      'Este grupo está lleno. Elimina a alguien antes de añadir a más personas.';

  @override
  String get groupDmRateLimited =>
      'Vas demasiado rápido. Espera un momento e inténtalo de nuevo.';

  @override
  String get groupDmCreateInviteFailed =>
      'No se pudo crear el enlace de invitación';

  @override
  String get groupDmCreateInviteFailedBody =>
      'No se pudo generar un enlace de invitación. Intenta de nuevo.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'No se pudo crear un enlace de invitación. Intenta de nuevo.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'No tienes permiso para crear una invitación en este canal.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'Esta comunidad alcanzó su límite de invitaciones.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'La creación de invitaciones está temporalmente deshabilitada para esta comunidad.';

  @override
  String get groupDmCopyInviteFailed =>
      'No se pudo copiar el enlace de invitación';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Solo el dueño del grupo puede administrar las invitaciones.';

  @override
  String get groupDmNoInvitesCreated => 'No se crearon invitaciones';

  @override
  String get groupDmLoadingInvites => 'Cargando invitaciones...';

  @override
  String get groupDmInvitesLoadFailed =>
      'No se pudieron cargar las invitaciones. Intenta de nuevo.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      '¿Revocar esta invitación? No se puede deshacer.';

  @override
  String get groupDmInviteRevoked => 'Invitación revocada';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Creado por $name. Caduca en $time.';
  }

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
  String get composerOpenExpressionPicker => 'Abrir selector de expresiones';

  @override
  String get composerShowKeyboard => 'Mostrar teclado';

  @override
  String get composerCloseAttachmentPanel =>
      'Cerrar selector de archivos adjuntos';

  @override
  String get chatAttachmentPanelPhotos => 'Fotos';

  @override
  String get chatAttachmentPanelFiles => 'Archivos';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Se necesita acceso a la fototeca';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Permite el acceso a la fototeca para buscar y adjuntar fotos y videos recientes.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Abrir configuración';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', enviando';

  @override
  String get messageAccessibilityFailedSuffix => ', no se pudo enviar';

  @override
  String get messageAccessibilityAttachmentSummary => 'un archivo adjunto';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count archivos adjuntos';
  }

  @override
  String get messageAccessibilityImageSummary => 'una imágen';

  @override
  String get messageAccessibilityVideoSummary => 'un video';

  @override
  String get messageAccessibilityAudioSummary => 'un archivo de audio';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'sticker $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'Archivo $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'un adjunto con spoiler';

  @override
  String get messageAccessibilityEmbedSummary => 'un contenido incrustado';

  @override
  String get messageAccessibilityEmptySummary => 'un mensaje';

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
  String get userSettingsGroupBilling => 'FACTURACIÓN';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => 'Buscar en la configuración...';

  @override
  String get userSettingsSearchFieldLabel => 'Ajustes de búsqueda';

  @override
  String get userSettingsSearchClear => 'Limpiar búsqueda';

  @override
  String get userSettingsSearchNoResults => 'No se encontraron ajustes';

  @override
  String get userSettingsNavProfile => 'Perfil';

  @override
  String get userSettingsNavSecurityLogin => 'Seguridad e inicio de sesión';

  @override
  String get userSettingsNavFluxerPlutonium => 'Suscripción a Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Regalos';

  @override
  String get giftSettingsClaimAccountTitle => 'Reclama tu cuenta';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Reclama tu cuenta para canjear o administrar códigos de regalo de Plutonium.';

  @override
  String get giftSettingsRedeemTitle => 'Canjear un regalo';

  @override
  String get giftSettingsRedeemDescription =>
      'Introduce un código de regalo para canjear Plutonium en tu cuenta.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Introduce un código de regalo…';

  @override
  String get giftSettingsRedeemButton => 'Canjear';

  @override
  String get giftSettingsRedeemSuccess =>
      'Regalo canjeado con éxito. Disfruta de tu Plutonium.';

  @override
  String get giftSettingsPurchasedTitle => 'Regalos comprados';

  @override
  String get giftSettingsPurchasedDescription =>
      'Administra tus códigos de regalo de Plutonium comprados. ¡Comparte el enlace de regalo con alguien especial o canjéalo tú mismo!';

  @override
  String get giftSettingsEmptyTitle => 'Todavía no tienes regalos';

  @override
  String get giftSettingsEmptyDescription =>
      'Compra un regalo de Plutonium desde la pestaña Plutonium para compartir con tus amigos.';

  @override
  String get giftSettingsGoToPlutonium => 'Ir a Plutonium';

  @override
  String get giftSettingsLoadFailedTitle =>
      'No se pudo cargar el inventario de regalos';

  @override
  String get giftSettingsLoadFailedDescription => 'Intenta de nuevo más tarde.';

  @override
  String get giftSettingsTryAgain => 'Intentar de nuevo';

  @override
  String get giftSettingsGiftUrl => 'URL del regalo';

  @override
  String get giftSettingsCopy => 'Copiar';

  @override
  String get giftSettingsCopied => 'Copiado';

  @override
  String get giftSettingsGiftUrlCopied =>
      '¡URL de regalo copiada al portapapeles!';

  @override
  String get giftSettingsGiftUrlCopyFailed =>
      'No se pudo copiar la URL del regalo';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Comprado el $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Canjeado el $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Canjeado por $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'Este regalo ya ha sido canjeado';

  @override
  String get giftSettingsRedeemForYourself => 'Canjear para ti';

  @override
  String get giftSettingsShareWithFriend => 'Compartir con un amigo';

  @override
  String get premiumPlutoniumTagline =>
      'Desbloquea límites más altos y funciones exclusivas mientras apoyas una plataforma de comunicación independiente.';

  @override
  String get premiumPurchaseMode => 'Modo de compra';

  @override
  String get premiumForMe => 'Para mí';

  @override
  String get premiumAsAGift => 'Para regalar';

  @override
  String get premiumMonthly => 'Mensual';

  @override
  String get premiumYearly => 'Anual';

  @override
  String get premiumPerMonth => 'por mes';

  @override
  String get premiumPerYear => 'por año';

  @override
  String get premiumOneTimePurchase => 'compra única';

  @override
  String get premiumSave17 => 'Ahorra un 17%';

  @override
  String get premiumUpgradeNow => 'Actualizar ahora';

  @override
  String get premiumBuyGift => 'Comprar regalo';

  @override
  String get premiumOneYearGift => 'Regalo de 1 año';

  @override
  String get premiumOneMonthGift => 'Regalo de 1 mes';

  @override
  String get premiumMostPopular => 'Más popular';

  @override
  String get premiumScrollPrompt =>
      'Desplázate hacia abajo para ver todas las ventajas incluidas con Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'Gratis vs. Plutonium';

  @override
  String get premiumFreeColumn => 'Gratis';

  @override
  String get premiumGiftSectionTitle => 'Regalar Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'Comparte la experiencia de Plutonium con tus amigos comprando una suscripción de regalo.';

  @override
  String get premiumGiftBannerOne =>
      '¡Tienes un nuevo código de regalo esperándote!';

  @override
  String premiumGiftBannerMany(int count) {
    return '¡Tienes $count nuevos códigos de regalo esperándote!';
  }

  @override
  String get premiumViewGifts => 'Ver regalos';

  @override
  String get premiumReadyToUpgrade => '¿Listo para actualizar?';

  @override
  String get premiumReadyToBuyGift => '¿Listo para comprar un regalo?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Mensual $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Anual $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 año $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 mes $price';
  }

  @override
  String get premiumManageSubscription => 'Gestionar suscripción';

  @override
  String get premiumRedeemGiftCode => 'Canjear código de regalo';

  @override
  String get premiumGiftBadge => 'Regalo';

  @override
  String get premiumCancelSubscriptionTitle => '¿Cancelar suscripción?';

  @override
  String get premiumCancelSubscriptionBody =>
      'Conservarás tus beneficios hasta la próxima fecha de renovación y luego tendrás un período de gracia de 3 días para volver a suscribirte y mantener tu historial de suscriptor.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Cancelar suscripción';

  @override
  String get premiumKeepSubscription => 'Mantener suscripción';

  @override
  String get premiumPurchaseHistoryTitle => 'Historial de compras';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Tus facturas recientes. Para cambiar el método de pago de tu suscripción, agrega o elige uno en el portal de facturación y haz que sea el predeterminado.';

  @override
  String get premiumManagePaymentMethods => 'Administrar métodos de pago';

  @override
  String get premiumBillingHistory => 'Historial de facturación';

  @override
  String get premiumSelfServeRefundTitle => 'Reembolso automático';

  @override
  String get premiumSelfServeRefundButton => 'Reembolsar última compra';

  @override
  String get premiumDisclaimerAgreementPrefix =>
      'Al comprar, aceptas nuestros ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'Al comprar, aceptaste nuestros ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' y ';

  @override
  String premiumActiveUntil(String date) {
    return 'Activo hasta el $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Cancelando';

  @override
  String premiumCancelsOn(String date) {
    return 'Se cancela el $date. Las ventajas permanecen activas hasta entonces.';
  }

  @override
  String get premiumReactivateSubscription => 'Reactivar';

  @override
  String premiumGiftedUntil(String date) {
    return 'Regalo hasta el $date. No se renueva automáticamente.';
  }

  @override
  String get premiumComparisonFeatureColumn => 'Función';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'Al comprar, aceptaste nuestros $terms y $privacy.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Reembolsos de autoservicio disponibles dentro de los 3 días posteriores al pago, una vez cada 30 días. El reembolso de una suscripción la cancela. Los compradores de la UE/EEE renuncian al derecho de desistimiento de 14 días al finalizar la compra para acceder al contenido de inmediato. Usa el botón de reembolso en la aplicación en lugar de una contracarga. Las contracargas pueden restringir permanentemente tu cuenta. Stripe maneja el pago de forma segura. Nunca vemos el número completo de tu tarjeta.';

  @override
  String get premiumTermsOfService => 'Condiciones del servicio';

  @override
  String get premiumPrivacyPolicy => 'Políticas de privacidad';

  @override
  String get premiumCheckoutStartFailedTitle => 'No se pudo iniciar el pago';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Algo salió mal al iniciar el proceso de pago. Intenta de nuevo en un momento.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'Actualmente tienes una suscripción de regalo. No se renovará automáticamente. Puedes canjear más códigos de regalo para extenderla. Las suscripciones recurrentes se pueden iniciar una vez que finalice el tiempo de tu regalo.';

  @override
  String get premiumPlanUnavailable =>
      'Este plan no está disponible. Contacta a soporte.';

  @override
  String get premiumCompletePaymentTitle => 'Completar pago';

  @override
  String get premiumCompletePaymentBody =>
      'Ahora serás redirigido a Stripe para completar el pago. Regresa a Fluxer una vez que lo hayas hecho.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Elige un método de pago';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Paga con Pix automático para autorizar cargos recurrentes directamente desde tu banco brasileño. O elige usar tarjeta para ingresar una tarjeta de crédito en la siguiente pantalla de Stripe.';

  @override
  String get premiumUsePix => 'Usar Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Paga con UPI para configurar un mandato electrónico que cumple con las normativas del RBI desde tu banco indio. O elige usar tarjeta para ingresar una tarjeta de crédito en la siguiente pantalla de Stripe.';

  @override
  String get premiumUseUpi => 'Usar UPI';

  @override
  String get premiumUseCard => 'Usar tarjeta';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'No se pudo abrir el portal de facturación';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Algo salió mal al abrir el portal de facturación. Intenta de nuevo en un momento.';

  @override
  String get premiumAlreadyVisionaryTitle => 'Ya eres Visionario';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary ya incluye acceso permanente, por lo que no necesitas una suscripción recurrente. Aún puedes comprar regalos para otros.';

  @override
  String get premiumExistingSubscriptionTitle => 'Ya tienes esta suscripción';

  @override
  String get premiumExistingSubscriptionBody =>
      'Encontramos una suscripción existente de Fluxer Plutonium para esta cuenta. Administrala en el portal de facturación seguro para actualizar los detalles de pago o verificar el estado de renovación. Si acabas de pagar, espera un minuto y vuelve a abrir esta página.';

  @override
  String get premiumPurchasesDisabledTitle => 'Compras no disponibles';

  @override
  String get premiumPurchasesDisabledBody =>
      'Las compras están deshabilitadas para esta cuenta. Ponte en contacto con support@fluxer.app si esto parece incorrecto.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Reclama tu cuenta para comprar Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Necesitas verificar tu correo electrónico antes de poder comprar Fluxer Plutonium.';

  @override
  String get premiumPerkCustomUsernameTag =>
      'Etiqueta de nombre de usuario personalizada';

  @override
  String get premiumPerkPerCommunityProfiles => 'Perfiles por comunidad';

  @override
  String get premiumPerkMessageScheduling => 'Programación de mensajes';

  @override
  String get premiumPerkProfileBadge => 'Insignia de perfil';

  @override
  String get premiumPerkCustomVideoBackgrounds =>
      'Fondos de video personalizados';

  @override
  String get premiumPerkEntranceSounds => 'Sonidos de entrada';

  @override
  String get premiumPerkCommunities => 'Comunidades';

  @override
  String get premiumPerkMessageCharacterLimit =>
      'Límite de caracteres por mensaje';

  @override
  String get premiumPerkBookmarkedMessages => 'Mensajes marcados';

  @override
  String get premiumPerkFileUploadSize => 'Tamaño de archivo para subir';

  @override
  String get premiumPerkEmojiStickerPacks => 'Packs de emojis y stickers';

  @override
  String get premiumPerkSavedMedia => 'Multimedia guardada';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Usar emojis animados';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Acceso global a emojis y stickers';

  @override
  String get premiumPerkVideoQuality => 'Calidad de video';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Avatares y banners de perfil animados';

  @override
  String get premiumPerkEarlyAccess => 'Acceso anticipado a nuevas funciones';

  @override
  String get premiumPerkCustomThemes => 'Temas personalizados';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Hasta 4K/60 fps';

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
  String get userSettingsNavChat => 'Mensajes y contenido multimedia';

  @override
  String get userSettingsNavAudioAndVideo => 'Audio y video';

  @override
  String get userSettingsNavShortcuts => 'Atajos';

  @override
  String get audioAndVideoAudioSectionTitle => 'Audio';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'Configura tu micrófono, altavoces y procesamiento de voz.';

  @override
  String get audioAndVideoVideoSectionTitle => 'Video';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'Configura la calidad de tu cámara y de compartir pantalla.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle =>
      'Comportamiento en llamadas';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Controla las indicaciones de confirmación durante las llamadas de voz y video.';

  @override
  String get audioAndVideoInputDeviceLabel => 'Dispositivo de entrada';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Dispositivo de salida';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'Por defecto';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Usar altavoz';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'Cuando está desactivado, el audio se reproduce a través del auricular o los audífonos conectados.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Volumen de entrada';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Volumen de salida';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Procesamiento de voz';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Voz enfocada';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Recomendado. Limpia tu micrófono para una voz clara.';

  @override
  String get audioAndVideoDirectInputLabel => 'Entrada directa';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Envía tu audio sin modificar. Ideal si usas software de audio externo.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Personalizado';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Ajusta cada opción tú mismo: supresión de ruido, cancelación de eco y ganancia.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle =>
      'Cancelación de ruido';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Mejorado';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Estándar';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Ninguna';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Cancelación de eco';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Control automático de ganancia';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Ecualiza el volumen de tu micrófono. Desactivado cuando la supresión mejorada está activada.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Prueba de micrófono';

  @override
  String get audioAndVideoMicTestStartLabel => 'Iniciar prueba de micrófono';

  @override
  String get audioAndVideoMicTestStopLabel => 'Detener prueba de micrófono';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '$productName necesita acceso al micrófono para probar tu entrada.';
  }

  @override
  String get audioAndVideoCameraLabel => 'Cámara';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Reflejar cámara';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'Calidad de cámara';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'Calidad de la pantalla compartida';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Cuadros por segundo';

  @override
  String get audioAndVideoFrameRate15Label => '15 FPS';

  @override
  String get audioAndVideoFrameRate30Label => '30 FPS';

  @override
  String get audioAndVideoFrameRate60Label => '60 FPS';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080p y 60 FPS requieren $premiumProductName.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Esta instancia actualmente permite compartir pantalla hasta 720p a 30 FPS.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return '$productName necesita acceso al micrófono para mostrar tus dispositivos.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return '$productName necesita acceso a la cámara para mostrar tus dispositivos.';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'No preguntar al ocultar mi cámara';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'No preguntar al ocultar mi pantalla compartida';

  @override
  String get userSettingsNavNotifications => 'Notificaciones';

  @override
  String get notificationsGeneralSectionTitle => 'General';

  @override
  String get notificationsEnableNotificationsLabel => 'Activar notificaciones';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Recibe notificaciones cuando te lleguen mensajes. Puede que tengas que permitir las notificaciones de $productName en los ajustes de tu dispositivo. Para los controles por canal o por comunidad, abre los ajustes de notificaciones desde el menú de una comunidad.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Activar notificaciones de escritorio';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Usa el centro de notificaciones del sistema operativo. Para controles por canal o comunidad, haz clic derecho en el ícono de una comunidad y abre la configuración de notificaciones.';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'Activar notificaciones del navegador';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'Recibe notificaciones cuando te lleguen mensajes. Puede que tengas que permitir las notificaciones en la configuración de tu navegador. Para controles por canal o comunidad, haz clic derecho en el ícono de una comunidad y abre la configuración de notificaciones.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Tiempo de espera de notificaciones push inactivas';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName evita enviar notificaciones push a tus dispositivos móviles cuando estás usando tu computadora. Elige cuánto tiempo necesitas estar inactivo en el escritorio antes de que recibas las notificaciones push.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute minuto';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes minutos';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle =>
      'Preferencia de menciones';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Preferencia de mención en respuestas';

  @override
  String get notificationsMentionNoPreferenceName => 'Sin preferencia';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Respetar la intención del remitente, sin advertencia cuando desactive la mención @';

  @override
  String get notificationsMentionPreferMentionName => 'Preferir @mención';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Por defecto, permite que te mencionen y advierte al remitente si desactiva esta opción';

  @override
  String get notificationsMentionPreferNoMentionName =>
      'Preferir no recibir @menciones';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Las respuestas predeterminadas omiten la @mención y advierten al remitente si la activa';

  @override
  String get notificationsTtsSectionTitle => 'Notificaciones de texto a voz';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'Activar la reproducción de voz /tts';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'Permite que /tts lea tu mensaje en voz alta. Si desactivas esta opción, esos comandos se mantendrán como texto normal.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Ajustar la velocidad de reproducción en ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Accesibilidad';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle =>
      'Narración automática de mensajes';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Convierte el contenido entrante en voz, sin importar si proviene de /tts.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Todos los canales';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Reproducir cada mensaje entrante, sin importar qué canal esté abierto.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Solo canal activo';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Narra solo el canal que estás viendo. La narración te sigue entre canales.';

  @override
  String get notificationsTtsModeNeverName => 'Nunca automáticamente';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Permanecer en silencio a menos que alguien ejecute /tts manualmente.';

  @override
  String get notificationsTtsModeAriaLabel =>
      'Leer todos los mensajes en voz alta';

  @override
  String get notificationsSoundsSectionTitle => 'Sonidos';

  @override
  String get notificationsMasterVolumeLabel => 'Volumen general';

  @override
  String get notificationsMasterVolumeDescription =>
      'Establece el nivel de todos los efectos de sonido. Las anulaciones por sonido ignoran esto.';

  @override
  String get notificationsResetToDefaultVolume =>
      'Restablecer volumen predeterminado';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Desactivar todos los sonidos de notificación';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Se conservará tu configuración de sonido de notificaciones actual.';

  @override
  String get notificationsShowMoreSoundEffects =>
      'Mostrar más efectos de sonido';

  @override
  String get notificationsShowFewerSoundEffects =>
      'Mostrar menos efectos de sonido';

  @override
  String get notificationsPreviewSound => 'Vista previa del sonido';

  @override
  String get notificationsPerSoundVolumeTitle => 'Volumen por sonido';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Establece volúmenes personalizados para sonidos individuales. Los sonidos sin una anulación siguen el volumen principal.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Volúmenes de sonidos personalizados activos: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Siguiendo al principal • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'Restablecer $label al volumen principal';
  }

  @override
  String get notificationsResetAllOverrides =>
      'Restablecer todas las anulaciones';

  @override
  String notificationsMuteSound(String label) {
    return 'Silenciar $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'Remover silencio $label';
  }

  @override
  String get notificationsSoundMessage =>
      'Notificaciones de mensajes de la comunidad';

  @override
  String get notificationsSoundDirectMessage =>
      'Notificaciones de mensajes directos';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Notificaciones de mensajes del canal actual';

  @override
  String get notificationsSoundMute => 'Silenciar voz';

  @override
  String get notificationsSoundUnmute => 'Activar audio';

  @override
  String get notificationsSoundDeaf => 'Desactivar audio';

  @override
  String get notificationsSoundUndeaf => 'Reactivar audio';

  @override
  String get notificationsSoundUserJoin => 'El usuario se une al canal';

  @override
  String get notificationsSoundUserLeave => 'El usuario abandona el canal';

  @override
  String get notificationsSoundUserMove => 'Usuario movió el canal';

  @override
  String get notificationsSoundViewerJoin =>
      'Espectador se une a la transmisión';

  @override
  String get notificationsSoundViewerLeave =>
      'Espectador abandona la transmisión';

  @override
  String get notificationsSoundVoiceDisconnect => 'Voz desconectada';

  @override
  String get notificationsSoundIncomingRing => 'Llamada entrante';

  @override
  String get notificationsSoundCameraOn => 'Cámara activada';

  @override
  String get notificationsSoundCameraOff => 'Cámara apagada';

  @override
  String get notificationsSoundScreenShareStart =>
      'Inicio de compartir pantalla';

  @override
  String get notificationsSoundScreenShareStop => 'Detener compartir pantalla';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'No se pudo actualizar el tiempo de espera de las notificaciones push. Intenta de nuevo.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'No se pudo actualizar la preferencia de menciones. Intenta de nuevo.';

  @override
  String get notificationsPermissionDeniedTitle => 'Notificaciones bloqueadas';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'No se pudieron activar las notificaciones. Permite el acceso a las notificaciones para continuar.';

  @override
  String get userSettingsNavLanguageAndTime => 'Idioma y hora';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Idioma de la interfaz';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Elige el idioma que se usará en toda la app';

  @override
  String get languageAndTimeOpenLanguageSettings =>
      'Abrir configuración de idioma';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Formato de hora';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Elige cómo se muestran las horas en la app';

  @override
  String get languageAndTimeTimeFormatSelectionLabel =>
      'Selección de formato de hora';

  @override
  String get languageAndTimeTimeFormatAuto => 'Automático';

  @override
  String get languageAndTimeTimeFormat12Hour => '12 horas';

  @override
  String get languageAndTimeTimeFormat24Hour => '24 horas';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'Idioma de la aplicación: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Idioma del sistema: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Usar la configuración regional del sistema para el formato de hora';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'No se pudo actualizar el formato de hora';

  @override
  String get userSettingsNavDefaultApps => 'Aplicaciones predeterminadas';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Navegador web';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Elige qué navegador se abre cuando tocas un enlace.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'Si una app está instalada para un sitio, los enlaces se abrirán primero en esa app.';

  @override
  String get defaultAppsWebBrowserInApp => 'Navegador en la app';

  @override
  String get defaultAppsWebBrowserExternal => 'Navegador externo';

  @override
  String get userSettingsNavAdvanced => 'Avanzado';

  @override
  String get advancedPerformanceReportingTitle => 'Informes de rendimiento';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'Ayuda a mejorar $productName compartiendo datos anónimos sobre errores y rendimiento.';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'Enviar informes de errores y rendimiento';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'Todos los datos reportados son anónimos y se envían únicamente al servicio de monitoreo de $productName; no se utilizan proveedores externos.';
  }

  @override
  String get advancedSettingsConfigure => 'Configurar';

  @override
  String get advancedSettingsCategoryPrivacy => 'Privacidad';

  @override
  String get advancedSettingsCategoryAppearance => 'Apariencia';

  @override
  String get advancedSettingsCategoryAccessibility => 'Accesibilidad';

  @override
  String get advancedSettingsCategoryChat => 'Chat';

  @override
  String get advancedSettingsCategoryMedia => 'Archivos';

  @override
  String get advancedSettingsCategoryVoice => 'Voz';

  @override
  String get advancedSettingsCategoryDeveloper => 'Desarrollador';

  @override
  String get advancedSettingEnableTextSelectionLabel =>
      'Habilitar selección de texto';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Permite seleccionar texto en la aplicación';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Activar miniaturas de vista previa para la búsqueda de videos';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Miniatura o fotograma en vivo al reproducir video';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Respuesta háptica';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Respuesta háptica para toques y acciones. No se sincronizará entre dispositivos.';

  @override
  String get advancedSettingShowNekoLabel => 'Mostrar Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'Gato Neko que persigue tu cursor';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Mostrar Neko en la entrada de tu chat';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Animación de zoom al iniciar';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Reduce el tamaño del logo al salir de la pantalla de inicio';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Atajos de teclado';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Muestra sugerencias de atajos de teclado en los consejos';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Habilitar favoritos';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Mostrar favoritos en toda la aplicación';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Comportamiento al unirse a canales de voz';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Confirmación o doble clic para unirse a canales de voz de la comunidad';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Requerir doble clic para unirse a canales de voz';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Confirmar antes de unirte a canales de voz';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Enviar GIFs automáticamente al seleccionarlos';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Enviar GIFs automáticamente desde el selector sin confirmación';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Guardar GIF favoritos como elementos guardados';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Elige cómo se guardan tus GIF favoritos destacados';

  @override
  String get advancedSettingMediaButtonsLabel => 'Botones multimedia';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Personaliza qué botones e indicadores se muestran en los archivos multimedia y las incrustaciones';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Sube archivos adjuntos antes de enviar';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Comienza a subir los archivos adjuntos tan pronto como se agreguen al campo de entrada del mensaje';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Quitar parámetros de seguimiento de las URL';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Eliminar automáticamente los parámetros de seguimiento de las URL en los mensajes que envías';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'Confiar en todos los enlaces externos';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'Omitir la advertencia de enlace externo para todos los dominios';

  @override
  String get advancedSettingSearchEnginesLabel => 'Buscadores';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Configurar los motores de búsqueda que se utilizarán para el texto seleccionado';

  @override
  String get advancedSettingTranslatorsLabel => 'Traductores';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Configurar los proveedores de traducción que se utilizarán en el texto seleccionado';

  @override
  String get advancedSettingReverseImageSearchLabel =>
      'Búsqueda inversa de imágenes';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Proveedores de búsqueda inversa de imágenes';

  @override
  String get advancedSettingMessageActionBarLabel =>
      'Barra de acciones de mensajes';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Personaliza la barra de acciones que aparece al pasar el cursor sobre los mensajes';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Autocompletar expresiones';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Elige qué aparece cuando escribes dos puntos en el campo de entrada del mensaje';

  @override
  String get advancedSettingInputButtonsLabel =>
      'Botones de entrada de mensajes';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Elige qué botones se muestran en la barra de entrada de mensajes';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Desplazarse hacia abajo al enviar un mensaje';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Elige cómo se desplazan los chats después de que envíes un mensaje';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Omitir la confirmación de \"Marcar todo como leído\"';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Marcar todos los canales no leídos de la bandeja de entrada como leídos inmediatamente, sin pedir confirmación';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Ocultar los canales silenciados por defecto';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Ocultar los canales silenciados de las barras laterales de la comunidad';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'Mostrar indicador de GIF';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Mostrar indicador de vencimiento de archivos adjuntos';

  @override
  String get advancedSettingShowMediaDeleteLabel =>
      'Mostrar botón para eliminar';

  @override
  String get advancedSettingShowMediaDownloadLabel =>
      'Mostrar botón de descarga';

  @override
  String get advancedSettingShowMediaFavoriteLabel =>
      'Mostrar botón de favoritos';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Mostrar el botón para ocultar previsualizaciones';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Mostrar barra de acciones del mensaje';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel =>
      'Mostrar solo el botón de más';

  @override
  String get advancedSettingShowQuickReactionsLabel =>
      'Mostrar reacciones rápidas';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Habilitar Mayús para expandir';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Mostrar emojis predeterminados en el autocompletado de expresiones';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Mostrar emojis personalizados en el autocompletado de expresiones';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Mostrar stickers en el autocompletado de expresiones';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Mostrar contenido guardado en el autocompletado de expresiones';

  @override
  String get advancedSettingShowGifsButtonLabel => 'Mostrar botón de GIF';

  @override
  String get advancedSettingShowMediaButtonLabel =>
      'Mostrar botón de contenido multimedia';

  @override
  String get advancedSettingShowStickersButtonLabel =>
      'Mostrar botón de stickers';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Mostrar botón de emoji';

  @override
  String get advancedSettingShowSendButtonLabel => 'Mostrar botón de enviar';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Mostrar alertas de dispositivos nuevos';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Solicitar nuevos dispositivos de audio';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Controles de volumen de conexión';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Mostrar controles deslizantes de volumen por participante en los menús de voz';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Comportamiento de la vista previa para compartir pantalla';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Comportamiento de la vista previa, ventana emergente y miniatura del stream';

  @override
  String get advancedSettingScreenShareCodecLabel =>
      'Códec para compartir pantalla';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Códec de video para compartir pantalla';

  @override
  String get advancedSettingScreenShareCodecAuto => 'Automático (recomendado)';

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
      'Pausar la vista previa de mi pantalla compartida en segundo plano';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Ocultar la miniatura de la vista previa de mi transmisión';

  @override
  String get advancedSettingDeveloperModeLabel =>
      'Activar el modo de desarrollador';

  @override
  String get advancedSettingDeveloperModeDescription =>
      'Activar el modo de desarrollador';

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
  String get advancedSettingTranslatorGoogle => 'Google Traductor';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel =>
      'Motor de búsqueda predeterminado';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Elige qué motor de búsqueda se usa por defecto al buscar el texto seleccionado.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Buscadores integrados';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Activa o desactiva los buscadores integrados. Los buscadores activados aparecen en el menú contextual del mensaje cuando se selecciona texto.';

  @override
  String get advancedSettingCustomSearchEnginesLabel =>
      'Motores de búsqueda personalizados';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Agrega tus propios motores de búsqueda con un patrón de URL personalizado. Usa \'$query\' como marcador de posición para el texto de búsqueda.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Agregar motor de búsqueda';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Habilita al menos un motor de búsqueda a continuación.';

  @override
  String get advancedSettingRemoveSearchEngineLabel => 'Eliminar buscador';

  @override
  String get advancedSettingDefaultTranslatorLabel =>
      'Traductor predeterminado';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Elige qué traductor se usa por defecto al traducir el texto seleccionado.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Traductores integrados';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Activa o desactiva los traductores integrados. Los traductores activados aparecen en el menú contextual del mensaje cuando se selecciona texto.';

  @override
  String get advancedSettingCustomTranslatorsLabel =>
      'Traductores personalizados';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Agrega tus propios traductores con un patrón de URL personalizado. Usa \'$query\' como marcador de posición para el texto a traducir.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Añadir traductor';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Habilita al menos un traductor de abajo.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Eliminar traductor';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Búsqueda inversa de imágenes predeterminada';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Elige qué servicio de búsqueda inversa de imágenes se usa por defecto al buscar una imagen.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Búsqueda inversa de imágenes integrada';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Activa o desactiva los proveedores de búsqueda inversa de imágenes integrados. Los proveedores activados aparecen en el menú contextual de imágenes, avatares, banners, stickers y emojis.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Búsqueda inversa de imágenes personalizada';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Agrega tus propios proveedores de búsqueda inversa de imágenes con un patrón de URL personalizado. Usa \'$url\' como marcador de posición para la URL de la imagen.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Agregar búsqueda inversa de imágenes';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Habilita al menos un proveedor de búsqueda inversa de imágenes a continuación.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Eliminar búsqueda inversa de imágenes';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Agregar motor de búsqueda';

  @override
  String get advancedSettingEditSearchEngineTitle => 'Editar motor de búsqueda';

  @override
  String get advancedSettingAddTranslatorTitle =>
      'Añadir proveedor de traducción';

  @override
  String get advancedSettingEditTranslatorTitle =>
      'Editar proveedor de traducción';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Agregar motor de búsqueda de imágenes inversas';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Editar motor de búsqueda de imágenes inversas';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Nombre';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'Patrón de URL';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder => 'Mi buscador';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Mi traductor';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'Mi búsqueda inversa de imágenes';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Usa \'$query\' donde deba insertarse el texto de búsqueda.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Usa \"$query\" donde deba insertarse el texto a traducir.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Usa \'$url\' donde se deba insertar la URL de la imagen.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired =>
      'Se requiere un nombre.';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'El patrón de URL es obligatorio.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'El patrón de URL debe contener el marcador de posición \'$query\'.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'El patrón de URL debe contener el marcador de posición \'$url\'.';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'El patrón de URL debe ser una URL válida.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Añadir';

  @override
  String get advancedSettingEditSearchProviderAction => 'Editar';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Eliminar';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return '¿Estás seguro de que quieres eliminar $engineName?';
  }

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
  String get userSettingsJoinFluxerLabs => 'Únete a Fluxer Labs';

  @override
  String get userSettingsNavAppLicenses => 'Licencias de la aplicación';

  @override
  String get userSettingsAppLicensesDescription =>
      'Software de código abierto utilizado por esta app. Esta app está creada con Flutter.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'No se pudieron cargar las licencias de la aplicación.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count licencias',
      one: '1 licencia',
    );
    return '$_temp0';
  }

  @override
  String get userSettingsNavLogOut => 'Cerrar sesión';

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
  String get savedMessagesEmptyTitle => 'Sin marcadores';

  @override
  String get savedMessagesEmptyBody => 'Guarda mensajes para verlos después.';

  @override
  String get savedMessagesEndBody => 'No hay nada más que ver aquí.';

  @override
  String get savedMessagesRemoveTooltip => 'Eliminar marcador';

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
  String get uiSearch => 'Buscar';

  @override
  String get uiStartCall => 'Iniciar llamada';

  @override
  String get uiStartVideoCall => 'Iniciar videollamada';

  @override
  String get uiPlay => 'Reproducir';

  @override
  String get uiPause => 'Pausar';

  @override
  String get uiDownload => 'Descargar';

  @override
  String get uiMoreActions => 'Más opciones';

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
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'Esto notificará a $count miembros con el rol de $roleName. ¿Continuar?';
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
  String get discoveryCategoryContentCreator => 'Creador de contenido';

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
  String get guildNavbarGuildSelected => 'seleccionado';

  @override
  String get guildNavbarGuildUnread => 'no leído';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count menciones',
      one: '1 mención',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'silenciado';

  @override
  String get authShowPassword => 'Mostrar contraseña';

  @override
  String get authHidePassword => 'Ocultar contraseña';

  @override
  String get chatLoadingMessages => 'Cargando mensajes';

  @override
  String get friendsMessageFriend => 'Mensaje';

  @override
  String get friendsFriendActions => 'Acciones de amigo';

  @override
  String get friendsAcceptRequest => 'Aceptar solicitud de amistad';

  @override
  String get friendsDeclineRequest => 'Rechazar solicitud de amistad';

  @override
  String get friendsCancelRequest => 'Cancelar solicitud de amistad';

  @override
  String get friendsOpenInbox => 'Bandeja de entrada';

  @override
  String get profileRemoveFriend => 'Eliminar amigos';

  @override
  String get profileUnblockUser => 'Desbloquear usuario';

  @override
  String get profileAcceptFriendRequest => 'Aceptar solicitud de amistad';

  @override
  String get profileCancelFriendRequest => 'Cancelar solicitud de amistad';

  @override
  String get profileSendFriendRequest => 'Añadir amigos';

  @override
  String get accountOverflowMenu => 'Opciones de cuenta';

  @override
  String get navHome => 'Inicio';

  @override
  String get navNotifications => 'Notificaciones';

  @override
  String get navYou => 'Tú';

  @override
  String get guildFolderSettingsTitle => 'Ajustes de carpeta';

  @override
  String get guildFolderNameLabel => 'Nombre de la carpeta';

  @override
  String get guildFolderColorLabel => 'Color de carpeta';

  @override
  String get guildFolderShowIconWhenCollapsed =>
      'Mostrar ícono cuando está contraído';

  @override
  String get guildFolderIconLabel => 'Icono de carpeta';

  @override
  String get guildFolderDelete => 'Eliminar carpeta';

  @override
  String get guildFolderIconFolder => 'Carpeta';

  @override
  String get guildFolderIconStar => 'Estrella';

  @override
  String get guildFolderIconHeart => 'Corazón';

  @override
  String get guildFolderIconBookmark => 'Guardar';

  @override
  String get guildFolderIconGameController => 'Mando de videojuegos';

  @override
  String get guildFolderIconShield => 'Escudo';

  @override
  String get guildFolderIconMusicNote => 'Nota de música';

  @override
  String get guildFolderMarkAsRead => 'Marcar carpeta como leída';

  @override
  String get guildBulkMuteCommunities => 'Silenciar comunidades';

  @override
  String get guildBulkUnmuteCommunities => 'Activar sonido de comunidades';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Configuración de notificaciones de la comunidad';

  @override
  String get guildBulkCommunityPrivacySettings =>
      'Ajustes de privacidad de la comunidad';

  @override
  String get guildBulkAllowEveryoneAndHere => 'Permitir @everyone y @here';

  @override
  String get guildBulkAllowRoleMentions => 'Permitir menciones de roles';

  @override
  String get guildBulkEnableMobilePush =>
      'Activar notificaciones push en el móvil';

  @override
  String get guildBulkDisableMobilePush =>
      'Desactivar las notificaciones push en el móvil';

  @override
  String get guildBulkAllowDirectMessages => 'Permitir mensajes directos';

  @override
  String get guildBulkBlockDirectMessages => 'Bloquear mensajes directos';

  @override
  String get guildBulkAllowBotDirectMessages =>
      'Permitir mensajes directos de bots';

  @override
  String get guildBulkBlockBotDirectMessages =>
      'Bloquear mensajes directos del bot';

  @override
  String get guildNavbarGroupDm => 'Chat privado grupal';

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
  String get guildNavbarNewChannelHint => 'nuevo-canal';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://ejemplo.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Selección del tipo de canal';

  @override
  String get guildNavbarCreateCategory => 'Crear categoría';

  @override
  String get guildNavbarNewCategoryHint => 'Nueva categoría';

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
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'Solo accesible para el personal de $productName';
  }

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
  String get guildMenuUnmuteCommunity => 'Activar notificaciones';

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
  String get guildMenuSettingsEmoji => 'Emojis';

  @override
  String get guildMenuSettingsStickers => 'Stickers';

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
  String get guildMenuSettingsBans => 'Baneos';

  @override
  String get guildMenuSettingsChannels => 'Canales';

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
  String get guildSettingsRolesNewRole => 'Nuevo rol';

  @override
  String get guildSettingsRolesDeleteRole => 'Eliminar rol';

  @override
  String get guildSettingsRolesBackToRoles => 'Volver a roles';

  @override
  String get guildSettingsBackToSettings => 'Volver a la configuración';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Editar \"$name\"';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Configurar ajustes y permisos de roles';

  @override
  String get guildSettingsRolesDisplaySection => 'Mostrar';

  @override
  String get guildSettingsRolesRoleName => 'Nombre del rol';

  @override
  String get guildSettingsRolesRoleColor => 'Color del rol';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Escribe un color (hex, rgb(), hsl() o nombre) o usa el selector.';

  @override
  String get guildSettingsRolesShowSeparately =>
      'Mostrar este rol por separado';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Muestra a los miembros con este rol en su propia sección en la lista de miembros.';

  @override
  String get guildSettingsRolesAllowMentions =>
      'Permitir menciones para este rol';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'Los miembros con el permiso \"$permission\" siempre podrán mencionar roles, sin importar esta configuración.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Usa este botón para borrar rápidamente todos los permisos.';

  @override
  String get guildSettingsRolesClearPermissions => 'Borrar permisos';

  @override
  String get guildSettingsRolesPermissionsSection => 'Permisos';

  @override
  String get guildSettingsRolesSearchPermissions => 'Buscar permisos';

  @override
  String get guildSettingsRolesDenseLayout => 'Interfaz densa';

  @override
  String get guildSettingsRolesComfyLayout => 'Interfaz cómoda';

  @override
  String get guildSettingsRolesSwitchToDenseLayout =>
      'Cambiar a diseño compacto';

  @override
  String get guildSettingsRolesSwitchToComfyLayout => 'Cambiar a diseño cómodo';

  @override
  String get guildSettingsRolesSingleColumn => 'Una columna';

  @override
  String get guildSettingsRolesTwoColumns => 'Dos columnas';

  @override
  String get guildSettingsRolesSwitchToSingleColumn => 'Cambiar a una columna';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => 'Cambiar a dos columnas';

  @override
  String get guildSettingsRolesNoPermissionsFound =>
      'No se encontraron permisos';

  @override
  String get guildSettingsRolesCustomHoistOrder =>
      'Orden personalizado para mostrar roles';

  @override
  String get guildSettingsRolesHoistOrder => 'Orden de jerarquía';

  @override
  String get guildSettingsRolesResetHoistOrder =>
      'Restablecer a predeterminado';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Arrastra los roles para personalizar el orden en que aparecen en la lista de miembros.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'No hay roles destacados. Habilita \"Mostrar este rol por separado\" en un rol para verlo aquí.';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'No puedes editar este rol porque es tu rol más alto o está por encima de ti';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Necesitas el permiso \"$permission\" para editar estos permisos';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'No puedes editar un rol que sea igual o superior a tu rol más alto';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'No puedes otorgar un permiso que no tienes';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'No puedes eliminar este permiso porque te lo quitarías a ti mismo';

  @override
  String get guildSettingsRolesUpdatedSuccess =>
      'Roles actualizados correctamente';

  @override
  String get guildSettingsRolesCreatedSuccess => 'Rol creado con éxito';

  @override
  String get guildSettingsRolesDeletedSuccess => 'Rol eliminado con éxito';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'Orden de jerarquía restablecida a la predeterminada';

  @override
  String get guildSettingsRolesNameRequiredTitle =>
      'El nombre del rol es obligatorio';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Asigna un nombre al rol antes de guardar.';

  @override
  String get guildSettingsRolesCreateFailedTitle => 'No se pudo crear el rol';

  @override
  String get guildSettingsRolesUpdateFailedTitle =>
      'No se pudieron actualizar los roles';

  @override
  String get guildSettingsRolesDeleteFailedTitle =>
      'No se pudo eliminar el rol';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return 'No se pudo eliminar \"$name\". Intenta de nuevo.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'No se pudo restablecer el orden de elevación';

  @override
  String get guildSettingsRolesTryAgainInAMoment =>
      'Intenta de nuevo en un momento.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return '¿Seguro que quieres eliminar el rol $name? Los miembros con este rol ya no lo tendrán.';
  }

  @override
  String get permissionCategoryCommunityWide => 'De toda la comunidad';

  @override
  String get permissionCategoryMessagesMedia =>
      'Mensajes y contenido multimedia';

  @override
  String get permissionCategoryModeration => 'Moderación';

  @override
  String get permissionCategoryChannelAccess => 'Acceso al canal';

  @override
  String get permissionCategoryChannelManagement => 'Gestión de canales';

  @override
  String get permissionCategoryAudioVideo => 'Audio y video';

  @override
  String get permissionUnknown => 'Permiso desconocido';

  @override
  String get permissionAdministrator => 'Administrador';

  @override
  String get permissionAdministratorDescription =>
      'Otorga todos los permisos y omite las restricciones del canal. Muy delicado.';

  @override
  String get permissionViewActivityLog => 'Ver registro de actividad';

  @override
  String get permissionViewActivityLogDescription =>
      'Leer el registro de actividad de la comunidad sobre cambios y acciones de moderación.';

  @override
  String get permissionManageCommunity => 'Administrar comunidad';

  @override
  String get permissionManageCommunityDescription =>
      'Edita la configuración global, como el nombre, la descripción y el ícono.';

  @override
  String get permissionManageRoles => 'Administrar roles';

  @override
  String get permissionManageRolesDescription =>
      'Crea, edita o elimina roles por debajo de tu rol más alto. También permite editar la anulación de permisos del canal.';

  @override
  String get permissionManageChannels => 'Administrar canales';

  @override
  String get permissionManageChannel => 'Gestionar canal';

  @override
  String get permissionManageChannelDescription =>
      'Cambia el nombre y edita los ajustes de este canal.';

  @override
  String get permissionManagePermissions => 'Gestionar permisos';

  @override
  String get permissionManagePermissionsDescription =>
      'Edita los permisos de roles y miembros en este canal.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Crea, edita o elimina webhooks para este canal.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Ver la lista de miembros de este canal.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Administra los enlaces de invitación para este canal.';

  @override
  String get permissionOverwriteDeny => 'Negar';

  @override
  String get permissionOverwriteInherit => 'Heredar (por defecto)';

  @override
  String get permissionOverwriteAllow => 'Permitir';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Usa estos botones para configurar rápidamente todos los permisos.';

  @override
  String get permissionManageChannelsDescription =>
      'Crear, editar o eliminar canales y categorías.';

  @override
  String get permissionKickMembers => 'Expulsar miembros';

  @override
  String get permissionBanMembers => 'Banear miembros';

  @override
  String get permissionCreateInviteLinks => 'Crear enlaces de invitación';

  @override
  String get permissionChangeOwnNickname => 'Cambiar mi apodo';

  @override
  String get permissionChangeOwnNicknameDescription =>
      'Actualiza tu propio apodo.';

  @override
  String get permissionManageNicknames => 'Administrar apodos';

  @override
  String get permissionManageNicknamesDescription =>
      'Cambiar los apodos de otros miembros.';

  @override
  String get permissionCreateEmojiStickers => 'Crear emojis y stickers';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Sube nuevos emojis y stickers, y administra tus propias creaciones.';

  @override
  String get permissionManageEmojiStickers => 'Administrar emojis y stickers';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Editar o eliminar emojis y stickers creados por otros miembros.';

  @override
  String get permissionManageWebhooks => 'Administrar webhooks';

  @override
  String get permissionManageWebhooksDescription =>
      'Crear, editar o eliminar webhooks.';

  @override
  String get permissionSendMessages => 'Enviar mensajes';

  @override
  String get permissionSendTtsMessages => 'Enviar mensajes de texto a voz';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Enviar mensajes de texto a voz.';

  @override
  String get permissionManageMessages => 'Administrar mensajes';

  @override
  String get permissionManageMessagesDescription =>
      'Eliminar mensajes de otros miembros. Fijar mensajes se controla por separado.';

  @override
  String get permissionPinMessages => 'Fijar mensajes';

  @override
  String get permissionEmbedLinks => 'Integrar enlaces';

  @override
  String get permissionAttachFiles => 'Adjuntar archivos';

  @override
  String get permissionMentionEveryone => 'Usa @everyone/@here y @rol';

  @override
  String get permissionMentionEveryoneDescription =>
      'Mencionar a todos o a cualquier rol (incluso si el rol no está configurado para ser mencionable).';

  @override
  String get permissionUseExternalEmoji => 'Usar emojis externos';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Usar emojis de otras comunidades.';

  @override
  String get permissionUseExternalStickers => 'Usar stickers externos';

  @override
  String get permissionAddReactions => 'Añadir reacciones';

  @override
  String get permissionAddReactionsDescription =>
      'Agrega reacciones nuevas a los mensajes.';

  @override
  String get permissionBypassSlowmode => 'Ignorar modo lento';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Ignorar límites de mensajes por canal.';

  @override
  String get permissionTimeOutMembers => 'Poner miembros en pausa';

  @override
  String get permissionTimeOutMembersDescription =>
      'Evita que los miembros envíen mensajes, reaccionen y se unan a chats de voz durante un tiempo.';

  @override
  String get permissionViewChannel => 'Ver canal';

  @override
  String get permissionViewChannelMembers => 'Ver miembros del canal';

  @override
  String get permissionViewChannelMembersDescription =>
      'Ver la lista de miembros de los canales en esta comunidad.';

  @override
  String get permissionConnect => 'Conectar';

  @override
  String get permissionSpeak => 'Hablar';

  @override
  String get permissionStreamVideo => 'Transmitir video';

  @override
  String get permissionUseVoiceActivity => 'Usar actividad de voz';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Sin este permiso, se requiere pulsar para hablar.';

  @override
  String get permissionPrioritySpeaker => 'Priorizar altavoz';

  @override
  String get permissionMuteMembers => 'Silenciar miembros';

  @override
  String get permissionDeafenMembers => 'Ensordecer miembros';

  @override
  String get permissionMoveMembers => 'Mover miembros';

  @override
  String get permissionMoveMembersDescription =>
      'Arrastra miembros entre canales a los que puedan acceder.';

  @override
  String get permissionSetVoiceRegion => 'Establecer región de voz';

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
  String get auditLogActionMemberBanAdd => 'Miembro baneado';

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
      'Contenido para adultos habilitado.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Contenido para adultos deshabilitado.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Se estableció el apodo a $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Se eliminó el apodo $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Se ha silenciado al miembro.';

  @override
  String get auditLogChangeUnmutedMember => 'Se dejó de silenciar al miembro.';

  @override
  String get auditLogChangeDeafenedMember => 'Se ha ensordecido al miembro.';

  @override
  String get auditLogChangeUndeafenedMember =>
      'Se ha reactivado el sonido del miembro.';

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
      'Gestiona los webhooks que publican mensajes en los canales.';

  @override
  String get guildSettingsWebhooksEmpty => 'No hay webhooks configurados.';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'Esta comunidad aún no tiene webhooks. Ve a $channelSettingsPath para crear uno.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'Necesitas el permiso \"$permission\" para ver y editar los webhooks de esta comunidad.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle =>
      'No se pudieron cargar los webhooks';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'Hubo un error al cargar los webhooks. Intenta de nuevo.';

  @override
  String get guildSettingsWebhooksUpdated => 'Webhooks actualizados';

  @override
  String get guildSettingsWebhooksUpdateFailed =>
      'No se pudieron actualizar los webhooks';

  @override
  String get guildSettingsUnknownChannel => 'Canal desconocido';

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
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'No hay suficientes miembros';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Se requieren al menos $count miembros para solicitar.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Estado:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'Pendiente';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Aprobada';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Rechazado';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Removido';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Motivo: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'Tu comunidad está en Descubrir. Puedes actualizar los detalles de tu publicación abajo o retirarla para eliminarla.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Tu solicitud está pendiente de revisión. Todavía puedes actualizar los detalles de tu anuncio o retirar la solicitud.';

  @override
  String get guildSettingsDiscoveryCategory => 'Categoría';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Elige la categoría que mejor describa tu comunidad. Puedes cambiarla en cualquier momento.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Idioma principal';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'El idioma que la mayoría de tu comunidad habla. Se usa para filtrar los resultados de Descubrir.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Descripción';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Describe de qué trata tu comunidad';

  @override
  String get guildSettingsDiscoveryDescriptionRequired =>
      'Se requiere una descripción.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'La descripción debe tener al menos $minLength caracteres.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'La descripción no puede tener más de $maxLength caracteres.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Etiquetas personalizadas';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Hasta $maxTags etiquetas ayudan a la gente a encontrar tu comunidad. Aparecen en la búsqueda de Descubrimiento.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'juegos, arte, música';

  @override
  String get guildSettingsDiscoveryAddTag => 'Añadir';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Eliminar etiqueta $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle =>
      'No se pudo añadir la etiqueta';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'Las etiquetas deben tener entre 2 y $maxLength caracteres alfanuméricos.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'Solo puedes añadir hasta $maxTags etiquetas.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Enviar solicitud';

  @override
  String get guildSettingsDiscoverySave => 'Guardar';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Retirar';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Solicitud de descubrimiento enviada';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Lista de descubrimiento actualizada';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Solicitud de descubrimiento retirada';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'No se pudo retirar la solicitud';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Intenta de nuevo en un momento.';

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
  String get guildMembersRecentTitle => 'Miembros recientes';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Mostrando $displayedCount de $totalCount miembros en total';
  }

  @override
  String get guildMembersSort => 'Ordenar';

  @override
  String get guildSettingsMembersSortNewest => 'Más recientes primero';

  @override
  String get guildMembersSortOldest => 'Más antiguo primero';

  @override
  String get guildMembersColumnName => 'Nombre';

  @override
  String get guildMembersColumnMemberSince => 'Miembro desde';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'Unido a $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Método de ingreso';

  @override
  String get guildMembersColumnRoles => 'Roles';

  @override
  String get guildMembersColumnActions => 'Acciones';

  @override
  String get guildMembersFilterMemberSince =>
      'Filtrar por antigüedad de miembro';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Filtrar por fecha de creación de cuenta';

  @override
  String get guildMembersFilterJoinMethod => 'Filtrar por método de unión';

  @override
  String get guildMembersFilterRoles => 'Filtrar por roles';

  @override
  String get guildMembersFilterAll => 'Todos';

  @override
  String get guildMembersFilterPast1Hour => 'Última hora';

  @override
  String get guildMembersFilterPast24Hours => 'Últimas 24 horas';

  @override
  String get guildMembersFilterPast7Days => 'Últimos 7 días';

  @override
  String get guildMembersFilterPast2Weeks => 'Últimas 2 semanas';

  @override
  String get guildMembersFilterPast3Weeks => 'Últimas 3 semanas';

  @override
  String get guildMembersFilterPast4Weeks => 'Últimas 4 semanas';

  @override
  String get guildMembersFilterPast3Months => 'Últimos 3 meses';

  @override
  String get guildMembersFilterCustomRange => 'Rango personalizado...';

  @override
  String get guildMembersDateRangeTitle => 'Rango de fechas personalizado';

  @override
  String get guildMembersDateAfter => 'Después de la fecha';

  @override
  String get guildMembersDateBefore => 'Antes de la fecha';

  @override
  String get guildMembersClearAll => 'Borrar todo';

  @override
  String get guildMembersRowsPerPage => 'Filas por página';

  @override
  String get guildMembersEmptySearch => 'Nadie coincide con esa búsqueda.';

  @override
  String get guildMembersLoadError =>
      'Hubo un error al cargar a los miembros. Intenta de nuevo más tarde.';

  @override
  String get guildMembersIndexing => 'Indexando miembros…';

  @override
  String get guildMembersGoToPage => 'Ir a la página';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'Ir a la página $page';
  }

  @override
  String get guildMembersJumpToPage => 'Ir a la página';

  @override
  String get guildMembersJoinSourceCreator => 'Creador de la comunidad';

  @override
  String get guildMembersJoinSourceInvite => 'Invitar';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Invitar ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Invitado por $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'URL personalizada';

  @override
  String get guildMembersJoinSourceBotInvite => 'Invitar bot';

  @override
  String get guildMembersJoinSourcePlatformAdmin =>
      'Administrador de plataforma';

  @override
  String get guildMembersJoinSourceDiscovery => 'Descubrimiento';

  @override
  String get guildMembersJoinMethodUnknown => 'Desconocido';

  @override
  String get guildMembersCommunityOwner => 'Propietario de la comunidad';

  @override
  String get guildMembersViewAllRoles => 'Ver todos los roles';

  @override
  String get guildMembersJoinedJustNow => 'Justo ahora';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace # minutos',
      one: 'hace 1 minuto',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hace # horas',
      one: 'Hace 1 hora',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace # días',
      one: 'hace 1 día',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Miembros';

  @override
  String get guildMembersChannelListSelected => 'Miembros, seleccionados';

  @override
  String get guildSettingsInvitesTitle => 'Invitaciones';

  @override
  String get guildSettingsInvitesDescription =>
      'Ve y revoca los enlaces de invitación activos.';

  @override
  String get guildSettingsInvitesEmpty => 'No hay invitaciones activas.';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Esta comunidad aún no tiene enlaces de invitación. Ve a un canal y crea una invitación para invitar a personas.';

  @override
  String get guildSettingsInvitesLoadFailedTitle =>
      'No se pudieron cargar las invitaciones';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Hubo un error al cargar las invitaciones. Intenta de nuevo.';

  @override
  String get guildSettingsInvitesTryAgain => 'Intentar de nuevo';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Mostrar fecha de creación en lugar de la fecha de caducidad';

  @override
  String get guildSettingsInvitesPauseInvites => 'Pausar invitaciones';

  @override
  String get guildSettingsInvitesEnableInvites => 'Habilitar invitaciones';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Pausar invitaciones para esta comunidad';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Habilitar invitaciones para esta comunidad';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      '¿Pausar invitaciones? Los usuarios nuevos no podrán unirse a través de enlaces de invitación hasta que los vuelvas a habilitar. Los miembros existentes no se verán afectados.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      '¿Habilitar invitaciones? Los usuarios podrán unirse a esta comunidad a través de enlaces de invitación de nuevo.';

  @override
  String get guildSettingsInvitesPause => 'Pausar';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Las invitaciones están pausadas para esta comunidad.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Las invitaciones están en pausa porque $productName detectó un posible ataque. Los usuarios nuevos no pueden unirse en este momento.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Quien invita:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Canal:';

  @override
  String get guildSettingsInvitesLabelCode => 'Código:';

  @override
  String get guildSettingsInvitesLabelUses => 'Usos:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Creado:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Expira:';

  @override
  String get guildSettingsInvitesUnknown => 'Desconocido';

  @override
  String get guildSettingsInvitesNoCategory => 'Sin categoría';

  @override
  String get guildSettingsInvitesExpired => 'Expirado';

  @override
  String get guildSettingsInvitesNever => 'Nunca';

  @override
  String get guildSettingsInvitesCopyLink => 'Copiar enlace de invitación';

  @override
  String get guildSettingsInvitesRevoke => 'Revocar invitación';

  @override
  String get guildSettingsInvitesRevokeFailedTitle =>
      'No se pudo revocar la invitación';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'Es posible que el enlace siga funcionando. Intenta de nuevo en un momento.';

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
      'Ver y gestionar los usuarios baneados.';

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
  String get guildSettingsRevokeBanTitle => 'Revocar ban';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return '¿Estás seguro de que quieres revocar el ban de $displayName? Podrá volver a unirse a la comunidad.';
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
      'Gestiona el perfil, los canales y la configuración predeterminada de tu comunidad.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Marca';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Actualiza tu ícono, nombre, banner y fondo de invitación';

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
  String get guildSettingsEmojiSlotsTitle => 'Espacios para emojis';

  @override
  String get guildSettingsEmojiDropZone =>
      'Arrastra y suelta los archivos de emojis aquí';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'No se pudieron cargar los emojis. Intenta de nuevo más tarde.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'No se encontraron emojis que coincidan con tu búsqueda.';

  @override
  String get guildSettingsEmojiNoSlots =>
      'No hay espacios disponibles para emojis';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Alcanzaste el número máximo de emojis. Elimina algunos emojis existentes para hacer espacio.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Los nombres de los emojis deben tener al menos 2 caracteres y pueden usar letras, números y guiones bajos. Los emojis deben ser inferiores a $maxSize. Las imágenes estáticas se redimensionan automáticamente a 128x128 píxeles y se comprimen. Los emojis animados y los SVG ya deben cumplir con el límite.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'Subiendo emojis';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# emojis',
      one: '# emoji',
    );
    return 'Subiendo $_temp0. Esto podría tardar un poco.';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'No se pudieron subir los emojis. Intenta de nuevo.';

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'No se pudieron añadir algunos emojis';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'Revisa estos archivos e inténtalo de nuevo con imágenes más pequeñas o sencillas.';

  @override
  String get guildSettingsEmojiRenameTitle => 'Renombrar emoji';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2-32 caracteres, letras, números, guiones bajos.';

  @override
  String get guildSettingsEmojiColumnEmoji => 'Emoji';

  @override
  String get guildSettingsEmojiColumnName => 'Nombre';

  @override
  String get guildSettingsEmojiColumnUploader => 'Subido por';

  @override
  String get guildSettingsEmojiUnknownUploader => 'Desconocido';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Eliminar emoji';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return '¿Eliminar :$name:? No se puede deshacer.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Borrar este emoji del almacenamiento y la CDN';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'El nombre del emoji debe tener al menos 2 caracteres';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'El nombre del emoji debe tener 32 caracteres como máximo';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Nombre de emoji no válido';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'No se pudo cambiar el nombre de este emoji';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'El nombre se revirtió a como estaba antes. Intenta de nuevo en un momento.';

  @override
  String get guildSettingsEmojiGoneTitle => 'Este emoji ya no existe';

  @override
  String get guildSettingsEmojiGoneBody =>
      'Es posible que se haya eliminado. El nombre volvió a ser el que tenía antes.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'No puedes cambiar el nombre de este emoji';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'No tienes permiso para cambiar el nombre de este emoji. El nombre se restableció al que tenía antes.';

  @override
  String get guildSettingsEmojiRateLimitedTitle => 'Vas demasiado rápido';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'Espera un momento e intenta cambiar el nombre de nuevo.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'No se pudo eliminar este emoji';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'No puedes eliminar este emoji';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'Permitir que otros clonen tus emojis';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'Cuando está activado, los miembros de otras comunidades pueden usar el atajo de \"Clonar\" con un solo clic en la app para tus emojis personalizados. Esto no evita que guarden la imagen y la suban ellos mismos.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Permitir que otros clonen tus stickers';

  @override
  String get guildSettingsCloneStickerDescription =>
      'Cuando está activado, los miembros de otras comunidades pueden usar el atajo de \"Clonar\" con un solo clic en la app para tus stickers personalizados. Esto no evita que guarden la imagen y la suban ellos mismos.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Solo los miembros con el permiso \"$permission\" pueden cambiar esto.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'No se pudo actualizar la clonación de emojis';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'No se pudo actualizar la clonación de stickers';

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
  String get guildSettingsStickerSlotsTitle => 'Espacios para stickers';

  @override
  String get guildSettingsStickerUploadTitle => 'Subir sticker';

  @override
  String get guildSettingsStickerDropZone =>
      'Arrastra y suelta un archivo de sticker aquí (uno a la vez)';

  @override
  String get guildSettingsStickerDensity => 'Densidad de stickers';

  @override
  String get guildSettingsStickerDensityCozy => 'Acogedor';

  @override
  String get guildSettingsStickerDensityCompact => 'Compacto';

  @override
  String get guildSettingsStickersLoadFailedTitle =>
      'No se pudieron cargar los stickers';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Hubo un error al cargar los stickers. Intenta de nuevo.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'No se encontraron stickers que coincidan con tu búsqueda.';

  @override
  String get guildSettingsStickersEmptySearch => 'No se encontraron stickers';

  @override
  String get guildSettingsStickerNoSlots =>
      'No hay espacios disponibles para stickers';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Alcanzaste el número máximo de stickers. Elimina algunos stickers existentes para liberar espacio.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Los stickers se guardan en 320x320 píxeles y deben ser inferiores a $maxSize. Las imágenes estáticas se redimensionan y comprimen automáticamente. Los stickers animados y los SVG ya deben cumplir con el límite.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle =>
      'Archivo de sticker no compatible';

  @override
  String get guildSettingsStickerAddTitle => 'Añadir sticker';

  @override
  String get guildSettingsStickerEditTitle => 'Editar sticker';

  @override
  String get guildSettingsStickerNameLabel => 'Nombre';

  @override
  String get guildSettingsStickerNameHint => 'Mi sticker increíble';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Descripción';

  @override
  String get guildSettingsStickerDescriptionHint => 'Describe el sticker';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Etiquetas ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Agregar una etiqueta';

  @override
  String get guildSettingsStickerTagAdd => 'Añadir';

  @override
  String get guildSettingsStickerNameRequired => 'Se requiere un nombre';

  @override
  String get guildSettingsStickerNameTooShort =>
      'El nombre debe tener al menos 2 caracteres';

  @override
  String get guildSettingsStickerNameTooLong =>
      'El nombre debe tener 30 caracteres o menos';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'La descripción debe tener 500 caracteres o menos';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'No se pudo crear este sticker';

  @override
  String get guildSettingsStickerTooLargeTitle =>
      'El sticker es demasiado grande';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'No se pudo comprimir el sticker lo suficiente';

  @override
  String get guildSettingsStickerDeleteTitle => 'Eliminar sticker';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return '¿Eliminar \"$name\"? No se puede deshacer.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Eliminar este sticker del almacenamiento y la CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'No se pudo eliminar este sticker';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'No puedes eliminar esta pegatina';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Crea webhooks desde la configuración del canal. Edítalos aquí.';
  }

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
  String get guildSettingsInvitesTableExpires => 'Expira';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtrar por usuario';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtrar por acción';

  @override
  String get createDm => 'Crear chat privado';

  @override
  String get createGroupDm => 'Crear chat privado grupal';

  @override
  String get createDmNewMessage => 'Nuevo mensaje';

  @override
  String get createDmSelectFriends => 'Seleccionar amigos';

  @override
  String get createDmChooseFriendsSubtitle =>
      'Seleccionar amigos para enviar un mensaje.';

  @override
  String get createDmSearchFriends => 'Buscar amigos';

  @override
  String get createDmNoFriendsFound => 'No se encontraron amigos';

  @override
  String get createDmNoFriendsYet => 'Aún no tienes amigos';

  @override
  String get createDmClaimToStartDms =>
      'Reclama tu cuenta para empezar a usar los chats privados.';

  @override
  String get createDmVerifyToStartDms =>
      'Verifica tu correo electrónico para empezar a usar los chats privados.';

  @override
  String get createDmVerifyYourEmail => 'Verifica tu correo electrónico';

  @override
  String get createDmNewGroup => 'Nuevo grupo';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Crear un grupo nuevo con $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'Confirmar nuevo grupo';

  @override
  String get createDmCreateNewGroup => 'Crear nuevo grupo';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'Eliminar a $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'Ya tienes un grupo con estos usuarios. ¿Realmente quieres crear uno nuevo? ¡Eso también está genial!';

  @override
  String get createDmNoActivityYet => 'Aún no hay actividad';

  @override
  String get createDmSomeUsersCantBeAdded =>
      'No se puede añadir a algunos usuarios';

  @override
  String get createDmCreateWithoutThem => 'Crear sin ellos';

  @override
  String get createDmUnaddableIntro =>
      'Las siguientes personas no se pueden añadir a este chat privado grupal:';

  @override
  String createDmUnaddableProceed(int count) {
    return '¿Crear el chat privado grupal con los $count destinatario(s) restante(s) y omitir a los demás?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'No quedan destinatarios para crear un chat privado grupal.';

  @override
  String get createDmUnaddableUserNotFound => 'Usuario no encontrado';

  @override
  String get createDmUnaddableBlocked =>
      'No puedes enviar mensajes a este usuario';

  @override
  String get createDmUnaddableNotFriends => 'No está en tu lista de amigos';

  @override
  String get createDmUnaddableGroupDisabled =>
      'No permite ser añadido a chats privados grupales';

  @override
  String get createDmFailed =>
      'No se pudo crear la conversación. Inténtalo de nuevo.';

  @override
  String get dmListMessagesTitle => 'Mensajes';

  @override
  String get dmListDirectMessagesTitle => 'Chats privados';

  @override
  String get keybindsSearchShortcuts => 'Buscar atajos';

  @override
  String get keybindSectionDefaults => 'Predeterminados';

  @override
  String get keybindSectionMessages => 'Mensajes';

  @override
  String get keybindSectionNavigation => 'Navegación';

  @override
  String get keybindSectionDragAndDrop => 'Arrastrar y soltar';

  @override
  String get keybindSectionChat => 'Chat';

  @override
  String get keybindSectionVoiceAndVideo => 'Voz y video';

  @override
  String get keybindSectionMisc => 'Varios';

  @override
  String get keybindActionShowShortcutsList =>
      'Mostrar lista de atajos de teclado';

  @override
  String get keybindActionCopyText => 'Copiar texto';

  @override
  String get keybindActionMarkUnread => 'Marcar como no leído';

  @override
  String get keybindActionFocusTextarea => 'Enfocar área de texto';

  @override
  String get keybindActionSwitchCommunities => 'Cambiar entre comunidades';

  @override
  String get keybindActionSwitchChannels => 'Cambiar de canal';

  @override
  String get keybindActionHistoryBack =>
      'Retroceder en el historial de canales vistos';

  @override
  String get keybindActionHistoryForward =>
      'Avanzar en el historial de canales vistos';

  @override
  String get keybindActionJumpUnreadChannels =>
      'Saltar entre canales no leídos';

  @override
  String get keybindActionJumpMentionChannels =>
      'Saltar entre canales no leídos con menciones';

  @override
  String get keybindActionJumpCurrentCall => 'Ir a la llamada actual';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Alternar entre la última comunidad y los MD';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Cambiar a la comunidad o MD anteriores';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Cambiar a la siguiente comunidad o MD';

  @override
  String get keybindActionGoToDms => 'Ir a Mensajes directos';

  @override
  String get keybindActionGoToFirstCommunity => 'Ir a la primera comunidad';

  @override
  String get keybindActionGoToSecondCommunity => 'Ir a la segunda comunidad';

  @override
  String get keybindActionGoToThirdCommunity => 'Ir a la tercera comunidad';

  @override
  String get keybindActionGoToFourthCommunity => 'Ir a la cuarta comunidad';

  @override
  String get keybindActionGoToFifthCommunity => 'Ir a la quinta comunidad';

  @override
  String get keybindActionGoToSixthCommunity => 'Ir a la sexta comunidad';

  @override
  String get keybindActionGoToSeventhCommunity => 'Ir a la séptima comunidad';

  @override
  String get keybindActionGoToEighthCommunity => 'Ir a la octava comunidad';

  @override
  String get keybindActionToggleQuickSwitcher => 'Alternar el cambio rápido';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'Crear o unirte a una comunidad';

  @override
  String get keybindActionStartDragAndDrop => 'Iniciar arrastrar y soltar';

  @override
  String get keybindActionMove => 'Mover';

  @override
  String get keybindActionDropItem => 'Soltar objeto';

  @override
  String get keybindActionCancel => 'Cancelar';

  @override
  String get keybindActionMarkCommunityRead => 'Marcar comunidad como leída';

  @override
  String get keybindActionMarkChannelRead => 'Marcar canal como leído';

  @override
  String get keybindActionStartGroupDm => 'Iniciar un chat grupal';

  @override
  String get keybindActionTogglePinnedMessages => 'Alternar mensajes fijados';

  @override
  String get keybindActionToggleInbox => 'Alternar la bandeja de entrada';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Marcar como leído el canal principal de la bandeja de entrada';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Marcar todos los canales de la bandeja de entrada como leídos';

  @override
  String get keybindActionToggleMemberList =>
      'Alternar la lista de miembros o el chat de voz';

  @override
  String get keybindActionToggleEmojiPicker => 'Alternar el selector de emojis';

  @override
  String get keybindActionToggleGifPicker => 'Alternar el selector de GIF';

  @override
  String get keybindActionToggleStickerPicker =>
      'Alternar el selector de stickers';

  @override
  String get keybindActionScrollChatUp => 'Desplazar el chat hacia arriba';

  @override
  String get keybindActionScrollChatDown => 'Desplazar el chat hacia abajo';

  @override
  String get keybindActionJumpOldestUnread =>
      'Ir al mensaje no leído más antiguo';

  @override
  String get keybindActionFocusComposer => 'Enfocar el área de texto';

  @override
  String get keybindActionUploadFile => 'Subir un archivo';

  @override
  String get keybindActionCopyChannelLink => 'Copiar enlace del canal';

  @override
  String get keybindActionToggleSavedMedia => 'Alternar contenido guardado';

  @override
  String get keybindActionSendVoiceMessage => 'Enviar mensaje de voz';

  @override
  String get keybindActionAnswerCall => 'Responder la llamada entrante';

  @override
  String get keybindActionDeclineCall => 'Rechazar la llamada entrante';

  @override
  String get keybindActionStartDmCall =>
      'Iniciar una llamada en un mensaje directo o grupo';

  @override
  String get keybindActionToggleSoundboard =>
      'Activar/desactivar la soundboard';

  @override
  String get keybindActionToggleCompactCallView =>
      'Expandir o contraer la vista compacta de la llamada';

  @override
  String get keybindActionPushToTalkPriority =>
      'Pulsar para hablar (prioridad)';

  @override
  String get keybindActionVoiceActivityPriority =>
      'Prioridad de actividad de voz';

  @override
  String get keybindActionOpenHelp => 'Abrir ayuda';

  @override
  String get keybindActionSearchMessages => 'Buscar mensajes';

  @override
  String get keybindActionOpenContextMenu => 'Abrir el menú contextual';

  @override
  String get keybindActionOpenSettings => 'Abrir tu configuración';

  @override
  String get keybindActionOpenThemeStudio =>
      'Abrir ventana emergente de estudio de temas';

  @override
  String get keybindActionZoomIn => 'Acercar';

  @override
  String get keybindActionZoomOut => 'Alejar';

  @override
  String get keybindActionZoomReset => 'Restablecer zoom';

  @override
  String get clipboardPasteFailed =>
      'No se pudo pegar. El portapapeles estaba vacío o bloqueado para esta app.';

  @override
  String get homeQuickActionDms => 'Mensajes directos';
}
