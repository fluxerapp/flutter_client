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
  String get nagbarOpenSettings => 'Abrir ajustes';

  @override
  String get systemPermissionSettingsTitle => 'Enable permission';

  @override
  String get systemPermissionSettingsOpenSettings => 'Abrir ajustes';

  @override
  String get systemPermissionMicrophoneMessage =>
      'Fluxer no tiene acceso a tu micrófono. Puedes habilitarlo en los ajustes de privacidad de tu dispositivo.';

  @override
  String get systemPermissionCameraMessage =>
      'Fluxer no tiene acceso a tu cámara. Puedes habilitarla en los ajustes de privacidad de tu dispositivo.';

  @override
  String get systemPermissionPhotosMessage =>
      'Fluxer doesn\'t have access to your photo library. You can enable it in your device privacy settings.';

  @override
  String get systemPermissionNotificationsMessage =>
      'Fluxer no tiene permiso para enviar notificaciones. Puedes habilitarlo en los ajustes de tu dispositivo.';

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Your subscription failed to renew, but you still have access to $productName perks until $graceDate. Take action now or you\'ll lose all perks.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Your $productName subscription has expired. Renew now to keep your perks.';
  }

  @override
  String get nagbarManageSubscription => 'Gestionar suscripción';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Welcome to $productFullName. Explore your $productName perks and manage your subscription.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'Descubrir las ventajas de $productName';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'You have a new gift code waiting in your gift inventory.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'You have $count new gift codes waiting in your gift inventory.';
  }

  @override
  String get nagbarViewGiftInventory => 'Ver inventario de regalos';

  @override
  String get nagbarVisionaryMfa =>
      'Enable two-factor authentication to protect your Visionary account.';

  @override
  String get nagbarEnableMfa => 'Activar autenticación de doble factor';

  @override
  String get nagbarTermsAcceptance =>
      'We\'ve updated our terms. Please review and accept them to continue.';

  @override
  String get nagbarReviewTerms => 'Revisar términos';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Únete a $communityName para hablar con el equipo y mantenerte al día.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Join $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'Activa las notificaciones para no perderte mensajes y menciones.';

  @override
  String get nagbarEnableNotifications => 'Enable notifications';

  @override
  String get nagbarBillingPortalFailed =>
      'Couldn\'t open the billing portal. Please try again in a moment.';

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
  String get registerPendingApproval =>
      'Your account request is pending approval. You can sign in after an admin approves it.';

  @override
  String get registerClosed =>
      'Registration is currently closed. Use a registration link from an admin to create an account.';

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
  String get embedInviteJoinGroup => 'Join group';

  @override
  String get embedInviteAlreadyJoined => 'Already joined';

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
    return 'Visionary (lifetime $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days of $productName',
      one: '1 day of $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count weeks of $productName',
      one: '1 week of $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count months of $productName',
      one: '1 month of $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count years of $productName',
      one: '1 year of $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'From $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'Click to claim your gift!';

  @override
  String get embedGiftAlreadyRedeemed => 'Already redeemed';

  @override
  String get embedGiftClaimAccountHelp =>
      'Claim your account to redeem this gift.';

  @override
  String get embedGiftClaim => 'Claim gift';

  @override
  String get embedGiftClaimed => 'Gift claimed';

  @override
  String get embedGiftClaimAccount => 'Claim account to redeem';

  @override
  String get embedGiftUnknownTitle => 'Unknown gift';

  @override
  String get embedGiftUnknownSubtitle =>
      'This gift code is invalid or already claimed.';

  @override
  String get embedGiftUnavailable => 'Gift unavailable';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Claim your gift to activate your $productName subscription!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'This gift has already been claimed.';

  @override
  String get giftAcceptMaybeLater => 'Maybe later';

  @override
  String get giftRedeemedToast => 'Gift redeemed!';

  @override
  String get giftRedeemInvalidTitle => 'Invalid gift code';

  @override
  String get giftRedeemInvalidMessage =>
      'This code is invalid or already used.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Gift already redeemed';

  @override
  String get giftRedeemAlreadyRedeemedMessage =>
      'This code was already redeemed.';

  @override
  String get giftRedeemNotFoundTitle => 'Gift not found';

  @override
  String get giftRedeemNotFoundMessage => 'This code doesn\'t exist.';

  @override
  String get giftRedeemFailedTitle => 'Failed to redeem gift';

  @override
  String get giftRedeemFailedMessage =>
      'Couldn\'t redeem this gift. Try again.';

  @override
  String get giftVisionaryCannotRedeemTitle => 'Can\'t redeem this gift';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Visionary accounts can\'t redeem Plutonium gifts. Copy the link to share it with a friend instead.';

  @override
  String get giftCopyLink => 'Copy gift link';

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
  String get notificationUseCategoryDefault => 'Use Category Default';

  @override
  String get notificationUseCommunityDefault => 'Use Community Default';

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
      'Delete your messages in this conversation?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'This will permanently delete every message you have ever sent in this conversation. This cannot be undone.';

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
  String get addFriendVerifyToSend =>
      'Verify your email before sending friend requests.';

  @override
  String get addFriendFriendsListFull =>
      'Your friends list is full, or theirs is. Remove someone and try again.';

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
    return 'This is a default emoji on $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'This emoji is from this community. You can use it everywhere.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'This is a custom emoji from a community.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'This is a custom emoji from a community. Ask the author for an invite to use this emoji.';

  @override
  String get emojiInfoFromHeader => 'This emoji is from';

  @override
  String get emojiInfoDiscoverableCommunity => 'Discoverable community';

  @override
  String get emojiInfoPrivateCommunity => 'Private community';

  @override
  String get emojiInfoVerifiedCommunity => 'Verified community';

  @override
  String get emojiInfoAddToFavorites => 'Add to Favorites';

  @override
  String get emojiInfoRemoveFromFavorites => 'Remove from Favorites';

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
      'Protege tu cuenta con autenticación de dos factores y claves de acceso';

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
  String get phoneSearchCountries => 'Search countries...';

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
  String get requiredActionIntroGeneric =>
      'Completa la verificación para continuar utilizando Fluxer.';

  @override
  String get requiredActionIntroPhone =>
      'Tu registro necesita una comprobación anti-spam adicional antes de poder continuar.';

  @override
  String get requiredActionIntroEmailOrPhone =>
      'Verifica tu correo o teléfono para continuar utilizando Fluxer.';

  @override
  String get requiredActionIntroEmailAndPhone =>
      'Complete the required email and phone verification steps below to continue using Fluxer.';

  @override
  String get requiredActionChooseMethodTitle =>
      'Escoge un método de verificación';

  @override
  String get requiredActionChooseMethodDescription =>
      'Completa uno de los siguientes métodos de verificación para continuar utilizando Fluxer.';

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
  String get networkErrorMessage => 'Something went wrong. Please try again.';

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
  String get blockedUsersCopyTag => 'Copiar Nombre de usuario';

  @override
  String get blockedUsersCopyId => 'Copiar ID de usuario';

  @override
  String get userProfileLoadError => 'No se ha podido cargar el perfil';

  @override
  String get userProfileLoading => 'Loading profile';

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
  String get userProfileRoles => 'Roles';

  @override
  String get memberRoleAdd => 'Add role';

  @override
  String memberRoleRemove(String roleName) {
    return 'Remove role $roleName';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'This user has no roles in this community.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'No roles yet. Add roles in $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'No roles available';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'There are no roles to assign in this community at this time, but you can create a new role in $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Community settings';

  @override
  String get guildSettingsRolesTab => 'Roles';

  @override
  String get memberRolesConfirmOk => 'OK';

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
  String get iarReportGuildTitle => 'Reportar comunidad';

  @override
  String get iarReportGuildPreconfirmBody =>
      'If this report is about a specific message in this community, report that message instead. Message reports give our safety team the clearest context, and adding details in the comments can help us review it faster. Only continue with reporting the community as a whole if reporting a message would not capture the broader issue.';

  @override
  String get iarContinueToReportCommunity => 'Continue to report community';

  @override
  String get iarPreviewCommunitySubtitle => 'Comunidad';

  @override
  String get iarReasonHarassmentGuildLabel => 'Acoso o abuso dirigido';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'La comunidad facilita el acoso colectivo o el abuso dirigido.';

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
  String get iarReasonMalwareGuildLabel => 'Distribución de malware';

  @override
  String get iarReasonMalwareGuildDescription =>
      'Distributes malware, credential theft, or harmful files.';

  @override
  String get iarReasonPrivacyGuildLabel => 'Violación de privacidad o doxxing';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'Comparte información personal, acosa a usuarios o coordina abusos contra la privacidad.';

  @override
  String get iarReasonSelfHarmGuildLabel => 'Fomenta la autolesión';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'Encourages suicide, self-harm, or eating disorders.';

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
  String get slowmodeStatusEnabled => 'Slowmode is enabled';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Slowmode is active ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'Slowmode is set to $durationLabel, but you are immune.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Slowmode is set to $durationLabel. Wait before sending another message.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Slowmode is set to $durationLabel for this channel.';
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
  String get voiceMessageSeekForward => 'Seek forward';

  @override
  String get voiceMessageSeekBackward => 'Seek backward';

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
  String get chatAttachmentDownloadedToast => 'Saved to photos';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Couldn\'t download attachment';

  @override
  String get chatAttachmentExpiredTooltip => 'Archivo adjunto caducado';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Expand ($count lines)',
      one: 'Expand ($count line)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Collapse ($count lines)',
      one: 'Collapse ($count line)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Expand ($count rows)',
      one: 'Expand ($count row)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Collapse ($count rows)',
      one: 'Collapse ($count row)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count lines left)',
      one: '... ($count line left)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count rows left)',
      one: '... ($count row left)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'View whole file';

  @override
  String get chatTextualPreviewChangeLanguage => 'Change language';

  @override
  String get chatTextualPreviewSearchLanguage => 'Search language…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Syntax highlighting';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'No results found';

  @override
  String get chatTextualPreviewMoreOptions => 'More options';

  @override
  String get chatTextualPreviewWrapText => 'Wrap text';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'File is too large for inline preview (limit $previewLimitKb KB).';
  }

  @override
  String get chatTextualPreviewLoadError => 'Unable to load preview.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Plain text';

  @override
  String get chatTextualPreviewCopy => 'Copy';

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
  String get lookAndFeelHdrSectionTitle => 'High dynamic range';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Control how HDR images are displayed on HDR-capable monitors.';

  @override
  String get lookAndFeelHdrFullName => 'Full dynamic range';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Display HDR images at full brightness and color range.';

  @override
  String get lookAndFeelHdrStandardName => 'Standard range';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Tone-map HDR images to standard range, reducing peak brightness.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'High dynamic range display mode';

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
  String get lookAndFeelChatFontSizeLabel => 'Chat font size';

  @override
  String get lookAndFeelAppZoomTitle => 'App zoom level';

  @override
  String get lookAndFeelAppZoomDescription =>
      'Adjust the application\'s zoom level.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Messages';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Choose how messages are displayed in chat channels.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Space between message groups';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => 'Message display mode';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Comfy';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Spacious layout with clear visual separation between messages.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Dense';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Maximizes visible messages with minimal spacing.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'Hide user avatars';

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
  String get favoritesAddToSavedMedia => 'Add to saved media';

  @override
  String get favoritesRemoveFromSavedMedia => 'Remove from saved media';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Add to URL-only GIF favorites';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Remove from URL-only GIF favorites';

  @override
  String get savedMediaAddTitle => 'Add to saved media';

  @override
  String get savedMediaFormNameLabel => 'Name';

  @override
  String get savedMediaFormNameHint => 'My awesome media';

  @override
  String get savedMediaFormAltTextLabel => 'Alt text';

  @override
  String get savedMediaFormAltTextHint => 'Describe the media';

  @override
  String get savedMediaFormTagsLabel => 'Tags';

  @override
  String get savedMediaFormTagsHint => 'funny, reaction, work';

  @override
  String get savedMediaSaveError => 'Could not update saved media.';

  @override
  String get savedMediaNameRequired => 'Name is required.';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'How should we save your GIF favorites?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'You can store starred GIFs as URL-only favorites or upload them to your saved media. Pick the one that fits how you use them. You can change it any time in Settings > Advanced > Media.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'URL-only favorites (default): synced across your devices, no upload, doesn\'t count against saved media. The original media may disappear if its host removes it.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Saved media: uploaded, taggable, searchable, and persistent, but counts against your saved media limit.';

  @override
  String get gifFavoriteFirstTimeHint => 'We\'ll only ask once.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly => 'Use URL-only (recommended)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => 'Use saved media';

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
  String get accessibilitySaturationTitle => 'Saturación';

  @override
  String get accessibilitySaturationDescription =>
      'Adjust how vivid theme colors appear across the app.';

  @override
  String get accessibilityVisualGroupTitle => 'Visual';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel => 'Always underline links';

  @override
  String get accessibilityDimStrikethroughTextLabel => 'Dim strikethrough text';

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
  String get accessibilityScreenReaderGroupTitle => 'Screen reader';

  @override
  String get accessibilityScreenReaderGroupDescription =>
      'Control how Fluxer works with screen readers.';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Announce new messages';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Let screen readers announce new messages as they arrive in the open channel. Notification sounds are unaffected.';

  @override
  String get accessibilityTtsGroupTitle => 'Text-to-speech';

  @override
  String get accessibilityTtsGroupDescription =>
      'Choose a speed for spoken text.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Speech playback speed';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Play sample';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Silence sample';

  @override
  String get accessibilityPreviewButtonLabel => 'Preview button';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'This shows how links appear: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Preview User';

  @override
  String get accessibilityKeyboardGroupTitle => 'Keyboard';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Show focus ring on chat textarea';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'Escape key exits keyboard mode';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Show context menu shortcuts';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Confirm before starting calls';

  @override
  String get accessibilityAnimationGroupTitle => 'Animation';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'Reduced motion is on, so content animations are paused by default. You can still turn any of these back on to keep it playing.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel => 'Play animated emojis';

  @override
  String get accessibilityAutoPlayGifsMobileLabel => 'Automatically play GIFs';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'Automatically play GIFs when $productName is focused';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Playing despite reduced motion.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Paused by reduced motion. Turn on to keep animated emojis playing.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Paused by reduced motion. Turn on to keep GIFs playing.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'Defaults to off on mobile to preserve battery life and data usage.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Sticker animations';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Sticker animation preference';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Always animate';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Stickers will always animate';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Animate on interaction';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Stickers will animate when you press them';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Stickers will animate when you hover or interact with them';

  @override
  String get accessibilityStickerNeverAnimateName => 'Never animate';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Stickers will never animate';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Always animating despite reduced motion.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'Reduced motion limits stickers to animate on interaction. Choose always animate to override.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'Defaults to animate on interaction on mobile to preserve battery life.';

  @override
  String get accessibilityMotionGroupTitle => 'Motion';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Sync reduced motion setting with system';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Use this device\'s system reduced motion preference, or customize it below.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Reduce motion';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Disable animations and transitions. Currently controlled by your system setting.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Disable animations and transitions throughout the app.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Animated emojis, GIFs and stickers stay under your control in the Animation tab.';

  @override
  String get accessibilityConfirmStartCallTitle => 'Start call?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Are you sure you want to start this call?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Start call';

  @override
  String get accessibilityTtsSampleDescription =>
      'Hear the sample line spoken with your chosen speed.';

  @override
  String get accessibilityTtsSampleText =>
      'Doc, I\'m from the future. I came here in a time machine that you invented. Now, I need your help to get back to the year 1985.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'Speech synthesis is unavailable on this device.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Speech playback failed. Try again, or check that audio output is working.';

  @override
  String get ttsSubstitutionUnknownUser => 'unknown user';

  @override
  String get ttsSubstitutionUnknownRole => 'unknown role';

  @override
  String get ttsSubstitutionUnknownChannel => 'unknown channel';

  @override
  String get ttsSubstitutionCodeBlock => 'code block';

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
    return '$authorName said: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'Replying to $replyAuthorName, $authorName said: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'sent a sticker';

  @override
  String get ttsSentAttachment => 'sent an attachment';

  @override
  String ttsSentAttachments(int count) {
    return 'sent $count attachments';
  }

  @override
  String get ttsSentEmbed => 'sent an embed';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author sent $summary';
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
  String get voiceJoinFailedTitle => 'Couldn\'t Join Voice';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Couldn\'t disconnect your other devices. Try again in a moment.';

  @override
  String get voiceChannelEmptyDescription =>
      'Este es un canal de voz. ¡Conéctate para empezar a hablar!';

  @override
  String get voiceChannelJoin => 'Unirse al canal de voz';

  @override
  String get voiceCallJoin => 'Join call';

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
  String get voiceParticipantModerationFailed =>
      'No se pudo actualizar a ese miembro. Por favor, inténtalo de nuevo.';

  @override
  String get voiceControlChat => 'Chat';

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
  String get voicePrioritizeSpeakersLabel => 'Prioritize speakers';

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
  String get privacyDashboardProfilePrivacySection => 'Profile privacy';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Friends & direct messages';

  @override
  String get privacyDashboardActivitySharingSection => 'Activity sharing';

  @override
  String get privacyDashboardSensitiveContentSection => 'Sensitive content';

  @override
  String get privacyDashboardDataExportSection => 'Data export';

  @override
  String get privacyDashboardDataDeletionSection => 'Data deletion';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Who can see your full profile';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Friends and all communities';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Your full profile is visible to friends and to anyone in your communities';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Friends and small communities only';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Your full profile is visible to friends and members of your communities with 200 or fewer members';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Friends only';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Your full profile is only visible to your friends';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Friend requests';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Everyone';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Allow anyone to send you friend requests';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Friends of Friends';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Allow friends of your friends to send you requests';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Community Members';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Allow members from communities you\'re in to send you requests';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Direct messages';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Allow direct messages from community members';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Allow members from communities you\'re in to send you direct messages';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Allow direct messages from community bots';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Allow bots from communities you\'re in to send you direct messages';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Control who can send you friend requests and direct messages';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Control who can call you and add you to group chats';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Incoming calls';

  @override
  String get privacyDashboardIncomingCallsDesc => 'Control who can call you';

  @override
  String get privacyDashboardAllowedCallers => 'Allowed callers';

  @override
  String get privacyDashboardIncomingCallNobody => 'Nobody';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Block all incoming calls';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Friends Only';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Only allow friends to call you (recommended)';

  @override
  String get privacyDashboardIncomingCallCustom => 'Friends + Custom';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Allow friends plus additional groups you choose';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Everyone';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Allow anyone to call you, even strangers';

  @override
  String get privacyDashboardAdditionalGroups => 'Additional Groups';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'People who are friends with your friends can call you';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'People from communities you\'re both in can call you';

  @override
  String get privacyDashboardRingBehavior => 'Ring Behavior';

  @override
  String get privacyDashboardSilentCalls => 'Silent calls from everyone';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'All calls will notify silently instead of ringing. By default, calls from non-friends are always silent.';

  @override
  String get privacyDashboardGroupDmTitle => 'Who Can Add You to Group Chats';

  @override
  String get privacyDashboardGroupDmDesc =>
      'Control who can add you to group chats without asking. Anyone can still send you invite links to join.';

  @override
  String get privacyDashboardAllowedInvites => 'Allowed invites';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Don\'t let anyone add you to group chats without asking';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Only allow friends to add you without asking (recommended)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Allow friends plus additional groups to add you';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Allow anyone to add you to group chats without asking';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'People who are friends with your friends can add you to group chats';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'People from communities you\'re both in can add you to group chats';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Voice activity on active now';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Share your voice activity with friends';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Share voice activity with all friends?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Stop sharing voice activity with all friends?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'You\'re about to start sharing your voice activity with every friend you have, including future ones. This sends an update to all of them and can only be changed again in 24 hours.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'You\'re about to stop sharing your voice activity with every friend you have, including future ones. This sends an update to all of them and can only be changed again in 24 hours.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Yes, share with all friends';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm => 'Yes, stop sharing';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Available again in $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Voice activity sharing updated';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Couldn\'t update voice activity sharing right now';

  @override
  String get privacyDashboardDataExportDesc =>
      'Build a downloadable archive of your account data, including messages and attachment URLs. Most people want everything, but you can narrow the scope below.';

  @override
  String get privacyDashboardExportMyData => 'Export my data';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Permanently remove messages you have sent across DMs, group DMs, and communities. The work runs in the background, and you will get a DM when it finishes.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Delete my messages';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Allow direct messages from community members?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Block direct messages from community members?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Allow bots to send you direct messages?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Block bots from sending you direct messages?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Do you also want to allow direct messages from members of your existing communities?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Do you also want to block direct messages from members of your existing communities?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Do you also want to allow bots from your existing communities to send you direct messages?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Do you also want to block bots from your existing communities?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'You can also change this setting per-community by long-pressing the community name and selecting Privacy Settings.';

  @override
  String get privacyDashboardDmConfirmAllowAll => 'Allow for all communities';

  @override
  String get privacyDashboardDmConfirmBlockAll => 'Block for all communities';

  @override
  String get privacyDashboardDmConfirmSkip => 'Skip this step';

  @override
  String get privacyDashboardDataRequestGoBack => 'Go back';

  @override
  String get privacyDashboardDataRequestExportTitle => 'Export my data';

  @override
  String get privacyDashboardDataRequestDeleteTitle => 'Delete my messages';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'We\'ll process this as soon as possible. You\'ll get an email when your archive is ready.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'We\'ll process this as soon as possible. You\'ll get a DM from us when it\'s done.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'What to include';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Everything';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Export every message you have ever sent, plus all of your account settings, memberships, and metadata.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'Custom selection';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Choose which conversation kinds, communities, and time window to include in the archive.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Choose what to include';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Pick which kinds of conversations to clean up.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Only places I can\'t access anymore';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Only delete messages from communities and group DMs you have left or been removed from.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Which conversations';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Toggle the kinds of conversations you want included.';

  @override
  String get privacyDashboardDataRequestKindDms => 'Open DMs';

  @override
  String get privacyDashboardDataRequestKindDmsClosed => 'Closed DMs';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'Group DMs';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Communities';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Which communities';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Community filter';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Include all except selected';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude =>
      'Only the selected ones';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'You aren\'t in any communities right now.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Time range';

  @override
  String get privacyDashboardDataRequestDateMode => 'Time range';

  @override
  String get privacyDashboardDataRequestAllTime => 'All time';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Custom range';

  @override
  String get privacyDashboardDataRequestStartDate => 'Start date';

  @override
  String get privacyDashboardDataRequestEndDate => 'End date';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Leave either field blank to leave that end of the window unbounded.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Pick at least one kind of conversation to include.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'Start date must be earlier than end date.';

  @override
  String get privacyDashboardDataRequestConfirmTitle => 'Review and confirm';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'We\'ll build a downloadable archive of every message you have ever sent and email you when it\'s ready. The download link in that email expires after 7 days.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'We\'ll build a downloadable archive that matches the filters below and email you when it\'s ready. The download link in that email expires after 7 days.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Permanently delete the messages that match the filters below. This cannot be undone.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'There is no recovery once this starts. We will DM you when it finishes.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'Request export';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Delete messages';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Scope';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'Conversations';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Communities';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Time range';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'None';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'From $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'Until $end';
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
      other: '# communities',
      one: '# community',
    );
    return 'All except $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# communities',
      one: '# community',
    );
    return 'Only $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Open direct messages';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Closed direct messages';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Direct messages (open and closed)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'Group DMs';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Communities';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# hours',
      one: '# hour',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minutes',
      one: '# minute',
    );
    return '$_temp0 and $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# hours',
      one: '# hour',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minutes',
      one: '# minute',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# seconds',
      one: '# second',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed => 'Failed to load privacy settings';

  @override
  String get privacyDashboardRetry => 'Retry';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Failed to save sensitive content settings.';

  @override
  String get privacyDashboardDataRequestFailed => 'Failed to complete request.';

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
      'Waiting for slowmode in one or more selected channels to expire.';

  @override
  String get slowmodeRateLimitedTitle => 'Slowmode active';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'Slowmode is on — wait $duration before sending another.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'Direct upload is disabled during slowmode.';

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
  String get chatMessageTranslate => 'Translate';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Translated from $language';
  }

  @override
  String get chatMessageSeeOriginal => 'See original';

  @override
  String get chatMessageSeeTranslation => 'See translation';

  @override
  String get chatMessageTranslating => 'Translating…';

  @override
  String get chatMessageTranslateFailed => 'Couldn\'t translate this message.';

  @override
  String get chatMessageTranslateUnavailable =>
      'Translation isn\'t available on this device.';

  @override
  String get chatMessageSpeak => 'Speak message';

  @override
  String get chatMessageStopSpeaking => 'Stop speaking';

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
  String get chatReactionAddFailed => 'Failed to add reaction';

  @override
  String get chatReactionRemoveFailed => 'Failed to remove reaction';

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
  String get chatMessageDeleteAttachment => 'Delete Attachment';

  @override
  String get chatMessageEditAttachmentAltText => 'Edit Alt Text';

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
    return 'Attachment $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Dismiss';

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
  String get channelDetailsGroupSettingsTitle => 'Group Settings';

  @override
  String get channelDetailsDmSettingsTitle => 'Ajustes de MD';

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
  String get channelSettingsResetSlider => 'Reset slider to default value';

  @override
  String get channelSettingsAdvanced => 'Avanzado';

  @override
  String get channelSettingsMatureContentOverride =>
      'Anulación de contenido para adultos';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Override the $scopeLevel-level setting for this channel. Mature content is shown behind a gate before entry.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Inherit';

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
  String get channelMenuDeleteMyMessagesConfirm => 'Eliminar mis mensajes';

  @override
  String get channelMenuDeletedYourMessages => 'Deleted your messages';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'Couldn\'t delete your messages';

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
  String get channelDetailsActionUnmute => 'Unmute';

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
  String get memberListPermissionDeniedTitle => 'You can\'t view members';

  @override
  String get memberListPermissionDeniedBody =>
      'You can\'t view the members of this channel in this community';

  @override
  String get memberListUnavailableTitle => 'Member list unavailable';

  @override
  String get memberListUnavailableBody =>
      'Member lists are temporarily unavailable in this community';

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
  String get channelDetailsSearchTitle => 'Buscar';

  @override
  String get channelDetailsSearchHint => 'Buscar mensajes';

  @override
  String get channelDetailsSearchFilterFrom => 'De';

  @override
  String get channelDetailsSearchFilterHas => 'Tiene';

  @override
  String get channelDetailsSearchFilterIn => 'In';

  @override
  String get channelDetailsSearchFilterMentions => 'Mentions';

  @override
  String get channelDetailsSearchFilterMore => 'More';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Active';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count channels';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count users';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'User';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Bot';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => 'Filter by channel';

  @override
  String get channelDetailsSearchChannelsHint => 'Search channels';

  @override
  String get channelDetailsSearchChannelsEmpty => 'No channels found';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Pinned';

  @override
  String get channelDetailsSearchPinnedTrue => 'Pinned only';

  @override
  String get channelDetailsSearchPinnedFalse => 'Exclude pinned';

  @override
  String get channelDetailsSearchClearFilter => 'Clear';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Author type';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Date';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Date mode';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Pick a date';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Link hostname';

  @override
  String get channelDetailsSearchMoreFiltersFileName => 'Filename contains';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'File extension';

  @override
  String get channelDetailsSearchContentPoll => 'Poll';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'Messages with a poll';

  @override
  String get channelDetailsSearchContentForward => 'Forward';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Forwarded messages';

  @override
  String get channelDetailsSearchFilterSort => 'Ordenar';

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
  String get groupDmGroupName => 'Nombre del grupo';

  @override
  String get groupDmMyGroup => 'Mi grupo';

  @override
  String get groupDmGroupNameMaxLength =>
      'Group name must not exceed 100 characters';

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
  String get composerOpenExpressionPicker => 'Open expression picker';

  @override
  String get composerShowKeyboard => 'Show keyboard';

  @override
  String get composerCloseAttachmentPanel => 'Close attachment picker';

  @override
  String get chatAttachmentPanelPhotos => 'Photos';

  @override
  String get chatAttachmentPanelFiles => 'Files';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Photo library access needed';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Allow photo library access to browse and attach recent photos and videos.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Open settings';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', sending';

  @override
  String get messageAccessibilityFailedSuffix => ', failed to send';

  @override
  String get messageAccessibilityAttachmentSummary => 'an attachment';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count attachments';
  }

  @override
  String get messageAccessibilityImageSummary => 'an image';

  @override
  String get messageAccessibilityVideoSummary => 'a video';

  @override
  String get messageAccessibilityAudioSummary => 'an audio file';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'sticker $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'file $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'a spoiler attachment';

  @override
  String get messageAccessibilityEmbedSummary => 'an embed';

  @override
  String get messageAccessibilityEmptySummary => 'a message';

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
  String get userSettingsSearchPlaceholder => 'Search settings...';

  @override
  String get userSettingsSearchFieldLabel => 'Search settings';

  @override
  String get userSettingsSearchClear => 'Clear search';

  @override
  String get userSettingsSearchNoResults => 'No settings found';

  @override
  String get userSettingsNavProfile => 'Perfil';

  @override
  String get userSettingsNavSecurityLogin => 'Seguridad e inicio de sesión';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Regalos y códigos';

  @override
  String get giftSettingsClaimAccountTitle => 'Claim your account';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Claim your account to redeem or manage Plutonium gift codes.';

  @override
  String get giftSettingsRedeemTitle => 'Redeem a gift';

  @override
  String get giftSettingsRedeemDescription =>
      'Enter a gift code to redeem Plutonium for your account.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Enter gift code…';

  @override
  String get giftSettingsRedeemButton => 'Redeem';

  @override
  String get giftSettingsRedeemSuccess =>
      'Gift redeemed successfully. Enjoy your Plutonium.';

  @override
  String get giftSettingsPurchasedTitle => 'Purchased gifts';

  @override
  String get giftSettingsPurchasedDescription =>
      'Manage your purchased Plutonium gift codes. Share the gift URL with someone special or redeem it for yourself!';

  @override
  String get giftSettingsEmptyTitle => 'No gifts yet';

  @override
  String get giftSettingsEmptyDescription =>
      'Buy a Plutonium gift from the Plutonium tab to share with friends.';

  @override
  String get giftSettingsGoToPlutonium => 'Go to Plutonium';

  @override
  String get giftSettingsLoadFailedTitle => 'Failed to load gift inventory';

  @override
  String get giftSettingsLoadFailedDescription => 'Try again later.';

  @override
  String get giftSettingsTryAgain => 'Try again';

  @override
  String get giftSettingsGiftUrl => 'Gift URL';

  @override
  String get giftSettingsCopy => 'Copy';

  @override
  String get giftSettingsCopied => 'Copied';

  @override
  String get giftSettingsGiftUrlCopied => 'Gift URL copied to clipboard!';

  @override
  String get giftSettingsGiftUrlCopyFailed => 'Couldn\'t copy gift URL';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Purchased $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Redeemed $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Redeemed by $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'This gift has been redeemed';

  @override
  String get giftSettingsRedeemForYourself => 'Redeem for yourself';

  @override
  String get giftSettingsShareWithFriend => 'Share with a friend';

  @override
  String get premiumPlutoniumTagline =>
      'Unlock higher limits and exclusive features while supporting an independent communication platform.';

  @override
  String get premiumPurchaseMode => 'Purchase mode';

  @override
  String get premiumForMe => 'For me';

  @override
  String get premiumAsAGift => 'As a gift';

  @override
  String get premiumMonthly => 'Monthly';

  @override
  String get premiumYearly => 'Yearly';

  @override
  String get premiumPerMonth => 'per month';

  @override
  String get premiumPerYear => 'per year';

  @override
  String get premiumOneTimePurchase => 'one-time purchase';

  @override
  String get premiumSave17 => 'Save 17%';

  @override
  String get premiumUpgradeNow => 'Upgrade now';

  @override
  String get premiumBuyGift => 'Buy gift';

  @override
  String get premiumOneYearGift => '1 year gift';

  @override
  String get premiumOneMonthGift => '1 month gift';

  @override
  String get premiumMostPopular => 'Most popular';

  @override
  String get premiumScrollPrompt =>
      'Scroll down to view all the perks included with Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'Free vs Plutonium';

  @override
  String get premiumFreeColumn => 'Free';

  @override
  String get premiumGiftSectionTitle => 'Gift Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'Share the Plutonium experience with your friends by purchasing a gift subscription.';

  @override
  String get premiumGiftBannerOne =>
      'You have a new gift code waiting for you!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'You have $count new gift codes waiting for you!';
  }

  @override
  String get premiumViewGifts => 'View gifts';

  @override
  String get premiumReadyToUpgrade => 'Ready to upgrade?';

  @override
  String get premiumReadyToBuyGift => 'Ready to buy a gift?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Monthly $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Yearly $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 year $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 month $price';
  }

  @override
  String get premiumManageSubscription => 'Manage subscription';

  @override
  String get premiumRedeemGiftCode => 'Redeem gift code';

  @override
  String get premiumGiftBadge => 'Gift';

  @override
  String get premiumCancelSubscriptionTitle => 'Cancel subscription?';

  @override
  String get premiumCancelSubscriptionBody =>
      'You keep your perks until your next renewal date, then have a 3-day grace period to resubscribe and keep your subscriber history.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Cancel subscription';

  @override
  String get premiumKeepSubscription => 'Keep subscription';

  @override
  String get premiumPurchaseHistoryTitle => 'Purchase history';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Your recent invoices. To change the payment method for your subscription, add or choose one in the billing portal and make it the default.';

  @override
  String get premiumManagePaymentMethods => 'Manage payment methods';

  @override
  String get premiumBillingHistory => 'Billing history';

  @override
  String get premiumSelfServeRefundTitle => 'Self-serve refund';

  @override
  String get premiumSelfServeRefundButton => 'Refund latest purchase';

  @override
  String get premiumDisclaimerAgreementPrefix =>
      'By purchasing, you agree to our ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'By purchasing, you agreed to our ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' and ';

  @override
  String premiumActiveUntil(String date) {
    return 'Active until $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Canceling';

  @override
  String premiumCancelsOn(String date) {
    return 'Cancels on $date. Perks remain active until then.';
  }

  @override
  String get premiumReactivateSubscription => 'Reactivate';

  @override
  String premiumGiftedUntil(String date) {
    return 'Gifted until $date. Does not renew automatically.';
  }

  @override
  String get premiumComparisonFeatureColumn => 'Feature';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'By purchasing, you agreed to our $terms and $privacy.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Self-serve refunds available within 3 days of payment, once every 30 days. Refunding a subscription cancels it. EU/EEA buyers waive the 14-day right of withdrawal at checkout to access content immediately. Use the in-app refund button instead of a chargeback. Chargebacks can permanently restrict your account. Stripe handles payment securely. We never see your full card number.';

  @override
  String get premiumTermsOfService => 'Terms of service';

  @override
  String get premiumPrivacyPolicy => 'Privacy policy';

  @override
  String get premiumCheckoutStartFailedTitle => 'Couldn\'t start checkout';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Something went wrong while starting checkout. Please try again in a moment.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'You\'re currently on a gift subscription. It won\'t renew. You can redeem more gift codes to extend it. Recurring subscriptions can be started after your gift time ends.';

  @override
  String get premiumPlanUnavailable =>
      'This plan isn\'t available. Contact support.';

  @override
  String get premiumCompletePaymentTitle => 'Complete payment';

  @override
  String get premiumCompletePaymentBody =>
      'You are now navigating to Stripe to complete the payment. Return to Fluxer once you\'ve completed it.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Choose payment method';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Pay with Pix automático to authorize recurring charges directly from your Brazilian bank. Or choose use card to enter a credit card on Stripe\'s next screen.';

  @override
  String get premiumUsePix => 'Use Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Pay with UPI to set up an RBI-compliant e-mandate from your Indian bank. Or choose use card to enter a credit card on Stripe\'s next screen.';

  @override
  String get premiumUseUpi => 'Use UPI';

  @override
  String get premiumUseCard => 'Use card';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Couldn\'t open the billing portal';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Something went wrong while opening the billing portal. Please try again in a moment.';

  @override
  String get premiumAlreadyVisionaryTitle => 'You\'re already Visionary';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary already includes permanent access, so a recurring subscription isn\'t needed. You can still buy gifts for others.';

  @override
  String get premiumExistingSubscriptionTitle => 'Subscription already exists';

  @override
  String get premiumExistingSubscriptionBody =>
      'We found an existing Fluxer Plutonium subscription for this account. Manage it in the secure billing portal to update payment details or check renewal status. If you just paid, wait a minute and reopen this page.';

  @override
  String get premiumPurchasesDisabledTitle => 'Purchases unavailable';

  @override
  String get premiumPurchasesDisabledBody =>
      'Purchases are disabled for this account. Contact support@fluxer.app if this looks wrong.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Claim your account to purchase Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'You need to verify your email before you can purchase Fluxer Plutonium.';

  @override
  String get premiumPerkCustomUsernameTag => 'Custom username tag';

  @override
  String get premiumPerkPerCommunityProfiles => 'Per-community profiles';

  @override
  String get premiumPerkMessageScheduling => 'Message scheduling';

  @override
  String get premiumPerkProfileBadge => 'Profile badge';

  @override
  String get premiumPerkCustomVideoBackgrounds => 'Custom video backgrounds';

  @override
  String get premiumPerkEntranceSounds => 'Entrance sounds';

  @override
  String get premiumPerkCommunities => 'Communities';

  @override
  String get premiumPerkMessageCharacterLimit => 'Message character limit';

  @override
  String get premiumPerkBookmarkedMessages => 'Bookmarked messages';

  @override
  String get premiumPerkFileUploadSize => 'File upload size';

  @override
  String get premiumPerkEmojiStickerPacks => 'Emoji & sticker packs';

  @override
  String get premiumPerkSavedMedia => 'Saved media';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Use animated emojis';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Global emoji & sticker access';

  @override
  String get premiumPerkVideoQuality => 'Video quality';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Animated avatars & profile banners';

  @override
  String get premiumPerkEarlyAccess => 'Early access to new features';

  @override
  String get premiumPerkCustomThemes => 'Custom themes';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Up to 4K/60fps';

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
  String get userSettingsNavShortcuts => 'Shortcuts';

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
  String get notificationsTtsSectionTitle => 'Text-to-speech notifications';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'Enable /tts speech playback';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'Let /tts read your message aloud. Disabling the setting keeps those commands as regular text.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Adjust playback speed in ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Accessibility';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle =>
      'Automatic message narration';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Converts incoming content to speech, regardless of whether it came from /tts.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Every channel';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Let every incoming message be spoken, regardless of which channel is open.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Active channel only';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Narrates only the channel you\'re viewing. Narration follows you between channels.';

  @override
  String get notificationsTtsModeNeverName => 'Never automatically';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Remain silent unless someone runs /tts manually.';

  @override
  String get notificationsTtsModeAriaLabel => 'Speak all messages out loud';

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
      'No se pudo actualizar el formato de hora';

  @override
  String get userSettingsNavDefaultApps => 'Default Apps';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Web Browser';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Choose which browser opens when you tap a link.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'If an app is installed for a site, links will open in that app first.';

  @override
  String get defaultAppsWebBrowserInApp => 'In-app browser';

  @override
  String get defaultAppsWebBrowserExternal => 'External browser';

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
  String get advancedSettingsConfigure => 'Configure';

  @override
  String get advancedSettingsCategoryPrivacy => 'Privacy';

  @override
  String get advancedSettingsCategoryAppearance => 'Appearance';

  @override
  String get advancedSettingsCategoryAccessibility => 'Accessibility';

  @override
  String get advancedSettingsCategoryChat => 'Chat';

  @override
  String get advancedSettingsCategoryMedia => 'Media';

  @override
  String get advancedSettingsCategoryVoice => 'Voice';

  @override
  String get advancedSettingsCategoryDeveloper => 'Developer';

  @override
  String get advancedSettingEnableTextSelectionLabel => 'Enable text selection';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Allow selecting text in the app';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Enable video seek thumbnails';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Thumbnail or live frame while scrubbing video';

  @override
  String get advancedSettingShowNekoLabel => 'Show Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'Neko cat that chases your cursor';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Show Neko on your chat input';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Splash zoom animation';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Zoom the logo out when leaving the splash screen';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Keyboard hints';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Keyboard shortcut hints in tooltips';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Enable favorites';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Show favorites throughout the app';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Voice channel join behavior';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Confirmation or double-click for community voice joins';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Require double-click to join voice channels';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Confirm before joining voice channels';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Automatically send GIFs when selected';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Automatically send GIFs from the picker without confirmation';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Save GIF favorites as saved media';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Choose how starred GIF favorites are stored';

  @override
  String get advancedSettingMediaButtonsLabel => 'Media buttons';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Customize which buttons and indicators appear on media attachments and embeds';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Upload attachments before sending';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Start uploading attachments as soon as they are added to the message input';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Strip tracking parameters from URLs';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Automatically remove tracking parameters from URLs in messages you send';

  @override
  String get advancedSettingTrustAllLinksLabel => 'Trust all external links';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'Skip the external link warning for all domains';

  @override
  String get advancedSettingSearchEnginesLabel => 'Search engines';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Configure search engines used from selected text';

  @override
  String get advancedSettingTranslatorsLabel => 'Translators';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Configure translator providers used from selected text';

  @override
  String get advancedSettingReverseImageSearchLabel => 'Reverse image search';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Reverse image search providers';

  @override
  String get advancedSettingMessageActionBarLabel => 'Message action bar';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Customize the action bar that appears when hovering over messages';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Expression autocomplete';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Pick what appears when you type a colon in the message input';

  @override
  String get advancedSettingInputButtonsLabel => 'Message input buttons';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Pick which buttons show in the message input';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Scroll to bottom when sending a message';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Choose how chat moves after you send a message';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Skip \"Mark all as read\" confirmation';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Mark all unread inbox channels as read immediately, without asking to confirm';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Hide muted channels by default';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Hide channels you\'ve muted from community sidebars';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'Show GIF indicator';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Show attachment expiry indicator';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'Show delete button';

  @override
  String get advancedSettingShowMediaDownloadLabel => 'Show download button';

  @override
  String get advancedSettingShowMediaFavoriteLabel => 'Show favorite button';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Show suppress embeds button';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Show message action bar';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel => 'Show only more button';

  @override
  String get advancedSettingShowQuickReactionsLabel => 'Show quick reactions';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Enable Shift to expand';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Show default emojis in expression autocomplete';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Show custom emojis in expression autocomplete';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Show stickers in expression autocomplete';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Show saved media in expression autocomplete';

  @override
  String get advancedSettingShowGifsButtonLabel => 'Show GIFs button';

  @override
  String get advancedSettingShowMediaButtonLabel => 'Show media button';

  @override
  String get advancedSettingShowStickersButtonLabel => 'Show stickers button';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Show emoji button';

  @override
  String get advancedSettingShowSendButtonLabel => 'Show send button';

  @override
  String get advancedSettingNewDeviceAlertsLabel => 'Show new device alerts';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Prompt for new audio devices';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Connection volume controls';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Show per-device participant volume sliders in voice menus';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Screen share preview behavior';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Preview, popout, and stream thumbnail behavior';

  @override
  String get advancedSettingScreenShareCodecLabel => 'Screen share codec';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Video codec for screen sharing';

  @override
  String get advancedSettingScreenShareCodecAuto => 'Automatic (recommended)';

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
      'Pause my screen share preview in the background';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Hide my stream preview thumbnail';

  @override
  String get advancedSettingDeveloperModeLabel => 'Enable developer mode';

  @override
  String get advancedSettingDeveloperModeDescription => 'Enable developer mode';

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
  String get advancedSettingDefaultSearchEngineLabel => 'Default search engine';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Choose which search engine is used by default when searching selected text.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Built-in search engines';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Enable or disable built-in search engines. Enabled engines appear in the message context menu when text is selected.';

  @override
  String get advancedSettingCustomSearchEnginesLabel => 'Custom search engines';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Add your own search engines with a custom URL pattern. Use \'$query\' as a placeholder for the search text.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Add search engine';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Enable at least one search engine below.';

  @override
  String get advancedSettingRemoveSearchEngineLabel => 'Remove search engine';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'Default translator';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Choose which translator is used by default when translating selected text.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Built-in translators';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Enable or disable built-in translators. Enabled translators appear in the message context menu when text is selected.';

  @override
  String get advancedSettingCustomTranslatorsLabel => 'Custom translators';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Add your own translators with a custom URL pattern. Use \'$query\' as a placeholder for the text to translate.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Add translator';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Enable at least one translator below.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Remove translator';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Default reverse image search';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Choose which reverse image search service is used by default when searching an image.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Built-in reverse image search';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Enable or disable built-in reverse image search providers. Enabled providers appear in the context menu of images, avatars, banners, stickers, and emoji.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Custom reverse image search';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Add your own reverse image search providers with a custom URL pattern. Use \'$url\' as a placeholder for the image URL.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Add reverse image search';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Enable at least one reverse image search provider below.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Remove reverse image search';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Add search engine';

  @override
  String get advancedSettingEditSearchEngineTitle => 'Edit search engine';

  @override
  String get advancedSettingAddTranslatorTitle => 'Add translation provider';

  @override
  String get advancedSettingEditTranslatorTitle => 'Edit translation provider';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Add reverse image search engine';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Edit reverse image search engine';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Name';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'URL pattern';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'My search engine';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'My translator';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'My reverse image search';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Use \'$query\' where the search text should be inserted.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Use \'$query\' where the text to translate should be inserted.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Use \'$url\' where the image URL should be inserted.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired => 'Name is required.';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'URL pattern is required.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'URL pattern must contain \'$query\' placeholder.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'URL pattern must contain \'$url\' placeholder.';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'URL pattern must be a valid URL.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Add';

  @override
  String get advancedSettingEditSearchProviderAction => 'Edit';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Remove';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'Are you sure you want to remove $engineName?';
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
  String get userSettingsJoinFluxerLabs => 'Join Fluxer Labs';

  @override
  String get userSettingsNavAppLicenses => 'App Licenses';

  @override
  String get userSettingsAppLicensesDescription =>
      'Open-source software used by this app. This app is built with Flutter.';

  @override
  String get userSettingsAppLicensesLoadError => 'Could not load app licenses.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count licenses',
      one: '1 license',
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
    return 'This will notify $count members with the $roleName role. Continue?';
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
  String get guildNavbarGuildSelected => 'selected';

  @override
  String get guildNavbarGuildUnread => 'unread';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mentions',
      one: '1 mention',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'muted';

  @override
  String get authShowPassword => 'Show password';

  @override
  String get authHidePassword => 'Hide password';

  @override
  String get chatLoadingMessages => 'Loading messages';

  @override
  String get friendsMessageFriend => 'Message';

  @override
  String get friendsFriendActions => 'Friend actions';

  @override
  String get friendsAcceptRequest => 'Accept friend request';

  @override
  String get friendsDeclineRequest => 'Decline friend request';

  @override
  String get friendsCancelRequest => 'Cancel friend request';

  @override
  String get friendsOpenInbox => 'Inbox';

  @override
  String get profileRemoveFriend => 'Remove friend';

  @override
  String get profileUnblockUser => 'Unblock user';

  @override
  String get profileAcceptFriendRequest => 'Accept friend request';

  @override
  String get profileCancelFriendRequest => 'Cancel friend request';

  @override
  String get profileSendFriendRequest => 'Add friend';

  @override
  String get accountOverflowMenu => 'Account options';

  @override
  String get navHome => 'Home';

  @override
  String get navNotifications => 'Notifications';

  @override
  String get navYou => 'You';

  @override
  String get guildFolderSettingsTitle => 'Folder settings';

  @override
  String get guildFolderNameLabel => 'Folder name';

  @override
  String get guildFolderColorLabel => 'Folder color';

  @override
  String get guildFolderShowIconWhenCollapsed => 'Show icon when collapsed';

  @override
  String get guildFolderIconLabel => 'Folder icon';

  @override
  String get guildFolderDelete => 'Delete folder';

  @override
  String get guildFolderIconFolder => 'Folder';

  @override
  String get guildFolderIconStar => 'Star';

  @override
  String get guildFolderIconHeart => 'Heart';

  @override
  String get guildFolderIconBookmark => 'Bookmark';

  @override
  String get guildFolderIconGameController => 'Game controller';

  @override
  String get guildFolderIconShield => 'Shield';

  @override
  String get guildFolderIconMusicNote => 'Music note';

  @override
  String get guildFolderMarkAsRead => 'Mark folder as read';

  @override
  String get guildBulkMuteCommunities => 'Mute communities';

  @override
  String get guildBulkUnmuteCommunities => 'Unmute communities';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Community notification settings';

  @override
  String get guildBulkCommunityPrivacySettings => 'Community privacy settings';

  @override
  String get guildBulkAllowEveryoneAndHere => 'Allow @everyone and @here';

  @override
  String get guildBulkAllowRoleMentions => 'Allow role mentions';

  @override
  String get guildBulkEnableMobilePush => 'Enable mobile push notifications';

  @override
  String get guildBulkDisableMobilePush => 'Disable mobile push notifications';

  @override
  String get guildBulkAllowDirectMessages => 'Allow direct messages';

  @override
  String get guildBulkBlockDirectMessages => 'Block direct messages';

  @override
  String get guildBulkAllowBotDirectMessages => 'Allow bot direct messages';

  @override
  String get guildBulkBlockBotDirectMessages => 'Block bot direct messages';

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
  String get guildSettingsBackToSettings => 'Back to settings';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Editar \"$name\"';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Configure role settings and permissions';

  @override
  String get guildSettingsRolesDisplaySection => 'Visualización';

  @override
  String get guildSettingsRolesRoleName => 'Nombre del rol';

  @override
  String get guildSettingsRolesRoleColor => 'Color del rol';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Type a color (hex, rgb(), hsl(), or name) or use the picker.';

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
      'Not enough members';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Se requieren al menos $count miembros para solicitar.';
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
  String get guildSettingsDiscoveryCategory => 'Categoría';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Choose the category that best describes your community. You can change this any time.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Primary language';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'The language most of your community speaks. Used to filter Discovery results.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Descripción';

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
  String get guildSettingsDiscoveryTags => 'Etiquetas';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Up to $maxTags tags help people find your community. They show up in Discovery search.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'gaming, arte, música';

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
  String get guildSettingsDiscoveryApply => 'Enviar solicitud';

  @override
  String get guildSettingsDiscoverySave => 'Save';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Retirar';

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
      'Busca y administra los miembros del servidor.';

  @override
  String get guildSettingsMembersSearchHint => 'Buscar miembros';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count miembros';
  }

  @override
  String get guildMembersRecentTitle => 'Recent members';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Showing $displayedCount of $totalCount total members';
  }

  @override
  String get guildMembersSort => 'Sort';

  @override
  String get guildSettingsMembersSortNewest => 'Más recientes primero';

  @override
  String get guildMembersSortOldest => 'Oldest first';

  @override
  String get guildMembersColumnName => 'Name';

  @override
  String get guildMembersColumnMemberSince => 'Member since';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'Joined $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Join method';

  @override
  String get guildMembersColumnRoles => 'Roles';

  @override
  String get guildMembersColumnActions => 'Actions';

  @override
  String get guildMembersFilterMemberSince => 'Filter by member since';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Filter by account creation date';

  @override
  String get guildMembersFilterJoinMethod => 'Filter by join method';

  @override
  String get guildMembersFilterRoles => 'Filter by roles';

  @override
  String get guildMembersFilterAll => 'All';

  @override
  String get guildMembersFilterPast1Hour => 'Past 1 hour';

  @override
  String get guildMembersFilterPast24Hours => 'Past 24 hours';

  @override
  String get guildMembersFilterPast7Days => 'Past 7 days';

  @override
  String get guildMembersFilterPast2Weeks => 'Past 2 weeks';

  @override
  String get guildMembersFilterPast3Weeks => 'Past 3 weeks';

  @override
  String get guildMembersFilterPast4Weeks => 'Past 4 weeks';

  @override
  String get guildMembersFilterPast3Months => 'Past 3 months';

  @override
  String get guildMembersFilterCustomRange => 'Custom range...';

  @override
  String get guildMembersDateRangeTitle => 'Custom date range';

  @override
  String get guildMembersDateAfter => 'After date';

  @override
  String get guildMembersDateBefore => 'Before date';

  @override
  String get guildMembersClearAll => 'Clear all';

  @override
  String get guildMembersRowsPerPage => 'Rows per page';

  @override
  String get guildMembersEmptySearch => 'Nobody matches that search.';

  @override
  String get guildMembersLoadError =>
      'Something went wrong loading members. Try again later.';

  @override
  String get guildMembersIndexing => 'Indexing members…';

  @override
  String get guildMembersGoToPage => 'Go to page';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'Go to page $page';
  }

  @override
  String get guildMembersJumpToPage => 'Jump to page';

  @override
  String get guildMembersJoinSourceCreator => 'Community creator';

  @override
  String get guildMembersJoinSourceInvite => 'Invite';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Invite ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Invited by $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'Vanity URL';

  @override
  String get guildMembersJoinSourceBotInvite => 'Bot invite';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'Platform admin';

  @override
  String get guildMembersJoinSourceDiscovery => 'Discovery';

  @override
  String get guildMembersJoinMethodUnknown => 'Unknown';

  @override
  String get guildMembersCommunityOwner => 'Community owner';

  @override
  String get guildMembersViewAllRoles => 'View all roles';

  @override
  String get guildMembersJoinedJustNow => 'Just now';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes ago',
      one: '1 minute ago',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hours ago',
      one: '1 hour ago',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days ago',
      one: '1 day ago',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Members';

  @override
  String get guildMembersChannelListSelected => 'Members, selected';

  @override
  String get guildSettingsInvitesTitle => 'Invites';

  @override
  String get guildSettingsInvitesDescription =>
      'Ver y revocar enlaces de invitación activos.';

  @override
  String get guildSettingsInvitesEmpty => 'No hay invitaciones activas.';

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
    return 'Emoji no animado ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Emoji animado ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Buscar pegatinas';

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
  String get guildSettingsInvitesTableExpires => 'Expires';

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
  String get dmListMessagesTitle => 'Mensajes';

  @override
  String get dmListDirectMessagesTitle => 'Mensajes directos';

  @override
  String get keybindsSearchShortcuts => 'Search shortcuts';

  @override
  String get keybindSectionDefaults => 'Defaults';

  @override
  String get keybindSectionMessages => 'Messages';

  @override
  String get keybindSectionNavigation => 'Navigation';

  @override
  String get keybindSectionDragAndDrop => 'Drag and drop';

  @override
  String get keybindSectionChat => 'Chat';

  @override
  String get keybindSectionVoiceAndVideo => 'Voice and video';

  @override
  String get keybindSectionMisc => 'Miscellaneous';

  @override
  String get keybindActionShowShortcutsList => 'Show keyboard shortcuts list';

  @override
  String get keybindActionCopyText => 'Copy text';

  @override
  String get keybindActionMarkUnread => 'Mark as unread';

  @override
  String get keybindActionFocusTextarea => 'Focus text area';

  @override
  String get keybindActionSwitchCommunities => 'Switch between communities';

  @override
  String get keybindActionSwitchChannels => 'Switch between channels';

  @override
  String get keybindActionHistoryBack =>
      'Move back through viewed channel history';

  @override
  String get keybindActionHistoryForward =>
      'Move forward through viewed channel history';

  @override
  String get keybindActionJumpUnreadChannels => 'Jump between unread channels';

  @override
  String get keybindActionJumpMentionChannels =>
      'Jump between unread channels with mentions';

  @override
  String get keybindActionJumpCurrentCall => 'Jump to the current call';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Toggle between last community and DMs';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Switch to previous community or DMs';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Switch to next community or DMs';

  @override
  String get keybindActionGoToDms => 'Go to Direct Messages';

  @override
  String get keybindActionGoToFirstCommunity => 'Go to first community';

  @override
  String get keybindActionGoToSecondCommunity => 'Go to second community';

  @override
  String get keybindActionGoToThirdCommunity => 'Go to third community';

  @override
  String get keybindActionGoToFourthCommunity => 'Go to fourth community';

  @override
  String get keybindActionGoToFifthCommunity => 'Go to fifth community';

  @override
  String get keybindActionGoToSixthCommunity => 'Go to sixth community';

  @override
  String get keybindActionGoToSeventhCommunity => 'Go to seventh community';

  @override
  String get keybindActionGoToEighthCommunity => 'Go to eighth community';

  @override
  String get keybindActionToggleQuickSwitcher => 'Toggle quick switcher';

  @override
  String get keybindActionCreateOrJoinCommunity => 'Create or join a community';

  @override
  String get keybindActionStartDragAndDrop => 'Start drag and drop';

  @override
  String get keybindActionMove => 'Move';

  @override
  String get keybindActionDropItem => 'Drop item';

  @override
  String get keybindActionCancel => 'Cancel';

  @override
  String get keybindActionMarkCommunityRead => 'Mark community as read';

  @override
  String get keybindActionMarkChannelRead => 'Mark channel as read';

  @override
  String get keybindActionStartGroupDm => 'Start a group DM';

  @override
  String get keybindActionTogglePinnedMessages => 'Toggle pinned messages';

  @override
  String get keybindActionToggleInbox => 'Toggle the inbox';

  @override
  String get keybindActionMarkTopInboxRead => 'Mark top inbox channel as read';

  @override
  String get keybindActionMarkAllInboxRead => 'Mark all inbox channels as read';

  @override
  String get keybindActionToggleMemberList =>
      'Toggle the member list or voice chat';

  @override
  String get keybindActionToggleEmojiPicker => 'Toggle the emoji picker';

  @override
  String get keybindActionToggleGifPicker => 'Toggle the GIF picker';

  @override
  String get keybindActionToggleStickerPicker => 'Toggle the sticker picker';

  @override
  String get keybindActionScrollChatUp => 'Scroll chat up';

  @override
  String get keybindActionScrollChatDown => 'Scroll chat down';

  @override
  String get keybindActionJumpOldestUnread =>
      'Jump to the oldest unread message';

  @override
  String get keybindActionFocusComposer => 'Focus the text area';

  @override
  String get keybindActionUploadFile => 'Upload a file';

  @override
  String get keybindActionCopyChannelLink => 'Copy channel link';

  @override
  String get keybindActionToggleSavedMedia => 'Toggle saved media';

  @override
  String get keybindActionSendVoiceMessage => 'Send voice message';

  @override
  String get keybindActionAnswerCall => 'Answer the incoming call';

  @override
  String get keybindActionDeclineCall => 'Decline the incoming call';

  @override
  String get keybindActionStartDmCall => 'Start a call in a DM or group';

  @override
  String get keybindActionToggleSoundboard => 'Toggle the soundboard';

  @override
  String get keybindActionToggleCompactCallView =>
      'Expand or collapse compact call view';

  @override
  String get keybindActionPushToTalkPriority => 'Push to talk (priority)';

  @override
  String get keybindActionVoiceActivityPriority => 'Voice activity priority';

  @override
  String get keybindActionOpenHelp => 'Open help';

  @override
  String get keybindActionSearchMessages => 'Search messages';

  @override
  String get keybindActionOpenContextMenu => 'Open the context menu';

  @override
  String get keybindActionOpenSettings => 'Open your settings';

  @override
  String get keybindActionOpenThemeStudio => 'Open theme studio popout';

  @override
  String get keybindActionZoomIn => 'Zoom in';

  @override
  String get keybindActionZoomOut => 'Zoom out';

  @override
  String get keybindActionZoomReset => 'Reset zoom';

  @override
  String get clipboardPasteFailed =>
      'Couldn\'t paste. The clipboard was empty or blocked for this app.';
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
  String get systemPermissionMicrophoneMessage =>
      'Fluxer no tiene acceso a tu micrófono. Puedes activarlo en la configuración de privacidad de tu dispositivo.';

  @override
  String get systemPermissionCameraMessage =>
      'Fluxer no tiene acceso a tu cámara. Puedes activarla en la configuración de privacidad de tu dispositivo.';

  @override
  String get systemPermissionNotificationsMessage =>
      'Fluxer no tiene permiso para enviar notificaciones. Puedes activarlo en la configuración de tu dispositivo.';

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
  String get profilePreviewMemberSince => 'Miembro de Fluxer desde';

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
  String get phoneInboundOurNumberLabel => 'Enviar a';

  @override
  String get requiredActionUseEmail => 'Usar correo';

  @override
  String get requiredActionUsePhone => 'Usar teléfono';

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
  String get guildSettingsTitle => 'Ajustes de la comunidad';

  @override
  String get guildSettingsRolesTab => 'Roles';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Hora local';

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
  String get iarPreviewCommunitySubtitle => 'Comunidad';

  @override
  String get iarReasonRaidLabel => 'Coordinación de raideos';

  @override
  String get iarReasonMalwareGuildLabel => 'Distribución de malware';

  @override
  String get iarReasonSelfHarmGuildLabel => 'Fomenta la autolesión';

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
  String get chatAttachmentExpiredTooltip => 'El archivo adjunto ha caducado';

  @override
  String get chatTextualPreviewChangeLanguage => 'Cambiar idioma';

  @override
  String get chatTextualPreviewSearchLanguage => 'Buscar idioma…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Resaltado de sintaxis';

  @override
  String get chatTextualPreviewMoreOptions => 'Más opciones';

  @override
  String get chatTextualPreviewWrapText => 'Ajustar texto';

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
  String get lookAndFeelHdrStandardName => 'Rango estándar';

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
  String get lookAndFeelMessagesSectionTitle => 'Mensajes';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Cómodo';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Denso';

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
  String get accessibilitySaturationTitle => 'Saturación';

  @override
  String get accessibilityVisualGroupTitle => 'Visual';

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
  String get accessibilityTtsGroupTitle => 'Texto a voz';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Reproducir muestra';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Silenciar muestra';

  @override
  String get accessibilityPreviewButtonLabel => 'Botón de vista previa';

  @override
  String get accessibilityPreviewUserName => 'Vista previa de usuario';

  @override
  String get accessibilityKeyboardGroupTitle => 'Teclado';

  @override
  String get accessibilityAnimationGroupTitle => 'Animación';

  @override
  String get accessibilityStickerAnimationsTitle => 'Animaciones de stickers';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Animar siempre';

  @override
  String get accessibilityStickerNeverAnimateName => 'No animar nunca';

  @override
  String get accessibilityMotionGroupTitle => 'Movimiento';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Reducir movimiento';

  @override
  String get accessibilityConfirmStartCallTitle => '¿Iniciar llamada?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Iniciar llamada';

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
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
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
  String systemCallMissedWithDuration(String username, String duration) {
    return 'Te perdiste una llamada de $username que duró $duration.';
  }

  @override
  String systemCallMissed(String username) {
    return 'Te perdiste una llamada de $username.';
  }

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
  String get voiceConnectionTitle => 'Conexión de voz';

  @override
  String get voiceConnectionAdvancedStats => 'Avanzado';

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
  String get userAreaUserSettings => 'Ajustes de usuario';

  @override
  String get voiceParticipantMenuViewProfile => 'Ver perfil';

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
  String get voiceControlChat => 'Chat';

  @override
  String get voicePanelSettingsSectionTitle => 'Ajustes de voz';

  @override
  String get voicePanelUseEarpieceLabel => 'Usar auricular';

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
  String get privacyDashboardActivitySharingSection => 'Compartir actividad';

  @override
  String get privacyDashboardSensitiveContentSection => 'Contenido sensible';

  @override
  String get privacyDashboardDataDeletionSection => 'Eliminación de datos';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Solo amigos';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Solicitudes de amistad';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Todos';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Miembros de la comunidad';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Mensajes directos';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Llamadas entrantes';

  @override
  String get privacyDashboardAllowedCallers => 'Llamadas permitidas';

  @override
  String get privacyDashboardIncomingCallNobody => 'Nadie';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Solo amigos';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Todos';

  @override
  String get privacyDashboardAdditionalGroups => 'Grupos adicionales';

  @override
  String get privacyDashboardAllowedInvites => 'Invitaciones permitidas';

  @override
  String get privacyDashboardDataRequestGoBack => 'Volver';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Todo';

  @override
  String get privacyDashboardDataRequestExportCustom =>
      'Selección personalizada';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Que conversaciones';

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
  String get privacyDashboardDataRequestWhenTitle => 'Rango de tiempo';

  @override
  String get privacyDashboardDataRequestDateMode => 'Rango de tiempo';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Rango personalizado';

  @override
  String get privacyDashboardDataRequestStartDate => 'Fecha de inicio';

  @override
  String get privacyDashboardDataRequestEndDate => 'Fecha de finalización';

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
  String get privacyDashboardDataRequestSummaryGroupDms =>
      'Chats privados grupales';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Comunidades';

  @override
  String get privacyDashboardRetry => 'Reintentar';

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
  String get slowmodeRateLimitedTitle => 'Modo lento activo';

  @override
  String get shareMediaTitle => 'Compartir en';

  @override
  String get shareMediaSendButton => 'Enviar';

  @override
  String get shareMediaSuccessToast => 'Multimedia compartida';

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
  String get chatMessageTranslate => 'Traducir';

  @override
  String get chatMessageSeeOriginal => 'Ver original';

  @override
  String get chatMessageSeeTranslation => 'Ver traducción';

  @override
  String get chatMessageTranslating => 'Traduciendo…';

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
  String get addGuildCreateNameLabel => 'Nombre de la comunidad';

  @override
  String get addGuildCreateSubmit => 'Crear comunidad';

  @override
  String get addGuildCreateClaimTitle => 'Reclama tu cuenta';

  @override
  String get addGuildCreateClaimDescription =>
      'Debes reclamar tu cuenta antes de poder crear una comunidad.';

  @override
  String get addGuildCreateChangeIcon => 'Cambiar icono';

  @override
  String get addGuildCreateIconLabel => 'Icono de la comunidad';

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
  String get categoryMuteCategory => 'Silenciar categoría';

  @override
  String get categoryUnmuteCategory => 'Desactivar silencio';

  @override
  String get channelSettingsChannelNamePlaceholder => 'general';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://ejemplo.com';

  @override
  String get channelSettingsTopic => 'Tema';

  @override
  String get channelSettingsInsertEmoji => 'Insertar emoji';

  @override
  String get channelSettingsSlowmode => 'Modo lento';

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
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbps';
  }

  @override
  String get channelSettingsParticipantLimit => 'Límite de participantes';

  @override
  String get channelSettingsConnectionLimit => 'Límite de conexión';

  @override
  String get channelSettingsVoiceRegion => 'Región de voz';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Automático';

  @override
  String get channelSettingsAdvanced => 'Avanzado';

  @override
  String get channelSettingsMatureContentInherit => 'Heredar';

  @override
  String get channelSettingsMatureContentOn => 'Activado';

  @override
  String get channelSettingsMatureContentOff => 'Apagado';

  @override
  String get channelSettingsMatureContentCategorySource => 'categoría';

  @override
  String get channelSettingsMatureContentCommunitySource => 'comunidad';

  @override
  String get channelSettingsMatureContentCategoryScope => 'Categoría';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Comunidad';

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
  String get channelSettingsPermissionsSearchPlaceholder => 'Buscar permisos…';

  @override
  String get channelSettingsPermissionsTitle => 'Control de acceso';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsAddOverride => 'Añadir anulación';

  @override
  String get channelSettingsDeleteInvite => 'Eliminar invitación';

  @override
  String get channelSettingsWebhookCreated => 'Webhook creada';

  @override
  String get channelSettingsCreateWebhook => 'Crear webhook';

  @override
  String get channelSettingsInvitesCreate => 'Crear invitación';

  @override
  String get channelSettingsWebhooksEmpty => 'No hay webhooks';

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
  String get channelSettingsWebhooksDelete => 'Eliminar webhook';

  @override
  String get channelMenuOpenChat => 'Abrir chat';

  @override
  String get channelMenuDuplicateChannel => 'Duplicar canal';

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
  String get channelDetailsPinsDmEndHint =>
      'Puedes fijar mensajes en esta conversación para que todos los vean.';

  @override
  String get channelHeaderPinnedMessages => 'Mensajes fijados';

  @override
  String get channelHeaderMemberList => 'Lista de miembros';

  @override
  String get channelHeaderInbox => 'Bandeja de entrada';

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
  String get channelDetailsSearchChannelsHint => 'Buscar canales';

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
  String get channelDetailsSearchMoreFiltersLink => 'Nombre de host del enlace';

  @override
  String get channelDetailsSearchMoreFiltersFileName =>
      'El nombre del archivo contiene';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'Extensión de archivo';

  @override
  String get channelDetailsSearchContentPoll => 'Encuesta';

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
  String get channelHeaderSearchFilterDescIn => 'un canal';

  @override
  String get channelDetailsSearchIn => 'Buscar en';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Sin resultados';

  @override
  String get channelDetailsMembersOnline => 'En línea';

  @override
  String get channelDetailsMembersOffline => 'Desconectado';

  @override
  String get channelDetailsMemberYou => 'Tú';

  @override
  String get channelDetailsSearchUsersHint => 'Buscar usuarios';

  @override
  String get channelDetailsDone => 'Hecho';

  @override
  String get channelDetailsRetry => 'Reintentar';

  @override
  String get channelDetailsPinnedMessageTitle => 'Mensaje fijado';

  @override
  String get channelDetailsSearchResultTitle => 'Resultado de búsqueda';

  @override
  String get channelDetailsUnpinMessage => 'Desfijar mensaje';

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
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Buscar solo en el chat privado actual';

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
  String get channelDetailsSearchContentSticker => 'Sticker';

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
  String get groupDmCreateInvite => 'Crear';

  @override
  String get groupDmLoadingInvites => 'Cargando invitaciones...';

  @override
  String get groupDmInviteRevoked => 'Invitación revocada';

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
  String get composerShowKeyboard => 'Mostrar teclado';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', enviando';

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
  String messageAccessibilityStickerSummary(String name) {
    return 'sticker $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'Archivo $filename';
  }

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
  String get userSettingsNavProfile => 'Perfil';

  @override
  String get userSettingsNavSecurityLogin => 'Seguridad e inicio de sesión';

  @override
  String get userSettingsNavFluxerPlutonium => 'Suscripción a Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Regalos';

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
  String get giftSettingsTryAgain => 'Intentar de nuevo';

  @override
  String get giftSettingsCopy => 'Copiar';

  @override
  String get giftSettingsCopied => 'Copiado';

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
  String get premiumForMe => 'Para mí';

  @override
  String get premiumMonthly => 'Mensual';

  @override
  String get premiumYearly => 'Anual';

  @override
  String get premiumPerMonth => 'por mes';

  @override
  String get premiumPerYear => 'por año';

  @override
  String get premiumSave17 => 'Ahorra un 17%';

  @override
  String get premiumUpgradeNow => 'Actualizar ahora';

  @override
  String get premiumBuyGift => 'Comprar regalo';

  @override
  String get premiumMostPopular => 'Más popular';

  @override
  String get premiumFreeColumn => 'Gratis';

  @override
  String get premiumGiftSectionTitle => 'Regalar Plutonium';

  @override
  String get premiumViewGifts => 'Ver regalos';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Mensual $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Anual $price';
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
  String get premiumKeepSubscription => 'Mantener suscripción';

  @override
  String get premiumPurchaseHistoryTitle => 'Historial de compras';

  @override
  String get premiumBillingHistory => 'Historial de facturación';

  @override
  String get premiumSelfServeRefundTitle => 'Reembolso automático';

  @override
  String get premiumDisclaimerAgreementMiddle => ' y ';

  @override
  String get premiumSubscriptionCanceling => 'Cancelando';

  @override
  String get premiumReactivateSubscription => 'Reactivar';

  @override
  String get premiumComparisonFeatureColumn => 'Función';

  @override
  String get premiumPrivacyPolicy => 'Políticas de privacidad';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'Actualmente tienes una suscripción de regalo. No se renovará automáticamente. Puedes canjear más códigos de regalo para extenderla. Las suscripciones recurrentes se pueden iniciar una vez que finalice el tiempo de tu regalo.';

  @override
  String get premiumCompletePaymentTitle => 'Completar pago';

  @override
  String get premiumUsePix => 'Usar Pix';

  @override
  String get premiumUseUpi => 'Usar UPI';

  @override
  String get premiumUseCard => 'Usar tarjeta';

  @override
  String get premiumPurchasesDisabledTitle => 'Compras no disponibles';

  @override
  String get premiumPerkPerCommunityProfiles => 'Perfiles por comunidad';

  @override
  String get premiumPerkMessageScheduling => 'Programación de mensajes';

  @override
  String get premiumPerkProfileBadge => 'Insignia de perfil';

  @override
  String get premiumPerkEntranceSounds => 'Sonidos de entrada';

  @override
  String get premiumPerkCommunities => 'Comunidades';

  @override
  String get premiumPerkBookmarkedMessages => 'Mensajes marcados';

  @override
  String get premiumPerkSavedMedia => 'Multimedia guardada';

  @override
  String get premiumPerkVideoQuality => 'Calidad de video';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

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
  String get audioAndVideoVideoSectionTitle => 'Video';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle =>
      'Comportamiento en llamadas';

  @override
  String get audioAndVideoInputDeviceLabel => 'Dispositivo de entrada';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Dispositivo de salida';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'Por defecto';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Usar altavoz';

  @override
  String get audioAndVideoInputVolumeLabel => 'Volumen de entrada';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Volumen de salida';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Procesamiento de voz';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Voz enfocada';

  @override
  String get audioAndVideoDirectInputLabel => 'Entrada directa';

  @override
  String get audioAndVideoCustomProfileLabel => 'Personalizado';

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
  String get audioAndVideoMicTestSectionTitle => 'Prueba de micrófono';

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
  String get audioAndVideoFrameRateSectionTitle => 'Cuadros por segundo';

  @override
  String get audioAndVideoFrameRate15Label => '15 FPS';

  @override
  String get audioAndVideoFrameRate30Label => '30 FPS';

  @override
  String get audioAndVideoFrameRate60Label => '60 FPS';

  @override
  String get userSettingsNavNotifications => 'Notificaciones';

  @override
  String get notificationsGeneralSectionTitle => 'General';

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
  String get notificationsMentionPreferMentionName => 'Preferir @mención';

  @override
  String get notificationsTtsSectionTitle => 'Notificaciones de texto a voz';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Accesibilidad';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Todos los canales';

  @override
  String get notificationsTtsModeNeverName => 'Nunca automáticamente';

  @override
  String get notificationsSoundsSectionTitle => 'Sonidos';

  @override
  String get notificationsMasterVolumeLabel => 'Volumen general';

  @override
  String get notificationsPreviewSound => 'Vista previa del sonido';

  @override
  String notificationsUnmuteSound(String label) {
    return 'Remover silencio $label';
  }

  @override
  String get notificationsSoundMute => 'Silenciar voz';

  @override
  String get notificationsSoundDeaf => 'Desactivar audio';

  @override
  String get notificationsSoundUndeaf => 'Reactivar audio';

  @override
  String get notificationsSoundCameraOn => 'Cámara activada';

  @override
  String get userSettingsNavLanguageAndTime => 'Idioma y hora';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Idioma de la interfaz';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Formato de hora';

  @override
  String get languageAndTimeTimeFormatAuto => 'Automático';

  @override
  String get languageAndTimeTimeFormat12Hour => '12 horas';

  @override
  String get languageAndTimeTimeFormat24Hour => '24 horas';

  @override
  String get userSettingsNavDefaultApps => 'Aplicaciones predeterminadas';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Navegador web';

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
  String get advancedSettingKeyboardHintsLabel => 'Atajos de teclado';

  @override
  String get advancedSettingMediaButtonsLabel => 'Botones multimedia';

  @override
  String get advancedSettingTranslatorsLabel => 'Traductores';

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
  String get advancedSettingSearchEngineGoogle => 'Google';

  @override
  String get advancedSettingSearchEngineDuckDuckGo => 'DuckDuckGo';

  @override
  String get advancedSettingSearchEngineBing => 'Bing';

  @override
  String get advancedSettingSearchEngineTinEye => 'TinEye';

  @override
  String get advancedSettingTranslatorGoogle => 'Google Traductor';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultTranslatorLabel =>
      'Traductor predeterminado';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Traductores integrados';

  @override
  String get advancedSettingCustomTranslatorsLabel =>
      'Traductores personalizados';

  @override
  String get advancedSettingAddTranslatorLabel => 'Añadir traductor';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Eliminar traductor';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Nombre';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'Patrón de URL';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Mi traductor';

  @override
  String get advancedSettingAddSearchProviderAction => 'Añadir';

  @override
  String get advancedSettingEditSearchProviderAction => 'Editar';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Eliminar';

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
  String get navigationItemMuted => 'silenciado';

  @override
  String get authShowPassword => 'Mostrar contraseña';

  @override
  String get friendsMessageFriend => 'Mensaje';

  @override
  String get friendsFriendActions => 'Acciones de amigo';

  @override
  String get friendsOpenInbox => 'Bandeja de entrada';

  @override
  String get profileRemoveFriend => 'Eliminar amigos';

  @override
  String get profileUnblockUser => 'Desbloquear usuario';

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
  String get guildBulkMuteCommunities => 'Silenciar comunidades';

  @override
  String get guildBulkUnmuteCommunities => 'Activar sonido de comunidades';

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
  String guildSettingsRolesEditTitle(String name) {
    return 'Editar \"$name\"';
  }

  @override
  String get guildSettingsRolesDisplaySection => 'Mostrar';

  @override
  String get guildSettingsRolesRoleName => 'Nombre del rol';

  @override
  String get guildSettingsRolesRoleColor => 'Color del rol';

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
  String get guildSettingsRolesSingleColumn => 'Una columna';

  @override
  String get guildSettingsRolesTwoColumns => 'Dos columnas';

  @override
  String get guildSettingsRolesHoistOrder => 'Orden de jerarquía';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'No puedes editar este rol porque es tu rol más alto o está por encima de ti';

  @override
  String get permissionCategoryCommunityWide => 'De toda la comunidad';

  @override
  String get permissionCategoryModeration => 'Moderación';

  @override
  String get permissionCategoryChannelAccess => 'Acceso al canal';

  @override
  String get permissionCategoryChannelManagement => 'Gestión de canales';

  @override
  String get permissionUnknown => 'Permiso desconocido';

  @override
  String get permissionAdministrator => 'Administrador';

  @override
  String get permissionManageCommunity => 'Administrar comunidad';

  @override
  String get permissionManageRoles => 'Administrar roles';

  @override
  String get permissionManageChannels => 'Administrar canales';

  @override
  String get permissionManageChannel => 'Gestionar canal';

  @override
  String get permissionManagePermissions => 'Gestionar permisos';

  @override
  String get permissionOverwriteDeny => 'Negar';

  @override
  String get permissionOverwriteInherit => 'Heredar (por defecto)';

  @override
  String get permissionOverwriteAllow => 'Permitir';

  @override
  String get permissionKickMembers => 'Expulsar miembros';

  @override
  String get permissionBanMembers => 'Banear miembros';

  @override
  String get permissionManageNicknames => 'Administrar apodos';

  @override
  String get permissionManageWebhooks => 'Administrar webhooks';

  @override
  String get permissionSendMessages => 'Enviar mensajes';

  @override
  String get permissionManageMessages => 'Administrar mensajes';

  @override
  String get permissionPinMessages => 'Fijar mensajes';

  @override
  String get permissionEmbedLinks => 'Integrar enlaces';

  @override
  String get permissionAttachFiles => 'Adjuntar archivos';

  @override
  String get permissionAddReactions => 'Añadir reacciones';

  @override
  String get permissionBypassSlowmode => 'Ignorar modo lento';

  @override
  String get permissionViewChannel => 'Ver canal';

  @override
  String get permissionConnect => 'Conectar';

  @override
  String get permissionSpeak => 'Hablar';

  @override
  String get permissionStreamVideo => 'Transmitir video';

  @override
  String get permissionPrioritySpeaker => 'Priorizar altavoz';

  @override
  String get permissionMuteMembers => 'Silenciar miembros';

  @override
  String get permissionDeafenMembers => 'Ensordecer miembros';

  @override
  String get permissionMoveMembers => 'Mover miembros';

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
  String get guildSettingsWebhooksUpdated => 'Webhooks actualizados';

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
  String get guildSettingsDiscoveryCategory => 'Categoría';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Idioma principal';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Descripción';

  @override
  String get guildSettingsDiscoveryTags => 'Etiquetas personalizadas';

  @override
  String get guildSettingsDiscoveryTagsHint => 'juegos, arte, música';

  @override
  String get guildSettingsDiscoveryAddTag => 'Añadir';

  @override
  String get guildSettingsDiscoveryApply => 'Enviar solicitud';

  @override
  String get guildSettingsDiscoverySave => 'Guardar';

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
  String get guildMembersRecentTitle => 'Miembros recientes';

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
  String get guildMembersFilterAll => 'Todos';

  @override
  String get guildMembersFilterCustomRange => 'Rango personalizado...';

  @override
  String get guildMembersClearAll => 'Borrar todo';

  @override
  String get guildMembersJoinSourceCreator => 'Creador de la comunidad';

  @override
  String get guildMembersJoinSourceInvite => 'Invitar';

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
  String get guildMembersChannelListLabel => 'Miembros';

  @override
  String get guildSettingsInvitesTitle => 'Invitaciones';

  @override
  String get guildSettingsInvitesDescription =>
      'Ve y revoca los enlaces de invitación activos.';

  @override
  String get guildSettingsInvitesEmpty => 'No hay invitaciones activas.';

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
  String get guildSettingsInvitesPause => 'Pausar';

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
  String get guildSettingsInvitesRevoke => 'Revocar invitación';

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
  String get guildSettingsEmojiUploadingTitle => 'Subiendo emojis';

  @override
  String get guildSettingsEmojiRenameTitle => 'Renombrar emoji';

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
  String get guildSettingsStickerDensity => 'Densidad de stickers';

  @override
  String get guildSettingsStickerDensityCozy => 'Acogedor';

  @override
  String get guildSettingsStickerDensityCompact => 'Compacto';

  @override
  String get guildSettingsStickerAddTitle => 'Añadir sticker';

  @override
  String get guildSettingsStickerEditTitle => 'Editar sticker';

  @override
  String get guildSettingsStickerNameLabel => 'Nombre';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Descripción';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Etiquetas ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagAdd => 'Añadir';

  @override
  String get guildSettingsStickerDeleteTitle => 'Eliminar sticker';

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
  String get keybindSectionDefaults => 'Predeterminados';

  @override
  String get keybindSectionMessages => 'Mensajes';

  @override
  String get keybindSectionNavigation => 'Navegación';

  @override
  String get keybindSectionChat => 'Chat';

  @override
  String get keybindSectionMisc => 'Varios';

  @override
  String get keybindActionCopyText => 'Copiar texto';

  @override
  String get keybindActionMove => 'Mover';

  @override
  String get keybindActionCancel => 'Cancelar';

  @override
  String get keybindActionOpenHelp => 'Abrir ayuda';

  @override
  String get keybindActionSearchMessages => 'Buscar mensajes';
}
