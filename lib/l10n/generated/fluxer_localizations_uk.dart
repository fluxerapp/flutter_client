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
      'Щось не так з інстансом.\nМає виправитись за секунду!';

  @override
  String get gatewayReconnectingToast => 'Перепідключення…';

  @override
  String get gatewayConnectedToast => 'Підключено';

  @override
  String get sessionExpiredToast =>
      'Ваш сеанс завершився. Будь ласка, увійдіть знову.';

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
  String get nagbarLearnMore => 'Докладніше';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'Заплановано технічне обслуговування на $localizedTime. Очікувана тривалість: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Триває технічне обслуговування. Очікувана тривалість: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'Обслуговування завершено.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Привіт, $displayName, підтвердьте свій обліковий запис, щоб не втратити доступ.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Привіт, $displayName! Будь ласка, підтвердьте свою електронну адресу.';
  }

  @override
  String get nagbarOpenSettings => 'Відкрити налаштування';

  @override
  String get systemPermissionSettingsTitle => 'Увімкнути дозвіл';

  @override
  String get systemPermissionSettingsOpenSettings => 'Відкрити налаштування';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName не має доступу до вашого мікрофона. Ви можете ввімкнути його в налаштуваннях конфіденційності вашого пристрою.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName не має доступу до вашої камери. Ви можете ввімкнути його в налаштуваннях конфіденційності вашого пристрою.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName не має доступу до вашої фотогалереї. Ви можете ввімкнути його в налаштуваннях конфіденційності вашого пристрою.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName не має дозволу на надсилання сповіщень. Ви можете ввімкнути його в налаштуваннях пристрою.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Ваша підписка не поновилася, але ви все ще маєте доступ до переваг $productName до $graceDate. Вживіть заходів зараз, або ви втратите всі переваги.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Ваша підписка на $productName закінчилася. Поновіть її зараз, щоб зберегти свої переваги.';
  }

  @override
  String get nagbarManageSubscription => 'Керувати підпискою';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Ласкаво просимо до $productFullName. Ознайомтеся з перевагами вашого $productName та керуйте своєю підпискою.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'Переглянути функції $productName';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'У вашому інвентарі подарунків чекає новий подарунковий код.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'У вас є $count нових промокодів у подарунковому інвентарі.';
  }

  @override
  String get nagbarViewGiftInventory => 'Переглянути інвентар подарунків';

  @override
  String get nagbarVisionaryMfa =>
      'Увімкніть двофакторну автентифікацію для захисту вашого облікового запису Visionary.';

  @override
  String get nagbarEnableMfa => 'Увімкнути двофакторну автентифікацію';

  @override
  String get nagbarTermsAcceptance =>
      'Ми оновили наші умови. Будь ласка, перегляньте їх та прийміть, щоб продовжити.';

  @override
  String get nagbarReviewTerms => 'Переглянути умови';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Приєднуйтеся до спільноти «$communityName», щоб спілкуватися з командою та бути в курсі подій.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Приєднатися до $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'Увімкніть сповіщення, щоб не пропускати повідомлення та згадки.';

  @override
  String get nagbarEnableNotifications => 'Увімкнути сповіщення';

  @override
  String get nagbarBillingPortalFailed =>
      'Не вдалося відкрити платіжний портал. Спробуйте ще раз за мить.';

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
  String get next => 'Далі';

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
      'Ваш запит на обліковий запис очікує схвалення. Ви зможете ввійти після схвалення адміністратором.';

  @override
  String get registerClosed =>
      'Реєстрацію зараз закрито. Щоб створити обліковий запис, скористайтеся реєстраційним посиланням від адміністратора.';

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
  String get errorServiceUnavailable =>
      'Цей екземпляр тимчасово недоступний. Спробуйте ще раз за мить.';

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
  String get embedInviteJoinGroup => 'Приєднатися до групи';

  @override
  String get embedInviteAlreadyJoined => 'Уже приєднано';

  @override
  String get embedInviteDisabled => 'Запрошення вимкнено';

  @override
  String get embedInvitePaused => 'Запрошення для цієї спільноти призупинено.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName виявив потенційну атаку, тому нові користувачі наразі не можуть приєднатися.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Ця спільнота призупинила запрошення. Можна спробувати пізніше.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName виявив потенційну атаку в цій спільноті. Запрошення призупинено, тому нові користувачі наразі не можуть приєднатися.';
  }

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
  String get invalidDeepLinkTitle => 'Посилання не вдалося відкрити';

  @override
  String get invalidDeepLinkDescription =>
      'Це посилання може бути недійсним, доступним лише в Інтернеті, або у вас може не бути доступу. Перевірте посилання та спробуйте ще раз.';

  @override
  String get invalidDeepLinkGoHomeButton => 'На головну';

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
    return '«Візіонер» (довічно $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count днів $productName',
      one: '1 день $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count тижнів $productName',
      one: '1 тиждень $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count місяців $productName',
      one: '1 місяць $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count років $productName',
      one: '1 рік $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'Від $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'Натисніть, щоб отримати подарунок!';

  @override
  String get embedGiftAlreadyRedeemed => 'Уже активовано';

  @override
  String get embedGiftClaimAccountHelp =>
      'Щоб активувати цей подарунок, увійдіть в обліковий запис.';

  @override
  String get embedGiftClaim => 'Забрати подарунок';

  @override
  String get embedGiftClaimed => 'Подарунок отримано';

  @override
  String get embedGiftClaimAccount =>
      'Щоб активувати, увійдіть в обліковий запис';

  @override
  String get embedGiftUnknownTitle => 'Невідомий подарунок';

  @override
  String get embedGiftUnknownSubtitle =>
      'Цей код подарунка недійсний або вже використаний.';

  @override
  String get embedGiftUnavailable => 'Подарунок недоступний';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Активуйте свою підписку на $productName, отримавши цей подарунок!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'Цей подарунок уже отримано.';

  @override
  String get giftAcceptMaybeLater => 'Можливо, пізніше';

  @override
  String get giftRedeemedToast => 'Подарунок активовано!';

  @override
  String get giftRedeemInvalidTitle => 'Недійсний код подарунка';

  @override
  String get giftRedeemInvalidMessage =>
      'Цей код недійсний або вже використаний.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Подарунок уже активовано';

  @override
  String get giftRedeemAlreadyRedeemedMessage => 'Цей код уже використано.';

  @override
  String get giftRedeemNotFoundTitle => 'Подарунок не знайдено';

  @override
  String get giftRedeemNotFoundMessage => 'Цього коду не існує.';

  @override
  String get giftRedeemFailedTitle => 'Не вдалося активувати подарунок';

  @override
  String get giftRedeemFailedMessage =>
      'Не вдалося активувати цей подарунок. Спробуйте ще раз.';

  @override
  String get giftVisionaryCannotRedeemTitle =>
      'Не вдалося активувати цей подарунок';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Облікові записи Visionary не можуть активувати подарунки Plutonium. Натомість скопіюйте посилання, щоб поділитися ним з другом.';

  @override
  String get giftCopyLink => 'Копіювати посилання на подарунок';

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
  String get notificationUseCategoryDefault =>
      'Використовувати стандартні налаштування категорії';

  @override
  String get notificationUseCommunityDefault =>
      'Використовувати налаштування спільноти за замовчуванням';

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
      'Видалити ваші повідомлення в цій бесіді?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Це назавжди видалить усі повідомлення, які ви коли-небудь надсилали в цій бесіді. Цю дію не можна скасувати.';

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
  String get dmUnnamedGroup => 'Безіменна група';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'Група \"$resolvedName\"';
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
  String get dmDebugCategory => 'Налагодити категорію';

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
      'Підтвердьте свою електронну пошту, перш ніж надсилати запити на додавання в друзі.';

  @override
  String get addFriendFriendsListFull =>
      'Ваш список друзів заповнений, або заповнений у них. Видаліть когось і спробуйте ще раз.';

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
    return 'Це типовий емодзі у $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'Цей емодзі з цієї спільноти. Ви можете використовувати його всюди.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'Це власний емодзі зі спільноти.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'Це власне емодзі зі спільноти. Щоб використовувати це емодзі, попросіть автора надіслати запрошення.';

  @override
  String get emojiInfoFromHeader => 'Цей емодзі з';

  @override
  String get emojiInfoDiscoverableCommunity => 'Спільнота, яку можна знайти';

  @override
  String get emojiInfoPrivateCommunity => 'Приватна спільнота';

  @override
  String get emojiInfoVerifiedCommunity => 'Верифікована спільнота';

  @override
  String get emojiInfoAddToFavorites => 'Додати до вибраного';

  @override
  String get emojiInfoRemoveFromFavorites => 'Видалити з обраного';

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
  String get gifPickerFavoritesEmptyTitle => 'Улюблених GIF-ок ще немає';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Додайте GIF до вибраного, щоб побачити його тут.';

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
      'Ми надішлемо SMS-код, коли він буде доступний. Ваш номер не буде пов’язано з вашим обліковим записом. Ми зберігаємо лише зашифрований маркер без ідентифікатора користувача, щоб дозволити максимум 2 перевірки приблизно за 30 днів.';

  @override
  String get phoneAddSendCode => 'Надіслати код';

  @override
  String get phoneVerifyTitle => 'Підтвердити номер телефону';

  @override
  String get phoneVerifyDescription =>
      'Введіть код підтвердження, надісланий на ваш номер телефону.';

  @override
  String get phoneAddSuccess => 'Номер телефону підтверджено';

  @override
  String get phoneCountryLabel => 'Країна';

  @override
  String get phoneSearchCountries => 'Пошук країн...';

  @override
  String get phoneNumberRequired => 'Потрібен номер телефону';

  @override
  String get phoneEnterValidNumber =>
      'Введіть дійсний номер мобільного телефону.';

  @override
  String get phoneCannotBeUsed =>
      'Цей номер телефону не можна використовувати. Спробуйте інший мобільний номер або зверніться до служби підтримки.';

  @override
  String get phoneAlreadyUsed =>
      'Цей номер телефону вже використовувався. Спробуйте інший номер або зверніться до служби підтримки.';

  @override
  String get phoneCodeDidNotWork =>
      'Цей код не спрацював. Перевірте його та спробуйте ще раз.';

  @override
  String get phoneTooManyAttempts =>
      'Забагато спроб. Зачекайте трохи, потім спробуйте ще раз.';

  @override
  String get phoneSmsUnavailable =>
      'SMS-перевірка наразі недоступна. Спробуйте пізніше або зверніться до служби підтримки.';

  @override
  String get phoneNotEligible =>
      'Підтвердження номера телефону недоступне для цього облікового запису. Скористайтеся іншим способом або зверніться до служби підтримки.';

  @override
  String get phoneCaptchaRequired =>
      'Перед підтвердженням номера телефону потрібна перевірка в браузері. Спробуйте ще раз зі сторінки входу або зверніться до служби підтримки.';

  @override
  String get phoneSomethingWentWrong => 'Щось пішло не так. Спробуйте ще раз.';

  @override
  String get phoneInboundExpensiveDescription =>
      'Надсилання SMS на цей номер телефону є надто дорогим, тому нам потрібно, щоб ви надіслали SMS нам. Ви також можете звернутися до служби підтримки, щоб ми зняли цю вимогу з вашого облікового запису.';

  @override
  String get phoneInboundDefaultDescription =>
      'Нам потрібно, щоб ви надіслали нам SMS для підтвердження вашого номера телефону.';

  @override
  String get phoneInboundStepOpenMessaging =>
      'Відкрийте програму обміну повідомленнями на телефоні та створіть нове текстове повідомлення.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'Надішліть код $code на номер $number.';
  }

  @override
  String get phoneInboundStepWait =>
      'Зачекайте, поки ми отримаємо ваше повідомлення. Це може зайняти хвилину.';

  @override
  String get phoneInboundGetNewCode => 'Отримати новий код';

  @override
  String get phoneInboundChallengeCodeLabel => 'Код для надсилання';

  @override
  String get phoneInboundOurNumberLabel => 'Надіслати на';

  @override
  String get requiredActionTitle => 'Потрібна перевірка облікового запису';

  @override
  String requiredActionIntroGeneric(String productName) {
    return 'Пройдіть необхідну перевірку, щоб продовжити користуватися $productName.';
  }

  @override
  String get requiredActionIntroPhone =>
      'Щоб продовжити, потрібно пройти додаткову перевірку на спам.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return 'Підтвердьте свою електронну пошту або номер телефону, щоб продовжити користуватися $productName.';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return 'Щоб продовжити користуватися $productName, виконайте необхідні кроки з підтвердження електронної пошти та номера телефону.';
  }

  @override
  String get requiredActionChooseMethodTitle => 'Виберіть спосіб підтвердження';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return 'Щоб продовжити користуватися $productName, виконайте один із наведених нижче способів перевірки.';
  }

  @override
  String get requiredActionUseEmail => 'Використати емейл';

  @override
  String get requiredActionUsePhone => 'Використати телефон';

  @override
  String get requiredActionCheckEmailTitle => 'Перевірте свою електронну пошту';

  @override
  String get requiredActionCheckEmailDescription =>
      'Ми надіслали посилання для підтвердження на вашу електронну адресу. Відкрийте його, щоб продовжити.';

  @override
  String get requiredActionResendVerificationEmail =>
      'Надіслати лист для підтвердження ще раз';

  @override
  String get requiredActionVerificationEmailSent =>
      'Лист із підтвердженням надіслано. Перевірте свою поштову скриньку.';

  @override
  String get requiredActionSignOut => 'Вийти';

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
  String get networkErrorMessage =>
      'Виникла помилка. Будь ласка, спробуйте ще раз.';

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
      other: '$count тижнів тому',
      one: '1 тиждень тому',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'через $count хвилини',
      many: 'через $count хвилин',
      few: 'через $count хвилини',
      one: 'через $count хвилину',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'за $count години',
      one: 'за 1 годину',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'за # днів',
      one: 'за 1 день',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'за $count тижні',
      one: 'за 1 тиждень',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'через $count місяців',
      one: 'через 1 місяць',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'через $count роки',
      one: 'через 1 рік',
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
  String get userProfileLoading => 'Завантаження профілю';

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
  String get userProfileRoles => 'Ролі';

  @override
  String get memberRoleAdd => 'Додати роль';

  @override
  String memberRoleRemove(String roleName) {
    return 'Видалити роль $roleName';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'Цей користувач не має ролей у цій спільноті.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'Ще немає ролей. Додайте ролі в $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'Немає доступних ролей';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'Наразі в цій спільноті немає ролей для призначення, але ви можете створити нову роль у $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Налаштування спільноти';

  @override
  String get guildSettingsRolesTab => 'Ролі';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Місцевий час';

  @override
  String get userProfileSameTimeAsYou => 'Час збігається з вашим';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return 'на $duration попереду вас';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return 'На $duration пізніше, ніж у вас';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours годин',
      one: '1 година',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes хвилин',
      one: '1 хвилина',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours годин',
      one: '1 година',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes хвилин',
      one: '1 хвилина',
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
  String get iarReportGuildTitle => 'Поскаржитись на спільноту';

  @override
  String get iarReportGuildPreconfirmBody =>
      'Якщо скарга стосується певного повідомлення в цій спільноті, надішліть скаргу на це повідомлення. Скарги на повідомлення надають нашій команді безпеки найчіткіший контекст, а додавання деталей у коментарях може пришвидшити розгляд. Продовжуйте скаржитися на спільноту в цілому, лише якщо скарга на повідомлення не охоплює ширшу проблему.';

  @override
  String get iarContinueToReportCommunity =>
      'Продовжити скаржитись на спільноту';

  @override
  String get iarPreviewCommunitySubtitle => 'Спільнота';

  @override
  String get iarReasonHarassmentGuildLabel =>
      'Переслідування або цілеспрямовані образи';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'Спільнота сприяє цькуванню або цілеспрямованим образам.';

  @override
  String get iarReasonHateGuildDescription =>
      'Пропагує ненависть до захищених груп.';

  @override
  String get iarReasonTerrorismLabel => 'Тероризм або насильницький екстремізм';

  @override
  String get iarReasonTerrorismDescription =>
      'Пропагує, вербує або координує насильницьку екстремістську діяльність.';

  @override
  String get iarReasonMatureContentGuildLabel =>
      'Контент для дорослих або небезпечний контент';

  @override
  String get iarReasonMatureContentGuildDescription =>
      'Контент для дорослих без належного обмеження доступу.';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      'Загрожує неповнолітнім або містить матеріали щодо експлуатації дітей.';

  @override
  String get iarReasonRaidLabel => 'Координація рейду';

  @override
  String get iarReasonRaidDescription =>
      'Координує рейди, бригінг або утиски щодо людей чи спільнот.';

  @override
  String get iarReasonSpamGuildDescription =>
      'Спільнота існує для спаму, шахрайства або зловживання платформою.';

  @override
  String get iarReasonMalwareGuildLabel => 'Розповсюдження шкідливого ПЗ';

  @override
  String get iarReasonMalwareGuildDescription =>
      'Поширює шкідливі програми, викрадає облікові дані або шкідливі файли.';

  @override
  String get iarReasonPrivacyGuildLabel =>
      'Порушення конфіденційності або доксинг';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'Поширює особисту інформацію, переслідує користувачів або координує зловживання конфіденційністю.';

  @override
  String get iarReasonSelfHarmGuildLabel => 'Закликає до самоушкодження';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'Пропагує самогубство, самоушкодження або розлади харчової поведінки.';

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
  String get slowmodeStatusEnabled => 'Увімкнено повільний режим';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Повільний режим активний ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'Встановлено повільний режим на $durationLabel, але ви маєте імунітет.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Встановлено повільний режим на $durationLabel. Зачекайте, перш ніж надсилати наступне повідомлення.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Для цього каналу встановлено повільний режим на $durationLabel.';
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
      'Утримуйте, щоб записати. Перетягніть до кошика, щоб видалити, проведіть угору, щоб заблокувати, або відпустіть, щоб надіслати.';

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
  String get voiceMessageSeekForward => 'Перемотати вперед';

  @override
  String get voiceMessageSeekBackward => 'Перемотати назад';

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
  String get chatAttachmentDownloadedToast => 'Збережено у фото';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Не вдалося завантажити вкладення';

  @override
  String get chatAttachmentExpiredTooltip => 'Вкладення застаріло';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Розгорнути ($count рядків)',
      one: 'Розгорнути ($count рядок)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Згорнути ($count рядка)',
      many: 'Згорнути ($count рядків)',
      few: 'Згорнути ($count рядки)',
      one: 'Згорнути ($count рядок)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Розгорнути ($count рядків)',
      one: 'Розгорнути ($count рядок)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Згорнути ($count рядків)',
      one: 'Згорнути ($count рядок)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... залишилося $count рядків)',
      one: '... (залишився $count рядок)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... залишилося $count рядків)',
      one: '... (залишився $count рядок)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'Переглянути весь файл';

  @override
  String get chatTextualPreviewChangeLanguage => 'Змінити мову';

  @override
  String get chatTextualPreviewSearchLanguage => 'Шукати мову…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Підсвічування синтаксису';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'Нічого не знайдено';

  @override
  String get chatTextualPreviewMoreOptions => 'Більше опцій';

  @override
  String get chatTextualPreviewWrapText => 'Переносити текст';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'Файл завеликий для попереднього перегляду (ліміт $previewLimitKb КБ).';
  }

  @override
  String get chatTextualPreviewLoadError =>
      'Не вдалося завантажити попередній перегляд.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Звичайний текст';

  @override
  String get chatTextualPreviewCopy => 'Копіювати';

  @override
  String get chatAttachmentSourceGallery => 'Галерея';

  @override
  String get chatAttachmentSourceCamera => 'Камера';

  @override
  String get chatAttachmentSourceBrowse => 'Переглянути файли';

  @override
  String get chatAttachmentPasteTooltip => 'Вставити файл із буфера обміну';

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
  String get lookAndFeelHdrSectionTitle => 'Високий динамічний діапазон';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Керуйте відображенням HDR-зображень на моніторах, що підтримують HDR.';

  @override
  String get lookAndFeelHdrFullName => 'Повний динамічний діапазон';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Відображати HDR-зображення з повною яскравістю та діапазоном кольорів.';

  @override
  String get lookAndFeelHdrStandardName => 'Стандартний діапазон';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Тонування HDR-зображень до стандартного діапазону, зменшуючи пікову яскравість.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'Режим дисплея з широким динамічним діапазоном';

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
  String get lookAndFeelChatFontSizeLabel => 'Розмір шрифту чату';

  @override
  String get lookAndFeelAppZoomTitle => 'Масштаб застосунку';

  @override
  String get lookAndFeelAppZoomDescription => 'Налаштувати масштаб програми.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'Шпалери чату';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'Виберіть фон для чату. Він залишиться на цьому пристрої.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'Ця настройка залишається на цьому пристрої';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'Шпалери чату збережено лише на цьому пристрої й не синхронізуються з іншими.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'Типово';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'Власне зображення';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Колір $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Градієнт $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'Зробити шпалери темнішими';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'Не вдалося встановити це зображення як шпалери.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Повідомлення';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Виберіть, як відображатимуться повідомлення в каналах чату.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Відстань між групами повідомлень';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel =>
      'Режим відображення повідомлень';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Зручний';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Просторий макет із чітким візуальним розділенням між повідомленнями.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Щільний';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Максимум повідомлень на екрані з мінімальним інтервалом.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'Сховати аватари користувачів';

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
      'Спільнота тимчасово недоступна';

  @override
  String get guildUnavailableDescription =>
      'Щось пішло не так. Ми вже працюємо над цим.';

  @override
  String get guildNotFoundTitle => 'Це не та спільнота, яку ви шукаєте.';

  @override
  String get guildNotFoundDescription =>
      'Спільноту, яку ви шукаєте, можливо, було видалено або у вас немає доступу до неї.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return 'Доступ до спільноти «$communityName» наразі мають лише співробітники $productName';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => 'тимчасово недоступно';

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
  String get favoritesAddToSavedMedia => 'Додати до збережених медіа';

  @override
  String get favoritesRemoveFromSavedMedia => 'Видалити з вибраних медіафайлів';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Додати до улюблених GIF-файлів за URL-адресою';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Видалити з улюблених GIF-зображень, збережених за URL-адресою';

  @override
  String get savedMediaAddTitle => 'Додати до збережених медіа';

  @override
  String get savedMediaFormNameLabel => 'Назва';

  @override
  String get savedMediaFormNameHint => 'Мої чудові медіа';

  @override
  String get savedMediaFormAltTextLabel => 'Альтернативний текст';

  @override
  String get savedMediaFormAltTextHint => 'Опишіть медіа';

  @override
  String get savedMediaFormTagsLabel => 'Теги';

  @override
  String get savedMediaFormTagsHint => 'смішне, реакція, робота';

  @override
  String get savedMediaSaveError => 'Не вдалося оновити збережені медіа.';

  @override
  String get savedMediaNameRequired => 'Введіть ім\'я.';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'Як нам зберігати ваші улюблені GIF-файли?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'Ви можете зберігати вибрані GIF-файли як вибране лише за URL-адресою або завантажувати їх у збережені медіа. Виберіть варіант, який вам підходить. Ви можете змінити його будь-коли в розділі Налаштування > Додатково > Медіа.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'Улюблені (за замовчуванням): синхронізуються між вашими пристроями, без завантаження, не враховуються в збережених медіа. Оригінальні медіа можуть зникнути, якщо їх видалить хост.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Збережені медіа: завантажені, з можливістю додавання тегів, пошуку та постійного зберігання, але враховуються у ліміті збережених медіа.';

  @override
  String get gifFavoriteFirstTimeHint => 'Ми запитаємо лише один раз.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly =>
      'Використовувати лише URL (рекомендовано)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia =>
      'Використовувати збережені медіа';

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
  String get messagesMediaCameraUploadsSectionTitle => 'Завантаження з камери';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Виберіть, чи зберігати фото та відео, зняті за допомогою вбудованої камери, на вашому пристрої';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel =>
      'Зберегти на пристрій';

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
  String get accessibilitySaturationTitle => 'Насиченість';

  @override
  String get accessibilitySaturationDescription =>
      'Налаштуйте яскравість кольорів теми в усій програмі.';

  @override
  String get accessibilityVisualGroupTitle => 'Візуальні';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'Завжди підкреслювати посилання';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Приглушити закреслений текст';

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
  String get accessibilityScreenReaderGroupTitle =>
      'Екранний ріOutput only the localized string. Do not output JSON, notes, labels, quotes, or Markdown fences.';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Керуйте роботою $productName зі зчитувачами екрана.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Оголошувати про нові повідомлення';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Дозволити програмам читання з екрана оголошувати нові повідомлення, що надходять у відкритий канал. Звуки сповіщень залишаються без змін.';

  @override
  String get accessibilityTtsGroupTitle => 'Текст в мовлення';

  @override
  String get accessibilityTtsGroupDescription =>
      'Оберіть швидкість для озвучення тексту.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Швидкість відтворення мовлення';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Відтворити зразок';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Зразок тиші';

  @override
  String get accessibilityPreviewButtonLabel => 'Кнопка попереднього перегляду';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'Так відображаються посилання: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Попередній перегляд користувача';

  @override
  String get accessibilityKeyboardGroupTitle => 'Клавіатура';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Показувати рамку фокусу в полі введення чату';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'Клавіша Esc виходить з режиму клавіатури';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Показувати швидкі клавіші контекстного меню';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Запитувати підтвердження перед дзвінками';

  @override
  String get accessibilityAnimationGroupTitle => 'Анімація';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'Зменшення руху ввімкнено, тому анімації контенту призупинено за замовчуванням. Ви все ще можете ввімкнути будь-яку з них, щоб продовжити відтворення.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel =>
      'Відтворювати анімовані емодзі';

  @override
  String get accessibilityAutoPlayGifsMobileLabel =>
      'Автоматично відтворювати GIF';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'Автоматично відтворювати GIF-файли, коли $productName у фокусі';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Відтворюється попри зменшення руху.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Призупинено через зменшення руху. Увімкніть, щоб анімовані емодзі відтворювалися.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Призупинено через зменшення руху. Увімкніть, щоб GIF-файли відтворювалися.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'За замовчуванням вимкнено на мобільних пристроях для збереження заряду батареї та економії трафіку.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Анімація стікерів';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Налаштування анімації стікерів';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Завжди анімувати';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Стікери завжди будуть анімовані';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Анімувати під час взаємодії';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Стікери анімуватимуться, коли ви їх натискатимете';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Стікери анімуватимуться, коли ви наводите курсор або взаємодієте з ними';

  @override
  String get accessibilityStickerNeverAnimateName => 'Ніколи не анімувати';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Стікери ніколи не анімуватимуться';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Завжди анімувати, попри зменшений рух.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'Зменшення руху обмежує анімацію стікерів лише під час взаємодії. Виберіть «Завжди анімувати», щоб скасувати це обмеження.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'За замовчуванням анімація на мобільних пристроях вмикається під час взаємодії для збереження заряду батареї.';

  @override
  String get accessibilityMotionGroupTitle => 'Рух';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Синхронізувати налаштування зменшення руху із системою';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Використовувати системні налаштування пристрою для зменшення руху або налаштувати нижче.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Зменшити рух';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Вимкнути анімації та переходи. Наразі керується системними налаштуваннями.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Вимкнути анімації та переходи в усьому застосунку.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Анімовані емодзі, GIF-файли та стікери залишаються під вашим контролем на вкладці «Анімація».';

  @override
  String get accessibilityConfirmStartCallTitle => 'Почати дзвінок?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Ви впевнені, що хочете розпочати цей дзвінок?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Почати дзвінок';

  @override
  String get accessibilityTtsSampleDescription =>
      'Прослухайте зразок фрази з обраною швидкістю.';

  @override
  String get accessibilityTtsSampleText =>
      'Док, я з майбутнього. Я прибув сюди на машині часу, яку ви винайшли. Тепер мені потрібна ваша допомога, щоб повернутися в 1985 рік.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'Синтез мовлення недоступний на цьому пристрої.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Відтворення мовлення не вдалося. Спробуйте ще раз або перевірте, чи працює виведення звуку.';

  @override
  String get ttsSubstitutionUnknownUser => 'невідомий користувач';

  @override
  String get ttsSubstitutionUnknownRole => 'невідома роль';

  @override
  String get ttsSubstitutionUnknownChannel => 'невідомий канал';

  @override
  String get ttsSubstitutionCodeBlock => 'блок коду';

  @override
  String get ttsSubstitutionSpoiler => 'спойлер';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'емодзі $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return 'слеш $commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName сказав(-ла): $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'У відповідь $replyAuthorName, $authorName сказав(-ла): $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName: $description';
  }

  @override
  String get ttsSentSticker => 'надіслав стікер';

  @override
  String get ttsSentAttachment => 'надіслав вкладення';

  @override
  String ttsSentAttachments(int count) {
    return 'надіслано $count вкладення';
  }

  @override
  String get ttsSentEmbed => 'надіслав вбудований вміст';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author надіслав(ла) $summary';
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
  String get systemCallJoinTheCall => 'Приєднатися до дзвінка';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username розпочав дзвінок, який тривав $duration.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'Ви пропустили дзвінок від $username, який тривав $duration.';
  }

  @override
  String systemCallMissed(String username) {
    return 'Ви пропустили дзвінок від $username.';
  }

  @override
  String get systemCallDurationFewSeconds => 'кілька секунд';

  @override
  String get systemCallDurationMinute => 'хвилина';

  @override
  String get systemCallDurationOneYear => '1 рік';

  @override
  String get systemCallDurationOneMonth => '1 місяць';

  @override
  String get systemCallDurationOneWeek => '1 тиждень';

  @override
  String get systemCallDurationOneDay => '1 день';

  @override
  String get systemCallDurationOneHour => '1 година';

  @override
  String systemCallDurationYears(int count) {
    return '$count роки';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count місяців';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count тижнів';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count дні';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count год';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count хвилини';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Оновіть $productName, щоб переглянути це повідомлення.';
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
  String get voiceJoinFailedTitle =>
      'Не вдалося приєднатися до голосового каналу';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Не вдалося від\'єднати інші ваші пристрої. Спробуйте ще раз за мить.';

  @override
  String get voiceChannelEmptyDescription =>
      'Це голосовий канал. Підключіться, щоб почати розмову!';

  @override
  String get voiceChannelJoin => 'Приєднатися до голосового каналу';

  @override
  String get voiceCallJoin => 'Приєднатися до дзвінка';

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
  String get voiceControlFlipCamera => 'Змінити камеру';

  @override
  String get voiceControlScreenShare => 'Спільний доступ до екрана';

  @override
  String get voiceScreenShareNotificationText => 'Демонструється ваш екран.';

  @override
  String get voiceControlMore => 'Більше';

  @override
  String get voiceControlDisconnect => 'Відключитися';

  @override
  String get voiceInChat => 'У голосовому чаті';

  @override
  String get voiceConnectionFailed => 'Не вдалося підключитися';

  @override
  String get voiceConnectionRetry => 'Спробувати ще раз';

  @override
  String get voiceConnectionDismiss => 'Закрити';

  @override
  String get voiceConnectionDisconnected => 'Відключено';

  @override
  String voicePingMs(int currentLatency) {
    return 'Пінг: $currentLatency мс';
  }

  @override
  String get voiceMeasuringLatency => 'Вимірювання затримки...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Перейти до $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'Голосове з\'єднання';

  @override
  String get voiceConnectionAdvancedStats => 'Додатково';

  @override
  String get voiceShowCallAvatars => 'Показувати аватари в дзвінку';

  @override
  String get voiceShowConnectionId => 'Показати ідентифікатор з\'єднання';

  @override
  String get voiceAudioProcessing => 'Обробка аудіо';

  @override
  String get voiceConnectionSessionSection => 'Сеанс';

  @override
  String get voiceConnectionDurationLabel => 'Тривалість';

  @override
  String get voiceConnectionParticipantsLabel => 'Учасники';

  @override
  String get voiceConnectionNetworkSection => 'Мережа';

  @override
  String get voiceConnectionPingLabel => 'Перевірка зв\'язку';

  @override
  String get voiceConnectionJitterLabel => 'Джиттер';

  @override
  String get voiceConnectionSendLabel => 'Надіслати';

  @override
  String get voiceConnectionReceiveLabel => 'Отримано';

  @override
  String get voiceConnectionUnavailable => '—';

  @override
  String voiceConnectionDuration(int minutes, int seconds) {
    return '$minutes хв $seconds сек';
  }

  @override
  String voiceConnectionLatencyMs(int latency) {
    return '$latency мс';
  }

  @override
  String voiceConnectionJitterMs(String jitter) {
    return '$jitter мс';
  }

  @override
  String voiceConnectionBandwidthKbps(String bandwidth) {
    return '$bandwidth кбіт/с';
  }

  @override
  String get userAreaMuteMicrophone => 'Вимкнути мікрофон';

  @override
  String get userAreaUnmuteMicrophone => 'Увімкнути мікрофон';

  @override
  String get userAreaUserSettings => 'Налаштування користувача';

  @override
  String get voiceParticipantMenuViewProfile => 'Переглянути профіль';

  @override
  String get voiceParticipantMenuFocus => 'Зосередитися на цій людині';

  @override
  String get voiceParticipantMenuUnfocus => 'Прибрати фокус';

  @override
  String get voiceParticipantMenuCommunityMute => 'Вимкнути звук у спільноті';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Вимкнути звук у спільноті';

  @override
  String get voiceParticipantMenuUserVolume => 'Гучність користувача';

  @override
  String get voiceParticipantMenuStreamVolume => 'Гучність трансляції';

  @override
  String get voiceParticipantMenuStopStreaming => 'Припинити трансляцію';

  @override
  String get voiceParticipantModerationFailed =>
      'Не вдалося оновити цього учасника. Спробуйте ще раз.';

  @override
  String get voiceControlChat => 'Чат';

  @override
  String get voiceCallViewModeLabel => 'Переглянути';

  @override
  String get voiceCallViewModeGrid => 'Сітка';

  @override
  String get voiceCallViewModeFocus => 'Фокус';

  @override
  String get voicePanelSettingsSectionTitle => 'Налаштування голосу';

  @override
  String get voicePanelUseEarpieceLabel => 'Використовувати слухавку';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Показувати лише відео';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Показувати лише учасників із увімкненою камерою.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Показувати мою камеру';

  @override
  String get voicePrioritizeSpeakersLabel => 'Пріоритет для тих, хто говорить';

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
  String get privacyDashboardProfilePrivacySection =>
      'Конфіденційність профілю';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Друзі та прямі повідомлення';

  @override
  String get privacyDashboardActivitySharingSection =>
      'Поширення інформації про активність';

  @override
  String get privacyDashboardSensitiveContentSection => 'Конфіденційний вміст';

  @override
  String get privacyDashboardDataExportSection => 'Експорт даних';

  @override
  String get privacyDashboardDataDeletionSection => 'Видалення даних';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Хто може бачити ваш повний профіль';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Друзі та всі спільноти';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Ваш повний профіль бачать друзі та всі учасники ваших спільнот';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Лише друзі та невеликі спільноти';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Ваш повний профіль бачать друзі та учасники спільнот із 200 або менше учасниками';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Лише друзі';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Ваш повний профіль бачать лише ваші друзі';

  @override
  String get privacyDashboardFriendRequestsTitle =>
      'Запити на додавання в друзі';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Усі';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Дозволити будь-кому надсилати вам запити на додавання в друзі';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends => 'Друзі друзів';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Дозволити друзям ваших друзів надсилати вам запити';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Учасники спільноти';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Дозволити учасникам спільнот, до яких ви належите, надсилати вам запити';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Приватні повідомлення';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Дозволити особисті повідомлення від учасників спільноти';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Дозволити учасникам спільнот, у яких ви перебуваєте, надсилати вам прямі повідомлення';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Дозволити прямі повідомлення від ботів спільноти';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Дозволити ботам із спільнот, у яких ви перебуваєте, надсилати вам прямі повідомлення';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Керуйте тим, хто може надсилати вам запити на додавання в друзі та прямі повідомлення';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Керуйте тим, хто може вам телефонувати та додавати вас до групових чатів';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Вхідні дзвінки';

  @override
  String get privacyDashboardIncomingCallsDesc =>
      'Керуйте тим, хто може вам телефонувати';

  @override
  String get privacyDashboardAllowedCallers => 'Дозволені абоненти';

  @override
  String get privacyDashboardIncomingCallNobody => 'Нікого';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Блокувати всі вхідні виклики';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Тільки друзі';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Дозволяти дзвонити вам лише друзям (рекомендовано)';

  @override
  String get privacyDashboardIncomingCallCustom => 'Друзі + Інше';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Дозволити друзям та додатковим групам, які ви оберете';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Усі';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Дозволити будь-кому телефонувати вам, навіть незнайомцям';

  @override
  String get privacyDashboardAdditionalGroups => 'Додаткові групи';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'Люди, які є друзями ваших друзів, можуть вам телефонувати';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'Люди зі спільнот, у яких ви обоє перебуваєте, зможуть вам телефонувати';

  @override
  String get privacyDashboardRingBehavior => 'Поведінка кільця';

  @override
  String get privacyDashboardSilentCalls => 'Безшумні дзвінки від усіх';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'Усі дзвінки сповіщатимуть тихо замість дзвінка. За замовчуванням дзвінки від незнайомих людей завжди тихі.';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Хто може додавати вас до групових чатів';

  @override
  String get privacyDashboardGroupDmDesc =>
      'Керуйте тим, хто може додавати вас до групових чатів без дозволу. Будь-хто все ще може надсилати вам посилання-запрошення для приєднання.';

  @override
  String get privacyDashboardAllowedInvites => 'Дозволені запрошення';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Не дозволяйте нікому додавати вас до групових чатів без дозволу';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Дозволити додавати вас без запиту лише друзям (рекомендовано)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Дозволити друзям та додатковим групам додавати вас';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Дозволити будь-кому додавати вас до групових чатів без запиту';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'Люди, які є друзями ваших друзів, можуть додавати вас до групових чатів';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'Люди з ваших спільних спільнот можуть додавати вас до групових чатів';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Голосова активність у «Зараз активні»';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Ділитися голосовою активністю з друзями';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Ділитися голосовою активністю з усіма друзями?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Припинити ділитися голосовою активністю з усіма друзями?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Ви збираєтеся почати ділитися своєю голосовою активністю з усіма друзями, включно з майбутніми. Це надішле оновлення всім їм, і змінити це можна буде лише через 24 години.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Ви збираєтеся припинити ділитися своєю голосовою активністю з усіма друзями, включно з майбутніми. Це надішле оновлення всім їм і може бути змінено знову лише через 24 години.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Так, поділитися з усіма друзями';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm =>
      'Так, припинити поширення';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Буде доступно через $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Налаштування спільного доступу до голосової активності оновлено';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Не вдалося оновити спільний доступ до голосової активності';

  @override
  String get privacyDashboardDataExportDesc =>
      'Створіть архів даних свого облікового запису для завантаження, включно з повідомленнями та URL-адресами вкладень. Більшість людей хочуть усе, але ви можете звузити обсяг нижче.';

  @override
  String get privacyDashboardExportMyData => 'Експортувати мої дані';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Назавжди видалити надіслані вами повідомлення в особистих чатах, групових чатах та спільнотах. Процес виконується у фоновому режимі, і ви отримаєте особисте повідомлення після його завершення.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Видалити мої повідомлення';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Дозволити особисті повідомлення від учасників спільноти?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Блокувати особисті повідомлення від учасників спільноти?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Дозволити ботам надсилати вам прямі повідомлення?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Блокувати ботів від надсилання вам прямих повідомлень?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Чи бажаєте ви також дозволити прямі повідомлення від учасників ваших наявних спільнот?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Ви також бажаєте блокувати особисті повідомлення від учасників ваших наявних спільнот?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Чи дозволяєте ви ботам з наявних спільнот надсилати вам особисті повідомлення?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Ви також бажаєте заблокувати ботів зі своїх наявних спільнот?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'Ви також можете змінити цю настройку для кожної спільноти, натиснувши й утримуючи назву спільноти та вибравши \"Налаштування конфіденційності\".';

  @override
  String get privacyDashboardDmConfirmAllowAll => 'Дозволити для всіх спільнот';

  @override
  String get privacyDashboardDmConfirmBlockAll => 'Блокувати в усіх спільнотах';

  @override
  String get privacyDashboardDmConfirmSkip => 'Пропустити цей крок';

  @override
  String get privacyDashboardDataRequestGoBack => 'Назад';

  @override
  String get privacyDashboardDataRequestExportTitle => 'Експортувати мої дані';

  @override
  String get privacyDashboardDataRequestDeleteTitle =>
      'Видалити мої повідомлення';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'Ми обробимо це якомога швидше. Ви отримаєте електронний лист, коли ваш архів буде готовий.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'Ми обробимо це якомога швидше. Ви отримаєте від нас особисте повідомлення, коли все буде готово.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'Що включити';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Усе';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Експортувати всі надіслані вами повідомлення, а також усі налаштування облікового запису, членство та метадані.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'Вибірково';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Виберіть типи бесід, спільноти та часовий проміжок, які потрібно включити в архів.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Виберіть, що включити';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Виберіть, які типи бесід потрібно очистити.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Лише місця, до яких я більше не маю доступу';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Видалити повідомлення лише зі спільнот і групових приватних чатів, які ви покинули або з яких вас видалили.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Які бесіди';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Увімкніть типи бесід, які ви хочете включити.';

  @override
  String get privacyDashboardDataRequestKindDms => 'Відкриті приватні чати';

  @override
  String get privacyDashboardDataRequestKindDmsClosed =>
      'Закриті приватні повідомлення';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'Групові приватні чати';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Спільноти';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Які спільноти';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Фільтр спільноти';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Включити всі, крім вибраних';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude => 'Лише вибрані';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'Зараз ви не є учасником жодної спільноти.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Проміжок часу';

  @override
  String get privacyDashboardDataRequestDateMode => 'Проміжок часу';

  @override
  String get privacyDashboardDataRequestAllTime => 'За весь час';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Вибрати діапазон';

  @override
  String get privacyDashboardDataRequestStartDate => 'Дата початку';

  @override
  String get privacyDashboardDataRequestEndDate => 'Дата закінчення';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Залиште будь-яке поле пустим, щоб не обмежувати цей кінець періоду.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Виберіть принаймні один тип бесід для включення.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'Дата початку має бути раніше дати завершення.';

  @override
  String get privacyDashboardDataRequestConfirmTitle =>
      'Перегляньте та підтвердьте';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'Ми створимо архів усіх повідомлень, які ви коли-небудь надсилали, і надішлемо вам електронний лист, коли він буде готовий. Посилання для завантаження в цьому листі дійсне протягом 7 днів.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'Ми створимо архів для завантаження, який відповідає наведеним нижче фільтрам, і надішлемо вам електронний лист, коли він буде готовий. Посилання для завантаження в цьому листі дійсне протягом 7 днів.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Назавжди видалити повідомлення, що відповідають фільтрам нижче. Цю дію не можна скасувати.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'Після початку відновлення неможливе. Ми надішлемо вам особисте повідомлення, коли процес завершиться.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'Запит на експорт';

  @override
  String get privacyDashboardDataRequestDeleteMessages =>
      'Видалити повідомлення';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Область пошуку';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'Бесіди';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Спільноти';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Проміжок часу';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'Немає';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'З $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'До $end';
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
      other: '# спільнот',
      many: '# спільнот',
      few: '# спільнот',
      one: '# спільноти',
    );
    return 'Усі, крім $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# спільноти',
      many: '# спільнот',
      few: '# спільноти',
      one: '# спільнота',
    );
    return 'Лише $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Відкриті приватні чати';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Закриті приватні повідомлення';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Особисті повідомлення (відкриті та закриті)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms =>
      'Групові приватні чати';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Спільноти';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# годин',
      many: '# годин',
      few: '# години',
      one: '# година',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# хвилин',
      many: '# хвилин',
      few: '# хвилини',
      one: '# хвилина',
    );
    return '$_temp0 і $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# години',
      many: '# годин',
      few: '# години',
      one: '# година',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# хвилини',
      many: '# хвилин',
      few: '# хвилини',
      one: '# хвилина',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# секунди',
      many: '# секунд',
      few: '# секунди',
      one: '# секунда',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed =>
      'Не вдалося завантажити налаштування конфіденційності';

  @override
  String get privacyDashboardRetry => 'Повторити';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Не вдалося зберегти налаштування конфіденційного вмісту.';

  @override
  String get privacyDashboardDataRequestFailed => 'Не вдалося виконати запит.';

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
      'Очікування завершення повільного режиму в одному або кількох вибраних каналах.';

  @override
  String get slowmodeRateLimitedTitle => 'Увімкнено повільний режим';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'Увімкнено повільний режим — зачекайте $duration, перш ніж надсилати наступне повідомлення.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'Пряме завантаження вимкнено під час повільного режиму.';

  @override
  String get shareMediaTitle => 'Поділитися в';

  @override
  String get shareMediaMessageHint => 'Додайте необов\'язкове повідомлення…';

  @override
  String get shareMediaSendButton => 'Надіслати';

  @override
  String get shareMediaSuccessToast => 'Медіа надіслано';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'Надіслано до $count призначення';
  }

  @override
  String get shareMediaFailedToast => 'Не вдалося надіслати медіа';

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
  String get chatMessageCopyEmbedText => 'Скопіювати текст вбудовування';

  @override
  String get chatMessageTranslate => 'Перекласти';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Перекладено з $language';
  }

  @override
  String get chatMessageSeeOriginal => 'Переглянути оригінал';

  @override
  String get chatMessageSeeTranslation => 'Переглянути переклад';

  @override
  String get chatMessageTranslating => 'Переклад…';

  @override
  String get chatMessageTranslateFailed =>
      'Не вдалося перекласти це повідомлення.';

  @override
  String get chatMessageTranslateUnavailable =>
      'Переклад недоступний на цьому пристрої.';

  @override
  String get chatMessageSpeak => 'Озвучити повідомлення';

  @override
  String get chatMessageStopSpeaking => 'Припинити говорити';

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
  String get chatMessageOpenLink => 'Відкрити посилання';

  @override
  String get chatMessageCopyLink => 'Копіювати посилання';

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
  String get chatReactionAddFailed => 'Не вдалося додати реакцію';

  @override
  String get chatReactionRemoveFailed => 'Не вдалося видалити реакцію';

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
  String get chatMessageDeleteAttachment => 'Видалити вкладення';

  @override
  String get chatMessageEditAttachmentAltText =>
      'Редагувати альтернативний текст';

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
      other: '$count заблокованих повідомлень',
      one: '1 заблоковане повідомлення',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count потенційних спам-повідомлень',
      one: '1 потенційний спам-повідомлення',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Відповідь приховано, оскільки оригінального автора заблоковано.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Відповідь приховано, оскільки оригінального автора позначено як спамера.';

  @override
  String get devMarkAsSpamLocally => 'Позначити як спам локально';

  @override
  String get devIgnoreSpamFlag => 'Ігнорувати позначку спаму';

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
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

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
  String get mediaViewerOptions => 'Параметри медіа';

  @override
  String get mediaViewerCopyLink => 'Копіювати посилання';

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
    return 'Вкладення $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Закрити';

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
  String get composerAutocompleteSuggestions => 'Пропозиції';

  @override
  String get composerAutocompleteCommandsHeading => 'Команди';

  @override
  String get composerAutocompleteChoicesHeading => 'Варіанти';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'Необов\'язкові аргументи';

  @override
  String get composerAutocompleteChannelsHeading => 'Канали';

  @override
  String get composerAutocompleteMembersHeading => 'Учасники';

  @override
  String get composerAutocompleteUsersHeading => 'Користувачі';

  @override
  String get composerAutocompleteMentionsHeading => 'Згадки';

  @override
  String get composerAutocompleteRolesHeading => 'Ролі';

  @override
  String get composerAutocompleteMediaHeading => 'Медіа';

  @override
  String get composerAutocompleteStickersHeading => 'Стікери';

  @override
  String get composerAutocompleteGifsHeading => 'GIF-и';

  @override
  String get composerAutocompleteNoGifs => 'GIF не знайдено';

  @override
  String get composerCommandShrugDescription =>
      'Додає ¯\\_(ツ)_/¯ до вашого повідомлення.';

  @override
  String get composerCommandTableflipDescription =>
      'Додає (╯°□°)╯︵ ┻━┻ до вашого повідомлення.';

  @override
  String get composerCommandUnflipDescription =>
      'Додає ┬─┬ ノ( ゜-゜ノ) до вашого повідомлення.';

  @override
  String get composerCommandMeDescription =>
      'Надіслати повідомлення дії (відображається курсивом).';

  @override
  String get composerCommandSpoilerDescription =>
      'Надіслати повідомлення зі спойлером (загортає в теги спойлера).';

  @override
  String get composerCommandTtsDescription =>
      'Надіслати повідомлення з озвученням тексту.';

  @override
  String get composerCommandNickDescription =>
      'Змінити ваш нік у цій спільноті.';

  @override
  String get composerCommandKickDescription =>
      'Видалити учасника зі спільноти.';

  @override
  String get composerCommandBanDescription =>
      'Заблокувати учасника в цій спільноті.';

  @override
  String get composerCommandMsgDescription =>
      'Надіслати особисте повідомлення користувачу.';

  @override
  String get composerCommandSavedDescription =>
      'Надіслати збережений медіафайл.';

  @override
  String get composerCommandStickerDescription => 'Надіслати стікер.';

  @override
  String get composerCommandGifDescription => 'Знайти та надіслати GIF.';

  @override
  String get composerCommandMemberOption => 'Учасник, якого потрібно вибрати.';

  @override
  String get composerCommandReasonOption => 'Причина (необов\'язково).';

  @override
  String get composerCommandMessageOption => 'Повідомлення для надсилання.';

  @override
  String get composerCommandQueryOption => 'Що шукати.';

  @override
  String get composerCommandNicknameOption =>
      'Ваш новий нікнейм або залиште порожнім, щоб скинути його.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'Скільки останніх повідомлень учасника видалити.';

  @override
  String get composerCommandDeleteMessagesNone => 'Не видаляти жодних';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Попередні $count дні';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'Попередні 24 години';

  @override
  String get composerCommandOptionRequired =>
      'Цей параметр є обов\'язковим. Будь ласка, надайте значення.';

  @override
  String get composerCommandClear => 'Очистити команду';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'Ви змінили свій нікнейм у цій спільноті з **$previousNickname** на **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'Невідомий користувач';

  @override
  String composerCommandMsgFailed(String username) {
    return 'Не вдалося надіслати повідомлення **$username**. Можливо, в них вимкнено особисті повідомлення, або вас заблокували.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+ $count більше';
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
  String get addGuildCreateTitle => 'Створити спільноту';

  @override
  String get addGuildCreateDescription =>
      'Створіть спільноту для спілкування з друзями.';

  @override
  String get addGuildCreateNameLabel => 'Назва спільноти';

  @override
  String get addGuildCreateSubmit => 'Створити спільноту';

  @override
  String get addGuildCreateFailed =>
      'Не вдалося створити спільноту. Спробуйте ще раз.';

  @override
  String get addGuildCreateClaimTitle => 'Зареєструйте свій обліковий запис';

  @override
  String get addGuildCreateClaimDescription =>
      'Щоб створити спільноту, потрібно підтвердити свій обліковий запис.';

  @override
  String get addGuildCreateVerifyTitle => 'Підтвердьте свою електронну пошту';

  @override
  String get addGuildCreateVerifyDescription =>
      'Щоб створити спільноту, потрібно підтвердити свою електронну адресу.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Анімовані іконки не підтримуються під час створення нової спільноти. Використовуйте статичне зображення.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'Створюючи спільноту, ви погоджуєтеся дотримуватися та підтримувати ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return 'Правила спільноти $productName';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'На цьому сервері вже є одна спільнота, тому створювати додаткові не можна.';

  @override
  String get addGuildCreateChangeIcon => 'Змінити іконку';

  @override
  String get addGuildCreateIconLabel => 'Іконка спільноти';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Макс. 10 МБ. Рекомендовано: 512×512 пікс.';

  @override
  String get addGuildImportDescription =>
      'Вставте URL-адресу шаблону Discord, щоб імпортувати його структуру до нової спільноти.';

  @override
  String get addGuildImportUrlLabel => 'URL шаблону';

  @override
  String get addGuildImportUrlInvalid =>
      'Введіть дійсну URL-адресу або код шаблону Discord.';

  @override
  String get addGuildImportFetchFailed =>
      'Не вдалося отримати шаблон спільноти. Можливо, шаблон не існує або зовнішня служба недоступна.';

  @override
  String get addGuildImportInvalidResponse =>
      'Це не схоже на дійсну відповідь шаблону.';

  @override
  String get addGuildImportTemplateLabel => 'Шаблон';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount текстових, $voiceChannelCount голосових, $categoryCount категорій, $roleCount ролей';
  }

  @override
  String get addGuildImportRemoveIcon => 'Видалити іконку';

  @override
  String get addGuildImportTemplateInvalid =>
      'Дані шаблону спільноти недійсні або мають неправильний формат.';

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
  String get channelDetailsFallbackTitle => 'Деталі';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'Груповий приватний чат · $count учасників';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'Закрити розмову з $name?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'Вийти з $name?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Налаштування каналу';

  @override
  String get channelDetailsGroupSettingsTitle => 'Налаштування групи';

  @override
  String get channelDetailsDmSettingsTitle =>
      'Налаштування приватного повідомлення';

  @override
  String get channelDetailsInvitePeople => 'Запросити людей';

  @override
  String get channelDetailsCopyLink => 'Копіювати посилання';

  @override
  String get channelMenuCopyChannelLink => 'Копіювати посилання на канал';

  @override
  String get channelMenuCopyRedirectLink =>
      'Копіювати посилання для переадресації';

  @override
  String get channelDetailsAddFriendsToGroup => 'Додати друзів у групу';

  @override
  String get channelDetailsGroupInvites => 'Запрошення в групу';

  @override
  String get channelDetailsEditChannel => 'Редагувати канал';

  @override
  String get channelDetailsDeleteChannel => 'Видалити канал';

  @override
  String get channelSettingsCategorySettingsTitle => 'Налаштування категорії';

  @override
  String get channelSettingsEditCategory => 'Редагувати категорію';

  @override
  String get channelSettingsTabOverview => 'Огляд';

  @override
  String get channelSettingsTabPermissions => 'Дозволи';

  @override
  String get channelSettingsTabInvites => 'Запрошення';

  @override
  String get channelSettingsTabWebhooks => 'Вебхуки';

  @override
  String get channelSettingsDeleteChannel => 'Видалити канал';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'Ви впевнені, що хочете видалити $channelName? Це неможливо скасувати.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'Ви впевнені, що хочете видалити $categoryName? Це неможливо скасувати.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Видалити категорію';

  @override
  String get channelSettingsChannelUpdated => 'Канал оновлено';

  @override
  String get channelSettingsChannelName => 'Назва каналу';

  @override
  String get channelSettingsCategoryName => 'Назва категорії';

  @override
  String get channelSettingsMyCategory => 'Моя категорія';

  @override
  String get categoryExpandCategory => 'Розгорнути категорію';

  @override
  String get categoryCollapseCategory => 'Згорнути категорію';

  @override
  String get categoryExpandAllCategories => 'Розгорнути всі категорії';

  @override
  String get categoryCollapseAllCategories => 'Згорнути всі категорії';

  @override
  String get categoryMuteCategory => 'Вимкнути сповіщення категорії';

  @override
  String get categoryUnmuteCategory => 'Увімкнути сповіщення категорії';

  @override
  String get categoryCopyCategoryId => 'Копіювати ID категорії';

  @override
  String get categoryIdCopied => 'Ідентифікатор категорії скопійовано';

  @override
  String get channelSettingsChannelNamePlaceholder => 'загальні';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'Тема';

  @override
  String get channelSettingsTopicPlaceholder => 'Додати тему до цього каналу';

  @override
  String get channelSettingsInsertEmoji => 'Вставити емодзі';

  @override
  String get channelSettingsTopicTooLongTitle => 'Тема каналу задовга.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'Скоротіть тему та спробуйте ще раз.';

  @override
  String get channelSettingsSlowmode => 'Повільний режим';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Час між повідомленнями. «$bypassSlowmodePermissionLabel» може це обійти.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Вимкнено';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds секунд';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes хв';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours год.';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute хвилина';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour година';
  }

  @override
  String get channelSettingsVoiceQuality => 'Якість голосу';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'Вища частота дискретизації = краща якість і вище використання трафіку.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits тис. біт/с';
  }

  @override
  String get channelSettingsParticipantLimit => 'Обмеження учасників';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Максимальна кількість учасників, які можуть приєднатися одночасно. 0 означає без обмежень.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count учасників',
      one: '1 учасник',
      zero: '∞ Без обмежень',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Ліміт підключень';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Максимальна кількість активних з\'єднань, які один учасник може підтримувати в цьому каналі.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count з\'єднань',
      one: '1 з\'єднання',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Регіон для голосового зв\'язку';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Виберіть голосовий регіон для цього каналу. Автоматичний вибирає найближчий регіон.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Автоматично';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'Не вдалося завантажити голосові регіони';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Спробуйте ще раз за мить.';

  @override
  String get channelSettingsResetSlider =>
      'Скинути повзунок до значення за замовчуванням';

  @override
  String get channelSettingsAdvanced => 'Додатково';

  @override
  String get channelSettingsMatureContentOverride =>
      'Перевизначення для контенту для дорослих';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Заборонити налаштування рівня $scopeLevel для цього каналу. Контент для дорослих буде показуватися за захисним екраном перед входом.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Успадкувати';

  @override
  String get channelSettingsMatureContentOn => 'Увімкнено';

  @override
  String get channelSettingsMatureContentOff => 'Вимкнено';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Позначає цей канал як такий, що містить контент для дорослих.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Залишити цей канал відкритим для контенту для дорослих.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Успадковано від $inheritedSourceLabel: увімкнено';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Успадковано від $inheritedSourceLabel: вимкнено';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'Категорія';

  @override
  String get channelSettingsMatureContentCommunitySource => 'спільноти';

  @override
  String get channelSettingsMatureContentCategoryScope => 'Категорія';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Спільнота';

  @override
  String get channelSettingsContentWarningToggle =>
      'Показувати попередження про вміст у цьому каналі';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Увімкнути запит на згоду перед входом у цей канал.';

  @override
  String get channelSettingsContentWarningText => 'Власний текст попередження';

  @override
  String get channelSettingsContentWarningDefault =>
      'Цей вміст може бути чутливим.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'Щоб редагувати ці дозволи, вам потрібен дозвіл \"$manageChannelsPermissionLabel\".';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'Щоб редагувати ці дозволи, вам потрібен дозвіл \"$manageRolesPermissionLabel\".';
  }

  @override
  String get channelSettingsUnknownRole => 'Невідома роль';

  @override
  String get channelSettingsUnknownUser => 'Невідомий користувач';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides =>
      'Перевизначення доступу';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Редагувати доступ для $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'Назад до перевизначень';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Налаштуйте базовий доступ для цього каналу';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Налаштувати перевизначення для цієї ролі';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Налаштувати винятки для цього учасника';

  @override
  String get channelSettingsPermissionsSearchPlaceholder => 'Пошук дозволів…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Доступ до каналу оновлено';

  @override
  String get channelSettingsPermissionsTitle => 'Керування доступом';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'Цей канал синхронізовано з батьківською категорією ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'Цей канал не синхронізовано з батьківською категорією ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory =>
      'Синхронізувати з категорією';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'Канал синхронізовано з батьківською категорією';

  @override
  String get channelSettingsPermissionsAddOverride => 'Додати перевизначення';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Пошук ролей або учасників…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => 'Ролі та учасники';

  @override
  String get channelSettingsDeleteInvite => 'Видалити запрошення';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Видалити це запрошення? Цю дію не можна скасувати.';

  @override
  String get channelSettingsCopyInviteCode => 'Копіювати код запрошення';

  @override
  String get channelSettingsCopyInviteUrl => 'Копіювати посилання-запрошення';

  @override
  String get channelSettingsWebhookCreated => 'Вебхук створено';

  @override
  String get channelSettingsWebhookCreateFailed => 'Не вдалося створити вебхук';

  @override
  String get channelSettingsCreateWebhook => 'Створити вебхук';

  @override
  String get channelSettingsInvitesDescription =>
      'Керуйте посиланнями-запрошеннями для цього каналу.';

  @override
  String get channelSettingsInvitesCreate => 'Створити запрошення';

  @override
  String get channelSettingsInvitesEmpty => 'Немає посилань-запрошень';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'Цей канал ще не має посилань-запрошень. Створіть одне, щоб запросити людей на цей канал.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Під час завантаження посилань-запрошень для цього каналу сталася помилка. Спробуйте ще раз.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Керуйте вхідними вебхуками, які можуть надсилати повідомлення в цей канал.';

  @override
  String get channelSettingsWebhooksEmpty => 'Вебхуків немає';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'Для цього каналу не налаштовано жодних вебхуків. Створіть вебхук, щоб дозволити зовнішнім програмам надсилати повідомлення.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Цей канал не підтримує вебхуки.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'Щоб переглядати та редагувати вебхуки для цього каналу, вам потрібен дозвіл \"$permission\".';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'Не вдалося завантажити вебхуки';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Під час завантаження вебхуків для цього каналу сталася помилка. Спробуйте ще раз.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Створено $creator $date';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'Невідомий користувач';

  @override
  String get channelSettingsWebhooksAvatar => 'Аватар';

  @override
  String get channelSettingsWebhooksUploadImage => 'Завантажити зображення';

  @override
  String get channelSettingsWebhooksRemove => 'Видалити';

  @override
  String get channelSettingsWebhooksName => 'Назва';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Назва вебхука';

  @override
  String get channelSettingsWebhooksChannel => 'Канал';

  @override
  String get channelSettingsWebhooksUrl => 'URL вебхука';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Копіювати URL вебхука';

  @override
  String get channelSettingsWebhooksDelete => 'Видалити вебхук';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'Не вдалося видалити цей вебхук';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'Видалити цей вебхук? Це неможливо скасувати.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Спробуйте ще раз за мить.';

  @override
  String get channelMenuOpenChat => 'Відкрити чат';

  @override
  String get channelMenuDuplicateChannel => 'Дублювати канал';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Скинути стан згоди на показ контенту для дорослих';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Видалити ваші повідомлення в цьому каналі?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Буде назавжди видалено всі повідомлення, які ви коли-небудь надсилали в цьому каналі. Цю дію не можна скасувати.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Видалити мої повідомлення';

  @override
  String get channelMenuDeletedYourMessages => 'Ви видалили свої повідомлення';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'Не вдалося видалити ваші повідомлення';

  @override
  String get channelDetailsSystemMessage => 'Системне повідомлення';

  @override
  String get channelDetailsTextChannel => 'Текстовий канал';

  @override
  String get channelDetailsVoiceChannel => 'Голосовий канал';

  @override
  String get channelDetailsCategory => 'Категорія';

  @override
  String get channelDetailsLinkChannel => 'Прив\'язати канал';

  @override
  String get channelDetailsGenericChannel => 'Канал';

  @override
  String get channelDetailsMutedConversation => 'Вимкнути сповіщення';

  @override
  String get channelDetailsUnmutedConversation => 'Розмову розм\'ючено';

  @override
  String get channelDetailsMutedChannel => 'Канал вимкнено';

  @override
  String get channelDetailsUnmutedChannel => 'Канал розблоковано';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Налаштування сповіщень оновлено';

  @override
  String get channelDetailsTabMembers => 'Учасники';

  @override
  String get channelDetailsTabPins => 'Закріплені';

  @override
  String get channelDetailsActionMute => 'Вимкнути сповіщення';

  @override
  String get channelDetailsActionUnmute => 'Увімкнути сповіщення';

  @override
  String get channelDetailsActionSearch => 'Пошук';

  @override
  String get channelDetailsActionMore => 'Більше';

  @override
  String get channelDetailsMembersEmptyTitle => 'Немає учасників';

  @override
  String get channelDetailsMembersEmptyBody =>
      'Учасники з’являться тут, щойно дані спільноти буде завантажено.';

  @override
  String get memberListPermissionDeniedTitle =>
      'Ви не можете переглядати учасників';

  @override
  String get memberListPermissionDeniedBody =>
      'Ви не можете переглядати учасників цього каналу в цій спільноті';

  @override
  String get memberListUnavailableTitle => 'Список учасників недоступний';

  @override
  String get memberListUnavailableBody =>
      'Списки учасників тимчасово недоступні в цій спільноті';

  @override
  String get channelDetailsPinsLoadFailedTitle =>
      'Не вдалося завантажити закріплені повідомлення';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'Учасники з дозволом «Закріплювати повідомлення» можуть закріплювати повідомлення, щоб їх бачили всі.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'Ви можете закріплювати повідомлення в цій розмові, щоб їх бачили всі.';

  @override
  String get channelDetailsPinsEndReached => 'Ви досягли кінця';

  @override
  String get channelHeaderOpenDetails => 'Відкрити деталі каналу';

  @override
  String get channelHeaderPinnedMessages => 'Закріплені повідомлення';

  @override
  String get channelHeaderPinnedMessagesUnread =>
      'Закріплені повідомлення, непрочитані';

  @override
  String get channelHeaderMemberList => 'Список учасників';

  @override
  String get channelHeaderInbox => 'Вхідні';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Налаштування сповіщень, вимкнено звук';

  @override
  String get channelDetailsSearchTitle => 'Пошук';

  @override
  String get channelDetailsSearchHint => 'Шукати повідомлення';

  @override
  String get channelDetailsSearchFilterFrom => 'Від';

  @override
  String get channelDetailsSearchFilterHas => 'Має';

  @override
  String get channelDetailsSearchFilterIn => 'У';

  @override
  String get channelDetailsSearchFilterMentions => 'Згадки';

  @override
  String get channelDetailsSearchFilterMore => 'Більше';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Активна';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count канали';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count користувачів';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'Користувач';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Бот';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Вебхук';

  @override
  String get channelDetailsSearchFilterByChannel => 'Фільтрувати за каналом';

  @override
  String get channelDetailsSearchChannelsHint => 'Пошук каналів';

  @override
  String get channelDetailsSearchChannelsEmpty => 'Канали не знайдено';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Закріплені';

  @override
  String get channelDetailsSearchPinnedTrue => 'Лише закріплені';

  @override
  String get channelDetailsSearchPinnedFalse => 'Виключити закріплені';

  @override
  String get channelDetailsSearchClearFilter => 'Очистити';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Тип автора';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Дата';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Режим дати';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Виберіть дату';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Посилання на хост';

  @override
  String get channelDetailsSearchMoreFiltersFileName => 'Назва файлу містить';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'Розширення файлу';

  @override
  String get channelDetailsSearchContentPoll => 'Опитування';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'Повідомлення з опитуванням';

  @override
  String get channelDetailsSearchContentForward => 'Переслати';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Переслані повідомлення';

  @override
  String get channelDetailsSearchFilterSort => 'Сортувати';

  @override
  String get channelHeaderSearchFiltersTitle => 'Фільтри пошуку';

  @override
  String get channelHeaderSearchRecentTitle => 'Нещодавні пошуки';

  @override
  String get channelHeaderSearchUsersTitle => 'Користувачі';

  @override
  String get channelHeaderSearchChannelsTitle => 'Канали';

  @override
  String get channelHeaderSearchValuesTitle => 'Значення';

  @override
  String get channelHeaderSearchDatesTitle => 'Дати';

  @override
  String get channelHeaderSearchDefaultBadge => 'Типово';

  @override
  String get channelHeaderSearchClearHistory => 'Очистити';

  @override
  String get channelHeaderSearchFilterDescFrom => 'користувач';

  @override
  String get channelHeaderSearchFilterDescMentions => 'користувач';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'посилання, вбудовані елементи, зображення, відео, звук, файл, стікер, …';

  @override
  String get channelHeaderSearchFilterDescBefore => 'дата або діапазон дат';

  @override
  String get channelHeaderSearchFilterDescOn => 'дата або діапазон дат';

  @override
  String get channelHeaderSearchFilterDescDuring => 'дата або діапазон дат';

  @override
  String get channelHeaderSearchFilterDescAfter => 'дата або діапазон дат';

  @override
  String get channelHeaderSearchFilterDescIn => 'канал';

  @override
  String get channelHeaderSearchFilterDescPinned => 'так чи ні';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'користувач, бот або вебхук';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'хост, наприклад example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'частина назви файлу вкладення';

  @override
  String get channelHeaderSearchFilterDescFileType =>
      'розширення файлу, наприклад png';

  @override
  String get channelHeaderSearchFilterDescSort => 'за часом або релевантністю';

  @override
  String get channelHeaderSearchFilterDescOrder =>
      'за зростанням або спаданням';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString результатів',
      one: '1 результат',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'Фільтрувати за користувачем';

  @override
  String get channelDetailsSearchFilterByContent => 'Фільтрувати за вмістом';

  @override
  String get channelDetailsSearchSortBy => 'Сортувати результати за';

  @override
  String get channelDetailsSearchIn => 'Шукати в';

  @override
  String get channelDetailsSearchEmptyTitle => 'Шукати в цій розмові';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Введіть текст, автора або фільтр вмісту, щоб знайти повідомлення.';

  @override
  String get channelDetailsSearchIndexingTitle => 'Повідомлення індексуються';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Спробуйте ще раз невдовзі, коли пошук завершить індексацію цієї області.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Немає результатів';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Спробуйте інші пошукові запити або фільтри.';

  @override
  String get channelDetailsMembersOnline => 'Онлайн';

  @override
  String get channelDetailsMembersOffline => 'Не в мережі';

  @override
  String get channelDetailsMemberYou => 'Ви';

  @override
  String get channelDetailsSearchUsersHint => 'Шукати користувачів';

  @override
  String get channelDetailsSearchUsersTypeToSearch =>
      'Введіть текст для пошуку учасників';

  @override
  String get channelDetailsSearchUsersEmpty => 'Користувачів не знайдено';

  @override
  String get channelDetailsSearchUsersNoAvailable =>
      'Немає доступних користувачів';

  @override
  String get channelDetailsDone => 'Готово';

  @override
  String get channelDetailsHasFilterPrompt =>
      'Показати повідомлення, що містять:';

  @override
  String get channelDetailsRetry => 'Повторити';

  @override
  String get channelDetailsPinnedMessageTitle => 'Закріплене повідомлення';

  @override
  String get channelDetailsSearchResultTitle => 'Результат пошуку';

  @override
  String get channelDetailsJumpToMessage => 'Перейти до повідомлення';

  @override
  String get channelDetailsUnpinMessage => 'Скасувати закріплення повідомлення';

  @override
  String get channelDetailsCopyMessageLink =>
      'Скопіювати посилання на повідомлення';

  @override
  String get channelDetailsCopyMessageId => 'Скопіювати ID повідомлення';

  @override
  String get channelDetailsMessageUnpinned => 'Повідомлення відкріплено';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Поточна спільнота';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'Поточний приватний чат';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Усі спільноти';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild =>
      'Усі особисті повідомлення';

  @override
  String get channelDetailsSearchScopeAllDms => 'Усі приватні чати';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild =>
      'Лише відкриті особисті повідомлення';

  @override
  String get channelDetailsSearchScopeOpenDms => 'Відкриті приватні чати';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Усі приватні чати + спільноти';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Відкриті особисті чати та спільноти';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Шукати лише в цій спільноті';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Шукати лише в поточному чаті';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'У всіх спільнотах, до яких ви зараз долучені';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Лише в усіх особистих чатах, у яких ви коли-небудь були';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'У всіх ваших особистих чатах';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'У всіх відкритих приватних повідомленнях';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'У всіх відкритих вами особистих повідомленнях';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'У всіх особистих чатах та спільнотах, у яких ви зараз перебуваєте';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'У всіх відкритих приватних чатах + усіх спільнотах, у яких ви зараз перебуваєте';

  @override
  String get channelDetailsSearchSortNewest => 'Спочатку найновіші';

  @override
  String get channelDetailsSearchSortOldest => 'Спочатку найстаріші';

  @override
  String get channelDetailsSearchSortRelevance => 'Найбільш релевантні';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Показувати найновіші повідомлення спочатку';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Показувати найстаріші повідомлення спочатку';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Показувати найрелевантніші повідомлення спочатку';

  @override
  String get channelDetailsSearchContentImage => 'Завантаження зображення';

  @override
  String get channelDetailsSearchContentVideo => 'Завантаження відео';

  @override
  String get channelDetailsSearchContentAudio => 'Аудіозапис';

  @override
  String get channelDetailsSearchContentFile => 'Завантаження файлу';

  @override
  String get channelDetailsSearchContentLink => 'Посилання';

  @override
  String get channelDetailsSearchContentEmbed =>
      'Попередній перегляд посилання або вбудований контент';

  @override
  String get channelDetailsSearchContentSticker => 'Стікер';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Лише завантажені зображення';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Лише завантажені відеофайли';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Лише завантажені аудіофайли';

  @override
  String get channelDetailsSearchContentFileDescription =>
      'Будь-яке завантажене вкладення';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'Введено URL в тексті повідомлення';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Вирішені попередні перегляди та розширені вбудовування, а не завантаження';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Стікер прикріплено до повідомлення';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count типи';
  }

  @override
  String get personalNotesTitle => 'Особисті нотатки';

  @override
  String get personalNotesSubtitle =>
      'Ваш приватний простір для думок і нагадувань';

  @override
  String groupDmWelcome(String displayName) {
    return 'Ласкаво просимо до $displayName. Додайте друзів, щоб розпочати групу.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Редагувати групу';

  @override
  String get groupDmWelcomeAddFriends => 'Додати друзів у групу';

  @override
  String get dmGroupInvites => 'Запрошення';

  @override
  String get groupDmEditTitle => 'Редагувати групу';

  @override
  String get groupDmEditDetailsTooltip => 'Редагувати дані групи';

  @override
  String get groupDmGroupName => 'Назва групи';

  @override
  String get groupDmMyGroup => 'Моя група';

  @override
  String get groupDmGroupNameMaxLength =>
      'Назва групи не може перевищувати 100 символів';

  @override
  String get groupDmGroupIcon => 'Іконка групи';

  @override
  String get groupDmUploadIcon => 'Завантажити іконку';

  @override
  String get groupDmChangeIcon => 'Змінити іконку';

  @override
  String get groupDmRemoveIcon => 'Видалити іконку';

  @override
  String get groupDmUpdated => 'Групу оновлено';

  @override
  String get groupDmUpdateFailed =>
      'Не вдалося оновити групу. Спробуйте ще раз.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Анімовані іконки не підтримуються. Використовуйте статичне зображення.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Анімовані іконки не підтримуються';

  @override
  String get groupDmIconFileTooLargeTitle => 'Файл значка завеликий';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'Файл значка занадто великий. Виберіть файл розміром менше ніж $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'Непідтримуваний формат значка';

  @override
  String get groupDmUnsupportedIconFormatBody => 'Непідтримуваний тип файлу.';

  @override
  String get groupDmCouldntProcessImage => 'Не вдалося обробити зображення';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'Не вдалося обробити обрізане зображення. Спробуйте ще раз.';

  @override
  String get groupDmInvalidImage => 'Недійсне зображення';

  @override
  String get groupDmInvalidImageBody =>
      'Це зображення недійсне. Спробуйте інше.';

  @override
  String get groupDmAddFriends => 'Додати';

  @override
  String get groupDmOrSendInvite => 'або надішліть запрошення другу:';

  @override
  String get groupDmGenerateInviteLink => 'Згенерувати посилання-запрошення';

  @override
  String get groupDmCreateInvite => 'Створити';

  @override
  String get groupDmInviteExpires24Hours => 'Ваше запрошення дійсне 24 години';

  @override
  String get groupDmAddFriendFailed =>
      'Не вдалося додати цього друга до групи. Спробуйте ще раз.';

  @override
  String get groupDmAddFailed => 'Не вдалося додати до групи';

  @override
  String get groupDmGroupFull =>
      'Ця група заповнена. Видаліть когось, перш ніж додавати інших.';

  @override
  String get groupDmRateLimited =>
      'Ви надто поспішаєте. Зачекайте трохи й спробуйте знову.';

  @override
  String get groupDmCreateInviteFailed =>
      'Не вдалося створити посилання-запрошення';

  @override
  String get groupDmCreateInviteFailedBody =>
      'Не вдалося створити посилання-запрошення. Спробуйте ще раз.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'Не вдалося створити посилання-запрошення. Спробуйте ще раз.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'Ви не маєте дозволу на створення запрошення в цьому каналі.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'Ця спільнота досягла ліміту запрошень.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'Створення запрошень тимчасово вимкнено для цієї спільноти.';

  @override
  String get groupDmCopyInviteFailed =>
      'Не вдалося скопіювати посилання-запрошення';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Керувати запрошеннями може лише власник групи.';

  @override
  String get groupDmNoInvitesCreated => 'Запрошень не створено';

  @override
  String get groupDmLoadingInvites => 'Завантаження запрошень...';

  @override
  String get groupDmInvitesLoadFailed =>
      'Не вдалося завантажити запрошення. Спробуйте ще раз.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Скасувати це запрошення? Це не можна буде скасувати.';

  @override
  String get groupDmInviteRevoked => 'Запрошення скасовано';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Створено $name. Термін дії: $time.';
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
  String get composerOpenExpressionPicker => 'Відкрити вибір емодзі';

  @override
  String get composerShowKeyboard => 'Показати клавіатуру';

  @override
  String get composerCloseAttachmentPanel => 'Закрити вибір файлів';

  @override
  String get chatAttachmentPanelPhotos => 'Фотографії';

  @override
  String get chatAttachmentPanelFiles => 'Файли';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Потрібен доступ до фотогалереї';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Дозвольте доступ до фотогалереї, щоб переглядати та додавати нещодавні фото й відео.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Відкрити налаштування';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', надсилається';

  @override
  String get messageAccessibilityFailedSuffix => ', не вдалося надіслати';

  @override
  String get messageAccessibilityAttachmentSummary => 'вкладення';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count вкладень';
  }

  @override
  String get messageAccessibilityImageSummary => 'зображення';

  @override
  String get messageAccessibilityVideoSummary => 'відео';

  @override
  String get messageAccessibilityAudioSummary => 'аудіофайл';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'стікер $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'файл $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'вкладення зі спойлером';

  @override
  String get messageAccessibilityEmbedSummary => 'вбудований елемент';

  @override
  String get messageAccessibilityEmptySummary => 'повідомлення';

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
  String get userSettingsSearchPlaceholder => 'Шукати налаштування…';

  @override
  String get userSettingsSearchFieldLabel => 'Пошук налаштувань';

  @override
  String get userSettingsSearchClear => 'Очистити пошук';

  @override
  String get userSettingsSearchNoResults => 'Налаштувань не знайдено';

  @override
  String get userSettingsNavProfile => 'Профіль';

  @override
  String get userSettingsNavSecurityLogin => 'Безпека та вхід';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Подарунки';

  @override
  String get giftSettingsClaimAccountTitle =>
      'Зареєструйте свій обліковий запис';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Активуйте свій обліковий запис, щоб отримати або керувати кодами подарунків Plutonium.';

  @override
  String get giftSettingsRedeemTitle => 'Активувати подарунок';

  @override
  String get giftSettingsRedeemDescription =>
      'Введіть подарунковий код, щоб активувати Plutonium для свого облікового запису.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Введіть код подарунка…';

  @override
  String get giftSettingsRedeemButton => 'Активувати';

  @override
  String get giftSettingsRedeemSuccess =>
      'Подарунок успішно активовано. Насолоджуйтесь Plutonium.';

  @override
  String get giftSettingsPurchasedTitle => 'Придбані подарунки';

  @override
  String get giftSettingsPurchasedDescription =>
      'Керуйте придбаними кодами подарунків Plutonium. Поділіться посиланням на подарунок з кимось особливим або активуйте його для себе!';

  @override
  String get giftSettingsEmptyTitle => 'Подарунків ще немає';

  @override
  String get giftSettingsEmptyDescription =>
      'Купуйте подарунки Plutonium на вкладці Plutonium, щоб поділитися з друзями.';

  @override
  String get giftSettingsGoToPlutonium => 'Перейти до Plutonium';

  @override
  String get giftSettingsLoadFailedTitle =>
      'Не вдалося завантажити інвентар подарунків';

  @override
  String get giftSettingsLoadFailedDescription => 'Спробуйте пізніше.';

  @override
  String get giftSettingsTryAgain => 'Спробувати ще раз';

  @override
  String get giftSettingsGiftUrl => 'Посилання на подарунок';

  @override
  String get giftSettingsCopy => 'Копіювати';

  @override
  String get giftSettingsCopied => 'Скопійовано';

  @override
  String get giftSettingsGiftUrlCopied =>
      'Посилання на подарунок скопійовано в буфер обміну!';

  @override
  String get giftSettingsGiftUrlCopyFailed =>
      'Не вдалося скопіювати посилання на подарунок';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Придбано $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Активовано $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Активовано користувачем $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'Цей подарунок уже використано';

  @override
  String get giftSettingsRedeemForYourself => 'Активувати для себе';

  @override
  String get giftSettingsShareWithFriend => 'Поділитися з другом';

  @override
  String get premiumPlutoniumTagline =>
      'Розблокуйте вищі ліміти та ексклюзивні функції, підтримуючи незалежну платформу для спілкування.';

  @override
  String get premiumPurchaseMode => 'Режим покупки';

  @override
  String get premiumForMe => 'Для мене';

  @override
  String get premiumAsAGift => 'У подарунок';

  @override
  String get premiumMonthly => 'Щомісяця';

  @override
  String get premiumYearly => 'Щорічно';

  @override
  String get premiumPerMonth => 'на місяць';

  @override
  String get premiumPerYear => 'на рік';

  @override
  String get premiumOneTimePurchase => 'одноразова покупка';

  @override
  String get premiumSave17 => 'Заощадьте 17%';

  @override
  String get premiumUpgradeNow => 'Оновити зараз';

  @override
  String get premiumBuyGift => 'Купити подарунок';

  @override
  String get premiumOneYearGift => 'Подарунок на 1 рік';

  @override
  String get premiumOneMonthGift => 'Подарунок на 1 місяць';

  @override
  String get premiumMostPopular => 'Найпопулярніше';

  @override
  String get premiumScrollPrompt =>
      'Прокрутіть униз, щоб переглянути всі переваги Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'Безкоштовно чи Plutonium';

  @override
  String get premiumFreeColumn => 'Безкоштовно';

  @override
  String get premiumGiftSectionTitle => 'Подарувати Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'Поділіться досвідом Plutonium з друзями, придбавши подарункову підписку.';

  @override
  String get premiumGiftBannerOne => 'У вас є новий подарунковий код!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'Ви маєте $count нових промокодів для подарунків!';
  }

  @override
  String get premiumViewGifts => 'Переглянути подарунки';

  @override
  String get premiumReadyToUpgrade => 'Готові оновити?';

  @override
  String get premiumReadyToBuyGift => 'Готові купити подарунок?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Щомісяця $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Річна ціна $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 рік $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 місяць $price';
  }

  @override
  String get premiumManageSubscription => 'Керувати підпискою';

  @override
  String get premiumRedeemGiftCode => 'Активувати подарунковий код';

  @override
  String get premiumGiftBadge => 'Подарунок';

  @override
  String get premiumCancelSubscriptionTitle => 'Скасувати підписку?';

  @override
  String get premiumCancelSubscriptionBody =>
      'Ви зберігаєте свої переваги до наступної дати поновлення, а потім маєте 3-денний пільговий період, щоб повторно підписатися та зберегти історію підписок.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Скасувати підписку';

  @override
  String get premiumKeepSubscription => 'Залишити підписку';

  @override
  String get premiumPurchaseHistoryTitle => 'Історія покупок';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Ваші останні рахунки-фактури. Щоб змінити спосіб оплати підписки, додайте або виберіть його в платіжному порталі та встановіть як основний.';

  @override
  String get premiumManagePaymentMethods => 'Керувати способами оплати';

  @override
  String get premiumBillingHistory => 'Історія платежів';

  @override
  String get premiumSelfServeRefundTitle =>
      'Повернення коштів через самообслуговування';

  @override
  String get premiumSelfServeRefundButton => 'Повернути останню покупку';

  @override
  String get premiumDisclaimerAgreementPrefix =>
      'Купуючи, ви погоджуєтеся з нашими ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'Купуючи, ви погодилися з нашими ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' та ';

  @override
  String premiumActiveUntil(String date) {
    return 'Активно до $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Скасування';

  @override
  String premiumCancelsOn(String date) {
    return 'Скасування відбудеться $date. Привілеї залишатимуться активними до цього часу.';
  }

  @override
  String get premiumReactivateSubscription => 'Поновити';

  @override
  String premiumGiftedUntil(String date) {
    return 'Подаровано до $date. Автоматично не поновлюється.';
  }

  @override
  String get premiumComparisonFeatureColumn => 'Функція';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'Купуючи, ви погоджуєтеся з нашими $terms та $privacy.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Самостійне повернення коштів доступне протягом 3 днів після оплати, раз на 30 днів. Повернення коштів за підписку скасовує її. Покупці з ЄС/ЄЕЗ відмовляються від 14-денного права на відмову під час оформлення замовлення, щоб отримати негайний доступ до контенту. Використовуйте кнопку повернення коштів у застосунку замість відкликання платежу. Відкликання платежу може назавжди обмежити ваш обліковий запис. Stripe безпечно обробляє платежі. Ми ніколи не бачимо повного номера вашої картки.';

  @override
  String get premiumTermsOfService => 'Умови використання';

  @override
  String get premiumPrivacyPolicy => 'Політика конфіденційності';

  @override
  String get premiumCheckoutStartFailedTitle =>
      'Не вдалося розпочати оформлення замовлення';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Під час оформлення замовлення сталася помилка. Повторіть спробу пізніше.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'Зараз у вас подарункова підписка. Вона не буде поновлюватися. Ви можете активувати більше подарункових кодів, щоб продовжити її. Регулярні підписки можна оформити після закінчення терміну дії подарунка.';

  @override
  String get premiumPlanUnavailable =>
      'Цей тарифний план недоступний. Зверніться до служби підтримки.';

  @override
  String get premiumCompletePaymentTitle => 'Завершити оплату';

  @override
  String get premiumCompletePaymentBody =>
      'Ви переходите до Stripe для завершення оплати. Поверніться до Fluxer після завершення.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Виберіть спосіб оплати';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Сплачуйте автоматично через Pix, щоб авторизувати регулярні платежі безпосередньо з вашого бразильського банку. Або виберіть \"Використати картку\", щоб ввести дані кредитної картки на наступному екрані Stripe.';

  @override
  String get premiumUsePix => 'Використовуйте Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Сплатіть через UPI, щоб налаштувати e-договір відповідно до вимог RBI з вашого індійського банку. Або виберіть «Використати картку», щоб ввести дані кредитної картки на наступному екрані Stripe.';

  @override
  String get premiumUseUpi => 'Використовуйте UPI';

  @override
  String get premiumUseCard => 'Використати картку';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Не вдалося відкрити платіжний портал';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Під час відкриття платіжного порталу сталася помилка. Повторіть спробу пізніше.';

  @override
  String get premiumAlreadyVisionaryTitle => 'Ви вже Visionary';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary вже включає постійний доступ, тому регулярна підписка не потрібна. Ви все ще можете купувати подарунки для інших.';

  @override
  String get premiumExistingSubscriptionTitle => 'Підписка вже існує';

  @override
  String get premiumExistingSubscriptionBody =>
      'Ми знайшли наявну підписку Fluxer Plutonium для цього облікового запису. Керуйте нею в захищеному платіжному порталі, щоб оновити платіжні дані або перевірити статус поновлення. Якщо ви щойно оплатили, зачекайте хвилину та знову відкрийте цю сторінку.';

  @override
  String get premiumPurchasesDisabledTitle => 'Покупки недоступні';

  @override
  String get premiumPurchasesDisabledBody =>
      'Покупки для цього облікового запису вимкнено. Зверніться до support@fluxer.app, якщо це виглядає неправильно.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Активуйте свій обліковий запис, щоб придбати Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Щоб придбати Fluxer Plutonium, вам потрібно підтвердити свою електронну пошту.';

  @override
  String get premiumPerkCustomUsernameTag => 'Власний тег користувача';

  @override
  String get premiumPerkPerCommunityProfiles => 'Профілі для кожної спільноти';

  @override
  String get premiumPerkMessageScheduling => 'Планування повідомлень';

  @override
  String get premiumPerkProfileBadge => 'Значок профілю';

  @override
  String get premiumPerkCustomVideoBackgrounds => 'Власні відеофони';

  @override
  String get premiumPerkEntranceSounds => 'Звуки входу';

  @override
  String get premiumPerkCommunities => 'Спільноти';

  @override
  String get premiumPerkMessageCharacterLimit =>
      'Обмеження на кількість символів у повідомленні';

  @override
  String get premiumPerkBookmarkedMessages => 'Збережені повідомлення';

  @override
  String get premiumPerkFileUploadSize => 'Розмір файлу для завантаження';

  @override
  String get premiumPerkEmojiStickerPacks => 'Набори емодзі та стікерів';

  @override
  String get premiumPerkSavedMedia => 'Збережені медіа';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Використовувати анімовані емодзі';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Доступ до глобальних емодзі та стікерів';

  @override
  String get premiumPerkVideoQuality => 'Якість відео';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Анімовані аватари та банери профілю';

  @override
  String get premiumPerkEarlyAccess => 'Ранній доступ до нових функцій';

  @override
  String get premiumPerkCustomThemes => 'Власні теми';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'До 4K/60 кадр/с';

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
  String get userSettingsNavShortcuts => 'Комбінації клавіш';

  @override
  String get audioAndVideoAudioSectionTitle => 'Аудіо';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'Налаштуйте мікрофон, динаміки та обробку голосу.';

  @override
  String get audioAndVideoVideoSectionTitle => 'Відео';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'Налаштуйте якість камери та демонстрації екрана.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle =>
      'Поведінка під час виклику';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Керуйте запитами на підтвердження під час голосових та відеодзвінків.';

  @override
  String get audioAndVideoInputDeviceLabel => 'Пристрій введення';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Пристрій виведення';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'Типово';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Використовувати динамік';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'Коли вимкнено, аудіо відтворюється через розмовний динамік або підключені навушники.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Гучність вхідного сигналу';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Гучність виводу';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Обробка голосу';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Фокусований голос';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Рекомендовано. Очищає мікрофон для чіткої мови.';

  @override
  String get audioAndVideoDirectInputLabel => 'Прямий ввід';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Надсилає ваш звук без змін. Найкраще, якщо ви використовуєте зовнішнє аудіопрограмне забезпечення.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Власні';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Налаштуйте кожну опцію самостійно: приглушення шуму, ехокомпенсація та підсилення.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Приглушення шуму';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Покращено';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Стандартний';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Немає';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Придушення відлуння';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Автоматичне регулювання підсилення';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Вирівнює гучність вашого мікрофона. Вимкнено, коли ввімкнено покращене приглушення.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Тест мікрофона';

  @override
  String get audioAndVideoMicTestStartLabel => 'Розпочати тест мікрофона';

  @override
  String get audioAndVideoMicTestStopLabel => 'Зупинити тест мікрофона';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '$productName потрібен доступ до мікрофона для перевірки вашого введення.';
  }

  @override
  String get audioAndVideoCameraLabel => 'Камера';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Віддзеркалити камеру';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'Якість камери';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'Якість демонстрації екрана';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Частота кадрів';

  @override
  String get audioAndVideoFrameRate15Label => '15 кадр/с';

  @override
  String get audioAndVideoFrameRate30Label => '30 кадр/с';

  @override
  String get audioAndVideoFrameRate60Label => '60 кадрів/с';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return 'Якість 1080p та 60 FPS вимагає $premiumProductName.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'На цьому сервері зараз дозволено демонстрацію екрана з роздільною здатністю до 720p при 30 FPS.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return 'Щоб переглянути список пристроїв, програмі $productName потрібен доступ до мікрофона.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return 'Щоб відобразити ваші пристрої, програмі $productName потрібен доступ до камери.';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'Не питати, коли приховую свою камеру';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'Не питати під час приховування мого екрана';

  @override
  String get userSettingsNavNotifications => 'Сповіщення';

  @override
  String get notificationsGeneralSectionTitle => 'Загальні';

  @override
  String get notificationsEnableNotificationsLabel => 'Увімкнути сповіщення';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Отримуйте сповіщення про нові повідомлення. Можливо, вам доведеться дозволити сповіщення для $productName у налаштуваннях пристрою. Щоб керувати сповіщеннями для окремих каналів/спільнот, відкрийте налаштування сповіщень у меню спільноти.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Увімкнути сповіщення на комп\'ютері';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Використовує центр сповіщень ОС. Щоб налаштувати сповіщення для окремих каналів/спільнот, клацніть правою кнопкою миші на іконці спільноти та відкрийте налаштування сповіщень.';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'Увімкнути сповіщення в браузері';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'Отримуйте сповіщення про нові повідомлення. Можливо, вам потрібно буде дозволити сповіщення в налаштуваннях браузера. Щоб налаштувати сповіщення для окремих каналів/спільнот, клацніть правою кнопкою миші на значку спільноти та відкрийте налаштування сповіщень.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Таймаут неактивності push-сповіщень';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName не надсилає сповіщення на ваші мобільні пристрої, коли ви працюєте за комп’ютером. Оберіть, скільки часу має пройти бездіяльності на робочому столі, перш ніж ви почнете отримувати сповіщення.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute хвилина';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes хв';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle =>
      'Налаштування згадок';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Налаштування згадок у відповідях';

  @override
  String get notificationsMentionNoPreferenceName => 'Без налаштувань';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Враховувати намір відправника, без попередження, коли він вмикає згадку @';

  @override
  String get notificationsMentionPreferMentionName => 'Бажані згадки';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'За замовчуванням відповідає на згадки про вас і попереджає відправника, якщо він вимкне цю функцію';

  @override
  String get notificationsMentionPreferNoMentionName => 'Не згадувати мене';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'За замовчуванням відповіді не міститимуть згадки @, а відправник отримає попередження, якщо він її ввімкне';

  @override
  String get notificationsTtsSectionTitle => 'Текстові повідомлення';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'Увімкнути відтворення мовлення /tts';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'Дозволити /tts читати ваші повідомлення вголос. Вимкнення цієї функції залишить ці команди як звичайний текст.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Налаштуйте швидкість відтворення в ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Доступність';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle =>
      'Автоматичне озвучування повідомлень';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Перетворює вхідний вміст на мовлення, незалежно від того, чи надійшов він з /tts.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Усі канали';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Нехай кожне вхідне повідомлення буде озвучено, незалежно від того, який канал відкрито.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Лише активний канал';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Озвучує лише канал, який ви переглядаєте. Озвучення слідує за вами між каналами.';

  @override
  String get notificationsTtsModeNeverName => 'Ніколи автоматично';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Залишатися беззвучним, доки хтось не запустить /tts вручну.';

  @override
  String get notificationsTtsModeAriaLabel => 'Озвучувати всі повідомлення';

  @override
  String get notificationsSoundsSectionTitle => 'Звуки';

  @override
  String get notificationsMasterVolumeLabel => 'Загальна гучність';

  @override
  String get notificationsMasterVolumeDescription =>
      'Встановлює рівень для кожного звукового ефекту. Налаштування для окремих звуків ігнорують це.';

  @override
  String get notificationsResetToDefaultVolume =>
      'Скинути гучність до стандартної';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Вимкнути всі звуки сповіщень';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Ваші наявні налаштування звуків сповіщень буде збережено.';

  @override
  String get notificationsShowMoreSoundEffects =>
      'Показати більше звукових ефектів';

  @override
  String get notificationsShowFewerSoundEffects =>
      'Показати менше звукових ефектів';

  @override
  String get notificationsPreviewSound => 'Попередній перегляд звуку';

  @override
  String get notificationsPerSoundVolumeTitle => 'Гучність для кожного звуку';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Установіть власну гучність для окремих звуків. Звуки без перевизначення відповідають основній гучності.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Активні налаштування гучності для користувацьких звуків: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'За основними • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'Скинути $label до основної гучності';
  }

  @override
  String get notificationsResetAllOverrides => 'Скинути всі налаштування';

  @override
  String notificationsMuteSound(String label) {
    return 'Вимкнути звук для $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'Увімкнути звук для $label';
  }

  @override
  String get notificationsSoundMessage =>
      'Сповіщення про повідомлення спільноти';

  @override
  String get notificationsSoundDirectMessage =>
      'Сповіщення про приватні повідомлення';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Сповіщення про повідомлення поточного каналу';

  @override
  String get notificationsSoundMute => 'Вимкнути звук';

  @override
  String get notificationsSoundUnmute => 'Увімкнути звук голосу';

  @override
  String get notificationsSoundDeaf => 'Вимкнення звуку в голосовому чаті';

  @override
  String get notificationsSoundUndeaf => 'Голос увімкнено';

  @override
  String get notificationsSoundUserJoin => 'Користувач приєднується до каналу';

  @override
  String get notificationsSoundUserLeave => 'Користувач залишає канал';

  @override
  String get notificationsSoundUserMove => 'Користувач перемістив канал';

  @override
  String get notificationsSoundViewerJoin =>
      'Глядач приєднується до трансляції';

  @override
  String get notificationsSoundViewerLeave => 'Глядач залишає трансляцію';

  @override
  String get notificationsSoundVoiceDisconnect =>
      'Голосовий зв\'язок розірвано';

  @override
  String get notificationsSoundIncomingRing => 'Вхідний дзвінок';

  @override
  String get notificationsSoundCameraOn => 'Камера ввімкнена';

  @override
  String get notificationsSoundCameraOff => 'Камера вимкнена';

  @override
  String get notificationsSoundScreenShareStart =>
      'Початок демонстрації екрана';

  @override
  String get notificationsSoundScreenShareStop => 'Зупинка демонстрації екрана';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'Не вдалося оновити тайм-аут push-сповіщень. Спробуйте ще раз.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Не вдалося оновити налаштування згадок. Спробуйте ще раз.';

  @override
  String get notificationsPermissionDeniedTitle => 'Сповіщення заблоковано';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'Не вдалося ввімкнути сповіщення. Щоб продовжити, надайте дозвіл на сповіщення.';

  @override
  String get userSettingsNavLanguageAndTime => 'Мова та час';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Мова інтерфейсу';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Виберіть мову, яка використовуватиметься в усьому додатку';

  @override
  String get languageAndTimeOpenLanguageSettings =>
      'Відкрити налаштування мови';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Формат часу';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Виберіть, як відображатиметься час у програмі';

  @override
  String get languageAndTimeTimeFormatSelectionLabel => 'Вибір формату часу';

  @override
  String get languageAndTimeTimeFormatAuto => 'Автоматично';

  @override
  String get languageAndTimeTimeFormat12Hour => '12-годинний';

  @override
  String get languageAndTimeTimeFormat24Hour => '24-годинний';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'Мова програми: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Системна локаль: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Використовувати системну мову для формату часу';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'Не вдалося оновити формат часу';

  @override
  String get userSettingsNavDefaultApps => 'Програми за замовчуванням';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Веб-браузер';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Виберіть браузер, який відкриватиметься за натисканням на посилання.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'Якщо для сайту встановлено програму, посилання відкриватимуться спочатку в ній.';

  @override
  String get defaultAppsWebBrowserInApp => 'У браузері програми';

  @override
  String get defaultAppsWebBrowserExternal => 'Зовнішній браузер';

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
  String get advancedSettingsConfigure => 'Налаштувати';

  @override
  String get advancedSettingsCategoryPrivacy => 'Приватність';

  @override
  String get advancedSettingsCategoryAppearance => 'Зовнішній вигляд';

  @override
  String get advancedSettingsCategoryAccessibility => 'Доступність';

  @override
  String get advancedSettingsCategoryChat => 'Чат';

  @override
  String get advancedSettingsCategoryMedia => 'Медіа';

  @override
  String get advancedSettingsCategoryVoice => 'Голосовий';

  @override
  String get advancedSettingsCategoryDeveloper => 'Розробник';

  @override
  String get advancedSettingEnableTextSelectionLabel =>
      'Увімкнути виділення тексту';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Дозволити виділення тексту в програмі';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Увімкнути мініатюри для навігації відео';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Мініатюра або поточний кадр під час перегляду відео';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Тактильний відгук';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Вібрація під час натискань і дій. Не синхронізується між пристроями.';

  @override
  String get advancedSettingShowNekoLabel => 'Показувати Неко';

  @override
  String get advancedSettingShowNekoDescription =>
      'Кіт Неко, що ганяється за вашим курсором';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Показувати Неко у полі введення чату';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Анімація масштабування під час запуску';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Зменшувати логотип під час виходу з екрана запуску';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Підказки клавіатури';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Підказки щодо комбінацій клавіш у спливаючих підказках.';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Увімкнути вибране';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Показувати улюблене в усьому додатку';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Поведінка при приєднанні до голосового каналу';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Підтвердження або подвійне клацання для приєднання до голосового каналу спільноти';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Вимагати подвійне натискання для приєднання до голосових каналів';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Запитувати підтвердження перед приєднанням до голосових каналів';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Автоматично надсилати GIF-файли після вибору';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Автоматично надсилати GIF-файли з панелі без підтвердження';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Зберігати вибрані GIF як збережені медіа';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Виберіть, як зберігатимуться улюблені GIF-файли';

  @override
  String get advancedSettingMediaButtonsLabel => 'Кнопки медіа';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Налаштуйте, які кнопки та індикатори відображаються на медіафайлах і вбудованих об’єктах';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Завантажуйте вкладення перед відправленням';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Почніть завантажувати вкладення одразу після їх додавання до поля введення повідомлення';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Видаляти параметри відстеження з посилань';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Автоматично видаляти параметри відстеження з URL-адрес у повідомленнях, які ви надсилаєте';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'Довіряти всім зовнішнім посиланням';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'Пропускати попередження про зовнішні посилання для всіх доменів';

  @override
  String get advancedSettingSearchEnginesLabel => 'Пошукові системи';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Налаштуйте пошукові системи, які використовуються для пошуку за виділеним текстом';

  @override
  String get advancedSettingTranslatorsLabel => 'Перекладачі';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Налаштуйте постачальників перекладу, які використовуються для вибраного тексту';

  @override
  String get advancedSettingReverseImageSearchLabel => 'Пошук зображень';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Пошук зворотного зображення';

  @override
  String get advancedSettingMessageActionBarLabel =>
      'Панель дій з повідомленнями';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Налаштуйте панель дій, що з\'являється при наведенні на повідомлення';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Автозавершення виразів';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Виберіть, що відображатиметься під час введення двокрапки в полі для введення повідомлення';

  @override
  String get advancedSettingInputButtonsLabel => 'Кнопки введення повідомлень';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Оберіть, які кнопки відображатимуться в полі введення повідомлень';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Прокручувати донизу під час надсилання повідомлення';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Оберіть, як чат переміщуватиметься після відправлення повідомлення';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Пропускати підтвердження \"Позначити все як прочитане\"';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Позначити всі непрочитані канали в папці \"Вхідні\" як прочитані негайно, без запиту підтвердження';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Приховувати вимкнені канали за замовчуванням';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Приховувати вимкнені канали з бічних панелей спільнот';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'Показувати індикатор GIF';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Показувати індикатор закінчення терміну дії вкладення';

  @override
  String get advancedSettingShowMediaDeleteLabel =>
      'Показувати кнопку видалення';

  @override
  String get advancedSettingShowMediaDownloadLabel =>
      'Показувати кнопку завантаження';

  @override
  String get advancedSettingShowMediaFavoriteLabel =>
      'Показувати кнопку \"Улюблене\"';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Показувати кнопку приховування вбудованого вмісту';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Показувати панель дій з повідомленнями';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel =>
      'Показувати лише кнопку \"Більше\"';

  @override
  String get advancedSettingShowQuickReactionsLabel =>
      'Показувати швидкі реакції';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Увімкнути Shift для розгортання';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Показувати стандартні емодзі в автозавершенні виразів';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Показувати власні емодзі в автозаповненні виразів';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Показувати стікери в автозаповненні виразів';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Показувати збережені медіа у пропозиціях автозаповнення';

  @override
  String get advancedSettingShowGifsButtonLabel => 'Показувати кнопку GIF';

  @override
  String get advancedSettingShowMediaButtonLabel => 'Показувати кнопку медіа';

  @override
  String get advancedSettingShowStickersButtonLabel =>
      'Показувати кнопку стікерів';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Показувати кнопку емодзі';

  @override
  String get advancedSettingShowSendButtonLabel =>
      'Показувати кнопку надсилання';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Показувати сповіщення про нові пристрої';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Запит на нові аудіопристрої';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Керування гучністю з\'єднання';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Показувати повзунки гучності учасників для кожного пристрою в меню голосу';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Попередній перегляд поведінки спільного доступу до екрана';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Попередній перегляд, відкриття у новому вікні та поведінка мініатюр потоку';

  @override
  String get advancedSettingScreenShareCodecLabel =>
      'Кодек для демонстрації екрана';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Відеокодек для спільного використання екрана';

  @override
  String get advancedSettingScreenShareCodecAuto =>
      'Автоматично (рекомендовано)';

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
      'Призупинити попередній перегляд мого спільного екрана у фоновому режимі';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Приховати мініатюру попереднього перегляду мого потоку';

  @override
  String get advancedSettingDeveloperModeLabel => 'Увімкнути режим розробника';

  @override
  String get advancedSettingDeveloperModeDescription =>
      'Увімкнути режим розробника';

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
  String get advancedSettingTranslatorGoogle => 'Переклад Google';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel =>
      'Пошукова система за замовчуванням';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Виберіть пошукову систему, яка використовуватиметься за замовчуванням під час пошуку виділеного тексту.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Вбудовані пошукові системи';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Увімкніть або вимкніть вбудовані пошукові системи. Увімкнені системи з\'являтимуться в контекстному меню повідомлення, коли виділено текст.';

  @override
  String get advancedSettingCustomSearchEnginesLabel =>
      'Власні пошукові системи';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Додайте власні пошукові системи з кастомним шаблоном URL. Використовуйте \'$query\' як заповнювач для тексту пошуку.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Додати пошукову систему';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Увімкніть принаймні одну пошукову систему нижче.';

  @override
  String get advancedSettingRemoveSearchEngineLabel =>
      'Видалити пошукову систему';

  @override
  String get advancedSettingDefaultTranslatorLabel =>
      'Перекладач за замовчуванням';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Виберіть перекладач, який використовуватиметься за замовчуванням для перекладу виділеного тексту.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Вбудовані перекладачі';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Увімкніть або вимкніть вбудовані перекладачі. Увімкнені перекладачі з\'являються в контекстному меню повідомлення, коли виділено текст.';

  @override
  String get advancedSettingCustomTranslatorsLabel => 'Власні перекладачі';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Додайте власні перекладачі за допомогою шаблону власної URL-адреси. Використовуйте \'$query\' як заповнювач для тексту, який потрібно перекласти.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Додати перекладач';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Увімкніть принаймні один перекладач нижче.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Видалити перекладач';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Пошук зображень за замовчуванням';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Виберіть сервіс зворотного пошуку зображень, який використовуватиметься за замовчуванням під час пошуку зображення.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Вбудований пошук зображень';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Увімкніть або вимкніть вбудовані провайдери зворотного пошуку зображень. Увімкнені провайдери з\'являтимуться в контекстному меню зображень, аватарів, банерів, стікерів та емодзі.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Власний зворотний пошук зображень';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Додайте власні пошукові системи для зворотного пошуку зображень із шаблоном URL. Використовуйте \'$url\' як заповнювач для URL зображення.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Додати зворотний пошук зображень';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Увімкніть принаймні один сервіс зворотного пошуку зображень нижче.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Видалити зворотний пошук зображень';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Додати пошукову систему';

  @override
  String get advancedSettingEditSearchEngineTitle =>
      'Редагувати пошукову систему';

  @override
  String get advancedSettingAddTranslatorTitle =>
      'Додати постачальника перекладу';

  @override
  String get advancedSettingEditTranslatorTitle =>
      'Редагувати постачальника перекладу';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Додати пошукову систему для зворотного пошуку зображень';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Редагувати пошукову систему для зворотного пошуку зображень';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Назва';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'Шаблон URL';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'Моя пошукова система';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Мій перекладач';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'Мій зворотний пошук зображень';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Вставте \'$query\', де має бути текст пошуку.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Використовуйте \'$query\', де має бути вставлено текст для перекладу.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Використовуйте \'$url\', куди слід вставити URL-адресу зображення.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired => 'Введіть ім\'я.';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'Шаблон URL-адреси обов\'язковий.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'Шаблон URL має містити плейсхолдер \"$query\".';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'Шаблон URL має містити плейсхолдер \"$url\".';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'Шаблон URL має бути дійсною URL-адресою.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Додати';

  @override
  String get advancedSettingEditSearchProviderAction => 'Редагувати';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Видалити';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'Ви впевнені, що хочете видалити $engineName?';
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
  String get userSettingsJoinFluxerLabs => 'Приєднатися до Fluxer Labs';

  @override
  String get userSettingsNavAppLicenses => 'Ліцензії додатків';

  @override
  String get userSettingsAppLicensesDescription =>
      'Програмне забезпечення з відкритим кодом, яке використовується в цьому додатку. Цей додаток створено за допомогою Flutter.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'Не вдалося завантажити ліцензії програм.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ліцензій',
      one: '1 ліцензія',
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
  String get savedMessagesEmptyTitle => 'Немає закладок';

  @override
  String get savedMessagesEmptyBody =>
      'Додавайте повідомлення в закладки, щоб зберегти їх на потім.';

  @override
  String get savedMessagesEndBody => 'Тут більше нічого немає.';

  @override
  String get savedMessagesRemoveTooltip => 'Видалити із закладок';

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
  String get uiSearch => 'Пошук';

  @override
  String get uiStartCall => 'Почати дзвінок';

  @override
  String get uiStartVideoCall => 'Почати відеодзвінок';

  @override
  String get uiPlay => 'Відтворити';

  @override
  String get uiPause => 'Пауза';

  @override
  String get uiDownload => 'Завантажити';

  @override
  String get uiMoreActions => 'Більше дій';

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
    return 'Це сповістить $count учасників із роллю $roleName. Продовжити?';
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
  String get guildNavbarGuildSelected => 'вибрано';

  @override
  String get guildNavbarGuildUnread => 'непрочитані';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count згадок',
      one: '1 згадка',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'вимкнено';

  @override
  String get authShowPassword => 'Показати пароль';

  @override
  String get authHidePassword => 'Сховати пароль';

  @override
  String get chatLoadingMessages => 'Завантаження повідомлень';

  @override
  String get friendsMessageFriend => 'Повідомлення';

  @override
  String get friendsFriendActions => 'Дії з другом';

  @override
  String get friendsAcceptRequest => 'Прийняти запит на додавання в друзі';

  @override
  String get friendsDeclineRequest => 'Відхилити запит у друзі';

  @override
  String get friendsCancelRequest => 'Скасувати запит на додавання в друзі';

  @override
  String get friendsOpenInbox => 'Вхідні';

  @override
  String get profileRemoveFriend => 'Видалити з друзів';

  @override
  String get profileUnblockUser => 'Розблокувати користувача';

  @override
  String get profileAcceptFriendRequest =>
      'Прийняти запит на додавання в друзі';

  @override
  String get profileCancelFriendRequest =>
      'Скасувати запит на додавання в друзі';

  @override
  String get profileSendFriendRequest => 'Додати в друзі';

  @override
  String get accountOverflowMenu => 'Параметри облікового запису';

  @override
  String get navHome => 'Головна';

  @override
  String get navNotifications => 'Сповіщення';

  @override
  String get navYou => 'Ви';

  @override
  String get guildFolderSettingsTitle => 'Налаштування папки';

  @override
  String get guildFolderNameLabel => 'Назва папки';

  @override
  String get guildFolderColorLabel => 'Колір папки';

  @override
  String get guildFolderShowIconWhenCollapsed =>
      'Показувати іконку, коли згорнуто';

  @override
  String get guildFolderIconLabel => 'Іконка папки';

  @override
  String get guildFolderDelete => 'Видалити теку';

  @override
  String get guildFolderIconFolder => 'Папка';

  @override
  String get guildFolderIconStar => 'Позначити зірочкою';

  @override
  String get guildFolderIconHeart => 'Серце';

  @override
  String get guildFolderIconBookmark => 'Закладка';

  @override
  String get guildFolderIconGameController => 'Ігровий контролер';

  @override
  String get guildFolderIconShield => 'Захист';

  @override
  String get guildFolderIconMusicNote => 'Музична нота';

  @override
  String get guildFolderMarkAsRead => 'Позначити теку як прочитану';

  @override
  String get guildBulkMuteCommunities => 'Вимкнути сповіщення спільнот';

  @override
  String get guildBulkUnmuteCommunities => 'Увімкнути сповіщення спільнот';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Налаштування сповіщень спільноти';

  @override
  String get guildBulkCommunityPrivacySettings =>
      'Налаштування приватності спільноти';

  @override
  String get guildBulkAllowEveryoneAndHere => 'Дозволити @everyone та @here';

  @override
  String get guildBulkAllowRoleMentions => 'Дозволити згадки ролей';

  @override
  String get guildBulkEnableMobilePush =>
      'Увімкнути push-сповіщення на мобільному';

  @override
  String get guildBulkDisableMobilePush => 'Вимкнути мобільні push-сповіщення';

  @override
  String get guildBulkAllowDirectMessages => 'Дозволити приватні повідомлення';

  @override
  String get guildBulkBlockDirectMessages => 'Блокувати приватні повідомлення';

  @override
  String get guildBulkAllowBotDirectMessages =>
      'Дозволити боту надсилати особисті повідомлення';

  @override
  String get guildBulkBlockBotDirectMessages =>
      'Блокувати особисті повідомлення від бота';

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
  String get guildNavbarChannelTypeSelection => 'Вибір типу каналу';

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
  String get guildMenuSettingsEmoji => 'Емодзі';

  @override
  String get guildMenuSettingsStickers => 'Стікери';

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
  String get guildMenuSettingsInviteLinks => 'Запрошення';

  @override
  String get guildMenuSettingsBans => 'Бани';

  @override
  String get guildMenuSettingsChannels => 'Канали';

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
  String get guildSettingsRolesNewRole => 'Нова роль';

  @override
  String get guildSettingsRolesDeleteRole => 'Видалити роль';

  @override
  String get guildSettingsRolesBackToRoles => 'Назад до ролей';

  @override
  String get guildSettingsBackToSettings => 'Назад до налаштувань';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Редагувати \"$name\"';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Налаштуйте параметри та дозволи ролі';

  @override
  String get guildSettingsRolesDisplaySection => 'Відображення';

  @override
  String get guildSettingsRolesRoleName => 'Назва ролі';

  @override
  String get guildSettingsRolesRoleColor => 'Колір ролі';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Введіть колір (шістнадцятковий код, rgb(), hsl() або назва) або скористайтеся палітрою.';

  @override
  String get guildSettingsRolesShowSeparately => 'Показувати цю роль окремо';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Показує учасників із цією роллю в окремому розділі списку учасників.';

  @override
  String get guildSettingsRolesAllowMentions =>
      'Дозволити згадки для цієї ролі';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'Учасники з дозволом \"$permission\" завжди зможуть згадувати ролі, незалежно від цього налаштування.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Використовуйте цю кнопку, щоб швидко очистити всі дозволи.';

  @override
  String get guildSettingsRolesClearPermissions => 'Очистити дозволи';

  @override
  String get guildSettingsRolesPermissionsSection => 'Дозволи';

  @override
  String get guildSettingsRolesSearchPermissions => 'Пошук дозволів';

  @override
  String get guildSettingsRolesDenseLayout => 'Щільний макет';

  @override
  String get guildSettingsRolesComfyLayout => 'Зручний вигляд';

  @override
  String get guildSettingsRolesSwitchToDenseLayout =>
      'Перейти до компактного вигляду';

  @override
  String get guildSettingsRolesSwitchToComfyLayout =>
      'Перейти до зручного макета';

  @override
  String get guildSettingsRolesSingleColumn => 'Один стовпець';

  @override
  String get guildSettingsRolesTwoColumns => 'Два стовпці';

  @override
  String get guildSettingsRolesSwitchToSingleColumn =>
      'Перейти до одного стовпця';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => 'Перейти до двох стовпців';

  @override
  String get guildSettingsRolesNoPermissionsFound => 'Дозволів не знайдено';

  @override
  String get guildSettingsRolesCustomHoistOrder =>
      'Власний порядок відображення';

  @override
  String get guildSettingsRolesHoistOrder => 'Порядок відображення';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Скинути до типових';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Перетягуйте ролі, щоб змінити порядок їх відображення у списку учасників.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Немає піднятих ролей. Увімкніть \"Показувати цю роль окремо\" для ролі, щоб побачити її тут.';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'Ви не можете редагувати цю роль, оскільки вона є вашою найвищою роллю або вищою за вас';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Щоб редагувати ці дозволи, вам потрібен дозвіл \"$permission\".';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'Ви не можете редагувати роль, яка є на одному рівні або вище вашої найвищої ролі';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'Ви не можете надати дозвіл, якого у вас немає';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'Ви не можете видалити цей дозвіл, оскільки він буде видалений у вас';

  @override
  String get guildSettingsRolesUpdatedSuccess => 'Ролі успішно оновлено';

  @override
  String get guildSettingsRolesCreatedSuccess => 'Роль успішно створено';

  @override
  String get guildSettingsRolesDeletedSuccess => 'Роль успішно видалено';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'Порядок відображення скинуто до типового';

  @override
  String get guildSettingsRolesNameRequiredTitle => 'Потрібна назва ролі';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Назвіть роль, перш ніж зберігати.';

  @override
  String get guildSettingsRolesCreateFailedTitle => 'Не вдалося створити роль';

  @override
  String get guildSettingsRolesUpdateFailedTitle => 'Не вдалося оновити ролі';

  @override
  String get guildSettingsRolesDeleteFailedTitle => 'Не вдалося видалити роль';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return 'Не вдалося видалити \"$name\". Спробуйте ще раз.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'Не вдалося скинути порядок підняття';

  @override
  String get guildSettingsRolesTryAgainInAMoment => 'Спробуйте ще раз за мить.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'Ви впевнені, що хочете видалити роль $name? Усі учасники з цією роллю більше її не матимуть.';
  }

  @override
  String get permissionCategoryCommunityWide => 'Уся спільнота';

  @override
  String get permissionCategoryMessagesMedia => 'Повідомлення та медіа';

  @override
  String get permissionCategoryModeration => 'Модерація';

  @override
  String get permissionCategoryChannelAccess => 'Доступ до каналу';

  @override
  String get permissionCategoryChannelManagement => 'Керування каналами';

  @override
  String get permissionCategoryAudioVideo => 'Аудіо та відео';

  @override
  String get permissionUnknown => 'Невідомий дозвіл';

  @override
  String get permissionAdministrator => 'Адміністратор';

  @override
  String get permissionAdministratorDescription =>
      'Надає всі дозволи та обходить обмеження каналу. Дуже конфіденційно.';

  @override
  String get permissionViewActivityLog => 'Перегляд журналу активності';

  @override
  String get permissionViewActivityLogDescription =>
      'Перегляд журналу активності спільноти зі змінами та діями модерації.';

  @override
  String get permissionManageCommunity => 'Керувати спільнотою';

  @override
  String get permissionManageCommunityDescription =>
      'Редагуйте глобальні налаштування, як-от назву, опис та іконку.';

  @override
  String get permissionManageRoles => 'Керувати ролями';

  @override
  String get permissionManageRolesDescription =>
      'Створюйте, редагуйте або видаляйте ролі, що нижчі за вашу найвищу роль. Також дозволяє редагувати перевизначення дозволів каналу.';

  @override
  String get permissionManageChannels => 'Керувати каналами';

  @override
  String get permissionManageChannel => 'Керувати каналом';

  @override
  String get permissionManageChannelDescription =>
      'Перейменувати та змінити налаштування цього каналу.';

  @override
  String get permissionManagePermissions => 'Керувати дозволами';

  @override
  String get permissionManagePermissionsDescription =>
      'Редагувати дозволи для ролей і учасників у цьому каналі.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Створюйте, редагуйте або видаляйте вебхуки для цього каналу.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Переглянути список учасників цього каналу.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Керуйте посиланнями-запрошеннями для цього каналу.';

  @override
  String get permissionOverwriteDeny => 'Відхилити';

  @override
  String get permissionOverwriteInherit => 'Нейтрально (успадкувати)';

  @override
  String get permissionOverwriteAllow => 'Дозволити';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Використовуйте ці кнопки, щоб швидко налаштувати всі дозволи.';

  @override
  String get permissionManageChannelsDescription =>
      'Створюйте, редагуйте або видаляйте канали та категорії.';

  @override
  String get permissionKickMembers => 'Видаляти учасників';

  @override
  String get permissionBanMembers => 'Блокувати учасників';

  @override
  String get permissionCreateInviteLinks => 'Створювати посилання-запрошення';

  @override
  String get permissionChangeOwnNickname => 'Змінити власний нікнейм';

  @override
  String get permissionChangeOwnNicknameDescription => 'Оновити свій нікнейм.';

  @override
  String get permissionManageNicknames => 'Керувати нікнеймами';

  @override
  String get permissionManageNicknamesDescription =>
      'Змінювати псевдоніми інших учасників.';

  @override
  String get permissionCreateEmojiStickers => 'Створювати емодзі та стікери';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Завантажуйте нові емодзі та стікери, а також керуйте власними творіннями.';

  @override
  String get permissionManageEmojiStickers => 'Керування емодзі та стікерами';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Редагувати або видаляти емодзі та стікери, створені іншими учасниками.';

  @override
  String get permissionManageWebhooks => 'Керувати вебхуками';

  @override
  String get permissionManageWebhooksDescription =>
      'Створюйте, редагуйте або видаляйте вебхуки.';

  @override
  String get permissionSendMessages => 'Надсилати повідомлення';

  @override
  String get permissionSendTtsMessages => 'Надсилати TTS-повідомлення';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Надсилати повідомлення голосом.';

  @override
  String get permissionManageMessages => 'Керувати повідомленнями';

  @override
  String get permissionManageMessagesDescription =>
      'Видаляти повідомлення інших учасників. Закріплення керується окремо.';

  @override
  String get permissionPinMessages => 'Закріплювати повідомлення';

  @override
  String get permissionEmbedLinks => 'Вбудовувати посилання';

  @override
  String get permissionAttachFiles => 'Додавати файли';

  @override
  String get permissionMentionEveryone =>
      'Використовуйте @everyone/@here та @роль';

  @override
  String get permissionMentionEveryoneDescription =>
      'Згадувати всіх або будь-яку роль (навіть якщо роль не налаштована для згадування).';

  @override
  String get permissionUseExternalEmoji => 'Використовувати зовнішні емодзі';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Використовувати емодзі з інших спільнот.';

  @override
  String get permissionUseExternalStickers =>
      'Використовувати зовнішні стікери';

  @override
  String get permissionAddReactions => 'Додавати реакції';

  @override
  String get permissionAddReactionsDescription =>
      'Додавати нові реакції до повідомлень.';

  @override
  String get permissionBypassSlowmode => 'Обхід повільного режиму';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Ігнорувати обмеження частоти повідомлень для кожного каналу.';

  @override
  String get permissionTimeOutMembers => 'Тимчасово вимкнути учасників';

  @override
  String get permissionTimeOutMembersDescription =>
      'Заборонити учасникам надсилати повідомлення, реагувати та приєднуватися до голосового чату на певний час.';

  @override
  String get permissionViewChannel => 'Переглядати канал';

  @override
  String get permissionViewChannelMembers => 'Перегляд учасників каналу';

  @override
  String get permissionViewChannelMembersDescription =>
      'Переглянути список учасників каналів у цій спільноті.';

  @override
  String get permissionConnect => 'Підключитися';

  @override
  String get permissionSpeak => 'Говорити';

  @override
  String get permissionStreamVideo => 'Транслювати відео';

  @override
  String get permissionUseVoiceActivity =>
      'Використовувати голосову активність';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Без цього дозволу потрібен режим \"Натисни і говори\".';

  @override
  String get permissionPrioritySpeaker => 'Пріоритетний доповідач';

  @override
  String get permissionMuteMembers => 'Вимкнути учасників';

  @override
  String get permissionDeafenMembers => 'Вимкнути звук учасникам';

  @override
  String get permissionMoveMembers => 'Переміщувати учасників';

  @override
  String get permissionMoveMembersDescription =>
      'Перетягуйте учасників між каналами, до яких вони мають доступ.';

  @override
  String get permissionSetVoiceRegion => 'Змінити голосовий регіон';

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
      'Переглядайте та керуйте всіма вебхуками, налаштованими у вашій спільноті.';

  @override
  String get guildSettingsWebhooksEmpty => 'Вебхуків немає';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'У цій спільноті ще немає вебхуків. Перейдіть до $channelSettingsPath, щоб створити один.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'Щоб переглядати та редагувати вебхуки для цієї спільноти, вам потрібен дозвіл \"$permission\".';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle =>
      'Не вдалося завантажити вебхуки';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'Сталася помилка під час завантаження вебхуків. Спробуйте ще раз.';

  @override
  String get guildSettingsWebhooksUpdated => 'Вебхуки оновлено';

  @override
  String get guildSettingsWebhooksUpdateFailed => 'Не вдалося оновити вебхуки';

  @override
  String get guildSettingsUnknownChannel => 'Невідомий канал';

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
      'Додайте свою спільноту до розділу \"Цікаве\", щоб інші могли її знайти та приєднатися.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Недостатньо учасників';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Вашій спільноті потрібно щонайменше $count учасників, щоб її можна було додати до каталогу.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Стан:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'Очікує';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Схвалено';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Відхилено';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Видалено';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Причина: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'Ваша спільнота відображається в \"Пошуку\". Ви можете оновити інформацію про неї нижче або вилучити її.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Ваша заявка очікує на розгляд. Ви все ще можете оновити деталі оголошення або відкликати заявку.';

  @override
  String get guildSettingsDiscoveryCategory => 'Категорія';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Виберіть категорію, яка найкраще описує вашу спільноту. Ви можете змінити це будь-коли.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Основна мова';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'Мова, якою спілкується більшість вашої спільноти. Використовується для фільтрації результатів пошуку.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Опис';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Опишіть, про що ваша спільнота';

  @override
  String get guildSettingsDiscoveryDescriptionRequired => 'Потрібен опис.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'Опис має бути щонайменше на $minLength символів.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'Опис має бути не довшим за $maxLength символів.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Власні теги';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'До $maxTags тегів допоможуть людям знайти вашу спільноту. Вони відображатимуться в пошуку Discovery.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'Додайте тег і натисніть Enter';

  @override
  String get guildSettingsDiscoveryAddTag => 'Додати';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Видалити тег $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle => 'Не вдалося додати тег';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'Теги мають містити від 2 до $maxLength буквено-цифрових символів.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'Можна додати щонайбільше $maxTags тегів.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Застосувати';

  @override
  String get guildSettingsDiscoverySave => 'Зберегти';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Відкликати';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Заявку на виявлення надіслано';

  @override
  String get guildSettingsDiscoveryListingUpdated => 'Список знахідок оновлено';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Заявку на пошук відкликано';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Не вдалося відкликати заявку';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Спробуйте ще раз за мить.';

  @override
  String get guildSettingsMembersDescription =>
      'Шукайте учасників сервера та керуйте ними.';

  @override
  String get guildSettingsMembersSearchHint =>
      'Пошук за іменем користувача або ID';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count учасників';
  }

  @override
  String get guildMembersRecentTitle => 'Нові учасники';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Показано $displayedCount з $totalCount учасників';
  }

  @override
  String get guildMembersSort => 'Сортувати';

  @override
  String get guildSettingsMembersSortNewest => 'Спочатку найновіші';

  @override
  String get guildMembersSortOldest => 'Спочатку найстаріші';

  @override
  String get guildMembersColumnName => 'Назва';

  @override
  String get guildMembersColumnMemberSince => 'Учасник з';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'Приєднався до $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Спосіб приєднання';

  @override
  String get guildMembersColumnRoles => 'Ролі';

  @override
  String get guildMembersColumnActions => 'Дії';

  @override
  String get guildMembersFilterMemberSince => 'Фільтрувати за датою приєднання';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Фільтрувати за датою створення облікового запису';

  @override
  String get guildMembersFilterJoinMethod =>
      'Фільтрувати за способом приєднання';

  @override
  String get guildMembersFilterRoles => 'Фільтрувати за ролями';

  @override
  String get guildMembersFilterAll => 'Усі';

  @override
  String get guildMembersFilterPast1Hour => 'Остання година';

  @override
  String get guildMembersFilterPast24Hours => 'Останні 24 години';

  @override
  String get guildMembersFilterPast7Days => 'Останні 7 днів';

  @override
  String get guildMembersFilterPast2Weeks => 'Останні 2 тижні';

  @override
  String get guildMembersFilterPast3Weeks => 'Останні 3 тижні';

  @override
  String get guildMembersFilterPast4Weeks => 'Останні 4 тижні';

  @override
  String get guildMembersFilterPast3Months => 'Останні 3 місяці';

  @override
  String get guildMembersFilterCustomRange => 'Власний діапазон...';

  @override
  String get guildMembersDateRangeTitle => 'Вибрати період';

  @override
  String get guildMembersDateAfter => 'Після дати';

  @override
  String get guildMembersDateBefore => 'До дати';

  @override
  String get guildMembersClearAll => 'Очистити все';

  @override
  String get guildMembersRowsPerPage => 'Рядків на сторінку';

  @override
  String get guildMembersEmptySearch => 'Ніхто не відповідає цьому пошуку.';

  @override
  String get guildMembersLoadError =>
      'Під час завантаження учасників сталася помилка. Спробуйте пізніше.';

  @override
  String get guildMembersIndexing => 'Індексуємо учасників…';

  @override
  String get guildMembersGoToPage => 'Перейти на сторінку';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'Перейти на сторінку $page';
  }

  @override
  String get guildMembersJumpToPage => 'Перейти на сторінку';

  @override
  String get guildMembersJoinSourceCreator => 'Творець спільноти';

  @override
  String get guildMembersJoinSourceInvite => 'Запросити';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Запрошення ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Запрошено $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'Власна URL-адреса';

  @override
  String get guildMembersJoinSourceBotInvite => 'Запрошення бота';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'Адміністратор платформи';

  @override
  String get guildMembersJoinSourceDiscovery => 'Пошук';

  @override
  String get guildMembersJoinMethodUnknown => 'Невідомо';

  @override
  String get guildMembersCommunityOwner => 'Власник спільноти';

  @override
  String get guildMembersViewAllRoles => 'Переглянути всі ролі';

  @override
  String get guildMembersJoinedJustNow => 'Щойно';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count хвилин тому',
      one: '1 хвилину тому',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count годин тому',
      one: '1 годину тому',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count днів тому',
      one: '1 день тому',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Учасники';

  @override
  String get guildMembersChannelListSelected => 'Учасники, вибрано';

  @override
  String get guildSettingsInvitesTitle => 'Запрошення';

  @override
  String get guildSettingsInvitesDescription =>
      'Переглянути всі запрошення для цієї спільноти. Щоб створити нове запрошення, перейдіть до каналу та скористайтеся кнопкою запрошення.';

  @override
  String get guildSettingsInvitesEmpty => 'Немає посилань-запрошень';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Ця спільнота ще не має посилань-запрошень. Перейдіть до каналу та створіть запрошення, щоб запросити людей.';

  @override
  String get guildSettingsInvitesLoadFailedTitle =>
      'Не вдалося завантажити запрошення';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Сталася помилка під час завантаження запрошень. Спробуйте ще раз.';

  @override
  String get guildSettingsInvitesTryAgain => 'Спробувати ще раз';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Показувати дату створення замість дати закінчення';

  @override
  String get guildSettingsInvitesPauseInvites => 'Призупинити запрошення';

  @override
  String get guildSettingsInvitesEnableInvites => 'Увімкнути запрошення';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Призупинити запрошення для цієї спільноти';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Увімкнути запрошення для цієї спільноти';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Призупинити запрошення? Нові користувачі не зможуть приєднатися за посиланнями-запрошеннями, доки ви їх не ввімкнете знову. На наявних учасників це не вплине.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Увімкнути запрошення? Користувачі знову зможуть приєднуватися до цієї спільноти за посиланнями-запрошеннями.';

  @override
  String get guildSettingsInvitesPause => 'Пауза';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Запрошення для цієї спільноти призупинено.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Запрошення призупинено, оскільки $productName виявив потенційну атаку. Нові користувачі наразі не можуть приєднатися.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Запросив:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Канал:';

  @override
  String get guildSettingsInvitesLabelCode => 'Код:';

  @override
  String get guildSettingsInvitesLabelUses => 'Використовує:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Створено:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Закінчується:';

  @override
  String get guildSettingsInvitesUnknown => 'Невідомо';

  @override
  String get guildSettingsInvitesNoCategory => 'Без категорії';

  @override
  String get guildSettingsInvitesExpired => 'Термін дії закінчився';

  @override
  String get guildSettingsInvitesNever => 'Ніколи';

  @override
  String get guildSettingsInvitesCopyLink => 'Копіювати посилання-запрошення';

  @override
  String get guildSettingsInvitesRevoke => 'Скасувати запрошення';

  @override
  String get guildSettingsInvitesRevokeFailedTitle =>
      'Не вдалося скасувати запрошення';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'Посилання може бути активним. Спробуйте ще раз пізніше.';

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
  String get guildSettingsEmojiSlotsTitle => 'Слоти для емодзі';

  @override
  String get guildSettingsEmojiDropZone => 'Перетягніть файли емодзі сюди';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Не вдалося завантажити емодзі. Спробуйте пізніше.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'Не знайдено емодзі, що відповідають вашому пошуку.';

  @override
  String get guildSettingsEmojiNoSlots => 'Немає вільних слотів для емодзі';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Ви досягли максимальної кількості емодзі. Видаліть деякі наявні емодзі, щоб звільнити місце.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Назви емодзі повинні містити щонайменше 2 символи та можуть використовувати літери, цифри та підкреслення. Розмір емодзі повинен бути меншим за $maxSize. Статичні зображення автоматично змінюються до розміру 128x128 пікселів і стискаються. Анімовані емодзі та SVG повинні вже відповідати обмеженню.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'Завантаження емодзі';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# емодзі',
      one: '# емодзі',
    );
    return 'Завантаження $_temp0. Це може зайняти деякий час.';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'Не вдалося завантажити емодзі. Спробуйте ще раз.';

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Деякі емодзі не вдалося додати';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'Перегляньте ці файли та спробуйте ще раз із меншими або простішими зображеннями.';

  @override
  String get guildSettingsEmojiRenameTitle => 'Перейменувати емодзі';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2–32 символи: літери, цифри, підкреслення.';

  @override
  String get guildSettingsEmojiColumnEmoji => 'Емодзі';

  @override
  String get guildSettingsEmojiColumnName => 'Назва';

  @override
  String get guildSettingsEmojiColumnUploader => 'Завантажено';

  @override
  String get guildSettingsEmojiUnknownUploader => 'Невідомо';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Видалити емодзі';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'Видалити :$name:? Це неможливо скасувати.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Видалити цей емодзі зі сховища та CDN';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'Назва емодзі має містити щонайменше 2 символи';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'Назва емодзі має бути не довшою ніж 32 символи';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Недійсна назва емодзі';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Не вдалося перейменувати цей емодзі';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'Назву було повернено до попередньої. Спробуйте ще раз за мить.';

  @override
  String get guildSettingsEmojiGoneTitle => 'Цього емодзі більше не існує';

  @override
  String get guildSettingsEmojiGoneBody =>
      'Можливо, його було видалено. Назву повернуто до попередньої.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'Ви не можете перейменувати цей емодзі';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'У вас немає дозволу перейменовувати цей емодзі. Назву було повернено до попередньої.';

  @override
  String get guildSettingsEmojiRateLimitedTitle => 'Ви надто поспішаєте';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'Зачекайте трохи й спробуйте перейменувати ще раз.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Не вдалося видалити цей емодзі';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'Ви не можете видалити цей емодзі';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'Дозволити іншим клонувати ваші емодзі';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'Якщо ввімкнено, учасники інших спільнот можуть використовувати ярлик \"Клонувати\" в програмі в один клік для ваших власних емодзі. Це не заважає їм зберігати зображення та завантажувати його самостійно.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Дозволити іншим клонувати ваші стікери';

  @override
  String get guildSettingsCloneStickerDescription =>
      'Якщо ввімкнено, учасники інших спільнот зможуть використовувати вбудовану функцію \"Клонувати\" в один клік для ваших стікерів. Це не завадить їм зберігати зображення та завантажувати їх самостійно.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Лише учасники з дозволом \"$permission\" можуть це змінити.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'Не вдалося оновити клонування емодзі';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Не вдалося оновити клонування стікерів';

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
  String get guildSettingsStickerSlotsTitle => 'Слоти для стікерів';

  @override
  String get guildSettingsStickerUploadTitle => 'Завантажити стікер';

  @override
  String get guildSettingsStickerDropZone =>
      'Перетягніть файл стікера сюди (по одному)';

  @override
  String get guildSettingsStickerDensity => 'Щільність стікерів';

  @override
  String get guildSettingsStickerDensityCozy => 'Затишний';

  @override
  String get guildSettingsStickerDensityCompact => 'Компактний';

  @override
  String get guildSettingsStickersLoadFailedTitle =>
      'Не вдалося завантажити стікери';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Під час завантаження стікерів сталася помилка. Спробуйте ще раз.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Не знайдено стікерів за вашим запитом.';

  @override
  String get guildSettingsStickersEmptySearch => 'Стікерів не знайдено';

  @override
  String get guildSettingsStickerNoSlots =>
      'Немає доступних слотів для стікерів';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Ви досягли максимальної кількості стікерів. Видаліть деякі наявні стікери, щоб звільнити місце.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Стікери зберігаються у розмірі 320x320 пікселів і повинні бути меншими за $maxSize. Статичні зображення автоматично змінюються та стискаються. Анімовані стікери та SVG повинні вже відповідати обмеженню.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle =>
      'Непідтримуваний файл стікера';

  @override
  String get guildSettingsStickerAddTitle => 'Додати стікер';

  @override
  String get guildSettingsStickerEditTitle => 'Редагувати стікер';

  @override
  String get guildSettingsStickerNameLabel => 'Назва';

  @override
  String get guildSettingsStickerNameHint => 'Мій чудовий стікер';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Опис';

  @override
  String get guildSettingsStickerDescriptionHint => 'Опишіть стікер';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Теги ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Додати тег';

  @override
  String get guildSettingsStickerTagAdd => 'Додати';

  @override
  String get guildSettingsStickerNameRequired => 'Необхідно вказати ім\'я';

  @override
  String get guildSettingsStickerNameTooShort =>
      'Ім\'я має містити щонайменше 2 символи';

  @override
  String get guildSettingsStickerNameTooLong =>
      'Ім\'я має містити не більше 30 символів';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'Опис має містити не більше 500 символів';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'Не вдалося створити цей стікер';

  @override
  String get guildSettingsStickerTooLargeTitle => 'Стікер завеликий';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'Не вдалося достатньо стиснути стікер';

  @override
  String get guildSettingsStickerDeleteTitle => 'Видалити стікер';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'Видалити \"$name\"? Це не можна буде скасувати.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Видалити цей стікер зі сховища та CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Не вдалося видалити цей стікер';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'Ви не можете видалити цю наліпку';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Щоб створити вебхук, відкрийте $channelSettingsPath. Тут ви все ще можете редагувати та впорядковувати всі наявні вебхуки.';
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
  String get guildSettingsInvitesTableExpires => 'Закінчується';

  @override
  String get guildSettingsAuditLogFilterUser => 'Фільтрувати за користувачем';

  @override
  String get guildSettingsAuditLogFilterAction => 'Фільтрувати за дією';

  @override
  String get createDm => 'Створити приватний чат';

  @override
  String get createGroupDm => 'Створити груповий чат';

  @override
  String get createDmNewMessage => 'Нове повідомлення';

  @override
  String get createDmSelectFriends => 'Вибрати друзів';

  @override
  String get createDmChooseFriendsSubtitle => 'Виберіть друзів для листування.';

  @override
  String get createDmSearchFriends => 'Пошук друзів';

  @override
  String get createDmNoFriendsFound => 'Друзів не знайдено';

  @override
  String get createDmNoFriendsYet => 'У вас ще немає друзів';

  @override
  String get createDmClaimToStartDms =>
      'Щоб почати особисті повідомлення, активуйте свій обліковий запис.';

  @override
  String get createDmVerifyToStartDms =>
      'Підтвердьте свою електронну пошту, щоб почати приватні повідомлення.';

  @override
  String get createDmVerifyYourEmail => 'Підтвердьте свою електронну пошту';

  @override
  String get createDmNewGroup => 'Нова група';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Створити нову групу з $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'Підтвердити нову групу';

  @override
  String get createDmCreateNewGroup => 'Створити нову групу';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'Видалити $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'У вас уже є група з цими користувачами. Ви справді хочете створити нову? Це теж нормально!';

  @override
  String get createDmNoActivityYet => 'Ще немає активності';

  @override
  String get createDmSomeUsersCantBeAdded =>
      'Деяких користувачів не можна додати';

  @override
  String get createDmCreateWithoutThem => 'Створити без них';

  @override
  String get createDmUnaddableIntro =>
      'Цих людей не можна додати до цієї групової переписки:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Створити груповий DM з рештою $count учасників і пропустити інших?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Не залишилося одержувачів, щоб створити груповий чат.';

  @override
  String get createDmUnaddableUserNotFound => 'Користувача не знайдено';

  @override
  String get createDmUnaddableBlocked =>
      'Ви не можете надіслати повідомлення цьому користувачеві';

  @override
  String get createDmUnaddableNotFriends => 'Немає у списку друзів';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Не можна додати до групових чатів';

  @override
  String get createDmFailed => 'Не вдалося створити розмову. Спробуйте ще раз.';

  @override
  String get dmListMessagesTitle => 'Повідомлення';

  @override
  String get dmListDirectMessagesTitle => 'Особисті повідомлення';

  @override
  String get keybindsSearchShortcuts => 'Пошук комбінацій клавіш';

  @override
  String get keybindSectionDefaults => 'За замовчуванням';

  @override
  String get keybindSectionMessages => 'Повідомлення';

  @override
  String get keybindSectionNavigation => 'Навігація';

  @override
  String get keybindSectionDragAndDrop => 'Перетягування';

  @override
  String get keybindSectionChat => 'Чат';

  @override
  String get keybindSectionVoiceAndVideo => 'Голосові та відеодзвінки';

  @override
  String get keybindSectionMisc => 'Різне';

  @override
  String get keybindActionShowShortcutsList => 'Показати список швидких клавіш';

  @override
  String get keybindActionCopyText => 'Копіювати текст';

  @override
  String get keybindActionMarkUnread => 'Позначити як непрочитане';

  @override
  String get keybindActionFocusTextarea => 'Фокусувати текстове поле';

  @override
  String get keybindActionSwitchCommunities => 'Перемикатися між спільнотами';

  @override
  String get keybindActionSwitchChannels => 'Перемикатися між каналами';

  @override
  String get keybindActionHistoryBack =>
      'Перейти до попереднього переглянутого каналу';

  @override
  String get keybindActionHistoryForward =>
      'Перейти вперед по історії переглянутих каналів';

  @override
  String get keybindActionJumpUnreadChannels =>
      'Перейти між непрочитаними каналами';

  @override
  String get keybindActionJumpMentionChannels =>
      'Перейти до непрочитаних каналів зі згадками';

  @override
  String get keybindActionJumpCurrentCall => 'Перейти до поточного дзвінка';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Перемикатися між останньою спільнотою та приватними чатами';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Перейти до попередньої спільноти або приватних повідомлень';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Перейти до наступної спільноти або приватних чатів';

  @override
  String get keybindActionGoToDms => 'Перейти до особистих повідомлень';

  @override
  String get keybindActionGoToFirstCommunity => 'Перейти до першої спільноти';

  @override
  String get keybindActionGoToSecondCommunity => 'Перейти до другої спільноти';

  @override
  String get keybindActionGoToThirdCommunity => 'Перейти до третьої спільноти';

  @override
  String get keybindActionGoToFourthCommunity =>
      'Перейти до четвертої спільноти';

  @override
  String get keybindActionGoToFifthCommunity => 'Перейти до п\'ятої спільноти';

  @override
  String get keybindActionGoToSixthCommunity => 'Перейти до шостої спільноти';

  @override
  String get keybindActionGoToSeventhCommunity => 'Перейти до сьомої спільноти';

  @override
  String get keybindActionGoToEighthCommunity => 'Перейти до восьмої спільноти';

  @override
  String get keybindActionToggleQuickSwitcher => 'Перемкнути швидкий перемикач';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'Створити або приєднатися до спільноти';

  @override
  String get keybindActionStartDragAndDrop => 'Почати перетягування';

  @override
  String get keybindActionMove => 'Перемістити';

  @override
  String get keybindActionDropItem => 'Викинути предмет';

  @override
  String get keybindActionCancel => 'Скасувати';

  @override
  String get keybindActionMarkCommunityRead =>
      'Позначити спільноту як прочитану';

  @override
  String get keybindActionMarkChannelRead => 'Позначити канал як прочитаний';

  @override
  String get keybindActionStartGroupDm => 'Створити груповий чат';

  @override
  String get keybindActionTogglePinnedMessages =>
      'Перемкнути закріплені повідомлення';

  @override
  String get keybindActionToggleInbox => 'Перемкнути вхідні';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Позначити верхній канал вхідних як прочитаний';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Позначити всі канали вхідних як прочитані';

  @override
  String get keybindActionToggleMemberList =>
      'Перемкнути список учасників або голосовий чат';

  @override
  String get keybindActionToggleEmojiPicker => 'Відкрити/закрити панель емодзі';

  @override
  String get keybindActionToggleGifPicker => 'Відкрити/закрити панель GIF';

  @override
  String get keybindActionToggleStickerPicker => 'Перемкнути панель стікерів';

  @override
  String get keybindActionScrollChatUp => 'Прокрутити чат угору';

  @override
  String get keybindActionScrollChatDown => 'Прокрутити чат униз';

  @override
  String get keybindActionJumpOldestUnread =>
      'Перейти до найстарішого непрочитаного повідомлення';

  @override
  String get keybindActionFocusComposer => 'Фокусувати текстове поле';

  @override
  String get keybindActionUploadFile => 'Завантажити файл';

  @override
  String get keybindActionCopyChannelLink => 'Копіювати посилання на канал';

  @override
  String get keybindActionToggleSavedMedia => 'Перемкнути збережені медіа';

  @override
  String get keybindActionSendVoiceMessage => 'Надіслати голосове повідомлення';

  @override
  String get keybindActionAnswerCall => 'Відповісти на вхідний дзвінок';

  @override
  String get keybindActionDeclineCall => 'Відхилити вхідний дзвінок';

  @override
  String get keybindActionStartDmCall =>
      'Почати дзвінок в особистому або груповому чаті';

  @override
  String get keybindActionToggleSoundboard => 'Увімкнути/вимкнути деку звуків';

  @override
  String get keybindActionToggleCompactCallView =>
      'Розгорнути або згорнути компактний вигляд дзвінка';

  @override
  String get keybindActionPushToTalkPriority => 'Натисни і говори (пріоритет)';

  @override
  String get keybindActionVoiceActivityPriority =>
      'Пріоритет голосової активності';

  @override
  String get keybindActionOpenHelp => 'Відкрити довідку';

  @override
  String get keybindActionSearchMessages => 'Пошук повідомлень';

  @override
  String get keybindActionOpenContextMenu => 'Відкрити контекстне меню';

  @override
  String get keybindActionOpenSettings => 'Відкрийте налаштування';

  @override
  String get keybindActionOpenThemeStudio =>
      'Відкрити спливаюче вікно студії тем';

  @override
  String get keybindActionZoomIn => 'Збільшити';

  @override
  String get keybindActionZoomOut => 'Зменшити масштаб';

  @override
  String get keybindActionZoomReset => 'Скинути масштаб';

  @override
  String get clipboardPasteFailed =>
      'Не вдалося вставити. Буфер обміну порожній або заблокований для цього застосунку.';

  @override
  String get homeQuickActionDms => 'Особисті';
}
