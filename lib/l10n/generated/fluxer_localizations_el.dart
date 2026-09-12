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
      'Κάτι πήγε στραβά με την παρουσία.\nΘα διορθωθεί σε μια στιγμή!';

  @override
  String get gatewayReconnectingToast => 'Επανασύνδεση…';

  @override
  String get gatewayConnectedToast => 'Συνδέθηκε';

  @override
  String get sessionExpiredToast =>
      'Η συνεδρία σας έχει λήξει. Παρακαλώ συνδεθείτε ξανά.';

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
  String get nagbarLearnMore => 'Μάθετε περισσότερα';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'Έχει προγραμματιστεί συντήρηση για $localizedTime. Αναμενόμενη διάρκεια: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Πραγματοποιείται συντήρηση. Αναμενόμενη διάρκεια: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'Η συντήρηση ολοκληρώθηκε.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Γεια σου $displayName, διεκδίκησε τον λογαριασμό σου για να μην χάσεις την πρόσβαση.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Γεια σου $displayName, επιβεβαίωσε τη διεύθυνση email σου.';
  }

  @override
  String get nagbarOpenSettings => 'Άνοιγμα ρυθμίσεων';

  @override
  String get systemPermissionSettingsTitle => 'Ενεργοποίηση άδειας';

  @override
  String get systemPermissionSettingsOpenSettings => 'Άνοιγμα ρυθμίσεων';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return 'Το $productName δεν έχει πρόσβαση στο μικρόφωνό σας. Μπορείτε να το ενεργοποιήσετε στις ρυθμίσεις απορρήτου της συσκευής σας.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return 'Το $productName δεν έχει πρόσβαση στην κάμερά σας. Μπορείτε να την ενεργοποιήσετε στις ρυθμίσεις απορρήτου της συσκευής σας.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return 'Το $productName δεν έχει πρόσβαση στη βιβλιοθήκη φωτογραφιών σας. Μπορείτε να την ενεργοποιήσετε στις ρυθμίσεις απορρήτου της συσκευής σας.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return 'Το $productName δεν έχει άδεια αποστολής ειδοποιήσεων. Μπορείτε να την ενεργοποιήσετε στις ρυθμίσεις της συσκευής σας.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Η συνδρομή σας δεν ανανεώθηκε, αλλά εξακολουθείτε να έχετε πρόσβαση στα προνόμια του $productName έως τις $graceDate. Αναλάβετε δράση τώρα, αλλιώς θα χάσετε όλα τα προνόμια.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Η συνδρομή σας στο $productName έχει λήξει. Ανανεώστε τώρα για να διατηρήσετε τα προνόμιά σας.';
  }

  @override
  String get nagbarManageSubscription => 'Διαχείριση συνδρομής';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Καλώς ήρθες στο $productFullName. Εξερεύνησε τα προνόμια του $productName και διαχειρίσου τη συνδρομή σου.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'Προβολή λειτουργιών $productName';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'Ένας νέος κωδικός δώρου σε περιμένει στο απόθεμα δώρων σου.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'Έχεις $count νέους κωδικούς δώρου που περιμένουν στο απόθεμα δώρων σου.';
  }

  @override
  String get nagbarViewGiftInventory => 'Προβολή αποθέματος δώρων';

  @override
  String get nagbarVisionaryMfa =>
      'Ενεργοποιήστε τον έλεγχο ταυτότητας δύο παραγόντων για να προστατεύσετε τον λογαριασμό σας Visionary.';

  @override
  String get nagbarEnableMfa => 'Ενεργοποίηση 2FA';

  @override
  String get nagbarTermsAcceptance =>
      'Ενημερώσαμε τους όρους μας. Παρακαλούμε, ελέγξτε τους και αποδεχτείτε τους για να συνεχίσετε.';

  @override
  String get nagbarReviewTerms => 'Αναθεώρηση όρων';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Εγγραφείτε στην κοινότητα $communityName για να συνομιλήσετε με την ομάδα και να μείνετε ενημερωμένοι.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Συμμετοχή στο $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'Ενεργοποιήστε τις ειδοποιήσεις για να μην χάνετε μηνύματα και αναφορές.';

  @override
  String get nagbarEnableNotifications => 'Ενεργοποίηση ειδοποιήσεων';

  @override
  String get nagbarBillingPortalFailed =>
      'Δεν ήταν δυνατή η άνοιξη της πύλης χρέωσης. Δοκιμάστε ξανά σε λίγο.';

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
  String get next => 'Επόμενο';

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
      'Το αίτημα λογαριασμού σου εκκρεμεί για έγκριση. Μπορείς να συνδεθείς αφού το εγκρίνει ένας διαχειριστής.';

  @override
  String get registerClosed =>
      'Οι εγγραφές είναι προς το παρόν κλειστές. Χρησιμοποίησε έναν σύνδεσμο εγγραφής από διαχειριστή για να δημιουργήσεις λογαριασμό.';

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
      'Αυτή η παρουσία είναι προσωρινά μη διαθέσιμη. Δοκιμάστε ξανά σε λίγο.';

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
  String get embedInviteJoinGroup => 'Συμμετοχή στην ομάδα';

  @override
  String get embedInviteAlreadyJoined => 'Έχετε ήδη γίνει μέλος';

  @override
  String get embedInviteDisabled => 'Οι προσκλήσεις απενεργοποιήθηκαν';

  @override
  String get embedInvitePaused =>
      'Οι προσκλήσεις έχουν τεθεί σε παύση για αυτήν την κοινότητα.';

  @override
  String embedInvitePausedRaid(String productName) {
    return 'Το $productName εντόπισε μια πιθανή επιδρομή, οπότε οι νέοι χρήστες δεν μπορούν να συμμετάσχουν αυτήν τη στιγμή.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Αυτή η κοινότητα έχει θέσει σε παύση τις προσκλήσεις. Μπορείτε να δοκιμάσετε ξανά αργότερα.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return 'Το $productName εντόπισε μια πιθανή επιδρομή σε αυτήν την κοινότητα. Οι προσκλήσεις έχουν τεθεί σε παύση, επομένως οι νέοι χρήστες δεν μπορούν να συμμετάσχουν αυτήν τη στιγμή.';
  }

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
  String get invalidDeepLinkTitle => 'Ο σύνδεσμος δεν άνοιξε';

  @override
  String get invalidDeepLinkDescription =>
      'Αυτός ο σύνδεσμος ενδέχεται να είναι κατεστραμμένος, να είναι διαθέσιμος μόνο στο διαδίκτυο ή να μην έχετε πρόσβαση. Ελέγξτε τον σύνδεσμο και δοκιμάστε ξανά.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Πήγαινε στην αρχική';

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
    return 'Οραματιστής (ισόβια $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ημέρες $productName',
      one: '1 ημέρα $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count εβδομάδες $productName',
      one: '1 εβδομάδα $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count μήνες $productName',
      one: '1 μήνας $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count έτη $productName',
      one: '1 έτος $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'Από $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'Πατήστε για να λάβετε το δώρο σας!';

  @override
  String get embedGiftAlreadyRedeemed => 'Έχει ήδη εξαργυρωθεί';

  @override
  String get embedGiftClaimAccountHelp =>
      'Διεκδικήστε τον λογαριασμό σας για να εξαργυρώσετε αυτό το δώρο.';

  @override
  String get embedGiftClaim => 'Διεκδίκηση δώρου';

  @override
  String get embedGiftClaimed => 'Το δώρο παραλήφθηκε';

  @override
  String get embedGiftClaimAccount => 'Διεκδίκηση λογαριασμού για εξαργύρωση';

  @override
  String get embedGiftUnknownTitle => 'Άγνωστο δώρο';

  @override
  String get embedGiftUnknownSubtitle =>
      'Αυτός ο κωδικός δώρου δεν είναι έγκυρος ή έχει ήδη χρησιμοποιηθεί.';

  @override
  String get embedGiftUnavailable => 'Το δώρο δεν είναι διαθέσιμο';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Διεκδίκησε το δώρο σου για να ενεργοποιήσεις τη συνδρομή σου στο $productName!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'Αυτό το δώρο έχει ήδη εξαργυρωθεί.';

  @override
  String get giftAcceptMaybeLater => 'Ίσως αργότερα';

  @override
  String get giftRedeemedToast => 'Το δώρο εξαργυρώθηκε!';

  @override
  String get giftRedeemInvalidTitle => 'Μη έγκυρος κωδικός δώρου';

  @override
  String get giftRedeemInvalidMessage =>
      'Αυτός ο κωδικός είναι μη έγκυρος ή έχει ήδη χρησιμοποιηθεί.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Το δώρο έχει ήδη εξαργυρωθεί';

  @override
  String get giftRedeemAlreadyRedeemedMessage =>
      'Αυτός ο κωδικός έχει ήδη εξαργυρωθεί.';

  @override
  String get giftRedeemNotFoundTitle => 'Το δώρο δεν βρέθηκε';

  @override
  String get giftRedeemNotFoundMessage => 'Αυτός ο κωδικός δεν υπάρχει.';

  @override
  String get giftRedeemFailedTitle => 'Αποτυχία εξαργύρωσης δώρου';

  @override
  String get giftRedeemFailedMessage =>
      'Δεν ήταν δυνατή η εξαργύρωση αυτού του δώρου. Δοκιμάστε ξανά.';

  @override
  String get giftVisionaryCannotRedeemTitle =>
      'Δεν μπορείτε να εξαργυρώσετε αυτό το δώρο';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Οι λογαριασμοί Visionary δεν μπορούν να εξαργυρώσουν δώρα Plutonium. Αντιγράψτε τον σύνδεσμο για να τον μοιραστείτε με έναν φίλο.';

  @override
  String get giftCopyLink => 'Αντιγραφή συνδέσμου δώρου';

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
  String get notificationUseCategoryDefault => 'Χρήση προεπιλογής κατηγορίας';

  @override
  String get notificationUseCommunityDefault => 'Χρήση προεπιλογής κοινότητας';

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
      'Να διαγραφούν τα μηνύματά σας σε αυτήν τη συνομιλία;';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Αυτό θα διαγράψει οριστικά κάθε μήνυμα που έχετε στείλει ποτέ σε αυτήν τη συνομιλία. Αυτή η ενέργεια δεν μπορεί να αναιρεθεί.';

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
  String get dmUnnamedGroup => 'Ομάδα χωρίς όνομα';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'Ομάδα του/της $resolvedName';
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
  String get dmDebugCategory => 'Εντοπισμός σφαλμάτων κατηγορίας';

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
      'Επαληθεύστε το email σας πριν στείλετε αιτήματα φιλίας.';

  @override
  String get addFriendFriendsListFull =>
      'Η λίστα φίλων σας είναι πλήρης ή η δική τους. Αφαιρέστε κάποιον και δοκιμάστε ξανά.';

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
    return 'Αυτό είναι ένα προεπιλεγμένο emoji στο $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'Αυτό το emoji προέρχεται από αυτήν την κοινότητα. Μπορείς να το χρησιμοποιήσεις παντού.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'Αυτό είναι ένα προσαρμοσμένο emoji από μια κοινότητα.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'Αυτό είναι ένα προσαρμοσμένο emoji από μια κοινότητα. Ζήτησε από τον δημιουργό μια πρόσκληση για να χρησιμοποιήσεις αυτό το emoji.';

  @override
  String get emojiInfoFromHeader => 'Αυτό το emoji προέρχεται από';

  @override
  String get emojiInfoDiscoverableCommunity => 'Κοινότητα προς ανακάλυψη';

  @override
  String get emojiInfoPrivateCommunity => 'Ιδιωτική κοινότητα';

  @override
  String get emojiInfoVerifiedCommunity => 'Επαληθευμένη κοινότητα';

  @override
  String get emojiInfoAddToFavorites => 'Προσθήκη στα αγαπημένα';

  @override
  String get emojiInfoRemoveFromFavorites => 'Αφαίρεση από τα Αγαπημένα';

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
  String get gifPickerFavoritesEmptyTitle => 'Δεν υπάρχουν ακόμα αγαπημένα GIF';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Κάνε αστέρι ένα GIF για να το δεις εδώ.';

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
      'Θα στείλουμε έναν κωδικό SMS όταν είναι διαθέσιμος. Ο αριθμός σας δεν συνδέεται με τον λογαριασμό σας. Διατηρούμε μόνο έναν κρυπτογραφημένο δείκτη, χωρίς αναγνωριστικό χρήστη, για να επιτρέψουμε το πολύ 2 επαληθεύσεις σε περίπου 30 ημέρες.';

  @override
  String get phoneAddSendCode => 'Αποστολή Κωδικού';

  @override
  String get phoneVerifyTitle => 'Επαλήθευση Αριθμού Τηλεφώνου';

  @override
  String get phoneVerifyDescription =>
      'Εισαγάγετε τον κωδικό επαλήθευσης που στάλθηκε στον αριθμό τηλεφώνου σας.';

  @override
  String get phoneAddSuccess => 'Ο αριθμός τηλεφώνου επαληθεύτηκε';

  @override
  String get phoneCountryLabel => 'Χώρα';

  @override
  String get phoneSearchCountries => 'Αναζήτηση χωρών...';

  @override
  String get phoneNumberRequired => 'Απαιτείται αριθμός τηλεφώνου';

  @override
  String get phoneEnterValidNumber =>
      'Εισαγάγετε έναν έγκυρο αριθμό κινητού τηλεφώνου.';

  @override
  String get phoneCannotBeUsed =>
      'Αυτός ο αριθμός τηλεφώνου δεν μπορεί να χρησιμοποιηθεί. Δοκιμάστε έναν άλλο αριθμό κινητού ή επικοινωνήστε με την υποστήριξη.';

  @override
  String get phoneAlreadyUsed =>
      'Αυτός ο αριθμός τηλεφώνου έχει ήδη χρησιμοποιηθεί. Δοκιμάστε έναν άλλο αριθμό ή επικοινωνήστε με την υποστήριξη.';

  @override
  String get phoneCodeDidNotWork =>
      'Αυτός ο κωδικός δεν λειτούργησε. Ελέγξτε τον και δοκιμάστε ξανά.';

  @override
  String get phoneTooManyAttempts =>
      'Πολλές προσπάθειες. Περιμένετε λίγο και δοκιμάστε ξανά.';

  @override
  String get phoneSmsUnavailable =>
      'Η επαλήθευση SMS δεν είναι διαθέσιμη αυτήν τη στιγμή. Δοκιμάστε ξανά αργότερα ή επικοινωνήστε με την υποστήριξη.';

  @override
  String get phoneNotEligible =>
      'Η επαλήθευση τηλεφώνου δεν είναι διαθέσιμη για αυτόν τον λογαριασμό. Χρησιμοποιήστε άλλη μέθοδο ή επικοινωνήστε με την υποστήριξη.';

  @override
  String get phoneCaptchaRequired =>
      'Απαιτείται έλεγχος προγράμματος περιήγησης πριν από την επαλήθευση τηλεφώνου. Δοκιμάστε ξανά από τη σελίδα σύνδεσης ή επικοινωνήστε με την υποστήριξη.';

  @override
  String get phoneSomethingWentWrong => 'Κάτι πήγε στραβά. Δοκιμάστε ξανά.';

  @override
  String get phoneInboundExpensiveDescription =>
      'Η αποστολή SMS σε αυτόν τον αριθμό τηλεφώνου είναι πολύ ακριβή, οπότε χρειαζόμαστε εσείς να μας στείλετε ένα SMS. Μπορείτε επίσης να επικοινωνήσετε με την υποστήριξη για να αφαιρέσουμε αυτήν την απαίτηση από τον λογαριασμό σας.';

  @override
  String get phoneInboundDefaultDescription =>
      'Πρέπει να μας στείλετε ένα SMS για να επαληθεύσουμε τον αριθμό τηλεφώνου σας.';

  @override
  String get phoneInboundStepOpenMessaging =>
      'Άνοιξε την εφαρμογή μηνυμάτων του τηλεφώνου σου και δημιούργησε ένα νέο μήνυμα.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'Στείλτε τον κωδικό $code στο $number.';
  }

  @override
  String get phoneInboundStepWait =>
      'Περιμένετε να λάβουμε το μήνυμά σας. Αυτό μπορεί να διαρκέσει ένα λεπτό.';

  @override
  String get phoneInboundGetNewCode => 'Λήψη νέου κωδικού';

  @override
  String get phoneInboundChallengeCodeLabel => 'Κωδικός για αποστολή';

  @override
  String get phoneInboundOurNumberLabel => 'Αποστολή σε';

  @override
  String get requiredActionTitle => 'Απαιτείται επαλήθευση λογαριασμού';

  @override
  String requiredActionIntroGeneric(String productName) {
    return 'Ολοκληρώστε την απαιτούμενη επαλήθευση για να συνεχίσετε να χρησιμοποιείτε το $productName.';
  }

  @override
  String get requiredActionIntroPhone =>
      'Η εγγραφή σου χρειάζεται έναν επιπλέον έλεγχο anti-spam πριν μπορέσεις να συνεχίσεις.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return 'Επαληθεύστε το email ή το τηλέφωνό σας για να συνεχίσετε να χρησιμοποιείτε το $productName.';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return 'Ολοκληρώστε τα απαιτούμενα βήματα επαλήθευσης email και τηλεφώνου παρακάτω για να συνεχίσετε να χρησιμοποιείτε το $productName.';
  }

  @override
  String get requiredActionChooseMethodTitle => 'Επιλέξτε μέθοδο επαλήθευσης';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return 'Ολοκληρώστε μία από τις παρακάτω διαδρομές επαλήθευσης για να συνεχίσετε να χρησιμοποιείτε το $productName.';
  }

  @override
  String get requiredActionUseEmail => 'Χρήση email';

  @override
  String get requiredActionUsePhone => 'Χρήση τηλεφώνου';

  @override
  String get requiredActionCheckEmailTitle => 'Έλεγξε το email σου';

  @override
  String get requiredActionCheckEmailDescription =>
      'Στείλαμε έναν σύνδεσμο επαλήθευσης στη διεύθυνση email σας. Ανοίξτε τον για να συνεχίσετε.';

  @override
  String get requiredActionResendVerificationEmail =>
      'Επαναποστολή email επαλήθευσης';

  @override
  String get requiredActionVerificationEmailSent =>
      'Στάλθηκε email επαλήθευσης. Ελέγξτε τα εισερχόμενά σας.';

  @override
  String get requiredActionSignOut => 'Αποσύνδεση';

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
  String get networkErrorMessage =>
      'Κάτι πήγε στραβά. Παρακαλώ, προσπαθήστε ξανά.';

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
      other: 'πριν από $count εβδομάδες',
      one: 'πριν από 1 εβδομάδα',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'σε $count λεπτά',
      one: 'σε 1 λεπτό',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'σε $count ώρες',
      one: 'σε 1 ώρα',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'σε $count ημέρες',
      one: 'σε 1 ημέρα',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'σε $count εβδομάδες',
      one: 'σε 1 εβδομάδα',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'σε $count μήνες',
      one: 'σε 1 μήνα',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'σε $count χρόνια',
      one: 'σε 1 χρόνο',
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
  String get userProfileLoading => 'Φόρτωση προφίλ';

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
  String get userProfileRoles => 'Ρόλοι';

  @override
  String get memberRoleAdd => 'Προσθήκη ρόλου';

  @override
  String memberRoleRemove(String roleName) {
    return 'Κατάργηση ρόλου $roleName';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'Αυτός ο χρήστης δεν έχει ρόλους σε αυτήν την κοινότητα.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'Δεν υπάρχουν ρόλοι ακόμα. Πρόσθεσε ρόλους στο $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'Δεν υπάρχουν διαθέσιμοι ρόλοι';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'Δεν υπάρχουν ρόλοι για ανάθεση σε αυτήν την κοινότητα αυτήν τη στιγμή, αλλά μπορείτε να δημιουργήσετε έναν νέο ρόλο στο $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Ρυθμίσεις κοινότητας';

  @override
  String get guildSettingsRolesTab => 'Ρόλοι';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Τοπική ώρα';

  @override
  String get userProfileSameTimeAsYou => 'Ίδια ώρα με εσάς';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return '$duration μπροστά από εσάς';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return '$duration πίσω σας';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours ώρες',
      one: '1 ώρα',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes λεπτά',
      one: '1 λεπτό',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours ώρες',
      one: '1 ώρα',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes λεπτά',
      one: '1 λεπτό',
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
  String get iarReportGuildTitle => 'Αναφορά κοινότητας';

  @override
  String get iarReportGuildPreconfirmBody =>
      'Αν αυτή η αναφορά αφορά ένα συγκεκριμένο μήνυμα σε αυτήν την κοινότητα, αναφέρετε αυτό το μήνυμα αντ\' αυτού. Οι αναφορές μηνυμάτων δίνουν στην ομάδα ασφαλείας μας το σαφέστερο πλαίσιο και η προσθήκη λεπτομερειών στα σχόλια μπορεί να μας βοηθήσει να το εξετάσουμε πιο γρήγορα. Συνεχίστε με την αναφορά ολόκληρης της κοινότητας μόνο αν η αναφορά ενός μηνύματος δεν θα κάλυπτε το ευρύτερο ζήτημα.';

  @override
  String get iarContinueToReportCommunity => 'Συνέχεια αναφοράς κοινότητας';

  @override
  String get iarPreviewCommunitySubtitle => 'Κοινότητα';

  @override
  String get iarReasonHarassmentGuildLabel =>
      'Παρενόχληση ή στοχευμένη κακοποίηση';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'Η κοινότητα διευκολύνει τις ομαδικές επιθέσεις ή τη στοχευμένη κακοποίηση.';

  @override
  String get iarReasonHateGuildDescription =>
      'Προωθεί το μίσος κατά προστατευμένων ομάδων.';

  @override
  String get iarReasonTerrorismLabel => 'Τρομοκρατία ή βίαιος εξτρεμισμός';

  @override
  String get iarReasonTerrorismDescription =>
      'Προωθεί, στρατολογεί ή συντονίζει βίαιες εξτρεμιστικές δραστηριότητες.';

  @override
  String get iarReasonMatureContentGuildLabel =>
      'Περιεχόμενο για ενήλικες ή μη ασφαλής περίφραξη';

  @override
  String get iarReasonMatureContentGuildDescription =>
      'Περιεχόμενο ενηλίκων χωρίς κατάλληλη περίφραξη.';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      'Θέτει σε κίνδυνο ανηλίκους ή φιλοξενεί περιεχόμενο παιδικής εκμετάλλευσης.';

  @override
  String get iarReasonRaidLabel => 'Συντονισμός επιδρομής';

  @override
  String get iarReasonRaidDescription =>
      'Συντονίζει επιθέσεις, οργανωμένες παρενοχλήσεις ή παρενοχλήσεις εναντίον ατόμων ή κοινοτήτων.';

  @override
  String get iarReasonSpamGuildDescription =>
      'Η κοινότητα υπάρχει για να στέλνει spam, να εξαπατά ή να κάνει κατάχρηση της πλατφόρμας.';

  @override
  String get iarReasonMalwareGuildLabel => 'Διανομή κακόβουλου λογισμικού';

  @override
  String get iarReasonMalwareGuildDescription =>
      'Διανέμει κακόβουλο λογισμικό, κλεμμένα διαπιστευτήρια ή επιβλαβή αρχεία.';

  @override
  String get iarReasonPrivacyGuildLabel => 'Παραβίαση απορρήτου ή doxxing';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'Κοινοποιεί προσωπικά δεδομένα, παρακολουθεί χρήστες ή συντονίζει την κατάχρηση απορρήτου.';

  @override
  String get iarReasonSelfHarmGuildLabel => 'Ενθαρρύνει τον αυτοτραυματισμό';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'Ενθαρρύνει την αυτοκτονία, τον αυτοτραυματισμό ή τις διατροφικές διαταραχές.';

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
  String get slowmodeStatusEnabled => 'Η αργή λειτουργία είναι ενεργοποιημένη';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Η αργή λειτουργία είναι ενεργή ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'Η αργή λειτουργία έχει οριστεί σε $durationLabel, αλλά εσείς είστε εξαιρούμενος.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Η αργή λειτουργία έχει οριστεί σε $durationLabel. Περιμένετε πριν στείλετε άλλο μήνυμα.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Η αργή λειτουργία έχει οριστεί σε $durationLabel για αυτό το κανάλι.';
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
      'Κράτα πατημένο για εγγραφή. Σύρε προς τα σκουπίδια για διαγραφή, σύρε προς τα πάνω για κλείδωμα ή άφησε για αποστολή.';

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
  String get voiceMessageSeekForward => 'Προώθηση';

  @override
  String get voiceMessageSeekBackward => 'Μετακίνηση προς τα πίσω';

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
  String get chatAttachmentDownloadedToast => 'Αποθηκεύτηκε στις φωτογραφίες';

  @override
  String get chatAttachmentDownloadFailedToast => 'Αδυναμία λήψης συνημμένου';

  @override
  String get chatAttachmentExpiredTooltip => 'Το συνημμένο έχει λήξει';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Εμφάνιση ($count γραμμές)',
      one: 'Εμφάνιση ($count γραμμή)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Σύμπτυξη ($count γραμμές)',
      one: 'Σύμπτυξη ($count γραμμή)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Εμφάνιση ($count γραμμές)',
      one: 'Εμφάνιση ($count γραμμή)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Σύμπτυξη ($count γραμμές)',
      one: 'Σύμπτυξη ($count γραμμή)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count γραμμές απομένουν)',
      one: '... ($count γραμμή απομένει)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count γραμμές απομένουν)',
      one: '... ($count γραμμή απομένει)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'Προβολή όλου του αρχείου';

  @override
  String get chatTextualPreviewChangeLanguage => 'Αλλαγή γλώσσας';

  @override
  String get chatTextualPreviewSearchLanguage => 'Αναζήτηση γλώσσας…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Επισήμανση σύνταξης';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'Δεν βρέθηκαν αποτελέσματα';

  @override
  String get chatTextualPreviewMoreOptions => 'Περισσότερες επιλογές';

  @override
  String get chatTextualPreviewWrapText => 'Αναδίπλωση κειμένου';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'Το αρχείο είναι πολύ μεγάλο για ενσωματωμένη προεπισκόπηση (όριο $previewLimitKb KB).';
  }

  @override
  String get chatTextualPreviewLoadError =>
      'Δεν είναι δυνατή η φόρτωση της προεπισκόπησης.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Απλό κείμενο';

  @override
  String get chatTextualPreviewCopy => 'Αντιγραφή';

  @override
  String get chatAttachmentSourceGallery => 'Συλλογή';

  @override
  String get chatAttachmentSourceCamera => 'Κάμερα';

  @override
  String get chatAttachmentSourceBrowse => 'Περιήγηση αρχείων';

  @override
  String get chatAttachmentPasteTooltip => 'Επικόλληση αρχείου από το πρόχειρο';

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
  String get lookAndFeelHdrSectionTitle => 'Υψηλό δυναμικό εύρος';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Έλεγχος του τρόπου εμφάνισης των εικόνων HDR σε οθόνες συμβατές με HDR.';

  @override
  String get lookAndFeelHdrFullName => 'Πλήρες δυναμικό εύρος';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Εμφάνιση εικόνων HDR με πλήρη φωτεινότητα και χρωματική γκάμα.';

  @override
  String get lookAndFeelHdrStandardName => 'Τυπικό εύρος';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Προσαρμόστε τις εικόνες HDR στο τυπικό εύρος, μειώνοντας τη μέγιστη φωτεινότητα.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'Λειτουργία οθόνης υψηλού δυναμικού εύρους';

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
      'Μέγεθος γραμματοσειράς συνομιλίας';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Προσαρμόστε το μέγεθος της γραμματοσειράς στην περιοχή συνομιλίας.';

  @override
  String get lookAndFeelChatFontSizeLabel =>
      'Μέγεθος γραμματοσειράς συνομιλίας';

  @override
  String get lookAndFeelAppZoomTitle => 'Επίπεδο ζουμ εφαρμογής';

  @override
  String get lookAndFeelAppZoomDescription =>
      'Προσαρμόστε το επίπεδο ζουμ της εφαρμογής.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'Ταπετσαρία συνομιλίας';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'Επίλεξε ένα φόντο για τη συνομιλία. Αυτό παραμένει σε αυτήν τη συσκευή.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'Αυτή η ρύθμιση παραμένει σε αυτήν τη συσκευή';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'Η ταπετσαρία συνομιλίας αποθηκεύεται μόνο σε αυτήν τη συσκευή και δεν συγχρονίζεται με άλλες συσκευές.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'Προεπιλογή';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'Προσαρμοσμένη εικόνα';

  @override
  String get lookAndFeelChatWallpaperStarfieldLabel => 'Starfield';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Χρώμα $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Ντεγκραντέ $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'Σκίαση ταπετσαρίας';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'Δεν ήταν δυνατή η ρύθμιση αυτής της εικόνας ως ταπετσαρία σας.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Μηνύματα';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Επίλεξε πώς θα εμφανίζονται τα μηνύματα στις συνομιλίες.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Διάστημα μεταξύ ομάδων μηνυμάτων';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel =>
      'Λειτουργία εμφάνισης μηνυμάτων';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Άνετο';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Ευρύχωρη διάταξη με σαφή οπτικό διαχωρισμό μεταξύ των μηνυμάτων.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Πυκνή';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Μεγιστοποιεί τα ορατά μηνύματα με ελάχιστη απόσταση.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'Απόκρυψη avatar χρηστών';

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
      'Η κοινότητα είναι προσωρινά μη διαθέσιμη';

  @override
  String get guildUnavailableDescription => 'Κάτι πήγε στραβά. Το διορθώνουμε.';

  @override
  String get guildNotFoundTitle => 'Αυτή δεν είναι η κοινότητα που ψάχνεις.';

  @override
  String get guildNotFoundDescription =>
      'Η κοινότητα που ψάχνεις μπορεί να έχει διαγραφεί ή να μην έχεις πρόσβαση σε αυτήν.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return 'Η κοινότητα $communityName είναι προς το παρόν προσβάσιμη μόνο σε μέλη του προσωπικού του $productName';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => 'προσωρινά μη διαθέσιμο';

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
  String get favoritesAddToSavedMedia => 'Προσθήκη στα αποθηκευμένα πολυμέσα';

  @override
  String get favoritesRemoveFromSavedMedia =>
      'Αφαίρεση από τα αποθηκευμένα πολυμέσα';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Προσθήκη στα αγαπημένα GIF που αποθηκεύονται μόνο μέσω URL';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Αφαίρεση από τις αγαπημένες GIF που έχουν αποθηκευτεί με URL';

  @override
  String get savedMediaAddTitle => 'Προσθήκη στα αποθηκευμένα πολυμέσα';

  @override
  String get savedMediaFormNameLabel => 'Όνομα';

  @override
  String get savedMediaFormNameHint => 'Τα τέλεια πολυμέσα μου';

  @override
  String get savedMediaFormAltTextLabel => 'Εναλλακτικό κείμενο';

  @override
  String get savedMediaFormAltTextHint => 'Περιγράψτε το μέσο';

  @override
  String get savedMediaFormTagsLabel => 'Ετικέτες';

  @override
  String get savedMediaFormTagsHint => 'αστείο, αντίδραση, εργασία';

  @override
  String get savedMediaSaveError =>
      'Αδυναμία ενημέρωσης των αποθηκευμένων πολυμέσων.';

  @override
  String get savedMediaNameRequired => 'Απαιτείται όνομα.';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'Πώς θέλεις να αποθηκεύουμε τα αγαπημένα σου GIF;';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'Μπορείς να αποθηκεύεις τα αγαπημένα σου GIF ως αγαπημένα μόνο με URL ή να τα ανεβάσεις στα αποθηκευμένα μέσα σου. Διάλεξε αυτό που ταιριάζει στον τρόπο που τα χρησιμοποιείς. Μπορείς να το αλλάξεις οποιαδήποτε στιγμή στις Ρυθμίσεις > Για προχωρημένους > Μέσα.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'Αγαπημένα μόνο με URL (προεπιλογή): συγχρονίζονται σε όλες τις συσκευές σας, χωρίς μεταφόρτωση, δεν προσμετρώνται στα αποθηκευμένα μέσα. Το αρχικό μέσο μπορεί να εξαφανιστεί αν ο διακομιστής του το αφαιρέσει.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Αποθηκευμένα μέσα: μεταφορτωμένα, με δυνατότητα επισήμανσης, αναζήτησης και μόνιμα, αλλά μετρούν στο όριο των αποθηκευμένων μέσων σας.';

  @override
  String get gifFavoriteFirstTimeHint => 'Θα σας ρωτήσουμε μόνο μία φορά.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly => 'Χρήση μόνο URL (προτείνεται)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia =>
      'Χρήση αποθηκευμένων πολυμέσων';

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
  String get messagesMediaCameraUploadsSectionTitle => 'Μεταφορτώσεις κάμερας';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Επιλέξτε αν οι φωτογραφίες και τα βίντεο που λαμβάνονται με την κάμερα της εφαρμογής θα διατηρούνται στη συσκευή σας';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel =>
      'Αποθήκευση στη συσκευή';

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
  String get accessibilitySaturationTitle => 'Κορεσμός';

  @override
  String get accessibilitySaturationDescription =>
      'Προσαρμόστε πόσο έντονα εμφανίζονται τα χρώματα του θέματος σε όλη την εφαρμογή.';

  @override
  String get accessibilityVisualGroupTitle => 'Οπτικά';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'Να υπογραμμίζονται πάντα οι σύνδεσμοι';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Αμύδρωση διαγραμμένου κειμένου';

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
  String get accessibilityScreenReaderGroupTitle => 'Ανάγνωση οθόνης';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Έλεγχος του τρόπου λειτουργίας του $productName με προγράμματα ανάγνωσης οθόνης.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Ανακοίνωση νέων μηνυμάτων';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Οι αναγνώστες οθόνης να ανακοινώνουν τα νέα μηνύματα καθώς φτάνουν στο ανοιχτό κανάλι. Οι ήχοι ειδοποιήσεων δεν επηρεάζονται.';

  @override
  String get accessibilityTtsGroupTitle => 'Κείμενο σε ομιλία';

  @override
  String get accessibilityTtsGroupDescription =>
      'Επιλέξτε μια ταχύτητα για το αναγνωσμένο κείμενο.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Ταχύτητα αναπαραγωγής ομιλίας';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Αναπαραγωγή δείγματος';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Σίγαση δείγματος';

  @override
  String get accessibilityPreviewButtonLabel => 'Κουμπί προεπισκόπησης';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'Έτσι εμφανίζονται οι σύνδεσμοι: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Προεπισκόπηση χρήστη';

  @override
  String get accessibilityKeyboardGroupTitle => 'Πληκτρολόγιο';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Εμφάνιση περιγράμματος εστίασης στο πεδίο κειμένου συνομιλίας';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'Το πλήκτρο Esc βγαίνει από τη λειτουργία πληκτρολογίου';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Εμφάνιση συντομεύσεων μενού περιβάλλοντος';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Επιβεβαίωση πριν την έναρξη κλήσεων';

  @override
  String get accessibilityAnimationGroupTitle => 'Κίνηση';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'Η μειωμένη κίνηση είναι ενεργή, επομένως οι κινούμενες εικόνες περιεχομένου είναι σε παύση από προεπιλογή. Μπορείτε να ενεργοποιήσετε οποιαδήποτε από αυτές ξανά για να συνεχίσει να παίζει.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel =>
      'Αναπαραγωγή κινούμενων emoji';

  @override
  String get accessibilityAutoPlayGifsMobileLabel => 'Αυτόματη αναπαραγωγή GIF';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'Αυτόματη αναπαραγωγή GIF όταν το $productName είναι σε εστίαση';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Αναπαραγωγή παρά την περιορισμένη κίνηση.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Σε παύση λόγω μειωμένης κίνησης. Ενεργοποιήστε για να συνεχίσουν να παίζουν τα κινούμενα emoji.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Σε παύση λόγω μειωμένης κίνησης. Ενεργοποιήστε το για να συνεχίσουν να παίζουν τα GIF.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'Είναι απενεργοποιημένο από προεπιλογή σε κινητά για εξοικονόμηση μπαταρίας και δεδομένων.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Κινούμενα αυτοκόλλητα';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Προτίμηση κινούμενων αυτοκόλλητων';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Πάντα κινούμενη εικόνα';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Τα αυτοκόλλητα θα έχουν πάντα κινούμενη εικόνα';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Εφέ κίνησης στην αλληλεπίδραση';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Τα αυτοκόλλητα θα έχουν κινούμενη εικόνα όταν τα πατάτε';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Τα αυτοκόλλητα θα έχουν κινούμενη εικόνα όταν περνάτε το ποντίκι από πάνω τους ή αλληλεπιδράτε με αυτά';

  @override
  String get accessibilityStickerNeverAnimateName => 'Ποτέ κινούμενη εικόνα';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Τα αυτοκόλλητα δεν θα έχουν ποτέ κινούμενη εικόνα';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Πάντα κινούμενη, παρά τη μειωμένη κίνηση.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'Η μειωμένη κίνηση περιορίζει τα αυτοκόλλητα να κινούνται μόνο κατά την αλληλεπίδραση. Επιλέξτε «Πάντα κινούμενα» για παράκαμψη.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'Εκ προεπιλογής, οι κινούμενες εικόνες ενεργοποιούνται με την αλληλεπίδραση στο κινητό, για εξοικονόμηση μπαταρίας.';

  @override
  String get accessibilityMotionGroupTitle => 'Κίνηση';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Συγχρονισμός ρύθμισης μειωμένης κίνησης με το σύστημα';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Χρησιμοποιήστε την προτίμηση μειωμένης κίνησης του συστήματος αυτής της συσκευής ή προσαρμόστε την παρακάτω.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Μείωση κίνησης';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Απενεργοποίηση κινούμενων σχεδίων και μεταβάσεων. Ελέγχεται αυτήν τη στιγμή από τις ρυθμίσεις του συστήματός σας.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Απενεργοποίηση κινούμενων σχεδίων και μεταβάσεων σε όλη την εφαρμογή.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Τα κινούμενα emoji, τα GIF και τα αυτοκόλλητα παραμένουν υπό τον έλεγχό σας στην καρτέλα Κίνηση.';

  @override
  String get accessibilityConfirmStartCallTitle => 'Έναρξη κλήσης;';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Είστε σίγουροι ότι θέλετε να ξεκινήσετε αυτήν την κλήση;';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Έναρξη κλήσης';

  @override
  String get accessibilityTtsSampleDescription =>
      'Ακούστε τη δοκιμαστική πρόταση στην επιλεγμένη ταχύτητα.';

  @override
  String get accessibilityTtsSampleText =>
      'Γιατρέ, έρχομαι από το μέλλον. Ήρθα εδώ με μια χρονομηχανή που εφηύρατε εσείς. Τώρα, χρειάζομαι τη βοήθειά σας για να επιστρέψω στο έτος 1985.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'Η σύνθεση ομιλίας δεν είναι διαθέσιμη σε αυτήν τη συσκευή.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Η αναπαραγωγή ομιλίας απέτυχε. Δοκιμάστε ξανά ή ελέγξτε αν λειτουργεί η έξοδος ήχου.';

  @override
  String get ttsSubstitutionUnknownUser => 'άγνωστος χρήστης';

  @override
  String get ttsSubstitutionUnknownRole => 'άγνωστος ρόλος';

  @override
  String get ttsSubstitutionUnknownChannel => 'άγνωστο κανάλι';

  @override
  String get ttsSubstitutionCodeBlock => 'μπλοκ κώδικα';

  @override
  String get ttsSubstitutionSpoiler => 'αποκάλυψη';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'εμότζι $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return '/$commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return 'Ο/Η $authorName είπε: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'Απάντηση σε $replyAuthorName, ο/η $authorName είπε: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'έστειλε ένα αυτοκόλλητο';

  @override
  String get ttsSentAttachment => 'έστειλε ένα συνημμένο';

  @override
  String ttsSentAttachments(int count) {
    return 'απεστάλησαν $count συνημμένα';
  }

  @override
  String get ttsSentEmbed => 'έστειλε ένα ενσωματωμένο μήνυμα';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return 'Ο/Η $author έστειλε $summary';
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
  String get systemCallJoinTheCall => 'Συμμετοχή στην κλήση';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return 'Ο/Η $username ξεκίνησε μια κλήση που διήρκεσε $duration.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'Χάσατε μια κλήση από τον/την $username που διήρκεσε $duration.';
  }

  @override
  String systemCallMissed(String username) {
    return 'Χάσατε μια κλήση από τον/την $username.';
  }

  @override
  String get systemCallDurationFewSeconds => 'πριν λίγα δευτερόλεπτα';

  @override
  String get systemCallDurationMinute => 'ένα λεπτό';

  @override
  String get systemCallDurationOneYear => '1 χρόνος';

  @override
  String get systemCallDurationOneMonth => '1 μήνας';

  @override
  String get systemCallDurationOneWeek => '1 εβδομάδα';

  @override
  String get systemCallDurationOneDay => '1 ημέρα';

  @override
  String get systemCallDurationOneHour => '1 ώρα';

  @override
  String systemCallDurationYears(int count) {
    return '$count χρόνια';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count μήνες';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count εβδομάδες';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count ημέρες';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count ώρες';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count λεπτά';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Ενημερώστε το $productName για να δείτε αυτό το μήνυμα.';
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
  String get voiceJoinFailedTitle => 'Αδυναμία συμμετοχής στη φωνητική κλήση';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Δεν ήταν δυνατή η αποσύνδεση των άλλων συσκευών σας. Δοκιμάστε ξανά σε λίγο.';

  @override
  String get voiceChannelEmptyDescription =>
      'Αυτό είναι ένα φωνητικό κανάλι. Συνδεθείτε για να αρχίσετε να μιλάτε!';

  @override
  String get voiceChannelJoin => 'Συμμετοχή στο κανάλι φωνητικής συνομιλίας';

  @override
  String get voiceCallJoin => 'Συμμετοχή στην κλήση';

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
  String get voiceControlFlipCamera => 'Αλλαγή κάμερας';

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
  String get voiceInChat => 'Σε φωνητική συνομιλία';

  @override
  String get voiceConnectionFailed => 'Η σύνδεση απέτυχε';

  @override
  String get voiceConnectionRetry => 'Δοκιμάστε ξανά';

  @override
  String get voiceConnectionDismiss => 'Απόρριψη';

  @override
  String get voiceConnectionDisconnected => 'Αποσυνδέθηκε';

  @override
  String voicePingMs(int currentLatency) {
    return 'Ping: ${currentLatency}ms';
  }

  @override
  String get voiceMeasuringLatency => 'Μέτρηση καθυστέρησης...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Μετάβαση στο $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'Σύνδεση φωνής';

  @override
  String get voiceConnectionAdvancedStats => 'Για προχωρημένους';

  @override
  String get voiceShowCallAvatars => 'Εμφάνιση avatar κλήσης';

  @override
  String get voiceShowConnectionId => 'Εμφάνιση αναγνωριστικού σύνδεσης';

  @override
  String get voiceAudioProcessing => 'Επεξεργασία ήχου';

  @override
  String get voiceConnectionSessionSection => 'Συνεδρία';

  @override
  String get voiceConnectionDurationLabel => 'Διάρκεια';

  @override
  String get voiceConnectionParticipantsLabel => 'Συμμετέχοντες';

  @override
  String get voiceConnectionNetworkSection => 'Δίκτυο';

  @override
  String get voiceConnectionPingLabel => 'Πινγκ';

  @override
  String get voiceConnectionJitterLabel => 'Αστάθεια (Jitter)';

  @override
  String get voiceConnectionSendLabel => 'Αποστολή';

  @override
  String get voiceConnectionReceiveLabel => 'Λήψη';

  @override
  String get voiceConnectionUnavailable => '—';

  @override
  String voiceConnectionDuration(int minutes, int seconds) {
    return '$minutesλ $secondsδ';
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
  String get userAreaMuteMicrophone => 'Σίγαση μικροφώνου';

  @override
  String get userAreaUnmuteMicrophone => 'Ενεργοποίηση μικροφώνου';

  @override
  String get userAreaUserSettings => 'Ρυθμίσεις χρήστη';

  @override
  String get voiceParticipantMenuViewProfile => 'Προβολή προφίλ';

  @override
  String get voiceParticipantMenuFocus => 'Εστίαση σε αυτό το άτομο';

  @override
  String get voiceParticipantMenuUnfocus => 'Αποεστίαση';

  @override
  String get voiceParticipantMenuCommunityMute =>
      'Σίγαση μέλους στην κοινότητα';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Αποσιώπηση στην κοινότητα';

  @override
  String get voiceParticipantMenuUserVolume => 'Ένταση χρήστη';

  @override
  String get voiceParticipantMenuStreamVolume => 'Ένταση ροής';

  @override
  String get voiceParticipantMenuStopStreaming => 'Διακοπή ροής';

  @override
  String get voiceParticipantModerationFailed =>
      'Δεν ήταν δυνατή η ενημέρωση αυτού του μέλους. Δοκιμάστε ξανά.';

  @override
  String get voiceControlChat => 'Συνομιλία';

  @override
  String get voiceCallViewModeLabel => 'Προβολή';

  @override
  String get voiceCallViewModeGrid => 'Πλέγμα';

  @override
  String get voiceCallViewModeFocus => 'Εστίαση';

  @override
  String get voicePanelSettingsSectionTitle => 'Ρυθμίσεις φωνής';

  @override
  String get voicePanelUseEarpieceLabel => 'Χρήση ακουστικού';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Εμφάνιση μόνο βίντεο';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Εμφάνιση μόνο των συμμετεχόντων που έχουν ενεργοποιήσει την κάμερά τους.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Εμφάνιση της κάμεράς μου';

  @override
  String get voicePrioritizeSpeakersLabel => 'Προτεραιότητα σε ομιλητές';

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
  String get privacyDashboardProfilePrivacySection => 'Απόρρητο προφίλ';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Φίλοι και άμεσες ανταλλαγές μηνυμάτων';

  @override
  String get privacyDashboardActivitySharingSection =>
      'Κοινή χρήση δραστηριοτήτων';

  @override
  String get privacyDashboardSensitiveContentSection => 'Ευαίσθητο περιεχόμενο';

  @override
  String get privacyDashboardDataExportSection => 'Εξαγωγή δεδομένων';

  @override
  String get privacyDashboardDataDeletionSection => 'Διαγραφή δεδομένων';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Ποιος μπορεί να δει το πλήρες προφίλ σας';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Φίλοι και όλες οι κοινότητες';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Το πλήρες προφίλ σας είναι ορατό σε φίλους και σε οποιονδήποτε βρίσκεται στις κοινότητές σας';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Μόνο φίλοι και μικρές κοινότητες';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Το πλήρες προφίλ σας είναι ορατό σε φίλους και μέλη των κοινοτήτων σας με 200 ή λιγότερα μέλη';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Μόνο φίλοι';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Το πλήρες προφίλ σας είναι ορατό μόνο στους φίλους σας';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Αιτήματα φιλίας';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Όλοι';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Να επιτρέπεται σε οποιονδήποτε να σας στέλνει αιτήματα φιλίας';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends => 'Φίλοι φίλων';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Να επιτρέπεται στους φίλους των φίλων σας να σας στέλνουν αιτήματα';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Μέλη κοινότητας';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Να επιτρέπεται στα μέλη από κοινότητες στις οποίες ανήκετε να σας στέλνουν αιτήματα';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Απευθείας μηνύματα';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Να επιτρέπονται τα απευθείας μηνύματα από μέλη της κοινότητας';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Να επιτρέπεται στα μέλη από κοινότητες στις οποίες ανήκετε να σας στέλνουν απευθείας μηνύματα';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Να επιτρέπονται τα απευθείας μηνύματα από bot κοινοτήτων';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Να επιτρέπεται στα bots από κοινότητες στις οποίες ανήκετε να σας στέλνουν απευθείας μηνύματα';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Έλεγξε ποιος μπορεί να σου στείλει αιτήματα φιλίας και απευθείας μηνύματα';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Έλεγξε ποιος μπορεί να σε καλεί και να σε προσθέτει σε ομαδικές συνομιλίες';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Εισερχόμενες κλήσεις';

  @override
  String get privacyDashboardIncomingCallsDesc =>
      'Έλεγξε ποιος μπορεί να σε καλέσει';

  @override
  String get privacyDashboardAllowedCallers => 'Επιτρεπόμενοι καλούντες';

  @override
  String get privacyDashboardIncomingCallNobody => 'Κανείς';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Αποκλεισμός όλων των εισερχόμενων κλήσεων';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Μόνο φίλοι';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Επιτρέψτε μόνο στους φίλους σας να σας καλούν (προτείνεται)';

  @override
  String get privacyDashboardIncomingCallCustom => 'Φίλοι + Προσαρμοσμένο';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Να επιτρέπονται φίλοι και επιπλέον ομάδες που θα επιλέξετε';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Όλοι';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Να δέχεσαι κλήσεις από οποιονδήποτε, ακόμη και από αγνώστους';

  @override
  String get privacyDashboardAdditionalGroups => 'Πρόσθετες Ομάδες';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'Οι φίλοι των φίλων σου μπορούν να σε καλέσουν';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'Άτομα από κοινότητες στις οποίες ανήκετε και οι δύο μπορούν να σας καλέσουν';

  @override
  String get privacyDashboardRingBehavior => 'Συμπεριφορά δακτυλίου';

  @override
  String get privacyDashboardSilentCalls => 'Σίγαση κλήσεων από όλους';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'Όλες οι κλήσεις θα ειδοποιούν σιωπηλά αντί να χτυπούν. Εξ ορισμού, οι κλήσεις από μη φίλους είναι πάντα σιωπηλές.';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Ποιος μπορεί να σας προσθέσει σε ομαδικές συνομιλίες';

  @override
  String get privacyDashboardGroupDmDesc =>
      'Έλεγξε ποιος μπορεί να σε προσθέσει σε ομαδικές συνομιλίες χωρίς να ρωτήσει. Οποιοσδήποτε μπορεί ακόμα να σου στείλει συνδέσμους πρόσκλησης για να συμμετάχεις.';

  @override
  String get privacyDashboardAllowedInvites => 'Επιτρεπόμενες προσκλήσεις';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Κανείς να μην μπορεί να σε προσθέσει σε ομαδικές συνομιλίες χωρίς να ρωτήσει';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Επιτρέψτε μόνο στους φίλους να σας προσθέσουν χωρίς άδεια (προτείνεται)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Να επιτρέπεται σε φίλους και επιπλέον ομάδες να σας προσθέτουν';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Να επιτρέπεται σε οποιονδήποτε να σας προσθέτει σε ομαδικές συνομιλίες χωρίς να ρωτά';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'Άτομα που είναι φίλοι με τους φίλους σας μπορούν να σας προσθέσουν σε ομαδικές συνομιλίες';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'Άτομα από κοινότητες που ανήκετε και οι δύο μπορούν να σας προσθέσουν σε ομαδικές συνομιλίες';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Δραστηριότητα φωνής στο «Ενεργός τώρα»';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Κοινοποίηση της φωνητικής σας δραστηριότητας με φίλους';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Κοινή χρήση δραστηριότητας φωνής με όλους τους φίλους;';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Να σταματήσει η κοινοποίηση της φωνητικής δραστηριότητας σε όλους τους φίλους;';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Πρόκειται να αρχίσετε να μοιράζεστε τη φωνητική σας δραστηριότητα με όλους τους φίλους σας, συμπεριλαμβανομένων και των μελλοντικών. Αυτό στέλνει μια ενημέρωση σε όλους και μπορεί να αλλάξει ξανά μόνο μετά από 24 ώρες.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Πρόκειται να σταματήσετε να μοιράζεστε τη φωνητική σας δραστηριότητα με όλους τους φίλους σας, συμπεριλαμβανομένων και των μελλοντικών. Αυτό στέλνει μια ενημέρωση σε όλους και μπορεί να αλλάξει ξανά μόνο μετά από 24 ώρες.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Ναι, κοινοποίηση σε όλους τους φίλους';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm =>
      'Ναι, διακοπή κοινοποίησης';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Διαθέσιμο ξανά σε $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Η κοινοποίηση φωνητικής δραστηριότητας ενημερώθηκε';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Δεν ήταν δυνατή η ενημέρωση της κοινοποίησης δραστηριότητας φωνής αυτή τη στιγμή';

  @override
  String get privacyDashboardDataExportDesc =>
      'Δημιουργήστε ένα αρχείο με δυνατότητα λήψης των δεδομένων του λογαριασμού σας, συμπεριλαμβανομένων των μηνυμάτων και των διευθύνσεων URL των συνημμένων. Οι περισσότεροι θέλουν τα πάντα, αλλά μπορείτε να περιορίσετε το εύρος παρακάτω.';

  @override
  String get privacyDashboardExportMyData => 'Εξαγωγή των δεδομένων μου';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Οριστική διαγραφή των μηνυμάτων που έχετε στείλει σε προσωπικές συνομιλίες, ομαδικές προσωπικές συνομιλίες και κοινότητες. Η διαδικασία εκτελείται στο παρασκήνιο και θα λάβετε ένα προσωπικό μήνυμα όταν ολοκληρωθεί.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Διαγραφή των μηνυμάτων μου';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Να επιτρέπονται τα απευθείας μηνύματα από μέλη της κοινότητας;';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Να αποκλείονται τα απευθείας μηνύματα από μέλη της κοινότητας;';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Να επιτρέπεται στα bot να σου στέλνουν απευθείας μηνύματα;';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Να μπλοκάρονται τα bot από το να σου στέλνουν απευθείας μηνύματα;';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Θέλεις να επιτρέψεις και τα απευθείας μηνύματα από μέλη των υπαρχουσών κοινοτήτων σου;';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Θέλετε να μπλοκάρετε και τα απευθείας μηνύματα από μέλη των υπαρχουσών κοινοτήτων σας;';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Θέλετε να επιτρέψετε και στα bot από τις υπάρχουσες κοινότητές σας να σας στέλνουν απευθείας μηνύματα;';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Θέλετε να μπλοκάρετε και τα bots από τις υπάρχουσες κοινότητές σας;';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'Μπορείς επίσης να αλλάξεις αυτήν τη ρύθμιση ανά κοινότητα, πατώντας παρατεταμένα το όνομα της κοινότητας και επιλέγοντας Ρυθμίσεις απορρήτου.';

  @override
  String get privacyDashboardDmConfirmAllowAll =>
      'Να επιτρέπεται σε όλες τις κοινότητες';

  @override
  String get privacyDashboardDmConfirmBlockAll =>
      'Αποκλεισμός για όλες τις κοινότητες';

  @override
  String get privacyDashboardDmConfirmSkip => 'Παράλειψη αυτού του βήματος';

  @override
  String get privacyDashboardDataRequestGoBack => 'Πίσω';

  @override
  String get privacyDashboardDataRequestExportTitle =>
      'Εξαγωγή των δεδομένων μου';

  @override
  String get privacyDashboardDataRequestDeleteTitle =>
      'Διαγραφή των μηνυμάτων μου';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'Θα το επεξεργαστούμε το συντομότερο δυνατό. Θα λάβετε ένα email όταν το αρχείο σας είναι έτοιμο.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'Θα το επεξεργαστούμε το συντομότερο δυνατό. Θα λάβετε ένα προσωπικό μήνυμα από εμάς όταν ολοκληρωθεί.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'Τι να συμπεριλάβετε';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Τα πάντα';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Εξαγωγή κάθε μηνύματος που έχετε στείλει, καθώς και όλων των ρυθμίσεων του λογαριασμού σας, των συνδρομών και των μεταδεδομένων σας.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'Προσαρμοσμένη επιλογή';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Επιλέξτε ποιους τύπους συνομιλιών, κοινότητες και χρονικό διάστημα θα συμπεριλάβετε στο αρχείο.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Επιλέξτε τι θα συμπεριλάβετε';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Επιλέξτε ποια είδη συνομιλιών θα καθαρίσετε.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Μόνο μέρη στα οποία δεν έχω πλέον πρόσβαση';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Να διαγραφούν μόνο μηνύματα από κοινότητες και ομαδικά DM από τα οποία έχετε αποχωρήσει ή έχετε αφαιρεθεί.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Ποιες συνομιλίες';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Επιλέξτε τα είδη συνομιλιών που θέλετε να συμπεριλάβετε.';

  @override
  String get privacyDashboardDataRequestKindDms => 'Ανοιχτά DM';

  @override
  String get privacyDashboardDataRequestKindDmsClosed => 'Κλειστά DM';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'Ομαδικές συνομιλίες';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Κοινότητες';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Ποιες κοινότητες';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Φίλτρο κοινότητας';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Να συμπεριληφθούν όλα εκτός από τα επιλεγμένα';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude =>
      'Μόνο οι επιλεγμένοι';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'Δεν είστε σε καμία κοινότητα αυτήν τη στιγμή.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Εύρος χρόνου';

  @override
  String get privacyDashboardDataRequestDateMode => 'Εύρος χρόνου';

  @override
  String get privacyDashboardDataRequestAllTime => 'Όλη την ώρα';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Προσαρμοσμένο εύρος';

  @override
  String get privacyDashboardDataRequestStartDate => 'Ημερομηνία έναρξης';

  @override
  String get privacyDashboardDataRequestEndDate => 'Ημερομηνία λήξης';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Αφήστε οποιοδήποτε πεδίο κενό για να αφήσετε αυτό το άκρο του παραθύρου απεριόριστο.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Επιλέξτε τουλάχιστον έναν τύπο συνομιλίας για συμπερίληψη.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'Η ημερομηνία έναρξης πρέπει να είναι νωρίτερα από την ημερομηνία λήξης.';

  @override
  String get privacyDashboardDataRequestConfirmTitle =>
      'Επισκόπηση και επιβεβαίωση';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'Θα δημιουργήσουμε ένα αρχείο με όλα τα μηνύματα που έχετε στείλει και θα σας στείλουμε email όταν είναι έτοιμο. Ο σύνδεσμος λήψης σε αυτό το email λήγει μετά από 7 ημέρες.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'Θα δημιουργήσουμε ένα αρχείο με δυνατότητα λήψης που να ταιριάζει με τα παρακάτω φίλτρα και θα σας στείλουμε email όταν είναι έτοιμο. Ο σύνδεσμος λήψης σε αυτό το email λήγει μετά από 7 ημέρες.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Διαγραφή οριστικά των μηνυμάτων που ταιριάζουν με τα παρακάτω φίλτρα. Αυτή η ενέργεια δεν μπορεί να αναιρεθεί.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'Δεν υπάρχει ανάκτηση μόλις ξεκινήσει αυτή η διαδικασία. Θα σας στείλουμε DM όταν ολοκληρωθεί.';

  @override
  String get privacyDashboardDataRequestRequestExport =>
      'Αίτημα εξαγωγής δεδομένων';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Διαγραφή μηνυμάτων';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Πεδίο εφαρμογής';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'Συνομιλίες';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Κοινότητες';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Εύρος χρόνου';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'Κανένα';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'Από $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'Μέχρι $end';
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
      other: '# κοινότητες',
      one: '# κοινότητα',
    );
    return 'Όλες εκτός από $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# κοινότητες',
      one: '# κοινότητα',
    );
    return 'Μόνο $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Ανοιχτά προσωπικά μηνύματα';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Κλειστά απευθείας μηνύματα';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Απευθείας μηνύματα (ανοιχτά και κλειστά)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms =>
      'Ομαδικές συνομιλίες';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Κοινότητες';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# ώρες',
      one: '# ώρα',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# λεπτά',
      one: '# λεπτό',
    );
    return '$_temp0 και $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# ώρες',
      one: '# ώρα',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# λεπτά',
      one: '# λεπτό',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# δευτερόλεπτα',
      one: '# δευτερόλεπτο',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed =>
      'Απέτυχε η φόρτωση των ρυθμίσεων απορρήτου';

  @override
  String get privacyDashboardRetry => 'Επανάληψη';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Απέτυχε η αποθήκευση των ρυθμίσεων για ευαίσθητο περιεχόμενο.';

  @override
  String get privacyDashboardDataRequestFailed =>
      'Απέτυχε η ολοκλήρωση του αιτήματος.';

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
      'Αναμονή λήξης της αργής λειτουργίας σε ένα ή περισσότερα επιλεγμένα κανάλια.';

  @override
  String get slowmodeRateLimitedTitle => 'Ενεργή αργή λειτουργία';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'Η αργή λειτουργία είναι ενεργοποιημένη — περιμένετε $duration πριν στείλετε άλλο μήνυμα.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'Η απευθείας μεταφόρτωση είναι απενεργοποιημένη κατά τη λειτουργία αργής ταχύτητας.';

  @override
  String get shareMediaTitle => 'Κοινοποίηση σε';

  @override
  String get shareMediaMessageHint => 'Προσθήκη προαιρετικού μηνύματος…';

  @override
  String get shareMediaSendButton => 'Αποστολή';

  @override
  String get shareMediaSuccessToast => 'Μέσα κοινοποιήθηκαν';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'Κοινοποιήθηκε σε $count προορισμούς';
  }

  @override
  String get shareMediaFailedToast => 'Αποτυχία κοινοποίησης πολυμέσων';

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
  String get chatMessageCopyEmbedText => 'Αντιγραφή κειμένου ενσωμάτωσης';

  @override
  String get chatMessageTranslate => 'Μετάφραση';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Μεταφράστηκε από $language';
  }

  @override
  String get chatMessageSeeOriginal => 'Δείτε το πρωτότυπο';

  @override
  String get chatMessageSeeTranslation => 'Δείτε τη μετάφραση';

  @override
  String get chatMessageTranslating => 'Μεταφράζοντας…';

  @override
  String get chatMessageTranslateFailed =>
      'Δεν ήταν δυνατή η μετάφραση αυτού του μηνύματος.';

  @override
  String get chatMessageTranslateUnavailable =>
      'Η μετάφραση δεν είναι διαθέσιμη σε αυτήν τη συσκευή.';

  @override
  String get chatMessageSpeak => 'Εκφώνηση μηνύματος';

  @override
  String get chatMessageStopSpeaking => 'Διακοπή ομιλίας';

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
  String get chatMessageOpenLink => 'Άνοιγμα συνδέσμου';

  @override
  String get chatMessageCopyLink => 'Αντιγραφή συνδέσμου';

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
  String get chatReactionAddFailed => 'Αποτυχία προσθήκης αντίδρασης';

  @override
  String get chatReactionRemoveFailed => 'Αποτυχία αφαίρεσης αντίδρασης';

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
  String get chatMessageDeleteAttachment => 'Διαγραφή συνημμένου';

  @override
  String get chatMessageEditAttachmentAltText =>
      'Επεξεργασία εναλλακτικού κειμένου';

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
      other: '$count αποκλεισμένα μηνύματα',
      one: '1 αποκλεισμένο μήνυμα',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count πιθανά μηνύματα spammer',
      one: '1 πιθανό μήνυμα spammer',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Η απάντηση είναι κρυφή, επειδή ο αρχικός συντάκτης έχει αποκλειστεί.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Η απάντηση αποκρύφτηκε επειδή ο αρχικός συντάκτης έχει επισημανθεί ως ανεπιθύμητος.';

  @override
  String get devMarkAsSpamLocally => 'Σήμανση ως ανεπιθύμητο τοπικά';

  @override
  String get devIgnoreSpamFlag => 'Παράβλεψη επισήμανσης ανεπιθύμητου';

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
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

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
  String get mediaViewerOptions => 'Επιλογές πολυμέσων';

  @override
  String get mediaViewerCopyLink => 'Αντιγραφή συνδέσμου';

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
    return 'Συνημμένο $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Κλείσιμο';

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
  String get composerAutocompleteSuggestions => 'Προτάσεις';

  @override
  String get composerAutocompleteCommandsHeading => 'Εντολές';

  @override
  String get composerAutocompleteChoicesHeading => 'Επιλογές';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'Προαιρετικά ορίσματα';

  @override
  String get composerAutocompleteChannelsHeading => 'Κανάλια';

  @override
  String get composerAutocompleteMembersHeading => 'Μέλη';

  @override
  String get composerAutocompleteUsersHeading => 'Χρήστες';

  @override
  String get composerAutocompleteMentionsHeading => 'Αναφορές';

  @override
  String get composerAutocompleteRolesHeading => 'Ρόλοι';

  @override
  String get composerAutocompleteMediaHeading => 'Μέσα';

  @override
  String get composerAutocompleteStickersHeading => 'Αυτοκόλλητα';

  @override
  String get composerAutocompleteGifsHeading => 'GIF';

  @override
  String get composerAutocompleteNoGifs => 'Δεν βρέθηκαν GIFs';

  @override
  String get composerCommandShrugDescription =>
      'Προσθέτει ¯\\_(ツ)_/¯ στο μήνυμά σου.';

  @override
  String get composerCommandTableflipDescription =>
      'Προσθέτει (╯°□°)╯︵ ┻━┻ στο μήνυμά σου.';

  @override
  String get composerCommandUnflipDescription =>
      'Προσθέτει ┬─┬ ノ( ゜-゜ノ) στο μήνυμά σου.';

  @override
  String get composerCommandMeDescription =>
      'Στείλε ένα μήνυμα ενέργειας (εμφανίζεται με πλάγια γραφή).';

  @override
  String get composerCommandSpoilerDescription =>
      'Στείλε μήνυμα-έκπληξη (το κρύβει με ετικέτες spoiler).';

  @override
  String get composerCommandTtsDescription =>
      'Στείλτε ένα μήνυμα μετατροπής κειμένου σε ομιλία.';

  @override
  String get composerCommandNickDescription =>
      'Άλλαξε το ψευδώνυμό σου σε αυτήν την κοινότητα.';

  @override
  String get composerCommandKickDescription =>
      'Διαγραφή μέλους από αυτήν την κοινότητα.';

  @override
  String get composerCommandBanDescription =>
      'Αποκλεισμός μέλους από αυτήν την κοινότητα.';

  @override
  String get composerCommandMsgDescription =>
      'Στείλτε ένα απευθείας μήνυμα σε έναν χρήστη.';

  @override
  String get composerCommandSavedDescription =>
      'Στείλε ένα αποθηκευμένο πολυμεσικό στοιχείο.';

  @override
  String get composerCommandStickerDescription => 'Στείλε ένα αυτοκόλλητο.';

  @override
  String get composerCommandGifDescription => 'Αναζήτηση και αποστολή GIF.';

  @override
  String get composerCommandMemberOption =>
      'Το μέλος στο οποίο θα γίνει στόχευση.';

  @override
  String get composerCommandReasonOption => 'Λόγος (προαιρετικό).';

  @override
  String get composerCommandMessageOption => 'Το μήνυμα για αποστολή.';

  @override
  String get composerCommandQueryOption => 'Τι να αναζητήσετε.';

  @override
  String get composerCommandNicknameOption =>
      'Το νέο σου ψευδώνυμο, ή άφησέ το κενό για επαναφορά.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'Πόσο από το πρόσφατο ιστορικό μηνυμάτων του μέλους θέλετε να διαγράψετε.';

  @override
  String get composerCommandDeleteMessagesNone => 'Να μην διαγραφούν';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Προηγούμενες $count ημέρες';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'Προηγούμενες 24 ώρες';

  @override
  String get composerCommandOptionRequired =>
      'Αυτή η επιλογή είναι απαραίτητη. Παρακαλώ δώστε μια τιμή.';

  @override
  String get composerCommandClear => 'Εκκαθάριση εντολής';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'Άλλαξες το ψευδώνυμό σου σε αυτήν την κοινότητα από **$previousNickname** σε **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'Άγνωστος χρήστης';

  @override
  String composerCommandMsgFailed(String username) {
    return 'Απέτυχε η αποστολή μηνύματος στον/στην **$username**. Πιθανόν να έχει απενεργοποιήσει τα απευθείας μηνύματα ή να σε έχει μπλοκάρει.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count περισσότερα';
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
  String get addGuildCreateTitle => 'Δημιουργία κοινότητας';

  @override
  String get addGuildCreateDescription =>
      'Δημιούργησε μια κοινότητα για να συνομιλείς με τους φίλους σου.';

  @override
  String get addGuildCreateNameLabel => 'Όνομα κοινότητας';

  @override
  String get addGuildCreateSubmit => 'Δημιουργία κοινότητας';

  @override
  String get addGuildCreateFailed =>
      'Δεν ήταν δυνατή η δημιουργία της κοινότητας. Δοκιμάστε ξανά.';

  @override
  String get addGuildCreateClaimTitle => 'Διεκδίκησε τον λογαριασμό σου';

  @override
  String get addGuildCreateClaimDescription =>
      'Πρέπει να επιβεβαιώσεις τον λογαριασμό σου πριν δημιουργήσεις μια κοινότητα.';

  @override
  String get addGuildCreateVerifyTitle => 'Επαληθεύστε το email σας';

  @override
  String get addGuildCreateVerifyDescription =>
      'Πρέπει να επιβεβαιώσεις τη διεύθυνση email σου πριν δημιουργήσεις μια κοινότητα.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Οι κινούμενες εικονίδια δεν υποστηρίζονται κατά τη δημιουργία μιας νέας κοινότητας. Χρησιμοποιήστε μια στατική εικόνα.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'Δημιουργώντας μια κοινότητα, συμφωνείτε να ακολουθείτε και να τηρείτε τις ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return 'Οδηγίες κοινότητας του $productName';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'Αυτό το instance είναι μια μοναδική κοινότητα, οπότε δεν μπορούν να δημιουργηθούν επιπλέον κοινότητες.';

  @override
  String get addGuildCreateChangeIcon => 'Αλλαγή εικονιδίου';

  @override
  String get addGuildCreateIconLabel => 'Εικονίδιο κοινότητας';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Μέγιστο 10MB. Προτεινόμενο: 512×512px';

  @override
  String get addGuildImportDescription =>
      'Επικολλήστε μια διεύθυνση URL προτύπου Discord για να εισαγάγετε τη δομή του σε μια νέα κοινότητα.';

  @override
  String get addGuildImportUrlLabel => 'URL προτύπου';

  @override
  String get addGuildImportUrlInvalid =>
      'Εισαγάγετε έγκυρο σύνδεσμο ή κωδικό προτύπου Discord.';

  @override
  String get addGuildImportFetchFailed =>
      'Απέτυχε η λήψη του προτύπου κοινότητας. Το πρότυπο ενδέχεται να μην υπάρχει ή η εξωτερική υπηρεσία να μην είναι διαθέσιμη.';

  @override
  String get addGuildImportInvalidResponse =>
      'Αυτό δεν μοιάζει με έγκυρη απάντηση προτύπου.';

  @override
  String get addGuildImportTemplateLabel => 'Πρότυπο';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount κανάλια κειμένου, $voiceChannelCount κανάλια φωνής, $categoryCount κατηγορίες, $roleCount ρόλοι';
  }

  @override
  String get addGuildImportRemoveIcon => 'Αφαίρεση εικονιδίου';

  @override
  String get addGuildImportTemplateInvalid =>
      'Τα δεδομένα του προτύπου κοινότητας είναι άκυρα ή έχουν λανθασμένη μορφή.';

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
  String get channelDetailsFallbackTitle => 'Λεπτομέρειες';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'Ομαδικό DM · $count μέλη';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'Κλείνεις τη συνομιλία σου με τον/την $name;';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'Έξοδος από την ομάδα $name;';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Ρυθμίσεις καναλιού';

  @override
  String get channelDetailsGroupSettingsTitle => 'Ρυθμίσεις Ομάδας';

  @override
  String get channelDetailsDmSettingsTitle => 'Ρυθμίσεις απευθείας μηνυμάτων';

  @override
  String get channelDetailsInvitePeople => 'Πρόσκληση ατόμων';

  @override
  String get channelDetailsCopyLink => 'Αντιγραφή συνδέσμου';

  @override
  String get channelMenuCopyChannelLink => 'Αντιγραφή συνδέσμου καναλιού';

  @override
  String get channelMenuCopyRedirectLink =>
      'Αντιγραφή συνδέσμου ανακατεύθυνσης';

  @override
  String get channelDetailsAddFriendsToGroup => 'Προσθήκη φίλων στην ομάδα';

  @override
  String get channelDetailsGroupInvites => 'Προσκλήσεις ομάδας';

  @override
  String get channelDetailsEditChannel => 'Επεξεργασία καναλιού';

  @override
  String get channelDetailsDeleteChannel => 'Διαγραφή καναλιού';

  @override
  String get channelSettingsCategorySettingsTitle => 'Ρυθμίσεις κατηγορίας';

  @override
  String get channelSettingsEditCategory => 'Επεξεργασία κατηγορίας';

  @override
  String get channelSettingsTabOverview => 'Επισκόπηση';

  @override
  String get channelSettingsTabPermissions => 'Δικαιώματα';

  @override
  String get channelSettingsTabInvites => 'Προσκλήσεις';

  @override
  String get channelSettingsTabWebhooks => 'Webhooks';

  @override
  String get channelSettingsDeleteChannel => 'Διαγραφή καναλιού';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'Είστε σίγουροι ότι θέλετε να διαγράψετε το $channelName; Αυτή η ενέργεια δεν μπορεί να αναιρεθεί.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'Είστε σίγουροι ότι θέλετε να διαγράψετε το $categoryName; Αυτή η ενέργεια δεν μπορεί να αναιρεθεί.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Διαγραφή κατηγορίας';

  @override
  String get channelSettingsChannelUpdated => 'Το κανάλι ενημερώθηκε';

  @override
  String get channelSettingsChannelName => 'Όνομα καναλιού';

  @override
  String get channelSettingsCategoryName => 'Όνομα κατηγορίας';

  @override
  String get channelSettingsMyCategory => 'Η κατηγορία μου';

  @override
  String get categoryExpandCategory => 'Ανάπτυξη κατηγορίας';

  @override
  String get categoryCollapseCategory => 'Σύμπτυξη κατηγορίας';

  @override
  String get categoryExpandAllCategories => 'Ανάπτυξη όλων των κατηγοριών';

  @override
  String get categoryCollapseAllCategories => 'Σύμπτυξη όλων των κατηγοριών';

  @override
  String get categoryMuteCategory => 'Σίγαση κατηγορίας';

  @override
  String get categoryUnmuteCategory => 'Κατάργηση σίγασης κατηγορίας';

  @override
  String get categoryCopyCategoryId => 'Αντιγραφή αναγνωριστικού κατηγορίας';

  @override
  String get categoryIdCopied => 'Αντιγράφηκε το αναγνωριστικό κατηγορίας';

  @override
  String get channelSettingsChannelNamePlaceholder => 'Γενικά';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'Θέμα';

  @override
  String get channelSettingsTopicPlaceholder =>
      'Πρόσθεσε ένα θέμα σε αυτό το κανάλι';

  @override
  String get channelSettingsInsertEmoji => 'Εισαγωγή emoji';

  @override
  String get channelSettingsTopicTooLongTitle =>
      'Το θέμα του καναλιού είναι πολύ μεγάλο.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'Συντομεύστε το θέμα και δοκιμάστε ξανά.';

  @override
  String get channelSettingsSlowmode => 'Αργή λειτουργία';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Χρονικό διάστημα μεταξύ των μηνυμάτων. Η άδεια \"$bypassSlowmodePermissionLabel\" μπορεί να το παρακάμψει.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Ανενεργό';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds δευτερόλεπτα';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes λεπτά';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours ώρες';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute λεπτό';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour ώρα';
  }

  @override
  String get channelSettingsVoiceQuality => 'Ποιότητα φωνής';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'Υψηλότερο bitrate = καλύτερη ποιότητα και υψηλότερη χρήση εύρους ζώνης.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbps';
  }

  @override
  String get channelSettingsParticipantLimit => 'Όριο συμμετεχόντων';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Μέγιστος αριθμός μελών που μπορούν να συμμετάσχουν ταυτόχρονα. Το 0 σημαίνει απεριόριστο.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count συμμετέχοντες',
      one: '1 συμμετέχων',
      zero: '∞ Κανένα όριο',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Όριο συνδέσεων';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Μέγιστος αριθμός ενεργών συνδέσεων που μπορεί να διατηρήσει ένα μέλος σε αυτό το κανάλι.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count συνδέσεις',
      one: '1 σύνδεση',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Περιοχή φωνής';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Επιλέξτε μια περιοχή φωνής για αυτό το κανάλι. Η Αυτόματη χρησιμοποιεί την πλησιέστερη περιοχή.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Αυτόματο';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'Δεν ήταν δυνατή η φόρτωση των περιοχών φωνής';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Δοκιμάστε ξανά σε λίγο.';

  @override
  String get channelSettingsResetSlider =>
      'Επαναφορά ρυθμιστικού στην προεπιλεγμένη τιμή';

  @override
  String get channelSettingsAdvanced => 'Για προχωρημένους';

  @override
  String get channelSettingsMatureContentOverride =>
      'Παράκαμψη περιεχομένου ενηλίκων';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Παράκαμψη της ρύθμισης επιπέδου $scopeLevel για αυτό το κανάλι. Το περιεχόμενο ακατάλληλο για ανηλίκους εμφανίζεται πίσω από μια πύλη πριν την είσοδο.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Κληρονομία';

  @override
  String get channelSettingsMatureContentOn => 'Ενεργό';

  @override
  String get channelSettingsMatureContentOff => 'Ανενεργό';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Σηματοδοτεί αυτό το κανάλι για περιεχόμενο ακατάλληλο για ανηλίκους.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Αφήστε αυτό το κανάλι χωρίς περιορισμούς για περιεχόμενο ακατάλληλο για ανηλίκους.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Κληρονομήθηκε από $inheritedSourceLabel: ενεργό';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Κληρονομήθηκε από $inheritedSourceLabel: απενεργοποιημένο';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'κατηγορία';

  @override
  String get channelSettingsMatureContentCommunitySource => 'κοινότητα';

  @override
  String get channelSettingsMatureContentCategoryScope => 'Κατηγορία';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Κοινότητα';

  @override
  String get channelSettingsContentWarningToggle =>
      'Εμφάνιση προειδοποίησης περιεχομένου σε αυτό το κανάλι';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Ενεργοποιεί μια προτροπή συναίνεσης πριν την είσοδο σε αυτό το κανάλι.';

  @override
  String get channelSettingsContentWarningText =>
      'Προσαρμοσμένο κείμενο προειδοποίησης';

  @override
  String get channelSettingsContentWarningDefault =>
      'Περιέχει ευαίσθητο περιεχόμενο.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'Χρειάζεστε την άδεια \"$manageChannelsPermissionLabel\" για να επεξεργαστείτε αυτές τις άδειες.';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'Χρειάζεστε την άδεια \"$manageRolesPermissionLabel\" για να επεξεργαστείτε αυτές τις άδειες.';
  }

  @override
  String get channelSettingsUnknownRole => 'Άγνωστος ρόλος';

  @override
  String get channelSettingsUnknownUser => 'Άγνωστος χρήστης';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides =>
      'Παρακάμψεις πρόσβασης';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Επεξεργασία πρόσβασης για $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'Πίσω στις εξαιρέσεις';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Διαμόρφωση βασικής πρόσβασης για αυτό το κανάλι';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Διαμόρφωση εξαιρέσεων για αυτόν τον ρόλο';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Διαμόρφωση εξαιρέσεων για αυτό το μέλος';

  @override
  String get channelSettingsPermissionsSearchPlaceholder =>
      'Αναζήτηση δικαιωμάτων…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Η πρόσβαση στο κανάλι ενημερώθηκε';

  @override
  String get channelSettingsPermissionsTitle => 'Έλεγχος πρόσβασης';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'Αυτό το κανάλι συγχρονίζεται με τη γονική κατηγορία ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'Αυτό το κανάλι δεν συγχρονίζεται με τη γονική κατηγορία ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory =>
      'Συγχρονισμός με την κατηγορία';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'Το κανάλι συγχρονίστηκε με τη γονική κατηγορία';

  @override
  String get channelSettingsPermissionsAddOverride => 'Προσθήκη εξαίρεσης';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Αναζήτηση ρόλων ή μελών…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => 'Ρόλοι και μέλη';

  @override
  String get channelSettingsDeleteInvite => 'Διαγραφή πρόσκλησης';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Να διαγραφεί αυτή η πρόσκληση; Δεν μπορεί να αναιρεθεί.';

  @override
  String get channelSettingsCopyInviteCode => 'Αντιγραφή κωδικού πρόσκλησης';

  @override
  String get channelSettingsCopyInviteUrl => 'Αντιγραφή URL πρόσκλησης';

  @override
  String get channelSettingsWebhookCreated => 'Το webhook δημιουργήθηκε';

  @override
  String get channelSettingsWebhookCreateFailed =>
      'Αποτυχία δημιουργίας webhook';

  @override
  String get channelSettingsCreateWebhook => 'Δημιουργία webhook';

  @override
  String get channelSettingsInvitesDescription =>
      'Διαχείριση συνδέσμων πρόσκλησης για αυτό το κανάλι.';

  @override
  String get channelSettingsInvitesCreate => 'Δημιουργία πρόσκλησης';

  @override
  String get channelSettingsInvitesEmpty => 'Δεν υπάρχουν σύνδεσμοι πρόσκλησης';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'Αυτό το κανάλι δεν έχει συνδέσμους πρόσκλησης ακόμα. Δημιουργήστε έναν για να προσκαλέσετε άτομα σε αυτό το κανάλι.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Παρουσιάστηκε σφάλμα κατά τη φόρτωση των συνδέσμων πρόσκλησης για αυτό το κανάλι. Δοκιμάστε ξανά.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Διαχειριστείτε τα εισερχόμενα webhooks που μπορούν να δημοσιεύουν μηνύματα σε αυτό το κανάλι.';

  @override
  String get channelSettingsWebhooksEmpty => 'Δεν υπάρχουν webhooks';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'Δεν έχουν ρυθμιστεί webhooks για αυτό το κανάλι. Δημιουργήστε ένα webhook για να επιτρέψετε σε εξωτερικές εφαρμογές να δημοσιεύουν μηνύματα.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Αυτό το κανάλι δεν υποστηρίζει webhooks.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'Χρειάζεστε την άδεια \"$permission\" για να προβάλετε και να επεξεργαστείτε τα webhooks για αυτό το κανάλι.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'Αποτυχία φόρτωσης webhooks';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Παρουσιάστηκε σφάλμα κατά τη φόρτωση των webhooks για αυτό το κανάλι. Δοκιμάστε ξανά.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Δημιουργήθηκε από τον/την $creator στις $date';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'Άγνωστος χρήστης';

  @override
  String get channelSettingsWebhooksAvatar => 'Εικόνα προφίλ';

  @override
  String get channelSettingsWebhooksUploadImage => 'Αποστολή εικόνας';

  @override
  String get channelSettingsWebhooksRemove => 'Αφαίρεση';

  @override
  String get channelSettingsWebhooksName => 'Όνομα';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Όνομα webhook';

  @override
  String get channelSettingsWebhooksChannel => 'Κανάλι';

  @override
  String get channelSettingsWebhooksUrl => 'URL Webhook';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Αντιγραφή URL webhook';

  @override
  String get channelSettingsWebhooksDelete => 'Διαγραφή webhook';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'Αδυναμία διαγραφής αυτού του webhook';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'Διαγραφή αυτού του webhook; Δεν αναιρείται.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Δοκιμάστε ξανά σε λίγο.';

  @override
  String get channelMenuOpenChat => 'Άνοιγμα συνομιλίας';

  @override
  String get channelMenuDuplicateChannel => 'Αντιγραφή καναλιού';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Επαναφορά κατάστασης συμφωνίας περιεχομένου ενηλίκων';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Να διαγραφούν τα μηνύματά σας σε αυτό το κανάλι;';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Αυτό θα διαγράψει οριστικά κάθε μήνυμα που έχετε στείλει ποτέ σε αυτό το κανάλι. Αυτή η ενέργεια δεν μπορεί να αναιρεθεί.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Διαγραφή των μηνυμάτων μου';

  @override
  String get channelMenuDeletedYourMessages => 'Διέγραψες τα μηνύματά σου';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'Δεν ήταν δυνατή η διαγραφή των μηνυμάτων σας';

  @override
  String get channelDetailsSystemMessage => 'Μήνυμα συστήματος';

  @override
  String get channelDetailsTextChannel => 'Κανάλι κειμένου';

  @override
  String get channelDetailsVoiceChannel => 'Κανάλι φωνής';

  @override
  String get channelDetailsCategory => 'Κατηγορία';

  @override
  String get channelDetailsLinkChannel => 'Σύνδεση καναλιού';

  @override
  String get channelDetailsGenericChannel => 'Κανάλι';

  @override
  String get channelDetailsMutedConversation => 'Σίγαση συνομιλίας';

  @override
  String get channelDetailsUnmutedConversation =>
      'Η συνομιλία έχει γίνει ξανά ορατή';

  @override
  String get channelDetailsMutedChannel => 'Κανάλι σε σίγαση';

  @override
  String get channelDetailsUnmutedChannel => 'Κανάλι μη σε σίγαση';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Οι ρυθμίσεις ειδοποιήσεων ενημερώθηκαν';

  @override
  String get channelDetailsTabMembers => 'Μέλη';

  @override
  String get channelDetailsTabPins => 'Καρφιτσωμένα';

  @override
  String get channelDetailsActionMute => 'Σίγαση';

  @override
  String get channelDetailsActionUnmute => 'Κατάργηση σίγασης';

  @override
  String get channelDetailsActionSearch => 'Αναζήτηση';

  @override
  String get channelDetailsActionMore => 'Περισσότερα';

  @override
  String get channelDetailsMembersEmptyTitle =>
      'Δεν υπάρχουν μέλη για εμφάνιση';

  @override
  String get channelDetailsMembersEmptyBody =>
      'Τα μέλη θα εμφανιστούν εδώ μόλις φορτώσουν τα δεδομένα της κοινότητας.';

  @override
  String get memberListPermissionDeniedTitle => 'Δεν μπορείς να δεις τα μέλη';

  @override
  String get memberListPermissionDeniedBody =>
      'Δεν μπορείτε να δείτε τα μέλη αυτού του καναλιού σε αυτήν την κοινότητα';

  @override
  String get memberListUnavailableTitle => 'Η λίστα μελών δεν είναι διαθέσιμη';

  @override
  String get memberListUnavailableBody =>
      'Οι λίστες μελών είναι προσωρινά μη διαθέσιμες σε αυτήν την κοινότητα';

  @override
  String get channelDetailsPinsLoadFailedTitle =>
      'Τα καρφιτσωμένα μηνύματα δεν φορτώθηκαν';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'Τα μέλη με την άδεια \"Καρφίτσωμα μηνυμάτων\" μπορούν να καρφιτσώνουν μηνύματα για να τα βλέπουν όλοι.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'Μπορείς να καρφιτσώσεις μηνύματα σε αυτή τη συνομιλία για να τα δουν όλοι.';

  @override
  String get channelDetailsPinsEndReached => 'Έφτασες στο τέλος';

  @override
  String get channelHeaderOpenDetails => 'Άνοιγμα λεπτομερειών καναλιού';

  @override
  String get channelHeaderPinnedMessages => 'Καρφιτσωμένα μηνύματα';

  @override
  String get channelHeaderPinnedMessagesUnread =>
      'Καρφιτσωμένα μηνύματα, αδιάβαστα';

  @override
  String get channelHeaderMemberList => 'Λίστα μελών';

  @override
  String get channelHeaderInbox => 'Εισερχόμενα';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Ρυθμίσεις ειδοποιήσεων, σε σίγαση';

  @override
  String get channelDetailsSearchTitle => 'Αναζήτηση';

  @override
  String get channelDetailsSearchHint => 'Αναζήτηση μηνυμάτων';

  @override
  String get channelDetailsSearchFilterFrom => 'Από';

  @override
  String get channelDetailsSearchFilterHas => 'Έχει';

  @override
  String get channelDetailsSearchFilterIn => 'Σε';

  @override
  String get channelDetailsSearchFilterMentions => 'Αναφορές';

  @override
  String get channelDetailsSearchFilterMore => 'Περισσότερα';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Ενεργό';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count κανάλια';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count χρήστες';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'Χρήστης';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Μποτ';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => 'Φιλτράρισμα ανά κανάλι';

  @override
  String get channelDetailsSearchChannelsHint => 'Αναζήτηση καναλιών';

  @override
  String get channelDetailsSearchChannelsEmpty => 'Δεν βρέθηκαν κανάλια';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Καρφιτσωμένα';

  @override
  String get channelDetailsSearchPinnedTrue => 'Μόνο καρφιτσωμένα';

  @override
  String get channelDetailsSearchPinnedFalse => 'Εξαίρεση καρφιτσωμένων';

  @override
  String get channelDetailsSearchClearFilter => 'Εκκαθάριση';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Τύπος συγγραφέα';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Ημερομηνία';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Ημερομηνία';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Επιλογή ημερομηνίας';

  @override
  String get channelDetailsSearchMoreFiltersLink =>
      'Σύνδεση ονόματος κεντρικού υπολογιστή';

  @override
  String get channelDetailsSearchMoreFiltersFileName =>
      'Το όνομα αρχείου περιέχει';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'Επέκταση αρχείου';

  @override
  String get channelDetailsSearchContentPoll => 'Δημοσκόπηση';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'Μηνύματα με δημοσκόπηση';

  @override
  String get channelDetailsSearchContentForward => 'Προώθηση';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Προωθούμενα μηνύματα';

  @override
  String get channelDetailsSearchFilterSort => 'Ταξινόμηση';

  @override
  String get channelHeaderSearchFiltersTitle => 'Φίλτρα αναζήτησης';

  @override
  String get channelHeaderSearchRecentTitle => 'Πρόσφατες αναζητήσεις';

  @override
  String get channelHeaderSearchUsersTitle => 'Χρήστες';

  @override
  String get channelHeaderSearchChannelsTitle => 'Κανάλια';

  @override
  String get channelHeaderSearchValuesTitle => 'Τιμές';

  @override
  String get channelHeaderSearchDatesTitle => 'Ημερομηνίες';

  @override
  String get channelHeaderSearchDefaultBadge => 'Προεπιλογή';

  @override
  String get channelHeaderSearchClearHistory => 'Εκκαθάριση';

  @override
  String get channelHeaderSearchFilterDescFrom => 'ένας χρήστης';

  @override
  String get channelHeaderSearchFilterDescMentions => 'ένας χρήστης';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'σύνδεσμος, ενσωμάτωση, εικόνα, βίντεο, ήχος, αρχείο, αυτοκόλλητο, …';

  @override
  String get channelHeaderSearchFilterDescBefore =>
      'μια ημερομηνία ή εύρος ημερομηνιών';

  @override
  String get channelHeaderSearchFilterDescOn =>
      'μια ημερομηνία ή εύρος ημερομηνιών';

  @override
  String get channelHeaderSearchFilterDescDuring =>
      'μια ημερομηνία ή εύρος ημερομηνιών';

  @override
  String get channelHeaderSearchFilterDescAfter =>
      'μια ημερομηνία ή εύρος ημερομηνιών';

  @override
  String get channelHeaderSearchFilterDescIn => 'ένα κανάλι';

  @override
  String get channelHeaderSearchFilterDescPinned => 'σωστό ή λάθος';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'χρήστης, bot ή webhook';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'ένα όνομα κεντρικού υπολογιστή, π.χ. example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'μέρος ονόματος αρχείου συνημμένου';

  @override
  String get channelHeaderSearchFilterDescFileType =>
      'μια επέκταση αρχείου, π.χ. png';

  @override
  String get channelHeaderSearchFilterDescSort => 'χρονική σήμανση ή συνάφεια';

  @override
  String get channelHeaderSearchFilterDescOrder => 'αύξουσα ή φθίνουσα';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString αποτελέσματα',
      one: '1 αποτέλεσμα',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'Φιλτράρισμα ανά χρήστη';

  @override
  String get channelDetailsSearchFilterByContent =>
      'Φιλτράρισμα κατά περιεχόμενο';

  @override
  String get channelDetailsSearchSortBy => 'Ταξινόμηση αποτελεσμάτων κατά';

  @override
  String get channelDetailsSearchIn => 'Αναζήτηση σε';

  @override
  String get channelDetailsSearchEmptyTitle =>
      'Αναζήτηση σε αυτήν τη συνομιλία';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Πληκτρολογήστε κείμενο, συγγραφέα ή φίλτρο περιεχομένου για να βρείτε μηνύματα.';

  @override
  String get channelDetailsSearchIndexingTitle =>
      'Οι συνομιλίες γίνονται ευρετηρίαση';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Δοκιμάστε ξανά σύντομα, μόλις ολοκληρωθεί η ευρετηρίαση της αναζήτησης σε αυτό το εύρος.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Κανένα αποτέλεσμα';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Δοκιμάστε διαφορετικούς όρους αναζήτησης ή φίλτρα.';

  @override
  String get channelDetailsMembersOnline => 'Συνδεδεμένοι';

  @override
  String get channelDetailsMembersOffline => 'Εκτός σύνδεσης';

  @override
  String get channelDetailsMemberYou => 'Εσείς';

  @override
  String get channelDetailsSearchUsersHint => 'Αναζήτηση χρηστών';

  @override
  String get channelDetailsSearchUsersTypeToSearch =>
      'Πληκτρολογήστε για αναζήτηση μελών';

  @override
  String get channelDetailsSearchUsersEmpty => 'Δεν βρέθηκαν χρήστες';

  @override
  String get channelDetailsSearchUsersNoAvailable =>
      'Δεν υπάρχουν διαθέσιμοι χρήστες';

  @override
  String get channelDetailsDone => 'Τέλος';

  @override
  String get channelDetailsHasFilterPrompt =>
      'Εμφάνιση μηνυμάτων που περιέχουν:';

  @override
  String get channelDetailsRetry => 'Επανάληψη';

  @override
  String get channelDetailsPinnedMessageTitle => 'Καρφιτσωμένο μήνυμα';

  @override
  String get channelDetailsSearchResultTitle => 'Αποτέλεσμα αναζήτησης';

  @override
  String get channelDetailsJumpToMessage => 'Μετάβαση στο μήνυμα';

  @override
  String get channelDetailsUnpinMessage => 'Αποκατάσταση μηνύματος';

  @override
  String get channelDetailsCopyMessageLink => 'Αντιγραφή συνδέσμου μηνύματος';

  @override
  String get channelDetailsCopyMessageId =>
      'Αντιγραφή αναγνωριστικού μηνύματος';

  @override
  String get channelDetailsMessageUnpinned => 'Το μήνυμα αποκαρφιτσώθηκε';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Τρέχουσα Κοινότητα';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'Τρέχουσα συνομιλία';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Όλες οι κοινότητες';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild =>
      'Μόνο όλα τα απευθείας μηνύματα';

  @override
  String get channelDetailsSearchScopeAllDms => 'Όλες οι συζητήσεις';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild => 'Μόνο άμεσα μηνύματα';

  @override
  String get channelDetailsSearchScopeOpenDms => 'Ανοιχτά DM';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Όλα τα άμεσα μηνύματα + Κοινότητες';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Ανοιχτά απευθείας μηνύματα + Κοινότητες';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Αναζήτηση μόνο στην τρέχουσα Κοινότητα';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Αναζήτηση μόνο σε αυτήν τη συνομιλία';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'Σε όλες τις Κοινότητες στις οποίες βρίσκεστε αυτήν τη στιγμή';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Μόνο σε όλες τις προσωπικές συνομιλίες στις οποίες συμμετείχατε';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'Σε όλες τις συνομιλίες που έχεις συμμετάσχει';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'Σε όλα τα απευθείας μηνύματα που έχεις ανοιχτά μόνο';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'Σε όλα τα άμεσα μηνύματα που έχεις ανοιχτά';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'Σε όλα τα άμεσα μηνύματα που είχατε ποτέ + όλες τις Κοινότητες που βρίσκεστε τώρα';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'Σε όλα τα άμεσα μηνύματα που έχεις ανοιχτά + σε όλες τις Κοινότητες που είσαι μέλος';

  @override
  String get channelDetailsSearchSortNewest => 'Νεότερα Πρώτα';

  @override
  String get channelDetailsSearchSortOldest => 'Παλαιότερα Πρώτα';

  @override
  String get channelDetailsSearchSortRelevance => 'Πιο Σχετικά';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Εμφάνιση πρώτα των πιο πρόσφατων μηνυμάτων';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Εμφάνιση πρώτα των παλαιότερων μηνυμάτων';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Εμφάνιση πρώτα των πιο σχετικών μηνυμάτων';

  @override
  String get channelDetailsSearchContentImage => 'Μεταφόρτωση εικόνας';

  @override
  String get channelDetailsSearchContentVideo => 'Μεταφόρτωση βίντεο';

  @override
  String get channelDetailsSearchContentAudio => 'Μεταφόρτωση ήχου';

  @override
  String get channelDetailsSearchContentFile => 'Μεταφόρτωση αρχείου';

  @override
  String get channelDetailsSearchContentLink => 'Σύνδεσμος';

  @override
  String get channelDetailsSearchContentEmbed =>
      'Προεπισκόπηση συνδέσμου ή ενσωμάτωση';

  @override
  String get channelDetailsSearchContentSticker => 'Αυτοκόλλητο';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Μόνο αρχεία εικόνων που ανέβηκαν';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Μόνο βίντεο που ανέβηκαν';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Μόνο ανεβασμένα αρχεία ήχου';

  @override
  String get channelDetailsSearchContentFileDescription =>
      'Οποιοδήποτε ανεβασμένο συνημμένο';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'Πληκτρολογημένη διεύθυνση URL στο κείμενο μηνύματος';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Επιλύθηκαν προεπισκοπήσεις και εμπλουτισμένες ενσωματώσεις, όχι μεταφορτώσεις';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Αυτοκόλλητο συνημμένο στο μήνυμα';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count τύποι';
  }

  @override
  String get personalNotesTitle => 'Προσωπικές σημειώσεις';

  @override
  String get personalNotesSubtitle =>
      'Ο ιδιωτικός σας χώρος για σκέψεις και υπενθυμίσεις';

  @override
  String groupDmWelcome(String displayName) {
    return 'Καλώς ήρθες στο $displayName. Πρόσθεσε φίλους για να ξεκινήσει η συζήτηση.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Επεξεργασία ομάδας';

  @override
  String get groupDmWelcomeAddFriends => 'Προσθήκη φίλων στην ομάδα';

  @override
  String get dmGroupInvites => 'Προσκλήσεις';

  @override
  String get groupDmEditTitle => 'Επεξεργασία ομάδας';

  @override
  String get groupDmEditDetailsTooltip => 'Επεξεργασία στοιχείων ομάδας';

  @override
  String get groupDmGroupName => 'Όνομα ομάδας';

  @override
  String get groupDmMyGroup => 'Η ομάδα μου';

  @override
  String get groupDmGroupNameMaxLength =>
      'Το όνομα της ομάδας δεν πρέπει να υπερβαίνει τους 100 χαρακτήρες';

  @override
  String get groupDmGroupIcon => 'Εικονίδιο ομάδας';

  @override
  String get groupDmUploadIcon => 'Αποστολή εικονιδίου';

  @override
  String get groupDmChangeIcon => 'Αλλαγή εικονιδίου';

  @override
  String get groupDmRemoveIcon => 'Αφαίρεση εικονιδίου';

  @override
  String get groupDmUpdated => 'Η ομάδα ενημερώθηκε';

  @override
  String get groupDmUpdateFailed =>
      'Αδυναμία ενημέρωσης της ομάδας. Δοκιμάστε ξανά.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Οι κινούμενες εικονίδια δεν υποστηρίζονται. Χρησιμοποιήστε μια στατική εικόνα.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Οι κινούμενες εικόνες δεν υποστηρίζονται';

  @override
  String get groupDmIconFileTooLargeTitle =>
      'Το αρχείο εικονιδίου είναι πολύ μεγάλο';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'Το αρχείο εικονιδίου είναι πολύ μεγάλο. Επιλέξτε ένα αρχείο μικρότερο από $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat =>
      'Μη υποστηριζόμενη μορφή εικονιδίου';

  @override
  String get groupDmUnsupportedIconFormatBody =>
      'Μη υποστηριζόμενος τύπος αρχείου.';

  @override
  String get groupDmCouldntProcessImage =>
      'Δεν ήταν δυνατή η επεξεργασία της εικόνας';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'Αποτυχία επεξεργασίας της περικομμένης εικόνας. Δοκιμάστε ξανά.';

  @override
  String get groupDmInvalidImage => 'Μη έγκυρη εικόνα';

  @override
  String get groupDmInvalidImageBody =>
      'Αυτή η εικόνα δεν είναι έγκυρη. Δοκιμάστε μια άλλη.';

  @override
  String get groupDmAddFriends => 'Προσθήκη';

  @override
  String get groupDmOrSendInvite => 'ή στείλε μια πρόσκληση σε ένα φίλο:';

  @override
  String get groupDmGenerateInviteLink => 'Δημιουργία συνδέσμου πρόσκλησης';

  @override
  String get groupDmCreateInvite => 'Δημιουργία';

  @override
  String get groupDmInviteExpires24Hours => 'Η πρόσκλησή σου λήγει σε 24 ώρες';

  @override
  String get groupDmAddFriendFailed =>
      'Δεν ήταν δυνατή η προσθήκη αυτού του φίλου στην ομάδα. Δοκιμάστε ξανά.';

  @override
  String get groupDmAddFailed => 'Δεν ήταν δυνατή η προσθήκη στην ομάδα';

  @override
  String get groupDmGroupFull =>
      'Αυτή η ομάδα είναι πλήρης. Αφαιρέστε κάποιον πριν προσθέσετε κι άλλα άτομα.';

  @override
  String get groupDmRateLimited =>
      'Πηγαίνεις πολύ γρήγορα. Περίμενε λίγο και δοκίμασε ξανά.';

  @override
  String get groupDmCreateInviteFailed =>
      'Δεν ήταν δυνατή η δημιουργία συνδέσμου πρόσκλησης';

  @override
  String get groupDmCreateInviteFailedBody =>
      'Δεν ήταν δυνατή η δημιουργία συνδέσμου πρόσκλησης. Δοκιμάστε ξανά.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'Δεν ήταν δυνατή η δημιουργία συνδέσμου πρόσκλησης. Δοκιμάστε ξανά.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'Δεν έχετε άδεια να δημιουργήσετε πρόσκληση σε αυτό το κανάλι.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'Αυτό το community έχει φτάσει στο όριο προσκλήσεων.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'Η δημιουργία προσκλήσεων έχει απενεργοποιηθεί προσωρινά για αυτήν την κοινότητα.';

  @override
  String get groupDmCopyInviteFailed =>
      'Αποτυχία αντιγραφής συνδέσμου πρόσκλησης';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Μόνο ο κάτοχος της ομάδας μπορεί να διαχειριστεί τις προσκλήσεις.';

  @override
  String get groupDmNoInvitesCreated => 'Δεν έχουν δημιουργηθεί προσκλήσεις';

  @override
  String get groupDmLoadingInvites => 'Φόρτωση προσκλήσεων...';

  @override
  String get groupDmInvitesLoadFailed =>
      'Αποτυχία φόρτωσης προσκλήσεων. Δοκιμάστε ξανά.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Να ανακαλέσετε αυτήν την πρόσκληση; Δεν μπορεί να αναιρεθεί.';

  @override
  String get groupDmInviteRevoked => 'Η πρόσκληση ανακλήθηκε';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Δημιουργήθηκε από τον/την $name. Λήγει σε $time.';
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
  String get composerOpenExpressionPicker => 'Άνοιγμα επιλογέα εκφράσεων';

  @override
  String get composerShowKeyboard => 'Εμφάνιση πληκτρολογίου';

  @override
  String get composerCloseAttachmentPanel => 'Κλείσιμο συλλογής συνημμένων';

  @override
  String get chatAttachmentPanelPhotos => 'Φωτογραφίες';

  @override
  String get chatAttachmentPanelFiles => 'Αρχεία';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Χρειάζεται πρόσβαση στη βιβλιοθήκη φωτογραφιών';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Να επιτρέψετε πρόσβαση στη βιβλιοθήκη φωτογραφιών για να περιηγηθείτε και να επισυνάψετε πρόσφατες φωτογραφίες και βίντεο.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Άνοιγμα ρυθμίσεων';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', αποστέλλεται';

  @override
  String get messageAccessibilityFailedSuffix => ', αποτυχία αποστολής';

  @override
  String get messageAccessibilityAttachmentSummary => 'ένα συνημμένο';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count συνημμένα';
  }

  @override
  String get messageAccessibilityImageSummary => 'μια εικόνα';

  @override
  String get messageAccessibilityVideoSummary => 'ένα βίντεο';

  @override
  String get messageAccessibilityAudioSummary => 'ένα αρχείο ήχου';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'αυτοκόλλητο $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'αρχείο $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'συνημμένο με απόκρυψη';

  @override
  String get messageAccessibilityEmbedSummary => 'ένα ενσωματωμένο';

  @override
  String get messageAccessibilityEmptySummary => 'ένα μήνυμα';

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
  String get userSettingsSearchPlaceholder => 'Αναζήτηση ρυθμίσεων...';

  @override
  String get userSettingsSearchFieldLabel => 'Αναζήτηση ρυθμίσεων';

  @override
  String get userSettingsSearchClear => 'Εκκαθάριση αναζήτησης';

  @override
  String get userSettingsSearchNoResults => 'Δεν βρέθηκαν ρυθμίσεις';

  @override
  String get userSettingsNavProfile => 'Προφίλ';

  @override
  String get userSettingsNavSecurityLogin => 'Ασφάλεια & Σύνδεση';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Δώρα';

  @override
  String get giftSettingsClaimAccountTitle => 'Διεκδίκησε τον λογαριασμό σου';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Διεκδικήστε τον λογαριασμό σας για να εξαργυρώσετε ή να διαχειριστείτε κωδικούς δώρου Plutonium.';

  @override
  String get giftSettingsRedeemTitle => 'Εξαργύρωση δώρου';

  @override
  String get giftSettingsRedeemDescription =>
      'Εισαγάγετε έναν κωδικό δώρου για να εξαργυρώσετε Plutonium για τον λογαριασμό σας.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Εισαγωγή κωδικού δώρου…';

  @override
  String get giftSettingsRedeemButton => 'Εξαργύρωση';

  @override
  String get giftSettingsRedeemSuccess =>
      'Το δώρο εξαργυρώθηκε με επιτυχία. Απόλαυσε το Plutonium σου.';

  @override
  String get giftSettingsPurchasedTitle => 'Αγορασμένα δώρα';

  @override
  String get giftSettingsPurchasedDescription =>
      'Διαχειριστείτε τους κωδικούς δώρου Plutonium που αγοράσατε. Μοιραστείτε το URL του δώρου με κάποιον ξεχωριστό ή εξαργυρώστε το για τον εαυτό σας!';

  @override
  String get giftSettingsEmptyTitle => 'Δεν υπάρχουν δώρα ακόμα';

  @override
  String get giftSettingsEmptyDescription =>
      'Αγόρασε ένα δώρο Plutonium από την καρτέλα Plutonium για να μοιραστείς με φίλους.';

  @override
  String get giftSettingsGoToPlutonium => 'Μετάβαση στο Plutonium';

  @override
  String get giftSettingsLoadFailedTitle =>
      'Αποτυχία φόρτωσης αποθέματος δώρων';

  @override
  String get giftSettingsLoadFailedDescription => 'Δοκιμάστε ξανά αργότερα.';

  @override
  String get giftSettingsTryAgain => 'Δοκιμάστε ξανά';

  @override
  String get giftSettingsGiftUrl => 'URL δώρου';

  @override
  String get giftSettingsCopy => 'Αντιγραφή';

  @override
  String get giftSettingsCopied => 'Αντιγράφηκε';

  @override
  String get giftSettingsGiftUrlCopied =>
      'Αντιγράφηκε το URL του δώρου στο πρόχειρο!';

  @override
  String get giftSettingsGiftUrlCopyFailed =>
      'Δεν ήταν δυνατή η αντιγραφή της διεύθυνσης URL του δώρου';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Αγοράστηκε $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Εξαργυρώθηκε $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Εξαργυρώθηκε από τον/την $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'Αυτό το δώρο έχει εξαργυρωθεί';

  @override
  String get giftSettingsRedeemForYourself => 'Εξαργύρωση για εσάς';

  @override
  String get giftSettingsShareWithFriend => 'Κοινή χρήση με φίλο';

  @override
  String get premiumPlutoniumTagline =>
      'Ξεκλείδωσε υψηλότερα όρια και αποκλειστικές λειτουργίες, ενώ υποστηρίζεις μια ανεξάρτητη πλατφόρμα επικοινωνίας.';

  @override
  String get premiumPurchaseMode => 'Τρόπος αγοράς';

  @override
  String get premiumForMe => 'Για μένα';

  @override
  String get premiumAsAGift => 'Ως δώρο';

  @override
  String get premiumMonthly => 'Μηνιαία';

  @override
  String get premiumYearly => 'Ετήσιο';

  @override
  String get premiumPerMonth => 'ανά μήνα';

  @override
  String get premiumPerYear => 'ανά έτος';

  @override
  String get premiumOneTimePurchase => 'εφάπαξ αγορά';

  @override
  String get premiumSave17 => 'Εξοικονομήστε 17%';

  @override
  String get premiumUpgradeNow => 'Αναβάθμιση τώρα';

  @override
  String get premiumBuyGift => 'Αγορά δώρου';

  @override
  String get premiumOneYearGift => 'Δώρο 1 έτους';

  @override
  String get premiumOneMonthGift => 'Δώρο 1 μήνα';

  @override
  String get premiumMostPopular => 'Πιο δημοφιλές';

  @override
  String get premiumScrollPrompt =>
      'Κάνε κύλιση προς τα κάτω για να δεις όλα τα προνόμια που περιλαμβάνονται με το Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'Δωρεάν έναντι Plutonium';

  @override
  String get premiumFreeColumn => 'Δωρεάν';

  @override
  String get premiumGiftSectionTitle => 'Δώσε Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'Μοιράσου την εμπειρία Plutonium με τους φίλους σου αγοράζοντας μια συνδρομή δώρου.';

  @override
  String get premiumGiftBannerOne =>
      'Έχεις έναν νέο κωδικό δώρου που σε περιμένει!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'Έχεις $count νέους κωδικούς δώρου να σε περιμένουν!';
  }

  @override
  String get premiumViewGifts => 'Προβολή δώρων';

  @override
  String get premiumReadyToUpgrade => 'Έτοιμοι για αναβάθμιση;';

  @override
  String get premiumReadyToBuyGift => 'Έτοιμος/η να αγοράσεις ένα δώρο;';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Μηνιαία $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Ετήσια $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 έτος $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 μήνας $price';
  }

  @override
  String get premiumManageSubscription => 'Διαχείριση συνδρομής';

  @override
  String get premiumRedeemGiftCode => 'Εξαργύρωση κωδικού δώρου';

  @override
  String get premiumGiftBadge => 'Δώρο';

  @override
  String get premiumCancelSubscriptionTitle => 'Ακύρωση συνδρομής;';

  @override
  String get premiumCancelSubscriptionBody =>
      'Διατηρείτε τα προνόμιά σας μέχρι την επόμενη ημερομηνία ανανέωσης και, στη συνέχεια, έχετε μια περίοδο χάριτος 3 ημερών για να εγγραφείτε ξανά και να διατηρήσετε το ιστορικό συνδρομών σας.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Ακύρωση συνδρομής';

  @override
  String get premiumKeepSubscription => 'Διατήρηση συνδρομής';

  @override
  String get premiumPurchaseHistoryTitle => 'Ιστορικό αγορών';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Τα πρόσφατα τιμολόγιά σας. Για να αλλάξετε τον τρόπο πληρωμής για τη συνδρομή σας, προσθέστε ή επιλέξτε έναν στην πύλη χρεώσεων και ορίστε τον ως προεπιλογή.';

  @override
  String get premiumManagePaymentMethods => 'Διαχείριση τρόπων πληρωμής';

  @override
  String get premiumBillingHistory => 'Ιστορικό χρεώσεων';

  @override
  String get premiumSelfServeRefundTitle => 'Αυτόματη επιστροφή χρημάτων';

  @override
  String get premiumSelfServeRefundButton =>
      'Επιστροφή χρημάτων τελευταίας αγοράς';

  @override
  String get premiumDisclaimerAgreementPrefix =>
      'Με την αγορά, συμφωνείτε με τους ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'Με την αγορά, συμφωνήσατε με τους ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' και ';

  @override
  String premiumActiveUntil(String date) {
    return 'Ενεργό έως $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Ακύρωση';

  @override
  String premiumCancelsOn(String date) {
    return 'Ακυρώνεται στις $date. Τα προνόμια παραμένουν ενεργά μέχρι τότε.';
  }

  @override
  String get premiumReactivateSubscription => 'Ενεργοποίηση ξανά';

  @override
  String premiumGiftedUntil(String date) {
    return 'Δωρεάν μέχρι $date. Δεν ανανεώνεται αυτόματα.';
  }

  @override
  String get premiumComparisonFeatureColumn => 'Λειτουργία';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'Με την αγορά, συμφωνείτε με τους $terms και την $privacy μας.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Αυτοματοποιημένες επιστροφές χρημάτων είναι διαθέσιμες εντός 3 ημερών από την πληρωμή, μία φορά κάθε 30 ημέρες. Η επιστροφή χρημάτων μιας συνδρομής την ακυρώνει. Οι αγοραστές από ΕΕ/ΕΟΧ παραιτούνται από το δικαίωμα υπαναχώρησης 14 ημερών κατά την ολοκλήρωση της αγοράς για άμεση πρόσβαση στο περιεχόμενο. Χρησιμοποιήστε το κουμπί επιστροφής χρημάτων εντός της εφαρμογής αντί για αντιστροφή χρέωσης. Οι αντιστροφές χρεώσεων μπορούν να περιορίσουν μόνιμα τον λογαριασμό σας. Η Stripe χειρίζεται την πληρωμή με ασφάλεια. Δεν βλέπουμε ποτέ τον πλήρη αριθμό της κάρτας σας.';

  @override
  String get premiumTermsOfService => 'Όροι χρήσης';

  @override
  String get premiumPrivacyPolicy => 'Πολιτική απορρήτου';

  @override
  String get premiumCheckoutStartFailedTitle =>
      'Δεν ήταν δυνατή η έναρξη της ολοκλήρωσης αγοράς';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Κάτι πήγε στραβά κατά την έναρξη της ολοκλήρωσης αγοράς. Δοκιμάστε ξανά σε λίγο.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'Έχεις συνδρομή δώρου. Δεν θα ανανεωθεί αυτόματα. Μπορείς να εξαργυρώσεις κι άλλους κωδικούς δώρου για να την επεκτείνεις. Οι συνδρομές με αυτόματη ανανέωση μπορούν να ξεκινήσουν αφού λήξει η συνδρομή δώρου.';

  @override
  String get premiumPlanUnavailable =>
      'Αυτό το πρόγραμμα δεν είναι διαθέσιμο. Επικοινωνήστε με την υποστήριξη.';

  @override
  String get premiumCompletePaymentTitle => 'Ολοκλήρωση πληρωμής';

  @override
  String get premiumCompletePaymentBody =>
      'Μεταβαίνετε τώρα στο Stripe για να ολοκληρώσετε την πληρωμή. Επιστρέψτε στο Fluxer μόλις την ολοκληρώσετε.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Επιλέξτε τρόπο πληρωμής';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Πληρώστε με Pix αυτόματο για να εξουσιοδοτήσετε επαναλαμβανόμενες χρεώσεις απευθείας από την τράπεζά σας στη Βραζιλία. Εναλλακτικά, επιλέξτε χρήση κάρτας για να εισαγάγετε μια πιστωτική κάρτα στην επόμενη οθόνη του Stripe.';

  @override
  String get premiumUsePix => 'Χρησιμοποιήστε Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Πληρώστε με UPI για να δημιουργήσετε μια ειδοποίηση συμμόρφωσης με την RBI από την ινδική τράπεζά σας. Εναλλακτικά, επιλέξτε χρήση κάρτας για να εισαγάγετε μια πιστωτική κάρτα στην επόμενη οθόνη του Stripe.';

  @override
  String get premiumUseUpi => 'Χρήση UPI';

  @override
  String get premiumUseCard => 'Χρήση κάρτας';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Δεν ήταν δυνατή η φόρτωση της πύλης χρέωσης';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Κάτι πήγε στραβά κατά το άνοιγμα της πύλης χρέωσης. Δοκιμάστε ξανά σε λίγο.';

  @override
  String get premiumAlreadyVisionaryTitle => 'Είστε ήδη Visionary';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Το Visionary περιλαμβάνει ήδη μόνιμη πρόσβαση, οπότε δεν χρειάζεται επαναλαμβανόμενη συνδρομή. Μπορείτε να αγοράσετε δώρα για άλλους.';

  @override
  String get premiumExistingSubscriptionTitle => 'Η συνδρομή υπάρχει ήδη';

  @override
  String get premiumExistingSubscriptionBody =>
      'Βρήκαμε μια υπάρχουσα συνδρομή Fluxer Plutonium για αυτόν τον λογαριασμό. Διαχειριστείτε την στην ασφαλή πύλη χρεώσεων για να ενημερώσετε τα στοιχεία πληρωμής ή να ελέγξετε την κατάσταση ανανέωσης. Αν μόλις πληρώσατε, περιμένετε ένα λεπτό και ξανανοίξτε αυτήν τη σελίδα.';

  @override
  String get premiumPurchasesDisabledTitle => 'Οι αγορές δεν είναι διαθέσιμες';

  @override
  String get premiumPurchasesDisabledBody =>
      'Οι αγορές έχουν απενεργοποιηθεί για αυτόν τον λογαριασμό. Επικοινωνήστε με το support@fluxer.app αν αυτό φαίνεται λάθος.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Διεκδίκησε τον λογαριασμό σου για να αγοράσεις Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Πρέπει να επαληθεύσεις το email σου πριν αγοράσεις το Fluxer Plutonium.';

  @override
  String get premiumPerkCustomUsernameTag => 'Προσαρμοσμένο όνομα χρήστη';

  @override
  String get premiumPerkPerCommunityProfiles => 'Προφίλ ανά κοινότητα';

  @override
  String get premiumPerkMessageScheduling => 'Προγραμματισμός μηνυμάτων';

  @override
  String get premiumPerkProfileBadge => 'Σήμα προφίλ';

  @override
  String get premiumPerkCustomVideoBackgrounds => 'Προσαρμοσμένα φόντα βίντεο';

  @override
  String get premiumPerkEntranceSounds => 'Ήχοι εισόδου';

  @override
  String get premiumPerkCommunities => 'Κοινότητες';

  @override
  String get premiumPerkMessageCharacterLimit => 'Όριο χαρακτήρων μηνύματος';

  @override
  String get premiumPerkBookmarkedMessages => 'Σελιδοδεικτοποιημένα μηνύματα';

  @override
  String get premiumPerkFileUploadSize => 'Μέγεθος αρχείου προς αποστολή';

  @override
  String get premiumPerkEmojiStickerPacks => 'Πακέτα emoji & αυτοκόλλητων';

  @override
  String get premiumPerkSavedMedia => 'Αποθηκευμένα πολυμέσα';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Χρήση κινούμενων emoji';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Παγκόσμια πρόσβαση σε emoji και αυτοκόλλητα';

  @override
  String get premiumPerkVideoQuality => 'Ποιότητα βίντεο';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Κινούμενα avatar και banner προφίλ';

  @override
  String get premiumPerkEarlyAccess => 'Πρόσβαση σε νέες λειτουργίες νωρίτερα';

  @override
  String get premiumPerkCustomThemes => 'Προσαρμοσμένα θέματα';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Έως 4K/60fps';

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
  String get userSettingsNavShortcuts => 'Συντομεύσεις';

  @override
  String get audioAndVideoAudioSectionTitle => 'Ήχος';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'Ρύθμισε το μικρόφωνο, τα ηχεία και την επεξεργασία φωνής σου.';

  @override
  String get audioAndVideoVideoSectionTitle => 'Βίντεο';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'Ρυθμίστε την ποιότητα της κάμερας και της κοινής χρήσης οθόνης σας.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle =>
      'Συμπεριφορά κατά τη διάρκεια κλήσης';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Έλεγχος των προτροπών επιβεβαίωσης κατά τη διάρκεια φωνητικών και βιντεοκλήσεων.';

  @override
  String get audioAndVideoInputDeviceLabel => 'Συσκευή εισόδου';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Συσκευή εξόδου';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'Προεπιλογή';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Χρήση ηχείου';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'Όταν είναι απενεργοποιημένο, ο ήχος αναπαράγεται από το ακουστικό ή τα συνδεδεμένα ακουστικά.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Ένταση εισόδου';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Ένταση εξόδου';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Επεξεργασία φωνής';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Εστιασμένη φωνή';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Προτείνεται. Καθαρίζει το μικρόφωνό σας για καθαρή ομιλία.';

  @override
  String get audioAndVideoDirectInputLabel => 'Απευθείας είσοδος';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Στέλνει τον ήχο σας χωρίς επεξεργασία. Ιδανικό αν χρησιμοποιείτε εξωτερικό λογισμικό ήχου.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Προσαρμοσμένο';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Προσαρμόστε κάθε ρύθμιση μόνοι σας: καταστολή θορύβου, ακύρωση ηχούς και ενίσχυση.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Καταστολή θορύβου';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Βελτιωμένη';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Τυπική';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Κανένα';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Ακύρωση ηχούς';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Αυτόματος έλεγχος απολαβής';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Εξισορροπεί την ένταση του μικροφώνου σας. Απενεργοποιείται όταν η ενισχυμένη καταστολή είναι ενεργή.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Δοκιμή μικροφώνου';

  @override
  String get audioAndVideoMicTestStartLabel => 'Έναρξη ελέγχου μικροφώνου';

  @override
  String get audioAndVideoMicTestStopLabel => 'Διακοπή ελέγχου μικροφώνου';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return 'Το $productName χρειάζεται πρόσβαση στο μικρόφωνο για να ελέγξει την είσοδό σας.';
  }

  @override
  String get audioAndVideoCameraLabel => 'Κάμερα';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Αντικατοπτρισμός κάμερας';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'Ποιότητα κάμερας';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'Ποιότητα κοινής χρήσης οθόνης';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Ρυθμός καρέ';

  @override
  String get audioAndVideoFrameRate15Label => '15 καρέ/δευτ.';

  @override
  String get audioAndVideoFrameRate30Label => '30 καρέ/δευτ';

  @override
  String get audioAndVideoFrameRate60Label => '60 καρέ/δευτ';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return 'Το 1080p και τα 60 FPS απαιτούν $premiumProductName.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Αυτή η παρουσία αυτήν τη στιγμή επιτρέπει κοινή χρήση οθόνης έως 720p στα 30 FPS.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return 'Το $productName χρειάζεται πρόσβαση στο μικρόφωνο για να εμφανίσει τις συσκευές σας.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return 'Το $productName χρειάζεται πρόσβαση στην κάμερα για να εμφανίσει τις συσκευές σας.';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'Μην ρωτάς όταν κρύβω την κάμερά μου';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'Μην ρωτάς όταν κρύβω την κοινή χρήση οθόνης μου';

  @override
  String get userSettingsNavNotifications => 'Ειδοποιήσεις';

  @override
  String get notificationsGeneralSectionTitle => 'Γενικά';

  @override
  String get notificationsEnableNotificationsLabel =>
      'Ενεργοποίηση ειδοποιήσεων';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Λάβετε ειδοποιήσεις όταν λαμβάνετε μηνύματα. Ίσως χρειαστεί να επιτρέψετε τις ειδοποιήσεις για το $productName στις ρυθμίσεις της συσκευής σας. Για έλεγχο ανά κανάλι/ανά κοινότητα, ανοίξτε τις ρυθμίσεις ειδοποιήσεων από το μενού μιας κοινότητας.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Ενεργοποίηση ειδοποιήσεων στην επιφάνεια εργασίας';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Χρησιμοποιεί το κέντρο γνωστοποιήσεων του λειτουργικού συστήματος. Για έλεγχο ανά κανάλι/κοινότητα, κάντε δεξί κλικ στο εικονίδιο μιας κοινότητας και ανοίξτε τις ρυθμίσεις γνωστοποιήσεων.';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'Ενεργοποίηση ειδοποιήσεων προγράμματος περιήγησης';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'Λάβετε ειδοποιήσεις όταν λαμβάνετε μηνύματα. Ίσως χρειαστεί να επιτρέψετε τις ειδοποιήσεις στις ρυθμίσεις του προγράμματος περιήγησής σας. Για έλεγχο ανά κανάλι/κοινότητα, κάντε δεξί κλικ σε ένα εικονίδιο κοινότητας και ανοίξτε τις ρυθμίσεις ειδοποιήσεων.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Χρονικό όριο αδράνειας ειδοποιήσεων push';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return 'Το $productName αποφεύγει την αποστολή ειδοποιήσεων μέσω push στις κινητές σας συσκευές όταν βρίσκεστε στον υπολογιστή σας. Επιλέξτε για πόσο καιρό πρέπει να είστε ανενεργός στην επιφάνεια εργασίας πριν λάβετε ειδοποιήσεις μέσω push.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute λεπτό';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes λεπτά';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle => 'Προτίμηση αναφορών';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Προτίμηση αναφοράς σε απάντηση';

  @override
  String get notificationsMentionNoPreferenceName => 'Καμία προτίμηση';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Σεβαστείτε την πρόθεση του αποστολέα, χωρίς προειδοποίηση όταν ενεργοποιεί την αναφορά @';

  @override
  String get notificationsMentionPreferMentionName => 'Προτίμηση αναφοράς με @';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Απαντάει αυτόματα σε αναφορές με @ σε εσάς και προειδοποιεί τον αποστολέα αν το απενεργοποιήσει';

  @override
  String get notificationsMentionPreferNoMentionName =>
      'Προτίμηση χωρίς αναφορές (@mention)';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Οι προεπιλεγμένες απαντήσεις παραλείπουν την αναφορά @, και προειδοποιούν τον αποστολέα αν την ενεργοποιήσει';

  @override
  String get notificationsTtsSectionTitle => 'Ειδοποιήσεις κειμένου σε ομιλία';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'Ενεργοποίηση αναπαραγωγής ομιλίας /tts';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'Αφήστε το /tts να διαβάσει το μήνυμά σας δυνατά. Η απενεργοποίηση της ρύθμισης διατηρεί αυτές τις εντολές ως κανονικό κείμενο.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Προσαρμόστε την ταχύτητα αναπαραγωγής στις ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Προσβασιμότητα';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle =>
      'Αυτόματη ανάγνωση μηνυμάτων';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Μετατρέπει το εισερχόμενο περιεχόμενο σε ομιλία, ανεξάρτητα από το αν προήλθε από το /tts.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Όλα τα κανάλια';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Να διαβάζεται κάθε εισερχόμενο μήνυμα, ανεξάρτητα από το ποιο κανάλι είναι ανοιχτό.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Μόνο το ενεργό κανάλι';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Αφηγείται μόνο το κανάλι που βλέπετε. Η αφήγηση σας ακολουθεί μεταξύ των καναλιών.';

  @override
  String get notificationsTtsModeNeverName => 'Ποτέ αυτόματα';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Να παραμένει σιωπηλό, εκτός αν κάποιος εκτελέσει το /tts χειροκίνητα.';

  @override
  String get notificationsTtsModeAriaLabel =>
      'Να διαβάζονται όλα τα μηνύματα δυνατά';

  @override
  String get notificationsSoundsSectionTitle => 'Ήχοι';

  @override
  String get notificationsMasterVolumeLabel => 'Κύρια ένταση';

  @override
  String get notificationsMasterVolumeDescription =>
      'Ορίζει την ένταση για όλα τα ηχητικά εφέ. Οι μεμονωμένες ρυθμίσεις ήχου αγνοούν αυτήν την επιλογή.';

  @override
  String get notificationsResetToDefaultVolume =>
      'Επαναφορά στην προεπιλεγμένη ένταση';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Απενεργοποίηση όλων των ήχων ειδοποιήσεων';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Οι υπάρχουσες ρυθμίσεις ήχου ειδοποιήσεων θα διατηρηθούν.';

  @override
  String get notificationsShowMoreSoundEffects =>
      'Εμφάνιση περισσότερων ηχητικών εφέ';

  @override
  String get notificationsShowFewerSoundEffects =>
      'Εμφάνιση λιγότερων ηχητικών εφέ';

  @override
  String get notificationsPreviewSound => 'Προεπισκόπηση ήχου';

  @override
  String get notificationsPerSoundVolumeTitle => 'Ένταση ήχου ανά ήχο';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Ορίστε προσαρμοσμένες εντάσεις για μεμονωμένους ήχους. Οι ήχοι χωρίς παράκαμψη ακολουθούν την κύρια ένταση.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Ενεργές προσαρμοσμένες ρυθμίσεις έντασης ήχου: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Ακολουθεί κύρια ρύθμιση • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'Επαναφορά $label στην κύρια ένταση';
  }

  @override
  String get notificationsResetAllOverrides => 'Επαναφορά όλων των εξαιρέσεων';

  @override
  String notificationsMuteSound(String label) {
    return 'Σίγαση $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'Άρση σίγασης $label';
  }

  @override
  String get notificationsSoundMessage => 'Ειδοποιήσεις μηνυμάτων κοινότητας';

  @override
  String get notificationsSoundDirectMessage =>
      'Ειδοποιήσεις απευθείας μηνυμάτων';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Ειδοποιήσεις μηνυμάτων τρέχοντος καναλιού';

  @override
  String get notificationsSoundMute => 'Σίγαση φωνής';

  @override
  String get notificationsSoundUnmute => 'Κατάργηση σίγασης φωνής';

  @override
  String get notificationsSoundDeaf => 'Απενεργοποίηση ήχου φωνής';

  @override
  String get notificationsSoundUndeaf => 'Απενεργοποίηση σίγασης φωνής';

  @override
  String get notificationsSoundUserJoin => 'Ο χρήστης μπήκε στο κανάλι';

  @override
  String get notificationsSoundUserLeave => 'Ο χρήστης αποχωρεί από το κανάλι';

  @override
  String get notificationsSoundUserMove => 'Ο χρήστης μετακίνησε το κανάλι';

  @override
  String get notificationsSoundViewerJoin => 'Ο θεατής μπαίνει στη ροή';

  @override
  String get notificationsSoundViewerLeave => 'Ο θεατής αποχωρεί από τη ροή';

  @override
  String get notificationsSoundVoiceDisconnect =>
      'Η φωνητική κλήση αποσυνδέθηκε';

  @override
  String get notificationsSoundIncomingRing => 'Εισερχόμενη κλήση';

  @override
  String get notificationsSoundCameraOn => 'Κάμερα ανοιχτή';

  @override
  String get notificationsSoundCameraOff => 'Κάμερα απενεργοποιημένη';

  @override
  String get notificationsSoundScreenShareStart =>
      'Έναρξη κοινής χρήσης οθόνης';

  @override
  String get notificationsSoundScreenShareStop =>
      'Διακοπή κοινής χρήσης οθόνης';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'Δεν ήταν δυνατή η ενημέρωση του χρονικού ορίου ειδοποιήσεων push. Δοκιμάστε ξανά.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Δεν ήταν δυνατή η ενημέρωση της προτίμησης αναφοράς. Δοκιμάστε ξανά.';

  @override
  String get notificationsPermissionDeniedTitle =>
      'Οι ειδοποιήσεις έχουν αποκλειστεί';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'Δεν ήταν δυνατή η ενεργοποίηση των ειδοποιήσεων. Επιτρέψτε την άδεια ειδοποιήσεων για να συνεχίσετε.';

  @override
  String get userSettingsNavLanguageAndTime => 'Γλώσσα & Ώρα';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Γλώσσα διεπαφής';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Επιλέξτε τη γλώσσα που θα χρησιμοποιείται σε όλη την εφαρμογή';

  @override
  String get languageAndTimeOpenLanguageSettings => 'Άνοιγμα ρυθμίσεων γλώσσας';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Μορφή ώρας';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Επιλέξτε πώς θα εμφανίζονται οι ώρες στην εφαρμογή';

  @override
  String get languageAndTimeTimeFormatSelectionLabel => 'Επιλογή μορφής ώρας';

  @override
  String get languageAndTimeTimeFormatAuto => 'Αυτόματα';

  @override
  String get languageAndTimeTimeFormat12Hour => '12ωρο';

  @override
  String get languageAndTimeTimeFormat24Hour => '24ωρο';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'Γλώσσα εφαρμογής: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Γλώσσα συστήματος: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Χρήση τοπικών ρυθμίσεων συστήματος για τη μορφή ώρας';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'Αποτυχία ενημέρωσης μορφής ώρας';

  @override
  String get userSettingsNavDefaultApps => 'Προεπιλεγμένες εφαρμογές';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Πρόγραμμα περιήγησης Ιστού';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Επιλέξτε ποιο πρόγραμμα περιήγησης θα ανοίγει όταν πατάτε έναν σύνδεσμο.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'Αν μια εφαρμογή είναι εγκατεστημένη για έναν ιστότοπο, οι σύνδεσμοι θα ανοίγουν πρώτα σε αυτήν την εφαρμογή.';

  @override
  String get defaultAppsWebBrowserInApp =>
      'Πρόγραμμα περιήγησης εντός εφαρμογής';

  @override
  String get defaultAppsWebBrowserExternal => 'Εξωτερικό πρόγραμμα περιήγησης';

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
  String get advancedSettingsConfigure => 'Ρυθμίσεις';

  @override
  String get advancedSettingsCategoryPrivacy => 'Απόρρητο';

  @override
  String get advancedSettingsCategoryAppearance => 'Εμφάνιση';

  @override
  String get advancedSettingsCategoryAccessibility => 'Προσβασιμότητα';

  @override
  String get advancedSettingsCategoryChat => 'Συνομιλία';

  @override
  String get advancedSettingsCategoryMedia => 'Μέσα';

  @override
  String get advancedSettingsCategoryVoice => 'Φωνή';

  @override
  String get advancedSettingsCategoryDeveloper => 'Προγραμματιστής';

  @override
  String get advancedSettingEnableTextSelectionLabel =>
      'Ενεργοποίηση επιλογής κειμένου';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Επιτρέπει την επιλογή κειμένου στην εφαρμογή';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Ενεργοποίηση μικρογραφιών αναζήτησης βίντεο';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Μικρογραφία ή ζωντανή εικόνα κατά την προεπισκόπηση βίντεο';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Απτική ανάδραση';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Δόνηση για αγγίγματα και ενέργειες. Δεν συγχρονίζεται μεταξύ συσκευών.';

  @override
  String get advancedSettingShowNekoLabel => 'Εμφάνιση Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'Γάτα Neko που κυνηγά τον κέρσορά σου';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Εμφάνιση Neko στην εισαγωγή συνομιλίας σας';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Κίνηση ζουμ κατά την εκκίνηση';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Σμίκρυνση του λογότυπου κατά την έξοδο από την οθόνη εκκίνησης';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Υποδείξεις πληκτρολογίου';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Υπενθυμίσεις συντομεύσεων πληκτρολογίου στις συμβουλές εργαλείων';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Ενεργοποίηση αγαπημένων';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Εμφάνιση των αγαπημένων σε όλη την εφαρμογή';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Συμπεριφορά εισόδου σε κανάλι φωνής';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Επιβεβαίωση ή διπλό κλικ για συμμετοχή σε φωνητικά κανάλια της κοινότητας';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Απαίτηση διπλού κλικ για είσοδο σε κανάλια φωνής';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Επιβεβαίωση πριν την είσοδο σε κανάλια φωνής';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Αυτόματη αποστολή GIF όταν επιλεγεί';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Αυτόματη αποστολή GIF από την επιλογή χωρίς επιβεβαίωση';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Αποθήκευση αγαπημένων GIF ως αποθηκευμένα πολυμέσα';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Επιλέξτε πώς αποθηκεύονται τα αγαπημένα GIF με αστέρι';

  @override
  String get advancedSettingMediaButtonsLabel => 'Κουμπιά πολυμέσων';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Προσαρμόστε ποια κουμπιά και ενδείξεις θα εμφανίζονται στις επισυναπτόμενες φωτογραφίες και στα ενσωματωμένα περιεχόμενα';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Ανεβάστε συνημμένα πριν στείλετε';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Ξεκινήστε την αποστολή των συνημμένων μόλις αυτά προστεθούν στο πλαίσιο εισαγωγής μηνυμάτων';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Αφαίρεση παραμέτρων παρακολούθησης από URL';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Αυτόματη κατάργηση παραμέτρων παρακολούθησης από URL σε μηνύματα που στέλνετε';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'Να εμπιστεύεστε όλους τους εξωτερικούς συνδέσμους';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'Παράλειψη προειδοποίησης εξωτερικού συνδέσμου για όλους τους τομείς';

  @override
  String get advancedSettingSearchEnginesLabel => 'Μηχανές αναζήτησης';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Διαμόρφωση των μηχανών αναζήτησης που χρησιμοποιούνται για κείμενο που έχει επιλεγεί';

  @override
  String get advancedSettingTranslatorsLabel => 'Μεταφραστές';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Διαμόρφωση των παρόχων μεταφραστών που χρησιμοποιούνται για το επιλεγμένο κείμενο';

  @override
  String get advancedSettingReverseImageSearchLabel => 'Αναζήτηση εικόνας';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Πάροχοι υπηρεσιών αντίστροφης αναζήτησης εικόνων';

  @override
  String get advancedSettingMessageActionBarLabel =>
      'Γραμμή ενεργειών μηνύματος';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Προσαρμόστε τη γραμμή ενεργειών που εμφανίζεται όταν τοποθετείτε τον δείκτη του ποντικιού πάνω από μηνύματα';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Αυτόματη συμπλήρωση εκφράσεων';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Επιλέξτε τι εμφανίζεται όταν πληκτρολογείτε άνω τελεία στο πεδίο εισαγωγής μηνυμάτων';

  @override
  String get advancedSettingInputButtonsLabel => 'Κουμπιά εισαγωγής μηνυμάτων';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Επιλέξτε ποια κουμπιά θα εμφανίζονται στην περιοχή εισαγωγής μηνυμάτων';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Κύλιση προς τα κάτω κατά την αποστολή μηνύματος';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Επιλέξτε πώς θα μετακινούνται τα μηνύματα στη συνομιλία μετά την αποστολή τους';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Παράλειψη επιβεβαίωσης \"Επισήμανση όλων ως αναγνωσμένων\"';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Να επισημανθούν όλα τα αδιάβαστα κανάλια εισερχομένων ως αναγνωσμένα αμέσως, χωρίς επιβεβαίωση';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Απόκρυψη σιωπηλών καναλιών από προεπιλογή';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Απόκρυψη καναλιών που έχετε θέσει σε σίγαση από τις πλαϊνές μπάρες κοινοτήτων';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'Εμφάνιση ένδειξης GIF';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Εμφάνιση ένδειξης λήξης συνημμένου';

  @override
  String get advancedSettingShowMediaDeleteLabel =>
      'Εμφάνιση κουμπιού διαγραφής';

  @override
  String get advancedSettingShowMediaDownloadLabel => 'Εμφάνιση κουμπιού λήψης';

  @override
  String get advancedSettingShowMediaFavoriteLabel =>
      'Εμφάνιση κουμπιού αγαπημένων';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Εμφάνιση κουμπιού απόκρυψης ενσωματώσεων';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Εμφάνιση γραμμής ενεργειών μηνύματος';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel =>
      'Να εμφανίζεται μόνο το κουμπί \"Περισσότερα\"';

  @override
  String get advancedSettingShowQuickReactionsLabel =>
      'Εμφάνιση γρήγορων αντιδράσεων';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Ενεργοποίηση Shift για επέκταση';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Εμφάνιση προεπιλεγμένων emoji στην αυτόματη συμπλήρωση εκφράσεων';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Εμφάνιση προσαρμοσμένων emoji στην αυτόματη συμπλήρωση εκφράσεων';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Εμφάνιση αυτοκόλλητων στην αυτόματη συμπλήρωση εκφράσεων';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Εμφάνιση αποθηκευμένων πολυμέσων στην αυτόματη συμπλήρωση εκφράσεων';

  @override
  String get advancedSettingShowGifsButtonLabel => 'Εμφάνιση κουμπιού GIF';

  @override
  String get advancedSettingShowMediaButtonLabel =>
      'Εμφάνιση κουμπιού πολυμέσων';

  @override
  String get advancedSettingShowStickersButtonLabel =>
      'Εμφάνιση κουμπιού αυτοκόλλητων';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Εμφάνιση κουμπιού emoji';

  @override
  String get advancedSettingShowSendButtonLabel =>
      'Εμφάνιση κουμπιού αποστολής';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Εμφάνιση ειδοποιήσεων νέων συσκευών';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Εμφάνιση ειδοποίησης για νέες συσκευές ήχου';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Έλεγχοι έντασης σύνδεσης';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Εμφάνιση ρυθμιστικών έντασης ήχου συμμετεχόντων ανά συσκευή στα μενού φωνής';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Συμπεριφορά προεπισκόπησης κοινής χρήσης οθόνης';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Προεπισκόπηση, εμφάνιση σε ξεχωριστό παράθυρο και συμπεριφορά της μικρογραφίας ροής';

  @override
  String get advancedSettingScreenShareCodecLabel =>
      'Κωδικοποιητής κοινής χρήσης οθόνης';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Κωδικοποιητής βίντεο για κοινή χρήση οθόνης';

  @override
  String get advancedSettingScreenShareCodecAuto => 'Αυτόματο (προτείνεται)';

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
      'Παύση της προεπισκόπησης κοινής χρήσης οθόνης στο παρασκήνιο';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Απόκρυψη μικρογραφίας προεπισκόπησης ροής μου';

  @override
  String get advancedSettingDeveloperModeLabel =>
      'Ενεργοποίηση λειτουργίας προγραμματιστή';

  @override
  String get advancedSettingDeveloperModeDescription =>
      'Ενεργοποίηση λειτουργίας προγραμματιστή';

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
  String get advancedSettingTranslatorGoogle => 'Μετάφραση Google';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel =>
      'Προεπιλεγμένη μηχανή αναζήτησης';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Επιλέξτε ποια μηχανή αναζήτησης θα χρησιμοποιείται από προεπιλογή κατά την αναζήτηση επιλεγμένου κειμένου.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Ενσωματωμένες μηχανές αναζήτησης';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Ενεργοποιήστε ή απενεργοποιήστε τις ενσωματωμένες μηχανές αναζήτησης. Οι ενεργοποιημένες μηχανές εμφανίζονται στο μενού περιβάλλοντος μηνύματος όταν επιλέγεται κείμενο.';

  @override
  String get advancedSettingCustomSearchEnginesLabel =>
      'Προσαρμοσμένες μηχανές αναζήτησης';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Προσθέστε τις δικές σας μηχανές αναζήτησης με ένα προσαρμοσμένο μοτίβο URL. Χρησιμοποιήστε το \'$query\' ως σύμβολο κράτησης θέσης για το κείμενο αναζήτησης.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel =>
      'Προσθήκη μηχανής αναζήτησης';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Ενεργοποιήστε τουλάχιστον μία μηχανή αναζήτησης παρακάτω.';

  @override
  String get advancedSettingRemoveSearchEngineLabel =>
      'Κατάργηση μηχανής αναζήτησης';

  @override
  String get advancedSettingDefaultTranslatorLabel =>
      'Προεπιλεγμένος μεταφραστής';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Επιλέξτε ποιος μεταφραστής θα χρησιμοποιείται από προεπιλογή κατά τη μετάφραση επιλεγμένου κειμένου.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel =>
      'Ενσωματωμένοι μεταφραστές';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Ενεργοποιήστε ή απενεργοποιήστε τους ενσωματωμένους μεταφραστές. Οι ενεργοποιημένοι μεταφραστές εμφανίζονται στο μενού περιβάλλοντος μηνύματος όταν επιλέγεται κείμενο.';

  @override
  String get advancedSettingCustomTranslatorsLabel =>
      'Προσαρμοσμένοι μεταφραστές';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Προσθέστε τους δικούς σας μεταφραστές με ένα προσαρμοσμένο μοτίβο URL. Χρησιμοποιήστε το \'$query\' ως σύμβολο κράτησης θέσης για το κείμενο προς μετάφραση.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Προσθήκη μεταφραστή';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Ενεργοποιήστε τουλάχιστον έναν μεταφραστή παρακάτω.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Κατάργηση μεταφραστή';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Προεπιλεγμένη αντίστροφη αναζήτηση εικόνας';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Επιλέξτε ποια υπηρεσία αντίστροφης αναζήτησης εικόνων θα χρησιμοποιείται από προεπιλογή κατά την αναζήτηση μιας εικόνας.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Ενσωματωμένη αναζήτηση αντίστροφης εικόνας';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Ενεργοποιήστε ή απενεργοποιήστε τους ενσωματωμένους παρόχους αντίστροφης αναζήτησης εικόνων. Οι ενεργοποιημένοι πάροχοι εμφανίζονται στο μενού περιβάλλοντος εικόνων, avatar, banner, αυτοκόλλητων και emoji.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Προσαρμοσμένη αναζήτηση εικόνων';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Προσθέστε τους δικούς σας παρόχους αναζήτησης εικόνων με ένα προσαρμοσμένο μοτίβο URL. Χρησιμοποιήστε το \'$url\' ως σύμβολο κράτησης θέσης για τη διεύθυνση URL της εικόνας.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Προσθήκη αντίστροφης αναζήτησης εικόνων';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Ενεργοποιήστε τουλάχιστον έναν πάροχο αντίστροφης αναζήτησης εικόνων παρακάτω.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Κατάργηση αντίστροφης αναζήτησης εικόνας';

  @override
  String get advancedSettingAddSearchEngineTitle =>
      'Προσθήκη μηχανής αναζήτησης';

  @override
  String get advancedSettingEditSearchEngineTitle =>
      'Επεξεργασία μηχανής αναζήτησης';

  @override
  String get advancedSettingAddTranslatorTitle => 'Προσθήκη παρόχου μετάφρασης';

  @override
  String get advancedSettingEditTranslatorTitle =>
      'Επεξεργασία παρόχου μετάφρασης';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Προσθήκη μηχανής αναζήτησης αντίστροφης εικόνας';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Επεξεργασία μηχανής αναζήτησης αντίστροφης εικόνας';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Όνομα';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'Μοτίβο URL';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'Η μηχανή αναζήτησής μου';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Ο μεταφραστής μου';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'Η αντίστροφη αναζήτηση εικόνων μου';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Χρησιμοποιήστε το \'$query\' όπου πρέπει να εισαχθεί το κείμενο αναζήτησης.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Χρησιμοποιήστε το \'$query\' όπου πρέπει να εισαχθεί το κείμενο προς μετάφραση.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Χρησιμοποιήστε το \'$url\' όπου πρέπει να εισαχθεί η διεύθυνση URL της εικόνας.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired => 'Απαιτείται όνομα.';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'Απαιτείται μοτίβο URL.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'Το μοτίβο URL πρέπει να περιέχει το placeholder \'$query\'.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'Το μοτίβο URL πρέπει να περιέχει το placeholder \'$url\'.';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'Το μοτίβο URL πρέπει να είναι ένα έγκυρο URL.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Προσθήκη';

  @override
  String get advancedSettingEditSearchProviderAction => 'Επεξεργασία';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Αφαίρεση';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'Είστε σίγουροι ότι θέλετε να αφαιρέσετε το $engineName;';
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
  String get userSettingsJoinFluxerLabs => 'Εγγραφή στο Fluxer Labs';

  @override
  String get userSettingsNavAppLicenses => 'Άδειες εφαρμογής';

  @override
  String get userSettingsAppLicensesDescription =>
      'Λογισμικό ανοιχτού κώδικα που χρησιμοποιείται από αυτήν την εφαρμογή. Αυτή η εφαρμογή είναι χτισμένη με Flutter.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'Δεν ήταν δυνατή η φόρτωση των αδειών χρήσης της εφαρμογής.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count άδειες',
      one: '1 άδεια',
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
  String get savedMessagesEmptyTitle => 'Χωρίς σελιδοδείκτες';

  @override
  String get savedMessagesEmptyBody =>
      'Προσθέστε σελιδοδείκτες σε μηνύματα για να τα αποθηκεύσετε για αργότερα.';

  @override
  String get savedMessagesEndBody => 'Δεν υπάρχει κάτι άλλο εδώ.';

  @override
  String get savedMessagesRemoveTooltip => 'Κατάργηση σελιδοδείκτη';

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
  String get uiSearch => 'Αναζήτηση';

  @override
  String get uiStartCall => 'Έναρξη κλήσης';

  @override
  String get uiStartVideoCall => 'Έναρξη βιντεοκλήσης';

  @override
  String get uiPlay => 'Αναπαραγωγή';

  @override
  String get uiPause => 'Παύση';

  @override
  String get uiDownload => 'Λήψη';

  @override
  String get uiMoreActions => 'Περισσότερες ενέργειες';

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
    return 'Αυτό θα ειδοποιήσει $count μέλη με τον ρόλο $roleName. Συνέχεια;';
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
  String get guildNavbarGuildSelected => 'επιλεγμένο';

  @override
  String get guildNavbarGuildUnread => 'μη αναγνωσμένο';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count αναφορές',
      one: '1 αναφορά',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'σε σίγαση';

  @override
  String get authShowPassword => 'Εμφάνιση κωδικού';

  @override
  String get authHidePassword => 'Απόκρυψη κωδικού';

  @override
  String get chatLoadingMessages => 'Φόρτωση μηνυμάτων';

  @override
  String get friendsMessageFriend => 'Μήνυμα';

  @override
  String get friendsFriendActions => 'Ενέργειες φίλου';

  @override
  String get friendsAcceptRequest => 'Αποδοχή αιτήματος φιλίας';

  @override
  String get friendsDeclineRequest => 'Απόρριψη αιτήματος φιλίας';

  @override
  String get friendsCancelRequest => 'Ακύρωση αιτήματος φιλίας';

  @override
  String get friendsOpenInbox => 'Εισερχόμενα';

  @override
  String get profileRemoveFriend => 'Κατάργηση φίλου';

  @override
  String get profileUnblockUser => 'Ξεμπλοκάρισμα χρήστη';

  @override
  String get profileAcceptFriendRequest => 'Αποδοχή αιτήματος φιλίας';

  @override
  String get profileCancelFriendRequest => 'Ακύρωση αιτήματος φιλίας';

  @override
  String get profileSendFriendRequest => 'Προσθήκη φίλου';

  @override
  String get accountOverflowMenu => 'Επιλογές λογαριασμού';

  @override
  String get navHome => 'Αρχική';

  @override
  String get navNotifications => 'Ειδοποιήσεις';

  @override
  String get navYou => 'Εσείς';

  @override
  String get guildFolderSettingsTitle => 'Ρυθμίσεις φακέλου';

  @override
  String get guildFolderNameLabel => 'Όνομα φακέλου';

  @override
  String get guildFolderColorLabel => 'Χρώμα φακέλου';

  @override
  String get guildFolderShowIconWhenCollapsed =>
      'Εμφάνιση εικονιδίου όταν είναι συμπτυγμένο';

  @override
  String get guildFolderIconLabel => 'Εικονίδιο φακέλου';

  @override
  String get guildFolderDelete => 'Διαγραφή φακέλου';

  @override
  String get guildFolderIconFolder => 'Φάκελος';

  @override
  String get guildFolderIconStar => 'Με αστέρι';

  @override
  String get guildFolderIconHeart => 'Καρδιά';

  @override
  String get guildFolderIconBookmark => 'Σελιδοδείκτης';

  @override
  String get guildFolderIconGameController => 'Χειριστήριο παιχνιδιών';

  @override
  String get guildFolderIconShield => 'Ασπίδα';

  @override
  String get guildFolderIconMusicNote => 'Νότα μουσικής';

  @override
  String get guildFolderMarkAsRead => 'Σήμανση φακέλου ως αναγνωσμένου';

  @override
  String get guildBulkMuteCommunities => 'Σίγαση κοινοτήτων';

  @override
  String get guildBulkUnmuteCommunities => 'Κατάργηση σίγασης κοινοτήτων';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Ρυθμίσεις ειδοποιήσεων κοινότητας';

  @override
  String get guildBulkCommunityPrivacySettings =>
      'Ρυθμίσεις απορρήτου κοινότητας';

  @override
  String get guildBulkAllowEveryoneAndHere =>
      'Να επιτρέπονται οι αναφορές @everyone και @here';

  @override
  String get guildBulkAllowRoleMentions => 'Να επιτρέπονται οι αναφορές ρόλων';

  @override
  String get guildBulkEnableMobilePush =>
      'Ενεργοποίηση ειδοποιήσεων push σε κινητό';

  @override
  String get guildBulkDisableMobilePush =>
      'Απενεργοποίηση ειδοποιήσεων push σε κινητό';

  @override
  String get guildBulkAllowDirectMessages =>
      'Να επιτρέπονται τα απευθείας μηνύματα';

  @override
  String get guildBulkBlockDirectMessages => 'Αποκλεισμός απευθείας μηνυμάτων';

  @override
  String get guildBulkAllowBotDirectMessages =>
      'Να επιτρέπονται απευθείας μηνύματα από bot';

  @override
  String get guildBulkBlockBotDirectMessages =>
      'Αποκλεισμός απευθείας μηνυμάτων από bot';

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
  String get guildNavbarChannelTypeSelection => 'Επιλογή τύπου καναλιού';

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
  String get guildMenuSettingsEmoji => 'Emoji';

  @override
  String get guildMenuSettingsStickers => 'Αυτοκόλλητα';

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
  String get guildMenuSettingsInviteLinks => 'Προσκλήσεις';

  @override
  String get guildMenuSettingsBans => 'Απαγορεύσεις';

  @override
  String get guildMenuSettingsChannels => 'Κανάλια';

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
  String get guildSettingsRolesNewRole => 'Νέος ρόλος';

  @override
  String get guildSettingsRolesDeleteRole => 'Διαγραφή ρόλου';

  @override
  String get guildSettingsRolesBackToRoles => 'Πίσω στους ρόλους';

  @override
  String get guildSettingsBackToSettings => 'Επιστροφή στις ρυθμίσεις';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Επεξεργασία του \"$name\"';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Διαμόρφωση ρυθμίσεων και δικαιωμάτων ρόλου';

  @override
  String get guildSettingsRolesDisplaySection => 'Εμφάνιση';

  @override
  String get guildSettingsRolesRoleName => 'Όνομα ρόλου';

  @override
  String get guildSettingsRolesRoleColor => 'Χρώμα ρόλου';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Πληκτρολογήστε ένα χρώμα (δεκαεξαδικό, rgb(), hsl() ή όνομα) ή χρησιμοποιήστε την επιλογή.';

  @override
  String get guildSettingsRolesShowSeparately =>
      'Εμφάνιση αυτού του ρόλου ξεχωριστά';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Εμφανίζει τα μέλη με αυτόν τον ρόλο σε δική τους ενότητα στη λίστα μελών.';

  @override
  String get guildSettingsRolesAllowMentions =>
      'Να επιτρέπονται οι αναφορές για αυτόν τον ρόλο';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'Τα μέλη με την άδεια \"$permission\" μπορούν πάντα να κάνουν αναφορά σε ρόλους, ανεξάρτητα από αυτήν τη ρύθμιση.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Χρησιμοποιήστε αυτό το κουμπί για γρήγορη εκκαθάριση όλων των δικαιωμάτων.';

  @override
  String get guildSettingsRolesClearPermissions => 'Εκκαθάριση δικαιωμάτων';

  @override
  String get guildSettingsRolesPermissionsSection => 'Δικαιώματα';

  @override
  String get guildSettingsRolesSearchPermissions => 'Αναζήτηση δικαιωμάτων';

  @override
  String get guildSettingsRolesDenseLayout => 'Συμπαγής διάταξη';

  @override
  String get guildSettingsRolesComfyLayout => 'Βολική διάταξη';

  @override
  String get guildSettingsRolesSwitchToDenseLayout => 'Συμπυκνωμένη διάταξη';

  @override
  String get guildSettingsRolesSwitchToComfyLayout =>
      'Εναλλαγή σε άνετη διάταξη';

  @override
  String get guildSettingsRolesSingleColumn => 'Μία στήλη';

  @override
  String get guildSettingsRolesTwoColumns => 'Δύο στήλες';

  @override
  String get guildSettingsRolesSwitchToSingleColumn => 'Εναλλαγή σε μονή στήλη';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => 'Εναλλαγή σε δύο στήλες';

  @override
  String get guildSettingsRolesNoPermissionsFound => 'Δεν βρέθηκαν δικαιώματα';

  @override
  String get guildSettingsRolesCustomHoistOrder =>
      'Προσαρμοσμένη σειρά εμφάνισης';

  @override
  String get guildSettingsRolesHoistOrder => 'Σειρά εμφάνισης';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Επαναφορά στις προεπιλογές';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Σύρετε τους ρόλους για να προσαρμόσετε τη σειρά εμφάνισής τους στη λίστα μελών.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Δεν υπάρχουν εμφανείς ρόλοι. Ενεργοποίησε την επιλογή \"Εμφάνιση αυτού του ρόλου ξεχωριστά\" σε έναν ρόλο για να τον δεις εδώ.';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'Δεν μπορείτε να επεξεργαστείτε αυτόν τον ρόλο επειδή είναι ο υψηλότερος ρόλος σας ή είναι ανώτερος από εσάς';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Χρειάζεσαι την άδεια \"$permission\" για να επεξεργαστείς αυτές τις άδειες';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'Δεν μπορείς να επεξεργαστείς έναν ρόλο που είναι ίδιος ή ανώτερος από τον δικό σου';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'Δεν μπορείς να δώσεις μια άδεια που δεν έχεις';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'Δεν μπορείς να αφαιρέσεις αυτήν την άδεια, γιατί θα την αφαιρούσες και από τον εαυτό σου';

  @override
  String get guildSettingsRolesUpdatedSuccess =>
      'Οι ρόλοι ενημερώθηκαν επιτυχώς';

  @override
  String get guildSettingsRolesCreatedSuccess => 'Ο ρόλος δημιουργήθηκε';

  @override
  String get guildSettingsRolesDeletedSuccess =>
      'Ο ρόλος διαγράφηκε με επιτυχία';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'Η σειρά εμφάνισης επαναφέρθηκε στην προεπιλογή';

  @override
  String get guildSettingsRolesNameRequiredTitle => 'Απαιτείται όνομα ρόλου';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Δώστε έναν τίτλο στον ρόλο πριν την αποθήκευση.';

  @override
  String get guildSettingsRolesCreateFailedTitle =>
      'Δεν ήταν δυνατή η δημιουργία ρόλου';

  @override
  String get guildSettingsRolesUpdateFailedTitle =>
      'Δεν ήταν δυνατή η ενημέρωση των ρόλων';

  @override
  String get guildSettingsRolesDeleteFailedTitle =>
      'Δεν ήταν δυνατή η διαγραφή του ρόλου';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return 'Το \"$name\" δεν θα διαγραφόταν. Δοκιμάστε ξανά.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'Δεν ήταν δυνατή η επαναφορά της σειράς ανύψωσης';

  @override
  String get guildSettingsRolesTryAgainInAMoment => 'Δοκιμάστε ξανά σε λίγο.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'Είστε σίγουροι ότι θέλετε να διαγράψετε τον ρόλο $name; Οποιαδήποτε μέλη με αυτόν τον ρόλο δεν θα τον έχουν πλέον.';
  }

  @override
  String get permissionCategoryCommunityWide => 'Σε όλη την κοινότητα';

  @override
  String get permissionCategoryMessagesMedia => 'Μηνύματα και πολυμέσα';

  @override
  String get permissionCategoryModeration => 'Συντονισμός';

  @override
  String get permissionCategoryChannelAccess => 'Πρόσβαση σε κανάλι';

  @override
  String get permissionCategoryChannelManagement => 'Διαχείριση καναλιών';

  @override
  String get permissionCategoryAudioVideo => 'Ήχος και βίντεο';

  @override
  String get permissionUnknown => 'Άγνωστη άδεια';

  @override
  String get permissionAdministrator => 'Διαχειριστής';

  @override
  String get permissionAdministratorDescription =>
      'Παρέχει όλες τις άδειες και παρακάμπτει τους περιορισμούς καναλιών. Εξαιρετικά ευαίσθητο.';

  @override
  String get permissionViewActivityLog =>
      'Προβολή αρχείου καταγραφής δραστηριότητας';

  @override
  String get permissionViewActivityLogDescription =>
      'Διαβάστε το αρχείο καταγραφής δραστηριότητας της κοινότητας για αλλαγές και ενέργειες συντονισμού.';

  @override
  String get permissionManageCommunity => 'Διαχείριση κοινότητας';

  @override
  String get permissionManageCommunityDescription =>
      'Επεξεργασία γενικών ρυθμίσεων, όπως όνομα, περιγραφή και εικονίδιο.';

  @override
  String get permissionManageRoles => 'Διαχείριση ρόλων';

  @override
  String get permissionManageRolesDescription =>
      'Δημιουργία, επεξεργασία ή διαγραφή ρόλων κάτω από τον υψηλότερο ρόλο σας. Επίσης, επιτρέπει την επεξεργασία των αντικαταστάσεων δικαιωμάτων καναλιού.';

  @override
  String get permissionManageChannels => 'Διαχείριση καναλιών';

  @override
  String get permissionManageChannel => 'Διαχείριση καναλιού';

  @override
  String get permissionManageChannelDescription =>
      'Μετονομασία και επεξεργασία των ρυθμίσεων αυτού του καναλιού.';

  @override
  String get permissionManagePermissions => 'Διαχείριση δικαιωμάτων';

  @override
  String get permissionManagePermissionsDescription =>
      'Επεξεργασία εξαιρέσεων για ρόλους και μέλη σε αυτό το κανάλι.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Δημιουργία, επεξεργασία ή διαγραφή webhooks για αυτό το κανάλι.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Δείτε τη λίστα μελών για αυτό το κανάλι.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Διαχείριση συνδέσμων πρόσκλησης για αυτό το κανάλι.';

  @override
  String get permissionOverwriteDeny => 'Άρνηση';

  @override
  String get permissionOverwriteInherit => 'Ουδέτερο (κληρονομείται)';

  @override
  String get permissionOverwriteAllow => 'Να επιτρέπεται';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Χρησιμοποιήστε αυτά τα κουμπιά για να ορίσετε γρήγορα όλες τις άδειες.';

  @override
  String get permissionManageChannelsDescription =>
      'Δημιουργία, επεξεργασία ή διαγραφή καναλιών και κατηγοριών.';

  @override
  String get permissionKickMembers => 'Αποβολή μελών';

  @override
  String get permissionBanMembers => 'Αποκλεισμός μελών';

  @override
  String get permissionCreateInviteLinks => 'Δημιουργία συνδέσμων πρόσκλησης';

  @override
  String get permissionChangeOwnNickname => 'Αλλαγή δικού του ψευδώνυμου';

  @override
  String get permissionChangeOwnNicknameDescription =>
      'Ενημέρωσε το ψευδώνυμό σου.';

  @override
  String get permissionManageNicknames => 'Διαχείριση ψευδώνυμων';

  @override
  String get permissionManageNicknamesDescription =>
      'Αλλαγή ψευδώνυμων άλλων μελών.';

  @override
  String get permissionCreateEmojiStickers =>
      'Δημιουργία emoji και αυτοκόλλητων';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Ανεβάστε νέα emoji και αυτοκόλλητα, και διαχειριστείτε τις δικές σας δημιουργίες.';

  @override
  String get permissionManageEmojiStickers =>
      'Διαχείριση emoji και αυτοκόλλητων';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Επεξεργασία ή διαγραφή emoji και αυτοκόλλητων που δημιουργήθηκαν από άλλα μέλη.';

  @override
  String get permissionManageWebhooks => 'Διαχείριση webhooks';

  @override
  String get permissionManageWebhooksDescription =>
      'Δημιουργία, επεξεργασία ή διαγραφή webhooks.';

  @override
  String get permissionSendMessages => 'Αποστολή μηνυμάτων';

  @override
  String get permissionSendTtsMessages =>
      'Αποστολή μηνυμάτων κειμένου σε ομιλία';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Αποστολή μηνυμάτων κειμένου σε ομιλία.';

  @override
  String get permissionManageMessages => 'Διαχείριση μηνυμάτων';

  @override
  String get permissionManageMessagesDescription =>
      'Διαγραφή μηνυμάτων άλλων μελών. Η καρφίτσωμα ελέγχεται ξεχωριστά.';

  @override
  String get permissionPinMessages => 'Καρφίτσωμα μηνυμάτων';

  @override
  String get permissionEmbedLinks => 'Ενσωμάτωση συνδέσμων';

  @override
  String get permissionAttachFiles => 'Επισύναψη αρχείων';

  @override
  String get permissionMentionEveryone =>
      'Χρησιμοποιήστε @everyone/@here και @ρόλο';

  @override
  String get permissionMentionEveryoneDescription =>
      'Αναφορά σε όλους ή σε οποιονδήποτε ρόλο (ακόμα κι αν ο ρόλος δεν έχει οριστεί ως αναφοράς).';

  @override
  String get permissionUseExternalEmoji => 'Χρήση εξωτερικών emoji';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Χρησιμοποιήστε emoji από άλλες κοινότητες.';

  @override
  String get permissionUseExternalStickers => 'Χρήση εξωτερικών αυτοκόλλητων';

  @override
  String get permissionAddReactions => 'Προσθήκη αντιδράσεων';

  @override
  String get permissionAddReactionsDescription =>
      'Προσθήκη νέων αντιδράσεων στα μηνύματα.';

  @override
  String get permissionBypassSlowmode => 'Παράκαμψη αργής λειτουργίας';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Παράβλεψη ορίων ρυθμού μηνυμάτων ανά κανάλι.';

  @override
  String get permissionTimeOutMembers => 'Θέση σε προσωρινή αναστολή μελών';

  @override
  String get permissionTimeOutMembersDescription =>
      'Αποτροπή των μελών από την αποστολή μηνυμάτων, την αντίδραση και τη συμμετοχή σε φωνητική συνομιλία για συγκεκριμένο χρονικό διάστημα.';

  @override
  String get permissionViewChannel => 'Προβολή καναλιού';

  @override
  String get permissionViewChannelMembers => 'Προβολή μελών καναλιού';

  @override
  String get permissionViewChannelMembersDescription =>
      'Δείτε τη λίστα μελών για κανάλια σε αυτήν την κοινότητα.';

  @override
  String get permissionConnect => 'Σύνδεση';

  @override
  String get permissionSpeak => 'Ομιλία';

  @override
  String get permissionStreamVideo => 'Μετάδοση βίντεο';

  @override
  String get permissionUseVoiceActivity => 'Χρήση φωνητικής δραστηριότητας';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Χωρίς αυτήν την άδεια, απαιτείται η λειτουργία push-to-talk.';

  @override
  String get permissionPrioritySpeaker => 'Ομιλητής προτεραιότητας';

  @override
  String get permissionMuteMembers => 'Σίγαση μελών';

  @override
  String get permissionDeafenMembers => 'Σίγαση μελών';

  @override
  String get permissionMoveMembers => 'Μετακίνηση μελών';

  @override
  String get permissionMoveMembersDescription =>
      'Σύρε μέλη μεταξύ καναλιών στα οποία μπορούν να έχουν πρόσβαση.';

  @override
  String get permissionSetVoiceRegion => 'Ορισμός περιοχής φωνής';

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
      'Δείτε και διαχειριστείτε κάθε webhook που έχει ρυθμιστεί στην κοινότητά σας.';

  @override
  String get guildSettingsWebhooksEmpty => 'Δεν υπάρχουν webhooks';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'Αυτή η κοινότητα δεν έχει ακόμη κανένα webhook. Μεταβείτε στο $channelSettingsPath για να δημιουργήσετε ένα.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'Χρειάζεστε την άδεια \"$permission\" για να προβάλετε και να επεξεργαστείτε τα webhooks για αυτήν την κοινότητα.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle =>
      'Αποτυχία φόρτωσης webhooks';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'Παρουσιάστηκε σφάλμα κατά τη φόρτωση των webhooks. Δοκιμάστε ξανά.';

  @override
  String get guildSettingsWebhooksUpdated => 'Τα webhook ενημερώθηκαν';

  @override
  String get guildSettingsWebhooksUpdateFailed =>
      'Αποτυχία ενημέρωσης webhooks';

  @override
  String get guildSettingsUnknownChannel => 'Άγνωστο κανάλι';

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
      'Καταχώρισε την κοινότητά σου στην Ανακάλυψη, ώστε να μπορούν να τη βρουν και να συμμετάσχουν σε αυτήν και άλλοι.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Δεν υπάρχουν αρκετά μέλη';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Η κοινότητά σας χρειάζεται τουλάχιστον $count μέλη για να μπορεί να εμφανιστεί στην Ανακάλυψη.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Κατάσταση:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'Σε εκκρεμότητα';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Εγκεκριμένο';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Απορρίφθηκε';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Καταργήθηκε';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Λόγος: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'Η κοινότητά σας είναι καταχωρισμένη στην Ανακάλυψη. Μπορείτε να ενημερώσετε τα στοιχεία της καταχώρισής σας παρακάτω ή να την αποσύρετε για να την καταργήσετε.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Η αίτησή σας εκκρεμεί για έλεγχο. Μπορείτε ακόμα να ενημερώσετε τα στοιχεία της καταχώρισής σας ή να αποσύρετε την αίτηση.';

  @override
  String get guildSettingsDiscoveryCategory => 'Κατηγορία';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Επίλεξε την κατηγορία που περιγράφει καλύτερα την κοινότητά σου. Μπορείς να την αλλάξεις οποιαδήποτε στιγμή.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Κύρια γλώσσα';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'Η γλώσσα που μιλάει η κοινότητά σου. Χρησιμοποιείται για το φιλτράρισμα των αποτελεσμάτων στην Ανακάλυψη.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Περιγραφή';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Περιέγραψε την κοινότητά σου';

  @override
  String get guildSettingsDiscoveryDescriptionRequired =>
      'Απαιτείται περιγραφή.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'Η περιγραφή πρέπει να έχει τουλάχιστον $minLength χαρακτήρες.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'Η περιγραφή δεν πρέπει να υπερβαίνει τους $maxLength χαρακτήρες.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Προσαρμοσμένες ετικέτες';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Έως $maxTags ετικέτες βοηθούν τους χρήστες να βρουν την κοινότητά σας. Εμφανίζονται στην αναζήτηση του Discovery.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint =>
      'Πρόσθεσε μια ετικέτα και πάτησε Enter';

  @override
  String get guildSettingsDiscoveryAddTag => 'Προσθήκη';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Κατάργηση ετικέτας $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle =>
      'Δεν ήταν δυνατή η προσθήκη ετικέτας';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'Οι ετικέτες πρέπει να είναι 2 έως $maxLength χαρακτήρες και να περιέχουν μόνο αλφαριθμητικούς χαρακτήρες.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'Μπορείτε να προσθέσετε έως $maxTags ετικέτες.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Εφαρμογή';

  @override
  String get guildSettingsDiscoverySave => 'Αποθήκευση';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Απόσυρση';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Η αίτηση ανακάλυψης στάλθηκε';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Η καταχώριση στην Ανακάλυψη ενημερώθηκε';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Η αίτηση ανακάλυψης αποσύρθηκε';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Αδυναμία ανάκλησης αίτησης';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Δοκιμάστε ξανά σε λίγο.';

  @override
  String get guildSettingsMembersDescription =>
      'Αναζήτηση και διαχείριση μελών διακομιστή.';

  @override
  String get guildSettingsMembersSearchHint => 'Αναζήτηση με όνομα χρήστη ή ID';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count μέλη';
  }

  @override
  String get guildMembersRecentTitle => 'Πρόσφατα μέλη';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Εμφανίζονται $displayedCount από $totalCount συνολικά μέλη';
  }

  @override
  String get guildMembersSort => 'Ταξινόμηση';

  @override
  String get guildSettingsMembersSortNewest => 'Νεότεροι πρώτα';

  @override
  String get guildMembersSortOldest => 'Παλαιότερα πρώτα';

  @override
  String get guildMembersColumnName => 'Όνομα';

  @override
  String get guildMembersColumnMemberSince => 'Μέλος από';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'Έγινε μέλος στο $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Τρόπος συμμετοχής';

  @override
  String get guildMembersColumnRoles => 'Ρόλοι';

  @override
  String get guildMembersColumnActions => 'Ενέργειες';

  @override
  String get guildMembersFilterMemberSince =>
      'Φιλτράρισμα κατά ημερομηνία εγγραφής μέλους';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Φιλτράρισμα κατά ημερομηνία δημιουργίας λογαριασμού';

  @override
  String get guildMembersFilterJoinMethod => 'Φιλτράρισμα κατά μέθοδο σύνδεσης';

  @override
  String get guildMembersFilterRoles => 'Φιλτράρισμα κατά ρόλους';

  @override
  String get guildMembersFilterAll => 'Όλα';

  @override
  String get guildMembersFilterPast1Hour => 'Τελευταία ώρα';

  @override
  String get guildMembersFilterPast24Hours => 'Τελευταίες 24 ώρες';

  @override
  String get guildMembersFilterPast7Days => 'Τελευταίες 7 ημέρες';

  @override
  String get guildMembersFilterPast2Weeks => 'Τελευταίες 2 εβδομάδες';

  @override
  String get guildMembersFilterPast3Weeks => 'Τελευταίες 3 εβδομάδες';

  @override
  String get guildMembersFilterPast4Weeks => 'Τελευταίες 4 εβδομάδες';

  @override
  String get guildMembersFilterPast3Months => 'Τελευταίοι 3 μήνες';

  @override
  String get guildMembersFilterCustomRange => 'Προσαρμοσμένο εύρος...';

  @override
  String get guildMembersDateRangeTitle => 'Προσαρμοσμένο εύρος ημερομηνιών';

  @override
  String get guildMembersDateAfter => 'Μετά την ημερομηνία';

  @override
  String get guildMembersDateBefore => 'Πριν από την ημερομηνία';

  @override
  String get guildMembersClearAll => 'Εκκαθάριση όλων';

  @override
  String get guildMembersRowsPerPage => 'Σειρές ανά σελίδα';

  @override
  String get guildMembersEmptySearch =>
      'Κανείς δεν ταιριάζει με αυτήν την αναζήτηση.';

  @override
  String get guildMembersLoadError =>
      'Κάτι πήγε στραβά κατά τη φόρτωση των μελών. Δοκιμάστε ξανά αργότερα.';

  @override
  String get guildMembersIndexing => 'Ευρετηρίαση μελών…';

  @override
  String get guildMembersGoToPage => 'Μετάβαση στη σελίδα';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'Πήγαινε στη σελίδα $page';
  }

  @override
  String get guildMembersJumpToPage => 'Μετάβαση στη σελίδα';

  @override
  String get guildMembersJoinSourceCreator => 'Δημιουργός κοινότητας';

  @override
  String get guildMembersJoinSourceInvite => 'Πρόσκληση';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Πρόσκληση ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Προσκλήθηκε από τον/την $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl =>
      'Διεύθυνση URL προσαρμοσμένης μορφής';

  @override
  String get guildMembersJoinSourceBotInvite => 'Πρόσκληση bot';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'Διαχειριστής πλατφόρμας';

  @override
  String get guildMembersJoinSourceDiscovery => 'Ανακάλυψη';

  @override
  String get guildMembersJoinMethodUnknown => 'Άγνωστο';

  @override
  String get guildMembersCommunityOwner => 'Κάτοχος κοινότητας';

  @override
  String get guildMembersViewAllRoles => 'Προβολή όλων των ρόλων';

  @override
  String get guildMembersJoinedJustNow => 'Μόλις τώρα';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count λεπτά πριν',
      one: '1 λεπτό πριν',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'πριν από $count ώρες',
      one: 'πριν από 1 ώρα',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'πριν από $count ημέρες',
      one: 'πριν από 1 ημέρα',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Μέλη';

  @override
  String get guildMembersChannelListSelected => 'Μέλη, επιλεγμένα';

  @override
  String get guildSettingsInvitesTitle => 'Προσκλήσεις';

  @override
  String get guildSettingsInvitesDescription =>
      'Δείτε όλες τις προσκλήσεις για αυτήν την κοινότητα. Για να δημιουργήσετε μια νέα πρόσκληση, μεταβείτε σε ένα κανάλι και χρησιμοποιήστε το κουμπί πρόσκλησης.';

  @override
  String get guildSettingsInvitesEmpty => 'Δεν υπάρχουν σύνδεσμοι πρόσκλησης';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Αυτή η κοινότητα δεν έχει συνδέσμους πρόσκλησης ακόμα. Πήγαινε σε ένα κανάλι και δημιούργησε μια πρόσκληση για να καλέσεις άτομα.';

  @override
  String get guildSettingsInvitesLoadFailedTitle =>
      'Αποτυχία φόρτωσης προσκλήσεων';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Παρουσιάστηκε σφάλμα κατά τη φόρτωση των προσκλήσεων. Δοκιμάστε ξανά.';

  @override
  String get guildSettingsInvitesTryAgain => 'Δοκιμάστε ξανά';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Εμφάνιση ημερομηνίας δημιουργίας αντί για ημερομηνία λήξης';

  @override
  String get guildSettingsInvitesPauseInvites => 'Παύση προσκλήσεων';

  @override
  String get guildSettingsInvitesEnableInvites => 'Ενεργοποίηση προσκλήσεων';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Παύση προσκλήσεων για αυτήν την κοινότητα';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Ενεργοποίηση προσκλήσεων για αυτήν την κοινότητα';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Παύση προσκλήσεων; Οι νέοι χρήστες δεν θα μπορούν να μπουν μέσω συνδέσμων πρόσκλησης μέχρι να τις ενεργοποιήσεις ξανά. Τα υπάρχοντα μέλη δεν θα επηρεαστούν.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Ενεργοποίηση προσκλήσεων; Οι χρήστες θα μπορούν να ξαναμπούν σε αυτήν την κοινότητα μέσω συνδέσμων πρόσκλησης.';

  @override
  String get guildSettingsInvitesPause => 'Παύση';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Οι προσκλήσεις έχουν τεθεί σε παύση για αυτήν την κοινότητα.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Οι προσκλήσεις έχουν τεθεί σε παύση επειδή το $productName εντόπισε μια πιθανή επιδρομή. Οι νέοι χρήστες δεν μπορούν να συμμετάσχουν αυτήν τη στιγμή.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Προσκαλών:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Κανάλι:';

  @override
  String get guildSettingsInvitesLabelCode => 'Κωδικός:';

  @override
  String get guildSettingsInvitesLabelUses => 'Χρήσεις:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Δημιουργήθηκε:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Λήγει:';

  @override
  String get guildSettingsInvitesUnknown => 'Άγνωστο';

  @override
  String get guildSettingsInvitesNoCategory => 'Χωρίς κατηγορία';

  @override
  String get guildSettingsInvitesExpired => 'Έληξε';

  @override
  String get guildSettingsInvitesNever => 'Ποτέ';

  @override
  String get guildSettingsInvitesCopyLink => 'Αντιγραφή συνδέσμου πρόσκλησης';

  @override
  String get guildSettingsInvitesRevoke => 'Ανάκληση πρόσκλησης';

  @override
  String get guildSettingsInvitesRevokeFailedTitle =>
      'Δεν ήταν δυνατή η ανάκληση της πρόσκλησης';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'Ο σύνδεσμος ενδέχεται να εξακολουθεί να λειτουργεί. Δοκιμάστε ξανά σε λίγο.';

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
  String get guildSettingsEmojiUploadTitle => 'Αποστολή emoji';

  @override
  String get guildSettingsEmojiSlotsTitle => 'Θέσεις για emoji';

  @override
  String get guildSettingsEmojiDropZone =>
      'Σύρετε και αποθέστε αρχεία emoji εδώ';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Αποτυχία φόρτωσης emoji. Δοκιμάστε ξανά αργότερα.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'Δεν βρέθηκαν emoji που να ταιριάζουν στην αναζήτησή σου.';

  @override
  String get guildSettingsEmojiNoSlots =>
      'Δεν υπάρχουν διαθέσιμες θέσεις για emoji';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Έχετε φτάσει τον μέγιστο αριθμό emoji. Διαγράψτε κάποια υπάρχοντα emoji για να δημιουργήσετε χώρο.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Τα ονόματα emoji πρέπει να έχουν τουλάχιστον 2 χαρακτήρες και μπορούν να χρησιμοποιούν γράμματα, αριθμούς και κάτω παύλες. Τα emoji πρέπει να είναι μικρότερα από $maxSize. Οι στατικές εικόνες αλλάζουν αυτόματα μέγεθος σε 128x128 εικονοστοιχία και συμπιέζονται αυτόματα. Τα κινούμενα emoji και τα SVG πρέπει ήδη να ταιριάζουν με το όριο.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'Ανέβασμα emoji';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# emojis',
      one: '# emoji',
    );
    return 'Μεταφόρτωση $_temp0. Αυτό μπορεί να πάρει λίγο χρόνο.';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'Αποτυχία μεταφόρτωσης emoji. Δοκιμάστε ξανά.';

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Δεν ήταν δυνατή η προσθήκη ορισμένων emoji';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'Ελέγξτε αυτά τα αρχεία και δοκιμάστε ξανά με μικρότερες ή απλούστερες εικόνες.';

  @override
  String get guildSettingsEmojiRenameTitle => 'Μετονομασία emoji';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2-32 χαρακτήρες, γράμματα, αριθμοί, κάτω παύλες.';

  @override
  String get guildSettingsEmojiColumnEmoji => 'Emoji';

  @override
  String get guildSettingsEmojiColumnName => 'Όνομα';

  @override
  String get guildSettingsEmojiColumnUploader => 'Αναρτήθηκε από';

  @override
  String get guildSettingsEmojiUnknownUploader => 'Άγνωστο';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Διαγραφή emoji';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'Διαγραφή του :$name:; Δεν αναιρείται.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Εκκαθάριση αυτού του emoji από τον χώρο αποθήκευσης και το CDN';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'Το όνομα emoji πρέπει να έχει τουλάχιστον 2 χαρακτήρες';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'Το όνομα emoji πρέπει να έχει έως 32 χαρακτήρες';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Μη έγκυρο όνομα emoji';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Αδυναμία μετονομασίας αυτού του emoji';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'Το όνομα επανήλθε στην προηγούμενη του κατάσταση. Δοκιμάστε ξανά σε λίγο.';

  @override
  String get guildSettingsEmojiGoneTitle => 'Αυτό το emoji δεν υπάρχει πλέον';

  @override
  String get guildSettingsEmojiGoneBody =>
      'Ενδέχεται να έχει διαγραφεί. Το όνομα επανήλθε στην προηγούμενη κατάστασή του.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'Δεν μπορείτε να μετονομάσετε αυτό το emoji';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'Δεν έχετε δικαίωμα να μετονομάσετε αυτό το emoji. Το όνομα επανήλθε στην προηγούμενη του κατάσταση.';

  @override
  String get guildSettingsEmojiRateLimitedTitle => 'Προχωράτε πολύ γρήγορα';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'Παρακαλώ περιμένετε λίγο και δοκιμάστε να μετονομάσετε ξανά.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Αδυναμία διαγραφής αυτού του emoji';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'Δεν μπορείτε να διαγράψετε αυτό το emoji';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'Να επιτρέπεται σε άλλους να κλωνοποιούν τα emoji σου';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'Όταν είναι ενεργοποιημένο, τα μέλη άλλων κοινοτήτων μπορούν να χρησιμοποιήσουν τη συντόμευση \"Κλωνοποίηση\" με ένα κλικ εντός της εφαρμογής για τα προσαρμοσμένα emoji σας. Αυτό δεν τους εμποδίζει να αποθηκεύσουν την εικόνα και να την ανεβάσουν οι ίδιοι.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Να επιτρέπεται σε άλλους να αντιγράφουν τα αυτοκόλλητά σου';

  @override
  String get guildSettingsCloneStickerDescription =>
      'Όταν είναι ενεργοποιημένο, τα μέλη άλλων κοινοτήτων μπορούν να χρησιμοποιήσουν την εντός εφαρμογής συντόμευση \"Κλωνοποίηση\" με ένα κλικ στα προσαρμοσμένα αυτοκόλλητά σας. Αυτό δεν τους εμποδίζει να αποθηκεύσουν την εικόνα και να την ανεβάσουν οι ίδιοι.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Μόνο μέλη με την άδεια \"$permission\" μπορούν να αλλάξουν αυτό.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'Δεν ήταν δυνατή η ενημέρωση της κλωνοποίησης emoji';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Δεν ήταν δυνατή η ενημέρωση της κλωνοποίησης αυτοκόλλητων';

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
  String get guildSettingsStickerSlotsTitle => 'Θέσεις για αυτοκόλλητα';

  @override
  String get guildSettingsStickerUploadTitle => 'Ανέβασμα αυτοκόλλητου';

  @override
  String get guildSettingsStickerDropZone =>
      'Σύρετε και αποθέστε ένα αρχείο αυτοκόλλητου εδώ (ένα κάθε φορά)';

  @override
  String get guildSettingsStickerDensity => 'Πυκνότητα αυτοκόλλητων';

  @override
  String get guildSettingsStickerDensityCozy => 'Ζεστό';

  @override
  String get guildSettingsStickerDensityCompact => 'Συμπαγής';

  @override
  String get guildSettingsStickersLoadFailedTitle =>
      'Αποτυχία φόρτωσης αυτοκόλλητων';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Παρουσιάστηκε σφάλμα κατά τη φόρτωση των αυτοκόλλητων. Δοκιμάστε ξανά.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Δεν βρέθηκαν αυτοκόλλητα που να ταιριάζουν στην αναζήτησή σας.';

  @override
  String get guildSettingsStickersEmptySearch => 'Δεν βρέθηκαν αυτοκόλλητα';

  @override
  String get guildSettingsStickerNoSlots =>
      'Δεν υπάρχουν διαθέσιμες θέσεις αυτοκόλλητων';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Έχετε φτάσει τον μέγιστο αριθμό αυτοκόλλητων. Διαγράψτε μερικά υπάρχοντα αυτοκόλλητα για να δημιουργήσετε χώρο.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Τα αυτοκόλλητα αποθηκεύονται σε 320x320 εικονοστοιχία και πρέπει να είναι μικρότερα από $maxSize. Οι στατικές εικόνες αλλάζουν αυτόματα μέγεθος και συμπιέζονται. Τα κινούμενα αυτοκόλλητα και τα SVG πρέπει ήδη να ταιριάζουν με το όριο.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle =>
      'Μη υποστηριζόμενο αρχείο αυτοκόλλητου';

  @override
  String get guildSettingsStickerAddTitle => 'Προσθήκη αυτοκόλλητου';

  @override
  String get guildSettingsStickerEditTitle => 'Επεξεργασία αυτοκόλλητου';

  @override
  String get guildSettingsStickerNameLabel => 'Όνομα';

  @override
  String get guildSettingsStickerNameHint => 'Το τέλειο αυτοκόλλητό μου';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Περιγραφή';

  @override
  String get guildSettingsStickerDescriptionHint => 'Περιέγραψε το αυτοκόλλητο';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Ετικέτες ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Προσθήκη ετικέτας';

  @override
  String get guildSettingsStickerTagAdd => 'Προσθήκη';

  @override
  String get guildSettingsStickerNameRequired => 'Απαιτείται όνομα';

  @override
  String get guildSettingsStickerNameTooShort =>
      'Το όνομα πρέπει να έχει τουλάχιστον 2 χαρακτήρες';

  @override
  String get guildSettingsStickerNameTooLong =>
      'Το όνομα πρέπει να έχει έως 30 χαρακτήρες';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'Η περιγραφή πρέπει να είναι έως 500 χαρακτήρες';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'Δεν ήταν δυνατή η δημιουργία αυτού του αυτοκόλλητου';

  @override
  String get guildSettingsStickerTooLargeTitle =>
      'Το αυτοκόλλητο είναι πολύ μεγάλο';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'Το αυτοκόλλητο δεν συμπιέστηκε αρκετά';

  @override
  String get guildSettingsStickerDeleteTitle => 'Διαγραφή αυτοκόλλητου';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'Διαγραφή του \"$name\"; δεν μπορεί να αναιρεθεί.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Διαγραφή αυτού του αυτοκόλλητου από τον χώρο αποθήκευσης και το CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Αδυναμία διαγραφής αυτού του αυτοκόλλητου';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'Δεν μπορείς να διαγράψεις αυτό το αυτοκόλλητο';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Για να δημιουργήσεις ένα webhook, άνοιξε το $channelSettingsPath. Μπορείς ακόμα να επεξεργαστείς και να οργανώσεις όλα τα υπάρχοντα webhooks εδώ.';
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
  String get guildSettingsInvitesTableExpires => 'Λήγει';

  @override
  String get guildSettingsAuditLogFilterUser => 'Φιλτράρισμα κατά χρήστη';

  @override
  String get guildSettingsAuditLogFilterAction => 'Φιλτράρισμα κατά ενέργειας';

  @override
  String get createDm => 'Δημιουργία νέας συνομιλίας';

  @override
  String get createGroupDm => 'Δημιουργία ομαδικής συνομιλίας';

  @override
  String get createDmNewMessage => 'Νέο μήνυμα';

  @override
  String get createDmSelectFriends => 'Επιλογή φίλων';

  @override
  String get createDmChooseFriendsSubtitle =>
      'Επιλέξτε φίλους για αποστολή μηνύματος.';

  @override
  String get createDmSearchFriends => 'Αναζήτηση φίλων';

  @override
  String get createDmNoFriendsFound => 'Δεν βρέθηκαν φίλοι';

  @override
  String get createDmNoFriendsYet => 'Δεν έχεις φίλους ακόμα';

  @override
  String get createDmClaimToStartDms =>
      'Διεκδικήστε τον λογαριασμό σας για να ξεκινήσετε απευθείας μηνύματα.';

  @override
  String get createDmVerifyToStartDms =>
      'Επαληθεύστε το email σας για να ξεκινήσετε απευθείας μηνύματα.';

  @override
  String get createDmVerifyYourEmail => 'Επαληθεύστε το email σας';

  @override
  String get createDmNewGroup => 'Νέα ομάδα';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Δημιουργία νέας ομάδας με τον/την $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'Επιβεβαίωση νέας ομάδας';

  @override
  String get createDmCreateNewGroup => 'Δημιουργία νέας ομάδας';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'Κατάργηση $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'Έχεις ήδη μια ομάδα με αυτούς τους χρήστες. Θέλεις όντως να δημιουργήσεις μια νέα; Κανένα πρόβλημα!';

  @override
  String get createDmNoActivityYet => 'Καμία δραστηριότητα ακόμα';

  @override
  String get createDmSomeUsersCantBeAdded =>
      'Ορισμένοι χρήστες δεν μπορούν να προστεθούν';

  @override
  String get createDmCreateWithoutThem => 'Δημιουργία χωρίς αυτούς';

  @override
  String get createDmUnaddableIntro =>
      'Τα παρακάτω άτομα δεν μπορούν να προστεθούν σε αυτήν την ομαδική συνομιλία:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Δημιουργία της ομαδικής συνομιλίας με τους υπόλοιπους $count παραλήπτη(ες) και παράλειψη των άλλων;';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Δεν υπάρχουν άλλοι παραλήπτες για να δημιουργήσετε ομαδική συνομιλία.';

  @override
  String get createDmUnaddableUserNotFound => 'Ο χρήστης δεν βρέθηκε';

  @override
  String get createDmUnaddableBlocked =>
      'Δεν μπορείς να στείλεις μήνυμα σε αυτόν τον χρήστη';

  @override
  String get createDmUnaddableNotFriends => 'Δεν είναι στη λίστα φίλων σου';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Δεν επιτρέπει την προσθήκη σε ομαδικές συνομιλίες';

  @override
  String get createDmFailed =>
      'Δεν ήταν δυνατή η δημιουργία της συνομιλίας. Δοκιμάστε ξανά.';

  @override
  String get dmListMessagesTitle => 'Μηνύματα';

  @override
  String get dmListDirectMessagesTitle => 'Άμεσα μηνύματα';

  @override
  String get keybindsSearchShortcuts => 'Αναζήτηση συντομεύσεων';

  @override
  String get keybindSectionDefaults => 'Προεπιλογές';

  @override
  String get keybindSectionMessages => 'Μηνύματα';

  @override
  String get keybindSectionNavigation => 'Πλοήγηση';

  @override
  String get keybindSectionDragAndDrop => 'Σύρετε και αποθέστε';

  @override
  String get keybindSectionChat => 'Συνομιλία';

  @override
  String get keybindSectionVoiceAndVideo => 'Φωνή και βίντεο';

  @override
  String get keybindSectionMisc => 'Διάφορα';

  @override
  String get keybindActionShowShortcutsList =>
      'Εμφάνιση λίστας συντομεύσεων πληκτρολογίου';

  @override
  String get keybindActionCopyText => 'Αντιγραφή κειμένου';

  @override
  String get keybindActionMarkUnread => 'Σήμανση ως μη αναγνωσμένο';

  @override
  String get keybindActionFocusTextarea => 'Εστίαση στο πεδίο κειμένου';

  @override
  String get keybindActionSwitchCommunities => 'Εναλλαγή μεταξύ κοινοτήτων';

  @override
  String get keybindActionSwitchChannels => 'Εναλλαγή καναλιών';

  @override
  String get keybindActionHistoryBack =>
      'Πλοήγηση προς τα πίσω στο ιστορικό καναλιών που προβλήθηκαν';

  @override
  String get keybindActionHistoryForward =>
      'Μετακίνηση προς τα εμπρός στο ιστορικό καναλιών που προβλήθηκαν';

  @override
  String get keybindActionJumpUnreadChannels =>
      'Μετάβαση μεταξύ μη αναγνωσμένων καναλιών';

  @override
  String get keybindActionJumpMentionChannels =>
      'Μετάβαση σε μη αναγνωσμένα κανάλια με αναφορές';

  @override
  String get keybindActionJumpCurrentCall => 'Μετάβαση στην τρέχουσα κλήση';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Εναλλαγή μεταξύ τελευταίας κοινότητας και προσωπικών μηνυμάτων';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Εναλλαγή στην προηγούμενη κοινότητα ή στα DM';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Εναλλαγή στην επόμενη κοινότητα ή στα DM';

  @override
  String get keybindActionGoToDms => 'Μετάβαση στα άμεσα μηνύματα';

  @override
  String get keybindActionGoToFirstCommunity => 'Μετάβαση στην πρώτη κοινότητα';

  @override
  String get keybindActionGoToSecondCommunity =>
      'Μετάβαση στη δεύτερη κοινότητα';

  @override
  String get keybindActionGoToThirdCommunity => 'Μετάβαση στην τρίτη κοινότητα';

  @override
  String get keybindActionGoToFourthCommunity =>
      'Μετάβαση στην τέταρτη κοινότητα';

  @override
  String get keybindActionGoToFifthCommunity =>
      'Μετάβαση στην πέμπτη κοινότητα';

  @override
  String get keybindActionGoToSixthCommunity => 'Πήγαινε στην έκτη κοινότητα';

  @override
  String get keybindActionGoToSeventhCommunity =>
      'Πήγαινε στην έβδομη κοινότητα';

  @override
  String get keybindActionGoToEighthCommunity =>
      'Μετάβαση στην όγδοη κοινότητα';

  @override
  String get keybindActionToggleQuickSwitcher => 'Εναλλαγή γρήγορης εναλλαγής';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'Δημιουργία ή συμμετοχή σε κοινότητα';

  @override
  String get keybindActionStartDragAndDrop => 'Έναρξη μεταφοράς και απόθεσης';

  @override
  String get keybindActionMove => 'Μετακίνηση';

  @override
  String get keybindActionDropItem => 'Απόθεση αντικειμένου';

  @override
  String get keybindActionCancel => 'Ακύρωση';

  @override
  String get keybindActionMarkCommunityRead =>
      'Σήμανση κοινότητας ως αναγνωσμένη';

  @override
  String get keybindActionMarkChannelRead => 'Σήμανση καναλιού ως αναγνωσμένου';

  @override
  String get keybindActionStartGroupDm => 'Έναρξη ομαδικής συνομιλίας';

  @override
  String get keybindActionTogglePinnedMessages =>
      'Εναλλαγή καρφιτσωμένων μηνυμάτων';

  @override
  String get keybindActionToggleInbox => 'Εναλλαγή εισερχομένων';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Σήμανση του κορυφαίου καναλιού εισερχομένων ως αναγνωσμένου';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Σήμανση όλων των συνομιλιών εισερχομένων ως αναγνωσμένων';

  @override
  String get keybindActionToggleMemberList =>
      'Εναλλαγή λίστας μελών ή φωνητικής συνομιλίας';

  @override
  String get keybindActionToggleEmojiPicker => 'Εναλλαγή επιλογέα emoji';

  @override
  String get keybindActionToggleGifPicker => 'Εναλλαγή επιλογής GIF';

  @override
  String get keybindActionToggleStickerPicker =>
      'Εναλλαγή επιλογής αυτοκόλλητων';

  @override
  String get keybindActionScrollChatUp => 'Κύλιση συνομιλίας προς τα πάνω';

  @override
  String get keybindActionScrollChatDown => 'Κύλιση συνομιλίας προς τα κάτω';

  @override
  String get keybindActionJumpOldestUnread =>
      'Μετάβαση στο παλαιότερο μη αναγνωσμένο μήνυμα';

  @override
  String get keybindActionFocusComposer => 'Εστίαση στο πεδίο κειμένου';

  @override
  String get keybindActionUploadFile => 'Αποστολή αρχείου';

  @override
  String get keybindActionCopyChannelLink => 'Αντιγραφή συνδέσμου καναλιού';

  @override
  String get keybindActionToggleSavedMedia =>
      'Εναλλαγή αποθηκευμένων πολυμέσων';

  @override
  String get keybindActionSendVoiceMessage => 'Αποστολή φωνητικού μηνύματος';

  @override
  String get keybindActionAnswerCall => 'Απάντηση στην εισερχόμενη κλήση';

  @override
  String get keybindActionDeclineCall => 'Απόρριψη εισερχόμενης κλήσης';

  @override
  String get keybindActionStartDmCall => 'Ξεκινήστε μια κλήση σε DM ή ομάδα';

  @override
  String get keybindActionToggleSoundboard => 'Εναλλαγή ηχοσανίδας';

  @override
  String get keybindActionToggleCompactCallView =>
      'Ανάπτυξη ή σύμπτυξη της συμπαγούς προβολής κλήσης';

  @override
  String get keybindActionPushToTalkPriority => 'Push to talk (προτεραιότητα)';

  @override
  String get keybindActionVoiceActivityPriority =>
      'Προτεραιότητα δραστηριότητας φωνής';

  @override
  String get keybindActionOpenHelp => 'Άνοιγμα βοήθειας';

  @override
  String get keybindActionSearchMessages => 'Αναζήτηση μηνυμάτων';

  @override
  String get keybindActionOpenContextMenu => 'Άνοιγμα του μενού περιβάλλοντος';

  @override
  String get keybindActionOpenSettings => 'Άνοιγμα ρυθμίσεων';

  @override
  String get keybindActionOpenThemeStudio =>
      'Άνοιγμα αναδυόμενου παραθύρου στούντιο θεμάτων';

  @override
  String get keybindActionZoomIn => 'Μεγέθυνση';

  @override
  String get keybindActionZoomOut => 'Σμίκρυνση';

  @override
  String get keybindActionZoomReset => 'Επαναφορά ζουμ';

  @override
  String get clipboardPasteFailed =>
      'Δεν ήταν δυνατή η επικόλληση. Το πρόχειρο ήταν κενό ή μπλοκαρισμένο για αυτήν την εφαρμογή.';

  @override
  String get homeQuickActionDms => 'Άμεσα μηνύματα';
}
