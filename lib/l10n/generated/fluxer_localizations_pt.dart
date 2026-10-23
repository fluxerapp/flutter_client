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
  String get chatJumpToPresent => 'Ir para o presente';

  @override
  String get chatViewingOlderMessages => 'Você está vendo mensagens antigas';

  @override
  String get chatNewMessagesBarJumpToFirstUnread =>
      'Ir para a primeira mensagem não lida';

  @override
  String get chatNewMessagesBarMarkAsRead => 'Marcar como lido';

  @override
  String get chatNewMessagesBarMarkRead => 'Marcar lido';

  @override
  String chatNewMessagesBarNewMessagesSinceEstimated(
    int unreadCount,
    String compactTime,
  ) {
    final intl.NumberFormat unreadCountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String unreadCountString = unreadCountNumberFormat.format(
      unreadCount,
    );

    return '$unreadCountString+ novas mensagens desde $compactTime';
  }

  @override
  String chatNewMessagesBarNewMessagesSince(
    int unreadCount,
    String compactTime,
  ) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount novas mensagens',
      one: '$unreadCount nova mensagem',
    );
    return '$_temp0 desde $compactTime';
  }

  @override
  String chatNewMessagesBarNewSinceEstimated(
    int unreadCount,
    String shortTime,
  ) {
    final intl.NumberFormat unreadCountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String unreadCountString = unreadCountNumberFormat.format(
      unreadCount,
    );

    return '$unreadCountString+ novas desde $shortTime';
  }

  @override
  String chatNewMessagesBarNewSince(int unreadCount, String shortTime) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount novas',
      one: '$unreadCount nova',
    );
    return '$_temp0 desde $shortTime';
  }

  @override
  String get reconnectingBody =>
      'Algo está errado com os servidores.\nDeve ser consertado em um segundo!';

  @override
  String get gatewayReconnectingToast => 'Reconectando…';

  @override
  String get gatewayReconnectTryAgain => 'Tentar novamente';

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
    return 'Uma manutenção está agendada para $localizedTime. Duração prevista: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Manutenção em andamento. Duração prevista: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'A manutenção foi concluída.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Olá, $displayName, reivindique sua conta para não perder o acesso.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Olá, $displayName, verifique seu endereço de e-mail.';
  }

  @override
  String get nagbarOpenSettings => 'Abrir configurações';

  @override
  String get systemPermissionSettingsTitle => 'Ativar permissão';

  @override
  String get systemPermissionSettingsOpenSettings => 'Abrir configurações';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return 'O $productName não tem acesso ao seu microfone. Você pode ativá-lo nas configurações de privacidade do dispositivo.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return 'O $productName não tem acesso à sua câmera. Você pode ativá-la nas configurações de privacidade do dispositivo.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return 'O $productName não tem acesso à sua galeria de fotos. Você pode permitir o acesso nas configurações de privacidade do dispositivo.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return 'O $productName não tem permissão para enviar notificações. Você pode ativá-la nas configurações do dispositivo.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Não foi possível renovar sua assinatura, mas você ainda tem acesso às vantagens do $productName até $graceDate. Resolva agora ou você perderá todas as vantagens.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Sua assinatura $productName expirou. Renove agora para manter suas vantagens.';
  }

  @override
  String get nagbarManageSubscription => 'Gerenciar assinatura';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Boas-vindas ao $productFullName. Explore suas vantagens do $productName e gerencie sua assinatura.';
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
      'Atualizamos nossos termos. Revise e aceite-os para continuar.';

  @override
  String get nagbarReviewTerms => 'Revisar termos';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Entre em $communityName para conversar com a equipe e ficar por dentro das novidades.';
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
  String get needAccountPrompt => 'Precisa de uma conta? ';

  @override
  String get register => 'Registrar';

  @override
  String get orDivider => 'OU';

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
  String get next => 'Avançar';

  @override
  String get create => 'Criar';

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
  String get accountRemoveDescription =>
      'Isso removerá a sessão salva para esta conta.';

  @override
  String accountSignOutTitle(String identifier) {
    return 'Sair de $identifier?';
  }

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
  String get recoverAccountTitle => 'Recupere sua conta';

  @override
  String get recoverAccountDescription =>
      'Digite seu nome de usuário e a chave de recuperação do seu kit, depois escolha uma nova senha.';

  @override
  String get recoverAccountNoKit =>
      'Sem kit de recuperação? Peça a um administrador desta instância um link para redefinir sua senha.';

  @override
  String get recoveryKitTitle => 'Seu kit de recuperação';

  @override
  String get recoveryKitCreatedDescription =>
      'Se você esquecer sua senha, este kit é a única forma de voltar para sua conta. Guarde-o em um local seguro, como um gerenciador de senhas ou uma cópia impressa.';

  @override
  String get recoveryKitReplacedDescription =>
      'Seu kit de recuperação antigo não funciona mais. Guarde este novo em um lugar seguro.';

  @override
  String get recoveryKitRecoveredDescription =>
      'Sua senha foi redefinida. Seu kit de recuperação antigo não funciona mais. Guarde este novo em um lugar seguro.';

  @override
  String get recoveryKitWarning =>
      'Qualquer pessoa com esta chave pode redefinir sua senha. Nunca a compartilhe.';

  @override
  String get recoveryKitKeyLabel => 'Chave de recuperação';

  @override
  String recoveryKitDocumentTitle(String productName) {
    return 'Kit de recuperação do $productName';
  }

  @override
  String get recoveryKitDocumentIntro =>
      'Guarde esta página em um local seguro. Se você esquecer sua senha, poderá usá-la para acessar sua conta novamente. Qualquer pessoa com esta chave de recuperação pode redefinir sua senha, portanto, nunca a compartilhe.';

  @override
  String get recoveryKitInstanceLabel => 'Instância';

  @override
  String get recoveryKitCreatedAtLabel => 'Criado';

  @override
  String get recoveryKitQrCaption =>
      'Escaneie para abrir a página de recuperação com seus dados preenchidos.';

  @override
  String get recoveryKitStepsTitle => 'Como recuperar sua conta';

  @override
  String recoveryKitStepOpen(String recoverUrl) {
    return 'Acesse $recoverUrl ou escaneie o QR code.';
  }

  @override
  String get recoveryKitStepEnter =>
      'Digite seu nome de usuário e esta chave de recuperação.';

  @override
  String get recoveryKitStepPassword =>
      'Escolha uma nova senha. Você receberá um novo kit de recuperação e este deixará de funcionar.';

  @override
  String get recoveryKitBackupCodesTitle => 'Códigos de backup de dois fatores';

  @override
  String get recoveryKitBackupCodesNote =>
      'Cada código funciona uma vez no lugar do seu app autenticador.';

  @override
  String get recoveryKitBackupCodesFailed =>
      'Não foi possível carregar seus códigos de backup.';

  @override
  String get recoveryKitIncludeBackupCodes =>
      'Incluir os meus códigos de cópia de segurança da autenticação de dois fatores na imagem guardada';

  @override
  String get recoveryKitCopy => 'Copiar';

  @override
  String get recoveryKitCopied => 'Chave de recuperação copiada';

  @override
  String get recoveryKitSaveImage => 'Guardar imagem';

  @override
  String get recoveryKitSaved => 'Kit de recuperação guardado';

  @override
  String get recoveryKitSavedToPhotos =>
      'Kit de recuperação guardado em Fotografias';

  @override
  String get recoveryKitSaveFailed =>
      'Não foi possível guardar o kit de recuperação. Tenta novamente ou copia a chave.';

  @override
  String get recoveryKitAcknowledge =>
      'Guardei meu kit de recuperação em um lugar seguro';

  @override
  String get recoveryKitCreateFailed =>
      'Não foi possível criar seu kit de recuperação. Você pode criar um mais tarde nas configurações da sua conta.';

  @override
  String get recoveryKitSectionTitle => 'Kit de recuperação';

  @override
  String get recoveryKitSectionDescription =>
      'Permite redefinir sua senha caso você a esqueça.';

  @override
  String get recoveryKitNone => 'Você ainda não tem um kit de recuperação';

  @override
  String recoveryKitCreatedRelative(String time) {
    return 'Criado $time';
  }

  @override
  String get recoveryKitCreate => 'Criar kit de recuperação';

  @override
  String get recoveryKitCreateNew => 'Criar um novo kit';

  @override
  String get recoveryKitReplaceTitle => 'Criar um novo kit de recuperação?';

  @override
  String get recoveryKitReplaceDescription =>
      'Seu kit atual para de funcionar assim que o novo for criado.';

  @override
  String get recoveryKitReminderTitle => 'Salvar um kit de recuperação';

  @override
  String get recoveryKitReminderBody =>
      'Sua conta não tem um endereço de e-mail. Se você esquecer sua senha, um kit de recuperação é a única maneira de voltar. Leva apenas um minuto.';

  @override
  String get registerUsernameSignInHint =>
      'Você faz login com este nome de usuário. Escolha um que você lembrará.';

  @override
  String get registerUsernameTaken => 'Este nome de usuário já está em uso';

  @override
  String get registerUsernameAvailable =>
      'Este nome de usuário está disponível';

  @override
  String get claimAccountUsernameDescription =>
      'Reivindique sua conta escolhendo um nome de usuário e senha. Você fará login com eles, então escolha uns que você lembrará.';

  @override
  String get unclaimedAccountDescriptionUsername =>
      'Sua conta ainda não foi reivindicada. Sem um nome de usuário e senha, você não poderá fazer login em outros dispositivos e poderá perder o acesso à sua conta. Reivindique sua conta agora para protegê-la.';

  @override
  String get addFriendUsernameOnlyHint => 'Nome de usuário';

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
      'O cadastro está fechado no momento. Use um link de cadastro de um administrador para criar uma conta.';

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
      'Esta instância está temporariamente indisponível. Tente novamente em instantes.';

  @override
  String get errorInvalidEmailOrPassword => 'E-mail ou senha inválidos.';

  @override
  String get errorInvalidUsernameOrPassword =>
      'Nome de utilizador ou palavra-passe inválidos.';

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
    return '$count online';
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
      'Os convites estão pausados nesta comunidade.';

  @override
  String embedInvitePausedRaid(String productName) {
    return 'O $productName detectou um possível raid, então novos usuários não podem entrar agora.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Esta comunidade pausou os convites. Tente novamente mais tarde.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return 'O $productName detectou um possível raid nesta comunidade. Os convites estão pausados, então novos usuários não podem entrar agora.';
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
  String get invalidDeepLinkTitle => 'Não foi possível abrir o link';

  @override
  String get invalidDeepLinkDescription =>
      'Esse link pode estar quebrado, disponível apenas no navegador, ou você pode não ter acesso. Verifique o link e tente novamente.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Ir para o início';

  @override
  String get inviteAcceptJoinGroupButton => 'Entrar no grupo';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Você foi convidado para entrar em um chat em grupo por $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'alguém';

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
  String get embedThemeWebOnly =>
      'Só é possível importar temas na web ou no desktop.';

  @override
  String get embedThemeImport => 'Importar tema';

  @override
  String embedGiftVisionaryLifetime(String productName) {
    return 'Visionary ($productName vitalício)';
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
  String get embedGiftClaimHelp => 'Toque para resgatar seu presente!';

  @override
  String get embedGiftAlreadyRedeemed => 'Já resgatado';

  @override
  String get embedGiftClaimAccountHelp =>
      'Reivindique sua conta para resgatar este presente.';

  @override
  String get embedGiftClaim => 'Resgatar presente';

  @override
  String get embedGiftClaimed => 'Presente resgatado';

  @override
  String get embedGiftClaimAccount => 'Reivindique a conta para resgatar';

  @override
  String get embedGiftUnknownTitle => 'Presente desconhecido';

  @override
  String get embedGiftUnknownSubtitle =>
      'Este código de presente é inválido ou já foi resgatado.';

  @override
  String get embedGiftUnavailable => 'Presente indisponível';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Resgate seu presente para ativar sua assinatura $productName!';
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
  String get giftRedeemFailedTitle => 'Não foi possível resgatar o presente';

  @override
  String get giftRedeemFailedMessage =>
      'Não foi possível resgatar este presente. Tente novamente.';

  @override
  String get giftVisionaryCannotRedeemTitle =>
      'Não é possível resgatar este presente';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Contas Visionary não podem resgatar presentes Plutonium. Em vez disso, copie o link para compartilhá-lo com um amigo.';

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
      'Isso excluirá permanentemente todas as mensagens que você já enviou nesta conversa. Essa ação não pode ser desfeita.';

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
  String dmInviteSentFor(String communityName) {
    return 'Convite para $communityName enviado';
  }

  @override
  String get dmInviteSendFailed =>
      'Não foi possível enviar o convite. Tente novamente.';

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
      'Sua lista de amigos está cheia, ou a da outra pessoa está. Remova alguém e tente novamente.';

  @override
  String get addFriendSendFailedTitle =>
      'Não foi possível enviar o pedido de amizade';

  @override
  String get addFriendSendFailedMessage =>
      'Não foi possível enviar o pedido de amizade. Tente novamente.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Sistema';

  @override
  String get userTagOp => 'OP';

  @override
  String get emojiSearchPlaceholder => 'Encontre o emoji dos seus sonhos';

  @override
  String get emojiSearchEmpty => 'Nenhum emoji corresponde à sua pesquisa';

  @override
  String get emojiAutocompleteDefaultLabel => 'Emoji padrão';

  @override
  String emojiInfoDefaultDescription(String productName) {
    return 'Este é um emoji padrão do $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'Este emoji é desta comunidade. Você pode usá-lo em qualquer lugar.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'Este é um emoji personalizado de uma comunidade.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'Este é um emoji personalizado de uma comunidade. Peça um convite ao autor para usar este emoji.';

  @override
  String get emojiInfoFromHeader => 'Este emoji é de';

  @override
  String get emojiInfoDiscoverableCommunity => 'Listada no Explorar';

  @override
  String get emojiInfoPrivateCommunity => 'Comunidade privada';

  @override
  String get emojiInfoVerifiedCommunity => 'Comunidade verificada';

  @override
  String get emojiInfoAddToFavorites => 'Adicionar aos favoritos';

  @override
  String get emojiInfoRemoveFromFavorites => 'Remover dos favoritos';

  @override
  String get emojiFrequentlyUsed => 'Usados com frequência';

  @override
  String get emojiTabGifs => 'GIFs';

  @override
  String get emojiTabMedia => 'Mídia';

  @override
  String get emojiTabStickers => 'Figurinhas';

  @override
  String get emojiTabEmojis => 'Emojis';

  @override
  String get gifPickerSearch => 'Pesquisar GIFs';

  @override
  String get gifPickerSearchKlipy => 'Pesquisar Klipy';

  @override
  String get gifPickerSearchTenor => 'Pesquisar Tenor';

  @override
  String get gifPickerFavorites => 'Favoritos';

  @override
  String get gifPickerFavoritesEmptyTitle => 'Nenhum GIF favorito ainda';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Marque um GIF com estrela para vê-lo aqui.';

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
  String get cropTouchHint =>
      'Use dois dedos para ampliar e arraste para reposicionar';

  @override
  String get cropMouseHint =>
      'Arraste os cantos para redimensionar, arraste por dentro para mover';

  @override
  String get changeYourFluxerTag => 'Alterar sua Nome de usuário';

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
  String get applicationsTitle => 'Aplicativos';

  @override
  String get applicationsCreate => 'Criar aplicativo';

  @override
  String get applicationsCreateSubmit => 'Criar';

  @override
  String get applicationsCreateClaimTooltip =>
      'Reivindique sua conta para criar aplicativos.';

  @override
  String applicationsDocsLink(String domain) {
    return 'Leia a documentação ($domain)';
  }

  @override
  String get applicationsLoadError =>
      'Não foi possível carregar os aplicativos';

  @override
  String get applicationsLoadErrorDescription =>
      'Verifique sua conexão e tente novamente.';

  @override
  String get applicationsEmptyTitle => 'Nenhum aplicativo ainda';

  @override
  String applicationsEmptyDescription(String apiName) {
    return 'Crie seu primeiro aplicativo para começar a usar a $apiName.';
  }

  @override
  String applicationsCreated(String date) {
    return 'Criado em $date';
  }

  @override
  String get applicationsName => 'Nome do aplicativo';

  @override
  String get applicationsNameHint => 'Meu aplicativo';

  @override
  String get applicationsNameRequired => 'O nome do aplicativo é obrigatório';

  @override
  String get applicationsBackToList => 'Voltar para a lista';

  @override
  String get applicationsDetailLoadError =>
      'Não foi possível carregar este aplicativo';

  @override
  String get applicationsDetailLoadErrorDescription =>
      'Tente novamente ou volte para a lista de aplicativos.';

  @override
  String get applicationsId => 'ID do aplicativo';

  @override
  String get applicationsCopyId => 'Copiar ID';

  @override
  String get applicationsSecretsTitle => 'Segredos e tokens';

  @override
  String get applicationsSecretsDescription =>
      'Mantenha-os em segurança. Gerar novamente vai quebrar as integrações existentes.';

  @override
  String get applicationsClientSecret => 'Segredo do cliente';

  @override
  String get applicationsBotToken => 'Token do bot';

  @override
  String get applicationsRegenerate => 'Gerar novamente';

  @override
  String get applicationsRegenerateClientSecretTitle =>
      'Gerar novo segredo do cliente?';

  @override
  String get applicationsRegenerateBotTokenTitle => 'Gerar novo token do bot?';

  @override
  String get applicationsRegenerateClientSecretDescription =>
      'Gerar um novo segredo invalidará o atual. Atualize qualquer código que use o valor antigo.';

  @override
  String get applicationsRegenerateBotTokenDescription =>
      'Gerar um novo token invalidará o atual. Atualize qualquer código que use o valor antigo.';

  @override
  String get applicationsClientSecretRegenerated =>
      'Segredo do cliente gerado novamente. Atualize qualquer código que use o segredo antigo.';

  @override
  String get applicationsBotTokenRegenerated =>
      'Token do bot gerado novamente. Atualize qualquer código que use o token antigo.';

  @override
  String get applicationsRegenerateFailed =>
      'Não foi possível gerar o segredo novamente';

  @override
  String get applicationsInfoTitle => 'Informações do aplicativo';

  @override
  String get applicationsInfoDescription =>
      'Configurações básicas e URIs de redirecionamento permitidos.';

  @override
  String get applicationsPublicBot => 'Bot público';

  @override
  String get applicationsPublicBotDescription =>
      'Permitir que qualquer pessoa convide este bot para suas comunidades.';

  @override
  String get applicationsRequireCodeGrant =>
      'Exigir concessão de código OAuth2';

  @override
  String get applicationsRequireCodeGrantDescription =>
      'Exige um URI de redirecionamento e um código de autorização ao convidar este bot.';

  @override
  String get applicationsRedirectUris => 'URIs de redirecionamento';

  @override
  String get applicationsAddRedirect => 'Adicionar redirecionamento';

  @override
  String get applicationsDeleteRedirect => 'Excluir URI de redirecionamento';

  @override
  String get applicationsBotProfileTitle => 'Perfil do bot';

  @override
  String get applicationsBotProfileDescription =>
      'Avatar, tag e detalhes do perfil do seu bot.';

  @override
  String get applicationsBotAvatar => 'Avatar do bot';

  @override
  String get applicationsUsernameRequired => 'O nome de usuário é obrigatório';

  @override
  String get applicationsUsernameTooLong =>
      'O nome de usuário deve ter no máximo 32 caracteres';

  @override
  String get applicationsUsernameInvalid =>
      'O nome de usuário só pode conter letras, números e sublinhados';

  @override
  String get applicationsBotUsername => 'Nome de usuário do bot';

  @override
  String get applicationsDiscriminator => 'Discriminador';

  @override
  String get applicationsBotBio => 'Bio do bot';

  @override
  String get applicationsBotBioHint =>
      'Um bot prestativo que faz coisas incríveis!';

  @override
  String get applicationsNoBotBanner => 'Sem banner do bot';

  @override
  String get applicationsFriendlyBot => 'Bot amigável';

  @override
  String get applicationsFriendlyBotDescription =>
      'Permitir que usuários enviem pedidos de amizade a este bot para aprovação manual.';

  @override
  String get applicationsManualFriendApproval =>
      'Exigir aprovação manual de amizade';

  @override
  String get applicationsManualFriendApprovalDescription =>
      'Pedidos de amizade para este bot precisam de aprovação manual.';

  @override
  String get applicationsOauthBuilderTitle => 'Gerador de URL OAuth2';

  @override
  String get applicationsOauthBuilderDescription =>
      'Monte uma URL de autorização com escopos e permissões.';

  @override
  String get applicationsScopes => 'Escopos';

  @override
  String get applicationsRedirectUri => 'URI de redirecionamento';

  @override
  String get applicationsSelectRedirectUri =>
      'Selecione um URI de redirecionamento';

  @override
  String get applicationsRedirectRequiredCodeGrant =>
      'O URI de redirecionamento é obrigatório porque este bot exige concessão de código OAuth2.';

  @override
  String get applicationsRedirectRequiredScopes =>
      'O URI de redirecionamento é obrigatório quando não se usa apenas o escopo bot.';

  @override
  String get applicationsBotPermissions => 'Permissões do bot';

  @override
  String get applicationsAuthorizeUrl => 'URL de autorização';

  @override
  String get applicationsAuthorizeUrlPlaceholder =>
      'Selecione escopos (e o URI de redirecionamento, se necessário)';

  @override
  String get applicationsCopyAuthorizeUrl => 'Copiar URL de autorização';

  @override
  String get applicationsCopiedUrl =>
      'URL copiada para a área de transferência';

  @override
  String get applicationsDangerTitle => 'Zona de perigo';

  @override
  String get applicationsDangerSubtitle =>
      'Isso não pode ser desfeito. Remover o aplicativo também exclui o bot dele.';

  @override
  String get applicationsDangerHelper =>
      'Depois da exclusão, o aplicativo e suas credenciais são removidos permanentemente.';

  @override
  String get applicationsDelete => 'Excluir aplicativo';

  @override
  String applicationsDeleteConfirmDescription(String name) {
    return 'Tem certeza de que deseja excluir $name? Essa ação não pode ser desfeita. Todos os dados associados, incluindo o usuário do bot, serão excluídos permanentemente.';
  }

  @override
  String get applicationsDeleteFailed =>
      'Não foi possível excluir o aplicativo';

  @override
  String get applicationsUpdated => 'Aplicativo atualizado com sucesso';

  @override
  String get applicationsNoChanges => 'Nenhuma alteração para salvar';

  @override
  String get applicationsSearchBots => 'Aplicativos e bots';

  @override
  String get applicationsSearchBotsDescription =>
      'Crie e gerencie aplicativos e bots da sua conta';

  @override
  String get applicationsSearchInfoDescription =>
      'Edite as informações básicas do aplicativo e os URIs de redirecionamento';

  @override
  String get applicationsSearchBotProfileDescription =>
      'Edite o avatar, a tag, a bio, o banner e o comportamento de solicitações de amizade do bot';

  @override
  String get applicationsSearchOauthDescription =>
      'Monte uma URL de autorização com escopos, redirecionamentos e permissões do bot';

  @override
  String get applicationsSearchSecretsDescription =>
      'Veja e gere novamente segredos de cliente e tokens de bot';

  @override
  String get applicationsSearchBotsKeyword => 'Bots';

  @override
  String get applicationsSearchDocumentation => 'Documentação';

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
  String userProfilePremiumSubscriberSinceTooltip(
    String premiumProductFullName,
    String date,
  ) {
    return 'Assinante $premiumProductFullName desde $date';
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
  String get userProfileMemberSince => 'Membro desde';

  @override
  String get userProfileAboutMe => 'Sobre Mim';

  @override
  String get userProfileRoles => 'Cargos';

  @override
  String get memberRoleAdd => 'Adicionar cargo';

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
    return 'No momento não há cargos para atribuir nesta comunidade, mas você pode criar um novo cargo em $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Configurações da comunidade';

  @override
  String get guildSettingsRolesTab => 'Cargos';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Horário local';

  @override
  String get profileLocalTimeSettingsTitle => 'Hora local do perfil';

  @override
  String profileLocalTimeSettingsSummary(String productName) {
    return 'Defina seu fuso horário uma vez para que o $productName mantenha seu deslocamento UTC atualizado quando o horário de verão mudar. Outras pessoas só podem ver seu deslocamento UTC, não o identificador exato do seu fuso horário.';
  }

  @override
  String get profileLocalTimeEditButton => 'Editar hora local do perfil';

  @override
  String get profileLocalTimeTimezoneLabel => 'Fuso horário';

  @override
  String profileLocalTimeTimezoneHelp(String productName) {
    return 'Escolha o fuso horário que o $productName usa para calcular seu deslocamento UTC na hora local do perfil.';
  }

  @override
  String get profileLocalTimeSearchTimezones => 'Pesquisar fusos horários';

  @override
  String get profileLocalTimeNotSet => 'Não definido';

  @override
  String profileLocalTimePrivacyNote(
    String timezoneIdentifierExample,
    String productName,
  ) {
    return 'Outras pessoas só podem ver seu deslocamento UTC atual quando você escolhe compartilhar a hora local do perfil. Elas não veem o identificador exato do seu fuso horário, como $timezoneIdentifierExample. O $productName armazena esse identificador apenas para que o deslocamento seja atualizado automaticamente quando o horário de verão mudar.';
  }

  @override
  String get profileLocalTimePrivacyEveryone => 'Todos';

  @override
  String get profileLocalTimePrivacyEveryoneDesc =>
      'Permitir que qualquer pessoa que possa ver seu perfil completo veja sua hora local';

  @override
  String get profileLocalTimePrivacyFriends => 'Amigos';

  @override
  String get profileLocalTimePrivacyFriendsDesc =>
      'Permitir que seus amigos vejam sua hora local';

  @override
  String get profileLocalTimePrivacyCommunityMembers => 'Membros da comunidade';

  @override
  String get profileLocalTimePrivacyCommunityMembersDesc =>
      'Permitir que membros das comunidades em que você está vejam sua hora local';

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
  String get userProfileFailedSaveNote => 'Falha ao salvar nota';

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
  String get userProfileReportMessage => 'Denunciar mensagem';

  @override
  String get userProfileReportUserProfile => 'Denunciar perfil';

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
      other: '${count}min',
      one: '1min',
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
  String get linkedDevicesViewDetails => 'Ver detalhes';

  @override
  String get linkedDevicesDetailsTitle => 'Detalhes do dispositivo';

  @override
  String get linkedDevicesDetailsDevice => 'Dispositivo';

  @override
  String get linkedDevicesDetailsClient => 'Cliente';

  @override
  String get linkedDevicesDetailsLocation => 'Localização';

  @override
  String get linkedDevicesDetailsIp => 'Endereço IP';

  @override
  String get linkedDevicesDetailsLastUsed => 'Último uso';

  @override
  String get linkedDevicesCurrentSession => 'Sessão atual';

  @override
  String get linkedDevicesUnknown => 'Desconhecido';

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
  String get slowmodeStatusEnabled => 'O modo lento está ativado';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Modo lento em andamento ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'O modo lento está definido para $durationLabel, mas você é imune.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'O modo lento está definido para $durationLabel. Espere antes de enviar outra mensagem.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'O modo lento está definido para $durationLabel neste canal.';
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
  String get channelComposerBarrierVerifyEmail => 'Verificar e-mail';

  @override
  String get accountLimitedNotice =>
      'O envio de mensagens está pausado na sua conta. Confira seu e-mail para concluir uma etapa rápida e continuar.';

  @override
  String get messagingPausedTextDidNotGoThrough => 'O meu SMS não chegou';

  @override
  String messagingPausedHelpBody(String supportEmail) {
    return 'Envie um e-mail para $supportEmail e uma pessoa vai verificar sua conta. Você também pode responder ao e-mail que enviamos para você.';
  }

  @override
  String get messagingPausedHelpCountryLabel => 'País onde você está';

  @override
  String get messagingPausedHelpCopyDetails => 'Copiar detalhes';

  @override
  String get messagingPausedHelpEmailSupport => 'Enviar e-mail ao suporte';

  @override
  String messagingPausedHelpAccountIdLine(String accountId) {
    return 'ID da conta: $accountId';
  }

  @override
  String messagingPausedHelpUsernameLine(String username) {
    return 'Nome de usuário: $username';
  }

  @override
  String messagingPausedHelpAccountCreatedLine(String createdAt) {
    return 'Conta criada em: $createdAt';
  }

  @override
  String messagingPausedHelpCountryLine(String country) {
    return 'País: $country';
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
  String get voiceMessageMicInUse =>
      'Saia da chamada de voz para gravar uma mensagem de voz.';

  @override
  String get voiceMessageRecordingFailed =>
      'Falha na gravação. Tente novamente.';

  @override
  String get voiceMessageSendFailed =>
      'Não foi possível enviar a mensagem de voz. Tente novamente.';

  @override
  String get voiceMessagePlay => 'Reproduzir';

  @override
  String get voiceMessagePause => 'Pausar';

  @override
  String get voiceMessageSeekForward => 'Avançar';

  @override
  String get voiceMessageSeekBackward => 'Retroceder';

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
  String get chatAttachmentDownloadedToast => 'Salvo nas fotos';

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
      other: '... (restam $count linhas)',
      one: '... (resta $count linha)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... (restam $count linhas)',
      one: '... (resta $count linha)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'Ver arquivo completo';

  @override
  String get chatTextualPreviewChangeLanguage => 'Alterar linguagem';

  @override
  String get chatTextualPreviewSearchLanguage => 'Pesquisar linguagem…';

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
    return 'O arquivo é grande demais para a prévia (limite de $previewLimitKb KB).';
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
  String get lookAndFeelHdrFullName => 'Alcance dinâmico completo';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Exibir imagens HDR com brilho e faixa de cores completos.';

  @override
  String get lookAndFeelHdrStandardName => 'Alcance padrão';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Converter imagens HDR para o alcance padrão, reduzindo o brilho máximo.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'Modo de exibição de alto alcance dinâmico';

  @override
  String get lookAndFeelThemeDark => 'Tema Escuro';

  @override
  String get lookAndFeelThemeDarkLegacy => 'Tema escuro (legado)';

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
  String get lookAndFeelThemeColorsTitle => 'Cores do tema';

  @override
  String get lookAndFeelThemeColorsConfigureDescription =>
      'Personalize cores individuais do tema neste dispositivo.';

  @override
  String lookAndFeelThemeColorsEditingMode(String mode) {
    return 'Editando $mode';
  }

  @override
  String get lookAndFeelThemeColorsSyncSectionTitle =>
      'Sincronização com o Theme Studio';

  @override
  String get lookAndFeelThemeColorsSyncFromStudioLabel =>
      'Usar cores do Theme Studio';

  @override
  String get lookAndFeelThemeColorsSyncFromStudioDescription =>
      'Quando ativado, as alterações de cor feitas no Theme Studio no desktop são aplicadas neste dispositivo. Quando desativado, este dispositivo mantém suas próprias cores.';

  @override
  String get lookAndFeelThemeColorsSyncToStudioLabel =>
      'Enviar alterações de cor para o Theme Studio';

  @override
  String get lookAndFeelThemeColorsSyncToStudioDescription =>
      'Quando ativado, as cores que você alterar aqui são sincronizadas com o Theme Studio nos seus outros dispositivos. Quando desativado, o Theme Studio no desktop mantém suas próprias cores.';

  @override
  String get lookAndFeelThemeColorsSyncFromStudioOffBanner =>
      'As alterações de cor do Theme Studio no desktop não serão aplicadas neste dispositivo.';

  @override
  String get lookAndFeelThemeColorsEssentialSectionTitle => 'Cores essenciais';

  @override
  String get lookAndFeelThemeColorsChatBackgroundWallpaperNote =>
      'Se você tiver um papel de parede de chat definido, não verá esta cor.';

  @override
  String lookAndFeelThemeColorsResetForMode(String mode) {
    return 'Redefinir todas as cores de $mode';
  }

  @override
  String get lookAndFeelThemeColorsResetConfirmTitle =>
      'Redefinir cores do tema?';

  @override
  String lookAndFeelThemeColorsResetConfirmBody(String mode) {
    return 'Isso remove suas cores personalizadas de $mode neste dispositivo.';
  }

  @override
  String get lookAndFeelThemeColorsGroupBrandButtons => 'Marca e botões';

  @override
  String get lookAndFeelThemeColorsGroupChatSurfaces => 'Chat e mensagens';

  @override
  String get lookAndFeelThemeColorsGroupSidebars =>
      'Barras laterais e navegação';

  @override
  String get lookAndFeelThemeColorsGroupText => 'Texto';

  @override
  String get lookAndFeelThemeColorsGroupHeaders => 'Cabeçalhos';

  @override
  String get lookAndFeelThemeColorsGroupStatus => 'Status';

  @override
  String get lookAndFeelThemeColorsGroupEmbedsMarkup =>
      'Incorporações e menções';

  @override
  String get lookAndFeelThemeColorsGroupAccentsAlerts => 'Destaques e alertas';

  @override
  String get lookAndFeelThemeColorsGroupControls => 'Superfícies e controles';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Escala da fonte do chat';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Ajuste o tamanho da fonte na área do chat.';

  @override
  String get lookAndFeelChatFontSizeLabel => 'Tamanho da fonte do chat';

  @override
  String get lookAndFeelAppZoomTitle => 'Nível de zoom do aplicativo';

  @override
  String get lookAndFeelAppZoomDescription =>
      'Ajuste o nível de zoom do aplicativo.';

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
  String get lookAndFeelChatWallpaperStarfieldLabel => 'Campo estelar';

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
      'Espaço entre grupos de mensagens';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '$spacing px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel =>
      'Modo de exibição de mensagens';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Confortável';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Layout espaçoso com separação visual clara entre as mensagens.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Denso';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Mostra o máximo de mensagens com espaçamento mínimo.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'Ocultar avatares de usuários';

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
      'Algo deu errado. Estamos trabalhando nisso.';

  @override
  String get guildNotFoundTitle =>
      'Esta não é a comunidade que você está procurando.';

  @override
  String get guildNotFoundDescription =>
      'A comunidade que você está procurando pode ter sido excluída ou você pode não ter acesso a ela.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return '$communityName está acessível no momento apenas para membros da equipe do $productName';
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
  String get lookAndFeelOpenCommunitiesToLastChannelLabel =>
      'Abrir comunidades no último canal';

  @override
  String get lookAndFeelOpenCommunitiesToLastChannelDescription =>
      'Tocar em uma comunidade leva você diretamente ao último canal que você viu nela. Deslize para a direita para ver a lista de canais.';

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
  String get favoritesAddToSavedMedia => 'Adicionar à mídia salva';

  @override
  String get favoritesRemoveFromSavedMedia => 'Remover da mídia salva';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Adicionar aos GIFs favoritos só por URL';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Remover dos GIFs favoritos só por URL';

  @override
  String get savedMediaAddTitle => 'Adicionar à mídia salva';

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
      'Você pode guardar os GIFs marcados com estrela como favoritos só por URL ou enviá-los para sua mídia salva. Escolha a opção que combina com seu uso. Você pode mudar isso a qualquer momento em Configurações > Avançado > Mídia.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'Favoritos só por URL (padrão): sincronizados entre seus dispositivos, sem upload e sem contar para a mídia salva. A mídia original pode desaparecer se o site que a hospeda removê-la.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Mídia salva: enviada, com tags, pesquisável e permanente, mas conta para o seu limite de mídia salva.';

  @override
  String get gifFavoriteFirstTimeHint => 'Só perguntaremos uma vez.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly => 'Usar só URL (recomendado)';

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
  String get messagesMediaCameraUploadsSectionTitle => 'Envios da câmera';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Escolha se as fotos e vídeos feitos com a câmera do aplicativo ficam salvos no seu dispositivo';

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
  String get accessibilitySaturationTitle => 'Saturação';

  @override
  String get accessibilityVisualGroupTitle => 'Visual';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel => 'Sempre sublinhar links';

  @override
  String get accessibilityShowAltTextOnImagesLabel =>
      'Mostrar texto alternativo nas imagens';

  @override
  String get accessibilityShowAltTextOnImagesDescription =>
      'Exibir o texto alternativo abaixo das imagens quando houver.';

  @override
  String get accessibilityDimStrikethroughTextLabel => 'Esmaecer texto tachado';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'Pré-visualizações de mensagens diretas';

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
      'Permite que os leitores de tela anunciem novas mensagens assim que chegarem no canal aberto. Os sons de notificação não são afetados.';

  @override
  String get accessibilityTtsGroupTitle => 'Texto para fala';

  @override
  String get accessibilityTtsGroupDescription =>
      'Escolha a velocidade do texto falado.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel => 'Velocidade da fala';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Tocar exemplo';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Silenciar exemplo';

  @override
  String get accessibilityPreviewButtonLabel => 'Botão de prévia';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'Assim é a aparência dos links: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Usuário de prévia';

  @override
  String get accessibilityKeyboardGroupTitle => 'Teclado';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Mostrar anel de foco na caixa de texto do chat';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'A tecla Esc sai do modo teclado';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Mostrar atalhos nos menus de contexto';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Confirmar antes de iniciar chamadas';

  @override
  String get accessibilityAnimationGroupTitle => 'Animação';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'O movimento reduzido está ativado, então as animações de conteúdo ficam pausadas por padrão. Você ainda pode ativar qualquer uma delas para mantê-la em reprodução.';

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
      'Reproduzindo apesar do movimento reduzido.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Pausado pelo movimento reduzido. Ative para manter os emojis animados em reprodução.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Pausado pelo movimento reduzido. Ative para manter os GIFs em reprodução.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Animações de stickers';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Preferência de animação de stickers';

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
      'Os stickers serão animados quando você passar o cursor ou interagir com eles';

  @override
  String get accessibilityStickerNeverAnimateName => 'Nunca animar';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Os stickers nunca serão animados';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Sempre animando apesar do movimento reduzido.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'O movimento reduzido limita os stickers a animar ao interagir. Escolha sempre animar para substituir.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'No celular, o padrão é animar ao interagir para economizar bateria.';

  @override
  String get accessibilityMotionGroupTitle => 'Movimento';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Sincronizar a redução de movimento com o sistema';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Use a preferência de redução de movimento do sistema deste dispositivo ou personalize abaixo.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Reduzir movimento';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Desativa animações e transições. No momento, controlado pela configuração do sistema.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Desativa animações e transições em todo o aplicativo.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Emojis animados, GIFs e stickers continuam sob seu controle na aba Animação.';

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
      'Doutor, eu vim do futuro. Cheguei aqui numa máquina do tempo que você inventou. Agora preciso da sua ajuda para voltar para o ano de 1985.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'A síntese de voz não está disponível neste dispositivo.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Falha na reprodução da fala. Tente novamente ou verifique se a saída de áudio está funcionando.';

  @override
  String get ttsSubstitutionUnknownUser => 'usuário desconhecido';

  @override
  String get ttsSubstitutionUnknownRole => 'cargo desconhecido';

  @override
  String get ttsSubstitutionUnknownChannel => 'canal desconhecido';

  @override
  String get ttsSubstitutionCodeBlock => 'bloco de código';

  @override
  String get ttsSubstitutionSpoiler => 'spoiler';

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
  String get ttsSentSticker => 'enviou um sticker';

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
  String get systemCallDurationFewSeconds => 'alguns segundos';

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
  String get voiceJoinFailedTitle => 'Não foi possível entrar na voz';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Não foi possível desconectar seus outros dispositivos. Tente novamente em um momento.';

  @override
  String get voiceChannelJoin => 'Entrar no Canal de Voz';

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
  String get voiceControlDisconnect => 'Desconectar';

  @override
  String get voiceInChat => 'No chat de voz';

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
    return 'Ping: $currentLatency ms';
  }

  @override
  String get voiceMeasuringLatency => 'Medindo a latência...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Ir para $channelSourceLabel';
  }

  @override
  String get shellResizeSidebar => 'Redimensionar barra lateral';

  @override
  String get voiceConnectionTitle => 'Conexão de voz';

  @override
  String get voiceConnectionAdvancedStats => 'Avançado';

  @override
  String get voiceShowCallAvatars => 'Mostrar avatares da chamada';

  @override
  String get voiceShowConnectionId => 'Mostrar ID da conexão';

  @override
  String get voiceAudioProcessing => 'Processamento de áudio';

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
  String get voiceConnectionJitterLabel => 'Jitter';

  @override
  String get voiceConnectionSendLabel => 'Envio';

  @override
  String get voiceConnectionReceiveLabel => 'Recebimento';

  @override
  String get voiceConnectionUnavailable => '—';

  @override
  String voiceConnectionDuration(int minutes, int seconds) {
    return '$minutes min $seconds s';
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
  String get userAreaUserSettings => 'Configurações do usuário';

  @override
  String get voiceParticipantMenuViewProfile => 'Ver perfil';

  @override
  String get voiceParticipantMenuFocus => 'Focar nesta pessoa';

  @override
  String get voiceParticipantMenuUnfocus => 'Remover foco';

  @override
  String get voiceParticipantMenuCommunityMute => 'Silenciar na comunidade';

  @override
  String get voiceParticipantMenuCommunityDeafen =>
      'Deixar surdo na comunidade';

  @override
  String get voiceParticipantMenuUserVolume => 'Volume do usuário';

  @override
  String get voiceParticipantMenuStreamVolume => 'Volume da transmissão';

  @override
  String get voiceParticipantMenuStopStreaming => 'Parar transmissão';

  @override
  String get voiceControlChat => 'Chat';

  @override
  String get voiceCallViewModeLabel => 'Visualização';

  @override
  String get voiceCallViewModeGrid => 'Grade';

  @override
  String get voiceCallViewModeFocus => 'Foco';

  @override
  String get voicePanelSettingsSectionTitle => 'Configurações de voz';

  @override
  String get voicePanelUseEarpieceLabel => 'Usar fone do telefone';

  @override
  String get voiceOutputRouteSpeaker => 'Alto-falante';

  @override
  String get voiceOutputRouteEarpiece => 'Fone do telefone';

  @override
  String get voiceOutputRouteHeadset => 'Fones de ouvido';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Mostrar apenas vídeos';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Mostrar apenas participantes com a câmera ligada.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Mostrar minha própria câmera';

  @override
  String get voicePrioritizeSpeakersLabel => 'Priorizar quem está falando';

  @override
  String get voiceTextChatShow => 'Mostrar chat';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mensagens não lidas',
      one: '$count mensagem não lida',
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
  String get voiceScreenShareEnterFullscreenTooltip => 'Tela cheia';

  @override
  String get voiceScreenShareExitFullscreenTooltip => 'Sair da tela cheia';

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
  String notificationsMentionedYouIn(String author, String place) {
    return '$author mencionou você em $place:';
  }

  @override
  String notificationsRepliedToYouIn(String author, String place) {
    return '$author respondeu a você em $place:';
  }

  @override
  String notificationsMentionedYou(String author) {
    return '$author mencionou você:';
  }

  @override
  String notificationsRepliedToYou(String author) {
    return '$author respondeu a você:';
  }

  @override
  String notificationsMentionPlace(String server, String channel) {
    return '$server – $channel';
  }

  @override
  String get notificationsSendReply => 'Enviar uma resposta';

  @override
  String get notificationsRecentActivity => 'Atividade recente';

  @override
  String get notificationsRemoveNotification => 'Remover notificação';

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
  String get chatMessageFailedToSendTapForOptions =>
      'Falha ao enviar mensagem. Toque para ver as opções.';

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
  String get chatSendFailureContentBlockedSelfHosted =>
      'Sua mensagem não pôde ser entregue porque foi sinalizada por nossos sistemas de segurança. Se você acredita que isso é um erro, entre em contato com os administradores desta instância.';

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
  String get privacyDashboardDataExportSection => 'Exportação de dados';

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
      'Seu perfil completo fica visível para amigos e para qualquer pessoa nas suas comunidades';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Apenas amigos e comunidades pequenas';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Seu perfil completo fica visível para amigos e para membros das suas comunidades com 200 membros ou menos';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Apenas amigos';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Seu perfil completo fica visível apenas para seus amigos';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Pedidos de amizade';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Todos';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Amigos de amigos';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Membros da comunidade';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Mensagens diretas';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Permitir mensagens diretas de membros da comunidade';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Permitir mensagens diretas de bots da comunidade';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Chamadas recebidas';

  @override
  String get privacyDashboardAllowedCallers => 'Quem pode ligar';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Bloquear todas as chamadas recebidas';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Permitir que apenas amigos liguem para você (recomendado)';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Permitir amigos e outros grupos que você escolher';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Permitir que qualquer pessoa ligue para você, até desconhecidos';

  @override
  String get privacyDashboardAdditionalGroups => 'Grupos adicionais';

  @override
  String get privacyDashboardRingBehavior => 'Comportamento do toque';

  @override
  String get privacyDashboardSilentCalls => 'Chamadas silenciosas de todos';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Quem pode adicionar você a conversas em grupo';

  @override
  String get privacyDashboardAllowedInvites => 'Convites permitidos';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Não deixar ninguém adicionar você a conversas em grupo sem perguntar';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Permitir que apenas amigos adicionem você sem perguntar (recomendado)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Permitir que amigos e outros grupos adicionem você';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Permitir que qualquer pessoa adicione você a conversas em grupo sem perguntar';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Atividade de voz em Ativos Agora';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Compartilhar sua atividade de voz com amigos';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Compartilhar a atividade de voz com todos os amigos?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Parar de compartilhar a atividade de voz com todos os amigos?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Você vai começar a compartilhar sua atividade de voz com todos os seus amigos, incluindo os futuros. Isso envia uma atualização para todos eles e só poderá ser alterado novamente em 24 horas.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Você vai parar de compartilhar sua atividade de voz com todos os seus amigos, incluindo os futuros. Isso envia uma atualização para todos eles e só poderá ser alterado novamente em 24 horas.';

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
      'Gere um arquivo para download com os dados da sua conta, incluindo mensagens e URLs de anexos. A maioria das pessoas quer tudo, mas você pode limitar o escopo abaixo.';

  @override
  String get privacyDashboardExportMyData => 'Exportar meus dados';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Remova permanentemente as mensagens que você enviou em DMs, DMs de grupo e comunidades. O processo é feito em segundo plano, e você receberá uma DM quando terminar.';

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
      'Impedir que bots enviem mensagens diretas para você?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Você também quer permitir mensagens diretas de membros das comunidades em que já está?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Você também quer bloquear mensagens diretas de membros das comunidades em que já está?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Você também quer permitir que bots das comunidades em que já está enviem mensagens diretas para você?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Você também quer bloquear bots das comunidades em que já está?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'Você também pode alterar essa configuração por comunidade pressionando e segurando o nome da comunidade e selecionando as configurações de privacidade.';

  @override
  String get privacyDashboardDmConfirmAllowAll =>
      'Permitir em todas as comunidades';

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
      'Vamos processar isso o mais rápido possível. Você receberá um e-mail quando seu arquivo estiver pronto.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'Vamos processar isso o mais rápido possível. Você receberá uma DM nossa quando terminar.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'O que incluir';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Tudo';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Exporte todas as mensagens que você já enviou, além de todas as configurações da conta, participações e metadados.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'Seleção personalizada';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Escolha quais tipos de conversa, comunidades e período incluir no arquivo.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Escolher o que incluir';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Escolha quais tipos de conversa limpar.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Apenas lugares que não acesso mais';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Exclua apenas mensagens de comunidades e DMs de grupo das quais você saiu ou foi removido.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Quais conversas';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Ative os tipos de conversa que você quer incluir.';

  @override
  String get privacyDashboardDataRequestKindDms => 'DMs abertas';

  @override
  String get privacyDashboardDataRequestKindDmsClosed => 'DMs fechadas';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'DMs de grupo';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Comunidades';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Quais comunidades';

  @override
  String get privacyDashboardDataRequestGuildFilterMode =>
      'Filtro de comunidades';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Incluir todas, exceto as selecionadas';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude =>
      'Apenas as selecionadas';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'Você não está em nenhuma comunidade no momento.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Período';

  @override
  String get privacyDashboardDataRequestDateMode => 'Período';

  @override
  String get privacyDashboardDataRequestAllTime => 'Todo o período';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Período personalizado';

  @override
  String get privacyDashboardDataRequestStartDate => 'Data de início';

  @override
  String get privacyDashboardDataRequestEndDate => 'Data de término';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Deixe um dos campos em branco para não limitar aquele lado do período.';

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
      'Vamos criar um arquivo para download com todas as mensagens que você já enviou e avisaremos você por e-mail quando estiver pronto. O link de download nesse e-mail expira após 7 dias.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'Vamos criar um arquivo para download que corresponda aos filtros abaixo e avisaremos você por e-mail quando estiver pronto. O link de download nesse e-mail expira após 7 dias.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Excluir permanentemente as mensagens que correspondem aos filtros abaixo. Isso não pode ser desfeito.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'Não há como recuperar depois que isso começar. Enviaremos uma DM para você quando terminar.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'Solicitar exportação';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Excluir mensagens';

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
      other: '$count comunidades',
      one: '$count comunidade',
    );
    return 'Todas, exceto $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count comunidades',
      one: '$count comunidade',
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
      other: '$hours horas',
      one: '$hours hora',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minutos',
      one: '$minutes minuto',
    );
    return '$_temp0 e $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours horas',
      one: '$hours hora',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minutos',
      one: '$minutes minuto',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds segundos',
      one: '$seconds segundo',
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
  String get doubleTapReactionHint => 'Toque duas vezes em uma mensagem para';

  @override
  String get doubleTapEditHint =>
      'Toque duas vezes na sua própria mensagem para editá-la';

  @override
  String get doubleTapReactionEdit => 'Editar';

  @override
  String get doubleTapReactionEditTitle => 'Editar padrão';

  @override
  String get doubleTapReactionEditSubtitle => 'Escolha o emoji do toque duplo';

  @override
  String get messagesMediaGesturesSectionTitle => 'Gestos';

  @override
  String get messagesMediaGesturesSectionDescription =>
      'Configure o toque duplo e o deslizar nas mensagens.';

  @override
  String get messagesMediaGesturesReactionLabel => 'Emoji de reação';

  @override
  String get messagesMediaGesturesReactionDescription =>
      'Usado quando o toque duplo está definido para adicionar uma reação.';

  @override
  String get messagesMediaGesturesDoubleTapActionLabel => 'Ação do toque duplo';

  @override
  String get messagesMediaGesturesDoubleTapActionReactName =>
      'Adicionar reação';

  @override
  String get messagesMediaGesturesDoubleTapActionReactDescription =>
      'Adiciona seu emoji padrão de toque duplo como reação.';

  @override
  String get messagesMediaGesturesDoubleTapActionEditName => 'Editar mensagem';

  @override
  String get messagesMediaGesturesDoubleTapActionEditDescription =>
      'Abre o editor nas mensagens que você enviou. As outras mensagens não são afetadas.';

  @override
  String get messagesMediaGesturesDoubleTapActionNoneName => 'Nada';

  @override
  String get messagesMediaGesturesDoubleTapActionNoneDescription =>
      'O toque duplo está desativado.';

  @override
  String get messagesMediaGesturesSwipeRightToLeftLabel =>
      'Deslizar da direita para a esquerda';

  @override
  String get messagesMediaGesturesSwipeRightToLeftReplyName =>
      'Deslizar para responder';

  @override
  String get messagesMediaGesturesSwipeRightToLeftReplyDescription =>
      'Deslize uma mensagem para responder e mantenha pressionado para editar suas próprias mensagens.';

  @override
  String get messagesMediaGesturesSwipeRightToLeftChannelDetailsName =>
      'Mostrar detalhes do canal';

  @override
  String get messagesMediaGesturesSwipeRightToLeftChannelDetailsDescription =>
      'Deslize uma mensagem ou toque no cabeçalho do canal para abrir os detalhes do canal em um painel lateral.';

  @override
  String get chatMessageEdit => 'Editar mensagem';

  @override
  String get chatMessageReply => 'Responder';

  @override
  String get notificationReplyPlaceholder => 'Mensagem';

  @override
  String get notificationReplyFailed => 'Não foi possível enviar a resposta';

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
  String get forwardCommentSlowmodeDisabled =>
      'Comentários indisponíveis porque um canal selecionado tem o modo lento ativado.';

  @override
  String get forwardSendSlowmodeBlocked =>
      'Aguardando o fim do modo lento em um ou mais canais selecionados.';

  @override
  String get slowmodeRateLimitedTitle => 'Modo lento ativo';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'O modo lento está ativado. Aguarde $duration antes de enviar outra mensagem.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'O envio direto fica desativado durante o modo lento.';

  @override
  String get shareMediaTitle => 'Compartilhar com';

  @override
  String get shareMediaMessageHint => 'Adicione uma mensagem opcional…';

  @override
  String get shareMediaSendButton => 'Enviar';

  @override
  String get shareMediaSuccessToast => 'Mídia compartilhada';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'Compartilhado com $count destinos';
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
  String get chatMessageCopyEmbedText => 'Copiar texto do embed';

  @override
  String get chatMessageTranslate => 'Traduzir';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Traduzido do $language';
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
  String get chatMessageSpeak => 'Ler mensagem em voz alta';

  @override
  String get chatMessageStopSpeaking => 'Parar leitura';

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
  String get chatReactionRemoveFailed => 'Falha ao remover reação';

  @override
  String get chatMessageReport => 'Denunciar mensagem';

  @override
  String get reportFlowTitleMessage => 'Denunciar mensagem';

  @override
  String get reportFlowTitleUserProfile => 'Denunciar perfil';

  @override
  String get reportFlowSummaryTitle => 'Confira sua denúncia';

  @override
  String get reportFlowSummarySubtitle =>
      'Confira se está tudo certo antes de enviar.';

  @override
  String reportFlowDisclaimer(String guidelines) {
    return 'Denuncie apenas o que você acredita honestamente que viola as regras. O uso indevido de denúncias vai contra as nossas $guidelines.';
  }

  @override
  String get reportFlowCommunityGuidelinesLink => 'diretrizes da comunidade';

  @override
  String get reportFlowDisclaimerNoLink =>
      'Denuncie apenas o que você acredita honestamente que viola as regras e não envie a mesma denúncia duas vezes.';

  @override
  String get reportFlowSelectedMessage => 'Mensagem que você está denunciando';

  @override
  String get reportFlowSelectedUser => 'Perfil que você está denunciando';

  @override
  String get reportFlowReportCategory => 'Suas respostas';

  @override
  String get reportFlowSubmit => 'Enviar denúncia';

  @override
  String get reportFlowBack => 'Voltar';

  @override
  String get reportFlowNext => 'Próximo';

  @override
  String get reportFlowDone => 'Concluído';

  @override
  String get reportFlowThankYouTitle => 'Denúncia enviada';

  @override
  String get reportFlowThankYouNoReportTitle => 'Obrigado por sinalizar isso';

  @override
  String reportFlowThankYouBody(String productName) {
    return 'A equipe de segurança do $productName vai analisar sua denúncia. Não revelaremos que ela veio de você.';
  }

  @override
  String get reportFlowThankYouNoReportBody =>
      'Obrigado por nos informar. Isso não viola nossas regras por si só, então não enviamos uma denúncia. Se for direcionado a alguém ou usar termos pejorativos, denuncie novamente e escolha “Conteúdo abusivo ou prejudicial”.';

  @override
  String get reportFlowThankYouNoReportBodyShort =>
      'Obrigado por nos informar. Isso não viola nossas regras por si só, então não enviamos uma denúncia.';

  @override
  String get reportFlowMoreYouCanDo => 'Suas opções';

  @override
  String reportFlowBlockName(String name) {
    return 'Bloquear $name';
  }

  @override
  String get reportFlowBlockDescription =>
      'Oculta as mensagens dessa pessoa e impede que ela envie mensagens para você';

  @override
  String get reportFlowBlockButton => 'Bloquear';

  @override
  String get reportFlowBlockedButton => 'Bloqueado';

  @override
  String get reportFlowUrgentBanner =>
      'Se alguém estiver em perigo imediato, entre em contato com os serviços de emergência locais primeiro.';

  @override
  String get reportFlowLoadFailed =>
      'Não foi possível carregar o formulário de denúncia.';

  @override
  String get reportFlowTryAgain => 'Tentar novamente';

  @override
  String get reportFlowOutdated =>
      'O formulário de denúncia mudou. Comece de novo.';

  @override
  String get reportFlowAlreadyReported => 'Você já denunciou esta mensagem.';

  @override
  String get reportFlowAlreadyReportedProfile =>
      'Você já denunciou este perfil hoje.';

  @override
  String get reportFlowRateLimited =>
      'Você está enviando denúncias rápido demais. Tente novamente mais tarde.';

  @override
  String get reportFlowSubmitFailed =>
      'Sua denúncia não foi enviada. Tente novamente.';

  @override
  String get reportFlowAccountSetupRequired =>
      'Reivindique sua conta e verifique seu e-mail para enviar denúncias.';

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
  String get chatMessageDeleteAttachmentConfirmDescription =>
      'Tem certeza de que deseja excluir este anexo?';

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
      other: '$count mensagens de possível spammer',
      one: '1 mensagem de possível spammer',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Resposta oculta porque o autor original está bloqueado.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Resposta oculta porque o autor original está marcado como spammer.';

  @override
  String get devMarkAsSpamLocally => 'Marcar como spam localmente';

  @override
  String get devIgnoreSpamFlag => 'Ignorar marcação de spam';

  @override
  String get chatMessagesLoadError => 'Não foi possível carregar mensagens.';

  @override
  String get chatMessagesFailedToLoad => 'Falha ao carregar as mensagens';

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
  String get chatEditFailed => 'Sua mensagem não foi atualizada';

  @override
  String get chatEditFailedEditAgain => 'Editar novamente';

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
  String get mediaViewerDismissBackdrop => 'Fechar';

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
  String get chatImageCouldNotLoad => 'Não foi possível carregar esta imagem.';

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
  String get composerAutocompleteMediaHeading => 'Mídia';

  @override
  String get composerAutocompleteStickersHeading => 'Figurinhas';

  @override
  String get composerAutocompleteEmojisHeading => 'Emojis';

  @override
  String get composerAutocompleteGifsHeading => 'GIFs';

  @override
  String get composerAutocompleteNoGifs => 'Nenhum GIF encontrado';

  @override
  String get composerCommandShrugDescription =>
      'Adiciona ¯\\_(ツ)_/¯ à sua mensagem.';

  @override
  String get composerCommandTableflipDescription =>
      'Adiciona (╯°□°)╯︵ ┻━┻ à sua mensagem.';

  @override
  String get composerCommandUnflipDescription =>
      'Adiciona ┬─┬ ノ( ゜-゜ノ) à sua mensagem.';

  @override
  String get composerCommandMeDescription =>
      'Envia uma mensagem de ação (em itálico).';

  @override
  String get composerCommandSpoilerDescription =>
      'Envia uma mensagem com spoiler (entre marcações de spoiler).';

  @override
  String get composerCommandTtsDescription =>
      'Envia uma mensagem de texto para fala.';

  @override
  String get composerCommandNickDescription =>
      'Altera seu apelido nesta comunidade.';

  @override
  String get composerCommandKickDescription =>
      'Expulsa um membro desta comunidade.';

  @override
  String get composerCommandBanDescription =>
      'Bane um membro desta comunidade.';

  @override
  String get composerCommandMsgDescription =>
      'Envia uma mensagem direta para um usuário.';

  @override
  String get composerCommandSavedDescription => 'Envia uma mídia salva.';

  @override
  String get composerCommandStickerDescription => 'Envia um sticker.';

  @override
  String get composerCommandGifDescription => 'Pesquisa e envia um GIF.';

  @override
  String get composerCommandMemberOption => 'O membro alvo.';

  @override
  String get composerCommandReasonOption => 'Motivo (opcional).';

  @override
  String get composerCommandMessageOption => 'A mensagem a enviar.';

  @override
  String get composerCommandQueryOption => 'O que pesquisar.';

  @override
  String get composerCommandNicknameOption =>
      'Seu novo apelido, ou deixe em branco para redefini-lo.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'Quanto do histórico recente de mensagens do membro excluir.';

  @override
  String get composerCommandDeleteMessagesNone => 'Não excluir nenhuma';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Últimos $count dias';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'Últimas 24 horas';

  @override
  String get composerCommandOptionRequired =>
      'Esta opção é obrigatória. Informe um valor.';

  @override
  String get composerCommandClear => 'Limpar comando';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'Você alterou seu apelido nesta comunidade de **$previousNickname** para **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'Usuário desconhecido';

  @override
  String composerCommandMsgFailed(String username) {
    return 'Falha ao enviar uma mensagem para **$username**. Essa pessoa pode ter desativado as DMs ou ter bloqueado você.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count mais';
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
  String get addGuildCreateClaimTitle => 'Reivindique sua conta';

  @override
  String get addGuildCreateClaimDescription =>
      'Você precisa reivindicar sua conta antes de criar uma comunidade.';

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
      'Esta instância é uma comunidade única, então não é possível criar outras comunidades.';

  @override
  String get addGuildCreateChangeIcon => 'Alterar ícone';

  @override
  String get addGuildCreateIconLabel => 'Ícone da comunidade';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Máx. 10 MB. Recomendado: 512×512 px';

  @override
  String get addGuildImportDescription =>
      'Cole a URL de um modelo do Discord para importar a estrutura dele para uma nova comunidade.';

  @override
  String get addGuildImportUrlLabel => 'URL do modelo';

  @override
  String get addGuildImportUrlInvalid =>
      'Digite uma URL ou código de modelo do Discord válido.';

  @override
  String get addGuildImportFetchFailed =>
      'Falha ao obter o modelo de comunidade. O modelo pode não existir ou o serviço externo está indisponível.';

  @override
  String get addGuildImportInvalidResponse =>
      'Isso não parece uma resposta de modelo válida.';

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
      'Os dados do modelo de comunidade são inválidos ou estão malformados.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Remover Todas as Reações';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Tem certeza de que deseja remover todas as reações desta mensagem?';

  @override
  String get chatMessagePinConfirm => 'Fixar';

  @override
  String get chatMessagePinConfirmDescription =>
      'Fixe esta mensagem no canal para que todos possam vê-la.';

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
    return 'Fechar sua conversa com $name?';
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
  String get channelDetailsDmSettingsTitle => 'Configurações da DM';

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
  String get channelDetailsGroupInvites => 'Convites do grupo';

  @override
  String get channelDetailsEditChannel => 'Editar canal';

  @override
  String get channelDetailsDeleteChannel => 'Excluir canal';

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
    return 'Tem certeza de que deseja excluir $channelName? Isso não pode ser desfeito.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'Tem certeza de que deseja excluir $categoryName? Isso não pode ser desfeito.';
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
  String get categoryUnmuteCategory => 'Ativar som da categoria';

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
  String get channelSettingsTopic => 'Tópico';

  @override
  String get channelSettingsTopicPlaceholder =>
      'Adicione um tópico a este canal';

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
    return 'Intervalo entre mensagens. \"$bypassSlowmodePermissionLabel\" pode ignorá-lo.';
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
  String get channelSettingsVoiceQuality => 'Qualidade de voz';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'Taxa de bits maior = melhor qualidade e maior uso de banda.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbps';
  }

  @override
  String get channelSettingsParticipantLimit => 'Limite de participantes';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Número máximo de membros que podem entrar ao mesmo tempo. 0 significa ilimitado.';

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
      'Selecione uma região de voz para este canal. A opção automática usa a região mais próxima.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Automática';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'Não foi possível carregar as regiões de voz';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Tente novamente em instantes.';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Substitua a configuração de nível $scopeLevel para este canal. O conteúdo maduro é exibido atrás de um aviso antes da entrada.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Herdar';

  @override
  String get channelSettingsMatureContentOn => 'Ativado';

  @override
  String get channelSettingsMatureContentOff => 'Desativado';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Marca este canal como contendo conteúdo maduro.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Deixa este canal sem aviso de conteúdo maduro.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Herdado de $inheritedSourceLabel: ativado';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Herdado de $inheritedSourceLabel: desativado';
  }

  @override
  String get channelSettingsMatureContentCategoryScope => 'Categoria';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Comunidade';

  @override
  String get channelSettingsContentWarningToggle =>
      'Mostrar um aviso de conteúdo neste canal';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Ativa um pedido de consentimento antes de entrar neste canal.';

  @override
  String get channelSettingsContentWarningText =>
      'Texto de aviso personalizado';

  @override
  String get channelSettingsContentWarningDefault =>
      'Isto contém conteúdo sensível.';

  @override
  String get channelSettingsUnknownRole => 'Cargo desconhecido';

  @override
  String get channelSettingsUnknownUser => 'Usuário desconhecido';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides =>
      'Substituições de acesso';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Editar acesso de $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'Voltar às substituições';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Configure o acesso básico deste canal';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Configure as substituições deste cargo';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Configure as substituições deste membro';

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
      'Este canal está sincronizado com a categoria principal ';

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
  String get channelSettingsPermissionsAddOverride => 'Adicionar substituição';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Pesquisar cargos ou membros…';

  @override
  String get channelSettingsDeleteInvite => 'Excluir convite';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Excluir este convite? Isso não pode ser desfeito.';

  @override
  String get channelSettingsCopyInviteCode => 'Copiar código do convite';

  @override
  String get channelSettingsCopyInviteUrl => 'Copiar URL do convite';

  @override
  String get channelSettingsWebhookCreated => 'Webhook criado';

  @override
  String get channelSettingsWebhookCreateFailed => 'Falha ao criar o webhook';

  @override
  String get channelSettingsCreateWebhook => 'Criar webhook';

  @override
  String get channelSettingsInvitesDescription =>
      'Gerencie os links de convite deste canal.';

  @override
  String get channelSettingsInvitesCreate => 'Criar convite';

  @override
  String get channelSettingsInvitesEmpty => 'Nenhum link de convite';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'Este canal ainda não tem links de convite. Crie um para convidar pessoas para este canal.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Ocorreu um erro ao carregar os links de convite deste canal. Tente novamente.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Gerencie os webhooks de entrada que podem postar mensagens neste canal.';

  @override
  String get channelSettingsWebhooksEmpty => 'Nenhum webhook';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'Não há webhooks configurados para este canal. Crie um webhook para permitir que aplicativos externos postem mensagens.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Este canal não é compatível com webhooks.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'Você precisa da permissão \"$permission\" para ver e editar os webhooks deste canal.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'Falha ao carregar os webhooks';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Ocorreu um erro ao carregar os webhooks deste canal. Tente novamente.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Criado por $creator em $date';
  }

  @override
  String get channelSettingsWebhooksAvatar => 'Avatar';

  @override
  String get channelSettingsWebhooksUploadImage => 'Enviar imagem';

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
      'Excluir este webhook? Isso não pode ser desfeito.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Tente novamente em instantes.';

  @override
  String get channelMenuOpenChat => 'Abrir chat';

  @override
  String get channelMenuDuplicateChannel => 'Duplicar canal';

  @override
  String channelDuplicateHelper(String channelName) {
    return 'O novo canal usará as mesmas permissões de $channelName.';
  }

  @override
  String channelDuplicateVoiceHelper(String channelName) {
    return 'O novo canal de voz usará as mesmas permissões, limite de usuários e taxa de bits de $channelName.';
  }

  @override
  String get channelMenuMoveToCategory => 'Mover para categoria';

  @override
  String get channelMenuNoCategory => 'Sem categoria';

  @override
  String get channelMoveCategoryFullTitle => 'Categoria cheia';

  @override
  String channelMoveCategoryFullMessage(int maxChannelsPerCategory) {
    return 'Esta categoria já contém o máximo de $maxChannelsPerCategory canais.';
  }

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Redefinir o consentimento de conteúdo maduro';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Excluir suas mensagens neste canal?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Isso excluirá permanentemente todas as mensagens que você já enviou neste canal. Isso não pode ser desfeito.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Excluir minhas mensagens';

  @override
  String get channelMenuDeletedYourMessages => 'Suas mensagens foram excluídas';

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
  String get channelDetailsLinkChannel => 'Canal de link';

  @override
  String get channelDetailsGenericChannel => 'Canal';

  @override
  String get channelDetailsMutedConversation => 'Conversa silenciada';

  @override
  String get channelDetailsUnmutedConversation => 'Conversa dessilenciada';

  @override
  String get channelDetailsMutedChannel => 'Canal silenciado';

  @override
  String get channelDetailsUnmutedChannel => 'Canal dessilenciado';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Configurações de notificação atualizadas';

  @override
  String get channelDetailsTabMembers => 'Membros';

  @override
  String get channelDetailsTabPins => 'Fixadas';

  @override
  String get channelDetailsActionMute => 'Silenciar';

  @override
  String get channelDetailsActionUnmute => 'Ativar som';

  @override
  String get channelDetailsActionSearch => 'Pesquisar';

  @override
  String get channelDetailsActionMore => 'Mais';

  @override
  String get channelDetailsMembersEmptyTitle => 'Nenhum membro para mostrar';

  @override
  String get channelDetailsMembersEmptyBody =>
      'Os membros aparecerão aqui quando os dados da comunidade forem carregados.';

  @override
  String get memberListPermissionDeniedTitle => 'Você não pode ver os membros';

  @override
  String get memberListPermissionDeniedBody =>
      'Você não pode ver os membros deste canal nesta comunidade';

  @override
  String get memberListUnavailableTitle => 'Lista de membros indisponível';

  @override
  String get memberListUnavailableBody =>
      'As listas de membros estão temporariamente indisponíveis nesta comunidade';

  @override
  String get channelDetailsPinsLoadFailedTitle =>
      'Não foi possível carregar as mensagens fixadas';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'Membros com a permissão \"Fixar mensagens\" podem fixar mensagens para que todos vejam.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'Você pode fixar mensagens nesta conversa para que todos vejam.';

  @override
  String get channelDetailsPinsEndReached => 'Você chegou ao fim';

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
  String get channelDetailsSearchFilterHas => 'Contém';

  @override
  String get channelDetailsSearchFilterIn => 'Em';

  @override
  String get channelDetailsSearchFilterMentions => 'Menções';

  @override
  String get channelDetailsSearchFilterMore => 'Mais';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Ativo';

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
  String get channelDetailsSearchChannelsHint => 'Pesquisar canais';

  @override
  String get channelDetailsSearchChannelsEmpty => 'Nenhum canal encontrado';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Fixadas';

  @override
  String get channelDetailsSearchPinnedTrue => 'Somente fixadas';

  @override
  String get channelDetailsSearchPinnedFalse => 'Excluir fixadas';

  @override
  String get channelDetailsSearchClearFilter => 'Limpar';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Tipo de autor';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Data';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Modo de data';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Escolha uma data';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Domínio do link';

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
  String get channelDetailsSearchContentForward => 'Encaminhada';

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
  String get channelSearchRemoveRecent => 'Remover das pesquisas recentes';

  @override
  String get channelSearchFiltersButton => 'Filtros';

  @override
  String get channelSearchFilterMenuTitle => 'Filtrar resultados';

  @override
  String get channelSearchFilterFromLabel => 'De uma pessoa específica';

  @override
  String get channelSearchFilterMentionsLabel =>
      'Menciona uma pessoa específica';

  @override
  String get channelSearchFilterHasLabel =>
      'Contém um link, arquivo ou incorporação';

  @override
  String get channelSearchFilterInLabel => 'Em um canal específico';

  @override
  String get channelSearchFilterDuringLabel => 'Enviada em uma data';

  @override
  String get channelSearchFilterBeforeLabel => 'Enviada antes de uma data';

  @override
  String get channelSearchFilterAfterLabel => 'Enviada depois de uma data';

  @override
  String get channelSearchFilterPinnedLabel => 'Fixada ou não fixada';

  @override
  String get channelSearchFilterAuthorTypeLabel => 'Por tipo de autor';

  @override
  String get channelSearchDateToday => 'Hoje';

  @override
  String get channelSearchDateYesterday => 'Ontem';

  @override
  String get channelSearchTabMessages => 'Mensagens';

  @override
  String get channelSearchTabImages => 'Imagens';

  @override
  String get channelSearchTabPins => 'Fixadas';

  @override
  String get channelSearchTabLinks => 'Links';

  @override
  String get channelSearchTabFiles => 'Arquivos';

  @override
  String channelSearchTabCount(String label, int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '$label ($countString)';
  }

  @override
  String get channelHeaderSearchFilterDescFrom => 'um usuário';

  @override
  String get channelHeaderSearchFilterDescMentions => 'um usuário';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'link, incorporação, imagem, vídeo, som, arquivo, sticker, …';

  @override
  String get channelHeaderSearchFilterDescBefore =>
      'uma data ou intervalo de datas';

  @override
  String get channelHeaderSearchFilterDescOn =>
      'uma data ou intervalo de datas';

  @override
  String get channelHeaderSearchFilterDescDuring =>
      'uma data ou intervalo de datas';

  @override
  String get channelHeaderSearchFilterDescAfter =>
      'uma data ou intervalo de datas';

  @override
  String get channelHeaderSearchFilterDescIn => 'um canal';

  @override
  String get channelHeaderSearchFilterDescPinned => 'true ou false';

  @override
  String get channelHeaderSearchFilterDescAuthorType => 'user, bot ou webhook';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'um domínio, ex.: example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'parte do nome de um arquivo anexo';

  @override
  String get channelHeaderSearchFilterDescFileType =>
      'uma extensão de arquivo, ex.: png';

  @override
  String get channelHeaderSearchFilterDescSort => 'timestamp ou relevance';

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
  String get channelDetailsSearchIn => 'Pesquisar em';

  @override
  String get channelDetailsSearchEmptyTitle => 'Pesquisar nesta conversa';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Digite um texto, um autor ou um filtro de conteúdo para encontrar mensagens.';

  @override
  String get channelDetailsSearchIndexingTitle =>
      'As mensagens estão sendo indexadas';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Tente novamente em instantes, quando a pesquisa terminar de indexar este escopo.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Nenhum resultado';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Tente outros termos de pesquisa ou filtros.';

  @override
  String get channelDetailsMembersOnline => 'Online';

  @override
  String get channelDetailsMembersOffline => 'Offline';

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
  String get channelDetailsSearchScopeAllDmsOnlyGuild => 'Somente todas as DMs';

  @override
  String get channelDetailsSearchScopeAllDms => 'Todas as DMs';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild => 'Somente DMs abertas';

  @override
  String get channelDetailsSearchScopeOpenDms => 'DMs abertas';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Todas as DMs + comunidades';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'DMs abertas + comunidades';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Pesquisar somente na comunidade atual';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Pesquisar somente na DM atual';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'Em todas as comunidades em que você está no momento';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Somente em todas as DMs de que você já participou';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'Em todas as DMs de que você já participou';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'Somente em todas as DMs que você tem abertas no momento';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'Em todas as DMs que você tem abertas no momento';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'Em todas as DMs de que você já participou + todas as comunidades em que você está no momento';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'Em todas as DMs que você tem abertas no momento + todas as comunidades em que você está no momento';

  @override
  String get channelDetailsSearchSortNewest => 'Mais recentes primeiro';

  @override
  String get channelDetailsSearchSortOldest => 'Mais antigas primeiro';

  @override
  String get channelDetailsSearchSortRelevance => 'Mais relevantes';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Mostrar as mensagens mais recentes primeiro';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Mostrar as mensagens mais antigas primeiro';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Mostrar as mensagens mais relevantes primeiro';

  @override
  String get channelDetailsSearchContentImage => 'Imagem enviada';

  @override
  String get channelDetailsSearchContentVideo => 'Vídeo enviado';

  @override
  String get channelDetailsSearchContentAudio => 'Áudio enviado';

  @override
  String get channelDetailsSearchContentFile => 'Arquivo enviado';

  @override
  String get channelDetailsSearchContentLink => 'Link';

  @override
  String get channelDetailsSearchContentEmbed => 'Prévia de link ou embed';

  @override
  String get channelDetailsSearchContentSticker => 'Figurinha';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Somente arquivos de imagem enviados';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Somente arquivos de vídeo enviados';

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
      'Prévias resolvidas e embeds avançados, não arquivos enviados';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Sticker anexado à mensagem';

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
    return 'Boas-vindas a $displayName. Adicione amigos para animar o grupo.';
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
  String get groupDmGroupName => 'Nome do grupo';

  @override
  String get groupDmMyGroup => 'Meu grupo';

  @override
  String get groupDmGroupNameMaxLength =>
      'O nome do grupo não pode ter mais de 100 caracteres';

  @override
  String get groupDmGroupIcon => 'Ícone do grupo';

  @override
  String get groupDmUploadIcon => 'Enviar ícone';

  @override
  String get groupDmChangeIcon => 'Alterar ícone';

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
      'Ícones animados não são suportados';

  @override
  String get groupDmIconFileTooLargeTitle =>
      'O arquivo do ícone é grande demais';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'O arquivo do ícone é grande demais. Escolha um arquivo menor que $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'Formato de ícone não suportado';

  @override
  String get groupDmUnsupportedIconFormatBody =>
      'Tipo de arquivo não suportado.';

  @override
  String get groupDmInvalidImage => 'Imagem inválida';

  @override
  String get groupDmInvalidImageBody => 'Essa imagem é inválida. Tente outra.';

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
  String get groupDmGroupFull =>
      'Este grupo está cheio. Remova alguém antes de adicionar mais pessoas.';

  @override
  String get groupDmRateLimited =>
      'Você está indo rápido demais. Aguarde um momento e tente novamente.';

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
  String get groupDmCopyInviteFailed => 'Falha ao copiar link de convite';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Somente o dono do grupo pode gerenciar convites.';

  @override
  String get groupDmNoInvitesCreated => 'Nenhum convite criado';

  @override
  String get groupDmLoadingInvites => 'Carregando convites...';

  @override
  String get groupDmInvitesLoadFailed =>
      'Falha ao carregar os convites. Tente novamente.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Revogar este convite? Isso não pode ser desfeito.';

  @override
  String get groupDmInviteRevoked => 'Convite revogado';

  @override
  String get groupDmRemoveFromGroup => 'Remover do grupo';

  @override
  String groupDmRemoveFromGroupConfirm(String userName) {
    return 'Remover $userName do grupo?';
  }

  @override
  String get groupDmRemoveFromGroupAction => 'Remover';

  @override
  String get groupDmRemovedFromGroup => 'Removido do grupo';

  @override
  String groupDmRemoveFromGroupFailed(String userName) {
    return '$userName ainda está no grupo. Tente novamente em instantes.';
  }

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
    return 'Este é o início de $channelName.';
  }

  @override
  String get personalNotesComposerHint => 'Envie uma mensagem para você mesmo';

  @override
  String channelComposerHint(String channelName) {
    return 'Enviar mensagem em #$channelName';
  }

  @override
  String dmComposerHint(String recipientName) {
    return 'Enviar mensagem para @$recipientName';
  }

  @override
  String groupDmNamedComposerHint(String groupName) {
    return 'Enviar mensagem para $groupName';
  }

  @override
  String get groupDmComposerHint => 'Enviar mensagem para o grupo';

  @override
  String get composerHint => 'Mensagem';

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
      'Acesso à galeria de fotos necessário';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Permita o acesso à galeria de fotos para navegar e anexar fotos e vídeos recentes.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Abrir configurações';

  @override
  String get chatAttachmentLibraryLimitedBody =>
      'Somente as fotos e os vídeos que você escolheu compartilhar aparecem aqui.';

  @override
  String get chatAttachmentLibraryLimitedManage => 'Gerenciar';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', enviando';

  @override
  String get messageAccessibilityFailedSuffix => ', falha no envio';

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
    return 'figurinha $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'arquivo $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'um anexo com spoiler';

  @override
  String get messageAccessibilityEmbedSummary => 'um embed';

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
  String get userSettingsGroupYourAccount => 'Sua conta';

  @override
  String get userSettingsGroupBilling => 'Cobrança';

  @override
  String get userSettingsGroupApplication => 'Aplicativo';

  @override
  String get userSettingsGroupDeveloper => 'Desenvolvedor';

  @override
  String get userSettingsGroupStaffOnly => 'Somente equipe';

  @override
  String get userSettingsSearchPlaceholder => 'Pesquisar configurações...';

  @override
  String get userSettingsSearchClear => 'Limpar pesquisa';

  @override
  String get userSettingsSearchNoResults => 'Nenhuma configuração encontrada';

  @override
  String get userSettingsCopyLinkToSection => 'Copiar link da seção';

  @override
  String get userSettingsCopyLinkToPage => 'Copiar link da página';

  @override
  String userSettingsJumpLinkPremiumPage(String productName) {
    return 'Página do $productName';
  }

  @override
  String get userSettingsNavProfile => 'Perfil';

  @override
  String get userSettingsNavSecurityLogin => 'Segurança e Login';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Presentes e Códigos';

  @override
  String get giftSettingsClaimAccountTitle => 'Reivindique sua conta';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Reivindique sua conta para resgatar ou gerenciar códigos de presente do Plutonium.';

  @override
  String get giftSettingsRedeemTitle => 'Resgatar um presente';

  @override
  String get giftSettingsRedeemDescription =>
      'Digite um código de presente para resgatar o Plutonium na sua conta.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Digite o código de presente…';

  @override
  String get giftSettingsRedeemButton => 'Resgatar';

  @override
  String get giftSettingsRedeemSuccess =>
      'Presente resgatado com sucesso. Aproveite seu Plutonium.';

  @override
  String get giftSettingsPurchasedTitle => 'Presentes comprados';

  @override
  String get giftSettingsPurchasedDescription =>
      'Gerencie seus códigos de presente do Plutonium comprados. Compartilhe a URL do presente com alguém especial ou resgate para você mesmo!';

  @override
  String get giftSettingsEmptyTitle => 'Nenhum presente ainda';

  @override
  String get giftSettingsEmptyDescription =>
      'Compre um presente do Plutonium na aba Plutonium para compartilhar com amigos.';

  @override
  String get giftSettingsGoToPlutonium => 'Ir para o Plutonium';

  @override
  String get giftSettingsLoadFailedTitle =>
      'Falha ao carregar o inventário de presentes';

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
  String get premiumUpgradeNow => 'Fazer upgrade agora';

  @override
  String get premiumBuyGift => 'Comprar presente';

  @override
  String get premiumOneYearGift => 'Presente de 1 ano';

  @override
  String get premiumOneMonthGift => 'Presente de 1 mês';

  @override
  String get premiumScrollPrompt =>
      'Role para baixo para ver todas as vantagens incluídas no Plutonium';

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
  String get premiumReadyToUpgrade => 'Pronto para fazer upgrade?';

  @override
  String get premiumReadyToBuyGift => 'Pronto para comprar um presente?';

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
      'Você mantém suas vantagens até a próxima data de renovação e depois tem um período de carência de 3 dias para assinar novamente e manter seu histórico de assinante.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Cancelar assinatura';

  @override
  String get premiumPurchaseHistoryTitle => 'Histórico de compras';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Suas faturas recentes. Para alterar a forma de pagamento da sua assinatura, adicione ou escolha uma no portal de cobrança e defina-a como padrão.';

  @override
  String get premiumManagePaymentMethods => 'Gerenciar formas de pagamento';

  @override
  String get premiumSelfServeRefundButton => 'Reembolsar última compra';

  @override
  String get premiumDisclaimerAgreementPrefix =>
      'Ao comprar, você concorda com nossos ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'Ao comprar, você concordou com nossos ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' e com nossa ';

  @override
  String premiumActiveUntil(String date) {
    return 'Ativa até $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Cancelando';

  @override
  String premiumCancelsOn(String date) {
    return 'Será cancelada em $date. As vantagens continuam ativas até lá.';
  }

  @override
  String get premiumReactivateSubscription => 'Reativar';

  @override
  String premiumGiftedUntil(String date) {
    return 'Presenteada até $date. Não é renovada automaticamente.';
  }

  @override
  String get premiumGiftGraceEnded =>
      'Seu tempo de presente acabou. Assine para continuar com o Plutonium.';

  @override
  String get premiumGiftTimeAddedAfterSubscription =>
      'Ao assinar, a cobrança é feita agora. O tempo de presente restante é adicionado após o período pago.';

  @override
  String get premiumComparisonFeatureColumn => 'Recurso';

  @override
  String get premiumDisclaimerRefund =>
      'Reembolsos por conta própria disponíveis em até 3 dias após o pagamento, uma vez a cada 30 dias. Reembolsar uma assinatura a cancela. Compradores da UE/EEE renunciam ao direito de arrependimento de 14 dias no checkout para acessar o conteúdo imediatamente. Use o botão de reembolso no app em vez de contestar a cobrança. Contestações de cobrança podem restringir sua conta permanentemente. O Stripe processa o pagamento com segurança. Nunca vemos o número completo do seu cartão.';

  @override
  String get premiumTermsOfService => 'Termos de serviço';

  @override
  String get premiumPrivacyPolicy => 'Política de privacidade';

  @override
  String get premiumCheckoutStartFailedTitle =>
      'Não foi possível iniciar o checkout';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Algo deu errado ao iniciar o checkout. Tente novamente em instantes.';

  @override
  String get premiumPlanUnavailable =>
      'Este plano não está disponível. Entre em contato com o suporte.';

  @override
  String get premiumPlanUnavailableSelfHosted =>
      'Este plano não está disponível. Entre em contato com os administradores desta instância.';

  @override
  String get premiumCompletePaymentTitle => 'Concluir pagamento';

  @override
  String get premiumCompletePaymentBody =>
      'Você está sendo direcionado ao Stripe para concluir o pagamento. Volte ao Fluxer depois de concluí-lo.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Escolher forma de pagamento';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Pague com Pix automático para autorizar cobranças recorrentes diretamente do seu banco brasileiro. Ou escolha usar cartão para informar um cartão de crédito na próxima tela do Stripe.';

  @override
  String get premiumUsePix => 'Usar Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Pague com UPI para configurar um mandato eletrônico em conformidade com o RBI a partir do seu banco indiano. Ou escolha usar cartão para informar um cartão de crédito na próxima tela do Stripe.';

  @override
  String get premiumUseUpi => 'Usar UPI';

  @override
  String get premiumUseCard => 'Usar cartão';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Não foi possível abrir o portal de cobrança';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Algo deu errado ao abrir o portal de cobrança. Tente novamente em instantes.';

  @override
  String get premiumAlreadyVisionaryTitle => 'Você já é Visionary';

  @override
  String get premiumAlreadyVisionaryBody =>
      'O Visionary já inclui acesso permanente, então uma assinatura recorrente não é necessária. Você ainda pode comprar presentes para outras pessoas.';

  @override
  String get premiumExistingSubscriptionTitle => 'Assinatura já existente';

  @override
  String get premiumExistingSubscriptionBody =>
      'Encontramos uma assinatura do Fluxer Plutonium para esta conta. Gerencie-a no portal de cobrança seguro para atualizar os dados de pagamento ou verificar o status da renovação. Se você acabou de pagar, aguarde um minuto e abra esta página novamente.';

  @override
  String get premiumPurchasesDisabledTitle => 'Compras indisponíveis';

  @override
  String premiumPurchasesDisabledBody(String supportEmail) {
    return 'As compras estão desativadas para esta conta. Entre em contato com $supportEmail se isso parecer um erro.';
  }

  @override
  String get premiumPurchasesDisabledBodySelfHosted =>
      'As compras estão desativadas para esta conta. Entre em contato com os administradores desta instância se isso parecer um erro.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Reivindique sua conta para comprar o Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Você precisa verificar seu e-mail antes de comprar o Fluxer Plutonium.';

  @override
  String get premiumPerkCommunities => 'Comunidades';

  @override
  String get premiumPerkMessageCharacterLimit =>
      'Limite de caracteres por mensagem';

  @override
  String get premiumPerkBookmarkedMessages => 'Mensagens salvas';

  @override
  String get premiumPerkFileUploadSize => 'Tamanho de envio de arquivos';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Usar emojis animados';

  @override
  String get premiumPerkVideoQuality => 'Qualidade de vídeo';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Avatares e banners de perfil animados';

  @override
  String get premiumPerkEarlyAccess => 'Acesso antecipado a novos recursos';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Até 4K/60fps';

  @override
  String storePlutoniumPriceLine(String monthly, String yearly) {
    return '$monthly ou $yearly';
  }

  @override
  String get storePlutoniumMonthSuffix => '/mês';

  @override
  String get storePlutoniumYearSuffix => '/ano';

  @override
  String get storePlutoniumPriceOr => 'ou';

  @override
  String get storePlutoniumEmojiTitle => 'Seus emojis em todo lugar';

  @override
  String get storePlutoniumEmojiBody =>
      'Leve emojis e stickers personalizados de qualquer uma das suas comunidades para todos os chats e comunidades em que você está.';

  @override
  String get storePlutoniumProfileTitle => 'Um perfil que se destaca';

  @override
  String get storePlutoniumProfileBody =>
      'Tenha avatar e banner animados, um selo de assinante, a tag de quatro dígitos que você quiser depois do seu nome de usuário* e um perfil separado para cada comunidade.';

  @override
  String get storePlutoniumFilesTitle => 'Envie arquivos de até 500 MB';

  @override
  String get storePlutoniumFilesBody =>
      'Compartilhe vídeos completos e arquivos grandes sem precisar reduzi-los antes. Contas gratuitas podem enviar até 25 MB.';

  @override
  String get storePlutoniumCompareTitle => 'Compare o Gratuito e o Plutonium';

  @override
  String get storePlutoniumCompareMobileNote =>
      'Nem todos esses recursos estão no app para celular. Alguns só estão disponíveis no desktop.';

  @override
  String get storePlutoniumNotAvailable => 'Indisponível';

  @override
  String get storePlutoniumAvailable => 'Disponível';

  @override
  String get storePlutoniumCompareTag =>
      'Escolha o número de 4 dígitos depois do seu nome de usuário*';

  @override
  String get storePlutoniumCompareProfile =>
      'Um perfil separado para cada comunidade';

  @override
  String get storePlutoniumCompareBadge => 'Selo de assinante no seu perfil';

  @override
  String get storePlutoniumCompareBackgrounds =>
      'Fundos de chamada de vídeo que você pode salvar';

  @override
  String get storePlutoniumCompareCommunities =>
      'Comunidades em que você pode entrar';

  @override
  String get storePlutoniumCompareCharacters =>
      'Caracteres em uma única mensagem';

  @override
  String get storePlutoniumCompareBookmarks => 'Mensagens que você pode salvar';

  @override
  String get storePlutoniumCompareUpload =>
      'Maior arquivo que você pode enviar';

  @override
  String get storePlutoniumCompareSavedMedia =>
      'Itens de mídia que você pode salvar para depois';

  @override
  String get storePlutoniumCompareAnimatedEmoji =>
      'Usar emojis animados em mensagens';

  @override
  String get storePlutoniumCompareCustomEmoji =>
      'Usar emojis e stickers personalizados em qualquer comunidade';

  @override
  String get storePlutoniumCompareVideo =>
      'Qualidade de chamada de vídeo e compartilhamento de tela';

  @override
  String get storePlutoniumCompareAvatar =>
      'Avatar e banner de perfil animados';

  @override
  String get storePlutoniumCompareEarlyAccess =>
      'Acesso antecipado a novos recursos';

  @override
  String get storePlutoniumCompareThemes => 'Temas personalizados para o app';

  @override
  String get storePlutoniumVideoFree => 'Até 720p a 30 FPS';

  @override
  String get storePlutoniumVideoPlutonium => 'Até 4K a 60 FPS';

  @override
  String get storePlutoniumTagFootnote =>
      'Você só pode escolher uma tag que ninguém mais com o mesmo nome de usuário já tenha. Nomes de usuário não diferenciam maiúsculas de minúsculas, então Mina#4821 e mina#4821 contam como o mesmo. A tag #0000 é reservada para membros do Fluxer Visionary.';

  @override
  String get storePlutoniumLearnVisionary => 'Saiba mais sobre o Visionary.';

  @override
  String get storePlutoniumDonatePrompt =>
      'Só quer apoiar o desenvolvimento de código aberto do Fluxer? ';

  @override
  String get storePlutoniumDonateLink => 'Faça uma doação.';

  @override
  String get storePlutoniumHighlightsLead =>
      'Assinar financia o Fluxer e desbloqueia';

  @override
  String get storePlutoniumHighlightEmoji =>
      'Emojis e stickers personalizados em qualquer chat';

  @override
  String get storePlutoniumHighlightProfile =>
      'Perfil animado, selo e número de 4 dígitos personalizado';

  @override
  String get storePlutoniumHighlightFiles => 'Envios de até 500 MB';

  @override
  String get storePlutoniumHighlightMessages =>
      'Envie mensagens de até 4.000 caracteres';

  @override
  String get storePlutoniumHighlightCommunityProfile =>
      'Um perfil separado para cada comunidade';

  @override
  String get storePlutoniumHighlightsMore => 'E muito mais';

  @override
  String get storePlutoniumRenewsThroughPlay =>
      'Renovada automaticamente pelo Google Play até você cancelar.';

  @override
  String get storePlutoniumRenewsThroughAppStore =>
      'Renovada automaticamente pela App Store até você cancelar.';

  @override
  String get storePlutoniumRestorePurchases => 'Restaurar compras';

  @override
  String get storePlutoniumAlreadySubscribed =>
      'Você já tem uma assinatura do Fluxer Plutonium.';

  @override
  String storePlutoniumSavePercent(int percent) {
    return 'Economize $percent%';
  }

  @override
  String get storePlutoniumWaiting =>
      'Compra recebida. O Plutonium aparecerá aqui assim que for ativado.';

  @override
  String get storePlutoniumUnavailable =>
      'Assinaturas no app ainda não estão disponíveis neste dispositivo.';

  @override
  String get storePlutoniumVisionaryStatus =>
      'O Visionary já inclui acesso permanente, então uma assinatura recorrente não é necessária.';

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
      'Configure sua câmera e a qualidade do compartilhamento de tela.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle =>
      'Comportamento durante chamadas';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Controle as confirmações durante chamadas de voz e vídeo.';

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
      'Quando desativado, o áudio é reproduzido pelo fone do aparelho ou pelos fones de ouvido conectados.';

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
      'Recomendado. Limpa o som do seu microfone para uma fala nítida.';

  @override
  String get audioAndVideoDirectInputLabel => 'Entrada direta';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Envia seu áudio sem alterações. Ideal se você usa um software de áudio externo.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Personalizado';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Ajuste cada configuração você mesmo: supressão de ruído, cancelamento de eco e ganho.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Supressão de ruído';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Avançada';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Padrão';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Nenhuma';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Cancelamento de eco';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Controle automático de ganho';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Equilibra o volume do seu microfone. Fica desativado quando a supressão avançada está ativada.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Teste de microfone';

  @override
  String get audioAndVideoMicTestStartLabel => 'Iniciar teste de microfone';

  @override
  String get audioAndVideoMicTestStopLabel => 'Parar teste de microfone';

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
  String get audioAndVideoInstanceVideoQualityLimit =>
      'No momento, esta instância permite compartilhamento de tela de até 720p a 30 FPS.';

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
    return 'Seja notificado quando receber mensagens. Talvez seja necessário permitir notificações do $productName nas configurações do seu dispositivo. Para controles por canal ou por comunidade, abra as configurações de notificação no menu de uma comunidade.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Ativar notificações na área de trabalho';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Usa a central de notificações do sistema. Para controles por canal ou por comunidade, clique com o botão direito no ícone de uma comunidade e abra as configurações de notificação.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Tempo de inatividade para notificações push';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return 'O $productName evita enviar notificações push para seus dispositivos móveis quando você está no computador. Escolha quanto tempo você precisa ficar inativo no desktop antes de receber notificações push.';
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
      'Preferência de menção em respostas';

  @override
  String get notificationsMentionNoPreferenceName => 'Sem preferência';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Respeitar a intenção de quem envia, sem aviso quando ativar ou desativar a @menção';

  @override
  String get notificationsMentionPreferMentionName => 'Preferir @menção';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Respostas para você usam @menção por padrão, e quem envia é avisado se desativá-la';

  @override
  String get notificationsMentionPreferNoMentionName => 'Preferir sem @menção';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Respostas para você omitem a @menção por padrão, e quem envia é avisado se ativá-la';

  @override
  String get notificationsTtsSectionTitle => 'Notificações de texto para fala';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'Ativar reprodução de fala do /tts';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'Permite que o /tts leia sua mensagem em voz alta. Ao desativar a configuração, esses comandos ficam como texto comum.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Ajuste a velocidade de reprodução em ';

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
      'Todas as mensagens recebidas são faladas, independentemente de qual canal está aberto.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Somente o canal ativo';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Narra apenas o canal que você está vendo. A narração acompanha você entre os canais.';

  @override
  String get notificationsTtsModeNeverName => 'Nunca automaticamente';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Fica em silêncio, a menos que alguém use /tts manualmente.';

  @override
  String get notificationsTtsModeAriaLabel =>
      'Falar todas as mensagens em voz alta';

  @override
  String get notificationsSoundsSectionTitle => 'Sons';

  @override
  String get notificationsMasterVolumeLabel => 'Volume geral';

  @override
  String get notificationsMasterVolumeDescription =>
      'Define o nível de todos os efeitos sonoros. Volumes individuais por som ignoram esta configuração.';

  @override
  String get notificationsResetToDefaultVolume =>
      'Redefinir para o volume padrão';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Desativar todos os sons de notificação';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Suas configurações atuais de sons de notificação serão preservadas.';

  @override
  String get notificationsShowMoreSoundEffects =>
      'Mostrar mais efeitos sonoros';

  @override
  String get notificationsShowFewerSoundEffects =>
      'Mostrar menos efeitos sonoros';

  @override
  String get notificationsPreviewSound => 'Ouvir som';

  @override
  String get notificationsPerSoundVolumeTitle => 'Volume por som';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Defina volumes personalizados para sons individuais. Sons sem ajuste próprio seguem o volume geral.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Ajustes de volume personalizados ativos: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Seguindo o geral • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'Redefinir $label para o volume geral';
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
    return 'Ativar som de $label';
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
  String get notificationsSoundMute => 'Silenciar voz';

  @override
  String get notificationsSoundUnmute => 'Ativar som da voz';

  @override
  String get notificationsSoundDeaf => 'Deixar surdo';

  @override
  String get notificationsSoundUndeaf => 'Remover surdez';

  @override
  String get notificationsSoundUserJoin => 'Usuário entra no canal';

  @override
  String get notificationsSoundUserLeave => 'Usuário sai do canal';

  @override
  String get notificationsSoundUserMove => 'Usuário mudou de canal';

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
  String get notificationsSoundCameraOff => 'Câmera desligada';

  @override
  String get notificationsSoundScreenShareStart =>
      'Início do compartilhamento de tela';

  @override
  String get notificationsSoundScreenShareStop =>
      'Fim do compartilhamento de tela';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'Não foi possível atualizar o tempo limite das notificações push. Tente novamente.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Não foi possível atualizar a preferência de menções. Tente novamente.';

  @override
  String get notificationsPermissionDeniedTitle => 'Notificações bloqueadas';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'Não foi possível ativar as notificações. Permita as notificações para continuar.';

  @override
  String get notificationsPushDeliveryProviderLabel => 'Provedor de push';

  @override
  String get notificationsPushDeliveryDistributorLabel => 'Distribuidor';

  @override
  String get notificationsPushDeliveryDistributorNone => 'Não selecionado';

  @override
  String get notificationsPushDeliveryDistributorSheetTitle =>
      'Escolher distribuidor';

  @override
  String get notificationsPushDeliveryDistributorPickAccessibility =>
      'Alterar distribuidor de push';

  @override
  String get notificationsPushDeliveryGatewayLabel => 'Gateway';

  @override
  String get notificationsPushDeliveryRelayLabel => 'Retransmissão Fluxer Push';

  @override
  String get notificationsPushDeliveryRelayInUse => 'Em uso';

  @override
  String get notificationsPushDeliveryRelayOff => 'Desativada';

  @override
  String get notificationsPushDeliveryRelayNotUsed => 'Não usada';

  @override
  String get notificationsPushRelaySectionTitle =>
      'Retransmissão de notificações push';

  @override
  String notificationsPushRelaySectionDescription(String pushProvider) {
    return 'A $pushProvider só entrega notificações push através do seu próprio serviço, por isso as deste dispositivo passam pela retransmissão da Fluxer.';
  }

  @override
  String get notificationsPushRelayConsentLabel =>
      'Usar a retransmissão push da Fluxer';

  @override
  String get notificationsPushRelayConsentDescription =>
      'Se desativares isto, o registo push deste dispositivo é removido e o dispositivo deixa de receber notificações push.';

  @override
  String get pushRelayConsentTitle => 'Retransmissão de notificações push';

  @override
  String pushRelayConsentDescription(String pushProvider) {
    return 'A $pushProvider só entrega notificações push através do seu próprio serviço, por isso as deste dispositivo passam pela retransmissão da Fluxer.';
  }

  @override
  String get pushRelayConsentNoticePrefix => 'Aceita o ';

  @override
  String get pushRelayConsentNoticeLink =>
      'aviso de privacidade da retransmissão push';

  @override
  String get pushRelayConsentNoticeSuffix =>
      ' para ativar as notificações push neste dispositivo. Só precisas de aceitar uma vez por dispositivo.';

  @override
  String get pushRelayConsentAgree => 'Aceitar e continuar';

  @override
  String get pushRelayConsentDecline => 'Agora não';

  @override
  String get userSettingsNavLanguageAndTime => 'Idioma e Hora';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Idioma da interface';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Escolha o idioma usado em todo o aplicativo';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Formato de hora';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Escolha como as horas são exibidas em todo o aplicativo';

  @override
  String get languageAndTimeTimeFormatSelectionLabel =>
      'Seleção do formato de hora';

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
    return 'Localidade do sistema: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Usar a localidade do sistema para o formato de hora';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'Falha ao atualizar o formato de hora';

  @override
  String get userSettingsNavDefaultApps => 'Aplicativos padrão';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Navegador';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Escolha qual navegador abre quando você toca em um link.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'Se houver um aplicativo instalado para um site, os links serão abertos primeiro nesse aplicativo.';

  @override
  String get defaultAppsWebBrowserInApp => 'Navegador integrado';

  @override
  String get defaultAppsWebBrowserExternal => 'Navegador externo';

  @override
  String get userSettingsNavAppIcon => 'Ícone do aplicativo';

  @override
  String get appIconSectionTitle => 'Ícone do aplicativo';

  @override
  String get appIconSectionDescription =>
      'Escolha qual ícone aparece na sua tela inicial.';

  @override
  String get appIconSectionDescriptionAndroid =>
      'Escolha qual ícone aparece na sua tela inicial. Alterar o ícone reinicia o aplicativo.';

  @override
  String get appIconAndroidChangeTitle => 'Alterar o ícone do aplicativo?';

  @override
  String get appIconAndroidChangeDescription =>
      'O Fluxer será reiniciado para aplicar o novo ícone da tela inicial.';

  @override
  String get appIconAndroidChangeConfirm => 'Alterar ícone';

  @override
  String get appIconOptionDefault => 'Padrão';

  @override
  String get appIconOptionStarfield => 'Campo estelar';

  @override
  String get appIconOptionSweden => 'Suécia';

  @override
  String get appIconOptionGreyscale => 'Tons de cinza';

  @override
  String get appIconOptionRainbow => 'Arco-íris';

  @override
  String get appIconOptionWaves => 'Ondas';

  @override
  String get appIconOptionChromaticAberration => 'Aberração cromática';

  @override
  String get appIconOptionDefaultBrutalist => 'Brutalista';

  @override
  String get appIconOptionGreyscaleBrutalist => 'Brutalista em tons de cinza';

  @override
  String get appIconUnsupported =>
      'Não é possível alterar o ícone do aplicativo neste dispositivo.';

  @override
  String get userSettingsNavAdvanced => 'Avançado';

  @override
  String get advancedPerformanceReportingTitle => 'Relatórios de desempenho';

  @override
  String get advancedCrashReportingSectionDescription =>
      'Ajude a Fluxer a corrigir bugs neste aplicativo compartilhando dados de falhas e de desempenho. Isso fica desativado por padrão.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Enviar relatórios de falhas e desempenho';

  @override
  String get advancedCrashReportingDescription =>
      'Os relatórios vão para o rastreador de erros da Fluxer, mesmo quando você está conectado a outra instância. Eles não incluem nomes de instâncias, IDs nem conteúdo de mensagens.';

  @override
  String get observabilityReportingConsentTitle => 'Ajude a corrigir falhas';

  @override
  String get observabilityReportingConsentSubtitle =>
      'O Fluxer fechou inesperadamente. Compartilhar dados anônimos de falhas e erros nos ajuda a corrigir problemas mais rápido.';

  @override
  String get observabilityReportingConsentBody =>
      'Os relatórios incluem registros de falhas, erros e dados básicos de desempenho. Eles não são compartilhados com terceiros e você pode desativar isso a qualquer momento.';

  @override
  String observabilityReportingConsentEnableLater(String reportingToggle) {
    return 'Para ativar depois, abra Configurações → Avançado → $reportingToggle.';
  }

  @override
  String get observabilityReportingConsentAgree =>
      'Enviar relatórios de falhas';

  @override
  String get observabilityReportingConsentDecline => 'Não quero ativar';

  @override
  String get advancedSettingsConfigure => 'Configurar';

  @override
  String get advancedSettingsCategoryPrivacy => 'Privacidade';

  @override
  String get advancedSettingsCategoryAppearance => 'Aparência';

  @override
  String get advancedSettingsCategoryAccessibility => 'Acessibilidade';

  @override
  String get advancedSettingsCategoryChat => 'Chat';

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
      'Ativar miniaturas ao avançar o vídeo';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Miniatura ou quadro ao vivo ao percorrer o vídeo';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Resposta tátil';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Vibração ao tocar e realizar ações. Não é sincronizado entre dispositivos.';

  @override
  String get advancedSettingShowNekoLabel => 'Mostrar Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'Gato Neko que persegue o seu cursor';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Mostrar Neko no campo de mensagem';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Animação de zoom na abertura';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Afastar o logo ao sair da tela de abertura';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Dicas de teclado';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Dicas de atalhos de teclado nas dicas de ferramenta';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Ativar favoritos';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Mostrar favoritos em todo o aplicativo';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Comportamento ao entrar em canais de voz';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Confirmação ou clique duplo para entrar em canais de voz da comunidade';

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
      'Enviar GIFs do seletor automaticamente, sem confirmação';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Salvar GIFs favoritos como mídia salva';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Escolha como os GIFs favoritados com estrela são armazenados';

  @override
  String get advancedSettingMediaButtonsLabel => 'Botões de mídia';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Personalize quais botões e indicadores aparecem em anexos de mídia e incorporações';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Enviar anexos antes de mandar a mensagem';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Começar a enviar os anexos assim que forem adicionados ao campo de mensagem';

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
  String get advancedSettingSearchEnginesLabel => 'Mecanismos de pesquisa';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Configure os mecanismos de pesquisa usados a partir do texto selecionado';

  @override
  String get advancedSettingTranslatorsLabel => 'Tradutores';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Configure os provedores de tradução usados a partir do texto selecionado';

  @override
  String get advancedSettingReverseImageSearchLabel =>
      'Pesquisa reversa de imagens';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Provedores de pesquisa reversa de imagens';

  @override
  String get advancedSettingMessageActionBarLabel =>
      'Barra de ações da mensagem';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Personalize a barra de ações que aparece ao passar o cursor sobre as mensagens';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Autocompletar de expressões';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Escolha o que aparece quando você digita dois-pontos no campo de mensagem';

  @override
  String get advancedSettingInputButtonsLabel => 'Botões do campo de mensagem';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Escolha quais botões aparecem no campo de mensagem';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Rolar até o fim ao enviar uma mensagem';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Escolha como o chat se move depois que você envia uma mensagem';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Pular a confirmação de \"Marcar tudo como lido\"';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Marcar todos os canais não lidos da caixa de entrada como lidos imediatamente, sem pedir confirmação';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Ocultar canais silenciados por padrão';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Ocultar os canais que você silenciou das barras laterais das comunidades';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'Mostrar indicador de GIF';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Mostrar indicador de expiração de anexos';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'Mostrar botão de excluir';

  @override
  String get advancedSettingShowMediaDownloadLabel => 'Mostrar botão de baixar';

  @override
  String get advancedSettingShowMediaFavoriteLabel =>
      'Mostrar botão de favoritar';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Mostrar botão de suprimir incorporações';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Mostrar barra de ações da mensagem';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel =>
      'Mostrar apenas o botão de mais opções';

  @override
  String get advancedSettingShowQuickReactionsLabel =>
      'Mostrar reações rápidas';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Ativar Shift para expandir';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Mostrar emojis padrão no autocompletar de expressões';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Mostrar emojis personalizados no autocompletar de expressões';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Mostrar stickers no autocompletar de expressões';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Mostrar mídia salva no autocompletar de expressões';

  @override
  String get advancedSettingShowGifsButtonLabel => 'Mostrar botão de GIFs';

  @override
  String get advancedSettingShowMediaButtonLabel => 'Mostrar botão de mídia';

  @override
  String get advancedSettingShowStickersButtonLabel =>
      'Mostrar botão de stickers';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Mostrar botão de emojis';

  @override
  String get advancedSettingShowSendButtonLabel => 'Mostrar botão de enviar';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Mostrar alertas de novos dispositivos';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Avisar sobre novos dispositivos de áudio';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Controles de volume por conexão';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Mostrar controles de volume por dispositivo dos participantes nos menus de voz';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Comportamento da prévia do compartilhamento de tela';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Comportamento da prévia, da janela destacada e da miniatura da transmissão';

  @override
  String get advancedSettingScreenShareCodecLabel =>
      'Codec do compartilhamento de tela';

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
      'Pausar a prévia do meu compartilhamento de tela em segundo plano';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Ocultar a miniatura de prévia da minha transmissão';

  @override
  String get advancedSettingDeveloperModeLabel =>
      'Ativar modo de desenvolvedor';

  @override
  String get advancedSettingDeveloperModeDescription =>
      'Ativar modo de desenvolvedor';

  @override
  String get advancedSettingDefaultSearchEngineLabel =>
      'Mecanismo de pesquisa padrão';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Escolha qual mecanismo de pesquisa é usado por padrão ao pesquisar o texto selecionado.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Mecanismos de pesquisa integrados';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Ative ou desative os mecanismos de pesquisa integrados. Os mecanismos ativados aparecem no menu de contexto da mensagem quando há texto selecionado.';

  @override
  String get advancedSettingCustomSearchEnginesLabel =>
      'Mecanismos de pesquisa personalizados';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Adicione seus próprios mecanismos de pesquisa com um padrão de URL personalizado. Use \'$query\' como marcador para o texto da pesquisa.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel =>
      'Adicionar mecanismo de pesquisa';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Ative pelo menos um mecanismo de pesquisa abaixo.';

  @override
  String get advancedSettingRemoveSearchEngineLabel =>
      'Remover mecanismo de pesquisa';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'Tradutor padrão';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Escolha qual tradutor é usado por padrão ao traduzir o texto selecionado.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Tradutores integrados';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Ative ou desative os tradutores integrados. Os tradutores ativados aparecem no menu de contexto da mensagem quando há texto selecionado.';

  @override
  String get advancedSettingCustomTranslatorsLabel =>
      'Tradutores personalizados';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Adicione seus próprios tradutores com um padrão de URL personalizado. Use \'$query\' como marcador para o texto a ser traduzido.';
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
      'Pesquisa reversa de imagens padrão';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Escolha qual serviço de pesquisa reversa de imagens é usado por padrão ao pesquisar uma imagem.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Pesquisa reversa de imagens integrada';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Ative ou desative os provedores integrados de pesquisa reversa de imagens. Os provedores ativados aparecem no menu de contexto de imagens, avatares, banners, stickers e emojis.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Pesquisa reversa de imagens personalizada';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Adicione seus próprios provedores de pesquisa reversa de imagens com um padrão de URL personalizado. Use \'$url\' como marcador para a URL da imagem.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Adicionar pesquisa reversa de imagens';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Ative pelo menos um provedor de pesquisa reversa de imagens abaixo.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Remover pesquisa reversa de imagens';

  @override
  String get advancedSettingAddSearchEngineTitle =>
      'Adicionar mecanismo de pesquisa';

  @override
  String get advancedSettingEditSearchEngineTitle =>
      'Editar mecanismo de pesquisa';

  @override
  String get advancedSettingAddTranslatorTitle =>
      'Adicionar provedor de tradução';

  @override
  String get advancedSettingEditTranslatorTitle =>
      'Editar provedor de tradução';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Adicionar mecanismo de pesquisa reversa de imagens';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Editar mecanismo de pesquisa reversa de imagens';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Nome';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'Padrão de URL';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'Meu mecanismo de pesquisa';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Meu tradutor';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'Minha pesquisa reversa de imagens';

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
    return 'Use \'$url\' onde a URL da imagem deve ser inserida.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired =>
      'O nome é obrigatório.';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'O padrão de URL é obrigatório.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'O padrão de URL deve conter o marcador \'$query\'.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'O padrão de URL deve conter o marcador \'$url\'.';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'O padrão de URL deve ser uma URL válida.';

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
  String get userSettingsGiveFeedback => 'Enviar feedback';

  @override
  String get userSettingsNavAppLicenses => 'Licenças do aplicativo';

  @override
  String get userSettingsAppLicensesDescription =>
      'Software de código aberto usado por este aplicativo. Este aplicativo é feito com Flutter.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'Não foi possível carregar as licenças do aplicativo.';

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
  String get userSettingsLogOutConfirmTitle => 'Sair?';

  @override
  String get userSettingsLogOutConfirmDescription =>
      'Você pode entrar novamente a qualquer momento.';

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
  String get quickSwitcherSectionThreads => 'Tópicos';

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
      'Salve mensagens para vê-las mais tarde.';

  @override
  String get savedMessagesEndBody => 'Não há mais nada para ver aqui.';

  @override
  String get savedMessagesRemoveTooltip => 'Remover item salvo';

  @override
  String get savedMessagesAddedToast => 'Adicionada aos itens salvos';

  @override
  String get savedMessagesRemovedToast => 'Removida dos itens salvos';

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
  String get chatUnreadDividerNew => 'Novas';

  @override
  String get uiConfirm => 'Confirmar';

  @override
  String get uiUnderstood => 'Entendi';

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
    return 'Isso notificará $count membros com o cargo $roleName. Continuar?';
  }

  @override
  String get mentionConfirmButton => 'Mencionar';

  @override
  String get composerEmojiUnavailable => 'Você não pode usar este emoji aqui.';

  @override
  String get instanceUrlLabel => 'URL da instância';

  @override
  String get instanceUrlPlaceholder =>
      'Digite a URL da instância (ex: fluxer.com)';

  @override
  String get instanceUrlHelper =>
      'Use fluxer.com para a instância oficial ou a URL exata de uma instância auto-hospedada.';

  @override
  String get resetToDefaultInstance => 'Redefinir para Fluxer';

  @override
  String get instanceConnect => 'Conectar';

  @override
  String get instanceConnecting => 'Conectando…';

  @override
  String get instanceConnectFailed => 'Falha ao conectar à instância';

  @override
  String instanceConnectFailedDomain(String domain) {
    return 'Não foi possível conectar a $domain. Tente novamente.';
  }

  @override
  String get instanceInvalidDiscoveryResponse =>
      'Não foi possível ler a configuração desta instância. Verifique o endereço e tente novamente.';

  @override
  String instanceOutdatedForClient(String domain) {
    return 'Esta instância está desatualizada para este aplicativo. Peça a quem administra $domain para atualizar o Fluxer.';
  }

  @override
  String instanceRequiresNewerClient(String domain) {
    return '$domain usa uma versão do Fluxer mais recente que este aplicativo. Atualize o aplicativo e tente novamente.';
  }

  @override
  String get instanceCompatibilityTitle => 'Não é possível usar esta instância';

  @override
  String get instanceCompatibilityRetry => 'Tentar novamente';

  @override
  String get instanceCompatibilityUpdateApp => 'Atualizar aplicativo';

  @override
  String get instanceCompatibilityStatusPagePrompt =>
      'Confira a página de status para atualizações.';

  @override
  String get instanceCompatibilityStatusPageLink => 'página de status';

  @override
  String get recentInstances => 'Instâncias recentes';

  @override
  String removeRecentInstance(String domain) {
    return 'Remover $domain das instâncias recentes';
  }

  @override
  String get instanceSheetTitle => 'Conectar à instância';

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
      'Explorar comunidades';

  @override
  String get discoveryExplore => 'Explorar';

  @override
  String get discoveryExplorePublicCommunities =>
      'Explorar comunidades públicas';

  @override
  String get discoveryListingSubheading =>
      'Quer listar sua comunidade aqui? Candidate-se se você atender aos requisitos em Configurações da sua comunidade > Explorar.';

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
  String get discoveryApps => 'Aplicativos';

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
      'Talvez ela tenha saído de Explorar ou desativado novas entradas. Atualize a página para removê-la dos resultados.';

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
  String get scrollIndicatorNewMessages => 'Novas mensagens';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Recolher $folderName';
  }

  @override
  String get guildNavbarGuildSelected => 'selecionada';

  @override
  String get guildNavbarGuildUnread => 'não lida';

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
  String get authCheckStillWorking => 'Ainda verificando…';

  @override
  String get authVerificationFailed =>
      'Não foi possível concluir a verificação. Tente novamente.';

  @override
  String get chatLoadingMessages => 'Carregando mensagens';

  @override
  String get friendsMessageFriend => 'Enviar mensagem';

  @override
  String get friendsFriendActions => 'Ações do amigo';

  @override
  String get friendsAcceptRequest => 'Aceitar solicitação de amizade';

  @override
  String get friendsDeclineRequest => 'Recusar solicitação de amizade';

  @override
  String get friendsCancelRequest => 'Cancelar solicitação de amizade';

  @override
  String get friendsOpenInbox => 'Caixa de entrada';

  @override
  String get profileRemoveFriend => 'Remover amigo';

  @override
  String get profileUnblockUser => 'Desbloquear usuário';

  @override
  String get profileAcceptFriendRequest => 'Aceitar solicitação de amizade';

  @override
  String get profileCancelFriendRequest => 'Cancelar solicitação de amizade';

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
      'Mostrar ícone quando recolhida';

  @override
  String get guildFolderIconLabel => 'Ícone da pasta';

  @override
  String get guildFolderDelete => 'Excluir pasta';

  @override
  String get guildFolderIconFolder => 'Pasta';

  @override
  String get guildFolderIconStar => 'Estrela';

  @override
  String get guildFolderIconHeart => 'Coração';

  @override
  String get guildFolderIconBookmark => 'Marcador';

  @override
  String get guildFolderIconGameController => 'Controle de videogame';

  @override
  String get guildFolderIconShield => 'Escudo';

  @override
  String get guildFolderIconMusicNote => 'Nota musical';

  @override
  String get guildFolderMarkAsRead => 'Marcar pasta como lida';

  @override
  String get guildBulkMuteCommunities => 'Silenciar comunidades';

  @override
  String get guildBulkUnmuteCommunities => 'Ativar som das comunidades';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Configurações de notificação das comunidades';

  @override
  String get guildBulkCommunityPrivacySettings =>
      'Configurações de privacidade das comunidades';

  @override
  String get guildBulkAllowEveryoneAndHere => 'Permitir @everyone e @here';

  @override
  String get guildBulkAllowRoleMentions => 'Permitir menções de cargos';

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
  String get guildNavbarNewChannelHint => 'novo-canal';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Seleção do tipo de canal';

  @override
  String get guildNavbarPrivateChannel => 'Canal privado';

  @override
  String get guildNavbarPrivateChannelDescription =>
      'Somente os membros e cargos selecionados poderão ver este canal.';

  @override
  String get guildNavbarAddMembersOrRoles => 'Adicionar membros ou cargos';

  @override
  String get guildNavbarAddMembersOrRolesHint => 'Pesquisar membros ou cargos';

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
  String get guildMenuSettingsDiscovery => 'Explorar';

  @override
  String get guildMenuSettingsMembers => 'Membros';

  @override
  String get guildMenuSettingsInviteLinks => 'Links de convite';

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
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewNameTitle => 'Nome';

  @override
  String get guildSettingsOverviewNameHint => 'Minha comunidade incrível';

  @override
  String get guildSettingsCreateRole => 'Criar cargo';

  @override
  String get guildSettingsRolesListTitle => 'Cargos';

  @override
  String get guildSettingsRolesNewRole => 'Novo cargo';

  @override
  String get guildSettingsRolesDeleteRole => 'Excluir cargo';

  @override
  String get guildSettingsRolesBackToRoles => 'Voltar para cargos';

  @override
  String get guildSettingsBackToSettings => 'Voltar para configurações';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Editar \"$name\"';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Configure as opções e permissões do cargo';

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
      'Mostrar este cargo separadamente';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Lista os membros com este cargo em uma seção própria na lista de membros.';

  @override
  String get guildSettingsRolesAllowMentions => 'Permitir menções a este cargo';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'Membros com a permissão \"$permission\" sempre podem mencionar cargos, independentemente desta configuração.';
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
  String get guildSettingsRolesComfyLayout => 'Layout espaçoso';

  @override
  String get guildSettingsRolesSingleColumn => 'Uma coluna';

  @override
  String get guildSettingsRolesTwoColumns => 'Duas colunas';

  @override
  String get guildSettingsRolesNoPermissionsFound =>
      'Nenhuma permissão encontrada';

  @override
  String get guildSettingsRolesHoistOrder => 'Ordem de exibição';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Restaurar padrão';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Arraste os cargos para personalizar a ordem em que aparecem na lista de membros.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Nenhum cargo exibido separadamente. Ative \"Mostrar este cargo separadamente\" em um cargo para vê-lo aqui.';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Você precisa da permissão \"$permission\" para editar estas permissões';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'Você não pode editar um cargo igual ou acima do seu cargo mais alto';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'Você não pode conceder uma permissão que não tem';

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
      'Ordem de exibição restaurada para o padrão';

  @override
  String get guildSettingsRolesNameRequiredTitle =>
      'O nome do cargo é obrigatório';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Dê um nome ao cargo antes de salvar.';

  @override
  String get guildSettingsRolesCreateFailedTitle =>
      'Não foi possível criar o cargo';

  @override
  String get guildSettingsRolesUpdateFailedTitle =>
      'Não foi possível atualizar os cargos';

  @override
  String get guildSettingsRolesDeleteFailedTitle =>
      'Não foi possível excluir o cargo';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return 'Não foi possível excluir \"$name\". Tente novamente.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'Não foi possível restaurar a ordem de exibição';

  @override
  String get guildSettingsRolesTryAgainInAMoment =>
      'Tente novamente em instantes.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'Tem certeza de que deseja excluir o cargo $name? Os membros com este cargo deixarão de tê-lo.';
  }

  @override
  String get permissionCategoryCommunityWide => 'Toda a comunidade';

  @override
  String get permissionCategoryMessagesMedia => 'Mensagens e mídia';

  @override
  String get permissionCategoryModeration => 'Moderação';

  @override
  String get permissionCategoryChannelAccess => 'Acesso aos canais';

  @override
  String get permissionCategoryChannelManagement => 'Gerenciamento do canal';

  @override
  String get permissionCategoryAudioVideo => 'Áudio e vídeo';

  @override
  String get permissionAdministrator => 'Administrador';

  @override
  String get permissionAdministratorDescription =>
      'Concede todas as permissões e ignora as restrições dos canais. Altamente sensível.';

  @override
  String get permissionViewActivityLog => 'Ver registro de atividades';

  @override
  String get permissionViewActivityLogDescription =>
      'Ler o registro de atividades da comunidade com alterações e ações de moderação.';

  @override
  String get permissionManageCommunity => 'Gerenciar comunidade';

  @override
  String get permissionManageCommunityDescription =>
      'Editar configurações gerais como nome, descrição e ícone.';

  @override
  String get permissionManageRoles => 'Gerenciar cargos';

  @override
  String get permissionManageRolesDescription =>
      'Criar, editar ou excluir cargos abaixo do seu cargo mais alto. Também permite editar as permissões específicas dos canais.';

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
      'Editar as permissões específicas de cargos e membros neste canal.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Criar, editar ou excluir webhooks deste canal.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Ver a lista de membros deste canal.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Gerenciar links de convite deste canal.';

  @override
  String get permissionOverwriteDeny => 'Negar';

  @override
  String get permissionOverwriteInherit => 'Neutro (herdar)';

  @override
  String get permissionOverwriteAllow => 'Permitir';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Use estes botões para definir rapidamente todas as permissões.';

  @override
  String get permissionManageChannelsDescription =>
      'Criar, editar ou excluir canais e categorias.';

  @override
  String get permissionKickMembers => 'Expulsar membros';

  @override
  String get permissionBanMembers => 'Banir membros';

  @override
  String get permissionCreateInviteLinks => 'Criar links de convite';

  @override
  String get permissionChangeOwnNickname => 'Alterar o próprio apelido';

  @override
  String get permissionChangeOwnNicknameDescription =>
      'Atualizar o seu próprio apelido.';

  @override
  String get permissionManageNicknames => 'Gerenciar apelidos';

  @override
  String get permissionManageNicknamesDescription =>
      'Alterar os apelidos de outros membros.';

  @override
  String get permissionCreateEmojiStickers => 'Criar emojis e stickers';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Enviar novos emojis e stickers e gerenciar suas próprias criações.';

  @override
  String get permissionManageEmojiStickers => 'Gerenciar emojis e stickers';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Editar ou excluir emojis e stickers criados por outros membros.';

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
      'Enviar mensagens de texto para fala.';

  @override
  String get permissionManageMessages => 'Gerenciar mensagens';

  @override
  String get permissionManageMessagesDescription =>
      'Excluir mensagens de outros membros. Fixar mensagens é controlado separadamente.';

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
      'Mencionar todos ou qualquer cargo (mesmo que o cargo não esteja definido como mencionável).';

  @override
  String get permissionUseExternalEmoji => 'Usar emojis externos';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Usar emojis de outras comunidades.';

  @override
  String get permissionUseExternalStickers => 'Usar stickers externos';

  @override
  String get permissionAddReactions => 'Adicionar reações';

  @override
  String get permissionAddReactionsDescription =>
      'Adicionar novas reações às mensagens.';

  @override
  String get permissionBypassSlowmode => 'Ignorar modo lento';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Ignorar os limites de envio de mensagens de cada canal.';

  @override
  String get permissionTimeOutMembers => 'Silenciar membros temporariamente';

  @override
  String get permissionTimeOutMembersDescription =>
      'Impedir que membros enviem mensagens, reajam e entrem em canais de voz por um período.';

  @override
  String get permissionViewChannel => 'Ver canal';

  @override
  String get permissionViewChannelMembers => 'Ver membros do canal';

  @override
  String get permissionViewChannelMembersDescription =>
      'Ver a lista de membros dos canais desta comunidade.';

  @override
  String get permissionConnect => 'Conectar';

  @override
  String get permissionSpeak => 'Falar';

  @override
  String get permissionStreamVideo => 'Transmitir vídeo';

  @override
  String get permissionUseVoiceActivity => 'Usar detecção de voz';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Sem esta permissão, é obrigatório usar o pressionar para falar.';

  @override
  String get permissionPrioritySpeaker => 'Voz prioritária';

  @override
  String get permissionMuteMembers => 'Silenciar membros';

  @override
  String get permissionDeafenMembers => 'Deixar membros surdos';

  @override
  String get permissionMoveMembers => 'Mover membros';

  @override
  String get permissionMoveMembersDescription =>
      'Arrastar membros entre canais aos quais eles têm acesso.';

  @override
  String get permissionSetVoiceRegion => 'Definir região de voz';

  @override
  String get permissionManageThreads => 'Gerenciar tópicos';

  @override
  String get permissionManageThreadsDescription =>
      'Renomear, arquivar, trancar e excluir tópicos, definir o modo lento deles e ver tópicos privados.';

  @override
  String get permissionCreatePublicThreads => 'Criar tópicos públicos';

  @override
  String get permissionCreatePublicThreadsDescription =>
      'Iniciar tópicos visíveis para todos que podem ver o canal.';

  @override
  String get permissionCreatePrivateThreads => 'Criar tópicos privados';

  @override
  String get permissionCreatePrivateThreadsDescription =>
      'Iniciar tópicos apenas para convidados.';

  @override
  String get permissionSendMessagesInThreads => 'Enviar mensagens em tópicos';

  @override
  String get permissionSendMessagesInThreadsDescription =>
      'Enviar mensagens em tópicos e publicações de fórum.';

  @override
  String get threadErrorArchived => 'Este tópico está arquivado.';

  @override
  String get threadErrorLocked =>
      'Este tópico está trancado. Apenas moderadores podem publicar nele ou reabri-lo.';

  @override
  String get threadErrorAlreadyCreated =>
      'Já existe um tópico para esta mensagem.';

  @override
  String get threadErrorMaxActiveThreads =>
      'Esta comunidade atingiu o limite de tópicos ativos.';

  @override
  String get threadErrorMaxMembers =>
      'Este tópico atingiu o limite de membros.';

  @override
  String get threadErrorMaxPinnedPosts =>
      'Apenas uma publicação pode ser fixada neste fórum.';

  @override
  String get threadErrorMaxForumTags => 'Um fórum pode ter no máximo 20 tags.';

  @override
  String get threadErrorTagNamesUnique => 'Os nomes das tags devem ser únicos.';

  @override
  String get threadErrorNoTagsForEveryone =>
      'Adicione uma tag que todos possam usar antes de tornar as tags obrigatórias.';

  @override
  String get threadErrorTagRequired =>
      'Escolha pelo menos uma tag para esta publicação.';

  @override
  String get threadErrorUnknownTag =>
      'Uma das tags selecionadas não existe mais.';

  @override
  String get threadErrorInvalidNotificationSettings =>
      'Essas configurações de notificação não são válidas para um tópico.';

  @override
  String get threadErrorSearchIndexNotReady =>
      'As publicações ainda estão sendo indexadas. Tente novamente em instantes.';

  @override
  String get threadErrorInvalidChannelType =>
      'Esta ação não está disponível neste canal.';

  @override
  String get threadCreate => 'Criar tópico';

  @override
  String get threadName => 'Nome do tópico';

  @override
  String get threadNameRequired => 'Dê um nome ao tópico.';

  @override
  String get threadNewThreadPlaceholder => 'Novo tópico';

  @override
  String get threadPrivate => 'Tópico privado';

  @override
  String get threadPrivateDescription =>
      'Apenas as pessoas que você convidar e os moderadores podem ver este tópico.';

  @override
  String get threadStarterMessage => 'Mensagem';

  @override
  String get threadStarterMessagePlaceholder =>
      'Digite uma mensagem para iniciar a conversa!';

  @override
  String threadCreateCooldown(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'Você poderá iniciar outro tópico em $seconds segundos.',
      one: 'Você poderá iniciar outro tópico em 1 segundo.',
    );
    return '$_temp0';
  }

  @override
  String threadCreateFailed(String detail) {
    return 'Não foi possível iniciar o tópico: $detail';
  }

  @override
  String get threadBrowserTitle => 'Tópicos';

  @override
  String get threadBrowserActive => 'Ativos';

  @override
  String get threadBrowserArchived => 'Fechados';

  @override
  String get threadBrowserJoined => 'Participando';

  @override
  String get threadBrowserOtherActive => 'Outros tópicos ativos';

  @override
  String get threadBrowserPublic => 'Tópicos públicos';

  @override
  String get threadBrowserPrivate => 'Tópicos privados';

  @override
  String get threadBrowserEmpty =>
      'Não há tópicos. Mantenha o foco em uma conversa com um tópico, um canal de texto temporário.';

  @override
  String get threadBrowserArchivedEmpty => 'Não há tópicos fechados.';

  @override
  String get threadBrowserLoadMore => 'Carregar mais';

  @override
  String get threadBrowserSearch => 'Pesquisar tópicos';

  @override
  String get threadBrowserSearchEmpty => 'Nenhum tópico encontrado';

  @override
  String get threadBrowserSearchEmptyHint =>
      'Tente outro nome ou confira a outra aba.';

  @override
  String get threadBrowserSearchFailed =>
      'Não foi possível pesquisar os tópicos. Tente novamente mais tarde.';

  @override
  String get threadBrowserSearchIndexing =>
      'A pesquisa está sendo preparada para esta comunidade. Tentando novamente em breve...';

  @override
  String threadMessageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mensagens',
      one: '1 mensagem',
    );
    return '$_temp0';
  }

  @override
  String get threadFailedToMentionSomeRoles =>
      'Alguns cargos mencionados não foram adicionados a este tópico.';

  @override
  String get threadMembers => 'Membros do tópico';

  @override
  String threadMembersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count membros',
      one: '1 membro',
    );
    return '$_temp0';
  }

  @override
  String get threadMembersEmpty => 'Ninguém entrou neste tópico ainda.';

  @override
  String threadRemoveMember(String name) {
    return 'Remover $name do tópico';
  }

  @override
  String get threadJoin => 'Entrar no tópico';

  @override
  String get threadLeave => 'Sair do tópico';

  @override
  String get threadJoinNotice =>
      'Entre neste tópico para acompanhá-lo na sua lista de canais e receber notificações.';

  @override
  String get threadArchivedNotice =>
      'Este tópico está fechado. Enviar uma mensagem vai abri-lo novamente.';

  @override
  String get threadLockedNotice =>
      'Este tópico está trancado. Apenas moderadores podem enviar mensagens.';

  @override
  String get threadArchive => 'Fechar tópico';

  @override
  String get threadUnarchive => 'Abrir tópico novamente';

  @override
  String get threadLock => 'Trancar tópico';

  @override
  String get threadUnlock => 'Destrancar tópico';

  @override
  String get threadDelete => 'Excluir tópico';

  @override
  String threadDeleteConfirm(String threadName) {
    return 'Tem certeza de que deseja excluir $threadName? Isso não pode ser desfeito.';
  }

  @override
  String get threadDeleted => 'Tópico excluído';

  @override
  String get threadMarkAsRead => 'Marcar como lido';

  @override
  String get threadMute => 'Silenciar tópico';

  @override
  String get threadUnmute => 'Ativar som do tópico';

  @override
  String get threadMuted => 'Tópico silenciado';

  @override
  String get threadUnmuted => 'Som do tópico ativado';

  @override
  String get threadNotificationSettings => 'Configurações de notificação';

  @override
  String get threadNotificationParentDefault => 'Usar o padrão do canal';

  @override
  String get threadCopyLink => 'Copiar link';

  @override
  String get threadCopyId => 'Copiar ID do tópico';

  @override
  String get threadMoreOptions => 'Mais opções';

  @override
  String get threadSettings => 'Configurações do tópico';

  @override
  String get threadSettingsSaved => 'Configurações do tópico salvas';

  @override
  String get threadAutoArchive => 'Ocultar após inatividade';

  @override
  String get threadAutoArchiveDescription =>
      'O tópico deixa de aparecer na lista de canais após este período de inatividade.';

  @override
  String get threadDefaultAutoArchive => 'Ocultar após inatividade por padrão';

  @override
  String get threadDefaultAutoArchiveDescription =>
      'Novos tópicos deixam de aparecer na lista de canais após este período de inatividade.';

  @override
  String get threadDefaultSlowmode => 'Modo lento padrão dos tópicos';

  @override
  String get threadAutoArchiveOneHour => '1 hora';

  @override
  String get threadAutoArchiveOneDay => '24 horas';

  @override
  String get threadAutoArchiveThreeDays => '3 dias';

  @override
  String get threadAutoArchiveOneWeek => '1 semana';

  @override
  String get threadInvitable => 'Permitir que qualquer pessoa convide';

  @override
  String get threadInvitableDescription =>
      'Os membros deste tópico privado podem adicionar outras pessoas.';

  @override
  String threadStartedBy(String name) {
    return 'Iniciado por $name';
  }

  @override
  String get threadStarterDeleted => 'A mensagem original foi excluída.';

  @override
  String systemThreadCreated(
    String username,
    String threadLink,
    String allThreadsLink,
  ) {
    return '$username iniciou um tópico: $threadLink. Veja $allThreadsLink.';
  }

  @override
  String get systemThreadCreatedAllThreadsLink => 'todos os tópicos';

  @override
  String get systemThreadCreatedThreadFallback => 'um tópico';

  @override
  String systemPreviewThreadCreated(String username) {
    return '$username iniciou um tópico.';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Ainda não há emojis personalizados.';

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
      'As comunidades listadas em Explorar precisam de, no mínimo, verificação de e-mail. Você não pode escolher \"Nenhum\" enquanto sua comunidade estiver listada em Explorar.';

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
  String get auditLogActionThreadCreate => 'Tópico criado';

  @override
  String get auditLogActionThreadUpdate => 'Tópico atualizado';

  @override
  String get auditLogActionThreadDelete => 'Tópico excluído';

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
  String auditLogSummaryThreadCreate(String actor, String target) {
    return '$actor iniciou o tópico $target.';
  }

  @override
  String auditLogSummaryThreadUpdate(String actor, String target) {
    return '$actor atualizou o tópico $target.';
  }

  @override
  String auditLogSummaryThreadDelete(String actor, String target) {
    return '$actor excluiu o tópico $target.';
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
  String get auditLogChangePausedInvites => 'Pausou os convites.';

  @override
  String get auditLogChangeResumedInvites => 'Retomou os convites.';

  @override
  String get auditLogChangeTurnedOnDetachedBanner =>
      'Ativou o banner separado.';

  @override
  String get auditLogChangeTurnedOffDetachedBanner =>
      'Desativou o banner separado.';

  @override
  String get auditLogChangeAllowedFlexibleChannelNames =>
      'Permitiu nomes flexíveis para canais de texto.';

  @override
  String get auditLogChangeDisallowedFlexibleChannelNames =>
      'Deixou de permitir nomes flexíveis para canais de texto.';

  @override
  String get auditLogChangeHidOwnerCrown =>
      'Ocultou a coroa do dono da comunidade.';

  @override
  String get auditLogChangeShowedOwnerCrown =>
      'Deixou de ocultar a coroa do dono da comunidade.';

  @override
  String get auditLogChangeAllowedEmojiCloning =>
      'Permitiu que outros clonem os emojis desta comunidade.';

  @override
  String get auditLogChangeStoppedEmojiCloning =>
      'Deixou de permitir que outros clonem os emojis desta comunidade.';

  @override
  String get auditLogChangeAllowedStickerCloning =>
      'Permitiu que outros clonem os stickers desta comunidade.';

  @override
  String get auditLogChangeStoppedStickerCloning =>
      'Deixou de permitir que outros clonem os stickers desta comunidade.';

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
      other: 'Excluídas $count mensagens.',
      one: 'Excluída $count mensagem.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Membros removidos $count.',
      one: 'Membro removido $count.',
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
  String get guildSettingsWebhooksDescription =>
      'Gerencie webhooks que postam mensagens em canais.';

  @override
  String get guildSettingsWebhooksEmpty => 'Nenhum webhook configurado.';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'Esta comunidade ainda não tem nenhum webhook. Vá para $channelSettingsPath para criar um.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'Você precisa da permissão \"$permission\" para ver e editar webhooks desta comunidade.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle =>
      'Falha ao carregar webhooks';

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
  String get guildSettingsCopiedUrl =>
      'URL copiada para a área de transferência';

  @override
  String get guildSettingsDiscoveryDescription =>
      'Liste sua comunidade em Explorar para que outras pessoas possam encontrá-la e participar.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Membros insuficientes';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count membros',
      one: '$count membro',
    );
    return 'Sua comunidade precisa de pelo menos $_temp0 para poder ser listada em Explorar.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Status:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'Pendente';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Aprovada';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Recusada';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Removida';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Motivo: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'Sua comunidade está listada em Explorar. Você pode atualizar os detalhes da listagem abaixo ou retirá-la para removê-la.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Sua inscrição está aguardando análise. Você ainda pode atualizar os detalhes da listagem ou retirar a inscrição.';

  @override
  String get guildSettingsDiscoveryCategory => 'Categoria';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Escolha a categoria que melhor descreve sua comunidade. Você pode alterá-la a qualquer momento.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Idioma principal';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'O idioma que a maior parte da sua comunidade fala. Ele é usado para filtrar os resultados em Explorar.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Descrição';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Descreva do que se trata sua comunidade';

  @override
  String get guildSettingsDiscoveryDescriptionRequired =>
      'A descrição é obrigatória.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'A descrição deve ter pelo menos $minLength caracteres.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'A descrição deve ter no máximo $maxLength caracteres.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Tags';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Até $maxTags tags ajudam as pessoas a encontrar sua comunidade. Elas aparecem quando as pessoas pesquisam em Explorar.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'jogos, arte, música';

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
    return 'As tags devem ter de 2 a $maxLength caracteres e conter apenas letras e números.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'Você só pode adicionar até $maxTags tags.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Enviar Inscrição';

  @override
  String get guildSettingsDiscoverySave => 'Salvar';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Retirar';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Inscrição em Explorar enviada';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Listagem em Explorar atualizada';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Inscrição em Explorar retirada';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Não foi possível retirar a inscrição';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Tente novamente em instantes.';

  @override
  String get guildSettingsMembersSearchHint => 'Pesquisar membros';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count membros';
  }

  @override
  String get guildMembersRecentTitle => 'Membros recentes';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Mostrando $displayedCount de $totalCount membros no total';
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
  String get guildMembersColumnJoinMethod => 'Forma de entrada';

  @override
  String get guildMembersColumnRoles => 'Cargos';

  @override
  String get guildMembersFilterMemberSince => 'Filtrar por membro desde';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Filtrar por data de criação da conta';

  @override
  String get guildMembersFilterJoinMethod => 'Filtrar por forma de entrada';

  @override
  String get guildMembersFilterRoles => 'Filtrar por cargos';

  @override
  String get guildMembersFilterAll => 'Todos';

  @override
  String get guildMembersFilterPast1Hour => 'Última hora';

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
  String get guildMembersFilterCustomRange => 'Período personalizado...';

  @override
  String get guildMembersDateRangeTitle => 'Período personalizado';

  @override
  String get guildMembersDateAfter => 'Data inicial';

  @override
  String get guildMembersDateBefore => 'Data final';

  @override
  String get guildMembersClearAll => 'Limpar tudo';

  @override
  String get guildMembersRowsPerPage => 'Linhas por página';

  @override
  String get guildMembersEmptySearch => 'Ninguém corresponde a essa pesquisa.';

  @override
  String get guildMembersLoadError =>
      'Algo deu errado ao carregar os membros. Tente novamente mais tarde.';

  @override
  String get guildMembersIndexing => 'Indexando membros…';

  @override
  String get guildMembersJoinSourceCreator => 'Criador da comunidade';

  @override
  String get guildMembersJoinSourceInvite => 'Convite';

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
  String get guildMembersJoinSourceDiscovery => 'Explorar';

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
      other: 'há $count minutos',
      one: 'há 1 minuto',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'há $count horas',
      one: 'há 1 hora',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Membros';

  @override
  String get guildSettingsInvitesTitle => 'Convites';

  @override
  String get guildSettingsInvitesDescription =>
      'Visualize e revogue links de convite ativos.';

  @override
  String get guildSettingsInvitesEmpty => 'Nenhum convite ativo.';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Esta comunidade ainda não tem nenhum link de convite. Vá até um canal e crie um convite para convidar pessoas.';

  @override
  String get guildSettingsInvitesLoadFailedTitle =>
      'Falha ao carregar os convites';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Ocorreu um erro ao carregar os convites. Tente novamente.';

  @override
  String get guildSettingsInvitesTryAgain => 'Tentar novamente';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Mostrar a data de criação em vez da data de expiração';

  @override
  String get guildSettingsInvitesPauseInvites => 'Pausar convites';

  @override
  String get guildSettingsInvitesEnableInvites => 'Ativar convites';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Pausar convites desta comunidade';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Ativar convites desta comunidade';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Pausar os convites? Novos usuários não poderão entrar por links de convite até você reativá-los. Os membros atuais não serão afetados.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Ativar os convites? Os usuários poderão voltar a entrar nesta comunidade por links de convite.';

  @override
  String get guildSettingsInvitesPause => 'Pausar';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Os convites estão pausados nesta comunidade.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Os convites estão pausados porque o $productName detectou um possível raid. Novos usuários não podem entrar no momento.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Convidado por:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Canal:';

  @override
  String get guildSettingsInvitesLabelCode => 'Código:';

  @override
  String get guildSettingsInvitesLabelUses => 'Usos:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Criado em:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Expira em:';

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
      'O link ainda pode funcionar. Tente novamente em instantes.';

  @override
  String get guildSettingsBansDescription =>
      'Visualize e gerencie usuários banidos.';

  @override
  String get guildSettingsBansSearchHint => 'Pesquisar banimentos';

  @override
  String get guildSettingsBansEmpty => 'Nenhum usuário banido.';

  @override
  String get guildSettingsBanExpiresLabel => 'Expira';

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
  String get guildSettingsCommunitySettings => 'Configurações da Comunidade';

  @override
  String get guildSettingsDeleteCommunity => 'Excluir comunidade';

  @override
  String get guildSettingsDeleteCommunityConfirm =>
      'Tem certeza de que deseja excluir esta comunidade? Esta ação não pode ser desfeita. Todos os canais, mensagens e configurações serão excluídos permanentemente.';

  @override
  String get guildSettingsCommunityDeleted => 'Comunidade excluída';

  @override
  String get guildSettingsDeleteCommunityFailed =>
      'Não foi possível excluir esta comunidade';

  @override
  String get guildSettingsCategoryExpressions => 'Expressões';

  @override
  String get guildSettingsCategoryCommunity => 'Comunidade';

  @override
  String get guildSettingsCategoryIntegrations => 'Integrações';

  @override
  String get guildSettingsCategoryPeople => 'Pessoas';

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
  String get guildSettingsModerationContentFilterTitle =>
      'Filtragem de conteúdo';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Verifique automaticamente as mensagens em busca de conteúdo explícito em canais não marcados como adultos.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'As comunidades listadas em Explorar precisam analisar as mensagens de todos os membros. Você não pode alterar esta configuração enquanto sua comunidade estiver listada em Explorar.';

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
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Ative o 2FA em sua conta para alterar esta configuração';

  @override
  String get guildSettingsEmojiSearchHint => 'Pesquisar emojis';

  @override
  String get guildSettingsEmojiUploadTitle => 'Carregar Emoji';

  @override
  String get guildSettingsEmojiSlotsTitle => 'Espaços de emoji';

  @override
  String get guildSettingsEmojiDropZone =>
      'Arraste e solte arquivos de emoji aqui';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Falha ao carregar os emojis. Tente novamente mais tarde.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'Nenhum emoji encontrado para a sua pesquisa.';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Você atingiu o número máximo de emojis. Exclua alguns emojis existentes para liberar espaço.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Os nomes de emoji precisam ter pelo menos 2 caracteres e podem usar letras, números e sublinhados. Os emojis devem ter menos de $maxSize. Imagens estáticas são redimensionadas para 128x128 pixels e comprimidas automaticamente. Emojis animados e SVGs já devem estar dentro do limite.';
  }

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Alguns emojis não puderam ser adicionados';

  @override
  String get guildSettingsEmojiRenameTitle => 'Renomear emoji';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2 a 32 caracteres: letras, números e sublinhados.';

  @override
  String get guildSettingsEmojiColumnName => 'Nome';

  @override
  String get guildSettingsEmojiColumnUploader => 'Enviado por';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Excluir emoji';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'Excluir :$name:? Não é possível desfazer.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Remover este emoji do armazenamento e da CDN';

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
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Não foi possível excluir este emoji';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'Permitir que outros clonem seus emojis';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'Quando ativado, membros de outras comunidades podem usar o atalho \"Clonar\" do app, com um clique, nos seus emojis personalizados. Isso não os impede de salvar a imagem e enviá-la eles mesmos.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Permitir que outros clonem seus stickers';

  @override
  String get guildSettingsCloneStickerDescription =>
      'Quando ativado, membros de outras comunidades podem usar o atalho \"Clonar\" do app, com um clique, nos seus stickers personalizados. Isso não os impede de salvar a imagem e enviá-la eles mesmos.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Somente membros com a permissão \"$permission\" podem alterar isso.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'Não foi possível atualizar a clonagem de emojis';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Não foi possível atualizar a clonagem de stickers';

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
  String get guildSettingsStickerSlotsTitle => 'Espaços de sticker';

  @override
  String get guildSettingsStickerUploadTitle => 'Enviar sticker';

  @override
  String get guildSettingsStickerDropZone =>
      'Arraste e solte um arquivo de sticker aqui (um por vez)';

  @override
  String get guildSettingsStickerDensity => 'Densidade dos stickers';

  @override
  String get guildSettingsStickerDensityCozy => 'Confortável';

  @override
  String get guildSettingsStickerDensityCompact => 'Compacto';

  @override
  String get guildSettingsStickersLoadFailedTitle =>
      'Falha ao carregar os stickers';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Ocorreu um erro ao carregar os stickers. Tente novamente.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Nenhum sticker encontrado para a sua pesquisa.';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Você atingiu o número máximo de stickers. Exclua alguns stickers existentes para liberar espaço.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Os stickers são salvos em 320x320 pixels e devem ter menos de $maxSize. Imagens estáticas são redimensionadas e comprimidas automaticamente. Stickers animados e SVGs já devem estar dentro do limite.';
  }

  @override
  String get guildSettingsStickerAddTitle => 'Adicionar sticker';

  @override
  String get guildSettingsStickerEditTitle => 'Editar sticker';

  @override
  String get guildSettingsStickerNameLabel => 'Nome';

  @override
  String get guildSettingsStickerNameHint => 'Meu sticker incrível';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Descrição';

  @override
  String get guildSettingsStickerDescriptionHint => 'Descreva o sticker';

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
      'O nome deve ter no máximo 30 caracteres';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'A descrição deve ter no máximo 500 caracteres';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'Não foi possível criar este sticker';

  @override
  String get guildSettingsStickerDeleteTitle => 'Excluir sticker';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'Excluir \"$name\"? Não é possível desfazer.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Remover este sticker do armazenamento e da CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Não foi possível excluir este sticker';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Crie webhooks nas configurações do canal. Edite-os aqui.';
  }

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
  String get createDm => 'Criar DM';

  @override
  String get createGroupDm => 'Criar DM em grupo';

  @override
  String get createDmNewMessage => 'Nova mensagem';

  @override
  String get createDmSelectFriends => 'Selecionar amigos';

  @override
  String get createDmChooseFriendsSubtitle =>
      'Escolha amigos para enviar mensagem.';

  @override
  String get createDmSearchFriends => 'Pesquisar amigos';

  @override
  String get createDmNoFriendsFound => 'Nenhum amigo encontrado';

  @override
  String get createDmNoFriendsYet => 'Você ainda não tem amigos';

  @override
  String get createDmClaimToStartDms =>
      'Reivindique sua conta para iniciar DMs.';

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
      'As seguintes pessoas não podem ser adicionadas a esta DM em grupo:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Criar a DM em grupo com o(s) $count destinatário(s) restante(s) e ignorar os outros?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Não há destinatários restantes para criar uma DM em grupo.';

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
  String get keybindSectionChat => 'Chat';

  @override
  String get keybindSectionVoiceAndVideo => 'Voz e vídeo';

  @override
  String get keybindSectionMisc => 'Diversos';

  @override
  String get keybindActionShowShortcutsList =>
      'Mostrar lista de atalhos de teclado';

  @override
  String get keybindActionCopyText => 'Copiar texto';

  @override
  String get keybindActionMarkUnread => 'Marcar como não lida';

  @override
  String get keybindActionFocusTextarea => 'Focar a área de texto';

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
      'Ir para a comunidade anterior ou DMs';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Ir para a próxima comunidade ou DMs';

  @override
  String get keybindActionGoToDms => 'Ir para as mensagens diretas';

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
  String get keybindActionToggleQuickSwitcher =>
      'Abrir ou fechar o alternador rápido';

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
  String get keybindActionStartGroupDm => 'Iniciar uma DM em grupo';

  @override
  String get keybindActionTogglePinnedMessages =>
      'Abrir ou fechar mensagens fixadas';

  @override
  String get keybindActionToggleInbox => 'Abrir ou fechar a caixa de entrada';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Marcar o primeiro canal da caixa de entrada como lido';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Marcar todos os canais da caixa de entrada como lidos';

  @override
  String get keybindActionToggleMemberList =>
      'Mostrar ou ocultar a lista de membros ou o chat de voz';

  @override
  String get keybindActionToggleEmojiPicker =>
      'Abrir ou fechar o seletor de emojis';

  @override
  String get keybindActionToggleGifPicker =>
      'Abrir ou fechar o seletor de GIFs';

  @override
  String get keybindActionToggleStickerPicker =>
      'Abrir ou fechar o seletor de stickers';

  @override
  String get keybindActionScrollChatUp => 'Rolar o chat para cima';

  @override
  String get keybindActionScrollChatDown => 'Rolar o chat para baixo';

  @override
  String get keybindActionJumpOldestUnread =>
      'Ir para a mensagem não lida mais antiga';

  @override
  String get keybindActionFocusComposer => 'Focar a área de texto';

  @override
  String get keybindActionUploadFile => 'Enviar um arquivo';

  @override
  String get keybindActionCopyChannelLink => 'Copiar link do canal';

  @override
  String get keybindActionToggleSavedMedia => 'Abrir ou fechar a mídia salva';

  @override
  String get keybindActionSendVoiceMessage => 'Enviar mensagem de voz';

  @override
  String get keybindActionAnswerCall => 'Atender a chamada recebida';

  @override
  String get keybindActionDeclineCall => 'Recusar a chamada recebida';

  @override
  String get keybindActionStartDmCall =>
      'Iniciar uma chamada em uma DM ou grupo';

  @override
  String get keybindActionToggleSoundboard => 'Abrir ou fechar a mesa de sons';

  @override
  String get keybindActionToggleCompactCallView =>
      'Expandir ou recolher a visualização compacta da chamada';

  @override
  String get keybindActionPushToTalkPriority =>
      'Pressionar para falar (prioridade)';

  @override
  String get keybindActionVoiceActivityPriority =>
      'Prioridade da atividade de voz';

  @override
  String get keybindActionOpenHelp => 'Abrir a ajuda';

  @override
  String get keybindActionSearchMessages => 'Pesquisar mensagens';

  @override
  String get keybindActionOpenContextMenu => 'Abrir o menu de contexto';

  @override
  String get keybindActionOpenSettings => 'Abrir suas configurações';

  @override
  String get keybindActionOpenThemeStudio =>
      'Abrir o Theme Studio em uma janela separada';

  @override
  String get keybindActionZoomIn => 'Aumentar zoom';

  @override
  String get keybindActionZoomOut => 'Diminuir zoom';

  @override
  String get keybindActionZoomReset => 'Redefinir zoom';

  @override
  String get clipboardPasteFailed =>
      'Não foi possível colar. A área de transferência estava vazia ou bloqueada para este app.';

  @override
  String get homeQuickActionDms => 'DMs';

  @override
  String get assistantNeedsLogin => 'Abra o Fluxer e entre primeiro.';

  @override
  String get assistantNotInVoice => 'Você não está em uma chamada.';

  @override
  String get assistantNotFound => 'O Fluxer não encontrou isso.';

  @override
  String get assistantDmsDisabled =>
      'As mensagens diretas estão desativadas nesta instância.';

  @override
  String get assistantFailed => 'O Fluxer não conseguiu concluir isso.';

  @override
  String get assistantOkMuted => 'Microfone silenciado.';

  @override
  String get assistantOkUnmuted => 'Microfone reativado.';

  @override
  String get assistantOkLeftVoice => 'Você saiu da voz.';

  @override
  String get assistantOkJoinedVoice => 'Entrando na voz.';

  @override
  String get assistantOkStartedCall => 'Iniciando a chamada.';

  @override
  String assistantOkStatusSet(String status) {
    return 'Status definido como $status.';
  }

  @override
  String get assistantOkOpened => 'Abrindo o Fluxer.';

  @override
  String get assistantOkMessageSent => 'Mensagem enviada.';

  @override
  String get assistantOkCustomStatusSet => 'Status personalizado atualizado.';

  @override
  String get assistantOkCustomStatusCleared => 'Status personalizado removido.';

  @override
  String get guildNavbarAnnouncementChannel => 'Anúncios';

  @override
  String get guildNavbarAnnouncementChannelDescription =>
      'Publique novidades que outras comunidades podem seguir';

  @override
  String get channelDetailsAnnouncementChannel => 'Canal de anúncios';

  @override
  String get channelSettingsAnnouncementChannel => 'Canal de anúncios';

  @override
  String get channelSettingsAnnouncementChannelDescription =>
      'Permite que outras comunidades sigam este canal e recebam cópias do que você publicar.';

  @override
  String get channelSettingsStopAnnouncementTitle =>
      'Deixar de ser um canal de anúncios?';

  @override
  String channelSettingsStopAnnouncementBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count canais seguem este canal. Convertê-lo em canal de texto remove esses seguimentos.',
      one:
          '1 canal segue este canal. Convertê-lo em canal de texto remove esse seguimento.',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsStopAnnouncementUnknown =>
      'Converter este canal em canal de texto remove todos os canais que o seguem.';

  @override
  String get channelSettingsConvertChannel => 'Converter';

  @override
  String get channelSettingsConvertFailed =>
      'Não foi possível converter este canal';

  @override
  String get channelSettingsChannelHasFollowers =>
      'Este canal ainda tem seguidores. Remova esses seguimentos antes de convertê-lo.';

  @override
  String get channelMenuFollow => 'Seguir canal';

  @override
  String get channelFollowTitle => 'Seguir este canal';

  @override
  String get channelFollowBody =>
      'Escolha para onde as mensagens publicadas devem ir. Você pode deixar de seguir a qualquer momento em Configurações da comunidade → Webhooks.';

  @override
  String get channelFollowCommunity => 'Comunidade';

  @override
  String get channelFollowChannel => 'Canal';

  @override
  String get channelFollowAgeWarning =>
      'Este é um canal com restrição de idade. As atualizações só podem ir para canais com restrição de idade.';

  @override
  String get channelFollowContentWarning =>
      'Este canal tem um aviso de conteúdo. As atualizações só podem ir para canais com aviso de conteúdo ou restrição de idade.';

  @override
  String get channelFollowHiddenHint =>
      'Comunidades e canais onde você não pode gerenciar webhooks ficam ocultos.';

  @override
  String get channelFollowEmpty =>
      'Você não pode gerenciar webhooks em nenhuma comunidade. Peça a um administrador para seguir este canal.';

  @override
  String get channelFollowSubmit => 'Seguir';

  @override
  String get channelFollowFailed => 'Não foi possível seguir este canal.';

  @override
  String get channelFollowSuccessTitle => 'As atualizações estão a caminho!';

  @override
  String channelFollowSuccessBody(String sourceName, String targetName) {
    return 'As mensagens publicadas em $sourceName vão aparecer em #$targetName.';
  }

  @override
  String get channelFollowSuccessDismiss => 'Entendi!';

  @override
  String get channelFollowBarrier =>
      'Siga para receber estes anúncios em um canal à sua escolha.';

  @override
  String get channelHeaderFollow => 'Seguir canal';

  @override
  String get chatMessagePublish => 'Publicar';

  @override
  String get chatMessagePublished => 'Publicada';

  @override
  String get chatMessagePublishConfirmTitle => 'Publicar mensagem?';

  @override
  String get chatMessagePublishConfirmBody =>
      'Isso envia uma cópia para todos os canais que seguem este.';

  @override
  String get chatMessagePublishedToast => 'Mensagem publicada';

  @override
  String get chatMessageAlreadyPublished => 'Esta mensagem já foi publicada.';

  @override
  String get chatMessagePublishFailedTitle =>
      'Não foi possível publicar esta mensagem';

  @override
  String get chatMessagePublishFailedBody =>
      'Algo deu errado. Tente novamente em instantes.';

  @override
  String get chatMessagePublishLimitTitle => 'Mais devagar';

  @override
  String chatMessagePublishLimitBody(String duration) {
    return 'Você poderá publicar novamente em $duration.';
  }

  @override
  String get chatMessagePublishLimitUnknown =>
      'Você está publicando rápido demais. Tente novamente em instantes.';

  @override
  String get chatMessageDeletePublished =>
      'Isso também remove as cópias enviadas aos canais que seguem este.';

  @override
  String get chatMessageEditPublishedTitle => 'Editar mensagem publicada?';

  @override
  String get chatMessageEditPublishedBody =>
      'Isso atualiza as cópias enviadas aos canais que seguem este.';

  @override
  String get chatMessageEditPublishedSave => 'Salvar';

  @override
  String get chatMessageEditLimitTitle => 'Mais devagar';

  @override
  String chatMessageEditLimitBody(String duration) {
    return 'Você poderá editar esta mensagem publicada novamente em $duration.';
  }

  @override
  String get chatMessageEditLimitUnknown =>
      'Você está editando esta mensagem publicada rápido demais. Tente novamente em instantes.';

  @override
  String get chatMessageOriginalDeleted => '[Mensagem original excluída]';

  @override
  String get userTagCommunity => 'Comunidade';

  @override
  String systemFollowAdd(String username, String source) {
    return '$username seguiu $source neste canal. As mensagens publicadas lá vão aparecer aqui.';
  }

  @override
  String systemPreviewFollowAdd(String username, String source) {
    return '$username seguiu $source neste canal.';
  }

  @override
  String get publishNudgeNotSent => 'Ainda não enviada aos seguidores.';

  @override
  String get publishNudgeHideForever => 'Não mostrar novamente';

  @override
  String get publishNudgeDismiss => 'Dispensar';

  @override
  String get channelSettingsFollowedChannels => 'Canais seguidos';

  @override
  String get channelSettingsFollowedChannelsDescription =>
      'Canais de anúncios que este canal segue. Deixe de seguir para parar de receber cópias.';

  @override
  String get guildSettingsFollowedChannelsDescription =>
      'Canais de anúncios seguidos por canais desta comunidade.';

  @override
  String channelSettingsFollowedFrom(String guildName, String channelName) {
    return 'De $guildName #$channelName';
  }

  @override
  String get channelSettingsFollowedPaused =>
      'As atualizações estão pausadas porque o canal de origem não está mais disponível.';

  @override
  String channelSettingsUnfollowTitle(String name) {
    return 'Deixar de seguir $name?';
  }

  @override
  String get channelSettingsUnfollowBody =>
      'Este canal vai parar de receber cópias desse canal de anúncios.';

  @override
  String get channelSettingsUnfollow => 'Deixar de seguir';

  @override
  String get crosspostCommunityTitle => 'Comunidade';

  @override
  String get crosspostGoToCommunity => 'Ir para a comunidade';

  @override
  String get crosspostJoinCommunity => 'Entrar na comunidade';

  @override
  String get crosspostSourceFailed =>
      'Não foi possível carregar esta comunidade. Tente novamente em instantes.';

  @override
  String crosspostMembers(int count) {
    return '$count membros';
  }

  @override
  String crosspostOnline(int count) {
    return '$count online';
  }

  @override
  String durationMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutos',
      one: '1 minuto',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count segundos',
      one: '1 segundo',
    );
    return '$_temp0';
  }

  @override
  String get channelUnsupportedTitle => 'Tipo de canal não suportado';

  @override
  String get channelUnsupportedBody =>
      'Esta versão do app não suporta este tipo de canal.';

  @override
  String get channelDetailsUnsupportedChannel => 'Canal não suportado';

  @override
  String get forumChannelTypeForum => 'Fórum';

  @override
  String get forumChannelTypeForumDescription =>
      'Publicações organizadas por tópico e tags';

  @override
  String get forumChannelTypeMedia => 'Mídia';

  @override
  String get forumChannelTypeMediaDescription =>
      'Publicações centradas em imagens e vídeos';

  @override
  String get forumNewPost => 'Nova publicação';

  @override
  String get forumNewMediaPost => 'Nova publicação de mídia';

  @override
  String get forumSearchPosts => 'Pesquisar publicações';

  @override
  String get forumViewOptions => 'Ordenar e exibir';

  @override
  String get forumSearchIndexing =>
      'A pesquisa ainda está sendo preparada para esta comunidade. As publicações aparecem aqui assim que estiver pronta.';

  @override
  String get forumNoPosts => 'Ainda não há publicações';

  @override
  String get forumNoPostsHint => 'Seja o primeiro a iniciar uma conversa aqui.';

  @override
  String get forumNoSearchResults =>
      'Nenhuma publicação corresponde à sua pesquisa';

  @override
  String get forumNoSearchResultsHint =>
      'Tente outras palavras ou limpe o filtro de tags.';

  @override
  String get forumCreateFirstPost => 'Criar a primeira publicação';

  @override
  String get forumOlderPosts => 'Publicações mais antigas';

  @override
  String get forumPostsLoadFailed =>
      'Não foi possível carregar as publicações.';

  @override
  String get forumRetry => 'Tentar novamente';

  @override
  String get forumPostPinned => 'Fixada';

  @override
  String get forumPostLocked => 'Trancada';

  @override
  String get forumPostArchived => 'Arquivada';

  @override
  String get forumPostNewBadge => 'Nova';

  @override
  String get forumPostStarterDeleted => 'A mensagem original foi excluída.';

  @override
  String forumPostSnippet(String author, String content) {
    return '$author: $content';
  }

  @override
  String forumPostNewMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count novas mensagens',
      one: '$count nova mensagem',
    );
    return '$_temp0';
  }

  @override
  String get forumPostReact => 'Adicionar a reação padrão';

  @override
  String get forumOpenPost => 'Abrir publicação';

  @override
  String get forumEditTags => 'Editar tags';

  @override
  String get forumSaveTags => 'Salvar tags';

  @override
  String forumTagsLimitHint(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Escolha até $count tags.',
      one: 'Escolha até 1 tag.',
    );
    return '$_temp0';
  }

  @override
  String get forumPinPost => 'Fixar publicação';

  @override
  String get forumUnpinPost => 'Desafixar publicação';

  @override
  String get forumMarkPostRead => 'Marcar como lida';

  @override
  String get forumCopyPostLink => 'Copiar link';

  @override
  String get forumPostGuidelines => 'Diretrizes de publicação';

  @override
  String get forumGuidelinesPlaceholder =>
      'Diga às pessoas o que publicar aqui e como publicar.';

  @override
  String get forumPostTitle => 'Título';

  @override
  String get forumPostMessage => 'Mensagem';

  @override
  String get forumPostMessagePlaceholder =>
      'Escreva a primeira mensagem da sua publicação';

  @override
  String get forumPostMediaPlaceholder => 'Adicionar uma legenda';

  @override
  String get forumPostTags => 'Tags';

  @override
  String get forumPostTagsRequired => 'Tags (obrigatório)';

  @override
  String get forumPostAddMedia => 'Adicionar mídia';

  @override
  String get forumPostAddFile => 'Adicionar arquivo';

  @override
  String get forumPostRemoveAttachment => 'Remover anexo';

  @override
  String get forumPostSubmit => 'Publicar';

  @override
  String get forumPostTitleRequired => 'Dê um título à sua publicação.';

  @override
  String get forumPostMediaRequired =>
      'Adicione pelo menos uma imagem ou vídeo para publicar aqui.';

  @override
  String get forumPostContentRequired =>
      'Escreva uma mensagem ou adicione um arquivo.';

  @override
  String get forumSortLatestActivity => 'Atividade recente';

  @override
  String get forumSortCreationTime => 'Data de publicação';

  @override
  String get forumLayoutList => 'Visualização em lista';

  @override
  String get forumLayoutGallery => 'Visualização em galeria';

  @override
  String get forumNewPostsUnread => 'Mostrar novas publicações como não lidas';

  @override
  String get forumNewPostsUnreadDescription =>
      'Marcar este canal como não lido quando alguém criar uma publicação.';

  @override
  String get forumPostSlowmode => 'Modo lento de publicações';

  @override
  String forumPostSlowmodeDescription(String bypassSlowmodePermissionLabel) {
    return 'Intervalo entre a criação de publicações. \"$bypassSlowmodePermissionLabel\" pode ignorá-lo.';
  }

  @override
  String get forumMessageSlowmode => 'Modo lento de mensagens nas publicações';

  @override
  String get forumMessageSlowmodeDescription =>
      'Modo lento aplicado às mensagens em novas publicações.';

  @override
  String get forumDefaultAutoArchive => 'Ocultar após inatividade';

  @override
  String get forumDefaultAutoArchiveDescription =>
      'Novas publicações são arquivadas após esse tempo sem atividade.';

  @override
  String get forumDefaultReaction => 'Reação padrão';

  @override
  String get forumSetDefaultReaction => 'Escolher um emoji';

  @override
  String get forumChangeDefaultReaction => 'Alterar';

  @override
  String get forumRemoveDefaultReaction => 'Remover';

  @override
  String get forumDefaultSortOrder => 'Ordem de classificação padrão';

  @override
  String get forumDefaultLayout => 'Layout padrão';

  @override
  String get forumTagMatchSetting => 'Filtro de tags';

  @override
  String get forumTagMatchSome => 'Corresponder a qualquer tag selecionada';

  @override
  String get forumTagMatchAll => 'Corresponder a todas as tags selecionadas';

  @override
  String get forumRequireTag => 'Exigir tags';

  @override
  String get forumRequireTagDescription =>
      'As pessoas devem escolher pelo menos uma tag ao criar uma publicação.';

  @override
  String get forumHideMediaDownloads => 'Ocultar opções de download de mídia';

  @override
  String get forumHideMediaDownloadsDescription =>
      'Oculta as opções de baixar, abrir no navegador e copiar link para imagens e vídeos nas publicações.';

  @override
  String forumTagsTitle(int count, int max) {
    return 'Tags ($count/$max)';
  }

  @override
  String get forumTagsDescription =>
      'As tags ajudam as pessoas a encontrar e filtrar publicações. Só moderadores podem aplicar tags moderadas.';

  @override
  String get forumCreateTag => 'Criar tag';

  @override
  String get forumEditTag => 'Editar tag';

  @override
  String get forumSaveTag => 'Salvar tag';

  @override
  String get forumDeleteTag => 'Excluir tag';

  @override
  String get forumTagName => 'Nome da tag';

  @override
  String get forumTagEmoji => 'Emoji';

  @override
  String get forumTagRemoveEmoji => 'Remover emoji';

  @override
  String get forumTagModerated => 'Só moderadores podem aplicar';

  @override
  String get forumTagModeratedDescription =>
      'Só membros que podem gerenciar tópicos podem aplicar ou remover esta tag.';

  @override
  String get forumTagModeratedBadge => 'Moderada';

  @override
  String forumPostCooldown(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'Você poderá publicar novamente em $seconds segundos.',
      one: 'Você poderá publicar novamente em 1 segundo.',
    );
    return '$_temp0';
  }

  @override
  String get voiceP2pStartTitle => 'Iniciar no modo P2P?';

  @override
  String voiceP2pStartDescription(int maxParticipants) {
    return 'O áudio e o vídeo vão diretamente entre os participantes, com menor latência. Os outros participantes podem ver seu endereço IP. Até $maxParticipants pessoas podem participar. Quem não conseguir se conectar diretamente não poderá participar até que alguém mude para uma chamada padrão.';
  }

  @override
  String get voiceP2pStartConfirm => 'Iniciar no modo P2P';

  @override
  String get voiceP2pStartStandard => 'Iniciar chamada padrão';

  @override
  String get voiceP2pJoinTitle => 'Entrar em uma chamada P2P?';

  @override
  String voiceP2pJoinDescription(int maxParticipants) {
    return 'Esta chamada conecta os participantes diretamente. Os outros participantes podem ver seu endereço IP. Até $maxParticipants pessoas podem participar. Se você não conseguir se conectar diretamente, não poderá participar até que alguém mude para uma chamada padrão.';
  }

  @override
  String voiceP2pPinnedJoinDescription(int maxParticipants) {
    return 'Este canal só permite chamadas P2P. Os participantes se conectam diretamente e podem ver seu endereço IP. Até $maxParticipants pessoas podem participar. Se você não conseguir se conectar diretamente, não poderá participar.';
  }

  @override
  String get voiceP2pJoinConfirm => 'Entrar';

  @override
  String get voiceP2pAlwaysAgreeLabel =>
      'Não perguntar novamente, sempre aceitar';

  @override
  String get voiceP2pAlwaysAgreeSettingLabel =>
      'Sempre aceitar entrar em chamadas P2P';

  @override
  String get voiceP2pAlwaysAgreeSettingDescription =>
      'Entrar em chamadas P2P sem perguntar. Os outros participantes podem ver seu endereço IP.';

  @override
  String get voiceP2pIndicatorLabel => 'P2P';

  @override
  String get voiceP2pIndicatorDescription =>
      'Conexão direta. A mídia é criptografada entre os participantes.';

  @override
  String get voiceP2pSwitchToStandard => 'Mudar para chamada padrão';

  @override
  String get voiceP2pSwitchToStandardDescription =>
      'Todos na chamada passam para uma chamada padrão pelo servidor.';

  @override
  String get voiceP2pPeerFailedDescription =>
      'Não foi possível estabelecer uma conexão direta. Saia da chamada ou mude todos para uma chamada padrão.';

  @override
  String get voiceP2pUnavailableError =>
      'As chamadas P2P estão indisponíveis no momento.';

  @override
  String get voiceP2pConsentRequiredError =>
      'Esta chamada é P2P e precisa da sua concordância para você entrar.';

  @override
  String get voiceChannelFullError => 'Esta chamada está cheia.';

  @override
  String get voiceP2pScreenShareUnavailable =>
      'O compartilhamento de tela deste dispositivo não está disponível em chamadas P2P.';

  @override
  String get channelMenuJoinP2p => 'Iniciar chamada P2P';

  @override
  String get channelSettingsRtcP2pLabel => 'Somente chamadas P2P';

  @override
  String channelSettingsRtcP2pDescription(int maxParticipants) {
    return 'Os participantes se conectam diretamente e podem ver os endereços IP uns dos outros. Todos precisam concordar antes de entrar. Até $maxParticipants pessoas podem participar.';
  }

  @override
  String voiceP2pPeerFailedTitle(String name) {
    return 'Não é possível conectar diretamente a $name';
  }

  @override
  String get favoritesRenameCategory => 'Renomear categoria';

  @override
  String get friendAcceptFailedTitle =>
      'Não foi possível aceitar a solicitação de amizade';

  @override
  String get friendAcceptUnavailable =>
      'Essa solicitação de amizade não está mais disponível. Atualize e tente novamente.';

  @override
  String get friendAcceptClaimToAccept =>
      'Conclua seu cadastro para aceitar solicitações de amizade.';

  @override
  String get friendAcceptFailedMessage =>
      'Não foi possível aceitar a solicitação de amizade. Tente novamente.';

  @override
  String get friendCancelFailedTitle =>
      'Não foi possível cancelar a solicitação de amizade';

  @override
  String get friendIgnoreFailedTitle =>
      'Não foi possível ignorar a solicitação de amizade';

  @override
  String get friendIgnoreFailedMessage =>
      'Não foi possível ignorar a solicitação de amizade. Tente novamente.';

  @override
  String get friendRemoveFailedTitle => 'Não foi possível remover o amigo';

  @override
  String get friendRemoveFailedMessage =>
      'Não foi possível remover este amigo. Tente novamente.';

  @override
  String get userBlockFailedTitle => 'Não foi possível bloquear o usuário';

  @override
  String get userBlockSystemAccount => 'Esta conta não pode ser bloqueada.';

  @override
  String get userBlockFailedMessage =>
      'Não foi possível bloquear este usuário. Tente novamente.';

  @override
  String get userUnblockFailedTitle => 'Não foi possível desbloquear o usuário';

  @override
  String get userUnblockFailedMessage =>
      'Não foi possível desbloquear este usuário. Tente novamente.';

  @override
  String friendCancelRequestConfirmDescription(String userName) {
    return 'Cancelar sua solicitação de amizade para $userName?';
  }

  @override
  String get errorSomethingWentWrongTitle => 'Algo deu errado';

  @override
  String get errorUnexpectedTryAgain =>
      'Ocorreu um erro inesperado. Tente novamente.';

  @override
  String get errorMessagingPausedTitle => 'O envio de mensagens está pausado';

  @override
  String get errorMessagingPausedMessage =>
      'O envio de mensagens está pausado na sua conta. Verifique seu e-mail para concluir uma etapa rápida e continuar.';

  @override
  String get errorFeatureDisabledTitle => 'Recurso temporariamente desativado';

  @override
  String get errorFeatureDisabledMessage =>
      'Este recurso está pausado. Tente novamente mais tarde.';

  @override
  String get dmErrorStartConversationTitle =>
      'Não foi possível iniciar esta conversa';

  @override
  String get dmErrorCannotMessageMessage =>
      'Talvez essa pessoa não esteja aceitando mensagens suas, ou vocês não estão mais em uma comunidade em comum.';

  @override
  String get dmErrorUnknownUserMessage =>
      'Este usuário não existe mais. Atualize e tente novamente.';

  @override
  String get dmErrorClaimMessage =>
      'Você precisa reivindicar sua conta antes de iniciar uma mensagem direta.';

  @override
  String get dmErrorVerifyEmailMessage =>
      'Você precisa verificar seu endereço de e-mail antes de iniciar uma mensagem direta.';

  @override
  String get dmErrorTooManyRecipientsTitle => 'Este grupo tem pessoas demais';

  @override
  String get dmErrorTooManyRecipientsMessage =>
      'Você adicionou mais pessoas do que uma DM em grupo permite. Remova algumas e tente novamente.';

  @override
  String get dmErrorMaxGroupDmsTitle => 'Você atingiu o limite de DMs em grupo';

  @override
  String get dmErrorMaxGroupDmsMessage =>
      'Você ou alguém que você está adicionando já tem o número máximo de DMs em grupo abertas. Saia de uma e tente novamente.';

  @override
  String get groupDmAddFailedTitle => 'Não foi possível adicionar ao grupo';

  @override
  String get groupDmInviteFailedTitle =>
      'Não foi possível criar o link de convite';

  @override
  String get dmCloseFailedTitle => 'Não foi possível fechar a DM';

  @override
  String get groupDmLeaveFailedTitle => 'Não foi possível sair do grupo';

  @override
  String get inviteJoinFailedTitle => 'Não foi possível entrar na comunidade';

  @override
  String get inviteErrorPausedMessage =>
      'Os administradores pausaram os convites — você não pode entrar agora.';

  @override
  String get inviteErrorAtCapacityTitle => 'Comunidade lotada';

  @override
  String get inviteErrorAtCapacityMessage =>
      'Esta comunidade atingiu o limite máximo de membros e não está aceitando novos membros no momento.';

  @override
  String get inviteErrorPresenceTitle => 'Conexão com o gateway necessária';

  @override
  String get inviteErrorPresenceMessage =>
      'Convites temporários precisam de uma conexão ativa. Verifique a sua e tente novamente.';

  @override
  String get inviteErrorBannedTitle => 'Você está banido';

  @override
  String get inviteErrorBannedMessage =>
      'Você está banido desta comunidade e não pode entrar.';

  @override
  String get inviteErrorIpBannedTitle => 'Seu IP está banido';

  @override
  String get inviteErrorIpBannedMessage =>
      'Seu endereço IP está banido desta comunidade e você não pode entrar.';

  @override
  String get inviteErrorClaimTitle => 'Verificação de conta necessária';

  @override
  String get inviteErrorClaimMessage =>
      'Adicione um e-mail e uma senha à sua conta primeiro.';

  @override
  String get leaveCommunityFailedTitle => 'Falha ao sair da comunidade';

  @override
  String get leaveCommunityFailedMessage =>
      'Não foi possível sair agora. Tente novamente em instantes.';

  @override
  String get chatSendFailedTitle => 'Sua mensagem não foi enviada';

  @override
  String get chatSendFailedMessage => 'Tente enviar sua mensagem novamente.';

  @override
  String get chatSendTooQuickTitle =>
      'Você está enviando mensagens rápido demais';

  @override
  String get chatRateLimitedMessage =>
      'Vá com calma — espere um momento antes de tentar novamente.';

  @override
  String get chatMatureContentTitle => 'Conteúdo maduro não permitido';

  @override
  String get chatMatureContentGuildMessage =>
      'Este canal não está marcado para conteúdo maduro. Conteúdo maduro só pode ser enviado em canais marcados para conteúdo maduro. Peça a um moderador para atualizar este canal, se for o caso.';

  @override
  String chatMatureContentDmMessage(String settingsPath) {
    return 'Você ou a pessoa com quem você está conversando optou por bloquear mídia sensível em mensagens diretas. Cada um de vocês pode alterar isso em $settingsPath.';
  }

  @override
  String get chatMatureContentGroupDmMessage =>
      'Este grupo não está marcado para conteúdo maduro. O dono do grupo pode ativar Conteúdo maduro nas configurações do grupo se todos no grupo tiverem 18 anos ou mais.';

  @override
  String get chatFileTooLargeTitle => 'Arquivo grande demais';

  @override
  String chatFileTooLargeMessage(String maxSize) {
    return 'Um ou mais arquivos que você está tentando enviar excedem o limite máximo de $maxSize por arquivo.';
  }

  @override
  String get chatHeavyTitle => 'Opa, isso está pesado';

  @override
  String get chatReactionsHeavyMessage =>
      'Esta mensagem está pesada demais. Algumas reações precisam ser removidas antes que você possa adicionar mais.';

  @override
  String get chatReactionTimedOut =>
      'Você não pode adicionar novas reações enquanto estiver silenciado.';

  @override
  String chatTooManyAttachmentsMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arquivos',
      one: '$count arquivo',
    );
    return 'Você só pode enviar $_temp0 por vez. Tente novamente com menos arquivos.';
  }

  @override
  String get chatEditTooQuickTitle =>
      'Você está editando mensagens rápido demais';

  @override
  String get chatEditFailedMessage => 'Tente editar sua mensagem novamente.';

  @override
  String get chatDeleteTooQuickTitle =>
      'Você está excluindo mensagens rápido demais';

  @override
  String get chatDeleteTooQuickMessage =>
      'Espere um momento antes de excluir mais mensagens.';

  @override
  String get chatDeleteFailedTitle => 'Não foi possível excluir essa mensagem';

  @override
  String get chatDeleteFailedMessage =>
      'Tente excluir essa mensagem novamente.';

  @override
  String get chatAttachmentDeleteFailedTitle =>
      'Não foi possível excluir o anexo';

  @override
  String get chatAttachmentDeleteFailedMessage =>
      'Tente excluir esse anexo novamente.';

  @override
  String get chatAltTextFailedTitle =>
      'Não foi possível atualizar o texto alternativo';

  @override
  String get chatAltTextUnknownMessage => 'Esta mensagem não existe mais.';

  @override
  String get chatAltTextNoPermission => 'Você não pode editar esta mensagem.';

  @override
  String get chatAltTextUnavailable =>
      'A edição está temporariamente indisponível. Tente novamente mais tarde.';

  @override
  String get chatAltTextFailedMessage =>
      'Não foi possível atualizar o texto alternativo. Tente novamente.';

  @override
  String get chatPinFailedTitle => 'Falha ao fixar a mensagem';

  @override
  String get chatUnpinFailedTitle => 'Falha ao desafixar a mensagem';

  @override
  String get chatPinFailedMessage =>
      'Algo deu errado. Tente novamente mais tarde.';

  @override
  String get chatPinBlockedMessage =>
      'Você não pode interagir com este usuário no momento.';

  @override
  String get bookmarkLimitTitle => 'Limite de itens salvos atingido';

  @override
  String bookmarkLimitMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mensagens salvas',
      one: '$count mensagem salva',
    );
    return 'Você está com $_temp0. Remova uma para adicionar outra.';
  }

  @override
  String get savedMediaLimitTitle => 'Limite de mídia salva atingido';

  @override
  String savedMediaLimitMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count itens de mídia salvos',
      one: '$count item de mídia salvo',
    );
    return 'Você atingiu o limite de $_temp0. Remova um para adicionar outro.';
  }

  @override
  String get errorContentBlockedTitle => 'Conteúdo bloqueado';

  @override
  String get errorContentBlockedMessage =>
      'Não foi possível concluir sua ação porque ela foi sinalizada pelos nossos sistemas de segurança. Se você acredita que isso é um erro, entre em contato com o suporte.';

  @override
  String get errorContentBlockedSelfHostedMessage =>
      'Não foi possível concluir sua ação porque ela foi sinalizada pelos nossos sistemas de segurança. Se você acredita que isso é um erro, entre em contato com os administradores desta instância.';

  @override
  String get channelDeletedToast => 'Canal excluído';

  @override
  String get categoryDeletedToast => 'Categoria excluída';

  @override
  String get channelDeleteNoPermissionTitle => 'Você não pode excluir isto';

  @override
  String get channelDeleteNoPermissionChannel =>
      'Você não tem permissão para excluir este canal.';

  @override
  String get channelDeleteNoPermissionCategory =>
      'Você não tem permissão para excluir esta categoria.';

  @override
  String get channelDeleteAlreadyDeletedTitle => 'Já excluído';

  @override
  String get channelDeleteAlreadyDeletedChannel =>
      'Este canal não existe mais. Ele pode já ter sido excluído.';

  @override
  String get channelDeleteAlreadyDeletedCategory =>
      'Esta categoria não existe mais. Ela pode já ter sido excluída.';

  @override
  String get channelDeleteFailedChannelTitle =>
      'Não foi possível excluir este canal';

  @override
  String get channelDeleteFailedCategoryTitle =>
      'Não foi possível excluir esta categoria';

  @override
  String get channelPermissionsUpdateFailedTitle =>
      'Não foi possível atualizar as permissões do canal';

  @override
  String get channelSettingsSaveFailedTitle =>
      'Não foi possível salvar as configurações do canal';

  @override
  String get emojiSlotsFullTitle => 'Nenhum espaço para emoji disponível';

  @override
  String get stickerSlotsFullTitle => 'Nenhum espaço para sticker disponível';

  @override
  String get emojiSomeFailedMessage =>
      'Revise estes arquivos e tente novamente com imagens menores ou mais simples.';

  @override
  String get emojiNameInvalidCharacters =>
      'Nomes de emoji só podem usar letras, números e sublinhados.';

  @override
  String get emojiErrorGoneTitle => 'Este emoji não existe mais';

  @override
  String get emojiRenameGoneMessage =>
      'Ele pode ter sido excluído. O nome voltou ao que era antes.';

  @override
  String get emojiRenameNoPermissionTitle =>
      'Você não pode renomear este emoji';

  @override
  String get emojiRenameNoPermissionMessage =>
      'Você não tem permissão para renomear este emoji. O nome voltou ao que era antes.';

  @override
  String get emojiRenameRateLimitedMessage =>
      'Espere um momento e tente renomear novamente.';

  @override
  String get emojiRenameFailedMessage =>
      'O nome voltou ao que era antes. Tente novamente em instantes.';

  @override
  String get emojiDeleteGoneMessage => 'Parece que ele já foi excluído.';

  @override
  String get emojiDeleteNoPermissionTitle => 'Você não pode excluir este emoji';

  @override
  String get emojiDeleteNoPermissionMessage =>
      'Você não tem permissão para excluir este emoji.';

  @override
  String get emojiDeleteRateLimitedMessage =>
      'Espere um momento e tente excluir novamente.';

  @override
  String get stickerTooLargeTitle => 'O sticker é grande demais';

  @override
  String stickerTooLargeMessage(String maxSize) {
    return 'O serviço de upload rejeitou este sticker por ser maior que $maxSize. Tente um arquivo menor, uma imagem mais simples ou uma animação mais curta.';
  }

  @override
  String get stickerCreateFailedMessage =>
      'Algo deu errado ao preparar este sticker. Tente outro arquivo ou tente novamente em instantes.';

  @override
  String get stickerUpdateFailedTitle =>
      'Não foi possível atualizar este sticker';

  @override
  String get moderationTimeoutFailed =>
      'Falha ao silenciar o membro. Tente novamente.';

  @override
  String get moderationRemoveTimeoutFailed =>
      'Falha ao remover o silenciamento. Tente novamente.';

  @override
  String get moderationKickFailed =>
      'Falha ao expulsar o membro. Tente novamente.';

  @override
  String get moderationBanFailed => 'Falha ao banir o membro. Tente novamente.';

  @override
  String get transferOwnershipFailedTitle =>
      'Falha ao transferir a propriedade';

  @override
  String transferOwnershipFailedMessage(String username) {
    return 'Não foi possível transferir a propriedade para $username no momento.';
  }

  @override
  String get revokeBanFailedTitle => 'Não foi possível revogar o banimento';

  @override
  String get voiceModerationNoPermissionTitle => 'Você não pode fazer isso';

  @override
  String get voiceModerationNoPermissionMessage =>
      'Você não tem permissão para fazer isso com este membro.';

  @override
  String get voiceModerationLeftTitle => 'O membro saiu da chamada';

  @override
  String get voiceModerationLeftMessage =>
      'Este membro não está mais conectado ao canal de voz.';

  @override
  String get voiceModerationUnknownMemberTitle => 'Membro não encontrado';

  @override
  String get voiceModerationUnknownMemberMessage =>
      'Este membro não está mais na comunidade. Atualize e tente novamente.';

  @override
  String get voiceJoinTimedOut =>
      'Você não pode entrar enquanto estiver silenciado.';

  @override
  String get voiceJoinClaimAccount =>
      'Reivindique sua conta para entrar neste canal de voz.';

  @override
  String get voiceJoinClaimAccountDirectCall =>
      'Reivindique sua conta para iniciar ou entrar em chamadas individuais.';

  @override
  String get voiceJoinUserLimit =>
      'Este canal de voz atingiu o limite de usuários. Tente novamente mais tarde ou entre em outro canal.';

  @override
  String get voiceJoinConnectionLimit =>
      'Você atingiu o limite de conexões deste canal de voz.';

  @override
  String get voiceJoinChannelUnavailable =>
      'Este canal de voz não está mais disponível.';

  @override
  String get avatarUploadFailedTitle => 'Não foi possível enviar o avatar';

  @override
  String get bannerUploadFailedTitle => 'Não foi possível enviar o banner';

  @override
  String get animatedImageUseStatic =>
      'Envie uma imagem estática em vez disso.';

  @override
  String get passkeyDeleteFailedTitle => 'Não foi possível excluir a passkey';

  @override
  String get premiumPaymentsUnavailableTitle => 'Pagamentos indisponíveis';

  @override
  String get premiumPaymentsUnavailableMessage =>
      'Os pagamentos estão temporariamente indisponíveis. Tente novamente em instantes.';

  @override
  String get premiumNoSubscriptionTitle => 'Nenhuma assinatura ativa';

  @override
  String get premiumNoSubscriptionMessage =>
      'Não encontramos uma assinatura ativa nesta conta. Atualize e tente novamente.';

  @override
  String get premiumAlreadyCancelingTitle => 'Cancelamento já agendado';

  @override
  String get premiumAlreadyCancelingMessage =>
      'Sua assinatura já está programada para ser cancelada no fim do seu período de cobrança.';

  @override
  String get premiumNotCancelingTitle =>
      'A assinatura não está programada para cancelamento';

  @override
  String get premiumNotCancelingMessage =>
      'Sua assinatura não está programada para ser cancelada, então não há nada para reativar.';

  @override
  String get premiumCancelFailedTitle =>
      'Não foi possível cancelar sua assinatura';

  @override
  String get premiumCancelFailedMessage =>
      'Algo deu errado ao cancelar sua assinatura. Tente novamente em instantes.';

  @override
  String get premiumReactivateFailedTitle =>
      'Não foi possível reativar sua assinatura';

  @override
  String get premiumReactivateFailedMessage =>
      'Algo deu errado ao reativar sua assinatura. Tente novamente em instantes.';

  @override
  String get premiumRefundConfirmTitle => 'Reembolsar sua compra mais recente?';

  @override
  String get premiumRefundConfirmBody =>
      'Isso reembolsa sua fatura mais recente e cancela qualquer assinatura associada. Você não poderá solicitar outro reembolso por conta própria durante 30 dias.';

  @override
  String get premiumRefundConfirm => 'Reembolsar compra';

  @override
  String get premiumRefundIssuedToast =>
      'Reembolso emitido. Pode levar alguns dias úteis para aparecer.';

  @override
  String get premiumRefundOutsideWindowTitle => 'Fora do prazo de reembolso';

  @override
  String get premiumRefundOutsideWindowMessage =>
      'Sua compra mais recente não está mais dentro do prazo de reembolso. Entre em contato com o suporte para questões de cobrança.';

  @override
  String get premiumRefundCooldownTitle =>
      'Você pediu um reembolso recentemente';

  @override
  String get premiumRefundCooldownMessage =>
      'Você já usou um reembolso por conta própria recentemente. Você poderá pedir outro reembolso quando o período de espera terminar.';

  @override
  String get premiumRefundNothingTitle => 'Nada para reembolsar';

  @override
  String get premiumRefundNothingMessage =>
      'Não encontramos uma compra recente para reembolsar nesta conta.';

  @override
  String get premiumRefundFailedTitle =>
      'Não foi possível reembolsar esta compra';

  @override
  String get premiumRefundFailedMessage =>
      'Algo deu errado ao emitir seu reembolso. Entre em contato com o suporte se isso continuar acontecendo.';

  @override
  String get premiumVerifyEmailTitle => 'Verifique seu e-mail primeiro';

  @override
  String premiumVerifyEmailBody(String productName) {
    return 'Você precisa verificar seu e-mail antes de comprar $productName.';
  }

  @override
  String get premiumCheckoutBlockedTitle => 'Checkout indisponível';

  @override
  String premiumCheckoutBlockedBody(String supportEmail) {
    return 'O checkout está bloqueado para esta conta. Entre em contato com $supportEmail se precisar de ajuda.';
  }

  @override
  String get premiumCheckoutBlockedBodySelfHosted =>
      'O checkout está bloqueado para esta conta.';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class FluxerLocalizationsPtBr extends FluxerLocalizationsPt {
  FluxerLocalizationsPtBr() : super('pt_BR');

  @override
  String get reconnectingTitle => 'Deu ruim!';

  @override
  String get chatJumpToPresent => 'Ir para o final';

  @override
  String get chatViewingOlderMessages => 'Você está vendo mensagens antigas';

  @override
  String get chatNewMessagesBarJumpToFirstUnread =>
      'Ir para a primeira mensagem não lida';

  @override
  String get chatNewMessagesBarMarkAsRead => 'Marcar como lida';

  @override
  String get chatNewMessagesBarMarkRead => 'Marcar como lida';

  @override
  String chatNewMessagesBarNewMessagesSinceEstimated(
    int unreadCount,
    String compactTime,
  ) {
    final intl.NumberFormat unreadCountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String unreadCountString = unreadCountNumberFormat.format(
      unreadCount,
    );

    return '$unreadCountString+ novas mensagens desde $compactTime';
  }

  @override
  String chatNewMessagesBarNewMessagesSince(
    int unreadCount,
    String compactTime,
  ) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount novas mensagens',
      one: '$unreadCount nova mensagem',
      zero: '$unreadCount novas mensagens',
    );
    return '$_temp0 desde $compactTime';
  }

  @override
  String chatNewMessagesBarNewSinceEstimated(
    int unreadCount,
    String shortTime,
  ) {
    final intl.NumberFormat unreadCountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String unreadCountString = unreadCountNumberFormat.format(
      unreadCount,
    );

    return '$unreadCountString+ novas desde $shortTime';
  }

  @override
  String chatNewMessagesBarNewSince(int unreadCount, String shortTime) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount novas',
      many: '$unreadCount novas',
      one: '$unreadCount nova',
    );
    return '$_temp0 desde $shortTime';
  }

  @override
  String get reconnectingBody =>
      'Algo deu errado com a instância.\nDeve ser corrigido em um segundo!';

  @override
  String get gatewayReconnectingToast => 'Reconectando…';

  @override
  String get gatewayReconnectTryAgain => 'Tentar novamente';

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
  String get welcomeBack => 'Boas-vindas de volta';

  @override
  String get email => 'E-mail';

  @override
  String get emailInvalid => 'Por favor, insira um endereço de e-mail válido.';

  @override
  String get password => 'Senha';

  @override
  String get forgotPassword => 'Esqueceu a senha?';

  @override
  String get logIn => 'Entrar';

  @override
  String get logInWithPasskey => 'Entrar com uma chave de acesso';

  @override
  String continueWithSso(String provider) {
    return 'Continuar com $provider';
  }

  @override
  String get organizationSsoProvider =>
      'Entrar com o provedor de logon único da sua organização.';

  @override
  String get failedToStartSso => 'Falha ao iniciar o SSO';

  @override
  String get ssoCancelled => 'O login SSO foi cancelado';

  @override
  String preferSso(String provider) {
    return 'Prefere usar SSO? Continue com $provider.';
  }

  @override
  String get needAccountPrompt => 'Precisa de uma conta? ';

  @override
  String get register => 'Cadastrar';

  @override
  String get orDivider => 'OU';

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
  String get create => 'Criar';

  @override
  String get mfaTitle => 'Autenticação de dois fatores';

  @override
  String get mfaChooseMethod => 'Escolha um método de verificação';

  @override
  String get mfaMethodTotp => 'Aplicativo autenticador';

  @override
  String get mfaMethodWebauthn => 'Chave de segurança / chave de acesso';

  @override
  String get mfaTotpDescription =>
      'Digite o código de 6 dígitos do seu aplicativo autenticador ou um dos seus códigos de backup.';

  @override
  String get mfaCodeLabel => 'Código';

  @override
  String get mfaTryAnotherMethod => 'Tentar outro método';

  @override
  String get mfaUseSecurityKey =>
      'Tentar uma chave de segurança ou chave de acesso';

  @override
  String get accountSelectorTitle => 'Escolha uma conta';

  @override
  String get accountSelectorDescription =>
      'Selecione uma conta para continuar ou adicione uma diferente.';

  @override
  String get accountAdd => 'Adicionar uma conta';

  @override
  String get accountRemoveDescription =>
      'Isso vai remover a sessão salva para esta conta.';

  @override
  String accountSignOutTitle(String identifier) {
    return 'Sair de $identifier?';
  }

  @override
  String get accountExpired => 'Expirado';

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
  String get profileTabMenuSwitchAccounts => 'Trocar de conta';

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
  String get statusUntilIChangeIt => 'Até eu mudar';

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
      'Você não receberá notificações no computador';

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
  String get customStatusChooseEmoji => 'Escolha um emoji';

  @override
  String get customStatusClearAfter => 'Limpar depois de';

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
  String get forgotPasswordTitle => 'Esqueceu a senha?';

  @override
  String get forgotPasswordDescription =>
      'Digite seu e-mail e enviaremos um link para redefinir sua senha.';

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
  String get recoverAccountTitle => 'Recupere sua conta';

  @override
  String get recoverAccountDescription =>
      'Digite seu nome de usuário e a chave de recuperação do seu kit, depois escolha uma nova senha.';

  @override
  String get recoverAccountNoKit =>
      'Sem kit de recuperação? Peça a um administrador desta instância um link para redefinir sua senha.';

  @override
  String get recoveryKitTitle => 'Seu kit de recuperação';

  @override
  String get recoveryKitCreatedDescription =>
      'Se você esquecer sua senha, este kit é a única forma de voltar para sua conta. Guarde-o em um local seguro, como um gerenciador de senhas ou uma cópia impressa.';

  @override
  String get recoveryKitReplacedDescription =>
      'Seu kit de recuperação antigo não funciona mais. Guarde este novo em um lugar seguro.';

  @override
  String get recoveryKitRecoveredDescription =>
      'Sua senha foi redefinida. Seu kit de recuperação antigo não funciona mais. Guarde este novo em um lugar seguro.';

  @override
  String get recoveryKitWarning =>
      'Qualquer pessoa com esta chave pode redefinir sua senha. Nunca a compartilhe.';

  @override
  String get recoveryKitKeyLabel => 'Chave de recuperação';

  @override
  String recoveryKitDocumentTitle(String productName) {
    return 'Kit de recuperação do $productName';
  }

  @override
  String get recoveryKitDocumentIntro =>
      'Guarde esta página em um local seguro. Se você esquecer sua senha, poderá usá-la para acessar sua conta novamente. Qualquer pessoa com esta chave de recuperação pode redefinir sua senha, portanto, nunca a compartilhe.';

  @override
  String get recoveryKitInstanceLabel => 'Instância';

  @override
  String get recoveryKitCreatedAtLabel => 'Criado';

  @override
  String get recoveryKitQrCaption =>
      'Escaneie para abrir a página de recuperação com seus dados preenchidos.';

  @override
  String get recoveryKitStepsTitle => 'Como recuperar sua conta';

  @override
  String recoveryKitStepOpen(String recoverUrl) {
    return 'Acesse $recoverUrl ou escaneie o QR code.';
  }

  @override
  String get recoveryKitStepEnter =>
      'Digite seu nome de usuário e esta chave de recuperação.';

  @override
  String get recoveryKitStepPassword =>
      'Escolha uma nova senha. Você receberá um novo kit de recuperação e este deixará de funcionar.';

  @override
  String get recoveryKitBackupCodesTitle => 'Códigos de backup de dois fatores';

  @override
  String get recoveryKitBackupCodesNote =>
      'Cada código funciona uma vez no lugar do seu app autenticador.';

  @override
  String get recoveryKitBackupCodesFailed =>
      'Não foi possível carregar seus códigos de backup.';

  @override
  String get recoveryKitIncludeBackupCodes =>
      'Incluir meus códigos de backup da autenticação em dois fatores na imagem salva';

  @override
  String get recoveryKitCopy => 'Copiar';

  @override
  String get recoveryKitCopied => 'Chave de recuperação copiada';

  @override
  String get recoveryKitSaveImage => 'Salvar imagem';

  @override
  String get recoveryKitSaved => 'Kit de recuperação salvo';

  @override
  String get recoveryKitSavedToPhotos => 'Kit de recuperação salvo em Fotos';

  @override
  String get recoveryKitSaveFailed =>
      'Não foi possível salvar o kit de recuperação. Tente novamente ou copie a chave.';

  @override
  String get recoveryKitAcknowledge =>
      'Guardei meu kit de recuperação em um lugar seguro';

  @override
  String get recoveryKitCreateFailed =>
      'Não foi possível criar seu kit de recuperação. Você pode criar um mais tarde nas configurações da sua conta.';

  @override
  String get recoveryKitSectionTitle => 'Kit de recuperação';

  @override
  String get recoveryKitSectionDescription =>
      'Permite redefinir sua senha caso você a esqueça.';

  @override
  String get recoveryKitNone => 'Você ainda não tem um kit de recuperação';

  @override
  String recoveryKitCreatedRelative(String time) {
    return 'Criado $time';
  }

  @override
  String get recoveryKitCreate => 'Criar kit de recuperação';

  @override
  String get recoveryKitCreateNew => 'Criar um novo kit';

  @override
  String get recoveryKitReplaceTitle => 'Criar um novo kit de recuperação?';

  @override
  String get recoveryKitReplaceDescription =>
      'Seu kit atual para de funcionar assim que o novo for criado.';

  @override
  String get recoveryKitReminderTitle => 'Salvar um kit de recuperação';

  @override
  String get recoveryKitReminderBody =>
      'Sua conta não tem um endereço de e-mail. Se você esquecer sua senha, um kit de recuperação é a única maneira de voltar. Leva apenas um minuto.';

  @override
  String get registerUsernameSignInHint =>
      'Você faz login com este nome de usuário. Escolha um que você lembrará.';

  @override
  String get registerUsernameTaken => 'Este nome de usuário já está em uso';

  @override
  String get registerUsernameAvailable =>
      'Este nome de usuário está disponível';

  @override
  String get claimAccountUsernameDescription =>
      'Reivindique sua conta escolhendo um nome de usuário e senha. Você fará login com eles, então escolha uns que você lembrará.';

  @override
  String get unclaimedAccountDescriptionUsername =>
      'Sua conta ainda não foi reivindicada. Sem um nome de usuário e senha, você não poderá fazer login em outros dispositivos e poderá perder o acesso à sua conta. Reivindique sua conta agora para protegê-la.';

  @override
  String get addFriendUsernameOnlyHint => 'Nome de usuário';

  @override
  String get registerTitle => 'Criar uma conta';

  @override
  String get registerDisplayName => 'Nome de exibição (opcional)';

  @override
  String get registerDisplayNameHint => 'Como as pessoas devem chamar você?';

  @override
  String get registerUsername => 'Nome de usuário (opcional)';

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
  String get registerConsentPrefix => 'Concordo com os ';

  @override
  String get registerConsentTerms => 'Termos de serviço';

  @override
  String get registerConsentAnd => ' e ';

  @override
  String get registerConsentPrivacy => 'Política de privacidade';

  @override
  String get registerConfirmPassword => 'Confirmar senha';

  @override
  String get registerSubmit => 'Criar conta';

  @override
  String get registerHaveAccount => 'Já tem uma conta? ';

  @override
  String get registerPendingApproval =>
      'Sua solicitação de conta está aguardando aprovação. Você poderá entrar depois que um administrador aprová-la.';

  @override
  String get registerClosed =>
      'O cadastro está fechado no momento. Use um link de cadastro de um administrador para criar uma conta.';

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
  String get errorInvalidUsernameOrPassword =>
      'Nome de usuário ou senha inválidos.';

  @override
  String get errorUnableToSendResetLink =>
      'Não foi possível enviar o link de redefinição. Tente novamente.';

  @override
  String get errorUnableToResetPassword =>
      'Não foi possível redefinir a senha. Tente novamente.';

  @override
  String get embedInviteJoin => 'Entrar na comunidade';

  @override
  String get embedInviteGoTo => 'Ir para a comunidade';

  @override
  String embedInviteOnline(String count) {
    return '$count online';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count Membros';
  }

  @override
  String get embedInviteUnknownTitle => 'Convite desconhecido';

  @override
  String get embedInviteUnknownSubtitle => 'Tente pedir um novo convite.';

  @override
  String get embedInviteUnavailable => 'Convite indisponível';

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
  String get inviteAcceptTitle => 'Você foi convidado(a) para entrar';

  @override
  String get inviteAcceptJoinButton => 'Entrar na comunidade';

  @override
  String get inviteAcceptGoToButton => 'Ir para a comunidade';

  @override
  String get inviteAcceptInvitesPaused => 'Convites pausados';

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
  String get mentionUnknownChannel => 'canal-desconhecido';

  @override
  String get channelAccessDeniedTitle => 'Acesso ao canal negado';

  @override
  String get channelAccessDeniedDescription =>
      'Você não tem acesso ao canal onde esta mensagem foi enviada.';

  @override
  String get messageJumpLinkNoAccess => 'Sem acesso';

  @override
  String get okay => 'Ok';

  @override
  String get embedThemeTitle => 'Tema compartilhado';

  @override
  String get embedThemeWebOnly =>
      'Só é possível importar temas na web ou no desktop.';

  @override
  String get embedThemeImport => 'Importar tema';

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
      'Reivindique sua conta para resgatar este presente.';

  @override
  String get embedGiftClaim => 'Resgatar presente';

  @override
  String get embedGiftClaimed => 'Presente resgatado';

  @override
  String get embedGiftClaimAccount => 'Reivindicar conta para resgatar';

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
  String get privacySettings => 'Configurações de privacidade';

  @override
  String get privacyDirectMessages => 'Mensagens diretas';

  @override
  String get privacyDirectMessagesDescription =>
      'Permitir mensagens diretas de outros membros nesta comunidade';

  @override
  String get privacyBotDirectMessages => 'Mensagens diretas de bot';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Permitir que bots desta comunidade enviem mensagens diretas para você';

  @override
  String get privacyMutualDmsDisabled =>
      'Os administradores da comunidade desativaram o recebimento de mensagens diretas apenas de membros mútuos nesta comunidade.';

  @override
  String get communityDebug => 'Depuração da comunidade';

  @override
  String get copiedToClipboard => 'Copiado para a área de transferência';

  @override
  String get notificationSettings => 'Configurações de notificação';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Silenciar $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Silenciar uma comunidade impede que indicadores de não lidas e notificações apareçam, a menos que você seja mencionado';

  @override
  String get notificationCommunitySettings =>
      'Configurações de notificação da comunidade';

  @override
  String get notificationAllMessages => 'Todas as mensagens';

  @override
  String get notificationOnlyMentions => 'Apenas menções';

  @override
  String get notificationNothing => 'Nada';

  @override
  String get notificationSuppressEveryone => 'Suprimir @everyone e @here';

  @override
  String get notificationSuppressRoles => 'Suprimir todas as menções de cargo';

  @override
  String get notificationMobilePush => 'Notificações push no celular';

  @override
  String get notificationOverrides => 'Substituições de notificação';

  @override
  String get notificationSelectChannel => 'Selecionar um canal ou categoria';

  @override
  String get notificationOnlyAtMentions => 'Somente @menções';

  @override
  String get notificationMuteChannel => 'Silenciar canal';

  @override
  String get notificationUnmuteChannel => 'Reativar notificações do canal';

  @override
  String get notificationUseCategoryDefault => 'Usar padrão da categoria';

  @override
  String get notificationUseCommunityDefault => 'Usar padrão da comunidade';

  @override
  String get notificationNoCategory => 'Sem categoria';

  @override
  String get dmMarkAsRead => 'Marcar como lida';

  @override
  String get dmMuteConversation => 'Silenciar conversa';

  @override
  String get dmUnmuteConversation => 'Reativar notificações da conversa direta';

  @override
  String get dmPinDm => 'Fixar conversa por mensagem direta';

  @override
  String get dmUnpinDm => 'Desafixar conversa direta';

  @override
  String get dmAlwaysShowInSidebar => 'Sempre mostrar na barra lateral';

  @override
  String get dmRemoveFromAlwaysShown => 'Remover de sempre mostrados';

  @override
  String get dmCloseDm => 'Fechar conversa';

  @override
  String get dmCloseDmConfirmTitle => 'Fechar conversa';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Tem certeza de que deseja fechar sua DM com $username? Você sempre pode reabri-la mais tarde.';
  }

  @override
  String get dmDeleteMyMessagesTitle =>
      'Excluir suas mensagens nesta conversa?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Isso excluirá permanentemente todas as mensagens que você já enviou nesta conversa. Esta ação não pode ser desfeita.';

  @override
  String get dmCopyChannelId => 'Copiar ID do canal';

  @override
  String get dmChannelIdCopied => 'ID do canal copiado';

  @override
  String get dmCopyUserId => 'Copiar ID de usuário';

  @override
  String get dmUserIdCopied => 'ID de usuário copiado';

  @override
  String get dmViewProfile => 'Ver perfil';

  @override
  String get dmVoiceCall => 'Iniciar chamada de voz';

  @override
  String get incomingVoiceCallTitle => 'Chamada de voz recebida';

  @override
  String get incomingVoiceCallAccept => 'Aceitar';

  @override
  String get incomingVoiceCallDecline => 'Rejeitar';

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
  String dmInviteSentFor(String communityName) {
    return 'Convite para $communityName enviado';
  }

  @override
  String get dmInviteSendFailed =>
      'Não foi possível enviar o convite. Tente novamente.';

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
  String get dmMuteForever => 'Até eu ativar novamente';

  @override
  String get dmPinGroupDm => 'Fixar conversa em grupo';

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
  String get dmUnfavoriteDm => 'Remover conversa direta dos favoritos';

  @override
  String get dmFavoriteGroupDm => 'Favoritar conversa em grupo';

  @override
  String get dmUnfavoriteGroupDm => 'Remover conversa em grupo dos favoritos';

  @override
  String get dmChangeFriendNickname => 'Alterar apelido do amigo';

  @override
  String get dmRemoveFriend => 'Remover amigo';

  @override
  String get dmAddFriend => 'Adicionar amigo';

  @override
  String get dmAcceptFriendRequest => 'Aceitar pedido de amizade';

  @override
  String get dmIgnoreFriendRequest => 'Ignorar pedido de amizade';

  @override
  String get dmFriendRequestSent => 'Pedido de amizade enviado';

  @override
  String get dmUnblock => 'Desbloquear';

  @override
  String get dmDebugUser => 'Depurar usuário';

  @override
  String get dmDebugChannel => 'Depurar canal';

  @override
  String get dmDebugCategory => 'Categoria de Depuração';

  @override
  String get dmPinned => 'Conversa por mensagem direta fixada';

  @override
  String get dmUnpinned => 'Conversa direta desafixada';

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
  String get dmFriendRequestSentToast => 'Pedido de amizade enviado';

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
      'Nenhum usuário encontrado com esse nome de usuário.';

  @override
  String get addFriendInvalidUsername =>
      'Insira um nome de usuário válido (NomeDeUsuário#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Pedido de amizade enviado';

  @override
  String get addFriendClaimTitle => 'Reivindique sua conta';

  @override
  String get addFriendClaimDescription =>
      'Reivindique sua conta para enviar pedidos de amizade.';

  @override
  String get addFriendVerifyTitle => 'Verifique seu e-mail';

  @override
  String get addFriendVerifyDescription =>
      'Você precisa verificar seu e-mail antes de enviar pedidos de amizade.';

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
  String get addFriendIncomingStatus => 'Pedido de amizade recebido';

  @override
  String get addFriendOutgoingStatus => 'Pedido de amizade enviado';

  @override
  String get addFriendViewProfile => 'Ver perfil';

  @override
  String get addFriendAccept => 'Aceitar';

  @override
  String get addFriendIgnore => 'Ignorar';

  @override
  String get addFriendAcceptTitle => 'Aceitar pedido de amizade';

  @override
  String get addFriendIgnoreTitle => 'Ignorar pedido de amizade';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Aceitar o pedido de amizade de $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Ignorar o pedido de amizade de $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Cancelar solicitação';

  @override
  String get addFriendCancelRequestFailed =>
      'Não foi possível cancelar o pedido de amizade. Tente novamente.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Essa pessoa não está aceitando pedidos de amizade no momento.';

  @override
  String get addFriendUnblockFirst =>
      'Desbloqueie a pessoa primeiro para enviar um pedido de amizade.';

  @override
  String get addFriendCannotSendToSelf =>
      'Você não pode enviar um pedido de amizade para si mesmo.';

  @override
  String get addFriendAlreadyFriends => 'Você já é amigo(a) deste usuário.';

  @override
  String get addFriendClaimToSend =>
      'Conclua seu cadastro para enviar pedidos de amizade.';

  @override
  String get addFriendVerifyToSend =>
      'Verifique seu e-mail antes de enviar pedidos de amizade.';

  @override
  String get addFriendFriendsListFull =>
      'Sua lista de amigos ou a da outra pessoa está cheia. Remova alguém e tente novamente.';

  @override
  String get addFriendSendFailedTitle =>
      'Não foi possível enviar o pedido de amizade';

  @override
  String get addFriendSendFailedMessage =>
      'Não foi possível enviar o pedido de amizade. Tente novamente.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Sistema';

  @override
  String get userTagOp => 'OP';

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
  String get emojiInfoDiscoverableCommunity => 'Listada em Explorar';

  @override
  String get emojiInfoPrivateCommunity => 'Comunidade privada';

  @override
  String get emojiInfoVerifiedCommunity => 'Comunidade verificada';

  @override
  String get emojiInfoAddToFavorites => 'Adicionar aos favoritos';

  @override
  String get emojiInfoRemoveFromFavorites => 'Remover dos favoritos';

  @override
  String get emojiFrequentlyUsed => 'Usados com frequência';

  @override
  String get emojiTabGifs => 'GIFs';

  @override
  String get emojiTabMedia => 'Mídia';

  @override
  String get emojiTabStickers => 'Figurinhas';

  @override
  String get emojiTabEmojis => 'Emojis';

  @override
  String get gifPickerSearch => 'Pesquisar GIFs';

  @override
  String get gifPickerSearchKlipy => 'Pesquisar Klipy';

  @override
  String get gifPickerSearchTenor => 'Pesquisar Tenor';

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
  String get gifPickerNoResultsTitle => 'Nenhum resultado encontrado';

  @override
  String get gifPickerNoResultsDescription => 'Tente outro termo de busca';

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
  String get emojiCategoryFood => 'Comidas e bebidas';

  @override
  String get emojiCategoryActivity => 'Atividades';

  @override
  String get emojiCategoryTravel => 'Viagens e lugares';

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
      'Remove automaticamente parâmetros de rastreamento (como utm_source, fbclid, gclid) de URLs nas mensagens que você envia. Limpa o link antes que ele chegue a qualquer outra pessoa.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Confiar em todos os links externos?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Isso fará com que todos os links externos sejam confiáveis e pulará o aviso para todos os domínios. Seus domínios confiáveis existentes serão substituídos. Isso é menos seguro.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Confiar em todos';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Parar de confiar em todos os links?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Os avisos de links externos serão exibidos novamente. Você precisará adicionar domínios confiáveis individualmente.';

  @override
  String get externalLinkStopTrustingAllAction => 'Desativar confiar em todos';

  @override
  String get externalLinkTrustedAllDescription =>
      'Todos os links externos são confiáveis. Os avisos não serão exibidos.';

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
  String get cropAvatar => 'Recortar avatar';

  @override
  String get cropBanner => 'Recortar banner';

  @override
  String get skip => 'Pular';

  @override
  String get crop => 'Cortar';

  @override
  String get cropTouchHint =>
      'Use dois dedos para ampliar e arraste para reposicionar';

  @override
  String get cropMouseHint =>
      'Arraste os cantos para redimensionar, arraste por dentro para mover';

  @override
  String get changeYourFluxerTag => 'Alterar seu nome de usuário';

  @override
  String get fluxerTagDescriptionBase =>
      'Nomes de usuário podem conter apenas letras (a-z, A-Z), números (0-9) e sublinhados. Nomes de usuário não diferenciam maiúsculas de minúsculas.';

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
      'Somente letras (a-z, A-Z), números (0-9) e sublinhados (_)';

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
  String get fluxerTagUpdated => 'Nome de usuário atualizado';

  @override
  String get fluxerTagUpdateFailed =>
      'Falha ao atualizar Nome de usuário. Por favor, tente novamente.';

  @override
  String get continueAction => 'Continuar';

  @override
  String get profileCustomizationTitle => 'Personalização do perfil';

  @override
  String get profileCustomizationDescription =>
      'Edite a aparência do seu perfil e veja uma prévia ao vivo';

  @override
  String get usernameLabel => 'Nome de usuário';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Reivindique sua conta para alterar seu nome de usuário';

  @override
  String get changeFluxerTag => 'Alterar nome de usuário';

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
  String get displayNameLabel => 'Nome de exibição';

  @override
  String get pronounsLabel => 'Pronomes';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Alterar avatar';

  @override
  String get removeAvatar => 'Remover avatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Máx. 10MB. Recomendado: 512×512px';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get changeBanner => 'Alterar banner';

  @override
  String get removeBanner => 'Remover banner';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Máx. 10MB. Mínimo: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Cor de destaque';

  @override
  String get accentColorDescription =>
      'Personaliza a cor da borda e do banner no seu perfil';

  @override
  String get aboutMeLabel => 'Sobre mim';

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
  String get maskVisionaryAsSubscription => 'Exibir Visionary como assinatura';

  @override
  String get maskVisionaryDescription =>
      'Mostrar sua assinatura Visionary como uma assinatura comum';

  @override
  String get hideVisionaryIdBadge => 'Ocultar selo de ID Visionary';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Ocultar selo de ID Visionary (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Remover seu selo de ID Visionary';

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
    return 'Membro do $productName desde';
  }

  @override
  String get unclaimedAccountTitle => 'Conta não reivindicada';

  @override
  String get unclaimedAccountDescription =>
      'Sua conta ainda não foi reivindicada. Sem um e-mail e senha, você pode perder o acesso. Reivindique sua conta agora para protegê-la.';

  @override
  String get claimAccount => 'Reivindicar conta';

  @override
  String get profileTypeLabel => 'Tipo de perfil';

  @override
  String get profileTypeGlobal => 'Perfil global';

  @override
  String get profileTypeGuildDescription =>
      'Você está editando seu perfil para esta comunidade. Ele só ficará visível aqui e substituirá seu perfil global.';

  @override
  String get communityNicknameLabel => 'Apelido na comunidade';

  @override
  String get perGuildPremiumUpsellText =>
      'Personalizar seu avatar, banner, cor de destaque e biografia para comunidades individuais requer Plutonium. Apelido e pronomes da comunidade são gratuitos para todos.';

  @override
  String get avatarModeInherit => 'Usar perfil global';

  @override
  String get avatarModeCustom => 'Usar imagem personalizada';

  @override
  String get avatarModeUnset => 'Não mostrar';

  @override
  String get profileSavedToast => 'Perfil atualizado';

  @override
  String get sudoTitle => 'Verifique Sua Identidade';

  @override
  String get sudoDescription => 'Esta ação requer verificação para continuar.';

  @override
  String get sudoAuthenticatorCode => 'Código do autenticador';

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
  String get securityLoginEmailAddressLabel => 'Endereço de e-mail';

  @override
  String get securityLoginNoEmailSet => 'Nenhum endereço de e-mail definido';

  @override
  String get securityLoginChangeEmail => 'Alterar e-mail';

  @override
  String get securityLoginAddEmail => 'Adicionar e-mail';

  @override
  String get securityLoginReveal => 'Mostrar';

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
  String get securityLoginChangePassword => 'Alterar senha';

  @override
  String get securityLoginSetPassword => 'Definir senha';

  @override
  String get passwordChangeTitle => 'Alterar senha';

  @override
  String get passwordChangeIntroDescription =>
      'Enviaremos um código de verificação para seu endereço de e-mail para confirmar sua identidade antes de alterar sua senha.';

  @override
  String get passwordChangeStart => 'Começar';

  @override
  String get passwordChangeVerifyTitle => 'Verifique seu e-mail';

  @override
  String get passwordChangeVerifyDescription =>
      'Digite o código de verificação enviado para seu endereço de e-mail.';

  @override
  String get passwordChangeVerificationCode => 'Código de verificação';

  @override
  String get passwordChangeVerify => 'Verificar';

  @override
  String get passwordChangeNewPasswordTitle => 'Definir nova senha';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Digite sua nova senha abaixo.';

  @override
  String get passwordChangeNewPassword => 'Nova senha';

  @override
  String get passwordChangeConfirmPassword => 'Confirmar nova senha';

  @override
  String get passwordChangeSubmit => 'Alterar senha';

  @override
  String get passwordChangeSuccess => 'Senha alterada';

  @override
  String get passwordChangePasswordsDoNotMatch => 'As senhas não correspondem';

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
  String get emailChangeNewEmailTitle => 'Insira o novo e-mail';

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
      'Autenticação de dois fatores ativada';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Use um app autenticador para gerar códigos para a autenticação de dois fatores';

  @override
  String get securityTfaBackupCodes => 'Códigos de recuperação';

  @override
  String get securityTfaBackupCodesDescription =>
      'Ver e gerenciar seus códigos de recuperação da conta';

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
      'ex: YubiKey, iPhone, computador do trabalho';

  @override
  String get securityClaimTitle => 'Recursos de segurança';

  @override
  String get securityClaimDescription =>
      'Reivindique sua conta para acessar recursos de segurança, como autenticação de dois fatores e chaves de acesso.';

  @override
  String get securityVerifyEmailRequired =>
      'Você precisa verificar seu endereço de e-mail antes de configurar a autenticação de dois fatores ou chaves de acesso.';

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
  String get totpDisableTitle => 'Remover app autenticador';

  @override
  String get totpDisableDescription =>
      'Digite o código de 6 dígitos do seu aplicativo autenticador para desativar a autenticação de dois fatores.';

  @override
  String get totpDisableSuccess => 'Autenticação de dois fatores desativada';

  @override
  String get backupCodesTitle => 'Códigos de recuperação';

  @override
  String get backupCodesWarning =>
      'Se você perder o acesso ao seu aplicativo autenticador e não tiver esses códigos, ficará permanentemente bloqueado fora da sua conta. Baixe ou copie-os agora e guarde-os em um local seguro.';

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
  String get dangerZoneSectionTitle => 'Zona de perigo';

  @override
  String get dangerZoneSectionDescription =>
      'Ações irreversíveis e destrutivas';

  @override
  String get dangerZoneDisableTitle => 'Desativar conta';

  @override
  String get dangerZoneDisableDescription =>
      'Desativar sua conta temporariamente. Você pode reativá-la mais tarde fazendo login novamente.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Desativar sua conta fará logout de todas as sessões. Você pode reativar sua conta a qualquer momento fazendo login novamente.';

  @override
  String get dangerZoneDeleteTitle => 'Excluir conta';

  @override
  String get dangerZoneDeleteDescription =>
      'Excluir permanentemente sua conta e todos os dados associados. Esta ação não pode ser desfeita.';

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
      'Após 14 dias, sua conta será excluída permanentemente';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Após a exclusão ser processada, você não poderá recuperar o acesso à sua conta';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Você não poderá excluir suas mensagens enviadas após a exclusão da sua conta';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Se você deseja exportar seus dados ou excluir suas mensagens primeiro, visite a seção Painel de Privacidade em Configurações do Usuário antes de prosseguir.';

  @override
  String get claimAccountTitle => 'Reivindique sua conta';

  @override
  String get claimAccountDescription =>
      'Reivindique sua conta adicionando um e-mail e uma senha. Enviaremos um código de verificação para confirmar seu e-mail antes de finalizar.';

  @override
  String get claimAccountEmailLabel => 'E-mail';

  @override
  String get claimAccountPasswordLabel => 'Senha';

  @override
  String get claimAccountSendCode => 'Enviar código';

  @override
  String get claimAccountVerifyDescription =>
      'Insira o código que enviamos para seu e-mail para verificá-lo. Sua senha será definida assim que o código for confirmado.';

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
  String get authorizedAppsTitle => 'Aplicativos autorizados';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Estes aplicativos receberam acesso à sua conta $productName.';
  }

  @override
  String get authorizedAppsEmptyTitle => 'Nenhum aplicativo autorizado';

  @override
  String get authorizedAppsEmptyDescription =>
      'Você ainda não autorizou nenhum aplicativo a acessar sua conta.';

  @override
  String get authorizedAppsLoadError =>
      'Não foi possível carregar os aplicativos autorizados';

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
      'Acessar suas informações básicas de perfil (nome de usuário, avatar, etc.)';

  @override
  String get authorizedAppsScopeEmail => 'Ver seu endereço de e-mail';

  @override
  String get authorizedAppsScopeGuilds =>
      'Ver as comunidades de que você é membro';

  @override
  String get authorizedAppsScopeConnections => 'Ver suas contas conectadas';

  @override
  String get authorizedAppsScopeBot =>
      'Adicionar um bot a uma comunidade com as permissões solicitadas';

  @override
  String get authorizedAppsScopeAdmin => 'Acessar endpoints administrativos';

  @override
  String get applicationsTitle => 'Aplicativos';

  @override
  String get applicationsCreate => 'Criar aplicativo';

  @override
  String get applicationsCreateSubmit => 'Criar';

  @override
  String get applicationsCreateClaimTooltip =>
      'Reivindique sua conta para criar aplicativos.';

  @override
  String applicationsDocsLink(String domain) {
    return 'Leia a documentação ($domain)';
  }

  @override
  String get applicationsLoadError =>
      'Não foi possível carregar os aplicativos';

  @override
  String get applicationsLoadErrorDescription =>
      'Verifique sua conexão e tente novamente.';

  @override
  String get applicationsEmptyTitle => 'Nenhum aplicativo ainda';

  @override
  String applicationsEmptyDescription(String apiName) {
    return 'Crie seu primeiro aplicativo para começar a usar a $apiName.';
  }

  @override
  String applicationsCreated(String date) {
    return 'Criado em $date';
  }

  @override
  String get applicationsName => 'Nome do aplicativo';

  @override
  String get applicationsNameHint => 'Meu aplicativo';

  @override
  String get applicationsNameRequired => 'O nome do aplicativo é obrigatório';

  @override
  String get applicationsBackToList => 'Voltar para a lista';

  @override
  String get applicationsDetailLoadError =>
      'Não foi possível carregar este aplicativo';

  @override
  String get applicationsDetailLoadErrorDescription =>
      'Tente novamente ou volte para a lista de aplicativos.';

  @override
  String get applicationsId => 'ID do aplicativo';

  @override
  String get applicationsCopyId => 'Copiar ID';

  @override
  String get applicationsSecretsTitle => 'Segredos e tokens';

  @override
  String get applicationsSecretsDescription =>
      'Mantenha-os em segurança. Gerar novamente vai quebrar as integrações existentes.';

  @override
  String get applicationsClientSecret => 'Segredo do cliente';

  @override
  String get applicationsBotToken => 'Token do bot';

  @override
  String get applicationsRegenerate => 'Gerar novamente';

  @override
  String get applicationsRegenerateClientSecretTitle =>
      'Gerar novamente o segredo do cliente?';

  @override
  String get applicationsRegenerateBotTokenTitle =>
      'Gerar um novo token do bot?';

  @override
  String get applicationsRegenerateClientSecretDescription =>
      'Gerar novamente invalidará o segredo atual. Atualize qualquer código que use o valor antigo.';

  @override
  String get applicationsRegenerateBotTokenDescription =>
      'Gerar um novo token invalidará o atual. Atualize qualquer código que use o valor antigo.';

  @override
  String get applicationsClientSecretRegenerated =>
      'Segredo do cliente gerado novamente. Atualize qualquer código que use o segredo antigo.';

  @override
  String get applicationsBotTokenRegenerated =>
      'Token do bot gerado novamente. Atualize qualquer código que use o token antigo.';

  @override
  String get applicationsRegenerateFailed =>
      'Não foi possível gerar um novo segredo';

  @override
  String get applicationsInfoTitle => 'Informações do aplicativo';

  @override
  String get applicationsInfoDescription =>
      'Configurações básicas e URIs de redirecionamento permitidas.';

  @override
  String get applicationsPublicBot => 'Bot público';

  @override
  String get applicationsPublicBotDescription =>
      'Permitir que qualquer pessoa convide este bot para as comunidades dela.';

  @override
  String get applicationsRequireCodeGrant =>
      'Exigir concessão de código OAuth2';

  @override
  String get applicationsRequireCodeGrantDescription =>
      'Requer um URI de redirecionamento e um código de autorização ao convidar este bot.';

  @override
  String get applicationsRedirectUris => 'URIs de redirecionamento';

  @override
  String get applicationsAddRedirect => 'Adicionar redirecionamento';

  @override
  String get applicationsDeleteRedirect => 'Excluir URI de redirecionamento';

  @override
  String get applicationsBotProfileTitle => 'Perfil do bot';

  @override
  String get applicationsBotProfileDescription =>
      'Avatar, tag e detalhes do perfil do seu bot.';

  @override
  String get applicationsBotAvatar => 'Avatar do bot';

  @override
  String get applicationsUsernameRequired => 'O nome de usuário é obrigatório';

  @override
  String get applicationsUsernameTooLong =>
      'O nome de usuário deve ter no máximo 32 caracteres';

  @override
  String get applicationsUsernameInvalid =>
      'O nome de usuário pode conter apenas letras, números e sublinhados';

  @override
  String get applicationsBotUsername => 'Nome de usuário do bot';

  @override
  String get applicationsDiscriminator => 'Discriminador';

  @override
  String get applicationsBotBio => 'Biografia do bot';

  @override
  String get applicationsBotBioHint =>
      'Um bot prestativo que faz coisas incríveis!';

  @override
  String get applicationsNoBotBanner => 'Sem banner do bot';

  @override
  String get applicationsFriendlyBot => 'Bot amigável';

  @override
  String get applicationsFriendlyBotDescription =>
      'Permitir que usuários enviem pedidos de amizade para este bot para aprovação manual.';

  @override
  String get applicationsManualFriendApproval =>
      'Exigir aprovação manual de amizade';

  @override
  String get applicationsManualFriendApprovalDescription =>
      'Os pedidos de amizade para este bot precisam de aprovação manual.';

  @override
  String get applicationsOauthBuilderTitle => 'Construtor de URL OAuth2';

  @override
  String get applicationsOauthBuilderDescription =>
      'Crie um URL de autorização com escopos e permissões.';

  @override
  String get applicationsScopes => 'Permissões';

  @override
  String get applicationsRedirectUri => 'URI de redirecionamento';

  @override
  String get applicationsSelectRedirectUri =>
      'Selecione um URI de redirecionamento';

  @override
  String get applicationsRedirectRequiredCodeGrant =>
      'A URI de redirecionamento é obrigatória porque este bot exige a concessão de código OAuth2.';

  @override
  String get applicationsRedirectRequiredScopes =>
      'A URI de redirecionamento é obrigatória quando não se usa apenas o escopo do bot.';

  @override
  String get applicationsBotPermissions => 'Permissões do bot';

  @override
  String get applicationsAuthorizeUrl => 'Autorizar URL';

  @override
  String get applicationsAuthorizeUrlPlaceholder =>
      'Selecione as permissões (e o URI de redirecionamento, se necessário)';

  @override
  String get applicationsCopyAuthorizeUrl => 'Copiar URL de autorização';

  @override
  String get applicationsCopiedUrl =>
      'URL copiada para a área de transferência';

  @override
  String get applicationsDangerTitle => 'Zona de perigo';

  @override
  String get applicationsDangerSubtitle =>
      'Isso não pode ser desfeito. Remover o aplicativo também exclui o bot dele.';

  @override
  String get applicationsDangerHelper =>
      'Depois de excluído, o aplicativo e as credenciais são removidos permanentemente.';

  @override
  String get applicationsDelete => 'Excluir aplicativo';

  @override
  String applicationsDeleteConfirmDescription(String name) {
    return 'Tem certeza de que deseja excluir $name? Esta ação não pode ser desfeita. Todos os dados associados, incluindo o usuário bot, serão excluídos permanentemente.';
  }

  @override
  String get applicationsDeleteFailed =>
      'Não foi possível excluir o aplicativo';

  @override
  String get applicationsUpdated => 'Aplicativo atualizado com sucesso';

  @override
  String get applicationsNoChanges => 'Nenhuma alteração para salvar';

  @override
  String get applicationsSearchBots => 'Aplicativos e bots';

  @override
  String get applicationsSearchBotsDescription =>
      'Crie e gerencie aplicativos e bots para sua conta';

  @override
  String get applicationsSearchInfoDescription =>
      'Editar informações básicas do aplicativo e URIs de redirecionamento';

  @override
  String get applicationsSearchBotProfileDescription =>
      'Editar avatar, tag, biografia, banner e comportamento dos pedidos de amizade do bot';

  @override
  String get applicationsSearchOauthDescription =>
      'Criar uma URL de autorização com escopos, redirecionamentos e permissões de bot';

  @override
  String get applicationsSearchSecretsDescription =>
      'Ver e gerar novamente segredos do cliente e tokens de bot';

  @override
  String get applicationsSearchBotsKeyword => 'Bots';

  @override
  String get applicationsSearchDocumentation => 'Documentação';

  @override
  String get blockedUsersTitle => 'Usuários bloqueados';

  @override
  String get blockedUsersDescription =>
      'Usuários bloqueados não podem enviar pedidos de amizade nem mensagens diretas para você.';

  @override
  String get blockedUsersEmptyTitle => 'Nenhum usuário bloqueado';

  @override
  String get blockedUsersEmptyDescription => 'Você ainda não bloqueou ninguém.';

  @override
  String get blockedUsersLoadError => 'Falha ao Carregar Usuários Bloqueados';

  @override
  String get blockedUsersUnblock => 'Desbloquear';

  @override
  String get blockedUsersUnblockTitle => 'Desbloquear usuário';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Tem certeza de que deseja desbloquear $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Copiar nome de usuário';

  @override
  String get blockedUsersCopyId => 'Copiar ID de usuário';

  @override
  String get userProfileLoadError => 'Não foi possível carregar o perfil';

  @override
  String get userProfileLoading => 'Carregando perfil';

  @override
  String get userProfileRetry => 'Tentar novamente';

  @override
  String get userProfileMessage => 'Mensagem';

  @override
  String get userProfileVoiceCall => 'Chamada de voz';

  @override
  String get userProfileVideoCall => 'Chamada de vídeo';

  @override
  String get userProfileEditProfile => 'Editar perfil';

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
    return 'Caçador de bugs do $productName';
  }

  @override
  String userProfilePremiumSubscriberSinceTooltip(
    String premiumProductFullName,
    String date,
  ) {
    return 'Assinante $premiumProductFullName desde $date';
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
    return 'Amigos em comum ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Comunidades em comum ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Amigos em comum';

  @override
  String get userProfileMutualCommunitiesTitle => 'Comunidades em comum';

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
  String get userProfileOpenBlockedDmTitle => 'Abrir conversa';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Você bloqueou $username. Você não poderá enviar mensagens a menos que o desbloqueie.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Desbloquear';

  @override
  String get userProfileOpenDm => 'Abrir conversa';

  @override
  String get userProfileNoteTitle => 'Nota';

  @override
  String get userProfileNoteVisibility => '(só visível para você)';

  @override
  String get userProfileNoteSave => 'Salvar';

  @override
  String get userProfileNoteDelete => 'Excluir';

  @override
  String get userProfileMemberSince => 'Membro desde';

  @override
  String get userProfileAboutMe => 'Sobre mim';

  @override
  String get userProfileRoles => 'Cargos';

  @override
  String get memberRoleAdd => 'Adicionar cargo';

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
  String get guildSettingsRolesTab => 'Cargos';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Hora local';

  @override
  String get profileLocalTimeSettingsTitle => 'Hora local do perfil';

  @override
  String profileLocalTimeSettingsSummary(String productName) {
    return 'Defina seu fuso horário uma vez para que o $productName mantenha sua diferença em relação ao UTC atualizada nas mudanças de horário de verão. Outras pessoas só podem ver essa diferença, não o identificador exato do seu fuso horário.';
  }

  @override
  String get profileLocalTimeEditButton => 'Editar horário local do perfil';

  @override
  String get profileLocalTimeTimezoneLabel => 'Fuso horário';

  @override
  String profileLocalTimeTimezoneHelp(String productName) {
    return 'Escolha o fuso horário que o $productName usa para calcular seu deslocamento UTC e exibir a hora local no seu perfil.';
  }

  @override
  String get profileLocalTimeSearchTimezones => 'Pesquisar fusos horários';

  @override
  String get profileLocalTimeNotSet => 'Não definido';

  @override
  String profileLocalTimePrivacyNote(
    String timezoneIdentifierExample,
    String productName,
  ) {
    return 'Outras pessoas só podem ver seu deslocamento UTC atual quando você optar por compartilhar o horário local do perfil. Elas não veem seu identificador de fuso horário exato, como $timezoneIdentifierExample. O $productName armazena esse identificador apenas para que o deslocamento possa ser atualizado automaticamente quando o horário de verão mudar.';
  }

  @override
  String get profileLocalTimePrivacyEveryone => 'Todos';

  @override
  String get profileLocalTimePrivacyEveryoneDesc =>
      'Permitir que qualquer pessoa que possa ver seu perfil completo veja seu horário local';

  @override
  String get profileLocalTimePrivacyFriends => 'Amigos';

  @override
  String get profileLocalTimePrivacyFriendsDesc =>
      'Permitir que seus amigos vejam seu horário local';

  @override
  String get profileLocalTimePrivacyCommunityMembers => 'Membros da comunidade';

  @override
  String get profileLocalTimePrivacyCommunityMembersDesc =>
      'Permitir que membros das comunidades das quais você participa vejam seu horário local';

  @override
  String get userProfileSameTimeAsYou => 'Mesmo fuso horário que o seu';

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
  String get userProfileCopyUserId => 'Copiar ID de usuário';

  @override
  String get userProfileViewMainProfile => 'Ver Perfil Principal';

  @override
  String get userProfileViewCommunityProfile => 'Ver perfil na comunidade';

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
  String get userProfileFailedSaveNote => 'Falha ao salvar nota';

  @override
  String get userProfileChangeNickname => 'Alterar apelido';

  @override
  String get userProfileKick => 'Expulsar';

  @override
  String get userProfileBan => 'Banir';

  @override
  String get userProfileTimeout => 'Suspensão temporária';

  @override
  String get userProfileRemoveTimeout => 'Remover suspensão temporária';

  @override
  String get userProfileTransferOwnership => 'Transferir a propriedade';

  @override
  String get userProfileReportMessage => 'Denunciar mensagem';

  @override
  String get userProfileReportUserProfile => 'Denunciar perfil';

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
  String get userProfileBanReasonHint => 'Insira um motivo para o banimento';

  @override
  String get userProfileBanSubmit => 'Banir membro';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Silenciar $username';
  }

  @override
  String get userProfileTimeoutDurationLabel =>
      'Duração da suspensão temporária';

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
    return 'Que bom que você está aqui, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Boas-vindas, $username! Sinta-se em casa.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Olá, $username! Que bom ter você aqui.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Olá, $username! Entre quando quiser.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Oi, $username, que bom te ver por aqui!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Olá, $username! Esperamos que você aproveite o tempo por aqui.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Olá, $username! Boas-vindas!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Que bom que você veio, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Boas-vindas, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Boas-vindas, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Boas-vindas, $username! Que bom ter você aqui.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Boas-vindas, $username! Esperamos que você aproveite bastante.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Boas-vindas, $username! Sua próxima conversa começa aqui.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Boas-vindas, $username. Estamos felizes em ter você aqui.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Que bom te ver por aqui, $username! Boas-vindas.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Você chegou, $username! Que bom ter você com a gente.';
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
  String get linkedDevicesTitle => 'Meus dispositivos';

  @override
  String get linkedDevicesDescription =>
      'Veja todos os dispositivos que estão atualmente conectados à sua conta. Revogue quaisquer sessões que você não reconheça.';

  @override
  String get linkedDevicesCurrentDevice => 'Dispositivo atual';

  @override
  String get linkedDevicesOtherDevices => 'Outros dispositivos';

  @override
  String get linkedDevicesEnterSelection => 'Entrar no Modo de Seleção';

  @override
  String get linkedDevicesExitSelection => 'Sair do Modo de Seleção';

  @override
  String get linkedDevicesSelectAll => 'Selecionar tudo';

  @override
  String get linkedDevicesClearSelection => 'Limpar seleção';

  @override
  String get linkedDevicesRevokeTooltip => 'Revogar acesso do dispositivo';

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
  String get linkedDevicesLoadErrorTitle => 'Erro de rede';

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
  String get linkedDevicesViewDetails => 'Ver detalhes';

  @override
  String get linkedDevicesDetailsTitle => 'Detalhes do dispositivo';

  @override
  String get linkedDevicesDetailsDevice => 'Dispositivo';

  @override
  String get linkedDevicesDetailsClient => 'Cliente';

  @override
  String get linkedDevicesDetailsLocation => 'Localização';

  @override
  String get linkedDevicesDetailsIp => 'Endereço IP';

  @override
  String get linkedDevicesDetailsLastUsed => 'Último uso';

  @override
  String get linkedDevicesCurrentSession => 'Sessão atual';

  @override
  String get linkedDevicesUnknown => 'Desconhecido';

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
    return 'Comunicados do sistema da equipe $productName. Não é possível responder aqui.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'O envio de mensagens está temporariamente pausado nesta comunidade.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Você está temporariamente suspenso. O envio de mensagens, as reações e a participação em canais de voz ficam desativados até o fim da suspensão.';

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
  String get channelComposerBarrierVerifyEmail => 'Verificar e-mail';

  @override
  String get accountLimitedNotice =>
      'O envio de mensagens está pausado na sua conta. Confira seu e-mail para concluir uma etapa rápida e continuar.';

  @override
  String get messagingPausedTextDidNotGoThrough => 'Meu SMS não chegou';

  @override
  String messagingPausedHelpBody(String supportEmail) {
    return 'Envie um e-mail para $supportEmail e uma pessoa vai verificar sua conta. Você também pode responder ao e-mail que enviamos para você.';
  }

  @override
  String get messagingPausedHelpCountryLabel => 'País onde você está';

  @override
  String get messagingPausedHelpCopyDetails => 'Copiar detalhes';

  @override
  String get messagingPausedHelpEmailSupport => 'Enviar e-mail ao suporte';

  @override
  String messagingPausedHelpAccountIdLine(String accountId) {
    return 'ID da conta: $accountId';
  }

  @override
  String messagingPausedHelpUsernameLine(String username) {
    return 'Nome de usuário: $username';
  }

  @override
  String messagingPausedHelpAccountCreatedLine(String createdAt) {
    return 'Conta criada em: $createdAt';
  }

  @override
  String messagingPausedHelpCountryLine(String country) {
    return 'País: $country';
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
  String get voiceMessageMicInUse =>
      'Saia da chamada de voz para gravar uma mensagem de voz.';

  @override
  String get voiceMessageRecordingFailed =>
      'Falha na gravação. Tente novamente.';

  @override
  String get voiceMessageSendFailed =>
      'Não foi possível enviar a mensagem de voz. Tente novamente.';

  @override
  String get voiceMessagePlay => 'Reproduzir';

  @override
  String get voiceMessagePause => 'Pausar';

  @override
  String get voiceMessageSeekForward => 'Avançar';

  @override
  String get voiceMessageSeekBackward => 'Avançar';

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
  String get chatAttachmentExpiredTooltip => 'Anexo expirou';

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
  String get chatTextualPreviewChangeLanguage => 'Alterar idioma';

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
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Mostrar spoiler';

  @override
  String get matureMediaRevealButton => 'Mostrar';

  @override
  String get matureMediaRevealHint => 'Clique para ver';

  @override
  String get matureContentTitle => 'Conteúdo adulto';

  @override
  String get matureCommunityTitle => 'Comunidade adulta';

  @override
  String get matureCategoryTitle => 'Categoria adulta';

  @override
  String get matureChannelTitle => 'Canal adulto';

  @override
  String get communityContentWarningTitle => 'Aviso de conteúdo da comunidade';

  @override
  String get categoryContentWarningTitle => 'Aviso de conteúdo da categoria';

  @override
  String get channelContentWarningTitle => 'Aviso de conteúdo do canal';

  @override
  String get defaultContentWarningBody => 'Isto contém conteúdo sensível.';

  @override
  String get matureCommunityBody =>
      'Esta comunidade está marcada para conteúdo adulto e pode conter material impróprio para alguns usuários.';

  @override
  String get matureCategoryBody =>
      'Esta categoria está marcada para conteúdo adulto e pode conter material impróprio para alguns usuários.';

  @override
  String get matureChannelBody =>
      'Este canal está marcado para conteúdo adulto e pode conter material impróprio para alguns usuários.';

  @override
  String get matureVoiceChannelBody =>
      'Este canal de voz está marcado para conteúdo adulto e pode conter material impróprio para alguns usuários.';

  @override
  String get matureLinkChannelBody =>
      'Este canal de link está marcado para conteúdo adulto e pode abrir material que talvez seja impróprio para alguns usuários.';

  @override
  String get matureCommunityUnavailableBody =>
      'Esta comunidade com conteúdo adulto não está disponível para sua conta.';

  @override
  String get matureCategoryUnavailableBody =>
      'Esta categoria com conteúdo adulto não está disponível para sua conta.';

  @override
  String get matureChannelUnavailableBody =>
      'Este canal com conteúdo adulto não está disponível para sua conta.';

  @override
  String get matureContentProceedButton => 'Continuar';

  @override
  String get matureContentUnderstandButton => 'Entendi';

  @override
  String get matureContentOpenLinkButton => 'Abrir link';

  @override
  String get sensitiveContentFriendDmLabel => 'Mensagens diretas de amigos';

  @override
  String get sensitiveContentNonFriendDmLabel =>
      'Mensagens diretas de outras pessoas';

  @override
  String get sensitiveContentGuildLabel => 'Mensagens em canais da comunidade';

  @override
  String get sensitiveContentFilterShow => 'Mostrar';

  @override
  String get sensitiveContentFilterBlur => 'Desfocar';

  @override
  String get sensitiveContentFilterBlock => 'Bloquear';

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
  String get connectionAddTitle => 'Adicionar conexão';

  @override
  String get connectionTypeLabel => 'Tipo de conexão';

  @override
  String get connectionHandleLabel => 'Nome de usuário';

  @override
  String get connectionDomainLabel => 'Domínio';

  @override
  String get connectionHandlePlaceholder => 'usuario.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Você já tem esta conexão.';

  @override
  String get connectionConnectBluesky => 'Conectar com Bluesky';

  @override
  String get connectionContinue => 'Continuar';

  @override
  String get connectionVerifyTitle => 'Verificar conexão';

  @override
  String get connectionVerifyInstructions =>
      'Use o registro abaixo para comprovar a propriedade do domínio.';

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
  String get connectionCopied => 'Copiado!';

  @override
  String get connectionTokenFileTitle => 'Disponibilizar o arquivo do token';

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
  String get connectionEditTitle => 'Editar conexão';

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
  String get connectionVisibilityCommunityMembers => 'Membros da comunidade';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Permitir que membros das comunidades das quais você participa vejam esta conexão';

  @override
  String get connectionRemoveTitle => 'Remover conexão';

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
  String get lookAndFeelThemeDark => 'Tema escuro';

  @override
  String get lookAndFeelThemeDarkLegacy => 'Tema escuro (legado)';

  @override
  String get lookAndFeelThemeCoal => 'Tema carvão';

  @override
  String get lookAndFeelThemeLight => 'Tema claro';

  @override
  String get lookAndFeelThemeSystem => 'Tema do sistema';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Sincronizar tema em todos os aparelhos';

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
  String get lookAndFeelThemeColorsTitle => 'Cores do tema';

  @override
  String get lookAndFeelThemeColorsConfigureDescription =>
      'Personalize cores individuais do tema neste aparelho.';

  @override
  String lookAndFeelThemeColorsEditingMode(String mode) {
    return 'Editando $mode';
  }

  @override
  String get lookAndFeelThemeColorsSyncSectionTitle =>
      'Sincronização com o estúdio de temas';

  @override
  String get lookAndFeelThemeColorsSyncFromStudioLabel =>
      'Usar cores do estúdio de temas';

  @override
  String get lookAndFeelThemeColorsSyncFromStudioDescription =>
      'Quando ativado, as mudanças de cor feitas no estúdio de temas do desktop são aplicadas neste aparelho. Quando desativado, este aparelho mantém suas próprias cores.';

  @override
  String get lookAndFeelThemeColorsSyncToStudioLabel =>
      'Enviar mudanças de cor ao estúdio de temas';

  @override
  String get lookAndFeelThemeColorsSyncToStudioDescription =>
      'Quando ativado, as cores que você mudar aqui são sincronizadas com o estúdio de temas nos seus outros aparelhos. Quando desativado, o estúdio de temas do desktop mantém suas próprias cores.';

  @override
  String get lookAndFeelThemeColorsSyncFromStudioOffBanner =>
      'As mudanças de cor do estúdio de temas do desktop não serão aplicadas neste aparelho.';

  @override
  String get lookAndFeelThemeColorsEssentialSectionTitle => 'Cores essenciais';

  @override
  String get lookAndFeelThemeColorsChatBackgroundWallpaperNote =>
      'Se você tiver um papel de parede no chat, não verá esta cor.';

  @override
  String lookAndFeelThemeColorsResetForMode(String mode) {
    return 'Redefinir todas as cores de $mode';
  }

  @override
  String get lookAndFeelThemeColorsResetConfirmTitle =>
      'Redefinir cores do tema?';

  @override
  String lookAndFeelThemeColorsResetConfirmBody(String mode) {
    return 'Isso remove suas cores personalizadas de $mode neste aparelho.';
  }

  @override
  String get lookAndFeelThemeColorsGroupBrandButtons => 'Marca e botões';

  @override
  String get lookAndFeelThemeColorsGroupChatSurfaces => 'Chat e mensagens';

  @override
  String get lookAndFeelThemeColorsGroupSidebars =>
      'Barras laterais e navegação';

  @override
  String get lookAndFeelThemeColorsGroupText => 'Texto';

  @override
  String get lookAndFeelThemeColorsGroupHeaders => 'Cabeçalhos';

  @override
  String get lookAndFeelThemeColorsGroupStatus => 'Status';

  @override
  String get lookAndFeelThemeColorsGroupEmbedsMarkup => 'Embeds e menções';

  @override
  String get lookAndFeelThemeColorsGroupAccentsAlerts => 'Destaques e alertas';

  @override
  String get lookAndFeelThemeColorsGroupControls => 'Superfícies e controles';

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
  String get lookAndFeelChatWallpaperStarfieldLabel => 'Campo estelar';

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
      'Indicador de digitação + avatares';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Mostrar indicador de digitação com avatares de usuário na lista de canais';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Apenas indicador de digitação';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Mostrar apenas o indicador de digitação, sem avatares';

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
  String get lookAndFeelKeyboardHintsTitle => 'Dicas de teclado';

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
  String get lookAndFeelOpenCommunitiesToLastChannelLabel =>
      'Abrir comunidades no último canal';

  @override
  String get lookAndFeelOpenCommunitiesToLastChannelDescription =>
      'Tocar em uma comunidade leva você diretamente ao último canal que você viu nela. Deslize para a direita para ver a lista de canais.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Lista de canais';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Controle o indicador de mensagens não lidas dos canais com notificações silenciadas na lista de canais.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Mostrar indicador de não lidas em canais silenciados';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Quando ativado, canais silenciados mostram um indicador de não lidas atenuado no lado esquerdo. Menções ainda aparecem independentemente desta configuração.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Ativos agora';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Controle como Ativos Agora aparece em todo o aplicativo.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Mostrar Ativos agora na tela inicial';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Mostre a seção Ativos agora na tela inicial para encontrar amigos em canais de voz. Você verá uma prévia, informações do canal, quem está lá e um atalho para participar.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Favoritos';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Controle a visibilidade dos favoritos em todo o aplicativo.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Ativar favoritos';

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
  String get favoritesWelcomeTitle => 'Boas-vindas aos favoritos';

  @override
  String get favoritesWelcomeDescription =>
      'Seu espaço pessoal para acessar rapidamente seus canais, conversas diretas e grupos favoritos. Pressione a estrela em qualquer canal para adicioná-lo aqui.';

  @override
  String get favoritesWelcomeTip =>
      'Não é para você? Desative a qualquer momento.';

  @override
  String get favoritesDisableButton => 'Desativar favoritos';

  @override
  String get favoritesAddedToast => 'Adicionado aos favoritos';

  @override
  String get favoritesRemovedToast => 'Removido dos favoritos';

  @override
  String get favoritesHiddenToast => 'Favoritos ocultos';

  @override
  String get favoritesMute => 'Silenciar favoritos';

  @override
  String get favoritesUnmute => 'Reativar notificações dos favoritos';

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
  String get favoritesOtherCategory => 'Outro';

  @override
  String get favoritesRemoveFromFavorites => 'Remover dos favoritos';

  @override
  String get favoritesAddToFavorites => 'Adicionar aos favoritos';

  @override
  String get favoritesAddToSavedMedia => 'Adicionar às mídias salvas';

  @override
  String get favoritesRemoveFromSavedMedia => 'Remover das mídias salvas';

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
  String get favoritesDirectMessageSubtitle => 'Mensagem direta';

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
      'Em comunidades novas, os canais silenciados ficarão ocultos automaticamente. Você quer aplicar essa configuração a todas as suas comunidades atuais também?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Parar de ocultar canais silenciados por padrão?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'As novas comunidades nas quais você entrar deixarão de ocultar automaticamente os canais silenciados. Você também quer mostrar os canais silenciados em todas as suas comunidades atuais?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Aplicar a todas as comunidades';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Mostrar em todas as comunidades';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Apenas comunidades novas';

  @override
  String get messagesMediaDisplaySectionTitle => 'Exibição de mídia';

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
  String get messagesMediaLinkPreviewsSectionTitle => 'Prévias de links';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Controle como links de sites são pré-visualizados no chat';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Mostrar conteúdos incorporados e prévias de links de sites';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reações';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Configure reações com emojis em mensagens';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Mostrar reações de emoji nas mensagens';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Conteúdo com spoiler';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Controle como o conteúdo de spoiler é exibido';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Mostrar conteúdo de spoiler';

  @override
  String get messagesMediaSpoilersOnClickName => 'Ao clicar';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Mostrar conteúdo com spoiler ao clicar';

  @override
  String get messagesMediaSpoilersIfModeratorName => 'Nos canais que eu modero';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Sempre mostre o conteúdo de spoiler em canais onde você tem a permissão \"Gerenciar mensagens\"';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Sempre';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Sempre mostrar conteúdo com spoiler';

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
      'Mostrar emojis padrão no preenchimento automático de expressões';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Mostrar emojis personalizados no preenchimento automático de expressões';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Mostrar figurinhas no preenchimento automático de expressões';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Mostrar mídias salvas no preenchimento automático de expressões';

  @override
  String get accessibilitySaturationTitle => 'Saturação';

  @override
  String get accessibilityVisualGroupTitle => 'Visual';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel => 'Sempre sublinhar links';

  @override
  String get accessibilityShowAltTextOnImagesLabel =>
      'Mostrar texto alternativo nas imagens';

  @override
  String get accessibilityShowAltTextOnImagesDescription =>
      'Exibir texto alternativo abaixo das imagens quando disponível.';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Escurecer texto tachado';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'Prévias de mensagens diretas';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Modo de prévia de mensagens diretas';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Todas as mensagens';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Mostrar prévias de mensagens em todas as conversas diretas';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Apenas mensagens diretas não lidas';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Mostrar prévias apenas das conversas por mensagem direta com mensagens não lidas';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Nenhum';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Não mostrar prévias de mensagens na lista de conversas por mensagem direta';

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
  String get accessibilityTtsSilenceSampleLabel => 'Amostra de silêncio';

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
  String get accessibilityStickerAnimationsTitle => 'Animações de figurinhas';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Preferência de animação de figurinhas';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Sempre animar';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'As figurinhas serão sempre animadas';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Animar ao interagir';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'As figurinhas serão animadas quando você tocar nelas';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'As figurinhas serão animadas quando você passar o mouse ou interagir com elas';

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
  String get ttsSubstitutionUnknownRole => 'cargo desconhecido';

  @override
  String get ttsSubstitutionUnknownChannel => 'canal desconhecido';

  @override
  String get ttsSubstitutionCodeBlock => 'bloco de código';

  @override
  String get ttsSubstitutionSpoiler => 'spoiler';

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
    return '$username mudou o nome do canal para $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username mudou o nome do canal.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username mudou o ícone do canal.';
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
  String get systemCallDurationFewSeconds => 'poucos segundos';

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
  String get voiceConnectionConfirmTitle => 'Confirmação de conexão de voz';

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
  String get voiceConnectionConfirmSwitch => 'Mudar para este aparelho';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Entrar (manter outras conexões)';

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
  String get voiceChannelJoin => 'Entrar no canal de voz';

  @override
  String get voiceCallJoin => 'Entrar na chamada';

  @override
  String get voiceChannelJoinConnect => 'Conectar ao chat de voz';

  @override
  String get voiceChannelNoConnectPermission =>
      'Você não tem permissão para entrar neste canal de voz';

  @override
  String get voiceChannelE2eeEncrypted =>
      'O áudio, vídeo e compartilhamento de tela são criptografados de ponta a ponta.';

  @override
  String get voiceCallE2eeEncrypted =>
      'O áudio, vídeo e compartilhamento de tela são criptografados de ponta a ponta.';

  @override
  String get voiceChannelE2eeBroken =>
      'A criptografia de ponta a ponta não está disponível porque há um participante incompatível neste canal de voz.';

  @override
  String get voiceCallE2eeBroken =>
      'A criptografia de ponta a ponta não está disponível porque há um participante incompatível nesta chamada.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Este cliente precisa ser atualizado antes de entrar nesta chamada criptografada.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Não foi possível iniciar seu microfone. Você ainda está na chamada.';

  @override
  String get voiceChannelStatusConnecting => 'Conectando…';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Celular';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Computador';

  @override
  String get voiceParticipantTooltipCommunityMuted =>
      'Silenciado pela comunidade';

  @override
  String get voiceParticipantTooltipMuted => 'Silenciado';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Surdo pela comunidade';

  @override
  String get voiceParticipantTooltipDeafened => 'Com áudio desativado';

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
  String get voiceControlDeafen => 'Desativar áudio';

  @override
  String get voiceControlUndeafen => 'Reativar áudio';

  @override
  String get voiceControlVideo => 'Vídeo';

  @override
  String get voiceControlFlipCamera => 'Virar câmera';

  @override
  String get voiceControlScreenShare => 'Compartilhar tela';

  @override
  String get voiceScreenShareNotificationText => 'Compartilhando sua tela.';

  @override
  String get voiceControlDisconnect => 'Desconectar';

  @override
  String get voiceInChat => 'No chat de voz';

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
    return 'Ping: $currentLatency ms';
  }

  @override
  String get voiceMeasuringLatency => 'Medindo a latência...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Ir para $channelSourceLabel';
  }

  @override
  String get shellResizeSidebar => 'Redimensionar barra lateral';

  @override
  String get voiceConnectionTitle => 'Conexão de voz';

  @override
  String get voiceConnectionAdvancedStats => 'Avançado';

  @override
  String get voiceShowCallAvatars => 'Mostrar avatares da chamada';

  @override
  String get voiceShowConnectionId => 'Mostrar ID da conexão';

  @override
  String get voiceAudioProcessing => 'Processamento de áudio';

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
  String get voiceParticipantMenuCommunityMute =>
      'Silenciar microfone na comunidade';

  @override
  String get voiceParticipantMenuCommunityDeafen =>
      'Desativar áudio na comunidade';

  @override
  String get voiceParticipantMenuUserVolume => 'Volume do usuário';

  @override
  String get voiceParticipantMenuStreamVolume => 'Volume da transmissão';

  @override
  String get voiceParticipantMenuStopStreaming => 'Parar transmissão';

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
  String get voiceOutputRouteSpeaker => 'Alto-falante';

  @override
  String get voiceOutputRouteEarpiece => 'Fone de ouvido';

  @override
  String get voiceOutputRouteHeadset => 'Fones de ouvido';

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
      other: '$count mensagens não lidas',
      one: '$count mensagem não lida',
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
  String get voiceWatchStream => 'Assistir à transmissão';

  @override
  String get voiceStopWatching => 'Parar de assistir';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Parar de assistir ao stream atual';

  @override
  String get voiceScreenShareEnterFullscreenTooltip => 'Tela cheia';

  @override
  String get voiceScreenShareExitFullscreenTooltip => 'Sair da tela cheia';

  @override
  String get voiceOwnScreenShareTitle => 'Você está transmitindo';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Seu stream está ao vivo para os participantes.';

  @override
  String get voiceLiveBadge => 'Ao vivo';

  @override
  String get dmVoiceViewCall => 'Ver chamada';

  @override
  String get dmVoiceCallFullScreen => 'Tela cheia';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Abrir chamada em tela cheia';

  @override
  String get dmVoiceStripStatusConnecting => 'Conectando…';

  @override
  String get dmVoiceStripStatusInCall => 'Em chamada';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Chamada de voz';

  @override
  String get dmVoiceCallBarConnecting => 'Conectando…';

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
  String get notificationsBookmarksTooltip => 'Mensagens salvas';

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
      'Incluir todas as menções da comunidade';

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
  String get notificationsJump => 'Ir para';

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
  String notificationsMentionedYouIn(String author, String place) {
    return '$author mencionou você em $place:';
  }

  @override
  String notificationsRepliedToYouIn(String author, String place) {
    return '$author respondeu a você em $place:';
  }

  @override
  String notificationsMentionedYou(String author) {
    return '$author mencionou você:';
  }

  @override
  String notificationsRepliedToYou(String author) {
    return '$author respondeu a você:';
  }

  @override
  String notificationsMentionPlace(String server, String channel) {
    return '$server – $channel';
  }

  @override
  String get notificationsSendReply => 'Enviar uma resposta';

  @override
  String get notificationsRecentActivity => 'Atividade recente';

  @override
  String get notificationsRemoveNotification => 'Remover notificação';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining caracteres restantes';
  }

  @override
  String get characterCounterTooLong => 'A mensagem é muito longa';

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
  String get chatMessageFailedToSendTapForOptions =>
      'Falha ao enviar mensagem. Toque para ver as opções.';

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
      'Sua mensagem não pôde ser entregue porque foi sinalizada pelos nossos sistemas de segurança. Se você acredita que isso é um engano, entre em contato com o suporte.';

  @override
  String get chatSendFailureContentBlockedSelfHosted =>
      'Sua mensagem não pôde ser entregue porque foi sinalizada pelos nossos sistemas de segurança. Se você acredita que isso é um engano, entre em contato com os administradores desta instância.';

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
  String get privacyDashboardDataExportSection => 'Exportação de dados';

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
      'Seu perfil completo fica visível para amigos e membros das suas comunidades com 200 membros ou menos';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Apenas amigos';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Seu perfil completo fica visível apenas para seus amigos';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Pedidos de amizade';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Todos';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Amigos de amigos';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Membros da comunidade';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Mensagens diretas';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Permitir mensagens diretas de membros da comunidade';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Permitir mensagens diretas de bots da comunidade';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Chamadas recebidas';

  @override
  String get privacyDashboardAllowedCallers => 'Quem pode ligar';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Bloquear todas as chamadas recebidas';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Permitir que apenas amigos te liguem (recomendado)';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Permitir amigos e grupos adicionais que você escolher';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Permitir que qualquer pessoa ligue para você, mesmo desconhecidos';

  @override
  String get privacyDashboardAdditionalGroups => 'Grupos Adicionais';

  @override
  String get privacyDashboardRingBehavior => 'Comportamento do toque';

  @override
  String get privacyDashboardSilentCalls => 'Chamadas silenciosas de todos';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Quem pode adicionar você a conversas em grupo';

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
  String get privacyDashboardVoiceActivityTitle =>
      'Atividade de voz em Ativos agora';

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
      'Remova permanentemente as mensagens que você enviou em conversas por mensagem direta, individuais ou em grupo, e em comunidades. O processo ocorre em segundo plano, e você receberá uma mensagem direta quando ele terminar.';

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
      'Processaremos isso o mais rápido possível. Você receberá uma mensagem direta nossa quando terminar.';

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
      'Excluir mensagens apenas de comunidades e conversas em grupo das quais você saiu ou foi removido.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Quais conversas';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Ative os tipos de conversas que você quer incluir.';

  @override
  String get privacyDashboardDataRequestKindDms =>
      'Conversas por mensagem direta abertas';

  @override
  String get privacyDashboardDataRequestKindDmsClosed =>
      'Conversas por mensagem direta fechadas';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'Conversas em grupo';

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
      'Deixe um campo em branco para não limitar essa extremidade do período.';

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
  String get privacyDashboardDataRequestDeleteMessages => 'Excluir mensagens';

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
      other: '$count comunidades',
      one: '$count comunidade',
    );
    return 'Todas, exceto $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count comunidades',
      one: '$count comunidade',
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
  String get privacyDashboardDataRequestSummaryGroupDms => 'Conversas em grupo';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Comunidades';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours horas',
      one: '$hours hora',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minutos',
      one: '$minutes minuto',
    );
    return '$_temp0 e $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours horas',
      one: '$hours hora',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minutos',
      one: '$minutes minuto',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds segundos',
      one: '$seconds segundo',
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
  String get doubleTapReactionHint => 'Toque duas vezes em uma mensagem para';

  @override
  String get doubleTapEditHint =>
      'Toque duas vezes na sua própria mensagem para editá-la';

  @override
  String get doubleTapReactionEdit => 'Editar';

  @override
  String get doubleTapReactionEditTitle => 'Editar padrão';

  @override
  String get doubleTapReactionEditSubtitle => 'Escolha o emoji de toque duplo';

  @override
  String get messagesMediaGesturesSectionTitle => 'Gestos';

  @override
  String get messagesMediaGesturesSectionDescription =>
      'Configure o toque duplo e o deslizar nas mensagens.';

  @override
  String get messagesMediaGesturesReactionLabel => 'Emoji de reação';

  @override
  String get messagesMediaGesturesReactionDescription =>
      'Usado quando o toque duplo está configurado para adicionar uma reação.';

  @override
  String get messagesMediaGesturesDoubleTapActionLabel => 'Ação do toque duplo';

  @override
  String get messagesMediaGesturesDoubleTapActionReactName =>
      'Adicionar reação';

  @override
  String get messagesMediaGesturesDoubleTapActionReactDescription =>
      'Adiciona seu emoji padrão de toque duplo como reação.';

  @override
  String get messagesMediaGesturesDoubleTapActionEditName => 'Editar mensagem';

  @override
  String get messagesMediaGesturesDoubleTapActionEditDescription =>
      'Abre o editor nas mensagens que você enviou. Outras mensagens não são afetadas.';

  @override
  String get messagesMediaGesturesDoubleTapActionNoneName => 'Nada';

  @override
  String get messagesMediaGesturesDoubleTapActionNoneDescription =>
      'O toque duplo está desativado.';

  @override
  String get messagesMediaGesturesSwipeRightToLeftLabel =>
      'Deslizar da direita para a esquerda';

  @override
  String get messagesMediaGesturesSwipeRightToLeftReplyName =>
      'Deslizar para responder';

  @override
  String get messagesMediaGesturesSwipeRightToLeftReplyDescription =>
      'Deslize uma mensagem para responder e mantenha pressionado para editar suas próprias mensagens.';

  @override
  String get messagesMediaGesturesSwipeRightToLeftChannelDetailsName =>
      'Mostrar detalhes do canal';

  @override
  String get messagesMediaGesturesSwipeRightToLeftChannelDetailsDescription =>
      'Deslize uma mensagem ou toque no cabeçalho do canal para abrir os detalhes do canal em um painel lateral.';

  @override
  String get chatMessageEdit => 'Editar mensagem';

  @override
  String get chatMessageReply => 'Responder';

  @override
  String get notificationReplyPlaceholder => 'Mensagem';

  @override
  String get notificationReplyFailed => 'Não foi possível enviar a resposta';

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
      'O envio de mensagens está desativado nesta comunidade';

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
  String get chatMessageSpeak => 'Ler mensagem em voz alta';

  @override
  String get chatMessageStopSpeaking => 'Parar leitura em voz alta';

  @override
  String get chatMessagePin => 'Fixar mensagem';

  @override
  String get chatMessageUnpin => 'Desafixar mensagem';

  @override
  String get chatMessageUnpinIt => 'Desafixar';

  @override
  String get chatMessageBookmark => 'Salvar mensagem';

  @override
  String get chatMessageRemoveBookmark => 'Remover das mensagens salvas';

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
  String get chatReactionsSheetEmpty => 'Ninguém reagiu com isso ainda.';

  @override
  String get chatReactionAddFailed => 'Falha ao adicionar reação';

  @override
  String get chatReactionRemoveFailed => 'Falha ao remover a reação';

  @override
  String get chatMessageReport => 'Denunciar mensagem';

  @override
  String get reportFlowTitleMessage => 'Denunciar mensagem';

  @override
  String get reportFlowTitleUserProfile => 'Denunciar perfil';

  @override
  String get reportFlowSummaryTitle => 'Confira sua denúncia';

  @override
  String get reportFlowSummarySubtitle =>
      'Confira se está tudo certo antes de enviar.';

  @override
  String reportFlowDisclaimer(String guidelines) {
    return 'Denuncie apenas o que você acredita honestamente que viola as regras. O uso indevido de denúncias vai contra as nossas $guidelines.';
  }

  @override
  String get reportFlowCommunityGuidelinesLink => 'diretrizes da comunidade';

  @override
  String get reportFlowDisclaimerNoLink =>
      'Denuncie apenas o que você acredita honestamente que viola as regras e não envie a mesma denúncia duas vezes.';

  @override
  String get reportFlowSelectedMessage => 'Mensagem que você está denunciando';

  @override
  String get reportFlowSelectedUser => 'Perfil que você está denunciando';

  @override
  String get reportFlowReportCategory => 'Suas respostas';

  @override
  String get reportFlowSubmit => 'Enviar denúncia';

  @override
  String get reportFlowBack => 'Voltar';

  @override
  String get reportFlowNext => 'Próximo';

  @override
  String get reportFlowDone => 'Concluído';

  @override
  String get reportFlowThankYouTitle => 'Denúncia enviada';

  @override
  String get reportFlowThankYouNoReportTitle => 'Obrigado por sinalizar isso';

  @override
  String reportFlowThankYouBody(String productName) {
    return 'A equipe de segurança do $productName vai analisar sua denúncia. Não revelaremos que ela veio de você.';
  }

  @override
  String get reportFlowThankYouNoReportBody =>
      'Obrigado por nos informar. Isso não viola nossas regras por si só, então não enviamos uma denúncia. Se for direcionado a alguém ou usar termos pejorativos, denuncie novamente e escolha “Conteúdo abusivo ou prejudicial”.';

  @override
  String get reportFlowThankYouNoReportBodyShort =>
      'Obrigado por nos informar. Isso não viola nossas regras por si só, então não enviamos uma denúncia.';

  @override
  String get reportFlowMoreYouCanDo => 'Suas opções';

  @override
  String reportFlowBlockName(String name) {
    return 'Bloquear $name';
  }

  @override
  String get reportFlowBlockDescription =>
      'Oculta as mensagens dessa pessoa e impede que ela envie mensagens para você';

  @override
  String get reportFlowBlockButton => 'Bloquear';

  @override
  String get reportFlowBlockedButton => 'Bloqueado';

  @override
  String get reportFlowUrgentBanner =>
      'Se alguém estiver em perigo imediato, entre em contato com os serviços de emergência locais primeiro.';

  @override
  String get reportFlowLoadFailed =>
      'Não foi possível carregar o formulário de denúncia.';

  @override
  String get reportFlowTryAgain => 'Tentar novamente';

  @override
  String get reportFlowOutdated =>
      'O formulário de denúncia mudou. Comece de novo.';

  @override
  String get reportFlowAlreadyReported => 'Você já denunciou esta mensagem.';

  @override
  String get reportFlowAlreadyReportedProfile =>
      'Você já denunciou este perfil hoje.';

  @override
  String get reportFlowRateLimited =>
      'Você está enviando denúncias rápido demais. Tente novamente mais tarde.';

  @override
  String get reportFlowSubmitFailed =>
      'Sua denúncia não foi enviada. Tente novamente.';

  @override
  String get reportFlowAccountSetupRequired =>
      'Reivindique sua conta e verifique seu e-mail para enviar denúncias.';

  @override
  String get chatMessageSuppressEmbeds => 'Ocultar conteúdos incorporados';

  @override
  String get chatMessageUnsuppressEmbeds =>
      'Mostrar conteúdos incorporados novamente';

  @override
  String get chatMessageDelete => 'Excluir mensagem';

  @override
  String get chatMessageDeleteConfirmTitle => 'Excluir mensagem';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Tem certeza de que deseja excluir esta mensagem?';

  @override
  String get chatMessageDeleteAttachment => 'Excluir anexo';

  @override
  String get chatMessageDeleteAttachmentConfirmDescription =>
      'Tem certeza de que deseja excluir este anexo?';

  @override
  String get chatMessageEditAttachmentAltText => 'Editar texto alternativo';

  @override
  String get chatMessageMore => 'Mais';

  @override
  String get chatEditingMessage => 'Editando mensagem';

  @override
  String get chatReplyOriginalDeleted => 'A mensagem original foi excluída';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Não foi possível carregar a mensagem original';

  @override
  String get chatReplyAttachedMedia => 'A mensagem contém mídia anexada';

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
  String get chatMessagesFailedToLoad =>
      'Não foi possível carregar as mensagens';

  @override
  String get chatReplyMentionOverrideTitle =>
      'Substituir preferência de menção?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname prefere ser @mencionado nas respostas. Enviar sem a menção mesmo assim?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname prefere respostas sem @menção. Enviar com a menção mesmo assim?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ignorar preferência';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Clique para desativar a notificação do usuário para quem você está respondendo.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Clique para ativar a notificação do usuário para quem você está respondendo.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Mencionar usuário respondido';

  @override
  String get chatReplyMentionOn => 'ATIVADO';

  @override
  String get chatReplyMentionOff => 'DESATIVADO';

  @override
  String get chatReplyCancel => 'Cancelar resposta';

  @override
  String get chatEditMessageHint => 'Editar mensagem';

  @override
  String get chatEditNoChanges => 'Nenhuma alteração para salvar';

  @override
  String get chatEditFailed => 'Sua mensagem não foi atualizada';

  @override
  String get chatEditFailedEditAgain => 'Editar novamente';

  @override
  String get chatChannelNotReady =>
      'Este canal ainda não está pronto. Tente novamente em um momento.';

  @override
  String get chatMessageEdited => '(editado)';

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
  String get mediaViewerZoomIn => 'Mais zoom';

  @override
  String get mediaViewerZoomOut => 'Reduzir zoom';

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
  String get chatImageCouldNotLoad => 'Não foi possível carregar esta imagem.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Notificar usuários com este cargo que têm permissão para ver este canal.';

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
  String get composerAutocompleteMediaHeading => 'Mídia';

  @override
  String get composerAutocompleteStickersHeading => 'Figurinhas';

  @override
  String get composerAutocompleteEmojisHeading => 'Emojis';

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
      'Expulsar um membro desta comunidade.';

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
  String get composerCommandStickerDescription => 'Enviar uma figurinha.';

  @override
  String get composerCommandGifDescription => 'Pesquisar e enviar um GIF.';

  @override
  String get composerCommandMemberOption => 'O membro ao qual aplicar a ação.';

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
      'Insira o link de convite para entrar em uma comunidade.';

  @override
  String get addGuildInviteLinkLabel => 'Link de convite';

  @override
  String get addGuildJoinSubmit => 'Entrar na comunidade';

  @override
  String get addGuildInviteInvalid => 'Este convite é inválido ou expirou.';

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
  String get addGuildCreateClaimTitle => 'Reivindique sua conta';

  @override
  String get addGuildCreateClaimDescription =>
      'Você precisa reivindicar sua conta antes de criar uma comunidade.';

  @override
  String get addGuildCreateVerifyTitle => 'Verifique seu e-mail';

  @override
  String get addGuildCreateVerifyDescription =>
      'Você precisa verificar seu endereço de e-mail antes de criar uma comunidade.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Ícones animados não são suportados ao criar uma nova comunidade. Use uma imagem estática.';

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
  String get addGuildCreateChangeIcon => 'Alterar ícone';

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
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Remover todas as reações';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Tem certeza de que deseja remover todas as reações desta mensagem?';

  @override
  String get chatMessagePinConfirm => 'Fixar';

  @override
  String get chatMessagePinConfirmDescription =>
      'Fixar esta mensagem no canal para que todos possam ver.';

  @override
  String get chatMessageUnpinConfirmTitle => 'Desafixar mensagem';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Enviar este item fixado de volta no tempo?';

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
  String get channelPinsEmptyDescription =>
      'As mensagens fixadas aparecem aqui.';

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
  String get channelDetailsDmSettingsTitle =>
      'Configurações de mensagens diretas';

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
  String get categoryUnmuteCategory => 'Reativar notificações da categoria';

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
  String get channelSettingsTopic => 'Tópico';

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
      'Isto contém conteúdo sensível.';

  @override
  String get channelSettingsUnknownRole => 'Cargo desconhecido';

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
      'Configurar permissões específicas para este cargo';

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
  String get channelSettingsWebhooksAvatar => 'Avatar';

  @override
  String get channelSettingsWebhooksUploadImage => 'Enviar imagem';

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
  String channelDuplicateHelper(String channelName) {
    return 'O novo canal usará as mesmas permissões de $channelName.';
  }

  @override
  String channelDuplicateVoiceHelper(String channelName) {
    return 'O novo canal de voz usará as mesmas permissões, limite de usuários e taxa de bits de $channelName.';
  }

  @override
  String get channelMenuMoveToCategory => 'Mover para categoria';

  @override
  String get channelMenuNoCategory => 'Sem categoria';

  @override
  String get channelMoveCategoryFullTitle => 'Categoria cheia';

  @override
  String channelMoveCategoryFullMessage(int maxChannelsPerCategory) {
    return 'Esta categoria já contém o número máximo de $maxChannelsPerCategory canais.';
  }

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Redefinir o estado de consentimento para conteúdo adulto';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Excluir suas mensagens neste canal?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Isso excluirá permanentemente todas as mensagens que você já enviou neste canal. Esta ação não pode ser desfeita.';

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
  String get channelDetailsSearchMoreFiltersActive => 'Ativo';

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
  String get channelHeaderSearchFiltersTitle => 'Filtros de busca';

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
  String get channelSearchRemoveRecent => 'Remover das buscas recentes';

  @override
  String get channelSearchFiltersButton => 'Filtros';

  @override
  String get channelSearchFilterMenuTitle => 'Filtrar resultados';

  @override
  String get channelSearchFilterFromLabel => 'De uma pessoa específica';

  @override
  String get channelSearchFilterMentionsLabel =>
      'Menciona uma pessoa específica';

  @override
  String get channelSearchFilterHasLabel => 'Tem um link, arquivo ou embed';

  @override
  String get channelSearchFilterInLabel => 'Em um canal específico';

  @override
  String get channelSearchFilterDuringLabel => 'Enviada em uma data';

  @override
  String get channelSearchFilterBeforeLabel => 'Enviada antes de uma data';

  @override
  String get channelSearchFilterAfterLabel => 'Enviada depois de uma data';

  @override
  String get channelSearchFilterPinnedLabel => 'Fixada ou não fixada';

  @override
  String get channelSearchFilterAuthorTypeLabel => 'Por tipo de autor';

  @override
  String get channelSearchDateToday => 'Hoje';

  @override
  String get channelSearchDateYesterday => 'Ontem';

  @override
  String get channelSearchTabMessages => 'Mensagens';

  @override
  String get channelSearchTabImages => 'Imagens';

  @override
  String get channelSearchTabPins => 'Fixadas';

  @override
  String get channelSearchTabLinks => 'Links';

  @override
  String get channelSearchTabFiles => 'Arquivos';

  @override
  String channelSearchTabCount(String label, int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '$label ($countString)';
  }

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
  String get channelDetailsSearchIn => 'Pesquisar em';

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
  String get channelDetailsMembersOffline => 'Offline';

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
  String get channelDetailsSearchScopeCurrentDm =>
      'Conversa por mensagem direta atual';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Todas as comunidades';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild =>
      'Somente mensagens diretas';

  @override
  String get channelDetailsSearchScopeAllDms => 'Todas as mensagens diretas';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild =>
      'Somente conversas por mensagem direta abertas';

  @override
  String get channelDetailsSearchScopeOpenDms =>
      'Conversas por mensagem direta abertas';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Todas as mensagens diretas e comunidades';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Conversas por mensagem direta abertas e comunidades';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Pesquisar apenas nesta comunidade';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Pesquisar apenas nesta conversa';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'Em todas as comunidades em que você está atualmente';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Somente nas conversas por mensagem direta das quais você já participou';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'Em todas as conversas por mensagem direta das quais você já participou';

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
  String get channelDetailsSearchContentImage => 'Envio de imagem';

  @override
  String get channelDetailsSearchContentVideo => 'Envio de vídeo';

  @override
  String get channelDetailsSearchContentAudio => 'Envio de áudio';

  @override
  String get channelDetailsSearchContentFile => 'Envio de arquivo';

  @override
  String get channelDetailsSearchContentLink => 'Link';

  @override
  String get channelDetailsSearchContentEmbed =>
      'Prévia de link ou conteúdo incorporado';

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
      'Prévias e conteúdos incorporados já processados, sem incluir uploads';

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
      'Seu espaço privado para pensamentos e lembretes';

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
  String get groupDmGroupName => 'Nome do grupo';

  @override
  String get groupDmMyGroup => 'Meu grupo';

  @override
  String get groupDmGroupNameMaxLength =>
      'O nome do grupo não pode ter mais de 100 caracteres';

  @override
  String get groupDmGroupIcon => 'Ícone do grupo';

  @override
  String get groupDmUploadIcon => 'Enviar ícone';

  @override
  String get groupDmChangeIcon => 'Alterar ícone';

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
  String get groupDmGroupFull =>
      'Este grupo está cheio. Remova alguém antes de adicionar mais pessoas.';

  @override
  String get groupDmRateLimited =>
      'Você está indo muito rápido. Espere um momento e tente novamente.';

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
  String get groupDmCopyInviteFailed =>
      'Não foi possível copiar o link do convite';

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
  String get groupDmRemoveFromGroup => 'Remover do grupo';

  @override
  String groupDmRemoveFromGroupConfirm(String userName) {
    return 'Remover $userName do grupo?';
  }

  @override
  String get groupDmRemoveFromGroupAction => 'Remover';

  @override
  String get groupDmRemovedFromGroup => 'Removido do grupo';

  @override
  String groupDmRemoveFromGroupFailed(String userName) {
    return '$userName ainda está no grupo. Tente novamente em alguns instantes.';
  }

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
    return 'Este é o início do $channelName.';
  }

  @override
  String get personalNotesComposerHint => 'Envie uma mensagem para você mesmo';

  @override
  String channelComposerHint(String channelName) {
    return 'Enviar mensagem para #$channelName';
  }

  @override
  String dmComposerHint(String recipientName) {
    return 'Enviar mensagem para @$recipientName';
  }

  @override
  String groupDmNamedComposerHint(String groupName) {
    return 'Enviar mensagem para $groupName';
  }

  @override
  String get groupDmComposerHint => 'Grupo de mensagens';

  @override
  String get composerHint => 'Mensagem';

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
  String get chatAttachmentLibraryLimitedBody =>
      'Somente as fotos e vídeos que você escolheu compartilhar aparecem aqui.';

  @override
  String get chatAttachmentLibraryLimitedManage => 'Gerenciar';

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
  String get personalNotesPrivateSpace => 'Seu espaço privado';

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
  String get userSettingsGroupYourAccount => 'Sua conta';

  @override
  String get userSettingsGroupBilling => 'Cobrança';

  @override
  String get userSettingsGroupApplication => 'Aplicativo';

  @override
  String get userSettingsGroupDeveloper => 'Desenvolvedor';

  @override
  String get userSettingsGroupStaffOnly => 'Somente equipe';

  @override
  String get userSettingsSearchPlaceholder => 'Pesquisar configurações...';

  @override
  String get userSettingsSearchClear => 'Limpar pesquisa';

  @override
  String get userSettingsSearchNoResults => 'Nenhuma configuração encontrada';

  @override
  String get userSettingsCopyLinkToSection => 'Copiar link para a seção';

  @override
  String get userSettingsCopyLinkToPage => 'Copiar link para a página';

  @override
  String userSettingsJumpLinkPremiumPage(String productName) {
    return 'Página $productName';
  }

  @override
  String get userSettingsNavProfile => 'Perfil';

  @override
  String get userSettingsNavSecurityLogin => 'Segurança e Login';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Presentes';

  @override
  String get giftSettingsClaimAccountTitle => 'Reivindique sua conta';

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
  String get premiumUpgradeNow => 'Fazer upgrade agora';

  @override
  String get premiumBuyGift => 'Comprar presente';

  @override
  String get premiumOneYearGift => 'presente de 1 ano';

  @override
  String get premiumOneMonthGift => 'presente de 1 mês';

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
  String get premiumPurchaseHistoryTitle => 'Histórico de compras';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Suas faturas recentes. Para alterar o método de pagamento da sua assinatura, adicione ou escolha um no portal de cobrança e defina-o como padrão.';

  @override
  String get premiumManagePaymentMethods => 'Gerenciar formas de pagamento';

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
  String get premiumGiftGraceEnded =>
      'Seu tempo de presente acabou. Assine para manter o Plutonium.';

  @override
  String get premiumGiftTimeAddedAfterSubscription =>
      'Você será cobrado agora. Seu tempo de presente restante será adicionado após o período pago, para que nada seja perdido.';

  @override
  String get premiumComparisonFeatureColumn => 'Recurso';

  @override
  String get premiumDisclaimerRefund =>
      'Você pode solicitar reembolsos pelo aplicativo em até 3 dias após o pagamento, uma vez a cada 30 dias. O reembolso de uma assinatura a cancela. Compradores da UE/EEE renunciam ao direito de desistência de 14 dias ao finalizar a compra para acessar o conteúdo imediatamente. Use o botão de reembolso no aplicativo em vez de contestar a cobrança. Contestações podem restringir sua conta permanentemente. A Stripe processa o pagamento com segurança. Nunca temos acesso ao número completo do seu cartão.';

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
  String get premiumPlanUnavailable =>
      'Este plano não está disponível. Entre em contato com o suporte.';

  @override
  String get premiumPlanUnavailableSelfHosted =>
      'Este plano não está disponível. Entre em contato com os administradores desta instância.';

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
  String get premiumAlreadyVisionaryTitle => 'Você já é assinante Visionary';

  @override
  String get premiumAlreadyVisionaryBody =>
      'O Visionary já inclui acesso permanente, então não é necessária uma assinatura recorrente. Você ainda pode comprar presentes para outras pessoas.';

  @override
  String get premiumExistingSubscriptionTitle => 'Assinatura já existe';

  @override
  String get premiumExistingSubscriptionBody =>
      'Encontramos uma assinatura Fluxer Plutonium existente para esta conta. Gerencie-a no portal de cobrança seguro para atualizar os detalhes de pagamento ou verificar o status de renovação. Se você acabou de pagar, aguarde um minuto e reabra esta página.';

  @override
  String get premiumPurchasesDisabledTitle => 'Compras indisponíveis';

  @override
  String premiumPurchasesDisabledBody(String supportEmail) {
    return 'As compras estão desativadas para esta conta. Entre em contato com $supportEmail se isso parecer incorreto.';
  }

  @override
  String get premiumPurchasesDisabledBodySelfHosted =>
      'As compras estão desativadas para esta conta. Entre em contato com os administradores desta instância se isso parecer incorreto.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Reivindique sua conta para comprar o Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Você precisa verificar seu e-mail antes de comprar o Fluxer Plutonium.';

  @override
  String get premiumPerkCommunities => 'Comunidades';

  @override
  String get premiumPerkMessageCharacterLimit =>
      'Limite de caracteres da mensagem';

  @override
  String get premiumPerkBookmarkedMessages => 'Mensagens salvas';

  @override
  String get premiumPerkFileUploadSize => 'Tamanho de arquivo para envio';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Usar emojis animados';

  @override
  String get premiumPerkVideoQuality => 'Qualidade do vídeo';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Avatares e banners de perfil animados';

  @override
  String get premiumPerkEarlyAccess => 'Acesso antecipado a novos recursos';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Até 4K/60fps';

  @override
  String storePlutoniumPriceLine(String monthly, String yearly) {
    return '$monthly ou $yearly';
  }

  @override
  String get storePlutoniumMonthSuffix => '/mês';

  @override
  String get storePlutoniumYearSuffix => '/ano';

  @override
  String get storePlutoniumPriceOr => 'ou';

  @override
  String get storePlutoniumEmojiTitle => 'Seus emojis, em todos os lugares';

  @override
  String get storePlutoniumEmojiBody =>
      'Leve emojis e figurinhas personalizadas de qualquer uma das suas comunidades para todos os chats e comunidades em que você participa.';

  @override
  String get storePlutoniumProfileTitle => 'Um perfil que se destaca';

  @override
  String get storePlutoniumProfileBody =>
      'Obtenha um avatar e banner animados, um selo de assinante, a tag de quatro dígitos que você quiser após seu nome de usuário*, e um perfil separado para cada comunidade.';

  @override
  String get storePlutoniumFilesTitle => 'Envie arquivos de até 500 MB';

  @override
  String get storePlutoniumFilesBody =>
      'Compartilhe vídeos completos e arquivos grandes sem precisar compactá-los. Contas gratuitas podem enviar até 25 MB.';

  @override
  String get storePlutoniumCompareTitle => 'Compare Grátis e Plutonium';

  @override
  String get storePlutoniumCompareMobileNote =>
      'Nem todos esses recursos estão disponíveis no aplicativo móvel. Alguns estão disponíveis apenas no desktop.';

  @override
  String get storePlutoniumNotAvailable => 'Não disponível';

  @override
  String get storePlutoniumAvailable => 'Disponível';

  @override
  String get storePlutoniumCompareTag =>
      'Escolha o número de 4 dígitos após seu nome de usuário*';

  @override
  String get storePlutoniumCompareProfile =>
      'Um perfil separado para cada comunidade';

  @override
  String get storePlutoniumCompareBadge => 'Selo de assinante no seu perfil';

  @override
  String get storePlutoniumCompareBackgrounds =>
      'Planos de fundo de videochamada que você pode salvar';

  @override
  String get storePlutoniumCompareCommunities =>
      'Comunidades em que você pode entrar';

  @override
  String get storePlutoniumCompareCharacters =>
      'Caracteres em uma única mensagem';

  @override
  String get storePlutoniumCompareBookmarks => 'Mensagens que você pode salvar';

  @override
  String get storePlutoniumCompareUpload =>
      'Maior arquivo que você pode enviar';

  @override
  String get storePlutoniumCompareSavedMedia =>
      'Itens de mídia que você pode salvar para mais tarde';

  @override
  String get storePlutoniumCompareAnimatedEmoji =>
      'Use emojis animados em mensagens';

  @override
  String get storePlutoniumCompareCustomEmoji =>
      'Usar emojis e figurinhas personalizados em qualquer comunidade';

  @override
  String get storePlutoniumCompareVideo =>
      'Qualidade de chamada de vídeo e compartilhamento de tela';

  @override
  String get storePlutoniumCompareAvatar => 'Avatar animado e banner de perfil';

  @override
  String get storePlutoniumCompareEarlyAccess =>
      'Acesso antecipado a novos recursos';

  @override
  String get storePlutoniumCompareThemes => 'Temas personalizados para o app';

  @override
  String get storePlutoniumVideoFree => 'Até 720p a 30 FPS';

  @override
  String get storePlutoniumVideoPlutonium => 'Até 4K a 60 FPS';

  @override
  String get storePlutoniumTagFootnote =>
      'Você só pode escolher uma tag que ninguém com o mesmo nome de usuário já tenha. Nomes de usuário não diferenciam maiúsculas de minúsculas, então Mina#4821 e mina#4821 contam como o mesmo. A tag #0000 é reservada para membros Fluxer Visionary.';

  @override
  String get storePlutoniumLearnVisionary => 'Saiba mais sobre o Visionary.';

  @override
  String get storePlutoniumDonatePrompt =>
      'Quer apenas apoiar o desenvolvimento de código aberto do Fluxer? ';

  @override
  String get storePlutoniumDonateLink => 'Doar em vez disso.';

  @override
  String get storePlutoniumHighlightsLead =>
      'A assinatura financia o Fluxer e desbloqueia';

  @override
  String get storePlutoniumHighlightEmoji =>
      'Emojis e figurinhas personalizados em qualquer chat';

  @override
  String get storePlutoniumHighlightProfile =>
      'Perfil animado, selo e número personalizado de 4 dígitos';

  @override
  String get storePlutoniumHighlightFiles => 'Uploads de até 500 MB';

  @override
  String get storePlutoniumHighlightMessages =>
      'Envie mensagens de até 4.000 caracteres';

  @override
  String get storePlutoniumHighlightCommunityProfile =>
      'Um perfil separado para cada comunidade';

  @override
  String get storePlutoniumHighlightsMore => 'E mais';

  @override
  String get storePlutoniumRenewsThroughPlay =>
      'Renova automaticamente pelo Google Play até você cancelar.';

  @override
  String get storePlutoniumRenewsThroughAppStore =>
      'Renova automaticamente pela App Store até você cancelar.';

  @override
  String get storePlutoniumRestorePurchases => 'Restaurar compras';

  @override
  String get storePlutoniumAlreadySubscribed =>
      'Você já tem uma assinatura do Fluxer Plutonium.';

  @override
  String storePlutoniumSavePercent(int percent) {
    return 'Economize $percent%';
  }

  @override
  String get storePlutoniumWaiting =>
      'Compra recebida. O Plutonium aparecerá aqui assim que for ativado.';

  @override
  String get storePlutoniumUnavailable =>
      'As assinaturas no app ainda não estão disponíveis neste dispositivo.';

  @override
  String get storePlutoniumVisionaryStatus =>
      'Visionary já inclui acesso permanente, então uma assinatura recorrente não é necessária.';

  @override
  String get userSettingsNavPrivacyDashboard => 'Painel de Privacidade';

  @override
  String get userSettingsNavAuthorizedApps => 'Aplicativos autorizados';

  @override
  String get userSettingsNavBlockedUsers => 'Usuários bloqueados';

  @override
  String get userSettingsNavLinkedDevices => 'Dispositivos vinculados';

  @override
  String get userSettingsNavConnections => 'Conexões';

  @override
  String get userSettingsNavLookAndFeel => 'Aparência';

  @override
  String get userSettingsNavAccessibility => 'Acessibilidade';

  @override
  String get userSettingsNavChat => 'Chat';

  @override
  String get userSettingsNavAudioAndVideo => 'Áudio e vídeo';

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
      'Recomendado. Melhora o áudio do microfone para uma fala mais nítida.';

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
  String get audioAndVideoMicTestStartLabel => 'Iniciar teste do microfone';

  @override
  String get audioAndVideoMicTestStopLabel => 'Parar teste do microfone';

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
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Esta instância permite compartilhamento de tela de até 720p a 30 FPS no momento.';

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
      'Preferência de menção em respostas';

  @override
  String get notificationsMentionNoPreferenceName => 'Sem preferência';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Respeitar a intenção do remetente, sem aviso quando ele ativar ou desativar a menção @';

  @override
  String get notificationsMentionPreferMentionName => 'Preferir menção';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Incluir a @menção a você por padrão nas respostas e avisar o remetente se ele a desativar';

  @override
  String get notificationsMentionPreferNoMentionName =>
      'Preferir não ser @mencionado';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Omitir a @menção a você por padrão nas respostas e avisar o remetente se ele a ativar';

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
      'Ler todas as mensagens em voz alta';

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
    return 'Reativar som de notificação de $label';
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
  String get notificationsSoundMute => 'Microfone silenciado';

  @override
  String get notificationsSoundUnmute => 'Microfone reativado';

  @override
  String get notificationsSoundDeaf => 'Áudio desativado';

  @override
  String get notificationsSoundUndeaf => 'Áudio reativado';

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
  String get notificationsSoundVoiceDisconnect => 'Chamada de voz desconectada';

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
      'Fim do compartilhamento de tela';

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
  String get notificationsPushDeliveryProviderLabel => 'Provedor de push';

  @override
  String get notificationsPushDeliveryDistributorLabel => 'Distribuidor';

  @override
  String get notificationsPushDeliveryDistributorNone => 'Nenhum selecionado';

  @override
  String get notificationsPushDeliveryDistributorSheetTitle =>
      'Escolher distribuidor';

  @override
  String get notificationsPushDeliveryDistributorPickAccessibility =>
      'Alterar distribuidor de push';

  @override
  String get notificationsPushDeliveryGatewayLabel => 'Gateway';

  @override
  String get notificationsPushDeliveryRelayLabel => 'Retransmissão Fluxer Push';

  @override
  String get notificationsPushDeliveryRelayInUse => 'Em uso';

  @override
  String get notificationsPushDeliveryRelayOff => 'Desativado';

  @override
  String get notificationsPushDeliveryRelayNotUsed => 'Não usada';

  @override
  String get notificationsPushRelaySectionTitle =>
      'Retransmissão de notificações push';

  @override
  String notificationsPushRelaySectionDescription(String pushProvider) {
    return 'A $pushProvider só entrega notificações push pelo próprio serviço, então as deste dispositivo passam pela retransmissão da Fluxer.';
  }

  @override
  String get notificationsPushRelayConsentLabel =>
      'Usar a retransmissão push da Fluxer';

  @override
  String get notificationsPushRelayConsentDescription =>
      'Se você desativar isso, o registro push deste dispositivo é removido e ele para de receber notificações push.';

  @override
  String get pushRelayConsentTitle => 'Retransmissão de notificações push';

  @override
  String pushRelayConsentDescription(String pushProvider) {
    return 'A $pushProvider só entrega notificações push pelo próprio serviço, então as deste dispositivo passam pela retransmissão da Fluxer.';
  }

  @override
  String get pushRelayConsentNoticePrefix => 'Aceite o ';

  @override
  String get pushRelayConsentNoticeLink =>
      'aviso de privacidade da retransmissão push';

  @override
  String get pushRelayConsentNoticeSuffix =>
      ' para ativar as notificações push neste dispositivo. Você só precisa aceitar uma vez por dispositivo.';

  @override
  String get pushRelayConsentAgree => 'Aceitar e continuar';

  @override
  String get pushRelayConsentDecline => 'Agora não';

  @override
  String get userSettingsNavLanguageAndTime => 'Idioma e Hora';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Idioma da interface';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Escolha o idioma usado no app';

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
    return 'Formato de hora conforme o idioma do aplicativo: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Formato de hora do sistema: $format';
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
  String get userSettingsNavAppIcon => 'Ícone do aplicativo';

  @override
  String get appIconSectionTitle => 'Ícone do aplicativo';

  @override
  String get appIconSectionDescription =>
      'Escolha qual ícone aparece na sua tela inicial.';

  @override
  String get appIconSectionDescriptionAndroid =>
      'Escolha qual ícone aparece na sua tela inicial. Trocar o ícone reinicia o app.';

  @override
  String get appIconAndroidChangeTitle => 'Trocar ícone do app?';

  @override
  String get appIconAndroidChangeDescription =>
      'O Fluxer será reiniciado para aplicar o novo ícone da tela inicial.';

  @override
  String get appIconAndroidChangeConfirm => 'Alterar ícone';

  @override
  String get appIconOptionDefault => 'Padrão';

  @override
  String get appIconOptionStarfield => 'Campo estelar';

  @override
  String get appIconOptionSweden => 'Suécia';

  @override
  String get appIconOptionGreyscale => 'Tons de cinza';

  @override
  String get appIconOptionRainbow => 'Arco-íris';

  @override
  String get appIconOptionWaves => 'Ondas';

  @override
  String get appIconOptionChromaticAberration => 'Aberração cromática';

  @override
  String get appIconOptionDefaultBrutalist => 'Brutalista';

  @override
  String get appIconOptionGreyscaleBrutalist => 'Brutalista em tons de cinza';

  @override
  String get appIconUnsupported =>
      'A alteração do ícone do aplicativo não está disponível neste dispositivo.';

  @override
  String get userSettingsNavAdvanced => 'Avançado';

  @override
  String get advancedPerformanceReportingTitle => 'Relatórios de desempenho';

  @override
  String get advancedCrashReportingSectionDescription =>
      'Ajude a Fluxer a corrigir bugs neste app compartilhando dados de falhas e desempenho. Isso vem desativado por padrão.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Enviar relatórios de falhas e desempenho';

  @override
  String get advancedCrashReportingDescription =>
      'Os relatórios vão para o rastreador de erros da Fluxer, mesmo quando você está conectado a outra instância. Eles não incluem nomes de instâncias, IDs nem conteúdo de mensagens.';

  @override
  String get observabilityReportingConsentTitle => 'Ajude a corrigir falhas';

  @override
  String get observabilityReportingConsentSubtitle =>
      'O Fluxer fechou inesperadamente. Compartilhar dados anônimos de falhas e erros nos ajuda a corrigir problemas mais rápido.';

  @override
  String get observabilityReportingConsentBody =>
      'Os relatórios incluem registros de falhas, erros e dados básicos de desempenho. Eles não são compartilhados com terceiros e você pode desativar isso a qualquer momento.';

  @override
  String observabilityReportingConsentEnableLater(String reportingToggle) {
    return 'Para ativar depois, abra Configurações → Avançado → $reportingToggle.';
  }

  @override
  String get observabilityReportingConsentAgree =>
      'Enviar relatórios de falhas';

  @override
  String get observabilityReportingConsentDecline => 'Não quero ativar';

  @override
  String get advancedSettingsConfigure => 'Configurar';

  @override
  String get advancedSettingsCategoryPrivacy => 'Privacidade';

  @override
  String get advancedSettingsCategoryAppearance => 'Aparência';

  @override
  String get advancedSettingsCategoryAccessibility => 'Acessibilidade';

  @override
  String get advancedSettingsCategoryChat => 'Chat';

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
      'Ativar miniaturas ao navegar pelo vídeo';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Miniatura ou quadro em tempo real ao percorrer o vídeo';

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
      'Atalhos de teclado nas dicas de ferramentas';

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
      'Salvar GIFs favoritos como mídias salvas';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Escolha como os GIFs favoritos marcados com estrela são armazenados';

  @override
  String get advancedSettingMediaButtonsLabel => 'Botões de mídia';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Personalize quais botões e indicadores aparecem em anexos de mídia e conteúdo incorporado';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Fazer upload dos anexos antes de enviar a mensagem';

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
  String get advancedSettingSearchEnginesLabel => 'Buscadores';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Configure os buscadores usados para o texto selecionado';

  @override
  String get advancedSettingTranslatorsLabel => 'Tradutores';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Configure os provedores de tradução usados no texto selecionado';

  @override
  String get advancedSettingReverseImageSearchLabel =>
      'Pesquisa de imagem reversa';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Buscadores para pesquisa de imagem reversa';

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
  String get advancedSettingShowMediaDeleteLabel => 'Mostrar botão de excluir';

  @override
  String get advancedSettingShowMediaDownloadLabel =>
      'Mostrar botão de download';

  @override
  String get advancedSettingShowMediaFavoriteLabel =>
      'Mostrar botão de favorito';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Mostrar botão para ocultar conteúdos incorporados';

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
      'Perguntar sobre novos dispositivos de áudio';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Controles de volume da conexão';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Mostrar controles deslizantes de volume por participante por dispositivo nos menus de voz';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Comportamento da prévia do compartilhamento de tela';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Comportamento das prévias, janelas separadas e miniaturas de transmissão';

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
  String get advancedSettingDefaultSearchEngineLabel => 'Buscador padrão';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Escolha qual buscador será usado por padrão ao pesquisar o texto selecionado.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Buscadores integrados';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Ative ou desative os buscadores integrados. Os buscadores ativados aparecem no menu de contexto da mensagem quando há texto selecionado.';

  @override
  String get advancedSettingCustomSearchEnginesLabel =>
      'Buscadores personalizados';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Adicione seus próprios mecanismos de busca com um padrão de URL personalizado. Use \'$query\' como um espaço reservado para o texto da pesquisa.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Adicionar buscador';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Ative pelo menos um buscador abaixo.';

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
      'Pesquisa de imagem reversa integrada';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Ative ou desative os provedores de busca reversa de imagem integrados. Os provedores ativados aparecem no menu de contexto de imagens, avatares, banners, figurinhas e emojis.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Pesquisa de imagem reversa personalizada';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Adicione seus próprios provedores de pesquisa reversa de imagens com um padrão de URL personalizado. Use \'$url\' como um espaço reservado para o URL da imagem.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Adicionar pesquisa de imagem reversa';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Ative pelo menos um provedor de pesquisa de imagem reversa abaixo.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Remover pesquisa de imagem reversa';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Adicionar buscador';

  @override
  String get advancedSettingEditSearchEngineTitle => 'Editar buscador';

  @override
  String get advancedSettingAddTranslatorTitle =>
      'Adicionar provedor de tradução';

  @override
  String get advancedSettingEditTranslatorTitle =>
      'Editar provedor de tradução';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Adicionar buscador de imagens reversas';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Editar buscador de imagens reversas';

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
  String get userSettingsNavDeveloperTools => 'Ferramentas do desenvolvedor';

  @override
  String get userSettingsNavLimitsConfig => 'Configuração de Limites';

  @override
  String get userSettingsNavFeatureFlags => 'Recursos';

  @override
  String get userSettingsNavWhatsNew => 'Novidades';

  @override
  String get userSettingsJoinFluxerLabs => 'Entrar no Fluxer Labs';

  @override
  String get userSettingsGiveFeedback => 'Enviar feedback';

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
  String get userSettingsLogOutConfirmTitle => 'Sair?';

  @override
  String get userSettingsLogOutConfirmDescription =>
      'Você pode entrar novamente a qualquer momento.';

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
  String get quickSwitcherNoMatchesFound => 'Nenhum resultado encontrado';

  @override
  String get quickSwitcherEmptyHint =>
      'Tente outro nome ou use os prefixos @ / # / ! / * para filtrar os resultados.';

  @override
  String get quickSwitcherSectionPeople => 'Pessoas';

  @override
  String get quickSwitcherSectionGroupMessages => 'Mensagens em grupo';

  @override
  String get quickSwitcherSectionTextChannels => 'Canais de texto';

  @override
  String get quickSwitcherSectionThreads => 'Tópicos';

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
  String get quickSwitcherUserSettingsLabel => 'Configurações de usuário';

  @override
  String get quickSwitcherNotificationsLabel => 'Notificações';

  @override
  String get quickSwitcherBookmarksLabel => 'Mensagens salvas';

  @override
  String get savedMessagesEmptyTitle => 'Nenhuma mensagem salva';

  @override
  String get savedMessagesEmptyBody =>
      'Salve mensagens para encontrá-las depois.';

  @override
  String get savedMessagesEndBody => 'Não há mais nada para ver aqui.';

  @override
  String get savedMessagesRemoveTooltip => 'Remover das mensagens salvas';

  @override
  String get savedMessagesAddedToast => 'Adicionado às mensagens salvas';

  @override
  String get savedMessagesRemovedToast => 'Removido das mensagens salvas';

  @override
  String get quickSwitcherMentionsLabel => 'Menções';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Nenhum amigo ainda';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Adicione um amigo para começar.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Nenhum amigo corresponde à pesquisa';

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
  String get quickSwitcherSearchAliasSaved => 'Salvo';

  @override
  String get uiClose => 'Fechar';

  @override
  String get chatJumpToBottom => 'Ir para o final';

  @override
  String get chatUnreadDividerNew => 'Novo';

  @override
  String get uiConfirm => 'Confirmar';

  @override
  String get uiUnderstood => 'Entendi';

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
      'Digite a URL da instância (ex: fluxer.com)';

  @override
  String get instanceUrlHelper =>
      'Use fluxer.com para a instância oficial ou a URL exata de uma instância auto-hospedada.';

  @override
  String get resetToDefaultInstance => 'Redefinir para Fluxer';

  @override
  String get instanceConnect => 'Conectar';

  @override
  String get instanceConnecting => 'Conectando…';

  @override
  String get instanceConnectFailed => 'Falha ao conectar à instância';

  @override
  String instanceConnectFailedDomain(String domain) {
    return 'Não foi possível conectar a $domain. Tente novamente.';
  }

  @override
  String get instanceInvalidDiscoveryResponse =>
      'Não foi possível ler a configuração desta instância. Verifique o endereço e tente novamente.';

  @override
  String instanceOutdatedForClient(String domain) {
    return 'Esta instância está desatualizada para este app. Peça a quem administra $domain que atualize o Fluxer.';
  }

  @override
  String instanceRequiresNewerClient(String domain) {
    return '$domain usa uma versão do Fluxer mais nova que este app. Atualize o app e tente novamente.';
  }

  @override
  String get instanceCompatibilityTitle => 'Não é possível usar esta instância';

  @override
  String get instanceCompatibilityRetry => 'Tentar novamente';

  @override
  String get instanceCompatibilityUpdateApp => 'Atualizar app';

  @override
  String get instanceCompatibilityStatusPagePrompt =>
      'Confira a página de status para atualizações.';

  @override
  String get instanceCompatibilityStatusPageLink => 'página de status';

  @override
  String get recentInstances => 'Instâncias recentes';

  @override
  String removeRecentInstance(String domain) {
    return 'Remover $domain das instâncias recentes';
  }

  @override
  String get instanceSheetTitle => 'Conectar à instância';

  @override
  String get changeInstance => 'Alterar';

  @override
  String get instanceConnectionRequired =>
      'Conecte-se à instância para fazer login';

  @override
  String get comingSoon => 'Em breve';

  @override
  String get guildNavbarDirectMessages => 'Mensagens diretas';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Explorar comunidades';

  @override
  String get discoveryExplore => 'Explorar';

  @override
  String get discoveryExplorePublicCommunities =>
      'Explorar comunidades públicas';

  @override
  String get discoveryListingSubheading =>
      'Quer listar sua comunidade aqui? Candidate-se se você atender aos requisitos em Configurações da sua comunidade > Explorar.';

  @override
  String get discoverySearchCommunities => 'Buscar comunidades';

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
  String get discoveryCategoryScienceAndTechnology => 'Ciência e tecnologia';

  @override
  String get discoveryCategoryContentCreator => 'Criador de conteúdo';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime e mangá';

  @override
  String get discoveryCategoryMoviesAndTv => 'Filmes e TV';

  @override
  String get discoveryCategoryOther => 'Outro';

  @override
  String get discoveryNoCommunitiesMatch => 'Nenhuma comunidade corresponde.';

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
  String get discoveryApps => 'Aplicativos';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Não foi possível entrar nesta comunidade';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Algo deu errado. Tente novamente em alguns instantes.';

  @override
  String get discoveryJoinErrorFullTitle => 'Esta comunidade está cheia';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Esta comunidade atingiu o limite de membros, então você não pode entrar agora.';

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
      'Você foi banido(a) desta comunidade.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Esta comunidade não está mais disponível';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Talvez ela tenha saído de Explorar ou desativado novas entradas. Atualize a página para removê-la dos resultados.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Você está indo rápido demais';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Aguarde um momento e tente novamente.';

  @override
  String get guildNavbarAddCommunity => 'Adicionar uma comunidade';

  @override
  String get guildNavbarHelp => 'Ajuda';

  @override
  String get scrollIndicatorNew => 'Novo';

  @override
  String get scrollIndicatorNewMessages => 'Novas mensagens';

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
  String get authCheckStillWorking => 'Ainda processando…';

  @override
  String get authVerificationFailed =>
      'Não foi possível concluir a verificação. Tente novamente.';

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
      'Mostrar ícone quando recolhido';

  @override
  String get guildFolderIconLabel => 'Ícone da pasta';

  @override
  String get guildFolderDelete => 'Excluir pasta';

  @override
  String get guildFolderIconFolder => 'Pasta';

  @override
  String get guildFolderIconStar => 'Estrela';

  @override
  String get guildFolderIconHeart => 'Coração';

  @override
  String get guildFolderIconBookmark => 'Salvar';

  @override
  String get guildFolderIconGameController => 'Controle de jogo';

  @override
  String get guildFolderIconShield => 'Escudo';

  @override
  String get guildFolderIconMusicNote => 'Nota musical';

  @override
  String get guildFolderMarkAsRead => 'Marcar pasta como lida';

  @override
  String get guildBulkMuteCommunities => 'Silenciar comunidades';

  @override
  String get guildBulkUnmuteCommunities =>
      'Reativar notificações das comunidades';

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
  String get guildNavbarGroupDm => 'Conversa em grupo';

  @override
  String get guildNavbarCreateChannel => 'Criar canal';

  @override
  String get guildNavbarChannelType => 'Tipo de canal';

  @override
  String get guildNavbarTextChannel => 'Canal de texto';

  @override
  String get guildNavbarTextChannelDescription =>
      'Envie mensagens, imagens, GIFs e emojis';

  @override
  String get guildNavbarVoiceChannel => 'Canal de voz';

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
  String get guildNavbarNewChannelHint => 'novo-canal';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Seleção do tipo de canal';

  @override
  String get guildNavbarPrivateChannel => 'Canal privado';

  @override
  String get guildNavbarPrivateChannelDescription =>
      'Somente membros e cargos selecionados poderão ver este canal.';

  @override
  String get guildNavbarAddMembersOrRoles => 'Adicionar membros ou cargos';

  @override
  String get guildNavbarAddMembersOrRolesHint => 'Pesquisar membros ou cargos';

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
  String get guildNavbarNoFriendsYet => 'Nenhum amigo ainda';

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
  String get guildNavbarExpireAfter => 'Expira em';

  @override
  String get guildNavbarMaxUses => 'Número máximo de usos';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Conceder Associação Temporária';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Membros serão removidos quando ficarem offline, a menos que uma função seja atribuída';

  @override
  String get guildNavbarCreateNewLink => 'Criar novo link';

  @override
  String get guildNavbarSent => 'Enviado';

  @override
  String get guildNavbarInvite => 'Convidar';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Sair da comunidade';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Tem certeza de que deseja sair desta comunidade? Você não poderá mais ver nenhuma mensagem.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Sair da comunidade';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Excluir suas mensagens nesta comunidade?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Exclua permanentemente todas as mensagens que você enviou aqui, em todos os canais. Não pode ser desfeito.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Excluir minhas mensagens';

  @override
  String get guildNavbarDeletedYourMessages => 'Suas mensagens foram excluídas';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Não foi possível excluir suas mensagens';

  @override
  String get guildNavbarRemoveOverride => 'Remover exceção';

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
      'Os convites estão pausados nesta comunidade';

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
  String get guildMenuMarkAsRead => 'Marcar como lida';

  @override
  String get guildMenuInviteMembers => 'Convidar membros';

  @override
  String get guildMenuCommunitySettings => 'Configurações da comunidade';

  @override
  String get guildMenuEditCommunityProfile => 'Editar perfil na comunidade';

  @override
  String get guildMenuUnmuteCommunity => 'Reativar notificações da comunidade';

  @override
  String get guildMenuMuteCommunity => 'Silenciar comunidade';

  @override
  String get guildMenuHideMutedChannels => 'Ocultar canais silenciados';

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
  String get guildMenuSettingsStickers => 'Figurinhas';

  @override
  String get guildMenuSettingsSafetyModeration => 'Segurança e moderação';

  @override
  String get guildMenuSettingsActivityLog => 'Registro de atividades';

  @override
  String get guildMenuSettingsWebhooks => 'Webhooks';

  @override
  String get guildMenuSettingsDiscovery => 'Explorar';

  @override
  String get guildMenuSettingsMembers => 'Membros';

  @override
  String get guildMenuSettingsInviteLinks => 'Convites';

  @override
  String get guildMenuSettingsBans => 'Banimentos';

  @override
  String get guildMenuSettingsChannels => 'Canais';

  @override
  String get guildSettingsNoPermission =>
      'Você não tem permissão para ver esta aba de configurações.';

  @override
  String get guildSettingsOverviewIconTitle => 'Ícone';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewNameTitle => 'Nome';

  @override
  String get guildSettingsOverviewNameHint => 'Minha comunidade incrível';

  @override
  String get guildSettingsCreateRole => 'Criar cargo';

  @override
  String get guildSettingsRolesListTitle => 'Cargos';

  @override
  String get guildSettingsRolesNewRole => 'Novo cargo';

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
      'Mostrar este cargo separadamente';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Lista os membros com este cargo em uma seção própria da lista de membros.';

  @override
  String get guildSettingsRolesAllowMentions => 'Permitir menções a este cargo';

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
  String get guildSettingsRolesDenseLayout => 'Layout denso';

  @override
  String get guildSettingsRolesComfyLayout => 'Layout confortável';

  @override
  String get guildSettingsRolesSingleColumn => 'Coluna única';

  @override
  String get guildSettingsRolesTwoColumns => 'Duas colunas';

  @override
  String get guildSettingsRolesNoPermissionsFound =>
      'Nenhuma permissão encontrada';

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
      'O nome do cargo é obrigatório';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Dê um nome ao cargo antes de salvar.';

  @override
  String get guildSettingsRolesCreateFailedTitle =>
      'Não foi possível criar o cargo';

  @override
  String get guildSettingsRolesUpdateFailedTitle =>
      'Não foi possível atualizar os cargos';

  @override
  String get guildSettingsRolesDeleteFailedTitle =>
      'Não foi possível excluir o cargo';

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
      'Criar, editar ou excluir cargos abaixo do seu cargo mais alto. Também permite editar as permissões específicas dos canais.';

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
      'Criar, editar ou excluir canais e categorias.';

  @override
  String get permissionKickMembers => 'Expulsar membros';

  @override
  String get permissionBanMembers => 'Banir membros';

  @override
  String get permissionCreateInviteLinks => 'Criar links de convite';

  @override
  String get permissionChangeOwnNickname => 'Alterar meu apelido';

  @override
  String get permissionChangeOwnNicknameDescription =>
      'Atualize seu próprio apelido.';

  @override
  String get permissionManageNicknames => 'Gerenciar apelidos';

  @override
  String get permissionManageNicknamesDescription =>
      'Alterar os apelidos de outros membros.';

  @override
  String get permissionCreateEmojiStickers => 'Criar emojis e figurinhas';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Enviar novos emojis e figurinhas e gerenciar suas próprias criações.';

  @override
  String get permissionManageEmojiStickers => 'Gerenciar emojis e figurinhas';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Editar ou excluir emojis e figurinhas criados por outros membros.';

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
      'Excluir mensagens de outros membros. O gerenciamento de fixação é separado.';

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
      'Mencionar todos ou qualquer cargo (mesmo que o cargo não esteja definido como mencionável).';

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
  String get permissionTimeOutMembers => 'Suspender membros temporariamente';

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
  String get permissionMuteMembers => 'Silenciar microfone dos membros';

  @override
  String get permissionDeafenMembers => 'Desativar áudio dos membros';

  @override
  String get permissionMoveMembers => 'Mover membros';

  @override
  String get permissionMoveMembersDescription =>
      'Arraste membros entre canais que eles podem acessar.';

  @override
  String get permissionSetVoiceRegion => 'Definir região de voz';

  @override
  String get permissionManageThreads => 'Gerenciar tópicos';

  @override
  String get permissionManageThreadsDescription =>
      'Renomear, arquivar, trancar e excluir tópicos, definir o modo lento deles e ver tópicos privados.';

  @override
  String get permissionCreatePublicThreads => 'Criar tópicos públicos';

  @override
  String get permissionCreatePublicThreadsDescription =>
      'Criar tópicos que todos que podem ver o canal conseguem ver.';

  @override
  String get permissionCreatePrivateThreads => 'Criar tópicos privados';

  @override
  String get permissionCreatePrivateThreadsDescription =>
      'Criar tópicos somente para convidados.';

  @override
  String get permissionSendMessagesInThreads => 'Enviar mensagens em tópicos';

  @override
  String get permissionSendMessagesInThreadsDescription =>
      'Enviar mensagens em tópicos e publicações de fórum.';

  @override
  String get threadErrorArchived => 'Este tópico está arquivado.';

  @override
  String get threadErrorLocked =>
      'Este tópico está trancado. Somente moderadores podem publicar ou reabri-lo.';

  @override
  String get threadErrorAlreadyCreated =>
      'Já existe um tópico para esta mensagem.';

  @override
  String get threadErrorMaxActiveThreads =>
      'Esta comunidade atingiu o limite de tópicos ativos.';

  @override
  String get threadErrorMaxMembers =>
      'Este tópico atingiu o limite de membros.';

  @override
  String get threadErrorMaxPinnedPosts =>
      'Só é possível fixar uma publicação neste fórum.';

  @override
  String get threadErrorMaxForumTags => 'Um fórum pode ter no máximo 20 tags.';

  @override
  String get threadErrorTagNamesUnique => 'Os nomes das tags devem ser únicos.';

  @override
  String get threadErrorNoTagsForEveryone =>
      'Adicione uma tag que todos possam usar antes de exigir tags.';

  @override
  String get threadErrorTagRequired =>
      'Escolha pelo menos uma tag para esta publicação.';

  @override
  String get threadErrorUnknownTag =>
      'Uma das tags selecionadas não existe mais.';

  @override
  String get threadErrorInvalidNotificationSettings =>
      'Essas configurações de notificação não são válidas para um tópico.';

  @override
  String get threadErrorSearchIndexNotReady =>
      'As publicações ainda estão sendo indexadas. Tente novamente em alguns instantes.';

  @override
  String get threadErrorInvalidChannelType =>
      'Esta ação não está disponível neste canal.';

  @override
  String get threadCreate => 'Criar tópico';

  @override
  String get threadName => 'Nome do tópico';

  @override
  String get threadNameRequired => 'Dê um nome ao tópico.';

  @override
  String get threadNewThreadPlaceholder => 'Novo tópico';

  @override
  String get threadPrivate => 'Tópico privado';

  @override
  String get threadPrivateDescription =>
      'Somente as pessoas que você convidar e os moderadores podem ver este tópico.';

  @override
  String get threadStarterMessage => 'Mensagem';

  @override
  String get threadStarterMessagePlaceholder =>
      'Digite uma mensagem para iniciar a conversa!';

  @override
  String threadCreateCooldown(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'Você pode criar outro tópico em $seconds segundos.',
      one: 'Você pode criar outro tópico em 1 segundo.',
    );
    return '$_temp0';
  }

  @override
  String threadCreateFailed(String detail) {
    return 'Não foi possível iniciar o tópico: $detail';
  }

  @override
  String get threadBrowserTitle => 'Tópicos';

  @override
  String get threadBrowserActive => 'Ativos';

  @override
  String get threadBrowserArchived => 'Fechados';

  @override
  String get threadBrowserJoined => 'Participando';

  @override
  String get threadBrowserOtherActive => 'Outros tópicos ativos';

  @override
  String get threadBrowserPublic => 'Tópicos públicos';

  @override
  String get threadBrowserPrivate => 'Tópicos privados';

  @override
  String get threadBrowserEmpty =>
      'Não há tópicos. Mantenha o foco em uma conversa com um tópico, um canal de texto temporário.';

  @override
  String get threadBrowserArchivedEmpty => 'Não há tópicos fechados.';

  @override
  String get threadBrowserLoadMore => 'Carregar mais';

  @override
  String get threadBrowserSearch => 'Pesquisar tópicos';

  @override
  String get threadBrowserSearchEmpty => 'Nenhum tópico corresponde';

  @override
  String get threadBrowserSearchEmptyHint =>
      'Tente outro nome ou verifique a outra aba.';

  @override
  String get threadBrowserSearchFailed =>
      'Não foi possível pesquisar os tópicos. Tente novamente mais tarde.';

  @override
  String get threadBrowserSearchIndexing =>
      'A busca está sendo preparada para esta comunidade. Tentando novamente em breve...';

  @override
  String threadMessageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mensagens',
      one: '1 mensagem',
    );
    return '$_temp0';
  }

  @override
  String get threadFailedToMentionSomeRoles =>
      'Alguns cargos mencionados não foram adicionados a este tópico.';

  @override
  String get threadMembers => 'Membros do tópico';

  @override
  String threadMembersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count membros',
      one: '1 membro',
    );
    return '$_temp0';
  }

  @override
  String get threadMembersEmpty => 'Ninguém entrou neste tópico ainda.';

  @override
  String threadRemoveMember(String name) {
    return 'Remover $name do tópico';
  }

  @override
  String get threadJoin => 'Entrar no tópico';

  @override
  String get threadLeave => 'Sair do tópico';

  @override
  String get threadJoinNotice =>
      'Entre neste tópico para segui-lo na sua lista de canais e receber notificações.';

  @override
  String get threadArchivedNotice =>
      'Este tópico está fechado. Enviar uma mensagem vai reabri-lo.';

  @override
  String get threadLockedNotice =>
      'Este tópico está trancado. Somente moderadores podem enviar mensagens.';

  @override
  String get threadArchive => 'Fechar tópico';

  @override
  String get threadUnarchive => 'Reabrir tópico';

  @override
  String get threadLock => 'Trancar tópico';

  @override
  String get threadUnlock => 'Destrancar tópico';

  @override
  String get threadDelete => 'Excluir tópico';

  @override
  String threadDeleteConfirm(String threadName) {
    return 'Tem certeza de que deseja excluir $threadName? Isso não pode ser desfeito.';
  }

  @override
  String get threadDeleted => 'Tópico excluído';

  @override
  String get threadMarkAsRead => 'Marcar como lido';

  @override
  String get threadMute => 'Silenciar tópico';

  @override
  String get threadUnmute => 'Reativar notificações do tópico';

  @override
  String get threadMuted => 'Tópico silenciado';

  @override
  String get threadUnmuted => 'Tópico dessilenciado';

  @override
  String get threadNotificationSettings => 'Configurações de notificação';

  @override
  String get threadNotificationParentDefault => 'Usar padrão do canal';

  @override
  String get threadCopyLink => 'Copiar link';

  @override
  String get threadCopyId => 'Copiar ID do tópico';

  @override
  String get threadMoreOptions => 'Mais opções';

  @override
  String get threadSettings => 'Configurações do tópico';

  @override
  String get threadSettingsSaved => 'Configurações do tópico salvas';

  @override
  String get threadAutoArchive => 'Ocultar após inatividade';

  @override
  String get threadAutoArchiveDescription =>
      'O tópico deixa de aparecer na lista de canais após esse período de inatividade.';

  @override
  String get threadDefaultAutoArchive => 'Ocultar após inatividade (padrão)';

  @override
  String get threadDefaultAutoArchiveDescription =>
      'Novos tópicos deixam de aparecer na lista de canais após esse período de inatividade.';

  @override
  String get threadDefaultSlowmode => 'Modo lento padrão dos tópicos';

  @override
  String get threadAutoArchiveOneHour => '1 hora';

  @override
  String get threadAutoArchiveOneDay => '24 horas';

  @override
  String get threadAutoArchiveThreeDays => '3 dias';

  @override
  String get threadAutoArchiveOneWeek => '1 semana';

  @override
  String get threadInvitable => 'Permitir que qualquer pessoa convide';

  @override
  String get threadInvitableDescription =>
      'Membros deste tópico privado podem adicionar outras pessoas.';

  @override
  String threadStartedBy(String name) {
    return 'Iniciado por $name';
  }

  @override
  String get threadStarterDeleted => 'A mensagem original foi excluída.';

  @override
  String systemThreadCreated(
    String username,
    String threadLink,
    String allThreadsLink,
  ) {
    return '$username iniciou um tópico: $threadLink. Veja $allThreadsLink.';
  }

  @override
  String get systemThreadCreatedAllThreadsLink => 'todos os tópicos';

  @override
  String get systemThreadCreatedThreadFallback => 'um tópico';

  @override
  String systemPreviewThreadCreated(String username) {
    return '$username iniciou um tópico.';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Ainda não há emojis personalizados.';

  @override
  String get guildSettingsStickersEmpty =>
      'Ainda não há stickers personalizados.';

  @override
  String get guildSettingsModerationVerificationTitle =>
      'Verificação de membros';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Escolha o que os membros devem ter antes de poderem postar ou enviar mensagens diretas para os membros da comunidade.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Membros com cargos podem ignorar essas verificações. Para espaços públicos, recomendamos ativar a verificação.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'As comunidades listadas em Explorar precisam de, no mínimo, verificação de e-mail. Você não pode escolher \"Nenhum\" enquanto sua comunidade estiver listada em Explorar.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Conteúdo adulto e avisos de conteúdo';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Configure a marcação de conteúdo maduro e avisos de conteúdo opcionais para os membros.';

  @override
  String get guildSettingsModerationMatureToggle => 'Conteúdo adulto';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Marque esta comunidade como contendo conteúdo maduro.';

  @override
  String get guildSettingsVerificationNone => 'Nenhum';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Nenhuma verificação é necessária.';

  @override
  String get guildSettingsVerificationLow => 'Baixa';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Exige um endereço de e-mail verificado.';

  @override
  String get guildSettingsVerificationMedium => 'Médio';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Requer um endereço de e-mail verificado e uma conta com pelo menos 5 minutos de idade.';

  @override
  String get guildSettingsVerificationHigh => 'Alta';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Exige tudo do nível médio, além de ser membro da comunidade há pelo menos 10 minutos.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Acompanhe as ações dos moderadores na comunidade.';

  @override
  String get guildSettingsAuditLogEmpty => 'Nenhum registro ainda';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'As ações de moderação e as mudanças na comunidade aparecerão aqui.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Todos os usuários';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Todas as ações';

  @override
  String get guildSettingsAuditLogNoReason => 'Nenhum motivo foi fornecido.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Usuário desconhecido';

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
  String get auditLogActionThreadCreate => 'Tópico criado';

  @override
  String get auditLogActionThreadUpdate => 'Tópico atualizado';

  @override
  String get auditLogActionThreadDelete => 'Tópico excluído';

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
  String get auditLogActionRoleDelete => 'Cargo excluído';

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
  String get auditLogActionMessageUnpin => 'Mensagem desafixada';

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
  String auditLogSummaryThreadCreate(String actor, String target) {
    return '$actor iniciou o tópico $target.';
  }

  @override
  String auditLogSummaryThreadUpdate(String actor, String target) {
    return '$actor atualizou o tópico $target.';
  }

  @override
  String auditLogSummaryThreadDelete(String actor, String target) {
    return '$actor excluiu o tópico $target.';
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
  String get auditLogChangePausedInvites => 'Pausou os convites.';

  @override
  String get auditLogChangeResumedInvites => 'Retomou os convites.';

  @override
  String get auditLogChangeTurnedOnDetachedBanner =>
      'Ativou o banner destacado.';

  @override
  String get auditLogChangeTurnedOffDetachedBanner =>
      'Desativou o banner destacado.';

  @override
  String get auditLogChangeAllowedFlexibleChannelNames =>
      'Permitiu nomes flexíveis para canais de texto.';

  @override
  String get auditLogChangeDisallowedFlexibleChannelNames =>
      'Deixou de permitir nomes flexíveis para canais de texto.';

  @override
  String get auditLogChangeHidOwnerCrown =>
      'Ocultou a coroa do proprietário da comunidade.';

  @override
  String get auditLogChangeShowedOwnerCrown =>
      'Deixou de ocultar a coroa do proprietário da comunidade.';

  @override
  String get auditLogChangeAllowedEmojiCloning =>
      'Permitiu que outras pessoas clonem os emojis desta comunidade.';

  @override
  String get auditLogChangeStoppedEmojiCloning =>
      'Deixou de permitir que outras pessoas clonem os emojis desta comunidade.';

  @override
  String get auditLogChangeAllowedStickerCloning =>
      'Permitiu que outras pessoas clonem as figurinhas desta comunidade.';

  @override
  String get auditLogChangeStoppedStickerCloning =>
      'Deixou de permitir que outras pessoas clonem as figurinhas desta comunidade.';

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
      other: 'Excluídas $count mensagens.',
      one: 'Excluída $count mensagem.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Membros removidos $count.',
      one: 'Membro removido $count.',
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
  String get guildSettingsCopiedUrl =>
      'URL copiada para a área de transferência';

  @override
  String get guildSettingsDiscoveryDescription =>
      'Liste sua comunidade em Explorar para que outras pessoas possam encontrá-la e participar.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle => 'Poucos membros';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count membros',
      one: '$count membro',
    );
    return 'Sua comunidade precisa de pelo menos $_temp0 para poder ser listada em Explorar.';
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
      'Sua comunidade está listada em Explorar. Você pode atualizar os detalhes da listagem abaixo ou retirá-la para removê-la.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Sua inscrição está aguardando análise. Você ainda pode atualizar os detalhes da página da comunidade ou retirar a inscrição.';

  @override
  String get guildSettingsDiscoveryCategory => 'Categoria';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Escolha a categoria que melhor descreve sua comunidade. Você pode mudar isso a qualquer momento.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Idioma principal';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'O idioma que a maioria da sua comunidade fala. Ele é usado para filtrar os resultados em Explorar.';

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
  String get guildSettingsDiscoveryTags => 'Etiquetas personalizadas';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Até $maxTags tags ajudam as pessoas a encontrar sua comunidade. Elas aparecem quando as pessoas pesquisam em Explorar.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint =>
      'Adicione uma etiqueta e pressione Enter';

  @override
  String get guildSettingsDiscoveryAddTag => 'Adicionar';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Remover etiqueta $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle =>
      'Não foi possível adicionar a etiqueta';

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
      'Solicitação de inclusão em Explorar enviada';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Listagem em Explorar atualizada';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Solicitação de inclusão em Explorar retirada';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Não foi possível retirar a inscrição';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Tente novamente em alguns instantes.';

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
  String get guildMembersFilterMemberSince => 'Filtrar por data de entrada';

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
  String get guildMembersFilterPast1Hour => 'Última hora';

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
  String get guildMembersJoinSourceDiscovery => 'Explorar';

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
  String get guildMembersChannelListLabel => 'Membros';

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
  String get guildSettingsInvitesLabelUses => 'Usos:';

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
  String get guildSettingsBansDescription =>
      'Ver e gerenciar usuários banidos.';

  @override
  String get guildSettingsBansSearchHint => 'Pesquisar banimentos';

  @override
  String get guildSettingsBansEmpty => 'Nenhum usuário banido.';

  @override
  String get guildSettingsBanExpiresLabel => 'Expira em';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Nenhum banimento encontrado para sua busca.';

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
  String get guildSettingsCommunitySettings => 'Configurações da comunidade';

  @override
  String get guildSettingsDeleteCommunity => 'Excluir comunidade';

  @override
  String get guildSettingsDeleteCommunityConfirm =>
      'Tem certeza de que deseja excluir esta comunidade? Esta ação não poderá ser desfeita. Todos os canais, mensagens e configurações serão excluídos permanentemente.';

  @override
  String get guildSettingsCommunityDeleted => 'Comunidade excluída';

  @override
  String get guildSettingsDeleteCommunityFailed =>
      'Não foi possível excluir esta comunidade';

  @override
  String get guildSettingsCategoryExpressions => 'Expressões';

  @override
  String get guildSettingsCategoryCommunity => 'Comunidade';

  @override
  String get guildSettingsCategoryIntegrations => 'Integrações';

  @override
  String get guildSettingsCategoryPeople => 'Pessoas';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Marca';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Atualize seu ícone, nome, banner e plano de fundo do convite';

  @override
  String get guildSettingsOverviewBannerUpload => 'Enviar banner';

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
      'Comunidades com mais de 250 pessoas são forçadas para a configuração de \"somente menções\". Sua configuração original é preservada e será restaurada se a comunidade tiver menos de 250 membros.';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Permitir nomes flexíveis para canais de texto';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Ocultar coroa do proprietário da comunidade';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Banner desanexado';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Exibe o banner em uma seção própria abaixo do cabeçalho da comunidade.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Enviar ícone';

  @override
  String get guildSettingsOverviewRemoveImage => 'Remover';

  @override
  String get guildSettingsOverviewSplashTitle => 'Plano de fundo do convite';

  @override
  String get guildSettingsOverviewEmbedSplashTitle =>
      'Plano de fundo do conteúdo incorporado no chat';

  @override
  String get guildSettingsOverviewUploadBackground => 'Enviar plano de fundo';

  @override
  String get guildSettingsOverviewNoCommunityBanner =>
      'Sem banner da comunidade';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'Sem imagem de fundo para convite';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Prévia';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Veja como seu convite aparece para os visitantes.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Nomes dos canais de texto';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Coroa do proprietário da comunidade';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Configure se o ícone da coroa é exibido ao lado do proprietário da comunidade';

  @override
  String get guildSettingsSplashCardAlignment => 'Alinhamento do cartão';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Centralizar';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Esquerda';

  @override
  String get guildSettingsSplashAlignmentRight => 'Direita';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Aplica-se apenas a telas largas.';

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
      'Abrir data de corte do histórico de mensagens';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Data de corte do histórico de mensagens';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Ativar data de corte do histórico de mensagens';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Data de corte';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Membros sem Ler Histórico de Mensagens podem ver mensagens enviadas após esta data.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Data de corte do histórico de mensagens atualizada';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Permitir letras maiúsculas e espaços nos nomes dos canais de texto. Quando desativado, os nomes ficam restritos a letras minúsculas, hífens e sublinhados.';

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
  String get guildSettingsAfkChannel => 'Canal de ausência / inatividade';

  @override
  String get guildSettingsAfkChannelHint =>
      'Mova membros para este canal quando estiverem AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Nenhum canal de ausência';

  @override
  String get guildSettingsAfkTimeout => 'Tempo limite de ausência';

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
  String get guildSettingsNoSystemChannel => 'Nenhum canal do sistema';

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
  String get guildSettingsNotificationsMentions => 'Somente menções';

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
  String get guildSettingsModerationContentFilterTitle =>
      'Filtragem de conteúdo';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Filtre automaticamente mensagens com conteúdo explícito em canais não marcados para conteúdo adulto.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'As comunidades listadas em Explorar precisam analisar as mensagens de todos os membros. Você não pode alterar esta configuração enquanto sua comunidade estiver listada em Explorar.';

  @override
  String get guildSettingsContentFilterOff => 'Desativado';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Deixar a comunidade se moderar';

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
  String get guildSettingsModeration2faTitle => 'Exigência de 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'Exija autenticação de dois fatores para moderadores antes que eles possam banir, expulsar, silenciar ou remover mensagens.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Exigir 2FA para ações de moderação';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Ative a autenticação de dois fatores na sua conta para alterar esta configuração';

  @override
  String get guildSettingsEmojiSearchHint => 'Pesquisar emojis';

  @override
  String get guildSettingsEmojiUploadTitle => 'Enviar emoji';

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
  String get guildSettingsEmojiSlotsFull =>
      'Você atingiu o número máximo de emojis. Exclua alguns emojis existentes para liberar espaço.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Os nomes dos emojis precisam ter pelo menos 2 caracteres e podem usar letras, números e sublinhados. Os emojis devem ter no máximo $maxSize. Imagens estáticas são redimensionadas para 128x128 pixels e compactadas automaticamente. Emojis animados e SVGs já devem estar dentro do limite.';
  }

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Não foi possível adicionar alguns emojis';

  @override
  String get guildSettingsEmojiRenameTitle => 'Renomear emoji';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2 a 32 caracteres, letras, números, sublinhados.';

  @override
  String get guildSettingsEmojiColumnName => 'Nome';

  @override
  String get guildSettingsEmojiColumnUploader => 'Enviado por';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Excluir emoji';

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
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Não foi possível excluir este emoji';

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
  String get guildSettingsStickerUploadTitle => 'Enviar figurinha';

  @override
  String get guildSettingsStickerDropZone =>
      'Arraste e solte um arquivo de figurinha aqui (um por vez)';

  @override
  String get guildSettingsStickerDensity => 'Densidade das figurinhas';

  @override
  String get guildSettingsStickerDensityCozy => 'Confortável';

  @override
  String get guildSettingsStickerDensityCompact => 'Compacto';

  @override
  String get guildSettingsStickersLoadFailedTitle =>
      'Não foi possível carregar as figurinhas';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Ocorreu um erro ao carregar as figurinhas. Tente novamente.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Nenhuma figurinha encontrada para sua pesquisa.';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Você atingiu o número máximo de figurinhas. Exclua algumas figurinhas existentes para liberar espaço.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'As figurinhas são salvas em 320x320 pixels e devem ter menos de $maxSize. Imagens estáticas são redimensionadas e compactadas automaticamente. Figurinhas animadas e SVGs já devem estar dentro do limite.';
  }

  @override
  String get guildSettingsStickerAddTitle => 'Adicionar figurinha';

  @override
  String get guildSettingsStickerEditTitle => 'Editar figurinha';

  @override
  String get guildSettingsStickerNameLabel => 'Nome';

  @override
  String get guildSettingsStickerNameHint => 'Minha figurinha incrível';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Descrição';

  @override
  String get guildSettingsStickerDescriptionHint => 'Descreva a figurinha';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Tags ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Adicionar uma etiqueta';

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
      'Não foi possível criar esta figurinha';

  @override
  String get guildSettingsStickerDeleteTitle => 'Excluir figurinha';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'Excluir \"$name\"? Não pode ser desfeito.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Excluir esta figurinha do armazenamento e da CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Não foi possível excluir este sticker';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Para criar um webhook, abra $channelSettingsPath. Você ainda pode editar e organizar todos os webhooks existentes aqui.';
  }

  @override
  String get guildSettingsBannedUsersTitle => 'Usuários banidos';

  @override
  String get guildSettingsInvitesTableInviter => 'Quem convidou';

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
  String get createGroupDm => 'Criar conversa em grupo';

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
  String get createDmClaimToStartDms =>
      'Reivindique sua conta para iniciar conversas por mensagem direta.';

  @override
  String get createDmVerifyToStartDms =>
      'Verifique seu e-mail para iniciar conversas por mensagem direta.';

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
      'As pessoas a seguir não podem ser adicionadas a esta conversa em grupo:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Criar a conversa em grupo com os $count destinatário(s) restantes e pular os outros?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Não há destinatários restantes para criar uma conversa em grupo.';

  @override
  String get createDmUnaddableUserNotFound => 'Usuário não encontrado';

  @override
  String get createDmUnaddableBlocked =>
      'Você não pode enviar mensagens para este usuário';

  @override
  String get createDmUnaddableNotFriends => 'Não está na sua lista de amigos';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Não permite ser adicionado a conversas em grupo';

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
  String get keybindSectionChat => 'Chat';

  @override
  String get keybindSectionVoiceAndVideo => 'Áudio e vídeo';

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
      'Alternar entre a última comunidade e as mensagens diretas';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Mudar para a comunidade anterior ou mensagens diretas';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Mudar para a próxima comunidade ou mensagens diretas';

  @override
  String get keybindActionGoToDms => 'Ir para as mensagens diretas';

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
  String get keybindActionToggleQuickSwitcher =>
      'Abrir ou fechar a navegação rápida';

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
  String get keybindActionStartGroupDm => 'Iniciar uma conversa em grupo';

  @override
  String get keybindActionTogglePinnedMessages =>
      'Abrir ou fechar mensagens fixadas';

  @override
  String get keybindActionToggleInbox => 'Abrir ou fechar a caixa de entrada';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Marcar o canal principal da caixa de entrada como lido';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Marcar todos os canais da caixa de entrada como lidos';

  @override
  String get keybindActionToggleMemberList =>
      'Mostrar ou ocultar a lista de membros ou o chat de voz';

  @override
  String get keybindActionToggleEmojiPicker => 'Abrir/fechar seletor de emojis';

  @override
  String get keybindActionToggleGifPicker => 'Abrir/fechar o seletor de GIFs';

  @override
  String get keybindActionToggleStickerPicker =>
      'Abrir ou fechar o seletor de figurinhas';

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
  String get keybindActionUploadFile => 'Enviar um arquivo';

  @override
  String get keybindActionCopyChannelLink => 'Copiar link do canal';

  @override
  String get keybindActionToggleSavedMedia => 'Abrir ou fechar mídias salvas';

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
  String get keybindActionToggleSoundboard => 'Abrir ou fechar a mesa de som';

  @override
  String get keybindActionToggleCompactCallView =>
      'Expandir ou recolher a visualização compacta da chamada';

  @override
  String get keybindActionPushToTalkPriority =>
      'Apertar para falar (prioridade)';

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
  String get keybindActionOpenThemeStudio =>
      'Abrir estúdio de temas em janela separada';

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

  @override
  String get assistantNeedsLogin => 'Abra o Fluxer e faça login primeiro.';

  @override
  String get assistantNotInVoice => 'Você não está em uma chamada.';

  @override
  String get assistantNotFound => 'O Fluxer não conseguiu encontrar isso.';

  @override
  String get assistantDmsDisabled =>
      'Mensagens diretas estão desativadas nesta instância.';

  @override
  String get assistantFailed => 'O Fluxer não conseguiu concluir isso.';

  @override
  String get assistantOkMuted => 'Microfone silenciado.';

  @override
  String get assistantOkUnmuted => 'Microfone ativado.';

  @override
  String get assistantOkLeftVoice => 'Você saiu do canal de voz.';

  @override
  String get assistantOkJoinedVoice => 'Entrando no canal de voz.';

  @override
  String get assistantOkStartedCall => 'Iniciando a chamada.';

  @override
  String assistantOkStatusSet(String status) {
    return 'Status definido como $status.';
  }

  @override
  String get assistantOkOpened => 'Abrindo o Fluxer.';

  @override
  String get assistantOkMessageSent => 'Mensagem enviada.';

  @override
  String get assistantOkCustomStatusSet => 'Status personalizado atualizado.';

  @override
  String get assistantOkCustomStatusCleared => 'Status personalizado limpo.';

  @override
  String get guildNavbarAnnouncementChannel => 'Canal de anúncios';

  @override
  String get guildNavbarAnnouncementChannelDescription =>
      'Publique atualizações que outras comunidades podem seguir em seus próprios canais';

  @override
  String get channelDetailsAnnouncementChannel => 'Canal de anúncios';

  @override
  String get channelSettingsAnnouncementChannel => 'Canal de anúncios';

  @override
  String get channelSettingsAnnouncementChannelDescription =>
      'Permite que outras comunidades sigam este canal e recebam cópias do que você publicar.';

  @override
  String get channelSettingsStopAnnouncementTitle =>
      'Parar de ser um canal de anúncios?';

  @override
  String channelSettingsStopAnnouncementBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count canais seguem este canal. Ao convertê-lo em um canal de texto, eles deixam de segui-lo.',
      one:
          '$count canal segue este canal. Ao convertê-lo em um canal de texto, ele deixa de segui-lo.',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsStopAnnouncementUnknown =>
      'Ao converter este canal em um canal de texto, todos os canais que o seguem deixam de segui-lo.';

  @override
  String get channelSettingsConvertChannel => 'Converter';

  @override
  String get channelSettingsConvertFailed =>
      'Não foi possível converter este canal';

  @override
  String get channelSettingsChannelHasFollowers =>
      'Outros canais ainda seguem este canal. Remova esses seguimentos antes de convertê-lo.';

  @override
  String get channelMenuFollow => 'Seguir canal';

  @override
  String get channelFollowTitle => 'Seguir este canal';

  @override
  String get channelFollowBody =>
      'Escolha para onde as mensagens publicadas devem ir. Você pode deixar de seguir a qualquer momento em Configurações da comunidade → Webhooks.';

  @override
  String get channelFollowCommunity => 'Comunidade';

  @override
  String get channelFollowChannel => 'Canal';

  @override
  String get channelFollowAgeWarning =>
      'Este é um canal com restrição de idade. As atualizações só podem ir para canais com restrição de idade.';

  @override
  String get channelFollowContentWarning =>
      'Este canal tem um aviso de conteúdo. Atualizações só podem ir para canais com aviso de conteúdo ou restrição de idade.';

  @override
  String get channelFollowHiddenHint =>
      'Comunidades e canais onde você não pode gerenciar webhooks são ocultados.';

  @override
  String get channelFollowEmpty =>
      'Você não pode gerenciar webhooks em nenhuma comunidade. Peça a um administrador para seguir este canal.';

  @override
  String get channelFollowSubmit => 'Seguir';

  @override
  String get channelFollowFailed => 'Não foi possível seguir este canal.';

  @override
  String get channelFollowSuccessTitle => 'Atualizações a caminho!';

  @override
  String channelFollowSuccessBody(String sourceName, String targetName) {
    return 'As mensagens publicadas em $sourceName aparecerão em #$targetName.';
  }

  @override
  String get channelFollowSuccessDismiss => 'Entendi!';

  @override
  String get channelFollowBarrier =>
      'Siga este canal para receber esses anúncios em um canal de sua escolha.';

  @override
  String get channelHeaderFollow => 'Seguir canal';

  @override
  String get chatMessagePublish => 'Publicar';

  @override
  String get chatMessagePublished => 'Publicado';

  @override
  String get chatMessagePublishConfirmTitle => 'Publicar mensagem?';

  @override
  String get chatMessagePublishConfirmBody =>
      'Isso envia uma cópia para todos os canais que seguem este.';

  @override
  String get chatMessagePublishedToast => 'Mensagem publicada';

  @override
  String get chatMessageAlreadyPublished => 'Esta mensagem já foi publicada.';

  @override
  String get chatMessagePublishFailedTitle =>
      'Não foi possível publicar esta mensagem';

  @override
  String get chatMessagePublishFailedBody =>
      'Algo deu errado. Tente novamente em um momento.';

  @override
  String get chatMessagePublishLimitTitle => 'Vá com calma';

  @override
  String chatMessagePublishLimitBody(String duration) {
    return 'Você pode publicar novamente em $duration.';
  }

  @override
  String get chatMessagePublishLimitUnknown =>
      'Você está publicando muito rápido. Tente novamente em um momento.';

  @override
  String get chatMessageDeletePublished =>
      'Isso também remove as cópias que foram enviadas para os canais que seguem este.';

  @override
  String get chatMessageEditPublishedTitle => 'Editar mensagem publicada?';

  @override
  String get chatMessageEditPublishedBody =>
      'Isso atualiza as cópias enviadas para os canais que seguem este.';

  @override
  String get chatMessageEditPublishedSave => 'Salvar';

  @override
  String get chatMessageEditLimitTitle => 'Vá com calma';

  @override
  String chatMessageEditLimitBody(String duration) {
    return 'Você pode editar esta mensagem publicada novamente em $duration.';
  }

  @override
  String get chatMessageEditLimitUnknown =>
      'Você está editando esta mensagem publicada muito rapidamente. Tente novamente em um momento.';

  @override
  String get chatMessageOriginalDeleted => '[Mensagem original excluída]';

  @override
  String get userTagCommunity => 'Comunidade';

  @override
  String systemFollowAdd(String username, String source) {
    return '$username fez este canal seguir $source. As mensagens publicadas lá aparecerão aqui.';
  }

  @override
  String systemPreviewFollowAdd(String username, String source) {
    return '$username fez este canal seguir $source.';
  }

  @override
  String get publishNudgeNotSent => 'Ainda não enviado para os seguidores.';

  @override
  String get publishNudgeHideForever => 'Não mostrar novamente';

  @override
  String get publishNudgeDismiss => 'Dispensar';

  @override
  String get channelSettingsFollowedChannels => 'Canais seguidos';

  @override
  String get channelSettingsFollowedChannelsDescription =>
      'Canais de anúncios que este canal segue. Deixe de seguir para parar de receber cópias.';

  @override
  String get guildSettingsFollowedChannelsDescription =>
      'Canais de anúncios seguidos por canais nesta comunidade.';

  @override
  String channelSettingsFollowedFrom(String guildName, String channelName) {
    return 'De $guildName #$channelName';
  }

  @override
  String get channelSettingsFollowedPaused =>
      'As atualizações estão pausadas porque o canal de origem não está mais disponível.';

  @override
  String channelSettingsUnfollowTitle(String name) {
    return 'Deixar de seguir $name?';
  }

  @override
  String get channelSettingsUnfollowBody =>
      'Este canal deixará de receber cópias daquele canal de anúncios.';

  @override
  String get channelSettingsUnfollow => 'Deixar de seguir';

  @override
  String get crosspostCommunityTitle => 'Comunidade';

  @override
  String get crosspostGoToCommunity => 'Ir para a comunidade';

  @override
  String get crosspostJoinCommunity => 'Entrar na comunidade';

  @override
  String get crosspostSourceFailed =>
      'Não foi possível carregar esta comunidade. Tente novamente em um momento.';

  @override
  String crosspostMembers(int count) {
    return '$count membros';
  }

  @override
  String crosspostOnline(int count) {
    return '$count online';
  }

  @override
  String durationMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutos',
      one: '$count minuto',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count segundos',
      one: '$count segundo',
    );
    return '$_temp0';
  }

  @override
  String get channelUnsupportedTitle => 'Tipo de canal não compatível';

  @override
  String get channelUnsupportedBody =>
      'Esta versão do aplicativo não oferece suporte a este tipo de canal.';

  @override
  String get channelDetailsUnsupportedChannel => 'Canal não compatível';

  @override
  String get forumChannelTypeForum => 'Fórum';

  @override
  String get forumChannelTypeForumDescription =>
      'Publicações organizadas por assunto e tags';

  @override
  String get forumChannelTypeMedia => 'Mídia';

  @override
  String get forumChannelTypeMediaDescription =>
      'Publicações centradas em imagens e vídeos';

  @override
  String get forumNewPost => 'Nova publicação';

  @override
  String get forumNewMediaPost => 'Nova publicação de mídia';

  @override
  String get forumSearchPosts => 'Pesquisar publicações';

  @override
  String get forumViewOptions => 'Ordenar e exibir';

  @override
  String get forumSearchIndexing =>
      'A pesquisa ainda está sendo preparada para esta comunidade. As publicações aparecerão aqui assim que estiver pronta.';

  @override
  String get forumNoPosts => 'Ainda não há postagens';

  @override
  String get forumNoPostsHint =>
      'Seja a primeira pessoa a iniciar uma conversa aqui.';

  @override
  String get forumNoSearchResults =>
      'Nenhuma postagem corresponde à sua pesquisa';

  @override
  String get forumNoSearchResultsHint =>
      'Tente outras palavras ou limpe o filtro de tags.';

  @override
  String get forumCreateFirstPost => 'Criar a primeira publicação';

  @override
  String get forumOlderPosts => 'Publicações mais antigas';

  @override
  String get forumPostsLoadFailed =>
      'Não foi possível carregar as publicações.';

  @override
  String get forumRetry => 'Tentar novamente';

  @override
  String get forumPostPinned => 'Fixada';

  @override
  String get forumPostLocked => 'Trancada';

  @override
  String get forumPostArchived => 'Arquivada';

  @override
  String get forumPostNewBadge => 'Novo';

  @override
  String get forumPostStarterDeleted => 'A mensagem original foi excluída.';

  @override
  String forumPostSnippet(String author, String content) {
    return '$author: $content';
  }

  @override
  String forumPostNewMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count novas mensagens',
      one: '$count nova mensagem',
    );
    return '$_temp0';
  }

  @override
  String get forumPostReact => 'Adicionar a reação padrão';

  @override
  String get forumOpenPost => 'Abrir publicação';

  @override
  String get forumEditTags => 'Editar tags';

  @override
  String get forumSaveTags => 'Salvar tags';

  @override
  String forumTagsLimitHint(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Escolha até $count tags.',
      one: 'Escolha até 1 tag.',
    );
    return '$_temp0';
  }

  @override
  String get forumPinPost => 'Fixar publicação';

  @override
  String get forumUnpinPost => 'Desafixar publicação';

  @override
  String get forumMarkPostRead => 'Marcar como lida';

  @override
  String get forumCopyPostLink => 'Copiar link';

  @override
  String get forumPostGuidelines => 'Diretrizes de publicação';

  @override
  String get forumGuidelinesPlaceholder =>
      'Diga às pessoas o que publicar aqui e como publicar.';

  @override
  String get forumPostTitle => 'Título';

  @override
  String get forumPostMessage => 'Mensagem';

  @override
  String get forumPostMessagePlaceholder =>
      'Escreva a primeira mensagem da sua publicação';

  @override
  String get forumPostMediaPlaceholder => 'Adicionar uma legenda';

  @override
  String get forumPostTags => 'Tags';

  @override
  String get forumPostTagsRequired => 'Tags (obrigatório)';

  @override
  String get forumPostAddMedia => 'Adicionar mídia';

  @override
  String get forumPostAddFile => 'Adicionar arquivo';

  @override
  String get forumPostRemoveAttachment => 'Remover anexo';

  @override
  String get forumPostSubmit => 'Publicar';

  @override
  String get forumPostTitleRequired => 'Dê um título à sua publicação.';

  @override
  String get forumPostMediaRequired =>
      'Adicione pelo menos uma imagem ou um vídeo para publicar aqui.';

  @override
  String get forumPostContentRequired =>
      'Escreva uma mensagem ou adicione um arquivo.';

  @override
  String get forumSortLatestActivity => 'Atividade recente';

  @override
  String get forumSortCreationTime => 'Data de publicação';

  @override
  String get forumLayoutList => 'Exibição em lista';

  @override
  String get forumLayoutGallery => 'Exibição em galeria';

  @override
  String get forumNewPostsUnread => 'Marcar novas publicações como não lidas';

  @override
  String get forumNewPostsUnreadDescription =>
      'Marcar este canal como não lido quando alguém criar uma publicação.';

  @override
  String get forumPostSlowmode => 'Modo lento de publicações';

  @override
  String forumPostSlowmodeDescription(String bypassSlowmodePermissionLabel) {
    return 'Intervalo entre a criação de publicações. Quem tem “$bypassSlowmodePermissionLabel” pode ignorá-lo.';
  }

  @override
  String get forumMessageSlowmode => 'Modo lento de mensagens nas publicações';

  @override
  String get forumMessageSlowmodeDescription =>
      'Modo lento aplicado às mensagens em novas publicações.';

  @override
  String get forumDefaultAutoArchive => 'Ocultar após inatividade';

  @override
  String get forumDefaultAutoArchiveDescription =>
      'Novas publicações são arquivadas após esse tempo sem atividade.';

  @override
  String get forumDefaultReaction => 'Reação padrão';

  @override
  String get forumSetDefaultReaction => 'Escolher um emoji';

  @override
  String get forumChangeDefaultReaction => 'Alterar';

  @override
  String get forumRemoveDefaultReaction => 'Remover';

  @override
  String get forumDefaultSortOrder => 'Ordem padrão de classificação';

  @override
  String get forumDefaultLayout => 'Layout padrão';

  @override
  String get forumTagMatchSetting => 'Filtro de tags';

  @override
  String get forumTagMatchSome => 'Corresponder a qualquer tag selecionada';

  @override
  String get forumTagMatchAll => 'Corresponder a todas as tags selecionadas';

  @override
  String get forumRequireTag => 'Exigir tags';

  @override
  String get forumRequireTagDescription =>
      'As pessoas precisam escolher pelo menos uma tag ao criar uma publicação.';

  @override
  String get forumHideMediaDownloads => 'Ocultar opções de download de mídia';

  @override
  String get forumHideMediaDownloadsDescription =>
      'Ocultar as opções de baixar, abrir no navegador e copiar link para imagens e vídeos nas publicações.';

  @override
  String forumTagsTitle(int count, int max) {
    return 'Tags ($count/$max)';
  }

  @override
  String get forumTagsDescription =>
      'As tags ajudam as pessoas a encontrar e filtrar publicações. Somente moderadores podem aplicar tags moderadas.';

  @override
  String get forumCreateTag => 'Criar tag';

  @override
  String get forumEditTag => 'Editar tag';

  @override
  String get forumSaveTag => 'Salvar tag';

  @override
  String get forumDeleteTag => 'Excluir tag';

  @override
  String get forumTagName => 'Nome da tag';

  @override
  String get forumTagEmoji => 'Emoji';

  @override
  String get forumTagRemoveEmoji => 'Remover emoji';

  @override
  String get forumTagModerated => 'Somente moderadores podem aplicar';

  @override
  String get forumTagModeratedDescription =>
      'Somente membros que podem gerenciar tópicos podem aplicar ou remover esta tag.';

  @override
  String get forumTagModeratedBadge => 'Moderada';

  @override
  String forumPostCooldown(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'Você poderá publicar novamente em $seconds segundos.',
      one: 'Você poderá publicar novamente em 1 segundo.',
    );
    return '$_temp0';
  }

  @override
  String get voiceP2pStartTitle => 'Iniciar no modo P2P?';

  @override
  String voiceP2pStartDescription(int maxParticipants) {
    return 'O áudio e o vídeo vão diretamente entre os participantes, com menor latência. Outros participantes podem ver seu endereço IP. Até $maxParticipants pessoas podem participar. Quem não conseguir se conectar diretamente não poderá participar até que alguém mude para uma chamada padrão.';
  }

  @override
  String get voiceP2pStartConfirm => 'Iniciar em modo P2P';

  @override
  String get voiceP2pStartStandard => 'Iniciar chamada padrão';

  @override
  String get voiceP2pJoinTitle => 'Entrar em uma chamada P2P?';

  @override
  String voiceP2pJoinDescription(int maxParticipants) {
    return 'Esta chamada conecta os participantes diretamente. Outros participantes podem ver seu endereço IP. Até $maxParticipants pessoas podem participar. Se você não conseguir se conectar diretamente, não poderá participar até que alguém mude para uma chamada padrão.';
  }

  @override
  String voiceP2pPinnedJoinDescription(int maxParticipants) {
    return 'Este canal só permite chamadas P2P. Os participantes se conectam diretamente e podem ver seu endereço IP. Até $maxParticipants pessoas podem participar. Se você não conseguir se conectar diretamente, não poderá participar.';
  }

  @override
  String get voiceP2pJoinConfirm => 'Entrar';

  @override
  String get voiceP2pAlwaysAgreeLabel =>
      'Não perguntar novamente, sempre concordar';

  @override
  String get voiceP2pAlwaysAgreeSettingLabel =>
      'Sempre concordar em entrar em chamadas P2P';

  @override
  String get voiceP2pAlwaysAgreeSettingDescription =>
      'Entrar em chamadas P2P sem perguntar. Outros participantes podem ver seu endereço IP.';

  @override
  String get voiceP2pIndicatorLabel => 'P2P';

  @override
  String get voiceP2pIndicatorDescription =>
      'Conexão direta. Mídia criptografada entre os participantes.';

  @override
  String get voiceP2pSwitchToStandard => 'Mudar para chamada padrão';

  @override
  String get voiceP2pSwitchToStandardDescription =>
      'Todos na chamada passam para uma chamada padrão pelo servidor.';

  @override
  String get voiceP2pPeerFailedDescription =>
      'Não foi possível estabelecer uma conexão direta. Saia da chamada ou mude todos para uma chamada padrão.';

  @override
  String get voiceP2pUnavailableError =>
      'Chamadas P2P não estão disponíveis no momento.';

  @override
  String get voiceP2pConsentRequiredError =>
      'Esta chamada é P2P e precisa da sua concordância para você entrar.';

  @override
  String get voiceChannelFullError => 'Esta chamada está cheia.';

  @override
  String get voiceP2pScreenShareUnavailable =>
      'O compartilhamento de tela deste dispositivo não está disponível em chamadas P2P.';

  @override
  String get channelMenuJoinP2p => 'Iniciar chamada P2P';

  @override
  String get channelSettingsRtcP2pLabel => 'Somente chamadas P2P';

  @override
  String channelSettingsRtcP2pDescription(int maxParticipants) {
    return 'Os participantes se conectam diretamente e podem ver os endereços IP uns dos outros. Todos precisam concordar antes de entrar. Até $maxParticipants pessoas podem participar.';
  }

  @override
  String voiceP2pPeerFailedTitle(String name) {
    return 'Não é possível conectar diretamente a $name';
  }

  @override
  String get favoritesRenameCategory => 'Renomear categoria';

  @override
  String get friendAcceptFailedTitle =>
      'Não foi possível aceitar o pedido de amizade';

  @override
  String get friendAcceptUnavailable =>
      'Esse pedido de amizade não está mais disponível. Atualize e tente novamente.';

  @override
  String get friendAcceptClaimToAccept =>
      'Conclua seu cadastro para aceitar pedidos de amizade.';

  @override
  String get friendAcceptFailedMessage =>
      'Não foi possível aceitar o pedido de amizade. Tente novamente.';

  @override
  String get friendCancelFailedTitle =>
      'Não foi possível cancelar o pedido de amizade';

  @override
  String get friendIgnoreFailedTitle =>
      'Não foi possível ignorar o pedido de amizade';

  @override
  String get friendIgnoreFailedMessage =>
      'Não foi possível ignorar o pedido de amizade. Tente novamente.';

  @override
  String get friendRemoveFailedTitle => 'Não foi possível remover o amigo';

  @override
  String get friendRemoveFailedMessage =>
      'Não foi possível remover este amigo. Tente novamente.';

  @override
  String get userBlockFailedTitle => 'Não foi possível bloquear o usuário';

  @override
  String get userBlockSystemAccount => 'Não é possível bloquear esta conta.';

  @override
  String get userBlockFailedMessage =>
      'Não foi possível bloquear este usuário. Tente novamente.';

  @override
  String get userUnblockFailedTitle => 'Não foi possível desbloquear o usuário';

  @override
  String get userUnblockFailedMessage =>
      'Não foi possível desbloquear este usuário. Tente novamente.';

  @override
  String friendCancelRequestConfirmDescription(String userName) {
    return 'Cancelar seu pedido de amizade para $userName?';
  }

  @override
  String get errorSomethingWentWrongTitle => 'Algo deu errado';

  @override
  String get errorUnexpectedTryAgain =>
      'Ocorreu um erro inesperado. Tente novamente.';

  @override
  String get errorMessagingPausedTitle => 'O envio de mensagens está pausado';

  @override
  String get errorMessagingPausedMessage =>
      'O envio de mensagens está pausado na sua conta. Confira seu e-mail para concluir uma etapa rápida e continuar.';

  @override
  String get errorFeatureDisabledTitle => 'Recurso temporariamente desativado';

  @override
  String get errorFeatureDisabledMessage =>
      'Este recurso está pausado. Tente novamente mais tarde.';

  @override
  String get dmErrorStartConversationTitle =>
      'Não foi possível iniciar esta conversa';

  @override
  String get dmErrorCannotMessageMessage =>
      'Essa pessoa pode não estar aceitando mensagens suas ou vocês não compartilham mais uma comunidade.';

  @override
  String get dmErrorUnknownUserMessage =>
      'Este usuário não existe mais. Atualize e tente novamente.';

  @override
  String get dmErrorClaimMessage =>
      'Você precisa reivindicar sua conta antes de iniciar uma conversa por mensagem direta.';

  @override
  String get dmErrorVerifyEmailMessage =>
      'Você precisa verificar seu endereço de e-mail antes de iniciar uma conversa por mensagem direta.';

  @override
  String get dmErrorTooManyRecipientsTitle => 'Este grupo tem pessoas demais';

  @override
  String get dmErrorTooManyRecipientsMessage =>
      'Você adicionou mais pessoas do que uma conversa em grupo permite. Remova algumas e tente novamente.';

  @override
  String get dmErrorMaxGroupDmsTitle =>
      'Você atingiu o limite de conversas em grupo';

  @override
  String get dmErrorMaxGroupDmsMessage =>
      'Você ou uma das pessoas que está adicionando já atingiu o número máximo de conversas em grupo abertas. Saia de uma e tente novamente.';

  @override
  String get groupDmAddFailedTitle => 'Não foi possível adicionar ao grupo';

  @override
  String get groupDmInviteFailedTitle =>
      'Não foi possível criar o link de convite';

  @override
  String get dmCloseFailedTitle => 'Não foi possível fechar a DM';

  @override
  String get groupDmLeaveFailedTitle => 'Não foi possível sair do grupo';

  @override
  String get inviteJoinFailedTitle => 'Não foi possível entrar na comunidade';

  @override
  String get inviteErrorPausedMessage =>
      'Os administradores pausaram os convites. Você não pode entrar agora.';

  @override
  String get inviteErrorAtCapacityTitle => 'Comunidade lotada';

  @override
  String get inviteErrorAtCapacityMessage =>
      'Esta comunidade atingiu o limite máximo de membros e não está aceitando novas pessoas no momento.';

  @override
  String get inviteErrorPresenceTitle => 'É preciso ter conexão com o gateway';

  @override
  String get inviteErrorPresenceMessage =>
      'Convites temporários precisam de uma conexão ativa. Verifique a sua e tente novamente.';

  @override
  String get inviteErrorBannedTitle => 'Você foi banido(a)';

  @override
  String get inviteErrorBannedMessage =>
      'Você foi banido(a) desta comunidade e não pode entrar.';

  @override
  String get inviteErrorIpBannedTitle => 'Seu IP foi banido';

  @override
  String get inviteErrorIpBannedMessage =>
      'Seu endereço de IP foi banido desta comunidade e você não pode entrar.';

  @override
  String get inviteErrorClaimTitle => 'Verificação de conta necessária';

  @override
  String get inviteErrorClaimMessage =>
      'Adicione um e-mail e senha à sua conta primeiro.';

  @override
  String get leaveCommunityFailedTitle => 'Não foi possível sair da comunidade';

  @override
  String get leaveCommunityFailedMessage =>
      'Não foi possível sair agora. Tente novamente em alguns instantes.';

  @override
  String get chatSendFailedTitle => 'Sua mensagem não foi enviada';

  @override
  String get chatSendFailedMessage => 'Tente enviar sua mensagem novamente.';

  @override
  String get chatSendTooQuickTitle =>
      'Você está enviando mensagens muito rápido';

  @override
  String get chatRateLimitedMessage =>
      'Vá com calma — espere um momento antes de tentar novamente.';

  @override
  String get chatMatureContentTitle => 'Conteúdo adulto não permitido';

  @override
  String get chatMatureContentGuildMessage =>
      'Este canal não está marcado para conteúdo adulto. Conteúdo adulto só pode ser enviado em canais marcados para conteúdo adulto. Peça a um moderador para atualizar este canal, se for o caso.';

  @override
  String chatMatureContentDmMessage(String settingsPath) {
    return 'Você ou a pessoa com quem você está conversando optou por bloquear mídias sensíveis em mensagens diretas. Cada um de vocês pode alterar isso em $settingsPath.';
  }

  @override
  String get chatMatureContentGroupDmMessage =>
      'Este grupo não está marcado para conteúdo adulto. O proprietário do grupo pode ativar o conteúdo adulto nas configurações do grupo se todos no grupo tiverem 18 anos ou mais.';

  @override
  String get chatFileTooLargeTitle => 'Arquivo muito grande';

  @override
  String chatFileTooLargeMessage(String maxSize) {
    return 'Um ou mais arquivos que você está tentando enviar excedem o limite máximo de $maxSize por arquivo.';
  }

  @override
  String get chatHeavyTitle => 'Eita, é muita coisa';

  @override
  String get chatReactionsHeavyMessage =>
      'Essa mensagem está pesada. Algumas reações precisam ser removidas antes que você possa adicionar mais.';

  @override
  String get chatReactionTimedOut =>
      'Você não pode adicionar novas reações durante sua suspensão temporária.';

  @override
  String chatTooManyAttachmentsMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arquivos',
      one: '$count arquivo',
    );
    return 'Você só pode enviar $_temp0 por vez. Tente novamente com menos arquivos.';
  }

  @override
  String get chatEditTooQuickTitle =>
      'Você está editando mensagens muito rápido';

  @override
  String get chatEditFailedMessage => 'Tente editar sua mensagem novamente.';

  @override
  String get chatDeleteTooQuickTitle =>
      'Você está excluindo mensagens muito rápido';

  @override
  String get chatDeleteTooQuickMessage =>
      'Aguarde um momento antes de excluir mais mensagens.';

  @override
  String get chatDeleteFailedTitle => 'Não foi possível excluir a mensagem';

  @override
  String get chatDeleteFailedMessage => 'Tente excluir a mensagem novamente.';

  @override
  String get chatAttachmentDeleteFailedTitle =>
      'Não foi possível excluir o anexo';

  @override
  String get chatAttachmentDeleteFailedMessage =>
      'Tente excluir esse anexo novamente.';

  @override
  String get chatAltTextFailedTitle =>
      'Não foi possível atualizar o texto alternativo';

  @override
  String get chatAltTextUnknownMessage => 'Esta mensagem não existe mais.';

  @override
  String get chatAltTextNoPermission => 'Você não pode editar esta mensagem.';

  @override
  String get chatAltTextUnavailable =>
      'A edição está temporariamente indisponível. Tente novamente mais tarde.';

  @override
  String get chatAltTextFailedMessage =>
      'Não foi possível atualizar o texto alternativo. Tente novamente.';

  @override
  String get chatPinFailedTitle => 'Não foi possível fixar a mensagem';

  @override
  String get chatUnpinFailedTitle => 'Não foi possível desafixar a mensagem';

  @override
  String get chatPinFailedMessage =>
      'Algo deu errado. Tente novamente mais tarde.';

  @override
  String get chatPinBlockedMessage =>
      'Você não pode interagir com este usuário agora.';

  @override
  String get bookmarkLimitTitle => 'Limite de mensagens salvas atingido';

  @override
  String bookmarkLimitMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mensagens salvas',
      one: '$count mensagem salva',
    );
    return 'Você tem $_temp0. Remova uma para adicionar outra.';
  }

  @override
  String get savedMediaLimitTitle => 'Limite de mídias salvas atingido';

  @override
  String savedMediaLimitMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count itens de mídia salvos',
      one: '$count item de mídia salvo',
    );
    return 'Você atingiu o limite de $_temp0. Remova um para adicionar outro.';
  }

  @override
  String get errorContentBlockedTitle => 'Conteúdo bloqueado';

  @override
  String get errorContentBlockedMessage =>
      'Não foi possível concluir sua ação porque ela foi sinalizada pelos nossos sistemas de segurança. Se você acredita que isso é um engano, entre em contato com o suporte.';

  @override
  String get errorContentBlockedSelfHostedMessage =>
      'Não foi possível concluir sua ação porque ela foi sinalizada pelos nossos sistemas de segurança. Se você acredita que isso é um engano, entre em contato com os administradores desta instância.';

  @override
  String get channelDeletedToast => 'Canal excluído';

  @override
  String get categoryDeletedToast => 'Categoria excluída';

  @override
  String get channelDeleteNoPermissionTitle =>
      'Você não pode excluir este item';

  @override
  String get channelDeleteNoPermissionChannel =>
      'Você não tem permissão para excluir este canal.';

  @override
  String get channelDeleteNoPermissionCategory =>
      'Você não tem permissão para excluir esta categoria.';

  @override
  String get channelDeleteAlreadyDeletedTitle => 'Já excluído';

  @override
  String get channelDeleteAlreadyDeletedChannel =>
      'Este canal não existe mais. Ele pode já ter sido excluído.';

  @override
  String get channelDeleteAlreadyDeletedCategory =>
      'Esta categoria não existe mais. Ela pode já ter sido excluída.';

  @override
  String get channelDeleteFailedChannelTitle =>
      'Não foi possível excluir este canal';

  @override
  String get channelDeleteFailedCategoryTitle =>
      'Não foi possível excluir esta categoria';

  @override
  String get channelPermissionsUpdateFailedTitle =>
      'Não foi possível atualizar as permissões do canal';

  @override
  String get channelSettingsSaveFailedTitle =>
      'Não foi possível salvar as configurações do canal';

  @override
  String get emojiSlotsFullTitle => 'Nenhum espaço para emoji disponível';

  @override
  String get stickerSlotsFullTitle =>
      'Nenhum espaço para figurinhas disponível';

  @override
  String get emojiSomeFailedMessage =>
      'Revise estes arquivos e tente novamente com imagens menores ou mais simples.';

  @override
  String get emojiNameInvalidCharacters =>
      'Nomes de emoji só podem conter letras, números e underscores.';

  @override
  String get emojiErrorGoneTitle => 'Este emoji não existe mais';

  @override
  String get emojiRenameGoneMessage =>
      'Ele pode ter sido excluído. O nome foi revertido para o que era antes.';

  @override
  String get emojiRenameNoPermissionTitle =>
      'Você não pode renomear este emoji';

  @override
  String get emojiRenameNoPermissionMessage =>
      'Você não tem permissão para renomear este emoji. O nome foi revertido para o anterior.';

  @override
  String get emojiRenameRateLimitedMessage =>
      'Aguarde um momento e tente renomear novamente.';

  @override
  String get emojiRenameFailedMessage =>
      'O nome foi revertido para o que era antes. Tente novamente em alguns instantes.';

  @override
  String get emojiDeleteGoneMessage => 'Parece que já foi excluído.';

  @override
  String get emojiDeleteNoPermissionTitle =>
      'Não é possível excluir este emoji';

  @override
  String get emojiDeleteNoPermissionMessage =>
      'Você não tem permissão para excluir este emoji.';

  @override
  String get emojiDeleteRateLimitedMessage =>
      'Aguarde um momento e tente excluir novamente.';

  @override
  String get stickerTooLargeTitle => 'A figurinha é muito grande';

  @override
  String stickerTooLargeMessage(String maxSize) {
    return 'O serviço de upload rejeitou esta figurinha por ter mais de $maxSize. Tente um arquivo menor, uma imagem mais simples ou uma animação mais curta.';
  }

  @override
  String get stickerCreateFailedMessage =>
      'Algo deu errado ao preparar esta figurinha. Tente outro arquivo ou tente novamente em alguns instantes.';

  @override
  String get stickerUpdateFailedTitle =>
      'Não foi possível atualizar esta figurinha';

  @override
  String get moderationTimeoutFailed =>
      'Não foi possível suspender temporariamente o membro. Tente novamente.';

  @override
  String get moderationRemoveTimeoutFailed =>
      'Não foi possível remover a suspensão temporária. Tente novamente.';

  @override
  String get moderationKickFailed =>
      'Não foi possível expulsar o membro. Tente novamente.';

  @override
  String get moderationBanFailed =>
      'Não foi possível banir o membro. Tente novamente.';

  @override
  String get transferOwnershipFailedTitle =>
      'Não foi possível transferir a propriedade';

  @override
  String transferOwnershipFailedMessage(String username) {
    return 'Não foi possível transferir a propriedade para $username no momento.';
  }

  @override
  String get revokeBanFailedTitle => 'Não foi possível revogar o banimento';

  @override
  String get voiceModerationNoPermissionTitle => 'Você não pode fazer isso';

  @override
  String get voiceModerationNoPermissionMessage =>
      'Você não tem permissão para fazer isso com este membro.';

  @override
  String get voiceModerationLeftTitle => 'A pessoa saiu da chamada';

  @override
  String get voiceModerationLeftMessage =>
      'Este membro não está mais conectado ao canal de voz.';

  @override
  String get voiceModerationUnknownMemberTitle => 'Membro não encontrado';

  @override
  String get voiceModerationUnknownMemberMessage =>
      'Este membro não está mais na comunidade. Atualize e tente novamente.';

  @override
  String get voiceJoinTimedOut =>
      'Você não pode entrar durante sua suspensão temporária.';

  @override
  String get voiceJoinClaimAccount =>
      'Reivindique sua conta para entrar neste canal de voz.';

  @override
  String get voiceJoinClaimAccountDirectCall =>
      'Reivindique sua conta para iniciar ou participar de chamadas individuais.';

  @override
  String get voiceJoinUserLimit =>
      'Este canal de voz atingiu o limite de usuários. Tente novamente mais tarde ou entre em outro canal.';

  @override
  String get voiceJoinConnectionLimit =>
      'Você atingiu o limite de conexões deste canal de voz.';

  @override
  String get voiceJoinChannelUnavailable =>
      'Este canal de voz não está mais disponível.';

  @override
  String get avatarUploadFailedTitle => 'Não foi possível enviar o avatar';

  @override
  String get bannerUploadFailedTitle => 'Não foi possível enviar o banner';

  @override
  String get animatedImageUseStatic => 'Envie uma imagem estática.';

  @override
  String get passkeyDeleteFailedTitle =>
      'Não foi possível excluir a chave de acesso';

  @override
  String get premiumPaymentsUnavailableTitle => 'Pagamentos indisponíveis';

  @override
  String get premiumPaymentsUnavailableMessage =>
      'Os pagamentos estão temporariamente indisponíveis. Tente novamente em alguns instantes.';

  @override
  String get premiumNoSubscriptionTitle => 'Nenhuma assinatura ativa';

  @override
  String get premiumNoSubscriptionMessage =>
      'Não conseguimos encontrar uma assinatura ativa nesta conta. Atualize e tente novamente.';

  @override
  String get premiumAlreadyCancelingTitle => 'Cancelamento já agendado';

  @override
  String get premiumAlreadyCancelingMessage =>
      'Sua assinatura já está programada para ser cancelada no fim do período de faturamento.';

  @override
  String get premiumNotCancelingTitle =>
      'O cancelamento da assinatura não está agendado';

  @override
  String get premiumNotCancelingMessage =>
      'Sua assinatura não está configurada para ser cancelada, então não há nada para reativar.';

  @override
  String get premiumCancelFailedTitle =>
      'Não foi possível cancelar sua assinatura';

  @override
  String get premiumCancelFailedMessage =>
      'Algo deu errado ao cancelar sua assinatura. Tente novamente em alguns instantes.';

  @override
  String get premiumReactivateFailedTitle =>
      'Não foi possível reativar sua assinatura';

  @override
  String get premiumReactivateFailedMessage =>
      'Ocorreu um erro ao reativar sua assinatura. Tente novamente em alguns instantes.';

  @override
  String get premiumRefundConfirmTitle => 'Reembolsar sua compra mais recente?';

  @override
  String get premiumRefundConfirmBody =>
      'Isso reembolsa sua fatura mais recente e cancela qualquer assinatura associada. Você não poderá solicitar outro reembolso pelo aplicativo por 30 dias.';

  @override
  String get premiumRefundConfirm => 'Reembolsar compra';

  @override
  String get premiumRefundIssuedToast =>
      'Reembolso emitido. Pode levar alguns dias úteis para aparecer.';

  @override
  String get premiumRefundOutsideWindowTitle => 'Fora do prazo de reembolso';

  @override
  String get premiumRefundOutsideWindowMessage =>
      'Sua compra mais recente não está mais dentro do período de reembolso. Entre em contato com o suporte para problemas de cobrança.';

  @override
  String get premiumRefundCooldownTitle => 'Você fez um reembolso recentemente';

  @override
  String get premiumRefundCooldownMessage =>
      'Você já solicitou um reembolso pelo aplicativo recentemente. Poderá solicitar outro quando o período de espera terminar.';

  @override
  String get premiumRefundNothingTitle => 'Nada a reembolsar';

  @override
  String get premiumRefundNothingMessage =>
      'Não foi possível encontrar uma compra recente para reembolsar nesta conta.';

  @override
  String get premiumRefundFailedTitle =>
      'Não foi possível reembolsar esta compra';

  @override
  String get premiumRefundFailedMessage =>
      'Algo deu errado ao emitir seu reembolso. Entre em contato com o suporte se isso continuar acontecendo.';

  @override
  String get premiumVerifyEmailTitle => 'Verifique seu e-mail primeiro';

  @override
  String premiumVerifyEmailBody(String productName) {
    return 'Você precisa verificar seu e-mail antes de comprar $productName.';
  }

  @override
  String get premiumCheckoutBlockedTitle =>
      'Finalização de compra indisponível';

  @override
  String premiumCheckoutBlockedBody(String supportEmail) {
    return 'A finalização da compra está bloqueada para esta conta. Entre em contato com $supportEmail se precisar de ajuda.';
  }

  @override
  String get premiumCheckoutBlockedBodySelfHosted =>
      'A finalização da compra está bloqueada para esta conta.';
}
