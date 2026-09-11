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
      'Coś jest nie tak z instancją.\nZaraz powinno być naprawione!';

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
    return 'Zaplanowano prace konserwacyjne na $localizedTime. Przewidywany czas trwania: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Trwa konserwacja. Przewidywany czas trwania: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete =>
      'Prace konserwacyjne zostały zakończone.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Cześć, $displayName! Odbierz swoje konto, aby nie stracić do niego dostępu.';
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
    return '$productName nie ma dostępu do Twojej biblioteki zdjęć. Możesz włączyć tę funkcję w ustawieniach prywatności urządzenia.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName nie posiada uprawnień do wysyłania powiadomień. Możesz mu je nadać w ustawieniach urządzenia.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Twoja subskrypcja nie odnowiła się, ale nadal masz dostęp do korzyści $productName do $graceDate. Działaj teraz, aby nie stracić wszystkich korzyści.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Twoja subskrypcja $productName wygasła. Odnów teraz, aby zachować swoje korzyści.';
  }

  @override
  String get nagbarManageSubscription => 'Zarządzaj subskrypcją';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Witamy w $productFullName. Poznaj swoje korzyści $productName i zarządzaj subskrypcją.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'Zobacz funkcje $productName';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'Masz nowy kod podarunkowy w swoim ekwipunku prezentów.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'Masz $count nowych kodów podarunkowych w ekwipunku prezentów.';
  }

  @override
  String get nagbarViewGiftInventory => 'Wyświetl ekwipunek prezentów';

  @override
  String get nagbarVisionaryMfa =>
      'Włącz uwierzytelnianie dwuskładnikowe, aby chronić swoje konto Visionary.';

  @override
  String get nagbarEnableMfa => 'Włącz 2FA';

  @override
  String get nagbarTermsAcceptance =>
      'Zaktualizowaliśmy nasze warunki. Przejrzyj je i zaakceptuj, aby kontynuować.';

  @override
  String get nagbarReviewTerms => 'Przejrzyj warunki';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Dołącz do $communityName, aby rozmawiać z zespołem i być na bieżąco.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Dołącz do $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'Włącz powiadomienia, aby nie przegapić wiadomości i wzmianek.';

  @override
  String get nagbarEnableNotifications => 'Włącz powiadomienia';

  @override
  String get nagbarBillingPortalFailed =>
      'Nie udało się otworzyć portalu płatności. Spróbuj ponownie za chwilę.';

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
  String get next => 'Dalej';

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
      'Twoja prośba o konto oczekuje na zatwierdzenie. Możesz się zalogować po zatwierdzeniu jej przez administratora.';

  @override
  String get registerClosed =>
      'Rejestracja jest obecnie zamknięta. Aby utworzyć konto, użyj linku rejestracyjnego od administratora.';

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
  String get errorServiceUnavailable =>
      'Ta instancja jest tymczasowo niedostępna. Spróbuj ponownie za chwilę.';

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
  String get embedInviteJoinGroup => 'Dołącz do grupy';

  @override
  String get embedInviteAlreadyJoined => 'Już dołączono';

  @override
  String get embedInviteDisabled => 'Zaproszenia wyłączone';

  @override
  String get embedInvitePaused =>
      'Zaproszenia do tej społeczności są wstrzymane.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName wykrył(-a) potencjalny atak, więc nowi użytkownicy nie mogą teraz dołączyć.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Ta społeczność wstrzymała zaproszenia. Spróbuj ponownie później.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName wykrył(-a) potencjalny atak na tę społeczność. Zaproszenia są wstrzymane, więc nowi użytkownicy nie mogą teraz dołączyć.';
  }

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
  String get invalidDeepLinkTitle => 'Nie można otworzyć linku';

  @override
  String get invalidDeepLinkDescription =>
      'Ten link może być uszkodzony, dostępny tylko w internecie lub możesz nie mieć do niego dostępu. Sprawdź link i spróbuj ponownie.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Przejdź do strony głównej';

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
    return 'Wizjoner (dożywotni $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dni $productName',
      one: '1 dzień $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# tygodni $productName',
      one: 'tydzień $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count miesięcy $productName',
      one: 'miesiąc $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# lat $productName',
      one: 'rok $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'Od $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'Kliknij, aby odebrać prezent!';

  @override
  String get embedGiftAlreadyRedeemed => 'Już odebrano';

  @override
  String get embedGiftClaimAccountHelp =>
      'Zarejestruj się, aby odebrać ten prezent.';

  @override
  String get embedGiftClaim => 'Odbierz prezent';

  @override
  String get embedGiftClaimed => 'Prezent odebrany';

  @override
  String get embedGiftClaimAccount => 'Odbierz konto, aby zrealizować';

  @override
  String get embedGiftUnknownTitle => 'Nieznany prezent';

  @override
  String get embedGiftUnknownSubtitle =>
      'Ten kod podarunkowy jest nieprawidłowy lub został już wykorzystany.';

  @override
  String get embedGiftUnavailable => 'Prezent niedostępny';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Odbierz swój prezent, aby aktywować subskrypcję $productName!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'Ten prezent został już odebrany.';

  @override
  String get giftAcceptMaybeLater => 'Może później';

  @override
  String get giftRedeemedToast => 'Prezent odebrany!';

  @override
  String get giftRedeemInvalidTitle => 'Nieprawidłowy kod podarunkowy';

  @override
  String get giftRedeemInvalidMessage =>
      'Ten kod jest nieprawidłowy lub został już użyty.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Prezent już odebrany';

  @override
  String get giftRedeemAlreadyRedeemedMessage =>
      'Ten kod został już wykorzystany.';

  @override
  String get giftRedeemNotFoundTitle => 'Nie znaleziono prezentu';

  @override
  String get giftRedeemNotFoundMessage => 'Ten kod nie istnieje.';

  @override
  String get giftRedeemFailedTitle => 'Nie udało się zrealizować prezentu';

  @override
  String get giftRedeemFailedMessage =>
      'Nie udało się zrealizować tego prezentu. Spróbuj ponownie.';

  @override
  String get giftVisionaryCannotRedeemTitle =>
      'Nie można zrealizować tego prezentu';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Konta Visionary nie mogą odebrać prezentów Plutonium. Skopiuj link, aby udostępnić go znajomemu.';

  @override
  String get giftCopyLink => 'Kopiuj link prezentu';

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
  String get notificationUseCategoryDefault =>
      'Użyj domyślnych ustawień kategorii';

  @override
  String get notificationUseCommunityDefault =>
      'Użyj domyślnych ustawień społeczności';

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
      'Usunąć Twoje wiadomości w tej rozmowie?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Spowoduje to trwałe usunięcie wszystkich wiadomości wysłanych przez Ciebie w tej rozmowie. Tej operacji nie można cofnąć.';

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
  String get dmUnnamedGroup => 'Grupa bez nazwy';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'Grupa użytkownika $resolvedName';
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
  String get dmDebugCategory => 'Debuguj kategorię';

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
      'Zweryfikuj swój adres e-mail, zanim wyślesz zaproszenia do znajomych.';

  @override
  String get addFriendFriendsListFull =>
      'Twoja lista znajomych jest pełna lub czyjaś inna. Usuń kogoś i spróbuj ponownie.';

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
    return 'To domyślna emotka w $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'Ten emoji pochodzi z tej społeczności. Możesz go używać wszędzie.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'To jest niestandardowe emoji ze społeczności.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'To jest niestandardowe emoji ze społeczności. Poproś autora o zaproszenie, aby móc używać tego emoji.';

  @override
  String get emojiInfoFromHeader => 'Ten emoji pochodzi z';

  @override
  String get emojiInfoDiscoverableCommunity => 'Społeczność do odkrycia';

  @override
  String get emojiInfoPrivateCommunity => 'Prywatna społeczność';

  @override
  String get emojiInfoVerifiedCommunity => 'Zweryfikowana społeczność';

  @override
  String get emojiInfoAddToFavorites => 'Dodaj do ulubionych';

  @override
  String get emojiInfoRemoveFromFavorites => 'Usuń z Ulubionych';

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
  String get gifPickerFavoritesEmptyTitle => 'Brak ulubionych GIF-ów';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Dodaj GIF do ulubionych, aby zobaczyć go tutaj.';

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
      'Wyślemy kod SMS, gdy będzie dostępny. Twój numer nie jest powiązany z Twoim kontem. Przechowujemy jedynie zaszyfrowany identyfikator bez identyfikatora użytkownika, aby umożliwić maksymalnie 2 weryfikacje w ciągu około 30 dni.';

  @override
  String get phoneAddSendCode => 'Wyślij kod';

  @override
  String get phoneVerifyTitle => 'Zweryfikuj numer telefonu';

  @override
  String get phoneVerifyDescription =>
      'Wpisz kod weryfikacyjny wysłany na Twój numer telefonu.';

  @override
  String get phoneAddSuccess => 'Numer telefonu zweryfikowany';

  @override
  String get phoneCountryLabel => 'Kraj';

  @override
  String get phoneSearchCountries => 'Szukaj krajów...';

  @override
  String get phoneNumberRequired => 'Numer telefonu jest wymagany';

  @override
  String get phoneEnterValidNumber =>
      'Wprowadź prawidłowy numer telefonu komórkowego.';

  @override
  String get phoneCannotBeUsed =>
      'Tego numeru telefonu nie można użyć. Spróbuj użyć innego numeru telefonu komórkowego lub skontaktuj się z pomocą techniczną.';

  @override
  String get phoneAlreadyUsed =>
      'Ten numer telefonu został już użyty. Spróbuj użyć innego numeru lub skontaktuj się z pomocą techniczną.';

  @override
  String get phoneCodeDidNotWork =>
      'Ten kod nie zadziałał. Sprawdź go i spróbuj ponownie.';

  @override
  String get phoneTooManyAttempts =>
      'Zbyt wiele prób. Poczekaj chwilę, a następnie spróbuj ponownie.';

  @override
  String get phoneSmsUnavailable =>
      'Weryfikacja SMS jest teraz niedostępna. Spróbuj ponownie później lub skontaktuj się z pomocą techniczną.';

  @override
  String get phoneNotEligible =>
      'Weryfikacja telefoniczna nie jest dostępna dla tego konta. Użyj innej metody lub skontaktuj się z pomocą techniczną.';

  @override
  String get phoneCaptchaRequired =>
      'Przed weryfikacją telefonu wymagane jest sprawdzenie przeglądarki. Spróbuj ponownie ze strony logowania lub skontaktuj się z pomocą techniczną.';

  @override
  String get phoneSomethingWentWrong => 'Coś poszło nie tak. Spróbuj ponownie.';

  @override
  String get phoneInboundExpensiveDescription =>
      'Wysłanie SMS na ten numer telefonu jest zbyt kosztowne, dlatego prosimy o wysłanie SMS-a do nas. Możesz również skontaktować się z pomocą techniczną, abyśmy usunęli to wymaganie z Twojego konta.';

  @override
  String get phoneInboundDefaultDescription =>
      'Musisz wysłać nam SMS-a, aby zweryfikować swój numer telefonu.';

  @override
  String get phoneInboundStepOpenMessaging =>
      'Otwórz aplikację do SMS-ów w telefonie i utwórz nową wiadomość.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'Wyślij kod $code na numer $number.';
  }

  @override
  String get phoneInboundStepWait =>
      'Poczekaj, aż otrzymamy Twoją wiadomość. Może to potrwać minutę.';

  @override
  String get phoneInboundGetNewCode => 'Wyślij nowy kod';

  @override
  String get phoneInboundChallengeCodeLabel => 'Kod do wysłania';

  @override
  String get phoneInboundOurNumberLabel => 'Wyślij na numer';

  @override
  String get requiredActionTitle => 'Wymagana weryfikacja konta';

  @override
  String requiredActionIntroGeneric(String productName) {
    return 'Ukończ wymaganą weryfikację, aby nadal korzystać z $productName.';
  }

  @override
  String get requiredActionIntroPhone =>
      'Zanim przejdziesz dalej, musimy przeprowadzić dodatkową weryfikację anty-spamową Twojej rejestracji.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return 'Zweryfikuj swój adres e-mail lub numer telefonu, aby dalej korzystać z $productName.';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return 'Aby nadal korzystać z aplikacji $productName, wykonaj poniższe kroki weryfikacji e-maila i numeru telefonu.';
  }

  @override
  String get requiredActionChooseMethodTitle => 'Wybierz metodę weryfikacji';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return 'Ukończ jedną z poniższych ścieżek weryfikacji, aby nadal korzystać z $productName.';
  }

  @override
  String get requiredActionUseEmail => 'Użyj e-maila';

  @override
  String get requiredActionUsePhone => 'Użyj telefonu';

  @override
  String get requiredActionCheckEmailTitle => 'Sprawdź swój e-mail';

  @override
  String get requiredActionCheckEmailDescription =>
      'Wysłaliśmy link weryfikacyjny na Twój adres e-mail. Otwórz go, aby kontynuować.';

  @override
  String get requiredActionResendVerificationEmail =>
      'Wyślij ponownie e-mail weryfikacyjny';

  @override
  String get requiredActionVerificationEmailSent =>
      'Wysłano e-mail weryfikacyjny. Sprawdź swoją skrzynkę odbiorczą.';

  @override
  String get requiredActionSignOut => 'Wyloguj się';

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
  String get networkErrorMessage => 'Coś poszło nie tak. Spróbuj ponownie.';

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
      other: '# tygodni temu',
      one: '1 tydzień temu',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'za $count minut',
      one: 'za 1 minutę',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'za # godzin',
      one: 'za godzinę',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'za $count dni',
      one: 'za 1 dzień',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'za # tygodni',
      one: 'za tydzień',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'za # miesięcy',
      one: 'za 1 miesiąc',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'za # lat',
      one: 'za rok',
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
  String get userProfileLoading => 'Ładowanie profilu';

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
  String get userProfileRoles => 'Role';

  @override
  String get memberRoleAdd => 'Dodaj rolę';

  @override
  String memberRoleRemove(String roleName) {
    return 'Usuń rolę $roleName';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'Ten użytkownik nie ma żadnych ról w tej społeczności.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'Brak ról. Dodaj role w $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'Brak dostępnych ról';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'Obecnie w tej społeczności nie ma ról do przypisania, ale możesz utworzyć nową rolę w $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Ustawienia społeczności';

  @override
  String get guildSettingsRolesTab => 'Role';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Czas lokalny';

  @override
  String get userProfileSameTimeAsYou => 'Taka sama jak twoja';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return '$duration przed tobą';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return '$duration za tobą';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours godzin',
      one: '1 godzina',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minut',
      one: '1 minuta',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours godzin',
      one: '1 godzina',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minut',
      one: '1 minuta',
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
  String get iarReportGuildTitle => 'Zgłoś społeczność';

  @override
  String get iarReportGuildPreconfirmBody =>
      'Jeśli to zgłoszenie dotyczy konkretnej wiadomości w tej społeczności, zgłoś tę wiadomość. Zgłoszenia wiadomości zapewniają naszemu zespołowi ds. bezpieczeństwa najjaśniejszy kontekst, a dodanie szczegółów w komentarzach może przyspieszyć naszą weryfikację. Kontynuuj zgłaszanie całej społeczności tylko wtedy, gdy zgłoszenie wiadomości nie oddałoby szerszego problemu.';

  @override
  String get iarContinueToReportCommunity =>
      'Kontynuuj zgłaszanie społeczności';

  @override
  String get iarPreviewCommunitySubtitle => 'Społeczność';

  @override
  String get iarReasonHarassmentGuildLabel =>
      'Nękanie lub ukierunkowane znęcanie się';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'Społeczność ułatwia nękanie grupowe lub ukierunkowane ataki.';

  @override
  String get iarReasonHateGuildDescription =>
      'Promuje nienawiść wobec grup chronionych.';

  @override
  String get iarReasonTerrorismLabel => 'Terroryzm lub brutalny ekstremizm';

  @override
  String get iarReasonTerrorismDescription =>
      'Promuje, rekrutuje lub koordynuje działalność związaną z brutalnym ekstremizmem.';

  @override
  String get iarReasonMatureContentGuildLabel =>
      'Treści dla dorosłych lub niebezpieczne bramkowanie';

  @override
  String get iarReasonMatureContentGuildDescription =>
      'Treści dla dorosłych bez odpowiedniego oznaczenia.';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      'Zagraża nieletnim lub zawiera treści związane z wykorzystywaniem dzieci.';

  @override
  String get iarReasonRaidLabel => 'Koordynacja rajdu';

  @override
  String get iarReasonRaidDescription =>
      'Koordynowanie ataków, brygadowania lub nękania osób bądź społeczności.';

  @override
  String get iarReasonSpamGuildDescription =>
      'Społeczność istnieje, aby spamować, oszukiwać lub nadużywać platformy.';

  @override
  String get iarReasonMalwareGuildLabel =>
      'Rozpowszechnianie złośliwego oprogramowania';

  @override
  String get iarReasonMalwareGuildDescription =>
      'Rozpowszechnia złośliwe oprogramowanie, kradnie dane uwierzytelniające lub szkodliwe pliki.';

  @override
  String get iarReasonPrivacyGuildLabel => 'Naruszenie prywatności lub doxxing';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'Udostępnia dane osobowe, śledzi użytkowników lub koordynuje naruszenia prywatności.';

  @override
  String get iarReasonSelfHarmGuildLabel => 'Zachęca do samookaleczeń';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'Zachęca do samobójstwa, samookaleczeń lub zaburzeń odżywiania.';

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
  String get slowmodeStatusEnabled => 'Tryb wolny jest włączony';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Tryb wolny jest aktywny ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'Tryb wolny jest ustawiony na $durationLabel, ale jesteś odporny.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Tryb wolny jest ustawiony na $durationLabel. Poczekaj przed wysłaniem kolejnej wiadomości.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Tryb wolny jest ustawiony na $durationLabel dla tego kanału.';
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
      'Przytrzymaj, aby nagrać. Przeciągnij do kosza, aby usunąć, przesuń w górę, aby zablokować, lub puść, aby wysłać.';

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
  String get voiceMessageSeekForward => 'Przewiń do przodu';

  @override
  String get voiceMessageSeekBackward => 'Przewiń do tyłu';

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
  String get chatAttachmentDownloadedToast => 'Zapisano w zdjęciach';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Nie udało się pobrać załącznika';

  @override
  String get chatAttachmentExpiredTooltip => 'Załącznik wygasł';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Rozwiń ($count linii)',
      one: 'Rozwiń ($count linia)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zwiń ($count linii)',
      one: 'Zwiń ($count linia)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Rozwiń ($count wierszy)',
      one: 'Rozwiń ($count wiersz)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zwiń ($count wierszy)',
      one: 'Zwiń ($count wiersz)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... (pozostało $count linii)',
      one: '... (pozostała $count linia)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... (pozostało $count wierszy)',
      many: '... (pozostało $count wierszy)',
      few: '... (pozostały $count wiersze)',
      one: '... (pozostał $count wiersz)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'Wyświetl cały plik';

  @override
  String get chatTextualPreviewChangeLanguage => 'Zmień język';

  @override
  String get chatTextualPreviewSearchLanguage => 'Szukaj języka…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Podświetlanie składni';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'Brak wyników';

  @override
  String get chatTextualPreviewMoreOptions => 'Więcej opcji';

  @override
  String get chatTextualPreviewWrapText => 'Zawijaj tekst';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'Plik jest za duży do podglądu w tekście (limit $previewLimitKb KB).';
  }

  @override
  String get chatTextualPreviewLoadError => 'Nie można załadować podglądu.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Zwykły tekst';

  @override
  String get chatTextualPreviewCopy => 'Kopiuj';

  @override
  String get chatAttachmentSourceGallery => 'Galeria';

  @override
  String get chatAttachmentSourceCamera => 'Aparat';

  @override
  String get chatAttachmentSourceBrowse => 'Przeglądaj pliki';

  @override
  String get chatAttachmentPasteTooltip => 'Wklej plik z schowka';

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
  String get lookAndFeelHdrSectionTitle => 'Wysoki zakres dynamiczny';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Kontroluj sposób wyświetlania obrazów HDR na monitorach obsługujących HDR.';

  @override
  String get lookAndFeelHdrFullName => 'Pełny zakres dynamiczny';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Wyświetlaj obrazy HDR z pełną jasnością i zakresem kolorów.';

  @override
  String get lookAndFeelHdrStandardName => 'Standardowy zakres';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Mapuj obrazy HDR do standardowego zakresu, zmniejszając szczytową jasność.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'Tryb wyświetlania z szerokim zakresem dynamiki';

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
  String get lookAndFeelChatFontSizeLabel => 'Rozmiar czcionki czatu';

  @override
  String get lookAndFeelAppZoomTitle => 'Powiększenie aplikacji';

  @override
  String get lookAndFeelAppZoomDescription =>
      'Dostosuj poziom powiększenia aplikacji.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'Tapeta czatu';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'Wybierz tło dla czatu. Pozostanie na tym urządzeniu.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'To ustawienie pozostaje na tym urządzeniu';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'Tapeta czatu jest zapisana tylko na tym urządzeniu i nie jest synchronizowana z innymi.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'Domyślne';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'Niestandardowy obraz';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Kolor $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Gradient $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'Przyciemnij tapetę';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'Nie udało się ustawić tego obrazu jako tapety.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Wiadomości';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Wybierz sposób wyświetlania wiadomości na czatach.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Odstępy między grupami wiadomości';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '$spacing px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel =>
      'Tryb wyświetlania wiadomości';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Wygodny';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Przestronny układ z wyraźnym wizualnym rozdzieleniem wiadomości.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Gęste';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Maksymalizuje widoczność wiadomości przy minimalnym odstępie.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'Ukryj awatary użytkowników';

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
      'Społeczność tymczasowo niedostępna';

  @override
  String get guildUnavailableDescription =>
      'Coś poszło nie tak. Pracujemy nad tym.';

  @override
  String get guildNotFoundTitle => 'To nie jest społeczność, której szukasz.';

  @override
  String get guildNotFoundDescription =>
      'Społeczność, której szukasz, mogła zostać usunięta lub możesz nie mieć do niej dostępu.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return 'Społeczność $communityName jest obecnie dostępna tylko dla członków zespołu $productName';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => 'tymczasowo niedostępne';

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
  String get favoritesAddToSavedMedia => 'Dodaj do zapisanych multimediów';

  @override
  String get favoritesRemoveFromSavedMedia => 'Usuń z zapisanych mediów';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Dodaj do ulubionych GIF-ów (tylko URL)';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Usuń z ulubionych GIF-ów zapisanych na podstawie adresu URL';

  @override
  String get savedMediaAddTitle => 'Dodaj do zapisanych multimediów';

  @override
  String get savedMediaFormNameLabel => 'Nazwa';

  @override
  String get savedMediaFormNameHint => 'Moje wspaniałe multimedia';

  @override
  String get savedMediaFormAltTextLabel => 'Tekst alternatywny';

  @override
  String get savedMediaFormAltTextHint => 'Opisz multimedia';

  @override
  String get savedMediaFormTagsLabel => 'Tagi';

  @override
  String get savedMediaFormTagsHint => 'zabawne, reakcja, praca';

  @override
  String get savedMediaSaveError =>
      'Nie udało się zaktualizować zapisanych multimediów.';

  @override
  String get savedMediaNameRequired => 'Nazwa jest wymagana.';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'Jak mamy zapisywać Twoje ulubione GIF-y?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'Możesz zapisywać ulubione GIF-y jako ulubione tylko z linkiem lub przesłać je do zapisanych multimediów. Wybierz opcję, która najlepiej pasuje do Twojego sposobu korzystania z nich. Możesz ją zmienić w dowolnym momencie w Ustawienia > Zaawansowane > Multimedia.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'Ulubione tylko z adresu URL (domyślnie): synchronizowane między urządzeniami, bez przesyłania, nie liczone do zapisanych multimediów. Oryginalne multimedia mogą zniknąć, jeśli ich host je usunie.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Zapisane multimedia: przesłane, z możliwością dodawania tagów, wyszukiwania i przechowywania, ale wliczane do limitu zapisanych multimediów.';

  @override
  String get gifFavoriteFirstTimeHint => 'Zapytamy tylko raz.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly =>
      'Użyj tylko adresu URL (zalecane)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => 'Użyj zapisanych multimediów';

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
  String get messagesMediaCameraUploadsSectionTitle => 'Przesyłanie z aparatu';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Wybierz, czy zdjęcia i filmy wykonane aparatem w aplikacji mają być przechowywane na Twoim urządzeniu';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel =>
      'Zapisz na urządzeniu';

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
  String get accessibilitySaturationTitle => 'Nasycenie';

  @override
  String get accessibilitySaturationDescription =>
      'Dostosuj, jak żywe kolory motywu będą wyglądać w całej aplikacji.';

  @override
  String get accessibilityVisualGroupTitle => 'Wygląd';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'Zawsze podkreślaj linki';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Przyciemnij przekreślony tekst';

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
  String get accessibilityScreenReaderGroupTitle => 'Czytnik ekranu';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Kontroluj działanie $productName z czytnikami ekranu.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Ogłaszaj nowe wiadomości';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Czytniki ekranu będą ogłaszać nowe wiadomości, gdy tylko pojawią się w otwartym kanale. Dźwięki powiadomień pozostaną bez zmian.';

  @override
  String get accessibilityTtsGroupTitle => 'Tekst na mowę';

  @override
  String get accessibilityTtsGroupDescription =>
      'Wybierz prędkość odtwarzania tekstu.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Szybkość odtwarzania mowy';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Odtwórz próbkę';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Próbka wyciszenia';

  @override
  String get accessibilityPreviewButtonLabel => 'Przycisk podglądu';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'Tak wyglądają podglądy linków: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Podgląd użytkownika';

  @override
  String get accessibilityKeyboardGroupTitle => 'Klawiatura';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Pokaż ramkę fokusu w polu tekstowym czatu';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'Klawisz Esc wychodzi z trybu klawiatury';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Pokaż skróty menu kontekstowego';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Pytaj przed rozpoczęciem połączeń';

  @override
  String get accessibilityAnimationGroupTitle => 'Animacja';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'Ograniczone animacje są włączone, więc animacje treści są domyślnie wstrzymane. Nadal możesz je włączyć, aby były odtwarzane.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel =>
      'Odtwarzaj animowane emoji';

  @override
  String get accessibilityAutoPlayGifsMobileLabel =>
      'Automatycznie odtwarzaj GIF-y';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'Automatycznie odtwarzaj GIF-y, gdy aplikacja $productName jest aktywna';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Odtwarzanie mimo ograniczonego ruchu.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Wstrzymane z powodu ograniczonego ruchu. Włącz, aby animowane emoji były odtwarzane.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Wstrzymano z powodu ograniczonego ruchu. Włącz, aby odtwarzać GIF-y.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'Domyślnie wyłączone na urządzeniach mobilnych, aby oszczędzać baterię i dane.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Animacje naklejek';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Preferencje animacji naklejek';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Zawsze animuj';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Naklejki zawsze będą animowane';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Animuj przy interakcji';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Naklejki będą się animować po naciśnięciu';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Naklejki będą się animować po najechaniu na nie lub interakcji z nimi';

  @override
  String get accessibilityStickerNeverAnimateName => 'Nigdy nie animuj';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Naklejki nigdy się nie animują';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Zawsze animowane pomimo ograniczonego ruchu.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'Ograniczone animacje sprawiają, że naklejki animują się tylko po interakcji. Wybierz „zawsze animuj”, aby to zmienić.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'Domyślnie animacje są włączone przy interakcji na urządzeniach mobilnych, aby oszczędzać baterię.';

  @override
  String get accessibilityMotionGroupTitle => 'Ruch';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Synchronizuj ustawienia ograniczonego ruchu z systemem';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Użyj systemowych preferencji urządzenia dotyczących ograniczonego ruchu lub dostosuj je poniżej.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Ogranicz ruch';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Wyłącz animacje i przejścia. Obecnie sterowane ustawieniami systemowymi.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Wyłącz animacje i przejścia w całej aplikacji.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Animowane emoji, GIF-y i naklejki pozostają pod twoją kontrolą w zakładce Animacja.';

  @override
  String get accessibilityConfirmStartCallTitle => 'Rozpocząć rozmowę?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Czy na pewno chcesz rozpocząć to połączenie?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel =>
      'Rozpocznij połączenie';

  @override
  String get accessibilityTtsSampleDescription =>
      'Posłuchaj przykładowego zdania wypowiedzianego z wybraną prędkością.';

  @override
  String get accessibilityTtsSampleText =>
      'Doktorze, jestem z przyszłości. Przybyłem tu we wehikułie czasu, który pan wynalazł. Teraz potrzebuję pańskiej pomocy, żeby wrócić do roku 1985.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'Synteza mowy jest niedostępna na tym urządzeniu.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Odtwarzanie mowy nie powiodło się. Spróbuj ponownie lub sprawdź, czy wyjście audio działa.';

  @override
  String get ttsSubstitutionUnknownUser => 'nieznany użytkownik';

  @override
  String get ttsSubstitutionUnknownRole => 'nieznana rola';

  @override
  String get ttsSubstitutionUnknownChannel => 'nieznany kanał';

  @override
  String get ttsSubstitutionCodeBlock => 'blok kodu';

  @override
  String get ttsSubstitutionSpoiler => 'ukryte';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'emoji \"$emojiName\"';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return 'ukośnik $commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName powiedział(a): $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'W odpowiedzi do $replyAuthorName, $authorName powiedział(-a): $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'wysłał(a) naklejkę';

  @override
  String get ttsSentAttachment => 'wysłał(a) załącznik';

  @override
  String ttsSentAttachments(int count) {
    return 'wysłano $count załączniki';
  }

  @override
  String get ttsSentEmbed => 'wysłał(a) załącznik';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author wysłał(a) $summary';
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
  String get systemCallJoinTheCall => 'Dołącz do rozmowy';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username rozpoczął rozmowę, która trwała $duration.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'Pominięto połączenie od $username, które trwało $duration.';
  }

  @override
  String systemCallMissed(String username) {
    return 'Nie odebrałeś połączenia od $username.';
  }

  @override
  String get systemCallDurationFewSeconds => 'kilka sekund temu';

  @override
  String get systemCallDurationMinute => 'minutę';

  @override
  String get systemCallDurationOneYear => '1 rok';

  @override
  String get systemCallDurationOneMonth => '1 miesiąc';

  @override
  String get systemCallDurationOneWeek => '1 tydzień';

  @override
  String get systemCallDurationOneDay => '1 dzień';

  @override
  String get systemCallDurationOneHour => '1 godzina';

  @override
  String systemCallDurationYears(int count) {
    return '$count lat';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count miesięcy';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count tygodnie';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count dni';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count godzin';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count minut';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Zaktualizuj $productName, aby wyświetlić tę wiadomość.';
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
  String get voiceJoinFailedTitle =>
      'Nie udało się dołączyć do rozmowy głosowej';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Nie udało się rozłączyć Twoich innych urządzeń. Spróbuj ponownie za chwilę.';

  @override
  String get voiceChannelEmptyDescription =>
      'To jest kanał głosowy. Połącz się, aby zacząć rozmawiać!';

  @override
  String get voiceChannelJoin => 'Dołącz do kanału głosowego';

  @override
  String get voiceCallJoin => 'Dołącz do rozmowy';

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
  String get voiceControlFlipCamera => 'Obróć kamerę';

  @override
  String get voiceControlScreenShare => 'Udostępnij ekran';

  @override
  String get voiceScreenShareNotificationText => 'Udostępniasz swój ekran.';

  @override
  String get voiceControlMore => 'Więcej';

  @override
  String get voiceControlDisconnect => 'Rozłącz';

  @override
  String get voiceInChat => 'W czacie głosowym';

  @override
  String get voiceConnectionFailed => 'Połączenie nie powiodło się';

  @override
  String get voiceConnectionRetry => 'Spróbuj ponownie';

  @override
  String get voiceConnectionDismiss => 'Odrzuć';

  @override
  String get voiceConnectionDisconnected => 'Rozłączono';

  @override
  String voicePingMs(int currentLatency) {
    return 'Ping: $currentLatency ms';
  }

  @override
  String get voiceMeasuringLatency => 'Mierzenie opóźnienia...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Przejdź do $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'Połączenie głosowe';

  @override
  String get voiceConnectionAdvancedStats => 'Zaawansowane';

  @override
  String get voiceShowCallAvatars => 'Pokaż awatary połączeń';

  @override
  String get voiceShowConnectionId => 'Pokaż identyfikator połączenia';

  @override
  String get voiceAudioProcessing => 'Przetwarzanie dźwięku';

  @override
  String get voiceConnectionSessionSection => 'Sesja';

  @override
  String get voiceConnectionDurationLabel => 'Czas trwania';

  @override
  String get voiceConnectionParticipantsLabel => 'Uczestnicy';

  @override
  String get voiceConnectionNetworkSection => 'Sieć';

  @override
  String get voiceConnectionPingLabel => 'Ping';

  @override
  String get voiceConnectionJitterLabel => 'Drgania';

  @override
  String get voiceConnectionSendLabel => 'Wyślij';

  @override
  String get voiceConnectionReceiveLabel => 'Odbieranie';

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
  String get userAreaMuteMicrophone => 'Wycisz mikrofon';

  @override
  String get userAreaUnmuteMicrophone => 'Włącz mikrofon';

  @override
  String get userAreaUserSettings => 'Ustawienia użytkownika';

  @override
  String get voiceParticipantMenuViewProfile => 'Wyświetl profil';

  @override
  String get voiceParticipantMenuFocus => 'Skup się na tej osobie';

  @override
  String get voiceParticipantMenuUnfocus => 'Wyłącz wyróżnienie';

  @override
  String get voiceParticipantMenuCommunityMute => 'Wycisz w społeczności';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Wycisz w społeczności';

  @override
  String get voiceParticipantMenuUserVolume => 'Głośność użytkownika';

  @override
  String get voiceParticipantMenuStreamVolume => 'Głośność strumienia';

  @override
  String get voiceParticipantMenuStopStreaming => 'Zatrzymaj strumieniowanie';

  @override
  String get voiceParticipantModerationFailed =>
      'Nie udało się zaktualizować tego członka. Spróbuj ponownie.';

  @override
  String get voiceControlChat => 'Czat';

  @override
  String get voiceCallViewModeLabel => 'Wyświetl';

  @override
  String get voiceCallViewModeGrid => 'Siatka';

  @override
  String get voiceCallViewModeFocus => 'Skupienie';

  @override
  String get voicePanelSettingsSectionTitle => 'Ustawienia głosu';

  @override
  String get voicePanelUseEarpieceLabel => 'Użyj słuchawki';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Pokaż tylko wideo';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Pokaż tylko uczestników z włączoną kamerą.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Pokaż moją kamerę';

  @override
  String get voicePrioritizeSpeakersLabel => 'Priorytetyzuj mówców';

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
  String get privacyDashboardProfilePrivacySection => 'Prywatność profilu';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Znajomi i wiadomości prywatne';

  @override
  String get privacyDashboardActivitySharingSection =>
      'Udostępnianie aktywności';

  @override
  String get privacyDashboardSensitiveContentSection => 'Treści wrażliwe';

  @override
  String get privacyDashboardDataExportSection => 'Eksport danych';

  @override
  String get privacyDashboardDataDeletionSection => 'Usuwanie danych';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Kto może zobaczyć twój pełny profil';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Znajomi i wszystkie społeczności';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Twój pełny profil jest widoczny dla znajomych i wszystkich w twoich społecznościach';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Tylko znajomi i małe społeczności';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Twój pełny profil jest widoczny dla znajomych i członków społeczności liczących do 200 osób';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Tylko znajomi';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Twój pełny profil jest widoczny tylko dla znajomych';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Zaproszenia do znajomych';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Wszyscy';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Zezwól każdemu na wysyłanie Ci próśb o dodanie do znajomych';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Znajomi znajomych';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Zezwól znajomym znajomych na wysyłanie Ci próśb';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Członkowie społeczności';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Zezwól członkom społeczności, w których uczestniczysz, na wysyłanie Ci próśb';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Wiadomości bezpośrednie';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Zezwól na bezpośrednie wiadomości od członków społeczności';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Zezwól członkom społeczności, w których uczestniczysz, na wysyłanie Ci wiadomości bezpośrednich';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Zezwól na bezpośrednie wiadomości od botów społeczności';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Zezwól botom ze społeczności, do których należysz, na wysyłanie Ci wiadomości bezpośrednich';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Zarządzaj tym, kto może wysyłać Ci zaproszenia do znajomych i wiadomości bezpośrednie';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Zarządzaj tym, kto może do Ciebie dzwonić i dodawać Cię do czatów grupowych';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Połączenia przychodzące';

  @override
  String get privacyDashboardIncomingCallsDesc =>
      'Kontroluj, kto może do Ciebie dzwonić';

  @override
  String get privacyDashboardAllowedCallers => 'Dozwolone osoby dzwoniące';

  @override
  String get privacyDashboardIncomingCallNobody => 'Nikt';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Blokuj wszystkie przychodzące połączenia';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Tylko znajomi';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Zezwalaj na połączenia tylko od znajomych (zalecane)';

  @override
  String get privacyDashboardIncomingCallCustom => 'Znajomi + Niestandardowe';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Zezwól znajomym oraz dodatkowym grupom, które wybierzesz';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Wszyscy';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Zezwól każdemu na dzwonienie do Ciebie, nawet nieznajomym';

  @override
  String get privacyDashboardAdditionalGroups => 'Dodatkowe grupy';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'Osoby, które są znajomymi Twoich znajomych, mogą do Ciebie dzwonić';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'Osoby ze wspólnych społeczności mogą do Ciebie zadzwonić';

  @override
  String get privacyDashboardRingBehavior => 'Zachowanie pierścienia';

  @override
  String get privacyDashboardSilentCalls => 'Ciche połączenia od wszystkich';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'Wszystkie połączenia będą powiadamiać cicho zamiast dzwonić. Domyślnie połączenia od osób spoza listy znajomych są zawsze ciche.';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Kto może dodawać Cię do czatów grupowych';

  @override
  String get privacyDashboardGroupDmDesc =>
      'Zarządzaj tym, kto może dodawać Cię do czatów grupowych bez pytania. Każdy nadal może wysyłać Ci linki z zaproszeniem do dołączenia.';

  @override
  String get privacyDashboardAllowedInvites => 'Dozwolone zaproszenia';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Nikt nie może dodawać Cię do czatów grupowych bez Twojej zgody';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Zezwalaj znajomym na dodawanie Cię bez pytania (zalecane)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Zezwól znajomym i dodatkowym grupom na dodawanie Cię';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Zezwól każdemu na dodawanie Cię do czatów grupowych bez pytania';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'Osoby, które są znajomymi Twoich znajomych, mogą dodawać Cię do czatów grupowych';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'Osoby ze wspólnych społeczności mogą dodawać Cię do czatów grupowych';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Aktywność głosowa w „Aktywni teraz\"';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Udostępniaj znajomym swoją aktywność głosową';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Udostępnić aktywność głosową wszystkim znajomym?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Zatrzymać udostępnianie aktywności głosowej wszystkim znajomym?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Za chwilę zaczniesz udostępniać swoją aktywność głosową wszystkim znajomym, także tym przyszłym. Spowoduje to wysłanie aktualizacji do wszystkich i będzie można to zmienić dopiero za 24 godziny.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Za chwilę przestaniesz udostępniać swoją aktywność głosową wszystkim znajomym, także tym przyszłym. Spowoduje to wysłanie aktualizacji do wszystkich i będzie można to zmienić ponownie dopiero za 24 godziny.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Tak, udostępnij wszystkim znajomym';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm =>
      'Tak, przestań udostępniać';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Dostępne ponownie za $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Udostępnianie aktywności głosowej zaktualizowane';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Nie udało się teraz zaktualizować udostępniania aktywności głosowej';

  @override
  String get privacyDashboardDataExportDesc =>
      'Utwórz archiwum danych swojego konta do pobrania, w tym wiadomości i adresy URL załączników. Większość osób chce wszystkiego, ale możesz zawęzić zakres poniżej.';

  @override
  String get privacyDashboardExportMyData => 'Eksportuj moje dane';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Trwale usuń wysłane wiadomości z czatów prywatnych, grupowych i społeczności. Proces będzie działał w tle, a po jego zakończeniu otrzymasz wiadomość prywatną.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Usuń moje wiadomości';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Zezwolić na bezpośrednie wiadomości od członków społeczności?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Blokować wiadomości bezpośrednie od członków społeczności?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Zezwolić botom na wysyłanie Ci bezpośrednich wiadomości?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Blokować botom możliwość wysyłania Ci bezpośrednich wiadomości?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Czy chcesz zezwolić na bezpośrednie wiadomości od członków Twoich obecnych społeczności?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Czy chcesz też blokować bezpośrednie wiadomości od członków Twoich obecnych społeczności?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Czy chcesz zezwolić botom z Twoich istniejących społeczności na wysyłanie Ci bezpośrednich wiadomości?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Czy chcesz też zablokować boty z istniejących społeczności?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'Możesz też zmienić to ustawienie dla każdej społeczności, naciskając i przytrzymując jej nazwę, a następnie wybierając Ustawienia prywatności.';

  @override
  String get privacyDashboardDmConfirmAllowAll =>
      'Zezwól dla wszystkich społeczności';

  @override
  String get privacyDashboardDmConfirmBlockAll =>
      'Zablokuj we wszystkich społecznościach';

  @override
  String get privacyDashboardDmConfirmSkip => 'Pomiń ten krok';

  @override
  String get privacyDashboardDataRequestGoBack => 'Wróć';

  @override
  String get privacyDashboardDataRequestExportTitle => 'Eksportuj moje dane';

  @override
  String get privacyDashboardDataRequestDeleteTitle => 'Usuń moje wiadomości';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'Przetworzymy to tak szybko, jak to możliwe. Otrzymasz e-mail, gdy archiwum będzie gotowe.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'Przetworzymy to tak szybko, jak to możliwe. Gdy skończymy, otrzymasz od nas wiadomość DM.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'Co uwzględnić';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Wszystko';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Wyeksportuj każdą wysłaną wiadomość, a także wszystkie ustawienia konta, członkostwa i metadane.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'Własny wybór';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Wybierz rodzaje rozmów, społeczności i zakres czasowy do uwzględnienia w archiwum.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Wybierz, co uwzględnić';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Wybierz, które rodzaje rozmów chcesz usunąć.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Tylko miejsca, do których nie mam już dostępu';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Usuń wiadomości tylko ze społeczności i grupowych DM-ów, które opuściłeś(-aś) lub z których zostałeś(-aś) usunięty(-a).';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Które rozmowy';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Wybierz rodzaje rozmów, które chcesz uwzględnić.';

  @override
  String get privacyDashboardDataRequestKindDms => 'Otwarte czaty';

  @override
  String get privacyDashboardDataRequestKindDmsClosed => 'Zamknięte DM-y';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'Grupowe DM-y';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Społeczności';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle =>
      'Które społeczności';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Filtr społeczności';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Uwzględnij wszystkie oprócz wybranych';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude => 'Tylko wybrane';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'Nie należysz teraz do żadnych społeczności.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Zakres czasu';

  @override
  String get privacyDashboardDataRequestDateMode => 'Zakres czasu';

  @override
  String get privacyDashboardDataRequestAllTime => 'Cały czas';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Niestandardowy zakres';

  @override
  String get privacyDashboardDataRequestStartDate => 'Data początkowa';

  @override
  String get privacyDashboardDataRequestEndDate => 'Data końcowa';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Pozostaw puste jedno z pól, aby nie ograniczać zakresu dat.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Wybierz co najmniej jeden rodzaj rozmowy do uwzględnienia.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'Data początkowa musi być wcześniejsza niż data końcowa.';

  @override
  String get privacyDashboardDataRequestConfirmTitle => 'Przejrzyj i potwierdź';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'Utworzymy archiwum do pobrania zawierające każdą wysłaną przez ciebie wiadomość i wyślemy ci e-maila, gdy będzie gotowe. Link do pobrania w tym e-mailu wygaśnie po 7 dniach.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'Utworzymy archiwum do pobrania, które będzie odpowiadać poniższym filtrom, i wyślemy Ci e-maila, gdy będzie gotowe. Link do pobrania w tej wiadomości wygaśnie po 7 dniach.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Trwale usuń wiadomości pasujące do poniższych filtrów. Tej operacji nie można cofnąć.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'Po rozpoczęciu tego procesu nie będzie możliwości odzyskania danych. Wyślemy ci wiadomość DM, gdy się zakończy.';

  @override
  String get privacyDashboardDataRequestRequestExport =>
      'Poproś o eksport danych';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Usuń wiadomości';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Zakres';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'Rozmowy';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Społeczności';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Zakres czasu';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'Brak';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'Od $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'Do $end';
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
      other: '# społeczności',
      many: '# społeczności',
      few: '# społeczności',
      one: '# społeczności',
    );
    return 'Wszystkie oprócz $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# społeczności',
      many: '# społeczności',
      few: '# społeczności',
      one: '# społeczność',
    );
    return 'Tylko $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Otwarte wiadomości prywatne';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Zamknięte wiadomości bezpośrednie';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Wiadomości bezpośrednie (otwarte i zamknięte)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'Grupowe DM-y';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Społeczności';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# godzin',
      many: '# godzin',
      few: '# godziny',
      one: '# godzina',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minut',
      many: '# minut',
      few: '# minuty',
      one: '# minuta',
    );
    return '$_temp0 i $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# godziny',
      many: '# godzin',
      few: '# godziny',
      one: '# godzina',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minuty',
      many: '# minut',
      few: '# minuty',
      one: '# minuta',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# sekundy',
      many: '# sekund',
      few: '# sekundy',
      one: '# sekunda',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed =>
      'Nie udało się załadować ustawień prywatności';

  @override
  String get privacyDashboardRetry => 'Ponów';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Nie udało się zapisać ustawień treści wrażliwych.';

  @override
  String get privacyDashboardDataRequestFailed =>
      'Nie udało się zrealizować żądania.';

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
      'Czekanie na wygaśnięcie trybu slowmode w jednym lub kilku wybranych kanałach.';

  @override
  String get slowmodeRateLimitedTitle => 'Tryb spowolniony aktywny';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'Włączono tryb spowolnienia — poczekaj $duration przed wysłaniem kolejnej wiadomości.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'Bezpośrednie przesyłanie jest wyłączone podczas trybu spowolnienia.';

  @override
  String get shareMediaTitle => 'Udostępnij w';

  @override
  String get shareMediaMessageHint => 'Dodaj opcjonalną wiadomość…';

  @override
  String get shareMediaSendButton => 'Wyślij';

  @override
  String get shareMediaSuccessToast => 'Udostępniono multimedia';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'Udostępniono w $count miejscach docelowych';
  }

  @override
  String get shareMediaFailedToast => 'Nie udało się udostępnić multimediów';

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
  String get chatMessageCopyEmbedText => 'Kopiuj tekst osadzenia';

  @override
  String get chatMessageTranslate => 'Przetłumacz';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Przetłumaczono z $language';
  }

  @override
  String get chatMessageSeeOriginal => 'Zobacz oryginał';

  @override
  String get chatMessageSeeTranslation => 'Zobacz tłumaczenie';

  @override
  String get chatMessageTranslating => 'Tłumaczenie…';

  @override
  String get chatMessageTranslateFailed =>
      'Nie udało się przetłumaczyć tej wiadomości.';

  @override
  String get chatMessageTranslateUnavailable =>
      'Tłumaczenie nie jest dostępne na tym urządzeniu.';

  @override
  String get chatMessageSpeak => 'Odsłuchaj wiadomość';

  @override
  String get chatMessageStopSpeaking => 'Zatrzymaj mówienie';

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
  String get chatMessageOpenLink => 'Otwórz link';

  @override
  String get chatMessageCopyLink => 'Kopiuj link';

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
  String get chatReactionAddFailed => 'Nie udało się dodać reakcji';

  @override
  String get chatReactionRemoveFailed => 'Nie udało się usunąć reakcji';

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
  String get chatMessageDeleteAttachment => 'Usuń załącznik';

  @override
  String get chatMessageEditAttachmentAltText => 'Edytuj tekst alternatywny';

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
      other: '$count zablokowanych wiadomości',
      one: '1 zablokowana wiadomość',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count potencjalnych wiadomości od spamerów',
      one: '1 potencjalna wiadomość od spamera',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Odpowiedź ukryta, ponieważ oryginalny autor jest zablokowany.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Odpowiedź ukryta, ponieważ oryginalny autor został oznaczony jako spamer.';

  @override
  String get devMarkAsSpamLocally => 'Oznacz jako spam lokalnie';

  @override
  String get devIgnoreSpamFlag => 'Ignoruj zgłoszenie spamu';

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
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

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
  String get mediaViewerOptions => 'Opcje multimediów';

  @override
  String get mediaViewerCopyLink => 'Kopiuj link';

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
    return 'Załącznik $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Zamknij';

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
  String get composerAutocompleteSuggestions => 'Sugestie';

  @override
  String get composerAutocompleteCommandsHeading => 'Polecenia';

  @override
  String get composerAutocompleteChoicesHeading => 'Wybory';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'Opcjonalne argumenty';

  @override
  String get composerAutocompleteChannelsHeading => 'Kanały';

  @override
  String get composerAutocompleteMembersHeading => 'Członkowie';

  @override
  String get composerAutocompleteUsersHeading => 'Użytkownicy';

  @override
  String get composerAutocompleteMentionsHeading => 'Wzmianki';

  @override
  String get composerAutocompleteRolesHeading => 'Role';

  @override
  String get composerAutocompleteMediaHeading => 'Multimedia';

  @override
  String get composerAutocompleteStickersHeading => 'Naklejki';

  @override
  String get composerAutocompleteGifsHeading => 'GIF-y';

  @override
  String get composerAutocompleteNoGifs => 'Nie znaleziono GIF-ów';

  @override
  String get composerCommandShrugDescription =>
      'Dołącza ¯\\_(ツ)_/¯ do Twojej wiadomości.';

  @override
  String get composerCommandTableflipDescription =>
      'Dołącza (╯°□°)╯︵ ┻━┻ do Twojej wiadomości.';

  @override
  String get composerCommandUnflipDescription =>
      'Dołącza ┬─┬ ノ( ゜-゜ノ) do Twojej wiadomości.';

  @override
  String get composerCommandMeDescription =>
      'Wyślij wiadomość akcji (zostanie wyświetlona kursywą).';

  @override
  String get composerCommandSpoilerDescription =>
      'Wyślij wiadomość ze spoilerem (ukrywa w tagach spoilera).';

  @override
  String get composerCommandTtsDescription =>
      'Wyślij wiadomość tekstową na mowę.';

  @override
  String get composerCommandNickDescription =>
      'Zmień swój pseudonim w tej społeczności.';

  @override
  String get composerCommandKickDescription =>
      'Wyrzuć członka z tej społeczności.';

  @override
  String get composerCommandBanDescription =>
      'Zbanuj członka z tej społeczności.';

  @override
  String get composerCommandMsgDescription =>
      'Wyślij wiadomość bezpośrednią do użytkownika.';

  @override
  String get composerCommandSavedDescription =>
      'Wyślij zachowany element multimedialny.';

  @override
  String get composerCommandStickerDescription => 'Wyślij naklejkę.';

  @override
  String get composerCommandGifDescription => 'Wyszukaj i wyślij GIF-a.';

  @override
  String get composerCommandMemberOption => 'Oznaczony członek.';

  @override
  String get composerCommandReasonOption => 'Powód (opcjonalnie).';

  @override
  String get composerCommandMessageOption => 'Wiadomość do wysłania.';

  @override
  String get composerCommandQueryOption => 'Czego szukać.';

  @override
  String get composerCommandNicknameOption =>
      'Twój nowy pseudonim lub pozostaw puste, aby zresetować.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'Ile ostatnich wiadomości użytkownika chcesz usunąć.';

  @override
  String get composerCommandDeleteMessagesNone => 'Nie usuwaj żadnych';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Poprzednie $count dni';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'Ostatnie 24 godziny';

  @override
  String get composerCommandOptionRequired =>
      'Ta opcja jest wymagana. Podaj wartość.';

  @override
  String get composerCommandClear => 'Wyczyść polecenie';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'Zmieniono twój pseudonim w tej społeczności z **$previousNickname** na **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'Nieznany użytkownik';

  @override
  String composerCommandMsgFailed(String username) {
    return 'Nie udało się wysłać wiadomości do **$username**. Mogą mieć wyłączone wiadomości prywatne lub możesz być zablokowany.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count więcej';
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
  String get addGuildCreateTitle => 'Utwórz społeczność';

  @override
  String get addGuildCreateDescription =>
      'Stwórz społeczność, aby rozmawiać ze znajomymi.';

  @override
  String get addGuildCreateNameLabel => 'Nazwa społeczności';

  @override
  String get addGuildCreateSubmit => 'Utwórz społeczność';

  @override
  String get addGuildCreateFailed =>
      'Nie udało się utworzyć społeczności. Spróbuj ponownie.';

  @override
  String get addGuildCreateClaimTitle => 'Odbierz swoje konto';

  @override
  String get addGuildCreateClaimDescription =>
      'Musisz zweryfikować swoje konto, zanim utworzysz społeczność.';

  @override
  String get addGuildCreateVerifyTitle => 'Zweryfikuj swój adres e-mail';

  @override
  String get addGuildCreateVerifyDescription =>
      'Musisz zweryfikować swój adres e-mail, zanim utworzysz społeczność.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Animowane ikony nie są obsługiwane podczas tworzenia nowej społeczności. Użyj statycznego obrazu.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'Tworząc społeczność, zgadzasz się przestrzegać i podtrzymywać ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return 'Wytyczne społeczności $productName';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'Ta instancja jest pojedynczą społecznością, więc nie można tworzyć dodatkowych społeczności.';

  @override
  String get addGuildCreateChangeIcon => 'Zmień ikonę';

  @override
  String get addGuildCreateIconLabel => 'Ikona społeczności';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Maks. 10 MB. Zalecane: 512×512 px';

  @override
  String get addGuildImportDescription =>
      'Wklej adres URL szablonu Discord, aby zaimportować jego strukturę do nowej społeczności.';

  @override
  String get addGuildImportUrlLabel => 'Adres URL szablonu';

  @override
  String get addGuildImportUrlInvalid =>
      'Wpisz prawidłowy adres URL lub kod szablonu Discord.';

  @override
  String get addGuildImportFetchFailed =>
      'Nie udało się pobrać szablonu społeczności. Szablon może nie istnieć lub usługa zewnętrzna jest niedostępna.';

  @override
  String get addGuildImportInvalidResponse =>
      'To nie wygląda na prawidłową odpowiedź szablonu.';

  @override
  String get addGuildImportTemplateLabel => 'Szablon';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount tekstowych, $voiceChannelCount głosowych, $categoryCount kategorii, $roleCount ról';
  }

  @override
  String get addGuildImportRemoveIcon => 'Usuń ikonę';

  @override
  String get addGuildImportTemplateInvalid =>
      'Dane szablonu społeczności są nieprawidłowe lub uszkodzone.';

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
  String get channelDetailsFallbackTitle => 'Szczegóły';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'DM grupowe · $count członków';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'Zamknąć rozmowę z $name?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'Opuścić $name?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Ustawienia kanału';

  @override
  String get channelDetailsGroupSettingsTitle => 'Ustawienia grupy';

  @override
  String get channelDetailsDmSettingsTitle =>
      'Ustawienia wiadomości prywatnych';

  @override
  String get channelDetailsInvitePeople => 'Zaproś ludzi';

  @override
  String get channelDetailsCopyLink => 'Kopiuj link';

  @override
  String get channelMenuCopyChannelLink => 'Kopiuj link do kanału';

  @override
  String get channelMenuCopyRedirectLink => 'Kopiuj link przekierowania';

  @override
  String get channelDetailsAddFriendsToGroup => 'Dodaj znajomych do grupy';

  @override
  String get channelDetailsGroupInvites => 'Zaproszenia do grupy';

  @override
  String get channelDetailsEditChannel => 'Edytuj kanał';

  @override
  String get channelDetailsDeleteChannel => 'Usuń kanał';

  @override
  String get channelSettingsCategorySettingsTitle => 'Ustawienia kategorii';

  @override
  String get channelSettingsEditCategory => 'Edytuj kategorię';

  @override
  String get channelSettingsTabOverview => 'Przegląd';

  @override
  String get channelSettingsTabPermissions => 'Uprawnienia';

  @override
  String get channelSettingsTabInvites => 'Zaproszenia';

  @override
  String get channelSettingsTabWebhooks => 'Webhooki';

  @override
  String get channelSettingsDeleteChannel => 'Usuń kanał';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'Czy na pewno chcesz usunąć $channelName? Tej operacji nie można cofnąć.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'Czy na pewno chcesz usunąć $categoryName? Tej operacji nie można cofnąć.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Usuń kategorię';

  @override
  String get channelSettingsChannelUpdated => 'Kanał zaktualizowany';

  @override
  String get channelSettingsChannelName => 'Nazwa kanału';

  @override
  String get channelSettingsCategoryName => 'Nazwa kategorii';

  @override
  String get channelSettingsMyCategory => 'Moja kategoria';

  @override
  String get categoryExpandCategory => 'Rozwiń kategorię';

  @override
  String get categoryCollapseCategory => 'Zwiń kategorię';

  @override
  String get categoryExpandAllCategories => 'Rozwiń wszystkie kategorie';

  @override
  String get categoryCollapseAllCategories => 'Zwiń wszystkie kategorie';

  @override
  String get categoryMuteCategory => 'Wycisz kategorię';

  @override
  String get categoryUnmuteCategory => 'Włącz powiadomienia dla kategorii';

  @override
  String get categoryCopyCategoryId => 'Kopiuj ID kategorii';

  @override
  String get categoryIdCopied => 'Skopiowano identyfikator kategorii';

  @override
  String get channelSettingsChannelNamePlaceholder => 'ogólne';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'Temat';

  @override
  String get channelSettingsTopicPlaceholder => 'Dodaj temat do tego kanału';

  @override
  String get channelSettingsInsertEmoji => 'Wstaw emoji';

  @override
  String get channelSettingsTopicTooLongTitle => 'Temat kanału jest za długi.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'Skróć temat i spróbuj ponownie.';

  @override
  String get channelSettingsSlowmode => 'Tryb wolny';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Odstęp między wiadomościami. Użytkownicy z uprawnieniem „$bypassSlowmodePermissionLabel” mogą go obejść.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Wyłączone';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds sekund';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes minuty';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours godz.';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute minuta';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour godzina';
  }

  @override
  String get channelSettingsVoiceQuality => 'Jakość głosu';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'Wyższa przepustowość = lepsza jakość i większe zużycie danych.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kb/s';
  }

  @override
  String get channelSettingsParticipantLimit => 'Limit uczestników';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Maksymalna liczba członków, którzy mogą dołączyć jednocześnie. 0 oznacza nielimitowaną.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count uczestników',
      one: '1 uczestnik',
      zero: '∞ Bez limitu',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Limit połączeń';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Maksymalna liczba aktywnych połączeń, które jeden użytkownik może utrzymać na tym kanale.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count połączeń',
      one: '1 połączenie',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Region głosowy';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Wybierz region głosu dla tego kanału. Automatyczny wybierze najbliższy region.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Automatycznie';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'Nie udało się załadować regionów głosowych';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Spróbuj ponownie za chwilę.';

  @override
  String get channelSettingsResetSlider => 'Przywróć domyślną wartość suwaka';

  @override
  String get channelSettingsAdvanced => 'Zaawansowane';

  @override
  String get channelSettingsMatureContentOverride =>
      'Nadpisanie treści dla dorosłych';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Zmień ustawienie poziomu $scopeLevel dla tego kanału. Treści dla dorosłych będą wyświetlane za bramką przed wejściem.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Dziedzicz';

  @override
  String get channelSettingsMatureContentOn => 'Włączone';

  @override
  String get channelSettingsMatureContentOff => 'Wyłączone';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Oznacz ten kanał jako zawierający treści dla dorosłych.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Pozostaw ten kanał bez ograniczeń dla treści dla dorosłych.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Dziedziczone z $inheritedSourceLabel: włączone';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Dziedziczone z $inheritedSourceLabel: wyłączone';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'kategoria';

  @override
  String get channelSettingsMatureContentCommunitySource => 'społeczności';

  @override
  String get channelSettingsMatureContentCategoryScope => 'Kategoria';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Społeczność';

  @override
  String get channelSettingsContentWarningToggle =>
      'Pokaż ostrzeżenie o treści w tym kanale';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Wyświetla monit o zgodę przed wejściem na ten kanał.';

  @override
  String get channelSettingsContentWarningText => 'Własny tekst ostrzeżenia';

  @override
  String get channelSettingsContentWarningDefault =>
      'To zawiera wrażliwe treści.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'Potrzebujesz uprawnienia \"$manageChannelsPermissionLabel\", aby edytować te uprawnienia.';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'Potrzebujesz uprawnienia \"$manageRolesPermissionLabel\", aby edytować te uprawnienia.';
  }

  @override
  String get channelSettingsUnknownRole => 'Nieznana rola';

  @override
  String get channelSettingsUnknownUser => 'Nieznany użytkownik';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides => 'Nadpisania dostępu';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Edytuj dostęp dla $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides => 'Wróć do zastąpień';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Skonfiguruj podstawowy dostęp do tego kanału';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Skonfiguruj zastąpienia dla tej roli';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Skonfiguruj zastąpienia dla tego członka';

  @override
  String get channelSettingsPermissionsSearchPlaceholder => 'Szukaj uprawnień…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Dostęp do kanału zaktualizowany';

  @override
  String get channelSettingsPermissionsTitle => 'Kontrola dostępu';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'Ten kanał jest zsynchronizowany z kategorią nadrzędną ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'Ten kanał nie jest zsynchronizowany z kategorią nadrzędną ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory =>
      'Synchronizuj z kategorią';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'Kanał zsynchronizowany z kategorią nadrzędną';

  @override
  String get channelSettingsPermissionsAddOverride => 'Dodaj zastąpienie';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Szukaj ról lub członków…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => 'Role i członkowie';

  @override
  String get channelSettingsDeleteInvite => 'Usuń zaproszenie';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Usunąć to zaproszenie? Tej operacji nie można cofnąć.';

  @override
  String get channelSettingsCopyInviteCode => 'Kopiuj kod zaproszenia';

  @override
  String get channelSettingsCopyInviteUrl => 'Kopiuj link z zaproszeniem';

  @override
  String get channelSettingsWebhookCreated => 'Utworzono webhooka';

  @override
  String get channelSettingsWebhookCreateFailed =>
      'Nie udało się utworzyć webhooka';

  @override
  String get channelSettingsCreateWebhook => 'Utwórz webhooka';

  @override
  String get channelSettingsInvitesDescription =>
      'Zarządzaj linkami zapraszającymi do tego kanału.';

  @override
  String get channelSettingsInvitesCreate => 'Utwórz zaproszenie';

  @override
  String get channelSettingsInvitesEmpty => 'Brak linków z zaproszeniami';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'Ten kanał nie ma jeszcze żadnych linków z zaproszeniami. Utwórz jeden, aby zaprosić osoby do tego kanału.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Wystąpił błąd podczas ładowania linków z zaproszeniami dla tego kanału. Spróbuj ponownie.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Zarządzaj przychodzącymi webhookami, które mogą publikować wiadomości na tym kanale.';

  @override
  String get channelSettingsWebhooksEmpty => 'Brak webhooków';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'Dla tego kanału nie skonfigurowano żadnych webhooków. Utwórz webhook, aby umożliwić aplikacjom zewnętrznym publikowanie wiadomości.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Ten kanał nie obsługuje webhooków.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'Potrzebujesz uprawnienia „$permission”, aby wyświetlać i edytować webhooki dla tego kanału.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'Nie udało się załadować webhooków';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Wystąpił błąd podczas ładowania webhooków dla tego kanału. Spróbuj ponownie.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Utworzone przez $creator dnia $date';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'Nieznany użytkownik';

  @override
  String get channelSettingsWebhooksAvatar => 'Awatar';

  @override
  String get channelSettingsWebhooksUploadImage => 'Prześlij obraz';

  @override
  String get channelSettingsWebhooksRemove => 'Usuń';

  @override
  String get channelSettingsWebhooksName => 'Nazwa';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Nazwa webhooka';

  @override
  String get channelSettingsWebhooksChannel => 'Kanał';

  @override
  String get channelSettingsWebhooksUrl => 'Adres URL webhooka';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Kopiuj adres URL webhooka';

  @override
  String get channelSettingsWebhooksDelete => 'Usuń webhooka';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'Nie udało się usunąć tego webhooka';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'Usunąć ten webhook? Nie można tego cofnąć.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Spróbuj ponownie za chwilę.';

  @override
  String get channelMenuOpenChat => 'Otwórz czat';

  @override
  String get channelMenuDuplicateChannel => 'Duplikuj kanał';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Zresetuj stan zgody na treści dla dorosłych';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Usunąć Twoje wiadomości w tym kanale?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Spowoduje to trwałe usunięcie wszystkich wiadomości wysłanych przez Ciebie na tym kanale. Tej operacji nie można cofnąć.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Usuń moje wiadomości';

  @override
  String get channelMenuDeletedYourMessages => 'Usunięto Twoje wiadomości';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'Nie udało się usunąć twoich wiadomości';

  @override
  String get channelDetailsSystemMessage => 'Wiadomość systemowa';

  @override
  String get channelDetailsTextChannel => 'Kanał tekstowy';

  @override
  String get channelDetailsVoiceChannel => 'Kanał głosowy';

  @override
  String get channelDetailsCategory => 'Kategoria';

  @override
  String get channelDetailsLinkChannel => 'Połącz kanał';

  @override
  String get channelDetailsGenericChannel => 'Kanał';

  @override
  String get channelDetailsMutedConversation => 'Wyciszona rozmowa';

  @override
  String get channelDetailsUnmutedConversation => 'Wiadomość odblokowana';

  @override
  String get channelDetailsMutedChannel => 'Wyciszony kanał';

  @override
  String get channelDetailsUnmutedChannel => 'Odsubskrybowano kanał';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Zaktualizowano ustawienia powiadomień';

  @override
  String get channelDetailsTabMembers => 'Członkowie';

  @override
  String get channelDetailsTabPins => 'Przypięte';

  @override
  String get channelDetailsActionMute => 'Wycisz';

  @override
  String get channelDetailsActionUnmute => 'Otwórz powiadomienia';

  @override
  String get channelDetailsActionSearch => 'Szukaj';

  @override
  String get channelDetailsActionMore => 'Więcej';

  @override
  String get channelDetailsMembersEmptyTitle => 'Brak członków do wyświetlenia';

  @override
  String get channelDetailsMembersEmptyBody =>
      'Członkowie pojawią się tutaj, gdy dane społeczności zostaną załadowane.';

  @override
  String get memberListPermissionDeniedTitle =>
      'Nie możesz wyświetlić członków';

  @override
  String get memberListPermissionDeniedBody =>
      'Nie możesz wyświetlić członków tego kanału w tej społeczności';

  @override
  String get memberListUnavailableTitle => 'Lista członków niedostępna';

  @override
  String get memberListUnavailableBody =>
      'Listy członków są tymczasowo niedostępne w tej społeczności';

  @override
  String get channelDetailsPinsLoadFailedTitle =>
      'Nie można było załadować przypiętych wiadomości';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'Osoby z uprawnieniem „Przypinaj wiadomości” mogą przypinać wiadomości, aby wszyscy je widzieli.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'Możesz przypinać wiadomości w tej rozmowie, aby wszyscy je widzieli.';

  @override
  String get channelDetailsPinsEndReached => 'To już wszystko';

  @override
  String get channelHeaderOpenDetails => 'Otwórz szczegóły kanału';

  @override
  String get channelHeaderPinnedMessages => 'Przypięte wiadomości';

  @override
  String get channelHeaderPinnedMessagesUnread =>
      'Przypięte wiadomości, nieprzeczytane';

  @override
  String get channelHeaderMemberList => 'Lista członków';

  @override
  String get channelHeaderInbox => 'Skrzynka odbiorcza';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Ustawienia powiadomień, wyciszone';

  @override
  String get channelDetailsSearchTitle => 'Szukaj';

  @override
  String get channelDetailsSearchHint => 'Szukaj wiadomości';

  @override
  String get channelDetailsSearchFilterFrom => 'Od';

  @override
  String get channelDetailsSearchFilterHas => 'Ma';

  @override
  String get channelDetailsSearchFilterIn => 'W';

  @override
  String get channelDetailsSearchFilterMentions => 'Wzmianki';

  @override
  String get channelDetailsSearchFilterMore => 'Więcej';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Aktywna';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count kanałów';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count użytkowników';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'Użytkownik';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Bot';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => 'Filtruj według kanału';

  @override
  String get channelDetailsSearchChannelsHint => 'Szukaj kanałów';

  @override
  String get channelDetailsSearchChannelsEmpty => 'Nie znaleziono kanałów';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Przypięte';

  @override
  String get channelDetailsSearchPinnedTrue => 'Tylko przypięte';

  @override
  String get channelDetailsSearchPinnedFalse => 'Wyklucz przypięte';

  @override
  String get channelDetailsSearchClearFilter => 'Wyczyść';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Typ autora';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Data';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Tryb daty';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Wybierz datę';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Nazwa hosta linku';

  @override
  String get channelDetailsSearchMoreFiltersFileName => 'Nazwa pliku zawiera';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'Rozszerzenie pliku';

  @override
  String get channelDetailsSearchContentPoll => 'Ankieta';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'Wiadomości z ankietą';

  @override
  String get channelDetailsSearchContentForward => 'Przekaż dalej';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Przekazane wiadomości';

  @override
  String get channelDetailsSearchFilterSort => 'Sortuj';

  @override
  String get channelHeaderSearchFiltersTitle => 'Filtry wyszukiwania';

  @override
  String get channelHeaderSearchRecentTitle => 'Ostatnie wyszukiwania';

  @override
  String get channelHeaderSearchUsersTitle => 'Użytkownicy';

  @override
  String get channelHeaderSearchChannelsTitle => 'Kanały';

  @override
  String get channelHeaderSearchValuesTitle => 'Wartości';

  @override
  String get channelHeaderSearchDatesTitle => 'Daty';

  @override
  String get channelHeaderSearchDefaultBadge => 'Domyślne';

  @override
  String get channelHeaderSearchClearHistory => 'Wyczyść';

  @override
  String get channelHeaderSearchFilterDescFrom => 'użytkownik';

  @override
  String get channelHeaderSearchFilterDescMentions => 'użytkownik';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'link, osadzone, obraz, wideo, dźwięk, plik, naklejka, …';

  @override
  String get channelHeaderSearchFilterDescBefore => 'data lub zakres dat';

  @override
  String get channelHeaderSearchFilterDescOn => 'data lub zakres dat';

  @override
  String get channelHeaderSearchFilterDescDuring => 'data lub zakres dat';

  @override
  String get channelHeaderSearchFilterDescAfter => 'data lub zakres dat';

  @override
  String get channelHeaderSearchFilterDescIn => 'kanał';

  @override
  String get channelHeaderSearchFilterDescPinned => 'prawda czy fałsz';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'użytkownik, bot lub webhook';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'nazwa hosta, np. example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'część nazwy pliku załącznika';

  @override
  String get channelHeaderSearchFilterDescFileType =>
      'rozszerzenie pliku, np. png';

  @override
  String get channelHeaderSearchFilterDescSort =>
      'sygnatura czasowa lub trafność';

  @override
  String get channelHeaderSearchFilterDescOrder => 'rosnąco lub malejąco';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString wyników',
      one: '1 wynik',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'Filtruj według użytkownika';

  @override
  String get channelDetailsSearchFilterByContent => 'Filtruj według treści';

  @override
  String get channelDetailsSearchSortBy => 'Sortuj wyniki według';

  @override
  String get channelDetailsSearchIn => 'Szukaj w';

  @override
  String get channelDetailsSearchEmptyTitle => 'Szukaj w tej rozmowie';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Wpisz tekst, autora lub filtr treści, aby znaleźć wiadomości.';

  @override
  String get channelDetailsSearchIndexingTitle => 'Wiadomości są indeksowane';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Spróbuj ponownie krótko po zakończeniu indeksowania tego zakresu przez wyszukiwanie.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Brak wyników';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Wypróbuj inne terminy wyszukiwania lub filtry.';

  @override
  String get channelDetailsMembersOnline => 'Online';

  @override
  String get channelDetailsMembersOffline => 'Nieaktywni';

  @override
  String get channelDetailsMemberYou => 'Ty';

  @override
  String get channelDetailsSearchUsersHint => 'Szukaj użytkowników';

  @override
  String get channelDetailsSearchUsersTypeToSearch =>
      'Wpisz, aby wyszukać członków';

  @override
  String get channelDetailsSearchUsersEmpty => 'Nie znaleziono użytkowników';

  @override
  String get channelDetailsSearchUsersNoAvailable =>
      'Brak dostępnych użytkowników';

  @override
  String get channelDetailsDone => 'Gotowe';

  @override
  String get channelDetailsHasFilterPrompt =>
      'Pokaż wiadomości, które zawierają:';

  @override
  String get channelDetailsRetry => 'Ponów';

  @override
  String get channelDetailsPinnedMessageTitle => 'Przypięta wiadomość';

  @override
  String get channelDetailsSearchResultTitle => 'Wynik wyszukiwania';

  @override
  String get channelDetailsJumpToMessage => 'Przejdź do wiadomości';

  @override
  String get channelDetailsUnpinMessage => 'Odpowiedz wiadomość';

  @override
  String get channelDetailsCopyMessageLink => 'Kopiuj link do wiadomości';

  @override
  String get channelDetailsCopyMessageId => 'Kopiuj identyfikator wiadomości';

  @override
  String get channelDetailsMessageUnpinned => 'Wiadomość odpięta';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Bieżąca społeczność';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'Bieżąca rozmowa';

  @override
  String get channelDetailsSearchScopeAllCommunities =>
      'Wszystkie Społeczności';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild =>
      'Wszystkie wiadomości prywatne';

  @override
  String get channelDetailsSearchScopeAllDms => 'Wszystkie czaty';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild =>
      'Tylko otwarte wiadomości prywatne';

  @override
  String get channelDetailsSearchScopeOpenDms => 'Otwarte czaty';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Wszystkie wiadomości prywatne i społeczności';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Otwarte wiadomości prywatne i społeczności';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Szukaj tylko w tej społeczności';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Szukaj tylko w bieżącej rozmowie';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'We wszystkich społecznościach, w których aktualnie jesteś';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Tylko we wszystkich czatach, w których kiedykolwiek byłeś(-aś)';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'We wszystkich czatach, w których brałeś(-aś) udział';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'We wszystkich otwartych wiadomościach prywatnych';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'We wszystkich otwartych wiadomościach bezpośrednich';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'We wszystkich wiadomościach prywatnych, w których kiedykolwiek brałeś udział + we wszystkich społecznościach, w których obecnie jesteś';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'We wszystkich otwartych wiadomościach prywatnych + wszystkich społecznościach, w których obecnie jesteś';

  @override
  String get channelDetailsSearchSortNewest => 'Najnowsze najpierw';

  @override
  String get channelDetailsSearchSortOldest => 'Najpierw najstarsze';

  @override
  String get channelDetailsSearchSortRelevance => 'Najtrafniejsze';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Pokaż najpierw najnowsze wiadomości';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Pokaż najpierw najstarsze wiadomości';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Pokaż najpierw najbardziej trafne wiadomości';

  @override
  String get channelDetailsSearchContentImage => 'Przesłany obraz';

  @override
  String get channelDetailsSearchContentVideo => 'Przesłany film';

  @override
  String get channelDetailsSearchContentAudio => 'Przesłany dźwięk';

  @override
  String get channelDetailsSearchContentFile => 'Przesłany plik';

  @override
  String get channelDetailsSearchContentLink => 'Link';

  @override
  String get channelDetailsSearchContentEmbed => 'Podgląd linku lub osadzenie';

  @override
  String get channelDetailsSearchContentSticker => 'Naklejka';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Tylko przesłane pliki graficzne';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Tylko przesłane pliki wideo';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Tylko przesłane pliki audio';

  @override
  String get channelDetailsSearchContentFileDescription => 'Dowolny załącznik';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'Wiadomość zawiera wpisany adres URL';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Rozwiązane podglądy i rozbudowane osadzenia, nie przesłane pliki';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Naklejka załączona do wiadomości';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count typów';
  }

  @override
  String get personalNotesTitle => 'Notatki osobiste';

  @override
  String get personalNotesSubtitle =>
      'Twoja prywatna przestrzeń na przemyślenia i przypomnienia';

  @override
  String groupDmWelcome(String displayName) {
    return 'Witamy w $displayName. Dodaj znajomych, aby rozpocząć rozmowę.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Edytuj grupę';

  @override
  String get groupDmWelcomeAddFriends => 'Dodaj znajomych do grupy';

  @override
  String get dmGroupInvites => 'Zaproszenia';

  @override
  String get groupDmEditTitle => 'Edytuj grupę';

  @override
  String get groupDmEditDetailsTooltip => 'Edytuj szczegóły grupy';

  @override
  String get groupDmGroupName => 'Nazwa grupy';

  @override
  String get groupDmMyGroup => 'Moja grupa';

  @override
  String get groupDmGroupNameMaxLength =>
      'Nazwa grupy nie może przekraczać 100 znaków';

  @override
  String get groupDmGroupIcon => 'Ikona grupy';

  @override
  String get groupDmUploadIcon => 'Prześlij ikonę';

  @override
  String get groupDmChangeIcon => 'Zmień ikonę';

  @override
  String get groupDmRemoveIcon => 'Usuń ikonę';

  @override
  String get groupDmUpdated => 'Grupa zaktualizowana';

  @override
  String get groupDmUpdateFailed =>
      'Nie udało się zaktualizować grupy. Spróbuj ponownie.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Animowane ikony nie są obsługiwane. Użyj statycznego obrazu.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Animowane ikony nie są obsługiwane';

  @override
  String get groupDmIconFileTooLargeTitle => 'Plik ikony jest za duży';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'Plik ikony jest za duży. Wybierz plik mniejszy niż $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'Nieobsługiwany format ikony';

  @override
  String get groupDmUnsupportedIconFormatBody => 'Nieobsługiwany typ pliku.';

  @override
  String get groupDmCouldntProcessImage => 'Nie udało się przetworzyć obrazu';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'Nie udało się przetworzyć przyciętego obrazu. Spróbuj ponownie.';

  @override
  String get groupDmInvalidImage => 'Nieprawidłowy obraz';

  @override
  String get groupDmInvalidImageBody =>
      'Ten obraz jest nieprawidłowy. Spróbuj z innym.';

  @override
  String get groupDmAddFriends => 'Dodaj';

  @override
  String get groupDmOrSendInvite => 'lub wyślij zaproszenie do znajomego:';

  @override
  String get groupDmGenerateInviteLink => 'Wygeneruj link z zaproszeniem';

  @override
  String get groupDmCreateInvite => 'Utwórz';

  @override
  String get groupDmInviteExpires24Hours =>
      'Twoje zaproszenie wygasa za 24 godziny';

  @override
  String get groupDmAddFriendFailed =>
      'Nie udało się dodać tego znajomego do grupy. Spróbuj ponownie.';

  @override
  String get groupDmAddFailed => 'Nie udało się dodać do grupy';

  @override
  String get groupDmGroupFull =>
      'Ta grupa jest pełna. Usuń kogoś, zanim dodasz więcej osób.';

  @override
  String get groupDmRateLimited =>
      'Działasz za szybko. Poczekaj chwilę i spróbuj ponownie.';

  @override
  String get groupDmCreateInviteFailed =>
      'Nie udało się utworzyć linku z zaproszeniem';

  @override
  String get groupDmCreateInviteFailedBody =>
      'Nie udało się wygenerować linku z zaproszeniem. Spróbuj ponownie.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'Nie udało się utworzyć linku z zaproszeniem. Spróbuj ponownie.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'Nie masz uprawnień do tworzenia zaproszeń na tym kanale.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'Ta społeczność osiągnęła limit zaproszeń.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'Tworzenie zaproszeń jest tymczasowo niedostępne dla tej społeczności.';

  @override
  String get groupDmCopyInviteFailed =>
      'Nie udało się skopiować linku z zaproszeniem';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Tylko właściciel grupy może zarządzać zaproszeniami.';

  @override
  String get groupDmNoInvitesCreated => 'Nie utworzono zaproszeń';

  @override
  String get groupDmLoadingInvites => 'Wczytuję zaproszenia...';

  @override
  String get groupDmInvitesLoadFailed =>
      'Nie udało się wczytać zaproszeń. Spróbuj ponownie.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Odwołać to zaproszenie? Tej operacji nie można cofnąć.';

  @override
  String get groupDmInviteRevoked => 'Zaproszenie wycofane';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Utworzone przez $name. Wygaśnie za $time.';
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
  String get composerOpenExpressionPicker => 'Otwórz wybieranie emotikon';

  @override
  String get composerShowKeyboard => 'Pokaż klawiaturę';

  @override
  String get composerCloseAttachmentPanel => 'Zamknij wybieranie załączników';

  @override
  String get chatAttachmentPanelPhotos => 'Zdjęcia';

  @override
  String get chatAttachmentPanelFiles => 'Pliki';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Potrzebny dostęp do biblioteki zdjęć';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Zezwól na dostęp do biblioteki zdjęć, aby przeglądać i dołączać ostatnie zdjęcia i filmy.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Otwórz ustawienia';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', wysyłanie';

  @override
  String get messageAccessibilityFailedSuffix => ', nie udało się wysłać';

  @override
  String get messageAccessibilityAttachmentSummary => 'załącznik';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count załączniki';
  }

  @override
  String get messageAccessibilityImageSummary => 'obrazek';

  @override
  String get messageAccessibilityVideoSummary => 'film';

  @override
  String get messageAccessibilityAudioSummary => 'plik audio';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'naklejka $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'plik $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'załącznik ze spoilerem';

  @override
  String get messageAccessibilityEmbedSummary => 'osadzony element';

  @override
  String get messageAccessibilityEmptySummary => 'wiadomość';

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
  String get userSettingsSearchPlaceholder => 'Szukaj ustawień…';

  @override
  String get userSettingsSearchFieldLabel => 'Szukaj ustawień';

  @override
  String get userSettingsSearchClear => 'Wyczyść wyszukiwanie';

  @override
  String get userSettingsSearchNoResults => 'Nie znaleziono ustawień';

  @override
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Bezpieczeństwo i logowanie';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Prezenty';

  @override
  String get giftSettingsClaimAccountTitle => 'Odbierz swoje konto';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Odbierz swoje konto, aby zrealizować lub zarządzać kodami podarunkowymi Plutonium.';

  @override
  String get giftSettingsRedeemTitle => 'Odbierz prezent';

  @override
  String get giftSettingsRedeemDescription =>
      'Wpisz kod podarunkowy, aby odebrać Plutonium dla swojego konta.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Wpisz kod podarunkowy…';

  @override
  String get giftSettingsRedeemButton => 'Odbierz';

  @override
  String get giftSettingsRedeemSuccess =>
      'Pomyślnie zrealizowano prezent. Miłego korzystania z Plutonium.';

  @override
  String get giftSettingsPurchasedTitle => 'Kupione prezenty';

  @override
  String get giftSettingsPurchasedDescription =>
      'Zarządzaj zakupionymi kodami prezentowymi Plutonium. Udostępnij link do prezentu komuś bliskiemu lub zrealizuj go dla siebie!';

  @override
  String get giftSettingsEmptyTitle => 'Brak prezentów';

  @override
  String get giftSettingsEmptyDescription =>
      'Kup prezent Plutonium z zakładki Plutonium, aby udostępnić go znajomym.';

  @override
  String get giftSettingsGoToPlutonium => 'Przejdź do Plutonium';

  @override
  String get giftSettingsLoadFailedTitle =>
      'Nie udało się załadować ekwipunku prezentów';

  @override
  String get giftSettingsLoadFailedDescription => 'Spróbuj ponownie później.';

  @override
  String get giftSettingsTryAgain => 'Spróbuj ponownie';

  @override
  String get giftSettingsGiftUrl => 'Adres URL prezentu';

  @override
  String get giftSettingsCopy => 'Kopiuj';

  @override
  String get giftSettingsCopied => 'Skopiowano';

  @override
  String get giftSettingsGiftUrlCopied => 'Link do prezentu skopiowany!';

  @override
  String get giftSettingsGiftUrlCopyFailed =>
      'Nie udało się skopiować adresu URL prezentu';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Zakupiono $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Zrealizowano $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Odebrane przez $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'Ten prezent został odebrany';

  @override
  String get giftSettingsRedeemForYourself => 'Odbierz dla siebie';

  @override
  String get giftSettingsShareWithFriend => 'Udostępnij znajomemu';

  @override
  String get premiumPlutoniumTagline =>
      'Odblokuj wyższe limity i ekskluzywne funkcje, wspierając jednocześnie niezależną platformę komunikacyjną.';

  @override
  String get premiumPurchaseMode => 'Tryb zakupu';

  @override
  String get premiumForMe => 'Dla mnie';

  @override
  String get premiumAsAGift => 'Jako prezent';

  @override
  String get premiumMonthly => 'Miesięcznie';

  @override
  String get premiumYearly => 'Rocznie';

  @override
  String get premiumPerMonth => 'miesięcznie';

  @override
  String get premiumPerYear => 'rocznie';

  @override
  String get premiumOneTimePurchase => 'zakup jednorazowy';

  @override
  String get premiumSave17 => 'Oszczędź 17%';

  @override
  String get premiumUpgradeNow => 'Uaktualnij teraz';

  @override
  String get premiumBuyGift => 'Kup prezent';

  @override
  String get premiumOneYearGift => 'Prezent na 1 rok';

  @override
  String get premiumOneMonthGift => 'Prezent: 1 miesiąc';

  @override
  String get premiumMostPopular => 'Najpopularniejsze';

  @override
  String get premiumScrollPrompt =>
      'Przewiń w dół, aby zobaczyć wszystkie korzyści związane z Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'Darmowa vs Plutonium';

  @override
  String get premiumFreeColumn => 'Bezpłatnie';

  @override
  String get premiumGiftSectionTitle => 'Podaruj Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'Podziel się doświadczeniem Plutonium ze znajomymi, kupując subskrypcję w prezencie.';

  @override
  String get premiumGiftBannerOne => 'Czeka na Ciebie nowy kod podarunkowy!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'Masz $count nowych kodów podarunkowych czekających na Ciebie!';
  }

  @override
  String get premiumViewGifts => 'Wyświetl prezenty';

  @override
  String get premiumReadyToUpgrade => 'Chcesz ulepszyć?';

  @override
  String get premiumReadyToBuyGift => 'Chcesz kupić prezent?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Miesięcznie $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Rocznie $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 rok $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 miesiąc $price';
  }

  @override
  String get premiumManageSubscription => 'Zarządzaj subskrypcją';

  @override
  String get premiumRedeemGiftCode => 'Zrealizuj kod podarunkowy';

  @override
  String get premiumGiftBadge => 'Prezent';

  @override
  String get premiumCancelSubscriptionTitle => 'Anulować subskrypcję?';

  @override
  String get premiumCancelSubscriptionBody =>
      'Zachowasz swoje korzyści do następnej daty odnowienia, a następnie masz 3 dni okresu prolongaty na ponowne zasubskrybowanie i zachowanie historii subskrypcji.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Anuluj subskrypcję';

  @override
  String get premiumKeepSubscription => 'Zachowaj subskrypcję';

  @override
  String get premiumPurchaseHistoryTitle => 'Historia zakupów';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Twoje ostatnie faktury. Aby zmienić metodę płatności dla swojej subskrypcji, dodaj lub wybierz jedną w portalu rozliczeniowym i ustaw ją jako domyślną.';

  @override
  String get premiumManagePaymentMethods => 'Zarządzaj metodami płatności';

  @override
  String get premiumBillingHistory => 'Historia płatności';

  @override
  String get premiumSelfServeRefundTitle => 'Zwrot środków w samoobsłudze';

  @override
  String get premiumSelfServeRefundButton => 'Zwróć najnowszy zakup';

  @override
  String get premiumDisclaimerAgreementPrefix =>
      'Kupując, zgadzasz się na nasze ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'Kupując, zgadzasz się na nasze ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' i ';

  @override
  String premiumActiveUntil(String date) {
    return 'Aktywne do $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Anulowanie';

  @override
  String premiumCancelsOn(String date) {
    return 'Anulowanie nastąpi $date. Korzyści pozostaną aktywne do tego czasu.';
  }

  @override
  String get premiumReactivateSubscription => 'Reaktywuj';

  @override
  String premiumGiftedUntil(String date) {
    return 'Prezent do $date. Nie odnawia się automatycznie.';
  }

  @override
  String get premiumComparisonFeatureColumn => 'Funkcja';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'Kupując, akceptujesz nasze $terms i $privacy.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Zwrot środków możliwy w ciągu 3 dni od płatności, raz na 30 dni. Zwrot środków za subskrypcję powoduje jej anulowanie. Kupujący z UE/EOG zrzekają się 14-dniowego prawa do odstąpienia od umowy przy kasie, aby uzyskać natychmiastowy dostęp do treści. Użyj przycisku zwrotu środków w aplikacji zamiast obciążenia zwrotnego. Obciążenia zwrotne mogą trwale ograniczyć dostęp do konta. Stripe bezpiecznie obsługuje płatności. Nigdy nie widzimy pełnego numeru Twojej karty.';

  @override
  String get premiumTermsOfService => 'Warunki korzystania z usługi';

  @override
  String get premiumPrivacyPolicy => 'Polityka prywatności';

  @override
  String get premiumCheckoutStartFailedTitle =>
      'Nie udało się rozpocząć płatności';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Coś poszło nie tak podczas rozpoczynania płatności. Spróbuj ponownie za chwilę.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'Masz subskrypcję podarunkową. Nie odnowi się automatycznie. Możesz zrealizować więcej kodów podarunkowych, aby ją przedłużyć. Subskrypcje cykliczne możesz uruchomić po zakończeniu okresu subskrypcji podarunkowej.';

  @override
  String get premiumPlanUnavailable =>
      'Ten plan jest niedostępny. Skontaktuj się z pomocą techniczną.';

  @override
  String get premiumCompletePaymentTitle => 'Dokończ płatność';

  @override
  String get premiumCompletePaymentBody =>
      'Teraz nastąpi przekierowanie do Stripe w celu dokończenia płatności. Po zakończeniu wróć do Fluxer.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Wybierz metodę płatności';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Zapłać przez Pix automatyczny, aby autoryzować cykliczne obciążenia bezpośrednio z Twojego brazylijskiego banku. Możesz też wybrać płatność kartą, aby wprowadzić dane karty kredytowej na następnym ekranie Stripe.';

  @override
  String get premiumUsePix => 'Użyj Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Zapłać za pomocą UPI, aby skonfigurować zgodny z RBI e-mandat ze swojego indyjskiego banku. Możesz też wybrać opcję użyj karty, aby wprowadzić dane karty kredytowej na następnym ekranie Stripe.';

  @override
  String get premiumUseUpi => 'Użyj UPI';

  @override
  String get premiumUseCard => 'Użyj karty';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Nie udało się otworzyć portalu płatności';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Coś poszło nie tak podczas otwierania portalu płatności. Spróbuj ponownie za chwilę.';

  @override
  String get premiumAlreadyVisionaryTitle => 'Masz już Visionary';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Wizjoner już zawiera stały dostęp, więc subskrypcja cykliczna nie jest potrzebna. Nadal możesz kupować prezenty dla innych.';

  @override
  String get premiumExistingSubscriptionTitle => 'Subskrypcja już istnieje';

  @override
  String get premiumExistingSubscriptionBody =>
      'Znaleźliśmy istniejącą subskrypcję Fluxer Plutonium dla tego konta. Zarządzaj nią w bezpiecznym portalu płatności, aby zaktualizować dane płatności lub sprawdzić status odnowienia. Jeśli właśnie zapłaciłeś, odczekaj minutę i otwórz tę stronę ponownie.';

  @override
  String get premiumPurchasesDisabledTitle => 'Zakupy niedostępne';

  @override
  String get premiumPurchasesDisabledBody =>
      'Zakupy są wyłączone dla tego konta. Skontaktuj się z support@fluxer.app, jeśli uważasz, że to błąd.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Odbierz swoje konto, aby kupić Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Musisz zweryfikować swój adres e-mail, zanim będziesz mógł kupić Fluxer Plutonium.';

  @override
  String get premiumPerkCustomUsernameTag => 'Własna nazwa użytkownika';

  @override
  String get premiumPerkPerCommunityProfiles =>
      'Profile dla każdej społeczności';

  @override
  String get premiumPerkMessageScheduling => 'Planowanie wiadomości';

  @override
  String get premiumPerkProfileBadge => 'Odznaka profilu';

  @override
  String get premiumPerkCustomVideoBackgrounds => 'Własne tła wideo';

  @override
  String get premiumPerkEntranceSounds => 'Dźwięki wejścia';

  @override
  String get premiumPerkCommunities => 'Społeczności';

  @override
  String get premiumPerkMessageCharacterLimit => 'Limit znaków w wiadomości';

  @override
  String get premiumPerkBookmarkedMessages => 'Zapisane wiadomości';

  @override
  String get premiumPerkFileUploadSize => 'Rozmiar przesyłanego pliku';

  @override
  String get premiumPerkEmojiStickerPacks => 'Pakiety emoji i naklejek';

  @override
  String get premiumPerkSavedMedia => 'Zapisane multimedia';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Używaj animowanych emoji';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Globalny dostęp do emoji i naklejek';

  @override
  String get premiumPerkVideoQuality => 'Jakość wideo';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Animowane awatary i banery profilowe';

  @override
  String get premiumPerkEarlyAccess => 'Wczesny dostęp do nowych funkcji';

  @override
  String get premiumPerkCustomThemes => 'Motywy niestandardowe';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Do 4K/60 kl./s';

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
  String get userSettingsNavShortcuts => 'Skróty klawiszowe';

  @override
  String get audioAndVideoAudioSectionTitle => 'Dźwięk';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'Skonfiguruj mikrofon, głośniki i przetwarzanie głosu.';

  @override
  String get audioAndVideoVideoSectionTitle => 'Wideo';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'Skonfiguruj jakość swojej kamery i udostępniania ekranu.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle =>
      'Zachowanie podczas rozmowy';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Kontroluj monity potwierdzenia podczas rozmów głosowych i wideo.';

  @override
  String get audioAndVideoInputDeviceLabel => 'Urządzenie wejściowe';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Urządzenie wyjściowe';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'Domyślne';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Użyj głośnika';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'Gdy wyłączone, dźwięk odtwarzany jest przez słuchawkę lub podłączone słuchawki.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Głośność wejścia';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Głośność wyjściowa';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Przetwarzanie głosu';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Głos skupiony';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Zalecane. Oczyszcza mikrofon, zapewniając czystą mowę.';

  @override
  String get audioAndVideoDirectInputLabel => 'Bezpośrednie wejście';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Wysyła dźwięk bez zmian. Najlepiej, jeśli używasz zewnętrznego oprogramowania audio.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Niestandardowe';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Dostosuj każde ustawienie samodzielnie: tłumienie szumów, eliminacja echa i wzmocnienie.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Tłumienie szumów';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Ulepszone';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Standardowy';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Brak';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Redukcja echa';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Automatyczna kontrola wzmocnienia';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Wyrównuje głośność mikrofonu. Wyłączone, gdy włączone jest wzmocnione tłumienie.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Test mikrofonu';

  @override
  String get audioAndVideoMicTestStartLabel => 'Rozpocznij test mikrofonu';

  @override
  String get audioAndVideoMicTestStopLabel => 'Zatrzymaj test mikrofonu';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '$productName potrzebuje dostępu do mikrofonu, aby przetestować Twój dźwięk.';
  }

  @override
  String get audioAndVideoCameraLabel => 'Kamera';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Odbij obraz z kamery';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'Jakość aparatu';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'Jakość udostępniania ekranu';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Liczba klatek na sekundę';

  @override
  String get audioAndVideoFrameRate15Label => '15 kl./s';

  @override
  String get audioAndVideoFrameRate30Label => '30 kl./s';

  @override
  String get audioAndVideoFrameRate60Label => '60 kl./s';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080p i 60 FPS wymagają $premiumProductName.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Ta instancja pozwala obecnie na udostępnianie ekranu w rozdzielczości do 720p przy 30 FPS.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return '$productName potrzebuje dostępu do mikrofonu, aby wyświetlić twoje urządzenia.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return '$productName potrzebuje dostępu do kamery, aby wyświetlić Twoje urządzenia.';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'Nie pytaj przy ukrywaniu mojej kamery';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'Nie pytaj przy ukrywaniu mojego udostępniania ekranu';

  @override
  String get userSettingsNavNotifications => 'Powiadomienia';

  @override
  String get notificationsGeneralSectionTitle => 'Ogólne';

  @override
  String get notificationsEnableNotificationsLabel => 'Włącz powiadomienia';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Otrzymuj powiadomienia o nowych wiadomościach. Może być konieczne włączenie powiadomień dla aplikacji $productName w ustawieniach urządzenia. Aby uzyskać kontrolę nad powiadomieniami dla poszczególnych kanałów/społeczności, otwórz ustawienia powiadomień z menu społeczności.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Włącz powiadomienia na komputerze';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Korzysta z centrum powiadomień systemu operacyjnego. Aby dostosować powiadomienia dla konkretnego kanału lub społeczności, kliknij prawym przyciskiem myszy ikonę społeczności i otwórz ustawienia powiadomień.';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'Włącz powiadomienia przeglądarki';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'Otrzymuj powiadomienia o nowych wiadomościach. Może być konieczne włączenie powiadomień w ustawieniach przeglądarki. Aby dostosować ustawienia dla poszczególnych kanałów/społeczności, kliknij prawym przyciskiem myszy ikonę społeczności i otwórz ustawienia powiadomień.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Limit czasu nieaktywności powiadomień push';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName zapobiega wysyłaniu powiadomień push na urządzenia mobilne, gdy pracujesz na komputerze. Wybierz, jak długo musisz być nieaktywny na komputerze, zanim zaczniesz otrzymywać powiadomienia push.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute minuta';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes minuty';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle =>
      'Preferencje wzmianek';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Preferencje wzmianek w odpowiedziach';

  @override
  String get notificationsMentionNoPreferenceName => 'Bez preferencji';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Uszanuj intencje nadawcy, bez ostrzeżenia, gdy włączy lub wyłączy wzmiankę @';

  @override
  String get notificationsMentionPreferMentionName => 'Preferuj wzmianki';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Domyślnie odpowiada na wzmianki o Tobie i ostrzega nadawcę, jeśli wyłączy tę funkcję';

  @override
  String get notificationsMentionPreferNoMentionName =>
      'Nie preferuję wzmianek';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Domyślnie pomijaj wzmiankę @, a jeśli nadawca ją włączy, ostrzeż go';

  @override
  String get notificationsTtsSectionTitle => 'Powiadomienia tekst-na-mowę';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'Włącz odtwarzanie mowy /tts';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'Pozwól /tts odczytać wiadomość na głos. Wyłączenie tego ustawienia sprawi, że polecenia będą wyświetlane jako zwykły tekst.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Dostosuj szybkość odtwarzania w ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Dostępność';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle =>
      'Automatyczne czytanie wiadomości';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Konwertuje przychodzące treści na mowę, niezależnie od tego, czy pochodzą z /tts.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Wszystkie kanały';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Niech każda przychodząca wiadomość będzie odczytywana na głos, niezależnie od otwartego kanału.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Tylko aktywny kanał';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Narracja tylko dla kanału, który oglądasz. Narracja podąża za tobą między kanałami.';

  @override
  String get notificationsTtsModeNeverName => 'Nigdy automatycznie';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Pozostań w trybie cichym, chyba że ktoś ręcznie uruchomi /tts.';

  @override
  String get notificationsTtsModeAriaLabel =>
      'Czytaj wszystkie wiadomości na głos';

  @override
  String get notificationsSoundsSectionTitle => 'Dźwięki';

  @override
  String get notificationsMasterVolumeLabel => 'Głośność główna';

  @override
  String get notificationsMasterVolumeDescription =>
      'Ustawia poziom dla wszystkich efektów dźwiękowych. Ustawienia indywidualne dla poszczególnych dźwięków ignorują to.';

  @override
  String get notificationsResetToDefaultVolume => 'Przywróć domyślną głośność';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Wyłącz wszystkie dźwięki powiadomień';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Twoje dotychczasowe ustawienia dźwięków powiadomień zostaną zachowane.';

  @override
  String get notificationsShowMoreSoundEffects =>
      'Pokaż więcej efektów dźwiękowych';

  @override
  String get notificationsShowFewerSoundEffects =>
      'Pokaż mniej efektów dźwiękowych';

  @override
  String get notificationsPreviewSound => 'Podgląd dźwięku';

  @override
  String get notificationsPerSoundVolumeTitle =>
      'Głośność poszczególnych dźwięków';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Ustaw niestandardową głośność dla poszczególnych dźwięków. Dźwięki bez indywidualnych ustawień będą odtwarzane z głośnością główną.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Aktywne niestandardowe ustawienia głośności dźwięków: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Zgodnie z ustawieniami głównymi • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'Zresetuj $label do głośności głównej';
  }

  @override
  String get notificationsResetAllOverrides => 'Zresetuj wszystkie zmiany';

  @override
  String notificationsMuteSound(String label) {
    return 'Wyłącz dźwięk powiadomienia $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'Włącz dźwięk powiadomienia $label';
  }

  @override
  String get notificationsSoundMessage =>
      'Powiadomienia o wiadomościach społeczności';

  @override
  String get notificationsSoundDirectMessage =>
      'Powiadomienia o wiadomościach bezpośrednich';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Powiadomienia o wiadomościach z bieżącego kanału';

  @override
  String get notificationsSoundMute => 'Wyciszenie głosu';

  @override
  String get notificationsSoundUnmute => 'Wyciszenie głosu wyłączone';

  @override
  String get notificationsSoundDeaf => 'Wyciszenie dźwięku';

  @override
  String get notificationsSoundUndeaf => 'Wyłączenie wyciszenia słuchawek';

  @override
  String get notificationsSoundUserJoin => 'Użytkownik dołącza do kanału';

  @override
  String get notificationsSoundUserLeave => 'Użytkownik opuszcza kanał';

  @override
  String get notificationsSoundUserMove => 'Użytkownik przeniósł kanał';

  @override
  String get notificationsSoundViewerJoin => 'Widz dołącza do transmisji';

  @override
  String get notificationsSoundViewerLeave => 'Widz opuszcza transmisję';

  @override
  String get notificationsSoundVoiceDisconnect => 'Rozmowa głosowa rozłączona';

  @override
  String get notificationsSoundIncomingRing => 'Połączenie przychodzące';

  @override
  String get notificationsSoundCameraOn => 'Kamera włączona';

  @override
  String get notificationsSoundCameraOff => 'Kamera wyłączona';

  @override
  String get notificationsSoundScreenShareStart =>
      'Rozpoczęcie udostępniania ekranu';

  @override
  String get notificationsSoundScreenShareStop =>
      'Zatrzymanie udostępniania ekranu';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'Nie udało się zaktualizować limitu czasu powiadomień push. Spróbuj ponownie.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Nie udało się zaktualizować preferencji wzmianek. Spróbuj ponownie.';

  @override
  String get notificationsPermissionDeniedTitle => 'Powiadomienia zablokowane';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'Nie udało się włączyć powiadomień. Aby kontynuować, zezwól na uprawnienia do powiadomień.';

  @override
  String get userSettingsNavLanguageAndTime => 'Język i czas';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Język interfejsu';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Wybierz język używany w całej aplikacji';

  @override
  String get languageAndTimeOpenLanguageSettings => 'Otwórz ustawienia języka';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Format czasu';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Wybierz sposób wyświetlania godzin w aplikacji';

  @override
  String get languageAndTimeTimeFormatSelectionLabel => 'Wybór formatu godziny';

  @override
  String get languageAndTimeTimeFormatAuto => 'Automatycznie';

  @override
  String get languageAndTimeTimeFormat12Hour => '12-godzinny';

  @override
  String get languageAndTimeTimeFormat24Hour => '24-godzinny';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'Język aplikacji: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Ustawienia regionalne systemu: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Użyj ustawień systemowych dla formatu czasu';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'Nie udało się zaktualizować formatu czasu';

  @override
  String get userSettingsNavDefaultApps => 'Domyślne aplikacje';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Przeglądarka internetowa';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Wybierz przeglądarkę, która będzie otwierać linki po ich kliknięciu.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'Jeśli aplikacja jest zainstalowana dla danej witryny, linki będą najpierw otwierane w tej aplikacji.';

  @override
  String get defaultAppsWebBrowserInApp => 'Przeglądarka w aplikacji';

  @override
  String get defaultAppsWebBrowserExternal => 'Przeglądarka zewnętrzna';

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
  String get advancedSettingsConfigure => 'Skonfiguruj';

  @override
  String get advancedSettingsCategoryPrivacy => 'Prywatność';

  @override
  String get advancedSettingsCategoryAppearance => 'Wygląd';

  @override
  String get advancedSettingsCategoryAccessibility => 'Dostępność';

  @override
  String get advancedSettingsCategoryChat => 'Czat';

  @override
  String get advancedSettingsCategoryMedia => 'Multimedia';

  @override
  String get advancedSettingsCategoryVoice => 'Głosowe';

  @override
  String get advancedSettingsCategoryDeveloper => 'Deweloper';

  @override
  String get advancedSettingEnableTextSelectionLabel =>
      'Włącz zaznaczanie tekstu';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Pozwala na zaznaczanie tekstu w aplikacji.';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Włącz miniatury wideo podczas przewijania';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Miniatura lub klatka wideo podczas przewijania';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Informacje zwrotne';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Informacja zwrotna wibracyjna dla stuknięć i akcji. Nie będzie synchronizowana między urządzeniami.';

  @override
  String get advancedSettingShowNekoLabel => 'Pokaż Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'Kociak Neko goniący Twój kursor';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Pokaż Neko przy wprowadzaniu tekstu na czacie';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Animacja przybliżenia';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Przybliż logo, gdy opuszczasz ekran powitalny';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Wskazówki klawiatury';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Podpowiedzi dotyczące skrótów klawiszowych w podpowiedziach.';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Włącz ulubione';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Pokaż ulubione w całej aplikacji';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Zachowanie podczas dołączania do kanału głosowego';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Potwierdzenie lub dwukrotne kliknięcie w celu dołączenia do czatu głosowego.';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Wymagaj dwukrotnego kliknięcia, aby dołączyć do kanałów głosowych';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Pytaj o potwierdzenie przed dołączeniem do kanałów głosowych';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Automatycznie wysyłaj GIF-y po wybraniu';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Automatyczne wysyłanie GIF-ów z panelu wyboru bez potwierdzenia';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Zapisuj ulubione GIF-y jako zapisane multimedia';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Wybierz sposób przechowywania ulubionych GIF-ów oznaczonych gwiazdką';

  @override
  String get advancedSettingMediaButtonsLabel => 'Przyciski multimediów';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Dostosuj, które przyciski i wskaźniki mają być wyświetlane na załącznikach multimedialnych i osadzonych treściach';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Wyślij załączniki przed wysłaniem';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Rozpocznij przesyłanie załączników natychmiast po dodaniu ich do pola wiadomości';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Usuwaj parametry śledzenia z adresów URL';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Automatycznie usuwaj parametry śledzenia z adresów URL w wysyłanych wiadomościach';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'Zawsze ufaj linkom zewnętrznym';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'Pomiń ostrzeżenie o linkach zewnętrznych dla wszystkich domen';

  @override
  String get advancedSettingSearchEnginesLabel => 'Wyszukiwarki';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Skonfiguruj wyszukiwarki używane do przeszukiwania zaznaczonego tekstu';

  @override
  String get advancedSettingTranslatorsLabel => 'Tłumacze';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Skonfiguruj dostawców tłumaczeń używanych do tłumaczenia wybranego tekstu';

  @override
  String get advancedSettingReverseImageSearchLabel => 'Wyszukiwanie obrazem';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Dostawcy wyszukiwania obrazów';

  @override
  String get advancedSettingMessageActionBarLabel => 'Pasek akcji wiadomości';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Dostosuj pasek akcji, który pojawia się po najechaniu kursorem na wiadomości';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Autouzupełnianie wyrażeń';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Wybierz, co ma się wyświetlać po wpisaniu dwukropka w polu wiadomości';

  @override
  String get advancedSettingInputButtonsLabel =>
      'Przyciski wprowadzania wiadomości';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Wybierz, które przyciski mają być wyświetlane w polu wprowadzania wiadomości';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Przewiń na dół po wysłaniu wiadomości';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Wybierz, co ma się dziać z czatem po wysłaniu wiadomości';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Pomiń potwierdzenie \"Oznacz wszystkie jako przeczytane\"';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Oznacz wszystkie nieprzeczytane kanały w skrzynce odbiorczej jako przeczytane natychmiast, bez pytania o potwierdzenie';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Domyślnie ukrywaj wyciszone kanały';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Ukrywaj wyciszone kanały na paskach bocznych społeczności';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'Pokaż wskaźnik GIF-ów';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Pokaż wskaźnik wygaśnięcia załącznika';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'Pokaż przycisk usuwania';

  @override
  String get advancedSettingShowMediaDownloadLabel =>
      'Pokaż przycisk pobierania';

  @override
  String get advancedSettingShowMediaFavoriteLabel =>
      'Pokaż przycisk ulubionych';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Pokaż przycisk ukrywania załączników';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Pokaż pasek akcji wiadomości';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel =>
      'Pokaż tylko przycisk \"Więcej\"';

  @override
  String get advancedSettingShowQuickReactionsLabel => 'Pokaż szybkie reakcje';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Włącz Shift, aby rozwinąć';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Pokaż domyślne emoji w autouzupełnianiu ekspresji';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Pokaż własne emoji w autouzupełnianiu ekspresji';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Pokaż naklejki w autouzupełnianiu emotikon';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Pokaż zapisane multimedia w autouzupełnianiu ekspresji';

  @override
  String get advancedSettingShowGifsButtonLabel => 'Pokaż przycisk GIF-ów';

  @override
  String get advancedSettingShowMediaButtonLabel =>
      'Pokaż przycisk multimediów';

  @override
  String get advancedSettingShowStickersButtonLabel =>
      'Pokaż przycisk naklejek';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Pokaż przycisk emoji';

  @override
  String get advancedSettingShowSendButtonLabel => 'Pokaż przycisk wysyłania';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Pokaż alerty o nowych urządzeniach';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Zapytanie o nowe urządzenia audio';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Sterowanie głośnością połączenia';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Pokaż suwaki głośności uczestników dla poszczególnych urządzeń w menu głosowych';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Zachowanie podglądu udostępniania ekranu';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Podgląd, okienkowy i zachowanie miniatur strumieni';

  @override
  String get advancedSettingScreenShareCodecLabel =>
      'Kodek udostępniania ekranu';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Kodek wideo do udostępniania ekranu';

  @override
  String get advancedSettingScreenShareCodecAuto => 'Automatycznie (zalecane)';

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
      'Wstrzymaj podgląd udostępniania ekranu w tle';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Ukryj miniaturę podglądu mojego strumienia';

  @override
  String get advancedSettingDeveloperModeLabel => 'Włącz tryb programisty';

  @override
  String get advancedSettingDeveloperModeDescription =>
      'Włącz tryb programisty';

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
  String get advancedSettingTranslatorGoogle => 'Tłumaczenie Google';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel => 'Domyślna wyszukiwarka';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Wybierz domyślną wyszukiwarkę używaną podczas wyszukiwania zaznaczonego tekstu.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Wbudowane wyszukiwarki';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Włącz lub wyłącz wbudowane wyszukiwarki. Włączone wyszukiwarki pojawią się w menu kontekstowym wiadomości po zaznaczeniu tekstu.';

  @override
  String get advancedSettingCustomSearchEnginesLabel => 'Własne wyszukiwarki';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Dodaj własne wyszukiwarki z niestandardowym wzorcem adresu URL. Użyj „$query” jako symbolu zastępczego dla tekstu wyszukiwania.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Dodaj wyszukiwarkę';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Włącz co najmniej jedną wyszukiwarkę poniżej.';

  @override
  String get advancedSettingRemoveSearchEngineLabel => 'Usuń wyszukiwarkę';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'Domyślny tłumacz';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Wybierz domyślny translator do tłumaczenia zaznaczonego tekstu.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Wbudowane tłumaczenia';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Włącz lub wyłącz wbudowane tłumacze. Włączone tłumacze pojawią się w menu kontekstowym wiadomości po zaznaczeniu tekstu.';

  @override
  String get advancedSettingCustomTranslatorsLabel => 'Własne tłumaczenia';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Dodaj własne tłumaczenia za pomocą niestandardowego wzorca adresu URL. Użyj `$query` jako symbolu zastępczego dla tekstu do przetłumaczenia.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Dodaj tłumacza';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Włącz co najmniej jeden translator poniżej.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Usuń tłumacza';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Domyślne wyszukiwanie obrazem';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Wybierz domyślną usługę wyszukiwania obrazem, która będzie używana podczas wyszukiwania obrazu.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Wbudowane wyszukiwanie obrazem';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Włącz lub wyłącz wbudowane wyszukiwarki obrazów. Włączone wyszukiwarki pojawią się w menu kontekstowym obrazów, awatarów, banerów, naklejek i emoji.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Własne wyszukiwanie obrazem';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Dodaj własnych dostawców wyszukiwania obrazem wstecz z niestandardowym wzorcem adresu URL. Użyj `$url` jako symbolu zastępczego dla adresu URL obrazu.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Dodaj wyszukiwanie obrazem';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Włącz co najmniej jednego dostawcę wyszukiwania obrazem.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Usuń wyszukiwanie obrazem';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Dodaj wyszukiwarkę';

  @override
  String get advancedSettingEditSearchEngineTitle => 'Edytuj wyszukiwarkę';

  @override
  String get advancedSettingAddTranslatorTitle => 'Dodaj dostawcę tłumaczeń';

  @override
  String get advancedSettingEditTranslatorTitle => 'Edytuj dostawcę tłumaczeń';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Dodaj wyszukiwarkę obrazów';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Edytuj wyszukiwarkę obrazem';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Nazwa';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'Wzorzec adresu URL';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'Moja wyszukiwarka';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Mój tłumacz';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'Moje wyszukiwanie obrazem';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Użyj „$query”, gdzie powinna zostać wstawiona wyszukiwana fraza.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Użyj „$query”, aby wstawić tekst do przetłumaczenia.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Użyj „$url”, aby wstawić adres URL obrazu.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired =>
      'Nazwa jest wymagana.';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'Wymagany jest wzorzec adresu URL.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'Wzorzec adresu URL musi zawierać symbol zastępczy „$query”.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'Wzorzec adresu URL musi zawierać parametr „$url”.';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'Wzorzec adresu URL musi być prawidłowym adresem URL.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Dodaj';

  @override
  String get advancedSettingEditSearchProviderAction => 'Edytuj';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Usuń';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'Czy na pewno chcesz usunąć $engineName?';
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
  String get userSettingsJoinFluxerLabs => 'Dołącz do Fluxer Labs';

  @override
  String get userSettingsNavAppLicenses => 'Licencje aplikacji';

  @override
  String get userSettingsAppLicensesDescription =>
      'Oprogramowanie open source używane w tej aplikacji. Ta aplikacja jest zbudowana przy użyciu Flutter.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'Nie udało się załadować licencji aplikacji.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count licencji',
      one: '1 licencja',
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
  String get savedMessagesEmptyTitle => 'Brak zakładek';

  @override
  String get savedMessagesEmptyBody =>
      'Dodaj wiadomości do zakładek, aby zapisać je na później.';

  @override
  String get savedMessagesEndBody => 'Nie ma tu nic więcej do zobaczenia.';

  @override
  String get savedMessagesRemoveTooltip => 'Usuń zakładkę';

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
  String get uiSearch => 'Szukaj';

  @override
  String get uiStartCall => 'Rozpocznij połączenie';

  @override
  String get uiStartVideoCall => 'Rozpocznij rozmowę wideo';

  @override
  String get uiPlay => 'Odtwórz';

  @override
  String get uiPause => 'Wstrzymaj';

  @override
  String get uiDownload => 'Pobierz';

  @override
  String get uiMoreActions => 'Więcej działań';

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
    return 'Powiadomimy $count członków z rolą $roleName. Kontynuować?';
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
  String get guildNavbarGuildSelected => 'Wybrano';

  @override
  String get guildNavbarGuildUnread => 'nieprzeczytane';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count wzmianek',
      one: '1 wzmianka',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'wyciszone';

  @override
  String get authShowPassword => 'Pokaż hasło';

  @override
  String get authHidePassword => 'Ukryj hasło';

  @override
  String get chatLoadingMessages => 'Ładowanie wiadomości';

  @override
  String get friendsMessageFriend => 'Wyślij wiadomość';

  @override
  String get friendsFriendActions => 'Akcje znajomego';

  @override
  String get friendsAcceptRequest => 'Zaakceptuj zaproszenie do znajomych';

  @override
  String get friendsDeclineRequest => 'Odrzuć zaproszenie do znajomych';

  @override
  String get friendsCancelRequest => 'Anuluj zaproszenie do znajomych';

  @override
  String get friendsOpenInbox => 'Skrzynka odbiorcza';

  @override
  String get profileRemoveFriend => 'Usuń znajomego';

  @override
  String get profileUnblockUser => 'Odblokuj użytkownika';

  @override
  String get profileAcceptFriendRequest =>
      'Zaakceptuj zaproszenie do znajomych';

  @override
  String get profileCancelFriendRequest => 'Anuluj zaproszenie do znajomych';

  @override
  String get profileSendFriendRequest => 'Dodaj znajomego';

  @override
  String get accountOverflowMenu => 'Opcje konta';

  @override
  String get navHome => 'Główna';

  @override
  String get navNotifications => 'Powiadomienia';

  @override
  String get navYou => 'Ty';

  @override
  String get guildFolderSettingsTitle => 'Ustawienia folderu';

  @override
  String get guildFolderNameLabel => 'Nazwa folderu';

  @override
  String get guildFolderColorLabel => 'Kolor folderu';

  @override
  String get guildFolderShowIconWhenCollapsed => 'Pokaż ikonę po zwinięciu';

  @override
  String get guildFolderIconLabel => 'Ikona folderu';

  @override
  String get guildFolderDelete => 'Usuń folder';

  @override
  String get guildFolderIconFolder => 'Folder';

  @override
  String get guildFolderIconStar => 'Oznacz gwiazdką';

  @override
  String get guildFolderIconHeart => 'Serce';

  @override
  String get guildFolderIconBookmark => 'Zakładka';

  @override
  String get guildFolderIconGameController => 'Kontroler gier';

  @override
  String get guildFolderIconShield => 'Osłona';

  @override
  String get guildFolderIconMusicNote => 'Nuta';

  @override
  String get guildFolderMarkAsRead => 'Oznacz folder jako przeczytany';

  @override
  String get guildBulkMuteCommunities => 'Wycisz społeczności';

  @override
  String get guildBulkUnmuteCommunities => 'Wyłącz wyciszenie społeczności';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Ustawienia powiadomień społeczności';

  @override
  String get guildBulkCommunityPrivacySettings =>
      'Ustawienia prywatności społeczności';

  @override
  String get guildBulkAllowEveryoneAndHere => 'Zezwól na @everyone i @here';

  @override
  String get guildBulkAllowRoleMentions => 'Zezwól na wzmianki o rolach';

  @override
  String get guildBulkEnableMobilePush =>
      'Włącz powiadomienia push na urządzeniach mobilnych';

  @override
  String get guildBulkDisableMobilePush =>
      'Wyłącz powiadomienia push na urządzeniach mobilnych';

  @override
  String get guildBulkAllowDirectMessages =>
      'Zezwól na bezpośrednie wiadomości';

  @override
  String get guildBulkBlockDirectMessages => 'Blokuj wiadomości bezpośrednie';

  @override
  String get guildBulkAllowBotDirectMessages =>
      'Zezwól botowi na bezpośrednie wiadomości';

  @override
  String get guildBulkBlockBotDirectMessages =>
      'Blokuj wiadomości bezpośrednie od botów';

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
  String get guildNavbarChannelTypeSelection => 'Wybór typu kanału';

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
  String get guildMenuSettingsEmoji => 'Emoji';

  @override
  String get guildMenuSettingsStickers => 'Naklejki';

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
  String get guildMenuSettingsInviteLinks => 'Zaproszenia';

  @override
  String get guildMenuSettingsBans => 'Bany';

  @override
  String get guildMenuSettingsChannels => 'Kanały';

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
  String get guildSettingsRolesNewRole => 'Nowa rola';

  @override
  String get guildSettingsRolesDeleteRole => 'Usuń rolę';

  @override
  String get guildSettingsRolesBackToRoles => 'Wróć do ról';

  @override
  String get guildSettingsBackToSettings => 'Wróć do ustawień';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Edytuj „$name”';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Skonfiguruj ustawienia i uprawnienia roli';

  @override
  String get guildSettingsRolesDisplaySection => 'Wyświetlanie';

  @override
  String get guildSettingsRolesRoleName => 'Nazwa roli';

  @override
  String get guildSettingsRolesRoleColor => 'Kolor roli';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Wpisz kolor (wartość szesnastkowa, rgb(), hsl() lub nazwa) albo użyj próbnika.';

  @override
  String get guildSettingsRolesShowSeparately =>
      'Wyświetlaj tę rolę oddzielnie';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Wyświetla członków z tą rolą w osobnej sekcji na liście członków.';

  @override
  String get guildSettingsRolesAllowMentions =>
      'Zezwól na wzmianki dla tej roli';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'Członkowie z uprawnieniem „$permission” zawsze mogą oznaczać role, niezależnie od tego ustawienia.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Użyj tego przycisku, aby szybko wyczyścić wszystkie uprawnienia.';

  @override
  String get guildSettingsRolesClearPermissions => 'Wyczyść uprawnienia';

  @override
  String get guildSettingsRolesPermissionsSection => 'Uprawnienia';

  @override
  String get guildSettingsRolesSearchPermissions => 'Szukaj uprawnień';

  @override
  String get guildSettingsRolesDenseLayout => 'Kompaktny układ';

  @override
  String get guildSettingsRolesComfyLayout => 'Wygodny układ';

  @override
  String get guildSettingsRolesSwitchToDenseLayout =>
      'Przełącz na zwarty układ';

  @override
  String get guildSettingsRolesSwitchToComfyLayout =>
      'Przełącz na wygodny układ';

  @override
  String get guildSettingsRolesSingleColumn => 'Jedna kolumna';

  @override
  String get guildSettingsRolesTwoColumns => 'Dwie kolumny';

  @override
  String get guildSettingsRolesSwitchToSingleColumn =>
      'Przełącz na widok jednokolumnowy';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => 'Przełącz na dwie kolumny';

  @override
  String get guildSettingsRolesNoPermissionsFound => 'Nie znaleziono uprawnień';

  @override
  String get guildSettingsRolesCustomHoistOrder =>
      'Własna kolejność wyświetlania';

  @override
  String get guildSettingsRolesHoistOrder => 'Kolejność wyświetlania';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Przywróć domyślne';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Przeciągnij role, aby zmienić ich kolejność wyświetlania na liście członków.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Brak wyświetlanych ról. Włącz opcję \"Wyświetlaj tę rolę oddzielnie\" dla roli, aby ją tu zobaczyć.';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'Nie możesz edytować tej roli, ponieważ jest to Twoja najwyższa rola lub jest ona wyższa od Twojej';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Potrzebujesz uprawnienia „$permission”, aby edytować te uprawnienia';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'Nie możesz edytować roli, która ma takie same lub wyższe uprawnienia niż Twoja najwyższa rola';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'Nie możesz przyznać uprawnienia, którego sam nie masz';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'Nie możesz usunąć tego uprawnienia, ponieważ usunęłoby to je również Tobie';

  @override
  String get guildSettingsRolesUpdatedSuccess =>
      'Role zaktualizowane pomyślnie';

  @override
  String get guildSettingsRolesCreatedSuccess => 'Rola utworzona pomyślnie';

  @override
  String get guildSettingsRolesDeletedSuccess => 'Rola usunięta pomyślnie';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'Kolejność wyświetlania zresetowana do domyślnej';

  @override
  String get guildSettingsRolesNameRequiredTitle => 'Nazwa roli jest wymagana';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Nadaj roli nazwę przed zapisaniem.';

  @override
  String get guildSettingsRolesCreateFailedTitle =>
      'Nie udało się utworzyć roli';

  @override
  String get guildSettingsRolesUpdateFailedTitle =>
      'Nie udało się zaktualizować ról';

  @override
  String get guildSettingsRolesDeleteFailedTitle => 'Nie udało się usunąć roli';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return 'Nie można usunąć „$name”. Spróbuj ponownie.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'Nie udało się zresetować kolejności wyświetlania';

  @override
  String get guildSettingsRolesTryAgainInAMoment =>
      'Spróbuj ponownie za chwilę.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'Czy na pewno chcesz usunąć rolę $name? Wszyscy członkowie z tą rolą ją utracą.';
  }

  @override
  String get permissionCategoryCommunityWide => 'Cała społeczność';

  @override
  String get permissionCategoryMessagesMedia => 'Wiadomości i multimedia';

  @override
  String get permissionCategoryModeration => 'Moderacja';

  @override
  String get permissionCategoryChannelAccess => 'Dostęp do kanału';

  @override
  String get permissionCategoryChannelManagement => 'Zarządzanie kanałami';

  @override
  String get permissionCategoryAudioVideo => 'Audio i wideo';

  @override
  String get permissionUnknown => 'Nieznane uprawnienie';

  @override
  String get permissionAdministrator => 'Administrator';

  @override
  String get permissionAdministratorDescription =>
      'Przyznaje wszystkie uprawnienia i omija ograniczenia kanału. Bardzo wrażliwe.';

  @override
  String get permissionViewActivityLog => 'Wyświetlanie dziennika aktywności';

  @override
  String get permissionViewActivityLogDescription =>
      'Czytaj dziennik aktywności społeczności, zawierający zmiany i działania moderacyjne.';

  @override
  String get permissionManageCommunity => 'Zarządzanie społecznością';

  @override
  String get permissionManageCommunityDescription =>
      'Edytuj ustawienia globalne, takie jak nazwa, opis i ikona.';

  @override
  String get permissionManageRoles => 'Zarządzanie rolami';

  @override
  String get permissionManageRolesDescription =>
      'Twórz, edytuj lub usuwaj role poniżej Twojej najwyższej roli. Umożliwia również edytowanie nadpisanych uprawnień kanału.';

  @override
  String get permissionManageChannels => 'Zarządzanie kanałami';

  @override
  String get permissionManageChannel => 'Zarządzanie kanałem';

  @override
  String get permissionManageChannelDescription =>
      'Zmień nazwę i ustawienia tego kanału.';

  @override
  String get permissionManagePermissions => 'Zarządzaj uprawnieniami';

  @override
  String get permissionManagePermissionsDescription =>
      'Edytuj nadpisania dla ról i członków na tym kanale.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Twórz, edytuj lub usuwaj webhooki dla tego kanału.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Zobacz listę członków tego kanału.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Zarządzaj linkami zapraszającymi do tego kanału.';

  @override
  String get permissionOverwriteDeny => 'Odrzuć';

  @override
  String get permissionOverwriteInherit => 'Neutralny (dziedziczony)';

  @override
  String get permissionOverwriteAllow => 'Zezwól';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Użyj tych przycisków, aby szybko ustawić wszystkie uprawnienia.';

  @override
  String get permissionManageChannelsDescription =>
      'Twórz, edytuj lub usuwaj kanały i kategorie.';

  @override
  String get permissionKickMembers => 'Wyrzucanie członków';

  @override
  String get permissionBanMembers => 'Banuj członków';

  @override
  String get permissionCreateInviteLinks => 'Tworzenie linków z zaproszeniami';

  @override
  String get permissionChangeOwnNickname => 'Zmień własny pseudonim';

  @override
  String get permissionChangeOwnNicknameDescription => 'Zmień swój pseudonim.';

  @override
  String get permissionManageNicknames => 'Zarządzanie pseudonimami';

  @override
  String get permissionManageNicknamesDescription =>
      'Zmień pseudonimy innych członków.';

  @override
  String get permissionCreateEmojiStickers => 'Tworzenie emoji i naklejek';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Przesyłaj nowe emoji i naklejki oraz zarządzaj własnymi dziełami.';

  @override
  String get permissionManageEmojiStickers => 'Zarządzanie emoji i naklejkami';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Edytuj lub usuwaj emoji i naklejki utworzone przez innych członków.';

  @override
  String get permissionManageWebhooks => 'Zarządzanie webhookami';

  @override
  String get permissionManageWebhooksDescription =>
      'Twórz, edytuj lub usuwaj webhooki.';

  @override
  String get permissionSendMessages => 'Wysyłanie wiadomości';

  @override
  String get permissionSendTtsMessages => 'Wysyłanie wiadomości TTS';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Wysyłaj wiadomości zamieniane tekstu na mowę.';

  @override
  String get permissionManageMessages => 'Zarządzanie wiadomościami';

  @override
  String get permissionManageMessagesDescription =>
      'Usuwanie wiadomości innych członków. Przypinanie jest kontrolowane oddzielnie.';

  @override
  String get permissionPinMessages => 'Przypinanie wiadomości';

  @override
  String get permissionEmbedLinks => 'Osadzanie linków';

  @override
  String get permissionAttachFiles => 'Załączanie plików';

  @override
  String get permissionMentionEveryone => 'Użyj @everyone/@here i @rola';

  @override
  String get permissionMentionEveryoneDescription =>
      'Wspomnij wszystkich lub dowolną rolę (nawet jeśli rola nie jest ustawiona jako możliwa do wzmiankowania).';

  @override
  String get permissionUseExternalEmoji => 'Używaj zewnętrznych emoji';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Używaj emoji z innych społeczności.';

  @override
  String get permissionUseExternalStickers => 'Używaj zewnętrznych naklejek';

  @override
  String get permissionAddReactions => 'Dodawanie reakcji';

  @override
  String get permissionAddReactionsDescription =>
      'Dodawaj nowe reakcje do wiadomości.';

  @override
  String get permissionBypassSlowmode => 'Omiń tryb spowolnienia';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Ignoruj limity szybkości wiadomości dla poszczególnych kanałów.';

  @override
  String get permissionTimeOutMembers => 'Wyciszanie członków';

  @override
  String get permissionTimeOutMembersDescription =>
      'Uniemożliwiaj członkom wysyłanie wiadomości, reagowanie i dołączanie do rozmów głosowych na określony czas.';

  @override
  String get permissionViewChannel => 'Wyświetl kanał';

  @override
  String get permissionViewChannelMembers => 'Wyświetlanie członków kanału';

  @override
  String get permissionViewChannelMembersDescription =>
      'Zobacz listę członków kanałów w tej społeczności.';

  @override
  String get permissionConnect => 'Połącz';

  @override
  String get permissionSpeak => 'Mówienie';

  @override
  String get permissionStreamVideo => 'Streamowanie wideo';

  @override
  String get permissionUseVoiceActivity => 'Używaj aktywacji głosowej';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Bez tego uprawnienia wymagane jest naciśnij i mów.';

  @override
  String get permissionPrioritySpeaker => 'Priorytetowy mówca';

  @override
  String get permissionMuteMembers => 'Wyciszanie członków';

  @override
  String get permissionDeafenMembers => 'Wyciszanie członków';

  @override
  String get permissionMoveMembers => 'Przenoś członków';

  @override
  String get permissionMoveMembersDescription =>
      'Przeciągaj członków między kanałami, do których mają dostęp.';

  @override
  String get permissionSetVoiceRegion => 'Ustaw region głosowy';

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
      'Wyświetlaj wszystkie webhooki skonfigurowane w społeczności i zarządzaj nimi.';

  @override
  String get guildSettingsWebhooksEmpty => 'Brak webhooków';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'Ta społeczność nie ma jeszcze żadnych webhooków. Utwórz jeden, przechodząc do $channelSettingsPath.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'Potrzebujesz uprawnienia „$permission”, aby wyświetlać i edytować webhooki dla tej społeczności.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle =>
      'Nie udało się załadować webhooków';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'Wystąpił błąd podczas ładowania webhooków. Spróbuj ponownie.';

  @override
  String get guildSettingsWebhooksUpdated => 'Zaktualizowano webhooki';

  @override
  String get guildSettingsWebhooksUpdateFailed =>
      'Nie udało się zaktualizować webhooków';

  @override
  String get guildSettingsUnknownChannel => 'Nieznany kanał';

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
      'Umieść swoją społeczność w Odkrywaniu, aby inni mogli ją znaleźć i dołączyć.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle => 'Za mało członków';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Twoja społeczność musi liczyć co najmniej $count członków, aby mogła zostać uwzględniona w funkcji Odkryj.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Status:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'Oczekujące';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Zatwierdzone';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Odrzucone';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Usunięto';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Powód: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'Twoja społeczność jest widoczna w Odkrywaniu. Możesz zaktualizować szczegóły lub wycofać ją z listy poniżej.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Twoje zgłoszenie oczekuje na rozpatrzenie. Nadal możesz zaktualizować szczegóły oferty lub wycofać zgłoszenie.';

  @override
  String get guildSettingsDiscoveryCategory => 'Kategoria';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Wybierz kategorię, która najlepiej opisuje Twoją społeczność. Możesz to zmienić w dowolnym momencie.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Język podstawowy';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'Język, którym posługuje się większość Twojej społeczności. Służy do filtrowania wyników wyszukiwania.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Opis';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Opisz, o czym jest Twoja społeczność';

  @override
  String get guildSettingsDiscoveryDescriptionRequired => 'Opis jest wymagany.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'Opis musi mieć co najmniej $minLength znaków.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'Opis musi mieć maksymalnie $maxLength znaków.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Własne tagi';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Do $maxTags tagów pomogą ludziom znaleźć Twoją społeczność. Pojawią się w wyszukiwarce Odkryj.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'Dodaj tag i naciśnij Enter';

  @override
  String get guildSettingsDiscoveryAddTag => 'Dodaj';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Usuń tag $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle => 'Nie udało się dodać tagu';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'Tagi muszą mieć od 2 do $maxLength znaków alfanumerycznych.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'Możesz dodać maksymalnie $maxTags tagów.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Zastosuj';

  @override
  String get guildSettingsDiscoverySave => 'Zapisz';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Wycofaj';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Wysłano zgłoszenie do Odkrywania';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Zaktualizowano listę Odkrywaj';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Wniosek o dołączenie wycofany';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Nie udało się wycofać zgłoszenia';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Spróbuj ponownie za chwilę.';

  @override
  String get guildSettingsMembersDescription =>
      'Wyszukuj i zarządzaj członkami serwera.';

  @override
  String get guildSettingsMembersSearchHint =>
      'Szukaj po nazwie użytkownika lub ID';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count członków';
  }

  @override
  String get guildMembersRecentTitle => 'Ostatni członkowie';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Wyświetlono $displayedCount z $totalCount wszystkich członków';
  }

  @override
  String get guildMembersSort => 'Sortuj';

  @override
  String get guildSettingsMembersSortNewest => 'Najnowsze najpierw';

  @override
  String get guildMembersSortOldest => 'Od najstarszych';

  @override
  String get guildMembersColumnName => 'Nazwa';

  @override
  String get guildMembersColumnMemberSince => 'Członek od';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'Dołączył(a) do $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Metoda dołączenia';

  @override
  String get guildMembersColumnRoles => 'Role';

  @override
  String get guildMembersColumnActions => 'Działania';

  @override
  String get guildMembersFilterMemberSince => 'Filtruj według daty dołączenia';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Filtruj według daty utworzenia konta';

  @override
  String get guildMembersFilterJoinMethod => 'Filtruj według metody dołączenia';

  @override
  String get guildMembersFilterRoles => 'Filtruj według ról';

  @override
  String get guildMembersFilterAll => 'Wszystkie';

  @override
  String get guildMembersFilterPast1Hour => 'Ostatnia godzina';

  @override
  String get guildMembersFilterPast24Hours => 'Ostatnie 24 godziny';

  @override
  String get guildMembersFilterPast7Days => 'Ostatnie 7 dni';

  @override
  String get guildMembersFilterPast2Weeks => 'Ostatnie 2 tygodnie';

  @override
  String get guildMembersFilterPast3Weeks => 'Ostatnie 3 tygodnie';

  @override
  String get guildMembersFilterPast4Weeks => 'Ostatnie 4 tygodnie';

  @override
  String get guildMembersFilterPast3Months => 'Ostatnie 3 miesiące';

  @override
  String get guildMembersFilterCustomRange => 'Zakres niestandardowy...';

  @override
  String get guildMembersDateRangeTitle => 'Niestandardowy zakres dat';

  @override
  String get guildMembersDateAfter => 'Po dacie';

  @override
  String get guildMembersDateBefore => 'Przed datą';

  @override
  String get guildMembersClearAll => 'Wyczyść wszystko';

  @override
  String get guildMembersRowsPerPage => 'Wiersze na stronę';

  @override
  String get guildMembersEmptySearch => 'Nikt nie pasuje do tego wyszukiwania.';

  @override
  String get guildMembersLoadError =>
      'Wystąpił błąd podczas ładowania członków. Spróbuj ponownie później.';

  @override
  String get guildMembersIndexing => 'Indeksowanie członków…';

  @override
  String get guildMembersGoToPage => 'Idź do strony';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'Przejdź do strony $page';
  }

  @override
  String get guildMembersJumpToPage => 'Przejdź do strony';

  @override
  String get guildMembersJoinSourceCreator => 'Twórca społeczności';

  @override
  String get guildMembersJoinSourceInvite => 'Zaproś';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Zaproś ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Zaproszony przez $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'Adres URL skrótu';

  @override
  String get guildMembersJoinSourceBotInvite => 'Zaproszenie bota';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'Administrator platformy';

  @override
  String get guildMembersJoinSourceDiscovery => 'Odkrywanie';

  @override
  String get guildMembersJoinMethodUnknown => 'Nieznany';

  @override
  String get guildMembersCommunityOwner => 'Właściciel społeczności';

  @override
  String get guildMembersViewAllRoles => 'Wyświetl wszystkie role';

  @override
  String get guildMembersJoinedJustNow => 'Przed chwilą';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minut temu',
      one: '1 minutę temu',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count godzin temu',
      one: '1 godzinę temu',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dni temu',
      one: '1 dzień temu',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Członkowie';

  @override
  String get guildMembersChannelListSelected => 'Członkowie, zaznaczone';

  @override
  String get guildSettingsInvitesTitle => 'Zaproszenia';

  @override
  String get guildSettingsInvitesDescription =>
      'Wyświetl wszystkie zaproszenia do tej społeczności. Aby utworzyć nowe zaproszenie, przejdź do kanału i użyj przycisku zaproszenia.';

  @override
  String get guildSettingsInvitesEmpty => 'Brak linków z zaproszeniami';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Ta społeczność nie ma jeszcze żadnych linków z zaproszeniami. Przejdź do kanału i utwórz zaproszenie, aby zaprosić osoby.';

  @override
  String get guildSettingsInvitesLoadFailedTitle =>
      'Nie udało się wczytać zaproszeń';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Wystąpił błąd podczas ładowania zaproszeń. Spróbuj ponownie.';

  @override
  String get guildSettingsInvitesTryAgain => 'Spróbuj ponownie';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Pokaż datę utworzenia zamiast daty ważności';

  @override
  String get guildSettingsInvitesPauseInvites => 'Wstrzymaj zaproszenia';

  @override
  String get guildSettingsInvitesEnableInvites => 'Włącz zaproszenia';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Wstrzymaj zaproszenia do tej społeczności';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Włącz zaproszenia dla tej społeczności';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Wstrzymać zaproszenia? Nowi użytkownicy nie będą mogli dołączyć przez linki z zaproszeniami, dopóki ich ponownie nie włączysz. Nie wpłynie to na obecnych członków.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Włączyć zaproszenia? Użytkownicy będą mogli ponownie dołączać do tej społeczności za pomocą linków z zaproszeniami.';

  @override
  String get guildSettingsInvitesPause => 'Wstrzymaj';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Zaproszenia do tej społeczności są wstrzymane.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Zaproszenia są wstrzymane, ponieważ $productName wykrył(-a) potencjalny atak. Nowi użytkownicy nie mogą teraz dołączyć.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Zapraszający:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Kanał:';

  @override
  String get guildSettingsInvitesLabelCode => 'Kod:';

  @override
  String get guildSettingsInvitesLabelUses => 'Używa:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Utworzono:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Wygasa:';

  @override
  String get guildSettingsInvitesUnknown => 'Nieznany';

  @override
  String get guildSettingsInvitesNoCategory => 'Bez kategorii';

  @override
  String get guildSettingsInvitesExpired => 'Wygasło';

  @override
  String get guildSettingsInvitesNever => 'Nigdy';

  @override
  String get guildSettingsInvitesCopyLink => 'Kopiuj link z zaproszeniem';

  @override
  String get guildSettingsInvitesRevoke => 'Anuluj zaproszenie';

  @override
  String get guildSettingsInvitesRevokeFailedTitle =>
      'Nie udało się odwołać zaproszenia';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'Link może nadal działać. Spróbuj ponownie za chwilę.';

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
  String get guildSettingsEmojiUploadTitle => 'Prześlij emoji';

  @override
  String get guildSettingsEmojiSlotsTitle => 'Miejsca na emoji';

  @override
  String get guildSettingsEmojiDropZone =>
      'Przeciągnij i upuść pliki emoji tutaj';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Nie udało się załadować emoji. Spróbuj ponownie później.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'Nie znaleziono emoji pasujących do wyszukiwania.';

  @override
  String get guildSettingsEmojiNoSlots => 'Brak dostępnych miejsc na emoji';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Osiągnięto maksymalną liczbę emoji. Usuń niektóre istniejące emoji, aby zrobić miejsce.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Nazwy emotikon powinny zawierać co najmniej 2 znaki i mogą używać liter, cyfr oraz podkreśleń. Emotikony muszą mieć rozmiar mniejszy niż $maxSize. Statyczne obrazy są automatycznie zmieniane do rozmiaru 128x128 pikseli i kompresowane. Animowane emotikony i pliki SVG muszą już spełniać ten limit.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'Przesyłanie emoji';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# emotikonów',
      one: '# emotikony',
    );
    return 'Przesyłanie $_temp0. Może to chwilę potrwać.';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'Nie udało się przesłać emoji. Spróbuj ponownie.';

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Niektórych emoji nie udało się dodać';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'Sprawdź te pliki i spróbuj ponownie z mniejszymi lub prostszymi obrazami.';

  @override
  String get guildSettingsEmojiRenameTitle => 'Zmień nazwę emoji';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2–32 znaków, litery, cyfry, podkreślenia.';

  @override
  String get guildSettingsEmojiColumnEmoji => 'Emoji';

  @override
  String get guildSettingsEmojiColumnName => 'Nazwa';

  @override
  String get guildSettingsEmojiColumnUploader => 'Przesłane przez';

  @override
  String get guildSettingsEmojiUnknownUploader => 'Nieznany';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Usuń emoji';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'Usunąć :$name:? Nie można tego cofnąć.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel => 'Usuń tę emotkę z pamięci i CDN';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'Nazwa emoji musi mieć co najmniej 2 znaki';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'Nazwa emoji może mieć maksymalnie 32 znaki';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Nieprawidłowa nazwa emoji';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Nie udało się zmienić nazwy tej emoji';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'Nazwa została przywrócona do poprzedniej. Spróbuj ponownie za chwilę.';

  @override
  String get guildSettingsEmojiGoneTitle => 'To emoji już nie istnieje';

  @override
  String get guildSettingsEmojiGoneBody =>
      'Być może emoji zostało usunięte. Nazwa została przywrócona do poprzedniej.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'Nie możesz zmienić nazwy tej emoji';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'Nie masz uprawnień do zmiany nazwy tej emotki. Nazwa została przywrócona do poprzedniej.';

  @override
  String get guildSettingsEmojiRateLimitedTitle => 'Działasz za szybko';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'Poczekaj chwilę i spróbuj zmienić nazwę ponownie.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Nie udało się usunąć tej emotki';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'Nie możesz usunąć tej emotki';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'Zezwól innym na klonowanie Twoich emoji';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'Gdy ta opcja jest włączona, członkowie innych społeczności mogą używać skrótu \"Klonuj\" w aplikacji, aby skopiować Twoje niestandardowe emoji. Nie uniemożliwia im to zapisania obrazu i samodzielnego przesłania go.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Zezwól innym na klonowanie Twoich naklejek';

  @override
  String get guildSettingsCloneStickerDescription =>
      'Gdy ta opcja jest włączona, członkowie innych społeczności mogą używać w aplikacji skrótu \"Klonuj\" (za pomocą jednego kliknięcia) na Twoich niestandardowych naklejkach. Nie uniemożliwia im to zapisania obrazu i samodzielnego przesłania go.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Tylko członkowie z uprawnieniem „$permission” mogą to zmienić.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'Nie udało się zaktualizować klonowania emoji';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Nie udało się zaktualizować klonowania naklejek';

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
  String get guildSettingsStickerSlotsTitle => 'Miejsca na naklejki';

  @override
  String get guildSettingsStickerUploadTitle => 'Prześlij naklejkę';

  @override
  String get guildSettingsStickerDropZone =>
      'Przeciągnij i upuść plik naklejki tutaj (pojedynczo)';

  @override
  String get guildSettingsStickerDensity => 'Gęstość naklejek';

  @override
  String get guildSettingsStickerDensityCozy => 'Przytulnie';

  @override
  String get guildSettingsStickerDensityCompact => 'Kompaktowy';

  @override
  String get guildSettingsStickersLoadFailedTitle =>
      'Nie udało się wczytać naklejek';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Wystąpił błąd podczas ładowania naklejek. Spróbuj ponownie.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Nie znaleziono naklejek pasujących do wyszukiwania.';

  @override
  String get guildSettingsStickersEmptySearch => 'Nie znaleziono naklejek';

  @override
  String get guildSettingsStickerNoSlots =>
      'Brak dostępnych miejsc na naklejki';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Osiągnięto maksymalną liczbę naklejek. Usuń niektóre istniejące naklejki, aby zrobić miejsce.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Naklejki są zapisywane w rozdzielczości 320x320 pikseli i muszą mieć rozmiar mniejszy niż $maxSize. Statyczne obrazy są automatycznie zmieniane do odpowiedniego rozmiaru i kompresowane. Animowane naklejki i pliki SVG muszą już spełniać ten limit.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle =>
      'Nieobsługiwany plik naklejki';

  @override
  String get guildSettingsStickerAddTitle => 'Dodaj naklejkę';

  @override
  String get guildSettingsStickerEditTitle => 'Edytuj naklejkę';

  @override
  String get guildSettingsStickerNameLabel => 'Nazwa';

  @override
  String get guildSettingsStickerNameHint => 'Mój super sticker';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Opis';

  @override
  String get guildSettingsStickerDescriptionHint => 'Opisz naklejkę';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Tagi ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Dodaj tag';

  @override
  String get guildSettingsStickerTagAdd => 'Dodaj';

  @override
  String get guildSettingsStickerNameRequired => 'Nazwa jest wymagana';

  @override
  String get guildSettingsStickerNameTooShort =>
      'Nazwa musi mieć co najmniej 2 znaki';

  @override
  String get guildSettingsStickerNameTooLong =>
      'Nazwa musi mieć maksymalnie 30 znaków';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'Opis musi mieć maksymalnie 500 znaków';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'Nie udało się utworzyć tej naklejki';

  @override
  String get guildSettingsStickerTooLargeTitle => 'Naklejka jest za duża';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'Nie udało się wystarczająco skompresować naklejki';

  @override
  String get guildSettingsStickerDeleteTitle => 'Usuń naklejkę';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'Usunąć „$name”? Tej operacji nie można cofnąć.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Usuń tę naklejkę z pamięci i CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Nie udało się usunąć tej naklejki';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'Nie możesz usunąć tej naklejki';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Aby utworzyć webhook, otwórz $channelSettingsPath. Możesz tu nadal edytować i organizować wszystkie istniejące webhooki.';
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
  String get guildSettingsInvitesTableExpires => 'Wygasa';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtruj według użytkownika';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtruj według akcji';

  @override
  String get createDm => 'Utwórz czat';

  @override
  String get createGroupDm => 'Utwórz grupową wiadomość';

  @override
  String get createDmNewMessage => 'Nowa wiadomość';

  @override
  String get createDmSelectFriends => 'Wybierz znajomych';

  @override
  String get createDmChooseFriendsSubtitle =>
      'Wybierz znajomych, do których chcesz wysłać wiadomość.';

  @override
  String get createDmSearchFriends => 'Szukaj znajomych';

  @override
  String get createDmNoFriendsFound => 'Nie znaleziono znajomych';

  @override
  String get createDmNoFriendsYet => 'Nie masz jeszcze znajomych';

  @override
  String get createDmClaimToStartDms => 'Odbierz konto, aby rozpocząć czaty.';

  @override
  String get createDmVerifyToStartDms =>
      'Zweryfikuj swój adres e-mail, aby móc wysyłać wiadomości prywatne.';

  @override
  String get createDmVerifyYourEmail => 'Zweryfikuj swój adres e-mail';

  @override
  String get createDmNewGroup => 'Nowa grupa';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Utwórz nową grupę z $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'Potwierdź nową grupę';

  @override
  String get createDmCreateNewGroup => 'Utwórz nową grupę';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'Usuń $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'Masz już grupę z tymi użytkownikami. Na pewno chcesz utworzyć nową? To też w porządku!';

  @override
  String get createDmNoActivityYet => 'Brak aktywności';

  @override
  String get createDmSomeUsersCantBeAdded =>
      'Niektórych użytkowników nie można dodać';

  @override
  String get createDmCreateWithoutThem => 'Utwórz bez nich';

  @override
  String get createDmUnaddableIntro =>
      'Następujące osoby nie mogą zostać dodane do tej grupowej wiadomości DM:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Utworzyć czat grupowy z pozostałymi $count odbiorcami i pominąć pozostałych?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Brak pozostałych odbiorców, z którymi można utworzyć grupową wiadomość.';

  @override
  String get createDmUnaddableUserNotFound => 'Nie znaleziono użytkownika';

  @override
  String get createDmUnaddableBlocked =>
      'Nie możesz wysłać wiadomości do tego użytkownika';

  @override
  String get createDmUnaddableNotFriends => 'Nie ma Cię na liście znajomych';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Nie można dodać do grupowych DM-ów';

  @override
  String get createDmFailed =>
      'Nie udało się utworzyć rozmowy. Spróbuj ponownie.';

  @override
  String get dmListMessagesTitle => 'Wiadomości';

  @override
  String get dmListDirectMessagesTitle => 'Wiadomości prywatne';

  @override
  String get keybindsSearchShortcuts => 'Szukaj skrótów';

  @override
  String get keybindSectionDefaults => 'Domyślne';

  @override
  String get keybindSectionMessages => 'Wiadomości';

  @override
  String get keybindSectionNavigation => 'Nawigacja';

  @override
  String get keybindSectionDragAndDrop => 'Przeciągnij i upuść';

  @override
  String get keybindSectionChat => 'Czat';

  @override
  String get keybindSectionVoiceAndVideo => 'Połączenia głosowe i wideo';

  @override
  String get keybindSectionMisc => 'Różne';

  @override
  String get keybindActionShowShortcutsList =>
      'Pokaż listę skrótów klawiaturowych';

  @override
  String get keybindActionCopyText => 'Kopiuj tekst';

  @override
  String get keybindActionMarkUnread => 'Oznacz jako nieprzeczytane';

  @override
  String get keybindActionFocusTextarea => 'Przejdź do pola tekstowego';

  @override
  String get keybindActionSwitchCommunities =>
      'Przełączaj się między społecznościami';

  @override
  String get keybindActionSwitchChannels => 'Przełączaj kanały';

  @override
  String get keybindActionHistoryBack =>
      'Cofnij w historii przeglądanych kanałów';

  @override
  String get keybindActionHistoryForward =>
      'Przejdź do przodu w historii przeglądanych kanałów';

  @override
  String get keybindActionJumpUnreadChannels =>
      'Przeskocz między nieprzeczytanymi kanałami';

  @override
  String get keybindActionJumpMentionChannels =>
      'Przeskocz między nieprzeczytanymi kanałami ze wzmiankami';

  @override
  String get keybindActionJumpCurrentCall => 'Przejdź do bieżącej rozmowy';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Przełączaj między ostatnią społecznością a czatami prywatnymi';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Przełącz na poprzednią społeczność lub czaty';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Przełącz na następną społeczność lub czaty';

  @override
  String get keybindActionGoToDms => 'Przejdź do wiadomości prywatnych';

  @override
  String get keybindActionGoToFirstCommunity =>
      'Przejdź do pierwszej społeczności';

  @override
  String get keybindActionGoToSecondCommunity =>
      'Przejdź do drugiej społeczności';

  @override
  String get keybindActionGoToThirdCommunity =>
      'Przejdź do trzeciej społeczności';

  @override
  String get keybindActionGoToFourthCommunity =>
      'Przejdź do czwartej społeczności';

  @override
  String get keybindActionGoToFifthCommunity =>
      'Przejdź do piątej społeczności';

  @override
  String get keybindActionGoToSixthCommunity =>
      'Przejdź do szóstej społeczności';

  @override
  String get keybindActionGoToSeventhCommunity =>
      'Przejdź do siódmej społeczności';

  @override
  String get keybindActionGoToEighthCommunity =>
      'Przejdź do ósmej społeczności';

  @override
  String get keybindActionToggleQuickSwitcher => 'Przełącz szybki przełącznik';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'Utwórz lub dołącz do społeczności';

  @override
  String get keybindActionStartDragAndDrop =>
      'Rozpocznij przeciąganie i upuszczanie';

  @override
  String get keybindActionMove => 'Przenieś';

  @override
  String get keybindActionDropItem => 'Upuść przedmiot';

  @override
  String get keybindActionCancel => 'Anuluj';

  @override
  String get keybindActionMarkCommunityRead =>
      'Oznacz społeczność jako przeczytaną';

  @override
  String get keybindActionMarkChannelRead => 'Oznacz kanał jako przeczytany';

  @override
  String get keybindActionStartGroupDm => 'Rozpocznij czat grupowy';

  @override
  String get keybindActionTogglePinnedMessages =>
      'Przełącz przypięte wiadomości';

  @override
  String get keybindActionToggleInbox => 'Przełącz skrzynkę odbiorczą';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Oznacz górny kanał skrzynki odbiorczej jako przeczytany';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Oznacz wszystkie kanały w skrzynce odbiorczej jako przeczytane';

  @override
  String get keybindActionToggleMemberList =>
      'Przełącz listę członków lub czat głosowy';

  @override
  String get keybindActionToggleEmojiPicker => 'Przełącz panel emoji';

  @override
  String get keybindActionToggleGifPicker => 'Przełączanie panelu GIF-ów';

  @override
  String get keybindActionToggleStickerPicker => 'Przełączanie panelu naklejek';

  @override
  String get keybindActionScrollChatUp => 'Przewiń czat w górę';

  @override
  String get keybindActionScrollChatDown => 'Przewiń czat w dół';

  @override
  String get keybindActionJumpOldestUnread =>
      'Przejdź do najstarszej nieprzeczytanej wiadomości';

  @override
  String get keybindActionFocusComposer => 'Przejdź do pola tekstowego';

  @override
  String get keybindActionUploadFile => 'Prześlij plik';

  @override
  String get keybindActionCopyChannelLink => 'Kopiuj link do kanału';

  @override
  String get keybindActionToggleSavedMedia => 'Przełącz zapisane multimedia';

  @override
  String get keybindActionSendVoiceMessage => 'Wyślij wiadomość głosową';

  @override
  String get keybindActionAnswerCall => 'Odbierz połączenie przychodzące';

  @override
  String get keybindActionDeclineCall => 'Odrzuć połączenie przychodzące';

  @override
  String get keybindActionStartDmCall =>
      'Rozpocznij rozmowę na czacie prywatnym lub grupowym';

  @override
  String get keybindActionToggleSoundboard => 'Przełącz pulpit dźwiękowy';

  @override
  String get keybindActionToggleCompactCallView =>
      'Rozwiń lub zwiń kompaktowy widok połączenia';

  @override
  String get keybindActionPushToTalkPriority => 'Naciśnij i mów (priorytet)';

  @override
  String get keybindActionVoiceActivityPriority =>
      'Priorytet aktywności głosowej';

  @override
  String get keybindActionOpenHelp => 'Otwórz pomoc';

  @override
  String get keybindActionSearchMessages => 'Szukaj wiadomości';

  @override
  String get keybindActionOpenContextMenu => 'Otwórz menu kontekstowe';

  @override
  String get keybindActionOpenSettings => 'Otwórz ustawienia';

  @override
  String get keybindActionOpenThemeStudio =>
      'Otwórz wyskakujące okienko studia motywów';

  @override
  String get keybindActionZoomIn => 'Powiększ';

  @override
  String get keybindActionZoomOut => 'Pomniejsz';

  @override
  String get keybindActionZoomReset => 'Resetuj powiększenie';

  @override
  String get clipboardPasteFailed =>
      'Nie udało się wkleić. Schowek był pusty lub zablokowany dla tej aplikacji.';

  @override
  String get homeQuickActionDms => 'PW';
}
