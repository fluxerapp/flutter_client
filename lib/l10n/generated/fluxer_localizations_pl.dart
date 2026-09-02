// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class FluxerLocalizationsPl extends FluxerLocalizations {
  FluxerLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get reconnectingTitle => 'Coś się zepsuło!';

  @override
  String get reconnectingBody =>
      'Coś jest nie tak z serwerami.\nZaraz powinno być naprawione!';

  @override
  String get gatewayReconnectingToast => 'Łączenie ponownie…';

  @override
  String get gatewayConnectedToast => 'Połączono';

  @override
  String get sessionExpiredToast =>
      'Twoja sesja wygasła. Proszę zaloguj się ponownie.';

  @override
  String splashStartupFailed(String error) {
    return 'Nie udało się uruchomić: $error';
  }

  @override
  String get retry => 'Ponów próbę';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Utracono połączenie';

  @override
  String get splashViewOnStatusPage => 'Zobacz na stronie statusu';

  @override
  String get splashConnectionIssuesPrompt => 'Problemy z połączeniem?';

  @override
  String get splashStatusPageLink => 'Strona statusu';

  @override
  String get splashReadIncident => 'Przeczytaj o incydencie';

  @override
  String get splashIncidentHistory => 'Historia incydentów';

  @override
  String get nagbarLearnMore => 'Dowiedz się więcej';

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
    return 'Hej $displayName, proszę zweryfikuj swój adres e-mail.';
  }

  @override
  String get nagbarOpenSettings => 'Otwórz ustawienia';

  @override
  String get systemPermissionSettingsTitle => 'Nadaj uprawnienie';

  @override
  String get systemPermissionSettingsOpenSettings => 'Otwórz ustawienia';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName nie posiada dostępu do Twojego mikrofonu. Możesz mu go nadać w ustawieniach prywatności urządzenia.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName nie posiada dostępu do Twojego aparatu. Możesz mu go nadać w ustawieniach prywatności urządzenia.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName doesn\'t have access to your photo library. You can enable it in your device privacy settings.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName nie posiada uprawnień do wysyłania powiadomień. Możesz mu je nadać w ustawieniach urządzenia.';
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
  String get nagbarManageSubscription => 'Zarządzaj subskrypcją';

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
  String get welcomeBack => 'Witaj z powrotem';

  @override
  String get email => 'Adres e-mail';

  @override
  String get emailInvalid => 'Wprowadź prawidłowy adres e-mail.';

  @override
  String get password => 'Hasło';

  @override
  String get forgotPassword => 'Nie pamiętasz hasła?';

  @override
  String get logIn => 'Zaloguj się';

  @override
  String get logInWithPasskey => 'Zaloguj się za pomocą klucza dostępu';

  @override
  String continueWithSso(String provider) {
    return 'Kontynuuj z $provider';
  }

  @override
  String get ssoRequired => 'Dostęp do tej instancji wymaga SSO.';

  @override
  String get organizationSsoProvider =>
      'Zaloguj się za pomocą dostawcy pojedynczego logowania Twojej organizacji.';

  @override
  String get failedToStartSso => 'Nie udało się rozpocząć SSO';

  @override
  String get ssoCancelled => 'Logowanie SSO zostało anulowane';

  @override
  String preferSso(String provider) {
    return 'Wolisz używać SSO? Kontynuuj z $provider.';
  }

  @override
  String get logInViaBrowser => 'Zaloguj się przez przeglądarkę';

  @override
  String get needAccountPrompt => 'Potrzebujesz konta? ';

  @override
  String get register => 'Zarejestruj się';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Zweryfikuj, że jesteś człowiekiem';

  @override
  String get captchaDescription =>
      'Musimy upewnić się, że nie jesteś botem. Ukończ poniższą weryfikację.';

  @override
  String get captchaSwitchToHcaptcha =>
      'Masz problemy? Spróbuj zamiast tego hCaptcha';

  @override
  String get captchaSwitchToTurnstile => 'Spróbuj zamiast tego Turnstile';

  @override
  String get cancel => 'Anuluj';

  @override
  String get ipAuthCheckEmail => 'Sprawdź swoją skrzynkę e-mail';

  @override
  String ipAuthDescription(String email) {
    return 'Wysłaliśmy e-mail z linkiem autoryzującym to logowanie. Otwórz swoją skrzynkę odbiorczą dla $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Utracono połączenie';

  @override
  String get ipAuthConnectionLostDescription =>
      'Utraciliśmy połączenie podczas oczekiwania na autoryzację. Spróbuj ponownie.';

  @override
  String get ipAuthLinkExpired => 'Link do logowania wygasł';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Ten link autoryzacyjny wygasł. Zaloguj się ponownie.';

  @override
  String get ipAuthResendEmail => 'Wyślij e-mail ponownie';

  @override
  String get ipAuthResent => 'Wysłano ponownie';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Wstecz';

  @override
  String get next => 'Next';

  @override
  String get mfaTitle => 'Uwierzytelnianie dwuskładnikowe';

  @override
  String get mfaChooseMethod => 'Wybierz metodę weryfikacji';

  @override
  String get mfaMethodTotp => 'Aplikacja uwierzytelniająca';

  @override
  String get mfaMethodWebauthn => 'Klucz bezpieczeństwa / Klucz dostępu';

  @override
  String get mfaTotpDescription =>
      'Wprowadź 6-cyfrowy kod z aplikacji uwierzytelniającej lub jeden z kodów zapasowych.';

  @override
  String get mfaCodeLabel => 'Kod';

  @override
  String get mfaTryAnotherMethod => 'Spróbuj innej metody';

  @override
  String get mfaUseSecurityKey => 'Użyj klucza bezpieczeństwa / hasła';

  @override
  String get accountSelectorTitle => 'Wybierz konto';

  @override
  String get accountSelectorDescription =>
      'Wybierz konto, aby kontynuować, lub dodaj inne.';

  @override
  String get accountAdd => 'Dodaj konto';

  @override
  String get accountRemove => 'Usuń';

  @override
  String accountRemoveTitle(String username) {
    return 'Usuń $username';
  }

  @override
  String get accountRemoveDescription =>
      'Spowoduje to usunięcie zapisanej sesji dla tego konta.';

  @override
  String get accountRemoveOnlyDescription =>
      'Spowoduje to usunięcie jedynego zapisanego konta na tym urządzeniu.';

  @override
  String get accountExpired => 'Wygasło';

  @override
  String accountSessionExpired(String identifier) {
    return 'Sesja wygasła dla $identifier. Zaloguj się ponownie.';
  }

  @override
  String get accountManageTitle => 'Zarządzaj kontami';

  @override
  String get accountSwitchFailed =>
      'Nie udało się przełączyć kont. Spróbuj ponownie.';

  @override
  String get profileTabMenuSwitchAccounts => 'Przełącz konta';

  @override
  String get statusChangeSheetTitle => 'Ustaw status';

  @override
  String get statusOnlineStatusSection => 'Status online';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusIdle => 'Nieaktywny';

  @override
  String get statusDnd => 'Nie przeszkadzać';

  @override
  String get statusInvisible => 'Niewidoczny';

  @override
  String get statusOffline => 'Offline';

  @override
  String get statusUntilIChangeIt => 'Dopóki go nie zmienię';

  @override
  String get statusDontClear => 'Nie czyść';

  @override
  String get statusFor10Seconds => 'Przez 10 sekund';

  @override
  String get statusClearAfter10Seconds => '10 sekund';

  @override
  String get statusClearAfter15Minutes => '15 minut';

  @override
  String get statusClearAfter30Minutes => '30 minut';

  @override
  String get statusClearAfter1Hour => '1 godzina';

  @override
  String get statusClearAfter3Hours => '3 godziny';

  @override
  String get statusClearAfter4Hours => '4 godziny';

  @override
  String get statusClearAfter8Hours => '8 godzin';

  @override
  String get statusClearAfter24Hours => '24 godziny';

  @override
  String get statusClearAfter3Days => '3 dni';

  @override
  String get statusDndDescription =>
      'Nie będziesz otrzymywać powiadomień na komputerze';

  @override
  String get statusInvisibleDescription => 'Będziesz wyglądać na offline';

  @override
  String get customStatusSetTitle => 'Ustaw niestandardowy status';

  @override
  String get customStatusCurrentHint => 'Niestandardowy status';

  @override
  String get customStatusClear => 'Wyczyść niestandardowy status';

  @override
  String get customStatusPlaceholder => 'Co się dzieje?';

  @override
  String get customStatusChooseEmoji => 'Wybierz emoji';

  @override
  String get customStatusClearAfter => 'Wyczyść po';

  @override
  String get customStatusSave => 'Zapisz';

  @override
  String get accountActive => 'Aktywne konto';

  @override
  String get signOut => 'Wyloguj się';

  @override
  String get suspendedPermanentTitle => 'Konto trwale zawieszone';

  @override
  String get suspendedTemporaryTitle => 'Konto zawieszone';

  @override
  String get suspendedPermanentDescription =>
      'Twoje konto zostało trwale zawieszone za naruszenie naszych Warunków korzystania z usługi.';

  @override
  String get suspendedTemporaryDescription =>
      'Twoje konto zostało tymczasowo zawieszone. Będziesz mieć dostęp do swojego konta po zakończeniu okresu zawieszenia.';

  @override
  String get suspendedIssuedAt => 'Wystawiono';

  @override
  String get suspendedEndsAt => 'Kończy się';

  @override
  String get suspendedDuration => 'Czas trwania';

  @override
  String get suspendedPermanent => 'Permanentne';

  @override
  String get suspendedReason => 'Powód';

  @override
  String get suspendedAppealDeadline => 'Termin odwołania';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Twoje konto jest zaplanowane do usunięcia $date.';
  }

  @override
  String get suspendedRecheck => 'Sprawdź ponownie';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Sprawdź ponownie za ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Powrót do logowania';

  @override
  String get suspendedAppealTitle => 'Odwołanie';

  @override
  String get suspendedAppealHint =>
      'Wyjaśnij, dlaczego zawieszenie powinno zostać ponownie rozpatrzone (minimum 50 znaków)...';

  @override
  String get suspendedAppealSubmit => 'Wyślij odwołanie';

  @override
  String get suspendedAppealPending => 'Oczekuje na rozpatrzenie';

  @override
  String get suspendedAppealAccepted => 'Odwołanie przyjęte';

  @override
  String get suspendedAppealRejected => 'Odwołanie odrzucone';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Twoje odwołanie zostało przyjęte, a konto przywrócone.';

  @override
  String get suspendedSignIn => 'Zaloguj się na swoje konto';

  @override
  String get forgotPasswordTitle => 'Zapomniałeś hasła?';

  @override
  String get forgotPasswordDescription =>
      'Wpisz swój adres e-mail, a wyślemy Ci link do zresetowania hasła.';

  @override
  String get forgotPasswordSubmit => 'Wyślij link resetujący';

  @override
  String get forgotPasswordSentTitle => 'Sprawdź swoją pocztę';

  @override
  String get forgotPasswordSentDescription =>
      'Wysłaliśmy instrukcje resetowania hasła na Twój adres e-mail. Sprawdź skrzynkę odbiorczą i kliknij link, aby zresetować hasło.';

  @override
  String get forgotPasswordBackToLogin => 'Powrót do logowania';

  @override
  String get resetPasswordTitle => 'Ustaw nowe hasło';

  @override
  String get resetPasswordDescription =>
      'Wpisz nowe hasło poniżej, aby zakończyć proces resetowania.';

  @override
  String get resetPasswordNewPassword => 'Nowe hasło';

  @override
  String get resetPasswordConfirm => 'Potwierdź nowe hasło';

  @override
  String get resetPasswordSubmit => 'Zresetuj hasło';

  @override
  String get resetPasswordMismatch => 'Hasła nie pasują do siebie.';

  @override
  String get registerTitle => 'Utwórz konto';

  @override
  String get registerDisplayName => 'Nazwa wyświetlana (opcjonalnie)';

  @override
  String get registerDisplayNameHint => 'Jak ludzie mają Cię nazywać?';

  @override
  String get registerUsername => 'Nazwa użytkownika (opcjonalnie)';

  @override
  String get registerUsernameHint =>
      'Pozostaw puste, aby uzyskać losową nazwę użytkownika';

  @override
  String get registerUsernameTagHint =>
      'Automatycznie zostanie dodany 4-cyfrowy tag, aby zapewnić unikalność';

  @override
  String get registerDateOfBirth => 'Data urodzenia';

  @override
  String get registerMonth => 'Miesiąc';

  @override
  String get registerDay => 'Dzień';

  @override
  String get registerYear => 'Rok';

  @override
  String get registerConsent =>
      'Zgadzam się na Warunki korzystania z usługi i Politykę prywatności';

  @override
  String get registerConsentPrefix => 'Zgadzam się na ';

  @override
  String get registerConsentTerms => 'Warunki korzystania z usługi';

  @override
  String get registerConsentAnd => ' i ';

  @override
  String get registerConsentPrivacy => 'Politykę prywatności';

  @override
  String get registerConfirmPassword => 'Potwierdź hasło';

  @override
  String get registerSubmit => 'Utwórz konto';

  @override
  String get registerHaveAccount => 'Masz już konto? ';

  @override
  String get registerPendingApproval =>
      'Your account request is pending approval. You can sign in after an admin approves it.';

  @override
  String get registerClosed =>
      'Registration is currently closed. Use a registration link from an admin to create an account.';

  @override
  String get passkeyNoCredentials =>
      'Nie znaleziono kluczy dostępu dla tej aplikacji. Zaloguj się zamiast tego za pomocą adresu e-mail i hasła.';

  @override
  String get passkeyDeviceNotSupported =>
      'Klucze dostępu nie są obsługiwane na tym urządzeniu.';

  @override
  String get passkeyDomainNotAssociated =>
      'Klucze dostępu nie są skonfigurowane dla tej aplikacji. Zaloguj się zamiast tego za pomocą adresu e-mail i hasła.';

  @override
  String get passkeyTimeout =>
      'Uwierzytelnianie kluczem dostępu przekroczyło limit czasu. Spróbuj ponownie.';

  @override
  String get passkeyNotAvailable =>
      'Klucze dostępu nie są dostępne dla tej aplikacji. Zaloguj się zamiast tego za pomocą adresu e-mail i hasła.';

  @override
  String get passkeyFailed =>
      'Nie udało się uwierzytelnić kluczem dostępu. Spróbuj ponownie.';

  @override
  String get errorUnableToCreateAccount =>
      'Nie można utworzyć konta. Spróbuj ponownie.';

  @override
  String get errorUnableToSignIn =>
      'Nie można się teraz zalogować. Spróbuj ponownie.';

  @override
  String get errorInvalidEmailOrPassword =>
      'Nieprawidłowy adres e-mail lub hasło.';

  @override
  String get errorUnableToSendResetLink =>
      'Nie można wysłać linku resetującego. Spróbuj ponownie.';

  @override
  String get errorUnableToResetPassword =>
      'Nie można zresetować hasła. Spróbuj ponownie.';

  @override
  String get embedInviteJoin => 'Dołącz do społeczności';

  @override
  String get embedInviteGoTo => 'Przejdź do społeczności';

  @override
  String embedInviteOnline(String count) {
    return '$count Online';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count Członków';
  }

  @override
  String get embedInviteUnknownTitle => 'Nieznane zaproszenie';

  @override
  String get embedInviteUnknownSubtitle =>
      'Spróbuj poprosić o nowe zaproszenie.';

  @override
  String get embedInviteUnavailable => 'Zaproszenie niedostępne';

  @override
  String get embedInviteJoinGroup => 'Join group';

  @override
  String get embedInviteAlreadyJoined => 'Already joined';

  @override
  String get inviteAcceptTitle => 'Zostałeś zaproszony do dołączenia';

  @override
  String get inviteAcceptJoinButton => 'Dołącz do społeczności';

  @override
  String get inviteAcceptGoToButton => 'Przejdź do społeczności';

  @override
  String get inviteAcceptInvitesPaused => 'Zaproszenia wstrzymane';

  @override
  String get inviteAcceptNotFoundTitle => 'Zaproszenie nieprawidłowe';

  @override
  String get inviteAcceptNotFoundDescription =>
      'To zaproszenie może być nieaktualne lub nieprawidłowe.';

  @override
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'Dołącz do grupy';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Zostałeś zaproszony do grupy prywatnej przez $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'kogoś';

  @override
  String get inviteAcceptEmojiPack => 'Pakiet emotikonów';

  @override
  String get inviteAcceptStickerPack => 'Pakiet naklejek';

  @override
  String get inviteAcceptInstallEmojiPack => 'Zainstaluj pakiet emotikonów';

  @override
  String get inviteAcceptInstallStickerPack => 'Zainstaluj pakiet naklejek';

  @override
  String get inviteAcceptPackInstallNote =>
      'Zaakceptowanie tego zaproszenia automatycznie zainstaluje pakiet.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Odmowa dostępu do kanału';

  @override
  String get channelAccessDeniedDescription =>
      'Nie masz dostępu do kanału, na którym wysłano tę wiadomość.';

  @override
  String get messageJumpLinkNoAccess => 'Brak dostępu';

  @override
  String get okay => 'OK';

  @override
  String get embedThemeTitle => 'Udostępniony motyw';

  @override
  String get embedThemeSubtitle =>
      'Ten klient nie obsługuje niestandardowych motywów.';

  @override
  String get embedThemeUnavailableButton => 'Motywy niedostępne';

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
  String get privacySettings => 'Ustawienia prywatności';

  @override
  String get privacyDirectMessages => 'Wiadomości prywatne';

  @override
  String get privacyDirectMessagesDescription =>
      'Zezwalaj na wiadomości prywatne od innych członków tej społeczności';

  @override
  String get privacyBotDirectMessages => 'Prywatne wiadomości od botów';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Zezwalaj botom z tej społeczności na wysyłanie Ci wiadomości prywatnych';

  @override
  String get privacyMutualDmsDisabled =>
      'Administratorzy społeczności wyłączyli otrzymywanie wiadomości prywatnych wyłącznie od wzajemnych członków tej społeczności.';

  @override
  String get communityDebug => 'Debugowanie społeczności';

  @override
  String get copiedToClipboard => 'Skopiowano do schowka';

  @override
  String get notificationSettings => 'Ustawienia powiadomień';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Wycisz $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Wyciszenie społeczności zapobiega pojawianiu się wskaźników nieprzeczytanych i powiadomień, chyba że zostaniesz wspomniany.';

  @override
  String get notificationCommunitySettings =>
      'Ustawienia powiadomień społeczności';

  @override
  String get notificationAllMessages => 'Wszystkie wiadomości';

  @override
  String get notificationOnlyMentions => 'Tylko wzmianki';

  @override
  String get notificationNothing => 'Nic';

  @override
  String get notificationSuppressEveryone => 'Tłumacz @everyone i @here';

  @override
  String get notificationSuppressRoles => 'Tłumacz wszystkie wzmianki o rolach';

  @override
  String get notificationMobilePush =>
      'Powiadomienia push na urządzeniach mobilnych';

  @override
  String get notificationOverrides => 'Nadpisywanie powiadomień';

  @override
  String get notificationSelectChannel => 'Wybierz kanał lub kategorię';

  @override
  String get notificationOnlyAtMentions => 'Tylko wzmianki @';

  @override
  String get notificationMuteChannel => 'Wycisz kanał';

  @override
  String get notificationUnmuteChannel => 'Odblokuj kanał';

  @override
  String get notificationUseCategoryDefault => 'Use Category Default';

  @override
  String get notificationUseCommunityDefault => 'Use Community Default';

  @override
  String get notificationNoCategory => 'Brak kategorii';

  @override
  String get dmMarkAsRead => 'Oznacz jako przeczytane';

  @override
  String get dmMuteConversation => 'Wycisz DM';

  @override
  String get dmUnmuteConversation => 'Odblokuj DM';

  @override
  String get dmPinDm => 'Przypnij DM';

  @override
  String get dmUnpinDm => 'Odpowiedz od przypięcia DM';

  @override
  String get dmAlwaysShowInSidebar => 'Zawsze pokazuj na pasku bocznym';

  @override
  String get dmRemoveFromAlwaysShown => 'Usuń z zawsze widocznych';

  @override
  String get dmCloseDm => 'Zamknij DM';

  @override
  String get dmCloseDmConfirmTitle => 'Zamknij DM';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Czy na pewno chcesz zamknąć swój DM z $username? Zawsze możesz go otworzyć ponownie później.';
  }

  @override
  String get dmDeleteMyMessagesTitle =>
      'Delete your messages in this conversation?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'This will permanently delete every message you have ever sent in this conversation. This cannot be undone.';

  @override
  String get dmCopyChannelId => 'Kopiuj identyfikator kanału';

  @override
  String get dmChannelIdCopied => 'Skopiowano identyfikator kanału';

  @override
  String get dmCopyUserId => 'Kopiuj identyfikator użytkownika';

  @override
  String get dmUserIdCopied => 'Skopiowano identyfikator użytkownika';

  @override
  String get dmViewProfile => 'Zobacz profil';

  @override
  String get dmVoiceCall => 'Rozpocznij rozmowę głosową';

  @override
  String get incomingVoiceCallTitle => 'Przychodzące połączenie głosowe';

  @override
  String get incomingVoiceCallAccept => 'Odbierz';

  @override
  String get incomingVoiceCallDecline => 'Odrzuć';

  @override
  String get incomingVoiceCallLabel => 'Przychodzące połączenie';

  @override
  String get incomingVoiceCallIgnore => 'Ignoruj';

  @override
  String get directVoiceCallNotEligible =>
      'Nie można rozpocząć tego połączenia. Spróbuj ponownie za chwilę.';

  @override
  String get voiceJoinCallFailed =>
      'Nie udało się połączyć z tym połączeniem. Sprawdź swoje połączenie i spróbuj ponownie.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Nie udało się dołączyć do tego połączenia. Sprawdź swoje połączenie i spróbuj ponownie.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Nie udało się zaktualizować tego połączenia na serwerze. Sprawdź swoje połączenie i spróbuj ponownie.';

  @override
  String get dmAddNote => 'Dodaj notatkę';

  @override
  String get dmEditGroup => 'Edytuj grupę';

  @override
  String get dmInviteToCommunity => 'Zaproś do społeczności';

  @override
  String get dmBlock => 'Zablokuj';

  @override
  String get dmLeaveGroup => 'Opuść grupę';

  @override
  String get dmNoCommunitiesAvailable => 'Brak dostępnych społeczności';

  @override
  String dmGroupMemberCount(int count) {
    return '$count członków';
  }

  @override
  String get dmMuteFor15Min => 'Na 15 minut';

  @override
  String get dmMuteFor30Min => 'Na 30 minut';

  @override
  String get dmMuteFor1Hour => 'Na 1 godzinę';

  @override
  String get dmMuteFor3Hours => 'Na 3 godziny';

  @override
  String get dmMuteFor4Hours => 'Na 4 godziny';

  @override
  String get dmMuteFor8Hours => 'Na 8 godzin';

  @override
  String get dmMuteFor24Hours => 'Na 24 godziny';

  @override
  String get dmMuteFor3Days => 'Na 3 dni';

  @override
  String get dmMuteForever => 'Do momentu ponownego włączenia';

  @override
  String get dmPinGroupDm => 'Przypnij grupę DM';

  @override
  String get dmUnpinGroupDm => 'Odpowiedz na czat grupowy';

  @override
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
  }

  @override
  String get dmFavoriteDm => 'Dodaj DM do ulubionych';

  @override
  String get dmUnfavoriteDm => 'Usuń DM z ulubionych';

  @override
  String get dmFavoriteGroupDm => 'Dodaj czat grupowy do ulubionych';

  @override
  String get dmUnfavoriteGroupDm => 'Usuń czat grupowy z ulubionych';

  @override
  String get dmChangeFriendNickname => 'Zmień pseudonim znajomego';

  @override
  String get dmRemoveFriend => 'Usuń znajomego';

  @override
  String get dmAddFriend => 'Dodaj znajomego';

  @override
  String get dmAcceptFriendRequest => 'Zaakceptuj prośbę o znajomość';

  @override
  String get dmIgnoreFriendRequest => 'Odrzuć prośbę o znajomość';

  @override
  String get dmFriendRequestSent => 'Wysłano prośbę o znajomość';

  @override
  String get dmUnblock => 'Odblokuj';

  @override
  String get dmDebugUser => 'Debuguj użytkownika';

  @override
  String get dmDebugChannel => 'Debuguj kanał';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => 'Przypięty DM';

  @override
  String get dmUnpinned => 'Odprięty DM';

  @override
  String get dmMuted => 'Wyciszony DM';

  @override
  String get dmUnmuted => 'Odblokowany DM';

  @override
  String get dmRemoveFriendConfirmTitle => 'Usuń znajomego';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Czy na pewno chcesz usunąć $username jako znajomego?';
  }

  @override
  String get dmBlockConfirmTitle => 'Zablokuj użytkownika';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Czy na pewno chcesz zablokować $username? Nie będzie mógł/mogła wysyłać Ci wiadomości ani próśb o znajomość.';
  }

  @override
  String get dmFriendRequestSentToast => 'Wysłano prośbę o znajomość';

  @override
  String get dmFriendRequestFailed => 'Nie udało się wysłać prośby o znajomość';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Nie udało się zaakceptować prośby o znajomość';

  @override
  String get dmRemoveFriendFailed => 'Nie udało się usunąć znajomego';

  @override
  String get dmBlockFailed => 'Nie udało się zablokować użytkownika';

  @override
  String get dmUnblockFailed => 'Nie udało się odblokować użytkownika';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Nie udało się odrzucić prośby o znajomość';

  @override
  String get dmAddFriends => 'Dodaj znajomych';

  @override
  String get addFriendSheetTitle => 'Dodaj znajomego';

  @override
  String get addFriendUsernameHint => 'Nazwa użytkownika#0000';

  @override
  String get addFriendUsernameLabel => 'Nazwa użytkownika znajomego';

  @override
  String get addFriendSendRequest => 'Wyślij prośbę';

  @override
  String get addFriendNoUserFound => 'Nie znaleziono użytkownika o tej nazwie.';

  @override
  String get addFriendInvalidUsername =>
      'Wprowadź prawidłową nazwę użytkownika (Nazwa użytkownika#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Wysłano prośbę o znajomość';

  @override
  String get addFriendClaimTitle => 'Odbierz swoje konto';

  @override
  String get addFriendClaimDescription =>
      'Odbierz swoje konto, aby wysyłać prośby o znajomość.';

  @override
  String get addFriendVerifyTitle => 'Zweryfikuj swój adres e-mail';

  @override
  String get addFriendVerifyDescription =>
      'Musisz zweryfikować swój adres e-mail, zanim będziesz mógł/mogła wysyłać prośby o znajomość.';

  @override
  String get addFriendVerifyEmail => 'Zweryfikuj e-mail';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Oczekujące prośby o znajomość ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Wysłane prośby o znajomość ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Oczekująca prośba o znajomość';

  @override
  String get addFriendOutgoingStatus => 'Wysłano prośbę o znajomość';

  @override
  String get addFriendViewProfile => 'Zobacz profil';

  @override
  String get addFriendAccept => 'Akceptuj';

  @override
  String get addFriendIgnore => 'Odrzuć';

  @override
  String get addFriendAcceptTitle => 'Zaakceptuj prośbę o znajomość';

  @override
  String get addFriendIgnoreTitle => 'Zignoruj prośbę o dodanie do znajomych';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Zaakceptować prośbę o dodanie do znajomych od $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Zignorować prośbę o dodanie do znajomych od $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Anuluj prośbę';

  @override
  String get addFriendCancelRequestFailed =>
      'Nie udało się anulować prośby o dodanie do znajomych. Spróbuj ponownie.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Obecnie nie akceptuje próśb o dodanie do znajomych.';

  @override
  String get addFriendUnblockFirst =>
      'Najpierw odblokuj tę osobę, aby wysłać prośbę o dodanie do znajomych.';

  @override
  String get addFriendCannotSendToSelf =>
      'Nie możesz wysłać prośby o dodanie do znajomych do siebie.';

  @override
  String get addFriendAlreadyFriends => 'Jesteście już znajomymi.';

  @override
  String get addFriendClaimToSend =>
      'Zakończ rejestrację, aby wysyłać prośby o dodanie do znajomych.';

  @override
  String get addFriendVerifyToSend =>
      'Verify your email before sending friend requests.';

  @override
  String get addFriendFriendsListFull =>
      'Your friends list is full, or theirs is. Remove someone and try again.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'System';

  @override
  String get emojiSearchPlaceholder => 'Znajdź emotikonę swoich marzeń';

  @override
  String get emojiSearchEmpty =>
      'Brak emotikon pasujących do Twojego wyszukiwania';

  @override
  String get emojiAutocompleteDefaultLabel => 'Domyślny emotikon';

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
  String get emojiFrequentlyUsed => 'Często używane';

  @override
  String get emojiTabGifs => 'GIF-y';

  @override
  String get emojiTabMedia => 'Multimedia';

  @override
  String get emojiTabStickers => 'Naklejki';

  @override
  String get emojiTabEmojis => 'Emotikony';

  @override
  String get gifPickerSearch => 'Szukaj GIF-ów';

  @override
  String get gifPickerSearchKlipy => 'Szukaj KLIPY';

  @override
  String get gifPickerSearchTenor => 'Szukaj Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Ulubione';

  @override
  String get gifPickerFavoritesEmptyTitle => 'No favorite GIFs yet';

  @override
  String get gifPickerFavoritesEmptyDescription => 'Star a GIF to see it here.';

  @override
  String get gifPickerTrending => 'Popularne GIF-y';

  @override
  String get gifPickerNoResultsTitle => 'Brak wyników wyszukiwania';

  @override
  String get gifPickerNoResultsDescription => 'Spróbuj innego hasła';

  @override
  String get gifPickerLoadFailedTitle => 'Nie udało się załadować GIF-ów';

  @override
  String get gifPickerLoadFailedBody =>
      'Sprawdź połączenie i spróbuj ponownie.';

  @override
  String get emojiCategoryPeople => 'Osoby';

  @override
  String get emojiCategoryNature => 'Natura';

  @override
  String get emojiCategoryFood => 'Jedzenie i picie';

  @override
  String get emojiCategoryActivity => 'Aktywności';

  @override
  String get emojiCategoryTravel => 'Podróże i miejsca';

  @override
  String get emojiCategoryObjects => 'Obiekty';

  @override
  String get emojiCategorySymbols => 'Symbole';

  @override
  String get emojiCategoryFlags => 'Flagi';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Odblokuj $emojiCount z $communityCount dzięki Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Zdobądź Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Nie pokazuj ponownie';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count niestandardowych emotikon',
      one: '1 niestandardowa emotikona',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count społeczności',
      one: '1 społeczność',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Ostrzeżenie o linku zewnętrznym';

  @override
  String externalLinkWarningLeaving(String productName) {
    return 'Opuszczasz $productName';
  }

  @override
  String get externalLinkWarningDescription =>
      'Linki zewnętrzne mogą być niebezpieczne. Prosimy o ostrożność.';

  @override
  String get externalLinkWarningDestinationUrl => 'Docelowy adres URL:';

  @override
  String get externalLinksSectionTitle => 'Linki zewnętrzne';

  @override
  String get externalLinksSectionDescription =>
      'Skonfiguruj sposób obsługi ostrzeżeń o linkach zewnętrznych.';

  @override
  String get externalLinkWarningTrustPrefix => 'Zawsze ufaj ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — pomiń to ostrzeżenie następnym razem';

  @override
  String get externalLinkVisitSite => 'Otwórz witrynę';

  @override
  String get externalLinkTrustAllLabel => 'Zaufaj wszystkim linkom zewnętrznym';

  @override
  String get externalLinkStripTrackingLabel =>
      'Usuń parametry śledzenia z adresów URL';

  @override
  String get externalLinkStripTrackingDescription =>
      'Automatycznie usuwaj parametry śledzenia (takie jak utm_source, fbclid, gclid) z adresów URL w wysyłanych wiadomościach. Czyści link przed dotarciem do kogokolwiek innego.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Zaufać wszystkim linkom zewnętrznym?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Zaufasz wszystkim linkom zewnętrznym i pominiesz ostrzeżenie dla każdej domeny. Twoje istniejące zaufane domeny zostaną zastąpione. Jest to mniej bezpieczne.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Zaufaj wszystkim';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Przestać ufać wszystkim linkom?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Ostrzeżenia dotyczące linków zewnętrznych będą ponownie wyświetlane. Będziesz musiał dodawać zaufane domeny indywidualnie.';

  @override
  String get externalLinkStopTrustingAllAction =>
      'Wyłącz zaufanie do wszystkich';

  @override
  String get externalLinkTrustedAllDescription =>
      'Wszystkim linkom zewnętrznym udzielono zaufania. Ostrzeżenia nie będą wyświetlane.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Masz $count zaufanych domen. Dodaj więcej, zaznaczając pole wyboru podczas odwiedzania linków zewnętrznych.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Po włączeniu żadne ostrzeżenia dotyczące linków zewnętrznych nie będą wyświetlane. Jest to mniej bezpieczne.';

  @override
  String get imageFileTooLarge =>
      'Plik obrazu jest za duży. Wybierz plik mniejszy niż 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Animowane awatary wymagają Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Animowane banery wymagają Plutonium';

  @override
  String get animatedAvifNotSupported => 'Animowane AVIF nieobsługiwane';

  @override
  String get animatedAvifNotSupportedBody =>
      'Przycinanie i obracanie animowanych plików AVIF nie jest jeszcze obsługiwane. Jeśli przejdziesz dalej, plik zostanie przesłany w oryginalnej formie.';

  @override
  String get uploadAsIs => 'Prześlij jako jest';

  @override
  String get croppingAnimatedNotSupported =>
      'Przycinanie animowanych obrazów nie jest jeszcze obsługiwane. Użyty zostanie oryginalny plik.';

  @override
  String get cropAvatar => 'Przytnij awatar';

  @override
  String get cropBanner => 'Przytnij baner';

  @override
  String get skip => 'Pomiń';

  @override
  String get crop => 'Przytnij';

  @override
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => 'Zmień swój Nazwa użytkownika';

  @override
  String get fluxerTagInputLabel => 'Nazwa użytkownika';

  @override
  String get fluxerTagDescriptionBase =>
      'Nazwy użytkowników mogą zawierać tylko litery (a-z, A-Z), cyfry (0-9) i podkreślenia. Nazwy użytkowników nie rozróżniają wielkości liter.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Nazwy użytkowników mogą zawierać tylko litery (a-z, A-Z), cyfry (0-9) i podkreślenia. Nazwy użytkowników nie rozróżniają wielkości liter. Możesz wybrać dowolny dostępny 4-cyfrowy tag od #0000 do #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Nazwy użytkowników mogą zawierać tylko litery (a-z, A-Z), cyfry (0-9) i podkreślenia. Nazwy użytkowników nie rozróżniają wielkości liter. Możesz wybrać dowolny dostępny 4-cyfrowy tag od #0001 do #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Od $min do $max znaków';
  }

  @override
  String get validationAllowedChars =>
      'Tylko litery (a-z, A-Z), cyfry (0-9) i podkreślenia (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Zdobądź Plutonium, aby dostosować swój tag lub zachować go podczas zmiany nazwy użytkownika';

  @override
  String get fluxerTagAlreadyTaken => 'Nazwa użytkownika jest już zajęty';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Nazwa użytkownika $username#$discriminator jest już zajęty. Kontynuowanie spowoduje automatyczne ponowne wylosowanie Twojego dyskryminatora.';
  }

  @override
  String get customTagIsTemporary => 'Niestandardowy tag jest tymczasowy';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Twój niestandardowy 4-cyfrowy tag jest dostępny tylko wtedy, gdy Twoja subskrypcja Plutonium jest aktywna. Kiedy Twoja subskrypcja wygaśnie $date, Twój tag zostanie przywrócony do losowo przypisanej liczby po 3-dniowym okresie karencji.';
  }

  @override
  String get customTagTemporaryBody =>
      'Twój niestandardowy 4-cyfrowy tag jest dostępny tylko przez czas trwania aktywnej subskrypcji Plutonium. Po wygaśnięciu subskrypcji, po 3-dniowym okresie karencji, Twój tag zostanie zastąpiony losowo przypisanym numerem.';

  @override
  String get iUnderstandContinue => 'Rozumiem, kontynuuj';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Jeśli zapiszesz ten Nazwa użytkownika, Twój niestandardowy 4-cyfrowy tag zostanie zastąpiony losowym numerem po zakończeniu subskrypcji Plutonium. Jeśli Twoja subskrypcja nie zostanie odnowiona, będziesz mieć 3-dniowy okres karencji, zanim tag się zmieni.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Twój niestandardowy 4-cyfrowy tag (#$discriminator) jest aktywny podczas trwania subskrypcji Plutonium. Jeśli Twoja subskrypcja wygaśnie lub nie zostanie odnowiona po 3-dniowym okresie karencji, Twój tag zostanie zastąpiony losowym numerem.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Dostosuj swój 4-cyfrowy tag lub zachowaj go podczas zmiany nazwy użytkownika';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Twój okres próbny Plutonium wygasa $date. Uaktualnij, aby zachować swój niestandardowy tag i zdobyć odznakę w swoim profilu.';
  }

  @override
  String get premiumTrialActive =>
      'Jesteś w okresie próbnym Plutonium. Uaktualnij, aby zachować swój niestandardowy tag i zdobyć odznakę w swoim profilu.';

  @override
  String get fluxerTagUpdated => 'Nazwa użytkownika zaktualizowany';

  @override
  String get fluxerTagUpdateFailed =>
      'Nie udało się zaktualizować Nazwa użytkownika. Spróbuj ponownie.';

  @override
  String get continueAction => 'Kontynuuj';

  @override
  String get profileCustomizationTitle => 'Personalizacja profilu';

  @override
  String get profileCustomizationDescription =>
      'Edytuj wygląd swojego profilu i zobacz podgląd na żywo';

  @override
  String get usernameLabel => 'Nazwa użytkownika';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Zweryfikuj konto, aby zmienić swój Nazwa użytkownika';

  @override
  String get changeFluxerTag => 'Zmień Nazwa użytkownika';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Dostosuj swój 4-cyfrowy tag (#$discriminator) do swoich potrzeb dzięki Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Zmień swoją nazwę użytkownika i 4-cyfrowy tag';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Twój niestandardowy tag (#$discriminator) jest powiązany z Twoją subskrypcją Plutonium i po jej wygaśnięciu zostanie zastąpiony losowym tagiem.';
  }

  @override
  String get displayNameLabel => 'Wyświetlana nazwa';

  @override
  String get pronounsLabel => 'Zaimki';

  @override
  String get avatarLabel => 'Awatar';

  @override
  String get changeAvatar => 'Zmień awatar';

  @override
  String get removeAvatar => 'Usuń awatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Maks. 10 MB. Zalecane: 512×512 px';

  @override
  String get bannerLabel => 'Baner';

  @override
  String get changeBanner => 'Zmień baner';

  @override
  String get removeBanner => 'Usuń baner';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Maks. 10 MB. Minimum: 960×540 px (16:9)';

  @override
  String get accentColorLabel => 'Kolor akcentu';

  @override
  String get accentColorDescription =>
      'Dostosowuje kolor obramowania i banera na Twoim profilu';

  @override
  String get aboutMeLabel => 'O mnie';

  @override
  String get aboutMeHelperText =>
      'Możesz używać linków, emotikonów i Markdown.';

  @override
  String get emojiPickerTitle => 'Emotikony';

  @override
  String get plutoniumBadgePrivacyTitle => 'Prywatność odznaki Plutonium';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Kontroluj, jak Twoja odznaka Plutonium jest wyświetlana innym';

  @override
  String get hidePlutoniumBadgeLabel => 'Całkowicie ukryj odznakę Plutonium';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Całkowicie ukryj swoją odznakę Plutonium przed innymi użytkownikami';

  @override
  String get hidePlutoniumPurchaseDate => 'Ukryj datę zakupu Plutonium';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Ukryj datę zakupu Plutonium ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Usuń datę pierwszego zakupu Plutonium z Twojej odznaki';

  @override
  String get maskVisionaryAsSubscription => 'Ukryj Visionary jako subskrypcję';

  @override
  String get maskVisionaryDescription =>
      'Pokaż swój Visionary jako zwykłą subskrypcję';

  @override
  String get hideVisionaryIdBadge => 'Ukryj odznakę Visionary ID';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Ukryj odznakę Visionary ID (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Usuń swoją odznakę Visionary ID';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Jesteś na wersji próbnej Plutonium — Twoja subskrypcja rozpocznie się $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Twoja subskrypcja rozpocznie się automatycznie po zakończeniu wersji próbnej. Nie musisz nic robić.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Jesteś na wersji próbnej Plutonium, która wygasa $date';
  }

  @override
  String get premiumTrialActiveProfile => 'Jesteś na wersji próbnej Plutonium';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Maks. 10 MB. Zalecane: 512×512 px. Animowane awatary (GIF) wymagają Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Dostosuj swój profil za pomocą statycznego lub animowanego banera, aby się wyróżniał.';

  @override
  String get getPlutonium => 'Zdobądź Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Zakupy w aplikacji nie są jeszcze dostępne na tej platformie. Bądź na bieżąco — wkrótce!';

  @override
  String get profilePreviewLabel => 'Podgląd';

  @override
  String get profilePreviewMessage => 'Wiadomość';

  @override
  String profilePreviewMemberSince(String productName) {
    return 'Członek $productName od';
  }

  @override
  String get unclaimedAccountTitle => 'Nieodebrane konto';

  @override
  String get unclaimedAccountDescription =>
      'Twoje konto nie zostało jeszcze odebrane. Bez adresu e-mail i hasła możesz stracić dostęp. Odbierz swoje konto teraz, aby je zabezpieczyć.';

  @override
  String get claimAccount => 'Odbierz konto';

  @override
  String get profileTypeLabel => 'Typ profilu';

  @override
  String get profileTypeGlobal => 'Profil globalny';

  @override
  String get profileTypeGuildDescription =>
      'Edytujesz swój profil dla danej społeczności. Ten profil będzie widoczny tylko w tej społeczności i zastąpi Twój profil globalny.';

  @override
  String get communityNicknameLabel => 'Pseudonim w społeczności';

  @override
  String get perGuildPremiumUpsellText =>
      'Dostosowywanie awatara, banera, koloru akcentu i bio dla poszczególnych społeczności wymaga Plutonium. Pseudonim i zaimki społeczności są bezpłatne dla wszystkich.';

  @override
  String get avatarModeInherit => 'Użyj profilu globalnego';

  @override
  String get avatarModeCustom => 'Użyj niestandardowego obrazu';

  @override
  String get avatarModeUnset => 'Nie pokazuj';

  @override
  String get profileSavedToast => 'Profil zaktualizowany';

  @override
  String get profileEditButton => 'Edytuj profil';

  @override
  String get profileNoteLabel => 'Notatka';

  @override
  String get profileNoteVisibility => '(widoczne tylko dla Ciebie)';

  @override
  String get profileNoteEmpty => 'Brak notatki.';

  @override
  String get sudoTitle => 'Zweryfikuj swoją tożsamość';

  @override
  String get sudoDescription => 'Ta akcja wymaga weryfikacji, aby kontynuować.';

  @override
  String get sudoAuthenticatorCode => 'Kod uwierzytelniający';

  @override
  String get sudoMethodPassword => 'Hasło';

  @override
  String get sudoMethodTotp => 'Uwierzytelnianie';

  @override
  String get sudoVerificationFailed =>
      'Weryfikacja nie powiodła się. Spróbuj ponownie.';

  @override
  String get securityAccountTitle => 'Konto';

  @override
  String get securityAccountDescription =>
      'Zarządzaj swoim adresem e-mail, hasłem i ustawieniami konta';

  @override
  String get securitySectionTitle => 'Bezpieczeństwo';

  @override
  String get securitySectionDescription =>
      'Chroń swoje konto za pomocą uwierzytelniania dwuskładnikowego i kluczy dostępu';

  @override
  String get securityLoginEmailSectionTitle => 'Ustawienia e-mail';

  @override
  String securityLoginEmailSectionDescription(String productName) {
    return 'Zarządzaj adresem e-mail używanym do logowania się do $productName';
  }

  @override
  String get securityLoginEmailAddressLabel => 'Adres e-mail';

  @override
  String get securityLoginNoEmailSet => 'Nie ustawiono adresu e-mail';

  @override
  String get securityLoginChangeEmail => 'Zmień e-mail';

  @override
  String get securityLoginAddEmail => 'Dodaj e-mail';

  @override
  String get securityLoginReveal => 'Pokaż';

  @override
  String get securityLoginHide => 'Ukryj';

  @override
  String get securityLoginPasswordSectionTitle => 'Hasło';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Zmień hasło, aby zapewnić bezpieczeństwo konta';

  @override
  String get securityLoginCurrentPasswordLabel => 'Aktualne hasło';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Ostatnio zmieniono: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Ostatnio zmieniono: Nigdy';

  @override
  String get securityLoginNoPasswordSet => 'Nie ustawiono hasła';

  @override
  String get securityLoginChangePassword => 'Zmień hasło';

  @override
  String get securityLoginSetPassword => 'Ustaw hasło';

  @override
  String get passwordChangeTitle => 'Zmień hasło';

  @override
  String get passwordChangeIntroDescription =>
      'Wyślemy kod weryfikacyjny na Twój adres e-mail, aby potwierdzić Twoją tożsamość przed zmianą hasła.';

  @override
  String get passwordChangeStart => 'Rozpocznij';

  @override
  String get passwordChangeVerifyTitle => 'Zweryfikuj swój e-mail';

  @override
  String get passwordChangeVerifyDescription =>
      'Wprowadź kod weryfikacyjny wysłany na Twój adres e-mail.';

  @override
  String get passwordChangeVerificationCode => 'Kod weryfikacyjny';

  @override
  String get passwordChangeVerify => 'Zweryfikuj';

  @override
  String get passwordChangeNewPasswordTitle => 'Ustaw nowe hasło';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Wprowadź poniżej nowe hasło.';

  @override
  String get passwordChangeNewPassword => 'Nowe hasło';

  @override
  String get passwordChangeConfirmPassword => 'Potwierdź nowe hasło';

  @override
  String get passwordChangeSubmit => 'Zmień hasło';

  @override
  String get passwordChangeSuccess => 'Hasło zmienione';

  @override
  String get passwordChangePasswordsDoNotMatch => 'Hasła nie pasują do siebie';

  @override
  String get passwordChangeInvalidCode => 'Nieprawidłowy lub wygasły kod';

  @override
  String get emailChangeTitle => 'Zmień e-mail';

  @override
  String get emailChangeIntroDescription =>
      'Wyślemy kody weryfikacyjne, aby potwierdzić Twoją tożsamość przed zmianą adresu e-mail.';

  @override
  String get emailChangeStart => 'Rozpocznij';

  @override
  String get emailChangeVerifyOriginalTitle => 'Zweryfikuj bieżący e-mail';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Wpisz kod weryfikacyjny wysłany na Twój bieżący adres e-mail.';

  @override
  String get emailChangeNewEmailTitle => 'Wpisz nowy e-mail';

  @override
  String get emailChangeNewEmailDescription =>
      'Wpisz nowy adres e-mail, którego chcesz użyć.';

  @override
  String get emailChangeNewEmailLabel => 'Nowy e-mail';

  @override
  String get emailChangeNewEmailSubmit => 'Wyślij kod weryfikacyjny';

  @override
  String get emailChangeVerifyNewTitle => 'Zweryfikuj nowy e-mail';

  @override
  String get emailChangeVerifyNewDescription =>
      'Wpisz kod weryfikacyjny wysłany na Twój nowy adres e-mail.';

  @override
  String get emailChangeSuccess => 'E-mail zmieniony';

  @override
  String get emailChangeInvalidCode => 'Nieprawidłowy lub wygasły kod';

  @override
  String get resend => 'Wyślij ponownie';

  @override
  String resendCountdown(int seconds) {
    return 'Wyślij ponownie (${seconds}s)';
  }

  @override
  String get verificationCode => 'Kod weryfikacyjny';

  @override
  String get verify => 'Zweryfikuj';

  @override
  String get enable => 'Włącz';

  @override
  String get disable => 'Wyłącz';

  @override
  String get delete => 'Usuń';

  @override
  String get save => 'Zapisz';

  @override
  String get securityTfaSectionTitle => 'Uwierzytelnianie dwuskładnikowe';

  @override
  String get securityTfaSectionDescription =>
      'Dodaj dodatkową warstwę bezpieczeństwa do swojego konta';

  @override
  String get securityTfaAuthenticatorApp => 'Aplikacja uwierzytelniająca';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Uwierzytelnianie dwuskładnikowe jest włączone';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Użyj aplikacji uwierzytelniającej do generowania kodów do uwierzytelniania dwuskładnikowego';

  @override
  String get securityTfaBackupCodes => 'Kody zapasowe';

  @override
  String get securityTfaBackupCodesDescription =>
      'Wyświetl i zarządzaj swoimi kodami zapasowymi do odzyskiwania konta';

  @override
  String get securityTfaViewCodes => 'Wyświetl kody';

  @override
  String get securityPasskeysSectionTitle => 'Klucze dostępu';

  @override
  String get securityPasskeysSectionDescription =>
      'Używaj kluczy dostępu do logowania bez hasła i uwierzytelniania dwuskładnikowego';

  @override
  String get securityPasskeysRegistered => 'Zarejestrowane klucze dostępu';

  @override
  String get securityPasskeysNone =>
      'Nie zarejestrowano żadnych kluczy dostępu';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'klucze dostępu',
      one: 'klucz dostępu',
    );
    return '$count $_temp0 zarejestrowane (maks. 10)';
  }

  @override
  String get securityPasskeysAdd => 'Dodaj klucz dostępu';

  @override
  String securityPasskeysAdded(String date) {
    return 'Dodano: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Ostatnio użyto: $date';
  }

  @override
  String get securityPasskeysRename => 'Zmień nazwę';

  @override
  String get securityPasskeysDeleteTitle => 'Usuń klucz dostępu';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Czy na pewno chcesz usunąć klucz dostępu „$name”?';
  }

  @override
  String get securityPasskeyNameTitle => 'Nazwij klucz dostępu';

  @override
  String get securityPasskeyNameLabel => 'Nazwa klucza dostępu';

  @override
  String get securityPasskeyNameHint =>
      'np. YubiKey, iPhone, Komputer służbowy';

  @override
  String get securityPhoneSectionTitle => 'Numer telefonu';

  @override
  String get securityPhoneSectionDescription =>
      'Zarządzaj swoim numerem telefonu.';

  @override
  String get securityPhoneLabel => 'Numer telefonu';

  @override
  String get securityPhoneNone => 'Nie dodano numeru telefonu.';

  @override
  String get securityPhoneAdd => 'Dodaj telefon';

  @override
  String get securityPhoneRemove => 'Usuń';

  @override
  String get securityPhoneRemoveTitle => 'Usuń numer telefonu';

  @override
  String get securityPhoneRemoveDescription =>
      'Czy na pewno chcesz usunąć swój numer telefonu?';

  @override
  String get securityPhoneRemoved => 'Numer telefonu został usunięty';

  @override
  String get securityClaimTitle => 'Funkcje bezpieczeństwa';

  @override
  String get securityClaimDescription =>
      'Zgłoś swoje konto, aby uzyskać dostęp do funkcji bezpieczeństwa, takich jak uwierzytelnianie dwuskładnikowe i klucze dostępu.';

  @override
  String get securityVerifyEmailRequired =>
      'Musisz zweryfikować swój adres e-mail, zanim będziesz mógł skonfigurować uwierzytelnianie dwuskładnikowe, klucze dostępu lub weryfikację SMS.';

  @override
  String get totpEnableTitle => 'Skonfiguruj aplikację uwierzytelniającą';

  @override
  String get totpEnableDescription =>
      'Zeskanuj kod QR za pomocą swojej aplikacji uwierzytelniającej, aby wygenerować kody do uwierzytelniania dwuskładnikowego.';

  @override
  String get totpEnableCodeLabel => 'Kod';

  @override
  String get totpEnableCodeHint =>
      'Wpisz 6-cyfrowy kod z aplikacji uwierzytelniającej';

  @override
  String get totpEnableSuccess =>
      'Uwierzytelnianie dwuskładnikowe zostało włączone';

  @override
  String get totpDisableTitle => 'Usuń aplikację uwierzytelniającą';

  @override
  String get totpDisableDescription =>
      'Wpisz 6-cyfrowy kod z aplikacji uwierzytelniającej, aby wyłączyć uwierzytelnianie dwuskładnikowe.';

  @override
  String get totpDisableSuccess =>
      'Uwierzytelnianie dwuskładnikowe zostało wyłączone';

  @override
  String get backupCodesTitle => 'Kody zapasowe';

  @override
  String get backupCodesWarning =>
      'Jeśli stracisz dostęp do swojej aplikacji uwierzytelniającej i nie będziesz mieć tych kodów, zostaniesz na stałe zablokowany na swoim koncie. Pobierz je lub skopiuj teraz i przechowuj w bezpiecznym miejscu.';

  @override
  String get backupCodesDownload => 'Pobierz';

  @override
  String get backupCodesCopy => 'Kopiuj';

  @override
  String get backupCodesCopied => 'Kody zapasowe skopiowane do schowka';

  @override
  String get backupCodesAcknowledge =>
      'Pobrałem lub skopiowałem moje kody zapasowe i przechowuję je w bezpiecznym miejscu.';

  @override
  String get backupCodesDone => 'Gotowe';

  @override
  String get backupCodesViewTitle => 'Wyświetl kody zapasowe';

  @override
  String get backupCodesViewDescription =>
      'Przed wyświetleniem kodów zapasowych może być wymagana weryfikacja.';

  @override
  String get phoneAddTitle => 'Dodaj numer telefonu';

  @override
  String get phoneAddLabel => 'Numer telefonu';

  @override
  String get phoneAddHint => 'Wpisz swój numer telefonu';

  @override
  String get phoneAddFooter =>
      'Wpisz swój numer telefonu. Wyślemy Ci kod weryfikacyjny SMS-em.';

  @override
  String get phoneAddSendCode => 'Wyślij kod';

  @override
  String get phoneVerifyTitle => 'Zweryfikuj numer telefonu';

  @override
  String get phoneVerifyDescription =>
      'Wpisz kod weryfikacyjny wysłany na Twój numer telefonu.';

  @override
  String get phoneAddSuccess => 'Numer telefonu został dodany';

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
  String get dangerZoneSectionTitle => 'Strefa zagrożenia';

  @override
  String get dangerZoneSectionDescription =>
      'Nieodwracalne i destrukcyjne działania';

  @override
  String get dangerZoneDisableTitle => 'Wyłącz konto';

  @override
  String get dangerZoneDisableDescription =>
      'Tymczasowo wyłącz swoje konto. Możesz je reaktywować później, logując się ponownie.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Wyłączenie konta wyloguje Cię ze wszystkich sesji. Możesz ponownie aktywować konto w dowolnym momencie, logując się ponownie.';

  @override
  String get dangerZoneDeleteTitle => 'Usuń konto';

  @override
  String get dangerZoneDeleteDescription =>
      'Trwale usuń swoje konto i wszystkie powiązane dane. Tej czynności nie można cofnąć.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Anuluj swoją aktywną subskrypcję Plutonium w ustawieniach Plutonium przed usunięciem konta.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'Nie można usunąć konta';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Nie możesz usunąć swojego konta, gdy posiadasz społeczności. Najpierw przekaż własność następujących społeczności:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'i $count więcej';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Aby przekazać własność, przejdź do $settingsPath i użyj opcji przekazania własności.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Czy na pewno chcesz usunąć swoje konto? Ta akcja zaplanuje trwałe usunięcie Twojego konta.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Możesz anulować proces usuwania w ciągu 14 dni';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Po 14 dniach Twoje konto zostanie trwale usunięte';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Po przetworzeniu usunięcia nie będziesz mógł odzyskać dostępu do swojego konta';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Nie będziesz mógł usunąć wysłanych wiadomości po usunięciu konta';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Jeśli chcesz wyeksportować swoje dane lub najpierw usunąć wiadomości, odwiedź sekcję Panel Prywatności w Ustawieniach Użytkownika przed kontynuowaniem.';

  @override
  String get claimAccountTitle => 'Zgłoś swoje konto';

  @override
  String get claimAccountDescription =>
      'Zgłoś swoje konto, dodając adres e-mail i hasło. Wyślemy kod weryfikacyjny, aby potwierdzić Twój adres e-mail przed zakończeniem.';

  @override
  String get claimAccountEmailLabel => 'Adres e-mail';

  @override
  String get claimAccountPasswordLabel => 'Hasło';

  @override
  String get claimAccountSendCode => 'Wyślij kod';

  @override
  String get claimAccountVerifyDescription =>
      'Wpisz kod, który wysłaliśmy na Twój adres e-mail, aby go zweryfikować. Twoje hasło zostanie ustawione po potwierdzeniu kodu.';

  @override
  String get claimAccountSuccess => 'Konto pomyślnie odebrane';

  @override
  String get importantInformation => 'Ważne informacje:';

  @override
  String get genericError => 'Wystąpił błąd';

  @override
  String get networkErrorMessage => 'Something went wrong. Please try again.';

  @override
  String get invalidCode => 'Nieprawidłowy kod';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lat temu',
      one: 'rok temu',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count miesięcy temu',
      one: 'miesiąc temu',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dni temu',
      one: 'dzień temu',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count godzin temu',
      one: 'godzinę temu',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minut temu',
      one: 'minutę temu',
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
  String get relativeTimeJustNow => 'przed chwilą';

  @override
  String get authorizedAppsTitle => 'Autoryzowane aplikacje';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Te aplikacje otrzymały dostęp do Twojego konta $productName.';
  }

  @override
  String get authorizedAppsEmptyTitle => 'Brak autoryzowanych aplikacji';

  @override
  String get authorizedAppsEmptyDescription =>
      'Nie autoryzowałeś żadnych aplikacji do dostępu do Twojego konta.';

  @override
  String get authorizedAppsLoadError =>
      'Nie udało się załadować autoryzowanych aplikacji';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Autoryzowano $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Udzielone uprawnienia';

  @override
  String get authorizedAppsRevoke => 'Cofnij';

  @override
  String get authorizedAppsRevokeTitle => 'Cofnij dostęp aplikacji';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Czy na pewno chcesz cofnąć dostęp dla $appName? Ta aplikacja nie będzie już miała dostępu do Twojego konta.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Dostęp do podstawowych informacji o profilu (nazwa użytkownika, awatar itp.)';

  @override
  String get authorizedAppsScopeEmail => 'Wyświetl swój adres e-mail';

  @override
  String get authorizedAppsScopeGuilds =>
      'Wyświetl społeczności, do których należysz';

  @override
  String get authorizedAppsScopeConnections => 'Wyświetl swoje połączone konta';

  @override
  String get authorizedAppsScopeBot =>
      'Dodaj bota do społeczności z żądanymi uprawnieniami';

  @override
  String get authorizedAppsScopeAdmin =>
      'Dostęp do punktów końcowych administracyjnych';

  @override
  String get privacyPendingDeletionTitle => 'Oczekujące usunięcie';

  @override
  String get blockedUsersTitle => 'Zablokowani użytkownicy';

  @override
  String get blockedUsersDescription =>
      'Zablokowani użytkownicy nie mogą wysyłać Ci próśb o dodanie do znajomych ani wiadomości bezpośrednich.';

  @override
  String get blockedUsersEmptyTitle => 'Brak zablokowanych użytkowników';

  @override
  String get blockedUsersEmptyDescription => 'Nie zablokowałeś jeszcze nikogo.';

  @override
  String get blockedUsersLoadError =>
      'Nie udało się załadować zablokowanych użytkowników';

  @override
  String get blockedUsersUnblock => 'Odblokuj';

  @override
  String get blockedUsersUnblockTitle => 'Odblokuj użytkownika';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Czy na pewno chcesz odblokować $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Kopiuj Nazwa użytkownika';

  @override
  String get blockedUsersCopyId => 'Kopiuj identyfikator użytkownika';

  @override
  String get userProfileLoadError => 'Nie udało się załadować profilu';

  @override
  String get userProfileLoading => 'Loading profile';

  @override
  String get userProfileRetry => 'Ponów próbę';

  @override
  String get userProfileMessage => 'Wiadomość';

  @override
  String get userProfileVoiceCall => 'Połączenie głosowe';

  @override
  String get userProfileVideoCall => 'Połączenie wideo';

  @override
  String get userProfileEditProfile => 'Edytuj profil';

  @override
  String userProfileStaffBadgeTooltip(String productName) {
    return 'Zespół $productName';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return 'Społeczność $productName';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return 'Partner $productName';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return 'Łowca Błędów $productName';
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
    return 'subskrybent $productName Plutonium od $date';
  }

  @override
  String userProfileVisionaryBadgeTooltip(String productName) {
    return 'Wizjoner $productName';
  }

  @override
  String userProfileVisionaryBadgeSinceTooltip(
    String productName,
    String date,
  ) {
    return 'Wizjoner $productName od $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'ID Wizjonera #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Wspólni znajomi ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Wspólne społeczności ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Wspólni znajomi';

  @override
  String get userProfileMutualCommunitiesTitle => 'Wspólne społeczności';

  @override
  String get userProfileNoMutualFriends =>
      'Nie znaleziono wspólnych znajomych.';

  @override
  String get userProfileNoMutualCommunities =>
      'Nie znaleziono wspólnych społeczności.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Pseudonim: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Otwórz DM';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Zablokowałeś $username. Nie będziesz mógł wysyłać wiadomości, chyba że cofniesz blokadę.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Odblokuj';

  @override
  String get userProfileOpenDm => 'Otwórz DM';

  @override
  String get userProfileNoteTitle => 'Notatka';

  @override
  String get userProfileNoteVisibility => '(widoczne tylko dla Ciebie)';

  @override
  String get userProfileNoteSave => 'Zapisz';

  @override
  String get userProfileNoteDelete => 'Usuń';

  @override
  String get userProfileNoteEmpty => 'Kliknij, aby dodać notatkę';

  @override
  String get userProfileMemberSince => 'Członek od';

  @override
  String get userProfileAboutMe => 'O mnie';

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
  String get userProfileCopyUsername => 'Kopiuj nazwę użytkownika';

  @override
  String get userProfileCopyUserId => 'Kopiuj ID użytkownika';

  @override
  String get userProfileViewMainProfile => 'Wyświetl główny profil';

  @override
  String get userProfileViewCommunityProfile => 'Wyświetl profil społeczności';

  @override
  String get userProfileBlockUser => 'Zablokuj użytkownika';

  @override
  String get userProfileUnblockUser => 'Odblokuj użytkownika';

  @override
  String get userProfileRemoveFriend => 'Usuń znajomego';

  @override
  String get userProfileBlockConfirmTitle => 'Zablokować użytkownika';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Czy na pewno chcesz zablokować $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Odblokować użytkownika';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Czy na pewno chcesz odblokować $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Usunąć znajomego';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Czy na pewno chcesz usunąć $username z listy znajomych?';
  }

  @override
  String get userProfileFailedOpenDm => 'Nie udało się otworzyć DM';

  @override
  String get userProfileFailedSaveNote => 'Nie udało się zapisać notatki';

  @override
  String get userProfileActionFailed =>
      'Akcja nie powiodła się, spróbuj ponownie';

  @override
  String get userProfileChangeNickname => 'Zmień pseudonim';

  @override
  String get userProfileKick => 'Wyrzuć';

  @override
  String get userProfileBan => 'Zbanuj';

  @override
  String get userProfileTimeout => 'Ucisz';

  @override
  String get userProfileRemoveTimeout => 'Usuń uciszenie';

  @override
  String get userProfileTransferOwnership => 'Przekaż własność';

  @override
  String get userProfileReportUser => 'Zgłoś użytkownika';

  @override
  String get userProfileReportMessage => 'Zgłoś wiadomość';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Wyrzucić $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Czy na pewno chcesz wyrzucić $username? Może on/ona dołączyć ponownie z nowym zaproszeniem.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Usunąć wyciszenie?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Usunięcie wyciszenia pozwoli $username ponownie wysyłać wiadomości, reagować i dołączać do kanałów głosowych.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Przekazać własność?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Przekazać własność tej społeczności użytkownikowi $username? Jest to nieodwracalne i stracisz wszystkie uprawnienia właściciela.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Zbanuj $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Czas trwania bana';

  @override
  String get userProfileBanCustomSecondsLabel =>
      'Niestandardowy czas trwania (sekundy)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Dowolna wartość od $min do $max sekund';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Usuń historię wiadomości';

  @override
  String get userProfileBanDeleteNone => 'Nie usuwaj niczego';

  @override
  String get userProfileBanDelete24h => 'Poprzednie 24 godziny';

  @override
  String get userProfileBanDelete7d => 'Poprzednie 7 dni';

  @override
  String get userProfileBanReasonLabel => 'Powód (opcjonalnie)';

  @override
  String get userProfileBanReasonHint => 'Wpisz powód bana';

  @override
  String get userProfileBanSubmit => 'Zbanuj członka';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Wycisz $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Czas trwania wyciszenia';

  @override
  String get userProfileTimeoutSubmit => 'Wycisz członka';

  @override
  String get userProfileNicknameLabel => 'Pseudonim';

  @override
  String get userProfileNicknameHint => 'Wpisz pseudonim';

  @override
  String get userProfileNicknameSave => 'Zapisz';

  @override
  String userProfileKickSuccess(String username) {
    return 'Wyrzucono $username';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Zbanowano $username';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Wyciszono $username';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Usunięto wyciszenie dla $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Pseudonim zaktualizowany';

  @override
  String get userProfileTransferSuccess => 'Własność przekazana';

  @override
  String get durationPermanent => 'Na stałe';

  @override
  String get duration60Seconds => '60 sekund';

  @override
  String get duration5Minutes => '5 minut';

  @override
  String get duration10Minutes => '10 minut';

  @override
  String get duration1Hour => '1 godzina';

  @override
  String get duration12Hours => '12 godzin';

  @override
  String get duration1Day => '1 dzień';

  @override
  String get duration3Days => '3 dni';

  @override
  String get duration5Days => '5 dni';

  @override
  String get duration1Week => '1 tydzień';

  @override
  String get duration2Weeks => '2 tygodnie';

  @override
  String get duration1Month => '1 miesiąc';

  @override
  String get durationCustom => 'Niestandardowy...';

  @override
  String get iarReportUserTitle => 'Zgłoś użytkownika';

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
  String get iarReasonInappropriateProfile => 'Nieodpowiedni profil';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Profil tego użytkownika zawiera nieodpowiednie treści';

  @override
  String typingIndicatorOne(String name) {
    return 'Pisze $name...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return 'Piszą $name1 i $name2...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return 'Piszą $name1, $name2 i $name3...';
  }

  @override
  String get typingIndicatorMultiple => 'Kilka osób pisze...';

  @override
  String get typingIndicatorHandful =>
      'Zbiera się garstka klawiaturowych wojowników...';

  @override
  String get typingIndicatorSymphony =>
      'Rozpoczyna się symfonia stukających klawiszy...';

  @override
  String get typingIndicatorFiesta => 'To tutaj pełnoprawna fiesta pisania';

  @override
  String get typingIndicatorApocalypse => 'Wow, to jakaś apokalipsa pisania';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Miło cię tu widzieć, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Witaj, $username! Rozgość się.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Cześć, $username! Miło cię tu widzieć.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Cześć, $username! Dołącz, kiedy będziesz gotowy.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Hej $username, miło cię tu widzieć!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Hej, $username! Mam nadzieję, że będziesz się dobrze bawić.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Hej, $username, witaj na pokładzie!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Cieszę się, że dotarłeś, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Witaj, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Witaj, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Witaj, $username! Cieszymy się, że tu jesteś.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Witaj, $username! Mam nadzieję, że miło spędzisz tu czas.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Witaj, $username! Twoja następna rozmowa zaczyna się tutaj.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Witaj, $username. Cieszymy się, że tu jesteś.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Miło cię widzieć, $username! Witaj.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Jesteś tutaj, $username! Dobrze, że jesteś z nami.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Dotarłeś, $username! Zacznijmy.';
  }

  @override
  String get relativeTimeShortNow => 'teraz';

  @override
  String relativeTimeShortMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count min',
      one: '1 min',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count godz.',
      one: '1 godz.',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count d',
      one: '1 d',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mies.',
      one: '1 mies.',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lat',
      one: '1 rok',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'Moje urządzenia';

  @override
  String get linkedDevicesDescription =>
      'Zobacz wszystkie urządzenia, które są aktualnie zalogowane na Twoim koncie. Wyloguj wszystkie sesje, których nie rozpoznajesz.';

  @override
  String get linkedDevicesCurrentDevice => 'Aktualne urządzenie';

  @override
  String get linkedDevicesOtherDevices => 'Inne urządzenia';

  @override
  String get linkedDevicesEnterSelection => 'Wejdź w tryb zaznaczania';

  @override
  String get linkedDevicesExitSelection => 'Wyjdź z trybu zaznaczania';

  @override
  String get linkedDevicesSelectAll => 'Zaznacz wszystko';

  @override
  String get linkedDevicesClearSelection => 'Wyczyść zaznaczenie';

  @override
  String get linkedDevicesRevokeTooltip => 'Wyloguj urządzenie';

  @override
  String get linkedDevicesSignOutAll => 'Wyloguj wszystkie inne urządzenia';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Wyloguj $count urządzeń',
      one: 'Wyloguj 1 urządzenie',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Wyloguj $count urządzeń',
      one: 'Wyloguj 1 urządzenie',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Wyloguj wszystkie inne urządzenia';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Spowoduje to wylogowanie zaznaczonych urządzeń z Twojego konta. Będziesz musiał/a ponownie zalogować się na tych urządzeniach.',
      one:
          'Spowoduje to wylogowanie zaznaczonego urządzenia z Twojego konta. Będziesz musiał/a ponownie zalogować się na tym urządzeniu.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Spowoduje to wylogowanie zaznaczonych urządzeń z Twojego konta. Będziesz musiał/a ponownie zalogować się na tych urządzeniach.';

  @override
  String get linkedDevicesSignOutConfirm => 'Kontynuuj';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Będziesz musiał/a ponownie zalogować się na wszystkich wylogowanych urządzeniach';

  @override
  String get linkedDevicesLoadErrorTitle => 'Błąd sieci';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Mamy problem z połączeniem z kontinuum czasoprzestrzennym. Sprawdź swoje połączenie i spróbuj ponownie.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Urządzenia wylogowane',
      one: 'Urządzenie wylogowane',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'Nie udało się wylogować. Spróbuj ponownie.';

  @override
  String get linkedDevicesUnknownOs => 'Nieznany system operacyjny';

  @override
  String get linkedDevicesUnknownPlatform => 'Nieznana platforma';

  @override
  String slowmodeLabel(String duration) {
    return 'Tryb spowolnienia $duration';
  }

  @override
  String get slowmodeTooltipActive =>
      'Jesteś w trybie spowolnienia. Poczekaj przed wysłaniem kolejnej wiadomości.';

  @override
  String get slowmodeTooltipImmune =>
      'Tryb spowolnienia jest włączony, ale jesteś zwolniony/a.';

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
      'Nie możesz wysyłać wiadomości na tym kanale.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Ogłoszenia systemowe od pracowników $productName. Nie możesz odpowiedzieć tutaj.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Wysyłanie wiadomości jest tymczasowo wstrzymane w tej społeczności.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Zostałeś wyciszony. Wysyłanie wiadomości, reakcje i rozmowy głosowe są wstrzymane do czasu wygaśnięcia wyciszenia.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Musisz odebrać swoje konto, aby wysyłać wiadomości w tej społeczności.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Musisz zweryfikować swój adres e-mail, aby wysyłać wiadomości w tej społeczności.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Twoje konto jest za nowe, aby wysyłać wiadomości w tej społeczności.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Nie jesteś członkiem tej społeczności wystarczająco długo, aby wysyłać wiadomości.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Musisz zweryfikować numer telefonu, aby wysyłać wiadomości w tej społeczności.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Zweryfikuj e-mail';

  @override
  String get channelComposerBarrierVerifyPhone => 'Zweryfikuj telefon';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Zbyt wiele załączników (maks. $max)';
  }

  @override
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName przekracza limit rozmiaru ($fileSize)';
  }

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Te pliki są za duże, aby wysłać je razem';

  @override
  String get chatAttachmentDropToUpload => 'Upuść pliki, aby przesłać';

  @override
  String get chatAttachmentDropToSend => 'Upuść pliki, aby wysłać teraz';

  @override
  String get chatAttachmentSendVoiceMessage => 'Wyślij wiadomość głosową';

  @override
  String get voiceMessageTitle => 'Wiadomość głosowa';

  @override
  String get voiceMessageHoldHint =>
      'Przytrzymaj, aby nagrać. Przeciągnij w górę, aby zablokować, lub puść, aby wysłać.';

  @override
  String get voiceMessageDiscard => 'Odrzuć wiadomość głosową';

  @override
  String get voiceMessageSend => 'Wyślij wiadomość głosową';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Nie można rozpocząć nagrywania. Zezwól na dostęp do mikrofonu.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Nagrywanie głosu nie jest obsługiwane na tym urządzeniu.';

  @override
  String get voiceMessageMicInUse =>
      'Opuść rozmowę głosową, aby nagrać wiadomość głosową.';

  @override
  String get voiceMessageRecordingFailed =>
      'Nagrywanie nie powiodło się. Spróbuj ponownie.';

  @override
  String get voiceMessageSendFailed =>
      'Nie można wysłać wiadomości głosowej. Spróbuj ponownie.';

  @override
  String get voiceMessageRecordingHint =>
      'Mów teraz. Naciśnij Stop, gdy skończysz — możesz przyciąć później.';

  @override
  String get voiceMessageReviewHint =>
      'Przeciągnij uchwyty, aby przyciąć, a następnie naciśnij Wyślij.';

  @override
  String get voiceMessageStop => 'Stop';

  @override
  String get voiceMessageStartRecording => 'Rozpocznij nagrywanie';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Odtwórz';

  @override
  String get voiceMessagePause => 'Pauza';

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

    return 'Zaznaczenie musi trwać co najmniej ${secondsString}s.';
  }

  @override
  String get chatAttachmentEditTitle => 'Edytuj załącznik';

  @override
  String get chatAttachmentFilenameLabel => 'Nazwa pliku';

  @override
  String get chatAttachmentDescriptionLabel => 'Opis';

  @override
  String get chatAttachmentDescriptionHint => 'Opcjonalny tekst alternatywny';

  @override
  String get chatAttachmentSpoilerLabel => 'Oznacz jako spoiler';

  @override
  String get chatAttachmentRemove => 'Usuń załącznik';

  @override
  String get chatAttachmentDownload => 'Pobierz';

  @override
  String get chatAttachmentDownloadedToast => 'Saved to photos';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Couldn\'t download attachment';

  @override
  String get chatAttachmentExpiredTooltip => 'Załącznik wygasł';

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
  String get chatAttachmentSourceCamera => 'Aparat';

  @override
  String get chatAttachmentSourceBrowse => 'Przeglądaj pliki';

  @override
  String get chatAttachmentPasteTooltip => 'Wklej obraz z schowka';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Odkryj spoiler';

  @override
  String get matureMediaRevealButton => 'Odkryj';

  @override
  String get matureMediaRevealHint => 'Kliknij, aby odkryć';

  @override
  String get matureContentTitle => 'Dojrzałe treści';

  @override
  String get matureCommunityTitle => 'Dojrzała społeczność';

  @override
  String get matureCategoryTitle => 'Dojrzała kategoria';

  @override
  String get matureChannelTitle => 'Dojrzały kanał';

  @override
  String get communityContentWarningTitle =>
      'Ostrzeżenie o treści społeczności';

  @override
  String get categoryContentWarningTitle => 'Ostrzeżenie o treści kategorii';

  @override
  String get channelContentWarningTitle => 'Ostrzeżenie o treści kanału';

  @override
  String get defaultContentWarningBody => 'Zawiera treści wrażliwe.';

  @override
  String get matureCommunityBody =>
      'Ta społeczność została oznaczona jako zawierająca treści dla dorosłych i może zawierać materiały nieodpowiednie dla niektórych użytkowników.';

  @override
  String get matureCategoryBody =>
      'Ta kategoria została oznaczona jako zawierająca treści dla dorosłych i może zawierać materiały nieodpowiednie dla niektórych użytkowników.';

  @override
  String get matureChannelBody =>
      'Ten kanał został oznaczony jako zawierający treści dla dorosłych i może zawierać materiały nieodpowiednie dla niektórych użytkowników.';

  @override
  String get matureVoiceChannelBody =>
      'Ten kanał głosowy został oznaczony jako zawierający treści dla dorosłych i może zawierać materiały nieodpowiednie dla niektórych użytkowników.';

  @override
  String get matureLinkChannelBody =>
      'Ten kanał z linkami został oznaczony jako zawierający treści dla dorosłych i może otwierać materiały nieodpowiednie dla niektórych użytkowników.';

  @override
  String get matureCommunityUnavailableBody =>
      'Ta dojrzała społeczność nie jest dostępna dla Twojego konta.';

  @override
  String get matureCategoryUnavailableBody =>
      'Ta dojrzała kategoria nie jest dostępna dla Twojego konta.';

  @override
  String get matureChannelUnavailableBody =>
      'Ten dojrzały kanał nie jest dostępny dla Twojego konta.';

  @override
  String get matureContentProceedButton => 'Kontynuuj';

  @override
  String get matureContentUnderstandButton => 'Rozumiem';

  @override
  String get matureContentOpenLinkButton => 'Otwórz link';

  @override
  String get sensitiveContentSectionTitle => 'Treści wrażliwe';

  @override
  String get sensitiveContentSectionDescription =>
      'Kontroluj, jak media dla dorosłych lub wrażliwe są filtrowane w różnych kontekstach';

  @override
  String get sensitiveContentFriendDmLabel =>
      'Wiadomości bezpośrednie od znajomych';

  @override
  String get sensitiveContentNonFriendDmLabel =>
      'Wiadomości bezpośrednie od innych';

  @override
  String get sensitiveContentGuildLabel =>
      'Wiadomości na kanałach społeczności';

  @override
  String get sensitiveContentFilterShow => 'Pokaż';

  @override
  String get sensitiveContentFilterBlur => 'Rozmyj';

  @override
  String get sensitiveContentFilterBlock => 'Zablokuj';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Rozmyj multimedia do zakończenia skanowania bezpieczeństwa';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Gdy jest włączone, obrazy i filmy są rozmywane do momentu zakończenia skanowania bezpieczeństwa treści.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'To ustawienie jest zawsze włączone dla Twojego konta.';

  @override
  String get sensitiveContentResetButton => 'Resetuj';

  @override
  String get sensitiveContentSaveButton => 'Zapisz';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count plików',
      one: '1 pliku',
    );
    return 'Przesyłanie $_temp0';
  }

  @override
  String get chatCancelUpload => 'Anuluj przesyłanie';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Wygasa $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Wygasa między $start a $end';
  }

  @override
  String get connectionsTitle => 'Połączenia';

  @override
  String connectionsDescription(String productName) {
    return 'Połącz zewnętrzne konta i domeny z profilem $productName. Zweryfikowane połączenia będą widoczne w Twoim profilu dla innych.';
  }

  @override
  String get connectionsEmptyTitle => 'Brak połączeń';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Połącz swoje konto Bluesky lub zweryfikuj własność domeny, aby wyświetlić je w profilu.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Zweryfikuj własność domeny, aby wyświetlić ją w profilu.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Domena';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Dodaj połączenie Bluesky';

  @override
  String get connectionsAddDomainAriaLabel => 'Dodaj połączenie domeny';

  @override
  String get connectionEdit => 'Edytuj';

  @override
  String get connectionRemove => 'Usuń';

  @override
  String get connectionVerifiedLabel => 'To połączenie zostało zweryfikowane.';

  @override
  String get connectionUnverifiedLabel =>
      'To połączenie nie zostało zweryfikowane.';

  @override
  String get connectionAddTitle => 'Dodaj połączenie';

  @override
  String get connectionTypeLabel => 'Typ połączenia';

  @override
  String get connectionHandleLabel => 'Nazwa użytkownika';

  @override
  String get connectionDomainLabel => 'Domena';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Masz już to połączenie.';

  @override
  String get connectionConnectBluesky => 'Połącz z Bluesky';

  @override
  String get connectionContinue => 'Dalej';

  @override
  String get connectionVerifyTitle => 'Zweryfikuj połączenie';

  @override
  String get connectionVerifyInstructions =>
      'Użyj poniższego rekordu, aby udowodnić własność domeny.';

  @override
  String get connectionDnsRecordTitle => 'Rekord TXT DNS';

  @override
  String get connectionDnsHostLabel => 'Host';

  @override
  String get connectionDnsValueLabel => 'Wartość';

  @override
  String get connectionCopyHost => 'Kopiuj hosta';

  @override
  String get connectionCopyValue => 'Kopiuj wartość';

  @override
  String get connectionCopied => 'Skopiowano!';

  @override
  String get connectionTokenFileTitle => 'Umieść plik tokena';

  @override
  String get connectionTokenFileDescription =>
      'Pobierz **fluxer-verification** i umieść go w folderze **.well-known**, abyśmy mogli zweryfikować domenę.';

  @override
  String get connectionTokenFileDownload => 'Pobierz fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Plik zawiera token weryfikacyjny, który pobierzemy z **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Zapisz fluxer-verification';

  @override
  String get connectionVerifyButton => 'Weryfikuj';

  @override
  String get connectionBack => 'Wstecz';

  @override
  String get connectionEditTitle => 'Edytuj połączenie';

  @override
  String get connectionEditDescription =>
      'Wybierz, kto może widzieć to połączenie w Twoim profilu.';

  @override
  String get connectionVisibilityEveryone => 'Wszyscy';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Zezwól każdemu na zobaczenie tego połączenia w Twoim profilu';

  @override
  String get connectionVisibilityFriends => 'Znajomi';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Zezwól znajomym na zobaczenie tego połączenia';

  @override
  String get connectionVisibilityCommunityMembers => 'Członkowie społeczności';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Zezwól członkom społeczności, do których należysz, na zobaczenie tego połączenia';

  @override
  String get connectionRemoveTitle => 'Usuń połączenie';

  @override
  String get connectionRemoveDescription =>
      'Czy na pewno chcesz usunąć to połączenie? Tej akcji nie można cofnąć.';

  @override
  String get connectionRemoveConfirm => 'Usuń';

  @override
  String get connectionsLoadError => 'Nie udało się załadować połączeń';

  @override
  String get connectionsReorderError =>
      'Nie udało się zaktualizować kolejności';

  @override
  String get connectionInitiateFailed =>
      'Nie udało się rozpocząć weryfikacji. Spróbuj ponownie.';

  @override
  String get connectionVerifyFailed =>
      'Nie udało się zweryfikować. Sprawdź swój rekord DNS i spróbuj ponownie.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Nie udało się rozpocząć autoryzacji Bluesky.';

  @override
  String get connectionUpdateFailed => 'Nie udało się zaktualizować połączenia';

  @override
  String get connectionRemoveFailed => 'Nie udało się usunąć połączenia';

  @override
  String get connectionTokenSavedToast => 'Zapisano fluxer-verification';

  @override
  String get connectionTokenSaveFailedToast => 'Nie udało się zapisać pliku';

  @override
  String get connectionEnterHandle => 'Wpisz nazwę użytkownika Bluesky.';

  @override
  String get connectionEnterDomain => 'Wpisz domenę.';

  @override
  String get lookAndFeelTitle => 'Wygląd i styl';

  @override
  String get lookAndFeelThemeSectionTitle => 'Motyw';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Wybierz między ciemnym, węglowym lub jasnym wyglądem.';

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
  String get lookAndFeelThemeDark => 'Ciemny motyw';

  @override
  String get lookAndFeelThemeCoal => 'Węglowy motyw';

  @override
  String get lookAndFeelThemeLight => 'Jasny motyw';

  @override
  String get lookAndFeelThemeSystem => 'Motyw systemowy';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Synchronizuj motyw na wszystkich urządzeniach';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Gdy włączone, zmiany motywu zostaną zsynchronizowane ze wszystkimi Twoimi urządzeniami. Gdy wyłączone, to urządzenie będzie używać własnego ustawienia motywu.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Motyw systemowy automatycznie wyłącza synchronizację, aby śledzić preferencje Twojego systemu na tym urządzeniu.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Nie udało się zsynchronizować motywu z Twoim kontem. Spróbuj ponownie.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Skalowanie czcionki czatu';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Dostosuj rozmiar czcionki w obszarze czatu.';

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
  String get lookAndFeelInterfaceTitle => 'Interfejs';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Dostosuj elementy i zachowania interfejsu.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Wskaźniki pisania na liście kanałów';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Wybierz, jak wskaźniki pisania pojawiają się na liście kanałów, gdy ktoś pisze na kanale.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Wskaźnik pisania + awatary';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Pokaż wskaźnik pisania z awatarami użytkowników na liście kanałów';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Tylko wskaźnik pisania';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Pokaż tylko wskaźnik pisania bez awatarów';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Ukryty';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Nie pokazuj wskaźników pisania na liście kanałów';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Pokaż pisanie na wybranym kanale';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Gdy wyłączone (domyślnie), wskaźniki pisania nie będą pojawiać się na kanale, który aktualnie przeglądasz.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'ogólny';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Podpowiedzi klawiatury';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Kontroluj, czy podpowiedzi skrótów klawiaturowych pojawiają się w etykietkach.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Ukryj podpowiedzi klawiatury w etykietkach';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Gdy włączone, etykietki ze skrótami są ukryte w wyskakujących okienkach podpowiedzi.';

  @override
  String get lookAndFeelNekoTitle => 'Różne';

  @override
  String get lookAndFeelNekoDescription => 'Różne opcje interfejsu.';

  @override
  String get lookAndFeelShowNekoLabel => 'Pokaż Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Gdy włączone, Neko pojawia się w pobliżu paska wprowadzania tekstu na czacie.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Zachowanie podczas dołączania do kanału głosowego';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Kontroluj sposób dołączania do kanałów głosowych w społecznościach.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Wymagaj dwukrotnego kliknięcia, aby dołączyć do kanałów głosowych';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Gdy włączone, będziesz musiał dwukrotnie kliknąć kanały głosowe, aby do nich dołączyć. Gdy wyłączone (domyślnie), pojedyncze kliknięcie natychmiast dołączy do kanału.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Szybki brązowy lis przeskakuje nad leniwym psem.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Pasek boczny społeczności';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Konfiguruj sposób wyświetlania wiadomości bezpośrednich na pasku bocznym społeczności.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count społeczności są tymczasowo niedostępne z powodu awarii stabilizatora strumienia.',
      one:
          '1 społeczność jest tymczasowo niedostępna z powodu awarii stabilizatora strumienia.',
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
  String get lookAndFeelCollapseDMsLabel => 'Zwiń DM do folderu';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'Gdy włączone, nieprzeczytane wiadomości DM na pasku bocznym społeczności są zwijane do folderu na przycisku $productName. Kliknij przycisk $productName, będąc na stronie DM, aby rozwinąć lub zwinąć folder.';
  }

  @override
  String get lookAndFeelChannelListSectionTitle => 'Lista kanałów';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Kontroluj zachowanie wskaźnika nieprzeczytanych wiadomości dla wyciszonych kanałów na listach kanałów.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Pokaż wskaźnik nieprzeczytanych na wyciszonych kanałach';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Gdy włączone, wyciszone kanały pokazują wyblakły wskaźnik nieprzeczytanych po lewej stronie. Wzmianki nadal pojawiają się niezależnie od tego ustawienia.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Aktywni teraz';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Kontroluj, jak funkcja Aktywni teraz pojawia się w całej aplikacji.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Pokaż Aktywni teraz na ekranie głównym';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Pokaż Aktywni teraz na ekranie głównym, aby wyświetlić znajomych aktywnych w kanałach głosowych. Zobaczysz podgląd, kontekst kanału, kto już tam jest i szybki sposób na dołączenie.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Ulubione';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Kontroluj widoczność ulubionych w całej aplikacji.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Włącz Ulubione';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Gdy włączone, możesz oznaczać kanały jako ulubione, a pojawią się one w sekcji Ulubione. Gdy wyłączone, wszystkie elementy interfejsu związane z ulubionymi (przyciski, pozycje menu) zostaną ukryte. Twoje istniejące ulubione zostaną zachowane.';

  @override
  String get favoritesTitle => 'Ulubione';

  @override
  String get favoritesEmptyTitle => 'Brak ulubionych';

  @override
  String get favoritesEmptyDescription =>
      'Gwiazdkuj kanały z nagłówka czatu, aby zachować je tutaj.';

  @override
  String get favoritesWelcomeTitle => 'Witaj w Ulubionych';

  @override
  String get favoritesWelcomeDescription =>
      'Twoja osobista przestrzeń do szybkiego dostępu do kanałów, wiadomości prywatnych i grup, które lubisz. Naciśnij gwiazdkę przy dowolnym kanale, aby dodać go tutaj.';

  @override
  String get favoritesWelcomeTip =>
      'Nie dla Ciebie? Wyłącz to w dowolnym momencie.';

  @override
  String get favoritesDisableButton => 'Wyłącz Ulubione';

  @override
  String get favoritesAddedToast => 'Dodano do Ulubionych';

  @override
  String get favoritesRemovedToast => 'Usunięto z Ulubionych';

  @override
  String get favoritesHiddenToast => 'Ulubione ukryte';

  @override
  String get favoritesMute => 'Wycisz Ulubione';

  @override
  String get favoritesUnmute => 'Anuluj wyciszenie Ulubionych';

  @override
  String get favoritesHeaderMenu => 'Menu Ulubionych';

  @override
  String get favoritesCreateCategory => 'Utwórz kategorię';

  @override
  String get favoritesCategoryNameLabel => 'Nazwa kategorii';

  @override
  String get favoritesHideMutedChannels => 'Ukryj wyciszone kanały';

  @override
  String get favoritesShowMutedChannels => 'Pokaż wyciszone kanały';

  @override
  String get favoritesSetNickname => 'Ustaw pseudonim';

  @override
  String get favoritesNicknameLabel => 'Pseudonim';

  @override
  String get favoritesSaveNickname => 'Zapisz pseudonim';

  @override
  String get favoritesMoveToCategory => 'Przenieś do kategorii';

  @override
  String get favoritesUncategorized => 'Bez kategorii';

  @override
  String get favoritesOtherCategory => 'Inne';

  @override
  String get favoritesRemoveFromFavorites => 'Usuń z Ulubionych';

  @override
  String get favoritesAddToFavorites => 'Dodaj do Ulubionych';

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
  String get favoritesHideConfirmTitle => 'Ukryj Ulubione';

  @override
  String get favoritesHideConfirmDescription =>
      'Spowoduje to ukrycie wszystkich elementów interfejsu związanych z Ulubionymi, w tym przycisków i pozycji menu. Twoje istniejące Ulubione zostaną zachowane i można je ponownie włączyć w dowolnym momencie w Ustawienia > Zaawansowane > Wygląd.';

  @override
  String get favoritesDirectMessageSubtitle => 'Wiadomość bezpośrednia';

  @override
  String get messagesMediaDisplayGroupTitle => 'Wyświetlanie';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Kontroluj sposób wyświetlania wiadomości, multimediów i innych treści.';

  @override
  String get messagesMediaMediaGroupTitle => 'Multimedia';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Dostosuj preferencje dotyczące rozmiaru multimediów i przycisków.';

  @override
  String get messagesMediaInputGroupTitle => 'Wejście';

  @override
  String get messagesMediaInputGroupDescription =>
      'Dostosuj ustawienia wprowadzania wiadomości.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Pasek boczny';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Skonfiguruj sposób wyświetlania paska bocznego społeczności.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Ukrywaj wyciszone kanały domyślnie';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Automatycznie ukrywaj wyciszone kanały na pasku bocznym po dołączeniu do nowych społeczności';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Ukrywać wyciszone kanały domyślnie?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Nowe społeczności, do których dołączysz, będą automatycznie miały ukryte wyciszone kanały. Czy chcesz również zastosować to ustawienie do wszystkich swoich istniejących społeczności?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Przestać domyślnie ukrywać wyciszone kanały?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Nowe społeczności, do których dołączysz, nie będą już automatycznie ukrywać wyciszonych kanałów. Czy chcesz również pokazać wyciszone kanały we wszystkich swoich istniejących społecznościach?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Zastosuj do wszystkich społeczności';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Pokaż we wszystkich społecznościach';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Tylko nowe społeczności';

  @override
  String get messagesMediaDisplaySectionTitle => 'Wyświetlanie multimediów';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Kontroluj sposób wyświetlania obrazów, filmów i innych multimediów. Wszystkie multimedia są przeskalowywane i konwertowane. Bardzo duże pliki, których nie można skompresować do podglądu, nie będą osadzane niezależnie od tych ustawień.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Po opublikowaniu jako linki do czatu';

  @override
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'Po przesłaniu bezpośrednio do $productName';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Podglądy linków';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Kontroluj sposób podglądu linków do stron internetowych na czacie';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Pokazuj osadzenia i podglądaj linki do stron internetowych';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reakcje';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Konfiguruj reakcje emoji na wiadomości';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Pokaż reakcje emoji na wiadomości';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Treść ze spoilerem';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Kontroluj sposób wyświetlania treści ze spoilerem';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Pokaż treść ze spoilerem';

  @override
  String get messagesMediaSpoilersOnClickName => 'Po kliknięciu';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Pokaż treść ze spoilerem po kliknięciu';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'Na kanałach, które moderuję';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Zawsze pokazuj treść ze spoilerem na kanałach, na których masz uprawnienie „Zarządzaj wiadomościami”.';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Zawsze';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Zawsze pokazuj treść ze spoilerem';

  @override
  String get messagesMediaSizeSectionTitle =>
      'Preferencje rozmiaru multimediów';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Dostosuj maksymalny rozmiar wyświetlania multimediów osadzonych i załączonych. Mniejsze rozmiary zajmują mniej miejsca na ekranie, a większe pokazują więcej szczegółów.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Multimedia z linków (osadzone)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Przesłane załączniki';

  @override
  String get messagesMediaSizeCompactName => 'Kompaktowy (400x300)';

  @override
  String get messagesMediaSizeCompactDescription =>
      'Mniejszy rozmiar multimediów';

  @override
  String get messagesMediaSizeComfortableName => 'Wygodny (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Większy rozmiar multimediów z większą ilością szczegółów';

  @override
  String get messagesMediaGifsSectionTitle => 'Zachowanie GIF-ów';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Kontroluj sposób wstawiania GIF-ów do czatu';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Automatycznie wysyłaj GIF-y po wybraniu';

  @override
  String get messagesMediaCameraUploadsSectionTitle => 'Camera uploads';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Choose whether photos and videos taken with the in-app camera are kept on your device';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel => 'Save to device';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Autouzupełnianie wyrażeń (autouzupełnianie dwukropkiem)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Kontroluj, co pojawia się w autouzupełnianiu wyrażeń po wpisaniu dwukropka. Dostosuj sugerowane podpowiedzi do swoich preferencji.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Pokaż domyślne emoji w autouzupełnianiu wyrażeń';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Pokaż niestandardowe emoji w autouzupełnianiu wyrażeń';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Pokaż naklejki w autouzupełnianiu wyrażeń';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Pokaż zapisane multimedia w autouzupełnianiu wyrażeń';

  @override
  String get messagesMediaEditingSectionTitle => 'Edycja wiadomości';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Kontroluj, co dzieje się z wersją roboczą edycji po jej anulowaniu.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Zachowaj wersję roboczą edycji po anulowaniu';

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
      'Podglądy wiadomości DM';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Kontroluj, kiedy podglądy wiadomości są wyświetlane na liście DM.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Tryb podglądu wiadomości DM';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Wszystkie wiadomości';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Pokaż podglądy wiadomości dla wszystkich konwersacji DM';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Tylko nieprzeczytane DM';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Pokazuj podglądy wiadomości tylko dla DM z nieprzeczytanymi wiadomościami';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Brak';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Nie pokazuj podglądów wiadomości na liście DM';

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
  String get dmListSentAnAttachment => 'Wysłano załącznik';

  @override
  String systemPreviewPinnedMessage(String username) {
    return 'Użytkownik $username przypiął wiadomość na tym kanale.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return 'Użytkownik $username dodał użytkownika $userName do grupy.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return 'Użytkownik $username dodał kogoś do grupy.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return 'Użytkownik $username opuścił grupę.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username usunął(ęła) $userName z grupy.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username usunął(ęła) kogoś z grupy.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username zmienił(a) nazwę kanału na $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username zmienił(a) nazwę kanału.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username zmienił(a) ikonę kanału.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username rozpoczął(ęła) rozmowę.';
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
  String get voiceConnectionConfirmTitle =>
      'Potwierdzenie połączenia głosowego';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Już jesteś połączony(a) z tym kanałem głosowym z $count innych urządzeń. Co chcesz zrobić?',
      one:
          'Już jesteś połączony(a) z tym kanałem głosowym z 1 innego urządzenia. Co chcesz zrobić?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Przełącz na to urządzenie';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Dołącz (zachowaj inne połączenia)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Nie rób nic, nie chcę dołączać';

  @override
  String get voiceJoinFailedTitle => 'Couldn\'t Join Voice';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Couldn\'t disconnect your other devices. Try again in a moment.';

  @override
  String get voiceChannelEmptyDescription =>
      'To jest kanał głosowy. Połącz się, aby zacząć rozmawiać!';

  @override
  String get voiceChannelJoin => 'Dołącz do kanału głosowego';

  @override
  String get voiceCallJoin => 'Join call';

  @override
  String get voiceChannelJoinConnect => 'Połącz się z głosem';

  @override
  String get voiceChannelNoConnectPermission =>
      'Nie masz uprawnień do dołączenia do tego kanału głosowego';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Mikrofon, kamera i udostępniany ekran są szyfrowane end-to-end.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Mikrofon, kamera i udostępniany ekran są szyfrowane end-to-end.';

  @override
  String get voiceChannelE2eeBroken =>
      'Szyfrowanie end-to-end jest niedostępne, ponieważ na tym kanale głosowym znajduje się nieobsługiwany uczestnik.';

  @override
  String get voiceCallE2eeBroken =>
      'Szyfrowanie end-to-end jest niedostępne, ponieważ na tej rozmowie znajduje się nieobsługiwany uczestnik.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Ten klient musi zostać zaktualizowany przed dołączeniem do tej zaszyfrowanej rozmowy.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Nie udało się uruchomić mikrofonu. Nadal jesteś w rozmowie.';

  @override
  String get voiceChannelStatusConnecting => 'Łączenie...';

  @override
  String get voiceChannelStatusConnected => 'Połączono';

  @override
  String get voiceChannelStatusError => 'Błąd';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Urządzenie mobilne';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Urządzenie stacjonarne';

  @override
  String get voiceParticipantTooltipCommunityMuted =>
      'Wyciszony przez społeczność';

  @override
  String get voiceParticipantTooltipMuted => 'Wyciszony';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Uciszony przez społeczność';

  @override
  String get voiceParticipantTooltipDeafened => 'Uciszony';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Połączenie: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count uczestników',
      one: '1 uczestnik',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Opuść';

  @override
  String get voiceControlMute => 'Wycisz';

  @override
  String get voiceControlUnmute => 'Cofnij wyciszenie';

  @override
  String get voiceControlDeafen => 'Ucisz';

  @override
  String get voiceControlUndeafen => 'Cofnij uciszenie';

  @override
  String get voiceControlVideo => 'Wideo';

  @override
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'Udostępnij ekran';

  @override
  String get voiceScreenShareNotificationText => 'Udostępniasz swój ekran.';

  @override
  String get voiceControlMore => 'Więcej';

  @override
  String get voiceControlDisconnect => 'Rozłącz';

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
  String get voiceControlChat => 'Czat';

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
  String get voiceTextChatShow => 'Pokaż czat';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# nieprzeczytanymi wiadomościami',
      one: '# nieprzeczytaną wiadomością',
    );
    return 'Pokaż czat z $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Uprawnienia do kamery są wymagane do przesyłania wideo.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Nie udało się rozpocząć udostępniania ekranu. Spróbuj ponownie.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Odmówiono uprawnień do udostępniania ekranu.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Udostępnianie ekranu nie jest dostępne na tym urządzeniu.';

  @override
  String get voiceWatchStream => 'Oglądaj strumień';

  @override
  String get voiceStopWatching => 'Przestań obserwować';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Przestań obserwować bieżący strumień';

  @override
  String get voiceOwnScreenShareTitle => 'Nadajesz';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Twój strumień jest na żywo dla uczestników.';

  @override
  String get voiceLiveBadge => 'NA ŻYWO';

  @override
  String get dmVoiceViewCall => 'Zobacz rozmowę';

  @override
  String get dmVoiceCallFullScreen => 'Pełny ekran';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Otwórz rozmowę na pełnym ekranie';

  @override
  String get dmVoiceStripStatusConnecting => 'Łączenie…';

  @override
  String get dmVoiceStripStatusInCall => 'Na rozmowie';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Rozmowa głosowa';

  @override
  String get dmVoiceCallBarConnecting => 'Łączenie…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Połączenie bezpośrednie';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Rozmowa grupowa';

  @override
  String get dmVoiceCallBarIssueFallback => 'Problem z głosem';

  @override
  String get dmVoiceFullscreenTitle => 'Głos';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Połączono głosowo';

  @override
  String get notificationsPageTitle => 'Powiadomienia';

  @override
  String get notificationsFilterUnreads => 'Nieprzeczytane';

  @override
  String get notificationsFilterMentions => 'Wzmianki';

  @override
  String get notificationsBookmarksTooltip => 'Zakładki';

  @override
  String get notificationsMentionFilterTooltip => 'Filtruj wzmianki';

  @override
  String get notificationsMentionFiltersTitle => 'Filtry wzmianek';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Uwzględnij wzmianki @everyone i @here';

  @override
  String get notificationsMentionIncludeRoles => 'Uwzględnij wzmianki ról';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Uwzględnij wszystkie wzmianki społeczności';

  @override
  String get notificationsNoUnreadTitle => 'Brak nieprzeczytanych wiadomości';

  @override
  String get notificationsNoUnreadBody => 'Wszystko jest na bieżąco.';

  @override
  String get notificationsNoMentionsTitle => 'Brak ostatnich wzmianek';

  @override
  String get notificationsNoMentionsBody =>
      'Wszystkie wzmianki o Tobie pojawią się tutaj przez 7 dni.';

  @override
  String get notificationsMentionsEndTitle => 'Dotarłeś do końca';

  @override
  String get notificationsMentionsEndBody =>
      'Widziałeś wszystkie swoje ostatnie wzmianki. Nie martw się, wkrótce pojawią się kolejne.';

  @override
  String get notificationsJump => 'Przejdź';

  @override
  String get notificationsRemoveMentionTooltip => 'Usuń wzmiankę';

  @override
  String get notificationsViewAllUnread => 'Zobacz wszystkie nieprzeczytane';

  @override
  String get notificationsMarkAsRead => 'Oznacz jako przeczytane';

  @override
  String get notificationsExpand => 'Rozwiń';

  @override
  String get notificationsCollapse => 'Zwiń';

  @override
  String get notificationsMessageUnavailable =>
      'Nie można załadować tej wiadomości.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining znaków pozostało';
  }

  @override
  String get characterCounterTooLong => 'Wiadomość jest za długa';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining znaków pozostało. Uzyskaj $productName, aby pisać do $premiumMaxLength znaków.';
  }

  @override
  String get chatMessageFailedToSend => 'Nie udało się wysłać wiadomości';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Twoja wiadomość nie mogła zostać dostarczona. Zazwyczaj dzieje się tak, ponieważ nie dzielisz społeczności z odbiorcą lub odbiorca akceptuje wiadomości bezpośrednie tylko od znajomych. Może być również konieczne dostosowanie własnych ustawień prywatności wiadomości bezpośrednich w $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Twoja wiadomość nie mogła zostać dostarczona. Musisz odebrać swoje konto, aby wysyłać wiadomości bezpośrednie.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Twoja wiadomość nie mogła zostać dostarczona. Musisz odebrać swoje konto, aby wysyłać wiadomości.';

  @override
  String get chatSendFailureContentBlocked =>
      'Twoja wiadomość nie mogła zostać dostarczona, ponieważ została oznaczona przez nasze systemy bezpieczeństwa. Jeśli uważasz, że jest to błąd, skontaktuj się z pomocą techniczną.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Twoja wiadomość nie mogła zostać dostarczona, ponieważ zawiera dojrzałe emoji lub naklejki, które nie są dozwolone w tym kontekście.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'Tylko Ty możesz zobaczyć tę wiadomość.';

  @override
  String get chatClientSystemDismiss => 'Odrzuć';

  @override
  String get privacyDashboardCommunicationSection => 'Komunikacja';

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
  String get chatMessageDeleteFailed => 'Nie udało się usunąć wiadomości';

  @override
  String get chatMessageAddReaction => 'Dodaj reakcję';

  @override
  String get chatMessageEdit => 'Edytuj wiadomość';

  @override
  String get chatMessageReply => 'Odpowiedz';

  @override
  String get chatMessageForward => 'Prześlij dalej';

  @override
  String get forwardMessageTitle => 'Prześlij wiadomość';

  @override
  String get forwardSearchHint => 'Szukaj kanałów lub wiadomości prywatnych';

  @override
  String get forwardDirectMessagesSection => 'Wiadomości prywatne';

  @override
  String get forwardCommentHint => 'Dodaj komentarz (opcjonalnie)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Wyślij ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Nie znaleziono kanałów';

  @override
  String get forwardSuccessToast => 'Wiadomość przesłana';

  @override
  String get forwardFailed => 'Nie udało się przesłać wiadomości';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Komentarze są niedostępne, ponieważ wybrany kanał ma włączony tryb wolny.';

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
      'Nie możesz tu wysyłać wiadomości';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Nie możesz tu osadzać linków';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Nie możesz tu przesyłać plików';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Wysyłanie wiadomości jest wyłączone w tej społeczności';

  @override
  String get forwardDestinationTimedOut =>
      'Jesteś wyciszony w tej społeczności';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Tryb wolny – poczekaj $remaining';
  }

  @override
  String get chatMessageCopyText => 'Kopiuj wiadomość';

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
  String get chatMessagePin => 'Przypnij wiadomość';

  @override
  String get chatMessageUnpin => 'Odpowiedz wiadomość';

  @override
  String get chatMessageUnpinIt => 'Odpowiedz ją';

  @override
  String get chatMessageBookmark => 'Dodaj wiadomość do zakładek';

  @override
  String get chatMessageRemoveBookmark => 'Usuń zakładkę';

  @override
  String get chatMessageMarkAsUnread => 'Oznacz jako nieprzeczytane';

  @override
  String get chatMessageCopyMessageLink => 'Kopiuj link do wiadomości';

  @override
  String get chatMessageCopyMessageId => 'Kopiuj identyfikator wiadomości';

  @override
  String get chatMessageViewReactions => 'Zobacz reakcje';

  @override
  String get chatMessageRemoveAllReactions => 'Usuń wszystkie reakcje';

  @override
  String get chatMessageDebug => 'Debuguj wiadomość';

  @override
  String get chatMessageDebugSheetTitle => 'Debuguj wiadomość';

  @override
  String get chatMessageDebugCopyJson => 'Kopiuj JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'JSON wiadomości skopiowany do schowka';

  @override
  String get chatReactionsSheetTitle => 'Reakcje';

  @override
  String get chatReactionsSheetEmpty => 'Nikt jeszcze nie zareagował.';

  @override
  String get chatReactionAddFailed => 'Failed to add reaction';

  @override
  String get chatReactionRemoveFailed => 'Failed to remove reaction';

  @override
  String get chatMessageReport => 'Zgłoś wiadomość';

  @override
  String get iarReportMessageTitle => 'Zgłoś wiadomość';

  @override
  String get iarThisUserFallback => 'tego użytkownika';

  @override
  String get iarModalDescription =>
      'Zgłoś naruszenie zasad lub znajdź narzędzia do zarządzania kontaktami i preferencjami.';

  @override
  String get iarPathStepAriaLabel => 'Czego potrzebujesz?';

  @override
  String get iarCategoryStepTitle => 'Jaki rodzaj zasady został złamany?';

  @override
  String get iarReasonStepTitle => 'Która zasada została złamana?';

  @override
  String get iarReasonSelectHint => 'Wybierz powód';

  @override
  String get iarPickAnOptionToast => 'Wybierz opcję, aby kontynuować.';

  @override
  String get iarPickARuleToast => 'Wybierz zasadę, która została złamana.';

  @override
  String get iarPathPlatform => 'Zgłoś naruszenie zasad platformy';

  @override
  String get iarPathCommunity => 'Zgłoś moderatorom tej społeczności';

  @override
  String get iarPathPreferenceMessage => 'Nie lubię tych treści';

  @override
  String get iarCategoryTargetedHarmLabel => 'Groźby, nękanie lub krzywda';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Prześladowanie, nienawiść, przemoc, nękanie lub treści promujące samookaleczenie.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Bezpieczeństwo dzieci lub treści dla dorosłych';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Dzieci w niebezpieczeństwie, treści dla dorosłych w niewłaściwym miejscu lub niepożądane zachowanie.';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'Prywatność lub podszywanie się';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxing, stalking, podszywanie się pod kogoś lub nieodpowiedni profil.';

  @override
  String get iarCategoryDeceptionLabel =>
      'Oszustwa, złośliwe oprogramowanie lub dezinformacja';

  @override
  String get iarCategoryDeceptionDescription =>
      'Phishing, oszustwa, złośliwe linki lub fałszywe twierdzenia mogące spowodować realną szkodę.';

  @override
  String get iarCategoryIllegalOtherLabel =>
      'Nielegalna działalność lub coś innego';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Nielegalna sprzedaż, ułatwianie przestępstw lub oczywiste naruszenie zasad, które nie pasuje do powyższych kategorii.';

  @override
  String get iarReasonHarassmentLabel => 'Nękanie lub groźby';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Prześladowanie, wielokrotny niechciany kontakt, stalking lub ukierunkowana przemoc.';

  @override
  String get iarReasonHateLabel => 'Mowa nienawiści';

  @override
  String get iarReasonHateMessageDescription =>
      'Wyzwiska, odczłowieczające wypowiedzi lub ataki na grupy chronione.';

  @override
  String get iarReasonViolenceLabel => 'Przemoc lub groźby przemocy';

  @override
  String get iarReasonViolenceDescription =>
      'Wiarygodne groźby, drastyczna przemoc lub gloryfikacja przemocy.';

  @override
  String get iarReasonMatureContentLabel => 'Treści dla dorosłych lub nękanie';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Niepożądane zachowanie lub treści dla dorosłych w niewłaściwym miejscu.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Bezpieczeństwo dzieci lub wykorzystywanie nieletnich';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Treści dotyczące groomingu lub wykorzystywania dzieci.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Szkodliwa dezinformacja';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Fałszywe twierdzenia, które mogą spowodować realną szkodę.';

  @override
  String get iarReasonSpamLabel => 'Spam, oszustwa lub phishing';

  @override
  String get iarReasonSpamMessageDescription =>
      'Masowy spam, oszustwa, fałszywe konkursy lub nadużycia konta.';

  @override
  String get iarReasonMalwareLabel =>
      'Złośliwe oprogramowanie lub niebezpieczne linki';

  @override
  String get iarReasonMalwareDescription =>
      'Złośliwe oprogramowanie, kradzież danych uwierzytelniających lub szkodliwe pliki.';

  @override
  String get iarReasonPrivacyLabel => 'Naruszenie prywatności';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxing, ujawnienie prywatnych informacji lub stalking.';

  @override
  String get iarReasonImpersonationLabel =>
      'Podszywanie się lub wprowadzające w błąd media';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Udawanie kogoś innego, w tym wprowadzające w błąd treści generowane przez SI.';

  @override
  String get iarReasonIllegalLabel => 'Nielegalna działalność';

  @override
  String get iarReasonIllegalDescription =>
      'Nielegalna sprzedaż, ułatwianie przestępstw lub niezgodna z prawem działalność.';

  @override
  String get iarReasonSelfHarmLabel => 'Samookaleczenie lub samobójstwo';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Promowanie lub instrukcje zachęcające do samookaleczenia lub zaburzeń odżywiania.';

  @override
  String get iarReasonOtherLabel => 'Inne oczywiste naruszenie zasad';

  @override
  String iarReasonOtherDescription(String productName) {
    return 'Używaj tylko wtedy, gdy wyraźnie narusza zasady $productName i nie pasuje do powyższych kategorii.';
  }

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Jeśli w sprawę zamieszane jest dziecko, użyj zamiast tego „$childSafetyReason”.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Jeśli dotyczy to CSAM lub wykorzystywania nieletniego, wyślij to teraz i nie udostępniaj ponownie materiału.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Jeśli ktoś może być w bezpośrednim niebezpieczeństwie, skontaktuj się z lokalnymi służbami ratunkowymi, jeśli możesz to zrobić bezpiecznie.';

  @override
  String get iarSafetyNoteViolence =>
      'Jeśli jest to wiarygodna, bezpośrednia groźba, skontaktuj się również z lokalnymi służbami ratunkowymi.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Jeśli jest to bezpośrednia groźba terrorystyczna, skontaktuj się również z lokalnymi służbami ratunkowymi.';

  @override
  String get iarActionBlockUserTitle => 'Zablokuj tego użytkownika';

  @override
  String get iarActionBlockUserDescription =>
      'Zatrzymaj wiadomości i zaproszenia do znajomych.';

  @override
  String get iarActionBlockUserButton => 'Zablokuj';

  @override
  String get iarActionCopyMessageLinkTitle => 'Skopiuj link do wiadomości';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Udostępnij moderatorom społeczności.';

  @override
  String get iarActionCopyMessageLinkButton => 'Kopiuj';

  @override
  String get iarActionCloseDmTitle => 'Zamknij ten DM';

  @override
  String get iarActionCloseDmDescription =>
      'Nie blokuje. Możesz otworzyć ponownie później.';

  @override
  String get iarActionCloseDmButton => 'Zamknij DM';

  @override
  String get iarActionLeaveCommunityTitle => 'Opuść społeczność';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Przestań widzieć jej treści i członków.';

  @override
  String get iarActionLeaveCommunityButton => 'Opuść';

  @override
  String get iarActionDmSettingsTitle => 'Ustawienia DM i próśb o znajomość';

  @override
  String get iarActionDmSettingsDescription =>
      'Zmień, kto może się z Tobą kontaktować.';

  @override
  String get iarActionCallSettingsTitle =>
      'Ustawienia połączeń i czatów grupowych';

  @override
  String get iarActionCallSettingsDescription =>
      'Zmień, kto może do Ciebie dzwonić lub dodawać Cię.';

  @override
  String get iarActionOpenButton => 'Otwórz';

  @override
  String get iarActionDeleteMessageTitle => 'Usuń tę wiadomość';

  @override
  String get iarActionDeleteMessageDescription =>
      'Usuń ją z kanału dla wszystkich.';

  @override
  String get iarActionDeleteMessageButton => 'Usuń';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Usunięto';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Ta wiadomość została już usunięta.';

  @override
  String get iarActionBanUserTitle => 'Zbanuj tego użytkownika';

  @override
  String get iarActionBanUserDescription =>
      'Otwórz okno bana dla tej społeczności.';

  @override
  String get iarActionBanUserButton => 'Zbanuj';

  @override
  String get iarActionBanUserBannedButton => 'Zbanowano';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Ten użytkownik jest już zbanowany z tej społeczności.';

  @override
  String get iarCloseDmConfirmTitle => 'Zamknij DM';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Zamknij bieżący DM z $name. To go nie zablokuje; możesz go otworzyć ponownie później.';
  }

  @override
  String get iarSuccessTitle => 'Zgłoszenie wysłane';

  @override
  String get iarSuccessBody =>
      'Nasz zespół ds. bezpieczeństwa je analizuje. Wyślemy Ci DM i e-mail, gdy wydamy werdykt.';

  @override
  String get iarAlreadyReportedTitle => 'Już zgłoszono';

  @override
  String get iarAlreadyReportedBody =>
      'Już zgłosiłeś tę wiadomość. Nasz zespół ds. bezpieczeństwa ją analizuje.';

  @override
  String get iarBackButton => 'Wstecz';

  @override
  String get iarContinueButton => 'Dalej';

  @override
  String get iarSendReportButton => 'Wyślij zgłoszenie';

  @override
  String get iarDoneButton => 'Gotowe';

  @override
  String get iarCouldntSendToast =>
      'Nie udało się wysłać zgłoszenia. Spróbuj ponownie.';

  @override
  String get iarRateLimitedToast =>
      'Zgłaszasz zbyt szybko. Poczekaj chwilę i spróbuj ponownie.';

  @override
  String get iarReportSentToast =>
      'Zgłoszenie wysłane. Nasz zespół ds. bezpieczeństwa je przeanalizuje.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Zablokować $name? Nie będzie mógł/mogła wysyłać Ci wiadomości ani próśb o znajomość. Możesz go/ją odblokować później.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Nie udało się zablokować tego użytkownika. Spróbuj ponownie.';

  @override
  String get iarCloseDmSuccessToast => 'DM zamknięty.';

  @override
  String get iarCloseDmFailedToast =>
      'Nie udało się zamknąć tego DM. Spróbuj ponownie.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Nie udało się opuścić tej społeczności. Spróbuj ponownie.';

  @override
  String get chatMessageSuppressEmbeds => 'Ukryj osadzenia';

  @override
  String get chatMessageUnsuppressEmbeds => 'Pokaż osadzenia';

  @override
  String get chatMessageDelete => 'Usuń wiadomość';

  @override
  String get chatMessageDeleteConfirmTitle => 'Usuń wiadomość';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Czy na pewno chcesz usunąć tę wiadomość?';

  @override
  String get chatMessageDeleteAttachment => 'Delete Attachment';

  @override
  String get chatMessageEditAttachmentAltText => 'Edit Alt Text';

  @override
  String get chatMessageMore => 'Więcej';

  @override
  String get chatEditingMessage => 'Edytowanie wiadomości';

  @override
  String get chatReplyOriginalDeleted =>
      'Oryginalna wiadomość została usunięta';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Nie udało się załadować oryginalnej wiadomości';

  @override
  String get chatReplyAttachedMedia => 'Wiadomość zawiera załączone multimedia';

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
  String get chatMessagesLoadError => 'Nie udało się załadować wiadomości.';

  @override
  String get chatReplyMentionOverrideTitle =>
      'Zignorować preferencje wzmianki?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname woli być oznaczany/a w odpowiedziach. Wysłać bez wzmianki mimo to?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname woli odpowiedzi bez wzmianki @. Czy mimo to wysłać ze wzmianką?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Zignoruj preferencję';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Kliknij, aby wyłączyć pingowanie użytkownika, do którego odpisujesz.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Kliknij, aby włączyć pingowanie użytkownika, do którego odpisujesz.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Wzmiankuj odpowiadającego użytkownika';

  @override
  String get chatReplyMentionOn => 'Włączone';

  @override
  String get chatReplyMentionOff => 'Wyłączone';

  @override
  String get chatReplyCancel => 'Anuluj odpowiedź';

  @override
  String get chatEditMessageHint => 'Edytuj wiadomość';

  @override
  String get chatEditNoChanges => 'Brak zmian do zapisania';

  @override
  String get chatChannelNotReady =>
      'Ten kanał nie jest jeszcze gotowy. Spróbuj ponownie za chwilę.';

  @override
  String get chatMessageEdited => '(edytowano)';

  @override
  String get chatMessageSilent => 'To była wiadomość @silent.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Dzisiaj o $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Wczoraj o $time';
  }

  @override
  String get mediaViewerImagePreview => 'Podgląd obrazu';

  @override
  String get mediaViewerClose => 'Zamknij podgląd multimediów';

  @override
  String get mediaViewerOpenInBrowser => 'Otwórz w przeglądarce';

  @override
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

  @override
  String get mediaViewerForward => 'Prześlij dalej';

  @override
  String get mediaViewerZoomIn => 'Powiększ';

  @override
  String get mediaViewerZoomOut => 'Pomniejsz';

  @override
  String get mediaViewerPreviousAttachment => 'Poprzedni załącznik';

  @override
  String get mediaViewerNextAttachment => 'Następny załącznik';

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
  String get chatAttachmentVideoToggleControls => 'Przełącz kontrolki wideo';

  @override
  String get chatAttachmentVideoMute => 'Wycisz wideo';

  @override
  String get chatAttachmentVideoUnmute => 'Włącz dźwięk wideo';

  @override
  String get chatAttachmentVideoPlay => 'Odtwórz wideo';

  @override
  String get chatAttachmentVideoPause => 'Wstrzymaj wideo';

  @override
  String get chatAttachmentVideoProgress => 'Postęp wideo';

  @override
  String get chatVideoPlaybackFailed => 'Nie można odtworzyć tego wideo.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Powiadom użytkowników z tą rolą, którzy mają uprawnienia do przeglądania tego kanału.';

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
  String get addGuildModalTitle => 'Dodaj społeczność';

  @override
  String get addGuildModalLandingDescription =>
      'Utwórz nową społeczność lub dołącz do istniejącej.';

  @override
  String get addGuildCreateCommunity => 'Utwórz społeczność';

  @override
  String get addGuildJoinCommunity => 'Dołącz do społeczności';

  @override
  String get addGuildImportDiscordTemplate => 'Importuj szablon Discord';

  @override
  String get addGuildJoinTitle => 'Dołącz do społeczności';

  @override
  String get addGuildJoinDescription =>
      'Wprowadź link z zaproszeniem, aby dołączyć do społeczności.';

  @override
  String get addGuildInviteLinkLabel => 'Link z zaproszeniem';

  @override
  String get addGuildJoinSubmit => 'Dołącz do społeczności';

  @override
  String get addGuildInviteInvalid =>
      'To zaproszenie jest nieprawidłowe lub wygasło.';

  @override
  String get addGuildJoinFailed =>
      'Nie udało się dołączyć do społeczności. Spróbuj ponownie.';

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
  String get addGuildPackInstalled => 'Pakiet został pomyślnie zainstalowany.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Usuń wszystkie reakcje';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Czy na pewno chcesz usunąć wszystkie reakcje z tej wiadomości?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Usuń przypięcie wiadomości';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Czy chcesz cofnąć to przypięcie?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username przypiął $messageLink na tym kanale. Zobacz $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'wiadomość';

  @override
  String get systemPinMessageAllPinsLink => 'wszystkie przypięte wiadomości';

  @override
  String get channelPinsEmptyTitle => 'Brak przypiętych wiadomości';

  @override
  String get channelPinsEmptyDescription =>
      'Tutaj pojawią się przypięte wiadomości.';

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
  String get personalNotesTitle => 'Notatki osobiste';

  @override
  String get personalNotesSubtitle =>
      'Twoja prywatna przestrzeń na przemyślenia i przypomnienia';

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
    return 'Witaj na kanale $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'Na początku nic nie było. Potem pojawił się $channelName. I było dobrze.';
  }

  @override
  String get personalNotesComposerHint => 'Napisz do siebie';

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
  String get personalNotesPrivateSpace => 'Twoja prywatna przestrzeń';

  @override
  String get purgePersonalNotes => 'Usuń notatki osobiste';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Spowoduje to trwałe usunięcie każdej wiadomości i załącznika w Twoich notatkach osobistych. Nie można tego cofnąć.';

  @override
  String get purgePersonalNotesConfirmButton => 'Usuń';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Usunięto $count wiadomości z notatek osobistych';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Notatki osobiste były już puste';

  @override
  String get purgePersonalNotesFailed =>
      'Nie udało się wyczyścić notatek osobistych';

  @override
  String get userSettingsGroupYourAccount => 'TWOJE KONTO';

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
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Bezpieczeństwo i logowanie';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Prezenty i kody';

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
  String get userSettingsNavPrivacyDashboard => 'Panel prywatności';

  @override
  String get userSettingsNavAuthorizedApps => 'Autoryzowane aplikacje';

  @override
  String get userSettingsNavBlockedUsers => 'Zablokowani użytkownicy';

  @override
  String get userSettingsNavLinkedDevices => 'Połączone urządzenia';

  @override
  String get userSettingsNavConnections => 'Połączenia';

  @override
  String get userSettingsNavLookAndFeel => 'Wygląd';

  @override
  String get userSettingsNavAccessibility => 'Ułatwienia dostępu';

  @override
  String get userSettingsNavChat => 'Wiadomości i multimedia';

  @override
  String get userSettingsNavAudioAndVideo => 'Dźwięk i obraz';

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
  String get userSettingsNavLanguageAndTime => 'Język i czas';

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
  String get userSettingsNavAdvanced => 'Zaawansowane';

  @override
  String get advancedPerformanceReportingTitle => 'Raportowanie wydajności';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'Pomóż ulepszyć $productName, udostępniając anonimowe dane o awariach i wydajności.';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'Wysyłaj raporty o awariach i wydajności';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'Wszystkie raportowane dane są anonimowe i wysyłane tylko do własnej usługi monitorowania $productName — nie są używani zewnętrzni dostawcy.';
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
  String get userSettingsNavApplications => 'Aplikacje';

  @override
  String get userSettingsNavAppLogs => 'Logi aplikacji';

  @override
  String get userSettingsNavDeveloperTools => 'Narzędzia deweloperskie';

  @override
  String get userSettingsNavLimitsConfig => 'Konfiguracja limitów';

  @override
  String get userSettingsNavFeatureFlags => 'Flagi funkcji';

  @override
  String get userSettingsNavWhatsNew => 'Co nowego';

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
  String get userSettingsNavLogOut => 'Wyloguj się';

  @override
  String get quickSwitcherTabSearch => 'Szukaj';

  @override
  String get quickSwitcherTabFriends => 'Znajomi';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Szukaj kanałów, osób lub społeczności';

  @override
  String get quickSwitcherSearchFriends => 'Szukaj znajomych';

  @override
  String get quickSwitcherNoMatchesFound => 'Nie znaleziono dopasowań';

  @override
  String get quickSwitcherEmptyHint =>
      'Spróbuj innej nazwy lub użyj prefiksów @ / # / ! / * do filtrowania wyników.';

  @override
  String get quickSwitcherSectionPeople => 'Osoby';

  @override
  String get quickSwitcherSectionGroupMessages => 'Wiadomości grupowe';

  @override
  String get quickSwitcherSectionTextChannels => 'Kanały tekstowe';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Kanały głosowe';

  @override
  String get quickSwitcherSectionCommunities => 'Społeczności';

  @override
  String get quickSwitcherSectionSettings => 'Ustawienia';

  @override
  String get quickSwitcherHomeLabel => 'Start';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Wiadomości prywatne';

  @override
  String get quickSwitcherFavoritesLabel => 'Ulubione';

  @override
  String get quickSwitcherUserSettingsLabel => 'Ustawienia użytkownika';

  @override
  String get quickSwitcherNotificationsLabel => 'Powiadomienia';

  @override
  String get quickSwitcherBookmarksLabel => 'Zakładki';

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
  String get quickSwitcherMentionsLabel => 'Wzmianki';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Brak znajomych';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Dodaj znajomego, aby zacząć.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Brak znajomych pasujących do wyszukiwania';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Spróbuj innej nazwy.';

  @override
  String get quickSwitcherSearchAliasUser => 'Użytkownik';

  @override
  String get quickSwitcherSearchAliasYou => 'Ty';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'PW';

  @override
  String get quickSwitcherSearchAliasMessages => 'Wiadomości';

  @override
  String get quickSwitcherSearchAliasFav => 'Ulubione';

  @override
  String get quickSwitcherSearchAliasStarred => 'Oznaczone gwiazdką';

  @override
  String get quickSwitcherSearchAliasInbox => 'Skrzynka odbiorcza';

  @override
  String get quickSwitcherSearchAliasSaved => 'Zapisane';

  @override
  String get uiClose => 'Zamknij';

  @override
  String get chatJumpToBottom => 'Przejdź na dół';

  @override
  String get uiConfirm => 'Potwierdź';

  @override
  String get uiLoading => 'Ładowanie';

  @override
  String get uiUnsavedChanges => 'Niezapisane zmiany';

  @override
  String get uiReset => 'Resetuj';

  @override
  String get uiOpenColorPicker => 'Otwórz selektor kolorów';

  @override
  String get uiSelectPlaceholder => 'Wybierz';

  @override
  String get uiSearchPlaceholder => 'Szukaj';

  @override
  String get uiNoOptionsFound => 'Nie znaleziono opcji';

  @override
  String get uiDismissNotification => 'Odrzuć powiadomienie';

  @override
  String get uiColorPickerTitle => 'Selekto kolorów';

  @override
  String get mentionConfirmTitle => 'Wzmiankować wszystkich?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Powiadomi to $count członków. Kontynuować?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Powiadomi to $count członków online. Kontynuować?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'This will notify $count members with the $roleName role. Continue?';
  }

  @override
  String get mentionConfirmButton => 'Wzmiankuj';

  @override
  String get composerEmojiUnavailable => 'Nie możesz użyć tej emotikony tutaj.';

  @override
  String get instanceUrlLabel => 'Adres URL instancji';

  @override
  String get instanceUrlPlaceholder =>
      'Wprowadź adres URL instancji (np. fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Resetuj do Fluxer';

  @override
  String get instanceConnect => 'Połącz';

  @override
  String get instanceConnecting => 'Łączenie…';

  @override
  String get instanceConnectFailed => 'Nie udało się połączyć z instancją';

  @override
  String get recentInstances => 'Ostatnie instancje';

  @override
  String removeRecentInstance(String domain) {
    return 'Usuń $domain z ostatnich instancji';
  }

  @override
  String get instanceSheetTitle => 'Połącz z instancją';

  @override
  String get connectToDifferentInstance => 'Połącz z inną instancją';

  @override
  String get changeInstance => 'Zmień';

  @override
  String get instanceConnectionRequired =>
      'Połącz z instancją, aby się zalogować';

  @override
  String get comingSoon => 'Wkrótce';

  @override
  String get guildNavbarDirectMessages => 'Wiadomości prywatne';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Przeglądaj społeczności dostępne do odkrycia';

  @override
  String get discoveryExplore => 'Przeglądaj';

  @override
  String get discoveryExplorePublicCommunities =>
      'Przeglądaj publiczne społeczności';

  @override
  String get discoveryListingSubheading =>
      'Chcesz umieścić swoją społeczność tutaj? Złóż wniosek, jeśli spełniasz wymagania w ustawieniach swojej społeczności > Odkrywanie.';

  @override
  String get discoverySearchCommunities => 'Szukaj społeczności';

  @override
  String get discoveryFilterByLanguage => 'Filtruj według języka';

  @override
  String get discoveryAllLanguages => 'Wszystkie języki';

  @override
  String get discoveryAllCategories => 'Wszystkie';

  @override
  String get discoveryCategoryGaming => 'Gry';

  @override
  String get discoveryCategoryMusic => 'Muzyka';

  @override
  String get discoveryCategoryEntertainment => 'Rozrywka';

  @override
  String get discoveryCategoryEducation => 'Edukacja';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Nauka i technologia';

  @override
  String get discoveryCategoryContentCreator => 'Twórca treści';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime i manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Filmy i TV';

  @override
  String get discoveryCategoryOther => 'Inne';

  @override
  String get discoveryNoCommunitiesMatch =>
      'Nie znaleziono pasujących społeczności.';

  @override
  String get discoveryJoinCommunity => 'Dołącz do społeczności';

  @override
  String get discoveryJoined => 'Dołączono';

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
      other: '$countString członków',
      one: '1 członek',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Brak opisu.';

  @override
  String get discoveryCommunities => 'Społeczności';

  @override
  String get discoveryApps => 'Aplikacje';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Nie udało się dołączyć do tej społeczności';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Coś poszło nie tak. Spróbuj ponownie za chwilę.';

  @override
  String get discoveryJoinErrorFullTitle => 'Ta społeczność jest pełna';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Ta społeczność osiągnęła limit członków, więc nie możesz teraz dołączyć.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Osiągnąłeś limit społeczności';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Jesteś w maksymalnej liczbie społeczności. Opuść jedną i spróbuj ponownie.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Nie możesz dołączyć do tej społeczności';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Zostałeś zbanowany z tej społeczności.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Ta społeczność nie jest już dostępna';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Mogła opuścić odkrywanie lub wyłączyć nowe dołączenia. Odśwież stronę, a już jej nie zobaczysz.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Działasz zbyt szybko';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Poczekaj chwilę i spróbuj ponownie.';

  @override
  String get guildNavbarAddCommunity => 'Dodaj społeczność';

  @override
  String get guildNavbarHelp => 'Pomoc';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'NOWA WIADOMOŚĆ';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Zwiń $folderName';
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
  String get guildNavbarGroupDm => 'DM grupowy';

  @override
  String get guildNavbarCreateChannel => 'Utwórz kanał';

  @override
  String get guildNavbarChannelType => 'Typ kanału';

  @override
  String get guildNavbarTextChannel => 'Kanał tekstowy';

  @override
  String get guildNavbarTextChannelDescription =>
      'Wysyłaj wiadomości, obrazy, GIF-y i emotikony';

  @override
  String get guildNavbarVoiceChannel => 'Kanał głosowy';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Spotkaj się razem przez głos, wideo i udostępnianie ekranu';

  @override
  String get guildNavbarLinkChannel => 'Połącz kanał';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Szybki dostęp do zewnętrznej strony internetowej lub zasobu';

  @override
  String get guildNavbarNameLabel => 'Nazwa';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

  @override
  String get guildNavbarCreateCategory => 'Utwórz kategorię';

  @override
  String get guildNavbarNewCategoryHint => 'Nowa kategoria';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Zaproś znajomych do $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Odbiorcy zostaną przekierowani do #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Szukaj znajomych';

  @override
  String get guildNavbarNoFriendsYet => 'Jeszcze brak znajomych';

  @override
  String get guildNavbarNoResults => 'Brak wyników';

  @override
  String get guildNavbarInviteLinkPrompt => 'Lub wyślij zaproszenie znajomemu:';

  @override
  String get guildNavbarInviteLink => 'Link zaproszenia';

  @override
  String get guildNavbarCopy => 'Kopiuj';

  @override
  String get guildNavbarCopied => 'Skopiowano!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Twój link zaproszenia wygasa za 7 dni.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Ten link zaproszenia nigdy nie wygasa.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Twój link zaproszenia wygasa za $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Edytuj link zaproszenia';

  @override
  String get guildNavbarInviteLinkSettings => 'Ustawienia linku zaproszenia';

  @override
  String get guildNavbarExpireAfter => 'Wygasa po';

  @override
  String get guildNavbarMaxUses => 'Maksymalna liczba użyć';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Przyznaj tymczasowe członkostwo';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Członkowie zostaną usunięci po przejściu w tryb offline, chyba że przypisano rolę';

  @override
  String get guildNavbarCreateNewLink => 'Utwórz nowy link';

  @override
  String get guildNavbarSent => 'Wysłano';

  @override
  String get guildNavbarInvite => 'Zaproś';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Opuść społeczność';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Czy na pewno chcesz opuścić tę społeczność? Nie będziesz już widzieć żadnych wiadomości.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Opuść społeczność';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Usuń swoje wiadomości w tej społeczności?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Trwale usuń każdą wiadomość, którą tu wysłałeś, we wszystkich kanałach. Nie można tego cofnąć.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Usuń moje wiadomości';

  @override
  String get guildNavbarDeletedYourMessages => 'Usunięto Twoje wiadomości';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Nie udało się usunąć Twoich wiadomości';

  @override
  String get guildNavbarRemoveOverride => 'Usuń nadpisanie';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Wyciszono do $formattedDate';
  }

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'Dostępne tylko dla personelu $productName';
  }

  @override
  String get guildNavbarInvitesPaused =>
      'Zaproszenia są obecnie wstrzymane w tej społeczności';

  @override
  String get guildNavbarDurationNever => 'nigdy';

  @override
  String get guildNavbarDuration30Minutes => '30 minut';

  @override
  String get guildNavbarDuration1Hour => '1 godzina';

  @override
  String get guildNavbarDuration6Hours => '6 godzin';

  @override
  String get guildNavbarDuration12Hours => '12 godzin';

  @override
  String get guildNavbarDuration1Day => '1 dzień';

  @override
  String get guildNavbarDuration7Days => '7 dni';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count sekund';
  }

  @override
  String get guildNavbarNever => 'Nigdy';

  @override
  String get guildNavbarNoLimit => 'Bez limitu';

  @override
  String get guildNavbarOneUse => '1 użycie';

  @override
  String guildNavbarUses(int count) {
    return '$count użyć';
  }

  @override
  String get guildMenuMarkAsRead => 'Oznacz jako przeczytane';

  @override
  String get guildPeekMoreOptions => 'Więcej opcji';

  @override
  String get guildMenuInviteMembers => 'Zaproś członków';

  @override
  String get guildMenuCommunitySettings => 'Ustawienia społeczności';

  @override
  String get guildMenuEditCommunityProfile => 'Edytuj profil społeczności';

  @override
  String get guildMenuUnmuteCommunity => 'Wycisz społeczność';

  @override
  String get guildMenuMuteCommunity => 'Wycisz społeczność';

  @override
  String get guildMenuHideMutedChannels => 'Ukryj wyciszone kanały';

  @override
  String get guildMenuReportCommunity => 'Zgłoś społeczność';

  @override
  String get guildMenuDebugCommunity => 'Debuguj społeczność';

  @override
  String get guildMenuCopyCommunityId => 'Kopiuj ID społeczności';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Do $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Ogólne';

  @override
  String get guildMenuSettingsRoles => 'Role i uprawnienia';

  @override
  String get guildMenuSettingsEmoji => 'Niestandardowe emotikony';

  @override
  String get guildMenuSettingsStickers => 'Niestandardowe naklejki';

  @override
  String get guildMenuSettingsSafetyModeration => 'Bezpieczeństwo i moderacja';

  @override
  String get guildMenuSettingsActivityLog => 'Log aktywności';

  @override
  String get guildMenuSettingsWebhooks => 'Webhooks';

  @override
  String get guildMenuSettingsCustomInviteUrl =>
      'Niestandardowy link zaproszenia';

  @override
  String get guildMenuSettingsDiscovery => 'Odkrywanie';

  @override
  String get guildMenuSettingsMembers => 'Członkowie';

  @override
  String get guildMenuSettingsInviteLinks => 'Linki zaproszeń';

  @override
  String get guildMenuSettingsBans => 'Bany';

  @override
  String get guildMenuSettingsChannels => 'Channels';

  @override
  String get guildSettingsNoPermission =>
      'Nie masz uprawnień do przeglądania tej karty ustawień.';

  @override
  String get guildSettingsOverviewIconTitle => 'Ikona';

  @override
  String get guildSettingsUploadImage => 'Prześlij obraz';

  @override
  String get guildSettingsOverviewBannerTitle => 'Baner';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Prześlij baner dla swojego serwera.';

  @override
  String get guildSettingsOverviewNameTitle => 'Nazwa';

  @override
  String get guildSettingsOverviewNameHint => 'Moja niesamowita społeczność';

  @override
  String get guildSettingsOverviewStatsTitle => 'Statystyki';

  @override
  String get guildSettingsOverviewMembers => 'Członkowie';

  @override
  String get guildSettingsOverviewOnline => 'Online';

  @override
  String get guildSettingsRolesDescription =>
      'Używaj ról do grupowania członków i przypisywania uprawnień.';

  @override
  String get guildSettingsCreateRole => 'Utwórz rolę';

  @override
  String get guildSettingsRolesListTitle => 'Role';

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
    return 'Wykorzystano $staticCount slotów na statyczne, $animatedCount na animowane emotikony';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Brak niestandardowych emotikonów.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return 'Przesłano $count naklejek';
  }

  @override
  String get guildSettingsStickersEmpty => 'Brak niestandardowych naklejek.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Weryfikacja członków';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Wybierz, co członkowie muszą posiadać, zanim będą mogli publikować lub wysyłać wiadomości prywatne do członków społeczności.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Członkowie z rolami mogą ominąć te kontrole. W przypadku przestrzeni publicznych zalecamy włączenie weryfikacji.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Społeczności wymienione w sekcji Odkrycia wymagają co najmniej zweryfikowanego adresu e-mail. Nie można wybrać opcji Brak, gdy włączono Odkrycia.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Dojrzałe treści i ostrzeżenia o treściach';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Skonfiguruj etykietowanie dojrzałych treści i opcjonalne ostrzeżenia o treściach dla członków.';

  @override
  String get guildSettingsModerationMatureToggle => 'Dojrzałe treści';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Oznacz tę społeczność jako zawierającą dojrzałe treści.';

  @override
  String get guildSettingsVerificationNone => 'Brak';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Nie jest wymagana żadna weryfikacja.';

  @override
  String get guildSettingsVerificationLow => 'Niski';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Wymaga zweryfikowanego adresu e-mail.';

  @override
  String get guildSettingsVerificationMedium => 'Średni';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Wymaga zweryfikowanego adresu e-mail oraz konta, które istnieje od co najmniej 5 minut.';

  @override
  String get guildSettingsVerificationHigh => 'Wysoki';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Wymaga wszystkiego z poziomu średniego, a także członkostwa w społeczności od co najmniej 10 minut.';

  @override
  String get guildSettingsVerificationHighest => 'Bardzo wysoki';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Wymaga zweryfikowanego numeru telefonu.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Śledź działania moderatorów w całej społeczności.';

  @override
  String get guildSettingsAuditLogEmpty => 'Brak logów';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Działania moderacyjne i zmiany w społeczności pojawią się tutaj.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Wszyscy użytkownicy';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Wszystkie akcje';

  @override
  String get guildSettingsAuditLogNoReason => 'Nie podano powodu.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Nieznany użytkownik';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Wystąpił błąd podczas ładowania dziennika aktywności.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Nie można załadować dzienników aktywności';

  @override
  String get guildSettingsAuditLogReason => 'Powód';

  @override
  String get guildSettingsAuditLogSomeone => 'ktoś';

  @override
  String get guildSettingsAuditLogSomething => 'coś';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'nieznana jednostka';

  @override
  String get guildSettingsAuditLogNothing => 'nic';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Nieznany cel';

  @override
  String get auditLogActionGuildUpdate => 'Społeczność zaktualizowana';

  @override
  String get auditLogActionChannelCreate => 'Kanał utworzony';

  @override
  String get auditLogActionChannelUpdate => 'Kanał zaktualizowany';

  @override
  String get auditLogActionChannelDelete => 'Kanał usunięty';

  @override
  String get auditLogActionChannelOverwriteCreate => 'Nadpisanie kanału dodane';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Nadpisanie kanału zaktualizowane';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Nadpisanie kanału usunięte';

  @override
  String get auditLogActionMemberKick => 'Członek wyrzucony';

  @override
  String get auditLogActionMemberPrune => 'Członkowie usunięci';

  @override
  String get auditLogActionMemberBanAdd => 'Członek zbanowany';

  @override
  String get auditLogActionMemberBanRemove => 'Członek odbanowany';

  @override
  String get auditLogActionMemberUpdate => 'Członek zaktualizowany';

  @override
  String get auditLogActionMemberRoleUpdate => 'Role członka zaktualizowane';

  @override
  String get auditLogActionMemberMove => 'Członek przeniesiony';

  @override
  String get auditLogActionMemberDisconnect => 'Członek rozłączony';

  @override
  String get auditLogActionBotAdd => 'Bot dodany';

  @override
  String get auditLogActionRoleCreate => 'Rola utworzona';

  @override
  String get auditLogActionRoleUpdate => 'Rola zaktualizowana';

  @override
  String get auditLogActionRoleDelete => 'Usunięto rolę';

  @override
  String get auditLogActionInviteCreate => 'Utworzono zaproszenie';

  @override
  String get auditLogActionInviteUpdate => 'Zaktualizowano zaproszenie';

  @override
  String get auditLogActionInviteDelete => 'Usunięto zaproszenie';

  @override
  String get auditLogActionWebhookCreate => 'Utworzono webhook';

  @override
  String get auditLogActionWebhookUpdate => 'Zaktualizowano webhook';

  @override
  String get auditLogActionWebhookDelete => 'Usunięto webhook';

  @override
  String get auditLogActionEmojiCreate => 'Utworzono emotikonę';

  @override
  String get auditLogActionEmojiUpdate => 'Zaktualizowano emotikonę';

  @override
  String get auditLogActionEmojiDelete => 'Usunięto emotikonę';

  @override
  String get auditLogActionStickerCreate => 'Utworzono naklejkę';

  @override
  String get auditLogActionStickerUpdate => 'Zaktualizowano naklejkę';

  @override
  String get auditLogActionStickerDelete => 'Usunięto naklejkę';

  @override
  String get auditLogActionMessageDelete => 'Usunięto wiadomość';

  @override
  String get auditLogActionMessageBulkDelete => 'Usunięto wiadomości';

  @override
  String get auditLogActionMessagePin => 'Przypięto wiadomość';

  @override
  String get auditLogActionMessageUnpin => 'Odpięto wiadomość';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor zaktualizował/a ustawienia społeczności.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor utworzył/a kanał $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor zaktualizował/a kanał $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor usunął/a kanał $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor dodał/a uprawnienia kanału dla $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor dodał/a uprawnienia kanału dla $target na kanale $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor zaktualizował/a uprawnienia kanału dla $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor zaktualizował/a uprawnienia kanału dla $target na kanale $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor usunął/a uprawnienia kanału dla $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor usunął/a uprawnienia kanału dla $target na kanale $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor wyrzucił/a $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor zbanował/a $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor odblokował/a $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor zaktualizował/a $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor zaktualizował/a role dla $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor usunął/a nieaktywnych członków.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor usunął/a członków nieaktywnych od $days dni.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor przeniósł/a $target na inny kanał głosowy.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor przeniósł/a $target na kanał $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor rozłączył/a $target z kanału głosowego.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor dodał/a bota $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor utworzył/a rolę $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor zaktualizował/a rolę $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor usunął/a rolę $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor utworzył/a zaproszenie $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor utworzył/a zaproszenie $target na kanał $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor zaktualizował/a zaproszenie $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor zaktualizował/a zaproszenie $target na kanał $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor usunął/a zaproszenie $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor usunął/a zaproszenie $target na kanał $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor utworzył/a webhook $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor zaktualizował/a webhook $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor usunął/a webhook $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor dodał emotikonę $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor zaktualizował emotikonę $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor usunął emotikonę $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor dodał naklejkę $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor zaktualizował naklejkę $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor usunął naklejkę $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor usunął wiadomość.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor usunął wiadomość na kanale $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor usunął wiele wiadomości.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor usunął $count wiadomości.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor usunął wiele wiadomości na kanale $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor usunął $count wiadomości na kanale $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor przypiął wiadomość.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor przypiął wiadomość na kanale $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor odpiął wiadomość.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor odpiął wiadomość na kanale $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor wykonał akcję audytu na $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Zaktualizowano $field z $oldValue na $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Ustawiono $field na $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Usunięto $field (było $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Zaktualizowano $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Zmieniono nazwę społeczności na $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Zaktualizowano ikonę społeczności.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Zmieniono nazwę kanału na $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Usunięto temat.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Zaktualizowano temat do $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'Włączono treści dla dorosłych.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Wyłączono treści dla dorosłych.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Ustawiono pseudonim na $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Usunięto pseudonim $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Wyciszono członka.';

  @override
  String get auditLogChangeUnmutedMember => 'Od-wyciszono członka.';

  @override
  String get auditLogChangeDeafenedMember => 'Wyłączono dźwięk członkowi.';

  @override
  String get auditLogChangeUndeafenedMember => 'Włączono dźwięk członkowi.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Dodano $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Usunięto $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Kanał: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Wiadomość: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Zaproszony przez $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Usunięto # wiadomości.',
      one: 'Usunięto # wiadomość.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Usunięto # członków.',
      one: 'Usunięto # członka.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'To zaproszenie nigdy nie wygasa.';

  @override
  String get auditLogOptionTemporaryMembership =>
      'Przyznaje tymczasowe członkostwo.';

  @override
  String get auditLogOptionPermanentMembership =>
      'Przyznaje stałe członkostwo.';

  @override
  String get guildSettingsLoadMore => 'Załaduj więcej';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Zarządzaj webhookami, które wysyłają wiadomości na kanały.';

  @override
  String get guildSettingsWebhooksEmpty =>
      'Nie skonfigurowano żadnych webhooków.';

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
  String get guildSettingsCopyUrl => 'Kopiuj URL';

  @override
  String get guildSettingsCopiedUrl => 'URL skopiowany do schowka';

  @override
  String get guildSettingsDeleteWebhook => 'Usuń webhook';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Ustaw niestandardowy link zaproszenia dla swojego serwera.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Zapisz';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Użycie';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count użyć';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Złóż wniosek o umieszczenie w katalogu serwerów.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Not enough members';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Wymagane co najmniej $count członków, aby złożyć wniosek.';
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
  String get guildSettingsDiscoveryCategory => 'Kategoria';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Choose the category that best describes your community. You can change this any time.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Primary language';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'The language most of your community speaks. Used to filter Discovery results.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Opis';

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
  String get guildSettingsDiscoveryTags => 'Tagi';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Up to $maxTags tags help people find your community. They show up in Discovery search.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'gaming, sztuka, muzyka';

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
  String get guildSettingsDiscoveryApply => 'Wyślij aplikację';

  @override
  String get guildSettingsDiscoverySave => 'Save';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Wycofaj';

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
      'Wyszukuj i zarządzaj członkami serwera.';

  @override
  String get guildSettingsMembersSearchHint => 'Szukaj członków';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count członków';
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
  String get guildSettingsMembersSortNewest => 'Najnowsze najpierw';

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
      'Przeglądaj i cofaj aktywne linki zaproszeń.';

  @override
  String get guildSettingsInvitesEmpty => 'Brak aktywnych zaproszeń.';

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
    return '$uses / $maxUses użyć';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Wygasa $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Przeglądaj i zarządzaj zbanowanymi użytkownikami.';

  @override
  String get guildSettingsBansSearchHint => 'Szukaj banów';

  @override
  String get guildSettingsBansEmpty => 'Brak zbanowanych użytkowników.';

  @override
  String get guildSettingsBanPermanent => 'Permanentny ban';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Wygasa $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Wygasa';

  @override
  String get guildSettingsUnban => 'Odbanuj';

  @override
  String get guildSettingsBansLoading => 'Ładowanie zbanowanych użytkowników';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Nie znaleziono banów pasujących do Twojego wyszukiwania.';

  @override
  String get guildSettingsBanDetailsTitle => 'Szczegóły bana';

  @override
  String get guildSettingsBanViewDetails => 'Zobacz szczegóły';

  @override
  String get guildSettingsBannedOn => 'Zbanowany dnia';

  @override
  String get guildSettingsBannedBy => 'Zbanowany przez';

  @override
  String get guildSettingsRevokeBanTitle => 'Cofnij bana';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Czy na pewno chcesz cofnąć bana dla $displayName? Będzie mógł ponownie dołączyć do społeczności.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Cofnięto bana dla $displayName';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Nie udało się załadować banów. Spróbuj ponownie.';

  @override
  String get guildSettingsRevokeBanError =>
      'Nie udało się cofnąć bana. Spróbuj ponownie.';

  @override
  String get guildSettingsCommunitySettings => 'Ustawienia społeczności';

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
      'Zarządzaj profilem swojej społeczności, kanałami i domyślnymi ustawieniami.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Branding';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Zaktualizuj swój ikonę, nazwę, baner i tło zaproszenia';

  @override
  String get guildSettingsOverviewBannerUpload => 'Prześlij baner';

  @override
  String get guildSettingsOverviewIdleTitle => 'Ustawienia bezczynności';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Skonfiguruj kanał AFK i limit czasu';

  @override
  String get guildSettingsOverviewSystemTitle => 'System i powitania';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Wybierz miejsce docelowe dla wiadomości systemowych i powitalnych';

  @override
  String get guildSettingsOverviewNotificationsTitle =>
      'Domyślne powiadomienia';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Społeczności z ponad 250 osobami są automatycznie ustawiane na opcję „tylko wzmianki”. Twoje oryginalne ustawienie jest zachowane i zostanie przywrócone, jeśli społeczność spadnie poniżej 250 członków.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Zaawansowane';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Zezwalaj na elastyczne nazwy kanałów tekstowych';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Ukryj koronę właściciela społeczności';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Oderwana grafika nagłówka';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Wyświetla grafikę nagłówka w osobnej sekcji poniżej nagłówka społeczności.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Prześlij ikonę';

  @override
  String get guildSettingsOverviewRemoveImage => 'Usuń';

  @override
  String get guildSettingsOverviewSplashTitle => 'Tło zaproszenia';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'Tło osadzenia czatu';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Wyświetlane w osadzeniach zaproszeń na czacie.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Prześlij tło';

  @override
  String get guildSettingsOverviewNoCommunityBanner =>
      'Brak grafiki nagłówka społeczności';

  @override
  String get guildSettingsOverviewNoInviteBackground => 'Brak tła zaproszenia';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Podgląd';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Zobacz, jak Twoje zaproszenie wygląda dla odwiedzających.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Nazwy kanałów tekstowych';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Korona właściciela społeczności';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Skonfiguruj, czy ikona korony jest wyświetlana obok właściciela społeczności';

  @override
  String get guildSettingsSplashCardAlignment => 'Wyrównanie karty';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Środek';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Lewo';

  @override
  String get guildSettingsSplashAlignmentRight => 'Prawo';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Dotyczy tylko szerokich ekranów.';

  @override
  String get permissionReadMessageHistory => 'Czytaj historię wiadomości';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Zmień to, co mogą widzieć użytkownicy bez uprawnienia „$permission”';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Użyj dedykowanego okna, aby ustawić datę graniczną historii wiadomości dla członków, którzy nie mają uprawnienia $permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Otwórz próg historii wiadomości';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Próg historii wiadomości';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Włącz próg historii wiadomości';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Data graniczna';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Członkowie bez uprawnienia „Czytaj historię wiadomości” mogą przeglądać wiadomości wysłane po tej dacie.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Próg historii wiadomości zaktualizowany';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Zezwalaj na wielkie litery i spacje w nazwach kanałów tekstowych. Wyłączenie ogranicza nazwy do małych liter z myślnikami i podkreśleniami.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Ukrywa ikonę korony obok właściciela społeczności na wszystkich ekranach.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Animowane ikony wymagają funkcji społeczności „Animowana ikona”.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Animowane grafiki nagłówka wymagają funkcji społeczności „Animowana grafika nagłówka”.';

  @override
  String get guildSettingsAfkChannel => 'Kanał AFK / bezczynności';

  @override
  String get guildSettingsAfkChannelHint =>
      'Przenieś członków do tego kanału, gdy są AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Brak kanału AFK';

  @override
  String get guildSettingsAfkTimeout => 'Limit czasu AFK';

  @override
  String get guildSettingsAfkTimeout1Min => '1 minuta';

  @override
  String get guildSettingsAfkTimeout5Min => '5 minut';

  @override
  String get guildSettingsAfkTimeout15Min => '15 minut';

  @override
  String get guildSettingsAfkTimeout30Min => '30 minut';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 godzina';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds sekund';
  }

  @override
  String get guildSettingsSystemChannel => 'Kanał docelowy';

  @override
  String get guildSettingsSystemChannelHint =>
      'Wiadomości powitalne i systemowe pojawią się tutaj.';

  @override
  String get guildSettingsNoSystemChannel => 'Brak kanału systemowego';

  @override
  String get guildSettingsHideJoinMessages => 'Ukryj wiadomości o dołączeniu';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Ukrywa wiadomości o dołączeniu na kanale docelowym.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Domyślne ustawienia powiadomień';

  @override
  String get guildSettingsNotificationsAll => 'Wszystkie wiadomości';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Powiadamiaj o wszystkich wiadomościach';

  @override
  String get guildSettingsNotificationsMentions => 'Tylko wzmianki';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Powiadamiaj tylko o wzmiankach';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Maks. 10 MB. Minimum: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Maks. 10 MB. Minimum: 960×540px (16:9). Wyświetlane w osadzeniach zaproszeń na czacie.';

  @override
  String get guildSettingsModerationDescription =>
      'Skonfiguruj ustawienia weryfikacji, filtrowania treści i treści dla dorosłych.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Społeczności wymienione w sekcji Odkrycia mają ograniczone opcje moderacji.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Filtrowanie treści';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Automatycznie przeskanuj wiadomości pod kątem treści nieodpowiednich w kanałach nieoznaczonych jako dla dorosłych.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Społeczności wymienione w sekcji Odkrycia muszą skanować wszystkich członków. Tego ustawienia nie można zmienić, gdy funkcja Odkrycia jest włączona.';

  @override
  String get guildSettingsContentFilterOff => 'Wyłączone';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Pozwól społeczności na samodzielną moderację';

  @override
  String get guildSettingsContentFilterNoRole => 'Filtruj członków bez ról';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Sugerowane dla większości społeczności';

  @override
  String get guildSettingsContentFilterAll => 'Filtruj wszystkich';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Maksymalna ochrona dla przestrzeni przyjaznych rodzinie';

  @override
  String get guildSettingsModerationMatureOff => 'Wyłączone';

  @override
  String get guildSettingsModerationMatureOn => 'Włączone';

  @override
  String get guildSettingsContentWarningToggle => 'Pokaż ostrzeżenie o treści';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Przełącza monit o zgodę przed wejściem do dowolnego kanału.';

  @override
  String get guildSettingsContentWarningText =>
      'Niestandardowy tekst ostrzeżenia';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'To zawiera wrażliwe treści.';

  @override
  String get guildSettingsModeration2faTitle => 'Wymaganie 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'Wymagaj uwierzytelniania dwuskładnikowego od moderatorów, zanim będą mogli banować, wyrzucać, wyciszać lub usuwać wiadomości.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Wymagaj 2FA dla działań moderacyjnych';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Tylko właściciel społeczności może zmienić to ustawienie';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Włącz 2FA na swoim koncie, aby zmienić to ustawienie';

  @override
  String get guildSettingsEmojiSearchHint => 'Szukaj emotikon';

  @override
  String get guildSettingsEmojiUploadTitle => 'Prześlij emotikonę';

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
    return 'Emotikony nieanimowane ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Emotikony animowane ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Szukaj naklejek';

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
    return 'Twórz webhooki z ustawień kanału. Edytuj je tutaj.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'Twój niestandardowy adres URL nie będzie działać, chyba że co najmniej jeden kanał będzie widoczny dla wszystkich.';

  @override
  String get guildSettingsVanityUrlRemove => 'Usuń';

  @override
  String get guildSettingsBannedUsersTitle => 'Zbanowani użytkownicy';

  @override
  String get guildSettingsInvitesTableInviter => 'Zapraszający';

  @override
  String get guildSettingsInvitesTableChannel => 'Kanał';

  @override
  String get guildSettingsInvitesTableCode => 'Kod';

  @override
  String get guildSettingsInvitesTableUses => 'Użycia';

  @override
  String get guildSettingsInvitesTableCreated => 'Utworzono';

  @override
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtruj według użytkownika';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtruj według akcji';

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
