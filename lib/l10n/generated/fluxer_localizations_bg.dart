// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class FluxerLocalizationsBg extends FluxerLocalizations {
  FluxerLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get reconnectingTitle => 'Сбъркахме!';

  @override
  String get reconnectingBody =>
      'Нещо не е наред с инстанцията.\nТрябва да се оправи за секунда!';

  @override
  String get gatewayReconnectingToast => 'Свързване отново…';

  @override
  String get gatewayConnectedToast => 'Свързан';

  @override
  String get sessionExpiredToast =>
      'Вашата сесия е изтекла. Моля, влезте отново.';

  @override
  String splashStartupFailed(String error) {
    return 'Неуспешно стартиране: $error';
  }

  @override
  String get retry => 'Опитай отново';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Връзката е изгубена';

  @override
  String get splashViewOnStatusPage => 'Преглед на страницата за състоянието';

  @override
  String get splashConnectionIssuesPrompt => 'Проблеми с връзката?';

  @override
  String get splashStatusPageLink => 'Страница със състоянието';

  @override
  String get splashReadIncident => 'Прочети инцидента';

  @override
  String get splashIncidentHistory => 'История на инцидентите';

  @override
  String get nagbarLearnMore => 'Научи повече';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'Планирана е поддръжка за $localizedTime. Очаквана продължителност: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Извършва се поддръжка. Очаквана продължителност: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'Поддръжката приключи.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Здравей, $displayName, заяви акаунта си, за да не загубиш достъп.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Здравей, $displayName, потвърди имейл адреса си.';
  }

  @override
  String get nagbarOpenSettings => 'Отваряне на настройките';

  @override
  String get systemPermissionSettingsTitle => 'Разреши разрешение';

  @override
  String get systemPermissionSettingsOpenSettings => 'Отваряне на настройките';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName няма достъп до микрофона ви. Можете да го активирате в настройките за поверителност на устройството си.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName няма достъп до камерата ви. Можете да я активирате в настройките за поверителност на устройството си.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName няма достъп до вашата библиотека със снимки. Можете да я активирате в настройките за поверителност на устройството си.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName няма разрешение за изпращане на известия. Можете да го активирате в настройките на устройството си.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Абонаментът ви не беше подновен, но все още имате достъп до предимствата на $productName до $graceDate. Предприемете действия сега, за да не загубите всички предимства.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Вашият абонамент за $productName е изтекъл. Подновете сега, за да запазите предимствата си.';
  }

  @override
  String get nagbarManageSubscription => 'Управление на абонамента';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Добре дошли в $productFullName. Разгледайте предимствата на $productName и управлявайте абонамента си.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'Вижте функциите на $productName';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'Имате нов код за подарък, който чака в инвентара ви с подаръци.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'Имате $count нови кода за подаръци, които чакат в инвентара ви с подаръци.';
  }

  @override
  String get nagbarViewGiftInventory => 'Преглед на инвентара с подаръци';

  @override
  String get nagbarVisionaryMfa =>
      'Активирайте двуфакторна автентикация, за да защитите своя Visionary акаунт.';

  @override
  String get nagbarEnableMfa => 'Активирай 2FA';

  @override
  String get nagbarTermsAcceptance =>
      'Актуализирахме нашите условия. Моля, прегледайте ги и ги приемете, за да продължите.';

  @override
  String get nagbarReviewTerms => 'Преглед на условията';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Присъедини се към $communityName, за да разговаряш с екипа и да си в крак с новостите.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Присъединяване към $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'Разрешете известията, за да не пропускате съобщения и споменавания.';

  @override
  String get nagbarEnableNotifications => 'Включване на известията';

  @override
  String get nagbarBillingPortalFailed =>
      'Не успяхме да отворим портала за плащания. Моля, опитайте отново след малко.';

  @override
  String get welcomeBack => 'Добре дошли отново';

  @override
  String get email => 'Имейл';

  @override
  String get emailInvalid => 'Моля, въведете валиден имейл адрес.';

  @override
  String get password => 'Парола';

  @override
  String get forgotPassword => 'Забравена парола?';

  @override
  String get logIn => 'Вход';

  @override
  String get logInWithPasskey => 'Влезте с пропуск';

  @override
  String continueWithSso(String provider) {
    return 'Продължи с $provider';
  }

  @override
  String get ssoRequired => 'За достъп до този инстанс се изисква SSO.';

  @override
  String get organizationSsoProvider =>
      'Влез с доставчика на единен вход (SSO) на организацията ти.';

  @override
  String get failedToStartSso => 'Неуспешно стартиране на SSO';

  @override
  String get ssoCancelled => 'Влизането чрез SSO беше отменено';

  @override
  String preferSso(String provider) {
    return 'Предпочитате ли да използвате SSO? Продължете с $provider.';
  }

  @override
  String get logInViaBrowser => 'Влезте през браузъра';

  @override
  String get needAccountPrompt => 'Нямаш акаунт? ';

  @override
  String get register => 'Регистрация';

  @override
  String get orDivider => 'OR';

  @override
  String get cancel => 'Отказ';

  @override
  String get ipAuthCheckEmail => 'Провери имейла си';

  @override
  String ipAuthDescription(String email) {
    return 'Изпратихме имейл с връзка за оторизиране на този вход. Моля, отворете входящата си поща на адрес $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Връзката е изгубена';

  @override
  String get ipAuthConnectionLostDescription =>
      'Изгубихме връзката, докато чакахме оторизация. Моля, опитайте отново.';

  @override
  String get ipAuthLinkExpired => 'Връзката за влизане е изтекла';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Тази връзка за оторизация е изтекла. Моля, влезте отново.';

  @override
  String get ipAuthResendEmail => 'Изпрати имейла отново';

  @override
  String get ipAuthResent => 'Изпратено отново';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '$seconds сек.';
  }

  @override
  String get back => 'Назад';

  @override
  String get next => 'Напред';

  @override
  String get mfaTitle => 'Двуфакторно удостоверяване';

  @override
  String get mfaChooseMethod => 'Изберете метод за проверка';

  @override
  String get mfaMethodTotp => 'Приложение за удостоверяване';

  @override
  String get mfaMethodWebauthn => 'Защитен ключ / ключ за достъп';

  @override
  String get mfaTotpDescription =>
      'Въведете 6-цифрения код от приложението си за удостоверяване или един от резервните си кодове.';

  @override
  String get mfaCodeLabel => 'Код';

  @override
  String get mfaTryAnotherMethod => 'Опитай друг метод';

  @override
  String get mfaUseSecurityKey =>
      'Опитай със защитен ключ / ключ за достъп вместо това';

  @override
  String get accountSelectorTitle => 'Избери акаунт';

  @override
  String get accountSelectorDescription =>
      'Избери акаунт, за да продължиш, или добави друг.';

  @override
  String get accountAdd => 'Добавяне на акаунт';

  @override
  String get accountRemove => 'Премахване';

  @override
  String accountRemoveTitle(String username) {
    return 'Премахни $username';
  }

  @override
  String get accountRemoveDescription =>
      'Това ще премахне запазената сесия за този акаунт.';

  @override
  String get accountRemoveOnlyDescription =>
      'Това ще премахне единствения запазен акаунт на това устройство.';

  @override
  String get accountExpired => 'Изтекло';

  @override
  String accountSessionExpired(String identifier) {
    return 'Сесията за $identifier е изтекла. Моля, влезте отново.';
  }

  @override
  String get accountManageTitle => 'Управление на акаунтите';

  @override
  String get accountSwitchFailed =>
      'Неуспешно превключване на акаунти. Опитай отново.';

  @override
  String get profileTabMenuSwitchAccounts => 'Смяна на акаунт';

  @override
  String get statusChangeSheetTitle => 'Задаване на статус';

  @override
  String get statusOnlineStatusSection => 'Онлайн статус';

  @override
  String get statusOnline => 'Онлайн';

  @override
  String get statusIdle => 'Неактивен';

  @override
  String get statusDnd => 'Не ме безпокойте';

  @override
  String get statusInvisible => 'Невидим';

  @override
  String get statusOffline => 'Офлайн';

  @override
  String get statusUntilIChangeIt => 'Докато не го променя';

  @override
  String get statusDontClear => 'Без изчистване';

  @override
  String get statusFor10Seconds => 'За 10 секунди';

  @override
  String get statusClearAfter10Seconds => '10 секунди';

  @override
  String get statusClearAfter15Minutes => '15 минути';

  @override
  String get statusClearAfter30Minutes => '30 минути';

  @override
  String get statusClearAfter1Hour => '1 час';

  @override
  String get statusClearAfter3Hours => '3 часа';

  @override
  String get statusClearAfter4Hours => '4 часа';

  @override
  String get statusClearAfter8Hours => '8 часа';

  @override
  String get statusClearAfter24Hours => '24 часа';

  @override
  String get statusClearAfter3Days => '3 дни';

  @override
  String get statusDndDescription => 'Няма да получаваш известия на компютъра';

  @override
  String get statusInvisibleDescription => 'Ще изглеждаш офлайн';

  @override
  String get customStatusSetTitle => 'Задаване на персонализиран статус';

  @override
  String get customStatusCurrentHint => 'Персонализиран статус';

  @override
  String get customStatusClear => 'Изчистване на персонализиран статус';

  @override
  String get customStatusPlaceholder => 'Какво става?';

  @override
  String get customStatusChooseEmoji => 'Избери емоджи';

  @override
  String get customStatusClearAfter => 'Изчистване след';

  @override
  String get customStatusSave => 'Запазване';

  @override
  String get accountActive => 'Активен акаунт';

  @override
  String get signOut => 'Изход';

  @override
  String get suspendedPermanentTitle => 'Акаунтът е перманентно блокиран';

  @override
  String get suspendedTemporaryTitle => 'Акаунтът е временно блокиран';

  @override
  String get suspendedPermanentDescription =>
      'Вашият акаунт е перманентно блокиран за нарушаване на нашите Условия за ползване.';

  @override
  String get suspendedTemporaryDescription =>
      'Вашият акаунт е временно блокиран. Ще можете да влезете в акаунта си, след като периодът на блокиране приключи.';

  @override
  String get suspendedIssuedAt => 'Издадено';

  @override
  String get suspendedEndsAt => 'Край';

  @override
  String get suspendedDuration => 'Продължителност';

  @override
  String get suspendedPermanent => 'Постоянно';

  @override
  String get suspendedReason => 'Причина';

  @override
  String get suspendedAppealDeadline => 'Краен срок за обжалване';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Профилът ви е насрочен за изтриване на $date.';
  }

  @override
  String get suspendedRecheck => 'Проверка за актуализации';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Провери отново след $seconds сек.';
  }

  @override
  String get suspendedBackToLogin => 'Обратно към влизане';

  @override
  String get suspendedAppealTitle => 'Жалба';

  @override
  String get suspendedAppealHint =>
      'Обяснете защо мярката ви трябва да бъде преразгледана (минимум 50 знака)...';

  @override
  String get suspendedAppealSubmit => 'Изпрати обжалване';

  @override
  String get suspendedAppealPending => 'Чака преглед';

  @override
  String get suspendedAppealAccepted => 'Прието обжалване';

  @override
  String get suspendedAppealRejected => 'Отхвърлена жалба';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Вашата жалба е приета и акаунтът ви е възстановен.';

  @override
  String get suspendedSignIn => 'Влезте в профила си';

  @override
  String get forgotPasswordTitle => 'Забравена парола?';

  @override
  String get forgotPasswordDescription =>
      'Въведи имейл адреса си и ще ти изпратим линк за нулиране на паролата.';

  @override
  String get forgotPasswordSubmit => 'Изпращане на линк за нулиране';

  @override
  String get forgotPasswordSentTitle => 'Провери имейла си';

  @override
  String get forgotPasswordSentDescription =>
      'Изпратихме инструкции за нулиране на паролата на вашия имейл адрес. Моля, проверете входящата си поща и следвайте връзката, за да нулирате паролата си.';

  @override
  String get forgotPasswordBackToLogin => 'Върни се към влизане';

  @override
  String get resetPasswordTitle => 'Задаване на нова парола';

  @override
  String get resetPasswordDescription =>
      'Въведете новата си парола по-долу, за да завършите процеса на нулиране.';

  @override
  String get resetPasswordNewPassword => 'Нова парола';

  @override
  String get resetPasswordConfirm => 'Потвърди новата парола';

  @override
  String get resetPasswordSubmit => 'Нулиране на парола';

  @override
  String get resetPasswordMismatch => 'Паролите не съвпадат.';

  @override
  String get recoverAccountTitle => 'Възстановете акаунта си';

  @override
  String get recoverAccountDescription =>
      'Въведете вашето потребителско име и ключ за възстановяване от комплекта си за възстановяване, след което изберете нова парола.';

  @override
  String get recoverAccountNoKit =>
      'Нямате комплект за възстановяване? Поискайте от администратор на този сървър връзка за нулиране на паролата.';

  @override
  String get recoveryKitTitle => 'Вашият комплект за възстановяване';

  @override
  String get recoveryKitCreatedDescription =>
      'Ако забравите паролата си, този комплект е единственият начин да влезете отново в акаунта си. Съхранявайте го на сигурно място, например в мениджър на пароли или като разпечатка.';

  @override
  String get recoveryKitReplacedDescription =>
      'Старият ви комплект за възстановяване вече не работи. Съхранявайте този нов на сигурно място.';

  @override
  String get recoveryKitRecoveredDescription =>
      'Паролата ви е нулирана. Старият ви комплект за възстановяване вече не работи. Съхранявайте този нов някъде на сигурно място.';

  @override
  String get recoveryKitWarning =>
      'Всеки с този ключ може да нулира паролата ви. Никога не го споделяйте.';

  @override
  String get recoveryKitKeyLabel => 'Ключ за възстановяване';

  @override
  String recoveryKitDocumentTitle(String productName) {
    return 'Резервен комплект на $productName';
  }

  @override
  String get recoveryKitDocumentIntro =>
      'Пазете тази страница на сигурно място. Ако забравите паролата си, можете да я използвате, за да влезете отново в профила си. Всеки, който има този ключ за възстановяване, може да нулира паролата ви, така че никога не го споделяйте.';

  @override
  String get recoveryKitInstanceLabel => 'Инстанция';

  @override
  String get recoveryKitCreatedAtLabel => 'Създадена';

  @override
  String get recoveryKitQrCaption =>
      'Сканирайте, за да отворите страницата за възстановяване с попълнени данни.';

  @override
  String get recoveryKitStepsTitle => 'Как да възстановите акаунта си';

  @override
  String recoveryKitStepOpen(String recoverUrl) {
    return 'Отидете на $recoverUrl или сканирайте QR кода.';
  }

  @override
  String get recoveryKitStepEnter =>
      'Въведете вашето потребителско име и този ключ за възстановяване.';

  @override
  String get recoveryKitStepPassword =>
      'Изберете нова парола. Ще получите нов комплект за възстановяване и този ще спре да работи.';

  @override
  String get recoveryKitBackupCodesTitle =>
      'Резервни кодове за двуфакторна автентикация';

  @override
  String get recoveryKitBackupCodesNote =>
      'Всеки код работи еднократно вместо приложението ви за удостоверяване.';

  @override
  String get recoveryKitBackupCodesFailed =>
      'Не успяхме да заредим резервните ви кодове.';

  @override
  String get recoveryKitIncludeBackupCodes =>
      'Включи резервните ми кодове за двуфакторно удостоверяване в запазеното изображение';

  @override
  String get recoveryKitCopy => 'Копирай';

  @override
  String get recoveryKitCopied => 'Ключът за възстановяване е копиран';

  @override
  String get recoveryKitSaveImage => 'Запази изображение';

  @override
  String get recoveryKitSaved => 'Комплектът за възстановяване е запазен';

  @override
  String get recoveryKitSavedToPhotos =>
      'Комплектът за възстановяване е запазен в снимките';

  @override
  String get recoveryKitSaveFailed =>
      'Комплектът за възстановяване не можа да бъде запазен. Опитай отново или копирай ключа.';

  @override
  String get recoveryKitAcknowledge =>
      'Съхраних комплекта си за възстановяване на сигурно място';

  @override
  String get recoveryKitCreateFailed =>
      'Не успяхме да създадем вашия комплект за възстановяване. Можете да създадете такъв по-късно в настройките на профила си.';

  @override
  String get recoveryKitSectionTitle => 'Комплект за възстановяване';

  @override
  String get recoveryKitSectionDescription =>
      'Позволява ви да нулирате паролата си, ако я забравите.';

  @override
  String get recoveryKitNone => 'Все още нямате комплект за възстановяване';

  @override
  String recoveryKitCreatedRelative(String time) {
    return 'Създадено $time';
  }

  @override
  String get recoveryKitCreate => 'Създай комплект за възстановяване';

  @override
  String get recoveryKitCreateNew => 'Създай нов комплект';

  @override
  String get recoveryKitReplaceTitle =>
      'Създаване на нов комплект за възстановяване?';

  @override
  String get recoveryKitReplaceDescription =>
      'Настоящият ви комплект спира да работи веднага щом бъде създаден нов.';

  @override
  String get recoveryKitReminderTitle => 'Запазете комплект за възстановяване';

  @override
  String get recoveryKitReminderBody =>
      'В профила ви няма имейл адрес. Ако забравите паролата си, комплектът за възстановяване е единственият начин да влезете отново. Отнема само минута.';

  @override
  String get registerUsernameSignInHint =>
      'Влизате с това потребителско име. Изберете такова, което ще запомните.';

  @override
  String get registerUsernameTaken => 'Това потребителско име вече е заето';

  @override
  String get registerUsernameAvailable => 'Това потребителско име е налично';

  @override
  String get claimAccountUsernameDescription =>
      'Заяви своя акаунт, като избереш потребителско име и парола. С тях ще влизаш в системата, така че избери такива, които ще помниш.';

  @override
  String get unclaimedAccountDescriptionUsername =>
      'Акаунтът ви все още не е заявен. Без потребителско име и парола няма да можете да влезете от други устройства и може да загубите достъп до акаунта си. Заявете акаунта си сега, за да го защитите.';

  @override
  String get addFriendUsernameOnlyHint => 'Потребителско име';

  @override
  String get registerTitle => 'Създаване на акаунт';

  @override
  String get registerDisplayName => 'Показвано име (по избор)';

  @override
  String get registerDisplayNameHint => 'Как да те наричат?';

  @override
  String get registerUsername => 'Потребителско име (по избор)';

  @override
  String get registerUsernameHint =>
      'Остави празно за случайно потребителско име';

  @override
  String get registerUsernameTagHint =>
      'Ще бъде добавен автоматично 4-цифрен етикет, за да се гарантира уникалност';

  @override
  String get registerDateOfBirth => 'Дата на раждане';

  @override
  String get registerMonth => 'Месец';

  @override
  String get registerDay => 'Ден';

  @override
  String get registerYear => 'Година';

  @override
  String get registerConsent =>
      'Съгласен съм с Общите условия и Политиката за поверителност';

  @override
  String get registerConsentPrefix => 'Съгласен съм с ';

  @override
  String get registerConsentTerms => 'Общи условия';

  @override
  String get registerConsentAnd => ' и ';

  @override
  String get registerConsentPrivacy => 'Политика за поверителност';

  @override
  String get registerConfirmPassword => 'Потвърди паролата';

  @override
  String get registerSubmit => 'Създаване на акаунт';

  @override
  String get registerHaveAccount => 'Вече имаш акаунт? ';

  @override
  String get registerPendingApproval =>
      'Заявката ти за акаунт чака одобрение. Можеш да влезеш, след като администратор я одобри.';

  @override
  String get registerClosed =>
      'Регистрацията в момента е затворена. Използвай линк за регистрация от администратор, за да създадеш акаунт.';

  @override
  String get passkeyNoCredentials =>
      'Не са намерени пароли за това приложение. Вместо това влезте с имейл и парола.';

  @override
  String get passkeyDeviceNotSupported =>
      'Passkeys не се поддържат на това устройство.';

  @override
  String get passkeyDomainNotAssociated =>
      'Passkeys не са конфигурирани за това приложение. Вместо това влезте с имейл и парола.';

  @override
  String get passkeyTimeout =>
      'Изтече времето за удостоверяване с ключ за достъп. Моля, опитайте отново.';

  @override
  String get passkeyNotAvailable =>
      'Пас-ключовете не са налични за това приложение. Вместо това влезте с имейл и парола.';

  @override
  String get passkeyFailed =>
      'Неуспешна автентикация с пропуск. Моля, опитайте отново.';

  @override
  String get errorUnableToCreateAccount =>
      'Неуспешно създаване на акаунт. Моля, опитайте отново.';

  @override
  String get errorUnableToSignIn =>
      'Не може да се влезе в момента. Моля, опитайте отново.';

  @override
  String get errorServiceUnavailable =>
      'Тази инстанция е временно недостъпна. Опитайте отново след малко.';

  @override
  String get errorInvalidEmailOrPassword => 'Невалиден имейл или парола.';

  @override
  String get errorInvalidUsernameOrPassword =>
      'Невалидно потребителско име или парола.';

  @override
  String get errorUnableToSendResetLink =>
      'Не успяхме да изпратим връзка за нулиране. Моля, опитайте отново.';

  @override
  String get errorUnableToResetPassword =>
      'Не може да се нулира паролата. Моля, опитайте отново.';

  @override
  String get embedInviteJoin => 'Присъединяване към общността';

  @override
  String get embedInviteGoTo => 'Към общността';

  @override
  String embedInviteOnline(String count) {
    return '$count онлайн';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count членове';
  }

  @override
  String get embedInviteUnknownTitle => 'Неизвестна покана';

  @override
  String get embedInviteUnknownSubtitle => 'Опитай да поискаш нова покана.';

  @override
  String get embedInviteUnavailable => 'Поканата е недостъпна';

  @override
  String get embedInviteJoinGroup => 'Присъединяване към групата';

  @override
  String get embedInviteAlreadyJoined => 'Вече си член';

  @override
  String get embedInviteDisabled => 'Поканите са деактивирани';

  @override
  String get embedInvitePaused => 'Поканите за тази общност са на пауза.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName откри потенциална атака, така че новите потребители не могат да се присъединят в момента.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Тази общност е спряла поканите. Можеш да опиташ отново по-късно.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName засече потенциална атака в тази общност. Поканите са на пауза, така че в момента не могат да се присъединяват нови потребители.';
  }

  @override
  String get inviteAcceptTitle => 'Имаш покана да се присъединиш към';

  @override
  String get inviteAcceptJoinButton => 'Присъединяване към общността';

  @override
  String get inviteAcceptGoToButton => 'Към общността';

  @override
  String get inviteAcceptInvitesPaused => 'Поканите са на пауза';

  @override
  String get inviteAcceptNotFoundTitle => 'Невалидна покана';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Тази покана може да е изтекла или невалидна.';

  @override
  String get invalidDeepLinkTitle => 'Връзката не може да бъде отворена';

  @override
  String get invalidDeepLinkDescription =>
      'Връзката може да е невалидна, да е достъпна само в уеб или да нямате достъп. Проверете връзката и опитайте отново.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Към начало';

  @override
  String get inviteAcceptJoinGroupButton => 'Присъединяване към групата';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Поканен си да се присъединиш към групов личен разговор от $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'някой';

  @override
  String get inviteAcceptEmojiPack => 'Емотикон пакет';

  @override
  String get inviteAcceptStickerPack => 'Стикер пакет';

  @override
  String get inviteAcceptInstallEmojiPack => 'Инсталирай пакет емотикони';

  @override
  String get inviteAcceptInstallStickerPack => 'Инсталирай стикер пакет';

  @override
  String get inviteAcceptPackInstallNote =>
      'Приемането на тази покана автоматично ще инсталира пакета.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Достъпът до канала е отказан';

  @override
  String get channelAccessDeniedDescription =>
      'Нямаш достъп до канала, където е изпратено това съобщение.';

  @override
  String get messageJumpLinkNoAccess => 'Няма достъп';

  @override
  String get okay => 'OK';

  @override
  String get embedThemeTitle => 'Споделена тема';

  @override
  String get embedThemeSubtitle =>
      'Този клиент не поддържа персонализирани теми.';

  @override
  String get embedThemeUnavailableButton => 'Темите не са налични';

  @override
  String embedGiftVisionaryLifetime(String productName) {
    return 'Визионер (доживотно $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дни $productName',
      one: '1 ден $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count седмици $productName',
      one: '1 седмица $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count месеца $productName',
      one: '1 месец $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count години $productName',
      one: '1 година $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'От $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'Натисни, за да вземеш подаръка си!';

  @override
  String get embedGiftAlreadyRedeemed => 'Вече е осребрен';

  @override
  String get embedGiftClaimAccountHelp =>
      'Заяви акаунта си, за да осребриш този подарък.';

  @override
  String get embedGiftClaim => 'Вземи подарък';

  @override
  String get embedGiftClaimed => 'Подаръкът е взет';

  @override
  String get embedGiftClaimAccount => 'Заяви акаунта си, за да осребриш';

  @override
  String get embedGiftUnknownTitle => 'Неизвестен подарък';

  @override
  String get embedGiftUnknownSubtitle =>
      'Този код за подарък е невалиден или вече е използван.';

  @override
  String get embedGiftUnavailable => 'Подаръкът не е наличен';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Поискай подаръка си, за да активираш своя $productName абонамент!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'Този подарък вече е взет.';

  @override
  String get giftAcceptMaybeLater => 'Може би по-късно';

  @override
  String get giftRedeemedToast => 'Подаръкът е осребрен!';

  @override
  String get giftRedeemInvalidTitle => 'Невалиден код за подарък';

  @override
  String get giftRedeemInvalidMessage =>
      'Този код е невалиден или вече е използван.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Подаръкът вече е осребрен';

  @override
  String get giftRedeemAlreadyRedeemedMessage => 'Този код вече е осребрен.';

  @override
  String get giftRedeemNotFoundTitle => 'Подаръкът не е намерен';

  @override
  String get giftRedeemNotFoundMessage => 'Този код не съществува.';

  @override
  String get giftRedeemFailedTitle => 'Неуспешно осребряване на подарък';

  @override
  String get giftRedeemFailedMessage =>
      'Подаръкът не можа да бъде осребрен. Опитай отново.';

  @override
  String get giftVisionaryCannotRedeemTitle =>
      'Не можеш да осребриш този подарък';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Акаунтите Visionary не могат да осребряват Plutonium подаръци. Копирайте връзката, за да я споделите с приятел вместо това.';

  @override
  String get giftCopyLink => 'Копирай линк за подарък';

  @override
  String get privacySettings => 'Настройки за поверителност';

  @override
  String get privacyDirectMessages => 'Директни съобщения';

  @override
  String get privacyDirectMessagesDescription =>
      'Позволи лични съобщения от други членове в тази общност';

  @override
  String get privacyBotDirectMessages => 'Директни съобщения от ботове';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Позволи на ботове от тази общност да ти изпращат лични съобщения';

  @override
  String get privacyMutualDmsDisabled =>
      'Администраторите на общността са деактивирали получаването на лични съобщения само от взаимни членове в тази общност.';

  @override
  String get communityDebug => 'Отстраняване на грешки в общността';

  @override
  String get copiedToClipboard => 'Копирано в клипборда';

  @override
  String get notificationSettings => 'Настройки за известия';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Изключване на известията за $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Заглушаването на общност предотвратява появата на индикатори за непрочетени съобщения и известия, освен ако не сте споменати';

  @override
  String get notificationCommunitySettings =>
      'Настройки за известия на общността';

  @override
  String get notificationAllMessages => 'Всички съобщения';

  @override
  String get notificationOnlyMentions => 'Само споменавания';

  @override
  String get notificationNothing => 'Нищо';

  @override
  String get notificationSuppressEveryone => 'Потисни @everyone и @here';

  @override
  String get notificationSuppressRoles => 'Потисни всички споменавания на роли';

  @override
  String get notificationMobilePush => 'Мобилни push известия';

  @override
  String get notificationOverrides => 'Персонализирани известия';

  @override
  String get notificationSelectChannel => 'Избери канал или категория';

  @override
  String get notificationOnlyAtMentions => 'Само @споменавания';

  @override
  String get notificationMuteChannel => 'Изключване на известията за канала';

  @override
  String get notificationUnmuteChannel => 'Включване на известията за канала';

  @override
  String get notificationUseCategoryDefault =>
      'Използване на настройката по подразбиране за категорията';

  @override
  String get notificationUseCommunityDefault =>
      'Използвай общи настройки на общността';

  @override
  String get notificationNoCategory => 'Без категория';

  @override
  String get dmMarkAsRead => 'Маркирай като прочетено';

  @override
  String get dmMuteConversation => 'Изключване на известията за DM';

  @override
  String get dmUnmuteConversation => 'Включване на известията за DM';

  @override
  String get dmPinDm => 'Закачи DM';

  @override
  String get dmUnpinDm => 'Откачи DM';

  @override
  String get dmAlwaysShowInSidebar => 'Винаги показвай в страничната лента';

  @override
  String get dmRemoveFromAlwaysShown => 'Премахни от винаги показване';

  @override
  String get dmCloseDm => 'Затваряне на DM';

  @override
  String get dmCloseDmConfirmTitle => 'Затваряне на DM';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Сигурни ли сте, че искате да затворите личния си чат с $username? Винаги можете да го отворите отново по-късно.';
  }

  @override
  String get dmDeleteMyMessagesTitle =>
      'Да изтриеш ли съобщенията си в този разговор?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Това ще изтрие завинаги всяко съобщение, което си изпращал в този разговор. Това действие не може да бъде отменено.';

  @override
  String get dmCopyChannelId => 'Копирай ID на канала';

  @override
  String get dmChannelIdCopied => 'ID на канала е копирано';

  @override
  String get dmCopyUserId => 'Копирай ID на потребителя';

  @override
  String get dmUserIdCopied => 'ID на потребителя е копирано';

  @override
  String get dmViewProfile => 'Преглед на профила';

  @override
  String get dmVoiceCall => 'Започване на гласово повикване';

  @override
  String get incomingVoiceCallTitle => 'Входящо гласово повикване';

  @override
  String get incomingVoiceCallAccept => 'Приемане';

  @override
  String get incomingVoiceCallDecline => 'Отхвърляне';

  @override
  String get incomingVoiceCallLabel => 'Входящо повикване';

  @override
  String get incomingVoiceCallIgnore => 'Игнориране';

  @override
  String get directVoiceCallNotEligible =>
      'Това обаждане не може да бъде стартирано в момента. Опитайте отново след малко.';

  @override
  String get voiceJoinCallFailed =>
      'Не успяхме да се свържем с това обаждане. Проверете връзката си и опитайте отново.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Не успяхме да се присъединим към този разговор. Проверете връзката си и опитайте отново.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Не успяхме да актуализираме това обаждане в сървъра. Проверете връзката си и опитайте отново.';

  @override
  String get dmAddNote => 'Добавяне на бележка';

  @override
  String get dmEditGroup => 'Редактиране на групата';

  @override
  String get dmInviteToCommunity => 'Покани в общността';

  @override
  String get dmBlock => 'Блокиране';

  @override
  String get dmLeaveGroup => 'Напускане на групата';

  @override
  String get dmNoCommunitiesAvailable => 'Няма налични общности';

  @override
  String dmGroupMemberCount(int count) {
    return '$count членове';
  }

  @override
  String get dmMuteFor15Min => 'За 15 минути';

  @override
  String get dmMuteFor30Min => 'За 30 минути';

  @override
  String get dmMuteFor1Hour => 'За 1 час';

  @override
  String get dmMuteFor3Hours => 'За 3 часа';

  @override
  String get dmMuteFor4Hours => 'За 4 часа';

  @override
  String get dmMuteFor8Hours => 'За 8 часа';

  @override
  String get dmMuteFor24Hours => 'За 24 часа';

  @override
  String get dmMuteFor3Days => 'За 3 дни';

  @override
  String get dmMuteForever => 'Докато не го включа отново';

  @override
  String get dmPinGroupDm => 'Закачи груповото DM';

  @override
  String get dmUnpinGroupDm => 'Откачи груповото DM';

  @override
  String get dmUnnamedGroup => 'Група без име';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'Групата на $resolvedName';
  }

  @override
  String get dmFavoriteDm => 'Добави DM в любими';

  @override
  String get dmUnfavoriteDm => 'Премахни DM от любими';

  @override
  String get dmFavoriteGroupDm => 'Добави груповото DM в любими';

  @override
  String get dmUnfavoriteGroupDm => 'Премахни груповото DM от любими';

  @override
  String get dmChangeFriendNickname => 'Промяна на прякор на приятел';

  @override
  String get dmRemoveFriend => 'Премахване от приятели';

  @override
  String get dmAddFriend => 'Добавяне на приятел';

  @override
  String get dmAcceptFriendRequest => 'Приемане на покана за приятелство';

  @override
  String get dmIgnoreFriendRequest => 'Игнориране на покана за приятелство';

  @override
  String get dmFriendRequestSent => 'Поканата за приятелство е изпратена';

  @override
  String get dmUnblock => 'Отблокиране';

  @override
  String get dmDebugUser => 'Отстраняване на грешки за потребител';

  @override
  String get dmDebugChannel => 'Отстраняване на грешки в канала';

  @override
  String get dmDebugCategory => 'Отстраняване на грешки в категория';

  @override
  String get dmPinned => 'DM е закачено';

  @override
  String get dmUnpinned => 'DM е откачено';

  @override
  String get dmMuted => 'Заглушен ЛС';

  @override
  String get dmUnmuted => 'DM е вече без звук';

  @override
  String get dmRemoveFriendConfirmTitle => 'Премахване от приятели';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Сигурни ли сте, че искате да премахнете $username като приятел?';
  }

  @override
  String get dmBlockConfirmTitle => 'Блокиране на потребител';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Сигурни ли сте, че искате да блокирате $username? Те няма да могат да ви пишат или да ви изпращат заявки за приятелство.';
  }

  @override
  String get dmFriendRequestSentToast => 'Поканата за приятелство е изпратена';

  @override
  String get dmFriendRequestFailed =>
      'Неуспешно изпращане на заявка за приятелство';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Неуспешно приемане на заявка за приятелство';

  @override
  String get dmRemoveFriendFailed => 'Неуспешно премахване на приятел';

  @override
  String get dmBlockFailed => 'Неуспешно блокиране на потребител';

  @override
  String get dmUnblockFailed => 'Неуспешно блокиране на потребител';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Неуспешно игнориране на заявка за приятелство';

  @override
  String get dmAddFriends => 'Добавяне на приятели';

  @override
  String get addFriendSheetTitle => 'Добавяне на приятел';

  @override
  String get addFriendUsernameHint => 'Потребителско име#0000';

  @override
  String get addFriendUsernameLabel => 'Потребителско име на приятел';

  @override
  String get addFriendSendRequest => 'Изпращане на покана';

  @override
  String get addFriendNoUserFound =>
      'Няма потребител с това потребителско име.';

  @override
  String get addFriendInvalidUsername =>
      'Въведете валидно потребителско име (Потребителско име#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Поканата за приятелство е изпратена';

  @override
  String get addFriendClaimTitle => 'Заяви акаунта си';

  @override
  String get addFriendClaimDescription =>
      'Заяви акаунта си, за да изпращаш покани за приятелство.';

  @override
  String get addFriendVerifyTitle => 'Потвърди имейла си';

  @override
  String get addFriendVerifyDescription =>
      'Трябва да потвърдиш имейл адреса си, преди да можеш да изпращаш покани за приятелство.';

  @override
  String get addFriendVerifyEmail => 'Потвърди имейла';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Входящи заявки за приятелство ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Изходящи заявки за приятелство ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Входяща покана за приятелство';

  @override
  String get addFriendOutgoingStatus => 'Поканата за приятелство е изпратена';

  @override
  String get addFriendViewProfile => 'Преглед на профила';

  @override
  String get addFriendAccept => 'Приемане';

  @override
  String get addFriendIgnore => 'Игнориране';

  @override
  String get addFriendAcceptTitle => 'Приемане на покана за приятелство';

  @override
  String get addFriendIgnoreTitle => 'Игнориране на покана за приятелство';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Да приемеш ли поканата за приятелство от $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Да игнорираш ли поканата за приятелство от $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Отмяна на поканата';

  @override
  String get addFriendCancelRequestFailed =>
      'Поканата за приятелство не можа да бъде отменена. Опитай отново.';

  @override
  String get addFriendNotAcceptingRequests =>
      'В момента не приемат покани за приятелство.';

  @override
  String get addFriendUnblockFirst =>
      'Първо го отблокирай, за да изпратиш покана за приятелство.';

  @override
  String get addFriendCannotSendToSelf =>
      'Не можеш да си изпратиш покана за приятелство.';

  @override
  String get addFriendAlreadyFriends => 'Вече сте приятели с този потребител.';

  @override
  String get addFriendClaimToSend =>
      'Завърши регистрацията, за да изпращаш покани за приятелство.';

  @override
  String get addFriendVerifyToSend =>
      'Потвърди имейла си, преди да изпращаш покани за приятелство.';

  @override
  String get addFriendFriendsListFull =>
      'Твоят списък с приятели или този на другия потребител е пълен. Премахни някого и опитай отново.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Система';

  @override
  String get emojiSearchPlaceholder => 'Намери емоджито на мечтите си';

  @override
  String get emojiSearchEmpty =>
      'Няма емоджита, които да отговарят на търсенето ви';

  @override
  String get emojiAutocompleteDefaultLabel => 'Емоджи по подразбиране';

  @override
  String emojiInfoDefaultDescription(String productName) {
    return 'Това е емоджи по подразбиране във $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'Това емоджи е от тази общност. Можете да го използвате навсякъде.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'Това е персонализирано емоджи от общност.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'Това е персонализирано емоджи от общност. Помолете автора за покана, за да използвате това емоджи.';

  @override
  String get emojiInfoFromHeader => 'Това емоджи е от';

  @override
  String get emojiInfoDiscoverableCommunity => 'Общност в Откриване';

  @override
  String get emojiInfoPrivateCommunity => 'Частна общност';

  @override
  String get emojiInfoVerifiedCommunity => 'Верифицирана общност';

  @override
  String get emojiInfoAddToFavorites => 'Добавяне към любими';

  @override
  String get emojiInfoRemoveFromFavorites => 'Премахване от любими';

  @override
  String get emojiFrequentlyUsed => 'Често използвани';

  @override
  String get emojiTabGifs => 'GIF файлове';

  @override
  String get emojiTabMedia => 'Медия';

  @override
  String get emojiTabStickers => 'Стикери';

  @override
  String get emojiTabEmojis => 'Емоджита';

  @override
  String get gifPickerSearch => 'Търсене на GIF файлове';

  @override
  String get gifPickerSearchKlipy => 'Търсене в KLIPY';

  @override
  String get gifPickerSearchTenor => 'Търсене в Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Любими';

  @override
  String get gifPickerFavoritesEmptyTitle => 'Все още няма любими GIF файлове';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Отбележете GIF със звезда, за да го видите тук.';

  @override
  String get gifPickerTrending => 'Популярни GIF файлове';

  @override
  String get gifPickerNoResultsTitle => 'Няма резултати от търсенето';

  @override
  String get gifPickerNoResultsDescription => 'Опитай с друг термин за търсене';

  @override
  String get gifPickerLoadFailedTitle => 'Не успяхме да заредим GIF файлове';

  @override
  String get gifPickerLoadFailedBody => 'Провери връзката си и опитай отново.';

  @override
  String get emojiCategoryPeople => 'Хора';

  @override
  String get emojiCategoryNature => 'Природа';

  @override
  String get emojiCategoryFood => 'Храна и напитки';

  @override
  String get emojiCategoryActivity => 'Дейности';

  @override
  String get emojiCategoryTravel => 'Пътуване и места';

  @override
  String get emojiCategoryObjects => 'Обекти';

  @override
  String get emojiCategorySymbols => 'Символи';

  @override
  String get emojiCategoryFlags => 'Знамена';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Отключи $emojiCount от $communityCount с Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Вземи Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Не показвай отново';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count персонализирани емоджита',
      one: '1 персонализирано емоджи',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count общности',
      one: '1 общност',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Предупреждение за външен линк';

  @override
  String externalLinkWarningLeaving(String productName) {
    return 'Предстои да напуснеш $productName';
  }

  @override
  String get externalLinkWarningDescription =>
      'Външните връзки могат да бъдат опасни. Моля, бъдете внимателни.';

  @override
  String get externalLinkWarningDestinationUrl => 'Целеви URL адрес:';

  @override
  String get externalLinksSectionTitle => 'Външни връзки';

  @override
  String get externalLinksSectionDescription =>
      'Конфигуриране как се обработват предупрежденията за външни връзки.';

  @override
  String get externalLinkWarningTrustPrefix => 'Винаги се доверявай ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — пропусни това предупреждение следващия път';

  @override
  String get externalLinkVisitSite => 'Посети сайта';

  @override
  String get externalLinkTrustAllLabel => 'Доверяване на всички външни линкове';

  @override
  String get externalLinkStripTrackingLabel =>
      'Премахване на параметри за проследяване от URL адреси';

  @override
  String get externalLinkStripTrackingDescription =>
      'Автоматично премахване на параметри за проследяване (като utm_source, fbclid, gclid) от URL адресите в съобщенията, които изпращаш. Изчиства линка, преди да стигне до някой друг.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Да се довериш ли на всички външни линкове?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Това ще направи всички външни линкове доверени и ще пропуска предупреждението за всеки домейн. Съществуващите ти доверени домейни ще бъдат заменени. Това е по-малко сигурно.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Доверяване на всички';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Да спреш ли да се доверяваш на всички линкове?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Предупрежденията за външни линкове ще се показват отново. Ще трябва да добавиш надеждни домейни поотделно.';

  @override
  String get externalLinkStopTrustingAllAction =>
      'Изключване на „Доверяване на всички“';

  @override
  String get externalLinkTrustedAllDescription =>
      'Всички външни линкове са надеждни. Няма да се показват предупреждения.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Имате $count доверен(и) домейн(а). Добавете още, като отметнете квадратчето при посещение на външни връзки.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Когато е активирано, няма да се показват предупреждения за външни връзки. Това е по-малко сигурно.';

  @override
  String get imageFileTooLarge =>
      'Файлът с изображение е твърде голям. Моля, изберете файл, по-малък от 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Анимираните аватари изискват Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Анимираните банери изискват Plutonium';

  @override
  String get animatedAvifNotSupported => 'Анимиран AVIF не се поддържа';

  @override
  String get animatedAvifNotSupportedBody =>
      'Изрязването и завъртането на анимирани AVIF файлове все още не се поддържа. Ако продължите, файлът ще бъде качен в оригиналния си вид.';

  @override
  String get uploadAsIs => 'Качи без промени';

  @override
  String get croppingAnimatedNotSupported =>
      'Анимирани изображения не могат да бъдат изрязвани. Ще бъде използвано оригиналното изображение.';

  @override
  String get cropAvatar => 'Изрязване на аватар';

  @override
  String get cropBanner => 'Изрязване на банер';

  @override
  String get skip => 'Пропусни';

  @override
  String get crop => 'Изрежи';

  @override
  String get cropTouchHint =>
      'Прищипете, за да увеличите, плъзнете, за да преместите';

  @override
  String get cropMouseHint =>
      'Плъзнете ъглите, за да промените размера, плъзнете вътре, за да преместите';

  @override
  String get changeYourFluxerTag => 'Промяна на потребителско име';

  @override
  String get fluxerTagInputLabel => 'Потребителско име';

  @override
  String get fluxerTagDescriptionBase =>
      'Потребителските имена могат да съдържат само букви (a-z, A-Z), цифри (0-9) и долни черти. В потребителските имена не се прави разлика между главни и малки букви.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Потребителските имена могат да съдържат само букви (a-z, A-Z), цифри (0-9) и долни черти. Потребителските имена не правят разлика между малки и главни букви. Можете да изберете всеки наличен 4-цифрен таг от #0000 до #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Потребителските имена могат да съдържат само букви (a-z, A-Z), цифри (0-9) и долни черти. Потребителските имена не правят разлика между главни и малки букви. Можете да изберете всяка налична 4-цифрена таг от #0001 до #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Между $min и $max знака';
  }

  @override
  String get validationAllowedChars =>
      'Само букви (a-z, A-Z), цифри (0-9) и долни черти (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Вземете Plutonium, за да персонализирате своя таг или да го запазите при смяна на потребителското си име';

  @override
  String get fluxerTagAlreadyTaken => 'Потребителското име е заето';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Потребителското име $username#$discriminator вече е заето. Продължаването ще преизбере автоматично вашия дискриминатор.';
  }

  @override
  String get customTagIsTemporary => 'Персонализираният етикет е временен';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Вашият персонализиран 4-цифрен таг е наличен само докато абонаментът ви за Plutonium е активен. Когато абонаментът ви изтече на $date, тагът ви ще се върне към случайно присвоен номер след 3-дневен гратисен период.';
  }

  @override
  String get customTagTemporaryBody =>
      'Вашият персонализиран 4-цифрен таг е наличен само докато абонаментът ви за Plutonium е активен. Когато абонаментът ви изтече, тагът ви ще се върне към случайно присвоен номер след 3-дневен гратисен период.';

  @override
  String get iUnderstandContinue => 'Разбирам, продължи';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Ако запазите това потребителско име, вашият персонализиран 4-цифрен таг ще се върне към случайно число, когато абонаментът ви за Plutonium приключи. Ако абонаментът ви не бъде подновен, ще имате 3-дневен гратисен период, преди тагът да се промени.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Вашият персонализиран 4-цифрен таг (#$discriminator) е активен, докато абонаментът ви за Plutonium е активен. Ако абонаментът ви приключи или не бъде подновен след 3-дневен гратисен период, тагът ви ще се върне към произволен номер.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Персонализирайте своя 4-цифрен таг или го запазете при смяна на потребителското си име';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Вашият Plutonium пробен период изтича на $date. Надстройте, за да запазите своя персонализиран етикет и да спечелите значка в профила си.';
  }

  @override
  String get premiumTrialActive =>
      'Изпробвате Plutonium. Надстройте, за да запазите персонализирания си етикет и да спечелите значка в профила си.';

  @override
  String get fluxerTagUpdated => 'Потребителското име е актуализирано';

  @override
  String get fluxerTagUpdateFailed =>
      'Неуспешно обновяване на потребителското име. Моля, опитайте отново.';

  @override
  String get continueAction => 'Продължи';

  @override
  String get profileCustomizationTitle => 'Персонализиране на профила';

  @override
  String get profileCustomizationDescription =>
      'Редактирай изгледа на профила си и виж предварителен преглед на живо';

  @override
  String get usernameLabel => 'Потребителско име';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Заяви акаунта си, за да промениш потребителското си име';

  @override
  String get changeFluxerTag => 'Промяна на потребителско име';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Персонализирайте своя 4-цифрен таг (#$discriminator) по ваш вкус с Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Промени потребителското си име и 4-цифрен етикет';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Вашият персонализиран таг (#$discriminator) е свързан с вашия Plutonium абонамент и ще се върне към случаен таг, ако изтече.';
  }

  @override
  String get displayNameLabel => 'Показвано име';

  @override
  String get pronounsLabel => 'Местоимения';

  @override
  String get avatarLabel => 'Аватар';

  @override
  String get changeAvatar => 'Смяна на аватара';

  @override
  String get removeAvatar => 'Премахване на аватара';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Макс. 10 MB. Препоръчително: 512×512px';

  @override
  String get bannerLabel => 'Банер';

  @override
  String get changeBanner => 'Смяна на банера';

  @override
  String get removeBanner => 'Премахване на банер';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Макс. 10MB. Минимум: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Цвят на акцента';

  @override
  String get accentColorDescription =>
      'Персонализира цвета на рамката и банера в профила ти';

  @override
  String get aboutMeLabel => 'За мен';

  @override
  String get aboutMeHelperText =>
      'Можеш да използваш линкове, емоджита и Markdown.';

  @override
  String get emojiPickerTitle => 'Емотикони';

  @override
  String get plutoniumBadgePrivacyTitle =>
      'Поверителност на значката Plutonium';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Контролирайте как се показва вашият Plutonium значка на другите';

  @override
  String get hidePlutoniumBadgeLabel => 'Скрий напълно значката Plutonium';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Напълно скрийте значката си Plutonium от други потребители';

  @override
  String get hidePlutoniumPurchaseDate =>
      'Скрий датата на покупка на Plutonium';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Скрий датата на покупка на Plutonium ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Премахни кога за първи път си купил Plutonium от значката си';

  @override
  String get maskVisionaryAsSubscription => 'Маскирай Visionary като абонамент';

  @override
  String get maskVisionaryDescription =>
      'Показване на Visionary като обикновен абонамент';

  @override
  String get hideVisionaryIdBadge => 'Скрий значката „Visionary ID“';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Скрий значката Visionary ID (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription =>
      'Премахване на значката „Visionary ID“';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Вие сте на Plutonium пробен период — абонаментът ви започва на $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Абонаментът ви ще започне автоматично, когато приключи безплатният ви пробен период. Не е необходимо да предприемате действия.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Вашият Plutonium пробен период изтича на $date';
  }

  @override
  String get premiumTrialActiveProfile => 'Пробен период на Plutonium';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Максимум 10 MB. Препоръчително: 512×512 px. Анимирани аватари (GIF) изискват Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Персонализирайте профила си със статично или анимирано банер изображение, за да го отличите.';

  @override
  String get getPlutonium => 'Вземи Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Покупки в приложението все още не са налични на тази платформа. Следете ни — скоро ще бъдат налични!';

  @override
  String get profilePreviewLabel => 'Преглед';

  @override
  String get profilePreviewMessage => 'Изпрати съобщение';

  @override
  String profilePreviewMemberSince(String productName) {
    return 'Член на $productName от';
  }

  @override
  String get unclaimedAccountTitle => 'Незаявен акаунт';

  @override
  String get unclaimedAccountDescription =>
      'Вашият акаунт все още не е заявен. Без имейл и парола може да загубите достъп. Заявете акаунта си сега, за да го защитите.';

  @override
  String get claimAccount => 'Заяви акаунт';

  @override
  String get profileTypeLabel => 'Тип на профила';

  @override
  String get profileTypeGlobal => 'Глобален профил';

  @override
  String get profileTypeGuildDescription =>
      'Редактираш профила си за тази общност. Той ще е видим само в нея и ще замени глобалния ти профил.';

  @override
  String get communityNicknameLabel => 'Прякор в общността';

  @override
  String get perGuildPremiumUpsellText =>
      'Персонализирането на вашия аватар, банер, цвят на акцента и биография за отделни общности изисква Plutonium. Прякорът и местоименията в общността са безплатни за всички.';

  @override
  String get avatarModeInherit => 'Използване на глобален профил';

  @override
  String get avatarModeCustom => 'Използване на персонализирано изображение';

  @override
  String get avatarModeUnset => 'Не показвай';

  @override
  String get profileSavedToast => 'Профилът е актуализиран';

  @override
  String get profileEditButton => 'Редактиране на профил';

  @override
  String get profileNoteLabel => 'Бележка';

  @override
  String get profileNoteVisibility => '(видимо само за теб)';

  @override
  String get profileNoteEmpty => 'Все още няма бележка.';

  @override
  String get sudoTitle => 'Потвърдете самоличността си';

  @override
  String get sudoDescription => 'За да продължите, е необходимо потвърждение.';

  @override
  String get sudoAuthenticatorCode => 'Код за удостоверяване';

  @override
  String get sudoMethodPassword => 'Парола';

  @override
  String get sudoMethodTotp => 'Автентикатор';

  @override
  String get sudoVerificationFailed =>
      'Проверката не успя. Моля, опитайте отново.';

  @override
  String get securityAccountTitle => 'Акаунт';

  @override
  String get securityAccountDescription =>
      'Управлявайте имейла, паролата и настройките на акаунта си';

  @override
  String get securitySectionTitle => 'Сигурност';

  @override
  String get securitySectionDescription =>
      'Защитете акаунта си с двуфакторна автентикация и passkeys';

  @override
  String get securityLoginEmailSectionTitle => 'Имейл настройки';

  @override
  String securityLoginEmailSectionDescription(String productName) {
    return 'Управлявайте имейл адреса, който използвате за влизане в $productName';
  }

  @override
  String get securityLoginEmailAddressLabel => 'Имейл адрес';

  @override
  String get securityLoginNoEmailSet => 'Няма зададен имейл адрес';

  @override
  String get securityLoginChangeEmail => 'Промяна на имейл';

  @override
  String get securityLoginAddEmail => 'Добавяне на имейл';

  @override
  String get securityLoginReveal => 'Покажи';

  @override
  String get securityLoginHide => 'Скрий';

  @override
  String get securityLoginPasswordSectionTitle => 'Парола';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Променете паролата си, за да поддържате акаунта си защитен';

  @override
  String get securityLoginCurrentPasswordLabel => 'Текуща парола';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Последно сменена: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Последна промяна: Никога';

  @override
  String get securityLoginNoPasswordSet => 'Няма зададена парола';

  @override
  String get securityLoginChangePassword => 'Смяна на парола';

  @override
  String get securityLoginSetPassword => 'Задаване на парола';

  @override
  String get passwordChangeTitle => 'Смяна на парола';

  @override
  String get passwordChangeIntroDescription =>
      'Ще изпратим код за потвърждение на имейл адреса ви, за да потвърдим самоличността ви, преди да сменим паролата.';

  @override
  String get passwordChangeStart => 'Започни';

  @override
  String get passwordChangeVerifyTitle => 'Потвърди имейла си';

  @override
  String get passwordChangeVerifyDescription =>
      'Въведете кода за потвърждение, изпратен на вашия имейл адрес.';

  @override
  String get passwordChangeVerificationCode => 'Код за потвърждение';

  @override
  String get passwordChangeVerify => 'Потвърди';

  @override
  String get passwordChangeNewPasswordTitle => 'Задаване на нова парола';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Въведете новата си парола по-долу.';

  @override
  String get passwordChangeNewPassword => 'Нова парола';

  @override
  String get passwordChangeConfirmPassword => 'Потвърди новата парола';

  @override
  String get passwordChangeSubmit => 'Смяна на парола';

  @override
  String get passwordChangeSuccess => 'Паролата е сменена';

  @override
  String get passwordChangePasswordsDoNotMatch => 'Паролите не съвпадат';

  @override
  String get passwordChangeInvalidCode => 'Невалиден или изтекъл код';

  @override
  String get emailChangeTitle => 'Промяна на имейл';

  @override
  String get emailChangeIntroDescription =>
      'Ще изпратим кодове за потвърждение, за да проверим самоличността ви, преди да променим имейл адреса ви.';

  @override
  String get emailChangeStart => 'Започни';

  @override
  String get emailChangeVerifyOriginalTitle => 'Потвърди текущия имейл';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Въведете кода за потвърждение, изпратен на текущия ви имейл адрес.';

  @override
  String get emailChangeNewEmailTitle => 'Въведи нов имейл адрес';

  @override
  String get emailChangeNewEmailDescription =>
      'Въведете новия имейл адрес, който искате да използвате.';

  @override
  String get emailChangeNewEmailLabel => 'Нов имейл';

  @override
  String get emailChangeNewEmailSubmit => 'Изпращане на код за потвърждение';

  @override
  String get emailChangeVerifyNewTitle => 'Потвърди нов имейл';

  @override
  String get emailChangeVerifyNewDescription =>
      'Въведете кода за потвърждение, изпратен на новия ви имейл адрес.';

  @override
  String get emailChangeSuccess => 'Имейлът е променен';

  @override
  String get emailChangeInvalidCode => 'Невалиден или изтекъл код';

  @override
  String get resend => 'Изпрати отново';

  @override
  String resendCountdown(int seconds) {
    return 'Препрати ($seconds сек.)';
  }

  @override
  String get verificationCode => 'Код за потвърждение';

  @override
  String get verify => 'Потвърди';

  @override
  String get enable => 'Активиране';

  @override
  String get disable => 'Изключване';

  @override
  String get delete => 'Изтриване';

  @override
  String get save => 'Запазване';

  @override
  String get securityTfaSectionTitle => 'Двуфакторно удостоверяване';

  @override
  String get securityTfaSectionDescription =>
      'Добави допълнително ниво на защита към акаунта си';

  @override
  String get securityTfaAuthenticatorApp => 'Приложение за удостоверяване';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Двуфакторното удостоверяване е включено';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Използвай приложение за удостоверяване, за да генерираш кодове за двуфакторно удостоверяване';

  @override
  String get securityTfaBackupCodes => 'Кодове за възстановяване';

  @override
  String get securityTfaBackupCodesDescription =>
      'Преглед и управление на кодовете за възстановяване на акаунт';

  @override
  String get securityTfaViewCodes => 'Преглед на кодовете';

  @override
  String get securityPasskeysSectionTitle => 'Ключове за достъп';

  @override
  String get securityPasskeysSectionDescription =>
      'Използвайте ключове за вход без парола и двуфакторно удостоверяване';

  @override
  String get securityPasskeysRegistered => 'Регистрирани ключове за достъп';

  @override
  String get securityPasskeysNone => 'Няма регистрирани пароли';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'пароли',
      one: 'парола',
    );
    return '$count $_temp0 регистрирани (макс. 10)';
  }

  @override
  String get securityPasskeysAdd => 'Добавяне на ключ за достъп';

  @override
  String securityPasskeysAdded(String date) {
    return 'Добавено: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Последно използван: $date';
  }

  @override
  String get securityPasskeysRename => 'Преименуване';

  @override
  String get securityPasskeysDeleteTitle => 'Изтриване на ключ за достъп';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Сигурни ли сте, че искате да изтриете пропусключа $name?';
  }

  @override
  String get securityPasskeyNameTitle => 'Наименуване на ключа за достъп';

  @override
  String get securityPasskeyNameLabel => 'Име на ключ за достъп';

  @override
  String get securityPasskeyNameHint =>
      'напр. YubiKey, iPhone, служебен компютър';

  @override
  String get securityPhoneSectionTitle => 'Телефонен номер';

  @override
  String get securityPhoneSectionDescription =>
      'Управлявайте телефонния си номер.';

  @override
  String get securityPhoneLabel => 'Телефонен номер';

  @override
  String get securityPhoneNone => 'Не е добавен телефонен номер.';

  @override
  String get securityPhoneAdd => 'Добавяне на телефон';

  @override
  String get securityPhoneRemove => 'Премахване';

  @override
  String get securityPhoneRemoveTitle => 'Премахване на телефонен номер';

  @override
  String get securityPhoneRemoveDescription =>
      'Сигурни ли сте, че искате да премахнете телефонния си номер?';

  @override
  String get securityPhoneRemoved => 'Телефонният номер е премахнат';

  @override
  String get securityClaimTitle => 'Функции за сигурност';

  @override
  String get securityClaimDescription =>
      'Заяви акаунта си, за да получиш достъп до функции за сигурност като двуфакторно удостоверяване и ключове за достъп.';

  @override
  String get securityVerifyEmailRequired =>
      'Трябва да потвърдите имейл адреса си, преди да можете да настроите двуфакторна автентикация, пропуск ключове или SMS проверка.';

  @override
  String get totpEnableTitle => 'Настройване на приложение за удостоверяване';

  @override
  String get totpEnableDescription =>
      'Сканирайте QR кода с приложението си за удостоверяване, за да генерирате кодове за двуфакторна автентикация.';

  @override
  String get totpEnableCodeLabel => 'Код';

  @override
  String get totpEnableCodeHint =>
      'Въведете 6-цифрения код от приложението си за удостоверяване';

  @override
  String get totpEnableSuccess => 'Двуфакторното удостоверяване е активирано';

  @override
  String get totpDisableTitle => 'Премахване на приложението за удостоверяване';

  @override
  String get totpDisableDescription =>
      'Въведете 6-цифрения код от приложението си за удостоверяване, за да деактивирате двуфакторното удостоверяване.';

  @override
  String get totpDisableSuccess =>
      'Двуфакторното удостоверяване е деактивирано';

  @override
  String get backupCodesTitle => 'Кодове за възстановяване';

  @override
  String get backupCodesWarning =>
      'Ако загубите достъп до приложението си за удостоверяване и нямате тези кодове, ще бъдете завинаги заключени от профила си. Изтеглете ги или ги копирайте сега и ги съхранявайте на сигурно място.';

  @override
  String get backupCodesDownload => 'Изтегляне';

  @override
  String get backupCodesCopy => 'Копирай';

  @override
  String get backupCodesCopied => 'Резервните кодове са копирани в клипборда';

  @override
  String get backupCodesAcknowledge =>
      'Изтеглих или копирах моите резервни кодове и ги съхраних на сигурно място.';

  @override
  String get backupCodesDone => 'Готово';

  @override
  String get backupCodesViewTitle => 'Преглед на кодовете за възстановяване';

  @override
  String get backupCodesViewDescription =>
      'Може да се наложи потвърждение, преди да видите резервните си кодове.';

  @override
  String get phoneAddTitle => 'Добавяне на телефонен номер';

  @override
  String get phoneAddLabel => 'Телефонен номер';

  @override
  String get phoneAddHint => 'Въведи телефонния си номер';

  @override
  String get phoneAddFooter =>
      'Ще изпратим SMS код, когато е наличен. Вашият номер не е свързан с акаунта ви. Запазваме само криптиран маркер, без потребителско ID, за да позволим максимум 2 проверки за около 30 дни.';

  @override
  String get phoneAddSendCode => 'Изпращане на код';

  @override
  String get phoneVerifyTitle => 'Потвърди телефонния номер';

  @override
  String get phoneVerifyDescription =>
      'Въведете кода за потвърждение, изпратен на вашия телефонен номер.';

  @override
  String get phoneAddSuccess => 'Телефонният номер е потвърден';

  @override
  String get phoneCountryLabel => 'Държава';

  @override
  String get phoneSearchCountries => 'Търсене на държави...';

  @override
  String get phoneNumberRequired => 'Изисква се телефонен номер';

  @override
  String get phoneEnterValidNumber => 'Въведи валиден мобилен телефонен номер.';

  @override
  String get phoneCannotBeUsed =>
      'Този телефонен номер не може да бъде използван. Опитай друг мобилен номер или се свържи с поддръжката.';

  @override
  String get phoneAlreadyUsed =>
      'Този телефонен номер вече е използван. Опитай друг номер или се свържи с поддръжката.';

  @override
  String get phoneCodeDidNotWork =>
      'Този код не проработи. Провери го и опитай отново.';

  @override
  String get phoneTooManyAttempts =>
      'Твърде много опити. Изчакай малко и опитай отново.';

  @override
  String get phoneSmsUnavailable =>
      'Потвърждението по SMS не е достъпно в момента. Опитай отново по-късно или се свържи с поддръжката.';

  @override
  String get phoneNotEligible =>
      'Потвърждаването по телефон не е налично за този акаунт. Използвай друг метод или се свържи с поддръжката.';

  @override
  String get phoneSomethingWentWrong => 'Нещо се обърка. Опитай отново.';

  @override
  String get phoneInboundExpensiveDescription =>
      'Изпращането на SMS до този телефонен номер е твърде скъпо, затова искаме вие да ни изпратите SMS. Можете също да се свържете с поддръжката, за да премахнем това изискване от профила ви.';

  @override
  String get phoneInboundDefaultDescription =>
      'Трябва да ни изпратите SMS, за да потвърдим телефонния си номер.';

  @override
  String get phoneInboundStepOpenMessaging =>
      'Отвори приложението за съобщения на телефона си и създай ново текстово съобщение.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'Изпратете кода $code на $number.';
  }

  @override
  String get phoneInboundStepWait =>
      'Изчакайте да получим вашето съобщение. Това може да отнеме минута.';

  @override
  String get phoneInboundGetNewCode => 'Получаване на нов код';

  @override
  String get phoneInboundChallengeCodeLabel => 'Код за изпращане';

  @override
  String get phoneInboundOurNumberLabel => 'Изпращане до';

  @override
  String get requiredActionTitle => 'Изисква се потвърждение на акаунта';

  @override
  String requiredActionIntroGeneric(String productName) {
    return 'Завърши необходимото потвърждение, за да продължиш да използваш $productName.';
  }

  @override
  String get requiredActionIntroPhone =>
      'Регистрацията ти изисква допълнителна проверка срещу спам, преди да продължиш.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return 'Потвърди имейла или телефона си, за да продължиш да използваш $productName.';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return 'Изпълни задължителните стъпки за потвърждение на имейл и телефон по-долу, за да продължиш да използваш $productName.';
  }

  @override
  String get requiredActionChooseMethodTitle =>
      'Изберете метод за потвърждение';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return 'Завърши един от начините за потвърждение по-долу, за да продължиш да използваш $productName.';
  }

  @override
  String get requiredActionUseEmail => 'Използвай имейл';

  @override
  String get requiredActionUsePhone => 'Използвай телефон';

  @override
  String get requiredActionCheckEmailTitle => 'Провери имейла си';

  @override
  String get requiredActionCheckEmailDescription =>
      'Изпратихме връзка за потвърждение на имейл адреса ви. Отворете я, за да продължите.';

  @override
  String get requiredActionResendVerificationEmail =>
      'Изпрати отново имейл за потвърждение';

  @override
  String get requiredActionVerificationEmailSent =>
      'Изпратен е имейл за потвърждение. Провери входящата си поща.';

  @override
  String get requiredActionSignOut => 'Изход';

  @override
  String get dangerZoneSectionTitle => 'Опасна зона';

  @override
  String get dangerZoneSectionDescription =>
      'Необратими и разрушителни действия';

  @override
  String get dangerZoneDisableTitle => 'Деактивиране на акаунт';

  @override
  String get dangerZoneDisableDescription =>
      'Деактивирай временно акаунта си. Можеш да го активираш отново по-късно, като влезеш пак.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Деактивирането на акаунта ви ще ви отпише от всички сесии. Можете да активирате акаунта си отново по всяко време, като влезете отново.';

  @override
  String get dangerZoneDeleteTitle => 'Изтриване на акаунт';

  @override
  String get dangerZoneDeleteDescription =>
      'Изтрий завинаги акаунта си и всички свързани данни. Това действие не може да бъде отменено.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Отменете активния си Plutonium абонамент в настройките на Plutonium, преди да изтриете акаунта си.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount =>
      'Акаунтът не може да бъде изтрит';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Не можеш да изтриеш акаунта си, докато притежаваш общности. Първо прехвърли собствеността върху следните общности:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'и още $count';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'За да прехвърлите собствеността, отидете на $settingsPath и използвайте опцията за прехвърляне на собствеността.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Наистина ли искаш да изтриеш акаунта си? Акаунтът ти ще бъде насрочен за окончателно изтриване.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Можеш да отмениш процеса по изтриване до 14 дни';

  @override
  String get dangerZoneDeleteBullet2 =>
      'След 14 дни акаунтът ти ще бъде изтрит завинаги';

  @override
  String get dangerZoneDeleteBullet3 =>
      'След като изтриването бъде обработено, няма да можеш да възстановиш достъпа до акаунта си';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Няма да можете да изтриете изпратените си съобщения, след като акаунтът ви бъде изтрит';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Ако искате да експортирате данните си или да изтриете съобщенията си първо, моля, посетете секцията „Табло за поверителност“ в Настройките на потребителя, преди да продължите.';

  @override
  String get claimAccountTitle => 'Заяви акаунта си';

  @override
  String get claimAccountDescription =>
      'Заяви акаунта си, като добавиш имейл и парола. Ще изпратим код за потвърждение на имейла ти, преди да завършиш.';

  @override
  String get claimAccountEmailLabel => 'Имейл';

  @override
  String get claimAccountPasswordLabel => 'Парола';

  @override
  String get claimAccountSendCode => 'Изпращане на код';

  @override
  String get claimAccountVerifyDescription =>
      'Въведи кода, който изпратихме на имейла ти, за да го потвърдиш. Паролата ти ще бъде зададена, след като кодът бъде потвърден.';

  @override
  String get claimAccountSuccess => 'Акаунтът е заявен успешно';

  @override
  String get importantInformation => 'Важна информация:';

  @override
  String get genericError => 'Възникна грешка';

  @override
  String get networkErrorMessage => 'Нещо се обърка. Моля, опитайте отново.';

  @override
  String get invalidCode => 'Невалиден код';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'преди $count години',
      one: 'преди 1 година',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'преди $count месеца',
      one: 'преди 1 месец',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'преди $count дни',
      one: 'преди 1 ден',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'преди $count часа',
      one: 'преди 1 час',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'преди $count минути',
      one: 'преди 1 минута',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'преди $count седмици',
      one: 'преди 1 седмица',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'след $count минути',
      one: 'след 1 минута',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'след $count часа',
      one: 'след 1 час',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'след $count дни',
      one: 'след 1 ден',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'след $count седмици',
      one: 'след 1 седмица',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'след $count месеца',
      one: 'след 1 месец',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'след $count години',
      one: 'след 1 година',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'току-що';

  @override
  String get authorizedAppsTitle => 'Оторизирани приложения';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Тези приложения имат достъп до вашия акаунт в $productName.';
  }

  @override
  String get authorizedAppsEmptyTitle => 'Няма оторизирани приложения';

  @override
  String get authorizedAppsEmptyDescription =>
      'Нямаш оторизирани приложения с достъп до акаунта ти.';

  @override
  String get authorizedAppsLoadError =>
      'Неуспешно зареждане на оторизирани приложения';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Упълномощен на $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Разрешения, предоставени';

  @override
  String get authorizedAppsRevoke => 'Отмени';

  @override
  String get authorizedAppsRevokeTitle => 'Отнемане на достъп до приложението';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Сигурни ли сте, че искате да отмените достъпа за $appName? Това приложение вече няма да има достъп до вашия акаунт.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Достъп до основната информация в профила ти (потребителско име, аватар и др.)';

  @override
  String get authorizedAppsScopeEmail => 'Преглед на имейл адреса ти';

  @override
  String get authorizedAppsScopeGuilds =>
      'Преглед на общностите, в които членуваш';

  @override
  String get authorizedAppsScopeConnections =>
      'Преглед на свързаните ти акаунти';

  @override
  String get authorizedAppsScopeBot =>
      'Добавяне на бот към общност с поисканите разрешения';

  @override
  String get authorizedAppsScopeAdmin =>
      'Достъп до административни крайни точки';

  @override
  String get applicationsTitle => 'Приложения';

  @override
  String get applicationsCreate => 'Създаване на приложение';

  @override
  String get applicationsCreateSubmit => 'Създаване';

  @override
  String get applicationsCreateClaimTooltip =>
      'Заяви акаунта си, за да създаваш приложения.';

  @override
  String applicationsDocsLink(String domain) {
    return 'Прочети документацията ($domain)';
  }

  @override
  String get applicationsLoadError => 'Приложенията не могат да бъдат заредени';

  @override
  String get applicationsLoadErrorDescription =>
      'Провери връзката си и опитай отново.';

  @override
  String get applicationsEmptyTitle => 'Все още няма приложения';

  @override
  String applicationsEmptyDescription(String apiName) {
    return 'Създай първото си приложение, за да започнеш с $apiName.';
  }

  @override
  String applicationsCreated(String date) {
    return 'Created $date';
  }

  @override
  String get applicationsName => 'Име на приложението';

  @override
  String get applicationsNameHint => 'Моето приложение';

  @override
  String get applicationsNameRequired => 'Името на приложението е задължително';

  @override
  String get applicationsBackToList => 'Назад към списъка';

  @override
  String get applicationsDetailLoadError =>
      'Приложението не можа да бъде заредено';

  @override
  String get applicationsDetailLoadErrorDescription =>
      'Опитай отново или се върни към списъка с приложения.';

  @override
  String get applicationsId => 'ID на приложението';

  @override
  String get applicationsCopyId => 'Копирай ID';

  @override
  String get applicationsSecretsTitle => 'Тайни и токени';

  @override
  String get applicationsSecretsDescription =>
      'Пази ги на сигурно място. Генерирането на нови ще прекъсне съществуващите интеграции.';

  @override
  String get applicationsClientSecret => 'Клиентска тайна';

  @override
  String get applicationsBotToken => 'Токен на бота';

  @override
  String get applicationsRegenerate => 'Генериране наново';

  @override
  String get applicationsRegenerateClientSecretTitle =>
      'Да се генерира ли нова клиентска тайна?';

  @override
  String get applicationsRegenerateBotTokenTitle =>
      'Да се генерира ли нов токен за бота?';

  @override
  String get applicationsRegenerateClientSecretDescription =>
      'Генерирането на нова тайна ще направи текущата невалидна. Актуализирай всеки код, който използва старата стойност.';

  @override
  String get applicationsRegenerateBotTokenDescription =>
      'Генерирането на нов токен ще направи текущия невалиден. Актуализирай всеки код, който използва старата стойност.';

  @override
  String get applicationsClientSecretRegenerated =>
      'Клиентската тайна е генерирана наново. Актуализирай всеки код, който използва старата тайна.';

  @override
  String get applicationsBotTokenRegenerated =>
      'Токенът на бота е генериран наново. Актуализирай всеки код, който използва стария токен.';

  @override
  String get applicationsRegenerateFailed =>
      'Неуспешно повторно генериране на секретния ключ';

  @override
  String get applicationsInfoTitle => 'Информация за приложението';

  @override
  String get applicationsInfoDescription =>
      'Основни настройки и разрешени URI адреси за пренасочване.';

  @override
  String get applicationsPublicBot => 'Публичен бот';

  @override
  String get applicationsPublicBotDescription =>
      'Позволява на всеки да кани този бот в своите общности.';

  @override
  String get applicationsRequireCodeGrant =>
      'Изискване на предоставяне на OAuth2 код';

  @override
  String get applicationsRequireCodeGrantDescription =>
      'Изисква URI за пренасочване и код за оторизация при покана на този бот.';

  @override
  String get applicationsRedirectUris => 'URI адреси за пренасочване';

  @override
  String get applicationsAddRedirect => 'Добавяне на пренасочване';

  @override
  String get applicationsDeleteRedirect => 'Изтриване на URI за пренасочване';

  @override
  String get applicationsBotProfileTitle => 'Профил на бота';

  @override
  String get applicationsBotProfileDescription =>
      'Аватар, таг и подробен профил за твоя бот.';

  @override
  String get applicationsBotAvatar => 'Аватар на бота';

  @override
  String get applicationsUsernameRequired => 'Изисква се потребителско име';

  @override
  String get applicationsUsernameTooLong =>
      'Потребителското име трябва да е до 32 знака';

  @override
  String get applicationsUsernameInvalid =>
      'Потребителското име може да съдържа само букви, цифри и долни черти';

  @override
  String get applicationsBotUsername => 'Потребителско име на бота';

  @override
  String get applicationsDiscriminator => 'Дискриминатор';

  @override
  String get applicationsBotBio => 'Биография на бота';

  @override
  String get applicationsBotBioHint =>
      'Полезен бот, който прави невероятни неща!';

  @override
  String get applicationsNoBotBanner => 'Няма банер на бота';

  @override
  String get applicationsFriendlyBot => 'Приятелски бот';

  @override
  String get applicationsFriendlyBotDescription =>
      'Позволява на потребителите да изпращат на този бот покани за приятелство, които се одобряват ръчно.';

  @override
  String get applicationsManualFriendApproval =>
      'Изискване на ръчно одобрение за приятелство';

  @override
  String get applicationsManualFriendApprovalDescription =>
      'Поканите за приятелство към този бот изискват ръчно одобрение.';

  @override
  String get applicationsOauthBuilderTitle => 'Конструктор на OAuth2 URL';

  @override
  String get applicationsOauthBuilderDescription =>
      'Construct an authorize URL with scopes and permissions.';

  @override
  String get applicationsScopes => 'Обхвати';

  @override
  String get applicationsRedirectUri => 'URI за пренасочване';

  @override
  String get applicationsSelectRedirectUri => 'Избери URI за пренасочване';

  @override
  String get applicationsRedirectRequiredCodeGrant =>
      'URI за пренасочване е задължителен, защото този бот изисква предоставяне на OAuth2 код.';

  @override
  String get applicationsRedirectRequiredScopes =>
      'Изисква се URI за пренасочване, когато не се използва само обхватът на бота.';

  @override
  String get applicationsBotPermissions => 'Разрешения за бота';

  @override
  String get applicationsAuthorizeUrl => 'URL за оторизация';

  @override
  String get applicationsAuthorizeUrlPlaceholder =>
      'Избери обхвати (и URI за пренасочване, ако е необходимо)';

  @override
  String get applicationsCopyAuthorizeUrl => 'Copy authorize URL';

  @override
  String get applicationsCopiedUrl => 'URL адресът е копиран в клипборда';

  @override
  String get applicationsDangerTitle => 'Опасна зона';

  @override
  String get applicationsDangerSubtitle =>
      'Това действие не може да бъде отменено. Премахването на приложението изтрива и неговия бот.';

  @override
  String get applicationsDangerHelper =>
      'След изтриване приложението и идентификационните му данни се премахват за постоянно.';

  @override
  String get applicationsDelete => 'Изтриване на приложението';

  @override
  String applicationsDeleteConfirmDescription(String name) {
    return 'Are you sure you want to delete $name? This action cannot be undone. All associated data, including the bot user, will be permanently deleted.';
  }

  @override
  String get applicationsDeleteFailed => 'Приложението не можа да бъде изтрито';

  @override
  String get applicationsUpdated => 'Приложението е актуализирано успешно';

  @override
  String get applicationsNoChanges => 'Няма промени за запазване';

  @override
  String get applicationsSearchBots => 'Приложения и ботове';

  @override
  String get applicationsSearchBotsDescription =>
      'Създаване и управление на приложения и ботове за акаунта ти';

  @override
  String get applicationsSearchInfoDescription =>
      'Редактиране на основни данни за приложението и URI адреси за пренасочване';

  @override
  String get applicationsSearchBotProfileDescription =>
      'Редактиране на аватара, тага, биографията и банера на бота, както и поведението при покани за приятелство';

  @override
  String get applicationsSearchOauthDescription =>
      'Създаване на URL адрес за оторизация с обхвати, пренасочвания и разрешения за ботове';

  @override
  String get applicationsSearchSecretsDescription =>
      'Преглед и повторно генериране на клиентски тайни и токени на ботове';

  @override
  String get applicationsSearchBotsKeyword => 'Ботове';

  @override
  String get applicationsSearchDocumentation => 'Документация';

  @override
  String get privacyPendingDeletionTitle => 'Чакащо изтриване';

  @override
  String get blockedUsersTitle => 'Блокирани потребители';

  @override
  String get blockedUsersDescription =>
      'Блокираните потребители не могат да ти изпращат покани за приятелство или директни съобщения.';

  @override
  String get blockedUsersEmptyTitle => 'Няма блокирани потребители';

  @override
  String get blockedUsersEmptyDescription =>
      'Все още нямаш блокирани потребители.';

  @override
  String get blockedUsersLoadError =>
      'Неуспешно зареждане на блокирани потребители';

  @override
  String get blockedUsersUnblock => 'Отблокиране';

  @override
  String get blockedUsersUnblockTitle => 'Отблокиране на потребител';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Сигурни ли сте, че искате да премахнете $username от блокираните потребители?';
  }

  @override
  String get blockedUsersCopyTag => 'Копирай потребителското име';

  @override
  String get blockedUsersCopyId => 'Копирай ID на потребителя';

  @override
  String get userProfileLoadError => 'Не успяхме да заредим профила';

  @override
  String get userProfileLoading => 'Зареждане на профил';

  @override
  String get userProfileRetry => 'Опитай отново';

  @override
  String get userProfileMessage => 'Изпрати съобщение';

  @override
  String get userProfileVoiceCall => 'Гласово повикване';

  @override
  String get userProfileVideoCall => 'Видеообаждане';

  @override
  String get userProfileEditProfile => 'Редактиране на профил';

  @override
  String userProfileStaffBadgeTooltip(String productName) {
    return 'Екип на $productName';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return 'Екип на общността на $productName';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return 'Партньор на $productName';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return 'Ловец на бъгове в $productName';
  }

  @override
  String userProfilePlutoniumBadgeTooltip(String productName) {
    return 'Plutonium на $productName';
  }

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(
    String productName,
    String date,
  ) {
    return '$productName Plutonium абонат от $date';
  }

  @override
  String userProfileVisionaryBadgeTooltip(String productName) {
    return 'Визионер на $productName';
  }

  @override
  String userProfileVisionaryBadgeSinceTooltip(
    String productName,
    String date,
  ) {
    return '$productName Визионер от $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'ID на визионер #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Общи приятели ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Общи общности ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Общи приятели';

  @override
  String get userProfileMutualCommunitiesTitle => 'Общи общности';

  @override
  String get userProfileNoMutualFriends => 'Няма намерени общи приятели.';

  @override
  String get userProfileNoMutualCommunities => 'Няма намерени общи общности.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Прякор: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Отваряне на DM';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Блокирахте $username. Няма да можете да изпращате съобщения, освен ако не го отблокирате.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Отблокиране';

  @override
  String get userProfileOpenDm => 'Отваряне на DM';

  @override
  String get userProfileNoteTitle => 'Бележка';

  @override
  String get userProfileNoteVisibility => '(видимо само за теб)';

  @override
  String get userProfileNoteSave => 'Запазване';

  @override
  String get userProfileNoteDelete => 'Изтриване';

  @override
  String get userProfileNoteEmpty => 'Кликни, за да добавиш бележка';

  @override
  String get userProfileMemberSince => 'Член от';

  @override
  String get userProfileAboutMe => 'За мен';

  @override
  String get userProfileRoles => 'Роли';

  @override
  String get memberRoleAdd => 'Добавяне на роля';

  @override
  String memberRoleRemove(String roleName) {
    return 'Премахване на роля $roleName';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'Този потребител няма роли в тази общност.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'Все още няма роли. Добави роли в $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'Няма налични роли';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'В момента няма роли за назначаване в тази общност, но можете да създадете нова роля в $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Настройки на общността';

  @override
  String get guildSettingsRolesTab => 'Роли';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Местно време';

  @override
  String get profileLocalTimeSettingsTitle => 'Profile local time';

  @override
  String profileLocalTimeSettingsSummary(String productName) {
    return 'Set your time zone once so $productName can keep your UTC offset current when daylight saving time changes. Other people can only see your UTC offset, not your exact time zone identifier.';
  }

  @override
  String get profileLocalTimeEditButton => 'Edit profile local time';

  @override
  String get profileLocalTimeTimezoneLabel => 'Time zone';

  @override
  String profileLocalTimeTimezoneHelp(String productName) {
    return 'Choose the time zone $productName uses to calculate your UTC offset for profile local time.';
  }

  @override
  String get profileLocalTimeSearchTimezones => 'Search time zones';

  @override
  String get profileLocalTimeNotSet => 'Not set';

  @override
  String profileLocalTimePrivacyNote(
    String timezoneIdentifierExample,
    String productName,
  ) {
    return 'Other people can only see your current UTC offset when you choose to share profile local time. They do not see your exact time zone identifier, such as $timezoneIdentifierExample. $productName stores that identifier only so the offset can update automatically when daylight saving time changes.';
  }

  @override
  String get profileLocalTimePrivacyEveryone => 'Everyone';

  @override
  String get profileLocalTimePrivacyEveryoneDesc =>
      'Allow anyone who can view your full profile to see your local time';

  @override
  String get profileLocalTimePrivacyFriends => 'Friends';

  @override
  String get profileLocalTimePrivacyFriendsDesc =>
      'Allow your friends to see your local time';

  @override
  String get profileLocalTimePrivacyCommunityMembers => 'Community members';

  @override
  String get profileLocalTimePrivacyCommunityMembersDesc =>
      'Allow members from communities you\'re in to see your local time';

  @override
  String get userProfileSameTimeAsYou => 'В същия часови пояс като теб';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return '$duration напред спрямо теб';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return '$duration назад спрямо теб';
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
      other: '$minutes минути',
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
      other: '$minutes минути',
      one: '1 минута',
    );
    return '$_temp0';
  }

  @override
  String get userProfileCopyUsername => 'Копирай потребителското име';

  @override
  String get userProfileCopyUserId => 'Копирай ID на потребителя';

  @override
  String get userProfileViewMainProfile => 'Преглед на основния профил';

  @override
  String get userProfileViewCommunityProfile =>
      'Преглед на профила в общността';

  @override
  String get userProfileBlockUser => 'Блокиране на потребител';

  @override
  String get userProfileUnblockUser => 'Отблокиране на потребител';

  @override
  String get userProfileRemoveFriend => 'Премахване от приятели';

  @override
  String get userProfileBlockConfirmTitle => 'Блокиране на потребител';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Сигурни ли сте, че искате да блокирате $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Отблокиране на потребител';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Сигурни ли сте, че искате да премахнете $username от черния списък?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Премахване от приятели';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Сигурни ли сте, че искате да премахнете $username като приятел?';
  }

  @override
  String get userProfileFailedOpenDm => 'Неуспешно отваряне на лично съобщение';

  @override
  String get userProfileFailedSaveNote => 'Неуспешно запазване на бележката';

  @override
  String get userProfileActionFailed =>
      'Действието не бе успешно, моля, опитайте отново';

  @override
  String get userProfileChangeNickname => 'Промяна на прякор';

  @override
  String get userProfileKick => 'Изгонване';

  @override
  String get userProfileBan => 'Забраняване';

  @override
  String get userProfileTimeout => 'Време за изчакване';

  @override
  String get userProfileRemoveTimeout => 'Премахване на времето за изчакване';

  @override
  String get userProfileTransferOwnership => 'Прехвърляне на собствеността';

  @override
  String get userProfileReportUser => 'Докладване на потребител';

  @override
  String get userProfileReportMessage => 'Докладване на съобщение';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Изгонване на $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Сигурни ли сте, че искате да изгоните $username? Той/тя може да се присъедини отново с нова покана.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Премахване на забрана?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Премахването на забраната ще позволи на $username отново да изпраща съобщения, да реагира и да се присъединява към гласови канали.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Прехвърляне на собствеността?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Прехвърляне на собствеността на тази общност на $username? Това е необратимо и ще загубите всички права на собственик.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Забрани $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Продължителност на забраната';

  @override
  String get userProfileBanCustomSecondsLabel =>
      'Персонализирана продължителност (секунди)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Всяка стойност от $min до $max секунди';
  }

  @override
  String get userProfileBanDeleteHistoryLabel =>
      'Изтриване на историята на съобщенията';

  @override
  String get userProfileBanDeleteNone => 'Не изтривай нищо';

  @override
  String get userProfileBanDelete24h => 'Последните 24 часа';

  @override
  String get userProfileBanDelete7d => 'Последните 7 дни';

  @override
  String get userProfileBanReasonLabel => 'Причина (по избор)';

  @override
  String get userProfileBanReasonHint => 'Въведи причина за забраната';

  @override
  String get userProfileBanSubmit => 'Забрани член';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Временно блокиране на $username';
  }

  @override
  String get userProfileTimeoutDurationLabel =>
      'Продължителност на времето за изчакване';

  @override
  String get userProfileTimeoutSubmit => 'Временно отстраняване на член';

  @override
  String get userProfileNicknameLabel => 'Прякор';

  @override
  String get userProfileNicknameHint => 'Въведете прякор';

  @override
  String get userProfileNicknameSave => 'Запазване';

  @override
  String userProfileKickSuccess(String username) {
    return 'Изритаxме $username';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Забранен $username';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Забраних достъпа на $username';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Премахнах времето за изчакване за $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Прякорът е актуализиран';

  @override
  String get userProfileTransferSuccess => 'Собствеността е прехвърлена';

  @override
  String get durationPermanent => 'Постоянно';

  @override
  String get duration60Seconds => '60 секунди';

  @override
  String get duration5Minutes => '5 минути';

  @override
  String get duration10Minutes => '10 минути';

  @override
  String get duration1Hour => '1 час';

  @override
  String get duration12Hours => '12 часа';

  @override
  String get duration1Day => '1 ден';

  @override
  String get duration3Days => '3 дни';

  @override
  String get duration5Days => '5 дни';

  @override
  String get duration1Week => '1 седмица';

  @override
  String get duration2Weeks => '2 седмици';

  @override
  String get duration1Month => '1 месец';

  @override
  String get durationCustom => 'По избор…';

  @override
  String get iarReportUserTitle => 'Докладване на потребител';

  @override
  String get iarReportGuildTitle => 'Докладване на общността';

  @override
  String get iarReportGuildPreconfirmBody =>
      'Ако този сигнал е за конкретно съобщение в тази общност, докладвай това съобщение. Сигналите за съобщения дават на екипа ни за безопасност най-ясен контекст, а добавянето на подробности в коментарите може да ни помогне да го прегледаме по-бързо. Продължи с докладването на общността като цяло само ако докладването на съобщение не би обхванало по-широкия проблем.';

  @override
  String get iarContinueToReportCommunity =>
      'Продължи с докладването на общността';

  @override
  String get iarPreviewCommunitySubtitle => 'Общност';

  @override
  String get iarReasonHarassmentGuildLabel => 'Тормоз или целенасочени нападки';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'Общността улеснява груповите атаки или целенасочената злоупотреба.';

  @override
  String get iarReasonHateGuildDescription =>
      'Насърчава омраза срещу защитени групи.';

  @override
  String get iarReasonTerrorismLabel => 'Тероризъм или насилствен екстремизъм';

  @override
  String get iarReasonTerrorismDescription =>
      'Насърчава, набира или координира насилствена екстремистка дейност.';

  @override
  String get iarReasonMatureContentGuildLabel =>
      'Съдържание за възрастни или неправилно ограничаване на достъпа';

  @override
  String get iarReasonMatureContentGuildDescription =>
      'Съдържание за възрастни без подходящо ограничаване на достъпа.';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      'Застрашава непълнолетни или съдържа материали с експлоатация на деца.';

  @override
  String get iarReasonRaidLabel => 'Координиране на атаки';

  @override
  String get iarReasonRaidDescription =>
      'Координира атаки, групови нападки или тормоз срещу хора или общности.';

  @override
  String get iarReasonSpamGuildDescription =>
      'Общността съществува за спам, измами или злоупотреба с платформата.';

  @override
  String get iarReasonMalwareGuildLabel =>
      'Разпространение на злонамерен софтуер';

  @override
  String get iarReasonMalwareGuildDescription =>
      'Разпространява зловреден софтуер, краде данни за достъп или вредоносни файлове.';

  @override
  String get iarReasonPrivacyGuildLabel =>
      'Нарушаване на поверителността или доксинг';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'Споделя лична информация, дебне потребители или координира злоупотреба с лични данни.';

  @override
  String get iarReasonSelfHarmGuildLabel => 'Насърчава самонараняване';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'Насърчава самоубийство, самонараняване или хранителни разстройства.';

  @override
  String get iarReasonInappropriateProfile => 'Неподходящ профил';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Профилът на този потребител съдържа неподходящо съдържание';

  @override
  String typingIndicatorOne(String name) {
    return '$name пише...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 и $name2 пишат...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 и $name3 пишат...';
  }

  @override
  String get typingIndicatorMultiple => 'Няколко души пишат...';

  @override
  String get typingIndicatorHandful => 'Няколко души пишат...';

  @override
  String get typingIndicatorSymphony => 'Някой пише...';

  @override
  String get typingIndicatorFiesta => 'Тук е пълна фиеста от писане';

  @override
  String get typingIndicatorApocalypse => 'Леле, настава апокалипсис от писане';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Радваме се, че си тук, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Добре дошли, $username! Чувствай се като у дома си.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Здравей, $username! Радваме се, че си тук.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Здравей, $username! Включи се, когато ти е удобно.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Здравей, $username, радваме се да те видим тук!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Здравей, $username! Надяваме се да ти хареса тук.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Здравей, $username! Радваме се, че си при нас.';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Радваме се, че се присъедини, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Заповядай, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Добре дошли, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Добре дошли, $username! Радваме се, че си тук.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Добре дошли, $username! Надяваме се да ти хареса тук.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Добре дошли, $username! Следващият ти разговор започва тук.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Добре дошли, $username. Радваме се, че си при нас.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Приятно ни е да те видим, $username! Заповядай.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Вече си тук, $username! Радваме се, че си с нас.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Пристигна, $username! Да започваме.';
  }

  @override
  String get relativeTimeShortNow => 'сега';

  @override
  String relativeTimeShortMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count мин.',
      one: '1 мин.',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ч.',
      one: '1 ч.',
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
      other: '$count мес.',
      one: '1 мес.',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count г.',
      one: '1 г.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'Моите устройства';

  @override
  String get linkedDevicesDescription =>
      'Вижте всички устройства, които в момента са влезли в профила ви. Отменете всички сесии, които не разпознавате.';

  @override
  String get linkedDevicesCurrentDevice => 'Текущо устройство';

  @override
  String get linkedDevicesOtherDevices => 'Други устройства';

  @override
  String get linkedDevicesEnterSelection => 'Влез в режим на избор';

  @override
  String get linkedDevicesExitSelection => 'Изход от режим на избор';

  @override
  String get linkedDevicesSelectAll => 'Избери всичко';

  @override
  String get linkedDevicesClearSelection => 'Изчистване на избора';

  @override
  String get linkedDevicesRevokeTooltip =>
      'Отнемане на достъпа на устройството';

  @override
  String get linkedDevicesSignOutAll => 'Излизане от всички други устройства';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Изход от $count устройства',
      one: 'Изход от 1 устройство',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Изход от $count устройства',
      one: 'Изход от 1 устройство',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Излизане от всички други устройства';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Това ще излезе от избраните устройства от профила ви. Ще трябва да влезете отново на тези устройства.',
      one:
          'Това ще излезе от избраното устройство от профила ви. Ще трябва да влезете отново на това устройство.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Това ще изтрие данните за вход от избраните устройства. Ще трябва да влезете отново на тези устройства.';

  @override
  String get linkedDevicesSignOutConfirm => 'Продължи';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Ще трябва да влезете отново на всички излезли устройства';

  @override
  String get linkedDevicesLoadErrorTitle => 'Мрежова грешка';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Имаме проблем с връзката към пространствено-времевия континуум. Моля, проверете връзката си и опитайте отново.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Устройствата са отнети',
      one: 'Устройството е отнето',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'Не успяхме да излезем. Опитайте отново.';

  @override
  String get linkedDevicesUnknownOs => 'Неизвестна ОС';

  @override
  String get linkedDevicesUnknownPlatform => 'Неизвестна платформа';

  @override
  String get linkedDevicesViewDetails => 'Преглед на подробности';

  @override
  String get linkedDevicesDetailsTitle => 'Подробности за устройството';

  @override
  String get linkedDevicesDetailsDevice => 'Устройство';

  @override
  String get linkedDevicesDetailsClient => 'Клиент';

  @override
  String get linkedDevicesDetailsLocation => 'Местоположение';

  @override
  String get linkedDevicesDetailsIp => 'IP адрес';

  @override
  String get linkedDevicesDetailsLastUsed => 'Последно използван';

  @override
  String get linkedDevicesCurrentSession => 'Текуща сесия';

  @override
  String get linkedDevicesUnknown => 'Неизвестен';

  @override
  String slowmodeLabel(String duration) {
    return '$duration бавен режим';
  }

  @override
  String get slowmodeTooltipActive =>
      'Вие сте в режим на забавяне. Моля, изчакайте, преди да изпратите друго съобщение.';

  @override
  String get slowmodeTooltipImmune =>
      'Бавният режим е включен, но вие сте имунизирани.';

  @override
  String get slowmodeStatusEnabled => 'Бавният режим е включен';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Бавният режим е активен ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'Бавният режим е зададен на $durationLabel, но за теб не важи.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Бавният режим е зададен на $durationLabel. Изчакай, преди да изпратиш друго съобщение.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Бавният режим е зададен на $durationLabel за този канал.';
  }

  @override
  String get channelNoSendPermissionHint =>
      'Не можеш да изпращаш съобщения в този канал.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Системни съобщения от екипа на $productName. Тук не можеш да отговаряш.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Изпращането на съобщения е временно спряно в тази общност.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Наложено ти е време за изчакване. Съобщенията, реакциите и гласовият чат са на пауза, докато то изтече.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Трябва да заявиш акаунта си, за да изпращаш съобщения в тази общност.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Трябва да потвърдиш имейла си, за да изпращаш съобщения в тази общност.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Акаунтът ти е твърде нов, за да изпращаш съобщения в тази общност.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Не си член на тази общност достатъчно дълго, за да изпращаш съобщения.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Трябва да потвърдиш телефонен номер, за да изпращаш съобщения в тази общност.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Потвърди имейла';

  @override
  String get channelComposerBarrierVerifyPhone => 'Потвърди телефона';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Твърде много прикачени файлове (макс. $max)';
  }

  @override
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName надвишава ограничения размер ($fileSize)';
  }

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Тези файлове са твърде големи, за да бъдат изпратени заедно';

  @override
  String get chatAttachmentDropToUpload => 'Пуснете файлове за качване';

  @override
  String get chatAttachmentDropToSend =>
      'Пусни файловете, за да ги изпратиш сега';

  @override
  String get chatAttachmentSendVoiceMessage => 'Изпращане на гласово съобщение';

  @override
  String get voiceMessageTitle => 'Гласово съобщение';

  @override
  String get voiceMessageHoldHint =>
      'Задръжте, за да запишете. Плъзнете към кошчето, за да изтриете, плъзнете нагоре, за да заключите, или пуснете, за да изпратите.';

  @override
  String get voiceMessageDiscard => 'Отхвърляне на гласовото съобщение';

  @override
  String get voiceMessageSend => 'Изпращане на гласово съобщение';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Не може да се започне запис. Разреши достъпа до микрофона.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Записът на глас не се поддържа на това устройство.';

  @override
  String get voiceMessageMicInUse =>
      'Напуснете гласовото повикване, за да запишете гласово съобщение.';

  @override
  String get voiceMessageRecordingFailed =>
      'Записът не бе успешен. Опитай отново.';

  @override
  String get voiceMessageSendFailed =>
      'Гласовото съобщение не може да бъде изпратено. Опитай отново.';

  @override
  String get voiceMessageRecordingHint =>
      'Говори сега. Натисни „Спиране“, когато приключиш — после можеш да изрежеш.';

  @override
  String get voiceMessageReviewHint =>
      'Плъзни дръжките, за да изрежеш, след което натисни Изпрати.';

  @override
  String get voiceMessageStop => 'Спиране';

  @override
  String get voiceMessageStartRecording => 'Започване на запис';

  @override
  String get voiceMessageRerecord => 'Запис отново';

  @override
  String get voiceMessagePlay => 'Пусни';

  @override
  String get voiceMessagePause => 'Пауза';

  @override
  String get voiceMessageSeekForward => 'Пренавий напред';

  @override
  String get voiceMessageSeekBackward => 'Пренавиване назад';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Избраната част трябва да е поне $secondsString сек.';
  }

  @override
  String get chatAttachmentEditTitle => 'Редактиране на прикачен файл';

  @override
  String get chatAttachmentFilenameLabel => 'Име на файла';

  @override
  String get chatAttachmentDescriptionLabel => 'Описание';

  @override
  String get chatAttachmentDescriptionHint =>
      'Незадължителен алтернативен текст';

  @override
  String get chatAttachmentSpoilerLabel => 'Маркирай като спойлер';

  @override
  String get chatAttachmentRemove => 'Премахване на прикачен файл';

  @override
  String get chatAttachmentDownload => 'Изтегляне';

  @override
  String get chatAttachmentDownloadedToast => 'Запазено в снимки';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Не успях да изтегля прикачения файл';

  @override
  String get chatAttachmentExpiredTooltip =>
      'Срокът на прикачения файл е изтекъл';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Разгъни ($count реда)',
      one: 'Разгъни ($count ред)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Скрий ($count реда)',
      one: 'Скрий ($count ред)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Разгъни ($count реда)',
      one: 'Разгъни ($count ред)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Свий ($count реда)',
      one: 'Свий ($count ред)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... (остават $count реда)',
      one: '... (остава $count ред)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... (остават $count реда)',
      one: '... (остава $count ред)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'Преглед на целия файл';

  @override
  String get chatTextualPreviewChangeLanguage => 'Смяна на езика';

  @override
  String get chatTextualPreviewSearchLanguage => 'Търсене на език…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Синтактично оцветяване';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'Няма намерени резултати';

  @override
  String get chatTextualPreviewMoreOptions => 'Още опции';

  @override
  String get chatTextualPreviewWrapText => 'Пренасяне на текст';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'Файлът е твърде голям за вграден преглед (лимит $previewLimitKb KB).';
  }

  @override
  String get chatTextualPreviewLoadError =>
      'Прегледът не може да бъде зареден.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Обикновен текст';

  @override
  String get chatTextualPreviewCopy => 'Копирай';

  @override
  String get chatAttachmentSourceGallery => 'Галерия';

  @override
  String get chatAttachmentSourceCamera => 'Камера';

  @override
  String get chatAttachmentSourceBrowse => 'Преглед на файлове';

  @override
  String get chatAttachmentPasteTooltip => 'Постави файл от клипборда';

  @override
  String get chatAttachmentSpoiler => 'Спойлер';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Покажи спойлера';

  @override
  String get matureMediaRevealButton => 'Покажи';

  @override
  String get matureMediaRevealHint => 'Натисни, за да видиш';

  @override
  String get matureContentTitle => 'Съдържание за възрастни';

  @override
  String get matureCommunityTitle => 'Общност за възрастни';

  @override
  String get matureCategoryTitle => 'Категория за възрастни';

  @override
  String get matureChannelTitle => 'Канал за възрастни';

  @override
  String get communityContentWarningTitle =>
      'Предупреждение за съдържание в общността';

  @override
  String get categoryContentWarningTitle =>
      'Предупреждение за съдържанието на категорията';

  @override
  String get channelContentWarningTitle =>
      'Предупреждение за съдържанието на канала';

  @override
  String get defaultContentWarningBody => 'Тук има чувствително съдържание.';

  @override
  String get matureCommunityBody =>
      'Тази общност е маркирана за съдържание за възрастни и може да съдържа материали, които може да са неподходящи за някои потребители.';

  @override
  String get matureCategoryBody =>
      'Тази категория е маркирана за съдържание за възрастни и може да съдържа материали, които може да са неподходящи за някои потребители.';

  @override
  String get matureChannelBody =>
      'Този канал е маркиран за съдържание за възрастни и може да съдържа материали, които може да са неподходящи за някои потребители.';

  @override
  String get matureVoiceChannelBody =>
      'Този гласов канал е маркиран за съдържание за възрастни и може да съдържа материали, които може да са неподходящи за някои потребители.';

  @override
  String get matureLinkChannelBody =>
      'Този канал с линкове е маркиран за съдържание за възрастни и може да отваря материали, които може да са неподходящи за някои потребители.';

  @override
  String get matureCommunityUnavailableBody =>
      'Тази общност за възрастни не е достъпна за акаунта ти.';

  @override
  String get matureCategoryUnavailableBody =>
      'Тази категория за възрастни не е достъпна за акаунта ти.';

  @override
  String get matureChannelUnavailableBody =>
      'Този канал за възрастни не е достъпен за акаунта ти.';

  @override
  String get matureContentProceedButton => 'Продължи';

  @override
  String get matureContentUnderstandButton => 'Разбрах';

  @override
  String get matureContentOpenLinkButton => 'Отваряне на линка';

  @override
  String get sensitiveContentSectionTitle => 'Чувствително съдържание';

  @override
  String get sensitiveContentSectionDescription =>
      'Контролирайте как се филтрира неподходящо или чувствително съдържание в различни контексти';

  @override
  String get sensitiveContentFriendDmLabel => 'Директни съобщения от приятели';

  @override
  String get sensitiveContentNonFriendDmLabel =>
      'Директни съобщения от други потребители';

  @override
  String get sensitiveContentGuildLabel => 'Съобщения в канали на общности';

  @override
  String get sensitiveContentFilterShow => 'Показване';

  @override
  String get sensitiveContentFilterBlur => 'Размазване';

  @override
  String get sensitiveContentFilterBlock => 'Блокиране';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Замъгляване на медиите до завършване на сканирането за безопасност';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Когато е включено, изображенията и видеоклиповете ще бъдат замъглени, докато сканирането за безопасност на съдържанието завърши.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Тази настройка винаги е включена за вашия акаунт.';

  @override
  String get sensitiveContentResetButton => 'Нулиране';

  @override
  String get sensitiveContentSaveButton => 'Запазване';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файла',
      one: '1 файл',
    );
    return 'Качване на $_temp0';
  }

  @override
  String get chatCancelUpload => 'Отказ на качването';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Изтича на $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Изтича между $start и $end';
  }

  @override
  String get connectionsTitle => 'Връзки';

  @override
  String connectionsDescription(String productName) {
    return 'Свържете външни акаунти и домейни към вашия профил в $productName. Потвърдените връзки ще бъдат показани в профила ви, за да ги виждат другите.';
  }

  @override
  String get connectionsEmptyTitle => 'Все още няма връзки';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Свържете своя Bluesky акаунт или потвърдете собствеността на домейн, за да ги покажете в профила си.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Потвърдете собствеността на домейна, за да го покажете в профила си.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Домейн';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Добавяне на връзка към Bluesky';

  @override
  String get connectionsAddDomainAriaLabel => 'Добавяне на връзка с домейн';

  @override
  String get connectionEdit => 'Редактиране';

  @override
  String get connectionRemove => 'Премахване';

  @override
  String get connectionVerifiedLabel => 'Тази връзка е потвърдена.';

  @override
  String get connectionUnverifiedLabel => 'Тази връзка не е потвърдена.';

  @override
  String get connectionAddTitle => 'Добавяне на връзка';

  @override
  String get connectionTypeLabel => 'Тип връзка';

  @override
  String get connectionHandleLabel => 'Потребителско име';

  @override
  String get connectionDomainLabel => 'Домейн';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Вече имаш тази връзка.';

  @override
  String get connectionConnectBluesky => 'Свързване с Bluesky';

  @override
  String get connectionContinue => 'Продължи';

  @override
  String get connectionVerifyTitle => 'Потвърждаване на връзка';

  @override
  String get connectionVerifyInstructions =>
      'Използвайте записа по-долу, за да докажете собствеността върху домейна.';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT запис';

  @override
  String get connectionDnsHostLabel => 'Хост';

  @override
  String get connectionDnsValueLabel => 'Стойност';

  @override
  String get connectionCopyHost => 'Копирай хоста';

  @override
  String get connectionCopyValue => 'Копирай стойността';

  @override
  String get connectionCopied => 'Копирано!';

  @override
  String get connectionTokenFileTitle => 'Предоставяне на файла с токена';

  @override
  String get connectionTokenFileDescription =>
      'Изтеглете **fluxer-verification** и го поставете във вашата папка **.well-known**, за да можем да потвърдим домейна.';

  @override
  String get connectionTokenFileDownload => 'Изтегляне на fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Файлът съдържа токена за проверка, който ще извлечем от **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle =>
      'Запазване на fluxer-verification';

  @override
  String get connectionVerifyButton => 'Потвърди';

  @override
  String get connectionBack => 'Назад';

  @override
  String get connectionEditTitle => 'Редактиране на връзка';

  @override
  String get connectionEditDescription =>
      'Избери кой да вижда тази връзка в профила ти.';

  @override
  String get connectionVisibilityEveryone => 'Всеки';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Позволява на всеки да вижда тази връзка в профила ти';

  @override
  String get connectionVisibilityFriends => 'Приятели';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Позволява на приятелите ти да виждат тази връзка';

  @override
  String get connectionVisibilityCommunityMembers => 'Членове на общността';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Позволява на членовете на общностите, в които си, да виждат тази връзка';

  @override
  String get connectionRemoveTitle => 'Премахване на връзка';

  @override
  String get connectionRemoveDescription =>
      'Сигурни ли сте, че искате да премахнете тази връзка? Тази операция не може да бъде отменена.';

  @override
  String get connectionRemoveConfirm => 'Премахване';

  @override
  String get connectionsLoadError => 'Неуспешно зареждане на връзките';

  @override
  String get connectionsReorderError => 'Неуспешно обновяване на реда';

  @override
  String get connectionInitiateFailed =>
      'Не успях да стартирам проверката. Опитайте отново.';

  @override
  String get connectionVerifyFailed =>
      'Не успяхме да потвърдим. Проверете DNS записа си и опитайте отново.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Не успяхме да стартираме оторизацията за Bluesky.';

  @override
  String get connectionUpdateFailed => 'Не успях да обновя връзката';

  @override
  String get connectionRemoveFailed => 'Не успях да премахна връзката';

  @override
  String get connectionTokenSavedToast => 'Fluxer-верификацията е запазена';

  @override
  String get connectionTokenSaveFailedToast => 'Не успях да запазя файла';

  @override
  String get connectionEnterHandle => 'Въведете Bluesky потребителско име.';

  @override
  String get connectionEnterDomain => 'Въведете домейн.';

  @override
  String get lookAndFeelTitle => 'Визия и усещане';

  @override
  String get lookAndFeelThemeSectionTitle => 'Тема';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Изберете между тъмен, въглищен или светъл изглед.';

  @override
  String get lookAndFeelHdrSectionTitle => 'Висок динамичен обхват';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Управлявай как се показват HDR изображенията на монитори с поддръжка на HDR.';

  @override
  String get lookAndFeelHdrFullName => 'Пълен динамичен обхват';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Показване на HDR изображения с пълна яркост и цветови диапазон.';

  @override
  String get lookAndFeelHdrStandardName => 'Стандартен обхват';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Преобразуване на HDR изображения в стандартен диапазон, намалявайки пиковата яркост.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'Режим на дисплея с висок динамичен обхват';

  @override
  String get lookAndFeelThemeDark => 'Тъмна тема';

  @override
  String get lookAndFeelThemeDarkLegacy => 'Тъмна (наследена) тема';

  @override
  String get lookAndFeelThemeCoal => 'Въгленова тема';

  @override
  String get lookAndFeelThemeLight => 'Светла тема';

  @override
  String get lookAndFeelThemeSystem => 'Системна тема';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Синхронизиране на темата между устройствата';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Когато е включено, промените в темата ще се синхронизират с всички ваши устройства. Когато е изключено, това устройство ще използва собствената си настройка за тема.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Системната тема автоматично деактивира синхронизацията, за да следи предпочитанията на вашата система на това устройство.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Не успяхме да синхронизираме темата с вашия акаунт. Моля, опитайте отново.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Мащабиране на шрифта в чата';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Настрой размера на шрифта в чата.';

  @override
  String get lookAndFeelChatFontSizeLabel => 'Размер на шрифта в чата';

  @override
  String get lookAndFeelAppZoomTitle => 'Мащаб на приложението';

  @override
  String get lookAndFeelAppZoomDescription => 'Настрой мащаба на приложението.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'Тапет на чата';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'Изберете фон за чата. Той ще остане на това устройство.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'Тази настройка остава на това устройство';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'Тапетът за чат е запазен само на това устройство и не се синхронизира с други устройства.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'По подразбиране';

  @override
  String get lookAndFeelChatWallpaperCustomLabel =>
      'Персонализирано изображение';

  @override
  String get lookAndFeelChatWallpaperStarfieldLabel => 'Starfield';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Цвят $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Градиент $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'Затъмняване на тапета';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'Не можехме да зададем това изображение като тапет.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Съобщения';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Избери как да се показват съобщенията в чат каналите.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Разстояние между групи съобщения';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel =>
      'Режим на показване на съобщенията';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Удобен';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Просторно оформление с ясно визуално разделение между съобщенията.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Сбит';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Максимизира видимите съобщения с минимално разстояние.';

  @override
  String get lookAndFeelHideUserAvatarsLabel =>
      'Скрий аватарите на потребителите';

  @override
  String get lookAndFeelInterfaceTitle => 'Интерфейс';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Персонализиране на елементи и поведение на интерфейса.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Индикатори за писане в списъка с канали';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Изберете как да се показват индикаторите за писане в списъка с канали, когато някой пише в канал.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Индикатор за писане + аватари';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Показване на индикатор за писане с аватари на потребители в списъка с канали';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Само индикатор за писане';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Показване само на индикатора за писане без аватари';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Скрито';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Без индикатори за писане в списъка с канали';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Показване на писане в избрания канал';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Когато е изключено (по подразбиране), индикаторите за писане няма да се показват в канала, който в момента преглеждате.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'общи';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Подсказки за клавиатурата';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Контролирайте дали подсказките за клавишни комбинации се показват в подсказки.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Скрий подсказките за клавиатурата в подсказките';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Когато е включено, значките за преки пътища се скриват в изскачащи подсказки.';

  @override
  String get lookAndFeelNekoTitle => 'Разни';

  @override
  String get lookAndFeelNekoDescription => 'Разни опции за интерфейса.';

  @override
  String get lookAndFeelShowNekoLabel => 'Показване на Неко';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Когато е активирано, Neko се появява близо до полето за въвеждане на съобщения.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Поведение при присъединяване към гласов канал';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Контролирайте как се присъединявате към гласови канали в общности.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Изискване на двойно щракване за присъединяване към гласови канали';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Когато е включено, ще трябва да щракнете два пъти върху гласови канали, за да се присъедините към тях. Когато е изключено (по подразбиране), едно щракване ще ви присъедини незабавно към канала.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Бързата кафява лисица прескача мързеливото куче.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Лента на сървъра';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Настройте как страничната лента на сървъра показва директни съобщения.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count общности временно не са достъпни поради неизправност на флукс кондензатора.',
      one:
          '1 общност временно не е достъпна поради неизправност на флукс кондензатора.',
    );
    return '$_temp0';
  }

  @override
  String get communityTemporarilyUnavailable =>
      'Общността е временно недостъпна';

  @override
  String get guildUnavailableDescription =>
      'Нещо се обърка. Работим по въпроса.';

  @override
  String get guildNotFoundTitle => 'Това не е общността, която търсиш.';

  @override
  String get guildNotFoundDescription =>
      'Общността, която търсиш, може да е изтрита или да нямаш достъп до нея.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return 'Общността $communityName в момента е достъпна само за служители на $productName';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => 'временно недостъпно';

  @override
  String get lookAndFeelCollapseDMsLabel => 'Свий лични съобщения във папка';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'Когато е активирано, непрочетените лични съобщения в страничната лента на сървъра се свиват в папка върху бутона $productName. Кликнете върху бутона $productName, докато сте на страницата за лични съобщения, за да разширите или свиете папката.';
  }

  @override
  String get lookAndFeelChannelListSectionTitle => 'Списък с канали';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Управлявай как се държи индикаторът за непрочетени при заглушените канали в списъците с канали.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Показване на индикатор за непрочетени съобщения в заглушени канали';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Когато е включено, заглушените канали показват бледо индикатор за непрочетени съобщения отляво. Споменаванията все още се показват независимо от тази настройка.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Активни сега';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Контролирайте как се показва \"Активен сега\" в приложението.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Показване на „Активни сега“ на началния екран';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Показвай „Активни сега“ на началния екран, за да виждаш приятелите, активни в гласови канали. Ще виждаш предварителен преглед, контекста на канала, кой вече е там и бърз начин да се присъединиш.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Любими';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Контролирайте видимостта на любимите елементи в цялото приложение.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Включване на любими';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Когато е включено, можете да добавяте канали към любими и те ще се показват в секцията „Любими“. Когато е изключено, всички елементи на потребителския интерфейс, свързани с любими (бутони, елементи от менюто), ще бъдат скрити. Вашите съществуващи любими ще бъдат запазени.';

  @override
  String get favoritesTitle => 'Любими';

  @override
  String get favoritesEmptyTitle => 'Няма добавени в любими';

  @override
  String get favoritesEmptyDescription =>
      'Запазвайте каналите със звездичка от заглавката на чата, за да ги държите тук.';

  @override
  String get favoritesWelcomeTitle => 'Добре дошли в любими';

  @override
  String get favoritesWelcomeDescription =>
      'Твоето лично пространство за бърз достъп до каналите, DM и групите, които харесваш. Натисни звездата на който и да е канал, за да го добавиш тук.';

  @override
  String get favoritesWelcomeTip => 'Не е за теб? Изключи го по всяко време.';

  @override
  String get favoritesDisableButton => 'Изключване на любимите';

  @override
  String get favoritesAddedToast => 'Добавено към любими';

  @override
  String get favoritesRemovedToast => 'Премахнато от любими';

  @override
  String get favoritesHiddenToast => 'Любими скрити';

  @override
  String get favoritesMute => 'Изключване на известията за любими';

  @override
  String get favoritesUnmute => 'Включване на известията за любими';

  @override
  String get favoritesHeaderMenu => 'Меню с любими';

  @override
  String get favoritesCreateCategory => 'Създаване на категория';

  @override
  String get favoritesCategoryNameLabel => 'Име на категорията';

  @override
  String get favoritesHideMutedChannels => 'Скрий заглушените канали';

  @override
  String get favoritesShowMutedChannels => 'Показване на заглушени канали';

  @override
  String get favoritesSetNickname => 'Задай прякор';

  @override
  String get favoritesNicknameLabel => 'Прякор';

  @override
  String get favoritesSaveNickname => 'Запази прякор';

  @override
  String get favoritesMoveToCategory => 'Премести в категория';

  @override
  String get favoritesUncategorized => 'Без категория';

  @override
  String get favoritesOtherCategory => 'Друго';

  @override
  String get favoritesRemoveFromFavorites => 'Премахване от любими';

  @override
  String get favoritesAddToFavorites => 'Добавяне към любими';

  @override
  String get favoritesAddToSavedMedia => 'Добавяне към запазени медии';

  @override
  String get favoritesRemoveFromSavedMedia => 'Премахване от запазените медии';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Добавяне към любимите GIF файлове, запазени по URL адрес';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Премахване от любимите GIF файлове, запазени по URL адрес';

  @override
  String get savedMediaAddTitle => 'Добавяне към запазени медии';

  @override
  String get savedMediaFormNameLabel => 'Име';

  @override
  String get savedMediaFormNameHint => 'Моята страхотна медия';

  @override
  String get savedMediaFormAltTextLabel => 'Алтернативен текст';

  @override
  String get savedMediaFormAltTextHint => 'Опиши медията';

  @override
  String get savedMediaFormTagsLabel => 'Етикети';

  @override
  String get savedMediaFormTagsHint => 'забавно, реакция, работа';

  @override
  String get savedMediaSaveError =>
      'Не може да се актуализира запазеното съдържание.';

  @override
  String get savedMediaNameRequired => 'Името е задължително.';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'Как да запазим любимите ти GIF файлове?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'Можете да запазвате любими GIF файлове като предпочитани само с URL адрес или да ги качвате в запазените си медийни файлове. Изберете това, което най-добре отговаря на начина, по който ги използвате. Можете да го промените по всяко време в Настройки > Разширени > Медия.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'URL-само любими (по подразбиране): синхронизирани на всичките ви устройства, без качване, не се броят към запазените медии. Оригиналните медии може да изчезнат, ако хостът им ги премахне.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Запазени медии: качени, с възможност за тагване, търсене и постоянни, но се броят към лимита ви за запазени медии.';

  @override
  String get gifFavoriteFirstTimeHint => 'Ще попитаме само веднъж.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly =>
      'Използвай само URL (препоръчително)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => 'Използвай запазени медии';

  @override
  String get favoritesHideConfirmTitle => 'Скрий любимите';

  @override
  String get favoritesHideConfirmDescription =>
      'Това ще скрие всички елементи на потребителския интерфейс, свързани с любими, включително бутони и елементи от менюто. Вашите съществуващи любими ще бъдат запазени и могат да бъдат активирани отново по всяко време от Настройки > Разширени > Външен вид.';

  @override
  String get favoritesDirectMessageSubtitle => 'Директно съобщение';

  @override
  String get messagesMediaDisplayGroupTitle => 'Показване';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Контролирайте как се показват съобщения, медии и друго съдържание.';

  @override
  String get messagesMediaMediaGroupTitle => 'Медия';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Персонализирайте предпочитанията за размер на медиите и бутоните.';

  @override
  String get messagesMediaInputGroupTitle => 'Въвеждане';

  @override
  String get messagesMediaInputGroupDescription =>
      'Персонализирайте настройките за въвеждане на съобщения.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Странична лента';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Настройте как се показва страничната лента на общността.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Скрий заглушените канали по подразбиране';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Автоматично скриване на заглушените канали в страничната лента, когато се присъединявате към нови общности';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Да се скриват ли заглушените канали по подразбиране?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Новите общности, към които се присъединяваш, автоматично ще имат скрити заглушени канали. Искаш ли да приложиш тази настройка и към всичките си съществуващи общности?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Да се спре ли скриването на заглушени канали по подразбиране?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Новите общности, към които се присъединяваш, вече няма да имат автоматично скрити заглушени канали. Искаш ли да показваш заглушените канали и във всичките си съществуващи общности?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Приложи към всички общности';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Показване във всички общности';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Само нови общности';

  @override
  String get messagesMediaDisplaySectionTitle => 'Показване на медия';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Контролирайте как се показват изображения, видеоклипове и други медии. Всички медии се преоразмеряват и конвертират. Изключително големи файлове, които не могат да бъдат компресирани в визуализация, няма да бъдат вградени, независимо от тези настройки.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Когато се публикуват като връзки към чат';

  @override
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'Когато е качено директно във $productName';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Визуализация на линкове';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Контролирайте как се показват визуализациите на уеб връзките в чата';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Показване на вградени елементи и визуализация на линкове към уебсайтове';

  @override
  String get messagesMediaReactionsSectionTitle => 'Реакции';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Настройте реакции с емоджи към съобщенията';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Показване на реакции с емоджита върху съобщенията';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Съдържание със спойлер';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Контролирайте как се показват скрити съобщения';

  @override
  String get messagesMediaSpoilersRadioLabel =>
      'Покажи съдържанието на спойлера';

  @override
  String get messagesMediaSpoilersOnClickName => 'При щракване';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Показване на съдържанието със спойлери при щракване';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'В канали, които модерирам';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Винаги показвай съдържание със спойлер в канали, където имаш разрешението „Управление на съобщения“.';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Винаги';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Винаги показвай съдържанието със спойлери';

  @override
  String get messagesMediaSizeSectionTitle =>
      'Предпочитания за размер на медията';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Персонализирайте максималния размер за показване на вградени и прикачени медийни файлове. По-малките размери заемат по-малко място на екрана, докато по-големите показват повече детайли.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Медия от връзки (вградени)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Качени прикачени файлове';

  @override
  String get messagesMediaSizeCompactName => 'Компактен (400x300)';

  @override
  String get messagesMediaSizeCompactDescription =>
      'По-малък размер на медията';

  @override
  String get messagesMediaSizeComfortableName => 'Удобен (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'По-голям размер на медиите с повече детайли';

  @override
  String get messagesMediaGifsSectionTitle => 'Поведение на GIF';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Контролирайте как GIF файловете се вмъкват в чата';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Автоматично изпращане на GIF файлове при избиране';

  @override
  String get messagesMediaCameraUploadsSectionTitle => 'Качване от камерата';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Изберете дали снимките и видеоклиповете, направени с камерата в приложението, да се запазват на вашето устройство';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel =>
      'Запазване на устройството';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Автоматично довършване на изрази (автоматично довършване с двоеточие)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Контролирайте какво се появява в автоматичното довършване на изрази, когато пишете двоеточие. Персонализирайте кои предложения се показват, за да отговарят на вашите предпочитания.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Показване на стандартни емоджита в автоматичното довършване на изрази';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Показване на персонализирани емоджита в автоматичното довършване на изрази';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Показване на стикери в автоматичното довършване на изрази';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Показване на запазена медия в автоматичното довършване на изрази';

  @override
  String get messagesMediaEditingSectionTitle => 'Редактиране на съобщения';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Контролирайте какво се случва с черновата на вашата редакция, когато я отмените.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Запази черновата при отказ';

  @override
  String get accessibilitySaturationTitle => 'Наситеност';

  @override
  String get accessibilitySaturationDescription =>
      'Регулирайте колко наситени да изглеждат цветовете на темата в цялото приложение.';

  @override
  String get accessibilityVisualGroupTitle => 'Визуални настройки';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'Винаги подчертавай линковете';

  @override
  String get accessibilityShowAltTextOnImagesLabel =>
      'Show alternative text on images';

  @override
  String get accessibilityShowAltTextOnImagesDescription =>
      'Display alternative text below images when it is available.';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Приглушаване на зачеркнатия текст';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'Визуализации на съобщения в DM';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Контролирайте кога се показват прегледи на съобщения в списъка с лични съобщения.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Режим на визуализация на съобщения в DM';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Всички съобщения';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Показване на визуализации на съобщения за всички разговори в DM';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Само непрочетени DM';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Показване на визуализации само за DM с непрочетени съобщения';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Няма';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Без визуализация на съобщенията в списъка с DM';

  @override
  String get accessibilityScreenReaderGroupTitle => 'Екранен четец';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Контролирайте как $productName работи с екранни четци.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Обявяване на нови съобщения';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Позволява на екранните четци да обявяват нови съобщения, когато пристигат в отворения канал. Звуците за известия не се променят.';

  @override
  String get accessibilityTtsGroupTitle => 'Текст към говор';

  @override
  String get accessibilityTtsGroupDescription =>
      'Избери скорост за четене на текста.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Скорост на възпроизвеждане на говор';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Пусни примерен звук';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Спри примерния звук';

  @override
  String get accessibilityPreviewButtonLabel => 'Бутон за преглед';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'Така изглеждат линковете: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Предварителен потребител';

  @override
  String get accessibilityKeyboardGroupTitle => 'Клавиатура';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Показване на рамка за фокус върху текстовото поле за чат';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'Клавишът Esc изключва режим „Клавиатура“';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Показване на клавишните комбинации в контекстните менюта';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Потвърждаване преди започване на разговори';

  @override
  String get accessibilityAnimationGroupTitle => 'Анимация';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'Намаленото движение е включено, така че анимациите на съдържанието са поставени на пауза по подразбиране. Все още можете да включите всяка от тях, за да продължи да се възпроизвежда.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel =>
      'Пускане на анимирани емоджита';

  @override
  String get accessibilityAutoPlayGifsMobileLabel =>
      'Автоматично възпроизвеждане на GIF файлове';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'Автоматично възпроизвеждане на GIF файлове, когато $productName е на фокус';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Възпроизвежда се въпреки намаленото движение.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Поставено на пауза заради намаленото движение. Включи, за да продължат да се възпроизвеждат анимираните емоджита.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Поставено на пауза заради намаленото движение. Включи, за да продължат да се възпроизвеждат GIF файловете.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'По подразбиране е изключено на мобилни устройства за пестене на батерия и данни.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Анимации на стикери';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Предпочитания за анимация на стикери';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Винаги анимирай';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Стикерите винаги ще се анимират';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Анимирай при взаимодействие';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Стикерите ще се анимират, когато ги натиснеш';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Стикерите ще се анимират, когато ги посочиш или взаимодействаш с тях';

  @override
  String get accessibilityStickerNeverAnimateName => 'Никога не анимирай';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Стикерите никога няма да се анимират';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Винаги се анимират въпреки намаленото движение.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'Намаленото движение ограничава стикерите да анимират при взаимодействие. Изберете „винаги анимиране“, за да отмените.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'По подразбиране анимациите се възпроизвеждат при взаимодействие на мобилни устройства, за да се пести батерия.';

  @override
  String get accessibilityMotionGroupTitle => 'Движение';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Синхронизиране на намаленото движение със системата';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Използвай системната настройка за намалено движение на това устройство или я персонализирай по-долу.';

  @override
  String get accessibilityReducedMotionOverrideLabel =>
      'Намаляване на движението';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Деактивиране на анимациите и преходите. В момента се контролира от системната ти настройка.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Деактивиране на анимациите и преходите в цялото приложение.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Анимираните емоджита, GIF файловете и стикерите остават под твой контрол в раздела „Анимация“.';

  @override
  String get accessibilityConfirmStartCallTitle => 'Започване на обаждане?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Сигурни ли сте, че искате да започнете това обаждане?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel =>
      'Започване на разговор';

  @override
  String get accessibilityTtsSampleDescription =>
      'Чуйте примерния ред, изговорен с избраната от вас скорост.';

  @override
  String get accessibilityTtsSampleText =>
      'Док, аз съм от бъдещето. Дойдох тук с машина на времето, която ти изобрети. Сега ми трябва помощта ти, за да се върна в 1985 г.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'Синтезът на реч е недостъпен на това устройство.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Възпроизвеждането на говор е неуспешно. Опитай отново или провери дали аудиоизходът работи.';

  @override
  String get ttsSubstitutionUnknownUser => 'неизвестен потребител';

  @override
  String get ttsSubstitutionUnknownRole => 'неизвестна роля';

  @override
  String get ttsSubstitutionUnknownChannel => 'неизвестен канал';

  @override
  String get ttsSubstitutionCodeBlock => 'кодов блок';

  @override
  String get ttsSubstitutionSpoiler => 'спойлер';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'емоджи $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return 'наклонена черта $commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName каза: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'В отговор на $replyAuthorName, $authorName каза: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'изпрати стикер';

  @override
  String get ttsSentAttachment => 'изпрати прикачен файл';

  @override
  String ttsSentAttachments(int count) {
    return 'изпратени $count прикачени файла';
  }

  @override
  String get ttsSentEmbed => 'изпрати вградено съдържание';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author изпрати $summary';
  }

  @override
  String get dmListSentAnAttachment => 'Изпрати прикачен файл';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username закачи съобщение в този канал.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username добави $userName в групата.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username добави някого в групата.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username напусна групата.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username премахна $userName от групата.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username премахна някого от групата.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username промени името на канала на $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username промени името на канала.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username смени иконата на канала.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username започна разговор.';
  }

  @override
  String get systemCallJoinTheCall => 'Присъединяване към разговора';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username започна разговор, който продължи $duration.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'Пропуснахте обаждане от $username, което продължи $duration.';
  }

  @override
  String systemCallMissed(String username) {
    return 'Пропуснахте обаждане от $username.';
  }

  @override
  String get systemCallDurationFewSeconds => 'няколко секунди';

  @override
  String get systemCallDurationMinute => 'една минута';

  @override
  String get systemCallDurationOneYear => '1 година';

  @override
  String get systemCallDurationOneMonth => '1 месец';

  @override
  String get systemCallDurationOneWeek => '1 седмица';

  @override
  String get systemCallDurationOneDay => '1 ден';

  @override
  String get systemCallDurationOneHour => '1 час';

  @override
  String systemCallDurationYears(int count) {
    return '$count години';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count месеца';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count седмици';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count дни';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count часа';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count минути';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Актуализирай $productName, за да видиш това съобщение.';
  }

  @override
  String get voiceConnectionConfirmTitle => 'Потвърждение на гласова връзка';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Вече сте свързани към този гласов канал от $count други устройства. Какво искате да направите?',
      one:
          'Вече сте свързани към този гласов канал от 1 друго устройство. Какво искате да направите?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Превключване към това устройство';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Просто се присъедини (запази другите връзки)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Не прави нищо, не искам да се присъединявам';

  @override
  String get voiceJoinFailedTitle =>
      'Не успях да се присъединя към гласовото повикване';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Не успяхме да прекъснем връзката с другите ви устройства. Опитайте отново след малко.';

  @override
  String get voiceChannelEmptyDescription =>
      'Това е гласов канал. Свържете се, за да започнете да говорите!';

  @override
  String get voiceChannelJoin => 'Присъединяване към гласов канал';

  @override
  String get voiceCallJoin => 'Присъединяване към разговора';

  @override
  String get voiceChannelJoinConnect => 'Свързване с гласов канал';

  @override
  String get voiceChannelNoConnectPermission =>
      'Нямаш разрешение да се присъединиш към този гласов канал';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Микрофонът, камерата и съдържанието на споделения екран са криптирани от край до край.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Микрофонът, камерата и съдържанието на споделения екран са криптирани от край до край.';

  @override
  String get voiceChannelE2eeBroken =>
      'Криптирането от край до край не е налично, защото в този гласов канал има неподдържан участник.';

  @override
  String get voiceCallE2eeBroken =>
      'Криптирането от край до край не е налично, защото в разговора има неподдържан участник.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Този клиент трябва да бъде актуализиран, преди да се присъедините към този криптиран разговор.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Не успяхме да стартираме микрофона ви. Все още сте в разговора.';

  @override
  String get voiceChannelStatusConnecting => 'Свързване…';

  @override
  String get voiceChannelStatusConnected => 'Свързан';

  @override
  String get voiceChannelStatusError => 'Грешка';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Мобилно устройство';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Настолно устройство';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Общността заглуши';

  @override
  String get voiceParticipantTooltipMuted => 'Изключен звук';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Заглушен от общността';

  @override
  String get voiceParticipantTooltipDeafened => 'Звукът е изключен';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Връзка: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count участници',
      one: '1 участник',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Напускане';

  @override
  String get voiceControlMute => 'Заглуши';

  @override
  String get voiceControlUnmute => 'Включване на звука';

  @override
  String get voiceControlDeafen => 'Изключване на звука';

  @override
  String get voiceControlUndeafen => 'Включване на звука';

  @override
  String get voiceControlVideo => 'Видео';

  @override
  String get voiceControlFlipCamera => 'Превключване на камерата';

  @override
  String get voiceControlScreenShare => 'Споделяне на екран';

  @override
  String get voiceScreenShareNotificationText => 'Споделяне на екрана ви.';

  @override
  String get voiceControlMore => 'Още';

  @override
  String get voiceControlDisconnect => 'Прекъсване';

  @override
  String get voiceInChat => 'В гласов чат';

  @override
  String get voiceConnectionFailed => 'Връзката е прекъсната';

  @override
  String get voiceConnectionRetry => 'Опитай отново';

  @override
  String get voiceConnectionDismiss => 'Затвори';

  @override
  String get voiceConnectionDisconnected => 'Прекъснато';

  @override
  String voicePingMs(int currentLatency) {
    return 'Пинг: $currentLatency мс';
  }

  @override
  String get voiceMeasuringLatency => 'Измерване на латентност...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Към $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'Гласова връзка';

  @override
  String get voiceConnectionAdvancedStats => 'Разширени';

  @override
  String get voiceShowCallAvatars => 'Покажи аватарите в разговора';

  @override
  String get voiceShowConnectionId => 'Покажи ID на връзката';

  @override
  String get voiceAudioProcessing => 'Обработка на аудио';

  @override
  String get voiceConnectionSessionSection => 'Сесия';

  @override
  String get voiceConnectionDurationLabel => 'Продължителност';

  @override
  String get voiceConnectionParticipantsLabel => 'Участници';

  @override
  String get voiceConnectionNetworkSection => 'Мрежа';

  @override
  String get voiceConnectionPingLabel => 'Пинг';

  @override
  String get voiceConnectionJitterLabel => 'Джитър';

  @override
  String get voiceConnectionSendLabel => 'Изпращане';

  @override
  String get voiceConnectionReceiveLabel => 'Получаване';

  @override
  String get voiceConnectionUnavailable => '—';

  @override
  String voiceConnectionDuration(int minutes, int seconds) {
    return '$minutesм $secondsс';
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
    return '$bandwidth kbps';
  }

  @override
  String get userAreaMuteMicrophone => 'Изключване на микрофона';

  @override
  String get userAreaUnmuteMicrophone => 'Включване на микрофона';

  @override
  String get userAreaUserSettings => 'Потребителски настройки';

  @override
  String get voiceParticipantMenuViewProfile => 'Преглед на профила';

  @override
  String get voiceParticipantMenuFocus => 'Фокусирай този човек';

  @override
  String get voiceParticipantMenuUnfocus => 'Отмени фокуса';

  @override
  String get voiceParticipantMenuCommunityMute =>
      'Изключване на микрофона в общността';

  @override
  String get voiceParticipantMenuCommunityDeafen =>
      'Изключване на целия звук в общността';

  @override
  String get voiceParticipantMenuUserVolume => 'Сила на звука на потребителя';

  @override
  String get voiceParticipantMenuStreamVolume => 'Сила на звука на потока';

  @override
  String get voiceParticipantMenuStopStreaming => 'Спиране на стрийминга';

  @override
  String get voiceParticipantModerationFailed =>
      'Не успяхме да актуализираме този член. Моля, опитайте отново.';

  @override
  String get voiceControlChat => 'Чат';

  @override
  String get voiceCallViewModeLabel => 'Изглед';

  @override
  String get voiceCallViewModeGrid => 'Решетка';

  @override
  String get voiceCallViewModeFocus => 'Фокус';

  @override
  String get voicePanelSettingsSectionTitle => 'Настройки на гласа';

  @override
  String get voicePanelUseEarpieceLabel => 'Използвай слушалката';

  @override
  String get voiceOutputRouteSpeaker => 'Високоговорител';

  @override
  String get voiceOutputRouteEarpiece => 'Earpiece';

  @override
  String get voiceOutputRouteHeadset => 'Слушалки';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Показвай само видеа';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Показвай само участници с включена камера.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Показване на моята камера';

  @override
  String get voicePrioritizeSpeakersLabel => 'Приоритизиране на говорещите';

  @override
  String get voiceTextChatShow => 'Покажи чата';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# непрочетени съобщения',
      one: '# непрочетено съобщение',
    );
    return 'Покажи чата с $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Необходим е достъп до камерата за видео.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Не успяхме да стартираме споделянето на екрана. Моля, опитайте отново.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Разрешението за споделяне на екрана беше отказано.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Споделянето на екран не е налично на това устройство.';

  @override
  String get voiceWatchStream => 'Гледай стрийма';

  @override
  String get voiceStopWatching => 'Спиране на гледането';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Спиране на гледането на текущия поток';

  @override
  String get voiceOwnScreenShareTitle => 'Излъчвате';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Вашият стрийм е на живо за участниците.';

  @override
  String get voiceLiveBadge => 'На живо';

  @override
  String get dmVoiceViewCall => 'Преглед на разговора';

  @override
  String get dmVoiceCallFullScreen => 'Цял екран';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Отвори разговора на цял екран';

  @override
  String get dmVoiceStripStatusConnecting => 'Свързване…';

  @override
  String get dmVoiceStripStatusInCall => 'В разговор';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Гласово повикване';

  @override
  String get dmVoiceCallBarConnecting => 'Свързване…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Директно повикване';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Групово обаждане';

  @override
  String get dmVoiceCallBarIssueFallback => 'Проблем с гласа';

  @override
  String get dmVoiceFullscreenTitle => 'Глас';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Гласово свързване';

  @override
  String get notificationsPageTitle => 'Известия';

  @override
  String get notificationsFilterUnreads => 'Непрочетени';

  @override
  String get notificationsFilterMentions => 'Споменавания';

  @override
  String get notificationsBookmarksTooltip => 'Отметки';

  @override
  String get notificationsMentionFilterTooltip => 'Филтриране на споменавания';

  @override
  String get notificationsMentionFiltersTitle => 'Филтри за споменавания';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Включи споменаванията @everyone и @here';

  @override
  String get notificationsMentionIncludeRoles =>
      'Включване на споменавания на роли';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Включване на споменаванията от всички общности';

  @override
  String get notificationsNoUnreadTitle => 'Няма непрочетени съобщения';

  @override
  String get notificationsNoUnreadBody => 'Всичко е прегледано.';

  @override
  String get notificationsNoMentionsTitle => 'Няма скорошни споменавания';

  @override
  String get notificationsNoMentionsBody =>
      'Всички @споменавания на теб ще се показват тук за 7 дни.';

  @override
  String get notificationsMentionsEndTitle => 'Достигна края';

  @override
  String get notificationsMentionsEndBody =>
      'Видял си всичките си скорошни споменавания. Не се тревожи, скоро ще се появят още.';

  @override
  String get notificationsJump => 'Премини';

  @override
  String get notificationsRemoveMentionTooltip => 'Премахване на споменаване';

  @override
  String get notificationsViewAllUnread => 'Преглед на всички непрочетени';

  @override
  String get notificationsMarkAsRead => 'Маркирай като прочетено';

  @override
  String get notificationsExpand => 'Разгъване';

  @override
  String get notificationsCollapse => 'Свиване';

  @override
  String get notificationsMessageUnavailable =>
      'Това съобщение не може да бъде заредено.';

  @override
  String characterCounterRemaining(int remaining) {
    return 'Остават още $remaining знака';
  }

  @override
  String get characterCounterTooLong => 'Съобщението е твърде дълго';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining символа остават. Вземете $productName, за да пишете до $premiumMaxLength символа.';
  }

  @override
  String get chatMessageFailedToSend => 'Неуспешно изпращане на съобщение';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Съобщението ви не може да бъде доставено. Обикновено това е така, защото не споделяте общност с получателя или получателя приема директни съобщения само от приятели. Може също да се наложи да коригирате собствените си настройки за поверителност на директните съобщения в $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Съобщението ти не можа да бъде доставено. Трябва да заявиш акаунта си, за да изпращаш директни съобщения.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Съобщението ти не можа да бъде доставено. Трябва да заявиш акаунта си, за да изпращаш съобщения.';

  @override
  String get chatSendFailureContentBlocked =>
      'Съобщението ти не можа да бъде доставено, защото беше отбелязано от системите ни за безопасност. Ако смяташ, че това е грешка, свържи се с поддръжката.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Съобщението ви не може да бъде доставено, защото съдържа неподходящи емотикони или стикери, които не са разрешени в този контекст.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'Само вие можете да видите това съобщение.';

  @override
  String get chatClientSystemDismiss => 'Скрий';

  @override
  String get privacyDashboardCommunicationSection => 'Комуникация';

  @override
  String get privacyDashboardProfilePrivacySection =>
      'Поверителност на профила';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Приятели и директни съобщения';

  @override
  String get privacyDashboardActivitySharingSection => 'Споделяне на активност';

  @override
  String get privacyDashboardSensitiveContentSection =>
      'Чувствително съдържание';

  @override
  String get privacyDashboardDataExportSection => 'Експорт на данни';

  @override
  String get privacyDashboardDataDeletionSection => 'Изтриване на данни';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Кой може да вижда пълния ти профил';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Приятели и всички общности';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Пълният ти профил е видим за приятелите ти и за всички в общностите ти';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Само приятели и малки общности';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Пълният ти профил е видим за приятелите ти и за членовете на общностите ти с 200 или по-малко членове';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Само приятели';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Пълният ти профил е видим само за приятелите ти';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Покани за приятелство';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Всеки';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Позволи на всеки да ти изпраща заявки за приятелство';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Приятели на приятели';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Позволи на приятели на твоите приятели да ти изпращат покани';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Членове на общността';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Позволи на членове от общности, в които участваш, да ти изпращат заявки';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Директни съобщения';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Разрешаване на директни съобщения от членове на общността';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Позволи на членове от общности, в които си, да ти изпращат лични съобщения';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Разрешаване на директни съобщения от ботове на общността';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Позволи на ботове от общности, в които членуваш, да ти изпращат лични съобщения';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Контролирайте кой може да ви изпраща заявки за приятелство и директни съобщения';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Контролирайте кой може да ви се обажда и да ви добавя в групови чатове';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Входящи повиквания';

  @override
  String get privacyDashboardIncomingCallsDesc =>
      'Контролирайте кой може да ви се обажда';

  @override
  String get privacyDashboardAllowedCallers => 'Кой може да се обажда';

  @override
  String get privacyDashboardIncomingCallNobody => 'Никой';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Блокиране на всички входящи повиквания';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Само приятели';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Позволи само на приятели да ти се обаждат (препоръчително)';

  @override
  String get privacyDashboardIncomingCallCustom => 'Приятели + Персонализирано';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Позволи на приятели плюс допълнителни групи, които избереш';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Всеки';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Позволете на всеки да ви се обажда, дори непознати';

  @override
  String get privacyDashboardAdditionalGroups => 'Допълнителни групи';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'Хора, които са приятели с вашите приятели, могат да ви се обадят';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'Хора от общности, в които и двамата членувате, могат да ви се обадят';

  @override
  String get privacyDashboardRingBehavior => 'Поведение при звънене';

  @override
  String get privacyDashboardSilentCalls => 'Безшумни повиквания от всички';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'Всички обаждания ще уведомяват безшумно, вместо да звънят. По подразбиране обажданията от хора извън приятелите ви винаги са безшумни.';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Кой може да те добавя в групови чатове';

  @override
  String get privacyDashboardGroupDmDesc =>
      'Контролирайте кой може да ви добавя в групови чатове без вашето разрешение. Всеки все още може да ви изпраща покани за присъединяване.';

  @override
  String get privacyDashboardAllowedInvites => 'Разрешени покани';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Никой да не може да те добавя в групови чатове без твое разрешение';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Позволи само на приятели да те добавят без потвърждение (препоръчително)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Позволи на приятели плюс допълнителни групи да те добавят';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Позволете на всеки да ви добавя в групови чатове без запитване';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'Хора, които са приятели с вашите приятели, могат да ви добавят в групови чатове';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'Хора от общности, в които и двамата членувате, могат да ви добавят в групови чатове';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Гласова активност в „Активни сега“';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Споделяне на гласовата ти активност с приятели';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Да споделяш ли гласова активност с всички приятели?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Да спреш ли споделянето на гласова активност с всички приятели?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Предстои да започнеш да споделяш гласовата си активност с всичките си приятели, включително бъдещите. Това изпраща актуализация до всички тях и може да бъде променено отново чак след 24 часа.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Предстои да спреш да споделяш гласовата си активност с всичките си приятели, включително бъдещите. Това изпраща актуализация до всички тях и може да бъде променено отново чак след 24 часа.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Да, сподели с всички приятели';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm =>
      'Да, спри споделянето';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Налично отново след $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Споделянето на гласова активност е актуализирано';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Споделянето на гласова активност не можа да бъде актуализирано в момента';

  @override
  String get privacyDashboardDataExportDesc =>
      'Създай архив за изтегляне с данните от акаунта си, включително съобщения и URL адреси на прикачени файлове. Повечето хора искат всичко, но можеш да стесниш обхвата по-долу.';

  @override
  String get privacyDashboardExportMyData => 'Експортиране на моите данни';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Премахни завинаги съобщенията, изпратени от теб в DM, групови DM и общности. Процесът върви във фонов режим и ще получиш DM, когато приключи.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Изтриване на съобщенията ми';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Да се разрешат ли директни съобщения от членове на общността?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Да се блокират ли директните съобщения от членове на общността?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Да се разреши ли на ботовете да ти изпращат директни съобщения?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Да се блокират ли директните съобщения от ботове?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Искаш ли да разрешиш директни съобщения и от членове на съществуващите ти общности?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Искаш ли да блокираш и директните съобщения от членове на съществуващите ти общности?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Искаш ли ботовете от съществуващите ти общности също да могат да ти изпращат директни съобщения?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Искате ли да блокирате ботове и от съществуващите си общности?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'Можете да промените тази настройка и за всяка общност, като натиснете продължително върху името на общността и изберете Настройки за поверителност.';

  @override
  String get privacyDashboardDmConfirmAllowAll =>
      'Разрешаване за всички общности';

  @override
  String get privacyDashboardDmConfirmBlockAll =>
      'Блокиране за всички общности';

  @override
  String get privacyDashboardDmConfirmSkip => 'Пропусни тази стъпка';

  @override
  String get privacyDashboardDataRequestGoBack => 'Назад';

  @override
  String get privacyDashboardDataRequestExportTitle =>
      'Експортиране на моите данни';

  @override
  String get privacyDashboardDataRequestDeleteTitle =>
      'Изтриване на съобщенията ми';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'Ще обработим заявката възможно най-скоро. Ще получиш имейл, когато архивът ти е готов.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'Ще обработим това възможно най-скоро. Ще получиш DM от нас, когато е готово.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'Какво да включиш';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Всичко';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Експортирай всяко изпратено от теб съобщение, плюс всичките си настройки на акаунта, членства и метаданни.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'Персонализиран избор';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Избери кои видове разговори, общности и период да включиш в архива.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Избери какво да включиш';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Избери кои видове разговори да изчистиш.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Само места, до които вече нямам достъп';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Изтриване само на съобщения от общности и групови DM, които напусна или от които са те премахнали.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Кои разговори';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Избери кои видове разговори да се включат.';

  @override
  String get privacyDashboardDataRequestKindDms => 'Отворени DM';

  @override
  String get privacyDashboardDataRequestKindDmsClosed => 'Затворени DM';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'Групови DM';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Общности';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Кои общности';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Филтър за общности';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Включване на всички освен избраните';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude => 'Само избраните';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'В момента не членуваш в общности.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Период от време';

  @override
  String get privacyDashboardDataRequestDateMode => 'Период от време';

  @override
  String get privacyDashboardDataRequestAllTime => 'За цялото време';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Персонализиран период';

  @override
  String get privacyDashboardDataRequestStartDate => 'Начална дата';

  @override
  String get privacyDashboardDataRequestEndDate => 'Крайна дата';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Остави което и да е поле празно, за да остане този край на периода неограничен.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Избери поне един вид разговор, който да включиш.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'Началната дата трябва да е преди крайната дата.';

  @override
  String get privacyDashboardDataRequestConfirmTitle =>
      'Преглед и потвърждение';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'Ще създадем архив за изтегляне с всички съобщения, изпратени от теб, и ще ти изпратим имейл, когато е готов. Линкът за изтегляне в този имейл изтича след 7 дни.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'Ще създадем архив за изтегляне, който отговаря на филтрите по-долу, и ще ти изпратим имейл, когато е готов. Линкът за изтегляне в този имейл изтича след 7 дни.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Изтрий завинаги съобщенията, които отговарят на филтрите по-долу. Това действие не може да бъде отменено.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'След като това започне, няма връщане назад. Ще ти изпратим DM, когато приключи.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'Заяви експорт';

  @override
  String get privacyDashboardDataRequestDeleteMessages =>
      'Изтриване на съобщения';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Обхват';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'Разговори';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Общности';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Период от време';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'Няма';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'От $start';
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
      other: '# общности',
      one: '# общност',
    );
    return 'Всички без $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# общности',
      one: '# общност',
    );
    return 'Само $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Отворени директни съобщения';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Затворени директни съобщения';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Директни съобщения (отворени и затворени)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'Групови DM';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Общности';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# часа',
      one: '# час',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# минути',
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
      one: '# час',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# минути',
      one: '# минута',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# секунди',
      one: '# секунда',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed =>
      'Неуспешно зареждане на настройките за поверителност';

  @override
  String get privacyDashboardRetry => 'Опитай отново';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Неуспешно запазване на настройките за чувствително съдържание.';

  @override
  String get privacyDashboardDataRequestFailed =>
      'Неуспешно изпълнение на заявката.';

  @override
  String get chatMessageDeleteFailed => 'Изтрий неуспешно съобщение';

  @override
  String get chatMessageAddReaction => 'Добавяне на реакция';

  @override
  String get doubleTapReactionHint => 'Double tap a message to';

  @override
  String get doubleTapReactionEdit => 'Редактиране';

  @override
  String get doubleTapReactionEditTitle => 'Edit default';

  @override
  String get doubleTapReactionEditSubtitle => 'Choose double tap emoji';

  @override
  String get chatMessageEdit => 'Редактиране на съобщението';

  @override
  String get chatMessageReply => 'Отговор';

  @override
  String get notificationReplyPlaceholder => 'Message';

  @override
  String get notificationReplyFailed => 'Couldn\'t send reply';

  @override
  String get chatMessageForward => 'Препращане';

  @override
  String get forwardMessageTitle => 'Препращане на съобщение';

  @override
  String get forwardSearchHint => 'Търсене на канали или директни съобщения';

  @override
  String get forwardDirectMessagesSection => 'Директни съобщения';

  @override
  String get forwardCommentHint => 'Добавяне на коментар (по избор)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Изпрати ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Няма намерени канали';

  @override
  String get forwardSuccessToast => 'Съобщението е препратено';

  @override
  String get forwardFailed => 'Неуспешно препращане на съобщението';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Коментарите са недостъпни, защото избраният канал има активиран режим на забавяне.';

  @override
  String get forwardSendSlowmodeBlocked =>
      'Изчаква се да изтече бавният режим в един или повече избрани канала.';

  @override
  String get slowmodeRateLimitedTitle => 'Бавният режим е активен';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'Включен е бавен режим — изчакайте $duration, преди да изпратите друго съобщение.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'Директното качване е забранено по време на бавен режим.';

  @override
  String get shareMediaTitle => 'Сподели в';

  @override
  String get shareMediaMessageHint => 'Добавете съобщение по избор…';

  @override
  String get shareMediaSendButton => 'Изпращане';

  @override
  String get shareMediaSuccessToast => 'Медията е споделена';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'Споделено с $count дестинации';
  }

  @override
  String get shareMediaFailedToast => 'Неуспешно споделяне на медия';

  @override
  String get forwardDestinationNoSendPermission =>
      'Не можете да изпращате съобщения тук';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Не можете да вграждате връзки тук';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Не можете да прикачвате файлове тук';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Изпращането на съобщения е деактивирано в тази общност';

  @override
  String get forwardDestinationTimedOut =>
      'Времето ви за изчакване в тази общност изтече';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Бавно режим - изчакайте $remaining';
  }

  @override
  String get chatMessageCopyText => 'Копирай съобщението';

  @override
  String get chatMessageCopyEmbedText =>
      'Копирай текста на вграденото съобщение';

  @override
  String get chatMessageTranslate => 'Преведи';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Преведено от $language';
  }

  @override
  String get chatMessageSeeOriginal => 'Виж оригинала';

  @override
  String get chatMessageSeeTranslation => 'Виж превода';

  @override
  String get chatMessageTranslating => 'Превеждане…';

  @override
  String get chatMessageTranslateFailed =>
      'Не успях да преведа това съобщение.';

  @override
  String get chatMessageTranslateUnavailable =>
      'Преводът не е наличен на това устройство.';

  @override
  String get chatMessageSpeak => 'Прочитане на съобщението';

  @override
  String get chatMessageStopSpeaking => 'Спиране на прочитането';

  @override
  String get chatMessagePin => 'Закачи съобщението';

  @override
  String get chatMessageUnpin => 'Откачи съобщението';

  @override
  String get chatMessageUnpinIt => 'Откачи го';

  @override
  String get chatMessageBookmark => 'Добавяне на съобщение в отметки';

  @override
  String get chatMessageRemoveBookmark => 'Премахване на отметката';

  @override
  String get chatMessageMarkAsUnread => 'Маркирай като непрочетено';

  @override
  String get chatMessageCopyMessageLink => 'Копирай линка към съобщението';

  @override
  String get chatMessageOpenLink => 'Отваряне на линка';

  @override
  String get chatMessageCopyLink => 'Копирай линка';

  @override
  String get chatMessageCopyMessageId => 'Копирай ID на съобщението';

  @override
  String get chatMessageViewReactions => 'Преглед на реакциите';

  @override
  String get chatMessageRemoveAllReactions => 'Премахване на всички реакции';

  @override
  String get chatMessageDebug => 'Отстраняване на грешки в съобщението';

  @override
  String get chatMessageDebugSheetTitle =>
      'Отстраняване на грешки в съобщението';

  @override
  String get chatMessageDebugCopyJson => 'Копирай JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'JSON на съобщението е копиран в клипборда';

  @override
  String get chatReactionsSheetTitle => 'Реакции';

  @override
  String get chatReactionsSheetEmpty => 'Все още никой не е реагирал с това.';

  @override
  String get chatReactionAddFailed => 'Неуспешно добавяне на реакция';

  @override
  String get chatReactionRemoveFailed => 'Неуспешно премахване на реакция';

  @override
  String get chatMessageReport => 'Докладване на съобщение';

  @override
  String get iarReportMessageTitle => 'Докладване на съобщение';

  @override
  String get iarThisUserFallback => 'този потребител';

  @override
  String get iarModalDescription =>
      'Подай сигнал за нарушение на правилата или намери инструменти за управление на контактите и предпочитанията.';

  @override
  String get iarPathStepAriaLabel => 'Какво ти трябва?';

  @override
  String get iarCategoryStepTitle => 'Какъв вид правило беше нарушено?';

  @override
  String get iarReasonStepTitle => 'Кое правило беше нарушено?';

  @override
  String get iarReasonSelectHint => 'Изберете причина';

  @override
  String get iarPickAnOptionToast => 'Избери опция, за да продължиш.';

  @override
  String get iarPickARuleToast => 'Изберете правилото, което е нарушено.';

  @override
  String get iarPathPlatform =>
      'Докладвай нарушение на правилата на платформата';

  @override
  String get iarPathCommunity => 'Докладвай на модераторите на тази общност';

  @override
  String get iarPathPreferenceMessage => 'Не харесвам това съдържание';

  @override
  String get iarCategoryTargetedHarmLabel => 'Заплахи, тормоз или вреда';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Тормоз, заплахи, омраза, насилие, рейдове или съдържание, което подтиква към самонараняване.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Безопасност на децата или съдържание за възрастни';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Непълнолетни в риск, съдържание за възрастни на неподходящо място или нежелано поведение.';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'Поверителност или представяне под чужда самоличност';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Доксинг, преследване, представяне за друго лице или неподходящ профил.';

  @override
  String get iarCategoryDeceptionLabel =>
      'Измами, злонамерен софтуер или дезинформация';

  @override
  String get iarCategoryDeceptionDescription =>
      'Фишинг, измами, злонамерени линкове или неверни твърдения, които е вероятно да причинят реална вреда.';

  @override
  String get iarCategoryIllegalOtherLabel => 'Незаконна дейност или нещо друго';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Незаконни продажби, подпомагане на престъпления или явно нарушение на правилата, което не попада в горните категории.';

  @override
  String get iarReasonHarassmentLabel => 'Тормоз или заплахи';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Тормоз, повтарящ се нежелан контакт, преследване или целенасочени нападки.';

  @override
  String get iarReasonHateLabel => 'Език на омразата';

  @override
  String get iarReasonHateMessageDescription =>
      'Обидни квалификации, дехуманизиращ език или нападки срещу защитени групи.';

  @override
  String get iarReasonViolenceLabel => 'Насилие или заплахи с насилие';

  @override
  String get iarReasonViolenceDescription =>
      'Достоверни заплахи, графично насилие или възхвала на насилието.';

  @override
  String get iarReasonMatureContentLabel =>
      'Съдържание за възрастни или тормоз';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Нежелано поведение или съдържание за възрастни на неподходящо място.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Безопасност на децата или експлоатация на непълнолетни';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Съдържание, свързано с груминг или експлоатация на деца.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Вредна дезинформация';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Неверни твърдения, които вероятно ще причинят реална вреда.';

  @override
  String get iarReasonSpamLabel => 'Спам, измами или фишинг';

  @override
  String get iarReasonSpamMessageDescription =>
      'Масов спам, измами, фалшиви игри с награди или злоупотреба с акаунти.';

  @override
  String get iarReasonMalwareLabel => 'Злонамерен софтуер или опасни линкове';

  @override
  String get iarReasonMalwareDescription =>
      'Злонамерен софтуер, кражба на идентификационни данни или опасни файлове.';

  @override
  String get iarReasonPrivacyLabel => 'Нарушаване на поверителността';

  @override
  String get iarReasonPrivacyDescription =>
      'Доксинг, разкрита лична информация или преследване.';

  @override
  String get iarReasonImpersonationLabel =>
      'Представяне за друго лице или подвеждащо съдържание';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Представяне за друго лице, включително подвеждащо съдържание, генерирано от AI.';

  @override
  String get iarReasonIllegalLabel => 'Незаконна дейност';

  @override
  String get iarReasonIllegalDescription =>
      'Незаконни продажби, подпомагане на престъпления или незаконна дейност.';

  @override
  String get iarReasonSelfHarmLabel => 'Самонараняване или самоубийство';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Популяризиране или инструкции, насърчаващи самонараняване или хранителни разстройства.';

  @override
  String get iarReasonOtherLabel => 'Друго явно нарушение на правилата';

  @override
  String iarReasonOtherDescription(String productName) {
    return 'Използвай само ако явно нарушава правилата на $productName и не попада в горните категории.';
  }

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Ако е замесено непълнолетно лице, използвайте вместо това \"$childSafetyReason\".';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Ако това включва CSAM или експлоатация на непълнолетен, изпратете го сега и не споделяйте материала повторно.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Ако някой е в непосредствена опасност, свържи се с местните служби за спешна помощ, ако можеш да го направиш безопасно.';

  @override
  String get iarSafetyNoteViolence =>
      'Ако това е достоверна непосредствена заплаха, свържи се и с местните служби за спешна помощ.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Ако това е непосредствена терористична заплаха, свържи се и с местните служби за спешна помощ.';

  @override
  String get iarActionBlockUserTitle => 'Блокиране на този потребител';

  @override
  String get iarActionBlockUserDescription =>
      'Спира съобщенията и поканите за приятелство.';

  @override
  String get iarActionBlockUserButton => 'Блокиране';

  @override
  String get iarActionCopyMessageLinkTitle => 'Копирай линка към съобщението';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Споделяне с модератори на общността.';

  @override
  String get iarActionCopyMessageLinkButton => 'Копирай';

  @override
  String get iarActionCloseDmTitle => 'Затваряне на това DM';

  @override
  String get iarActionCloseDmDescription =>
      'Не блокира. Можеш да го отвориш отново по-късно.';

  @override
  String get iarActionCloseDmButton => 'Затваряне на DM';

  @override
  String get iarActionLeaveCommunityTitle => 'Напускане на общността';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Няма да виждаш съдържанието и членовете ѝ.';

  @override
  String get iarActionLeaveCommunityButton => 'Напускане';

  @override
  String get iarActionDmSettingsTitle =>
      'Настройки за DM и покани за приятелство';

  @override
  String get iarActionDmSettingsDescription =>
      'Промени кой може да се свързва с теб.';

  @override
  String get iarActionCallSettingsTitle =>
      'Настройки за обаждания и групов чат';

  @override
  String get iarActionCallSettingsDescription =>
      'Промени кой може да ти се обажда или да те добавя.';

  @override
  String get iarActionOpenButton => 'Отваряне';

  @override
  String get iarActionDeleteMessageTitle => 'Изтриване на това съобщение';

  @override
  String get iarActionDeleteMessageDescription =>
      'Премахване от канала за всички.';

  @override
  String get iarActionDeleteMessageButton => 'Изтриване';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Изтрито';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Това съобщение вече е изтрито.';

  @override
  String get iarActionBanUserTitle => 'Забраняване на този потребител';

  @override
  String get iarActionBanUserDescription =>
      'Отваряне на диалоговия прозорец за забрана за тази общност.';

  @override
  String get iarActionBanUserButton => 'Забраняване';

  @override
  String get iarActionBanUserBannedButton => 'Наложена забрана';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Този потребител вече е с наложена забрана в общността.';

  @override
  String get iarCloseDmConfirmTitle => 'Затваряне на DM';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Затвори личния чат с $name. Това няма да блокира човека и можете да го отворите отново по-късно.';
  }

  @override
  String get iarSuccessTitle => 'Сигналът е изпратен';

  @override
  String get iarSuccessBody =>
      'Екипът ни за безопасност преглежда сигнала. Ще ти изпратим DM и имейл, след като вземем решение.';

  @override
  String get iarAlreadyReportedTitle => 'Вече докладвано';

  @override
  String get iarAlreadyReportedBody =>
      'Вече сте докладвали това съобщение. Екипът ни по безопасност го преглежда.';

  @override
  String get iarBackButton => 'Назад';

  @override
  String get iarContinueButton => 'Продължи';

  @override
  String get iarSendReportButton => 'Изпращане на сигнал';

  @override
  String get iarDoneButton => 'Готово';

  @override
  String get iarCouldntSendToast =>
      'Не успях да изпратя доклада. Моля, опитайте отново.';

  @override
  String get iarRateLimitedToast =>
      'Изпращате твърде бързо. Моля, изчакайте малко и опитайте отново.';

  @override
  String get iarReportSentToast =>
      'Изпратено. Нашият екип по безопасност ще го прегледа.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Блокиране на $name? Те няма да могат да ви пишат или да ви изпращат покани за приятелство. Можете да ги разблокирате по-късно.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Не успяхме да блокираме този потребител. Моля, опитайте отново.';

  @override
  String get iarCloseDmSuccessToast => 'Съобщението е затворено.';

  @override
  String get iarCloseDmFailedToast =>
      'Не успяхме да затворим това лично съобщение. Моля, опитайте отново.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Не успяхме да напуснем тази общност. Моля, опитайте отново.';

  @override
  String get chatMessageSuppressEmbeds => 'Скриване на вградените елементи';

  @override
  String get chatMessageUnsuppressEmbeds => 'Показване на вградените елементи';

  @override
  String get chatMessageDelete => 'Изтриване на съобщението';

  @override
  String get chatMessageDeleteConfirmTitle => 'Изтриване на съобщението';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Сигурни ли сте, че искате да изтриете това съобщение?';

  @override
  String get chatMessageDeleteAttachment => 'Изтриване на прикачен файл';

  @override
  String get chatMessageDeleteAttachmentConfirmDescription =>
      'Are you sure you want to delete this attachment?';

  @override
  String get chatMessageEditAttachmentAltText =>
      'Редактиране на алтернативен текст';

  @override
  String get chatMessageMore => 'Още';

  @override
  String get chatEditingMessage => 'Редактиране на съобщение';

  @override
  String get chatReplyOriginalDeleted => 'Оригиналното съобщение е изтрито';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Неуспешно зареждане на оригиналното съобщение';

  @override
  String get chatReplyAttachedMedia => 'Съобщението съдържа прикачени медии';

  @override
  String chatBlockedMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count блокирани съобщения',
      one: '1 блокирано съобщение',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count потенциални спам съобщения',
      one: '1 потенциално спам съобщение',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Отговорът е скрит, защото оригиналният автор е блокиран.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Отговорът е скрит, защото оригиналният автор е маркиран като спамер.';

  @override
  String get devMarkAsSpamLocally => 'Маркирай като спам (локално)';

  @override
  String get devIgnoreSpamFlag => 'Игнориране на сигнал за спам';

  @override
  String get chatMessagesLoadError => 'Не успяхме да заредим съобщенията.';

  @override
  String get chatReplyMentionOverrideTitle =>
      'Да промениш ли предпочитанието за споменаване?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname предпочита отговори с @споменаване. Да изпратя ли без споменаване все пак?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname предпочита отговори без @споменаване. Да изпратя ли със споменаване все пак?';
  }

  @override
  String get chatReplyMentionIgnorePreference =>
      'Игнориране на предпочитанието';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Кликни, за да изключиш известяването на потребителя, на когото отговаряш.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Кликни, за да включиш известяването на потребителя, на когото отговаряш.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Споменаване на потребителя, на когото е отговорено';

  @override
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

  @override
  String get chatReplyCancel => 'Отказ на отговора';

  @override
  String get chatEditMessageHint => 'Редактиране на съобщението';

  @override
  String get chatEditNoChanges => 'Няма промени за запазване';

  @override
  String get chatChannelNotReady =>
      'Този канал все още не е готов. Опитайте отново след малко.';

  @override
  String get chatMessageEdited => '(редактирано)';

  @override
  String get chatMessageSilent => 'Това беше @silent съобщение.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Днес в $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Вчера в $time';
  }

  @override
  String get mediaViewerImagePreview => 'Преглед на изображението';

  @override
  String get mediaViewerClose => 'Затваряне на прегледа на медия';

  @override
  String get mediaViewerOpenInBrowser => 'Отваряне в браузър';

  @override
  String get mediaViewerOptions => 'Опции за медия';

  @override
  String get mediaViewerCopyLink => 'Копирай линка';

  @override
  String get mediaViewerForward => 'Препращане';

  @override
  String get mediaViewerZoomIn => 'Увеличаване';

  @override
  String get mediaViewerZoomOut => 'Намаляване';

  @override
  String get mediaViewerPreviousAttachment => 'Предишен прикачен файл';

  @override
  String get mediaViewerNextAttachment => 'Следващ прикачен файл';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String mediaViewerAttachmentThumbnail(int index) {
    return 'Прикачен файл $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Затвори';

  @override
  String get chatAttachmentVideoToggleControls =>
      'Показване/скриване на контролите за видео';

  @override
  String get chatAttachmentVideoMute => 'Заглуши видеото';

  @override
  String get chatAttachmentVideoUnmute => 'Включване на звука на видеото';

  @override
  String get chatAttachmentVideoPlay => 'Пусни видеото';

  @override
  String get chatAttachmentVideoPause => 'Пауза на видеото';

  @override
  String get chatAttachmentVideoProgress => 'Напредък на видеото';

  @override
  String get chatVideoPlaybackFailed =>
      'Не може да се възпроизведе това видео.';

  @override
  String get chatImageCouldNotLoad => 'Could not load this image.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Известява потребителите с тази роля, които имат разрешение да виждат този канал.';

  @override
  String get composerAutocompleteSuggestions => 'Предложения';

  @override
  String get composerAutocompleteCommandsHeading => 'Команди';

  @override
  String get composerAutocompleteChoicesHeading => 'Опции';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'Незадължителни аргументи';

  @override
  String get composerAutocompleteChannelsHeading => 'Канали';

  @override
  String get composerAutocompleteMembersHeading => 'Членове';

  @override
  String get composerAutocompleteUsersHeading => 'Потребители';

  @override
  String get composerAutocompleteMentionsHeading => 'Споменавания';

  @override
  String get composerAutocompleteRolesHeading => 'Роли';

  @override
  String get composerAutocompleteMediaHeading => 'Медия';

  @override
  String get composerAutocompleteStickersHeading => 'Стикери';

  @override
  String get composerAutocompleteGifsHeading => 'GIF файлове';

  @override
  String get composerAutocompleteNoGifs => 'Не са намерени GIF файлове';

  @override
  String get composerCommandShrugDescription =>
      'Добавя ¯\\_(ツ)_/¯ към съобщението ти.';

  @override
  String get composerCommandTableflipDescription =>
      'Добавя (╯°□°)╯︵ ┻━┻ към съобщението ти.';

  @override
  String get composerCommandUnflipDescription =>
      'Добавя ┬─┬ ノ( ゜-゜ノ) към съобщението ти.';

  @override
  String get composerCommandMeDescription =>
      'Изпращане на съобщение за действие (показва се в курсив).';

  @override
  String get composerCommandSpoilerDescription =>
      'Изпращане на съобщение със спойлер (обвива се в тагове за спойлер).';

  @override
  String get composerCommandTtsDescription =>
      'Изпращане на съобщение с преобразуване на текст в говор.';

  @override
  String get composerCommandNickDescription =>
      'Промени прякора си в тази общност.';

  @override
  String get composerCommandKickDescription =>
      'Изгонване на член от тази общност.';

  @override
  String get composerCommandBanDescription =>
      'Забраняване на достъп на член до тази общност.';

  @override
  String get composerCommandMsgDescription =>
      'Изпращане на директно съобщение до потребител.';

  @override
  String get composerCommandSavedDescription => 'Изпращане на запазена медия.';

  @override
  String get composerCommandStickerDescription => 'Изпращане на стикер.';

  @override
  String get composerCommandGifDescription => 'Търсене и изпращане на GIF.';

  @override
  String get composerCommandMemberOption =>
      'Членът, към когото е насочено действието.';

  @override
  String get composerCommandReasonOption => 'Причина (по избор).';

  @override
  String get composerCommandMessageOption =>
      'Съобщението, което да се изпрати.';

  @override
  String get composerCommandQueryOption => 'Какво да търсиш.';

  @override
  String get composerCommandNicknameOption =>
      'Новият ти прякор или остави празно, за да го нулираш.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'Колко от скорошните съобщения на члена да бъдат изтрити.';

  @override
  String get composerCommandDeleteMessagesNone => 'Не изтривай нищо';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Предишни $count дни';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'Последните 24 часа';

  @override
  String get composerCommandOptionRequired =>
      'Тази опция е задължителна. Въведи стойност.';

  @override
  String get composerCommandClear => 'Изчистване на командата';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'Промени прякора си в тази общност от **$previousNickname** на **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'Неизвестен потребител';

  @override
  String composerCommandMsgFailed(String username) {
    return 'Не успях да изпратя съобщение до **$username**. Възможно е той/тя да е деактивирал/а личните съобщения или да сте блокиран/а.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count още';
  }

  @override
  String get addGuildModalTitle => 'Добавяне на общност';

  @override
  String get addGuildModalLandingDescription =>
      'Създай нова общност или се присъедини към съществуваща.';

  @override
  String get addGuildCreateCommunity => 'Създаване на общност';

  @override
  String get addGuildJoinCommunity => 'Присъединяване към общността';

  @override
  String get addGuildImportDiscordTemplate =>
      'Импортиране на шаблон от Discord';

  @override
  String get addGuildJoinTitle => 'Присъединяване към общност';

  @override
  String get addGuildJoinDescription =>
      'Въведи линка за покана, за да се присъединиш към общност.';

  @override
  String get addGuildInviteLinkLabel => 'Линк за покана';

  @override
  String get addGuildJoinSubmit => 'Присъединяване към общността';

  @override
  String get addGuildInviteInvalid => 'Тази покана е невалидна или е изтекла.';

  @override
  String get addGuildJoinFailed =>
      'Не успях да се присъединя към общността. Моля, опитайте отново.';

  @override
  String get addGuildCreateTitle => 'Създаване на общност';

  @override
  String get addGuildCreateDescription =>
      'Създай общност, в която ти и приятелите ти да си чатите.';

  @override
  String get addGuildCreateNameLabel => 'Име на общността';

  @override
  String get addGuildCreateSubmit => 'Създаване на общност';

  @override
  String get addGuildCreateFailed =>
      'Не успяхме да създадем общността. Моля, опитайте отново.';

  @override
  String get addGuildCreateClaimTitle => 'Заяви акаунта си';

  @override
  String get addGuildCreateClaimDescription =>
      'Трябва да заявиш акаунта си, преди да можеш да създадеш общност.';

  @override
  String get addGuildCreateVerifyTitle => 'Потвърди имейла си';

  @override
  String get addGuildCreateVerifyDescription =>
      'Трябва да потвърдиш имейл адреса си, преди да можеш да създадеш общност.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Анимираните икони не се поддържат при създаване на нова общност. Използвай статично изображение.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'Създавайки общност, вие се съгласявате да следвате и спазвате ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return 'Правила на общността на $productName';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'Тази инстанция е единична общност, така че не могат да бъдат създадени допълнителни общности.';

  @override
  String get addGuildCreateChangeIcon => 'Смяна на икона';

  @override
  String get addGuildCreateIconLabel => 'Икона на общността';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Макс. 10MB. Препоръчително: 512×512px';

  @override
  String get addGuildImportDescription =>
      'Поставете URL адрес на шаблон от Discord, за да импортирате неговата структура в нова общност.';

  @override
  String get addGuildImportUrlLabel => 'URL на шаблон';

  @override
  String get addGuildImportUrlInvalid =>
      'Въведете валиден URL адрес или код на шаблон на Discord.';

  @override
  String get addGuildImportFetchFailed =>
      'Не успяхме да изтеглим шаблона за общността. Шаблонът може да не съществува или външната услуга да е недостъпна.';

  @override
  String get addGuildImportInvalidResponse =>
      'Това не изглежда като валиден отговор на шаблон.';

  @override
  String get addGuildImportTemplateLabel => 'Шаблон';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount текстови, $voiceChannelCount гласови, $categoryCount категории, $roleCount роли';
  }

  @override
  String get addGuildImportRemoveIcon => 'Премахване на икона';

  @override
  String get addGuildImportTemplateInvalid =>
      'Данните за шаблона на общността са невалидни или повредени.';

  @override
  String get addGuildPackInstalled => 'Пакетът беше инсталиран успешно.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Премахване на всички реакции';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Сигурни ли сте, че искате да премахнете всички реакции от това съобщение?';

  @override
  String get chatMessagePinConfirm => 'Закачи';

  @override
  String get chatMessagePinConfirmDescription =>
      'Закачи това съобщение в канала, за да го виждат всички.';

  @override
  String get chatMessageUnpinConfirmTitle => 'Откачи съобщението';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Да върнем ли това закачено съобщение назад във времето?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username закачи $messageLink в този канал. Вижте $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'съобщение';

  @override
  String get systemPinMessageAllPinsLink => 'всички прикачени съобщения';

  @override
  String get channelPinsEmptyTitle => 'Няма закачени съобщения';

  @override
  String get channelPinsEmptyDescription =>
      'Закачените съобщения се показват тук.';

  @override
  String get channelDetailsFallbackTitle => 'Подробности';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'Групов личен чат · $count членове';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'Затвори разговора си с $name?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'Напуснете $name?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Настройки на канала';

  @override
  String get channelDetailsGroupSettingsTitle => 'Настройки на групата';

  @override
  String get channelDetailsDmSettingsTitle => 'Настройки за DM';

  @override
  String get channelDetailsInvitePeople => 'Покани хора';

  @override
  String get channelDetailsCopyLink => 'Копирай линка';

  @override
  String get channelMenuCopyChannelLink => 'Копирай линка към канала';

  @override
  String get channelMenuCopyRedirectLink => 'Копирай връзка за пренасочване';

  @override
  String get channelDetailsAddFriendsToGroup =>
      'Добавяне на приятели в групата';

  @override
  String get channelDetailsGroupInvites => 'Покани за група';

  @override
  String get channelDetailsEditChannel => 'Редактиране на канала';

  @override
  String get channelDetailsDeleteChannel => 'Изтриване на канала';

  @override
  String get channelSettingsCategorySettingsTitle => 'Настройки на категорията';

  @override
  String get channelSettingsEditCategory => 'Редактиране на категория';

  @override
  String get channelSettingsTabOverview => 'Общ преглед';

  @override
  String get channelSettingsTabPermissions => 'Разрешения';

  @override
  String get channelSettingsTabInvites => 'Покани';

  @override
  String get channelSettingsTabWebhooks => 'Уебхукове';

  @override
  String get channelSettingsDeleteChannel => 'Изтриване на канала';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'Сигурни ли сте, че искате да изтриете $channelName? Това действие не може да бъде отменено.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'Сигурни ли сте, че искате да изтриете $categoryName? Това действие не може да бъде отменено.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Изтриване на категорията';

  @override
  String get channelSettingsChannelUpdated => 'Каналът е актуализиран';

  @override
  String get channelSettingsChannelName => 'Име на канала';

  @override
  String get channelSettingsCategoryName => 'Име на категорията';

  @override
  String get channelSettingsMyCategory => 'Моята категория';

  @override
  String get categoryExpandCategory => 'Разгъване на категорията';

  @override
  String get categoryCollapseCategory => 'Свиване на категорията';

  @override
  String get categoryExpandAllCategories => 'Разгъване на всички категории';

  @override
  String get categoryCollapseAllCategories => 'Свиване на всички категории';

  @override
  String get categoryMuteCategory => 'Изключване на известията за категорията';

  @override
  String get categoryUnmuteCategory => 'Включване на известията за категорията';

  @override
  String get categoryCopyCategoryId => 'Копирай ID на категорията';

  @override
  String get categoryIdCopied => 'ID на категорията е копирано';

  @override
  String get channelSettingsChannelNamePlaceholder => 'общи';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'Тема';

  @override
  String get channelSettingsTopicPlaceholder =>
      'Добавяне на тема към този канал';

  @override
  String get channelSettingsInsertEmoji => 'Вмъкване на емоджи';

  @override
  String get channelSettingsTopicTooLongTitle =>
      'Темата на канала е твърде дълга.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'Съкрати темата и опитай отново.';

  @override
  String get channelSettingsSlowmode => 'Бавен режим';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Време между съобщенията. „$bypassSlowmodePermissionLabel“ може да го заобиколи.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Изкл';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds секунди';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes минути';
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
  String get channelSettingsVoiceQuality => 'Качество на гласа';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'По-висока скорост на трансфер = по-добро качество и по-висока употреба на трафик.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbps';
  }

  @override
  String get channelSettingsParticipantLimit => 'Лимит на участниците';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Максимален брой членове, които могат да се присъединят едновременно. 0 означава неограничен.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count участници',
      one: '1 участник',
      zero: '∞ Без ограничение',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Ограничение на връзките';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Максимален брой активни връзки, които един член може да поддържа в този канал.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count връзки',
      one: '1 връзка',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Гласов регион';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Изберете гласов регион за този канал. Автоматично използва най-близкия регион.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Автоматично';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'Неуспешно зареждане на гласовите региони';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Опитай отново след малко.';

  @override
  String get channelSettingsResetSlider =>
      'Възстановяване на плъзгача до стойността по подразбиране';

  @override
  String get channelSettingsAdvanced => 'Разширени';

  @override
  String get channelSettingsMatureContentOverride =>
      'Изключение за съдържание за възрастни';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Задай нивото $scopeLevel за този канал. Съдържание за възрастни се показва зад предпазна мярка преди влизане.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Наследяване';

  @override
  String get channelSettingsMatureContentOn => 'Вкл';

  @override
  String get channelSettingsMatureContentOff => 'Изкл';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Маркира този канал като съдържащ неподходящо съдържание.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Остави този канал без ограничения за съдържание за възрастни.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Наследено от $inheritedSourceLabel: включено';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Наследено от $inheritedSourceLabel: изключено';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'категория';

  @override
  String get channelSettingsMatureContentCommunitySource => 'общност';

  @override
  String get channelSettingsMatureContentCategoryScope => 'Категория';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Общност';

  @override
  String get channelSettingsContentWarningToggle =>
      'Показване на предупреждение за съдържание в този канал';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Включва подкана за съгласие преди влизане в този канал.';

  @override
  String get channelSettingsContentWarningText =>
      'Персонализиран текст за предупреждение';

  @override
  String get channelSettingsContentWarningDefault =>
      'Тук има чувствително съдържание.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'Нужно е разрешението „$manageChannelsPermissionLabel“, за да редактираш тези разрешения.';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'Нужно е разрешението „$manageRolesPermissionLabel“, за да редактираш тези разрешения.';
  }

  @override
  String get channelSettingsUnknownRole => 'Неизвестна роля';

  @override
  String get channelSettingsUnknownUser => 'Неизвестен потребител';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides =>
      'Изключения за достъп';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Редактиране на достъпа за $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'Назад към презаписванията';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Задаване на основния достъп за този канал';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Конфигуриране на изключенията за тази роля';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Конфигуриране на изключенията за този член';

  @override
  String get channelSettingsPermissionsSearchPlaceholder =>
      'Търсене на разрешения…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Достъпът до канала е актуализиран';

  @override
  String get channelSettingsPermissionsTitle => 'Контрол на достъпа';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'Този канал е синхронизиран с родителската категория ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'Този канал не е синхронизиран с родителската категория ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory =>
      'Синхронизиране с категорията';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'Каналът е синхронизиран с родителската категория';

  @override
  String get channelSettingsPermissionsAddOverride => 'Добавяне на изключение';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Търсене на роли или членове…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => 'Роли и членове';

  @override
  String get channelSettingsDeleteInvite => 'Изтриване на покана';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Изтриване на тази покана? Това действие не може да бъде отменено.';

  @override
  String get channelSettingsCopyInviteCode => 'Копирай код за покана';

  @override
  String get channelSettingsCopyInviteUrl => 'Копирай URL адреса за покана';

  @override
  String get channelSettingsWebhookCreated => 'Уебхукът е създаден';

  @override
  String get channelSettingsWebhookCreateFailed =>
      'Неуспешно създаване на уебхук';

  @override
  String get channelSettingsCreateWebhook => 'Създаване на уебхук';

  @override
  String get channelSettingsInvitesDescription =>
      'Управлявай линковете за покани за този канал.';

  @override
  String get channelSettingsInvitesCreate => 'Създаване на покана';

  @override
  String get channelSettingsInvitesEmpty => 'Няма линкове за покани';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'Този канал все още няма линкове за покани. Създай такъв, за да поканиш хора в канала.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Възникна грешка при зареждането на линковете за покани за този канал. Опитай отново.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Управлявай входящите уебхукове, които могат да публикуват съобщения в този канал.';

  @override
  String get channelSettingsWebhooksEmpty => 'Няма уебхукове';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'Няма конфигурирани уебхукове за този канал. Създай уебхук, за да позволиш на външни приложения да публикуват съобщения.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Този канал не поддържа уебхукове.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'За да преглеждате и редактирате уебкуки за този канал, се нуждаете от разрешението „$permission“.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'Неуспешно зареждане на уебхукове';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Възникна грешка при зареждането на уебхуковете за този канал. Опитай отново.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Създадено от $creator на $date';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'Неизвестен потребител';

  @override
  String get channelSettingsWebhooksAvatar => 'Аватар';

  @override
  String get channelSettingsWebhooksUploadImage => 'Качване на изображение';

  @override
  String get channelSettingsWebhooksRemove => 'Премахване';

  @override
  String get channelSettingsWebhooksName => 'Име';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Име на уебхука';

  @override
  String get channelSettingsWebhooksChannel => 'Канал';

  @override
  String get channelSettingsWebhooksUrl => 'URL адрес на уебхука';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Копирай URL адреса на уебхука';

  @override
  String get channelSettingsWebhooksDelete => 'Изтриване на уебхук';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'Неуспешно изтриване на уебхука';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'Искаш ли да изтриеш този уебхук? Не може да бъде отменено.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Опитай отново след малко.';

  @override
  String get channelMenuOpenChat => 'Отваряне на чата';

  @override
  String get channelMenuDuplicateChannel => 'Дублиране на канала';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Нулиране на състоянието на съгласието за съдържание за възрастни';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Да изтриеш ли съобщенията си в този канал?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Това ще изтрие завинаги всяко съобщение, което си изпращал в този канал. Това действие не може да бъде отменено.';

  @override
  String get channelMenuDeleteMyMessagesConfirm =>
      'Изтриване на съобщенията ми';

  @override
  String get channelMenuDeletedYourMessages => 'Изтрихте вашите съобщения';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'Съобщенията ти не можаха да бъдат изтрити';

  @override
  String get channelDetailsSystemMessage => 'Системно съобщение';

  @override
  String get channelDetailsTextChannel => 'Текстов канал';

  @override
  String get channelDetailsVoiceChannel => 'Гласов канал';

  @override
  String get channelDetailsCategory => 'Категория';

  @override
  String get channelDetailsLinkChannel => 'Свързване на канал';

  @override
  String get channelDetailsGenericChannel => 'Канал';

  @override
  String get channelDetailsMutedConversation => 'Заглушен разговор';

  @override
  String get channelDetailsUnmutedConversation =>
      'Разговорите вече не са заглушени';

  @override
  String get channelDetailsMutedChannel => 'Заглушен канал';

  @override
  String get channelDetailsUnmutedChannel => 'Каналът е отменен';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Настройките за известия са актуализирани';

  @override
  String get channelDetailsTabMembers => 'Членове';

  @override
  String get channelDetailsTabPins => 'Закачени';

  @override
  String get channelDetailsActionMute => 'Заглуши';

  @override
  String get channelDetailsActionUnmute => 'Включване на звука';

  @override
  String get channelDetailsActionSearch => 'Търсене';

  @override
  String get channelDetailsActionMore => 'Още';

  @override
  String get channelDetailsMembersEmptyTitle => 'Няма членове за показване';

  @override
  String get channelDetailsMembersEmptyBody =>
      'Членовете ще се появят тук, след като данните за общността бъдат заредени.';

  @override
  String get memberListPermissionDeniedTitle => 'Не можеш да виждаш членове';

  @override
  String get memberListPermissionDeniedBody =>
      'Не можеш да видиш членовете на този канал в тази общност';

  @override
  String get memberListUnavailableTitle => 'Списъкът с членове не е наличен';

  @override
  String get memberListUnavailableBody =>
      'Списъците с членове временно не са налични в тази общност';

  @override
  String get channelDetailsPinsLoadFailedTitle =>
      'Не успяхме да заредим пиновете';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'Членовете с разрешение „Закачане на съобщения“ могат да закачат съобщения, които всеки да вижда.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'Можете да закачите съобщения в този разговор, за да ги виждат всички.';

  @override
  String get channelDetailsPinsEndReached => 'Достигна края';

  @override
  String get channelHeaderOpenDetails => 'Отвори подробности за канала';

  @override
  String get channelHeaderPinnedMessages => 'Закачени съобщения';

  @override
  String get channelHeaderPinnedMessagesUnread =>
      'Закачени съобщения, непрочетени';

  @override
  String get channelHeaderMemberList => 'Списък с членове';

  @override
  String get channelHeaderInbox => 'Входящи';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Настройки на известията, заглушено';

  @override
  String get channelDetailsSearchTitle => 'Търсене';

  @override
  String get channelDetailsSearchHint => 'Търсене в съобщенията';

  @override
  String get channelDetailsSearchFilterFrom => 'От';

  @override
  String get channelDetailsSearchFilterHas => 'Има';

  @override
  String get channelDetailsSearchFilterIn => 'В';

  @override
  String get channelDetailsSearchFilterMentions => 'Споменавания';

  @override
  String get channelDetailsSearchFilterMore => 'Още';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Активен';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count канала';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count потребители';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'Потребител';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Бот';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Уебхук';

  @override
  String get channelDetailsSearchFilterByChannel => 'Филтриране по канал';

  @override
  String get channelDetailsSearchChannelsHint => 'Търсене на канали';

  @override
  String get channelDetailsSearchChannelsEmpty => 'Няма намерени канали';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Закачени';

  @override
  String get channelDetailsSearchPinnedTrue => 'Само пинове';

  @override
  String get channelDetailsSearchPinnedFalse => 'Изключи закачени';

  @override
  String get channelDetailsSearchClearFilter => 'Изчистване';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Тип автор';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Дата';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Режим на дата';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Избери дата';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Връзка към хост';

  @override
  String get channelDetailsSearchMoreFiltersFileName =>
      'Името на файла съдържа';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'Разширение на файла';

  @override
  String get channelDetailsSearchContentPoll => 'Анкета';

  @override
  String get channelDetailsSearchContentPollDescription => 'Съобщения с анкета';

  @override
  String get channelDetailsSearchContentForward => 'Препращане';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Препратени съобщения';

  @override
  String get channelDetailsSearchFilterSort => 'Сортиране';

  @override
  String get channelHeaderSearchFiltersTitle => 'Филтри за търсене';

  @override
  String get channelHeaderSearchRecentTitle => 'Скорошни търсения';

  @override
  String get channelHeaderSearchUsersTitle => 'Потребители';

  @override
  String get channelHeaderSearchChannelsTitle => 'Канали';

  @override
  String get channelHeaderSearchValuesTitle => 'Стойности';

  @override
  String get channelHeaderSearchDatesTitle => 'Дати';

  @override
  String get channelHeaderSearchDefaultBadge => 'По подразбиране';

  @override
  String get channelHeaderSearchClearHistory => 'Изчистване';

  @override
  String get channelHeaderSearchFilterDescFrom => 'потребител';

  @override
  String get channelHeaderSearchFilterDescMentions => 'потребител';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'връзка, вграждане, изображение, видео, звук, файл, стикер, …';

  @override
  String get channelHeaderSearchFilterDescBefore => 'дата или период от време';

  @override
  String get channelHeaderSearchFilterDescOn => 'дата или период от време';

  @override
  String get channelHeaderSearchFilterDescDuring => 'дата или период от време';

  @override
  String get channelHeaderSearchFilterDescAfter => 'дата или период от време';

  @override
  String get channelHeaderSearchFilterDescIn => 'канал';

  @override
  String get channelHeaderSearchFilterDescPinned => 'вярно или невярно';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'потребител, бот или уебхук';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'хост, например example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'част от името на прикачен файл';

  @override
  String get channelHeaderSearchFilterDescFileType =>
      'файлово разширение, напр. png';

  @override
  String get channelHeaderSearchFilterDescSort => 'време или уместност';

  @override
  String get channelHeaderSearchFilterDescOrder => 'възх. или низх';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString резултата',
      one: '1 резултат',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'Филтриране по потребител';

  @override
  String get channelDetailsSearchFilterByContent => 'Филтриране по съдържание';

  @override
  String get channelDetailsSearchSortBy => 'Сортиране на резултатите по';

  @override
  String get channelDetailsSearchIn => 'Търсене в';

  @override
  String get channelDetailsSearchEmptyTitle => 'Търсене в този разговор';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Въведете текст, автор или филтър за съдържание, за да намерите съобщения.';

  @override
  String get channelDetailsSearchIndexingTitle => 'Съобщенията се индексират';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Опитайте отново скоро, след като търсенето завърши индексирането на този обхват.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Няма резултати';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Опитайте различни термини за търсене или филтри.';

  @override
  String get channelDetailsMembersOnline => 'Онлайн';

  @override
  String get channelDetailsMembersOffline => 'Офлайн';

  @override
  String get channelDetailsMemberYou => 'Ти';

  @override
  String get channelDetailsSearchUsersHint => 'Търсене на потребители';

  @override
  String get channelDetailsSearchUsersTypeToSearch =>
      'Въведете, за да търсите членове';

  @override
  String get channelDetailsSearchUsersEmpty => 'Няма намерени потребители';

  @override
  String get channelDetailsSearchUsersNoAvailable => 'Няма налични потребители';

  @override
  String get channelDetailsDone => 'Готово';

  @override
  String get channelDetailsHasFilterPrompt =>
      'Покажи съобщения, които съдържат:';

  @override
  String get channelDetailsRetry => 'Опитай отново';

  @override
  String get channelDetailsPinnedMessageTitle => 'Закачено съобщение';

  @override
  String get channelDetailsSearchResultTitle => 'Резултат от търсене';

  @override
  String get channelDetailsJumpToMessage => 'Към съобщението';

  @override
  String get channelDetailsUnpinMessage => 'Откачи съобщението';

  @override
  String get channelDetailsCopyMessageLink => 'Копирай линка към съобщението';

  @override
  String get channelDetailsCopyMessageId => 'Копирай ID на съобщението';

  @override
  String get channelDetailsMessageUnpinned => 'Съобщението е откачено';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Текуща общност';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'Текущо DM';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Всички общности';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild => 'Само всички DM';

  @override
  String get channelDetailsSearchScopeAllDms => 'Всички DM';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild => 'Само отворените DM';

  @override
  String get channelDetailsSearchScopeOpenDms => 'Отворени DM';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Всички DM + общности';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Отворени DM + общности';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Търсене само в текущата общност';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Търсене само в текущото DM';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'Във всички общности, в които участваш в момента';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Само във всички твои DM досега';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'Във всички твои DM досега';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'Във всички отворени директни съобщения само';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'Във всички отворени разговори с хора';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'Във всички лични чатове, в които някога си бил + всички общности, в които си в момента';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'Във всички отворени лични съобщения + всички общности, в които участваш';

  @override
  String get channelDetailsSearchSortNewest => 'Първо най-новите';

  @override
  String get channelDetailsSearchSortOldest => 'Първо най-старите';

  @override
  String get channelDetailsSearchSortRelevance => 'Най-подходящи';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Показване на най-новите съобщения първо';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Показване на най-старите съобщения първо';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Показване на най-подходящите съобщения първо';

  @override
  String get channelDetailsSearchContentImage => 'Качване на изображение';

  @override
  String get channelDetailsSearchContentVideo => 'Качване на видео';

  @override
  String get channelDetailsSearchContentAudio => 'Качване на аудио';

  @override
  String get channelDetailsSearchContentFile => 'Качване на файл';

  @override
  String get channelDetailsSearchContentLink => 'Линк';

  @override
  String get channelDetailsSearchContentEmbed =>
      'Визуализация на линк или вграден елемент';

  @override
  String get channelDetailsSearchContentSticker => 'Стикер';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Само качени изображения';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Само качени видеоклипове';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Само качени аудиофайлове';

  @override
  String get channelDetailsSearchContentFileDescription =>
      'Всеки качен прикачен файл';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'Въведен URL адрес в текста на съобщението';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Разпознати визуализации на линкове и вградени елементи, а не качени файлове';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Стикер, прикачен към съобщението';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count типа';
  }

  @override
  String get personalNotesTitle => 'Лични бележки';

  @override
  String get personalNotesSubtitle =>
      'Твоето лично пространство за мисли и напомняния';

  @override
  String groupDmWelcome(String displayName) {
    return 'Добре дошли в $displayName. Добавете приятели, за да стартирате групата.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Редактиране на групата';

  @override
  String get groupDmWelcomeAddFriends => 'Добавяне на приятели в групата';

  @override
  String get dmGroupInvites => 'Покани';

  @override
  String get groupDmEditTitle => 'Редактиране на групата';

  @override
  String get groupDmEditDetailsTooltip => 'Редактиране на данните за групата';

  @override
  String get groupDmGroupName => 'Име на групата';

  @override
  String get groupDmMyGroup => 'Моята група';

  @override
  String get groupDmGroupNameMaxLength =>
      'Името на групата не може да надвишава 100 знака';

  @override
  String get groupDmGroupIcon => 'Икона на групата';

  @override
  String get groupDmUploadIcon => 'Качване на икона';

  @override
  String get groupDmChangeIcon => 'Смяна на икона';

  @override
  String get groupDmRemoveIcon => 'Премахване на икона';

  @override
  String get groupDmUpdated => 'Групата е актуализирана';

  @override
  String get groupDmUpdateFailed =>
      'Не успях да обновя групата. Опитай отново.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Анимираните икони не се поддържат. Използвай статично изображение.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Анимираните икони не се поддържат';

  @override
  String get groupDmIconFileTooLargeTitle => 'Файлът с иконата е твърде голям';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'Иконата на файла е твърде голяма. Изберете файл, по-малък от $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'Неподдържан формат на иконата';

  @override
  String get groupDmUnsupportedIconFormatBody => 'Неподдържан тип файл.';

  @override
  String get groupDmCouldntProcessImage =>
      'Неуспешна обработка на изображението';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'Неуспешна обработка на изрязаното изображение. Опитай отново.';

  @override
  String get groupDmInvalidImage => 'Невалидно изображение';

  @override
  String get groupDmInvalidImageBody =>
      'Изображението е невалидно. Опитай друго.';

  @override
  String get groupDmAddFriends => 'Добавяне';

  @override
  String get groupDmOrSendInvite => 'или изпрати покана на приятел:';

  @override
  String get groupDmGenerateInviteLink => 'Генериране на линк за покана';

  @override
  String get groupDmCreateInvite => 'Създаване';

  @override
  String get groupDmInviteExpires24Hours => 'Поканата ти изтича след 24 часа';

  @override
  String get groupDmAddFriendFailed =>
      'Този приятел не можа да бъде добавен към групата. Опитай отново.';

  @override
  String get groupDmAddFailed => 'Неуспешно добавяне към групата';

  @override
  String get groupDmGroupFull =>
      'Тази група е пълна. Премахни някого, преди да добавиш още хора.';

  @override
  String get groupDmRateLimited =>
      'Действаш твърде бързо. Изчакай малко и опитай отново.';

  @override
  String get groupDmCreateInviteFailed =>
      'Неуспешно създаване на линк за покана';

  @override
  String get groupDmCreateInviteFailedBody =>
      'Не успяхме да генерираме линк за покана. Опитай отново.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'Не успяхме да създадем връзка за покана. Моля, опитайте отново.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'Нямате разрешение да създавате покана в този канал.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'Общността е достигнала лимита за покани.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'Създаването на покани за тази общност е временно забранено.';

  @override
  String get groupDmCopyInviteFailed => 'Неуспешно копиране на линка за покана';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Само собственикът на групата може да управлява покани.';

  @override
  String get groupDmNoInvitesCreated => 'Няма създадени покани';

  @override
  String get groupDmLoadingInvites => 'Зареждане на покани...';

  @override
  String get groupDmInvitesLoadFailed =>
      'Неуспешно зареждане на поканите. Опитай отново.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Да отмениш ли тази покана? Действието е необратимо.';

  @override
  String get groupDmInviteRevoked => 'Поканата е оттеглена';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Създадено от $name. Изтича след $time.';
  }

  @override
  String channelWelcomeHeading(String channelName) {
    return 'Добре дошли в $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'В началото нямаше нищо. След това се появи $channelName. И беше добре.';
  }

  @override
  String get personalNotesComposerHint => 'Изпрати съобщение на себе си';

  @override
  String channelComposerHint(String channelName) {
    return 'Съобщение в #$channelName';
  }

  @override
  String dmComposerHint(String recipientName) {
    return 'Съобщение до @$recipientName';
  }

  @override
  String groupDmNamedComposerHint(String groupName) {
    return 'Съобщение до $groupName';
  }

  @override
  String get groupDmComposerHint => 'Група съобщения';

  @override
  String get composerHint => 'Изпрати съобщение';

  @override
  String get composerOpenExpressionPicker => 'Отвори избор на емотикони';

  @override
  String get composerShowKeyboard => 'Покажи клавиатурата';

  @override
  String get composerCloseAttachmentPanel =>
      'Затвори селектора за прикачени файлове';

  @override
  String get chatAttachmentPanelPhotos => 'Снимки';

  @override
  String get chatAttachmentPanelFiles => 'Файлове';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Необходим е достъп до фотоалбума';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Разрешете достъп до фотоалбума, за да разглеждате и прикачвате скорошни снимки и видеоклипове.';

  @override
  String get chatAttachmentLibraryPermissionSettings =>
      'Отваряне на настройките';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', изпращане';

  @override
  String get messageAccessibilityFailedSuffix => ', не успя да се изпрати';

  @override
  String get messageAccessibilityAttachmentSummary => 'прикачен файл';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count прикачени файла';
  }

  @override
  String get messageAccessibilityImageSummary => 'изображение';

  @override
  String get messageAccessibilityVideoSummary => 'видео';

  @override
  String get messageAccessibilityAudioSummary => 'аудио файл';

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
      'прикачен файл със спойлер';

  @override
  String get messageAccessibilityEmbedSummary => 'вграждане';

  @override
  String get messageAccessibilityEmptySummary => 'съобщение';

  @override
  String get personalNotesPrivateSpace => 'Твоето лично пространство';

  @override
  String get purgePersonalNotes => 'Изчистване на личните бележки';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Това ще изтрие завинаги всяко съобщение и прикачен файл от личните ви бележки. Това действие не може да бъде отменено.';

  @override
  String get purgePersonalNotesConfirmButton => 'Изчистване';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Изтрити $count съобщения от лични бележки';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty => 'Личните бележки вече са празни';

  @override
  String get purgePersonalNotesFailed =>
      'Не успяхме да изчистим личните бележки';

  @override
  String get userSettingsGroupYourAccount => 'ВАШИЯТ ПРОФИЛ';

  @override
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => 'Търсене на настройки...';

  @override
  String get userSettingsSearchFieldLabel => 'Търсене в настройките';

  @override
  String get userSettingsSearchClear => 'Изчистване на търсенето';

  @override
  String get userSettingsSearchNoResults => 'Няма намерени настройки';

  @override
  String get userSettingsNavProfile => 'Профил';

  @override
  String get userSettingsNavSecurityLogin => 'Сигурност и влизане';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Подаръци';

  @override
  String get giftSettingsClaimAccountTitle => 'Заяви акаунта си';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Поискай акаунта си, за да осребриш или управляваш кодове за подаръци Plutonium.';

  @override
  String get giftSettingsRedeemTitle => 'Осребряване на подарък';

  @override
  String get giftSettingsRedeemDescription =>
      'Въведете код за подарък, за да осребрите Plutonium за вашия акаунт.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Въведи код за подарък…';

  @override
  String get giftSettingsRedeemButton => 'Осребряване';

  @override
  String get giftSettingsRedeemSuccess =>
      'Подаръкът е успешно осребрен. Насладете се на Plutonium.';

  @override
  String get giftSettingsPurchasedTitle => 'Закупени подаръци';

  @override
  String get giftSettingsPurchasedDescription =>
      'Управлявайте закупените си кодове за подарък Plutonium. Споделете URL адреса на подаръка с някого специален или го осребрете за себе си!';

  @override
  String get giftSettingsEmptyTitle => 'Все още няма подаръци';

  @override
  String get giftSettingsEmptyDescription =>
      'Купете Plutonium подарък от раздела Plutonium, за да го споделите с приятели.';

  @override
  String get giftSettingsGoToPlutonium => 'Отиди в Plutonium';

  @override
  String get giftSettingsLoadFailedTitle =>
      'Неуспешно зареждане на инвентара с подаръци';

  @override
  String get giftSettingsLoadFailedDescription => 'Опитай отново по-късно.';

  @override
  String get giftSettingsTryAgain => 'Опитай отново';

  @override
  String get giftSettingsGiftUrl => 'URL адрес на подаръка';

  @override
  String get giftSettingsCopy => 'Копирай';

  @override
  String get giftSettingsCopied => 'Копирано';

  @override
  String get giftSettingsGiftUrlCopied =>
      'URL адресът на подаръка е копиран в клипборда!';

  @override
  String get giftSettingsGiftUrlCopyFailed =>
      'Неуспешно копиране на URL адреса на подаръка';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Закупен $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Получено на $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Получено от $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'Този подарък е осребрен';

  @override
  String get giftSettingsRedeemForYourself => 'Осребри за себе си';

  @override
  String get giftSettingsShareWithFriend => 'Сподели с приятел';

  @override
  String get premiumPlutoniumTagline =>
      'Отключи по-високи лимити и ексклузивни функции, докато подкрепяш независима комуникационна платформа.';

  @override
  String get premiumPurchaseMode => 'Режим на покупка';

  @override
  String get premiumForMe => 'За мен';

  @override
  String get premiumAsAGift => 'Като подарък';

  @override
  String get premiumMonthly => 'Месечно';

  @override
  String get premiumYearly => 'Годишно';

  @override
  String get premiumPerMonth => 'на месец';

  @override
  String get premiumPerYear => 'на година';

  @override
  String get premiumOneTimePurchase => 'еднократна покупка';

  @override
  String get premiumSave17 => 'Спести 17%';

  @override
  String get premiumUpgradeNow => 'Надгради сега';

  @override
  String get premiumBuyGift => 'Купи подарък';

  @override
  String get premiumOneYearGift => 'Подарък за 1 година';

  @override
  String get premiumOneMonthGift => 'Подарък за 1 месец';

  @override
  String get premiumMostPopular => 'Най-популярно';

  @override
  String get premiumScrollPrompt =>
      'Превъртете надолу, за да видите всички предимства на Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'Безплатно срещу Plutonium';

  @override
  String get premiumFreeColumn => 'Безплатно';

  @override
  String get premiumGiftSectionTitle => 'Подарете Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'Сподели Plutonium изживяването с приятелите си, като закупиш подаръчен абонамент.';

  @override
  String get premiumGiftBannerOne =>
      'Имаш нов код за подарък, който те очаква!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'Имате $count нови кода за подаръци, които ви очакват!';
  }

  @override
  String get premiumViewGifts => 'Преглед на подаръците';

  @override
  String get premiumReadyToUpgrade => 'Готов ли си за надграждане?';

  @override
  String get premiumReadyToBuyGift => 'Готов ли си да купиш подарък?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Месечно $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Годишно $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 година $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 месец $price';
  }

  @override
  String get premiumManageSubscription => 'Управление на абонамента';

  @override
  String get premiumRedeemGiftCode => 'Осребряване на код за подарък';

  @override
  String get premiumGiftBadge => 'Подарък';

  @override
  String get premiumCancelSubscriptionTitle => 'Да откажеш ли абонамента?';

  @override
  String get premiumCancelSubscriptionBody =>
      'Запазваш предимствата си до следващата дата на подновяване, след което имаш 3-дневен гратисен период, за да се абонираш отново и да запазиш историята си като абонат.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Отказ от абонамент';

  @override
  String get premiumKeepSubscription => 'Запазване на абонамента';

  @override
  String get premiumPurchaseHistoryTitle => 'История на покупките';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Вашите скорошни фактури. За да промените начина на плащане на абонамента си, добавете или изберете такъв в портала за фактуриране и го направете основен.';

  @override
  String get premiumManagePaymentMethods => 'Управление на методите за плащане';

  @override
  String get premiumBillingHistory => 'История на плащанията';

  @override
  String get premiumSelfServeRefundTitle =>
      'Възстановяване на средства от самообслужване';

  @override
  String get premiumSelfServeRefundButton =>
      'Възстановяване на последната покупка';

  @override
  String get premiumDisclaimerAgreementPrefix =>
      'С покупката се съгласявате с нашите ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'С покупката се съгласихте с нашите ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' и ';

  @override
  String premiumActiveUntil(String date) {
    return 'Активно до $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Анулиране';

  @override
  String premiumCancelsOn(String date) {
    return 'Анулиране на $date. Предимствата остават активни дотогава.';
  }

  @override
  String get premiumReactivateSubscription => 'Активиране отново';

  @override
  String premiumGiftedUntil(String date) {
    return 'Подарено до $date. Не се подновява автоматично.';
  }

  @override
  String get premiumComparisonFeatureColumn => 'Функция';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'С покупката прие нашите $terms и $privacy.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Възстановяване на суми със самообслужване до 3 дни след плащането, веднъж на всеки 30 дни. Възстановяването на сумата за абонамент го анулира. Купувачите от ЕС/ЕИП се отказват от 14-дневното право на отказ при плащането, за да получат незабавен достъп до съдържанието. Използвай бутона за възстановяване в приложението вместо оспорване на трансакция. Оспорванията могат трайно да ограничат акаунта ти. Stripe обработва плащането сигурно. Никога не виждаме пълния номер на картата ти.';

  @override
  String get premiumTermsOfService => 'Общи условия';

  @override
  String get premiumPrivacyPolicy => 'Политика за поверителност';

  @override
  String get premiumCheckoutStartFailedTitle =>
      'Неуспешно стартиране на плащането';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Нещо се обърка при стартирането на плащането. Опитай отново след малко.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'В момента ползваш абонамент подарък. Той няма да се поднови. Можеш да осребриш още кодове за подарък, за да го удължиш. Можеш да започнеш редовен абонамент, след като подареното време изтече.';

  @override
  String get premiumPlanUnavailable =>
      'Този план не е наличен. Свържи се с поддръжката.';

  @override
  String get premiumCompletePaymentTitle => 'Завършване на плащането';

  @override
  String get premiumCompletePaymentBody =>
      'Сега ще бъдете пренасочени към Stripe, за да завършите плащането. Върнете се във Fluxer, след като сте готови.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Избери начин на плащане';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Платете с Pix автоматично, за да разрешите повтарящи се такси директно от вашата бразилска банка. Или изберете използване на карта, за да въведете кредитна карта на следващия екран на Stripe.';

  @override
  String get premiumUsePix => 'Използвай Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Платете с UPI, за да настроите съвместим с RBI електронен мандат от вашата индийска банка. Или изберете „Използване на карта“, за да въведете кредитна карта на следващия екран на Stripe.';

  @override
  String get premiumUseUpi => 'Използвай UPI';

  @override
  String get premiumUseCard => 'Използвай карта';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Неуспешно отваряне на портала за плащане';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Нещо се обърка при отварянето на портала за таксуване. Опитай отново след малко.';

  @override
  String get premiumAlreadyVisionaryTitle => 'Вече си Визионер';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Визионер вече включва постоянен достъп, така че не е необходим абонамент с периодично плащане. Все още можеш да купуваш подаръци за други.';

  @override
  String get premiumExistingSubscriptionTitle => 'Вече имаш абонамент';

  @override
  String get premiumExistingSubscriptionBody =>
      'Открихме съществуващ абонамент за Fluxer Plutonium за този акаунт. Управлявайте го в защитения портал за плащания, за да актуализирате данните за плащане или да проверите статуса на подновяване. Ако току-що сте платили, изчакайте минута и отворете отново тази страница.';

  @override
  String get premiumPurchasesDisabledTitle => 'Покупките не са достъпни';

  @override
  String get premiumPurchasesDisabledBody =>
      'Покупки са деактивирани за този акаунт. Свържете се с support@fluxer.app, ако смятате, че това е грешка.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Поискай акаунта си, за да закупиш Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Трябва да потвърдите имейла си, преди да можете да закупите Fluxer Plutonium.';

  @override
  String get premiumPerkCustomUsernameTag =>
      'Персонализиран таг за потребителско име';

  @override
  String get premiumPerkPerCommunityProfiles => 'Профили за всяка общност';

  @override
  String get premiumPerkMessageScheduling => 'Планиране на съобщения';

  @override
  String get premiumPerkProfileBadge => 'Значка на профил';

  @override
  String get premiumPerkCustomVideoBackgrounds =>
      'Персонализирани фонове за видео';

  @override
  String get premiumPerkEntranceSounds => 'Звуци при влизане';

  @override
  String get premiumPerkCommunities => 'Общности';

  @override
  String get premiumPerkMessageCharacterLimit =>
      'Лимит на знаците в съобщението';

  @override
  String get premiumPerkBookmarkedMessages => 'Съобщения в отметки';

  @override
  String get premiumPerkFileUploadSize => 'Размер на качваните файлове';

  @override
  String get premiumPerkEmojiStickerPacks => 'Емотикони и пакети стикери';

  @override
  String get premiumPerkSavedMedia => 'Запазени медии';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Използване на анимирани емоджита';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Достъп до глобални емоджита и стикери';

  @override
  String get premiumPerkVideoQuality => 'Качество на видеото';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Анимирани аватари и банери на профили';

  @override
  String get premiumPerkEarlyAccess => 'Ранен достъп до нови функции';

  @override
  String get premiumPerkCustomThemes => 'Персонализирани теми';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'До 4K/60fps';

  @override
  String storePlutoniumPriceLine(String monthly, String yearly) {
    return '$monthly or $yearly';
  }

  @override
  String get storePlutoniumMonthSuffix => '/mo';

  @override
  String get storePlutoniumYearSuffix => '/yr';

  @override
  String get storePlutoniumPriceOr => 'or';

  @override
  String get storePlutoniumEmojiTitle => 'Your emojis, everywhere';

  @override
  String get storePlutoniumEmojiBody =>
      'Bring custom emojis and stickers from any of your communities into every chat and community you\'re in.';

  @override
  String get storePlutoniumProfileTitle => 'A profile that stands out';

  @override
  String get storePlutoniumProfileBody =>
      'Get an animated avatar and banner, a subscriber badge, the four-digit tag you want after your username*, and a separate profile for each community.';

  @override
  String get storePlutoniumFilesTitle => 'Send files up to 500 MB';

  @override
  String get storePlutoniumFilesBody =>
      'Share full-length videos and big files without shrinking them first. Free accounts can send up to 25 MB.';

  @override
  String get storePlutoniumCompareTitle => 'Compare Free and Plutonium';

  @override
  String get storePlutoniumCompareMobileNote =>
      'Not all of these features are in the mobile app. Some are only available on desktop.';

  @override
  String get storePlutoniumNotAvailable => 'Not available';

  @override
  String get storePlutoniumAvailable => 'Available';

  @override
  String get storePlutoniumCompareTag =>
      'Pick the 4-digit number after your username*';

  @override
  String get storePlutoniumCompareProfile =>
      'A separate profile for each community';

  @override
  String get storePlutoniumCompareBadge => 'Subscriber badge on your profile';

  @override
  String get storePlutoniumCompareBackgrounds =>
      'Video call backgrounds you can save';

  @override
  String get storePlutoniumCompareCommunities => 'Communities you can join';

  @override
  String get storePlutoniumCompareCharacters =>
      'Characters in a single message';

  @override
  String get storePlutoniumCompareBookmarks => 'Messages you can bookmark';

  @override
  String get storePlutoniumCompareUpload => 'Largest file you can upload';

  @override
  String get storePlutoniumCompareSavedMedia =>
      'Media items you can save for later';

  @override
  String get storePlutoniumCompareAnimatedEmoji =>
      'Use animated emojis in messages';

  @override
  String get storePlutoniumCompareCustomEmoji =>
      'Use custom emojis and stickers in any community';

  @override
  String get storePlutoniumCompareVideo =>
      'Video call and screen share quality';

  @override
  String get storePlutoniumCompareAvatar =>
      'Animated avatar and profile banner';

  @override
  String get storePlutoniumCompareEarlyAccess => 'Early access to new features';

  @override
  String get storePlutoniumCompareThemes => 'Custom themes for the app';

  @override
  String get storePlutoniumVideoFree => 'Up to 720p at 30 FPS';

  @override
  String get storePlutoniumVideoPlutonium => 'Up to 4K at 60 FPS';

  @override
  String get storePlutoniumTagFootnote =>
      'You can only pick a tag that nobody else with the same username already has. Usernames aren\'t case sensitive, so Mina#4821 and mina#4821 count as the same. The #0000 tag is reserved for Fluxer Visionary members.';

  @override
  String get storePlutoniumLearnVisionary => 'Learn more about Visionary.';

  @override
  String get storePlutoniumDonatePrompt =>
      'Just want to support Fluxer\'s open source development? ';

  @override
  String get storePlutoniumDonateLink => 'Donate instead.';

  @override
  String get storePlutoniumHighlightsLead =>
      'Subscribing funds Fluxer and unlocks';

  @override
  String get storePlutoniumHighlightEmoji =>
      'Custom emoji and stickers in any chat';

  @override
  String get storePlutoniumHighlightProfile =>
      'Animated profile, badge, and custom 4-digit number';

  @override
  String get storePlutoniumHighlightFiles => 'Uploads up to 500 MB';

  @override
  String get storePlutoniumHighlightMessages =>
      'Send messages up to 4,000 characters';

  @override
  String get storePlutoniumHighlightCommunityProfile =>
      'A separate profile for each community';

  @override
  String get storePlutoniumHighlightsMore => 'And more';

  @override
  String get storePlutoniumRenewsThroughPlay =>
      'Renews automatically through Google Play until you cancel.';

  @override
  String get storePlutoniumRenewsThroughAppStore =>
      'Renews automatically through the App Store until you cancel.';

  @override
  String get storePlutoniumAlreadySubscribed =>
      'You already have a Fluxer Plutonium subscription.';

  @override
  String storePlutoniumSavePercent(int percent) {
    return 'Save $percent%';
  }

  @override
  String get storePlutoniumWaiting =>
      'Purchase received. Plutonium will show here once it activates.';

  @override
  String get storePlutoniumUnavailable =>
      'Subscriptions in the app aren\'t available on this device yet.';

  @override
  String get storePlutoniumVisionaryStatus =>
      'Visionary already includes permanent access, so a recurring subscription isn\'t needed.';

  @override
  String get userSettingsNavPrivacyDashboard => 'Табло за поверителност';

  @override
  String get userSettingsNavAuthorizedApps => 'Оторизирани приложения';

  @override
  String get userSettingsNavBlockedUsers => 'Блокирани потребители';

  @override
  String get userSettingsNavLinkedDevices => 'Свързани устройства';

  @override
  String get userSettingsNavConnections => 'Връзки';

  @override
  String get userSettingsNavLookAndFeel => 'Визия и усещане';

  @override
  String get userSettingsNavAccessibility => 'Достъпност';

  @override
  String get userSettingsNavChat => 'Чат';

  @override
  String get userSettingsNavAudioAndVideo => 'Аудио и видео';

  @override
  String get userSettingsNavShortcuts => 'Клавишни комбинации';

  @override
  String get audioAndVideoAudioSectionTitle => 'Аудио';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'Настройте микрофона, високоговорителите и обработката на гласа си.';

  @override
  String get audioAndVideoVideoSectionTitle => 'Видео';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'Настройте качеството на вашата камера и споделяне на екрана.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle =>
      'Поведение по време на разговор';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Контролирайте подканите за потвърждение по време на гласови и видео разговори.';

  @override
  String get audioAndVideoInputDeviceLabel => 'Входно устройство';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Изходно устройство';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'По подразбиране';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Използвай високоговорител';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'Когато е изключено, аудиото се възпроизвежда през слушалката или свързаните слушалки.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Сила на входния звук';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Сила на изходния звук';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Обработка на глас';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Фокусиран глас';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Препоръчително. Изчиства звука от микрофона ти за ясна реч.';

  @override
  String get audioAndVideoDirectInputLabel => 'Директен вход';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Изпраща звука ти без промени. Най-добре е, ако използваш външен аудио софтуер.';

  @override
  String get audioAndVideoCustomProfileLabel => 'По избор';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Настрой всяка опция ръчно: потискане на шума, потискане на ехото и усилване.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Потискане на шума';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Подобрено';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Стандартен';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Няма';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Потискане на ехото';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Автоматичен контрол на усилването';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Изравнява силата на звука на микрофона ви. Изключено, когато е включено подобрено потискане.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Тест на микрофон';

  @override
  String get audioAndVideoMicTestStartLabel =>
      'Стартиране на тест на микрофона';

  @override
  String get audioAndVideoMicTestStopLabel => 'Спиране на теста на микрофона';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '$productName се нуждае от достъп до микрофона, за да тества вашия вход.';
  }

  @override
  String get audioAndVideoCameraLabel => 'Камера';

  @override
  String get audioAndVideoMirrorCameraLabel =>
      'Огледално изображение на камерата';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'Качество на камерата';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'Качество на споделяне на екрана';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Кадрова честота';

  @override
  String get audioAndVideoFrameRate15Label => '15 кадъра/сек';

  @override
  String get audioAndVideoFrameRate30Label => '30 кадъра/сек';

  @override
  String get audioAndVideoFrameRate60Label => '60 кадъра в секунда';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080p и 60 FPS изискват $premiumProductName.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Тази инстанция в момента позволява споделяне на екран до 720p при 30 FPS.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return '$productName се нуждае от достъп до микрофона, за да покаже списък с устройствата ти.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return '$productName се нуждае от достъп до камерата, за да покаже списък с устройствата ти.';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'Не питай, когато скривам камерата си';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'Не питай, когато скривам споделянето на екрана си';

  @override
  String get userSettingsNavNotifications => 'Известия';

  @override
  String get notificationsGeneralSectionTitle => 'Общи';

  @override
  String get notificationsEnableNotificationsLabel => 'Включване на известията';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Получавай известия, когато получаваш съобщения. Може да се наложи да разрешиш известията за $productName в настройките на устройството си. За настройки за отделен канал или общност отвори настройките за известия от менюто на общността.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Включване на известия на работния плот';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Използва центъра за известия на операционната система. За настройки за отделен канал или общност щракни с десния бутон върху иконата на общността и отвори настройките за известия.';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'Включване на известия в браузъра';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'Получавай известия, когато получаваш съобщения. Може да се наложи да разрешиш известията в настройките на браузъра си. За настройки за отделен канал или общност щракни с десния бутон върху иконата на общността и отвори настройките за известия.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Време на неактивност преди push известия';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName избягва да изпраща push известия до мобилните ти устройства, докато си пред компютъра. Избери колко време трябва да си неактивен на компютъра, преди да получаваш push известия.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute минута';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes минути';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle =>
      'Предпочитания за споменаване';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Предпочитания за споменаване при отговор';

  @override
  String get notificationsMentionNoPreferenceName => 'Без предпочитания';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Зачитане на намерението на подателя, без предупреждение при включване/изключване на споменаването с @';

  @override
  String get notificationsMentionPreferMentionName =>
      'Предпочитам @споменаване';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'По подразбиране отговорите те @споменават, а изпращачът получава предупреждение, ако изключи споменаването';

  @override
  String get notificationsMentionPreferNoMentionName =>
      'Предпочитам без @споменаване';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'По подразбиране отговорите пропускат @споменаването, а изпращачът получава предупреждение, ако го включи';

  @override
  String get notificationsTtsSectionTitle => 'Известия с текст към говор';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'Включване на възпроизвеждането на говор с /tts';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'Нека /tts прочете съобщението ти на глас. Изключването на настройката запазва тези команди като обикновен текст.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Регулирайте скоростта на възпроизвеждане в ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Достъпност';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle =>
      'Автоматично четене на съобщения';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Преобразува входящото съдържание в говор, независимо дали идва от /tts.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Всеки канал';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Всяко входящо съобщение да се произнася, независимо кой канал е отворен.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Само в активния канал';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Чете само канала, който гледаш. Четенето те следва между каналите.';

  @override
  String get notificationsTtsModeNeverName => 'Никога автоматично';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Не чете нищо, освен ако някой не пусне /tts ръчно.';

  @override
  String get notificationsTtsModeAriaLabel =>
      'Прочитане на всички съобщения на глас';

  @override
  String get notificationsSoundsSectionTitle => 'Звуци';

  @override
  String get notificationsMasterVolumeLabel => 'Обща сила на звука';

  @override
  String get notificationsMasterVolumeDescription =>
      'Задава нивото на всеки звуков ефект. Настройките за отделни звуци игнорират това.';

  @override
  String get notificationsResetToDefaultVolume =>
      'Възстановяване на силата на звука по подразбиране';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Изключване на всички звуци за известия';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Съществуващите ти настройки за звук на известията ще бъдат запазени.';

  @override
  String get notificationsShowMoreSoundEffects =>
      'Покажи повече звукови ефекти';

  @override
  String get notificationsShowFewerSoundEffects =>
      'Покажи по-малко звукови ефекти';

  @override
  String get notificationsPreviewSound => 'Преглед на звука';

  @override
  String get notificationsPerSoundVolumeTitle =>
      'Сила на звука за отделни звуци';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Задай персонализирана сила на звука за отделни звуци. Звуците без персонализирана настройка следват общата сила на звука.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Активни персонализирани настройки за силата на звука: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Следване на основния • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'Нулиране на $label до общата сила на звука';
  }

  @override
  String get notificationsResetAllOverrides =>
      'Нулиране на всички персонализирани настройки';

  @override
  String notificationsMuteSound(String label) {
    return 'Изключване на звука за $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'Включване на звука за $label';
  }

  @override
  String get notificationsSoundMessage => 'Известия за съобщения в общности';

  @override
  String get notificationsSoundDirectMessage =>
      'Известия за директни съобщения';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Известия за съобщения от текущия канал';

  @override
  String get notificationsSoundMute => 'Изключване на микрофона в гласов чат';

  @override
  String get notificationsSoundUnmute => 'Включване на микрофона в гласов чат';

  @override
  String get notificationsSoundDeaf => 'Изключване на звука в гласов чат';

  @override
  String get notificationsSoundUndeaf => 'Включване на звука в гласов чат';

  @override
  String get notificationsSoundUserJoin =>
      'Потребител се присъединява към канала';

  @override
  String get notificationsSoundUserLeave => 'Потребител напуска канала';

  @override
  String get notificationsSoundUserMove => 'Потребителят премести канала';

  @override
  String get notificationsSoundViewerJoin =>
      'Зрител се присъединява към потока';

  @override
  String get notificationsSoundViewerLeave => 'Зрител напуска потока';

  @override
  String get notificationsSoundVoiceDisconnect =>
      'Гласовата връзка е прекъсната';

  @override
  String get notificationsSoundIncomingRing => 'Входящо повикване';

  @override
  String get notificationsSoundCameraOn => 'Камерата е включена';

  @override
  String get notificationsSoundCameraOff => 'Камерата е изключена';

  @override
  String get notificationsSoundScreenShareStart =>
      'Споделянето на екрана започва';

  @override
  String get notificationsSoundScreenShareStop => 'Споделянето на екрана спира';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'Не успяхме да актуализираме времето за изчакване на push известията. Опитайте отново.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Не успях да актуализирам предпочитанията за споменаване. Опитайте отново.';

  @override
  String get notificationsPermissionDeniedTitle => 'Известията са блокирани';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'Не успяхме да активираме известията. Разрешете разрешения за известия, за да продължите.';

  @override
  String get notificationsPushRelaySectionTitle =>
      'Препредаване на push известия';

  @override
  String notificationsPushRelaySectionDescription(String pushProvider) {
    return '$pushProvider доставя push известия само през собствената си услуга, затова известията за това устройство минават през препредаването на Fluxer.';
  }

  @override
  String get notificationsPushRelayConsentLabel =>
      'Използване на push препредаването на Fluxer';

  @override
  String get notificationsPushRelayConsentDescription =>
      'Изключването премахва push регистрацията на това устройство и то спира да получава push известия.';

  @override
  String get pushRelayConsentTitle => 'Препредаване на push известия';

  @override
  String pushRelayConsentDescription(String pushProvider) {
    return '$pushProvider доставя push известия само през собствената си услуга, затова известията за това устройство минават през препредаването на Fluxer.';
  }

  @override
  String get pushRelayConsentNoticePrefix => 'Приемете ';

  @override
  String get pushRelayConsentNoticeLink =>
      'декларацията за поверителност на push препредаването';

  @override
  String get pushRelayConsentNoticeSuffix =>
      ', за да включите push известията на това устройство. Приемането е нужно само веднъж на устройство.';

  @override
  String get pushRelayConsentAgree => 'Приемам и продължавам';

  @override
  String get pushRelayConsentDecline => 'Не сега';

  @override
  String get userSettingsNavLanguageAndTime => 'Език и време';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Език на интерфейса';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Изберете езика, който ще се използва в цялото приложение';

  @override
  String get languageAndTimeOpenLanguageSettings =>
      'Отвори настройките за език';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Формат на часа';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Избери как да се показват часовете в приложението';

  @override
  String get languageAndTimeTimeFormatSelectionLabel =>
      'Избор на формат за час';

  @override
  String get languageAndTimeTimeFormatAuto => 'Автоматично';

  @override
  String get languageAndTimeTimeFormat12Hour => '12-часов';

  @override
  String get languageAndTimeTimeFormat24Hour => '24-часов';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'Час според езика на приложението: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Час според настройките на системата: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Използване на езиковите настройки на системата за формат на часа';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'Неуспешно обновяване на формата за час';

  @override
  String get userSettingsNavDefaultApps => 'Приложения по подразбиране';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Уеб браузър';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Изберете кой браузър да се отваря, когато докоснете връзка.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'Ако дадено приложение е инсталирано за даден сайт, връзките ще се отварят първо в него.';

  @override
  String get defaultAppsWebBrowserInApp => 'Вграден браузър';

  @override
  String get defaultAppsWebBrowserExternal => 'Външен браузър';

  @override
  String get userSettingsNavAppIcon => 'App icon';

  @override
  String get appIconSectionTitle => 'App icon';

  @override
  String get appIconSectionDescription =>
      'Choose which icon appears on your home screen.';

  @override
  String get appIconOptionDefault => 'По подразбиране';

  @override
  String get appIconOptionStarfield => 'Starfield';

  @override
  String get appIconOptionSweden => 'Швеция';

  @override
  String get appIconUnsupported =>
      'Changing the app icon is not available on this device.';

  @override
  String get userSettingsNavAdvanced => 'Разширени';

  @override
  String get advancedPerformanceReportingTitle =>
      'Докладване на производителността';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'Помогнете за подобряването на $productName, като споделяте анонимни данни за сривове и производителност.';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'Изпращане на отчети за сривове и производителност';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'Всички докладвани данни са анонимни и се изпращат само до собствената услуга за наблюдение на $productName — не се използват доставчици на трети страни.';
  }

  @override
  String get advancedSettingsConfigure => 'Конфигуриране';

  @override
  String get advancedSettingsCategoryPrivacy => 'Поверителност';

  @override
  String get advancedSettingsCategoryAppearance => 'Външен вид';

  @override
  String get advancedSettingsCategoryAccessibility => 'Достъпност';

  @override
  String get advancedSettingsCategoryChat => 'Чат';

  @override
  String get advancedSettingsCategoryMedia => 'Медия';

  @override
  String get advancedSettingsCategoryVoice => 'Глас';

  @override
  String get advancedSettingsCategoryDeveloper => 'Разработчик';

  @override
  String get advancedSettingEnableTextSelectionLabel =>
      'Разрешаване на избиране на текст';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Позволява избиране на текст в приложението';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Активиране на миниатюри при превъртане на видео';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Миниатюра или кадър на живо при превъртане на видео';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Хаптична обратна връзка';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Вибрационна обратна връзка при докосване и действия. Няма да се синхронизира между устройствата.';

  @override
  String get advancedSettingShowNekoLabel => 'Показване на Неко';

  @override
  String get advancedSettingShowNekoDescription =>
      'Котето Неко, което гони курсора ти';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Покажи Неко в полето за въвеждане на чат';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Анимация при мащабиране при стартиране';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Намали мащаба на логото при излизане от началния екран';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Подсказки за клавиатурата';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Показване на клавишните комбинации в подсказките';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Включване на любими';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Показвай любимите навсякъде в приложението';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Поведение при присъединяване към гласов канал';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Потвърждение или двойно щракване при присъединяване към гласов канал в общност';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Изискване на двойно щракване за присъединяване към гласови канали';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Потвърждаване преди присъединяване към гласови канали';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Автоматично изпращане на GIF файлове при избиране';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Автоматично изпращане на GIF файлове от селектора без потвърждение';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Запазване на любими GIF файлове като запазени медии';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Избери как да се съхраняват любимите GIF файлове';

  @override
  String get advancedSettingMediaButtonsLabel => 'Медийни бутони';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Персонализиране на бутоните и индикаторите върху прикачените файлове и вградените елементи';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Качване на прикачените файлове преди изпращане';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Качването на прикачените файлове започва веднага след добавянето им в полето за съобщение';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Премахване на параметри за проследяване от URL адреси';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Автоматично премахване на параметри за проследяване от URL адресите в съобщенията, които изпращаш';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'Доверяване на всички външни линкове';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'Пропускане на предупреждението за външни линкове за всички домейни';

  @override
  String get advancedSettingSearchEnginesLabel => 'Търсачки';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Конфигуриране на търсачките, които се използват за избрания текст';

  @override
  String get advancedSettingTranslatorsLabel => 'Преводачи';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Конфигуриране на услугите за превод, използвани за избрания текст';

  @override
  String get advancedSettingReverseImageSearchLabel => 'Търсене по изображение';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Доставчици за търсене по изображение';

  @override
  String get advancedSettingMessageActionBarLabel =>
      'Лента с действия за съобщения';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Персонализиране на лентата с действия, която се показва при задържане на курсора върху съобщения';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Автоматично довършване на изрази';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Избери какво се показва, когато напишеш двоеточие в полето за съобщение';

  @override
  String get advancedSettingInputButtonsLabel =>
      'Бутони за въвеждане на съобщения';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Избери кои бутони да се показват в полето за съобщения';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Превъртане до долу при изпращане на съобщение';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Избери какво да се случва с чата, след като изпратиш съобщение';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Пропускане на потвърждението за „Маркирай всички като прочетени“';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Маркира веднага всички непрочетени канали във входящите като прочетени, без да пита за потвърждение';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Скрий заглушените канали по подразбиране';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Скриване на заглушени канали от страничните ленти на общностите';

  @override
  String get advancedSettingShowGifIndicatorLabel =>
      'Показване на индикатор за GIF';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Показване на индикатор за изтичане на прикачен файл';

  @override
  String get advancedSettingShowMediaDeleteLabel =>
      'Показване на бутон за изтриване';

  @override
  String get advancedSettingShowMediaDownloadLabel =>
      'Показване на бутон за изтегляне';

  @override
  String get advancedSettingShowMediaFavoriteLabel =>
      'Показване на бутон „Любими“';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Показване на бутон за потискане на вградени елементи';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Показване на лентата с действия за съобщения';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel =>
      'Показване само на бутона \"Още\"';

  @override
  String get advancedSettingShowQuickReactionsLabel =>
      'Показване на бързи реакции';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Разгъване при натискане на Shift';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Показване на стандартни емоджита в автоматичното довършване на изрази';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Показване на персонализирани емоджита в автоматичното довършване на изрази';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Показване на стикери в автоматичното довършване на изрази';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Показване на запазена медия в автоматичното довършване на изрази';

  @override
  String get advancedSettingShowGifsButtonLabel =>
      'Показване на бутона за GIF файлове';

  @override
  String get advancedSettingShowMediaButtonLabel =>
      'Показване на бутона за медия';

  @override
  String get advancedSettingShowStickersButtonLabel =>
      'Показване на бутона за стикери';

  @override
  String get advancedSettingShowEmojiButtonLabel =>
      'Показване на бутона за емоджита';

  @override
  String get advancedSettingShowSendButtonLabel =>
      'Показване на бутона за изпращане';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Показване на известия за нови устройства';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Показване на подкана при нови аудиоустройства';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Управление на силата на звука по връзки';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Показване на плъзгачи за силата на звука на участниците за всяко устройство в гласовите менюта';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Поведение при предварителен преглед на споделянето на екрана';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Преглед, изскачащ прозорец и поведение на миниатюрите на стрийма';

  @override
  String get advancedSettingScreenShareCodecLabel =>
      'Кодек за споделяне на екран';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Видеокодек за споделяне на екрана';

  @override
  String get advancedSettingScreenShareCodecAuto =>
      'Автоматично (препоръчително)';

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
      'Пауза на прегледа на споделения от мен екран във фонов режим';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Скрий миниатюрата за предварителен преглед на моя поток';

  @override
  String get advancedSettingDeveloperModeLabel =>
      'Включване на режим за разработчици';

  @override
  String get advancedSettingDeveloperModeDescription =>
      'Включване на режим за разработчици';

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
  String get advancedSettingTranslatorGoogle => 'Превод от Google';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel =>
      'Търсачка по подразбиране';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Избери коя търсачка да се използва по подразбиране при търсене на избран текст.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel => 'Вградени търсачки';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Активирай или деактивирай вградените търсачки. Активираните търсачки се показват в контекстното меню на съобщението, когато е избран текст.';

  @override
  String get advancedSettingCustomSearchEnginesLabel =>
      'Персонализирани търсачки';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Добавете собствени търсачки с персонализиран URL шаблон. Използвайте „$query“ като заместител на текста за търсене.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Добавяне на търсачка';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Активирай поне една търсачка по-долу.';

  @override
  String get advancedSettingRemoveSearchEngineLabel => 'Премахване на търсачка';

  @override
  String get advancedSettingDefaultTranslatorLabel =>
      'Преводач по подразбиране';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Избери кой преводач да се използва по подразбиране при превод на избран текст.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Вградени преводачи';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Активирай или деактивирай вградените преводачи. Активираните преводачи се показват в контекстното меню на съобщението, когато е избран текст.';

  @override
  String get advancedSettingCustomTranslatorsLabel =>
      'Персонализирани преводачи';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Добавете свои собствени преводачи с персонализиран URL шаблон. Използвайте \'$query\' като заместител на текста за превод.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Добавяне на преводач';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Активирай поне един преводач по-долу.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Премахване на преводача';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Търсене по изображение по подразбиране';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Избери коя услуга за обратно търсене на изображения да се използва по подразбиране, когато търсиш изображение.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Вградено търсене по изображение';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Активирай или деактивирай вградените доставчици за обратно търсене на изображения. Активираните доставчици се показват в контекстното меню на изображения, аватари, банери, стикери и емоджита.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Персонализирано търсене по изображение';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Добавете свои собствени доставчици за търсене по изображение с персонализиран шаблон за URL адрес. Използвайте \'$url\' като заместител на URL адреса на изображението.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Добавяне на търсене по изображение';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Активирай поне един доставчик на обратно търсене на изображения по-долу.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Премахване на обратно търсене на изображения';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Добавяне на търсачка';

  @override
  String get advancedSettingEditSearchEngineTitle => 'Редактиране на търсачка';

  @override
  String get advancedSettingAddTranslatorTitle =>
      'Добавяне на доставчик на преводи';

  @override
  String get advancedSettingEditTranslatorTitle =>
      'Редактиране на доставчик на преводи';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Добавяне на търсачка по изображение';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Редактиране на търсачка по изображение';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Име';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'URL шаблон';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'Моята търсачка';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Моят преводач';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'Моето търсене по изображение';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Използвайте \'$query\', където трябва да се постави текстът за търсене.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Използвайте „$query“, където трябва да се постави текстът за превод.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Използвайте \'$url\', където трябва да се постави URL адресът на изображението.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired =>
      'Името е задължително.';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'Изисква се URL шаблон.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'URL шаблонът трябва да съдържа плейсхолдъра „$query“.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'URL шаблонът трябва да съдържа плейсхолдър \"$url\".';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'URL шаблонът трябва да е валиден URL адрес.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Добавяне';

  @override
  String get advancedSettingEditSearchProviderAction => 'Редактиране';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Премахване';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'Сигурни ли сте, че искате да премахнете $engineName?';
  }

  @override
  String get userSettingsNavApplications => 'Приложения';

  @override
  String get userSettingsNavAppLogs => 'Дневници на приложението';

  @override
  String get userSettingsNavDeveloperTools => 'Инструменти за разработчици';

  @override
  String get userSettingsNavLimitsConfig => 'Конфигурация на лимити';

  @override
  String get userSettingsNavFeatureFlags => 'Знамена на функции';

  @override
  String get userSettingsNavWhatsNew => 'Какво ново';

  @override
  String get userSettingsJoinFluxerLabs => 'Присъединете се към Fluxer Labs';

  @override
  String get userSettingsNavAppLicenses => 'Лицензи на приложения';

  @override
  String get userSettingsAppLicensesDescription =>
      'Софтуер с отворен код, използван от това приложение. Това приложение е изградено с Flutter.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'Не успяхме да заредим лицензите за приложенията.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count лиценза',
      one: '1 лиценз',
    );
    return '$_temp0';
  }

  @override
  String get userSettingsNavLogOut => 'Изход';

  @override
  String get userSettingsLogOutConfirmTitle => 'Да излезеш ли?';

  @override
  String get userSettingsLogOutConfirmDescription =>
      'Можеш да влезеш отново по всяко време.';

  @override
  String get quickSwitcherTabSearch => 'Търсене';

  @override
  String get quickSwitcherTabFriends => 'Приятели';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Търсене на канали, хора или общности';

  @override
  String get quickSwitcherSearchFriends => 'Търсене на приятели';

  @override
  String get quickSwitcherNoMatchesFound => 'Няма намерени съвпадения';

  @override
  String get quickSwitcherEmptyHint =>
      'Опитай с друго име или използвай префиксите @ / # / ! / *, за да филтрираш резултатите.';

  @override
  String get quickSwitcherSectionPeople => 'Хора';

  @override
  String get quickSwitcherSectionGroupMessages => 'Съобщения от групи';

  @override
  String get quickSwitcherSectionTextChannels => 'Текстови канали';

  @override
  String get quickSwitcherSectionThreads => 'Threads';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Гласови канали';

  @override
  String get quickSwitcherSectionCommunities => 'Общности';

  @override
  String get quickSwitcherSectionSettings => 'Настройки';

  @override
  String get quickSwitcherHomeLabel => 'Начало';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Директни съобщения';

  @override
  String get quickSwitcherFavoritesLabel => 'Любими';

  @override
  String get quickSwitcherUserSettingsLabel => 'Потребителски настройки';

  @override
  String get quickSwitcherNotificationsLabel => 'Известия';

  @override
  String get quickSwitcherBookmarksLabel => 'Отметки';

  @override
  String get savedMessagesEmptyTitle => 'Няма отметки';

  @override
  String get savedMessagesEmptyBody =>
      'Добавяй съобщения в отметки, за да ги запазиш за по-късно.';

  @override
  String get savedMessagesEndBody => 'Няма какво друго да видите тук.';

  @override
  String get savedMessagesRemoveTooltip => 'Премахване на отметката';

  @override
  String get savedMessagesAddedToast => 'Добавено към отметки';

  @override
  String get savedMessagesRemovedToast => 'Премахнато от отметки';

  @override
  String get quickSwitcherMentionsLabel => 'Споменавания';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Все още нямаш приятели';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Добави приятел, за да започнеш.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Няма приятели, които да отговарят на търсенето';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Опитай с друго име.';

  @override
  String get quickSwitcherSearchAliasUser => 'Потребител';

  @override
  String get quickSwitcherSearchAliasYou => 'Ти';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'Лични съобщения';

  @override
  String get quickSwitcherSearchAliasMessages => 'Съобщения';

  @override
  String get quickSwitcherSearchAliasFav => 'Любими';

  @override
  String get quickSwitcherSearchAliasStarred => 'С любими';

  @override
  String get quickSwitcherSearchAliasInbox => 'Входящи';

  @override
  String get quickSwitcherSearchAliasSaved => 'Запазено';

  @override
  String get uiClose => 'Затвори';

  @override
  String get chatJumpToBottom => 'Премини към дъното';

  @override
  String get uiConfirm => 'Потвърди';

  @override
  String get uiLoading => 'Зареждане';

  @override
  String get uiSearch => 'Търсене';

  @override
  String get uiStartCall => 'Започване на разговор';

  @override
  String get uiStartVideoCall => 'Започване на видеоразговор';

  @override
  String get uiPlay => 'Пусни';

  @override
  String get uiPause => 'Пауза';

  @override
  String get uiDownload => 'Изтегляне';

  @override
  String get uiMoreActions => 'Още действия';

  @override
  String get uiUnsavedChanges => 'Незапазени промени';

  @override
  String get uiReset => 'Нулиране';

  @override
  String get uiOpenColorPicker => 'Отваряне на палитрата с цветове';

  @override
  String get uiSelectPlaceholder => 'Избери';

  @override
  String get uiSearchPlaceholder => 'Търсене';

  @override
  String get uiNoOptionsFound => 'Не са намерени опции';

  @override
  String get uiDismissNotification => 'Затвори известие';

  @override
  String get uiColorPickerTitle => 'Избор на цвят';

  @override
  String get mentionConfirmTitle => 'Споменаване на всички?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Това ще извести $count членове. Да продължим?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Това ще уведоми $count онлайн членове. Продължаване?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'Това ще извести $count членове с ролята $roleName. Да продължим?';
  }

  @override
  String get mentionConfirmButton => 'Споменаване';

  @override
  String get composerEmojiUnavailable =>
      'Не можеш да използваш този емотикон тук.';

  @override
  String get instanceUrlLabel => 'URL на инстанцията';

  @override
  String get instanceUrlPlaceholder =>
      'Въведете URL на инстанцията (напр. fluxer.app)';

  @override
  String get instanceUrlHelper =>
      'Use fluxer.app for the official instance, or the exact URL of a self-hosted instance.';

  @override
  String get resetToDefaultInstance => 'Възстановяване до Fluxer';

  @override
  String get instanceConnect => 'Свързване';

  @override
  String get instanceConnecting => 'Свързване…';

  @override
  String get instanceConnectFailed => 'Неуспешно свързване към инстанция';

  @override
  String get recentInstances => 'Последни инстанции';

  @override
  String removeRecentInstance(String domain) {
    return 'Премахни $domain от последните инстанции';
  }

  @override
  String get instanceSheetTitle => 'Свързване към инстанция';

  @override
  String get changeInstance => 'Промяна';

  @override
  String get instanceConnectionRequired =>
      'Свържете се с инстанцията, за да влезете';

  @override
  String get comingSoon => 'Скоро';

  @override
  String get guildNavbarDirectMessages => 'Директни съобщения';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Разгледай откриваеми общности';

  @override
  String get discoveryExplore => 'Разглеждане';

  @override
  String get discoveryExplorePublicCommunities =>
      'Разгледайте публични общности';

  @override
  String get discoveryListingSubheading =>
      'Искате да включите вашата общност тук? Кандидатствайте, ако отговаряте на изискванията в настройките на вашата общност > Откриване.';

  @override
  String get discoverySearchCommunities => 'Търсене на общности';

  @override
  String get discoveryFilterByLanguage => 'Филтриране по език';

  @override
  String get discoveryAllLanguages => 'Всички езици';

  @override
  String get discoveryAllCategories => 'Всички';

  @override
  String get discoveryCategoryGaming => 'Игри';

  @override
  String get discoveryCategoryMusic => 'Музика';

  @override
  String get discoveryCategoryEntertainment => 'Развлечения';

  @override
  String get discoveryCategoryEducation => 'Образование';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Наука и технологии';

  @override
  String get discoveryCategoryContentCreator => 'Създател на съдържание';

  @override
  String get discoveryCategoryAnimeAndManga => 'Аниме и манга';

  @override
  String get discoveryCategoryMoviesAndTv => 'Филми и телевизия';

  @override
  String get discoveryCategoryOther => 'Друго';

  @override
  String get discoveryNoCommunitiesMatch => 'Няма съвпадащи общности.';

  @override
  String get discoveryJoinCommunity => 'Присъединяване към общността';

  @override
  String get discoveryJoined => 'Присъединих се';

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
      other: '$countString членове',
      one: '1 член',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Няма описание.';

  @override
  String get discoveryCommunities => 'Общности';

  @override
  String get discoveryApps => 'Приложения';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Неуспешно присъединяване към общността';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Нещо се обърка. Опитай отново след малко.';

  @override
  String get discoveryJoinErrorFullTitle => 'Тази общност е пълна';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Тази общност е достигнала лимита си за членове, така че не можеш да се присъединиш в момента.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle => 'Достигна лимита за общности';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Достигна максималния брой общности. Напусни една и опитай отново.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Не можеш да се присъединиш към тази общност';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Наложена ти е забрана в тази общност.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Тази общност вече не е налична';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Може да е напуснала Откриване или да е изключила новите присъединявания. Презареди страницата и няма да я виждаш повече.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Действаш твърде бързо';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Изчакай малко и опитай отново.';

  @override
  String get guildNavbarAddCommunity => 'Добавяне на общност';

  @override
  String get guildNavbarHelp => 'Помощ';

  @override
  String get scrollIndicatorNew => 'НОВО';

  @override
  String get scrollIndicatorNewMessage => 'НОВО СЪОБЩЕНИЕ';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Свиване на $folderName';
  }

  @override
  String get guildNavbarGuildSelected => 'избрано';

  @override
  String get guildNavbarGuildUnread => 'непрочетени';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count споменавания',
      one: '1 споменаване',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'заглушено';

  @override
  String get authShowPassword => 'Покажи паролата';

  @override
  String get authHidePassword => 'Скрий паролата';

  @override
  String get authCheckStillWorking => 'Still working on it…';

  @override
  String get authVerificationFailed =>
      'Couldn\'t complete verification. Try again.';

  @override
  String get chatLoadingMessages => 'Зареждане на съобщения';

  @override
  String get friendsMessageFriend => 'Изпрати съобщение';

  @override
  String get friendsFriendActions => 'Действия с приятел';

  @override
  String get friendsAcceptRequest => 'Приемане на покана за приятелство';

  @override
  String get friendsDeclineRequest => 'Отхвърли заявката за приятелство';

  @override
  String get friendsCancelRequest => 'Отмяна на поканата за приятелство';

  @override
  String get friendsOpenInbox => 'Входящи';

  @override
  String get profileRemoveFriend => 'Премахване от приятели';

  @override
  String get profileUnblockUser => 'Отблокиране на потребител';

  @override
  String get profileAcceptFriendRequest => 'Приемане на покана за приятелство';

  @override
  String get profileCancelFriendRequest => 'Отмяна на поканата за приятелство';

  @override
  String get profileSendFriendRequest => 'Добавяне на приятел';

  @override
  String get accountOverflowMenu => 'Опции на профила';

  @override
  String get navHome => 'Начало';

  @override
  String get navNotifications => 'Известия';

  @override
  String get navYou => 'Ти';

  @override
  String get guildFolderSettingsTitle => 'Настройки на папката';

  @override
  String get guildFolderNameLabel => 'Име на папката';

  @override
  String get guildFolderColorLabel => 'Цвят на папката';

  @override
  String get guildFolderShowIconWhenCollapsed =>
      'Показване на икона при свиване';

  @override
  String get guildFolderIconLabel => 'Икона на папка';

  @override
  String get guildFolderDelete => 'Изтриване на папка';

  @override
  String get guildFolderIconFolder => 'Папка';

  @override
  String get guildFolderIconStar => 'Звезда';

  @override
  String get guildFolderIconHeart => 'Сърце';

  @override
  String get guildFolderIconBookmark => 'Отметка';

  @override
  String get guildFolderIconGameController => 'Геймпад';

  @override
  String get guildFolderIconShield => 'Щит';

  @override
  String get guildFolderIconMusicNote => 'Музикална нота';

  @override
  String get guildFolderMarkAsRead => 'Маркирай папката като прочетена';

  @override
  String get guildBulkMuteCommunities =>
      'Изключване на известията за общностите';

  @override
  String get guildBulkUnmuteCommunities =>
      'Включване на известията за общностите';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Настройки за известия на общността';

  @override
  String get guildBulkCommunityPrivacySettings =>
      'Настройки за поверителност на общността';

  @override
  String get guildBulkAllowEveryoneAndHere => 'Разреши @everyone и @here';

  @override
  String get guildBulkAllowRoleMentions =>
      'Разрешаване на споменавания на роли';

  @override
  String get guildBulkEnableMobilePush => 'Включване на мобилни известия';

  @override
  String get guildBulkDisableMobilePush =>
      'Изключване на мобилните push известия';

  @override
  String get guildBulkAllowDirectMessages =>
      'Разрешаване на директни съобщения';

  @override
  String get guildBulkBlockDirectMessages => 'Блокиране на директни съобщения';

  @override
  String get guildBulkAllowBotDirectMessages =>
      'Разрешаване на директни съобщения от ботове';

  @override
  String get guildBulkBlockBotDirectMessages =>
      'Блокиране на директни съобщения от ботове';

  @override
  String get guildNavbarGroupDm => 'Групово DM';

  @override
  String get guildNavbarCreateChannel => 'Създаване на канал';

  @override
  String get guildNavbarChannelType => 'Тип на канала';

  @override
  String get guildNavbarTextChannel => 'Текстов канал';

  @override
  String get guildNavbarTextChannelDescription =>
      'Изпращайте съобщения, изображения, GIF файлове и емотикони';

  @override
  String get guildNavbarVoiceChannel => 'Гласов канал';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Прекарвайте време заедно с глас, видео и споделяне на екран';

  @override
  String get guildNavbarLinkChannel => 'Свързване на канал';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Бърз достъп до външен уебсайт или ресурс';

  @override
  String get guildNavbarNameLabel => 'Име';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Избор на тип канал';

  @override
  String get guildNavbarPrivateChannel => 'Private channel';

  @override
  String get guildNavbarPrivateChannelDescription =>
      'Only selected members and roles will be able to view this channel.';

  @override
  String get guildNavbarAddMembersOrRoles => 'Add members or roles';

  @override
  String get guildNavbarAddMembersOrRolesHint => 'Search members or roles';

  @override
  String get guildNavbarCreateCategory => 'Създаване на категория';

  @override
  String get guildNavbarNewCategoryHint => 'Нова категория';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Покани приятели в $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Получателите ще бъдат пренасочени към #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Търсене на приятели';

  @override
  String get guildNavbarNoFriendsYet => 'Все още нямаш приятели';

  @override
  String get guildNavbarNoResults => 'Няма резултати';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Или изпратете покана по линк на приятел:';

  @override
  String get guildNavbarInviteLink => 'Линк за покана';

  @override
  String get guildNavbarCopy => 'Копирай';

  @override
  String get guildNavbarCopied => 'Копирано!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Вашата покана изтича след 7 дни.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Този линк за покана никога не изтича.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Вашата покана изтича след $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Редактиране на линк за покана';

  @override
  String get guildNavbarInviteLinkSettings => 'Настройки на линка за покана';

  @override
  String get guildNavbarExpireAfter => 'Изтича след';

  @override
  String get guildNavbarMaxUses => 'Макс. брой използвания';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Предоставяне на временен достъп';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Членовете ще бъдат премахвани, когато излязат офлайн, освен ако не им бъде присвоена роля';

  @override
  String get guildNavbarCreateNewLink => 'Създаване на нов линк';

  @override
  String get guildNavbarSent => 'Изпратено';

  @override
  String get guildNavbarInvite => 'Покани';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Напускане на общността';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Сигурни ли сте, че искате да напуснете тази общност? Вече няма да можете да виждате съобщения.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Напускане на общността';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Да изтриеш ли съобщенията си в тази общност?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Изтрийте завинаги всички съобщения, които сте изпратили тук, във всеки канал. Не може да бъде отменено.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm =>
      'Изтриване на съобщенията ми';

  @override
  String get guildNavbarDeletedYourMessages => 'Изтрихте съобщенията си';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Съобщенията ти не можаха да бъдат изтрити';

  @override
  String get guildNavbarRemoveOverride => 'Премахване на изключението';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Заглушен до $formattedDate';
  }

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'Достъпно само за служители на $productName';
  }

  @override
  String get guildNavbarInvitesPaused =>
      'Поканите са временно на пауза в тази общност';

  @override
  String get guildNavbarDurationNever => 'никога';

  @override
  String get guildNavbarDuration30Minutes => '30 минути';

  @override
  String get guildNavbarDuration1Hour => '1 час';

  @override
  String get guildNavbarDuration6Hours => '6 часа';

  @override
  String get guildNavbarDuration12Hours => '12 часа';

  @override
  String get guildNavbarDuration1Day => '1 ден';

  @override
  String get guildNavbarDuration7Days => '7 дни';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count секунди';
  }

  @override
  String get guildNavbarNever => 'Никога';

  @override
  String get guildNavbarNoLimit => 'Без ограничение';

  @override
  String get guildNavbarOneUse => '1 използване';

  @override
  String guildNavbarUses(int count) {
    return '$count пъти';
  }

  @override
  String get guildMenuMarkAsRead => 'Маркирай като прочетено';

  @override
  String get guildPeekMoreOptions => 'Още опции';

  @override
  String get guildMenuInviteMembers => 'Покани членове';

  @override
  String get guildMenuCommunitySettings => 'Настройки на общността';

  @override
  String get guildMenuEditCommunityProfile =>
      'Редактиране на профила в общността';

  @override
  String get guildMenuUnmuteCommunity => 'Включване на известията за общността';

  @override
  String get guildMenuMuteCommunity => 'Изключване на известията за общността';

  @override
  String get guildMenuHideMutedChannels => 'Скрий заглушените канали';

  @override
  String get guildMenuReportCommunity => 'Докладване на общността';

  @override
  String get guildMenuDebugCommunity => 'Отстраняване на грешки в общността';

  @override
  String get guildMenuCopyCommunityId => 'Копирай ID на общността';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'До $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Общи';

  @override
  String get guildMenuSettingsRoles => 'Роли и разрешения';

  @override
  String get guildMenuSettingsEmoji => 'Емотикони';

  @override
  String get guildMenuSettingsStickers => 'Стикери';

  @override
  String get guildMenuSettingsSafetyModeration => 'Безопасност и модерация';

  @override
  String get guildMenuSettingsActivityLog => 'Дневник на активността';

  @override
  String get guildMenuSettingsWebhooks => 'Уебхукове';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'Персонализиран URL за покана';

  @override
  String get guildMenuSettingsDiscovery => 'Откриване';

  @override
  String get guildMenuSettingsMembers => 'Членове';

  @override
  String get guildMenuSettingsInviteLinks => 'Покани';

  @override
  String get guildMenuSettingsBans => 'Забрани';

  @override
  String get guildMenuSettingsChannels => 'Канали';

  @override
  String get guildSettingsNoPermission =>
      'Нямате разрешение да видите този раздел от настройките.';

  @override
  String get guildSettingsOverviewIconTitle => 'Икона';

  @override
  String get guildSettingsUploadImage => 'Качване на изображение';

  @override
  String get guildSettingsOverviewBannerTitle => 'Банер';

  @override
  String get guildSettingsOverviewBannerHint => 'Качете банер за вашия сървър.';

  @override
  String get guildSettingsOverviewNameTitle => 'Име';

  @override
  String get guildSettingsOverviewNameHint => 'Моята страхотна общност';

  @override
  String get guildSettingsOverviewStatsTitle => 'Статистики';

  @override
  String get guildSettingsOverviewMembers => 'Членове';

  @override
  String get guildSettingsOverviewOnline => 'Онлайн';

  @override
  String get guildSettingsRolesDescription =>
      'Използвайте роли, за да групирате членове и да им присвоявате разрешения.';

  @override
  String get guildSettingsCreateRole => 'Създаване на роля';

  @override
  String get guildSettingsRolesListTitle => 'Роли';

  @override
  String get guildSettingsRolesNewRole => 'Нова роля';

  @override
  String get guildSettingsRolesDeleteRole => 'Изтриване на роля';

  @override
  String get guildSettingsRolesBackToRoles => 'Назад към ролите';

  @override
  String get guildSettingsBackToSettings => 'Назад към настройките';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Редактиране на „$name“';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Настройване на ролята и нейните разрешения';

  @override
  String get guildSettingsRolesDisplaySection => 'Показване';

  @override
  String get guildSettingsRolesRoleName => 'Име на ролята';

  @override
  String get guildSettingsRolesRoleColor => 'Цвят на ролята';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Въведи цвят (шестнадесетичен код, rgb(), hsl() или име) или използвай палитрата.';

  @override
  String get guildSettingsRolesShowSeparately => 'Показвай тази роля отделно';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Показва членовете с тази роля в отделна секция в списъка с членове.';

  @override
  String get guildSettingsRolesAllowMentions =>
      'Разрешаване на споменавания за тази роля';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'Членовете с разрешението „$permission“ винаги могат да споменават роли, независимо от тази настройка.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Използвай този бутон, за да изчистиш бързо всички разрешения.';

  @override
  String get guildSettingsRolesClearPermissions => 'Изчистване на разрешенията';

  @override
  String get guildSettingsRolesPermissionsSection => 'Разрешения';

  @override
  String get guildSettingsRolesSearchPermissions => 'Търсене на разрешения';

  @override
  String get guildSettingsRolesDenseLayout => 'Сбит изглед';

  @override
  String get guildSettingsRolesComfyLayout => 'Удобно оформление';

  @override
  String get guildSettingsRolesSwitchToDenseLayout =>
      'Превключване към сбит изглед';

  @override
  String get guildSettingsRolesSwitchToComfyLayout =>
      'Превключване към удобен изглед';

  @override
  String get guildSettingsRolesSingleColumn => 'Една колона';

  @override
  String get guildSettingsRolesTwoColumns => 'Две колони';

  @override
  String get guildSettingsRolesSwitchToSingleColumn =>
      'Превключване към една колона';

  @override
  String get guildSettingsRolesSwitchToTwoColumns =>
      'Превключване към две колони';

  @override
  String get guildSettingsRolesNoPermissionsFound => 'Няма намерени разрешения';

  @override
  String get guildSettingsRolesCustomHoistOrder =>
      'Персонализиран ред на показване';

  @override
  String get guildSettingsRolesHoistOrder => 'Подредба на показване';

  @override
  String get guildSettingsRolesResetHoistOrder =>
      'Възстановяване по подразбиране';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Плъзни ролите, за да промениш реда им в списъка с членове.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Няма роли, показвани отделно. Включи „Показвай тази роля отделно“ за дадена роля, за да я видиш тук.';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'Не можеш да редактираш тази роля, защото е най-високата ти роля или е над теб';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Нужно е да имате разрешението „$permission“, за да редактирате тези разрешения';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'Не можеш да редактираш роля, която е на твоето или по-високо ниво';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'Не можеш да дадеш разрешение, което нямаш';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'Не можеш да премахнеш това разрешение, защото така ще го премахнеш и от себе си';

  @override
  String get guildSettingsRolesUpdatedSuccess =>
      'Ролите са актуализирани успешно';

  @override
  String get guildSettingsRolesCreatedSuccess => 'Ролята е създадена успешно';

  @override
  String get guildSettingsRolesDeletedSuccess => 'Ролята е изтрита успешно';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'Редът на показване е върнат към стойността по подразбиране';

  @override
  String get guildSettingsRolesNameRequiredTitle =>
      'Името на ролята е задължително';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Дай име на ролята, преди да запазиш.';

  @override
  String get guildSettingsRolesCreateFailedTitle =>
      'Ролята не можа да бъде създадена';

  @override
  String get guildSettingsRolesUpdateFailedTitle =>
      'Неуспешно актуализиране на ролите';

  @override
  String get guildSettingsRolesDeleteFailedTitle =>
      'Ролята не можа да бъде изтрита';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '„$name“ не може да бъде изтрит. Опитайте отново.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'Неуспешно нулиране на реда на показване';

  @override
  String get guildSettingsRolesTryAgainInAMoment => 'Опитай отново след малко.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'Сигурни ли сте, че искате да изтриете ролята $name? Всички членове с тази роля вече няма да я имат.';
  }

  @override
  String get permissionCategoryCommunityWide => 'За цялата общност';

  @override
  String get permissionCategoryMessagesMedia => 'Съобщения и медия';

  @override
  String get permissionCategoryModeration => 'Модерация';

  @override
  String get permissionCategoryChannelAccess => 'Достъп до канал';

  @override
  String get permissionCategoryChannelManagement => 'Управление на канали';

  @override
  String get permissionCategoryAudioVideo => 'Аудио и видео';

  @override
  String get permissionUnknown => 'Неизвестно разрешение';

  @override
  String get permissionAdministrator => 'Администратор';

  @override
  String get permissionAdministratorDescription =>
      'Предоставя всички разрешения и заобикаля ограниченията на канала. Изключително чувствително разрешение.';

  @override
  String get permissionViewActivityLog => 'Преглед на дневника за активност';

  @override
  String get permissionViewActivityLogDescription =>
      'Преглед на дневника за активност на общността с промените и модераторските действия.';

  @override
  String get permissionManageCommunity => 'Управление на общността';

  @override
  String get permissionManageCommunityDescription =>
      'Редактиране на общи настройки като име, описание и икона.';

  @override
  String get permissionManageRoles => 'Управление на роли';

  @override
  String get permissionManageRolesDescription =>
      'Създаване, редактиране или изтриване на роли под най-високата ти роля. Позволява също редактиране на презаписванията на разрешенията за канали.';

  @override
  String get permissionManageChannels => 'Управление на канали';

  @override
  String get permissionManageChannel => 'Управление на канала';

  @override
  String get permissionManageChannelDescription =>
      'Преименуване и редактиране на настройките на този канал.';

  @override
  String get permissionManagePermissions => 'Управление на разрешения';

  @override
  String get permissionManagePermissionsDescription =>
      'Редактиране на презаписванията за роли и членове в този канал.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Създаване, редактиране или изтриване на уебхукове за този канал.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Преглед на списъка с членове за този канал.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Управлявай линковете за покани за този канал.';

  @override
  String get permissionOverwriteDeny => 'Отказване';

  @override
  String get permissionOverwriteInherit => 'Неутрално (наследяване)';

  @override
  String get permissionOverwriteAllow => 'Разрешаване';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Използвай тези бутони, за да зададеш бързо всички разрешения.';

  @override
  String get permissionManageChannelsDescription =>
      'Създаване, редактиране или изтриване на канали и категории.';

  @override
  String get permissionKickMembers => 'Изгонване на членове';

  @override
  String get permissionBanMembers => 'Забраняване на достъп на членове';

  @override
  String get permissionCreateInviteLinks => 'Създаване на линкове за покани';

  @override
  String get permissionChangeOwnNickname => 'Промяна на собствения прякор';

  @override
  String get permissionChangeOwnNicknameDescription =>
      'Актуализиране на собствения прякор.';

  @override
  String get permissionManageNicknames => 'Управление на прякори';

  @override
  String get permissionManageNicknamesDescription =>
      'Промяна на прякорите на другите членове.';

  @override
  String get permissionCreateEmojiStickers => 'Създаване на емоджита и стикери';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Качване на нови емоджита и стикери и управление на собствените ти творения.';

  @override
  String get permissionManageEmojiStickers =>
      'Управление на емоджита и стикери';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Редактиране или изтриване на емоджита и стикери, създадени от други членове.';

  @override
  String get permissionManageWebhooks => 'Управление на уебхукове';

  @override
  String get permissionManageWebhooksDescription =>
      'Създаване, редактиране или изтриване на уебхукове.';

  @override
  String get permissionSendMessages => 'Изпращане на съобщения';

  @override
  String get permissionSendTtsMessages => 'Изпращане на TTS съобщения';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Изпращане на съобщения с преобразуване на текст в реч.';

  @override
  String get permissionManageMessages => 'Управление на съобщения';

  @override
  String get permissionManageMessagesDescription =>
      'Изтриване на съобщения от други членове. Закачането се контролира отделно.';

  @override
  String get permissionPinMessages => 'Закачане на съобщения';

  @override
  String get permissionEmbedLinks => 'Вграждане на линкове';

  @override
  String get permissionAttachFiles => 'Прикачване на файлове';

  @override
  String get permissionMentionEveryone => 'Използвайте @everyone/@here и @роля';

  @override
  String get permissionMentionEveryoneDescription =>
      'Споменаване на всички или на която и да е роля (дори ако ролята не е настроена да може да бъде споменавана).';

  @override
  String get permissionUseExternalEmoji => 'Използване на външни емоджита';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Използване на емоджита от други общности.';

  @override
  String get permissionUseExternalStickers => 'Използване на външни стикери';

  @override
  String get permissionAddReactions => 'Добавяне на реакции';

  @override
  String get permissionAddReactionsDescription =>
      'Добавяне на нови реакции към съобщения.';

  @override
  String get permissionBypassSlowmode => 'Заобикаляне на бавен режим';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Игнориране на ограниченията за честота на съобщенията за канал.';

  @override
  String get permissionTimeOutMembers =>
      'Налагане на време за изчакване на членове';

  @override
  String get permissionTimeOutMembersDescription =>
      'Забраняване на членовете да изпращат съобщения, да реагират и да се присъединяват към гласови канали за определен период.';

  @override
  String get permissionViewChannel => 'Преглед на канал';

  @override
  String get permissionViewChannelMembers => 'Преглед на членовете на канала';

  @override
  String get permissionViewChannelMembersDescription =>
      'Преглед на списъка с членове за каналите в тази общност.';

  @override
  String get permissionConnect => 'Свързване';

  @override
  String get permissionSpeak => 'Говорене';

  @override
  String get permissionStreamVideo => 'Предаване на видео';

  @override
  String get permissionUseVoiceActivity => 'Използване на гласова активност';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Без това разрешение се изисква „Натисни и говори“.';

  @override
  String get permissionPrioritySpeaker => 'Приоритетен говорител';

  @override
  String get permissionMuteMembers => 'Изключване на микрофона на членове';

  @override
  String get permissionDeafenMembers => 'Изключване на звука на членове';

  @override
  String get permissionMoveMembers => 'Преместване на членове';

  @override
  String get permissionMoveMembersDescription =>
      'Плъзнете членове между канали, до които имат достъп.';

  @override
  String get permissionSetVoiceRegion => 'Задаване на гласов регион';

  @override
  String get permissionManageThreads => 'Manage threads';

  @override
  String get permissionManageThreadsDescription =>
      'Rename, archive, lock and delete threads, set their slowmode, and view private threads.';

  @override
  String get permissionCreatePublicThreads => 'Create public threads';

  @override
  String get permissionCreatePublicThreadsDescription =>
      'Start threads that everyone who can view the channel can see.';

  @override
  String get permissionCreatePrivateThreads => 'Create private threads';

  @override
  String get permissionCreatePrivateThreadsDescription =>
      'Start invite-only threads.';

  @override
  String get permissionSendMessagesInThreads => 'Send messages in threads';

  @override
  String get permissionSendMessagesInThreadsDescription =>
      'Send messages in threads and forum posts.';

  @override
  String get threadErrorArchived => 'This thread is archived.';

  @override
  String get threadErrorLocked =>
      'This thread is locked. Only moderators can post or reopen it.';

  @override
  String get threadErrorAlreadyCreated =>
      'A thread already exists for this message.';

  @override
  String get threadErrorMaxActiveThreads =>
      'This community has reached its limit of active threads.';

  @override
  String get threadErrorMaxMembers =>
      'This thread has reached its member limit.';

  @override
  String get threadErrorMaxPinnedPosts =>
      'Only one post can be pinned in this forum.';

  @override
  String get threadErrorMaxForumTags => 'A forum can have at most 20 tags.';

  @override
  String get threadErrorTagNamesUnique => 'Tag names must be unique.';

  @override
  String get threadErrorNoTagsForEveryone =>
      'Add a tag everyone can use before requiring tags.';

  @override
  String get threadErrorTagRequired => 'Pick at least one tag for this post.';

  @override
  String get threadErrorUnknownTag =>
      'One of the selected tags no longer exists.';

  @override
  String get threadErrorInvalidNotificationSettings =>
      'Those notification settings are not valid for a thread.';

  @override
  String get threadErrorSearchIndexNotReady =>
      'Posts are still being indexed. Try again in a moment.';

  @override
  String get threadErrorInvalidChannelType =>
      'This action is not available in this channel.';

  @override
  String get threadCreate => 'Create thread';

  @override
  String get threadName => 'Thread name';

  @override
  String get threadNameRequired => 'Give the thread a name.';

  @override
  String get threadNewThreadPlaceholder => 'New thread';

  @override
  String get threadPrivate => 'Private thread';

  @override
  String get threadPrivateDescription =>
      'Only people you invite and moderators can see this thread.';

  @override
  String get threadStarterMessage => 'Message';

  @override
  String get threadStarterMessagePlaceholder =>
      'Enter a message to start the conversation!';

  @override
  String threadCreateCooldown(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'You can start another thread in $seconds seconds.',
      one: 'You can start another thread in 1 second.',
    );
    return '$_temp0';
  }

  @override
  String threadCreateFailed(String detail) {
    return 'Could not start the thread: $detail';
  }

  @override
  String get threadBrowserTitle => 'Threads';

  @override
  String get threadBrowserActive => 'Active';

  @override
  String get threadBrowserArchived => 'Closed';

  @override
  String get threadBrowserJoined => 'Joined';

  @override
  String get threadBrowserOtherActive => 'Other active threads';

  @override
  String get threadBrowserPublic => 'Public threads';

  @override
  String get threadBrowserPrivate => 'Private threads';

  @override
  String get threadBrowserEmpty =>
      'There are no threads. Stay focused on a conversation with a thread, a temporary text channel.';

  @override
  String get threadBrowserArchivedEmpty => 'There are no closed threads.';

  @override
  String get threadBrowserLoadMore => 'Load more';

  @override
  String get threadBrowserSearch => 'Search threads';

  @override
  String get threadBrowserSearchEmpty => 'No threads match';

  @override
  String get threadBrowserSearchEmptyHint =>
      'Try a different name or check the other tab.';

  @override
  String get threadBrowserSearchFailed =>
      'Couldn\'t search threads. Try again later.';

  @override
  String get threadBrowserSearchIndexing =>
      'Search is getting ready for this community. Trying again shortly...';

  @override
  String threadMessageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count messages',
      one: '1 message',
    );
    return '$_temp0';
  }

  @override
  String get threadFailedToMentionSomeRoles =>
      'Some mentioned roles were not added to this thread.';

  @override
  String get threadMembers => 'Thread members';

  @override
  String threadMembersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count members',
      one: '1 member',
    );
    return '$_temp0';
  }

  @override
  String get threadMembersEmpty => 'Nobody has joined this thread yet.';

  @override
  String threadRemoveMember(String name) {
    return 'Remove $name from thread';
  }

  @override
  String get threadJoin => 'Join thread';

  @override
  String get threadLeave => 'Leave thread';

  @override
  String get threadJoinNotice =>
      'Join this thread to follow it in your channel list and get notifications.';

  @override
  String get threadArchivedNotice =>
      'This thread is closed. Sending a message will open it again.';

  @override
  String get threadLockedNotice =>
      'This thread is locked. Only moderators can send messages.';

  @override
  String get threadArchive => 'Close thread';

  @override
  String get threadUnarchive => 'Open thread again';

  @override
  String get threadLock => 'Lock thread';

  @override
  String get threadUnlock => 'Unlock thread';

  @override
  String get threadDelete => 'Delete thread';

  @override
  String threadDeleteConfirm(String threadName) {
    return 'Are you sure you want to delete $threadName? This cannot be undone.';
  }

  @override
  String get threadDeleted => 'Thread deleted';

  @override
  String get threadMarkAsRead => 'Mark as read';

  @override
  String get threadMute => 'Mute thread';

  @override
  String get threadUnmute => 'Unmute thread';

  @override
  String get threadMuted => 'Thread muted';

  @override
  String get threadUnmuted => 'Thread unmuted';

  @override
  String get threadNotificationSettings => 'Notification settings';

  @override
  String get threadNotificationParentDefault => 'Use channel default';

  @override
  String get threadCopyLink => 'Copy link';

  @override
  String get threadCopyId => 'Copy thread ID';

  @override
  String get threadMoreOptions => 'More options';

  @override
  String get threadSettings => 'Thread settings';

  @override
  String get threadSettingsSaved => 'Thread settings saved';

  @override
  String get threadAutoArchive => 'Hide after inactivity';

  @override
  String get threadAutoArchiveDescription =>
      'The thread stops showing in the channel list after this period of inactivity.';

  @override
  String get threadDefaultAutoArchive => 'Default hide after inactivity';

  @override
  String get threadDefaultAutoArchiveDescription =>
      'New threads stop showing in the channel list after this period of inactivity.';

  @override
  String get threadDefaultSlowmode => 'Default thread slowmode';

  @override
  String get threadAutoArchiveOneHour => '1 Hour';

  @override
  String get threadAutoArchiveOneDay => '24 Hours';

  @override
  String get threadAutoArchiveThreeDays => '3 Days';

  @override
  String get threadAutoArchiveOneWeek => '1 Week';

  @override
  String get threadInvitable => 'Allow anyone to invite';

  @override
  String get threadInvitableDescription =>
      'Members of this private thread can add other people.';

  @override
  String threadStartedBy(String name) {
    return 'Started by $name';
  }

  @override
  String get threadStarterDeleted => 'Original message was deleted.';

  @override
  String systemThreadCreated(
    String username,
    String threadLink,
    String allThreadsLink,
  ) {
    return '$username started a thread: $threadLink. See $allThreadsLink.';
  }

  @override
  String get systemThreadCreatedAllThreadsLink => 'all threads';

  @override
  String get systemThreadCreatedThreadFallback => 'a thread';

  @override
  String systemPreviewThreadCreated(String username) {
    return '$username started a thread.';
  }

  @override
  String guildSettingsEmojiSlotInfo(int staticCount, int animatedCount) {
    return 'Използвани са $staticCount статични, $animatedCount анимирани емотикони';
  }

  @override
  String get guildSettingsEmojiEmpty =>
      'Все още няма персонализирани емотикони.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count стикера качени';
  }

  @override
  String get guildSettingsStickersEmpty =>
      'Все още няма персонализирани стикери.';

  @override
  String get guildSettingsModerationVerificationTitle =>
      'Потвърждение на членството';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Избери какво трябва да имат членовете, преди да могат да публикуват или да изпращат DM на членове на общността.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Членовете с роли могат да заобиколят тези проверки. За публични пространства препоръчваме да включиш потвърждението.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Общностите, включени в Откриване, изискват поне потвърден имейл. Не може да бъде избрано нито едно, докато Откриване е активирано.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Съдържание за възрастни и предупреждения за съдържание';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Конфигурирайте етикетирането на неподходящо съдържание и незадължителни предупреждения за съдържание за членовете.';

  @override
  String get guildSettingsModerationMatureToggle => 'Съдържание за възрастни';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Маркирайте тази общност като съдържаща неподходящо съдържание.';

  @override
  String get guildSettingsVerificationNone => 'Няма';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Не се изисква потвърждение.';

  @override
  String get guildSettingsVerificationLow => 'Ниско';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Изисква потвърден имейл адрес.';

  @override
  String get guildSettingsVerificationMedium => 'Средно';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Изисква потвърден имейл адрес и акаунт, създаден преди поне 5 минути.';

  @override
  String get guildSettingsVerificationHigh => 'Високо';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Изисква всичко от средно ниво, плюс членство в общността от поне 10 минути.';

  @override
  String get guildSettingsVerificationHighest => 'Много високо';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Изисква потвърден телефонен номер.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Проследяване на действията на модераторите в общността.';

  @override
  String get guildSettingsAuditLogEmpty => 'Все още няма записи';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Тук ще се показват действията за модериране и промените в общността.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Всички потребители';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Всички действия';

  @override
  String get guildSettingsAuditLogNoReason => 'Не е посочена причина.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Неизвестен потребител';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Възникна проблем при зареждането на дневника на активността.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Дневникът на активността не може да бъде зареден';

  @override
  String get guildSettingsAuditLogReason => 'Причина';

  @override
  String get guildSettingsAuditLogSomeone => 'някой';

  @override
  String get guildSettingsAuditLogSomething => 'нещо';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'неизвестно лице';

  @override
  String get guildSettingsAuditLogNothing => 'нищо';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Неизвестна цел';

  @override
  String get auditLogActionGuildUpdate => 'Общността е актуализирана';

  @override
  String get auditLogActionChannelCreate => 'Каналът е създаден';

  @override
  String get auditLogActionChannelUpdate => 'Каналът е актуализиран';

  @override
  String get auditLogActionChannelDelete => 'Каналът е изтрит';

  @override
  String get auditLogActionThreadCreate => 'Thread created';

  @override
  String get auditLogActionThreadUpdate => 'Thread updated';

  @override
  String get auditLogActionThreadDelete => 'Thread deleted';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Добавено е презаписване на канал';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Актуализирано разрешение за канал';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Премахнато е презаписване на канал';

  @override
  String get auditLogActionMemberKick => 'Членът е изгонен';

  @override
  String get auditLogActionMemberPrune => 'Членовете са премахнати';

  @override
  String get auditLogActionMemberBanAdd => 'На члена е наложена забрана';

  @override
  String get auditLogActionMemberBanRemove => 'Забраната на члена е премахната';

  @override
  String get auditLogActionMemberUpdate => 'Членът е актуализиран';

  @override
  String get auditLogActionMemberRoleUpdate =>
      'Ролите на члена са актуализирани';

  @override
  String get auditLogActionMemberMove => 'Членът е преместен';

  @override
  String get auditLogActionMemberDisconnect =>
      'Членът е изключен от гласов канал';

  @override
  String get auditLogActionBotAdd => 'Ботът е добавен';

  @override
  String get auditLogActionRoleCreate => 'Ролята е създадена';

  @override
  String get auditLogActionRoleUpdate => 'Ролята е актуализирана';

  @override
  String get auditLogActionRoleDelete => 'Ролята е изтрита';

  @override
  String get auditLogActionInviteCreate => 'Поканата е създадена';

  @override
  String get auditLogActionInviteUpdate => 'Поканата е актуализирана';

  @override
  String get auditLogActionInviteDelete => 'Поканата е изтрита';

  @override
  String get auditLogActionWebhookCreate => 'Уебхукът е създаден';

  @override
  String get auditLogActionWebhookUpdate => 'Уебхукът е актуализиран';

  @override
  String get auditLogActionWebhookDelete => 'Уебхукът е изтрит';

  @override
  String get auditLogActionEmojiCreate => 'Емоджито е създадено';

  @override
  String get auditLogActionEmojiUpdate => 'Емоджито е актуализирано';

  @override
  String get auditLogActionEmojiDelete => 'Емоджито е изтрито';

  @override
  String get auditLogActionStickerCreate => 'Стикерът е създаден';

  @override
  String get auditLogActionStickerUpdate => 'Стикерът е актуализиран';

  @override
  String get auditLogActionStickerDelete => 'Стикерът е изтрит';

  @override
  String get auditLogActionMessageDelete => 'Съобщението е изтрито';

  @override
  String get auditLogActionMessageBulkDelete => 'Съобщенията са изтрити';

  @override
  String get auditLogActionMessagePin => 'Съобщението е закачено';

  @override
  String get auditLogActionMessageUnpin => 'Съобщението е откачено';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor актуализира настройките на общността.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor създаде канала $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor актуализира канала $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor изтри канала $target.';
  }

  @override
  String auditLogSummaryThreadCreate(String actor, String target) {
    return '$actor started the thread $target.';
  }

  @override
  String auditLogSummaryThreadUpdate(String actor, String target) {
    return '$actor updated the thread $target.';
  }

  @override
  String auditLogSummaryThreadDelete(String actor, String target) {
    return '$actor deleted the thread $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor добави разрешения за канала за $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor добави разрешения за канала за $target в $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor промени разрешенията за канала на $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor промени разрешенията за канала за $target в $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor премахна разрешенията за канала за $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor премахна разрешенията за канала за $target в $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor изгони $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor забрани $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor разблокира $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor актуализира $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor промени ролите на $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor изтри неактивни членове.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor премахна членове, неактивни от $days дни.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor премести $target в друг гласов канал.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor премести $target в $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor прекъсна връзката на $target от гласов канал.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor добави бота $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor създаде ролята $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor промени ролята на $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor изтри ролята $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor създаде поканата $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor създаде поканата $target за $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor актуализира поканата $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor актуализира поканата $target за $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor изтри поканата $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor изтри поканата $target за $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor създаде webhook $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor актуализира уебкука $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor изтри уебкука $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor добави емотикона $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor актуализира емоджито $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor изтри емотикона $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor добави стикера $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor актуализира стикера $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor изтри стикера $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor изтри съобщение.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor изтри съобщение в $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor изтри няколко съобщения.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor изтри $count съобщения.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor изтри множество съобщения в $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor изтри $count съобщения в $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor прикачи съобщение.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor прикачи съобщение в $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor премахна щифта от съобщение.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor премахна закачане на съобщение в $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor извърши одит на $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Променихте $field от $oldValue на $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Задайте $field на $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Изчистено $field (беше $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Актуализирано $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Преименувах общността на $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Актуализира иконата на общността.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Преименувах канала на $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Изчисти темата.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Промених темата на $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'Разрешено е съдържание за възрастни.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Деактивирано съдържание за възрастни.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Задайте прякор на $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Премахнат прякор $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Заглуших члена.';

  @override
  String get auditLogChangeUnmutedMember => 'Членът беше размютен.';

  @override
  String get auditLogChangeDeafenedMember => 'Заглуших члена.';

  @override
  String get auditLogChangeUndeafenedMember =>
      'Премахнах заглушаването на члена.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Добавени $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Премахнати $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Канал: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Съобщение: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Поканен от $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Изтрити # съобщения.',
      one: 'Изтрито # съобщение.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Премахнати # членове.',
      one: 'Премахнат # член.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'Тази покана никога не изтича.';

  @override
  String get auditLogOptionTemporaryMembership => 'Предоставя временен достъп.';

  @override
  String get auditLogOptionPermanentMembership =>
      'Предоставя постоянно членство.';

  @override
  String get guildSettingsLoadMore => 'Зареди още';

  @override
  String get guildSettingsLoadingMore => 'Зареждане...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Преглеждай и управлявай всички уебхукове, конфигурирани в общността ти.';

  @override
  String get guildSettingsWebhooksEmpty => 'Няма уебхукове';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'Тази общност все още няма уебкуки. Отидете на $channelSettingsPath, за да създадете такава.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'За да преглеждате и редактирате уебкуки за тази общност, се нуждаете от разрешението „$permission“.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle =>
      'Неуспешно зареждане на уебхукове';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'Възникна грешка при зареждането на уебхуковете. Опитай отново.';

  @override
  String get guildSettingsWebhooksUpdated => 'Уебхуковете са актуализирани';

  @override
  String get guildSettingsWebhooksUpdateFailed =>
      'Неуспешно актуализиране на уебхукове';

  @override
  String get guildSettingsUnknownChannel => 'Неизвестен канал';

  @override
  String get guildSettingsCopyUrl => 'Копирай URL';

  @override
  String get guildSettingsCopiedUrl => 'URL адресът е копиран в клипборда';

  @override
  String get guildSettingsDeleteWebhook => 'Изтриване на уебхук';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Задай персонализиран линк за покана за твоя сървър.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Запазване';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Употреба';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count използвания';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Включи общността си в Откриване, за да могат другите да я намират и да се присъединяват към нея.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Няма достатъчно членове';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Вашата общност трябва да има поне $count членове, преди да може да бъде включена в Откриване.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Състояние:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'В изчакване';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Одобрено';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Отхвърлено';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Премахнато';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Причина: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'Общността ти е включена в Откриване. Можеш да актуализираш данните за обявата си по-долу или да се оттеглиш, за да я премахнеш.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Заявлението ти е в процес на преглед. Все още можеш да актуализираш данните за обявата си или да оттеглиш заявлението.';

  @override
  String get guildSettingsDiscoveryCategory => 'Категория';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Избери категорията, която най-добре описва общността ти. Можеш да я промениш по всяко време.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Основен език';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'Езикът, който общността ти говори най-често. Използва се за филтриране на резултатите от Откриване.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Описание';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Опиши за какво е общността ти';

  @override
  String get guildSettingsDiscoveryDescriptionRequired =>
      'Изисква се описание.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'Описанието трябва да е поне $minLength знака.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'Описанието трябва да е до $maxLength знака.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Персонализирани етикети';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'До $maxTags етикета помагат на хората да открият вашата общност. Те се показват в търсенето в секция \"Откриване\".';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'Добави етикет и натисни Enter';

  @override
  String get guildSettingsDiscoveryAddTag => 'Добавяне';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Премахване на етикет $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle =>
      'Етикетът не можа да бъде добавен';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'Етикетите трябва да са от 2 до $maxLength знака и да съдържат само букви и цифри.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'Можеш да добавиш най-много $maxTags етикета.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Приложи';

  @override
  String get guildSettingsDiscoverySave => 'Запазване';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Оттегляне';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Заявлението за Откриване е изпратено';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Включването в Откриване е актуализирано';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Заявлението за Откриване е оттеглено';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Неуспешно оттегляне на заявлението';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Опитай отново след малко.';

  @override
  String get guildSettingsMembersDescription =>
      'Търсене и управление на членовете на сървъра.';

  @override
  String get guildSettingsMembersSearchHint =>
      'Търсене по потребителско име или ID';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count членове';
  }

  @override
  String get guildMembersRecentTitle => 'Нови членове';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Показване на $displayedCount от общо $totalCount членове';
  }

  @override
  String get guildMembersSort => 'Сортиране';

  @override
  String get guildSettingsMembersSortNewest => 'Първо най-новите';

  @override
  String get guildMembersSortOldest => 'Първо най-старите';

  @override
  String get guildMembersColumnName => 'Име';

  @override
  String get guildMembersColumnMemberSince => 'Член от';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'В $productName от';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Начин на присъединяване';

  @override
  String get guildMembersColumnRoles => 'Роли';

  @override
  String get guildMembersColumnActions => 'Действия';

  @override
  String get guildMembersFilterMemberSince =>
      'Филтриране по дата на присъединяване';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Филтриране по дата на създаване на акаунт';

  @override
  String get guildMembersFilterJoinMethod =>
      'Филтриране по метод на присъединяване';

  @override
  String get guildMembersFilterRoles => 'Филтриране по роли';

  @override
  String get guildMembersFilterAll => 'Всички';

  @override
  String get guildMembersFilterPast1Hour => 'Последният час';

  @override
  String get guildMembersFilterPast24Hours => 'Последните 24 часа';

  @override
  String get guildMembersFilterPast7Days => 'Последните 7 дни';

  @override
  String get guildMembersFilterPast2Weeks => 'Последните 2 седмици';

  @override
  String get guildMembersFilterPast3Weeks => 'Последните 3 седмици';

  @override
  String get guildMembersFilterPast4Weeks => 'Последните 4 седмици';

  @override
  String get guildMembersFilterPast3Months => 'Последните 3 месеца';

  @override
  String get guildMembersFilterCustomRange => 'Персонализиран период...';

  @override
  String get guildMembersDateRangeTitle => 'Персонализиран период';

  @override
  String get guildMembersDateAfter => 'След дата';

  @override
  String get guildMembersDateBefore => 'Преди дата';

  @override
  String get guildMembersClearAll => 'Изчистване на всичко';

  @override
  String get guildMembersRowsPerPage => 'Редове на страница';

  @override
  String get guildMembersEmptySearch => 'Няма съвпадения с търсенето.';

  @override
  String get guildMembersLoadError =>
      'Възникна грешка при зареждане на членовете. Опитай отново по-късно.';

  @override
  String get guildMembersIndexing => 'Индексиране на членове…';

  @override
  String get guildMembersGoToPage => 'Отиване на страница';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'Отиване на страница $page';
  }

  @override
  String get guildMembersJumpToPage => 'Отиване на страница';

  @override
  String get guildMembersJoinSourceCreator => 'Създател на общността';

  @override
  String get guildMembersJoinSourceInvite => 'Покани';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Покана ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Поканен от $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'Персонализиран URL адрес';

  @override
  String get guildMembersJoinSourceBotInvite => 'Покана за бот';

  @override
  String get guildMembersJoinSourcePlatformAdmin =>
      'Администратор на платформата';

  @override
  String get guildMembersJoinSourceDiscovery => 'Откриване';

  @override
  String get guildMembersJoinMethodUnknown => 'Неизвестен';

  @override
  String get guildMembersCommunityOwner => 'Собственик на общността';

  @override
  String get guildMembersViewAllRoles => 'Преглед на всички роли';

  @override
  String get guildMembersJoinedJustNow => 'Току-що';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'преди $count минути',
      one: 'преди 1 минута',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'преди $count часа',
      one: 'преди 1 час',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'преди $count дни',
      one: 'преди 1 ден',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Членове';

  @override
  String get guildMembersChannelListSelected => 'Членове, избрано';

  @override
  String get guildSettingsInvitesTitle => 'Покани';

  @override
  String get guildSettingsInvitesDescription =>
      'Преглед на всички покани за тази общност. За да създадеш нова покана, отиди в канал и използвай бутона за покана.';

  @override
  String get guildSettingsInvitesEmpty => 'Няма линкове за покани';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Тази общност все още няма линкове за покани. Отиди в канал и създай покана, за да поканиш хора.';

  @override
  String get guildSettingsInvitesLoadFailedTitle =>
      'Неуспешно зареждане на покани';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Възникна грешка при зареждането на поканите. Опитай отново.';

  @override
  String get guildSettingsInvitesTryAgain => 'Опитай отново';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Показване на дата на създаване вместо дата на изтичане';

  @override
  String get guildSettingsInvitesPauseInvites => 'Спиране на поканите';

  @override
  String get guildSettingsInvitesEnableInvites => 'Разрешаване на покани';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Спиране на поканите за тази общност';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Разрешаване на покани за тази общност';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Да спра ли поканите? Новите потребители няма да могат да се присъединяват чрез линкове за покани, докато не ги активираш отново. Това няма да засегне съществуващите членове.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Да се активират ли поканите? Потребителите отново ще могат да се присъединяват към тази общност чрез линкове за покани.';

  @override
  String get guildSettingsInvitesPause => 'Пауза';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Поканите за тази общност са на пауза.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Поканите са на пауза, защото $productName откри потенциална атака. Нови потребители не могат да се присъединят в момента.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Поканил:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Канал:';

  @override
  String get guildSettingsInvitesLabelCode => 'Код:';

  @override
  String get guildSettingsInvitesLabelUses => 'Използвания:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Създадена:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Изтича:';

  @override
  String get guildSettingsInvitesUnknown => 'Неизвестен';

  @override
  String get guildSettingsInvitesNoCategory => 'Без категория';

  @override
  String get guildSettingsInvitesExpired => 'Изтекло';

  @override
  String get guildSettingsInvitesNever => 'Никога';

  @override
  String get guildSettingsInvitesCopyLink => 'Копирай линк за покана';

  @override
  String get guildSettingsInvitesRevoke => 'Отмени поканата';

  @override
  String get guildSettingsInvitesRevokeFailedTitle =>
      'Поканата не можа да бъде отменена';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'Възможно е линкът все още да работи. Опитай отново след малко.';

  @override
  String guildSettingsInviteUses(int uses, int maxUses) {
    return '$uses / $maxUses пъти';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Изтича на $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Преглед и управление на забранените потребители.';

  @override
  String get guildSettingsBansSearchHint => 'Търсене на забрани';

  @override
  String get guildSettingsBansEmpty => 'Няма забранени потребители.';

  @override
  String get guildSettingsBanPermanent => 'Постоянно блокиране';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Изтича на $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Изтича';

  @override
  String get guildSettingsUnban => 'Редактиране на забрана';

  @override
  String get guildSettingsBansLoading => 'Зареждане на забранените потребители';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Няма забрани, отговарящи на търсенето ти.';

  @override
  String get guildSettingsBanDetailsTitle => 'Подробности за забраната';

  @override
  String get guildSettingsBanViewDetails => 'Преглед на подробности';

  @override
  String get guildSettingsBannedOn => 'Дата на забраната';

  @override
  String get guildSettingsBannedBy => 'Наложена от';

  @override
  String get guildSettingsRevokeBanTitle => 'Отмени забраната';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Сигурни ли сте, че искате да отмените забраната за $displayName? Той/тя ще може да се присъедини отново към общността.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Премахнахме забраната за $displayName';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Не успяхме да заредим забраните. Опитайте отново.';

  @override
  String get guildSettingsRevokeBanError =>
      'Не успях да отменя забраната. Опитайте отново.';

  @override
  String get guildSettingsCommunitySettings => 'Настройки на общността';

  @override
  String get guildSettingsDeleteCommunity => 'Изтриване на общност';

  @override
  String get guildSettingsDeleteCommunityConfirm =>
      'Наистина ли искаш да изтриеш тази общност? Това действие не може да бъде отменено. Всички канали, съобщения и настройки ще бъдат изтрити завинаги.';

  @override
  String get guildSettingsCommunityDeleted => 'Общността е изтрита';

  @override
  String get guildSettingsDeleteCommunityFailed =>
      'Couldn\'t delete this community';

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
      'Управлявайте профила, каналите и настройките по подразбиране на вашата общност.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Брандиране';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Актуализирайте иконата, името, банера и фоновото изображение за покани';

  @override
  String get guildSettingsOverviewBannerUpload => 'Качване на банер';

  @override
  String get guildSettingsOverviewIdleTitle => 'Настройки за неактивност';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Настройте AFK канал и време за изчакване';

  @override
  String get guildSettingsOverviewSystemTitle =>
      'Системни и приветствени съобщения';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Изберете дестинация за системни съобщения и съобщения за добре дошли';

  @override
  String get guildSettingsOverviewNotificationsTitle =>
      'Известия по подразбиране';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Общности с над 250 души се превключват на настройката „само споменавания“. Първоначалната ти настройка се запазва и ще бъде възстановена, ако общността спадне под 250 членове.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Разширени';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Разрешаване на гъвкави имена на текстови канали';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Скрий короната на собственика на общността';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Разкачен банер';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Показва банера в собствен раздел под заглавката на общността.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Качване на икона';

  @override
  String get guildSettingsOverviewRemoveImage => 'Премахване';

  @override
  String get guildSettingsOverviewSplashTitle => 'Фон на поканата';

  @override
  String get guildSettingsOverviewEmbedSplashTitle =>
      'Фон на вградения елемент в чата';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Показва се във вградените покани в чата.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Качване на фон';

  @override
  String get guildSettingsOverviewNoCommunityBanner =>
      'Няма банер на общността';

  @override
  String get guildSettingsOverviewNoInviteBackground => 'Няма фон на поканата';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Преглед';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Виж как изглежда поканата ти за посетителите.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Имена на текстови канали';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Корона на собственика на общността';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Настройте дали иконата на корона се показва до собственика на общността';

  @override
  String get guildSettingsSplashCardAlignment => 'Подравняване на картата';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Център';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Ляво';

  @override
  String get guildSettingsSplashAlignmentRight => 'Дясно';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Прилага се само на широки екрани.';

  @override
  String get permissionReadMessageHistory =>
      'Четене на историята на съобщенията';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Промени какво могат да виждат потребители без $permission';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Използвайте отделен прозорец, за да зададете дата за праг на историята на съобщенията за членове, които нямат разрешение $permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Отваряне на настройките за праг на историята на съобщенията';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Праг на историята на съобщенията';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Включване на прага на историята на съобщенията';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Гранична дата';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Членове без история на прочетените съобщения могат да виждат съобщения, изпратени след тази дата.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Прагът на историята на съобщенията е актуализиран';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Позволява главни букви и интервали в имената на текстовите канали. Когато е изключено, имената се ограничават до малки букви, тирета и долни черти.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Скрива иконата с корона до собственика на общността на всички места.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Анимираните икони изискват функцията за общността „Анимирани икони“.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Анимираните банери изискват функцията за анимирани банери на общността.';

  @override
  String get guildSettingsAfkChannel => 'AFK канал за неактивни';

  @override
  String get guildSettingsAfkChannelHint =>
      'Премествай членовете в този канал, когато са неактивни.';

  @override
  String get guildSettingsNoAfkChannel => 'Няма AFK канал';

  @override
  String get guildSettingsAfkTimeout => 'Таймаут за AFK';

  @override
  String get guildSettingsAfkTimeout1Min => '1 минута';

  @override
  String get guildSettingsAfkTimeout5Min => '5 минути';

  @override
  String get guildSettingsAfkTimeout15Min => '15 минути';

  @override
  String get guildSettingsAfkTimeout30Min => '30 минути';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 час';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds секунди';
  }

  @override
  String get guildSettingsSystemChannel => 'Целеви канал';

  @override
  String get guildSettingsSystemChannelHint =>
      'Добре дошли и системните съобщения ще се показват тук.';

  @override
  String get guildSettingsNoSystemChannel => 'Няма системен канал';

  @override
  String get guildSettingsHideJoinMessages =>
      'Скрий съобщенията за присъединяване';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Скрива съобщенията за присъединяване в избрания канал.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Настройки за известия по подразбиране';

  @override
  String get guildSettingsNotificationsAll => 'Всички съобщения';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Известия за всички съобщения';

  @override
  String get guildSettingsNotificationsMentions => 'Само споменавания';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Известия само при споменавания';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Максимум 10 MB. Минимум: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Максимум 10 MB. Минимум: 960×540px (16:9). Показва се в покани в чата.';

  @override
  String get guildSettingsModerationDescription =>
      'Настройте настройките за верификация, филтриране на съдържание и съдържание за възрастни.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Общностите, включени в търсенето, имат ограничени опции за модериране.';

  @override
  String get guildSettingsModerationContentFilterTitle =>
      'Филтриране на съдържание';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Автоматично проверяване на съобщенията за изрично съдържание в канали, които не са маркирани за съдържание за възрастни.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Общностите, включени в Откриване, трябва да сканират всички членове. Тази настройка не може да бъде променяна, докато Откриване е активирано.';

  @override
  String get guildSettingsContentFilterOff => 'Изкл';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Нека общността се самомодерира';

  @override
  String get guildSettingsContentFilterNoRole =>
      'Филтриране на членове без роли';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Препоръчително за повечето общности';

  @override
  String get guildSettingsContentFilterAll => 'Филтриране на всички';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Максимална защита за пространства, подходящи за семейството';

  @override
  String get guildSettingsModerationMatureOff => 'Изкл';

  @override
  String get guildSettingsModerationMatureOn => 'Вкл';

  @override
  String get guildSettingsContentWarningToggle =>
      'Показване на предупреждение за съдържание';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Превключва подкана за съгласие преди влизане във всеки канал.';

  @override
  String get guildSettingsContentWarningText =>
      'Персонализиран текст за предупреждение';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Тук има чувствително съдържание.';

  @override
  String get guildSettingsModeration2faTitle =>
      'Изискване за двуфакторно удостоверяване';

  @override
  String get guildSettingsModeration2faDescription =>
      'Изискване на двуфакторно удостоверяване за модераторите, преди да могат да забраняват, изключват, временно ограничават или изтриват съобщения.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Изискване на двуфакторно удостоверяване за модераторски действия';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Само собственикът на общността може да променя тази настройка';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Включи двуфакторното удостоверяване в акаунта си, за да промениш тази настройка';

  @override
  String get guildSettingsEmojiSearchHint => 'Търсене на емоджита';

  @override
  String get guildSettingsEmojiUploadTitle => 'Качване на емоджи';

  @override
  String get guildSettingsEmojiSlotsTitle => 'Слотове за емоджита';

  @override
  String get guildSettingsEmojiDropZone =>
      'Плъзни и пусни файлове с емоджита тук';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Неуспешно зареждане на емоджита. Опитай отново по-късно.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'Няма емоджита, отговарящи на търсенето ти.';

  @override
  String get guildSettingsEmojiNoSlots => 'Няма свободни слотове за емоджита';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Достигна максималния брой емоджита. Изтрий някои от съществуващите, за да освободиш място.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Имената на емоджитата трябва да съдържат поне 2 знака и могат да използват букви, цифри и долни черти. Емоджитата трябва да са под $maxSize. Статичните изображения се преоразмеряват до 128x128 пиксела и автоматично се компресират. Анимираните емоджита и SVG файловете вече трябва да отговарят на изискванията за размер.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'Качване на емоджита';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# емотикона',
      one: '# емотикон',
    );
    return 'Качване на $_temp0. Това може да отнеме известно време.';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'Неуспешно качване на емоджита. Опитай отново.';

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Някои емоджита не можаха да бъдат добавени';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'Прегледай тези файлове и опитай отново с по-малки или по-прости изображения.';

  @override
  String get guildSettingsEmojiRenameTitle => 'Преименуване на емоджи';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2-32 знака, букви, цифри, долни черти.';

  @override
  String get guildSettingsEmojiColumnEmoji => 'Емотикон';

  @override
  String get guildSettingsEmojiColumnName => 'Име';

  @override
  String get guildSettingsEmojiColumnUploader => 'Качено от';

  @override
  String get guildSettingsEmojiUnknownUploader => 'Неизвестен';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Изтриване на емоджи';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'Изтрий :$name:? Това не може да бъде отменено.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Изтриване на това емоджи от хранилището и CDN';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'Името на емоджито трябва да е поне 2 знака';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'Името на емоджито трябва да е най-много 32 знака';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Невалидно име на емоджи';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Неуспешно преименуване на това емоджи';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'Името беше върнато към предишното. Опитай отново след малко.';

  @override
  String get guildSettingsEmojiGoneTitle => 'Това емоджи вече не съществува';

  @override
  String get guildSettingsEmojiGoneBody =>
      'Възможно е да е било изтрито. Името беше върнато към предишното.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'Не можеш да преименуваш това емоджи';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'Нямаш разрешение да преименуваш това емоджи. Името беше върнато към предишното.';

  @override
  String get guildSettingsEmojiRateLimitedTitle => 'Действаш твърде бързо';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'Изчакай малко и опитай да преименуваш отново.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Неуспешно изтриване на емоджито';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'Не можеш да изтриеш това емоджи';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'Позволяване на други да клонират емоджитата ви';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'Когато е активирано, членове на други общности могат да използват пряката \"Клониране\" с едно докосване в приложението за вашите персонализирани емотикони. Това не им пречи да запазят изображението и да го качат сами.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Позволяване на други да клонират стикерите ви';

  @override
  String get guildSettingsCloneStickerDescription =>
      'Когато е активирано, членове на други общности могат да използват пряката \"Клониране\" с едно докосване в приложението за вашите персонализирани стикери. Това не им пречи да запазват изображението и да го качват сами.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Само членове с разрешението „$permission“ могат да променят това.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'Неуспешно актуализиране на клонирането на емоджита';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Неуспешно актуализиране на клонирането на стикери';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Неанимирани емотикони ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Анимирани емотикони ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Търсене на стикери';

  @override
  String get guildSettingsStickerSlotsTitle => 'Слотове за стикери';

  @override
  String get guildSettingsStickerUploadTitle => 'Качване на стикер';

  @override
  String get guildSettingsStickerDropZone =>
      'Плъзни и пусни файл със стикер тук (един по един)';

  @override
  String get guildSettingsStickerDensity => 'Плътност на стикерите';

  @override
  String get guildSettingsStickerDensityCozy => 'Уютен';

  @override
  String get guildSettingsStickerDensityCompact => 'Компактен';

  @override
  String get guildSettingsStickersLoadFailedTitle =>
      'Неуспешно зареждане на стикери';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Възникна грешка при зареждането на стикерите. Опитай отново.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Няма стикери, отговарящи на търсенето ти.';

  @override
  String get guildSettingsStickersEmptySearch => 'Няма намерени стикери';

  @override
  String get guildSettingsStickerNoSlots => 'Няма свободни слотове за стикери';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Достигна максималния брой стикери. Изтрий някои от съществуващите, за да освободиш място.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Стикерите се запазват в размер 320x320 пиксела и трябва да са под $maxSize. Статичните изображения се преоразмеряват и компресират автоматично. Анимираните стикери и SVG файловете трябва да се вместват в ограничението още при качването.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle =>
      'Неподдържан файл за стикер';

  @override
  String get guildSettingsStickerAddTitle => 'Добавяне на стикер';

  @override
  String get guildSettingsStickerEditTitle => 'Редактиране на стикер';

  @override
  String get guildSettingsStickerNameLabel => 'Име';

  @override
  String get guildSettingsStickerNameHint => 'Моят страхотен стикер';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Описание';

  @override
  String get guildSettingsStickerDescriptionHint => 'Опиши стикера';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Етикети ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Добавяне на етикет';

  @override
  String get guildSettingsStickerTagAdd => 'Добавяне';

  @override
  String get guildSettingsStickerNameRequired => 'Името е задължително';

  @override
  String get guildSettingsStickerNameTooShort =>
      'Името трябва да е поне 2 знака';

  @override
  String get guildSettingsStickerNameTooLong => 'Името трябва да е до 30 знака';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'Описанието трябва да е до 500 знака';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'Стикерът не можа да бъде създаден';

  @override
  String get guildSettingsStickerTooLargeTitle => 'Стикерът е твърде голям';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'Стикерът не можа да бъде компресиран достатъчно';

  @override
  String get guildSettingsStickerDeleteTitle => 'Изтриване на стикер';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'Изтрий \"$name\"? Това действие не може да бъде отменено.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Изтриване на този стикер от хранилището и CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Не успях да изтрия този стикер';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'Не можете да изтриете този стикер';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'За да създадете уебкука, отворете $channelSettingsPath. Все още можете да редактирате и организирате всички съществуващи уебкуки тук.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'Вашият персонализиран URL адрес няма да работи, освен ако поне един канал не е видим за всички.';

  @override
  String get guildSettingsVanityUrlRemove => 'Премахване';

  @override
  String get guildSettingsBannedUsersTitle => 'Забранени потребители';

  @override
  String get guildSettingsInvitesTableInviter => 'Поканил';

  @override
  String get guildSettingsInvitesTableChannel => 'Канал';

  @override
  String get guildSettingsInvitesTableCode => 'Код';

  @override
  String get guildSettingsInvitesTableUses => 'Използвания';

  @override
  String get guildSettingsInvitesTableCreated => 'Създадена';

  @override
  String get guildSettingsInvitesTableExpires => 'Изтича';

  @override
  String get guildSettingsAuditLogFilterUser => 'Филтриране по потребител';

  @override
  String get guildSettingsAuditLogFilterAction => 'Филтриране по действие';

  @override
  String get createDm => 'Създаване на DM';

  @override
  String get createGroupDm => 'Създаване на групово DM';

  @override
  String get createDmNewMessage => 'Ново съобщение';

  @override
  String get createDmSelectFriends => 'Избери приятели';

  @override
  String get createDmChooseFriendsSubtitle =>
      'Избери приятели, на които да пишеш.';

  @override
  String get createDmSearchFriends => 'Търсене на приятели';

  @override
  String get createDmNoFriendsFound => 'Няма намерени приятели';

  @override
  String get createDmNoFriendsYet => 'Все още нямаш приятели';

  @override
  String get createDmClaimToStartDms => 'Заяви акаунта си, за да започваш DM.';

  @override
  String get createDmVerifyToStartDms =>
      'Потвърди имейла си, за да започнеш DM.';

  @override
  String get createDmVerifyYourEmail => 'Потвърди имейла си';

  @override
  String get createDmNewGroup => 'Нова група';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Създаване на нова група с $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'Потвърди новата група';

  @override
  String get createDmCreateNewGroup => 'Създаване на нова група';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'Премахване на $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'Вече имаш група с тези потребители. Наистина ли искаш да създадеш нова? Няма проблем и така!';

  @override
  String get createDmNoActivityYet => 'Все още няма активност';

  @override
  String get createDmSomeUsersCantBeAdded =>
      'Някои потребители не могат да бъдат добавени';

  @override
  String get createDmCreateWithoutThem => 'Създаване без тях';

  @override
  String get createDmUnaddableIntro =>
      'Следните хора не могат да бъдат добавени към това групово DM:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Създаване на групов личен разговор с останалите $count получател(и) и пропускане на останалите?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Няма останали получатели, с които да създадеш групово DM.';

  @override
  String get createDmUnaddableUserNotFound => 'Потребителят не е намерен';

  @override
  String get createDmUnaddableBlocked =>
      'Не можеш да изпратиш съобщение на този потребител';

  @override
  String get createDmUnaddableNotFriends => 'Не е в списъка ти с приятели';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Не разрешава добавяне в групови DM';

  @override
  String get createDmFailed =>
      'Не успяхме да създадем разговора. Опитайте отново.';

  @override
  String get dmListMessagesTitle => 'Съобщения';

  @override
  String get dmListDirectMessagesTitle => 'Директни съобщения';

  @override
  String get keybindsSearchShortcuts => 'Търсене на клавишни комбинации';

  @override
  String get keybindSectionDefaults => 'По подразбиране';

  @override
  String get keybindSectionMessages => 'Съобщения';

  @override
  String get keybindSectionNavigation => 'Навигация';

  @override
  String get keybindSectionDragAndDrop => 'Плъзгане и пускане';

  @override
  String get keybindSectionChat => 'Чат';

  @override
  String get keybindSectionVoiceAndVideo => 'Глас и видео';

  @override
  String get keybindSectionMisc => 'Разни';

  @override
  String get keybindActionShowShortcutsList =>
      'Показване на списъка с клавишни комбинации';

  @override
  String get keybindActionCopyText => 'Копирай текста';

  @override
  String get keybindActionMarkUnread => 'Маркирай като непрочетено';

  @override
  String get keybindActionFocusTextarea => 'Фокусиране на текстовото поле';

  @override
  String get keybindActionSwitchCommunities => 'Превключване между общности';

  @override
  String get keybindActionSwitchChannels => 'Превключване между канали';

  @override
  String get keybindActionHistoryBack =>
      'Назад в историята на прегледаните канали';

  @override
  String get keybindActionHistoryForward =>
      'Напред в историята на прегледаните канали';

  @override
  String get keybindActionJumpUnreadChannels =>
      'Прескачане между непрочетени канали';

  @override
  String get keybindActionJumpMentionChannels =>
      'Прескачане между непрочетени канали със споменавания';

  @override
  String get keybindActionJumpCurrentCall => 'Към текущия разговор';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Превключване между последната общност и DM';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Превключване към предишна общност или DM';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Превключване към следваща общност или DM';

  @override
  String get keybindActionGoToDms => 'Към директни съобщения';

  @override
  String get keybindActionGoToFirstCommunity => 'Към първата общност';

  @override
  String get keybindActionGoToSecondCommunity => 'Към втората общност';

  @override
  String get keybindActionGoToThirdCommunity => 'Към третата общност';

  @override
  String get keybindActionGoToFourthCommunity => 'Към четвъртата общност';

  @override
  String get keybindActionGoToFifthCommunity => 'Към петата общност';

  @override
  String get keybindActionGoToSixthCommunity => 'Към шестата общност';

  @override
  String get keybindActionGoToSeventhCommunity => 'Към седмата общност';

  @override
  String get keybindActionGoToEighthCommunity => 'Към осмата общност';

  @override
  String get keybindActionToggleQuickSwitcher =>
      'Показване/скриване на бързия превключвател';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'Създаване на общност или присъединяване към съществуваща';

  @override
  String get keybindActionStartDragAndDrop => 'Започване на плъзгане и пускане';

  @override
  String get keybindActionMove => 'Премести';

  @override
  String get keybindActionDropItem => 'Пускане на елемента';

  @override
  String get keybindActionCancel => 'Отказ';

  @override
  String get keybindActionMarkCommunityRead =>
      'Маркирай общността като прочетена';

  @override
  String get keybindActionMarkChannelRead => 'Маркирай канала като прочетен';

  @override
  String get keybindActionStartGroupDm => 'Започване на групово DM';

  @override
  String get keybindActionTogglePinnedMessages =>
      'Показване/скриване на закачените съобщения';

  @override
  String get keybindActionToggleInbox => 'Показване/скриване на входящите';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Маркирай най-горния канал във входящите като прочетен';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Маркирай всички канали във входящите като прочетени';

  @override
  String get keybindActionToggleMemberList =>
      'Показване/скриване на списъка с членове или гласовия чат';

  @override
  String get keybindActionToggleEmojiPicker =>
      'Показване/скриване на избора на емоджита';

  @override
  String get keybindActionToggleGifPicker =>
      'Показване/скриване на избора на GIF файлове';

  @override
  String get keybindActionToggleStickerPicker =>
      'Показване/скриване на избора на стикери';

  @override
  String get keybindActionScrollChatUp => 'Превъртане на чата нагоре';

  @override
  String get keybindActionScrollChatDown => 'Превъртане на чата надолу';

  @override
  String get keybindActionJumpOldestUnread =>
      'Към най-старото непрочетено съобщение';

  @override
  String get keybindActionFocusComposer => 'Фокусиране на текстовото поле';

  @override
  String get keybindActionUploadFile => 'Качване на файл';

  @override
  String get keybindActionCopyChannelLink => 'Копирай линка към канала';

  @override
  String get keybindActionToggleSavedMedia =>
      'Показване/скриване на запазените медии';

  @override
  String get keybindActionSendVoiceMessage => 'Изпращане на гласово съобщение';

  @override
  String get keybindActionAnswerCall => 'Отговаряне на входящото повикване';

  @override
  String get keybindActionDeclineCall => 'Отхвърляне на входящото повикване';

  @override
  String get keybindActionStartDmCall => 'Започване на разговор в DM или група';

  @override
  String get keybindActionToggleSoundboard =>
      'Показване/скриване на панела със звуци';

  @override
  String get keybindActionToggleCompactCallView =>
      'Разгъване или свиване на компактен изглед на разговор';

  @override
  String get keybindActionPushToTalkPriority =>
      'Натисни и говори (приоритетно)';

  @override
  String get keybindActionVoiceActivityPriority =>
      'Приоритет на гласовата активност';

  @override
  String get keybindActionOpenHelp => 'Отваряне на помощта';

  @override
  String get keybindActionSearchMessages => 'Търсене в съобщенията';

  @override
  String get keybindActionOpenContextMenu => 'Отваряне на контекстното меню';

  @override
  String get keybindActionOpenSettings => 'Отваряне на настройките';

  @override
  String get keybindActionOpenThemeStudio =>
      'Отваряне на студиото за теми в изскачащ прозорец';

  @override
  String get keybindActionZoomIn => 'Увеличаване';

  @override
  String get keybindActionZoomOut => 'Намаляване';

  @override
  String get keybindActionZoomReset => 'Възстановяване на мащаба';

  @override
  String get clipboardPasteFailed =>
      'Не успях да поставя. Буферът за обмен е празен или блокиран за това приложение.';

  @override
  String get homeQuickActionDms => 'Лични съобщения';

  @override
  String get assistantNeedsLogin => 'Open Fluxer and sign in first.';

  @override
  String get assistantNotInVoice => 'You\'re not in a call.';

  @override
  String get assistantNotFound => 'Fluxer could not find that.';

  @override
  String get assistantDmsDisabled =>
      'Direct messages are disabled on this instance.';

  @override
  String get assistantFailed => 'Fluxer could not complete that.';

  @override
  String get assistantOkMuted => 'Muted.';

  @override
  String get assistantOkUnmuted => 'Unmuted.';

  @override
  String get assistantOkLeftVoice => 'Left voice.';

  @override
  String get assistantOkJoinedVoice => 'Joining voice.';

  @override
  String get assistantOkStartedCall => 'Starting the call.';

  @override
  String assistantOkStatusSet(String status) {
    return 'Status set to $status.';
  }

  @override
  String get assistantOkOpened => 'Opening Fluxer.';

  @override
  String get assistantOkMessageSent => 'Съобщението е изпратено.';

  @override
  String get assistantOkCustomStatusSet => 'Custom status updated.';

  @override
  String get assistantOkCustomStatusCleared => 'Custom status cleared.';

  @override
  String get guildNavbarAnnouncementChannel => 'Announcement';

  @override
  String get guildNavbarAnnouncementChannelDescription =>
      'Post updates other communities can follow';

  @override
  String get channelDetailsAnnouncementChannel => 'Announcement channel';

  @override
  String get channelSettingsAnnouncementChannel => 'Announcement channel';

  @override
  String get channelSettingsAnnouncementChannelDescription =>
      'Lets other communities follow this channel and get copies of what you publish.';

  @override
  String get channelSettingsStopAnnouncementTitle =>
      'Stop being an announcement channel?';

  @override
  String channelSettingsStopAnnouncementBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count channels follow this channel. Converting it to a text channel removes those follows.',
      one:
          '1 channel follows this channel. Converting it to a text channel removes that follow.',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsStopAnnouncementUnknown =>
      'Converting this channel to a text channel removes every channel that follows it.';

  @override
  String get channelSettingsConvertChannel => 'Convert';

  @override
  String get channelSettingsConvertFailed => 'Couldn\'t convert this channel';

  @override
  String get channelSettingsChannelHasFollowers =>
      'This channel still has followers. Remove those follows before converting it.';

  @override
  String get channelMenuFollow => 'Follow channel';

  @override
  String get channelFollowTitle => 'Follow this channel';

  @override
  String get channelFollowBody =>
      'Choose where its published messages should go. You can unfollow any time in Community settings → Webhooks.';

  @override
  String get channelFollowCommunity => 'Community';

  @override
  String get channelFollowChannel => 'Channel';

  @override
  String get channelFollowSelectCommunity => 'Select a community';

  @override
  String get channelFollowSelectChannel => 'Select a channel';

  @override
  String get channelFollowAgeWarning =>
      'This is an age-restricted channel. Updates can only go to age-restricted channels.';

  @override
  String get channelFollowContentWarning =>
      'This channel has a content warning. Updates can only go to channels with a content warning or an age restriction.';

  @override
  String get channelFollowHiddenHint =>
      'Communities and channels where you can\'t manage webhooks are hidden.';

  @override
  String get channelFollowEmpty =>
      'You can\'t manage webhooks in any community. Ask an admin to follow this channel.';

  @override
  String get channelFollowSubmit => 'Follow';

  @override
  String get channelFollowFailed => 'Couldn\'t follow this channel.';

  @override
  String get channelFollowSuccessTitle => 'Updates are on their way!';

  @override
  String channelFollowSuccessBody(String sourceName, String targetName) {
    return 'Messages published in $sourceName will show up in #$targetName.';
  }

  @override
  String get channelFollowSuccessDismiss => 'Got it!';

  @override
  String get channelFollowBarrier =>
      'Follow to get these announcements in a channel you choose.';

  @override
  String get channelHeaderFollow => 'Follow channel';

  @override
  String get chatMessagePublish => 'Publish';

  @override
  String get chatMessagePublished => 'Published';

  @override
  String get chatMessagePublishConfirmTitle => 'Publish message?';

  @override
  String get chatMessagePublishConfirmBody =>
      'This sends a copy to every channel that follows this one.';

  @override
  String get chatMessagePublishedToast => 'Message published';

  @override
  String get chatMessageAlreadyPublished =>
      'This message is already published.';

  @override
  String get chatMessagePublishFailedTitle => 'Couldn\'t publish this message';

  @override
  String get chatMessagePublishFailedBody =>
      'Something went wrong. Try again in a moment.';

  @override
  String get chatMessagePublishLimitTitle => 'Slow down';

  @override
  String chatMessagePublishLimitBody(String duration) {
    return 'You can publish again in $duration.';
  }

  @override
  String get chatMessagePublishLimitUnknown =>
      'You are publishing too quickly. Try again in a moment.';

  @override
  String get chatMessageDeletePublished =>
      'This also removes the copies that were sent to channels following this one.';

  @override
  String get chatMessageEditPublishedTitle => 'Edit published message?';

  @override
  String get chatMessageEditPublishedBody =>
      'This updates the copies that were sent to channels following this one.';

  @override
  String get chatMessageEditPublishedSave => 'Save';

  @override
  String get chatMessageEditLimitTitle => 'Slow down';

  @override
  String chatMessageEditLimitBody(String duration) {
    return 'You can edit this published message again in $duration.';
  }

  @override
  String get chatMessageEditLimitUnknown =>
      'You are editing this published message too quickly. Try again in a moment.';

  @override
  String get chatMessageOriginalDeleted => '[Original message deleted]';

  @override
  String get userTagCommunity => 'Community';

  @override
  String systemFollowAdd(String username, String source) {
    return '$username followed $source into this channel. Messages published there will appear here.';
  }

  @override
  String systemPreviewFollowAdd(String username, String source) {
    return '$username followed $source into this channel.';
  }

  @override
  String get publishNudgeNotSent => 'Not sent to followers yet.';

  @override
  String get publishNudgeHideForever => 'Don\'t show again';

  @override
  String get publishNudgeDismiss => 'Dismiss';

  @override
  String get channelSettingsFollowedChannels => 'Followed channels';

  @override
  String get channelSettingsFollowedChannelsDescription =>
      'Announcement channels this channel follows. Unfollow to stop receiving copies.';

  @override
  String get guildSettingsFollowedChannelsDescription =>
      'Announcement channels followed by channels in this community.';

  @override
  String channelSettingsFollowedFrom(String guildName, String channelName) {
    return 'From $guildName #$channelName';
  }

  @override
  String get channelSettingsFollowedPaused =>
      'Updates are paused because the source channel is no longer available.';

  @override
  String channelSettingsUnfollowTitle(String name) {
    return 'Unfollow $name?';
  }

  @override
  String get channelSettingsUnfollowBody =>
      'This channel will stop receiving copies from that announcement channel.';

  @override
  String get channelSettingsUnfollow => 'Unfollow';

  @override
  String get channelSettingsUnfollowFailed =>
      'Couldn\'t unfollow this channel.';

  @override
  String channelSettingsDeliveredTo(String channelName) {
    return 'Delivered to #$channelName';
  }

  @override
  String get crosspostCommunityTitle => 'Community';

  @override
  String get crosspostGoToCommunity => 'Go to community';

  @override
  String get crosspostJoinCommunity => 'Join community';

  @override
  String get crosspostSourceFailed =>
      'Couldn\'t load this community. Try again in a moment.';

  @override
  String get crosspostSourceUnavailable =>
      'This community is no longer available';

  @override
  String crosspostMembers(int count) {
    return '$count members';
  }

  @override
  String crosspostOnline(int count) {
    return '$count online';
  }

  @override
  String durationMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes',
      one: '1 minute',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seconds',
      one: '1 second',
    );
    return '$_temp0';
  }

  @override
  String get channelUnsupportedTitle => 'Unsupported channel type';

  @override
  String get channelUnsupportedBody =>
      'This version of the app doesn\'t support this channel type.';

  @override
  String get channelDetailsUnsupportedChannel => 'Unsupported channel';

  @override
  String get forumChannelTypeForum => 'Forum';

  @override
  String get forumChannelTypeForumDescription =>
      'Posts organized by topic and tags';

  @override
  String get forumChannelTypeMedia => 'Media';

  @override
  String get forumChannelTypeMediaDescription =>
      'Posts built around images and videos';

  @override
  String get forumNewPost => 'New post';

  @override
  String get forumNewMediaPost => 'New media post';

  @override
  String get forumSearchPosts => 'Search posts';

  @override
  String get forumViewOptions => 'Sort and view';

  @override
  String get forumSearchIndexing =>
      'Search is still being prepared for this community. Posts appear here as soon as it is ready.';

  @override
  String get forumNoPosts => 'No posts yet.';

  @override
  String get forumNoSearchResults => 'No posts match your search.';

  @override
  String get forumCreateFirstPost => 'Create the first post';

  @override
  String get forumOlderPosts => 'Older posts';

  @override
  String get forumPostsLoadFailed => 'Posts could not be loaded.';

  @override
  String get forumRetry => 'Try again';

  @override
  String get forumPostPinned => 'Pinned';

  @override
  String get forumPostLocked => 'Locked';

  @override
  String get forumPostArchived => 'Archived';

  @override
  String get forumPostNewBadge => 'NEW';

  @override
  String get forumPostStarterDeleted => 'The original message was deleted.';

  @override
  String forumPostSnippet(String author, String content) {
    return '$author: $content';
  }

  @override
  String forumPostNewMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count new messages',
      one: '1 new message',
    );
    return '$_temp0';
  }

  @override
  String get forumPostReact => 'Add the default reaction';

  @override
  String get forumOpenPost => 'Open post';

  @override
  String get forumEditTags => 'Edit tags';

  @override
  String get forumSaveTags => 'Save tags';

  @override
  String forumTagsLimitHint(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pick up to $count tags.',
      one: 'Pick up to 1 tag.',
    );
    return '$_temp0';
  }

  @override
  String get forumPinPost => 'Pin post';

  @override
  String get forumUnpinPost => 'Unpin post';

  @override
  String get forumMarkPostRead => 'Mark as read';

  @override
  String get forumCopyPostLink => 'Copy link';

  @override
  String get forumPostGuidelines => 'Post guidelines';

  @override
  String get forumGuidelinesPlaceholder =>
      'Tell people what to post here and how to post it.';

  @override
  String get forumPostTitle => 'Title';

  @override
  String get forumPostMessage => 'Message';

  @override
  String get forumPostMessagePlaceholder =>
      'Write the first message of your post';

  @override
  String get forumPostMediaPlaceholder => 'Add a caption';

  @override
  String get forumPostTags => 'Tags';

  @override
  String get forumPostTagsRequired => 'Tags (required)';

  @override
  String get forumPostAddMedia => 'Add media';

  @override
  String get forumPostAddFile => 'Add file';

  @override
  String get forumPostRemoveAttachment => 'Remove attachment';

  @override
  String get forumPostSubmit => 'Post';

  @override
  String get forumPostTitleRequired => 'Give your post a title.';

  @override
  String get forumPostMediaRequired =>
      'Add at least one image or video to post here.';

  @override
  String get forumPostContentRequired => 'Write a message or add a file.';

  @override
  String get forumSortLatestActivity => 'Recently active';

  @override
  String get forumSortCreationTime => 'Date posted';

  @override
  String get forumLayoutList => 'List view';

  @override
  String get forumLayoutGallery => 'Gallery view';

  @override
  String get forumNewPostsUnread => 'Show unread for new posts';

  @override
  String get forumNewPostsUnreadDescription =>
      'Mark this channel unread when someone creates a post.';

  @override
  String get forumPostSlowmode => 'Post slowmode';

  @override
  String forumPostSlowmodeDescription(String bypassSlowmodePermissionLabel) {
    return 'Wait between creating posts. \"$bypassSlowmodePermissionLabel\" can bypass it.';
  }

  @override
  String get forumMessageSlowmode => 'Message slowmode in posts';

  @override
  String get forumMessageSlowmodeDescription =>
      'Slowmode applied to messages in new posts.';

  @override
  String get forumDefaultAutoArchive => 'Hide after inactivity';

  @override
  String get forumDefaultAutoArchiveDescription =>
      'New posts are archived after this long without activity.';

  @override
  String get forumDefaultReaction => 'Default reaction';

  @override
  String get forumSetDefaultReaction => 'Pick an emoji';

  @override
  String get forumChangeDefaultReaction => 'Change';

  @override
  String get forumRemoveDefaultReaction => 'Remove';

  @override
  String get forumDefaultSortOrder => 'Default sort order';

  @override
  String get forumDefaultLayout => 'Default layout';

  @override
  String get forumTagMatchSetting => 'Tag filter';

  @override
  String get forumTagMatchSome => 'Match any selected tag';

  @override
  String get forumTagMatchAll => 'Match all selected tags';

  @override
  String get forumRequireTag => 'Require tags';

  @override
  String get forumRequireTagDescription =>
      'People must pick at least one tag when they create a post.';

  @override
  String get forumHideMediaDownloads => 'Hide media download options';

  @override
  String get forumHideMediaDownloadsDescription =>
      'Hide download, open in browser and copy link for images and videos in posts.';

  @override
  String forumTagsTitle(int count, int max) {
    return 'Tags ($count/$max)';
  }

  @override
  String get forumTagsDescription =>
      'Tags help people find and filter posts. Only moderators can apply moderated tags.';

  @override
  String get forumCreateTag => 'Create tag';

  @override
  String get forumEditTag => 'Edit tag';

  @override
  String get forumSaveTag => 'Save tag';

  @override
  String get forumDeleteTag => 'Delete tag';

  @override
  String get forumTagName => 'Tag name';

  @override
  String get forumTagEmoji => 'Emoji';

  @override
  String get forumTagRemoveEmoji => 'Remove emoji';

  @override
  String get forumTagModerated => 'Only moderators can apply';

  @override
  String get forumTagModeratedDescription =>
      'Only members who can manage threads can apply or remove this tag.';

  @override
  String get forumTagModeratedBadge => 'Moderated';

  @override
  String forumPostCooldown(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'You can post again in $seconds seconds.',
      one: 'You can post again in 1 second.',
    );
    return '$_temp0';
  }
}
