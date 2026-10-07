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
      'Un problème est survenu avec l\'instance.\nCela devrait être résolu dans une seconde !';

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
  String get splashConnectionLost => 'Connexion perdue';

  @override
  String get splashViewOnStatusPage => 'Voir sur la page d\'état';

  @override
  String get splashConnectionIssuesPrompt => 'Problèmes de connexion ?';

  @override
  String get splashStatusPageLink => 'Page d\'état';

  @override
  String get splashReadIncident => 'Lire l\'incident';

  @override
  String get splashIncidentHistory => 'Historique des incidents';

  @override
  String get nagbarLearnMore => 'En savoir plus';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'Une maintenance est prévue pour $localizedTime. Durée estimée : $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Maintenance en cours. Durée prévue : $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'Maintenance terminée.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Bonjour $displayName, finalisez votre inscription pour éviter de perdre l’accès à votre compte.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Salut $displayName, veuillez vérifier votre adresse e-mail.';
  }

  @override
  String get nagbarOpenSettings => 'Ouvrir les réglages';

  @override
  String get systemPermissionSettingsTitle => 'Activer la permission';

  @override
  String get systemPermissionSettingsOpenSettings => 'Ouvrir les réglages';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName n\'a pas accès à votre microphone. Vous pouvez l\'activer dans les paramètres de confidentialité de votre appareil.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName n\'a pas accès à votre appareil photo. Vous pouvez l\'activer dans les paramètres de confidentialité de votre appareil.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName n\'a pas accès à votre photothèque. Vous pouvez l\'activer dans les paramètres de confidentialité de votre appareil.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName n\'a pas l\'autorisation d\'envoyer des notifications. Vous pouvez l\'activer dans les paramètres de votre appareil.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Votre abonnement n\'a pas pu être renouvelé, mais vous avez toujours accès aux avantages de $productName jusqu\'au $graceDate. Agissez maintenant pour ne pas perdre tous vos avantages.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Votre abonnement $productName a expiré. Renouvelez dès maintenant pour conserver vos avantages.';
  }

  @override
  String get nagbarManageSubscription => 'Gérer l\'abonnement';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Bienvenue sur $productFullName. Découvrez vos avantages $productName et gérez votre abonnement.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'Voir les fonctionnalités de $productName';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'Vous avez un nouveau code cadeau qui vous attend dans votre inventaire.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'Vous avez $count nouveaux codes cadeaux dans votre inventaire.';
  }

  @override
  String get nagbarViewGiftInventory => 'Voir l\'inventaire des cadeaux';

  @override
  String get nagbarVisionaryMfa =>
      'Activez l\'authentification à deux facteurs pour protéger votre compte Visionary.';

  @override
  String get nagbarEnableMfa => 'Activer la validation en 2 étapes';

  @override
  String get nagbarTermsAcceptance =>
      'Nous avons mis à jour nos conditions. Veuillez les examiner et les accepter pour continuer.';

  @override
  String get nagbarReviewTerms => 'Examiner les conditions';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Rejoignez $communityName pour discuter avec l\'équipe et rester informé.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Rejoindre $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'Activez les notifications pour ne manquer aucun message ni aucune mention.';

  @override
  String get nagbarEnableNotifications => 'Activer les notifications';

  @override
  String get nagbarBillingPortalFailed =>
      'Impossible d\'ouvrir le portail de facturation. Veuillez réessayer dans un instant.';

  @override
  String get welcomeBack => 'Bon retour';

  @override
  String get email => 'E-mail';

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
  String get organizationSsoProvider =>
      'Connectez-vous avec le fournisseur d\'authentification unique de votre organisation.';

  @override
  String get failedToStartSso =>
      'Échec du démarrage de l\'authentification unique (SSO)';

  @override
  String get ssoCancelled =>
      'La connexion via authentification unique a été annulée';

  @override
  String preferSso(String provider) {
    return 'Vous préférez utiliser l\'authentification unique ? Continuez avec $provider.';
  }

  @override
  String get needAccountPrompt => 'Besoin d\'un compte ? ';

  @override
  String get register => 'S\'inscrire';

  @override
  String get orDivider => 'OR';

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
  String get next => 'Suivant';

  @override
  String get mfaTitle => 'Authentification à deux facteurs';

  @override
  String get mfaChooseMethod => 'Choisissez une méthode de vérification';

  @override
  String get mfaMethodTotp => 'Application d\'authentification';

  @override
  String get mfaMethodWebauthn => 'Clé de sécurité / clé d’accès';

  @override
  String get mfaTotpDescription =>
      'Entrez le code à 6 chiffres de votre application d\'authentification ou l\'un de vos codes de secours.';

  @override
  String get mfaCodeLabel => 'Code';

  @override
  String get mfaTryAnotherMethod => 'Essayer une autre méthode';

  @override
  String get mfaUseSecurityKey =>
      'Essayer plutôt une clé de sécurité / clé d\'accès';

  @override
  String get accountSelectorTitle => 'Choisir un compte';

  @override
  String get accountSelectorDescription =>
      'Sélectionnez un compte pour continuer ou ajoutez-en un autre.';

  @override
  String get accountAdd => 'Ajouter un compte';

  @override
  String get accountRemoveDescription =>
      'Ceci supprimera la session enregistrée pour ce compte.';

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
      'Impossible de changer de compte. Veuillez réessayer.';

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
  String get statusUntilIChangeIt => 'Jusqu\'à ce que je le modifie';

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
      'Vous ne recevrez pas de notifications sur ordinateur';

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
  String get suspendedRecheck => 'Rechercher les mises à jour';

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
      'Saisissez votre adresse e-mail et nous vous enverrons un lien pour réinitialiser votre mot de passe.';

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
  String get recoverAccountTitle => 'Récupérez votre compte';

  @override
  String get recoverAccountDescription =>
      'Entrez votre nom d\'utilisateur et la clé de récupération de votre kit de récupération, puis choisissez un nouveau mot de passe.';

  @override
  String get recoverAccountNoKit =>
      'Pas de kit de récupération ? Demandez à un administrateur de cette instance un lien de réinitialisation de mot de passe.';

  @override
  String get recoveryKitTitle => 'Votre kit de récupération';

  @override
  String get recoveryKitCreatedDescription =>
      'Si vous oubliez votre mot de passe, ce kit est le seul moyen de retrouver l\'accès à votre compte. Conservez-le en lieu sûr, comme dans un gestionnaire de mots de passe ou une copie imprimée.';

  @override
  String get recoveryKitReplacedDescription =>
      'Votre ancien kit de récupération ne fonctionne plus. Conservez celui-ci en lieu sûr.';

  @override
  String get recoveryKitRecoveredDescription =>
      'Votre mot de passe a été réinitialisé. Votre ancien kit de récupération ne fonctionne plus. Conservez ce nouveau kit en lieu sûr.';

  @override
  String get recoveryKitWarning =>
      'Toute personne possédant cette clé peut réinitialiser votre mot de passe. Ne la partagez jamais.';

  @override
  String get recoveryKitKeyLabel => 'Clé de récupération';

  @override
  String recoveryKitDocumentTitle(String productName) {
    return 'Kit de récupération $productName';
  }

  @override
  String get recoveryKitDocumentIntro =>
      'Conservez cette page en lieu sûr. Si vous oubliez votre mot de passe, vous pourrez l\'utiliser pour retrouver l\'accès à votre compte. Toute personne possédant cette clé de récupération pourra réinitialiser votre mot de passe, alors ne la partagez jamais.';

  @override
  String get recoveryKitInstanceLabel => 'Instance';

  @override
  String get recoveryKitCreatedAtLabel => 'Créé';

  @override
  String get recoveryKitQrCaption =>
      'Scannez pour ouvrir la page de récupération avec vos informations préremplies.';

  @override
  String get recoveryKitStepsTitle => 'Comment récupérer votre compte';

  @override
  String recoveryKitStepOpen(String recoverUrl) {
    return 'Accédez à $recoverUrl ou scannez le code QR.';
  }

  @override
  String get recoveryKitStepEnter =>
      'Entrez votre nom d\'utilisateur et cette clé de récupération.';

  @override
  String get recoveryKitStepPassword =>
      'Choisissez un nouveau mot de passe. Vous recevrez un nouveau kit de récupération et celui-ci cessera de fonctionner.';

  @override
  String get recoveryKitBackupCodesTitle => 'Codes de secours à deux facteurs';

  @override
  String get recoveryKitBackupCodesNote =>
      'Chaque code fonctionne une fois à la place de votre application d\'authentification.';

  @override
  String get recoveryKitBackupCodesFailed =>
      'Impossible de charger vos codes de sauvegarde.';

  @override
  String get recoveryKitIncludeBackupCodes =>
      'Inclure mes codes de secours d\'authentification à deux facteurs dans l\'image enregistrée';

  @override
  String get recoveryKitCopy => 'Copier';

  @override
  String get recoveryKitCopied => 'Clé de récupération copiée';

  @override
  String get recoveryKitSaveImage => 'Enregistrer l\'image';

  @override
  String get recoveryKitSaved => 'Kit de récupération enregistré';

  @override
  String get recoveryKitSavedToPhotos =>
      'Kit de récupération enregistré dans Photos';

  @override
  String get recoveryKitSaveFailed =>
      'Impossible d\'enregistrer le kit de récupération. Réessaie ou copie plutôt la clé.';

  @override
  String get recoveryKitAcknowledge =>
      'J\'ai rangé ma trousse de secours dans un endroit sûr';

  @override
  String get recoveryKitCreateFailed =>
      'Impossible de créer votre kit de récupération. Vous pourrez en créer un plus tard dans les paramètres de votre compte.';

  @override
  String get recoveryKitSectionTitle => 'Kit de récupération';

  @override
  String get recoveryKitSectionDescription =>
      'Permet de réinitialiser votre mot de passe si vous l\'oubliez.';

  @override
  String get recoveryKitNone =>
      'Vous n\'avez pas encore de kit de récupération';

  @override
  String recoveryKitCreatedRelative(String time) {
    return 'Créé le $time';
  }

  @override
  String get recoveryKitCreate => 'Créer un kit de récupération';

  @override
  String get recoveryKitCreateNew => 'Créer un nouveau kit';

  @override
  String get recoveryKitReplaceTitle =>
      'Créer un nouveau kit de récupération ?';

  @override
  String get recoveryKitReplaceDescription =>
      'Votre kit actuel cesse de fonctionner dès que le nouveau est créé.';

  @override
  String get recoveryKitReminderTitle => 'Enregistrer une trousse de secours';

  @override
  String get recoveryKitReminderBody =>
      'Votre compte n\'a pas d\'adresse e-mail. Si vous oubliez votre mot de passe, un kit de récupération est le seul moyen de revenir. Cela ne prend qu\'une minute.';

  @override
  String get registerUsernameSignInHint =>
      'Vous vous connectez avec ce nom d\'utilisateur. Choisissez-en un dont vous vous souviendrez.';

  @override
  String get registerUsernameTaken => 'Ce nom d\'utilisateur est déjà pris';

  @override
  String get registerUsernameAvailable =>
      'Ce nom d\'utilisateur est disponible';

  @override
  String get claimAccountUsernameDescription =>
      'Réclamez votre compte en choisissant un nom d\'utilisateur et un mot de passe. Vous vous connecterez avec eux, alors choisissez-en que vous n\'oublierez pas.';

  @override
  String get unclaimedAccountDescriptionUsername =>
      'Votre compte n\'est pas encore revendiqué. Sans nom d\'utilisateur et mot de passe, vous ne pourrez pas vous connecter depuis d\'autres appareils et vous pourriez perdre l\'accès à votre compte. Revendiquez votre compte maintenant pour le sécuriser.';

  @override
  String get addFriendUsernameOnlyHint => 'Nom d\'utilisateur';

  @override
  String get registerTitle => 'Créer un compte';

  @override
  String get registerDisplayName => 'Nom affiché (facultatif)';

  @override
  String get registerDisplayNameHint =>
      'Comment les autres devraient-ils vous appeler ?';

  @override
  String get registerUsername => 'Nom d\'utilisateur (facultatif)';

  @override
  String get registerUsernameHint =>
      'Laisser vide pour un nom d\'utilisateur aléatoire';

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
  String get registerPendingApproval =>
      'Votre demande de compte est en attente d’approbation. Vous pourrez vous connecter lorsqu’un admin l’aura approuvée.';

  @override
  String get registerClosed =>
      'Les inscriptions sont actuellement fermées. Utilisez un lien d’inscription fourni par un admin pour créer un compte.';

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
  String get passkeyFailed =>
      'L\'authentification par clé d\'accès a échoué. Veuillez réessayer.';

  @override
  String get errorUnableToCreateAccount =>
      'Impossible de créer le compte. Veuillez réessayer.';

  @override
  String get errorUnableToSignIn =>
      'Impossible de vous connecter pour le moment. Veuillez réessayer.';

  @override
  String get errorServiceUnavailable =>
      'Cette instance est temporairement indisponible. Veuillez réessayer dans un instant.';

  @override
  String get errorInvalidEmailOrPassword =>
      'Adresse e-mail ou mot de passe invalide.';

  @override
  String get errorInvalidUsernameOrPassword =>
      'Nom d\'utilisateur ou mot de passe invalide.';

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
  String get embedInviteUnavailable => 'Invitation non disponible';

  @override
  String get embedInviteJoinGroup => 'Rejoindre le groupe';

  @override
  String get embedInviteAlreadyJoined => 'Déjà membre';

  @override
  String get embedInviteDisabled => 'Invitations désactivées';

  @override
  String get embedInvitePaused =>
      'Les invitations sont suspendues pour cette communauté.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName a détecté une attaque potentielle. Les nouveaux utilisateurs ne peuvent donc pas rejoindre la communauté pour le moment.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Cette communauté a suspendu les invitations. Vous pourrez réessayer plus tard.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName a détecté une attaque potentielle dans cette communauté. Les invitations sont suspendues, de sorte que les nouveaux utilisateurs ne peuvent pas la rejoindre pour le moment.';
  }

  @override
  String get inviteAcceptTitle => 'Vous avez été invité(e) à rejoindre';

  @override
  String get inviteAcceptJoinButton => 'Rejoindre la communauté';

  @override
  String get inviteAcceptGoToButton => 'Aller à la communauté';

  @override
  String get inviteAcceptInvitesPaused => 'Invitations suspendues';

  @override
  String get inviteAcceptNotFoundTitle => 'Invitation invalide';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Cette invitation peut être expirée ou invalide.';

  @override
  String get invalidDeepLinkTitle => 'Impossible d\'ouvrir le lien';

  @override
  String get invalidDeepLinkDescription =>
      'Ce lien est peut-être rompu, disponible uniquement sur le web, ou vous n\'y avez peut-être pas accès. Vérifiez le lien et réessayez.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Aller à l\'accueil';

  @override
  String get inviteAcceptJoinGroupButton => 'Rejoindre le groupe';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Vous avez été invité à rejoindre un message direct de groupe par $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'quelqu\'un';

  @override
  String get mentionUnknownChannel => 'salon-inconnu';

  @override
  String get channelAccessDeniedTitle => 'Accès au salon refusé';

  @override
  String get channelAccessDeniedDescription =>
      'Vous n\'avez pas accès au salon où ce message a été envoyé.';

  @override
  String get messageJumpLinkNoAccess => 'Accès refusé';

  @override
  String get okay => 'OK';

  @override
  String get embedThemeTitle => 'Thème partagé';

  @override
  String get embedThemeHelp => 'Vous avez du CSS !';

  @override
  String get embedThemeImport => 'Importer le thème';

  @override
  String get embedThemeUnavailableTitle => 'Thème non disponible';

  @override
  String get embedThemeUnavailableDescription =>
      'Ce thème n\'est plus disponible.';

  @override
  String get embedThemeImportUnavailable => 'Importation non disponible';

  @override
  String get themeImportTitle => 'Importer le thème';

  @override
  String get themeImportDescription =>
      'Ceci remplacera votre thème personnalisé actuel.';

  @override
  String get themeImportReadFailed =>
      'Nous n\'avons pas pu lire ce thème. Il est peut-être corrompu ou invalide.';

  @override
  String get themeImportApply => 'Appliquer';

  @override
  String get themeImportApplied => 'Thème appliqué.';

  @override
  String embedGiftVisionaryLifetime(String productName) {
    return 'Visionnaire (à vie $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jours de $productName',
      one: '1 jour de $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count semaines de $productName',
      one: '1 semaine de $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mois de $productName',
      one: '1 mois de $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ans de $productName',
      one: '1 an de $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'De la part de $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'Cliquez pour récupérer votre cadeau !';

  @override
  String get embedGiftAlreadyRedeemed => 'Déjà utilisé';

  @override
  String get embedGiftClaimAccountHelp =>
      'Finalisez votre inscription pour récupérer ce cadeau.';

  @override
  String get embedGiftClaim => 'Récupérer le cadeau';

  @override
  String get embedGiftClaimed => 'Cadeau récupéré';

  @override
  String get embedGiftClaimAccount =>
      'Finaliser l’inscription pour récupérer le cadeau';

  @override
  String get embedGiftUnknownTitle => 'Cadeau inconnu';

  @override
  String get embedGiftUnknownSubtitle =>
      'Ce code cadeau n\'est pas valide ou a déjà été utilisé.';

  @override
  String get embedGiftUnavailable => 'Cadeau indisponible';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Réclamez votre cadeau pour activer votre abonnement $productName !';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'Ce cadeau a déjà été récupéré.';

  @override
  String get giftAcceptMaybeLater => 'Peut-être plus tard';

  @override
  String get giftRedeemedToast => 'Cadeau utilisé !';

  @override
  String get giftRedeemInvalidTitle => 'Code cadeau non valide';

  @override
  String get giftRedeemInvalidMessage =>
      'Ce code est invalide ou déjà utilisé.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Cadeau déjà utilisé';

  @override
  String get giftRedeemAlreadyRedeemedMessage => 'Ce code a déjà été utilisé.';

  @override
  String get giftRedeemNotFoundTitle => 'Cadeau introuvable';

  @override
  String get giftRedeemNotFoundMessage => 'Ce code n\'existe pas.';

  @override
  String get giftRedeemFailedTitle => 'Échec du remboursement du cadeau';

  @override
  String get giftRedeemFailedMessage =>
      'Impossible d\'utiliser ce cadeau. Veuillez réessayer.';

  @override
  String get giftVisionaryCannotRedeemTitle =>
      'Impossible de recevoir ce cadeau';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Les comptes Visionary ne peuvent pas échanger de cadeaux Plutonium. Copiez le lien pour le partager avec un ami à la place.';

  @override
  String get giftCopyLink => 'Copier le lien cadeau';

  @override
  String get privacySettings => 'Paramètres de confidentialité';

  @override
  String get privacyDirectMessages => 'Messages privés';

  @override
  String get privacyDirectMessagesDescription =>
      'Autoriser les messages directs d\'autres membres de cette communauté';

  @override
  String get privacyBotDirectMessages => 'Messages privés des bots';

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
    return 'Désactiver les notifications de $guildName';
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
  String get notificationOnlyMentions => 'Mentions seulement';

  @override
  String get notificationNothing => 'Aucun';

  @override
  String get notificationSuppressEveryone =>
      'Supprimer les mentions @everyone et @here';

  @override
  String get notificationSuppressRoles =>
      'Supprimer toutes les @mentions de rôle';

  @override
  String get notificationMobilePush => 'Notifications push mobiles';

  @override
  String get notificationOverrides => 'Réglages de notification spécifiques';

  @override
  String get notificationSelectChannel =>
      'Sélectionner un salon ou une catégorie';

  @override
  String get notificationOnlyAtMentions => 'Uniquement les @mentions';

  @override
  String get notificationMuteChannel => 'Désactiver les notifications du salon';

  @override
  String get notificationUnmuteChannel =>
      'Réactiver les notifications du salon';

  @override
  String get notificationUseCategoryDefault =>
      'Utiliser les paramètres par défaut de la catégorie';

  @override
  String get notificationUseCommunityDefault =>
      'Utiliser les paramètres par défaut de la communauté';

  @override
  String get notificationNoCategory => 'Aucune catégorie';

  @override
  String get dmMarkAsRead => 'Marquer comme lu';

  @override
  String get dmMuteConversation => 'Désactiver les notifications du MP';

  @override
  String get dmUnmuteConversation => 'Réactiver les notifications du MP';

  @override
  String get dmPinDm => 'Épingler la conversation privée';

  @override
  String get dmUnpinDm => 'Désépingler la conversation privée';

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
  String get dmDeleteMyMessagesTitle =>
      'Supprimer vos messages dans cette conversation ?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Tous les messages que vous avez envoyés dans cette conversation seront supprimés définitivement. Cette action est irréversible.';

  @override
  String get dmCopyChannelId => 'Copier l\'identifiant du salon';

  @override
  String get dmChannelIdCopied => 'ID du salon copié';

  @override
  String get dmCopyUserId => 'Copier l\'identifiant de l\'utilisateur';

  @override
  String get dmUserIdCopied => 'ID utilisateur copié';

  @override
  String get dmViewProfile => 'Voir le profil';

  @override
  String get dmVoiceCall => 'Lancer un appel vocal';

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
  String dmInviteSentFor(String communityName) {
    return 'Invitation envoyée pour $communityName';
  }

  @override
  String get dmInviteSendFailed =>
      'Impossible d\'envoyer l\'invitation. Veuillez réessayer.';

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
  String get dmPinGroupDm => 'Épingler la conversation de groupe';

  @override
  String get dmUnpinGroupDm => 'Désépingler la conversation de groupe';

  @override
  String get dmUnnamedGroup => 'Groupe sans nom';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'Groupe de $resolvedName';
  }

  @override
  String get dmFavoriteDm => 'Ajouter le MP aux favoris';

  @override
  String get dmUnfavoriteDm => 'Retirer le MP des favoris';

  @override
  String get dmFavoriteGroupDm =>
      'Ajouter la conversation de groupe aux favoris';

  @override
  String get dmUnfavoriteGroupDm =>
      'Retirer la conversation de groupe des favoris';

  @override
  String get dmChangeFriendNickname => 'Modifier le surnom de l’ami';

  @override
  String get dmRemoveFriend => 'Supprimer l\'ami';

  @override
  String get dmAddFriend => 'Ajouter un ami';

  @override
  String get dmAcceptFriendRequest => 'Accepter la demande d’ami';

  @override
  String get dmIgnoreFriendRequest => 'Ignorer la demande d\'ami';

  @override
  String get dmFriendRequestSent => 'Demande d\'ami envoyée';

  @override
  String get dmUnblock => 'Débloquer';

  @override
  String get dmDebugUser => 'Déboguer l\'utilisateur';

  @override
  String get dmDebugChannel => 'Déboguer le salon';

  @override
  String get dmDebugCategory => 'Déboguer la catégorie';

  @override
  String get dmPinned => 'MP épinglé';

  @override
  String get dmUnpinned => 'MP désépinglé';

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
  String get addFriendClaimTitle => 'Finalisez votre inscription';

  @override
  String get addFriendClaimDescription =>
      'Finalisez votre inscription pour envoyer des demandes d’ami.';

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
  String get addFriendIncomingStatus => 'Demande d\'ami reçue';

  @override
  String get addFriendOutgoingStatus => 'Demande d\'ami envoyée';

  @override
  String get addFriendViewProfile => 'Voir le profil';

  @override
  String get addFriendAccept => 'Accepter';

  @override
  String get addFriendIgnore => 'Ignorer';

  @override
  String get addFriendAcceptTitle => 'Accepter la demande d’ami';

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
      'Cette personne n\'accepte pas les demandes d\'amis pour le moment.';

  @override
  String get addFriendUnblockFirst =>
      'Débloquez d’abord cette personne pour lui envoyer une demande d’ami.';

  @override
  String get addFriendCannotSendToSelf =>
      'Vous ne pouvez pas vous envoyer de demande d\'ami.';

  @override
  String get addFriendAlreadyFriends =>
      'Vous êtes déjà ami avec cet utilisateur.';

  @override
  String get addFriendClaimToSend =>
      'Finalisez votre inscription pour envoyer des demandes d’ami.';

  @override
  String get addFriendVerifyToSend =>
      'Vérifiez votre adresse e-mail avant d\'envoyer des demandes d\'ami.';

  @override
  String get addFriendFriendsListFull =>
      'Votre liste d’amis ou celle de cette personne est pleine. Retirez un ami et réessayez.';

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
  String emojiInfoDefaultDescription(String productName) {
    return 'Ceci est un emoji par défaut sur $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'Cet emoji provient de cette communauté. Vous pouvez l\'utiliser partout.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'Ceci est un emoji personnalisé d\'une communauté.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'Cet emoji personnalisé provient d\'une communauté. Demandez à l\'auteur une invitation pour utiliser cet emoji.';

  @override
  String get emojiInfoFromHeader => 'Cet emoji provient de';

  @override
  String get emojiInfoDiscoverableCommunity =>
      'Communauté présente dans Découverte';

  @override
  String get emojiInfoPrivateCommunity => 'Communauté privée';

  @override
  String get emojiInfoVerifiedCommunity => 'Communauté vérifiée';

  @override
  String get emojiInfoAddToFavorites => 'Ajouter aux favoris';

  @override
  String get emojiInfoRemoveFromFavorites => 'Retirer des favoris';

  @override
  String get emojiFrequentlyUsed => 'Fréquemment utilisés';

  @override
  String get emojiTabGifs => 'GIF';

  @override
  String get emojiTabMedia => 'Médias';

  @override
  String get emojiTabStickers => 'Stickers';

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
  String get gifPickerFavoritesEmptyTitle => 'Aucun GIF favori pour l\'instant';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Ajoutez un GIF en favori pour le voir ici.';

  @override
  String get gifPickerTrending => 'GIF tendance';

  @override
  String get gifPickerNoResultsTitle => 'Aucun résultat';

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
  String externalLinkWarningLeaving(String productName) {
    return 'Vous êtes sur le point de quitter $productName';
  }

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
      'Cela approuvera tous les liens externes et ignorera l\'avertissement pour chaque domaine. Vos domaines approuvés existants seront remplacés. C\'est moins sécurisé.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Faire confiance à tous';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Arrêter de faire confiance à tous les liens ?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Les avertissements de liens externes s\'afficheront à nouveau. Vous devrez ajouter les domaines de confiance un par un.';

  @override
  String get externalLinkStopTrustingAllAction =>
      'Désactiver la confiance totale';

  @override
  String get externalLinkTrustedAllDescription =>
      'Tous les liens externes sont considérés comme fiables. Aucun avertissement ne s’affichera.';

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
  String get skip => 'Passer';

  @override
  String get crop => 'Recadrer';

  @override
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => 'Changer votre nom d\'utilisateur';

  @override
  String get fluxerTagDescriptionBase =>
      'Les noms d\'utilisateur ne peuvent contenir que des lettres (a-z, A-Z), des chiffres (0-9) et des tirets bas. Ils ne sont pas sensibles à la casse.';

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
      'Lettres (a-z, A-Z), chiffres (0-9) et tirets bas (_) uniquement';

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
      'Finalisez votre inscription pour changer de nom d’utilisateur';

  @override
  String get changeFluxerTag => 'Changer de nom d\'utilisateur';

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
  String get displayNameLabel => 'Nom affiché';

  @override
  String get pronounsLabel => 'Pronoms';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Changer d\'avatar';

  @override
  String get removeAvatar => 'Supprimer l\'avatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. 10 Mo max. Recommandé : 512×512 px';

  @override
  String get bannerLabel => 'Bannière';

  @override
  String get changeBanner => 'Changer la bannière';

  @override
  String get removeBanner => 'Supprimer la bannière';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. 10 Mo max. Minimum : 960×540 px (16:9)';

  @override
  String get accentColorLabel => 'Couleur d\'accentuation';

  @override
  String get accentColorDescription =>
      'Personnalise la couleur de la bordure et de la bannière de votre profil';

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
      'Afficher Visionary comme un abonnement';

  @override
  String get maskVisionaryDescription =>
      'Afficher Visionary comme un abonnement classique';

  @override
  String get hideVisionaryIdBadge => 'Masquer le badge Visionary ID';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Masquer le badge d\'ID Visionary (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Supprimer votre badge Visionary ID';

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
  String profilePreviewMemberSince(String productName) {
    return 'Membre de $productName depuis le';
  }

  @override
  String get unclaimedAccountTitle => 'Compte non finalisé';

  @override
  String get unclaimedAccountDescription =>
      'Votre compte n\'a pas encore été revendiqué. Sans e-mail ni mot de passe, vous pourriez perdre l\'accès. Revendiquez votre compte maintenant pour le sécuriser.';

  @override
  String get claimAccount => 'Finaliser l’inscription';

  @override
  String get profileTypeLabel => 'Type de profil';

  @override
  String get profileTypeGlobal => 'Profil global';

  @override
  String get profileTypeGuildDescription =>
      'Vous modifiez votre profil spécifique à cette communauté. Ce profil ne sera visible que dans cette communauté et remplacera votre profil global.';

  @override
  String get communityNicknameLabel => 'Surnom dans la communauté';

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
  String securityLoginEmailSectionDescription(String productName) {
    return 'Gérez l\'adresse e-mail que vous utilisez pour vous connecter à $productName';
  }

  @override
  String get securityLoginEmailAddressLabel => 'Adresse e-mail';

  @override
  String get securityLoginNoEmailSet => 'Aucune adresse e-mail définie';

  @override
  String get securityLoginChangeEmail => 'Changer d\'adresse e-mail';

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
  String get securityLoginChangePassword => 'Changer le mot de passe';

  @override
  String get securityLoginSetPassword => 'Définir le mot de passe';

  @override
  String get passwordChangeTitle => 'Changer le mot de passe';

  @override
  String get passwordChangeIntroDescription =>
      'Nous enverrons un code de vérification à votre adresse e-mail pour confirmer votre identité avant de changer votre mot de passe.';

  @override
  String get passwordChangeStart => 'Démarrer';

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
  String get passwordChangeSubmit => 'Changer le mot de passe';

  @override
  String get passwordChangeSuccess => 'Mot de passe modifié';

  @override
  String get passwordChangePasswordsDoNotMatch =>
      'Les mots de passe ne correspondent pas';

  @override
  String get passwordChangeInvalidCode => 'Code invalide ou expiré';

  @override
  String get emailChangeTitle => 'Changer d\'adresse e-mail';

  @override
  String get emailChangeIntroDescription =>
      'Nous enverrons des codes de vérification pour confirmer votre identité avant de modifier votre adresse e-mail.';

  @override
  String get emailChangeStart => 'Démarrer';

  @override
  String get emailChangeVerifyOriginalTitle => 'Vérifier l\'e-mail actuel';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Entrez le code de vérification envoyé à votre adresse e-mail actuelle.';

  @override
  String get emailChangeNewEmailTitle => 'Saisir la nouvelle adresse e-mail';

  @override
  String get emailChangeNewEmailDescription =>
      'Entrez la nouvelle adresse e-mail que vous souhaitez utiliser.';

  @override
  String get emailChangeNewEmailLabel => 'Nouvelle adresse e-mail';

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
      'Utiliser une application d’authentification pour générer les codes de l’authentification à deux facteurs';

  @override
  String get securityTfaBackupCodes => 'Codes de secours';

  @override
  String get securityTfaBackupCodesDescription =>
      'Afficher et gérer vos codes de secours pour la récupération de compte';

  @override
  String get securityTfaViewCodes => 'Afficher les codes';

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
      'ex. : YubiKey, iPhone, ordinateur professionnel';

  @override
  String get securityClaimTitle => 'Fonctionnalités de sécurité';

  @override
  String get securityClaimDescription =>
      'Finalisez votre inscription pour accéder aux fonctionnalités de sécurité comme l’authentification à deux facteurs et les clés d’accès.';

  @override
  String get securityVerifyEmailRequired =>
      'Vous devez vérifier votre adresse e-mail avant de pouvoir configurer l\'authentification à deux facteurs ou les passkeys.';

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
  String get dangerZoneSectionTitle => 'Zone de danger';

  @override
  String get dangerZoneSectionDescription =>
      'Actions irréversibles et destructrices';

  @override
  String get dangerZoneDisableTitle => 'Désactiver le compte';

  @override
  String get dangerZoneDisableDescription =>
      'Désactiver temporairement votre compte. Vous pourrez le réactiver plus tard en vous reconnectant.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'La désactivation de votre compte vous déconnectera de toutes les sessions. Vous pourrez réactiver votre compte à tout moment en vous reconnectant.';

  @override
  String get dangerZoneDeleteTitle => 'Supprimer le compte';

  @override
  String get dangerZoneDeleteDescription =>
      'Supprimer définitivement votre compte et toutes les données associées. Cette action est irréversible.';

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
      'Voulez-vous vraiment supprimer votre compte ? Cette action planifiera la suppression définitive de votre compte.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Vous pouvez annuler la suppression dans les 14 jours';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Après 14 jours, votre compte sera définitivement supprimé';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Une fois la suppression effectuée, vous ne pourrez plus récupérer l\'accès à votre compte';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Vous ne pourrez pas supprimer vos messages envoyés après la suppression de votre compte';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Si vous souhaitez exporter vos données ou supprimer vos messages au préalable, veuillez consulter la section Tableau de bord de confidentialité dans les Paramètres utilisateur avant de continuer.';

  @override
  String get claimAccountTitle => 'Finalisez votre inscription';

  @override
  String get claimAccountDescription =>
      'Finalisez votre inscription en ajoutant une adresse e-mail et un mot de passe à votre compte. Nous vous enverrons un code pour vérifier votre adresse e-mail avant de terminer.';

  @override
  String get claimAccountEmailLabel => 'E-mail';

  @override
  String get claimAccountPasswordLabel => 'Mot de passe';

  @override
  String get claimAccountSendCode => 'Envoyer le code';

  @override
  String get claimAccountVerifyDescription =>
      'Saisissez le code que nous avons envoyé à votre adresse e-mail pour la vérifier. Votre mot de passe sera défini une fois le code confirmé.';

  @override
  String get claimAccountSuccess => 'Inscription finalisée';

  @override
  String get importantInformation => 'Informations importantes :';

  @override
  String get genericError => 'Une erreur est survenue';

  @override
  String get networkErrorMessage =>
      'Une erreur est survenue. Veuillez réessayer.';

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
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'il y a $count semaines',
      one: 'il y a 1 semaine',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dans $count minutes',
      one: 'dans 1 minute',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dans $count heures',
      one: 'dans 1 heure',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dans $count jours',
      one: 'dans 1 jour',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dans $count semaines',
      one: 'dans 1 semaine',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dans $count mois',
      one: 'dans 1 mois',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dans $count ans',
      one: 'dans 1 an',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'à l\'instant';

  @override
  String get authorizedAppsTitle => 'Applications autorisées';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Ces applications ont reçu l\'autorisation d\'accéder à votre compte $productName.';
  }

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
      'Accéder à vos informations de profil de base (nom d\'utilisateur, avatar, etc.)';

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
  String get applicationsTitle => 'Applications';

  @override
  String get applicationsCreate => 'Créer une application';

  @override
  String get applicationsCreateSubmit => 'Créer';

  @override
  String get applicationsCreateClaimTooltip =>
      'Finalisez votre inscription pour créer des applications.';

  @override
  String applicationsDocsLink(String domain) {
    return 'Lire la documentation ($domain)';
  }

  @override
  String get applicationsLoadError => 'Impossible de charger les applications';

  @override
  String get applicationsLoadErrorDescription =>
      'Vérifiez votre connexion et réessayez.';

  @override
  String get applicationsEmptyTitle => 'Aucune application pour l\'instant';

  @override
  String applicationsEmptyDescription(String apiName) {
    return 'Créez votre première application pour commencer à utiliser $apiName.';
  }

  @override
  String applicationsCreated(String date) {
    return 'Créé le $date';
  }

  @override
  String get applicationsName => 'Nom de l\'application';

  @override
  String get applicationsNameHint => 'Mon application';

  @override
  String get applicationsNameRequired => 'Le nom de l\'application est requis';

  @override
  String get applicationsBackToList => 'Retour à la liste';

  @override
  String get applicationsDetailLoadError =>
      'Impossible de charger cette application';

  @override
  String get applicationsDetailLoadErrorDescription =>
      'Réessayez ou revenez à la liste des applications.';

  @override
  String get applicationsId => 'ID de l\'application';

  @override
  String get applicationsCopyId => 'Copier l\'ID';

  @override
  String get applicationsSecretsTitle => 'Secrets et jetons';

  @override
  String get applicationsSecretsDescription =>
      'Gardez-les en sécurité. La régénération interrompra les intégrations existantes.';

  @override
  String get applicationsClientSecret => 'Secret client';

  @override
  String get applicationsBotToken => 'Jeton du bot';

  @override
  String get applicationsRegenerate => 'Régénérer';

  @override
  String get applicationsRegenerateClientSecretTitle =>
      'Régénérer le secret client ?';

  @override
  String get applicationsRegenerateBotTokenTitle =>
      'Régénérer le jeton du bot ?';

  @override
  String get applicationsRegenerateClientSecretDescription =>
      'La régénération invalidera le secret actuel. Mettez à jour tout code qui utilise l\'ancienne valeur.';

  @override
  String get applicationsRegenerateBotTokenDescription =>
      'La régénération invalidera le jeton actuel. Mettez à jour tout code qui utilise l\'ancienne valeur.';

  @override
  String get applicationsClientSecretRegenerated =>
      'Secret client régénéré. Mettez à jour tout code utilisant l\'ancien secret.';

  @override
  String get applicationsBotTokenRegenerated =>
      'Jeton du bot régénéré. Mettez à jour tout code qui utilise l\'ancien jeton.';

  @override
  String get applicationsRegenerateFailed =>
      'Impossible de régénérer le secret';

  @override
  String get applicationsInfoTitle => 'Informations sur l\'application';

  @override
  String get applicationsInfoDescription =>
      'Paramètres de base et URI de redirection autorisés.';

  @override
  String get applicationsPublicBot => 'Bot public';

  @override
  String get applicationsPublicBotDescription =>
      'Autoriser tout le monde à inviter ce bot dans ses communautés.';

  @override
  String get applicationsRequireCodeGrant =>
      'Exiger le flux OAuth2 avec code d’autorisation';

  @override
  String get applicationsRequireCodeGrantDescription =>
      'Nécessite une URI de redirection et un code d\'autorisation lors de l\'invitation de ce bot.';

  @override
  String get applicationsRedirectUris => 'URI de redirection';

  @override
  String get applicationsAddRedirect => 'Ajouter une redirection';

  @override
  String get applicationsDeleteRedirect => 'Supprimer l\'URI de redirection';

  @override
  String get applicationsBotProfileTitle => 'Profil du bot';

  @override
  String get applicationsBotProfileDescription =>
      'Avatar, tag et détails de profil enrichis pour votre bot.';

  @override
  String get applicationsBotAvatar => 'Avatar du bot';

  @override
  String get applicationsUsernameRequired => 'Le nom d\'utilisateur est requis';

  @override
  String get applicationsUsernameTooLong =>
      'Le nom d\'utilisateur doit contenir au maximum 32 caractères';

  @override
  String get applicationsUsernameInvalid =>
      'Le nom d\'utilisateur ne peut contenir que des lettres, des chiffres et des tirets bas';

  @override
  String get applicationsBotUsername => 'Nom d\'utilisateur du bot';

  @override
  String get applicationsDiscriminator => 'Numéro de distinction';

  @override
  String get applicationsBotBio => 'Bio du bot';

  @override
  String get applicationsBotBioHint =>
      'Un bot utile qui fait des choses incroyables !';

  @override
  String get applicationsNoBotBanner => 'Pas de bannière de bot';

  @override
  String get applicationsFriendlyBot => 'Bot convivial';

  @override
  String get applicationsFriendlyBotDescription =>
      'Autoriser les utilisateurs à envoyer des demandes d\'ami à ce bot pour approbation manuelle.';

  @override
  String get applicationsManualFriendApproval =>
      'Exiger l’approbation manuelle des demandes d’ami';

  @override
  String get applicationsManualFriendApprovalDescription =>
      'Les demandes d\'ami pour ce bot nécessitent une approbation manuelle.';

  @override
  String get applicationsOauthBuilderTitle => 'Générateur d\'URL OAuth2';

  @override
  String get applicationsOauthBuilderDescription =>
      'Créez une URL d\'autorisation avec des scopes et des permissions.';

  @override
  String get applicationsScopes => 'Portées';

  @override
  String get applicationsRedirectUri => 'URI de redirection';

  @override
  String get applicationsSelectRedirectUri =>
      'Sélectionner une URI de redirection';

  @override
  String get applicationsRedirectRequiredCodeGrant =>
      'Une URI de redirection est requise, car ce bot utilise le flux OAuth2 avec code d’autorisation.';

  @override
  String get applicationsRedirectRequiredScopes =>
      'Une URI de redirection est requise lorsque d’autres portées que bot sont utilisées.';

  @override
  String get applicationsBotPermissions => 'Permissions du bot';

  @override
  String get applicationsAuthorizeUrl => 'URL d\'autorisation';

  @override
  String get applicationsAuthorizeUrlPlaceholder =>
      'Sélectionner les portées et, si nécessaire, l’URI de redirection';

  @override
  String get applicationsCopyAuthorizeUrl => 'Copier l\'URL d\'autorisation';

  @override
  String get applicationsCopiedUrl => 'URL copiée dans le presse-papiers';

  @override
  String get applicationsDangerTitle => 'Zone de danger';

  @override
  String get applicationsDangerSubtitle =>
      'Cette action est irréversible. La suppression de l\'application entraîne également la suppression de son bot.';

  @override
  String get applicationsDangerHelper =>
      'Une fois supprimée, l\'application et ses identifiants sont définitivement retirés.';

  @override
  String get applicationsDelete => 'Supprimer l\'application';

  @override
  String applicationsDeleteConfirmDescription(String name) {
    return 'Voulez-vous vraiment supprimer $name ? Cette action est irréversible. Toutes les données associées, y compris l’utilisateur bot, seront définitivement supprimées.';
  }

  @override
  String get applicationsDeleteFailed =>
      'Impossible de supprimer l’application';

  @override
  String get applicationsUpdated => 'Application mise à jour avec succès';

  @override
  String get applicationsNoChanges => 'Aucune modification à enregistrer';

  @override
  String get applicationsSearchBots => 'Applications et bots';

  @override
  String get applicationsSearchBotsDescription =>
      'Créer et gérer des applications et des bots pour votre compte';

  @override
  String get applicationsSearchInfoDescription =>
      'Modifier les informations de base de l\'application et les URI de redirection';

  @override
  String get applicationsSearchBotProfileDescription =>
      'Modifier l\'avatar, le tag, la bio, la bannière et le comportement des demandes d\'amis du bot';

  @override
  String get applicationsSearchOauthDescription =>
      'Créer une URL d’autorisation avec des portées, des redirections et des permissions de bot';

  @override
  String get applicationsSearchSecretsDescription =>
      'Afficher et régénérer les secrets client et les jetons de bot';

  @override
  String get applicationsSearchBotsKeyword => 'Bots';

  @override
  String get applicationsSearchDocumentation => 'Documentation';

  @override
  String get blockedUsersTitle => 'Utilisateurs bloqués';

  @override
  String get blockedUsersDescription =>
      'Les utilisateurs bloqués ne peuvent pas vous envoyer de demandes d’ami ni de messages privés.';

  @override
  String get blockedUsersEmptyTitle => 'Aucun utilisateur bloqué';

  @override
  String get blockedUsersEmptyDescription =>
      'Vous n\'avez bloqué personne pour l\'instant.';

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
  String get blockedUsersCopyTag => 'Copier le nom d\'utilisateur';

  @override
  String get blockedUsersCopyId => 'Copier l\'identifiant de l\'utilisateur';

  @override
  String get userProfileLoadError => 'Impossible de charger le profil';

  @override
  String get userProfileLoading => 'Chargement du profil';

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
  String userProfileStaffBadgeTooltip(String productName) {
    return 'Équipe $productName';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return 'Équipe Communauté $productName';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return 'Partenaire $productName';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return 'Chasseur de bugs $productName';
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
    return 'Abonné $productName Plutonium depuis le $date';
  }

  @override
  String userProfileVisionaryBadgeTooltip(String productName) {
    return 'Visionary $productName';
  }

  @override
  String userProfileVisionaryBadgeSinceTooltip(
    String productName,
    String date,
  ) {
    return 'Visionnaire $productName depuis le $date';
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
  String get userProfileOpenBlockedDmTitle => 'Ouvrir le MP';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Vous avez bloqué $username. Vous ne pourrez pas envoyer de messages tant que vous ne l\'aurez pas débloqué.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Débloquer';

  @override
  String get userProfileOpenDm => 'Ouvrir le MP';

  @override
  String get userProfileNoteTitle => 'Note';

  @override
  String get userProfileNoteVisibility => '(visible uniquement par vous)';

  @override
  String get userProfileNoteSave => 'Enregistrer';

  @override
  String get userProfileNoteDelete => 'Supprimer';

  @override
  String get userProfileMemberSince => 'Membre depuis';

  @override
  String get userProfileAboutMe => 'À propos de moi';

  @override
  String get userProfileRoles => 'Rôles';

  @override
  String get memberRoleAdd => 'Ajouter un rôle';

  @override
  String memberRoleRemove(String roleName) {
    return 'Retirer le rôle $roleName';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'Cet utilisateur n\'a aucun rôle dans cette communauté.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'Aucun rôle pour l\'instant. Ajoutez des rôles dans $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'Aucun rôle disponible';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'Il n’y a actuellement aucun rôle à attribuer dans cette communauté, mais vous pouvez en créer un nouveau dans $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Paramètres de la communauté';

  @override
  String get guildSettingsRolesTab => 'Rôles';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Heure locale';

  @override
  String get profileLocalTimeSettingsTitle => 'Heure locale du profil';

  @override
  String profileLocalTimeSettingsSummary(String productName) {
    return 'Définissez votre fuseau horaire une fois pour que $productName puisse maintenir à jour votre décalage UTC lorsque l’heure d’été change. Les autres utilisateurs ne peuvent voir que votre décalage UTC, et non votre identifiant de fuseau horaire exact.';
  }

  @override
  String get profileLocalTimeEditButton => 'Modifier l\'heure locale du profil';

  @override
  String get profileLocalTimeTimezoneLabel => 'Fuseau horaire';

  @override
  String profileLocalTimeTimezoneHelp(String productName) {
    return 'Choisissez le fuseau horaire que $productName utilise pour calculer votre décalage UTC et afficher l’heure locale de votre profil.';
  }

  @override
  String get profileLocalTimeSearchTimezones =>
      'Rechercher des fuseaux horaires';

  @override
  String get profileLocalTimeNotSet => 'Non défini';

  @override
  String profileLocalTimePrivacyNote(
    String timezoneIdentifierExample,
    String productName,
  ) {
    return 'Les autres utilisateurs ne peuvent voir que votre décalage UTC actuel lorsque vous choisissez de partager l’heure locale de votre profil. Ils ne voient pas votre identifiant de fuseau horaire exact, tel que $timezoneIdentifierExample. $productName conserve cet identifiant afin que le décalage puisse être mis à jour automatiquement lors des changements d’heure d’été.';
  }

  @override
  String get profileLocalTimePrivacyEveryone => 'Tout le monde';

  @override
  String get profileLocalTimePrivacyEveryoneDesc =>
      'Autoriser toute personne pouvant consulter votre profil complet à voir votre heure locale';

  @override
  String get profileLocalTimePrivacyFriends => 'Amis';

  @override
  String get profileLocalTimePrivacyFriendsDesc =>
      'Autoriser vos amis à voir votre heure locale';

  @override
  String get profileLocalTimePrivacyCommunityMembers =>
      'Membres de la communauté';

  @override
  String get profileLocalTimePrivacyCommunityMembersDesc =>
      'Autoriser les membres de vos communautés à voir votre heure locale';

  @override
  String get userProfileSameTimeAsYou => 'Même heure que vous';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return '$duration d\'avance sur vous';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return '$duration de retard sur vous';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours heures',
      one: '1 heure',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minutes',
      one: '1 minute',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours heures',
      one: '1 heure',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minutes',
      one: '1 minute',
    );
    return '$_temp0';
  }

  @override
  String get userProfileCopyUsername => 'Copier le nom d\'utilisateur';

  @override
  String get userProfileCopyUserId => 'Copier l\'identifiant de l\'utilisateur';

  @override
  String get userProfileViewMainProfile => 'Voir le profil principal';

  @override
  String get userProfileViewCommunityProfile =>
      'Voir le profil dans la communauté';

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
  String get userProfileChangeNickname => 'Modifier le surnom';

  @override
  String get userProfileKick => 'Expulser';

  @override
  String get userProfileBan => 'Bannir';

  @override
  String get userProfileTimeout => 'Appliquer une restriction temporaire';

  @override
  String get userProfileRemoveTimeout => 'Lever la restriction temporaire';

  @override
  String get userProfileTransferOwnership => 'Transférer la propriété';

  @override
  String get userProfileReportMessage => 'Signaler le message';

  @override
  String get userProfileReportUserProfile => 'Signaler le profil';

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
    return 'La suppression du silence permettra à $username de renvoyer des messages, de réagir et de rejoindre à nouveau les salons vocaux.';
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
  String get userProfileBanDeleteNone => 'Ne pas supprimer';

  @override
  String get userProfileBanDelete24h => '24 dernières heures';

  @override
  String get userProfileBanDelete7d => '7 derniers jours';

  @override
  String get userProfileBanReasonLabel => 'Raison (facultative)';

  @override
  String get userProfileBanReasonHint => 'Saisir un motif de bannissement';

  @override
  String get userProfileBanSubmit => 'Bannir le membre';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Mettre en silence $username';
  }

  @override
  String get userProfileTimeoutDurationLabel =>
      'Durée de la restriction temporaire';

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
  String get typingIndicatorMultiple =>
      'Plusieurs personnes sont en train d\'écrire...';

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
    return 'Ravi de vous voir, $username !';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Bienvenue, $username ! Faites comme chez vous.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Bonjour, $username ! Nous sommes ravis de vous compter parmi nous.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Bonjour, $username ! Rejoignez-nous quand vous voulez.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Salut $username, ravi de vous voir ici !';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Salut, $username ! Nous espérons que vous apprécierez votre séjour.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Salut $username, bienvenue à bord !';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Vous voilà, $username !';
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
    return 'Bienvenue, $username ! Nous sommes ravis de vous compter parmi nous.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Bienvenue, $username ! Nous espérons que vous passerez un bon moment ici.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Bienvenue, $username ! Votre prochaine conversation commence ici.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Bienvenue, $username. Nous sommes ravis de vous compter parmi nous.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Ravi de vous revoir, $username ! Bienvenue.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Vous êtes là, $username ! Content de vous avoir parmi nous.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Bienvenue, $username ! C\'est parti.';
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
  String get linkedDevicesViewDetails => 'Voir les détails';

  @override
  String get linkedDevicesDetailsTitle => 'Détails de l’appareil';

  @override
  String get linkedDevicesDetailsDevice => 'Appareil';

  @override
  String get linkedDevicesDetailsClient => 'Client';

  @override
  String get linkedDevicesDetailsLocation => 'Localisation';

  @override
  String get linkedDevicesDetailsIp => 'Adresse IP';

  @override
  String get linkedDevicesDetailsLastUsed => 'Dernière utilisation';

  @override
  String get linkedDevicesCurrentSession => 'Session actuelle';

  @override
  String get linkedDevicesUnknown => 'Inconnu';

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
  String get slowmodeStatusEnabled => 'Mode lent activé';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Mode lent actif ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'Le mode lent est réglé sur $durationLabel, mais vous en êtes exempt.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Le mode lent est réglé sur $durationLabel. Attendez avant d\'envoyer un autre message.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Le mode lent est réglé sur $durationLabel pour ce salon.';
  }

  @override
  String get channelNoSendPermissionHint =>
      'Vous ne pouvez pas envoyer de messages dans ce salon.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Annonces système de l\'équipe $productName. Vous ne pouvez pas répondre ici.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'La messagerie est temporairement suspendue dans cette communauté.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Vous faites l’objet d’une restriction temporaire. L’envoi de messages, les réactions et les connexions vocales sont suspendus jusqu’à sa fin.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Vous devez finaliser votre inscription pour envoyer des messages dans cette communauté.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Vous devez vérifier votre adresse e-mail pour envoyer des messages dans cette communauté.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Votre compte est trop récent pour envoyer des messages dans cette communauté.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Vous n\'êtes pas membre de cette communauté depuis assez longtemps pour envoyer des messages.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Vérifier l\'e-mail';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Trop de pièces jointes (max $max)';
  }

  @override
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName dépasse la limite de taille ($fileSize)';
  }

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
  String get voiceMessageTitle => 'Message vocal';

  @override
  String get voiceMessageHoldHint =>
      'Maintenez pour enregistrer. Faites glisser pour supprimer, balayez vers le haut pour verrouiller ou relâchez pour envoyer.';

  @override
  String get voiceMessageDiscard => 'Supprimer le message vocal';

  @override
  String get voiceMessageSend => 'Envoyer un message vocal';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Impossible de démarrer l\'enregistrement. Autorisez l\'accès au microphone.';

  @override
  String get voiceMessageMicInUse =>
      'Quittez l\'appel vocal pour enregistrer un message vocal.';

  @override
  String get voiceMessageRecordingFailed =>
      'Échec de l\'enregistrement. Veuillez réessayer.';

  @override
  String get voiceMessageSendFailed =>
      'Impossible d\'envoyer le message vocal. Réessayez.';

  @override
  String get voiceMessagePlay => 'Lire';

  @override
  String get voiceMessagePause => 'Pause';

  @override
  String get voiceMessageSeekForward => 'Avancer';

  @override
  String get voiceMessageSeekBackward => 'Reculer';

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
  String get chatAttachmentDownloadedToast => 'Enregistré dans les photos';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Impossible de télécharger la pièce jointe';

  @override
  String get chatAttachmentExpiredTooltip => 'Pièce jointe expirée';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Afficher ($count lignes)',
      one: 'Afficher ($count ligne)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Réduire ($count lignes)',
      one: 'Réduire ($count ligne)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Afficher ($count lignes)',
      one: 'Afficher ($count ligne)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Réduire ($count lignes)',
      one: 'Réduire ($count ligne)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count lignes restantes)',
      one: '... ($count ligne restante)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count lignes restantes)',
      one: '... ($count ligne restante)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'Afficher le fichier entier';

  @override
  String get chatTextualPreviewChangeLanguage => 'Changer la langue';

  @override
  String get chatTextualPreviewSearchLanguage => 'Rechercher la langue…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Coloration syntaxique';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'Aucun résultat';

  @override
  String get chatTextualPreviewMoreOptions => 'Plus d\'options';

  @override
  String get chatTextualPreviewWrapText => 'Retour à la ligne';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'Le fichier est trop volumineux pour l\'aperçu intégré (limite de $previewLimitKb Ko).';
  }

  @override
  String get chatTextualPreviewLoadError => 'Impossible de charger l\'aperçu.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Texte brut';

  @override
  String get chatTextualPreviewCopy => 'Copier';

  @override
  String get chatAttachmentSourceGallery => 'Galerie';

  @override
  String get chatAttachmentSourceCamera => 'Caméra';

  @override
  String get chatAttachmentSourceBrowse => 'Parcourir les fichiers';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Afficher le spoiler';

  @override
  String get matureMediaRevealButton => 'Afficher';

  @override
  String get matureMediaRevealHint => 'Cliquer pour afficher';

  @override
  String get matureContentTitle => 'Contenu pour adultes';

  @override
  String get matureCommunityTitle => 'Communauté réservée aux adultes';

  @override
  String get matureCategoryTitle => 'Catégorie réservée aux adultes';

  @override
  String get matureChannelTitle => 'Salon réservé aux adultes';

  @override
  String get communityContentWarningTitle =>
      'Avertissement concernant le contenu de la communauté';

  @override
  String get categoryContentWarningTitle =>
      'Avertissement relatif au contenu de la catégorie';

  @override
  String get channelContentWarningTitle =>
      'Avertissement sur le contenu du salon';

  @override
  String get defaultContentWarningBody => 'Ce contenu est sensible.';

  @override
  String get matureCommunityBody =>
      'Cette communauté est réservée aux adultes et peut contenir des éléments inappropriés pour certains utilisateurs.';

  @override
  String get matureCategoryBody =>
      'Cette catégorie est réservée aux adultes et peut contenir des éléments inappropriés pour certains utilisateurs.';

  @override
  String get matureChannelBody =>
      'Ce salon est réservé aux adultes et peut contenir des éléments inappropriés pour certains utilisateurs.';

  @override
  String get matureVoiceChannelBody =>
      'Ce salon vocal est réservé aux adultes et peut contenir des éléments inappropriés pour certains utilisateurs.';

  @override
  String get matureLinkChannelBody =>
      'Ce salon de lien est réservé aux adultes et peut ouvrir du contenu inapproprié pour certains utilisateurs.';

  @override
  String get matureCommunityUnavailableBody =>
      'Cette communauté réservée aux adultes n’est pas accessible avec votre compte.';

  @override
  String get matureCategoryUnavailableBody =>
      'Cette catégorie réservée aux adultes n’est pas accessible avec votre compte.';

  @override
  String get matureChannelUnavailableBody =>
      'Ce salon réservé aux adultes n’est pas accessible avec votre compte.';

  @override
  String get matureContentProceedButton => 'Continuer';

  @override
  String get matureContentUnderstandButton => 'J\'ai compris';

  @override
  String get matureContentOpenLinkButton => 'Ouvrir le lien';

  @override
  String get sensitiveContentFriendDmLabel => 'Messages privés d’amis';

  @override
  String get sensitiveContentNonFriendDmLabel =>
      'Messages privés d’autres personnes';

  @override
  String get sensitiveContentGuildLabel =>
      'Messages dans les salons de communauté';

  @override
  String get sensitiveContentFilterShow => 'Afficher';

  @override
  String get sensitiveContentFilterBlur => 'Flouter';

  @override
  String get sensitiveContentFilterBlock => 'Bloquer';

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
  String connectionsDescription(String productName) {
    return 'Liez des comptes et des domaines externes à votre profil $productName. Les connexions vérifiées seront affichées sur votre profil pour que d\'autres puissent les voir.';
  }

  @override
  String get connectionsEmptyTitle => 'Aucune connexion pour l\'instant';

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
  String get connectionHandleLabel => 'Pseudo';

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
  String get connectionDnsRecordTitle => 'Enregistrement DNS TXT';

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
  String get connectionTokenFileTitle => 'Fournir le fichier de jeton';

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
      'Autoriser tout le monde à voir cette connexion sur votre profil';

  @override
  String get connectionVisibilityFriends => 'Amis';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Autoriser vos amis à voir cette connexion';

  @override
  String get connectionVisibilityCommunityMembers => 'Membres de la communauté';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Autoriser les membres des communautés dont vous faites partie à voir cette connexion';

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
  String get lookAndFeelThemeSectionTitle => 'Thème';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Choisissez entre une apparence sombre, anthracite ou claire.';

  @override
  String get lookAndFeelHdrSectionTitle => 'Plage dynamique élevée';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Contrôlez la façon dont les images HDR s\'affichent sur les écrans compatibles HDR.';

  @override
  String get lookAndFeelHdrFullName => 'Plage dynamique complète';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Afficher les images HDR avec la luminosité et la gamme de couleurs maximales.';

  @override
  String get lookAndFeelHdrStandardName => 'Gamme standard';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Convertir les images HDR en plage standard, réduisant ainsi la luminosité maximale.';

  @override
  String get lookAndFeelHdrDisplayModeLabel => 'Mode d\'affichage HDR';

  @override
  String get lookAndFeelThemeDark => 'Thème sombre';

  @override
  String get lookAndFeelThemeDarkLegacy => 'Ancien thème sombre';

  @override
  String get lookAndFeelThemeCoal => 'Thème charbon';

  @override
  String get lookAndFeelThemeLight => 'Thème clair';

  @override
  String get lookAndFeelThemeSystem => 'Thème du système';

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
  String get lookAndFeelChatFontSizeLabel => 'Taille de la police du chat';

  @override
  String get lookAndFeelAppZoomTitle => 'Niveau de zoom de l’application';

  @override
  String get lookAndFeelAppZoomDescription =>
      'Ajuster le niveau de zoom de l\'application.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'Fond d\'écran du chat';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'Choisissez un arrière-plan pour le chat. Il reste sur cet appareil.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'Ce paramètre reste sur cet appareil';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'Le fond d\'écran du chat est enregistré uniquement sur cet appareil et n\'est pas synchronisé avec d\'autres appareils.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'Par défaut';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'Image personnalisée';

  @override
  String get lookAndFeelChatWallpaperStarfieldLabel => 'Champ d\'étoiles';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Couleur $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Dégradé $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'Estomper le fond d\'écran';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'Impossible de définir cette image comme fond d\'écran.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Messages';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Choisissez comment les messages s\'affichent dans les salons de discussion.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Espacement entre les groupes de messages';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '$spacing px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel =>
      'Mode d\'affichage des messages';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Confortable';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Mise en page aérée avec une séparation visuelle claire entre les messages.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Dense';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Optimise l\'affichage des messages avec un espacement minimal.';

  @override
  String get lookAndFeelHideUserAvatarsLabel =>
      'Masquer les avatars des utilisateurs';

  @override
  String get lookAndFeelInterfaceTitle => 'Interface';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Personnaliser les éléments et les comportements de l\'interface.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Indicateurs de saisie dans la liste des salons';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Choisissez comment les indicateurs de frappe apparaissent dans la liste des salons lorsque quelqu\'un tape dans un salon.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Indicateur de saisie + avatars';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Afficher l\'indicateur de saisie avec les avatars des utilisateurs dans la liste des salons';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Seulement l\'indicateur de saisie';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Afficher uniquement l\'indicateur de saisie, sans les avatars';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Masqué';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Ne pas afficher les indicateurs de saisie dans la liste des salons';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Afficher la frappe sur le salon sélectionné';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Lorsqu\'elle est désactivée (par défaut), les indicateurs de frappe n\'apparaîtront pas sur le salon que vous consultez actuellement.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'général';

  @override
  String get lookAndFeelKeyboardHintsTitle =>
      'Indications de raccourcis clavier';

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
  String get communityTemporarilyUnavailable =>
      'Communauté temporairement indisponible';

  @override
  String get guildUnavailableDescription =>
      'Une erreur est survenue. Nous y travaillons.';

  @override
  String get guildNotFoundTitle =>
      'Ce n\'est pas la communauté que vous recherchez.';

  @override
  String get guildNotFoundDescription =>
      'La communauté que vous recherchez a peut-être été supprimée ou vous n\'y avez peut-être pas accès.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return '$communityName est actuellement accessible uniquement aux membres de l’équipe $productName';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => 'temporairement indisponible';

  @override
  String get lookAndFeelCollapseDMsLabel => 'Réduire les MP dans un dossier';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'Lorsqu\'elle est activée, les MP non lus dans la barre latérale des serveurs sont réduits dans un dossier sur le bouton $productName. Cliquez sur le bouton $productName lorsque vous êtes sur la page des MP pour développer ou réduire le dossier.';
  }

  @override
  String get lookAndFeelChannelListSectionTitle => 'Liste des salons';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Gérer le comportement de l\'indicateur de messages non lus pour les salons mis en sourdine dans les listes de salons.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Afficher l\'indicateur de messages non lus sur les salons mis en sourdine';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Lorsqu\'elle est activée, les salons mis en sourdine affichent un indicateur de non-lu atténué sur le côté gauche. Les mentions apparaissent toujours indépendamment de ce paramètre.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Actif en ce moment';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Contrôlez la façon dont \"Actifs maintenant\" apparaît dans l\'application.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Afficher « Actif en ce moment » sur l’écran d’accueil';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Affichez « Actif en ce moment » sur l’écran d’accueil pour retrouver vos amis actifs dans les salons vocaux. Vous verrez un aperçu, le contexte du salon, les personnes déjà présentes et un moyen de les rejoindre rapidement.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Favoris';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Contrôlez la visibilité des favoris dans toute l\'application.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Activer les favoris';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Lorsqu\'elle est activée, vous pouvez mettre des salons en favoris et ils apparaîtront dans la section Favoris. Lorsqu\'elle est désactivée, tous les éléments d\'interface liés aux favoris (boutons, éléments de menu) seront masqués. Vos favoris existants seront conservés.';

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
      'Votre espace personnel pour accéder rapidement aux salons, messages privés et groupes que vous aimez. Appuyez sur l\'étoile de n\'importe quel salon pour l\'ajouter ici.';

  @override
  String get favoritesWelcomeTip =>
      'Pas pour vous ? Désactivez-le à tout moment.';

  @override
  String get favoritesDisableButton => 'Désactiver les favoris';

  @override
  String get favoritesAddedToast => 'Ajouté aux favoris';

  @override
  String get favoritesRemovedToast => 'Retiré des favoris';

  @override
  String get favoritesHiddenToast => 'Favoris masqués';

  @override
  String get favoritesMute => 'Désactiver les notifications des favoris';

  @override
  String get favoritesUnmute => 'Réactiver les notifications des favoris';

  @override
  String get favoritesHeaderMenu => 'Menu des favoris';

  @override
  String get favoritesCreateCategory => 'Créer une catégorie';

  @override
  String get favoritesCategoryNameLabel => 'Nom de la catégorie';

  @override
  String get favoritesHideMutedChannels => 'Masquer les salons mis en sourdine';

  @override
  String get favoritesShowMutedChannels =>
      'Afficher les salons mis en sourdine';

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
  String get favoritesRemoveFromFavorites => 'Retirer des favoris';

  @override
  String get favoritesAddToFavorites => 'Ajouter aux favoris';

  @override
  String get favoritesAddToSavedMedia => 'Ajouter aux médias enregistrés';

  @override
  String get favoritesRemoveFromSavedMedia => 'Retirer des médias enregistrés';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Ajouter aux GIF favoris (URL uniquement)';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Supprimer des favoris GIF enregistrés par URL';

  @override
  String get savedMediaAddTitle => 'Ajouter aux médias enregistrés';

  @override
  String get savedMediaFormNameLabel => 'Nom';

  @override
  String get savedMediaFormNameHint => 'Mon super média';

  @override
  String get savedMediaFormAltTextLabel => 'Texte alternatif';

  @override
  String get savedMediaFormAltTextHint => 'Décrire le média';

  @override
  String get savedMediaFormTagsLabel => 'Tags';

  @override
  String get savedMediaFormTagsHint => 'drôle, réaction, travail';

  @override
  String get savedMediaSaveError =>
      'Impossible de mettre à jour les médias enregistrés.';

  @override
  String get savedMediaNameRequired => 'Le nom est obligatoire.';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'Comment devons-nous enregistrer vos GIFs préférés ?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'Vous pouvez enregistrer les GIFs favoris sous forme de liens uniquement ou les télécharger dans vos médias enregistrés. Choisissez l\'option qui correspond à votre utilisation. Vous pourrez la modifier à tout moment dans Paramètres > Avancé > Médias.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'Favoris uniquement par URL (par défaut) : synchronisés sur tous vos appareils, sans téléchargement, ne comptent pas dans le stockage des médias. Le média d\'origine peut disparaître si son hôte le supprime.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Média enregistré : téléversé, avec tags, consultable et permanent, mais décompte de votre limite de médias enregistrés.';

  @override
  String get gifFavoriteFirstTimeHint =>
      'Nous ne demanderons qu\'une seule fois.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly =>
      'Utiliser uniquement l\'URL (recommandé)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia =>
      'Utiliser les médias enregistrés';

  @override
  String get favoritesHideConfirmTitle => 'Masquer les favoris';

  @override
  String get favoritesHideConfirmDescription =>
      'Cela masquera tous les éléments de l\'interface utilisateur liés aux favoris, y compris les boutons et les éléments de menu. Vos favoris existants seront conservés et pourront être réactivés à tout moment dans Paramètres > Avancé > Apparence.';

  @override
  String get favoritesDirectMessageSubtitle => 'Message privé';

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
      'Masquer les salons mis en sourdine par défaut';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Masquez automatiquement les chaînes masquées dans la barre latérale lorsque vous rejoignez de nouvelles communautés';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Masquer les salons mis en sourdine par défaut ?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Les salons mis en sourdine seront automatiquement masqués dans les nouvelles communautés que vous rejoindrez. Voulez-vous aussi appliquer ce réglage à toutes vos communautés actuelles ?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Arrêter de masquer les salons mis en sourdine par défaut ?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Les salons mis en sourdine des nouvelles communautés que vous rejoindrez ne seront plus masqués automatiquement. Souhaitez-vous également afficher les salons mis en sourdine dans toutes vos communautés existantes ?';

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
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'Lorsqu\'il est importé directement dans $productName';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Aperçus des liens';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Contrôlez la façon dont les liens de sites Web sont prévisualisés dans le chat';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Afficher les aperçus des liens et les contenus intégrés';

  @override
  String get messagesMediaReactionsSectionTitle => 'Réactions';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Configurer les réactions emoji aux messages';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Afficher les réactions emoji sur les messages';

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
      'Afficher le contenu masqué au clic';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'Dans les salons que je modère';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Toujours afficher le contenu masqué dans les salons où vous avez la permission « Gérer les messages »';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Toujours';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Toujours afficher les spoilers';

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
      'Envoyer automatiquement les GIF sélectionnés';

  @override
  String get messagesMediaCameraUploadsSectionTitle =>
      'Téléchargements de la caméra';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Choisissez si les photos et vidéos prises avec l\'appareil photo intégré sont conservées sur votre appareil';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel =>
      'Enregistrer sur l’appareil';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Complétion automatique d\'expressions (complétion par deux-points)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Contrôler ce qui apparaît dans la complétion automatique d\'expressions lorsque vous tapez deux-points. Personnalisez les suggestions qui s\'affichent pour correspondre à vos préférences.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Afficher les emojis par défaut dans la saisie semi-automatique des expressions';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Afficher les emojis personnalisés dans la saisie semi-automatique des expressions';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Afficher les stickers dans la saisie semi-automatique des expressions';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Afficher les médias enregistrés dans la saisie semi-automatique des expressions';

  @override
  String get accessibilitySaturationTitle => 'Saturation';

  @override
  String get accessibilityVisualGroupTitle => 'Affichage';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'Toujours souligner les liens';

  @override
  String get accessibilityShowAltTextOnImagesLabel =>
      'Afficher le texte alternatif des images';

  @override
  String get accessibilityShowAltTextOnImagesDescription =>
      'Afficher le texte alternatif sous les images lorsqu\'il est disponible.';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Atténuer le texte barré';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'Aperçus des messages privés';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Mode d\'aperçu des messages privés';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Tous les messages';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Afficher les aperçus des messages pour toutes les conversations privées';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'MP non lus uniquement';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Afficher les aperçus de message uniquement pour les MP non lus';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Aucun';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Ne pas afficher les aperçus de messages dans la liste des MP';

  @override
  String get accessibilityScreenReaderGroupTitle => 'Lecteur d\'écran';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Contrôlez le fonctionnement de $productName avec les lecteurs d\'écran.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Annoncer les nouveaux messages';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Les lecteurs d\'écran annoncent les nouveaux messages dès leur arrivée dans le salon ouvert. Les sons de notification ne sont pas affectés.';

  @override
  String get accessibilityTtsGroupTitle => 'Synthèse vocale';

  @override
  String get accessibilityTtsGroupDescription =>
      'Choisissez la vitesse de lecture à voix haute.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Vitesse de lecture vocale';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Écouter l\'exemple';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Échantillon de silence';

  @override
  String get accessibilityPreviewButtonLabel => 'Bouton d\'aperçu';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'Voici comment les liens s\'affichent : $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Aperçu de l\'utilisateur';

  @override
  String get accessibilityKeyboardGroupTitle => 'Clavier';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Afficher l\'anneau de focus sur la zone de texte du chat';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'La touche Échap quitte le mode clavier';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Afficher les raccourcis du menu contextuel';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Confirmer avant de lancer des appels';

  @override
  String get accessibilityAnimationGroupTitle => 'Animation';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'La réduction des animations est activée, les animations de contenu sont donc mises en pause par défaut. Vous pouvez toujours les réactiver pour les relancer.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel => 'Lire les emojis animés';

  @override
  String get accessibilityAutoPlayGifsMobileLabel =>
      'Lire les GIF automatiquement';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'Lire automatiquement les GIF quand $productName est au premier plan';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Lecture malgré la réduction des animations.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Lecture mise en pause par la réduction des animations. Activez cette option pour continuer à lire les emojis animés.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Lecture mise en pause par la réduction des animations. Activez cette option pour continuer à lire les GIF.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Animations des stickers';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Préférence d\'animation des stickers';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Toujours animer';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Les stickers seront toujours animés';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Animer lors de l\'interaction';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Les stickers s\'animeront quand vous appuierez dessus';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Les stickers s\'animeront lorsque vous les survolerez ou interagirez avec eux';

  @override
  String get accessibilityStickerNeverAnimateName => 'Ne jamais animer';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Les stickers ne seront jamais animés';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Toujours animé malgré la réduction des animations.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'Le mouvement réduit limite l\'animation des autocollants à l\'interaction. Choisissez « Toujours animer » pour annuler cette option.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'Par défaut, les animations se déclenchent lors d\'une interaction sur mobile afin de préserver la batterie.';

  @override
  String get accessibilityMotionGroupTitle => 'Mouvement';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Synchroniser la réduction des animations avec le système';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Utilisez la préférence de réduction des animations du système de cet appareil ou personnalisez-la ci-dessous.';

  @override
  String get accessibilityReducedMotionOverrideLabel =>
      'Réduire les animations';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Désactiver les animations et les transitions. Actuellement contrôlé par les réglages de votre système.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Désactiver les animations et les transitions dans toute l\'application.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Vous pouvez contrôler les emojis, GIF et stickers animés dans l’onglet Animation.';

  @override
  String get accessibilityConfirmStartCallTitle => 'Démarrer l\'appel ?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Voulez-vous vraiment démarrer cet appel ?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Démarrer l\'appel';

  @override
  String get accessibilityTtsSampleDescription =>
      'Écoutez l\'exemple de phrase prononcé à la vitesse choisie.';

  @override
  String get accessibilityTtsSampleText =>
      'Doc, je viens du futur. Je suis venu ici dans une machine à voyager dans le temps que vous avez inventée. Maintenant, j\'ai besoin de votre aide pour retourner en 1985.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'La synthèse vocale n’est pas disponible sur cet appareil.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Échec de la lecture vocale. Réessayez ou vérifiez que la sortie audio fonctionne.';

  @override
  String get ttsSubstitutionUnknownUser => 'utilisateur inconnu';

  @override
  String get ttsSubstitutionUnknownRole => 'rôle inconnu';

  @override
  String get ttsSubstitutionUnknownChannel => 'salon inconnu';

  @override
  String get ttsSubstitutionCodeBlock => 'bloc de code';

  @override
  String get ttsSubstitutionSpoiler => 'spoiler';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'emoji $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return '/ $commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName a dit : $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'En réponse à $replyAuthorName, $authorName a dit : $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'a envoyé un sticker';

  @override
  String get ttsSentAttachment => 'a envoyé une pièce jointe';

  @override
  String ttsSentAttachments(int count) {
    return 'envoyé $count pièces jointes';
  }

  @override
  String get ttsSentEmbed => 'a envoyé un aperçu';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author a envoyé $summary';
  }

  @override
  String get dmListSentAnAttachment => 'A envoyé une pièce jointe';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username a épinglé un message dans ce salon.';
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
    return '$username a changé le nom du salon en $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username a modifié le nom du salon.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username a changé l\'icône du salon.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username a démarré un appel.';
  }

  @override
  String get systemCallJoinTheCall => 'Rejoindre l\'appel';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username a lancé un appel qui a duré $duration.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'Vous avez manqué un appel de $username qui a duré $duration.';
  }

  @override
  String systemCallMissed(String username) {
    return 'Vous avez manqué un appel de $username.';
  }

  @override
  String get systemCallDurationFewSeconds => 'quelques secondes';

  @override
  String get systemCallDurationMinute => 'une minute';

  @override
  String get systemCallDurationOneYear => '1 an';

  @override
  String get systemCallDurationOneMonth => '1 mois';

  @override
  String get systemCallDurationOneWeek => '1 semaine';

  @override
  String get systemCallDurationOneDay => '1 jour';

  @override
  String get systemCallDurationOneHour => '1 heure';

  @override
  String systemCallDurationYears(int count) {
    return '$count ans';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count mois';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count semaines';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count jours';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count heures';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count minutes';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Mettez à jour $productName pour afficher ce message.';
  }

  @override
  String get voiceConnectionConfirmTitle =>
      'Confirmation de la connexion vocale';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Vous êtes déjà connecté à ce salon vocal depuis $count autres appareils. Que souhaitez-vous faire ?',
      one:
          'Vous êtes déjà connecté à ce salon vocal depuis 1 autre appareil. Que souhaitez-vous faire ?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Passer à cet appareil';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Rejoindre (garder les autres connexions)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Ne rien faire, je ne veux pas rejoindre';

  @override
  String get voiceJoinFailedTitle => 'Impossible de rejoindre la voix';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Impossible de déconnecter vos autres appareils. Réessayez dans un instant.';

  @override
  String get voiceChannelJoin => 'Rejoindre le salon vocal';

  @override
  String get voiceCallJoin => 'Rejoindre l\'appel';

  @override
  String get voiceChannelJoinConnect => 'Se connecter à un salon vocal';

  @override
  String get voiceChannelNoConnectPermission =>
      'Vous n\'avez pas l\'autorisation de rejoindre ce salon vocal';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Le son du microphone, la vidéo de la caméra et le contenu du partage d’écran sont chiffrés de bout en bout.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Le son du microphone, la vidéo de la caméra et le contenu du partage d’écran sont chiffrés de bout en bout.';

  @override
  String get voiceChannelE2eeBroken =>
      'Le chiffrement de bout en bout n’est pas disponible, car un participant utilise un client incompatible dans ce salon vocal.';

  @override
  String get voiceCallE2eeBroken =>
      'Le chiffrement de bout en bout n’est pas disponible, car un participant utilise un client incompatible dans cet appel.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Ce client doit être mis à jour avant de rejoindre cet appel chiffré.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Impossible de démarrer votre microphone. Vous êtes toujours dans l\'appel.';

  @override
  String get voiceChannelStatusConnecting => 'Connexion…';

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
  String get voiceParticipantTooltipDeafened => 'Son désactivé';

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
  String get voiceControlDeafen => 'Désactiver le son';

  @override
  String get voiceControlUndeafen => 'Réactiver le son';

  @override
  String get voiceControlVideo => 'Vidéo';

  @override
  String get voiceControlFlipCamera => 'Retourner la caméra';

  @override
  String get voiceControlScreenShare => 'Partage d\'écran';

  @override
  String get voiceScreenShareNotificationText => 'Partage de votre écran.';

  @override
  String get voiceControlDisconnect => 'Déconnecter';

  @override
  String get voiceInChat => 'En chat vocal';

  @override
  String get voiceConnectionFailed => 'Échec de la connexion';

  @override
  String get voiceConnectionRetry => 'Réessayer';

  @override
  String get voiceConnectionDismiss => 'Ignorer';

  @override
  String get voiceConnectionDisconnected => 'Déconnecté';

  @override
  String voicePingMs(int currentLatency) {
    return 'Ping : $currentLatency ms';
  }

  @override
  String get voiceMeasuringLatency => 'Mesure de la latence...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Aller à $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'Connexion vocale';

  @override
  String get voiceConnectionAdvancedStats => 'Avancé';

  @override
  String get voiceShowCallAvatars => 'Afficher les avatars d\'appel';

  @override
  String get voiceShowConnectionId => 'Afficher l\'ID de connexion';

  @override
  String get voiceAudioProcessing => 'Traitement audio';

  @override
  String get voiceConnectionSessionSection => 'Session';

  @override
  String get voiceConnectionDurationLabel => 'Durée';

  @override
  String get voiceConnectionParticipantsLabel => 'Participants';

  @override
  String get voiceConnectionNetworkSection => 'Réseau';

  @override
  String get voiceConnectionPingLabel => 'Ping';

  @override
  String get voiceConnectionJitterLabel => 'Gigue';

  @override
  String get voiceConnectionSendLabel => 'Envoyer';

  @override
  String get voiceConnectionReceiveLabel => 'Recevoir';

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
    return '$bandwidth kbit/s';
  }

  @override
  String get userAreaMuteMicrophone => 'Couper le micro';

  @override
  String get userAreaUnmuteMicrophone => 'Réactiver le micro';

  @override
  String get userAreaUserSettings => 'Paramètres utilisateur';

  @override
  String get voiceParticipantMenuViewProfile => 'Voir le profil';

  @override
  String get voiceParticipantMenuFocus => 'Mettre en avant cette personne';

  @override
  String get voiceParticipantMenuUnfocus => 'Désélectionner';

  @override
  String get voiceParticipantMenuCommunityMute => 'Couper le micro du membre';

  @override
  String get voiceParticipantMenuCommunityDeafen =>
      'Désactiver le son du membre';

  @override
  String get voiceParticipantMenuUserVolume => 'Volume de l\'utilisateur';

  @override
  String get voiceParticipantMenuStreamVolume => 'Volume de la diffusion';

  @override
  String get voiceParticipantMenuStopStreaming => 'Arrêter le partage';

  @override
  String get voiceParticipantModerationFailed =>
      'Impossible de mettre à jour ce membre. Veuillez réessayer.';

  @override
  String get voiceControlChat => 'Discussion';

  @override
  String get voiceCallViewModeLabel => 'Afficher';

  @override
  String get voiceCallViewModeGrid => 'Grille';

  @override
  String get voiceCallViewModeFocus => 'Focus';

  @override
  String get voicePanelSettingsSectionTitle => 'Paramètres vocaux';

  @override
  String get voicePanelUseEarpieceLabel => 'Utiliser le récepteur';

  @override
  String get voiceOutputRouteSpeaker => 'Haut-parleur';

  @override
  String get voiceOutputRouteEarpiece => 'Récepteur';

  @override
  String get voiceOutputRouteHeadset => 'Écouteurs';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Afficher uniquement les vidéos';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Afficher uniquement les participants qui ont leur caméra activée.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Afficher ma propre caméra';

  @override
  String get voicePrioritizeSpeakersLabel => 'Prioriser les intervenants';

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
  String get voiceWatchStream => 'Regarder la diffusion';

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
  String get voiceLiveBadge => 'En direct';

  @override
  String get dmVoiceViewCall => 'Voir l\'appel';

  @override
  String get dmVoiceCallFullScreen => 'Plein écran';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Ouvrir l\'appel en plein écran';

  @override
  String get dmVoiceStripStatusConnecting => 'Connexion…';

  @override
  String get dmVoiceStripStatusInCall => 'En appel';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Appel vocal';

  @override
  String get dmVoiceCallBarConnecting => 'Connexion…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Appel direct';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Appel de groupe';

  @override
  String get dmVoiceCallBarIssueFallback => 'Problème vocal';

  @override
  String get dmVoiceFullscreenTitle => 'Vocal';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Voix connectée';

  @override
  String get notificationsPageTitle => 'Notifications';

  @override
  String get notificationsFilterUnreads => 'Non lus';

  @override
  String get notificationsFilterMentions => 'Mentions';

  @override
  String get notificationsBookmarksTooltip => 'Messages enregistrés';

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
      'Inclure toutes les mentions de la communauté';

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
  String get notificationsMentionsEndTitle => 'Vous avez atteint la fin';

  @override
  String get notificationsMentionsEndBody =>
      'Vous avez vu toutes vos mentions récentes. Ne vous inquiétez pas, d\'autres apparaîtront bientôt ici.';

  @override
  String get notificationsJump => 'Aller à';

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
  String get characterCounterTooLong => 'Message trop long';

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
      'Votre message n’a pas pu être envoyé. Vous devez finaliser votre inscription pour envoyer des messages privés.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Votre message n’a pas pu être envoyé. Vous devez finaliser votre inscription pour envoyer des messages.';

  @override
  String get chatSendFailureContentBlocked =>
      'Votre message n\'a pas pu être envoyé, car il a été signalé par nos systèmes de sécurité. Si vous pensez qu\'il s\'agit d\'une erreur, veuillez contacter l\'assistance.';

  @override
  String get chatSendFailureContentBlockedSelfHosted =>
      'Votre message n\'a pas pu être envoyé, car il a été signalé par nos systèmes de sécurité. Si vous pensez qu\'il s\'agit d\'une erreur, veuillez contacter les administrateurs de cette instance.';

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
  String get privacyDashboardProfilePrivacySection =>
      'Confidentialité du profil';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Amis et messages privés';

  @override
  String get privacyDashboardActivitySharingSection => 'Partage d’activité';

  @override
  String get privacyDashboardSensitiveContentSection => 'Contenu sensible';

  @override
  String get privacyDashboardDataExportSection => 'Exportation des données';

  @override
  String get privacyDashboardDataDeletionSection => 'Suppression des données';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Qui peut voir votre profil complet';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Amis et toutes les communautés';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Votre profil complet est visible par vos amis et par tous les membres de vos communautés';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Amis et petites communautés uniquement';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Votre profil complet est visible par vos amis et les membres de vos communautés de 200 membres ou moins';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Amis seulement';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Votre profil complet n\'est visible que par vos amis';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Demandes d\'ami';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Tout le monde';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends => 'Amis d\'amis';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Membres de la communauté';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Messages privés';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Autoriser les messages privés des membres de la communauté';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Autoriser les messages privés des bots de la communauté';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Appels entrants';

  @override
  String get privacyDashboardAllowedCallers => 'Appelants autorisés';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Bloquer tous les appels entrants';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Autoriser uniquement les amis à vous appeler (recommandé)';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Autoriser les amis plus des groupes supplémentaires que vous choisissez';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Autoriser tout le monde à vous appeler, même des inconnus';

  @override
  String get privacyDashboardAdditionalGroups => 'Groupes supplémentaires';

  @override
  String get privacyDashboardRingBehavior => 'Comportement de la sonnerie';

  @override
  String get privacyDashboardSilentCalls =>
      'Appels silencieux de tout le monde';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Qui peut vous ajouter aux conversations de groupe';

  @override
  String get privacyDashboardAllowedInvites => 'Invitations autorisées';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Ne laissez personne vous ajouter à des discussions de groupe sans demander';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Autoriser uniquement les amis à vous ajouter sans demande (recommandé)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Autoriser les amis et d\'autres groupes à vous ajouter';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Autoriser n\'importe qui à vous ajouter à des discussions de groupe sans demander';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Activité vocale dans « Actif en ce moment »';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Partager votre activité vocale avec vos amis';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Partager l\'activité vocale avec tous les amis ?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Arrêter de partager l\'activité vocale avec tous les amis ?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Vous allez partager votre activité vocale avec tous vos amis actuels et futurs. Leur affichage sera mis à jour, et vous devrez attendre 24 heures avant de modifier à nouveau ce réglage.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Vous êtes sur le point d\'arrêter de partager votre activité vocale avec tous vos amis, y compris les futurs. Cela leur enverra une mise à jour et ne pourra être modifié à nouveau que dans 24 heures.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Oui, partager avec tous les amis';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm =>
      'Oui, arrêter le partage';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'De nouveau disponible dans $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Partage de l\'activité vocale mis à jour';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Impossible de mettre à jour le partage d\'activité vocale pour le moment';

  @override
  String get privacyDashboardDataExportDesc =>
      'Créez une archive téléchargeable de vos données de compte, y compris les messages et les URL de pièces jointes. La plupart des gens veulent tout, mais vous pouvez affiner la portée ci-dessous.';

  @override
  String get privacyDashboardExportMyData => 'Exporter mes données';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Supprimez définitivement vos messages dans les conversations privées, les conversations de groupe et les communautés. L’opération s’exécute en arrière-plan. Vous recevrez un message privé une fois qu’elle sera terminée.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Supprimer mes messages';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Autoriser les messages privés des membres de la communauté ?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Bloquer les messages privés des membres de la communauté ?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Autoriser les bots à vous envoyer des messages privés ?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Empêcher les bots de vous envoyer des messages privés ?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Voulez-vous aussi autoriser les messages privés des membres de vos communautés actuelles ?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Voulez-vous aussi bloquer les messages privés des membres de vos communautés actuelles ?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Voulez-vous aussi autoriser les bots de vos communautés actuelles à vous envoyer des messages privés ?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Voulez-vous aussi bloquer les bots de vos communautés existantes ?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'Vous pouvez également modifier ce réglage par communauté en appuyant longuement sur le nom de la communauté et en sélectionnant Paramètres de confidentialité.';

  @override
  String get privacyDashboardDmConfirmAllowAll =>
      'Autoriser pour toutes les communautés';

  @override
  String get privacyDashboardDmConfirmBlockAll =>
      'Bloquer pour toutes les communautés';

  @override
  String get privacyDashboardDmConfirmSkip => 'Passer cette étape';

  @override
  String get privacyDashboardDataRequestGoBack => 'Retour';

  @override
  String get privacyDashboardDataRequestExportTitle => 'Exporter mes données';

  @override
  String get privacyDashboardDataRequestDeleteTitle => 'Supprimer mes messages';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'Nous traiterons cette demande dès que possible. Vous recevrez un e-mail lorsque votre archive sera prête.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'Nous traiterons cela dès que possible. Vous recevrez un message privé de notre part une fois l’opération terminée.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'Éléments à inclure';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Tout';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Exporte tous les messages que vous avez envoyés, ainsi que tous les paramètres de votre compte, vos adhésions et vos métadonnées.';

  @override
  String get privacyDashboardDataRequestExportCustom =>
      'Sélection personnalisée';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Choisissez les types de conversations, les communautés et la période à inclure dans l\'archive.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Choisir ce qu\'il faut inclure';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Choisissez les types de conversations à nettoyer.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Uniquement les endroits auxquels je n\'ai plus accès';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Supprimer uniquement les messages des communautés et des MP de groupe que vous avez quittés ou dont vous avez été retiré.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Quelles conversations';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Sélectionnez les types de conversations à inclure.';

  @override
  String get privacyDashboardDataRequestKindDms => 'MP ouverts';

  @override
  String get privacyDashboardDataRequestKindDmsClosed => 'MP fermés';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'MP de groupe';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Communautés';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle =>
      'Quelles communautés';

  @override
  String get privacyDashboardDataRequestGuildFilterMode =>
      'Filtrer les communautés';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Inclure tout sauf la sélection';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude =>
      'Seulement ceux sélectionnés';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'Vous ne faites partie d\'aucune communauté pour le moment.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Période';

  @override
  String get privacyDashboardDataRequestDateMode => 'Période';

  @override
  String get privacyDashboardDataRequestAllTime => 'Toute la période';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Plage personnalisée';

  @override
  String get privacyDashboardDataRequestStartDate => 'Date de début';

  @override
  String get privacyDashboardDataRequestEndDate => 'Date de fin';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Laissez l\'un des champs vide pour laisser cette extrémité de la période illimitée.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Sélectionnez au moins un type de conversation à inclure.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'La date de début doit être antérieure à la date de fin.';

  @override
  String get privacyDashboardDataRequestConfirmTitle => 'Vérifier et confirmer';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'Nous allons créer une archive téléchargeable de tous les messages que vous avez envoyés et vous enverrons un e-mail lorsqu\'elle sera prête. Le lien de téléchargement dans cet e-mail expirera après 7 jours.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'Nous allons créer une archive téléchargeable correspondant aux filtres ci-dessous et vous enverrons un e-mail lorsqu\'elle sera prête. Le lien de téléchargement dans cet e-mail expirera après 7 jours.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Supprimer définitivement les messages qui correspondent aux filtres ci-dessous. Cette action est irréversible.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'Une fois lancée, cette action est irréversible. Nous vous enverrons un message privé une fois terminée.';

  @override
  String get privacyDashboardDataRequestRequestExport =>
      'Demander l\'exportation';

  @override
  String get privacyDashboardDataRequestDeleteMessages =>
      'Supprimer les messages';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Portée';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'Conversations';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Communautés';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Période';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'Aucun';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'À partir du $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'Jusqu\'au $end';
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
      other: '# communautés',
      one: '# communauté',
    );
    return 'Toutes sauf $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# communautés',
      one: '# communauté',
    );
    return 'Seulement $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Messages privés ouverts';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Conversations privées fermées';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Messages privés (ouverts et fermés)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'MP de groupe';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Communautés';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# heures',
      one: '# heure',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minutes',
      one: '# minute',
    );
    return '$_temp0 et $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# heures',
      one: '# heure',
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
      other: '# secondes',
      one: '# seconde',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed =>
      'Impossible de charger les paramètres de confidentialité';

  @override
  String get privacyDashboardRetry => 'Réessayer';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Impossible de sauvegarder les paramètres du contenu sensible.';

  @override
  String get privacyDashboardDataRequestFailed =>
      'La demande n\'a pas pu être complétée.';

  @override
  String get chatMessageDeleteFailed => 'Échec de la suppression du message';

  @override
  String get chatMessageAddReaction => 'Ajouter une réaction';

  @override
  String get doubleTapReactionHint => 'Appuyez deux fois sur un message pour';

  @override
  String get doubleTapReactionEdit => 'Modifier';

  @override
  String get doubleTapReactionEditTitle => 'Modifier la valeur par défaut';

  @override
  String get doubleTapReactionEditSubtitle =>
      'Choisir l\'emoji du double appui';

  @override
  String get chatMessageEdit => 'Modifier le message';

  @override
  String get chatMessageReply => 'Répondre';

  @override
  String get notificationReplyPlaceholder => 'Message';

  @override
  String get notificationReplyFailed => 'Impossible d\'envoyer la réponse';

  @override
  String get chatMessageForward => 'Transférer';

  @override
  String get forwardMessageTitle => 'Transférer le message';

  @override
  String get forwardSearchHint => 'Rechercher des salons ou des MP';

  @override
  String get forwardDirectMessagesSection => 'Messages privés';

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
  String get forwardSendSlowmodeBlocked =>
      'En attente de l\'expiration du mode lent dans un ou plusieurs salons sélectionnés.';

  @override
  String get slowmodeRateLimitedTitle => 'Mode lent activé';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'Le mode lent est activé — attendez $duration avant d\'envoyer un autre message.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'Le téléchargement direct est désactivé pendant le mode lent.';

  @override
  String get shareMediaTitle => 'Partager sur';

  @override
  String get shareMediaMessageHint => 'Ajouter un message facultatif…';

  @override
  String get shareMediaSendButton => 'Envoyer';

  @override
  String get shareMediaSuccessToast => 'Média partagé';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'Partagé vers $count destinations';
  }

  @override
  String get shareMediaFailedToast => 'Échec du partage des médias';

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
  String get chatMessageCopyEmbedText => 'Copier le texte intégré';

  @override
  String get chatMessageTranslate => 'Traduire';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Traduit depuis $language';
  }

  @override
  String get chatMessageSeeOriginal => 'Voir l\'original';

  @override
  String get chatMessageSeeTranslation => 'Voir la traduction';

  @override
  String get chatMessageTranslating => 'Traduction en cours…';

  @override
  String get chatMessageTranslateFailed => 'Impossible de traduire ce message.';

  @override
  String get chatMessageTranslateUnavailable =>
      'La traduction n\'est pas disponible sur cet appareil.';

  @override
  String get chatMessageSpeak => 'Lire le message à voix haute';

  @override
  String get chatMessageStopSpeaking => 'Arrêter la lecture vocale';

  @override
  String get chatMessagePin => 'Épingler le message';

  @override
  String get chatMessageUnpin => 'Désépingler le message';

  @override
  String get chatMessageUnpinIt => 'Désépingler';

  @override
  String get chatMessageBookmark => 'Enregistrer le message';

  @override
  String get chatMessageRemoveBookmark => 'Retirer des messages enregistrés';

  @override
  String get chatMessageMarkAsUnread => 'Marquer comme non lu';

  @override
  String get chatMessageCopyMessageLink => 'Copier le lien du message';

  @override
  String get chatMessageOpenLink => 'Ouvrir le lien';

  @override
  String get chatMessageCopyLink => 'Copier le lien';

  @override
  String get chatMessageCopyMessageId => 'Copier l\'ID du message';

  @override
  String get chatMessageViewReactions => 'Voir les réactions';

  @override
  String get chatMessageRemoveAllReactions => 'Supprimer toutes les réactions';

  @override
  String get chatMessageDebug => 'Déboguer le message';

  @override
  String get chatMessageDebugSheetTitle => 'Déboguer le message';

  @override
  String get chatMessageDebugCopyJson => 'Copier le JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'JSON du message copié dans le presse-papiers';

  @override
  String get chatReactionsSheetTitle => 'Réactions';

  @override
  String get chatReactionsSheetEmpty => 'Personne n\'a encore réagi avec ça.';

  @override
  String get chatReactionAddFailed => 'Impossible d\'ajouter la réaction';

  @override
  String get chatReactionRemoveFailed => 'Impossible de supprimer la réaction';

  @override
  String get chatMessageReport => 'Signaler le message';

  @override
  String get reportFlowTitleMessage => 'Signaler le message';

  @override
  String get reportFlowTitleUserProfile => 'Signaler le profil';

  @override
  String get reportFlowSummaryTitle => 'Vérifier votre signalement';

  @override
  String get reportFlowSummarySubtitle =>
      'Vérifiez que tout est correct avant d\'envoyer.';

  @override
  String reportFlowDisclaimer(String guidelines) {
    return 'Ne signalez que ce que vous pensez sincèrement contraire aux règles. L\'utilisation abusive des signalements va à l\'encontre de nos $guidelines.';
  }

  @override
  String get reportFlowCommunityGuidelinesLink => 'règles de la communauté';

  @override
  String get reportFlowDisclaimerNoLink =>
      'Ne signalez que ce que vous pensez sincèrement contraire aux règles, et veuillez ne pas envoyer deux fois le même signalement.';

  @override
  String get reportFlowSelectedMessage => 'Message que vous signalez';

  @override
  String get reportFlowSelectedUser => 'Profil que vous signalez';

  @override
  String get reportFlowReportCategory => 'Vos réponses';

  @override
  String get reportFlowSubmit => 'Envoyer le signalement';

  @override
  String get reportFlowBack => 'Retour';

  @override
  String get reportFlowNext => 'Suivant';

  @override
  String get reportFlowDone => 'Terminé';

  @override
  String get reportFlowThankYouTitle => 'Signalement envoyé';

  @override
  String get reportFlowThankYouNoReportTitle => 'Merci d\'avoir signalé ceci';

  @override
  String reportFlowThankYouBody(String productName) {
    return 'L\'équipe de sécurité de $productName examinera votre signalement. Nous ne révélerons pas que cela vient de vous.';
  }

  @override
  String get reportFlowThankYouNoReportBody =>
      'Merci de nous en avoir informés. Cela n\'enfreint pas nos règles à lui seul, donc nous n\'avons pas envoyé de signalement. Si cela vise quelqu\'un ou contient des insultes, signalez-le à nouveau et choisissez « Contenu abusif ou nuisible ».';

  @override
  String get reportFlowThankYouNoReportBodyShort =>
      'Merci de nous en avoir informés. Cela n\'enfreint pas nos règles à lui seul, donc nous n\'avons pas envoyé de signalement.';

  @override
  String get reportFlowMoreYouCanDo => 'Vos options';

  @override
  String reportFlowBlockName(String name) {
    return 'Bloquer $name';
  }

  @override
  String get reportFlowBlockDescription =>
      'Masque ses messages et l\'empêche de vous envoyer des messages';

  @override
  String get reportFlowBlockButton => 'Bloquer';

  @override
  String get reportFlowBlockedButton => 'Bloqué';

  @override
  String get reportFlowUrgentBanner =>
      'Si quelqu\'un est en danger immédiat, contactez d\'abord les services d\'urgence locaux.';

  @override
  String get reportFlowLoadFailed =>
      'Impossible de charger le formulaire de signalement.';

  @override
  String get reportFlowTryAgain => 'Réessayer';

  @override
  String get reportFlowOutdated =>
      'Le formulaire de signalement a changé. Veuillez recommencer.';

  @override
  String get reportFlowAlreadyReported => 'Vous avez déjà signalé ce message.';

  @override
  String get reportFlowAlreadyReportedProfile =>
      'Vous avez déjà signalé ce profil aujourd\'hui.';

  @override
  String get reportFlowRateLimited =>
      'Vous envoyez des signalements trop rapidement. Réessayez plus tard.';

  @override
  String get reportFlowSubmitFailed =>
      'Votre signalement n\'a pas pu être envoyé. Réessayez.';

  @override
  String get reportFlowAccountSetupRequired =>
      'Finalisez votre inscription et vérifiez votre adresse e-mail pour envoyer des signalements.';

  @override
  String get chatMessageSuppressEmbeds => 'Masquer les contenus intégrés';

  @override
  String get chatMessageUnsuppressEmbeds => 'Réafficher les contenus intégrés';

  @override
  String get chatMessageDelete => 'Supprimer le message';

  @override
  String get chatMessageDeleteConfirmTitle => 'Supprimer le message';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Êtes-vous sûr de vouloir supprimer ce message ?';

  @override
  String get chatMessageDeleteAttachment => 'Supprimer la pièce jointe';

  @override
  String get chatMessageDeleteAttachmentConfirmDescription =>
      'Are you sure you want to delete this attachment?';

  @override
  String get chatMessageEditAttachmentAltText => 'Modifier le texte alternatif';

  @override
  String get chatMessageMore => 'Plus';

  @override
  String get chatEditingMessage => 'Modification du message';

  @override
  String get chatReplyOriginalDeleted => 'Le message original a été supprimé';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Échec du chargement du message d\'origine';

  @override
  String get chatReplyAttachedMedia =>
      'Le message contient des médias en pièce jointe';

  @override
  String chatBlockedMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count messages bloqués',
      one: '1 message bloqué',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count messages suspects de spam',
      one: '1 message suspect de spam',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Réponse masquée car l\'auteur original est bloqué.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Réponse masquée car l\'auteur original a été signalé comme spammeur.';

  @override
  String get devMarkAsSpamLocally => 'Marquer comme spam localement';

  @override
  String get devIgnoreSpamFlag => 'Ignorer le signalement de spam';

  @override
  String get chatMessagesLoadError => 'Impossible de charger les messages.';

  @override
  String get chatReplyMentionOverrideTitle =>
      'Remplacer la préférence de mention ?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname préfère être mentionné dans les réponses. Envoyer sans la mention quand même ?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname préfère les réponses sans @mention. Envoyer avec la mention quand même ?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ignorer la préférence';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Cliquez pour désactiver la notification de l\'utilisateur à qui vous répondez.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Cliquez pour activer la notification de l\'utilisateur à qui vous répondez.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Mentionner l\'utilisateur répondu';

  @override
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

  @override
  String get chatReplyCancel => 'Annuler la réponse';

  @override
  String get chatEditMessageHint => 'Modifier le message';

  @override
  String get chatEditNoChanges => 'Aucune modification à enregistrer';

  @override
  String get chatChannelNotReady =>
      'Ce salon n\'est pas encore prêt. Veuillez réessayer dans un moment.';

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
  String get mediaViewerOptions => 'Options des médias';

  @override
  String get mediaViewerCopyLink => 'Copier le lien';

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
  String mediaViewerAttachmentThumbnail(int index) {
    return 'Pièce jointe $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Ignorer';

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
  String get chatImageCouldNotLoad => 'Impossible de charger cette image.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Notifier les utilisateurs ayant ce rôle et autorisés à voir ce salon.';

  @override
  String get composerAutocompleteSuggestions => 'Suggestions';

  @override
  String get composerAutocompleteCommandsHeading => 'Commandes';

  @override
  String get composerAutocompleteChoicesHeading => 'Choix';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'Arguments facultatifs';

  @override
  String get composerAutocompleteMediaHeading => 'Médias';

  @override
  String get composerAutocompleteStickersHeading => 'Stickers';

  @override
  String get composerAutocompleteGifsHeading => 'GIF';

  @override
  String get composerAutocompleteNoGifs => 'Aucun GIF trouvé';

  @override
  String get composerCommandShrugDescription =>
      'Ajoute ¯\\_(ツ)_/¯ à votre message.';

  @override
  String get composerCommandTableflipDescription =>
      'Ajoute (╯°□°)╯︵ ┻━┻ à votre message.';

  @override
  String get composerCommandUnflipDescription =>
      'Ajoute ┬─┬ ノ( ゜-゜ノ) à votre message.';

  @override
  String get composerCommandMeDescription =>
      'Envoyer un message d\'action (s\'affiche en italique).';

  @override
  String get composerCommandSpoilerDescription =>
      'Envoyer un message spoiler (masqué par des balises spoiler).';

  @override
  String get composerCommandTtsDescription =>
      'Envoyer un message de synthèse vocale.';

  @override
  String get composerCommandNickDescription =>
      'Modifier votre surnom dans cette communauté.';

  @override
  String get composerCommandKickDescription =>
      'Expulser un membre de cette communauté.';

  @override
  String get composerCommandBanDescription =>
      'Bannir un membre de cette communauté.';

  @override
  String get composerCommandMsgDescription =>
      'Envoyer un message privé à un utilisateur.';

  @override
  String get composerCommandSavedDescription => 'Envoyer un média enregistré.';

  @override
  String get composerCommandStickerDescription => 'Envoyer un sticker.';

  @override
  String get composerCommandGifDescription => 'Rechercher et envoyer un GIF.';

  @override
  String get composerCommandMemberOption => 'Le membre à cibler.';

  @override
  String get composerCommandReasonOption => 'Raison (facultative).';

  @override
  String get composerCommandMessageOption => 'Le message à envoyer.';

  @override
  String get composerCommandQueryOption => 'Ce qu\'il faut rechercher.';

  @override
  String get composerCommandNicknameOption =>
      'Votre nouveau surnom, ou laissez vide pour le réinitialiser.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'Quantité d\'historique de messages récents du membre à supprimer.';

  @override
  String get composerCommandDeleteMessagesNone => 'Ne pas supprimer';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Les $count derniers jours';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => '24 dernières heures';

  @override
  String get composerCommandOptionRequired =>
      'Cette option est requise. Veuillez fournir une valeur.';

  @override
  String get composerCommandClear => 'Effacer la commande';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'Vous avez remplacé votre surnom **$previousNickname** par **$newNickname** dans cette communauté.';
  }

  @override
  String get composerCommandUnknownUser => 'Utilisateur inconnu';

  @override
  String composerCommandMsgFailed(String username) {
    return 'Impossible d\'envoyer un message à **$username**. Il/Elle a peut-être désactivé les MP ou vous a bloqué(e).';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count de plus';
  }

  @override
  String get addGuildModalTitle => 'Ajouter une communauté';

  @override
  String get addGuildModalLandingDescription =>
      'Créez une nouvelle communauté ou rejoignez-en une existante.';

  @override
  String get addGuildCreateCommunity => 'Créer une communauté';

  @override
  String get addGuildJoinCommunity => 'Rejoindre la communauté';

  @override
  String get addGuildImportDiscordTemplate => 'Importer un modèle Discord';

  @override
  String get addGuildJoinTitle => 'Rejoindre une communauté';

  @override
  String get addGuildJoinDescription =>
      'Saisissez le lien d\'invitation pour rejoindre une communauté.';

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
  String get addGuildCreateTitle => 'Créer une communauté';

  @override
  String get addGuildCreateDescription =>
      'Créez une communauté pour discuter avec vos amis.';

  @override
  String get addGuildCreateNameLabel => 'Nom de la communauté';

  @override
  String get addGuildCreateSubmit => 'Créer une communauté';

  @override
  String get addGuildCreateFailed =>
      'Impossible de créer la communauté. Veuillez réessayer.';

  @override
  String get addGuildCreateClaimTitle => 'Finalisez votre inscription';

  @override
  String get addGuildCreateClaimDescription =>
      'Vous devez finaliser votre inscription avant de pouvoir créer une communauté.';

  @override
  String get addGuildCreateVerifyTitle => 'Vérifiez votre e-mail';

  @override
  String get addGuildCreateVerifyDescription =>
      'Vous devez vérifier votre adresse e-mail avant de pouvoir créer une communauté.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Les icônes animées ne sont pas prises en charge lors de la création d’une nouvelle communauté. Utilisez une image statique.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'En créant une communauté, vous acceptez de suivre et de respecter les ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return 'Règles de la communauté $productName';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'Cette instance est une communauté unique, les communautés supplémentaires ne peuvent donc pas être créées.';

  @override
  String get addGuildCreateChangeIcon => 'Changer l\'icône';

  @override
  String get addGuildCreateIconLabel => 'Icône de la communauté';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. 10 Mo max. Recommandé : 512×512 px';

  @override
  String get addGuildImportDescription =>
      'Collez une URL de modèle Discord pour importer sa structure dans une nouvelle communauté.';

  @override
  String get addGuildImportUrlLabel => 'URL du modèle';

  @override
  String get addGuildImportUrlInvalid =>
      'Entrez une URL ou un code de modèle Discord valide.';

  @override
  String get addGuildImportFetchFailed =>
      'Impossible de récupérer le modèle de communauté. Le modèle peut ne pas exister ou le service externe est indisponible.';

  @override
  String get addGuildImportInvalidResponse =>
      'Cela ne ressemble pas à une réponse de modèle valide.';

  @override
  String get addGuildImportTemplateLabel => 'Modèle';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount textuels, $voiceChannelCount vocaux, $categoryCount catégories, $roleCount rôles';
  }

  @override
  String get addGuildImportRemoveIcon => 'Supprimer l\'icône';

  @override
  String get addGuildImportTemplateInvalid =>
      'Les données du modèle de communauté sont invalides ou malformées.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Supprimer toutes les réactions';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Êtes-vous sûr de vouloir supprimer toutes les réactions de ce message ?';

  @override
  String get chatMessagePinConfirm => 'Épingler';

  @override
  String get chatMessagePinConfirmDescription =>
      'Épingler ce message au salon pour que tout le monde puisse le voir.';

  @override
  String get chatMessageUnpinConfirmTitle => 'Désépingler le message';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Renvoyer cet élément épinglé dans le passé ?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username a épinglé $messageLink dans ce salon. Voir $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'un message';

  @override
  String get systemPinMessageAllPinsLink => 'tous les messages épinglés';

  @override
  String get channelPinsEmptyTitle => 'Aucun message épinglé';

  @override
  String get channelPinsEmptyDescription =>
      'Les messages épinglés s\'affichent ici.';

  @override
  String get channelDetailsFallbackTitle => 'Détails';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'Discussion de groupe · $count membres';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'Fermer votre conversation avec $name ?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'Quitter $name ?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Paramètres du salon';

  @override
  String get channelDetailsGroupSettingsTitle => 'Paramètres du groupe';

  @override
  String get channelDetailsDmSettingsTitle => 'Paramètres des messages privés';

  @override
  String get channelDetailsInvitePeople => 'Inviter des personnes';

  @override
  String get channelDetailsCopyLink => 'Copier le lien';

  @override
  String get channelMenuCopyChannelLink => 'Copier le lien du salon';

  @override
  String get channelMenuCopyRedirectLink => 'Copier le lien de redirection';

  @override
  String get channelDetailsAddFriendsToGroup => 'Ajouter des amis au groupe';

  @override
  String get channelDetailsGroupInvites => 'Invitations de groupe';

  @override
  String get channelDetailsEditChannel => 'Modifier le salon';

  @override
  String get channelDetailsDeleteChannel => 'Supprimer le salon';

  @override
  String get channelSettingsEditCategory => 'Modifier la catégorie';

  @override
  String get channelSettingsTabOverview => 'Vue d’ensemble';

  @override
  String get channelSettingsTabPermissions => 'Permissions';

  @override
  String get channelSettingsTabInvites => 'Invitations';

  @override
  String get channelSettingsTabWebhooks => 'Webhooks';

  @override
  String get channelSettingsDeleteChannel => 'Supprimer le salon';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'Êtes-vous sûr de vouloir supprimer $channelName ? Cette action est irréversible.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'Êtes-vous sûr de vouloir supprimer $categoryName ? Cette action est irréversible.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Supprimer la catégorie';

  @override
  String get channelSettingsChannelUpdated => 'Salon mis à jour';

  @override
  String get channelSettingsChannelName => 'Nom du salon';

  @override
  String get channelSettingsCategoryName => 'Nom de la catégorie';

  @override
  String get channelSettingsMyCategory => 'Ma catégorie';

  @override
  String get categoryExpandCategory => 'Développer la catégorie';

  @override
  String get categoryCollapseCategory => 'Réduire la catégorie';

  @override
  String get categoryExpandAllCategories => 'Développer toutes les catégories';

  @override
  String get categoryCollapseAllCategories => 'Réduire toutes les catégories';

  @override
  String get categoryMuteCategory =>
      'Désactiver les notifications de la catégorie';

  @override
  String get categoryUnmuteCategory =>
      'Réactiver les notifications de la catégorie';

  @override
  String get categoryCopyCategoryId => 'Copier l\'ID de la catégorie';

  @override
  String get categoryIdCopied => 'ID de catégorie copié';

  @override
  String get channelSettingsChannelNamePlaceholder => 'Général';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'Sujet';

  @override
  String get channelSettingsTopicPlaceholder => 'Ajouter un sujet à ce salon';

  @override
  String get channelSettingsInsertEmoji => 'Insérer un emoji';

  @override
  String get channelSettingsTopicTooLongTitle =>
      'Le sujet du salon est trop long.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'Raccourcissez le sujet et réessayez.';

  @override
  String get channelSettingsSlowmode => 'Mode lent';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Attendre entre les messages. « $bypassSlowmodePermissionLabel » peut contourner cette limite.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Désactivé';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds secondes';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes minutes';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours heures';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute minute';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour heure';
  }

  @override
  String get channelSettingsVoiceQuality => 'Qualité vocale';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'Un débit binaire plus élevé = meilleure qualité et utilisation plus importante de la bande passante.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbps';
  }

  @override
  String get channelSettingsParticipantLimit => 'Limite de participants';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Nombre maximum de membres pouvant rejoindre en même temps. 0 signifie illimité.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count participants',
      one: '1 participant',
      zero: '∞ Aucune limite',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Limite de connexions';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Nombre maximal de connexions actives qu\'un membre peut maintenir dans ce salon.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count connexions',
      one: '1 connexion',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Région vocale';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Sélectionnez une région vocale pour ce canal. Automatique utilise la région la plus proche.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Automatique';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'Impossible de charger les régions vocales';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Réessayez dans un instant.';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Ignorer le réglage de niveau $scopeLevel pour ce canal. Le contenu pour adultes est affiché derrière un filtre avant l\'entrée.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Hériter';

  @override
  String get channelSettingsMatureContentOn => 'Activé';

  @override
  String get channelSettingsMatureContentOff => 'Désactivé';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Marquer cette chaîne pour du contenu pour adultes.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Laisser ce canal sans restriction pour le contenu pour adultes.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Hérité de $inheritedSourceLabel : activé';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Hérité de $inheritedSourceLabel : désactivé';
  }

  @override
  String get channelSettingsMatureContentCategoryScope => 'Catégorie';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Communauté';

  @override
  String get channelSettingsContentWarningToggle =>
      'Afficher un avertissement de contenu dans ce salon';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Active une invite de consentement avant d\'entrer dans ce canal.';

  @override
  String get channelSettingsContentWarningText =>
      'Texte d\'avertissement personnalisé';

  @override
  String get channelSettingsContentWarningDefault => 'Ce contenu est sensible.';

  @override
  String get channelSettingsUnknownRole => 'Rôle inconnu';

  @override
  String get channelSettingsUnknownUser => 'Utilisateur inconnu';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides =>
      'Permissions spécifiques';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Modifier l\'accès pour $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'Retour aux permissions spécifiques';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Configurer l\'accès de base pour ce salon';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Configurer les permissions spécifiques à ce rôle';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Configurer les permissions spécifiques à ce membre';

  @override
  String get channelSettingsPermissionsSearchPlaceholder =>
      'Rechercher des permissions…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Accès au salon mis à jour';

  @override
  String get channelSettingsPermissionsTitle => 'Contrôle d\'accès';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'Ce salon est synchronisé avec la catégorie parente ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'Ce salon n\'est pas synchronisé avec la catégorie parente ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory =>
      'Synchroniser avec la catégorie';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'Salon synchronisé avec la catégorie parente';

  @override
  String get channelSettingsPermissionsAddOverride =>
      'Ajouter des permissions spécifiques';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Rechercher des rôles ou des membres…';

  @override
  String get channelSettingsDeleteInvite => 'Supprimer l\'invitation';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Supprimer cette invitation ? Cette action est irréversible.';

  @override
  String get channelSettingsCopyInviteCode => 'Copier le code d\'invitation';

  @override
  String get channelSettingsCopyInviteUrl => 'Copier le lien d\'invitation';

  @override
  String get channelSettingsWebhookCreated => 'Webhook créé';

  @override
  String get channelSettingsWebhookCreateFailed =>
      'Échec de la création du webhook';

  @override
  String get channelSettingsCreateWebhook => 'Créer un webhook';

  @override
  String get channelSettingsInvitesDescription =>
      'Gérez les liens d’invitation pour ce salon.';

  @override
  String get channelSettingsInvitesCreate => 'Créer une invitation';

  @override
  String get channelSettingsInvitesEmpty => 'Aucun lien d\'invitation';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'Ce salon n’a pas encore de liens d’invitation. Créez-en un pour inviter des personnes à le rejoindre.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Une erreur est survenue lors du chargement des liens d\'invitation pour ce salon. Veuillez réessayer.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Gérez les webhooks entrants qui peuvent publier des messages dans ce salon.';

  @override
  String get channelSettingsWebhooksEmpty => 'Aucun webhook';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'Aucun webhook n\'est configuré pour ce salon. Créez un webhook pour permettre aux applications externes de publier des messages.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Ce salon ne prend pas en charge les webhooks.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'Vous avez besoin de la permission « $permission » pour afficher et modifier les webhooks de ce canal.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'Échec du chargement des webhooks';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Une erreur est survenue lors du chargement des webhooks pour ce salon. Veuillez réessayer.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Créé par $creator le $date';
  }

  @override
  String get channelSettingsWebhooksAvatar => 'Avatar';

  @override
  String get channelSettingsWebhooksUploadImage => 'Importer une image';

  @override
  String get channelSettingsWebhooksRemove => 'Supprimer';

  @override
  String get channelSettingsWebhooksName => 'Nom';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Nom du webhook';

  @override
  String get channelSettingsWebhooksChannel => 'Salon';

  @override
  String get channelSettingsWebhooksUrl => 'URL du webhook';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Copier l\'URL du webhook';

  @override
  String get channelSettingsWebhooksDelete => 'Supprimer le webhook';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'Impossible de supprimer ce webhook';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'Supprimer ce webhook ? Cette action est irréversible.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Réessayez dans un instant.';

  @override
  String get channelMenuOpenChat => 'Ouvrir le chat';

  @override
  String get channelMenuDuplicateChannel => 'Dupliquer le salon';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Réinitialiser l’acceptation des contenus pour adultes';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Supprimer vos messages dans ce salon ?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Tous les messages que vous avez envoyés dans ce salon seront définitivement supprimés. Cette action est irréversible.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Supprimer mes messages';

  @override
  String get channelMenuDeletedYourMessages => 'Vos messages ont été supprimés';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'Impossible de supprimer vos messages';

  @override
  String get channelDetailsSystemMessage => 'Message système';

  @override
  String get channelDetailsTextChannel => 'Salon textuel';

  @override
  String get channelDetailsVoiceChannel => 'Salon vocal';

  @override
  String get channelDetailsCategory => 'Catégorie';

  @override
  String get channelDetailsLinkChannel => 'Lier un salon';

  @override
  String get channelDetailsGenericChannel => 'Salon';

  @override
  String get channelDetailsMutedConversation => 'Conversation désactivée';

  @override
  String get channelDetailsUnmutedConversation => 'Conversation non-muette';

  @override
  String get channelDetailsMutedChannel => 'Canal masqué';

  @override
  String get channelDetailsUnmutedChannel => 'Canal non silencié';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Paramètres de notification mis à jour';

  @override
  String get channelDetailsTabMembers => 'Membres';

  @override
  String get channelDetailsTabPins => 'Messages épinglés';

  @override
  String get channelDetailsActionMute => 'Désactiver';

  @override
  String get channelDetailsActionUnmute => 'Désactiver le mode silencieux';

  @override
  String get channelDetailsActionSearch => 'Rechercher';

  @override
  String get channelDetailsActionMore => 'Plus';

  @override
  String get channelDetailsMembersEmptyTitle => 'Aucun membre à afficher';

  @override
  String get channelDetailsMembersEmptyBody =>
      'Les membres apparaîtront ici une fois que les données de la communauté seront chargées.';

  @override
  String get memberListPermissionDeniedTitle =>
      'Vous ne pouvez pas voir les membres';

  @override
  String get memberListPermissionDeniedBody =>
      'Vous ne pouvez pas voir les membres de ce salon dans cette communauté';

  @override
  String get memberListUnavailableTitle => 'Liste des membres indisponible';

  @override
  String get memberListUnavailableBody =>
      'Les listes de membres sont temporairement indisponibles dans cette communauté';

  @override
  String get channelDetailsPinsLoadFailedTitle =>
      'Impossible de charger les épingles';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'Les membres ayant la permission « Épingler des messages » peuvent épingler des messages pour que tout le monde les voie.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'Vous pouvez épingler des messages dans cette conversation pour que tout le monde les voie.';

  @override
  String get channelDetailsPinsEndReached => 'Vous avez atteint la fin';

  @override
  String get channelHeaderPinnedMessages => 'Messages épinglés';

  @override
  String get channelHeaderPinnedMessagesUnread => 'Messages épinglés, non lus';

  @override
  String get channelHeaderMemberList => 'Liste des membres';

  @override
  String get channelHeaderInbox => 'Boîte de réception';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Paramètres des notifications, silencié';

  @override
  String get channelDetailsSearchTitle => 'Rechercher';

  @override
  String get channelDetailsSearchHint => 'Rechercher des messages';

  @override
  String get channelDetailsSearchFilterFrom => 'De';

  @override
  String get channelDetailsSearchFilterHas => 'Contient';

  @override
  String get channelDetailsSearchFilterIn => 'Dans';

  @override
  String get channelDetailsSearchFilterMentions => 'Mentions';

  @override
  String get channelDetailsSearchFilterMore => 'Plus';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Actif';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count canaux';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count utilisateurs';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'Utilisateur';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Bot';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => 'Filtrer par salon';

  @override
  String get channelDetailsSearchChannelsHint => 'Rechercher des salons';

  @override
  String get channelDetailsSearchChannelsEmpty => 'Aucun salon trouvé';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Épinglé';

  @override
  String get channelDetailsSearchPinnedTrue => 'Épinglé uniquement';

  @override
  String get channelDetailsSearchPinnedFalse => 'Exclure les épinglés';

  @override
  String get channelDetailsSearchClearFilter => 'Effacer';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Type d\'auteur';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Date';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Mode de date';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Choisir une date';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Lien vers le nom d\'hôte';

  @override
  String get channelDetailsSearchMoreFiltersFileName =>
      'Le nom du fichier contient';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'Extension de fichier';

  @override
  String get channelDetailsSearchContentPoll => 'Sondage';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'Messages avec un sondage';

  @override
  String get channelDetailsSearchContentForward => 'Transférer';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Messages transférés';

  @override
  String get channelDetailsSearchFilterSort => 'Trier';

  @override
  String get channelHeaderSearchFiltersTitle => 'Filtres de recherche';

  @override
  String get channelHeaderSearchRecentTitle => 'Recherches récentes';

  @override
  String get channelHeaderSearchUsersTitle => 'Utilisateurs';

  @override
  String get channelHeaderSearchChannelsTitle => 'Salons';

  @override
  String get channelHeaderSearchValuesTitle => 'Valeurs';

  @override
  String get channelHeaderSearchDatesTitle => 'Dates';

  @override
  String get channelHeaderSearchDefaultBadge => 'Par défaut';

  @override
  String get channelHeaderSearchClearHistory => 'Effacer';

  @override
  String get channelHeaderSearchFilterDescFrom => 'un utilisateur';

  @override
  String get channelHeaderSearchFilterDescMentions => 'un utilisateur';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'lien, aperçu, image, vidéo, son, fichier, autocollant, …';

  @override
  String get channelHeaderSearchFilterDescBefore =>
      'une date ou une plage de dates';

  @override
  String get channelHeaderSearchFilterDescOn =>
      'une date ou une plage de dates';

  @override
  String get channelHeaderSearchFilterDescDuring =>
      'une date ou une plage de dates';

  @override
  String get channelHeaderSearchFilterDescAfter =>
      'une date ou une plage de dates';

  @override
  String get channelHeaderSearchFilterDescIn => 'un salon';

  @override
  String get channelHeaderSearchFilterDescPinned => 'vrai ou faux';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'utilisateur, bot ou webhook';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'un nom d\'hôte, par ex. example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'partie d\'un nom de fichier de pièce jointe';

  @override
  String get channelHeaderSearchFilterDescFileType =>
      'une extension de fichier, par exemple png';

  @override
  String get channelHeaderSearchFilterDescSort => 'date ou pertinence';

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
      other: '$countString résultats',
      one: '1 résultat',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'Filtrer par utilisateur';

  @override
  String get channelDetailsSearchFilterByContent => 'Filtrer par contenu';

  @override
  String get channelDetailsSearchSortBy => 'Trier les résultats par';

  @override
  String get channelDetailsSearchIn => 'Rechercher dans';

  @override
  String get channelDetailsSearchEmptyTitle =>
      'Rechercher dans cette conversation';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Saisissez du texte, un auteur ou un filtre de contenu pour trouver des messages.';

  @override
  String get channelDetailsSearchIndexingTitle =>
      'Les messages sont en cours d\'indexation';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Réessayez peu après que la recherche ait fini d\'indexer cette portée.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Aucun résultat';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Essayez d\'autres termes ou filtres de recherche.';

  @override
  String get channelDetailsMembersOnline => 'En ligne';

  @override
  String get channelDetailsMembersOffline => 'Hors ligne';

  @override
  String get channelDetailsMemberYou => 'Vous';

  @override
  String get channelDetailsSearchUsersHint => 'Rechercher des utilisateurs';

  @override
  String get channelDetailsSearchUsersTypeToSearch =>
      'Tapez pour rechercher des membres';

  @override
  String get channelDetailsSearchUsersEmpty => 'Aucun utilisateur trouvé';

  @override
  String get channelDetailsSearchUsersNoAvailable =>
      'Aucun utilisateur disponible';

  @override
  String get channelDetailsDone => 'Terminé';

  @override
  String get channelDetailsHasFilterPrompt =>
      'Afficher les messages qui contiennent :';

  @override
  String get channelDetailsRetry => 'Réessayer';

  @override
  String get channelDetailsPinnedMessageTitle => 'Message épinglé';

  @override
  String get channelDetailsSearchResultTitle => 'Résultat de la recherche';

  @override
  String get channelDetailsJumpToMessage => 'Aller au message';

  @override
  String get channelDetailsUnpinMessage => 'Désépingler le message';

  @override
  String get channelDetailsCopyMessageLink => 'Copier le lien du message';

  @override
  String get channelDetailsCopyMessageId => 'Copier l\'ID du message';

  @override
  String get channelDetailsMessageUnpinned => 'Message désépinglé';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Communauté actuelle';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'MP actuel';

  @override
  String get channelDetailsSearchScopeAllCommunities =>
      'Toutes les communautés';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild =>
      'Tous les MP uniquement';

  @override
  String get channelDetailsSearchScopeAllDms => 'Tous les MP';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild =>
      'MP ouverts uniquement';

  @override
  String get channelDetailsSearchScopeOpenDms => 'MP ouverts';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Tous les MP et toutes les communautés';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Messages privés ouverts + communautés';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Rechercher uniquement dans la communauté actuelle';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Rechercher uniquement dans la conversation privée actuelle';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'Dans toutes les communautés où vous vous trouvez actuellement';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Uniquement dans les conversations privées auxquelles vous avez participé';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'Dans toutes les conversations privées auxquelles vous avez participé';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'Dans tous vos MP ouverts uniquement';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'Dans tous vos MP ouverts';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'Dans tous les MP que vous avez jamais eus + toutes les communautés auxquelles vous appartenez actuellement';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'Dans tous vos MP ouverts + toutes les communautés auxquelles vous appartenez';

  @override
  String get channelDetailsSearchSortNewest => 'Du plus récent au plus ancien';

  @override
  String get channelDetailsSearchSortOldest => 'Du plus ancien au plus récent';

  @override
  String get channelDetailsSearchSortRelevance => 'Les plus pertinents';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Afficher les messages les plus récents en premier';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Afficher les messages les plus anciens en premier';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Afficher les messages les plus pertinents en premier';

  @override
  String get channelDetailsSearchContentImage => 'Envoi d’image';

  @override
  String get channelDetailsSearchContentVideo => 'Envoi de vidéo';

  @override
  String get channelDetailsSearchContentAudio => 'Envoi de fichier audio';

  @override
  String get channelDetailsSearchContentFile => 'Envoi de fichier';

  @override
  String get channelDetailsSearchContentLink => 'Lien';

  @override
  String get channelDetailsSearchContentEmbed =>
      'Aperçu du lien ou contenu intégré';

  @override
  String get channelDetailsSearchContentSticker => 'Sticker';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Fichiers image importés uniquement';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Uniquement les fichiers vidéo importés';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Fichiers audio importés uniquement';

  @override
  String get channelDetailsSearchContentFileDescription =>
      'Toute pièce jointe envoyée';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'URL saisie dans le message';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Aperçus générés et contenus intégrés enrichis, hors fichiers envoyés';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Sticker joint au message';

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
    return 'Bienvenue sur $displayName. Ajoutez des amis pour lancer la conversation.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Modifier le groupe';

  @override
  String get groupDmWelcomeAddFriends => 'Ajouter des amis au groupe';

  @override
  String get dmGroupInvites => 'Invitations';

  @override
  String get groupDmEditTitle => 'Modifier le groupe';

  @override
  String get groupDmGroupName => 'Nom du groupe';

  @override
  String get groupDmMyGroup => 'Mon groupe';

  @override
  String get groupDmGroupNameMaxLength =>
      'Le nom du groupe ne doit pas dépasser 100 caractères';

  @override
  String get groupDmGroupIcon => 'Icône du groupe';

  @override
  String get groupDmUploadIcon => 'Importer une icône';

  @override
  String get groupDmChangeIcon => 'Changer l\'icône';

  @override
  String get groupDmRemoveIcon => 'Supprimer l\'icône';

  @override
  String get groupDmUpdated => 'Groupe mis à jour';

  @override
  String get groupDmUpdateFailed =>
      'Impossible de mettre à jour le groupe. Réessayez.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Les icônes animées ne sont pas prises en charge. Utilisez une image statique.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Les icônes animées ne sont pas prises en charge';

  @override
  String get groupDmIconFileTooLargeTitle =>
      'Le fichier de l’icône est trop volumineux';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'L\'icône est trop volumineuse. Choisissez un fichier de moins de $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat =>
      'Format d’icône non pris en charge';

  @override
  String get groupDmUnsupportedIconFormatBody =>
      'Type de fichier non pris en charge.';

  @override
  String get groupDmInvalidImage => 'Image non valide';

  @override
  String get groupDmInvalidImageBody =>
      'Cette image n\'est pas valide. Veuillez en essayer une autre.';

  @override
  String get groupDmAddFriends => 'Ajouter';

  @override
  String get groupDmOrSendInvite => 'ou envoyer une invitation à un ami :';

  @override
  String get groupDmGenerateInviteLink => 'Générer un lien d\'invitation';

  @override
  String get groupDmCreateInvite => 'Créer';

  @override
  String get groupDmInviteExpires24Hours =>
      'Votre invitation expire dans 24 heures';

  @override
  String get groupDmAddFriendFailed =>
      'Impossible d’ajouter cet ami au groupe. Veuillez réessayer.';

  @override
  String get groupDmGroupFull =>
      'Ce groupe est plein. Retirez un membre avant d’ajouter d’autres personnes.';

  @override
  String get groupDmRateLimited =>
      'Vous allez trop vite. Patientez un instant et réessayez.';

  @override
  String get groupDmCreateInviteFailedBody =>
      'Impossible de générer un lien d’invitation. Veuillez réessayer.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'Impossible de créer un lien d\'invitation. Veuillez réessayer.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'Vous n’avez pas la permission de créer une invitation dans ce canal.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'Cette communauté a atteint sa limite d\'invitations.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'La création d\'invitations est temporairement désactivée pour cette communauté.';

  @override
  String get groupDmCopyInviteFailed =>
      'Échec de la copie du lien d\'invitation';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Seul le propriétaire du groupe peut gérer les invitations.';

  @override
  String get groupDmNoInvitesCreated => 'Aucune invitation créée';

  @override
  String get groupDmLoadingInvites => 'Chargement des invitations...';

  @override
  String get groupDmInvitesLoadFailed =>
      'Échec du chargement des invitations. Veuillez réessayer.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Révoquer cette invitation ? Cette action est irréversible.';

  @override
  String get groupDmInviteRevoked => 'Invitation révoquée';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Créé par $name. Expire dans $time.';
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
    return 'Envoyer un message dans #$channelName';
  }

  @override
  String dmComposerHint(String recipientName) {
    return 'Envoyer un message à @$recipientName';
  }

  @override
  String groupDmNamedComposerHint(String groupName) {
    return 'Envoyer un message à $groupName';
  }

  @override
  String get groupDmComposerHint => 'Groupe de messages';

  @override
  String get composerHint => 'Message';

  @override
  String get composerOpenExpressionPicker =>
      'Ouvrir le sélecteur d\'expressions';

  @override
  String get composerShowKeyboard => 'Afficher le clavier';

  @override
  String get composerCloseAttachmentPanel =>
      'Fermer le sélecteur de pièces jointes';

  @override
  String get chatAttachmentPanelPhotos => 'Photos';

  @override
  String get chatAttachmentPanelFiles => 'Fichiers';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Accès à la photothèque requis';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Autoriser l’accès à la photothèque pour parcourir et joindre des photos et vidéos récentes.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Ouvrir les réglages';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', en cours d\'envoi';

  @override
  String get messageAccessibilityFailedSuffix => ', échec de l\'envoi';

  @override
  String get messageAccessibilityAttachmentSummary => 'une pièce jointe';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count pièces jointes';
  }

  @override
  String get messageAccessibilityImageSummary => 'une image';

  @override
  String get messageAccessibilityVideoSummary => 'une vidéo';

  @override
  String get messageAccessibilityAudioSummary => 'un fichier audio';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'autocollant $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'fichier $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'une pièce jointe masquée';

  @override
  String get messageAccessibilityEmbedSummary => 'un embed';

  @override
  String get messageAccessibilityEmptySummary => 'un message';

  @override
  String get personalNotesPrivateSpace => 'Votre espace privé';

  @override
  String get purgePersonalNotes => 'Purger les notes personnelles';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Cela supprimera définitivement tous les messages et pièces jointes de vos notes personnelles. Cette action est irréversible.';

  @override
  String get purgePersonalNotesConfirmButton => 'Purger';

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
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => 'Rechercher dans les réglages...';

  @override
  String get userSettingsSearchClear => 'Effacer la recherche';

  @override
  String get userSettingsSearchNoResults => 'Aucun paramètre trouvé';

  @override
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Sécurité et connexion';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Cadeaux';

  @override
  String get giftSettingsClaimAccountTitle => 'Finalisez votre inscription';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Réclamez votre compte pour échanger ou gérer les codes cadeaux Plutonium.';

  @override
  String get giftSettingsRedeemTitle => 'Utiliser un cadeau';

  @override
  String get giftSettingsRedeemDescription =>
      'Entrez un code cadeau pour obtenir du Plutonium pour votre compte.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Saisir le code cadeau…';

  @override
  String get giftSettingsRedeemButton => 'Utiliser';

  @override
  String get giftSettingsRedeemSuccess =>
      'Cadeau reçu avec succès. Profitez de votre Plutonium.';

  @override
  String get giftSettingsPurchasedTitle => 'Cadeaux achetés';

  @override
  String get giftSettingsPurchasedDescription =>
      'Gérez vos codes Plutonium offerts achetés. Partagez l\'URL du cadeau avec une personne spéciale ou utilisez-le vous-même !';

  @override
  String get giftSettingsEmptyTitle => 'Pas encore de cadeaux';

  @override
  String get giftSettingsEmptyDescription =>
      'Achetez un cadeau Plutonium dans l\'onglet Plutonium à partager avec vos amis.';

  @override
  String get giftSettingsGoToPlutonium => 'Aller à Plutonium';

  @override
  String get giftSettingsLoadFailedTitle =>
      'Échec du chargement de l\'inventaire de cadeaux';

  @override
  String get giftSettingsLoadFailedDescription => 'Réessayez plus tard.';

  @override
  String get giftSettingsTryAgain => 'Réessayer';

  @override
  String get giftSettingsGiftUrl => 'URL du cadeau';

  @override
  String get giftSettingsCopy => 'Copier';

  @override
  String get giftSettingsCopied => 'Copié';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Acheté le $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Offert le $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Utilisé par $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'Ce cadeau a été utilisé';

  @override
  String get giftSettingsRedeemForYourself => 'Utiliser pour soi';

  @override
  String get giftSettingsShareWithFriend => 'Partager avec un ami';

  @override
  String get premiumPlutoniumTagline =>
      'Débloquez des limites plus élevées et des fonctionnalités exclusives tout en soutenant une plateforme de communication indépendante.';

  @override
  String get premiumPurchaseMode => 'Mode d\'achat';

  @override
  String get premiumForMe => 'Pour moi';

  @override
  String get premiumAsAGift => 'En cadeau';

  @override
  String get premiumMonthly => 'Mensuel';

  @override
  String get premiumYearly => 'Annuel';

  @override
  String get premiumPerMonth => 'par mois';

  @override
  String get premiumPerYear => 'par an';

  @override
  String get premiumOneTimePurchase => 'achat unique';

  @override
  String get premiumSave17 => 'Économisez 17 %';

  @override
  String get premiumUpgradeNow => 'Mettre à niveau maintenant';

  @override
  String get premiumBuyGift => 'Offrir';

  @override
  String get premiumOneYearGift => 'Cadeau 1 an';

  @override
  String get premiumOneMonthGift => 'Cadeau d\'un mois';

  @override
  String get premiumScrollPrompt =>
      'Faites défiler vers le bas pour voir tous les avantages inclus avec Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'Gratuit ou Plutonium';

  @override
  String get premiumFreeColumn => 'Gratuit';

  @override
  String get premiumGiftSectionTitle => 'Offrir du Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'Offrez l\'expérience Plutonium à vos amis en achetant un abonnement cadeau.';

  @override
  String get premiumGiftBannerOne =>
      'Vous avez un nouveau code cadeau qui vous attend !';

  @override
  String premiumGiftBannerMany(int count) {
    return 'Vous avez $count nouveaux codes cadeaux qui vous attendent !';
  }

  @override
  String get premiumViewGifts => 'Voir les cadeaux';

  @override
  String get premiumReadyToUpgrade => 'Prêt à passer à la version supérieure ?';

  @override
  String get premiumReadyToBuyGift => 'Prêt(e) à offrir un cadeau ?';

  @override
  String get premiumManageSubscription => 'Gérer l\'abonnement';

  @override
  String get premiumRedeemGiftCode => 'Utiliser un code cadeau';

  @override
  String get premiumGiftBadge => 'Cadeau';

  @override
  String get premiumCancelSubscriptionTitle => 'Résilier l’abonnement ?';

  @override
  String get premiumCancelSubscriptionBody =>
      'Vous conservez vos avantages jusqu’à la date de votre prochain renouvellement, puis vous disposez d’une période de grâce de 3 jours pour vous réabonner et conserver votre historique d’abonné.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Résilier l’abonnement';

  @override
  String get premiumPurchaseHistoryTitle => 'Historique des achats';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Vos factures récentes. Pour modifier le mode de paiement de votre abonnement, ajoutez-en un ou choisissez-en un dans le portail de facturation et définissez-le comme mode de paiement par défaut.';

  @override
  String get premiumManagePaymentMethods => 'Gérer les modes de paiement';

  @override
  String get premiumSelfServeRefundButton => 'Rembourser le dernier achat';

  @override
  String get premiumDisclaimerAgreementPrefix =>
      'En achetant, vous acceptez nos ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'En achetant, vous avez accepté nos ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' et ';

  @override
  String premiumActiveUntil(String date) {
    return 'Actif jusqu\'au $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Résiliation programmée';

  @override
  String premiumCancelsOn(String date) {
    return 'Annulation le $date. Les avantages restent actifs jusqu\'à cette date.';
  }

  @override
  String get premiumReactivateSubscription => 'Réactiver';

  @override
  String premiumGiftedUntil(String date) {
    return 'Offert jusqu\'au $date. Ne se renouvelle pas automatiquement.';
  }

  @override
  String get premiumGiftGraceEnded =>
      'Votre temps offert est terminé. Abonnez-vous pour conserver Plutonium.';

  @override
  String get premiumGiftTimeAddedAfterSubscription =>
      'Vous serez facturé maintenant. Votre temps cadeau restant sera ajouté après votre période payante, ainsi rien ne sera perdu.';

  @override
  String get premiumComparisonFeatureColumn => 'Fonctionnalité';

  @override
  String get premiumDisclaimerRefund =>
      'Les remboursements en libre-service sont disponibles dans les 3 jours suivant le paiement, une fois tous les 30 jours. Le remboursement d’un abonnement entraîne sa résiliation. Les acheteurs de l’UE et de l’EEE renoncent au droit de rétractation de 14 jours lors du paiement pour accéder immédiatement au contenu. Utilisez le bouton de remboursement dans l’application plutôt qu’une rétrofacturation. Les rétrofacturations peuvent entraîner des restrictions permanentes sur votre compte. Stripe traite les paiements en toute sécurité. Nous ne voyons jamais votre numéro de carte complet.';

  @override
  String get premiumTermsOfService => 'Conditions d\'utilisation';

  @override
  String get premiumPrivacyPolicy => 'Politique de confidentialité';

  @override
  String get premiumCheckoutStartFailedTitle =>
      'Impossible de démarrer le paiement';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Un problème est survenu lors du démarrage du paiement. Veuillez réessayer dans un instant.';

  @override
  String get premiumPlanUnavailable =>
      'Ce forfait n\'est pas disponible. Contactez l\'assistance.';

  @override
  String get premiumPlanUnavailableSelfHosted =>
      'Ce forfait n\'est pas disponible. Contactez les administrateurs de cette instance.';

  @override
  String get premiumCompletePaymentTitle => 'Finaliser le paiement';

  @override
  String get premiumCompletePaymentBody =>
      'Vous êtes maintenant redirigé vers Stripe pour finaliser le paiement. Revenez sur Fluxer une fois que vous aurez terminé.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Choisir le mode de paiement';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Payez avec Pix automatique pour autoriser les frais récurrents directement depuis votre banque brésilienne. Ou choisissez d\'utiliser une carte pour saisir une carte de crédit sur l\'écran suivant de Stripe.';

  @override
  String get premiumUsePix => 'Utiliser Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Payez avec UPI pour configurer un e-mandat conforme à la RBI depuis votre banque indienne. Ou choisissez d\'utiliser une carte pour saisir une carte de crédit sur l\'écran suivant de Stripe.';

  @override
  String get premiumUseUpi => 'Utiliser UPI';

  @override
  String get premiumUseCard => 'Utiliser une carte';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Impossible d\'ouvrir le portail de facturation';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Un problème est survenu lors de l\'ouverture du portail de facturation. Veuillez réessayer dans un instant.';

  @override
  String get premiumAlreadyVisionaryTitle => 'Vous êtes déjà membre Visionary';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary inclut déjà un accès permanent, un abonnement récurrent n\'est donc pas nécessaire. Vous pouvez toujours acheter des cadeaux pour d\'autres personnes.';

  @override
  String get premiumExistingSubscriptionTitle => 'Abonnement déjà existant';

  @override
  String get premiumExistingSubscriptionBody =>
      'Nous avons trouvé un abonnement Fluxer Plutonium existant pour ce compte. Gérez-le dans le portail de facturation sécurisé pour mettre à jour les détails de paiement ou vérifier le statut du renouvellement. Si vous venez de payer, attendez une minute et rouvrez cette page.';

  @override
  String get premiumPurchasesDisabledTitle => 'Achats indisponibles';

  @override
  String premiumPurchasesDisabledBody(String supportEmail) {
    return 'Les achats sont désactivés pour ce compte. Contactez $supportEmail si cela vous semble incorrect.';
  }

  @override
  String get premiumPurchasesDisabledBodySelfHosted =>
      'Les achats sont désactivés pour ce compte. Contactez les administrateurs de cette instance si cela vous semble incorrect.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Réclamez votre compte pour acheter Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Vous devez vérifier votre e-mail avant de pouvoir acheter Fluxer Plutonium.';

  @override
  String get premiumPerkCommunities => 'Communautés';

  @override
  String get premiumPerkMessageCharacterLimit =>
      'Limite de caractères des messages';

  @override
  String get premiumPerkBookmarkedMessages => 'Messages enregistrés';

  @override
  String get premiumPerkFileUploadSize => 'Taille de l\'envoi de fichiers';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Utiliser les emojis animés';

  @override
  String get premiumPerkVideoQuality => 'Qualité vidéo';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Avatars animés et bannières de profil';

  @override
  String get premiumPerkEarlyAccess =>
      'Accès anticipé aux nouvelles fonctionnalités';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Jusqu’à 4K à 60 FPS';

  @override
  String storePlutoniumPriceLine(String monthly, String yearly) {
    return '$monthly ou $yearly';
  }

  @override
  String get storePlutoniumMonthSuffix => '/mois';

  @override
  String get storePlutoniumYearSuffix => '/an';

  @override
  String get storePlutoniumPriceOr => 'ou';

  @override
  String get storePlutoniumEmojiTitle => 'Vos emojis, partout';

  @override
  String get storePlutoniumEmojiBody =>
      'Utilisez les emojis et stickers personnalisés de toutes vos communautés dans chaque discussion et communauté dont vous faites partie.';

  @override
  String get storePlutoniumProfileTitle => 'Un profil qui sort du lot';

  @override
  String get storePlutoniumProfileBody =>
      'Obtenez un avatar et une bannière animés, un badge d\'abonné, le tag à quatre chiffres de votre choix après votre nom d\'utilisateur*, et un profil séparé pour chaque communauté.';

  @override
  String get storePlutoniumFilesTitle => 'Envoyer des fichiers jusqu’à 500 Mo';

  @override
  String get storePlutoniumFilesBody =>
      'Partagez des vidéos complètes et des fichiers volumineux sans les compresser. Les comptes gratuits peuvent envoyer jusqu\'à 25 Mo.';

  @override
  String get storePlutoniumCompareTitle => 'Comparer Gratuit et Plutonium';

  @override
  String get storePlutoniumCompareMobileNote =>
      'Toutes ces fonctionnalités ne sont pas disponibles dans l\'application mobile. Certaines ne sont disponibles que sur ordinateur.';

  @override
  String get storePlutoniumNotAvailable => 'Non disponible';

  @override
  String get storePlutoniumAvailable => 'Disponible';

  @override
  String get storePlutoniumCompareTag =>
      'Choisissez le numéro à 4 chiffres après votre nom d\'utilisateur*';

  @override
  String get storePlutoniumCompareProfile =>
      'Un profil distinct pour chaque communauté';

  @override
  String get storePlutoniumCompareBadge => 'Badge d\'abonné sur votre profil';

  @override
  String get storePlutoniumCompareBackgrounds =>
      'Arrière-plans d\'appel vidéo que vous pouvez enregistrer';

  @override
  String get storePlutoniumCompareCommunities =>
      'Communautés que vous pouvez rejoindre';

  @override
  String get storePlutoniumCompareCharacters =>
      'Caractères dans un seul message';

  @override
  String get storePlutoniumCompareBookmarks =>
      'Messages que vous pouvez enregistrer';

  @override
  String get storePlutoniumCompareUpload =>
      'Taille maximale des fichiers que vous pouvez envoyer';

  @override
  String get storePlutoniumCompareSavedMedia =>
      'Éléments multimédias que vous pouvez enregistrer pour plus tard';

  @override
  String get storePlutoniumCompareAnimatedEmoji =>
      'Utiliser des emojis animés dans les messages';

  @override
  String get storePlutoniumCompareCustomEmoji =>
      'Utiliser des emojis et des autocollants personnalisés dans n’importe quelle communauté';

  @override
  String get storePlutoniumCompareVideo =>
      'Qualité des appels vidéo et du partage d\'écran';

  @override
  String get storePlutoniumCompareAvatar =>
      'Avatar et bannière de profil animés';

  @override
  String get storePlutoniumCompareEarlyAccess =>
      'Accès anticipé aux nouvelles fonctionnalités';

  @override
  String get storePlutoniumCompareThemes =>
      'Thèmes personnalisés pour l’application';

  @override
  String get storePlutoniumVideoFree => 'Jusqu\'à 720p à 30 IPS';

  @override
  String get storePlutoniumVideoPlutonium => 'Jusqu\'à 4K à 60 IPS';

  @override
  String get storePlutoniumTagFootnote =>
      'Vous ne pouvez choisir qu\'un tag que personne d\'autre avec le même nom d\'utilisateur n\'a déjà. Les noms d\'utilisateur ne sont pas sensibles à la casse, donc Mina#4821 et mina#4821 sont considérés comme identiques. Le tag #0000 est réservé aux membres Fluxer Visionary.';

  @override
  String get storePlutoniumLearnVisionary => 'En savoir plus sur Visionary.';

  @override
  String get storePlutoniumDonatePrompt =>
      'Vous voulez juste soutenir le développement open source de Fluxer ? ';

  @override
  String get storePlutoniumDonateLink => 'Faire un don plutôt.';

  @override
  String get storePlutoniumHighlightsLead =>
      'S\'abonner finance Fluxer et débloque';

  @override
  String get storePlutoniumHighlightEmoji =>
      'Emojis et stickers personnalisés dans n’importe quelle discussion';

  @override
  String get storePlutoniumHighlightProfile =>
      'Profil animé, badge et numéro à 4 chiffres personnalisé';

  @override
  String get storePlutoniumHighlightFiles => 'Envois jusqu’à 500 Mo';

  @override
  String get storePlutoniumHighlightMessages =>
      'Envoyez des messages jusqu\'à 4 000 caractères';

  @override
  String get storePlutoniumHighlightCommunityProfile =>
      'Un profil distinct pour chaque communauté';

  @override
  String get storePlutoniumHighlightsMore => 'Et plus encore';

  @override
  String get storePlutoniumRenewsThroughPlay =>
      'Se renouvelle automatiquement via Google Play jusqu\'à votre annulation.';

  @override
  String get storePlutoniumRenewsThroughAppStore =>
      'Se renouvelle automatiquement via l’App Store jusqu’à votre annulation.';

  @override
  String get storePlutoniumAlreadySubscribed =>
      'Vous avez déjà un abonnement Fluxer Plutonium.';

  @override
  String storePlutoniumSavePercent(int percent) {
    return 'Économisez $percent %';
  }

  @override
  String get storePlutoniumWaiting =>
      'Achat reçu. Plutonium s’affichera ici une fois activé.';

  @override
  String get storePlutoniumUnavailable =>
      'Les abonnements intégrés à l\'application ne sont pas encore disponibles sur cet appareil.';

  @override
  String get storePlutoniumVisionaryStatus =>
      'Visionary inclut déjà un accès permanent, un abonnement récurrent n\'est donc pas nécessaire.';

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
  String get userSettingsNavChat => 'Discussion';

  @override
  String get userSettingsNavAudioAndVideo => 'Audio et vidéo';

  @override
  String get userSettingsNavShortcuts => 'Raccourcis';

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
  String get audioAndVideoInCallBehaviorSectionTitle =>
      'Comportement pendant l\'appel';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Contrôler les invites de confirmation pendant les appels vocaux et vidéo.';

  @override
  String get audioAndVideoInputDeviceLabel => 'Périphérique d\'entrée';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Périphérique de sortie';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'Par défaut';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Utiliser le haut-parleur';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'Quand il est désactivé, l\'audio est diffusé dans l\'écouteur ou le casque connecté.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Volume d\'entrée';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Volume de sortie';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle =>
      'Traitement de la voix';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Optimisé pour la voix';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Recommandé. Améliore le son du micro pour une voix claire.';

  @override
  String get audioAndVideoDirectInputLabel => 'Entrée directe';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Envoie votre audio tel quel. Idéal si vous utilisez un logiciel audio externe.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Personnalisé';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Ajustez chaque paramètre vous-même : suppression du bruit, annulation de l\'écho et gain.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle =>
      'Suppression du bruit';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Améliorée';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Standard';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Aucune';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Annulation de l’écho';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Contrôle automatique du gain';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Égalise le volume de ton micro. Désactivé lorsque la suppression améliorée est activée.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Test micro';

  @override
  String get audioAndVideoMicTestStartLabel => 'Démarrer le test du micro';

  @override
  String get audioAndVideoMicTestStopLabel => 'Arrêter le test du micro';

  @override
  String get audioAndVideoCameraLabel => 'Caméra';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Afficher la caméra en miroir';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'Qualité de la caméra';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'Qualité du partage d\'écran';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Fréquence d\'images';

  @override
  String get audioAndVideoFrameRate15Label => '15 IPS';

  @override
  String get audioAndVideoFrameRate30Label => '30 IPS';

  @override
  String get audioAndVideoFrameRate60Label => '60 IPS';

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Cette instance autorise actuellement le partage d\'écran jusqu\'à 720p à 30 FPS.';

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'Ne pas demander lors de la masquage de ma caméra';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'Ne pas demander lors de la masquage de mon partage d\'écran';

  @override
  String get userSettingsNavNotifications => 'Notifications';

  @override
  String get notificationsGeneralSectionTitle => 'Général';

  @override
  String get notificationsEnableNotificationsLabel =>
      'Activer les notifications';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Recevez des notifications lorsque vous recevez des messages. Vous devrez peut-être autoriser les notifications pour $productName dans les réglages de votre appareil. Pour les contrôles par salon/par communauté, ouvrez les réglages de notification depuis le menu d\'une communauté.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Activer les notifications sur ordinateur';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Utilise le centre de notifications du système d\'exploitation. Pour les contrôles par salon/communauté, faites un clic droit sur l\'icône d\'une communauté et ouvrez les paramètres de notification.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Délai d\'inactivité des notifications push';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName évite d’envoyer des notifications push à vos appareils mobiles lorsque vous êtes devant votre ordinateur. Choisissez la durée pendant laquelle vous devez être inactif sur l’ordinateur avant de recevoir les notifications push.';
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
  String get notificationsMentionPreferenceSectionTitle =>
      'Préférence de mention';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Préférence de mention en réponse';

  @override
  String get notificationsMentionNoPreferenceName => 'Pas de préférence';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Respecter l\'intention de l\'expéditeur, sans avertissement lorsqu\'il active/désactive la mention @';

  @override
  String get notificationsMentionPreferMentionName =>
      'Préférer être @mentionné';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Vous @mentionner par défaut dans les réponses et avertir l’expéditeur s’il désactive la mention';

  @override
  String get notificationsMentionPreferNoMentionName =>
      'Préférer ne pas être @mentionné';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Omettre votre @mention par défaut dans les réponses et avertir l’expéditeur s’il l’active';

  @override
  String get notificationsTtsSectionTitle =>
      'Notifications par synthèse vocale';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'Activer la lecture vocale /tts';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'Laissez /tts lire votre message à voix haute. Désactiver ce paramètre permet de conserver ces commandes comme du texte normal.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Ajuster la vitesse de lecture dans ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Accessibilité';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle =>
      'Narration automatique des messages';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Convertit le contenu entrant en parole, qu\'il provienne ou non de /tts.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Tous les salons';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Lire à voix haute chaque message entrant, quel que soit le salon ouvert.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Salon actif uniquement';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Ne lit que le salon que vous consultez. La narration vous suit d\'un salon à l\'autre.';

  @override
  String get notificationsTtsModeNeverName => 'Jamais automatiquement';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Rester silencieux, sauf si quelqu\'un lance /tts manuellement.';

  @override
  String get notificationsTtsModeAriaLabel =>
      'Lire tous les messages à voix haute';

  @override
  String get notificationsSoundsSectionTitle => 'Sons';

  @override
  String get notificationsMasterVolumeLabel => 'Volume principal';

  @override
  String get notificationsMasterVolumeDescription =>
      'Définit le volume de tous les effets sonores. Les réglages individuels des sons ignorent ce paramètre.';

  @override
  String get notificationsResetToDefaultVolume =>
      'Rétablir le volume par défaut';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Désactiver tous les sons de notification';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Vos réglages de sons de notification existants seront conservés.';

  @override
  String get notificationsShowMoreSoundEffects =>
      'Afficher plus d’effets sonores';

  @override
  String get notificationsShowFewerSoundEffects =>
      'Afficher moins d’effets sonores';

  @override
  String get notificationsPreviewSound => 'Écouter un aperçu';

  @override
  String get notificationsPerSoundVolumeTitle => 'Volume par son';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Définissez des volumes personnalisés pour chaque son. Les sons sans réglage spécifique suivent le volume principal.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Nombre de volumes personnalisés actifs : $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Suivre la principale • $effectiveValue %';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'Réinitialiser $label au volume principal';
  }

  @override
  String get notificationsResetAllOverrides =>
      'Réinitialiser tous les forçages';

  @override
  String notificationsMuteSound(String label) {
    return 'Couper le son de $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'Réactiver le son de $label';
  }

  @override
  String get notificationsSoundMessage =>
      'Notifications des messages de communauté';

  @override
  String get notificationsSoundDirectMessage =>
      'Notifications des messages privés';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Notifications des messages du salon actuel';

  @override
  String get notificationsSoundMute => 'Micro coupé';

  @override
  String get notificationsSoundUnmute => 'Micro réactivé';

  @override
  String get notificationsSoundDeaf => 'Son désactivé';

  @override
  String get notificationsSoundUndeaf => 'Son réactivé';

  @override
  String get notificationsSoundUserJoin => 'L\'utilisateur rejoint le salon';

  @override
  String get notificationsSoundUserLeave => 'L\'utilisateur quitte le salon';

  @override
  String get notificationsSoundUserMove => 'Utilisateur a déplacé le salon';

  @override
  String get notificationsSoundViewerJoin =>
      'Un spectateur rejoint la diffusion';

  @override
  String get notificationsSoundViewerLeave =>
      'Un spectateur quitte la diffusion';

  @override
  String get notificationsSoundVoiceDisconnect => 'Déconnexion vocale';

  @override
  String get notificationsSoundIncomingRing => 'Appel entrant';

  @override
  String get notificationsSoundCameraOn => 'Caméra activée';

  @override
  String get notificationsSoundCameraOff => 'Caméra désactivée';

  @override
  String get notificationsSoundScreenShareStart =>
      'Démarrage du partage d\'écran';

  @override
  String get notificationsSoundScreenShareStop => 'Arrêt du partage d\'écran';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'Impossible de mettre à jour le délai d\'attente des notifications push. Réessayez.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Impossible de mettre à jour la préférence de mention. Réessayez.';

  @override
  String get notificationsPermissionDeniedTitle => 'Notifications bloquées';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'Impossible d’activer les notifications. Autorisez l’accès aux notifications pour continuer.';

  @override
  String get notificationsPushRelaySectionTitle =>
      'Relais de notifications push';

  @override
  String notificationsPushRelaySectionDescription(String pushProvider) {
    return '$pushProvider ne distribue les notifications push que via son propre service, les notifications de cet appareil passent donc par le relais Fluxer.';
  }

  @override
  String get notificationsPushRelayConsentLabel =>
      'Utiliser le relais push Fluxer';

  @override
  String get notificationsPushRelayConsentDescription =>
      'Désactiver cette option supprime l\'enregistrement push de cet appareil, qui cesse alors de recevoir des notifications push.';

  @override
  String get pushRelayConsentTitle => 'Relais de notifications push';

  @override
  String pushRelayConsentDescription(String pushProvider) {
    return '$pushProvider ne distribue les notifications push que via son propre service, les notifications de cet appareil passent donc par le relais Fluxer.';
  }

  @override
  String get pushRelayConsentNoticePrefix => 'Acceptez l\'';

  @override
  String get pushRelayConsentNoticeLink =>
      'avis de confidentialité du relais push';

  @override
  String get pushRelayConsentNoticeSuffix =>
      ' pour activer les notifications push sur cet appareil. Vous n\'avez à accepter qu\'une fois par appareil.';

  @override
  String get pushRelayConsentAgree => 'Accepter et continuer';

  @override
  String get pushRelayConsentDecline => 'Pas maintenant';

  @override
  String get userSettingsNavLanguageAndTime => 'Langue et heure';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Langue de l’interface';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Choisissez la langue utilisée dans toute l\'application';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Format de l\'heure';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Choisissez le format d’affichage des heures dans l’application';

  @override
  String get languageAndTimeTimeFormatSelectionLabel =>
      'Sélection du format de l\'heure';

  @override
  String get languageAndTimeTimeFormatAuto => 'Auto';

  @override
  String get languageAndTimeTimeFormat12Hour => '12 heures';

  @override
  String get languageAndTimeTimeFormat24Hour => '24 heures';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'Format horaire de la langue de l’application : $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Format horaire du système : $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Utiliser le format de l\'heure du système';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'Échec de la mise à jour du format horaire';

  @override
  String get userSettingsNavDefaultApps => 'Applications par défaut';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Navigateur web';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Choisissez le navigateur qui s\'ouvre lorsque vous appuyez sur un lien.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'Si une application est installée pour un site, les liens s\'ouvriront d\'abord dans cette application.';

  @override
  String get defaultAppsWebBrowserInApp => 'Navigateur dans l\'application';

  @override
  String get defaultAppsWebBrowserExternal => 'Navigateur externe';

  @override
  String get userSettingsNavAppIcon => 'Icône de l\'application';

  @override
  String get appIconSectionTitle => 'Icône de l\'application';

  @override
  String get appIconSectionDescription =>
      'Choisissez l’icône qui apparaît sur votre écran d’accueil.';

  @override
  String get appIconOptionDefault => 'Par défaut';

  @override
  String get appIconOptionStarfield => 'Champ d\'étoiles';

  @override
  String get appIconOptionSweden => 'Suède';

  @override
  String get appIconUnsupported =>
      'Le changement d\'icône d\'application n\'est pas disponible sur cet appareil.';

  @override
  String get userSettingsNavAdvanced => 'Avancé';

  @override
  String get advancedPerformanceReportingTitle => 'Rapports de performance';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'Aidez à améliorer $productName en partageant des données anonymes de plantages et de performances.';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'Envoyer les rapports de plantages et de performances';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'Toutes les données signalées sont anonymes et envoyées uniquement au service de surveillance de $productName — aucun fournisseur tiers n\'est utilisé.';
  }

  @override
  String get advancedSettingsConfigure => 'Configurer';

  @override
  String get advancedSettingsCategoryPrivacy => 'Confidentialité';

  @override
  String get advancedSettingsCategoryAppearance => 'Apparence';

  @override
  String get advancedSettingsCategoryAccessibility => 'Accessibilité';

  @override
  String get advancedSettingsCategoryChat => 'Discussion';

  @override
  String get advancedSettingsCategoryMedia => 'Médias';

  @override
  String get advancedSettingsCategoryVoice => 'Vocal';

  @override
  String get advancedSettingsCategoryDeveloper => 'Développeur';

  @override
  String get advancedSettingEnableTextSelectionLabel =>
      'Activer la sélection de texte';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Autoriser la sélection de texte dans l’application';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Activer les miniatures de navigation vidéo';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Miniature ou image en direct lors du déplacement dans la vidéo';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Retour haptique';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Retour de vibration pour les appuis et les actions. Ne sera pas synchronisé sur les appareils.';

  @override
  String get advancedSettingShowNekoLabel => 'Afficher Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'Neko, le chat qui poursuit votre curseur';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Afficher Neko sur votre zone de saisie de discussion';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Animation de zoom de démarrage';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Réduire le logo en quittant l’écran de démarrage';

  @override
  String get advancedSettingKeyboardHintsLabel =>
      'Indications de raccourcis clavier';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Indications de raccourcis clavier dans les infobulles';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Activer les favoris';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Afficher les favoris dans toute l’application.';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Comportement lors de la connexion aux salons vocaux';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Confirmation ou double-clic pour rejoindre les salons vocaux des communautés';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Demander un double-clic pour rejoindre les salons vocaux';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Confirmer avant de rejoindre les salons vocaux';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Envoyer automatiquement les GIF sélectionnés';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Envoyer automatiquement les GIF depuis le sélecteur sans confirmation';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Enregistrer les GIF favoris en tant que médias enregistrés';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Choisir comment les GIF favoris marqués d\'une étoile sont stockés';

  @override
  String get advancedSettingMediaButtonsLabel => 'Boutons médias';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Personnalisez les boutons et indicateurs qui apparaissent sur les pièces jointes multimédias et les contenus intégrés';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Envoyer les pièces jointes avant le message';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Commencer l’envoi des pièces jointes dès leur ajout dans la zone de rédaction du message';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Supprimer les paramètres de suivi des URL';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Supprimer automatiquement les paramètres de suivi des URL dans les messages que vous envoyez';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'Faire confiance à tous les liens externes';

  @override
  String get advancedSettingSearchEnginesLabel => 'Moteurs de recherche';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Configurer les moteurs de recherche utilisés pour le texte sélectionné';

  @override
  String get advancedSettingTranslatorsLabel => 'Traducteurs';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Configurer les fournisseurs de traduction utilisés pour le texte sélectionné';

  @override
  String get advancedSettingReverseImageSearchLabel =>
      'Recherche d\'image inversée';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Fournisseurs de recherche d’images inversée';

  @override
  String get advancedSettingMessageActionBarLabel =>
      'Barre d\'actions des messages';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Personnaliser la barre d\'actions qui apparaît au survol des messages';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Saisie semi-automatique des expressions';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Choisissez ce qui s’affiche lorsque vous tapez deux-points dans la zone de saisie du message';

  @override
  String get advancedSettingInputButtonsLabel => 'Boutons de saisie de message';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Choisissez les boutons à afficher dans la zone de saisie des messages';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Faire défiler vers le bas lors de l\'envoi d\'un message';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Choisissez comment le fil de discussion se déplace après l’envoi d’un message';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Passer la confirmation « Tout marquer comme lu »';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Marquer immédiatement tous les salons non lus de la boîte de réception comme lus, sans demander de confirmation';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Masquer les salons mis en sourdine par défaut';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Masquer les salons mis en sourdine dans les barres latérales des communautés';

  @override
  String get advancedSettingShowGifIndicatorLabel =>
      'Afficher l\'indicateur GIF';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Afficher l\'indicateur d\'expiration des pièces jointes';

  @override
  String get advancedSettingShowMediaDeleteLabel =>
      'Afficher le bouton de suppression';

  @override
  String get advancedSettingShowMediaDownloadLabel =>
      'Afficher le bouton de téléchargement';

  @override
  String get advancedSettingShowMediaFavoriteLabel =>
      'Afficher le bouton \"Favoris\"';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Afficher le bouton « Masquer les contenus intégrés »';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Afficher la barre d\'actions des messages';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel =>
      'Afficher uniquement le bouton Plus';

  @override
  String get advancedSettingShowQuickReactionsLabel =>
      'Afficher les réactions rapides';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Activer Maj pour développer';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Afficher les emojis par défaut dans la saisie semi-automatique des expressions';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Afficher les emojis personnalisés dans la saisie semi-automatique des expressions';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Afficher les stickers dans la saisie semi-automatique des expressions';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Afficher les médias enregistrés dans la saisie semi-automatique des expressions';

  @override
  String get advancedSettingShowGifsButtonLabel => 'Afficher le bouton GIF';

  @override
  String get advancedSettingShowMediaButtonLabel => 'Afficher le bouton média';

  @override
  String get advancedSettingShowStickersButtonLabel =>
      'Afficher le bouton des stickers';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Afficher le bouton emoji';

  @override
  String get advancedSettingShowSendButtonLabel =>
      'Afficher le bouton d\'envoi';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Afficher les alertes de nouvel appareil';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Demander la confirmation pour les nouveaux périphériques audio.';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Contrôles du volume de connexion';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Afficher les curseurs de volume des participants par appareil dans les menus vocaux';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Comportement de l’aperçu du partage d’écran';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Comportement des aperçus, des fenêtres séparées et des miniatures de diffusion';

  @override
  String get advancedSettingScreenShareCodecLabel =>
      'Codec de partage d\'écran';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Codec vidéo pour le partage d’écran.';

  @override
  String get advancedSettingScreenShareCodecAuto => 'Automatique (recommandé)';

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
      'Mettre en pause l\'aperçu de mon partage d\'écran en arrière-plan';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Masquer la miniature d’aperçu de ma diffusion';

  @override
  String get advancedSettingDeveloperModeLabel => 'Activer le mode développeur';

  @override
  String get advancedSettingDeveloperModeDescription =>
      'Activer le mode développeur';

  @override
  String get advancedSettingDefaultSearchEngineLabel =>
      'Moteur de recherche par défaut';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Choisissez le moteur de recherche utilisé par défaut lorsque vous recherchez le texte sélectionné.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Moteurs de recherche intégrés';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Activer ou désactiver les moteurs de recherche intégrés. Les moteurs activés apparaissent dans le menu contextuel des messages lorsqu\'un texte est sélectionné.';

  @override
  String get advancedSettingCustomSearchEnginesLabel =>
      'Moteurs de recherche personnalisés';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Ajoutez vos propres moteurs de recherche avec un modèle d\'URL personnalisé. Utilisez \'$query\' comme espace réservé pour le texte de recherche.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel =>
      'Ajouter un moteur de recherche';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Activez au moins un moteur de recherche ci-dessous.';

  @override
  String get advancedSettingRemoveSearchEngineLabel =>
      'Supprimer le moteur de recherche';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'Traducteur par défaut';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Choisissez le traducteur utilisé par défaut pour traduire le texte sélectionné.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Traducteurs intégrés';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Activer ou désactiver les traducteurs intégrés. Les traducteurs activés apparaissent dans le menu contextuel des messages lorsque du texte est sélectionné.';

  @override
  String get advancedSettingCustomTranslatorsLabel =>
      'Traducteurs personnalisés';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Ajoutez vos propres traducteurs avec un modèle d\'URL personnalisé. Utilisez « $query » comme espace réservé pour le texte à traduire.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Ajouter un traducteur';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Activez au moins un traducteur ci-dessous.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Supprimer le traducteur';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Recherche d\'image inversée par défaut';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Choisissez le service de recherche d\'images inversée utilisé par défaut lors de la recherche d\'une image.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Recherche d\'image inversée intégrée';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Activez ou désactivez les fournisseurs de recherche d’images inversée intégrés. Les fournisseurs activés apparaissent dans le menu contextuel des images, avatars, bannières, stickers et emojis.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Recherche d\'image inversée personnalisée';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Ajoutez vos propres fournisseurs de recherche d\'images inversées avec un modèle d\'URL personnalisé. Utilisez \'$url\' comme espace réservé pour l\'URL de l\'image.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Ajouter une recherche d\'image inversée';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Activez au moins un fournisseur de recherche d\'images inversée ci-dessous.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Supprimer la recherche d\'image inversée';

  @override
  String get advancedSettingAddSearchEngineTitle =>
      'Ajouter un moteur de recherche';

  @override
  String get advancedSettingEditSearchEngineTitle =>
      'Modifier le moteur de recherche';

  @override
  String get advancedSettingAddTranslatorTitle =>
      'Ajouter un fournisseur de traduction';

  @override
  String get advancedSettingEditTranslatorTitle =>
      'Modifier le fournisseur de traduction';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Ajouter un moteur de recherche d\'images inversées';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Modifier le moteur de recherche d\'images inversées';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Nom';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'Modèle d\'URL';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'Mon moteur de recherche';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Mon traducteur';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'Ma recherche d\'image inversée';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Utilisez « $query » là où le texte de recherche doit être inséré.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Utilisez « $query » pour insérer le texte à traduire.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Utilisez « $url » pour insérer l\'URL de l\'image.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired =>
      'Le nom est obligatoire.';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'Le modèle d\'URL est requis.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'L\'URL doit contenir le modèle « $query ».';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'Le modèle d\'URL doit contenir l\'espace réservé « $url ».';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'Le modèle d\'URL doit être une URL valide.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Ajouter';

  @override
  String get advancedSettingEditSearchProviderAction => 'Modifier';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Supprimer';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'Êtes-vous sûr de vouloir supprimer $engineName ?';
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
  String get userSettingsJoinFluxerLabs => 'Rejoindre Fluxer Labs';

  @override
  String get userSettingsNavAppLicenses => 'Licences de l\'application';

  @override
  String get userSettingsAppLicensesDescription =>
      'Logiciels open source utilisés par cette application. Cette application est construite avec Flutter.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'Impossible de charger les licences de l\'application.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count licences',
      one: '1 licence',
    );
    return '$_temp0';
  }

  @override
  String get userSettingsNavLogOut => 'Se déconnecter';

  @override
  String get userSettingsLogOutConfirmTitle => 'Se déconnecter ?';

  @override
  String get userSettingsLogOutConfirmDescription =>
      'Vous pouvez vous reconnecter à tout moment.';

  @override
  String get quickSwitcherTabSearch => 'Rechercher';

  @override
  String get quickSwitcherTabFriends => 'Amis';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Rechercher des salons, des personnes ou des communautés';

  @override
  String get quickSwitcherSearchFriends => 'Rechercher des amis';

  @override
  String get quickSwitcherNoMatchesFound => 'Aucun résultat';

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
  String get quickSwitcherSectionThreads => 'Threads';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Salons vocaux';

  @override
  String get quickSwitcherSectionCommunities => 'Communautés';

  @override
  String get quickSwitcherSectionSettings => 'Réglages';

  @override
  String get quickSwitcherHomeLabel => 'Accueil';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Messages privés';

  @override
  String get quickSwitcherFavoritesLabel => 'Favoris';

  @override
  String get quickSwitcherUserSettingsLabel => 'Paramètres utilisateur';

  @override
  String get quickSwitcherNotificationsLabel => 'Notifications';

  @override
  String get quickSwitcherBookmarksLabel => 'Messages enregistrés';

  @override
  String get savedMessagesEmptyTitle => 'Aucun message enregistré';

  @override
  String get savedMessagesEmptyBody =>
      'Enregistrez des messages pour les retrouver plus tard.';

  @override
  String get savedMessagesEndBody => 'Il n\'y a rien d\'autre à voir ici.';

  @override
  String get savedMessagesRemoveTooltip => 'Retirer des messages enregistrés';

  @override
  String get savedMessagesAddedToast => 'Ajouté aux messages enregistrés';

  @override
  String get savedMessagesRemovedToast => 'Retiré des messages enregistrés';

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
  String get quickSwitcherSearchAliasDm => 'MP';

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
  String get quickSwitcherSearchAliasSaved => 'Enregistré';

  @override
  String get uiClose => 'Fermer';

  @override
  String get chatJumpToBottom => 'Aller en bas';

  @override
  String get uiConfirm => 'Confirmer';

  @override
  String get uiLoading => 'Chargement';

  @override
  String get uiSearch => 'Rechercher';

  @override
  String get uiStartCall => 'Démarrer l\'appel';

  @override
  String get uiStartVideoCall => 'Démarrer un appel vidéo';

  @override
  String get uiPlay => 'Lire';

  @override
  String get uiPause => 'Pause';

  @override
  String get uiDownload => 'Télécharger';

  @override
  String get uiMoreActions => 'Plus d\'actions';

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
  String get uiColorPickerTitle => 'Sélecteur de couleur';

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
    return 'Cela notifiera $count membres ayant le rôle $roleName. Continuer ?';
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
  String get instanceUrlHelper =>
      'Utilisez fluxer.app pour l\'instance officielle, ou l\'URL exacte d\'une instance auto-hébergée.';

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
  String get discoveryAllCategories => 'Tout';

  @override
  String get discoveryCategoryGaming => 'Jeux vidéo';

  @override
  String get discoveryCategoryMusic => 'Musique';

  @override
  String get discoveryCategoryEntertainment => 'Divertissement';

  @override
  String get discoveryCategoryEducation => 'Éducation';

  @override
  String get discoveryCategoryScienceAndTechnology =>
      'Sciences et technologies';

  @override
  String get discoveryCategoryContentCreator => 'Créateur de contenu';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime et mangas';

  @override
  String get discoveryCategoryMoviesAndTv => 'Films et séries TV';

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
  String get discoveryNoDescription => 'Aucune description.';

  @override
  String get discoveryCommunities => 'Communautés';

  @override
  String get discoveryApps => 'Applications';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Impossible de rejoindre cette communauté';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Une erreur est survenue. Veuillez réessayer dans un instant.';

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
      'Vous avez atteint le nombre maximal de communautés. Quittez-en une et réessayez.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Vous ne pouvez pas rejoindre cette communauté';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Vous avez été banni de cette communauté.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Cette communauté n’est plus disponible';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Cette communauté a peut-être quitté Découverte ou désactivé les nouvelles adhésions. Actualisez la page pour qu’elle n’apparaisse plus.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Vous allez trop vite';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Veuillez patienter un instant et réessayer.';

  @override
  String get guildNavbarAddCommunity => 'Ajouter une communauté';

  @override
  String get guildNavbarHelp => 'Aide';

  @override
  String get scrollIndicatorNew => 'NOUVEAU';

  @override
  String get scrollIndicatorNewMessage => 'NOUVEAU MESSAGE';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Réduire $folderName';
  }

  @override
  String get guildNavbarGuildSelected => 'Sélectionné';

  @override
  String get guildNavbarGuildUnread => 'non lu';

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
  String get navigationItemMuted => 'en sourdine';

  @override
  String get authShowPassword => 'Afficher le mot de passe';

  @override
  String get authHidePassword => 'Masquer le mot de passe';

  @override
  String get authCheckStillWorking => 'Toujours en cours…';

  @override
  String get authVerificationFailed =>
      'Impossible de terminer la vérification. Réessayez.';

  @override
  String get chatLoadingMessages => 'Chargement des messages';

  @override
  String get friendsMessageFriend => 'Envoyer un message';

  @override
  String get friendsFriendActions => 'Actions ami';

  @override
  String get friendsAcceptRequest => 'Accepter la demande d’ami';

  @override
  String get friendsDeclineRequest => 'Refuser la demande d\'ami';

  @override
  String get friendsCancelRequest => 'Annuler la demande d\'ami';

  @override
  String get friendsOpenInbox => 'Boîte de réception';

  @override
  String get profileRemoveFriend => 'Supprimer l\'ami';

  @override
  String get profileUnblockUser => 'Débloquer l\'utilisateur';

  @override
  String get profileAcceptFriendRequest => 'Accepter la demande d’ami';

  @override
  String get profileCancelFriendRequest => 'Annuler la demande d\'ami';

  @override
  String get profileSendFriendRequest => 'Ajouter un ami';

  @override
  String get accountOverflowMenu => 'Options du compte';

  @override
  String get navHome => 'Accueil';

  @override
  String get navNotifications => 'Notifications';

  @override
  String get navYou => 'Vous';

  @override
  String get guildFolderSettingsTitle => 'Paramètres du dossier';

  @override
  String get guildFolderNameLabel => 'Nom du dossier';

  @override
  String get guildFolderColorLabel => 'Couleur du dossier';

  @override
  String get guildFolderShowIconWhenCollapsed =>
      'Afficher l\'icône lorsque le dossier est réduit';

  @override
  String get guildFolderIconLabel => 'Icône du dossier';

  @override
  String get guildFolderDelete => 'Supprimer le dossier';

  @override
  String get guildFolderIconFolder => 'Dossier';

  @override
  String get guildFolderIconStar => 'Étoile';

  @override
  String get guildFolderIconHeart => 'Cœur';

  @override
  String get guildFolderIconBookmark => 'Enregistrer';

  @override
  String get guildFolderIconGameController => 'Manette de jeu';

  @override
  String get guildFolderIconShield => 'Bouclier';

  @override
  String get guildFolderIconMusicNote => 'Note de musique';

  @override
  String get guildFolderMarkAsRead => 'Marquer le dossier comme lu';

  @override
  String get guildBulkMuteCommunities =>
      'Désactiver les notifications des communautés';

  @override
  String get guildBulkUnmuteCommunities =>
      'Réactiver les notifications des communautés';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Paramètres de notification de la communauté';

  @override
  String get guildBulkCommunityPrivacySettings =>
      'Paramètres de confidentialité de la communauté';

  @override
  String get guildBulkAllowEveryoneAndHere => 'Autoriser @everyone et @here';

  @override
  String get guildBulkAllowRoleMentions => 'Autoriser les mentions de rôle';

  @override
  String get guildBulkEnableMobilePush =>
      'Activer les notifications push sur mobile';

  @override
  String get guildBulkDisableMobilePush =>
      'Désactiver les notifications push sur mobile';

  @override
  String get guildBulkAllowDirectMessages => 'Autoriser les messages privés';

  @override
  String get guildBulkBlockDirectMessages => 'Bloquer les messages privés';

  @override
  String get guildBulkAllowBotDirectMessages =>
      'Autoriser les messages privés des bots';

  @override
  String get guildBulkBlockBotDirectMessages =>
      'Bloquer les messages privés des bots';

  @override
  String get guildNavbarGroupDm => 'MP de groupe';

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
  String get guildNavbarChannelTypeSelection => 'Sélection du type de salon';

  @override
  String get guildNavbarPrivateChannel => 'Private channel';

  @override
  String get guildNavbarPrivateChannelDescription =>
      'Only selected members and roles will be able to view this channel.';

  @override
  String get guildNavbarAddMembersOrRoles => 'Add members or roles';

  @override
  String get guildNavbarAddMembersOrRolesHint => 'Search members or roles';

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
  String get guildNavbarMaxUses => 'Nombre max. d\'utilisations';

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
      'Supprimer vos messages dans cette communauté ?';

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
  String get guildNavbarRemoveOverride => 'Supprimer le réglage spécifique';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Muted jusqu\'au $formattedDate';
  }

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'Accessible uniquement au personnel $productName';
  }

  @override
  String get guildNavbarInvitesPaused =>
      'Les invitations sont actuellement suspendues dans cette communauté';

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
      'Modifier le profil dans la communauté';

  @override
  String get guildMenuUnmuteCommunity =>
      'Réactiver les notifications de la communauté';

  @override
  String get guildMenuMuteCommunity =>
      'Désactiver les notifications de la communauté';

  @override
  String get guildMenuHideMutedChannels => 'Masquer les salons mis en sourdine';

  @override
  String get guildMenuDebugCommunity => 'Déboguer la communauté';

  @override
  String get guildMenuCopyCommunityId =>
      'Copier l\'identifiant de la communauté';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Jusqu\'à $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Général';

  @override
  String get guildMenuSettingsRoles => 'Rôles et autorisations';

  @override
  String get guildMenuSettingsEmoji => 'Emoji';

  @override
  String get guildMenuSettingsStickers => 'Stickers';

  @override
  String get guildMenuSettingsSafetyModeration => 'Sécurité et modération';

  @override
  String get guildMenuSettingsActivityLog => 'Journal d’activité';

  @override
  String get guildMenuSettingsWebhooks => 'Webhooks';

  @override
  String get guildMenuSettingsDiscovery => 'Découverte';

  @override
  String get guildMenuSettingsMembers => 'Membres';

  @override
  String get guildMenuSettingsInviteLinks => 'Invitations';

  @override
  String get guildMenuSettingsBans => 'Bannissements';

  @override
  String get guildMenuSettingsChannels => 'Salons';

  @override
  String get guildSettingsNoPermission =>
      'Vous n\'avez pas la permission de voir cet onglet des paramètres.';

  @override
  String get guildSettingsOverviewIconTitle => 'Icône';

  @override
  String get guildSettingsOverviewBannerTitle => 'Bannière';

  @override
  String get guildSettingsOverviewNameTitle => 'Nom';

  @override
  String get guildSettingsOverviewNameHint => 'Ma super communauté';

  @override
  String get guildSettingsCreateRole => 'Créer un rôle';

  @override
  String get guildSettingsRolesListTitle => 'Rôles';

  @override
  String get guildSettingsRolesNewRole => 'Nouveau rôle';

  @override
  String get guildSettingsRolesDeleteRole => 'Supprimer le rôle';

  @override
  String get guildSettingsRolesBackToRoles => 'Retour aux rôles';

  @override
  String get guildSettingsBackToSettings => 'Retour aux paramètres';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Modifier « $name »';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Configurer les paramètres et les permissions du rôle';

  @override
  String get guildSettingsRolesDisplaySection => 'Affichage';

  @override
  String get guildSettingsRolesRoleName => 'Nom du rôle';

  @override
  String get guildSettingsRolesRoleColor => 'Couleur du rôle';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Saisissez une couleur (hex, rgb(), hsl() ou nom) ou utilisez le sélecteur.';

  @override
  String get guildSettingsRolesShowSeparately => 'Afficher ce rôle séparément';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Répertorie les membres ayant ce rôle dans leur propre section de la liste des membres.';

  @override
  String get guildSettingsRolesAllowMentions =>
      'Autoriser les mentions pour ce rôle';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'Les membres ayant la permission « $permission » peuvent toujours mentionner des rôles, quel que soit ce réglage.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Utilisez ce bouton pour effacer rapidement toutes les permissions.';

  @override
  String get guildSettingsRolesClearPermissions => 'Effacer les permissions';

  @override
  String get guildSettingsRolesPermissionsSection => 'Permissions';

  @override
  String get guildSettingsRolesSearchPermissions =>
      'Rechercher des permissions';

  @override
  String get guildSettingsRolesDenseLayout => 'Disposition dense';

  @override
  String get guildSettingsRolesComfyLayout => 'Disposition confortable';

  @override
  String get guildSettingsRolesSingleColumn => 'Colonne unique';

  @override
  String get guildSettingsRolesTwoColumns => 'Deux colonnes';

  @override
  String get guildSettingsRolesNoPermissionsFound =>
      'Aucune permission trouvée';

  @override
  String get guildSettingsRolesHoistOrder => 'Ordre d\'affichage';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Réinitialiser par défaut';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Faites glisser les rôles pour personnaliser l\'ordre d\'affichage dans la liste des membres.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Aucun rôle affiché séparément. Activez « Afficher ce rôle séparément » dans les paramètres d’un rôle pour qu’il apparaisse ici.';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Vous avez besoin de la permission « $permission » pour modifier ces permissions';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'Vous ne pouvez pas modifier un rôle égal ou supérieur à votre rôle le plus élevé';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'Vous ne pouvez pas accorder une permission que vous n’avez pas';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'Vous ne pouvez pas supprimer cette autorisation, car cela vous la retirerait à vous-même';

  @override
  String get guildSettingsRolesUpdatedSuccess => 'Rôles mis à jour';

  @override
  String get guildSettingsRolesCreatedSuccess => 'Rôle créé';

  @override
  String get guildSettingsRolesDeletedSuccess => 'Rôle supprimé avec succès';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'Ordre d\'affichage réinitialisé par défaut';

  @override
  String get guildSettingsRolesNameRequiredTitle =>
      'Le nom du rôle est obligatoire';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Donnez un nom au rôle avant d\'enregistrer.';

  @override
  String get guildSettingsRolesCreateFailedTitle =>
      'Impossible de créer le rôle';

  @override
  String get guildSettingsRolesUpdateFailedTitle =>
      'Impossible de mettre à jour les rôles';

  @override
  String get guildSettingsRolesDeleteFailedTitle =>
      'Impossible de supprimer le rôle';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '« $name » n\'a pas pu être supprimé. Veuillez réessayer.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'Impossible de réinitialiser l’ordre d’affichage';

  @override
  String get guildSettingsRolesTryAgainInAMoment =>
      'Réessayez dans un instant.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'Êtes-vous sûr de vouloir supprimer le rôle $name ? Tous les membres ayant ce rôle ne l\'auront plus.';
  }

  @override
  String get permissionCategoryCommunityWide => 'Toute la communauté';

  @override
  String get permissionCategoryMessagesMedia => 'Messages et médias';

  @override
  String get permissionCategoryModeration => 'Modération';

  @override
  String get permissionCategoryChannelAccess => 'Accès aux salons';

  @override
  String get permissionCategoryChannelManagement => 'Gestion des salons';

  @override
  String get permissionCategoryAudioVideo => 'Audio et vidéo';

  @override
  String get permissionAdministrator => 'Administrateur';

  @override
  String get permissionAdministratorDescription =>
      'Accorde toutes les permissions et contourne les restrictions des salons. Permission très sensible.';

  @override
  String get permissionViewActivityLog => 'Voir le journal d\'activité';

  @override
  String get permissionViewActivityLogDescription =>
      'Lire le journal d\'activité de la communauté (modifications et actions de modération).';

  @override
  String get permissionManageCommunity => 'Gérer la communauté';

  @override
  String get permissionManageCommunityDescription =>
      'Modifier les paramètres généraux comme le nom, la description et l\'icône.';

  @override
  String get permissionManageRoles => 'Gérer les rôles';

  @override
  String get permissionManageRolesDescription =>
      'Créer, modifier ou supprimer des rôles inférieurs à votre rôle le plus élevé. Permet également de modifier les permissions spécifiques aux salons.';

  @override
  String get permissionManageChannels => 'Gérer les salons';

  @override
  String get permissionManageChannel => 'Gérer le salon';

  @override
  String get permissionManageChannelDescription =>
      'Renommer et modifier les paramètres de ce salon.';

  @override
  String get permissionManagePermissions => 'Gérer les permissions';

  @override
  String get permissionManagePermissionsDescription =>
      'Modifier les permissions spécifiques aux rôles et aux membres dans ce salon.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Créer, modifier ou supprimer des webhooks pour ce salon.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Voir la liste des membres de ce salon.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Gérez les liens d’invitation pour ce salon.';

  @override
  String get permissionOverwriteDeny => 'Refuser';

  @override
  String get permissionOverwriteInherit => 'Neutre (hérité)';

  @override
  String get permissionOverwriteAllow => 'Autoriser';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Utilisez ces boutons pour définir rapidement toutes les permissions.';

  @override
  String get permissionManageChannelsDescription =>
      'Créer, modifier ou supprimer des salons et des catégories.';

  @override
  String get permissionKickMembers => 'Expulser des membres';

  @override
  String get permissionBanMembers => 'Bannir des membres';

  @override
  String get permissionCreateInviteLinks => 'Créer des liens d\'invitation';

  @override
  String get permissionChangeOwnNickname => 'Modifier son propre surnom';

  @override
  String get permissionChangeOwnNicknameDescription => 'Modifier votre surnom.';

  @override
  String get permissionManageNicknames => 'Gérer les surnoms';

  @override
  String get permissionManageNicknamesDescription =>
      'Modifier les surnoms des autres membres.';

  @override
  String get permissionCreateEmojiStickers =>
      'Créer des emojis et des stickers';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Importer de nouveaux emojis et stickers et gérer vos propres créations.';

  @override
  String get permissionManageEmojiStickers =>
      'Gérer les emojis et les stickers';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Modifier ou supprimer les emojis et les stickers créés par d’autres membres.';

  @override
  String get permissionManageWebhooks => 'Gérer les webhooks';

  @override
  String get permissionManageWebhooksDescription =>
      'Créer, modifier ou supprimer des webhooks.';

  @override
  String get permissionSendMessages => 'Envoyer des messages';

  @override
  String get permissionSendTtsMessages =>
      'Envoyer des messages de synthèse vocale';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Envoyer des messages vocaux.';

  @override
  String get permissionManageMessages => 'Gérer les messages';

  @override
  String get permissionManageMessagesDescription =>
      'Supprimer les messages des autres membres. L\'épinglage est géré séparément.';

  @override
  String get permissionPinMessages => 'Épingler des messages';

  @override
  String get permissionEmbedLinks => 'Intégrer des liens';

  @override
  String get permissionAttachFiles => 'Joindre des fichiers';

  @override
  String get permissionMentionEveryone => 'Utiliser @everyone/@here et @rôle';

  @override
  String get permissionMentionEveryoneDescription =>
      'Mentionner tout le monde ou n\'importe quel rôle (même si le rôle n\'est pas configuré pour être mentionnable).';

  @override
  String get permissionUseExternalEmoji => 'Utiliser des emojis externes';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Utiliser les emojis d\'autres communautés.';

  @override
  String get permissionUseExternalStickers => 'Utiliser des stickers externes';

  @override
  String get permissionAddReactions => 'Ajouter des réactions';

  @override
  String get permissionAddReactionsDescription =>
      'Ajouter de nouvelles réactions aux messages.';

  @override
  String get permissionBypassSlowmode => 'Ignorer le mode lent';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Ignorer les limites de fréquence des messages par salon.';

  @override
  String get permissionTimeOutMembers =>
      'Appliquer une restriction temporaire aux membres';

  @override
  String get permissionTimeOutMembersDescription =>
      'Empêcher les membres d\'envoyer des messages, de réagir et de rejoindre les conversations vocales pendant une certaine durée.';

  @override
  String get permissionViewChannel => 'Voir le salon';

  @override
  String get permissionViewChannelMembers => 'Voir les membres du salon';

  @override
  String get permissionViewChannelMembersDescription =>
      'Voir la liste des membres des salons de cette communauté.';

  @override
  String get permissionConnect => 'Connecter';

  @override
  String get permissionSpeak => 'Parler';

  @override
  String get permissionStreamVideo => 'Diffuser la vidéo';

  @override
  String get permissionUseVoiceActivity => 'Utiliser l\'activité vocale';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Sans cette permission, « Appuyer pour parler » est requis.';

  @override
  String get permissionPrioritySpeaker => 'Priorité de parole';

  @override
  String get permissionMuteMembers => 'Couper le micro des membres';

  @override
  String get permissionDeafenMembers => 'Désactiver le son des membres';

  @override
  String get permissionMoveMembers => 'Déplacer des membres';

  @override
  String get permissionMoveMembersDescription =>
      'Faites glisser les membres entre les canaux auxquels ils peuvent accéder.';

  @override
  String get permissionSetVoiceRegion => 'Définir la région vocale';

  @override
  String get permissionManageThreads => 'Manage threads';

  @override
  String get permissionManageThreadsDescription =>
      'Rename, archive, lock and delete threads, set their slowmode, and view private threads.';

  @override
  String get permissionCreatePublicThreads => 'Create public threads';

  @override
  String get permissionCreatePublicThreadsDescription =>
      'Start threads that everyone who can view the channel can see.';

  @override
  String get permissionCreatePrivateThreads => 'Create private threads';

  @override
  String get permissionCreatePrivateThreadsDescription =>
      'Start invite-only threads.';

  @override
  String get permissionSendMessagesInThreads => 'Send messages in threads';

  @override
  String get permissionSendMessagesInThreadsDescription =>
      'Send messages in threads and forum posts.';

  @override
  String get threadErrorArchived => 'This thread is archived.';

  @override
  String get threadErrorLocked =>
      'This thread is locked. Only moderators can post or reopen it.';

  @override
  String get threadErrorAlreadyCreated =>
      'A thread already exists for this message.';

  @override
  String get threadErrorMaxActiveThreads =>
      'This community has reached its limit of active threads.';

  @override
  String get threadErrorMaxMembers =>
      'This thread has reached its member limit.';

  @override
  String get threadErrorMaxPinnedPosts =>
      'Only one post can be pinned in this forum.';

  @override
  String get threadErrorMaxForumTags => 'A forum can have at most 20 tags.';

  @override
  String get threadErrorTagNamesUnique => 'Tag names must be unique.';

  @override
  String get threadErrorNoTagsForEveryone =>
      'Add a tag everyone can use before requiring tags.';

  @override
  String get threadErrorTagRequired => 'Pick at least one tag for this post.';

  @override
  String get threadErrorUnknownTag =>
      'One of the selected tags no longer exists.';

  @override
  String get threadErrorInvalidNotificationSettings =>
      'Those notification settings are not valid for a thread.';

  @override
  String get threadErrorSearchIndexNotReady =>
      'Posts are still being indexed. Try again in a moment.';

  @override
  String get threadErrorInvalidChannelType =>
      'This action is not available in this channel.';

  @override
  String get threadCreate => 'Create thread';

  @override
  String get threadName => 'Thread name';

  @override
  String get threadNameRequired => 'Give the thread a name.';

  @override
  String get threadNewThreadPlaceholder => 'New thread';

  @override
  String get threadPrivate => 'Private thread';

  @override
  String get threadPrivateDescription =>
      'Only people you invite and moderators can see this thread.';

  @override
  String get threadStarterMessage => 'Message';

  @override
  String get threadStarterMessagePlaceholder =>
      'Enter a message to start the conversation!';

  @override
  String threadCreateCooldown(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'You can start another thread in $seconds seconds.',
      one: 'You can start another thread in 1 second.',
    );
    return '$_temp0';
  }

  @override
  String threadCreateFailed(String detail) {
    return 'Could not start the thread: $detail';
  }

  @override
  String get threadBrowserTitle => 'Threads';

  @override
  String get threadBrowserActive => 'Active';

  @override
  String get threadBrowserArchived => 'Closed';

  @override
  String get threadBrowserJoined => 'Joined';

  @override
  String get threadBrowserOtherActive => 'Other active threads';

  @override
  String get threadBrowserPublic => 'Public threads';

  @override
  String get threadBrowserPrivate => 'Private threads';

  @override
  String get threadBrowserEmpty =>
      'There are no threads. Stay focused on a conversation with a thread, a temporary text channel.';

  @override
  String get threadBrowserArchivedEmpty => 'There are no closed threads.';

  @override
  String get threadBrowserLoadMore => 'Load more';

  @override
  String get threadBrowserSearch => 'Search threads';

  @override
  String get threadBrowserSearchEmpty => 'No threads match';

  @override
  String get threadBrowserSearchEmptyHint =>
      'Try a different name or check the other tab.';

  @override
  String get threadBrowserSearchFailed =>
      'Couldn\'t search threads. Try again later.';

  @override
  String get threadBrowserSearchIndexing =>
      'Search is getting ready for this community. Trying again shortly...';

  @override
  String threadMessageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count messages',
      one: '1 message',
    );
    return '$_temp0';
  }

  @override
  String get threadFailedToMentionSomeRoles =>
      'Some mentioned roles were not added to this thread.';

  @override
  String get threadMembers => 'Thread members';

  @override
  String threadMembersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count members',
      one: '1 member',
    );
    return '$_temp0';
  }

  @override
  String get threadMembersEmpty => 'Nobody has joined this thread yet.';

  @override
  String threadRemoveMember(String name) {
    return 'Remove $name from thread';
  }

  @override
  String get threadJoin => 'Join thread';

  @override
  String get threadLeave => 'Leave thread';

  @override
  String get threadJoinNotice =>
      'Join this thread to follow it in your channel list and get notifications.';

  @override
  String get threadArchivedNotice =>
      'This thread is closed. Sending a message will open it again.';

  @override
  String get threadLockedNotice =>
      'This thread is locked. Only moderators can send messages.';

  @override
  String get threadArchive => 'Close thread';

  @override
  String get threadUnarchive => 'Open thread again';

  @override
  String get threadLock => 'Lock thread';

  @override
  String get threadUnlock => 'Unlock thread';

  @override
  String get threadDelete => 'Delete thread';

  @override
  String threadDeleteConfirm(String threadName) {
    return 'Are you sure you want to delete $threadName? This cannot be undone.';
  }

  @override
  String get threadDeleted => 'Thread deleted';

  @override
  String get threadMarkAsRead => 'Mark as read';

  @override
  String get threadMute => 'Mute thread';

  @override
  String get threadUnmute => 'Unmute thread';

  @override
  String get threadMuted => 'Thread muted';

  @override
  String get threadUnmuted => 'Thread unmuted';

  @override
  String get threadNotificationSettings => 'Notification settings';

  @override
  String get threadNotificationParentDefault => 'Use channel default';

  @override
  String get threadCopyLink => 'Copy link';

  @override
  String get threadCopyId => 'Copy thread ID';

  @override
  String get threadMoreOptions => 'More options';

  @override
  String get threadSettings => 'Thread settings';

  @override
  String get threadSettingsSaved => 'Thread settings saved';

  @override
  String get threadAutoArchive => 'Hide after inactivity';

  @override
  String get threadAutoArchiveDescription =>
      'The thread stops showing in the channel list after this period of inactivity.';

  @override
  String get threadDefaultAutoArchive => 'Default hide after inactivity';

  @override
  String get threadDefaultAutoArchiveDescription =>
      'New threads stop showing in the channel list after this period of inactivity.';

  @override
  String get threadDefaultSlowmode => 'Default thread slowmode';

  @override
  String get threadAutoArchiveOneHour => '1 Hour';

  @override
  String get threadAutoArchiveOneDay => '24 Hours';

  @override
  String get threadAutoArchiveThreeDays => '3 Days';

  @override
  String get threadAutoArchiveOneWeek => '1 Week';

  @override
  String get threadInvitable => 'Allow anyone to invite';

  @override
  String get threadInvitableDescription =>
      'Members of this private thread can add other people.';

  @override
  String threadStartedBy(String name) {
    return 'Started by $name';
  }

  @override
  String get threadStarterDeleted => 'Original message was deleted.';

  @override
  String systemThreadCreated(
    String username,
    String threadLink,
    String allThreadsLink,
  ) {
    return '$username started a thread: $threadLink. See $allThreadsLink.';
  }

  @override
  String get systemThreadCreatedAllThreadsLink => 'all threads';

  @override
  String get systemThreadCreatedThreadFallback => 'a thread';

  @override
  String systemPreviewThreadCreated(String username) {
    return '$username started a thread.';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Pas encore d\'émojis personnalisés.';

  @override
  String get guildSettingsStickersEmpty =>
      'Pas encore d\'autocollants personnalisés.';

  @override
  String get guildSettingsModerationVerificationTitle =>
      'Vérification des membres';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Choisissez les conditions à remplir pour publier ou envoyer des messages privés aux membres de la communauté.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Les membres avec des rôles peuvent contourner ces vérifications. Pour les espaces publics, nous recommandons d\'activer la vérification.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Les communautés listées dans la Découverte nécessitent au moins un e-mail vérifié. Aucune ne peut être sélectionnée tant que la Découverte est activée.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Contenu pour adultes et avertissements';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Configurez l\'étiquetage du contenu mature et les avertissements de contenu optionnels pour les membres.';

  @override
  String get guildSettingsModerationMatureToggle => 'Contenu pour adultes';

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
      'Exige les conditions du niveau moyen, ainsi qu’une présence dans la communauté depuis au moins 10 minutes.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Suivre les actions des modérateurs dans toute la communauté.';

  @override
  String get guildSettingsAuditLogEmpty => 'Aucun journal pour l\'instant';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Les actions de modération et les modifications de la communauté apparaîtront ici.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Tous les utilisateurs';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Toutes les actions';

  @override
  String get guildSettingsAuditLogNoReason => 'Aucune raison n\'a été fournie.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Utilisateur inconnu';

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
  String get auditLogActionChannelCreate => 'Salon créé';

  @override
  String get auditLogActionChannelUpdate => 'Salon mis à jour';

  @override
  String get auditLogActionChannelDelete => 'Salon supprimé';

  @override
  String get auditLogActionThreadCreate => 'Thread created';

  @override
  String get auditLogActionThreadUpdate => 'Thread updated';

  @override
  String get auditLogActionThreadDelete => 'Thread deleted';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Autorisation de salon ajoutée';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Autorisation de salon mise à jour';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Autorisation de salon supprimée';

  @override
  String get auditLogActionMemberKick => 'Membre expulsé';

  @override
  String get auditLogActionMemberPrune => 'Membres purgés';

  @override
  String get auditLogActionMemberBanAdd => 'Membre banni';

  @override
  String get auditLogActionMemberBanRemove => 'Bannissement du membre levé';

  @override
  String get auditLogActionMemberUpdate => 'Membre mis à jour';

  @override
  String get auditLogActionMemberRoleUpdate => 'Rôles du membre mis à jour';

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
  String get auditLogActionStickerCreate => 'Sticker créé';

  @override
  String get auditLogActionStickerUpdate => 'Sticker mis à jour';

  @override
  String get auditLogActionStickerDelete => 'Sticker supprimé';

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
  String auditLogSummaryThreadCreate(String actor, String target) {
    return '$actor started the thread $target.';
  }

  @override
  String auditLogSummaryThreadUpdate(String actor, String target) {
    return '$actor updated the thread $target.';
  }

  @override
  String auditLogSummaryThreadDelete(String actor, String target) {
    return '$actor deleted the thread $target.';
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
    return '$actor a supprimé les autorisations de salon pour $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor a supprimé les autorisations de salon pour $target dans $channel.';
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
    return '$actor a déplacé $target vers un autre salon vocal.';
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
    return '$actor a créé l\'invitation $target pour le salon $channel.';
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
    return '$actor a mis à jour l\'invitation $target pour le salon $channel.';
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
    return '$actor a supprimé l\'invitation $target pour le salon $channel.';
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
    return 'A renommé le salon en $name.';
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
    return 'Salon : $value.';
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
  String get guildSettingsWebhooksDescription =>
      'Afficher et gérer tous les webhooks configurés pour votre communauté.';

  @override
  String get guildSettingsWebhooksEmpty => 'Aucun webhook';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'Cette communauté n\'a pas encore de webhooks. Allez dans $channelSettingsPath pour en créer un.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'Vous avez besoin de la permission « $permission » pour afficher et modifier les webhooks de cette communauté.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle =>
      'Échec du chargement des webhooks';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'Une erreur est survenue lors du chargement des webhooks. Veuillez réessayer.';

  @override
  String get guildSettingsWebhooksUpdated => 'Webhooks mis à jour';

  @override
  String get guildSettingsWebhooksUpdateFailed =>
      'Échec de la mise à jour des webhooks';

  @override
  String get guildSettingsUnknownChannel => 'Salon inconnu';

  @override
  String get guildSettingsCopiedUrl => 'URL copiée dans le presse-papiers';

  @override
  String get guildSettingsDiscoveryDescription =>
      'Répertoriez votre communauté dans Découverte pour que d\'autres puissent la trouver et la rejoindre.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Pas assez de membres';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Votre communauté doit avoir au moins $count membres avant de pouvoir être répertoriée dans la Découverte.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Statut :';

  @override
  String get guildSettingsDiscoveryStatusPending => 'En attente';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Approuvé';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Rejeté';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Supprimé';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Raison : $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'Votre communauté figure dans Découverte. Vous pouvez modifier sa fiche ci-dessous ou la retirer de Découverte.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Votre candidature est en attente d’examen. Vous pouvez encore modifier les détails de votre fiche ou retirer votre candidature.';

  @override
  String get guildSettingsDiscoveryCategory => 'Catégorie';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Choisissez la catégorie qui décrit le mieux votre communauté. Vous pourrez la modifier à tout moment.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Langue principale';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'La langue la plus parlée dans votre communauté. Elle sert à filtrer les résultats de Découverte.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Description';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Décrivez votre communauté';

  @override
  String get guildSettingsDiscoveryDescriptionRequired =>
      'Une description est requise.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'La description doit contenir au moins $minLength caractères.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'La description ne doit pas dépasser $maxLength caractères.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Tags personnalisés';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Jusqu\'à $maxTags tags aident les gens à trouver votre communauté. Ils apparaissent dans la recherche Découverte.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint =>
      'Ajoutez une étiquette et appuyez sur Entrée';

  @override
  String get guildSettingsDiscoveryAddTag => 'Ajouter';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Supprimer le tag $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle =>
      'Impossible d’ajouter le tag';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'Les tags doivent contenir entre 2 et $maxLength caractères alphanumériques.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'Vous ne pouvez ajouter que $maxTags tags.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Appliquer';

  @override
  String get guildSettingsDiscoverySave => 'Enregistrer';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Retirer';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Candidature à Découverte envoyée';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Fiche de Découverte mise à jour';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Candidature à Découverte retirée';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Impossible de retirer la candidature';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Réessayez dans un instant.';

  @override
  String get guildSettingsMembersSearchHint =>
      'Rechercher par nom d\'utilisateur ou ID';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count membres';
  }

  @override
  String get guildMembersRecentTitle => 'Membres récents';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Affichage de $displayedCount membres sur $totalCount au total';
  }

  @override
  String get guildMembersSort => 'Trier';

  @override
  String get guildSettingsMembersSortNewest => 'Du plus récent au plus ancien';

  @override
  String get guildMembersSortOldest => 'Du plus ancien au plus récent';

  @override
  String get guildMembersColumnName => 'Nom';

  @override
  String get guildMembersColumnMemberSince => 'Membre depuis';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'A rejoint $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Méthode d\'adhésion';

  @override
  String get guildMembersColumnRoles => 'Rôles';

  @override
  String get guildMembersFilterMemberSince => 'Filtrer par date d\'arrivée';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Filtrer par date de création du compte';

  @override
  String get guildMembersFilterJoinMethod => 'Filtrer par méthode d\'adhésion';

  @override
  String get guildMembersFilterRoles => 'Filtrer par rôles';

  @override
  String get guildMembersFilterAll => 'Tout';

  @override
  String get guildMembersFilterPast1Hour => 'Dernière heure';

  @override
  String get guildMembersFilterPast24Hours => '24 dernières heures';

  @override
  String get guildMembersFilterPast7Days => '7 derniers jours';

  @override
  String get guildMembersFilterPast2Weeks => '2 dernières semaines';

  @override
  String get guildMembersFilterPast3Weeks => '3 dernières semaines';

  @override
  String get guildMembersFilterPast4Weeks => '4 dernières semaines';

  @override
  String get guildMembersFilterPast3Months => '3 derniers mois';

  @override
  String get guildMembersFilterCustomRange => 'Plage personnalisée...';

  @override
  String get guildMembersDateRangeTitle => 'Plage de dates personnalisée';

  @override
  String get guildMembersDateAfter => 'Après le';

  @override
  String get guildMembersDateBefore => 'Avant le';

  @override
  String get guildMembersClearAll => 'Tout effacer';

  @override
  String get guildMembersRowsPerPage => 'Lignes par page';

  @override
  String get guildMembersEmptySearch =>
      'Personne ne correspond à cette recherche.';

  @override
  String get guildMembersLoadError =>
      'Un problème est survenu lors du chargement des membres. Veuillez réessayer plus tard.';

  @override
  String get guildMembersIndexing => 'Indexation des membres…';

  @override
  String get guildMembersJoinSourceCreator => 'Créateur de la communauté';

  @override
  String get guildMembersJoinSourceInvite => 'Inviter';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Invitation ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Invité par $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'URL personnalisée';

  @override
  String get guildMembersJoinSourceBotInvite => 'Invitation de bot';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'Admin de la plateforme';

  @override
  String get guildMembersJoinSourceDiscovery => 'Découverte';

  @override
  String get guildMembersJoinMethodUnknown => 'Inconnu';

  @override
  String get guildMembersCommunityOwner => 'Propriétaire de la communauté';

  @override
  String get guildMembersViewAllRoles => 'Voir tous les rôles';

  @override
  String get guildMembersJoinedJustNow => 'À l\'instant';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Il y a # minute(s)',
      one: 'Il y a 1 minute',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Il y a $count heures',
      one: 'Il y a 1 heure',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Membres';

  @override
  String get guildSettingsInvitesTitle => 'Invitations';

  @override
  String get guildSettingsInvitesDescription =>
      'Voir toutes les invitations pour cette communauté. Pour créer une nouvelle invitation, accédez à un salon et utilisez le bouton d\'invitation.';

  @override
  String get guildSettingsInvitesEmpty => 'Aucun lien d\'invitation';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Cette communauté n\'a pas encore de liens d\'invitation. Accédez à un salon et créez une invitation pour inviter des personnes.';

  @override
  String get guildSettingsInvitesLoadFailedTitle =>
      'Échec du chargement des invitations';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Une erreur est survenue lors du chargement des invitations. Veuillez réessayer.';

  @override
  String get guildSettingsInvitesTryAgain => 'Réessayer';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Afficher la date de création au lieu de la date d\'expiration';

  @override
  String get guildSettingsInvitesPauseInvites =>
      'Mettre les invitations en pause';

  @override
  String get guildSettingsInvitesEnableInvites => 'Activer les invitations';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Mettre en pause les invitations pour cette communauté';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Activer les invitations pour cette communauté';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Mettre les invitations en pause ? Les nouveaux utilisateurs ne pourront pas rejoindre via les liens d\'invitation tant que vous ne les réactiverez pas. Les membres existants ne seront pas affectés.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Activer les invitations ? Les utilisateurs pourront à nouveau rejoindre cette communauté via des liens d\'invitation.';

  @override
  String get guildSettingsInvitesPause => 'Pause';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Les invitations sont suspendues pour cette communauté.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Les invitations sont suspendues car $productName a détecté un raid potentiel. Les nouveaux utilisateurs ne peuvent pas rejoindre pour le moment.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Auteur de l’invitation :';

  @override
  String get guildSettingsInvitesLabelChannel => 'Salon :';

  @override
  String get guildSettingsInvitesLabelCode => 'Code :';

  @override
  String get guildSettingsInvitesLabelUses => 'Utilisations :';

  @override
  String get guildSettingsInvitesLabelCreated => 'Créé :';

  @override
  String get guildSettingsInvitesLabelExpires => 'Expire :';

  @override
  String get guildSettingsInvitesUnknown => 'Inconnu';

  @override
  String get guildSettingsInvitesNoCategory => 'Aucune catégorie';

  @override
  String get guildSettingsInvitesExpired => 'Expiré';

  @override
  String get guildSettingsInvitesNever => 'Jamais';

  @override
  String get guildSettingsInvitesCopyLink => 'Copier le lien d\'invitation';

  @override
  String get guildSettingsInvitesRevoke => 'Révoquer l\'invitation';

  @override
  String get guildSettingsInvitesRevokeFailedTitle =>
      'Impossible de révoquer l\'invitation';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'Le lien pourrait encore fonctionner. Réessayez dans un instant.';

  @override
  String get guildSettingsBansDescription =>
      'Voir et gérer les utilisateurs bannis.';

  @override
  String get guildSettingsBansSearchHint => 'Rechercher des bannissements';

  @override
  String get guildSettingsBansEmpty => 'Aucun utilisateur banni.';

  @override
  String get guildSettingsBanExpiresLabel => 'Expire le';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Aucun bannissement ne correspond à votre recherche.';

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
  String get guildSettingsRevokeBanError =>
      'Impossible de révoquer le bannissement. Réessayez.';

  @override
  String get guildSettingsCommunitySettings => 'Paramètres de la communauté';

  @override
  String get guildSettingsDeleteCommunity => 'Supprimer la communauté';

  @override
  String get guildSettingsDeleteCommunityConfirm =>
      'Voulez-vous vraiment supprimer cette communauté ? Cette action est irréversible. Tous les salons, messages et paramètres seront définitivement supprimés.';

  @override
  String get guildSettingsCommunityDeleted => 'Communauté supprimée';

  @override
  String get guildSettingsDeleteCommunityFailed =>
      'Impossible de supprimer cette communauté';

  @override
  String get guildSettingsCategoryExpressions => 'EXPRESSIONS';

  @override
  String get guildSettingsCategoryCommunity => 'COMMUNITY';

  @override
  String get guildSettingsCategoryIntegrations => 'INTEGRATIONS';

  @override
  String get guildSettingsCategoryPeople => 'PEOPLE';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Image de marque';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Mettez à jour votre icône, votre nom, votre bannière et l\'arrière-plan d\'invitation';

  @override
  String get guildSettingsOverviewBannerUpload => 'Importer une bannière';

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
      'Les communautés de plus de 250 personnes sont automatiquement réglées sur « Mentions seulement ». Votre réglage d\'origine est conservé et sera restauré si la communauté compte moins de 250 membres.';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Autoriser les noms de salons textuels flexibles';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Masquer la couronne du propriétaire de la communauté';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Bannière détachée';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Affiche la bannière dans sa propre section sous l\'en-tête de la communauté.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Importer une icône';

  @override
  String get guildSettingsOverviewRemoveImage => 'Supprimer';

  @override
  String get guildSettingsOverviewSplashTitle =>
      'Arrière-plan de l\'invitation';

  @override
  String get guildSettingsOverviewEmbedSplashTitle =>
      'Arrière-plan de l’aperçu d’invitation dans le chat';

  @override
  String get guildSettingsOverviewUploadBackground =>
      'Importer une image de fond';

  @override
  String get guildSettingsOverviewNoCommunityBanner =>
      'Aucune bannière de communauté';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'Pas d\'arrière-plan d\'invitation';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Aperçu';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Voir à quoi ressemble votre invitation pour les visiteurs.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Noms des salons textuels';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Couronne du propriétaire de la communauté';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Configurez si l\'icône de la couronne est affichée à côté du propriétaire de la communauté';

  @override
  String get guildSettingsSplashCardAlignment => 'Alignement de la carte';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Centrer';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Gauche';

  @override
  String get guildSettingsSplashAlignmentRight => 'Droite';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'S\'applique uniquement aux écrans larges.';

  @override
  String get permissionReadMessageHistory => 'Voir l\'historique des messages';

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
      'Ouvrir le réglage de la date limite de l’historique des messages';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Date limite de l’historique des messages';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Activer la date limite de l’historique des messages';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Date limite';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Les membres sans Lire l\'historique des messages peuvent voir les messages envoyés après cette date.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Date limite de l’historique des messages mise à jour';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Autoriser les majuscules et les espaces dans les noms des salons textuels. Si cette option est désactivée, seules les minuscules, les tirets et les tirets bas sont autorisés.';

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
  String get guildSettingsAfkChannel => 'Salon AFK / inactif';

  @override
  String get guildSettingsAfkChannelHint =>
      'Déplacez les membres vers ce salon lorsqu\'ils sont AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Aucun salon AFK';

  @override
  String get guildSettingsAfkTimeout => 'Délai d\'inactivité';

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
  String get guildSettingsSystemChannel => 'Salon de destination';

  @override
  String get guildSettingsSystemChannelHint =>
      'Les messages de bienvenue et système apparaîtront ici.';

  @override
  String get guildSettingsNoSystemChannel => 'Aucun salon système';

  @override
  String get guildSettingsHideJoinMessages =>
      'Masquer les messages de bienvenue';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Supprime les messages de bienvenue dans le salon de destination.';

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
  String get guildSettingsModerationContentFilterTitle => 'Filtrage du contenu';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Analyser automatiquement les messages à la recherche de contenu explicite dans les salons qui ne sont pas marqués comme réservés aux adultes.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Les communautés listées dans la découverte doivent scanner tous les membres. Ce paramètre ne peut pas être modifié tant que la découverte est activée.';

  @override
  String get guildSettingsContentFilterOff => 'Désactivé';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Laisser la communauté s\'auto-modérer';

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
  String get guildSettingsContentWarningToggle =>
      'Afficher un avertissement de contenu';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Active une invite de consentement avant d\'entrer dans un salon.';

  @override
  String get guildSettingsContentWarningText =>
      'Texte d\'avertissement personnalisé';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Ce contenu est sensible.';

  @override
  String get guildSettingsModeration2faTitle => 'Exigence de la 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'Exigez l\'authentification à deux facteurs pour les modérateurs avant qu\'ils ne puissent bannir, expulser, mettre en sourdine ou supprimer des messages.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Exiger la 2FA pour les actions de modération';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Activez l\'authentification à deux facteurs sur votre compte pour modifier ce paramètre';

  @override
  String get guildSettingsEmojiSearchHint => 'Rechercher des emojis';

  @override
  String get guildSettingsEmojiUploadTitle => 'Importer un emoji';

  @override
  String get guildSettingsEmojiSlotsTitle => 'Emplacements d\'emojis';

  @override
  String get guildSettingsEmojiDropZone =>
      'Faites glisser et déposez les fichiers d\'emoji ici';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Échec du chargement des emojis. Veuillez réessayer plus tard.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'Aucun emoji ne correspond à votre recherche.';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Vous avez atteint le nombre maximal d\'emojis. Supprimez des emojis existants pour libérer de l\'espace.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Les noms des emojis doivent comporter au moins 2 caractères et peuvent utiliser des lettres, des chiffres et des tirets bas. Les emojis doivent avoir une taille inférieure à $maxSize. Les images statiques sont redimensionnées à 128 x 128 pixels et compressées automatiquement. Les emojis animés et les SVG doivent déjà respecter cette limite.';
  }

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Certains emojis n’ont pas pu être ajoutés';

  @override
  String get guildSettingsEmojiRenameTitle => 'Renommer l\'emoji';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2 à 32 caractères, lettres, chiffres, tirets bas.';

  @override
  String get guildSettingsEmojiColumnName => 'Nom';

  @override
  String get guildSettingsEmojiColumnUploader => 'Ajouté par';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Supprimer l\'emoji';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'Supprimer :$name: ? Cette action est irréversible.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Purger cet emoji du stockage et du CDN';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'Le nom de l\'emoji doit contenir au moins 2 caractères';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'Le nom de l\'emoji doit contenir au maximum 32 caractères';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Nom d’emoji non valide';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Impossible de renommer cet emoji';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Impossible de supprimer cet emoji';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'Autoriser d\'autres utilisateurs à cloner vos émojis';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'Lorsque cette option est activée, les membres d\'autres communautés peuvent utiliser le raccourci \" Cloner \" en un clic dans l\'application pour vos emojis personnalisés. Cela ne les empêche pas d\'enregistrer l\'image et de la télécharger eux-mêmes.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Autoriser les autres à cloner vos autocollants';

  @override
  String get guildSettingsCloneStickerDescription =>
      'Lorsque cette option est activée, les membres d\'autres communautés peuvent utiliser le raccourci \" Cloner \" en un clic dans l\'application sur vos autocollants personnalisés. Cela ne les empêche pas d\'enregistrer l\'image et de la télécharger eux-mêmes.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Seuls les membres ayant la permission « $permission » peuvent modifier ceci.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'Impossible de mettre à jour le clonage des emojis';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Impossible de modifier le clonage des stickers';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Émojis non animés ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Émojis animés ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Rechercher des stickers';

  @override
  String get guildSettingsStickerSlotsTitle => 'Emplacements de stickers';

  @override
  String get guildSettingsStickerUploadTitle => 'Importer un sticker';

  @override
  String get guildSettingsStickerDropZone =>
      'Faites glisser et déposez un fichier de sticker ici (un à la fois)';

  @override
  String get guildSettingsStickerDensity => 'Densité des stickers';

  @override
  String get guildSettingsStickerDensityCozy => 'Confortable';

  @override
  String get guildSettingsStickerDensityCompact => 'Compact';

  @override
  String get guildSettingsStickersLoadFailedTitle =>
      'Échec du chargement des stickers';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Une erreur est survenue lors du chargement des stickers. Veuillez réessayer.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Aucun sticker ne correspond à votre recherche.';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Vous avez atteint le nombre maximal de stickers. Supprimez des stickers existants pour faire de la place.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Les stickers sont enregistrés en 320 × 320 pixels et doivent peser moins de $maxSize. Les images statiques sont redimensionnées et compressées automatiquement. Les stickers animés et les SVG doivent déjà respecter cette limite.';
  }

  @override
  String get guildSettingsStickerAddTitle => 'Ajouter un sticker';

  @override
  String get guildSettingsStickerEditTitle => 'Modifier le sticker';

  @override
  String get guildSettingsStickerNameLabel => 'Nom';

  @override
  String get guildSettingsStickerNameHint => 'Mon super sticker';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Description';

  @override
  String get guildSettingsStickerDescriptionHint => 'Décrivez le sticker';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Étiquettes ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Ajouter une étiquette';

  @override
  String get guildSettingsStickerTagAdd => 'Ajouter';

  @override
  String get guildSettingsStickerNameRequired => 'Le nom est obligatoire';

  @override
  String get guildSettingsStickerNameTooShort =>
      'Le nom doit contenir au moins 2 caractères';

  @override
  String get guildSettingsStickerNameTooLong =>
      'Le nom doit contenir 30 caractères ou moins';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'La description doit contenir 500 caractères ou moins';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'Impossible de créer ce sticker';

  @override
  String get guildSettingsStickerDeleteTitle => 'Supprimer le sticker';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'Supprimer « $name » ? Cette action est irréversible.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Purger ce sticker du stockage et du CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Impossible de supprimer cet autocollant';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Créez des webhooks depuis les paramètres du salon. Modifiez-les ici.';
  }

  @override
  String get guildSettingsBannedUsersTitle => 'Utilisateurs bannis';

  @override
  String get guildSettingsInvitesTableInviter => 'Auteur de l’invitation';

  @override
  String get guildSettingsInvitesTableChannel => 'Salon';

  @override
  String get guildSettingsInvitesTableCode => 'Code';

  @override
  String get guildSettingsInvitesTableUses => 'Utilisations';

  @override
  String get guildSettingsInvitesTableCreated => 'Créé';

  @override
  String get guildSettingsInvitesTableExpires => 'Expire le';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtrer par utilisateur';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtrer par action';

  @override
  String get createDm => 'Créer un MP';

  @override
  String get createGroupDm => 'Créer une conversation de groupe';

  @override
  String get createDmNewMessage => 'Nouveau message';

  @override
  String get createDmSelectFriends => 'Sélectionner des amis';

  @override
  String get createDmChooseFriendsSubtitle =>
      'Choisissez des amis à qui envoyer un message.';

  @override
  String get createDmSearchFriends => 'Rechercher des amis';

  @override
  String get createDmNoFriendsFound => 'Aucun ami trouvé';

  @override
  String get createDmNoFriendsYet => 'Vous n\'avez pas encore d\'amis';

  @override
  String get createDmClaimToStartDms =>
      'Finalisez votre inscription pour démarrer des conversations privées.';

  @override
  String get createDmVerifyToStartDms =>
      'Vérifiez votre adresse e-mail pour démarrer des conversations privées.';

  @override
  String get createDmVerifyYourEmail => 'Vérifiez votre e-mail';

  @override
  String get createDmNewGroup => 'Nouveau groupe';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Créer un nouveau groupe avec $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'Confirmer le nouveau groupe';

  @override
  String get createDmCreateNewGroup => 'Créer un nouveau groupe';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'Supprimer $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'Vous avez déjà un groupe avec ces utilisateurs. Voulez-vous vraiment en créer un nouveau ? C\'est possible aussi !';

  @override
  String get createDmNoActivityYet => 'Aucune activité pour l\'instant';

  @override
  String get createDmSomeUsersCantBeAdded =>
      'Certains utilisateurs ne peuvent pas être ajoutés';

  @override
  String get createDmCreateWithoutThem => 'Créer sans eux';

  @override
  String get createDmUnaddableIntro =>
      'Les personnes suivantes ne peuvent pas être ajoutées à cette conversation de groupe :';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Créer la conversation de groupe avec les $count destinataire(s) restant(s) et ignorer les autres ?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Il ne reste aucun destinataire avec qui créer une conversation de groupe.';

  @override
  String get createDmUnaddableUserNotFound => 'Utilisateur introuvable';

  @override
  String get createDmUnaddableBlocked =>
      'Vous ne pouvez pas envoyer de message à cet utilisateur';

  @override
  String get createDmUnaddableNotFriends => 'Pas dans votre liste d\'amis';

  @override
  String get createDmUnaddableGroupDisabled =>
      'N’autorise pas l’ajout aux conversations de groupe';

  @override
  String get createDmFailed =>
      'Impossible de créer la conversation. Réessayez.';

  @override
  String get dmListMessagesTitle => 'Messages';

  @override
  String get dmListDirectMessagesTitle => 'Messages privés';

  @override
  String get keybindsSearchShortcuts => 'Rechercher des raccourcis';

  @override
  String get keybindSectionDefaults => 'Défauts';

  @override
  String get keybindSectionMessages => 'Messages';

  @override
  String get keybindSectionNavigation => 'Navigation';

  @override
  String get keybindSectionDragAndDrop => 'Glisser-déposer';

  @override
  String get keybindSectionChat => 'Discussion';

  @override
  String get keybindSectionVoiceAndVideo => 'Audio et vidéo';

  @override
  String get keybindSectionMisc => 'Divers';

  @override
  String get keybindActionShowShortcutsList =>
      'Afficher la liste des raccourcis clavier';

  @override
  String get keybindActionCopyText => 'Copier le texte';

  @override
  String get keybindActionMarkUnread => 'Marquer comme non lu';

  @override
  String get keybindActionFocusTextarea =>
      'Mettre le focus sur la zone de texte';

  @override
  String get keybindActionSwitchCommunities => 'Changer de communauté';

  @override
  String get keybindActionSwitchChannels => 'Changer de salon';

  @override
  String get keybindActionHistoryBack =>
      'Revenir dans l’historique des salons consultés';

  @override
  String get keybindActionHistoryForward =>
      'Avancer dans l’historique des salons consultés';

  @override
  String get keybindActionJumpUnreadChannels =>
      'Passer d\'un salon non lu à l\'autre';

  @override
  String get keybindActionJumpMentionChannels =>
      'Passer d\'un salon non lu à l\'autre avec des mentions';

  @override
  String get keybindActionJumpCurrentCall => 'Afficher l’appel en cours';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Basculer entre la dernière communauté et les MP';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Passer à la communauté ou aux messages privés précédents';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Passer à la communauté ou aux messages privés suivants';

  @override
  String get keybindActionGoToDms => 'Aller aux messages privés';

  @override
  String get keybindActionGoToFirstCommunity =>
      'Aller à la première communauté';

  @override
  String get keybindActionGoToSecondCommunity =>
      'Aller à la deuxième communauté';

  @override
  String get keybindActionGoToThirdCommunity =>
      'Aller à la troisième communauté';

  @override
  String get keybindActionGoToFourthCommunity =>
      'Aller à la quatrième communauté';

  @override
  String get keybindActionGoToFifthCommunity =>
      'Aller à la cinquième communauté';

  @override
  String get keybindActionGoToSixthCommunity => 'Aller à la sixième communauté';

  @override
  String get keybindActionGoToSeventhCommunity =>
      'Aller à la septième communauté';

  @override
  String get keybindActionGoToEighthCommunity =>
      'Aller à la huitième communauté';

  @override
  String get keybindActionToggleQuickSwitcher =>
      'Ouvrir/fermer le Sélecteur rapide';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'Créer ou rejoindre une communauté';

  @override
  String get keybindActionStartDragAndDrop => 'Démarrer le glisser-déposer';

  @override
  String get keybindActionMove => 'Déplacer';

  @override
  String get keybindActionDropItem => 'Déposer l\'objet';

  @override
  String get keybindActionCancel => 'Annuler';

  @override
  String get keybindActionMarkCommunityRead =>
      'Marquer la communauté comme lue';

  @override
  String get keybindActionMarkChannelRead => 'Marquer le salon comme lu';

  @override
  String get keybindActionStartGroupDm => 'Démarrer une conversation de groupe';

  @override
  String get keybindActionTogglePinnedMessages =>
      'Afficher/masquer les messages épinglés';

  @override
  String get keybindActionToggleInbox =>
      'Afficher/masquer la boîte de réception';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Marquer le premier salon de la boîte de réception comme lu';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Marquer tous les salons de la boîte de réception comme lus';

  @override
  String get keybindActionToggleMemberList =>
      'Afficher/masquer la liste des membres ou le chat vocal';

  @override
  String get keybindActionToggleEmojiPicker =>
      'Ouvrir/fermer le sélecteur d\'emojis';

  @override
  String get keybindActionToggleGifPicker =>
      'Ouvrir/fermer le sélecteur de GIF';

  @override
  String get keybindActionToggleStickerPicker =>
      'Ouvrir/fermer le sélecteur de stickers';

  @override
  String get keybindActionScrollChatUp => 'Faire défiler le chat vers le haut';

  @override
  String get keybindActionScrollChatDown =>
      'Faire défiler la discussion vers le bas';

  @override
  String get keybindActionJumpOldestUnread =>
      'Aller au plus ancien message non lu';

  @override
  String get keybindActionFocusComposer =>
      'Placer le focus dans la zone de texte';

  @override
  String get keybindActionUploadFile => 'Importer un fichier';

  @override
  String get keybindActionCopyChannelLink => 'Copier le lien du salon';

  @override
  String get keybindActionToggleSavedMedia =>
      'Afficher/masquer les médias enregistrés';

  @override
  String get keybindActionSendVoiceMessage => 'Envoyer un message vocal';

  @override
  String get keybindActionAnswerCall => 'Répondre à l\'appel entrant';

  @override
  String get keybindActionDeclineCall => 'Refuser l\'appel entrant';

  @override
  String get keybindActionStartDmCall =>
      'Démarrer un appel dans une conversation privée ou de groupe';

  @override
  String get keybindActionToggleSoundboard => 'Ouvrir/fermer la boîte à sons';

  @override
  String get keybindActionToggleCompactCallView =>
      'Agrandir ou réduire l’affichage compact des appels';

  @override
  String get keybindActionPushToTalkPriority =>
      'Appuyer pour parler (priorité)';

  @override
  String get keybindActionVoiceActivityPriority =>
      'Priorité à l\'activité vocale';

  @override
  String get keybindActionOpenHelp => 'Ouvrir l\'aide';

  @override
  String get keybindActionSearchMessages => 'Rechercher des messages';

  @override
  String get keybindActionOpenContextMenu => 'Ouvrir le menu contextuel';

  @override
  String get keybindActionOpenSettings => 'Ouvrir vos réglages';

  @override
  String get keybindActionOpenThemeStudio =>
      'Ouvrir la fenêtre contextuelle du studio de thèmes';

  @override
  String get keybindActionZoomIn => 'Zoom avant';

  @override
  String get keybindActionZoomOut => 'Zoom arrière';

  @override
  String get keybindActionZoomReset => 'Réinitialiser le zoom';

  @override
  String get clipboardPasteFailed =>
      'Impossible de coller. Le presse-papiers était vide ou bloqué pour cette application.';

  @override
  String get homeQuickActionDms => 'MP';

  @override
  String get assistantNeedsLogin => 'Ouvrez Fluxer et connectez-vous d’abord.';

  @override
  String get assistantNotInVoice => 'Vous n\'êtes pas en appel.';

  @override
  String get assistantNotFound => 'Fluxer n’a pas trouvé cela.';

  @override
  String get assistantDmsDisabled =>
      'Les messages privés sont désactivés sur cette instance.';

  @override
  String get assistantFailed => 'Fluxer n’a pas pu terminer cette action.';

  @override
  String get assistantOkMuted => 'Micro coupé.';

  @override
  String get assistantOkUnmuted => 'Micro réactivé.';

  @override
  String get assistantOkLeftVoice => 'Vous avez quitté le salon vocal.';

  @override
  String get assistantOkJoinedVoice => 'Connexion au salon vocal.';

  @override
  String get assistantOkStartedCall => 'Démarrage de l\'appel.';

  @override
  String assistantOkStatusSet(String status) {
    return 'Statut défini sur $status.';
  }

  @override
  String get assistantOkOpened => 'Ouverture de Fluxer.';

  @override
  String get assistantOkMessageSent => 'Message envoyé.';

  @override
  String get assistantOkCustomStatusSet => 'Statut personnalisé mis à jour.';

  @override
  String get assistantOkCustomStatusCleared => 'Statut personnalisé effacé.';

  @override
  String get guildNavbarAnnouncementChannel => 'Salon d\'annonces';

  @override
  String get guildNavbarAnnouncementChannelDescription =>
      'Publiez des mises à jour que d’autres communautés peuvent suivre dans leurs propres salons';

  @override
  String get channelDetailsAnnouncementChannel => 'Salon d\'annonces';

  @override
  String get channelSettingsAnnouncementChannel => 'Salon d\'annonces';

  @override
  String get channelSettingsAnnouncementChannelDescription =>
      'Permet à d’autres communautés de suivre ce salon et de recevoir des copies de ce que vous publiez.';

  @override
  String get channelSettingsStopAnnouncementTitle =>
      'Ne plus être un salon d\'annonces ?';

  @override
  String channelSettingsStopAnnouncementBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count salons suivent ce salon. Le convertir en salon textuel supprime ces suivis.',
      one:
          '$count salon suit ce salon. Le convertir en salon textuel supprime ce suivi.',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsStopAnnouncementUnknown =>
      'Convertir ce salon en salon textuel supprime le suivi de tous les salons qui le suivent.';

  @override
  String get channelSettingsConvertChannel => 'Convertir';

  @override
  String get channelSettingsConvertFailed => 'Impossible de convertir ce salon';

  @override
  String get channelSettingsChannelHasFollowers =>
      'D\'autres salons suivent encore ce salon. Supprimez ces suivis avant de le convertir.';

  @override
  String get channelMenuFollow => 'Suivre le salon';

  @override
  String get channelFollowTitle => 'Suivre ce salon';

  @override
  String get channelFollowBody =>
      'Choisissez où ses messages publiés doivent aller. Vous pouvez ne plus suivre à tout moment dans Paramètres de la communauté → Webhooks.';

  @override
  String get channelFollowCommunity => 'Communauté';

  @override
  String get channelFollowChannel => 'Salon';

  @override
  String get channelFollowAgeWarning =>
      'Ce salon est soumis à une restriction d’âge. Les mises à jour ne peuvent être envoyées qu’aux salons soumis à une restriction d’âge.';

  @override
  String get channelFollowContentWarning =>
      'Ce salon a un avertissement de contenu. Les mises à jour ne peuvent être envoyées qu’aux salons avec un avertissement de contenu ou une restriction d’âge.';

  @override
  String get channelFollowHiddenHint =>
      'Les communautés et les salons où vous ne pouvez pas gérer les webhooks sont masqués.';

  @override
  String get channelFollowEmpty =>
      'Vous ne pouvez gérer les webhooks dans aucune communauté. Demandez à un administrateur de suivre ce salon.';

  @override
  String get channelFollowSubmit => 'Suivre';

  @override
  String get channelFollowFailed => 'Impossible de suivre ce salon.';

  @override
  String get channelFollowSuccessTitle => 'Les mises à jour arrivent !';

  @override
  String channelFollowSuccessBody(String sourceName, String targetName) {
    return 'Les messages publiés dans $sourceName apparaîtront dans #$targetName.';
  }

  @override
  String get channelFollowSuccessDismiss => 'OK !';

  @override
  String get channelFollowBarrier =>
      'Suivez ce salon pour recevoir ces annonces dans le salon de votre choix.';

  @override
  String get channelHeaderFollow => 'Suivre le salon';

  @override
  String get chatMessagePublish => 'Publier';

  @override
  String get chatMessagePublished => 'Publié';

  @override
  String get chatMessagePublishConfirmTitle => 'Publier le message ?';

  @override
  String get chatMessagePublishConfirmBody =>
      'Ceci envoie une copie à chaque salon qui suit celui-ci.';

  @override
  String get chatMessagePublishedToast => 'Message publié';

  @override
  String get chatMessageAlreadyPublished => 'Ce message est déjà publié.';

  @override
  String get chatMessagePublishFailedTitle =>
      'Impossible de publier ce message';

  @override
  String get chatMessagePublishFailedBody =>
      'Un problème est survenu. Veuillez réessayer dans un instant.';

  @override
  String get chatMessagePublishLimitTitle => 'Du calme';

  @override
  String chatMessagePublishLimitBody(String duration) {
    return 'Vous pourrez publier à nouveau dans $duration.';
  }

  @override
  String get chatMessagePublishLimitUnknown =>
      'Vous publiez trop rapidement. Réessayez dans un instant.';

  @override
  String get chatMessageDeletePublished =>
      'Cela supprime également les copies qui ont été envoyées aux salons qui suivent celui-ci.';

  @override
  String get chatMessageEditPublishedTitle => 'Modifier le message publié ?';

  @override
  String get chatMessageEditPublishedBody =>
      'Ceci met à jour les copies qui ont été envoyées aux salons qui suivent celui-ci.';

  @override
  String get chatMessageEditPublishedSave => 'Enregistrer';

  @override
  String get chatMessageEditLimitTitle => 'Du calme';

  @override
  String chatMessageEditLimitBody(String duration) {
    return 'Vous pourrez modifier ce message publié à nouveau dans $duration.';
  }

  @override
  String get chatMessageEditLimitUnknown =>
      'Vous modifiez ce message publié trop rapidement. Réessayez dans un instant.';

  @override
  String get chatMessageOriginalDeleted => '[Message d’origine supprimé]';

  @override
  String get userTagCommunity => 'Communauté';

  @override
  String systemFollowAdd(String username, String source) {
    return '$username a abonné ce salon à $source. Les messages publiés là-bas apparaîtront ici.';
  }

  @override
  String systemPreviewFollowAdd(String username, String source) {
    return '$username a abonné ce salon à $source.';
  }

  @override
  String get publishNudgeNotSent => 'Pas encore envoyé aux abonnés.';

  @override
  String get publishNudgeHideForever => 'Ne plus afficher';

  @override
  String get publishNudgeDismiss => 'Ignorer';

  @override
  String get channelSettingsFollowedChannels => 'Salons suivis';

  @override
  String get channelSettingsFollowedChannelsDescription =>
      'Salons d’annonces que ce salon suit. Arrêtez de les suivre pour ne plus recevoir de copies.';

  @override
  String get guildSettingsFollowedChannelsDescription =>
      'Salons d’annonces suivis par les salons de cette communauté.';

  @override
  String channelSettingsFollowedFrom(String guildName, String channelName) {
    return 'De $guildName #$channelName';
  }

  @override
  String get channelSettingsFollowedPaused =>
      'Les mises à jour sont en pause car le salon source n’est plus disponible.';

  @override
  String channelSettingsUnfollowTitle(String name) {
    return 'Ne plus suivre $name ?';
  }

  @override
  String get channelSettingsUnfollowBody =>
      'Ce salon ne recevra plus de copies de ce salon d\'annonces.';

  @override
  String get channelSettingsUnfollow => 'Ne plus suivre';

  @override
  String get crosspostCommunityTitle => 'Communauté';

  @override
  String get crosspostGoToCommunity => 'Aller à la communauté';

  @override
  String get crosspostJoinCommunity => 'Rejoindre la communauté';

  @override
  String get crosspostSourceFailed =>
      'Impossible de charger cette communauté. Réessayez dans un instant.';

  @override
  String crosspostMembers(int count) {
    return '$count membres';
  }

  @override
  String crosspostOnline(int count) {
    return '$count en ligne';
  }

  @override
  String durationMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes',
      one: '$count minute',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count secondes',
      one: '$count seconde',
    );
    return '$_temp0';
  }

  @override
  String get channelUnsupportedTitle => 'Type de salon non pris en charge';

  @override
  String get channelUnsupportedBody =>
      'Cette version de l\'application ne prend pas en charge ce type de salon.';

  @override
  String get channelDetailsUnsupportedChannel => 'Salon non pris en charge';

  @override
  String get forumChannelTypeForum => 'Forum';

  @override
  String get forumChannelTypeForumDescription =>
      'Posts organized by topic and tags';

  @override
  String get forumChannelTypeMedia => 'Media';

  @override
  String get forumChannelTypeMediaDescription =>
      'Posts built around images and videos';

  @override
  String get forumNewPost => 'New post';

  @override
  String get forumNewMediaPost => 'New media post';

  @override
  String get forumSearchPosts => 'Search posts';

  @override
  String get forumViewOptions => 'Sort and view';

  @override
  String get forumSearchIndexing =>
      'Search is still being prepared for this community. Posts appear here as soon as it is ready.';

  @override
  String get forumNoPosts => 'There are no posts yet';

  @override
  String get forumNoPostsHint => 'Be the first to start a conversation here.';

  @override
  String get forumNoSearchResults => 'No posts match your search';

  @override
  String get forumNoSearchResultsHint =>
      'Try different words or clear the tag filter.';

  @override
  String get forumCreateFirstPost => 'Create the first post';

  @override
  String get forumOlderPosts => 'Older posts';

  @override
  String get forumPostsLoadFailed => 'Posts could not be loaded.';

  @override
  String get forumRetry => 'Try again';

  @override
  String get forumPostPinned => 'Pinned';

  @override
  String get forumPostLocked => 'Locked';

  @override
  String get forumPostArchived => 'Archived';

  @override
  String get forumPostNewBadge => 'NEW';

  @override
  String get forumPostStarterDeleted => 'The original message was deleted.';

  @override
  String forumPostSnippet(String author, String content) {
    return '$author: $content';
  }

  @override
  String forumPostNewMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count new messages',
      one: '1 new message',
    );
    return '$_temp0';
  }

  @override
  String get forumPostReact => 'Add the default reaction';

  @override
  String get forumOpenPost => 'Open post';

  @override
  String get forumEditTags => 'Edit tags';

  @override
  String get forumSaveTags => 'Save tags';

  @override
  String forumTagsLimitHint(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pick up to $count tags.',
      one: 'Pick up to 1 tag.',
    );
    return '$_temp0';
  }

  @override
  String get forumPinPost => 'Pin post';

  @override
  String get forumUnpinPost => 'Unpin post';

  @override
  String get forumMarkPostRead => 'Mark as read';

  @override
  String get forumCopyPostLink => 'Copy link';

  @override
  String get forumPostGuidelines => 'Post guidelines';

  @override
  String get forumGuidelinesPlaceholder =>
      'Tell people what to post here and how to post it.';

  @override
  String get forumPostTitle => 'Title';

  @override
  String get forumPostMessage => 'Message';

  @override
  String get forumPostMessagePlaceholder =>
      'Write the first message of your post';

  @override
  String get forumPostMediaPlaceholder => 'Add a caption';

  @override
  String get forumPostTags => 'Tags';

  @override
  String get forumPostTagsRequired => 'Tags (required)';

  @override
  String get forumPostAddMedia => 'Add media';

  @override
  String get forumPostAddFile => 'Add file';

  @override
  String get forumPostRemoveAttachment => 'Remove attachment';

  @override
  String get forumPostSubmit => 'Post';

  @override
  String get forumPostTitleRequired => 'Give your post a title.';

  @override
  String get forumPostMediaRequired =>
      'Add at least one image or video to post here.';

  @override
  String get forumPostContentRequired => 'Write a message or add a file.';

  @override
  String get forumSortLatestActivity => 'Recently active';

  @override
  String get forumSortCreationTime => 'Date posted';

  @override
  String get forumLayoutList => 'List view';

  @override
  String get forumLayoutGallery => 'Gallery view';

  @override
  String get forumNewPostsUnread => 'Show unread for new posts';

  @override
  String get forumNewPostsUnreadDescription =>
      'Mark this channel unread when someone creates a post.';

  @override
  String get forumPostSlowmode => 'Post slowmode';

  @override
  String forumPostSlowmodeDescription(String bypassSlowmodePermissionLabel) {
    return 'Wait between creating posts. \"$bypassSlowmodePermissionLabel\" can bypass it.';
  }

  @override
  String get forumMessageSlowmode => 'Message slowmode in posts';

  @override
  String get forumMessageSlowmodeDescription =>
      'Slowmode applied to messages in new posts.';

  @override
  String get forumDefaultAutoArchive => 'Hide after inactivity';

  @override
  String get forumDefaultAutoArchiveDescription =>
      'New posts are archived after this long without activity.';

  @override
  String get forumDefaultReaction => 'Default reaction';

  @override
  String get forumSetDefaultReaction => 'Pick an emoji';

  @override
  String get forumChangeDefaultReaction => 'Change';

  @override
  String get forumRemoveDefaultReaction => 'Remove';

  @override
  String get forumDefaultSortOrder => 'Default sort order';

  @override
  String get forumDefaultLayout => 'Default layout';

  @override
  String get forumTagMatchSetting => 'Tag filter';

  @override
  String get forumTagMatchSome => 'Match any selected tag';

  @override
  String get forumTagMatchAll => 'Match all selected tags';

  @override
  String get forumRequireTag => 'Require tags';

  @override
  String get forumRequireTagDescription =>
      'People must pick at least one tag when they create a post.';

  @override
  String get forumHideMediaDownloads => 'Hide media download options';

  @override
  String get forumHideMediaDownloadsDescription =>
      'Hide download, open in browser and copy link for images and videos in posts.';

  @override
  String forumTagsTitle(int count, int max) {
    return 'Tags ($count/$max)';
  }

  @override
  String get forumTagsDescription =>
      'Tags help people find and filter posts. Only moderators can apply moderated tags.';

  @override
  String get forumCreateTag => 'Create tag';

  @override
  String get forumEditTag => 'Edit tag';

  @override
  String get forumSaveTag => 'Save tag';

  @override
  String get forumDeleteTag => 'Delete tag';

  @override
  String get forumTagName => 'Tag name';

  @override
  String get forumTagEmoji => 'Emoji';

  @override
  String get forumTagRemoveEmoji => 'Remove emoji';

  @override
  String get forumTagModerated => 'Only moderators can apply';

  @override
  String get forumTagModeratedDescription =>
      'Only members who can manage threads can apply or remove this tag.';

  @override
  String get forumTagModeratedBadge => 'Moderated';

  @override
  String forumPostCooldown(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'You can post again in $seconds seconds.',
      one: 'You can post again in 1 second.',
    );
    return '$_temp0';
  }
}
