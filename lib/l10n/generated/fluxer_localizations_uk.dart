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
  String get addFriendSendFailedGeneric =>
      'Не вдалося надіслати запит у друзі. Спробуйте ще раз.';

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
  String get externalLinkWarningLeaving => 'Ви збираєтеся покинути Fluxer';

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
  String get changeYourFluxerTag => 'Змінити ваш FluxerTag';

  @override
  String get fluxerTagInputLabel => 'FluxerTag';

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
  String get fluxerTagAlreadyTaken => 'FluxerTag вже зайнятий';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'FluxerTag $username#$discriminator вже зайнятий. Продовження автоматично перепризначить ваш дискримінатор.';
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
      'Якщо ви збережете цей FluxerTag, ваш власний 4-значний тег буде замінено випадковим номером після закінчення вашої підписки Plutonium. Якщо ваша підписка не буде поновлена, у вас буде 3-денний пільговий період перед зміною тегу.';

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
  String get fluxerTagUpdated => 'FluxerTag оновлено';

  @override
  String get fluxerTagUpdateFailed =>
      'Не вдалося оновити FluxerTag. Будь ласка, спробуйте ще раз.';

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
      'Підтвердьте свій обліковий запис, щоб змінити свій FluxerTag';

  @override
  String get changeFluxerTag => 'Змінити FluxerTag';

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
  String get profilePreviewMemberSince => 'Учасник Fluxer з';

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
  String get securityLoginEmailSectionDescription =>
      'Керуйте адресою електронної пошти, яку ви використовуєте для входу в Fluxer';

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
  String get relativeTimeJustNow => 'щойно';

  @override
  String get authorizedAppsTitle => 'Авторизовані програми';

  @override
  String get authorizedAppsDescription =>
      'Цим програмам надано доступ до вашого облікового запису Fluxer.';

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
  String get blockedUsersCopyTag => 'Копіювати FluxerTag';

  @override
  String get blockedUsersCopyId => 'Копіювати ID користувача';

  @override
  String get userProfileLoadError => 'Не вдалося завантажити профіль';

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
  String get userProfileStaffBadgeTooltip => 'Команда Fluxer';

  @override
  String get userProfileCtpBadgeTooltip => 'Спільнота Fluxer';

  @override
  String get userProfilePartnerBadgeTooltip => 'Партнер Fluxer';

  @override
  String get userProfileBugHunterBadgeTooltip =>
      'Мисливець за помилками Fluxer';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer Plutonium';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Підписник Fluxer Plutonium з $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Fluxer Visionary';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Visionary Fluxer з $date';
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
  String get chatAttachmentFileTooLarge =>
      'Один або кілька файлів перевищують ліміт розміру';

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
  String get chatAttachmentExpiredTooltip => 'Вкладення застаріло';

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
  String get connectionsDescription =>
      'Підключіть зовнішні облікові записи та домени до свого профілю Fluxer. Перевірені підключення відображатимуться у вашому профілі для інших.';

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
  String get lookAndFeelCollapseDMsLabel =>
      'Згорнути прямі повідомлення в папку';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'Якщо ввімкнено, непрочитані прямі повідомлення на бічній панелі спільноти згортаються в папку на кнопці Fluxer. Клацніть кнопку Fluxer на сторінці прямих повідомлень, щоб розгорнути або згорнути папку.';

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
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'Під час завантаження безпосередньо до Fluxer';

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
  String get accessibilityUnreadGroupTitle => 'Індикатори непрочитаних';

  @override
  String get accessibilityUnreadGroupDescription =>
      'Керуйте відображенням індикаторів непрочитаних повідомлень.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'Показувати блідий індикатор непрочитаних у вимкнених каналах';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'Відображати приглушений індикатор непрочитаних поруч із вимкненими прямими повідомленнями та каналами, щоб ви могли швидко бачити активність.';

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
  String systemCallDurationYears(String count) {
    return '$count years';
  }

  @override
  String systemCallDurationMonths(String count) {
    return '$count months';
  }

  @override
  String systemCallDurationWeeks(String count) {
    return '$count weeks';
  }

  @override
  String systemCallDurationDays(String count) {
    return '$count days';
  }

  @override
  String systemCallDurationHours(String count) {
    return '$count hours';
  }

  @override
  String systemCallDurationMinutes(String count) {
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
  String get voiceChannelEmptyDescription =>
      'Це голосовий канал. Підключіться, щоб почати розмову!';

  @override
  String get voiceChannelJoin => 'Приєднатися до голосового каналу';

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
  String get voiceControlChat => 'Чат';

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
  String get iarReasonOtherDescription =>
      'Використовуйте лише якщо це явно порушує правила Fluxer і не підпадає під вищезазначені категорії.';

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
  String get channelDetailsChannelSettingsTitle => 'Channel Settings';

  @override
  String get channelDetailsGroupSettingsTitle => 'Group Settings';

  @override
  String get channelDetailsDmSettingsTitle => 'DM Settings';

  @override
  String get channelDetailsInvitePeople => 'Invite People';

  @override
  String get channelDetailsCopyLink => 'Copy Link';

  @override
  String get channelDetailsAddFriendsToGroup => 'Add friends to group';

  @override
  String get channelDetailsGroupInvites => 'Group invites';

  @override
  String get channelDetailsEditChannel => 'Edit Channel';

  @override
  String get channelDetailsDeleteChannel => 'Delete Channel';

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
  String channelDetailsSearchResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Results',
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
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'Профіль';

  @override
  String get userSettingsNavSecurityLogin => 'Безпека та вхід';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Подарунки та коди';

  @override
  String get userSettingsNavExpressionPacks => 'Пакети виразів';

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
  String get userSettingsNavMessagesAndMedia => 'Повідомлення та медіа';

  @override
  String get userSettingsNavAudioAndVideo => 'Аудіо та відео';

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
  String get audioAndVideoMicTestSectionDescription =>
      'Listen to how you sound with your current settings.';

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
  String get userSettingsNavSoundsAndAlerts => 'Звуки та сповіщення';

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
  String get userSettingsNavAdvanced => 'Додатково';

  @override
  String get advancedPerformanceReportingTitle => 'Звіти про продуктивність';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Допоможіть покращити Fluxer, надаючи анонімні дані про збої та продуктивність.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Надсилати звіти про збої та продуктивність';

  @override
  String get advancedPerformanceReportingDescription =>
      'Усі надані дані є анонімними та надсилаються лише на власний моніторинговий сервіс Fluxer — сторонні постачальники не використовуються.';

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
  String get userSettingsNavLogOut => 'Вийти';

  @override
  String get betaWarningTitle => 'Бета-версія програмного забезпечення';

  @override
  String get betaWarningMessage =>
      'Це бета-версія програмного забезпечення. Ще не все завершено або додано.';

  @override
  String get betaWarningReportIssues =>
      'Будь ласка, повідомляйте про будь-які проблеми, які ви знайдете, спільноті Fluxer Mobile (наразі ви повинні мати Plutonium, щоб приєднатися до спільноти).';

  @override
  String get betaWarningRepoLink => 'Переглянути вихідний код на GitHub';

  @override
  String get betaWarningGotIt => 'Зрозуміло';

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
  String get guildNavbarStaffOnlyAccessible => 'Доступно лише персоналу Fluxer';

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
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Потрібно щонайменше $count учасників для подання заявки.';
  }

  @override
  String get guildSettingsDiscoveryFormTitle => 'Заявка';

  @override
  String get guildSettingsDiscoveryStatusTitle => 'Статус';

  @override
  String get guildSettingsDiscoveryCategory => 'Категорія';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Опис';

  @override
  String get guildSettingsDiscoveryTags => 'Теги';

  @override
  String get guildSettingsDiscoveryTagsHint => 'ігри, мистецтво, музика';

  @override
  String get guildSettingsDiscoveryApply => 'Надіслати заявку';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Відкликати';

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
  String get guildSettingsWebhooksInfo =>
      'Створюйте вебхуки з налаштувань каналу. Редагуйте їх тут.';

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
  String get guildSettingsMembersSortNewest => 'Спочатку найновіші';

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
}
