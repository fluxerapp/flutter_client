// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class FluxerLocalizationsFr extends FluxerLocalizations {
  FluxerLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get reconnectingTitle => 'Nous avons fait une boulette !';

  @override
  String get reconnectingBody =>
      'Il y a un problème avec les serveurs.\nÇa devrait être réglé dans une seconde !';

  @override
  String get gatewayReconnectingToast => 'Reconnexion…';

  @override
  String get gatewayConnectedToast => 'Connecté';

  @override
  String get sessionExpiredToast =>
      'Votre session a expiré. Veuillez vous reconnecter.';

  @override
  String splashStartupFailed(String error) {
    return 'Échec du démarrage : $error';
  }

  @override
  String get retry => 'Réessayer';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Connexion perdue';

  @override
  String get splashViewOnStatusPage => 'Voir sur la page d\'état';

  @override
  String get splashConnectionIssuesPrompt => 'Problèmes de connexion ?';

  @override
  String get splashStatusPageLink => 'Page d\'état';

  @override
  String get splashReadIncident => 'Lire l\'incident';

  @override
  String get splashIncidentHistory => 'Historique des incidents';

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
  String get welcomeBack => 'De retour parmi nous';

  @override
  String get email => 'Adresse e-mail';

  @override
  String get emailInvalid => 'Veuillez saisir une adresse e-mail valide.';

  @override
  String get password => 'Mot de passe';

  @override
  String get forgotPassword => 'Mot de passe oublié ?';

  @override
  String get logIn => 'Se connecter';

  @override
  String get logInWithPasskey => 'Se connecter avec une clé d\'accès';

  @override
  String continueWithSso(String provider) {
    return 'Continuer avec $provider';
  }

  @override
  String get ssoRequired =>
      'L\'authentification unique est requise pour accéder à cette instance.';

  @override
  String get organizationSsoProvider =>
      'Connectez-vous avec le fournisseur d\'authentification unique de votre organisation.';

  @override
  String get failedToStartSso =>
      'Échec du démarrage de l\'authentification unique';

  @override
  String get ssoCancelled =>
      'La connexion via authentification unique a été annulée';

  @override
  String preferSso(String provider) {
    return 'Vous préférez utiliser l\'authentification unique ? Continuez avec $provider.';
  }

  @override
  String get logInViaBrowser => 'Se connecter via le navigateur';

  @override
  String get needAccountPrompt => 'Besoin d\'un compte ? ';

  @override
  String get register => 'S\'inscrire';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Vérifiez que vous êtes humain';

  @override
  String get captchaDescription =>
      'Nous devons nous assurer que vous n\'êtes pas un robot. Veuillez compléter la vérification ci-dessous.';

  @override
  String get captchaSwitchToHcaptcha =>
      'Problèmes ? Essayez hCaptcha à la place';

  @override
  String get captchaSwitchToTurnstile => 'Essayez Turnstile à la place';

  @override
  String get cancel => 'Annuler';

  @override
  String get ipAuthCheckEmail => 'Vérifiez votre e-mail';

  @override
  String ipAuthDescription(String email) {
    return 'Nous avons envoyé un lien par e-mail pour autoriser cette connexion. Veuillez ouvrir votre boîte de réception pour $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Connexion perdue';

  @override
  String get ipAuthConnectionLostDescription =>
      'Nous avons perdu la connexion en attendant l\'autorisation. Veuillez réessayer.';

  @override
  String get ipAuthLinkExpired => 'Le lien de connexion a expiré';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Ce lien d\'autorisation a expiré. Veuillez vous reconnecter.';

  @override
  String get ipAuthResendEmail => 'Renvoyer l\'e-mail';

  @override
  String get ipAuthResent => 'Renvoyé';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Retour';

  @override
  String get mfaTitle => 'Authentification à deux facteurs';

  @override
  String get mfaChooseMethod => 'Choisissez une méthode de vérification';

  @override
  String get mfaMethodTotp => 'Application d\'authentification';

  @override
  String get mfaMethodWebauthn => 'Clé de sécurité / Clé d\'accès';

  @override
  String get mfaTotpDescription =>
      'Entrez le code à 6 chiffres de votre application d\'authentification ou l\'un de vos codes de secours.';

  @override
  String get mfaCodeLabel => 'Code';

  @override
  String get mfaTryAnotherMethod => 'Essayer une autre méthode';

  @override
  String get mfaUseSecurityKey =>
      'Essayez une clé de sécurité / passkey à la place';

  @override
  String get accountSelectorTitle => 'Choisissez un compte';

  @override
  String get accountSelectorDescription =>
      'Sélectionnez un compte pour continuer, ou ajoutez-en un autre.';

  @override
  String get accountAdd => 'Ajouter un compte';

  @override
  String get accountRemove => 'Supprimer';

  @override
  String accountRemoveTitle(String username) {
    return 'Supprimer $username';
  }

  @override
  String get accountRemoveDescription =>
      'Ceci supprimera la session enregistrée pour ce compte.';

  @override
  String get accountRemoveOnlyDescription =>
      'Ceci supprimera le seul compte enregistré sur cet appareil.';

  @override
  String get accountExpired => 'Expiré';

  @override
  String accountSessionExpired(String identifier) {
    return 'Session expirée pour $identifier. Veuillez vous reconnecter.';
  }

  @override
  String get accountManageTitle => 'Gérer les comptes';

  @override
  String get accountSwitchFailed =>
      'Impossible de changer de compte. Réessayez.';

  @override
  String get profileTabMenuSwitchAccounts => 'Changer de compte';

  @override
  String get statusChangeSheetTitle => 'Définir le statut';

  @override
  String get statusOnlineStatusSection => 'Statut en ligne';

  @override
  String get statusOnline => 'En ligne';

  @override
  String get statusIdle => 'Inactif';

  @override
  String get statusDnd => 'Ne pas déranger';

  @override
  String get statusInvisible => 'Invisible';

  @override
  String get statusOffline => 'Hors ligne';

  @override
  String get statusUntilIChangeIt => 'Jusqu\'à ce que je le change';

  @override
  String get statusDontClear => 'Ne pas effacer';

  @override
  String get statusFor10Seconds => 'Pendant 10 secondes';

  @override
  String get statusClearAfter10Seconds => '10 secondes';

  @override
  String get statusClearAfter15Minutes => '15 minutes';

  @override
  String get statusClearAfter30Minutes => '30 minutes';

  @override
  String get statusClearAfter1Hour => '1 heure';

  @override
  String get statusClearAfter3Hours => '3 heures';

  @override
  String get statusClearAfter4Hours => '4 heures';

  @override
  String get statusClearAfter8Hours => '8 heures';

  @override
  String get statusClearAfter24Hours => '24 heures';

  @override
  String get statusClearAfter3Days => '3 jours';

  @override
  String get statusDndDescription =>
      'Vous ne recevrez pas de notifications sur le bureau';

  @override
  String get statusInvisibleDescription => 'Vous apparaîtrez hors ligne';

  @override
  String get customStatusSetTitle => 'Définir un statut personnalisé';

  @override
  String get customStatusCurrentHint => 'Statut personnalisé';

  @override
  String get customStatusClear => 'Effacer le statut personnalisé';

  @override
  String get customStatusPlaceholder => 'Quoi de neuf ?';

  @override
  String get customStatusChooseEmoji => 'Choisir un emoji';

  @override
  String get customStatusClearAfter => 'Effacer après';

  @override
  String get customStatusSave => 'Enregistrer';

  @override
  String get accountActive => 'Compte actif';

  @override
  String get signOut => 'Se déconnecter';

  @override
  String get suspendedPermanentTitle => 'Compte suspendu définitivement';

  @override
  String get suspendedTemporaryTitle => 'Compte suspendu';

  @override
  String get suspendedPermanentDescription =>
      'Votre compte a été suspendu définitivement pour violation de nos Conditions d\'utilisation.';

  @override
  String get suspendedTemporaryDescription =>
      'Votre compte a été temporairement suspendu. Vous pourrez accéder à votre compte une fois la période de suspension terminée.';

  @override
  String get suspendedIssuedAt => 'Émis le';

  @override
  String get suspendedEndsAt => 'Se termine le';

  @override
  String get suspendedDuration => 'Durée';

  @override
  String get suspendedPermanent => 'Permanent';

  @override
  String get suspendedReason => 'Raison';

  @override
  String get suspendedAppealDeadline => 'Date limite d\'appel';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Votre compte est programmé pour suppression le $date.';
  }

  @override
  String get suspendedRecheck => 'Vérifier les mises à jour';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Réessayer dans ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Retour à la connexion';

  @override
  String get suspendedAppealTitle => 'Appel';

  @override
  String get suspendedAppealHint =>
      'Expliquez pourquoi votre suspension devrait être réexaminée (minimum 50 caractères)...';

  @override
  String get suspendedAppealSubmit => 'Soumettre l\'appel';

  @override
  String get suspendedAppealPending => 'En attente de révision';

  @override
  String get suspendedAppealAccepted => 'Appel accepté';

  @override
  String get suspendedAppealRejected => 'Appel rejeté';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Votre appel a été accepté et votre compte a été rétabli.';

  @override
  String get suspendedSignIn => 'Se connecter à votre compte';

  @override
  String get forgotPasswordTitle => 'Mot de passe oublié ?';

  @override
  String get forgotPasswordDescription =>
      'Entrez votre adresse e-mail et nous vous enverrons un lien pour réinitialiser votre mot de passe.';

  @override
  String get forgotPasswordSubmit => 'Envoyer le lien de réinitialisation';

  @override
  String get forgotPasswordSentTitle => 'Vérifiez votre e-mail';

  @override
  String get forgotPasswordSentDescription =>
      'Nous avons envoyé des instructions de réinitialisation de mot de passe à votre adresse e-mail. Veuillez vérifier votre boîte de réception et suivre le lien pour réinitialiser votre mot de passe.';

  @override
  String get forgotPasswordBackToLogin => 'Retour à la connexion';

  @override
  String get resetPasswordTitle => 'Définir un nouveau mot de passe';

  @override
  String get resetPasswordDescription =>
      'Entrez votre nouveau mot de passe ci-dessous pour terminer le processus de réinitialisation.';

  @override
  String get resetPasswordNewPassword => 'Nouveau mot de passe';

  @override
  String get resetPasswordConfirm => 'Confirmer le nouveau mot de passe';

  @override
  String get resetPasswordSubmit => 'Réinitialiser le mot de passe';

  @override
  String get resetPasswordMismatch => 'Les mots de passe ne correspondent pas.';

  @override
  String get registerTitle => 'Créer un compte';

  @override
  String get registerDisplayName => 'Nom d\'affichage (facultatif)';

  @override
  String get registerDisplayNameHint => 'Comment doit-on vous appeler ?';

  @override
  String get registerUsername => 'Nom d\'utilisateur (facultatif)';

  @override
  String get registerUsernameHint =>
      'Laissez vide pour un nom d\'utilisateur aléatoire';

  @override
  String get registerUsernameTagHint =>
      'Un tag de 4 chiffres sera ajouté automatiquement pour garantir l\'unicité';

  @override
  String get registerDateOfBirth => 'Date de naissance';

  @override
  String get registerMonth => 'Mois';

  @override
  String get registerDay => 'Jour';

  @override
  String get registerYear => 'Année';

  @override
  String get registerConsent =>
      'J\'accepte les Conditions d\'utilisation et la Politique de confidentialité';

  @override
  String get registerConsentPrefix => 'J\'accepte les ';

  @override
  String get registerConsentTerms => 'Conditions d\'utilisation';

  @override
  String get registerConsentAnd => ' et ';

  @override
  String get registerConsentPrivacy => 'Politique de confidentialité';

  @override
  String get registerConfirmPassword => 'Confirmer le mot de passe';

  @override
  String get registerSubmit => 'Créer un compte';

  @override
  String get registerHaveAccount => 'Vous avez déjà un compte ? ';

  @override
  String get passkeyNoCredentials =>
      'Aucune clé d\'accès trouvée pour cette application. Connectez-vous avec votre e-mail et votre mot de passe à la place.';

  @override
  String get passkeyDeviceNotSupported =>
      'Les clés d\'accès ne sont pas prises en charge sur cet appareil.';

  @override
  String get passkeyDomainNotAssociated =>
      'Les clés d\'accès ne sont pas configurées pour cette application. Connectez-vous avec votre e-mail et votre mot de passe à la place.';

  @override
  String get passkeyTimeout =>
      'L\'authentification par clé d\'accès a expiré. Veuillez réessayer.';

  @override
  String get passkeyNotAvailable =>
      'Les clés d\'accès ne sont pas disponibles pour cette application. Connectez-vous avec votre e-mail et votre mot de passe à la place.';

  @override
  String get passkeyFailed =>
      'L\'authentification par clé d\'accès a échoué. Veuillez réessayer.';

  @override
  String get errorUnableToCreateAccount =>
      'Impossible de créer le compte. Veuillez réessayer.';

  @override
  String get errorUnableToSignIn =>
      'Impossible de vous connecter pour le moment. Veuillez réessayer.';

  @override
  String get errorInvalidEmailOrPassword =>
      'Adresse e-mail ou mot de passe invalide.';

  @override
  String get errorUnableToSendResetLink =>
      'Impossible d\'envoyer le lien de réinitialisation. Veuillez réessayer.';

  @override
  String get errorUnableToResetPassword =>
      'Impossible de réinitialiser le mot de passe. Veuillez réessayer.';

  @override
  String get embedInviteJoin => 'Rejoindre la communauté';

  @override
  String get embedInviteGoTo => 'Aller à la communauté';

  @override
  String embedInviteOnline(String count) {
    return '$count en ligne';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count membres';
  }

  @override
  String get embedInviteUnknownTitle => 'Invitation inconnue';

  @override
  String get embedInviteUnknownSubtitle =>
      'Essayez de demander une nouvelle invitation.';

  @override
  String get embedInviteUnavailable => 'Invitation indisponible';

  @override
  String get inviteAcceptTitle => 'Vous avez été invité à rejoindre';

  @override
  String get inviteAcceptJoinButton => 'Rejoindre la communauté';

  @override
  String get inviteAcceptGoToButton => 'Aller à la communauté';

  @override
  String get inviteAcceptInvitesPaused => 'Invitations en pause';

  @override
  String get inviteAcceptNotFoundTitle => 'Invitation invalide';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Cette invitation peut être expirée ou invalide.';

  @override
  String get invalidDeepLinkTitle => 'Impossible d\'ouvrir le lien';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'Rejoindre le groupe';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Vous avez été invité à rejoindre un message direct de groupe par $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'quelqu\'un';

  @override
  String get inviteAcceptEmojiPack => 'Pack d\'emojis';

  @override
  String get inviteAcceptStickerPack => 'Pack d\'autocollants';

  @override
  String get inviteAcceptInstallEmojiPack => 'Installer le pack d\'emojis';

  @override
  String get inviteAcceptInstallStickerPack =>
      'Installer le pack d\'autocollants';

  @override
  String get inviteAcceptPackInstallNote =>
      'Accepter cette invitation installe le pack automatiquement.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Accès au canal refusé';

  @override
  String get channelAccessDeniedDescription =>
      'Vous n\'avez pas accès au canal où ce message a été envoyé.';

  @override
  String get messageJumpLinkNoAccess => 'Pas d\'accès';

  @override
  String get okay => 'OK';

  @override
  String get embedThemeTitle => 'Thème partagé';

  @override
  String get embedThemeSubtitle =>
      'Ce client ne prend pas en charge les thèmes personnalisés.';

  @override
  String get embedThemeUnavailableButton => 'Thèmes indisponibles';

  @override
  String get privacySettings => 'Paramètres de confidentialité';

  @override
  String get privacyDirectMessages => 'Messages directs';

  @override
  String get privacyDirectMessagesDescription =>
      'Autoriser les messages directs d\'autres membres de cette communauté';

  @override
  String get privacyBotDirectMessages => 'Messages directs des bots';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Autoriser les bots de cette communauté à vous envoyer des messages directs';

  @override
  String get privacyMutualDmsDisabled =>
      'Les administrateurs de la communauté ont désactivé la réception de messages directs uniquement des membres mutuels de cette communauté.';

  @override
  String get communityDebug => 'Débogage de la communauté';

  @override
  String get copiedToClipboard => 'Copié dans le presse-papiers';

  @override
  String get notificationSettings => 'Paramètres de notification';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Masquer $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Masquer une communauté empêche l\'affichage des indicateurs de non lus et des notifications, sauf si vous êtes mentionné';

  @override
  String get notificationCommunitySettings =>
      'Paramètres de notification de la communauté';

  @override
  String get notificationAllMessages => 'Tous les messages';

  @override
  String get notificationOnlyMentions => 'Mentions uniquement';

  @override
  String get notificationNothing => 'Aucune';

  @override
  String get notificationSuppressEveryone =>
      'Supprimer les mentions @everyone et @here';

  @override
  String get notificationSuppressRoles =>
      'Supprimer toutes les @mentions de rôle';

  @override
  String get notificationMobilePush => 'Notifications push mobiles';

  @override
  String get notificationOverrides => 'Paramètres de notification';

  @override
  String get notificationSelectChannel =>
      'Sélectionner un salon ou une catégorie';

  @override
  String get notificationOnlyAtMentions => 'Uniquement les @mentions';

  @override
  String get notificationMuteChannel => 'Mettre le salon en sourdine';

  @override
  String get notificationUnmuteChannel => 'Rétablir le son du salon';

  @override
  String get notificationUseCategoryDefault => 'Use Category Default';

  @override
  String get notificationUseCommunityDefault => 'Use Community Default';

  @override
  String get notificationNoCategory => 'Aucune catégorie';

  @override
  String get dmMarkAsRead => 'Marquer comme lu';

  @override
  String get dmMuteConversation => 'Mettre la conversation en sourdine';

  @override
  String get dmUnmuteConversation => 'Rétablir le son de la conversation';

  @override
  String get dmPinDm => 'Épingler le MP';

  @override
  String get dmUnpinDm => 'Désépingler le MP';

  @override
  String get dmAlwaysShowInSidebar =>
      'Toujours afficher dans la barre latérale';

  @override
  String get dmRemoveFromAlwaysShown =>
      'Retirer de la liste des affichages permanents';

  @override
  String get dmCloseDm => 'Fermer le MP';

  @override
  String get dmCloseDmConfirmTitle => 'Fermer le MP';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Êtes-vous sûr de vouloir fermer votre MP avec $username ? Vous pourrez toujours le rouvrir plus tard.';
  }

  @override
  String get dmCopyChannelId => 'Copier l\'ID du salon';

  @override
  String get dmChannelIdCopied => 'ID du salon copié';

  @override
  String get dmCopyUserId => 'Copier l\'ID utilisateur';

  @override
  String get dmUserIdCopied => 'ID utilisateur copié';

  @override
  String get dmViewProfile => 'Voir le profil';

  @override
  String get dmVoiceCall => 'Démarrer un appel vocal';

  @override
  String get incomingVoiceCallTitle => 'Appel vocal entrant';

  @override
  String get incomingVoiceCallAccept => 'Accepter';

  @override
  String get incomingVoiceCallDecline => 'Refuser';

  @override
  String get incomingVoiceCallLabel => 'Appel entrant';

  @override
  String get incomingVoiceCallIgnore => 'Ignorer';

  @override
  String get directVoiceCallNotEligible =>
      'Cet appel ne peut pas être passé pour le moment. Réessayez dans un instant.';

  @override
  String get voiceJoinCallFailed =>
      'Impossible de se connecter à cet appel. Vérifiez votre connexion et réessayez.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Impossible de rejoindre cet appel. Vérifiez votre connexion et réessayez.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Impossible de mettre à jour cet appel sur le serveur. Vérifiez votre connexion et réessayez.';

  @override
  String get dmAddNote => 'Ajouter une note';

  @override
  String get dmEditGroup => 'Modifier le groupe';

  @override
  String get dmInviteToCommunity => 'Inviter dans la communauté';

  @override
  String get dmBlock => 'Bloquer';

  @override
  String get dmLeaveGroup => 'Quitter le groupe';

  @override
  String get dmNoCommunitiesAvailable => 'Aucune communauté disponible';

  @override
  String dmGroupMemberCount(int count) {
    return '$count membres';
  }

  @override
  String get dmMuteFor15Min => 'Pendant 15 minutes';

  @override
  String get dmMuteFor30Min => 'Pendant 30 minutes';

  @override
  String get dmMuteFor1Hour => 'Pendant 1 heure';

  @override
  String get dmMuteFor3Hours => 'Pendant 3 heures';

  @override
  String get dmMuteFor4Hours => 'Pendant 4 heures';

  @override
  String get dmMuteFor8Hours => 'Pendant 8 heures';

  @override
  String get dmMuteFor24Hours => 'Pendant 24 heures';

  @override
  String get dmMuteFor3Days => 'Pendant 3 jours';

  @override
  String get dmMuteForever => 'Jusqu\'à ce que je le réactive';

  @override
  String get dmPinGroupDm => 'Épingler le MP de groupe';

  @override
  String get dmUnpinGroupDm => 'Désépingler la discussion de groupe';

  @override
  String get dmUnnamedGroup => 'Groupe non nommé';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'Groupe de $resolvedName';
  }

  @override
  String get dmFavoriteDm => 'Marquer la discussion en favori';

  @override
  String get dmUnfavoriteDm => 'Retirer la discussion des favoris';

  @override
  String get dmFavoriteGroupDm => 'Marquer la discussion de groupe en favori';

  @override
  String get dmUnfavoriteGroupDm =>
      'Retirer la discussion de groupe des favoris';

  @override
  String get dmChangeFriendNickname => 'Changer le surnom de l\'ami';

  @override
  String get dmRemoveFriend => 'Supprimer l\'ami';

  @override
  String get dmAddFriend => 'Ajouter un ami';

  @override
  String get dmAcceptFriendRequest => 'Accepter la demande d\'ami';

  @override
  String get dmIgnoreFriendRequest => 'Ignorer la demande d\'ami';

  @override
  String get dmFriendRequestSent => 'Demande d\'ami envoyée';

  @override
  String get dmUnblock => 'Débloquer';

  @override
  String get dmDebugUser => 'Déboguer l\'utilisateur';

  @override
  String get dmDebugChannel => 'Déboguer le canal';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => 'Discussion épinglée';

  @override
  String get dmUnpinned => 'Discussion désépinglée';

  @override
  String get dmMuted => 'Discussion en sourdine';

  @override
  String get dmUnmuted => 'Discussion non en sourdine';

  @override
  String get dmRemoveFriendConfirmTitle => 'Supprimer l\'ami';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Êtes-vous sûr de vouloir supprimer $username de vos amis ?';
  }

  @override
  String get dmBlockConfirmTitle => 'Bloquer l\'utilisateur';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Êtes-vous sûr de vouloir bloquer $username ? Il ne pourra pas vous envoyer de messages ni de demandes d\'ami.';
  }

  @override
  String get dmFriendRequestSentToast => 'Demande d\'ami envoyée';

  @override
  String get dmFriendRequestFailed => 'Échec de l\'envoi de la demande d\'ami';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Échec de l\'acceptation de la demande d\'ami';

  @override
  String get dmRemoveFriendFailed => 'Échec de la suppression de l\'ami';

  @override
  String get dmBlockFailed => 'Échec du blocage de l\'utilisateur';

  @override
  String get dmUnblockFailed => 'Échec du déblocage de l\'utilisateur';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Échec de l\'ignorance de la demande d\'ami';

  @override
  String get dmAddFriends => 'Ajouter des amis';

  @override
  String get addFriendSheetTitle => 'Ajouter un ami';

  @override
  String get addFriendUsernameHint => 'Nom d\'utilisateur#0000';

  @override
  String get addFriendUsernameLabel => 'Nom d\'utilisateur de l\'ami';

  @override
  String get addFriendSendRequest => 'Envoyer la demande';

  @override
  String get addFriendNoUserFound =>
      'Aucun utilisateur trouvé avec ce nom d\'utilisateur.';

  @override
  String get addFriendInvalidUsername =>
      'Entrez un nom d\'utilisateur valide (Nom d\'utilisateur#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Demande d\'ami envoyée';

  @override
  String get addFriendClaimTitle => 'Réclamez votre compte';

  @override
  String get addFriendClaimDescription =>
      'Réclamez votre compte pour envoyer des demandes d\'ami.';

  @override
  String get addFriendVerifyTitle => 'Vérifiez votre e-mail';

  @override
  String get addFriendVerifyDescription =>
      'Vous devez vérifier votre adresse e-mail avant de pouvoir envoyer des demandes d\'ami.';

  @override
  String get addFriendVerifyEmail => 'Vérifier l\'e-mail';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Demandes d\'ami entrantes ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Demandes d\'ami sortantes ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Demande d\'ami entrante';

  @override
  String get addFriendOutgoingStatus => 'Demande d\'ami envoyée';

  @override
  String get addFriendViewProfile => 'Voir le profil';

  @override
  String get addFriendAccept => 'Accepter';

  @override
  String get addFriendIgnore => 'Ignorer';

  @override
  String get addFriendAcceptTitle => 'Accepter la demande d\'ami';

  @override
  String get addFriendIgnoreTitle => 'Ignorer la demande d\'ami';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Accepter la demande d\'ami de $userName ?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Ignorer la demande d\'ami de $displayName ?';
  }

  @override
  String get addFriendCancelRequest => 'Annuler la demande';

  @override
  String get addFriendCancelRequestFailed =>
      'Impossible d\'annuler la demande d\'ami. Réessayez.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Cette personne n\'accepte pas les demandes d\'ami pour le moment.';

  @override
  String get addFriendUnblockFirst =>
      'Débloquez cette personne d\'abord pour lui envoyer une demande d\'ami.';

  @override
  String get addFriendCannotSendToSelf =>
      'Vous ne pouvez pas vous envoyer de demande d\'ami à vous-même.';

  @override
  String get addFriendAlreadyFriends =>
      'Vous êtes déjà ami avec cet utilisateur.';

  @override
  String get addFriendClaimToSend =>
      'Terminez votre inscription pour envoyer des demandes d\'ami.';

  @override
  String get addFriendSendFailedGeneric =>
      'Impossible d\'envoyer la demande d\'ami. Réessayez.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Système';

  @override
  String get emojiSearchPlaceholder => 'Trouvez l\'emoji de vos rêves';

  @override
  String get emojiSearchEmpty => 'Aucun emoji ne correspond à votre recherche';

  @override
  String get emojiAutocompleteDefaultLabel => 'Emoji par défaut';

  @override
  String get emojiFrequentlyUsed => 'Utilisés fréquemment';

  @override
  String get emojiTabGifs => 'GIFs';

  @override
  String get emojiTabMedia => 'Médias';

  @override
  String get emojiTabStickers => 'Autocollants';

  @override
  String get emojiTabEmojis => 'Emojis';

  @override
  String get gifPickerSearch => 'Rechercher des GIFs';

  @override
  String get gifPickerSearchKlipy => 'Rechercher sur KLIPY';

  @override
  String get gifPickerSearchTenor => 'Rechercher sur Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Favoris';

  @override
  String get gifPickerTrending => 'GIFs tendance';

  @override
  String get gifPickerNoResultsTitle => 'Aucun résultat de recherche';

  @override
  String get gifPickerNoResultsDescription =>
      'Essayez un autre terme de recherche';

  @override
  String get gifPickerLoadFailedTitle => 'Impossible de charger les GIFs';

  @override
  String get gifPickerLoadFailedBody =>
      'Vérifiez votre connexion et réessayez.';

  @override
  String get emojiCategoryPeople => 'Personnes';

  @override
  String get emojiCategoryNature => 'Nature';

  @override
  String get emojiCategoryFood => 'Nourriture et boissons';

  @override
  String get emojiCategoryActivity => 'Activités';

  @override
  String get emojiCategoryTravel => 'Voyages et lieux';

  @override
  String get emojiCategoryObjects => 'Objets';

  @override
  String get emojiCategorySymbols => 'Symboles';

  @override
  String get emojiCategoryFlags => 'Drapeaux';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Débloquez $emojiCount sur $communityCount avec Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Obtenir Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Ne plus afficher';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count emojis personnalisés',
      one: '1 emoji personnalisé',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count communautés',
      one: '1 communauté',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Avertissement de lien externe';

  @override
  String get externalLinkWarningLeaving =>
      'Vous êtes sur le point de quitter Fluxer';

  @override
  String get externalLinkWarningDescription =>
      'Les liens externes peuvent être dangereux. Soyez prudent.';

  @override
  String get externalLinkWarningDestinationUrl => 'URL de destination :';

  @override
  String get externalLinksSectionTitle => 'Liens externes';

  @override
  String get externalLinksSectionDescription =>
      'Configurez la gestion des avertissements de liens externes.';

  @override
  String get externalLinkWarningTrustPrefix => 'Toujours faire confiance à ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — ignorer cet avertissement la prochaine fois';

  @override
  String get externalLinkVisitSite => 'Visiter le site';

  @override
  String get externalLinkTrustAllLabel =>
      'Faire confiance à tous les liens externes';

  @override
  String get externalLinkStripTrackingLabel =>
      'Supprimer les paramètres de suivi des URL';

  @override
  String get externalLinkStripTrackingDescription =>
      'Supprime automatiquement les paramètres de suivi (comme utm_source, fbclid, gclid) des URL dans les messages que vous envoyez. Nettoie le lien avant qu\'il n\'atteigne qui que ce soit d\'autre.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Faire confiance à tous les liens externes ?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Cela approuvera tous les liens externes et ignorera l\'avertissement pour chaque domaine. Vos domaines de confiance existants seront remplacés. C\'est moins sécurisé.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Tout approuver';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Arrêter d\'approuver tous les liens ?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Les avertissements de liens externes seront à nouveau affichés. Vous devrez ajouter des domaines de confiance individuellement.';

  @override
  String get externalLinkStopTrustingAllAction =>
      'Désactiver l\'approbation de tous les liens';

  @override
  String get externalLinkTrustedAllDescription =>
      'Tous les liens externes sont approuvés. Les avertissements ne seront pas affichés.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Vous avez $count domaine(s) de confiance. Ajoutez-en d\'autres en cochant la case lorsque vous visitez des liens externes.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Lorsqu\'il est activé, aucun avertissement de lien externe ne sera affiché. C\'est moins sécurisé.';

  @override
  String get imageFileTooLarge =>
      'Le fichier image est trop volumineux. Veuillez choisir un fichier de moins de 10 Mo.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Les avatars animés nécessitent Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Les bannières animées nécessitent Plutonium';

  @override
  String get animatedAvifNotSupported => 'AVIF animé non pris en charge';

  @override
  String get animatedAvifNotSupportedBody =>
      'Le recadrage et la rotation des fichiers AVIF animés ne sont pas encore pris en charge. Si vous continuez, il sera téléchargé sous sa forme originale.';

  @override
  String get uploadAsIs => 'Télécharger tel quel';

  @override
  String get croppingAnimatedNotSupported =>
      'Le recadrage des images animées n\'est pas encore pris en charge. Le téléchargement d\'origine sera utilisé.';

  @override
  String get cropAvatar => 'Recadrer l\'avatar';

  @override
  String get cropBanner => 'Recadrer la bannière';

  @override
  String get skip => 'Ignorer';

  @override
  String get crop => 'Recadrer';

  @override
  String get changeYourFluxerTag => 'Modifier votre Nom d\'utilisateur';

  @override
  String get fluxerTagInputLabel => 'Nom d\'utilisateur';

  @override
  String get fluxerTagDescriptionBase =>
      'Les noms d\'utilisateur ne peuvent contenir que des lettres (a-z, A-Z), des chiffres (0-9) et des underscores. Les noms d\'utilisateur ne sont pas sensibles à la casse.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Les noms d\'utilisateur ne peuvent contenir que des lettres (a-z, A-Z), des chiffres (0-9) et des underscores. Les noms d\'utilisateur ne sont pas sensibles à la casse. Vous pouvez choisir n\'importe quel tag à 4 chiffres disponible de #0000 à #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Les noms d\'utilisateur ne peuvent contenir que des lettres (a-z, A-Z), des chiffres (0-9) et des underscores. Les noms d\'utilisateur ne sont pas sensibles à la casse. Vous pouvez choisir n\'importe quel tag à 4 chiffres disponible de #0001 à #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Entre $min et $max caractères';
  }

  @override
  String get validationAllowedChars =>
      'Lettres (a-z, A-Z), chiffres (0-9) et underscores (_) uniquement';

  @override
  String get discriminatorPremiumTooltip =>
      'Obtenez Plutonium pour personnaliser votre tag ou le conserver lors de la modification de votre nom d\'utilisateur';

  @override
  String get fluxerTagAlreadyTaken => 'Nom d\'utilisateur déjà pris';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Le Nom d\'utilisateur $username#$discriminator est déjà pris. Continuer reroulera automatiquement votre discriminateur.';
  }

  @override
  String get customTagIsTemporary => 'Le tag personnalisé est temporaire';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Votre tag personnalisé à 4 chiffres n\'est disponible que tant que votre abonnement Plutonium est actif. Lorsque votre abonnement expirera le $date, votre tag reviendra à un numéro attribué aléatoirement après une période de grâce de 3 jours.';
  }

  @override
  String get customTagTemporaryBody =>
      'Votre tag personnalisé à 4 chiffres n\'est disponible que tant que votre abonnement Plutonium est actif. Lorsque votre abonnement expirera, votre tag reviendra à un numéro attribué aléatoirement après une période de grâce de 3 jours.';

  @override
  String get iUnderstandContinue => 'Je comprends, continuer';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Si vous enregistrez ce Nom d\'utilisateur, votre tag personnalisé à 4 chiffres reviendra à un numéro aléatoire à la fin de votre abonnement Plutonium. Si votre abonnement ne parvient pas à se renouveler, vous aurez une période de grâce de 3 jours avant que le tag ne change.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Votre tag personnalisé à 4 chiffres (#$discriminator) est actif tant que votre abonnement Plutonium est actif. Si votre abonnement se termine ou ne parvient pas à se renouveler après une période de grâce de 3 jours, votre tag reviendra à un numéro aléatoire.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Personnalisez votre tag à 4 chiffres ou conservez-le lors de la modification de votre nom d\'utilisateur';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Votre essai Plutonium expire le $date. Passez à la version supérieure pour conserver votre tag personnalisé et obtenir un badge sur votre profil.';
  }

  @override
  String get premiumTrialActive =>
      'Vous êtes en période d\'essai Plutonium. Passez à la version supérieure pour conserver votre tag personnalisé et obtenir un badge sur votre profil.';

  @override
  String get fluxerTagUpdated => 'Nom d\'utilisateur mis à jour';

  @override
  String get fluxerTagUpdateFailed =>
      'Échec de la mise à jour du Nom d\'utilisateur. Veuillez réessayer.';

  @override
  String get continueAction => 'Continuer';

  @override
  String get profileCustomizationTitle => 'Personnalisation du profil';

  @override
  String get profileCustomizationDescription =>
      'Modifiez l\'apparence de votre profil et voyez un aperçu en direct';

  @override
  String get usernameLabel => 'Nom d\'utilisateur';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Réclamez votre compte pour modifier votre Nom d\'utilisateur';

  @override
  String get changeFluxerTag => 'Modifier le Nom d\'utilisateur';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Personnalisez votre tag à 4 chiffres (#$discriminator) comme vous le souhaitez avec Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Modifiez votre nom d\'utilisateur et votre tag à 4 chiffres';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Votre tag personnalisé (#$discriminator) est lié à votre abonnement Plutonium et sera remplacé par un tag aléatoire s\'il expire.';
  }

  @override
  String get displayNameLabel => 'Nom d\'affichage';

  @override
  String get pronounsLabel => 'Pronoms';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Modifier l\'avatar';

  @override
  String get removeAvatar => 'Supprimer l\'avatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. 10 Mo max. Recommandé : 512×512 px';

  @override
  String get bannerLabel => 'Bannière';

  @override
  String get changeBanner => 'Modifier la bannière';

  @override
  String get removeBanner => 'Supprimer la bannière';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. 10 Mo max. Minimum : 960×540 px (16:9)';

  @override
  String get accentColorLabel => 'Couleur d\'accentuation';

  @override
  String get accentColorDescription =>
      'Personnalise la bordure et la couleur de la bannière de votre profil';

  @override
  String get aboutMeLabel => 'À propos de moi';

  @override
  String get aboutMeHelperText =>
      'Vous pouvez utiliser des liens, des emojis et du Markdown.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle => 'Confidentialité du badge Plutonium';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Contrôlez la façon dont votre badge Plutonium est affiché aux autres';

  @override
  String get hidePlutoniumBadgeLabel =>
      'Masquer entièrement le badge Plutonium';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Masquez complètement votre badge Plutonium des autres utilisateurs';

  @override
  String get hidePlutoniumPurchaseDate =>
      'Masquer la date d\'achat de Plutonium';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Masquer la date d\'achat de Plutonium ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Supprimez la date de votre premier achat de Plutonium de votre badge';

  @override
  String get maskVisionaryAsSubscription =>
      'Masquer Visionary en tant qu\'abonnement';

  @override
  String get maskVisionaryDescription =>
      'Affichez Visionary comme un abonnement standard';

  @override
  String get hideVisionaryIdBadge => 'Masquer le badge d\'ID Visionary';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Masquer le badge d\'ID Visionary (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription =>
      'Supprimez votre badge d\'ID Visionary';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Vous êtes en essai Plutonium — votre abonnement commence le $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Votre abonnement commencera automatiquement à la fin de votre essai. Aucune action requise.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Vous êtes en essai Plutonium qui expire le $date';
  }

  @override
  String get premiumTrialActiveProfile => 'Vous êtes en essai Plutonium';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. 10 Mo max. Recommandé : 512×512 px. Les avatars animés (GIF) nécessitent Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Personnalisez votre profil avec une image de bannière statique ou animée pour qu\'il se démarque.';

  @override
  String get getPlutonium => 'Obtenir Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Les achats intégrés ne sont pas encore disponibles sur cette plateforme. Restez à l\'écoute — bientôt disponible !';

  @override
  String get profilePreviewLabel => 'Aperçu';

  @override
  String get profilePreviewMessage => 'Message';

  @override
  String get profilePreviewMemberSince => 'Membre Fluxer depuis';

  @override
  String get unclaimedAccountTitle => 'Compte non revendiqué';

  @override
  String get unclaimedAccountDescription =>
      'Votre compte n\'a pas encore été revendiqué. Sans e-mail ni mot de passe, vous pourriez perdre l\'accès. Revendiquez votre compte maintenant pour le sécuriser.';

  @override
  String get claimAccount => 'Revendiquer le compte';

  @override
  String get profileTypeLabel => 'Type de profil';

  @override
  String get profileTypeGlobal => 'Profil global';

  @override
  String get profileTypeGuildDescription =>
      'Vous modifiez votre profil par communauté. Ce profil ne sera visible que dans cette communauté et remplacera votre profil global.';

  @override
  String get communityNicknameLabel => 'Surnom de la communauté';

  @override
  String get perGuildPremiumUpsellText =>
      'La personnalisation de votre avatar, bannière, couleur d\'accent et biographie pour des communautés individuelles nécessite Plutonium. Le pseudonyme et les pronoms de la communauté sont gratuits pour tous.';

  @override
  String get avatarModeInherit => 'Utiliser le profil global';

  @override
  String get avatarModeCustom => 'Utiliser une image personnalisée';

  @override
  String get avatarModeUnset => 'Ne pas afficher';

  @override
  String get profileSavedToast => 'Profil mis à jour';

  @override
  String get profileEditButton => 'Modifier le profil';

  @override
  String get profileNoteLabel => 'Note';

  @override
  String get profileNoteVisibility => '(visible uniquement pour vous)';

  @override
  String get profileNoteEmpty => 'Pas encore de note.';

  @override
  String get sudoTitle => 'Vérifiez votre identité';

  @override
  String get sudoDescription =>
      'Cette action nécessite une vérification pour continuer.';

  @override
  String get sudoAuthenticatorCode => 'Code d\'authentification';

  @override
  String get sudoMethodPassword => 'Mot de passe';

  @override
  String get sudoMethodTotp => 'Authentificateur';

  @override
  String get sudoVerificationFailed =>
      'La vérification a échoué. Veuillez réessayer.';

  @override
  String get securityAccountTitle => 'Compte';

  @override
  String get securityAccountDescription =>
      'Gérez votre e-mail, votre mot de passe et les paramètres de votre compte';

  @override
  String get securitySectionTitle => 'Sécurité';

  @override
  String get securitySectionDescription =>
      'Protégez votre compte avec l\'authentification à deux facteurs et les passkeys';

  @override
  String get securityLoginEmailSectionTitle => 'Paramètres de l\'e-mail';

  @override
  String get securityLoginEmailSectionDescription =>
      'Gérez l\'adresse e-mail que vous utilisez pour vous connecter à Fluxer';

  @override
  String get securityLoginEmailAddressLabel => 'Adresse e-mail';

  @override
  String get securityLoginNoEmailSet => 'Aucune adresse e-mail définie';

  @override
  String get securityLoginChangeEmail => 'Changer d\'e-mail';

  @override
  String get securityLoginAddEmail => 'Ajouter un e-mail';

  @override
  String get securityLoginReveal => 'Afficher';

  @override
  String get securityLoginHide => 'Masquer';

  @override
  String get securityLoginPasswordSectionTitle => 'Mot de passe';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Changez votre mot de passe pour sécuriser votre compte';

  @override
  String get securityLoginCurrentPasswordLabel => 'Mot de passe actuel';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Dernière modification : $date';
  }

  @override
  String get securityLoginPasswordNeverChanged =>
      'Dernière modification : Jamais';

  @override
  String get securityLoginNoPasswordSet => 'Aucun mot de passe défini';

  @override
  String get securityLoginChangePassword => 'Changer de mot de passe';

  @override
  String get securityLoginSetPassword => 'Définir un mot de passe';

  @override
  String get passwordChangeTitle => 'Changer de mot de passe';

  @override
  String get passwordChangeIntroDescription =>
      'Nous enverrons un code de vérification à votre adresse e-mail pour confirmer votre identité avant de changer votre mot de passe.';

  @override
  String get passwordChangeStart => 'Commencer';

  @override
  String get passwordChangeVerifyTitle => 'Vérifiez votre e-mail';

  @override
  String get passwordChangeVerifyDescription =>
      'Entrez le code de vérification envoyé à votre adresse e-mail.';

  @override
  String get passwordChangeVerificationCode => 'Code de vérification';

  @override
  String get passwordChangeVerify => 'Vérifier';

  @override
  String get passwordChangeNewPasswordTitle =>
      'Définir un nouveau mot de passe';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Entrez votre nouveau mot de passe ci-dessous.';

  @override
  String get passwordChangeNewPassword => 'Nouveau mot de passe';

  @override
  String get passwordChangeConfirmPassword =>
      'Confirmer le nouveau mot de passe';

  @override
  String get passwordChangeSubmit => 'Changer de mot de passe';

  @override
  String get passwordChangeSuccess => 'Mot de passe changé';

  @override
  String get passwordChangePasswordsDoNotMatch =>
      'Les mots de passe ne correspondent pas';

  @override
  String get passwordChangeInvalidCode => 'Code invalide ou expiré';

  @override
  String get emailChangeTitle => 'Modifier l\'e-mail';

  @override
  String get emailChangeIntroDescription =>
      'Nous enverrons des codes de vérification pour confirmer votre identité avant de modifier votre adresse e-mail.';

  @override
  String get emailChangeStart => 'Commencer';

  @override
  String get emailChangeVerifyOriginalTitle => 'Vérifier l\'e-mail actuel';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Entrez le code de vérification envoyé à votre adresse e-mail actuelle.';

  @override
  String get emailChangeNewEmailTitle => 'Entrer le nouvel e-mail';

  @override
  String get emailChangeNewEmailDescription =>
      'Entrez la nouvelle adresse e-mail que vous souhaitez utiliser.';

  @override
  String get emailChangeNewEmailLabel => 'Nouvel e-mail';

  @override
  String get emailChangeNewEmailSubmit => 'Envoyer le code de vérification';

  @override
  String get emailChangeVerifyNewTitle => 'Vérifier le nouvel e-mail';

  @override
  String get emailChangeVerifyNewDescription =>
      'Entrez le code de vérification envoyé à votre nouvelle adresse e-mail.';

  @override
  String get emailChangeSuccess => 'E-mail modifié';

  @override
  String get emailChangeInvalidCode => 'Code invalide ou expiré';

  @override
  String get resend => 'Renvoyer';

  @override
  String resendCountdown(int seconds) {
    return 'Renvoyer (${seconds}s)';
  }

  @override
  String get verificationCode => 'Code de vérification';

  @override
  String get verify => 'Vérifier';

  @override
  String get enable => 'Activer';

  @override
  String get disable => 'Désactiver';

  @override
  String get delete => 'Supprimer';

  @override
  String get save => 'Enregistrer';

  @override
  String get securityTfaSectionTitle => 'Authentification à deux facteurs';

  @override
  String get securityTfaSectionDescription =>
      'Ajoutez une couche de sécurité supplémentaire à votre compte';

  @override
  String get securityTfaAuthenticatorApp => 'Application d\'authentification';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'L\'authentification à deux facteurs est activée';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Utilisez une application d\'authentification pour générer des codes pour l\'authentification à deux facteurs';

  @override
  String get securityTfaBackupCodes => 'Codes de secours';

  @override
  String get securityTfaBackupCodesDescription =>
      'Affichez et gérez vos codes de secours pour la récupération de compte';

  @override
  String get securityTfaViewCodes => 'Voir les codes';

  @override
  String get securityPasskeysSectionTitle => 'Clés d\'accès';

  @override
  String get securityPasskeysSectionDescription =>
      'Utilisez des clés d\'accès pour vous connecter sans mot de passe et pour l\'authentification à deux facteurs';

  @override
  String get securityPasskeysRegistered => 'Clés d\'accès enregistrées';

  @override
  String get securityPasskeysNone => 'Aucune clé d\'accès enregistrée';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'clés d\'accès',
      one: 'clé d\'accès',
    );
    return '$count $_temp0 enregistrée(s) (max 10)';
  }

  @override
  String get securityPasskeysAdd => 'Ajouter une clé d\'accès';

  @override
  String securityPasskeysAdded(String date) {
    return 'Ajoutée le : $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Dernière utilisation : $date';
  }

  @override
  String get securityPasskeysRename => 'Renommer';

  @override
  String get securityPasskeysDeleteTitle => 'Supprimer la clé d\'accès';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Êtes-vous sûr de vouloir supprimer la clé d\'accès « $name » ?';
  }

  @override
  String get securityPasskeyNameTitle => 'Nommer la clé d\'accès';

  @override
  String get securityPasskeyNameLabel => 'Nom de la clé d\'accès';

  @override
  String get securityPasskeyNameHint =>
      'par ex. YubiKey, iPhone, Ordinateur du travail';

  @override
  String get securityPhoneSectionTitle => 'Numéro de téléphone';

  @override
  String get securityPhoneSectionDescription =>
      'Gérez votre numéro de téléphone.';

  @override
  String get securityPhoneLabel => 'Numéro de téléphone';

  @override
  String get securityPhoneNone => 'Aucun numéro de téléphone ajouté.';

  @override
  String get securityPhoneAdd => 'Ajouter un téléphone';

  @override
  String get securityPhoneRemove => 'Supprimer';

  @override
  String get securityPhoneRemoveTitle => 'Supprimer le numéro de téléphone';

  @override
  String get securityPhoneRemoveDescription =>
      'Êtes-vous sûr de vouloir supprimer votre numéro de téléphone ?';

  @override
  String get securityPhoneRemoved => 'Numéro de téléphone supprimé';

  @override
  String get securityClaimTitle => 'Fonctionnalités de sécurité';

  @override
  String get securityClaimDescription =>
      'Réclamez votre compte pour accéder aux fonctionnalités de sécurité telles que l\'authentification à deux facteurs et les passkeys.';

  @override
  String get securityVerifyEmailRequired =>
      'Vous devez vérifier votre adresse e-mail avant de pouvoir configurer l\'authentification à deux facteurs, les passkeys ou la vérification par SMS.';

  @override
  String get totpEnableTitle => 'Configurer l\'application d\'authentification';

  @override
  String get totpEnableDescription =>
      'Scannez le code QR avec votre application d\'authentification pour générer des codes pour l\'authentification à deux facteurs.';

  @override
  String get totpEnableCodeLabel => 'Code';

  @override
  String get totpEnableCodeHint =>
      'Entrez le code à 6 chiffres de votre application d\'authentification';

  @override
  String get totpEnableSuccess =>
      'L\'authentification à deux facteurs a été activée';

  @override
  String get totpDisableTitle => 'Supprimer l\'application d\'authentification';

  @override
  String get totpDisableDescription =>
      'Entrez le code à 6 chiffres de votre application d\'authentification pour désactiver l\'authentification à deux facteurs.';

  @override
  String get totpDisableSuccess =>
      'Authentification à deux facteurs désactivée';

  @override
  String get backupCodesTitle => 'Codes de secours';

  @override
  String get backupCodesWarning =>
      'Si vous perdez l\'accès à votre application d\'authentification et que vous n\'avez pas ces codes, vous serez définitivement bloqué hors de votre compte. Téléchargez-les ou copiez-les maintenant et stockez-les en lieu sûr.';

  @override
  String get backupCodesDownload => 'Télécharger';

  @override
  String get backupCodesCopy => 'Copier';

  @override
  String get backupCodesCopied =>
      'Codes de secours copiés dans le presse-papiers';

  @override
  String get backupCodesAcknowledge =>
      'J\'ai téléchargé ou copié mes codes de secours et je les ai stockés en lieu sûr.';

  @override
  String get backupCodesDone => 'Terminé';

  @override
  String get backupCodesViewTitle => 'Voir les codes de secours';

  @override
  String get backupCodesViewDescription =>
      'Une vérification peut être nécessaire avant de voir vos codes de secours.';

  @override
  String get phoneAddTitle => 'Ajouter un numéro de téléphone';

  @override
  String get phoneAddLabel => 'Numéro de téléphone';

  @override
  String get phoneAddHint => 'Entrez votre numéro de téléphone';

  @override
  String get phoneAddFooter =>
      'Entrez votre numéro de téléphone. Nous vous enverrons un code de vérification par SMS.';

  @override
  String get phoneAddSendCode => 'Envoyer le code';

  @override
  String get phoneVerifyTitle => 'Vérifier le numéro de téléphone';

  @override
  String get phoneVerifyDescription =>
      'Entrez le code de vérification envoyé à votre numéro de téléphone.';

  @override
  String get phoneAddSuccess => 'Numéro de téléphone ajouté';

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
  String get dangerZoneSectionTitle => 'Zone de danger';

  @override
  String get dangerZoneSectionDescription =>
      'Actions irréversibles et destructrices';

  @override
  String get dangerZoneDisableTitle => 'Désactiver le compte';

  @override
  String get dangerZoneDisableDescription =>
      'Désactivez temporairement votre compte. Vous pourrez le réactiver plus tard en vous reconnectant.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'La désactivation de votre compte vous déconnectera de toutes les sessions. Vous pourrez réactiver votre compte à tout moment en vous reconnectant.';

  @override
  String get dangerZoneDeleteTitle => 'Supprimer le compte';

  @override
  String get dangerZoneDeleteDescription =>
      'Supprimez définitivement votre compte et toutes les données associées. Cette action est irréversible.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Annulez votre abonnement Plutonium actif dans les paramètres Plutonium avant de supprimer votre compte.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount =>
      'Impossible de supprimer le compte';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Vous ne pouvez pas supprimer votre compte tant que vous possédez des communautés. Transférez d\'abord la propriété des communautés suivantes :';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'et $count de plus';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Pour transférer la propriété, allez dans $settingsPath et utilisez l\'option de transfert de propriété.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Êtes-vous sûr de vouloir supprimer votre compte ? Cette action planifiera la suppression définitive de votre compte.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Vous pouvez annuler le processus de suppression dans les 14 jours';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Après 14 jours, votre compte sera définitivement supprimé';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Une fois la suppression traitée, vous ne pourrez plus récupérer l\'accès à votre compte';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Vous ne pourrez pas supprimer vos messages envoyés après la suppression de votre compte';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Si vous souhaitez exporter vos données ou supprimer vos messages au préalable, veuillez consulter la section Tableau de bord de confidentialité dans les Paramètres utilisateur avant de continuer.';

  @override
  String get claimAccountTitle => 'Réclamer votre compte';

  @override
  String get claimAccountDescription =>
      'Réclamez votre compte en ajoutant un e-mail et un mot de passe. Nous vous enverrons un code de vérification pour confirmer votre e-mail avant de terminer.';

  @override
  String get claimAccountEmailLabel => 'E-mail';

  @override
  String get claimAccountPasswordLabel => 'Mot de passe';

  @override
  String get claimAccountSendCode => 'Envoyer le code';

  @override
  String get claimAccountVerifyDescription =>
      'Entrez le code que nous vous avons envoyé par e-mail pour le vérifier. Votre mot de passe sera défini une fois le code confirmé.';

  @override
  String get claimAccountSuccess => 'Compte réclamé avec succès';

  @override
  String get importantInformation => 'Informations importantes :';

  @override
  String get genericError => 'Une erreur est survenue';

  @override
  String get invalidCode => 'Code invalide';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'il y a # ans',
      one: 'il y a 1 an',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'il y a # mois',
      one: 'il y a 1 mois',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'il y a # jours',
      one: 'il y a 1 jour',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'il y a # heures',
      one: 'il y a 1 heure',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'il y a # minutes',
      one: 'il y a 1 minute',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'à l\'instant';

  @override
  String get authorizedAppsTitle => 'Applications autorisées';

  @override
  String get authorizedAppsDescription =>
      'Ces applications ont reçu l\'autorisation d\'accéder à votre compte Fluxer.';

  @override
  String get authorizedAppsEmptyTitle => 'Aucune application autorisée';

  @override
  String get authorizedAppsEmptyDescription =>
      'Vous n\'avez autorisé aucune application à accéder à votre compte.';

  @override
  String get authorizedAppsLoadError =>
      'Échec du chargement des applications autorisées';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Autorisé le $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Permissions accordées';

  @override
  String get authorizedAppsRevoke => 'Révoquer';

  @override
  String get authorizedAppsRevokeTitle => 'Révoquer l\'accès à l\'application';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Voulez-vous vraiment révoquer l\'accès de $appName ? Cette application n\'aura plus accès à votre compte.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Accéder aux informations de votre profil de base (nom d\'utilisateur, avatar, etc.)';

  @override
  String get authorizedAppsScopeEmail => 'Voir votre adresse e-mail';

  @override
  String get authorizedAppsScopeGuilds =>
      'Voir les communautés dont vous êtes membre';

  @override
  String get authorizedAppsScopeConnections => 'Voir vos comptes connectés';

  @override
  String get authorizedAppsScopeBot =>
      'Ajouter un bot à une communauté avec les permissions demandées';

  @override
  String get authorizedAppsScopeAdmin =>
      'Accéder aux points d\'accès administratifs';

  @override
  String get privacyPendingDeletionTitle => 'Suppression en attente';

  @override
  String get blockedUsersTitle => 'Utilisateurs bloqués';

  @override
  String get blockedUsersDescription =>
      'Les utilisateurs bloqués ne peuvent pas vous envoyer de demandes d\'amis ni vous envoyer de messages directs.';

  @override
  String get blockedUsersEmptyTitle => 'Aucun utilisateur bloqué';

  @override
  String get blockedUsersEmptyDescription =>
      'Vous n\'avez bloqué personne pour le moment.';

  @override
  String get blockedUsersLoadError =>
      'Échec du chargement des utilisateurs bloqués';

  @override
  String get blockedUsersUnblock => 'Débloquer';

  @override
  String get blockedUsersUnblockTitle => 'Débloquer l\'utilisateur';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Voulez-vous vraiment débloquer $username ?';
  }

  @override
  String get blockedUsersCopyTag => 'Copier le Nom d\'utilisateur';

  @override
  String get blockedUsersCopyId => 'Copier l\'ID utilisateur';

  @override
  String get userProfileLoadError => 'Impossible de charger le profil';

  @override
  String get userProfileLoading => 'Loading profile';

  @override
  String get userProfileRetry => 'Réessayer';

  @override
  String get userProfileMessage => 'Message';

  @override
  String get userProfileVoiceCall => 'Appel vocal';

  @override
  String get userProfileVideoCall => 'Appel vidéo';

  @override
  String get userProfileEditProfile => 'Modifier le profil';

  @override
  String get userProfileStaffBadgeTooltip => 'Équipe Fluxer';

  @override
  String get userProfileCtpBadgeTooltip => 'Équipe Communauté Fluxer';

  @override
  String get userProfilePartnerBadgeTooltip => 'Partenaire Fluxer';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Chasseur de bugs Fluxer';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer Plutonium';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Abonné Fluxer Plutonium depuis le $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Visionnaire Fluxer';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Visionnaire Fluxer depuis le $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'ID Visionnaire n°$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Amis en commun ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Communautés en commun ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Amis en commun';

  @override
  String get userProfileMutualCommunitiesTitle => 'Communautés en commun';

  @override
  String get userProfileNoMutualFriends => 'Aucun ami en commun trouvé.';

  @override
  String get userProfileNoMutualCommunities =>
      'Aucune communauté en commun trouvée.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Pseudo : $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Ouvrir la discussion';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Vous avez bloqué $username. Vous ne pourrez pas envoyer de messages tant que vous ne l\'aurez pas débloqué.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Débloquer';

  @override
  String get userProfileOpenDm => 'Ouvrir la discussion';

  @override
  String get userProfileNoteTitle => 'Note';

  @override
  String get userProfileNoteVisibility => '(visible uniquement par vous)';

  @override
  String get userProfileNoteSave => 'Enregistrer';

  @override
  String get userProfileNoteDelete => 'Supprimer';

  @override
  String get userProfileNoteEmpty => 'Cliquez pour ajouter une note';

  @override
  String get userProfileMemberSince => 'Membre depuis';

  @override
  String get userProfileAboutMe => 'À propos de moi';

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
  String get userProfileLocalTime => 'Heure locale';

  @override
  String get userProfileSameTimeAsYou => 'Même fuseau horaire que vous';

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
  String get userProfileCopyUsername => 'Copier le nom d\'utilisateur';

  @override
  String get userProfileCopyUserId => 'Copier l\'ID utilisateur';

  @override
  String get userProfileViewMainProfile => 'Voir le profil principal';

  @override
  String get userProfileViewCommunityProfile => 'Voir le profil de communauté';

  @override
  String get userProfileBlockUser => 'Bloquer l\'utilisateur';

  @override
  String get userProfileUnblockUser => 'Débloquer l\'utilisateur';

  @override
  String get userProfileRemoveFriend => 'Supprimer l\'ami';

  @override
  String get userProfileBlockConfirmTitle => 'Bloquer l\'utilisateur';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Êtes-vous sûr de vouloir bloquer $username ?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Débloquer l\'utilisateur';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Êtes-vous sûr de vouloir débloquer $username ?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Supprimer l\'ami';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Êtes-vous sûr de vouloir supprimer $username de vos amis ?';
  }

  @override
  String get userProfileFailedOpenDm =>
      'Échec de l\'ouverture de la discussion';

  @override
  String get userProfileFailedSaveNote =>
      'Échec de l\'enregistrement de la note';

  @override
  String get userProfileActionFailed => 'Action échouée, veuillez réessayer';

  @override
  String get userProfileChangeNickname => 'Changer le pseudo';

  @override
  String get userProfileKick => 'Expulser';

  @override
  String get userProfileBan => 'Bannir';

  @override
  String get userProfileTimeout => 'Mettre en sourdine';

  @override
  String get userProfileRemoveTimeout => 'Retirer la mise en sourdine';

  @override
  String get userProfileTransferOwnership => 'Transférer la propriété';

  @override
  String get userProfileReportUser => 'Signaler l\'utilisateur';

  @override
  String get userProfileReportMessage => 'Signaler le message';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Expulser $username ?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Êtes-vous sûr de vouloir expulser $username ? Il pourra rejoindre avec une nouvelle invitation.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Supprimer le silence ?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'La suppression du silence permettra à $username de renvoyer des messages, de réagir et de rejoindre à nouveau les canaux vocaux.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Transférer la propriété ?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Transférer la propriété de cette communauté à $username ? Ceci est irréversible et vous perdrez tous les privilèges de propriétaire.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Bannir $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Durée du bannissement';

  @override
  String get userProfileBanCustomSecondsLabel =>
      'Durée personnalisée (secondes)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Toute valeur entre $min et $max secondes';
  }

  @override
  String get userProfileBanDeleteHistoryLabel =>
      'Supprimer l\'historique des messages';

  @override
  String get userProfileBanDeleteNone => 'Ne rien supprimer';

  @override
  String get userProfileBanDelete24h => '24 heures précédentes';

  @override
  String get userProfileBanDelete7d => '7 jours précédents';

  @override
  String get userProfileBanReasonLabel => 'Raison (facultatif)';

  @override
  String get userProfileBanReasonHint =>
      'Entrez une raison pour le bannissement';

  @override
  String get userProfileBanSubmit => 'Bannir le membre';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Mettre en silence $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Durée du silence';

  @override
  String get userProfileTimeoutSubmit => 'Mettre le membre en silence';

  @override
  String get userProfileNicknameLabel => 'Surnom';

  @override
  String get userProfileNicknameHint => 'Entrez un surnom';

  @override
  String get userProfileNicknameSave => 'Enregistrer';

  @override
  String userProfileKickSuccess(String username) {
    return '$username a été expulsé(e)';
  }

  @override
  String userProfileBanSuccess(String username) {
    return '$username a été banni(e)';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return '$username a été mis(e) en silence';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Le silence de $username a été supprimé';
  }

  @override
  String get userProfileNicknameSuccess => 'Surnom mis à jour';

  @override
  String get userProfileTransferSuccess => 'Propriété transférée';

  @override
  String get durationPermanent => 'Permanent';

  @override
  String get duration60Seconds => '60 secondes';

  @override
  String get duration5Minutes => '5 minutes';

  @override
  String get duration10Minutes => '10 minutes';

  @override
  String get duration1Hour => '1 heure';

  @override
  String get duration12Hours => '12 heures';

  @override
  String get duration1Day => '1 jour';

  @override
  String get duration3Days => '3 jours';

  @override
  String get duration5Days => '5 jours';

  @override
  String get duration1Week => '1 semaine';

  @override
  String get duration2Weeks => '2 semaines';

  @override
  String get duration1Month => '1 mois';

  @override
  String get durationCustom => 'Personnalisé…';

  @override
  String get iarReportUserTitle => 'Signaler l\'utilisateur';

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
  String get iarReasonInappropriateProfile => 'Profil inapproprié';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Le profil de cet utilisateur contient du contenu inapproprié';

  @override
  String typingIndicatorOne(String name) {
    return 'Touche $name en train de taper...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 et $name2 sont en train de taper...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 et $name3 sont en train de taper...';
  }

  @override
  String get typingIndicatorMultiple => 'Plusieurs personnes tapent...';

  @override
  String get typingIndicatorHandful =>
      'Une poignée de guerriers du clavier se préparent...';

  @override
  String get typingIndicatorSymphony =>
      'Une symphonie de clics de touches est en cours...';

  @override
  String get typingIndicatorFiesta =>
      'C\'est une véritable fiesta de frappe ici';

  @override
  String get typingIndicatorApocalypse => 'C\'est une apocalypse de frappe';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Content que tu sois là, $username !';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Bienvenue, $username ! Fais comme chez toi.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Bonjour, $username ! Content de t\'avoir ici.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Bonjour, $username ! Lance-toi quand tu es prêt.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Salut $username, content de te voir ici !';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Salut $username ! J\'espère que tu apprécieras ton séjour.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Salut $username, bienvenue à bord !';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Content que tu sois là, $username !';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Bienvenue, $username !';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Bienvenue, $username !';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Bienvenue, $username ! Nous sommes contents que tu sois là.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Bienvenue, $username ! J\'espère que tu apprécieras ton séjour ici.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Bienvenue, $username ! Ta prochaine conversation commence ici.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Bienvenue, $username. Nous sommes heureux de t\'avoir ici.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Content de te voir, $username ! Bienvenue.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Tu es là, $username ! Content de t\'avoir parmi nous.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Tu es arrivé, $username ! Commençons.';
  }

  @override
  String get relativeTimeShortNow => 'maintenant';

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
      other: '${count}j',
      one: '1j',
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
  String get linkedDevicesTitle => 'Mes appareils';

  @override
  String get linkedDevicesDescription =>
      'Voir tous les appareils actuellement connectés à votre compte. Révoquez les sessions que vous ne reconnaissez pas.';

  @override
  String get linkedDevicesCurrentDevice => 'Appareil actuel';

  @override
  String get linkedDevicesOtherDevices => 'Autres appareils';

  @override
  String get linkedDevicesEnterSelection => 'Passer en mode sélection';

  @override
  String get linkedDevicesExitSelection => 'Quitter le mode sélection';

  @override
  String get linkedDevicesSelectAll => 'Tout sélectionner';

  @override
  String get linkedDevicesClearSelection => 'Effacer la sélection';

  @override
  String get linkedDevicesRevokeTooltip => 'Révoquer l\'appareil';

  @override
  String get linkedDevicesSignOutAll =>
      'Se déconnecter de tous les autres appareils';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se déconnecter de $count appareils',
      one: 'Se déconnecter de 1 appareil',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se déconnecter de $count appareils',
      one: 'Se déconnecter de 1 appareil',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Se déconnecter de tous les autres appareils';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Cela déconnectera les appareils sélectionnés de votre compte. Vous devrez vous reconnecter sur ces appareils.',
      one:
          'Cela déconnectera l\'appareil sélectionné de votre compte. Vous devrez vous reconnecter sur cet appareil.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Cela déconnectera les appareils sélectionnés de votre compte. Vous devrez vous reconnecter sur ces appareils.';

  @override
  String get linkedDevicesSignOutConfirm => 'Continuer';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Vous devrez vous reconnecter sur tous les appareils déconnectés';

  @override
  String get linkedDevicesLoadErrorTitle => 'Erreur réseau';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Nous avons des difficultés à nous connecter au continuum espace-temps. Veuillez vérifier votre connexion et réessayer.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Appareils révoqués',
      one: 'Appareil révoqué',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'Impossible de se déconnecter. Réessayez.';

  @override
  String get linkedDevicesUnknownOs => 'OS inconnu';

  @override
  String get linkedDevicesUnknownPlatform => 'Plateforme inconnue';

  @override
  String slowmodeLabel(String duration) {
    return '$duration mode lent';
  }

  @override
  String get slowmodeTooltipActive =>
      'Vous êtes en mode lent. Veuillez patienter avant d\'envoyer un autre message.';

  @override
  String get slowmodeTooltipImmune =>
      'Le mode lent est activé, mais vous êtes immunisé.';

  @override
  String get channelNoSendPermissionHint =>
      'Vous ne pouvez pas envoyer de messages dans ce salon.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Annonces système du personnel de $productName. Vous ne pouvez pas répondre ici.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'La messagerie est temporairement suspendue dans cette communauté.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Vous êtes en sourdine. La messagerie, les réactions et la voix sont suspendues jusqu\'à la fin de la période de sourdine.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Vous devez réclamer votre compte pour envoyer des messages dans cette communauté.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Vous devez vérifier votre e-mail pour envoyer des messages dans cette communauté.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Votre compte est trop récent pour envoyer des messages dans cette communauté.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Vous n\'êtes pas membre de cette communauté depuis assez longtemps pour envoyer des messages.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Vous devez vérifier un numéro de téléphone pour envoyer des messages dans cette communauté.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Vérifier l\'e-mail';

  @override
  String get channelComposerBarrierVerifyPhone => 'Vérifier le téléphone';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Trop de pièces jointes (max $max)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'Un ou plusieurs fichiers dépassent la limite de taille';

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Ces fichiers sont trop volumineux pour être envoyés ensemble';

  @override
  String get chatAttachmentDropToUpload =>
      'Déposez les fichiers pour les télécharger';

  @override
  String get chatAttachmentDropToSend =>
      'Déposez les fichiers pour les envoyer maintenant';

  @override
  String get chatAttachmentSendVoiceMessage => 'Envoyer un message vocal';

  @override
  String get voiceMessageTitle => 'Message vocal';

  @override
  String get voiceMessageHoldHint =>
      'Maintenez pour enregistrer. Faites glisser vers le haut pour verrouiller, ou relâchez pour envoyer.';

  @override
  String get voiceMessageDiscard => 'Supprimer le message vocal';

  @override
  String get voiceMessageSend => 'Envoyer le message vocal';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Impossible de démarrer l\'enregistrement. Autorisez l\'accès au microphone.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'L\'enregistrement vocal n\'est pas pris en charge sur cet appareil.';

  @override
  String get voiceMessageMicInUse =>
      'Quittez l\'appel vocal pour enregistrer un message vocal.';

  @override
  String get voiceMessageRecordingFailed =>
      'L\'enregistrement a échoué. Réessayez.';

  @override
  String get voiceMessageSendFailed =>
      'Impossible d\'envoyer le message vocal. Réessayez.';

  @override
  String get voiceMessageRecordingHint =>
      'Parlez maintenant. Appuyez sur Arrêter lorsque vous avez terminé — vous pourrez couper ensuite.';

  @override
  String get voiceMessageReviewHint =>
      'Faites glisser les poignées pour couper, puis appuyez sur Envoyer.';

  @override
  String get voiceMessageStop => 'Arrêter';

  @override
  String get voiceMessageStartRecording => 'Démarrer l\'enregistrement';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Lire';

  @override
  String get voiceMessagePause => 'Pause';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'La sélection doit durer au moins ${secondsString}s.';
  }

  @override
  String get chatAttachmentEditTitle => 'Modifier la pièce jointe';

  @override
  String get chatAttachmentFilenameLabel => 'Nom du fichier';

  @override
  String get chatAttachmentDescriptionLabel => 'Description';

  @override
  String get chatAttachmentDescriptionHint => 'Texte alternatif facultatif';

  @override
  String get chatAttachmentSpoilerLabel => 'Marquer comme spoiler';

  @override
  String get chatAttachmentRemove => 'Supprimer la pièce jointe';

  @override
  String get chatAttachmentDownload => 'Télécharger';

  @override
  String get chatAttachmentDownloadedToast => 'Saved to photos';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Couldn\'t download attachment';

  @override
  String get chatAttachmentExpiredTooltip => 'Pièce jointe expirée';

  @override
  String get chatAttachmentSourceGallery => 'Galerie';

  @override
  String get chatAttachmentSourceCamera => 'Caméra';

  @override
  String get chatAttachmentSourceBrowse => 'Parcourir les fichiers';

  @override
  String get chatAttachmentPasteTooltip => 'Coller l\'image du presse-papiers';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Révéler le spoiler';

  @override
  String get matureMediaRevealButton => 'Révéler';

  @override
  String get matureMediaRevealHint => 'Cliquez pour révéler';

  @override
  String get matureContentTitle => 'Contenu mature';

  @override
  String get matureCommunityTitle => 'Communauté pour adultes';

  @override
  String get matureCategoryTitle => 'Catégorie pour adultes';

  @override
  String get matureChannelTitle => 'Canal pour adultes';

  @override
  String get communityContentWarningTitle =>
      'Avertissement de contenu communautaire';

  @override
  String get categoryContentWarningTitle =>
      'Avertissement de contenu de catégorie';

  @override
  String get channelContentWarningTitle => 'Avertissement de contenu de canal';

  @override
  String get defaultContentWarningBody => 'Ceci contient du contenu sensible.';

  @override
  String get matureCommunityBody =>
      'Cette communauté est marquée pour du contenu pour adultes et peut contenir du matériel inapproprié pour certains utilisateurs.';

  @override
  String get matureCategoryBody =>
      'Cette catégorie est marquée pour du contenu pour adultes et peut contenir du matériel inapproprié pour certains utilisateurs.';

  @override
  String get matureChannelBody =>
      'Ce canal est marqué pour du contenu pour adultes et peut contenir du matériel inapproprié pour certains utilisateurs.';

  @override
  String get matureVoiceChannelBody =>
      'Ce canal vocal est marqué pour du contenu pour adultes et peut contenir du matériel inapproprié pour certains utilisateurs.';

  @override
  String get matureLinkChannelBody =>
      'Ce canal de liens est marqué pour du contenu pour adultes et peut ouvrir du matériel inapproprié pour certains utilisateurs.';

  @override
  String get matureCommunityUnavailableBody =>
      'Cette communauté pour adultes n\'est pas disponible pour votre compte.';

  @override
  String get matureCategoryUnavailableBody =>
      'Cette catégorie pour adultes n\'est pas disponible pour votre compte.';

  @override
  String get matureChannelUnavailableBody =>
      'Ce canal pour adultes n\'est pas disponible pour votre compte.';

  @override
  String get matureContentProceedButton => 'Continuer';

  @override
  String get matureContentUnderstandButton => 'Je comprends';

  @override
  String get matureContentOpenLinkButton => 'Ouvrir le lien';

  @override
  String get sensitiveContentSectionTitle => 'Contenu sensible';

  @override
  String get sensitiveContentSectionDescription =>
      'Contrôlez la façon dont les médias pour adultes ou sensibles sont filtrés dans différents contextes';

  @override
  String get sensitiveContentFriendDmLabel => 'Messages directs d\'amis';

  @override
  String get sensitiveContentNonFriendDmLabel =>
      'Messages directs d\'autres personnes';

  @override
  String get sensitiveContentGuildLabel =>
      'Messages dans les canaux communautaires';

  @override
  String get sensitiveContentFilterShow => 'Afficher';

  @override
  String get sensitiveContentFilterBlur => 'Flouter';

  @override
  String get sensitiveContentFilterBlock => 'Bloquer';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Flouter les médias jusqu\'à la fin de l\'analyse de sécurité';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Lorsque cette option est activée, les images et les vidéos sont floutées jusqu\'à la fin de l\'analyse de sécurité du contenu.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Ce paramètre est toujours activé pour votre compte.';

  @override
  String get sensitiveContentResetButton => 'Réinitialiser';

  @override
  String get sensitiveContentSaveButton => 'Enregistrer';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fichiers',
      one: '1 fichier',
    );
    return 'Téléchargement de $_temp0';
  }

  @override
  String get chatCancelUpload => 'Annuler le téléchargement';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Expire le $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Expire entre le $start et le $end';
  }

  @override
  String get connectionsTitle => 'Connexions';

  @override
  String get connectionsDescription =>
      'Liez des comptes et des domaines externes à votre profil Fluxer. Les connexions vérifiées seront affichées sur votre profil pour que d\'autres puissent les voir.';

  @override
  String get connectionsEmptyTitle => 'Aucune connexion pour le moment';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Liez votre compte Bluesky ou vérifiez la propriété d\'un domaine pour les afficher sur votre profil.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Vérifiez la propriété d\'un domaine pour l\'afficher sur votre profil.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Domaine';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Ajouter une connexion Bluesky';

  @override
  String get connectionsAddDomainAriaLabel =>
      'Ajouter une connexion de domaine';

  @override
  String get connectionEdit => 'Modifier';

  @override
  String get connectionRemove => 'Supprimer';

  @override
  String get connectionVerifiedLabel => 'Cette connexion a été vérifiée.';

  @override
  String get connectionUnverifiedLabel =>
      'Cette connexion n\'a pas été vérifiée.';

  @override
  String get connectionAddTitle => 'Ajouter une connexion';

  @override
  String get connectionTypeLabel => 'Type de connexion';

  @override
  String get connectionHandleLabel => 'Pseudonyme';

  @override
  String get connectionDomainLabel => 'Domaine';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Vous avez déjà cette connexion.';

  @override
  String get connectionConnectBluesky => 'Se connecter avec Bluesky';

  @override
  String get connectionContinue => 'Continuer';

  @override
  String get connectionVerifyTitle => 'Vérifier la connexion';

  @override
  String get connectionVerifyInstructions =>
      'Utilisez l\'enregistrement ci-dessous pour prouver la propriété du domaine.';

  @override
  String get connectionDnsRecordTitle => 'Enregistrement TXT DNS';

  @override
  String get connectionDnsHostLabel => 'Hôte';

  @override
  String get connectionDnsValueLabel => 'Valeur';

  @override
  String get connectionCopyHost => 'Copier l\'hôte';

  @override
  String get connectionCopyValue => 'Copier la valeur';

  @override
  String get connectionCopied => 'Copié !';

  @override
  String get connectionTokenFileTitle => 'Servir le fichier de jeton';

  @override
  String get connectionTokenFileDescription =>
      'Téléchargez **fluxer-verification** et placez-le dans votre dossier **.well-known** afin que nous puissions valider le domaine.';

  @override
  String get connectionTokenFileDownload => 'Télécharger fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Le fichier contient le jeton de vérification que nous allons récupérer depuis **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle =>
      'Enregistrer fluxer-verification';

  @override
  String get connectionVerifyButton => 'Vérifier';

  @override
  String get connectionBack => 'Retour';

  @override
  String get connectionEditTitle => 'Modifier la connexion';

  @override
  String get connectionEditDescription =>
      'Choisissez qui peut voir cette connexion sur votre profil.';

  @override
  String get connectionVisibilityEveryone => 'Tout le monde';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Permettre à tout le monde de voir cette connexion sur votre profil';

  @override
  String get connectionVisibilityFriends => 'Amis';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Permettre à vos amis de voir cette connexion';

  @override
  String get connectionVisibilityCommunityMembers => 'Membres de la communauté';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Permettre aux membres des communautés auxquelles vous appartenez de voir cette connexion';

  @override
  String get connectionRemoveTitle => 'Supprimer la connexion';

  @override
  String get connectionRemoveDescription =>
      'Êtes-vous sûr de vouloir supprimer cette connexion ? Cette action est irréversible.';

  @override
  String get connectionRemoveConfirm => 'Supprimer';

  @override
  String get connectionsLoadError => 'Échec du chargement des connexions';

  @override
  String get connectionsReorderError => 'Échec de la mise à jour de l\'ordre';

  @override
  String get connectionInitiateFailed =>
      'Impossible de démarrer la vérification. Réessayez.';

  @override
  String get connectionVerifyFailed =>
      'Impossible de vérifier. Vérifiez votre enregistrement DNS et réessayez.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Impossible de démarrer l\'autorisation Bluesky.';

  @override
  String get connectionUpdateFailed =>
      'Impossible de mettre à jour la connexion';

  @override
  String get connectionRemoveFailed => 'Impossible de supprimer la connexion';

  @override
  String get connectionTokenSavedToast => 'fluxer-verification enregistré';

  @override
  String get connectionTokenSaveFailedToast =>
      'Impossible d\'enregistrer le fichier';

  @override
  String get connectionEnterHandle => 'Entrez un pseudonyme Bluesky.';

  @override
  String get connectionEnterDomain => 'Entrez un domaine.';

  @override
  String get lookAndFeelTitle => 'Apparence';

  @override
  String get lookAndFeelThemeSectionTitle => 'Thème';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Choisissez entre une apparence sombre, anthracite ou claire.';

  @override
  String get lookAndFeelThemeDark => 'Thème sombre';

  @override
  String get lookAndFeelThemeCoal => 'Thème anthracite';

  @override
  String get lookAndFeelThemeLight => 'Thème clair';

  @override
  String get lookAndFeelThemeSystem => 'Thème système';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Synchroniser le thème sur tous les appareils';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Lorsque cette option est activée, les modifications de thème seront synchronisées sur tous vos appareils. Lorsqu\'elle est désactivée, cet appareil utilisera son propre paramètre de thème.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Le thème du système désactive automatiquement la synchronisation pour suivre les préférences de votre système sur cet appareil.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Impossible de synchroniser le thème avec votre compte. Veuillez réessayer.';

  @override
  String get lookAndFeelChatFontScalingTitle =>
      'Mise à l\'échelle des polices de discussion';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Ajustez la taille de la police dans la zone de discussion.';

  @override
  String get lookAndFeelInterfaceTitle => 'Interface';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Personnalisez les éléments et les comportements de l\'interface.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Indicateurs de frappe dans la liste des canaux';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Choisissez comment les indicateurs de frappe apparaissent dans la liste des canaux lorsque quelqu\'un tape dans un canal.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Indicateur de frappe + Avatars';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Afficher l\'indicateur de frappe avec les avatars des utilisateurs dans la liste des canaux';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Indicateur de frappe uniquement';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Afficher uniquement l\'indicateur de frappe sans avatars';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Masqué';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Ne pas afficher les indicateurs de frappe dans la liste des canaux';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Afficher la frappe sur le canal sélectionné';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Lorsqu\'elle est désactivée (par défaut), les indicateurs de frappe n\'apparaîtront pas sur le canal que vous consultez actuellement.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'général';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Indices clavier';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Contrôlez si les indices de raccourcis clavier apparaissent dans les infobulles.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Masquer les indices clavier dans les infobulles';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Lorsqu\'elle est activée, les badges de raccourcis sont masqués dans les fenêtres contextuelles d\'infobulles.';

  @override
  String get lookAndFeelNekoTitle => 'Divers';

  @override
  String get lookAndFeelNekoDescription => 'Options d\'interface diverses.';

  @override
  String get lookAndFeelShowNekoLabel => 'Afficher Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Lorsqu\'elle est activée, Neko apparaît près de la barre de saisie de discussion.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Comportement de connexion aux canaux vocaux';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Contrôlez la façon dont vous rejoignez les canaux vocaux dans les communautés.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Exiger un double-clic pour rejoindre les canaux vocaux';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Lorsqu\'elle est activée, vous devrez double-cliquer sur les canaux vocaux pour les rejoindre. Lorsqu\'elle est désactivée (par défaut), un simple clic vous rejoindra immédiatement dans le canal.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Le rapide renard brun saute par-dessus le chien paresseux.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Barre latérale des serveurs';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Configurez la façon dont la barre latérale des serveurs affiche les messages directs.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count communautés sont temporairement indisponibles en raison d\'un dysfonctionnement du condensateur de flux.',
      one:
          '1 communauté est temporairement indisponible en raison d\'un dysfonctionnement du condensateur de flux.',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel => 'Réduire les MP dans un dossier';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'Lorsqu\'elle est activée, les MP non lus dans la barre latérale des serveurs sont réduits dans un dossier sur le bouton Fluxer. Cliquez sur le bouton Fluxer lorsque vous êtes sur la page des MP pour développer ou réduire le dossier.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Liste des canaux';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Contrôlez le comportement de l\'indicateur de non-lu pour les canaux mis en sourdine dans les listes de canaux.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Afficher l\'indicateur de non-lu sur les canaux mis en sourdine';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Lorsqu\'elle est activée, les canaux mis en sourdine affichent un indicateur de non-lu atténué sur le côté gauche. Les mentions apparaissent toujours indépendamment de ce paramètre.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Actifs maintenant';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Contrôlez la façon dont \"Actifs maintenant\" apparaît dans l\'application.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Afficher \"Actifs maintenant\" sur l\'écran d\'accueil';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Affiche \"Actifs maintenant\" sur l\'écran d\'accueil pour présenter les amis actifs vocalement. Vous verrez un aperçu, le contexte du canal, qui est déjà là, et un moyen rapide de les rejoindre.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Favoris';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Contrôlez la visibilité des favoris dans toute l\'application.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Activer les favoris';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Lorsqu\'elle est activée, vous pouvez mettre des canaux en favoris et ils apparaîtront dans la section Favoris. Lorsqu\'elle est désactivée, tous les éléments d\'interface liés aux favoris (boutons, éléments de menu) seront masqués. Vos favoris existants seront conservés.';

  @override
  String get favoritesTitle => 'Favoris';

  @override
  String get favoritesEmptyTitle => 'Aucun favori pour le moment';

  @override
  String get favoritesEmptyDescription =>
      'Étoilez des chaînes depuis l\'en-tête de chat pour les conserver ici.';

  @override
  String get favoritesWelcomeTitle => 'Bienvenue dans les favoris';

  @override
  String get favoritesWelcomeDescription =>
      'Votre espace personnel pour un accès rapide aux chaînes, aux messages directs et aux groupes que vous aimez. Appuyez sur l\'étoile d\'une chaîne pour l\'ajouter ici.';

  @override
  String get favoritesWelcomeTip =>
      'Pas pour vous ? Désactivez-le à tout moment.';

  @override
  String get favoritesDisableButton => 'Désactiver les favoris';

  @override
  String get favoritesAddedToast => 'Ajouté aux favoris';

  @override
  String get favoritesRemovedToast => 'Supprimé des favoris';

  @override
  String get favoritesHiddenToast => 'Favoris masqués';

  @override
  String get favoritesMute => 'Masquer les favoris';

  @override
  String get favoritesUnmute => 'Afficher les favoris';

  @override
  String get favoritesHeaderMenu => 'Menu des favoris';

  @override
  String get favoritesCreateCategory => 'Créer une catégorie';

  @override
  String get favoritesCategoryNameLabel => 'Nom de la catégorie';

  @override
  String get favoritesHideMutedChannels => 'Masquer les chaînes masquées';

  @override
  String get favoritesShowMutedChannels => 'Afficher les chaînes masquées';

  @override
  String get favoritesSetNickname => 'Définir un surnom';

  @override
  String get favoritesNicknameLabel => 'Surnom';

  @override
  String get favoritesSaveNickname => 'Enregistrer le surnom';

  @override
  String get favoritesMoveToCategory => 'Déplacer vers la catégorie';

  @override
  String get favoritesUncategorized => 'Non classé';

  @override
  String get favoritesOtherCategory => 'Autre';

  @override
  String get favoritesRemoveFromFavorites => 'Supprimer des favoris';

  @override
  String get favoritesAddToFavorites => 'Ajouter aux favoris';

  @override
  String get favoritesHideConfirmTitle => 'Masquer les favoris';

  @override
  String get favoritesHideConfirmDescription =>
      'Cela masquera tous les éléments de l\'interface utilisateur liés aux favoris, y compris les boutons et les éléments de menu. Vos favoris existants seront conservés et pourront être réactivés à tout moment dans Paramètres > Avancé > Apparence.';

  @override
  String get favoritesDirectMessageSubtitle => 'Message direct';

  @override
  String get messagesMediaDisplayGroupTitle => 'Affichage';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Contrôlez la façon dont les messages, les médias et le contenu sont affichés.';

  @override
  String get messagesMediaMediaGroupTitle => 'Médias';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Personnalisez les préférences de taille des médias et les boutons.';

  @override
  String get messagesMediaInputGroupTitle => 'Saisie';

  @override
  String get messagesMediaInputGroupDescription =>
      'Personnalisez les paramètres de saisie des messages.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Barre latérale';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Configurez l\'affichage de la barre latérale de la communauté.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Masquer les chaînes masquées par défaut';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Masquez automatiquement les chaînes masquées dans la barre latérale lorsque vous rejoignez de nouvelles communautés';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Masquer les chaînes masquées par défaut ?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Les nouvelles communautés que vous rejoignez auront automatiquement les chaînes masquées masquées. Souhaitez-vous également appliquer ce paramètre à toutes vos communautés existantes ?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Arrêter de masquer les chaînes masquées par défaut ?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Les nouvelles communautés que vous rejoignez n\'auront plus les chaînes masquées masquées automatiquement. Souhaitez-vous également afficher les chaînes masquées dans toutes vos communautés existantes ?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Appliquer à toutes les communautés';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Afficher dans toutes les communautés';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Nouvelles communautés uniquement';

  @override
  String get messagesMediaDisplaySectionTitle => 'Affichage des médias';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Contrôlez la façon dont les images, vidéos et autres médias sont affichés. Tous les médias sont redimensionnés et convertis. Les fichiers extrêmement volumineux qui ne peuvent pas être compressés en aperçu ne seront pas intégrés, quelles que soient ces paramètres.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Lorsqu\'ils sont publiés sous forme de liens vers le chat';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'Lorsqu\'ils sont téléchargés directement sur Fluxer';

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Aperçus de liens';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Contrôlez la façon dont les liens de sites Web sont prévisualisés dans le chat';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Afficher les intégrations et prévisualiser les liens de sites Web';

  @override
  String get messagesMediaReactionsSectionTitle => 'Réactions';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Configurer les réactions emoji aux messages';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Afficher les réactions emoji aux messages';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Contenu masqué';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Contrôler l\'affichage du contenu masqué';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Afficher le contenu masqué';

  @override
  String get messagesMediaSpoilersOnClickName => 'Au clic';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Afficher le contenu masqué lorsqu\'il est cliqué';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'Dans les canaux que je modère';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Toujours afficher le contenu masqué dans les canaux où vous avez la permission « Gérer les messages »';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Toujours';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Toujours afficher le contenu masqué';

  @override
  String get messagesMediaSizeSectionTitle =>
      'Préférences de taille des médias';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Personnalisez la taille d\'affichage maximale des médias intégrés et joints. Des tailles plus petites utilisent moins d\'espace d\'écran, tandis que des tailles plus grandes montrent plus de détails.';

  @override
  String get messagesMediaSizeEmbedLabel =>
      'Médias à partir de liens (intégrations)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Pièces jointes téléchargées';

  @override
  String get messagesMediaSizeCompactName => 'Compact (400x300)';

  @override
  String get messagesMediaSizeCompactDescription =>
      'Taille de média plus petite';

  @override
  String get messagesMediaSizeComfortableName => 'Confortable (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Taille de média plus grande avec plus de détails';

  @override
  String get messagesMediaGifsSectionTitle => 'Comportement des GIF';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Contrôler la façon dont les GIF sont insérés dans le chat';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Envoyer automatiquement les GIF lorsqu\'ils sont sélectionnés';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Complétion automatique d\'expressions (complétion par deux-points)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Contrôler ce qui apparaît dans la complétion automatique d\'expressions lorsque vous tapez deux-points. Personnalisez les suggestions qui s\'affichent pour correspondre à vos préférences.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Afficher les emojis par défaut dans la complétion automatique d\'expressions';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Afficher les emojis personnalisés dans la complétion automatique d\'expressions';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Afficher les autocollants dans la complétion automatique d\'expressions';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Afficher les médias enregistrés dans la complétion automatique d\'expressions';

  @override
  String get messagesMediaEditingSectionTitle => 'Modification des messages';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Contrôler ce qui arrive à votre brouillon de modification lorsque vous annulez.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Conserver le brouillon de modification en cas d\'annulation';

  @override
  String get accessibilitySaturationTitle => 'Saturation';

  @override
  String get accessibilitySaturationDescription =>
      'Adjust how vivid theme colors appear across the app.';

  @override
  String get accessibilityUnreadGroupTitle => 'Indicateurs de non-lu';

  @override
  String get accessibilityUnreadGroupDescription =>
      'Contrôler la façon dont les indicateurs de messages non lus sont affichés.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'Afficher l\'indicateur de non-lu estompé sur les canaux mis en sourdine';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'Affichez un indicateur de non-lu atténué à côté des messages directs et des canaux mis en sourdine afin que vous puissiez toujours voir d\'un coup d\'œil lorsqu\'il y a de l\'activité.';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'Aperçus des messages DM';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Contrôler quand les aperçus de messages sont affichés dans la liste des DM.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Mode d\'aperçu des messages DM';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Tous les messages';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Afficher les aperçus de messages pour toutes les conversations DM';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'DM non lus uniquement';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Afficher uniquement les aperçus de messages pour les DM avec des messages non lus';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Aucun';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Ne pas afficher les aperçus de messages dans la liste des DM';

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
  String get dmListSentAnAttachment => 'A envoyé une pièce jointe';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username a épinglé un message dans ce canal.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username a ajouté $userName au groupe.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username a ajouté quelqu\'un au groupe.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username a quitté le groupe.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username a retiré $userName du groupe.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username a retiré quelqu\'un du groupe.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username a renommé le canal en $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username a renommé le canal.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username a changé l\'icône du canal.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username a lancé un appel.';
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
  String get voiceConnectionConfirmTitle => 'Confirmation de connexion vocale';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Vous êtes déjà connecté à ce canal vocal depuis $count autres appareils. Que souhaitez-vous faire ?',
      one:
          'Vous êtes déjà connecté à ce canal vocal depuis 1 autre appareil. Que souhaitez-vous faire ?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Passer à cet appareil';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Rejoindre simplement (conserver les autres connexions)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Ne rien faire, je ne veux pas rejoindre';

  @override
  String get voiceJoinFailedTitle => 'Couldn\'t Join Voice';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Couldn\'t disconnect your other devices. Try again in a moment.';

  @override
  String get voiceChannelEmptyDescription =>
      'Ceci est un canal vocal. Connectez-vous pour commencer à parler !';

  @override
  String get voiceChannelJoin => 'Rejoindre le canal vocal';

  @override
  String get voiceCallJoin => 'Join call';

  @override
  String get voiceChannelJoinConnect => 'Se connecter à la voix';

  @override
  String get voiceChannelNoConnectPermission =>
      'Vous n\'avez pas la permission de rejoindre ce canal vocal';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Le contenu du microphone, de la caméra et du partage d\'écran est chiffré de bout en bout.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Le contenu du microphone, de la caméra et du partage d\'écran est chiffré de bout en bout.';

  @override
  String get voiceChannelE2eeBroken =>
      'Le chiffrement de bout en bout n\'est pas disponible car un participant non compatible est dans ce canal vocal.';

  @override
  String get voiceCallE2eeBroken =>
      'Le chiffrement de bout en bout n\'est pas disponible car un participant non compatible est dans cet appel.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Ce client doit être mis à jour avant de rejoindre cet appel chiffré.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Impossible de démarrer votre microphone. Vous êtes toujours dans l\'appel.';

  @override
  String get voiceChannelStatusConnecting => 'Connexion en cours…';

  @override
  String get voiceChannelStatusConnected => 'Connecté';

  @override
  String get voiceChannelStatusError => 'Erreur';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Appareil mobile';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Appareil de bureau';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Muted par la communauté';

  @override
  String get voiceParticipantTooltipMuted => 'Coupé';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Assourdi par la communauté';

  @override
  String get voiceParticipantTooltipDeafened => 'Assourdi';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Connexion : $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count participants',
      one: '1 participant',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Quitter';

  @override
  String get voiceControlMute => 'Couper le son';

  @override
  String get voiceControlUnmute => 'Rétablir le son';

  @override
  String get voiceControlDeafen => 'Assourdir';

  @override
  String get voiceControlUndeafen => 'Annuler l\'assourdissement';

  @override
  String get voiceControlVideo => 'Vidéo';

  @override
  String get voiceControlFlipCamera => 'Retourner la caméra';

  @override
  String get voiceControlScreenShare => 'Partage d\'écran';

  @override
  String get voiceScreenShareNotificationText => 'Partage de votre écran.';

  @override
  String get voiceControlMore => 'Plus';

  @override
  String get voiceControlDisconnect => 'Déconnecter';

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
  String get voiceTextChatShow => 'Afficher le chat';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# messages non lus',
      one: '# message non lu',
    );
    return 'Afficher le chat avec $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'La permission de la caméra est requise pour la vidéo.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Impossible de démarrer le partage d\'écran. Veuillez réessayer.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'La permission de partage d\'écran a été refusée.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Le partage d\'écran n\'est pas disponible sur cet appareil.';

  @override
  String get voiceWatchStream => 'Regarder le flux';

  @override
  String get voiceStopWatching => 'Arrêter de regarder';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Arrêter de regarder le flux actuel';

  @override
  String get voiceOwnScreenShareTitle => 'Vous diffusez';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Votre flux est en direct pour les participants.';

  @override
  String get voiceLiveBadge => 'EN DIRECT';

  @override
  String get dmVoiceViewCall => 'Voir l\'appel';

  @override
  String get dmVoiceCallFullScreen => 'Plein écran';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Ouvrir l\'appel en plein écran';

  @override
  String get dmVoiceStripStatusConnecting => 'Connexion...';

  @override
  String get dmVoiceStripStatusInCall => 'En appel';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Appel vocal';

  @override
  String get dmVoiceCallBarConnecting => 'Connexion...';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Appel direct';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Appel de groupe';

  @override
  String get dmVoiceCallBarIssueFallback => 'Problème vocal';

  @override
  String get dmVoiceFullscreenTitle => 'Voix';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Voix connectée';

  @override
  String get notificationsPageTitle => 'Notifications';

  @override
  String get notificationsFilterUnreads => 'Non lus';

  @override
  String get notificationsFilterMentions => 'Mentions';

  @override
  String get notificationsBookmarksTooltip => 'Signets';

  @override
  String get notificationsMentionFilterTooltip => 'Filtrer les mentions';

  @override
  String get notificationsMentionFiltersTitle => 'Filtres de mentions';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Inclure les mentions @everyone et @here';

  @override
  String get notificationsMentionIncludeRoles => 'Inclure les mentions de rôle';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Inclure toutes les mentions de communauté';

  @override
  String get notificationsNoUnreadTitle => 'Aucun message non lu';

  @override
  String get notificationsNoUnreadBody => 'Vous êtes à jour.';

  @override
  String get notificationsNoMentionsTitle => 'Aucune mention récente';

  @override
  String get notificationsNoMentionsBody =>
      'Toutes les @mentions de vous apparaîtront ici pendant 7 jours.';

  @override
  String get notificationsMentionsEndTitle => 'Vous êtes arrivé à la fin';

  @override
  String get notificationsMentionsEndBody =>
      'Vous avez vu toutes vos mentions récentes. Ne vous inquiétez pas, d\'autres apparaîtront bientôt ici.';

  @override
  String get notificationsJump => 'Aller';

  @override
  String get notificationsRemoveMentionTooltip => 'Supprimer la mention';

  @override
  String get notificationsViewAllUnread => 'Voir tous les non lus';

  @override
  String get notificationsMarkAsRead => 'Marquer comme lu';

  @override
  String get notificationsExpand => 'Développer';

  @override
  String get notificationsCollapse => 'Réduire';

  @override
  String get notificationsMessageUnavailable =>
      'Ce message n\'a pas pu être chargé.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining caractères restants';
  }

  @override
  String get characterCounterTooLong => 'Le message est trop long';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining caractères restants. Obtenez $productName pour écrire jusqu\'à $premiumMaxLength caractères.';
  }

  @override
  String get chatMessageFailedToSend => 'Échec de l\'envoi du message';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Votre message n\'a pas pu être délivré. C\'est généralement parce que vous ne partagez pas de communauté avec le destinataire ou que le destinataire n\'accepte les messages directs que de ses amis. Vous devrez peut-être également ajuster vos propres paramètres de confidentialité des messages directs dans $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Votre message n\'a pas pu être délivré. Vous devez revendiquer votre compte pour envoyer des messages directs.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Votre message n\'a pas pu être délivré. Vous devez revendiquer votre compte pour envoyer des messages.';

  @override
  String get chatSendFailureContentBlocked =>
      'Votre message n\'a pas pu être délivré car il a été signalé par nos systèmes de sécurité. Si vous pensez qu\'il s\'agit d\'une erreur, veuillez contacter le support.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Votre message n\'a pas pu être délivré car il contient des emoji ou des autocollants pour adultes qui ne sont pas autorisés dans ce contexte.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'Seul vous pouvez voir ce message.';

  @override
  String get chatClientSystemDismiss => 'Ignorer';

  @override
  String get privacyDashboardCommunicationSection => 'Communication';

  @override
  String get chatMessageDeleteFailed => 'Échec de la suppression du message';

  @override
  String get chatMessageAddReaction => 'Ajouter une réaction';

  @override
  String get chatMessageEdit => 'Modifier le message';

  @override
  String get chatMessageReply => 'Répondre';

  @override
  String get chatMessageForward => 'Transférer';

  @override
  String get forwardMessageTitle => 'Transférer le message';

  @override
  String get forwardSearchHint => 'Rechercher des salons ou des MP';

  @override
  String get forwardDirectMessagesSection => 'Messages directs';

  @override
  String get forwardCommentHint => 'Ajouter un commentaire (facultatif)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Envoyer ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Aucun salon trouvé';

  @override
  String get forwardSuccessToast => 'Message transféré';

  @override
  String get forwardFailed => 'Échec du transfert du message';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Les commentaires sont indisponibles car un salon sélectionné a le mode lent activé.';

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
      'Vous ne pouvez pas envoyer de messages ici';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Vous ne pouvez pas intégrer de liens ici';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Vous ne pouvez pas joindre de fichiers ici';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'L\'envoi de messages est désactivé dans cette communauté';

  @override
  String get forwardDestinationTimedOut =>
      'Vous êtes en période d\'attente dans cette communauté';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Mode lent - attendez $remaining';
  }

  @override
  String get chatMessageCopyText => 'Copier le message';

  @override
  String get chatMessagePin => 'Épingler le message';

  @override
  String get chatMessageUnpin => 'Désépingler le message';

  @override
  String get chatMessageUnpinIt => 'Désépingler';

  @override
  String get chatMessageBookmark => 'Ajouter le message aux favoris';

  @override
  String get chatMessageRemoveBookmark => 'Supprimer des favoris';

  @override
  String get chatMessageMarkAsUnread => 'Marquer comme non lu';

  @override
  String get chatMessageCopyMessageLink => 'Copier le lien du message';

  @override
  String get chatMessageCopyMessageId => 'Copier l\'ID du message';

  @override
  String get chatMessageViewReactions => 'Voir les réactions';

  @override
  String get chatMessageRemoveAllReactions => 'Supprimer toutes les réactions';

  @override
  String get chatMessageDebug => 'Déboguer le message';

  @override
  String get chatMessageDebugSheetTitle => 'Message de débogage';

  @override
  String get chatMessageDebugCopyJson => 'Copier le JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'JSON du message copié dans le presse-papiers';

  @override
  String get chatReactionsSheetTitle => 'Réactions';

  @override
  String get chatReactionsSheetEmpty => 'Personne n\'a encore réagi à ceci.';

  @override
  String get chatReactionAddFailed => 'Failed to add reaction';

  @override
  String get chatReactionRemoveFailed => 'Failed to remove reaction';

  @override
  String get chatMessageReport => 'Signaler le message';

  @override
  String get iarReportMessageTitle => 'Signaler le message';

  @override
  String get iarThisUserFallback => 'cet utilisateur';

  @override
  String get iarModalDescription =>
      'Signaler une violation de règle, ou trouver des outils pour gérer les contacts et les préférences.';

  @override
  String get iarPathStepAriaLabel => 'Que vous faut-il ?';

  @override
  String get iarCategoryStepTitle => 'Quel type de règle a été enfreint ?';

  @override
  String get iarReasonStepTitle => 'Quelle règle a été enfreinte ?';

  @override
  String get iarReasonSelectHint => 'Sélectionner une raison';

  @override
  String get iarPickAnOptionToast => 'Choisissez une option pour continuer.';

  @override
  String get iarPickARuleToast => 'Choisissez la règle qui a été enfreinte.';

  @override
  String get iarPathPlatform =>
      'Signaler une violation de règle de la plateforme';

  @override
  String get iarPathCommunity => 'Signaler aux modérateurs de cette communauté';

  @override
  String get iarPathPreferenceMessage => 'Je n\'aime pas ce contenu';

  @override
  String get iarCategoryTargetedHarmLabel =>
      'Menaces, harcèlement ou préjudice';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Intimidation, menaces, discours haineux, violence, raids ou contenu incitant à l\'automutilation.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Sécurité des mineurs ou contenu pour adultes';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Mineurs en danger, contenu pour adultes inapproprié ou comportement non désiré.';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'Confidentialité ou usurpation d\'identité';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxxing, harcèlement, se faire passer pour quelqu\'un d\'autre ou profil inapproprié.';

  @override
  String get iarCategoryDeceptionLabel =>
      'Arnaques, logiciels malveillants ou désinformation';

  @override
  String get iarCategoryDeceptionDescription =>
      'Hameçonnage, fraude, liens malveillants ou fausses déclarations susceptibles de causer un préjudice réel.';

  @override
  String get iarCategoryIllegalOtherLabel => 'Activité illégale ou autre';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Ventes illégales, facilitation criminelle ou violation claire des règles qui ne correspond pas aux catégories ci-dessus.';

  @override
  String get iarReasonHarassmentLabel => 'Harcèlement ou menaces';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Intimidation, contact répété non désiré, harcèlement ou abus ciblé.';

  @override
  String get iarReasonHateLabel => 'Discours haineux';

  @override
  String get iarReasonHateMessageDescription =>
      'Insultes, langage déshumanisant ou attaques contre des groupes protégés.';

  @override
  String get iarReasonViolenceLabel => 'Violence ou menaces de violence';

  @override
  String get iarReasonViolenceDescription =>
      'Menaces crédibles, violence graphique ou glorification de la violence.';

  @override
  String get iarReasonMatureContentLabel =>
      'Contenu pour adultes ou harcèlement';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Comportement non désiré ou contenu pour adultes inapproprié.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Sécurité des enfants ou exploitation de mineurs';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Contenu de grooming ou d\'exploitation d\'enfants.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Désinformation dangereuse';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Fausses déclarations susceptibles de causer un préjudice réel.';

  @override
  String get iarReasonSpamLabel => 'Spam, arnaques ou hameçonnage';

  @override
  String get iarReasonSpamMessageDescription =>
      'Spam de masse, fraude, faux cadeaux ou abus de compte.';

  @override
  String get iarReasonMalwareLabel =>
      'Logiciels malveillants ou liens dangereux';

  @override
  String get iarReasonMalwareDescription =>
      'Logiciels malveillants, vol d\'identifiants ou fichiers dangereux.';

  @override
  String get iarReasonPrivacyLabel => 'Violation de la vie privée';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxxing, informations privées exposées ou harcèlement.';

  @override
  String get iarReasonImpersonationLabel =>
      'Usurpation d\'identité ou médias trompeurs';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Se faire passer pour quelqu\'un d\'autre, y compris du contenu généré par IA trompeur.';

  @override
  String get iarReasonIllegalLabel => 'Activité illégale';

  @override
  String get iarReasonIllegalDescription =>
      'Ventes illégales, facilitation criminelle ou activité illégale.';

  @override
  String get iarReasonSelfHarmLabel => 'Automutilation ou suicide';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Promotion ou instructions encourageant l\'automutilation ou les troubles alimentaires.';

  @override
  String get iarReasonOtherLabel => 'Autre violation claire des règles';

  @override
  String get iarReasonOtherDescription =>
      'Utilisez uniquement si cela enfreint clairement les règles de Fluxer et ne correspond pas aux catégories ci-dessus.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Si un mineur est impliqué, utilisez \"$childSafetyReason\" à la place.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Si cela implique du CSAM ou l\'exploitation d\'un mineur, envoyez-le maintenant et ne partagez plus le matériel.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Si une personne risque un danger immédiat, contactez les services d\'urgence locaux si vous pouvez le faire en toute sécurité.';

  @override
  String get iarSafetyNoteViolence =>
      'S\'il s\'agit d\'une menace imminente crédible, contactez également les services d\'urgence locaux.';

  @override
  String get iarSafetyNoteTerrorism =>
      'S\'il s\'agit d\'une menace terroriste imminente, contactez également les services d\'urgence locaux.';

  @override
  String get iarActionBlockUserTitle => 'Bloquer cet utilisateur';

  @override
  String get iarActionBlockUserDescription =>
      'Arrêter les messages et les demandes d\'amis.';

  @override
  String get iarActionBlockUserButton => 'Bloquer';

  @override
  String get iarActionCopyMessageLinkTitle => 'Copier le lien du message';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Partager avec les modérateurs de la communauté.';

  @override
  String get iarActionCopyMessageLinkButton => 'Copier';

  @override
  String get iarActionCloseDmTitle => 'Fermer ce MP';

  @override
  String get iarActionCloseDmDescription =>
      'Ne bloque pas. Vous pouvez le rouvrir plus tard.';

  @override
  String get iarActionCloseDmButton => 'Fermer la MP';

  @override
  String get iarActionLeaveCommunityTitle => 'Quitter la communauté';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Arrêtez de voir son contenu et ses membres.';

  @override
  String get iarActionLeaveCommunityButton => 'Quitter';

  @override
  String get iarActionDmSettingsTitle =>
      'Paramètres des MP et des demandes d\'ami';

  @override
  String get iarActionDmSettingsDescription =>
      'Changez qui peut vous contacter.';

  @override
  String get iarActionCallSettingsTitle =>
      'Paramètres des appels et des discussions de groupe';

  @override
  String get iarActionCallSettingsDescription =>
      'Changez qui peut vous appeler ou vous ajouter.';

  @override
  String get iarActionOpenButton => 'Ouvrir';

  @override
  String get iarActionDeleteMessageTitle => 'Supprimer ce message';

  @override
  String get iarActionDeleteMessageDescription =>
      'Supprimez-le du canal pour tout le monde.';

  @override
  String get iarActionDeleteMessageButton => 'Supprimer';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Supprimé';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Ce message a déjà été supprimé.';

  @override
  String get iarActionBanUserTitle => 'Bannir cet utilisateur';

  @override
  String get iarActionBanUserDescription =>
      'Ouvrez la boîte de dialogue de bannissement pour cette communauté.';

  @override
  String get iarActionBanUserButton => 'Bannir';

  @override
  String get iarActionBanUserBannedButton => 'Banni';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Cet utilisateur est déjà banni de la communauté.';

  @override
  String get iarCloseDmConfirmTitle => 'Fermer la MP';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Fermez votre MP actuelle avec $name. Cela ne vous bloquera pas ; vous pourrez la rouvrir plus tard.';
  }

  @override
  String get iarSuccessTitle => 'Signalement envoyé';

  @override
  String get iarSuccessBody =>
      'Notre équipe de sécurité est en train de l\'examiner. Nous vous enverrons un message et un e-mail une fois que nous aurons rendu notre verdict.';

  @override
  String get iarAlreadyReportedTitle => 'Déjà signalé';

  @override
  String get iarAlreadyReportedBody =>
      'Vous avez déjà signalé ce message. Notre équipe de sécurité est en train de l\'examiner.';

  @override
  String get iarBackButton => 'Retour';

  @override
  String get iarContinueButton => 'Continuer';

  @override
  String get iarSendReportButton => 'Envoyer le signalement';

  @override
  String get iarDoneButton => 'Terminé';

  @override
  String get iarCouldntSendToast =>
      'Impossible d\'envoyer le signalement. Veuillez réessayer.';

  @override
  String get iarRateLimitedToast =>
      'Vous signalez trop rapidement. Veuillez patienter un moment et réessayer.';

  @override
  String get iarReportSentToast =>
      'Signalement envoyé. Notre équipe de sécurité l\'examinera.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Bloquer $name ? Il ne pourra pas vous envoyer de messages ni de demandes d\'ami. Vous pourrez le débloquer plus tard.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Impossible de bloquer cet utilisateur. Veuillez réessayer.';

  @override
  String get iarCloseDmSuccessToast => 'MP fermée.';

  @override
  String get iarCloseDmFailedToast =>
      'Impossible de fermer cette MP. Veuillez réessayer.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Impossible de quitter cette communauté. Veuillez réessayer.';

  @override
  String get chatMessageSuppressEmbeds => 'Supprimer les aperçus';

  @override
  String get chatMessageUnsuppressEmbeds => 'Afficher les aperçus';

  @override
  String get chatMessageDelete => 'Supprimer le message';

  @override
  String get chatMessageDeleteConfirmTitle => 'Supprimer le message';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Êtes-vous sûr de vouloir supprimer ce message ?';

  @override
  String get chatMessageDeleteAttachment => 'Delete Attachment';

  @override
  String get chatMessageEditAttachmentAltText => 'Edit Alt Text';

  @override
  String get chatMessageMore => 'Plus';

  @override
  String get chatEditingMessage => 'Modification du message';

  @override
  String get chatReplyOriginalDeleted => 'Le message d\'origine a été supprimé';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Le message d\'origine n\'a pas pu être chargé';

  @override
  String get chatReplyAttachedMedia => 'Le message contient des médias joints';

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
  String get chatMessagesLoadError => 'Impossible de charger les messages.';

  @override
  String get chatReplyMentionOverrideTitle =>
      'Ignorer la préférence de mention ?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname préfère être mentionné lors des réponses. Envoyer sans la mention quand même ?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname préfère les réponses sans @mention. Envoyer avec la mention quand même ?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ignorer la préférence';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Cliquez pour désactiver la notification de l\'utilisateur auquel vous répondez.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Cliquez pour activer la notification de l\'utilisateur auquel vous répondez.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Mentionner l\'utilisateur répondu';

  @override
  String get chatReplyMentionOn => 'Activé';

  @override
  String get chatReplyMentionOff => 'Désactivé';

  @override
  String get chatReplyCancel => 'Annuler la réponse';

  @override
  String get chatEditMessageHint => 'Modifier le message';

  @override
  String get chatEditNoChanges => 'Aucune modification à enregistrer';

  @override
  String get chatChannelNotReady =>
      'Ce canal n\'est pas encore prêt. Veuillez réessayer dans un moment.';

  @override
  String get chatMessageEdited => '(modifié)';

  @override
  String get chatMessageSilent => 'Ceci était un message @silent.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Aujourd\'hui à $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Hier à $time';
  }

  @override
  String get mediaViewerImagePreview => 'Aperçu de l\'image';

  @override
  String get mediaViewerClose => 'Fermer la visionneuse de médias';

  @override
  String get mediaViewerOpenInBrowser => 'Ouvrir dans le navigateur';

  @override
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

  @override
  String get mediaViewerForward => 'Transférer';

  @override
  String get mediaViewerZoomIn => 'Zoom avant';

  @override
  String get mediaViewerZoomOut => 'Zoom arrière';

  @override
  String get mediaViewerPreviousAttachment => 'Pièce jointe précédente';

  @override
  String get mediaViewerNextAttachment => 'Pièce jointe suivante';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String get chatAttachmentVideoToggleControls =>
      'Afficher/masquer les commandes vidéo';

  @override
  String get chatAttachmentVideoMute => 'Mettre la vidéo en sourdine';

  @override
  String get chatAttachmentVideoUnmute => 'Activer le son de la vidéo';

  @override
  String get chatAttachmentVideoPlay => 'Lire la vidéo';

  @override
  String get chatAttachmentVideoPause => 'Mettre la vidéo en pause';

  @override
  String get chatAttachmentVideoProgress => 'Progression de la vidéo';

  @override
  String get chatVideoPlaybackFailed => 'Impossible de lire cette vidéo.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Notifier les utilisateurs de ce rôle ayant la permission de voir ce canal.';

  @override
  String get addGuildModalTitle => 'Ajouter une communauté';

  @override
  String get addGuildModalLandingDescription =>
      'Créez une nouvelle communauté ou rejoignez-en une existante.';

  @override
  String get addGuildCreateCommunity => 'Créer une communauté';

  @override
  String get addGuildJoinCommunity => 'Rejoindre une communauté';

  @override
  String get addGuildImportDiscordTemplate => 'Importer un modèle Discord';

  @override
  String get addGuildJoinTitle => 'Rejoindre une communauté';

  @override
  String get addGuildJoinDescription =>
      'Entrez le lien d\'invitation pour rejoindre une communauté.';

  @override
  String get addGuildInviteLinkLabel => 'Lien d\'invitation';

  @override
  String get addGuildJoinSubmit => 'Rejoindre la communauté';

  @override
  String get addGuildInviteInvalid =>
      'Cette invitation est invalide ou a expiré.';

  @override
  String get addGuildJoinFailed =>
      'Impossible de rejoindre la communauté. Veuillez réessayer.';

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
  String get addGuildPackInstalled => 'Pack installé avec succès.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Supprimer toutes les réactions';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Êtes-vous sûr de vouloir supprimer toutes les réactions de ce message ?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Détacher le message';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Envoyer cette épingle dans le passé ?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username a épinglé $messageLink dans ce canal. Voir $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'un message';

  @override
  String get systemPinMessageAllPinsLink => 'tous les messages épinglés';

  @override
  String get channelPinsEmptyTitle => 'Aucun message épinglé';

  @override
  String get channelPinsEmptyDescription =>
      'Les messages épinglés apparaissent ici.';

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
  String get personalNotesTitle => 'Notes personnelles';

  @override
  String get personalNotesSubtitle =>
      'Votre espace privé pour vos pensées et rappels';

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
    return 'Bienvenue sur $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'Au commencement, il n\'y avait rien. Puis, il y eut $channelName. Et c\'était bien.';
  }

  @override
  String get personalNotesComposerHint => 'Envoyez-vous un message';

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
  String get personalNotesPrivateSpace => 'Votre espace privé';

  @override
  String get purgePersonalNotes => 'Supprimer les notes personnelles';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Cela supprimera définitivement tous les messages et pièces jointes de vos notes personnelles. Cette action est irréversible.';

  @override
  String get purgePersonalNotesConfirmButton => 'Supprimer';

  @override
  String purgePersonalNotesSuccess(int count) {
    return '$count message(s) supprimé(s) des notes personnelles';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Les notes personnelles étaient déjà vides';

  @override
  String get purgePersonalNotesFailed =>
      'Impossible de vider les notes personnelles';

  @override
  String get userSettingsGroupYourAccount => 'VOTRE COMPTE';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Sécurité et connexion';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Cadeaux et codes';

  @override
  String get userSettingsNavPrivacyDashboard =>
      'Tableau de bord de confidentialité';

  @override
  String get userSettingsNavAuthorizedApps => 'Applications autorisées';

  @override
  String get userSettingsNavBlockedUsers => 'Utilisateurs bloqués';

  @override
  String get userSettingsNavLinkedDevices => 'Appareils connectés';

  @override
  String get userSettingsNavConnections => 'Connexions';

  @override
  String get userSettingsNavLookAndFeel => 'Apparence';

  @override
  String get userSettingsNavAccessibility => 'Accessibilité';

  @override
  String get userSettingsNavChat => 'Messages et médias';

  @override
  String get userSettingsNavAudioAndVideo => 'Audio et vidéo';

  @override
  String get audioAndVideoAudioSectionTitle => 'Audio';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'Configurez votre microphone, vos haut-parleurs et le traitement vocal.';

  @override
  String get audioAndVideoVideoSectionTitle => 'Vidéo';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'Configurez la qualité de votre caméra et du partage d\'écran.';

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
  String get userSettingsNavLanguageAndTime => 'Langue et heure';

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
  String get userSettingsNavAdvanced => 'Avancé';

  @override
  String get advancedPerformanceReportingTitle => 'Rapports de performance';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Aidez à améliorer Fluxer en partageant des données anonymes de plantages et de performances.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Envoyer les rapports de plantages et de performances';

  @override
  String get advancedPerformanceReportingDescription =>
      'Toutes les données signalées sont anonymes et envoyées uniquement au service de surveillance de Fluxer — aucun fournisseur tiers n\'est utilisé.';

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
  String get advancedSettingSequentialFileSendLabel =>
      'Send file messages in order';

  @override
  String get advancedSettingSequentialFileSendDescription =>
      'Ensures file messages appear in the order you sent them';

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
  String get userSettingsNavApplications => 'Applications';

  @override
  String get userSettingsNavAppLogs => 'Journaux d\'application';

  @override
  String get userSettingsNavDeveloperTools => 'Outils de développement';

  @override
  String get userSettingsNavLimitsConfig => 'Configuration des limites';

  @override
  String get userSettingsNavFeatureFlags => 'Indicateurs de fonctionnalités';

  @override
  String get userSettingsNavWhatsNew => 'Nouveautés';

  @override
  String get userSettingsNavLogOut => 'Se déconnecter';

  @override
  String get quickSwitcherTabSearch => 'Recherche';

  @override
  String get quickSwitcherTabFriends => 'Amis';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Rechercher des salons, des personnes ou des communautés';

  @override
  String get quickSwitcherSearchFriends => 'Rechercher des amis';

  @override
  String get quickSwitcherNoMatchesFound => 'Aucun résultat trouvé';

  @override
  String get quickSwitcherEmptyHint =>
      'Essayez un autre nom ou utilisez les préfixes @ / # / ! / * pour filtrer les résultats.';

  @override
  String get quickSwitcherSectionPeople => 'Personnes';

  @override
  String get quickSwitcherSectionGroupMessages => 'Messages de groupe';

  @override
  String get quickSwitcherSectionTextChannels => 'Salons textuels';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Salons vocaux';

  @override
  String get quickSwitcherSectionCommunities => 'Communautés';

  @override
  String get quickSwitcherSectionSettings => 'Paramètres';

  @override
  String get quickSwitcherHomeLabel => 'Accueil';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Messages directs';

  @override
  String get quickSwitcherFavoritesLabel => 'Favoris';

  @override
  String get quickSwitcherUserSettingsLabel => 'Paramètres utilisateur';

  @override
  String get quickSwitcherNotificationsLabel => 'Notifications';

  @override
  String get quickSwitcherBookmarksLabel => 'Signets';

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
  String get quickSwitcherMentionsLabel => 'Mentions';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Pas encore d\'amis';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Ajoutez un ami pour commencer.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Aucun ami ne correspond à cette recherche';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Essayez un autre nom.';

  @override
  String get quickSwitcherSearchAliasUser => 'Utilisateur';

  @override
  String get quickSwitcherSearchAliasYou => 'Vous';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'MP';

  @override
  String get quickSwitcherSearchAliasMessages => 'Messages';

  @override
  String get quickSwitcherSearchAliasFav => 'Fav';

  @override
  String get quickSwitcherSearchAliasStarred => 'Étoilés';

  @override
  String get quickSwitcherSearchAliasInbox => 'Boîte de réception';

  @override
  String get quickSwitcherSearchAliasSaved => 'Enregistrés';

  @override
  String get uiClose => 'Fermer';

  @override
  String get chatJumpToBottom => 'Aller en bas';

  @override
  String get uiConfirm => 'Confirmer';

  @override
  String get uiLoading => 'Chargement';

  @override
  String get uiUnsavedChanges => 'Modifications non enregistrées';

  @override
  String get uiReset => 'Réinitialiser';

  @override
  String get uiOpenColorPicker => 'Ouvrir le sélecteur de couleurs';

  @override
  String get uiSelectPlaceholder => 'Sélectionner';

  @override
  String get uiSearchPlaceholder => 'Rechercher';

  @override
  String get uiNoOptionsFound => 'Aucune option trouvée';

  @override
  String get uiDismissNotification => 'Ignorer la notification';

  @override
  String get uiColorPickerTitle => 'Sélecteur de couleurs';

  @override
  String get mentionConfirmTitle => 'Mentionner tout le monde ?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Cela notifiera $count membres. Continuer ?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Cela notifiera $count membres en ligne. Continuer ?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'This will notify $count members with the $roleName role. Continue?';
  }

  @override
  String get mentionConfirmButton => 'Mentionner';

  @override
  String get composerEmojiUnavailable =>
      'Vous ne pouvez pas utiliser cet emoji ici.';

  @override
  String get instanceUrlLabel => 'URL de l\'instance';

  @override
  String get instanceUrlPlaceholder =>
      'Entrez l\'URL de l\'instance (par ex. fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Réinitialiser à Fluxer';

  @override
  String get instanceConnect => 'Se connecter';

  @override
  String get instanceConnecting => 'Connexion…';

  @override
  String get instanceConnectFailed => 'Échec de la connexion à l\'instance';

  @override
  String get recentInstances => 'Instances récentes';

  @override
  String removeRecentInstance(String domain) {
    return 'Supprimer $domain des instances récentes';
  }

  @override
  String get instanceSheetTitle => 'Se connecter à une instance';

  @override
  String get connectToDifferentInstance => 'Se connecter à une autre instance';

  @override
  String get changeInstance => 'Changer';

  @override
  String get instanceConnectionRequired =>
      'Connectez-vous à l\'instance pour vous identifier';

  @override
  String get comingSoon => 'Bientôt disponible';

  @override
  String get guildNavbarDirectMessages => 'Messages privés';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Explorer les communautés découvrables';

  @override
  String get discoveryExplore => 'Explorer';

  @override
  String get discoveryExplorePublicCommunities =>
      'Explorer les communautés publiques';

  @override
  String get discoveryListingSubheading =>
      'Vous souhaitez lister votre communauté ici ? Postulez si vous remplissez les conditions dans les paramètres de votre communauté > Découverte.';

  @override
  String get discoverySearchCommunities => 'Rechercher des communautés';

  @override
  String get discoveryFilterByLanguage => 'Filtrer par langue';

  @override
  String get discoveryAllLanguages => 'Toutes les langues';

  @override
  String get discoveryAllCategories => 'Toutes';

  @override
  String get discoveryCategoryGaming => 'Jeux';

  @override
  String get discoveryCategoryMusic => 'Musique';

  @override
  String get discoveryCategoryEntertainment => 'Divertissement';

  @override
  String get discoveryCategoryEducation => 'Éducation';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Science et technologie';

  @override
  String get discoveryCategoryContentCreator => 'Créateur de contenu';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime et manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Films et TV';

  @override
  String get discoveryCategoryOther => 'Autre';

  @override
  String get discoveryNoCommunitiesMatch => 'Aucune communauté ne correspond.';

  @override
  String get discoveryJoinCommunity => 'Rejoindre la communauté';

  @override
  String get discoveryJoined => 'Rejoint';

  @override
  String discoveryOnlineCount(String count) {
    return '$count en ligne';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString membres',
      one: '1 membre',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Pas de description.';

  @override
  String get discoveryCommunities => 'Communautés';

  @override
  String get discoveryApps => 'Applications';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Impossible de rejoindre cette communauté';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Un problème est survenu. Veuillez réessayer dans un moment.';

  @override
  String get discoveryJoinErrorFullTitle => 'Cette communauté est pleine';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Cette communauté a atteint sa limite de membres, vous ne pouvez donc pas la rejoindre pour le moment.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Vous avez atteint la limite de communautés';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Vous êtes dans le nombre maximum de communautés. Quittez-en une et réessayez.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Vous ne pouvez pas rejoindre cette communauté';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Vous avez été banni de cette communauté.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Cette communauté n\'est plus disponible';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Elle a peut-être quitté la découverte ou désactivé les nouvelles adhésions. Rafraîchissez la page et vous ne la verrez plus.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Vous allez trop vite';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Veuillez patienter un moment et réessayer.';

  @override
  String get guildNavbarAddCommunity => 'Ajouter une communauté';

  @override
  String get guildNavbarHelp => 'Aide';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'NOUVEAU MESSAGE';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Réduire $folderName';
  }

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
  String get guildNavbarGroupDm => 'Message privé de groupe';

  @override
  String get guildNavbarCreateChannel => 'Créer un salon';

  @override
  String get guildNavbarChannelType => 'Type de salon';

  @override
  String get guildNavbarTextChannel => 'Salon textuel';

  @override
  String get guildNavbarTextChannelDescription =>
      'Envoyez des messages, des images, des GIF et des émojis';

  @override
  String get guildNavbarVoiceChannel => 'Salon vocal';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Discutez ensemble avec la voix, la vidéo et le partage d\'écran';

  @override
  String get guildNavbarLinkChannel => 'Salon de lien';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Accès rapide à un site web ou une ressource externe';

  @override
  String get guildNavbarNameLabel => 'Nom';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

  @override
  String get guildNavbarCreateCategory => 'Créer une catégorie';

  @override
  String get guildNavbarNewCategoryHint => 'Nouvelle catégorie';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Invitez des amis sur $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Les destinataires seront dirigés vers le salon #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Rechercher des amis';

  @override
  String get guildNavbarNoFriendsYet => 'Pas encore d\'amis';

  @override
  String get guildNavbarNoResults => 'Aucun résultat';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Ou, envoyez un lien d\'invitation à un ami :';

  @override
  String get guildNavbarInviteLink => 'Lien d\'invitation';

  @override
  String get guildNavbarCopy => 'Copier';

  @override
  String get guildNavbarCopied => 'Copié !';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Votre lien d\'invitation expire dans 7 jours.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Ce lien d\'invitation n\'expire jamais.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Votre lien d\'invitation expire dans $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Modifier le lien d\'invitation';

  @override
  String get guildNavbarInviteLinkSettings =>
      'Paramètres du lien d\'invitation';

  @override
  String get guildNavbarExpireAfter => 'Expire après';

  @override
  String get guildNavbarMaxUses => 'Nombre d\'utilisations max.';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Accorder une adhésion temporaire';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Les membres seront supprimés lorsqu\'ils seront hors ligne, sauf si un rôle est attribué';

  @override
  String get guildNavbarCreateNewLink => 'Créer un nouveau lien';

  @override
  String get guildNavbarSent => 'Envoyé';

  @override
  String get guildNavbarInvite => 'Inviter';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Quitter la communauté';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Êtes-vous sûr de vouloir quitter cette communauté ? Vous ne pourrez plus voir aucun message.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Quitter la communauté';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Supprimer vos messages dans cette communauté ?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Supprimez définitivement tous les messages que vous avez envoyés ici, dans tous les salons. Impossible d\'annuler.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Supprimer mes messages';

  @override
  String get guildNavbarDeletedYourMessages => 'Vos messages ont été supprimés';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Impossible de supprimer vos messages';

  @override
  String get guildNavbarRemoveOverride => 'Supprimer la dérogation';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Muted jusqu\'au $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible =>
      'Accessible uniquement au personnel Fluxer';

  @override
  String get guildNavbarInvitesPaused =>
      'Les invitations sont actuellement en pause dans cette communauté';

  @override
  String get guildNavbarDurationNever => 'jamais';

  @override
  String get guildNavbarDuration30Minutes => '30 minutes';

  @override
  String get guildNavbarDuration1Hour => '1 heure';

  @override
  String get guildNavbarDuration6Hours => '6 heures';

  @override
  String get guildNavbarDuration12Hours => '12 heures';

  @override
  String get guildNavbarDuration1Day => '1 jour';

  @override
  String get guildNavbarDuration7Days => '7 jours';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count secondes';
  }

  @override
  String get guildNavbarNever => 'Jamais';

  @override
  String get guildNavbarNoLimit => 'Aucune limite';

  @override
  String get guildNavbarOneUse => '1 utilisation';

  @override
  String guildNavbarUses(int count) {
    return '$count utilisations';
  }

  @override
  String get guildMenuMarkAsRead => 'Marquer comme lu';

  @override
  String get guildPeekMoreOptions => 'Plus d\'options';

  @override
  String get guildMenuInviteMembers => 'Inviter des membres';

  @override
  String get guildMenuCommunitySettings => 'Paramètres de la communauté';

  @override
  String get guildMenuEditCommunityProfile =>
      'Modifier le profil de la communauté';

  @override
  String get guildMenuUnmuteCommunity => 'Rendre le son de la communauté';

  @override
  String get guildMenuMuteCommunity => 'Mettre la communauté en sourdine';

  @override
  String get guildMenuHideMutedChannels => 'Masquer les salons mis en sourdine';

  @override
  String get guildMenuReportCommunity => 'Signaler la communauté';

  @override
  String get guildMenuDebugCommunity => 'Déboguer la communauté';

  @override
  String get guildMenuCopyCommunityId => 'Copier l\'ID de la communauté';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Jusqu\'à $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Général';

  @override
  String get guildMenuSettingsRoles => 'Rôles et autorisations';

  @override
  String get guildMenuSettingsEmoji => 'Émojis personnalisés';

  @override
  String get guildMenuSettingsStickers => 'Autocollants personnalisés';

  @override
  String get guildMenuSettingsSafetyModeration => 'Sécurité et modération';

  @override
  String get guildMenuSettingsActivityLog => 'Journal d\'activité';

  @override
  String get guildMenuSettingsWebhooks => 'Webhooks';

  @override
  String get guildMenuSettingsCustomInviteUrl =>
      'URL d\'invitation personnalisée';

  @override
  String get guildMenuSettingsDiscovery => 'Découverte';

  @override
  String get guildMenuSettingsMembers => 'Membres';

  @override
  String get guildMenuSettingsInviteLinks => 'Liens d\'invitation';

  @override
  String get guildMenuSettingsBans => 'Bans';

  @override
  String get guildMenuSettingsChannels => 'Channels';

  @override
  String get guildSettingsNoPermission =>
      'Vous n\'avez pas la permission de voir cet onglet des paramètres.';

  @override
  String get guildSettingsOverviewIconTitle => 'Icône';

  @override
  String get guildSettingsUploadImage => 'Télécharger une image';

  @override
  String get guildSettingsOverviewBannerTitle => 'Bannière';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Téléchargez une bannière pour votre serveur.';

  @override
  String get guildSettingsOverviewNameTitle => 'Nom';

  @override
  String get guildSettingsOverviewNameHint => 'Ma super communauté';

  @override
  String get guildSettingsOverviewStatsTitle => 'Statistiques';

  @override
  String get guildSettingsOverviewMembers => 'Membres';

  @override
  String get guildSettingsOverviewOnline => 'En ligne';

  @override
  String get guildSettingsRolesDescription =>
      'Utilisez des rôles pour regrouper les membres et attribuer des autorisations.';

  @override
  String get guildSettingsCreateRole => 'Créer un rôle';

  @override
  String get guildSettingsRolesListTitle => 'Rôles';

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
    return '$staticCount émojis statiques, $animatedCount émojis animés utilisés';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Pas encore d\'émojis personnalisés.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count autocollants téléchargés';
  }

  @override
  String get guildSettingsStickersEmpty =>
      'Pas encore d\'autocollants personnalisés.';

  @override
  String get guildSettingsModerationVerificationTitle =>
      'Vérification des membres';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Choisissez ce que les membres doivent avoir avant de pouvoir publier ou envoyer des messages privés aux membres de la communauté.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Les membres ayant des rôles peuvent contourner ces vérifications. Pour les espaces publics, nous recommandons d\'activer la vérification.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Les communautés listées dans la Découverte nécessitent au moins un e-mail vérifié. Aucune ne peut être sélectionnée tant que la Découverte est activée.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Contenu mature et avertissements de contenu';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Configurez l\'étiquetage du contenu mature et les avertissements de contenu optionnels pour les membres.';

  @override
  String get guildSettingsModerationMatureToggle => 'Contenu mature';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Marquez cette communauté comme contenant du contenu mature.';

  @override
  String get guildSettingsVerificationNone => 'Aucune';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Aucune vérification n\'est requise.';

  @override
  String get guildSettingsVerificationLow => 'Faible';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Nécessite une adresse e-mail vérifiée.';

  @override
  String get guildSettingsVerificationMedium => 'Moyen';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Nécessite une adresse e-mail vérifiée et un compte âgé d\'au moins 5 minutes.';

  @override
  String get guildSettingsVerificationHigh => 'Élevé';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Nécessite tout ce qui est moyen, plus être membre de la communauté pendant au moins 10 minutes.';

  @override
  String get guildSettingsVerificationHighest => 'Très élevé';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Nécessite un numéro de téléphone vérifié.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Suivez les actions des modérateurs dans toute la communauté.';

  @override
  String get guildSettingsAuditLogEmpty => 'Aucun journal pour le moment';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Les actions de modération et les changements de communauté apparaîtront ici.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Tous les utilisateurs';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Toutes les actions';

  @override
  String get guildSettingsAuditLogNoReason => 'Aucune raison n\'a été fournie.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Utilisateur inconnu';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Un problème est survenu lors du chargement du journal d\'activité.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Impossible de charger les journaux d\'activité';

  @override
  String get guildSettingsAuditLogReason => 'Raison';

  @override
  String get guildSettingsAuditLogSomeone => 'quelqu\'un';

  @override
  String get guildSettingsAuditLogSomething => 'quelque chose';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'entité inconnue';

  @override
  String get guildSettingsAuditLogNothing => 'rien';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Cible inconnue';

  @override
  String get auditLogActionGuildUpdate => 'Communauté mise à jour';

  @override
  String get auditLogActionChannelCreate => 'Canal créé';

  @override
  String get auditLogActionChannelUpdate => 'Canal mis à jour';

  @override
  String get auditLogActionChannelDelete => 'Canal supprimé';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Autorisation de canal ajoutée';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Autorisation de canal mise à jour';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Autorisation de canal supprimée';

  @override
  String get auditLogActionMemberKick => 'Membre expulsé';

  @override
  String get auditLogActionMemberPrune => 'Membres purgés';

  @override
  String get auditLogActionMemberBanAdd => 'Membre banni';

  @override
  String get auditLogActionMemberBanRemove => 'Membre débanni';

  @override
  String get auditLogActionMemberUpdate => 'Membre mis à jour';

  @override
  String get auditLogActionMemberRoleUpdate => 'Rôles des membres mis à jour';

  @override
  String get auditLogActionMemberMove => 'Membre déplacé';

  @override
  String get auditLogActionMemberDisconnect => 'Membre déconnecté';

  @override
  String get auditLogActionBotAdd => 'Bot ajouté';

  @override
  String get auditLogActionRoleCreate => 'Rôle créé';

  @override
  String get auditLogActionRoleUpdate => 'Rôle mis à jour';

  @override
  String get auditLogActionRoleDelete => 'Rôle supprimé';

  @override
  String get auditLogActionInviteCreate => 'Invitation créée';

  @override
  String get auditLogActionInviteUpdate => 'Invitation mise à jour';

  @override
  String get auditLogActionInviteDelete => 'Invitation supprimée';

  @override
  String get auditLogActionWebhookCreate => 'Webhook créé';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook mis à jour';

  @override
  String get auditLogActionWebhookDelete => 'Webhook supprimé';

  @override
  String get auditLogActionEmojiCreate => 'Emoji créé';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji mis à jour';

  @override
  String get auditLogActionEmojiDelete => 'Emoji supprimé';

  @override
  String get auditLogActionStickerCreate => 'Autocollant créé';

  @override
  String get auditLogActionStickerUpdate => 'Autocollant mis à jour';

  @override
  String get auditLogActionStickerDelete => 'Autocollant supprimé';

  @override
  String get auditLogActionMessageDelete => 'Message supprimé';

  @override
  String get auditLogActionMessageBulkDelete => 'Messages supprimés';

  @override
  String get auditLogActionMessagePin => 'Message épinglé';

  @override
  String get auditLogActionMessageUnpin => 'Message désépinglé';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor a mis à jour les paramètres de la communauté.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor a créé le salon $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor a mis à jour le salon $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor a supprimé le salon $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor a ajouté des autorisations de salon pour $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor a ajouté des autorisations de salon pour $target dans le salon $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor a mis à jour les autorisations de salon pour $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor a mis à jour les autorisations de salon pour $target dans le salon $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor a supprimé les autorisations de canal pour $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor a supprimé les autorisations de canal pour $target dans $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor a expulsé $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor a banni $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor a débanni $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor a mis à jour $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor a mis à jour les rôles de $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor a purgé les membres inactifs.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor a purgé les membres inactifs depuis $days jours.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor a déplacé $target vers un autre canal vocal.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor a déplacé $target vers $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor a déconnecté $target du vocal.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor a ajouté le bot $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor a créé le rôle $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor a mis à jour le rôle $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor a supprimé le rôle $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor a créé l\'invitation $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor a créé l\'invitation $target pour le canal $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor a mis à jour l\'invitation $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor a mis à jour l\'invitation $target pour le canal $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor a supprimé l\'invitation $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor a supprimé l\'invitation $target pour le canal $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor a créé le webhook $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor a mis à jour le webhook $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor a supprimé le webhook $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor a ajouté l\'emoji $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor a mis à jour l\'emoji $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor a supprimé l\'emoji $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor a ajouté le sticker $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor a mis à jour le sticker $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor a supprimé le sticker $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor a supprimé un message.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor a supprimé un message dans $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor a supprimé plusieurs messages.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor a supprimé $count messages.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor a supprimé plusieurs messages dans $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor a supprimé $count messages dans $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor a épinglé un message.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor a épinglé un message dans $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor a désépinglé un message.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor a désépinglé un message dans $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor a effectué une action d\'audit sur $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'A mis à jour $field de $oldValue à $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'A défini $field sur $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'A effacé $field (était $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'A mis à jour $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'A renommé la communauté en $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'A mis à jour l\'icône de la communauté.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'A renommé le canal en $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'A effacé le sujet.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'A mis à jour le sujet à $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'A activé le contenu pour adultes.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'A désactivé le contenu pour adultes.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'A défini le surnom sur $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'A supprimé le surnom $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'A mis le membre en sourdine.';

  @override
  String get auditLogChangeUnmutedMember => 'A retiré la sourdine du membre.';

  @override
  String get auditLogChangeDeafenedMember => 'A rendu le membre sourd.';

  @override
  String get auditLogChangeUndeafenedMember =>
      'A rétabli l\'audition du membre.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'A ajouté $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'A supprimé $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Canal : $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Message : $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Invité par $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'A supprimé # messages.',
      one: 'A supprimé # message.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'A supprimé # membres.',
      one: 'A supprimé # membre.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'Cette invitation n\'expire jamais.';

  @override
  String get auditLogOptionTemporaryMembership =>
      'Accorde une adhésion temporaire.';

  @override
  String get auditLogOptionPermanentMembership =>
      'Accorde une adhésion permanente.';

  @override
  String get guildSettingsLoadMore => 'Charger plus';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Gérer les webhooks qui publient des messages dans les canaux.';

  @override
  String get guildSettingsWebhooksEmpty => 'Aucun webhook configuré.';

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
  String get guildSettingsCopyUrl => 'Copier l\'URL';

  @override
  String get guildSettingsCopiedUrl => 'URL copiée dans le presse-papiers';

  @override
  String get guildSettingsDeleteWebhook => 'Supprimer le webhook';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Définissez un lien d\'invitation personnalisé pour votre serveur.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Enregistrer';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Utilisation';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count utilisations';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Postulez pour être listé dans la découverte de serveurs.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Not enough members';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Nécessite au moins $count membres pour postuler.';
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
  String get guildSettingsDiscoveryCategory => 'Catégorie';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Choose the category that best describes your community. You can change this any time.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Primary language';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'The language most of your community speaks. Used to filter Discovery results.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Description';

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
  String get guildSettingsDiscoveryTagsHint => 'jeux, art, musique';

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
  String get guildSettingsDiscoveryApply => 'Soumettre la candidature';

  @override
  String get guildSettingsDiscoverySave => 'Save';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Retirer';

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
      'Recherchez et gérez les membres du serveur.';

  @override
  String get guildSettingsMembersSearchHint => 'Rechercher des membres';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count membres';
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
  String get guildSettingsMembersSortNewest => 'Les plus récents d\'abord';

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
      'Visualisez et révoquez les liens d\'invitation actifs.';

  @override
  String get guildSettingsInvitesEmpty => 'Aucune invitation active.';

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
    return '$uses / $maxUses utilisations';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Expire le $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Visualisez et gérez les utilisateurs bannis.';

  @override
  String get guildSettingsBansSearchHint => 'Rechercher des bannissements';

  @override
  String get guildSettingsBansEmpty => 'Aucun utilisateur banni.';

  @override
  String get guildSettingsBanPermanent => 'Bannissement permanent';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Expire le $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Expire';

  @override
  String get guildSettingsUnban => 'Lever le bannissement';

  @override
  String get guildSettingsBansLoading => 'Chargement des utilisateurs bannis';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Aucun bannissement trouvé correspondant à votre recherche.';

  @override
  String get guildSettingsBanDetailsTitle => 'Détails du bannissement';

  @override
  String get guildSettingsBanViewDetails => 'Voir les détails';

  @override
  String get guildSettingsBannedOn => 'Banni le';

  @override
  String get guildSettingsBannedBy => 'Banni par';

  @override
  String get guildSettingsRevokeBanTitle => 'Révoquer le bannissement';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Êtes-vous sûr de vouloir révoquer le bannissement de $displayName ? Il pourra rejoindre la communauté.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Bannissement révoqué pour $displayName';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Impossible de charger les bannissements. Réessayez.';

  @override
  String get guildSettingsRevokeBanError =>
      'Impossible de révoquer le bannissement. Réessayez.';

  @override
  String get guildSettingsCommunitySettings => 'Paramètres de la communauté';

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
      'Gérez le profil, les salons et les paramètres par défaut de votre communauté.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Image de marque';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Mettez à jour votre icône, votre nom, votre bannière et l\'arrière-plan d\'invitation';

  @override
  String get guildSettingsOverviewBannerUpload => 'Télécharger la bannière';

  @override
  String get guildSettingsOverviewIdleTitle => 'Paramètres d\'inactivité';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Configurer le salon AFK et le délai d\'attente';

  @override
  String get guildSettingsOverviewSystemTitle => 'Système et accueil';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Choisir la destination des messages système et de bienvenue';

  @override
  String get guildSettingsOverviewNotificationsTitle =>
      'Notifications par défaut';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Les communautés de plus de 250 personnes sont forcées sur le réglage « Mentions uniquement ». Votre réglage d\'origine est conservé et sera rétabli si la communauté passe sous 250 membres.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Avancé';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Autoriser les noms de canaux texte flexibles';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Masquer la couronne du propriétaire de la communauté';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Bannière détachée';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Affiche la bannière dans sa propre section sous l\'en-tête de la communauté.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Télécharger l\'icône';

  @override
  String get guildSettingsOverviewRemoveImage => 'Supprimer';

  @override
  String get guildSettingsOverviewSplashTitle => 'Arrière-plan d\'invitation';

  @override
  String get guildSettingsOverviewEmbedSplashTitle =>
      'Arrière-plan d\'intégration de chat';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Affiché dans les intégrations d\'invitation dans le chat.';

  @override
  String get guildSettingsOverviewUploadBackground =>
      'Télécharger l\'arrière-plan';

  @override
  String get guildSettingsOverviewNoCommunityBanner =>
      'Aucune bannière de communauté';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'Aucun arrière-plan d\'invitation';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Aperçu';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Voyez à quoi ressemble votre invitation pour les visiteurs.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Noms des canaux texte';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Couronne du propriétaire de la communauté';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Configurez si l\'icône de la couronne est affichée à côté du propriétaire de la communauté';

  @override
  String get guildSettingsSplashCardAlignment => 'Alignement de la carte';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Centre';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Gauche';

  @override
  String get guildSettingsSplashAlignmentRight => 'Droite';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'S\'applique uniquement sur les écrans larges.';

  @override
  String get permissionReadMessageHistory => 'Lire l\'historique des messages';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Définir ce que les utilisateurs sans \"$permission\" peuvent voir';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Utilisez une fenêtre dédiée pour définir une date seuil d\'historique des messages pour les membres qui n\'ont pas la permission $permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Ouvrir le seuil de l\'historique des messages';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Seuil de l\'historique des messages';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Activer le seuil de l\'historique des messages';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Date seuil';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Les membres sans Lire l\'historique des messages peuvent voir les messages envoyés après cette date.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Seuil de l\'historique des messages mis à jour';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Autorise les majuscules et les espaces dans les noms de canaux texte. Désactivé restreint les noms aux minuscules avec des tirets et des underscores.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Masque l\'icône de la couronne à côté du propriétaire de la communauté sur toutes les interfaces.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Les icônes animées nécessitent la fonctionnalité de communauté Icône animée.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Les bannières animées nécessitent la fonctionnalité de communauté Bannière animée.';

  @override
  String get guildSettingsAfkChannel => 'Canal AFK / inactif';

  @override
  String get guildSettingsAfkChannelHint =>
      'Déplacez les membres vers ce canal lorsqu\'ils sont AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Aucun canal AFK';

  @override
  String get guildSettingsAfkTimeout => 'Délai AFK';

  @override
  String get guildSettingsAfkTimeout1Min => '1 minute';

  @override
  String get guildSettingsAfkTimeout5Min => '5 minutes';

  @override
  String get guildSettingsAfkTimeout15Min => '15 minutes';

  @override
  String get guildSettingsAfkTimeout30Min => '30 minutes';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 heure';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds secondes';
  }

  @override
  String get guildSettingsSystemChannel => 'Canal de destination';

  @override
  String get guildSettingsSystemChannelHint =>
      'Les messages de bienvenue et système apparaîtront ici.';

  @override
  String get guildSettingsNoSystemChannel => 'Aucun canal système';

  @override
  String get guildSettingsHideJoinMessages => 'Masquer les messages d\'arrivée';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Supprime les messages de bienvenue dans le canal de destination.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Paramètres de notification par défaut';

  @override
  String get guildSettingsNotificationsAll => 'Tous les messages';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Notifier pour tous les messages';

  @override
  String get guildSettingsNotificationsMentions => 'Mentions uniquement';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Notifier uniquement pour les mentions';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. 10 Mo max. Minimum : 960 x 540 px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. 10 Mo max. Minimum : 960 x 540 px (16:9). S\'affiche dans les aperçus d\'invitation dans le chat.';

  @override
  String get guildSettingsModerationDescription =>
      'Configurez les paramètres de vérification, de filtrage de contenu et de contenu sensible.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Les communautés listées dans la découverte ont des options de modération restreintes.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Filtrage de contenu';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Examine automatiquement les messages pour détecter le contenu explicite dans les canaux non marqués comme sensibles.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Les communautés listées dans la découverte doivent scanner tous les membres. Ce paramètre ne peut pas être modifié tant que la découverte est activée.';

  @override
  String get guildSettingsContentFilterOff => 'Désactivé';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Laissez la communauté s\'auto-modérer';

  @override
  String get guildSettingsContentFilterNoRole =>
      'Filtrer les membres sans rôle';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Suggéré pour la plupart des communautés';

  @override
  String get guildSettingsContentFilterAll => 'Filtrer tout le monde';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Protection maximale pour les espaces familiaux';

  @override
  String get guildSettingsModerationMatureOff => 'Désactivé';

  @override
  String get guildSettingsModerationMatureOn => 'Activé';

  @override
  String get guildSettingsContentWarningToggle =>
      'Afficher un avertissement de contenu';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Active une invite de consentement avant d\'entrer dans un canal.';

  @override
  String get guildSettingsContentWarningText =>
      'Texte d\'avertissement personnalisé';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Ceci contient du contenu sensible.';

  @override
  String get guildSettingsModeration2faTitle =>
      'Exigence d\'authentification à deux facteurs';

  @override
  String get guildSettingsModeration2faDescription =>
      'Exigez l\'authentification à deux facteurs pour les modérateurs avant qu\'ils ne puissent bannir, expulser, mettre en sourdine ou supprimer des messages.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Exiger l\'authentification à deux facteurs pour les actions de modération';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Seul le propriétaire de la communauté peut modifier ce paramètre';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Activez l\'authentification à deux facteurs sur votre compte pour modifier ce paramètre';

  @override
  String get guildSettingsEmojiSearchHint => 'Rechercher des émojis';

  @override
  String get guildSettingsEmojiUploadTitle => 'Télécharger un émoji';

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
    return 'Émojis non animés ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Émojis animés ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Rechercher des autocollants';

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
    return 'Créez des webhooks depuis les paramètres du canal. Modifiez-les ici.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'Votre URL personnalisée ne fonctionnera pas à moins qu\'au moins un canal ne soit visible par tout le monde.';

  @override
  String get guildSettingsVanityUrlRemove => 'Supprimer';

  @override
  String get guildSettingsBannedUsersTitle => 'Utilisateurs bannis';

  @override
  String get guildSettingsInvitesTableInviter => 'Inviteur';

  @override
  String get guildSettingsInvitesTableChannel => 'Canal';

  @override
  String get guildSettingsInvitesTableCode => 'Code';

  @override
  String get guildSettingsInvitesTableUses => 'Utilisations';

  @override
  String get guildSettingsInvitesTableCreated => 'Créé le';

  @override
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtrer par utilisateur';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtrer par action';

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
