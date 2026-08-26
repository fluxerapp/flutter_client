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
      'Серверы работают некорректно.\nПостараемся исправить в ближайшее время!';

  @override
  String get gatewayReconnectingToast => 'Переподключение…';

  @override
  String get gatewayConnectedToast => 'Подключено';

  @override
  String get sessionExpiredToast =>
      'Your session has expired. Please sign in again.';

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
  String get systemPermissionMicrophoneMessage =>
      'Fluxer doesn\'t have access to your microphone. You can enable it in your device privacy settings.';

  @override
  String get systemPermissionCameraMessage =>
      'Fluxer doesn\'t have access to your camera. You can enable it in your device privacy settings.';

  @override
  String get systemPermissionPhotosMessage =>
      'Fluxer doesn\'t have access to your photo library. You can enable it in your device privacy settings.';

  @override
  String get systemPermissionNotificationsMessage =>
      'Fluxer doesn\'t have permission to send notifications. You can enable it in your device settings.';

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
      'Your account request is pending approval. You can sign in after an admin approves it.';

  @override
  String get registerClosed =>
      'Registration is currently closed. Use a registration link from an admin to create an account.';

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
  String get embedInviteJoinGroup => 'Join group';

  @override
  String get embedInviteAlreadyJoined => 'Already joined';

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
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

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
  String get notificationUseCategoryDefault => 'Use Category Default';

  @override
  String get notificationUseCommunityDefault => 'Use Community Default';

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
  String get dmDeleteMyMessagesTitle =>
      'Delete your messages in this conversation?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'This will permanently delete every message you have ever sent in this conversation. This cannot be undone.';

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
  String get dmEditGroup => 'Редактировать группу';

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
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
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
  String get dmDebugCategory => 'Debug Category';

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
      'Verify your email before sending friend requests.';

  @override
  String get addFriendFriendsListFull =>
      'Your friends list is full, or theirs is. Remove someone and try again.';

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
  String get externalLinkWarningLeaving => 'Вы собираетесь покинуть Fluxer';

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
  String get profilePreviewMemberSince => 'Участник Fluxer с';

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
  String get securityLoginEmailSectionDescription =>
      'Управляйте адресом электронной почты, который вы используете для входа в Fluxer';

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
      'Введите ваш номер телефона. Мы отправим вам SMS с кодом подтверждения.';

  @override
  String get phoneAddSendCode => 'Отправить код';

  @override
  String get phoneVerifyTitle => 'Подтверждение номера телефона';

  @override
  String get phoneVerifyDescription =>
      'Введите код подтверждения, отправленный на ваш номер телефона.';

  @override
  String get phoneAddSuccess => 'Номер телефона добавлен';

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
  String get requiredActionIntroGeneric =>
      'Complete the required verification to continue using Fluxer.';

  @override
  String get requiredActionIntroPhone =>
      'Your registration needs an extra anti-spam check before you can continue.';

  @override
  String get requiredActionIntroEmailOrPhone =>
      'Verify your email or phone to continue using Fluxer.';

  @override
  String get requiredActionIntroEmailAndPhone =>
      'Complete the required email and phone verification steps below to continue using Fluxer.';

  @override
  String get requiredActionChooseMethodTitle => 'Choose a verification method';

  @override
  String get requiredActionChooseMethodDescription =>
      'Complete one of the verification paths below to continue using Fluxer.';

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
  String get networkErrorMessage => 'Something went wrong. Please try again.';

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
  String get relativeTimeJustNow => 'только что';

  @override
  String get authorizedAppsTitle => 'Авторизованные приложения';

  @override
  String get authorizedAppsDescription =>
      'Эти приложения получили доступ к вашей учетной записи Fluxer.';

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
  String get userProfileLoading => 'Loading profile';

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
  String get userProfileStaffBadgeTooltip => 'Сотрудник Fluxer';

  @override
  String get userProfileCtpBadgeTooltip => 'Команда сообщества Fluxer';

  @override
  String get userProfilePartnerBadgeTooltip => 'Партнер Fluxer';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Охотник за ошибками Fluxer';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Plutonium Fluxer';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Подписчик Plutonium Fluxer с $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Визионер Fluxer';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Визионер Fluxer с $date';
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
      'Удерживайте для записи. Перетащите вверх, чтобы заблокировать, или отпустите для отправки.';

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
  String get voiceMessageSeekForward => 'Seek forward';

  @override
  String get voiceMessageSeekBackward => 'Seek backward';

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
  String get chatAttachmentDownloadedToast => 'Saved to photos';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Couldn\'t download attachment';

  @override
  String get chatAttachmentExpiredTooltip => 'Вложение истекло';

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
  String get chatAttachmentSourceBrowse => 'Обзор файлов';

  @override
  String get chatAttachmentPasteTooltip =>
      'Вставить изображение из буфера обмена';

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
  String get connectionsDescription =>
      'Свяжите внешние учетные записи и домены с вашим профилем Fluxer. Подтвержденные подключения будут отображаться в вашем профиле для других.';

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
  String get lookAndFeelChatFontScalingTitle => 'Масштабирование шрифта чата';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Настройте размер шрифта в области чата.';

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
  String get lookAndFeelCollapseDMsLabel => 'Свернуть ЛС в папку';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'Когда включено, непрочитанные ЛС в боковой панели сервера сворачиваются в папку на кнопке Fluxer. Нажмите кнопку Fluxer, находясь на странице ЛС, чтобы развернуть или свернуть папку.';

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
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'При прямой загрузке в Fluxer';

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
  String get messagesMediaCameraUploadsSectionTitle => 'Camera uploads';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Choose whether photos and videos taken with the in-app camera are kept on your device';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel => 'Save to device';

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
  String get accessibilityScreenReaderGroupTitle => 'Screen reader';

  @override
  String get accessibilityScreenReaderGroupDescription =>
      'Control how Fluxer works with screen readers.';

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
  String get voiceJoinFailedTitle => 'Couldn\'t Join Voice';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Couldn\'t disconnect your other devices. Try again in a moment.';

  @override
  String get voiceChannelEmptyDescription =>
      'Это голосовой канал. Подключитесь, чтобы начать говорить!';

  @override
  String get voiceChannelJoin => 'Подключиться к голосовому каналу';

  @override
  String get voiceCallJoin => 'Join call';

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
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'Демонстрация экрана';

  @override
  String get voiceScreenShareNotificationText => 'Демонстрация вашего экрана.';

  @override
  String get voiceControlMore => 'Еще';

  @override
  String get voiceControlDisconnect => 'Отключиться';

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
  String get chatReactionAddFailed => 'Failed to add reaction';

  @override
  String get chatReactionRemoveFailed => 'Failed to remove reaction';

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
  String get iarReasonOtherDescription =>
      'Используйте только в том случае, если это явно нарушает правила Fluxer и не подходит под другие категории.';

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
  String get chatMessageDeleteAttachment => 'Delete Attachment';

  @override
  String get chatMessageEditAttachmentAltText => 'Edit Alt Text';

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
  String get chatReplyMentionOn => 'Вкл.';

  @override
  String get chatReplyMentionOff => 'Выкл.';

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
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

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
    return 'Attachment $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Dismiss';

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
  String get personalNotesTitle => 'Личные заметки';

  @override
  String get personalNotesSubtitle =>
      'Ваше личное пространство для мыслей и напоминаний';

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
  String get userSettingsSearchPlaceholder => 'Search settings...';

  @override
  String get userSettingsSearchFieldLabel => 'Search settings';

  @override
  String get userSettingsSearchClear => 'Clear search';

  @override
  String get userSettingsSearchNoResults => 'No settings found';

  @override
  String get userSettingsNavProfile => 'Профиль';

  @override
  String get userSettingsNavSecurityLogin => 'Безопасность и вход';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Подарки и коды';

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
  String get userSettingsNavLanguageAndTime => 'Язык и время';

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
  String get userSettingsNavAdvanced => 'Дополнительно';

  @override
  String get advancedPerformanceReportingTitle => 'Отчеты о производительности';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Помогите улучшить Fluxer, делясь анонимными данными о сбоях и производительности.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Отправлять отчеты о сбоях и производительности';

  @override
  String get advancedPerformanceReportingDescription =>
      'Все отправляемые данные анонимны и отправляются только на собственный мониторинговый сервис Fluxer — сторонние поставщики не используются.';

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
  String get savedMessagesEmptyTitle => 'No bookmarks';

  @override
  String get savedMessagesEmptyBody =>
      'Bookmark messages to save them for later.';

  @override
  String get savedMessagesEndBody => 'There\'s nothing more to see here.';

  @override
  String get savedMessagesRemoveTooltip => 'Remove bookmark';

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
    return 'This will notify $count members with the $roleName role. Continue?';
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
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

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
  String get guildNavbarStaffOnlyAccessible =>
      'Доступно только сотрудникам Fluxer';

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
  String get guildMenuSettingsEmoji => 'Пользовательские эмодзи';

  @override
  String get guildMenuSettingsStickers => 'Пользовательские стикеры';

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
  String get guildMenuSettingsInviteLinks => 'Ссылки-приглашения';

  @override
  String get guildMenuSettingsBans => 'Баны';

  @override
  String get guildMenuSettingsChannels => 'Channels';

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
      'Управление веб-хуками, которые отправляют сообщения в каналы.';

  @override
  String get guildSettingsWebhooksEmpty => 'Веб-хуки не настроены.';

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
      'Подайте заявку на размещение в поиске серверов.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Not enough members';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Требуется минимум $count участника для подачи заявки.';
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
  String get guildSettingsDiscoveryCategory => 'Категория';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Choose the category that best describes your community. You can change this any time.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Primary language';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'The language most of your community speaks. Used to filter Discovery results.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Описание';

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
  String get guildSettingsDiscoveryTagsHint => 'игры, искусство, музыка';

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
  String get guildSettingsDiscoveryApply => 'Отправить заявку';

  @override
  String get guildSettingsDiscoverySave => 'Save';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Отозвать';

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
      'Ищите и управляйте участниками сервера.';

  @override
  String get guildSettingsMembersSearchHint => 'Поиск участников';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count участников';
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
  String get guildSettingsMembersSortNewest => 'Сначала новые';

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
      'Просматривайте и отзывайте активные ссылки-приглашения.';

  @override
  String get guildSettingsInvitesEmpty => 'Нет активных приглашений.';

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
    return 'Неанимированные эмодзи ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Анимированные эмодзи ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Поиск стикеров';

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
    return 'Создавайте вебхуки из настроек канала. Редактируйте их здесь.';
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
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsAuditLogFilterUser => 'Фильтр по пользователю';

  @override
  String get guildSettingsAuditLogFilterAction => 'Фильтр по действию';

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
