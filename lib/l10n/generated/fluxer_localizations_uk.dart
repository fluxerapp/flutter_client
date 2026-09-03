// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class FluxerLocalizationsUk extends FluxerLocalizations {
  FluxerLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get reconnectingTitle => 'Щось пішло не так!';

  @override
  String get reconnectingBody =>
      'Сервери працюють некоректно.\nМає скоро виправитись!';

  @override
  String get gatewayReconnectingToast => 'Перепідключення…';

  @override
  String get gatewayConnectedToast => 'Підключено';

  @override
  String get sessionExpiredToast =>
      'Your session has expired. Please sign in again.';

  @override
  String splashStartupFailed(String error) {
    return 'Не вдалося запустити: $error';
  }

  @override
  String get retry => 'Спробувати знову';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'З\'єднання втрачено';

  @override
  String get splashViewOnStatusPage => 'Переглянути на сторінці статусу';

  @override
  String get splashConnectionIssuesPrompt => 'Проблеми зі з\'єднанням?';

  @override
  String get splashStatusPageLink => 'Сторінка статусу';

  @override
  String get splashReadIncident => 'Прочитати про інцидент';

  @override
  String get splashIncidentHistory => 'Історія інцидентів';

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
  String get welcomeBack => 'Раді бачити вас знову';

  @override
  String get email => 'Електронна пошта';

  @override
  String get emailInvalid =>
      'Будь ласка, введіть дійсну адресу електронної пошти.';

  @override
  String get password => 'Пароль';

  @override
  String get forgotPassword => 'Забули пароль?';

  @override
  String get logIn => 'Увійти';

  @override
  String get logInWithPasskey => 'Увійти за допомогою ключа доступу';

  @override
  String continueWithSso(String provider) {
    return 'Продовжити через $provider';
  }

  @override
  String get ssoRequired => 'Для доступу до цього екземпляра потрібен SSO.';

  @override
  String get organizationSsoProvider =>
      'Увійдіть за допомогою постачальника єдиного входу вашої організації.';

  @override
  String get failedToStartSso => 'Не вдалося розпочати SSO';

  @override
  String get ssoCancelled => 'Вхід через SSO було скасовано';

  @override
  String preferSso(String provider) {
    return 'Бажаєте використовувати SSO? Продовжити через $provider.';
  }

  @override
  String get logInViaBrowser => 'Увійти через браузер';

  @override
  String get needAccountPrompt => 'Немає облікового запису? ';

  @override
  String get register => 'Зареєструватися';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Підтвердьте, що ви людина';

  @override
  String get captchaDescription =>
      'Нам потрібно переконатися, що ви не бот. Будь ласка, пройдіть перевірку нижче.';

  @override
  String get captchaSwitchToHcaptcha =>
      'Виникли проблеми? Спробуйте hCaptcha замість цього';

  @override
  String get captchaSwitchToTurnstile => 'Спробуйте Turnstile замість цього';

  @override
  String get cancel => 'Скасувати';

  @override
  String get ipAuthCheckEmail => 'Перевірте свою електронну пошту';

  @override
  String ipAuthDescription(String email) {
    return 'Ми надіслали посилання для авторизації цього входу на вашу електронну пошту. Будь ласка, відкрийте свою скриньку для $email.';
  }

  @override
  String get ipAuthConnectionLost => 'З\'єднання втрачено';

  @override
  String get ipAuthConnectionLostDescription =>
      'Ми втратили з\'єднання під час очікування авторизації. Будь ласка, спробуйте ще раз.';

  @override
  String get ipAuthLinkExpired => 'Посилання для входу застаріло';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Це посилання для авторизації застаріло. Будь ласка, увійдіть знову.';

  @override
  String get ipAuthResendEmail => 'Надіслати лист повторно';

  @override
  String get ipAuthResent => 'Надіслано повторно';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '$secondsс';
  }

  @override
  String get back => 'Назад';

  @override
  String get next => 'Next';

  @override
  String get mfaTitle => 'Двофакторна автентифікація';

  @override
  String get mfaChooseMethod => 'Виберіть метод перевірки';

  @override
  String get mfaMethodTotp => 'Програма-автентифікатор';

  @override
  String get mfaMethodWebauthn => 'Ключ безпеки / Ключ доступу';

  @override
  String get mfaTotpDescription =>
      'Введіть 6-значний код із програми-автентифікатора або один із ваших резервних кодів.';

  @override
  String get mfaCodeLabel => 'Код';

  @override
  String get mfaTryAnotherMethod => 'Спробувати інший метод';

  @override
  String get mfaUseSecurityKey => 'Спробуйте ключ безпеки / пароль';

  @override
  String get accountSelectorTitle => 'Виберіть обліковий запис';

  @override
  String get accountSelectorDescription =>
      'Виберіть обліковий запис для продовження або додайте інший.';

  @override
  String get accountAdd => 'Додати обліковий запис';

  @override
  String get accountRemove => 'Видалити';

  @override
  String accountRemoveTitle(String username) {
    return 'Видалити $username';
  }

  @override
  String get accountRemoveDescription =>
      'Це видалить збережений сеанс для цього облікового запису.';

  @override
  String get accountRemoveOnlyDescription =>
      'Це видалить єдиний збережений обліковий запис на цьому пристрої.';

  @override
  String get accountExpired => 'Термін дії закінчився';

  @override
  String accountSessionExpired(String identifier) {
    return 'Термін дії сеансу для $identifier закінчився. Будь ласка, увійдіть знову.';
  }

  @override
  String get accountManageTitle => 'Керування обліковими записами';

  @override
  String get accountSwitchFailed =>
      'Не вдалося переключити облікові записи. Спробуйте ще раз.';

  @override
  String get profileTabMenuSwitchAccounts => 'Переключити облікові записи';

  @override
  String get statusChangeSheetTitle => 'Встановити статус';

  @override
  String get statusOnlineStatusSection => 'Статус онлайн';

  @override
  String get statusOnline => 'Онлайн';

  @override
  String get statusIdle => 'Неактивний';

  @override
  String get statusDnd => 'Не турбувати';

  @override
  String get statusInvisible => 'Невидимий';

  @override
  String get statusOffline => 'Офлайн';

  @override
  String get statusUntilIChangeIt => 'Доки я не змінюю';

  @override
  String get statusDontClear => 'Не очищати';

  @override
  String get statusFor10Seconds => 'На 10 секунд';

  @override
  String get statusClearAfter10Seconds => '10 секунд';

  @override
  String get statusClearAfter15Minutes => '15 хвилин';

  @override
  String get statusClearAfter30Minutes => '30 хвилин';

  @override
  String get statusClearAfter1Hour => '1 година';

  @override
  String get statusClearAfter3Hours => '3 години';

  @override
  String get statusClearAfter4Hours => '4 години';

  @override
  String get statusClearAfter8Hours => '8 годин';

  @override
  String get statusClearAfter24Hours => '24 години';

  @override
  String get statusClearAfter3Days => '3 дні';

  @override
  String get statusDndDescription =>
      'Ви не отримуватимете сповіщень на робочому столі';

  @override
  String get statusInvisibleDescription => 'Ви будете виглядати офлайн';

  @override
  String get customStatusSetTitle => 'Встановити власний статус';

  @override
  String get customStatusCurrentHint => 'Власний статус';

  @override
  String get customStatusClear => 'Очистити власний статус';

  @override
  String get customStatusPlaceholder => 'Що відбувається?';

  @override
  String get customStatusChooseEmoji => 'Вибрати емодзі';

  @override
  String get customStatusClearAfter => 'Очистити після';

  @override
  String get customStatusSave => 'Зберегти';

  @override
  String get accountActive => 'Активний обліковий запис';

  @override
  String get signOut => 'Вийти';

  @override
  String get suspendedPermanentTitle => 'Обліковий запис назавжди заблоковано';

  @override
  String get suspendedTemporaryTitle => 'Обліковий запис заблоковано';

  @override
  String get suspendedPermanentDescription =>
      'Ваш обліковий запис назавжди заблоковано за порушення наших Умов обслуговування.';

  @override
  String get suspendedTemporaryDescription =>
      'Ваш обліковий запис тимчасово заблоковано. Ви зможете отримати доступ до свого облікового запису після закінчення періоду блокування.';

  @override
  String get suspendedIssuedAt => 'Видано';

  @override
  String get suspendedEndsAt => 'Закінчується';

  @override
  String get suspendedDuration => 'Тривалість';

  @override
  String get suspendedPermanent => 'Назавжди';

  @override
  String get suspendedReason => 'Причина';

  @override
  String get suspendedAppealDeadline => 'Термін апеляції';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Ваш обліковий запис заплановано до видалення $date.';
  }

  @override
  String get suspendedRecheck => 'Перевірити оновлення';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Спробуйте через $seconds сек.';
  }

  @override
  String get suspendedBackToLogin => 'Назад до входу';

  @override
  String get suspendedAppealTitle => 'Апеляція';

  @override
  String get suspendedAppealHint =>
      'Поясніть, чому вашу відсторонення слід переглянути (мінімум 50 символів)...';

  @override
  String get suspendedAppealSubmit => 'Подати апеляцію';

  @override
  String get suspendedAppealPending => 'Очікує розгляду';

  @override
  String get suspendedAppealAccepted => 'Апеляцію прийнято';

  @override
  String get suspendedAppealRejected => 'Апеляцію відхилено';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Вашу апеляцію прийнято, і ваш обліковий запис відновлено.';

  @override
  String get suspendedSignIn => 'Увійти до свого облікового запису';

  @override
  String get forgotPasswordTitle => 'Забули пароль?';

  @override
  String get forgotPasswordDescription =>
      'Введіть свою електронну адресу, і ми надішлемо вам посилання для скидання пароля.';

  @override
  String get forgotPasswordSubmit => 'Надіслати посилання для скидання';

  @override
  String get forgotPasswordSentTitle => 'Перевірте свою електронну пошту';

  @override
  String get forgotPasswordSentDescription =>
      'Ми надіслали інструкції зі скидання пароля на вашу електронну адресу. Перевірте папку \"Вхідні\" та перейдіть за посиланням, щоб скинути пароль.';

  @override
  String get forgotPasswordBackToLogin => 'Повернутися до входу';

  @override
  String get resetPasswordTitle => 'Встановіть новий пароль';

  @override
  String get resetPasswordDescription =>
      'Введіть новий пароль нижче, щоб завершити процес скидання.';

  @override
  String get resetPasswordNewPassword => 'Новий пароль';

  @override
  String get resetPasswordConfirm => 'Підтвердьте новий пароль';

  @override
  String get resetPasswordSubmit => 'Скинути пароль';

  @override
  String get resetPasswordMismatch => 'Паролі не збігаються.';

  @override
  String get registerTitle => 'Створити обліковий запис';

  @override
  String get registerDisplayName => 'Відображуване ім\'я (необов\'язково)';

  @override
  String get registerDisplayNameHint => 'Як до вас звертатися?';

  @override
  String get registerUsername => 'Ім\'я користувача (необов\'язково)';

  @override
  String get registerUsernameHint =>
      'Залиште порожнім для випадкового імені користувача';

  @override
  String get registerUsernameTagHint =>
      '4-значний тег буде додано автоматично для забезпечення унікальності';

  @override
  String get registerDateOfBirth => 'Дата народження';

  @override
  String get registerMonth => 'Місяць';

  @override
  String get registerDay => 'День';

  @override
  String get registerYear => 'Рік';

  @override
  String get registerConsent =>
      'Я погоджуюся з Умовами надання послуг та Політикою конфіденційності';

  @override
  String get registerConsentPrefix => 'Я погоджуюся з ';

  @override
  String get registerConsentTerms => 'Умовами надання послуг';

  @override
  String get registerConsentAnd => ' та ';

  @override
  String get registerConsentPrivacy => 'Політикою конфіденційності';

  @override
  String get registerConfirmPassword => 'Підтвердьте пароль';

  @override
  String get registerSubmit => 'Створити обліковий запис';

  @override
  String get registerHaveAccount => 'Вже маєте обліковий запис? ';

  @override
  String get registerPendingApproval =>
      'Your account request is pending approval. You can sign in after an admin approves it.';

  @override
  String get registerClosed =>
      'Registration is currently closed. Use a registration link from an admin to create an account.';

  @override
  String get passkeyNoCredentials =>
      'Ключі доступу для цієї програми не знайдено. Увійдіть за допомогою електронної пошти та пароля.';

  @override
  String get passkeyDeviceNotSupported =>
      'Ключі доступу не підтримуються на цьому пристрої.';

  @override
  String get passkeyDomainNotAssociated =>
      'Ключі доступу не налаштовано для цієї програми. Увійдіть за допомогою електронної пошти та пароля.';

  @override
  String get passkeyTimeout =>
      'Час автентифікації ключа доступу вичерпано. Спробуйте ще раз.';

  @override
  String get passkeyNotAvailable =>
      'Ключі доступу недоступні для цієї програми. Увійдіть за допомогою електронної пошти та пароля.';

  @override
  String get passkeyFailed =>
      'Не вдалося автентифікувати за допомогою ключа доступу. Спробуйте ще раз.';

  @override
  String get errorUnableToCreateAccount =>
      'Не вдалося створити обліковий запис. Спробуйте ще раз.';

  @override
  String get errorUnableToSignIn =>
      'Зараз не вдається увійти. Спробуйте ще раз.';

  @override
  String get errorInvalidEmailOrPassword =>
      'Неправильна електронна пошта або пароль.';

  @override
  String get errorUnableToSendResetLink =>
      'Не вдалося надіслати посилання для скидання. Спробуйте ще раз.';

  @override
  String get errorUnableToResetPassword =>
      'Не вдалося скинути пароль. Спробуйте ще раз.';

  @override
  String get embedInviteJoin => 'Приєднатися до спільноти';

  @override
  String get embedInviteGoTo => 'Перейти до спільноти';

  @override
  String embedInviteOnline(String count) {
    return '$count онлайн';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count учасників';
  }

  @override
  String get embedInviteUnknownTitle => 'Невідоме запрошення';

  @override
  String get embedInviteUnknownSubtitle =>
      'Спробуйте попросити нове запрошення.';

  @override
  String get embedInviteUnavailable => 'Запрошення недоступне';

  @override
  String get embedInviteJoinGroup => 'Join group';

  @override
  String get embedInviteAlreadyJoined => 'Already joined';

  @override
  String get inviteAcceptTitle => 'Вас запросили приєднатися';

  @override
  String get inviteAcceptJoinButton => 'Приєднатися до спільноти';

  @override
  String get inviteAcceptGoToButton => 'Перейти до спільноти';

  @override
  String get inviteAcceptInvitesPaused => 'Запрошення призупинено';

  @override
  String get inviteAcceptNotFoundTitle => 'Запрошення недійсне';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Це запрошення може бути простроченим або недійсним.';

  @override
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'Приєднатися до групи';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Вас запросив до групового приватного чату $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'хтось';

  @override
  String get inviteAcceptEmojiPack => 'Набір емодзі';

  @override
  String get inviteAcceptStickerPack => 'Набір стікерів';

  @override
  String get inviteAcceptInstallEmojiPack => 'Встановити набір емодзі';

  @override
  String get inviteAcceptInstallStickerPack => 'Встановити набір стікерів';

  @override
  String get inviteAcceptPackInstallNote =>
      'Прийняття цього запрошення автоматично встановить пакет.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Доступ до каналу заборонено';

  @override
  String get channelAccessDeniedDescription =>
      'У вас немає доступу до каналу, де було надіслано це повідомлення.';

  @override
  String get messageJumpLinkNoAccess => 'Немає доступу';

  @override
  String get okay => 'Гаразд';

  @override
  String get embedThemeTitle => 'Спільна тема';

  @override
  String get embedThemeSubtitle => 'Цей клієнт не підтримує власні теми.';

  @override
  String get embedThemeUnavailableButton => 'Теми недоступні';

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
  String get privacySettings => 'Налаштування конфіденційності';

  @override
  String get privacyDirectMessages => 'Приватні повідомлення';

  @override
  String get privacyDirectMessagesDescription =>
      'Дозволити приватні повідомлення від інших учасників цієї спільноти';

  @override
  String get privacyBotDirectMessages => 'Приватні повідомлення від ботів';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Дозволити ботам із цієї спільноти надсилати вам приватні повідомлення';

  @override
  String get privacyMutualDmsDisabled =>
      'Адміністратори спільноти вимкнули отримання приватних повідомлень виключно від спільних учасників цієї спільноти.';

  @override
  String get communityDebug => 'Налагодження спільноти';

  @override
  String get copiedToClipboard => 'Скопійовано до буфера обміну';

  @override
  String get notificationSettings => 'Налаштування сповіщень';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Вимкнути сповіщення для $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Вимкнення сповіщень спільноти запобігає появі індикаторів непрочитаних повідомлень і сповіщень, якщо ви не згадані.';

  @override
  String get notificationCommunitySettings =>
      'Налаштування сповіщень спільноти';

  @override
  String get notificationAllMessages => 'Усі повідомлення';

  @override
  String get notificationOnlyMentions => 'Лише згадки';

  @override
  String get notificationNothing => 'Нічого';

  @override
  String get notificationSuppressEveryone => 'Приховувати @everyone та @here';

  @override
  String get notificationSuppressRoles => 'Приглушити всі згадки ролей';

  @override
  String get notificationMobilePush => 'Мобільні push-сповіщення';

  @override
  String get notificationOverrides => 'Налаштування сповіщень';

  @override
  String get notificationSelectChannel => 'Виберіть канал або категорію';

  @override
  String get notificationOnlyAtMentions => 'Лише @згадки';

  @override
  String get notificationMuteChannel => 'Вимкнути канал';

  @override
  String get notificationUnmuteChannel => 'Увімкнути канал';

  @override
  String get notificationUseCategoryDefault => 'Use Category Default';

  @override
  String get notificationUseCommunityDefault => 'Use Community Default';

  @override
  String get notificationNoCategory => 'Без категорії';

  @override
  String get dmMarkAsRead => 'Позначити як прочитане';

  @override
  String get dmMuteConversation => 'Вимкнути приватне повідомлення';

  @override
  String get dmUnmuteConversation => 'Увімкнути приватне повідомлення';

  @override
  String get dmPinDm => 'Закріпити приватне повідомлення';

  @override
  String get dmUnpinDm => 'Відкріпити приватне повідомлення';

  @override
  String get dmAlwaysShowInSidebar => 'Завжди показувати в бічній панелі';

  @override
  String get dmRemoveFromAlwaysShown => 'Видалити з «Завжди показувати»';

  @override
  String get dmCloseDm => 'Закрити приватне повідомлення';

  @override
  String get dmCloseDmConfirmTitle => 'Закрити приватне повідомлення';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Ви впевнені, що хочете закрити приватне повідомлення з $username? Ви завжди зможете відкрити його пізніше.';
  }

  @override
  String get dmDeleteMyMessagesTitle =>
      'Delete your messages in this conversation?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'This will permanently delete every message you have ever sent in this conversation. This cannot be undone.';

  @override
  String get dmCopyChannelId => 'Скопіювати ID каналу';

  @override
  String get dmChannelIdCopied => 'ID каналу скопійовано';

  @override
  String get dmCopyUserId => 'Скопіювати ID користувача';

  @override
  String get dmUserIdCopied => 'ID користувача скопійовано';

  @override
  String get dmViewProfile => 'Переглянути профіль';

  @override
  String get dmVoiceCall => 'Розпочати голосовий виклик';

  @override
  String get incomingVoiceCallTitle => 'Вхідний голосовий виклик';

  @override
  String get incomingVoiceCallAccept => 'Прийняти';

  @override
  String get incomingVoiceCallDecline => 'Відхилити';

  @override
  String get incomingVoiceCallLabel => 'Вхідний виклик';

  @override
  String get incomingVoiceCallIgnore => 'Ігнорувати';

  @override
  String get directVoiceCallNotEligible =>
      'Цей виклик неможливо розпочати зараз. Спробуйте пізніше.';

  @override
  String get voiceJoinCallFailed =>
      'Не вдалося підключитися до цього виклику. Перевірте з\'єднання та спробуйте ще раз.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Не вдалося приєднатися до цього виклику. Перевірте з\'єднання та спробуйте ще раз.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Не вдалося оновити цей виклик на сервері. Перевірте з\'єднання та спробуйте ще раз.';

  @override
  String get dmAddNote => 'Додати примітку';

  @override
  String get dmEditGroup => 'Редагувати групу';

  @override
  String get dmInviteToCommunity => 'Запросити до спільноти';

  @override
  String get dmBlock => 'Заблокувати';

  @override
  String get dmLeaveGroup => 'Покинути групу';

  @override
  String get dmNoCommunitiesAvailable => 'Спільноти недоступні';

  @override
  String dmGroupMemberCount(int count) {
    return '$count учасників';
  }

  @override
  String get dmMuteFor15Min => 'На 15 хвилин';

  @override
  String get dmMuteFor30Min => 'На 30 хвилин';

  @override
  String get dmMuteFor1Hour => 'На 1 годину';

  @override
  String get dmMuteFor3Hours => 'На 3 години';

  @override
  String get dmMuteFor4Hours => 'На 4 години';

  @override
  String get dmMuteFor8Hours => 'На 8 годин';

  @override
  String get dmMuteFor24Hours => 'На 24 години';

  @override
  String get dmMuteFor3Days => 'На 3 дні';

  @override
  String get dmMuteForever => 'Доки не ввімкну знову';

  @override
  String get dmPinGroupDm => 'Закріпити групове приватне повідомлення';

  @override
  String get dmUnpinGroupDm => 'Відкріпити груповий DM';

  @override
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
  }

  @override
  String get dmFavoriteDm => 'Додати DM до вибраного';

  @override
  String get dmUnfavoriteDm => 'Видалити DM з вибраного';

  @override
  String get dmFavoriteGroupDm => 'Додати груповий DM до вибраного';

  @override
  String get dmUnfavoriteGroupDm => 'Видалити груповий DM з вибраного';

  @override
  String get dmChangeFriendNickname => 'Змінити псевдонім друга';

  @override
  String get dmRemoveFriend => 'Видалити друга';

  @override
  String get dmAddFriend => 'Додати друга';

  @override
  String get dmAcceptFriendRequest => 'Прийняти запит на додавання в друзі';

  @override
  String get dmIgnoreFriendRequest => 'Ігнорувати запит на додавання в друзі';

  @override
  String get dmFriendRequestSent => 'Запит надіслано';

  @override
  String get dmUnblock => 'Розблокувати';

  @override
  String get dmDebugUser => 'Налагодження користувача';

  @override
  String get dmDebugChannel => 'Налагодження каналу';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => 'Закріплений DM';

  @override
  String get dmUnpinned => 'Відкріплений DM';

  @override
  String get dmMuted => 'Вимкнено звук DM';

  @override
  String get dmUnmuted => 'Увімкнено звук DM';

  @override
  String get dmRemoveFriendConfirmTitle => 'Видалити друга';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Ви впевнені, що хочете видалити $username з друзів?';
  }

  @override
  String get dmBlockConfirmTitle => 'Заблокувати користувача';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Ви впевнені, що хочете заблокувати $username? Він не зможе надсилати вам повідомлення або запити на додавання в друзі.';
  }

  @override
  String get dmFriendRequestSentToast => 'Запит надіслано';

  @override
  String get dmFriendRequestFailed =>
      'Не вдалося надіслати запит на додавання в друзі';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Не вдалося прийняти запит на додавання в друзі';

  @override
  String get dmRemoveFriendFailed => 'Не вдалося видалити друга';

  @override
  String get dmBlockFailed => 'Не вдалося заблокувати користувача';

  @override
  String get dmUnblockFailed => 'Не вдалося розблокувати користувача';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Не вдалося ігнорувати запит на додавання в друзі';

  @override
  String get dmAddFriends => 'Додати друзів';

  @override
  String get addFriendSheetTitle => 'Додати друга';

  @override
  String get addFriendUsernameHint => 'Ім\'я користувача#0000';

  @override
  String get addFriendUsernameLabel => 'Ім\'я користувача друга';

  @override
  String get addFriendSendRequest => 'Надіслати запит';

  @override
  String get addFriendNoUserFound => 'Користувача з таким ім\'ям не знайдено.';

  @override
  String get addFriendInvalidUsername =>
      'Введіть дійсне ім\'я користувача (Ім\'я користувача#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Запит надіслано';

  @override
  String get addFriendClaimTitle => 'Підтвердіть свій обліковий запис';

  @override
  String get addFriendClaimDescription =>
      'Підтвердьте свій обліковий запис, щоб надсилати запити на додавання в друзі.';

  @override
  String get addFriendVerifyTitle => 'Підтвердьте свою електронну пошту';

  @override
  String get addFriendVerifyDescription =>
      'Вам потрібно підтвердити свою електронну пошту, перш ніж ви зможете надсилати запити на додавання в друзі.';

  @override
  String get addFriendVerifyEmail => 'Підтвердити пошту';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Вхідні запити ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Вихідні запити ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Вхідний запит';

  @override
  String get addFriendOutgoingStatus => 'Запит надіслано';

  @override
  String get addFriendViewProfile => 'Переглянути профіль';

  @override
  String get addFriendAccept => 'Прийняти';

  @override
  String get addFriendIgnore => 'Ігнорувати';

  @override
  String get addFriendAcceptTitle => 'Прийняти запит на додавання в друзі';

  @override
  String get addFriendIgnoreTitle => 'Ігнорувати запит у друзі';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Прийняти запит у друзі від $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Ігнорувати запит у друзі від $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Скасувати запит';

  @override
  String get addFriendCancelRequestFailed =>
      'Не вдалося скасувати запит у друзі. Спробуйте ще раз.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Зараз вони не приймають запити в друзі.';

  @override
  String get addFriendUnblockFirst =>
      'Спочатку розблокуйте їх, щоб надіслати запит у друзі.';

  @override
  String get addFriendCannotSendToSelf =>
      'Ви не можете надіслати запит у друзі самому собі.';

  @override
  String get addFriendAlreadyFriends => 'Ви вже дружите з цим користувачем.';

  @override
  String get addFriendClaimToSend =>
      'Завершіть реєстрацію, щоб надсилати запити в друзі.';

  @override
  String get addFriendVerifyToSend =>
      'Verify your email before sending friend requests.';

  @override
  String get addFriendFriendsListFull =>
      'Your friends list is full, or theirs is. Remove someone and try again.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Система';

  @override
  String get emojiSearchPlaceholder => 'Знайдіть емодзі своєї мрії';

  @override
  String get emojiSearchEmpty => 'Емодзі не знайдено за вашим запитом';

  @override
  String get emojiAutocompleteDefaultLabel => 'Стандартний емодзі';

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
  String get emojiFrequentlyUsed => 'Часто використовувані';

  @override
  String get emojiTabGifs => 'GIF';

  @override
  String get emojiTabMedia => 'Медіа';

  @override
  String get emojiTabStickers => 'Стікери';

  @override
  String get emojiTabEmojis => 'Емодзі';

  @override
  String get gifPickerSearch => 'Пошук GIF';

  @override
  String get gifPickerSearchKlipy => 'Пошук KLIPY';

  @override
  String get gifPickerSearchTenor => 'Пошук Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Вибране';

  @override
  String get gifPickerFavoritesEmptyTitle => 'No favorite GIFs yet';

  @override
  String get gifPickerFavoritesEmptyDescription => 'Star a GIF to see it here.';

  @override
  String get gifPickerTrending => 'Популярні GIF';

  @override
  String get gifPickerNoResultsTitle => 'Немає результатів пошуку';

  @override
  String get gifPickerNoResultsDescription => 'Спробуйте інший пошуковий запит';

  @override
  String get gifPickerLoadFailedTitle => 'Не вдалося завантажити GIF';

  @override
  String get gifPickerLoadFailedBody =>
      'Перевірте з\'єднання та спробуйте ще раз.';

  @override
  String get emojiCategoryPeople => 'Люди';

  @override
  String get emojiCategoryNature => 'Природа';

  @override
  String get emojiCategoryFood => 'Їжа та напої';

  @override
  String get emojiCategoryActivity => 'Активності';

  @override
  String get emojiCategoryTravel => 'Подорожі та місця';

  @override
  String get emojiCategoryObjects => 'Об\'єкти';

  @override
  String get emojiCategorySymbols => 'Символи';

  @override
  String get emojiCategoryFlags => 'Прапори';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Розблокуйте $emojiCount з $communityCount за допомогою Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Отримати Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Не показувати знову';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count власних емодзі',
      one: '1 власний емодзі',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count спільноти',
      one: '1 спільнота',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Попередження про зовнішнє посилання';

  @override
  String externalLinkWarningLeaving(String productName) {
    return 'Ви збираєтеся покинути $productName';
  }

  @override
  String get externalLinkWarningDescription =>
      'Зовнішні посилання можуть бути небезпечними. Будьте обережні.';

  @override
  String get externalLinkWarningDestinationUrl => 'URL призначення:';

  @override
  String get externalLinksSectionTitle => 'Зовнішні посилання';

  @override
  String get externalLinksSectionDescription =>
      'Налаштуйте обробку попереджень про зовнішні посилання.';

  @override
  String get externalLinkWarningTrustPrefix => 'Завжди довіряти ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — пропустити це попередження наступного разу';

  @override
  String get externalLinkVisitSite => 'Відвідати сайт';

  @override
  String get externalLinkTrustAllLabel => 'Довіряти всім зовнішнім посиланням';

  @override
  String get externalLinkStripTrackingLabel =>
      'Видаляти параметри відстеження з URL';

  @override
  String get externalLinkStripTrackingDescription =>
      'Автоматично видаляйте параметри відстеження (як-от utm_source, fbclid, gclid) з URL у повідомленнях, які ви надсилаєте. Посилання очищується перед тим, як потрапити до когось іншого.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Довіряти всім зовнішнім посиланням?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Це дозволить довіряти всім зовнішнім посиланням і пропускати попередження для кожного домену. Ваші наявні довірені домени будуть замінені. Це менш безпечно.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Довіряти всім';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Припинити довіряти всім посиланням?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Попередження про зовнішні посилання знову з\'являтимуться. Вам потрібно буде додавати довірені домени окремо.';

  @override
  String get externalLinkStopTrustingAllAction => 'Вимкнути довіру до всіх';

  @override
  String get externalLinkTrustedAllDescription =>
      'Усім зовнішнім посиланням довіряють. Попередження не відображатимуться.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'У вас є $count довірений(і) домен(и). Додайте більше, поставивши прапорець під час відвідування зовнішніх посилань.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Коли увімкнено, попередження про зовнішні посилання не відображатимуться. Це менш безпечно.';

  @override
  String get imageFileTooLarge =>
      'Файл зображення занадто великий. Будь ласка, виберіть файл розміром менше 10 МБ.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Анімовані аватари потребують Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Анімовані банери потребують Plutonium';

  @override
  String get animatedAvifNotSupported => 'Анімовані AVIF не підтримуються';

  @override
  String get animatedAvifNotSupportedBody =>
      'Обрізання та обертання анімованих файлів AVIF ще не підтримується. Якщо ви продовжите, файл буде завантажено в його оригінальному вигляді.';

  @override
  String get uploadAsIs => 'Завантажити як є';

  @override
  String get croppingAnimatedNotSupported =>
      'Обрізання анімованих зображень ще не підтримується. Буде використано оригінальне завантаження.';

  @override
  String get cropAvatar => 'Обрізати аватар';

  @override
  String get cropBanner => 'Обрізати банер';

  @override
  String get skip => 'Пропустити';

  @override
  String get crop => 'Обрізати';

  @override
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => 'Змінити ваш Ім\'я користувача';

  @override
  String get fluxerTagInputLabel => 'Ім\'я користувача';

  @override
  String get fluxerTagDescriptionBase =>
      'Імена користувачів можуть містити лише літери (a-z, A-Z), цифри (0-9) та підкреслення. Імена користувачів нечутливі до регістру.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Імена користувачів можуть містити лише літери (a-z, A-Z), цифри (0-9) та підкреслення. Імена користувачів нечутливі до регістру. Ви можете вибрати будь-який доступний 4-значний тег від #0000 до #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Імена користувачів можуть містити лише літери (a-z, A-Z), цифри (0-9) та підкреслення. Імена користувачів нечутливі до регістру. Ви можете вибрати будь-який доступний 4-значний тег від #0001 до #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Від $min до $max символів';
  }

  @override
  String get validationAllowedChars =>
      'Лише літери (a-z, A-Z), цифри (0-9) та підкреслення (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Отримайте Plutonium, щоб налаштувати свій тег або зберегти його під час зміни імені користувача';

  @override
  String get fluxerTagAlreadyTaken => 'Ім\'я користувача вже зайнятий';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Ім\'я користувача $username#$discriminator вже зайнятий. Продовження автоматично перепризначить ваш дискримінатор.';
  }

  @override
  String get customTagIsTemporary => 'Власний тег є тимчасовим';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Ваш власний 4-значний тег доступний лише під час активної підписки Plutonium. Коли ваша підписка закінчиться $date, ваш тег буде замінено випадковим номером після 3-денного пільгового періоду.';
  }

  @override
  String get customTagTemporaryBody =>
      'Ваш власний 4-значний тег доступний лише під час активної підписки Plutonium. Коли ваша підписка закінчиться, ваш тег буде замінено випадковим номером після 3-денного пільгового періоду.';

  @override
  String get iUnderstandContinue => 'Я розумію, продовжувати';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Якщо ви збережете цей Ім\'я користувача, ваш власний 4-значний тег буде замінено випадковим номером після закінчення вашої підписки Plutonium. Якщо ваша підписка не буде поновлена, у вас буде 3-денний пільговий період перед зміною тегу.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Ваш власний 4-значний тег (#$discriminator) активний під час активної підписки Plutonium. Якщо ваша підписка закінчиться або не буде поновлена після 3-денного пільгового періоду, ваш тег буде замінено випадковим номером.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Налаштуйте свій 4-значний тег або збережіть його під час зміни імені користувача';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Ваш пробний період Plutonium закінчується $date. Оновіть, щоб зберегти свій власний тег і отримати значок у профілі.';
  }

  @override
  String get premiumTrialActive =>
      'Ви використовуєте пробну версію Plutonium. Оновіть, щоб зберегти свій власний тег і отримати значок у профілі.';

  @override
  String get fluxerTagUpdated => 'Ім\'я користувача оновлено';

  @override
  String get fluxerTagUpdateFailed =>
      'Не вдалося оновити Ім\'я користувача. Будь ласка, спробуйте ще раз.';

  @override
  String get continueAction => 'Продовжити';

  @override
  String get profileCustomizationTitle => 'Налаштування профілю';

  @override
  String get profileCustomizationDescription =>
      'Редагуйте зовнішній вигляд свого профілю та переглядайте його в реальному часі';

  @override
  String get usernameLabel => 'Ім\'я користувача';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Підтвердьте свій обліковий запис, щоб змінити свій Ім\'я користувача';

  @override
  String get changeFluxerTag => 'Змінити Ім\'я користувача';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Налаштуйте свій 4-значний тег (#$discriminator) на свій смак за допомогою Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Змінити ім\'я користувача та 4-значний тег';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Ваш власний тег (#$discriminator) прив\'язаний до вашої підписки Plutonium і буде замінений випадковим тегом, якщо вона закінчиться.';
  }

  @override
  String get displayNameLabel => 'Відображуване ім\'я';

  @override
  String get pronounsLabel => 'Займенники';

  @override
  String get avatarLabel => 'Аватар';

  @override
  String get changeAvatar => 'Змінити аватар';

  @override
  String get removeAvatar => 'Видалити аватар';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Макс. 10 МБ. Рекомендовано: 512×512px';

  @override
  String get bannerLabel => 'Банер';

  @override
  String get changeBanner => 'Змінити банер';

  @override
  String get removeBanner => 'Видалити банер';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Макс. 10 МБ. Мінімум: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Акцентний колір';

  @override
  String get accentColorDescription =>
      'Налаштовує колір рамки та банера у вашому профілі';

  @override
  String get aboutMeLabel => 'Про мене';

  @override
  String get aboutMeHelperText =>
      'Ви можете використовувати посилання, емодзі та Markdown.';

  @override
  String get emojiPickerTitle => 'Емодзі';

  @override
  String get plutoniumBadgePrivacyTitle => 'Приватність значка Plutonium';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Керуйте тим, як ваш значок Plutonium відображається іншим';

  @override
  String get hidePlutoniumBadgeLabel => 'Повністю приховати значок Plutonium';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Повністю приховати ваш значок Plutonium від інших користувачів';

  @override
  String get hidePlutoniumPurchaseDate => 'Приховати дату придбання Plutonium';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Приховати дату придбання Plutonium ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Приховати дату першого придбання Plutonium зі свого значка';

  @override
  String get maskVisionaryAsSubscription => 'Маскувати Visionary як підписку';

  @override
  String get maskVisionaryDescription =>
      'Відображати ваш Visionary як звичайну підписку';

  @override
  String get hideVisionaryIdBadge => 'Приховати значок ID Visionary';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Приховати значок ID Visionary (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Видалити ваш значок ID Visionary';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Ви на безкоштовному пробному періоді Plutonium — ваша підписка розпочнеться $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Ваша підписка автоматично розпочнеться після закінчення пробного періоду. Жодних дій не потрібно.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Ваш пробний період Plutonium закінчується $date';
  }

  @override
  String get premiumTrialActiveProfile =>
      'Ви на безкоштовному пробному періоді Plutonium';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Макс. 10 МБ. Рекомендовано: 512×512px. Анімовані аватари (GIF) потребують Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Налаштуйте свій профіль за допомогою статичного або анімованого зображення банера, щоб він виділявся.';

  @override
  String get getPlutonium => 'Отримати Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Покупки в додатку ще недоступні на цій платформі. Залишайтеся на зв\'язку — скоро буде!';

  @override
  String get profilePreviewLabel => 'Попередній перегляд';

  @override
  String get profilePreviewMessage => 'Повідомлення';

  @override
  String profilePreviewMemberSince(String productName) {
    return 'Учасник $productName з';
  }

  @override
  String get unclaimedAccountTitle => 'Непідтверджений обліковий запис';

  @override
  String get unclaimedAccountDescription =>
      'Ваш обліковий запис ще не підтверджено. Без електронної пошти та пароля ви можете втратити доступ. Підтвердьте свій обліковий запис зараз, щоб захистити його.';

  @override
  String get claimAccount => 'Підтвердити обліковий запис';

  @override
  String get profileTypeLabel => 'Тип профілю';

  @override
  String get profileTypeGlobal => 'Глобальний профіль';

  @override
  String get profileTypeGuildDescription =>
      'Ви редагуєте свій профіль для спільноти. Цей профіль буде видно лише в цій спільноті та замінить ваш глобальний профіль.';

  @override
  String get communityNicknameLabel => 'Нікнейм спільноти';

  @override
  String get perGuildPremiumUpsellText =>
      'Налаштування вашого аватара, банера, акцентного кольору та біографії для окремих спільнот вимагає Plutonium. Прізвиська спільноти та займенники безкоштовні для всіх.';

  @override
  String get avatarModeInherit => 'Використовувати глобальний профіль';

  @override
  String get avatarModeCustom => 'Використовувати власне зображення';

  @override
  String get avatarModeUnset => 'Не показувати';

  @override
  String get profileSavedToast => 'Профіль оновлено';

  @override
  String get profileEditButton => 'Редагувати профіль';

  @override
  String get profileNoteLabel => 'Примітка';

  @override
  String get profileNoteVisibility => '(видно лише вам)';

  @override
  String get profileNoteEmpty => 'Приміток ще немає.';

  @override
  String get sudoTitle => 'Підтвердьте свою особу';

  @override
  String get sudoDescription => 'Ця дія вимагає підтвердження для продовження.';

  @override
  String get sudoAuthenticatorCode => 'Код автентифікатора';

  @override
  String get sudoMethodPassword => 'Пароль';

  @override
  String get sudoMethodTotp => 'Автентифікатор';

  @override
  String get sudoVerificationFailed =>
      'Перевірка не вдалася. Спробуйте ще раз.';

  @override
  String get securityAccountTitle => 'Обліковий запис';

  @override
  String get securityAccountDescription =>
      'Керуйте своєю електронною поштою, паролем та налаштуваннями облікового запису';

  @override
  String get securitySectionTitle => 'Безпека';

  @override
  String get securitySectionDescription =>
      'Захистіть свій обліковий запис за допомогою двофакторної автентифікації та ключів доступу';

  @override
  String get securityLoginEmailSectionTitle => 'Налаштування електронної пошти';

  @override
  String securityLoginEmailSectionDescription(String productName) {
    return 'Керуйте адресою електронної пошти, яку ви використовуєте для входу в $productName';
  }

  @override
  String get securityLoginEmailAddressLabel => 'Адреса електронної пошти';

  @override
  String get securityLoginNoEmailSet => 'Електронну адресу не встановлено';

  @override
  String get securityLoginChangeEmail => 'Змінити електронну пошту';

  @override
  String get securityLoginAddEmail => 'Додати електронну пошту';

  @override
  String get securityLoginReveal => 'Показати';

  @override
  String get securityLoginHide => 'Приховати';

  @override
  String get securityLoginPasswordSectionTitle => 'Пароль';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Змініть свій пароль, щоб захистити свій обліковий запис';

  @override
  String get securityLoginCurrentPasswordLabel => 'Поточний пароль';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Останній раз змінено: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged =>
      'Останній раз змінено: Ніколи';

  @override
  String get securityLoginNoPasswordSet => 'Пароль не встановлено';

  @override
  String get securityLoginChangePassword => 'Змінити пароль';

  @override
  String get securityLoginSetPassword => 'Встановити пароль';

  @override
  String get passwordChangeTitle => 'Змінити пароль';

  @override
  String get passwordChangeIntroDescription =>
      'Ми надішлемо код підтвердження на вашу електронну адресу, щоб підтвердити вашу особу перед зміною пароля.';

  @override
  String get passwordChangeStart => 'Почати';

  @override
  String get passwordChangeVerifyTitle => 'Підтвердьте свою електронну пошту';

  @override
  String get passwordChangeVerifyDescription =>
      'Введіть код підтвердження, надісланий на вашу електронну адресу.';

  @override
  String get passwordChangeVerificationCode => 'Код підтвердження';

  @override
  String get passwordChangeVerify => 'Підтвердити';

  @override
  String get passwordChangeNewPasswordTitle => 'Встановіть новий пароль';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Введіть новий пароль нижче.';

  @override
  String get passwordChangeNewPassword => 'Новий пароль';

  @override
  String get passwordChangeConfirmPassword => 'Підтвердьте новий пароль';

  @override
  String get passwordChangeSubmit => 'Змінити пароль';

  @override
  String get passwordChangeSuccess => 'Пароль змінено';

  @override
  String get passwordChangePasswordsDoNotMatch => 'Паролі не збігаються';

  @override
  String get passwordChangeInvalidCode => 'Недійсний або прострочений код';

  @override
  String get emailChangeTitle => 'Змінити електронну пошту';

  @override
  String get emailChangeIntroDescription =>
      'Ми надішлемо коди для перевірки вашої особистості перед зміною адреси електронної пошти.';

  @override
  String get emailChangeStart => 'Почати';

  @override
  String get emailChangeVerifyOriginalTitle =>
      'Підтвердити поточну електронну пошту';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Введіть код підтвердження, надісланий на вашу поточну електронну адресу.';

  @override
  String get emailChangeNewEmailTitle => 'Введіть нову електронну пошту';

  @override
  String get emailChangeNewEmailDescription =>
      'Введіть нову адресу електронної пошти, яку ви хочете використовувати.';

  @override
  String get emailChangeNewEmailLabel => 'Нова електронна пошта';

  @override
  String get emailChangeNewEmailSubmit => 'Надіслати код підтвердження';

  @override
  String get emailChangeVerifyNewTitle => 'Підтвердити нову електронну пошту';

  @override
  String get emailChangeVerifyNewDescription =>
      'Введіть код підтвердження, надісланий на вашу нову електронну адресу.';

  @override
  String get emailChangeSuccess => 'Електронну пошту змінено';

  @override
  String get emailChangeInvalidCode => 'Недійсний або прострочений код';

  @override
  String get resend => 'Надіслати повторно';

  @override
  String resendCountdown(int seconds) {
    return 'Надіслати повторно ($secondsс)';
  }

  @override
  String get verificationCode => 'Код підтвердження';

  @override
  String get verify => 'Підтвердити';

  @override
  String get enable => 'Увімкнути';

  @override
  String get disable => 'Вимкнути';

  @override
  String get delete => 'Видалити';

  @override
  String get save => 'Зберегти';

  @override
  String get securityTfaSectionTitle => 'Двофакторна автентифікація';

  @override
  String get securityTfaSectionDescription =>
      'Додайте додатковий рівень безпеки до свого облікового запису';

  @override
  String get securityTfaAuthenticatorApp => 'Програма автентифікації';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Двофакторна автентифікація увімкнена';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Використовуйте програму автентифікації для генерації кодів для двофакторної автентифікації';

  @override
  String get securityTfaBackupCodes => 'Резервні коди';

  @override
  String get securityTfaBackupCodesDescription =>
      'Перегляньте та керуйте своїми резервними кодами для відновлення облікового запису';

  @override
  String get securityTfaViewCodes => 'Переглянути коди';

  @override
  String get securityPasskeysSectionTitle => 'Ключі доступу';

  @override
  String get securityPasskeysSectionDescription =>
      'Використовуйте ключі доступу для входу без пароля та двофакторної автентифікації';

  @override
  String get securityPasskeysRegistered => 'Зареєстровані ключі доступу';

  @override
  String get securityPasskeysNone => 'Ключі доступу не зареєстровано';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ключів доступу',
      one: 'ключ доступу',
    );
    return '$_temp0 зареєстровано ($count) (макс. 10)';
  }

  @override
  String get securityPasskeysAdd => 'Додати ключ доступу';

  @override
  String securityPasskeysAdded(String date) {
    return 'Додано: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Останнє використання: $date';
  }

  @override
  String get securityPasskeysRename => 'Перейменувати';

  @override
  String get securityPasskeysDeleteTitle => 'Видалити ключ доступу';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Ви впевнені, що хочете видалити ключ доступу «$name»?';
  }

  @override
  String get securityPasskeyNameTitle => 'Назва ключа доступу';

  @override
  String get securityPasskeyNameLabel => 'Назва ключа доступу';

  @override
  String get securityPasskeyNameHint =>
      'напр. YubiKey, iPhone, робочий комп\'ютер';

  @override
  String get securityPhoneSectionTitle => 'Номер телефону';

  @override
  String get securityPhoneSectionDescription =>
      'Керуйте своїм номером телефону.';

  @override
  String get securityPhoneLabel => 'Номер телефону';

  @override
  String get securityPhoneNone => 'Номер телефону не додано.';

  @override
  String get securityPhoneAdd => 'Додати телефон';

  @override
  String get securityPhoneRemove => 'Видалити';

  @override
  String get securityPhoneRemoveTitle => 'Видалити номер телефону';

  @override
  String get securityPhoneRemoveDescription =>
      'Ви впевнені, що хочете видалити свій номер телефону?';

  @override
  String get securityPhoneRemoved => 'Номер телефону видалено';

  @override
  String get securityClaimTitle => 'Функції безпеки';

  @override
  String get securityClaimDescription =>
      'Підтвердьте свій обліковий запис, щоб отримати доступ до функцій безпеки, таких як двофакторна автентифікація та ключі доступу.';

  @override
  String get securityVerifyEmailRequired =>
      'Ви повинні підтвердити свою електронну адресу, перш ніж зможете налаштувати двофакторну автентифікацію, ключі доступу або SMS-перевірку.';

  @override
  String get totpEnableTitle => 'Налаштування програми автентифікації';

  @override
  String get totpEnableDescription =>
      'Відскануйте QR-код за допомогою програми автентифікації, щоб згенерувати коди для двофакторної автентифікації.';

  @override
  String get totpEnableCodeLabel => 'Код';

  @override
  String get totpEnableCodeHint =>
      'Введіть 6-значний код із програми автентифікації';

  @override
  String get totpEnableSuccess => 'Двофакторну автентифікацію ввімкнено';

  @override
  String get totpDisableTitle => 'Видалення програми автентифікації';

  @override
  String get totpDisableDescription =>
      'Введіть 6-значний код із програми автентифікації, щоб вимкнути двофакторну автентифікацію.';

  @override
  String get totpDisableSuccess => 'Двофакторну автентифікацію вимкнено';

  @override
  String get backupCodesTitle => 'Резервні коди';

  @override
  String get backupCodesWarning =>
      'Якщо ви втратите доступ до програми автентифікації та не матимете цих кодів, ваш обліковий запис буде назавжди заблоковано. Завантажте або скопіюйте їх зараз і збережіть у безпечному місці.';

  @override
  String get backupCodesDownload => 'Завантажити';

  @override
  String get backupCodesCopy => 'Копіювати';

  @override
  String get backupCodesCopied => 'Резервні коди скопійовано в буфер обміну';

  @override
  String get backupCodesAcknowledge =>
      'Я завантажив або скопіював свої резервні коди та зберіг їх у безпечному місці.';

  @override
  String get backupCodesDone => 'Готово';

  @override
  String get backupCodesViewTitle => 'Переглянути резервні коди';

  @override
  String get backupCodesViewDescription =>
      'Може знадобитися перевірка перед переглядом резервних кодів.';

  @override
  String get phoneAddTitle => 'Додати номер телефону';

  @override
  String get phoneAddLabel => 'Номер телефону';

  @override
  String get phoneAddHint => 'Введіть свій номер телефону';

  @override
  String get phoneAddFooter =>
      'Введіть свій номер телефону. Ми надішлемо вам код підтвердження через SMS.';

  @override
  String get phoneAddSendCode => 'Надіслати код';

  @override
  String get phoneVerifyTitle => 'Підтвердити номер телефону';

  @override
  String get phoneVerifyDescription =>
      'Введіть код підтвердження, надісланий на ваш номер телефону.';

  @override
  String get phoneAddSuccess => 'Номер телефону додано';

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
  String get dangerZoneSectionTitle => 'Небезпечна зона';

  @override
  String get dangerZoneSectionDescription => 'Незворотні та руйнівні дії';

  @override
  String get dangerZoneDisableTitle => 'Вимкнути обліковий запис';

  @override
  String get dangerZoneDisableDescription =>
      'Тимчасово вимкніть свій обліковий запис. Ви зможете активувати його пізніше, увійшовши знову.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Вимкнення вашого облікового запису призведе до виходу з усіх сесій. Ви можете повторно активувати свій обліковий запис будь-коли, увійшовши знову.';

  @override
  String get dangerZoneDeleteTitle => 'Видалити обліковий запис';

  @override
  String get dangerZoneDeleteDescription =>
      'Назавжди видаліть свій обліковий запис та всі пов\'язані дані. Цю дію неможливо скасувати.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Скасуйте свою активну підписку Plutonium у налаштуваннях Plutonium перед видаленням облікового запису.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount =>
      'Не вдалося видалити обліковий запис';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Ви не можете видалити свій обліковий запис, поки володієте спільнотами. Спочатку передайте право власності на такі спільноти:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'та ще $count';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Щоб передати право власності, перейдіть до $settingsPath і скористайтеся опцією передачі права власності.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Ви впевнені, що хочете видалити свій обліковий запис? Ця дія запланує ваш обліковий запис на остаточне видалення.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Ви можете скасувати процес видалення протягом 14 днів';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Через 14 днів ваш обліковий запис буде назавжди видалено';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Після обробки видалення ви не зможете відновити доступ до свого облікового запису';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Ви не зможете видалити надіслані повідомлення після видалення облікового запису';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Якщо ви хочете експортувати свої дані або спочатку видалити повідомлення, відвідайте розділ Панель конфіденційності в Налаштуваннях користувача перед продовженням.';

  @override
  String get claimAccountTitle => 'Підтвердьте свій обліковий запис';

  @override
  String get claimAccountDescription =>
      'Підтвердьте свій обліковий запис, додавши електронну адресу та пароль. Ми надішлемо код підтвердження для перевірки вашої електронної адреси перед завершенням.';

  @override
  String get claimAccountEmailLabel => 'Електронна пошта';

  @override
  String get claimAccountPasswordLabel => 'Пароль';

  @override
  String get claimAccountSendCode => 'Надіслати код';

  @override
  String get claimAccountVerifyDescription =>
      'Введіть код, який ми надіслали на вашу електронну пошту, щоб підтвердити її. Ваш пароль буде встановлено після підтвердження коду.';

  @override
  String get claimAccountSuccess => 'Обліковий запис успішно отримано';

  @override
  String get importantInformation => 'Важлива інформація:';

  @override
  String get genericError => 'Виникла помилка';

  @override
  String get networkErrorMessage => 'Something went wrong. Please try again.';

  @override
  String get invalidCode => 'Неправильний код';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count років тому',
      one: '1 рік тому',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count місяців тому',
      one: '1 місяць тому',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count днів тому',
      one: '1 день тому',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count годин тому',
      one: '1 годину тому',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count хвилин тому',
      one: '1 хвилину тому',
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
  String get relativeTimeJustNow => 'щойно';

  @override
  String get authorizedAppsTitle => 'Авторизовані програми';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Цим програмам надано доступ до вашого облікового запису $productName.';
  }

  @override
  String get authorizedAppsEmptyTitle => 'Немає авторизованих програм';

  @override
  String get authorizedAppsEmptyDescription =>
      'Ви ще не надали доступ до свого облікового запису жодній програмі.';

  @override
  String get authorizedAppsLoadError =>
      'Не вдалося завантажити авторизовані програми';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Авторизовано $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Надані дозволи';

  @override
  String get authorizedAppsRevoke => 'Відкликати';

  @override
  String get authorizedAppsRevokeTitle => 'Відкликати доступ програми';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Ви впевнені, що хочете відкликати доступ для $appName? Ця програма більше не матиме доступу до вашого облікового запису.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Доступ до основної інформації вашого профілю (ім\'я користувача, аватар тощо)';

  @override
  String get authorizedAppsScopeEmail =>
      'Переглядати вашу адресу електронної пошти';

  @override
  String get authorizedAppsScopeGuilds =>
      'Переглядати спільноти, учасником яких ви є';

  @override
  String get authorizedAppsScopeConnections =>
      'Переглядати ваші підключені облікові записи';

  @override
  String get authorizedAppsScopeBot =>
      'Додавати бота до спільноти з запитаними дозволами';

  @override
  String get authorizedAppsScopeAdmin =>
      'Доступ до адміністративних кінцевих точок';

  @override
  String get privacyPendingDeletionTitle => 'Очікує видалення';

  @override
  String get blockedUsersTitle => 'Заблоковані користувачі';

  @override
  String get blockedUsersDescription =>
      'Заблоковані користувачі не можуть надсилати вам запити на дружбу або писати вам особисті повідомлення.';

  @override
  String get blockedUsersEmptyTitle => 'Немає заблокованих користувачів';

  @override
  String get blockedUsersEmptyDescription => 'Ви ще нікого не заблокували.';

  @override
  String get blockedUsersLoadError =>
      'Не вдалося завантажити заблокованих користувачів';

  @override
  String get blockedUsersUnblock => 'Розблокувати';

  @override
  String get blockedUsersUnblockTitle => 'Розблокувати користувача';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Ви впевнені, що хочете розблокувати $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Копіювати Ім\'я користувача';

  @override
  String get blockedUsersCopyId => 'Копіювати ID користувача';

  @override
  String get userProfileLoadError => 'Не вдалося завантажити профіль';

  @override
  String get userProfileLoading => 'Loading profile';

  @override
  String get userProfileRetry => 'Спробувати ще раз';

  @override
  String get userProfileMessage => 'Повідомлення';

  @override
  String get userProfileVoiceCall => 'Голосовий виклик';

  @override
  String get userProfileVideoCall => 'Відеовиклик';

  @override
  String get userProfileEditProfile => 'Редагувати профіль';

  @override
  String userProfileStaffBadgeTooltip(String productName) {
    return 'Команда $productName';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return 'Спільнота $productName';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return 'Партнер $productName';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return 'Мисливець за помилками $productName';
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
    return 'Підписник $productName Plutonium з $date';
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
    return 'Visionary $productName з $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'ID Visionary #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Спільні друзі ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Спільні спільноти ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Спільні друзі';

  @override
  String get userProfileMutualCommunitiesTitle => 'Спільні спільноти';

  @override
  String get userProfileNoMutualFriends => 'Спільних друзів не знайдено.';

  @override
  String get userProfileNoMutualCommunities => 'Спільних спільнот не знайдено.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Нікнейм: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Відкрити приватне повідомлення';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Ви заблокували $username. Ви не зможете надсилати повідомлення, доки не розблокуєте його.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Розблокувати';

  @override
  String get userProfileOpenDm => 'Відкрити приватне повідомлення';

  @override
  String get userProfileNoteTitle => 'Примітка';

  @override
  String get userProfileNoteVisibility => '(видно лише вам)';

  @override
  String get userProfileNoteSave => 'Зберегти';

  @override
  String get userProfileNoteDelete => 'Видалити';

  @override
  String get userProfileNoteEmpty => 'Натисніть, щоб додати примітку';

  @override
  String get userProfileMemberSince => 'Учасник з';

  @override
  String get userProfileAboutMe => 'Про мене';

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
  String get userProfileCopyUsername => 'Копіювати ім\'я користувача';

  @override
  String get userProfileCopyUserId => 'Копіювати ID користувача';

  @override
  String get userProfileViewMainProfile => 'Переглянути основний профіль';

  @override
  String get userProfileViewCommunityProfile => 'Переглянути профіль спільноти';

  @override
  String get userProfileBlockUser => 'Заблокувати користувача';

  @override
  String get userProfileUnblockUser => 'Розблокувати користувача';

  @override
  String get userProfileRemoveFriend => 'Видалити з друзів';

  @override
  String get userProfileBlockConfirmTitle => 'Заблокувати користувача';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Ви впевнені, що хочете заблокувати $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Розблокувати користувача';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Ви впевнені, що хочете розблокувати $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Видалити з друзів';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Ви впевнені, що хочете видалити $username з друзів?';
  }

  @override
  String get userProfileFailedOpenDm =>
      'Не вдалося відкрити приватне повідомлення';

  @override
  String get userProfileFailedSaveNote => 'Не вдалося зберегти примітку';

  @override
  String get userProfileActionFailed => 'Дія не вдалася, спробуйте ще раз';

  @override
  String get userProfileChangeNickname => 'Змінити нікнейм';

  @override
  String get userProfileKick => 'Вигнати';

  @override
  String get userProfileBan => 'Заборонити';

  @override
  String get userProfileTimeout => 'Тимчасово заблокувати';

  @override
  String get userProfileRemoveTimeout => 'Зняти тимчасове блокування';

  @override
  String get userProfileTransferOwnership => 'Передати власність';

  @override
  String get userProfileReportUser => 'Повідомити про користувача';

  @override
  String get userProfileReportMessage => 'Повідомити про повідомлення';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Вигнати $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Ви впевнені, що хочете вигнати $username? Він/вона зможе приєднатися знову за новим запрошенням.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Зняти тайм-аут?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Зняття тайм-ауту дозволить $username знову надсилати повідомлення, реагувати та приєднуватися до голосових каналів.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Передати власність?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Передати власність цієї спільноти користувачеві $username? Це незворотно, і ви втратите всі права власника.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Заблокувати $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Тривалість блокування';

  @override
  String get userProfileBanCustomSecondsLabel => 'Власна тривалість (секунди)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Будь-яке значення від $min до $max секунд';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Видалити історію повідомлень';

  @override
  String get userProfileBanDeleteNone => 'Не видаляти жодних';

  @override
  String get userProfileBanDelete24h => 'Попередні 24 години';

  @override
  String get userProfileBanDelete7d => 'Попередні 7 днів';

  @override
  String get userProfileBanReasonLabel => 'Причина (необов\'язково)';

  @override
  String get userProfileBanReasonHint => 'Введіть причину блокування';

  @override
  String get userProfileBanSubmit => 'Заблокувати учасника';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Тайм-аут для $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Тривалість тайм-ауту';

  @override
  String get userProfileTimeoutSubmit => 'Тайм-аут для учасника';

  @override
  String get userProfileNicknameLabel => 'Псевдонім';

  @override
  String get userProfileNicknameHint => 'Введіть псевдонім';

  @override
  String get userProfileNicknameSave => 'Зберегти';

  @override
  String userProfileKickSuccess(String username) {
    return 'Учасника $username вигнано';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Учасника $username заблоковано';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Учаснику $username встановлено тайм-аут';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Тайм-аут для $username знято';
  }

  @override
  String get userProfileNicknameSuccess => 'Псевдонім оновлено';

  @override
  String get userProfileTransferSuccess => 'Власність передано';

  @override
  String get durationPermanent => 'Назавжди';

  @override
  String get duration60Seconds => '60 секунд';

  @override
  String get duration5Minutes => '5 хвилин';

  @override
  String get duration10Minutes => '10 хвилин';

  @override
  String get duration1Hour => '1 година';

  @override
  String get duration12Hours => '12 годин';

  @override
  String get duration1Day => '1 день';

  @override
  String get duration3Days => '3 дні';

  @override
  String get duration5Days => '5 днів';

  @override
  String get duration1Week => '1 тиждень';

  @override
  String get duration2Weeks => '2 тижні';

  @override
  String get duration1Month => '1 місяць';

  @override
  String get durationCustom => 'Власна…';

  @override
  String get iarReportUserTitle => 'Повідомити про користувача';

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
  String get iarReasonInappropriateProfile => 'Недоречний профіль';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Профіль цього користувача містить недоречний контент';

  @override
  String typingIndicatorOne(String name) {
    return 'Набирає текст $name...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return 'Набирають текст $name1 та $name2...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return 'Набирають текст $name1, $name2 та $name3...';
  }

  @override
  String get typingIndicatorMultiple => 'Кілька людей набирають текст...';

  @override
  String get typingIndicatorHandful =>
      'Збирається жменька клавіатурних воїнів...';

  @override
  String get typingIndicatorSymphony =>
      'Розпочалася симфонія клацання клавіш...';

  @override
  String get typingIndicatorFiesta => 'Тут справжня вечірка набору тексту';

  @override
  String get typingIndicatorApocalypse => 'Ого, це апокаліпсис друкування';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Раді, що ти тут, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Ласкаво просимо, $username! Почувайся як удома.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Привіт, $username! Раді бачити тебе тут.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Привіт, $username! Долучайся, коли будеш готовий.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Привіт, $username, радий бачити тебе тут!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Привіт, $username! Сподіваємося, тобі сподобається.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Привіт, $username, ласкаво просимо на борт!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Раді, що ти приєднався, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Ласкаво просимо, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Ласкаво просимо, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Ласкаво просимо, $username! Ми раді, що ти тут.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Ласкаво просимо, $username! Сподіваємося, тобі сподобається час тут.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Ласкаво просимо, $username! Твоя наступна розмова починається тут.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Ласкаво просимо, $username. Ми раді, що ти тут.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Раді бачити тебе, $username! Ласкаво просимо.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Ти тут, $username! Добре, що ти з нами.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Ти прибув, $username! Почнемо.';
  }

  @override
  String get relativeTimeShortNow => 'щойно';

  @override
  String relativeTimeShortMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count хв',
      one: '1 хв',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count год',
      one: '1 год',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count д',
      one: '1 д',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count міс',
      one: '1 міс',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count р',
      one: '1 р',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'Мої пристрої';

  @override
  String get linkedDevicesDescription =>
      'Перегляньте всі пристрої, які зараз увійшли до вашого облікового запису. Відкличте будь-які сеанси, які ви не впізнаєте.';

  @override
  String get linkedDevicesCurrentDevice => 'Поточний пристрій';

  @override
  String get linkedDevicesOtherDevices => 'Інші пристрої';

  @override
  String get linkedDevicesEnterSelection => 'Увійти в режим вибору';

  @override
  String get linkedDevicesExitSelection => 'Вийти з режиму вибору';

  @override
  String get linkedDevicesSelectAll => 'Вибрати все';

  @override
  String get linkedDevicesClearSelection => 'Очистити вибір';

  @override
  String get linkedDevicesRevokeTooltip => 'Відкликати пристрій';

  @override
  String get linkedDevicesSignOutAll => 'Вийти з усіх інших пристроїв';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Вийти з $count пристроїв',
      one: 'Вийти з 1 пристрою',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Вийти з $count пристроїв',
      one: 'Вийти з 1 пристрою',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Вийти з усіх інших пристроїв';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Це виведе вибрані пристрої з вашого облікового запису. Вам потрібно буде знову увійти на тих пристроях.',
      one:
          'Це виведе вибраний пристрій з вашого облікового запису. Вам потрібно буде знову увійти на цьому пристрої.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Це виведе вибрані пристрої з вашого облікового запису. Вам потрібно буде знову увійти на тих пристроях.';

  @override
  String get linkedDevicesSignOutConfirm => 'Продовжити';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Вам доведеться знову увійти на всіх пристроях, з яких було виконано вихід';

  @override
  String get linkedDevicesLoadErrorTitle => 'Помилка мережі';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'У нас виникли проблеми з підключенням до просторово-часового континууму. Будь ласка, перевірте з\'єднання та спробуйте ще раз.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Пристрої відкликано',
      one: 'Пристрій відкликано',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError => 'Не вдалося вийти. Спробуйте ще раз.';

  @override
  String get linkedDevicesUnknownOs => 'Невідома ОС';

  @override
  String get linkedDevicesUnknownPlatform => 'Невідома платформа';

  @override
  String slowmodeLabel(String duration) {
    return '$duration режим сповільнення';
  }

  @override
  String get slowmodeTooltipActive =>
      'Ви перебуваєте в режимі сповільнення. Будь ласка, зачекайте перед надсиланням наступного повідомлення.';

  @override
  String get slowmodeTooltipImmune =>
      'Режим сповільнення увімкнено, але ви захищені від нього.';

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
      'Ви не можете надсилати повідомлення в цьому каналі.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Системні оголошення від співробітників $productName. Тут не можна відповідати.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Надсилання повідомлень тимчасово призупинено в цій спільноті.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Ви тимчасово заблоковані. Надсилання повідомлень, реакції та голосовий зв\'язок призупинено до закінчення терміну блокування.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Вам потрібно підтвердити свій обліковий запис, щоб надсилати повідомлення в цій спільноті.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Вам потрібно підтвердити свою електронну пошту, щоб надсилати повідомлення в цій спільноті.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Ваш обліковий запис занадто новий, щоб надсилати повідомлення в цій спільноті.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Ви недостатньо довго є учасником цієї спільноти, щоб надсилати повідомлення.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Вам потрібно підтвердити номер телефону, щоб надсилати повідомлення в цій спільноті.';

  @override
  String get channelComposerBarrierVerifyEmail =>
      'Підтвердити електронну пошту';

  @override
  String get channelComposerBarrierVerifyPhone => 'Підтвердити телефон';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Занадто багато вкладень (макс. $max)';
  }

  @override
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName перевищує ліміт розміру ($fileSize)';
  }

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Ці файли занадто великі, щоб надіслати їх разом';

  @override
  String get chatAttachmentDropToUpload => 'Перетягніть файли для завантаження';

  @override
  String get chatAttachmentDropToSend =>
      'Перетягніть файли, щоб надіслати зараз';

  @override
  String get chatAttachmentSendVoiceMessage =>
      'Надіслати голосове повідомлення';

  @override
  String get voiceMessageTitle => 'Голосове повідомлення';

  @override
  String get voiceMessageHoldHint =>
      'Утримуйте, щоб записати. Перетягніть вгору, щоб зафіксувати, або відпустіть, щоб надіслати.';

  @override
  String get voiceMessageDiscard => 'Видалити голосове повідомлення';

  @override
  String get voiceMessageSend => 'Надіслати голосове повідомлення';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Не вдалося розпочати запис. Надайте доступ до мікрофона.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Запис голосу не підтримується на цьому пристрої.';

  @override
  String get voiceMessageMicInUse =>
      'Залиште голосовий виклик, щоб записати голосове повідомлення.';

  @override
  String get voiceMessageRecordingFailed =>
      'Запис не вдався. Спробуйте ще раз.';

  @override
  String get voiceMessageSendFailed =>
      'Не вдалося надіслати голосове повідомлення. Спробуйте ще раз.';

  @override
  String get voiceMessageRecordingHint =>
      'Говоріть зараз. Натисніть «Зупинити», коли закінчите — пізніше можна буде обрізати.';

  @override
  String get voiceMessageReviewHint =>
      'Перетягніть маркери, щоб обрізати, потім натисніть «Надіслати».';

  @override
  String get voiceMessageStop => 'Зупинити';

  @override
  String get voiceMessageStartRecording => 'Почати запис';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Відтворити';

  @override
  String get voiceMessagePause => 'Призупинити';

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

    return 'Виділений фрагмент має бути щонайменше $secondsStringс.';
  }

  @override
  String get chatAttachmentEditTitle => 'Редагувати вкладення';

  @override
  String get chatAttachmentFilenameLabel => 'Ім\'я файлу';

  @override
  String get chatAttachmentDescriptionLabel => 'Опис';

  @override
  String get chatAttachmentDescriptionHint =>
      'Необов\'язковий альтернативний текст';

  @override
  String get chatAttachmentSpoilerLabel => 'Позначити як спойлер';

  @override
  String get chatAttachmentRemove => 'Видалити вкладення';

  @override
  String get chatAttachmentDownload => 'Завантажити';

  @override
  String get chatAttachmentDownloadedToast => 'Saved to photos';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Couldn\'t download attachment';

  @override
  String get chatAttachmentExpiredTooltip => 'Вкладення застаріло';

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
  String get chatAttachmentSourceGallery => 'Галерея';

  @override
  String get chatAttachmentSourceCamera => 'Камера';

  @override
  String get chatAttachmentSourceBrowse => 'Переглянути файли';

  @override
  String get chatAttachmentPasteTooltip =>
      'Вставити зображення з буфера обміну';

  @override
  String get chatAttachmentSpoiler => 'Спойлер';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Показати спойлер';

  @override
  String get matureMediaRevealButton => 'Показати';

  @override
  String get matureMediaRevealHint => 'Натисніть, щоб показати';

  @override
  String get matureContentTitle => 'Контент для дорослих';

  @override
  String get matureCommunityTitle => 'Спільнота для дорослих';

  @override
  String get matureCategoryTitle => 'Категорія для дорослих';

  @override
  String get matureChannelTitle => 'Канал для дорослих';

  @override
  String get communityContentWarningTitle => 'Попередження про вміст спільноти';

  @override
  String get categoryContentWarningTitle => 'Попередження про вміст категорії';

  @override
  String get channelContentWarningTitle => 'Попередження про вміст каналу';

  @override
  String get defaultContentWarningBody => 'Це містить чутливий вміст.';

  @override
  String get matureCommunityBody =>
      'Ця спільнота позначена як така, що містить матеріали для дорослих, і може містити те, що може бути неприйнятним для деяких користувачів.';

  @override
  String get matureCategoryBody =>
      'Ця категорія позначена як така, що містить матеріали для дорослих, і може містити те, що може бути неприйнятним для деяких користувачів.';

  @override
  String get matureChannelBody =>
      'Цей канал позначений як такий, що містить матеріали для дорослих, і може містити те, що може бути неприйнятним для деяких користувачів.';

  @override
  String get matureVoiceChannelBody =>
      'Цей голосовий канал позначений як такий, що містить матеріали для дорослих, і може містити те, що може бути неприйнятним для деяких користувачів.';

  @override
  String get matureLinkChannelBody =>
      'Цей посилальний канал позначений як такий, що містить матеріали для дорослих, і може відкривати те, що може бути неприйнятним для деяких користувачів.';

  @override
  String get matureCommunityUnavailableBody =>
      'Ця спільнота для дорослих недоступна для вашого облікового запису.';

  @override
  String get matureCategoryUnavailableBody =>
      'Ця категорія для дорослих недоступна для вашого облікового запису.';

  @override
  String get matureChannelUnavailableBody =>
      'Цей канал для дорослих недоступний для вашого облікового запису.';

  @override
  String get matureContentProceedButton => 'Продовжити';

  @override
  String get matureContentUnderstandButton => 'Я розумію';

  @override
  String get matureContentOpenLinkButton => 'Відкрити посилання';

  @override
  String get sensitiveContentSectionTitle => 'Чутливий вміст';

  @override
  String get sensitiveContentSectionDescription =>
      'Керуйте тим, як медіа для дорослих або чутливий медіа фільтрується в різних контекстах';

  @override
  String get sensitiveContentFriendDmLabel => 'Прямі повідомлення від друзів';

  @override
  String get sensitiveContentNonFriendDmLabel => 'Прямі повідомлення від інших';

  @override
  String get sensitiveContentGuildLabel => 'Повідомлення в каналах спільноти';

  @override
  String get sensitiveContentFilterShow => 'Показати';

  @override
  String get sensitiveContentFilterBlur => 'Розмити';

  @override
  String get sensitiveContentFilterBlock => 'Заблокувати';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Розмивати медіа до завершення сканування безпеки';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Якщо ввімкнено, зображення та відео розмиваються до завершення сканування безпеки вмісту.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Цей параметр завжди ввімкнено для вашого облікового запису.';

  @override
  String get sensitiveContentResetButton => 'Скинути';

  @override
  String get sensitiveContentSaveButton => 'Зберегти';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файлів',
      one: '1 файлу',
    );
    return 'Завантаження $_temp0';
  }

  @override
  String get chatCancelUpload => 'Скасувати завантаження';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Термін дії до $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Термін дії з $start до $end';
  }

  @override
  String get connectionsTitle => 'Підключення';

  @override
  String connectionsDescription(String productName) {
    return 'Підключіть зовнішні облікові записи та домени до свого профілю $productName. Перевірені підключення відображатимуться у вашому профілі для інших.';
  }

  @override
  String get connectionsEmptyTitle => 'Ще немає підключень';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Підключіть свій обліковий запис Bluesky або підтвердьте володіння доменом, щоб відобразити їх у своєму профілі.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Підтвердьте володіння доменом, щоб відобразити його у своєму профілі.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Домен';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Додати підключення Bluesky';

  @override
  String get connectionsAddDomainAriaLabel => 'Додати підключення домену';

  @override
  String get connectionEdit => 'Редагувати';

  @override
  String get connectionRemove => 'Видалити';

  @override
  String get connectionVerifiedLabel => 'Це підключення було перевірено.';

  @override
  String get connectionUnverifiedLabel => 'Це підключення не було перевірено.';

  @override
  String get connectionAddTitle => 'Додати підключення';

  @override
  String get connectionTypeLabel => 'Тип підключення';

  @override
  String get connectionHandleLabel => 'Дескриптор';

  @override
  String get connectionDomainLabel => 'Домен';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'У вас уже є це підключення.';

  @override
  String get connectionConnectBluesky => 'Підключитися через Bluesky';

  @override
  String get connectionContinue => 'Продовжити';

  @override
  String get connectionVerifyTitle => 'Перевірити підключення';

  @override
  String get connectionVerifyInstructions =>
      'Використовуйте запис нижче, щоб підтвердити володіння доменом.';

  @override
  String get connectionDnsRecordTitle => 'Запис TXT DNS';

  @override
  String get connectionDnsHostLabel => 'Хост';

  @override
  String get connectionDnsValueLabel => 'Значення';

  @override
  String get connectionCopyHost => 'Копіювати хост';

  @override
  String get connectionCopyValue => 'Копіювати значення';

  @override
  String get connectionCopied => 'Скопійовано!';

  @override
  String get connectionTokenFileTitle => 'Надати файл токена';

  @override
  String get connectionTokenFileDescription =>
      'Завантажте **fluxer-verification** і помістіть його у папку **.well-known**, щоб ми могли перевірити домен.';

  @override
  String get connectionTokenFileDownload => 'Завантажити fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Файл містить токен верифікації, який ми отримаємо з **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Зберегти fluxer-verification';

  @override
  String get connectionVerifyButton => 'Перевірити';

  @override
  String get connectionBack => 'Назад';

  @override
  String get connectionEditTitle => 'Редагувати підключення';

  @override
  String get connectionEditDescription =>
      'Виберіть, хто може бачити це підключення у вашому профілі.';

  @override
  String get connectionVisibilityEveryone => 'Усі';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Дозволити всім бачити це підключення у вашому профілі';

  @override
  String get connectionVisibilityFriends => 'Друзі';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Дозволити друзям бачити це підключення';

  @override
  String get connectionVisibilityCommunityMembers => 'Учасники спільноти';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Дозволити учасникам спільнот, до яких ви належите, бачити це підключення';

  @override
  String get connectionRemoveTitle => 'Видалити підключення';

  @override
  String get connectionRemoveDescription =>
      'Ви впевнені, що хочете видалити це підключення? Цю дію не можна скасувати.';

  @override
  String get connectionRemoveConfirm => 'Видалити';

  @override
  String get connectionsLoadError => 'Не вдалося завантажити підключення';

  @override
  String get connectionsReorderError => 'Не вдалося оновити порядок';

  @override
  String get connectionInitiateFailed =>
      'Не вдалося розпочати перевірку. Спробуйте ще раз.';

  @override
  String get connectionVerifyFailed =>
      'Не вдалося перевірити. Перевірте запис DNS і спробуйте ще раз.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Не вдалося розпочати авторизацію Bluesky.';

  @override
  String get connectionUpdateFailed => 'Не вдалося оновити підключення';

  @override
  String get connectionRemoveFailed => 'Не вдалося видалити підключення';

  @override
  String get connectionTokenSavedToast => 'fluxer-verification збережено';

  @override
  String get connectionTokenSaveFailedToast => 'Не вдалося зберегти файл';

  @override
  String get connectionEnterHandle => 'Введіть дескриптор Bluesky.';

  @override
  String get connectionEnterDomain => 'Введіть домен.';

  @override
  String get lookAndFeelTitle => 'Вигляд і відчуття';

  @override
  String get lookAndFeelThemeSectionTitle => 'Тема';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Виберіть між темною, вугільною або світлою темою.';

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
  String get lookAndFeelThemeDark => 'Темна тема';

  @override
  String get lookAndFeelThemeCoal => 'Вугільна тема';

  @override
  String get lookAndFeelThemeLight => 'Світла тема';

  @override
  String get lookAndFeelThemeSystem => 'Системна тема';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Синхронізувати тему на всіх пристроях';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Якщо ввімкнено, зміни теми синхронізуватимуться на всіх ваших пристроях. Якщо вимкнено, цей пристрій використовуватиме власні налаштування теми.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Системна тема автоматично вимикає синхронізацію, щоб відстежувати ваші системні налаштування на цьому пристрої.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Не вдалося синхронізувати тему з вашим обліковим записом. Спробуйте ще раз.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Масштабування шрифту чату';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Налаштуйте розмір шрифту в області чату.';

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
  String get lookAndFeelInterfaceTitle => 'Інтерфейс';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Налаштуйте елементи та поведінку інтерфейсу.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Індикатори набору тексту в списку каналів';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Виберіть, як індикатори набору тексту відображатимуться в списку каналів, коли хтось набирає повідомлення.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Індикатор набору тексту + Аватари';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Показувати індикатор набору тексту з аватарами користувачів у списку каналів';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Лише індикатор набору тексту';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Показувати лише індикатор набору тексту без аватарів';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Приховано';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Не показувати індикатори набору тексту в списку каналів';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Показувати набір тексту в вибраному каналі';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Якщо вимкнено (за замовчуванням), індикатори набору тексту не відображатимуться в каналі, який ви зараз переглядаєте.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'загальний';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Підказки клавіатури';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Керуйте відображенням підказок комбінацій клавіш у спливаючих підказках.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Приховати підказки клавіатури у спливаючих підказках';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Якщо ввімкнено, ярлики комбінацій клавіш приховуються у спливаючих підказках.';

  @override
  String get lookAndFeelNekoTitle => 'Різне';

  @override
  String get lookAndFeelNekoDescription => 'Різні параметри інтерфейсу.';

  @override
  String get lookAndFeelShowNekoLabel => 'Показати Неко';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Якщо ввімкнено, Неко з\'являється біля поля введення чату.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Поведінка при вході в голосовий канал';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Керуйте тим, як ви приєднуєтеся до голосових каналів у спільнотах.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Вимагати подвійне клацання для входу в голосові канали';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Якщо ввімкнено, вам потрібно буде двічі клацнути на голосові канали, щоб приєднатися до них. Якщо вимкнено (за замовчуванням), одинарне клацання негайно приєднає до каналу.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Швидка бура лисиця стрибає через ледачого собаку.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Бічна панель спільноти';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Налаштуйте відображення прямих повідомлень на бічній панелі спільноти.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count спільнот тимчасово недоступні через несправність конденсатора потоку.',
      one:
          '1 спільнота тимчасово недоступна через несправність конденсатора потоку.',
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
  String get lookAndFeelCollapseDMsLabel =>
      'Згорнути прямі повідомлення в папку';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'Якщо ввімкнено, непрочитані прямі повідомлення на бічній панелі спільноти згортаються в папку на кнопці $productName. Клацніть кнопку $productName на сторінці прямих повідомлень, щоб розгорнути або згорнути папку.';
  }

  @override
  String get lookAndFeelChannelListSectionTitle => 'Список каналів';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Керуйте відображенням непрочитаних повідомлень для вимкнених каналів у списках каналів.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Показувати індикатор непрочитаних на вимкнених каналах';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Якщо ввімкнено, вимкнені канали показують блідий індикатор непрочитаних зліва. Згадки все одно з\'являтимуться незалежно від цього налаштування.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Зараз активно';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Керуйте тим, як \"Зараз активно\" відображається в додатку.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Показувати \"Зараз активно\" на головному екрані';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Показувати \"Зараз активно\" на головному екрані, щоб відображати друзів, активних у голосовому чаті. Ви побачите попередній перегляд, контекст каналу, хто вже там, і швидкий спосіб приєднатися.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Вибране';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Керуйте видимістю вибраного в усьому додатку.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Увімкнути вибране';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Якщо ввімкнено, ви можете додавати канали до вибраного, і вони з\'являтимуться в розділі \"Вибране\". Якщо вимкнено, усі елементи інтерфейсу, пов\'язані з вибраним (кнопки, пункти меню), будуть приховані. Ваші наявні вибрані будуть збережені.';

  @override
  String get favoritesTitle => 'Вибране';

  @override
  String get favoritesEmptyTitle => 'Вибраного ще немає';

  @override
  String get favoritesEmptyDescription =>
      'Позначайте канали зі списку чатів зірочкою, щоб вони зберігалися тут.';

  @override
  String get favoritesWelcomeTitle => 'Ласкаво просимо до обраного';

  @override
  String get favoritesWelcomeDescription =>
      'Ваш особистий простір для швидкого доступу до каналів, особистих повідомлень і груп, які вам подобаються. Натисніть зірочку біля будь-якого каналу, щоб додати його сюди.';

  @override
  String get favoritesWelcomeTip => 'Не подобається? Вимкніть будь-коли.';

  @override
  String get favoritesDisableButton => 'Вимкнути обране';

  @override
  String get favoritesAddedToast => 'Додано до обраного';

  @override
  String get favoritesRemovedToast => 'Видалено з обраного';

  @override
  String get favoritesHiddenToast => 'Обране приховано';

  @override
  String get favoritesMute => 'Вимкнути сповіщення для обраного';

  @override
  String get favoritesUnmute => 'Увімкнути сповіщення для обраного';

  @override
  String get favoritesHeaderMenu => 'Меню обраного';

  @override
  String get favoritesCreateCategory => 'Створити категорію';

  @override
  String get favoritesCategoryNameLabel => 'Назва категорії';

  @override
  String get favoritesHideMutedChannels => 'Приховувати вимкнені канали';

  @override
  String get favoritesShowMutedChannels => 'Показувати вимкнені канали';

  @override
  String get favoritesSetNickname => 'Встановити псевдонім';

  @override
  String get favoritesNicknameLabel => 'Псевдонім';

  @override
  String get favoritesSaveNickname => 'Зберегти псевдонім';

  @override
  String get favoritesMoveToCategory => 'Перемістити до категорії';

  @override
  String get favoritesUncategorized => 'Без категорії';

  @override
  String get favoritesOtherCategory => 'Інше';

  @override
  String get favoritesRemoveFromFavorites => 'Видалити з обраного';

  @override
  String get favoritesAddToFavorites => 'Додати до обраного';

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
  String get favoritesHideConfirmTitle => 'Приховати обране';

  @override
  String get favoritesHideConfirmDescription =>
      'Це приховає всі елементи інтерфейсу, пов\'язані з обраним, включно з кнопками та пунктами меню. Ваші наявні обрані будуть збережені, і їх можна буде знову ввімкнути будь-коли в Налаштування > Додатково > Зовнішній вигляд.';

  @override
  String get favoritesDirectMessageSubtitle => 'Особисте повідомлення';

  @override
  String get messagesMediaDisplayGroupTitle => 'Відображення';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Керуйте тим, як відображаються повідомлення, медіафайли та інший вміст.';

  @override
  String get messagesMediaMediaGroupTitle => 'Медіа';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Налаштуйте розмір медіафайлів і кнопки.';

  @override
  String get messagesMediaInputGroupTitle => 'Введення';

  @override
  String get messagesMediaInputGroupDescription =>
      'Налаштуйте параметри введення повідомлень.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Бічна панель';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Налаштуйте відображення бічної панелі спільноти.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Приховувати вимкнені канали за замовчуванням';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Автоматично приховувати вимкнені канали на бічній панелі під час приєднання до нових спільнот';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Приховувати вимкнені канали за замовчуванням?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'У нових спільнотах, до яких ви приєднаєтеся, вимкнені канали будуть автоматично приховані. Бажаєте також застосувати це налаштування до всіх наявних спільнот?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Припинити приховувати вимкнені канали за замовчуванням?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'У нових спільнотах, до яких ви приєднаєтеся, вимкнені канали більше не будуть автоматично приховані. Бажаєте також показувати вимкнені канали у всіх наявних спільнотах?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Застосувати до всіх спільнот';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Показати у всіх спільнотах';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Лише нові спільноти';

  @override
  String get messagesMediaDisplaySectionTitle => 'Відображення медіа';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Керуйте тим, як відображаються зображення, відео та інші медіафайли. Усі медіафайли змінюють розмір і конвертуються. Надзвичайно великі файли, які неможливо стиснути до попереднього перегляду, не будуть вбудовані незалежно від цих налаштувань.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Під час публікації як посилання в чаті';

  @override
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'Під час завантаження безпосередньо до $productName';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle =>
      'Попередній перегляд посилань';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Керуйте тим, як попередньо переглядаються веб-посилання в чаті';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Показувати вбудовані елементи та попередній перегляд веб-посилань';

  @override
  String get messagesMediaReactionsSectionTitle => 'Реакції';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Налаштуйте реакції емодзі на повідомлення';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Показувати реакції емодзі на повідомлення';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Прихований вміст';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Керуйте відображенням прихованого вмісту';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Показувати прихований вміст';

  @override
  String get messagesMediaSpoilersOnClickName => 'За натисканням';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Показувати прихований вміст після натискання';

  @override
  String get messagesMediaSpoilersIfModeratorName => 'У каналах, які я модерую';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Завжди показувати прихований вміст у каналах, де у вас є дозвіл «Керувати повідомленнями»';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Завжди';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Завжди показувати прихований вміст';

  @override
  String get messagesMediaSizeSectionTitle => 'Налаштування розміру медіа';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Налаштуйте максимальний розмір для вбудованих та прикріплених медіа. Менші розміри займають менше місця на екрані, тоді як більші показують більше деталей.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Медіа з посилань (вбудовані)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Завантажені вкладення';

  @override
  String get messagesMediaSizeCompactName => 'Компактний (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Менший розмір медіа';

  @override
  String get messagesMediaSizeComfortableName => 'Зручний (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Більший розмір медіа з більшою деталізацією';

  @override
  String get messagesMediaGifsSectionTitle => 'Поведінка GIF';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Керуйте тим, як GIF-файли вставляються в чат';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Автоматично надсилати GIF-файли після вибору';

  @override
  String get messagesMediaCameraUploadsSectionTitle => 'Camera uploads';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Choose whether photos and videos taken with the in-app camera are kept on your device';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel => 'Save to device';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Автодоповнення виразів (автодоповнення двокрапкою)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Керуйте тим, що з\'являється в автодоповненні виразів під час введення двокрапки. Налаштуйте, які пропозиції показувати, відповідно до ваших уподобань.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Показувати стандартні емодзі в автодоповненні виразів';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Показувати власні емодзі в автодоповненні виразів';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Показувати стікери в автодоповненні виразів';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Показувати збережені медіа в автодоповненні виразів';

  @override
  String get messagesMediaEditingSectionTitle => 'Редагування повідомлень';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Керуйте тим, що відбувається з чернеткою редагування під час скасування.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Зберігати чернетку редагування під час скасування';

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
      'Попередній перегляд повідомлень у прямих повідомленнях';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Керуйте тим, коли показувати попередній перегляд повідомлень у списку прямих повідомлень.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Режим попереднього перегляду повідомлень у прямих повідомленнях';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Усі повідомлення';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Показувати попередній перегляд повідомлень для всіх діалогів у прямих повідомленнях';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Лише непрочитані прямі повідомлення';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Показувати попередній перегляд повідомлень лише для прямих повідомлень з непрочитаними повідомленнями';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Немає';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Не показувати попередній перегляд повідомлень у списку прямих повідомлень';

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
  String get dmListSentAnAttachment => 'Надіслав вкладення';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username закріпив повідомлення в цьому каналі.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username додав $userName до групи.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username додав когось до групи.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username покинув групу.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username видалив $userName з групи.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username видалив когось із групи.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username змінив назву каналу на $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username змінив назву каналу.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username змінив значок каналу.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username розпочав дзвінок.';
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
      'Підтвердження голосового з\'єднання';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Ви вже підключені до цього голосового каналу з $count інших пристроїв. Що ви хочете зробити?',
      one:
          'Ви вже підключені до цього голосового каналу з 1 іншого пристрою. Що ви хочете зробити?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Переключитися на цей пристрій';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Просто приєднатися (зберегти інші з\'єднання)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Нічого не робити, я не хочу приєднуватися';

  @override
  String get voiceJoinFailedTitle => 'Couldn\'t Join Voice';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Couldn\'t disconnect your other devices. Try again in a moment.';

  @override
  String get voiceChannelEmptyDescription =>
      'Це голосовий канал. Підключіться, щоб почати розмову!';

  @override
  String get voiceChannelJoin => 'Приєднатися до голосового каналу';

  @override
  String get voiceCallJoin => 'Join call';

  @override
  String get voiceChannelJoinConnect => 'Підключитися до голосу';

  @override
  String get voiceChannelNoConnectPermission =>
      'У вас немає дозволу на приєднання до цього голосового каналу';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Мікрофон, камера та вміст спільного доступу до екрана наскрізно зашифровані.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Мікрофон, камера та вміст спільного доступу до екрана наскрізно зашифровані.';

  @override
  String get voiceChannelE2eeBroken =>
      'Наскрізне шифрування недоступне, оскільки в цьому голосовому каналі є учасник, який його не підтримує.';

  @override
  String get voiceCallE2eeBroken =>
      'Наскрізне шифрування недоступне, оскільки в цьому дзвінку є учасник, який його не підтримує.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Цей клієнт потрібно оновити перед приєднанням до цього зашифрованого дзвінка.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Не вдалося запустити ваш мікрофон. Ви все ще в дзвінку.';

  @override
  String get voiceChannelStatusConnecting => 'Підключення…';

  @override
  String get voiceChannelStatusConnected => 'Підключено';

  @override
  String get voiceChannelStatusError => 'Помилка';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Мобільний пристрій';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Настільний пристрій';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Вимкнено спільнотою';

  @override
  String get voiceParticipantTooltipMuted => 'Вимкнено';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Вимкнено спільнотою (звук)';

  @override
  String get voiceParticipantTooltipDeafened => 'Вимкнено (звук)';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'З\'єднання: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count учасників',
      one: '1 учасник',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Залишити';

  @override
  String get voiceControlMute => 'Вимкнути мікрофон';

  @override
  String get voiceControlUnmute => 'Увімкнути мікрофон';

  @override
  String get voiceControlDeafen => 'Вимкнути звук';

  @override
  String get voiceControlUndeafen => 'Увімкнути звук';

  @override
  String get voiceControlVideo => 'Відео';

  @override
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'Спільний доступ до екрана';

  @override
  String get voiceScreenShareNotificationText => 'Демонструється ваш екран.';

  @override
  String get voiceControlMore => 'Більше';

  @override
  String get voiceControlDisconnect => 'Відключитися';

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
  String get voiceControlChat => 'Чат';

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
  String get voiceTextChatShow => 'Показати чат';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# непрочитаними повідомленнями',
      one: '# непрочитаним повідомленням',
    );
    return 'Показати чат з $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Для відео потрібен дозвіл на використання камери.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Не вдалося розпочати демонстрацію екрана. Спробуйте ще раз.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Дозвіл на демонстрацію екрана було відхилено.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Демонстрація екрана недоступна на цьому пристрої.';

  @override
  String get voiceWatchStream => 'Дивитися трансляцію';

  @override
  String get voiceStopWatching => 'Припинити перегляд';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Припинити перегляд поточного потоку';

  @override
  String get voiceOwnScreenShareTitle => 'Ви транслюєте';

  @override
  String get voiceOwnScreenShareSubtitle => 'Ваш потік активний для учасників.';

  @override
  String get voiceLiveBadge => 'LIVE';

  @override
  String get dmVoiceViewCall => 'Переглянути дзвінок';

  @override
  String get dmVoiceCallFullScreen => 'На весь екран';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Відкрити дзвінок на весь екран';

  @override
  String get dmVoiceStripStatusConnecting => 'З\'єднання...';

  @override
  String get dmVoiceStripStatusInCall => 'У дзвінку';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Голосовий дзвінок';

  @override
  String get dmVoiceCallBarConnecting => 'З\'єднання...';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Прямий дзвінок';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Груповий дзвінок';

  @override
  String get dmVoiceCallBarIssueFallback => 'Проблема з голосом';

  @override
  String get dmVoiceFullscreenTitle => 'Голос';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Голос підключено';

  @override
  String get notificationsPageTitle => 'Сповіщення';

  @override
  String get notificationsFilterUnreads => 'Непрочитані';

  @override
  String get notificationsFilterMentions => 'Згадки';

  @override
  String get notificationsBookmarksTooltip => 'Закладки';

  @override
  String get notificationsMentionFilterTooltip => 'Фільтрувати згадки';

  @override
  String get notificationsMentionFiltersTitle => 'Фільтри згадок';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Включити згадки @everyone та @here';

  @override
  String get notificationsMentionIncludeRoles => 'Включити згадки ролей';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Включити всі згадки спільноти';

  @override
  String get notificationsNoUnreadTitle => 'Немає непрочитаних повідомлень';

  @override
  String get notificationsNoUnreadBody => 'Ви все прочитали.';

  @override
  String get notificationsNoMentionsTitle => 'Немає останніх згадок';

  @override
  String get notificationsNoMentionsBody =>
      'Усі згадки вас тут з\'являтимуться протягом 7 днів.';

  @override
  String get notificationsMentionsEndTitle => 'Ви досягли кінця';

  @override
  String get notificationsMentionsEndBody =>
      'Ви переглянули всі свої останні згадки. Не хвилюйтеся, незабаром тут з\'являться нові.';

  @override
  String get notificationsJump => 'Перейти';

  @override
  String get notificationsRemoveMentionTooltip => 'Видалити згадку';

  @override
  String get notificationsViewAllUnread => 'Переглянути всі непрочитані';

  @override
  String get notificationsMarkAsRead => 'Позначити як прочитане';

  @override
  String get notificationsExpand => 'Розгорнути';

  @override
  String get notificationsCollapse => 'Згорнути';

  @override
  String get notificationsMessageUnavailable =>
      'Не вдалося завантажити це повідомлення.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining символів залишилося';
  }

  @override
  String get characterCounterTooLong => 'Повідомлення занадто довге';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining символів залишилося. Отримайте $productName, щоб писати до $premiumMaxLength символів.';
  }

  @override
  String get chatMessageFailedToSend => 'Не вдалося надіслати повідомлення';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Ваше повідомлення не могло бути доставлено. Зазвичай це відбувається тому, що ви не маєте спільної спільноти з одержувачем або одержувач приймає прямі повідомлення лише від друзів. Можливо, вам також доведеться налаштувати власні параметри конфіденційності прямих повідомлень у розділі $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Ваше повідомлення не могло бути доставлено. Вам потрібно підтвердити свій обліковий запис, щоб надсилати прямі повідомлення.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Ваше повідомлення не могло бути доставлено. Вам потрібно підтвердити свій обліковий запис, щоб надсилати повідомлення.';

  @override
  String get chatSendFailureContentBlocked =>
      'Ваше повідомлення не могло бути доставлено, оскільки воно було позначено нашими системами безпеки. Якщо ви вважаєте, що це помилка, зв\'яжіться з підтримкою.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Ваше повідомлення не могло бути доставлено, оскільки воно містить недоречні емодзі або стікери, які не дозволені в цьому контексті.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'Це повідомлення бачите тільки ви.';

  @override
  String get chatClientSystemDismiss => 'Закрити';

  @override
  String get privacyDashboardCommunicationSection => 'Спілкування';

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
  String get chatMessageDeleteFailed => 'Не вдалося видалити повідомлення';

  @override
  String get chatMessageAddReaction => 'Додати реакцію';

  @override
  String get chatMessageEdit => 'Редагувати повідомлення';

  @override
  String get chatMessageReply => 'Відповісти';

  @override
  String get chatMessageForward => 'Переслати';

  @override
  String get forwardMessageTitle => 'Переслати повідомлення';

  @override
  String get forwardSearchHint => 'Шукати канали або приватні повідомлення';

  @override
  String get forwardDirectMessagesSection => 'Приватні повідомлення';

  @override
  String get forwardCommentHint => 'Додати коментар (необов’язково)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Надіслати ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Канали не знайдено';

  @override
  String get forwardSuccessToast => 'Повідомлення переслано';

  @override
  String get forwardFailed => 'Не вдалося переслати повідомлення';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Коментарі недоступні, оскільки в вибраному каналі увімкнено повільний режим.';

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
      'Ви не можете надсилати повідомлення тут';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Ви не можете вставляти посилання тут';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Ви не можете прикріплювати файли тут';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Надсилання повідомлень вимкнено в цій спільноті';

  @override
  String get forwardDestinationTimedOut =>
      'Ви перебуваєте в режимі очікування в цій спільноті';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Повільний режим – зачекайте $remaining';
  }

  @override
  String get chatMessageCopyText => 'Скопіювати повідомлення';

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
  String get chatMessagePin => 'Закріпити повідомлення';

  @override
  String get chatMessageUnpin => 'Відкріпити повідомлення';

  @override
  String get chatMessageUnpinIt => 'Відкріпити';

  @override
  String get chatMessageBookmark => 'Додати до закладок';

  @override
  String get chatMessageRemoveBookmark => 'Видалити закладку';

  @override
  String get chatMessageMarkAsUnread => 'Позначити як непрочитане';

  @override
  String get chatMessageCopyMessageLink =>
      'Скопіювати посилання на повідомлення';

  @override
  String get chatMessageCopyMessageId => 'Скопіювати ID повідомлення';

  @override
  String get chatMessageViewReactions => 'Переглянути реакції';

  @override
  String get chatMessageRemoveAllReactions => 'Видалити всі реакції';

  @override
  String get chatMessageDebug => 'Налагодження повідомлення';

  @override
  String get chatMessageDebugSheetTitle => 'Налагодження повідомлення';

  @override
  String get chatMessageDebugCopyJson => 'Скопіювати JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'JSON повідомлення скопійовано в буфер обміну';

  @override
  String get chatReactionsSheetTitle => 'Реакції';

  @override
  String get chatReactionsSheetEmpty => 'Ще ніхто не реагував.';

  @override
  String get chatReactionAddFailed => 'Failed to add reaction';

  @override
  String get chatReactionRemoveFailed => 'Failed to remove reaction';

  @override
  String get chatMessageReport => 'Повідомити про повідомлення';

  @override
  String get iarReportMessageTitle => 'Повідомити про повідомлення';

  @override
  String get iarThisUserFallback => 'цього користувача';

  @override
  String get iarModalDescription =>
      'Повідомте про порушення правил або знайдіть інструменти для керування контактами та налаштуваннями.';

  @override
  String get iarPathStepAriaLabel => 'Що вам потрібно?';

  @override
  String get iarCategoryStepTitle => 'Яке правило було порушено?';

  @override
  String get iarReasonStepTitle => 'Яке правило було порушено?';

  @override
  String get iarReasonSelectHint => 'Виберіть причину';

  @override
  String get iarPickAnOptionToast => 'Виберіть опцію, щоб продовжити.';

  @override
  String get iarPickARuleToast => 'Виберіть порушене правило.';

  @override
  String get iarPathPlatform => 'Повідомити про порушення платформних правил';

  @override
  String get iarPathCommunity => 'Повідомити модераторам цієї спільноти';

  @override
  String get iarPathPreferenceMessage => 'Мені не подобається цей контент';

  @override
  String get iarCategoryTargetedHarmLabel => 'Погрози, домагання або шкода';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Булінг, погрози, мова ворожнечі, насильство, рейди або контент, що заохочує самопошкодження.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Безпека дітей або контент для дорослих';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Діти в небезпеці, контент для дорослих не на місці або небажана поведінка.';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'Конфіденційність або видавання себе за іншого';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Публікація особистої інформації, переслідування, видавання себе за іншу особу або недоречний профіль.';

  @override
  String get iarCategoryDeceptionLabel =>
      'Шахрайство, шкідливе ПЗ або дезінформація';

  @override
  String get iarCategoryDeceptionDescription =>
      'Фішинг, шахрайство, шкідливі посилання або неправдиві заяви, які можуть завдати реальної шкоди.';

  @override
  String get iarCategoryIllegalOtherLabel =>
      'Незаконна діяльність або щось інше';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Незаконний продаж, сприяння злочинній діяльності або явне порушення правил, яке не підпадає під вищезазначені категорії.';

  @override
  String get iarReasonHarassmentLabel => 'Домагання або погрози';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Булінг, повторні небажані контакти, переслідування або цілеспрямована образа.';

  @override
  String get iarReasonHateLabel => 'Мова ворожнечі';

  @override
  String get iarReasonHateMessageDescription =>
      'Образи, дегуманізуюча мова або напади на захищені групи.';

  @override
  String get iarReasonViolenceLabel => 'Насильство або погрози насильства';

  @override
  String get iarReasonViolenceDescription =>
      'Реальні погрози, графічне насильство або прославлення насильства.';

  @override
  String get iarReasonMatureContentLabel =>
      'Контент для дорослих або домагання';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Небажана поведінка або контент для дорослих не на місці.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Безпека дітей або експлуатація неповнолітніх';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Контент, пов\'язаний із грумінгом або експлуатацією дітей.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Шкідлива дезінформація';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Неправдиві заяви, які можуть завдати реальної шкоди.';

  @override
  String get iarReasonSpamLabel => 'Спам, шахрайство або фішинг';

  @override
  String get iarReasonSpamMessageDescription =>
      'Масовий спам, шахрайство, підроблені роздачі призів або зловживання обліковим записом.';

  @override
  String get iarReasonMalwareLabel => 'Шкідливе ПЗ або небезпечні посилання';

  @override
  String get iarReasonMalwareDescription =>
      'Шкідливе ПЗ, крадіжка облікових даних або небезпечні файли.';

  @override
  String get iarReasonPrivacyLabel => 'Порушення конфіденційності';

  @override
  String get iarReasonPrivacyDescription =>
      'Публікація особистої інформації, розкриття приватних даних або переслідування.';

  @override
  String get iarReasonImpersonationLabel =>
      'Видавання себе за іншого або обманний медіаконтент';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Видавання себе за іншу особу, включно з обманним контентом, згенерованим ШІ.';

  @override
  String get iarReasonIllegalLabel => 'Незаконна діяльність';

  @override
  String get iarReasonIllegalDescription =>
      'Незаконний продаж, сприяння злочинній діяльності або протиправні дії.';

  @override
  String get iarReasonSelfHarmLabel => 'Самопошкодження або суїцид';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Пропаганда або інструкції, що заохочують самопошкодження або розлади харчової поведінки.';

  @override
  String get iarReasonOtherLabel => 'Інше явне порушення правил';

  @override
  String iarReasonOtherDescription(String productName) {
    return 'Використовуйте лише якщо це явно порушує правила $productName і не підпадає під вищезазначені категорії.';
  }

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Якщо залучена неповнолітня особа, натомість використовуйте \"$childSafetyReason\".';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Якщо це стосується CSAM або експлуатації неповнолітніх, надішліть це негайно і не поширюйте матеріал повторно.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Якщо хтось може перебувати в безпосередній небезпеці, зв\'яжіться з місцевими екстреними службами, якщо це безпечно для вас.';

  @override
  String get iarSafetyNoteViolence =>
      'Якщо це реальна неминуча загроза, також зв\'яжіться з місцевими екстреними службами.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Якщо це неминуча терористична загроза, також зв\'яжіться з місцевими екстреними службами.';

  @override
  String get iarActionBlockUserTitle => 'Заблокувати цього користувача';

  @override
  String get iarActionBlockUserDescription =>
      'Припинити надсилання повідомлень і запитів на дружбу.';

  @override
  String get iarActionBlockUserButton => 'Заблокувати';

  @override
  String get iarActionCopyMessageLinkTitle =>
      'Скопіювати посилання на повідомлення';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Надіслати модераторам спільноти.';

  @override
  String get iarActionCopyMessageLinkButton => 'Скопіювати';

  @override
  String get iarActionCloseDmTitle => 'Закрити цей приватний чат';

  @override
  String get iarActionCloseDmDescription =>
      'Не блокує. Можна відкрити знову пізніше.';

  @override
  String get iarActionCloseDmButton => 'Закрити приватне повідомлення';

  @override
  String get iarActionLeaveCommunityTitle => 'Покинути спільноту';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Припинити бачити її контент та учасників.';

  @override
  String get iarActionLeaveCommunityButton => 'Покинути';

  @override
  String get iarActionDmSettingsTitle =>
      'Налаштування приватних повідомлень і запитів у друзі';

  @override
  String get iarActionDmSettingsDescription =>
      'Змінити, хто може зв\'язуватися з вами.';

  @override
  String get iarActionCallSettingsTitle =>
      'Налаштування дзвінків і групових чатів';

  @override
  String get iarActionCallSettingsDescription =>
      'Змінити, хто може вам дзвонити або додавати вас.';

  @override
  String get iarActionOpenButton => 'Відкрити';

  @override
  String get iarActionDeleteMessageTitle => 'Видалити це повідомлення';

  @override
  String get iarActionDeleteMessageDescription =>
      'Видалити його з каналу для всіх.';

  @override
  String get iarActionDeleteMessageButton => 'Видалити';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Видалено';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Це повідомлення вже було видалено.';

  @override
  String get iarActionBanUserTitle => 'Заблокувати цього користувача';

  @override
  String get iarActionBanUserDescription =>
      'Відкрити діалог блокування для цієї спільноти.';

  @override
  String get iarActionBanUserButton => 'Заблокувати';

  @override
  String get iarActionBanUserBannedButton => 'Заблоковано';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Цей користувач вже заблокований у спільноті.';

  @override
  String get iarCloseDmConfirmTitle => 'Закрити приватне повідомлення';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Закрити ваше поточне приватне повідомлення з $name. Це не заблокує його; ви зможете відкрити його пізніше.';
  }

  @override
  String get iarSuccessTitle => 'Звіт надіслано';

  @override
  String get iarSuccessBody =>
      'Наша команда безпеки розглядає його. Ми надішлемо вам приватне повідомлення та електронний лист, щойно приймемо рішення.';

  @override
  String get iarAlreadyReportedTitle => 'Вже надіслано звіт';

  @override
  String get iarAlreadyReportedBody =>
      'Ви вже надіслали звіт щодо цього повідомлення. Наша команда безпеки розглядає його.';

  @override
  String get iarBackButton => 'Назад';

  @override
  String get iarContinueButton => 'Далі';

  @override
  String get iarSendReportButton => 'Надіслати звіт';

  @override
  String get iarDoneButton => 'Готово';

  @override
  String get iarCouldntSendToast =>
      'Не вдалося надіслати звіт. Спробуйте ще раз.';

  @override
  String get iarRateLimitedToast =>
      'Ви надсилаєте звіти занадто швидко. Зачекайте хвилинку та спробуйте ще раз.';

  @override
  String get iarReportSentToast =>
      'Звіт надіслано. Наша команда безпеки розгляне його.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Заблокувати $name? Він не зможе надсилати вам повідомлення або запити в друзі. Ви зможете розблокувати його пізніше.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Не вдалося заблокувати цього користувача. Спробуйте ще раз.';

  @override
  String get iarCloseDmSuccessToast => 'Приватне повідомлення закрито.';

  @override
  String get iarCloseDmFailedToast =>
      'Не вдалося закрити це приватне повідомлення. Спробуйте ще раз.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Не вдалося покинути цю спільноту. Спробуйте ще раз.';

  @override
  String get chatMessageSuppressEmbeds => 'Приховати вбудовування';

  @override
  String get chatMessageUnsuppressEmbeds => 'Показати вбудовування';

  @override
  String get chatMessageDelete => 'Видалити повідомлення';

  @override
  String get chatMessageDeleteConfirmTitle => 'Видалити повідомлення';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Ви впевнені, що хочете видалити це повідомлення?';

  @override
  String get chatMessageDeleteAttachment => 'Delete Attachment';

  @override
  String get chatMessageEditAttachmentAltText => 'Edit Alt Text';

  @override
  String get chatMessageMore => 'Більше';

  @override
  String get chatEditingMessage => 'Редагування повідомлення';

  @override
  String get chatReplyOriginalDeleted =>
      'Оригінальне повідомлення було видалено';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Не вдалося завантажити оригінальне повідомлення';

  @override
  String get chatReplyAttachedMedia =>
      'Повідомлення містить вкладені медіафайли';

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
  String get chatMessagesLoadError => 'Не вдалося завантажити повідомлення.';

  @override
  String get chatReplyMentionOverrideTitle => 'Ігнорувати налаштування згадок?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return 'Автор $authorNickname віддає перевагу згадкам у відповідях. Надіслати без згадки все одно?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname надає перевагу відповідям без згадки @. Надіслати зі згадкою все одно?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ігнорувати налаштування';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Натисніть, щоб вимкнути сповіщення користувача, якому ви відповідаєте.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Натисніть, щоб увімкнути сповіщення користувача, якому ви відповідаєте.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Згадати користувача, якому відповідають';

  @override
  String get chatReplyMentionOn => 'Увімкнено';

  @override
  String get chatReplyMentionOff => 'Вимкнено';

  @override
  String get chatReplyCancel => 'Скасувати відповідь';

  @override
  String get chatEditMessageHint => 'Редагувати повідомлення';

  @override
  String get chatEditNoChanges => 'Змін для збереження немає';

  @override
  String get chatChannelNotReady =>
      'Цей канал ще не готовий. Спробуйте ще раз за мить.';

  @override
  String get chatMessageEdited => '(ред.)';

  @override
  String get chatMessageSilent =>
      'Це було повідомлення @silent. \"@silent\" — це команда, її не слід перекладати.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Сьогодні о $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Учора о $time';
  }

  @override
  String get mediaViewerImagePreview => 'Попередній перегляд зображення';

  @override
  String get mediaViewerClose => 'Закрити переглядач медіафайлів';

  @override
  String get mediaViewerOpenInBrowser => 'Відкрити в браузері';

  @override
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

  @override
  String get mediaViewerForward => 'Переслати';

  @override
  String get mediaViewerZoomIn => 'Збільшити';

  @override
  String get mediaViewerZoomOut => 'Зменшити';

  @override
  String get mediaViewerPreviousAttachment => 'Попередній вкладений файл';

  @override
  String get mediaViewerNextAttachment => 'Наступний вкладений файл';

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
      'Перемкнути елементи керування відео';

  @override
  String get chatAttachmentVideoMute => 'Вимкнути звук відео';

  @override
  String get chatAttachmentVideoUnmute => 'Увімкнути звук відео';

  @override
  String get chatAttachmentVideoPlay => 'Відтворити відео';

  @override
  String get chatAttachmentVideoPause => 'Призупинити відео';

  @override
  String get chatAttachmentVideoProgress => 'Прогрес відео';

  @override
  String get chatVideoPlaybackFailed => 'Не вдалося відтворити це відео.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Сповістити користувачів із цією роллю, які мають дозвіл переглядати цей канал.';

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
  String get addGuildModalTitle => 'Додати спільноту';

  @override
  String get addGuildModalLandingDescription =>
      'Створіть нову спільноту або приєднайтеся до існуючої.';

  @override
  String get addGuildCreateCommunity => 'Створити спільноту';

  @override
  String get addGuildJoinCommunity => 'Приєднатися до спільноти';

  @override
  String get addGuildImportDiscordTemplate => 'Імпортувати шаблон Discord';

  @override
  String get addGuildJoinTitle => 'Приєднатися до спільноти';

  @override
  String get addGuildJoinDescription =>
      'Введіть посилання-запрошення, щоб приєднатися до спільноти.';

  @override
  String get addGuildInviteLinkLabel => 'Посилання-запрошення';

  @override
  String get addGuildJoinSubmit => 'Приєднатися до спільноти';

  @override
  String get addGuildInviteInvalid =>
      'Це запрошення недійсне або термін його дії закінчився.';

  @override
  String get addGuildJoinFailed =>
      'Не вдалося приєднатися до спільноти. Спробуйте ще раз.';

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
  String get addGuildPackInstalled => 'Пакет успішно встановлено.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Видалити всі реакції';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Ви впевнені, що хочете видалити всі реакції з цього повідомлення?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Відкріпити повідомлення';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Відправити це закріплення назад у минуле?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username закріпив $messageLink у цьому каналі. Переглянути $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'повідомлення';

  @override
  String get systemPinMessageAllPinsLink => 'усі закріплені повідомлення';

  @override
  String get channelPinsEmptyTitle => 'Немає закріплених повідомлень';

  @override
  String get channelPinsEmptyDescription =>
      'Закріплені повідомлення з\'являтимуться тут.';

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
  String get personalNotesTitle => 'Особисті нотатки';

  @override
  String get personalNotesSubtitle =>
      'Ваш приватний простір для думок і нагадувань';

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
    return 'Ласкаво просимо до $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'Спочатку нічого не було. Потім з\'явився $channelName. І це було добре.';
  }

  @override
  String get personalNotesComposerHint => 'Напишіть собі';

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
  String get personalNotesPrivateSpace => 'Ваш приватний простір';

  @override
  String get purgePersonalNotes => 'Видалити особисті нотатки';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Це назавжди видалить кожне повідомлення та вкладення у ваших особистих нотатках. Це неможливо скасувати.';

  @override
  String get purgePersonalNotesConfirmButton => 'Видалити';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Видалено $count повідомлень з особистих нотаток';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Особисті нотатки вже були порожні';

  @override
  String get purgePersonalNotesFailed => 'Не вдалося очистити особисті нотатки';

  @override
  String get userSettingsGroupYourAccount => 'ВАШ ОБЛІКОВИЙ ЗАПИС';

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
  String get userSettingsNavProfile => 'Профіль';

  @override
  String get userSettingsNavSecurityLogin => 'Безпека та вхід';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Подарунки та коди';

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
  String get userSettingsNavPrivacyDashboard => 'Панель конфіденційності';

  @override
  String get userSettingsNavAuthorizedApps => 'Авторизовані програми';

  @override
  String get userSettingsNavBlockedUsers => 'Заблоковані користувачі';

  @override
  String get userSettingsNavLinkedDevices => 'Підключені пристрої';

  @override
  String get userSettingsNavConnections => 'Підключення';

  @override
  String get userSettingsNavLookAndFeel => 'Вигляд';

  @override
  String get userSettingsNavAccessibility => 'Доступність';

  @override
  String get userSettingsNavChat => 'Повідомлення та медіа';

  @override
  String get userSettingsNavAudioAndVideo => 'Аудіо та відео';

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
  String get userSettingsNavLanguageAndTime => 'Мова та час';

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
  String get userSettingsNavAdvanced => 'Додатково';

  @override
  String get advancedPerformanceReportingTitle => 'Звіти про продуктивність';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'Допоможіть покращити $productName, надаючи анонімні дані про збої та продуктивність.';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'Надсилати звіти про збої та продуктивність';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'Усі надані дані є анонімними та надсилаються лише на власний моніторинговий сервіс $productName — сторонні постачальники не використовуються.';
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
  String get userSettingsNavApplications => 'Програми';

  @override
  String get userSettingsNavAppLogs => 'Журнали програми';

  @override
  String get userSettingsNavDeveloperTools => 'Інструменти розробника';

  @override
  String get userSettingsNavLimitsConfig => 'Конфігурація лімітів';

  @override
  String get userSettingsNavFeatureFlags => 'Прапори функцій';

  @override
  String get userSettingsNavWhatsNew => 'Що нового';

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
  String get userSettingsNavLogOut => 'Вийти';

  @override
  String get quickSwitcherTabSearch => 'Пошук';

  @override
  String get quickSwitcherTabFriends => 'Друзі';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Пошук каналів, людей або спільнот';

  @override
  String get quickSwitcherSearchFriends => 'Пошук друзів';

  @override
  String get quickSwitcherNoMatchesFound => 'Збігів не знайдено';

  @override
  String get quickSwitcherEmptyHint =>
      'Спробуйте інше ім\'я або використовуйте префікси @ / # / ! / * для фільтрації результатів.';

  @override
  String get quickSwitcherSectionPeople => 'Люди';

  @override
  String get quickSwitcherSectionGroupMessages => 'Групові повідомлення';

  @override
  String get quickSwitcherSectionTextChannels => 'Текстові канали';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Голосові канали';

  @override
  String get quickSwitcherSectionCommunities => 'Спільноти';

  @override
  String get quickSwitcherSectionSettings => 'Налаштування';

  @override
  String get quickSwitcherHomeLabel => 'Головна';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Особисті повідомлення';

  @override
  String get quickSwitcherFavoritesLabel => 'Вибране';

  @override
  String get quickSwitcherUserSettingsLabel => 'Налаштування користувача';

  @override
  String get quickSwitcherNotificationsLabel => 'Сповіщення';

  @override
  String get quickSwitcherBookmarksLabel => 'Закладки';

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
  String get quickSwitcherMentionsLabel => 'Згадки';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Ще немає друзів';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Додайте друга, щоб почати.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Друзів, що відповідають пошуку, не знайдено';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Спробуйте інше ім\'я.';

  @override
  String get quickSwitcherSearchAliasUser => 'Користувач';

  @override
  String get quickSwitcherSearchAliasYou => 'Ви';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'ПП';

  @override
  String get quickSwitcherSearchAliasMessages => 'Повідомлення';

  @override
  String get quickSwitcherSearchAliasFav => 'Вибр.';

  @override
  String get quickSwitcherSearchAliasStarred => 'Вибрані';

  @override
  String get quickSwitcherSearchAliasInbox => 'Вхідні';

  @override
  String get quickSwitcherSearchAliasSaved => 'Збережені';

  @override
  String get uiClose => 'Закрити';

  @override
  String get chatJumpToBottom => 'Перейти донизу';

  @override
  String get uiConfirm => 'Підтвердити';

  @override
  String get uiLoading => 'Завантаження';

  @override
  String get uiUnsavedChanges => 'Незбережені зміни';

  @override
  String get uiReset => 'Скинути';

  @override
  String get uiOpenColorPicker => 'Відкрити вибір кольору';

  @override
  String get uiSelectPlaceholder => 'Вибрати';

  @override
  String get uiSearchPlaceholder => 'Пошук';

  @override
  String get uiNoOptionsFound => 'Опцій не знайдено';

  @override
  String get uiDismissNotification => 'Закрити сповіщення';

  @override
  String get uiColorPickerTitle => 'Вибір кольору';

  @override
  String get mentionConfirmTitle => 'Згадати всіх?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Це сповістить $count учасників. Продовжити?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Це сповістить $count учасників онлайн. Продовжити?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'This will notify $count members with the $roleName role. Continue?';
  }

  @override
  String get mentionConfirmButton => 'Згадати';

  @override
  String get composerEmojiUnavailable =>
      'Ви не можете використовувати цей емодзі тут.';

  @override
  String get instanceUrlLabel => 'URL екземпляра';

  @override
  String get instanceUrlPlaceholder =>
      'Введіть URL екземпляра (наприклад, fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Скинути до Fluxer';

  @override
  String get instanceConnect => 'Підключитися';

  @override
  String get instanceConnecting => 'Підключення…';

  @override
  String get instanceConnectFailed => 'Не вдалося підключитися до екземпляра';

  @override
  String get recentInstances => 'Нещодавні екземпляри';

  @override
  String removeRecentInstance(String domain) {
    return 'Видалити $domain із нещодавніх екземплярів';
  }

  @override
  String get instanceSheetTitle => 'Підключитися до екземпляра';

  @override
  String get connectToDifferentInstance => 'Підключитися до іншого екземпляра';

  @override
  String get changeInstance => 'Змінити';

  @override
  String get instanceConnectionRequired =>
      'Підключіться до екземпляра, щоб увійти';

  @override
  String get comingSoon => 'Незабаром';

  @override
  String get guildNavbarDirectMessages => 'Особисті повідомлення';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Дослідити доступні спільноти';

  @override
  String get discoveryExplore => 'Дослідити';

  @override
  String get discoveryExplorePublicCommunities =>
      'Дослідити публічні спільноти';

  @override
  String get discoveryListingSubheading =>
      'Хочете додати свою спільноту сюди? Подайте заявку, якщо ви відповідаєте вимогам у налаштуваннях вашої спільноти > Дослідження.';

  @override
  String get discoverySearchCommunities => 'Пошук спільноти';

  @override
  String get discoveryFilterByLanguage => 'Фільтрувати за мовою';

  @override
  String get discoveryAllLanguages => 'Усі мови';

  @override
  String get discoveryAllCategories => 'Усі';

  @override
  String get discoveryCategoryGaming => 'Ігри';

  @override
  String get discoveryCategoryMusic => 'Музика';

  @override
  String get discoveryCategoryEntertainment => 'Розваги';

  @override
  String get discoveryCategoryEducation => 'Освіта';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Наука та технології';

  @override
  String get discoveryCategoryContentCreator => 'Створювачі контенту';

  @override
  String get discoveryCategoryAnimeAndManga => 'Аніме та манга';

  @override
  String get discoveryCategoryMoviesAndTv => 'Фільми та ТБ';

  @override
  String get discoveryCategoryOther => 'Інше';

  @override
  String get discoveryNoCommunitiesMatch => 'Спільноти не знайдено.';

  @override
  String get discoveryJoinCommunity => 'Приєднатися до спільноти';

  @override
  String get discoveryJoined => 'Приєднано';

  @override
  String discoveryOnlineCount(String count) {
    return '$count онлайн';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString учасників',
      one: '1 учасник',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Немає опису.';

  @override
  String get discoveryCommunities => 'Спільноти';

  @override
  String get discoveryApps => 'Додатки';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Не вдалося приєднатися до цієї спільноти';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Щось пішло не так. Спробуйте ще раз за мить.';

  @override
  String get discoveryJoinErrorFullTitle => 'Ця спільнота переповнена';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Ця спільнота досягла ліміту учасників, тому ви не можете приєднатися зараз.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle => 'Ви досягли ліміту спільнот';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Ви перебуваєте в максимальній кількості спільнот. Залиште одну та спробуйте ще раз.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Ви не можете приєднатися до цієї спільноти';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Вам заборонено в цій спільноті.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Ця спільнота більше недоступна';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Можливо, вона покинула розділ «Дослідження» або вимкнула нові приєднання. Оновіть сторінку, і ви більше її не побачите.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Ви надто поспішаєте';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Будь ласка, зачекайте хвилину та спробуйте ще раз.';

  @override
  String get guildNavbarAddCommunity => 'Додати спільноту';

  @override
  String get guildNavbarHelp => 'Допомога';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'НОВЕ ПОВІДОМЛЕННЯ';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Згорнути теку $folderName';
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
  String get guildNavbarGroupDm => 'Груповий DM';

  @override
  String get guildNavbarCreateChannel => 'Створити канал';

  @override
  String get guildNavbarChannelType => 'Тип каналу';

  @override
  String get guildNavbarTextChannel => 'Текстовий канал';

  @override
  String get guildNavbarTextChannelDescription =>
      'Надсилайте повідомлення, зображення, GIF-файли та емодзі';

  @override
  String get guildNavbarVoiceChannel => 'Голосовий канал';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Спілкуйтеся разом голосом, відео та демонстрацією екрана';

  @override
  String get guildNavbarLinkChannel => 'Посилання на канал';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Швидкий доступ до зовнішнього вебсайту чи ресурсу';

  @override
  String get guildNavbarNameLabel => 'Назва';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

  @override
  String get guildNavbarCreateCategory => 'Створити категорію';

  @override
  String get guildNavbarNewCategoryHint => 'Нова категорія';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Запросіть друзів до $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Отримувачі потраплять до #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Шукати друзів';

  @override
  String get guildNavbarNoFriendsYet => 'Ще немає друзів';

  @override
  String get guildNavbarNoResults => 'Немає результатів';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Або надішліть посилання для запрошення другові:';

  @override
  String get guildNavbarInviteLink => 'Посилання для запрошення';

  @override
  String get guildNavbarCopy => 'Копіювати';

  @override
  String get guildNavbarCopied => 'Скопійовано!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Ваше посилання для запрошення закінчується через 7 днів.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Це посилання для запрошення ніколи не закінчується.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Ваше посилання для запрошення закінчується через $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Редагувати посилання для запрошення';

  @override
  String get guildNavbarInviteLinkSettings =>
      'Налаштування посилання для запрошення';

  @override
  String get guildNavbarExpireAfter => 'Закінчується через';

  @override
  String get guildNavbarMaxUses => 'Максимальна кількість використань';

  @override
  String get guildNavbarGrantTemporaryMembership => 'Надати тимчасове членство';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Учасники будуть видалені, коли вийдуть з мережі, якщо не буде призначено роль';

  @override
  String get guildNavbarCreateNewLink => 'Створити нове посилання';

  @override
  String get guildNavbarSent => 'Надіслано';

  @override
  String get guildNavbarInvite => 'Запросити';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Покинути спільноту';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Ви впевнені, що хочете покинути цю спільноту? Ви більше не зможете бачити жодних повідомлень.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Покинути спільноту';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Видалити ваші повідомлення в цій спільноті?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Назавжди видалити кожне повідомлення, яке ви надіслали тут, у всіх каналах. Не можна скасувати.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Видалити мої повідомлення';

  @override
  String get guildNavbarDeletedYourMessages => 'Ваші повідомлення видалено';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Не вдалося видалити ваші повідомлення';

  @override
  String get guildNavbarRemoveOverride => 'Видалити перевизначення';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Вимкнено до $formattedDate';
  }

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'Доступно лише персоналу $productName';
  }

  @override
  String get guildNavbarInvitesPaused =>
      'Запрошення наразі призупинено в цій спільноті';

  @override
  String get guildNavbarDurationNever => 'ніколи';

  @override
  String get guildNavbarDuration30Minutes => '30 хвилин';

  @override
  String get guildNavbarDuration1Hour => '1 година';

  @override
  String get guildNavbarDuration6Hours => '6 годин';

  @override
  String get guildNavbarDuration12Hours => '12 годин';

  @override
  String get guildNavbarDuration1Day => '1 день';

  @override
  String get guildNavbarDuration7Days => '7 днів';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count секунд';
  }

  @override
  String get guildNavbarNever => 'Ніколи';

  @override
  String get guildNavbarNoLimit => 'Без обмежень';

  @override
  String get guildNavbarOneUse => '1 раз';

  @override
  String guildNavbarUses(int count) {
    return '$count разів';
  }

  @override
  String get guildMenuMarkAsRead => 'Позначити як прочитане';

  @override
  String get guildPeekMoreOptions => 'Більше опцій';

  @override
  String get guildMenuInviteMembers => 'Запросити учасників';

  @override
  String get guildMenuCommunitySettings => 'Налаштування спільноти';

  @override
  String get guildMenuEditCommunityProfile => 'Редагувати профіль спільноти';

  @override
  String get guildMenuUnmuteCommunity => 'Вимкнути сповіщення спільноти';

  @override
  String get guildMenuMuteCommunity => 'Вимкнути сповіщення спільноти';

  @override
  String get guildMenuHideMutedChannels => 'Приховати вимкнені канали';

  @override
  String get guildMenuReportCommunity => 'Поскаржитися на спільноту';

  @override
  String get guildMenuDebugCommunity => 'Налагодження спільноти';

  @override
  String get guildMenuCopyCommunityId => 'Копіювати ID спільноти';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'До $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Загальні';

  @override
  String get guildMenuSettingsRoles => 'Ролі та дозволи';

  @override
  String get guildMenuSettingsEmoji => 'Власні емодзі';

  @override
  String get guildMenuSettingsStickers => 'Власні стікери';

  @override
  String get guildMenuSettingsSafetyModeration => 'Безпека та модерація';

  @override
  String get guildMenuSettingsActivityLog => 'Журнал дій';

  @override
  String get guildMenuSettingsWebhooks => 'Вебхуки';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'Власне посилання-запрошення';

  @override
  String get guildMenuSettingsDiscovery => 'Пошук';

  @override
  String get guildMenuSettingsMembers => 'Учасники';

  @override
  String get guildMenuSettingsInviteLinks => 'Посилання-запрошення';

  @override
  String get guildMenuSettingsBans => 'Бани';

  @override
  String get guildMenuSettingsChannels => 'Channels';

  @override
  String get guildSettingsNoPermission =>
      'У вас немає дозволу переглядати цю вкладку налаштувань.';

  @override
  String get guildSettingsOverviewIconTitle => 'Значок';

  @override
  String get guildSettingsUploadImage => 'Завантажити зображення';

  @override
  String get guildSettingsOverviewBannerTitle => 'Банер';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Завантажте банер для вашого сервера.';

  @override
  String get guildSettingsOverviewNameTitle => 'Назва';

  @override
  String get guildSettingsOverviewNameHint => 'Моя чудова спільнота';

  @override
  String get guildSettingsOverviewStatsTitle => 'Статистика';

  @override
  String get guildSettingsOverviewMembers => 'Учасники';

  @override
  String get guildSettingsOverviewOnline => 'Онлайн';

  @override
  String get guildSettingsRolesDescription =>
      'Використовуйте ролі для групування учасників та надання дозволів.';

  @override
  String get guildSettingsCreateRole => 'Створити роль';

  @override
  String get guildSettingsRolesListTitle => 'Ролі';

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
    return '$staticCount статичних, $animatedCount анімованих слотів для емодзі використано';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Ще немає власних емодзі.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count стікерів завантажено';
  }

  @override
  String get guildSettingsStickersEmpty => 'Ще немає власних стікерів.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Перевірка учасників';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Виберіть, що учасники повинні мати, перш ніж вони зможуть надсилати повідомлення або надсилати приватні повідомлення учасникам спільноти.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Учасники з ролями можуть обходити ці перевірки. Для загальнодоступних просторів ми рекомендуємо ввімкнути верифікацію.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Спільноти, перелічені в Discovery, вимагають принаймні підтвердженої електронної пошти. Неможливо вибрати «Жодного», коли увімкнено Discovery.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Контент для дорослих і попередження про контент';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Налаштуйте позначення контенту для дорослих та необов\'язкові попередження про контент для учасників.';

  @override
  String get guildSettingsModerationMatureToggle => 'Контент для дорослих';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Позначте цю спільноту як таку, що містить контент для дорослих.';

  @override
  String get guildSettingsVerificationNone => 'Жодного';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Верифікація не потрібна.';

  @override
  String get guildSettingsVerificationLow => 'Низький';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Вимагає підтвердженої адреси електронної пошти.';

  @override
  String get guildSettingsVerificationMedium => 'Середній';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Вимагає підтвердженої адреси електронної пошти та облікового запису, створеного щонайменше 5 хвилин тому.';

  @override
  String get guildSettingsVerificationHigh => 'Високий';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Вимагає всього з середнього рівня, плюс бути учасником спільноти щонайменше 10 хвилин.';

  @override
  String get guildSettingsVerificationHighest => 'Дуже високий';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Вимагає підтвердженого номера телефону.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Відстежуйте дії модераторів у спільноті.';

  @override
  String get guildSettingsAuditLogEmpty => 'Ще немає журналів';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Дії модерації та зміни спільноти з\'являтимуться тут.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Усі користувачі';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Усі дії';

  @override
  String get guildSettingsAuditLogNoReason => 'Причина не була надана.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Невідомий користувач';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Виникла помилка під час завантаження журналу дій.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Не вдалося завантажити журнали дій';

  @override
  String get guildSettingsAuditLogReason => 'Причина';

  @override
  String get guildSettingsAuditLogSomeone => 'хтось';

  @override
  String get guildSettingsAuditLogSomething => 'щось';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'невідома сутність';

  @override
  String get guildSettingsAuditLogNothing => 'нічого';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Невідома ціль';

  @override
  String get auditLogActionGuildUpdate => 'Спільноту оновлено';

  @override
  String get auditLogActionChannelCreate => 'Канал створено';

  @override
  String get auditLogActionChannelUpdate => 'Канал оновлено';

  @override
  String get auditLogActionChannelDelete => 'Канал видалено';

  @override
  String get auditLogActionChannelOverwriteCreate => 'Додано перекриття каналу';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Оновлено перекриття каналу';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Видалено перекриття каналу';

  @override
  String get auditLogActionMemberKick => 'Учасника вигнано';

  @override
  String get auditLogActionMemberPrune => 'Учасників видалено';

  @override
  String get auditLogActionMemberBanAdd => 'Учасника заблоковано';

  @override
  String get auditLogActionMemberBanRemove => 'Учасника розблоковано';

  @override
  String get auditLogActionMemberUpdate => 'Учасника оновлено';

  @override
  String get auditLogActionMemberRoleUpdate => 'Ролі учасника оновлено';

  @override
  String get auditLogActionMemberMove => 'Учасника переміщено';

  @override
  String get auditLogActionMemberDisconnect => 'Учасника відключено';

  @override
  String get auditLogActionBotAdd => 'Бота додано';

  @override
  String get auditLogActionRoleCreate => 'Роль створено';

  @override
  String get auditLogActionRoleUpdate => 'Роль оновлено';

  @override
  String get auditLogActionRoleDelete => 'Роль видалено';

  @override
  String get auditLogActionInviteCreate => 'Запрошення створено';

  @override
  String get auditLogActionInviteUpdate => 'Запрошення оновлено';

  @override
  String get auditLogActionInviteDelete => 'Запрошення видалено';

  @override
  String get auditLogActionWebhookCreate => 'Вебхук створено';

  @override
  String get auditLogActionWebhookUpdate => 'Вебхук оновлено';

  @override
  String get auditLogActionWebhookDelete => 'Вебхук видалено';

  @override
  String get auditLogActionEmojiCreate => 'Емодзі створено';

  @override
  String get auditLogActionEmojiUpdate => 'Емодзі оновлено';

  @override
  String get auditLogActionEmojiDelete => 'Емодзі видалено';

  @override
  String get auditLogActionStickerCreate => 'Стікер створено';

  @override
  String get auditLogActionStickerUpdate => 'Стікер оновлено';

  @override
  String get auditLogActionStickerDelete => 'Стікер видалено';

  @override
  String get auditLogActionMessageDelete => 'Повідомлення видалено';

  @override
  String get auditLogActionMessageBulkDelete => 'Повідомлення видалено';

  @override
  String get auditLogActionMessagePin => 'Повідомлення закріплено';

  @override
  String get auditLogActionMessageUnpin => 'Повідомлення відкріплено';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor оновив налаштування спільноти.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor створив(ла) канал $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor оновив(ла) канал $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor видалив(ла) канал $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor додав(ла) дозволи для каналу для $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor додав(ла) дозволи для каналу для $target у каналі $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor оновив(ла) дозволи для каналу для $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor оновив(ла) дозволи для каналу для $target у каналі $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor видалив(ла) дозволи для каналу для $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor видалив(ла) дозволи для каналу для $target у каналі $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor вигнав(ла) $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor заблокував(ла) $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor розблокував(ла) $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor оновив(ла) $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor оновив(ла) ролі для $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor видалив(ла) неактивних учасників.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor видалив(ла) учасників, неактивних протягом $days днів.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor перемістив(ла) $target до іншого голосового каналу.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor перемістив(ла) $target до каналу $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor відключив(ла) $target від голосу.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor додав(ла) бота $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor створив(ла) роль $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor оновив(ла) роль $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor видалив(ла) роль $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor створив(ла) запрошення $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor створив(ла) запрошення $target для каналу $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor оновив(ла) запрошення $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor оновив(ла) запрошення $target для каналу $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor видалив(ла) запрошення $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor видалив(ла) запрошення $target для каналу $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor створив(ла) вебхук $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor оновив(ла) вебхук $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor видалив(ла) вебхук $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor додав емодзі $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor оновив емодзі $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor видалив емодзі $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor додав стікер $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor оновив стікер $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor видалив стікер $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor видалив повідомлення.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor видалив повідомлення в каналі $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor видалив кілька повідомлень.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor видалив $count повідомлень.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor видалив кілька повідомлень у каналі $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor видалив $count повідомлень у каналі $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor закріпив повідомлення.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor закріпив повідомлення в каналі $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor відкріпив повідомлення.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor відкріпив повідомлення в каналі $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor виконав дію аудиту над $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Оновлено $field з $oldValue до $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Встановлено $field на $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Очищено $field (було $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Оновлено $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Спільноту перейменовано на $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon => 'Оновлено іконку спільноти.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Канал перейменовано на $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Тему очищено.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Тему оновлено до $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'Увімкнено контент для дорослих.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Вимкнено контент для дорослих.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Нікнейм встановлено на $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Нікнейм $nickname видалено.';
  }

  @override
  String get auditLogChangeMutedMember => 'Учасника вимкнено.';

  @override
  String get auditLogChangeUnmutedMember => 'Учасника увімкнено.';

  @override
  String get auditLogChangeDeafenedMember => 'Учасника заглушено.';

  @override
  String get auditLogChangeUndeafenedMember => 'Учасника розглушено.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Додано $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Видалено $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Канал: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Повідомлення: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Запрошено через $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Видалено # повідомлень.',
      one: 'Видалено # повідомлення.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Видалено # учасників.',
      one: 'Видалено # учасника.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'Це запрошення ніколи не закінчується.';

  @override
  String get auditLogOptionTemporaryMembership => 'Надає тимчасове членство.';

  @override
  String get auditLogOptionPermanentMembership => 'Надає постійне членство.';

  @override
  String get guildSettingsLoadMore => 'Завантажити ще';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Керуйте вебхуками, які надсилають повідомлення до каналів.';

  @override
  String get guildSettingsWebhooksEmpty => 'Вебхуки не налаштовано.';

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
  String get guildSettingsCopyUrl => 'Копіювати URL';

  @override
  String get guildSettingsCopiedUrl => 'URL скопійовано до буфера обміну';

  @override
  String get guildSettingsDeleteWebhook => 'Видалити вебхук';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Налаштуйте власне посилання для запрошення на ваш сервер.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Зберегти';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Використання';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count використань';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Подайте заявку, щоб потрапити до списку пошуку серверів.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Not enough members';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Потрібно щонайменше $count учасників для подання заявки.';
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
  String get guildSettingsDiscoveryCategory => 'Категорія';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Choose the category that best describes your community. You can change this any time.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Primary language';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'The language most of your community speaks. Used to filter Discovery results.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Опис';

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
  String get guildSettingsDiscoveryTags => 'Теги';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Up to $maxTags tags help people find your community. They show up in Discovery search.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'ігри, мистецтво, музика';

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
  String get guildSettingsDiscoveryApply => 'Надіслати заявку';

  @override
  String get guildSettingsDiscoverySave => 'Save';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Відкликати';

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
      'Шукайте учасників сервера та керуйте ними.';

  @override
  String get guildSettingsMembersSearchHint => 'Пошук учасників';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count учасників';
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
  String get guildSettingsMembersSortNewest => 'Спочатку найновіші';

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
      'Переглядайте та відкликайте активні посилання для запрошень.';

  @override
  String get guildSettingsInvitesEmpty => 'Немає активних запрошень.';

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
    return '$uses / $maxUses використань';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Термін дії до $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Переглядайте та керуйте заблокованими користувачами.';

  @override
  String get guildSettingsBansSearchHint => 'Пошук блокувань';

  @override
  String get guildSettingsBansEmpty => 'Немає заблокованих користувачів.';

  @override
  String get guildSettingsBanPermanent => 'Постійне блокування';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Термін дії до $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Термін дії';

  @override
  String get guildSettingsUnban => 'Розблокувати';

  @override
  String get guildSettingsBansLoading =>
      'Завантаження заблокованих користувачів';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Не знайдено блокувань, що відповідають вашому пошуку.';

  @override
  String get guildSettingsBanDetailsTitle => 'Деталі блокування';

  @override
  String get guildSettingsBanViewDetails => 'Переглянути деталі';

  @override
  String get guildSettingsBannedOn => 'Заблоковано';

  @override
  String get guildSettingsBannedBy => 'Заблоковано';

  @override
  String get guildSettingsRevokeBanTitle => 'Скасувати блокування';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Ви впевнені, що хочете скасувати блокування для $displayName? Вони зможуть знову приєднатися до спільноти.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Блокування для $displayName скасовано';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Не вдалося завантажити блокування. Спробуйте ще раз.';

  @override
  String get guildSettingsRevokeBanError =>
      'Не вдалося скасувати блокування. Спробуйте ще раз.';

  @override
  String get guildSettingsCommunitySettings => 'Налаштування спільноти';

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
      'Керуйте профілем, каналами та налаштуваннями за замовчуванням вашої спільноти.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Брендинг';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Оновіть іконку, назву, банер та фон запрошення';

  @override
  String get guildSettingsOverviewBannerUpload => 'Завантажити банер';

  @override
  String get guildSettingsOverviewIdleTitle => 'Налаштування бездіяльності';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Налаштуйте AFK-канал та тайм-аут';

  @override
  String get guildSettingsOverviewSystemTitle => 'Система та привітання';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Виберіть призначення для системних повідомлень та повідомлень привітання';

  @override
  String get guildSettingsOverviewNotificationsTitle =>
      'Сповіщення за замовчуванням';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Спільноти з понад 250 учасниками автоматично отримують налаштування \"лише згадки\". Ваше початкове налаштування зберігається і буде відновлено, якщо кількість учасників спільноти впаде нижче 250.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Додатково';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Дозволити гнучкі назви текстових каналів';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Приховати корону власника спільноти';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Відокремлений банер';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Відображає банер у власному розділі під заголовком спільноти.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Завантажити значок';

  @override
  String get guildSettingsOverviewRemoveImage => 'Видалити';

  @override
  String get guildSettingsOverviewSplashTitle => 'Фон запрошення';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'Фон вбудовування чату';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Відображається у вбудовуваннях запрошень у чаті.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Завантажити фон';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'Немає банера спільноти';

  @override
  String get guildSettingsOverviewNoInviteBackground => 'Немає фону запрошення';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Попередній перегляд';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Перегляньте, як ваше запрошення виглядає для відвідувачів.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Назви текстових каналів';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Корона власника спільноти';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Налаштуйте, чи відображається значок корони поруч із власником спільноти';

  @override
  String get guildSettingsSplashCardAlignment => 'Вирівнювання картки';

  @override
  String get guildSettingsSplashAlignmentCenter => 'По центру';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Зліва';

  @override
  String get guildSettingsSplashAlignmentRight => 'Справа';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Застосовується лише на широких екранах.';

  @override
  String get permissionReadMessageHistory => 'Читання історії повідомлень';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Змінити, що можуть бачити користувачі без \"$permission\"';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Використовуйте окреме модальне вікно, щоб встановити дату граничного перегляду історії повідомлень для учасників, які не мають дозволу $permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Відкрити поріг історії повідомлень';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Поріг історії повідомлень';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Увімкнути поріг історії повідомлень';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Дата порогу';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Учасники без дозволу «Читати історію повідомлень» можуть переглядати повідомлення, надіслані після цієї дати.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Поріг історії повідомлень оновлено';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Дозволити великі літери та пробіли в назвах текстових каналів. Вимкнено обмежує назви нижнім регістром з дефісами та підкресленнями.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Приховує значок корони поруч із власником спільноти на всіх поверхнях.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Анімовані значки вимагають функції спільноти «Анімований значок».';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Анімовані банери вимагають функції спільноти «Анімований банер».';

  @override
  String get guildSettingsAfkChannel => 'Канал AFK / бездіяльності';

  @override
  String get guildSettingsAfkChannelHint =>
      'Переміщуйте учасників до цього каналу, коли вони неактивні.';

  @override
  String get guildSettingsNoAfkChannel => 'Немає каналу AFK';

  @override
  String get guildSettingsAfkTimeout => 'Тайм-аут AFK';

  @override
  String get guildSettingsAfkTimeout1Min => '1 хвилина';

  @override
  String get guildSettingsAfkTimeout5Min => '5 хвилин';

  @override
  String get guildSettingsAfkTimeout15Min => '15 хвилин';

  @override
  String get guildSettingsAfkTimeout30Min => '30 хвилин';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 година';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds секунд';
  }

  @override
  String get guildSettingsSystemChannel => 'Канал призначення';

  @override
  String get guildSettingsSystemChannelHint =>
      'Привітання та системні повідомлення з\'являтимуться тут.';

  @override
  String get guildSettingsNoSystemChannel => 'Немає системного каналу';

  @override
  String get guildSettingsHideJoinMessages => 'Приховати повідомлення про вхід';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Приховує повідомлення про вхід у цільовий канал.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Налаштування сповіщень за замовчуванням';

  @override
  String get guildSettingsNotificationsAll => 'Усі повідомлення';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Сповіщати про всі повідомлення';

  @override
  String get guildSettingsNotificationsMentions => 'Лише згадки';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Сповіщати лише про згадки';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Макс. 10 МБ. Мінімум: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Макс. 10 МБ. Мінімум: 960×540px (16:9). Відображається у вбудованих запрошеннях у чаті.';

  @override
  String get guildSettingsModerationDescription =>
      'Налаштуйте параметри верифікації, фільтрації контенту та контенту для дорослих.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Спільноти, перелічені в Discovery, мають обмежені можливості модерації.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Фільтрація контенту';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Автоматично перевіряти повідомлення на наявність відвертого контенту в каналах, не позначених як контент для дорослих.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Спільноти, перелічені в Discovery, зобов\'язані сканувати всіх учасників. Цей параметр не можна змінити, доки увімкнено Discovery.';

  @override
  String get guildSettingsContentFilterOff => 'Вимкнено';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Дозволити спільноті самостійно модерувати';

  @override
  String get guildSettingsContentFilterNoRole =>
      'Фільтрувати учасників без ролей';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Рекомендовано для більшості спільнот';

  @override
  String get guildSettingsContentFilterAll => 'Фільтрувати всіх';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Максимальний захист для сімейних просторів';

  @override
  String get guildSettingsModerationMatureOff => 'Вимкнено';

  @override
  String get guildSettingsModerationMatureOn => 'Увімкнено';

  @override
  String get guildSettingsContentWarningToggle =>
      'Показувати попередження про контент';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Вмикає запит на згоду перед входом у будь-який канал.';

  @override
  String get guildSettingsContentWarningText => 'Власний текст попередження';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Це містить чутливий контент.';

  @override
  String get guildSettingsModeration2faTitle => 'Вимога 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'Вимагати двофакторну автентифікацію для модераторів, перш ніж вони зможуть забороняти, виганяти, тимчасово блокувати або видаляти повідомлення.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Вимагати 2FA для дій модерації';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Лише власник спільноти може змінити цей параметр';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Увімкніть 2FA у своєму обліковому записі, щоб змінити цей параметр';

  @override
  String get guildSettingsEmojiSearchHint => 'Пошук емодзі';

  @override
  String get guildSettingsEmojiUploadTitle => 'Завантажити емодзі';

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
    return 'Неанімовані емодзі ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Анімовані емодзі ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Пошук стікерів';

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
    return 'Створюйте вебхуки з налаштувань каналу. Редагуйте їх тут.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'Ваша спеціальна URL-адреса не працюватиме, якщо принаймні один канал не буде видимим для всіх.';

  @override
  String get guildSettingsVanityUrlRemove => 'Видалити';

  @override
  String get guildSettingsBannedUsersTitle => 'Заблоковані користувачі';

  @override
  String get guildSettingsInvitesTableInviter => 'Запросив';

  @override
  String get guildSettingsInvitesTableChannel => 'Канал';

  @override
  String get guildSettingsInvitesTableCode => 'Код';

  @override
  String get guildSettingsInvitesTableUses => 'Використання';

  @override
  String get guildSettingsInvitesTableCreated => 'Створено';

  @override
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsAuditLogFilterUser => 'Фільтрувати за користувачем';

  @override
  String get guildSettingsAuditLogFilterAction => 'Фільтрувати за дією';

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
