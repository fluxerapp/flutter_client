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
  String get addFriendSendFailedGeneric =>
      'Δεν ήταν δυνατή η αποστολή του αιτήματος φιλίας. Δοκίμασε ξανά.';

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
  String get externalLinkWarningLeaving => 'Πρόκειται να φύγετε από το Fluxer';

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
  String get changeYourFluxerTag => 'Αλλαγή του FluxerTag σου';

  @override
  String get fluxerTagInputLabel => 'FluxerTag';

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
  String get fluxerTagAlreadyTaken => 'Το FluxerTag έχει ήδη ληφθεί';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Το FluxerTag $username#$discriminator έχει ήδη ληφθεί. Η συνέχιση θα επαναφέρει αυτόματα τον διακριτικό σου αριθμό.';
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
      'Αν αποθηκεύσεις αυτό το FluxerTag, το προσαρμοσμένο 4ψήφιο tag σου θα επανέλθει σε έναν τυχαίο αριθμό όταν λήξει η συνδρομή σου Plutonium. Αν η συνδρομή σου δεν ανανεωθεί, θα έχεις μια περίοδο χάριτος 3 ημερών πριν αλλάξει το tag.';

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
  String get fluxerTagUpdated => 'Το FluxerTag ενημερώθηκε';

  @override
  String get fluxerTagUpdateFailed =>
      'Αποτυχία ενημέρωσης του FluxerTag. Προσπάθησε ξανά.';

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
      'Διεκδίκησε τον λογαριασμό σου για να αλλάξεις το FluxerTag σου';

  @override
  String get changeFluxerTag => 'Αλλαγή FluxerTag';

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
  String get profilePreviewMemberSince => 'Μέλος Fluxer από';

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
  String get securityLoginEmailSectionDescription =>
      'Διαχειριστείτε τη διεύθυνση email που χρησιμοποιείτε για να συνδεθείτε στο Fluxer';

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
  String get relativeTimeJustNow => 'μόλις τώρα';

  @override
  String get authorizedAppsTitle => 'Εξουσιοδοτημένες Εφαρμογές';

  @override
  String get authorizedAppsDescription =>
      'Αυτές οι εφαρμογές έχουν λάβει πρόσβαση στον λογαριασμό σας Fluxer.';

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
  String get blockedUsersCopyTag => 'Αντιγραφή FluxerTag';

  @override
  String get blockedUsersCopyId => 'Αντιγραφή ID Χρήστη';

  @override
  String get userProfileLoadError => 'Αδυναμία φόρτωσης προφίλ';

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
  String get userProfileStaffBadgeTooltip => 'Προσωπικό Fluxer';

  @override
  String get userProfileCtpBadgeTooltip => 'Ομάδα Κοινότητας Fluxer';

  @override
  String get userProfilePartnerBadgeTooltip => 'Συνεργάτης Fluxer';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Κυνηγός Σφαλμάτων Fluxer';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer Plutonium';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Συνδρομητής Fluxer Plutonium από $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Fluxer Visionary';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Fluxer Visionary από $date';
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
  String get chatAttachmentFileTooLarge =>
      'Ένα ή περισσότερα αρχεία υπερβαίνουν το όριο μεγέθους';

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
  String get chatAttachmentExpiredTooltip => 'Το συνημμένο έχει λήξει';

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
  String get connectionsDescription =>
      'Συνδέστε εξωτερικούς λογαριασμούς και τομείς στο προφίλ σας στο Fluxer. Οι επαληθευμένες συνδέσεις θα εμφανίζονται στο προφίλ σας για να τις δουν οι άλλοι.';

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
  String get lookAndFeelCollapseDMsLabel => 'Σύμπτυξη DM σε φάκελο';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'Όταν είναι ενεργοποιημένο, τα μη αναγνωσμένα DM στην πλευρική μπάρα κοινότητας συμπτύσσονται σε έναν φάκελο στο κουμπί Fluxer. Κάντε κλικ στο κουμπί Fluxer ενώ βρίσκεστε στη σελίδα DM για να επεκτείνετε ή να συμπτύξετε τον φάκελο.';

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
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'Όταν μεταφορτώνονται απευθείας στο Fluxer';

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
  String get accessibilityUnreadGroupTitle => 'Ενδείξεις μη αναγνωσμένων';

  @override
  String get accessibilityUnreadGroupDescription =>
      'Έλεγχος του τρόπου εμφάνισης των ενδείξεων μη αναγνωσμένων μηνυμάτων.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'Εμφάνιση αχνής ένδειξης μη αναγνωσμένων σε σιωπηλά κανάλια';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'Εμφάνιση μιας αχνής ένδειξης μη αναγνωσμένων δίπλα σε σιωπηλά άμεσα μηνύματα και κανάλια, ώστε να μπορείτε ακόμα να βλέπετε με μια ματιά πότε υπάρχει δραστηριότητα.';

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
  String get voiceChannelEmptyDescription =>
      'Αυτό είναι ένα φωνητικό κανάλι. Συνδεθείτε για να αρχίσετε να μιλάτε!';

  @override
  String get voiceChannelJoin => 'Σύνδεση στο Φωνητικό Κανάλι';

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
  String get voiceControlScreenShare => 'Κοινή χρήση οθόνης';

  @override
  String get voiceScreenShareNotificationText =>
      'Γίνεται κοινή χρήση της οθόνης σας.';

  @override
  String get voiceControlMore => 'Περισσότερα';

  @override
  String get voiceControlDisconnect => 'Αποσύνδεση';

  @override
  String get voiceControlChat => 'Συνομιλία';

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
  String get iarReasonOtherDescription =>
      'Χρησιμοποιήστε μόνο εάν παραβιάζει σαφώς τους κανόνες του Fluxer και δεν ταιριάζει παραπάνω.';

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
  String get personalNotesTitle => 'Προσωπικές σημειώσεις';

  @override
  String get personalNotesSubtitle =>
      'Ο ιδιωτικός σας χώρος για σκέψεις και υπενθυμίσεις';

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
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'Προφίλ';

  @override
  String get userSettingsNavSecurityLogin => 'Ασφάλεια & Σύνδεση';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Δώρα & Κωδικοί';

  @override
  String get userSettingsNavExpressionPacks => 'Πακέτα Εκφράσεων';

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
  String get userSettingsNavMessagesAndMedia => 'Μηνύματα & Πολυμέσα';

  @override
  String get userSettingsNavAudioAndVideo => 'Ήχος & Βίντεο';

  @override
  String get userSettingsNavSoundsAndAlerts => 'Ήχοι & Ειδοποιήσεις';

  @override
  String get userSettingsNavLanguageAndTime => 'Γλώσσα & Ώρα';

  @override
  String get userSettingsNavAdvanced => 'Για προχωρημένους';

  @override
  String get advancedPerformanceReportingTitle => 'Αναφορές απόδοσης';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Βοηθήστε στη βελτίωση του Fluxer μοιράζοντας ανώνυμα δεδομένα σφαλμάτων και απόδοσης.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Αποστολή αναφορών σφαλμάτων και απόδοσης';

  @override
  String get advancedPerformanceReportingDescription =>
      'Όλα τα αναφερόμενα δεδομένα είναι ανώνυμα και αποστέλλονται μόνο στην υπηρεσία παρακολούθησης του Fluxer — δεν χρησιμοποιούνται πάροχοι τρίτων.';

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
  String get userSettingsNavLogOut => 'Αποσύνδεση';

  @override
  String get betaWarningTitle => 'Λογισμικό Beta';

  @override
  String get betaWarningMessage =>
      'Αυτό είναι λογισμικό beta. Δεν είναι όλα ολοκληρωμένα ή προστιθέμενα ακόμα.';

  @override
  String get betaWarningReportIssues =>
      'Παρακαλούμε αναφέρετε τυχόν προβλήματα που θα βρείτε στην κοινότητα Fluxer Mobile (πρέπει να έχετε Plutonium για να μπορείτε να συμμετάσχετε στην κοινότητα αυτή τη στιγμή).';

  @override
  String get betaWarningRepoLink => 'Προβολή πηγαίου κώδικα στο GitHub';

  @override
  String get betaWarningGotIt => 'Το κατάλαβα';

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
  String get guildNavbarStaffOnlyAccessible =>
      'Προσβάσιμο μόνο από το προσωπικό του Fluxer';

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
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Απαιτούνται τουλάχιστον $count μέλη για την υποβολή αίτησης.';
  }

  @override
  String get guildSettingsDiscoveryFormTitle => 'Αίτηση';

  @override
  String get guildSettingsDiscoveryStatusTitle => 'Κατάσταση';

  @override
  String get guildSettingsDiscoveryCategory => 'Κατηγορία';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Περιγραφή';

  @override
  String get guildSettingsDiscoveryTags => 'Ετικέτες';

  @override
  String get guildSettingsDiscoveryTagsHint => 'gaming, art, music';

  @override
  String get guildSettingsDiscoveryApply => 'Υποβολή Αίτησης';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Απόσυρση';

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
  String get guildSettingsInvitesDescription =>
      'Προβολή και ανάκληση ενεργών συνδέσμων πρόσκλησης.';

  @override
  String get guildSettingsInvitesEmpty => 'Δεν υπάρχουν ενεργές προσκλήσεις.';

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
  String get guildSettingsWebhooksInfo =>
      'Δημιουργήστε webhooks από τις ρυθμίσεις καναλιού. Επεξεργαστείτε τα εδώ.';

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
  String get guildSettingsMembersSortNewest => 'Νεότεροι πρώτα';

  @override
  String get guildSettingsAuditLogFilterUser => 'Φιλτράρισμα κατά χρήστη';

  @override
  String get guildSettingsAuditLogFilterAction => 'Φιλτράρισμα κατά ενέργειας';
}
