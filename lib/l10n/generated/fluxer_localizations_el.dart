// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class FluxerLocalizationsEl extends FluxerLocalizations {
  FluxerLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get reconnectingTitle => 'Τα θαλασσώσαμε!';

  @override
  String get reconnectingBody =>
      'Κάτι δεν πάει καλά με τους διακομιστές.\nΘα φτιαχτεί σε ένα δευτερόλεπτο!';

  @override
  String get gatewayReconnectingToast => 'Επανασύνδεση…';

  @override
  String get gatewayConnectedToast => 'Συνδέθηκε';

  @override
  String get sessionExpiredToast =>
      'Your session has expired. Please sign in again.';

  @override
  String splashStartupFailed(String error) {
    return 'Αποτυχία εκκίνησης: $error';
  }

  @override
  String get retry => 'Δοκιμάστε ξανά';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Χάθηκε η σύνδεση';

  @override
  String get splashViewOnStatusPage => 'Προβολή στη σελίδα κατάστασης';

  @override
  String get splashConnectionIssuesPrompt => 'Προβλήματα σύνδεσης;';

  @override
  String get splashStatusPageLink => 'Σελίδα κατάστασης';

  @override
  String get splashReadIncident => 'Διαβάστε το συμβάν';

  @override
  String get splashIncidentHistory => 'Ιστορικό συμβάντων';

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
  String get welcomeBack => 'Καλώς ήρθες ξανά';

  @override
  String get email => 'Email';

  @override
  String get emailInvalid => 'Παρακαλώ εισάγετε μια έγκυρη διεύθυνση email.';

  @override
  String get password => 'Κωδικός πρόσβασης';

  @override
  String get forgotPassword => 'Ξεχάσατε τον κωδικό σας;';

  @override
  String get logIn => 'Σύνδεση';

  @override
  String get logInWithPasskey => 'Σύνδεση με κλειδί πρόσβασης';

  @override
  String continueWithSso(String provider) {
    return 'Συνέχεια με $provider';
  }

  @override
  String get ssoRequired =>
      'Απαιτείται SSO για την πρόσβαση σε αυτήν την παρουσία.';

  @override
  String get organizationSsoProvider =>
      'Συνδεθείτε μέσω του παρόχου ενιαίας σύνδεσης του οργανισμού σας.';

  @override
  String get failedToStartSso => 'Αποτυχία εκκίνησης SSO';

  @override
  String get ssoCancelled => 'Η σύνδεση SSO ακυρώθηκε';

  @override
  String preferSso(String provider) {
    return 'Προτιμάτε να χρησιμοποιείτε SSO; Συνεχίστε με το $provider.';
  }

  @override
  String get logInViaBrowser => 'Σύνδεση μέσω προγράμματος περιήγησης';

  @override
  String get needAccountPrompt => 'Χρειάζεστε λογαριασμό; ';

  @override
  String get register => 'Εγγραφή';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Επιβεβαιώστε ότι είστε άνθρωπος';

  @override
  String get captchaDescription =>
      'Πρέπει να βεβαιωθούμε ότι δεν είστε ρομπότ. Ολοκληρώστε την επαλήθευση παρακάτω.';

  @override
  String get captchaSwitchToHcaptcha =>
      'Έχετε προβλήματα; Δοκιμάστε το hCaptcha αντ\' αυτού';

  @override
  String get captchaSwitchToTurnstile => 'Δοκιμάστε το Turnstile αντ\' αυτού';

  @override
  String get cancel => 'Ακύρωση';

  @override
  String get ipAuthCheckEmail => 'Ελέγξτε το email σας';

  @override
  String ipAuthDescription(String email) {
    return 'Στείλαμε ένα email με έναν σύνδεσμο για την εξουσιοδότηση αυτής της σύνδεσης. Παρακαλώ ανοίξτε τα εισερχόμενά σας για το $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Χάθηκε η σύνδεση';

  @override
  String get ipAuthConnectionLostDescription =>
      'Χάσαμε τη σύνδεση ενώ περιμέναμε την εξουσιοδότηση. Παρακαλώ δοκιμάστε ξανά.';

  @override
  String get ipAuthLinkExpired => 'Ο σύνδεσμος σύνδεσης έληξε';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Αυτός ο σύνδεσμος εξουσιοδότησης έληξε. Παρακαλώ συνδεθείτε ξανά.';

  @override
  String get ipAuthResendEmail => 'Επαναποστολή email';

  @override
  String get ipAuthResent => 'Επαναστάλθηκε';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '$secondsδ';
  }

  @override
  String get back => 'Πίσω';

  @override
  String get next => 'Next';

  @override
  String get mfaTitle => 'Έλεγχος ταυτότητας δύο παραγόντων';

  @override
  String get mfaChooseMethod => 'Επιλέξτε μέθοδο επαλήθευσης';

  @override
  String get mfaMethodTotp => 'Εφαρμογή ελέγχου ταυτότητας';

  @override
  String get mfaMethodWebauthn => 'Κλειδί ασφαλείας / Κλειδί πρόσβασης';

  @override
  String get mfaTotpDescription =>
      'Εισαγάγετε τον 6ψήφιο κωδικό από την εφαρμογή ελέγχου ταυτότητας ή έναν από τους εφεδρικούς κωδικούς σας.';

  @override
  String get mfaCodeLabel => 'Κωδικός';

  @override
  String get mfaTryAnotherMethod => 'Δοκιμάστε άλλη μέθοδο';

  @override
  String get mfaUseSecurityKey =>
      'Δοκιμάστε κλειδί ασφαλείας / κωδικό πρόσβασης';

  @override
  String get accountSelectorTitle => 'Επιλέξτε λογαριασμό';

  @override
  String get accountSelectorDescription =>
      'Επιλέξτε έναν λογαριασμό για να συνεχίσετε ή προσθέστε έναν διαφορετικό.';

  @override
  String get accountAdd => 'Προσθήκη λογαριασμού';

  @override
  String get accountRemove => 'Αφαίρεση';

  @override
  String accountRemoveTitle(String username) {
    return 'Αφαίρεση $username';
  }

  @override
  String get accountRemoveDescription =>
      'Αυτό θα αφαιρέσει την αποθηκευμένη συνεδρία για αυτόν τον λογαριασμό.';

  @override
  String get accountRemoveOnlyDescription =>
      'Αυτό θα αφαιρέσει τον μοναδικό αποθηκευμένο λογαριασμό σε αυτήν τη συσκευή.';

  @override
  String get accountExpired => 'Έληξε';

  @override
  String accountSessionExpired(String identifier) {
    return 'Η συνεδρία έληξε για τον/την $identifier. Συνδεθείτε ξανά.';
  }

  @override
  String get accountManageTitle => 'Διαχείριση λογαριασμών';

  @override
  String get accountSwitchFailed =>
      'Δεν ήταν δυνατή η εναλλαγή λογαριασμών. Δοκιμάστε ξανά.';

  @override
  String get profileTabMenuSwitchAccounts => 'Εναλλαγή λογαριασμών';

  @override
  String get statusChangeSheetTitle => 'Ορισμός κατάστασης';

  @override
  String get statusOnlineStatusSection => 'Κατάσταση σύνδεσης';

  @override
  String get statusOnline => 'Σε σύνδεση';

  @override
  String get statusIdle => 'Αδρανής';

  @override
  String get statusDnd => 'Μην ενοχλείτε';

  @override
  String get statusInvisible => 'Αόρατος';

  @override
  String get statusOffline => 'Εκτός σύνδεσης';

  @override
  String get statusUntilIChangeIt => 'Μέχρι να το αλλάξω';

  @override
  String get statusDontClear => 'Μην καθαρίσετε';

  @override
  String get statusFor10Seconds => 'Για 10 δευτερόλεπτα';

  @override
  String get statusClearAfter10Seconds => '10 δευτερόλεπτα';

  @override
  String get statusClearAfter15Minutes => '15 λεπτά';

  @override
  String get statusClearAfter30Minutes => '30 λεπτά';

  @override
  String get statusClearAfter1Hour => '1 ώρα';

  @override
  String get statusClearAfter3Hours => '3 ώρες';

  @override
  String get statusClearAfter4Hours => '4 ώρες';

  @override
  String get statusClearAfter8Hours => '8 ώρες';

  @override
  String get statusClearAfter24Hours => '24 ώρες';

  @override
  String get statusClearAfter3Days => '3 ημέρες';

  @override
  String get statusDndDescription =>
      'Δεν θα λαμβάνετε ειδοποιήσεις στην επιφάνεια εργασίας';

  @override
  String get statusInvisibleDescription => 'Θα εμφανίζεστε εκτός σύνδεσης';

  @override
  String get customStatusSetTitle => 'Ορισμός προσαρμοσμένης κατάστασης';

  @override
  String get customStatusCurrentHint => 'Προσαρμοσμένη κατάσταση';

  @override
  String get customStatusClear => 'Καθαρισμός προσαρμοσμένης κατάστασης';

  @override
  String get customStatusPlaceholder => 'Τι συμβαίνει;';

  @override
  String get customStatusChooseEmoji => 'Επιλογή emoji';

  @override
  String get customStatusClearAfter => 'Καθαρισμός μετά από';

  @override
  String get customStatusSave => 'Αποθήκευση';

  @override
  String get accountActive => 'Ενεργός λογαριασμός';

  @override
  String get signOut => 'Αποσύνδεση';

  @override
  String get suspendedPermanentTitle => 'Ο λογαριασμός αναστάλθηκε μόνιμα';

  @override
  String get suspendedTemporaryTitle => 'Ο λογαριασμός αναστάλθηκε';

  @override
  String get suspendedPermanentDescription =>
      'Ο λογαριασμός σας έχει ανασταλεί μόνιμα για παραβίαση των Όρων Παροχής Υπηρεσιών μας.';

  @override
  String get suspendedTemporaryDescription =>
      'Ο λογαριασμός σας έχει ανασταλεί προσωρινά. Θα μπορείτε να έχετε πρόσβαση στον λογαριασμό σας μόλις λήξει η περίοδος αναστολής.';

  @override
  String get suspendedIssuedAt => 'Εκδόθηκε';

  @override
  String get suspendedEndsAt => 'Λήγει';

  @override
  String get suspendedDuration => 'Διάρκεια';

  @override
  String get suspendedPermanent => 'Μόνιμη';

  @override
  String get suspendedReason => 'Λόγος';

  @override
  String get suspendedAppealDeadline => 'Προθεσμία Έφεσης';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Ο λογαριασμός σας έχει προγραμματιστεί για διαγραφή στις $date.';
  }

  @override
  String get suspendedRecheck => 'Έλεγχος για Ενημερώσεις';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Έλεγχος ξανά σε $secondsδ';
  }

  @override
  String get suspendedBackToLogin => 'Επιστροφή στη Σύνδεση';

  @override
  String get suspendedAppealTitle => 'Έφεση';

  @override
  String get suspendedAppealHint =>
      'Εξηγήστε γιατί η αναστολή σας πρέπει να επανεξεταστεί (τουλάχιστον 50 χαρακτήρες)...';

  @override
  String get suspendedAppealSubmit => 'Υποβολή Έφεσης';

  @override
  String get suspendedAppealPending => 'Σε Αναμονή Επανεξέτασης';

  @override
  String get suspendedAppealAccepted => 'Έφεση Έγινε Δεκτή';

  @override
  String get suspendedAppealRejected => 'Έφεση Απορρίφθηκε';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Η έφεσή σας έγινε δεκτή και ο λογαριασμός σας αποκαταστάθηκε.';

  @override
  String get suspendedSignIn => 'Σύνδεση στον Λογαριασμό σας';

  @override
  String get forgotPasswordTitle => 'Ξεχάσατε τον κωδικό σας;';

  @override
  String get forgotPasswordDescription =>
      'Εισαγάγετε τη διεύθυνση email σας και θα σας στείλουμε έναν σύνδεσμο για να επαναφέρετε τον κωδικό σας.';

  @override
  String get forgotPasswordSubmit => 'Αποστολή συνδέσμου επαναφοράς';

  @override
  String get forgotPasswordSentTitle => 'Ελέγξτε το email σας';

  @override
  String get forgotPasswordSentDescription =>
      'Στείλαμε οδηγίες επαναφοράς κωδικού στη διεύθυνση email σας. Ελέγξτε τα εισερχόμενά σας και ακολουθήστε τον σύνδεσμο για να επαναφέρετε τον κωδικό σας.';

  @override
  String get forgotPasswordBackToLogin => 'Επιστροφή στη σύνδεση';

  @override
  String get resetPasswordTitle => 'Ορισμός νέου κωδικού πρόσβασης';

  @override
  String get resetPasswordDescription =>
      'Εισαγάγετε τον νέο σας κωδικό παρακάτω για να ολοκληρώσετε τη διαδικασία επαναφοράς.';

  @override
  String get resetPasswordNewPassword => 'Νέος κωδικός πρόσβασης';

  @override
  String get resetPasswordConfirm => 'Επιβεβαίωση νέου κωδικού πρόσβασης';

  @override
  String get resetPasswordSubmit => 'Επαναφορά κωδικού πρόσβασης';

  @override
  String get resetPasswordMismatch => 'Οι κωδικοί πρόσβασης δεν ταιριάζουν.';

  @override
  String get registerTitle => 'Δημιουργία λογαριασμού';

  @override
  String get registerDisplayName => 'Όνομα Εμφάνισης (Προαιρετικό)';

  @override
  String get registerDisplayNameHint => 'Πώς θέλετε να σας αποκαλούν;';

  @override
  String get registerUsername => 'Όνομα Χρήστη (Προαιρετικό)';

  @override
  String get registerUsernameHint => 'Αφήστε κενό για τυχαίο όνομα χρήστη';

  @override
  String get registerUsernameTagHint =>
      'Ένα tag 4 ψηφίων θα προστεθεί αυτόματα για να διασφαλιστεί η μοναδικότητα';

  @override
  String get registerDateOfBirth => 'Ημερομηνία γέννησης';

  @override
  String get registerMonth => 'Μήνας';

  @override
  String get registerDay => 'Ημέρα';

  @override
  String get registerYear => 'Έτος';

  @override
  String get registerConsent =>
      'Συμφωνώ με τους Όρους Παροχής Υπηρεσιών και την Πολιτική Απορρήτου';

  @override
  String get registerConsentPrefix => 'Συμφωνώ με τους ';

  @override
  String get registerConsentTerms => 'Όρους Παροχής Υπηρεσιών';

  @override
  String get registerConsentAnd => ' και ';

  @override
  String get registerConsentPrivacy => 'Πολιτική Απορρήτου';

  @override
  String get registerConfirmPassword => 'Επιβεβαίωση Κωδικού Πρόσβασης';

  @override
  String get registerSubmit => 'Δημιουργία λογαριασμού';

  @override
  String get registerHaveAccount => 'Έχετε ήδη λογαριασμό; ';

  @override
  String get registerPendingApproval =>
      'Your account request is pending approval. You can sign in after an admin approves it.';

  @override
  String get registerClosed =>
      'Registration is currently closed. Use a registration link from an admin to create an account.';

  @override
  String get passkeyNoCredentials =>
      'Δεν βρέθηκαν κλειδιά πρόσβασης για αυτήν την εφαρμογή. Συνδεθείτε με email και κωδικό πρόσβασης αντ\' αυτού.';

  @override
  String get passkeyDeviceNotSupported =>
      'Τα κλειδιά πρόσβασης δεν υποστηρίζονται σε αυτήν τη συσκευή.';

  @override
  String get passkeyDomainNotAssociated =>
      'Τα κλειδιά πρόσβασης δεν έχουν διαμορφωθεί για αυτήν την εφαρμογή. Συνδεθείτε με email και κωδικό πρόσβασης αντ\' αυτού.';

  @override
  String get passkeyTimeout =>
      'Η πιστοποίηση κλειδιού πρόσβασης έληξε. Παρακαλώ προσπαθήστε ξανά.';

  @override
  String get passkeyNotAvailable =>
      'Τα κλειδιά πρόσβασης δεν είναι διαθέσιμα για αυτήν την εφαρμογή. Συνδεθείτε με email και κωδικό πρόσβασης αντ\' αυτού.';

  @override
  String get passkeyFailed =>
      'Η πιστοποίηση με κλειδί πρόσβασης απέτυχε. Δοκιμάστε ξανά.';

  @override
  String get errorUnableToCreateAccount =>
      'Αδύνατη η δημιουργία λογαριασμού. Δοκιμάστε ξανά.';

  @override
  String get errorUnableToSignIn =>
      'Αδύνατη η σύνδεση αυτήν τη στιγμή. Δοκιμάστε ξανά.';

  @override
  String get errorServiceUnavailable =>
      'This instance is temporarily unavailable. Try again in a moment.';

  @override
  String get errorInvalidEmailOrPassword =>
      'Μη έγκυρο email ή κωδικός πρόσβασης.';

  @override
  String get errorUnableToSendResetLink =>
      'Αδύνατη η αποστολή συνδέσμου επαναφοράς. Δοκιμάστε ξανά.';

  @override
  String get errorUnableToResetPassword =>
      'Αδύνατη η επαναφορά κωδικού πρόσβασης. Δοκιμάστε ξανά.';

  @override
  String get embedInviteJoin => 'Συμμετοχή στην Κοινότητα';

  @override
  String get embedInviteGoTo => 'Μετάβαση στην Κοινότητα';

  @override
  String embedInviteOnline(String count) {
    return '$count σε σύνδεση';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count Μέλη';
  }

  @override
  String get embedInviteUnknownTitle => 'Άγνωστη Πρόσκληση';

  @override
  String get embedInviteUnknownSubtitle =>
      'Δοκιμάστε να ζητήσετε νέα πρόσκληση.';

  @override
  String get embedInviteUnavailable => 'Η πρόσκληση δεν είναι διαθέσιμη';

  @override
  String get embedInviteJoinGroup => 'Join group';

  @override
  String get embedInviteAlreadyJoined => 'Already joined';

  @override
  String get inviteAcceptTitle => 'Έχετε προσκληθεί να συμμετάσχετε';

  @override
  String get inviteAcceptJoinButton => 'Συμμετοχή στην Κοινότητα';

  @override
  String get inviteAcceptGoToButton => 'Μετάβαση στην Κοινότητα';

  @override
  String get inviteAcceptInvitesPaused => 'Οι προσκλήσεις έχουν τεθεί σε παύση';

  @override
  String get inviteAcceptNotFoundTitle => 'Μη έγκυρη πρόσκληση';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Αυτή η πρόσκληση ενδέχεται να έχει λήξει ή να είναι μη έγκυρη.';

  @override
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'Συμμετοχή στην ομάδα';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Έχετε προσκληθεί να συμμετάσχετε σε μια ομαδική άμεση συνομιλία από τον/την $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'κάποιον';

  @override
  String get inviteAcceptEmojiPack => 'Πακέτο emoji';

  @override
  String get inviteAcceptStickerPack => 'Πακέτο αυτοκόλλητων';

  @override
  String get inviteAcceptInstallEmojiPack => 'Εγκατάσταση πακέτου emoji';

  @override
  String get inviteAcceptInstallStickerPack =>
      'Εγκατάσταση πακέτου αυτοκόλλητων';

  @override
  String get inviteAcceptPackInstallNote =>
      'Η αποδοχή αυτής της πρόσκλησης εγκαθιστά αυτόματα το πακέτο.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Πρόσβαση στο κανάλι Απαγορεύτηκε';

  @override
  String get channelAccessDeniedDescription =>
      'Δεν έχετε πρόσβαση στο κανάλι όπου στάλθηκε αυτό το μήνυμα.';

  @override
  String get messageJumpLinkNoAccess => 'Χωρίς πρόσβαση';

  @override
  String get okay => 'Εντάξει';

  @override
  String get embedThemeTitle => 'Κοινόχρηστο θέμα';

  @override
  String get embedThemeSubtitle =>
      'Αυτός ο client δεν υποστηρίζει προσαρμοσμένα θέματα.';

  @override
  String get embedThemeUnavailableButton => 'Θέματα μη διαθέσιμα';

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
  String get privacySettings => 'Ρυθμίσεις απορρήτου';

  @override
  String get privacyDirectMessages => 'Άμεσες Συνομιλίες';

  @override
  String get privacyDirectMessagesDescription =>
      'Να επιτρέπονται άμεσες συνομιλίες από άλλα μέλη σε αυτήν την κοινότητα';

  @override
  String get privacyBotDirectMessages => 'Άμεσες Συνομιλίες Bot';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Να επιτρέπονται στα bots από αυτήν την κοινότητα να σας στέλνουν άμεσες συνομιλίες';

  @override
  String get privacyMutualDmsDisabled =>
      'Οι διαχειριστές της κοινότητας έχουν απενεργοποιήσει τη λήψη άμεσων συνομιλιών αποκλειστικά από αμοιβαία μέλη σε αυτήν την κοινότητα.';

  @override
  String get communityDebug => 'Αποσφαλμάτωση Κοινότητας';

  @override
  String get copiedToClipboard => 'Αντιγράφηκε στο πρόχειρο';

  @override
  String get notificationSettings => 'Ρυθμίσεις Ειδοποιήσεων';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Σίγαση $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Η σίγαση μιας κοινότητας αποτρέπει την εμφάνιση ενδείξεων μη αναγνωσμένων και ειδοποιήσεων, εκτός αν σας γίνει αναφορά.';

  @override
  String get notificationCommunitySettings =>
      'Ρυθμίσεις Ειδοποιήσεων Κοινότητας';

  @override
  String get notificationAllMessages => 'Όλα τα Μηνύματα';

  @override
  String get notificationOnlyMentions => 'Μόνο Αναφορές';

  @override
  String get notificationNothing => 'Τίποτα';

  @override
  String get notificationSuppressEveryone => 'Καταστολή @everyone και @here';

  @override
  String get notificationSuppressRoles => 'Καταστολή όλων των @αναφορών ρόλων';

  @override
  String get notificationMobilePush => 'Ειδοποιήσεις push για κινητά';

  @override
  String get notificationOverrides => 'Παρακάμψεις ειδοποιήσεων';

  @override
  String get notificationSelectChannel => 'Επιλογή καναλιού ή κατηγορίας';

  @override
  String get notificationOnlyAtMentions => 'Μόνο @αναφορές';

  @override
  String get notificationMuteChannel => 'Σίγαση καναλιού';

  @override
  String get notificationUnmuteChannel => 'Κατάργηση σίγασης καναλιού';

  @override
  String get notificationUseCategoryDefault => 'Use Category Default';

  @override
  String get notificationUseCommunityDefault => 'Use Community Default';

  @override
  String get notificationNoCategory => 'Χωρίς κατηγορία';

  @override
  String get dmMarkAsRead => 'Σήμανση ως αναγνωσμένο';

  @override
  String get dmMuteConversation => 'Σίγαση απευθείας μηνύματος';

  @override
  String get dmUnmuteConversation => 'Κατάργηση σίγασης απευθείας μηνύματος';

  @override
  String get dmPinDm => 'Καρφίτσωμα απευθείας μηνύματος';

  @override
  String get dmUnpinDm => 'Αποκαρφίτσωμα απευθείας μηνύματος';

  @override
  String get dmAlwaysShowInSidebar => 'Εμφάνιση πάντα στην πλαϊνή μπάρα';

  @override
  String get dmRemoveFromAlwaysShown => 'Αφαίρεση από πάντα εμφανιζόμενα';

  @override
  String get dmCloseDm => 'Κλείσιμο απευθείας μηνύματος';

  @override
  String get dmCloseDmConfirmTitle => 'Κλείσιμο απευθείας μηνύματος';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Είστε σίγουροι ότι θέλετε να κλείσετε το απευθείας μήνυμά σας με τον/την $username; Μπορείτε πάντα να το ανοίξετε ξανά αργότερα.';
  }

  @override
  String get dmDeleteMyMessagesTitle =>
      'Delete your messages in this conversation?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'This will permanently delete every message you have ever sent in this conversation. This cannot be undone.';

  @override
  String get dmCopyChannelId => 'Αντιγραφή αναγνωριστικού καναλιού';

  @override
  String get dmChannelIdCopied => 'Αντιγράφηκε το αναγνωριστικό καναλιού';

  @override
  String get dmCopyUserId => 'Αντιγραφή αναγνωριστικού χρήστη';

  @override
  String get dmUserIdCopied => 'Αντιγράφηκε το αναγνωριστικό χρήστη';

  @override
  String get dmViewProfile => 'Προβολή προφίλ';

  @override
  String get dmVoiceCall => 'Έναρξη φωνητικής κλήσης';

  @override
  String get incomingVoiceCallTitle => 'Εισερχόμενη φωνητική κλήση';

  @override
  String get incomingVoiceCallAccept => 'Απάντηση';

  @override
  String get incomingVoiceCallDecline => 'Απόρριψη';

  @override
  String get incomingVoiceCallLabel => 'Εισερχόμενη κλήση';

  @override
  String get incomingVoiceCallIgnore => 'Αγνόηση';

  @override
  String get directVoiceCallNotEligible =>
      'Αυτή η κλήση δεν μπορεί να ξεκινήσει αυτήν τη στιγμή. Δοκιμάστε ξανά σε λίγο.';

  @override
  String get voiceJoinCallFailed =>
      'Δεν ήταν δυνατή η σύνδεση σε αυτήν την κλήση. Ελέγξτε τη σύνδεσή σας και δοκιμάστε ξανά.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Δεν ήταν δυνατή η συμμετοχή σε αυτήν την κλήση. Ελέγξτε τη σύνδεσή σας και δοκιμάστε ξανά.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Δεν ήταν δυνατή η ενημέρωση αυτής της κλήσης στον διακομιστή. Ελέγξτε τη σύνδεσή σας και δοκιμάστε ξανά.';

  @override
  String get dmAddNote => 'Προσθήκη σημείωσης';

  @override
  String get dmEditGroup => 'Επεξεργασία ομάδας';

  @override
  String get dmInviteToCommunity => 'Πρόσκληση στην κοινότητα';

  @override
  String get dmBlock => 'Αποκλεισμός';

  @override
  String get dmLeaveGroup => 'Έξοδος από την ομάδα';

  @override
  String get dmNoCommunitiesAvailable => 'Δεν υπάρχουν διαθέσιμες κοινότητες';

  @override
  String dmGroupMemberCount(int count) {
    return '$count Μέλη';
  }

  @override
  String get dmMuteFor15Min => 'Για 15 λεπτά';

  @override
  String get dmMuteFor30Min => 'Για 30 λεπτά';

  @override
  String get dmMuteFor1Hour => 'Για 1 ώρα';

  @override
  String get dmMuteFor3Hours => 'Για 3 ώρες';

  @override
  String get dmMuteFor4Hours => 'Για 4 ώρες';

  @override
  String get dmMuteFor8Hours => 'Για 8 ώρες';

  @override
  String get dmMuteFor24Hours => 'Για 24 ώρες';

  @override
  String get dmMuteFor3Days => 'Για 3 ημέρες';

  @override
  String get dmMuteForever => 'Μέχρι να την ενεργοποιήσω ξανά';

  @override
  String get dmPinGroupDm => 'Καρφίτσωμα ομαδικού απευθείας μηνύματος';

  @override
  String get dmUnpinGroupDm => 'Αποκαρφίτσωμα Ομαδικής Συνομιλίας';

  @override
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
  }

  @override
  String get dmFavoriteDm => 'Προσθήκη Συνομιλίας στα Αγαπημένα';

  @override
  String get dmUnfavoriteDm => 'Αφαίρεση Συνομιλίας από τα Αγαπημένα';

  @override
  String get dmFavoriteGroupDm => 'Προσθήκη Ομαδικής Συνομιλίας στα Αγαπημένα';

  @override
  String get dmUnfavoriteGroupDm =>
      'Αφαίρεση Ομαδικής Συνομιλίας από τα Αγαπημένα';

  @override
  String get dmChangeFriendNickname => 'Αλλαγή Ψευδωνύμου Φίλου';

  @override
  String get dmRemoveFriend => 'Αφαίρεση Φίλου';

  @override
  String get dmAddFriend => 'Προσθήκη Φίλου';

  @override
  String get dmAcceptFriendRequest => 'Αποδοχή Αιτήματος Φιλίας';

  @override
  String get dmIgnoreFriendRequest => 'Αγνόηση Αιτήματος Φιλίας';

  @override
  String get dmFriendRequestSent => 'Απεστάλη Αίτημα Φιλίας';

  @override
  String get dmUnblock => 'Ξεμπλοκάρισμα';

  @override
  String get dmDebugUser => 'Εντοπισμός Σφαλμάτων Χρήστη';

  @override
  String get dmDebugChannel => 'Εντοπισμός Σφαλμάτων Καναλιού';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => 'Καρφιτσωμένη Συνομιλία';

  @override
  String get dmUnpinned => 'Ξεκαρφιτσωμένη Συνομιλία';

  @override
  String get dmMuted => 'Σίγαση Συνομιλίας';

  @override
  String get dmUnmuted => 'Επαναφορά Ήχου Συνομιλίας';

  @override
  String get dmRemoveFriendConfirmTitle => 'Αφαίρεση Φίλου';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Είστε σίγουροι ότι θέλετε να αφαιρέσετε τον/την $username ως φίλο/η;';
  }

  @override
  String get dmBlockConfirmTitle => 'Μπλοκάρισμα Χρήστη';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Είστε σίγουροι ότι θέλετε να μπλοκάρετε τον/την $username; Δεν θα μπορεί να σας στείλει μηνύματα ή αιτήματα φιλίας.';
  }

  @override
  String get dmFriendRequestSentToast => 'Το αίτημα φιλίας στάλθηκε';

  @override
  String get dmFriendRequestFailed => 'Αποτυχία αποστολής αιτήματος φιλίας';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Αποτυχία αποδοχής αιτήματος φιλίας';

  @override
  String get dmRemoveFriendFailed => 'Αποτυχία αφαίρεσης φίλου';

  @override
  String get dmBlockFailed => 'Αποτυχία μπλοκαρίσματος χρήστη';

  @override
  String get dmUnblockFailed => 'Αποτυχία ξεμπλοκαρίσματος χρήστη';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Αποτυχία αγνόησης αιτήματος φιλίας';

  @override
  String get dmAddFriends => 'Προσθήκη φίλων';

  @override
  String get addFriendSheetTitle => 'Προσθήκη φίλου';

  @override
  String get addFriendUsernameHint => 'Όνομα χρήστη#0000';

  @override
  String get addFriendUsernameLabel => 'Όνομα χρήστη φίλου';

  @override
  String get addFriendSendRequest => 'Αποστολή αιτήματος';

  @override
  String get addFriendNoUserFound =>
      'Δεν βρέθηκε χρήστης με αυτό το όνομα χρήστη.';

  @override
  String get addFriendInvalidUsername =>
      'Εισαγάγετε έγκυρο όνομα χρήστη (Όνομα χρήστη#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Το αίτημα φιλίας στάλθηκε';

  @override
  String get addFriendClaimTitle => 'Διεκδικήστε τον λογαριασμό σας';

  @override
  String get addFriendClaimDescription =>
      'Διεκδικήστε τον λογαριασμό σας για να στείλετε αιτήματα φιλίας.';

  @override
  String get addFriendVerifyTitle => 'Επαληθεύστε το email σας';

  @override
  String get addFriendVerifyDescription =>
      'Πρέπει να επαληθεύσετε τη διεύθυνση email σας πριν μπορέσετε να στείλετε αιτήματα φιλίας.';

  @override
  String get addFriendVerifyEmail => 'Επαλήθευση email';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Εισερχόμενα αιτήματα φιλίας ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Εξερχόμενα αιτήματα φιλίας ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Εισερχόμενο αίτημα φιλίας';

  @override
  String get addFriendOutgoingStatus => 'Το αίτημα φιλίας στάλθηκε';

  @override
  String get addFriendViewProfile => 'Προβολή προφίλ';

  @override
  String get addFriendAccept => 'Αποδοχή';

  @override
  String get addFriendIgnore => 'Αγνόηση';

  @override
  String get addFriendAcceptTitle => 'Αποδοχή αιτήματος φιλίας';

  @override
  String get addFriendIgnoreTitle => 'Αγνόηση αιτήματος φιλίας';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Να αποδεχτείς το αίτημα φιλίας από τον/την $userName;';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Να αγνοήσεις το αίτημα φιλίας από τον/την $displayName;';
  }

  @override
  String get addFriendCancelRequest => 'Ακύρωση αιτήματος';

  @override
  String get addFriendCancelRequestFailed =>
      'Δεν ήταν δυνατή η ακύρωση του αιτήματος φιλίας. Δοκίμασε ξανά.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Αυτή τη στιγμή δεν δέχονται αιτήματα φιλίας.';

  @override
  String get addFriendUnblockFirst =>
      'Ξεμπλοκάρισέ τους πρώτα για να στείλεις αίτημα φιλίας.';

  @override
  String get addFriendCannotSendToSelf =>
      'Δεν μπορείς να στείλεις αίτημα φιλίας στον εαυτό σου.';

  @override
  String get addFriendAlreadyFriends => 'Είστε ήδη φίλοι με αυτόν τον χρήστη.';

  @override
  String get addFriendClaimToSend =>
      'Ολοκλήρωσε την εγγραφή σου για να στείλεις αιτήματα φιλίας.';

  @override
  String get addFriendVerifyToSend =>
      'Verify your email before sending friend requests.';

  @override
  String get addFriendFriendsListFull =>
      'Your friends list is full, or theirs is. Remove someone and try again.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Σύστημα';

  @override
  String get emojiSearchPlaceholder => 'Βρες το emoji των ονείρων σου';

  @override
  String get emojiSearchEmpty =>
      'Κανένα emoji δεν ταιριάζει με την αναζήτησή σου';

  @override
  String get emojiAutocompleteDefaultLabel => 'Προεπιλεγμένο emoji';

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
  String get emojiFrequentlyUsed => 'Συχνά χρησιμοποιούμενα';

  @override
  String get emojiTabGifs => 'GIF';

  @override
  String get emojiTabMedia => 'Μέσα';

  @override
  String get emojiTabStickers => 'Αυτοκόλλητα';

  @override
  String get emojiTabEmojis => 'Emoji';

  @override
  String get gifPickerSearch => 'Αναζήτηση GIF';

  @override
  String get gifPickerSearchKlipy => 'Αναζήτηση KLIPY';

  @override
  String get gifPickerSearchTenor => 'Αναζήτηση Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Αγαπημένα';

  @override
  String get gifPickerFavoritesEmptyTitle => 'No favorite GIFs yet';

  @override
  String get gifPickerFavoritesEmptyDescription => 'Star a GIF to see it here.';

  @override
  String get gifPickerTrending => 'Δημοφιλή GIF';

  @override
  String get gifPickerNoResultsTitle => 'Δεν βρέθηκαν αποτελέσματα αναζήτησης';

  @override
  String get gifPickerNoResultsDescription =>
      'Δοκιμάστε έναν άλλο όρο αναζήτησης';

  @override
  String get gifPickerLoadFailedTitle => 'Αδυναμία φόρτωσης GIF';

  @override
  String get gifPickerLoadFailedBody =>
      'Ελέγξτε τη σύνδεσή σας και δοκιμάστε ξανά.';

  @override
  String get emojiCategoryPeople => 'Άνθρωποι';

  @override
  String get emojiCategoryNature => 'Φύση';

  @override
  String get emojiCategoryFood => 'Φαγητό & Ποτό';

  @override
  String get emojiCategoryActivity => 'Δραστηριότητες';

  @override
  String get emojiCategoryTravel => 'Ταξίδια & Μέρη';

  @override
  String get emojiCategoryObjects => 'Αντικείμενα';

  @override
  String get emojiCategorySymbols => 'Σύμβολα';

  @override
  String get emojiCategoryFlags => 'Σημαίες';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Ξεκλειδώστε $emojiCount από $communityCount με το Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Λήψη Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Να μην εμφανιστεί ξανά';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count προσαρμοσμένα emoji',
      one: '1 προσαρμοσμένο emoji',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count κοινότητες',
      one: '1 κοινότητα',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Προειδοποίηση εξωτερικού συνδέσμου';

  @override
  String externalLinkWarningLeaving(String productName) {
    return 'Πρόκειται να φύγετε από το $productName';
  }

  @override
  String get externalLinkWarningDescription =>
      'Οι εξωτερικοί σύνδεσμοι μπορεί να είναι επικίνδυνοι. Παρακαλώ προσέξτε.';

  @override
  String get externalLinkWarningDestinationUrl => 'Προορισμός URL:';

  @override
  String get externalLinksSectionTitle => 'Εξωτερικοί σύνδεσμοι';

  @override
  String get externalLinksSectionDescription =>
      'Ρυθμίστε πώς θα γίνεται ο χειρισμός των προειδοποιήσεων εξωτερικών συνδέσμων.';

  @override
  String get externalLinkWarningTrustPrefix => 'Πάντα να εμπιστεύεσαι ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — παράλειψη αυτής της προειδοποίησης την επόμενη φορά';

  @override
  String get externalLinkVisitSite => 'Επίσκεψη στον ιστότοπο';

  @override
  String get externalLinkTrustAllLabel =>
      'Εμπιστεύσου όλους τους εξωτερικούς συνδέσμους';

  @override
  String get externalLinkStripTrackingLabel =>
      'Αφαίρεσε παραμέτρους παρακολούθησης από διευθύνσεις URL';

  @override
  String get externalLinkStripTrackingDescription =>
      'Αφαίρεσε αυτόματα παραμέτρους παρακολούθησης (όπως utm_source, fbclid, gclid) από τις διευθύνσεις URL στα μηνύματα που στέλνεις. Καθαρίζει τον σύνδεσμο πριν φτάσει σε οποιονδήποτε άλλο.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Εμπιστεύεσαι όλους τους εξωτερικούς συνδέσμους;';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Αυτό θα εμπιστευτεί όλους τους εξωτερικούς συνδέσμους και θα παρακάμψει την προειδοποίηση για κάθε τομέα. Οι υπάρχοντες έμπιστοι τομείς σου θα αντικατασταθούν. Αυτό είναι λιγότερο ασφαλές.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Εμπιστεύσου Όλους';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Διακοπή εμπιστοσύνης σε όλους τους συνδέσμους;';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Οι προειδοποιήσεις για εξωτερικούς συνδέσμους θα εμφανίζονται ξανά. Θα χρειαστεί να προσθέσεις έμπιστους τομείς ξεχωριστά.';

  @override
  String get externalLinkStopTrustingAllAction =>
      'Απενεργοποίηση Εμπιστοσύνης σε Όλους';

  @override
  String get externalLinkTrustedAllDescription =>
      'Όλοι οι εξωτερικοί σύνδεσμοι είναι έμπιστοι. Δεν θα εμφανίζονται προειδοποιήσεις.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Έχεις $count έμπιστο(ους) τομέα(εις). Πρόσθεσε περισσότερους επιλέγοντας το πλαίσιο κατά την επίσκεψη σε εξωτερικούς συνδέσμους.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Όταν είναι ενεργοποιημένο, δεν θα εμφανίζονται προειδοποιήσεις για εξωτερικούς συνδέσμους. Αυτό είναι λιγότερο ασφαλές.';

  @override
  String get imageFileTooLarge =>
      'Το αρχείο εικόνας είναι πολύ μεγάλο. Επιλέξτε ένα αρχείο μικρότερο από 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Τα κινούμενα avatar απαιτούν Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Οι κινούμενες κορδέλες απαιτούν Plutonium';

  @override
  String get animatedAvifNotSupported => 'Δεν υποστηρίζονται κινούμενα AVIF';

  @override
  String get animatedAvifNotSupportedBody =>
      'Η περικοπή και η περιστροφή κινούμενων αρχείων AVIF δεν υποστηρίζονται ακόμη. Αν προχωρήσεις, θα μεταφορτωθεί στην αρχική του μορφή.';

  @override
  String get uploadAsIs => 'Μεταφόρτωση ως έχει';

  @override
  String get croppingAnimatedNotSupported =>
      'Η περικοπή κινούμενων εικόνων δεν υποστηρίζεται ακόμη. Θα χρησιμοποιηθεί η αρχική μεταφόρτωση.';

  @override
  String get cropAvatar => 'Περικοπή Avatar';

  @override
  String get cropBanner => 'Περικοπή Κορδέλας';

  @override
  String get skip => 'Παράλειψη';

  @override
  String get crop => 'Περικοπή';

  @override
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => 'Αλλαγή του Όνομα χρήστη σου';

  @override
  String get fluxerTagInputLabel => 'Όνομα χρήστη';

  @override
  String get fluxerTagDescriptionBase =>
      'Τα ονόματα χρήστη μπορούν να περιέχουν μόνο γράμματα (a-z, A-Z), αριθμούς (0-9) και κάτω παύλες. Τα ονόματα χρήστη δεν λαμβάνουν υπόψη πεζά/κεφαλαία.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Τα ονόματα χρήστη μπορούν να περιέχουν μόνο γράμματα (a-z, A-Z), αριθμούς (0-9) και κάτω παύλες. Τα ονόματα χρήστη δεν λαμβάνουν υπόψη πεζά/κεφαλαία. Μπορείς να επιλέξεις οποιοδήποτε διαθέσιμο 4ψήφιο tag από #0000 έως #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Τα ονόματα χρήστη μπορούν να περιέχουν μόνο γράμματα (a-z, A-Z), αριθμούς (0-9) και κάτω παύλες. Τα ονόματα χρήστη δεν λαμβάνουν υπόψη πεζά/κεφαλαία. Μπορείς να επιλέξεις οποιοδήποτε διαθέσιμο 4ψήφιο tag από #0001 έως #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Μεταξύ $min και $max χαρακτήρων';
  }

  @override
  String get validationAllowedChars =>
      'Μόνο γράμματα (a-z, A-Z), αριθμοί (0-9) και κάτω παύλες (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Απόκτησε Plutonium για να προσαρμόσεις το tag σου ή κράτησέ το όταν αλλάζεις το όνομα χρήστη σου';

  @override
  String get fluxerTagAlreadyTaken => 'Το Όνομα χρήστη έχει ήδη ληφθεί';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Το Όνομα χρήστη $username#$discriminator έχει ήδη ληφθεί. Η συνέχιση θα επαναφέρει αυτόματα τον διακριτικό σου αριθμό.';
  }

  @override
  String get customTagIsTemporary => 'Το προσαρμοσμένο tag είναι προσωρινό';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Το προσαρμοσμένο 4ψήφιο tag σου είναι διαθέσιμο μόνο όσο η συνδρομή σου Plutonium είναι ενεργή. Όταν η συνδρομή σου λήξει στις $date, το tag σου θα επανέλθει σε έναν τυχαία εκχωρημένο αριθμό μετά από μια περίοδο χάριτος 3 ημερών.';
  }

  @override
  String get customTagTemporaryBody =>
      'Το προσαρμοσμένο 4ψήφιο tag σου είναι διαθέσιμο μόνο όσο η συνδρομή σου Plutonium είναι ενεργή. Όταν η συνδρομή σου λήξει, το tag σου θα επανέλθει σε έναν τυχαία εκχωρημένο αριθμό μετά από μια περίοδο χάριτος 3 ημερών.';

  @override
  String get iUnderstandContinue => 'Το καταλαβαίνω, Συνέχεια';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Αν αποθηκεύσεις αυτό το Όνομα χρήστη, το προσαρμοσμένο 4ψήφιο tag σου θα επανέλθει σε έναν τυχαίο αριθμό όταν λήξει η συνδρομή σου Plutonium. Αν η συνδρομή σου δεν ανανεωθεί, θα έχεις μια περίοδο χάριτος 3 ημερών πριν αλλάξει το tag.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Το προσαρμοσμένο 4ψήφιο tag σου (#$discriminator) είναι ενεργό όσο η συνδρομή σου Plutonium είναι ενεργή. Αν η συνδρομή σου λήξει ή δεν ανανεωθεί μετά από μια περίοδο χάριτος 3 ημερών, το tag σου θα επανέλθει σε έναν τυχαίο αριθμό.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Προσάρμοσε το 4ψήφιο tag σου ή κράτησέ το όταν αλλάζεις το όνομα χρήστη σου';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Η δοκιμαστική περίοδος Plutonium σου λήγει στις $date. Αναβάθμισε για να κρατήσεις το προσαρμοσμένο tag σου και να κερδίσεις ένα σήμα στο προφίλ σου.';
  }

  @override
  String get premiumTrialActive =>
      'Είσαι σε δοκιμαστική περίοδο Plutonium. Αναβάθμισε για να κρατήσεις το προσαρμοσμένο tag σου και να κερδίσεις ένα σήμα στο προφίλ σου.';

  @override
  String get fluxerTagUpdated => 'Το Όνομα χρήστη ενημερώθηκε';

  @override
  String get fluxerTagUpdateFailed =>
      'Αποτυχία ενημέρωσης του Όνομα χρήστη. Προσπάθησε ξανά.';

  @override
  String get continueAction => 'Συνέχεια';

  @override
  String get profileCustomizationTitle => 'Προσαρμογή Προφίλ';

  @override
  String get profileCustomizationDescription =>
      'Επεξεργάσου την εμφάνιση του προφίλ σου και δες μια ζωντανή προεπισκόπηση';

  @override
  String get usernameLabel => 'Όνομα χρήστη';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Διεκδίκησε τον λογαριασμό σου για να αλλάξεις το Όνομα χρήστη σου';

  @override
  String get changeFluxerTag => 'Αλλαγή Όνομα χρήστη';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Προσαρμόστε την 4ψήφια ετικέτα σας (#$discriminator) όπως θέλετε με το Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Αλλαγή του ονόματος χρήστη και της 4ψήφιας ετικέτας σας';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Η προσαρμοσμένη ετικέτα σας (#$discriminator) συνδέεται με τη συνδρομή σας Plutonium και θα επανέλθει σε τυχαία ετικέτα αν λήξει.';
  }

  @override
  String get displayNameLabel => 'Εμφανιζόμενο Όνομα';

  @override
  String get pronounsLabel => 'Αντωνυμίες';

  @override
  String get avatarLabel => 'Προφίλ Εικόνας';

  @override
  String get changeAvatar => 'Αλλαγή Εικόνας Προφίλ';

  @override
  String get removeAvatar => 'Αφαίρεση Εικόνας Προφίλ';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Μέγιστο 10MB. Συνιστάται: 512×512px';

  @override
  String get bannerLabel => 'Εικόνα Εξωφύλλου';

  @override
  String get changeBanner => 'Αλλαγή Εικόνας Εξωφύλλου';

  @override
  String get removeBanner => 'Αφαίρεση Εικόνας Εξωφύλλου';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Μέγιστο 10MB. Ελάχιστο: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Χρώμα Έμφασης';

  @override
  String get accentColorDescription =>
      'Προσαρμόζει το περίγραμμα και το χρώμα του εξωφύλλου στο προφίλ σας';

  @override
  String get aboutMeLabel => 'Σχετικά με εμένα';

  @override
  String get aboutMeHelperText =>
      'Μπορείτε να χρησιμοποιήσετε συνδέσμους, emoji και Markdown.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle => 'Απόρρητο Σήματος Plutonium';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Ελέγξτε πώς εμφανίζεται το σήμα Plutonium σας σε άλλους';

  @override
  String get hidePlutoniumBadgeLabel => 'Απόκρυψη σήματος Plutonium εντελώς';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Αποκρύψτε πλήρως το σήμα Plutonium σας από άλλους χρήστες';

  @override
  String get hidePlutoniumPurchaseDate =>
      'Απόκρυψη ημερομηνίας αγοράς Plutonium';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Απόκρυψη ημερομηνίας αγοράς Plutonium ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Αφαιρέστε την ημερομηνία πρώτης αγοράς Plutonium από το σήμα σας';

  @override
  String get maskVisionaryAsSubscription => 'Απόκρυψη Visionary ως συνδρομή';

  @override
  String get maskVisionaryDescription =>
      'Εμφάνιση του Visionary σας ως κανονική συνδρομή';

  @override
  String get hideVisionaryIdBadge => 'Απόκρυψη σήματος ID Visionary';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Απόκρυψη σήματος ID Visionary (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Αφαιρέστε το σήμα ID Visionary σας';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Βρίσκεστε σε δοκιμαστική περίοδο Plutonium — η συνδρομή σας ξεκινά στις $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Η συνδρομή σας θα ξεκινήσει αυτόματα όταν λήξει η δοκιμαστική περίοδος. Δεν απαιτείται καμία ενέργεια.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Βρίσκεστε σε δοκιμαστική περίοδο Plutonium που λήγει στις $date';
  }

  @override
  String get premiumTrialActiveProfile =>
      'Βρίσκεστε σε δοκιμαστική περίοδο Plutonium';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Μέγιστο 10MB. Συνιστάται: 512×512px. Οι κινούμενες εικόνες προφίλ (GIF) απαιτούν Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Προσαρμόστε το προφίλ σας με μια στατική ή κινούμενη εικόνα εξωφύλλου για να ξεχωρίζει.';

  @override
  String get getPlutonium => 'Αποκτήστε Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Οι αγορές εντός εφαρμογής δεν είναι ακόμη διαθέσιμες σε αυτήν την πλατφόρμα. Μείνετε συντονισμένοι — έρχεται σύντομα!';

  @override
  String get profilePreviewLabel => 'Προεπισκόπηση';

  @override
  String get profilePreviewMessage => 'Μήνυμα';

  @override
  String profilePreviewMemberSince(String productName) {
    return 'Μέλος $productName από';
  }

  @override
  String get unclaimedAccountTitle => 'Μη διεκδικημένος Λογαριασμός';

  @override
  String get unclaimedAccountDescription =>
      'Ο λογαριασμός σας δεν έχει διεκδικηθεί ακόμη. Χωρίς email και κωδικό πρόσβασης, μπορεί να χάσετε την πρόσβαση. Διεκδικήστε τον λογαριασμό σας τώρα για να τον ασφαλίσετε.';

  @override
  String get claimAccount => 'Διεκδίκηση Λογαριασμού';

  @override
  String get profileTypeLabel => 'Τύπος Προφίλ';

  @override
  String get profileTypeGlobal => 'Καθολικό Προφίλ';

  @override
  String get profileTypeGuildDescription =>
      'Επεξεργάζεστε το προφίλ σας ανά κοινότητα. Αυτό το προφίλ θα είναι ορατό μόνο σε αυτήν την κοινότητα και θα αντικαταστήσει το καθολικό σας προφίλ.';

  @override
  String get communityNicknameLabel => 'Ψευδώνυμο Κοινότητας';

  @override
  String get perGuildPremiumUpsellText =>
      'Η προσαρμογή του avatar, του banner, του χρώματος τόνου και της περιγραφής σας για μεμονωμένες κοινότητες απαιτεί Plutonium. Το ψευδώνυμο και οι αντωνυμίες της κοινότητας είναι δωρεάν για όλους.';

  @override
  String get avatarModeInherit => 'Χρήση καθολικού προφίλ';

  @override
  String get avatarModeCustom => 'Χρήση προσαρμοσμένης εικόνας';

  @override
  String get avatarModeUnset => 'Να μην εμφανίζεται';

  @override
  String get profileSavedToast => 'Το προφίλ ενημερώθηκε';

  @override
  String get profileEditButton => 'Επεξεργασία προφίλ';

  @override
  String get profileNoteLabel => 'Σημείωση';

  @override
  String get profileNoteVisibility => '(ορατό μόνο σε εσάς)';

  @override
  String get profileNoteEmpty => 'Δεν υπάρχει ακόμη σημείωση.';

  @override
  String get sudoTitle => 'Επαληθεύστε την ταυτότητά σας';

  @override
  String get sudoDescription =>
      'Αυτή η ενέργεια απαιτεί επαλήθευση για να συνεχιστεί.';

  @override
  String get sudoAuthenticatorCode => 'Κωδικός ελέγχου ταυτότητας';

  @override
  String get sudoMethodPassword => 'Κωδικός πρόσβασης';

  @override
  String get sudoMethodTotp => 'Έλεγχος ταυτότητας';

  @override
  String get sudoVerificationFailed => 'Η επαλήθευση απέτυχε. Δοκιμάστε ξανά.';

  @override
  String get securityAccountTitle => 'Λογαριασμός';

  @override
  String get securityAccountDescription =>
      'Διαχειριστείτε το email, τον κωδικό πρόσβασης και τις ρυθμίσεις του λογαριασμού σας';

  @override
  String get securitySectionTitle => 'Ασφάλεια';

  @override
  String get securitySectionDescription =>
      'Προστατέψτε τον λογαριασμό σας με έλεγχο ταυτότητας δύο παραγόντων και κλειδιά πρόσβασης';

  @override
  String get securityLoginEmailSectionTitle => 'Ρυθμίσεις email';

  @override
  String securityLoginEmailSectionDescription(String productName) {
    return 'Διαχειριστείτε τη διεύθυνση email που χρησιμοποιείτε για να συνδεθείτε στο $productName';
  }

  @override
  String get securityLoginEmailAddressLabel => 'Διεύθυνση email';

  @override
  String get securityLoginNoEmailSet => 'Δεν έχει οριστεί διεύθυνση email';

  @override
  String get securityLoginChangeEmail => 'Αλλαγή email';

  @override
  String get securityLoginAddEmail => 'Προσθήκη email';

  @override
  String get securityLoginReveal => 'Εμφάνιση';

  @override
  String get securityLoginHide => 'Απόκρυψη';

  @override
  String get securityLoginPasswordSectionTitle => 'Κωδικός πρόσβασης';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Αλλάξτε τον κωδικό πρόσβασής σας για να διατηρήσετε τον λογαριασμό σας ασφαλή';

  @override
  String get securityLoginCurrentPasswordLabel => 'Τρέχων κωδικός πρόσβασης';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Τελευταία αλλαγή: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Τελευταία αλλαγή: Ποτέ';

  @override
  String get securityLoginNoPasswordSet => 'Δεν έχει οριστεί κωδικός πρόσβασης';

  @override
  String get securityLoginChangePassword => 'Αλλαγή κωδικού πρόσβασης';

  @override
  String get securityLoginSetPassword => 'Ορισμός κωδικού πρόσβασης';

  @override
  String get passwordChangeTitle => 'Αλλαγή κωδικού πρόσβασης';

  @override
  String get passwordChangeIntroDescription =>
      'Θα στείλουμε έναν κωδικό επαλήθευσης στη διεύθυνση email σας για να επιβεβαιώσουμε την ταυτότητά σας πριν αλλάξετε τον κωδικό πρόσβασής σας.';

  @override
  String get passwordChangeStart => 'Έναρξη';

  @override
  String get passwordChangeVerifyTitle => 'Επαληθεύστε το email σας';

  @override
  String get passwordChangeVerifyDescription =>
      'Εισαγάγετε τον κωδικό επαλήθευσης που στάλθηκε στη διεύθυνση email σας.';

  @override
  String get passwordChangeVerificationCode => 'Κωδικός επαλήθευσης';

  @override
  String get passwordChangeVerify => 'Επαλήθευση';

  @override
  String get passwordChangeNewPasswordTitle => 'Ορισμός νέου κωδικού πρόσβασης';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Εισαγάγετε τον νέο κωδικό πρόσβασής σας παρακάτω.';

  @override
  String get passwordChangeNewPassword => 'Νέος κωδικός πρόσβασης';

  @override
  String get passwordChangeConfirmPassword =>
      'Επιβεβαίωση νέου κωδικού πρόσβασης';

  @override
  String get passwordChangeSubmit => 'Αλλαγή κωδικού πρόσβασης';

  @override
  String get passwordChangeSuccess => 'Ο κωδικός πρόσβασης άλλαξε';

  @override
  String get passwordChangePasswordsDoNotMatch =>
      'Οι κωδικοί πρόσβασης δεν ταιριάζουν';

  @override
  String get passwordChangeInvalidCode => 'Μη έγκυρος ή ληγμένος κωδικός';

  @override
  String get emailChangeTitle => 'Αλλαγή Email';

  @override
  String get emailChangeIntroDescription =>
      'Θα στείλουμε κωδικούς επαλήθευσης για να επιβεβαιώσουμε την ταυτότητά σας πριν αλλάξετε τη διεύθυνση email σας.';

  @override
  String get emailChangeStart => 'Έναρξη';

  @override
  String get emailChangeVerifyOriginalTitle => 'Επαλήθευση Τρέχοντος Email';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Εισαγάγετε τον κωδικό επαλήθευσης που στάλθηκε στην τρέχουσα διεύθυνση email σας.';

  @override
  String get emailChangeNewEmailTitle => 'Εισαγωγή Νέου Email';

  @override
  String get emailChangeNewEmailDescription =>
      'Εισαγάγετε τη νέα διεύθυνση email που θέλετε να χρησιμοποιήσετε.';

  @override
  String get emailChangeNewEmailLabel => 'Νέο Email';

  @override
  String get emailChangeNewEmailSubmit => 'Αποστολή Κωδικού Επαλήθευσης';

  @override
  String get emailChangeVerifyNewTitle => 'Επαλήθευση Νέου Email';

  @override
  String get emailChangeVerifyNewDescription =>
      'Εισαγάγετε τον κωδικό επαλήθευσης που στάλθηκε στη νέα διεύθυνση email σας.';

  @override
  String get emailChangeSuccess => 'Το email άλλαξε';

  @override
  String get emailChangeInvalidCode => 'Μη έγκυρος ή ληγμένος κωδικός';

  @override
  String get resend => 'Επαναποστολή';

  @override
  String resendCountdown(int seconds) {
    return 'Επαναποστολή ($seconds δευτ.)';
  }

  @override
  String get verificationCode => 'Κωδικός Επαλήθευσης';

  @override
  String get verify => 'Επαλήθευση';

  @override
  String get enable => 'Ενεργοποίηση';

  @override
  String get disable => 'Απενεργοποίηση';

  @override
  String get delete => 'Διαγραφή';

  @override
  String get save => 'Αποθήκευση';

  @override
  String get securityTfaSectionTitle => 'Έλεγχος Ταυτότητας Δύο Παραγόντων';

  @override
  String get securityTfaSectionDescription =>
      'Προσθέστε ένα επιπλέον επίπεδο ασφάλειας στον λογαριασμό σας';

  @override
  String get securityTfaAuthenticatorApp => 'Εφαρμογή Επαλήθευσης';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Ο έλεγχος ταυτότητας δύο παραγόντων είναι ενεργοποιημένος';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Χρησιμοποιήστε μια εφαρμογή επαλήθευσης για τη δημιουργία κωδικών για τον έλεγχο ταυτότητας δύο παραγόντων';

  @override
  String get securityTfaBackupCodes => 'Κωδικοί Εφεδρείας';

  @override
  String get securityTfaBackupCodesDescription =>
      'Προβολή και διαχείριση των κωδικών εφεδρείας σας για ανάκτηση λογαριασμού';

  @override
  String get securityTfaViewCodes => 'Προβολή Κωδικών';

  @override
  String get securityPasskeysSectionTitle => 'Κλειδιά Πρόσβασης';

  @override
  String get securityPasskeysSectionDescription =>
      'Χρησιμοποιήστε κλειδιά πρόσβασης για σύνδεση χωρίς κωδικό πρόσβασης και έλεγχο ταυτότητας δύο παραγόντων';

  @override
  String get securityPasskeysRegistered => 'Καταχωρημένα Κλειδιά Πρόσβασης';

  @override
  String get securityPasskeysNone => 'Δεν έχουν καταχωρηθεί κλειδιά πρόσβασης';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'κλειδιά πρόσβασης',
      one: 'κλειδί πρόσβασης',
    );
    return '$count $_temp0 καταχωρημένα (μέγιστο 10)';
  }

  @override
  String get securityPasskeysAdd => 'Προσθήκη Κλειδιού Πρόσβασης';

  @override
  String securityPasskeysAdded(String date) {
    return 'Προστέθηκε: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Τελευταία χρήση: $date';
  }

  @override
  String get securityPasskeysRename => 'Μετονομασία';

  @override
  String get securityPasskeysDeleteTitle => 'Διαγραφή Κλειδιού Πρόσβασης';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Είστε σίγουροι ότι θέλετε να διαγράψετε το κλειδί πρόσβασης \"$name\";';
  }

  @override
  String get securityPasskeyNameTitle => 'Ονομασία Κλειδιού Πρόσβασης';

  @override
  String get securityPasskeyNameLabel => 'Όνομα Κλειδιού Πρόσβασης';

  @override
  String get securityPasskeyNameHint =>
      'π.χ. YubiKey, iPhone, Υπολογιστής Εργασίας';

  @override
  String get securityPhoneSectionTitle => 'Αριθμός Τηλεφώνου';

  @override
  String get securityPhoneSectionDescription =>
      'Διαχειριστείτε τον αριθμό τηλεφώνου σας.';

  @override
  String get securityPhoneLabel => 'Αριθμός Τηλεφώνου';

  @override
  String get securityPhoneNone => 'Δεν έχει προστεθεί αριθμός τηλεφώνου.';

  @override
  String get securityPhoneAdd => 'Προσθήκη Τηλεφώνου';

  @override
  String get securityPhoneRemove => 'Αφαίρεση';

  @override
  String get securityPhoneRemoveTitle => 'Αφαίρεση Αριθμού Τηλεφώνου';

  @override
  String get securityPhoneRemoveDescription =>
      'Είστε σίγουροι ότι θέλετε να αφαιρέσετε τον αριθμό τηλεφώνου σας;';

  @override
  String get securityPhoneRemoved => 'Ο αριθμός τηλεφώνου αφαιρέθηκε';

  @override
  String get securityClaimTitle => 'Λειτουργίες Ασφαλείας';

  @override
  String get securityClaimDescription =>
      'Διεκδικήστε τον λογαριασμό σας για να αποκτήσετε πρόσβαση σε λειτουργίες ασφαλείας, όπως ο έλεγχος ταυτότητας δύο παραγόντων και τα κλειδιά πρόσβασης.';

  @override
  String get securityVerifyEmailRequired =>
      'Πρέπει να επαληθεύσετε τη διεύθυνση email σας πριν μπορέσετε να ρυθμίσετε τον έλεγχο ταυτότητας δύο παραγόντων, τα κλειδιά πρόσβασης ή την επαλήθευση μέσω SMS.';

  @override
  String get totpEnableTitle => 'Ρύθμιση Εφαρμογής Επαλήθευσης';

  @override
  String get totpEnableDescription =>
      'Σαρώστε τον κωδικό QR με την εφαρμογή επαλήθευσης για να δημιουργήσετε κωδικούς για τον έλεγχο ταυτότητας δύο παραγόντων.';

  @override
  String get totpEnableCodeLabel => 'Κωδικός';

  @override
  String get totpEnableCodeHint =>
      'Εισαγάγετε τον 6ψήφιο κωδικό από την εφαρμογή επαλήθευσης';

  @override
  String get totpEnableSuccess =>
      'Ο έλεγχος ταυτότητας δύο παραγόντων έχει ενεργοποιηθεί';

  @override
  String get totpDisableTitle => 'Αφαίρεση Εφαρμογής Επαλήθευσης';

  @override
  String get totpDisableDescription =>
      'Εισαγάγετε τον 6ψήφιο κωδικό από την εφαρμογή επαλήθευσης για να απενεργοποιήσετε τον έλεγχο ταυτότητας δύο παραγόντων.';

  @override
  String get totpDisableSuccess =>
      'Ο έλεγχος ταυτότητας δύο παραγόντων απενεργοποιήθηκε';

  @override
  String get backupCodesTitle => 'Κωδικοί Εφεδρείας';

  @override
  String get backupCodesWarning =>
      'Αν χάσετε την πρόσβαση στην εφαρμογή επαλήθευσης και δεν έχετε αυτούς τους κωδικούς, θα αποκλειστείτε μόνιμα από τον λογαριασμό σας. Κατεβάστε ή αντιγράψτε τους τώρα και αποθηκεύστε τους κάπου με ασφάλεια.';

  @override
  String get backupCodesDownload => 'Λήψη';

  @override
  String get backupCodesCopy => 'Αντιγραφή';

  @override
  String get backupCodesCopied =>
      'Οι κωδικοί εφεδρείας αντιγράφηκαν στο πρόχειρο';

  @override
  String get backupCodesAcknowledge =>
      'Έχω κατεβάσει ή αντιγράψει τους κωδικούς εφεδρείας μου και τους έχω αποθηκεύσει σε ασφαλές μέρος.';

  @override
  String get backupCodesDone => 'Έγινε';

  @override
  String get backupCodesViewTitle => 'Προβολή Κωδικών Εφεδρείας';

  @override
  String get backupCodesViewDescription =>
      'Ενδέχεται να απαιτείται επαλήθευση πριν από την προβολή των κωδικών εφεδρείας σας.';

  @override
  String get phoneAddTitle => 'Προσθήκη Αριθμού Τηλεφώνου';

  @override
  String get phoneAddLabel => 'Αριθμός Τηλεφώνου';

  @override
  String get phoneAddHint => 'Εισαγάγετε τον αριθμό τηλεφώνου σας';

  @override
  String get phoneAddFooter =>
      'Εισαγάγετε τον αριθμό τηλεφώνου σας. Θα σας στείλουμε έναν κωδικό επαλήθευσης μέσω SMS.';

  @override
  String get phoneAddSendCode => 'Αποστολή Κωδικού';

  @override
  String get phoneVerifyTitle => 'Επαλήθευση Αριθμού Τηλεφώνου';

  @override
  String get phoneVerifyDescription =>
      'Εισαγάγετε τον κωδικό επαλήθευσης που στάλθηκε στον αριθμό τηλεφώνου σας.';

  @override
  String get phoneAddSuccess => 'Ο αριθμός τηλεφώνου προστέθηκε';

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
  String get dangerZoneSectionTitle => 'Ζώνη Κινδύνου';

  @override
  String get dangerZoneSectionDescription =>
      'Μη αναστρέψιμες και καταστροφικές ενέργειες';

  @override
  String get dangerZoneDisableTitle => 'Απενεργοποίηση Λογαριασμού';

  @override
  String get dangerZoneDisableDescription =>
      'Απενεργοποιήστε προσωρινά τον λογαριασμό σας. Μπορείτε να τον ενεργοποιήσετε ξανά αργότερα, κάνοντας ξανά είσοδο.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Η απενεργοποίηση του λογαριασμού σας θα σας αποσυνδέσει από όλες τις συνεδρίες. Μπορείτε να ενεργοποιήσετε ξανά τον λογαριασμό σας οποιαδήποτε στιγμή κάνοντας ξανά είσοδο.';

  @override
  String get dangerZoneDeleteTitle => 'Διαγραφή Λογαριασμού';

  @override
  String get dangerZoneDeleteDescription =>
      'Διαγράψτε μόνιμα τον λογαριασμό σας και όλα τα σχετικά δεδομένα. Αυτή η ενέργεια δεν μπορεί να αναιρεθεί.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Ακυρώστε την ενεργή συνδρομή σας στο Plutonium στις ρυθμίσεις του Plutonium πριν διαγράψετε τον λογαριασμό σας.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount =>
      'Αδυναμία διαγραφής λογαριασμού';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Δεν μπορείτε να διαγράψετε τον λογαριασμό σας ενώ είστε κάτοχος κοινοτήτων. Μεταφέρετε πρώτα την ιδιοκτησία των ακόλουθων κοινοτήτων:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'και $count ακόμη';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Για να μεταφέρετε την ιδιοκτησία, μεταβείτε στο $settingsPath και χρησιμοποιήστε την επιλογή μεταφοράς ιδιοκτησίας.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Είστε σίγουροι ότι θέλετε να διαγράψετε τον λογαριασμό σας; Αυτή η ενέργεια θα προγραμματίσει τον λογαριασμό σας για μόνιμη διαγραφή.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Μπορείτε να ακυρώσετε τη διαδικασία διαγραφής εντός 14 ημερών';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Μετά από 14 ημέρες, ο λογαριασμός σας θα διαγραφεί μόνιμα';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Μόλις ολοκληρωθεί η διαγραφή, δεν μπορείτε να ανακτήσετε την πρόσβαση στον λογαριασμό σας';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Δεν θα μπορείτε να διαγράψετε τα μηνύματά σας μετά τη διαγραφή του λογαριασμού σας';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Αν θέλετε να εξάγετε τα δεδομένα σας ή να διαγράψετε πρώτα τα μηνύματά σας, επισκεφθείτε την ενότητα Πίνακας Ελέγχου Απορρήτου στις Ρυθμίσεις Χρήστη πριν προχωρήσετε.';

  @override
  String get claimAccountTitle => 'Διεκδίκηση Λογαριασμού';

  @override
  String get claimAccountDescription =>
      'Διεκδικήστε τον λογαριασμό σας προσθέτοντας ένα email και έναν κωδικό πρόσβασης. Θα σας στείλουμε έναν κωδικό επαλήθευσης για να επιβεβαιώσετε το email σας πριν ολοκληρωθεί.';

  @override
  String get claimAccountEmailLabel => 'Διεύθυνση Email';

  @override
  String get claimAccountPasswordLabel => 'Κωδικός πρόσβασης';

  @override
  String get claimAccountSendCode => 'Αποστολή κωδικού';

  @override
  String get claimAccountVerifyDescription =>
      'Εισαγάγετε τον κωδικό που στείλαμε στο email σας για να το επαληθεύσετε. Ο κωδικός πρόσβασής σας θα οριστεί μόλις επιβεβαιωθεί ο κωδικός.';

  @override
  String get claimAccountSuccess => 'Ο λογαριασμός διεκδικήθηκε με επιτυχία';

  @override
  String get importantInformation => 'Σημαντικές πληροφορίες:';

  @override
  String get genericError => 'Προέκυψε ένα σφάλμα';

  @override
  String get networkErrorMessage => 'Something went wrong. Please try again.';

  @override
  String get invalidCode => 'Μη έγκυρος κωδικός';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'πριν από $count χρόνια',
      one: 'πριν από 1 χρόνο',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'πριν από $count μήνες',
      one: 'πριν από 1 μήνα',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'πριν από $count ημέρες',
      one: 'πριν από 1 ημέρα',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'πριν από $count ώρες',
      one: 'πριν από 1 ώρα',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'πριν από $count λεπτά',
      one: 'πριν από 1 λεπτό',
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
  String get relativeTimeJustNow => 'μόλις τώρα';

  @override
  String get authorizedAppsTitle => 'Εξουσιοδοτημένες Εφαρμογές';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Αυτές οι εφαρμογές έχουν λάβει πρόσβαση στον λογαριασμό σας $productName.';
  }

  @override
  String get authorizedAppsEmptyTitle =>
      'Δεν υπάρχουν Εξουσιοδοτημένες Εφαρμογές';

  @override
  String get authorizedAppsEmptyDescription =>
      'Δεν έχετε εξουσιοδοτήσει καμία εφαρμογή να έχει πρόσβαση στον λογαριασμό σας.';

  @override
  String get authorizedAppsLoadError =>
      'Αδυναμία Φόρτωσης Εξουσιοδοτημένων Εφαρμογών';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Εξουσιοδοτήθηκε στις $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Παραχωρημένες άδειες';

  @override
  String get authorizedAppsRevoke => 'Ανάκληση';

  @override
  String get authorizedAppsRevokeTitle => 'Ανάκληση πρόσβασης εφαρμογής';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Είστε σίγουροι ότι θέλετε να ανακαλέσετε την πρόσβαση για το $appName; Αυτή η εφαρμογή δεν θα έχει πλέον πρόσβαση στον λογαριασμό σας.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Πρόσβαση στις βασικές πληροφορίες του προφίλ σας (όνομα χρήστη, avatar κ.λπ.)';

  @override
  String get authorizedAppsScopeEmail => 'Προβολή της διεύθυνσης email σας';

  @override
  String get authorizedAppsScopeGuilds =>
      'Προβολή των κοινοτήτων στις οποίες είστε μέλος';

  @override
  String get authorizedAppsScopeConnections =>
      'Προβολή των συνδεδεμένων λογαριασμών σας';

  @override
  String get authorizedAppsScopeBot =>
      'Προσθήκη ενός bot σε μια κοινότητα με τα ζητούμενα δικαιώματα';

  @override
  String get authorizedAppsScopeAdmin =>
      'Πρόσβαση σε διαχειριστικά σημεία πρόσβασης';

  @override
  String get privacyPendingDeletionTitle => 'Αναμονή Διαγραφής';

  @override
  String get blockedUsersTitle => 'Αποκλεισμένοι Χρήστες';

  @override
  String get blockedUsersDescription =>
      'Οι αποκλεισμένοι χρήστες δεν μπορούν να σας στείλουν αιτήματα φιλίας ή να σας στείλουν απευθείας μηνύματα.';

  @override
  String get blockedUsersEmptyTitle => 'Δεν υπάρχουν Αποκλεισμένοι Χρήστες';

  @override
  String get blockedUsersEmptyDescription =>
      'Δεν έχετε αποκλείσει κανέναν ακόμα.';

  @override
  String get blockedUsersLoadError => 'Αδυναμία Φόρτωσης Αποκλεισμένων Χρηστών';

  @override
  String get blockedUsersUnblock => 'Αποκλεισμός';

  @override
  String get blockedUsersUnblockTitle => 'Αποκλεισμός Χρήστη';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Είστε σίγουροι ότι θέλετε να αποκλείσετε τον $username;';
  }

  @override
  String get blockedUsersCopyTag => 'Αντιγραφή Όνομα χρήστη';

  @override
  String get blockedUsersCopyId => 'Αντιγραφή ID Χρήστη';

  @override
  String get userProfileLoadError => 'Αδυναμία φόρτωσης προφίλ';

  @override
  String get userProfileLoading => 'Loading profile';

  @override
  String get userProfileRetry => 'Δοκιμάστε ξανά';

  @override
  String get userProfileMessage => 'Μήνυμα';

  @override
  String get userProfileVoiceCall => 'Φωνητική Κλήση';

  @override
  String get userProfileVideoCall => 'Βιντεοκλήση';

  @override
  String get userProfileEditProfile => 'Επεξεργασία Προφίλ';

  @override
  String userProfileStaffBadgeTooltip(String productName) {
    return 'Προσωπικό $productName';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return 'Ομάδα Κοινότητας $productName';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return 'Συνεργάτης $productName';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return 'Κυνηγός Σφαλμάτων $productName';
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
    return 'Συνδρομητής $productName Plutonium από $date';
  }

  @override
  String userProfileVisionaryBadgeTooltip(String productName) {
    return '$productName Visionary';
  }

  @override
  String userProfileVisionaryBadgeSinceTooltip(
    String productName,
    String date,
  ) {
    return '$productName Visionary από $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'Αναγνωριστικό Visionary #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Κοινοί Φίλοι ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Κοινές Κοινότητες ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Κοινοί Φίλοι';

  @override
  String get userProfileMutualCommunitiesTitle => 'Κοινές Κοινότητες';

  @override
  String get userProfileNoMutualFriends => 'Δεν βρέθηκαν κοινοί φίλοι.';

  @override
  String get userProfileNoMutualCommunities =>
      'Δεν βρέθηκαν κοινές κοινότητες.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Ψευδώνυμο: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Άνοιγμα Άμεσου Μηνύματος';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Μπλοκάρατε τον χρήστη $username. Δεν θα μπορείτε να στείλετε μηνύματα εκτός αν τον ξεμπλοκάρετε.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Ξεμπλοκάρισμα';

  @override
  String get userProfileOpenDm => 'Άνοιγμα Άμεσου Μηνύματος';

  @override
  String get userProfileNoteTitle => 'Σημείωση';

  @override
  String get userProfileNoteVisibility => '(ορατό μόνο σε εσάς)';

  @override
  String get userProfileNoteSave => 'Αποθήκευση';

  @override
  String get userProfileNoteDelete => 'Διαγραφή';

  @override
  String get userProfileNoteEmpty => 'Πατήστε για να προσθέσετε σημείωση';

  @override
  String get userProfileMemberSince => 'Μέλος από';

  @override
  String get userProfileAboutMe => 'Σχετικά με εμένα';

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
  String get userProfileCopyUsername => 'Αντιγραφή Ονόματος Χρήστη';

  @override
  String get userProfileCopyUserId => 'Αντιγραφή Αναγνωριστικού Χρήστη';

  @override
  String get userProfileViewMainProfile => 'Προβολή Κύριου Προφίλ';

  @override
  String get userProfileViewCommunityProfile => 'Προβολή Προφίλ Κοινότητας';

  @override
  String get userProfileBlockUser => 'Μπλοκάρισμα Χρήστη';

  @override
  String get userProfileUnblockUser => 'Ξεμπλοκάρισμα Χρήστη';

  @override
  String get userProfileRemoveFriend => 'Αφαίρεση Φίλου';

  @override
  String get userProfileBlockConfirmTitle => 'Μπλοκάρισμα Χρήστη';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Είστε σίγουροι ότι θέλετε να μπλοκάρετε τον χρήστη $username;';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Ξεμπλοκάρισμα Χρήστη';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Είστε σίγουροι ότι θέλετε να ξεμπλοκάρετε τον χρήστη $username;';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Αφαίρεση Φίλου';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Είστε σίγουροι ότι θέλετε να αφαιρέσετε τον χρήστη $username από φίλο;';
  }

  @override
  String get userProfileFailedOpenDm => 'Αποτυχία ανοίγματος άμεσου μηνύματος';

  @override
  String get userProfileFailedSaveNote => 'Αποτυχία αποθήκευσης σημείωσης';

  @override
  String get userProfileActionFailed =>
      'Η ενέργεια απέτυχε, παρακαλώ προσπαθήστε ξανά';

  @override
  String get userProfileChangeNickname => 'Αλλαγή ψευδωνύμου';

  @override
  String get userProfileKick => 'Αποβολή';

  @override
  String get userProfileBan => 'Απαγόρευση';

  @override
  String get userProfileTimeout => 'Περιορισμός χρόνου';

  @override
  String get userProfileRemoveTimeout => 'Αφαίρεση περιορισμού χρόνου';

  @override
  String get userProfileTransferOwnership => 'Μεταφορά ιδιοκτησίας';

  @override
  String get userProfileReportUser => 'Αναφορά χρήστη';

  @override
  String get userProfileReportMessage => 'Αναφορά μηνύματος';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Αποβολή του $username;';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Είστε σίγουροι ότι θέλετε να αποβάλετε τον χρήστη $username; Μπορεί να επανέλθει με νέα πρόσκληση.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle =>
      'Αφαίρεση αποκλεισμού μηνυμάτων;';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Η αφαίρεση του αποκλεισμού μηνυμάτων θα επιτρέψει στον/στην $username να στέλνει μηνύματα, να αντιδρά και να συμμετέχει ξανά σε φωνητικά κανάλια.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Μεταφορά ιδιοκτησίας;';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Μεταφορά ιδιοκτησίας αυτής της κοινότητας στον/στην $username; Αυτό είναι αμετάκλητο και θα χάσετε όλα τα δικαιώματα διαχειριστή.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Αποκλεισμός $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Διάρκεια αποκλεισμού';

  @override
  String get userProfileBanCustomSecondsLabel =>
      'Προσαρμοσμένη διάρκεια (δευτερόλεπτα)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Οποιαδήποτε τιμή από $min έως $max δευτερόλεπτα';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Διαγραφή ιστορικού μηνυμάτων';

  @override
  String get userProfileBanDeleteNone => 'Μην διαγράψεις κανένα';

  @override
  String get userProfileBanDelete24h => 'Προηγούμενες 24 ώρες';

  @override
  String get userProfileBanDelete7d => 'Προηγούμενες 7 ημέρες';

  @override
  String get userProfileBanReasonLabel => 'Λόγος (προαιρετικό)';

  @override
  String get userProfileBanReasonHint =>
      'Εισαγάγετε έναν λόγο για τον αποκλεισμό';

  @override
  String get userProfileBanSubmit => 'Αποκλεισμός μέλους';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Αποκλεισμός μηνυμάτων $username';
  }

  @override
  String get userProfileTimeoutDurationLabel =>
      'Διάρκεια αποκλεισμού μηνυμάτων';

  @override
  String get userProfileTimeoutSubmit => 'Αποκλεισμός μηνυμάτων μέλους';

  @override
  String get userProfileNicknameLabel => 'Ψευδώνυμο';

  @override
  String get userProfileNicknameHint => 'Εισαγάγετε ένα ψευδώνυμο';

  @override
  String get userProfileNicknameSave => 'Αποθήκευση';

  @override
  String userProfileKickSuccess(String username) {
    return 'Ο/Η $username αποβλήθηκε';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Ο/Η $username αποκλείστηκε';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Ο/Η $username αποκλείστηκε από μηνύματα';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Αφαιρέθηκε ο αποκλεισμός μηνυμάτων για τον/την $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Το ψευδώνυμο ενημερώθηκε';

  @override
  String get userProfileTransferSuccess => 'Η ιδιοκτησία μεταφέρθηκε';

  @override
  String get durationPermanent => 'Μόνιμα';

  @override
  String get duration60Seconds => '60 δευτερόλεπτα';

  @override
  String get duration5Minutes => '5 λεπτά';

  @override
  String get duration10Minutes => '10 λεπτά';

  @override
  String get duration1Hour => '1 ώρα';

  @override
  String get duration12Hours => '12 ώρες';

  @override
  String get duration1Day => '1 ημέρα';

  @override
  String get duration3Days => '3 ημέρες';

  @override
  String get duration5Days => '5 ημέρες';

  @override
  String get duration1Week => '1 εβδομάδα';

  @override
  String get duration2Weeks => '2 εβδομάδες';

  @override
  String get duration1Month => '1 μήνας';

  @override
  String get durationCustom => 'Προσαρμοσμένο...';

  @override
  String get iarReportUserTitle => 'Αναφορά χρήστη';

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
  String get iarReasonInappropriateProfile => 'Ακατάλληλο προφίλ';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Αυτό το προφίλ χρήστη περιέχει ακατάλληλο περιεχόμενο';

  @override
  String typingIndicatorOne(String name) {
    return 'Ο/Η $name γράφει...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return 'Ο/Η $name1 και ο/η $name2 γράφουν...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return 'Ο/Η $name1, ο/η $name2 και ο/η $name3 γράφουν...';
  }

  @override
  String get typingIndicatorMultiple => 'Αρκετά άτομα γράφουν...';

  @override
  String get typingIndicatorHandful =>
      'Μια χούφτα πολεμιστές πληκτρολογίου συγκεντρώνονται...';

  @override
  String get typingIndicatorSymphony =>
      'Μια συμφωνία από χτυπήματα πλήκτρων βρίσκεται σε εξέλιξη...';

  @override
  String get typingIndicatorFiesta =>
      'Είναι ένα ξεκάθαρο πάρτι πληκτρολόγησης εδώ μέσα';

  @override
  String get typingIndicatorApocalypse =>
      'Ουάου, είναι μια αποκάλυψη πληκτρολόγησης';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Χαίρομαι που είσαι εδώ, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Καλώς ήρθες, $username! Νιώσε σαν στο σπίτι σου.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Γεια σου, $username! Χαίρομαι που είσαι εδώ.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Γεια σου, $username! Μπες όποτε είσαι έτοιμος.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Γεια σου $username, χαίρομαι που σε βλέπω εδώ!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Γεια σου, $username! Ελπίζω να απολαύσεις τη διαμονή σου.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Γεια σου, $username, καλώς ήρθες!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Χαίρομαι που τα κατάφερες, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Καλώς ήρθες, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Καλώς ήρθες, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Καλώς ήρθες, $username! Χαιρόμαστε που είσαι εδώ.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Καλώς ήρθες, $username! Ελπίζω να απολαύσεις τον χρόνο σου εδώ.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Καλώς ήρθες, $username! Η επόμενη συζήτησή σου ξεκινά εδώ.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Καλώς ήρθες, $username. Χαιρόμαστε που σε έχουμε εδώ.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Χαίρομαι που σε βλέπω, $username! Καλώς ήρθες.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Είσαι εδώ, $username! Καλό είναι να σε έχουμε μαζί μας.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Έφτασες, $username! Ας ξεκινήσουμε.';
  }

  @override
  String get relativeTimeShortNow => 'τώρα';

  @override
  String relativeTimeShortMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countλ',
      one: '1λ',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countω',
      one: '1ω',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countη',
      one: '1η',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countμ',
      one: '1μ',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countχ',
      one: '1χ',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'Οι Συσκευές μου';

  @override
  String get linkedDevicesDescription =>
      'Δείτε όλες τις συσκευές που είναι συνδεδεμένες στον λογαριασμό σας. Ανακαλέστε τυχόν συνεδρίες που δεν αναγνωρίζετε.';

  @override
  String get linkedDevicesCurrentDevice => 'Τρέχουσα Συσκευή';

  @override
  String get linkedDevicesOtherDevices => 'Άλλες Συσκευές';

  @override
  String get linkedDevicesEnterSelection => 'Είσοδος Λειτουργίας Επιλογής';

  @override
  String get linkedDevicesExitSelection => 'Έξοδος Λειτουργίας Επιλογής';

  @override
  String get linkedDevicesSelectAll => 'Επιλογή Όλων';

  @override
  String get linkedDevicesClearSelection => 'Εκκαθάριση Επιλογής';

  @override
  String get linkedDevicesRevokeTooltip => 'Ανάκληση συσκευής';

  @override
  String get linkedDevicesSignOutAll => 'Αποσύνδεση όλων των άλλων συσκευών';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Αποσύνδεση $count συσκευών',
      one: 'Αποσύνδεση 1 συσκευής',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Αποσύνδεση $count συσκευών',
      one: 'Αποσύνδεση 1 συσκευής',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Αποσύνδεση όλων των άλλων συσκευών';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Αυτό θα αποσυνδέσει τις επιλεγμένες συσκευές από τον λογαριασμό σας. Θα χρειαστεί να συνδεθείτε ξανά σε αυτές τις συσκευές.',
      one:
          'Αυτό θα αποσυνδέσει την επιλεγμένη συσκευή από τον λογαριασμό σας. Θα χρειαστεί να συνδεθείτε ξανά σε αυτήν τη συσκευή.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Αυτό θα αποσυνδέσει τις επιλεγμένες συσκευές από τον λογαριασμό σας. Θα χρειαστεί να συνδεθείτε ξανά σε αυτές τις συσκευές.';

  @override
  String get linkedDevicesSignOutConfirm => 'Συνέχεια';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Θα χρειαστεί να συνδεθείτε ξανά σε όλες τις αποσυνδεδεμένες συσκευές';

  @override
  String get linkedDevicesLoadErrorTitle => 'Σφάλμα Δικτύου';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Αντιμετωπίζουμε πρόβλημα σύνδεσης με τον χωροχρόνο. Ελέγξτε τη σύνδεσή σας και δοκιμάστε ξανά.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Συσκευές ανακλήθηκαν',
      one: 'Συσκευή ανακλήθηκε',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'Δεν ήταν δυνατή η αποσύνδεση. Δοκιμάστε ξανά.';

  @override
  String get linkedDevicesUnknownOs => 'Άγνωστο ΛΣ';

  @override
  String get linkedDevicesUnknownPlatform => 'Άγνωστη Πλατφόρμα';

  @override
  String slowmodeLabel(String duration) {
    return '$duration αργή λειτουργία';
  }

  @override
  String get slowmodeTooltipActive =>
      'Είστε σε αργή λειτουργία. Παρακαλώ περιμένετε πριν στείλετε άλλο μήνυμα.';

  @override
  String get slowmodeTooltipImmune =>
      'Η αργή λειτουργία είναι ενεργή, αλλά είστε άνοσος.';

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
      'Δεν μπορείτε να στείλετε μηνύματα σε αυτό το κανάλι.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Ανακοινώσεις συστήματος από το προσωπικό του $productName. Δεν μπορείτε να απαντήσετε εδώ.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Η αποστολή μηνυμάτων έχει προσωρινά ανασταλεί σε αυτήν την κοινότητα.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Έχετε τεθεί σε παύση. Η αποστολή μηνυμάτων, οι αντιδράσεις και η φωνή έχουν ανασταλεί μέχρι να λήξει η παύση.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Πρέπει να διεκδικήσετε τον λογαριασμό σας για να στείλετε μηνύματα σε αυτήν την κοινότητα.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Πρέπει να επαληθεύσετε το email σας για να στείλετε μηνύματα σε αυτήν την κοινότητα.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Ο λογαριασμός σας είναι πολύ νέος για να στείλετε μηνύματα σε αυτήν την κοινότητα.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Δεν είστε μέλος αυτής της κοινότητας αρκετά καιρό για να στείλετε μηνύματα.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Πρέπει να επαληθεύσετε έναν αριθμό τηλεφώνου για να στείλετε μηνύματα σε αυτήν την κοινότητα.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Επαλήθευση email';

  @override
  String get channelComposerBarrierVerifyPhone => 'Επαλήθευση τηλεφώνου';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Πολλά συνημμένα (μέγιστο $max)';
  }

  @override
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return 'Το $fileName υπερβαίνει το όριο μεγέθους ($fileSize)';
  }

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Αυτά τα αρχεία είναι πολύ μεγάλα για να σταλούν μαζί';

  @override
  String get chatAttachmentDropToUpload => 'Αφήστε αρχεία για μεταφόρτωση';

  @override
  String get chatAttachmentDropToSend => 'Αφήστε αρχεία για αποστολή τώρα';

  @override
  String get chatAttachmentSendVoiceMessage => 'Αποστολή φωνητικού μηνύματος';

  @override
  String get voiceMessageTitle => 'Φωνητικό μήνυμα';

  @override
  String get voiceMessageHoldHint =>
      'Κρατήστε για εγγραφή. Σύρετε προς τα πάνω για κλείδωμα ή αφήστε για αποστολή.';

  @override
  String get voiceMessageDiscard => 'Απόρριψη φωνητικού μηνύματος';

  @override
  String get voiceMessageSend => 'Αποστολή φωνητικού μηνύματος';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Αδύνατη η έναρξη εγγραφής. Παραχωρήστε πρόσβαση στο μικρόφωνο.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Η εγγραφή φωνής δεν υποστηρίζεται σε αυτήν τη συσκευή.';

  @override
  String get voiceMessageMicInUse =>
      'Αποχωρήστε από την φωνητική κλήση για να ηχογραφήσετε ένα φωνητικό μήνυμα.';

  @override
  String get voiceMessageRecordingFailed =>
      'Η εγγραφή απέτυχε. Δοκιμάστε ξανά.';

  @override
  String get voiceMessageSendFailed =>
      'Αδύνατη η αποστολή φωνητικού μηνύματος. Δοκιμάστε ξανά.';

  @override
  String get voiceMessageRecordingHint =>
      'Μιλήστε τώρα. Πατήστε Διακοπή όταν τελειώσετε — μπορείτε να περικόψετε αργότερα.';

  @override
  String get voiceMessageReviewHint =>
      'Σύρετε τα χειριστήρια για περικοπή, και μετά πατήστε Αποστολή.';

  @override
  String get voiceMessageStop => 'Διακοπή';

  @override
  String get voiceMessageStartRecording => 'Έναρξη εγγραφής';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Αναπαραγωγή';

  @override
  String get voiceMessagePause => 'Παύση';

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

    return 'Η επιλογή πρέπει να είναι τουλάχιστον $secondsString δευτ.';
  }

  @override
  String get chatAttachmentEditTitle => 'Επεξεργασία συνημμένου';

  @override
  String get chatAttachmentFilenameLabel => 'Όνομα αρχείου';

  @override
  String get chatAttachmentDescriptionLabel => 'Περιγραφή';

  @override
  String get chatAttachmentDescriptionHint => 'Προαιρετικό εναλλακτικό κείμενο';

  @override
  String get chatAttachmentSpoilerLabel => 'Σήμανση ως spoiler';

  @override
  String get chatAttachmentRemove => 'Αφαίρεση συνημμένου';

  @override
  String get chatAttachmentDownload => 'Λήψη';

  @override
  String get chatAttachmentDownloadedToast => 'Saved to photos';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Couldn\'t download attachment';

  @override
  String get chatAttachmentExpiredTooltip => 'Το συνημμένο έχει λήξει';

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
  String get chatAttachmentSourceGallery => 'Συλλογή';

  @override
  String get chatAttachmentSourceCamera => 'Κάμερα';

  @override
  String get chatAttachmentSourceBrowse => 'Περιήγηση αρχείων';

  @override
  String get chatAttachmentPasteTooltip => 'Επικόλληση εικόνας από το πρόχειρο';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Εμφάνιση spoiler';

  @override
  String get matureMediaRevealButton => 'Εμφάνιση';

  @override
  String get matureMediaRevealHint => 'Κάντε κλικ για εμφάνιση';

  @override
  String get matureContentTitle => 'Περιεχόμενο ακατάλληλο για ανηλίκους';

  @override
  String get matureCommunityTitle => 'Ενήλικη κοινότητα';

  @override
  String get matureCategoryTitle => 'Ενήλικη κατηγορία';

  @override
  String get matureChannelTitle => 'Ενήλικο κανάλι';

  @override
  String get communityContentWarningTitle =>
      'Προειδοποίηση περιεχομένου κοινότητας';

  @override
  String get categoryContentWarningTitle =>
      'Προειδοποίηση περιεχομένου κατηγορίας';

  @override
  String get channelContentWarningTitle =>
      'Προειδοποίηση περιεχομένου καναλιού';

  @override
  String get defaultContentWarningBody =>
      'Αυτό περιέχει ευαίσθητο περιεχόμενο.';

  @override
  String get matureCommunityBody =>
      'Αυτή η κοινότητα έχει επισημανθεί για περιεχόμενο ενηλίκων και μπορεί να περιέχει υλικό που μπορεί να είναι ακατάλληλο για ορισμένους χρήστες.';

  @override
  String get matureCategoryBody =>
      'Αυτή η κατηγορία έχει επισημανθεί για περιεχόμενο ενηλίκων και μπορεί να περιέχει υλικό που μπορεί να είναι ακατάλληλο για ορισμένους χρήστες.';

  @override
  String get matureChannelBody =>
      'Αυτό το κανάλι έχει επισημανθεί για περιεχόμενο ενηλίκων και μπορεί να περιέχει υλικό που μπορεί να είναι ακατάλληλο για ορισμένους χρήστες.';

  @override
  String get matureVoiceChannelBody =>
      'Αυτό το κανάλι φωνής έχει επισημανθεί για περιεχόμενο ενηλίκων και μπορεί να περιέχει υλικό που μπορεί να είναι ακατάλληλο για ορισμένους χρήστες.';

  @override
  String get matureLinkChannelBody =>
      'Αυτό το κανάλι συνδέσμων έχει επισημανθεί για περιεχόμενο ενηλίκων και μπορεί να ανοίξει υλικό που μπορεί να είναι ακατάλληλο για ορισμένους χρήστες.';

  @override
  String get matureCommunityUnavailableBody =>
      'Αυτή η ενήλικη κοινότητα δεν είναι διαθέσιμη στον λογαριασμό σας.';

  @override
  String get matureCategoryUnavailableBody =>
      'Αυτή η ενήλικη κατηγορία δεν είναι διαθέσιμη στον λογαριασμό σας.';

  @override
  String get matureChannelUnavailableBody =>
      'Αυτό το ενήλικο κανάλι δεν είναι διαθέσιμο στον λογαριασμό σας.';

  @override
  String get matureContentProceedButton => 'Συνέχεια';

  @override
  String get matureContentUnderstandButton => 'Καταλαβαίνω';

  @override
  String get matureContentOpenLinkButton => 'Άνοιγμα συνδέσμου';

  @override
  String get sensitiveContentSectionTitle => 'Ευαίσθητο περιεχόμενο';

  @override
  String get sensitiveContentSectionDescription =>
      'Ελέγξτε πώς φιλτράρεται το περιεχόμενο ενηλίκων ή ευαίσθητων μέσων σε διαφορετικά πλαίσια';

  @override
  String get sensitiveContentFriendDmLabel => 'Άμεσα μηνύματα από φίλους';

  @override
  String get sensitiveContentNonFriendDmLabel => 'Άμεσα μηνύματα από άλλους';

  @override
  String get sensitiveContentGuildLabel => 'Μηνύματα σε κανάλια κοινότητας';

  @override
  String get sensitiveContentFilterShow => 'Εμφάνιση';

  @override
  String get sensitiveContentFilterBlur => 'Θόλωμα';

  @override
  String get sensitiveContentFilterBlock => 'Αποκλεισμός';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Θόλωμα πολυμέσων μέχρι να ολοκληρωθεί η σάρωση ασφαλείας';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Όταν είναι ενεργοποιημένες, οι εικόνες και τα βίντεο θολώνουν μέχρι να ολοκληρωθεί η σάρωση ασφαλείας περιεχομένου.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Αυτή η ρύθμιση είναι πάντα ενεργή για τον λογαριασμό σας.';

  @override
  String get sensitiveContentResetButton => 'Επαναφορά';

  @override
  String get sensitiveContentSaveButton => 'Αποθήκευση';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count αρχείων',
      one: '1 αρχείου',
    );
    return 'Μεταφόρτωση $_temp0';
  }

  @override
  String get chatCancelUpload => 'Ακύρωση μεταφόρτωσης';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Λήγει στις $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Λήγει μεταξύ $start και $end';
  }

  @override
  String get connectionsTitle => 'Συνδέσεις';

  @override
  String connectionsDescription(String productName) {
    return 'Συνδέστε εξωτερικούς λογαριασμούς και τομείς στο προφίλ σας στο $productName. Οι επαληθευμένες συνδέσεις θα εμφανίζονται στο προφίλ σας για να τις δουν οι άλλοι.';
  }

  @override
  String get connectionsEmptyTitle => 'Δεν υπάρχουν συνδέσεις ακόμα';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Συνδέστε τον λογαριασμό σας στο Bluesky ή επαληθεύστε την ιδιοκτησία τομέα για να τους εμφανίσετε στο προφίλ σας.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Επαληθεύστε την ιδιοκτησία τομέα για να την εμφανίσετε στο προφίλ σας.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Τομέας';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Προσθήκη σύνδεσης Bluesky';

  @override
  String get connectionsAddDomainAriaLabel => 'Προσθήκη σύνδεσης τομέα';

  @override
  String get connectionEdit => 'Επεξεργασία';

  @override
  String get connectionRemove => 'Αφαίρεση';

  @override
  String get connectionVerifiedLabel => 'Αυτή η σύνδεση έχει επαληθευτεί.';

  @override
  String get connectionUnverifiedLabel =>
      'Αυτή η σύνδεση δεν έχει επαληθευτεί.';

  @override
  String get connectionAddTitle => 'Προσθήκη Σύνδεσης';

  @override
  String get connectionTypeLabel => 'Τύπος Σύνδεσης';

  @override
  String get connectionHandleLabel => 'Χειριστής';

  @override
  String get connectionDomainLabel => 'Τομέας';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Έχετε ήδη αυτήν τη σύνδεση.';

  @override
  String get connectionConnectBluesky => 'Σύνδεση με Bluesky';

  @override
  String get connectionContinue => 'Συνέχεια';

  @override
  String get connectionVerifyTitle => 'Επαλήθευση Σύνδεσης';

  @override
  String get connectionVerifyInstructions =>
      'Χρησιμοποιήστε την παρακάτω εγγραφή για να αποδείξετε την ιδιοκτησία του τομέα.';

  @override
  String get connectionDnsRecordTitle => 'Εγγραφή DNS TXT';

  @override
  String get connectionDnsHostLabel => 'Κεντρικός υπολογιστής';

  @override
  String get connectionDnsValueLabel => 'Τιμή';

  @override
  String get connectionCopyHost => 'Αντιγραφή κεντρικού υπολογιστή';

  @override
  String get connectionCopyValue => 'Αντιγραφή τιμής';

  @override
  String get connectionCopied => 'Αντιγράφηκε!';

  @override
  String get connectionTokenFileTitle => 'Παρέχετε το αρχείο διακριτικού';

  @override
  String get connectionTokenFileDescription =>
      'Λήψη του **fluxer-verification** και τοποθέτησή του στον φάκελο **.well-known** ώστε να μπορούμε να επικυρώσουμε τον τομέα.';

  @override
  String get connectionTokenFileDownload => 'Λήψη fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Το αρχείο περιέχει το διακριτικό επαλήθευσης που θα ανακτήσουμε από το **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Αποθήκευση fluxer-verification';

  @override
  String get connectionVerifyButton => 'Επαλήθευση';

  @override
  String get connectionBack => 'Πίσω';

  @override
  String get connectionEditTitle => 'Επεξεργασία Σύνδεσης';

  @override
  String get connectionEditDescription =>
      'Επιλέξτε ποιος μπορεί να δει αυτήν τη σύνδεση στο προφίλ σας.';

  @override
  String get connectionVisibilityEveryone => 'Όλοι';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Επιτρέψτε σε οποιονδήποτε να δει αυτήν τη σύνδεση στο προφίλ σας';

  @override
  String get connectionVisibilityFriends => 'Φίλοι';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Επιτρέψτε στους φίλους σας να δουν αυτήν τη σύνδεση';

  @override
  String get connectionVisibilityCommunityMembers => 'Μέλη Κοινότητας';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Επιτρέψτε στα μέλη από κοινότητες στις οποίες ανήκετε να δουν αυτήν τη σύνδεση';

  @override
  String get connectionRemoveTitle => 'Αφαίρεση Σύνδεσης';

  @override
  String get connectionRemoveDescription =>
      'Είστε σίγουροι ότι θέλετε να αφαιρέσετε αυτήν τη σύνδεση; Αυτή η ενέργεια δεν μπορεί να αναιρεθεί.';

  @override
  String get connectionRemoveConfirm => 'Αφαίρεση';

  @override
  String get connectionsLoadError => 'Αποτυχία φόρτωσης συνδέσεων';

  @override
  String get connectionsReorderError => 'Αποτυχία ενημέρωσης σειράς';

  @override
  String get connectionInitiateFailed =>
      'Δεν ήταν δυνατή η έναρξη της επαλήθευσης. Δοκιμάστε ξανά.';

  @override
  String get connectionVerifyFailed =>
      'Δεν ήταν δυνατή η επαλήθευση. Ελέγξτε την εγγραφή DNS και δοκιμάστε ξανά.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Δεν ήταν δυνατή η έναρξη της εξουσιοδότησης Bluesky.';

  @override
  String get connectionUpdateFailed =>
      'Δεν ήταν δυνατή η ενημέρωση της σύνδεσης';

  @override
  String get connectionRemoveFailed =>
      'Δεν ήταν δυνατή η αφαίρεση της σύνδεσης';

  @override
  String get connectionTokenSavedToast => 'Το fluxer-verification αποθηκεύτηκε';

  @override
  String get connectionTokenSaveFailedToast => 'Αποτυχία αποθήκευσης αρχείου';

  @override
  String get connectionEnterHandle => 'Εισαγάγετε έναν χειριστή Bluesky.';

  @override
  String get connectionEnterDomain => 'Εισαγάγετε έναν τομέα.';

  @override
  String get lookAndFeelTitle => 'Εμφάνιση & Αίσθηση';

  @override
  String get lookAndFeelThemeSectionTitle => 'Θέμα';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Επιλέξτε μεταξύ σκούρου, ανθρακί ή φωτεινού θέματος.';

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
  String get lookAndFeelThemeDark => 'Σκούρο Θέμα';

  @override
  String get lookAndFeelThemeCoal => 'Θέμα Ανθρακί';

  @override
  String get lookAndFeelThemeLight => 'Φωτεινό Θέμα';

  @override
  String get lookAndFeelThemeSystem => 'Θέμα Συστήματος';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Συγχρονισμός θέματος σε όλες τις συσκευές';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Όταν είναι ενεργοποιημένο, οι αλλαγές θέματος θα συγχρονίζονται σε όλες τις συσκευές σας. Όταν είναι απενεργοποιημένο, αυτή η συσκευή θα χρησιμοποιεί τη δική της ρύθμιση θέματος.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Το θέμα συστήματος απενεργοποιεί αυτόματα τον συγχρονισμό για να παρακολουθεί την προτίμηση του συστήματός σας σε αυτήν τη συσκευή.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Δεν ήταν δυνατός ο συγχρονισμός του θέματος στον λογαριασμό σας. Δοκιμάστε ξανά.';

  @override
  String get lookAndFeelChatFontScalingTitle =>
      'Κλιμάκωση γραμματοσειράς συνομιλίας';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Προσαρμόστε το μέγεθος της γραμματοσειράς στην περιοχή συνομιλίας.';

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
  String get lookAndFeelInterfaceTitle => 'Διεπαφή';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Προσαρμόστε στοιχεία και συμπεριφορές διεπαφής.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Ενδείξεις πληκτρολόγησης λίστας καναλιών';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Επιλέξτε πώς εμφανίζονται οι ενδείξεις πληκτρολόγησης στη λίστα καναλιών όταν κάποιος πληκτρολογεί σε ένα κανάλι.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Ενδείξεις πληκτρολόγησης + Είδωλα';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Εμφάνιση ενδείξεων πληκτρολόγησης με είδωλα χρηστών στη λίστα καναλιών';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Μόνο ενδείξεις πληκτρολόγησης';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Εμφάνιση μόνο της ένδειξης πληκτρολόγησης χωρίς είδωλα';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Κρυφό';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Μην εμφανίζετε ενδείξεις πληκτρολόγησης στη λίστα καναλιών';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Εμφάνιση πληκτρολόγησης στο επιλεγμένο κανάλι';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Όταν είναι απενεργοποιημένο (προεπιλογή), οι ενδείξεις πληκτρολόγησης δεν θα εμφανίζονται στο κανάλι που βλέπετε αυτήν τη στιγμή.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'γενικό';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Υποδείξεις πληκτρολογίου';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Ελέγξτε αν οι υποδείξεις συντομεύσεων πληκτρολογίου εμφανίζονται στα εργαλεία.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Απόκρυψη υποδείξεων πληκτρολογίου στα εργαλεία';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Όταν είναι ενεργοποιημένο, οι ετικέτες συντομεύσεων αποκρύπτονται στα αναδυόμενα παράθυρα εργαλείων.';

  @override
  String get lookAndFeelNekoTitle => 'Διάφορα';

  @override
  String get lookAndFeelNekoDescription => 'Διάφορες επιλογές διεπαφής.';

  @override
  String get lookAndFeelShowNekoLabel => 'Εμφάνιση Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Όταν είναι ενεργοποιημένο, ο Neko εμφανίζεται κοντά στη γραμμή εισαγωγής συνομιλίας.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Συμπεριφορά εισόδου σε κανάλια φωνής';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Ελέγξτε πώς εισέρχεστε σε κανάλια φωνής σε κοινότητες.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Απαίτηση διπλού κλικ για είσοδο σε κανάλια φωνής';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Όταν είναι ενεργοποιημένο, θα χρειαστεί να κάνετε διπλό κλικ στα κανάλια φωνής για να τα εισέλθετε. Όταν είναι απενεργοποιημένο (προεπιλογή), ένα μόνο κλικ θα σας εισάγει αμέσως στο κανάλι.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Η γρήγορη καφέ αλεπού πηδάει πάνω από τον τεμπέλη σκύλο.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Πλευρική μπάρα κοινότητας';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Ρυθμίστε πώς η πλευρική μπάρα κοινότητας εμφανίζει άμεσα μηνύματα.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count κοινότητες είναι προσωρινά μη διαθέσιμες λόγω δυσλειτουργίας πυκνωτή ροής.',
      one:
          '1 κοινότητα είναι προσωρινά μη διαθέσιμη λόγω δυσλειτουργίας πυκνωτή ροής.',
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
  String get lookAndFeelCollapseDMsLabel => 'Σύμπτυξη DM σε φάκελο';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'Όταν είναι ενεργοποιημένο, τα μη αναγνωσμένα DM στην πλευρική μπάρα κοινότητας συμπτύσσονται σε έναν φάκελο στο κουμπί $productName. Κάντε κλικ στο κουμπί $productName ενώ βρίσκεστε στη σελίδα DM για να επεκτείνετε ή να συμπτύξετε τον φάκελο.';
  }

  @override
  String get lookAndFeelChannelListSectionTitle => 'Λίστα καναλιών';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Ελέγξτε τη συμπεριφορά της ένδειξης μη αναγνωσμένων για τα σιωπηλά κανάλια στις λίστες καναλιών.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Εμφάνιση ένδειξης μη αναγνωσμένων σε σίγαση καναλιών';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Όταν είναι ενεργοποιημένη, τα κανάλια σε σίγαση εμφανίζουν μια αχνή ένδειξη μη αναγνωσμένων στην αριστερή πλευρά. Οι αναφορές εξακολουθούν να εμφανίζονται ανεξάρτητα από αυτήν τη ρύθμιση.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Ενεργοί τώρα';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Ελέγξτε πώς εμφανίζονται οι Ενεργοί τώρα σε όλη την εφαρμογή.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Εμφάνιση Ενεργών τώρα στην αρχική οθόνη';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Εμφανίστε τους Ενεργούς τώρα στην αρχική οθόνη για να βλέπετε φίλους που είναι ενεργοί σε φωνή. Θα βλέπετε μια προεπισκόπηση, το πλαίσιο του καναλιού, ποιοι είναι ήδη εκεί και έναν γρήγορο τρόπο να συμμετάχετε.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Αγαπημένα';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Ελέγξτε την ορατότητα των αγαπημένων σε όλη την εφαρμογή.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Ενεργοποίηση Αγαπημένων';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Όταν είναι ενεργοποιημένη, μπορείτε να προσθέσετε κανάλια στα αγαπημένα σας και θα εμφανίζονται στην ενότητα Αγαπημένα. Όταν είναι απενεργοποιημένη, όλα τα στοιχεία διεπαφής που σχετίζονται με τα αγαπημένα (κουμπιά, στοιχεία μενού) θα είναι κρυφά. Τα υπάρχοντα αγαπημένα σας θα διατηρηθούν.';

  @override
  String get favoritesTitle => 'Αγαπημένα';

  @override
  String get favoritesEmptyTitle => 'Δεν υπάρχουν ακόμη αγαπημένα';

  @override
  String get favoritesEmptyDescription =>
      'Καρφιτσώστε κανάλια από την κεφαλίδα συνομιλίας για να τα κρατήσετε εδώ.';

  @override
  String get favoritesWelcomeTitle => 'Καλώς ήρθατε στα Αγαπημένα';

  @override
  String get favoritesWelcomeDescription =>
      'Ο προσωπικός σας χώρος για γρήγορη πρόσβαση σε κανάλια, απευθείας μηνύματα και ομάδες που αγαπάτε. Πατήστε το αστέρι σε οποιοδήποτε κανάλι για να το προσθέσετε εδώ.';

  @override
  String get favoritesWelcomeTip =>
      'Δεν σας αρέσει; Απενεργοποιήστε το οποιαδήποτε στιγμή.';

  @override
  String get favoritesDisableButton => 'Απενεργοποίηση αγαπημένων';

  @override
  String get favoritesAddedToast => 'Προστέθηκε στα Αγαπημένα';

  @override
  String get favoritesRemovedToast => 'Αφαιρέθηκε από τα Αγαπημένα';

  @override
  String get favoritesHiddenToast => 'Τα Αγαπημένα αποκρύφτηκαν';

  @override
  String get favoritesMute => 'Σίγαση αγαπημένων';

  @override
  String get favoritesUnmute => 'Κατάργηση σίγασης αγαπημένων';

  @override
  String get favoritesHeaderMenu => 'Μενού αγαπημένων';

  @override
  String get favoritesCreateCategory => 'Δημιουργία κατηγορίας';

  @override
  String get favoritesCategoryNameLabel => 'Όνομα κατηγορίας';

  @override
  String get favoritesHideMutedChannels => 'Απόκρυψη καναλιών σε σίγαση';

  @override
  String get favoritesShowMutedChannels => 'Εμφάνιση καναλιών σε σίγαση';

  @override
  String get favoritesSetNickname => 'Ορισμός ψευδωνύμου';

  @override
  String get favoritesNicknameLabel => 'Ψευδώνυμο';

  @override
  String get favoritesSaveNickname => 'Αποθήκευση ψευδωνύμου';

  @override
  String get favoritesMoveToCategory => 'Μετακίνηση στην κατηγορία';

  @override
  String get favoritesUncategorized => 'Χωρίς κατηγορία';

  @override
  String get favoritesOtherCategory => 'Άλλο';

  @override
  String get favoritesRemoveFromFavorites => 'Αφαίρεση από τα Αγαπημένα';

  @override
  String get favoritesAddToFavorites => 'Προσθήκη στα Αγαπημένα';

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
  String get favoritesHideConfirmTitle => 'Απόκρυψη αγαπημένων';

  @override
  String get favoritesHideConfirmDescription =>
      'Αυτό θα αποκρύψει όλα τα στοιχεία διεπαφής που σχετίζονται με τα αγαπημένα, συμπεριλαμβανομένων των κουμπιών και των στοιχείων μενού. Τα υπάρχοντα αγαπημένα σας θα διατηρηθούν και μπορούν να ενεργοποιηθούν ξανά ανά πάσα στιγμή από τις Ρυθμίσεις > Για προχωρημένους > Εμφάνιση.';

  @override
  String get favoritesDirectMessageSubtitle => 'Απευθείας Μήνυμα';

  @override
  String get messagesMediaDisplayGroupTitle => 'Εμφάνιση';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Ελέγξτε πώς εμφανίζονται τα μηνύματα, τα πολυμέσα και άλλο περιεχόμενο.';

  @override
  String get messagesMediaMediaGroupTitle => 'Πολυμέσα';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Προσαρμόστε τις προτιμήσεις μεγέθους πολυμέσων και τα κουμπιά.';

  @override
  String get messagesMediaInputGroupTitle => 'Εισαγωγή';

  @override
  String get messagesMediaInputGroupDescription =>
      'Προσαρμόστε τις ρυθμίσεις εισαγωγής μηνυμάτων.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Πλευρική μπάρα';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Ρυθμίστε πώς εμφανίζεται η πλευρική μπάρα της κοινότητας.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Απόκρυψη καναλιών σε σίγαση από προεπιλογή';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Αυτόματη απόκρυψη καναλιών σε σίγαση στην πλευρική μπάρα όταν εισέρχεστε σε νέες κοινότητες';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Απόκρυψη καναλιών σε σίγαση από προεπιλογή;';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Οι νέες κοινότητες στις οποίες θα εισέλθετε θα έχουν αυτόματα κρυφά τα κανάλια σε σίγαση. Θέλετε επίσης να εφαρμόσετε αυτήν τη ρύθμιση σε όλες τις υπάρχουσες κοινότητές σας;';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Διακοπή απόκρυψης καναλιών σε σίγαση από προεπιλογή;';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Οι νέες κοινότητες στις οποίες θα εισέλθετε δεν θα έχουν πλέον αυτόματα κρυφά τα κανάλια σε σίγαση. Θέλετε επίσης να εμφανίσετε τα κανάλια σε σίγαση σε όλες τις υπάρχουσες κοινότητές σας;';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Εφαρμογή σε όλες τις κοινότητες';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Εμφάνιση σε όλες τις κοινότητες';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Μόνο νέες κοινότητες';

  @override
  String get messagesMediaDisplaySectionTitle => 'Εμφάνιση πολυμέσων';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Ελέγξτε πώς εμφανίζονται εικόνες, βίντεο και άλλα πολυμέσα. Όλα τα πολυμέσα αλλάζουν μέγεθος και μετατρέπονται. Εξαιρετικά μεγάλα αρχεία που δεν μπορούν να συμπιεστούν σε προεπισκόπηση δεν θα ενσωματωθούν ανεξάρτητα από αυτές τις ρυθμίσεις.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Όταν δημοσιεύονται ως σύνδεσμοι στη συνομιλία';

  @override
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'Όταν μεταφορτώνονται απευθείας στο $productName';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle =>
      'Προεπισκοπήσεις συνδέσμων';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Ελέγξτε πώς προεπισκοπούνται οι σύνδεσμοι ιστοτόπων στη συνομιλία';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Εμφάνιση ενσωματώσεων και προεπισκόπηση συνδέσμων ιστοτόπων';

  @override
  String get messagesMediaReactionsSectionTitle => 'Αντιδράσεις';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Διαμόρφωση αντιδράσεων emoji στα μηνύματα';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Εμφάνιση αντιδράσεων emoji στα μηνύματα';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Περιεχόμενο Spoiler';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Έλεγχος του τρόπου εμφάνισης του περιεχομένου spoiler';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Εμφάνιση περιεχομένου spoiler';

  @override
  String get messagesMediaSpoilersOnClickName => 'Με κλικ';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Εμφάνιση περιεχομένου spoiler όταν κάνετε κλικ';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'Σε κανάλια που κάνω συντονισμό';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Εμφάνιση περιεχομένου spoiler πάντα στα κανάλια όπου έχετε την άδεια \"Διαχείριση μηνυμάτων\"';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Πάντα';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Εμφάνιση περιεχομένου spoiler πάντα';

  @override
  String get messagesMediaSizeSectionTitle => 'Προτιμήσεις μεγέθους πολυμέσων';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Προσαρμόστε το μέγιστο μέγεθος εμφάνισης για ενσωματωμένα και συνημμένα πολυμέσα. Μικρότερα μεγέθη χρησιμοποιούν λιγότερο χώρο στην οθόνη, ενώ μεγαλύτερα μεγέθη δείχνουν περισσότερη λεπτομέρεια.';

  @override
  String get messagesMediaSizeEmbedLabel =>
      'Πολυμέσα από συνδέσμους (ενσωματώσεις)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Μεταφορτωμένα συνημμένα';

  @override
  String get messagesMediaSizeCompactName => 'Συμπαγές (400x300)';

  @override
  String get messagesMediaSizeCompactDescription =>
      'Μικρότερο μέγεθος πολυμέσων';

  @override
  String get messagesMediaSizeComfortableName => 'Άνετο (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Μεγαλύτερο μέγεθος πολυμέσων με περισσότερη λεπτομέρεια';

  @override
  String get messagesMediaGifsSectionTitle => 'Συμπεριφορά GIF';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Έλεγχος του τρόπου εισαγωγής GIF στο chat';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Αυτόματη αποστολή GIF κατά την επιλογή';

  @override
  String get messagesMediaCameraUploadsSectionTitle => 'Camera uploads';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Choose whether photos and videos taken with the in-app camera are kept on your device';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel => 'Save to device';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Αυτόματη συμπλήρωση εκφράσεων (αυτόματη συμπλήρωση με άνω και κάτω τελεία)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Ελέγξτε τι εμφανίζεται στην αυτόματη συμπλήρωση εκφράσεων όταν πληκτρολογείτε άνω και κάτω τελεία. Προσαρμόστε ποιες προτάσεις εμφανίζονται για να ταιριάζουν στις προτιμήσεις σας.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Εμφάνιση προεπιλεγμένων emoji στην αυτόματη συμπλήρωση εκφράσεων';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Εμφάνιση προσαρμοσμένων emoji στην αυτόματη συμπλήρωση εκφράσεων';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Εμφάνιση αυτοκόλλητων στην αυτόματη συμπλήρωση εκφράσεων';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Εμφάνιση αποθηκευμένων πολυμέσων στην αυτόματη συμπλήρωση εκφράσεων';

  @override
  String get messagesMediaEditingSectionTitle => 'Επεξεργασία μηνυμάτων';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Ελέγξτε τι συμβαίνει στο πρόχειρο επεξεργασίας σας όταν ακυρώνετε.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Διατήρηση πρόχειρου επεξεργασίας κατά την ακύρωση';

  @override
  String get accessibilitySaturationTitle => 'Saturation';

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
      'Προεπισκοπήσεις μηνυμάτων DM';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Ελέγξτε πότε εμφανίζονται οι προεπισκοπήσεις μηνυμάτων στη λίστα DM.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Λειτουργία προεπισκόπησης μηνυμάτων DM';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Όλα τα μηνύματα';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Εμφάνιση προεπισκοπήσεων μηνυμάτων για όλες τις συνομιλίες DM';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Μόνο μη αναγνωσμένα DM';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Εμφάνιση προεπισκοπήσεων μηνυμάτων μόνο για DM με μη αναγνωσμένα μηνύματα';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Κανένα';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Μην εμφανίζετε προεπισκοπήσεις μηνυμάτων στη λίστα DM';

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
  String get dmListSentAnAttachment => 'Έστειλε ένα συνημμένο';

  @override
  String systemPreviewPinnedMessage(String username) {
    return 'Ο/Η $username καρφίτσωσε ένα μήνυμα σε αυτό το κανάλι.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return 'Ο/Η $username πρόσθεσε τον/την $userName στην ομάδα.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return 'Ο/Η $username πρόσθεσε κάποιον στην ομάδα.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return 'Ο/Η $username έφυγε από την ομάδα.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username αφαίρεσε τον/την $userName από την ομάδα.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username αφαίρεσε κάποιον από την ομάδα.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username άλλαξε το όνομα του καναλιού σε $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username άλλαξε το όνομα του καναλιού.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username άλλαξε το εικονίδιο του καναλιού.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username ξεκίνησε μια κλήση.';
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
  String get voiceConnectionConfirmTitle => 'Επιβεβαίωση Σύνδεσης Φωνής';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Είστε ήδη συνδεδεμένοι σε αυτό το φωνητικό κανάλι από $count άλλες συσκευές. Τι θέλετε να κάνετε;',
      one:
          'Είστε ήδη συνδεδεμένοι σε αυτό το φωνητικό κανάλι από 1 άλλη συσκευή. Τι θέλετε να κάνετε;',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Μετάβαση σε Αυτή τη Συσκευή';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Απλή Σύνδεση (Διατήρηση Άλλων Συνδέσεων)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Να μην γίνει τίποτα, δεν θέλω να συνδεθώ';

  @override
  String get voiceJoinFailedTitle => 'Couldn\'t Join Voice';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Couldn\'t disconnect your other devices. Try again in a moment.';

  @override
  String get voiceChannelEmptyDescription =>
      'Αυτό είναι ένα φωνητικό κανάλι. Συνδεθείτε για να αρχίσετε να μιλάτε!';

  @override
  String get voiceChannelJoin => 'Σύνδεση στο Φωνητικό Κανάλι';

  @override
  String get voiceCallJoin => 'Join call';

  @override
  String get voiceChannelJoinConnect => 'Σύνδεση στη Φωνή';

  @override
  String get voiceChannelNoConnectPermission =>
      'Δεν έχετε άδεια να συνδεθείτε σε αυτό το φωνητικό κανάλι';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Το περιεχόμενο του μικροφώνου, της κάμερας και της κοινής χρήσης οθόνης είναι κρυπτογραφημένο από άκρο σε άκρο.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Το περιεχόμενο του μικροφώνου, της κάμερας και της κοινής χρήσης οθόνης είναι κρυπτογραφημένο από άκρο σε άκρο.';

  @override
  String get voiceChannelE2eeBroken =>
      'Η κρυπτογράφηση από άκρο σε άκρο δεν είναι διαθέσιμη επειδή ένας μη υποστηριζόμενος συμμετέχων βρίσκεται σε αυτό το φωνητικό κανάλι.';

  @override
  String get voiceCallE2eeBroken =>
      'Η κρυπτογράφηση από άκρο σε άκρο δεν είναι διαθέσιμη επειδή ένας μη υποστηριζόμενος συμμετέχων βρίσκεται σε αυτήν την κλήση.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Αυτός ο πελάτης πρέπει να ενημερωθεί πριν τη σύνδεση σε αυτήν την κρυπτογραφημένη κλήση.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Δεν ήταν δυνατή η εκκίνηση του μικροφώνου σας. Παραμένετε στην κλήση.';

  @override
  String get voiceChannelStatusConnecting => 'Σύνδεση...';

  @override
  String get voiceChannelStatusConnected => 'Συνδέθηκε';

  @override
  String get voiceChannelStatusError => 'Σφάλμα';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Κινητή συσκευή';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Συσκευή υπολογιστή';

  @override
  String get voiceParticipantTooltipCommunityMuted =>
      'Σίγαση από την κοινότητα';

  @override
  String get voiceParticipantTooltipMuted => 'Σε σίγαση';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Κώφωση από την κοινότητα';

  @override
  String get voiceParticipantTooltipDeafened => 'Κωφός';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Σύνδεση: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count συμμετέχοντες',
      one: '1 συμμετέχων',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Αποχώρηση';

  @override
  String get voiceControlMute => 'Σίγαση';

  @override
  String get voiceControlUnmute => 'Αποσίγαση';

  @override
  String get voiceControlDeafen => 'Κώφωση';

  @override
  String get voiceControlUndeafen => 'Αποκώφωση';

  @override
  String get voiceControlVideo => 'Βίντεο';

  @override
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'Κοινή χρήση οθόνης';

  @override
  String get voiceScreenShareNotificationText =>
      'Γίνεται κοινή χρήση της οθόνης σας.';

  @override
  String get voiceControlMore => 'Περισσότερα';

  @override
  String get voiceControlDisconnect => 'Αποσύνδεση';

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
  String get voiceParticipantModerationFailed =>
      'Couldn\'t update that member. Please try again.';

  @override
  String get voiceControlChat => 'Συνομιλία';

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
  String get voiceTextChatShow => 'Εμφάνιση συνομιλίας';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# αναπάντητα μηνύματα',
      one: '# αναπάντητο μήνυμα',
    );
    return 'Εμφάνιση συνομιλίας με $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Απαιτείται άδεια κάμερας για βίντεο.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Δεν ήταν δυνατή η εκκίνηση της κοινής χρήσης οθόνης. Προσπαθήστε ξανά.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Η άδεια κοινής χρήσης οθόνης απορρίφθηκε.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Η κοινή χρήση οθόνης δεν είναι διαθέσιμη σε αυτήν τη συσκευή.';

  @override
  String get voiceWatchStream => 'Παρακολούθηση Ροής';

  @override
  String get voiceStopWatching => 'Παύση παρακολούθησης';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Παύση παρακολούθησης της τρέχουσας ροής';

  @override
  String get voiceOwnScreenShareTitle => 'Προβάλλετε';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Η ροή σας είναι ζωντανή για τους συμμετέχοντες.';

  @override
  String get voiceLiveBadge => 'LIVE';

  @override
  String get dmVoiceViewCall => 'Προβολή κλήσης';

  @override
  String get dmVoiceCallFullScreen => 'Πλήρης οθόνη';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Άνοιγμα κλήσης σε πλήρη οθόνη';

  @override
  String get dmVoiceStripStatusConnecting => 'Σύνδεση...';

  @override
  String get dmVoiceStripStatusInCall => 'Σε κλήση';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Φωνητική κλήση';

  @override
  String get dmVoiceCallBarConnecting => 'Σύνδεση...';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Απευθείας κλήση';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Ομαδική κλήση';

  @override
  String get dmVoiceCallBarIssueFallback => 'Πρόβλημα φωνής';

  @override
  String get dmVoiceFullscreenTitle => 'Φωνή';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Φωνή συνδέθηκε';

  @override
  String get notificationsPageTitle => 'Ειδοποιήσεις';

  @override
  String get notificationsFilterUnreads => 'Μη αναγνωσμένα';

  @override
  String get notificationsFilterMentions => 'Αναφορές';

  @override
  String get notificationsBookmarksTooltip => 'Σελιδοδείκτες';

  @override
  String get notificationsMentionFilterTooltip => 'Φιλτράρισμα αναφορών';

  @override
  String get notificationsMentionFiltersTitle => 'Φίλτρα αναφορών';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Συμπερίληψη αναφορών @everyone και @here';

  @override
  String get notificationsMentionIncludeRoles => 'Συμπερίληψη αναφορών ρόλων';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Συμπερίληψη όλων των αναφορών κοινότητας';

  @override
  String get notificationsNoUnreadTitle =>
      'Δεν υπάρχουν μη αναγνωσμένα μηνύματα';

  @override
  String get notificationsNoUnreadBody => 'Έχετε ενημερωθεί.';

  @override
  String get notificationsNoMentionsTitle => 'Δεν υπάρχουν πρόσφατες αναφορές';

  @override
  String get notificationsNoMentionsBody =>
      'Όλες οι @αναφορές σας θα εμφανίζονται εδώ για 7 ημέρες.';

  @override
  String get notificationsMentionsEndTitle => 'Έφτασες στο τέλος';

  @override
  String get notificationsMentionsEndBody =>
      'Έχετε δει όλες τις πρόσφατες αναφορές σας. Μην ανησυχείτε, σύντομα θα εμφανιστούν κι άλλες εδώ.';

  @override
  String get notificationsJump => 'Μετάβαση';

  @override
  String get notificationsRemoveMentionTooltip => 'Αφαίρεση αναφοράς';

  @override
  String get notificationsViewAllUnread => 'Προβολή όλων των μη αναγνωσμένων';

  @override
  String get notificationsMarkAsRead => 'Σήμανση ως αναγνωσμένα';

  @override
  String get notificationsExpand => 'Επέκταση';

  @override
  String get notificationsCollapse => 'Σύμπτυξη';

  @override
  String get notificationsMessageUnavailable => 'Αυτό το μήνυμα δεν φορτώθηκε.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining χαρακτήρες απομένουν';
  }

  @override
  String get characterCounterTooLong => 'Το μήνυμα είναι πολύ μεγάλο';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining χαρακτήρες απομένουν. Αποκτήστε το $productName για να γράψετε έως και $premiumMaxLength χαρακτήρες.';
  }

  @override
  String get chatMessageFailedToSend => 'Αποτυχία αποστολής μηνύματος';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Το μήνυμά σας δεν μπόρεσε να παραδοθεί. Αυτό συμβαίνει συνήθως επειδή δεν μοιράζεστε κοινότητα με τον παραλήπτη ή ο παραλήπτης δέχεται απευθείας μηνύματα μόνο από φίλους. Μπορεί επίσης να χρειαστεί να προσαρμόσετε τις δικές σας ρυθμίσεις απορρήτου απευθείας μηνυμάτων στο $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Το μήνυμά σας δεν μπόρεσε να παραδοθεί. Πρέπει να διεκδικήσετε τον λογαριασμό σας για να στείλετε απευθείας μηνύματα.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Το μήνυμά σας δεν μπόρεσε να παραδοθεί. Πρέπει να διεκδικήσετε τον λογαριασμό σας για να στείλετε μηνύματα.';

  @override
  String get chatSendFailureContentBlocked =>
      'Το μήνυμά σας δεν μπόρεσε να παραδοθεί επειδή επισημάνθηκε από τα συστήματα ασφαλείας μας. Εάν πιστεύετε ότι πρόκειται για λάθος, επικοινωνήστε με την υποστήριξη.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Το μήνυμά σας δεν μπόρεσε να παραδοθεί επειδή περιέχει ώριμα emoji ή αυτοκόλλητα που δεν επιτρέπονται σε αυτό το πλαίσιο.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'Μόνο εσείς μπορείτε να δείτε αυτό το μήνυμα.';

  @override
  String get chatClientSystemDismiss => 'Απόρριψη';

  @override
  String get privacyDashboardCommunicationSection => 'Επικοινωνία';

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
  String get chatMessageDeleteFailed => 'Αποτυχία διαγραφής μηνύματος';

  @override
  String get chatMessageAddReaction => 'Προσθήκη αντίδρασης';

  @override
  String get chatMessageEdit => 'Επεξεργασία μηνύματος';

  @override
  String get chatMessageReply => 'Απάντηση';

  @override
  String get chatMessageForward => 'Προώθηση';

  @override
  String get forwardMessageTitle => 'Προώθηση μηνύματος';

  @override
  String get forwardSearchHint => 'Αναζήτηση καναλιών ή απευθείας μηνυμάτων';

  @override
  String get forwardDirectMessagesSection => 'Απευθείας μηνύματα';

  @override
  String get forwardCommentHint => 'Προσθήκη σχολίου (προαιρετικό)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Αποστολή ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Δεν βρέθηκαν κανάλια';

  @override
  String get forwardSuccessToast => 'Το μήνυμα προωθήθηκε';

  @override
  String get forwardFailed => 'Αποτυχία προώθησης μηνύματος';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Τα σχόλια δεν είναι διαθέσιμα επειδή ένα επιλεγμένο κανάλι έχει ενεργοποιημένη τη λειτουργία αργής αποστολής.';

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
      'Δεν μπορείτε να στείλετε μηνύματα εδώ';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Δεν μπορείτε να ενσωματώσετε συνδέσμους εδώ';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Δεν μπορείτε να επισυνάψετε αρχεία εδώ';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Η αποστολή μηνυμάτων είναι απενεργοποιημένη σε αυτήν την κοινότητα';

  @override
  String get forwardDestinationTimedOut =>
      'Έχετε σε αναστολή σε αυτήν την κοινότητα';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Λειτουργία αργής αποστολής - περιμένετε $remaining';
  }

  @override
  String get chatMessageCopyText => 'Αντιγραφή μηνύματος';

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
  String get chatMessagePin => 'Καρφίτσωμα μηνύματος';

  @override
  String get chatMessageUnpin => 'Αποκαρφίτσωμα μηνύματος';

  @override
  String get chatMessageUnpinIt => 'Αποκαρφίτσωμά το';

  @override
  String get chatMessageBookmark => 'Προσθήκη σελιδοδείκτη στο μήνυμα';

  @override
  String get chatMessageRemoveBookmark => 'Αφαίρεση σελιδοδείκτη';

  @override
  String get chatMessageMarkAsUnread => 'Σήμανση ως μη αναγνωσμένο';

  @override
  String get chatMessageCopyMessageLink => 'Αντιγραφή συνδέσμου μηνύματος';

  @override
  String get chatMessageCopyMessageId => 'Αντιγραφή αναγνωριστικού μηνύματος';

  @override
  String get chatMessageViewReactions => 'Προβολή αντιδράσεων';

  @override
  String get chatMessageRemoveAllReactions => 'Αφαίρεση όλων των αντιδράσεων';

  @override
  String get chatMessageDebug => 'Εντοπισμός σφαλμάτων μηνύματος';

  @override
  String get chatMessageDebugSheetTitle => 'Εντοπισμός σφαλμάτων μηνύματος';

  @override
  String get chatMessageDebugCopyJson => 'Αντιγραφή JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'Το JSON του μηνύματος αντιγράφηκε στο πρόχειρο';

  @override
  String get chatReactionsSheetTitle => 'Αντιδράσεις';

  @override
  String get chatReactionsSheetEmpty =>
      'Κανείς δεν έχει αντιδράσει ακόμα σε αυτό.';

  @override
  String get chatReactionAddFailed => 'Failed to add reaction';

  @override
  String get chatReactionRemoveFailed => 'Failed to remove reaction';

  @override
  String get chatMessageReport => 'Αναφορά μηνύματος';

  @override
  String get iarReportMessageTitle => 'Αναφορά μηνύματος';

  @override
  String get iarThisUserFallback => 'αυτόν τον χρήστη';

  @override
  String get iarModalDescription =>
      'Αναφέρετε παραβίαση κανόνα ή βρείτε εργαλεία για τη διαχείριση επαφών και προτιμήσεων.';

  @override
  String get iarPathStepAriaLabel => 'Τι χρειάζεστε;';

  @override
  String get iarCategoryStepTitle => 'Τι είδους κανόνας παραβιάστηκε;';

  @override
  String get iarReasonStepTitle => 'Ποιος κανόνας παραβιάστηκε;';

  @override
  String get iarReasonSelectHint => 'Επιλέξτε έναν λόγο';

  @override
  String get iarPickAnOptionToast => 'Επιλέξτε μια επιλογή για να συνεχίσετε.';

  @override
  String get iarPickARuleToast => 'Επιλέξτε τον κανόνα που παραβιάστηκε.';

  @override
  String get iarPathPlatform => 'Αναφορά παραβίασης κανόνα πλατφόρμας';

  @override
  String get iarPathCommunity =>
      'Αναφορά στους διαχειριστές αυτής της κοινότητας';

  @override
  String get iarPathPreferenceMessage => 'Δεν μου αρέσει αυτό το περιεχόμενο';

  @override
  String get iarCategoryTargetedHarmLabel => 'Απειλές, παρενόχληση ή βλάβη';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Εκφοβισμός, απειλές, μίσος, βία, επιθέσεις ή περιεχόμενο που προωθεί τον αυτοτραυματισμό.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Ασφάλεια παιδιών ή ώριμο περιεχόμενο';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Παιδιά σε κίνδυνο, ώριμο περιεχόμενο σε λάθος μέρος ή ανεπιθύμητη συμπεριφορά.';

  @override
  String get iarCategoryPrivacyIdentityLabel => 'Απόρρητο ή πλαστοπροσωπία';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxxing, παρακολούθηση, προσποίηση κάποιου άλλου ή ακατάλληλο προφίλ.';

  @override
  String get iarCategoryDeceptionLabel =>
      'Απάτες, κακόβουλο λογισμικό ή παραπληροφόρηση';

  @override
  String get iarCategoryDeceptionDescription =>
      'Phishing, απάτη, κακόβουλοι σύνδεσμοι ή ψευδείς ισχυρισμοί που είναι πιθανό να προκαλέσουν βλάβη στον πραγματικό κόσμο.';

  @override
  String get iarCategoryIllegalOtherLabel =>
      'Παράνομη δραστηριότητα ή κάτι άλλο';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Παράνομες πωλήσεις, διευκόλυνση εγκληματικότητας ή σαφής παραβίαση κανόνων που δεν ταιριάζει παραπάνω.';

  @override
  String get iarReasonHarassmentLabel => 'Παρενόχληση ή απειλές';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Εκφοβισμός, επαναλαμβανόμενη ανεπιθύμητη επικοινωνία, παρακολούθηση ή στοχευμένη κατάχρηση.';

  @override
  String get iarReasonHateLabel => 'Ρητορική μίσους';

  @override
  String get iarReasonHateMessageDescription =>
      'Βρισιές, αποανθρωποποιητική γλώσσα ή επιθέσεις σε προστατευόμενες ομάδες.';

  @override
  String get iarReasonViolenceLabel => 'Βία ή βίαιες απειλές';

  @override
  String get iarReasonViolenceDescription =>
      'Αξιόπιστες απειλές, γραφική βία ή εξύμνηση της βίας.';

  @override
  String get iarReasonMatureContentLabel => 'Ώριμο περιεχόμενο ή παρενόχληση';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Ανεπιθύμητη συμπεριφορά ή ώριμο περιεχόμενο σε λάθος μέρος.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Ασφάλεια παιδιών ή εκμετάλλευση ανηλίκων';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Περιεχόμενο εκμετάλλευσης ή παραπλάνησης ανηλίκων.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Επιβλαβής παραπληροφόρηση';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Ψευδείς ισχυρισμοί που είναι πιθανό να προκαλέσουν βλάβη στον πραγματικό κόσμο.';

  @override
  String get iarReasonSpamLabel => 'Spam, απάτες ή phishing';

  @override
  String get iarReasonSpamMessageDescription =>
      'Μαζικό spam, απάτη, ψεύτικες δωροεπιταγές ή κατάχρηση λογαριασμού.';

  @override
  String get iarReasonMalwareLabel =>
      'Κακόβουλο λογισμικό ή επικίνδυνοι σύνδεσμοι';

  @override
  String get iarReasonMalwareDescription =>
      'Κακόβουλο λογισμικό, κλοπή διαπιστευτηρίων ή επικίνδυνα αρχεία.';

  @override
  String get iarReasonPrivacyLabel => 'Παραβίαση απορρήτου';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxxing, αποκάλυψη ιδιωτικών πληροφοριών ή παρακολούθηση.';

  @override
  String get iarReasonImpersonationLabel =>
      'Πλαστοπροσωπία ή παραπλανητικά μέσα';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Προσποίηση κάποιου άλλου, συμπεριλαμβανομένου παραπλανητικού περιεχομένου που δημιουργήθηκε από AI.';

  @override
  String get iarReasonIllegalLabel => 'Παράνομη δραστηριότητα';

  @override
  String get iarReasonIllegalDescription =>
      'Παράνομες πωλήσεις, διευκόλυνση εγκληματικότητας ή παράνομη δραστηριότητα.';

  @override
  String get iarReasonSelfHarmLabel => 'Αυτοτραυματισμός ή αυτοκτονία';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Προώθηση ή οδηγίες που ενθαρρύνουν τον αυτοτραυματισμό ή τις διατροφικές διαταραχές.';

  @override
  String get iarReasonOtherLabel => 'Άλλη σαφής παραβίαση κανόνα';

  @override
  String iarReasonOtherDescription(String productName) {
    return 'Χρησιμοποιήστε μόνο εάν παραβιάζει σαφώς τους κανόνες του $productName και δεν ταιριάζει παραπάνω.';
  }

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Εάν εμπλέκεται ανήλικος, χρησιμοποιήστε \"$childSafetyReason\" αντ\' αυτού.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Εάν αυτό αφορά CSAM ή εκμετάλλευση ανηλίκου, στείλτε το τώρα και μην κοινοποιήσετε ξανά το υλικό.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Εάν κάποιος κινδυνεύει άμεσα, επικοινωνήστε με τις τοπικές υπηρεσίες έκτακτης ανάγκης, εάν μπορείτε να το κάνετε με ασφάλεια.';

  @override
  String get iarSafetyNoteViolence =>
      'Εάν πρόκειται για αξιόπιστη άμεση απειλή, επικοινωνήστε επίσης με τις τοπικές υπηρεσίες έκτακτης ανάγκης.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Εάν πρόκειται για άμεση τρομοκρατική απειλή, επικοινωνήστε επίσης με τις τοπικές υπηρεσίες έκτακτης ανάγκης.';

  @override
  String get iarActionBlockUserTitle => 'Αποκλεισμός αυτού του χρήστη';

  @override
  String get iarActionBlockUserDescription =>
      'Διακοπή μηνυμάτων και αιτημάτων φιλίας.';

  @override
  String get iarActionBlockUserButton => 'Αποκλεισμός';

  @override
  String get iarActionCopyMessageLinkTitle => 'Αντιγραφή συνδέσμου μηνύματος';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Μοιραστείτε με τους διαχειριστές της κοινότητας.';

  @override
  String get iarActionCopyMessageLinkButton => 'Αντιγραφή';

  @override
  String get iarActionCloseDmTitle => 'Κλείσιμο αυτού του DM';

  @override
  String get iarActionCloseDmDescription =>
      'Δεν αποκλείει. Μπορείτε να το ανοίξετε ξανά αργότερα.';

  @override
  String get iarActionCloseDmButton => 'Κλείσιμο απευθείας μηνύματος';

  @override
  String get iarActionLeaveCommunityTitle => 'Αποχώρηση από την κοινότητα';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Σταμάτα να βλέπεις το περιεχόμενο και τα μέλη της.';

  @override
  String get iarActionLeaveCommunityButton => 'Αποχώρηση';

  @override
  String get iarActionDmSettingsTitle =>
      'Ρυθμίσεις απευθείας μηνυμάτων & αιτημάτων φιλίας';

  @override
  String get iarActionDmSettingsDescription =>
      'Άλλαξε ποιος μπορεί να επικοινωνήσει μαζί σου.';

  @override
  String get iarActionCallSettingsTitle =>
      'Ρυθμίσεις κλήσεων & ομαδικών συνομιλιών';

  @override
  String get iarActionCallSettingsDescription =>
      'Άλλαξε ποιος μπορεί να σε καλέσει ή να σε προσθέσει.';

  @override
  String get iarActionOpenButton => 'Άνοιγμα';

  @override
  String get iarActionDeleteMessageTitle => 'Διαγραφή αυτού του μηνύματος';

  @override
  String get iarActionDeleteMessageDescription =>
      'Αφαίρεσέ το από το κανάλι για όλους.';

  @override
  String get iarActionDeleteMessageButton => 'Διαγραφή';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Διαγράφηκε';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Αυτό το μήνυμα έχει ήδη διαγραφεί.';

  @override
  String get iarActionBanUserTitle => 'Αποκλεισμός αυτού του χρήστη';

  @override
  String get iarActionBanUserDescription =>
      'Άνοιγμα του παραθύρου αποκλεισμού για αυτήν την κοινότητα.';

  @override
  String get iarActionBanUserButton => 'Αποκλεισμός';

  @override
  String get iarActionBanUserBannedButton => 'Αποκλείστηκε';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Αυτός ο χρήστης έχει ήδη αποκλειστεί από την κοινότητα.';

  @override
  String get iarCloseDmConfirmTitle => 'Κλείσιμο απευθείας μηνύματος';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Κλείσε την τρέχουσα απευθείας συνομιλία σου με τον/την $name. Αυτό δεν τον/την μπλοκάρει· μπορείς να την ανοίξεις ξανά αργότερα.';
  }

  @override
  String get iarSuccessTitle => 'Αναφορά στάλθηκε';

  @override
  String get iarSuccessBody =>
      'Η ομάδα ασφαλείας μας την ελέγχει. Θα σου στείλουμε ένα απευθείας μήνυμα και email μόλις καταλήξουμε σε απόφαση.';

  @override
  String get iarAlreadyReportedTitle => 'Έχει ήδη γίνει αναφορά';

  @override
  String get iarAlreadyReportedBody =>
      'Έχεις ήδη αναφέρει αυτό το μήνυμα. Η ομάδα ασφαλείας μας το ελέγχει.';

  @override
  String get iarBackButton => 'Πίσω';

  @override
  String get iarContinueButton => 'Συνέχεια';

  @override
  String get iarSendReportButton => 'Αποστολή αναφοράς';

  @override
  String get iarDoneButton => 'Τέλος';

  @override
  String get iarCouldntSendToast =>
      'Δεν ήταν δυνατή η αποστολή της αναφοράς. Δοκίμασε ξανά.';

  @override
  String get iarRateLimitedToast =>
      'Υποβάλλεις αναφορές πολύ γρήγορα. Παρακαλώ περίμενε λίγο και δοκίμασε ξανά.';

  @override
  String get iarReportSentToast =>
      'Αναφορά στάλθηκε. Η ομάδα ασφαλείας μας θα την ελέγξει.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Να γίνει αποκλεισμός του/της $name; Δεν θα μπορεί να σου στείλει μηνύματα ή αιτήματα φιλίας. Μπορείς να τον/την ξεμπλοκάρεις αργότερα.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Δεν ήταν δυνατός ο αποκλεισμός αυτού του χρήστη. Δοκίμασε ξανά.';

  @override
  String get iarCloseDmSuccessToast => 'Το απευθείας μήνυμα έκλεισε.';

  @override
  String get iarCloseDmFailedToast =>
      'Δεν ήταν δυνατή η κλείσιμο αυτού του απευθείας μηνύματος. Δοκίμασε ξανά.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Δεν ήταν δυνατή η αποχώρηση από αυτήν την κοινότητα. Δοκίμασε ξανά.';

  @override
  String get chatMessageSuppressEmbeds => 'Απόκρυψη Ενσωματώσεων';

  @override
  String get chatMessageUnsuppressEmbeds => 'Εμφάνιση Ενσωματώσεων';

  @override
  String get chatMessageDelete => 'Διαγραφή Μηνύματος';

  @override
  String get chatMessageDeleteConfirmTitle => 'Διαγραφή Μηνύματος';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Είστε σίγουροι ότι θέλετε να διαγράψετε αυτό το μήνυμα;';

  @override
  String get chatMessageDeleteAttachment => 'Delete Attachment';

  @override
  String get chatMessageEditAttachmentAltText => 'Edit Alt Text';

  @override
  String get chatMessageMore => 'Περισσότερα';

  @override
  String get chatEditingMessage => 'Επεξεργασία μηνύματος';

  @override
  String get chatReplyOriginalDeleted => 'Το αρχικό μήνυμα διαγράφηκε';

  @override
  String get chatReplyOriginalFailedToLoad => 'Το αρχικό μήνυμα δεν φορτώθηκε';

  @override
  String get chatReplyAttachedMedia => 'Το μήνυμα περιέχει συνημμένα πολυμέσα';

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
  String get chatMessagesLoadError => 'Δεν ήταν δυνατή η φόρτωση μηνυμάτων.';

  @override
  String get chatReplyMentionOverrideTitle => 'Παράκαμψη προτίμησης αναφοράς;';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return 'Ο/Η $authorNickname προτιμά να γίνεται @αναφορά σε απαντήσεις. Να σταλεί χωρίς την αναφορά ούτως ή άλλως;';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname προτιμά απαντήσεις χωρίς @αναφορά. Θέλετε να στείλετε με την αναφορά ούτως ή άλλως;';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Αγνόηση προτίμησης';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Κάντε κλικ για να απενεργοποιήσετε την ειδοποίηση του χρήστη στον οποίο απαντάτε.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Κάντε κλικ για να ενεργοποιήσετε την ειδοποίηση του χρήστη στον οποίο απαντάτε.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Αναφορά χρήστη στον οποίο απαντάτε';

  @override
  String get chatReplyMentionOn => 'Ενεργό';

  @override
  String get chatReplyMentionOff => 'Ανενεργό';

  @override
  String get chatReplyCancel => 'Ακύρωση απάντησης';

  @override
  String get chatEditMessageHint => 'Επεξεργασία μηνύματος';

  @override
  String get chatEditNoChanges => 'Δεν υπάρχουν αλλαγές για αποθήκευση';

  @override
  String get chatChannelNotReady =>
      'Αυτό το κανάλι δεν είναι έτοιμο ακόμα. Δοκιμάστε ξανά σε λίγο.';

  @override
  String get chatMessageEdited => '(επεξεργάστηκε)';

  @override
  String get chatMessageSilent => 'Αυτό ήταν ένα μήνυμα @silent.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Σήμερα στις $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Χθες στις $time';
  }

  @override
  String get mediaViewerImagePreview => 'Προεπισκόπηση εικόνας';

  @override
  String get mediaViewerClose => 'Κλείσιμο προβολής πολυμέσων';

  @override
  String get mediaViewerOpenInBrowser => 'Άνοιγμα στο πρόγραμμα περιήγησης';

  @override
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

  @override
  String get mediaViewerForward => 'Προώθηση';

  @override
  String get mediaViewerZoomIn => 'Μεγέθυνση';

  @override
  String get mediaViewerZoomOut => 'Σμίκρυνση';

  @override
  String get mediaViewerPreviousAttachment => 'Προηγούμενο συνημμένο';

  @override
  String get mediaViewerNextAttachment => 'Επόμενο συνημμένο';

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
  String get chatAttachmentVideoToggleControls => 'Εναλλαγή ελέγχων βίντεο';

  @override
  String get chatAttachmentVideoMute => 'Σίγαση βίντεο';

  @override
  String get chatAttachmentVideoUnmute => 'Αποσίγαση βίντεο';

  @override
  String get chatAttachmentVideoPlay => 'Αναπαραγωγή βίντεο';

  @override
  String get chatAttachmentVideoPause => 'Παύση βίντεο';

  @override
  String get chatAttachmentVideoProgress => 'Πρόοδος βίντεο';

  @override
  String get chatVideoPlaybackFailed =>
      'Δεν ήταν δυνατή η αναπαραγωγή αυτού του βίντεο.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Ειδοποιήστε τους χρήστες με αυτόν τον ρόλο που έχουν δικαίωμα προβολής αυτού του καναλιού.';

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
  String get addGuildModalTitle => 'Προσθήκη κοινότητας';

  @override
  String get addGuildModalLandingDescription =>
      'Δημιουργήστε μια νέα κοινότητα ή συνδεθείτε σε μια υπάρχουσα.';

  @override
  String get addGuildCreateCommunity => 'Δημιουργία κοινότητας';

  @override
  String get addGuildJoinCommunity => 'Σύνδεση στην κοινότητα';

  @override
  String get addGuildImportDiscordTemplate => 'Εισαγωγή προτύπου Discord';

  @override
  String get addGuildJoinTitle => 'Σύνδεση σε κοινότητα';

  @override
  String get addGuildJoinDescription =>
      'Εισαγάγετε τον σύνδεσμο πρόσκλησης για να συνδεθείτε σε μια κοινότητα.';

  @override
  String get addGuildInviteLinkLabel => 'Σύνδεσμος πρόσκλησης';

  @override
  String get addGuildJoinSubmit => 'Σύνδεση στην κοινότητα';

  @override
  String get addGuildInviteInvalid =>
      'Αυτή η πρόσκληση είναι άκυρη ή έχει λήξει.';

  @override
  String get addGuildJoinFailed =>
      'Δεν ήταν δυνατή η σύνδεση στην κοινότητα. Παρακαλώ δοκιμάστε ξανά.';

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
  String get addGuildPackInstalled => 'Το πακέτο εγκαταστάθηκε με επιτυχία.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Αφαίρεση όλων των αντιδράσεων';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Είστε σίγουροι ότι θέλετε να αφαιρέσετε όλες τις αντιδράσεις από αυτό το μήνυμα;';

  @override
  String get chatMessageUnpinConfirmTitle => 'Αποκαθήλωση μηνύματος';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Θέλετε να στείλετε αυτήν την καρφίτσα πίσω στο χρόνο;';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username καρφίτσωσε $messageLink σε αυτό το κανάλι. Δείτε $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'ένα μήνυμα';

  @override
  String get systemPinMessageAllPinsLink => 'όλα τα καρφιτσωμένα μηνύματα';

  @override
  String get channelPinsEmptyTitle => 'Δεν υπάρχουν καρφιτσωμένα μηνύματα';

  @override
  String get channelPinsEmptyDescription =>
      'Τα καρφιτσωμένα μηνύματα εμφανίζονται εδώ.';

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
  String get personalNotesTitle => 'Προσωπικές σημειώσεις';

  @override
  String get personalNotesSubtitle =>
      'Ο ιδιωτικός σας χώρος για σκέψεις και υπενθυμίσεις';

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
    return 'Καλώς ήρθατε στο $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'Στην αρχή, δεν υπήρχε τίποτα. Μετά, υπήρχε το $channelName. Και ήταν καλό.';
  }

  @override
  String get personalNotesComposerHint => 'Στείλτε μήνυμα στον εαυτό σας';

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
  String get personalNotesPrivateSpace => 'Ο ιδιωτικός σας χώρος';

  @override
  String get purgePersonalNotes => 'Εκκαθάριση προσωπικών σημειώσεων';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Αυτό θα διαγράψει οριστικά κάθε μήνυμα και συνημμένο στις προσωπικές σας σημειώσεις. Αυτό δεν μπορεί να αναιρεθεί.';

  @override
  String get purgePersonalNotesConfirmButton => 'Εκκαθάριση';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Εκκαθαρίστηκαν $count μηνύματα από τις προσωπικές σημειώσεις';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Οι προσωπικές σημειώσεις ήταν ήδη κενές';

  @override
  String get purgePersonalNotesFailed =>
      'Δεν ήταν δυνατή η εκκαθάριση των προσωπικών σημειώσεων';

  @override
  String get userSettingsGroupYourAccount => 'Ο ΛΟΓΑΡΙΑΣΜΟΣ ΣΑΣ';

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
  String get userSettingsNavProfile => 'Προφίλ';

  @override
  String get userSettingsNavSecurityLogin => 'Ασφάλεια & Σύνδεση';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Δώρα & Κωδικοί';

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
  String get userSettingsNavPrivacyDashboard => 'Πίνακας Ελέγχου Απορρήτου';

  @override
  String get userSettingsNavAuthorizedApps => 'Εξουσιοδοτημένες Εφαρμογές';

  @override
  String get userSettingsNavBlockedUsers => 'Αποκλεισμένοι Χρήστες';

  @override
  String get userSettingsNavLinkedDevices => 'Συνδεδεμένες Συσκευές';

  @override
  String get userSettingsNavConnections => 'Συνδέσεις';

  @override
  String get userSettingsNavLookAndFeel => 'Εμφάνιση & Αίσθηση';

  @override
  String get userSettingsNavAccessibility => 'Προσβασιμότητα';

  @override
  String get userSettingsNavChat => 'Μηνύματα & Πολυμέσα';

  @override
  String get userSettingsNavAudioAndVideo => 'Ήχος & Βίντεο';

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
  String get userSettingsNavLanguageAndTime => 'Γλώσσα & Ώρα';

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
  String get userSettingsNavAdvanced => 'Για προχωρημένους';

  @override
  String get advancedPerformanceReportingTitle => 'Αναφορές απόδοσης';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'Βοηθήστε στη βελτίωση του $productName μοιράζοντας ανώνυμα δεδομένα σφαλμάτων και απόδοσης.';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'Αποστολή αναφορών σφαλμάτων και απόδοσης';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'Όλα τα αναφερόμενα δεδομένα είναι ανώνυμα και αποστέλλονται μόνο στην υπηρεσία παρακολούθησης του $productName — δεν χρησιμοποιούνται πάροχοι τρίτων.';
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
  String get userSettingsNavApplications => 'Εφαρμογές';

  @override
  String get userSettingsNavAppLogs => 'Αρχεία Καταγραφής Εφαρμογής';

  @override
  String get userSettingsNavDeveloperTools => 'Εργαλεία Προγραμματιστή';

  @override
  String get userSettingsNavLimitsConfig => 'Ρύθμιση Ορίων';

  @override
  String get userSettingsNavFeatureFlags => 'Σημαίες Λειτουργιών';

  @override
  String get userSettingsNavWhatsNew => 'Τι νέο υπάρχει';

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
  String get userSettingsNavLogOut => 'Αποσύνδεση';

  @override
  String get quickSwitcherTabSearch => 'Αναζήτηση';

  @override
  String get quickSwitcherTabFriends => 'Φίλοι';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Αναζήτηση καναλιών, ατόμων ή κοινοτήτων';

  @override
  String get quickSwitcherSearchFriends => 'Αναζήτηση φίλων';

  @override
  String get quickSwitcherNoMatchesFound => 'Δεν βρέθηκαν αντιστοιχίες';

  @override
  String get quickSwitcherEmptyHint =>
      'Δοκιμάστε ένα διαφορετικό όνομα ή χρησιμοποιήστε προθέματα @ / # / ! / * για να φιλτράρετε τα αποτελέσματα.';

  @override
  String get quickSwitcherSectionPeople => 'Άτομα';

  @override
  String get quickSwitcherSectionGroupMessages => 'Ομαδικά μηνύματα';

  @override
  String get quickSwitcherSectionTextChannels => 'Κανάλια κειμένου';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Κανάλια φωνής';

  @override
  String get quickSwitcherSectionCommunities => 'Κοινοτήτες';

  @override
  String get quickSwitcherSectionSettings => 'Ρυθμίσεις';

  @override
  String get quickSwitcherHomeLabel => 'Αρχική';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Άμεσα μηνύματα';

  @override
  String get quickSwitcherFavoritesLabel => 'Αγαπημένα';

  @override
  String get quickSwitcherUserSettingsLabel => 'Ρυθμίσεις χρήστη';

  @override
  String get quickSwitcherNotificationsLabel => 'Ειδοποιήσεις';

  @override
  String get quickSwitcherBookmarksLabel => 'Σελιδοδείκτες';

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
  String get quickSwitcherMentionsLabel => 'Αναφορές';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Δεν υπάρχουν φίλοι ακόμα';

  @override
  String get quickSwitcherFriendsEmptyHint =>
      'Προσθέστε έναν φίλο για να ξεκινήσετε.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Κανένας φίλος δεν ταιριάζει με αυτήν την αναζήτηση';

  @override
  String get quickSwitcherFriendsNoMatchHint =>
      'Δοκιμάστε ένα διαφορετικό όνομα.';

  @override
  String get quickSwitcherSearchAliasUser => 'Χρήστης';

  @override
  String get quickSwitcherSearchAliasYou => 'Εσύ';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'DM';

  @override
  String get quickSwitcherSearchAliasMessages => 'Μηνύματα';

  @override
  String get quickSwitcherSearchAliasFav => 'Αγαπ.';

  @override
  String get quickSwitcherSearchAliasStarred => 'Αστέρια';

  @override
  String get quickSwitcherSearchAliasInbox => 'Εισερχόμενα';

  @override
  String get quickSwitcherSearchAliasSaved => 'Αποθηκευμένα';

  @override
  String get uiClose => 'Κλείσιμο';

  @override
  String get chatJumpToBottom => 'Μετάβαση στο κάτω μέρος';

  @override
  String get uiConfirm => 'Επιβεβαίωση';

  @override
  String get uiLoading => 'Φόρτωση';

  @override
  String get uiUnsavedChanges => 'Μη αποθηκευμένες αλλαγές';

  @override
  String get uiReset => 'Επαναφορά';

  @override
  String get uiOpenColorPicker => 'Άνοιγμα επιλογέα χρώματος';

  @override
  String get uiSelectPlaceholder => 'Επιλογή';

  @override
  String get uiSearchPlaceholder => 'Αναζήτηση';

  @override
  String get uiNoOptionsFound => 'Δεν βρέθηκαν επιλογές';

  @override
  String get uiDismissNotification => 'Απόρριψη ειδοποίησης';

  @override
  String get uiColorPickerTitle => 'Επιλογέας χρώματος';

  @override
  String get mentionConfirmTitle => 'Να γίνει αναφορά σε όλους;';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Αυτό θα ειδοποιήσει $count μέλη. Συνέχεια;';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Αυτό θα ειδοποιήσει $count μέλη σε σύνδεση. Συνέχεια;';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'This will notify $count members with the $roleName role. Continue?';
  }

  @override
  String get mentionConfirmButton => 'Αναφορά';

  @override
  String get composerEmojiUnavailable =>
      'Δεν μπορείτε να χρησιμοποιήσετε αυτό το emoji εδώ.';

  @override
  String get instanceUrlLabel => 'Διεύθυνση URL παρουσίας';

  @override
  String get instanceUrlPlaceholder =>
      'Εισαγάγετε διεύθυνση URL παρουσίας (π.χ. fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Επαναφορά στο Fluxer';

  @override
  String get instanceConnect => 'Σύνδεση';

  @override
  String get instanceConnecting => 'Σύνδεση…';

  @override
  String get instanceConnectFailed => 'Αποτυχία σύνδεσης στην παρουσία';

  @override
  String get recentInstances => 'Πρόσφατες παρουσίες';

  @override
  String removeRecentInstance(String domain) {
    return 'Αφαίρεση του $domain από τις πρόσφατες παρουσίες';
  }

  @override
  String get instanceSheetTitle => 'Σύνδεση στην παρουσία';

  @override
  String get connectToDifferentInstance => 'Σύνδεση σε διαφορετική παρουσία';

  @override
  String get changeInstance => 'Αλλαγή';

  @override
  String get instanceConnectionRequired =>
      'Συνδεθείτε στην παρουσία για να συνδεθείτε';

  @override
  String get comingSoon => 'Σύντομα κοντά σας';

  @override
  String get guildNavbarDirectMessages => 'Άμεσα Μηνύματα';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Εξερεύνηση Κοινοτήτων που Γίνονται Αντιληπτές';

  @override
  String get discoveryExplore => 'Εξερεύνηση';

  @override
  String get discoveryExplorePublicCommunities =>
      'Εξερεύνηση δημόσιων κοινοτήτων';

  @override
  String get discoveryListingSubheading =>
      'Θέλετε να καταχωρήσετε την κοινότητά σας εδώ; Υποβάλετε αίτηση εάν πληροίτε τις απαιτήσεις στις ρυθμίσεις της κοινότητάς σας > Εξερεύνηση.';

  @override
  String get discoverySearchCommunities => 'Αναζήτηση κοινοτήτων';

  @override
  String get discoveryFilterByLanguage => 'Φιλτράρισμα κατά γλώσσα';

  @override
  String get discoveryAllLanguages => 'Όλες οι γλώσσες';

  @override
  String get discoveryAllCategories => 'Όλα';

  @override
  String get discoveryCategoryGaming => 'Gaming';

  @override
  String get discoveryCategoryMusic => 'Μουσική';

  @override
  String get discoveryCategoryEntertainment => 'Ψυχαγωγία';

  @override
  String get discoveryCategoryEducation => 'Εκπαίδευση';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Επιστήμη & Τεχνολογία';

  @override
  String get discoveryCategoryContentCreator => 'Δημιουργός Περιεχομένου';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime & Manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Ταινίες & TV';

  @override
  String get discoveryCategoryOther => 'Άλλο';

  @override
  String get discoveryNoCommunitiesMatch => 'Καμία κοινότητα δεν ταιριάζει.';

  @override
  String get discoveryJoinCommunity => 'Συμμετοχή στην κοινότητα';

  @override
  String get discoveryJoined => 'Συμμετείχατε';

  @override
  String discoveryOnlineCount(String count) {
    return '$count σε σύνδεση';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString μέλη',
      one: '1 μέλος',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Χωρίς περιγραφή.';

  @override
  String get discoveryCommunities => 'Κοινοτήτων';

  @override
  String get discoveryApps => 'Εφαρμογές';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Αδύνατη η συμμετοχή σε αυτήν την κοινότητα';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Κάτι πήγε στραβά. Παρακαλώ δοκιμάστε ξανά σε λίγο.';

  @override
  String get discoveryJoinErrorFullTitle => 'Αυτή η κοινότητα είναι γεμάτη';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Αυτή η κοινότητα έφτασε στο όριο μελών της, οπότε δεν μπορείτε να συμμετάσχετε αυτήν τη στιγμή.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Έχετε φτάσει στο όριο κοινοτήτων';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Είστε στον μέγιστο αριθμό κοινοτήτων. Αφήστε μία και δοκιμάστε ξανά.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Δεν μπορείτε να συμμετάσχετε σε αυτήν την κοινότητα';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Έχετε αποκλειστεί από αυτήν την κοινότητα.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Αυτή η κοινότητα δεν είναι πλέον διαθέσιμη';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Μπορεί να έχει φύγει από την εξερεύνηση ή να έχει απενεργοποιήσει νέες συμμετοχές. Ανανεώστε τη σελίδα και δεν θα τη δείτε ξανά.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Πηγαίνετε πολύ γρήγορα';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Παρακαλώ περιμένετε λίγο και δοκιμάστε ξανά.';

  @override
  String get guildNavbarAddCommunity => 'Προσθήκη κοινότητας';

  @override
  String get guildNavbarHelp => 'Βοήθεια';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'ΝΕΟ ΜΗΝΥΜΑ';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Σύμπτυξη $folderName';
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
  String get guildNavbarGroupDm => 'Ομαδικό DM';

  @override
  String get guildNavbarCreateChannel => 'Δημιουργία καναλιού';

  @override
  String get guildNavbarChannelType => 'Τύπος καναλιού';

  @override
  String get guildNavbarTextChannel => 'Κανάλι κειμένου';

  @override
  String get guildNavbarTextChannelDescription =>
      'Αποστολή μηνυμάτων, εικόνων, GIF και emoji';

  @override
  String get guildNavbarVoiceChannel => 'Κανάλι φωνής';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Συνδεθείτε με φωνή, βίντεο και κοινή χρήση οθόνης';

  @override
  String get guildNavbarLinkChannel => 'Σύνδεση καναλιού';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Γρήγορη πρόσβαση σε εξωτερικό ιστότοπο ή πόρο';

  @override
  String get guildNavbarNameLabel => 'Όνομα';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

  @override
  String get guildNavbarCreateCategory => 'Δημιουργία κατηγορίας';

  @override
  String get guildNavbarNewCategoryHint => 'Νέα κατηγορία';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Προσκαλέστε φίλους στο $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Οι παραλήπτες θα μεταφερθούν στο #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Αναζήτηση φίλων';

  @override
  String get guildNavbarNoFriendsYet => 'Δεν υπάρχουν φίλοι ακόμα';

  @override
  String get guildNavbarNoResults => 'Δεν βρέθηκαν αποτελέσματα';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Εναλλακτικά, στείλτε έναν σύνδεσμο πρόσκλησης σε έναν φίλο:';

  @override
  String get guildNavbarInviteLink => 'Σύνδεσμος πρόσκλησης';

  @override
  String get guildNavbarCopy => 'Αντιγραφή';

  @override
  String get guildNavbarCopied => 'Αντιγράφηκε!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Ο σύνδεσμος πρόσκλησής σας λήγει σε 7 ημέρες.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Αυτός ο σύνδεσμος πρόσκλησης δεν λήγει ποτέ.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Ο σύνδεσμος πρόσκλησής σας λήγει σε $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Επεξεργασία συνδέσμου πρόσκλησης';

  @override
  String get guildNavbarInviteLinkSettings => 'Ρυθμίσεις συνδέσμου πρόσκλησης';

  @override
  String get guildNavbarExpireAfter => 'Λήξη μετά από';

  @override
  String get guildNavbarMaxUses => 'Μέγιστος αριθμός χρήσεων';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Παραχώρηση προσωρινής συμμετοχής';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Τα μέλη θα αφαιρεθούν όταν αποσυνδεθούν, εκτός αν τους έχει ανατεθεί ρόλος';

  @override
  String get guildNavbarCreateNewLink => 'Δημιουργία νέου συνδέσμου';

  @override
  String get guildNavbarSent => 'Στάλθηκε';

  @override
  String get guildNavbarInvite => 'Πρόσκληση';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Αποχώρηση από την κοινότητα';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Είστε σίγουροι ότι θέλετε να αποχωρήσετε από αυτήν την κοινότητα; Δεν θα μπορείτε πλέον να βλέπετε μηνύματα.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Αποχώρηση από την κοινότητα';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Διαγραφή των μηνυμάτων σας σε αυτήν την κοινότητα;';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Διαγράψτε οριστικά κάθε μήνυμα που έχετε στείλει εδώ, σε όλα τα κανάλια. Δεν μπορεί να αναιρεθεί.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Διαγραφή των μηνυμάτων μου';

  @override
  String get guildNavbarDeletedYourMessages => 'Διαγράφηκαν τα μηνύματά σας';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Δεν ήταν δυνατή η διαγραφή των μηνυμάτων σας';

  @override
  String get guildNavbarRemoveOverride => 'Αφαίρεση παράκαμψης';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Σε σίγαση έως $formattedDate';
  }

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'Προσβάσιμο μόνο από το προσωπικό του $productName';
  }

  @override
  String get guildNavbarInvitesPaused =>
      'Οι προσκλήσεις έχουν παγώσει προσωρινά σε αυτήν την κοινότητα';

  @override
  String get guildNavbarDurationNever => 'ποτέ';

  @override
  String get guildNavbarDuration30Minutes => '30 λεπτά';

  @override
  String get guildNavbarDuration1Hour => '1 ώρα';

  @override
  String get guildNavbarDuration6Hours => '6 ώρες';

  @override
  String get guildNavbarDuration12Hours => '12 ώρες';

  @override
  String get guildNavbarDuration1Day => '1 ημέρα';

  @override
  String get guildNavbarDuration7Days => '7 ημέρες';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count δευτερόλεπτα';
  }

  @override
  String get guildNavbarNever => 'Ποτέ';

  @override
  String get guildNavbarNoLimit => 'Χωρίς όριο';

  @override
  String get guildNavbarOneUse => '1 χρήση';

  @override
  String guildNavbarUses(int count) {
    return '$count χρήσεις';
  }

  @override
  String get guildMenuMarkAsRead => 'Σήμανση ως αναγνωσμένα';

  @override
  String get guildPeekMoreOptions => 'Περισσότερες επιλογές';

  @override
  String get guildMenuInviteMembers => 'Πρόσκληση μελών';

  @override
  String get guildMenuCommunitySettings => 'Ρυθμίσεις κοινότητας';

  @override
  String get guildMenuEditCommunityProfile => 'Επεξεργασία προφίλ κοινότητας';

  @override
  String get guildMenuUnmuteCommunity => 'Κατάργηση σίγασης κοινότητας';

  @override
  String get guildMenuMuteCommunity => 'Σίγαση κοινότητας';

  @override
  String get guildMenuHideMutedChannels => 'Απόκρυψη καναλιών σε σίγαση';

  @override
  String get guildMenuReportCommunity => 'Αναφορά κοινότητας';

  @override
  String get guildMenuDebugCommunity => 'Αποσφαλμάτωση κοινότητας';

  @override
  String get guildMenuCopyCommunityId => 'Αντιγραφή αναγνωριστικού κοινότητας';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Μέχρι $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Γενικά';

  @override
  String get guildMenuSettingsRoles => 'Ρόλοι & Δικαιώματα';

  @override
  String get guildMenuSettingsEmoji => 'Προσαρμοσμένα emoji';

  @override
  String get guildMenuSettingsStickers => 'Προσαρμοσμένα αυτοκόλλητα';

  @override
  String get guildMenuSettingsSafetyModeration => 'Ασφάλεια & Εποπτεία';

  @override
  String get guildMenuSettingsActivityLog => 'Αρχείο δραστηριοτήτων';

  @override
  String get guildMenuSettingsWebhooks => 'Webhooks';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'Προσαρμοσμένο URL πρόσκλησης';

  @override
  String get guildMenuSettingsDiscovery => 'Ανακάλυψη';

  @override
  String get guildMenuSettingsMembers => 'Μέλη';

  @override
  String get guildMenuSettingsInviteLinks => 'Σύνδεσμοι πρόσκλησης';

  @override
  String get guildMenuSettingsBans => 'Απαγορεύσεις';

  @override
  String get guildMenuSettingsChannels => 'Channels';

  @override
  String get guildSettingsNoPermission =>
      'Δεν έχετε άδεια να δείτε αυτήν την καρτέλα ρυθμίσεων.';

  @override
  String get guildSettingsOverviewIconTitle => 'Εικονίδιο';

  @override
  String get guildSettingsUploadImage => 'Μεταφόρτωση εικόνας';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Μεταφορτώστε ένα banner για τον διακομιστή σας.';

  @override
  String get guildSettingsOverviewNameTitle => 'Όνομα';

  @override
  String get guildSettingsOverviewNameHint => 'Η υπέροχη κοινότητά μου';

  @override
  String get guildSettingsOverviewStatsTitle => 'Στατιστικά';

  @override
  String get guildSettingsOverviewMembers => 'Μέλη';

  @override
  String get guildSettingsOverviewOnline => 'Σε σύνδεση';

  @override
  String get guildSettingsRolesDescription =>
      'Χρησιμοποιήστε ρόλους για να ομαδοποιήσετε μέλη και να εκχωρήσετε δικαιώματα.';

  @override
  String get guildSettingsCreateRole => 'Δημιουργία ρόλου';

  @override
  String get guildSettingsRolesListTitle => 'Ρόλοι';

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
    return '$staticCount στατικά, $animatedCount κινούμενα emoji χρησιμοποιούνται';
  }

  @override
  String get guildSettingsEmojiEmpty =>
      'Δεν υπάρχουν ακόμη προσαρμοσμένα emoji.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count αυτοκόλλητα έχουν μεταφορτωθεί';
  }

  @override
  String get guildSettingsStickersEmpty =>
      'Δεν υπάρχουν ακόμη προσαρμοσμένα αυτοκόλλητα.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Επαλήθευση μέλους';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Επιλέξτε τι πρέπει να έχουν τα μέλη πριν μπορούν να δημοσιεύουν ή να στέλνουν απευθείας μηνύματα σε μέλη της κοινότητας.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Τα μέλη με ρόλους μπορούν να παρακάμψουν αυτούς τους ελέγχους. Για δημόσιους χώρους, συνιστούμε την ενεργοποίηση της επαλήθευσης.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Οι κοινότητες που αναφέρονται στην Εξερεύνηση απαιτούν τουλάχιστον επαληθευμένο email. Το \'Κανένα\' δεν μπορεί να επιλεγεί ενώ η Εξερεύνηση είναι ενεργοποιημένη.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Ώριμο περιεχόμενο & προειδοποιήσεις περιεχομένου';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Ρυθμίστε την επισήμανση ώριμου περιεχομένου και τις προαιρετικές προειδοποιήσεις περιεχομένου για τα μέλη.';

  @override
  String get guildSettingsModerationMatureToggle => 'Ώριμο περιεχόμενο';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Σημειώστε αυτήν την κοινότητα ως περιέχουσα ώριμο περιεχόμενο.';

  @override
  String get guildSettingsVerificationNone => 'Κανένα';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Δεν απαιτείται επαλήθευση.';

  @override
  String get guildSettingsVerificationLow => 'Χαμηλό';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Απαιτεί μια επαληθευμένη διεύθυνση email.';

  @override
  String get guildSettingsVerificationMedium => 'Μεσαίο';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Απαιτεί μια επαληθευμένη διεύθυνση email και έναν λογαριασμό που είναι τουλάχιστον 5 λεπτών.';

  @override
  String get guildSettingsVerificationHigh => 'Υψηλό';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Απαιτεί τα πάντα στο μεσαίο επίπεδο, συν ότι είναι μέλος της κοινότητας για τουλάχιστον 10 λεπτά.';

  @override
  String get guildSettingsVerificationHighest => 'Πολύ υψηλό';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Απαιτεί έναν επαληθευμένο αριθμό τηλεφώνου.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Παρακολουθήστε τις ενέργειες των συντονιστών σε όλη την κοινότητα.';

  @override
  String get guildSettingsAuditLogEmpty => 'Δεν υπάρχουν ακόμη καταγραφές';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Οι ενέργειες συντονισμού και οι αλλαγές στην κοινότητα θα εμφανίζονται εδώ.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Όλοι οι χρήστες';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Όλες οι ενέργειες';

  @override
  String get guildSettingsAuditLogNoReason => 'Δεν δόθηκε αιτιολογία.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Άγνωστος χρήστης';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Κάτι πήγε στραβά κατά τη φόρτωση του αρχείου καταγραφής δραστηριοτήτων.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Αδυναμία φόρτωσης αρχείων καταγραφής δραστηριοτήτων';

  @override
  String get guildSettingsAuditLogReason => 'Αιτιολογία';

  @override
  String get guildSettingsAuditLogSomeone => 'κάποιος';

  @override
  String get guildSettingsAuditLogSomething => 'κάτι';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'άγνωστη οντότητα';

  @override
  String get guildSettingsAuditLogNothing => 'τίποτα';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Άγνωστος στόχος';

  @override
  String get auditLogActionGuildUpdate => 'Η κοινότητα ενημερώθηκε';

  @override
  String get auditLogActionChannelCreate => 'Το κανάλι δημιουργήθηκε';

  @override
  String get auditLogActionChannelUpdate => 'Το κανάλι ενημερώθηκε';

  @override
  String get auditLogActionChannelDelete => 'Το κανάλι διαγράφηκε';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Προστέθηκε παράκαμψη καναλιού';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Η παράκαμψη καναλιού ενημερώθηκε';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Η παράκαμψη καναλιού αφαιρέθηκε';

  @override
  String get auditLogActionMemberKick => 'Το μέλος αποβλήθηκε';

  @override
  String get auditLogActionMemberPrune => 'Τα μέλη αφαιρέθηκαν';

  @override
  String get auditLogActionMemberBanAdd => 'Το μέλος αποκλείστηκε';

  @override
  String get auditLogActionMemberBanRemove => 'Το μέλος αποαποκλείστηκε';

  @override
  String get auditLogActionMemberUpdate => 'Το μέλος ενημερώθηκε';

  @override
  String get auditLogActionMemberRoleUpdate =>
      'Οι ρόλοι των μελών ενημερώθηκαν';

  @override
  String get auditLogActionMemberMove => 'Το μέλος μετακινήθηκε';

  @override
  String get auditLogActionMemberDisconnect => 'Το μέλος αποσυνδέθηκε';

  @override
  String get auditLogActionBotAdd => 'Το bot προστέθηκε';

  @override
  String get auditLogActionRoleCreate => 'Ο ρόλος δημιουργήθηκε';

  @override
  String get auditLogActionRoleUpdate => 'Ο ρόλος ενημερώθηκε';

  @override
  String get auditLogActionRoleDelete => 'Ρόλος διαγράφηκε';

  @override
  String get auditLogActionInviteCreate => 'Πρόσκληση δημιουργήθηκε';

  @override
  String get auditLogActionInviteUpdate => 'Πρόσκληση ενημερώθηκε';

  @override
  String get auditLogActionInviteDelete => 'Πρόσκληση διαγράφηκε';

  @override
  String get auditLogActionWebhookCreate => 'Webhook δημιουργήθηκε';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook ενημερώθηκε';

  @override
  String get auditLogActionWebhookDelete => 'Webhook διαγράφηκε';

  @override
  String get auditLogActionEmojiCreate => 'Emoji δημιουργήθηκε';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji ενημερώθηκε';

  @override
  String get auditLogActionEmojiDelete => 'Emoji διαγράφηκε';

  @override
  String get auditLogActionStickerCreate => 'Αυτοκόλλητο δημιουργήθηκε';

  @override
  String get auditLogActionStickerUpdate => 'Αυτοκόλλητο ενημερώθηκε';

  @override
  String get auditLogActionStickerDelete => 'Αυτοκόλλητο διαγράφηκε';

  @override
  String get auditLogActionMessageDelete => 'Μήνυμα διαγράφηκε';

  @override
  String get auditLogActionMessageBulkDelete => 'Μηνύματα διαγράφηκαν';

  @override
  String get auditLogActionMessagePin => 'Μήνυμα καρφιτσώθηκε';

  @override
  String get auditLogActionMessageUnpin => 'Μήνυμα ξεκαρφιτσώθηκε';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return 'Ο/Η $actor ενημέρωσε τις ρυθμίσεις της κοινότητας.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return 'Ο/Η $actor δημιούργησε το κανάλι $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return 'Ο/Η $actor ενημέρωσε το κανάλι $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return 'Ο/Η $actor διέγραψε το κανάλι $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return 'Ο/Η $actor πρόσθεσε δικαιώματα καναλιού για τον/την $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'Ο/Η $actor πρόσθεσε δικαιώματα καναλιού για τον/την $target στο κανάλι $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return 'Ο/Η $actor ενημέρωσε τα δικαιώματα καναλιού για τον/την $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'Ο/Η $actor ενημέρωσε τα δικαιώματα καναλιού για τον/την $target στο κανάλι $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor αφαίρεσε δικαιώματα καναλιού για τον/την $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor αφαίρεσε δικαιώματα καναλιού για τον/την $target στο κανάλι $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor έκανε kick στον/στην $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor έκανε ban στον/στην $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor έκανε unban στον/στην $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor ενημέρωσε τον/την $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor ενημέρωσε τους ρόλους για τον/την $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor αφαίρεσε ανενεργά μέλη.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor αφαίρεσε μέλη ανενεργά για $days ημέρες.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor μετέφερε τον/την $target σε άλλο φωνητικό κανάλι.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor μετέφερε τον/την $target στο κανάλι $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor αποσύνδεσε τον/την $target από τη φωνή.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor πρόσθεσε το bot $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor δημιούργησε τον ρόλο $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor ενημέρωσε τον ρόλο $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor διέγραψε τον ρόλο $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor δημιούργησε την πρόσκληση $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor δημιούργησε την πρόσκληση $target για το κανάλι $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor ενημέρωσε την πρόσκληση $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor ενημέρωσε την πρόσκληση $target για το κανάλι $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor διέγραψε την πρόσκληση $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor διέγραψε την πρόσκληση $target για το κανάλι $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor δημιούργησε το webhook $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor ενημέρωσε το webhook $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor διέγραψε το webhook $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor πρόσθεσε το emoji $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor ενημέρωσε το emoji $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor διέγραψε το emoji $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor πρόσθεσε το αυτοκόλλητο $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor ενημέρωσε το αυτοκόλλητο $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor διέγραψε το αυτοκόλλητο $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor διέγραψε ένα μήνυμα.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor διέγραψε ένα μήνυμα στο $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor διέγραψε πολλά μηνύματα.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor διέγραψε $count μηνύματα.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor διέγραψε πολλά μηνύματα στο $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor διέγραψε $count μηνύματα στο $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor καρφίτσωσε ένα μήνυμα.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor καρφίτσωσε ένα μήνυμα στο $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor αφαίρεσε ένα καρφιτσωμένο μήνυμα.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor αφαίρεσε ένα καρφιτσωμένο μήνυμα από το $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor πραγματοποίησε ενέργεια ελέγχου στο $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Ενημερώθηκε το $field από $oldValue σε $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Ορίστηκε το $field σε $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Καθαρίστηκε το $field (ήταν $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Ενημερώθηκε το $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Μετονομάστηκε η κοινότητα σε $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Ενημερώθηκε το εικονίδιο της κοινότητας.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Μετονομάστηκε το κανάλι σε $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Καθαρίστηκε το θέμα.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Ενημερώθηκε το θέμα σε $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'Ενεργοποιήθηκε το περιεχόμενο για ενηλίκους.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Απενεργοποιήθηκε το περιεχόμενο για ενηλίκους.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Ορίστηκε το ψευδώνυμο σε $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Αφαιρέθηκε το ψευδώνυμο $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Το μέλος τέθηκε σε σίγαση.';

  @override
  String get auditLogChangeUnmutedMember =>
      'Το μέλος δεν βρίσκεται πλέον σε σίγαση.';

  @override
  String get auditLogChangeDeafenedMember => 'Το μέλος κωφώθηκε.';

  @override
  String get auditLogChangeUndeafenedMember => 'Το μέλος δεν κωφώνεται πλέον.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Προστέθηκαν οι ρόλοι $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Αφαιρέθηκαν οι ρόλοι $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Κανάλι: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Μήνυμα: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Προσκλήθηκε από $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Διαγράφηκαν # μηνύματα.',
      one: 'Διαγράφηκε # μήνυμα.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Αφαιρέθηκαν # μέλη.',
      one: 'Αφαιρέθηκε # μέλος.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'Αυτή η πρόσκληση δεν λήγει ποτέ.';

  @override
  String get auditLogOptionTemporaryMembership =>
      'Παρέχει προσωρινή ιδιότητα μέλους.';

  @override
  String get auditLogOptionPermanentMembership =>
      'Παρέχει μόνιμη ιδιότητα μέλους.';

  @override
  String get guildSettingsLoadMore => 'Φόρτωση περισσότερων';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Διαχείριση webhook που δημοσιεύουν μηνύματα σε κανάλια.';

  @override
  String get guildSettingsWebhooksEmpty => 'Δεν έχουν ρυθμιστεί webhook.';

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
  String get guildSettingsCopyUrl => 'Αντιγραφή URL';

  @override
  String get guildSettingsCopiedUrl => 'Το URL αντιγράφηκε στο πρόχειρο';

  @override
  String get guildSettingsDeleteWebhook => 'Διαγραφή webhook';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Ορίστε έναν προσαρμοσμένο σύνδεσμο πρόσκλησης για τον διακομιστή σας.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Αποθήκευση';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Χρήση';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count χρήσεις';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Κάντε αίτηση για να συμπεριληφθείτε στην ανακάλυψη διακομιστών.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Not enough members';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Απαιτούνται τουλάχιστον $count μέλη για την υποβολή αίτησης.';
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
  String get guildSettingsDiscoveryCategory => 'Κατηγορία';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Choose the category that best describes your community. You can change this any time.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Primary language';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'The language most of your community speaks. Used to filter Discovery results.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Περιγραφή';

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
  String get guildSettingsDiscoveryTags => 'Ετικέτες';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Up to $maxTags tags help people find your community. They show up in Discovery search.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'gaming, art, music';

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
  String get guildSettingsDiscoveryApply => 'Υποβολή Αίτησης';

  @override
  String get guildSettingsDiscoverySave => 'Save';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Απόσυρση';

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
      'Αναζήτηση και διαχείριση μελών διακομιστή.';

  @override
  String get guildSettingsMembersSearchHint => 'Αναζήτηση μελών';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count μέλη';
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
  String get guildSettingsMembersSortNewest => 'Νεότεροι πρώτα';

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
      'Προβολή και ανάκληση ενεργών συνδέσμων πρόσκλησης.';

  @override
  String get guildSettingsInvitesEmpty => 'Δεν υπάρχουν ενεργές προσκλήσεις.';

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
    return '$uses / $maxUses χρήσεις';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Λήγει $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Προβολή και διαχείριση αποκλεισμένων χρηστών.';

  @override
  String get guildSettingsBansSearchHint => 'Αναζήτηση αποκλεισμών';

  @override
  String get guildSettingsBansEmpty => 'Δεν υπάρχουν αποκλεισμένοι χρήστες.';

  @override
  String get guildSettingsBanPermanent => 'Μόνιμος αποκλεισμός';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Λήγει $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Λήγει';

  @override
  String get guildSettingsUnban => 'Αποαποκλεισμός';

  @override
  String get guildSettingsBansLoading => 'Φόρτωση αποκλεισμένων χρηστών';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Δεν βρέθηκαν αποκλεισμοί που να ταιριάζουν με την αναζήτησή σας.';

  @override
  String get guildSettingsBanDetailsTitle => 'Λεπτομέρειες αποκλεισμού';

  @override
  String get guildSettingsBanViewDetails => 'Προβολή λεπτομερειών';

  @override
  String get guildSettingsBannedOn => 'Αποκλείστηκε στις';

  @override
  String get guildSettingsBannedBy => 'Αποκλείστηκε από';

  @override
  String get guildSettingsRevokeBanTitle => 'Ανάκληση αποκλεισμού';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Είστε σίγουροι ότι θέλετε να ανακαλέσετε τον αποκλεισμό για τον/την $displayName; Θα μπορεί να επανέλθει στην κοινότητα.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Ανακλήθηκε ο αποκλεισμός για τον/την $displayName';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Δεν ήταν δυνατή η φόρτωση των αποκλεισμών. Δοκιμάστε ξανά.';

  @override
  String get guildSettingsRevokeBanError =>
      'Δεν ήταν δυνατή η ανάκληση του αποκλεισμού. Δοκιμάστε ξανά.';

  @override
  String get guildSettingsCommunitySettings => 'Ρυθμίσεις Κοινότητας';

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
      'Διαχειριστείτε το προφίλ, τα κανάλια και τις προεπιλεγμένες ρυθμίσεις της κοινότητάς σας.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Επωνυμία';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Ενημερώστε το εικονίδιο, το όνομα, το banner και το φόντο πρόσκλησης';

  @override
  String get guildSettingsOverviewBannerUpload => 'Μεταφόρτωση banner';

  @override
  String get guildSettingsOverviewIdleTitle => 'Ρυθμίσεις αδράνειας';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Ρυθμίστε το κανάλι AFK και το χρονικό όριο';

  @override
  String get guildSettingsOverviewSystemTitle => 'Σύστημα & καλωσόρισμα';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Επιλέξτε προορισμό για μηνύματα συστήματος και καλωσορίσματος';

  @override
  String get guildSettingsOverviewNotificationsTitle =>
      'Προεπιλεγμένες ειδοποιήσεις';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Οι κοινότητες με πάνω από 250 άτομα αναγκάζονται στη ρύθμιση \"μόνο αναφορές\". Η αρχική σας ρύθμιση διατηρείται και θα αποκατασταθεί εάν η κοινότητα πέσει κάτω από 250 μέλη.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Για προχωρημένους';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Να επιτρέπονται ευέλικτα ονόματα καναλιών κειμένου';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Απόκρυψη κορώνας διαχειριστή κοινότητας';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Αποσπασμένο banner';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Εμφανίζει το banner σε δική του ενότητα κάτω από την κεφαλίδα της κοινότητας.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Μεταφόρτωση εικονιδίου';

  @override
  String get guildSettingsOverviewRemoveImage => 'Αφαίρεση';

  @override
  String get guildSettingsOverviewSplashTitle => 'Φόντο πρόσκλησης';

  @override
  String get guildSettingsOverviewEmbedSplashTitle =>
      'Φόντο ενσωμάτωσης συνομιλίας';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Εμφανίζεται σε ενσωματώσεις πρόσκλησης στη συνομιλία.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Μεταφόρτωση φόντου';

  @override
  String get guildSettingsOverviewNoCommunityBanner =>
      'Χωρίς banner κοινότητας';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'Χωρίς φόντο πρόσκλησης';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Προεπισκόπηση';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Δείτε πώς φαίνεται η πρόσκλησή σας στους επισκέπτες.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Ονόματα καναλιών κειμένου';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Κορώνα διαχειριστή κοινότητας';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Ρυθμίστε αν το εικονίδιο της κορώνας εμφανίζεται δίπλα στον διαχειριστή της κοινότητας';

  @override
  String get guildSettingsSplashCardAlignment => 'Στοίχιση κάρτας';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Κέντρο';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Αριστερά';

  @override
  String get guildSettingsSplashAlignmentRight => 'Δεξιά';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Ισχύει μόνο σε ευρείες οθόνες.';

  @override
  String get permissionReadMessageHistory => 'Ανάγνωση ιστορικού μηνυμάτων';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Αλλαγή του τι μπορούν να δουν οι χρήστες χωρίς \"$permission\"';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Χρησιμοποιήστε μια ειδική φόρμα για να ορίσετε μια ημερομηνία ορίου στο ιστορικό μηνυμάτων για μέλη που δεν έχουν την άδεια $permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Άνοιγμα ορίου ιστορικού μηνυμάτων';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Όριο ιστορικού μηνυμάτων';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Ενεργοποίηση ορίου ιστορικού μηνυμάτων';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Ημερομηνία ορίου';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Μέλη χωρίς Ανάγνωση Ιστορικού Μηνυμάτων μπορούν να δουν μηνύματα που στάλθηκαν μετά από αυτήν την ημερομηνία.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Το όριο ιστορικού μηνυμάτων ενημερώθηκε';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Επιτρέπει κεφαλαία γράμματα και κενά στα ονόματα καναλιών κειμένου. Η απενεργοποίηση περιορίζει τα ονόματα σε πεζά με παύλες και κάτω παύλες.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Αποκρύπτει το εικονίδιο της κορώνας δίπλα στον διαχειριστή της κοινότητας σε όλες τις εμφανίσεις.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Τα κινούμενα εικονίδια απαιτούν τη δυνατότητα κοινότητας \"Animated Icon\".';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Τα κινούμενα banners απαιτούν τη δυνατότητα κοινότητας \"Animated Banner\".';

  @override
  String get guildSettingsAfkChannel => 'Κανάλι AFK / αδράνειας';

  @override
  String get guildSettingsAfkChannelHint =>
      'Μετακίνηση μελών σε αυτό το κανάλι όταν είναι AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Χωρίς κανάλι AFK';

  @override
  String get guildSettingsAfkTimeout => 'Χρονικό όριο AFK';

  @override
  String get guildSettingsAfkTimeout1Min => '1 λεπτό';

  @override
  String get guildSettingsAfkTimeout5Min => '5 λεπτά';

  @override
  String get guildSettingsAfkTimeout15Min => '15 λεπτά';

  @override
  String get guildSettingsAfkTimeout30Min => '30 λεπτά';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 ώρα';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds δευτερόλεπτα';
  }

  @override
  String get guildSettingsSystemChannel => 'Κανάλι προορισμού';

  @override
  String get guildSettingsSystemChannelHint =>
      'Μηνύματα καλωσορίσματος και συστήματος θα εμφανίζονται εδώ.';

  @override
  String get guildSettingsNoSystemChannel => 'Χωρίς κανάλι συστήματος';

  @override
  String get guildSettingsHideJoinMessages => 'Απόκρυψη μηνυμάτων εισόδου';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Καταργεί τα μηνύματα εισόδου στο κανάλι προορισμού.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Προεπιλεγμένες ρυθμίσεις ειδοποιήσεων';

  @override
  String get guildSettingsNotificationsAll => 'Όλα τα μηνύματα';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Ειδοποίηση για όλα τα μηνύματα';

  @override
  String get guildSettingsNotificationsMentions => 'Μόνο αναφορές';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Ειδοποίηση μόνο για αναφορές';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Μέγιστο 10MB. Ελάχιστο: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Μέγιστο 10MB. Ελάχιστο: 960×540px (16:9). Εμφανίζεται σε ενσωματώσεις πρόσκλησης στη συνομιλία.';

  @override
  String get guildSettingsModerationDescription =>
      'Ρυθμίστε τις ρυθμίσεις επαλήθευσης, φιλτραρίσματος περιεχομένου και περιεχομένου για ενηλίκους.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Οι κοινότητες που αναφέρονται στο Discovery έχουν περιορισμένες επιλογές εποπτείας.';

  @override
  String get guildSettingsModerationContentFilterTitle =>
      'Φιλτράρισμα περιεχομένου';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Αυτόματη σάρωση μηνυμάτων για περιεχόμενο που είναι ακατάλληλο σε κανάλια που δεν έχουν επισημανθεί ως περιεχόμενο για ενηλίκους.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Οι κοινότητες που αναφέρονται στο Discovery υποχρεούνται να σαρώνουν όλα τα μέλη. Αυτή η ρύθμιση δεν μπορεί να αλλάξει ενώ είναι ενεργοποιημένο το Discovery.';

  @override
  String get guildSettingsContentFilterOff => 'Ανενεργό';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Αφήστε την κοινότητα να αυτο-εποπτεύεται';

  @override
  String get guildSettingsContentFilterNoRole =>
      'Φιλτράρισμα μελών χωρίς ρόλους';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Προτείνεται για τις περισσότερες κοινότητες';

  @override
  String get guildSettingsContentFilterAll => 'Φιλτράρισμα όλων';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Μέγιστη προστασία για χώρους φιλικούς προς την οικογένεια';

  @override
  String get guildSettingsModerationMatureOff => 'Ανενεργό';

  @override
  String get guildSettingsModerationMatureOn => 'Ενεργό';

  @override
  String get guildSettingsContentWarningToggle =>
      'Εμφάνιση προειδοποίησης περιεχομένου';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Ενεργοποιεί μια προτροπή συναίνεσης πριν από την είσοδο σε οποιοδήποτε κανάλι.';

  @override
  String get guildSettingsContentWarningText =>
      'Προσαρμοσμένο κείμενο προειδοποίησης';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Αυτό περιέχει ευαίσθητο περιεχόμενο.';

  @override
  String get guildSettingsModeration2faTitle => 'Απαίτηση 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'Απαιτήστε έλεγχο ταυτότητας δύο παραγόντων για τους διαχειριστές πριν μπορέσουν να αποκλείσουν, να αποβάλουν, να θέσουν σε παύση ή να αφαιρέσουν μηνύματα.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Απαίτηση 2FA για ενέργειες διαχείρισης';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Μόνο ο ιδιοκτήτης της κοινότητας μπορεί να αλλάξει αυτήν τη ρύθμιση';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Ενεργοποιήστε το 2FA στον λογαριασμό σας για να αλλάξετε αυτήν τη ρύθμιση';

  @override
  String get guildSettingsEmojiSearchHint => 'Αναζήτηση emoji';

  @override
  String get guildSettingsEmojiUploadTitle => 'Μεταφόρτωση Emoji';

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
    return 'Μη κινούμενα emoji ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Κινούμενα emoji ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Αναζήτηση αυτοκόλλητων';

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
    return 'Δημιουργήστε webhooks από τις ρυθμίσεις καναλιού. Επεξεργαστείτε τα εδώ.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'Η διεύθυνση URL σας κατά παραγγελία δεν θα λειτουργεί εκτός αν τουλάχιστον ένα κανάλι είναι ορατό σε όλους.';

  @override
  String get guildSettingsVanityUrlRemove => 'Αφαίρεση';

  @override
  String get guildSettingsBannedUsersTitle => 'Αποκλεισμένοι χρήστες';

  @override
  String get guildSettingsInvitesTableInviter => 'Προσκαλών';

  @override
  String get guildSettingsInvitesTableChannel => 'Κανάλι';

  @override
  String get guildSettingsInvitesTableCode => 'Κωδικός';

  @override
  String get guildSettingsInvitesTableUses => 'Χρήσεις';

  @override
  String get guildSettingsInvitesTableCreated => 'Δημιουργήθηκε';

  @override
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsAuditLogFilterUser => 'Φιλτράρισμα κατά χρήστη';

  @override
  String get guildSettingsAuditLogFilterAction => 'Φιλτράρισμα κατά ενέργειας';

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
}
