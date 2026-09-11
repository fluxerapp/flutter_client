// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class FluxerLocalizationsPt extends FluxerLocalizations {
  FluxerLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get reconnectingTitle => 'Deu ruim!';

  @override
  String get reconnectingBody =>
      'Algo está errado com os servidores.\nDeve ser consertado em um segundo!';

  @override
  String get gatewayReconnectingToast => 'Reconectando…';

  @override
  String get gatewayConnectedToast => 'Conectado';

  @override
  String get sessionExpiredToast =>
      'Sua sessão expirou. Por favor entre novamente.';

  @override
  String splashStartupFailed(String error) {
    return 'Falha ao iniciar: $error';
  }

  @override
  String get retry => 'Tentar novamente';

  @override
  String get connectingCaps => 'CONECTANDO';

  @override
  String get splashConnectionLost => 'Conexão perdida';

  @override
  String get splashViewOnStatusPage => 'Ver no status da página';

  @override
  String get splashConnectionIssuesPrompt => 'Problemas de conexão?';

  @override
  String get splashStatusPageLink => 'Página de status';

  @override
  String get splashReadIncident => 'Ler incidente';

  @override
  String get splashIncidentHistory => 'Histórico de incidentes';

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
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName doesn\'t have access to your microphone. You can enable it in your device privacy settings.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName doesn\'t have access to your camera. You can enable it in your device privacy settings.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName doesn\'t have access to your photo library. You can enable it in your device privacy settings.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName doesn\'t have permission to send notifications. You can enable it in your device settings.';
  }

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
  String get welcomeBack => 'Bem-vindo(a) de volta';

  @override
  String get email => 'E-mail';

  @override
  String get emailInvalid => 'Por favor, insira um endereço de e-mail válido.';

  @override
  String get password => 'Senha';

  @override
  String get forgotPassword => 'Esqueceu sua senha?';

  @override
  String get logIn => 'Entrar';

  @override
  String get logInWithPasskey => 'Entrar com uma chave de acesso';

  @override
  String continueWithSso(String provider) {
    return 'Continuar com $provider';
  }

  @override
  String get ssoRequired => 'O SSO é necessário para acessar esta instância.';

  @override
  String get organizationSsoProvider =>
      'Entre com o provedor de login único da sua organização.';

  @override
  String get failedToStartSso => 'Falha ao iniciar o SSO';

  @override
  String get ssoCancelled => 'O login SSO foi cancelado';

  @override
  String preferSso(String provider) {
    return 'Prefere usar SSO? Continue com $provider.';
  }

  @override
  String get logInViaBrowser => 'Entrar pelo navegador';

  @override
  String get needAccountPrompt => 'Precisa de uma conta? ';

  @override
  String get register => 'Registrar';

  @override
  String get orDivider => 'OU';

  @override
  String get captchaTitle => 'Verifique se você é humano';

  @override
  String get captchaDescription =>
      'Precisamos ter certeza de que você não é um robô. Por favor, complete a verificação abaixo.';

  @override
  String get captchaSwitchToHcaptcha =>
      'Problemas? Tente o hCaptcha em vez disso';

  @override
  String get captchaSwitchToTurnstile => 'Tente o Turnstile em vez disso';

  @override
  String get cancel => 'Cancelar';

  @override
  String get ipAuthCheckEmail => 'Verifique seu e-mail';

  @override
  String ipAuthDescription(String email) {
    return 'Enviamos um link por e-mail para autorizar este login. Por favor, abra sua caixa de entrada para $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Conexão perdida';

  @override
  String get ipAuthConnectionLostDescription =>
      'Perdemos a conexão enquanto aguardávamos a autorização. Por favor, tente novamente.';

  @override
  String get ipAuthLinkExpired => 'Link de login expirado';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Este link de autorização expirou. Por favor, faça login novamente.';

  @override
  String get ipAuthResendEmail => 'Reenviar e-mail';

  @override
  String get ipAuthResent => 'Reenviado';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Voltar';

  @override
  String get next => 'Next';

  @override
  String get mfaTitle => 'Autenticação de dois fatores';

  @override
  String get mfaChooseMethod => 'Escolha um método de verificação';

  @override
  String get mfaMethodTotp => 'Aplicativo autenticador';

  @override
  String get mfaMethodWebauthn => 'Chave de segurança / Chave de acesso';

  @override
  String get mfaTotpDescription =>
      'Digite o código de 6 dígitos do seu aplicativo autenticador ou um dos seus códigos de backup.';

  @override
  String get mfaCodeLabel => 'Código';

  @override
  String get mfaTryAnotherMethod => 'Tentar outro método';

  @override
  String get mfaUseSecurityKey => 'Use chave de segurança / senha em vez disso';

  @override
  String get accountSelectorTitle => 'Escolha uma conta';

  @override
  String get accountSelectorDescription =>
      'Selecione uma conta para continuar ou adicione outra.';

  @override
  String get accountAdd => 'Adicionar conta';

  @override
  String get accountRemove => 'Remover';

  @override
  String accountRemoveTitle(String username) {
    return 'Remover $username';
  }

  @override
  String get accountRemoveDescription =>
      'Isso removerá a sessão salva para esta conta.';

  @override
  String get accountRemoveOnlyDescription =>
      'Isso removerá a única conta salva neste dispositivo.';

  @override
  String get accountExpired => 'Expirada';

  @override
  String accountSessionExpired(String identifier) {
    return 'Sessão expirada para $identifier. Faça login novamente.';
  }

  @override
  String get accountManageTitle => 'Gerenciar contas';

  @override
  String get accountSwitchFailed =>
      'Não foi possível trocar de conta. Tente novamente.';

  @override
  String get profileTabMenuSwitchAccounts => 'Trocar de contas';

  @override
  String get statusChangeSheetTitle => 'Definir status';

  @override
  String get statusOnlineStatusSection => 'Status online';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusIdle => 'Inativo';

  @override
  String get statusDnd => 'Não perturbe';

  @override
  String get statusInvisible => 'Invisível';

  @override
  String get statusOffline => 'Offline';

  @override
  String get statusUntilIChangeIt => 'Até que eu mude';

  @override
  String get statusDontClear => 'Não limpar';

  @override
  String get statusFor10Seconds => 'Por 10 segundos';

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
  String get statusClearAfter3Days => '3 dias';

  @override
  String get statusDndDescription =>
      'Você não receberá notificações no desktop';

  @override
  String get statusInvisibleDescription => 'Você aparecerá offline';

  @override
  String get customStatusSetTitle => 'Definir status personalizado';

  @override
  String get customStatusCurrentHint => 'Status personalizado';

  @override
  String get customStatusClear => 'Limpar status personalizado';

  @override
  String get customStatusPlaceholder => 'O que está acontecendo?';

  @override
  String get customStatusChooseEmoji => 'Escolher um emoji';

  @override
  String get customStatusClearAfter => 'Limpar após';

  @override
  String get customStatusSave => 'Salvar';

  @override
  String get accountActive => 'Conta ativa';

  @override
  String get signOut => 'Sair';

  @override
  String get suspendedPermanentTitle => 'Conta Suspensa Permanentemente';

  @override
  String get suspendedTemporaryTitle => 'Conta Suspensa';

  @override
  String get suspendedPermanentDescription =>
      'Sua conta foi suspensa permanentemente por violar nossos Termos de Serviço.';

  @override
  String get suspendedTemporaryDescription =>
      'Sua conta foi suspensa temporariamente. Você poderá acessá-la quando o período de suspensão terminar.';

  @override
  String get suspendedIssuedAt => 'Emitido em';

  @override
  String get suspendedEndsAt => 'Termina em';

  @override
  String get suspendedDuration => 'Duração';

  @override
  String get suspendedPermanent => 'Permanente';

  @override
  String get suspendedReason => 'Motivo';

  @override
  String get suspendedAppealDeadline => 'Prazo para Recurso';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Sua conta está programada para exclusão em $date.';
  }

  @override
  String get suspendedRecheck => 'Verificar atualizações';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Verificar novamente em ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Voltar ao login';

  @override
  String get suspendedAppealTitle => 'Recurso';

  @override
  String get suspendedAppealHint =>
      'Explique por que sua suspensão deve ser reconsiderada (mínimo de 50 caracteres)...';

  @override
  String get suspendedAppealSubmit => 'Enviar Recurso';

  @override
  String get suspendedAppealPending => 'Análise Pendente';

  @override
  String get suspendedAppealAccepted => 'Recurso Aceito';

  @override
  String get suspendedAppealRejected => 'Recurso Rejeitado';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Seu recurso foi aceito e sua conta foi restaurada.';

  @override
  String get suspendedSignIn => 'Entrar na sua conta';

  @override
  String get forgotPasswordTitle => 'Esqueceu sua senha?';

  @override
  String get forgotPasswordDescription =>
      'Digite seu endereço de e-mail e enviaremos um link para redefinir sua senha.';

  @override
  String get forgotPasswordSubmit => 'Enviar link de redefinição';

  @override
  String get forgotPasswordSentTitle => 'Verifique seu e-mail';

  @override
  String get forgotPasswordSentDescription =>
      'Enviamos instruções para redefinição de senha para o seu endereço de e-mail. Verifique sua caixa de entrada e siga o link para redefinir sua senha.';

  @override
  String get forgotPasswordBackToLogin => 'Voltar ao login';

  @override
  String get resetPasswordTitle => 'Definir nova senha';

  @override
  String get resetPasswordDescription =>
      'Digite sua nova senha abaixo para concluir o processo de redefinição.';

  @override
  String get resetPasswordNewPassword => 'Nova senha';

  @override
  String get resetPasswordConfirm => 'Confirmar nova senha';

  @override
  String get resetPasswordSubmit => 'Redefinir senha';

  @override
  String get resetPasswordMismatch => 'As senhas não coincidem.';

  @override
  String get registerTitle => 'Criar uma conta';

  @override
  String get registerDisplayName => 'Nome de Exibição (Opcional)';

  @override
  String get registerDisplayNameHint => 'Como as pessoas devem te chamar?';

  @override
  String get registerUsername => 'Nome de Usuário (Opcional)';

  @override
  String get registerUsernameHint =>
      'Deixe em branco para um nome de usuário aleatório';

  @override
  String get registerUsernameTagHint =>
      'Uma tag de 4 dígitos será adicionada automaticamente para garantir a exclusividade';

  @override
  String get registerDateOfBirth => 'Data de nascimento';

  @override
  String get registerMonth => 'Mês';

  @override
  String get registerDay => 'Dia';

  @override
  String get registerYear => 'Ano';

  @override
  String get registerConsent =>
      'Concordo com os Termos de Serviço e a Política de Privacidade';

  @override
  String get registerConsentPrefix => 'Concordo com os ';

  @override
  String get registerConsentTerms => 'Termos de Serviço';

  @override
  String get registerConsentAnd => ' e ';

  @override
  String get registerConsentPrivacy => 'Política de Privacidade';

  @override
  String get registerConfirmPassword => 'Confirmar Senha';

  @override
  String get registerSubmit => 'Criar conta';

  @override
  String get registerHaveAccount => 'Já tem uma conta? ';

  @override
  String get registerPendingApproval =>
      'Your account request is pending approval. You can sign in after an admin approves it.';

  @override
  String get registerClosed =>
      'Registration is currently closed. Use a registration link from an admin to create an account.';

  @override
  String get passkeyNoCredentials =>
      'Nenhuma passkey encontrada para este aplicativo. Faça login com e-mail e senha em vez disso.';

  @override
  String get passkeyDeviceNotSupported =>
      'Passkeys não são suportadas neste dispositivo.';

  @override
  String get passkeyDomainNotAssociated =>
      'Passkeys não estão configuradas para este aplicativo. Faça login com e-mail e senha em vez disso.';

  @override
  String get passkeyTimeout =>
      'A autenticação de passkey expirou. Por favor, tente novamente.';

  @override
  String get passkeyNotAvailable =>
      'Passkeys não estão disponíveis para este aplicativo. Faça login com e-mail e senha em vez disso.';

  @override
  String get passkeyFailed =>
      'Falha na autenticação da chave de acesso. Tente novamente.';

  @override
  String get errorUnableToCreateAccount =>
      'Não foi possível criar a conta. Tente novamente.';

  @override
  String get errorUnableToSignIn =>
      'Não foi possível entrar no momento. Tente novamente.';

  @override
  String get errorServiceUnavailable =>
      'This instance is temporarily unavailable. Try again in a moment.';

  @override
  String get errorInvalidEmailOrPassword => 'E-mail ou senha inválidos.';

  @override
  String get errorUnableToSendResetLink =>
      'Não foi possível enviar o link de redefinição. Tente novamente.';

  @override
  String get errorUnableToResetPassword =>
      'Não foi possível redefinir a senha. Tente novamente.';

  @override
  String get embedInviteJoin => 'Entrar na Comunidade';

  @override
  String get embedInviteGoTo => 'Ir para a Comunidade';

  @override
  String embedInviteOnline(String count) {
    return '$count Online';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count Membros';
  }

  @override
  String get embedInviteUnknownTitle => 'Convite Desconhecido';

  @override
  String get embedInviteUnknownSubtitle => 'Tente pedir um novo convite.';

  @override
  String get embedInviteUnavailable => 'Convite Indisponível';

  @override
  String get embedInviteJoinGroup => 'Join group';

  @override
  String get embedInviteAlreadyJoined => 'Already joined';

  @override
  String get embedInviteDisabled => 'Invites disabled';

  @override
  String get embedInvitePaused => 'Invites are paused for this community.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName detected a potential raid, so new users can\'t join right now.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'This community has paused invites. You can try again later.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName detected a potential raid in this community. Invites are paused, so new users cannot join right now.';
  }

  @override
  String get inviteAcceptTitle => 'Você foi convidado para entrar';

  @override
  String get inviteAcceptJoinButton => 'Entrar na Comunidade';

  @override
  String get inviteAcceptGoToButton => 'Ir para a Comunidade';

  @override
  String get inviteAcceptInvitesPaused => 'Convites em Pausa';

  @override
  String get inviteAcceptNotFoundTitle => 'Convite Inválido';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Este convite pode ter expirado ou ser inválido.';

  @override
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'Esse link pode estar quebrado, disponível apenas no navegador, ou você pode não ter acesso. Verifique o link e tente novamente.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'Entrar no grupo';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Você foi convidado para entrar em um chat em grupo por $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'alguém';

  @override
  String get inviteAcceptEmojiPack => 'Pacote de emojis';

  @override
  String get inviteAcceptStickerPack => 'Pacote de figurinhas';

  @override
  String get inviteAcceptInstallEmojiPack => 'Instalar pacote de emojis';

  @override
  String get inviteAcceptInstallStickerPack => 'Instalar pacote de figurinhas';

  @override
  String get inviteAcceptPackInstallNote =>
      'Aceitar este convite instala o pacote automaticamente.';

  @override
  String get mentionUnknownChannel => 'canal-desconhecido';

  @override
  String get channelAccessDeniedTitle => 'Acesso ao Canal Negado';

  @override
  String get channelAccessDeniedDescription =>
      'Você não tem acesso ao canal onde esta mensagem foi enviada.';

  @override
  String get messageJumpLinkNoAccess => 'Sem acesso';

  @override
  String get okay => 'Ok';

  @override
  String get embedThemeTitle => 'Tema Compartilhado';

  @override
  String get embedThemeSubtitle =>
      'Este cliente não suporta temas personalizados.';

  @override
  String get embedThemeUnavailableButton => 'Temas indisponíveis';

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
  String get privacySettings => 'Configurações de Privacidade';

  @override
  String get privacyDirectMessages => 'Mensagens Diretas';

  @override
  String get privacyDirectMessagesDescription =>
      'Permitir mensagens diretas de outros membros nesta comunidade';

  @override
  String get privacyBotDirectMessages => 'Mensagens Diretas de Bots';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Permitir que bots desta comunidade enviem mensagens diretas para você';

  @override
  String get privacyMutualDmsDisabled =>
      'Os administradores da comunidade desativaram o recebimento de mensagens diretas apenas de membros mútuos nesta comunidade.';

  @override
  String get communityDebug => 'Depuração da Comunidade';

  @override
  String get copiedToClipboard => 'Copiado para a área de transferência';

  @override
  String get notificationSettings => 'Configurações de Notificação';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Silenciar $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Silenciar uma comunidade impede que indicadores de não lidas e notificações apareçam, a menos que você seja mencionado';

  @override
  String get notificationCommunitySettings =>
      'Configurações de Notificação da Comunidade';

  @override
  String get notificationAllMessages => 'Todas as Mensagens';

  @override
  String get notificationOnlyMentions => 'Apenas Menções';

  @override
  String get notificationNothing => 'Nada';

  @override
  String get notificationSuppressEveryone => 'Suprimir @everyone e @here';

  @override
  String get notificationSuppressRoles => 'Suprimir todas as menções de cargo';

  @override
  String get notificationMobilePush => 'Notificações push para celular';

  @override
  String get notificationOverrides => 'Substituições de notificação';

  @override
  String get notificationSelectChannel => 'Selecionar um canal ou categoria';

  @override
  String get notificationOnlyAtMentions => 'Somente @menções';

  @override
  String get notificationMuteChannel => 'Silenciar canal';

  @override
  String get notificationUnmuteChannel => 'Ativar som do canal';

  @override
  String get notificationUseCategoryDefault => 'Use Category Default';

  @override
  String get notificationUseCommunityDefault => 'Use Community Default';

  @override
  String get notificationNoCategory => 'Sem categoria';

  @override
  String get dmMarkAsRead => 'Marcar como lido';

  @override
  String get dmMuteConversation => 'Silenciar DM';

  @override
  String get dmUnmuteConversation => 'Ativar som da DM';

  @override
  String get dmPinDm => 'Fixar DM';

  @override
  String get dmUnpinDm => 'Desafixar DM';

  @override
  String get dmAlwaysShowInSidebar => 'Sempre mostrar na barra lateral';

  @override
  String get dmRemoveFromAlwaysShown => 'Remover de sempre mostrados';

  @override
  String get dmCloseDm => 'Fechar DM';

  @override
  String get dmCloseDmConfirmTitle => 'Fechar DM';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Tem certeza de que deseja fechar sua DM com $username? Você sempre pode reabri-la mais tarde.';
  }

  @override
  String get dmDeleteMyMessagesTitle =>
      'Delete your messages in this conversation?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'This will permanently delete every message you have ever sent in this conversation. This cannot be undone.';

  @override
  String get dmCopyChannelId => 'Copiar ID do canal';

  @override
  String get dmChannelIdCopied => 'ID do canal copiado';

  @override
  String get dmCopyUserId => 'Copiar ID do usuário';

  @override
  String get dmUserIdCopied => 'ID do usuário copiado';

  @override
  String get dmViewProfile => 'Ver perfil';

  @override
  String get dmVoiceCall => 'Iniciar chamada de voz';

  @override
  String get incomingVoiceCallTitle => 'Chamada de voz recebida';

  @override
  String get incomingVoiceCallAccept => 'Aceitar';

  @override
  String get incomingVoiceCallDecline => 'Recusar';

  @override
  String get incomingVoiceCallLabel => 'Chamada recebida';

  @override
  String get incomingVoiceCallIgnore => 'Ignorar';

  @override
  String get directVoiceCallNotEligible =>
      'Esta chamada não pode ser iniciada agora. Tente novamente em um momento.';

  @override
  String get voiceJoinCallFailed =>
      'Não foi possível conectar a esta chamada. Verifique sua conexão e tente novamente.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Não foi possível ingressar nesta chamada. Verifique sua conexão e tente novamente.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Não foi possível atualizar esta chamada no servidor. Verifique sua conexão e tente novamente.';

  @override
  String get dmAddNote => 'Adicionar nota';

  @override
  String get dmEditGroup => 'Editar grupo';

  @override
  String get dmInviteToCommunity => 'Convidar para a comunidade';

  @override
  String get dmBlock => 'Bloquear';

  @override
  String get dmLeaveGroup => 'Sair do grupo';

  @override
  String get dmNoCommunitiesAvailable => 'Nenhuma comunidade disponível';

  @override
  String dmGroupMemberCount(int count) {
    return '$count membros';
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
  String get dmMuteFor3Days => 'Por 3 dias';

  @override
  String get dmMuteForever => 'Até eu reativar';

  @override
  String get dmPinGroupDm => 'Fixar DM de grupo';

  @override
  String get dmUnpinGroupDm => 'Desafixar conversa em grupo';

  @override
  String get dmUnnamedGroup => 'Grupo sem nome';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'Grupo de $resolvedName';
  }

  @override
  String get dmFavoriteDm => 'Favoritar conversa';

  @override
  String get dmUnfavoriteDm => 'Remover de favoritos';

  @override
  String get dmFavoriteGroupDm => 'Favoritar conversa em grupo';

  @override
  String get dmUnfavoriteGroupDm => 'Remover de favoritos conversa em grupo';

  @override
  String get dmChangeFriendNickname => 'Alterar apelido do amigo';

  @override
  String get dmRemoveFriend => 'Remover amigo';

  @override
  String get dmAddFriend => 'Adicionar amigo';

  @override
  String get dmAcceptFriendRequest => 'Aceitar solicitação de amizade';

  @override
  String get dmIgnoreFriendRequest => 'Ignorar solicitação de amizade';

  @override
  String get dmFriendRequestSent => 'Solicitação de amizade enviada';

  @override
  String get dmUnblock => 'Desbloquear';

  @override
  String get dmDebugUser => 'Depurar usuário';

  @override
  String get dmDebugChannel => 'Depurar canal';

  @override
  String get dmDebugCategory => 'Categoria de Depuração';

  @override
  String get dmPinned => 'Conversa fixada';

  @override
  String get dmUnpinned => 'Conversa desafixada';

  @override
  String get dmMuted => 'Conversa silenciada';

  @override
  String get dmUnmuted => 'Conversa dessilenciada';

  @override
  String get dmRemoveFriendConfirmTitle => 'Remover amigo';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Tem certeza de que deseja remover $username como amigo?';
  }

  @override
  String get dmBlockConfirmTitle => 'Bloquear usuário';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Tem certeza de que deseja bloquear $username? Ele não poderá enviar mensagens ou solicitações de amizade para você.';
  }

  @override
  String get dmFriendRequestSentToast => 'Solicitação de amizade enviada';

  @override
  String get dmFriendRequestFailed => 'Falha ao enviar solicitação de amizade';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Falha ao aceitar solicitação de amizade';

  @override
  String get dmRemoveFriendFailed => 'Falha ao remover amigo';

  @override
  String get dmBlockFailed => 'Falha ao bloquear usuário';

  @override
  String get dmUnblockFailed => 'Falha ao desbloquear usuário';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Falha ao ignorar solicitação de amizade';

  @override
  String get dmAddFriends => 'Adicionar amigos';

  @override
  String get addFriendSheetTitle => 'Adicionar amigo';

  @override
  String get addFriendUsernameHint => 'NomeDeUsuário#0000';

  @override
  String get addFriendUsernameLabel => 'Nome de usuário do amigo';

  @override
  String get addFriendSendRequest => 'Enviar solicitação';

  @override
  String get addFriendNoUserFound =>
      'Nenhum usuário encontrado com este nome de usuário.';

  @override
  String get addFriendInvalidUsername =>
      'Insira um nome de usuário válido (NomeDeUsuário#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Solicitação de amizade enviada';

  @override
  String get addFriendClaimTitle => 'Reivindique sua conta';

  @override
  String get addFriendClaimDescription =>
      'Reivindique sua conta para enviar solicitações de amizade.';

  @override
  String get addFriendVerifyTitle => 'Verifique seu e-mail';

  @override
  String get addFriendVerifyDescription =>
      'Você precisa verificar seu endereço de e-mail antes de poder enviar solicitações de amizade.';

  @override
  String get addFriendVerifyEmail => 'Verificar e-mail';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Solicitações de amizade recebidas ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Solicitações de amizade enviadas ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Solicitação de amizade recebida';

  @override
  String get addFriendOutgoingStatus => 'Solicitação de amizade enviada';

  @override
  String get addFriendViewProfile => 'Ver perfil';

  @override
  String get addFriendAccept => 'Aceitar';

  @override
  String get addFriendIgnore => 'Ignorar';

  @override
  String get addFriendAcceptTitle => 'Aceitar solicitação de amizade';

  @override
  String get addFriendIgnoreTitle => 'Ignorar solicitação de amizade';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Aceitar a solicitação de amizade de $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Ignorar a solicitação de amizade de $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Cancelar solicitação';

  @override
  String get addFriendCancelRequestFailed =>
      'Não foi possível cancelar a solicitação de amizade. Tente novamente.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Eles não estão aceitando solicitações de amizade no momento.';

  @override
  String get addFriendUnblockFirst =>
      'Desbloqueie-os primeiro para enviar uma solicitação de amizade.';

  @override
  String get addFriendCannotSendToSelf =>
      'Você não pode enviar uma solicitação de amizade para si mesmo.';

  @override
  String get addFriendAlreadyFriends => 'Vocês já são amigos.';

  @override
  String get addFriendClaimToSend =>
      'Termine de se inscrever para enviar solicitações de amizade.';

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
  String get emojiSearchPlaceholder => 'Encontre o emoji dos seus sonhos';

  @override
  String get emojiSearchEmpty => 'Nenhum emoji corresponde à sua pesquisa';

  @override
  String get emojiAutocompleteDefaultLabel => 'Emoji padrão';

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
  String get emojiFrequentlyUsed => 'Usados com frequência';

  @override
  String get emojiTabGifs => 'GIFs';

  @override
  String get emojiTabMedia => 'Mídia';

  @override
  String get emojiTabStickers => 'Stickers';

  @override
  String get emojiTabEmojis => 'Emojis';

  @override
  String get gifPickerSearch => 'Pesquisar GIFs';

  @override
  String get gifPickerSearchKlipy => 'Pesquisar KLIPY';

  @override
  String get gifPickerSearchTenor => 'Pesquisar Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Favoritos';

  @override
  String get gifPickerFavoritesEmptyTitle => 'No favorite GIFs yet';

  @override
  String get gifPickerFavoritesEmptyDescription => 'Star a GIF to see it here.';

  @override
  String get gifPickerTrending => 'GIFs em alta';

  @override
  String get gifPickerNoResultsTitle => 'Nenhum resultado de pesquisa';

  @override
  String get gifPickerNoResultsDescription => 'Tente outro termo de pesquisa';

  @override
  String get gifPickerLoadFailedTitle => 'Não foi possível carregar GIFs';

  @override
  String get gifPickerLoadFailedBody =>
      'Verifique sua conexão e tente novamente.';

  @override
  String get emojiCategoryPeople => 'Pessoas';

  @override
  String get emojiCategoryNature => 'Natureza';

  @override
  String get emojiCategoryFood => 'Comida e Bebida';

  @override
  String get emojiCategoryActivity => 'Atividades';

  @override
  String get emojiCategoryTravel => 'Viagem e Lugares';

  @override
  String get emojiCategoryObjects => 'Objetos';

  @override
  String get emojiCategorySymbols => 'Símbolos';

  @override
  String get emojiCategoryFlags => 'Bandeiras';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Desbloqueie $emojiCount de $communityCount com Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Obter Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Não mostrar novamente';

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
  String get externalLinkWarningTitle => 'Aviso de link externo';

  @override
  String externalLinkWarningLeaving(String productName) {
    return 'Você está prestes a sair do $productName';
  }

  @override
  String get externalLinkWarningDescription =>
      'Links externos podem ser perigosos. Por favor, tenha cuidado.';

  @override
  String get externalLinkWarningDestinationUrl => 'URL de destino:';

  @override
  String get externalLinksSectionTitle => 'Links Externos';

  @override
  String get externalLinksSectionDescription =>
      'Configure como os avisos de links externos são tratados.';

  @override
  String get externalLinkWarningTrustPrefix => 'Confiar sempre em ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — pular este aviso da próxima vez';

  @override
  String get externalLinkVisitSite => 'Visitar site';

  @override
  String get externalLinkTrustAllLabel => 'Confiar em todos os links externos';

  @override
  String get externalLinkStripTrackingLabel =>
      'Remover parâmetros de rastreamento de URLs';

  @override
  String get externalLinkStripTrackingDescription =>
      'Remova automaticamente parâmetros de rastreamento (como utm_source, fbclid, gclid) de URLs em mensagens que você envia. Limpa o link antes que ele chegue a qualquer outra pessoa.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Confiar em todos os links externos?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Isso confiará em todos os links externos e pulará o aviso para todos os domínios. Seus domínios confiáveis existentes serão substituídos. Isso é menos seguro.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Confiar em Todos';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Parar de confiar em todos os links?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Avisos de links externos serão exibidos novamente. Você precisará adicionar domínios confiáveis individualmente.';

  @override
  String get externalLinkStopTrustingAllAction => 'Desativar Confiança Total';

  @override
  String get externalLinkTrustedAllDescription =>
      'Todos os links externos são confiáveis. Avisos não serão exibidos.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Você tem $count domínio(s) confiável(is). Adicione mais marcando a caixa ao visitar links externos.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Quando ativado, nenhum aviso de link externo será exibido. Isso é menos seguro.';

  @override
  String get imageFileTooLarge =>
      'O arquivo de imagem é muito grande. Por favor, escolha um arquivo menor que 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Avatares animados exigem Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Banners animados exigem Plutonium';

  @override
  String get animatedAvifNotSupported => 'AVIF animado não suportado';

  @override
  String get animatedAvifNotSupportedBody =>
      'Cortar e girar arquivos AVIF animados ainda não é suportado. Se você prosseguir, ele será carregado em sua forma original.';

  @override
  String get uploadAsIs => 'Carregar como está';

  @override
  String get croppingAnimatedNotSupported =>
      'Cortar imagens animadas ainda não é suportado. O upload original será usado.';

  @override
  String get cropAvatar => 'Cortar Avatar';

  @override
  String get cropBanner => 'Cortar Banner';

  @override
  String get skip => 'Pular';

  @override
  String get crop => 'Cortar';

  @override
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => 'Alterar sua Nome de usuário';

  @override
  String get fluxerTagInputLabel => 'Nome de usuário';

  @override
  String get fluxerTagDescriptionBase =>
      'Nomes de usuário só podem conter letras (a-z, A-Z), números (0-9) e underscores. Nomes de usuário não diferenciam maiúsculas de minúsculas.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Nomes de usuário só podem conter letras (a-z, A-Z), números (0-9) e underscores. Nomes de usuário não diferenciam maiúsculas de minúsculas. Você pode escolher qualquer tag de 4 dígitos disponível de #0000 a #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Nomes de usuário só podem conter letras (a-z, A-Z), números (0-9) e underscores. Nomes de usuário não diferenciam maiúsculas de minúsculas. Você pode escolher qualquer tag de 4 dígitos disponível de #0001 a #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Entre $min e $max caracteres';
  }

  @override
  String get validationAllowedChars =>
      'Apenas letras (a-z, A-Z), números (0-9) e underscores (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Obtenha Plutonium para personalizar sua tag ou mantê-la ao alterar seu nome de usuário';

  @override
  String get fluxerTagAlreadyTaken => 'Nome de usuário já em uso';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'A Nome de usuário $username#$discriminator já está em uso. Continuar irá gerar automaticamente um novo discriminador.';
  }

  @override
  String get customTagIsTemporary => 'Tag personalizada é temporária';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Sua tag personalizada de 4 dígitos só estará disponível enquanto sua assinatura Plutonium estiver ativa. Quando sua assinatura expirar em $date, sua tag voltará a ser um número atribuído aleatoriamente após um período de carência de 3 dias.';
  }

  @override
  String get customTagTemporaryBody =>
      'Sua tag personalizada de 4 dígitos só estará disponível enquanto sua assinatura Plutonium estiver ativa. Quando sua assinatura expirar, sua tag voltará a ser um número atribuído aleatoriamente após um período de carência de 3 dias.';

  @override
  String get iUnderstandContinue => 'Entendi, Continuar';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Se você salvar esta Nome de usuário, sua tag personalizada de 4 dígitos voltará a ser um número aleatório quando sua assinatura Plutonium terminar. Se sua assinatura não for renovada, você terá um período de carência de 3 dias antes que a tag mude.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Sua tag personalizada de 4 dígitos (#$discriminator) está ativa enquanto sua assinatura Plutonium estiver ativa. Se sua assinatura terminar ou não for renovada após um período de carência de 3 dias, sua tag voltará a ser um número aleatório.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Personalize sua tag de 4 dígitos ou mantenha-a ao alterar seu nome de usuário';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Seu teste Plutonium expira em $date. Faça upgrade para manter sua tag personalizada e ganhar um distintivo em seu perfil.';
  }

  @override
  String get premiumTrialActive =>
      'Você está em um teste Plutonium. Faça upgrade para manter sua tag personalizada e ganhar um distintivo em seu perfil.';

  @override
  String get fluxerTagUpdated => 'Nome de usuário atualizada';

  @override
  String get fluxerTagUpdateFailed =>
      'Falha ao atualizar Nome de usuário. Por favor, tente novamente.';

  @override
  String get continueAction => 'Continuar';

  @override
  String get profileCustomizationTitle => 'Personalização do Perfil';

  @override
  String get profileCustomizationDescription =>
      'Edite a aparência do seu perfil e veja uma prévia ao vivo';

  @override
  String get usernameLabel => 'Nome de usuário';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Reivindique sua conta para alterar sua Nome de usuário';

  @override
  String get changeFluxerTag => 'Alterar Nome de usuário';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Personalize sua tag de 4 dígitos (#$discriminator) como quiser com Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Altere seu nome de usuário e tag de 4 dígitos';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Sua tag personalizada (#$discriminator) está vinculada à sua assinatura Plutonium e voltará a ser uma tag aleatória se expirar.';
  }

  @override
  String get displayNameLabel => 'Nome de Exibição';

  @override
  String get pronounsLabel => 'Pronomes';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Alterar Avatar';

  @override
  String get removeAvatar => 'Remover Avatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Máx. 10MB. Recomendado: 512×512px';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get changeBanner => 'Alterar Banner';

  @override
  String get removeBanner => 'Remover Banner';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Máx. 10MB. Mínimo: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Cor de Destaque';

  @override
  String get accentColorDescription =>
      'Personaliza a cor da borda e do banner do seu perfil';

  @override
  String get aboutMeLabel => 'Sobre Mim';

  @override
  String get aboutMeHelperText => 'Você pode usar links, emojis e Markdown.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle => 'Privacidade do Selo Plutonium';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Controle como seu selo Plutonium é exibido para outras pessoas';

  @override
  String get hidePlutoniumBadgeLabel => 'Ocultar selo Plutonium completamente';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Oculte completamente seu selo Plutonium de outros usuários';

  @override
  String get hidePlutoniumPurchaseDate => 'Ocultar data de compra do Plutonium';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Ocultar data de compra do Plutonium ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Remova a data em que você comprou o Plutonium pela primeira vez do seu selo';

  @override
  String get maskVisionaryAsSubscription =>
      'Mascarar Visionary como assinatura';

  @override
  String get maskVisionaryDescription =>
      'Mostre seu Visionary como uma assinatura regular em vez disso';

  @override
  String get hideVisionaryIdBadge => 'Ocultar selo de ID Visionary';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Ocultar selo de ID Visionary (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Remova seu selo de ID Visionary';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Você está em um teste Plutonium — sua assinatura começa em $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Sua assinatura começará automaticamente quando seu teste terminar. Nenhuma ação é necessária.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Você está em um teste Plutonium que expira em $date';
  }

  @override
  String get premiumTrialActiveProfile => 'Você está em um teste Plutonium';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Máx. 10MB. Recomendado: 512×512px. Avatares animados (GIF) exigem Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Personalize seu perfil com uma imagem de banner estática ou animada para destacá-lo.';

  @override
  String get getPlutonium => 'Obter Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Compras no aplicativo ainda não estão disponíveis nesta plataforma. Fique ligado — em breve!';

  @override
  String get profilePreviewLabel => 'Prévia';

  @override
  String get profilePreviewMessage => 'Mensagem';

  @override
  String profilePreviewMemberSince(String productName) {
    return 'Membro $productName Desde';
  }

  @override
  String get unclaimedAccountTitle => 'Conta Não Reivindicada';

  @override
  String get unclaimedAccountDescription =>
      'Sua conta ainda não foi reivindicada. Sem um e-mail e senha, você pode perder o acesso. Reivindique sua conta agora para protegê-la.';

  @override
  String get claimAccount => 'Reivindicar Conta';

  @override
  String get profileTypeLabel => 'Tipo de Perfil';

  @override
  String get profileTypeGlobal => 'Perfil Global';

  @override
  String get profileTypeGuildDescription =>
      'Você está editando seu perfil por comunidade. Este perfil só será visível nesta comunidade e substituirá seu perfil global.';

  @override
  String get communityNicknameLabel => 'Apelido da Comunidade';

  @override
  String get perGuildPremiumUpsellText =>
      'Personalizar seu avatar, banner, cor de destaque e biografia para comunidades individuais requer Plutonium. Apelido e pronomes da comunidade são gratuitos para todos.';

  @override
  String get avatarModeInherit => 'Usar Perfil Global';

  @override
  String get avatarModeCustom => 'Usar Imagem Personalizada';

  @override
  String get avatarModeUnset => 'Não Mostrar';

  @override
  String get profileSavedToast => 'Perfil atualizado';

  @override
  String get profileEditButton => 'Editar Perfil';

  @override
  String get profileNoteLabel => 'Nota';

  @override
  String get profileNoteVisibility => '(visível apenas para você)';

  @override
  String get profileNoteEmpty => 'Nenhuma nota ainda.';

  @override
  String get sudoTitle => 'Verifique Sua Identidade';

  @override
  String get sudoDescription => 'Esta ação requer verificação para continuar.';

  @override
  String get sudoAuthenticatorCode => 'Código do Autenticador';

  @override
  String get sudoMethodPassword => 'Senha';

  @override
  String get sudoMethodTotp => 'Autenticador';

  @override
  String get sudoVerificationFailed => 'Falha na verificação. Tente novamente.';

  @override
  String get securityAccountTitle => 'Conta';

  @override
  String get securityAccountDescription =>
      'Gerencie seu e-mail, senha e configurações da conta';

  @override
  String get securitySectionTitle => 'Segurança';

  @override
  String get securitySectionDescription =>
      'Proteja sua conta com autenticação de dois fatores e passkeys';

  @override
  String get securityLoginEmailSectionTitle => 'Configurações de E-mail';

  @override
  String securityLoginEmailSectionDescription(String productName) {
    return 'Gerencie o endereço de e-mail que você usa para fazer login no $productName';
  }

  @override
  String get securityLoginEmailAddressLabel => 'Endereço de E-mail';

  @override
  String get securityLoginNoEmailSet => 'Nenhum endereço de e-mail definido';

  @override
  String get securityLoginChangeEmail => 'Alterar E-mail';

  @override
  String get securityLoginAddEmail => 'Adicionar E-mail';

  @override
  String get securityLoginReveal => 'Revelar';

  @override
  String get securityLoginHide => 'Ocultar';

  @override
  String get securityLoginPasswordSectionTitle => 'Senha';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Altere sua senha para manter sua conta segura';

  @override
  String get securityLoginCurrentPasswordLabel => 'Senha Atual';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Última alteração: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Última alteração: Nunca';

  @override
  String get securityLoginNoPasswordSet => 'Nenhuma senha definida';

  @override
  String get securityLoginChangePassword => 'Alterar Senha';

  @override
  String get securityLoginSetPassword => 'Definir Senha';

  @override
  String get passwordChangeTitle => 'Alterar Senha';

  @override
  String get passwordChangeIntroDescription =>
      'Enviaremos um código de verificação para seu endereço de e-mail para confirmar sua identidade antes de alterar sua senha.';

  @override
  String get passwordChangeStart => 'Começar';

  @override
  String get passwordChangeVerifyTitle => 'Verifique Seu E-mail';

  @override
  String get passwordChangeVerifyDescription =>
      'Digite o código de verificação enviado para seu endereço de e-mail.';

  @override
  String get passwordChangeVerificationCode => 'Código de Verificação';

  @override
  String get passwordChangeVerify => 'Verificar';

  @override
  String get passwordChangeNewPasswordTitle => 'Definir Nova Senha';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Digite sua nova senha abaixo.';

  @override
  String get passwordChangeNewPassword => 'Nova Senha';

  @override
  String get passwordChangeConfirmPassword => 'Confirmar Nova Senha';

  @override
  String get passwordChangeSubmit => 'Alterar Senha';

  @override
  String get passwordChangeSuccess => 'Senha alterada';

  @override
  String get passwordChangePasswordsDoNotMatch => 'As senhas não coincidem';

  @override
  String get passwordChangeInvalidCode => 'Código inválido ou expirado';

  @override
  String get emailChangeTitle => 'Alterar e-mail';

  @override
  String get emailChangeIntroDescription =>
      'Enviaremos códigos de verificação para confirmar sua identidade antes de alterar seu endereço de e-mail.';

  @override
  String get emailChangeStart => 'Começar';

  @override
  String get emailChangeVerifyOriginalTitle => 'Verificar e-mail atual';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Digite o código de verificação enviado para seu endereço de e-mail atual.';

  @override
  String get emailChangeNewEmailTitle => 'Inserir novo e-mail';

  @override
  String get emailChangeNewEmailDescription =>
      'Digite o novo endereço de e-mail que você deseja usar.';

  @override
  String get emailChangeNewEmailLabel => 'Novo e-mail';

  @override
  String get emailChangeNewEmailSubmit => 'Enviar código de verificação';

  @override
  String get emailChangeVerifyNewTitle => 'Verificar novo e-mail';

  @override
  String get emailChangeVerifyNewDescription =>
      'Digite o código de verificação enviado para seu novo endereço de e-mail.';

  @override
  String get emailChangeSuccess => 'E-mail alterado';

  @override
  String get emailChangeInvalidCode => 'Código inválido ou expirado';

  @override
  String get resend => 'Reenviar';

  @override
  String resendCountdown(int seconds) {
    return 'Reenviar (${seconds}s)';
  }

  @override
  String get verificationCode => 'Código de verificação';

  @override
  String get verify => 'Verificar';

  @override
  String get enable => 'Ativar';

  @override
  String get disable => 'Desativar';

  @override
  String get delete => 'Excluir';

  @override
  String get save => 'Salvar';

  @override
  String get securityTfaSectionTitle => 'Autenticação de dois fatores';

  @override
  String get securityTfaSectionDescription =>
      'Adicione uma camada extra de segurança à sua conta';

  @override
  String get securityTfaAuthenticatorApp => 'App autenticador';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Autenticação de dois fatores está ativada';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Use um app autenticador para gerar códigos para autenticação de dois fatores';

  @override
  String get securityTfaBackupCodes => 'Códigos de backup';

  @override
  String get securityTfaBackupCodesDescription =>
      'Visualize e gerencie seus códigos de backup para recuperação de conta';

  @override
  String get securityTfaViewCodes => 'Ver códigos';

  @override
  String get securityPasskeysSectionTitle => 'Chaves de acesso';

  @override
  String get securityPasskeysSectionDescription =>
      'Use chaves de acesso para login sem senha e autenticação de dois fatores';

  @override
  String get securityPasskeysRegistered => 'Chaves de acesso registradas';

  @override
  String get securityPasskeysNone => 'Nenhuma chave de acesso registrada';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'chaves de acesso',
      one: 'chave de acesso',
    );
    return '$count $_temp0 registradas (máx. 10)';
  }

  @override
  String get securityPasskeysAdd => 'Adicionar chave de acesso';

  @override
  String securityPasskeysAdded(String date) {
    return 'Adicionada em: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Último uso: $date';
  }

  @override
  String get securityPasskeysRename => 'Renomear';

  @override
  String get securityPasskeysDeleteTitle => 'Excluir chave de acesso';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Tem certeza de que deseja excluir a chave de acesso \"$name\"?';
  }

  @override
  String get securityPasskeyNameTitle => 'Nomear chave de acesso';

  @override
  String get securityPasskeyNameLabel => 'Nome da chave de acesso';

  @override
  String get securityPasskeyNameHint =>
      'Ex: YubiKey, iPhone, Computador do trabalho';

  @override
  String get securityPhoneSectionTitle => 'Número de telefone';

  @override
  String get securityPhoneSectionDescription =>
      'Gerencie seu número de telefone.';

  @override
  String get securityPhoneLabel => 'Número de telefone';

  @override
  String get securityPhoneNone => 'Nenhum número de telefone adicionado.';

  @override
  String get securityPhoneAdd => 'Adicionar telefone';

  @override
  String get securityPhoneRemove => 'Remover';

  @override
  String get securityPhoneRemoveTitle => 'Remover número de telefone';

  @override
  String get securityPhoneRemoveDescription =>
      'Tem certeza de que deseja remover seu número de telefone?';

  @override
  String get securityPhoneRemoved => 'Número de telefone removido';

  @override
  String get securityClaimTitle => 'Recursos de Segurança';

  @override
  String get securityClaimDescription =>
      'Reivindique sua conta para acessar recursos de segurança como autenticação de dois fatores e chaves de acesso.';

  @override
  String get securityVerifyEmailRequired =>
      'Você precisa verificar seu endereço de e-mail antes de configurar a autenticação de dois fatores, chaves de acesso ou verificação por SMS.';

  @override
  String get totpEnableTitle => 'Configurar App Autenticador';

  @override
  String get totpEnableDescription =>
      'Escaneie o código QR com seu aplicativo autenticador para gerar códigos para autenticação de dois fatores.';

  @override
  String get totpEnableCodeLabel => 'Código';

  @override
  String get totpEnableCodeHint =>
      'Digite o código de 6 dígitos do seu aplicativo autenticador';

  @override
  String get totpEnableSuccess => 'Autenticação de dois fatores ativada';

  @override
  String get totpDisableTitle => 'Remover App Autenticador';

  @override
  String get totpDisableDescription =>
      'Digite o código de 6 dígitos do seu aplicativo autenticador para desativar a autenticação de dois fatores.';

  @override
  String get totpDisableSuccess => 'Autenticação de dois fatores desativada';

  @override
  String get backupCodesTitle => 'Códigos de Backup';

  @override
  String get backupCodesWarning =>
      'Se você perder o acesso ao seu aplicativo autenticador e não tiver esses códigos, ficará permanentemente bloqueado fora da sua conta. Baixe ou copie-os agora e guarde-os em um local seguro.';

  @override
  String get backupCodesDownload => 'Baixar';

  @override
  String get backupCodesCopy => 'Copiar';

  @override
  String get backupCodesCopied =>
      'Códigos de backup copiados para a área de transferência';

  @override
  String get backupCodesAcknowledge =>
      'Eu baixei ou copiei meus códigos de backup e os guardei em um local seguro.';

  @override
  String get backupCodesDone => 'Concluído';

  @override
  String get backupCodesViewTitle => 'Ver Códigos de Backup';

  @override
  String get backupCodesViewDescription =>
      'A verificação pode ser necessária antes de visualizar seus códigos de backup.';

  @override
  String get phoneAddTitle => 'Adicionar Número de Telefone';

  @override
  String get phoneAddLabel => 'Número de Telefone';

  @override
  String get phoneAddHint => 'Digite seu número de telefone';

  @override
  String get phoneAddFooter =>
      'Digite seu número de telefone. Enviaremos um código de verificação por SMS.';

  @override
  String get phoneAddSendCode => 'Enviar Código';

  @override
  String get phoneVerifyTitle => 'Verificar Número de Telefone';

  @override
  String get phoneVerifyDescription =>
      'Digite o código de verificação enviado para o seu número de telefone.';

  @override
  String get phoneAddSuccess => 'Número de telefone adicionado';

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
  String requiredActionIntroGeneric(String productName) {
    return 'Complete the required verification to continue using $productName.';
  }

  @override
  String get requiredActionIntroPhone =>
      'Your registration needs an extra anti-spam check before you can continue.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return 'Verify your email or phone to continue using $productName.';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return 'Complete the required email and phone verification steps below to continue using $productName.';
  }

  @override
  String get requiredActionChooseMethodTitle => 'Choose a verification method';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return 'Complete one of the verification paths below to continue using $productName.';
  }

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
  String get dangerZoneSectionTitle => 'Zona de Perigo';

  @override
  String get dangerZoneSectionDescription =>
      'Ações irreversíveis e destrutivas';

  @override
  String get dangerZoneDisableTitle => 'Desativar Conta';

  @override
  String get dangerZoneDisableDescription =>
      'Desative sua conta temporariamente. Você pode reativá-la mais tarde fazendo login novamente.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Desativar sua conta fará logout de todas as sessões. Você pode reativar sua conta a qualquer momento fazendo login novamente.';

  @override
  String get dangerZoneDeleteTitle => 'Excluir Conta';

  @override
  String get dangerZoneDeleteDescription =>
      'Exclua permanentemente sua conta e todos os dados associados. Esta ação não pode ser desfeita.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Cancele sua assinatura ativa do Plutonium nas configurações do Plutonium antes de excluir sua conta.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount =>
      'Não é possível excluir a conta';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Você não pode excluir sua conta enquanto for proprietário de comunidades. Transfira a propriedade das seguintes comunidades primeiro:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'e mais $count';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Para transferir a propriedade, acesse $settingsPath e use a opção de transferir propriedade.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Tem certeza de que deseja excluir sua conta? Esta ação agendará sua conta para exclusão permanente.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Você pode cancelar o processo de exclusão em até 14 dias';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Após 14 dias, sua conta será permanentemente excluída';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Após o processamento da exclusão, você não poderá recuperar o acesso à sua conta';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Você não poderá excluir suas mensagens enviadas após a exclusão da sua conta';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Se você deseja exportar seus dados ou excluir suas mensagens primeiro, visite a seção Painel de Privacidade em Configurações do Usuário antes de prosseguir.';

  @override
  String get claimAccountTitle => 'Reivindicar Sua Conta';

  @override
  String get claimAccountDescription =>
      'Reivindique sua conta adicionando um e-mail e senha. Enviaremos um código de verificação para confirmar seu e-mail antes de finalizar.';

  @override
  String get claimAccountEmailLabel => 'E-mail';

  @override
  String get claimAccountPasswordLabel => 'Senha';

  @override
  String get claimAccountSendCode => 'Enviar código';

  @override
  String get claimAccountVerifyDescription =>
      'Digite o código que enviamos para o seu e-mail para verificá-lo. Sua senha será definida assim que o código for confirmado.';

  @override
  String get claimAccountSuccess => 'Conta reivindicada com sucesso';

  @override
  String get importantInformation => 'Informações importantes:';

  @override
  String get genericError => 'Ocorreu um erro';

  @override
  String get networkErrorMessage => 'Something went wrong. Please try again.';

  @override
  String get invalidCode => 'Código inválido';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'há $count anos',
      one: 'há 1 ano',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'há $count meses',
      one: 'há 1 mês',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'há $count dias',
      one: 'há 1 dia',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'há $count horas',
      one: 'há 1 hora',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'há $count minutos',
      one: 'há 1 minuto',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count weeks ago',
      one: '1 week ago',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count minutes',
      one: 'in 1 minute',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count hours',
      one: 'in 1 hour',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count days',
      one: 'in 1 day',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count weeks',
      one: 'in 1 week',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count months',
      one: 'in 1 month',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count years',
      one: 'in 1 year',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'agora mesmo';

  @override
  String get authorizedAppsTitle => 'Aplicativos Autorizados';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Estes aplicativos receberam acesso à sua conta $productName.';
  }

  @override
  String get authorizedAppsEmptyTitle => 'Nenhum Aplicativo Autorizado';

  @override
  String get authorizedAppsEmptyDescription =>
      'Você ainda não autorizou nenhum aplicativo a acessar sua conta.';

  @override
  String get authorizedAppsLoadError =>
      'Falha ao Carregar Aplicativos Autorizados';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Autorizado em $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Permissões concedidas';

  @override
  String get authorizedAppsRevoke => 'Revogar';

  @override
  String get authorizedAppsRevokeTitle => 'Revogar acesso do aplicativo';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Tem certeza de que deseja revogar o acesso de $appName? Este aplicativo não terá mais acesso à sua conta.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Acessar minhas informações básicas de perfil (nome de usuário, avatar, etc.)';

  @override
  String get authorizedAppsScopeEmail => 'Ver meu endereço de e-mail';

  @override
  String get authorizedAppsScopeGuilds =>
      'Ver as comunidades das quais sou membro';

  @override
  String get authorizedAppsScopeConnections => 'Ver minhas contas conectadas';

  @override
  String get authorizedAppsScopeBot =>
      'Adicionar um bot a uma comunidade com as permissões solicitadas';

  @override
  String get authorizedAppsScopeAdmin => 'Acessar endpoints administrativos';

  @override
  String get privacyPendingDeletionTitle => 'Pendente de Exclusão';

  @override
  String get blockedUsersTitle => 'Usuários Bloqueados';

  @override
  String get blockedUsersDescription =>
      'Usuários bloqueados não podem enviar solicitações de amizade ou mensagens diretas para você.';

  @override
  String get blockedUsersEmptyTitle => 'Nenhum Usuário Bloqueado';

  @override
  String get blockedUsersEmptyDescription => 'Você ainda não bloqueou ninguém.';

  @override
  String get blockedUsersLoadError => 'Falha ao Carregar Usuários Bloqueados';

  @override
  String get blockedUsersUnblock => 'Desbloquear';

  @override
  String get blockedUsersUnblockTitle => 'Desbloquear Usuário';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Tem certeza de que deseja desbloquear $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Copiar Nome de usuário';

  @override
  String get blockedUsersCopyId => 'Copiar ID do Usuário';

  @override
  String get userProfileLoadError => 'Não foi possível carregar o perfil';

  @override
  String get userProfileLoading => 'Loading profile';

  @override
  String get userProfileRetry => 'Tentar novamente';

  @override
  String get userProfileMessage => 'Mensagem';

  @override
  String get userProfileVoiceCall => 'Chamada de Voz';

  @override
  String get userProfileVideoCall => 'Chamada de Vídeo';

  @override
  String get userProfileEditProfile => 'Editar Perfil';

  @override
  String userProfileStaffBadgeTooltip(String productName) {
    return 'Equipe $productName';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return 'Equipe da Comunidade $productName';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return 'Parceiro $productName';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return 'Caçador de Bugs do $productName';
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
    return 'Assinante Plutonium do $productName desde $date';
  }

  @override
  String userProfileVisionaryBadgeTooltip(String productName) {
    return 'Visionário do $productName';
  }

  @override
  String userProfileVisionaryBadgeSinceTooltip(
    String productName,
    String date,
  ) {
    return 'Visionário do $productName desde $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'ID Visionário #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Amigos em Comum ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Comunidades em Comum ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Amigos em Comum';

  @override
  String get userProfileMutualCommunitiesTitle => 'Comunidades em Comum';

  @override
  String get userProfileNoMutualFriends => 'Nenhum amigo em comum encontrado.';

  @override
  String get userProfileNoMutualCommunities =>
      'Nenhuma comunidade em comum encontrada.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Apelido: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Abrir DM';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Você bloqueou $username. Você não poderá enviar mensagens a menos que o desbloqueie.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Desbloquear';

  @override
  String get userProfileOpenDm => 'Abrir DM';

  @override
  String get userProfileNoteTitle => 'Nota';

  @override
  String get userProfileNoteVisibility => '(visível apenas para você)';

  @override
  String get userProfileNoteSave => 'Salvar';

  @override
  String get userProfileNoteDelete => 'Excluir';

  @override
  String get userProfileNoteEmpty => 'Clique para adicionar uma nota';

  @override
  String get userProfileMemberSince => 'Membro desde';

  @override
  String get userProfileAboutMe => 'Sobre Mim';

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
  String get userProfileLocalTime => 'Horário local';

  @override
  String get userProfileSameTimeAsYou => 'Mesmo fuso horário de você';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return '$duration à sua frente';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return '$duration atrás de você';
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
  String get userProfileCopyUsername => 'Copiar nome de usuário';

  @override
  String get userProfileCopyUserId => 'Copiar ID do usuário';

  @override
  String get userProfileViewMainProfile => 'Ver Perfil Principal';

  @override
  String get userProfileViewCommunityProfile => 'Ver Perfil da Comunidade';

  @override
  String get userProfileBlockUser => 'Bloquear usuário';

  @override
  String get userProfileUnblockUser => 'Desbloquear usuário';

  @override
  String get userProfileRemoveFriend => 'Remover amigo';

  @override
  String get userProfileBlockConfirmTitle => 'Bloquear usuário';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Tem certeza de que deseja bloquear $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Desbloquear usuário';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Tem certeza de que deseja desbloquear $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Remover amigo';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Tem certeza de que deseja remover $username como amigo?';
  }

  @override
  String get userProfileFailedOpenDm => 'Falha ao abrir DM';

  @override
  String get userProfileFailedSaveNote => 'Falha ao salvar nota';

  @override
  String get userProfileActionFailed =>
      'Ação falhou, por favor, tente novamente';

  @override
  String get userProfileChangeNickname => 'Alterar apelido';

  @override
  String get userProfileKick => 'Expulsar';

  @override
  String get userProfileBan => 'Banir';

  @override
  String get userProfileTimeout => 'Silenciar';

  @override
  String get userProfileRemoveTimeout => 'Remover silenciamento';

  @override
  String get userProfileTransferOwnership => 'Transferir propriedade';

  @override
  String get userProfileReportUser => 'Denunciar usuário';

  @override
  String get userProfileReportMessage => 'Denunciar mensagem';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Expulsar $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Tem certeza de que deseja expulsar $username? Ele(a) poderá retornar com um novo convite.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Remover o silenciamento?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Remover o silenciamento permitirá que $username envie mensagens, reaja e participe de canais de voz novamente.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Transferir propriedade?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Transferir a propriedade desta comunidade para $username? Isso é irreversível e você perderá todos os privilégios de proprietário.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Banir $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Duração do banimento';

  @override
  String get userProfileBanCustomSecondsLabel =>
      'Duração personalizada (segundos)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Qualquer valor de $min a $max segundos';
  }

  @override
  String get userProfileBanDeleteHistoryLabel =>
      'Excluir histórico de mensagens';

  @override
  String get userProfileBanDeleteNone => 'Não excluir nenhuma';

  @override
  String get userProfileBanDelete24h => 'Últimas 24 horas';

  @override
  String get userProfileBanDelete7d => 'Últimos 7 dias';

  @override
  String get userProfileBanReasonLabel => 'Motivo (opcional)';

  @override
  String get userProfileBanReasonHint => 'Digite um motivo para o banimento';

  @override
  String get userProfileBanSubmit => 'Banir membro';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Silenciar $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Duração do silenciamento';

  @override
  String get userProfileTimeoutSubmit => 'Silenciar membro';

  @override
  String get userProfileNicknameLabel => 'Apelido';

  @override
  String get userProfileNicknameHint => 'Digite um apelido';

  @override
  String get userProfileNicknameSave => 'Salvar';

  @override
  String userProfileKickSuccess(String username) {
    return '$username foi expulso';
  }

  @override
  String userProfileBanSuccess(String username) {
    return '$username foi banido';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return '$username foi silenciado';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Silenciamento removido para $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Apelido atualizado';

  @override
  String get userProfileTransferSuccess => 'Propriedade transferida';

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
  String get duration1Day => '1 dia';

  @override
  String get duration3Days => '3 dias';

  @override
  String get duration5Days => '5 dias';

  @override
  String get duration1Week => '1 semana';

  @override
  String get duration2Weeks => '2 semanas';

  @override
  String get duration1Month => '1 mês';

  @override
  String get durationCustom => 'Personalizado…';

  @override
  String get iarReportUserTitle => 'Denunciar usuário';

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
  String get iarReasonInappropriateProfile => 'Perfil inapropriado';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'O perfil deste usuário contém conteúdo inapropriado';

  @override
  String typingIndicatorOne(String name) {
    return '$name está digitando...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 e $name2 estão digitando...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 e $name3 estão digitando...';
  }

  @override
  String get typingIndicatorMultiple => 'Várias pessoas estão digitando...';

  @override
  String get typingIndicatorHandful =>
      'Um punhado de guerreiros do teclado está se reunindo...';

  @override
  String get typingIndicatorSymphony =>
      'Uma sinfonia de teclas batendo está em andamento...';

  @override
  String get typingIndicatorFiesta => 'É uma baita festa de digitação aqui';

  @override
  String get typingIndicatorApocalypse => 'Uau, é um apocalipse de digitação';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Que bom que você veio, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Bem-vindo, $username! Sinta-se em casa.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Olá, $username! Que bom ter você aqui.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Olá, $username! Participe quando estiver pronto.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Ei $username, que bom ver você aqui!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Olá, $username! Espero que você aproveite sua estadia.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Ei, $username, bem-vindo a bordo!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Que bom que você chegou, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Bem-vindo, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Bem-vindo, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Bem-vindo, $username! Ficamos felizes em ter você aqui.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Bem-vindo, $username! Espero que você aproveite seu tempo aqui.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Bem-vindo, $username! Sua próxima conversa começa aqui.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Bem-vindo, $username. Estamos felizes em ter você aqui.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Que bom ver você, $username! Bem-vindo.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Você chegou, $username! Que bom ter você conosco.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Você chegou, $username! Vamos começar.';
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
      other: '${count}m',
      one: '1mês',
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
  String get linkedDevicesTitle => 'Meus Dispositivos';

  @override
  String get linkedDevicesDescription =>
      'Veja todos os dispositivos que estão atualmente conectados à sua conta. Revogue quaisquer sessões que você não reconheça.';

  @override
  String get linkedDevicesCurrentDevice => 'Dispositivo Atual';

  @override
  String get linkedDevicesOtherDevices => 'Outros Dispositivos';

  @override
  String get linkedDevicesEnterSelection => 'Entrar no Modo de Seleção';

  @override
  String get linkedDevicesExitSelection => 'Sair do Modo de Seleção';

  @override
  String get linkedDevicesSelectAll => 'Selecionar Tudo';

  @override
  String get linkedDevicesClearSelection => 'Limpar Seleção';

  @override
  String get linkedDevicesRevokeTooltip => 'Revogar dispositivo';

  @override
  String get linkedDevicesSignOutAll => 'Sair de todos os outros dispositivos';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sair de $count dispositivos',
      one: 'Sair de 1 dispositivo',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sair de $count dispositivos',
      one: 'Sair de 1 dispositivo',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Sair de todos os outros dispositivos';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Isso desconectará os dispositivos selecionados da sua conta. Você precisará fazer login novamente nesses dispositivos.',
      one:
          'Isso desconectará o dispositivo selecionado da sua conta. Você precisará fazer login novamente nesse dispositivo.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Isso desconectará os dispositivos selecionados da sua conta. Você precisará fazer login novamente nesses dispositivos.';

  @override
  String get linkedDevicesSignOutConfirm => 'Continuar';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Você terá que fazer login novamente em todos os dispositivos desconectados';

  @override
  String get linkedDevicesLoadErrorTitle => 'Erro de Rede';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Estamos com problemas para nos conectar ao contínuo espaço-tempo. Verifique sua conexão e tente novamente.';

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
      'Não foi possível desconectar. Tente novamente.';

  @override
  String get linkedDevicesUnknownOs => 'SO Desconhecido';

  @override
  String get linkedDevicesUnknownPlatform => 'Plataforma Desconhecida';

  @override
  String slowmodeLabel(String duration) {
    return '$duration modo lento';
  }

  @override
  String get slowmodeTooltipActive =>
      'Você está em modo lento. Por favor, espere antes de enviar outra mensagem.';

  @override
  String get slowmodeTooltipImmune =>
      'O modo lento está ativado, mas você é imune.';

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
      'Você não pode enviar mensagens neste canal.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Anúncios do sistema da equipe do $productName. Você não pode responder aqui.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'A mensagem está temporariamente pausada nesta comunidade.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Você foi silenciado. Mensagens, reações e voz estão pausados até que o tempo limite expire.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Você precisa reivindicar sua conta para enviar mensagens nesta comunidade.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Você precisa verificar seu e-mail para enviar mensagens nesta comunidade.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Sua conta é muito nova para enviar mensagens nesta comunidade.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Você não é membro desta comunidade há tempo suficiente para enviar mensagens.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Você precisa verificar um número de telefone para enviar mensagens nesta comunidade.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Verificar e-mail';

  @override
  String get channelComposerBarrierVerifyPhone => 'Verificar telefone';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Muitos anexos (máx. $max)';
  }

  @override
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName excede o limite de tamanho ($fileSize)';
  }

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Esses arquivos são muito grandes para enviar juntos';

  @override
  String get chatAttachmentDropToUpload =>
      'Solte os arquivos para fazer upload';

  @override
  String get chatAttachmentDropToSend => 'Solte os arquivos para enviar agora';

  @override
  String get chatAttachmentSendVoiceMessage => 'Enviar mensagem de voz';

  @override
  String get voiceMessageTitle => 'Mensagem de voz';

  @override
  String get voiceMessageHoldHint =>
      'Segure para gravar. Arraste para cima para travar ou solte para enviar.';

  @override
  String get voiceMessageDiscard => 'Descartar mensagem de voz';

  @override
  String get voiceMessageSend => 'Enviar mensagem de voz';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Não foi possível iniciar a gravação. Permita o acesso ao microfone.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'A gravação de voz não é compatível com este dispositivo.';

  @override
  String get voiceMessageMicInUse =>
      'Saia da chamada de voz para gravar uma mensagem de voz.';

  @override
  String get voiceMessageRecordingFailed =>
      'Falha na gravação. Tente novamente.';

  @override
  String get voiceMessageSendFailed =>
      'Não foi possível enviar a mensagem de voz. Tente novamente.';

  @override
  String get voiceMessageRecordingHint =>
      'Fale agora. Pressione Parar quando terminar — você pode cortar depois.';

  @override
  String get voiceMessageReviewHint =>
      'Arraste as alças para cortar e pressione Enviar.';

  @override
  String get voiceMessageStop => 'Parar';

  @override
  String get voiceMessageStartRecording => 'Iniciar gravação';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Reproduzir';

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

    return 'A seleção deve ter pelo menos ${secondsString}s.';
  }

  @override
  String get chatAttachmentEditTitle => 'Editar anexo';

  @override
  String get chatAttachmentFilenameLabel => 'Nome do arquivo';

  @override
  String get chatAttachmentDescriptionLabel => 'Descrição';

  @override
  String get chatAttachmentDescriptionHint => 'Texto alternativo opcional';

  @override
  String get chatAttachmentSpoilerLabel => 'Marcar como spoiler';

  @override
  String get chatAttachmentRemove => 'Remover anexo';

  @override
  String get chatAttachmentDownload => 'Baixar';

  @override
  String get chatAttachmentDownloadedToast => 'Saved to photos';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Couldn\'t download attachment';

  @override
  String get chatAttachmentExpiredTooltip => 'Anexo expirado';

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
  String get chatAttachmentSourceGallery => 'Galeria';

  @override
  String get chatAttachmentSourceCamera => 'Câmera';

  @override
  String get chatAttachmentSourceBrowse => 'Procurar arquivos';

  @override
  String get chatAttachmentPasteTooltip =>
      'Colar imagem da área de transferência';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Revelar spoiler';

  @override
  String get matureMediaRevealButton => 'Revelar';

  @override
  String get matureMediaRevealHint => 'Clique para revelar';

  @override
  String get matureContentTitle => 'Conteúdo maduro';

  @override
  String get matureCommunityTitle => 'Comunidade para maiores';

  @override
  String get matureCategoryTitle => 'Categoria para maiores';

  @override
  String get matureChannelTitle => 'Canal para maiores';

  @override
  String get communityContentWarningTitle => 'Aviso de conteúdo da comunidade';

  @override
  String get categoryContentWarningTitle => 'Aviso de conteúdo da categoria';

  @override
  String get channelContentWarningTitle => 'Aviso de conteúdo do canal';

  @override
  String get defaultContentWarningBody => 'Isso contém conteúdo sensível.';

  @override
  String get matureCommunityBody =>
      'Esta comunidade é marcada para conteúdo adulto e pode conter material que pode ser inadequado para alguns usuários.';

  @override
  String get matureCategoryBody =>
      'Esta categoria é marcada para conteúdo adulto e pode conter material que pode ser inadequado para alguns usuários.';

  @override
  String get matureChannelBody =>
      'Este canal é marcado para conteúdo adulto e pode conter material que pode ser inadequado para alguns usuários.';

  @override
  String get matureVoiceChannelBody =>
      'Este canal de voz é marcado para conteúdo adulto e pode conter material que pode ser inadequado para alguns usuários.';

  @override
  String get matureLinkChannelBody =>
      'Este canal de links é marcado para conteúdo adulto e pode abrir material que pode ser inadequado para alguns usuários.';

  @override
  String get matureCommunityUnavailableBody =>
      'Esta comunidade para maiores não está disponível para sua conta.';

  @override
  String get matureCategoryUnavailableBody =>
      'Esta categoria para maiores não está disponível para sua conta.';

  @override
  String get matureChannelUnavailableBody =>
      'Este canal para maiores não está disponível para sua conta.';

  @override
  String get matureContentProceedButton => 'Continuar';

  @override
  String get matureContentUnderstandButton => 'Eu entendo';

  @override
  String get matureContentOpenLinkButton => 'Abrir link';

  @override
  String get sensitiveContentSectionTitle => 'Conteúdo sensível';

  @override
  String get sensitiveContentSectionDescription =>
      'Controle como mídia adulta ou sensível é filtrada em diferentes contextos';

  @override
  String get sensitiveContentFriendDmLabel => 'Mensagens diretas de amigos';

  @override
  String get sensitiveContentNonFriendDmLabel => 'Mensagens diretas de outros';

  @override
  String get sensitiveContentGuildLabel => 'Mensagens em canais da comunidade';

  @override
  String get sensitiveContentFilterShow => 'Mostrar';

  @override
  String get sensitiveContentFilterBlur => 'Desfocar';

  @override
  String get sensitiveContentFilterBlock => 'Bloquear';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Desfocar mídia até a conclusão da verificação de segurança';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Quando ativado, imagens e vídeos são desfocados até que a verificação de segurança de conteúdo seja concluída.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Esta configuração está sempre ativa para sua conta.';

  @override
  String get sensitiveContentResetButton => 'Redefinir';

  @override
  String get sensitiveContentSaveButton => 'Salvar';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arquivos',
      one: '1 arquivo',
    );
    return 'Enviando $_temp0';
  }

  @override
  String get chatCancelUpload => 'Cancelar envio';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Expira em $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Expira entre $start e $end';
  }

  @override
  String get connectionsTitle => 'Conexões';

  @override
  String connectionsDescription(String productName) {
    return 'Vincule contas e domínios externos ao seu perfil $productName. Conexões verificadas serão exibidas em seu perfil para que outros vejam.';
  }

  @override
  String get connectionsEmptyTitle => 'Nenhuma conexão ainda';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Vincule sua conta Bluesky ou verifique a propriedade do domínio para exibi-los em seu perfil.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Verifique a propriedade do domínio para exibi-lo em seu perfil.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Domínio';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Adicionar conexão Bluesky';

  @override
  String get connectionsAddDomainAriaLabel => 'Adicionar conexão de domínio';

  @override
  String get connectionEdit => 'Editar';

  @override
  String get connectionRemove => 'Remover';

  @override
  String get connectionVerifiedLabel => 'Esta conexão foi verificada.';

  @override
  String get connectionUnverifiedLabel => 'Esta conexão não foi verificada.';

  @override
  String get connectionAddTitle => 'Adicionar Conexão';

  @override
  String get connectionTypeLabel => 'Tipo de Conexão';

  @override
  String get connectionHandleLabel => 'Identificador';

  @override
  String get connectionDomainLabel => 'Domínio';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Você já tem esta conexão.';

  @override
  String get connectionConnectBluesky => 'Conectar com Bluesky';

  @override
  String get connectionContinue => 'Continuar';

  @override
  String get connectionVerifyTitle => 'Verificar Conexão';

  @override
  String get connectionVerifyInstructions =>
      'Use o registro abaixo para comprovar a propriedade do domínio.';

  @override
  String get connectionDnsRecordTitle => 'Registro TXT do DNS';

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
  String get connectionTokenFileTitle => 'Servir o arquivo de token';

  @override
  String get connectionTokenFileDescription =>
      'Baixe **fluxer-verification** e coloque-o na sua pasta **.well-known** para que possamos validar o domínio.';

  @override
  String get connectionTokenFileDownload => 'Baixar fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'O arquivo contém o token de verificação que buscaremos em **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Salvar fluxer-verification';

  @override
  String get connectionVerifyButton => 'Verificar';

  @override
  String get connectionBack => 'Voltar';

  @override
  String get connectionEditTitle => 'Editar Conexão';

  @override
  String get connectionEditDescription =>
      'Escolha quem pode ver esta conexão no seu perfil.';

  @override
  String get connectionVisibilityEveryone => 'Todos';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Permitir que qualquer pessoa veja esta conexão no seu perfil';

  @override
  String get connectionVisibilityFriends => 'Amigos';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Permitir que seus amigos vejam esta conexão';

  @override
  String get connectionVisibilityCommunityMembers => 'Membros da Comunidade';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Permitir que membros das comunidades em que você está vejam esta conexão';

  @override
  String get connectionRemoveTitle => 'Remover Conexão';

  @override
  String get connectionRemoveDescription =>
      'Tem certeza de que deseja remover esta conexão? Esta ação não pode ser desfeita.';

  @override
  String get connectionRemoveConfirm => 'Remover';

  @override
  String get connectionsLoadError => 'Falha ao carregar conexões';

  @override
  String get connectionsReorderError => 'Falha ao atualizar a ordem';

  @override
  String get connectionInitiateFailed =>
      'Não foi possível iniciar a verificação. Tente novamente.';

  @override
  String get connectionVerifyFailed =>
      'Não foi possível verificar. Verifique seu registro DNS e tente novamente.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Não foi possível iniciar a autorização do Bluesky.';

  @override
  String get connectionUpdateFailed => 'Não foi possível atualizar a conexão';

  @override
  String get connectionRemoveFailed => 'Não foi possível remover a conexão';

  @override
  String get connectionTokenSavedToast => 'fluxer-verification salvo';

  @override
  String get connectionTokenSaveFailedToast =>
      'Não foi possível salvar o arquivo';

  @override
  String get connectionEnterHandle => 'Digite um identificador do Bluesky.';

  @override
  String get connectionEnterDomain => 'Digite um domínio.';

  @override
  String get lookAndFeelTitle => 'Aparência';

  @override
  String get lookAndFeelThemeSectionTitle => 'Tema';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Escolha entre aparência escura, carvão ou clara.';

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
  String get lookAndFeelThemeDark => 'Tema Escuro';

  @override
  String get lookAndFeelThemeCoal => 'Tema Carvão';

  @override
  String get lookAndFeelThemeLight => 'Tema Claro';

  @override
  String get lookAndFeelThemeSystem => 'Tema do Sistema';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Sincronizar tema entre dispositivos';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Quando ativado, as alterações de tema serão sincronizadas com todos os seus dispositivos. Quando desativado, este dispositivo usará sua própria configuração de tema.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'O tema do sistema desativa automaticamente a sincronização para rastrear a preferência do seu sistema neste dispositivo.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Não foi possível sincronizar o tema com sua conta. Tente novamente.';

  @override
  String get lookAndFeelChatFontScalingTitle =>
      'Dimensionamento de Fonte de Chat';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Ajuste o tamanho da fonte na área de chat.';

  @override
  String get lookAndFeelChatFontSizeLabel => 'Chat font size';

  @override
  String get lookAndFeelAppZoomTitle => 'App zoom level';

  @override
  String get lookAndFeelAppZoomDescription =>
      'Adjust the application\'s zoom level.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'Papel de parede do chat';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'Escolha um plano de fundo para o chat. Ele ficará neste dispositivo.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'Esta configuração fica neste dispositivo';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'O papel de parede do chat é salvo apenas neste dispositivo e não é sincronizado com outros.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'Padrão';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'Imagem personalizada';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Cor $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Gradiente $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'Escurecer papel de parede';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'Não foi possível definir esta imagem como seu papel de parede.';

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
  String get lookAndFeelInterfaceTitle => 'Interface';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Personalize elementos e comportamentos da interface.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Indicadores de digitação na lista de canais';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Escolha como os indicadores de digitação aparecem na lista de canais quando alguém está digitando em um canal.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Indicador de Digitação + Avatares';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Mostrar indicador de digitação com avatares de usuário na lista de canais';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Apenas Indicador de Digitação';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Mostrar apenas o indicador de digitação sem avatares';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Oculto';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Não mostrar indicadores de digitação na lista de canais';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Mostrar digitação no canal selecionado';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Quando desativado (padrão), os indicadores de digitação não aparecerão no canal que você está visualizando.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'geral';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Dicas de Teclado';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Controle se as dicas de atalhos de teclado aparecem em tooltips.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Ocultar dicas de teclado em tooltips';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Quando ativado, os ícones de atalho são ocultados em pop-ups de tooltip.';

  @override
  String get lookAndFeelNekoTitle => 'Diversos';

  @override
  String get lookAndFeelNekoDescription => 'Opções diversas de interface.';

  @override
  String get lookAndFeelShowNekoLabel => 'Mostrar Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Quando ativado, Neko aparece perto da barra de entrada de chat.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Comportamento de entrada em canais de voz';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Controle como você entra em canais de voz em comunidades.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Exigir clique duplo para entrar em canais de voz';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Quando ativado, você precisará clicar duas vezes em canais de voz para entrar. Quando desativado (padrão), um único clique entrará no canal imediatamente.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'O rápido cão marrom salta sobre a preguiça.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Barra lateral da comunidade';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Configure como a barra lateral da comunidade exibe mensagens diretas.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count comunidades estão temporariamente indisponíveis devido a um mau funcionamento do capacitor de fluxo.',
      one:
          '1 comunidade está temporariamente indisponível devido a um mau funcionamento do capacitor de fluxo.',
    );
    return '$_temp0';
  }

  @override
  String get communityTemporarilyUnavailable =>
      'Community temporarily unavailable';

  @override
  String get guildUnavailableDescription =>
      'Something went wrong. We\'re working on it.';

  @override
  String get guildNotFoundTitle =>
      'This is not the community you\'re looking for.';

  @override
  String get guildNotFoundDescription =>
      'The community you\'re looking for may have been deleted or you may not have access to it.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return '$communityName is currently only accessible to $productName staff members';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => 'temporarily unavailable';

  @override
  String get lookAndFeelCollapseDMsLabel => 'Recolher DMs em Pasta';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'Quando ativado, DMs não lidas na barra lateral da comunidade são recolhidas em uma pasta no botão $productName. Clique no botão $productName enquanto estiver na página de DMs para expandir ou recolher a pasta.';
  }

  @override
  String get lookAndFeelChannelListSectionTitle => 'Lista de Canais';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Controle o comportamento do indicador de não lidas para canais silenciados em listas de canais.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Mostrar indicador de não lidas em canais silenciados';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Quando ativado, canais silenciados mostram um indicador de não lidas atenuado no lado esquerdo. Menções ainda aparecem independentemente desta configuração.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Ativos Agora';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Controle como Ativos Agora aparece em todo o aplicativo.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Mostrar Ativos Agora na tela inicial';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Mostre Ativos Agora na tela inicial para exibir amigos ativos em voz. Você verá uma prévia, o contexto do canal, quem já está lá e uma maneira rápida de entrar.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Favoritos';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Controle a visibilidade dos favoritos em todo o aplicativo.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Ativar Favoritos';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Quando ativado, você pode favoritar canais e eles aparecerão na seção Favoritos. Quando desativado, todos os elementos de UI relacionados a favoritos (botões, itens de menu) serão ocultados. Seus favoritos existentes serão preservados.';

  @override
  String get favoritesTitle => 'Favoritos';

  @override
  String get favoritesEmptyTitle => 'Nenhum favorito ainda';

  @override
  String get favoritesEmptyDescription =>
      'Marque canais do cabeçalho do chat para mantê-los aqui.';

  @override
  String get favoritesWelcomeTitle => 'Bem-vindo aos favoritos';

  @override
  String get favoritesWelcomeDescription =>
      'Seu espaço pessoal para acesso rápido a canais, DMs e grupos que você adora. Pressione a estrela em qualquer canal para adicioná-lo aqui.';

  @override
  String get favoritesWelcomeTip =>
      'Não é para você? Desative a qualquer momento.';

  @override
  String get favoritesDisableButton => 'Desativar favoritos';

  @override
  String get favoritesAddedToast => 'Adicionado aos Favoritos';

  @override
  String get favoritesRemovedToast => 'Removido dos Favoritos';

  @override
  String get favoritesHiddenToast => 'Favoritos ocultos';

  @override
  String get favoritesMute => 'Silenciar favoritos';

  @override
  String get favoritesUnmute => 'Ativar som dos favoritos';

  @override
  String get favoritesHeaderMenu => 'Menu de favoritos';

  @override
  String get favoritesCreateCategory => 'Criar categoria';

  @override
  String get favoritesCategoryNameLabel => 'Nome da categoria';

  @override
  String get favoritesHideMutedChannels => 'Ocultar canais silenciados';

  @override
  String get favoritesShowMutedChannels => 'Mostrar canais silenciados';

  @override
  String get favoritesSetNickname => 'Definir apelido';

  @override
  String get favoritesNicknameLabel => 'Apelido';

  @override
  String get favoritesSaveNickname => 'Salvar apelido';

  @override
  String get favoritesMoveToCategory => 'Mover para categoria';

  @override
  String get favoritesUncategorized => 'Não categorizado';

  @override
  String get favoritesOtherCategory => 'Outros';

  @override
  String get favoritesRemoveFromFavorites => 'Remover dos Favoritos';

  @override
  String get favoritesAddToFavorites => 'Adicionar aos Favoritos';

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
      'Isso ocultará todos os elementos da interface relacionados a favoritos, incluindo botões e itens de menu. Seus favoritos existentes serão preservados e poderão ser reativados a qualquer momento em Configurações > Avançado > Aparência.';

  @override
  String get favoritesDirectMessageSubtitle => 'Mensagem Direta';

  @override
  String get messagesMediaDisplayGroupTitle => 'Exibição';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Controle como mensagens, mídias e outros conteúdos são exibidos.';

  @override
  String get messagesMediaMediaGroupTitle => 'Mídia';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Personalize as preferências de tamanho de mídia e botões.';

  @override
  String get messagesMediaInputGroupTitle => 'Entrada';

  @override
  String get messagesMediaInputGroupDescription =>
      'Personalize as configurações de entrada de mensagens.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Barra lateral';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Configure como a barra lateral da comunidade é exibida.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Ocultar canais silenciados por padrão';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Oculte automaticamente canais silenciados na barra lateral ao entrar em novas comunidades';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Ocultar canais silenciados por padrão?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Novas comunidades que você ingressar terão automaticamente os canais silenciados ocultos. Você também gostaria de aplicar essa configuração a todas as suas comunidades existentes?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Parar de ocultar canais silenciados por padrão?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Novas comunidades que você ingressar não terão mais canais silenciados ocultos automaticamente. Você também gostaria de mostrar canais silenciados em todas as suas comunidades existentes?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Aplicar a todas as comunidades';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Mostrar em todas as comunidades';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Apenas novas comunidades';

  @override
  String get messagesMediaDisplaySectionTitle => 'Exibição de Mídia';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Controle como imagens, vídeos e outras mídias são exibidos. Toda a mídia é redimensionada e convertida. Arquivos extremamente grandes que não podem ser comprimidos em uma prévia não serão incorporados, independentemente dessas configurações.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Quando postado como links para o chat';

  @override
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'Quando enviado diretamente para o $productName';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle =>
      'Pré-visualizações de Links';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Controle como links de sites são pré-visualizados no chat';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Mostrar incorporações e pré-visualizar links de sites';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reações';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Configure reações com emojis em mensagens';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Mostrar reações com emojis em mensagens';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Conteúdo de spoiler';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Controle como o conteúdo de spoiler é exibido';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Mostrar conteúdo de spoiler';

  @override
  String get messagesMediaSpoilersOnClickName => 'Ao clicar';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Mostrar conteúdo de spoiler ao clicar';

  @override
  String get messagesMediaSpoilersIfModeratorName => 'Nos canais que modero';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Sempre mostre o conteúdo de spoiler em canais onde você tem a permissão \"Gerenciar mensagens\"';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Sempre';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Sempre mostrar conteúdo de spoiler';

  @override
  String get messagesMediaSizeSectionTitle =>
      'Preferências de tamanho de mídia';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Personalize o tamanho máximo de exibição para mídia incorporada e anexada. Tamanhos menores usam menos espaço na tela, enquanto tamanhos maiores mostram mais detalhes.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Mídia de links (incorporações)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Anexos enviados';

  @override
  String get messagesMediaSizeCompactName => 'Compacto (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Tamanho de mídia menor';

  @override
  String get messagesMediaSizeComfortableName => 'Confortável (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Tamanho de mídia maior com mais detalhes';

  @override
  String get messagesMediaGifsSectionTitle => 'Comportamento de GIFs';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Controle como os GIFs são inseridos no chat';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Enviar GIFs automaticamente ao selecionar';

  @override
  String get messagesMediaCameraUploadsSectionTitle => 'Camera uploads';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Choose whether photos and videos taken with the in-app camera are kept on your device';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel => 'Save to device';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Autocompletar expressões (autocompletar dois pontos)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Controle o que aparece no autocompletar de expressões quando você digita dois pontos. Personalize quais sugestões aparecem para corresponder às suas preferências.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Mostrar emojis padrão no autocompletar de expressões';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Mostrar emojis personalizados no autocompletar de expressões';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Mostrar figurinhas no autocompletar de expressões';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Mostrar mídia salva no autocompletar de expressões';

  @override
  String get messagesMediaEditingSectionTitle => 'Edição de mensagens';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Controle o que acontece com seu rascunho de edição ao cancelar.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Preservar rascunho de edição ao cancelar';

  @override
  String get accessibilitySaturationTitle => 'Saturação';

  @override
  String get accessibilitySaturationDescription =>
      'Ajuste a intensidade das cores do tema em todo o aplicativo.';

  @override
  String get accessibilityVisualGroupTitle => 'Visual';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel => 'Always underline links';

  @override
  String get accessibilityDimStrikethroughTextLabel => 'Dim strikethrough text';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'Pré-visualizações de mensagens diretas';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Controle quando as pré-visualizações de mensagens são mostradas na lista de DMs.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Modo de pré-visualização de mensagens diretas';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Todas as mensagens';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Mostrar pré-visualizações de mensagens para todas as conversas diretas';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Somente DMs não lidas';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Mostrar pré-visualizações de mensagens apenas para DMs com mensagens não lidas';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Nenhum';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Não mostrar pré-visualizações de mensagens na lista de DMs';

  @override
  String get accessibilityScreenReaderGroupTitle => 'Screen reader';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Control how $productName works with screen readers.';
  }

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
  String get dmListSentAnAttachment => 'Enviou um anexo';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username fixou uma mensagem neste canal.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username adicionou $userName ao grupo.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username adicionou alguém ao grupo.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username saiu do grupo.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username removeu $userName do grupo.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username removeu alguém do grupo.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username alterou o nome do canal para $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username alterou o nome do canal.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username alterou o ícone do canal.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username iniciou uma chamada.';
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
  String get voiceConnectionConfirmTitle => 'Confirmação de Conexão de Voz';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Você já está conectado a este canal de voz de $count outros dispositivos. O que você gostaria de fazer?',
      one:
          'Você já está conectado a este canal de voz de 1 outro dispositivo. O que você gostaria de fazer?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Mudar para Este Dispositivo';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Entrar Apenas (Manter Conexões Ativas)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Não fazer nada, não quero entrar';

  @override
  String get voiceJoinFailedTitle => 'Couldn\'t Join Voice';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Couldn\'t disconnect your other devices. Try again in a moment.';

  @override
  String get voiceChannelEmptyDescription =>
      'Este é um canal de voz. Conecte-se para começar a falar!';

  @override
  String get voiceChannelJoin => 'Entrar no Canal de Voz';

  @override
  String get voiceCallJoin => 'Join call';

  @override
  String get voiceChannelJoinConnect => 'Conectar à Voz';

  @override
  String get voiceChannelNoConnectPermission =>
      'Você não tem permissão para entrar neste canal de voz';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Microfone, câmera e conteúdo de compartilhamento de tela são criptografados de ponta a ponta.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Microfone, câmera e conteúdo de compartilhamento de tela são criptografados de ponta a ponta.';

  @override
  String get voiceChannelE2eeBroken =>
      'A criptografia de ponta a ponta não está disponível porque um participante não compatível está neste canal de voz.';

  @override
  String get voiceCallE2eeBroken =>
      'A criptografia de ponta a ponta não está disponível porque um participante não compatível está nesta chamada.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Este cliente precisa ser atualizado antes de entrar nesta chamada criptografada.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Não foi possível iniciar seu microfone. Você ainda está na chamada.';

  @override
  String get voiceChannelStatusConnecting => 'Conectando…';

  @override
  String get voiceChannelStatusConnected => 'Conectado';

  @override
  String get voiceChannelStatusError => 'Erro';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Dispositivo móvel';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Dispositivo de desktop';

  @override
  String get voiceParticipantTooltipCommunityMuted =>
      'Silenciado pela comunidade';

  @override
  String get voiceParticipantTooltipMuted => 'Silenciado';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Surdo pela comunidade';

  @override
  String get voiceParticipantTooltipDeafened => 'Surdo';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Conexão: $connectionId';
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
  String get voiceChannelLeave => 'Sair';

  @override
  String get voiceControlMute => 'Silenciar';

  @override
  String get voiceControlUnmute => 'Ativar som';

  @override
  String get voiceControlDeafen => 'Deixar surdo';

  @override
  String get voiceControlUndeafen => 'Deixar de deixar surdo';

  @override
  String get voiceControlVideo => 'Vídeo';

  @override
  String get voiceControlFlipCamera => 'Virar câmera';

  @override
  String get voiceControlScreenShare => 'Compartilhar tela';

  @override
  String get voiceScreenShareNotificationText => 'Compartilhando sua tela.';

  @override
  String get voiceControlMore => 'Mais';

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
  String get voiceParticipantMenuViewProfile => 'View profile';

  @override
  String get voiceParticipantMenuFocus => 'Focus this person';

  @override
  String get voiceParticipantMenuUnfocus => 'Unfocus';

  @override
  String get voiceParticipantMenuCommunityMute => 'Community mute';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Community deafen';

  @override
  String get voiceParticipantMenuUserVolume => 'User volume';

  @override
  String get voiceParticipantMenuStreamVolume => 'Stream volume';

  @override
  String get voiceParticipantMenuStopStreaming => 'Stop streaming';

  @override
  String get voiceParticipantModerationFailed =>
      'Couldn\'t update that member. Please try again.';

  @override
  String get voiceControlChat => 'Chat';

  @override
  String get voiceCallViewModeLabel => 'View';

  @override
  String get voiceCallViewModeGrid => 'Grid';

  @override
  String get voiceCallViewModeFocus => 'Focus';

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
  String get voicePrioritizeSpeakersLabel => 'Prioritize speakers';

  @override
  String get voiceTextChatShow => 'Mostrar chat';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# mensagens não lidas',
      one: '# mensagem não lida',
    );
    return 'Mostrar chat com $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Permissão da câmera é necessária para vídeo.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Não foi possível iniciar o compartilhamento de tela. Tente novamente.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Permissão de compartilhamento de tela foi negada.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'O compartilhamento de tela não está disponível neste dispositivo.';

  @override
  String get voiceWatchStream => 'Assistir Transmissão';

  @override
  String get voiceStopWatching => 'Parar de assistir';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Parar de assistir ao stream atual';

  @override
  String get voiceOwnScreenShareTitle => 'Você está transmitindo';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Seu stream está ao vivo para os participantes.';

  @override
  String get voiceLiveBadge => 'AO VIVO';

  @override
  String get dmVoiceViewCall => 'Ver chamada';

  @override
  String get dmVoiceCallFullScreen => 'Tela cheia';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Abrir chamada em tela cheia';

  @override
  String get dmVoiceStripStatusConnecting => 'Conectando...';

  @override
  String get dmVoiceStripStatusInCall => 'Em chamada';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Chamada de voz';

  @override
  String get dmVoiceCallBarConnecting => 'Conectando...';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Chamada direta';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Chamada em grupo';

  @override
  String get dmVoiceCallBarIssueFallback => 'Problema de voz';

  @override
  String get dmVoiceFullscreenTitle => 'Voz';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Voz conectada';

  @override
  String get notificationsPageTitle => 'Notificações';

  @override
  String get notificationsFilterUnreads => 'Não lidas';

  @override
  String get notificationsFilterMentions => 'Menções';

  @override
  String get notificationsBookmarksTooltip => 'Favoritos';

  @override
  String get notificationsMentionFilterTooltip => 'Filtrar menções';

  @override
  String get notificationsMentionFiltersTitle => 'Filtros de menção';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Incluir menções de @everyone e @here';

  @override
  String get notificationsMentionIncludeRoles => 'Incluir menções de cargos';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Incluir menções de todas as comunidades';

  @override
  String get notificationsNoUnreadTitle => 'Nenhuma mensagem não lida';

  @override
  String get notificationsNoUnreadBody => 'Você está em dia.';

  @override
  String get notificationsNoMentionsTitle => 'Nenhuma menção recente';

  @override
  String get notificationsNoMentionsBody =>
      'Todas as @menções a você aparecerão aqui por 7 dias.';

  @override
  String get notificationsMentionsEndTitle => 'Você chegou ao fim';

  @override
  String get notificationsMentionsEndBody =>
      'Você viu todas as suas menções recentes. Não se preocupe, mais aparecerão aqui em breve.';

  @override
  String get notificationsJump => 'Ir';

  @override
  String get notificationsRemoveMentionTooltip => 'Remover menção';

  @override
  String get notificationsViewAllUnread => 'Ver todas as não lidas';

  @override
  String get notificationsMarkAsRead => 'Marcar como lida';

  @override
  String get notificationsExpand => 'Expandir';

  @override
  String get notificationsCollapse => 'Recolher';

  @override
  String get notificationsMessageUnavailable =>
      'Esta mensagem não pôde ser carregada.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining caracteres restantes';
  }

  @override
  String get characterCounterTooLong => 'Mensagem muito longa';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining caracteres restantes. Obtenha o $productName para escrever até $premiumMaxLength caracteres.';
  }

  @override
  String get chatMessageFailedToSend => 'Falha ao enviar mensagem';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Sua mensagem não pôde ser entregue. Isso geralmente ocorre porque você não compartilha uma comunidade com o destinatário ou o destinatário só aceita mensagens diretas de amigos. Você também pode precisar ajustar suas próprias configurações de privacidade de mensagens diretas em $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Sua mensagem não pôde ser entregue. Você precisa reivindicar sua conta para enviar mensagens diretas.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Sua mensagem não pôde ser entregue. Você precisa reivindicar sua conta para enviar mensagens.';

  @override
  String get chatSendFailureContentBlocked =>
      'Sua mensagem não pôde ser entregue porque foi sinalizada por nossos sistemas de segurança. Se você acredita que isso é um erro, entre em contato com o suporte.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Sua mensagem não pôde ser entregue porque contém emojis ou stickers adultos que não são permitidos neste contexto.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'Somente você pode ver esta mensagem.';

  @override
  String get chatClientSystemDismiss => 'Dispensar';

  @override
  String get privacyDashboardCommunicationSection => 'Comunicação';

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
  String get chatMessageDeleteFailed => 'Falha ao excluir mensagem';

  @override
  String get chatMessageAddReaction => 'Adicionar reação';

  @override
  String get chatMessageEdit => 'Editar mensagem';

  @override
  String get chatMessageReply => 'Responder';

  @override
  String get chatMessageForward => 'Encaminhar';

  @override
  String get forwardMessageTitle => 'Encaminhar mensagem';

  @override
  String get forwardSearchHint => 'Pesquisar canais ou DMs';

  @override
  String get forwardDirectMessagesSection => 'Mensagens diretas';

  @override
  String get forwardCommentHint => 'Adicionar um comentário (opcional)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Enviar ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Nenhum canal encontrado';

  @override
  String get forwardSuccessToast => 'Mensagem encaminhada';

  @override
  String get forwardFailed => 'Falha ao encaminhar mensagem';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Comentários indisponíveis porque um canal selecionado tem o modo lento ativado.';

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
      'Você não pode enviar mensagens aqui';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Você não pode incorporar links aqui';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Você não pode anexar arquivos aqui';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Envio de mensagens desativado nesta comunidade';

  @override
  String get forwardDestinationTimedOut =>
      'Você está em modo de espera nesta comunidade';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Modo lento - aguarde $remaining';
  }

  @override
  String get chatMessageCopyText => 'Copiar mensagem';

  @override
  String get chatMessageCopyEmbedText => 'Copy Embed Text';

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
  String get chatMessagePin => 'Fixar mensagem';

  @override
  String get chatMessageUnpin => 'Desafixar mensagem';

  @override
  String get chatMessageUnpinIt => 'Desafixar';

  @override
  String get chatMessageBookmark => 'Salvar mensagem';

  @override
  String get chatMessageRemoveBookmark => 'Remover item salvo';

  @override
  String get chatMessageMarkAsUnread => 'Marcar como não lida';

  @override
  String get chatMessageCopyMessageLink => 'Copiar link da mensagem';

  @override
  String get chatMessageOpenLink => 'Open link';

  @override
  String get chatMessageCopyLink => 'Copy link';

  @override
  String get chatMessageCopyMessageId => 'Copiar ID da mensagem';

  @override
  String get chatMessageViewReactions => 'Ver reações';

  @override
  String get chatMessageRemoveAllReactions => 'Remover todas as reações';

  @override
  String get chatMessageDebug => 'Depurar mensagem';

  @override
  String get chatMessageDebugSheetTitle => 'Depurar mensagem';

  @override
  String get chatMessageDebugCopyJson => 'Copiar JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'JSON da mensagem copiado para a área de transferência';

  @override
  String get chatReactionsSheetTitle => 'Reações';

  @override
  String get chatReactionsSheetEmpty => 'Ninguém reagiu a isso ainda.';

  @override
  String get chatReactionAddFailed => 'Failed to add reaction';

  @override
  String get chatReactionRemoveFailed => 'Failed to remove reaction';

  @override
  String get chatMessageReport => 'Denunciar mensagem';

  @override
  String get iarReportMessageTitle => 'Denunciar mensagem';

  @override
  String get iarThisUserFallback => 'este usuário';

  @override
  String get iarModalDescription =>
      'Denuncie uma violação de regra ou encontre ferramentas para gerenciar contatos e preferências.';

  @override
  String get iarPathStepAriaLabel => 'O que você precisa?';

  @override
  String get iarCategoryStepTitle => 'Que tipo de regra foi quebrada?';

  @override
  String get iarReasonStepTitle => 'Qual regra foi quebrada?';

  @override
  String get iarReasonSelectHint => 'Selecione um motivo';

  @override
  String get iarPickAnOptionToast => 'Selecione uma opção para continuar.';

  @override
  String get iarPickARuleToast => 'Selecione a regra que foi quebrada.';

  @override
  String get iarPathPlatform => 'Denunciar violação de regra da plataforma';

  @override
  String get iarPathCommunity => 'Denunciar aos moderadores desta comunidade';

  @override
  String get iarPathPreferenceMessage => 'Não gosto deste conteúdo';

  @override
  String get iarCategoryTargetedHarmLabel => 'Ameaças, assédio ou danos';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Bullying, ameaças, ódio, violência, invasões ou conteúdo que incentiva a automutilação.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Segurança de menores ou conteúdo adulto';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Menores em risco, conteúdo adulto no lugar errado ou conduta indesejada.';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'Privacidade ou impersonificação';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Exposição de dados pessoais, perseguição, fingir ser outra pessoa ou perfil inadequado.';

  @override
  String get iarCategoryDeceptionLabel => 'Golpes, malware ou desinformação';

  @override
  String get iarCategoryDeceptionDescription =>
      'Phishing, fraude, links maliciosos ou falsas alegações com potencial de causar danos no mundo real.';

  @override
  String get iarCategoryIllegalOtherLabel => 'Atividade ilegal ou algo mais';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Vendas ilegais, facilitação de crimes ou uma violação clara de regras que não se encaixa acima.';

  @override
  String get iarReasonHarassmentLabel => 'Assédio ou ameaças';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Bullying, contato indesejado repetido, perseguição ou abuso direcionado.';

  @override
  String get iarReasonHateLabel => 'Discurso de ódio';

  @override
  String get iarReasonHateMessageDescription =>
      'Insultos, linguagem desumanizante ou ataques a grupos protegidos.';

  @override
  String get iarReasonViolenceLabel => 'Violência ou ameaças violentas';

  @override
  String get iarReasonViolenceDescription =>
      'Ameaças críveis, violência gráfica ou glorificação da violência.';

  @override
  String get iarReasonMatureContentLabel => 'Conteúdo adulto ou assédio';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Conduta indesejada ou conteúdo adulto no lugar errado.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Segurança de menores ou exploração de menores';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Conteúdo de aliciamento ou exploração infantil.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Desinformação prejudicial';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Falsas alegações com potencial de causar danos no mundo real.';

  @override
  String get iarReasonSpamLabel => 'Spam, golpes ou phishing';

  @override
  String get iarReasonSpamMessageDescription =>
      'Spam em massa, fraude, sorteios falsos ou abuso de conta.';

  @override
  String get iarReasonMalwareLabel => 'Malware ou links perigosos';

  @override
  String get iarReasonMalwareDescription =>
      'Malware, roubo de credenciais ou arquivos perigosos.';

  @override
  String get iarReasonPrivacyLabel => 'Violação de privacidade';

  @override
  String get iarReasonPrivacyDescription =>
      'Exposição de dados pessoais, informações privadas expostas ou perseguição.';

  @override
  String get iarReasonImpersonationLabel =>
      'Impersonificação ou mídia enganosa';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Fingir ser outra pessoa, incluindo conteúdo gerado por IA enganoso.';

  @override
  String get iarReasonIllegalLabel => 'Atividade ilegal';

  @override
  String get iarReasonIllegalDescription =>
      'Vendas ilegais, facilitação de crimes ou atividade ilegal.';

  @override
  String get iarReasonSelfHarmLabel => 'Automutilação ou suicídio';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Promoção ou instruções que incentivam automutilação ou transtornos alimentares.';

  @override
  String get iarReasonOtherLabel => 'Outra violação clara de regras';

  @override
  String iarReasonOtherDescription(String productName) {
    return 'Use apenas se violar claramente as regras do $productName e não se encaixar nas opções acima.';
  }

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Se um menor estiver envolvido, use \"$childSafetyReason\" em vez disso.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Se isso envolver CSAM ou exploração de um menor, envie agora e não compartilhe o material novamente.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Se alguém estiver em perigo imediato, entre em contato com os serviços de emergência locais, se puder fazer isso com segurança.';

  @override
  String get iarSafetyNoteViolence =>
      'Se esta for uma ameaça iminente crível, entre em contato com os serviços de emergência locais também.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Se esta for uma ameaça terrorista iminente, entre em contato com os serviços de emergência locais também.';

  @override
  String get iarActionBlockUserTitle => 'Bloquear este usuário';

  @override
  String get iarActionBlockUserDescription =>
      'Interromper mensagens e pedidos de amizade.';

  @override
  String get iarActionBlockUserButton => 'Bloquear';

  @override
  String get iarActionCopyMessageLinkTitle => 'Copiar link da mensagem';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Compartilhar com moderadores da comunidade.';

  @override
  String get iarActionCopyMessageLinkButton => 'Copiar';

  @override
  String get iarActionCloseDmTitle => 'Fechar esta DM';

  @override
  String get iarActionCloseDmDescription =>
      'Não bloqueia. Você pode reabrir mais tarde.';

  @override
  String get iarActionCloseDmButton => 'Fechar DM';

  @override
  String get iarActionLeaveCommunityTitle => 'Sair da comunidade';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Pare de ver seu conteúdo e membros.';

  @override
  String get iarActionLeaveCommunityButton => 'Sair';

  @override
  String get iarActionDmSettingsTitle =>
      'Configurações de DM e solicitação de amizade';

  @override
  String get iarActionDmSettingsDescription => 'Mude quem pode te contatar.';

  @override
  String get iarActionCallSettingsTitle =>
      'Configurações de chamada e chat em grupo';

  @override
  String get iarActionCallSettingsDescription =>
      'Mude quem pode te ligar ou adicionar.';

  @override
  String get iarActionOpenButton => 'Abrir';

  @override
  String get iarActionDeleteMessageTitle => 'Excluir esta mensagem';

  @override
  String get iarActionDeleteMessageDescription =>
      'Remova-a do canal para todos.';

  @override
  String get iarActionDeleteMessageButton => 'Excluir';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Excluída';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Esta mensagem já foi excluída.';

  @override
  String get iarActionBanUserTitle => 'Banir este usuário';

  @override
  String get iarActionBanUserDescription =>
      'Abra a caixa de diálogo de banimento para esta comunidade.';

  @override
  String get iarActionBanUserButton => 'Banir';

  @override
  String get iarActionBanUserBannedButton => 'Banido';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Este usuário já está banido da comunidade.';

  @override
  String get iarCloseDmConfirmTitle => 'Fechar DM';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Feche sua DM atual com $name. Isso não te bloqueia; você pode reabrir mais tarde.';
  }

  @override
  String get iarSuccessTitle => 'Denúncia enviada';

  @override
  String get iarSuccessBody =>
      'Nossa equipe de segurança está analisando. Enviaremos uma DM e um e-mail assim que tivermos um veredito.';

  @override
  String get iarAlreadyReportedTitle => 'Já denunciado';

  @override
  String get iarAlreadyReportedBody =>
      'Você já denunciou esta mensagem. Nossa equipe de segurança está analisando.';

  @override
  String get iarBackButton => 'Voltar';

  @override
  String get iarContinueButton => 'Continuar';

  @override
  String get iarSendReportButton => 'Enviar denúncia';

  @override
  String get iarDoneButton => 'Concluído';

  @override
  String get iarCouldntSendToast =>
      'Não foi possível enviar a denúncia. Tente novamente.';

  @override
  String get iarRateLimitedToast =>
      'Você está denunciando muito rápido. Aguarde um momento e tente novamente.';

  @override
  String get iarReportSentToast =>
      'Denúncia enviada. Nossa equipe de segurança analisará.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Bloquear $name? Eles não poderão te enviar mensagens ou solicitações de amizade. Você pode desbloqueá-los mais tarde.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Não foi possível bloquear este usuário. Tente novamente.';

  @override
  String get iarCloseDmSuccessToast => 'DM fechada.';

  @override
  String get iarCloseDmFailedToast =>
      'Não foi possível fechar esta DM. Tente novamente.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Não foi possível sair desta comunidade. Tente novamente.';

  @override
  String get chatMessageSuppressEmbeds => 'Ocultar Embeds';

  @override
  String get chatMessageUnsuppressEmbeds => 'Mostrar Embeds';

  @override
  String get chatMessageDelete => 'Excluir Mensagem';

  @override
  String get chatMessageDeleteConfirmTitle => 'Excluir Mensagem';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Tem certeza de que deseja excluir esta mensagem?';

  @override
  String get chatMessageDeleteAttachment => 'Delete Attachment';

  @override
  String get chatMessageEditAttachmentAltText => 'Edit Alt Text';

  @override
  String get chatMessageMore => 'Mais';

  @override
  String get chatEditingMessage => 'Editando mensagem';

  @override
  String get chatReplyOriginalDeleted => 'Mensagem original foi excluída';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Falha ao carregar mensagem original';

  @override
  String get chatReplyAttachedMedia => 'Mensagem contém mídia anexada';

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
  String get chatMessagesLoadError => 'Não foi possível carregar mensagens.';

  @override
  String get chatReplyMentionOverrideTitle => 'Ignorar preferência de menção?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname prefere ser @mencionado em respostas. Enviar sem a menção mesmo assim?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname prefere respostas sem @menção. Enviar com a menção mesmo assim?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ignorar preferência';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Clique para desativar o ping do usuário para quem você está respondendo.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Clique para ativar o ping do usuário para quem você está respondendo.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Mencionar usuário respondido';

  @override
  String get chatReplyMentionOn => 'Ativado';

  @override
  String get chatReplyMentionOff => 'Desativado';

  @override
  String get chatReplyCancel => 'Cancelar resposta';

  @override
  String get chatEditMessageHint => 'Editar mensagem';

  @override
  String get chatEditNoChanges => 'Nenhuma alteração para salvar';

  @override
  String get chatChannelNotReady =>
      'Este canal ainda não está pronto. Tente novamente em um momento.';

  @override
  String get chatMessageEdited => '(editada)';

  @override
  String get chatMessageSilent => 'Esta foi uma mensagem @silent.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Hoje às $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Ontem às $time';
  }

  @override
  String get mediaViewerImagePreview => 'Prévia da imagem';

  @override
  String get mediaViewerClose => 'Fechar visualizador de mídia';

  @override
  String get mediaViewerOpenInBrowser => 'Abrir no navegador';

  @override
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copiar link';

  @override
  String get mediaViewerForward => 'Encaminhar';

  @override
  String get mediaViewerZoomIn => 'Aumentar zoom';

  @override
  String get mediaViewerZoomOut => 'Diminuir zoom';

  @override
  String get mediaViewerPreviousAttachment => 'Anexo anterior';

  @override
  String get mediaViewerNextAttachment => 'Próximo anexo';

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
  String get chatAttachmentVideoToggleControls => 'Alternar controles de vídeo';

  @override
  String get chatAttachmentVideoMute => 'Silenciar vídeo';

  @override
  String get chatAttachmentVideoUnmute => 'Ativar som do vídeo';

  @override
  String get chatAttachmentVideoPlay => 'Reproduzir vídeo';

  @override
  String get chatAttachmentVideoPause => 'Pausar vídeo';

  @override
  String get chatAttachmentVideoProgress => 'Progresso do vídeo';

  @override
  String get chatVideoPlaybackFailed =>
      'Não foi possível reproduzir este vídeo.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Notificar usuários com esta função que têm permissão para ver este canal.';

  @override
  String get composerAutocompleteSuggestions => 'Suggestions';

  @override
  String get composerAutocompleteCommandsHeading => 'Commands';

  @override
  String get composerAutocompleteChoicesHeading => 'Choices';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'Optional arguments';

  @override
  String get composerAutocompleteChannelsHeading => 'Channels';

  @override
  String get composerAutocompleteMembersHeading => 'Members';

  @override
  String get composerAutocompleteUsersHeading => 'Users';

  @override
  String get composerAutocompleteMentionsHeading => 'Mentions';

  @override
  String get composerAutocompleteRolesHeading => 'Roles';

  @override
  String get composerAutocompleteMediaHeading => 'Media';

  @override
  String get composerAutocompleteStickersHeading => 'Stickers';

  @override
  String get composerAutocompleteGifsHeading => 'GIFs';

  @override
  String get composerAutocompleteNoGifs => 'No GIFs found';

  @override
  String get composerCommandShrugDescription =>
      'Appends ¯\\_(ツ)_/¯ to your message.';

  @override
  String get composerCommandTableflipDescription =>
      'Appends (╯°□°)╯︵ ┻━┻ to your message.';

  @override
  String get composerCommandUnflipDescription =>
      'Appends ┬─┬ ノ( ゜-゜ノ) to your message.';

  @override
  String get composerCommandMeDescription =>
      'Send an action message (wraps in italics).';

  @override
  String get composerCommandSpoilerDescription =>
      'Send a spoiler message (wraps in spoiler tags).';

  @override
  String get composerCommandTtsDescription => 'Send a text-to-speech message.';

  @override
  String get composerCommandNickDescription =>
      'Change your nickname in this community.';

  @override
  String get composerCommandKickDescription =>
      'Kick a member from this community.';

  @override
  String get composerCommandBanDescription =>
      'Ban a member from this community.';

  @override
  String get composerCommandMsgDescription =>
      'Send a direct message to a user.';

  @override
  String get composerCommandSavedDescription => 'Send a saved media item.';

  @override
  String get composerCommandStickerDescription => 'Send a sticker.';

  @override
  String get composerCommandGifDescription => 'Search for and send a GIF.';

  @override
  String get composerCommandMemberOption => 'The member to target.';

  @override
  String get composerCommandReasonOption => 'Reason (optional).';

  @override
  String get composerCommandMessageOption => 'The message to send.';

  @override
  String get composerCommandQueryOption => 'What to search for.';

  @override
  String get composerCommandNicknameOption =>
      'Your new nickname, or leave blank to reset it.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'How much of the member\'s recent message history to delete.';

  @override
  String get composerCommandDeleteMessagesNone => 'Don\'t delete any';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Previous $count days';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'Previous 24 hours';

  @override
  String get composerCommandOptionRequired =>
      'This option is required. Please provide a value.';

  @override
  String get composerCommandClear => 'Clear command';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'You changed your nickname in this community from **$previousNickname** to **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'Unknown user';

  @override
  String composerCommandMsgFailed(String username) {
    return 'Failed to send a message to **$username**. They may have DMs disabled or you may be blocked.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count more';
  }

  @override
  String get addGuildModalTitle => 'Adicionar uma comunidade';

  @override
  String get addGuildModalLandingDescription =>
      'Crie uma nova comunidade ou entre em uma existente.';

  @override
  String get addGuildCreateCommunity => 'Criar comunidade';

  @override
  String get addGuildJoinCommunity => 'Entrar na comunidade';

  @override
  String get addGuildImportDiscordTemplate => 'Importar modelo do Discord';

  @override
  String get addGuildJoinTitle => 'Entrar em uma comunidade';

  @override
  String get addGuildJoinDescription =>
      'Digite o link de convite para entrar em uma comunidade.';

  @override
  String get addGuildInviteLinkLabel => 'Link de convite';

  @override
  String get addGuildJoinSubmit => 'Entrar na comunidade';

  @override
  String get addGuildInviteInvalid => 'Este convite é inválido ou expirou.';

  @override
  String get addGuildJoinFailed =>
      'Não foi possível entrar na comunidade. Por favor, tente novamente.';

  @override
  String get addGuildCreateTitle => 'Criar uma comunidade';

  @override
  String get addGuildCreateDescription =>
      'Crie uma comunidade para você e seus amigos conversarem.';

  @override
  String get addGuildCreateNameLabel => 'Nome da comunidade';

  @override
  String get addGuildCreateSubmit => 'Criar comunidade';

  @override
  String get addGuildCreateFailed =>
      'Não foi possível criar a comunidade. Tente novamente.';

  @override
  String get addGuildCreateClaimTitle => 'Claim your account';

  @override
  String get addGuildCreateClaimDescription =>
      'You need to claim your account before you can create a community.';

  @override
  String get addGuildCreateVerifyTitle => 'Verifique seu e-mail';

  @override
  String get addGuildCreateVerifyDescription =>
      'Você precisa verificar seu endereço de e-mail antes de poder criar uma comunidade.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Ícones animados não são suportados ao se criar uma nova comunidade. Use uma imagem estática.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'Ao criar uma comunidade, você concorda em seguir e assegurar as ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return '$productName diretrizes de comunidades';
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
  String get addGuildImportDescription =>
      'Paste a Discord template URL to import its structure into a new community.';

  @override
  String get addGuildImportUrlLabel => 'Template URL';

  @override
  String get addGuildImportUrlInvalid =>
      'Enter a valid Discord template URL or code.';

  @override
  String get addGuildImportFetchFailed =>
      'Failed to fetch the community template. The template may not exist or the external service is unavailable.';

  @override
  String get addGuildImportInvalidResponse =>
      'This doesn\'t look like a valid template response.';

  @override
  String get addGuildImportTemplateLabel => 'Template';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount text, $voiceChannelCount voice, $categoryCount categories, $roleCount roles';
  }

  @override
  String get addGuildImportRemoveIcon => 'Remove icon';

  @override
  String get addGuildImportTemplateInvalid =>
      'The community template data is invalid or malformed.';

  @override
  String get addGuildPackInstalled => 'Pacote instalado com sucesso.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Remover Todas as Reações';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Tem certeza de que deseja remover todas as reações desta mensagem?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Desafixar mensagem';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Enviar este pin de volta no tempo?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username fixou $messageLink neste canal. Ver $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'uma mensagem';

  @override
  String get systemPinMessageAllPinsLink => 'todas as mensagens fixadas';

  @override
  String get channelPinsEmptyTitle => 'Nenhuma mensagem fixada';

  @override
  String get channelPinsEmptyDescription => 'Mensagens fixadas aparecem aqui.';

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
  String get channelDetailsCopyLink => 'Copiar link';

  @override
  String get channelMenuCopyChannelLink => 'Copy channel link';

  @override
  String get channelMenuCopyRedirectLink => 'Copy redirect link';

  @override
  String get channelDetailsAddFriendsToGroup => 'Add friends to group';

  @override
  String get channelDetailsGroupInvites => 'Group invites';

  @override
  String get channelDetailsEditChannel => 'Editar canal';

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
  String get channelMenuOpenChat => 'Abrir chat';

  @override
  String get channelMenuDuplicateChannel => 'Duplicar canal';

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
  String get channelDetailsCopyMessageLink => 'Copiar link da mensagem';

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
  String get personalNotesTitle => 'Notas pessoais';

  @override
  String get personalNotesSubtitle =>
      'Seu espaço particular para pensamentos e lembretes';

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
  String get guildNavbarCreateInviteFailed =>
      'Couldn\'t create an invite link. Please try again.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'You don\'t have permission to create an invite in this channel.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'This community has reached its invite limit.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'Invite creation is temporarily disabled for this community.';

  @override
  String get groupDmCopyInviteFailed => 'Falha ao copiar link de convite';

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
    return 'Bem-vindo(a) a $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'No início, não havia nada. Então, surgiu $channelName. E foi bom.';
  }

  @override
  String get personalNotesComposerHint => 'Envie uma mensagem para você mesmo';

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
  String get personalNotesPrivateSpace => 'Seu espaço particular';

  @override
  String get purgePersonalNotes => 'Limpar notas pessoais';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Isso excluirá permanentemente todas as mensagens e anexos em suas notas pessoais. Isso não pode ser desfeito.';

  @override
  String get purgePersonalNotesConfirmButton => 'Limpar';

  @override
  String purgePersonalNotesSuccess(int count) {
    return '$count mensagens limpas das notas pessoais';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'As notas pessoais já estavam vazias';

  @override
  String get purgePersonalNotesFailed =>
      'Não foi possível limpar as notas pessoais';

  @override
  String get userSettingsGroupYourAccount => 'SUA CONTA';

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
  String get userSettingsNavSecurityLogin => 'Segurança e Login';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Presentes e Códigos';

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
  String get userSettingsNavPrivacyDashboard => 'Painel de Privacidade';

  @override
  String get userSettingsNavAuthorizedApps => 'Aplicativos Autorizados';

  @override
  String get userSettingsNavBlockedUsers => 'Usuários Bloqueados';

  @override
  String get userSettingsNavLinkedDevices => 'Dispositivos Conectados';

  @override
  String get userSettingsNavConnections => 'Conexões';

  @override
  String get userSettingsNavLookAndFeel => 'Aparência';

  @override
  String get userSettingsNavAccessibility => 'Acessibilidade';

  @override
  String get userSettingsNavChat => 'Mensagens e Mídia';

  @override
  String get userSettingsNavAudioAndVideo => 'Áudio e Vídeo';

  @override
  String get userSettingsNavShortcuts => 'Shortcuts';

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
  String get userSettingsNavLanguageAndTime => 'Idioma e Hora';

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
  String get userSettingsNavAdvanced => 'Avançado';

  @override
  String get advancedPerformanceReportingTitle => 'Relatórios de desempenho';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'Ajude a melhorar o $productName compartilhando dados anônimos de falhas e desempenho.';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'Enviar relatórios de falhas e desempenho';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'Todos os dados relatados são anônimos e enviados apenas para o próprio serviço de monitoramento do $productName — nenhum provedor de terceiros é usado.';
  }

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
  String get advancedSettingHapticFeedbackLabel => 'Haptic feedback';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Vibration feedback for taps and actions. Won\'t sync across devices.';

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
  String get userSettingsNavApplications => 'Aplicativos';

  @override
  String get userSettingsNavAppLogs => 'Logs do Aplicativo';

  @override
  String get userSettingsNavDeveloperTools => 'Ferramentas do Desenvolvedor';

  @override
  String get userSettingsNavLimitsConfig => 'Configuração de Limites';

  @override
  String get userSettingsNavFeatureFlags => 'Recursos';

  @override
  String get userSettingsNavWhatsNew => 'Novidades';

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
  String get userSettingsNavLogOut => 'Sair';

  @override
  String get quickSwitcherTabSearch => 'Pesquisar';

  @override
  String get quickSwitcherTabFriends => 'Amigos';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Pesquisar canais, pessoas ou comunidades';

  @override
  String get quickSwitcherSearchFriends => 'Pesquisar amigos';

  @override
  String get quickSwitcherNoMatchesFound =>
      'Nenhuma correspondência encontrada';

  @override
  String get quickSwitcherEmptyHint =>
      'Tente um nome diferente ou use os prefixos @ / # / ! / * para filtrar resultados.';

  @override
  String get quickSwitcherSectionPeople => 'Pessoas';

  @override
  String get quickSwitcherSectionGroupMessages => 'Mensagens em grupo';

  @override
  String get quickSwitcherSectionTextChannels => 'Canais de texto';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Canais de voz';

  @override
  String get quickSwitcherSectionCommunities => 'Comunidades';

  @override
  String get quickSwitcherSectionSettings => 'Configurações';

  @override
  String get quickSwitcherHomeLabel => 'Início';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Mensagens diretas';

  @override
  String get quickSwitcherFavoritesLabel => 'Favoritos';

  @override
  String get quickSwitcherUserSettingsLabel => 'Configurações do usuário';

  @override
  String get quickSwitcherNotificationsLabel => 'Notificações';

  @override
  String get quickSwitcherBookmarksLabel => 'Favoritos';

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
  String get quickSwitcherMentionsLabel => 'Menções';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Ainda sem amigos';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Adicione um amigo para começar.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Nenhum amigo corresponde a esta pesquisa';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Tente um nome diferente.';

  @override
  String get quickSwitcherSearchAliasUser => 'Usuário';

  @override
  String get quickSwitcherSearchAliasYou => 'Você';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'DMs';

  @override
  String get quickSwitcherSearchAliasMessages => 'Mensagens';

  @override
  String get quickSwitcherSearchAliasFav => 'Fav';

  @override
  String get quickSwitcherSearchAliasStarred => 'Marcados';

  @override
  String get quickSwitcherSearchAliasInbox => 'Caixa de entrada';

  @override
  String get quickSwitcherSearchAliasSaved => 'Salvos';

  @override
  String get uiClose => 'Fechar';

  @override
  String get chatJumpToBottom => 'Ir para o final';

  @override
  String get uiConfirm => 'Confirmar';

  @override
  String get uiLoading => 'Carregando';

  @override
  String get uiSearch => 'Search';

  @override
  String get uiStartCall => 'Start call';

  @override
  String get uiStartVideoCall => 'Start video call';

  @override
  String get uiPlay => 'Play';

  @override
  String get uiPause => 'Pause';

  @override
  String get uiDownload => 'Download';

  @override
  String get uiMoreActions => 'More actions';

  @override
  String get uiUnsavedChanges => 'Alterações não salvas';

  @override
  String get uiReset => 'Redefinir';

  @override
  String get uiOpenColorPicker => 'Abrir seletor de cores';

  @override
  String get uiSelectPlaceholder => 'Selecionar';

  @override
  String get uiSearchPlaceholder => 'Pesquisar';

  @override
  String get uiNoOptionsFound => 'Nenhuma opção encontrada';

  @override
  String get uiDismissNotification => 'Dispensar notificação';

  @override
  String get uiColorPickerTitle => 'Seletor de cores';

  @override
  String get mentionConfirmTitle => 'Mencionar todos?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Isso notificará $count membros. Continuar?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Isso notificará $count membros online. Continuar?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'This will notify $count members with the $roleName role. Continue?';
  }

  @override
  String get mentionConfirmButton => 'Mencionar';

  @override
  String get composerEmojiUnavailable => 'Você não pode usar este emoji aqui.';

  @override
  String get instanceUrlLabel => 'URL da instância';

  @override
  String get instanceUrlPlaceholder =>
      'Digite a URL da instância (ex: fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Redefinir para Fluxer';

  @override
  String get instanceConnect => 'Conectar';

  @override
  String get instanceConnecting => 'Conectando…';

  @override
  String get instanceConnectFailed => 'Falha ao conectar à instância';

  @override
  String get recentInstances => 'Instâncias recentes';

  @override
  String removeRecentInstance(String domain) {
    return 'Remover $domain das instâncias recentes';
  }

  @override
  String get instanceSheetTitle => 'Conectar à instância';

  @override
  String get connectToDifferentInstance => 'Conectar a uma instância diferente';

  @override
  String get changeInstance => 'Alterar';

  @override
  String get instanceConnectionRequired =>
      'Conecte-se à instância para fazer login';

  @override
  String get comingSoon => 'Em breve';

  @override
  String get guildNavbarDirectMessages => 'Mensagens Diretas';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Explorar Comunidades Descobríveis';

  @override
  String get discoveryExplore => 'Explorar';

  @override
  String get discoveryExplorePublicCommunities =>
      'Explorar comunidades públicas';

  @override
  String get discoveryListingSubheading =>
      'Quer listar sua comunidade aqui? Candidate-se se você atender aos requisitos em Configurações da sua comunidade > Descoberta.';

  @override
  String get discoverySearchCommunities => 'Pesquisar comunidades';

  @override
  String get discoveryFilterByLanguage => 'Filtrar por idioma';

  @override
  String get discoveryAllLanguages => 'Todos os idiomas';

  @override
  String get discoveryAllCategories => 'Todos';

  @override
  String get discoveryCategoryGaming => 'Jogos';

  @override
  String get discoveryCategoryMusic => 'Música';

  @override
  String get discoveryCategoryEntertainment => 'Entretenimento';

  @override
  String get discoveryCategoryEducation => 'Educação';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Ciência e Tecnologia';

  @override
  String get discoveryCategoryContentCreator => 'Criador de Conteúdo';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime e Mangá';

  @override
  String get discoveryCategoryMoviesAndTv => 'Filmes e TV';

  @override
  String get discoveryCategoryOther => 'Outros';

  @override
  String get discoveryNoCommunitiesMatch => 'Nenhuma comunidade encontrada.';

  @override
  String get discoveryJoinCommunity => 'Entrar na comunidade';

  @override
  String get discoveryJoined => 'Entrou';

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
      other: '$countString membros',
      one: '1 membro',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Sem descrição.';

  @override
  String get discoveryCommunities => 'Comunidades';

  @override
  String get discoveryApps => 'Apps';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Não foi possível entrar nesta comunidade';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Algo deu errado. Tente novamente em um momento.';

  @override
  String get discoveryJoinErrorFullTitle => 'Esta comunidade está cheia';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Esta comunidade atingiu o limite de membros, então você não pode entrar no momento.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Você atingiu o limite de comunidades';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Você está no número máximo de comunidades. Saia de uma e tente novamente.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Você não pode entrar nesta comunidade';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Você foi banido desta comunidade.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Esta comunidade não está mais disponível';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Ela pode ter saído da descoberta ou desativado novas entradas. Atualize a página e você não a verá novamente.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Você está indo rápido demais';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Por favor, espere um momento e tente novamente.';

  @override
  String get guildNavbarAddCommunity => 'Adicionar uma Comunidade';

  @override
  String get guildNavbarHelp => 'Ajuda';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'NOVA MENSAGEM';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Recolher $folderName';
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
  String get guildNavbarGroupDm => 'DM em Grupo';

  @override
  String get guildNavbarCreateChannel => 'Criar Canal';

  @override
  String get guildNavbarChannelType => 'Tipo de Canal';

  @override
  String get guildNavbarTextChannel => 'Canal de Texto';

  @override
  String get guildNavbarTextChannelDescription =>
      'Envie mensagens, imagens, GIFs e emojis';

  @override
  String get guildNavbarVoiceChannel => 'Canal de Voz';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Fiquem juntos com voz, vídeo e compartilhamento de tela';

  @override
  String get guildNavbarLinkChannel => 'Canal de Link';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Acesso rápido a um site ou recurso externo';

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
  String get guildNavbarCreateCategory => 'Criar Categoria';

  @override
  String get guildNavbarNewCategoryHint => 'Nova Categoria';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Convide amigos para $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Os destinatários serão levados para #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Pesquisar amigos';

  @override
  String get guildNavbarNoFriendsYet => 'Ainda não há amigos';

  @override
  String get guildNavbarNoResults => 'Nenhum resultado';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Ou, envie um link de convite para um amigo:';

  @override
  String get guildNavbarInviteLink => 'Link de convite';

  @override
  String get guildNavbarCopy => 'Copiar';

  @override
  String get guildNavbarCopied => 'Copiado!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Seu link de convite expira em 7 dias.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Este link de convite nunca expira.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Seu link de convite expira em $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Editar link de convite';

  @override
  String get guildNavbarInviteLinkSettings =>
      'Configurações do link de convite';

  @override
  String get guildNavbarExpireAfter => 'Expirar Após';

  @override
  String get guildNavbarMaxUses => 'Número Máximo de Usos';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Conceder Associação Temporária';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Membros serão removidos quando ficarem offline, a menos que uma função seja atribuída';

  @override
  String get guildNavbarCreateNewLink => 'Criar Novo Link';

  @override
  String get guildNavbarSent => 'Enviado';

  @override
  String get guildNavbarInvite => 'Convidar';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Sair da Comunidade';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Tem certeza de que deseja sair desta comunidade? Você não poderá mais ver nenhuma mensagem.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Sair da Comunidade';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Excluir suas mensagens nesta comunidade?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Exclua permanentemente todas as mensagens que você enviou aqui, em todos os canais. Não pode ser desfeito.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Excluir Minhas Mensagens';

  @override
  String get guildNavbarDeletedYourMessages => 'Suas mensagens foram excluídas';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Não foi possível excluir suas mensagens';

  @override
  String get guildNavbarRemoveOverride => 'Remover substituição';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Silenciado até $formattedDate';
  }

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'Acessível apenas para a equipe $productName';
  }

  @override
  String get guildNavbarInvitesPaused =>
      'Convites estão atualmente pausados nesta comunidade';

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
  String get guildNavbarDuration1Day => '1 dia';

  @override
  String get guildNavbarDuration7Days => '7 dias';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count segundos';
  }

  @override
  String get guildNavbarNever => 'Nunca';

  @override
  String get guildNavbarNoLimit => 'Sem limite';

  @override
  String get guildNavbarOneUse => '1 uso';

  @override
  String guildNavbarUses(int count) {
    return '$count usos';
  }

  @override
  String get guildMenuMarkAsRead => 'Marcar como lido';

  @override
  String get guildPeekMoreOptions => 'Mais opções';

  @override
  String get guildMenuInviteMembers => 'Convidar membros';

  @override
  String get guildMenuCommunitySettings => 'Configurações da comunidade';

  @override
  String get guildMenuEditCommunityProfile => 'Editar perfil da comunidade';

  @override
  String get guildMenuUnmuteCommunity => 'Ativar som da comunidade';

  @override
  String get guildMenuMuteCommunity => 'Silenciar comunidade';

  @override
  String get guildMenuHideMutedChannels => 'Ocultar canais silenciados';

  @override
  String get guildMenuReportCommunity => 'Denunciar comunidade';

  @override
  String get guildMenuDebugCommunity => 'Depurar comunidade';

  @override
  String get guildMenuCopyCommunityId => 'Copiar ID da comunidade';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Até $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Geral';

  @override
  String get guildMenuSettingsRoles => 'Cargos e permissões';

  @override
  String get guildMenuSettingsEmoji => 'Emojis personalizados';

  @override
  String get guildMenuSettingsStickers => 'Stickers personalizados';

  @override
  String get guildMenuSettingsSafetyModeration => 'Segurança e moderação';

  @override
  String get guildMenuSettingsActivityLog => 'Registro de atividades';

  @override
  String get guildMenuSettingsWebhooks => 'Webhooks';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'URL de convite personalizado';

  @override
  String get guildMenuSettingsDiscovery => 'Descoberta';

  @override
  String get guildMenuSettingsMembers => 'Membros';

  @override
  String get guildMenuSettingsInviteLinks => 'Links de convite';

  @override
  String get guildMenuSettingsBans => 'Proibições';

  @override
  String get guildMenuSettingsChannels => 'Channels';

  @override
  String get guildSettingsNoPermission =>
      'Você não tem permissão para ver esta aba de configurações.';

  @override
  String get guildSettingsOverviewIconTitle => 'Ícone';

  @override
  String get guildSettingsUploadImage => 'Carregar imagem';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Carregue um banner para o seu servidor.';

  @override
  String get guildSettingsOverviewNameTitle => 'Nome';

  @override
  String get guildSettingsOverviewNameHint => 'Minha comunidade incrível';

  @override
  String get guildSettingsOverviewStatsTitle => 'Estatísticas';

  @override
  String get guildSettingsOverviewMembers => 'Membros';

  @override
  String get guildSettingsOverviewOnline => 'Online';

  @override
  String get guildSettingsRolesDescription =>
      'Use cargos para agrupar membros e atribuir permissões.';

  @override
  String get guildSettingsCreateRole => 'Criar cargo';

  @override
  String get guildSettingsRolesListTitle => 'Cargos';

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
    return '$staticCount emojis estáticos, $animatedCount emojis animados usados';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Ainda não há emojis personalizados.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count stickers enviados';
  }

  @override
  String get guildSettingsStickersEmpty =>
      'Ainda não há stickers personalizados.';

  @override
  String get guildSettingsModerationVerificationTitle =>
      'Verificação de membros';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Escolha o que os membros precisam ter antes de poderem postar ou enviar mensagens diretas para membros da comunidade.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Membros com cargos podem ignorar essas verificações. Para espaços públicos, recomendamos ativar a verificação.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Comunidades listadas em Descoberta exigem pelo menos um e-mail verificado. Nenhum pode ser selecionado enquanto a Descoberta estiver ativada.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Conteúdo maduro e avisos de conteúdo';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Configure a marcação de conteúdo maduro e avisos de conteúdo opcionais para os membros.';

  @override
  String get guildSettingsModerationMatureToggle => 'Conteúdo maduro';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Marque esta comunidade como contendo conteúdo maduro.';

  @override
  String get guildSettingsVerificationNone => 'Nenhum';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Nenhuma verificação é necessária.';

  @override
  String get guildSettingsVerificationLow => 'Baixo';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Requer um endereço de e-mail verificado.';

  @override
  String get guildSettingsVerificationMedium => 'Médio';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Requer um endereço de e-mail verificado e uma conta com pelo menos 5 minutos de idade.';

  @override
  String get guildSettingsVerificationHigh => 'Alto';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Requer tudo do médio, mais ser membro da comunidade por pelo menos 10 minutos.';

  @override
  String get guildSettingsVerificationHighest => 'Muito alto';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Requer um número de telefone verificado.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Acompanhe as ações do moderador em toda a comunidade.';

  @override
  String get guildSettingsAuditLogEmpty => 'Nenhum log ainda';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Ações de moderação e alterações na comunidade aparecerão aqui.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Todos os usuários';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Todas as ações';

  @override
  String get guildSettingsAuditLogNoReason => 'Nenhum motivo foi fornecido.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Usuário desconhecido';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Algo deu errado ao carregar o log de atividades.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Não foi possível carregar os logs de atividades';

  @override
  String get guildSettingsAuditLogReason => 'Motivo';

  @override
  String get guildSettingsAuditLogSomeone => 'alguém';

  @override
  String get guildSettingsAuditLogSomething => 'algo';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'entidade desconhecida';

  @override
  String get guildSettingsAuditLogNothing => 'nada';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Destino desconhecido';

  @override
  String get auditLogActionGuildUpdate => 'Comunidade atualizada';

  @override
  String get auditLogActionChannelCreate => 'Canal criado';

  @override
  String get auditLogActionChannelUpdate => 'Canal atualizado';

  @override
  String get auditLogActionChannelDelete => 'Canal excluído';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Permissão de canal adicionada';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Permissão de canal atualizada';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Permissão de canal removida';

  @override
  String get auditLogActionMemberKick => 'Membro expulso';

  @override
  String get auditLogActionMemberPrune => 'Membros removidos';

  @override
  String get auditLogActionMemberBanAdd => 'Membro banido';

  @override
  String get auditLogActionMemberBanRemove => 'Membro desbanido';

  @override
  String get auditLogActionMemberUpdate => 'Membro atualizado';

  @override
  String get auditLogActionMemberRoleUpdate => 'Cargos do membro atualizados';

  @override
  String get auditLogActionMemberMove => 'Membro movido';

  @override
  String get auditLogActionMemberDisconnect => 'Membro desconectado';

  @override
  String get auditLogActionBotAdd => 'Bot adicionado';

  @override
  String get auditLogActionRoleCreate => 'Cargo criado';

  @override
  String get auditLogActionRoleUpdate => 'Cargo atualizado';

  @override
  String get auditLogActionRoleDelete => 'Função excluída';

  @override
  String get auditLogActionInviteCreate => 'Convite criado';

  @override
  String get auditLogActionInviteUpdate => 'Convite atualizado';

  @override
  String get auditLogActionInviteDelete => 'Convite excluído';

  @override
  String get auditLogActionWebhookCreate => 'Webhook criado';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook atualizado';

  @override
  String get auditLogActionWebhookDelete => 'Webhook excluído';

  @override
  String get auditLogActionEmojiCreate => 'Emoji criado';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji atualizado';

  @override
  String get auditLogActionEmojiDelete => 'Emoji excluído';

  @override
  String get auditLogActionStickerCreate => 'Figurinha criada';

  @override
  String get auditLogActionStickerUpdate => 'Figurinha atualizada';

  @override
  String get auditLogActionStickerDelete => 'Figurinha excluída';

  @override
  String get auditLogActionMessageDelete => 'Mensagem excluída';

  @override
  String get auditLogActionMessageBulkDelete => 'Mensagens excluídas';

  @override
  String get auditLogActionMessagePin => 'Mensagem fixada';

  @override
  String get auditLogActionMessageUnpin => 'Mensagem desfixada';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor atualizou as configurações da comunidade.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor criou o canal $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor atualizou o canal $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor excluiu o canal $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor adicionou permissões de canal para $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor adicionou permissões de canal para $target em $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor atualizou permissões de canal para $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor atualizou permissões de canal para $target em $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor removeu permissões de canal para $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor removeu permissões de canal para $target em $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor expulsou $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor baniu $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor des επιβλήθηκε banimento de $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor atualizou $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor atualizou as funções de $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor removeu membros inativos.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor removeu membros inativos por $days dias.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor moveu $target para outro canal de voz.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor moveu $target para $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor desconectou $target do áudio.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor adicionou o bot $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor criou a função $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor atualizou a função $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor excluiu a função $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor criou o convite $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor criou o convite $target para $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor atualizou o convite $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor atualizou o convite $target para $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor excluiu o convite $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor excluiu o convite $target para $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor criou o webhook $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor atualizou o webhook $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor excluiu o webhook $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor adicionou o emoji $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor atualizou o emoji $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor excluiu o emoji $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor adicionou o sticker $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor atualizou o sticker $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor excluiu o sticker $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor excluiu uma mensagem.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor excluiu uma mensagem em $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor excluiu várias mensagens.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor excluiu $count mensagens.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor excluiu várias mensagens em $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor excluiu $count mensagens em $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor fixou uma mensagem.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor fixou uma mensagem em $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor desfixou uma mensagem.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor desfixou uma mensagem em $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor realizou uma ação de auditoria em $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Atualizou $field de $oldValue para $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Definiu $field para $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Limpou $field (era $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Atualizou $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Renomeou a comunidade para $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Atualizou o ícone da comunidade.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Renomeou o canal para $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Limpou o tópico.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Atualizou o tópico para $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent => 'Ativou conteúdo adulto.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Desativou conteúdo adulto.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Definiu o apelido para $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Removeu o apelido $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Silenciou o membro.';

  @override
  String get auditLogChangeUnmutedMember => 'Ativou o som do membro.';

  @override
  String get auditLogChangeDeafenedMember => 'Deixou o membro surdo.';

  @override
  String get auditLogChangeUndeafenedMember => 'Tirou a surdez do membro.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Adicionou $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Removeu $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Canal: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Mensagem: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Convidado por $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Excluídas # mensagens.',
      one: 'Excluída # mensagem.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Membros removidos #.',
      one: 'Membro removido #.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires => 'Este convite nunca expira.';

  @override
  String get auditLogOptionTemporaryMembership =>
      'Concede associação temporária.';

  @override
  String get auditLogOptionPermanentMembership =>
      'Concede associação permanente.';

  @override
  String get guildSettingsLoadMore => 'Carregar mais';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Gerencie webhooks que postam mensagens em canais.';

  @override
  String get guildSettingsWebhooksEmpty => 'Nenhum webhook configurado.';

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
  String get guildSettingsCopiedUrl =>
      'URL copiada para a área de transferência';

  @override
  String get guildSettingsDeleteWebhook => 'Excluir webhook';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Defina um link de convite personalizado para o seu servidor.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Salvar';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Uso';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count usos';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Candidate-se para ser listado na descoberta de servidores.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Not enough members';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Requer pelo menos $count membros para se candidatar.';
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
  String get guildSettingsDiscoveryCategory => 'Categoria';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Choose the category that best describes your community. You can change this any time.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Primary language';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'The language most of your community speaks. Used to filter Discovery results.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Descrição';

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
  String get guildSettingsDiscoveryTags => 'Tags';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Up to $maxTags tags help people find your community. They show up in Discovery search.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'jogos, arte, música';

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
  String get guildSettingsDiscoveryApply => 'Enviar Inscrição';

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
      'Pesquise e gerencie os membros do servidor.';

  @override
  String get guildSettingsMembersSearchHint => 'Pesquisar membros';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count membros';
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
  String get guildSettingsMembersSortNewest => 'Mais recentes primeiro';

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
      'Visualize e revogue links de convite ativos.';

  @override
  String get guildSettingsInvitesEmpty => 'Nenhum convite ativo.';

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
  String get guildSettingsInvitesCopyLink => 'Copiar link de convite';

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
    return 'Expira em $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Visualize e gerencie usuários banidos.';

  @override
  String get guildSettingsBansSearchHint => 'Pesquisar banimentos';

  @override
  String get guildSettingsBansEmpty => 'Nenhum usuário banido.';

  @override
  String get guildSettingsBanPermanent => 'Banimento permanente';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Expira em $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Expira';

  @override
  String get guildSettingsUnban => 'Desbanir';

  @override
  String get guildSettingsBansLoading => 'Carregando usuários banidos';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Nenhum banimento encontrado correspondendo à sua pesquisa.';

  @override
  String get guildSettingsBanDetailsTitle => 'Detalhes do banimento';

  @override
  String get guildSettingsBanViewDetails => 'Ver detalhes';

  @override
  String get guildSettingsBannedOn => 'Banido em';

  @override
  String get guildSettingsBannedBy => 'Banido por';

  @override
  String get guildSettingsRevokeBanTitle => 'Revogar banimento';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Tem certeza de que deseja revogar o banimento de $displayName? Ele poderá voltar para a comunidade.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Banimento revogado para $displayName';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Não foi possível carregar os banimentos. Tente novamente.';

  @override
  String get guildSettingsRevokeBanError =>
      'Não foi possível revogar o banimento. Tente novamente.';

  @override
  String get guildSettingsCommunitySettings => 'Configurações da Comunidade';

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
      'Gerencie o perfil, os canais e as configurações padrão da sua comunidade.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Identidade Visual';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Atualize seu ícone, nome, banner e plano de fundo do convite';

  @override
  String get guildSettingsOverviewBannerUpload => 'Carregar banner';

  @override
  String get guildSettingsOverviewIdleTitle => 'Configurações de inatividade';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Configure o canal AFK e o tempo limite';

  @override
  String get guildSettingsOverviewSystemTitle => 'Sistema e boas-vindas';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Escolha o destino para mensagens do sistema e de boas-vindas';

  @override
  String get guildSettingsOverviewNotificationsTitle => 'Notificações padrão';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Comunidades com mais de 250 pessoas são forçadas à configuração \"apenas menções\". Sua configuração original é preservada e será restaurada se a comunidade cair abaixo de 250 membros.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Avançado';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Permitir nomes de canais de texto flexíveis';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Ocultar coroa do proprietário da comunidade';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Banner destacado';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Mostra o banner em sua própria seção abaixo do cabeçalho da comunidade.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Carregar ícone';

  @override
  String get guildSettingsOverviewRemoveImage => 'Remover';

  @override
  String get guildSettingsOverviewSplashTitle => 'Fundo do convite';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'Fundo do embed de chat';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Exibido em embeds de convite no chat.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Carregar fundo';

  @override
  String get guildSettingsOverviewNoCommunityBanner =>
      'Sem banner da comunidade';

  @override
  String get guildSettingsOverviewNoInviteBackground => 'Sem fundo de convite';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Prévia';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Veja como seu convite aparece para os visitantes.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Nomes de canais de texto';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Coroa do proprietário da comunidade';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Configure se o ícone da coroa é exibido ao lado do proprietário da comunidade';

  @override
  String get guildSettingsSplashCardAlignment => 'Alinhamento do card';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Centro';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Esquerda';

  @override
  String get guildSettingsSplashAlignmentRight => 'Direita';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Aplica-se apenas em telas largas.';

  @override
  String get permissionReadMessageHistory => 'Ler histórico de mensagens';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Alterar o que usuários sem \"$permission\" podem ver';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Use um modal dedicado para definir uma data limite de histórico de mensagens para membros que não possuem a permissão $permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Abrir limite de histórico de mensagens';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Limite de histórico de mensagens';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Habilitar limite de histórico de mensagens';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Data limite';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Membros sem Ler Histórico de Mensagens podem ver mensagens enviadas após esta data.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Limite de histórico de mensagens atualizado';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Permite letras maiúsculas e espaços em nomes de canais de texto. Desativado restringe nomes a minúsculas com hifens e underscores.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Oculta o ícone da coroa ao lado do proprietário da comunidade em todas as superfícies.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Ícones animados exigem o recurso de comunidade Ícone Animado.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Banners animados exigem o recurso de comunidade Banner Animado.';

  @override
  String get guildSettingsAfkChannel => 'Canal AFK / ocioso';

  @override
  String get guildSettingsAfkChannelHint =>
      'Mova membros para este canal quando estiverem AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Sem canal AFK';

  @override
  String get guildSettingsAfkTimeout => 'Tempo limite AFK';

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
      'Mensagens de boas-vindas e do sistema aparecerão aqui.';

  @override
  String get guildSettingsNoSystemChannel => 'Sem canal de sistema';

  @override
  String get guildSettingsHideJoinMessages => 'Ocultar mensagens de entrada';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Suprime as mensagens de entrada no canal de destino.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Configurações de notificação padrão';

  @override
  String get guildSettingsNotificationsAll => 'Todas as mensagens';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Notificar sobre todas as mensagens';

  @override
  String get guildSettingsNotificationsMentions => 'Apenas menções';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Notificar apenas sobre menções';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Máx. 10MB. Mínimo: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Máx. 10MB. Mínimo: 960×540px (16:9). Exibido em embeds de convite no chat.';

  @override
  String get guildSettingsModerationDescription =>
      'Configure as configurações de verificação, filtragem de conteúdo e conteúdo adulto.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Comunidades listadas na Discovery têm opções de moderação restritas.';

  @override
  String get guildSettingsModerationContentFilterTitle =>
      'Filtragem de conteúdo';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Verifique automaticamente as mensagens em busca de conteúdo explícito em canais não marcados como adultos.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Comunidades listadas na Discovery são obrigadas a verificar todos os membros. Esta configuração não pode ser alterada enquanto a Discovery estiver ativada.';

  @override
  String get guildSettingsContentFilterOff => 'Desativado';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Deixe a comunidade se auto-moderar';

  @override
  String get guildSettingsContentFilterNoRole => 'Filtrar membros sem cargos';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Sugerido para a maioria das comunidades';

  @override
  String get guildSettingsContentFilterAll => 'Filtrar todos';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Proteção máxima para espaços familiares';

  @override
  String get guildSettingsModerationMatureOff => 'Desativado';

  @override
  String get guildSettingsModerationMatureOn => 'Ativado';

  @override
  String get guildSettingsContentWarningToggle => 'Mostrar aviso de conteúdo';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Ativa um prompt de consentimento antes de entrar em qualquer canal.';

  @override
  String get guildSettingsContentWarningText => 'Texto de aviso personalizado';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Isto contém conteúdo sensível.';

  @override
  String get guildSettingsModeration2faTitle => 'Requisito de 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'Exija autenticação de dois fatores para moderadores antes que eles possam banir, expulsar, silenciar ou remover mensagens.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Exigir 2FA para ações de moderação';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Apenas o proprietário da comunidade pode alterar esta configuração';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Ative o 2FA em sua conta para alterar esta configuração';

  @override
  String get guildSettingsEmojiSearchHint => 'Pesquisar emojis';

  @override
  String get guildSettingsEmojiUploadTitle => 'Carregar Emoji';

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
    return 'Emoji não animado ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Emoji animado ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Pesquisar figurinhas';

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
    return 'Crie webhooks nas configurações do canal. Edite-os aqui.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'Sua URL de vaidade não funcionará a menos que pelo menos um canal seja visível para todos.';

  @override
  String get guildSettingsVanityUrlRemove => 'Remover';

  @override
  String get guildSettingsBannedUsersTitle => 'Usuários banidos';

  @override
  String get guildSettingsInvitesTableInviter => 'Convidante';

  @override
  String get guildSettingsInvitesTableChannel => 'Canal';

  @override
  String get guildSettingsInvitesTableCode => 'Código';

  @override
  String get guildSettingsInvitesTableUses => 'Usos';

  @override
  String get guildSettingsInvitesTableCreated => 'Criado';

  @override
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtrar por usuário';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtrar por ação';

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

  @override
  String get homeQuickActionDms => 'DMs';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class FluxerLocalizationsPtBr extends FluxerLocalizationsPt {
  FluxerLocalizationsPtBr() : super('pt_BR');

  @override
  String get reconnectingTitle => 'Deu ruim!';

  @override
  String get reconnectingBody =>
      'Algo deu errado com a instância.\nDeve ser corrigido em um segundo!';

  @override
  String get gatewayReconnectingToast => 'Reconectando…';

  @override
  String get gatewayConnectedToast => 'Conectado';

  @override
  String get sessionExpiredToast =>
      'Sua sessão expirou. Por favor entre novamente.';

  @override
  String splashStartupFailed(String error) {
    return 'Falha ao iniciar: $error';
  }

  @override
  String get retry => 'Tentar novamente';

  @override
  String get connectingCaps => 'CONECTANDO';

  @override
  String get splashConnectionLost => 'Conexão perdida';

  @override
  String get splashViewOnStatusPage => 'Ver no status da página';

  @override
  String get splashConnectionIssuesPrompt => 'Problemas de conexão?';

  @override
  String get splashStatusPageLink => 'Página de status';

  @override
  String get splashReadIncident => 'Ler incidente';

  @override
  String get splashIncidentHistory => 'Histórico de incidentes';

  @override
  String get nagbarLearnMore => 'Saiba mais';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'Manutenção agendada para $localizedTime. Duração prevista: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Manutenção em andamento. Duração prevista: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'Manutenção concluída.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Olá, $displayName, reivindique sua conta para não perder o acesso.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Olá, $displayName, por favor, verifique seu endereço de e-mail.';
  }

  @override
  String get nagbarOpenSettings => 'Abrir configurações';

  @override
  String get systemPermissionSettingsTitle => 'Ativar permissão';

  @override
  String get systemPermissionSettingsOpenSettings => 'Abrir configurações';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return 'O $productName não tem acesso ao seu microfone. Você pode ativá-lo nas configurações de privacidade do seu dispositivo.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return 'O $productName não tem acesso à sua câmera. Você pode ativá-lo nas configurações de privacidade do seu dispositivo.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return 'O $productName não tem acesso à sua biblioteca de fotos. Você pode habilitá-lo nas configurações de privacidade do seu dispositivo.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return 'O $productName não tem permissão para enviar notificações. Você pode ativá-la nas configurações do seu dispositivo.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Sua assinatura falhou ao renovar, mas você ainda tem acesso às vantagens do $productName até $graceDate. Tome uma atitude agora ou perderá todas as vantagens.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Sua assinatura do $productName expirou. Renove agora para manter seus benefícios.';
  }

  @override
  String get nagbarManageSubscription => 'Gerenciar assinatura';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Bem-vindo(a) ao $productFullName. Explore seus benefícios do $productName e gerencie sua assinatura.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'Ver recursos do $productName';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'Você tem um novo código de presente esperando no seu inventário de presentes.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'Você tem $count novos códigos de presente esperando no seu inventário de presentes.';
  }

  @override
  String get nagbarViewGiftInventory => 'Ver inventário de presentes';

  @override
  String get nagbarVisionaryMfa =>
      'Ative a autenticação de dois fatores para proteger sua conta Visionary.';

  @override
  String get nagbarEnableMfa => 'Ativar 2FA';

  @override
  String get nagbarTermsAcceptance =>
      'Atualizamos nossos termos. Por favor, revise e aceite-os para continuar.';

  @override
  String get nagbarReviewTerms => 'Revisar termos';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Participe de $communityName para conversar com a equipe e ficar por dentro das novidades.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Entrar em $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'Ative as notificações para não perder mensagens e menções.';

  @override
  String get nagbarEnableNotifications => 'Ativar notificações';

  @override
  String get nagbarBillingPortalFailed =>
      'Não foi possível abrir o portal de cobrança. Tente novamente em um momento.';

  @override
  String get welcomeBack => 'Bem-vindo(a) de volta';

  @override
  String get email => 'E-mail';

  @override
  String get emailInvalid => 'Por favor, insira um endereço de e-mail válido.';

  @override
  String get password => 'Senha';

  @override
  String get forgotPassword => 'Esqueceu sua senha?';

  @override
  String get logIn => 'Entrar';

  @override
  String get logInWithPasskey => 'Entrar com uma chave de acesso';

  @override
  String continueWithSso(String provider) {
    return 'Continuar com $provider';
  }

  @override
  String get ssoRequired => 'O SSO é necessário para acessar esta instância.';

  @override
  String get organizationSsoProvider =>
      'Entre com o provedor de login único da sua organização.';

  @override
  String get failedToStartSso => 'Falha ao iniciar o SSO';

  @override
  String get ssoCancelled => 'O login SSO foi cancelado';

  @override
  String preferSso(String provider) {
    return 'Prefere usar SSO? Continue com $provider.';
  }

  @override
  String get logInViaBrowser => 'Entrar pelo navegador';

  @override
  String get needAccountPrompt => 'Precisa de uma conta? ';

  @override
  String get register => 'Registrar';

  @override
  String get orDivider => 'OU';

  @override
  String get captchaTitle => 'Verifique se você é humano';

  @override
  String get captchaDescription =>
      'Precisamos ter certeza de que você não é um robô. Por favor, complete a verificação abaixo.';

  @override
  String get captchaSwitchToHcaptcha =>
      'Problemas? Tente o hCaptcha em vez disso';

  @override
  String get captchaSwitchToTurnstile => 'Tente o Turnstile em vez disso';

  @override
  String get cancel => 'Cancelar';

  @override
  String get ipAuthCheckEmail => 'Verifique seu e-mail';

  @override
  String ipAuthDescription(String email) {
    return 'Enviamos um link por e-mail para autorizar este login. Por favor, abra sua caixa de entrada para $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Conexão perdida';

  @override
  String get ipAuthConnectionLostDescription =>
      'Perdemos a conexão enquanto aguardávamos a autorização. Por favor, tente novamente.';

  @override
  String get ipAuthLinkExpired => 'Link de login expirado';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Este link de autorização expirou. Por favor, faça login novamente.';

  @override
  String get ipAuthResendEmail => 'Reenviar e-mail';

  @override
  String get ipAuthResent => 'Reenviado';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Voltar';

  @override
  String get next => 'Próximo';

  @override
  String get mfaTitle => 'Autenticação de dois fatores';

  @override
  String get mfaChooseMethod => 'Escolha um método de verificação';

  @override
  String get mfaMethodTotp => 'Aplicativo autenticador';

  @override
  String get mfaMethodWebauthn => 'Chave de segurança / Chave de acesso';

  @override
  String get mfaTotpDescription =>
      'Digite o código de 6 dígitos do seu aplicativo autenticador ou um dos seus códigos de backup.';

  @override
  String get mfaCodeLabel => 'Código';

  @override
  String get mfaTryAnotherMethod => 'Tentar outro método';

  @override
  String get mfaUseSecurityKey => 'Use chave de segurança / senha em vez disso';

  @override
  String get accountSelectorTitle => 'Escolha uma conta';

  @override
  String get accountSelectorDescription =>
      'Selecione uma conta para continuar ou adicione outra.';

  @override
  String get accountAdd => 'Adicionar conta';

  @override
  String get accountRemove => 'Remover';

  @override
  String accountRemoveTitle(String username) {
    return 'Remover $username';
  }

  @override
  String get accountRemoveDescription =>
      'Isso removerá a sessão salva para esta conta.';

  @override
  String get accountRemoveOnlyDescription =>
      'Isso removerá a única conta salva neste dispositivo.';

  @override
  String get accountExpired => 'Expirada';

  @override
  String accountSessionExpired(String identifier) {
    return 'Sessão expirada para $identifier. Faça login novamente.';
  }

  @override
  String get accountManageTitle => 'Gerenciar contas';

  @override
  String get accountSwitchFailed =>
      'Não foi possível trocar de conta. Tente novamente.';

  @override
  String get profileTabMenuSwitchAccounts => 'Trocar de contas';

  @override
  String get statusChangeSheetTitle => 'Definir status';

  @override
  String get statusOnlineStatusSection => 'Status online';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusIdle => 'Inativo';

  @override
  String get statusDnd => 'Não perturbe';

  @override
  String get statusInvisible => 'Invisível';

  @override
  String get statusOffline => 'Offline';

  @override
  String get statusUntilIChangeIt => 'Até que eu mude';

  @override
  String get statusDontClear => 'Não limpar';

  @override
  String get statusFor10Seconds => 'Por 10 segundos';

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
  String get statusClearAfter3Days => '3 dias';

  @override
  String get statusDndDescription =>
      'Você não receberá notificações no desktop';

  @override
  String get statusInvisibleDescription => 'Você aparecerá offline';

  @override
  String get customStatusSetTitle => 'Definir status personalizado';

  @override
  String get customStatusCurrentHint => 'Status personalizado';

  @override
  String get customStatusClear => 'Limpar status personalizado';

  @override
  String get customStatusPlaceholder => 'O que está acontecendo?';

  @override
  String get customStatusChooseEmoji => 'Escolher um emoji';

  @override
  String get customStatusClearAfter => 'Limpar após';

  @override
  String get customStatusSave => 'Salvar';

  @override
  String get accountActive => 'Conta ativa';

  @override
  String get signOut => 'Sair';

  @override
  String get suspendedPermanentTitle => 'Conta Suspensa Permanentemente';

  @override
  String get suspendedTemporaryTitle => 'Conta Suspensa';

  @override
  String get suspendedPermanentDescription =>
      'Sua conta foi suspensa permanentemente por violar nossos Termos de Serviço.';

  @override
  String get suspendedTemporaryDescription =>
      'Sua conta foi suspensa temporariamente. Você poderá acessá-la quando o período de suspensão terminar.';

  @override
  String get suspendedIssuedAt => 'Emitido em';

  @override
  String get suspendedEndsAt => 'Termina em';

  @override
  String get suspendedDuration => 'Duração';

  @override
  String get suspendedPermanent => 'Permanente';

  @override
  String get suspendedReason => 'Motivo';

  @override
  String get suspendedAppealDeadline => 'Prazo para Recurso';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Sua conta está programada para exclusão em $date.';
  }

  @override
  String get suspendedRecheck => 'Verificar atualizações';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Verificar novamente em ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Voltar ao login';

  @override
  String get suspendedAppealTitle => 'Recurso';

  @override
  String get suspendedAppealHint =>
      'Explique por que sua suspensão deve ser reconsiderada (mínimo de 50 caracteres)...';

  @override
  String get suspendedAppealSubmit => 'Enviar Recurso';

  @override
  String get suspendedAppealPending => 'Análise Pendente';

  @override
  String get suspendedAppealAccepted => 'Recurso Aceito';

  @override
  String get suspendedAppealRejected => 'Recurso Rejeitado';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Seu recurso foi aceito e sua conta foi restaurada.';

  @override
  String get suspendedSignIn => 'Entrar na sua conta';

  @override
  String get forgotPasswordTitle => 'Esqueceu sua senha?';

  @override
  String get forgotPasswordDescription =>
      'Digite seu endereço de e-mail e enviaremos um link para redefinir sua senha.';

  @override
  String get forgotPasswordSubmit => 'Enviar link de redefinição';

  @override
  String get forgotPasswordSentTitle => 'Verifique seu e-mail';

  @override
  String get forgotPasswordSentDescription =>
      'Enviamos instruções para redefinição de senha para o seu endereço de e-mail. Verifique sua caixa de entrada e siga o link para redefinir sua senha.';

  @override
  String get forgotPasswordBackToLogin => 'Voltar ao login';

  @override
  String get resetPasswordTitle => 'Definir nova senha';

  @override
  String get resetPasswordDescription =>
      'Digite sua nova senha abaixo para concluir o processo de redefinição.';

  @override
  String get resetPasswordNewPassword => 'Nova senha';

  @override
  String get resetPasswordConfirm => 'Confirmar nova senha';

  @override
  String get resetPasswordSubmit => 'Redefinir senha';

  @override
  String get resetPasswordMismatch => 'As senhas não coincidem.';

  @override
  String get registerTitle => 'Criar uma conta';

  @override
  String get registerDisplayName => 'Nome de Exibição (Opcional)';

  @override
  String get registerDisplayNameHint => 'Como as pessoas devem te chamar?';

  @override
  String get registerUsername => 'Nome de Usuário (Opcional)';

  @override
  String get registerUsernameHint =>
      'Deixe em branco para um nome de usuário aleatório';

  @override
  String get registerUsernameTagHint =>
      'Uma tag de 4 dígitos será adicionada automaticamente para garantir a exclusividade';

  @override
  String get registerDateOfBirth => 'Data de nascimento';

  @override
  String get registerMonth => 'Mês';

  @override
  String get registerDay => 'Dia';

  @override
  String get registerYear => 'Ano';

  @override
  String get registerConsent =>
      'Concordo com os Termos de Serviço e a Política de Privacidade';

  @override
  String get registerConsentPrefix => 'Concordo com os ';

  @override
  String get registerConsentTerms => 'Termos de Serviço';

  @override
  String get registerConsentAnd => ' e ';

  @override
  String get registerConsentPrivacy => 'Política de Privacidade';

  @override
  String get registerConfirmPassword => 'Confirmar Senha';

  @override
  String get registerSubmit => 'Criar conta';

  @override
  String get registerHaveAccount => 'Já tem uma conta? ';

  @override
  String get registerPendingApproval =>
      'Sua solicitação de conta está aguardando aprovação. Você poderá entrar depois que um administrador aprová-la.';

  @override
  String get registerClosed =>
      'O registro está fechado no momento. Use um link de registro de um administrador para criar uma conta.';

  @override
  String get passkeyNoCredentials =>
      'Nenhuma passkey encontrada para este aplicativo. Faça login com e-mail e senha em vez disso.';

  @override
  String get passkeyDeviceNotSupported =>
      'Passkeys não são suportadas neste dispositivo.';

  @override
  String get passkeyDomainNotAssociated =>
      'Passkeys não estão configuradas para este aplicativo. Faça login com e-mail e senha em vez disso.';

  @override
  String get passkeyTimeout =>
      'A autenticação de passkey expirou. Por favor, tente novamente.';

  @override
  String get passkeyNotAvailable =>
      'Passkeys não estão disponíveis para este aplicativo. Faça login com e-mail e senha em vez disso.';

  @override
  String get passkeyFailed =>
      'Falha na autenticação da chave de acesso. Tente novamente.';

  @override
  String get errorUnableToCreateAccount =>
      'Não foi possível criar a conta. Tente novamente.';

  @override
  String get errorUnableToSignIn =>
      'Não foi possível entrar no momento. Tente novamente.';

  @override
  String get errorServiceUnavailable =>
      'Esta instância está temporariamente indisponível. Tente novamente em um momento.';

  @override
  String get errorInvalidEmailOrPassword => 'E-mail ou senha inválidos.';

  @override
  String get errorUnableToSendResetLink =>
      'Não foi possível enviar o link de redefinição. Tente novamente.';

  @override
  String get errorUnableToResetPassword =>
      'Não foi possível redefinir a senha. Tente novamente.';

  @override
  String get embedInviteJoin => 'Entrar na Comunidade';

  @override
  String get embedInviteGoTo => 'Ir para a Comunidade';

  @override
  String embedInviteOnline(String count) {
    return '$count Online';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count Membros';
  }

  @override
  String get embedInviteUnknownTitle => 'Convite Desconhecido';

  @override
  String get embedInviteUnknownSubtitle => 'Tente pedir um novo convite.';

  @override
  String get embedInviteUnavailable => 'Convite Indisponível';

  @override
  String get embedInviteJoinGroup => 'Entrar no grupo';

  @override
  String get embedInviteAlreadyJoined => 'Já entrou';

  @override
  String get embedInviteDisabled => 'Convites desativados';

  @override
  String get embedInvitePaused =>
      'Os convites estão pausados para esta comunidade.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName detectou um ataque em potencial, então novos usuários não podem entrar agora.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Esta comunidade pausou os convites. Você pode tentar novamente mais tarde.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return 'O $productName detectou um possível ataque nesta comunidade. Os convites estão pausados, então novos usuários não podem entrar agora.';
  }

  @override
  String get inviteAcceptTitle => 'Você foi convidado para entrar';

  @override
  String get inviteAcceptJoinButton => 'Entrar na Comunidade';

  @override
  String get inviteAcceptGoToButton => 'Ir para a Comunidade';

  @override
  String get inviteAcceptInvitesPaused => 'Convites em Pausa';

  @override
  String get inviteAcceptNotFoundTitle => 'Convite Inválido';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Este convite pode ter expirado ou ser inválido.';

  @override
  String get invalidDeepLinkTitle => 'O link não pôde ser aberto';

  @override
  String get invalidDeepLinkDescription =>
      'Esse link pode estar quebrado, disponível apenas no navegador, ou você pode não ter acesso. Verifique o link e tente novamente.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Ir para a página inicial';

  @override
  String get inviteAcceptJoinGroupButton => 'Entrar no grupo';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Você foi convidado para entrar em um chat em grupo por $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'alguém';

  @override
  String get inviteAcceptEmojiPack => 'Pacote de emojis';

  @override
  String get inviteAcceptStickerPack => 'Pacote de figurinhas';

  @override
  String get inviteAcceptInstallEmojiPack => 'Instalar pacote de emojis';

  @override
  String get inviteAcceptInstallStickerPack => 'Instalar pacote de figurinhas';

  @override
  String get inviteAcceptPackInstallNote =>
      'Aceitar este convite instala o pacote automaticamente.';

  @override
  String get mentionUnknownChannel => 'canal-desconhecido';

  @override
  String get channelAccessDeniedTitle => 'Acesso ao Canal Negado';

  @override
  String get channelAccessDeniedDescription =>
      'Você não tem acesso ao canal onde esta mensagem foi enviada.';

  @override
  String get messageJumpLinkNoAccess => 'Sem acesso';

  @override
  String get okay => 'Ok';

  @override
  String get embedThemeTitle => 'Tema Compartilhado';

  @override
  String get embedThemeSubtitle =>
      'Este cliente não suporta temas personalizados.';

  @override
  String get embedThemeUnavailableButton => 'Temas indisponíveis';

  @override
  String embedGiftVisionaryLifetime(String productName) {
    return 'Visionary (vitalício $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dias de $productName',
      one: '1 dia de $productName',
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
      one: '1 mês de $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count anos de $productName',
      one: '1 ano de $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'De $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'Clique para resgatar seu presente!';

  @override
  String get embedGiftAlreadyRedeemed => 'Já resgatado';

  @override
  String get embedGiftClaimAccountHelp =>
      'Crie sua conta para resgatar este presente.';

  @override
  String get embedGiftClaim => 'Resgatar presente';

  @override
  String get embedGiftClaimed => 'Presente resgatado';

  @override
  String get embedGiftClaimAccount => 'Resgate a conta para usar';

  @override
  String get embedGiftUnknownTitle => 'Presente desconhecido';

  @override
  String get embedGiftUnknownSubtitle =>
      'Este código de presente é inválido ou já foi resgatado.';

  @override
  String get embedGiftUnavailable => 'Presente indisponível';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Resgate seu presente para ativar sua assinatura do $productName!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'Este presente já foi resgatado.';

  @override
  String get giftAcceptMaybeLater => 'Talvez depois';

  @override
  String get giftRedeemedToast => 'Presente resgatado!';

  @override
  String get giftRedeemInvalidTitle => 'Código de presente inválido';

  @override
  String get giftRedeemInvalidMessage =>
      'Este código é inválido ou já foi usado.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Presente já resgatado';

  @override
  String get giftRedeemAlreadyRedeemedMessage =>
      'Este código já foi resgatado.';

  @override
  String get giftRedeemNotFoundTitle => 'Presente não encontrado';

  @override
  String get giftRedeemNotFoundMessage => 'Este código não existe.';

  @override
  String get giftRedeemFailedTitle => 'Falha ao resgatar presente';

  @override
  String get giftRedeemFailedMessage =>
      'Não foi possível resgatar este presente. Tente novamente.';

  @override
  String get giftVisionaryCannotRedeemTitle =>
      'Não é possível resgatar este presente';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Contas Visionary não podem resgatar presentes de Plutonium. Copie o link para compartilhá-lo com um amigo.';

  @override
  String get giftCopyLink => 'Copiar link do presente';

  @override
  String get privacySettings => 'Configurações de Privacidade';

  @override
  String get privacyDirectMessages => 'Mensagens Diretas';

  @override
  String get privacyDirectMessagesDescription =>
      'Permitir mensagens diretas de outros membros nesta comunidade';

  @override
  String get privacyBotDirectMessages => 'Mensagens Diretas de Bots';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Permitir que bots desta comunidade enviem mensagens diretas para você';

  @override
  String get privacyMutualDmsDisabled =>
      'Os administradores da comunidade desativaram o recebimento de mensagens diretas apenas de membros mútuos nesta comunidade.';

  @override
  String get communityDebug => 'Depuração da Comunidade';

  @override
  String get copiedToClipboard => 'Copiado para a área de transferência';

  @override
  String get notificationSettings => 'Configurações de Notificação';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Silenciar $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Silenciar uma comunidade impede que indicadores de não lidas e notificações apareçam, a menos que você seja mencionado';

  @override
  String get notificationCommunitySettings =>
      'Configurações de Notificação da Comunidade';

  @override
  String get notificationAllMessages => 'Todas as Mensagens';

  @override
  String get notificationOnlyMentions => 'Apenas Menções';

  @override
  String get notificationNothing => 'Nada';

  @override
  String get notificationSuppressEveryone => 'Suprimir @everyone e @here';

  @override
  String get notificationSuppressRoles => 'Suprimir todas as menções de cargo';

  @override
  String get notificationMobilePush => 'Notificações push para celular';

  @override
  String get notificationOverrides => 'Substituições de notificação';

  @override
  String get notificationSelectChannel => 'Selecionar um canal ou categoria';

  @override
  String get notificationOnlyAtMentions => 'Somente @menções';

  @override
  String get notificationMuteChannel => 'Silenciar canal';

  @override
  String get notificationUnmuteChannel => 'Ativar som do canal';

  @override
  String get notificationUseCategoryDefault => 'Usar padrão da categoria';

  @override
  String get notificationUseCommunityDefault => 'Usar padrão da comunidade';

  @override
  String get notificationNoCategory => 'Sem categoria';

  @override
  String get dmMarkAsRead => 'Marcar como lido';

  @override
  String get dmMuteConversation => 'Silenciar DM';

  @override
  String get dmUnmuteConversation => 'Ativar som da DM';

  @override
  String get dmPinDm => 'Fixar DM';

  @override
  String get dmUnpinDm => 'Desafixar DM';

  @override
  String get dmAlwaysShowInSidebar => 'Sempre mostrar na barra lateral';

  @override
  String get dmRemoveFromAlwaysShown => 'Remover de sempre mostrados';

  @override
  String get dmCloseDm => 'Fechar DM';

  @override
  String get dmCloseDmConfirmTitle => 'Fechar DM';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Tem certeza de que deseja fechar sua DM com $username? Você sempre pode reabri-la mais tarde.';
  }

  @override
  String get dmDeleteMyMessagesTitle =>
      'Excluir suas mensagens nesta conversa?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Isso apagará permanentemente todas as mensagens que você enviou nesta conversa. Esta ação não pode ser desfeita.';

  @override
  String get dmCopyChannelId => 'Copiar ID do canal';

  @override
  String get dmChannelIdCopied => 'ID do canal copiado';

  @override
  String get dmCopyUserId => 'Copiar ID do usuário';

  @override
  String get dmUserIdCopied => 'ID do usuário copiado';

  @override
  String get dmViewProfile => 'Ver perfil';

  @override
  String get dmVoiceCall => 'Iniciar chamada de voz';

  @override
  String get incomingVoiceCallTitle => 'Chamada de voz recebida';

  @override
  String get incomingVoiceCallAccept => 'Aceitar';

  @override
  String get incomingVoiceCallDecline => 'Recusar';

  @override
  String get incomingVoiceCallLabel => 'Chamada recebida';

  @override
  String get incomingVoiceCallIgnore => 'Ignorar';

  @override
  String get directVoiceCallNotEligible =>
      'Esta chamada não pode ser iniciada agora. Tente novamente em um momento.';

  @override
  String get voiceJoinCallFailed =>
      'Não foi possível conectar a esta chamada. Verifique sua conexão e tente novamente.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Não foi possível ingressar nesta chamada. Verifique sua conexão e tente novamente.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Não foi possível atualizar esta chamada no servidor. Verifique sua conexão e tente novamente.';

  @override
  String get dmAddNote => 'Adicionar nota';

  @override
  String get dmEditGroup => 'Editar grupo';

  @override
  String get dmInviteToCommunity => 'Convidar para a comunidade';

  @override
  String get dmBlock => 'Bloquear';

  @override
  String get dmLeaveGroup => 'Sair do grupo';

  @override
  String get dmNoCommunitiesAvailable => 'Nenhuma comunidade disponível';

  @override
  String dmGroupMemberCount(int count) {
    return '$count membros';
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
  String get dmMuteFor3Days => 'Por 3 dias';

  @override
  String get dmMuteForever => 'Até eu reativar';

  @override
  String get dmPinGroupDm => 'Fixar DM de grupo';

  @override
  String get dmUnpinGroupDm => 'Desafixar conversa em grupo';

  @override
  String get dmUnnamedGroup => 'Grupo sem nome';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'Grupo de $resolvedName';
  }

  @override
  String get dmFavoriteDm => 'Favoritar conversa';

  @override
  String get dmUnfavoriteDm => 'Remover de favoritos';

  @override
  String get dmFavoriteGroupDm => 'Favoritar conversa em grupo';

  @override
  String get dmUnfavoriteGroupDm => 'Remover de favoritos conversa em grupo';

  @override
  String get dmChangeFriendNickname => 'Alterar apelido do amigo';

  @override
  String get dmRemoveFriend => 'Remover amigo';

  @override
  String get dmAddFriend => 'Adicionar amigo';

  @override
  String get dmAcceptFriendRequest => 'Aceitar solicitação de amizade';

  @override
  String get dmIgnoreFriendRequest => 'Ignorar solicitação de amizade';

  @override
  String get dmFriendRequestSent => 'Solicitação de amizade enviada';

  @override
  String get dmUnblock => 'Desbloquear';

  @override
  String get dmDebugUser => 'Depurar usuário';

  @override
  String get dmDebugChannel => 'Depurar canal';

  @override
  String get dmDebugCategory => 'Categoria de Depuração';

  @override
  String get dmPinned => 'Conversa fixada';

  @override
  String get dmUnpinned => 'Conversa desafixada';

  @override
  String get dmMuted => 'Conversa silenciada';

  @override
  String get dmUnmuted => 'Conversa dessilenciada';

  @override
  String get dmRemoveFriendConfirmTitle => 'Remover amigo';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Tem certeza de que deseja remover $username como amigo?';
  }

  @override
  String get dmBlockConfirmTitle => 'Bloquear usuário';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Tem certeza de que deseja bloquear $username? Ele não poderá enviar mensagens ou solicitações de amizade para você.';
  }

  @override
  String get dmFriendRequestSentToast => 'Solicitação de amizade enviada';

  @override
  String get dmFriendRequestFailed => 'Falha ao enviar solicitação de amizade';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Falha ao aceitar solicitação de amizade';

  @override
  String get dmRemoveFriendFailed => 'Falha ao remover amigo';

  @override
  String get dmBlockFailed => 'Falha ao bloquear usuário';

  @override
  String get dmUnblockFailed => 'Falha ao desbloquear usuário';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Falha ao ignorar solicitação de amizade';

  @override
  String get dmAddFriends => 'Adicionar amigos';

  @override
  String get addFriendSheetTitle => 'Adicionar amigo';

  @override
  String get addFriendUsernameHint => 'NomeDeUsuário#0000';

  @override
  String get addFriendUsernameLabel => 'Nome de usuário do amigo';

  @override
  String get addFriendSendRequest => 'Enviar solicitação';

  @override
  String get addFriendNoUserFound =>
      'Nenhum usuário encontrado com este nome de usuário.';

  @override
  String get addFriendInvalidUsername =>
      'Insira um nome de usuário válido (NomeDeUsuário#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Solicitação de amizade enviada';

  @override
  String get addFriendClaimTitle => 'Reivindique sua conta';

  @override
  String get addFriendClaimDescription =>
      'Reivindique sua conta para enviar solicitações de amizade.';

  @override
  String get addFriendVerifyTitle => 'Verifique seu e-mail';

  @override
  String get addFriendVerifyDescription =>
      'Você precisa verificar seu endereço de e-mail antes de poder enviar solicitações de amizade.';

  @override
  String get addFriendVerifyEmail => 'Verificar e-mail';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Solicitações de amizade recebidas ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Solicitações de amizade enviadas ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Solicitação de amizade recebida';

  @override
  String get addFriendOutgoingStatus => 'Solicitação de amizade enviada';

  @override
  String get addFriendViewProfile => 'Ver perfil';

  @override
  String get addFriendAccept => 'Aceitar';

  @override
  String get addFriendIgnore => 'Ignorar';

  @override
  String get addFriendAcceptTitle => 'Aceitar solicitação de amizade';

  @override
  String get addFriendIgnoreTitle => 'Ignorar solicitação de amizade';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Aceitar a solicitação de amizade de $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Ignorar a solicitação de amizade de $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Cancelar solicitação';

  @override
  String get addFriendCancelRequestFailed =>
      'Não foi possível cancelar a solicitação de amizade. Tente novamente.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Eles não estão aceitando solicitações de amizade no momento.';

  @override
  String get addFriendUnblockFirst =>
      'Desbloqueie-os primeiro para enviar uma solicitação de amizade.';

  @override
  String get addFriendCannotSendToSelf =>
      'Você não pode enviar uma solicitação de amizade para si mesmo.';

  @override
  String get addFriendAlreadyFriends => 'Vocês já são amigos.';

  @override
  String get addFriendClaimToSend =>
      'Termine de se inscrever para enviar solicitações de amizade.';

  @override
  String get addFriendVerifyToSend =>
      'Verifique seu e-mail antes de enviar pedidos de amizade.';

  @override
  String get addFriendFriendsListFull =>
      'Sua lista de amigos está cheia, ou a deles está. Remova alguém e tente novamente.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Sistema';

  @override
  String get emojiSearchPlaceholder => 'Encontre o emoji dos seus sonhos';

  @override
  String get emojiSearchEmpty => 'Nenhum emoji corresponde à sua pesquisa';

  @override
  String get emojiAutocompleteDefaultLabel => 'Emoji padrão';

  @override
  String emojiInfoDefaultDescription(String productName) {
    return 'Este é um emoji padrão no $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'Este emoji é desta comunidade. Você pode usá-lo em qualquer lugar.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'Este é um emoji personalizado de uma comunidade.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'Este é um emoji personalizado de uma comunidade. Peça ao autor um convite para usar este emoji.';

  @override
  String get emojiInfoFromHeader => 'Este emoji é de';

  @override
  String get emojiInfoDiscoverableCommunity => 'Comunidade detectável';

  @override
  String get emojiInfoPrivateCommunity => 'Comunidade privada';

  @override
  String get emojiInfoVerifiedCommunity => 'Comunidade verificada';

  @override
  String get emojiInfoAddToFavorites => 'Adicionar aos favoritos';

  @override
  String get emojiInfoRemoveFromFavorites => 'Remover dos Favoritos';

  @override
  String get emojiFrequentlyUsed => 'Usados com frequência';

  @override
  String get emojiTabGifs => 'GIFs';

  @override
  String get emojiTabMedia => 'Mídia';

  @override
  String get emojiTabStickers => 'Stickers';

  @override
  String get emojiTabEmojis => 'Emojis';

  @override
  String get gifPickerSearch => 'Pesquisar GIFs';

  @override
  String get gifPickerSearchKlipy => 'Pesquisar KLIPY';

  @override
  String get gifPickerSearchTenor => 'Pesquisar Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Favoritos';

  @override
  String get gifPickerFavoritesEmptyTitle => 'Nenhum GIF favorito ainda';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Marque um GIF para vê-lo aqui.';

  @override
  String get gifPickerTrending => 'GIFs em alta';

  @override
  String get gifPickerNoResultsTitle => 'Nenhum resultado de pesquisa';

  @override
  String get gifPickerNoResultsDescription => 'Tente outro termo de pesquisa';

  @override
  String get gifPickerLoadFailedTitle => 'Não foi possível carregar GIFs';

  @override
  String get gifPickerLoadFailedBody =>
      'Verifique sua conexão e tente novamente.';

  @override
  String get emojiCategoryPeople => 'Pessoas';

  @override
  String get emojiCategoryNature => 'Natureza';

  @override
  String get emojiCategoryFood => 'Comida e Bebida';

  @override
  String get emojiCategoryActivity => 'Atividades';

  @override
  String get emojiCategoryTravel => 'Viagem e Lugares';

  @override
  String get emojiCategoryObjects => 'Objetos';

  @override
  String get emojiCategorySymbols => 'Símbolos';

  @override
  String get emojiCategoryFlags => 'Bandeiras';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Desbloqueie $emojiCount de $communityCount com Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Obter Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Não mostrar novamente';

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
  String get externalLinkWarningTitle => 'Aviso de link externo';

  @override
  String externalLinkWarningLeaving(String productName) {
    return 'Você está prestes a sair do $productName';
  }

  @override
  String get externalLinkWarningDescription =>
      'Links externos podem ser perigosos. Por favor, tenha cuidado.';

  @override
  String get externalLinkWarningDestinationUrl => 'URL de destino:';

  @override
  String get externalLinksSectionTitle => 'Links Externos';

  @override
  String get externalLinksSectionDescription =>
      'Configure como os avisos de links externos são tratados.';

  @override
  String get externalLinkWarningTrustPrefix => 'Confiar sempre em ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — pular este aviso da próxima vez';

  @override
  String get externalLinkVisitSite => 'Visitar site';

  @override
  String get externalLinkTrustAllLabel => 'Confiar em todos os links externos';

  @override
  String get externalLinkStripTrackingLabel =>
      'Remover parâmetros de rastreamento de URLs';

  @override
  String get externalLinkStripTrackingDescription =>
      'Remova automaticamente parâmetros de rastreamento (como utm_source, fbclid, gclid) de URLs em mensagens que você envia. Limpa o link antes que ele chegue a qualquer outra pessoa.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Confiar em todos os links externos?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Isso confiará em todos os links externos e pulará o aviso para todos os domínios. Seus domínios confiáveis existentes serão substituídos. Isso é menos seguro.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Confiar em Todos';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Parar de confiar em todos os links?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Avisos de links externos serão exibidos novamente. Você precisará adicionar domínios confiáveis individualmente.';

  @override
  String get externalLinkStopTrustingAllAction => 'Desativar Confiança Total';

  @override
  String get externalLinkTrustedAllDescription =>
      'Todos os links externos são confiáveis. Avisos não serão exibidos.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Você tem $count domínio(s) confiável(is). Adicione mais marcando a caixa ao visitar links externos.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Quando ativado, nenhum aviso de link externo será exibido. Isso é menos seguro.';

  @override
  String get imageFileTooLarge =>
      'O arquivo de imagem é muito grande. Por favor, escolha um arquivo menor que 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Avatares animados exigem Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Banners animados exigem Plutonium';

  @override
  String get animatedAvifNotSupported => 'AVIF animado não suportado';

  @override
  String get animatedAvifNotSupportedBody =>
      'Cortar e girar arquivos AVIF animados ainda não é suportado. Se você prosseguir, ele será carregado em sua forma original.';

  @override
  String get uploadAsIs => 'Carregar como está';

  @override
  String get croppingAnimatedNotSupported =>
      'Cortar imagens animadas ainda não é suportado. O upload original será usado.';

  @override
  String get cropAvatar => 'Cortar Avatar';

  @override
  String get cropBanner => 'Cortar Banner';

  @override
  String get skip => 'Pular';

  @override
  String get crop => 'Cortar';

  @override
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => 'Alterar sua Nome de usuário';

  @override
  String get fluxerTagInputLabel => 'Nome de usuário';

  @override
  String get fluxerTagDescriptionBase =>
      'Nomes de usuário só podem conter letras (a-z, A-Z), números (0-9) e underscores. Nomes de usuário não diferenciam maiúsculas de minúsculas.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Nomes de usuário só podem conter letras (a-z, A-Z), números (0-9) e underscores. Nomes de usuário não diferenciam maiúsculas de minúsculas. Você pode escolher qualquer tag de 4 dígitos disponível de #0000 a #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Nomes de usuário só podem conter letras (a-z, A-Z), números (0-9) e underscores. Nomes de usuário não diferenciam maiúsculas de minúsculas. Você pode escolher qualquer tag de 4 dígitos disponível de #0001 a #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Entre $min e $max caracteres';
  }

  @override
  String get validationAllowedChars =>
      'Apenas letras (a-z, A-Z), números (0-9) e underscores (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Obtenha Plutonium para personalizar sua tag ou mantê-la ao alterar seu nome de usuário';

  @override
  String get fluxerTagAlreadyTaken => 'Nome de usuário já em uso';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'A Nome de usuário $username#$discriminator já está em uso. Continuar irá gerar automaticamente um novo discriminador.';
  }

  @override
  String get customTagIsTemporary => 'Tag personalizada é temporária';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Sua tag personalizada de 4 dígitos só estará disponível enquanto sua assinatura Plutonium estiver ativa. Quando sua assinatura expirar em $date, sua tag voltará a ser um número atribuído aleatoriamente após um período de carência de 3 dias.';
  }

  @override
  String get customTagTemporaryBody =>
      'Sua tag personalizada de 4 dígitos só estará disponível enquanto sua assinatura Plutonium estiver ativa. Quando sua assinatura expirar, sua tag voltará a ser um número atribuído aleatoriamente após um período de carência de 3 dias.';

  @override
  String get iUnderstandContinue => 'Entendi, Continuar';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Se você salvar esta Nome de usuário, sua tag personalizada de 4 dígitos voltará a ser um número aleatório quando sua assinatura Plutonium terminar. Se sua assinatura não for renovada, você terá um período de carência de 3 dias antes que a tag mude.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Sua tag personalizada de 4 dígitos (#$discriminator) está ativa enquanto sua assinatura Plutonium estiver ativa. Se sua assinatura terminar ou não for renovada após um período de carência de 3 dias, sua tag voltará a ser um número aleatório.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Personalize sua tag de 4 dígitos ou mantenha-a ao alterar seu nome de usuário';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Seu teste Plutonium expira em $date. Faça upgrade para manter sua tag personalizada e ganhar um distintivo em seu perfil.';
  }

  @override
  String get premiumTrialActive =>
      'Você está em um teste Plutonium. Faça upgrade para manter sua tag personalizada e ganhar um distintivo em seu perfil.';

  @override
  String get fluxerTagUpdated => 'Nome de usuário atualizada';

  @override
  String get fluxerTagUpdateFailed =>
      'Falha ao atualizar Nome de usuário. Por favor, tente novamente.';

  @override
  String get continueAction => 'Continuar';

  @override
  String get profileCustomizationTitle => 'Personalização do Perfil';

  @override
  String get profileCustomizationDescription =>
      'Edite a aparência do seu perfil e veja uma prévia ao vivo';

  @override
  String get usernameLabel => 'Nome de usuário';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Reivindique sua conta para alterar sua Nome de usuário';

  @override
  String get changeFluxerTag => 'Alterar Nome de usuário';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Personalize sua tag de 4 dígitos (#$discriminator) como quiser com Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Altere seu nome de usuário e tag de 4 dígitos';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Sua tag personalizada (#$discriminator) está vinculada à sua assinatura Plutonium e voltará a ser uma tag aleatória se expirar.';
  }

  @override
  String get displayNameLabel => 'Nome de Exibição';

  @override
  String get pronounsLabel => 'Pronomes';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Alterar Avatar';

  @override
  String get removeAvatar => 'Remover Avatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Máx. 10MB. Recomendado: 512×512px';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get changeBanner => 'Alterar Banner';

  @override
  String get removeBanner => 'Remover Banner';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Máx. 10MB. Mínimo: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Cor de Destaque';

  @override
  String get accentColorDescription =>
      'Personaliza a cor da borda e do banner do seu perfil';

  @override
  String get aboutMeLabel => 'Sobre Mim';

  @override
  String get aboutMeHelperText => 'Você pode usar links, emojis e Markdown.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle => 'Privacidade do Selo Plutonium';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Controle como seu selo Plutonium é exibido para outras pessoas';

  @override
  String get hidePlutoniumBadgeLabel => 'Ocultar selo Plutonium completamente';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Oculte completamente seu selo Plutonium de outros usuários';

  @override
  String get hidePlutoniumPurchaseDate => 'Ocultar data de compra do Plutonium';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Ocultar data de compra do Plutonium ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Remova a data em que você comprou o Plutonium pela primeira vez do seu selo';

  @override
  String get maskVisionaryAsSubscription =>
      'Mascarar Visionary como assinatura';

  @override
  String get maskVisionaryDescription =>
      'Mostre seu Visionary como uma assinatura regular em vez disso';

  @override
  String get hideVisionaryIdBadge => 'Ocultar selo de ID Visionary';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Ocultar selo de ID Visionary (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Remova seu selo de ID Visionary';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Você está em um teste Plutonium — sua assinatura começa em $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Sua assinatura começará automaticamente quando seu teste terminar. Nenhuma ação é necessária.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Você está em um teste Plutonium que expira em $date';
  }

  @override
  String get premiumTrialActiveProfile => 'Você está em um teste Plutonium';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Máx. 10MB. Recomendado: 512×512px. Avatares animados (GIF) exigem Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Personalize seu perfil com uma imagem de banner estática ou animada para destacá-lo.';

  @override
  String get getPlutonium => 'Obter Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Compras no aplicativo ainda não estão disponíveis nesta plataforma. Fique ligado — em breve!';

  @override
  String get profilePreviewLabel => 'Prévia';

  @override
  String get profilePreviewMessage => 'Mensagem';

  @override
  String profilePreviewMemberSince(String productName) {
    return 'Membro $productName Desde';
  }

  @override
  String get unclaimedAccountTitle => 'Conta Não Reivindicada';

  @override
  String get unclaimedAccountDescription =>
      'Sua conta ainda não foi reivindicada. Sem um e-mail e senha, você pode perder o acesso. Reivindique sua conta agora para protegê-la.';

  @override
  String get claimAccount => 'Reivindicar Conta';

  @override
  String get profileTypeLabel => 'Tipo de Perfil';

  @override
  String get profileTypeGlobal => 'Perfil Global';

  @override
  String get profileTypeGuildDescription =>
      'Você está editando seu perfil por comunidade. Este perfil só será visível nesta comunidade e substituirá seu perfil global.';

  @override
  String get communityNicknameLabel => 'Apelido da Comunidade';

  @override
  String get perGuildPremiumUpsellText =>
      'Personalizar seu avatar, banner, cor de destaque e biografia para comunidades individuais requer Plutonium. Apelido e pronomes da comunidade são gratuitos para todos.';

  @override
  String get avatarModeInherit => 'Usar Perfil Global';

  @override
  String get avatarModeCustom => 'Usar Imagem Personalizada';

  @override
  String get avatarModeUnset => 'Não Mostrar';

  @override
  String get profileSavedToast => 'Perfil atualizado';

  @override
  String get profileEditButton => 'Editar Perfil';

  @override
  String get profileNoteLabel => 'Nota';

  @override
  String get profileNoteVisibility => '(visível apenas para você)';

  @override
  String get profileNoteEmpty => 'Nenhuma nota ainda.';

  @override
  String get sudoTitle => 'Verifique Sua Identidade';

  @override
  String get sudoDescription => 'Esta ação requer verificação para continuar.';

  @override
  String get sudoAuthenticatorCode => 'Código do Autenticador';

  @override
  String get sudoMethodPassword => 'Senha';

  @override
  String get sudoMethodTotp => 'Autenticador';

  @override
  String get sudoVerificationFailed => 'Falha na verificação. Tente novamente.';

  @override
  String get securityAccountTitle => 'Conta';

  @override
  String get securityAccountDescription =>
      'Gerencie seu e-mail, senha e configurações da conta';

  @override
  String get securitySectionTitle => 'Segurança';

  @override
  String get securitySectionDescription =>
      'Proteja sua conta com autenticação de dois fatores e passkeys';

  @override
  String get securityLoginEmailSectionTitle => 'Configurações de E-mail';

  @override
  String securityLoginEmailSectionDescription(String productName) {
    return 'Gerencie o endereço de e-mail que você usa para fazer login no $productName';
  }

  @override
  String get securityLoginEmailAddressLabel => 'Endereço de E-mail';

  @override
  String get securityLoginNoEmailSet => 'Nenhum endereço de e-mail definido';

  @override
  String get securityLoginChangeEmail => 'Alterar E-mail';

  @override
  String get securityLoginAddEmail => 'Adicionar E-mail';

  @override
  String get securityLoginReveal => 'Revelar';

  @override
  String get securityLoginHide => 'Ocultar';

  @override
  String get securityLoginPasswordSectionTitle => 'Senha';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Altere sua senha para manter sua conta segura';

  @override
  String get securityLoginCurrentPasswordLabel => 'Senha Atual';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Última alteração: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Última alteração: Nunca';

  @override
  String get securityLoginNoPasswordSet => 'Nenhuma senha definida';

  @override
  String get securityLoginChangePassword => 'Alterar Senha';

  @override
  String get securityLoginSetPassword => 'Definir Senha';

  @override
  String get passwordChangeTitle => 'Alterar Senha';

  @override
  String get passwordChangeIntroDescription =>
      'Enviaremos um código de verificação para seu endereço de e-mail para confirmar sua identidade antes de alterar sua senha.';

  @override
  String get passwordChangeStart => 'Começar';

  @override
  String get passwordChangeVerifyTitle => 'Verifique Seu E-mail';

  @override
  String get passwordChangeVerifyDescription =>
      'Digite o código de verificação enviado para seu endereço de e-mail.';

  @override
  String get passwordChangeVerificationCode => 'Código de Verificação';

  @override
  String get passwordChangeVerify => 'Verificar';

  @override
  String get passwordChangeNewPasswordTitle => 'Definir Nova Senha';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Digite sua nova senha abaixo.';

  @override
  String get passwordChangeNewPassword => 'Nova Senha';

  @override
  String get passwordChangeConfirmPassword => 'Confirmar Nova Senha';

  @override
  String get passwordChangeSubmit => 'Alterar Senha';

  @override
  String get passwordChangeSuccess => 'Senha alterada';

  @override
  String get passwordChangePasswordsDoNotMatch => 'As senhas não coincidem';

  @override
  String get passwordChangeInvalidCode => 'Código inválido ou expirado';

  @override
  String get emailChangeTitle => 'Alterar e-mail';

  @override
  String get emailChangeIntroDescription =>
      'Enviaremos códigos de verificação para confirmar sua identidade antes de alterar seu endereço de e-mail.';

  @override
  String get emailChangeStart => 'Começar';

  @override
  String get emailChangeVerifyOriginalTitle => 'Verificar e-mail atual';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Digite o código de verificação enviado para seu endereço de e-mail atual.';

  @override
  String get emailChangeNewEmailTitle => 'Inserir novo e-mail';

  @override
  String get emailChangeNewEmailDescription =>
      'Digite o novo endereço de e-mail que você deseja usar.';

  @override
  String get emailChangeNewEmailLabel => 'Novo e-mail';

  @override
  String get emailChangeNewEmailSubmit => 'Enviar código de verificação';

  @override
  String get emailChangeVerifyNewTitle => 'Verificar novo e-mail';

  @override
  String get emailChangeVerifyNewDescription =>
      'Digite o código de verificação enviado para seu novo endereço de e-mail.';

  @override
  String get emailChangeSuccess => 'E-mail alterado';

  @override
  String get emailChangeInvalidCode => 'Código inválido ou expirado';

  @override
  String get resend => 'Reenviar';

  @override
  String resendCountdown(int seconds) {
    return 'Reenviar (${seconds}s)';
  }

  @override
  String get verificationCode => 'Código de verificação';

  @override
  String get verify => 'Verificar';

  @override
  String get enable => 'Ativar';

  @override
  String get disable => 'Desativar';

  @override
  String get delete => 'Excluir';

  @override
  String get save => 'Salvar';

  @override
  String get securityTfaSectionTitle => 'Autenticação de dois fatores';

  @override
  String get securityTfaSectionDescription =>
      'Adicione uma camada extra de segurança à sua conta';

  @override
  String get securityTfaAuthenticatorApp => 'App autenticador';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Autenticação de dois fatores está ativada';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Use um app autenticador para gerar códigos para autenticação de dois fatores';

  @override
  String get securityTfaBackupCodes => 'Códigos de backup';

  @override
  String get securityTfaBackupCodesDescription =>
      'Visualize e gerencie seus códigos de backup para recuperação de conta';

  @override
  String get securityTfaViewCodes => 'Ver códigos';

  @override
  String get securityPasskeysSectionTitle => 'Chaves de acesso';

  @override
  String get securityPasskeysSectionDescription =>
      'Use chaves de acesso para login sem senha e autenticação de dois fatores';

  @override
  String get securityPasskeysRegistered => 'Chaves de acesso registradas';

  @override
  String get securityPasskeysNone => 'Nenhuma chave de acesso registrada';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'chaves de acesso',
      one: 'chave de acesso',
    );
    return '$count $_temp0 registradas (máx. 10)';
  }

  @override
  String get securityPasskeysAdd => 'Adicionar chave de acesso';

  @override
  String securityPasskeysAdded(String date) {
    return 'Adicionada em: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Último uso: $date';
  }

  @override
  String get securityPasskeysRename => 'Renomear';

  @override
  String get securityPasskeysDeleteTitle => 'Excluir chave de acesso';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Tem certeza de que deseja excluir a chave de acesso \"$name\"?';
  }

  @override
  String get securityPasskeyNameTitle => 'Nomear chave de acesso';

  @override
  String get securityPasskeyNameLabel => 'Nome da chave de acesso';

  @override
  String get securityPasskeyNameHint =>
      'Ex: YubiKey, iPhone, Computador do trabalho';

  @override
  String get securityPhoneSectionTitle => 'Número de telefone';

  @override
  String get securityPhoneSectionDescription =>
      'Gerencie seu número de telefone.';

  @override
  String get securityPhoneLabel => 'Número de telefone';

  @override
  String get securityPhoneNone => 'Nenhum número de telefone adicionado.';

  @override
  String get securityPhoneAdd => 'Adicionar telefone';

  @override
  String get securityPhoneRemove => 'Remover';

  @override
  String get securityPhoneRemoveTitle => 'Remover número de telefone';

  @override
  String get securityPhoneRemoveDescription =>
      'Tem certeza de que deseja remover seu número de telefone?';

  @override
  String get securityPhoneRemoved => 'Número de telefone removido';

  @override
  String get securityClaimTitle => 'Recursos de Segurança';

  @override
  String get securityClaimDescription =>
      'Reivindique sua conta para acessar recursos de segurança como autenticação de dois fatores e chaves de acesso.';

  @override
  String get securityVerifyEmailRequired =>
      'Você precisa verificar seu endereço de e-mail antes de configurar a autenticação de dois fatores, chaves de acesso ou verificação por SMS.';

  @override
  String get totpEnableTitle => 'Configurar App Autenticador';

  @override
  String get totpEnableDescription =>
      'Escaneie o código QR com seu aplicativo autenticador para gerar códigos para autenticação de dois fatores.';

  @override
  String get totpEnableCodeLabel => 'Código';

  @override
  String get totpEnableCodeHint =>
      'Digite o código de 6 dígitos do seu aplicativo autenticador';

  @override
  String get totpEnableSuccess => 'Autenticação de dois fatores ativada';

  @override
  String get totpDisableTitle => 'Remover App Autenticador';

  @override
  String get totpDisableDescription =>
      'Digite o código de 6 dígitos do seu aplicativo autenticador para desativar a autenticação de dois fatores.';

  @override
  String get totpDisableSuccess => 'Autenticação de dois fatores desativada';

  @override
  String get backupCodesTitle => 'Códigos de Backup';

  @override
  String get backupCodesWarning =>
      'Se você perder o acesso ao seu aplicativo autenticador e não tiver esses códigos, ficará permanentemente bloqueado fora da sua conta. Baixe ou copie-os agora e guarde-os em um local seguro.';

  @override
  String get backupCodesDownload => 'Baixar';

  @override
  String get backupCodesCopy => 'Copiar';

  @override
  String get backupCodesCopied =>
      'Códigos de backup copiados para a área de transferência';

  @override
  String get backupCodesAcknowledge =>
      'Eu baixei ou copiei meus códigos de backup e os guardei em um local seguro.';

  @override
  String get backupCodesDone => 'Concluído';

  @override
  String get backupCodesViewTitle => 'Ver Códigos de Backup';

  @override
  String get backupCodesViewDescription =>
      'A verificação pode ser necessária antes de visualizar seus códigos de backup.';

  @override
  String get phoneAddTitle => 'Adicionar Número de Telefone';

  @override
  String get phoneAddLabel => 'Número de Telefone';

  @override
  String get phoneAddHint => 'Digite seu número de telefone';

  @override
  String get phoneAddFooter =>
      'Enviaremos um código por SMS quando disponível. Seu número não será vinculado à sua conta. Mantemos apenas um marcador criptografado, sem ID de usuário, para permitir no máximo 2 verificações em cerca de 30 dias.';

  @override
  String get phoneAddSendCode => 'Enviar Código';

  @override
  String get phoneVerifyTitle => 'Verificar Número de Telefone';

  @override
  String get phoneVerifyDescription =>
      'Digite o código de verificação enviado para o seu número de telefone.';

  @override
  String get phoneAddSuccess => 'Número de telefone verificado';

  @override
  String get phoneCountryLabel => 'País';

  @override
  String get phoneSearchCountries => 'Pesquisar países...';

  @override
  String get phoneNumberRequired => 'Número de telefone é obrigatório';

  @override
  String get phoneEnterValidNumber => 'Insira um número de celular válido.';

  @override
  String get phoneCannotBeUsed =>
      'Este número de telefone não pode ser usado. Tente outro número de celular ou entre em contato com o suporte.';

  @override
  String get phoneAlreadyUsed =>
      'Este número de telefone já foi usado. Tente outro número ou entre em contato com o suporte.';

  @override
  String get phoneCodeDidNotWork =>
      'Esse código não funcionou. Verifique e tente novamente.';

  @override
  String get phoneTooManyAttempts =>
      'Muitas tentativas. Espere um pouco e tente novamente.';

  @override
  String get phoneSmsUnavailable =>
      'A verificação por SMS está indisponível no momento. Tente novamente mais tarde ou entre em contato com o suporte.';

  @override
  String get phoneNotEligible =>
      'A verificação por telefone não está disponível para esta conta. Use outro método ou entre em contato com o suporte.';

  @override
  String get phoneCaptchaRequired =>
      'É necessária uma verificação no navegador antes da verificação por telefone. Tente novamente na página de login ou entre em contato com o suporte.';

  @override
  String get phoneSomethingWentWrong => 'Algo deu errado. Tente novamente.';

  @override
  String get phoneInboundExpensiveDescription =>
      'Enviar um SMS para este número de telefone é muito caro, então precisamos que você nos envie um SMS. Você também pode entrar em contato com o suporte para que possamos remover essa exigência da sua conta.';

  @override
  String get phoneInboundDefaultDescription =>
      'Precisamos que você nos envie um SMS para verificar seu número de telefone.';

  @override
  String get phoneInboundStepOpenMessaging =>
      'Abra o app de mensagens do seu celular e crie uma nova mensagem de texto.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'Envie o código $code para $number.';
  }

  @override
  String get phoneInboundStepWait =>
      'Aguarde o recebimento da sua mensagem. Isso pode levar um minuto.';

  @override
  String get phoneInboundGetNewCode => 'Obter novo código';

  @override
  String get phoneInboundChallengeCodeLabel => 'Código para enviar';

  @override
  String get phoneInboundOurNumberLabel => 'Enviar para';

  @override
  String get requiredActionTitle => 'Verificação de conta necessária';

  @override
  String requiredActionIntroGeneric(String productName) {
    return 'Conclua a verificação necessária para continuar usando o $productName.';
  }

  @override
  String get requiredActionIntroPhone =>
      'Seu cadastro precisa de uma verificação antispam extra antes de você continuar.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return 'Verifique seu e-mail ou telefone para continuar usando o $productName.';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return 'Conclua as etapas de verificação de e-mail e telefone abaixo para continuar usando o $productName.';
  }

  @override
  String get requiredActionChooseMethodTitle =>
      'Escolha um método de verificação';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return 'Conclua um dos caminhos de verificação abaixo para continuar usando o $productName.';
  }

  @override
  String get requiredActionUseEmail => 'Usar e-mail';

  @override
  String get requiredActionUsePhone => 'Usar telefone';

  @override
  String get requiredActionCheckEmailTitle => 'Verifique seu e-mail';

  @override
  String get requiredActionCheckEmailDescription =>
      'Enviamos um link de verificação para o seu e-mail. Abra-o para continuar.';

  @override
  String get requiredActionResendVerificationEmail =>
      'Reenviar e-mail de verificação';

  @override
  String get requiredActionVerificationEmailSent =>
      'E-mail de verificação enviado. Verifique sua caixa de entrada.';

  @override
  String get requiredActionSignOut => 'Sair';

  @override
  String get dangerZoneSectionTitle => 'Zona de Perigo';

  @override
  String get dangerZoneSectionDescription =>
      'Ações irreversíveis e destrutivas';

  @override
  String get dangerZoneDisableTitle => 'Desativar Conta';

  @override
  String get dangerZoneDisableDescription =>
      'Desative sua conta temporariamente. Você pode reativá-la mais tarde fazendo login novamente.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Desativar sua conta fará logout de todas as sessões. Você pode reativar sua conta a qualquer momento fazendo login novamente.';

  @override
  String get dangerZoneDeleteTitle => 'Excluir Conta';

  @override
  String get dangerZoneDeleteDescription =>
      'Exclua permanentemente sua conta e todos os dados associados. Esta ação não pode ser desfeita.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Cancele sua assinatura ativa do Plutonium nas configurações do Plutonium antes de excluir sua conta.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount =>
      'Não é possível excluir a conta';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Você não pode excluir sua conta enquanto for proprietário de comunidades. Transfira a propriedade das seguintes comunidades primeiro:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'e mais $count';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Para transferir a propriedade, acesse $settingsPath e use a opção de transferir propriedade.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Tem certeza de que deseja excluir sua conta? Esta ação agendará sua conta para exclusão permanente.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Você pode cancelar o processo de exclusão em até 14 dias';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Após 14 dias, sua conta será permanentemente excluída';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Após o processamento da exclusão, você não poderá recuperar o acesso à sua conta';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Você não poderá excluir suas mensagens enviadas após a exclusão da sua conta';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Se você deseja exportar seus dados ou excluir suas mensagens primeiro, visite a seção Painel de Privacidade em Configurações do Usuário antes de prosseguir.';

  @override
  String get claimAccountTitle => 'Reivindicar Sua Conta';

  @override
  String get claimAccountDescription =>
      'Reivindique sua conta adicionando um e-mail e senha. Enviaremos um código de verificação para confirmar seu e-mail antes de finalizar.';

  @override
  String get claimAccountEmailLabel => 'E-mail';

  @override
  String get claimAccountPasswordLabel => 'Senha';

  @override
  String get claimAccountSendCode => 'Enviar código';

  @override
  String get claimAccountVerifyDescription =>
      'Digite o código que enviamos para o seu e-mail para verificá-lo. Sua senha será definida assim que o código for confirmado.';

  @override
  String get claimAccountSuccess => 'Conta reivindicada com sucesso';

  @override
  String get importantInformation => 'Informações importantes:';

  @override
  String get genericError => 'Ocorreu um erro';

  @override
  String get networkErrorMessage => 'Algo deu errado. Tente novamente.';

  @override
  String get invalidCode => 'Código inválido';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'há $count anos',
      one: 'há 1 ano',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'há $count meses',
      one: 'há 1 mês',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'há $count dias',
      one: 'há 1 dia',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'há $count horas',
      one: 'há 1 hora',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'há $count minutos',
      one: 'há 1 minuto',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'há $count semanas',
      one: 'há 1 semana',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'em $count minutos',
      one: 'em 1 minuto',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'em $count horas',
      one: 'em 1 hora',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'em $count dias',
      one: 'em 1 dia',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'em $count semanas',
      one: 'em 1 semana',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'em $count meses',
      one: 'em 1 mês',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'em $count anos',
      one: 'em 1 ano',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'agora mesmo';

  @override
  String get authorizedAppsTitle => 'Aplicativos Autorizados';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Estes aplicativos receberam acesso à sua conta $productName.';
  }

  @override
  String get authorizedAppsEmptyTitle => 'Nenhum Aplicativo Autorizado';

  @override
  String get authorizedAppsEmptyDescription =>
      'Você ainda não autorizou nenhum aplicativo a acessar sua conta.';

  @override
  String get authorizedAppsLoadError =>
      'Falha ao Carregar Aplicativos Autorizados';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Autorizado em $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Permissões concedidas';

  @override
  String get authorizedAppsRevoke => 'Revogar';

  @override
  String get authorizedAppsRevokeTitle => 'Revogar acesso do aplicativo';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Tem certeza de que deseja revogar o acesso de $appName? Este aplicativo não terá mais acesso à sua conta.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Acessar minhas informações básicas de perfil (nome de usuário, avatar, etc.)';

  @override
  String get authorizedAppsScopeEmail => 'Ver meu endereço de e-mail';

  @override
  String get authorizedAppsScopeGuilds =>
      'Ver as comunidades das quais sou membro';

  @override
  String get authorizedAppsScopeConnections => 'Ver minhas contas conectadas';

  @override
  String get authorizedAppsScopeBot =>
      'Adicionar um bot a uma comunidade com as permissões solicitadas';

  @override
  String get authorizedAppsScopeAdmin => 'Acessar endpoints administrativos';

  @override
  String get privacyPendingDeletionTitle => 'Pendente de Exclusão';

  @override
  String get blockedUsersTitle => 'Usuários Bloqueados';

  @override
  String get blockedUsersDescription =>
      'Usuários bloqueados não podem enviar solicitações de amizade ou mensagens diretas para você.';

  @override
  String get blockedUsersEmptyTitle => 'Nenhum Usuário Bloqueado';

  @override
  String get blockedUsersEmptyDescription => 'Você ainda não bloqueou ninguém.';

  @override
  String get blockedUsersLoadError => 'Falha ao Carregar Usuários Bloqueados';

  @override
  String get blockedUsersUnblock => 'Desbloquear';

  @override
  String get blockedUsersUnblockTitle => 'Desbloquear Usuário';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Tem certeza de que deseja desbloquear $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Copiar Nome de usuário';

  @override
  String get blockedUsersCopyId => 'Copiar ID do Usuário';

  @override
  String get userProfileLoadError => 'Não foi possível carregar o perfil';

  @override
  String get userProfileLoading => 'Carregando perfil';

  @override
  String get userProfileRetry => 'Tentar novamente';

  @override
  String get userProfileMessage => 'Mensagem';

  @override
  String get userProfileVoiceCall => 'Chamada de Voz';

  @override
  String get userProfileVideoCall => 'Chamada de Vídeo';

  @override
  String get userProfileEditProfile => 'Editar Perfil';

  @override
  String userProfileStaffBadgeTooltip(String productName) {
    return 'Equipe $productName';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return 'Equipe da Comunidade $productName';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return 'Parceiro $productName';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return 'Caçador de Bugs do $productName';
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
    return 'Assinante Plutonium do $productName desde $date';
  }

  @override
  String userProfileVisionaryBadgeTooltip(String productName) {
    return 'Visionário do $productName';
  }

  @override
  String userProfileVisionaryBadgeSinceTooltip(
    String productName,
    String date,
  ) {
    return 'Visionário do $productName desde $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'ID Visionário #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Amigos em Comum ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Comunidades em Comum ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Amigos em Comum';

  @override
  String get userProfileMutualCommunitiesTitle => 'Comunidades em Comum';

  @override
  String get userProfileNoMutualFriends => 'Nenhum amigo em comum encontrado.';

  @override
  String get userProfileNoMutualCommunities =>
      'Nenhuma comunidade em comum encontrada.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Apelido: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Abrir DM';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Você bloqueou $username. Você não poderá enviar mensagens a menos que o desbloqueie.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Desbloquear';

  @override
  String get userProfileOpenDm => 'Abrir DM';

  @override
  String get userProfileNoteTitle => 'Nota';

  @override
  String get userProfileNoteVisibility => '(visível apenas para você)';

  @override
  String get userProfileNoteSave => 'Salvar';

  @override
  String get userProfileNoteDelete => 'Excluir';

  @override
  String get userProfileNoteEmpty => 'Clique para adicionar uma nota';

  @override
  String get userProfileMemberSince => 'Membro desde';

  @override
  String get userProfileAboutMe => 'Sobre Mim';

  @override
  String get userProfileRoles => 'Funções';

  @override
  String get memberRoleAdd => 'Adicionar função';

  @override
  String memberRoleRemove(String roleName) {
    return 'Remover cargo $roleName';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'Este usuário não tem cargos nesta comunidade.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'Nenhum cargo ainda. Adicione cargos em $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'Nenhum cargo disponível';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'No momento, não há cargos para atribuir nesta comunidade, mas você pode criar um novo cargo em $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Configurações da comunidade';

  @override
  String get guildSettingsRolesTab => 'Funções';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Horário local';

  @override
  String get userProfileSameTimeAsYou => 'Mesmo fuso horário de você';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return '$duration à sua frente';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return '$duration atrás de você';
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
  String get userProfileCopyUsername => 'Copiar nome de usuário';

  @override
  String get userProfileCopyUserId => 'Copiar ID do usuário';

  @override
  String get userProfileViewMainProfile => 'Ver Perfil Principal';

  @override
  String get userProfileViewCommunityProfile => 'Ver Perfil da Comunidade';

  @override
  String get userProfileBlockUser => 'Bloquear usuário';

  @override
  String get userProfileUnblockUser => 'Desbloquear usuário';

  @override
  String get userProfileRemoveFriend => 'Remover amigo';

  @override
  String get userProfileBlockConfirmTitle => 'Bloquear usuário';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Tem certeza de que deseja bloquear $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Desbloquear usuário';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Tem certeza de que deseja desbloquear $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Remover amigo';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Tem certeza de que deseja remover $username como amigo?';
  }

  @override
  String get userProfileFailedOpenDm => 'Falha ao abrir DM';

  @override
  String get userProfileFailedSaveNote => 'Falha ao salvar nota';

  @override
  String get userProfileActionFailed =>
      'Ação falhou, por favor, tente novamente';

  @override
  String get userProfileChangeNickname => 'Alterar apelido';

  @override
  String get userProfileKick => 'Expulsar';

  @override
  String get userProfileBan => 'Banir';

  @override
  String get userProfileTimeout => 'Silenciar';

  @override
  String get userProfileRemoveTimeout => 'Remover silenciamento';

  @override
  String get userProfileTransferOwnership => 'Transferir propriedade';

  @override
  String get userProfileReportUser => 'Denunciar usuário';

  @override
  String get userProfileReportMessage => 'Denunciar mensagem';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Expulsar $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Tem certeza de que deseja expulsar $username? Ele(a) poderá retornar com um novo convite.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Remover o silenciamento?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Remover o silenciamento permitirá que $username envie mensagens, reaja e participe de canais de voz novamente.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Transferir propriedade?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Transferir a propriedade desta comunidade para $username? Isso é irreversível e você perderá todos os privilégios de proprietário.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Banir $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Duração do banimento';

  @override
  String get userProfileBanCustomSecondsLabel =>
      'Duração personalizada (segundos)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Qualquer valor de $min a $max segundos';
  }

  @override
  String get userProfileBanDeleteHistoryLabel =>
      'Excluir histórico de mensagens';

  @override
  String get userProfileBanDeleteNone => 'Não excluir nenhuma';

  @override
  String get userProfileBanDelete24h => 'Últimas 24 horas';

  @override
  String get userProfileBanDelete7d => 'Últimos 7 dias';

  @override
  String get userProfileBanReasonLabel => 'Motivo (opcional)';

  @override
  String get userProfileBanReasonHint => 'Digite um motivo para o banimento';

  @override
  String get userProfileBanSubmit => 'Banir membro';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Silenciar $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Duração do silenciamento';

  @override
  String get userProfileTimeoutSubmit => 'Silenciar membro';

  @override
  String get userProfileNicknameLabel => 'Apelido';

  @override
  String get userProfileNicknameHint => 'Digite um apelido';

  @override
  String get userProfileNicknameSave => 'Salvar';

  @override
  String userProfileKickSuccess(String username) {
    return '$username foi expulso';
  }

  @override
  String userProfileBanSuccess(String username) {
    return '$username foi banido';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return '$username foi silenciado';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Silenciamento removido para $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Apelido atualizado';

  @override
  String get userProfileTransferSuccess => 'Propriedade transferida';

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
  String get duration1Day => '1 dia';

  @override
  String get duration3Days => '3 dias';

  @override
  String get duration5Days => '5 dias';

  @override
  String get duration1Week => '1 semana';

  @override
  String get duration2Weeks => '2 semanas';

  @override
  String get duration1Month => '1 mês';

  @override
  String get durationCustom => 'Personalizado…';

  @override
  String get iarReportUserTitle => 'Denunciar usuário';

  @override
  String get iarReportGuildTitle => 'Denunciar comunidade';

  @override
  String get iarReportGuildPreconfirmBody =>
      'Se esta denúncia é sobre uma mensagem específica nesta comunidade, denuncie essa mensagem. Denúncias de mensagens dão à nossa equipe de segurança o contexto mais claro, e adicionar detalhes nos comentários pode nos ajudar a analisar mais rapidamente. Só continue denunciando a comunidade como um todo se denunciar uma mensagem não abranger o problema maior.';

  @override
  String get iarContinueToReportCommunity =>
      'Continuar a denunciar a comunidade';

  @override
  String get iarPreviewCommunitySubtitle => 'Comunidade';

  @override
  String get iarReasonHarassmentGuildLabel => 'Assédio ou abuso direcionado';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'A comunidade facilita ataques em massa ou abuso direcionado.';

  @override
  String get iarReasonHateGuildDescription =>
      'Promove ódio contra grupos protegidos.';

  @override
  String get iarReasonTerrorismLabel => 'Terrorismo ou extremismo violento';

  @override
  String get iarReasonTerrorismDescription =>
      'Promove, recruta ou coordena atividades extremistas violentas.';

  @override
  String get iarReasonMatureContentGuildLabel =>
      'Conteúdo adulto ou bloqueio de segurança';

  @override
  String get iarReasonMatureContentGuildDescription =>
      'Conteúdo adulto sem a devida restrição de acesso.';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      'Coloca menores em perigo ou hospeda conteúdo de exploração infantil.';

  @override
  String get iarReasonRaidLabel => 'Coordenação de raid';

  @override
  String get iarReasonRaidDescription =>
      'Coordena ataques, brigading ou assédio contra pessoas ou comunidades.';

  @override
  String get iarReasonSpamGuildDescription =>
      'A comunidade existe para spam, golpes ou uso indevido da plataforma.';

  @override
  String get iarReasonMalwareGuildLabel => 'Distribuição de malware';

  @override
  String get iarReasonMalwareGuildDescription =>
      'Distribui malware, rouba credenciais ou arquivos prejudiciais.';

  @override
  String get iarReasonPrivacyGuildLabel => 'Violação de privacidade ou doxxing';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'Compartilha informações pessoais, persegue usuários ou coordena abuso de privacidade.';

  @override
  String get iarReasonSelfHarmGuildLabel => 'Incentiva a automutilação';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'Incentiva suicídio, automutilação ou distúrbios alimentares.';

  @override
  String get iarReasonInappropriateProfile => 'Perfil inapropriado';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'O perfil deste usuário contém conteúdo inapropriado';

  @override
  String typingIndicatorOne(String name) {
    return '$name está digitando...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 e $name2 estão digitando...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 e $name3 estão digitando...';
  }

  @override
  String get typingIndicatorMultiple => 'Várias pessoas estão digitando...';

  @override
  String get typingIndicatorHandful =>
      'Um punhado de guerreiros do teclado está se reunindo...';

  @override
  String get typingIndicatorSymphony =>
      'Uma sinfonia de teclas batendo está em andamento...';

  @override
  String get typingIndicatorFiesta => 'É uma baita festa de digitação aqui';

  @override
  String get typingIndicatorApocalypse => 'Uau, é um apocalipse de digitação';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Que bom que você veio, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Bem-vindo, $username! Sinta-se em casa.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Olá, $username! Que bom ter você aqui.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Olá, $username! Participe quando estiver pronto.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Ei $username, que bom ver você aqui!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Olá, $username! Espero que você aproveite sua estadia.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Ei, $username, bem-vindo a bordo!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Que bom que você chegou, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Bem-vindo, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Bem-vindo, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Bem-vindo, $username! Ficamos felizes em ter você aqui.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Bem-vindo, $username! Espero que você aproveite seu tempo aqui.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Bem-vindo, $username! Sua próxima conversa começa aqui.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Bem-vindo, $username. Estamos felizes em ter você aqui.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Que bom ver você, $username! Bem-vindo.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Você chegou, $username! Que bom ter você conosco.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Você chegou, $username! Vamos começar.';
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
      other: '${count}m',
      one: '1mês',
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
  String get linkedDevicesTitle => 'Meus Dispositivos';

  @override
  String get linkedDevicesDescription =>
      'Veja todos os dispositivos que estão atualmente conectados à sua conta. Revogue quaisquer sessões que você não reconheça.';

  @override
  String get linkedDevicesCurrentDevice => 'Dispositivo Atual';

  @override
  String get linkedDevicesOtherDevices => 'Outros Dispositivos';

  @override
  String get linkedDevicesEnterSelection => 'Entrar no Modo de Seleção';

  @override
  String get linkedDevicesExitSelection => 'Sair do Modo de Seleção';

  @override
  String get linkedDevicesSelectAll => 'Selecionar Tudo';

  @override
  String get linkedDevicesClearSelection => 'Limpar Seleção';

  @override
  String get linkedDevicesRevokeTooltip => 'Revogar dispositivo';

  @override
  String get linkedDevicesSignOutAll => 'Sair de todos os outros dispositivos';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sair de $count dispositivos',
      one: 'Sair de 1 dispositivo',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sair de $count dispositivos',
      one: 'Sair de 1 dispositivo',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Sair de todos os outros dispositivos';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Isso desconectará os dispositivos selecionados da sua conta. Você precisará fazer login novamente nesses dispositivos.',
      one:
          'Isso desconectará o dispositivo selecionado da sua conta. Você precisará fazer login novamente nesse dispositivo.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Isso desconectará os dispositivos selecionados da sua conta. Você precisará fazer login novamente nesses dispositivos.';

  @override
  String get linkedDevicesSignOutConfirm => 'Continuar';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Você terá que fazer login novamente em todos os dispositivos desconectados';

  @override
  String get linkedDevicesLoadErrorTitle => 'Erro de Rede';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Estamos com problemas para nos conectar ao contínuo espaço-tempo. Verifique sua conexão e tente novamente.';

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
      'Não foi possível desconectar. Tente novamente.';

  @override
  String get linkedDevicesUnknownOs => 'SO Desconhecido';

  @override
  String get linkedDevicesUnknownPlatform => 'Plataforma Desconhecida';

  @override
  String slowmodeLabel(String duration) {
    return '$duration modo lento';
  }

  @override
  String get slowmodeTooltipActive =>
      'Você está em modo lento. Por favor, espere antes de enviar outra mensagem.';

  @override
  String get slowmodeTooltipImmune =>
      'O modo lento está ativado, mas você é imune.';

  @override
  String get slowmodeStatusEnabled => 'Modo lento ativado';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Modo lento ativo ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'O modo lento está definido como $durationLabel, mas você está isento.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'O modo lento está definido como $durationLabel. Aguarde antes de enviar outra mensagem.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'O modo lento está definido como $durationLabel para este canal.';
  }

  @override
  String get channelNoSendPermissionHint =>
      'Você não pode enviar mensagens neste canal.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Anúncios do sistema da equipe do $productName. Você não pode responder aqui.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'A mensagem está temporariamente pausada nesta comunidade.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Você foi silenciado. Mensagens, reações e voz estão pausados até que o tempo limite expire.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Você precisa reivindicar sua conta para enviar mensagens nesta comunidade.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Você precisa verificar seu e-mail para enviar mensagens nesta comunidade.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Sua conta é muito nova para enviar mensagens nesta comunidade.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Você não é membro desta comunidade há tempo suficiente para enviar mensagens.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Você precisa verificar um número de telefone para enviar mensagens nesta comunidade.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Verificar e-mail';

  @override
  String get channelComposerBarrierVerifyPhone => 'Verificar telefone';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Muitos anexos (máx. $max)';
  }

  @override
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName excede o limite de tamanho ($fileSize)';
  }

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Esses arquivos são muito grandes para enviar juntos';

  @override
  String get chatAttachmentDropToUpload =>
      'Solte os arquivos para fazer upload';

  @override
  String get chatAttachmentDropToSend => 'Solte os arquivos para enviar agora';

  @override
  String get chatAttachmentSendVoiceMessage => 'Enviar mensagem de voz';

  @override
  String get voiceMessageTitle => 'Mensagem de voz';

  @override
  String get voiceMessageHoldHint =>
      'Mantenha pressionado para gravar. Arraste para a lixeira para excluir, deslize para cima para travar ou solte para enviar.';

  @override
  String get voiceMessageDiscard => 'Descartar mensagem de voz';

  @override
  String get voiceMessageSend => 'Enviar mensagem de voz';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Não foi possível iniciar a gravação. Permita o acesso ao microfone.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'A gravação de voz não é compatível com este dispositivo.';

  @override
  String get voiceMessageMicInUse =>
      'Saia da chamada de voz para gravar uma mensagem de voz.';

  @override
  String get voiceMessageRecordingFailed =>
      'Falha na gravação. Tente novamente.';

  @override
  String get voiceMessageSendFailed =>
      'Não foi possível enviar a mensagem de voz. Tente novamente.';

  @override
  String get voiceMessageRecordingHint =>
      'Fale agora. Pressione Parar quando terminar — você pode cortar depois.';

  @override
  String get voiceMessageReviewHint =>
      'Arraste as alças para cortar e pressione Enviar.';

  @override
  String get voiceMessageStop => 'Parar';

  @override
  String get voiceMessageStartRecording => 'Iniciar gravação';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Reproduzir';

  @override
  String get voiceMessagePause => 'Pausar';

  @override
  String get voiceMessageSeekForward => 'Avançar';

  @override
  String get voiceMessageSeekBackward => 'Avançar';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'A seleção deve ter pelo menos ${secondsString}s.';
  }

  @override
  String get chatAttachmentEditTitle => 'Editar anexo';

  @override
  String get chatAttachmentFilenameLabel => 'Nome do arquivo';

  @override
  String get chatAttachmentDescriptionLabel => 'Descrição';

  @override
  String get chatAttachmentDescriptionHint => 'Texto alternativo opcional';

  @override
  String get chatAttachmentSpoilerLabel => 'Marcar como spoiler';

  @override
  String get chatAttachmentRemove => 'Remover anexo';

  @override
  String get chatAttachmentDownload => 'Baixar';

  @override
  String get chatAttachmentDownloadedToast => 'Salvo em fotos';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Não foi possível baixar o anexo';

  @override
  String get chatAttachmentExpiredTooltip => 'Anexo expirado';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Expandir ($count linhas)',
      one: 'Expandir ($count linha)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Recolher ($count linhas)',
      one: 'Recolher ($count linha)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Expandir ($count linhas)',
      one: 'Expandir ($count linha)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Recolher ($count linhas)',
      one: 'Recolher ($count linha)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count linhas restantes)',
      one: '... ($count linha restante)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count linhas restantes)',
      one: '... ($count linha restante)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'Ver arquivo completo';

  @override
  String get chatTextualPreviewChangeLanguage => 'Mudar idioma';

  @override
  String get chatTextualPreviewSearchLanguage => 'Pesquisar idioma…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Realce de sintaxe';

  @override
  String get chatTextualPreviewNoLanguagesFound =>
      'Nenhum resultado encontrado';

  @override
  String get chatTextualPreviewMoreOptions => 'Mais opções';

  @override
  String get chatTextualPreviewWrapText => 'Quebrar texto';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'O arquivo é muito grande para visualização em linha (limite de $previewLimitKb KB).';
  }

  @override
  String get chatTextualPreviewLoadError =>
      'Não foi possível carregar a prévia.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Texto simples';

  @override
  String get chatTextualPreviewCopy => 'Copiar';

  @override
  String get chatAttachmentSourceGallery => 'Galeria';

  @override
  String get chatAttachmentSourceCamera => 'Câmera';

  @override
  String get chatAttachmentSourceBrowse => 'Procurar arquivos';

  @override
  String get chatAttachmentPasteTooltip =>
      'Colar arquivo da área de transferência';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Revelar spoiler';

  @override
  String get matureMediaRevealButton => 'Revelar';

  @override
  String get matureMediaRevealHint => 'Clique para revelar';

  @override
  String get matureContentTitle => 'Conteúdo maduro';

  @override
  String get matureCommunityTitle => 'Comunidade para maiores';

  @override
  String get matureCategoryTitle => 'Categoria para maiores';

  @override
  String get matureChannelTitle => 'Canal para maiores';

  @override
  String get communityContentWarningTitle => 'Aviso de conteúdo da comunidade';

  @override
  String get categoryContentWarningTitle => 'Aviso de conteúdo da categoria';

  @override
  String get channelContentWarningTitle => 'Aviso de conteúdo do canal';

  @override
  String get defaultContentWarningBody => 'Isso contém conteúdo sensível.';

  @override
  String get matureCommunityBody =>
      'Esta comunidade é marcada para conteúdo adulto e pode conter material que pode ser inadequado para alguns usuários.';

  @override
  String get matureCategoryBody =>
      'Esta categoria é marcada para conteúdo adulto e pode conter material que pode ser inadequado para alguns usuários.';

  @override
  String get matureChannelBody =>
      'Este canal é marcado para conteúdo adulto e pode conter material que pode ser inadequado para alguns usuários.';

  @override
  String get matureVoiceChannelBody =>
      'Este canal de voz é marcado para conteúdo adulto e pode conter material que pode ser inadequado para alguns usuários.';

  @override
  String get matureLinkChannelBody =>
      'Este canal de links é marcado para conteúdo adulto e pode abrir material que pode ser inadequado para alguns usuários.';

  @override
  String get matureCommunityUnavailableBody =>
      'Esta comunidade para maiores não está disponível para sua conta.';

  @override
  String get matureCategoryUnavailableBody =>
      'Esta categoria para maiores não está disponível para sua conta.';

  @override
  String get matureChannelUnavailableBody =>
      'Este canal para maiores não está disponível para sua conta.';

  @override
  String get matureContentProceedButton => 'Continuar';

  @override
  String get matureContentUnderstandButton => 'Eu entendo';

  @override
  String get matureContentOpenLinkButton => 'Abrir link';

  @override
  String get sensitiveContentSectionTitle => 'Conteúdo sensível';

  @override
  String get sensitiveContentSectionDescription =>
      'Controle como mídia adulta ou sensível é filtrada em diferentes contextos';

  @override
  String get sensitiveContentFriendDmLabel => 'Mensagens diretas de amigos';

  @override
  String get sensitiveContentNonFriendDmLabel => 'Mensagens diretas de outros';

  @override
  String get sensitiveContentGuildLabel => 'Mensagens em canais da comunidade';

  @override
  String get sensitiveContentFilterShow => 'Mostrar';

  @override
  String get sensitiveContentFilterBlur => 'Desfocar';

  @override
  String get sensitiveContentFilterBlock => 'Bloquear';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Desfocar mídia até a conclusão da verificação de segurança';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Quando ativado, imagens e vídeos são desfocados até que a verificação de segurança de conteúdo seja concluída.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Esta configuração está sempre ativa para sua conta.';

  @override
  String get sensitiveContentResetButton => 'Redefinir';

  @override
  String get sensitiveContentSaveButton => 'Salvar';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arquivos',
      one: '1 arquivo',
    );
    return 'Enviando $_temp0';
  }

  @override
  String get chatCancelUpload => 'Cancelar envio';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Expira em $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Expira entre $start e $end';
  }

  @override
  String get connectionsTitle => 'Conexões';

  @override
  String connectionsDescription(String productName) {
    return 'Vincule contas e domínios externos ao seu perfil $productName. Conexões verificadas serão exibidas em seu perfil para que outros vejam.';
  }

  @override
  String get connectionsEmptyTitle => 'Nenhuma conexão ainda';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Vincule sua conta Bluesky ou verifique a propriedade do domínio para exibi-los em seu perfil.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Verifique a propriedade do domínio para exibi-lo em seu perfil.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Domínio';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Adicionar conexão Bluesky';

  @override
  String get connectionsAddDomainAriaLabel => 'Adicionar conexão de domínio';

  @override
  String get connectionEdit => 'Editar';

  @override
  String get connectionRemove => 'Remover';

  @override
  String get connectionVerifiedLabel => 'Esta conexão foi verificada.';

  @override
  String get connectionUnverifiedLabel => 'Esta conexão não foi verificada.';

  @override
  String get connectionAddTitle => 'Adicionar Conexão';

  @override
  String get connectionTypeLabel => 'Tipo de Conexão';

  @override
  String get connectionHandleLabel => 'Identificador';

  @override
  String get connectionDomainLabel => 'Domínio';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Você já tem esta conexão.';

  @override
  String get connectionConnectBluesky => 'Conectar com Bluesky';

  @override
  String get connectionContinue => 'Continuar';

  @override
  String get connectionVerifyTitle => 'Verificar Conexão';

  @override
  String get connectionVerifyInstructions =>
      'Use o registro abaixo para comprovar a propriedade do domínio.';

  @override
  String get connectionDnsRecordTitle => 'Registro TXT do DNS';

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
  String get connectionTokenFileTitle => 'Servir o arquivo de token';

  @override
  String get connectionTokenFileDescription =>
      'Baixe **fluxer-verification** e coloque-o na sua pasta **.well-known** para que possamos validar o domínio.';

  @override
  String get connectionTokenFileDownload => 'Baixar fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'O arquivo contém o token de verificação que buscaremos em **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Salvar fluxer-verification';

  @override
  String get connectionVerifyButton => 'Verificar';

  @override
  String get connectionBack => 'Voltar';

  @override
  String get connectionEditTitle => 'Editar Conexão';

  @override
  String get connectionEditDescription =>
      'Escolha quem pode ver esta conexão no seu perfil.';

  @override
  String get connectionVisibilityEveryone => 'Todos';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Permitir que qualquer pessoa veja esta conexão no seu perfil';

  @override
  String get connectionVisibilityFriends => 'Amigos';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Permitir que seus amigos vejam esta conexão';

  @override
  String get connectionVisibilityCommunityMembers => 'Membros da Comunidade';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Permitir que membros das comunidades em que você está vejam esta conexão';

  @override
  String get connectionRemoveTitle => 'Remover Conexão';

  @override
  String get connectionRemoveDescription =>
      'Tem certeza de que deseja remover esta conexão? Esta ação não pode ser desfeita.';

  @override
  String get connectionRemoveConfirm => 'Remover';

  @override
  String get connectionsLoadError => 'Falha ao carregar conexões';

  @override
  String get connectionsReorderError => 'Falha ao atualizar a ordem';

  @override
  String get connectionInitiateFailed =>
      'Não foi possível iniciar a verificação. Tente novamente.';

  @override
  String get connectionVerifyFailed =>
      'Não foi possível verificar. Verifique seu registro DNS e tente novamente.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Não foi possível iniciar a autorização do Bluesky.';

  @override
  String get connectionUpdateFailed => 'Não foi possível atualizar a conexão';

  @override
  String get connectionRemoveFailed => 'Não foi possível remover a conexão';

  @override
  String get connectionTokenSavedToast => 'fluxer-verification salvo';

  @override
  String get connectionTokenSaveFailedToast =>
      'Não foi possível salvar o arquivo';

  @override
  String get connectionEnterHandle => 'Digite um identificador do Bluesky.';

  @override
  String get connectionEnterDomain => 'Digite um domínio.';

  @override
  String get lookAndFeelTitle => 'Aparência';

  @override
  String get lookAndFeelThemeSectionTitle => 'Tema';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Escolha entre aparência escura, carvão ou clara.';

  @override
  String get lookAndFeelHdrSectionTitle => 'Alto alcance dinâmico';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Controle como as imagens HDR são exibidas em monitores compatíveis com HDR.';

  @override
  String get lookAndFeelHdrFullName => 'Alcance dinâmico total';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Exibir imagens HDR com brilho e gama de cores completos.';

  @override
  String get lookAndFeelHdrStandardName => 'Alcance padrão';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Mapeie imagens HDR para o intervalo padrão, reduzindo o pico de brilho.';

  @override
  String get lookAndFeelHdrDisplayModeLabel => 'Modo de tela HDR';

  @override
  String get lookAndFeelThemeDark => 'Tema Escuro';

  @override
  String get lookAndFeelThemeCoal => 'Tema Carvão';

  @override
  String get lookAndFeelThemeLight => 'Tema Claro';

  @override
  String get lookAndFeelThemeSystem => 'Tema do Sistema';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Sincronizar tema entre dispositivos';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Quando ativado, as alterações de tema serão sincronizadas com todos os seus dispositivos. Quando desativado, este dispositivo usará sua própria configuração de tema.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'O tema do sistema desativa automaticamente a sincronização para rastrear a preferência do seu sistema neste dispositivo.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Não foi possível sincronizar o tema com sua conta. Tente novamente.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Escala da fonte do chat';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Ajuste o tamanho da fonte na área de chat.';

  @override
  String get lookAndFeelChatFontSizeLabel => 'Tamanho da fonte do chat';

  @override
  String get lookAndFeelAppZoomTitle => 'Nível de zoom do app';

  @override
  String get lookAndFeelAppZoomDescription =>
      'Ajustar o nível de zoom do aplicativo.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'Papel de parede do chat';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'Escolha um plano de fundo para o chat. Ele ficará neste dispositivo.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'Esta configuração fica neste dispositivo';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'O papel de parede do chat é salvo apenas neste dispositivo e não é sincronizado com outros.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'Padrão';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'Imagem personalizada';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Cor $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Gradiente $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'Escurecer papel de parede';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'Não foi possível definir esta imagem como seu papel de parede.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Mensagens';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Escolha como as mensagens são exibidas nos canais de chat.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Espaçamento entre grupos de mensagens';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel =>
      'Modo de exibição de mensagens';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Confortável';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Layout espaçoso com clara separação visual entre as mensagens.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Denso';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Maximiza as mensagens visíveis com espaçamento mínimo.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'Ocultar fotos de perfil';

  @override
  String get lookAndFeelInterfaceTitle => 'Interface';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Personalize elementos e comportamentos da interface.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Indicadores de digitação na lista de canais';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Escolha como os indicadores de digitação aparecem na lista de canais quando alguém está digitando em um canal.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Indicador de Digitação + Avatares';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Mostrar indicador de digitação com avatares de usuário na lista de canais';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Apenas Indicador de Digitação';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Mostrar apenas o indicador de digitação sem avatares';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Oculto';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Não mostrar indicadores de digitação na lista de canais';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Mostrar digitação no canal selecionado';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Quando desativado (padrão), os indicadores de digitação não aparecerão no canal que você está visualizando.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'geral';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Dicas de Teclado';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Controle se as dicas de atalhos de teclado aparecem em tooltips.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Ocultar dicas de teclado em tooltips';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Quando ativado, os ícones de atalho são ocultados em pop-ups de tooltip.';

  @override
  String get lookAndFeelNekoTitle => 'Diversos';

  @override
  String get lookAndFeelNekoDescription => 'Opções diversas de interface.';

  @override
  String get lookAndFeelShowNekoLabel => 'Mostrar Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Quando ativado, Neko aparece perto da barra de entrada de chat.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Comportamento de entrada em canais de voz';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Controle como você entra em canais de voz em comunidades.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Exigir clique duplo para entrar em canais de voz';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Quando ativado, você precisará clicar duas vezes em canais de voz para entrar. Quando desativado (padrão), um único clique entrará no canal imediatamente.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'O rápido cão marrom salta sobre a preguiça.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Barra lateral da comunidade';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Configure como a barra lateral da comunidade exibe mensagens diretas.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count comunidades estão temporariamente indisponíveis devido a um mau funcionamento do capacitor de fluxo.',
      one:
          '1 comunidade está temporariamente indisponível devido a um mau funcionamento do capacitor de fluxo.',
    );
    return '$_temp0';
  }

  @override
  String get communityTemporarilyUnavailable =>
      'Comunidade temporariamente indisponível';

  @override
  String get guildUnavailableDescription =>
      'Algo deu errado. Estamos trabalhando para resolver.';

  @override
  String get guildNotFoundTitle =>
      'Esta não é a comunidade que você está procurando.';

  @override
  String get guildNotFoundDescription =>
      'A comunidade que você procura pode ter sido excluída ou você não tem acesso a ela.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return 'No momento, $communityName está acessível apenas para membros da equipe $productName';
  }

  @override
  String get guildNavbarTemporarilyUnavailable =>
      'temporariamente indisponível';

  @override
  String get lookAndFeelCollapseDMsLabel => 'Recolher DMs em Pasta';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'Quando ativado, DMs não lidas na barra lateral da comunidade são recolhidas em uma pasta no botão $productName. Clique no botão $productName enquanto estiver na página de DMs para expandir ou recolher a pasta.';
  }

  @override
  String get lookAndFeelChannelListSectionTitle => 'Lista de Canais';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Controle o comportamento do indicador de não lidas para canais silenciados em listas de canais.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Mostrar indicador de não lidas em canais silenciados';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Quando ativado, canais silenciados mostram um indicador de não lidas atenuado no lado esquerdo. Menções ainda aparecem independentemente desta configuração.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Ativos Agora';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Controle como Ativos Agora aparece em todo o aplicativo.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Mostrar Ativos Agora na tela inicial';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Mostre Ativos Agora na tela inicial para exibir amigos ativos em voz. Você verá uma prévia, o contexto do canal, quem já está lá e uma maneira rápida de entrar.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Favoritos';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Controle a visibilidade dos favoritos em todo o aplicativo.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Ativar Favoritos';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Quando ativado, você pode favoritar canais e eles aparecerão na seção Favoritos. Quando desativado, todos os elementos de UI relacionados a favoritos (botões, itens de menu) serão ocultados. Seus favoritos existentes serão preservados.';

  @override
  String get favoritesTitle => 'Favoritos';

  @override
  String get favoritesEmptyTitle => 'Nenhum favorito ainda';

  @override
  String get favoritesEmptyDescription =>
      'Marque canais do cabeçalho do chat para mantê-los aqui.';

  @override
  String get favoritesWelcomeTitle => 'Bem-vindo aos favoritos';

  @override
  String get favoritesWelcomeDescription =>
      'Seu espaço pessoal para acesso rápido a canais, DMs e grupos que você adora. Pressione a estrela em qualquer canal para adicioná-lo aqui.';

  @override
  String get favoritesWelcomeTip =>
      'Não é para você? Desative a qualquer momento.';

  @override
  String get favoritesDisableButton => 'Desativar favoritos';

  @override
  String get favoritesAddedToast => 'Adicionado aos Favoritos';

  @override
  String get favoritesRemovedToast => 'Removido dos Favoritos';

  @override
  String get favoritesHiddenToast => 'Favoritos ocultos';

  @override
  String get favoritesMute => 'Silenciar favoritos';

  @override
  String get favoritesUnmute => 'Ativar som dos favoritos';

  @override
  String get favoritesHeaderMenu => 'Menu de favoritos';

  @override
  String get favoritesCreateCategory => 'Criar categoria';

  @override
  String get favoritesCategoryNameLabel => 'Nome da categoria';

  @override
  String get favoritesHideMutedChannels => 'Ocultar canais silenciados';

  @override
  String get favoritesShowMutedChannels => 'Mostrar canais silenciados';

  @override
  String get favoritesSetNickname => 'Definir apelido';

  @override
  String get favoritesNicknameLabel => 'Apelido';

  @override
  String get favoritesSaveNickname => 'Salvar apelido';

  @override
  String get favoritesMoveToCategory => 'Mover para categoria';

  @override
  String get favoritesUncategorized => 'Não categorizado';

  @override
  String get favoritesOtherCategory => 'Outros';

  @override
  String get favoritesRemoveFromFavorites => 'Remover dos Favoritos';

  @override
  String get favoritesAddToFavorites => 'Adicionar aos Favoritos';

  @override
  String get favoritesAddToSavedMedia => 'Adicionar às mídias salvas';

  @override
  String get favoritesRemoveFromSavedMedia => 'Remover dos itens salvos';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Adicionar aos GIFs favoritos por URL';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Remover dos GIFs favoritos salvos por URL';

  @override
  String get savedMediaAddTitle => 'Adicionar às mídias salvas';

  @override
  String get savedMediaFormNameLabel => 'Nome';

  @override
  String get savedMediaFormNameHint => 'Minha mídia incrível';

  @override
  String get savedMediaFormAltTextLabel => 'Texto alternativo';

  @override
  String get savedMediaFormAltTextHint => 'Descreva a mídia';

  @override
  String get savedMediaFormTagsLabel => 'Tags';

  @override
  String get savedMediaFormTagsHint => 'engraçado, reação, trabalho';

  @override
  String get savedMediaSaveError => 'Não foi possível atualizar a mídia salva.';

  @override
  String get savedMediaNameRequired => 'O nome é obrigatório.';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'Como devemos salvar seus GIFs favoritos?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'Você pode armazenar GIFs favoritados como favoritos apenas com URL ou enviá-los para sua mídia salva. Escolha a opção que melhor se adapta ao seu uso. Você pode alterá-la a qualquer momento em Configurações > Avançado > Mídia.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'Favoritos somente com URL (padrão): sincronizados entre seus dispositivos, sem upload, não contam para a mídia salva. A mídia original pode desaparecer se o host a remover.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Mídia salva: enviada, com tags, pesquisável e persistente, mas conta para o seu limite de mídia salva.';

  @override
  String get gifFavoriteFirstTimeHint => 'Só perguntaremos uma vez.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly => 'Usar apenas URL (recomendado)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => 'Usar mídia salva';

  @override
  String get favoritesHideConfirmTitle => 'Ocultar favoritos';

  @override
  String get favoritesHideConfirmDescription =>
      'Isso ocultará todos os elementos da interface relacionados a favoritos, incluindo botões e itens de menu. Seus favoritos existentes serão preservados e poderão ser reativados a qualquer momento em Configurações > Avançado > Aparência.';

  @override
  String get favoritesDirectMessageSubtitle => 'Mensagem Direta';

  @override
  String get messagesMediaDisplayGroupTitle => 'Exibição';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Controle como mensagens, mídias e outros conteúdos são exibidos.';

  @override
  String get messagesMediaMediaGroupTitle => 'Mídia';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Personalize as preferências de tamanho de mídia e botões.';

  @override
  String get messagesMediaInputGroupTitle => 'Entrada';

  @override
  String get messagesMediaInputGroupDescription =>
      'Personalize as configurações de entrada de mensagens.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Barra lateral';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Configure como a barra lateral da comunidade é exibida.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Ocultar canais silenciados por padrão';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Oculte automaticamente canais silenciados na barra lateral ao entrar em novas comunidades';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Ocultar canais silenciados por padrão?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Novas comunidades que você ingressar terão automaticamente os canais silenciados ocultos. Você também gostaria de aplicar essa configuração a todas as suas comunidades existentes?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Parar de ocultar canais silenciados por padrão?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Novas comunidades que você ingressar não terão mais canais silenciados ocultos automaticamente. Você também gostaria de mostrar canais silenciados em todas as suas comunidades existentes?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Aplicar a todas as comunidades';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Mostrar em todas as comunidades';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Apenas novas comunidades';

  @override
  String get messagesMediaDisplaySectionTitle => 'Exibição de Mídia';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Controle como imagens, vídeos e outras mídias são exibidos. Toda a mídia é redimensionada e convertida. Arquivos extremamente grandes que não podem ser comprimidos em uma prévia não serão incorporados, independentemente dessas configurações.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Quando postado como links para o chat';

  @override
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'Quando enviado diretamente para o $productName';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle =>
      'Pré-visualizações de Links';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Controle como links de sites são pré-visualizados no chat';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Mostrar incorporações e pré-visualizar links de sites';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reações';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Configure reações com emojis em mensagens';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Mostrar reações com emojis em mensagens';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Conteúdo de spoiler';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Controle como o conteúdo de spoiler é exibido';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Mostrar conteúdo de spoiler';

  @override
  String get messagesMediaSpoilersOnClickName => 'Ao clicar';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Mostrar conteúdo de spoiler ao clicar';

  @override
  String get messagesMediaSpoilersIfModeratorName => 'Nos canais que modero';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Sempre mostre o conteúdo de spoiler em canais onde você tem a permissão \"Gerenciar mensagens\"';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Sempre';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Sempre mostrar conteúdo de spoiler';

  @override
  String get messagesMediaSizeSectionTitle =>
      'Preferências de tamanho de mídia';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Personalize o tamanho máximo de exibição para mídia incorporada e anexada. Tamanhos menores usam menos espaço na tela, enquanto tamanhos maiores mostram mais detalhes.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Mídia de links (incorporações)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Anexos enviados';

  @override
  String get messagesMediaSizeCompactName => 'Compacto (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Tamanho de mídia menor';

  @override
  String get messagesMediaSizeComfortableName => 'Confortável (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Tamanho de mídia maior com mais detalhes';

  @override
  String get messagesMediaGifsSectionTitle => 'Comportamento de GIFs';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Controle como os GIFs são inseridos no chat';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Enviar GIFs automaticamente ao selecionar';

  @override
  String get messagesMediaCameraUploadsSectionTitle => 'Uploads da câmera';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Escolha se as fotos e vídeos tirados com a câmera do app serão mantidos no seu dispositivo';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel =>
      'Salvar no dispositivo';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Autocompletar expressões (autocompletar dois pontos)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Controle o que aparece no autocompletar de expressões quando você digita dois pontos. Personalize quais sugestões aparecem para corresponder às suas preferências.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Mostrar emojis padrão no autocompletar de expressões';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Mostrar emojis personalizados no autocompletar de expressões';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Mostrar figurinhas no autocompletar de expressões';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Mostrar mídia salva no autocompletar de expressões';

  @override
  String get messagesMediaEditingSectionTitle => 'Edição de mensagens';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Controle o que acontece com seu rascunho de edição ao cancelar.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Preservar rascunho de edição ao cancelar';

  @override
  String get accessibilitySaturationTitle => 'Saturação';

  @override
  String get accessibilitySaturationDescription =>
      'Ajuste a intensidade das cores do tema em todo o aplicativo.';

  @override
  String get accessibilityVisualGroupTitle => 'Visual';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel => 'Sempre sublinhar links';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Escurecer texto tachado';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'Pré-visualizações de mensagens diretas';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Controle quando as pré-visualizações de mensagens são mostradas na lista de DMs.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Modo de pré-visualização de mensagens diretas';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Todas as mensagens';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Mostrar pré-visualizações de mensagens para todas as conversas diretas';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Somente DMs não lidas';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Mostrar pré-visualizações de mensagens apenas para DMs com mensagens não lidas';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Nenhum';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Não mostrar pré-visualizações de mensagens na lista de DMs';

  @override
  String get accessibilityScreenReaderGroupTitle => 'Leitor de tela';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Controle como o $productName funciona com leitores de tela.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Anunciar novas mensagens';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Permitir que leitores de tela anunciem novas mensagens assim que elas chegam no canal aberto. Os sons de notificação não serão afetados.';

  @override
  String get accessibilityTtsGroupTitle => 'Texto para fala';

  @override
  String get accessibilityTtsGroupDescription =>
      'Escolha uma velocidade para o texto falado.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Velocidade da reprodução de fala';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Reproduzir amostra';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Silenciar amostra';

  @override
  String get accessibilityPreviewButtonLabel => 'Botão de pré-visualização';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'Isto mostra como os links aparecem: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Usuário de visualização';

  @override
  String get accessibilityKeyboardGroupTitle => 'Teclado';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Mostrar anel de foco na caixa de texto do chat';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'A tecla Esc sai do modo de teclado';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Mostrar atalhos do menu de contexto';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Confirmar antes de iniciar chamadas';

  @override
  String get accessibilityAnimationGroupTitle => 'Animação';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'O movimento reduzido está ativado, então as animações de conteúdo estão pausadas por padrão. Você ainda pode reativar qualquer uma delas para continuar a reprodução.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel =>
      'Reproduzir emojis animados';

  @override
  String get accessibilityAutoPlayGifsMobileLabel =>
      'Reproduzir GIFs automaticamente';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'Reproduzir GIFs automaticamente quando o $productName estiver em foco';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Reproduzindo, apesar do movimento reduzido.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Pausado por movimento reduzido. Ative para manter os emojis animados.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Pausado por movimento reduzido. Ative para manter os GIFs em reprodução.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'Desativado por padrão no celular para preservar a bateria e o uso de dados.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Animações de figurinhas';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Preferência de animação de figurinhas';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Sempre animar';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Os stickers sempre serão animados';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Animar ao interagir';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Os stickers serão animados quando você tocar neles';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Os stickers serão animados quando você passar o mouse ou interagir com eles';

  @override
  String get accessibilityStickerNeverAnimateName => 'Nunca animar';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Figurinhas nunca serão animadas';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Sempre animando, apesar do movimento reduzido.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'O movimento reduzido limita os figurinhas a animar na interação. Escolha \"sempre animar\" para substituir.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'Por padrão, as animações são ativadas ao interagir no celular para economizar bateria.';

  @override
  String get accessibilityMotionGroupTitle => 'Movimento';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Sincronizar configuração de movimento reduzido com o sistema';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Use a preferência de movimento reduzido do sistema deste aparelho ou personalize abaixo.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Reduzir movimento';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Desativar animações e transições. Atualmente controlado pelas configurações do seu sistema.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Desativar animações e transições em todo o app.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Emojis animados, GIFs e figurinhas permanecem sob seu controle na aba Animação.';

  @override
  String get accessibilityConfirmStartCallTitle => 'Iniciar chamada?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Tem certeza de que deseja iniciar esta chamada?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Iniciar chamada';

  @override
  String get accessibilityTtsSampleDescription =>
      'Ouça a frase de exemplo falada na velocidade escolhida.';

  @override
  String get accessibilityTtsSampleText =>
      'Doutor, eu sou do futuro. Vim parar aqui em uma máquina do tempo que você inventou. Agora, preciso da sua ajuda para voltar para o ano de 1985.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'A síntese de voz não está disponível neste dispositivo.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Falha na reprodução de fala. Tente novamente ou verifique se a saída de áudio está funcionando.';

  @override
  String get ttsSubstitutionUnknownUser => 'usuário desconhecido';

  @override
  String get ttsSubstitutionUnknownRole => 'função desconhecida';

  @override
  String get ttsSubstitutionUnknownChannel => 'canal desconhecido';

  @override
  String get ttsSubstitutionCodeBlock => 'bloco de código';

  @override
  String get ttsSubstitutionSpoiler => 'oculto';

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
    return '$authorName disse: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'Respondendo a $replyAuthorName, $authorName disse: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'enviou um figurinha';

  @override
  String get ttsSentAttachment => 'enviou um anexo';

  @override
  String ttsSentAttachments(int count) {
    return 'enviou $count anexos';
  }

  @override
  String get ttsSentEmbed => 'enviou um embed';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author enviou $summary';
  }

  @override
  String get dmListSentAnAttachment => 'Enviou um anexo';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username fixou uma mensagem neste canal.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username adicionou $userName ao grupo.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username adicionou alguém ao grupo.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username saiu do grupo.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username removeu $userName do grupo.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username removeu alguém do grupo.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username alterou o nome do canal para $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username alterou o nome do canal.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username alterou o ícone do canal.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username iniciou uma chamada.';
  }

  @override
  String get systemCallJoinTheCall => 'Entrar na chamada';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username iniciou uma chamada que durou $duration.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'Você perdeu uma chamada de $username que durou $duration.';
  }

  @override
  String systemCallMissed(String username) {
    return 'Você perdeu uma chamada de $username.';
  }

  @override
  String get systemCallDurationFewSeconds => 'há poucos segundos';

  @override
  String get systemCallDurationMinute => 'um minuto';

  @override
  String get systemCallDurationOneYear => '1 ano';

  @override
  String get systemCallDurationOneMonth => '1 mês';

  @override
  String get systemCallDurationOneWeek => '1 semana';

  @override
  String get systemCallDurationOneDay => '1 dia';

  @override
  String get systemCallDurationOneHour => '1 hora';

  @override
  String systemCallDurationYears(int count) {
    return '$count anos';
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
    return '$count dias';
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
    return 'Atualize o $productName para ver esta mensagem.';
  }

  @override
  String get voiceConnectionConfirmTitle => 'Confirmação de Conexão de Voz';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Você já está conectado a este canal de voz de $count outros dispositivos. O que você gostaria de fazer?',
      one:
          'Você já está conectado a este canal de voz de 1 outro dispositivo. O que você gostaria de fazer?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Mudar para Este Dispositivo';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Entrar Apenas (Manter Conexões Ativas)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Não fazer nada, não quero entrar';

  @override
  String get voiceJoinFailedTitle =>
      'Não foi possível entrar na chamada de voz';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Não foi possível desconectar seus outros dispositivos. Tente novamente em um momento.';

  @override
  String get voiceChannelEmptyDescription =>
      'Este é um canal de voz. Conecte-se para começar a falar!';

  @override
  String get voiceChannelJoin => 'Entrar no canal de voz';

  @override
  String get voiceCallJoin => 'Entrar na chamada';

  @override
  String get voiceChannelJoinConnect => 'Conectar à Voz';

  @override
  String get voiceChannelNoConnectPermission =>
      'Você não tem permissão para entrar neste canal de voz';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Microfone, câmera e conteúdo de compartilhamento de tela são criptografados de ponta a ponta.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Microfone, câmera e conteúdo de compartilhamento de tela são criptografados de ponta a ponta.';

  @override
  String get voiceChannelE2eeBroken =>
      'A criptografia de ponta a ponta não está disponível porque um participante não compatível está neste canal de voz.';

  @override
  String get voiceCallE2eeBroken =>
      'A criptografia de ponta a ponta não está disponível porque um participante não compatível está nesta chamada.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Este cliente precisa ser atualizado antes de entrar nesta chamada criptografada.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Não foi possível iniciar seu microfone. Você ainda está na chamada.';

  @override
  String get voiceChannelStatusConnecting => 'Conectando…';

  @override
  String get voiceChannelStatusConnected => 'Conectado';

  @override
  String get voiceChannelStatusError => 'Erro';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Dispositivo móvel';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Dispositivo de desktop';

  @override
  String get voiceParticipantTooltipCommunityMuted =>
      'Silenciado pela comunidade';

  @override
  String get voiceParticipantTooltipMuted => 'Silenciado';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Surdo pela comunidade';

  @override
  String get voiceParticipantTooltipDeafened => 'Surdo';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Conexão: $connectionId';
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
  String get voiceChannelLeave => 'Sair';

  @override
  String get voiceControlMute => 'Silenciar';

  @override
  String get voiceControlUnmute => 'Ativar som';

  @override
  String get voiceControlDeafen => 'Deixar surdo';

  @override
  String get voiceControlUndeafen => 'Deixar de deixar surdo';

  @override
  String get voiceControlVideo => 'Vídeo';

  @override
  String get voiceControlFlipCamera => 'Virar câmera';

  @override
  String get voiceControlScreenShare => 'Compartilhar tela';

  @override
  String get voiceScreenShareNotificationText => 'Compartilhando sua tela.';

  @override
  String get voiceControlMore => 'Mais';

  @override
  String get voiceControlDisconnect => 'Desconectar';

  @override
  String get voiceInChat => 'No bate-papo de voz';

  @override
  String get voiceConnectionFailed => 'Falha na conexão';

  @override
  String get voiceConnectionRetry => 'Tentar novamente';

  @override
  String get voiceConnectionDismiss => 'Dispensar';

  @override
  String get voiceConnectionDisconnected => 'Desconectado';

  @override
  String voicePingMs(int currentLatency) {
    return 'Ping: ${currentLatency}ms';
  }

  @override
  String get voiceMeasuringLatency => 'Medindo a latência...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Ir para $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'Conexão de voz';

  @override
  String get voiceConnectionAdvancedStats => 'Avançado';

  @override
  String get voiceShowCallAvatars => 'Mostrar avatares da chamada';

  @override
  String get voiceShowConnectionId => 'Mostrar ID da conexão';

  @override
  String get voiceAudioProcessing => 'Processando áudio';

  @override
  String get voiceConnectionSessionSection => 'Sessão';

  @override
  String get voiceConnectionDurationLabel => 'Duração';

  @override
  String get voiceConnectionParticipantsLabel => 'Participantes';

  @override
  String get voiceConnectionNetworkSection => 'Rede';

  @override
  String get voiceConnectionPingLabel => 'Ping';

  @override
  String get voiceConnectionJitterLabel => 'Variação de atraso';

  @override
  String get voiceConnectionSendLabel => 'Enviar';

  @override
  String get voiceConnectionReceiveLabel => 'Receber';

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
  String get userAreaMuteMicrophone => 'Silenciar microfone';

  @override
  String get userAreaUnmuteMicrophone => 'Ativar microfone';

  @override
  String get userAreaUserSettings => 'Configurações de usuário';

  @override
  String get voiceParticipantMenuViewProfile => 'Ver perfil';

  @override
  String get voiceParticipantMenuFocus => 'Focar nesta pessoa';

  @override
  String get voiceParticipantMenuUnfocus => 'Remover destaque';

  @override
  String get voiceParticipantMenuCommunityMute => 'Silenciar na comunidade';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Silenciar na comunidade';

  @override
  String get voiceParticipantMenuUserVolume => 'Volume do usuário';

  @override
  String get voiceParticipantMenuStreamVolume => 'Volume da transmissão';

  @override
  String get voiceParticipantMenuStopStreaming => 'Parar transmissão';

  @override
  String get voiceParticipantModerationFailed =>
      'Não foi possível atualizar este membro. Tente novamente.';

  @override
  String get voiceControlChat => 'Chat';

  @override
  String get voiceCallViewModeLabel => 'Ver';

  @override
  String get voiceCallViewModeGrid => 'Grade';

  @override
  String get voiceCallViewModeFocus => 'Foco';

  @override
  String get voicePanelSettingsSectionTitle => 'Configurações de voz';

  @override
  String get voicePanelUseEarpieceLabel => 'Usar o fone de ouvido';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Mostrar apenas vídeos';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Mostrar apenas participantes com a câmera ligada.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Mostrar minha câmera';

  @override
  String get voicePrioritizeSpeakersLabel => 'Priorizar quem fala';

  @override
  String get voiceTextChatShow => 'Mostrar chat';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# mensagens não lidas',
      one: '# mensagem não lida',
    );
    return 'Mostrar chat com $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Permissão da câmera é necessária para vídeo.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Não foi possível iniciar o compartilhamento de tela. Tente novamente.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Permissão de compartilhamento de tela foi negada.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'O compartilhamento de tela não está disponível neste dispositivo.';

  @override
  String get voiceWatchStream => 'Assistir Transmissão';

  @override
  String get voiceStopWatching => 'Parar de assistir';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Parar de assistir ao stream atual';

  @override
  String get voiceOwnScreenShareTitle => 'Você está transmitindo';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Seu stream está ao vivo para os participantes.';

  @override
  String get voiceLiveBadge => 'AO VIVO';

  @override
  String get dmVoiceViewCall => 'Ver chamada';

  @override
  String get dmVoiceCallFullScreen => 'Tela cheia';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Abrir chamada em tela cheia';

  @override
  String get dmVoiceStripStatusConnecting => 'Conectando...';

  @override
  String get dmVoiceStripStatusInCall => 'Em chamada';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Chamada de voz';

  @override
  String get dmVoiceCallBarConnecting => 'Conectando...';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Chamada direta';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Chamada em grupo';

  @override
  String get dmVoiceCallBarIssueFallback => 'Problema de voz';

  @override
  String get dmVoiceFullscreenTitle => 'Voz';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Voz conectada';

  @override
  String get notificationsPageTitle => 'Notificações';

  @override
  String get notificationsFilterUnreads => 'Não lidas';

  @override
  String get notificationsFilterMentions => 'Menções';

  @override
  String get notificationsBookmarksTooltip => 'Favoritos';

  @override
  String get notificationsMentionFilterTooltip => 'Filtrar menções';

  @override
  String get notificationsMentionFiltersTitle => 'Filtros de menção';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Incluir menções de @everyone e @here';

  @override
  String get notificationsMentionIncludeRoles => 'Incluir menções de cargos';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Incluir menções de todas as comunidades';

  @override
  String get notificationsNoUnreadTitle => 'Nenhuma mensagem não lida';

  @override
  String get notificationsNoUnreadBody => 'Você está em dia.';

  @override
  String get notificationsNoMentionsTitle => 'Nenhuma menção recente';

  @override
  String get notificationsNoMentionsBody =>
      'Todas as @menções a você aparecerão aqui por 7 dias.';

  @override
  String get notificationsMentionsEndTitle => 'Você chegou ao fim';

  @override
  String get notificationsMentionsEndBody =>
      'Você viu todas as suas menções recentes. Não se preocupe, mais aparecerão aqui em breve.';

  @override
  String get notificationsJump => 'Ir';

  @override
  String get notificationsRemoveMentionTooltip => 'Remover menção';

  @override
  String get notificationsViewAllUnread => 'Ver todas as não lidas';

  @override
  String get notificationsMarkAsRead => 'Marcar como lida';

  @override
  String get notificationsExpand => 'Expandir';

  @override
  String get notificationsCollapse => 'Recolher';

  @override
  String get notificationsMessageUnavailable =>
      'Esta mensagem não pôde ser carregada.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining caracteres restantes';
  }

  @override
  String get characterCounterTooLong => 'Mensagem muito longa';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining caracteres restantes. Obtenha o $productName para escrever até $premiumMaxLength caracteres.';
  }

  @override
  String get chatMessageFailedToSend => 'Falha ao enviar mensagem';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Sua mensagem não pôde ser entregue. Isso geralmente ocorre porque você não compartilha uma comunidade com o destinatário ou o destinatário só aceita mensagens diretas de amigos. Você também pode precisar ajustar suas próprias configurações de privacidade de mensagens diretas em $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Sua mensagem não pôde ser entregue. Você precisa reivindicar sua conta para enviar mensagens diretas.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Sua mensagem não pôde ser entregue. Você precisa reivindicar sua conta para enviar mensagens.';

  @override
  String get chatSendFailureContentBlocked =>
      'Sua mensagem não pôde ser entregue porque foi sinalizada por nossos sistemas de segurança. Se você acredita que isso é um erro, entre em contato com o suporte.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Sua mensagem não pôde ser entregue porque contém emojis ou stickers adultos que não são permitidos neste contexto.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'Somente você pode ver esta mensagem.';

  @override
  String get chatClientSystemDismiss => 'Dispensar';

  @override
  String get privacyDashboardCommunicationSection => 'Comunicação';

  @override
  String get privacyDashboardProfilePrivacySection => 'Privacidade do perfil';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Amigos e mensagens diretas';

  @override
  String get privacyDashboardActivitySharingSection =>
      'Compartilhamento de atividade';

  @override
  String get privacyDashboardSensitiveContentSection => 'Conteúdo sensível';

  @override
  String get privacyDashboardDataExportSection => 'Exportar dados';

  @override
  String get privacyDashboardDataDeletionSection => 'Exclusão de dados';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Quem pode ver seu perfil completo';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Amigos e todas as comunidades';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Seu perfil completo fica visível para amigos e para todos nas suas comunidades';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Apenas amigos e comunidades pequenas';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Seu perfil completo fica visível para amigos e membros de comunidades com 200 membros ou menos';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Apenas amigos';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Seu perfil completo fica visível apenas para seus amigos';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Solicitações de amizade';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Todos';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Permitir que qualquer pessoa envie solicitações de amizade';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Amigos de amigos';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Permitir que amigos dos seus amigos enviem solicitações para você';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Membros da comunidade';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Permitir que membros de comunidades em que você está enviem solicitações para você';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Mensagens diretas';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Permitir mensagens diretas de membros da comunidade';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Permitir que membros de comunidades das quais você participa enviem mensagens diretas para você';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Permitir mensagens diretas de bots da comunidade';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Permitir que bots de comunidades em que você está enviem mensagens diretas';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Controle quem pode enviar solicitações de amizade e mensagens diretas para você';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Controle quem pode te ligar e te adicionar em conversas em grupo';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Chamadas recebidas';

  @override
  String get privacyDashboardIncomingCallsDesc => 'Controle quem pode te ligar';

  @override
  String get privacyDashboardAllowedCallers => 'Chamadores permitidos';

  @override
  String get privacyDashboardIncomingCallNobody => 'Ninguém';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Bloquear todas as chamadas recebidas';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Somente amigos';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Permitir que apenas amigos te liguem (recomendado)';

  @override
  String get privacyDashboardIncomingCallCustom => 'Amigos + Personalizado';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Permitir amigos e grupos adicionais que você escolher';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Todos';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Permitir que qualquer pessoa ligue para você, mesmo desconhecidos';

  @override
  String get privacyDashboardAdditionalGroups => 'Grupos Adicionais';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'Pessoas que são amigas dos seus amigos podem te ligar';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'Pessoas de comunidades em que vocês dois estão podem te ligar';

  @override
  String get privacyDashboardRingBehavior => 'Comportamento do anel';

  @override
  String get privacyDashboardSilentCalls => 'Chamadas silenciosas de todos';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'Todas as chamadas notificarão silenciosamente em vez de tocar. Por padrão, chamadas de não amigos são sempre silenciosas.';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Quem pode adicionar você a grupos';

  @override
  String get privacyDashboardGroupDmDesc =>
      'Controle quem pode te adicionar a grupos sem pedir. Qualquer pessoa ainda pode te enviar links de convite para entrar.';

  @override
  String get privacyDashboardAllowedInvites => 'Convites permitidos';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Não deixe que ninguém te adicione a grupos sem perguntar';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Permitir que apenas amigos adicionem você sem pedir (recomendado)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Permitir que amigos e grupos adicionais adicionem você';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Permitir que qualquer pessoa adicione você a chats em grupo sem pedir';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'Pessoas que são amigas dos seus amigos podem te adicionar em conversas em grupo';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'Pessoas de comunidades em que vocês dois estão podem te adicionar em conversas em grupo';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Atividade de voz no \"ativo agora\"';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Compartilhar sua atividade de voz com amigos';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Compartilhar atividade de voz com todos os amigos?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Parar de compartilhar a atividade de voz com todos os amigos?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Você está prestes a começar a compartilhar sua atividade de voz com todos os seus amigos, incluindo os futuros. Isso enviará uma atualização para todos eles e só poderá ser alterado novamente em 24 horas.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Você está prestes a parar de compartilhar sua atividade de voz com todos os seus amigos, incluindo os futuros. Isso enviará uma atualização para todos eles e só poderá ser alterado novamente em 24 horas.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Sim, compartilhar com todos os amigos';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm =>
      'Sim, parar de compartilhar';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Disponível novamente em $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Compartilhamento de atividade de voz atualizado';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Não foi possível atualizar o compartilhamento de atividade de voz agora';

  @override
  String get privacyDashboardDataExportDesc =>
      'Crie um arquivo para download dos dados da sua conta, incluindo mensagens e URLs de anexos. A maioria das pessoas quer tudo, mas você pode restringir o escopo abaixo.';

  @override
  String get privacyDashboardExportMyData => 'Exportar meus dados';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Remove permanentemente as mensagens que você enviou em DMs, DMs em grupo e comunidades. O processo é executado em segundo plano e você receberá uma DM quando ele for concluído.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Excluir minhas mensagens';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Permitir mensagens diretas de membros da comunidade?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Bloquear mensagens diretas de membros da comunidade?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Permitir que bots enviem mensagens diretas para você?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Bloquear bots de enviar mensagens diretas para você?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Você também quer permitir mensagens diretas de membros das suas comunidades existentes?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Você também quer bloquear mensagens diretas de membros das suas comunidades atuais?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Você também quer permitir que bots das suas comunidades atuais enviem mensagens diretas para você?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Você também quer bloquear bots das suas comunidades existentes?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'Você também pode alterar esta configuração por comunidade, pressionando longamente o nome da comunidade e selecionando Configurações de privacidade.';

  @override
  String get privacyDashboardDmConfirmAllowAll =>
      'Permitir para todas as comunidades';

  @override
  String get privacyDashboardDmConfirmBlockAll =>
      'Bloquear em todas as comunidades';

  @override
  String get privacyDashboardDmConfirmSkip => 'Pular esta etapa';

  @override
  String get privacyDashboardDataRequestGoBack => 'Voltar';

  @override
  String get privacyDashboardDataRequestExportTitle => 'Exportar meus dados';

  @override
  String get privacyDashboardDataRequestDeleteTitle =>
      'Excluir minhas mensagens';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'Processaremos isso o mais rápido possível. Você receberá um e-mail quando seu arquivo estiver pronto.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'Processaremos isso o mais rápido possível. Você receberá uma DM nossa quando estiver pronto.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'O que incluir';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Tudo';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Exporte todas as mensagens que você já enviou, além de todas as configurações da sua conta, associações e metadados.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'Seleção personalizada';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Escolha quais tipos de conversa, comunidades e período incluir no arquivo.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Escolha o que incluir';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Escolha quais tipos de conversas limpar.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Apenas locais que não consigo mais acessar';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Excluir mensagens apenas de comunidades e DMs em grupo das quais você saiu ou foi removido.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Quais conversas';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Ative os tipos de conversas que você quer incluir.';

  @override
  String get privacyDashboardDataRequestKindDms => 'DMs abertas';

  @override
  String get privacyDashboardDataRequestKindDmsClosed => 'DMs fechadas';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'DMs em grupo';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Comunidades';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Quais comunidades';

  @override
  String get privacyDashboardDataRequestGuildFilterMode =>
      'Filtro da comunidade';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Incluir todos, exceto os selecionados';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude =>
      'Apenas os selecionados';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'Você não faz parte de nenhuma comunidade no momento.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Período';

  @override
  String get privacyDashboardDataRequestDateMode => 'Período';

  @override
  String get privacyDashboardDataRequestAllTime => 'Todo o período';

  @override
  String get privacyDashboardDataRequestCustomRange =>
      'Intervalo personalizado';

  @override
  String get privacyDashboardDataRequestStartDate => 'Data de início';

  @override
  String get privacyDashboardDataRequestEndDate => 'Data final';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Deixe qualquer um dos campos em branco para deixar essa extremidade da janela ilimitada.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Escolha pelo menos um tipo de conversa para incluir.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'A data de início deve ser anterior à data de término.';

  @override
  String get privacyDashboardDataRequestConfirmTitle => 'Revisar e confirmar';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'Criaremos um arquivo para download com todas as mensagens que você já enviou e enviaremos um e-mail quando estiver pronto. O link de download no e-mail expira após 7 dias.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'Criaremos um arquivo para download que corresponde aos filtros abaixo e enviaremos um e-mail quando estiver pronto. O link de download nesse e-mail expira após 7 dias.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Excluir permanentemente as mensagens que correspondem aos filtros abaixo. Esta ação não pode ser desfeita.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'Não há como recuperar depois de iniciado. Enviaremos uma mensagem direta quando terminar.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'Solicitar exportação';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Apagar mensagens';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Escopo';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'Conversas';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Comunidades';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Período';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'Nenhum';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'A partir de $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'Até $end';
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
      one: '# comunidade',
    );
    return 'Todas, exceto $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# comunidades',
      one: '# comunidade',
    );
    return 'Apenas $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Mensagens diretas abertas';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Mensagens diretas fechadas';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Mensagens diretas (abertas e fechadas)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'DMs em grupo';

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
    return '$_temp0 e $_temp1';
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
      'Falha ao carregar as configurações de privacidade';

  @override
  String get privacyDashboardRetry => 'Tentar novamente';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Falha ao salvar as configurações de conteúdo sensível.';

  @override
  String get privacyDashboardDataRequestFailed =>
      'Falha ao concluir a solicitação.';

  @override
  String get chatMessageDeleteFailed => 'Falha ao excluir mensagem';

  @override
  String get chatMessageAddReaction => 'Adicionar reação';

  @override
  String get chatMessageEdit => 'Editar mensagem';

  @override
  String get chatMessageReply => 'Responder';

  @override
  String get chatMessageForward => 'Encaminhar';

  @override
  String get forwardMessageTitle => 'Encaminhar mensagem';

  @override
  String get forwardSearchHint => 'Pesquisar canais ou DMs';

  @override
  String get forwardDirectMessagesSection => 'Mensagens diretas';

  @override
  String get forwardCommentHint => 'Adicionar um comentário (opcional)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Enviar ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Nenhum canal encontrado';

  @override
  String get forwardSuccessToast => 'Mensagem encaminhada';

  @override
  String get forwardFailed => 'Falha ao encaminhar mensagem';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Comentários indisponíveis porque um canal selecionado tem o modo lento ativado.';

  @override
  String get forwardSendSlowmodeBlocked =>
      'Aguardando o modo lento expirar em um ou mais canais selecionados.';

  @override
  String get slowmodeRateLimitedTitle => 'Modo lento ativado';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'O modo lento está ativado — aguarde $duration antes de enviar outra mensagem.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'Upload direto desativado durante o modo de lentidão.';

  @override
  String get shareMediaTitle => 'Compartilhar em';

  @override
  String get shareMediaMessageHint => 'Adicionar uma mensagem opcional…';

  @override
  String get shareMediaSendButton => 'Enviar';

  @override
  String get shareMediaSuccessToast => 'Mídia compartilhada';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'Compartilhado para $count destinos';
  }

  @override
  String get shareMediaFailedToast => 'Falha ao compartilhar mídia';

  @override
  String get forwardDestinationNoSendPermission =>
      'Você não pode enviar mensagens aqui';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Você não pode incorporar links aqui';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Você não pode anexar arquivos aqui';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Envio de mensagens desativado nesta comunidade';

  @override
  String get forwardDestinationTimedOut =>
      'Você está em modo de espera nesta comunidade';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Modo lento - aguarde $remaining';
  }

  @override
  String get chatMessageCopyText => 'Copiar mensagem';

  @override
  String get chatMessageCopyEmbedText => 'Copiar texto incorporado';

  @override
  String get chatMessageTranslate => 'Traduzir';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Traduzido de $language';
  }

  @override
  String get chatMessageSeeOriginal => 'Ver original';

  @override
  String get chatMessageSeeTranslation => 'Ver tradução';

  @override
  String get chatMessageTranslating => 'Traduzindo…';

  @override
  String get chatMessageTranslateFailed =>
      'Não foi possível traduzir esta mensagem.';

  @override
  String get chatMessageTranslateUnavailable =>
      'A tradução não está disponível neste dispositivo.';

  @override
  String get chatMessageSpeak => 'Falar mensagem';

  @override
  String get chatMessageStopSpeaking => 'Parar de falar';

  @override
  String get chatMessagePin => 'Fixar mensagem';

  @override
  String get chatMessageUnpin => 'Desafixar mensagem';

  @override
  String get chatMessageUnpinIt => 'Desafixar';

  @override
  String get chatMessageBookmark => 'Salvar mensagem';

  @override
  String get chatMessageRemoveBookmark => 'Remover item salvo';

  @override
  String get chatMessageMarkAsUnread => 'Marcar como não lida';

  @override
  String get chatMessageCopyMessageLink => 'Copiar link da mensagem';

  @override
  String get chatMessageOpenLink => 'Abrir link';

  @override
  String get chatMessageCopyLink => 'Copiar link';

  @override
  String get chatMessageCopyMessageId => 'Copiar ID da mensagem';

  @override
  String get chatMessageViewReactions => 'Ver reações';

  @override
  String get chatMessageRemoveAllReactions => 'Remover todas as reações';

  @override
  String get chatMessageDebug => 'Depurar mensagem';

  @override
  String get chatMessageDebugSheetTitle => 'Depurar mensagem';

  @override
  String get chatMessageDebugCopyJson => 'Copiar JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'JSON da mensagem copiado para a área de transferência';

  @override
  String get chatReactionsSheetTitle => 'Reações';

  @override
  String get chatReactionsSheetEmpty => 'Ninguém reagiu a isso ainda.';

  @override
  String get chatReactionAddFailed => 'Falha ao adicionar reação';

  @override
  String get chatReactionRemoveFailed => 'Falha ao remover a reação';

  @override
  String get chatMessageReport => 'Denunciar mensagem';

  @override
  String get iarReportMessageTitle => 'Denunciar mensagem';

  @override
  String get iarThisUserFallback => 'este usuário';

  @override
  String get iarModalDescription =>
      'Denuncie uma violação de regra ou encontre ferramentas para gerenciar contatos e preferências.';

  @override
  String get iarPathStepAriaLabel => 'O que você precisa?';

  @override
  String get iarCategoryStepTitle => 'Que tipo de regra foi quebrada?';

  @override
  String get iarReasonStepTitle => 'Qual regra foi quebrada?';

  @override
  String get iarReasonSelectHint => 'Selecione um motivo';

  @override
  String get iarPickAnOptionToast => 'Selecione uma opção para continuar.';

  @override
  String get iarPickARuleToast => 'Selecione a regra que foi quebrada.';

  @override
  String get iarPathPlatform => 'Denunciar violação de regra da plataforma';

  @override
  String get iarPathCommunity => 'Denunciar aos moderadores desta comunidade';

  @override
  String get iarPathPreferenceMessage => 'Não gosto deste conteúdo';

  @override
  String get iarCategoryTargetedHarmLabel => 'Ameaças, assédio ou danos';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Bullying, ameaças, ódio, violência, invasões ou conteúdo que incentiva a automutilação.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Segurança de menores ou conteúdo adulto';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Menores em risco, conteúdo adulto no lugar errado ou conduta indesejada.';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'Privacidade ou impersonificação';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Exposição de dados pessoais, perseguição, fingir ser outra pessoa ou perfil inadequado.';

  @override
  String get iarCategoryDeceptionLabel => 'Golpes, malware ou desinformação';

  @override
  String get iarCategoryDeceptionDescription =>
      'Phishing, fraude, links maliciosos ou falsas alegações com potencial de causar danos no mundo real.';

  @override
  String get iarCategoryIllegalOtherLabel => 'Atividade ilegal ou algo mais';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Vendas ilegais, facilitação de crimes ou uma violação clara de regras que não se encaixa acima.';

  @override
  String get iarReasonHarassmentLabel => 'Assédio ou ameaças';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Bullying, contato indesejado repetido, perseguição ou abuso direcionado.';

  @override
  String get iarReasonHateLabel => 'Discurso de ódio';

  @override
  String get iarReasonHateMessageDescription =>
      'Insultos, linguagem desumanizante ou ataques a grupos protegidos.';

  @override
  String get iarReasonViolenceLabel => 'Violência ou ameaças violentas';

  @override
  String get iarReasonViolenceDescription =>
      'Ameaças críveis, violência gráfica ou glorificação da violência.';

  @override
  String get iarReasonMatureContentLabel => 'Conteúdo adulto ou assédio';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Conduta indesejada ou conteúdo adulto no lugar errado.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Segurança de menores ou exploração de menores';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Conteúdo de aliciamento ou exploração infantil.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Desinformação prejudicial';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Falsas alegações com potencial de causar danos no mundo real.';

  @override
  String get iarReasonSpamLabel => 'Spam, golpes ou phishing';

  @override
  String get iarReasonSpamMessageDescription =>
      'Spam em massa, fraude, sorteios falsos ou abuso de conta.';

  @override
  String get iarReasonMalwareLabel => 'Malware ou links perigosos';

  @override
  String get iarReasonMalwareDescription =>
      'Malware, roubo de credenciais ou arquivos perigosos.';

  @override
  String get iarReasonPrivacyLabel => 'Violação de privacidade';

  @override
  String get iarReasonPrivacyDescription =>
      'Exposição de dados pessoais, informações privadas expostas ou perseguição.';

  @override
  String get iarReasonImpersonationLabel =>
      'Impersonificação ou mídia enganosa';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Fingir ser outra pessoa, incluindo conteúdo gerado por IA enganoso.';

  @override
  String get iarReasonIllegalLabel => 'Atividade ilegal';

  @override
  String get iarReasonIllegalDescription =>
      'Vendas ilegais, facilitação de crimes ou atividade ilegal.';

  @override
  String get iarReasonSelfHarmLabel => 'Automutilação ou suicídio';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Promoção ou instruções que incentivam automutilação ou transtornos alimentares.';

  @override
  String get iarReasonOtherLabel => 'Outra violação clara de regras';

  @override
  String iarReasonOtherDescription(String productName) {
    return 'Use apenas se violar claramente as regras do $productName e não se encaixar nas opções acima.';
  }

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Se um menor estiver envolvido, use \"$childSafetyReason\" em vez disso.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Se isso envolver CSAM ou exploração de um menor, envie agora e não compartilhe o material novamente.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Se alguém estiver em perigo imediato, entre em contato com os serviços de emergência locais, se puder fazer isso com segurança.';

  @override
  String get iarSafetyNoteViolence =>
      'Se esta for uma ameaça iminente crível, entre em contato com os serviços de emergência locais também.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Se esta for uma ameaça terrorista iminente, entre em contato com os serviços de emergência locais também.';

  @override
  String get iarActionBlockUserTitle => 'Bloquear este usuário';

  @override
  String get iarActionBlockUserDescription =>
      'Interromper mensagens e pedidos de amizade.';

  @override
  String get iarActionBlockUserButton => 'Bloquear';

  @override
  String get iarActionCopyMessageLinkTitle => 'Copiar link da mensagem';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Compartilhar com moderadores da comunidade.';

  @override
  String get iarActionCopyMessageLinkButton => 'Copiar';

  @override
  String get iarActionCloseDmTitle => 'Fechar esta DM';

  @override
  String get iarActionCloseDmDescription =>
      'Não bloqueia. Você pode reabrir mais tarde.';

  @override
  String get iarActionCloseDmButton => 'Fechar DM';

  @override
  String get iarActionLeaveCommunityTitle => 'Sair da comunidade';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Pare de ver seu conteúdo e membros.';

  @override
  String get iarActionLeaveCommunityButton => 'Sair';

  @override
  String get iarActionDmSettingsTitle =>
      'Configurações de DM e solicitação de amizade';

  @override
  String get iarActionDmSettingsDescription => 'Mude quem pode te contatar.';

  @override
  String get iarActionCallSettingsTitle =>
      'Configurações de chamada e chat em grupo';

  @override
  String get iarActionCallSettingsDescription =>
      'Mude quem pode te ligar ou adicionar.';

  @override
  String get iarActionOpenButton => 'Abrir';

  @override
  String get iarActionDeleteMessageTitle => 'Excluir esta mensagem';

  @override
  String get iarActionDeleteMessageDescription =>
      'Remova-a do canal para todos.';

  @override
  String get iarActionDeleteMessageButton => 'Excluir';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Excluída';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Esta mensagem já foi excluída.';

  @override
  String get iarActionBanUserTitle => 'Banir este usuário';

  @override
  String get iarActionBanUserDescription =>
      'Abra a caixa de diálogo de banimento para esta comunidade.';

  @override
  String get iarActionBanUserButton => 'Banir';

  @override
  String get iarActionBanUserBannedButton => 'Banido';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Este usuário já está banido da comunidade.';

  @override
  String get iarCloseDmConfirmTitle => 'Fechar DM';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Feche sua DM atual com $name. Isso não te bloqueia; você pode reabrir mais tarde.';
  }

  @override
  String get iarSuccessTitle => 'Denúncia enviada';

  @override
  String get iarSuccessBody =>
      'Nossa equipe de segurança está analisando. Enviaremos uma DM e um e-mail assim que tivermos um veredito.';

  @override
  String get iarAlreadyReportedTitle => 'Já denunciado';

  @override
  String get iarAlreadyReportedBody =>
      'Você já denunciou esta mensagem. Nossa equipe de segurança está analisando.';

  @override
  String get iarBackButton => 'Voltar';

  @override
  String get iarContinueButton => 'Continuar';

  @override
  String get iarSendReportButton => 'Enviar denúncia';

  @override
  String get iarDoneButton => 'Concluído';

  @override
  String get iarCouldntSendToast =>
      'Não foi possível enviar a denúncia. Tente novamente.';

  @override
  String get iarRateLimitedToast =>
      'Você está denunciando muito rápido. Aguarde um momento e tente novamente.';

  @override
  String get iarReportSentToast =>
      'Denúncia enviada. Nossa equipe de segurança analisará.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Bloquear $name? Eles não poderão te enviar mensagens ou solicitações de amizade. Você pode desbloqueá-los mais tarde.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Não foi possível bloquear este usuário. Tente novamente.';

  @override
  String get iarCloseDmSuccessToast => 'DM fechada.';

  @override
  String get iarCloseDmFailedToast =>
      'Não foi possível fechar esta DM. Tente novamente.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Não foi possível sair desta comunidade. Tente novamente.';

  @override
  String get chatMessageSuppressEmbeds => 'Ocultar Embeds';

  @override
  String get chatMessageUnsuppressEmbeds => 'Mostrar Embeds';

  @override
  String get chatMessageDelete => 'Excluir Mensagem';

  @override
  String get chatMessageDeleteConfirmTitle => 'Excluir Mensagem';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Tem certeza de que deseja excluir esta mensagem?';

  @override
  String get chatMessageDeleteAttachment => 'Excluir anexo';

  @override
  String get chatMessageEditAttachmentAltText => 'Editar texto alternativo';

  @override
  String get chatMessageMore => 'Mais';

  @override
  String get chatEditingMessage => 'Editando mensagem';

  @override
  String get chatReplyOriginalDeleted => 'Mensagem original foi excluída';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Falha ao carregar mensagem original';

  @override
  String get chatReplyAttachedMedia => 'Mensagem contém mídia anexada';

  @override
  String chatBlockedMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mensagens bloqueadas',
      one: '1 mensagem bloqueada',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mensagens de spam em potencial',
      one: '1 mensagem de spam em potencial',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Resposta oculta porque o autor original está bloqueado.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Resposta oculta porque o autor original foi marcado como spammer.';

  @override
  String get devMarkAsSpamLocally => 'Marcar como spam (somente para mim)';

  @override
  String get devIgnoreSpamFlag => 'Ignorar sinalização de spam';

  @override
  String get chatMessagesLoadError => 'Não foi possível carregar mensagens.';

  @override
  String get chatReplyMentionOverrideTitle => 'Ignorar preferência de menção?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname prefere ser @mencionado em respostas. Enviar sem a menção mesmo assim?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname prefere respostas sem @menção. Enviar com a menção mesmo assim?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ignorar preferência';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Clique para desativar o ping do usuário para quem você está respondendo.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Clique para ativar o ping do usuário para quem você está respondendo.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Mencionar usuário respondido';

  @override
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

  @override
  String get chatReplyCancel => 'Cancelar resposta';

  @override
  String get chatEditMessageHint => 'Editar mensagem';

  @override
  String get chatEditNoChanges => 'Nenhuma alteração para salvar';

  @override
  String get chatChannelNotReady =>
      'Este canal ainda não está pronto. Tente novamente em um momento.';

  @override
  String get chatMessageEdited => '(editada)';

  @override
  String get chatMessageSilent => 'Esta foi uma mensagem @silent.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Hoje às $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Ontem às $time';
  }

  @override
  String get mediaViewerImagePreview => 'Prévia da imagem';

  @override
  String get mediaViewerClose => 'Fechar visualizador de mídia';

  @override
  String get mediaViewerOpenInBrowser => 'Abrir no navegador';

  @override
  String get mediaViewerOptions => 'Opções de mídia';

  @override
  String get mediaViewerCopyLink => 'Copiar link';

  @override
  String get mediaViewerForward => 'Encaminhar';

  @override
  String get mediaViewerZoomIn => 'Aumentar zoom';

  @override
  String get mediaViewerZoomOut => 'Diminuir zoom';

  @override
  String get mediaViewerPreviousAttachment => 'Anexo anterior';

  @override
  String get mediaViewerNextAttachment => 'Próximo anexo';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String mediaViewerAttachmentThumbnail(int index) {
    return 'Anexo $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Dispensar';

  @override
  String get chatAttachmentVideoToggleControls => 'Alternar controles de vídeo';

  @override
  String get chatAttachmentVideoMute => 'Silenciar vídeo';

  @override
  String get chatAttachmentVideoUnmute => 'Ativar som do vídeo';

  @override
  String get chatAttachmentVideoPlay => 'Reproduzir vídeo';

  @override
  String get chatAttachmentVideoPause => 'Pausar vídeo';

  @override
  String get chatAttachmentVideoProgress => 'Progresso do vídeo';

  @override
  String get chatVideoPlaybackFailed =>
      'Não foi possível reproduzir este vídeo.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Notificar usuários com esta função que têm permissão para ver este canal.';

  @override
  String get composerAutocompleteSuggestions => 'Sugestões';

  @override
  String get composerAutocompleteCommandsHeading => 'Comandos';

  @override
  String get composerAutocompleteChoicesHeading => 'Opções';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'Argumentos opcionais';

  @override
  String get composerAutocompleteChannelsHeading => 'Canais';

  @override
  String get composerAutocompleteMembersHeading => 'Membros';

  @override
  String get composerAutocompleteUsersHeading => 'Usuários';

  @override
  String get composerAutocompleteMentionsHeading => 'Menções';

  @override
  String get composerAutocompleteRolesHeading => 'Cargos';

  @override
  String get composerAutocompleteMediaHeading => 'Mídia';

  @override
  String get composerAutocompleteStickersHeading => 'Figurinhas';

  @override
  String get composerAutocompleteGifsHeading => 'GIFs';

  @override
  String get composerAutocompleteNoGifs => 'Nenhum GIF encontrado';

  @override
  String get composerCommandShrugDescription =>
      'Anexa ¯\\_(ツ)_/¯ à sua mensagem.';

  @override
  String get composerCommandTableflipDescription =>
      'Anexa (╯°□°)╯︵ ┻━┻ à sua mensagem.';

  @override
  String get composerCommandUnflipDescription =>
      'Adiciona ┬─┬ ノ( ゜-゜ノ) à sua mensagem.';

  @override
  String get composerCommandMeDescription =>
      'Enviar uma mensagem de ação (em itálico).';

  @override
  String get composerCommandSpoilerDescription =>
      'Enviar uma mensagem com spoiler (envolve em tags de spoiler).';

  @override
  String get composerCommandTtsDescription =>
      'Enviar uma mensagem de texto para fala.';

  @override
  String get composerCommandNickDescription =>
      'Mude seu apelido nesta comunidade.';

  @override
  String get composerCommandKickDescription =>
      'Remover um membro desta comunidade.';

  @override
  String get composerCommandBanDescription =>
      'Banir um membro desta comunidade.';

  @override
  String get composerCommandMsgDescription =>
      'Enviar uma mensagem direta para um usuário.';

  @override
  String get composerCommandSavedDescription =>
      'Enviar um item de mídia salvo.';

  @override
  String get composerCommandStickerDescription => 'Enviar um figurinha.';

  @override
  String get composerCommandGifDescription => 'Pesquisar e enviar um GIF.';

  @override
  String get composerCommandMemberOption => 'O membro a ser alvo.';

  @override
  String get composerCommandReasonOption => 'Motivo (opcional).';

  @override
  String get composerCommandMessageOption => 'A mensagem a ser enviada.';

  @override
  String get composerCommandQueryOption => 'O que procurar.';

  @override
  String get composerCommandNicknameOption =>
      'Seu novo apelido, ou deixe em branco para redefinir.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'Quanto do histórico de mensagens recentes do membro excluir.';

  @override
  String get composerCommandDeleteMessagesNone => 'Não excluir nenhuma';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Dias anteriores $count';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'Últimas 24 horas';

  @override
  String get composerCommandOptionRequired =>
      'Esta opção é obrigatória. Por favor, forneça um valor.';

  @override
  String get composerCommandClear => 'Limpar comando';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'Você mudou seu apelido nesta comunidade de **$previousNickname** para **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'Usuário desconhecido';

  @override
  String composerCommandMsgFailed(String username) {
    return 'Falha ao enviar uma mensagem para **$username**. Talvez o usuário tenha desativado as DMs ou bloqueado você.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count a mais';
  }

  @override
  String get addGuildModalTitle => 'Adicionar uma comunidade';

  @override
  String get addGuildModalLandingDescription =>
      'Crie uma nova comunidade ou entre em uma existente.';

  @override
  String get addGuildCreateCommunity => 'Criar comunidade';

  @override
  String get addGuildJoinCommunity => 'Entrar na comunidade';

  @override
  String get addGuildImportDiscordTemplate => 'Importar modelo do Discord';

  @override
  String get addGuildJoinTitle => 'Entrar em uma comunidade';

  @override
  String get addGuildJoinDescription =>
      'Digite o link de convite para entrar em uma comunidade.';

  @override
  String get addGuildInviteLinkLabel => 'Link de convite';

  @override
  String get addGuildJoinSubmit => 'Entrar na comunidade';

  @override
  String get addGuildInviteInvalid => 'Este convite é inválido ou expirou.';

  @override
  String get addGuildJoinFailed =>
      'Não foi possível entrar na comunidade. Por favor, tente novamente.';

  @override
  String get addGuildCreateTitle => 'Criar uma comunidade';

  @override
  String get addGuildCreateDescription =>
      'Crie uma comunidade para você e seus amigos conversarem.';

  @override
  String get addGuildCreateNameLabel => 'Nome da comunidade';

  @override
  String get addGuildCreateSubmit => 'Criar comunidade';

  @override
  String get addGuildCreateFailed =>
      'Não foi possível criar a comunidade. Tente novamente.';

  @override
  String get addGuildCreateClaimTitle => 'Resgate sua conta';

  @override
  String get addGuildCreateClaimDescription =>
      'Você precisa reivindicar sua conta antes de poder criar uma comunidade.';

  @override
  String get addGuildCreateVerifyTitle => 'Verifique seu e-mail';

  @override
  String get addGuildCreateVerifyDescription =>
      'Você precisa verificar seu endereço de e-mail antes de poder criar uma comunidade.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Ícones animados não são suportados ao se criar uma nova comunidade. Use uma imagem estática.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'Ao criar uma comunidade, você concorda em seguir e assegurar as ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return '$productName diretrizes de comunidades';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'Esta instância é uma comunidade única, portanto, comunidades adicionais não podem ser criadas.';

  @override
  String get addGuildCreateChangeIcon => 'Mudar ícone';

  @override
  String get addGuildCreateIconLabel => 'Ícone da comunidade';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Máx. 10MB. Recomendado: 512×512px';

  @override
  String get addGuildImportDescription =>
      'Cole um URL de modelo do Discord para importar a estrutura dele para uma nova comunidade.';

  @override
  String get addGuildImportUrlLabel => 'URL do modelo';

  @override
  String get addGuildImportUrlInvalid =>
      'Insira um URL ou código de modelo do Discord válido.';

  @override
  String get addGuildImportFetchFailed =>
      'Falha ao buscar o modelo da comunidade. O modelo pode não existir ou o serviço externo está indisponível.';

  @override
  String get addGuildImportInvalidResponse =>
      'Esta não parece ser uma resposta de modelo válida.';

  @override
  String get addGuildImportTemplateLabel => 'Modelo';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount de texto, $voiceChannelCount de voz, $categoryCount categorias, $roleCount cargos';
  }

  @override
  String get addGuildImportRemoveIcon => 'Remover ícone';

  @override
  String get addGuildImportTemplateInvalid =>
      'Os dados do modelo da comunidade são inválidos ou estão mal formatados.';

  @override
  String get addGuildPackInstalled => 'Pacote instalado com sucesso.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Remover Todas as Reações';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Tem certeza de que deseja remover todas as reações desta mensagem?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Desafixar mensagem';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Enviar este pin de volta no tempo?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username fixou $messageLink neste canal. Ver $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'uma mensagem';

  @override
  String get systemPinMessageAllPinsLink => 'todas as mensagens fixadas';

  @override
  String get channelPinsEmptyTitle => 'Nenhuma mensagem fixada';

  @override
  String get channelPinsEmptyDescription => 'Mensagens fixadas aparecem aqui.';

  @override
  String get channelDetailsFallbackTitle => 'Detalhes';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'DM em grupo · $count membros';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'Encerrar sua conversa com $name?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'Sair de $name?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Configurações do canal';

  @override
  String get channelDetailsGroupSettingsTitle => 'Configurações do grupo';

  @override
  String get channelDetailsDmSettingsTitle => 'Configurações da conversa';

  @override
  String get channelDetailsInvitePeople => 'Convidar pessoas';

  @override
  String get channelDetailsCopyLink => 'Copiar link';

  @override
  String get channelMenuCopyChannelLink => 'Copiar link do canal';

  @override
  String get channelMenuCopyRedirectLink => 'Copiar link de redirecionamento';

  @override
  String get channelDetailsAddFriendsToGroup => 'Adicionar amigos ao grupo';

  @override
  String get channelDetailsGroupInvites => 'Convites para o grupo';

  @override
  String get channelDetailsEditChannel => 'Editar canal';

  @override
  String get channelDetailsDeleteChannel => 'Excluir canal';

  @override
  String get channelSettingsCategorySettingsTitle =>
      'Configurações de categoria';

  @override
  String get channelSettingsEditCategory => 'Editar categoria';

  @override
  String get channelSettingsTabOverview => 'Visão geral';

  @override
  String get channelSettingsTabPermissions => 'Permissões';

  @override
  String get channelSettingsTabInvites => 'Convites';

  @override
  String get channelSettingsTabWebhooks => 'Webhooks';

  @override
  String get channelSettingsDeleteChannel => 'Excluir canal';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'Tem certeza de que deseja excluir $channelName? Esta ação não pode ser desfeita.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'Tem certeza de que deseja excluir $categoryName? Esta ação não pode ser desfeita.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Excluir categoria';

  @override
  String get channelSettingsChannelUpdated => 'Canal atualizado';

  @override
  String get channelSettingsChannelName => 'Nome do canal';

  @override
  String get channelSettingsCategoryName => 'Nome da categoria';

  @override
  String get channelSettingsMyCategory => 'Minha categoria';

  @override
  String get categoryExpandCategory => 'Expandir categoria';

  @override
  String get categoryCollapseCategory => 'Recolher categoria';

  @override
  String get categoryExpandAllCategories => 'Expandir todas as categorias';

  @override
  String get categoryCollapseAllCategories => 'Recolher todas as categorias';

  @override
  String get categoryMuteCategory => 'Silenciar categoria';

  @override
  String get categoryUnmuteCategory => 'Reativar categoria';

  @override
  String get categoryCopyCategoryId => 'Copiar ID da categoria';

  @override
  String get categoryIdCopied => 'ID da categoria copiado';

  @override
  String get channelSettingsChannelNamePlaceholder => 'geral';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'Assunto';

  @override
  String get channelSettingsTopicPlaceholder =>
      'Adicionar um tópico a este canal';

  @override
  String get channelSettingsInsertEmoji => 'Inserir emoji';

  @override
  String get channelSettingsTopicTooLongTitle =>
      'O tópico do canal é muito longo.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'Encurte o tópico e tente novamente.';

  @override
  String get channelSettingsSlowmode => 'Modo lento';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Tempo entre mensagens. \"$bypassSlowmodePermissionLabel\" pode ignorar isso.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Desativado';

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
  String get channelSettingsVoiceQuality => 'Qualidade da voz';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'Maior taxa de bits = melhor qualidade e maior uso de largura de banda.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbps';
  }

  @override
  String get channelSettingsParticipantLimit => 'Limite de participantes';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Número máximo de membros que podem entrar de uma vez. 0 significa ilimitado.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count participantes',
      one: '1 participante',
      zero: '∞ Sem limite',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Limite de conexões';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Número máximo de conexões ativas que um membro pode manter neste canal.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count conexões',
      one: '1 conexão',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Região de voz';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Selecione uma região de voz para este canal. Automático usa a região mais próxima.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Automático';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'Não foi possível carregar as regiões de voz';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Tente novamente em alguns instantes.';

  @override
  String get channelSettingsResetSlider =>
      'Redefinir controle deslizante para o valor padrão';

  @override
  String get channelSettingsAdvanced => 'Avançado';

  @override
  String get channelSettingsMatureContentOverride =>
      'Substituir conteúdo adulto';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Substituir a configuração de nível $scopeLevel para este canal. Conteúdo adulto será exibido atrás de uma tela de aviso antes da entrada.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Herdar';

  @override
  String get channelSettingsMatureContentOn => 'Ativado';

  @override
  String get channelSettingsMatureContentOff => 'Desativado';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Marca este canal como conteúdo adulto.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Deixar este canal liberado para conteúdo adulto.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Herdado de $inheritedSourceLabel: ativado';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Herdado de $inheritedSourceLabel: desativado';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'categoria';

  @override
  String get channelSettingsMatureContentCommunitySource => 'comunidade';

  @override
  String get channelSettingsMatureContentCategoryScope => 'Categoria';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Comunidade';

  @override
  String get channelSettingsContentWarningToggle =>
      'Mostrar aviso de conteúdo neste canal';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Ativa um prompt de consentimento antes de entrar neste canal.';

  @override
  String get channelSettingsContentWarningText =>
      'Texto de aviso personalizado';

  @override
  String get channelSettingsContentWarningDefault =>
      'Este conteúdo pode ser sensível.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'Você precisa da permissão \"$manageChannelsPermissionLabel\" para editar estas permissões.';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'Você precisa da permissão \"$manageRolesPermissionLabel\" para editar estas permissões.';
  }

  @override
  String get channelSettingsUnknownRole => 'Função desconhecida';

  @override
  String get channelSettingsUnknownUser => 'Usuário desconhecido';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides =>
      'Substituições de acesso';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Editar acesso para $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'Voltar para substituições';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Definir acesso padrão para este canal';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Configurar exceções para esta função';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Configurar permissões específicas para este membro';

  @override
  String get channelSettingsPermissionsSearchPlaceholder =>
      'Pesquisar permissões…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Acesso ao canal atualizado';

  @override
  String get channelSettingsPermissionsTitle => 'Controle de acesso';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'Este canal está sincronizado com a categoria pai ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'Este canal não está sincronizado com a categoria principal ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory =>
      'Sincronizar com a categoria';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'Canal sincronizado com a categoria principal';

  @override
  String get channelSettingsPermissionsAddOverride => 'Adicionar exceção';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Pesquisar cargos ou membros…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => 'Cargos e membros';

  @override
  String get channelSettingsDeleteInvite => 'Excluir convite';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Excluir este convite? Não poderá ser desfeito.';

  @override
  String get channelSettingsCopyInviteCode => 'Copiar código de convite';

  @override
  String get channelSettingsCopyInviteUrl => 'Copiar link de convite';

  @override
  String get channelSettingsWebhookCreated => 'Webhook criado';

  @override
  String get channelSettingsWebhookCreateFailed =>
      'Não foi possível criar o webhook';

  @override
  String get channelSettingsCreateWebhook => 'Criar webhook';

  @override
  String get channelSettingsInvitesDescription =>
      'Gerenciar links de convite para este canal.';

  @override
  String get channelSettingsInvitesCreate => 'Criar convite';

  @override
  String get channelSettingsInvitesEmpty => 'Nenhum link de convite';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'Este canal ainda não tem links de convite. Crie um para convidar pessoas para este canal.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Ocorreu um erro ao carregar os links de convite para este canal. Tente novamente.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Gerencie webhooks de entrada que podem publicar mensagens neste canal.';

  @override
  String get channelSettingsWebhooksEmpty => 'Nenhum webhook';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'Não há webhooks configurados para este canal. Crie um webhook para permitir que aplicativos externos publiquem mensagens.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Este canal não aceita webhooks.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'Você precisa da permissão \"$permission\" para ver e editar webhooks para este canal.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'Não foi possível carregar os webhooks';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Ocorreu um erro ao carregar os webhooks deste canal. Tente novamente.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Criado por $creator em $date';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'Usuário desconhecido';

  @override
  String get channelSettingsWebhooksAvatar => 'Avatar';

  @override
  String get channelSettingsWebhooksUploadImage => 'Carregar imagem';

  @override
  String get channelSettingsWebhooksRemove => 'Remover';

  @override
  String get channelSettingsWebhooksName => 'Nome';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Nome do webhook';

  @override
  String get channelSettingsWebhooksChannel => 'Canal';

  @override
  String get channelSettingsWebhooksUrl => 'URL do webhook';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Copiar URL do webhook';

  @override
  String get channelSettingsWebhooksDelete => 'Excluir webhook';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'Não foi possível excluir este webhook';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'Excluir este webhook? Não pode ser desfeito.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Tente novamente em alguns instantes.';

  @override
  String get channelMenuOpenChat => 'Abrir chat';

  @override
  String get channelMenuDuplicateChannel => 'Duplicar canal';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Redefinir o estado do acordo de conteúdo adulto';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Excluir suas mensagens neste canal?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Isso vai apagar permanentemente todas as mensagens que você já enviou neste canal. Esta ação não pode ser desfeita.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Excluir minhas mensagens';

  @override
  String get channelMenuDeletedYourMessages => 'Mensagens excluídas';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'Não foi possível excluir suas mensagens';

  @override
  String get channelDetailsSystemMessage => 'Mensagem do sistema';

  @override
  String get channelDetailsTextChannel => 'Canal de texto';

  @override
  String get channelDetailsVoiceChannel => 'Canal de voz';

  @override
  String get channelDetailsCategory => 'Categoria';

  @override
  String get channelDetailsLinkChannel => 'Vincular canal';

  @override
  String get channelDetailsGenericChannel => 'Canal';

  @override
  String get channelDetailsMutedConversation => 'Conversa silenciada';

  @override
  String get channelDetailsUnmutedConversation => 'Conversa sem som ativado';

  @override
  String get channelDetailsMutedChannel => 'Canal silenciado';

  @override
  String get channelDetailsUnmutedChannel => 'Canal reativado';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Configurações de notificação atualizadas';

  @override
  String get channelDetailsTabMembers => 'Membros';

  @override
  String get channelDetailsTabPins => 'Fixados';

  @override
  String get channelDetailsActionMute => 'Silenciar';

  @override
  String get channelDetailsActionUnmute => 'Reativar som';

  @override
  String get channelDetailsActionSearch => 'Pesquisar';

  @override
  String get channelDetailsActionMore => 'Mais';

  @override
  String get channelDetailsMembersEmptyTitle => 'Nenhum membro para mostrar';

  @override
  String get channelDetailsMembersEmptyBody =>
      'Os membros aparecerão aqui assim que os dados da comunidade forem carregados.';

  @override
  String get memberListPermissionDeniedTitle => 'Não é possível ver os membros';

  @override
  String get memberListPermissionDeniedBody =>
      'Não é possível ver os membros deste canal nesta comunidade';

  @override
  String get memberListUnavailableTitle => 'Lista de membros indisponível';

  @override
  String get memberListUnavailableBody =>
      'As listas de membros estão temporariamente indisponíveis nesta comunidade';

  @override
  String get channelDetailsPinsLoadFailedTitle =>
      'Não foi possível carregar os Pins';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'Membros com a permissão \"Fixar mensagens\" podem fixar mensagens para que todos vejam.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'Você pode fixar mensagens nesta conversa para que todos vejam.';

  @override
  String get channelDetailsPinsEndReached => 'Você chegou ao fim';

  @override
  String get channelHeaderOpenDetails => 'Abrir detalhes do canal';

  @override
  String get channelHeaderPinnedMessages => 'Mensagens fixadas';

  @override
  String get channelHeaderPinnedMessagesUnread =>
      'Mensagens fixadas, não lidas';

  @override
  String get channelHeaderMemberList => 'Lista de membros';

  @override
  String get channelHeaderInbox => 'Caixa de entrada';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Configurações de notificação, silenciado';

  @override
  String get channelDetailsSearchTitle => 'Pesquisar';

  @override
  String get channelDetailsSearchHint => 'Pesquisar mensagens';

  @override
  String get channelDetailsSearchFilterFrom => 'De';

  @override
  String get channelDetailsSearchFilterHas => 'Tem';

  @override
  String get channelDetailsSearchFilterIn => 'Em';

  @override
  String get channelDetailsSearchFilterMentions => 'Menções';

  @override
  String get channelDetailsSearchFilterMore => 'Mais';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Ativa';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count canais';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count usuários';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'Usuário';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Bot';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => 'Filtrar por canal';

  @override
  String get channelDetailsSearchChannelsHint => 'Buscar canais';

  @override
  String get channelDetailsSearchChannelsEmpty => 'Nenhum canal encontrado';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Fixados';

  @override
  String get channelDetailsSearchPinnedTrue => 'Somente fixadas';

  @override
  String get channelDetailsSearchPinnedFalse => 'Excluir fixados';

  @override
  String get channelDetailsSearchClearFilter => 'Limpar';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Tipo de autor';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Data';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Modo de data';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Selecionar uma data';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Nome do host do link';

  @override
  String get channelDetailsSearchMoreFiltersFileName =>
      'Nome do arquivo contém';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'Extensão do arquivo';

  @override
  String get channelDetailsSearchContentPoll => 'Enquete';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'Mensagens com uma enquete';

  @override
  String get channelDetailsSearchContentForward => 'Encaminhar';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Mensagens encaminhadas';

  @override
  String get channelDetailsSearchFilterSort => 'Ordenar';

  @override
  String get channelHeaderSearchFiltersTitle => 'Filtros de pesquisa';

  @override
  String get channelHeaderSearchRecentTitle => 'Pesquisas recentes';

  @override
  String get channelHeaderSearchUsersTitle => 'Usuários';

  @override
  String get channelHeaderSearchChannelsTitle => 'Canais';

  @override
  String get channelHeaderSearchValuesTitle => 'Valores';

  @override
  String get channelHeaderSearchDatesTitle => 'Datas';

  @override
  String get channelHeaderSearchDefaultBadge => 'Padrão';

  @override
  String get channelHeaderSearchClearHistory => 'Limpar';

  @override
  String get channelHeaderSearchFilterDescFrom => 'um usuário';

  @override
  String get channelHeaderSearchFilterDescMentions => 'um usuário';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'link, embed, imagem, vídeo, som, arquivo, sticker, …';

  @override
  String get channelHeaderSearchFilterDescBefore => 'uma data ou período';

  @override
  String get channelHeaderSearchFilterDescOn => 'uma data ou período';

  @override
  String get channelHeaderSearchFilterDescDuring => 'uma data ou período';

  @override
  String get channelHeaderSearchFilterDescAfter => 'uma data ou período';

  @override
  String get channelHeaderSearchFilterDescIn => 'um canal';

  @override
  String get channelHeaderSearchFilterDescPinned => 'verdadeiro ou falso';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'usuário, bot ou webhook';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'um nome de host, por exemplo, example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'parte de um nome de arquivo anexo';

  @override
  String get channelHeaderSearchFilterDescFileType =>
      'uma extensão de arquivo, ex: png';

  @override
  String get channelHeaderSearchFilterDescSort => 'data ou relevância';

  @override
  String get channelHeaderSearchFilterDescOrder => 'asc ou desc';

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
  String get channelDetailsSearchFilterByUser => 'Filtrar por usuário';

  @override
  String get channelDetailsSearchFilterByContent => 'Filtrar por conteúdo';

  @override
  String get channelDetailsSearchSortBy => 'Ordenar resultados por';

  @override
  String get channelDetailsSearchIn => 'Buscar em';

  @override
  String get channelDetailsSearchEmptyTitle => 'Pesquisar nesta conversa';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Digite um texto, autor ou filtro de conteúdo para encontrar mensagens.';

  @override
  String get channelDetailsSearchIndexingTitle =>
      'Mensagens estão sendo indexadas';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Tente novamente em breve, assim que a pesquisa terminar de indexar este escopo.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Nenhum resultado';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Tente termos ou filtros de pesquisa diferentes.';

  @override
  String get channelDetailsMembersOnline => 'Online';

  @override
  String get channelDetailsMembersOffline => 'offline';

  @override
  String get channelDetailsMemberYou => 'Você';

  @override
  String get channelDetailsSearchUsersHint => 'Pesquisar usuários';

  @override
  String get channelDetailsSearchUsersTypeToSearch =>
      'Digite para pesquisar membros';

  @override
  String get channelDetailsSearchUsersEmpty => 'Nenhum usuário encontrado';

  @override
  String get channelDetailsSearchUsersNoAvailable =>
      'Nenhum usuário disponível';

  @override
  String get channelDetailsDone => 'Concluído';

  @override
  String get channelDetailsHasFilterPrompt => 'Mostrar mensagens que contêm:';

  @override
  String get channelDetailsRetry => 'Tentar novamente';

  @override
  String get channelDetailsPinnedMessageTitle => 'Mensagem fixada';

  @override
  String get channelDetailsSearchResultTitle => 'Resultado da pesquisa';

  @override
  String get channelDetailsJumpToMessage => 'Ir para a mensagem';

  @override
  String get channelDetailsUnpinMessage => 'Desafixar mensagem';

  @override
  String get channelDetailsCopyMessageLink => 'Copiar link da mensagem';

  @override
  String get channelDetailsCopyMessageId => 'Copiar ID da mensagem';

  @override
  String get channelDetailsMessageUnpinned => 'Mensagem desafixada';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Comunidade atual';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'DM atual';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Todas as comunidades';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild => 'Todas as DMs';

  @override
  String get channelDetailsSearchScopeAllDms => 'Todas as DMs';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild => 'Somente DMs abertas';

  @override
  String get channelDetailsSearchScopeOpenDms => 'DMs abertas';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Todas as DMs + Comunidades';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'DMs e Comunidades abertas';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Pesquisar somente nesta comunidade';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Pesquisar apenas nesta conversa';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'Em todas as comunidades em que você está atualmente';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Apenas em todas as DMs que você já participou';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'Em todas as DMs de que você já participou';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'Em todas as DMs que você tem abertas apenas';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'Em todas as conversas diretas que você tem abertas';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'Em todas as conversas diretas em que você já esteve + todas as Comunidades em que você está atualmente';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'Em todas as conversas diretas abertas + em todas as Comunidades em que você está participando';

  @override
  String get channelDetailsSearchSortNewest => 'Mais recentes primeiro';

  @override
  String get channelDetailsSearchSortOldest => 'Mais antigos primeiro';

  @override
  String get channelDetailsSearchSortRelevance => 'Mais relevantes';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Mostrar as mensagens mais recentes primeiro';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Mostrar mensagens mais antigas primeiro';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Mostrar as mensagens mais relevantes primeiro';

  @override
  String get channelDetailsSearchContentImage => 'Upload de imagem';

  @override
  String get channelDetailsSearchContentVideo => 'Upload de vídeo';

  @override
  String get channelDetailsSearchContentAudio => 'Upload de áudio';

  @override
  String get channelDetailsSearchContentFile => 'Upload de arquivo';

  @override
  String get channelDetailsSearchContentLink => 'Link';

  @override
  String get channelDetailsSearchContentEmbed =>
      'Pré-visualização ou incorporação de link';

  @override
  String get channelDetailsSearchContentSticker => 'Figurinha';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Somente arquivos de imagem enviados';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Apenas vídeos enviados';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Somente arquivos de áudio enviados';

  @override
  String get channelDetailsSearchContentFileDescription =>
      'Qualquer anexo enviado';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'URL digitada no texto da mensagem';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Visualizações e mídias ricas resolvidas, não uploads';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Figurinha anexada à mensagem';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count tipos';
  }

  @override
  String get personalNotesTitle => 'Notas pessoais';

  @override
  String get personalNotesSubtitle =>
      'Seu espaço particular para pensamentos e lembretes';

  @override
  String groupDmWelcome(String displayName) {
    return 'Bem-vindo(a) ao $displayName. Adicione amigos para animar o grupo.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Editar grupo';

  @override
  String get groupDmWelcomeAddFriends => 'Adicionar amigos ao grupo';

  @override
  String get dmGroupInvites => 'Convites';

  @override
  String get groupDmEditTitle => 'Editar grupo';

  @override
  String get groupDmEditDetailsTooltip => 'Editar dados do grupo';

  @override
  String get groupDmGroupName => 'Nome do grupo';

  @override
  String get groupDmMyGroup => 'Meu grupo';

  @override
  String get groupDmGroupNameMaxLength =>
      'O nome do grupo não pode ter mais de 100 caracteres';

  @override
  String get groupDmGroupIcon => 'Ícone do grupo';

  @override
  String get groupDmUploadIcon => 'Carregar ícone';

  @override
  String get groupDmChangeIcon => 'Mudar ícone';

  @override
  String get groupDmRemoveIcon => 'Remover ícone';

  @override
  String get groupDmUpdated => 'Grupo atualizado';

  @override
  String get groupDmUpdateFailed =>
      'Não foi possível atualizar o grupo. Tente novamente.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Ícones animados não são suportados. Use uma imagem estática.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Ícones animados não são compatíveis';

  @override
  String get groupDmIconFileTooLargeTitle =>
      'O arquivo do ícone é muito grande';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'O arquivo do ícone é muito grande. Escolha um arquivo menor que $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'Formato de ícone não compatível';

  @override
  String get groupDmUnsupportedIconFormatBody =>
      'Tipo de arquivo não suportado.';

  @override
  String get groupDmCouldntProcessImage =>
      'Não foi possível processar a imagem';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'Falha ao processar a imagem cortada. Tente novamente.';

  @override
  String get groupDmInvalidImage => 'Imagem inválida';

  @override
  String get groupDmInvalidImageBody => 'Esta imagem é inválida. Tente outra.';

  @override
  String get groupDmAddFriends => 'Adicionar';

  @override
  String get groupDmOrSendInvite => 'ou envie um convite para um amigo:';

  @override
  String get groupDmGenerateInviteLink => 'Gerar link de convite';

  @override
  String get groupDmCreateInvite => 'Criar';

  @override
  String get groupDmInviteExpires24Hours => 'Seu convite expira em 24 horas';

  @override
  String get groupDmAddFriendFailed =>
      'Não foi possível adicionar este amigo ao grupo. Tente novamente.';

  @override
  String get groupDmAddFailed => 'Não foi possível adicionar ao grupo';

  @override
  String get groupDmGroupFull =>
      'Este grupo está cheio. Remova alguém antes de adicionar mais pessoas.';

  @override
  String get groupDmRateLimited =>
      'Você está indo muito rápido. Espere um momento e tente novamente.';

  @override
  String get groupDmCreateInviteFailed =>
      'Não foi possível criar o link de convite';

  @override
  String get groupDmCreateInviteFailedBody =>
      'Não foi possível gerar um link de convite. Tente novamente.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'Não foi possível criar um link de convite. Tente novamente.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'Você não tem permissão para criar um convite neste canal.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'Esta comunidade atingiu o limite de convites.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'A criação de convites está temporariamente desativada para esta comunidade.';

  @override
  String get groupDmCopyInviteFailed => 'Falha ao copiar link de convite';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Apenas o proprietário do grupo pode gerenciar os convites.';

  @override
  String get groupDmNoInvitesCreated => 'Nenhum convite criado';

  @override
  String get groupDmLoadingInvites => 'Carregando convites...';

  @override
  String get groupDmInvitesLoadFailed =>
      'Não foi possível carregar os convites. Tente novamente.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Revogar este convite? Não poderá ser desfeito.';

  @override
  String get groupDmInviteRevoked => 'Convite revogado';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Criado por $name. Expira em $time.';
  }

  @override
  String channelWelcomeHeading(String channelName) {
    return 'Bem-vindo(a) a $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'No início, não havia nada. Então, surgiu $channelName. E foi bom.';
  }

  @override
  String get personalNotesComposerHint => 'Envie uma mensagem para você mesmo';

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
  String get composerOpenExpressionPicker => 'Abrir seletor de expressões';

  @override
  String get composerShowKeyboard => 'Mostrar teclado';

  @override
  String get composerCloseAttachmentPanel => 'Fechar seletor de anexos';

  @override
  String get chatAttachmentPanelPhotos => 'Fotos';

  @override
  String get chatAttachmentPanelFiles => 'Arquivos';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Acesso à biblioteca de fotos necessário';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Permitir acesso à biblioteca de fotos para navegar e anexar fotos e vídeos recentes.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Abrir configurações';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', enviando';

  @override
  String get messageAccessibilityFailedSuffix => ', falha ao enviar';

  @override
  String get messageAccessibilityAttachmentSummary => 'um anexo';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count anexos';
  }

  @override
  String get messageAccessibilityImageSummary => 'uma imagem';

  @override
  String get messageAccessibilityVideoSummary => 'um vídeo';

  @override
  String get messageAccessibilityAudioSummary => 'um arquivo de áudio';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'adesivo $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'arquivo $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary => 'um anexo oculto';

  @override
  String get messageAccessibilityEmbedSummary => 'um anexo';

  @override
  String get messageAccessibilityEmptySummary => 'uma mensagem';

  @override
  String get personalNotesPrivateSpace => 'Seu espaço particular';

  @override
  String get purgePersonalNotes => 'Limpar notas pessoais';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Isso excluirá permanentemente todas as mensagens e anexos em suas notas pessoais. Isso não pode ser desfeito.';

  @override
  String get purgePersonalNotesConfirmButton => 'Limpar';

  @override
  String purgePersonalNotesSuccess(int count) {
    return '$count mensagens limpas das notas pessoais';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'As notas pessoais já estavam vazias';

  @override
  String get purgePersonalNotesFailed =>
      'Não foi possível limpar as notas pessoais';

  @override
  String get userSettingsGroupYourAccount => 'SUA CONTA';

  @override
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => 'Pesquisar configurações...';

  @override
  String get userSettingsSearchFieldLabel => 'Pesquisar configurações';

  @override
  String get userSettingsSearchClear => 'Limpar pesquisa';

  @override
  String get userSettingsSearchNoResults => 'Nenhuma configuração encontrada';

  @override
  String get userSettingsNavProfile => 'Perfil';

  @override
  String get userSettingsNavSecurityLogin => 'Segurança e Login';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Presentes';

  @override
  String get giftSettingsClaimAccountTitle => 'Resgate sua conta';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Resgate sua conta para usar ou gerenciar códigos de presente do Plutonium.';

  @override
  String get giftSettingsRedeemTitle => 'Resgatar um presente';

  @override
  String get giftSettingsRedeemDescription =>
      'Digite um código de presente para resgatar Plutonium para sua conta.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Insira o código do presente…';

  @override
  String get giftSettingsRedeemButton => 'Resgatar';

  @override
  String get giftSettingsRedeemSuccess =>
      'Presente resgatado com sucesso. Aproveite seu Plutonium.';

  @override
  String get giftSettingsPurchasedTitle => 'Presentes comprados';

  @override
  String get giftSettingsPurchasedDescription =>
      'Gerencie seus códigos de presente Plutonium comprados. Compartilhe o link do presente com alguém especial ou resgate-o para você!';

  @override
  String get giftSettingsEmptyTitle => 'Nenhum presente ainda';

  @override
  String get giftSettingsEmptyDescription =>
      'Compre um presente Plutonium na aba Plutonium para compartilhar com amigos.';

  @override
  String get giftSettingsGoToPlutonium => 'Ir para Plutonium';

  @override
  String get giftSettingsLoadFailedTitle =>
      'Não foi possível carregar o inventário de presentes';

  @override
  String get giftSettingsLoadFailedDescription => 'Tente novamente mais tarde.';

  @override
  String get giftSettingsTryAgain => 'Tentar novamente';

  @override
  String get giftSettingsGiftUrl => 'URL do presente';

  @override
  String get giftSettingsCopy => 'Copiar';

  @override
  String get giftSettingsCopied => 'Copiado';

  @override
  String get giftSettingsGiftUrlCopied => 'URL do presente copiada!';

  @override
  String get giftSettingsGiftUrlCopyFailed =>
      'Não foi possível copiar o URL do presente';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Comprado em $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Resgatado em $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Resgatado por $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'Este presente já foi resgatado';

  @override
  String get giftSettingsRedeemForYourself => 'Resgatar para você';

  @override
  String get giftSettingsShareWithFriend => 'Compartilhar com um amigo';

  @override
  String get premiumPlutoniumTagline =>
      'Desbloqueie limites maiores e recursos exclusivos enquanto apoia uma plataforma de comunicação independente.';

  @override
  String get premiumPurchaseMode => 'Modo de compra';

  @override
  String get premiumForMe => 'Para mim';

  @override
  String get premiumAsAGift => 'Como presente';

  @override
  String get premiumMonthly => 'Mensal';

  @override
  String get premiumYearly => 'Anual';

  @override
  String get premiumPerMonth => 'por mês';

  @override
  String get premiumPerYear => 'por ano';

  @override
  String get premiumOneTimePurchase => 'compra única';

  @override
  String get premiumSave17 => 'Economize 17%';

  @override
  String get premiumUpgradeNow => 'Atualizar agora';

  @override
  String get premiumBuyGift => 'Comprar presente';

  @override
  String get premiumOneYearGift => 'presente de 1 ano';

  @override
  String get premiumOneMonthGift => 'presente de 1 mês';

  @override
  String get premiumMostPopular => 'Mais popular';

  @override
  String get premiumScrollPrompt =>
      'Role para baixo para ver todos os benefícios incluídos no Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'Grátis vs. Plutonium';

  @override
  String get premiumFreeColumn => 'Grátis';

  @override
  String get premiumGiftSectionTitle => 'Presentear Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'Compartilhe a experiência Plutonium com seus amigos comprando uma assinatura de presente.';

  @override
  String get premiumGiftBannerOne =>
      'Você tem um novo código de presente esperando por você!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'Você tem $count novos códigos de presente esperando por você!';
  }

  @override
  String get premiumViewGifts => 'Ver presentes';

  @override
  String get premiumReadyToUpgrade => 'Pronto para fazer um upgrade?';

  @override
  String get premiumReadyToBuyGift => 'Pronto para comprar um presente?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Mensal $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Anual $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 ano $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 mês $price';
  }

  @override
  String get premiumManageSubscription => 'Gerenciar assinatura';

  @override
  String get premiumRedeemGiftCode => 'Resgatar código de presente';

  @override
  String get premiumGiftBadge => 'Presente';

  @override
  String get premiumCancelSubscriptionTitle => 'Cancelar assinatura?';

  @override
  String get premiumCancelSubscriptionBody =>
      'Você mantém seus benefícios até a próxima data de renovação e, em seguida, tem um período de carência de 3 dias para assinar novamente e manter seu histórico de assinante.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Cancelar assinatura';

  @override
  String get premiumKeepSubscription => 'Manter assinatura';

  @override
  String get premiumPurchaseHistoryTitle => 'Histórico de compras';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Suas faturas recentes. Para alterar o método de pagamento da sua assinatura, adicione ou escolha um no portal de cobrança e defina-o como padrão.';

  @override
  String get premiumManagePaymentMethods => 'Gerenciar formas de pagamento';

  @override
  String get premiumBillingHistory => 'Histórico de pagamentos';

  @override
  String get premiumSelfServeRefundTitle => 'Reembolso manual';

  @override
  String get premiumSelfServeRefundButton => 'Reembolsar última compra';

  @override
  String get premiumDisclaimerAgreementPrefix =>
      'Ao comprar, você concorda com nossos ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'Ao comprar, você concordou com nossos ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' e ';

  @override
  String premiumActiveUntil(String date) {
    return 'Ativo até $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Cancelando';

  @override
  String premiumCancelsOn(String date) {
    return 'Cancela em $date. Os benefícios permanecem ativos até lá.';
  }

  @override
  String get premiumReactivateSubscription => 'Reativar';

  @override
  String premiumGiftedUntil(String date) {
    return 'Presente até $date. Não renova automaticamente.';
  }

  @override
  String get premiumComparisonFeatureColumn => 'Recurso';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'Ao comprar, você concorda com nossos $terms e $privacy.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Reembolsos self-service disponíveis em até 3 dias após o pagamento, uma vez a cada 30 dias. Reembolsar uma assinatura a cancela. Compradores da UE/EEE renunciam ao direito de desistência de 14 dias no checkout para acessar o conteúdo imediatamente. Use o botão de reembolso no aplicativo em vez de um estorno. Estornos podem restringir permanentemente sua conta. O Stripe lida com o pagamento de forma segura. Nunca vemos o número completo do seu cartão.';

  @override
  String get premiumTermsOfService => 'Termos de serviço';

  @override
  String get premiumPrivacyPolicy => 'Política de privacidade';

  @override
  String get premiumCheckoutStartFailedTitle =>
      'Não foi possível iniciar a compra';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Algo deu errado ao iniciar a compra. Tente novamente em alguns instantes.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'Você está em uma assinatura de presente. Ela não será renovada. Você pode resgatar mais códigos de presente para estendê-la. Assinaturas recorrentes podem ser iniciadas após o término do seu tempo de presente.';

  @override
  String get premiumPlanUnavailable =>
      'Este plano não está disponível. Entre em contato com o suporte.';

  @override
  String get premiumCompletePaymentTitle => 'Concluir pagamento';

  @override
  String get premiumCompletePaymentBody =>
      'Você agora será redirecionado para o Stripe para concluir o pagamento. Volte para o Fluxer assim que terminar.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Escolha a forma de pagamento';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Pague com Pix automático para autorizar cobranças recorrentes diretamente do seu banco brasileiro. Ou escolha usar cartão para inserir um cartão de crédito na próxima tela da Stripe.';

  @override
  String get premiumUsePix => 'Usar Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Pague com UPI para configurar um e-mandate em conformidade com o RBI do seu banco indiano. Ou escolha usar cartão para inserir um cartão de crédito na próxima tela da Stripe.';

  @override
  String get premiumUseUpi => 'Usar UPI';

  @override
  String get premiumUseCard => 'Usar cartão';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Não foi possível abrir o portal de cobrança';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Ocorreu um erro ao abrir o portal de cobrança. Tente novamente em alguns instantes.';

  @override
  String get premiumAlreadyVisionaryTitle => 'Você já é Visionário';

  @override
  String get premiumAlreadyVisionaryBody =>
      'O Visionário já inclui acesso permanente, então não é preciso ter uma assinatura recorrente. Você ainda pode comprar presentes para outras pessoas.';

  @override
  String get premiumExistingSubscriptionTitle => 'Assinatura já existe';

  @override
  String get premiumExistingSubscriptionBody =>
      'Encontramos uma assinatura Fluxer Plutonium existente para esta conta. Gerencie-a no portal de cobrança seguro para atualizar os detalhes de pagamento ou verificar o status de renovação. Se você acabou de pagar, aguarde um minuto e reabra esta página.';

  @override
  String get premiumPurchasesDisabledTitle => 'Compras indisponíveis';

  @override
  String get premiumPurchasesDisabledBody =>
      'As compras estão desativadas para esta conta. Entre em contato com support@fluxer.app se isso parecer incorreto.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Reivindique sua conta para comprar o Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Você precisa verificar seu e-mail antes de comprar o Fluxer Plutonium.';

  @override
  String get premiumPerkCustomUsernameTag => 'Nome de usuário personalizado';

  @override
  String get premiumPerkPerCommunityProfiles => 'Perfis por comunidade';

  @override
  String get premiumPerkMessageScheduling => 'Agendamento de mensagens';

  @override
  String get premiumPerkProfileBadge => 'Selo do perfil';

  @override
  String get premiumPerkCustomVideoBackgrounds =>
      'Planos de fundo de vídeo personalizados';

  @override
  String get premiumPerkEntranceSounds => 'Sons de entrada';

  @override
  String get premiumPerkCommunities => 'Comunidades';

  @override
  String get premiumPerkMessageCharacterLimit =>
      'Limite de caracteres da mensagem';

  @override
  String get premiumPerkBookmarkedMessages => 'Mensagens salvas';

  @override
  String get premiumPerkFileUploadSize => 'Tamanho do arquivo para upload';

  @override
  String get premiumPerkEmojiStickerPacks => 'Pacotes de emojis e figurinhas';

  @override
  String get premiumPerkSavedMedia => 'Mídia salva';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Usar emojis animados';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Acesso global a emojis e figurinhas';

  @override
  String get premiumPerkVideoQuality => 'Qualidade do vídeo';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Avatares animados e banners de perfil';

  @override
  String get premiumPerkEarlyAccess => 'Acesso antecipado a novos recursos';

  @override
  String get premiumPerkCustomThemes => 'Temas personalizados';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Até 4K/60fps';

  @override
  String get userSettingsNavPrivacyDashboard => 'Painel de Privacidade';

  @override
  String get userSettingsNavAuthorizedApps => 'Aplicativos Autorizados';

  @override
  String get userSettingsNavBlockedUsers => 'Usuários Bloqueados';

  @override
  String get userSettingsNavLinkedDevices => 'Dispositivos Conectados';

  @override
  String get userSettingsNavConnections => 'Conexões';

  @override
  String get userSettingsNavLookAndFeel => 'Aparência';

  @override
  String get userSettingsNavAccessibility => 'Acessibilidade';

  @override
  String get userSettingsNavChat => 'Mensagens e Mídia';

  @override
  String get userSettingsNavAudioAndVideo => 'Áudio e Vídeo';

  @override
  String get userSettingsNavShortcuts => 'Atalhos';

  @override
  String get audioAndVideoAudioSectionTitle => 'Áudio';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'Configure seu microfone, alto-falantes e processamento de voz.';

  @override
  String get audioAndVideoVideoSectionTitle => 'Vídeo';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'Configure a qualidade da sua câmera e do compartilhamento de tela.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle =>
      'Comportamento durante a chamada';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Controlar os prompts de confirmação durante chamadas de voz e vídeo.';

  @override
  String get audioAndVideoInputDeviceLabel => 'Dispositivo de entrada';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Dispositivo de saída';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'Padrão';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Usar alto-falante';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'Quando desativado, o áudio é reproduzido no fone de ouvido ou em fones de ouvido conectados.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Volume de entrada';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Volume de saída';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Processamento de voz';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Voz focada';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Recomendado. Limpa seu microfone para uma fala clara.';

  @override
  String get audioAndVideoDirectInputLabel => 'Entrada direta';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Envia seu áudio sem alterações. Ideal se você estiver usando um software de áudio externo.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Personalizado';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Ajuste cada configuração: supressão de ruído, cancelamento de eco e ganho.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Supressão de ruído';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Aprimorado';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Padrão';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Nenhum';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Cancelamento de eco';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Controle automático de ganho';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Nivelamento automático do volume do microfone. Desativado quando a supressão aprimorada estiver ativa.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Teste de microfone';

  @override
  String get audioAndVideoMicTestStartLabel => 'Iniciar teste de microfone';

  @override
  String get audioAndVideoMicTestStopLabel => 'Parar teste de microfone';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return 'O $productName precisa de acesso ao microfone para testar sua entrada.';
  }

  @override
  String get audioAndVideoCameraLabel => 'Câmera';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Espelhar câmera';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'Qualidade da câmera';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'Qualidade do compartilhamento de tela';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Taxa de quadros';

  @override
  String get audioAndVideoFrameRate15Label => '15 FPS';

  @override
  String get audioAndVideoFrameRate30Label => '30 FPS';

  @override
  String get audioAndVideoFrameRate60Label => '60 FPS';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080p e 60 FPS exigem o $premiumProductName.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Esta instância permite compartilhamento de tela de até 720p a 30 FPS no momento.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return 'O $productName precisa de acesso ao microfone para listar seus dispositivos.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return 'O $productName precisa de acesso à câmera para listar seus dispositivos.';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'Não perguntar ao ocultar minha câmera';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'Não perguntar ao ocultar meu compartilhamento de tela';

  @override
  String get userSettingsNavNotifications => 'Notificações';

  @override
  String get notificationsGeneralSectionTitle => 'Geral';

  @override
  String get notificationsEnableNotificationsLabel => 'Ativar notificações';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Receba notificações quando você receber mensagens. Pode ser necessário permitir notificações para o $productName nas configurações do seu aparelho. Para controles por canal/por comunidade, abra as configurações de notificação no menu de uma comunidade.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Ativar notificações no computador';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Usa a central de notificações do sistema operacional. Para controles por canal/comunidade, clique com o botão direito no ícone de uma comunidade e abra as configurações de notificação.';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'Ativar notificações do navegador';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'Receba notificações quando você receber mensagens. Pode ser necessário permitir as notificações nas configurações do seu navegador. Para controles por canal/comunidade, clique com o botão direito no ícone de uma comunidade e abra as configurações de notificação.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Tempo limite de inatividade da notificação push';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return 'O $productName evita enviar notificações por push para seus dispositivos móveis quando você está usando o computador. Escolha por quanto tempo você precisa estar inativo no desktop antes de começar a receber notificações por push.';
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
      'Preferência de menção';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Preferências de menção em respostas';

  @override
  String get notificationsMentionNoPreferenceName => 'Sem preferência';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Respeitar a intenção do remetente, sem aviso quando ele ativar ou desativar a menção @';

  @override
  String get notificationsMentionPreferMentionName => 'Preferir menção';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Respostas padrão para @mencionar você e avisar o remetente se ele desativar isso';

  @override
  String get notificationsMentionPreferNoMentionName =>
      'Preferir não ser @mencionado';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'As respostas padrão não incluirão a @menção e avisarão o remetente se ele ativá-la';

  @override
  String get notificationsTtsSectionTitle =>
      'Notificações de conversão de texto em fala';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'Ativar reprodução de fala /tts';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'Deixe o /tts ler sua mensagem em voz alta. Desativar essa opção mantém esses comandos como texto normal.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Ajustar velocidade de reprodução em ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Acessibilidade';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle =>
      'Narração automática de mensagens';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Converte o conteúdo recebido em fala, independentemente de ter vindo do /tts.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Todos os canais';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Fazer com que todas as mensagens recebidas sejam lidas em voz alta, independentemente do canal que estiver aberto.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Apenas no canal ativo';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Narra apenas o canal que você está vendo. A narração segue você entre os canais.';

  @override
  String get notificationsTtsModeNeverName => 'Nunca automaticamente';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Permanecer em silêncio, a menos que alguém execute /tts manualmente.';

  @override
  String get notificationsTtsModeAriaLabel =>
      'Falar todas as mensagens em voz alta';

  @override
  String get notificationsSoundsSectionTitle => 'Sons';

  @override
  String get notificationsMasterVolumeLabel => 'Volume principal';

  @override
  String get notificationsMasterVolumeDescription =>
      'Define o nível para todos os efeitos sonoros. As configurações individuais de cada som ignoram esta opção.';

  @override
  String get notificationsResetToDefaultVolume =>
      'Redefinir para o volume padrão';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Desativar todos os sons de notificação';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Suas configurações de som de notificação existentes serão mantidas.';

  @override
  String get notificationsShowMoreSoundEffects =>
      'Mostrar mais efeitos sonoros';

  @override
  String get notificationsShowFewerSoundEffects =>
      'Mostrar menos efeitos sonoros';

  @override
  String get notificationsPreviewSound => 'Prévia do som';

  @override
  String get notificationsPerSoundVolumeTitle => 'Volume por som';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Defina volumes personalizados para sons individuais. Sons sem uma configuração específica seguem o volume principal.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Substituições de volume personalizadas ativas: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Seguindo o mestre • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'Redefinir $label para o volume principal';
  }

  @override
  String get notificationsResetAllOverrides =>
      'Redefinir todas as substituições';

  @override
  String notificationsMuteSound(String label) {
    return 'Silenciar $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'Desativar o som de notificação de $label';
  }

  @override
  String get notificationsSoundMessage =>
      'Notificações de mensagens da comunidade';

  @override
  String get notificationsSoundDirectMessage =>
      'Notificações de mensagens diretas';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Notificações de mensagens do canal atual';

  @override
  String get notificationsSoundMute => 'Silenciar áudio';

  @override
  String get notificationsSoundUnmute => 'Ativar áudio da voz';

  @override
  String get notificationsSoundDeaf => 'Áudio desativado';

  @override
  String get notificationsSoundUndeaf => 'Voz reativada';

  @override
  String get notificationsSoundUserJoin => 'Usuário entra no canal';

  @override
  String get notificationsSoundUserLeave => 'Usuário sai do canal';

  @override
  String get notificationsSoundUserMove => 'Usuário moveu o canal';

  @override
  String get notificationsSoundViewerJoin => 'Espectador entra na transmissão';

  @override
  String get notificationsSoundViewerLeave => 'Espectador sai da transmissão';

  @override
  String get notificationsSoundVoiceDisconnect => 'Voz desconectada';

  @override
  String get notificationsSoundIncomingRing => 'Chamada recebida';

  @override
  String get notificationsSoundCameraOn => 'Câmera ligada';

  @override
  String get notificationsSoundCameraOff => 'Câmera desativada';

  @override
  String get notificationsSoundScreenShareStart =>
      'Início do compartilhamento de tela';

  @override
  String get notificationsSoundScreenShareStop =>
      'Parar compartilhamento de tela';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'Não foi possível atualizar o tempo limite das notificações push. Tente novamente.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Não foi possível atualizar a preferência de menção. Tente novamente.';

  @override
  String get notificationsPermissionDeniedTitle => 'Notificações bloqueadas';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'Não foi possível ativar as notificações. Permita a permissão de notificação para continuar.';

  @override
  String get userSettingsNavLanguageAndTime => 'Idioma e Hora';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Idioma da interface';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Escolha o idioma usado no app';

  @override
  String get languageAndTimeOpenLanguageSettings =>
      'Abrir configurações de idioma';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Formato da hora';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Escolha como as horas são exibidas no aplicativo';

  @override
  String get languageAndTimeTimeFormatSelectionLabel =>
      'Seleção do formato da hora';

  @override
  String get languageAndTimeTimeFormatAuto => 'Automático';

  @override
  String get languageAndTimeTimeFormat12Hour => '12 horas';

  @override
  String get languageAndTimeTimeFormat24Hour => '24 horas';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'Idioma do aplicativo: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Local do sistema: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Usar o formato de hora do sistema';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'Falha ao atualizar o formato de hora';

  @override
  String get userSettingsNavDefaultApps => 'Apps padrão';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Navegador da Web';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Escolha qual navegador abre quando você toca em um link.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'Se um app estiver instalado para um site, os links serão abertos nele primeiro.';

  @override
  String get defaultAppsWebBrowserInApp => 'Navegador no app';

  @override
  String get defaultAppsWebBrowserExternal => 'Navegador externo';

  @override
  String get userSettingsNavAdvanced => 'Avançado';

  @override
  String get advancedPerformanceReportingTitle => 'Relatórios de desempenho';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'Ajude a melhorar o $productName compartilhando dados anônimos de falhas e desempenho.';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'Enviar relatórios de falhas e desempenho';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'Todos os dados relatados são anônimos e enviados apenas para o próprio serviço de monitoramento do $productName — nenhum provedor de terceiros é usado.';
  }

  @override
  String get advancedSettingsConfigure => 'Configurar';

  @override
  String get advancedSettingsCategoryPrivacy => 'Privacidade';

  @override
  String get advancedSettingsCategoryAppearance => 'Aparência';

  @override
  String get advancedSettingsCategoryAccessibility => 'Acessibilidade';

  @override
  String get advancedSettingsCategoryChat => 'Bate-papo';

  @override
  String get advancedSettingsCategoryMedia => 'Mídia';

  @override
  String get advancedSettingsCategoryVoice => 'Voz';

  @override
  String get advancedSettingsCategoryDeveloper => 'Desenvolvedor';

  @override
  String get advancedSettingEnableTextSelectionLabel =>
      'Ativar seleção de texto';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Permitir selecionar texto no aplicativo';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Ativar miniaturas de busca de vídeo';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Miniatura ou frame ao vivo durante a reprodução do vídeo';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Feedback tátil';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Feedback de vibração para toques e ações. Não sincroniza entre dispositivos.';

  @override
  String get advancedSettingShowNekoLabel => 'Mostrar Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'Gato Neko que persegue seu cursor';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Mostrar Neko na sua caixa de texto';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Animação de zoom inicial';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Reduzir o zoom do logo ao sair da tela de introdução';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Dicas de teclado';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Dicas de atalho de teclado nas dicas de ferramenta.';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Ativar favoritos';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Mostrar favoritos em todo o aplicativo';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Comportamento ao entrar no canal de voz';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Confirmação ou duplo clique para entrar em canais de voz da comunidade';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Exigir clique duplo para entrar em canais de voz';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Confirmar antes de entrar em canais de voz';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Enviar GIFs automaticamente ao selecionar';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Enviar GIFs automaticamente do seletor sem confirmação';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Salvar GIFs favoritos como mídia salva';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Escolha como os GIFs favoritos marcados com estrela são armazenados';

  @override
  String get advancedSettingMediaButtonsLabel => 'Botões de mídia';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Personalize quais botões e indicadores aparecem em anexos de mídia e incorporações';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Carregue anexos antes de enviar';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Comece a enviar os anexos assim que eles forem adicionados à caixa de mensagem';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Remover parâmetros de rastreamento de URLs';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Remover automaticamente parâmetros de rastreamento de URLs nas mensagens que você envia';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'Confiar em todos os links externos';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'Pular o aviso de link externo para todos os domínios';

  @override
  String get advancedSettingSearchEnginesLabel => 'Mecanismos de busca';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Configure os mecanismos de pesquisa usados a partir do texto selecionado';

  @override
  String get advancedSettingTranslatorsLabel => 'Tradutores';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Configure os provedores de tradução usados no texto selecionado';

  @override
  String get advancedSettingReverseImageSearchLabel => 'Pesquisar imagem';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Provedores de pesquisa reversa de imagens';

  @override
  String get advancedSettingMessageActionBarLabel =>
      'Barra de ações de mensagens';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Personalize a barra de ações que aparece ao passar o mouse sobre as mensagens';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Preenchimento automático de expressões';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Escolha o que aparece quando você digita dois pontos na caixa de mensagem';

  @override
  String get advancedSettingInputButtonsLabel =>
      'Botões de entrada de mensagem';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Escolha quais botões serão exibidos na barra de mensagens';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Rolar para o final ao enviar uma mensagem';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Escolha como o chat se move após você enviar uma mensagem';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Pular confirmação de \"Marcar tudo como lido\"';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Marcar todos os canais não lidos da caixa de entrada como lidos imediatamente, sem pedir confirmação';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Ocultar canais silenciados por padrão';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Ocultar canais silenciados das barras laterais da comunidade';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'Mostrar indicador de GIF';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Mostrar indicador de expiração de anexo';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'Mostrar botão de apagar';

  @override
  String get advancedSettingShowMediaDownloadLabel =>
      'Mostrar botão de download';

  @override
  String get advancedSettingShowMediaFavoriteLabel =>
      'Mostrar botão de favorito';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Mostrar botão para ocultar mídias incorporadas';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Mostrar barra de ações da mensagem';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel =>
      'Mostrar apenas o botão \"Mais\"';

  @override
  String get advancedSettingShowQuickReactionsLabel =>
      'Mostrar reações rápidas';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Ativar Shift para expandir';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Mostrar emojis padrão no preenchimento automático de expressões';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Mostrar emojis personalizados no preenchimento automático de expressões';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Mostrar figurinhas no preenchimento automático de expressões';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Mostrar mídias salvas no preenchimento automático de expressões';

  @override
  String get advancedSettingShowGifsButtonLabel => 'Mostrar botão de GIFs';

  @override
  String get advancedSettingShowMediaButtonLabel => 'Mostrar botão de mídia';

  @override
  String get advancedSettingShowStickersButtonLabel =>
      'Mostrar botão de figurinhas';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Mostrar botão de emoji';

  @override
  String get advancedSettingShowSendButtonLabel => 'Mostrar botão de enviar';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Mostrar alertas de novos aparelhos';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Solicitar novos dispositivos de áudio';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Controles de volume da conexão';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Mostrar controles deslizantes de volume por participante por dispositivo nos menus de voz';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Comportamento da visualização do compartilhamento de tela';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Pré-visualização, janela pop-out e comportamento do thumbnail de streaming';

  @override
  String get advancedSettingScreenShareCodecLabel =>
      'Codec de compartilhamento de tela';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Codec de vídeo para compartilhamento de tela';

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
      'Pausar minha prévia de compartilhamento de tela em segundo plano';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Ocultar miniatura da prévia da minha transmissão';

  @override
  String get advancedSettingDeveloperModeLabel =>
      'Ativar modo de desenvolvedor';

  @override
  String get advancedSettingDeveloperModeDescription =>
      'Ativar modo de desenvolvedor';

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
  String get advancedSettingTranslatorGoogle => 'Tradução do Google';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel =>
      'Mecanismo de busca padrão';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Escolha qual mecanismo de busca será usado por padrão ao pesquisar o texto selecionado.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Mecanismos de busca integrados';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Ative ou desative os mecanismos de busca integrados. Os mecanismos ativados aparecem no menu de contexto da mensagem quando o texto é selecionado.';

  @override
  String get advancedSettingCustomSearchEnginesLabel =>
      'Mecanismos de busca personalizados';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Adicione seus próprios mecanismos de busca com um padrão de URL personalizado. Use \'$query\' como um espaço reservado para o texto da pesquisa.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Adicionar buscador';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Ative pelo menos um mecanismo de busca abaixo.';

  @override
  String get advancedSettingRemoveSearchEngineLabel => 'Remover buscador';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'Tradutor padrão';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Escolha qual tradutor será usado por padrão ao traduzir o texto selecionado.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Tradutores integrados';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Ative ou desative os tradutores integrados. Os tradutores ativados aparecem no menu de contexto da mensagem quando o texto é selecionado.';

  @override
  String get advancedSettingCustomTranslatorsLabel =>
      'Tradutores personalizados';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Adicione seus próprios tradutores com um padrão de URL personalizado. Use \'$query\' como um espaço reservado para o texto a ser traduzido.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Adicionar tradutor';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Ative pelo menos um tradutor abaixo.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Remover tradutor';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Pesquisa reversa de imagem padrão';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Escolha qual serviço de busca reversa de imagem será usado por padrão ao pesquisar uma imagem.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Pesquisa de imagem inversa integrada';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Ative ou desative os provedores de busca reversa de imagem integrados. Os provedores ativados aparecem no menu de contexto de imagens, avatares, banners, figurinhas e emojis.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Pesquisa de imagem inversa personalizada';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Adicione seus próprios provedores de pesquisa reversa de imagens com um padrão de URL personalizado. Use \'$url\' como um espaço reservado para o URL da imagem.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Adicionar pesquisa de imagem reversa';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Ative pelo menos um provedor de busca de imagem inversa abaixo.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Remover pesquisa de imagem reversa';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Adicionar buscador';

  @override
  String get advancedSettingEditSearchEngineTitle =>
      'Editar mecanismo de busca';

  @override
  String get advancedSettingAddTranslatorTitle =>
      'Adicionar provedor de tradução';

  @override
  String get advancedSettingEditTranslatorTitle =>
      'Editar provedor de tradução';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Adicionar buscador de imagem inversa';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Editar buscador de imagem inversa';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Nome';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'Padrão de URL';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder => 'Meu buscador';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Meu tradutor';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'Minha busca de imagem reversa';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Use \'$query\' onde o texto da pesquisa deve ser inserido.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Use \'$query\' onde o texto a ser traduzido deve ser inserido.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Use \'$url\' onde o URL da imagem deve ser inserido.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired =>
      'O nome é obrigatório.';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'O padrão de URL é obrigatório.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'O padrão de URL deve conter o placeholder \'$query\'.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'O padrão de URL deve conter o placeholder \'$url\'.';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'O padrão de URL precisa ser um URL válido.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Adicionar';

  @override
  String get advancedSettingEditSearchProviderAction => 'Editar';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Remover';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'Tem certeza de que deseja remover $engineName?';
  }

  @override
  String get userSettingsNavApplications => 'Aplicativos';

  @override
  String get userSettingsNavAppLogs => 'Logs do Aplicativo';

  @override
  String get userSettingsNavDeveloperTools => 'Ferramentas do Desenvolvedor';

  @override
  String get userSettingsNavLimitsConfig => 'Configuração de Limites';

  @override
  String get userSettingsNavFeatureFlags => 'Recursos';

  @override
  String get userSettingsNavWhatsNew => 'Novidades';

  @override
  String get userSettingsJoinFluxerLabs => 'Entrar no Fluxer Labs';

  @override
  String get userSettingsNavAppLicenses => 'Licenças do app';

  @override
  String get userSettingsAppLicensesDescription =>
      'Software de código aberto usado por este app. Este app é criado com Flutter.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'Não foi possível carregar as licenças do app.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count licenças',
      one: '1 licença',
    );
    return '$_temp0';
  }

  @override
  String get userSettingsNavLogOut => 'Sair';

  @override
  String get quickSwitcherTabSearch => 'Pesquisar';

  @override
  String get quickSwitcherTabFriends => 'Amigos';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Pesquisar canais, pessoas ou comunidades';

  @override
  String get quickSwitcherSearchFriends => 'Pesquisar amigos';

  @override
  String get quickSwitcherNoMatchesFound =>
      'Nenhuma correspondência encontrada';

  @override
  String get quickSwitcherEmptyHint =>
      'Tente um nome diferente ou use os prefixos @ / # / ! / * para filtrar resultados.';

  @override
  String get quickSwitcherSectionPeople => 'Pessoas';

  @override
  String get quickSwitcherSectionGroupMessages => 'Mensagens em grupo';

  @override
  String get quickSwitcherSectionTextChannels => 'Canais de texto';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Canais de voz';

  @override
  String get quickSwitcherSectionCommunities => 'Comunidades';

  @override
  String get quickSwitcherSectionSettings => 'Configurações';

  @override
  String get quickSwitcherHomeLabel => 'Início';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Mensagens diretas';

  @override
  String get quickSwitcherFavoritesLabel => 'Favoritos';

  @override
  String get quickSwitcherUserSettingsLabel => 'Configurações do usuário';

  @override
  String get quickSwitcherNotificationsLabel => 'Notificações';

  @override
  String get quickSwitcherBookmarksLabel => 'Favoritos';

  @override
  String get savedMessagesEmptyTitle => 'Nenhum item salvo';

  @override
  String get savedMessagesEmptyBody =>
      'Marque mensagens para salvá-las e ver depois.';

  @override
  String get savedMessagesEndBody => 'Não há mais nada para ver aqui.';

  @override
  String get savedMessagesRemoveTooltip => 'Remover dos itens salvos';

  @override
  String get quickSwitcherMentionsLabel => 'Menções';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Ainda sem amigos';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Adicione um amigo para começar.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Nenhum amigo corresponde a esta pesquisa';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Tente um nome diferente.';

  @override
  String get quickSwitcherSearchAliasUser => 'Usuário';

  @override
  String get quickSwitcherSearchAliasYou => 'Você';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'DMs';

  @override
  String get quickSwitcherSearchAliasMessages => 'Mensagens';

  @override
  String get quickSwitcherSearchAliasFav => 'Fav';

  @override
  String get quickSwitcherSearchAliasStarred => 'Marcados';

  @override
  String get quickSwitcherSearchAliasInbox => 'Caixa de entrada';

  @override
  String get quickSwitcherSearchAliasSaved => 'Salvos';

  @override
  String get uiClose => 'Fechar';

  @override
  String get chatJumpToBottom => 'Ir para o final';

  @override
  String get uiConfirm => 'Confirmar';

  @override
  String get uiLoading => 'Carregando';

  @override
  String get uiSearch => 'Pesquisar';

  @override
  String get uiStartCall => 'Iniciar chamada';

  @override
  String get uiStartVideoCall => 'Iniciar chamada de vídeo';

  @override
  String get uiPlay => 'Reproduzir';

  @override
  String get uiPause => 'Pausar';

  @override
  String get uiDownload => 'Baixar';

  @override
  String get uiMoreActions => 'Mais ações';

  @override
  String get uiUnsavedChanges => 'Alterações não salvas';

  @override
  String get uiReset => 'Redefinir';

  @override
  String get uiOpenColorPicker => 'Abrir seletor de cores';

  @override
  String get uiSelectPlaceholder => 'Selecionar';

  @override
  String get uiSearchPlaceholder => 'Pesquisar';

  @override
  String get uiNoOptionsFound => 'Nenhuma opção encontrada';

  @override
  String get uiDismissNotification => 'Dispensar notificação';

  @override
  String get uiColorPickerTitle => 'Seletor de cores';

  @override
  String get mentionConfirmTitle => 'Mencionar todos?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Isso notificará $count membros. Continuar?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Isso notificará $count membros online. Continuar?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'Isso notificará $count membros com a função $roleName. Continuar?';
  }

  @override
  String get mentionConfirmButton => 'Mencionar';

  @override
  String get composerEmojiUnavailable => 'Você não pode usar este emoji aqui.';

  @override
  String get instanceUrlLabel => 'URL da instância';

  @override
  String get instanceUrlPlaceholder =>
      'Digite a URL da instância (ex: fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Redefinir para Fluxer';

  @override
  String get instanceConnect => 'Conectar';

  @override
  String get instanceConnecting => 'Conectando…';

  @override
  String get instanceConnectFailed => 'Falha ao conectar à instância';

  @override
  String get recentInstances => 'Instâncias recentes';

  @override
  String removeRecentInstance(String domain) {
    return 'Remover $domain das instâncias recentes';
  }

  @override
  String get instanceSheetTitle => 'Conectar à instância';

  @override
  String get connectToDifferentInstance => 'Conectar a uma instância diferente';

  @override
  String get changeInstance => 'Alterar';

  @override
  String get instanceConnectionRequired =>
      'Conecte-se à instância para fazer login';

  @override
  String get comingSoon => 'Em breve';

  @override
  String get guildNavbarDirectMessages => 'Mensagens Diretas';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Explorar Comunidades Descobríveis';

  @override
  String get discoveryExplore => 'Explorar';

  @override
  String get discoveryExplorePublicCommunities =>
      'Explorar comunidades públicas';

  @override
  String get discoveryListingSubheading =>
      'Quer listar sua comunidade aqui? Candidate-se se você atender aos requisitos em Configurações da sua comunidade > Descoberta.';

  @override
  String get discoverySearchCommunities => 'Pesquisar comunidades';

  @override
  String get discoveryFilterByLanguage => 'Filtrar por idioma';

  @override
  String get discoveryAllLanguages => 'Todos os idiomas';

  @override
  String get discoveryAllCategories => 'Todos';

  @override
  String get discoveryCategoryGaming => 'Jogos';

  @override
  String get discoveryCategoryMusic => 'Música';

  @override
  String get discoveryCategoryEntertainment => 'Entretenimento';

  @override
  String get discoveryCategoryEducation => 'Educação';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Ciência e Tecnologia';

  @override
  String get discoveryCategoryContentCreator => 'Criador de Conteúdo';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime e Mangá';

  @override
  String get discoveryCategoryMoviesAndTv => 'Filmes e TV';

  @override
  String get discoveryCategoryOther => 'Outros';

  @override
  String get discoveryNoCommunitiesMatch => 'Nenhuma comunidade encontrada.';

  @override
  String get discoveryJoinCommunity => 'Entrar na comunidade';

  @override
  String get discoveryJoined => 'Entrou';

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
      other: '$countString membros',
      one: '1 membro',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Sem descrição.';

  @override
  String get discoveryCommunities => 'Comunidades';

  @override
  String get discoveryApps => 'Apps';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Não foi possível entrar nesta comunidade';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Algo deu errado. Tente novamente em um momento.';

  @override
  String get discoveryJoinErrorFullTitle => 'Esta comunidade está cheia';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Esta comunidade atingiu o limite de membros, então você não pode entrar no momento.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Você atingiu o limite de comunidades';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Você está no número máximo de comunidades. Saia de uma e tente novamente.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Você não pode entrar nesta comunidade';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Você foi banido desta comunidade.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Esta comunidade não está mais disponível';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Ela pode ter saído da descoberta ou desativado novas entradas. Atualize a página e você não a verá novamente.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Você está indo rápido demais';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Por favor, espere um momento e tente novamente.';

  @override
  String get guildNavbarAddCommunity => 'Adicionar uma Comunidade';

  @override
  String get guildNavbarHelp => 'Ajuda';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'NOVA MENSAGEM';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Recolher $folderName';
  }

  @override
  String get guildNavbarGuildSelected => 'selecionado';

  @override
  String get guildNavbarGuildUnread => 'não lidas';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count menções',
      one: '1 menção',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'silenciado';

  @override
  String get authShowPassword => 'Mostrar senha';

  @override
  String get authHidePassword => 'Ocultar senha';

  @override
  String get chatLoadingMessages => 'Carregando mensagens';

  @override
  String get friendsMessageFriend => 'Mensagem';

  @override
  String get friendsFriendActions => 'Ações do amigo';

  @override
  String get friendsAcceptRequest => 'Aceitar pedido de amizade';

  @override
  String get friendsDeclineRequest => 'Recusar solicitação de amizade';

  @override
  String get friendsCancelRequest => 'Cancelar pedido de amizade';

  @override
  String get friendsOpenInbox => 'Caixa de entrada';

  @override
  String get profileRemoveFriend => 'Remover amigo';

  @override
  String get profileUnblockUser => 'Desbloquear usuário';

  @override
  String get profileAcceptFriendRequest => 'Aceitar pedido de amizade';

  @override
  String get profileCancelFriendRequest => 'Cancelar pedido de amizade';

  @override
  String get profileSendFriendRequest => 'Adicionar amigo';

  @override
  String get accountOverflowMenu => 'Opções da conta';

  @override
  String get navHome => 'Início';

  @override
  String get navNotifications => 'Notificações';

  @override
  String get navYou => 'Você';

  @override
  String get guildFolderSettingsTitle => 'Configurações da pasta';

  @override
  String get guildFolderNameLabel => 'Nome da pasta';

  @override
  String get guildFolderColorLabel => 'Cor da pasta';

  @override
  String get guildFolderShowIconWhenCollapsed =>
      'Mostrar ícone quando minimizado';

  @override
  String get guildFolderIconLabel => 'Ícone da pasta';

  @override
  String get guildFolderDelete => 'Excluir pasta';

  @override
  String get guildFolderIconFolder => 'Pasta';

  @override
  String get guildFolderIconStar => 'Favoritar';

  @override
  String get guildFolderIconHeart => 'Coração';

  @override
  String get guildFolderIconBookmark => 'Salvar';

  @override
  String get guildFolderIconGameController => 'Controle de jogo';

  @override
  String get guildFolderIconShield => 'Proteger';

  @override
  String get guildFolderIconMusicNote => 'Nota musical';

  @override
  String get guildFolderMarkAsRead => 'Marcar pasta como lida';

  @override
  String get guildBulkMuteCommunities => 'Silenciar comunidades';

  @override
  String get guildBulkUnmuteCommunities => 'Reativar comunidades';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Configurações de notificação da comunidade';

  @override
  String get guildBulkCommunityPrivacySettings =>
      'Configurações de privacidade da comunidade';

  @override
  String get guildBulkAllowEveryoneAndHere => 'Permitir @everyone e @here';

  @override
  String get guildBulkAllowRoleMentions => 'Permitir menções de cargo';

  @override
  String get guildBulkEnableMobilePush => 'Ativar notificações push no celular';

  @override
  String get guildBulkDisableMobilePush =>
      'Desativar notificações push no celular';

  @override
  String get guildBulkAllowDirectMessages => 'Permitir mensagens diretas';

  @override
  String get guildBulkBlockDirectMessages => 'Bloquear mensagens diretas';

  @override
  String get guildBulkAllowBotDirectMessages =>
      'Permitir mensagens diretas de bots';

  @override
  String get guildBulkBlockBotDirectMessages =>
      'Bloquear mensagens diretas de bots';

  @override
  String get guildNavbarGroupDm => 'DM em Grupo';

  @override
  String get guildNavbarCreateChannel => 'Criar canal';

  @override
  String get guildNavbarChannelType => 'Tipo de canal';

  @override
  String get guildNavbarTextChannel => 'Canal de Texto';

  @override
  String get guildNavbarTextChannelDescription =>
      'Envie mensagens, imagens, GIFs e emojis';

  @override
  String get guildNavbarVoiceChannel => 'Canal de Voz';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Fiquem juntos com voz, vídeo e compartilhamento de tela';

  @override
  String get guildNavbarLinkChannel => 'Canal de Link';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Acesso rápido a um site ou recurso externo';

  @override
  String get guildNavbarNameLabel => 'Nome';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Tipo de canal';

  @override
  String get guildNavbarCreateCategory => 'Criar categoria';

  @override
  String get guildNavbarNewCategoryHint => 'Nova categoria';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Convide amigos para $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Os destinatários serão levados para #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Pesquisar amigos';

  @override
  String get guildNavbarNoFriendsYet => 'Ainda não há amigos';

  @override
  String get guildNavbarNoResults => 'Nenhum resultado';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Ou, envie um link de convite para um amigo:';

  @override
  String get guildNavbarInviteLink => 'Link de convite';

  @override
  String get guildNavbarCopy => 'Copiar';

  @override
  String get guildNavbarCopied => 'Copiado!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Seu link de convite expira em 7 dias.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Este link de convite nunca expira.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Seu link de convite expira em $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Editar link de convite';

  @override
  String get guildNavbarInviteLinkSettings =>
      'Configurações do link de convite';

  @override
  String get guildNavbarExpireAfter => 'Expirar Após';

  @override
  String get guildNavbarMaxUses => 'Número Máximo de Usos';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Conceder Associação Temporária';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Membros serão removidos quando ficarem offline, a menos que uma função seja atribuída';

  @override
  String get guildNavbarCreateNewLink => 'Criar Novo Link';

  @override
  String get guildNavbarSent => 'Enviado';

  @override
  String get guildNavbarInvite => 'Convidar';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Sair da Comunidade';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Tem certeza de que deseja sair desta comunidade? Você não poderá mais ver nenhuma mensagem.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Sair da Comunidade';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Excluir suas mensagens nesta comunidade?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Exclua permanentemente todas as mensagens que você enviou aqui, em todos os canais. Não pode ser desfeito.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Excluir Minhas Mensagens';

  @override
  String get guildNavbarDeletedYourMessages => 'Suas mensagens foram excluídas';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Não foi possível excluir suas mensagens';

  @override
  String get guildNavbarRemoveOverride => 'Remover substituição';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Silenciado até $formattedDate';
  }

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'Acessível apenas para a equipe $productName';
  }

  @override
  String get guildNavbarInvitesPaused =>
      'Convites estão atualmente pausados nesta comunidade';

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
  String get guildNavbarDuration1Day => '1 dia';

  @override
  String get guildNavbarDuration7Days => '7 dias';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count segundos';
  }

  @override
  String get guildNavbarNever => 'Nunca';

  @override
  String get guildNavbarNoLimit => 'Sem limite';

  @override
  String get guildNavbarOneUse => '1 uso';

  @override
  String guildNavbarUses(int count) {
    return '$count usos';
  }

  @override
  String get guildMenuMarkAsRead => 'Marcar como lido';

  @override
  String get guildPeekMoreOptions => 'Mais opções';

  @override
  String get guildMenuInviteMembers => 'Convidar membros';

  @override
  String get guildMenuCommunitySettings => 'Configurações da comunidade';

  @override
  String get guildMenuEditCommunityProfile => 'Editar perfil da comunidade';

  @override
  String get guildMenuUnmuteCommunity => 'Ativar som da comunidade';

  @override
  String get guildMenuMuteCommunity => 'Silenciar comunidade';

  @override
  String get guildMenuHideMutedChannels => 'Ocultar canais silenciados';

  @override
  String get guildMenuReportCommunity => 'Denunciar comunidade';

  @override
  String get guildMenuDebugCommunity => 'Depurar comunidade';

  @override
  String get guildMenuCopyCommunityId => 'Copiar ID da comunidade';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Até $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Geral';

  @override
  String get guildMenuSettingsRoles => 'Cargos e permissões';

  @override
  String get guildMenuSettingsEmoji => 'Emoji';

  @override
  String get guildMenuSettingsStickers => 'Adesivos';

  @override
  String get guildMenuSettingsSafetyModeration => 'Segurança e moderação';

  @override
  String get guildMenuSettingsActivityLog => 'Registro de atividades';

  @override
  String get guildMenuSettingsWebhooks => 'Webhooks';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'URL de convite personalizado';

  @override
  String get guildMenuSettingsDiscovery => 'Descoberta';

  @override
  String get guildMenuSettingsMembers => 'Membros';

  @override
  String get guildMenuSettingsInviteLinks => 'Convites';

  @override
  String get guildMenuSettingsBans => 'Proibições';

  @override
  String get guildMenuSettingsChannels => 'Canais';

  @override
  String get guildSettingsNoPermission =>
      'Você não tem permissão para ver esta aba de configurações.';

  @override
  String get guildSettingsOverviewIconTitle => 'Ícone';

  @override
  String get guildSettingsUploadImage => 'Carregar imagem';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Carregue um banner para o seu servidor.';

  @override
  String get guildSettingsOverviewNameTitle => 'Nome';

  @override
  String get guildSettingsOverviewNameHint => 'Minha comunidade incrível';

  @override
  String get guildSettingsOverviewStatsTitle => 'Estatísticas';

  @override
  String get guildSettingsOverviewMembers => 'Membros';

  @override
  String get guildSettingsOverviewOnline => 'Online';

  @override
  String get guildSettingsRolesDescription =>
      'Use cargos para agrupar membros e atribuir permissões.';

  @override
  String get guildSettingsCreateRole => 'Criar função';

  @override
  String get guildSettingsRolesListTitle => 'Cargos';

  @override
  String get guildSettingsRolesNewRole => 'Nova função';

  @override
  String get guildSettingsRolesDeleteRole => 'Excluir cargo';

  @override
  String get guildSettingsRolesBackToRoles => 'Voltar para cargos';

  @override
  String get guildSettingsBackToSettings => 'Voltar para as configurações';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Editar \"$name\"';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Configurar permissões e ajustes de cargo';

  @override
  String get guildSettingsRolesDisplaySection => 'Exibição';

  @override
  String get guildSettingsRolesRoleName => 'Nome do cargo';

  @override
  String get guildSettingsRolesRoleColor => 'Cor do cargo';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Digite uma cor (hex, rgb(), hsl() ou nome) ou use o seletor.';

  @override
  String get guildSettingsRolesShowSeparately =>
      'Mostrar esta função separadamente';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Lista os membros com esta função em uma seção própria na lista de membros.';

  @override
  String get guildSettingsRolesAllowMentions =>
      'Permitir menções para esta função';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'Membros com a permissão \"$permission\" podem sempre mencionar cargos, independentemente desta configuração.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Use este botão para limpar rapidamente todas as permissões.';

  @override
  String get guildSettingsRolesClearPermissions => 'Limpar permissões';

  @override
  String get guildSettingsRolesPermissionsSection => 'Permissões';

  @override
  String get guildSettingsRolesSearchPermissions => 'Pesquisar permissões';

  @override
  String get guildSettingsRolesDenseLayout => 'Layout compacto';

  @override
  String get guildSettingsRolesComfyLayout => 'Layout confortável';

  @override
  String get guildSettingsRolesSwitchToDenseLayout =>
      'Mudar para layout compacto';

  @override
  String get guildSettingsRolesSwitchToComfyLayout =>
      'Mudar para o layout confortável';

  @override
  String get guildSettingsRolesSingleColumn => 'Coluna única';

  @override
  String get guildSettingsRolesTwoColumns => 'Duas colunas';

  @override
  String get guildSettingsRolesSwitchToSingleColumn =>
      'Mudar para coluna única';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => 'Mudar para duas colunas';

  @override
  String get guildSettingsRolesNoPermissionsFound =>
      'Nenhuma permissão encontrada';

  @override
  String get guildSettingsRolesCustomHoistOrder =>
      'Ordem de destaque personalizada';

  @override
  String get guildSettingsRolesHoistOrder => 'Ordem de destaque';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Redefinir para o padrão';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Arraste os cargos para personalizar a ordem em que aparecem na lista de membros.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Nenhum cargo em destaque. Ative a opção \"Mostrar cargo separadamente\" em um cargo para vê-lo aqui.';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'Você não pode editar esta função porque ela é a sua função mais alta ou está acima da sua';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Você precisa da permissão \"$permission\" para editar estas permissões';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'Você não pode editar um cargo que seja igual ou superior ao seu cargo mais alto';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'Você não pode conceder uma permissão que você não tem';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'Você não pode remover esta permissão porque ela seria removida de você mesmo';

  @override
  String get guildSettingsRolesUpdatedSuccess =>
      'Cargos atualizados com sucesso';

  @override
  String get guildSettingsRolesCreatedSuccess => 'Cargo criado com sucesso';

  @override
  String get guildSettingsRolesDeletedSuccess => 'Cargo excluído com sucesso';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'Ordem de destaque redefinida para o padrão';

  @override
  String get guildSettingsRolesNameRequiredTitle =>
      'O nome da função é obrigatório';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Dê um nome à função antes de salvar.';

  @override
  String get guildSettingsRolesCreateFailedTitle =>
      'Não foi possível criar a função';

  @override
  String get guildSettingsRolesUpdateFailedTitle =>
      'Não foi possível atualizar os cargos';

  @override
  String get guildSettingsRolesDeleteFailedTitle =>
      'Não foi possível excluir a função';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '\"$name\" não pôde ser excluído. Tente novamente.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'Não foi possível redefinir a ordem de destaque';

  @override
  String get guildSettingsRolesTryAgainInAMoment =>
      'Tente novamente em alguns instantes.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'Tem certeza de que deseja excluir a função $name? Quaisquer membros com esta função não a terão mais.';
  }

  @override
  String get permissionCategoryCommunityWide => 'Toda a comunidade';

  @override
  String get permissionCategoryMessagesMedia => 'Mensagens e mídia';

  @override
  String get permissionCategoryModeration => 'Moderação';

  @override
  String get permissionCategoryChannelAccess => 'Acesso ao canal';

  @override
  String get permissionCategoryChannelManagement => 'Gerenciamento de canais';

  @override
  String get permissionCategoryAudioVideo => 'Áudio e vídeo';

  @override
  String get permissionUnknown => 'Permissão desconhecida';

  @override
  String get permissionAdministrator => 'Administrador';

  @override
  String get permissionAdministratorDescription =>
      'Concede todas as permissões e ignora as restrições do canal. Altamente sensível.';

  @override
  String get permissionViewActivityLog => 'Ver registro de atividades';

  @override
  String get permissionViewActivityLogDescription =>
      'Ver o registro de atividades da comunidade com as alterações e ações de moderação.';

  @override
  String get permissionManageCommunity => 'Gerenciar comunidade';

  @override
  String get permissionManageCommunityDescription =>
      'Edite as configurações globais, como nome, descrição e ícone.';

  @override
  String get permissionManageRoles => 'Gerenciar cargos';

  @override
  String get permissionManageRolesDescription =>
      'Crie, edite ou exclua cargos abaixo do seu cargo mais alto. Também permite editar as substituições de permissão do canal.';

  @override
  String get permissionManageChannels => 'Gerenciar canais';

  @override
  String get permissionManageChannel => 'Gerenciar canal';

  @override
  String get permissionManageChannelDescription =>
      'Renomear e editar as configurações deste canal.';

  @override
  String get permissionManagePermissions => 'Gerenciar permissões';

  @override
  String get permissionManagePermissionsDescription =>
      'Editar permissões de cargos e membros neste canal.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Crie, edite ou exclua webhooks para este canal.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Ver a lista de membros deste canal.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Gerenciar links de convite para este canal.';

  @override
  String get permissionOverwriteDeny => 'Negar';

  @override
  String get permissionOverwriteInherit => 'Neutro (herdado)';

  @override
  String get permissionOverwriteAllow => 'Permitir';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Use estes botões para definir todas as permissões rapidamente.';

  @override
  String get permissionManageChannelsDescription =>
      'Criar, editar ou apagar canais e categorias.';

  @override
  String get permissionKickMembers => 'Expulsar membros';

  @override
  String get permissionBanMembers => 'Banir membros';

  @override
  String get permissionCreateInviteLinks => 'Criar links de convite';

  @override
  String get permissionChangeOwnNickname => 'Mudar meu apelido';

  @override
  String get permissionChangeOwnNicknameDescription =>
      'Atualize seu próprio apelido.';

  @override
  String get permissionManageNicknames => 'Gerenciar apelidos';

  @override
  String get permissionManageNicknamesDescription =>
      'Mudar os apelidos de outros membros.';

  @override
  String get permissionCreateEmojiStickers => 'Criar emojis e figurinhas';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Carregue novos emojis e figurinhas, e gerencie suas próprias criações.';

  @override
  String get permissionManageEmojiStickers => 'Gerenciar emojis e figurinhas';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Editar ou apagar figurinhas e emojis criados por outros membros.';

  @override
  String get permissionManageWebhooks => 'Gerenciar webhooks';

  @override
  String get permissionManageWebhooksDescription =>
      'Criar, editar ou excluir webhooks.';

  @override
  String get permissionSendMessages => 'Enviar mensagens';

  @override
  String get permissionSendTtsMessages => 'Enviar mensagens TTS';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Enviar mensagens de texto para voz.';

  @override
  String get permissionManageMessages => 'Gerenciar mensagens';

  @override
  String get permissionManageMessagesDescription =>
      'Apagar mensagens de outros membros. O gerenciamento de fixação é separado.';

  @override
  String get permissionPinMessages => 'Fixar mensagens';

  @override
  String get permissionEmbedLinks => 'Incorporar links';

  @override
  String get permissionAttachFiles => 'Anexar arquivos';

  @override
  String get permissionMentionEveryone => 'Usar @everyone/@here e @cargo';

  @override
  String get permissionMentionEveryoneDescription =>
      'Mencionar todos ou qualquer função (mesmo que a função não esteja definida como mencionável).';

  @override
  String get permissionUseExternalEmoji => 'Usar emojis externos';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Usar emojis de outras comunidades.';

  @override
  String get permissionUseExternalStickers => 'Usar figurinhas externas';

  @override
  String get permissionAddReactions => 'Adicionar reações';

  @override
  String get permissionAddReactionsDescription =>
      'Adicione novas reações às mensagens.';

  @override
  String get permissionBypassSlowmode => 'Ignorar modo lento';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Ignorar limites de taxa de mensagens por canal.';

  @override
  String get permissionTimeOutMembers => 'Aplicar tempo limite a membros';

  @override
  String get permissionTimeOutMembersDescription =>
      'Impedir que membros enviem mensagens, reajam e entrem em chamadas de voz por um período.';

  @override
  String get permissionViewChannel => 'Ver canal';

  @override
  String get permissionViewChannelMembers => 'Ver membros do canal';

  @override
  String get permissionViewChannelMembersDescription =>
      'Ver a lista de membros dos canais nesta comunidade.';

  @override
  String get permissionConnect => 'Conectar';

  @override
  String get permissionSpeak => 'Falar';

  @override
  String get permissionStreamVideo => 'Transmitir vídeo';

  @override
  String get permissionUseVoiceActivity => 'Usar atividade de voz';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Sem essa permissão, o modo \"apertar para falar\" é obrigatório.';

  @override
  String get permissionPrioritySpeaker => 'Prioridade de fala';

  @override
  String get permissionMuteMembers => 'Silenciar membros';

  @override
  String get permissionDeafenMembers => 'Silenciar membros';

  @override
  String get permissionMoveMembers => 'Mover membros';

  @override
  String get permissionMoveMembersDescription =>
      'Arraste membros entre canais que eles podem acessar.';

  @override
  String get permissionSetVoiceRegion => 'Definir região de voz';

  @override
  String guildSettingsEmojiSlotInfo(int staticCount, int animatedCount) {
    return '$staticCount emojis estáticos, $animatedCount emojis animados usados';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Ainda não há emojis personalizados.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count stickers enviados';
  }

  @override
  String get guildSettingsStickersEmpty =>
      'Ainda não há stickers personalizados.';

  @override
  String get guildSettingsModerationVerificationTitle =>
      'Verificação de membros';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Escolha o que os membros precisam ter antes de poderem postar ou enviar mensagens diretas para membros da comunidade.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Membros com cargos podem ignorar essas verificações. Para espaços públicos, recomendamos ativar a verificação.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Comunidades listadas em Descoberta exigem pelo menos um e-mail verificado. Nenhum pode ser selecionado enquanto a Descoberta estiver ativada.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Conteúdo maduro e avisos de conteúdo';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Configure a marcação de conteúdo maduro e avisos de conteúdo opcionais para os membros.';

  @override
  String get guildSettingsModerationMatureToggle => 'Conteúdo maduro';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Marque esta comunidade como contendo conteúdo maduro.';

  @override
  String get guildSettingsVerificationNone => 'Nenhum';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Nenhuma verificação é necessária.';

  @override
  String get guildSettingsVerificationLow => 'Baixo';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Requer um endereço de e-mail verificado.';

  @override
  String get guildSettingsVerificationMedium => 'Médio';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Requer um endereço de e-mail verificado e uma conta com pelo menos 5 minutos de idade.';

  @override
  String get guildSettingsVerificationHigh => 'Alto';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Requer tudo do médio, mais ser membro da comunidade por pelo menos 10 minutos.';

  @override
  String get guildSettingsVerificationHighest => 'Muito alto';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Requer um número de telefone verificado.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Acompanhe as ações do moderador em toda a comunidade.';

  @override
  String get guildSettingsAuditLogEmpty => 'Nenhum log ainda';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Ações de moderação e alterações na comunidade aparecerão aqui.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Todos os usuários';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Todas as ações';

  @override
  String get guildSettingsAuditLogNoReason => 'Nenhum motivo foi fornecido.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Usuário desconhecido';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Algo deu errado ao carregar o log de atividades.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Não foi possível carregar os logs de atividades';

  @override
  String get guildSettingsAuditLogReason => 'Motivo';

  @override
  String get guildSettingsAuditLogSomeone => 'alguém';

  @override
  String get guildSettingsAuditLogSomething => 'algo';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'entidade desconhecida';

  @override
  String get guildSettingsAuditLogNothing => 'nada';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Destino desconhecido';

  @override
  String get auditLogActionGuildUpdate => 'Comunidade atualizada';

  @override
  String get auditLogActionChannelCreate => 'Canal criado';

  @override
  String get auditLogActionChannelUpdate => 'Canal atualizado';

  @override
  String get auditLogActionChannelDelete => 'Canal excluído';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Permissão de canal adicionada';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Permissão de canal atualizada';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Permissão de canal removida';

  @override
  String get auditLogActionMemberKick => 'Membro expulso';

  @override
  String get auditLogActionMemberPrune => 'Membros removidos';

  @override
  String get auditLogActionMemberBanAdd => 'Membro banido';

  @override
  String get auditLogActionMemberBanRemove => 'Membro desbanido';

  @override
  String get auditLogActionMemberUpdate => 'Membro atualizado';

  @override
  String get auditLogActionMemberRoleUpdate => 'Cargos do membro atualizados';

  @override
  String get auditLogActionMemberMove => 'Membro movido';

  @override
  String get auditLogActionMemberDisconnect => 'Membro desconectado';

  @override
  String get auditLogActionBotAdd => 'Bot adicionado';

  @override
  String get auditLogActionRoleCreate => 'Cargo criado';

  @override
  String get auditLogActionRoleUpdate => 'Cargo atualizado';

  @override
  String get auditLogActionRoleDelete => 'Função excluída';

  @override
  String get auditLogActionInviteCreate => 'Convite criado';

  @override
  String get auditLogActionInviteUpdate => 'Convite atualizado';

  @override
  String get auditLogActionInviteDelete => 'Convite excluído';

  @override
  String get auditLogActionWebhookCreate => 'Webhook criado';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook atualizado';

  @override
  String get auditLogActionWebhookDelete => 'Webhook excluído';

  @override
  String get auditLogActionEmojiCreate => 'Emoji criado';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji atualizado';

  @override
  String get auditLogActionEmojiDelete => 'Emoji excluído';

  @override
  String get auditLogActionStickerCreate => 'Figurinha criada';

  @override
  String get auditLogActionStickerUpdate => 'Figurinha atualizada';

  @override
  String get auditLogActionStickerDelete => 'Figurinha excluída';

  @override
  String get auditLogActionMessageDelete => 'Mensagem excluída';

  @override
  String get auditLogActionMessageBulkDelete => 'Mensagens excluídas';

  @override
  String get auditLogActionMessagePin => 'Mensagem fixada';

  @override
  String get auditLogActionMessageUnpin => 'Mensagem desfixada';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor atualizou as configurações da comunidade.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor criou o canal $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor atualizou o canal $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor excluiu o canal $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor adicionou permissões de canal para $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor adicionou permissões de canal para $target em $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor atualizou permissões de canal para $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor atualizou permissões de canal para $target em $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor removeu permissões de canal para $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor removeu permissões de canal para $target em $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor expulsou $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor baniu $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor des επιβλήθηκε banimento de $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor atualizou $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor atualizou as funções de $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor removeu membros inativos.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor removeu membros inativos por $days dias.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor moveu $target para outro canal de voz.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor moveu $target para $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor desconectou $target do áudio.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor adicionou o bot $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor criou a função $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor atualizou a função $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor excluiu a função $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor criou o convite $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor criou o convite $target para $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor atualizou o convite $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor atualizou o convite $target para $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor excluiu o convite $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor excluiu o convite $target para $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor criou o webhook $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor atualizou o webhook $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor excluiu o webhook $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor adicionou o emoji $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor atualizou o emoji $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor excluiu o emoji $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor adicionou o sticker $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor atualizou o sticker $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor excluiu o sticker $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor excluiu uma mensagem.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor excluiu uma mensagem em $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor excluiu várias mensagens.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor excluiu $count mensagens.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor excluiu várias mensagens em $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor excluiu $count mensagens em $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor fixou uma mensagem.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor fixou uma mensagem em $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor desfixou uma mensagem.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor desfixou uma mensagem em $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor realizou uma ação de auditoria em $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Atualizou $field de $oldValue para $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Definiu $field para $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Limpou $field (era $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Atualizou $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Renomeou a comunidade para $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Atualizou o ícone da comunidade.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Renomeou o canal para $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Limpou o tópico.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Atualizou o tópico para $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent => 'Ativou conteúdo adulto.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Desativou conteúdo adulto.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Definiu o apelido para $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Removeu o apelido $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Silenciou o membro.';

  @override
  String get auditLogChangeUnmutedMember => 'Ativou o som do membro.';

  @override
  String get auditLogChangeDeafenedMember => 'Deixou o membro surdo.';

  @override
  String get auditLogChangeUndeafenedMember => 'Tirou a surdez do membro.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Adicionou $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Removeu $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Canal: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Mensagem: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Convidado por $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Excluídas # mensagens.',
      one: 'Excluída # mensagem.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Membros removidos #.',
      one: 'Membro removido #.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires => 'Este convite nunca expira.';

  @override
  String get auditLogOptionTemporaryMembership =>
      'Concede associação temporária.';

  @override
  String get auditLogOptionPermanentMembership =>
      'Concede associação permanente.';

  @override
  String get guildSettingsLoadMore => 'Carregar mais';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Veja e gerencie todos os webhooks configurados na sua comunidade.';

  @override
  String get guildSettingsWebhooksEmpty => 'Nenhum webhook';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'Esta comunidade ainda não tem webhooks. Vá para $channelSettingsPath para criar um.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'Você precisa da permissão \"$permission\" para ver e editar webhooks desta comunidade.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle =>
      'Não foi possível carregar os webhooks';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'Ocorreu um erro ao carregar os webhooks. Tente novamente.';

  @override
  String get guildSettingsWebhooksUpdated => 'Webhooks atualizados';

  @override
  String get guildSettingsWebhooksUpdateFailed => 'Falha ao atualizar webhooks';

  @override
  String get guildSettingsUnknownChannel => 'Canal desconhecido';

  @override
  String get guildSettingsCopyUrl => 'Copiar URL';

  @override
  String get guildSettingsCopiedUrl =>
      'URL copiada para a área de transferência';

  @override
  String get guildSettingsDeleteWebhook => 'Excluir webhook';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Defina um link de convite personalizado para o seu servidor.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Salvar';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Uso';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count usos';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Liste sua comunidade em Descobrir para que outras pessoas possam encontrá-la e participar.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle => 'Poucos membros';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Sua comunidade precisa de pelo menos $count membros para ser listada em Descoberta.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Status:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'Pendente';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Aprovado';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Rejeitado';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Removido';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Motivo: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'Sua comunidade está na aba Descobrir. Você pode atualizar os detalhes ou retirá-la para removê-la.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Sua inscrição está pendente de análise. Você ainda pode atualizar os detalhes do seu anúncio ou retirar a inscrição.';

  @override
  String get guildSettingsDiscoveryCategory => 'Categoria';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Escolha a categoria que melhor descreve sua comunidade. Você pode mudar isso a qualquer momento.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Idioma principal';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'O idioma que a maioria da sua comunidade fala. Usado para filtrar os resultados da Descoberta.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Descrição';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Descreva sobre o que é sua comunidade';

  @override
  String get guildSettingsDiscoveryDescriptionRequired =>
      'É preciso adicionar uma descrição.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'A descrição deve ter pelo menos $minLength caracteres.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'A descrição não pode ter mais que $maxLength caracteres.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Tags';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Até $maxTags tags ajudam as pessoas a encontrar sua comunidade. Elas aparecem na pesquisa do Discovery.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint =>
      'Adicione uma tag e pressione Enter';

  @override
  String get guildSettingsDiscoveryAddTag => 'Adicionar';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Remover tag $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle =>
      'Não foi possível adicionar a tag';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'As tags devem ter de 2 a $maxLength caracteres e ser alfanuméricas.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'Você só pode adicionar até $maxTags tags.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Aplicar';

  @override
  String get guildSettingsDiscoverySave => 'Salvar';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Retirar';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Solicitação de descoberta enviada';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Lista de descoberta atualizada';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Inscrição para descoberta retirada';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Não foi possível retirar a inscrição';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Tente novamente em alguns instantes.';

  @override
  String get guildSettingsMembersDescription =>
      'Pesquise e gerencie os membros do servidor.';

  @override
  String get guildSettingsMembersSearchHint =>
      'Pesquisar por nome de usuário ou ID';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count membros';
  }

  @override
  String get guildMembersRecentTitle => 'Membros recentes';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Exibindo $displayedCount de $totalCount membros no total';
  }

  @override
  String get guildMembersSort => 'Ordenar';

  @override
  String get guildSettingsMembersSortNewest => 'Mais recentes primeiro';

  @override
  String get guildMembersSortOldest => 'Mais antigos primeiro';

  @override
  String get guildMembersColumnName => 'Nome';

  @override
  String get guildMembersColumnMemberSince => 'Membro desde';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'Entrou no $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Método de entrada';

  @override
  String get guildMembersColumnRoles => 'Cargos';

  @override
  String get guildMembersColumnActions => 'Ações';

  @override
  String get guildMembersFilterMemberSince => 'Filtrar por membro desde';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Filtrar por data de criação da conta';

  @override
  String get guildMembersFilterJoinMethod => 'Filtrar por método de entrada';

  @override
  String get guildMembersFilterRoles => 'Filtrar por cargos';

  @override
  String get guildMembersFilterAll => 'Todos';

  @override
  String get guildMembersFilterPast1Hour => 'Última 1 hora';

  @override
  String get guildMembersFilterPast24Hours => 'Últimas 24 horas';

  @override
  String get guildMembersFilterPast7Days => 'Últimos 7 dias';

  @override
  String get guildMembersFilterPast2Weeks => 'Últimas 2 semanas';

  @override
  String get guildMembersFilterPast3Weeks => 'Últimas 3 semanas';

  @override
  String get guildMembersFilterPast4Weeks => 'Últimas 4 semanas';

  @override
  String get guildMembersFilterPast3Months => 'Últimos 3 meses';

  @override
  String get guildMembersFilterCustomRange => 'Intervalo personalizado...';

  @override
  String get guildMembersDateRangeTitle => 'Período personalizado';

  @override
  String get guildMembersDateAfter => 'Depois de';

  @override
  String get guildMembersDateBefore => 'Antes da data';

  @override
  String get guildMembersClearAll => 'Limpar tudo';

  @override
  String get guildMembersRowsPerPage => 'Linhas por página';

  @override
  String get guildMembersEmptySearch => 'Ninguém corresponde a essa busca.';

  @override
  String get guildMembersLoadError =>
      'Ocorreu um erro ao carregar os membros. Tente novamente mais tarde.';

  @override
  String get guildMembersIndexing => 'Indexando membros…';

  @override
  String get guildMembersGoToPage => 'Ir para a página';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'Ir para a página $page';
  }

  @override
  String get guildMembersJumpToPage => 'Ir para a página';

  @override
  String get guildMembersJoinSourceCreator => 'Criador da comunidade';

  @override
  String get guildMembersJoinSourceInvite => 'Convidar';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Convite ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Convidado por $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'URL personalizada';

  @override
  String get guildMembersJoinSourceBotInvite => 'Convite de bot';

  @override
  String get guildMembersJoinSourcePlatformAdmin =>
      'Administrador da plataforma';

  @override
  String get guildMembersJoinSourceDiscovery => 'Descoberta';

  @override
  String get guildMembersJoinMethodUnknown => 'Desconhecido';

  @override
  String get guildMembersCommunityOwner => 'Dono da comunidade';

  @override
  String get guildMembersViewAllRoles => 'Ver todos os cargos';

  @override
  String get guildMembersJoinedJustNow => 'Agora mesmo';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutos atrás',
      one: '1 minuto atrás',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count horas atrás',
      one: '1 hora atrás',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dias atrás',
      one: '1 dia atrás',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Membros';

  @override
  String get guildMembersChannelListSelected => 'Membros, selecionados';

  @override
  String get guildSettingsInvitesTitle => 'Convites';

  @override
  String get guildSettingsInvitesDescription =>
      'Veja todos os convites desta comunidade. Para criar um novo convite, vá para um canal e use o botão de convite.';

  @override
  String get guildSettingsInvitesEmpty => 'Nenhum link de convite';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Esta comunidade ainda não tem links de convite. Vá para um canal e crie um convite para chamar pessoas.';

  @override
  String get guildSettingsInvitesLoadFailedTitle =>
      'Não foi possível carregar os convites';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Ocorreu um erro ao carregar os convites. Tente novamente.';

  @override
  String get guildSettingsInvitesTryAgain => 'Tentar novamente';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Mostrar data de criação em vez de data de expiração';

  @override
  String get guildSettingsInvitesPauseInvites => 'Pausar convites';

  @override
  String get guildSettingsInvitesEnableInvites => 'Ativar convites';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Pausar convites para esta comunidade';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Ativar convites para esta comunidade';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Pausar convites? Novos usuários não poderão entrar por links de convite até que você os reative. Membros existentes não serão afetados.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Ativar convites? Os usuários poderão entrar nesta comunidade novamente por meio de links de convite.';

  @override
  String get guildSettingsInvitesPause => 'Pausar';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Os convites estão pausados para esta comunidade.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Os convites estão pausados porque o $productName detectou um possível ataque. Novos usuários não podem entrar agora.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Quem convidou:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Canal:';

  @override
  String get guildSettingsInvitesLabelCode => 'Código:';

  @override
  String get guildSettingsInvitesLabelUses => 'Usa:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Criado:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Expira:';

  @override
  String get guildSettingsInvitesUnknown => 'Desconhecido';

  @override
  String get guildSettingsInvitesNoCategory => 'Sem categoria';

  @override
  String get guildSettingsInvitesExpired => 'Expirado';

  @override
  String get guildSettingsInvitesNever => 'Nunca';

  @override
  String get guildSettingsInvitesCopyLink => 'Copiar link de convite';

  @override
  String get guildSettingsInvitesRevoke => 'Revogar convite';

  @override
  String get guildSettingsInvitesRevokeFailedTitle =>
      'Não foi possível revogar o convite';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'O link ainda pode funcionar. Tente novamente em alguns instantes.';

  @override
  String guildSettingsInviteUses(int uses, int maxUses) {
    return '$uses / $maxUses usos';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Expira em $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Visualize e gerencie usuários banidos.';

  @override
  String get guildSettingsBansSearchHint => 'Pesquisar banimentos';

  @override
  String get guildSettingsBansEmpty => 'Nenhum usuário banido.';

  @override
  String get guildSettingsBanPermanent => 'Banimento permanente';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Expira em $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Expira';

  @override
  String get guildSettingsUnban => 'Desbanir';

  @override
  String get guildSettingsBansLoading => 'Carregando usuários banidos';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Nenhum banimento encontrado correspondendo à sua pesquisa.';

  @override
  String get guildSettingsBanDetailsTitle => 'Detalhes do banimento';

  @override
  String get guildSettingsBanViewDetails => 'Ver detalhes';

  @override
  String get guildSettingsBannedOn => 'Banido em';

  @override
  String get guildSettingsBannedBy => 'Banido por';

  @override
  String get guildSettingsRevokeBanTitle => 'Revogar banimento';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Tem certeza de que deseja revogar o banimento de $displayName? Ele poderá voltar para a comunidade.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Banimento revogado para $displayName';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Não foi possível carregar os banimentos. Tente novamente.';

  @override
  String get guildSettingsRevokeBanError =>
      'Não foi possível revogar o banimento. Tente novamente.';

  @override
  String get guildSettingsCommunitySettings => 'Configurações da Comunidade';

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
      'Gerencie o perfil, os canais e as configurações padrão da sua comunidade.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Identidade Visual';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Atualize seu ícone, nome, banner e plano de fundo do convite';

  @override
  String get guildSettingsOverviewBannerUpload => 'Carregar banner';

  @override
  String get guildSettingsOverviewIdleTitle => 'Configurações de inatividade';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Configure o canal AFK e o tempo limite';

  @override
  String get guildSettingsOverviewSystemTitle => 'Sistema e boas-vindas';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Escolha o destino para mensagens do sistema e de boas-vindas';

  @override
  String get guildSettingsOverviewNotificationsTitle => 'Notificações padrão';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Comunidades com mais de 250 pessoas são forçadas à configuração \"apenas menções\". Sua configuração original é preservada e será restaurada se a comunidade cair abaixo de 250 membros.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Avançado';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Permitir nomes de canais de texto flexíveis';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Ocultar coroa do proprietário da comunidade';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Banner destacado';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Mostra o banner em sua própria seção abaixo do cabeçalho da comunidade.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Carregar ícone';

  @override
  String get guildSettingsOverviewRemoveImage => 'Remover';

  @override
  String get guildSettingsOverviewSplashTitle => 'Fundo do convite';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'Fundo do embed de chat';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Exibido em embeds de convite no chat.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Carregar fundo';

  @override
  String get guildSettingsOverviewNoCommunityBanner =>
      'Sem banner da comunidade';

  @override
  String get guildSettingsOverviewNoInviteBackground => 'Sem fundo de convite';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Prévia';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Veja como seu convite aparece para os visitantes.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Nomes de canais de texto';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Coroa do proprietário da comunidade';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Configure se o ícone da coroa é exibido ao lado do proprietário da comunidade';

  @override
  String get guildSettingsSplashCardAlignment => 'Alinhamento do card';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Centro';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Esquerda';

  @override
  String get guildSettingsSplashAlignmentRight => 'Direita';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Aplica-se apenas em telas largas.';

  @override
  String get permissionReadMessageHistory => 'Ler histórico de mensagens';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Alterar o que usuários sem \"$permission\" podem ver';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Use um modal dedicado para definir uma data limite de histórico de mensagens para membros que não possuem a permissão $permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Abrir limite de histórico de mensagens';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Limite de histórico de mensagens';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Habilitar limite de histórico de mensagens';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Data limite';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Membros sem Ler Histórico de Mensagens podem ver mensagens enviadas após esta data.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Limite de histórico de mensagens atualizado';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Permite letras maiúsculas e espaços em nomes de canais de texto. Desativado restringe nomes a minúsculas com hifens e underscores.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Oculta o ícone da coroa ao lado do proprietário da comunidade em todas as superfícies.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Ícones animados exigem o recurso de comunidade Ícone Animado.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Banners animados exigem o recurso de comunidade Banner Animado.';

  @override
  String get guildSettingsAfkChannel => 'Canal AFK / ocioso';

  @override
  String get guildSettingsAfkChannelHint =>
      'Mova membros para este canal quando estiverem AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Sem canal AFK';

  @override
  String get guildSettingsAfkTimeout => 'Tempo limite AFK';

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
      'Mensagens de boas-vindas e do sistema aparecerão aqui.';

  @override
  String get guildSettingsNoSystemChannel => 'Sem canal de sistema';

  @override
  String get guildSettingsHideJoinMessages => 'Ocultar mensagens de entrada';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Suprime as mensagens de entrada no canal de destino.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Configurações de notificação padrão';

  @override
  String get guildSettingsNotificationsAll => 'Todas as mensagens';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Notificar sobre todas as mensagens';

  @override
  String get guildSettingsNotificationsMentions => 'Apenas menções';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Notificar apenas sobre menções';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Máx. 10MB. Mínimo: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Máx. 10MB. Mínimo: 960×540px (16:9). Exibido em embeds de convite no chat.';

  @override
  String get guildSettingsModerationDescription =>
      'Configure as configurações de verificação, filtragem de conteúdo e conteúdo adulto.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Comunidades listadas na Discovery têm opções de moderação restritas.';

  @override
  String get guildSettingsModerationContentFilterTitle =>
      'Filtragem de conteúdo';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Verifique automaticamente as mensagens em busca de conteúdo explícito em canais não marcados como adultos.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Comunidades listadas na Discovery são obrigadas a verificar todos os membros. Esta configuração não pode ser alterada enquanto a Discovery estiver ativada.';

  @override
  String get guildSettingsContentFilterOff => 'Desativado';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Deixe a comunidade se auto-moderar';

  @override
  String get guildSettingsContentFilterNoRole => 'Filtrar membros sem cargos';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Sugerido para a maioria das comunidades';

  @override
  String get guildSettingsContentFilterAll => 'Filtrar todos';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Proteção máxima para espaços familiares';

  @override
  String get guildSettingsModerationMatureOff => 'Desativado';

  @override
  String get guildSettingsModerationMatureOn => 'Ativado';

  @override
  String get guildSettingsContentWarningToggle => 'Mostrar aviso de conteúdo';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Ativa um prompt de consentimento antes de entrar em qualquer canal.';

  @override
  String get guildSettingsContentWarningText => 'Texto de aviso personalizado';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Isto contém conteúdo sensível.';

  @override
  String get guildSettingsModeration2faTitle => 'Requisito de 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'Exija autenticação de dois fatores para moderadores antes que eles possam banir, expulsar, silenciar ou remover mensagens.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Exigir 2FA para ações de moderação';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Apenas o proprietário da comunidade pode alterar esta configuração';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Ative o 2FA em sua conta para alterar esta configuração';

  @override
  String get guildSettingsEmojiSearchHint => 'Pesquisar emojis';

  @override
  String get guildSettingsEmojiUploadTitle => 'Carregar figurinha';

  @override
  String get guildSettingsEmojiSlotsTitle => 'Espaços para emojis';

  @override
  String get guildSettingsEmojiDropZone =>
      'Arraste e solte os arquivos de emoji aqui';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Não foi possível carregar os emojis. Tente novamente mais tarde.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'Nenhum emoji encontrado para sua busca.';

  @override
  String get guildSettingsEmojiNoSlots => 'Nenhum espaço para emoji disponível';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Você atingiu o número máximo de emojis. Exclua alguns emojis existentes para liberar espaço.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Os nomes dos emojis precisam ter pelo menos 2 caracteres e podem usar letras, números e sublinhados. Os emojis devem ter no máximo $maxSize. Imagens estáticas são redimensionadas para 128x128 pixels e compactadas automaticamente. Emojis animados e SVGs já devem estar dentro do limite.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'Carregando emojis';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# emojis',
      one: '# emoji',
    );
    return 'Enviando $_temp0. Isso pode levar um tempinho.';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'Falha ao carregar emojis. Tente novamente.';

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Não foi possível adicionar alguns emojis';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'Revise estes arquivos e tente novamente com imagens menores ou mais simples.';

  @override
  String get guildSettingsEmojiRenameTitle => 'Renomear figurinha';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2 a 32 caracteres, letras, números, sublinhados.';

  @override
  String get guildSettingsEmojiColumnEmoji => 'Emoji';

  @override
  String get guildSettingsEmojiColumnName => 'Nome';

  @override
  String get guildSettingsEmojiColumnUploader => 'Enviado por';

  @override
  String get guildSettingsEmojiUnknownUploader => 'Desconhecido';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Apagar figurinha';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'Excluir :$name:? Não pode ser desfeito.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Limpar este emoji do armazenamento e da CDN';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'O nome do emoji deve ter pelo menos 2 caracteres';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'O nome do emoji deve ter no máximo 32 caracteres';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Nome de emoji inválido';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Não foi possível renomear este emoji';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'O nome foi revertido para o que era antes. Tente novamente em alguns instantes.';

  @override
  String get guildSettingsEmojiGoneTitle => 'Este emoji não existe mais';

  @override
  String get guildSettingsEmojiGoneBody =>
      'Ele pode ter sido excluído. O nome foi revertido para o que era antes.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'Você não pode renomear este emoji';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'Você não tem permissão para renomear este emoji. O nome foi revertido para o anterior.';

  @override
  String get guildSettingsEmojiRateLimitedTitle =>
      'Você está indo rápido demais';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'Aguarde um momento e tente renomear novamente.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Não foi possível excluir este emoji';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'Não é possível excluir este emoji';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'Permitir que outras pessoas copiem seus emojis';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'Quando ativado, membros de outras comunidades podem usar o atalho \"Clonar\" de um clique no aplicativo para seus emojis personalizados. Isso não os impede de salvar a imagem e fazer o upload por conta própria.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Permitir que outras pessoas copiem seus stickers';

  @override
  String get guildSettingsCloneStickerDescription =>
      'Quando ativado, membros de outras comunidades podem usar o atalho de \"Clonar\" com um clique no app para seus figurinhas personalizadas. Isso não os impede de salvar a imagem e fazer o upload por conta própria.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Somente membros com a permissão \"$permission\" podem alterar isso.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'Não foi possível atualizar o recurso de clonagem de emojis';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Não foi possível atualizar o recurso de clonagem de figurinhas';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Emoji não animado ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Emoji animado ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Pesquisar figurinhas';

  @override
  String get guildSettingsStickerSlotsTitle => 'Espaços para figurinhas';

  @override
  String get guildSettingsStickerUploadTitle => 'Carregar figurinha';

  @override
  String get guildSettingsStickerDropZone =>
      'Arraste e solte um arquivo de figurinha aqui (um por vez)';

  @override
  String get guildSettingsStickerDensity => 'Densidade dos stickers';

  @override
  String get guildSettingsStickerDensityCozy => 'Aconchegante';

  @override
  String get guildSettingsStickerDensityCompact => 'Compacto';

  @override
  String get guildSettingsStickersLoadFailedTitle =>
      'Não foi possível carregar os stickers';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Ocorreu um erro ao carregar os figurinhas. Tente novamente.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Nenhum sticker encontrado para sua busca.';

  @override
  String get guildSettingsStickersEmptySearch => 'Nenhum sticker encontrado';

  @override
  String get guildSettingsStickerNoSlots =>
      'Nenhum espaço para figurinhas disponível';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Você atingiu o número máximo de figurinhas. Exclua algumas figurinhas existentes para liberar espaço.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Os adesivos são salvos em 320x320 pixels e devem ter no máximo $maxSize. Imagens estáticas são redimensionadas e compactadas automaticamente. Adesivos animados e SVGs já devem estar dentro do limite.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle =>
      'Arquivo de figurinha não suportado';

  @override
  String get guildSettingsStickerAddTitle => 'Adicionar figurinha';

  @override
  String get guildSettingsStickerEditTitle => 'Editar figurinha';

  @override
  String get guildSettingsStickerNameLabel => 'Nome';

  @override
  String get guildSettingsStickerNameHint => 'Meu figurão irado';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Descrição';

  @override
  String get guildSettingsStickerDescriptionHint => 'Descreva a figurinha';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Tags ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Adicionar uma tag';

  @override
  String get guildSettingsStickerTagAdd => 'Adicionar';

  @override
  String get guildSettingsStickerNameRequired => 'O nome é obrigatório';

  @override
  String get guildSettingsStickerNameTooShort =>
      'O nome deve ter pelo menos 2 caracteres';

  @override
  String get guildSettingsStickerNameTooLong =>
      'O nome deve ter até 30 caracteres';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'A descrição deve ter 500 caracteres ou menos';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'Não foi possível criar este sticker';

  @override
  String get guildSettingsStickerTooLargeTitle => 'O sticker é muito grande';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'Não foi possível compactar o sticker o suficiente';

  @override
  String get guildSettingsStickerDeleteTitle => 'Apagar figurinha';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'Excluir \"$name\"? Não pode ser desfeito.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Apagar este sticker do armazenamento e da CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Não foi possível excluir este sticker';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'Você não pode excluir este sticker';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Para criar um webhook, abra $channelSettingsPath. Você ainda pode editar e organizar todos os webhooks existentes aqui.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'Sua URL de vaidade não funcionará a menos que pelo menos um canal seja visível para todos.';

  @override
  String get guildSettingsVanityUrlRemove => 'Remover';

  @override
  String get guildSettingsBannedUsersTitle => 'Usuários banidos';

  @override
  String get guildSettingsInvitesTableInviter => 'Convidante';

  @override
  String get guildSettingsInvitesTableChannel => 'Canal';

  @override
  String get guildSettingsInvitesTableCode => 'Código';

  @override
  String get guildSettingsInvitesTableUses => 'Usos';

  @override
  String get guildSettingsInvitesTableCreated => 'Criado';

  @override
  String get guildSettingsInvitesTableExpires => 'Expira em';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtrar por usuário';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtrar por ação';

  @override
  String get createDm => 'Criar conversa';

  @override
  String get createGroupDm => 'Criar grupo de DM';

  @override
  String get createDmNewMessage => 'Nova mensagem';

  @override
  String get createDmSelectFriends => 'Selecionar amigos';

  @override
  String get createDmChooseFriendsSubtitle => 'Escolha amigos para conversar.';

  @override
  String get createDmSearchFriends => 'Pesquisar amigos';

  @override
  String get createDmNoFriendsFound => 'Nenhum amigo encontrado';

  @override
  String get createDmNoFriendsYet => 'Você ainda não tem amigos';

  @override
  String get createDmClaimToStartDms => 'Ative sua conta para iniciar DMs.';

  @override
  String get createDmVerifyToStartDms =>
      'Verifique seu e-mail para iniciar DMs.';

  @override
  String get createDmVerifyYourEmail => 'Verifique seu e-mail';

  @override
  String get createDmNewGroup => 'Novo grupo';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Criar um novo grupo com $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'Confirmar novo grupo';

  @override
  String get createDmCreateNewGroup => 'Criar novo grupo';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'Remover $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'Você já tem um grupo com esses usuários. Quer mesmo criar um novo? Tudo bem também!';

  @override
  String get createDmNoActivityYet => 'Nenhuma atividade ainda';

  @override
  String get createDmSomeUsersCantBeAdded =>
      'Alguns usuários não podem ser adicionados';

  @override
  String get createDmCreateWithoutThem => 'Criar sem eles';

  @override
  String get createDmUnaddableIntro =>
      'As pessoas a seguir não podem ser adicionadas a este grupo de DM:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Criar a conversa em grupo com os $count destinatário(s) restantes e pular os outros?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Não há mais destinatários para criar um grupo de DM.';

  @override
  String get createDmUnaddableUserNotFound => 'Usuário não encontrado';

  @override
  String get createDmUnaddableBlocked =>
      'Você não pode enviar mensagens para este usuário';

  @override
  String get createDmUnaddableNotFriends => 'Não está na sua lista de amigos';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Não permite ser adicionado a DMs em grupo';

  @override
  String get createDmFailed =>
      'Não foi possível criar a conversa. Tente novamente.';

  @override
  String get dmListMessagesTitle => 'Mensagens';

  @override
  String get dmListDirectMessagesTitle => 'Mensagens diretas';

  @override
  String get keybindsSearchShortcuts => 'Pesquisar atalhos';

  @override
  String get keybindSectionDefaults => 'Padrões';

  @override
  String get keybindSectionMessages => 'Mensagens';

  @override
  String get keybindSectionNavigation => 'Navegação';

  @override
  String get keybindSectionDragAndDrop => 'Arrastar e soltar';

  @override
  String get keybindSectionChat => 'Bate-papo';

  @override
  String get keybindSectionVoiceAndVideo => 'Voz e vídeo';

  @override
  String get keybindSectionMisc => 'Diversos';

  @override
  String get keybindActionShowShortcutsList =>
      'Mostrar lista de atalhos do teclado';

  @override
  String get keybindActionCopyText => 'Copiar texto';

  @override
  String get keybindActionMarkUnread => 'Marcar como não lida';

  @override
  String get keybindActionFocusTextarea => 'Focar na área de texto';

  @override
  String get keybindActionSwitchCommunities => 'Alternar entre comunidades';

  @override
  String get keybindActionSwitchChannels => 'Alternar entre canais';

  @override
  String get keybindActionHistoryBack =>
      'Voltar no histórico de canais visualizados';

  @override
  String get keybindActionHistoryForward =>
      'Avançar no histórico de canais visualizados';

  @override
  String get keybindActionJumpUnreadChannels => 'Pular entre canais não lidos';

  @override
  String get keybindActionJumpMentionChannels =>
      'Pular entre canais não lidos com menções';

  @override
  String get keybindActionJumpCurrentCall => 'Ir para a chamada atual';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Alternar entre a última comunidade e as DMs';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Mudar para a comunidade anterior ou DMs';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Mudar para a próxima comunidade ou DMs';

  @override
  String get keybindActionGoToDms => 'Ir para Mensagens Diretas';

  @override
  String get keybindActionGoToFirstCommunity => 'Ir para a primeira comunidade';

  @override
  String get keybindActionGoToSecondCommunity => 'Ir para a segunda comunidade';

  @override
  String get keybindActionGoToThirdCommunity => 'Ir para a terceira comunidade';

  @override
  String get keybindActionGoToFourthCommunity => 'Ir para a quarta comunidade';

  @override
  String get keybindActionGoToFifthCommunity => 'Ir para a quinta comunidade';

  @override
  String get keybindActionGoToSixthCommunity => 'Ir para a sexta comunidade';

  @override
  String get keybindActionGoToSeventhCommunity => 'Ir para a sétima comunidade';

  @override
  String get keybindActionGoToEighthCommunity => 'Ir para a oitava comunidade';

  @override
  String get keybindActionToggleQuickSwitcher => 'Alternar troca rápida';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'Criar ou entrar em uma comunidade';

  @override
  String get keybindActionStartDragAndDrop => 'Iniciar arrastar e soltar';

  @override
  String get keybindActionMove => 'Mover';

  @override
  String get keybindActionDropItem => 'Soltar item';

  @override
  String get keybindActionCancel => 'Cancelar';

  @override
  String get keybindActionMarkCommunityRead => 'Marcar comunidade como lida';

  @override
  String get keybindActionMarkChannelRead => 'Marcar canal como lido';

  @override
  String get keybindActionStartGroupDm => 'Iniciar um DM em grupo';

  @override
  String get keybindActionTogglePinnedMessages => 'Fixar/desafixar mensagens';

  @override
  String get keybindActionToggleInbox => 'Alternar a caixa de entrada';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Marcar o canal principal da caixa de entrada como lido';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Marcar todos os canais da caixa de entrada como lidos';

  @override
  String get keybindActionToggleMemberList =>
      'Alternar a lista de membros ou o chat de voz';

  @override
  String get keybindActionToggleEmojiPicker => 'Abrir/fechar seletor de emojis';

  @override
  String get keybindActionToggleGifPicker => 'Abrir/fechar o seletor de GIFs';

  @override
  String get keybindActionToggleStickerPicker =>
      'Alternar o seletor de figurinhas';

  @override
  String get keybindActionScrollChatUp => 'Rolar o chat para cima';

  @override
  String get keybindActionScrollChatDown => 'Rolar o chat para baixo';

  @override
  String get keybindActionJumpOldestUnread =>
      'Ir para a mensagem não lida mais antiga';

  @override
  String get keybindActionFocusComposer => 'Focar na área de texto';

  @override
  String get keybindActionUploadFile => 'Carregar um arquivo';

  @override
  String get keybindActionCopyChannelLink => 'Copiar link do canal';

  @override
  String get keybindActionToggleSavedMedia => 'Alternar mídias salvas';

  @override
  String get keybindActionSendVoiceMessage => 'Enviar mensagem de voz';

  @override
  String get keybindActionAnswerCall => 'Atender a chamada recebida';

  @override
  String get keybindActionDeclineCall => 'Recusar chamada';

  @override
  String get keybindActionStartDmCall =>
      'Iniciar uma chamada em uma conversa ou grupo';

  @override
  String get keybindActionToggleSoundboard => 'Alternar a mesa de som';

  @override
  String get keybindActionToggleCompactCallView =>
      'Expandir ou recolher a visualização compacta da chamada';

  @override
  String get keybindActionPushToTalkPriority =>
      'Pressionar para falar (prioridade)';

  @override
  String get keybindActionVoiceActivityPriority =>
      'Prioridade de atividade de voz';

  @override
  String get keybindActionOpenHelp => 'Abrir ajuda';

  @override
  String get keybindActionSearchMessages => 'Pesquisar mensagens';

  @override
  String get keybindActionOpenContextMenu => 'Abrir o menu de contexto';

  @override
  String get keybindActionOpenSettings => 'Abrir suas configurações';

  @override
  String get keybindActionOpenThemeStudio => 'Abrir estúdio de temas pop-out';

  @override
  String get keybindActionZoomIn => 'Mais zoom';

  @override
  String get keybindActionZoomOut => 'Reduzir zoom';

  @override
  String get keybindActionZoomReset => 'Redefinir zoom';

  @override
  String get clipboardPasteFailed =>
      'Não foi possível colar. A área de transferência estava vazia ou bloqueada para este app.';

  @override
  String get homeQuickActionDms => 'Mensagens diretas';
}
