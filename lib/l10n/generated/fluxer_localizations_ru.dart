// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class FluxerLocalizationsRu extends FluxerLocalizations {
  FluxerLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get reconnectingTitle => 'Что-то пошло не так!';

  @override
  String get reconnectingBody =>
      'Что-то не так с сервером.\nПостараемся исправить в ближайшее время!';

  @override
  String get gatewayReconnectingToast => 'Переподключение…';

  @override
  String get gatewayConnectedToast => 'Подключено';

  @override
  String get sessionExpiredToast =>
      'Ваша сессия истекла. Пожалуйста, войдите снова.';

  @override
  String splashStartupFailed(String error) {
    return 'Не удалось запустить: $error';
  }

  @override
  String get retry => 'Повторить';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Соединение потеряно';

  @override
  String get splashViewOnStatusPage => 'Посмотреть на странице статуса';

  @override
  String get splashConnectionIssuesPrompt => 'Проблемы с подключением?';

  @override
  String get splashStatusPageLink => 'Страница статуса';

  @override
  String get splashReadIncident => 'Подробнее об инциденте';

  @override
  String get splashIncidentHistory => 'История инцидентов';

  @override
  String get nagbarLearnMore => 'Подробнее';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'Запланировано техническое обслуживание на $localizedTime. Ожидаемая продолжительность: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Проводятся технические работы. Ожидаемая продолжительность: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'Обслуживание завершено.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Привет, $displayName! Зарегистрируйте аккаунт, чтобы не потерять к нему доступ.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Привет, $displayName! Пожалуйста, подтвердите свой адрес электронной почты.';
  }

  @override
  String get nagbarOpenSettings => 'Открыть настройки';

  @override
  String get systemPermissionSettingsTitle => 'Включить разрешение';

  @override
  String get systemPermissionSettingsOpenSettings => 'Открыть настройки';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return 'У $productName нет доступа к вашему микрофону. Вы можете включить его в настройках конфиденциальности вашего устройства.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return 'У $productName нет доступа к вашей камере. Вы можете включить его в настройках конфиденциальности устройства.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return 'У $productName нет доступа к вашей фотогалерее. Вы можете включить его в настройках конфиденциальности вашего устройства.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return 'У $productName нет разрешения на отправку уведомлений. Вы можете включить его в настройках устройства.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Ваша подписка не была продлена, но у вас все еще есть доступ к преимуществам $productName до $graceDate. Примите меры сейчас, иначе вы потеряете все преимущества.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Ваша подписка на $productName истекла. Продлите её сейчас, чтобы сохранить свои преимущества.';
  }

  @override
  String get nagbarManageSubscription => 'Управлять подпиской';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Добро пожаловать в $productFullName. Изучите преимущества вашего $productName и управляйте подпиской.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'Посмотреть функции $productName';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'У вас есть новый подарочный код в инвентаре подарков.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'У вас $count новых подарочных кодов в инвентаре подарков.';
  }

  @override
  String get nagbarViewGiftInventory => 'Посмотреть подарки';

  @override
  String get nagbarVisionaryMfa =>
      'Включите двухфакторную аутентификацию для защиты вашей учётной записи Visionary.';

  @override
  String get nagbarEnableMfa => 'Включить двухфакторную аутентификацию';

  @override
  String get nagbarTermsAcceptance =>
      'Мы обновили наши условия. Пожалуйста, ознакомьтесь с ними и примите, чтобы продолжить.';

  @override
  String get nagbarReviewTerms => 'Просмотреть условия';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Присоединяйтесь к $communityName, чтобы общаться с командой и быть в курсе событий.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Присоединиться к $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'Включите уведомления, чтобы не пропускать сообщения и упоминания.';

  @override
  String get nagbarEnableNotifications => 'Включить уведомления';

  @override
  String get nagbarBillingPortalFailed =>
      'Не удалось открыть портал оплаты. Попробуйте снова через мгновение.';

  @override
  String get welcomeBack => 'С возвращением';

  @override
  String get email => 'Email';

  @override
  String get emailInvalid =>
      'Пожалуйста, введите действительный адрес электронной почты.';

  @override
  String get password => 'Пароль';

  @override
  String get forgotPassword => 'Забыли пароль?';

  @override
  String get logIn => 'Войти';

  @override
  String get logInWithPasskey => 'Войти с помощью ключа доступа';

  @override
  String continueWithSso(String provider) {
    return 'Продолжить через $provider';
  }

  @override
  String get ssoRequired => 'Для доступа к этому экземпляру требуется SSO.';

  @override
  String get organizationSsoProvider =>
      'Войдите через поставщика единого входа вашей организации.';

  @override
  String get failedToStartSso => 'Не удалось запустить SSO';

  @override
  String get ssoCancelled => 'Вход через SSO был отменен';

  @override
  String preferSso(String provider) {
    return 'Предпочитаете использовать SSO? Продолжите через $provider.';
  }

  @override
  String get logInViaBrowser => 'Войти через браузер';

  @override
  String get needAccountPrompt => 'Нет аккаунта? ';

  @override
  String get register => 'Зарегистрироваться';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Подтвердите, что вы человек';

  @override
  String get captchaDescription =>
      'Нам нужно убедиться, что вы не бот. Пожалуйста, пройдите проверку ниже.';

  @override
  String get captchaSwitchToHcaptcha =>
      'Проблемы? Попробуйте hCaptcha вместо этого';

  @override
  String get captchaSwitchToTurnstile => 'Попробуйте Turnstile вместо этого';

  @override
  String get cancel => 'Отмена';

  @override
  String get ipAuthCheckEmail => 'Проверьте почту';

  @override
  String ipAuthDescription(String email) {
    return 'Мы отправили ссылку для авторизации этого входа на $email. Пожалуйста, проверьте свой почтовый ящик.';
  }

  @override
  String get ipAuthConnectionLost => 'Соединение потеряно';

  @override
  String get ipAuthConnectionLostDescription =>
      'Мы потеряли соединение в ожидании авторизации. Пожалуйста, попробуйте снова.';

  @override
  String get ipAuthLinkExpired => 'Ссылка для входа истекла';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Срок действия этой ссылки авторизации истек. Пожалуйста, войдите снова.';

  @override
  String get ipAuthResendEmail => 'Отправить письмо повторно';

  @override
  String get ipAuthResent => 'Отправлено повторно';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '$secondsс';
  }

  @override
  String get back => 'Назад';

  @override
  String get next => 'Далее';

  @override
  String get mfaTitle => 'Двухфакторная аутентификация';

  @override
  String get mfaChooseMethod => 'Выберите способ проверки';

  @override
  String get mfaMethodTotp => 'Приложение-аутентификатор';

  @override
  String get mfaMethodWebauthn => 'Ключ безопасности / Ключ доступа';

  @override
  String get mfaTotpDescription =>
      'Введите 6-значный код из вашего приложения-аутентификатора или один из ваших резервных кодов.';

  @override
  String get mfaCodeLabel => 'Код';

  @override
  String get mfaTryAnotherMethod => 'Попробовать другой способ';

  @override
  String get mfaUseSecurityKey => 'Использовать ключ безопасности / пароль';

  @override
  String get accountSelectorTitle => 'Выберите аккаунт';

  @override
  String get accountSelectorDescription =>
      'Выберите аккаунт для продолжения или добавьте другой.';

  @override
  String get accountAdd => 'Добавить аккаунт';

  @override
  String get accountRemove => 'Удалить';

  @override
  String accountRemoveTitle(String username) {
    return 'Удалить $username';
  }

  @override
  String get accountRemoveDescription =>
      'Это удалит сохраненный сеанс для этого аккаунта.';

  @override
  String get accountRemoveOnlyDescription =>
      'Это удалит единственный сохраненный аккаунт на этом устройстве.';

  @override
  String get accountExpired => 'Истек срок действия';

  @override
  String accountSessionExpired(String identifier) {
    return 'Срок действия сеанса для $identifier истек. Пожалуйста, войдите снова.';
  }

  @override
  String get accountManageTitle => 'Управление аккаунтами';

  @override
  String get accountSwitchFailed =>
      'Не удалось переключить аккаунты. Попробуйте снова.';

  @override
  String get profileTabMenuSwitchAccounts => 'Переключить аккаунты';

  @override
  String get statusChangeSheetTitle => 'Установить статус';

  @override
  String get statusOnlineStatusSection => 'Статус присутствия';

  @override
  String get statusOnline => 'В сети';

  @override
  String get statusIdle => 'Неактивен';

  @override
  String get statusDnd => 'Не беспокоить';

  @override
  String get statusInvisible => 'Невидимый';

  @override
  String get statusOffline => 'Офлайн';

  @override
  String get statusUntilIChangeIt => 'Пока я не изменю';

  @override
  String get statusDontClear => 'Не удалять';

  @override
  String get statusFor10Seconds => 'На 10 секунд';

  @override
  String get statusClearAfter10Seconds => '10 секунд';

  @override
  String get statusClearAfter15Minutes => '15 минут';

  @override
  String get statusClearAfter30Minutes => '30 минут';

  @override
  String get statusClearAfter1Hour => '1 час';

  @override
  String get statusClearAfter3Hours => '3 часа';

  @override
  String get statusClearAfter4Hours => '4 часа';

  @override
  String get statusClearAfter8Hours => '8 часов';

  @override
  String get statusClearAfter24Hours => '24 часа';

  @override
  String get statusClearAfter3Days => '3 дня';

  @override
  String get statusDndDescription =>
      'Вы не будете получать уведомления на рабочем столе';

  @override
  String get statusInvisibleDescription => 'Вы будете отображаться как офлайн';

  @override
  String get customStatusSetTitle => 'Установить пользовательский статус';

  @override
  String get customStatusCurrentHint => 'Пользовательский статус';

  @override
  String get customStatusClear => 'Очистить пользовательский статус';

  @override
  String get customStatusPlaceholder => 'Что происходит?';

  @override
  String get customStatusChooseEmoji => 'Выберите эмодзи';

  @override
  String get customStatusClearAfter => 'Очистить через';

  @override
  String get customStatusSave => 'Сохранить';

  @override
  String get accountActive => 'Активный аккаунт';

  @override
  String get signOut => 'Выйти';

  @override
  String get suspendedPermanentTitle => 'Аккаунт заблокирован навсегда';

  @override
  String get suspendedTemporaryTitle => 'Аккаунт заблокирован';

  @override
  String get suspendedPermanentDescription =>
      'Ваш аккаунт был навсегда заблокирован за нарушение наших Условий обслуживания.';

  @override
  String get suspendedTemporaryDescription =>
      'Ваш аккаунт был временно заблокирован. Вы сможете получить доступ к своему аккаунту после окончания срока блокировки.';

  @override
  String get suspendedIssuedAt => 'Выдано';

  @override
  String get suspendedEndsAt => 'Заканчивается';

  @override
  String get suspendedDuration => 'Продолжительность';

  @override
  String get suspendedPermanent => 'Навсегда';

  @override
  String get suspendedReason => 'Причина';

  @override
  String get suspendedAppealDeadline => 'Срок апелляции';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Ваш аккаунт запланирован к удалению $date.';
  }

  @override
  String get suspendedRecheck => 'Проверить обновления';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Повторить через $secondsс';
  }

  @override
  String get suspendedBackToLogin => 'Назад к входу';

  @override
  String get suspendedAppealTitle => 'Апелляция';

  @override
  String get suspendedAppealHint =>
      'Объясните, почему вашу блокировку следует пересмотреть (минимум 50 символов)...';

  @override
  String get suspendedAppealSubmit => 'Отправить апелляцию';

  @override
  String get suspendedAppealPending => 'Ожидает рассмотрения';

  @override
  String get suspendedAppealAccepted => 'Апелляция принята';

  @override
  String get suspendedAppealRejected => 'Апелляция отклонена';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Ваша апелляция была принята, и ваш аккаунт восстановлен.';

  @override
  String get suspendedSignIn => 'Войти в аккаунт';

  @override
  String get forgotPasswordTitle => 'Забыли пароль?';

  @override
  String get forgotPasswordDescription =>
      'Введите ваш адрес электронной почты, и мы отправим ссылку для сброса пароля.';

  @override
  String get forgotPasswordSubmit => 'Отправить ссылку для сброса';

  @override
  String get forgotPasswordSentTitle => 'Проверьте почту';

  @override
  String get forgotPasswordSentDescription =>
      'Мы отправили инструкции по сбросу пароля на ваш адрес электронной почты. Пожалуйста, проверьте папку «Входящие» и перейдите по ссылке для сброса пароля.';

  @override
  String get forgotPasswordBackToLogin => 'Вернуться ко входу';

  @override
  String get resetPasswordTitle => 'Установите новый пароль';

  @override
  String get resetPasswordDescription =>
      'Введите ваш новый пароль ниже, чтобы завершить процесс сброса.';

  @override
  String get resetPasswordNewPassword => 'Новый пароль';

  @override
  String get resetPasswordConfirm => 'Подтвердите новый пароль';

  @override
  String get resetPasswordSubmit => 'Сбросить пароль';

  @override
  String get resetPasswordMismatch => 'Пароли не совпадают.';

  @override
  String get registerTitle => 'Создать аккаунт';

  @override
  String get registerDisplayName => 'Отображаемое имя (необязательно)';

  @override
  String get registerDisplayNameHint => 'Как вас должны звать?';

  @override
  String get registerUsername => 'Имя пользователя (необязательно)';

  @override
  String get registerUsernameHint =>
      'Оставьте пустым для случайного имени пользователя';

  @override
  String get registerUsernameTagHint =>
      '4-значный тег будет добавлен автоматически для обеспечения уникальности';

  @override
  String get registerDateOfBirth => 'Дата рождения';

  @override
  String get registerMonth => 'Месяц';

  @override
  String get registerDay => 'День';

  @override
  String get registerYear => 'Год';

  @override
  String get registerConsent =>
      'Я согласен с Условиями обслуживания и Политикой конфиденциальности';

  @override
  String get registerConsentPrefix => 'Я согласен с ';

  @override
  String get registerConsentTerms => 'Условиями обслуживания';

  @override
  String get registerConsentAnd => ' и ';

  @override
  String get registerConsentPrivacy => 'Политикой конфиденциальности';

  @override
  String get registerConfirmPassword => 'Подтвердите пароль';

  @override
  String get registerSubmit => 'Создать аккаунт';

  @override
  String get registerHaveAccount => 'Уже есть аккаунт? ';

  @override
  String get registerPendingApproval =>
      'Ваш запрос на создание аккаунта ожидает одобрения. Вы сможете войти после одобрения администратором.';

  @override
  String get registerClosed =>
      'Регистрация сейчас закрыта. Чтобы создать аккаунт, используйте регистрационную ссылку от администратора.';

  @override
  String get passkeyNoCredentials =>
      'Ключи доступа для этого приложения не найдены. Вместо этого войдите с помощью электронной почты и пароля.';

  @override
  String get passkeyDeviceNotSupported =>
      'Ключи доступа не поддерживаются на этом устройстве.';

  @override
  String get passkeyDomainNotAssociated =>
      'Ключи доступа не настроены для этого приложения. Вместо этого войдите с помощью электронной почты и пароля.';

  @override
  String get passkeyTimeout =>
      'Время ожидания аутентификации ключа доступа истекло. Пожалуйста, попробуйте еще раз.';

  @override
  String get passkeyNotAvailable =>
      'Ключи доступа недоступны для этого приложения. Вместо этого войдите с помощью электронной почты и пароля.';

  @override
  String get passkeyFailed =>
      'Не удалось выполнить аутентификацию с помощью ключа доступа. Попробуйте еще раз.';

  @override
  String get errorUnableToCreateAccount =>
      'Не удалось создать учетную запись. Попробуйте еще раз.';

  @override
  String get errorUnableToSignIn =>
      'Не удалось войти в систему прямо сейчас. Попробуйте еще раз.';

  @override
  String get errorServiceUnavailable =>
      'Этот экземпляр временно недоступен. Попробуйте снова через мгновение.';

  @override
  String get errorInvalidEmailOrPassword =>
      'Неверный адрес электронной почты или пароль.';

  @override
  String get errorUnableToSendResetLink =>
      'Не удалось отправить ссылку для сброса. Попробуйте еще раз.';

  @override
  String get errorUnableToResetPassword =>
      'Не удалось сбросить пароль. Попробуйте еще раз.';

  @override
  String get embedInviteJoin => 'Присоединиться к сообществу';

  @override
  String get embedInviteGoTo => 'Перейти в сообщество';

  @override
  String embedInviteOnline(String count) {
    return '$count онлайн';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count участников';
  }

  @override
  String get embedInviteUnknownTitle => 'Неизвестное приглашение';

  @override
  String get embedInviteUnknownSubtitle =>
      'Попробуйте запросить новое приглашение.';

  @override
  String get embedInviteUnavailable => 'Приглашение недоступно';

  @override
  String get embedInviteJoinGroup => 'Присоединиться к группе';

  @override
  String get embedInviteAlreadyJoined => 'Уже в чате';

  @override
  String get embedInviteDisabled => 'Приглашения отключены';

  @override
  String get embedInvitePaused =>
      'Приглашения для этого сообщества приостановлены.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName обнаружил потенциальную рейдовую атаку, поэтому новые пользователи пока не могут присоединиться.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Приглашения в это сообщество приостановлены. Попробуйте позже.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName обнаружил потенциальную атаку в этом сообществе. Приглашения приостановлены, поэтому новые пользователи пока не могут присоединиться.';
  }

  @override
  String get inviteAcceptTitle => 'Вас пригласили присоединиться';

  @override
  String get inviteAcceptJoinButton => 'Присоединиться к сообществу';

  @override
  String get inviteAcceptGoToButton => 'Перейти в сообщество';

  @override
  String get inviteAcceptInvitesPaused => 'Приглашения приостановлены';

  @override
  String get inviteAcceptNotFoundTitle => 'Приглашение недействительно';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Это приглашение может быть просрочено или недействительно.';

  @override
  String get invalidDeepLinkTitle => 'Не удалось открыть ссылку';

  @override
  String get invalidDeepLinkDescription =>
      'Эта ссылка может быть недействительной, доступна только в интернете или у вас нет доступа. Проверьте ссылку и попробуйте снова.';

  @override
  String get invalidDeepLinkGoHomeButton => 'На главную';

  @override
  String get inviteAcceptJoinGroupButton => 'Присоединиться к группе';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Вас пригласил $inviterName в групповой чат';
  }

  @override
  String get inviteAcceptSomeone => 'кто-то';

  @override
  String get inviteAcceptEmojiPack => 'Набор эмодзи';

  @override
  String get inviteAcceptStickerPack => 'Набор стикеров';

  @override
  String get inviteAcceptInstallEmojiPack => 'Установить набор эмодзи';

  @override
  String get inviteAcceptInstallStickerPack => 'Установить набор стикеров';

  @override
  String get inviteAcceptPackInstallNote =>
      'Принятие этого приглашения автоматически установит набор.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Доступ к каналу запрещен';

  @override
  String get channelAccessDeniedDescription =>
      'У вас нет доступа к каналу, где было отправлено это сообщение.';

  @override
  String get messageJumpLinkNoAccess => 'Нет доступа';

  @override
  String get okay => 'ОК';

  @override
  String get embedThemeTitle => 'Общая тема';

  @override
  String get embedThemeSubtitle =>
      'Этот клиент не поддерживает пользовательские темы.';

  @override
  String get embedThemeUnavailableButton => 'Темы недоступны';

  @override
  String embedGiftVisionaryLifetime(String productName) {
    return '«Визионер» (навсегда $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дней $productName',
      one: '1 день $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count недель $productName',
      one: '1 неделя $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count месяцев $productName',
      one: '1 месяц $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count лет $productName',
      one: '1 год $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'От $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'Нажмите, чтобы забрать подарок!';

  @override
  String get embedGiftAlreadyRedeemed => 'Уже активирован';

  @override
  String get embedGiftClaimAccountHelp =>
      'Чтобы получить подарок, привяжите аккаунт.';

  @override
  String get embedGiftClaim => 'Забрать подарок';

  @override
  String get embedGiftClaimed => 'Подарок получен';

  @override
  String get embedGiftClaimAccount => 'Войдите в аккаунт, чтобы получить';

  @override
  String get embedGiftUnknownTitle => 'Неизвестный подарок';

  @override
  String get embedGiftUnknownSubtitle =>
      'Этот подарочный код недействителен или уже использован.';

  @override
  String get embedGiftUnavailable => 'Подарок недоступен';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Получите свой подарок, чтобы активировать подписку на $productName!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'Этот подарок уже был получен.';

  @override
  String get giftAcceptMaybeLater => 'Позже';

  @override
  String get giftRedeemedToast => 'Подарок активирован!';

  @override
  String get giftRedeemInvalidTitle => 'Недействительный подарочный код';

  @override
  String get giftRedeemInvalidMessage =>
      'Этот код недействителен или уже использован.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Подарок уже активирован';

  @override
  String get giftRedeemAlreadyRedeemedMessage =>
      'Этот код уже был активирован.';

  @override
  String get giftRedeemNotFoundTitle => 'Подарок не найден';

  @override
  String get giftRedeemNotFoundMessage => 'Такого кода не существует.';

  @override
  String get giftRedeemFailedTitle => 'Не удалось активировать подарок';

  @override
  String get giftRedeemFailedMessage =>
      'Не удалось активировать этот подарок. Попробуйте ещё раз.';

  @override
  String get giftVisionaryCannotRedeemTitle =>
      'Не удается активировать этот подарок';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Пользователи Visionary не могут активировать подарки Plutonium. Вместо этого скопируйте ссылку, чтобы поделиться ею с другом.';

  @override
  String get giftCopyLink => 'Скопировать ссылку на подарок';

  @override
  String get privacySettings => 'Настройки конфиденциальности';

  @override
  String get privacyDirectMessages => 'Личные сообщения';

  @override
  String get privacyDirectMessagesDescription =>
      'Разрешить личные сообщения от других участников этого сообщества';

  @override
  String get privacyBotDirectMessages => 'Личные сообщения от ботов';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Разрешить ботам из этого сообщества отправлять вам личные сообщения';

  @override
  String get privacyMutualDmsDisabled =>
      'Администраторы сообщества отключили получение личных сообщений только от общих участников этого сообщества.';

  @override
  String get communityDebug => 'Отладка сообщества';

  @override
  String get copiedToClipboard => 'Скопировано в буфер обмена';

  @override
  String get notificationSettings => 'Настройки уведомлений';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Отключить уведомления для $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Отключение уведомлений сообщества предотвращает появление индикаторов непрочитанных сообщений и уведомлений, если только вы не упомянуты.';

  @override
  String get notificationCommunitySettings =>
      'Настройки уведомлений сообщества';

  @override
  String get notificationAllMessages => 'Все сообщения';

  @override
  String get notificationOnlyMentions => 'Только упоминания';

  @override
  String get notificationNothing => 'Ничего';

  @override
  String get notificationSuppressEveryone => 'Подавлять @everyone и @here';

  @override
  String get notificationSuppressRoles => 'Подавлять все упоминания ролей';

  @override
  String get notificationMobilePush => 'Мобильные push-уведомления';

  @override
  String get notificationOverrides => 'Настройки уведомлений';

  @override
  String get notificationSelectChannel => 'Выберите канал или категорию';

  @override
  String get notificationOnlyAtMentions => 'Только @упоминания';

  @override
  String get notificationMuteChannel => 'Отключить уведомления канала';

  @override
  String get notificationUnmuteChannel => 'Включить уведомления канала';

  @override
  String get notificationUseCategoryDefault =>
      'Использовать настройки категории по умолчанию';

  @override
  String get notificationUseCommunityDefault =>
      'Использовать настройки сообщества по умолчанию';

  @override
  String get notificationNoCategory => 'Без категории';

  @override
  String get dmMarkAsRead => 'Отметить как прочитанное';

  @override
  String get dmMuteConversation => 'Отключить личные сообщения';

  @override
  String get dmUnmuteConversation => 'Включить личные сообщения';

  @override
  String get dmPinDm => 'Закрепить личные сообщения';

  @override
  String get dmUnpinDm => 'Открепить личные сообщения';

  @override
  String get dmAlwaysShowInSidebar => 'Всегда показывать в боковой панели';

  @override
  String get dmRemoveFromAlwaysShown => 'Убрать из всегда показанных';

  @override
  String get dmCloseDm => 'Закрыть личные сообщения';

  @override
  String get dmCloseDmConfirmTitle => 'Закрыть личные сообщения';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Вы уверены, что хотите закрыть личные сообщения с $username? Вы всегда сможете открыть их позже.';
  }

  @override
  String get dmDeleteMyMessagesTitle => 'Удалить свои сообщения в этом чате?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Это навсегда удалит все сообщения, которые вы когда-либо отправляли в этом чате. Отменить это действие будет невозможно.';

  @override
  String get dmCopyChannelId => 'Скопировать ID канала';

  @override
  String get dmChannelIdCopied => 'ID канала скопирован';

  @override
  String get dmCopyUserId => 'Скопировать ID пользователя';

  @override
  String get dmUserIdCopied => 'ID пользователя скопирован';

  @override
  String get dmViewProfile => 'Посмотреть профиль';

  @override
  String get dmVoiceCall => 'Начать голосовой вызов';

  @override
  String get incomingVoiceCallTitle => 'Входящий голосовой вызов';

  @override
  String get incomingVoiceCallAccept => 'Принять';

  @override
  String get incomingVoiceCallDecline => 'Отклонить';

  @override
  String get incomingVoiceCallLabel => 'Входящий вызов';

  @override
  String get incomingVoiceCallIgnore => 'Пропустить';

  @override
  String get directVoiceCallNotEligible =>
      'Этот вызов не может быть начат прямо сейчас. Попробуйте позже.';

  @override
  String get voiceJoinCallFailed =>
      'Не удалось подключиться к этому вызову. Проверьте соединение и попробуйте снова.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Не удалось присоединиться к этому вызову. Проверьте соединение и попробуйте снова.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Не удалось обновить этот вызов на сервере. Проверьте соединение и попробуйте снова.';

  @override
  String get dmAddNote => 'Добавить заметку';

  @override
  String get dmEditGroup => 'Изменить группу';

  @override
  String get dmInviteToCommunity => 'Пригласить в сообщество';

  @override
  String get dmBlock => 'Заблокировать';

  @override
  String get dmLeaveGroup => 'Покинуть группу';

  @override
  String get dmNoCommunitiesAvailable => 'Нет доступных сообществ';

  @override
  String dmGroupMemberCount(int count) {
    return '$count участников';
  }

  @override
  String get dmMuteFor15Min => 'На 15 минут';

  @override
  String get dmMuteFor30Min => 'На 30 минут';

  @override
  String get dmMuteFor1Hour => 'На 1 час';

  @override
  String get dmMuteFor3Hours => 'На 3 часа';

  @override
  String get dmMuteFor4Hours => 'На 4 часа';

  @override
  String get dmMuteFor8Hours => 'На 8 часов';

  @override
  String get dmMuteFor24Hours => 'На 24 часа';

  @override
  String get dmMuteFor3Days => 'На 3 дня';

  @override
  String get dmMuteForever => 'До отключения';

  @override
  String get dmPinGroupDm => 'Закрепить групповые личные сообщения';

  @override
  String get dmUnpinGroupDm => 'Открепить групповой ЛС';

  @override
  String get dmUnnamedGroup => 'Безымянная группа';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'Группа $resolvedName';
  }

  @override
  String get dmFavoriteDm => 'Добавить ЛС в избранное';

  @override
  String get dmUnfavoriteDm => 'Удалить ЛС из избранного';

  @override
  String get dmFavoriteGroupDm => 'Добавить групповой ЛС в избранное';

  @override
  String get dmUnfavoriteGroupDm => 'Удалить групповой ЛС из избранного';

  @override
  String get dmChangeFriendNickname => 'Изменить ник друга';

  @override
  String get dmRemoveFriend => 'Удалить друга';

  @override
  String get dmAddFriend => 'Добавить друга';

  @override
  String get dmAcceptFriendRequest => 'Принять запрос в друзья';

  @override
  String get dmIgnoreFriendRequest => 'Отклонить запрос в друзья';

  @override
  String get dmFriendRequestSent => 'Запрос в друзья отправлен';

  @override
  String get dmUnblock => 'Разблокировать';

  @override
  String get dmDebugUser => 'Отладка пользователя';

  @override
  String get dmDebugChannel => 'Отладка канала';

  @override
  String get dmDebugCategory => 'Отладка категории';

  @override
  String get dmPinned => 'ЛС закреплено';

  @override
  String get dmUnpinned => 'ЛС откреплено';

  @override
  String get dmMuted => 'ЛС заглушено';

  @override
  String get dmUnmuted => 'ЛС включено';

  @override
  String get dmRemoveFriendConfirmTitle => 'Удалить друга';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Вы уверены, что хотите удалить $username из друзей?';
  }

  @override
  String get dmBlockConfirmTitle => 'Заблокировать пользователя';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Вы уверены, что хотите заблокировать $username? Он не сможет писать вам или отправлять запросы в друзья.';
  }

  @override
  String get dmFriendRequestSentToast => 'Запрос в друзья отправлен';

  @override
  String get dmFriendRequestFailed => 'Не удалось отправить запрос в друзья';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Не удалось принять запрос в друзья';

  @override
  String get dmRemoveFriendFailed => 'Не удалось удалить друга';

  @override
  String get dmBlockFailed => 'Не удалось заблокировать пользователя';

  @override
  String get dmUnblockFailed => 'Не удалось разблокировать пользователя';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Не удалось отклонить запрос в друзья';

  @override
  String get dmAddFriends => 'Добавить друзей';

  @override
  String get addFriendSheetTitle => 'Добавить друга';

  @override
  String get addFriendUsernameHint => 'Имя пользователя#0000';

  @override
  String get addFriendUsernameLabel => 'Имя пользователя друга';

  @override
  String get addFriendSendRequest => 'Отправить запрос';

  @override
  String get addFriendNoUserFound => 'Пользователь с таким именем не найден.';

  @override
  String get addFriendInvalidUsername =>
      'Введите корректное имя пользователя (Имя пользователя#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Запрос в друзья отправлен';

  @override
  String get addFriendClaimTitle => 'Подтвердите свою учетную запись';

  @override
  String get addFriendClaimDescription =>
      'Подтвердите свою учетную запись, чтобы отправлять запросы в друзья.';

  @override
  String get addFriendVerifyTitle => 'Подтвердите свою почту';

  @override
  String get addFriendVerifyDescription =>
      'Вам необходимо подтвердить адрес электронной почты, прежде чем вы сможете отправлять запросы в друзья.';

  @override
  String get addFriendVerifyEmail => 'Подтвердить почту';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Входящие запросы в друзья ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Исходящие запросы в друзья ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Входящий запрос в друзья';

  @override
  String get addFriendOutgoingStatus => 'Запрос в друзья отправлен';

  @override
  String get addFriendViewProfile => 'Посмотреть профиль';

  @override
  String get addFriendAccept => 'Принять';

  @override
  String get addFriendIgnore => 'Отклонить';

  @override
  String get addFriendAcceptTitle => 'Принять запрос в друзья';

  @override
  String get addFriendIgnoreTitle => 'Игнорировать запрос в друзья';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Принять запрос в друзья от $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Игнорировать запрос в друзья от $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Отменить запрос';

  @override
  String get addFriendCancelRequestFailed =>
      'Не удалось отменить запрос в друзья. Попробуйте снова.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Сейчас они не принимают запросы в друзья.';

  @override
  String get addFriendUnblockFirst =>
      'Сначала разблокируйте пользователя, чтобы отправить запрос в друзья.';

  @override
  String get addFriendCannotSendToSelf =>
      'Вы не можете отправить запрос в друзья самому себе.';

  @override
  String get addFriendAlreadyFriends => 'Вы уже друзья с этим пользователем.';

  @override
  String get addFriendClaimToSend =>
      'Завершите регистрацию, чтобы отправлять запросы в друзья.';

  @override
  String get addFriendVerifyToSend =>
      'Подтвердите адрес электронной почты, прежде чем отправлять запросы на добавление в друзья.';

  @override
  String get addFriendFriendsListFull =>
      'Ваш список друзей полон, или полон список друга. Удалите кого-нибудь и попробуйте снова.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Система';

  @override
  String get emojiSearchPlaceholder => 'Найдите эмодзи своей мечты';

  @override
  String get emojiSearchEmpty => 'Эмодзи не найдены по вашему запросу';

  @override
  String get emojiAutocompleteDefaultLabel => 'Стандартный эмодзи';

  @override
  String emojiInfoDefaultDescription(String productName) {
    return 'Это эмодзи по умолчанию в $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'Этот эмодзи из этого сообщества. Вы можете использовать его везде.';

  @override
  String get emojiInfoCustomUnknownDescription => 'Это эмодзи из сообщества.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'Это эмодзи из сообщества. Попросите автора пригласить вас, чтобы использовать его.';

  @override
  String get emojiInfoFromHeader => 'Этот эмодзи из';

  @override
  String get emojiInfoDiscoverableCommunity => 'Сообщество доступно для поиска';

  @override
  String get emojiInfoPrivateCommunity => 'Закрытое сообщество';

  @override
  String get emojiInfoVerifiedCommunity => 'Подтвержденное сообщество';

  @override
  String get emojiInfoAddToFavorites => 'Добавить в избранное';

  @override
  String get emojiInfoRemoveFromFavorites => 'Удалить из избранного';

  @override
  String get emojiFrequentlyUsed => 'Часто используемые';

  @override
  String get emojiTabGifs => 'GIF';

  @override
  String get emojiTabMedia => 'Медиа';

  @override
  String get emojiTabStickers => 'Стикеры';

  @override
  String get emojiTabEmojis => 'Эмодзи';

  @override
  String get gifPickerSearch => 'Поиск GIF';

  @override
  String get gifPickerSearchKlipy => 'Поиск KLIPY';

  @override
  String get gifPickerSearchTenor => 'Поиск Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Избранное';

  @override
  String get gifPickerFavoritesEmptyTitle => 'Пока нет любимых GIF';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Добавьте GIF в избранное, чтобы увидеть его здесь.';

  @override
  String get gifPickerTrending => 'Популярные GIF';

  @override
  String get gifPickerNoResultsTitle => 'Нет результатов поиска';

  @override
  String get gifPickerNoResultsDescription =>
      'Попробуйте другой поисковый запрос';

  @override
  String get gifPickerLoadFailedTitle => 'Не удалось загрузить GIF-файлы';

  @override
  String get gifPickerLoadFailedBody =>
      'Проверьте подключение и попробуйте снова.';

  @override
  String get emojiCategoryPeople => 'Люди';

  @override
  String get emojiCategoryNature => 'Природа';

  @override
  String get emojiCategoryFood => 'Еда и напитки';

  @override
  String get emojiCategoryActivity => 'Активности';

  @override
  String get emojiCategoryTravel => 'Путешествия и места';

  @override
  String get emojiCategoryObjects => 'Объекты';

  @override
  String get emojiCategorySymbols => 'Символы';

  @override
  String get emojiCategoryFlags => 'Флаги';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Разблокируйте $emojiCount из $communityCount с Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Получить Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Больше не показывать';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count своих эмодзи',
      one: '1 свой эмодзи',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count сообществ',
      one: '1 сообщество',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Внимание: внешний сайт';

  @override
  String externalLinkWarningLeaving(String productName) {
    return 'Вы собираетесь покинуть $productName';
  }

  @override
  String get externalLinkWarningDescription =>
      'Внешние ссылки могут быть опасны. Пожалуйста, будьте осторожны.';

  @override
  String get externalLinkWarningDestinationUrl => 'URL назначения:';

  @override
  String get externalLinksSectionTitle => 'Внешние ссылки';

  @override
  String get externalLinksSectionDescription =>
      'Настройте, как обрабатывать предупреждения о внешних ссылках.';

  @override
  String get externalLinkWarningTrustPrefix => 'Всегда доверять ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — пропустить это предупреждение в следующий раз';

  @override
  String get externalLinkVisitSite => 'Перейти на сайт';

  @override
  String get externalLinkTrustAllLabel => 'Доверять всем внешним ссылкам';

  @override
  String get externalLinkStripTrackingLabel =>
      'Удалять параметры отслеживания из URL';

  @override
  String get externalLinkStripTrackingDescription =>
      'Автоматически удалять параметры отслеживания (например, utm_source, fbclid, gclid) из URL в сообщениях, которые вы отправляете. Очищает ссылку до того, как она достигнет кого-либо.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Доверять всем внешним ссылкам?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Это позволит доверять всем внешним ссылкам и пропускать предупреждения для каждого домена. Ваши существующие доверенные домены будут заменены. Это менее безопасно.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Доверять всем';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Прекратить доверять всем ссылкам?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Предупреждения о внешних ссылках будут снова показаны. Вам нужно будет добавлять доверенные домены по отдельности.';

  @override
  String get externalLinkStopTrustingAllAction => 'Отключить доверие ко всем';

  @override
  String get externalLinkTrustedAllDescription =>
      'Всем внешним ссылкам доверяют. Предупреждения не будут показаны.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'У вас есть $count доверенных домен(ов). Добавляйте больше, отмечая галочкой при посещении внешних ссылок.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'При включении предупреждения о внешних ссылках не будут показаны. Это менее безопасно.';

  @override
  String get imageFileTooLarge =>
      'Файл изображения слишком большой. Пожалуйста, выберите файл размером менее 10 МБ.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Анимированные аватары требуют Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Анимированные баннеры требуют Plutonium';

  @override
  String get animatedAvifNotSupported => 'Анимированные AVIF не поддерживаются';

  @override
  String get animatedAvifNotSupportedBody =>
      'Обрезка и вращение анимированных файлов AVIF пока не поддерживаются. Если вы продолжите, файл будет загружен в исходном виде.';

  @override
  String get uploadAsIs => 'Загрузить как есть';

  @override
  String get croppingAnimatedNotSupported =>
      'Обрезка анимированных изображений пока не поддерживается. Будет использован исходный файл.';

  @override
  String get cropAvatar => 'Обрезать аватар';

  @override
  String get cropBanner => 'Обрезать баннер';

  @override
  String get skip => 'Пропустить';

  @override
  String get crop => 'Обрезать';

  @override
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => 'Изменить ваш Имя пользователя';

  @override
  String get fluxerTagInputLabel => 'Имя пользователя';

  @override
  String get fluxerTagDescriptionBase =>
      'Имена пользователей могут содержать только буквы (a-z, A-Z), цифры (0-9) и подчеркивания. Имена пользователей не чувствительны к регистру.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Имена пользователей могут содержать только буквы (a-z, A-Z), цифры (0-9) и подчеркивания. Имена пользователей не чувствительны к регистру. Вы можете выбрать любой доступный 4-значный тег от #0000 до #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Имена пользователей могут содержать только буквы (a-z, A-Z), цифры (0-9) и подчеркивания. Имена пользователей не чувствительны к регистру. Вы можете выбрать любой доступный 4-значный тег от #0001 до #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'От $min до $max символов';
  }

  @override
  String get validationAllowedChars =>
      'Только буквы (a-z, A-Z), цифры (0-9) и подчеркивания (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Получите Plutonium, чтобы настроить свой тег или сохранить его при изменении имени пользователя';

  @override
  String get fluxerTagAlreadyTaken => 'Имя пользователя уже занят';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Имя пользователя $username#$discriminator уже занят. Продолжение автоматически перевыберет ваш дискриминатор.';
  }

  @override
  String get customTagIsTemporary => 'Пользовательский тег временный';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Ваш пользовательский 4-значный тег будет доступен только во время действия вашей подписки Plutonium. Когда ваша подписка истечет $date, ваш тег будет заменен на случайно назначенный номер после 3-дневного льготного периода.';
  }

  @override
  String get customTagTemporaryBody =>
      'Ваш пользовательский 4-значный тег будет доступен только во время действия вашей подписки Plutonium. Когда ваша подписка истечет, ваш тег будет заменен на случайно назначенный номер после 3-дневного льготного периода.';

  @override
  String get iUnderstandContinue => 'Я понимаю, продолжить';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Если вы сохраните этот Имя пользователя, ваш пользовательский 4-значный тег будет заменен на случайный номер по окончании вашей подписки Plutonium. Если ваша подписка не будет продлена, у вас будет 3-дневный льготный период до изменения тега.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Ваш пользовательский 4-значный тег (#$discriminator) активен во время действия вашей подписки Plutonium. Если ваша подписка закончится или не будет продлена после 3-дневного льготного периода, ваш тег будет заменен на случайный номер.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Настройте свой 4-значный тег или сохраните его при изменении имени пользователя';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Ваша пробная версия Plutonium истекает $date. Обновитесь, чтобы сохранить свой пользовательский тег и получить значок в профиле.';
  }

  @override
  String get premiumTrialActive =>
      'Вы используете пробную версию Plutonium. Обновитесь, чтобы сохранить свой пользовательский тег и получить значок в профиле.';

  @override
  String get fluxerTagUpdated => 'Имя пользователя обновлен';

  @override
  String get fluxerTagUpdateFailed =>
      'Не удалось обновить Имя пользователя. Пожалуйста, попробуйте еще раз.';

  @override
  String get continueAction => 'Продолжить';

  @override
  String get profileCustomizationTitle => 'Настройка профиля';

  @override
  String get profileCustomizationDescription =>
      'Измените внешний вид вашего профиля и увидите предварительный просмотр в реальном времени';

  @override
  String get usernameLabel => 'Имя пользователя';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Подтвердите свою учетную запись, чтобы изменить Имя пользователя';

  @override
  String get changeFluxerTag => 'Изменить Имя пользователя';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Настройте свой 4-значный тег (#$discriminator) по своему вкусу с помощью Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Изменить имя пользователя и 4-значный тег';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Ваш пользовательский тег (#$discriminator) привязан к вашей подписке Plutonium и будет заменен случайным тегом, если она истечет.';
  }

  @override
  String get displayNameLabel => 'Отображаемое имя';

  @override
  String get pronounsLabel => 'Местоимения';

  @override
  String get avatarLabel => 'Аватар';

  @override
  String get changeAvatar => 'Изменить аватар';

  @override
  String get removeAvatar => 'Удалить аватар';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Макс. 10 МБ. Рекомендуется: 512×512px';

  @override
  String get bannerLabel => 'Баннер';

  @override
  String get changeBanner => 'Изменить баннер';

  @override
  String get removeBanner => 'Удалить баннер';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Макс. 10 МБ. Минимум: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Акцентный цвет';

  @override
  String get accentColorDescription =>
      'Настраивает цвет рамки и баннера в вашем профиле';

  @override
  String get aboutMeLabel => 'О себе';

  @override
  String get aboutMeHelperText =>
      'Вы можете использовать ссылки, эмодзи и Markdown.';

  @override
  String get emojiPickerTitle => 'Эмодзи';

  @override
  String get plutoniumBadgePrivacyTitle =>
      'Конфиденциальность значка Plutonium';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Управляйте отображением вашего значка Plutonium для других';

  @override
  String get hidePlutoniumBadgeLabel => 'Полностью скрыть значок Plutonium';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Полностью скройте ваш значок Plutonium от других пользователей';

  @override
  String get hidePlutoniumPurchaseDate => 'Скрыть дату покупки Plutonium';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Скрыть дату покупки Plutonium ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Удалить дату первой покупки Plutonium из вашего значка';

  @override
  String get maskVisionaryAsSubscription =>
      'Маскировать Visionary как подписку';

  @override
  String get maskVisionaryDescription =>
      'Показывать ваш Visionary как обычную подписку';

  @override
  String get hideVisionaryIdBadge => 'Скрыть значок ID Visionary';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Скрыть значок ID Visionary (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Удалить ваш значок ID Visionary';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'У вас пробная версия Plutonium — ваша подписка начнется $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Ваша подписка начнется автоматически по окончании пробного периода. Никаких действий не требуется.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'У вас пробная версия Plutonium, которая истекает $date';
  }

  @override
  String get premiumTrialActiveProfile => 'У вас пробная версия Plutonium';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Макс. 10 МБ. Рекомендуется: 512×512px. Анимированные аватары (GIF) требуют Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Настройте свой профиль с помощью статического или анимированного баннера, чтобы он выделялся.';

  @override
  String get getPlutonium => 'Получить Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Покупки в приложении пока недоступны на этой платформе. Оставайтесь на связи — скоро появится!';

  @override
  String get profilePreviewLabel => 'Предпросмотр';

  @override
  String get profilePreviewMessage => 'Сообщение';

  @override
  String profilePreviewMemberSince(String productName) {
    return 'Участник $productName с';
  }

  @override
  String get unclaimedAccountTitle => 'Невостребованный аккаунт';

  @override
  String get unclaimedAccountDescription =>
      'Ваш аккаунт еще не востребован. Без электронной почты и пароля вы можете потерять доступ. Востребуйте свой аккаунт сейчас, чтобы обезопасить его.';

  @override
  String get claimAccount => 'Востребовать аккаунт';

  @override
  String get profileTypeLabel => 'Тип профиля';

  @override
  String get profileTypeGlobal => 'Глобальный профиль';

  @override
  String get profileTypeGuildDescription =>
      'Вы редактируете свой профиль для каждого сообщества. Этот профиль будет виден только в этом сообществе и заменит ваш глобальный профиль.';

  @override
  String get communityNicknameLabel => 'Никнейм сообщества';

  @override
  String get perGuildPremiumUpsellText =>
      'Настройка вашего аватара, баннера, основного цвета и биографии для отдельных сообществ требует Plutonium. Никнейм и местоимения в сообществе бесплатны для всех.';

  @override
  String get avatarModeInherit => 'Использовать глобальный профиль';

  @override
  String get avatarModeCustom => 'Использовать собственное изображение';

  @override
  String get avatarModeUnset => 'Не показывать';

  @override
  String get profileSavedToast => 'Профиль обновлен';

  @override
  String get profileEditButton => 'Изменить профиль';

  @override
  String get profileNoteLabel => 'Заметка';

  @override
  String get profileNoteVisibility => '(видно только вам)';

  @override
  String get profileNoteEmpty => 'Заметки пока нет.';

  @override
  String get sudoTitle => 'Подтвердите свою личность';

  @override
  String get sudoDescription =>
      'Для продолжения этого действия требуется подтверждение.';

  @override
  String get sudoAuthenticatorCode => 'Код аутентификатора';

  @override
  String get sudoMethodPassword => 'Пароль';

  @override
  String get sudoMethodTotp => 'Аутентификатор';

  @override
  String get sudoVerificationFailed =>
      'Не удалось подтвердить. Пожалуйста, попробуйте еще раз.';

  @override
  String get securityAccountTitle => 'Аккаунт';

  @override
  String get securityAccountDescription =>
      'Управляйте своей электронной почтой, паролем и настройками аккаунта';

  @override
  String get securitySectionTitle => 'Безопасность';

  @override
  String get securitySectionDescription =>
      'Защитите свой аккаунт с помощью двухфакторной аутентификации и парольных ключей';

  @override
  String get securityLoginEmailSectionTitle => 'Настройки электронной почты';

  @override
  String securityLoginEmailSectionDescription(String productName) {
    return 'Управляйте адресом электронной почты, который вы используете для входа в $productName';
  }

  @override
  String get securityLoginEmailAddressLabel => 'Адрес электронной почты';

  @override
  String get securityLoginNoEmailSet => 'Адрес электронной почты не установлен';

  @override
  String get securityLoginChangeEmail => 'Изменить электронную почту';

  @override
  String get securityLoginAddEmail => 'Добавить электронную почту';

  @override
  String get securityLoginReveal => 'Показать';

  @override
  String get securityLoginHide => 'Скрыть';

  @override
  String get securityLoginPasswordSectionTitle => 'Пароль';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Измените свой пароль, чтобы обеспечить безопасность аккаунта';

  @override
  String get securityLoginCurrentPasswordLabel => 'Текущий пароль';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Последнее изменение: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged =>
      'Последнее изменение: Никогда';

  @override
  String get securityLoginNoPasswordSet => 'Пароль не установлен';

  @override
  String get securityLoginChangePassword => 'Изменить пароль';

  @override
  String get securityLoginSetPassword => 'Установить пароль';

  @override
  String get passwordChangeTitle => 'Изменить пароль';

  @override
  String get passwordChangeIntroDescription =>
      'Мы отправим проверочный код на ваш адрес электронной почты, чтобы подтвердить вашу личность перед изменением пароля.';

  @override
  String get passwordChangeStart => 'Начать';

  @override
  String get passwordChangeVerifyTitle => 'Подтвердите свою электронную почту';

  @override
  String get passwordChangeVerifyDescription =>
      'Введите проверочный код, отправленный на ваш адрес электронной почты.';

  @override
  String get passwordChangeVerificationCode => 'Проверочный код';

  @override
  String get passwordChangeVerify => 'Подтвердить';

  @override
  String get passwordChangeNewPasswordTitle => 'Установите новый пароль';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Введите ваш новый пароль ниже.';

  @override
  String get passwordChangeNewPassword => 'Новый пароль';

  @override
  String get passwordChangeConfirmPassword => 'Подтвердите новый пароль';

  @override
  String get passwordChangeSubmit => 'Изменить пароль';

  @override
  String get passwordChangeSuccess => 'Пароль изменен';

  @override
  String get passwordChangePasswordsDoNotMatch => 'Пароли не совпадают';

  @override
  String get passwordChangeInvalidCode => 'Недействительный или истекший код';

  @override
  String get emailChangeTitle => 'Сменить адрес электронной почты';

  @override
  String get emailChangeIntroDescription =>
      'Мы отправим коды подтверждения для проверки вашей личности перед сменой адреса электронной почты.';

  @override
  String get emailChangeStart => 'Начать';

  @override
  String get emailChangeVerifyOriginalTitle =>
      'Подтвердите текущий адрес электронной почты';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Введите код подтверждения, отправленный на ваш текущий адрес электронной почты.';

  @override
  String get emailChangeNewEmailTitle =>
      'Введите новый адрес электронной почты';

  @override
  String get emailChangeNewEmailDescription =>
      'Введите новый адрес электронной почты, который вы хотите использовать.';

  @override
  String get emailChangeNewEmailLabel => 'Новый адрес электронной почты';

  @override
  String get emailChangeNewEmailSubmit => 'Отправить код подтверждения';

  @override
  String get emailChangeVerifyNewTitle =>
      'Подтвердите новый адрес электронной почты';

  @override
  String get emailChangeVerifyNewDescription =>
      'Введите код подтверждения, отправленный на ваш новый адрес электронной почты.';

  @override
  String get emailChangeSuccess => 'Адрес электронной почты изменен';

  @override
  String get emailChangeInvalidCode => 'Неверный или истекший код';

  @override
  String get resend => 'Отправить повторно';

  @override
  String resendCountdown(int seconds) {
    return 'Отправить повторно ($secondsс)';
  }

  @override
  String get verificationCode => 'Код подтверждения';

  @override
  String get verify => 'Подтвердить';

  @override
  String get enable => 'Включить';

  @override
  String get disable => 'Отключить';

  @override
  String get delete => 'Удалить';

  @override
  String get save => 'Сохранить';

  @override
  String get securityTfaSectionTitle => 'Двухфакторная аутентификация';

  @override
  String get securityTfaSectionDescription =>
      'Добавьте дополнительный уровень безопасности вашей учетной записи';

  @override
  String get securityTfaAuthenticatorApp => 'Приложение для аутентификации';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Двухфакторная аутентификация включена';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Используйте приложение для аутентификации для генерации кодов для двухфакторной аутентификации';

  @override
  String get securityTfaBackupCodes => 'Резервные коды';

  @override
  String get securityTfaBackupCodesDescription =>
      'Просмотр и управление вашими резервными кодами для восстановления учетной записи';

  @override
  String get securityTfaViewCodes => 'Показать коды';

  @override
  String get securityPasskeysSectionTitle => 'Ключи доступа';

  @override
  String get securityPasskeysSectionDescription =>
      'Используйте ключи доступа для входа без пароля и двухфакторной аутентификации';

  @override
  String get securityPasskeysRegistered => 'Зарегистрированные ключи доступа';

  @override
  String get securityPasskeysNone => 'Ключи доступа не зарегистрированы';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ключа доступа',
      one: 'ключ доступа',
    );
    return '$_temp0 зарегистрировано (макс. 10)';
  }

  @override
  String get securityPasskeysAdd => 'Добавить ключ доступа';

  @override
  String securityPasskeysAdded(String date) {
    return 'Добавлено: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Последнее использование: $date';
  }

  @override
  String get securityPasskeysRename => 'Переименовать';

  @override
  String get securityPasskeysDeleteTitle => 'Удалить ключ доступа';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Вы уверены, что хотите удалить ключ доступа «$name»?';
  }

  @override
  String get securityPasskeyNameTitle => 'Название ключа доступа';

  @override
  String get securityPasskeyNameLabel => 'Название ключа доступа';

  @override
  String get securityPasskeyNameHint =>
      'например, YubiKey, iPhone, Рабочий компьютер';

  @override
  String get securityPhoneSectionTitle => 'Номер телефона';

  @override
  String get securityPhoneSectionDescription =>
      'Управление вашим номером телефона.';

  @override
  String get securityPhoneLabel => 'Номер телефона';

  @override
  String get securityPhoneNone => 'Номер телефона не добавлен.';

  @override
  String get securityPhoneAdd => 'Добавить телефон';

  @override
  String get securityPhoneRemove => 'Удалить';

  @override
  String get securityPhoneRemoveTitle => 'Удалить номер телефона';

  @override
  String get securityPhoneRemoveDescription =>
      'Вы уверены, что хотите удалить номер телефона?';

  @override
  String get securityPhoneRemoved => 'Номер телефона удален';

  @override
  String get securityClaimTitle => 'Функции безопасности';

  @override
  String get securityClaimDescription =>
      'Подтвердите свою учетную запись, чтобы получить доступ к функциям безопасности, таким как двухфакторная аутентификация и ключи доступа.';

  @override
  String get securityVerifyEmailRequired =>
      'Вы должны подтвердить свой адрес электронной почты, прежде чем сможете настроить двухфакторную аутентификацию, ключи доступа или SMS-подтверждение.';

  @override
  String get totpEnableTitle => 'Настройка приложения Authenticator';

  @override
  String get totpEnableDescription =>
      'Отсканируйте QR-код с помощью приложения Authenticator, чтобы сгенерировать коды для двухфакторной аутентификации.';

  @override
  String get totpEnableCodeLabel => 'Код';

  @override
  String get totpEnableCodeHint =>
      'Введите 6-значный код из вашего приложения Authenticator';

  @override
  String get totpEnableSuccess => 'Двухфакторная аутентификация включена';

  @override
  String get totpDisableTitle => 'Удаление приложения Authenticator';

  @override
  String get totpDisableDescription =>
      'Введите 6-значный код из вашего приложения Authenticator, чтобы отключить двухфакторную аутентификацию.';

  @override
  String get totpDisableSuccess => 'Двухфакторная аутентификация отключена';

  @override
  String get backupCodesTitle => 'Резервные коды';

  @override
  String get backupCodesWarning =>
      'Если вы потеряете доступ к своему приложению Authenticator и у вас не будет этих кодов, вы навсегда потеряете доступ к своей учетной записи. Загрузите или скопируйте их сейчас и сохраните в надежном месте.';

  @override
  String get backupCodesDownload => 'Скачать';

  @override
  String get backupCodesCopy => 'Копировать';

  @override
  String get backupCodesCopied => 'Резервные коды скопированы в буфер обмена';

  @override
  String get backupCodesAcknowledge =>
      'Я скачал или скопировал свои резервные коды и сохранил их в надежном месте.';

  @override
  String get backupCodesDone => 'Готово';

  @override
  String get backupCodesViewTitle => 'Просмотр резервных кодов';

  @override
  String get backupCodesViewDescription =>
      'Для просмотра резервных кодов может потребоваться подтверждение.';

  @override
  String get phoneAddTitle => 'Добавить номер телефона';

  @override
  String get phoneAddLabel => 'Номер телефона';

  @override
  String get phoneAddHint => 'Введите ваш номер телефона';

  @override
  String get phoneAddFooter =>
      'Мы отправим код по SMS, когда он будет доступен. Ваш номер не будет привязан к вашей учетной записи. Мы сохраним только зашифрованный маркер без идентификатора пользователя, чтобы разрешить не более 2 проверок в течение примерно 30 дней.';

  @override
  String get phoneAddSendCode => 'Отправить код';

  @override
  String get phoneVerifyTitle => 'Подтверждение номера телефона';

  @override
  String get phoneVerifyDescription =>
      'Введите код подтверждения, отправленный на ваш номер телефона.';

  @override
  String get phoneAddSuccess => 'Номер телефона подтвержден';

  @override
  String get phoneCountryLabel => 'Страна';

  @override
  String get phoneSearchCountries => 'Поиск стран...';

  @override
  String get phoneNumberRequired => 'Требуется номер телефона';

  @override
  String get phoneEnterValidNumber =>
      'Введите действительный номер мобильного телефона.';

  @override
  String get phoneCannotBeUsed =>
      'Этот номер телефона нельзя использовать. Попробуйте другой номер или обратитесь в службу поддержки.';

  @override
  String get phoneAlreadyUsed =>
      'Этот номер телефона уже используется. Попробуйте другой номер или обратитесь в службу поддержки.';

  @override
  String get phoneCodeDidNotWork =>
      'Этот код не подошёл. Проверьте его и попробуйте ещё раз.';

  @override
  String get phoneTooManyAttempts =>
      'Слишком много попыток. Подождите немного и повторите попытку.';

  @override
  String get phoneSmsUnavailable =>
      'Проверка по СМС сейчас недоступна. Повторите попытку позже или обратитесь в службу поддержки.';

  @override
  String get phoneNotEligible =>
      'Подтверждение по телефону недоступно для этого аккаунта. Используйте другой способ или обратитесь в поддержку.';

  @override
  String get phoneCaptchaRequired =>
      'Перед подтверждением номера телефона требуется проверка в браузере. Повторите попытку со страницы входа или обратитесь в службу поддержки.';

  @override
  String get phoneSomethingWentWrong =>
      'Что-то пошло не так. Повторите попытку.';

  @override
  String get phoneInboundExpensiveDescription =>
      'Отправка СМС на этот номер слишком дорога, поэтому нам нужно, чтобы вы отправили СМС нам. Вы также можете связаться с поддержкой, чтобы мы сняли это требование с вашей учетной записи.';

  @override
  String get phoneInboundDefaultDescription =>
      'Нам нужно, чтобы вы отправили SMS для подтверждения вашего номера телефона.';

  @override
  String get phoneInboundStepOpenMessaging =>
      'Откройте приложение для сообщений на телефоне и создайте новое сообщение.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'Отправьте код $code на номер $number.';
  }

  @override
  String get phoneInboundStepWait =>
      'Подождите, пока мы получим ваше сообщение. Это может занять минуту.';

  @override
  String get phoneInboundGetNewCode => 'Получить новый код';

  @override
  String get phoneInboundChallengeCodeLabel => 'Код для отправки';

  @override
  String get phoneInboundOurNumberLabel => 'Отправить на';

  @override
  String get requiredActionTitle => 'Требуется подтверждение аккаунта';

  @override
  String requiredActionIntroGeneric(String productName) {
    return 'Пройдите необходимую проверку, чтобы продолжить пользоваться $productName.';
  }

  @override
  String get requiredActionIntroPhone =>
      'Чтобы продолжить, нужно пройти дополнительную антиспам-проверку.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return 'Подтвердите свою почту или телефон, чтобы продолжить пользоваться $productName.';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return 'Чтобы продолжить пользоваться $productName, выполните необходимые действия по подтверждению электронной почты и номера телефона ниже.';
  }

  @override
  String get requiredActionChooseMethodTitle => 'Выберите способ подтверждения';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return 'Чтобы продолжить пользоваться $productName, пройдите один из предложенных ниже способов верификации.';
  }

  @override
  String get requiredActionUseEmail => 'Использовать эл. почту';

  @override
  String get requiredActionUsePhone => 'Использовать телефон';

  @override
  String get requiredActionCheckEmailTitle => 'Проверьте почту';

  @override
  String get requiredActionCheckEmailDescription =>
      'Мы отправили ссылку для подтверждения на вашу электронную почту. Откройте её, чтобы продолжить.';

  @override
  String get requiredActionResendVerificationEmail =>
      'Повторно отправить письмо для подтверждения';

  @override
  String get requiredActionVerificationEmailSent =>
      'Письмо для подтверждения отправлено. Проверьте входящие.';

  @override
  String get requiredActionSignOut => 'Выйти';

  @override
  String get dangerZoneSectionTitle => 'Опасная зона';

  @override
  String get dangerZoneSectionDescription =>
      'Необратимые и деструктивные действия';

  @override
  String get dangerZoneDisableTitle => 'Отключить учетную запись';

  @override
  String get dangerZoneDisableDescription =>
      'Временно отключите свою учетную запись. Вы сможете повторно активировать ее позже, войдя в систему снова.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Отключение вашей учетной записи приведет к выходу из всех сеансов. Вы можете повторно активировать свою учетную запись в любое время, войдя снова.';

  @override
  String get dangerZoneDeleteTitle => 'Удалить учетную запись';

  @override
  String get dangerZoneDeleteDescription =>
      'Полностью удалите свою учетную запись и все связанные с ней данные. Это действие необратимо.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Отмените вашу активную подписку Plutonium в настройках Plutonium перед удалением учетной записи.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount =>
      'Невозможно удалить учетную запись';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Вы не можете удалить свою учетную запись, пока владеете сообществами. Сначала передайте право собственности на следующие сообщества:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'и еще $count';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Чтобы передать право собственности, перейдите в $settingsPath и воспользуйтесь опцией передачи права собственности.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Вы уверены, что хотите удалить свою учетную запись? Это действие запланирует вашу учетную запись на окончательное удаление.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Вы можете отменить процесс удаления в течение 14 дней';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Через 14 дней ваша учетная запись будет окончательно удалена';

  @override
  String get dangerZoneDeleteBullet3 =>
      'После обработки удаления вы не сможете восстановить доступ к своей учетной записи';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Вы не сможете удалить отправленные вами сообщения после удаления учетной записи';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Если вы хотите экспортировать свои данные или сначала удалить свои сообщения, пожалуйста, посетите раздел «Панель управления конфиденциальностью» в настройках пользователя, прежде чем продолжить.';

  @override
  String get claimAccountTitle => 'Подтвердите свою учетную запись';

  @override
  String get claimAccountDescription =>
      'Подтвердите свою учетную запись, добавив адрес электронной почты и пароль. Мы отправим код подтверждения для проверки вашей электронной почты перед завершением.';

  @override
  String get claimAccountEmailLabel => 'Электронная почта';

  @override
  String get claimAccountPasswordLabel => 'Пароль';

  @override
  String get claimAccountSendCode => 'Отправить код';

  @override
  String get claimAccountVerifyDescription =>
      'Введите код, который мы отправили на вашу электронную почту, чтобы подтвердить ее. Ваш пароль будет установлен после подтверждения кода.';

  @override
  String get claimAccountSuccess => 'Аккаунт успешно получен';

  @override
  String get importantInformation => 'Важная информация:';

  @override
  String get genericError => 'Произошла ошибка';

  @override
  String get networkErrorMessage => 'Что-то пошло не так. Попробуйте ещё раз.';

  @override
  String get invalidCode => 'Неверный код';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count лет назад',
      one: '1 год назад',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count месяцев назад',
      one: '1 месяц назад',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дней назад',
      one: '1 день назад',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count часов назад',
      one: '1 час назад',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count минут назад',
      one: '1 минуту назад',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count недель назад',
      one: '1 неделю назад',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'через $count минуты',
      one: 'через 1 минуту',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'через $count часа',
      one: 'через час',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'через $count дней',
      one: 'через 1 день',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'через $count недели',
      one: 'через 1 неделю',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'через $count месяца',
      one: 'через 1 месяц',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'через $count лет',
      one: 'через 1 год',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'только что';

  @override
  String get authorizedAppsTitle => 'Авторизованные приложения';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Эти приложения получили доступ к вашей учетной записи $productName.';
  }

  @override
  String get authorizedAppsEmptyTitle => 'Нет авторизованных приложений';

  @override
  String get authorizedAppsEmptyDescription =>
      'Вы еще не авторизовали ни одно приложение для доступа к своей учетной записи.';

  @override
  String get authorizedAppsLoadError =>
      'Не удалось загрузить авторизованные приложения';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Авторизовано $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Предоставленные разрешения';

  @override
  String get authorizedAppsRevoke => 'Отозвать';

  @override
  String get authorizedAppsRevokeTitle => 'Отозвать доступ приложения';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Вы уверены, что хотите отозвать доступ для $appName? Это приложение больше не будет иметь доступа к вашей учетной записи.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Доступ к основной информации вашего профиля (имя пользователя, аватар и т. д.)';

  @override
  String get authorizedAppsScopeEmail =>
      'Просмотр вашего адреса электронной почты';

  @override
  String get authorizedAppsScopeGuilds =>
      'Просмотр сообществ, в которых вы состоите';

  @override
  String get authorizedAppsScopeConnections =>
      'Просмотр ваших подключенных аккаунтов';

  @override
  String get authorizedAppsScopeBot =>
      'Добавление бота в сообщество с запрошенными разрешениями';

  @override
  String get authorizedAppsScopeAdmin =>
      'Доступ к административным конечным точкам';

  @override
  String get privacyPendingDeletionTitle => 'Ожидает удаления';

  @override
  String get blockedUsersTitle => 'Заблокированные пользователи';

  @override
  String get blockedUsersDescription =>
      'Заблокированные пользователи не могут отправлять вам запросы в друзья или писать вам напрямую.';

  @override
  String get blockedUsersEmptyTitle => 'Нет заблокированных пользователей';

  @override
  String get blockedUsersEmptyDescription => 'Вы еще никого не заблокировали.';

  @override
  String get blockedUsersLoadError =>
      'Не удалось загрузить заблокированных пользователей';

  @override
  String get blockedUsersUnblock => 'Разблокировать';

  @override
  String get blockedUsersUnblockTitle => 'Разблокировать пользователя';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Вы уверены, что хотите разблокировать $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Копировать Имя пользователя';

  @override
  String get blockedUsersCopyId => 'Копировать ID пользователя';

  @override
  String get userProfileLoadError => 'Не удалось загрузить профиль';

  @override
  String get userProfileLoading => 'Загрузка профиля';

  @override
  String get userProfileRetry => 'Повторить';

  @override
  String get userProfileMessage => 'Сообщение';

  @override
  String get userProfileVoiceCall => 'Голосовой вызов';

  @override
  String get userProfileVideoCall => 'Видеовызов';

  @override
  String get userProfileEditProfile => 'Редактировать профиль';

  @override
  String userProfileStaffBadgeTooltip(String productName) {
    return 'Сотрудник $productName';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return 'Команда сообщества $productName';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return 'Партнер $productName';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return 'Охотник за ошибками $productName';
  }

  @override
  String userProfilePlutoniumBadgeTooltip(String productName) {
    return 'Plutonium $productName';
  }

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(
    String productName,
    String date,
  ) {
    return 'Подписчик Plutonium $productName с $date';
  }

  @override
  String userProfileVisionaryBadgeTooltip(String productName) {
    return 'Визионер $productName';
  }

  @override
  String userProfileVisionaryBadgeSinceTooltip(
    String productName,
    String date,
  ) {
    return 'Визионер $productName с $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'ID визионера #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Общие друзья ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Общие сообщества ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Общие друзья';

  @override
  String get userProfileMutualCommunitiesTitle => 'Общие сообщества';

  @override
  String get userProfileNoMutualFriends => 'Общих друзей не найдено.';

  @override
  String get userProfileNoMutualCommunities => 'Общих сообществ не найдено.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Никнейм: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Открыть ЛС';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Вы заблокировали $username. Вы не сможете отправлять сообщения, пока не разблокируете его.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Разблокировать';

  @override
  String get userProfileOpenDm => 'Открыть ЛС';

  @override
  String get userProfileNoteTitle => 'Заметка';

  @override
  String get userProfileNoteVisibility => '(видно только вам)';

  @override
  String get userProfileNoteSave => 'Сохранить';

  @override
  String get userProfileNoteDelete => 'Удалить';

  @override
  String get userProfileNoteEmpty => 'Нажмите, чтобы добавить заметку';

  @override
  String get userProfileMemberSince => 'Участник с';

  @override
  String get userProfileAboutMe => 'О себе';

  @override
  String get userProfileRoles => 'Роли';

  @override
  String get memberRoleAdd => 'Добавить роль';

  @override
  String memberRoleRemove(String roleName) {
    return 'Удалить роль \"$roleName\"';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'У этого пользователя нет ролей в этом сообществе.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'Ролей пока нет. Добавьте роли в $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'Нет доступных ролей';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'В этом сообществе пока нет ролей для назначения, но вы можете создать новую роль в $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Настройки сообщества';

  @override
  String get guildSettingsRolesTab => 'Роли';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Местное время';

  @override
  String get userProfileSameTimeAsYou => 'Время совпадает с вашим';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return 'на $duration раньше, чем у вас';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return 'на $duration позже, чем у вас';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours часа',
      one: '1 час',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes минуты',
      one: '1 минута',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours часа',
      one: '1 час',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes минут',
      one: '1 минута',
    );
    return '$_temp0';
  }

  @override
  String get userProfileCopyUsername => 'Копировать имя пользователя';

  @override
  String get userProfileCopyUserId => 'Копировать ID пользователя';

  @override
  String get userProfileViewMainProfile => 'Посмотреть основной профиль';

  @override
  String get userProfileViewCommunityProfile => 'Посмотреть профиль сообщества';

  @override
  String get userProfileBlockUser => 'Заблокировать пользователя';

  @override
  String get userProfileUnblockUser => 'Разблокировать пользователя';

  @override
  String get userProfileRemoveFriend => 'Удалить из друзей';

  @override
  String get userProfileBlockConfirmTitle => 'Заблокировать пользователя';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Вы уверены, что хотите заблокировать $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Разблокировать пользователя';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Вы уверены, что хотите разблокировать $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Удалить из друзей';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Вы уверены, что хотите удалить $username из друзей?';
  }

  @override
  String get userProfileFailedOpenDm => 'Не удалось открыть ЛС';

  @override
  String get userProfileFailedSaveNote => 'Не удалось сохранить заметку';

  @override
  String get userProfileActionFailed =>
      'Действие не выполнено, попробуйте снова';

  @override
  String get userProfileChangeNickname => 'Изменить никнейм';

  @override
  String get userProfileKick => 'Исключить';

  @override
  String get userProfileBan => 'Забанить';

  @override
  String get userProfileTimeout => 'Отключить';

  @override
  String get userProfileRemoveTimeout => 'Снять отключение';

  @override
  String get userProfileTransferOwnership => 'Передать владение';

  @override
  String get userProfileReportUser => 'Пожаловаться на пользователя';

  @override
  String get userProfileReportMessage => 'Пожаловаться на сообщение';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Исключить $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Вы уверены, что хотите исключить $username? Он сможет вернуться по новому приглашению.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Снять ограничение?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Снятие ограничения позволит $username снова отправлять сообщения, ставить реакции и присоединяться к голосовым каналам.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Передать владение?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Передать владение этим сообществом пользователю $username? Это действие необратимо, и вы потеряете все права владельца.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Заблокировать $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Срок блокировки';

  @override
  String get userProfileBanCustomSecondsLabel => 'Свой срок (секунды)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Любое значение от $min до $max секунд';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Удалить историю сообщений';

  @override
  String get userProfileBanDeleteNone => 'Не удалять';

  @override
  String get userProfileBanDelete24h => 'За последние 24 часа';

  @override
  String get userProfileBanDelete7d => 'За последние 7 дней';

  @override
  String get userProfileBanReasonLabel => 'Причина (необязательно)';

  @override
  String get userProfileBanReasonHint => 'Введите причину блокировки';

  @override
  String get userProfileBanSubmit => 'Заблокировать участника';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Ограничить $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Срок ограничения';

  @override
  String get userProfileTimeoutSubmit => 'Ограничить участника';

  @override
  String get userProfileNicknameLabel => 'Никнейм';

  @override
  String get userProfileNicknameHint => 'Введите никнейм';

  @override
  String get userProfileNicknameSave => 'Сохранить';

  @override
  String userProfileKickSuccess(String username) {
    return '$username исключен';
  }

  @override
  String userProfileBanSuccess(String username) {
    return '$username заблокирован';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Для $username установлено ограничение';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Ограничение для $username снято';
  }

  @override
  String get userProfileNicknameSuccess => 'Никнейм обновлен';

  @override
  String get userProfileTransferSuccess => 'Владение передано';

  @override
  String get durationPermanent => 'Навсегда';

  @override
  String get duration60Seconds => '60 секунд';

  @override
  String get duration5Minutes => '5 минут';

  @override
  String get duration10Minutes => '10 минут';

  @override
  String get duration1Hour => '1 час';

  @override
  String get duration12Hours => '12 часов';

  @override
  String get duration1Day => '1 день';

  @override
  String get duration3Days => '3 дня';

  @override
  String get duration5Days => '5 дней';

  @override
  String get duration1Week => '1 неделя';

  @override
  String get duration2Weeks => '2 недели';

  @override
  String get duration1Month => '1 месяц';

  @override
  String get durationCustom => 'Свой срок…';

  @override
  String get iarReportUserTitle => 'Пожаловаться на пользователя';

  @override
  String get iarReportGuildTitle => 'Пожаловаться на сообщество';

  @override
  String get iarReportGuildPreconfirmBody =>
      'Если жалоба касается конкретного сообщения в этом сообществе, пожалуйтесь на это сообщение. Жалобы на сообщения дают нашей команде безопасности наиболее полную информацию, а добавление деталей в комментариях поможет нам рассмотреть ее быстрее. Продолжайте жаловаться на сообщество в целом только в том случае, если жалоба на сообщение не отражает более широкую проблему.';

  @override
  String get iarContinueToReportCommunity =>
      'Продолжить жаловаться на сообщество';

  @override
  String get iarPreviewCommunitySubtitle => 'Сообщество';

  @override
  String get iarReasonHarassmentGuildLabel =>
      'Домогательства или целенаправленные оскорбления';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'Сообщество способствует травле или целенаправленным оскорблениям.';

  @override
  String get iarReasonHateGuildDescription =>
      'Разжигает ненависть к уязвимым группам.';

  @override
  String get iarReasonTerrorismLabel =>
      'Терроризм или насильственный экстремизм';

  @override
  String get iarReasonTerrorismDescription =>
      'Пропаганда, вербовка или координация насильственной экстремистской деятельности.';

  @override
  String get iarReasonMatureContentGuildLabel =>
      'Контент для взрослых или небезопасный контент';

  @override
  String get iarReasonMatureContentGuildDescription =>
      'Контент для взрослых без соответствующего возрастного ограничения.';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      'Угрожает несовершеннолетним или содержит материалы с эксплуатацией детей.';

  @override
  String get iarReasonRaidLabel => 'Координация рейдов';

  @override
  String get iarReasonRaidDescription =>
      'Координирует рейды, травлю или преследование людей или сообществ.';

  @override
  String get iarReasonSpamGuildDescription =>
      'Сообщество существует для рассылки спама, мошенничества или злоупотребления платформой.';

  @override
  String get iarReasonMalwareGuildLabel => 'Распространение вредоносного ПО';

  @override
  String get iarReasonMalwareGuildDescription =>
      'Распространяет вредоносное ПО, крадет учетные данные или вредоносные файлы.';

  @override
  String get iarReasonPrivacyGuildLabel =>
      'Нарушение конфиденциальности или доксинг';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'Делится личной информацией, преследует пользователей или координирует нарушения конфиденциальности.';

  @override
  String get iarReasonSelfHarmGuildLabel => 'Призывы к селфхарму';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'Пропаганда суицида, самоповреждений или расстройств пищевого поведения.';

  @override
  String get iarReasonInappropriateProfile => 'Неприемлемый профиль';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Профиль этого пользователя содержит неприемлемый контент';

  @override
  String typingIndicatorOne(String name) {
    return '$name печатает...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 и $name2 печатают...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 и $name3 печатают...';
  }

  @override
  String get typingIndicatorMultiple => 'Несколько человек печатают...';

  @override
  String get typingIndicatorHandful =>
      'Собирается горстка клавиатурных воинов...';

  @override
  String get typingIndicatorSymphony => 'Начинается симфония стука клавиш...';

  @override
  String get typingIndicatorFiesta =>
      'Здесь полным ходом идет фестиваль печатания!';

  @override
  String get typingIndicatorApocalypse => 'Ого, это апокалипсис печатающих!';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Рады видеть тебя, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Добро пожаловать, $username! Чувствуй себя как дома.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Привет, $username! Приятно видеть тебя здесь.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Привет, $username! Присоединяйся, когда будешь готов.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Привет, $username, рады видеть тебя здесь!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Привет, $username! Надеемся, тебе понравится.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Привет, $username, добро пожаловать на борт!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Рады, что ты добрался, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Добро пожаловать, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Добро пожаловать, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Добро пожаловать, $username! Мы рады, что ты здесь.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Добро пожаловать, $username! Надеемся, тебе понравится здесь.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Добро пожаловать, $username! Твой следующий разговор начинается здесь.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Добро пожаловать, $username. Мы рады, что ты здесь.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Рады видеть тебя, $username! Добро пожаловать.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Ты здесь, $username! Рады видеть тебя с нами.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Ты прибыл, $username! Начнем.';
  }

  @override
  String get relativeTimeShortNow => 'сейчас';

  @override
  String relativeTimeShortMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countм',
      one: '1м',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countч',
      one: '1ч',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countд',
      one: '1д',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countм',
      one: '1м',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countг',
      one: '1г',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'Мои устройства';

  @override
  String get linkedDevicesDescription =>
      'Просмотри все устройства, которые сейчас вошли в твой аккаунт. Отозови сеансы, которые ты не узнаешь.';

  @override
  String get linkedDevicesCurrentDevice => 'Текущее устройство';

  @override
  String get linkedDevicesOtherDevices => 'Другие устройства';

  @override
  String get linkedDevicesEnterSelection => 'Войти в режим выбора';

  @override
  String get linkedDevicesExitSelection => 'Выйти из режима выбора';

  @override
  String get linkedDevicesSelectAll => 'Выбрать все';

  @override
  String get linkedDevicesClearSelection => 'Очистить выбор';

  @override
  String get linkedDevicesRevokeTooltip => 'Отозвать устройство';

  @override
  String get linkedDevicesSignOutAll => 'Выйти со всех других устройств';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Выйти с $count устройств',
      one: 'Выйти с 1 устройства',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Выйти с $count устройств',
      one: 'Выйти с 1 устройства',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Выйти со всех других устройств';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Это приведет к выходу с выбранных устройств из твоего аккаунта. Тебе придется снова войти на этих устройствах.',
      one:
          'Это приведет к выходу с выбранного устройства из твоего аккаунта. Тебе придется снова войти на этом устройстве.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Это приведет к выходу с выбранных устройств из твоего аккаунта. Тебе придется снова войти на этих устройствах.';

  @override
  String get linkedDevicesSignOutConfirm => 'Продолжить';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Тебе придется снова войти на всех устройствах, с которых выполнен выход';

  @override
  String get linkedDevicesLoadErrorTitle => 'Сетевая ошибка';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'У нас возникли проблемы с подключением к пространственно-временному континууму. Пожалуйста, проверь свое подключение и попробуй снова.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Устройства отозваны',
      one: 'Устройство отозвано',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError => 'Не удалось выйти. Попробуй снова.';

  @override
  String get linkedDevicesUnknownOs => 'Неизвестная ОС';

  @override
  String get linkedDevicesUnknownPlatform => 'Неизвестная платформа';

  @override
  String slowmodeLabel(String duration) {
    return '$duration режим задержки';
  }

  @override
  String get slowmodeTooltipActive =>
      'Ты в режиме задержки. Пожалуйста, подожди перед отправкой следующего сообщения.';

  @override
  String get slowmodeTooltipImmune =>
      'Режим задержки включен, но ты освобожден от него.';

  @override
  String get slowmodeStatusEnabled => 'Медленный режим включен';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Медленный режим активен ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'Медленный режим установлен на $durationLabel, но вы освобождены от него.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Медленный режим установлен на $durationLabel. Подождите, прежде чем отправить следующее сообщение.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Медленный режим установлен на $durationLabel для этого канала.';
  }

  @override
  String get channelNoSendPermissionHint =>
      'Вы не можете отправлять сообщения в этом канале.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Системные объявления от сотрудников $productName. Отвечать здесь нельзя.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Отправка сообщений временно приостановлена в этом сообществе.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Вы временно отключены. Отправка сообщений, реакции и голосовая связь приостановлены до истечения срока отключения.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Вам необходимо подтвердить свою учетную запись, чтобы отправлять сообщения в этом сообществе.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Вам необходимо подтвердить свою электронную почту, чтобы отправлять сообщения в этом сообществе.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Ваша учетная запись слишком новая, чтобы отправлять сообщения в этом сообществе.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Вы недостаточно долго являетесь участником этого сообщества, чтобы отправлять сообщения.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Вам необходимо подтвердить номер телефона, чтобы отправлять сообщения в этом сообществе.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Подтвердить почту';

  @override
  String get channelComposerBarrierVerifyPhone => 'Подтвердить телефон';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Слишком много вложений (макс. $max)';
  }

  @override
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName превышает лимит размера ($fileSize)';
  }

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Эти файлы слишком велики для отправки вместе';

  @override
  String get chatAttachmentDropToUpload => 'Перетащите файлы для загрузки';

  @override
  String get chatAttachmentDropToSend =>
      'Перетащите файлы для немедленной отправки';

  @override
  String get chatAttachmentSendVoiceMessage => 'Отправить голосовое сообщение';

  @override
  String get voiceMessageTitle => 'Голосовое сообщение';

  @override
  String get voiceMessageHoldHint =>
      'Удерживайте для записи. Перетащите в корзину, чтобы удалить, проведите вверх, чтобы заблокировать, или отпустите, чтобы отправить.';

  @override
  String get voiceMessageDiscard => 'Удалить голосовое сообщение';

  @override
  String get voiceMessageSend => 'Отправить голосовое сообщение';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Не удалось начать запись. Предоставьте доступ к микрофону.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Запись голоса не поддерживается на этом устройстве.';

  @override
  String get voiceMessageMicInUse =>
      'Покиньте голосовой вызов, чтобы записать голосовое сообщение.';

  @override
  String get voiceMessageRecordingFailed => 'Ошибка записи. Попробуйте снова.';

  @override
  String get voiceMessageSendFailed =>
      'Не удалось отправить голосовое сообщение. Попробуйте снова.';

  @override
  String get voiceMessageRecordingHint =>
      'Говорите сейчас. Нажмите «Стоп», когда закончите — вы сможете обрезать запись позже.';

  @override
  String get voiceMessageReviewHint =>
      'Перетащите маркеры, чтобы обрезать, затем нажмите «Отправить».';

  @override
  String get voiceMessageStop => 'Стоп';

  @override
  String get voiceMessageStartRecording => 'Начать запись';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Воспроизвести';

  @override
  String get voiceMessagePause => 'Пауза';

  @override
  String get voiceMessageSeekForward => 'Перемотать вперёд';

  @override
  String get voiceMessageSeekBackward => 'Перемотать назад';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Выделенный фрагмент должен быть не менее $secondsStringс.';
  }

  @override
  String get chatAttachmentEditTitle => 'Редактировать вложение';

  @override
  String get chatAttachmentFilenameLabel => 'Имя файла';

  @override
  String get chatAttachmentDescriptionLabel => 'Описание';

  @override
  String get chatAttachmentDescriptionHint =>
      'Необязательный альтернативный текст';

  @override
  String get chatAttachmentSpoilerLabel => 'Отметить как спойлер';

  @override
  String get chatAttachmentRemove => 'Удалить вложение';

  @override
  String get chatAttachmentDownload => 'Скачать';

  @override
  String get chatAttachmentDownloadedToast => 'Сохранено в фото';

  @override
  String get chatAttachmentDownloadFailedToast => 'Не удалось скачать вложение';

  @override
  String get chatAttachmentExpiredTooltip => 'Вложение истекло';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Развернуть ($count строки)',
      one: 'Развернуть ($count строку)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Свернуть ($count строки)',
      one: 'Свернуть ($count строка)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Развернуть ($count строки)',
      one: 'Развернуть ($count строка)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Свернуть ($count строки)',
      many: 'Свернуть ($count строк)',
      few: 'Свернуть ($count строки)',
      one: 'Свернуть ($count строка)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... осталось $count строк)',
      one: '... (осталась $count строка)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... (осталось $count строки)',
      many: '... (осталось $count строк)',
      few: '... (осталось $count строки)',
      one: '... (осталась $count строка)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'Посмотреть весь файл';

  @override
  String get chatTextualPreviewChangeLanguage => 'Сменить язык';

  @override
  String get chatTextualPreviewSearchLanguage => 'Искать язык…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Подсветка синтаксиса';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'Ничего не найдено';

  @override
  String get chatTextualPreviewMoreOptions => 'Другие параметры';

  @override
  String get chatTextualPreviewWrapText => 'Переносить текст';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'Файл слишком большой для предпросмотра (лимит $previewLimitKb КБ).';
  }

  @override
  String get chatTextualPreviewLoadError =>
      'Не удалось загрузить предпросмотр.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Обычный текст';

  @override
  String get chatTextualPreviewCopy => 'Копировать';

  @override
  String get chatAttachmentSourceGallery => 'Галерея';

  @override
  String get chatAttachmentSourceCamera => 'Камера';

  @override
  String get chatAttachmentSourceBrowse => 'Обзор файлов';

  @override
  String get chatAttachmentPasteTooltip => 'Вставить файл из буфера обмена';

  @override
  String get chatAttachmentSpoiler => 'Спойлер';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Показать спойлер';

  @override
  String get matureMediaRevealButton => 'Показать';

  @override
  String get matureMediaRevealHint => 'Нажмите, чтобы показать';

  @override
  String get matureContentTitle => 'Контент для взрослых';

  @override
  String get matureCommunityTitle => 'Сообщество для взрослых';

  @override
  String get matureCategoryTitle => 'Категория для взрослых';

  @override
  String get matureChannelTitle => 'Канал для взрослых';

  @override
  String get communityContentWarningTitle =>
      'Предупреждение о контенте сообщества';

  @override
  String get categoryContentWarningTitle =>
      'Предупреждение о контенте категории';

  @override
  String get channelContentWarningTitle => 'Предупреждение о контенте канала';

  @override
  String get defaultContentWarningBody =>
      'Этот контент является конфиденциальным.';

  @override
  String get matureCommunityBody =>
      'Это сообщество помечено как содержащее материалы для взрослых и может включать контент, который может быть неприемлемым для некоторых пользователей.';

  @override
  String get matureCategoryBody =>
      'Эта категория помечена как содержащая материалы для взрослых и может включать контент, который может быть неприемлемым для некоторых пользователей.';

  @override
  String get matureChannelBody =>
      'Этот канал помечен как содержащий материалы для взрослых и может включать контент, который может быть неприемлемым для некоторых пользователей.';

  @override
  String get matureVoiceChannelBody =>
      'Этот голосовой канал помечен как содержащий материалы для взрослых и может включать контент, который может быть неприемлемым для некоторых пользователей.';

  @override
  String get matureLinkChannelBody =>
      'Этот канал ссылок помечен как содержащий материалы для взрослых и может открывать контент, который может быть неприемлемым для некоторых пользователей.';

  @override
  String get matureCommunityUnavailableBody =>
      'Это сообщество для взрослых недоступно для вашей учетной записи.';

  @override
  String get matureCategoryUnavailableBody =>
      'Эта категория для взрослых недоступна для вашей учетной записи.';

  @override
  String get matureChannelUnavailableBody =>
      'Этот канал для взрослых недоступен для вашей учетной записи.';

  @override
  String get matureContentProceedButton => 'Продолжить';

  @override
  String get matureContentUnderstandButton => 'Я понимаю';

  @override
  String get matureContentOpenLinkButton => 'Открыть ссылку';

  @override
  String get sensitiveContentSectionTitle => 'Конфиденциальный контент';

  @override
  String get sensitiveContentSectionDescription =>
      'Управляйте тем, как медиаматериалы для взрослых или конфиденциальные медиаматериалы фильтруются в различных контекстах.';

  @override
  String get sensitiveContentFriendDmLabel => 'Личные сообщения от друзей';

  @override
  String get sensitiveContentNonFriendDmLabel => 'Личные сообщения от других';

  @override
  String get sensitiveContentGuildLabel => 'Сообщения в каналах сообщества';

  @override
  String get sensitiveContentFilterShow => 'Показывать';

  @override
  String get sensitiveContentFilterBlur => 'Размыть';

  @override
  String get sensitiveContentFilterBlock => 'Блокировать';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Размывать медиа до завершения сканирования безопасности';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'При включении изображения и видео будут размыты до завершения сканирования безопасности контента.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Эта настройка всегда включена для вашей учетной записи.';

  @override
  String get sensitiveContentResetButton => 'Сбросить';

  @override
  String get sensitiveContentSaveButton => 'Сохранить';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файлов',
      one: '1 файла',
    );
    return 'Загрузка $_temp0';
  }

  @override
  String get chatCancelUpload => 'Отменить загрузку';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Срок действия до $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Срок действия с $start по $end';
  }

  @override
  String get connectionsTitle => 'Подключения';

  @override
  String connectionsDescription(String productName) {
    return 'Свяжите внешние учетные записи и домены с вашим профилем $productName. Подтвержденные подключения будут отображаться в вашем профиле для других.';
  }

  @override
  String get connectionsEmptyTitle => 'Пока нет подключений';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Свяжите свою учетную запись Bluesky или подтвердите владение доменом, чтобы отобразить их в своем профиле.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Подтвердите владение доменом, чтобы отобразить его в своем профиле.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Домен';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Добавить подключение Bluesky';

  @override
  String get connectionsAddDomainAriaLabel => 'Добавить подключение домена';

  @override
  String get connectionEdit => 'Изменить';

  @override
  String get connectionRemove => 'Удалить';

  @override
  String get connectionVerifiedLabel => 'Это подключение было подтверждено.';

  @override
  String get connectionUnverifiedLabel =>
      'Это подключение не было подтверждено.';

  @override
  String get connectionAddTitle => 'Добавить подключение';

  @override
  String get connectionTypeLabel => 'Тип подключения';

  @override
  String get connectionHandleLabel => 'Имя пользователя';

  @override
  String get connectionDomainLabel => 'Домен';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'У вас уже есть это подключение.';

  @override
  String get connectionConnectBluesky => 'Подключиться через Bluesky';

  @override
  String get connectionContinue => 'Продолжить';

  @override
  String get connectionVerifyTitle => 'Подтвердить подключение';

  @override
  String get connectionVerifyInstructions =>
      'Используйте запись ниже, чтобы подтвердить владение доменом.';

  @override
  String get connectionDnsRecordTitle => 'TXT-запись DNS';

  @override
  String get connectionDnsHostLabel => 'Хост';

  @override
  String get connectionDnsValueLabel => 'Значение';

  @override
  String get connectionCopyHost => 'Копировать хост';

  @override
  String get connectionCopyValue => 'Копировать значение';

  @override
  String get connectionCopied => 'Скопировано!';

  @override
  String get connectionTokenFileTitle => 'Разместить файл токена';

  @override
  String get connectionTokenFileDescription =>
      'Скачайте **fluxer-verification** и поместите его в папку **.well-known**, чтобы мы могли проверить домен.';

  @override
  String get connectionTokenFileDownload => 'Скачать fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Файл содержит токен верификации, который мы получим по адресу **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Сохранить fluxer-verification';

  @override
  String get connectionVerifyButton => 'Проверить';

  @override
  String get connectionBack => 'Назад';

  @override
  String get connectionEditTitle => 'Изменить подключение';

  @override
  String get connectionEditDescription =>
      'Выберите, кто может видеть это подключение в вашем профиле.';

  @override
  String get connectionVisibilityEveryone => 'Все';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Разрешить всем видеть это подключение в вашем профиле';

  @override
  String get connectionVisibilityFriends => 'Друзья';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Разрешить друзьям видеть это подключение';

  @override
  String get connectionVisibilityCommunityMembers => 'Участники сообщества';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Разрешить участникам сообществ, в которых вы состоите, видеть это подключение';

  @override
  String get connectionRemoveTitle => 'Удалить подключение';

  @override
  String get connectionRemoveDescription =>
      'Вы уверены, что хотите удалить это подключение? Это действие нельзя отменить.';

  @override
  String get connectionRemoveConfirm => 'Удалить';

  @override
  String get connectionsLoadError => 'Не удалось загрузить подключения';

  @override
  String get connectionsReorderError => 'Не удалось обновить порядок';

  @override
  String get connectionInitiateFailed =>
      'Не удалось начать проверку. Попробуйте снова.';

  @override
  String get connectionVerifyFailed =>
      'Не удалось проверить. Проверьте запись DNS и попробуйте снова.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Не удалось начать авторизацию Bluesky.';

  @override
  String get connectionUpdateFailed => 'Не удалось обновить подключение';

  @override
  String get connectionRemoveFailed => 'Не удалось удалить подключение';

  @override
  String get connectionTokenSavedToast => 'fluxer-verification сохранен';

  @override
  String get connectionTokenSaveFailedToast => 'Не удалось сохранить файл';

  @override
  String get connectionEnterHandle => 'Введите имя пользователя Bluesky.';

  @override
  String get connectionEnterDomain => 'Введите домен.';

  @override
  String get lookAndFeelTitle => 'Внешний вид';

  @override
  String get lookAndFeelThemeSectionTitle => 'Тема';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Выберите темное, угольное или светлое оформление.';

  @override
  String get lookAndFeelHdrSectionTitle => 'Расширенный динамический диапазон';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Настройка отображения HDR-изображений на HDR-совместимых мониторах.';

  @override
  String get lookAndFeelHdrFullName => 'Полный динамический диапазон';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Отображать HDR-изображения с полной яркостью и цветовым диапазоном.';

  @override
  String get lookAndFeelHdrStandardName => 'Стандартный диапазон';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Тональная компрессия HDR-изображений до стандартного диапазона, уменьшающая пиковую яркость.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'Режим отображения с расширенным динамическим диапазоном';

  @override
  String get lookAndFeelThemeDark => 'Темная тема';

  @override
  String get lookAndFeelThemeCoal => 'Угольная тема';

  @override
  String get lookAndFeelThemeLight => 'Светлая тема';

  @override
  String get lookAndFeelThemeSystem => 'Системная тема';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Синхронизировать тему на всех устройствах';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Когда включено, изменения темы будут синхронизироваться со всеми вашими устройствами. Когда выключено, это устройство будет использовать собственные настройки темы.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Системная тема автоматически отключает синхронизацию, чтобы отслеживать предпочтения вашей системы на этом устройстве.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Не удалось синхронизировать тему с вашей учетной записью. Пожалуйста, попробуйте еще раз.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Масштаб шрифта чата';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Настройте размер шрифта в области чата.';

  @override
  String get lookAndFeelChatFontSizeLabel => 'Размер шрифта чата';

  @override
  String get lookAndFeelAppZoomTitle => 'Масштаб приложения';

  @override
  String get lookAndFeelAppZoomDescription => 'Настроить масштаб приложения.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'Обои чата';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'Выберите фон для чата. Он сохранится на этом устройстве.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'Эта настройка останется на этом устройстве';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'Обои для чата сохранены только на этом устройстве и не синхронизируются с другими.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'По умолчанию';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'Собственное изображение';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Цвет $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Градиент $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'Затемнить обои';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'Не удалось установить это изображение в качестве обоев.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Сообщения';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Выберите, как будут отображаться сообщения в чатах.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Расстояние между группами сообщений';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '$spacing пкс';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel =>
      'Режим отображения сообщений';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Удобный';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Просторный макет с чётким визуальным разделением между сообщениями.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Плотный';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Максимальное количество сообщений с минимальным интервалом.';

  @override
  String get lookAndFeelHideUserAvatarsLabel =>
      'Скрывать аватары пользователей';

  @override
  String get lookAndFeelInterfaceTitle => 'Интерфейс';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Настройте элементы и поведение интерфейса.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Индикаторы набора текста в списке каналов';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Выберите, как индикаторы набора текста отображаются в списке каналов, когда кто-то набирает сообщение в канале.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Индикатор набора + Аватары';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Показывать индикатор набора текста с аватарами пользователей в списке каналов';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Только индикатор набора';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Показывать только индикатор набора текста без аватаров';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Скрыто';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Не показывать индикаторы набора текста в списке каналов';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Показывать набор в выбранном канале';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Когда выключено (по умолчанию), индикаторы набора текста не будут отображаться в канале, который вы просматриваете в данный момент.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'general';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Подсказки клавиатуры';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Управляйте отображением подсказок сочетаний клавиш во всплывающих подсказках.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Скрыть подсказки клавиатуры во всплывающих подсказках';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Когда включено, значки сочетаний клавиш скрываются во всплывающих подсказках.';

  @override
  String get lookAndFeelNekoTitle => 'Разное';

  @override
  String get lookAndFeelNekoDescription => 'Различные параметры интерфейса.';

  @override
  String get lookAndFeelShowNekoLabel => 'Показывать Неко';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Когда включено, Неко появляется рядом с полем ввода чата.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Поведение при входе в голосовой канал';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Управляйте тем, как вы присоединяетесь к голосовым каналам в сообществах.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Требовать двойной клик для входа в голосовые каналы';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Когда включено, вам потребуется дважды щелкнуть голосовые каналы, чтобы присоединиться к ним. Когда выключено (по умолчанию), одиночный клик немедленно присоединит к каналу.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Съешь же ещё этих мягких французских булок, да выпей чаю.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Боковая панель сервера';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Настройте отображение прямых сообщений в боковой панели сервера.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count сообществ временно недоступно из-за неисправности флюктуатора.',
      one: '1 сообщество временно недоступно из-за неисправности флюктуатора.',
    );
    return '$_temp0';
  }

  @override
  String get communityTemporarilyUnavailable =>
      'Сообщество временно недоступно';

  @override
  String get guildUnavailableDescription =>
      'Что-то пошло не так. Мы уже работаем над этим.';

  @override
  String get guildNotFoundTitle => 'Это не то сообщество, которое вы ищете.';

  @override
  String get guildNotFoundDescription =>
      'Возможно, сообщество, которое вы ищете, было удалено или у вас нет к нему доступа.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return 'Сообщество «$communityName» в настоящее время доступно только сотрудникам $productName';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => 'временно недоступно';

  @override
  String get lookAndFeelCollapseDMsLabel => 'Свернуть ЛС в папку';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'Когда включено, непрочитанные ЛС в боковой панели сервера сворачиваются в папку на кнопке $productName. Нажмите кнопку $productName, находясь на странице ЛС, чтобы развернуть или свернуть папку.';
  }

  @override
  String get lookAndFeelChannelListSectionTitle => 'Список каналов';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Управляйте поведением индикатора непрочитанных сообщений для заглушенных каналов в списках каналов.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Показывать индикатор непрочитанных сообщений в заглушенных каналах';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Когда включено, в заглушенных каналах слева отображается бледный индикатор непрочитанных сообщений. Упоминания по-прежнему отображаются независимо от этой настройки.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Активные сейчас';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Управляйте тем, как отображается раздел «Активные сейчас» в приложении.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Показывать «Активные сейчас» на главном экране';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Показывает «Активные сейчас» на главном экране, чтобы отображать друзей, активных в голосовых каналах. Вы увидите предварительный просмотр, контекст канала, кто уже там, и быстрый способ присоединиться.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Избранное';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Управляйте видимостью избранного во всем приложении.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Включить избранное';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Когда включено, вы можете добавлять каналы в избранное, и они будут отображаться в разделе «Избранное». Когда выключено, все элементы интерфейса, связанные с избранным (кнопки, пункты меню), будут скрыты. Ваши существующие избранные будут сохранены.';

  @override
  String get favoritesTitle => 'Избранное';

  @override
  String get favoritesEmptyTitle => 'Пока нет избранного';

  @override
  String get favoritesEmptyDescription =>
      'Отмечайте каналы звездочкой в заголовке чата, чтобы они отображались здесь.';

  @override
  String get favoritesWelcomeTitle => 'Добро пожаловать в избранное';

  @override
  String get favoritesWelcomeDescription =>
      'Ваше личное пространство для быстрого доступа к любимым каналам, личным сообщениям и группам. Нажмите на звездочку в любом канале, чтобы добавить его сюда.';

  @override
  String get favoritesWelcomeTip =>
      'Не хотите использовать? Отключите в любое время.';

  @override
  String get favoritesDisableButton => 'Отключить избранное';

  @override
  String get favoritesAddedToast => 'Добавлено в избранное';

  @override
  String get favoritesRemovedToast => 'Удалено из избранного';

  @override
  String get favoritesHiddenToast => 'Избранное скрыто';

  @override
  String get favoritesMute => 'Отключить уведомления избранного';

  @override
  String get favoritesUnmute => 'Включить уведомления избранного';

  @override
  String get favoritesHeaderMenu => 'Меню избранного';

  @override
  String get favoritesCreateCategory => 'Создать категорию';

  @override
  String get favoritesCategoryNameLabel => 'Название категории';

  @override
  String get favoritesHideMutedChannels => 'Скрывать заглушенные каналы';

  @override
  String get favoritesShowMutedChannels => 'Показывать заглушенные каналы';

  @override
  String get favoritesSetNickname => 'Установить псевдоним';

  @override
  String get favoritesNicknameLabel => 'Псевдоним';

  @override
  String get favoritesSaveNickname => 'Сохранить псевдоним';

  @override
  String get favoritesMoveToCategory => 'Переместить в категорию';

  @override
  String get favoritesUncategorized => 'Без категории';

  @override
  String get favoritesOtherCategory => 'Другое';

  @override
  String get favoritesRemoveFromFavorites => 'Удалить из избранного';

  @override
  String get favoritesAddToFavorites => 'Добавить в избранное';

  @override
  String get favoritesAddToSavedMedia => 'Добавить в сохраненные медиа';

  @override
  String get favoritesRemoveFromSavedMedia => 'Удалить из сохраненных медиа';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Добавить в избранные GIF-файлы (только по URL)';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Удалить из списка избранных GIF-файлов, сохраненных по URL';

  @override
  String get savedMediaAddTitle => 'Добавить в сохраненные медиа';

  @override
  String get savedMediaFormNameLabel => 'Название';

  @override
  String get savedMediaFormNameHint => 'Мои классные медиа';

  @override
  String get savedMediaFormAltTextLabel => 'Альтернативный текст';

  @override
  String get savedMediaFormAltTextHint => 'Опишите медиафайл';

  @override
  String get savedMediaFormTagsLabel => 'Теги';

  @override
  String get savedMediaFormTagsHint => 'смешное, реакция, работа';

  @override
  String get savedMediaSaveError => 'Не удалось обновить сохранённые медиа.';

  @override
  String get savedMediaNameRequired => 'Требуется имя.';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'Как сохранять ваши любимые GIF-файлы?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'Вы можете сохранять понравившиеся GIF-файлы как избранные только по URL или загружать их в сохраненные медиа. Выберите вариант, который подходит вам. Вы можете изменить его в любое время в Настройки > Дополнительно > Медиа.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'Избранное только по ссылке (по умолчанию): синхронизируется между вашими устройствами, без загрузки, не учитывается в сохраненных медиа. Оригинальные медиа могут исчезнуть, если их удалит хост.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Сохраненные медиа: загруженные, с тегами, доступные для поиска и постоянные, но учитываются в лимите сохраненных медиа.';

  @override
  String get gifFavoriteFirstTimeHint => 'Мы спросим только один раз.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly =>
      'Использовать только URL (рекомендуется)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia =>
      'Использовать сохранённые медиа';

  @override
  String get favoritesHideConfirmTitle => 'Скрыть избранное';

  @override
  String get favoritesHideConfirmDescription =>
      'Это скроет все элементы интерфейса, связанные с избранным, включая кнопки и пункты меню. Ваши существующие избранные каналы будут сохранены и могут быть повторно включены в любое время в разделе «Настройки» > «Дополнительно» > «Внешний вид».';

  @override
  String get favoritesDirectMessageSubtitle => 'Личное сообщение';

  @override
  String get messagesMediaDisplayGroupTitle => 'Отображение';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Настройте отображение сообщений, медиафайлов и другого контента.';

  @override
  String get messagesMediaMediaGroupTitle => 'Медиа';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Настройте размер медиафайлов и кнопки.';

  @override
  String get messagesMediaInputGroupTitle => 'Ввод';

  @override
  String get messagesMediaInputGroupDescription =>
      'Настройте параметры ввода сообщений.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Боковая панель';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Настройте отображение боковой панели сообщества.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Скрывать заглушенные каналы по умолчанию';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Автоматически скрывать заглушенные каналы в боковой панели при вступлении в новые сообщества';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Скрывать заглушенные каналы по умолчанию?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'В новых сообществах, к которым вы присоединитесь, заглушенные каналы будут автоматически скрываться. Хотите применить эту настройку ко всем существующим сообществам?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Прекратить скрывать заглушенные каналы по умолчанию?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'В новых сообществах, к которым вы присоединитесь, заглушенные каналы больше не будут автоматически скрываться. Хотите показать заглушенные каналы во всех существующих сообществах?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Применить ко всем сообществам';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Показать во всех сообществах';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Только новые сообщества';

  @override
  String get messagesMediaDisplaySectionTitle => 'Отображение медиа';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Настройте отображение изображений, видео и других медиафайлов. Все медиафайлы изменяются в размере и конвертируются. Очень большие файлы, которые не могут быть сжаты в предварительный просмотр, не будут встраиваться независимо от этих настроек.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'При публикации в виде ссылок в чате';

  @override
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'При прямой загрузке в $productName';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle =>
      'Предварительный просмотр ссылок';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Настройте предварительный просмотр веб-ссылок в чате';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Показывать встраиваемые объекты и предварительный просмотр веб-ссылок';

  @override
  String get messagesMediaReactionsSectionTitle => 'Реакции';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Настройте реакции на сообщения';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Показывать реакции на сообщения';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Скрытый контент';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Управляйте отображением скрытого контента';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Показывать скрытый контент';

  @override
  String get messagesMediaSpoilersOnClickName => 'По нажатию';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Показывать скрытый контент при нажатии';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'В каналах, которые я модерирую';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Всегда показывать скрытый контент в каналах, где у вас есть разрешение \"Управлять сообщениями\"';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Всегда';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Всегда показывать скрытый контент';

  @override
  String get messagesMediaSizeSectionTitle => 'Настройки размера медиа';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Настройте максимальный размер отображения встроенных и прикрепленных медиа. Меньшие размеры занимают меньше места на экране, а большие показывают больше деталей.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Медиа из ссылок (встроенные)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Загруженные вложения';

  @override
  String get messagesMediaSizeCompactName => 'Компактный (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Меньший размер медиа';

  @override
  String get messagesMediaSizeComfortableName => 'Комфортный (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Больший размер медиа с большей детализацией';

  @override
  String get messagesMediaGifsSectionTitle => 'Поведение GIF';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Управляйте вставкой GIF в чат';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Автоматически отправлять GIF при выборе';

  @override
  String get messagesMediaCameraUploadsSectionTitle => 'Загрузка с камеры';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Выберите, будут ли фотографии и видео, снятые с помощью встроенной камеры, сохраняться на вашем устройстве';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel =>
      'Сохранить на устройство';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Автозаполнение выражений (автозаполнение по двоеточию)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Управляйте тем, что появляется в автозаполнении выражений при вводе двоеточия. Настройте, какие предложения отображаются, чтобы соответствовать вашим предпочтениям.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Показывать стандартные эмодзи в автозаполнении выражений';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Показывать пользовательские эмодзи в автозаполнении выражений';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Показывать стикеры в автозаполнении выражений';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Показывать сохраненные медиа в автозаполнении выражений';

  @override
  String get messagesMediaEditingSectionTitle => 'Редактирование сообщений';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Управляйте тем, что происходит с черновиком вашего редактирования при отмене.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Сохранять черновик редактирования при отмене';

  @override
  String get accessibilitySaturationTitle => 'Насыщенность';

  @override
  String get accessibilitySaturationDescription =>
      'Настройте яркость цветов темы во всём приложении.';

  @override
  String get accessibilityVisualGroupTitle => 'Визуальные настройки';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'Всегда подчеркивать ссылки';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Приглушить зачеркнутый текст';

  @override
  String get accessibilityDmMessagePreviewGroupTitle => 'Превью сообщений в ЛС';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Управляйте тем, когда превью сообщений отображаются в списке ЛС.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Режим превью сообщений в ЛС';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Все сообщения';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Показывать превью сообщений для всех переписок в ЛС';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Только непрочитанные ЛС';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Показывать превью сообщений только для ЛС с непрочитанными сообщениями';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Нет';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Не показывать превью сообщений в списке ЛС';

  @override
  String get accessibilityScreenReaderGroupTitle => 'Экранный диктор';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Управляйте работой $productName с помощью программ чтения с экрана.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Объявлять о новых сообщениях';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Включите, чтобы программы чтения с экрана объявляли новые сообщения по мере их поступления в открытый канал. Звуки уведомлений останутся без изменений.';

  @override
  String get accessibilityTtsGroupTitle => 'Текст в речь';

  @override
  String get accessibilityTtsGroupDescription =>
      'Выберите скорость воспроизведения текста.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Скорость воспроизведения речи';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Воспроизвести образец';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Без звука';

  @override
  String get accessibilityPreviewButtonLabel => 'Кнопка предпросмотра';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'Так выглядят ссылки: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName =>
      'Предварительный просмотр пользователя';

  @override
  String get accessibilityKeyboardGroupTitle => 'Клавиатура';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Показывать рамку фокуса в поле ввода чата';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'Клавиша Escape выходит из режима клавиатуры';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Показывать сочетания клавиш в контекстном меню';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Подтверждать перед звонком';

  @override
  String get accessibilityAnimationGroupTitle => 'Анимация';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'У вас включено уменьшение движения, поэтому анимация контента по умолчанию приостановлена. Вы можете включить любую из них, чтобы она воспроизводилась.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel =>
      'Воспроизводить анимированные эмодзи';

  @override
  String get accessibilityAutoPlayGifsMobileLabel =>
      'Автоматически воспроизводить GIF-файлы';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'Автоматически воспроизводить GIF-файлы, когда $productName в фокусе';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Воспроизводится, несмотря на уменьшение движения.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Приостановлено из-за уменьшения движения. Включите, чтобы анимированные эмодзи продолжали воспроизводиться.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Приостановлено из-за уменьшения движения. Включите, чтобы GIF-файлы воспроизводились.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'По умолчанию отключено на мобильных устройствах для экономии заряда батареи и трафика.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Анимация стикеров';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Настройки анимации стикеров';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Всегда анимировать';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Стикеры всегда будут анимироваться';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Анимация при взаимодействии';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Стикеры будут анимироваться при нажатии';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Стикеры будут анимироваться при наведении или взаимодействии с ними';

  @override
  String get accessibilityStickerNeverAnimateName => 'Никогда не анимировать';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Стикеры никогда не будут анимироваться';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Всегда анимировать, несмотря на уменьшение движения.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'При включенном режиме уменьшения движения стикеры анимируются только при взаимодействии. Выберите «Всегда анимировать», чтобы отменить это.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'По умолчанию анимация на мобильных устройствах включается при взаимодействии для экономии заряда батареи.';

  @override
  String get accessibilityMotionGroupTitle => 'Движение';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Синхронизировать настройки уменьшения движения с системой';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Используйте системные настройки устройства для уменьшения движения или настройте их ниже.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Уменьшить движение';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Отключить анимацию и переходы. Сейчас управляется настройками вашей системы.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Отключить анимации и переходы во всём приложении.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Анимированные эмодзи, GIF-файлы и стикеры остаются под вашим контролем на вкладке «Анимация».';

  @override
  String get accessibilityConfirmStartCallTitle => 'Начать звонок?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Вы уверены, что хотите начать этот звонок?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Начать звонок';

  @override
  String get accessibilityTtsSampleDescription =>
      'Прослушайте образец фразы с выбранной скоростью.';

  @override
  String get accessibilityTtsSampleText =>
      'Док, я из будущего. Я прибыл сюда на машине времени, которую вы изобрели. Теперь мне нужна ваша помощь, чтобы вернуться в 1985 год.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'Синтез речи недоступен на этом устройстве.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Не удалось воспроизвести речь. Повторите попытку или проверьте работу аудиовыхода.';

  @override
  String get ttsSubstitutionUnknownUser => 'неизвестный пользователь';

  @override
  String get ttsSubstitutionUnknownRole => 'неизвестная роль';

  @override
  String get ttsSubstitutionUnknownChannel => 'неизвестный канал';

  @override
  String get ttsSubstitutionCodeBlock => 'блок кода';

  @override
  String get ttsSubstitutionSpoiler => 'спойлер';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'эмодзи \"$emojiName\"';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return '/ $commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName сказал(-а): $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'В ответ на сообщение $replyAuthorName, $authorName сказал(-а): $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName: $description';
  }

  @override
  String get ttsSentSticker => 'отправил стикер';

  @override
  String get ttsSentAttachment => 'отправил вложение';

  @override
  String ttsSentAttachments(int count) {
    return 'отправлено $count вложения';
  }

  @override
  String get ttsSentEmbed => 'отправил вложение';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author отправил $summary';
  }

  @override
  String get dmListSentAnAttachment => 'Отправил вложение';

  @override
  String systemPreviewPinnedMessage(String username) {
    return 'Пользователь $username закрепил сообщение в этом канале.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return 'Пользователь $username добавил пользователя $userName в группу.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return 'Пользователь $username добавил кого-то в группу.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return 'Пользователь $username покинул группу.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username удалил(а) $userName из группы.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username удалил(а) кого-то из группы.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username изменил(а) название канала на $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username изменил(а) название канала.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username изменил(а) значок канала.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username начал(а) звонок.';
  }

  @override
  String get systemCallJoinTheCall => 'Присоединиться к звонку';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username начал звонок, который длился $duration.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'Вы пропустили звонок от $username, который длился $duration.';
  }

  @override
  String systemCallMissed(String username) {
    return 'Вы пропустили звонок от $username.';
  }

  @override
  String get systemCallDurationFewSeconds => 'несколько секунд назад';

  @override
  String get systemCallDurationMinute => 'минуту';

  @override
  String get systemCallDurationOneYear => '1 год';

  @override
  String get systemCallDurationOneMonth => '1 месяц';

  @override
  String get systemCallDurationOneWeek => '1 неделя';

  @override
  String get systemCallDurationOneDay => '1 день';

  @override
  String get systemCallDurationOneHour => '1 час';

  @override
  String systemCallDurationYears(int count) {
    return '$count лет';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count мес.';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count недель';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count дн.';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count часа';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count минут';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Обновите $productName, чтобы просмотреть это сообщение.';
  }

  @override
  String get voiceConnectionConfirmTitle =>
      'Подтверждение голосового подключения';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Вы уже подключены к этому голосовому каналу с $count других устройств. Что вы хотите сделать?',
      one:
          'Вы уже подключены к этому голосовому каналу с 1 другого устройства. Что вы хотите сделать?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Переключиться на это устройство';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Просто подключиться (сохранить другие подключения)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Ничего не делать, я не хочу подключаться';

  @override
  String get voiceJoinFailedTitle =>
      'Не удалось присоединиться к голосовому каналу';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Не удалось отключить другие ваши устройства. Попробуйте снова через мгновение.';

  @override
  String get voiceChannelEmptyDescription =>
      'Это голосовой канал. Подключитесь, чтобы начать говорить!';

  @override
  String get voiceChannelJoin => 'Присоединиться к голосовому каналу';

  @override
  String get voiceCallJoin => 'Присоединиться к звонку';

  @override
  String get voiceChannelJoinConnect => 'Подключиться к голосу';

  @override
  String get voiceChannelNoConnectPermission =>
      'У вас нет разрешения на подключение к этому голосовому каналу';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Микрофон, камера и контент демонстрации экрана зашифрованы сквозным шифрованием.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Микрофон, камера и контент демонстрации экрана зашифрованы сквозным шифрованием.';

  @override
  String get voiceChannelE2eeBroken =>
      'Сквозное шифрование недоступно, так как в этом голосовом канале находится неподдерживаемый участник.';

  @override
  String get voiceCallE2eeBroken =>
      'Сквозное шифрование недоступно, так как в этом звонке находится неподдерживаемый участник.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Этот клиент должен быть обновлен перед подключением к этому зашифрованному звонку.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Не удалось включить ваш микрофон. Вы все еще в звонке.';

  @override
  String get voiceChannelStatusConnecting => 'Подключение…';

  @override
  String get voiceChannelStatusConnected => 'Подключено';

  @override
  String get voiceChannelStatusError => 'Ошибка';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Мобильное устройство';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Настольное устройство';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Отключен сообществом';

  @override
  String get voiceParticipantTooltipMuted => 'Отключен';

  @override
  String get voiceParticipantTooltipCommunityDeafened => 'Заглушен сообществом';

  @override
  String get voiceParticipantTooltipDeafened => 'Заглушен';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Подключение: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count участников',
      one: '1 участник',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Выйти';

  @override
  String get voiceControlMute => 'Отключить микрофон';

  @override
  String get voiceControlUnmute => 'Включить микрофон';

  @override
  String get voiceControlDeafen => 'Заглушить';

  @override
  String get voiceControlUndeafen => 'Снять заглушение';

  @override
  String get voiceControlVideo => 'Видео';

  @override
  String get voiceControlFlipCamera => 'Переключить камеру';

  @override
  String get voiceControlScreenShare => 'Демонстрация экрана';

  @override
  String get voiceScreenShareNotificationText => 'Демонстрация вашего экрана.';

  @override
  String get voiceControlMore => 'Еще';

  @override
  String get voiceControlDisconnect => 'Отключиться';

  @override
  String get voiceInChat => 'В голосовом чате';

  @override
  String get voiceConnectionFailed => 'Не удалось подключиться';

  @override
  String get voiceConnectionRetry => 'Повторить';

  @override
  String get voiceConnectionDismiss => 'Закрыть';

  @override
  String get voiceConnectionDisconnected => 'Отключено';

  @override
  String voicePingMs(int currentLatency) {
    return 'Пинг: $currentLatency мс';
  }

  @override
  String get voiceMeasuringLatency => 'Измеряем задержку...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Перейти к $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'Голосовое соединение';

  @override
  String get voiceConnectionAdvancedStats => 'Расширенные';

  @override
  String get voiceShowCallAvatars => 'Показывать аватары в звонке';

  @override
  String get voiceShowConnectionId => 'Показать ID подключения';

  @override
  String get voiceAudioProcessing => 'Обработка аудио';

  @override
  String get voiceConnectionSessionSection => 'Сеанс';

  @override
  String get voiceConnectionDurationLabel => 'Длительность';

  @override
  String get voiceConnectionParticipantsLabel => 'Участники';

  @override
  String get voiceConnectionNetworkSection => 'Сеть';

  @override
  String get voiceConnectionPingLabel => 'Пинг';

  @override
  String get voiceConnectionJitterLabel => 'Джиттер';

  @override
  String get voiceConnectionSendLabel => 'Отправить';

  @override
  String get voiceConnectionReceiveLabel => 'Приём';

  @override
  String get voiceConnectionUnavailable => '—';

  @override
  String voiceConnectionDuration(int minutes, int seconds) {
    return '$minutes м $seconds с';
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
    return '$bandwidth Кбит/с';
  }

  @override
  String get userAreaMuteMicrophone => 'Выключить микрофон';

  @override
  String get userAreaUnmuteMicrophone => 'Включить микрофон';

  @override
  String get userAreaUserSettings => 'Настройки пользователя';

  @override
  String get voiceParticipantMenuViewProfile => 'Посмотреть профиль';

  @override
  String get voiceParticipantMenuFocus => 'Сфокусироваться на этом участнике';

  @override
  String get voiceParticipantMenuUnfocus => 'Отменить фокус';

  @override
  String get voiceParticipantMenuCommunityMute =>
      'Выключить микрофон участника';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Заглушить в сообществе';

  @override
  String get voiceParticipantMenuUserVolume => 'Громкость пользователя';

  @override
  String get voiceParticipantMenuStreamVolume => 'Громкость трансляции';

  @override
  String get voiceParticipantMenuStopStreaming => 'Прекратить трансляцию';

  @override
  String get voiceParticipantModerationFailed =>
      'Не удалось обновить участника. Попробуйте снова.';

  @override
  String get voiceControlChat => 'Чат';

  @override
  String get voiceCallViewModeLabel => 'Посмотреть';

  @override
  String get voiceCallViewModeGrid => 'Сетка';

  @override
  String get voiceCallViewModeFocus => 'Фокус';

  @override
  String get voicePanelSettingsSectionTitle => 'Настройки голоса';

  @override
  String get voicePanelUseEarpieceLabel => 'Использовать динамик телефона';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Показывать только видео';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Показывать только участников с включенной камерой.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Показывать мою камеру';

  @override
  String get voicePrioritizeSpeakersLabel => 'Приоритет говорящих';

  @override
  String get voiceTextChatShow => 'Показать чат';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# непрочитанными сообщениями',
      one: '# непрочитанным сообщением',
    );
    return 'Показать чат с $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Разрешение на использование камеры требуется для видео.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Не удалось начать демонстрацию экрана. Пожалуйста, попробуйте еще раз.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Разрешение на демонстрацию экрана было отклонено.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Демонстрация экрана недоступна на этом устройстве.';

  @override
  String get voiceWatchStream => 'Смотреть трансляцию';

  @override
  String get voiceStopWatching => 'Прекратить просмотр';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Прекратить просмотр текущего потока';

  @override
  String get voiceOwnScreenShareTitle => 'Вы транслируете';

  @override
  String get voiceOwnScreenShareSubtitle => 'Ваш поток доступен участникам.';

  @override
  String get voiceLiveBadge => 'LIVE';

  @override
  String get dmVoiceViewCall => 'Просмотреть звонок';

  @override
  String get dmVoiceCallFullScreen => 'На весь экран';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Открыть звонок на весь экран';

  @override
  String get dmVoiceStripStatusConnecting => 'Подключение…';

  @override
  String get dmVoiceStripStatusInCall => 'В звонке';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Голосовой звонок';

  @override
  String get dmVoiceCallBarConnecting => 'Подключение…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Прямой звонок';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Групповой звонок';

  @override
  String get dmVoiceCallBarIssueFallback => 'Проблема с голосом';

  @override
  String get dmVoiceFullscreenTitle => 'Голос';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Голос подключен';

  @override
  String get notificationsPageTitle => 'Уведомления';

  @override
  String get notificationsFilterUnreads => 'Непрочитанные';

  @override
  String get notificationsFilterMentions => 'Упоминания';

  @override
  String get notificationsBookmarksTooltip => 'Закладки';

  @override
  String get notificationsMentionFilterTooltip => 'Фильтровать упоминания';

  @override
  String get notificationsMentionFiltersTitle => 'Фильтры упоминаний';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Включить упоминания @everyone и @here';

  @override
  String get notificationsMentionIncludeRoles => 'Включить упоминания ролей';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Включить все упоминания сообщества';

  @override
  String get notificationsNoUnreadTitle => 'Нет непрочитанных сообщений';

  @override
  String get notificationsNoUnreadBody => 'Вы всё прочитали.';

  @override
  String get notificationsNoMentionsTitle => 'Нет недавних упоминаний';

  @override
  String get notificationsNoMentionsBody =>
      'Все упоминания вас будут отображаться здесь в течение 7 дней.';

  @override
  String get notificationsMentionsEndTitle => 'Вы достигли конца';

  @override
  String get notificationsMentionsEndBody =>
      'Вы просмотрели все свои недавние упоминания. Не волнуйтесь, скоро появятся новые.';

  @override
  String get notificationsJump => 'Перейти';

  @override
  String get notificationsRemoveMentionTooltip => 'Удалить упоминание';

  @override
  String get notificationsViewAllUnread => 'Показать все непрочитанные';

  @override
  String get notificationsMarkAsRead => 'Отметить как прочитанное';

  @override
  String get notificationsExpand => 'Развернуть';

  @override
  String get notificationsCollapse => 'Свернуть';

  @override
  String get notificationsMessageUnavailable =>
      'Это сообщение не удалось загрузить.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining символов осталось';
  }

  @override
  String get characterCounterTooLong => 'Сообщение слишком длинное';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining символов осталось. Получите $productName, чтобы писать до $premiumMaxLength символов.';
  }

  @override
  String get chatMessageFailedToSend => 'Не удалось отправить сообщение';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Ваше сообщение не может быть доставлено. Обычно это происходит потому, что вы не состоите в одном сообществе с получателем или получатель принимает личные сообщения только от друзей. Возможно, вам также потребуется изменить собственные настройки конфиденциальности личных сообщений в разделе $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Ваше сообщение не может быть доставлено. Вам необходимо подтвердить свою учетную запись, чтобы отправлять личные сообщения.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Ваше сообщение не может быть доставлено. Вам необходимо подтвердить свою учетную запись, чтобы отправлять сообщения.';

  @override
  String get chatSendFailureContentBlocked =>
      'Ваше сообщение не может быть доставлено, так как оно было помечено нашими системами безопасности. Если вы считаете, что это ошибка, свяжитесь с поддержкой.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Ваше сообщение не может быть доставлено, так как оно содержит неприемлемые эмодзи или стикеры, которые не разрешены в этом контексте.';

  @override
  String get chatClientSystemOnlyYouCanSee => 'Это сообщение видите только вы.';

  @override
  String get chatClientSystemDismiss => 'Закрыть';

  @override
  String get privacyDashboardCommunicationSection => 'Общение';

  @override
  String get privacyDashboardProfilePrivacySection =>
      'Конфиденциальность профиля';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Друзья и личные сообщения';

  @override
  String get privacyDashboardActivitySharingSection =>
      'Настройки конфиденциальности: отображение активности в голосовом канале';

  @override
  String get privacyDashboardSensitiveContentSection => 'Контент 18+';

  @override
  String get privacyDashboardDataExportSection => 'Экспорт данных';

  @override
  String get privacyDashboardDataDeletionSection => 'Удаление данных';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Кто может видеть ваш полный профиль';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Друзья и все сообщества';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Ваш полный профиль виден друзьям и всем участникам ваших сообществ';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Только друзья и небольшие сообщества';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Ваш полный профиль виден друзьям и участникам сообществ, в которых не более 200 человек';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Только друзья';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Ваш полный профиль виден только вашим друзьям';

  @override
  String get privacyDashboardFriendRequestsTitle =>
      'Запросы на добавление в друзья';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Все';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Разрешить всем отправлять вам запросы в друзья';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends => 'Друзья друзей';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Разрешить друзьям ваших друзей отправлять вам запросы';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Участники сообщества';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Разрешить участникам сообществ, в которых вы состоите, отправлять вам запросы';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Личные сообщения';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Разрешить личные сообщения от участников сообщества';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Разрешить участникам сообществ, в которых вы состоите, отправлять вам личные сообщения';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Разрешить личные сообщения от ботов сообществ';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Разрешить ботам из ваших сообществ отправлять вам личные сообщения';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Управляйте тем, кто может отправлять вам запросы в друзья и личные сообщения';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Управляйте тем, кто может вам звонить и добавлять вас в групповые чаты';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Входящие звонки';

  @override
  String get privacyDashboardIncomingCallsDesc =>
      'Управляйте тем, кто может вам звонить';

  @override
  String get privacyDashboardAllowedCallers =>
      'Разрешенные вызывающие абоненты';

  @override
  String get privacyDashboardIncomingCallNobody => 'Никто';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Блокировать все входящие вызовы';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Только друзья';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Разрешить звонки только друзьям (рекомендуется)';

  @override
  String get privacyDashboardIncomingCallCustom => 'Друзья + Пользовательский';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Разрешить друзьям и выбранным дополнительным группам';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Все';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Разрешить всем звонить вам, даже незнакомцам';

  @override
  String get privacyDashboardAdditionalGroups => 'Дополнительные группы';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'Ваши друзья смогут звонить вашим друзьям';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'Люди из общих сообществ смогут вам звонить';

  @override
  String get privacyDashboardRingBehavior => 'Поведение кольца';

  @override
  String get privacyDashboardSilentCalls => 'Тихие звонки от всех';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'Все вызовы будут уведомлять без звука вместо звонка. По умолчанию вызовы от незнакомцев всегда беззвучны.';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Кто может добавлять вас в групповые чаты';

  @override
  String get privacyDashboardGroupDmDesc =>
      'Управляйте тем, кто может добавлять вас в групповые чаты без подтверждения. Любой по-прежнему сможет отправлять вам ссылки-приглашения для вступления.';

  @override
  String get privacyDashboardAllowedInvites => 'Разрешенные приглашения';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Никто не сможет добавлять вас в групповые чаты без вашего разрешения';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Разрешить друзьям добавлять вас без запроса (рекомендуется)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Разрешить друзьям и дополнительным группам добавлять вас';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Разрешить всем добавлять вас в групповые чаты без подтверждения';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'Люди, которые являются друзьями ваших друзей, могут добавлять вас в групповые чаты';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'Люди из общих сообществ могут добавлять вас в групповые чаты';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Голосовая активность в сети';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Делиться голосовой активностью с друзьями';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Поделиться голосовой активностью со всеми друзьями?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Прекратить делиться голосовой активностью со всеми друзьями?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Вы собираетесь начать делиться своей голосовой активностью со всеми друзьями, включая тех, кто появится в будущем. Им будет отправлено уведомление, и это можно будет изменить только через 24 часа.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Вы собираетесь прекратить делиться своей голосовой активностью со всеми друзьями, включая тех, кто появится в будущем. Это отправит им всем уведомление, и изменить это снова можно будет только через 24 часа.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Да, поделиться со всеми друзьями';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm =>
      'Да, прекратить делиться';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Будет доступно через $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Настройки голосовой активности обновлены';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Не удалось обновить статус голосовой активности';

  @override
  String get privacyDashboardDataExportDesc =>
      'Создайте загружаемый архив данных своей учётной записи, включая сообщения и URL-адреса вложений. Большинству пользователей нужно всё, но вы можете сузить область экспорта ниже.';

  @override
  String get privacyDashboardExportMyData => 'Экспорт моих данных';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Навсегда удалить отправленные вами сообщения в личных чатах, групповых чатах и сообществах. Процесс выполняется в фоновом режиме, и вы получите личное сообщение по его завершении.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Удалить мои сообщения';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Разрешить личные сообщения от участников сообщества?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Блокировать личные сообщения от участников сообщества?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Разрешить ботам отправлять вам личные сообщения?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Блокировать ботов от отправки вам личных сообщений?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Разрешить личные сообщения от участников ваших сообществ?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Вы также хотите заблокировать личные сообщения от участников ваших сообществ?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Разрешить ботам из ваших сообществ отправлять вам личные сообщения?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Вы также хотите заблокировать ботов из ваших текущих сообществ?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'Вы также можете изменить эту настройку для каждого сообщества, нажав и удерживая название сообщества и выбрав «Настройки конфиденциальности».';

  @override
  String get privacyDashboardDmConfirmAllowAll =>
      'Разрешить для всех сообществ';

  @override
  String get privacyDashboardDmConfirmBlockAll =>
      'Заблокировать во всех сообществах';

  @override
  String get privacyDashboardDmConfirmSkip => 'Пропустить';

  @override
  String get privacyDashboardDataRequestGoBack => 'Назад';

  @override
  String get privacyDashboardDataRequestExportTitle => 'Экспорт моих данных';

  @override
  String get privacyDashboardDataRequestDeleteTitle => 'Удалить мои сообщения';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'Мы обработаем запрос как можно скорее. Вы получите электронное письмо, когда ваш архив будет готов.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'Мы обработаем это как можно скорее. Вы получите от нас личное сообщение, когда всё будет готово.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'Что включить';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Всё';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Экспортировать все отправленные вами сообщения, а также все настройки вашей учётной записи, членства и метаданные.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'Выборочно';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Выберите типы бесед, сообщества и временной интервал для включения в архив.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Выберите, что включить';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Выберите, какие типы бесед нужно удалить.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Только места, к которым у меня больше нет доступа';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Удалить сообщения только из сообществ и групповых чатов, которые вы покинули или из которых вас удалили.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Какие беседы';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Выберите типы бесед, которые вы хотите включить.';

  @override
  String get privacyDashboardDataRequestKindDms => 'Открытые чаты';

  @override
  String get privacyDashboardDataRequestKindDmsClosed =>
      'Закрытые личные сообщения';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'Групповые чаты';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Сообщества';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Какие сообщества';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Фильтр сообществ';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Включить все, кроме выбранных';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude =>
      'Только выбранные';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'Вы пока не состоите ни в одном сообществе.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Период времени';

  @override
  String get privacyDashboardDataRequestDateMode => 'Период времени';

  @override
  String get privacyDashboardDataRequestAllTime => 'За всё время';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Выборочный диапазон';

  @override
  String get privacyDashboardDataRequestStartDate => 'Дата начала';

  @override
  String get privacyDashboardDataRequestEndDate => 'Дата окончания';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Оставьте одно из полей пустым, чтобы не ограничивать диапазон с этой стороны.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Выберите хотя бы один тип переписки для включения.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'Дата начала должна быть раньше даты окончания.';

  @override
  String get privacyDashboardDataRequestConfirmTitle =>
      'Проверьте и подтвердите';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'Мы создадим загружаемый архив всех сообщений, которые вы когда-либо отправляли, и отправим вам электронное письмо, когда он будет готов. Ссылка для скачивания в этом письме истекает через 7 дней.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'Мы создадим архив для скачивания, соответствующий указанным ниже фильтрам, и отправим вам электронное письмо, когда он будет готов. Ссылка для скачивания в этом письме истекает через 7 дней.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Безвозвратно удалить сообщения, соответствующие фильтрам ниже. Это действие нельзя отменить.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'После начала процесс нельзя будет отменить. Мы отправим вам личное сообщение, когда он завершится.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'Запросить экспорт';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Удалить сообщения';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Область поиска';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'Беседы';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Сообщества';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Период времени';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'Нет';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'С $start';
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
      other: '# сообществ',
      one: '# сообщества',
    );
    return 'Все, кроме $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# сообщества',
      many: '# сообществ',
      few: '# сообщества',
      one: '# сообщество',
    );
    return 'Только $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Открытые личные сообщения';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Закрытые личные сообщения';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Личные сообщения (открытые и закрытые)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'Групповые чаты';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Сообщества';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# часа',
      many: '# часов',
      few: '# часа',
      one: '# час',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# минуты',
      many: '# минут',
      few: '# минуты',
      one: '# минута',
    );
    return '$_temp0 и $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# часа',
      many: '# часов',
      few: '# часа',
      one: '# час',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# минуты',
      many: '# минут',
      few: '# минуты',
      one: '# минута',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# секунд',
      many: '# секунд',
      few: '# секунды',
      one: '# секунда',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed =>
      'Не удалось загрузить настройки конфиденциальности';

  @override
  String get privacyDashboardRetry => 'Повторить';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Не удалось сохранить настройки конфиденциального контента.';

  @override
  String get privacyDashboardDataRequestFailed =>
      'Не удалось выполнить запрос.';

  @override
  String get chatMessageDeleteFailed => 'Не удалось удалить сообщение';

  @override
  String get chatMessageAddReaction => 'Добавить реакцию';

  @override
  String get chatMessageEdit => 'Редактировать сообщение';

  @override
  String get chatMessageReply => 'Ответить';

  @override
  String get chatMessageForward => 'Переслать';

  @override
  String get forwardMessageTitle => 'Переслать сообщение';

  @override
  String get forwardSearchHint => 'Поиск каналов или ЛС';

  @override
  String get forwardDirectMessagesSection => 'Личные сообщения';

  @override
  String get forwardCommentHint => 'Добавить комментарий (необязательно)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Отправить ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Каналы не найдены';

  @override
  String get forwardSuccessToast => 'Сообщение переслано';

  @override
  String get forwardFailed => 'Не удалось переслать сообщение';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Комментарии недоступны, так как в выбранном канале включен медленный режим.';

  @override
  String get forwardSendSlowmodeBlocked =>
      'Ожидание окончания медленного режима в одном или нескольких выбранных каналах.';

  @override
  String get slowmodeRateLimitedTitle => 'Медленный режим включен';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'Медленный режим включен — подождите $duration, прежде чем отправить следующее сообщение.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'Прямая загрузка отключена во время медленного режима.';

  @override
  String get shareMediaTitle => 'Поделиться';

  @override
  String get shareMediaMessageHint => 'Добавьте сообщение (необязательно)…';

  @override
  String get shareMediaSendButton => 'Отправить';

  @override
  String get shareMediaSuccessToast => 'Медиа отправлено';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'Отправлено в $count чатов';
  }

  @override
  String get shareMediaFailedToast => 'Не удалось поделиться медиафайлом';

  @override
  String get forwardDestinationNoSendPermission =>
      'Вы не можете отправлять сообщения здесь';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Вы не можете вставлять ссылки здесь';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Вы не можете прикреплять файлы здесь';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Отправка сообщений отключена в этом сообществе';

  @override
  String get forwardDestinationTimedOut =>
      'Вы временно отключены в этом сообществе';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Медленный режим — подождите $remaining';
  }

  @override
  String get chatMessageCopyText => 'Копировать сообщение';

  @override
  String get chatMessageCopyEmbedText => 'Скопировать текст вложения';

  @override
  String get chatMessageTranslate => 'Перевести';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Переведено с $language';
  }

  @override
  String get chatMessageSeeOriginal => 'Посмотреть оригинал';

  @override
  String get chatMessageSeeTranslation => 'Посмотреть перевод';

  @override
  String get chatMessageTranslating => 'Перевод…';

  @override
  String get chatMessageTranslateFailed =>
      'Не удалось перевести это сообщение.';

  @override
  String get chatMessageTranslateUnavailable =>
      'Перевод недоступен на этом устройстве.';

  @override
  String get chatMessageSpeak => 'Озвучить сообщение';

  @override
  String get chatMessageStopSpeaking => 'Остановить речь';

  @override
  String get chatMessagePin => 'Закрепить сообщение';

  @override
  String get chatMessageUnpin => 'Открепить сообщение';

  @override
  String get chatMessageUnpinIt => 'Открепить';

  @override
  String get chatMessageBookmark => 'Добавить в закладки';

  @override
  String get chatMessageRemoveBookmark => 'Удалить из закладок';

  @override
  String get chatMessageMarkAsUnread => 'Отметить как непрочитанное';

  @override
  String get chatMessageCopyMessageLink => 'Копировать ссылку на сообщение';

  @override
  String get chatMessageOpenLink => 'Открыть ссылку';

  @override
  String get chatMessageCopyLink => 'Копировать ссылку';

  @override
  String get chatMessageCopyMessageId => 'Копировать ID сообщения';

  @override
  String get chatMessageViewReactions => 'Посмотреть реакции';

  @override
  String get chatMessageRemoveAllReactions => 'Удалить все реакции';

  @override
  String get chatMessageDebug => 'Отладка сообщения';

  @override
  String get chatMessageDebugSheetTitle => 'Отладка сообщения';

  @override
  String get chatMessageDebugCopyJson => 'Копировать JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'JSON сообщения скопирован в буфер обмена';

  @override
  String get chatReactionsSheetTitle => 'Реакции';

  @override
  String get chatReactionsSheetEmpty => 'Пока никто не отреагировал.';

  @override
  String get chatReactionAddFailed => 'Не удалось добавить реакцию';

  @override
  String get chatReactionRemoveFailed => 'Не удалось удалить реакцию';

  @override
  String get chatMessageReport => 'Пожаловаться на сообщение';

  @override
  String get iarReportMessageTitle => 'Пожаловаться на сообщение';

  @override
  String get iarThisUserFallback => 'этого пользователя';

  @override
  String get iarModalDescription =>
      'Сообщить о нарушении правил или найти инструменты для управления контактами и настройками.';

  @override
  String get iarPathStepAriaLabel => 'Что вам нужно?';

  @override
  String get iarCategoryStepTitle => 'Какое правило было нарушено?';

  @override
  String get iarReasonStepTitle => 'Какое правило было нарушено?';

  @override
  String get iarReasonSelectHint => 'Выберите причину';

  @override
  String get iarPickAnOptionToast => 'Выберите вариант, чтобы продолжить.';

  @override
  String get iarPickARuleToast => 'Выберите нарушенное правило.';

  @override
  String get iarPathPlatform => 'Сообщить о нарушении правил платформы';

  @override
  String get iarPathCommunity => 'Сообщить модераторам этого сообщества';

  @override
  String get iarPathPreferenceMessage => 'Мне не нравится этот контент';

  @override
  String get iarCategoryTargetedHarmLabel => 'Угрозы, преследование или вред';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Буллинг, угрозы, разжигание ненависти, насилие, рейды или контент, подталкивающий к самоповреждению.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Безопасность детей или материалы для взрослых';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Дети в опасности, материалы для взрослых не по назначению или нежелательное поведение.';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'Конфиденциальность или выдача себя за другое лицо';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Разглашение личной информации, преследование, выдача себя за другого или неуместный профиль.';

  @override
  String get iarCategoryDeceptionLabel =>
      'Мошенничество, вредоносное ПО или дезинформация';

  @override
  String get iarCategoryDeceptionDescription =>
      'Фишинг, мошенничество, вредоносные ссылки или ложные заявления, которые могут причинить реальный вред.';

  @override
  String get iarCategoryIllegalOtherLabel =>
      'Незаконная деятельность или что-то еще';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Незаконные продажи, содействие преступной деятельности или явное нарушение правил, не подходящее под другие категории.';

  @override
  String get iarReasonHarassmentLabel => 'Преследование или угрозы';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Буллинг, навязчивые сообщения, преследование или целенаправленные оскорбления.';

  @override
  String get iarReasonHateLabel => 'Разжигание ненависти';

  @override
  String get iarReasonHateMessageDescription =>
      'Оскорбления, дегуманизирующий язык или нападки на защищенные группы.';

  @override
  String get iarReasonViolenceLabel => 'Насилие или угрозы насилия';

  @override
  String get iarReasonViolenceDescription =>
      'Реальные угрозы, графическое насилие или прославление насилия.';

  @override
  String get iarReasonMatureContentLabel =>
      'Материалы для взрослых или преследование';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Нежелательное поведение или материалы для взрослых не по назначению.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Безопасность детей или эксплуатация несовершеннолетних';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Контент, связанный с грумингом или эксплуатацией детей.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Вредная дезинформация';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Ложные заявления, которые могут причинить реальный вред.';

  @override
  String get iarReasonSpamLabel => 'Спам, мошенничество или фишинг';

  @override
  String get iarReasonSpamMessageDescription =>
      'Массовый спам, мошенничество, фальшивые розыгрыши или злоупотребление аккаунтом.';

  @override
  String get iarReasonMalwareLabel => 'Вредоносное ПО или опасные ссылки';

  @override
  String get iarReasonMalwareDescription =>
      'Вредоносное ПО, кража учетных данных или вредоносные файлы.';

  @override
  String get iarReasonPrivacyLabel => 'Нарушение конфиденциальности';

  @override
  String get iarReasonPrivacyDescription =>
      'Разглашение личной информации, раскрытие конфиденциальных данных или преследование.';

  @override
  String get iarReasonImpersonationLabel =>
      'Выдача себя за другое лицо или обманчивые медиа';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Выдача себя за другого человека, включая обманчивый контент, сгенерированный ИИ.';

  @override
  String get iarReasonIllegalLabel => 'Незаконная деятельность';

  @override
  String get iarReasonIllegalDescription =>
      'Незаконные продажи, содействие преступной деятельности или противоправные действия.';

  @override
  String get iarReasonSelfHarmLabel => 'Самоповреждение или суицид';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Пропаганда или инструкции, поощряющие самоповреждение или расстройства пищевого поведения.';

  @override
  String get iarReasonOtherLabel => 'Другое явное нарушение правил';

  @override
  String iarReasonOtherDescription(String productName) {
    return 'Используйте только в том случае, если это явно нарушает правила $productName и не подходит под другие категории.';
  }

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Если вовлечен несовершеннолетний, вместо этого используйте «$childSafetyReason».';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Если это связано с CSAM или эксплуатацией несовершеннолетнего, отправьте это немедленно и не делитесь материалами повторно.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Если кто-то находится в непосредственной опасности, свяжитесь с местными экстренными службами, если это безопасно для вас.';

  @override
  String get iarSafetyNoteViolence =>
      'Если это реальная неминуемая угроза, также свяжитесь с местными экстренными службами.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Если это неминуемая террористическая угроза, также свяжитесь с местными экстренными службами.';

  @override
  String get iarActionBlockUserTitle => 'Заблокировать этого пользователя';

  @override
  String get iarActionBlockUserDescription =>
      'Прекратить получение сообщений и запросов в друзья.';

  @override
  String get iarActionBlockUserButton => 'Заблокировать';

  @override
  String get iarActionCopyMessageLinkTitle => 'Скопировать ссылку на сообщение';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Поделиться с модераторами сообщества.';

  @override
  String get iarActionCopyMessageLinkButton => 'Копировать';

  @override
  String get iarActionCloseDmTitle => 'Закрыть этот личный чат';

  @override
  String get iarActionCloseDmDescription =>
      'Не блокирует. Можно открыть снова позже.';

  @override
  String get iarActionCloseDmButton => 'Закрыть ЛС';

  @override
  String get iarActionLeaveCommunityTitle => 'Покинуть сообщество';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Перестать видеть его контент и участников.';

  @override
  String get iarActionLeaveCommunityButton => 'Покинуть';

  @override
  String get iarActionDmSettingsTitle => 'Настройки ЛС и запросов в друзья';

  @override
  String get iarActionDmSettingsDescription =>
      'Изменить, кто может с вами связываться.';

  @override
  String get iarActionCallSettingsTitle =>
      'Настройки звонков и групповых чатов';

  @override
  String get iarActionCallSettingsDescription =>
      'Изменить, кто может вам звонить или добавлять вас.';

  @override
  String get iarActionOpenButton => 'Открыть';

  @override
  String get iarActionDeleteMessageTitle => 'Удалить это сообщение';

  @override
  String get iarActionDeleteMessageDescription =>
      'Удалить его из канала для всех.';

  @override
  String get iarActionDeleteMessageButton => 'Удалить';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Удалено';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Это сообщение уже удалено.';

  @override
  String get iarActionBanUserTitle => 'Заблокировать этого пользователя';

  @override
  String get iarActionBanUserDescription =>
      'Открыть диалог блокировки для этого сообщества.';

  @override
  String get iarActionBanUserButton => 'Заблокировать';

  @override
  String get iarActionBanUserBannedButton => 'Заблокирован';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Этот пользователь уже заблокирован в сообществе.';

  @override
  String get iarCloseDmConfirmTitle => 'Закрыть ЛС';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Закрыть ваш текущий ЛС с $name. Это не заблокирует его; вы сможете открыть его позже.';
  }

  @override
  String get iarSuccessTitle => 'Жалоба отправлена';

  @override
  String get iarSuccessBody =>
      'Наша команда безопасности рассматривает ее. Мы отправим вам ЛС и email, как только примем решение.';

  @override
  String get iarAlreadyReportedTitle => 'Жалоба уже отправлена';

  @override
  String get iarAlreadyReportedBody =>
      'Вы уже отправляли жалобу на это сообщение. Наша команда безопасности рассматривает ее.';

  @override
  String get iarBackButton => 'Назад';

  @override
  String get iarContinueButton => 'Продолжить';

  @override
  String get iarSendReportButton => 'Отправить жалобу';

  @override
  String get iarDoneButton => 'Готово';

  @override
  String get iarCouldntSendToast =>
      'Не удалось отправить жалобу. Пожалуйста, попробуйте еще раз.';

  @override
  String get iarRateLimitedToast =>
      'Вы отправляете жалобы слишком часто. Пожалуйста, подождите немного и попробуйте снова.';

  @override
  String get iarReportSentToast =>
      'Жалоба отправлена. Наша команда безопасности рассмотрит ее.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Заблокировать $name? Он не сможет писать вам или отправлять запросы в друзья. Вы сможете разблокировать его позже.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Не удалось заблокировать этого пользователя. Пожалуйста, попробуйте еще раз.';

  @override
  String get iarCloseDmSuccessToast => 'ЛС закрыто.';

  @override
  String get iarCloseDmFailedToast =>
      'Не удалось закрыть это ЛС. Пожалуйста, попробуйте еще раз.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Не удалось покинуть это сообщество. Пожалуйста, попробуйте еще раз.';

  @override
  String get chatMessageSuppressEmbeds => 'Подавить встраивания';

  @override
  String get chatMessageUnsuppressEmbeds => 'Восстановить встраивания';

  @override
  String get chatMessageDelete => 'Удалить сообщение';

  @override
  String get chatMessageDeleteConfirmTitle => 'Удалить сообщение';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Вы уверены, что хотите удалить это сообщение?';

  @override
  String get chatMessageDeleteAttachment => 'Удалить вложение';

  @override
  String get chatMessageEditAttachmentAltText =>
      'Редактировать альтернативный текст';

  @override
  String get chatMessageMore => 'Еще';

  @override
  String get chatEditingMessage => 'Редактирование сообщения';

  @override
  String get chatReplyOriginalDeleted => 'Исходное сообщение было удалено';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Не удалось загрузить исходное сообщение';

  @override
  String get chatReplyAttachedMedia =>
      'Сообщение содержит вложенные медиафайлы';

  @override
  String chatBlockedMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count заблокированных сообщений',
      one: '1 заблокированное сообщение',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count потенциальных сообщений от спамеров',
      one: '1 потенциальное сообщение от спамера',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Ответ скрыт, так как исходный автор заблокирован.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Ответ скрыт, так как автор исходного сообщения помечен как спамер.';

  @override
  String get devMarkAsSpamLocally => 'Пометить как спам (только у меня)';

  @override
  String get devIgnoreSpamFlag => 'Игнорировать жалобу на спам';

  @override
  String get chatMessagesLoadError => 'Не удалось загрузить сообщения.';

  @override
  String get chatReplyMentionOverrideTitle =>
      'Переопределить настройку упоминания?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return 'Автор ($authorNickname) предпочитает получать @упоминания в ответах. Отправить без упоминания все равно?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname предпочитает ответы без упоминания @. Отправить с упоминанием в любом случае?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Игнорировать предпочтение';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Нажмите, чтобы отключить уведомление пользователя, которому вы отвечаете.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Нажмите, чтобы включить уведомление пользователя, которому вы отвечаете.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Упомянуть отвечающего пользователя';

  @override
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

  @override
  String get chatReplyCancel => 'Отменить ответ';

  @override
  String get chatEditMessageHint => 'Редактировать сообщение';

  @override
  String get chatEditNoChanges => 'Нет изменений для сохранения';

  @override
  String get chatChannelNotReady =>
      'Этот канал еще не готов. Попробуйте через мгновение.';

  @override
  String get chatMessageEdited => '(ред.)';

  @override
  String get chatMessageSilent => 'Это было @silent сообщение.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Сегодня в $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Вчера в $time';
  }

  @override
  String get mediaViewerImagePreview => 'Предпросмотр изображения';

  @override
  String get mediaViewerClose => 'Закрыть просмотр медиа';

  @override
  String get mediaViewerOpenInBrowser => 'Открыть в браузере';

  @override
  String get mediaViewerOptions => 'Параметры медиа';

  @override
  String get mediaViewerCopyLink => 'Копировать ссылку';

  @override
  String get mediaViewerForward => 'Переслать';

  @override
  String get mediaViewerZoomIn => 'Увеличить';

  @override
  String get mediaViewerZoomOut => 'Уменьшить';

  @override
  String get mediaViewerPreviousAttachment => 'Предыдущий вложение';

  @override
  String get mediaViewerNextAttachment => 'Следующий вложение';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String mediaViewerAttachmentThumbnail(int index) {
    return 'Вложение $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Закрыть';

  @override
  String get chatAttachmentVideoToggleControls =>
      'Показать/скрыть элементы управления видео';

  @override
  String get chatAttachmentVideoMute => 'Отключить звук видео';

  @override
  String get chatAttachmentVideoUnmute => 'Включить звук видео';

  @override
  String get chatAttachmentVideoPlay => 'Воспроизвести видео';

  @override
  String get chatAttachmentVideoPause => 'Приостановить видео';

  @override
  String get chatAttachmentVideoProgress => 'Прогресс видео';

  @override
  String get chatVideoPlaybackFailed => 'Не удалось воспроизвести это видео.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Уведомить пользователей с этой ролью, которые имеют разрешение на просмотр этого канала.';

  @override
  String get composerAutocompleteSuggestions => 'Предложения';

  @override
  String get composerAutocompleteCommandsHeading => 'Команды';

  @override
  String get composerAutocompleteChoicesHeading => 'Варианты';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'Необязательные аргументы';

  @override
  String get composerAutocompleteChannelsHeading => 'Каналы';

  @override
  String get composerAutocompleteMembersHeading => 'Участники';

  @override
  String get composerAutocompleteUsersHeading => 'Пользователи';

  @override
  String get composerAutocompleteMentionsHeading => 'Упоминания';

  @override
  String get composerAutocompleteRolesHeading => 'Роли';

  @override
  String get composerAutocompleteMediaHeading => 'Медиа';

  @override
  String get composerAutocompleteStickersHeading => 'Стикеры';

  @override
  String get composerAutocompleteGifsHeading => 'GIF-файлы';

  @override
  String get composerAutocompleteNoGifs => 'GIF не найдены';

  @override
  String get composerCommandShrugDescription =>
      'Добавляет ¯\\_(ツ)_/¯ к вашему сообщению.';

  @override
  String get composerCommandTableflipDescription =>
      'Добавляет (╯°□°)╯︵ ┻━┻ к вашему сообщению.';

  @override
  String get composerCommandUnflipDescription =>
      'Добавляет ┬─┬ ノ( ゜-゜ノ) к вашему сообщению.';

  @override
  String get composerCommandMeDescription =>
      'Отправить сообщение-действие (выделяется курсивом).';

  @override
  String get composerCommandSpoilerDescription =>
      'Отправить сообщение со спойлером (скрывает текст под спойлер).';

  @override
  String get composerCommandTtsDescription =>
      'Отправить сообщение с преобразованием текста в речь.';

  @override
  String get composerCommandNickDescription =>
      'Изменить свой ник в этом сообществе.';

  @override
  String get composerCommandKickDescription =>
      'Исключить участника из сообщества.';

  @override
  String get composerCommandBanDescription =>
      'Заблокировать участника в этом сообществе.';

  @override
  String get composerCommandMsgDescription =>
      'Отправить личное сообщение пользователю.';

  @override
  String get composerCommandSavedDescription =>
      'Отправить сохраненный медиафайл.';

  @override
  String get composerCommandStickerDescription => 'Отправить стикер.';

  @override
  String get composerCommandGifDescription => 'Найти и отправить GIF.';

  @override
  String get composerCommandMemberOption => 'Участник, которого нужно выбрать.';

  @override
  String get composerCommandReasonOption => 'Причина (необязательно).';

  @override
  String get composerCommandMessageOption => 'Сообщение для отправки.';

  @override
  String get composerCommandQueryOption => 'Что искать.';

  @override
  String get composerCommandNicknameOption =>
      'Ваш новый никнейм или оставьте пустым, чтобы сбросить его.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'Сколько последних сообщений пользователя удалить.';

  @override
  String get composerCommandDeleteMessagesNone => 'Не удалять';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Предыдущие $count дней';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'За последние 24 часа';

  @override
  String get composerCommandOptionRequired =>
      'Это поле обязательно. Пожалуйста, укажите значение.';

  @override
  String get composerCommandClear => 'Очистить команду';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'Вы изменили свой ник в этом сообществе с **$previousNickname** на **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'Неизвестный пользователь';

  @override
  String composerCommandMsgFailed(String username) {
    return 'Не удалось отправить сообщение **$username**. Возможно, у него отключены личные сообщения или вы заблокированы.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count ещё';
  }

  @override
  String get addGuildModalTitle => 'Добавить сообщество';

  @override
  String get addGuildModalLandingDescription =>
      'Создайте новое сообщество или присоединитесь к существующему.';

  @override
  String get addGuildCreateCommunity => 'Создать сообщество';

  @override
  String get addGuildJoinCommunity => 'Присоединиться к сообществу';

  @override
  String get addGuildImportDiscordTemplate => 'Импортировать шаблон Discord';

  @override
  String get addGuildJoinTitle => 'Присоединиться к сообществу';

  @override
  String get addGuildJoinDescription =>
      'Введите ссылку-приглашение, чтобы присоединиться к сообществу.';

  @override
  String get addGuildInviteLinkLabel => 'Ссылка-приглашение';

  @override
  String get addGuildJoinSubmit => 'Присоединиться к сообществу';

  @override
  String get addGuildInviteInvalid =>
      'Это приглашение недействительно или срок его действия истек.';

  @override
  String get addGuildJoinFailed =>
      'Не удалось присоединиться к сообществу. Пожалуйста, попробуйте еще раз.';

  @override
  String get addGuildCreateTitle => 'Создать сообщество';

  @override
  String get addGuildCreateDescription =>
      'Создайте сообщество для общения с друзьями.';

  @override
  String get addGuildCreateNameLabel => 'Название сообщества';

  @override
  String get addGuildCreateSubmit => 'Создать сообщество';

  @override
  String get addGuildCreateFailed =>
      'Не удалось создать сообщество. Попробуйте ещё раз.';

  @override
  String get addGuildCreateClaimTitle => 'Заберите свой аккаунт';

  @override
  String get addGuildCreateClaimDescription =>
      'Чтобы создать сообщество, нужно сначала подтвердить аккаунт.';

  @override
  String get addGuildCreateVerifyTitle => 'Подтвердите почту';

  @override
  String get addGuildCreateVerifyDescription =>
      'Чтобы создать сообщество, подтвердите адрес электронной почты.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'При создании нового сообщества нельзя использовать анимированные значки. Используйте статичное изображение.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'Создавая сообщество, вы соглашаетесь соблюдать и поддерживать ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return 'Правила сообщества $productName';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'На этом сервере может быть только одно сообщество, поэтому дополнительные сообщества создать нельзя.';

  @override
  String get addGuildCreateChangeIcon => 'Изменить значок';

  @override
  String get addGuildCreateIconLabel => 'Значок сообщества';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Макс. 10 МБ. Рекомендуется: 512×512 пикс.';

  @override
  String get addGuildImportDescription =>
      'Вставьте URL-адрес шаблона Discord, чтобы импортировать его структуру в новое сообщество.';

  @override
  String get addGuildImportUrlLabel => 'URL шаблона';

  @override
  String get addGuildImportUrlInvalid =>
      'Введите действительный URL-адрес или код шаблона Discord.';

  @override
  String get addGuildImportFetchFailed =>
      'Не удалось получить шаблон сообщества. Шаблон может не существовать или внешний сервис недоступен.';

  @override
  String get addGuildImportInvalidResponse =>
      'Это не похоже на допустимый ответ шаблона.';

  @override
  String get addGuildImportTemplateLabel => 'Шаблон';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount текстовых, $voiceChannelCount голосовых, $categoryCount категорий, $roleCount ролей';
  }

  @override
  String get addGuildImportRemoveIcon => 'Удалить значок';

  @override
  String get addGuildImportTemplateInvalid =>
      'Данные шаблона сообщества недействительны или повреждены.';

  @override
  String get addGuildPackInstalled => 'Пакет успешно установлен.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle => 'Удалить все реакции';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Вы уверены, что хотите удалить все реакции из этого сообщения?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Открепить сообщение';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Отправить это закрепление в прошлое?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username закрепил $messageLink в этом канале. См. $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'сообщение';

  @override
  String get systemPinMessageAllPinsLink => 'все закрепленные сообщения';

  @override
  String get channelPinsEmptyTitle => 'Нет закрепленных сообщений';

  @override
  String get channelPinsEmptyDescription =>
      'Здесь будут отображаться закрепленные сообщения.';

  @override
  String get channelDetailsFallbackTitle => 'Подробности';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'Групповой чат · $count участника';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'Закрыть беседу с $name?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'Уйти из $name?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Настройки канала';

  @override
  String get channelDetailsGroupSettingsTitle => 'Настройки группы';

  @override
  String get channelDetailsDmSettingsTitle => 'Настройки личных сообщений';

  @override
  String get channelDetailsInvitePeople => 'Пригласить людей';

  @override
  String get channelDetailsCopyLink => 'Скопировать ссылку';

  @override
  String get channelMenuCopyChannelLink => 'Скопировать ссылку на канал';

  @override
  String get channelMenuCopyRedirectLink =>
      'Копировать ссылку для переадресации';

  @override
  String get channelDetailsAddFriendsToGroup => 'Добавить друзей в группу';

  @override
  String get channelDetailsGroupInvites => 'Приглашения в группу';

  @override
  String get channelDetailsEditChannel => 'Изменить канал';

  @override
  String get channelDetailsDeleteChannel => 'Удалить канал';

  @override
  String get channelSettingsCategorySettingsTitle => 'Настройки категории';

  @override
  String get channelSettingsEditCategory => 'Изменить категорию';

  @override
  String get channelSettingsTabOverview => 'Обзор';

  @override
  String get channelSettingsTabPermissions => 'Разрешения';

  @override
  String get channelSettingsTabInvites => 'Приглашения';

  @override
  String get channelSettingsTabWebhooks => 'Вебхуки';

  @override
  String get channelSettingsDeleteChannel => 'Удалить канал';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'Вы уверены, что хотите удалить $channelName? Это действие нельзя будет отменить.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'Вы уверены, что хотите удалить $categoryName? Это действие нельзя будет отменить.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Удалить категорию';

  @override
  String get channelSettingsChannelUpdated => 'Канал обновлен';

  @override
  String get channelSettingsChannelName => 'Название канала';

  @override
  String get channelSettingsCategoryName => 'Название категории';

  @override
  String get channelSettingsMyCategory => 'Моя категория';

  @override
  String get categoryExpandCategory => 'Развернуть категорию';

  @override
  String get categoryCollapseCategory => 'Свернуть категорию';

  @override
  String get categoryExpandAllCategories => 'Развернуть все категории';

  @override
  String get categoryCollapseAllCategories => 'Свернуть все категории';

  @override
  String get categoryMuteCategory => 'Отключить уведомления категории';

  @override
  String get categoryUnmuteCategory => 'Включить уведомления';

  @override
  String get categoryCopyCategoryId => 'Скопировать ID категории';

  @override
  String get categoryIdCopied => 'ID категории скопирован';

  @override
  String get channelSettingsChannelNamePlaceholder => 'Общие';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'Тема';

  @override
  String get channelSettingsTopicPlaceholder => 'Добавить тему в этот канал';

  @override
  String get channelSettingsInsertEmoji => 'Вставить эмодзи';

  @override
  String get channelSettingsTopicTooLongTitle => 'Тема канала слишком длинная.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'Сократите тему и попробуйте снова.';

  @override
  String get channelSettingsSlowmode => 'Медленный режим';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Интервал между сообщениями. Пользователь с правами \"$bypassSlowmodePermissionLabel\" может его обойти.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Выкл';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds секунд';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes мин';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours часа';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute минута';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour час';
  }

  @override
  String get channelSettingsVoiceQuality => 'Качество голоса';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'Более высокий битрейт = лучшее качество и большее использование трафика.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits Кбит/с';
  }

  @override
  String get channelSettingsParticipantLimit => 'Лимит участников';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Максимальное количество участников, которые могут присоединиться одновременно. 0 означает без ограничений.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count участников',
      one: '1 участник',
      zero: '∞ Без ограничений',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Лимит подключений';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Максимальное количество активных подключений, которое один участник может поддерживать в этом канале.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count подключений',
      one: '1 подключение',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Регион для голосовых чатов';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Выберите голосовой регион для этого канала. Автоматический режим использует ближайший регион.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Автоматически';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'Не удалось загрузить голосовые регионы';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Повторите попытку позже.';

  @override
  String get channelSettingsResetSlider =>
      'Сбросить ползунок до значения по умолчанию';

  @override
  String get channelSettingsAdvanced => 'Расширенные';

  @override
  String get channelSettingsMatureContentOverride =>
      'Переопределение возрастного ограничения';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Переопределить настройку уровня $scopeLevel для этого канала. Контент для взрослых будет отображаться за экраном перед входом.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Наследовать';

  @override
  String get channelSettingsMatureContentOn => 'Вкл';

  @override
  String get channelSettingsMatureContentOff => 'Выкл';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Помечает этот канал как содержащий материалы для взрослых.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Оставить этот канал открытым для материалов для взрослых.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Унаследовано от $inheritedSourceLabel: включено';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Наследуется от $inheritedSourceLabel: выкл.';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'Категория';

  @override
  String get channelSettingsMatureContentCommunitySource => 'сообщество';

  @override
  String get channelSettingsMatureContentCategoryScope => 'Категория';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Сообщество';

  @override
  String get channelSettingsContentWarningToggle =>
      'Показывать предупреждение о контенте в этом канале';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Включает запрос согласия перед входом в этот канал.';

  @override
  String get channelSettingsContentWarningText =>
      'Пользовательский текст предупреждения';

  @override
  String get channelSettingsContentWarningDefault =>
      'Содержит конфиденциальный контент.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'Чтобы изменить эти разрешения, вам нужно разрешение \"$manageChannelsPermissionLabel\".';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'Вам нужно разрешение \"$manageRolesPermissionLabel\", чтобы редактировать эти настройки.';
  }

  @override
  String get channelSettingsUnknownRole => 'Неизвестная роль';

  @override
  String get channelSettingsUnknownUser => 'Неизвестный пользователь';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides =>
      'Переопределения доступа';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Изменить доступ для $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'Назад к переопределениям';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Настроить базовый доступ для этого канала';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Настроить переопределения для этой роли';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Настроить индивидуальные разрешения для этого участника';

  @override
  String get channelSettingsPermissionsSearchPlaceholder => 'Поиск разрешений…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Доступ к каналу обновлен';

  @override
  String get channelSettingsPermissionsTitle => 'Управление доступом';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'Этот канал синхронизирован с родительской категорией ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'Этот канал не синхронизирован с родительской категорией ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory =>
      'Синхронизировать с категорией';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'Канал синхронизирован с родительской категорией';

  @override
  String get channelSettingsPermissionsAddOverride => 'Добавить исключение';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Поиск ролей или участников…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => 'Роли и участники';

  @override
  String get channelSettingsDeleteInvite => 'Удалить приглашение';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Удалить это приглашение? Действие нельзя отменить.';

  @override
  String get channelSettingsCopyInviteCode => 'Скопировать код приглашения';

  @override
  String get channelSettingsCopyInviteUrl => 'Скопировать ссылку-приглашение';

  @override
  String get channelSettingsWebhookCreated => 'Вебхук создан';

  @override
  String get channelSettingsWebhookCreateFailed => 'Не удалось создать вебхук';

  @override
  String get channelSettingsCreateWebhook => 'Создать вебхук';

  @override
  String get channelSettingsInvitesDescription =>
      'Управляйте ссылками-приглашениями для этого канала.';

  @override
  String get channelSettingsInvitesCreate => 'Создать приглашение';

  @override
  String get channelSettingsInvitesEmpty => 'Нет ссылок-приглашений';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'В этом канале пока нет ссылок-приглашений. Создайте ссылку, чтобы пригласить людей в этот канал.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Произошла ошибка при загрузке ссылок-приглашений для этого канала. Повторите попытку.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Управляйте входящими вебхуками, которые могут публиковать сообщения в этот канал.';

  @override
  String get channelSettingsWebhooksEmpty => 'Вебхуков нет';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'Для этого канала не настроены вебхуки. Создайте вебхук, чтобы внешние приложения могли публиковать сообщения.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Этот канал не поддерживает веб-хуки.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'Чтобы просматривать и редактировать веб-хуки для этого канала, вам нужно разрешение \"$permission\".';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'Не удалось загрузить вебхуки';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Произошла ошибка при загрузке веб-хуков для этого канала. Повторите попытку.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Создано $creator $date';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'Неизвестный пользователь';

  @override
  String get channelSettingsWebhooksAvatar => 'Аватар';

  @override
  String get channelSettingsWebhooksUploadImage => 'Загрузить изображение';

  @override
  String get channelSettingsWebhooksRemove => 'Удалить';

  @override
  String get channelSettingsWebhooksName => 'Название';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Название вебхука';

  @override
  String get channelSettingsWebhooksChannel => 'Канал';

  @override
  String get channelSettingsWebhooksUrl => 'URL вебхука';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Скопировать URL вебхука';

  @override
  String get channelSettingsWebhooksDelete => 'Удалить вебхук';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'Не удалось удалить этот вебхук';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'Удалить этот вебхук? Отменить действие нельзя.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Повторите попытку позже.';

  @override
  String get channelMenuOpenChat => 'Открыть чат';

  @override
  String get channelMenuDuplicateChannel => 'Дублировать канал';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Сбросить статус согласия на просмотр контента для взрослых';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Удалить ваши сообщения в этом канале?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Это навсегда удалит все сообщения, которые вы когда-либо отправляли в этом канале. Это действие невозможно отменить.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Удалить мои сообщения';

  @override
  String get channelMenuDeletedYourMessages => 'Ваши сообщения удалены';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'Не удалось удалить ваши сообщения';

  @override
  String get channelDetailsSystemMessage => 'Системное сообщение';

  @override
  String get channelDetailsTextChannel => 'Текстовый канал';

  @override
  String get channelDetailsVoiceChannel => 'Голосовой канал';

  @override
  String get channelDetailsCategory => 'Категория';

  @override
  String get channelDetailsLinkChannel => 'Привязать канал';

  @override
  String get channelDetailsGenericChannel => 'Канал';

  @override
  String get channelDetailsMutedConversation => 'Беседа заглушена';

  @override
  String get channelDetailsUnmutedConversation => 'Беседа снова включена';

  @override
  String get channelDetailsMutedChannel => 'Канал заглушен';

  @override
  String get channelDetailsUnmutedChannel => 'Канал снова доступен';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Настройки уведомлений обновлены';

  @override
  String get channelDetailsTabMembers => 'Участники';

  @override
  String get channelDetailsTabPins => 'Закрепленные';

  @override
  String get channelDetailsActionMute => 'Выключить уведомления';

  @override
  String get channelDetailsActionUnmute => 'Включить уведомления';

  @override
  String get channelDetailsActionSearch => 'Поиск';

  @override
  String get channelDetailsActionMore => 'Ещё';

  @override
  String get channelDetailsMembersEmptyTitle => 'Нет участников';

  @override
  String get channelDetailsMembersEmptyBody =>
      'Участники появятся здесь после загрузки данных сообщества.';

  @override
  String get memberListPermissionDeniedTitle =>
      'Вы не можете просматривать участников';

  @override
  String get memberListPermissionDeniedBody =>
      'Вы не можете просматривать участников этого канала в этом сообществе';

  @override
  String get memberListUnavailableTitle => 'Список участников недоступен';

  @override
  String get memberListUnavailableBody =>
      'Списки участников временно недоступны в этом сообществе';

  @override
  String get channelDetailsPinsLoadFailedTitle =>
      'Не удалось загрузить закреплённые сообщения';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'Участники с разрешением «Закреплять сообщения» могут закреплять сообщения, чтобы их видели все.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'Вы можете закреплять сообщения в этом чате, чтобы их видели все.';

  @override
  String get channelDetailsPinsEndReached => 'Вы достигли конца';

  @override
  String get channelHeaderOpenDetails => 'Открыть сведения о канале';

  @override
  String get channelHeaderPinnedMessages => 'Закрепленные сообщения';

  @override
  String get channelHeaderPinnedMessagesUnread =>
      'Непрочитанные закрепленные сообщения';

  @override
  String get channelHeaderMemberList => 'Список участников';

  @override
  String get channelHeaderInbox => 'Входящие';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Настройки уведомлений, отключено';

  @override
  String get channelDetailsSearchTitle => 'Поиск';

  @override
  String get channelDetailsSearchHint => 'Поиск сообщений';

  @override
  String get channelDetailsSearchFilterFrom => 'От кого';

  @override
  String get channelDetailsSearchFilterHas => 'Есть';

  @override
  String get channelDetailsSearchFilterIn => 'В канале';

  @override
  String get channelDetailsSearchFilterMentions => 'Упоминания';

  @override
  String get channelDetailsSearchFilterMore => 'Ещё';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Активна';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count канала';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count пользователя';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'Пользователь';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Бот';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Вебхук';

  @override
  String get channelDetailsSearchFilterByChannel => 'Фильтровать по каналу';

  @override
  String get channelDetailsSearchChannelsHint => 'Поиск каналов';

  @override
  String get channelDetailsSearchChannelsEmpty => 'Каналы не найдены';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Закрепленные';

  @override
  String get channelDetailsSearchPinnedTrue => 'Только закреплённые';

  @override
  String get channelDetailsSearchPinnedFalse => 'Исключить закрепленные';

  @override
  String get channelDetailsSearchClearFilter => 'Очистить';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Тип автора';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Дата';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Режим даты';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Выберите дату';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Ссылка на хост';

  @override
  String get channelDetailsSearchMoreFiltersFileName => 'Имя файла содержит';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'Расширение файла';

  @override
  String get channelDetailsSearchContentPoll => 'Опрос';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'Сообщения с опросом';

  @override
  String get channelDetailsSearchContentForward => 'Переслать';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Пересланные сообщения';

  @override
  String get channelDetailsSearchFilterSort => 'Сортировать';

  @override
  String get channelHeaderSearchFiltersTitle => 'Фильтры поиска';

  @override
  String get channelHeaderSearchRecentTitle => 'Недавние запросы';

  @override
  String get channelHeaderSearchUsersTitle => 'Пользователи';

  @override
  String get channelHeaderSearchChannelsTitle => 'Каналы';

  @override
  String get channelHeaderSearchValuesTitle => 'Значения';

  @override
  String get channelHeaderSearchDatesTitle => 'Даты';

  @override
  String get channelHeaderSearchDefaultBadge => 'По умолчанию';

  @override
  String get channelHeaderSearchClearHistory => 'Очистить';

  @override
  String get channelHeaderSearchFilterDescFrom => 'пользователь';

  @override
  String get channelHeaderSearchFilterDescMentions => 'пользователь';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'ссылка, встраивание, изображение, видео, звук, файл, стикер, …';

  @override
  String get channelHeaderSearchFilterDescBefore => 'дата или диапазон дат';

  @override
  String get channelHeaderSearchFilterDescOn => 'дата или диапазон дат';

  @override
  String get channelHeaderSearchFilterDescDuring => 'дата или диапазон дат';

  @override
  String get channelHeaderSearchFilterDescAfter => 'дата или диапазон дат';

  @override
  String get channelHeaderSearchFilterDescIn => 'канал';

  @override
  String get channelHeaderSearchFilterDescPinned => 'да или нет';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'пользователь, бот или вебхук';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'имя узла, например example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'часть имени файла вложения';

  @override
  String get channelHeaderSearchFilterDescFileType =>
      'расширение файла, например png';

  @override
  String get channelHeaderSearchFilterDescSort => 'по дате или релевантности';

  @override
  String get channelHeaderSearchFilterDescOrder =>
      'по возрастанию или по убыванию';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString результата',
      one: '1 результат',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'Фильтровать по пользователю';

  @override
  String get channelDetailsSearchFilterByContent => 'Фильтр по контенту';

  @override
  String get channelDetailsSearchSortBy => 'Сортировать результаты по';

  @override
  String get channelDetailsSearchIn => 'Искать в';

  @override
  String get channelDetailsSearchEmptyTitle => 'Поиск по этому чату';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Введите текст, автора или фильтр контента, чтобы найти сообщения.';

  @override
  String get channelDetailsSearchIndexingTitle => 'Сообщения индексируются';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Попробуйте снова чуть позже, когда поиск закончит индексацию этой области.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Нет результатов';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Попробуйте другие поисковые запросы или фильтры.';

  @override
  String get channelDetailsMembersOnline => 'В сети';

  @override
  String get channelDetailsMembersOffline => 'Не в сети';

  @override
  String get channelDetailsMemberYou => 'Вы';

  @override
  String get channelDetailsSearchUsersHint => 'Поиск пользователей';

  @override
  String get channelDetailsSearchUsersTypeToSearch =>
      'Введите имя для поиска участников';

  @override
  String get channelDetailsSearchUsersEmpty => 'Пользователи не найдены';

  @override
  String get channelDetailsSearchUsersNoAvailable =>
      'Нет доступных пользователей';

  @override
  String get channelDetailsDone => 'Готово';

  @override
  String get channelDetailsHasFilterPrompt => 'Показать сообщения, содержащие:';

  @override
  String get channelDetailsRetry => 'Повторить';

  @override
  String get channelDetailsPinnedMessageTitle => 'Закрепленное сообщение';

  @override
  String get channelDetailsSearchResultTitle => 'Результат поиска';

  @override
  String get channelDetailsJumpToMessage => 'Перейти к сообщению';

  @override
  String get channelDetailsUnpinMessage => 'Открепить сообщение';

  @override
  String get channelDetailsCopyMessageLink => 'Скопировать ссылку на сообщение';

  @override
  String get channelDetailsCopyMessageId => 'Скопировать ID сообщения';

  @override
  String get channelDetailsMessageUnpinned => 'Сообщение откреплено';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Текущее сообщество';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'Текущий чат';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Все сообщества';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild => 'Все личные сообщения';

  @override
  String get channelDetailsSearchScopeAllDms => 'Все чаты';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild =>
      'Только личные сообщения';

  @override
  String get channelDetailsSearchScopeOpenDms => 'Открытые чаты';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Все личные сообщения и сообщества';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Открытые ЛС и сообщества';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Искать только в этом сообществе';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Искать только в этом чате';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'Во всех сообществах, в которых вы состоите';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Только во всех чатах, в которых вы когда-либо участвовали';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'Во всех чатах, в которых вы когда-либо участвовали';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'Во всех открытых личных сообщениях';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'Во всех открытых личных сообщениях';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'Во всех личных сообщениях и сообществах, в которых вы когда-либо участвовали';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'Во всех открытых личных сообщениях и сообществах, в которых вы состоите';

  @override
  String get channelDetailsSearchSortNewest => 'Сначала новые';

  @override
  String get channelDetailsSearchSortOldest => 'Сначала старые';

  @override
  String get channelDetailsSearchSortRelevance => 'Самые релевантные';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Сначала новые сообщения';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Сначала старые сообщения';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Сначала показывать самые релевантные сообщения';

  @override
  String get channelDetailsSearchContentImage => 'Загрузка изображения';

  @override
  String get channelDetailsSearchContentVideo => 'Загрузка видео';

  @override
  String get channelDetailsSearchContentAudio => 'Загрузка аудио';

  @override
  String get channelDetailsSearchContentFile => 'Загрузка файла';

  @override
  String get channelDetailsSearchContentLink => 'Ссылка';

  @override
  String get channelDetailsSearchContentEmbed =>
      'Предпросмотр ссылки или встраивание';

  @override
  String get channelDetailsSearchContentSticker => 'Стикер';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Только загруженные изображения';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Только загруженные видео';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Только загруженные аудиофайлы';

  @override
  String get channelDetailsSearchContentFileDescription => 'Любое вложение';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'URL в тексте сообщения';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Решенные предпросмотры и расширенные вложения, а не загрузки';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Стикер прикреплен к сообщению';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count типа';
  }

  @override
  String get personalNotesTitle => 'Личные заметки';

  @override
  String get personalNotesSubtitle =>
      'Ваше личное пространство для мыслей и напоминаний';

  @override
  String groupDmWelcome(String displayName) {
    return 'Добро пожаловать в $displayName. Добавляйте друзей, чтобы начать общение.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Изменить группу';

  @override
  String get groupDmWelcomeAddFriends => 'Добавить друзей в группу';

  @override
  String get dmGroupInvites => 'Приглашения';

  @override
  String get groupDmEditTitle => 'Изменить группу';

  @override
  String get groupDmEditDetailsTooltip => 'Изменить данные группы';

  @override
  String get groupDmGroupName => 'Название группы';

  @override
  String get groupDmMyGroup => 'Моя группа';

  @override
  String get groupDmGroupNameMaxLength =>
      'Название группы не может превышать 100 символов';

  @override
  String get groupDmGroupIcon => 'Значок группы';

  @override
  String get groupDmUploadIcon => 'Загрузить значок';

  @override
  String get groupDmChangeIcon => 'Изменить значок';

  @override
  String get groupDmRemoveIcon => 'Удалить значок';

  @override
  String get groupDmUpdated => 'Группа обновлена';

  @override
  String get groupDmUpdateFailed =>
      'Не удалось обновить группу. Попробуйте снова.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Анимированные значки не поддерживаются. Используйте статичное изображение.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Анимированные значки не поддерживаются';

  @override
  String get groupDmIconFileTooLargeTitle => 'Файл значка слишком большой';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'Файл значка слишком большой. Выберите файл размером меньше $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'Неподдерживаемый формат значка';

  @override
  String get groupDmUnsupportedIconFormatBody => 'Неподдерживаемый тип файла.';

  @override
  String get groupDmCouldntProcessImage => 'Не удалось обработать изображение';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'Не удалось обработать обрезанное изображение. Повторите попытку.';

  @override
  String get groupDmInvalidImage => 'Недопустимое изображение';

  @override
  String get groupDmInvalidImageBody =>
      'Это изображение недействительно. Попробуйте другое.';

  @override
  String get groupDmAddFriends => 'Добавить';

  @override
  String get groupDmOrSendInvite => 'или отправьте приглашение другу:';

  @override
  String get groupDmGenerateInviteLink => 'Сгенерировать ссылку-приглашение';

  @override
  String get groupDmCreateInvite => 'Создать';

  @override
  String get groupDmInviteExpires24Hours =>
      'Ваше приглашение истекает через 24 часа';

  @override
  String get groupDmAddFriendFailed =>
      'Не удалось добавить этого друга в группу. Повторите попытку.';

  @override
  String get groupDmAddFailed => 'Не удалось добавить в группу';

  @override
  String get groupDmGroupFull =>
      'Эта группа заполнена. Удалите кого-нибудь, прежде чем добавлять новых участников.';

  @override
  String get groupDmRateLimited =>
      'Вы слишком торопитесь. Подождите немного и попробуйте снова.';

  @override
  String get groupDmCreateInviteFailed =>
      'Не удалось создать ссылку-приглашение';

  @override
  String get groupDmCreateInviteFailedBody =>
      'Не удалось создать ссылку-приглашение. Повторите попытку.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'Не удалось создать ссылку-приглашение. Попробуйте ещё раз.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'У вас нет разрешения на создание приглашения в этом канале.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'Этот канал достиг лимита приглашений.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'Создание приглашений для этого сообщества временно отключено.';

  @override
  String get groupDmCopyInviteFailed =>
      'Не удалось скопировать ссылку-приглашение';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Управлять приглашениями может только владелец группы.';

  @override
  String get groupDmNoInvitesCreated => 'Приглашения не созданы';

  @override
  String get groupDmLoadingInvites => 'Загрузка приглашений...';

  @override
  String get groupDmInvitesLoadFailed =>
      'Не удалось загрузить приглашения. Повторите попытку.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Отозвать это приглашение? Действие необратимо.';

  @override
  String get groupDmInviteRevoked => 'Приглашение отозвано';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Создано $name. Истекает через $time.';
  }

  @override
  String channelWelcomeHeading(String channelName) {
    return 'Добро пожаловать в $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'В начале не было ничего. Затем появилось $channelName. И это было хорошо.';
  }

  @override
  String get personalNotesComposerHint => 'Напишите себе';

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
  String get composerOpenExpressionPicker => 'Открыть выбор эмодзи';

  @override
  String get composerShowKeyboard => 'Показать клавиатуру';

  @override
  String get composerCloseAttachmentPanel => 'Закрыть выбор вложений';

  @override
  String get chatAttachmentPanelPhotos => 'Фотографии';

  @override
  String get chatAttachmentPanelFiles => 'Файлы';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Требуется доступ к фотогалерее';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Разрешите доступ к фотогалерее, чтобы просматривать и прикреплять недавние фото и видео.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Открыть настройки';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', отправка';

  @override
  String get messageAccessibilityFailedSuffix => ', не удалось отправить';

  @override
  String get messageAccessibilityAttachmentSummary => 'вложение';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count вложения';
  }

  @override
  String get messageAccessibilityImageSummary => 'изображение';

  @override
  String get messageAccessibilityVideoSummary => 'видео';

  @override
  String get messageAccessibilityAudioSummary => 'аудиофайл';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'стикер $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'файл $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'вложение со спойлером';

  @override
  String get messageAccessibilityEmbedSummary => 'вложение';

  @override
  String get messageAccessibilityEmptySummary => 'сообщение';

  @override
  String get personalNotesPrivateSpace => 'Ваше личное пространство';

  @override
  String get purgePersonalNotes => 'Очистить личные заметки';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Это навсегда удалит каждое сообщение и вложение в ваших личных заметках. Это действие нельзя отменить.';

  @override
  String get purgePersonalNotesConfirmButton => 'Очистить';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Очищено $count сообщений из личных заметок';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty => 'Личные заметки уже были пусты';

  @override
  String get purgePersonalNotesFailed => 'Не удалось очистить личные заметки';

  @override
  String get userSettingsGroupYourAccount => 'ВАША УЧЕТНАЯ ЗАПИСЬ';

  @override
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => 'Поиск настроек…';

  @override
  String get userSettingsSearchFieldLabel => 'Настройки поиска';

  @override
  String get userSettingsSearchClear => 'Очистить поиск';

  @override
  String get userSettingsSearchNoResults => 'Настройки не найдены';

  @override
  String get userSettingsNavProfile => 'Профиль';

  @override
  String get userSettingsNavSecurityLogin => 'Безопасность и вход';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Подарки';

  @override
  String get giftSettingsClaimAccountTitle => 'Заберите свой аккаунт';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Заберите свою учетную запись, чтобы активировать или управлять подарочными кодами Plutonium.';

  @override
  String get giftSettingsRedeemTitle => 'Активировать подарок';

  @override
  String get giftSettingsRedeemDescription =>
      'Введите подарочный код, чтобы получить Plutonium для своей учетной записи.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Введите код подарка…';

  @override
  String get giftSettingsRedeemButton => 'Активировать';

  @override
  String get giftSettingsRedeemSuccess =>
      'Подарок успешно активирован. Наслаждайтесь вашим Plutonium.';

  @override
  String get giftSettingsPurchasedTitle => 'Купленные подарки';

  @override
  String get giftSettingsPurchasedDescription =>
      'Управляйте кодами подаренного Plutonium, которые вы приобрели. Поделитесь ссылкой на подарок с кем-то особенным или активируйте его для себя!';

  @override
  String get giftSettingsEmptyTitle => 'Подарков пока нет';

  @override
  String get giftSettingsEmptyDescription =>
      'Купите подарок Plutonium во вкладке Plutonium, чтобы поделиться с друзьями.';

  @override
  String get giftSettingsGoToPlutonium => 'Перейти в Plutonium';

  @override
  String get giftSettingsLoadFailedTitle =>
      'Не удалось загрузить инвентарь подарков';

  @override
  String get giftSettingsLoadFailedDescription => 'Повторите попытку позже.';

  @override
  String get giftSettingsTryAgain => 'Повторить';

  @override
  String get giftSettingsGiftUrl => 'Ссылка на подарок';

  @override
  String get giftSettingsCopy => 'Копировать';

  @override
  String get giftSettingsCopied => 'Скопировано';

  @override
  String get giftSettingsGiftUrlCopied => 'Ссылка на подарок скопирована!';

  @override
  String get giftSettingsGiftUrlCopyFailed =>
      'Не удалось скопировать URL подарка';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Куплено $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Получено $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Получено от $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'Этот подарок уже активирован';

  @override
  String get giftSettingsRedeemForYourself => 'Активировать для себя';

  @override
  String get giftSettingsShareWithFriend => 'Поделиться с другом';

  @override
  String get premiumPlutoniumTagline =>
      'Откройте более высокие лимиты и эксклюзивные функции, поддерживая независимую платформу для общения.';

  @override
  String get premiumPurchaseMode => 'Режим покупки';

  @override
  String get premiumForMe => 'Для меня';

  @override
  String get premiumAsAGift => 'В подарок';

  @override
  String get premiumMonthly => 'Ежемесячно';

  @override
  String get premiumYearly => 'За год';

  @override
  String get premiumPerMonth => 'в месяц';

  @override
  String get premiumPerYear => 'в год';

  @override
  String get premiumOneTimePurchase => 'единовременная покупка';

  @override
  String get premiumSave17 => 'Сэкономьте 17%';

  @override
  String get premiumUpgradeNow => 'Обновить сейчас';

  @override
  String get premiumBuyGift => 'Купить подарок';

  @override
  String get premiumOneYearGift => 'Подарок на 1 год';

  @override
  String get premiumOneMonthGift => 'Подарок на 1 месяц';

  @override
  String get premiumMostPopular => 'Самый популярный';

  @override
  String get premiumScrollPrompt =>
      'Прокрутите вниз, чтобы увидеть все преимущества Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'Бесплатно или Plutonium';

  @override
  String get premiumFreeColumn => 'Бесплатно';

  @override
  String get premiumGiftSectionTitle => 'Подарить Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'Поделитесь опытом использования Plutonium с друзьями, купив подарочную подписку.';

  @override
  String get premiumGiftBannerOne => 'У вас есть новый подарочный код!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'У вас есть $count новых подарочных кодов!';
  }

  @override
  String get premiumViewGifts => 'Посмотреть подарки';

  @override
  String get premiumReadyToUpgrade => 'Готовы обновиться?';

  @override
  String get premiumReadyToBuyGift => 'Готовы купить подарок?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Ежемесячно $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Годовая подписка за $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 год $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 месяц $price';
  }

  @override
  String get premiumManageSubscription => 'Управлять подпиской';

  @override
  String get premiumRedeemGiftCode => 'Активировать подарочный код';

  @override
  String get premiumGiftBadge => 'Подарок';

  @override
  String get premiumCancelSubscriptionTitle => 'Отменить подписку?';

  @override
  String get premiumCancelSubscriptionBody =>
      'Вы сохраните свои преимущества до следующей даты продления, а затем у вас будет 3 дня льготного периода, чтобы повторно подписаться и сохранить историю подписок.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Отменить подписку';

  @override
  String get premiumKeepSubscription => 'Оставить подписку';

  @override
  String get premiumPurchaseHistoryTitle => 'История покупок';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Ваши последние счета. Чтобы изменить способ оплаты подписки, добавьте или выберите его на портале оплаты и сделайте его основным.';

  @override
  String get premiumManagePaymentMethods => 'Управление способами оплаты';

  @override
  String get premiumBillingHistory => 'История платежей';

  @override
  String get premiumSelfServeRefundTitle =>
      'Возврат средств через самообслуживание';

  @override
  String get premiumSelfServeRefundButton => 'Вернуть последний платёж';

  @override
  String get premiumDisclaimerAgreementPrefix =>
      'Приобретая, вы соглашаетесь с нашими ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'Приобретая, вы согласились с нашими ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' и ';

  @override
  String premiumActiveUntil(String date) {
    return 'Активно до $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Отмена подписки';

  @override
  String premiumCancelsOn(String date) {
    return 'Отмена произойдет $date. Бонусы останутся активны до этого времени.';
  }

  @override
  String get premiumReactivateSubscription => 'Возобновить';

  @override
  String premiumGiftedUntil(String date) {
    return 'Подарено до $date. Автоматически не продлевается.';
  }

  @override
  String get premiumComparisonFeatureColumn => 'Функция';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'Покупая, вы соглашаетесь с нашими $terms и $privacy.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Возврат средств доступен в течение 3 дней после оплаты, но не чаще одного раза в 30 дней. Возврат средств за подписку отменяет ее. Покупатели из ЕС/ЕЭЗ отказываются от 14-дневного права на отказ при оформлении заказа, чтобы получить немедленный доступ к контенту. Используйте кнопку возврата средств в приложении вместо оспаривания платежа. Оспаривание платежа может привести к безвозвратному ограничению вашей учетной записи. Stripe безопасно обрабатывает платежи. Мы никогда не видим полный номер вашей карты.';

  @override
  String get premiumTermsOfService => 'Условия использования';

  @override
  String get premiumPrivacyPolicy => 'Политика конфиденциальности';

  @override
  String get premiumCheckoutStartFailedTitle =>
      'Не удалось начать оформление заказа';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Что-то пошло не так при запуске оформления заказа. Пожалуйста, попробуйте ещё раз через некоторое время.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'У вас подарочная подписка. Она не будет продлена автоматически. Вы можете активировать другие подарочные коды, чтобы продлить ее. Обычную подписку можно будет оформить после окончания подарочного периода.';

  @override
  String get premiumPlanUnavailable =>
      'Этот тариф недоступен. Обратитесь в поддержку.';

  @override
  String get premiumCompletePaymentTitle => 'Завершить оплату';

  @override
  String get premiumCompletePaymentBody =>
      'Теперь вы перейдете на сайт Stripe для завершения оплаты. Вернитесь в Fluxer после завершения.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Выберите способ оплаты';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Оплатите с помощью Pix automático, чтобы разрешить регулярные списания напрямую с вашего бразильского банковского счета. Или выберите оплату картой, чтобы ввести данные кредитной карты на следующем экране Stripe.';

  @override
  String get premiumUsePix => 'Использовать Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Оплатите через UPI, чтобы настроить электронное поручение от вашего индийского банка, соответствующее требованиям RBI. Или выберите оплату картой, чтобы ввести данные кредитной карты на следующем экране Stripe.';

  @override
  String get premiumUseUpi => 'Использовать UPI';

  @override
  String get premiumUseCard => 'Использовать карту';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Не удалось открыть портал оплаты';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'При открытии портала оплаты произошла ошибка. Пожалуйста, попробуйте ещё раз через несколько секунд.';

  @override
  String get premiumAlreadyVisionaryTitle => 'Вы уже Visionary';

  @override
  String get premiumAlreadyVisionaryBody =>
      'В Visionary уже есть постоянный доступ, поэтому регулярная подписка не нужна. Вы всё ещё можете покупать подарки для других.';

  @override
  String get premiumExistingSubscriptionTitle => 'Подписка уже оформлена';

  @override
  String get premiumExistingSubscriptionBody =>
      'Мы нашли действующую подписку Fluxer Plutonium для этой учетной записи. Управляйте ею в защищенном портале оплаты, чтобы обновить платежные данные или проверить статус продления. Если вы только что оплатили, подождите минуту и откройте эту страницу снова.';

  @override
  String get premiumPurchasesDisabledTitle => 'Покупки недоступны';

  @override
  String get premiumPurchasesDisabledBody =>
      'Покупки для этой учетной записи отключены. Свяжитесь с support@fluxer.app, если это выглядит неправильно.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Зарегистрируйте аккаунт, чтобы купить Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Чтобы купить Fluxer Plutonium, вам нужно подтвердить свою электронную почту.';

  @override
  String get premiumPerkCustomUsernameTag => 'Пользовательский тег имени';

  @override
  String get premiumPerkPerCommunityProfiles =>
      'Профили для каждого сообщества';

  @override
  String get premiumPerkMessageScheduling => 'Планирование сообщений';

  @override
  String get premiumPerkProfileBadge => 'Значок профиля';

  @override
  String get premiumPerkCustomVideoBackgrounds => 'Пользовательские видеофоны';

  @override
  String get premiumPerkEntranceSounds => 'Звуки входа';

  @override
  String get premiumPerkCommunities => 'Сообщества';

  @override
  String get premiumPerkMessageCharacterLimit => 'Лимит символов в сообщении';

  @override
  String get premiumPerkBookmarkedMessages => 'Сохраненные сообщения';

  @override
  String get premiumPerkFileUploadSize => 'Размер загружаемого файла';

  @override
  String get premiumPerkEmojiStickerPacks => 'Наборы эмодзи и стикеров';

  @override
  String get premiumPerkSavedMedia => 'Сохраненные медиа';

  @override
  String get premiumPerkUseAnimatedEmojis =>
      'Использовать анимированные эмодзи';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Доступ ко всем эмодзи и стикерам';

  @override
  String get premiumPerkVideoQuality => 'Качество видео';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Анимированные аватары и баннеры профиля';

  @override
  String get premiumPerkEarlyAccess => 'Ранний доступ к новым функциям';

  @override
  String get premiumPerkCustomThemes => 'Пользовательские темы';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'До 4K/60 кадров/с';

  @override
  String get userSettingsNavPrivacyDashboard => 'Панель конфиденциальности';

  @override
  String get userSettingsNavAuthorizedApps => 'Авторизованные приложения';

  @override
  String get userSettingsNavBlockedUsers => 'Заблокированные пользователи';

  @override
  String get userSettingsNavLinkedDevices => 'Связанные устройства';

  @override
  String get userSettingsNavConnections => 'Подключения';

  @override
  String get userSettingsNavLookAndFeel => 'Внешний вид';

  @override
  String get userSettingsNavAccessibility => 'Специальные возможности';

  @override
  String get userSettingsNavChat => 'Сообщения и медиа';

  @override
  String get userSettingsNavAudioAndVideo => 'Аудио и видео';

  @override
  String get userSettingsNavShortcuts => 'Быстрые клавиши';

  @override
  String get audioAndVideoAudioSectionTitle => 'Аудио';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'Настройте микрофон, динамики и параметры обработки голоса.';

  @override
  String get audioAndVideoVideoSectionTitle => 'Видео';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'Настройте качество камеры и демонстрации экрана.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle =>
      'Поведение во время звонка';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Управлять запросами на подтверждение во время голосовых и видеозвонков.';

  @override
  String get audioAndVideoInputDeviceLabel => 'Устройство ввода';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Устройство вывода';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'По умолчанию';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Использовать динамик';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'Когда выключено, звук воспроизводится через динамик телефона или подключенные наушники.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Громкость ввода';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Громкость вывода';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Обработка голоса';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Фокусировка голоса';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Рекомендуется. Очищает звук микрофона для чёткой речи.';

  @override
  String get audioAndVideoDirectInputLabel => 'Прямой ввод';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Отправляет ваш звук без изменений. Лучше всего, если вы используете внешнее аудиопрограммное обеспечение.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Пользовательский';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Настройте каждый параметр самостоятельно: шумоподавление, эхоподавление и усиление.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Подавление шума';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Улучшенное';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Стандартный';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Нет';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Эхоподавление';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Автоматическая регулировка усиления';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Выравнивает громкость вашего микрофона. Отключено при включенном усиленном шумоподавлении.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Тест микрофона';

  @override
  String get audioAndVideoMicTestStartLabel => 'Начать проверку микрофона';

  @override
  String get audioAndVideoMicTestStopLabel => 'Остановить тест микрофона';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '$productName нужен доступ к микрофону для проверки вашего ввода.';
  }

  @override
  String get audioAndVideoCameraLabel => 'Камера';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Зеркальное отображение камеры';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'Качество камеры';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'Качество демонстрации экрана';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Частота кадров';

  @override
  String get audioAndVideoFrameRate15Label => '15 кадр/с';

  @override
  String get audioAndVideoFrameRate30Label => '30 кадр/с';

  @override
  String get audioAndVideoFrameRate60Label => '60 кадров/с';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080p и 60 FPS требуют $premiumProductName.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'В этом экземпляре демонстрация экрана ограничена качеством 720p при 30 FPS.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return '$productName требуется доступ к микрофону, чтобы отобразить ваши устройства.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return '$productName нужен доступ к камере, чтобы показать ваши устройства.';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'Не спрашивать при скрытии моей камеры';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'Не спрашивать при скрытии моего экрана';

  @override
  String get userSettingsNavNotifications => 'Уведомления';

  @override
  String get notificationsGeneralSectionTitle => 'Общие';

  @override
  String get notificationsEnableNotificationsLabel => 'Включить уведомления';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Получайте уведомления о новых сообщениях. Возможно, вам потребуется разрешить уведомления для $productName в настройках вашего устройства. Чтобы настроить уведомления для отдельных каналов или сообществ, откройте настройки уведомлений из меню сообщества.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Включить уведомления на компьютере';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Использует центр уведомлений ОС. Чтобы настроить уведомления для отдельного канала или сообщества, нажмите правой кнопкой мыши на значок сообщества и откройте настройки уведомлений.';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'Включить уведомления в браузере';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'Получайте уведомления о новых сообщениях. Возможно, вам потребуется разрешить уведомления в настройках браузера. Чтобы настроить уведомления для отдельных каналов/сообществ, нажмите правой кнопкой мыши на значок сообщества и откройте настройки уведомлений.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Тайм-аут неактивности push-уведомлений';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName не отправляет уведомления на ваши мобильные устройства, когда вы работаете за компьютером. Укажите, как долго вы должны быть неактивны на рабочем столе, прежде чем получать уведомления.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute минута';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes мин';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle => 'Упоминания';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Настройки упоминаний в ответах';

  @override
  String get notificationsMentionNoPreferenceName => 'Без предпочтений';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Учитывать намерение отправителя, без предупреждения при переключении упоминания @';

  @override
  String get notificationsMentionPreferMentionName => 'Предпочитать упоминания';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'По умолчанию разрешает упоминать вас и предупреждает отправителя, если он отключит эту функцию';

  @override
  String get notificationsMentionPreferNoMentionName => 'Не упоминать меня';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'По умолчанию не добавлять @упоминание в ответ и предупреждать отправителя, если он его включит';

  @override
  String get notificationsTtsSectionTitle => 'Текстовые уведомления';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'Включить воспроизведение речи /tts';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'Пусть /tts прочитает ваше сообщение вслух. Отключение этой настройки оставит команды как обычный текст.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Настройте скорость воспроизведения в ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Доступность';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle =>
      'Автоматическое озвучивание сообщений';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Преобразует входящий контент в речь, независимо от того, отправлен ли он через /tts.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Все каналы';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Пусть каждое входящее сообщение будет озвучено, независимо от того, какой канал открыт.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Только активный канал';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Озвучивает только тот канал, который вы просматриваете. Озвучивание следует за вами при переключении между каналами.';

  @override
  String get notificationsTtsModeNeverName => 'Никогда автоматически';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Молчать, пока кто-нибудь не запустит /tts вручную.';

  @override
  String get notificationsTtsModeAriaLabel => 'Озвучивать все сообщения';

  @override
  String get notificationsSoundsSectionTitle => 'Звуки';

  @override
  String get notificationsMasterVolumeLabel => 'Общая громкость';

  @override
  String get notificationsMasterVolumeDescription =>
      'Устанавливает общую громкость для всех звуковых эффектов. Индивидуальные настройки звуков будут игнорировать эту опцию.';

  @override
  String get notificationsResetToDefaultVolume =>
      'Сбросить громкость до стандартной';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Отключить все звуки уведомлений';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Ваши текущие настройки звуков уведомлений будут сохранены.';

  @override
  String get notificationsShowMoreSoundEffects =>
      'Показать больше звуковых эффектов';

  @override
  String get notificationsShowFewerSoundEffects =>
      'Показать меньше звуковых эффектов';

  @override
  String get notificationsPreviewSound => 'Предпросмотр звука';

  @override
  String get notificationsPerSoundVolumeTitle => 'Громкость отдельных звуков';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Установите пользовательскую громкость для отдельных звуков. Звуки без индивидуальных настроек будут использовать общую громкость.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Активных пользовательских настроек громкости звуков: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Как в основных настройках • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'Сбросить $label до общей громкости';
  }

  @override
  String get notificationsResetAllOverrides => 'Сбросить все настройки';

  @override
  String notificationsMuteSound(String label) {
    return 'Отключить звук для $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'Включить звук для $label';
  }

  @override
  String get notificationsSoundMessage => 'Уведомления о сообщениях сообщества';

  @override
  String get notificationsSoundDirectMessage =>
      'Уведомления о личных сообщениях';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Уведомления о сообщениях текущего канала';

  @override
  String get notificationsSoundMute => 'Без звука (голосовые)';

  @override
  String get notificationsSoundUnmute => 'Включить микрофон';

  @override
  String get notificationsSoundDeaf => 'Отключение звука';

  @override
  String get notificationsSoundUndeaf => 'Снятие заглушения голоса';

  @override
  String get notificationsSoundUserJoin =>
      'Пользователь присоединяется к каналу';

  @override
  String get notificationsSoundUserLeave => 'Пользователь покинул канал';

  @override
  String get notificationsSoundUserMove => 'Пользователь переместил канал';

  @override
  String get notificationsSoundViewerJoin =>
      'Зритель присоединяется к трансляции';

  @override
  String get notificationsSoundViewerLeave => 'Зритель покинул трансляцию';

  @override
  String get notificationsSoundVoiceDisconnect => 'Голосовой вызов завершён';

  @override
  String get notificationsSoundIncomingRing => 'Входящий звонок';

  @override
  String get notificationsSoundCameraOn => 'Камера включена';

  @override
  String get notificationsSoundCameraOff => 'Камера выключена';

  @override
  String get notificationsSoundScreenShareStart => 'Начало демонстрации экрана';

  @override
  String get notificationsSoundScreenShareStop =>
      'Остановка демонстрации экрана';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'Не удалось обновить время ожидания push-уведомлений. Попробуйте снова.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Не удалось обновить настройки упоминаний. Попробуйте снова.';

  @override
  String get notificationsPermissionDeniedTitle => 'Уведомления заблокированы';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'Не удалось включить уведомления. Разрешите доступ к уведомлениям, чтобы продолжить.';

  @override
  String get userSettingsNavLanguageAndTime => 'Язык и время';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Язык интерфейса';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Выберите язык, который будет использоваться во всем приложении';

  @override
  String get languageAndTimeOpenLanguageSettings => 'Открыть настройки языка';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Формат времени';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Выберите формат времени в приложении';

  @override
  String get languageAndTimeTimeFormatSelectionLabel => 'Выбор формата времени';

  @override
  String get languageAndTimeTimeFormatAuto => 'Авто';

  @override
  String get languageAndTimeTimeFormat12Hour => '12-часовой';

  @override
  String get languageAndTimeTimeFormat24Hour => '24-часовой';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'Язык приложения: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Системная локаль: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Использовать системный формат времени';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'Не удалось обновить формат времени';

  @override
  String get userSettingsNavDefaultApps => 'Приложения по умолчанию';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Веб-браузер';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Выберите браузер, который будет открывать ссылки при нажатии.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'Если для сайта установлено приложение, ссылки будут открываться в нём в первую очередь.';

  @override
  String get defaultAppsWebBrowserInApp => 'Встроенный браузер';

  @override
  String get defaultAppsWebBrowserExternal => 'Внешний браузер';

  @override
  String get userSettingsNavAdvanced => 'Дополнительно';

  @override
  String get advancedPerformanceReportingTitle => 'Отчеты о производительности';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'Помогите улучшить $productName, делясь анонимными данными о сбоях и производительности.';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'Отправлять отчеты о сбоях и производительности';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'Все отправляемые данные анонимны и отправляются только на собственный мониторинговый сервис $productName — сторонние поставщики не используются.';
  }

  @override
  String get advancedSettingsConfigure => 'Настроить';

  @override
  String get advancedSettingsCategoryPrivacy => 'Конфиденциальность';

  @override
  String get advancedSettingsCategoryAppearance => 'Внешний вид';

  @override
  String get advancedSettingsCategoryAccessibility => 'Доступность';

  @override
  String get advancedSettingsCategoryChat => 'Чат';

  @override
  String get advancedSettingsCategoryMedia => 'Медиа';

  @override
  String get advancedSettingsCategoryVoice => 'Голосовой';

  @override
  String get advancedSettingsCategoryDeveloper => 'Разработчик';

  @override
  String get advancedSettingEnableTextSelectionLabel =>
      'Включить выделение текста';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Разрешить выделение текста в приложении';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Включить миниатюры для навигации по видео';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Миниатюра или живой кадр во время перемотки видео';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Тактильная отдача';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Виброотклик при нажатиях и действиях. Не синхронизируется между устройствами.';

  @override
  String get advancedSettingShowNekoLabel => 'Показывать Неко';

  @override
  String get advancedSettingShowNekoDescription =>
      'Нэко-кот, который гоняется за вашим курсором';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Показывать Нэко во вводе чата';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Анимация масштабирования при запуске';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Уменьшать логотип при выходе из заставки';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Подсказки клавиатуры';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Всплывающие подсказки для сочетаний клавиш';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Включить избранное';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Показывать избранное во всем приложении';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Как присоединяться к голосовым чатам';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Подтверждение или двойной щелчок для входа в голосовой канал сообщества';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Требовать двойной щелчок для входа в голосовые каналы';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Запрашивать подтверждение перед входом в голосовые чаты';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Автоматически отправлять GIF при выборе';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Автоматически отправлять GIF из подборки без подтверждения';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Сохранять избранные GIF как сохраненные медиа';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Выберите, как хранить избранные GIF-файлы';

  @override
  String get advancedSettingMediaButtonsLabel => 'Кнопки медиа';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Настройте, какие кнопки и индикаторы будут отображаться на медиафайлах и встраиваемых объектах';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Загрузите вложения перед отправкой';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Начните загружать вложения сразу после их добавления в поле ввода сообщения';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Удалять параметры отслеживания из ссылок';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Автоматически удалять параметры отслеживания из URL в отправляемых сообщениях';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'Доверять всем внешним ссылкам';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'Пропускать предупреждение о внешних ссылках для всех доменов';

  @override
  String get advancedSettingSearchEnginesLabel => 'Поисковые системы';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Настройте поисковые системы, используемые для поиска по выделенному тексту';

  @override
  String get advancedSettingTranslatorsLabel => 'Переводчики';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Настройте используемые переводчики для выделенного текста';

  @override
  String get advancedSettingReverseImageSearchLabel => 'Поиск по картинке';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Поставщики для обратного поиска изображений';

  @override
  String get advancedSettingMessageActionBarLabel =>
      'Панель действий с сообщениями';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Настройте панель действий, которая появляется при наведении на сообщения';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Автозавершение выражений';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Выберите, что отображается при вводе двоеточия в поле ввода сообщения';

  @override
  String get advancedSettingInputButtonsLabel => 'Кнопки ввода сообщения';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Выберите, какие кнопки отображаются в поле ввода сообщений';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Прокручивать вниз при отправке сообщения';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Выберите, как чат будет прокручиваться после отправки сообщения';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Пропускать подтверждение \"Отметить все как прочитанное\"';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Пометить все непрочитанные каналы входящих как прочитанные немедленно, без запроса подтверждения';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Скрывать заглушенные каналы по умолчанию';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Скрывать заглушенные каналы из боковых панелей сообществ';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'Показывать индикатор GIF';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Показывать индикатор срока действия вложений';

  @override
  String get advancedSettingShowMediaDeleteLabel =>
      'Показывать кнопку удаления';

  @override
  String get advancedSettingShowMediaDownloadLabel =>
      'Показывать кнопку загрузки';

  @override
  String get advancedSettingShowMediaFavoriteLabel =>
      'Показывать кнопку \"Избранное\"';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Показывать кнопку \"Скрыть вложения\"';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Показывать панель действий с сообщениями';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel =>
      'Показывать только кнопку \"Ещё\"';

  @override
  String get advancedSettingShowQuickReactionsLabel =>
      'Показывать быстрые реакции';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Включить Shift для разворачивания';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Показывать стандартные эмодзи в автозаполнении выражений';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Показывать свои эмодзи в автозаполнении выражений';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Показывать стикеры в автозаполнении эмодзи';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Показывать сохраненные медиа в автозаполнении выражений';

  @override
  String get advancedSettingShowGifsButtonLabel => 'Показывать кнопку GIF';

  @override
  String get advancedSettingShowMediaButtonLabel => 'Показывать кнопку медиа';

  @override
  String get advancedSettingShowStickersButtonLabel =>
      'Показывать кнопку стикеров';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Показывать кнопку эмодзи';

  @override
  String get advancedSettingShowSendButtonLabel => 'Показывать кнопку отправки';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Показывать оповещения о новых устройствах';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Запрос на новые аудиоустройства';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Громкость соединения';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Показывать ползунки громкости участников для каждого устройства в голосовых меню';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Поведение предварительного просмотра экрана при совместном использовании';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Предварительный просмотр, открытие в отдельном окне и поведение миниатюр потока';

  @override
  String get advancedSettingScreenShareCodecLabel =>
      'Кодек демонстрации экрана';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Видеокодек для демонстрации экрана';

  @override
  String get advancedSettingScreenShareCodecAuto =>
      'Автоматически (рекомендуется)';

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
      'Приостанавливать предпросмотр демонстрации экрана в фоновом режиме';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Скрыть миниатюру предпросмотра моей трансляции';

  @override
  String get advancedSettingDeveloperModeLabel => 'Включить режим разработчика';

  @override
  String get advancedSettingDeveloperModeDescription =>
      'Включить режим разработчика';

  @override
  String get advancedSettingSearchEngineGoogle => 'Google';

  @override
  String get advancedSettingSearchEngineDuckDuckGo => 'DuckDuckGo';

  @override
  String get advancedSettingSearchEngineBing => 'Bing';

  @override
  String get advancedSettingSearchEngineGoogleLens => 'Google Объектив';

  @override
  String get advancedSettingSearchEngineTinEye => 'TinEye';

  @override
  String get advancedSettingTranslatorGoogle => 'Перевод Google';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel =>
      'Поисковая система по умолчанию';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Выберите поисковую систему, которая будет использоваться по умолчанию при поиске выделенного текста.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Встроенные поисковые системы';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Включите или отключите встроенные поисковые системы. Включенные системы будут отображаться в контекстном меню сообщения при выделении текста.';

  @override
  String get advancedSettingCustomSearchEnginesLabel =>
      'Пользовательские поисковые системы';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Добавьте свои поисковые системы с пользовательским шаблоном URL. Используйте «$query» в качестве заполнителя для текста поиска.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Добавить поисковик';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Включите хотя бы одну поисковую систему ниже.';

  @override
  String get advancedSettingRemoveSearchEngineLabel =>
      'Удалить поисковую систему';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'Переводчик по умолчанию';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Выберите переводчик по умолчанию для перевода выделенного текста.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Встроенные переводчики';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Включите или отключите встроенные переводчики. Включенные переводчики появятся в контекстном меню сообщения при выделении текста.';

  @override
  String get advancedSettingCustomTranslatorsLabel =>
      'Пользовательские переводчики';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Добавьте свои переводчики с помощью пользовательского шаблона URL. Используйте «$query» в качестве заполнителя для текста, который нужно перевести.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Добавить переводчик';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Включите хотя бы один переводчик ниже.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Удалить переводчик';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Поиск по изображению по умолчанию';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Выберите сервис, который будет использоваться по умолчанию для поиска по изображению.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Встроенный поиск по изображению';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Включите или отключите встроенные сервисы обратного поиска изображений. Включенные сервисы будут отображаться в контекстном меню изображений, аватаров, баннеров, стикеров и эмодзи.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Пользовательский поиск по изображению';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Добавьте свои собственные провайдеры обратного поиска изображений с пользовательским шаблоном URL. Используйте «$url» в качестве заполнителя для URL-адреса изображения.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Добавить обратный поиск по изображению';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Включите хотя бы один сервис обратного поиска изображений ниже.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Удалить обратный поиск по изображению';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Добавить поисковик';

  @override
  String get advancedSettingEditSearchEngineTitle =>
      'Изменить поисковую систему';

  @override
  String get advancedSettingAddTranslatorTitle => 'Добавить сервис перевода';

  @override
  String get advancedSettingEditTranslatorTitle =>
      'Изменить поставщика перевода';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Добавить поисковик по картинке';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Изменить поисковик по картинке';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Название';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'Шаблон URL';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'Моя поисковая система';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Мой переводчик';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'Мой обратный поиск по изображению';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Используйте «$query», где должен быть вставлен текст поиска.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Используйте «$query», где должен быть вставлен текст для перевода.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Используйте «$url», куда следует вставить URL изображения.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired => 'Требуется имя.';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'Требуется шаблон URL.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'URL-шаблон должен содержать плейсхолдер \"$query\".';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'URL-шаблон должен содержать плейсхолдер \"$url\".';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'Шаблон URL должен быть действительным URL-адресом.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Добавить';

  @override
  String get advancedSettingEditSearchProviderAction => 'Изменить';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Удалить';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'Вы уверены, что хотите удалить $engineName?';
  }

  @override
  String get userSettingsNavApplications => 'Приложения';

  @override
  String get userSettingsNavAppLogs => 'Журналы приложений';

  @override
  String get userSettingsNavDeveloperTools => 'Инструменты разработчика';

  @override
  String get userSettingsNavLimitsConfig => 'Настройка лимитов';

  @override
  String get userSettingsNavFeatureFlags => 'Флаги функций';

  @override
  String get userSettingsNavWhatsNew => 'Что нового';

  @override
  String get userSettingsJoinFluxerLabs => 'Присоединиться к Fluxer Labs';

  @override
  String get userSettingsNavAppLicenses => 'Лицензии приложений';

  @override
  String get userSettingsAppLicensesDescription =>
      'Программное обеспечение с открытым исходным кодом, используемое в этом приложении. Это приложение создано с помощью Flutter.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'Не удалось загрузить лицензии приложений.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count лицензий',
      one: '1 лицензия',
    );
    return '$_temp0';
  }

  @override
  String get userSettingsNavLogOut => 'Выйти';

  @override
  String get quickSwitcherTabSearch => 'Поиск';

  @override
  String get quickSwitcherTabFriends => 'Друзья';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Поиск каналов, людей или сообществ';

  @override
  String get quickSwitcherSearchFriends => 'Поиск друзей';

  @override
  String get quickSwitcherNoMatchesFound => 'Совпадений не найдено';

  @override
  String get quickSwitcherEmptyHint =>
      'Попробуйте другое имя или используйте префиксы @ / # / ! / * для фильтрации результатов.';

  @override
  String get quickSwitcherSectionPeople => 'Люди';

  @override
  String get quickSwitcherSectionGroupMessages => 'Групповые сообщения';

  @override
  String get quickSwitcherSectionTextChannels => 'Текстовые каналы';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Голосовые каналы';

  @override
  String get quickSwitcherSectionCommunities => 'Сообщества';

  @override
  String get quickSwitcherSectionSettings => 'Настройки';

  @override
  String get quickSwitcherHomeLabel => 'Главная';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Личные сообщения';

  @override
  String get quickSwitcherFavoritesLabel => 'Избранное';

  @override
  String get quickSwitcherUserSettingsLabel => 'Настройки пользователя';

  @override
  String get quickSwitcherNotificationsLabel => 'Уведомления';

  @override
  String get quickSwitcherBookmarksLabel => 'Закладки';

  @override
  String get savedMessagesEmptyTitle => 'Нет закладок';

  @override
  String get savedMessagesEmptyBody =>
      'Добавляйте сообщения в закладки, чтобы сохранить их на потом.';

  @override
  String get savedMessagesEndBody => 'Здесь больше нечего смотреть.';

  @override
  String get savedMessagesRemoveTooltip => 'Удалить из закладок';

  @override
  String get quickSwitcherMentionsLabel => 'Упоминания';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'У вас пока нет друзей';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Добавьте друга, чтобы начать.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Друзей, соответствующих этому поиску, не найдено';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Попробуйте другое имя.';

  @override
  String get quickSwitcherSearchAliasUser => 'Пользователь';

  @override
  String get quickSwitcherSearchAliasYou => 'Вы';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'ЛС';

  @override
  String get quickSwitcherSearchAliasMessages => 'Сообщения';

  @override
  String get quickSwitcherSearchAliasFav => 'Избр.';

  @override
  String get quickSwitcherSearchAliasStarred => 'Избранные';

  @override
  String get quickSwitcherSearchAliasInbox => 'Входящие';

  @override
  String get quickSwitcherSearchAliasSaved => 'Сохраненные';

  @override
  String get uiClose => 'Закрыть';

  @override
  String get chatJumpToBottom => 'Перейти к последнему сообщению';

  @override
  String get uiConfirm => 'Подтвердить';

  @override
  String get uiLoading => 'Загрузка';

  @override
  String get uiSearch => 'Поиск';

  @override
  String get uiStartCall => 'Начать звонок';

  @override
  String get uiStartVideoCall => 'Начать видеозвонок';

  @override
  String get uiPlay => 'Воспроизвести';

  @override
  String get uiPause => 'Пауза';

  @override
  String get uiDownload => 'Скачать';

  @override
  String get uiMoreActions => 'Ещё';

  @override
  String get uiUnsavedChanges => 'Несохраненные изменения';

  @override
  String get uiReset => 'Сбросить';

  @override
  String get uiOpenColorPicker => 'Открыть палитру цветов';

  @override
  String get uiSelectPlaceholder => 'Выбрать';

  @override
  String get uiSearchPlaceholder => 'Поиск';

  @override
  String get uiNoOptionsFound => 'Опции не найдены';

  @override
  String get uiDismissNotification => 'Закрыть уведомление';

  @override
  String get uiColorPickerTitle => 'Палитра цветов';

  @override
  String get mentionConfirmTitle => 'Упомянуть всех?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Это уведомит $count участников. Продолжить?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Это уведомит $count онлайн-участников. Продолжить?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'Это уведомит $count участников с ролью $roleName. Продолжить?';
  }

  @override
  String get mentionConfirmButton => 'Упомянуть';

  @override
  String get composerEmojiUnavailable =>
      'Вы не можете использовать этот эмодзи здесь.';

  @override
  String get instanceUrlLabel => 'URL экземпляра';

  @override
  String get instanceUrlPlaceholder =>
      'Введите URL экземпляра (например, fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Сбросить до Fluxer';

  @override
  String get instanceConnect => 'Подключиться';

  @override
  String get instanceConnecting => 'Подключение…';

  @override
  String get instanceConnectFailed => 'Не удалось подключиться к экземпляру';

  @override
  String get recentInstances => 'Недавние экземпляры';

  @override
  String removeRecentInstance(String domain) {
    return 'Удалить $domain из недавних экземпляров';
  }

  @override
  String get instanceSheetTitle => 'Подключиться к экземпляру';

  @override
  String get connectToDifferentInstance => 'Подключиться к другому экземпляру';

  @override
  String get changeInstance => 'Изменить';

  @override
  String get instanceConnectionRequired =>
      'Подключитесь к экземпляру для входа';

  @override
  String get comingSoon => 'Скоро';

  @override
  String get guildNavbarDirectMessages => 'Личные сообщения';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Поиск доступных сообществ';

  @override
  String get discoveryExplore => 'Поиск';

  @override
  String get discoveryExplorePublicCommunities => 'Поиск публичных сообществ';

  @override
  String get discoveryListingSubheading =>
      'Хотите добавить свое сообщество сюда? Подайте заявку, если оно соответствует требованиям в настройках вашего сообщества > Поиск.';

  @override
  String get discoverySearchCommunities => 'Поиск сообществ';

  @override
  String get discoveryFilterByLanguage => 'Фильтр по языку';

  @override
  String get discoveryAllLanguages => 'Все языки';

  @override
  String get discoveryAllCategories => 'Все';

  @override
  String get discoveryCategoryGaming => 'Игры';

  @override
  String get discoveryCategoryMusic => 'Музыка';

  @override
  String get discoveryCategoryEntertainment => 'Развлечения';

  @override
  String get discoveryCategoryEducation => 'Образование';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Наука и технологии';

  @override
  String get discoveryCategoryContentCreator => 'Создатели контента';

  @override
  String get discoveryCategoryAnimeAndManga => 'Аниме и манга';

  @override
  String get discoveryCategoryMoviesAndTv => 'Фильмы и ТВ';

  @override
  String get discoveryCategoryOther => 'Другое';

  @override
  String get discoveryNoCommunitiesMatch => 'Нет подходящих сообществ.';

  @override
  String get discoveryJoinCommunity => 'Присоединиться к сообществу';

  @override
  String get discoveryJoined => 'Присоединились';

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
      other: '$countString участников',
      one: '1 участник',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Нет описания.';

  @override
  String get discoveryCommunities => 'Сообщества';

  @override
  String get discoveryApps => 'Приложения';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Не удалось присоединиться к этому сообществу';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Что-то пошло не так. Пожалуйста, попробуйте еще раз через мгновение.';

  @override
  String get discoveryJoinErrorFullTitle => 'Это сообщество заполнено';

  @override
  String get discoveryJoinErrorFullMessage =>
      'В этом сообществе достигнут лимит участников, поэтому вы не можете присоединиться прямо сейчас.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle => 'Вы достигли лимита сообществ';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Вы состоите в максимальном количестве сообществ. Покиньте одно и попробуйте снова.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Вы не можете присоединиться к этому сообществу';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Вы были забанены в этом сообществе.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Это сообщество больше недоступно';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Оно могло покинуть поиск или отключить новых участников. Обновите страницу, и вы больше не увидите его.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Вы слишком торопитесь';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Пожалуйста, подождите немного и попробуйте снова.';

  @override
  String get guildNavbarAddCommunity => 'Добавить сообщество';

  @override
  String get guildNavbarHelp => 'Помощь';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'НОВОЕ СООБЩЕНИЕ';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Свернуть папку $folderName';
  }

  @override
  String get guildNavbarGuildSelected => 'Выбрано';

  @override
  String get guildNavbarGuildUnread => 'Непрочитанные';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count упоминаний',
      one: '1 упоминание',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'без звука';

  @override
  String get authShowPassword => 'Показать пароль';

  @override
  String get authHidePassword => 'Скрыть пароль';

  @override
  String get chatLoadingMessages => 'Загрузка сообщений';

  @override
  String get friendsMessageFriend => 'Написать';

  @override
  String get friendsFriendActions => 'Действия с другом';

  @override
  String get friendsAcceptRequest => 'Принять запрос на добавление в друзья';

  @override
  String get friendsDeclineRequest => 'Отклонить запрос в друзья';

  @override
  String get friendsCancelRequest => 'Отменить запрос в друзья';

  @override
  String get friendsOpenInbox => 'Входящие';

  @override
  String get profileRemoveFriend => 'Удалить из друзей';

  @override
  String get profileUnblockUser => 'Разблокировать пользователя';

  @override
  String get profileAcceptFriendRequest =>
      'Принять запрос на добавление в друзья';

  @override
  String get profileCancelFriendRequest => 'Отменить запрос в друзья';

  @override
  String get profileSendFriendRequest => 'Добавить в друзья';

  @override
  String get accountOverflowMenu => 'Параметры аккаунта';

  @override
  String get navHome => 'Главная';

  @override
  String get navNotifications => 'Уведомления';

  @override
  String get navYou => 'Вы';

  @override
  String get guildFolderSettingsTitle => 'Настройки папки';

  @override
  String get guildFolderNameLabel => 'Название папки';

  @override
  String get guildFolderColorLabel => 'Цвет папки';

  @override
  String get guildFolderShowIconWhenCollapsed =>
      'Показывать значок, когда свернуто';

  @override
  String get guildFolderIconLabel => 'Значок папки';

  @override
  String get guildFolderDelete => 'Удалить папку';

  @override
  String get guildFolderIconFolder => 'Папка';

  @override
  String get guildFolderIconStar => 'Избранное';

  @override
  String get guildFolderIconHeart => 'Сердечко';

  @override
  String get guildFolderIconBookmark => 'Закладка';

  @override
  String get guildFolderIconGameController => 'Игровой контроллер';

  @override
  String get guildFolderIconShield => 'Щит';

  @override
  String get guildFolderIconMusicNote => 'Музыкальная нота';

  @override
  String get guildFolderMarkAsRead => 'Отметить папку прочитанной';

  @override
  String get guildBulkMuteCommunities => 'Отключить уведомления сообществ';

  @override
  String get guildBulkUnmuteCommunities => 'Включить уведомления сообществ';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Настройки уведомлений сообщества';

  @override
  String get guildBulkCommunityPrivacySettings =>
      'Настройки конфиденциальности сообщества';

  @override
  String get guildBulkAllowEveryoneAndHere => 'Разрешить @everyone и @here';

  @override
  String get guildBulkAllowRoleMentions => 'Разрешить упоминания ролей';

  @override
  String get guildBulkEnableMobilePush => 'Включить мобильные push-уведомления';

  @override
  String get guildBulkDisableMobilePush =>
      'Отключить мобильные push-уведомления';

  @override
  String get guildBulkAllowDirectMessages => 'Разрешить личные сообщения';

  @override
  String get guildBulkBlockDirectMessages => 'Блокировать личные сообщения';

  @override
  String get guildBulkAllowBotDirectMessages => 'Разрешить боту писать в личку';

  @override
  String get guildBulkBlockBotDirectMessages =>
      'Блокировать личные сообщения от бота';

  @override
  String get guildNavbarGroupDm => 'Групповой DM';

  @override
  String get guildNavbarCreateChannel => 'Создать канал';

  @override
  String get guildNavbarChannelType => 'Тип канала';

  @override
  String get guildNavbarTextChannel => 'Текстовый канал';

  @override
  String get guildNavbarTextChannelDescription =>
      'Отправляйте сообщения, изображения, GIF-файлы и эмодзи';

  @override
  String get guildNavbarVoiceChannel => 'Голосовой канал';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Общайтесь вместе голосом, видео и с демонстрацией экрана';

  @override
  String get guildNavbarLinkChannel => 'Ссылка на канал';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Быстрый доступ к внешнему веб-сайту или ресурсу';

  @override
  String get guildNavbarNameLabel => 'Название';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Выбор типа канала';

  @override
  String get guildNavbarCreateCategory => 'Создать категорию';

  @override
  String get guildNavbarNewCategoryHint => 'Новая категория';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Пригласить друзей в $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Получатели попадут в #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Поиск друзей';

  @override
  String get guildNavbarNoFriendsYet => 'Пока нет друзей';

  @override
  String get guildNavbarNoResults => 'Нет результатов';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Или отправьте ссылку-приглашение другу:';

  @override
  String get guildNavbarInviteLink => 'Ссылка-приглашение';

  @override
  String get guildNavbarCopy => 'Копировать';

  @override
  String get guildNavbarCopied => 'Скопировано!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Ваша ссылка-приглашение истекает через 7 дней.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Эта ссылка-приглашение никогда не истекает.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Ваша ссылка-приглашение истекает через $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Изменить ссылку-приглашение';

  @override
  String get guildNavbarInviteLinkSettings => 'Настройки ссылки-приглашения';

  @override
  String get guildNavbarExpireAfter => 'Истекает через';

  @override
  String get guildNavbarMaxUses => 'Макс. количество использований';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Предоставить временное членство';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Участники будут удалены при выходе из сети, если не назначена роль';

  @override
  String get guildNavbarCreateNewLink => 'Создать новую ссылку';

  @override
  String get guildNavbarSent => 'Отправлено';

  @override
  String get guildNavbarInvite => 'Пригласить';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Покинуть сообщество';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Вы уверены, что хотите покинуть это сообщество? Вы больше не сможете видеть сообщения.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Покинуть сообщество';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Удалить ваши сообщения в этом сообществе?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Безвозвратно удалить все отправленные вами сообщения здесь, во всех каналах. Отменить действие невозможно.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Удалить мои сообщения';

  @override
  String get guildNavbarDeletedYourMessages => 'Ваши сообщения удалены';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Не удалось удалить ваши сообщения';

  @override
  String get guildNavbarRemoveOverride => 'Удалить переопределение';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Временно заглушено до $formattedDate';
  }

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'Доступно только сотрудникам $productName';
  }

  @override
  String get guildNavbarInvitesPaused =>
      'Приглашения в этом сообществе временно приостановлены';

  @override
  String get guildNavbarDurationNever => 'никогда';

  @override
  String get guildNavbarDuration30Minutes => '30 минут';

  @override
  String get guildNavbarDuration1Hour => '1 час';

  @override
  String get guildNavbarDuration6Hours => '6 часов';

  @override
  String get guildNavbarDuration12Hours => '12 часов';

  @override
  String get guildNavbarDuration1Day => '1 день';

  @override
  String get guildNavbarDuration7Days => '7 дней';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count секунд';
  }

  @override
  String get guildNavbarNever => 'Никогда';

  @override
  String get guildNavbarNoLimit => 'Без ограничений';

  @override
  String get guildNavbarOneUse => '1 использование';

  @override
  String guildNavbarUses(int count) {
    return '$count использований';
  }

  @override
  String get guildMenuMarkAsRead => 'Отметить как прочитанное';

  @override
  String get guildPeekMoreOptions => 'Другие параметры';

  @override
  String get guildMenuInviteMembers => 'Пригласить участников';

  @override
  String get guildMenuCommunitySettings => 'Настройки сообщества';

  @override
  String get guildMenuEditCommunityProfile => 'Изменить профиль сообщества';

  @override
  String get guildMenuUnmuteCommunity => 'Включить уведомления сообщества';

  @override
  String get guildMenuMuteCommunity => 'Отключить уведомления сообщества';

  @override
  String get guildMenuHideMutedChannels => 'Скрыть отключенные каналы';

  @override
  String get guildMenuReportCommunity => 'Пожаловаться на сообщество';

  @override
  String get guildMenuDebugCommunity => 'Отладка сообщества';

  @override
  String get guildMenuCopyCommunityId => 'Копировать ID сообщества';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'До $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Общие';

  @override
  String get guildMenuSettingsRoles => 'Роли и разрешения';

  @override
  String get guildMenuSettingsEmoji => 'Эмодзи';

  @override
  String get guildMenuSettingsStickers => 'Стикеры';

  @override
  String get guildMenuSettingsSafetyModeration => 'Безопасность и модерация';

  @override
  String get guildMenuSettingsActivityLog => 'Журнал действий';

  @override
  String get guildMenuSettingsWebhooks => 'Вебхуки';

  @override
  String get guildMenuSettingsCustomInviteUrl =>
      'Пользовательская ссылка-приглашение';

  @override
  String get guildMenuSettingsDiscovery => 'Поиск';

  @override
  String get guildMenuSettingsMembers => 'Участники';

  @override
  String get guildMenuSettingsInviteLinks => 'Приглашения';

  @override
  String get guildMenuSettingsBans => 'Баны';

  @override
  String get guildMenuSettingsChannels => 'Каналы';

  @override
  String get guildSettingsNoPermission =>
      'У вас нет разрешения на просмотр этой вкладки настроек.';

  @override
  String get guildSettingsOverviewIconTitle => 'Значок';

  @override
  String get guildSettingsUploadImage => 'Загрузить изображение';

  @override
  String get guildSettingsOverviewBannerTitle => 'Баннер';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Загрузите баннер для вашего сервера.';

  @override
  String get guildSettingsOverviewNameTitle => 'Название';

  @override
  String get guildSettingsOverviewNameHint => 'Мое классное сообщество';

  @override
  String get guildSettingsOverviewStatsTitle => 'Статистика';

  @override
  String get guildSettingsOverviewMembers => 'Участники';

  @override
  String get guildSettingsOverviewOnline => 'Онлайн';

  @override
  String get guildSettingsRolesDescription =>
      'Используйте роли для группировки участников и назначения разрешений.';

  @override
  String get guildSettingsCreateRole => 'Создать роль';

  @override
  String get guildSettingsRolesListTitle => 'Роли';

  @override
  String get guildSettingsRolesNewRole => 'Новая роль';

  @override
  String get guildSettingsRolesDeleteRole => 'Удалить роль';

  @override
  String get guildSettingsRolesBackToRoles => 'Назад к ролям';

  @override
  String get guildSettingsBackToSettings => 'Назад к настройкам';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Редактировать \"$name\"';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Настроить параметры и разрешения роли';

  @override
  String get guildSettingsRolesDisplaySection => 'Отображение';

  @override
  String get guildSettingsRolesRoleName => 'Название роли';

  @override
  String get guildSettingsRolesRoleColor => 'Цвет роли';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Введите цвет (hex, rgb(), hsl() или название) или используйте палитру.';

  @override
  String get guildSettingsRolesShowSeparately => 'Показывать эту роль отдельно';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Показывает участников с этой ролью в отдельном разделе списка участников.';

  @override
  String get guildSettingsRolesAllowMentions =>
      'Разрешить упоминания для этой роли';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'Участники с разрешением \"$permission\" всегда смогут упоминать роли, независимо от этой настройки.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Используйте эту кнопку, чтобы быстро сбросить все разрешения.';

  @override
  String get guildSettingsRolesClearPermissions => 'Очистить разрешения';

  @override
  String get guildSettingsRolesPermissionsSection => 'Разрешения';

  @override
  String get guildSettingsRolesSearchPermissions => 'Поиск разрешений';

  @override
  String get guildSettingsRolesDenseLayout => 'Компактный вид';

  @override
  String get guildSettingsRolesComfyLayout => 'Удобное расположение';

  @override
  String get guildSettingsRolesSwitchToDenseLayout =>
      'Переключить на компактный вид';

  @override
  String get guildSettingsRolesSwitchToComfyLayout =>
      'Переключиться на удобный вид';

  @override
  String get guildSettingsRolesSingleColumn => 'Одна колонка';

  @override
  String get guildSettingsRolesTwoColumns => 'Две колонки';

  @override
  String get guildSettingsRolesSwitchToSingleColumn =>
      'Переключить на одну колонку';

  @override
  String get guildSettingsRolesSwitchToTwoColumns =>
      'Переключить на две колонки';

  @override
  String get guildSettingsRolesNoPermissionsFound => 'Разрешения не найдены';

  @override
  String get guildSettingsRolesCustomHoistOrder =>
      'Пользовательский порядок отображения';

  @override
  String get guildSettingsRolesHoistOrder => 'Порядок отображения';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Сбросить до стандартных';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Перетаскивайте роли, чтобы изменить порядок их отображения в списке участников.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Нет поднятых ролей. Чтобы увидеть роль здесь, включите для неё параметр \"Показывать эту роль отдельно\".';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'Вы не можете редактировать эту роль, так как она является вашей наивысшей ролью или находится выше вашей';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Чтобы изменить эти разрешения, вам нужно разрешение \"$permission\".';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'Вы не можете редактировать роль, которая равна вашей высшей роли или выше нее';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'Вы не можете предоставить разрешение, которого у вас нет';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'Вы не можете удалить это разрешение, потому что оно будет удалено у вас';

  @override
  String get guildSettingsRolesUpdatedSuccess => 'Роли обновлены';

  @override
  String get guildSettingsRolesCreatedSuccess => 'Роль успешно создана';

  @override
  String get guildSettingsRolesDeletedSuccess => 'Роль удалена';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'Порядок отображения сброшен до стандартного';

  @override
  String get guildSettingsRolesNameRequiredTitle => 'Требуется название роли';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Присвойте роли имя, прежде чем сохранять.';

  @override
  String get guildSettingsRolesCreateFailedTitle => 'Не удалось создать роль';

  @override
  String get guildSettingsRolesUpdateFailedTitle => 'Не удалось обновить роли';

  @override
  String get guildSettingsRolesDeleteFailedTitle => 'Не удалось удалить роль';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '«$name» не удалось удалить. Попробуйте снова.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'Не удалось сбросить порядок отображения';

  @override
  String get guildSettingsRolesTryAgainInAMoment => 'Повторите попытку позже.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'Вы уверены, что хотите удалить роль $name? Участники с этой ролью больше не будут ее иметь.';
  }

  @override
  String get permissionCategoryCommunityWide => 'Всё сообщество';

  @override
  String get permissionCategoryMessagesMedia => 'Сообщения и медиа';

  @override
  String get permissionCategoryModeration => 'Модерация';

  @override
  String get permissionCategoryChannelAccess => 'Доступ к каналам';

  @override
  String get permissionCategoryChannelManagement => 'Управление каналами';

  @override
  String get permissionCategoryAudioVideo => 'Аудио и видео';

  @override
  String get permissionUnknown => 'Неизвестное разрешение';

  @override
  String get permissionAdministrator => 'Администратор';

  @override
  String get permissionAdministratorDescription =>
      'Предоставляет все разрешения и обходит ограничения канала. Очень конфиденциально.';

  @override
  String get permissionViewActivityLog => 'Просмотр журнала активности';

  @override
  String get permissionViewActivityLogDescription =>
      'Просмотр журнала активности сообщества, включая изменения и действия модерации.';

  @override
  String get permissionManageCommunity => 'Управление сообществом';

  @override
  String get permissionManageCommunityDescription =>
      'Изменение общих настроек: название, описание, значок.';

  @override
  String get permissionManageRoles => 'Управление ролями';

  @override
  String get permissionManageRolesDescription =>
      'Создание, изменение или удаление ролей ниже вашей высшей роли. Также позволяет изменять разрешения канала.';

  @override
  String get permissionManageChannels => 'Управление каналами';

  @override
  String get permissionManageChannel => 'Управление каналом';

  @override
  String get permissionManageChannelDescription =>
      'Переименовать и изменить настройки канала.';

  @override
  String get permissionManagePermissions => 'Управление разрешениями';

  @override
  String get permissionManagePermissionsDescription =>
      'Изменить разрешения для ролей и участников в этом канале.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Создавайте, изменяйте или удаляйте веб-хуки для этого канала.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Посмотреть список участников этого канала.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Управляйте ссылками-приглашениями для этого канала.';

  @override
  String get permissionOverwriteDeny => 'Отклонить';

  @override
  String get permissionOverwriteInherit => 'Нейтрально (наследовать)';

  @override
  String get permissionOverwriteAllow => 'Разрешить';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Используйте эти кнопки, чтобы быстро настроить все разрешения.';

  @override
  String get permissionManageChannelsDescription =>
      'Создавать, изменять или удалять каналы и категории.';

  @override
  String get permissionKickMembers => 'Исключать участников';

  @override
  String get permissionBanMembers => 'Банить участников';

  @override
  String get permissionCreateInviteLinks => 'Создавать пригласительные ссылки';

  @override
  String get permissionChangeOwnNickname => 'Изменить свой никнейм';

  @override
  String get permissionChangeOwnNicknameDescription => 'Изменить свой никнейм.';

  @override
  String get permissionManageNicknames => 'Управление никнеймами';

  @override
  String get permissionManageNicknamesDescription =>
      'Менять ники других участников.';

  @override
  String get permissionCreateEmojiStickers => 'Создавать эмодзи и стикеры';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Загружайте новые эмодзи и стикеры, а также управляйте своими творениями.';

  @override
  String get permissionManageEmojiStickers => 'Управление эмодзи и стикерами';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Редактировать или удалять эмодзи и стикеры, созданные другими участниками.';

  @override
  String get permissionManageWebhooks => 'Управление веб-хуками';

  @override
  String get permissionManageWebhooksDescription =>
      'Создание, изменение или удаление вебхуков.';

  @override
  String get permissionSendMessages => 'Отправлять сообщения';

  @override
  String get permissionSendTtsMessages => 'Отправлять сообщения TTS';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Отправлять сообщения голосом.';

  @override
  String get permissionManageMessages => 'Управление сообщениями';

  @override
  String get permissionManageMessagesDescription =>
      'Удалять сообщения других участников. Закрепление сообщений настраивается отдельно.';

  @override
  String get permissionPinMessages => 'Закреплять сообщения';

  @override
  String get permissionEmbedLinks => 'Встраивать ссылки';

  @override
  String get permissionAttachFiles => 'Прикреплять файлы';

  @override
  String get permissionMentionEveryone => 'Используйте @everyone/@here и @роль';

  @override
  String get permissionMentionEveryoneDescription =>
      'Упоминать всех или любую роль (даже если для роли не установлено разрешение на упоминание).';

  @override
  String get permissionUseExternalEmoji => 'Использовать внешние эмодзи';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Использовать эмодзи из других сообществ.';

  @override
  String get permissionUseExternalStickers => 'Использовать внешние стикеры';

  @override
  String get permissionAddReactions => 'Добавлять реакции';

  @override
  String get permissionAddReactionsDescription =>
      'Добавляйте новые реакции к сообщениям.';

  @override
  String get permissionBypassSlowmode => 'Обход медленного режима';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Игнорировать лимиты сообщений для каждого канала.';

  @override
  String get permissionTimeOutMembers => 'Временно отключать участников';

  @override
  String get permissionTimeOutMembersDescription =>
      'Запретить участникам отправлять сообщения, ставить реакции и присоединяться к голосовым чатам на определённое время.';

  @override
  String get permissionViewChannel => 'Просмотр канала';

  @override
  String get permissionViewChannelMembers => 'Просмотр участников канала';

  @override
  String get permissionViewChannelMembersDescription =>
      'Посмотреть список участников каналов в этом сообществе.';

  @override
  String get permissionConnect => 'Подключиться';

  @override
  String get permissionSpeak => 'Говорить';

  @override
  String get permissionStreamVideo => 'Транслировать видео';

  @override
  String get permissionUseVoiceActivity => 'Использовать активацию голосом';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Без этого разрешения будет работать только режим \"Нажми и говори\".';

  @override
  String get permissionPrioritySpeaker => 'Приоритетный докладчик';

  @override
  String get permissionMuteMembers => 'Отключать микрофоны участникам';

  @override
  String get permissionDeafenMembers => 'Отключать участникам звук';

  @override
  String get permissionMoveMembers => 'Перемещать участников';

  @override
  String get permissionMoveMembersDescription =>
      'Перетаскивайте участников между каналами, к которым у них есть доступ.';

  @override
  String get permissionSetVoiceRegion => 'Изменение голосового региона';

  @override
  String guildSettingsEmojiSlotInfo(int staticCount, int animatedCount) {
    return '$staticCount статических, $animatedCount анимированных слотов эмодзи использовано';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Пока нет пользовательских эмодзи.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count стикеров загружено';
  }

  @override
  String get guildSettingsStickersEmpty =>
      'Пока нет пользовательских стикеров.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Проверка участников';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Выберите, что должны иметь участники, прежде чем они смогут публиковать сообщения или отправлять личные сообщения участникам сообщества.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Участники с ролями могут обходить эти проверки. Для публичных пространств мы рекомендуем включить проверку.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Сообщества, перечисленные в разделе «Обзор», требуют как минимум подтвержденного адреса электронной почты. Невозможно выбрать «Нет», если включен раздел «Обзор».';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Контент для взрослых и предупреждения о контенте';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Настройте маркировку контента для взрослых и необязательные предупреждения о контенте для участников.';

  @override
  String get guildSettingsModerationMatureToggle => 'Контент для взрослых';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Отметьте это сообщество как содержащее контент для взрослых.';

  @override
  String get guildSettingsVerificationNone => 'Нет';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Проверка не требуется.';

  @override
  String get guildSettingsVerificationLow => 'Низкий';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Требуется подтвержденный адрес электронной почты.';

  @override
  String get guildSettingsVerificationMedium => 'Средний';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Требуется подтвержденный адрес электронной почты и учетная запись возрастом не менее 5 минут.';

  @override
  String get guildSettingsVerificationHigh => 'Высокий';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Требуется все из среднего, плюс членство в сообществе не менее 10 минут.';

  @override
  String get guildSettingsVerificationHighest => 'Очень высокий';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Требуется подтвержденный номер телефона.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Отслеживайте действия модераторов в сообществе.';

  @override
  String get guildSettingsAuditLogEmpty => 'Журналов пока нет';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Действия модераторов и изменения сообщества будут отображаться здесь.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Все пользователи';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Все действия';

  @override
  String get guildSettingsAuditLogNoReason => 'Причина не указана.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Неизвестный пользователь';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Произошла ошибка при загрузке журнала действий.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Не удалось загрузить журналы действий';

  @override
  String get guildSettingsAuditLogReason => 'Причина';

  @override
  String get guildSettingsAuditLogSomeone => 'кто-то';

  @override
  String get guildSettingsAuditLogSomething => 'что-то';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'неизвестный объект';

  @override
  String get guildSettingsAuditLogNothing => 'ничего';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Неизвестный объект';

  @override
  String get auditLogActionGuildUpdate => 'Сообщество обновлено';

  @override
  String get auditLogActionChannelCreate => 'Канал создан';

  @override
  String get auditLogActionChannelUpdate => 'Канал обновлен';

  @override
  String get auditLogActionChannelDelete => 'Канал удален';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Перезапись канала добавлена';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Перезапись канала обновлена';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Перезапись канала удалена';

  @override
  String get auditLogActionMemberKick => 'Участник исключен';

  @override
  String get auditLogActionMemberPrune => 'Участники удалены';

  @override
  String get auditLogActionMemberBanAdd => 'Участник заблокирован';

  @override
  String get auditLogActionMemberBanRemove => 'Участник разблокирован';

  @override
  String get auditLogActionMemberUpdate => 'Участник обновлен';

  @override
  String get auditLogActionMemberRoleUpdate => 'Роли участника обновлены';

  @override
  String get auditLogActionMemberMove => 'Участник перемещен';

  @override
  String get auditLogActionMemberDisconnect => 'Участник отключен';

  @override
  String get auditLogActionBotAdd => 'Бот добавлен';

  @override
  String get auditLogActionRoleCreate => 'Роль создана';

  @override
  String get auditLogActionRoleUpdate => 'Роль обновлена';

  @override
  String get auditLogActionRoleDelete => 'Роль удалена';

  @override
  String get auditLogActionInviteCreate => 'Приглашение создано';

  @override
  String get auditLogActionInviteUpdate => 'Приглашение обновлено';

  @override
  String get auditLogActionInviteDelete => 'Приглашение удалено';

  @override
  String get auditLogActionWebhookCreate => 'Вебхук создан';

  @override
  String get auditLogActionWebhookUpdate => 'Вебхук обновлен';

  @override
  String get auditLogActionWebhookDelete => 'Вебхук удален';

  @override
  String get auditLogActionEmojiCreate => 'Эмодзи создан';

  @override
  String get auditLogActionEmojiUpdate => 'Эмодзи обновлено';

  @override
  String get auditLogActionEmojiDelete => 'Эмодзи удалено';

  @override
  String get auditLogActionStickerCreate => 'Стикер создан';

  @override
  String get auditLogActionStickerUpdate => 'Стикер обновлен';

  @override
  String get auditLogActionStickerDelete => 'Стикер удален';

  @override
  String get auditLogActionMessageDelete => 'Сообщение удалено';

  @override
  String get auditLogActionMessageBulkDelete => 'Сообщения удалены';

  @override
  String get auditLogActionMessagePin => 'Сообщение закреплено';

  @override
  String get auditLogActionMessageUnpin => 'Сообщение откреплено';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor обновил(а) настройки сообщества.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor создал(а) канал $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor обновил(а) канал $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor удалил(а) канал $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor добавил(а) разрешения для канала $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor добавил(а) разрешения для канала $target в канале $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor обновил(а) разрешения для канала $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor обновил(а) разрешения для канала $target в канале $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor удалил(а) разрешения для канала $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor удалил(а) разрешения для канала $target в канале $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor исключил(а) $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor заблокировал(а) $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor разблокировал(а) $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor обновил(а) $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor обновил(а) роли для $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor удалил(а) неактивных участников.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor удалил(а) участников, неактивных в течение $days дней.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor переместил(а) $target в другой голосовой канал.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor переместил(а) $target в канал $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor отключил(а) $target от голосового канала.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor добавил(а) бота $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor создал(а) роль $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor обновил(а) роль $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor удалил(а) роль $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor создал(а) приглашение $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor создал(а) приглашение $target для канала $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor обновил(а) приглашение $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor обновил(а) приглашение $target для канала $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor удалил(а) приглашение $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor удалил(а) приглашение $target для канала $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor создал(а) вебхук $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor обновил(а) вебхук $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor удалил(а) вебхук $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor добавил(а) эмодзи $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor обновил(а) эмодзи $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor удалил(а) эмодзи $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor добавил(а) стикер $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor обновил(а) стикер $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor удалил(а) стикер $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor удалил(а) сообщение.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor удалил(а) сообщение в канале $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor удалил(а) несколько сообщений.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor удалил(а) $count сообщений.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor удалил(а) несколько сообщений в канале $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor удалил(а) $count сообщений в канале $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor закрепил(а) сообщение.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor закрепил(а) сообщение в канале $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor открепил(а) сообщение.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor открепил(а) сообщение в канале $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor выполнил(а) действие аудита над $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Обновлено $field с $oldValue на $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Установлено значение $field: $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Очищено поле $field (было $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Обновлено поле $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Сообщество переименовано в $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Значок сообщества обновлен.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Канал переименован в $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Тема очищена.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Тема обновлена: $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'Включен контент для взрослых.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Контент для взрослых отключен.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Установлен никнейм: $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Удален никнейм $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Участник заглушен.';

  @override
  String get auditLogChangeUnmutedMember => 'Участник разглушен.';

  @override
  String get auditLogChangeDeafenedMember => 'Участник отключен от звука.';

  @override
  String get auditLogChangeUndeafenedMember => 'Участник включен в звук.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Добавлены роли: $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Удалены роли: $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Канал: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Сообщение: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Приглашен(а) $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Удалено # сообщений.',
      one: 'Удалено # сообщение.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Удалено # участников.',
      one: 'Удален # участник.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'Это приглашение никогда не истечет.';

  @override
  String get auditLogOptionTemporaryMembership =>
      'Предоставляет временное членство.';

  @override
  String get auditLogOptionPermanentMembership =>
      'Предоставляет постоянное членство.';

  @override
  String get guildSettingsLoadMore => 'Загрузить еще';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Просматривайте вебхуки, настроенные для вашего сообщества, и управляйте ими.';

  @override
  String get guildSettingsWebhooksEmpty => 'Вебхуков нет';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'В этом сообществе пока нет веб-хуков. Перейдите в $channelSettingsPath, чтобы создать один.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'Чтобы просматривать и редактировать веб-хуки для этого сообщества, вам нужно разрешение \"$permission\".';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle =>
      'Не удалось загрузить вебхуки';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'Произошла ошибка при загрузке веб-хуков. Повторите попытку.';

  @override
  String get guildSettingsWebhooksUpdated => 'Вебхуки обновлены';

  @override
  String get guildSettingsWebhooksUpdateFailed =>
      'Не удалось обновить веб-хуки';

  @override
  String get guildSettingsUnknownChannel => 'Неизвестный канал';

  @override
  String get guildSettingsCopyUrl => 'Копировать URL';

  @override
  String get guildSettingsCopiedUrl => 'URL скопирован в буфер обмена';

  @override
  String get guildSettingsDeleteWebhook => 'Удалить веб-хук';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Задайте пользовательскую ссылку для приглашения на ваш сервер.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Сохранить';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Использование';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count использований';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Разместите сообщество в разделе \"Интересное\", чтобы другие могли его найти и присоединиться.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Недостаточно участников';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Вашему сообществу нужно как минимум $count участников, чтобы оно могло быть добавлено в Discovery.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Статус:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'В ожидании';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Одобрено';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Отклонено';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Удалено';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Причина: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'Ваше сообщество отображается в разделе \"Поиск\". Вы можете обновить информацию о нём ниже или удалить его из списка.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Ваша заявка находится на рассмотрении. Вы можете обновить данные объявления или отозвать заявку.';

  @override
  String get guildSettingsDiscoveryCategory => 'Категория';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Выберите категорию, которая лучше всего описывает ваше сообщество. Вы можете изменить ее в любое время.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Основной язык';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'Язык, на котором говорит большинство участников вашего сообщества. Используется для фильтрации результатов поиска.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Описание';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Опишите ваше сообщество';

  @override
  String get guildSettingsDiscoveryDescriptionRequired => 'Требуется описание.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'Описание должно быть не менее $minLength символов.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'Описание должно быть не длиннее $maxLength символов.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Пользовательские теги';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'До $maxTags тегов помогут людям найти ваше сообщество. Они отображаются в поиске Discovery.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'Добавьте тег и нажмите Enter';

  @override
  String get guildSettingsDiscoveryAddTag => 'Добавить';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Удалить тег $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle => 'Не удалось добавить тег';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'Теги должны содержать от 2 до $maxLength буквенно-цифровых символов.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'Вы можете добавить не более $maxTags тегов.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Применить';

  @override
  String get guildSettingsDiscoverySave => 'Сохранить';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Отозвать';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Заявка на вступление отправлена';

  @override
  String get guildSettingsDiscoveryListingUpdated => 'Список подборок обновлен';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Заявка на вступление отозвана';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Не удалось отозвать заявку';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Повторите попытку позже.';

  @override
  String get guildSettingsMembersDescription =>
      'Ищите и управляйте участниками сервера.';

  @override
  String get guildSettingsMembersSearchHint =>
      'Поиск по имени пользователя или ID';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count участников';
  }

  @override
  String get guildMembersRecentTitle => 'Недавние участники';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Показано $displayedCount из $totalCount участников';
  }

  @override
  String get guildMembersSort => 'Сортировать';

  @override
  String get guildSettingsMembersSortNewest => 'Сначала новые';

  @override
  String get guildMembersSortOldest => 'Сначала старые';

  @override
  String get guildMembersColumnName => 'Название';

  @override
  String get guildMembersColumnMemberSince => 'Участник с';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'Присоединился к $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Способ вступления';

  @override
  String get guildMembersColumnRoles => 'Роли';

  @override
  String get guildMembersColumnActions => 'Действия';

  @override
  String get guildMembersFilterMemberSince => 'Фильтровать по дате вступления';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Фильтровать по дате создания аккаунта';

  @override
  String get guildMembersFilterJoinMethod =>
      'Фильтровать по способу присоединения';

  @override
  String get guildMembersFilterRoles => 'Фильтровать по ролям';

  @override
  String get guildMembersFilterAll => 'Все';

  @override
  String get guildMembersFilterPast1Hour => 'За последний час';

  @override
  String get guildMembersFilterPast24Hours => 'Последние 24 часа';

  @override
  String get guildMembersFilterPast7Days => 'За 7 дней';

  @override
  String get guildMembersFilterPast2Weeks => 'Последние 2 недели';

  @override
  String get guildMembersFilterPast3Weeks => 'Последние 3 недели';

  @override
  String get guildMembersFilterPast4Weeks => 'Последние 4 недели';

  @override
  String get guildMembersFilterPast3Months => 'Последние 3 месяца';

  @override
  String get guildMembersFilterCustomRange => 'Выборочный диапазон...';

  @override
  String get guildMembersDateRangeTitle => 'Выбрать период';

  @override
  String get guildMembersDateAfter => 'После даты';

  @override
  String get guildMembersDateBefore => 'До даты';

  @override
  String get guildMembersClearAll => 'Очистить все';

  @override
  String get guildMembersRowsPerPage => 'Строк на странице';

  @override
  String get guildMembersEmptySearch => 'Ничего не найдено по этому запросу.';

  @override
  String get guildMembersLoadError =>
      'Не удалось загрузить участников. Повторите попытку позже.';

  @override
  String get guildMembersIndexing => 'Индексируем участников…';

  @override
  String get guildMembersGoToPage => 'Перейти на страницу';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'Перейти на страницу $page';
  }

  @override
  String get guildMembersJumpToPage => 'Перейти на страницу';

  @override
  String get guildMembersJoinSourceCreator => 'Создатель сообщества';

  @override
  String get guildMembersJoinSourceInvite => 'Пригласить';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Приглашение ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Пригласил(а) $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'URL сообщества';

  @override
  String get guildMembersJoinSourceBotInvite => 'Приглашение бота';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'Администратор платформы';

  @override
  String get guildMembersJoinSourceDiscovery => 'Поиск';

  @override
  String get guildMembersJoinMethodUnknown => 'Неизвестно';

  @override
  String get guildMembersCommunityOwner => 'Владелец сообщества';

  @override
  String get guildMembersViewAllRoles => 'Посмотреть все роли';

  @override
  String get guildMembersJoinedJustNow => 'Только что';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count минут назад',
      one: '1 минуту назад',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count часа назад',
      one: '1 час назад',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дней назад',
      one: '1 день назад',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Участники';

  @override
  String get guildMembersChannelListSelected => 'Участники, выбрано';

  @override
  String get guildSettingsInvitesTitle => 'Приглашения';

  @override
  String get guildSettingsInvitesDescription =>
      'Посмотреть все приглашения в это сообщество. Чтобы создать новое приглашение, перейдите в канал и используйте кнопку \"Пригласить\".';

  @override
  String get guildSettingsInvitesEmpty => 'Нет ссылок-приглашений';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'В этом сообществе пока нет ссылок-приглашений. Перейдите в канал и создайте приглашение, чтобы пригласить людей.';

  @override
  String get guildSettingsInvitesLoadFailedTitle =>
      'Не удалось загрузить приглашения';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Произошла ошибка при загрузке приглашений. Повторите попытку.';

  @override
  String get guildSettingsInvitesTryAgain => 'Повторить';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Показывать дату создания вместо даты истечения';

  @override
  String get guildSettingsInvitesPauseInvites => 'Приостановить приглашения';

  @override
  String get guildSettingsInvitesEnableInvites => 'Включить приглашения';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Приостановить приглашения в это сообщество';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Включить приглашения для этого сообщества';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Приостановить приглашения? Новые пользователи не смогут присоединиться по ссылкам-приглашениям, пока вы их снова не включите. На существующих участниках это не отразится.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Включить приглашения? Пользователи снова смогут присоединяться к сообществу по ссылкам-приглашениям.';

  @override
  String get guildSettingsInvitesPause => 'Пауза';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Приглашения для этого сообщества приостановлены.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Приглашения приостановлены, так как $productName обнаружил(-а) потенциальную рейдовую атаку. Новые пользователи пока не могут присоединиться.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Пригласил:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Канал:';

  @override
  String get guildSettingsInvitesLabelCode => 'Код:';

  @override
  String get guildSettingsInvitesLabelUses => 'Использует:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Создано:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Истекает:';

  @override
  String get guildSettingsInvitesUnknown => 'Неизвестно';

  @override
  String get guildSettingsInvitesNoCategory => 'Без категории';

  @override
  String get guildSettingsInvitesExpired => 'Истек срок действия';

  @override
  String get guildSettingsInvitesNever => 'Никогда';

  @override
  String get guildSettingsInvitesCopyLink => 'Скопировать ссылку-приглашение';

  @override
  String get guildSettingsInvitesRevoke => 'Отозвать приглашение';

  @override
  String get guildSettingsInvitesRevokeFailedTitle =>
      'Не удалось отозвать приглашение';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'Ссылка может быть все еще активна. Повторите попытку позже.';

  @override
  String guildSettingsInviteUses(int uses, int maxUses) {
    return '$uses / $maxUses использований';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Истекает $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Просматривайте и управляйте заблокированными пользователями.';

  @override
  String get guildSettingsBansSearchHint => 'Поиск блокировок';

  @override
  String get guildSettingsBansEmpty => 'Нет заблокированных пользователей.';

  @override
  String get guildSettingsBanPermanent => 'Постоянная блокировка';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Истекает $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Истекает';

  @override
  String get guildSettingsUnban => 'Разблокировать';

  @override
  String get guildSettingsBansLoading =>
      'Загрузка заблокированных пользователей';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Не найдено блокировок, соответствующих вашему поиску.';

  @override
  String get guildSettingsBanDetailsTitle => 'Сведения о блокировке';

  @override
  String get guildSettingsBanViewDetails => 'Посмотреть детали';

  @override
  String get guildSettingsBannedOn => 'Заблокирован';

  @override
  String get guildSettingsBannedBy => 'Заблокировал';

  @override
  String get guildSettingsRevokeBanTitle => 'Отменить блокировку';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Вы уверены, что хотите отменить блокировку для $displayName? Он сможет снова присоединиться к сообществу.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Блокировка для $displayName отменена';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Не удалось загрузить блокировки. Попробуйте еще раз.';

  @override
  String get guildSettingsRevokeBanError =>
      'Не удалось отменить блокировку. Попробуйте еще раз.';

  @override
  String get guildSettingsCommunitySettings => 'Настройки сообщества';

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
      'Управляйте профилем, каналами и настройками по умолчанию вашего сообщества.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Брендинг';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Обновите значок, название, баннер и фон приглашения';

  @override
  String get guildSettingsOverviewBannerUpload => 'Загрузить баннер';

  @override
  String get guildSettingsOverviewIdleTitle => 'Настройки бездействия';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Настройте AFK-канал и время ожидания';

  @override
  String get guildSettingsOverviewSystemTitle => 'Система и приветствие';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Выберите назначение для системных и приветственных сообщений';

  @override
  String get guildSettingsOverviewNotificationsTitle =>
      'Уведомления по умолчанию';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Сообщества с более чем 250 участниками принудительно переводятся на настройку «только упоминания». Ваша исходная настройка сохраняется и будет восстановлена, если сообщество опустится ниже 250 участников.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Дополнительно';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Разрешить гибкие названия текстовых каналов';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Скрыть корону владельца сообщества';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Отдельный баннер';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Отображает баннер в отдельном разделе под заголовком сообщества.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Загрузить значок';

  @override
  String get guildSettingsOverviewRemoveImage => 'Удалить';

  @override
  String get guildSettingsOverviewSplashTitle => 'Фон приглашения';

  @override
  String get guildSettingsOverviewEmbedSplashTitle =>
      'Фон встраиваемых сообщений';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Отображается во встраиваемых приглашениях в чате.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Загрузить фон';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'Нет баннера сообщества';

  @override
  String get guildSettingsOverviewNoInviteBackground => 'Нет фона приглашения';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Предпросмотр';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Посмотрите, как ваше приглашение выглядит для посетителей.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Названия текстовых каналов';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Корона владельца сообщества';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Настройте, будет ли значок короны отображаться рядом с владельцем сообщества';

  @override
  String get guildSettingsSplashCardAlignment => 'Выравнивание карточки';

  @override
  String get guildSettingsSplashAlignmentCenter => 'По центру';

  @override
  String get guildSettingsSplashAlignmentLeft => 'По левому краю';

  @override
  String get guildSettingsSplashAlignmentRight => 'По правому краю';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Применяется только на широких экранах.';

  @override
  String get permissionReadMessageHistory => 'Читать историю сообщений';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Изменить, что могут видеть пользователи без \"$permission\"';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Используйте отдельное окно для установки даты среза истории сообщений для участников, у которых нет разрешения $permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Открыть настройки среза истории сообщений';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Срез истории сообщений';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Включить срез истории сообщений';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Дата среза';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Участники без разрешения «Читать историю сообщений» смогут просматривать сообщения, отправленные после этой даты.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Срез истории сообщений обновлен';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Разрешить заглавные буквы и пробелы в названиях текстовых каналов. При отключении названия ограничиваются строчными буквами с дефисами и подчеркиваниями.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Скрывает значок короны рядом с владельцем сообщества на всех поверхностях.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Анимированные значки требуют функции сообщества «Анимированный значок».';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Анимированные баннеры требуют функции сообщества «Анимированный баннер».';

  @override
  String get guildSettingsAfkChannel => 'AFK / неактивный канал';

  @override
  String get guildSettingsAfkChannelHint =>
      'Перемещать участников в этот канал, когда они неактивны.';

  @override
  String get guildSettingsNoAfkChannel => 'Нет AFK-канала';

  @override
  String get guildSettingsAfkTimeout => 'Тайм-аут AFK';

  @override
  String get guildSettingsAfkTimeout1Min => '1 минута';

  @override
  String get guildSettingsAfkTimeout5Min => '5 минут';

  @override
  String get guildSettingsAfkTimeout15Min => '15 минут';

  @override
  String get guildSettingsAfkTimeout30Min => '30 минут';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 час';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds секунд';
  }

  @override
  String get guildSettingsSystemChannel => 'Канал назначения';

  @override
  String get guildSettingsSystemChannelHint =>
      'Приветственные и системные сообщения будут появляться здесь.';

  @override
  String get guildSettingsNoSystemChannel => 'Нет системного канала';

  @override
  String get guildSettingsHideJoinMessages => 'Скрыть сообщения о входе';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Подавляет сообщения о входе в целевой канал.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Настройки уведомлений по умолчанию';

  @override
  String get guildSettingsNotificationsAll => 'Все сообщения';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Уведомлять обо всех сообщениях';

  @override
  String get guildSettingsNotificationsMentions => 'Только упоминания';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Уведомлять только об упоминаниях';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Макс. 10 МБ. Минимум: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Макс. 10 МБ. Минимум: 960×540px (16:9). Отображается во встраиваемых приглашениях в чате.';

  @override
  String get guildSettingsModerationDescription =>
      'Настройте параметры проверки, фильтрации контента и контента для взрослых.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Сообщества, перечисленные в Discovery, имеют ограниченные возможности модерации.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Фильтрация контента';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Автоматически проверяйте сообщения на наличие откровенного контента в каналах, не помеченных как содержащие контент для взрослых.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Сообщества, перечисленные в Discovery, обязаны сканировать всех участников. Этот параметр нельзя изменить, пока включен Discovery.';

  @override
  String get guildSettingsContentFilterOff => 'Выкл.';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Предоставьте сообществу возможность самомодерации';

  @override
  String get guildSettingsContentFilterNoRole =>
      'Фильтровать участников без ролей';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Рекомендуется для большинства сообществ';

  @override
  String get guildSettingsContentFilterAll => 'Фильтровать всех';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Максимальная защита для семейных пространств';

  @override
  String get guildSettingsModerationMatureOff => 'Выкл.';

  @override
  String get guildSettingsModerationMatureOn => 'Вкл.';

  @override
  String get guildSettingsContentWarningToggle =>
      'Показывать предупреждение о контенте';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Включает запрос согласия перед входом в любой канал.';

  @override
  String get guildSettingsContentWarningText =>
      'Пользовательский текст предупреждения';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Это содержит конфиденциальный контент.';

  @override
  String get guildSettingsModeration2faTitle => 'Требование 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'Требовать двухфакторную аутентификацию для модераторов, прежде чем они смогут банить, исключать, временно блокировать или удалять сообщения.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Требовать 2FA для действий модерации';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Только владелец сообщества может изменить этот параметр';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Включите 2FA в своей учетной записи, чтобы изменить этот параметр';

  @override
  String get guildSettingsEmojiSearchHint => 'Поиск эмодзи';

  @override
  String get guildSettingsEmojiUploadTitle => 'Загрузить эмодзи';

  @override
  String get guildSettingsEmojiSlotsTitle => 'Слоты для эмодзи';

  @override
  String get guildSettingsEmojiDropZone => 'Перетащите файлы эмодзи сюда';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Не удалось загрузить эмодзи. Повторите попытку позже.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'Не найдено эмодзи по вашему запросу.';

  @override
  String get guildSettingsEmojiNoSlots => 'Нет свободных слотов для эмодзи';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Вы достигли максимального количества эмодзи. Удалите некоторые из существующих эмодзи, чтобы освободить место.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Названия эмодзи должны содержать как минимум 2 символа и могут использовать буквы, цифры и знаки подчеркивания. Размер эмодзи должен быть менее $maxSize. Статические изображения автоматически изменяются до размера 128x128 пикселей и сжимаются. Анимированные эмодзи и SVG должны уже соответствовать этим требованиям.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'Загрузка эмодзи';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# эмодзи',
      one: '# эмодзи',
    );
    return 'Загрузка $_temp0. Это может занять некоторое время.';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'Не удалось загрузить эмодзи. Повторите попытку.';

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Некоторые эмодзи не удалось добавить';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'Проверьте эти файлы и повторите попытку с изображениями меньшего размера или более простыми.';

  @override
  String get guildSettingsEmojiRenameTitle => 'Переименовать эмодзи';

  @override
  String get guildSettingsEmojiRenameHint =>
      'От 2 до 32 символов, буквы, цифры, нижнее подчеркивание.';

  @override
  String get guildSettingsEmojiColumnEmoji => 'Эмодзи';

  @override
  String get guildSettingsEmojiColumnName => 'Название';

  @override
  String get guildSettingsEmojiColumnUploader => 'Загружено';

  @override
  String get guildSettingsEmojiUnknownUploader => 'Неизвестно';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Удалить эмодзи';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'Удалить эмодзи :$name:? Это действие нельзя будет отменить.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Удалить эмодзи из хранилища и CDN';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'Название эмодзи должно содержать не менее 2 символов';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'Название эмодзи не может быть длиннее 32 символов';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Недопустимое имя эмодзи';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Не удалось переименовать эмодзи';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'Имя было возвращено к предыдущему. Пожалуйста, попробуйте еще раз через некоторое время.';

  @override
  String get guildSettingsEmojiGoneTitle => 'Этого эмодзи больше нет';

  @override
  String get guildSettingsEmojiGoneBody =>
      'Возможно, оно было удалено. Название вернулось к прежнему.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'Вы не можете переименовать этот эмодзи';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'У вас нет разрешения на переименование этого эмодзи. Имя было возвращено к предыдущему.';

  @override
  String get guildSettingsEmojiRateLimitedTitle => 'Слишком быстро';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'Пожалуйста, подождите немного и попробуйте переименовать ещё раз.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle => 'Не удалось удалить эмодзи';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'Вы не можете удалить этот эмодзи';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'Разрешить другим копировать ваши эмодзи';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'Если включено, участники других сообществ смогут использовать ярлык \"Клонировать\" в приложении для ваших эмодзи. Это не помешает им сохранить изображение и загрузить его самостоятельно.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Разрешить другим клонировать ваши стикеры';

  @override
  String get guildSettingsCloneStickerDescription =>
      'Если включено, участники других сообществ смогут использовать внутриигровую кнопку \"Клонировать\" для ваших стикеров. Это не помешает им сохранить изображение и загрузить его самостоятельно.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Только участники с разрешением \"$permission\" могут это изменить.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'Не удалось обновить настройку клонирования эмодзи';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Не удалось обновить настройки клонирования стикеров';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Неанимированные эмодзи ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Анимированные эмодзи ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Поиск стикеров';

  @override
  String get guildSettingsStickerSlotsTitle => 'Слоты для стикеров';

  @override
  String get guildSettingsStickerUploadTitle => 'Загрузить стикер';

  @override
  String get guildSettingsStickerDropZone =>
      'Перетащите сюда файл стикера (по одному)';

  @override
  String get guildSettingsStickerDensity => 'Плотность стикеров';

  @override
  String get guildSettingsStickerDensityCozy => 'Уютные';

  @override
  String get guildSettingsStickerDensityCompact => 'Компактный';

  @override
  String get guildSettingsStickersLoadFailedTitle =>
      'Не удалось загрузить стикеры';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Произошла ошибка при загрузке стикеров. Попробуйте ещё раз.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Стикеры по вашему запросу не найдены.';

  @override
  String get guildSettingsStickersEmptySearch => 'Стикеры не найдены';

  @override
  String get guildSettingsStickerNoSlots => 'Нет доступных слотов для стикеров';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Вы достигли максимального количества стикеров. Удалите некоторые из существующих стикеров, чтобы освободить место.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Стикеры сохраняются в формате 320x320 пикселей и должны быть меньше $maxSize. Статические изображения автоматически изменяются и сжимаются. Анимированные стикеры и SVG должны уже соответствовать этим требованиям.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle =>
      'Неподдерживаемый файл стикера';

  @override
  String get guildSettingsStickerAddTitle => 'Добавить стикер';

  @override
  String get guildSettingsStickerEditTitle => 'Изменить стикер';

  @override
  String get guildSettingsStickerNameLabel => 'Название';

  @override
  String get guildSettingsStickerNameHint => 'Мой классный стикер';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Описание';

  @override
  String get guildSettingsStickerDescriptionHint => 'Опишите стикер';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Теги ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Добавить тег';

  @override
  String get guildSettingsStickerTagAdd => 'Добавить';

  @override
  String get guildSettingsStickerNameRequired => 'Укажите название';

  @override
  String get guildSettingsStickerNameTooShort =>
      'Имя должно содержать не менее 2 символов';

  @override
  String get guildSettingsStickerNameTooLong =>
      'Имя должно быть не длиннее 30 символов';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'Описание должно быть не более 500 символов';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'Не удалось создать стикер';

  @override
  String get guildSettingsStickerTooLargeTitle => 'Стикер слишком большой';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'Не удалось достаточно сжать стикер';

  @override
  String get guildSettingsStickerDeleteTitle => 'Удалить стикер';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'Удалить «$name»? Это действие нельзя отменить.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Удалить этот стикер из хранилища и CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Не удалось удалить стикер';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'Вы не можете удалить эту стикер';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Чтобы создать вебхук, откройте $channelSettingsPath. Вы можете редактировать и упорядочивать все существующие вебхуки здесь.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'Ваш пользовательский URL не будет работать, если хотя бы один канал не будет виден всем.';

  @override
  String get guildSettingsVanityUrlRemove => 'Удалить';

  @override
  String get guildSettingsBannedUsersTitle => 'Заблокированные пользователи';

  @override
  String get guildSettingsInvitesTableInviter => 'Пригласивший';

  @override
  String get guildSettingsInvitesTableChannel => 'Канал';

  @override
  String get guildSettingsInvitesTableCode => 'Код';

  @override
  String get guildSettingsInvitesTableUses => 'Использования';

  @override
  String get guildSettingsInvitesTableCreated => 'Создано';

  @override
  String get guildSettingsInvitesTableExpires => 'Истекает';

  @override
  String get guildSettingsAuditLogFilterUser => 'Фильтр по пользователю';

  @override
  String get guildSettingsAuditLogFilterAction => 'Фильтр по действию';

  @override
  String get createDm => 'Создать чат';

  @override
  String get createGroupDm => 'Создать групповой чат';

  @override
  String get createDmNewMessage => 'Новое сообщение';

  @override
  String get createDmSelectFriends => 'Выбрать друзей';

  @override
  String get createDmChooseFriendsSubtitle => 'Выберите друзей для переписки.';

  @override
  String get createDmSearchFriends => 'Поиск друзей';

  @override
  String get createDmNoFriendsFound => 'Друзья не найдены';

  @override
  String get createDmNoFriendsYet => 'У вас пока нет друзей';

  @override
  String get createDmClaimToStartDms =>
      'Чтобы начать личные сообщения, подтвердите свою учётную запись.';

  @override
  String get createDmVerifyToStartDms =>
      'Подтвердите эл. почту, чтобы начать личные сообщения.';

  @override
  String get createDmVerifyYourEmail => 'Подтвердите почту';

  @override
  String get createDmNewGroup => 'Новая группа';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Создать новую группу с $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'Подтвердите новую группу';

  @override
  String get createDmCreateNewGroup => 'Создать новую группу';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'Удалить $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'У вас уже есть группа с этими пользователями. Вы действительно хотите создать новую? Это тоже нормально!';

  @override
  String get createDmNoActivityYet => 'Пока нет активности';

  @override
  String get createDmSomeUsersCantBeAdded =>
      'Некоторых пользователей нельзя добавить';

  @override
  String get createDmCreateWithoutThem => 'Создать без них';

  @override
  String get createDmUnaddableIntro =>
      'Этих людей нельзя добавить в групповой чат:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Создать групповой DM с оставшимися $count участниками и пропустить остальных?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Не осталось получателей для создания группового чата.';

  @override
  String get createDmUnaddableUserNotFound => 'Пользователь не найден';

  @override
  String get createDmUnaddableBlocked =>
      'Вы не можете отправить сообщение этому пользователю';

  @override
  String get createDmUnaddableNotFriends => 'Не в списке друзей';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Нельзя добавить в групповые чаты';

  @override
  String get createDmFailed => 'Не удалось создать беседу. Попробуйте ещё раз.';

  @override
  String get dmListMessagesTitle => 'Сообщения';

  @override
  String get dmListDirectMessagesTitle => 'Личные сообщения';

  @override
  String get keybindsSearchShortcuts => 'Поиск сочетаний клавиш';

  @override
  String get keybindSectionDefaults => 'По умолчанию';

  @override
  String get keybindSectionMessages => 'Сообщения';

  @override
  String get keybindSectionNavigation => 'Навигация';

  @override
  String get keybindSectionDragAndDrop => 'Перетащить';

  @override
  String get keybindSectionChat => 'Чат';

  @override
  String get keybindSectionVoiceAndVideo => 'Голос и видео';

  @override
  String get keybindSectionMisc => 'Разное';

  @override
  String get keybindActionShowShortcutsList => 'Показать список быстрых клавиш';

  @override
  String get keybindActionCopyText => 'Копировать текст';

  @override
  String get keybindActionMarkUnread => 'Отметить как непрочитанное';

  @override
  String get keybindActionFocusTextarea => 'Перейти к полю ввода';

  @override
  String get keybindActionSwitchCommunities =>
      'Переключиться между сообществами';

  @override
  String get keybindActionSwitchChannels => 'Переключиться между каналами';

  @override
  String get keybindActionHistoryBack =>
      'Перейти к предыдущему каналу в истории просмотров';

  @override
  String get keybindActionHistoryForward =>
      'Перейти вперёд по истории просмотренных каналов';

  @override
  String get keybindActionJumpUnreadChannels =>
      'Переход между непрочитанными каналами';

  @override
  String get keybindActionJumpMentionChannels =>
      'Перейти к непрочитанным каналам с упоминаниями';

  @override
  String get keybindActionJumpCurrentCall => 'Перейти к текущему звонку';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Переключиться между последним сообществом и личными сообщениями';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Переключиться на предыдущее сообщество или чаты';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Переключиться на следующее сообщество или чаты';

  @override
  String get keybindActionGoToDms => 'Перейти в личные сообщения';

  @override
  String get keybindActionGoToFirstCommunity => 'Перейти к первому сообществу';

  @override
  String get keybindActionGoToSecondCommunity =>
      'Перейти ко второму сообществу';

  @override
  String get keybindActionGoToThirdCommunity => 'Перейти к третьему сообществу';

  @override
  String get keybindActionGoToFourthCommunity =>
      'Перейти в четвёртое сообщество';

  @override
  String get keybindActionGoToFifthCommunity => 'Перейти к пятому сообществу';

  @override
  String get keybindActionGoToSixthCommunity => 'Перейти к шестому сообществу';

  @override
  String get keybindActionGoToSeventhCommunity =>
      'Перейти к седьмому сообществу';

  @override
  String get keybindActionGoToEighthCommunity =>
      'Перейти к восьмому сообществу';

  @override
  String get keybindActionToggleQuickSwitcher =>
      'Переключить быстрое переключение';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'Создать или присоединиться к сообществу';

  @override
  String get keybindActionStartDragAndDrop => 'Начать перетаскивание';

  @override
  String get keybindActionMove => 'Переместить';

  @override
  String get keybindActionDropItem => 'Бросить предмет';

  @override
  String get keybindActionCancel => 'Отмена';

  @override
  String get keybindActionMarkCommunityRead =>
      'Отметить сообщество как прочитанное';

  @override
  String get keybindActionMarkChannelRead => 'Отметить канал как прочитанный';

  @override
  String get keybindActionStartGroupDm => 'Создать групповой чат';

  @override
  String get keybindActionTogglePinnedMessages => 'Закреплённые сообщения';

  @override
  String get keybindActionToggleInbox => 'Переключить входящие';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Отметить верхний канал входящих как прочитанный';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Отметить все чаты как прочитанные';

  @override
  String get keybindActionToggleMemberList =>
      'Переключить список участников или голосовой чат';

  @override
  String get keybindActionToggleEmojiPicker => 'Открыть/закрыть панель эмодзи';

  @override
  String get keybindActionToggleGifPicker => 'Открыть/закрыть панель GIF';

  @override
  String get keybindActionToggleStickerPicker => 'Открыть/закрыть стикеры';

  @override
  String get keybindActionScrollChatUp => 'Прокрутить чат вверх';

  @override
  String get keybindActionScrollChatDown => 'Прокрутить чат вниз';

  @override
  String get keybindActionJumpOldestUnread =>
      'Перейти к самому старому непрочитанному сообщению';

  @override
  String get keybindActionFocusComposer => 'Перейти к полю ввода';

  @override
  String get keybindActionUploadFile => 'Загрузить файл';

  @override
  String get keybindActionCopyChannelLink => 'Скопировать ссылку на канал';

  @override
  String get keybindActionToggleSavedMedia => 'Переключить сохраненные медиа';

  @override
  String get keybindActionSendVoiceMessage => 'Отправить голосовое сообщение';

  @override
  String get keybindActionAnswerCall => 'Ответить на входящий звонок';

  @override
  String get keybindActionDeclineCall => 'Отклонить входящий звонок';

  @override
  String get keybindActionStartDmCall =>
      'Начать звонок в личном или групповом чате';

  @override
  String get keybindActionToggleSoundboard => 'Включить/выключить деку';

  @override
  String get keybindActionToggleCompactCallView =>
      'Развернуть или свернуть компактный вид звонка';

  @override
  String get keybindActionPushToTalkPriority => 'Нажми и говори (приоритет)';

  @override
  String get keybindActionVoiceActivityPriority =>
      'Приоритет голосовой активности';

  @override
  String get keybindActionOpenHelp => 'Открыть справку';

  @override
  String get keybindActionSearchMessages => 'Искать сообщения';

  @override
  String get keybindActionOpenContextMenu => 'Открыть контекстное меню';

  @override
  String get keybindActionOpenSettings => 'Открыть настройки';

  @override
  String get keybindActionOpenThemeStudio =>
      'Открыть всплывающее окно студии тем';

  @override
  String get keybindActionZoomIn => 'Увеличить';

  @override
  String get keybindActionZoomOut => 'Уменьшить';

  @override
  String get keybindActionZoomReset => 'Сбросить масштаб';

  @override
  String get clipboardPasteFailed =>
      'Не удалось вставить. Буфер обмена пуст или заблокирован для этого приложения.';

  @override
  String get homeQuickActionDms => 'Личные сообщения';
}
