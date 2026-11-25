// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Belarusian (`be`).
class FluxerLocalizationsBe extends FluxerLocalizations {
  FluxerLocalizationsBe([String locale = 'be']) : super(locale);

  @override
  String get reconnectingTitle => 'Ой, у нас збой!';

  @override
  String get chatJumpToPresent => 'Перайсці да апошніх паведамленняў';

  @override
  String get chatViewingOlderMessages =>
      'Вы праглядаеце старэйшыя паведамленні';

  @override
  String get chatNewMessagesBarJumpToFirstUnread =>
      'Перайсці да першага непрачытанага паведамлення';

  @override
  String get chatNewMessagesBarMarkAsRead => 'Пазначыць як прачытанае';

  @override
  String get chatNewMessagesBarMarkRead => 'Пазначыць прачытаным';

  @override
  String chatNewMessagesBarNewMessagesSinceEstimated(
    int unreadCount,
    String compactTime,
  ) {
    final intl.NumberFormat unreadCountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String unreadCountString = unreadCountNumberFormat.format(
      unreadCount,
    );

    return '$unreadCountString+ новых паведамленняў з $compactTime';
  }

  @override
  String chatNewMessagesBarNewMessagesSince(
    int unreadCount,
    String compactTime,
  ) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount новага паведамлення',
      many: '$unreadCount новых паведамленняў',
      few: '$unreadCount новыя паведамленні',
      one: '$unreadCount новае паведамленне',
    );
    return '$_temp0 з $compactTime';
  }

  @override
  String chatNewMessagesBarNewSinceEstimated(
    int unreadCount,
    String shortTime,
  ) {
    final intl.NumberFormat unreadCountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String unreadCountString = unreadCountNumberFormat.format(
      unreadCount,
    );

    return '$unreadCountString+ новых з $shortTime';
  }

  @override
  String chatNewMessagesBarNewSince(int unreadCount, String shortTime) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount новага',
      many: '$unreadCount новых',
      few: '$unreadCount новыя',
      one: '$unreadCount новае',
    );
    return '$_temp0 з $shortTime';
  }

  @override
  String get reconnectingBody =>
      'З экзэмплярам штосьці не так.\nХутка ўсё выправіцца!';

  @override
  String get gatewayReconnectingToast => 'Паўторнае падключэнне…';

  @override
  String get gatewayReconnectTryAgain => 'Паспрабаваць яшчэ раз';

  @override
  String get gatewayConnectedToast => 'Падключана';

  @override
  String get gatewayOfflineToast =>
      'Вы не ў сетцы. Fluxer падключыцца зноў, калі з’явіцца сетка.';

  @override
  String get sessionExpiredToast =>
      'Тэрмін дзеяння вашага сеанса скончыўся. Увайдзіце зноў.';

  @override
  String accountDeletionScheduledNotice(String date) {
    return 'Ваш уліковы запіс будзе выдалены $date. Калі ўвайсці да гэтай даты, выдаленне будзе скасавана.';
  }

  @override
  String get accountDeletionScheduledNoticeNoDate =>
      'Ваш уліковы запіс запланаваны на выдаленне. Калі ўвайсці да даты выдалення, яно будзе скасавана.';

  @override
  String get accountDeletionImmediateNotice =>
      'Мы выдаляем ваш уліковы запіс прама зараз. Калі ў вашага ўліковага запісу ёсць адрас электроннай пошты, мы напішам вам, калі ўсё будзе завершана.';

  @override
  String get accountDeletionImmediateNoticeNoEmail =>
      'Мы выдаляем ваш уліковы запіс прама зараз.';

  @override
  String get accountDisabledNotice =>
      'Ваш уліковы запіс адключаны. Увайдзіце зноў, калі захочаце ім карыстацца.';

  @override
  String splashStartupFailed(String error) {
    return 'Не ўдалося запусціць: $error';
  }

  @override
  String get retry => 'Паўтарыць';

  @override
  String get splashConnectionLost => 'Злучэнне страчана';

  @override
  String get splashViewOnStatusPage => 'Паглядзець на старонцы стану';

  @override
  String get splashConnectionIssuesPrompt => 'Праблемы са злучэннем?';

  @override
  String get splashStatusPageLink => 'Старонка стану';

  @override
  String get splashReadIncident => 'Прачытаць пра інцыдэнт';

  @override
  String get splashIncidentHistory => 'Гісторыя інцыдэнтаў';

  @override
  String get nagbarLearnMore => 'Даведацца больш';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'Тэхнічнае абслугоўванне запланавана на $localizedTime. Чаканая працягласць: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Ідзе тэхнічнае абслугоўванне. Чаканая працягласць: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'Тэхнічнае абслугоўванне завершана.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Прывітанне, $displayName! Замацуйце за сабой уліковы запіс, каб не страціць доступ.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Прывітанне, $displayName! Пацвердзіце, калі ласка, свой адрас электроннай пошты.';
  }

  @override
  String get verificationResendEmail => 'Адправіць ліст паўторна';

  @override
  String get verificationEmailSent =>
      'Ліст для пацвярджэння адпраўлены. Праверце паштовую скрыню.';

  @override
  String get verificationEmailRateLimited =>
      'Вы запыталі занадта шмат лістоў для пацвярджэння. Пачакайце крыху і паспрабуйце яшчэ раз.';

  @override
  String get nagbarOpenSettings => 'Адкрыць налады';

  @override
  String get systemPermissionSettingsTitle => 'Уключыце дазвол';

  @override
  String get systemPermissionSettingsOpenSettings => 'Адкрыць налады';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return 'У $productName няма доступу да вашага мікрафона. Яго можна ўключыць у наладах прыватнасці прылады.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return 'У $productName няма доступу да вашай камеры. Яго можна ўключыць у наладах прыватнасці прылады.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return 'У $productName няма доступу да вашай фотатэкі. Яго можна ўключыць у наладах прыватнасці прылады.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return 'У $productName няма дазволу адпраўляць апавяшчэнні. Яго можна ўключыць у наладах прылады.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Не ўдалося працягнуць вашу падпіску, але доступ да пераваг $productName у вас застаецца да $graceDate. Дзейнічайце зараз, інакш вы страціце ўсе перавагі.';
  }

  @override
  String nagbarPremiumGracePeriodNoAction(
    String productName,
    String graceDate,
  ) {
    return 'Не ўдалося працягнуць вашу падпіску $productName. Перавагі $productName застаюцца ў вас да $graceDate.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Тэрмін вашай падпіскі $productName скончыўся. Аднавіце яе зараз, каб захаваць перавагі.';
  }

  @override
  String nagbarPremiumExpiredNoAction(String productName) {
    return 'Тэрмін вашай падпіскі $productName скончыўся.';
  }

  @override
  String get nagbarManageSubscription => 'Кіраваць падпіскай';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Сардэчна запрашаем у $productFullName. Азнаёмцеся з перавагамі $productName і кіруйце падпіскай.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'Паглядзець функцыі $productName';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'У вашым інвентары падарункаў чакае новы падарункавы код.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'Новыя падарункавыя коды ў вашым інвентары падарункаў: $count.';
  }

  @override
  String get nagbarViewGiftInventory => 'Паглядзець інвентар падарункаў';

  @override
  String get nagbarVisionaryMfa =>
      'Уключыце двухфактарную аўтэнтыфікацыю, каб абараніць свой уліковы запіс Visionary.';

  @override
  String get nagbarEnableMfa => 'Уключыць 2FA';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Далучайцеся да $communityName, каб размаўляць з камандай і сачыць за навінамі.';
  }

  @override
  String nagbarGuildMfaRequirement(String communityName) {
    return 'Мадэрацыя ў $communityName патрабуе двухфактарнай аўтэнтыфікацыі. Уключыце 2FA, каб выганяць, баніць, даваць тайм-аўт або выдаляць паведамленні тут.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Далучыцца да $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'Уключыце апавяшчэнні, каб не прапускаць паведамленні і згадванні.';

  @override
  String get nagbarEnableNotifications => 'Уключыць апавяшчэнні';

  @override
  String get email => 'Электронная пошта';

  @override
  String get emailInvalid => 'Увядзіце правільны адрас электроннай пошты.';

  @override
  String get password => 'Пароль';

  @override
  String get forgotPassword => 'Забылі пароль?';

  @override
  String get logIn => 'Увайсці';

  @override
  String get logInWithPasskey => 'Увайсці з ключом доступу';

  @override
  String get signInWithBrowser => 'Увайсці праз браўзер';

  @override
  String get signInWithBrowserPasskeyHint =>
      'Каб выкарыстоўваць ключ доступу на гэтым экзэмпляры, увайдзіце праз браўзер.';

  @override
  String get browserSignInFailed =>
      'Не ўдалося ўвайсці праз браўзер. Паспрабуйце яшчэ раз.';

  @override
  String loginLegalAgreement(String links) {
    String _temp0 = intl.Intl.selectLogic(links, {
      'both':
          'Уваходзячы, вы згаджаецеся з <terms>Умовамі выкарыстання</terms> і <privacy>Палітыкай прыватнасці</privacy>.',
      'terms':
          'Уваходзячы, вы згаджаецеся з <terms>Умовамі выкарыстання</terms>.',
      'other':
          'Уваходзячы, вы згаджаецеся з <privacy>Палітыкай прыватнасці</privacy>.',
    });
    return '$_temp0';
  }

  @override
  String continueWithSso(String provider) {
    return 'Працягнуць праз $provider';
  }

  @override
  String get organizationSsoProvider =>
      'Увайдзіце праз сістэму адзінага ўваходу вашай арганізацыі.';

  @override
  String get failedToStartSso => 'Не ўдалося запусціць SSO';

  @override
  String get ssoCancelled => 'Уваход праз SSO скасаваны';

  @override
  String preferSso(String provider) {
    return 'Хочаце ўвайсці праз SSO? Працягніце праз $provider.';
  }

  @override
  String get needAccountPrompt => 'Няма ўліковага запісу? ';

  @override
  String get register => 'Зарэгістравацца';

  @override
  String loginHeading(String productName) {
    return 'Увайсці ў $productName';
  }

  @override
  String loginNewAccountPrompt(String productName) {
    return 'Упершыню ў $productName? ';
  }

  @override
  String get loginCreateAccountLink => 'Стварыць уліковы запіс';

  @override
  String get orDivider => 'АБО';

  @override
  String get cancel => 'Скасаваць';

  @override
  String get ipAuthCheckEmail => 'Праверце электронную пошту';

  @override
  String ipAuthDescription(String email) {
    return 'Мы адправілі на электронную пошту спасылку для аўтарызацыі гэтага ўваходу. Адкрыйце паштовую скрыню $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Злучэнне страчана';

  @override
  String get ipAuthConnectionLostDescription =>
      'Падчас чакання аўтарызацыі злучэнне страцілася. Паспрабуйце яшчэ раз.';

  @override
  String get ipAuthLinkExpired =>
      'Тэрмін дзеяння спасылкі для ўваходу скончыўся';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Тэрмін дзеяння гэтай спасылкі для аўтарызацыі скончыўся. Увайдзіце зноў.';

  @override
  String get ipAuthResendEmail => 'Адправіць ліст паўторна';

  @override
  String get ipAuthResent => 'Адпраўлена паўторна';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '$seconds с';
  }

  @override
  String get back => 'Назад';

  @override
  String get next => 'Далей';

  @override
  String get create => 'Стварыць';

  @override
  String get mfaTitle => 'Двухфактарная аўтэнтыфікацыя';

  @override
  String get mfaChooseMethod => 'Выберыце спосаб праверкі';

  @override
  String get mfaMethodTotp => 'Праграма-аўтэнтыфікатар';

  @override
  String get mfaMethodWebauthn => 'Ключ бяспекі / ключ доступу';

  @override
  String get mfaTotpDescription =>
      'Увядзіце 6-значны код з праграмы-аўтэнтыфікатара або адзін з рэзервовых кодаў.';

  @override
  String get mfaCodeLabel => 'Код';

  @override
  String get mfaTryAnotherMethod => 'Выкарыстаць іншы спосаб';

  @override
  String get mfaPasskeyUnavailable =>
      'Ключы доступу з гэтага экзэмпляра не працуюць у гэтай праграме, а іншых спосабаў праверкі ў вашым уліковым запісе няма. Увайдзіце праз браўзер.';

  @override
  String get mfaUseSecurityKey => 'Выкарыстаць ключ бяспекі / ключ доступу';

  @override
  String get mfaUseBackupCode => 'Выкарыстаць рэзервовы код';

  @override
  String get mfaUseAuthenticatorCode =>
      'Выкарыстаць код з праграмы-аўтэнтыфікатара';

  @override
  String get accountSelectorTitle => 'Выберыце ўліковы запіс';

  @override
  String get accountSelectorDescription =>
      'Выберыце ўліковы запіс, каб працягнуць, або дадайце іншы.';

  @override
  String get accountAdd => 'Дадаць уліковы запіс';

  @override
  String get accountRemoveDescription =>
      'Захаваны сеанс гэтага ўліковага запісу будзе выдалены.';

  @override
  String accountSignOutTitle(String identifier) {
    return 'Выйсці з уліковага запісу $identifier?';
  }

  @override
  String get accountExpired => 'Тэрмін дзеяння скончыўся';

  @override
  String accountSessionExpiredNotice(String name) {
    return 'Тэрмін дзеяння сеанса $name скончыўся. Увайдзіце зноў.';
  }

  @override
  String get accountManageTitle => 'Кіраваць уліковымі запісамі';

  @override
  String get accountSwitchFailed =>
      'Не ўдалося пераключыць уліковы запіс. Паспрабуйце яшчэ раз.';

  @override
  String get profileTabMenuSwitchAccounts => 'Пераключыць уліковы запіс';

  @override
  String get statusChangeSheetTitle => 'Задаць статус';

  @override
  String get statusOnlineStatusSection => 'Сеткавы статус';

  @override
  String get statusOnline => 'У сетцы';

  @override
  String get statusIdle => 'Неактыўны';

  @override
  String get statusDnd => 'Не турбаваць';

  @override
  String get statusInvisible => 'Нябачны';

  @override
  String get statusOffline => 'Не ў сетцы';

  @override
  String get statusUntilIChangeIt => 'Пакуль я не змяню';

  @override
  String get statusDontClear => 'Не ачышчаць';

  @override
  String get statusFor10Seconds => 'На 10 секунд';

  @override
  String get statusClearAfter10Seconds => '10 секунд';

  @override
  String get statusClearAfter15Minutes => '15 хвілін';

  @override
  String get statusClearAfter30Minutes => '30 хвілін';

  @override
  String get statusClearAfter1Hour => '1 гадзіна';

  @override
  String get statusClearAfter3Hours => '3 гадзіны';

  @override
  String get statusClearAfter4Hours => '4 гадзіны';

  @override
  String get statusClearAfter8Hours => '8 гадзін';

  @override
  String get statusClearAfter24Hours => '24 гадзіны';

  @override
  String get statusClearAfter3Days => '3 дні';

  @override
  String get statusDndDescription =>
      'Вы не будзеце атрымліваць апавяшчэнні на камп’ютары';

  @override
  String get statusInvisibleDescription => 'Для іншых вы будзеце не ў сетцы';

  @override
  String get customStatusSetTitle => 'Задаць уласны статус';

  @override
  String get customStatusCurrentHint => 'Уласны статус';

  @override
  String get customStatusClear => 'Ачысціць уласны статус';

  @override
  String get customStatusPlaceholder => 'Што адбываецца?';

  @override
  String get customStatusChooseEmoji => 'Выберыце эмоджы';

  @override
  String get customStatusClearAfter => 'Ачысціць праз';

  @override
  String get customStatusSave => 'Захаваць';

  @override
  String get accountActive => 'Актыўны ўліковы запіс';

  @override
  String get signOut => 'Выйсці';

  @override
  String get suspendedTemporaryTitle => 'Дзеянне ўліковага запісу прыпынена';

  @override
  String get suspendedBannedTitle => 'Уліковы запіс забанены';

  @override
  String get suspendedClosedTitle => 'Уліковы запіс закрыты';

  @override
  String get suspendedWhatHappened => 'Што адбылося';

  @override
  String get suspendedWhy => 'Чаму';

  @override
  String get suspendedHowWeDecided => 'Як мы прымалі рашэнне';

  @override
  String get suspendedHowToAppeal => 'Як абскардзіць';

  @override
  String suspendedNoteFromTeam(String statement) {
    return 'Заўвага нашай каманды: $statement';
  }

  @override
  String suspendedDecisionId(String decisionId) {
    return 'ID рашэння: $decisionId';
  }

  @override
  String suspendedRule(String title) {
    return 'Правіла: $title';
  }

  @override
  String suspendedAppealNoDeadline(String email) {
    return 'Калі вы лічыце, што мы памыліліся, напішыце на $email і ўкажыце сваё імя карыстальніка.';
  }

  @override
  String suspendedAppealNoEmail(String email, String deadline) {
    return 'Калі вы лічыце, што мы памыліліся, напішыце на $email да $deadline. Укажыце ID рашэння і сваё імя карыстальніка. Апеляцыі бясплатныя, і кожную з іх разглядае чалавек.';
  }

  @override
  String suspendedAppealWithEmail(String email, String deadline) {
    return 'Калі вы лічыце, што мы памыліліся, напішыце на $email да $deadline. Па магчымасці пішыце з адраса электроннай пошты вашага ўліковага запісу і ўкажыце ID рашэння. Апеляцыі бясплатныя, і кожную з іх разглядае чалавек.';
  }

  @override
  String suspendedDeletionRequest(String email) {
    return 'Каб папрасіць нас выдаліць ваш уліковы запіс і даныя, напішыце на $email з адраса вашага ўліковага запісу.';
  }

  @override
  String suspendedDeletionRequestNoEmail(String email) {
    return 'Каб папрасіць нас выдаліць ваш уліковы запіс і даныя, напішыце на $email і ўкажыце сваё імя карыстальніка.';
  }

  @override
  String get suspendedBackToLogin => 'Назад да ўваходу';

  @override
  String get forgotPasswordTitle => 'Забылі пароль?';

  @override
  String get forgotPasswordDescription =>
      'Увядзіце свой адрас электроннай пошты, і мы адправім вам спасылку для скіду пароля.';

  @override
  String get forgotPasswordSubmit => 'Адправіць спасылку для скіду';

  @override
  String get forgotPasswordSentTitle => 'Праверце электронную пошту';

  @override
  String get forgotPasswordSentDescription =>
      'Мы адправілі інструкцыі па скідзе пароля на ваш адрас электроннай пошты. Праверце паштовую скрыню і перайдзіце па спасылцы, каб скінуць пароль.';

  @override
  String get forgotPasswordBackToLogin => 'Вярнуцца да ўваходу';

  @override
  String get resetPasswordTitle => 'Задаць новы пароль';

  @override
  String get resetPasswordDescription =>
      'Увядзіце новы пароль ніжэй, каб завяршыць скід.';

  @override
  String get resetPasswordNewPassword => 'Новы пароль';

  @override
  String get resetPasswordConfirm => 'Пацвердзіце новы пароль';

  @override
  String get resetPasswordSubmit => 'Скінуць пароль';

  @override
  String get resetPasswordMismatch => 'Паролі не супадаюць.';

  @override
  String get recoverAccountTitle => 'Аднавіце ўліковы запіс';

  @override
  String get recoverAccountDescription =>
      'Увядзіце імя карыстальніка і ключ аднаўлення з набору для аднаўлення, а потым задайце новы пароль.';

  @override
  String get recoverAccountNoKit =>
      'Няма набору для аднаўлення? Папрасіце адміністратара гэтага экзэмпляра даслаць спасылку для скіду пароля.';

  @override
  String get recoveryKitTitle => 'Ваш набор для аднаўлення';

  @override
  String get recoveryKitCreatedDescription =>
      'Калі вы забудзеце пароль, гэты набор будзе адзіным спосабам вярнуць доступ да ўліковага запісу. Захоўвайце яго ў надзейным месцы, напрыклад у менеджары пароляў або ў надрукаваным выглядзе.';

  @override
  String get recoveryKitReplacedDescription =>
      'Ваш стары набор для аднаўлення больш не дзейнічае. Захоўвайце гэты новы ў надзейным месцы.';

  @override
  String get recoveryKitRecoveredDescription =>
      'Ваш пароль скінуты. Ваш стары набор для аднаўлення больш не дзейнічае. Захоўвайце гэты новы ў надзейным месцы.';

  @override
  String get recoveryKitWarning =>
      'Кожны, хто мае гэты ключ, можа скінуць ваш пароль. Ніколі нікому яго не перадавайце.';

  @override
  String get recoveryKitKeyLabel => 'Ключ аднаўлення';

  @override
  String recoveryKitDocumentTitle(String productName) {
    return 'Набор для аднаўлення $productName';
  }

  @override
  String get recoveryKitDocumentIntro =>
      'Захоўвайце гэту старонку ў надзейным месцы. Калі вы забудзеце пароль, з яе дапамогай можна будзе вярнуць доступ да ўліковага запісу. Любы, у каго ёсць гэты ключ аднаўлення, можа скінуць ваш пароль, таму нікому яго не паказвайце.';

  @override
  String get recoveryKitInstanceLabel => 'Экзэмпляр';

  @override
  String get recoveryKitCreatedAtLabel => 'Створана';

  @override
  String get recoveryKitQrCaption =>
      'Адсканіруйце, каб адкрыць старонку аднаўлення з ужо запоўненымі звесткамі.';

  @override
  String get recoveryKitStepsTitle => 'Як аднавіць уліковы запіс';

  @override
  String recoveryKitStepOpen(String recoverUrl) {
    return 'Перайдзіце па адрасе $recoverUrl або адсканіруйце QR-код.';
  }

  @override
  String get recoveryKitStepEnter =>
      'Увядзіце сваё імя карыстальніка і гэты ключ аднаўлення.';

  @override
  String get recoveryKitStepPassword =>
      'Прыдумайце новы пароль. Вы атрымаеце новы набор для аднаўлення, а гэты перастане працаваць.';

  @override
  String get recoveryKitBackupCodesTitle =>
      'Рэзервовыя коды двухфактарнай аўтэнтыфікацыі';

  @override
  String get recoveryKitBackupCodesNote =>
      'Кожны код можна выкарыстаць адзін раз замест праграмы-аўтэнтыфікатара.';

  @override
  String get recoveryKitBackupCodesFailed =>
      'Не ўдалося загрузіць рэзервовыя коды.';

  @override
  String get recoveryKitIncludeBackupCodes =>
      'Дадаць мае рэзервовыя коды двухфактарнай аўтэнтыфікацыі ў захаваную выяву';

  @override
  String get recoveryKitCopy => 'Скапіраваць';

  @override
  String get recoveryKitCopied => 'Ключ аднаўлення скапіраваны';

  @override
  String get recoveryKitSaveImage => 'Захаваць выяву';

  @override
  String get recoveryKitSaved => 'Набор для аднаўлення захаваны';

  @override
  String get recoveryKitSavedToPhotos =>
      'Набор для аднаўлення захаваны ў «Фота»';

  @override
  String get recoveryKitSaveFailed =>
      'Не ўдалося захаваць набор для аднаўлення. Паспрабуйце яшчэ раз або скапіруйце ключ.';

  @override
  String get recoveryKitAcknowledge =>
      'Мой набор для аднаўлення захаваны ў надзейным месцы';

  @override
  String get recoveryKitCreateFailed =>
      'Не ўдалося стварыць ваш набор для аднаўлення. Яго можна стварыць пазней у наладах уліковага запісу.';

  @override
  String get recoveryKitSectionTitle => 'Набор для аднаўлення';

  @override
  String get recoveryKitSectionDescription =>
      'Дазваляе скінуць пароль, калі вы яго забудзеце.';

  @override
  String get recoveryKitNone => 'У вас пакуль няма набору для аднаўлення';

  @override
  String recoveryKitCreatedRelative(String time) {
    return 'Створаны $time';
  }

  @override
  String get recoveryKitCreate => 'Стварыць набор для аднаўлення';

  @override
  String get recoveryKitCreateNew => 'Стварыць новы набор';

  @override
  String get recoveryKitReplaceTitle => 'Стварыць новы набор для аднаўлення?';

  @override
  String get recoveryKitReplaceDescription =>
      'Ваш цяперашні набор перастане дзейнічаць, як толькі будзе створаны новы.';

  @override
  String get recoveryKitReminderTitle => 'Захавайце набор для аднаўлення';

  @override
  String get recoveryKitReminderBody =>
      'У вашага ўліковага запісу няма адраса электроннай пошты. Калі вы забудзеце пароль, вярнуць доступ можна будзе толькі з набору для аднаўлення. Гэта зойме ўсяго хвіліну.';

  @override
  String get registerUsernameSignInHint =>
      'Вы ўваходзіце з гэтым імем карыстальніка. Выберыце такое, якое запомніце.';

  @override
  String get registerUsernameTaken => 'Гэта імя карыстальніка ўжо занятае';

  @override
  String get registerUsernameAvailable => 'Гэта імя карыстальніка вольнае';

  @override
  String get claimAccountUsernameDescription =>
      'Замацуйце за сабой уліковы запіс, выбраўшы імя карыстальніка і пароль. З імі вы будзеце ўваходзіць, таму выберыце такія, якія запомніце.';

  @override
  String get unclaimedAccountDescriptionUsername =>
      'Ваш уліковы запіс яшчэ не замацаваны. Без імені карыстальніка і пароля вы не зможаце ўваходзіць з іншых прылад і можаце страціць доступ да ўліковага запісу. Замацуйце яго за сабой зараз, каб абараніць.';

  @override
  String get registerTitle => 'Стварыць уліковы запіс';

  @override
  String get registerDisplayName => 'Бачнае імя (неабавязкова)';

  @override
  String get registerDisplayNameHint => 'Як вас называць?';

  @override
  String get registerUsername => 'Імя карыстальніка (неабавязкова)';

  @override
  String get registerUsernameHint =>
      'Пакіньце пустым, каб атрымаць выпадковае імя карыстальніка';

  @override
  String get registerUsernameTagHint =>
      'Для ўнікальнасці аўтаматычна дададзецца 4-значны тэг';

  @override
  String get registerDateOfBirth => 'Дата нараджэння';

  @override
  String get registerDateOfBirthDone => 'Гатова';

  @override
  String get registerDateOfBirthNotSet => 'Не зададзены';

  @override
  String get registerMonth => 'Месяц';

  @override
  String get registerDay => 'Дзень';

  @override
  String get registerYear => 'Год';

  @override
  String registerConsentLinks(String links) {
    String _temp0 = intl.Intl.selectLogic(links, {
      'both':
          'Я згаджаюся з <terms>Умовамі выкарыстання</terms> і <privacy>Палітыкай прыватнасці</privacy>',
      'terms': 'Я згаджаюся з <terms>Умовамі выкарыстання</terms>',
      'other': 'Я згаджаюся з <privacy>Палітыкай прыватнасці</privacy>',
    });
    return '$_temp0';
  }

  @override
  String get registerConsentBuiltInRules =>
      'Я згаджаюся, што на гэтым экзэмпляры не цярпяць непрымальнага змесціва і карыстальнікаў, якія абражаюць іншых, і што яго адміністратары могуць выдаляць змесціва і ўліковыя запісы, якія парушаюць гэтыя правілы.';

  @override
  String get registerConfirmPassword => 'Пацвердзіце пароль';

  @override
  String get registerSubmit => 'Стварыць уліковы запіс';

  @override
  String get registerHaveAccount => 'Ужо ёсць уліковы запіс? ';

  @override
  String get registerPendingApproval =>
      'Ваш запыт на ўліковы запіс чакае ўхвалення. Увайсці можна будзе пасля таго, як адміністратар яго ўхваліць.';

  @override
  String get registerClosed =>
      'Рэгістрацыя зараз закрыта. Каб стварыць уліковы запіс, выкарыстайце спасылку для рэгістрацыі ад адміністратара.';

  @override
  String get passkeyNoCredentials =>
      'Ключы доступу для гэтай праграмы не знойдзены. Увайдзіце з электроннай поштай і паролем.';

  @override
  String get passkeyNoCredentialsForAccount =>
      'На гэтай прыладзе няма ключа доступу для гэтага ўліковага запісу. Выкарыстайце прыладу або менеджар пароляў, дзе вы яго захавалі.';

  @override
  String get passkeyDeviceNotSupported =>
      'Ключы доступу не падтрымліваюцца на гэтай прыладзе.';

  @override
  String get passkeyDomainNotAssociated =>
      'Ключы доступу не наладжаны для гэтай праграмы. Увайдзіце з электроннай поштай і паролем.';

  @override
  String get passkeyTimeout =>
      'Час чакання аўтэнтыфікацыі праз ключ доступу скончыўся. Паспрабуйце яшчэ раз.';

  @override
  String get passkeyFailed =>
      'Не ўдалося прайсці аўтэнтыфікацыю праз ключ доступу. Паспрабуйце яшчэ раз.';

  @override
  String get errorUnableToCreateAccount =>
      'Не ўдалося стварыць уліковы запіс. Паспрабуйце яшчэ раз.';

  @override
  String get errorUnableToSignIn =>
      'Зараз не ўдаецца ўвайсці. Паспрабуйце яшчэ раз.';

  @override
  String get errorServiceUnavailable =>
      'Гэты экзэмпляр часова недаступны. Паспрабуйце яшчэ раз праз хвіліну.';

  @override
  String get errorInvalidEmailOrPassword =>
      'Няправільная электронная пошта або пароль.';

  @override
  String get errorInvalidUsernameOrPassword =>
      'Няправільнае імя карыстальніка або пароль.';

  @override
  String get errorUnableToSendResetLink =>
      'Не ўдалося адправіць спасылку для скіду. Паспрабуйце яшчэ раз.';

  @override
  String get errorUnableToResetPassword =>
      'Не ўдалося скінуць пароль. Паспрабуйце яшчэ раз.';

  @override
  String get embedInviteJoin => 'Далучыцца да суполкі';

  @override
  String get embedInviteGoTo => 'Перайсці ў суполку';

  @override
  String embedInviteOnline(String count) {
    return '$count у сетцы';
  }

  @override
  String embedInviteMembers(int count, String formattedCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$formattedCount удзельніка',
      many: '$formattedCount удзельнікаў',
      few: '$formattedCount удзельнікі',
      one: '$formattedCount удзельнік',
    );
    return '$_temp0';
  }

  @override
  String get embedInviteUnknownTitle => 'Невядомае запрашэнне';

  @override
  String get embedInviteUnknownSubtitle =>
      'Паспрабуйце папрасіць новае запрашэнне.';

  @override
  String get embedInviteUnavailable => 'Запрашэнне недаступнае';

  @override
  String get embedInviteJoinGroup => 'Далучыцца да групы';

  @override
  String get embedInviteAlreadyJoined => 'Вы ўжо далучыліся';

  @override
  String get embedInviteDisabled => 'Запрашэнні адключаны';

  @override
  String get embedInvitePaused => 'Запрашэнні ў гэту суполку прыпынены.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName выявіў магчымы рэйд, таму новыя карыстальнікі зараз не могуць далучыцца.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Гэта суполка прыпыніла запрашэнні. Можна паспрабаваць пазней.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName выявіў магчымы рэйд у гэтай суполцы. Запрашэнні прыпынены, таму новыя карыстальнікі зараз не могуць далучыцца.';
  }

  @override
  String get inviteAcceptTitle => 'Вас запрасілі далучыцца да';

  @override
  String get inviteAcceptJoinButton => 'Далучыцца да суполкі';

  @override
  String get inviteAcceptGoToButton => 'Перайсці ў суполку';

  @override
  String get inviteAcceptInvitesPaused => 'Запрашэнні прыпынены';

  @override
  String get inviteAcceptNotFoundTitle => 'Запрашэнне не знойдзена';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Магчыма, тэрмін дзеяння гэтага запрашэння скончыўся або яго выдалілі.';

  @override
  String get invalidDeepLinkTitle => 'Не ўдалося адкрыць спасылку';

  @override
  String get invalidDeepLinkDescription =>
      'Магчыма, гэта спасылка пашкоджаная, даступная толькі ў вэб-версіі, або ў вас няма доступу. Праверце спасылку і паспрабуйце яшчэ раз.';

  @override
  String get invalidDeepLinkGoHomeButton => 'На галоўную';

  @override
  String get inviteAcceptJoinGroupButton => 'Далучыцца да групы';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Запрашэнне ў групавы чат ад $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'хтосьці';

  @override
  String get mentionUnknownChannel => 'невядомы-канал';

  @override
  String get channelAccessDeniedTitle => 'Доступ да канала забаронены';

  @override
  String get channelAccessDeniedDescription =>
      'У вас няма доступу да канала, у які адпраўлена гэта паведамленне.';

  @override
  String get messageJumpLinkNoAccess => 'Няма доступу';

  @override
  String get okay => 'Добра';

  @override
  String get embedThemeTitle => 'Абагуленая тэма';

  @override
  String get embedThemeWebOnly =>
      'Імпартаваць тэмы можна толькі ў вэб-версіі або на камп’ютары.';

  @override
  String embedGiftVisionaryLifetime(String productName) {
    return 'Visionary ($productName назаўсёды)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дня $productName',
      many: '$count дзён $productName',
      few: '$count дні $productName',
      one: '$count дзень $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count тыдня $productName',
      many: '$count тыдняў $productName',
      few: '$count тыдні $productName',
      one: '$count тыдзень $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count месяца $productName',
      many: '$count месяцаў $productName',
      few: '$count месяцы $productName',
      one: '$count месяц $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count года $productName',
      many: '$count гадоў $productName',
      few: '$count гады $productName',
      one: '$count год $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'Ад $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'Націсніце, каб атрымаць падарунак!';

  @override
  String get embedGiftAlreadyRedeemed => 'Ужо актывавана';

  @override
  String get embedGiftClaimAccountHelp =>
      'Каб актываваць гэты падарунак, замацуйце за сабой уліковы запіс.';

  @override
  String get embedGiftClaim => 'Атрымаць падарунак';

  @override
  String get embedGiftClaimAccount =>
      'Замацаваць уліковы запіс, каб актываваць';

  @override
  String get embedGiftUnknownTitle => 'Невядомы падарунак';

  @override
  String get embedGiftUnknownSubtitle =>
      'Гэты падарункавы код няправільны або ўжо выкарыстаны.';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Атрымайце падарунак, каб актываваць падпіску $productName!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'Гэты падарунак ужо атрыманы.';

  @override
  String get giftAcceptLifetimeNotInApp =>
      'Гэты падарунак нельга атрымаць у праграме для iOS. Атрымаць яго можна ў настольнай праграме.';

  @override
  String get giftAcceptMaybeLater => 'Можа, пазней';

  @override
  String get giftRedeemedToast => 'Падарунак актываваны!';

  @override
  String get giftRedeemInvalidTitle => 'Няправільны падарункавы код';

  @override
  String get giftRedeemInvalidMessage =>
      'Гэты код няправільны або ўжо выкарыстаны.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Падарунак ужо актываваны';

  @override
  String get giftRedeemAlreadyRedeemedMessage => 'Гэты код ужо актываваны.';

  @override
  String get giftRedeemNotFoundTitle => 'Падарунак не знойдзены';

  @override
  String get giftRedeemNotFoundMessage => 'Такога кода не існуе.';

  @override
  String get giftRedeemFailedTitle => 'Не ўдалося актываваць падарунак';

  @override
  String get giftRedeemFailedMessage =>
      'Не ўдалося актываваць гэты падарунак. Паспрабуйце яшчэ раз.';

  @override
  String get giftVisionaryCannotRedeemTitle =>
      'Не ўдаецца актываваць гэты падарунак';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Уліковыя запісы Visionary не могуць актываваць падарункі Plutonium. Замест гэтага скапіруйце спасылку і падзяліцеся ёю з сябрам.';

  @override
  String get giftCopyLink => 'Скапіраваць спасылку на падарунак';

  @override
  String get privacySettings => 'Налады прыватнасці';

  @override
  String get privacyDirectMessages => 'Асабістыя паведамленні';

  @override
  String get privacyDirectMessagesDescription =>
      'Дазволіць асабістыя паведамленні ад іншых удзельнікаў гэтай суполкі';

  @override
  String get privacyBotDirectMessages => 'Асабістыя паведамленні ад ботаў';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Дазволіць ботам з гэтай суполкі пісаць вам асабістыя паведамленні';

  @override
  String get privacyMutualDmsDisabled =>
      'Адміністратары суполкі забаранілі асабістыя паведамленні ад удзельнікаў, з якімі ў вас агульная толькі гэта суполка.';

  @override
  String get communityDebug => 'Адладка суполкі';

  @override
  String get copiedToClipboard => 'Скапіравана ў буфер абмену';

  @override
  String get notificationSettings => 'Налады апавяшчэнняў';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Заглушыць $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Калі заглушыць суполку, яе значок непрачытаных знікне, а апавяшчэнні не будуць прыходзіць';

  @override
  String get notificationCommunitySettings => 'Налады апавяшчэнняў суполкі';

  @override
  String get notificationAllMessages => 'Усе паведамленні';

  @override
  String get notificationOnlyMentions => 'Толькі згадванні';

  @override
  String get notificationNothing => 'Нічога';

  @override
  String get notificationSuppressEveryone => 'Заглушыць @everyone і @here';

  @override
  String get notificationSuppressRoles => 'Заглушыць усе @згадванні роляў';

  @override
  String get notificationMobilePush => 'Мабільныя push-апавяшчэнні';

  @override
  String get notificationOverrides => 'Перавызначэнні апавяшчэнняў';

  @override
  String get notificationSelectChannel => 'Выберыце канал або катэгорыю';

  @override
  String get notificationOnlyAtMentions => 'Толькі @згадванні';

  @override
  String get notificationMuteChannel => 'Заглушыць канал';

  @override
  String get notificationUnmuteChannel => 'Уключыць апавяшчэнні канала';

  @override
  String get notificationUseCategoryDefault => 'Як у катэгорыі';

  @override
  String get notificationUseCommunityDefault => 'Як у суполцы';

  @override
  String get notificationNoCategory => 'Без катэгорыі';

  @override
  String get dmMarkAsRead => 'Пазначыць як прачытанае';

  @override
  String get dmMuteConversation => 'Заглушыць асабісты чат';

  @override
  String get dmUnmuteConversation => 'Уключыць апавяшчэнні асабістага чата';

  @override
  String get dmPinDm => 'Замацаваць асабісты чат';

  @override
  String get dmUnpinDm => 'Адмацаваць асабісты чат';

  @override
  String get dmAlwaysShowInSidebar => 'Заўсёды паказваць на бакавой панэлі';

  @override
  String get dmRemoveFromAlwaysShown => 'Прыбраць з «Заўсёды паказваць»';

  @override
  String get dmCloseDm => 'Закрыць асабісты чат';

  @override
  String get dmCloseDmConfirmTitle => 'Закрыць асабісты чат';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Вы сапраўды хочаце закрыць асабісты чат з $username? Яго заўсёды можна зноў адкрыць пазней.';
  }

  @override
  String get dmDeleteMyMessagesTitle =>
      'Выдаліць вашы паведамленні ў гэтай размове?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Будуць назаўсёды выдалены ўсе паведамленні, якія вы калі-небудзь адпраўлялі ў гэтай размове. Гэта дзеянне нельга адмяніць.';

  @override
  String get dmCopyChannelId => 'Скапіраваць ID канала';

  @override
  String get dmChannelIdCopied => 'ID канала скапіраваны';

  @override
  String get dmCopyUserId => 'Скапіраваць ID карыстальніка';

  @override
  String get dmUserIdCopied => 'ID карыстальніка скапіраваны';

  @override
  String get dmViewProfile => 'Паглядзець профіль';

  @override
  String get dmVoiceCall => 'Пачаць галасавы выклік';

  @override
  String get incomingVoiceCallTitle => 'Уваходны галасавы выклік';

  @override
  String get incomingVoiceCallSubtitle => 'Галасавы выклік';

  @override
  String get incomingVoiceCallAccept => 'Прыняць';

  @override
  String get incomingVoiceCallDecline => 'Адхіліць';

  @override
  String get incomingVoiceCallLabel => 'Уваходны выклік';

  @override
  String get incomingVoiceCallNotificationChannel => 'Incoming calls';

  @override
  String get missedVoiceCallNotificationChannel => 'Missed calls';

  @override
  String get incomingVoiceCallIgnore => 'Ігнараваць';

  @override
  String get directVoiceCallNotEligible =>
      'Гэты выклік зараз нельга пачаць. Паспрабуйце яшчэ раз праз хвіліну.';

  @override
  String get voiceJoinCallFailed =>
      'Не ўдалося падключыцца да гэтага выкліку. Праверце злучэнне і паспрабуйце яшчэ раз.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Не ўдалося далучыцца да гэтага выкліку. Праверце злучэнне і паспрабуйце яшчэ раз.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Не ўдалося абнавіць гэты выклік на серверы. Праверце злучэнне і паспрабуйце яшчэ раз.';

  @override
  String get dmAddNote => 'Дадаць нататку';

  @override
  String get dmEditGroup => 'Рэдагаваць групу';

  @override
  String get dmInviteToCommunity => 'Запрасіць у суполку';

  @override
  String get dmBlock => 'Заблакіраваць';

  @override
  String get dmLeaveGroup => 'Пакінуць групу';

  @override
  String dmInviteSentFor(String communityName) {
    return 'Запрашэнне ў $communityName адпраўлена';
  }

  @override
  String get dmInviteSendFailed =>
      'Не ўдалося адправіць запрашэнне. Паспрабуйце яшчэ раз.';

  @override
  String dmGroupMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count удзельніка',
      many: '$count удзельнікаў',
      few: '$count удзельнікі',
      one: '$count удзельнік',
    );
    return '$_temp0';
  }

  @override
  String get dmMuteFor15Min => 'На 15 хвілін';

  @override
  String get dmMuteFor30Min => 'На 30 хвілін';

  @override
  String get dmMuteFor1Hour => 'На 1 гадзіну';

  @override
  String get dmMuteFor3Hours => 'На 3 гадзіны';

  @override
  String get dmMuteFor4Hours => 'На 4 гадзіны';

  @override
  String get dmMuteFor8Hours => 'На 8 гадзін';

  @override
  String get dmMuteFor24Hours => 'На 24 гадзіны';

  @override
  String get dmMuteFor3Days => 'На 3 дні';

  @override
  String get dmMuteForever => 'Пакуль я зноў не ўключу';

  @override
  String get dmPinGroupDm => 'Замацаваць групавы чат';

  @override
  String get dmUnpinGroupDm => 'Адмацаваць групавы чат';

  @override
  String get dmUnnamedGroup => 'Група без назвы';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'Група карыстальніка $resolvedName';
  }

  @override
  String get dmFavoriteDm => 'Дадаць асабісты чат у абранае';

  @override
  String get dmUnfavoriteDm => 'Прыбраць асабісты чат з абранага';

  @override
  String get dmFavoriteGroupDm => 'Дадаць групавы чат у абранае';

  @override
  String get dmUnfavoriteGroupDm => 'Прыбраць групавы чат з абранага';

  @override
  String get dmChangeFriendNickname => 'Змяніць псеўданім сябра';

  @override
  String get dmRemoveFriend => 'Выдаліць з сяброў';

  @override
  String get dmAddFriend => 'Дадаць у сябры';

  @override
  String get dmAcceptFriendRequest => 'Прыняць запыт у сябры';

  @override
  String get dmIgnoreFriendRequest => 'Ігнараваць запыт у сябры';

  @override
  String get dmFriendRequestSent => 'Запыт у сябры адпраўлены';

  @override
  String get dmUnblock => 'Разблакіраваць';

  @override
  String get dmDebugUser => 'Адладка карыстальніка';

  @override
  String get dmDebugChannel => 'Адладка канала';

  @override
  String get dmDebugCategory => 'Адладка катэгорыі';

  @override
  String get dmPinned => 'Асабісты чат замацаваны';

  @override
  String get dmUnpinned => 'Асабісты чат адмацаваны';

  @override
  String get dmMuted => 'Асабісты чат заглушаны';

  @override
  String get dmUnmuted => 'Заглушэнне асабістага чата знята';

  @override
  String get dmRemoveFriendConfirmTitle => 'Выдаліць з сяброў';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Вы сапраўды хочаце выдаліць $username з сяброў?';
  }

  @override
  String get dmBlockConfirmTitle => 'Заблакіраваць карыстальніка';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Вы сапраўды хочаце заблакіраваць $username? Гэты карыстальнік не зможа пісаць вам і адпраўляць запыты ў сябры.';
  }

  @override
  String get dmFriendRequestSentToast => 'Запыт у сябры адпраўлены';

  @override
  String get dmAddFriends => 'Дадаць сяброў';

  @override
  String get addFriendSheetTitle => 'Дадаць у сябры';

  @override
  String get addFriendUsernameLabel => 'Імя карыстальніка сябра';

  @override
  String get addFriendSendRequest => 'Адправіць запыт';

  @override
  String get addFriendNoUserFound => 'Карыстальнік з такім імем не знойдзены.';

  @override
  String get addFriendInvalidUsername =>
      'Увядзіце імя карыстальніка, потым # і 4-значны тэг.';

  @override
  String get addFriendOutgoingSuccess => 'Запыт у сябры адпраўлены';

  @override
  String get addFriendClaimTitle => 'Замацуйце за сабой уліковы запіс';

  @override
  String get addFriendClaimDescription =>
      'Замацуйце за сабой уліковы запіс, каб адпраўляць запыты ў сябры.';

  @override
  String get addFriendVerifyTitle => 'Пацвердзіце электронную пошту';

  @override
  String get addFriendVerifyDescription =>
      'Каб адпраўляць запыты ў сябры, трэба пацвердзіць адрас электроннай пошты.';

  @override
  String get addFriendVerifyEmail => 'Пацвердзіць электронную пошту';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Уваходныя запыты ў сябры ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Выходныя запыты ў сябры ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Уваходны запыт у сябры';

  @override
  String get addFriendOutgoingStatus => 'Запыт у сябры адпраўлены';

  @override
  String get addFriendViewProfile => 'Паглядзець профіль';

  @override
  String get addFriendAccept => 'Прыняць';

  @override
  String get addFriendIgnore => 'Ігнараваць';

  @override
  String get addFriendAcceptTitle => 'Прыняць запыт у сябры';

  @override
  String get addFriendIgnoreTitle => 'Ігнараваць запыт у сябры';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Прыняць запыт у сябры ад $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Ігнараваць запыт у сябры ад $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Скасаваць запыт';

  @override
  String get addFriendCancelRequestFailed =>
      'Не ўдалося скасаваць запыт у сябры. Паспрабуйце яшчэ раз.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Гэты чалавек зараз не прымае запыты ў сябры.';

  @override
  String get addFriendUnblockFirst =>
      'Каб адправіць запыт у сябры, спачатку разблакіруйце карыстальніка.';

  @override
  String get addFriendCannotSendToSelf =>
      'Нельга адправіць запыт у сябры сабе.';

  @override
  String get addFriendAlreadyFriends =>
      'Вы ўжо сябруеце з гэтым карыстальнікам.';

  @override
  String get addFriendClaimToSend =>
      'Завяршыце рэгістрацыю, каб адпраўляць запыты ў сябры.';

  @override
  String get addFriendVerifyToSend =>
      'Пацвердзіце электронную пошту, перш чым адпраўляць запыты ў сябры.';

  @override
  String get addFriendFriendsListFull =>
      'Ваш спіс сяброў або спіс іншага чалавека запоўнены. Выдаліце кагосьці і паспрабуйце яшчэ раз.';

  @override
  String get addFriendSendFailedTitle => 'Не ўдалося адправіць запыт у сябры';

  @override
  String get addFriendSendFailedMessage =>
      'Не ўдалося адправіць запыт у сябры. Паспрабуйце яшчэ раз.';

  @override
  String get userTagBot => 'БОТ';

  @override
  String get userTagSystem => 'Сістэма';

  @override
  String get userTagOp => 'ТС';

  @override
  String get emojiSearchPlaceholder => 'Знайдзіце эмоджы сваёй мары';

  @override
  String get emojiSearchEmpty => 'Па вашым запыце эмоджы не знойдзены';

  @override
  String get emojiAutocompleteDefaultLabel => 'Стандартнае эмоджы';

  @override
  String emojiInfoDefaultDescription(String productName) {
    return 'Гэта стандартнае эмоджы ў $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'Гэта эмоджы з гэтай суполкі. Вы можаце выкарыстоўваць яго паўсюль.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'Гэта ўласнае эмоджы з суполкі.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'Гэта ўласнае эмоджы з суполкі. Каб выкарыстоўваць яго, папрасіце ў аўтара запрашэнне.';

  @override
  String get emojiInfoFromHeader => 'Гэта эмоджы з';

  @override
  String get emojiInfoDiscoverableCommunity => 'У раздзеле «Агляд»';

  @override
  String get emojiInfoPrivateCommunity => 'Прыватная суполка';

  @override
  String get emojiInfoVerifiedCommunity => 'Пацверджаная суполка';

  @override
  String get emojiInfoAddToFavorites => 'Дадаць у абранае';

  @override
  String get emojiInfoRemoveFromFavorites => 'Прыбраць з абранага';

  @override
  String get emojiFrequentlyUsed => 'Часта ўжываныя';

  @override
  String get emojiTabGifs => 'GIF';

  @override
  String get emojiTabMedia => 'Медыя';

  @override
  String get emojiTabStickers => 'Стыкеры';

  @override
  String get emojiTabEmojis => 'Эмоджы';

  @override
  String get gifPickerSearch => 'Пошук GIF';

  @override
  String get gifPickerSearchKlipy => 'Пошук у Klipy';

  @override
  String get gifPickerSearchTenor => 'Пошук у Tenor';

  @override
  String get gifPickerFavorites => 'Абранае';

  @override
  String get gifPickerFavoritesEmptyTitle => 'Пакуль няма абраных GIF';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Дадайце GIF у абранае, каб убачыць яго тут.';

  @override
  String get gifPickerTrending => 'Папулярныя GIF';

  @override
  String get gifPickerNoResultsTitle => 'Няма вынікаў пошуку';

  @override
  String get gifPickerNoResultsDescription => 'Паспрабуйце іншы пошукавы запыт';

  @override
  String get gifPickerLoadFailedTitle => 'Не ўдалося загрузіць GIF';

  @override
  String get gifPickerLoadFailedBody =>
      'Праверце злучэнне і паспрабуйце яшчэ раз.';

  @override
  String get emojiCategoryPeople => 'Людзі';

  @override
  String get emojiCategoryNature => 'Прырода';

  @override
  String get emojiCategoryFood => 'Ежа і напоі';

  @override
  String get emojiCategoryActivity => 'Актыўнасці';

  @override
  String get emojiCategoryTravel => 'Падарожжы і месцы';

  @override
  String get emojiCategoryObjects => 'Прадметы';

  @override
  String get emojiCategorySymbols => 'Сімвалы';

  @override
  String get emojiCategoryFlags => 'Сцягі';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Адкрыйце $emojiCount з $communityCount з Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellDismiss => 'Больш не паказваць';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count уласнага эмоджы',
      many: '$count уласных эмоджы',
      few: '$count уласныя эмоджы',
      one: '$count уласнае эмоджы',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count суполкі',
      many: '$count суполак',
      few: '$count суполак',
      one: '$count суполкі',
    );
    return '$_temp0';
  }

  @override
  String get stickerPickerSearchHint => 'Знайдзіце ідэальны стыкер';

  @override
  String get stickerPickerEmptyNoCommunitiesTitle => 'Няма даступных стыкераў';

  @override
  String get stickerPickerEmptyNoCommunitiesBody =>
      'Далучыцеся да суполкі са стыкерамі, каб выкарыстоўваць іх тут.';

  @override
  String get stickerPickerEmptyHereTitle => 'Няма даступных стыкераў';

  @override
  String get stickerPickerEmptyHereBody =>
      'У гэтай размове няма даступных стыкераў.';

  @override
  String get stickerPickerNoResultsTitle => 'Стыкеры не знойдзены';

  @override
  String get stickerPickerNoResultsBody => 'Паспрабуйце іншы пошукавы запыт.';

  @override
  String stickerPlutoniumUpsellText(
    String stickerCount,
    String communityCount,
  ) {
    return 'Адкрыйце $stickerCount з $communityCount з Plutonium.';
  }

  @override
  String stickerPlutoniumUpsellStickerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count стыкера',
      many: '$count стыкераў',
      few: '$count стыкеры',
      one: '$count стыкер',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Папярэджанне пра знешнюю спасылку';

  @override
  String externalLinkWarningLeaving(String productName) {
    return 'Вы пакідаеце $productName';
  }

  @override
  String get externalLinkWarningDescription =>
      'Знешнія спасылкі могуць быць небяспечнымі. Будзьце асцярожныя.';

  @override
  String get externalLinkWarningDestinationUrl => 'URL прызначэння:';

  @override
  String get externalLinksSectionTitle => 'Знешнія спасылкі';

  @override
  String get externalLinksSectionDescription =>
      'Наладзьце, як апрацоўваць папярэджанні пра знешнія спасылкі.';

  @override
  String get externalLinkWarningTrustPrefix => 'Заўсёды давяраць ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — не паказваць гэта папярэджанне ў наступны раз';

  @override
  String get externalLinkVisitSite => 'Наведаць сайт';

  @override
  String get externalLinkTrustAllLabel => 'Давяраць усім знешнім спасылкам';

  @override
  String get externalLinkStripTrackingLabel =>
      'Прыбіраць з URL параметры адсочвання';

  @override
  String get externalLinkStripTrackingDescription =>
      'Аўтаматычна выдаляць параметры адсочвання (напрыклад, utm_source, fbclid, gclid) з URL у паведамленнях, якія вы адпраўляеце. Спасылка ачышчаецца раней, чым яе ўбачыць хтосьці іншы.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Давяраць усім знешнім спасылкам?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Усе знешнія спасылкі стануць даверанымі, і папярэджанне не будзе паказвацца ні для аднаго дамена. Вашы цяперашнія давераныя дамены будуць заменены. Гэта менш бяспечна.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Давяраць усім';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Больш не давяраць усім спасылкам?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Папярэджанні пра знешнія спасылкі зноў будуць паказвацца. Давераныя дамены трэба будзе дадаваць паасобку.';

  @override
  String get externalLinkStopTrustingAllAction => 'Адключыць «давяраць усім»';

  @override
  String get externalLinkTrustedAllDescription =>
      'Усе знешнія спасылкі лічацца даверанымі. Папярэджанні паказвацца не будуць.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Давераных даменаў: $count. Каб дадаць яшчэ, стаўце сцяжок, калі адкрываеце знешнія спасылкі.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Калі ўключана, папярэджанні пра знешнія спасылкі не паказваюцца. Гэта менш бяспечна.';

  @override
  String get imageFileTooLarge =>
      'Файл выявы занадта вялікі. Выберыце файл меншы за 10 МБ.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Для аніміраваных аватараў патрэбны Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Для аніміраваных банераў патрэбны Plutonium';

  @override
  String get animatedAvifNotSupported => 'Аніміраваныя AVIF не падтрымліваюцца';

  @override
  String get animatedAvifNotSupportedBody =>
      'Абразаць і паварочваць аніміраваныя файлы AVIF пакуль нельга. Калі працягнуць, файл будзе загружаны ў арыгінальным выглядзе.';

  @override
  String get uploadAsIs => 'Загрузіць як ёсць';

  @override
  String get croppingAnimatedNotSupported =>
      'Абразаць аніміраваныя выявы пакуль нельга. Будзе выкарыстаны арыгінальны файл.';

  @override
  String get cropAvatar => 'Абрэзаць аватар';

  @override
  String get cropBanner => 'Абрэзаць банер';

  @override
  String get skip => 'Прапусціць';

  @override
  String get crop => 'Абрэзаць';

  @override
  String get cropTouchHint =>
      'Звядзіце пальцы, каб змяніць маштаб, перацягніце, каб перамясціць';

  @override
  String get cropMouseHint =>
      'Перацягвайце вуглы, каб змяніць памер, і перацягвайце ўнутры, каб перамясціць';

  @override
  String get changeYourFluxerTag => 'Змяніць імя карыстальніка';

  @override
  String get fluxerTagDescriptionBase =>
      'Імёны карыстальнікаў могуць змяшчаць толькі літары (a-z, A-Z), лічбы (0-9) і падкрэсліванні. Вялікія і малыя літары ў імёнах не адрозніваюцца.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Імёны карыстальнікаў могуць змяшчаць толькі літары (a-z, A-Z), лічбы (0-9) і знак падкрэслівання. Вялікія і малыя літары ў імёнах не адрозніваюцца. Вы можаце выбраць любы вольны 4-значны тэг ад #0000 да #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Імёны карыстальнікаў могуць змяшчаць толькі літары (a-z, A-Z), лічбы (0-9) і знак падкрэслівання. Вялікія і малыя літары ў імёнах не адрозніваюцца. Вы можаце выбраць любы вольны 4-значны тэг ад #0001 да #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Ад $min да $max сімвалаў';
  }

  @override
  String get validationAllowedChars =>
      'Толькі літары (a-z, A-Z), лічбы (0-9) і падкрэсліванні (_)';

  @override
  String get fluxerTagAlreadyTaken => 'Імя карыстальніка ўжо занятае';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Імя карыстальніка $username#$discriminator занятае. Калі працягнуць, ваш тэг аўтаматычна зменіцца.';
  }

  @override
  String get customTagIsTemporary => 'Уласны тэг часовы';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Ваш уласны 4-значны тэг даступны, толькі пакуль актыўная падпіска Plutonium. Калі падпіска скончыцца $date, пасля 3-дзённага льготнага перыяду тэг зменіцца на выпадковы нумар.';
  }

  @override
  String get customTagTemporaryBody =>
      'Ваш уласны 4-значны тэг даступны, толькі пакуль актыўная падпіска Plutonium. Калі падпіска скончыцца, пасля 3-дзённага льготнага перыяду тэг зменіцца на выпадковы нумар.';

  @override
  String get iUnderstandContinue => 'Зразумела, працягнуць';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Калі вы захаваеце гэта імя карыстальніка, ваш уласны 4-значны тэг зменіцца на выпадковы нумар, калі скончыцца падпіска Plutonium. Калі падпіску не ўдасца працягнуць, да змены тэга ў вас будзе 3-дзённы льготны перыяд.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Ваш уласны 4-значны тэг (#$discriminator) дзейнічае, пакуль актыўная падпіска Plutonium. Калі падпіска скончыцца або яе не ўдасца працягнуць, пасля 3-дзённага льготнага перыяду тэг зменіцца на выпадковы нумар.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Наладжвайце свой 4-значны тэг або захоўвайце яго пры змене імя карыстальніка';

  @override
  String get fluxerTagUpdated => 'Імя карыстальніка абноўлена';

  @override
  String get fluxerTagUpdateFailed =>
      'Не ўдалося абнавіць імя карыстальніка. Паспрабуйце яшчэ раз.';

  @override
  String get continueAction => 'Працягнуць';

  @override
  String get profileCustomizationTitle => 'Наладка профілю';

  @override
  String get profileCustomizationDescription =>
      'Змяняйце выгляд профілю і адразу глядзіце, як ён выглядае';

  @override
  String get usernameLabel => 'Імя карыстальніка';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Замацуйце за сабой уліковы запіс, каб змяніць імя карыстальніка';

  @override
  String get changeFluxerTag => 'Змяніць імя карыстальніка';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Наладзьце свой 4-значны тэг (#$discriminator) на свой густ з Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Змяніць імя карыстальніка і 4-значны тэг';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Ваш уласны тэг (#$discriminator) звязаны з падпіскай Plutonium і зменіцца на выпадковы, калі падпіска скончыцца.';
  }

  @override
  String get displayNameLabel => 'Бачнае імя';

  @override
  String get pronounsLabel => 'Займеннікі';

  @override
  String get avatarLabel => 'Аватар';

  @override
  String get changeAvatar => 'Змяніць аватар';

  @override
  String get removeAvatar => 'Выдаліць аватар';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Да 10 МБ. Рэкамендавана: 512×512 пкс';

  @override
  String get bannerLabel => 'Банер';

  @override
  String get changeBanner => 'Змяніць банер';

  @override
  String get removeBanner => 'Выдаліць банер';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Да 10 МБ. Мінімум: 960×540 пкс (16:9)';

  @override
  String get accentColorLabel => 'Акцэнтны колер';

  @override
  String get accentColorDescription =>
      'Задае колер рамкі і банера ў вашым профілі';

  @override
  String get aboutMeLabel => 'Пра мяне';

  @override
  String get aboutMeHelperText =>
      'Можна выкарыстоўваць спасылкі, эмоджы і Markdown.';

  @override
  String get emojiPickerTitle => 'Эмоджы';

  @override
  String get profileBadgesSettingsTitle => 'Бэйджы';

  @override
  String get profileBadgesSettingsDescription =>
      'Выберыце, якія бэйджы іншыя бачаць у вашым профілі.';

  @override
  String get profileBadgesSettingsEmpty => 'У вас пакуль няма бэйджаў.';

  @override
  String get profileBadgesSettingsLoadFailed =>
      'Не ўдалося загрузіць вашы бэйджы.';

  @override
  String profileBadgesShowOnProfile(String badgeLabel) {
    return 'Паказваць $badgeLabel у вашым профілі';
  }

  @override
  String profileBadgesOverflowButton(int count) {
    return '+$count';
  }

  @override
  String get profileBadgesShowAllTooltip => 'Паказаць усе бэйджы';

  @override
  String profileBadgesShowAllSemantic(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Яшчэ +$count бэйджа, паказаць усе',
      many: 'Яшчэ +$count бэйджаў, паказаць усе',
      few: 'Яшчэ +$count бэйджы, паказаць усе',
      one: 'Яшчэ +$count бэйдж, паказаць усе',
    );
    return '$_temp0';
  }

  @override
  String get profileBadgesVisionaryNumberNote =>
      'Паказваецца, толькі калі ваш бэйдж Visionary бачны і не замаскаваны.';

  @override
  String get plutoniumBadgePrivacyTitle => 'Прыватнасць бэйджа Plutonium';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Выберыце, як іншыя бачаць ваш бэйдж Plutonium';

  @override
  String get hidePlutoniumBadgeLabel => 'Цалкам схаваць бэйдж Plutonium';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Цалкам схаваць ваш бэйдж Plutonium ад іншых карыстальнікаў';

  @override
  String get hidePlutoniumPurchaseDate => 'Схаваць дату пакупкі Plutonium';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Схаваць дату пакупкі Plutonium ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Прыбраць з бэйджа дату першай пакупкі Plutonium';

  @override
  String get maskVisionaryAsSubscription => 'Паказваць Visionary як падпіску';

  @override
  String get maskVisionaryDescription =>
      'Паказваць ваш Visionary як звычайную падпіску';

  @override
  String get hideVisionaryIdBadge => 'Схаваць бэйдж Visionary ID';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Схаваць бэйдж Visionary ID (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Прыбраць ваш бэйдж Visionary ID';

  @override
  String get operatorPassName => 'Operator Pass';

  @override
  String operatorPassSince(String since) {
    return 'Operator Pass з $since';
  }

  @override
  String get operatorPassShowBadgeOnProfile => 'Паказваць бэйдж у маім профілі';

  @override
  String operatorPassHideDate(String operatorPassName) {
    return 'Схаваць, калі вы атрымалі $operatorPassName';
  }

  @override
  String get operatorPassHideCount =>
      'Схаваць, колькі ў вас пропускаў Operator Pass';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Да 10 МБ. Рэкамендавана: 512×512 пкс. Для аніміраваных аватараў (GIF) патрэбны Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Упрыгожце профіль статычным або аніміраваным банерам, каб ён вылучаўся.';

  @override
  String get getPlutonium => 'Атрымаць Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotSoldHere =>
      'У гэтай версіі праграмы Plutonium купіць нельга.';

  @override
  String get profilePreviewLabel => 'Папярэдні прагляд';

  @override
  String get profilePreviewMessage => 'Паведамленне';

  @override
  String profilePreviewMemberSince(String productName) {
    return 'У $productName з';
  }

  @override
  String get unclaimedAccountTitle => 'Незамацаваны ўліковы запіс';

  @override
  String get unclaimedAccountDescription =>
      'Ваш уліковы запіс яшчэ не замацаваны. Без электроннай пошты і пароля вы можаце страціць доступ. Замацуйце ўліковы запіс за сабой зараз, каб абараніць яго.';

  @override
  String get claimAccount => 'Замацаваць уліковы запіс';

  @override
  String get profileTypeLabel => 'Тып профілю';

  @override
  String get profileTypeGlobal => 'Глабальны профіль';

  @override
  String get profileTypeGuildDescription =>
      'Вы рэдагуеце свой профіль у суполцы. Гэты профіль будзе бачны толькі ў гэтай суполцы і заменіць ваш глабальны профіль.';

  @override
  String get communityNicknameLabel => 'Псеўданім у суполцы';

  @override
  String get perGuildPremiumUpsellText =>
      'Каб наладзіць аватар, банер, акцэнтны колер і біяграфію для асобных суполак, патрэбны Plutonium. Псеўданім і займеннікі ў суполцы бясплатныя для ўсіх.';

  @override
  String get avatarModeInherit => 'Выкарыстоўваць глабальны профіль';

  @override
  String get avatarModeCustom => 'Выкарыстаць уласную выяву';

  @override
  String get avatarModeUnset => 'Не паказваць';

  @override
  String get profileSavedToast => 'Профіль абноўлены';

  @override
  String get sudoTitle => 'Пацвердзіце, што гэта вы';

  @override
  String get sudoDescription =>
      'Каб працягнуць, гэта дзеянне трэба пацвердзіць.';

  @override
  String get sudoAuthenticatorCode => 'Код аўтэнтыфікатара';

  @override
  String get sudoMethodPassword => 'Пароль';

  @override
  String get sudoMethodTotp => 'Аўтэнтыфікатар';

  @override
  String get sudoVerificationFailed =>
      'Не ўдалося прайсці праверку. Паспрабуйце яшчэ раз.';

  @override
  String get sudoWrongPassword => 'Няправільны пароль. Паспрабуйце яшчэ раз.';

  @override
  String get sudoEmailCodeSend => 'Адправіць мне код на электронную пошту';

  @override
  String get sudoEmailCodeSent =>
      'Мы адправілі 6-значны код на ваш адрас электроннай пошты.';

  @override
  String get sudoEmailCodeLabel => 'Код з ліста';

  @override
  String get sudoEmailCodeResend => 'Адправіць новы код';

  @override
  String get sudoSsoReauthHint =>
      'Увайдзіце зноў, каб пацвердзіць, што гэта вы.';

  @override
  String get sudoSsoReauthButtonGeneric => 'Увайсці зноў';

  @override
  String sudoSsoReauthButton(String provider) {
    return 'Увайсці праз $provider';
  }

  @override
  String get sudoSsoReauthWrongAccount =>
      'Вы ўвайшлі ў іншы ўліковы запіс. Увайдзіце ў той уліковы запіс, якім карыстаецеся тут.';

  @override
  String get sudoPasskeyUnavailable =>
      'Ключы доступу з гэтага экзэмпляра не працуюць у гэтай праграме. Выкарыстайце праграму-аўтэнтыфікатар або рэзервовы код ці пацвердзіце ў вэб-версіі.';

  @override
  String get securityAccountTitle => 'Уліковы запіс';

  @override
  String get securityAccountDescription =>
      'Кіруйце электроннай поштай, паролем і наладамі ўліковага запісу';

  @override
  String get securitySectionTitle => 'Бяспека';

  @override
  String get securitySectionDescription =>
      'Абараніце ўліковы запіс з дапамогай двухфактарнай аўтэнтыфікацыі і ключоў доступу';

  @override
  String get securitySectionDescriptionNoPasskeys =>
      'Абараніце ўліковы запіс з дапамогай двухфактарнай аўтэнтыфікацыі';

  @override
  String get securityLoginEmailSectionTitle => 'Налады электроннай пошты';

  @override
  String securityLoginEmailSectionDescription(String productName) {
    return 'Кіруйце адрасам электроннай пошты, з якім вы ўваходзіце ў $productName';
  }

  @override
  String get securityLoginEmailAddressLabel => 'Адрас электроннай пошты';

  @override
  String get securityLoginNoEmailSet => 'Электронная пошта не зададзена';

  @override
  String get securityLoginChangeEmail => 'Змяніць электронную пошту';

  @override
  String get securityLoginAddEmail => 'Дадаць электронную пошту';

  @override
  String get securityLoginReveal => 'Паказаць';

  @override
  String get securityLoginHide => 'Схаваць';

  @override
  String get securityLoginPasswordSectionTitle => 'Пароль';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Змяніце пароль, каб уліковы запіс заставаўся ў бяспецы';

  @override
  String get securityLoginCurrentPasswordLabel => 'Цяперашні пароль';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Апошняя змена: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Апошняя змена: ніколі';

  @override
  String get securityLoginNoPasswordSet => 'Пароль не зададзены';

  @override
  String get securityLoginChangePassword => 'Змяніць пароль';

  @override
  String get securityLoginSetPassword => 'Задаць пароль';

  @override
  String get passwordChangeTitle => 'Змяніць пароль';

  @override
  String get passwordChangeIntroDescription =>
      'Перш чым змяніць пароль, мы адправім на ваш адрас электроннай пошты код пацвярджэння, каб пераканацца, што гэта вы.';

  @override
  String get passwordChangeStart => 'Пачаць';

  @override
  String get passwordChangeVerifyTitle => 'Пацвердзіце электронную пошту';

  @override
  String get passwordChangeVerifyDescription =>
      'Увядзіце код пацвярджэння, адпраўлены на ваш адрас электроннай пошты.';

  @override
  String get passwordChangeVerificationCode => 'Код пацвярджэння';

  @override
  String get passwordChangeVerify => 'Пацвердзіць';

  @override
  String get passwordChangeNewPasswordTitle => 'Задаць новы пароль';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Увядзіце новы пароль ніжэй.';

  @override
  String get passwordChangeNewPassword => 'Новы пароль';

  @override
  String get passwordChangeConfirmPassword => 'Пацвердзіце новы пароль';

  @override
  String get passwordChangeSubmit => 'Змяніць пароль';

  @override
  String get passwordChangeSuccess => 'Пароль зменены';

  @override
  String get passwordChangePasswordsDoNotMatch => 'Паролі не супадаюць';

  @override
  String get passwordChangeInvalidCode =>
      'Няправільны код або тэрмін яго дзеяння скончыўся';

  @override
  String get emailChangeTitle => 'Змяніць электронную пошту';

  @override
  String get emailChangeIntroDescription =>
      'Перш чым змяніць адрас электроннай пошты, мы адправім коды пацвярджэння, каб пераканацца, што гэта вы.';

  @override
  String get emailChangeStart => 'Пачаць';

  @override
  String get emailChangeVerifyOriginalTitle => 'Пацвердзіць цяперашнюю пошту';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Увядзіце код пацвярджэння, адпраўлены на ваш цяперашні адрас электроннай пошты.';

  @override
  String get emailChangeNewEmailTitle => 'Увядзіце новы адрас';

  @override
  String get emailChangeNewEmailDescription =>
      'Увядзіце новы адрас электроннай пошты, які хочаце выкарыстоўваць.';

  @override
  String get emailChangeNewEmailLabel => 'Новая электронная пошта';

  @override
  String get emailChangeNewEmailSubmit => 'Адправіць код пацвярджэння';

  @override
  String get emailChangeVerifyNewTitle => 'Пацвердзіць новую пошту';

  @override
  String get emailChangeVerifyNewDescription =>
      'Увядзіце код пацвярджэння, адпраўлены на ваш новы адрас электроннай пошты.';

  @override
  String get emailChangeSuccess => 'Электронная пошта зменена';

  @override
  String get emailChangeInvalidCode =>
      'Няправільны код або тэрмін яго дзеяння скончыўся';

  @override
  String get resend => 'Адправіць паўторна';

  @override
  String resendCountdown(int seconds) {
    return 'Адправіць зноў ($seconds с)';
  }

  @override
  String get verificationCode => 'Код пацвярджэння';

  @override
  String get verify => 'Пацвердзіць';

  @override
  String get enable => 'Уключыць';

  @override
  String get disable => 'Адключыць';

  @override
  String get delete => 'Выдаліць';

  @override
  String get save => 'Захаваць';

  @override
  String get securityTfaSectionTitle => 'Двухфактарная аўтэнтыфікацыя';

  @override
  String get securityTfaSectionDescription =>
      'Дадайце ўліковаму запісу дадатковы ўзровень абароны';

  @override
  String get securityTfaAuthenticatorApp => 'Праграма-аўтэнтыфікатар';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Двухфактарная аўтэнтыфікацыя ўключана';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Выкарыстоўвайце праграму-аўтэнтыфікатар, каб атрымліваць коды для двухфактарнай аўтэнтыфікацыі';

  @override
  String get securityTfaBackupCodes => 'Рэзервовыя коды';

  @override
  String get securityTfaBackupCodesDescription =>
      'Праглядайце рэзервовыя коды для аднаўлення ўліковага запісу і кіруйце імі';

  @override
  String get securityTfaViewCodes => 'Паглядзець коды';

  @override
  String get securityPasskeysSectionTitle => 'Ключы доступу';

  @override
  String get securityPasskeysSectionDescription =>
      'Выкарыстоўвайце ключы доступу для ўваходу без пароля і для двухфактарнай аўтэнтыфікацыі';

  @override
  String get securityPasskeysRegistered => 'Зарэгістраваныя ключы доступу';

  @override
  String get securityPasskeysNone => 'Няма зарэгістраваных ключоў доступу';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ключа доступу зарэгістравана',
      many: 'ключоў доступу зарэгістравана',
      few: 'ключы доступу зарэгістраваны',
      one: 'ключ доступу зарэгістраваны',
    );
    return '$count $_temp0 (максімум 10)';
  }

  @override
  String get securityPasskeysAdd => 'Дадаць ключ доступу';

  @override
  String securityPasskeysAdded(String date) {
    return 'Дададзена: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Апошняе выкарыстанне: $date';
  }

  @override
  String get securityPasskeysRename => 'Перайменаваць';

  @override
  String get securityPasskeysDeleteTitle => 'Выдаліць ключ доступу';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Вы сапраўды хочаце выдаліць ключ доступу «$name»?';
  }

  @override
  String get securityPasskeyNameTitle => 'Назваць ключ доступу';

  @override
  String get securityPasskeyNameLabel => 'Назва ключа доступу';

  @override
  String get securityPasskeyNameHint =>
      'напрыклад, YubiKey, iPhone, працоўны камп’ютар';

  @override
  String get securityClaimTitle => 'Функцыі бяспекі';

  @override
  String get securityClaimDescription =>
      'Замацуйце за сабой уліковы запіс, каб атрымаць доступ да функцый бяспекі, такіх як двухфактарная аўтэнтыфікацыя і ключы доступу.';

  @override
  String get securityVerifyEmailRequired =>
      'Каб наладзіць двухфактарную аўтэнтыфікацыю або ключы доступу, спачатку пацвердзіце адрас электроннай пошты.';

  @override
  String get totpEnableTitle => 'Наладзіць праграму-аўтэнтыфікатар';

  @override
  String get totpEnableDescription =>
      'Адсканіруйце QR-код праграмай-аўтэнтыфікатарам, каб атрымліваць коды для двухфактарнай аўтэнтыфікацыі.';

  @override
  String get totpEnableCodeLabel => 'Код';

  @override
  String get totpEnableCodeHint =>
      'Увядзіце 6-значны код з праграмы-аўтэнтыфікатара';

  @override
  String get totpEnableSuccess => 'Двухфактарная аўтэнтыфікацыя ўключана';

  @override
  String get totpDisableTitle => 'Выдаліць праграму-аўтэнтыфікатар';

  @override
  String get totpDisableDescription =>
      'Каб выключыць двухфактарную аўтэнтыфікацыю, увядзіце 6-значны код з праграмы-аўтэнтыфікатара.';

  @override
  String get totpDisableSuccess => 'Двухфактарная аўтэнтыфікацыя выключана';

  @override
  String get backupCodesTitle => 'Рэзервовыя коды';

  @override
  String get backupCodesWarning =>
      'Калі вы страціце доступ да праграмы-аўтэнтыфікатара і ў вас не будзе гэтых кодаў, вы назаўсёды страціце доступ да ўліковага запісу. Спампуйце або скапіруйце іх зараз і захавайце ў надзейным месцы.';

  @override
  String get backupCodesCopy => 'Скапіраваць';

  @override
  String get backupCodesCopied => 'Рэзервовыя коды скапіраваны ў буфер абмену';

  @override
  String get backupCodesAcknowledge =>
      'Мае рэзервовыя коды спампаваныя або скапіраваныя і захоўваюцца ў надзейным месцы.';

  @override
  String get backupCodesDone => 'Гатова';

  @override
  String get dangerZoneSectionTitle => 'Небяспечная зона';

  @override
  String get dangerZoneSectionDescription =>
      'Незваротныя і разбуральныя дзеянні';

  @override
  String get dangerZoneDisableTitle => 'Адключыць уліковы запіс';

  @override
  String get dangerZoneDisableDescription =>
      'Часова адключыць уліковы запіс. Уключыць яго зноў можна пазней — проста ўвайдзіце.';

  @override
  String get dangerZoneDeleteEntryDescription =>
      'Выдаліце свой уліковы запіс і асабістыя даныя. Можна выдаліць і свае паведамленні.';

  @override
  String get dangerZoneDeleteIntro =>
      'Ваш уліковы запіс, профіль і асабістыя даныя выдаляюцца. Паведамленні, якія вы не выдаліце, застануцца там, дзе вы іх адправілі, але без вашага імя і профілю.';

  @override
  String get dangerZoneDeleteMessagesLabel => 'Выдаліць і мае паведамленні';

  @override
  String get dangerZoneDeleteMessagesHint =>
      'Разам з уліковым запісам выдаляюцца ўсе паведамленні, якія вы адправілі ў асабістых чатах, групавых чатах і суполках.';

  @override
  String dangerZoneDeleteExportHint(String privacyDashboard) {
    return 'Каб захаваць копію сваіх даных, спачатку запытайце экспарт у раздзеле $privacyDashboard.';
  }

  @override
  String get dangerZoneDeleteLater => 'Выдаліць праз 14 дзён';

  @override
  String get dangerZoneDeleteLaterHint =>
      'Каб скасаваць выдаленне, увайдзіце на працягу гэтых 14 дзён.';

  @override
  String get dangerZoneDeleteSchedule => 'Запланаваць выдаленне';

  @override
  String get dangerZoneDeleteScheduleHint =>
      'Ваш уліковы запіс будзе выдалены пасля перыяду чакання гэтага экзэмпляра. Калі ўвайсці раней, выдаленне скасуецца.';

  @override
  String get dangerZoneDeleteNow => 'Выдаліць зараз';

  @override
  String get dangerZoneDeleteNowConfirmTitle => 'Выдаліць уліковы запіс зараз?';

  @override
  String get dangerZoneDeleteNowConfirmBody =>
      'Ваш уліковы запіс будзе выдалены адразу, і аднавіць яго будзе нельга.';

  @override
  String get dangerZoneDeleteAppStoreBilling =>
      'Падпіска Plutonium аплачваецца праз Apple. Выдаленне ўліковага запісу яе не скасоўвае, таму спачатку скасуйце падпіску ў App Store.';

  @override
  String get dangerZoneDeleteGooglePlayBilling =>
      'Падпіска Plutonium аплачваецца праз Google Play. Выдаленне ўліковага запісу яе не скасоўвае, таму спачатку скасуйце падпіску ў Google Play.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Пасля адключэння ўліковага запісу вы выйдзеце з усіх сеансаў. Уключыць уліковы запіс зноў можна ў любы час: проста ўвайдзіце.';

  @override
  String get dangerZoneDeleteTitle => 'Выдаліць уліковы запіс';

  @override
  String get dangerZoneDeleteCannotDeleteAccount =>
      'Нельга выдаліць уліковы запіс';

  @override
  String get dangerZoneDeleteOwnsCommunitiesList =>
      'Вы ўладальнік гэтых суполак. Перш чым выдаліць уліковы запіс, выдаліце кожную з іх або перадайце іншаму ўдзельніку.';

  @override
  String get dangerZoneDeleteOwnedCommunitiesHelp =>
      'Націсніце на суполку, каб адкрыць яе налады. Кнопка «Выдаліць суполку» знаходзіцца ўнізе. Каб перадаць суполку, адкрыйце «Удзельнікі», націсніце на ўдзельніка, націсніце на тры кропкі ў яго профілі і выберыце «Перадаць правы ўладальніка».';

  @override
  String get claimAccountTitle => 'Замацуйце за сабой уліковы запіс';

  @override
  String get claimAccountDescription =>
      'Замацуйце за сабой уліковы запіс, дадаўшы электронную пошту і пароль. Перад завяршэннем мы дашлём код пацвярджэння, каб праверыць вашу электронную пошту.';

  @override
  String get claimAccountEmailLabel => 'Электронная пошта';

  @override
  String get claimAccountPasswordLabel => 'Пароль';

  @override
  String get claimAccountSendCode => 'Адправіць код';

  @override
  String get claimAccountVerifyDescription =>
      'Увядзіце код, які мы адправілі вам на электронную пошту, каб пацвердзіць яе. Пароль будзе зададзены, як толькі код будзе пацверджаны.';

  @override
  String get claimAccountSuccess => 'Уліковы запіс паспяхова замацаваны';

  @override
  String get genericError => 'Адбылася памылка';

  @override
  String get networkErrorMessage =>
      'Нешта пайшло не так. Паспрабуйце яшчэ раз.';

  @override
  String get invalidCode => 'Няправільны код';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count года таму',
      many: '$count гадоў таму',
      few: '$count гады таму',
      one: '$count год таму',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count месяца таму',
      many: '$count месяцаў таму',
      few: '$count месяцы таму',
      one: '$count месяц таму',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дня таму',
      many: '$count дзён таму',
      few: '$count дні таму',
      one: '$count дзень таму',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count гадзіны таму',
      many: '$count гадзін таму',
      few: '$count гадзіны таму',
      one: '$count гадзіну таму',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count хвіліны таму',
      many: '$count хвілін таму',
      few: '$count хвіліны таму',
      one: '$count хвіліну таму',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count тыдня таму',
      many: '$count тыдняў таму',
      few: '$count тыдні таму',
      one: '$count тыдзень таму',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'праз $count хвіліны',
      many: 'праз $count хвілін',
      few: 'праз $count хвіліны',
      one: 'праз $count хвіліну',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'праз $count гадзіны',
      many: 'праз $count гадзін',
      few: 'праз $count гадзіны',
      one: 'праз $count гадзіну',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'праз $count дня',
      many: 'праз $count дзён',
      few: 'праз $count дні',
      one: 'праз $count дзень',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'праз $count тыдня',
      many: 'праз $count тыдняў',
      few: 'праз $count тыдні',
      one: 'праз $count тыдзень',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'праз $count месяца',
      many: 'праз $count месяцаў',
      few: 'праз $count месяцы',
      one: 'праз $count месяц',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'праз $count года',
      many: 'праз $count гадоў',
      few: 'праз $count гады',
      one: 'праз $count год',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'толькі што';

  @override
  String get authorizedAppsTitle => 'Аўтарызаваныя праграмы';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Гэтыя праграмы маюць доступ да вашага ўліковага запісу $productName.';
  }

  @override
  String get authorizedAppsEmptyTitle => 'Няма аўтарызаваных праграм';

  @override
  String get authorizedAppsEmptyDescription =>
      'Вы яшчэ не аўтарызавалі ніводнай праграмы для доступу да вашага ўліковага запісу.';

  @override
  String get authorizedAppsLoadError =>
      'Не ўдалося загрузіць аўтарызаваныя праграмы';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Аўтарызавана $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Выдадзеныя дазволы';

  @override
  String get authorizedAppsRevoke => 'Адклікаць';

  @override
  String get authorizedAppsRevokeTitle => 'Адклікаць доступ праграмы';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Вы сапраўды хочаце адклікаць доступ у $appName? Гэта праграма больш не будзе мець доступу да вашага ўліковага запісу.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Доступ да асноўнай інфармацыі вашага профілю (імя карыстальніка, аватар і г. д.)';

  @override
  String get authorizedAppsScopeEmail =>
      'Праглядаць ваш адрас электроннай пошты';

  @override
  String get authorizedAppsScopeGuilds => 'Праглядаць суполкі, у якіх вы ёсць';

  @override
  String get authorizedAppsScopeConnections =>
      'Праглядаць вашы падключаныя ўліковыя запісы';

  @override
  String get authorizedAppsScopeBot =>
      'Дадаць бота ў суполку з запытанымі дазволамі';

  @override
  String get authorizedAppsScopeAdmin =>
      'Доступ да адміністрацыйных канцавых кропак';

  @override
  String get applicationsTitle => 'Праграмы';

  @override
  String get applicationsCreate => 'Стварыць праграму';

  @override
  String get applicationsCreateSubmit => 'Стварыць';

  @override
  String get applicationsCreateClaimTooltip =>
      'Замацуйце за сабой уліковы запіс, каб ствараць праграмы.';

  @override
  String applicationsDocsLink(String domain) {
    return 'Прачытаць дакументацыю ($domain)';
  }

  @override
  String get applicationsLoadError => 'Не ўдалося загрузіць праграмы';

  @override
  String get applicationsLoadErrorDescription =>
      'Праверце злучэнне і паспрабуйце яшчэ раз.';

  @override
  String get applicationsEmptyTitle => 'Пакуль няма праграм';

  @override
  String applicationsEmptyDescription(String apiName) {
    return 'Стварыце сваю першую праграму, каб пачаць працу з $apiName.';
  }

  @override
  String applicationsCreated(String date) {
    return 'Створана $date';
  }

  @override
  String get applicationsName => 'Назва праграмы';

  @override
  String get applicationsNameHint => 'Мая праграма';

  @override
  String get applicationsNameRequired => 'Патрэбна назва праграмы';

  @override
  String get applicationsBackToList => 'Назад да спіса';

  @override
  String get applicationsDetailLoadError =>
      'Не ўдалося загрузіць гэту праграму';

  @override
  String get applicationsDetailLoadErrorDescription =>
      'Паспрабуйце яшчэ раз або вярніцеся да спіса праграм.';

  @override
  String get applicationsId => 'ID праграмы';

  @override
  String get applicationsCopyId => 'Скапіраваць ID';

  @override
  String get applicationsSecretsTitle => 'Сакрэты і токены';

  @override
  String get applicationsSecretsDescription =>
      'Захоўвайце іх у бяспецы. Калі стварыць іх нанава, цяперашнія інтэграцыі перастануць працаваць.';

  @override
  String get applicationsClientSecret => 'Сакрэт кліента';

  @override
  String get applicationsBotToken => 'Токен бота';

  @override
  String get applicationsRegenerate => 'Стварыць нанава';

  @override
  String get applicationsRegenerateClientSecretTitle =>
      'Стварыць сакрэт кліента нанава?';

  @override
  String get applicationsRegenerateBotTokenTitle =>
      'Стварыць токен бота нанава?';

  @override
  String get applicationsRegenerateClientSecretDescription =>
      'Калі стварыць нанава, цяперашні сакрэт перастане дзейнічаць. Абнавіце ўвесь код, які выкарыстоўвае старое значэнне.';

  @override
  String get applicationsRegenerateBotTokenDescription =>
      'Калі стварыць нанава, цяперашні токен перастане дзейнічаць. Абнавіце ўвесь код, які выкарыстоўвае старое значэнне.';

  @override
  String get applicationsClientSecretRegenerated =>
      'Сакрэт кліента створаны нанава. Абнавіце ўвесь код, які выкарыстоўвае стары сакрэт.';

  @override
  String get applicationsBotTokenRegenerated =>
      'Токен бота створаны нанава. Абнавіце ўвесь код, які выкарыстоўвае стары токен.';

  @override
  String get applicationsRegenerateFailed =>
      'Не ўдалося стварыць сакрэт нанава';

  @override
  String get applicationsInfoTitle => 'Інфармацыя пра праграму';

  @override
  String get applicationsInfoDescription =>
      'Асноўныя налады і дазволеныя URI перанакіравання.';

  @override
  String get applicationsPublicBot => 'Публічны бот';

  @override
  String get applicationsPublicBotDescription =>
      'Дазволіць усім запрашаць гэтага бота ў свае суполкі.';

  @override
  String get applicationsRequireCodeGrant => 'Патрабаваць выдачы кода OAuth2';

  @override
  String get applicationsRequireCodeGrantDescription =>
      'Пры запрашэнні гэтага бота патрэбны URI перанакіравання і код аўтарызацыі.';

  @override
  String get applicationsRedirectUris => 'URI перанакіравання';

  @override
  String get applicationsAddRedirect => 'Дадаць перанакіраванне';

  @override
  String get applicationsDeleteRedirect => 'Выдаліць URI перанакіравання';

  @override
  String get applicationsBotProfileTitle => 'Профіль бота';

  @override
  String get applicationsBotProfileDescription =>
      'Аватар, тэг і пашыраныя звесткі профілю для вашага бота.';

  @override
  String get applicationsBotAvatar => 'Аватар бота';

  @override
  String get applicationsUsernameRequired => 'Патрэбна імя карыстальніка';

  @override
  String get applicationsUsernameTooLong =>
      'Імя карыстальніка мусіць змяшчаць не больш за 32 сімвалы';

  @override
  String get applicationsUsernameInvalid =>
      'Імя карыстальніка можа змяшчаць толькі літары, лічбы і падкрэсліванні';

  @override
  String get applicationsBotUsername => 'Імя карыстальніка бота';

  @override
  String get applicationsDiscriminator => 'Дыскрымінатар';

  @override
  String get applicationsBotBio => 'Пра бота';

  @override
  String get applicationsBotBioHint =>
      'Карысны бот, які робіць дзівосныя рэчы!';

  @override
  String get applicationsNoBotBanner => 'Няма банера бота';

  @override
  String get applicationsFriendlyBot => 'Сяброўскі бот';

  @override
  String get applicationsFriendlyBotDescription =>
      'Дазволіць карыстальнікам адпраўляць гэтаму боту запыты ў сябры для ручнога ўхвалення.';

  @override
  String get applicationsManualFriendApproval =>
      'Патрабаваць ручнога ўхвалення запытаў у сябры';

  @override
  String get applicationsManualFriendApprovalDescription =>
      'Запыты ў сябры да гэтага бота патрабуюць ручнога ўхвалення.';

  @override
  String get applicationsOauthBuilderTitle => 'Канструктар URL OAuth2';

  @override
  String get applicationsOauthBuilderDescription =>
      'Складзіце URL аўтарызацыі з вобласцямі доступу і дазволамі.';

  @override
  String get applicationsScopes => 'Вобласці доступу';

  @override
  String get applicationsRedirectUri => 'URI перанакіравання';

  @override
  String get applicationsSelectRedirectUri => 'Выберыце URI перанакіравання';

  @override
  String get applicationsRedirectRequiredCodeGrant =>
      'URI перанакіравання абавязковы, бо гэты бот патрабуе выдачы кода OAuth2.';

  @override
  String get applicationsRedirectRequiredScopes =>
      'URI перанакіравання абавязковы, калі выкарыстоўваецца не толькі вобласць доступу bot.';

  @override
  String get applicationsBotPermissions => 'Дазволы бота';

  @override
  String get applicationsAuthorizeUrl => 'URL аўтарызацыі';

  @override
  String get applicationsAuthorizeUrlPlaceholder =>
      'Выберыце вобласці доступу (і URI перанакіравання, калі патрэбна)';

  @override
  String get applicationsCopyAuthorizeUrl => 'Скапіраваць URL аўтарызацыі';

  @override
  String get applicationsCopiedUrl => 'URL скапіраваны ў буфер абмену';

  @override
  String get applicationsDangerTitle => 'Небяспечная зона';

  @override
  String get applicationsDangerSubtitle =>
      'Гэта дзеянне нельга адмяніць. Выдаленне праграмы выдаляе і яе бота.';

  @override
  String get applicationsDangerHelper =>
      'Пасля выдалення праграма і яе ўліковыя даныя будуць выдалены назаўсёды.';

  @override
  String get applicationsDelete => 'Выдаліць праграму';

  @override
  String applicationsDeleteConfirmDescription(String name) {
    return 'Вы сапраўды хочаце выдаліць $name? Гэта дзеянне нельга адмяніць. Усе звязаныя даныя, у тым ліку карыстальнік-бот, будуць выдалены назаўсёды.';
  }

  @override
  String get applicationsDeleteFailed => 'Не ўдалося выдаліць праграму';

  @override
  String get applicationsUpdated => 'Праграма паспяхова абноўлена';

  @override
  String get applicationsNoChanges => 'Няма змен для захавання';

  @override
  String get applicationsSearchBots => 'Праграмы і боты';

  @override
  String get applicationsSearchBotsDescription =>
      'Стварайце праграмы і ботаў для свайго ўліковага запісу і кіруйце імі';

  @override
  String get applicationsSearchInfoDescription =>
      'Рэдагаваць асноўныя звесткі праграмы і URI перанакіравання';

  @override
  String get applicationsSearchBotProfileDescription =>
      'Змяніць аватар, тэг, біяграфію і банер бота, а таксама паводзіны запытаў у сябры';

  @override
  String get applicationsSearchOauthDescription =>
      'Стварыце URL аўтарызацыі з абласцямі доступу, перанакіраваннямі і дазволамі бота';

  @override
  String get applicationsSearchSecretsDescription =>
      'Праглядаць і ствараць нанава сакрэты кліента і токены ботаў';

  @override
  String get applicationsSearchBotsKeyword => 'Боты';

  @override
  String get applicationsSearchDocumentation => 'Дакументацыя';

  @override
  String get blockedUsersTitle => 'Заблакіраваныя карыстальнікі';

  @override
  String get blockedUsersDescription =>
      'Заблакіраваныя карыстальнікі не могуць адпраўляць вам запыты ў сябры або пісаць вам асабістыя паведамленні.';

  @override
  String get blockedUsersEmptyTitle => 'Няма заблакіраваных карыстальнікаў';

  @override
  String get blockedUsersEmptyDescription => 'Вы яшчэ нікога не заблакіравалі.';

  @override
  String get blockedUsersLoadError =>
      'Не ўдалося загрузіць заблакіраваных карыстальнікаў';

  @override
  String get blockedUsersUnblock => 'Разблакіраваць';

  @override
  String get blockedUsersUnblockTitle => 'Разблакіраваць карыстальніка';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Вы сапраўды хочаце разблакіраваць $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Скапіраваць імя карыстальніка';

  @override
  String get blockedUsersCopyId => 'Скапіраваць ID карыстальніка';

  @override
  String get userProfileLoadError => 'Не ўдалося загрузіць профіль';

  @override
  String get userProfileLoading => 'Загрузка профілю';

  @override
  String get userProfileRetry => 'Паўтарыць';

  @override
  String get userProfileMessage => 'Паведамленне';

  @override
  String get userProfileVoiceCall => 'Галасавы выклік';

  @override
  String get userProfileVideoCall => 'Відэавыклік';

  @override
  String get userProfileEditProfile => 'Рэдагаваць профіль';

  @override
  String userProfileStaffBadgeTooltip(String productName) {
    return 'Супрацоўнік $productName';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return 'Каманда суполкі $productName';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return 'Партнёр $productName';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return 'Паляўнічы за памылкамі $productName';
  }

  @override
  String userProfilePremiumSubscriberSinceTooltip(
    String premiumProductFullName,
    String date,
  ) {
    return 'Падпісчык $premiumProductFullName з $date';
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
    return '$productName Visionary з $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'Visionary ID #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Агульныя сябры ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Агульныя суполкі ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Агульныя сябры';

  @override
  String get userProfileMutualCommunitiesTitle => 'Агульныя суполкі';

  @override
  String get userProfileNoMutualFriends => 'Агульныя сябры не знойдзены.';

  @override
  String get userProfileNoMutualCommunities => 'Агульныя суполкі не знойдзены.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Псеўданім: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Адкрыць асабісты чат';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Вы заблакіравалі $username. Вы не зможаце адпраўляць паведамленні, пакуль не разблакіруеце гэтага карыстальніка.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Разблакіраваць';

  @override
  String get userProfileOpenDm => 'Адкрыць асабісты чат';

  @override
  String get userProfileNoteTitle => 'Заўвага';

  @override
  String get userProfileNoteVisibility => '(бачна толькі вам)';

  @override
  String get userProfileNoteSave => 'Захаваць';

  @override
  String get userProfileNoteDelete => 'Выдаліць';

  @override
  String get userProfileMemberSince => 'Дата далучэння';

  @override
  String get userProfileAboutMe => 'Пра мяне';

  @override
  String get userProfileRoles => 'Ролі';

  @override
  String get memberRoleAdd => 'Дадаць ролю';

  @override
  String memberRoleRemove(String roleName) {
    return 'Прыбраць ролю $roleName';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'У гэтага карыстальніка няма роляў у гэтай суполцы.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'Пакуль няма роляў. Дадайце ролі ў раздзеле $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'Няма даступных роляў';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'Зараз у гэтай суполцы няма роляў, якія можна прызначыць, але вы можаце стварыць новую ролю ў раздзеле $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Налады суполкі';

  @override
  String get guildSettingsRolesTab => 'Ролі';

  @override
  String get memberRolesConfirmOk => 'Добра';

  @override
  String get userProfileLocalTime => 'Мясцовы час';

  @override
  String get profileLocalTimeSettingsTitle => 'Мясцовы час у профілі';

  @override
  String profileLocalTimeSettingsSummary(String productName) {
    return 'Задайце часавы пояс адзін раз, каб $productName мог падтрымліваць ваша зрушэнне ад UTC актуальным пры пераходзе на летні і зімовы час. Іншыя бачаць толькі зрушэнне ад UTC, а не дакладны ідэнтыфікатар часавага пояса.';
  }

  @override
  String get profileLocalTimeEditButton => 'Змяніць мясцовы час у профілі';

  @override
  String get profileLocalTimeTimezoneLabel => 'Часавы пояс';

  @override
  String profileLocalTimeTimezoneHelp(String productName) {
    return 'Выберыце часавы пояс, паводле якога $productName вылічвае ваша зрушэнне ад UTC, каб паказваць мясцовы час у профілі.';
  }

  @override
  String get profileLocalTimeSearchTimezones => 'Пошук часавых паясоў';

  @override
  String get profileLocalTimeNotSet => 'Не зададзены';

  @override
  String profileLocalTimePrivacyNote(
    String timezoneIdentifierExample,
    String productName,
  ) {
    return 'Іншыя бачаць толькі ваша цяперашняе зрушэнне ад UTC, калі вы вырашыце паказваць мясцовы час у профілі. Яны не бачаць дакладны ідэнтыфікатар вашага часавага пояса, напрыклад $timezoneIdentifierExample. $productName захоўвае гэты ідэнтыфікатар толькі для таго, каб зрушэнне аўтаматычна абнаўлялася пры пераходзе на летні і зімовы час.';
  }

  @override
  String get profileLocalTimePrivacyEveryone => 'Усе';

  @override
  String get profileLocalTimePrivacyEveryoneDesc =>
      'Дазволіць бачыць ваш мясцовы час усім, хто можа праглядаць ваш поўны профіль';

  @override
  String get profileLocalTimePrivacyFriends => 'Сябры';

  @override
  String get profileLocalTimePrivacyFriendsDesc =>
      'Дазволіць сябрам бачыць ваш мясцовы час';

  @override
  String get profileLocalTimePrivacyCommunityMembers => 'Удзельнікі суполкі';

  @override
  String get profileLocalTimePrivacyCommunityMembersDesc =>
      'Дазволіць бачыць ваш мясцовы час удзельнікам суполак, у якіх вы ёсць';

  @override
  String get userProfileSameTimeAsYou => 'Той жа час, што і ў вас';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return 'Апярэджвае вас на $duration';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return 'Адстае ад вас на $duration';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours гадзіны',
      many: '$hours гадзін',
      few: '$hours гадзіны',
      one: '$hours гадзіна',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes хвіліны',
      many: '$minutes хвілін',
      few: '$minutes хвіліны',
      one: '$minutes хвіліна',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours гадзіны',
      many: '$hours гадзін',
      few: '$hours гадзіны',
      one: '$hours гадзіна',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes хвіліны',
      many: '$minutes хвілін',
      few: '$minutes хвіліны',
      one: '$minutes хвіліна',
    );
    return '$_temp0';
  }

  @override
  String get userProfileCopyUsername => 'Скапіраваць імя карыстальніка';

  @override
  String get userProfileCopyUserId => 'Скапіраваць ID карыстальніка';

  @override
  String get userProfileViewMainProfile => 'Адкрыць асноўны профіль';

  @override
  String get userProfileViewCommunityProfile => 'Паглядзець профіль у суполцы';

  @override
  String get userProfileBlockUser => 'Заблакіраваць карыстальніка';

  @override
  String get userProfileUnblockUser => 'Разблакіраваць карыстальніка';

  @override
  String get userProfileRemoveFriend => 'Выдаліць з сяброў';

  @override
  String get userProfileBlockConfirmTitle => 'Заблакіраваць карыстальніка';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Вы сапраўды хочаце заблакіраваць $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Разблакіраваць карыстальніка';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Вы сапраўды хочаце разблакіраваць $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Выдаліць з сяброў';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Вы сапраўды хочаце выдаліць $username з сяброў?';
  }

  @override
  String get userProfileFailedSaveNote => 'Не ўдалося захаваць нататку';

  @override
  String get userProfileChangeNickname => 'Змяніць псеўданім';

  @override
  String get userProfileKick => 'Выгнаць';

  @override
  String get userProfileBan => 'Забаніць';

  @override
  String get userProfileTimeout => 'Тайм-аўт';

  @override
  String get userProfileRemoveTimeout => 'Зняць тайм-аўт';

  @override
  String get userProfileTransferOwnership => 'Перадаць правы ўладальніка';

  @override
  String get userProfileReportMessage => 'Паскардзіцца на паведамленне';

  @override
  String get userProfileReportUserProfile => 'Паскардзіцца на профіль';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Выгнаць $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Вы сапраўды хочаце выгнаць $username? Гэты карыстальнік зможа далучыцца зноў па новым запрашэнні.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Зняць тайм-аўт?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Пасля зняцця тайм-аўту $username зноў зможа адпраўляць паведамленні, ставіць рэакцыі і далучацца да галасавых каналаў.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Перадаць правы ўладальніка?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Перадаць правы ўладальніка гэтай суполкі карыстальніку $username? Гэта дзеянне незваротнае, і вы страціце ўсе правы ўладальніка.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Забаніць $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Працягласць бану';

  @override
  String get userProfileBanCustomSecondsLabel => 'Свая працягласць (секунды)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Любое значэнне ад $min да $max секунд';
  }

  @override
  String get userProfileBanDeleteHistoryLabel =>
      'Выдаліць гісторыю паведамленняў';

  @override
  String get userProfileBanDeleteNone => 'Нічога не выдаляць';

  @override
  String get userProfileBanDelete24h => 'За апошнія 24 гадзіны';

  @override
  String get userProfileBanDelete7d => 'За апошнія 7 дзён';

  @override
  String get userProfileBanReasonLabel => 'Прычына (неабавязкова)';

  @override
  String get userProfileBanReasonHint => 'Увядзіце прычыну бану';

  @override
  String get userProfileBanSubmit => 'Забаніць удзельніка';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Тайм-аўт для $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Працягласць тайм-аўту';

  @override
  String get userProfileTimeoutSubmit => 'Даць тайм-аўт удзельніку';

  @override
  String get userProfileNicknameLabel => 'Псеўданім';

  @override
  String get userProfileNicknameHint => 'Увядзіце псеўданім';

  @override
  String get userProfileNicknameSave => 'Захаваць';

  @override
  String userProfileKickSuccess(String username) {
    return 'Карыстальнік $username выгнаны';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Карыстальнік $username забанены';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Карыстальніку $username дадзены тайм-аўт';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Тайм-аўт для $username зняты';
  }

  @override
  String get userProfileNicknameSuccess => 'Псеўданім абноўлены';

  @override
  String get userProfileTransferSuccess => 'Правы ўладальніка перададзены';

  @override
  String get durationPermanent => 'Назаўсёды';

  @override
  String get duration60Seconds => '60 секунд';

  @override
  String get duration5Minutes => '5 хвілін';

  @override
  String get duration10Minutes => '10 хвілін';

  @override
  String get duration1Hour => '1 гадзіна';

  @override
  String get duration12Hours => '12 гадзін';

  @override
  String get duration1Day => '1 дзень';

  @override
  String get duration3Days => '3 дні';

  @override
  String get duration5Days => '5 дзён';

  @override
  String get duration1Week => '1 тыдзень';

  @override
  String get duration2Weeks => '2 тыдні';

  @override
  String get duration1Month => '1 месяц';

  @override
  String get durationCustom => 'Уласнае…';

  @override
  String typingIndicatorOne(String name) {
    return '$name піша...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 і $name2 пішуць...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 і $name3 пішуць...';
  }

  @override
  String get typingIndicatorMultiple => 'Некалькі чалавек набіраюць тэкст...';

  @override
  String get typingIndicatorHandful =>
      'Збіраецца жменька клавіятурных ваяўнікоў...';

  @override
  String get typingIndicatorSymphony => 'Пачалася сімфонія пстрычак клавіш...';

  @override
  String get typingIndicatorFiesta => 'Тут сапраўдная фіеста набору тэксту';

  @override
  String get typingIndicatorApocalypse => 'Ого, гэта апакаліпсіс набору тэксту';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Рады, што вы тут, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Вітаем, $username! Адчувайце сябе як дома.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Прывітанне, $username! Рады, што вы з намі.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Прывітанне, $username! Далучайцеся, калі будзеце гатовыя.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Прывітанне, $username! Рады вас тут бачыць!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Прывітанне, $username! Спадзяёмся, вам тут спадабаецца.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Прывітанне, $username! Сардэчна запрашаем на борт!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Добра, што вы да нас дабраліся, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Сардэчна запрашаем, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Вітаем, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Вітаем, $username! Мы рады, што вы тут.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Вітаем, $username! Спадзяёмся, вам тут спадабаецца.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Вітаем, $username! Ваша наступная размова пачынаецца тут.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Вітаем, $username. Мы рады, што вы з намі.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Рады вас бачыць, $username! Заходзьце.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Вы тут, $username! Рады, што вы з намі.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Вы тут, $username! Пачынаем.';
  }

  @override
  String get relativeTimeShortNow => 'зараз';

  @override
  String relativeTimeShortMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count хв',
      many: '$count хв',
      few: '$count хв',
      one: '$count хв',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count гадз',
      many: '$count гадз',
      few: '$count гадз',
      one: '$count гадз',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дн',
      many: '$count дн',
      few: '$count дн',
      one: '$count дн',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count мес',
      many: '$count мес',
      few: '$count мес',
      one: '$count мес',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count г',
      many: '$count г',
      few: '$count г',
      one: '$count г',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'Мае прылады';

  @override
  String get linkedDevicesDescription =>
      'Тут паказаны ўсе прылады, з якіх зараз выкананы ўваход у ваш уліковы запіс. Адклічце сеансы, якіх вы не пазнаяце.';

  @override
  String get linkedDevicesCurrentDevice => 'Цяперашняя прылада';

  @override
  String get linkedDevicesOtherDevices => 'Іншыя прылады';

  @override
  String get linkedDevicesEnterSelection => 'Уключыць рэжым выбару';

  @override
  String get linkedDevicesExitSelection => 'Выйсці з рэжыму выбару';

  @override
  String get linkedDevicesSelectAll => 'Вылучыць усё';

  @override
  String get linkedDevicesClearSelection => 'Ачысціць выбар';

  @override
  String get linkedDevicesRevokeTooltip => 'Адклікаць прыладу';

  @override
  String get linkedDevicesSignOutAll => 'Выйсці на ўсіх іншых прыладах';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Выйсці на $count прылады',
      many: 'Выйсці на $count прыладах',
      few: 'Выйсці на $count прыладах',
      one: 'Выйсці на $count прыладзе',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Выйсці на $count прылады',
      many: 'Выйсці на $count прыладах',
      few: 'Выйсці на $count прыладах',
      one: 'Выйсці на $count прыладзе',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Выйсці на ўсіх іншых прыладах';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Выбраныя прылады выйдуць з вашага ўліковага запісу. На іх трэба будзе ўвайсці зноў.',
      many:
          'Выбраныя прылады выйдуць з вашага ўліковага запісу. На іх трэба будзе ўвайсці зноў.',
      few:
          'Выбраныя прылады выйдуць з вашага ўліковага запісу. На іх трэба будзе ўвайсці зноў.',
      one:
          'Выбраныя прылады выйдуць з вашага ўліковага запісу. На іх трэба будзе ўвайсці зноў.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Выбраныя прылады выйдуць з вашага ўліковага запісу. На іх трэба будзе ўвайсці зноў.';

  @override
  String get linkedDevicesSignOutConfirm => 'Працягнуць';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'На ўсіх прыладах, з якіх вы выйдзеце, трэба будзе ўвайсці зноў';

  @override
  String get linkedDevicesLoadErrorTitle => 'Памылка сеткі';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Узніклі праблемы з падключэннем да прасторава-часавага кантынууму. Праверце злучэнне і паспрабуйце яшчэ раз.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Прылады адключаны',
      many: 'Прылады адключаны',
      few: 'Прылады адключаны',
      one: 'Прылады адключаны',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'Не ўдалося выйсці. Паспрабуйце яшчэ раз.';

  @override
  String get linkedDevicesUnknownOs => 'Невядомая АС';

  @override
  String get linkedDevicesUnknownPlatform => 'Невядомая платформа';

  @override
  String get linkedDevicesViewDetails => 'Паглядзець падрабязнасці';

  @override
  String get linkedDevicesDetailsTitle => 'Звесткі пра прыладу';

  @override
  String get linkedDevicesDetailsDevice => 'Прылада';

  @override
  String get linkedDevicesDetailsClient => 'Кліент';

  @override
  String get linkedDevicesDetailsLocation => 'Месцазнаходжанне';

  @override
  String get linkedDevicesDetailsIp => 'IP-адрас';

  @override
  String get linkedDevicesDetailsLastUsed => 'Апошняе выкарыстанне';

  @override
  String get linkedDevicesCurrentSession => 'Цяперашні сеанс';

  @override
  String get linkedDevicesUnknown => 'Невядома';

  @override
  String slowmodeLabel(String duration) {
    return 'Павольны рэжым: $duration';
  }

  @override
  String get slowmodeTooltipActive =>
      'Дзейнічае павольны рэжым. Пачакайце, перш чым адправіць наступнае паведамленне.';

  @override
  String get slowmodeTooltipImmune =>
      'Павольны рэжым уключаны, але на вас ён не распаўсюджваецца.';

  @override
  String get slowmodeStatusEnabled => 'Уключаны павольны рэжым';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Павольны рэжым актыўны ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'Зададзены павольны рэжым: $durationLabel, але на вас ён не распаўсюджваецца.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Зададзены павольны рэжым: $durationLabel. Пачакайце, перш чым адпраўляць наступнае паведамленне.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Для гэтага канала зададзены павольны рэжым: $durationLabel.';
  }

  @override
  String get channelNoSendPermissionHint =>
      'Вы не можаце адпраўляць паведамленні ў гэтым канале.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Сістэмныя аб’явы ад каманды $productName. Адказваць тут нельга.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Перапіска ў гэтай суполцы часова прыпынена.';

  @override
  String get channelComposerBarrierTimedOut =>
      'У вас тайм-аўт. Паведамленні, рэакцыі і галасавая сувязь прыпынены да канца тайм-аўту.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Каб пісаць паведамленні ў гэтай суполцы, замацуйце за сабой уліковы запіс.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Каб пісаць паведамленні ў гэтай суполцы, пацвердзіце адрас электроннай пошты.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Ваш уліковы запіс занадта новы, каб адпраўляць паведамленні ў гэтай суполцы.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Вы яшчэ недастаткова доўга ў гэтай суполцы, каб адпраўляць паведамленні.';

  @override
  String get channelComposerBarrierVerifyEmail =>
      'Пацвердзіць электронную пошту';

  @override
  String get accountLimitedNotice =>
      'Адпраўка паведамленняў у вашым уліковым запісе прыпынена. Праверце электронную пошту: каб працягнуць, трэба зрабіць адзін хуткі крок.';

  @override
  String get messagingPausedTextDidNotGoThrough => 'Праблема з SMS';

  @override
  String messagingPausedHelpBody(String supportEmail) {
    return 'Напішыце на $supportEmail, і чалавек з нашай каманды праверыць ваш уліковы запіс. Таксама можна адказаць на ліст, які мы вам адправілі.';
  }

  @override
  String get messagingPausedHelpCountryLabel => 'Краіна, дзе вы знаходзіцеся';

  @override
  String get messagingPausedHelpCopyDetails => 'Скапіраваць звесткі';

  @override
  String get messagingPausedHelpEmailSupport => 'Напісаць у службу падтрымкі';

  @override
  String messagingPausedHelpAccountIdLine(String accountId) {
    return 'ID уліковага запісу: $accountId';
  }

  @override
  String messagingPausedHelpUsernameLine(String username) {
    return 'Імя карыстальніка: $username';
  }

  @override
  String messagingPausedHelpAccountCreatedLine(String createdAt) {
    return 'Уліковы запіс створаны: $createdAt';
  }

  @override
  String messagingPausedHelpCountryLine(String country) {
    return 'Краіна: $country';
  }

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Гэтыя файлы занадта вялікія, каб адправіць іх разам';

  @override
  String get chatAttachmentDropToUpload => 'Адпусціце файлы, каб загрузіць іх';

  @override
  String get chatAttachmentDropToSend =>
      'Адпусціце файлы, каб адразу адправіць іх';

  @override
  String get voiceMessageTitle => 'Галасавое паведамленне';

  @override
  String get voiceMessageHoldHint =>
      'Утрымлівайце, каб запісаць. Перацягніце ў кошык, каб выдаліць, правядзіце ўверх, каб замацаваць запіс, або адпусціце, каб адправіць.';

  @override
  String get voiceMessageDiscard => 'Выдаліць галасавое паведамленне';

  @override
  String get voiceMessageSend => 'Адправіць галасавое паведамленне';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Не ўдаецца пачаць запіс. Дазвольце доступ да мікрафона.';

  @override
  String get voiceMessageMicInUse =>
      'Каб запісаць галасавое паведамленне, пакіньце галасавы выклік.';

  @override
  String get voiceMessageRecordingFailed =>
      'Не ўдалося запісаць. Паспрабуйце яшчэ раз.';

  @override
  String get voiceMessageSendFailed =>
      'Не ўдалося адправіць галасавое паведамленне. Паспрабуйце яшчэ раз.';

  @override
  String get voiceMessagePlay => 'Прайграць';

  @override
  String get voiceMessagePause => 'Паўза';

  @override
  String get voiceMessageSeekForward => 'Перамотаць наперад';

  @override
  String get voiceMessageSeekBackward => 'Перамотаць назад';

  @override
  String get chatAttachmentEditTitle => 'Рэдагаваць далучэнне';

  @override
  String get chatAttachmentFilenameLabel => 'Назва файла';

  @override
  String get chatAttachmentDescriptionLabel => 'Апісанне';

  @override
  String get chatAttachmentDescriptionHint =>
      'Альтэрнатыўны тэкст (неабавязкова)';

  @override
  String get chatAttachmentSpoilerLabel => 'Пазначыць як спойлер';

  @override
  String get chatAttachmentRemove => 'Прыбраць далучэнне';

  @override
  String get chatAttachmentDownload => 'Спампаваць';

  @override
  String get chatAttachmentDownloadedToast => 'Захавана ў «Фота»';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Не ўдалося спампаваць далучэнне';

  @override
  String chatAttachmentDownloadPhotosAccessToast(String productName) {
    return 'Каб захаваць гэта далучэнне, дайце $productName доступ да фотатэкі.';
  }

  @override
  String get chatAttachmentExpiredTooltip =>
      'Тэрмін дзеяння далучэння скончыўся';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Разгарнуць ($count радка)',
      many: 'Разгарнуць ($count радкоў)',
      few: 'Разгарнуць ($count радкі)',
      one: 'Разгарнуць ($count радок)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Згарнуць ($count радка)',
      many: 'Згарнуць ($count радкоў)',
      few: 'Згарнуць ($count радкі)',
      one: 'Згарнуць ($count радок)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Разгарнуць ($count радка)',
      many: 'Разгарнуць ($count радкоў)',
      few: 'Разгарнуць ($count радкі)',
      one: 'Разгарнуць ($count радок)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Згарнуць ($count радка)',
      many: 'Згарнуць ($count радкоў)',
      few: 'Згарнуць ($count радкі)',
      one: 'Згарнуць ($count радок)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... (засталося $count радка)',
      many: '... (засталося $count радкоў)',
      few: '... (засталіся $count радкі)',
      one: '... (застаўся $count радок)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... (засталося $count радка)',
      many: '... (засталося $count радкоў)',
      few: '... (засталіся $count радкі)',
      one: '... (застаўся $count радок)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'Паглядзець увесь файл';

  @override
  String get chatTextualPreviewChangeLanguage => 'Змяніць мову';

  @override
  String get chatTextualPreviewSearchLanguage => 'Пошук мовы…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Падсвятленне сінтаксісу';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'Нічога не знойдзена';

  @override
  String get chatTextualPreviewMoreOptions => 'Іншыя параметры';

  @override
  String get chatTextualPreviewWrapText => 'Пераносіць тэкст';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'Файл занадта вялікі для папярэдняга прагляду (ліміт — $previewLimitKb КБ).';
  }

  @override
  String get chatTextualPreviewLoadError =>
      'Не ўдалося загрузіць папярэдні прагляд.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Звычайны тэкст';

  @override
  String get chatTextualPreviewCopy => 'Скапіраваць';

  @override
  String get chatAttachmentSourceGallery => 'Галерэя';

  @override
  String get chatAttachmentSourceCamera => 'Камера';

  @override
  String get chatAttachmentSourceBrowse => 'Выбраць файлы';

  @override
  String get chatAttachmentSpoiler => 'Спойлер';

  @override
  String get chatMediaSpoilerOverlayLabel => 'СПОЙЛЕР';

  @override
  String get chatMediaSpoilerRevealLabel => 'Паказаць спойлер';

  @override
  String get matureMediaRevealButton => 'Паказаць';

  @override
  String get matureMediaRevealLabel => 'Паказаць адчувальныя медыя';

  @override
  String get matureMediaAppLockedLabel =>
      'Адчувальныя медыя на iPhone і iPad схаваны.';

  @override
  String get matureMediaMinorLockedLabel =>
      'Адчувальныя медыя схаваны для вашага ўліковага запісу.';

  @override
  String get matureContentTitle => 'Змесціва для дарослых';

  @override
  String get matureCommunityTitle => 'Суполка для дарослых';

  @override
  String get matureCategoryTitle => 'Катэгорыя для дарослых';

  @override
  String get matureChannelTitle => 'Канал для дарослых';

  @override
  String get communityContentWarningTitle => 'Папярэджанне аб змесціве суполкі';

  @override
  String get categoryContentWarningTitle =>
      'Папярэджанне аб змесціве катэгорыі';

  @override
  String get channelContentWarningTitle => 'Папярэджанне аб змесціве канала';

  @override
  String get defaultContentWarningBody => 'Тут ёсць адчувальнае змесціва.';

  @override
  String get matureCommunityBody =>
      'Гэта суполка пазначана як суполка са змесцівам для дарослых і можа змяшчаць матэрыялы, якія некаторым карыстальнікам могуць не падысці.';

  @override
  String get matureCategoryBody =>
      'Гэта катэгорыя пазначана як катэгорыя са змесцівам для дарослых і можа змяшчаць матэрыялы, якія некаторым карыстальнікам могуць не падысці.';

  @override
  String get matureChannelBody =>
      'Гэты канал пазначаны як канал са змесцівам для дарослых і можа змяшчаць матэрыялы, якія некаторым карыстальнікам могуць не падысці.';

  @override
  String get matureVoiceChannelBody =>
      'Гэты галасавы канал пазначаны як канал са змесцівам для дарослых і можа змяшчаць матэрыялы, якія некаторым карыстальнікам могуць не падысці.';

  @override
  String get matureLinkChannelBody =>
      'Гэты канал-спасылка пазначаны як канал са змесцівам для дарослых і можа адкрываць матэрыялы, якія некаторым карыстальнікам могуць не падысці.';

  @override
  String get matureCommunityUnavailableBody =>
      'Гэта суполка для дарослых недаступная для вашага ўліковага запісу.';

  @override
  String matureContentIosWebOptInInstanceBody(String webAddress) {
    return 'Уключыце суполкі і каналы з узроставымі абмежаваннямі на $webAddress у браўзеры або ў настольнай праграме. Да таго часу ў праграме для iOS яны застаюцца схаванымі.';
  }

  @override
  String get matureCategoryUnavailableBody =>
      'Гэта катэгорыя для дарослых недаступная для вашага ўліковага запісу.';

  @override
  String get matureChannelUnavailableBody =>
      'Гэты канал для дарослых недаступны для вашага ўліковага запісу.';

  @override
  String get matureContentAppLockedBody =>
      'Змесціва 18+ на iPhone і iPad выключана. Каб праглядаць тут суполкі і каналы з адзнакай 18+, адкрыйце Fluxer у вэб-версіі або на камп’ютары, перайдзіце ў раздзел «Прыватнасць» у наладах і ўключыце «Дазволіць змесціва 18+ на iPhone і iPad».';

  @override
  String get matureContentRegionLockedBody =>
      'Паводле законаў пра змесціва для дарослых у вашым рэгіёне яно адсюль недаступнае.';

  @override
  String get matureMessageHiddenPreview => 'Паведамленне ў канале 18+';

  @override
  String get ageRangeUnderMinimumTitle =>
      'Fluxer недаступны для гэтага ўліковага запісу';

  @override
  String get ageRangeUnderMinimumBody =>
      'Паводле ўзроставага дыяпазону, які перадае ваш Apple Account, вам менш за 13 гадоў. Fluxer прызначаны толькі для людзей ад 13 гадоў.';

  @override
  String get ageRangeUnderMinimumBodyGoogle =>
      'Паводле ўзроставага дыяпазону, які перадае ваш Google Account, вам менш за 13 гадоў. Fluxer прызначаны толькі для людзей ад 13 гадоў.';

  @override
  String get ageRangeUnlockBody =>
      'Па законе вашага рэгіёна для доступу да змесціва для дарослых недастаткова ўвесці дату нараджэння, але яго можна адкрыць з дапамогай узроставага дыяпазону з вашага Apple Account. Fluxer атрымлівае ўзроставы дыяпазон, толькі калі вам 18 гадоў або больш. Дыяпазон да 18 гадоў застаецца на гэтай прыладзе.';

  @override
  String get ageRangeUnlockBodyGoogle =>
      'Па законе вашага рэгіёна для доступу да змесціва для дарослых недастаткова ўвесці дату нараджэння, але яго можна адкрыць з дапамогай узроставага дыяпазону з вашага Google Account. Fluxer атрымлівае ўзроставы дыяпазон, толькі калі вам 18 гадоў або больш. Дыяпазон да 18 гадоў застаецца на гэтай прыладзе.';

  @override
  String get ageRangeUnlockHelpLink =>
      'Як працуе адкрыццё змесціва для дарослых';

  @override
  String get ageRangeUnlockButton => 'Адкрыць змесціва для дарослых';

  @override
  String get ageRangeUnlockUnderAdult =>
      'Змесціва для дарослых застаецца выключаным, бо паводле ўзроставага дыяпазону ў вашым Apple Account вам менш за 18 гадоў. Дыяпазон застаецца на гэтай прыладзе і не адпраўляецца ў Fluxer.';

  @override
  String get ageRangeUnlockUnderAdultGoogle =>
      'Змесціва для дарослых застаецца выключаным, бо паводле ўзроставага дыяпазону ў вашым Google Account вам менш за 18 гадоў. Дыяпазон застаецца на гэтай прыладзе і не адпраўляецца ў Fluxer.';

  @override
  String get ageRangeUnlockFailed =>
      'Fluxer не ўдалося адкрыць змесціва для дарослых. Паспрабуйце яшчэ раз пазней.';

  @override
  String get ageRangeUnlockDateOfBirthRequired =>
      'Каб Fluxer мог выкарыстаць ваш узроставы дыяпазон, ва ўліковым запісе павінна быць указана дата нараджэння.';

  @override
  String get matureContentProceedButton => 'Працягнуць';

  @override
  String get matureContentUnderstandButton => 'Зразумела';

  @override
  String get matureContentOpenLinkButton => 'Адкрыць спасылку';

  @override
  String get sensitiveContentFriendDmLabel =>
      'Асабістыя паведамленні ад сяброў';

  @override
  String get sensitiveContentNonFriendDmLabel =>
      'Асабістыя паведамленні ад іншых';

  @override
  String get sensitiveContentGuildLabel => 'Паведамленні ў каналах суполак';

  @override
  String get sensitiveContentFilterShow => 'Паказаць';

  @override
  String get sensitiveContentFilterBlur => 'Размыццё';

  @override
  String get sensitiveContentFilterBlock => 'Заблакіраваць';

  @override
  String get sensitiveContentResetButton => 'Скінуць';

  @override
  String get sensitiveContentSaveButton => 'Захаваць';

  @override
  String get sensitiveContentAppLockedHint =>
      'Каб выбраць тут «Паказаць», адкрыйце Fluxer у вэб-версіі або на камп’ютары, перайдзіце ў раздзел «Прыватнасць» у наладах і ўключыце «Дазволіць змесціва 18+ на iPhone і iPad».';

  @override
  String get sensitiveContentInstallFromPlayHint =>
      'Каб адкрыць змесціва для дарослых праз Google Account, патрэбна копія Fluxer з Google Play.';

  @override
  String get sensitiveContentFinishInPlayHint =>
      'Каб Google Play мог перадаць узроставы дыяпазон, трэба зрабіць яшчэ адзін крок. Адкрыйце Play Store і завяршыце яго там, потым вярніцеся і зноў націсніце «Адкрыць змесціва для дарослых».';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файла',
      many: '$count файлаў',
      few: '$count файлы',
      one: '$count файл',
    );
    return 'Загрузка: $_temp0';
  }

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Тэрмін дзеяння сканчаецца $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Тэрмін дзеяння сканчаецца паміж $start і $end';
  }

  @override
  String get connectionsTitle => 'Падключэнні';

  @override
  String connectionsDescription(String productName) {
    return 'Падключайце знешнія ўліковыя запісы і дамены да свайго профілю $productName. Пацверджаныя падключэнні будуць бачныя іншым у вашым профілі.';
  }

  @override
  String get connectionsEmptyTitle => 'Пакуль няма падключэнняў';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Падключыце ўліковы запіс Bluesky або пацвердзіце валоданне даменам, каб паказаць іх у сваім профілі.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Пацвердзіце валоданне даменам, каб паказваць яго ў сваім профілі.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Дамен';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Дадаць падключэнне Bluesky';

  @override
  String get connectionsAddDomainAriaLabel => 'Дадаць падключэнне дамена';

  @override
  String get connectionEdit => 'Рэдагаваць';

  @override
  String get connectionRemove => 'Прыбраць';

  @override
  String get connectionVerifiedLabel => 'Гэта падключэнне пацверджана.';

  @override
  String get connectionUnverifiedLabel => 'Гэта падключэнне не пацверджана.';

  @override
  String get connectionAddTitle => 'Дадаць падключэнне';

  @override
  String get connectionTypeLabel => 'Тып падключэння';

  @override
  String get connectionHandleLabel => 'Імя карыстальніка';

  @override
  String get connectionDomainLabel => 'Дамен';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'У вас ужо ёсць гэта падключэнне.';

  @override
  String get connectionConnectBluesky => 'Падключыць праз Bluesky';

  @override
  String get connectionContinue => 'Працягнуць';

  @override
  String get connectionVerifyTitle => 'Пацвердзіць падключэнне';

  @override
  String get connectionVerifyInstructions =>
      'Каб пацвердзіць валоданне даменам, выкарыстайце запіс ніжэй.';

  @override
  String get connectionDnsRecordTitle => 'Запіс DNS TXT';

  @override
  String get connectionDnsHostLabel => 'Хост';

  @override
  String get connectionDnsValueLabel => 'Значэнне';

  @override
  String get connectionCopyHost => 'Скапіраваць хост';

  @override
  String get connectionCopyValue => 'Скапіраваць значэнне';

  @override
  String get connectionCopied => 'Скапіравана!';

  @override
  String get connectionTokenFileTitle => 'Размясціце файл токена';

  @override
  String get connectionTokenFileDescription =>
      'Спампуйце **fluxer-verification** і пакладзіце яго ў папку **.well-known**, каб мы маглі праверыць дамен.';

  @override
  String get connectionTokenFileDownload => 'Спампаваць fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'У файле ёсць токен праверкі, які мы атрымаем з **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Захаваць fluxer-verification';

  @override
  String get connectionVerifyButton => 'Пацвердзіць';

  @override
  String get connectionBack => 'Назад';

  @override
  String get connectionEditTitle => 'Рэдагаваць падключэнне';

  @override
  String get connectionEditDescription =>
      'Выберыце, хто можа бачыць гэта падключэнне ў вашым профілі.';

  @override
  String get connectionVisibilityEveryone => 'Усе';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Дазволіць усім бачыць гэта падключэнне ў вашым профілі';

  @override
  String get connectionVisibilityFriends => 'Сябры';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Дазволіць сябрам бачыць гэта падключэнне';

  @override
  String get connectionVisibilityCommunityMembers => 'Удзельнікі суполкі';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Дазволіць бачыць гэта падключэнне ўдзельнікам суполак, у якіх вы ёсць';

  @override
  String get connectionRemoveTitle => 'Выдаліць падключэнне';

  @override
  String get connectionRemoveDescription =>
      'Вы сапраўды хочаце выдаліць гэта падключэнне? Гэта дзеянне нельга адмяніць.';

  @override
  String get connectionRemoveConfirm => 'Прыбраць';

  @override
  String get connectionsLoadError => 'Не ўдалося загрузіць падключэнні';

  @override
  String get connectionsReorderError => 'Не ўдалося абнавіць парадак';

  @override
  String get connectionInitiateFailed =>
      'Не ўдалося пачаць праверку. Паспрабуйце яшчэ раз.';

  @override
  String get connectionVerifyFailed =>
      'Не ўдалося праверыць. Праверце запіс DNS і паспрабуйце яшчэ раз.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Не ўдалося пачаць аўтарызацыю ў Bluesky.';

  @override
  String get connectionUpdateFailed => 'Не ўдалося абнавіць падключэнне';

  @override
  String get connectionRemoveFailed => 'Не ўдалося выдаліць падключэнне';

  @override
  String get connectionTokenSavedToast => 'Файл fluxer-verification захаваны';

  @override
  String get connectionTokenSaveFailedToast => 'Не ўдалося захаваць файл';

  @override
  String get connectionEnterHandle => 'Увядзіце ідэнтыфікатар Bluesky.';

  @override
  String get connectionEnterDomain => 'Увядзіце дамен.';

  @override
  String get connectionsEmptyDescriptionAccounts =>
      'Прывяжыце свае ўліковыя запісы або пацвердзіце валоданне даменам, каб паказваць іх у сваім профілі.';

  @override
  String connectionsAddProviderAriaLabel(String providerName) {
    return 'Дадаць падключэнне $providerName';
  }

  @override
  String connectionConnectWithProvider(String providerName) {
    return 'Падключыць праз $providerName';
  }

  @override
  String connectionProviderInstructions(String providerName) {
    return '$providerName адкрыецца ў браўзеры. Увайдзіце там, каб падключыць уліковы запіс.';
  }

  @override
  String connectionProviderAuthorizeFailed(String providerName) {
    return 'Не ўдалося пачаць аўтарызацыю праз $providerName.';
  }

  @override
  String get connectionUnavailable => 'Больш недаступна';

  @override
  String get lookAndFeelThemeSectionTitle => 'Тэма';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Выберыце тэму: сістэмную, цёмную, «Вугаль» або светлую.';

  @override
  String get lookAndFeelHdrSectionTitle => 'Высокі дынамічны дыяпазон';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Кіруйце тым, як HDR-выявы паказваюцца на маніторах з падтрымкай HDR.';

  @override
  String get lookAndFeelHdrFullName => 'Поўны дынамічны дыяпазон';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Паказваць HDR-выявы з поўнай яркасцю і дыяпазонам колераў.';

  @override
  String get lookAndFeelHdrStandardName => 'Стандартны дыяпазон';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Пераводзіць HDR-выявы ў стандартны дыяпазон, змяншаючы пікавую яркасць.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'Рэжым дысплэя з высокім дынамічным дыяпазонам';

  @override
  String get lookAndFeelThemeDark => 'Цёмная тэма';

  @override
  String get lookAndFeelThemeDarkLegacy => 'Цёмная (састарэлая) тэма';

  @override
  String get lookAndFeelThemeCoal => 'Тэма «Вугаль»';

  @override
  String get lookAndFeelThemeLight => 'Светлая тэма';

  @override
  String get lookAndFeelThemeSystem => 'Сістэмная тэма';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Сінхранізаваць тэму паміж прыладамі';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Калі ўключана, змены тэмы сінхранізуюцца на ўсіх вашых прыладах. Калі выключана, гэта прылада выкарыстоўвае ўласную наладу тэмы.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Сістэмная тэма аўтаматычна выключае сінхранізацыю, каб на гэтай прыладзе тэма адпавядала сістэмнай наладзе.';

  @override
  String get lookAndFeelUseSystemDynamicColorsLabel =>
      'Выкарыстоўваць колеры Material You';

  @override
  String get lookAndFeelUseSystemDynamicColorsDescription =>
      'Афарбоўваць тэму сістэмнымі колерамі прылады.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Не ўдалося сінхранізаваць тэму з вашым уліковым запісам. Паспрабуйце яшчэ раз.';

  @override
  String get lookAndFeelThemeColorsTitle => 'Колеры тэмы';

  @override
  String get lookAndFeelThemeColorsConfigureDescription =>
      'Наладзьце асобныя колеры тэмы для гэтай прылады.';

  @override
  String lookAndFeelThemeColorsEditingMode(String mode) {
    return 'Рэдагаванне: $mode';
  }

  @override
  String get lookAndFeelThemeColorsSyncSectionTitle =>
      'Сінхранізацыя з Theme Studio';

  @override
  String get lookAndFeelThemeColorsSyncFromStudioLabel =>
      'Выкарыстоўваць колеры з Theme Studio';

  @override
  String get lookAndFeelThemeColorsSyncFromStudioDescription =>
      'Калі ўключана, змены колераў у Theme Studio на камп’ютары прымяняюцца на гэтай прыладзе. Калі выключана, гэта прылада захоўвае свае колеры.';

  @override
  String get lookAndFeelThemeColorsSyncToStudioLabel =>
      'Адпраўляць змены колераў у Theme Studio';

  @override
  String get lookAndFeelThemeColorsSyncToStudioDescription =>
      'Калі ўключана, колеры, якія вы змяняеце тут, сінхранізуюцца з Theme Studio на іншых вашых прыладах. Калі выключана, Theme Studio на камп’ютары захоўвае свае колеры.';

  @override
  String get lookAndFeelThemeColorsSyncFromStudioOffBanner =>
      'Змены колераў з Theme Studio на камп’ютары не будуць прымяняцца на гэтай прыладзе.';

  @override
  String get lookAndFeelThemeColorsEssentialSectionTitle => 'Асноўныя колеры';

  @override
  String get lookAndFeelThemeColorsChatBackgroundWallpaperNote =>
      'Калі ў вас усталяваны шпалеры чата, гэтага колеру не будзе відаць.';

  @override
  String lookAndFeelThemeColorsResetForMode(String mode) {
    return 'Скінуць усе колеры для $mode';
  }

  @override
  String get lookAndFeelThemeColorsResetConfirmTitle => 'Скінуць колеры тэмы?';

  @override
  String lookAndFeelThemeColorsResetConfirmBody(String mode) {
    return 'Вашы ўласныя колеры для $mode на гэтай прыладзе будуць выдалены.';
  }

  @override
  String get lookAndFeelThemeColorsGroupBrandButtons => 'Брэнд і кнопкі';

  @override
  String get lookAndFeelThemeColorsGroupChatSurfaces => 'Чат і паведамленні';

  @override
  String get lookAndFeelThemeColorsGroupSidebars =>
      'Бакавыя панэлі і навігацыя';

  @override
  String get lookAndFeelThemeColorsGroupText => 'Тэкст';

  @override
  String get lookAndFeelThemeColorsGroupHeaders => 'Загалоўкі';

  @override
  String get lookAndFeelThemeColorsGroupStatus => 'Статус';

  @override
  String get lookAndFeelThemeColorsGroupEmbedsMarkup =>
      'Убудаванні і згадванні';

  @override
  String get lookAndFeelThemeColorsGroupAccentsAlerts =>
      'Акцэнты і папярэджанні';

  @override
  String get lookAndFeelThemeColorsGroupControls =>
      'Паверхні і элементы кіравання';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Маштабаванне шрыфту чата';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Наладзьце памер шрыфту ў вобласці чата.';

  @override
  String get lookAndFeelChatFontSizeLabel => 'Памер шрыфту чата';

  @override
  String get lookAndFeelAppZoomTitle => 'Маштаб праграмы';

  @override
  String get lookAndFeelAppZoomDescription => 'Наладзьце маштаб праграмы.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'Шпалеры чата';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'Выберыце фон для чата. Ён захоўваецца толькі на гэтай прыладзе.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'Гэта налада захоўваецца толькі на гэтай прыладзе';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'Шпалеры чата захоўваюцца толькі на гэтай прыладзе і не сінхранізуюцца з іншымі прыладамі.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'Прадвызначана';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'Уласная выява';

  @override
  String get lookAndFeelChatWallpaperStarfieldLabel => 'Зорнае поле';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Колер $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Градыент $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'Зацямненне шпалер';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'Не ўдалося зрабіць гэту выяву шпалерамі.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Паведамленні';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Выберыце, як паказваюцца паведамленні ў каналах чата.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Прамежак паміж групамі паведамленняў';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '$spacing пкс';
  }

  @override
  String lookAndFeelPixelsAccessibleValue(int value) {
    return 'Пікселяў: $value';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel =>
      'Рэжым адлюстравання паведамленняў';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Зручны';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Прасторны макет з выразным візуальным падзелам паміж паведамленнямі.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Шчыльны';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Найбольш паведамленняў на экране з мінімальнымі водступамі.';

  @override
  String get lookAndFeelHideUserAvatarsLabel =>
      'Схаваць аватары карыстальнікаў';

  @override
  String get lookAndFeelInterfaceTitle => 'Інтэрфейс';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Наладзьце элементы інтэрфейсу і іх паводзіны.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Індыкатары набору ў спісе каналаў';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Выберыце, як індыкатары набору паказваюцца ў спісе каналаў, калі хтосьці піша ў канале.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Індыкатар набору + аватары';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Паказваць індыкатар набору з аватарамі карыстальнікаў у спісе каналаў';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Толькі індыкатар набору';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Паказваць толькі індыкатар набору без аватараў';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Схавана';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Не паказваць індыкатары набору ў спісе каналаў';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Паказваць набор у выбраным канале';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Калі выключана (прадвызначана), індыкатары набору не паказваюцца ў канале, які вы зараз праглядаеце.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'агульны';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Падказкі для клавіятуры';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Выберыце, ці паказваць спалучэнні клавіш у падказках.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Не паказваць спалучэнні клавіш у падказках';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Калі ўключана, значкі спалучэнняў клавіш у падказках схаваныя.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Спіс суполак';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Наладзьце, як асабістыя чаты і суполкі паводзяць сябе на бакавой панэлі.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count суполкі часова недаступныя праз няспраўнасць патокавага кандэнсатара.',
      many:
          '$count суполак часова недаступныя праз няспраўнасць патокавага кандэнсатара.',
      few:
          '$count суполкі часова недаступныя праз няспраўнасць патокавага кандэнсатара.',
      one:
          '$count суполка часова недаступная праз няспраўнасць патокавага кандэнсатара.',
    );
    return '$_temp0';
  }

  @override
  String get communityTemporarilyUnavailable => 'Суполка часова недаступная';

  @override
  String get guildUnavailableDescription =>
      'Штосьці пайшло не так. Мы ўжо працуем над гэтым.';

  @override
  String get guildNotFoundTitle => 'Гэта не тая суполка, якую вы шукаеце.';

  @override
  String get guildNotFoundDescription =>
      'Магчыма, суполка, якую вы шукаеце, выдалена або ў вас няма да яе доступу.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return 'Суполка $communityName зараз даступная толькі супрацоўнікам $productName';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => 'часова недаступна';

  @override
  String get lookAndFeelCollapseDMsLabel => 'Згарнуць асабістыя чаты ў папку';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'Калі ўключана, непрачытаныя асабістыя чаты ў спісе суполак згортваюцца ў папку на кнопцы $productName. Каб разгарнуць або згарнуць папку, націсніце кнопку $productName на старонцы асабістых чатаў.';
  }

  @override
  String get lookAndFeelOpenCommunitiesToLastChannelLabel =>
      'Адкрываць суполкі на апошнім канале';

  @override
  String get lookAndFeelOpenCommunitiesToLastChannelDescription =>
      'Калі націснуць на суполку, адразу адкрыецца апошні канал, які вы ў ёй праглядалі. Каб убачыць спіс яе каналаў, правядзіце ўправа.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Спіс каналаў';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Кіруйце паводзінамі індыкатара непрачытаных для заглушаных каналаў у спісах каналаў.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Паказваць індыкатар непрачытаных на заглушаных каналах';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Калі ўключана, у заглушаных каналаў злева паказваецца бляклы індыкатар непрачытаных. Згадванні з’яўляюцца незалежна ад гэтай налады.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Зараз актыўныя';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Выберыце, дзе ў праграме паказваецца «Зараз актыўныя».';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Паказваць «Зараз актыўныя» на галоўным экране';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Паказваць «Зараз актыўныя» на галоўным экране, каб бачыць сяброў, якія размаўляюць у галасавых каналах. Вы ўбачыце папярэдні прагляд, канал, хто ўжо там, і зможаце хутка далучыцца.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Абранае';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Кіруйце бачнасцю абранага ва ўсёй праграме.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Уключыць абранае';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Калі ўключана, вы можаце дадаваць каналы ў абранае, і яны будуць паказвацца ў раздзеле «Абранае». Калі выключана, усе элементы інтэрфейсу, звязаныя з абраным (кнопкі, пункты меню), будуць схаваныя. Ваша абранае захаваецца.';

  @override
  String get favoritesTitle => 'Абранае';

  @override
  String get favoritesEmptyTitle => 'У абраным пакуль пуста';

  @override
  String get favoritesEmptyDescription =>
      'Пазначайце каналы зорачкай у загалоўку чата, каб яны былі тут.';

  @override
  String get favoritesWelcomeTitle => 'Сардэчна запрашаем у абранае';

  @override
  String get favoritesWelcomeDescription =>
      'Ваша асабістая прастора для хуткага доступу да любімых каналаў, асабістых чатаў і груп. Націсніце зорку на любым канале, каб дадаць яго сюды.';

  @override
  String get favoritesWelcomeTip => 'Не для вас? Выключыць можна ў любы час.';

  @override
  String get favoritesDisableButton => 'Адключыць абранае';

  @override
  String get favoritesAddedToast => 'Дададзена ў абранае';

  @override
  String get favoritesRemovedToast => 'Прыбрана з абранага';

  @override
  String get favoritesHiddenToast => 'Абранае схавана';

  @override
  String get favoritesMute => 'Заглушыць абранае';

  @override
  String get favoritesUnmute => 'Уключыць апавяшчэнні абранага';

  @override
  String get favoritesHeaderMenu => 'Меню абранага';

  @override
  String get favoritesCreateCategory => 'Стварыць катэгорыю';

  @override
  String get favoritesCategoryNameLabel => 'Назва катэгорыі';

  @override
  String get favoritesHideMutedChannels => 'Схаваць заглушаныя каналы';

  @override
  String get favoritesShowMutedChannels => 'Паказваць заглушаныя каналы';

  @override
  String get favoritesSetNickname => 'Задаць псеўданім';

  @override
  String get favoritesNicknameLabel => 'Псеўданім';

  @override
  String get favoritesSaveNickname => 'Захаваць псеўданім';

  @override
  String get favoritesMoveToCategory => 'Перамясціць у катэгорыю';

  @override
  String get favoritesUncategorized => 'Без катэгорыі';

  @override
  String get favoritesOtherCategory => 'Іншае';

  @override
  String get favoritesRemoveFromFavorites => 'Прыбраць з абранага';

  @override
  String get favoritesAddToFavorites => 'Дадаць у абранае';

  @override
  String get favoritesAddToSavedMedia => 'Дадаць у захаваныя медыя';

  @override
  String get favoritesRemoveFromSavedMedia => 'Прыбраць з захаваных медыя';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Дадаць у абраныя GIF толькі па URL';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Прыбраць з абраных GIF па URL';

  @override
  String get savedMediaAddTitle => 'Дадаць у захаваныя медыя';

  @override
  String get savedMediaFormNameLabel => 'Імя';

  @override
  String get savedMediaFormNameHint => 'Мае выдатныя медыя';

  @override
  String get savedMediaFormAltTextLabel => 'Альтэрнатыўны тэкст';

  @override
  String get savedMediaFormAltTextHint => 'Апішыце медыя';

  @override
  String get savedMediaFormTagsLabel => 'Тэгі';

  @override
  String get savedMediaFormTagsHint => 'смешнае, рэакцыя, праца';

  @override
  String get savedMediaSaveError => 'Не ўдалося абнавіць захаваныя медыя.';

  @override
  String get savedMediaNameRequired => 'Увядзіце назву.';

  @override
  String get savedMediaEdit => 'Рэдагаваць';

  @override
  String get savedMediaEditTitle => 'Рэдагаваць захаваныя медыя';

  @override
  String get savedMediaDeleteTitle => 'Выдаліць захаваныя медыя';

  @override
  String savedMediaDeleteConfirm(String name) {
    return 'Выдаліць «$name» з захаваных медыя?';
  }

  @override
  String get savedMediaDeleteFailed => 'Не ўдалося выдаліць захаваныя медыя.';

  @override
  String get savedMediaSearchHint => 'Пошук захаваных медыя';

  @override
  String get savedMediaUnavailableTitle => 'Захаваныя медыя недаступныя';

  @override
  String get savedMediaUnavailableBody => 'Паспрабуйце яшчэ раз праз хвіліну.';

  @override
  String get savedMediaEmptyTitle => 'Няма захаваных медыя';

  @override
  String get savedMediaEmptyBody =>
      'Захоўвайце медыя з паведамленняў, каб бачыць іх тут.';

  @override
  String get savedMediaNoResultsTitle => 'Няма вынікаў';

  @override
  String get savedMediaNoResultsBody =>
      'Паспрабуйце іншы пошукавы запыт або фільтр.';

  @override
  String get savedMediaFilterAll => 'Усе';

  @override
  String get savedMediaFilterImages => 'Выявы';

  @override
  String get savedMediaFilterVideos => 'Відэа';

  @override
  String get savedMediaFilterAudio => 'Аўдыя';

  @override
  String get savedMediaFilterGifs => 'GIF';

  @override
  String get savedMediaGifBadge => 'GIF';

  @override
  String get gifFavoriteFirstTimeTitle => 'Як захоўваць вашы абраныя GIF?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'Пазначаныя зорачкай GIF можна захоўваць у абраным толькі па URL або загружаць у захаваныя медыя. Выберыце варыянт, які вам больш падыходзіць. Змяніць яго можна ў любы час у раздзеле Налады > Дадаткова > Медыя.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'Абранае толькі па URL (прадвызначана): сінхранізуецца паміж вашымі прыладамі, без загрузкі, не ўлічваецца ў захаваных медыя. Арыгінальнае медыя можа знікнуць, калі яго выдаліць сайт, дзе яно размешчана.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Захаваныя медыя: загружаюцца, падтрымліваюць тэгі і пошук, захоўваюцца назаўсёды, але ўлічваюцца ў ліміт захаваных медыя.';

  @override
  String get gifFavoriteFirstTimeHint => 'Мы спытаем толькі адзін раз.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly => 'Толькі па URL (рэкамендуецца)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia =>
      'Выкарыстоўваць захаваныя медыя';

  @override
  String get favoritesHideConfirmTitle => 'Схаваць абранае';

  @override
  String get favoritesHideConfirmDescription =>
      'Усе элементы інтэрфейсу, звязаныя з абраным, у тым ліку кнопкі і пункты меню, будуць схаваныя. Ваша абранае захаваецца, і яго можна зноў уключыць у любы час у раздзеле Налады > Дадаткова > Выгляд.';

  @override
  String get favoritesDirectMessageSubtitle => 'Асабістае паведамленне';

  @override
  String get messagesMediaDisplayGroupTitle => 'Дысплэй';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Кіруйце тым, як паказваюцца паведамленні, медыя і іншае змесціва.';

  @override
  String get messagesMediaMediaGroupTitle => 'Медыя';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Наладзьце памеры медыя і кнопкі.';

  @override
  String get messagesMediaInputGroupTitle => 'Увод';

  @override
  String get messagesMediaInputGroupDescription =>
      'Наладзьце поле ўводу паведамленняў.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Бакавая панэль';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Наладзьце выгляд бакавой панэлі суполкі.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Прадвызначана хаваць заглушаныя каналы';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Аўтаматычна хаваць заглушаныя каналы на бакавой панэлі пры далучэнні да новых суполак';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Прадвызначана хаваць заглушаныя каналы?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'У новых суполках, да якіх вы далучыцеся, заглушаныя каналы будуць аўтаматычна схаваны. Ужыць гэту наладу і да ўсіх вашых цяперашніх суполак?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Больш не хаваць заглушаныя каналы прадвызначана?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'У новых суполках, да якіх вы далучыцеся, заглушаныя каналы больш не будуць аўтаматычна хавацца. Паказваць заглушаныя каналы і ва ўсіх вашых цяперашніх суполках?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Ужыць да ўсіх суполак';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Паказаць ва ўсіх суполках';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Толькі новыя суполкі';

  @override
  String get messagesMediaDisplaySectionTitle => 'Адлюстраванне медыя';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Кіруйце тым, як паказваюцца выявы, відэа і іншыя медыя. Усе медыя змяншаюцца і канвертуюцца. Вельмі вялікія файлы, якія нельга сціснуць да папярэдняга прагляду, не будуць убудоўвацца незалежна ад гэтых налад.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Калі адпраўлены ў чат як спасылкі';

  @override
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'Калі загружана непасрэдна ў $productName';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle =>
      'Папярэдні прагляд спасылак';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Кіруйце папярэднім праглядам спасылак на сайты ў чаце';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Паказваць убудаванні і папярэдні прагляд спасылак на сайты';

  @override
  String get messagesMediaReactionsSectionTitle => 'Рэакцыі';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Наладзьце рэакцыі эмоджы на паведамленні';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Паказваць рэакцыі эмоджы на паведамленнях';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Змесціва спойлера';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Кіруйце паказам спойлераў';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Паказваць спойлеры';

  @override
  String get messagesMediaSpoilersOnClickName => 'Па націсканні';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Паказваць змесціва спойлера пасля націскання';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'У каналах, якія я мадэрую';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Заўсёды паказваць спойлеры ў каналах, дзе ў вас ёсць дазвол «Кіраваць паведамленнямі»';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Заўсёды';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Заўсёды паказваць змесціва пад спойлерам';

  @override
  String get messagesMediaSizeSectionTitle => 'Памеры медыя';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Наладзьце максімальны памер убудаваных і далучаных медыя. Меншыя памеры займаюць менш месца на экране, а большыя паказваюць больш дэталей.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Медыя са спасылак (убудаванні)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Загружаныя далучэнні';

  @override
  String get messagesMediaSizeCompactName => 'Кампактны (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Меншы памер медыя';

  @override
  String get messagesMediaSizeComfortableName => 'Зручны (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Большы памер медыя з больш дэталямі';

  @override
  String get messagesMediaGifsSectionTitle => 'Паводзіны GIF';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Кіруйце тым, як GIF устаўляюцца ў чат';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Аўтаматычна адпраўляць GIF пасля выбару';

  @override
  String get messagesMediaCameraUploadsSectionTitle => 'Загрузкі з камеры';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Выберыце, ці захоўваць на прыладзе фота і відэа, знятыя ўбудаванай камерай';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel =>
      'Захоўваць на прыладзе';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Аўтадапаўненне выразаў (праз двукроп’е)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Выберыце, што паказваецца ў аўтадапаўненні выразаў, калі вы ўводзіце двукроп’е. Наладзьце прапановы на свой густ.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Паказваць стандартныя эмоджы ў аўтадапаўненні выразаў';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Паказваць уласныя эмоджы ў аўтадапаўненні выразаў';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Паказваць стыкеры ў аўтадапаўненні выразаў';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Паказваць захаваныя медыя ў аўтадапаўненні выразаў';

  @override
  String get accessibilitySaturationTitle => 'Насычанасць';

  @override
  String get accessibilityVisualGroupTitle => 'Візуальныя';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'Заўсёды падкрэсліваць спасылкі';

  @override
  String get accessibilityShowAltTextOnImagesLabel =>
      'Паказваць альтэрнатыўны тэкст на выявах';

  @override
  String get accessibilityShowAltTextOnImagesDescription =>
      'Паказваць альтэрнатыўны тэкст пад выявамі, калі ён ёсць.';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Прыглушаць закрэслены тэкст';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'Папярэдні прагляд паведамленняў у асабістых чатах';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Рэжым папярэдняга прагляду паведамленняў у асабістых чатах';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Усе паведамленні';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Паказваць папярэдні прагляд паведамленняў для ўсіх асабістых чатаў';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Толькі непрачытаныя асабістыя чаты';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Паказваць папярэдні прагляд паведамленняў толькі для асабістых чатаў з непрачытанымі паведамленнямі';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Няма';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Не паказваць папярэдні прагляд паведамленняў у спісе асабістых чатаў';

  @override
  String get accessibilityScreenReaderGroupTitle => 'Праграма чытання з экрана';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Кіруйце тым, як $productName працуе з праграмамі чытання з экрана.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Абвяшчаць новыя паведамленні';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Дазволіць праграмам чытання з экрана паведамляць пра новыя паведамленні, якія прыходзяць у адкрыты канал. На гукі апавяшчэнняў гэта не ўплывае.';

  @override
  String get accessibilityTtsGroupTitle => 'Агучванне тэксту';

  @override
  String get accessibilityTtsGroupDescription =>
      'Выберыце хуткасць агучвання тэксту.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel => 'Хуткасць агучвання';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Прайграць узор';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Узор цішыні';

  @override
  String get accessibilityPreviewButtonLabel => 'Кнопка папярэдняга прагляду';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'Так выглядаюць спасылкі: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Карыстальнік для прагляду';

  @override
  String get accessibilityKeyboardGroupTitle => 'Клавіятура';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Паказваць рамку фокусу ў тэкставым полі чата';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'Клавіша Escape выключае рэжым клавіятуры';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Паказваць спалучэнні клавіш у кантэкстным меню';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Пытаць пацвярджэнне перад пачаткам выклікаў';

  @override
  String get accessibilityAnimationGroupTitle => 'Анімацыя';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'Памяншэнне руху ўключана, таму анімацыі змесціва прадвызначана прыпынены. Любую з іх можна зноў уключыць, каб яна прайгравалася.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel =>
      'Прайграваць аніміраваныя эмоджы';

  @override
  String get accessibilityAutoPlayGifsMobileLabel =>
      'Аўтаматычна прайграваць GIF';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'Аўтаматычна прайграваць GIF, калі $productName у фокусе';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Прайграецца, нягледзячы на памяншэнне руху.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Прыпынена праз памяншэнне руху. Уключыце, каб аніміраваныя эмоджы прайграваліся.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Прыпынена праз памяншэнне руху. Уключыце, каб GIF прайграваліся.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Анімацыі стыкераў';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Налада анімацыі стыкераў';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Заўсёды аніміраваць';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Стыкеры заўсёды будуць аніміраваныя';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Аніміраваць пры ўзаемадзеянні';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Стыкеры будуць аніміравацца, калі вы на іх націскаеце';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Стыкеры будуць аніміравацца, калі вы наводзіце на іх курсор або ўзаемадзейнічаеце з імі';

  @override
  String get accessibilityStickerNeverAnimateName => 'Ніколі не аніміраваць';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Стыкеры ніколі не будуць аніміравацца';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Заўсёды аніміраваць, нягледзячы на зменшаны рух.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'Пры памяншэнні руху стыкеры анімуюцца толькі пры ўзаемадзеянні. Каб змяніць гэта, выберыце «Заўсёды аніміраваць».';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'Прадвызначана на мабільных прыладах анімацыя ўключаецца пры ўзаемадзеянні, каб берагчы зарад батарэі.';

  @override
  String get accessibilityMotionGroupTitle => 'Рух';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Сінхранізаваць наладу памяншэння руху з сістэмай';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Выкарыстоўваць сістэмную наладу памяншэння руху на гэтай прыладзе або наладзіць яго ніжэй.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Памяншаць рух';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Адключыць анімацыі і пераходы. Зараз гэтым кіруе сістэмная налада.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Адключыць анімацыі і пераходы ва ўсёй праграме.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Аніміраванымі эмоджы, GIF і стыкерамі вы кіруеце на ўкладцы «Анімацыя».';

  @override
  String get accessibilityConfirmStartCallTitle => 'Пачаць выклік?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Вы сапраўды хочаце пачаць гэты выклік?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Пачаць выклік';

  @override
  String get accessibilityTtsSampleDescription =>
      'Праслухайце ўзорны сказ з выбранай хуткасцю.';

  @override
  String get accessibilityTtsSampleText =>
      'Док, я з будучыні. Я прыбыў сюды на машыне часу, якую вы вынайшлі. Цяпер мне патрэбна ваша дапамога, каб вярнуцца ў 1985 год.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'Сінтэз маўлення на гэтай прыладзе недаступны.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Не ўдалося прайграць агучванне. Паспрабуйце яшчэ раз або праверце, ці працуе вывад гуку.';

  @override
  String get ttsSubstitutionUnknownUser => 'невядомы карыстальнік';

  @override
  String get ttsSubstitutionUnknownRole => 'невядомая роля';

  @override
  String get ttsSubstitutionUnknownChannel => 'невядомы канал';

  @override
  String get ttsSubstitutionCodeBlock => 'блок кода';

  @override
  String get ttsSubstitutionSpoiler => 'спойлер';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'эмоджы $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return 'слэш $commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName кажа: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return '$authorName адказвае $replyAuthorName: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'адпраўляе стыкер';

  @override
  String get ttsSentAttachment => 'адпраўляе далучэнне';

  @override
  String ttsSentAttachments(int count) {
    return 'адпраўляе далучэнні: $count';
  }

  @override
  String get ttsSentEmbed => 'адпраўляе ўбудаванне';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author адпраўляе $summary';
  }

  @override
  String get dmListSentAnAttachment => 'Адпраўлена далучэнне';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username замацоўвае паведамленне ў гэтым канале.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username дадае $userName у групу.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username дадае кагосьці ў групу.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username пакідае групу.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username выдаляе $userName з групы.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username выдаляе кагосьці з групы.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username змяняе назву канала на $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username змяняе назву канала.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username змяняе значок канала.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username пачынае выклік.';
  }

  @override
  String get systemCallJoinTheCall => 'Далучыцца да выкліку';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return 'Выклік ад $username доўжыўся $duration.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'Вы прапусцілі выклік ад $username, які доўжыўся $duration.';
  }

  @override
  String systemCallMissed(String username) {
    return 'Вы прапусцілі выклік ад $username.';
  }

  @override
  String get systemCallDurationFewSeconds => 'некалькі секунд';

  @override
  String get systemCallDurationMinute => 'хвіліна';

  @override
  String get systemCallDurationOneYear => '1 год';

  @override
  String get systemCallDurationOneMonth => '1 месяц';

  @override
  String get systemCallDurationOneWeek => '1 тыдзень';

  @override
  String get systemCallDurationOneDay => '1 дзень';

  @override
  String get systemCallDurationOneHour => '1 гадзіна';

  @override
  String systemCallDurationYears(int count) {
    return '$count г';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count мес';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count тыдз';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count дн';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count гадз';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count хв';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Абнавіце $productName, каб убачыць гэта паведамленне.';
  }

  @override
  String get voiceConnectionConfirmTitle =>
      'Пацвярджэнне галасавога падключэння';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Вы ўжо падключыліся да гэтага галасавога канала з $count іншай прылады. Што вы хочаце зрабіць?',
      many:
          'Вы ўжо падключыліся да гэтага галасавога канала з $count іншых прылад. Што вы хочаце зрабіць?',
      few:
          'Вы ўжо падключыліся да гэтага галасавога канала з $count іншых прылад. Што вы хочаце зрабіць?',
      one:
          'Вы ўжо падключыліся да гэтага галасавога канала з $count іншай прылады. Што вы хочаце зрабіць?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Перайсці на гэту прыладу';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Проста далучыцца (захаваць іншыя падключэнні)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Нічога не рабіць, я не хачу далучацца';

  @override
  String get voiceJoinFailedTitle =>
      'Не ўдалося далучыцца да галасавога канала';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Не ўдалося адключыць іншыя вашы прылады. Паспрабуйце яшчэ раз крыху пазней.';

  @override
  String get voiceChannelJoin => 'Далучыцца да галасавога канала';

  @override
  String get voiceCallJoin => 'Далучыцца да выкліку';

  @override
  String get voiceChannelJoinConnect => 'Падключыцца да галасавога канала';

  @override
  String get voiceChannelNoConnectPermission =>
      'У вас няма дазволу далучацца да гэтага галасавога канала';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Мікрафон, камера і дэманстрацыя экрана абаронены скразным шыфраваннем.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Мікрафон, камера і дэманстрацыя экрана абаронены скразным шыфраваннем.';

  @override
  String get voiceChannelE2eeBroken =>
      'Скразное шыфраванне недаступнае, бо ў гэтым галасавым канале ёсць удзельнік, які яго не падтрымлівае.';

  @override
  String get voiceCallE2eeBroken =>
      'Скразное шыфраванне недаступнае, бо ў гэтым выкліку ёсць удзельнік, які яго не падтрымлівае.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Каб далучыцца да гэтага зашыфраванага выкліку, абнавіце кліент.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Не ўдалося запусціць мікрафон. Вы ўсё яшчэ ў выкліку.';

  @override
  String get voiceChannelStatusConnecting => 'Падключэнне…';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Мабільная прылада';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Камп’ютар';

  @override
  String get voiceParticipantTooltipCommunityMuted =>
      'Мікрафон выключаны суполкай';

  @override
  String get voiceParticipantTooltipMuted => 'Заглушана';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Гук выключаны суполкай';

  @override
  String get voiceParticipantTooltipDeafened => 'Гук выключаны';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Падключэнне: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count удзельніка',
      many: '$count удзельнікаў',
      few: '$count удзельнікі',
      one: '$count удзельнік',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Выйсці';

  @override
  String get voiceControlMute => 'Заглушыць';

  @override
  String get voiceControlUnmute => 'Уключыць апавяшчэнні';

  @override
  String get voiceControlDeafen => 'Выключыць гук';

  @override
  String get voiceControlUndeafen => 'Уключыць гук';

  @override
  String get voiceControlVideo => 'Відэа';

  @override
  String get voiceControlMoreOptions => 'Іншыя параметры';

  @override
  String get voiceControlInputSettings => 'Налады ўводу';

  @override
  String get voiceControlOutputSettings => 'Налады вываду';

  @override
  String get voiceControlCameraSettings => 'Налады камеры';

  @override
  String get voiceControlScreenShareSettings => 'Налады дэманстрацыі экрана';

  @override
  String get voiceControlStartScreenShare => 'Паказаць экран';

  @override
  String get voiceControlStopScreenShare => 'Спыніць дэманстрацыю';

  @override
  String get voiceControlFlipCamera => 'Пераключыць камеру';

  @override
  String get voiceControlScreenShare => 'Дэманстрацыя экрана';

  @override
  String get voiceScreenShareNotificationText =>
      'Ідзе дэманстрацыя вашага экрана.';

  @override
  String get voiceControlDisconnect => 'Адключыцца';

  @override
  String get voiceInChat => 'У галасавым чаце';

  @override
  String get voiceConnectionFailed => 'Не ўдалося падключыцца';

  @override
  String get voiceConnectionRetry => 'Паспрабаваць яшчэ раз';

  @override
  String get voiceConnectionDismiss => 'Закрыць';

  @override
  String get voiceCallControlsSheetLabel => 'Кіраванне галасавым выклікам';

  @override
  String get voiceCallBarOpenCallHint => 'Адкрывае выклік';

  @override
  String get voiceParticipantSpeaking => 'Гаворыць';

  @override
  String get voiceParticipantOptionsAction => 'Параметры ўдзельніка';

  @override
  String voiceParticipantOtherDevicesLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Паказаць яшчэ $count прылады',
      many: 'Паказаць яшчэ $count прылад',
      few: 'Паказаць яшчэ $count прылады',
      one: 'Паказаць яшчэ $count прыладу',
    );
    return '$_temp0';
  }

  @override
  String voiceParticipantOptionsFor(String name) {
    return 'Participant options for $name';
  }

  @override
  String get voiceParticipantCollapseDevices => 'Collapse devices';

  @override
  String get voiceFocusShowMembers => 'Show members';

  @override
  String get voiceFocusHideMembers => 'Hide members';

  @override
  String get voiceFocusResizeMembersRow => 'Resize members row';

  @override
  String get voicePipReturnToCallLabel => 'Вярнуцца да выкліку';

  @override
  String voiceAnnounceUserJoined(String name) {
    return '$name далучаецца';
  }

  @override
  String voiceAnnounceUserLeft(String name) {
    return '$name выходзіць';
  }

  @override
  String voiceAnnounceUsersJoined(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Далучыліся $count чалавека',
      many: 'Далучыліся $count чалавек',
      few: 'Далучыліся $count чалавекі',
      one: 'Далучыўся $count чалавек',
    );
    return '$_temp0';
  }

  @override
  String voiceAnnounceUsersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Выйшлі $count чалавека',
      many: 'Выйшлі $count чалавек',
      few: 'Выйшлі $count чалавекі',
      one: 'Выйшаў $count чалавек',
    );
    return '$_temp0';
  }

  @override
  String get voiceAnnounceSomeone => 'Хтосьці';

  @override
  String get voiceAnnounceConnected => 'Падключана да галасавога канала';

  @override
  String get voiceAnnounceReconnecting =>
      'Паўторнае падключэнне да галасавога канала';

  @override
  String get voiceAnnounceReconnected => 'Зноў падключана да галасавога канала';

  @override
  String get voiceAnnounceDisconnected => 'Адключана ад галасавога канала';

  @override
  String get voiceAnnounceMoved => 'Вы ў іншым галасавым канале';

  @override
  String get voiceAnnounceServerMuted => 'Мадэратар выключыў вам мікрафон';

  @override
  String get voiceAnnounceServerUnmuted => 'Мадэратар уключыў вам мікрафон';

  @override
  String get voiceAnnounceServerDeafened => 'Мадэратар выключыў вам гук';

  @override
  String get voiceAnnounceServerUndeafened => 'Мадэратар уключыў вам гук';

  @override
  String get voiceAnnounceMicMuted => 'Мікрафон выключаны';

  @override
  String get voiceAnnounceMicUnmuted => 'Мікрафон уключаны';

  @override
  String get accessibilityAnnounceCallJoinsAndLeavesLabel =>
      'Абвяшчаць, хто далучаецца да выкліку і выходзіць з яго';

  @override
  String get accessibilityAnnounceCallJoinsAndLeavesDescription =>
      'Дазволіць праграмам чытання з экрана паведамляць, хто далучаецца да вашага галасавога выкліку або выходзіць з яго. Пра змены злучэння і дзеянні мадэратараў паведамляецца заўсёды.';

  @override
  String get voiceConnectionDisconnected => 'Адключана';

  @override
  String voicePingMs(int currentLatency) {
    return 'Пінг: $currentLatency мс';
  }

  @override
  String get voiceMeasuringLatency => 'Вымярэнне затрымкі...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Перайсці да $channelSourceLabel';
  }

  @override
  String get shellResizeSidebar => 'Змяніць памер бакавой панэлі';

  @override
  String get voiceConnectionTitle => 'Галасавое падключэнне';

  @override
  String get voiceConnectionAdvancedStats => 'Дадаткова';

  @override
  String get voiceShowCallAvatars => 'Паказваць аватары ў выкліку';

  @override
  String get voiceShowConnectionId => 'Паказваць ID падключэння';

  @override
  String get voiceAudioProcessing => 'Апрацоўка гуку';

  @override
  String get voiceConnectionSessionSection => 'Сеанс';

  @override
  String get voiceConnectionDurationLabel => 'Працягласць';

  @override
  String get voiceConnectionParticipantsLabel => 'Удзельнікі';

  @override
  String get voiceConnectionNetworkSection => 'Сетка';

  @override
  String get voiceConnectionPingLabel => 'Пінг';

  @override
  String get voiceConnectionJitterLabel => 'Джытар';

  @override
  String get voiceConnectionSendLabel => 'Адправіць';

  @override
  String get voiceConnectionReceiveLabel => 'Атрымана';

  @override
  String get voiceConnectionUnavailable => '—';

  @override
  String voiceConnectionDuration(int minutes, int seconds) {
    return '$minutes хв $seconds с';
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
  String get userAreaMuteMicrophone => 'Выключыць мікрафон';

  @override
  String get userAreaUnmuteMicrophone => 'Уключыць мікрафон';

  @override
  String get userAreaUserSettings => 'Налады карыстальніка';

  @override
  String get voiceParticipantMenuViewProfile => 'Паглядзець профіль';

  @override
  String get voiceParticipantMenuReport => 'Паскардзіцца';

  @override
  String get voiceParticipantMenuFocus => 'Вылучыць гэтага чалавека';

  @override
  String get voiceParticipantMenuUnfocus => 'Зняць вылучэнне';

  @override
  String get voiceParticipantMenuCommunityMute =>
      'Выключыць мікрафон у суполцы';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Выключыць гук у суполцы';

  @override
  String get voiceParticipantMenuUserVolume => 'Гучнасць карыстальніка';

  @override
  String get voiceParticipantMenuStreamVolume => 'Гучнасць трансляцыі';

  @override
  String get voiceParticipantMenuStopStreaming => 'Спыніць трансляцыю';

  @override
  String get voiceControlChat => 'Чат';

  @override
  String get voiceCallViewModeLabel => 'Выгляд';

  @override
  String get voiceCallViewModeGrid => 'Сетка';

  @override
  String get voiceCallViewModeFocus => 'Фокус';

  @override
  String get voicePanelSettingsSectionTitle => 'Налады голасу';

  @override
  String get voicePanelUseEarpieceLabel =>
      'Выводзіць гук праз размоўны дынамік';

  @override
  String get voiceOutputRouteSpeaker => 'Дынамік';

  @override
  String get voiceOutputRouteEarpiece => 'Размоўны дынамік';

  @override
  String get voiceOutputRouteHeadset => 'Навушнікі';

  @override
  String get voiceOutputRouteBluetooth => 'Bluetooth';

  @override
  String get voiceOutputRouteBluetoothLe => 'Bluetooth LE';

  @override
  String get voiceOutputRouteHearingAid => 'Слыхавы апарат';

  @override
  String get voiceOutputRouteUsb => 'USB-гарнітура';

  @override
  String get voiceChangeAudioOutputLabel => 'Змяніць аўдыявыхад';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Паказваць толькі відэа';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Паказваць толькі ўдзельнікаў з уключанай камерай.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Паказваць маю камеру';

  @override
  String get voicePrioritizeSpeakersLabel => 'Прыярытэт тым, хто гаворыць';

  @override
  String get voiceTextChatShow => 'Паказаць чат';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count непрачытанага паведамлення',
      many: '$count непрачытаных паведамленняў',
      few: '$count непрачытаныя паведамленні',
      one: '$count непрачытанае паведамленне',
    );
    return 'Паказаць чат: $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Для відэа патрэбны дазвол на доступ да камеры.';

  @override
  String get voiceMicPermissionRequired =>
      'Каб уключыць мікрафон у гэтым выкліку, дайце доступ да мікрафона.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Не ўдалося пачаць дэманстрацыю экрана. Паспрабуйце яшчэ раз.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Дазвол на дэманстрацыю экрана не дадзены.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'На гэтай прыладзе дэманстрацыя экрана недаступная.';

  @override
  String get voiceWatchStream => 'Глядзець трансляцыю';

  @override
  String get voiceStopWatching => 'Спыніць прагляд';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Спыніць прагляд цяперашняй трансляцыі';

  @override
  String get voiceScreenShareEnterFullscreenTooltip => 'На ўвесь экран';

  @override
  String get voiceScreenShareExitFullscreenTooltip =>
      'Выйсці з поўнаэкраннага рэжыму';

  @override
  String voiceVideoZoomLevel(String scale) {
    return 'Маштаб $scale';
  }

  @override
  String get voiceOwnScreenShareTitle => 'Вы ведзяце трансляцыю';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Удзельнікі бачаць вашу трансляцыю.';

  @override
  String get voiceBlockedParticipantVideoHidden =>
      'Відэа ад карыстальніка, якога вы заблакіравалі';

  @override
  String get voiceLiveBadge => 'У эфіры';

  @override
  String get dmVoiceViewCall => 'Паглядзець выклік';

  @override
  String get dmVoiceCallFullScreen => 'На ўвесь экран';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Адкрыць выклік на ўвесь экран';

  @override
  String get dmVoiceStripStatusConnecting => 'Падключэнне…';

  @override
  String get dmVoiceStripStatusInCall => 'У выкліку';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Галасавы выклік';

  @override
  String get dmVoiceCallBarConnecting => 'Падключэнне…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Асабісты выклік';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Групавы выклік';

  @override
  String get dmVoiceCallBarIssueFallback => 'Праблема з галасавой сувяззю';

  @override
  String get dmVoiceFullscreenTitle => 'Галасавы';

  @override
  String get voiceCallBarGuildConnectedFallback =>
      'Галасавая сувязь падключана';

  @override
  String get notificationsPageTitle => 'Апавяшчэнні';

  @override
  String get notificationsFilterUnreads => 'Непрачытанае';

  @override
  String get notificationsFilterMentions => 'Згадванні';

  @override
  String get notificationsBookmarksTooltip => 'Закладкі';

  @override
  String get notificationsMentionFilterTooltip => 'Фільтраваць згадванні';

  @override
  String get notificationsMentionFiltersTitle => 'Фільтры згадванняў';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Уключаць згадванні @everyone і @here';

  @override
  String get notificationsMentionIncludeRoles => 'Уключаць згадванні роляў';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Уключаць усе згадванні ў суполках';

  @override
  String get notificationsNoUnreadTitle => 'Няма непрачытаных паведамленняў';

  @override
  String get notificationsNoUnreadBody => 'Вы ўсё прагледзелі.';

  @override
  String get notificationsNoMentionsTitle => 'Няма нядаўніх згадванняў';

  @override
  String get notificationsNoMentionsBody =>
      'Тут на працягу 7 дзён будуць паказвацца ўсе @згадванні вас.';

  @override
  String get notificationsMentionsEndTitle => 'Вы дайшлі да канца';

  @override
  String get notificationsMentionsEndBody =>
      'Вы праглядзелі ўсе апошнія згадванні. Не хвалюйцеся, хутка тут з’явяцца новыя.';

  @override
  String get notificationsJump => 'Перайсці';

  @override
  String get notificationsRemoveMentionTooltip => 'Прыбраць згадванне';

  @override
  String get notificationsViewAllUnread => 'Паглядзець усё непрачытанае';

  @override
  String get notificationsMarkAsRead => 'Пазначыць як прачытанае';

  @override
  String get notificationsExpand => 'Разгарнуць';

  @override
  String get notificationsCollapse => 'Згарнуць';

  @override
  String get notificationsMessageUnavailable =>
      'Не ўдалося загрузіць гэта паведамленне.';

  @override
  String notificationsMentionedYouIn(String author, String place) {
    return '$author згадвае вас у $place:';
  }

  @override
  String notificationsRepliedToYouIn(String author, String place) {
    return '$author адказвае вам у $place:';
  }

  @override
  String notificationsMentionedYou(String author) {
    return '$author згадвае вас:';
  }

  @override
  String notificationsRepliedToYou(String author) {
    return '$author адказвае вам:';
  }

  @override
  String notificationsMentionPlace(String server, String channel) {
    return '$server – $channel';
  }

  @override
  String get notificationsSendReply => 'Адказаць';

  @override
  String get notificationsRecentActivity => 'Нядаўняя актыўнасць';

  @override
  String get notificationsRemoveNotification => 'Выдаліць апавяшчэнне';

  @override
  String characterCounterRemaining(int remaining) {
    return 'Засталося сімвалаў: $remaining';
  }

  @override
  String get characterCounterTooLong => 'Паведамленне занадта доўгае';

  @override
  String characterCounterTooLongToast(int maxLength) {
    final intl.NumberFormat maxLengthNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String maxLengthString = maxLengthNumberFormat.format(maxLength);

    return 'Паведамленне можа змяшчаць не больш за $maxLengthString сімвалаў. Скараціце гэта, каб адправіць яго.';
  }

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return 'Засталося сімвалаў: $remaining. З $productName можна пісаць да $premiumMaxLength сімвалаў.';
  }

  @override
  String get chatMessageFailedToSend => 'Не ўдалося адправіць паведамленне';

  @override
  String get chatMessageFailedToSendTapForOptions =>
      'Не ўдалося адправіць паведамленне. Націсніце, каб убачыць варыянты.';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Не ўдалося даставіць ваша паведамленне. Звычайна гэта бывае, калі ў вас няма агульнай суполкі з атрымальнікам або атрымальнік прымае асабістыя паведамленні толькі ад сяброў. Магчыма, вам таксама трэба змяніць налады прыватнасці асабістых паведамленняў у раздзеле $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Ваша паведамленне не дастаўлена. Каб адпраўляць асабістыя паведамленні, трэба замацаваць за сабой уліковы запіс.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Ваша паведамленне не дастаўлена. Каб адпраўляць паведамленні, трэба замацаваць за сабой уліковы запіс.';

  @override
  String get chatSendFailureContentBlocked =>
      'Ваша паведамленне не дастаўлена, бо яго пазначылі нашы сістэмы бяспекі. Калі вы лічыце, што гэта памылка, звярніцеся ў службу падтрымкі.';

  @override
  String get chatSendFailureContentBlockedSelfHosted =>
      'Ваша паведамленне не дастаўлена, бо яго пазначылі нашы сістэмы бяспекі. Калі вы лічыце, што гэта памылка, звярніцеся да адміністратараў гэтага экзэмпляра.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Не ўдалося даставіць ваша паведамленне, бо ў ім ёсць эмоджы або стыкеры для дарослых, якія тут не дазволены.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'Гэта паведамленне бачыце толькі вы.';

  @override
  String get chatClientSystemDismiss => 'Закрыць';

  @override
  String get privacyDashboardCommunicationSection => 'Зносіны';

  @override
  String get privacyDashboardProfilePrivacySection => 'Прыватнасць профілю';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Сябры і асабістыя паведамленні';

  @override
  String get privacyDashboardActivitySharingSection =>
      'Абагульванне актыўнасці';

  @override
  String get privacyDashboardSensitiveContentSection => 'Адчувальнае змесціва';

  @override
  String get privacyDashboardDataExportSection => 'Экспарт даных';

  @override
  String get privacyDashboardDataDeletionSection => 'Выдаленне даных';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Хто можа бачыць ваш поўны профіль';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Сябры і ўсе суполкі';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Ваш поўны профіль бачаць сябры і ўсе ў вашых суполках';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Толькі сябры і невялікія суполкі';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Ваш поўны профіль бачаць сябры і ўдзельнікі вашых суполак, у якіх не больш за 200 удзельнікаў';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Толькі сябры';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Ваш поўны профіль бачаць толькі вашы сябры';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Запыты ў сябры';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Усе';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends => 'Сябры сяброў';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Удзельнікі суполкі';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Асабістыя паведамленні';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Дазволіць асабістыя паведамленні ад удзельнікаў суполкі';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Дазволіць асабістыя паведамленні ад ботаў суполкі';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Уваходныя выклікі';

  @override
  String get privacyDashboardAllowedCallers => 'Каму дазволена выклікаць';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Блакіраваць усе ўваходныя выклікі';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Дазваляць выклікі толькі ад сяброў (рэкамендуецца)';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Дазваляць выклікі ад сяброў і выбраных вамі дадатковых груп';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Дазваляць выклікі ад усіх, нават ад незнаёмых';

  @override
  String get privacyDashboardAdditionalGroups => 'Дадатковыя групы';

  @override
  String get privacyDashboardRingBehavior => 'Паводзіны званка';

  @override
  String get privacyDashboardSilentCalls => 'Бязгучныя выклікі ад усіх';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Хто можа дадаваць вас у групавыя чаты';

  @override
  String get privacyDashboardAllowedInvites => 'Каму дазволена запрашаць';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Нікому не дазваляць дадаваць вас у групавыя чаты без пытання';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Дазваляць дадаваць вас без пытання толькі сябрам (рэкамендуецца)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Дазваляць дадаваць вас сябрам і дадатковым групам';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Дазваляць усім дадаваць вас у групавыя чаты без пытання';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Галасавая актыўнасць у «Зараз актыўныя»';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Абагульваць галасавую актыўнасць з сябрамі';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Абагульваць галасавую актыўнасць з усімі сябрамі?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Спыніць абагульванне галасавой актыўнасці з усімі сябрамі?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Вы збіраецеся пачаць абагульваць сваю галасавую актыўнасць з усімі сябрамі, у тым ліку будучымі. Усе яны атрымаюць абнаўленне, а змяніць гэта зноў можна будзе толькі праз 24 гадзіны.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Вы збіраецеся спыніць абагульванне сваёй галасавой актыўнасці з усімі сябрамі, у тым ліку будучымі. Усе яны атрымаюць абнаўленне, а змяніць гэта зноў можна будзе толькі праз 24 гадзіны.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Так, абагуліць з усімі сябрамі';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm =>
      'Так, спыніць абагульванне';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Зноў будзе даступна праз $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Абагульванне галасавой актыўнасці абноўлена';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Зараз не ўдалося абнавіць абагульванне галасавой актыўнасці';

  @override
  String get privacyDashboardDataExportDesc =>
      'Стварыце архіў даных свайго ўліковага запісу для спампоўкі, у тым ліку паведамленні і URL далучэнняў. Большасць людзей хоча ўсё, але ніжэй можна звузіць аб’ём.';

  @override
  String get privacyDashboardExportMyData => 'Экспартаваць мае даныя';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Назаўсёды выдаліць адпраўленыя вамі паведамленні ў асабістых чатах, групавых чатах і суполках. Выдаленне ідзе ў фоне, і калі яно скончыцца, вы атрымаеце асабістае паведамленне.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Выдаліць мае паведамленні';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Дазволіць асабістыя паведамленні ад удзельнікаў суполкі?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Блакіраваць асабістыя паведамленні ад удзельнікаў суполкі?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Дазволіць ботам адпраўляць вам асабістыя паведамленні?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Забараніць ботам адпраўляць вам асабістыя паведамленні?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Ці хочаце вы таксама дазволіць асабістыя паведамленні ад удзельнікаў вашых цяперашніх суполак?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Ці хочаце вы таксама заблакіраваць асабістыя паведамленні ад удзельнікаў вашых цяперашніх суполак?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Ці хочаце вы таксама дазволіць ботам з вашых цяперашніх суполак адпраўляць вам асабістыя паведамленні?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Заблакіраваць таксама ботаў з суполак, у якіх вы ўжо ёсць?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'Гэту наладу можна змяніць і для кожнай суполкі асобна: утрымлівайце назву суполкі і выберыце налады прыватнасці.';

  @override
  String get privacyDashboardDmConfirmAllowAll => 'Дазволіць для ўсіх суполак';

  @override
  String get privacyDashboardDmConfirmBlockAll =>
      'Блакіраваць ва ўсіх суполках';

  @override
  String get privacyDashboardDmConfirmSkip => 'Прапусціць гэты крок';

  @override
  String get privacyDashboardDataRequestGoBack => 'Назад';

  @override
  String get privacyDashboardDataRequestExportTitle => 'Экспартаваць мае даныя';

  @override
  String get privacyDashboardDataRequestDeleteTitle =>
      'Выдаліць мае паведамленні';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'Мы апрацуем гэта як мага хутчэй. Калі ваш архіў будзе гатовы, вы атрымаеце ліст.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'Мы апрацуем гэта як мага хутчэй. Калі ўсё будзе гатова, вы атрымаеце ад нас асабістае паведамленне.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'Што ўключыць';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Усё';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Экспартаваць усе паведамленні, якія вы калі-небудзь адпраўлялі, а таксама ўсе налады ўліковага запісу, членства ў суполках і метаданыя.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'Уласны выбар';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Выберыце, якія тыпы размоў, суполкі і перыяд часу ўключыць у архіў.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Выберыце, што ўключыць';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Выберыце, якія тыпы размоў ачысціць.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Толькі месцы, да якіх у мяне больш няма доступу';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Выдаліць паведамленні толькі з суполак і групавых чатаў, якія вы пакінулі або з якіх вас выдалілі.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Якія размовы';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Уключыце тыпы размоў, якія трэба ўключыць.';

  @override
  String get privacyDashboardDataRequestKindDms => 'Адкрытыя асабістыя чаты';

  @override
  String get privacyDashboardDataRequestKindDmsClosed =>
      'Закрытыя асабістыя чаты';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'Групавыя чаты';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Суполкі';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Якія суполкі';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Фільтр суполак';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Уключыць усе, акрамя выбраных';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude => 'Толькі выбраныя';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'Зараз вы не ўваходзіце ні ў адну суполку.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Перыяд часу';

  @override
  String get privacyDashboardDataRequestDateMode => 'Перыяд часу';

  @override
  String get privacyDashboardDataRequestAllTime => 'За ўвесь час';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Уласны дыяпазон';

  @override
  String get privacyDashboardDataRequestStartDate => 'Дата пачатку';

  @override
  String get privacyDashboardDataRequestEndDate => 'Дата заканчэння';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Каб не абмяжоўваць перыяд з аднаго боку, пакіньце адпаведнае поле пустым.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Выберыце хаця б адзін тып размоў.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'Дата пачатку мусіць быць раней за дату заканчэння.';

  @override
  String get privacyDashboardDataRequestConfirmTitle =>
      'Праверце і пацвердзіце';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'Мы створым архіў для спампоўкі з усімі паведамленнямі, якія вы калі-небудзь адпраўлялі, і напішам вам, калі ён будзе гатовы. Спасылка для спампоўкі ў лісце дзейнічае 7 дзён.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'Мы створым архіў для спампоўкі паводле фільтраў ніжэй і напішам вам, калі ён будзе гатовы. Спасылка для спампоўкі ў лісце дзейнічае 7 дзён.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Назаўсёды выдаліць паведамленні, якія адпавядаюць фільтрам ніжэй. Гэта дзеянне нельга адмяніць.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'Калі працэс пачнецца, адмяніць яго будзе нельга. Калі ён скончыцца, мы адправім вам асабістае паведамленне.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'Запытаць экспарт';

  @override
  String get privacyDashboardDataRequestDeleteMessages =>
      'Выдаліць паведамленні';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Вобласць';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'Размовы';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Суполкі';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Перыяд часу';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'Няма';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'Ад $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'Да $end';
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
      other: '$count суполкі',
      many: '$count суполак',
      few: '$count суполак',
      one: '$count суполкі',
    );
    return 'Усе, акрамя $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count суполкі',
      many: '$count суполак',
      few: '$count суполкі',
      one: '$count суполка',
    );
    return 'Толькі $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Адкрытыя асабістыя чаты';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Закрытыя асабістыя чаты';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Асабістыя паведамленні (адкрытыя і закрытыя)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'Групавыя чаты';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded => 'Суполкі';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours гадзіны',
      many: '$hours гадзін',
      few: '$hours гадзіны',
      one: '$hours гадзіна',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes хвіліны',
      many: '$minutes хвілін',
      few: '$minutes хвіліны',
      one: '$minutes хвіліна',
    );
    return '$_temp0 і $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours гадзіны',
      many: '$hours гадзін',
      few: '$hours гадзіны',
      one: '$hours гадзіна',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes хвіліны',
      many: '$minutes хвілін',
      few: '$minutes хвіліны',
      one: '$minutes хвіліна',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds секунды',
      many: '$seconds секунд',
      few: '$seconds секунды',
      one: '$seconds секунда',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed =>
      'Не ўдалося загрузіць налады прыватнасці';

  @override
  String get privacyDashboardRetry => 'Паўтарыць';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Не ўдалося захаваць налады адчувальнага змесціва.';

  @override
  String get privacyDashboardDataRequestFailed => 'Не ўдалося выканаць запыт.';

  @override
  String get chatMessageDeleteFailed => 'Выдаліць неадпраўленае паведамленне';

  @override
  String get chatMessageAddReaction => 'Дадаць рэакцыю';

  @override
  String get doubleTapReactionHint => 'Двойчы націсніце на паведамленне, каб';

  @override
  String get doubleTapEditHint =>
      'Двойчы націсніце на сваё паведамленне, каб адрэдагаваць яго';

  @override
  String get doubleTapReactionEdit => 'Рэдагаваць';

  @override
  String get doubleTapReactionEditTitle => 'Змяніць прадвызначанае';

  @override
  String get doubleTapReactionEditSubtitle =>
      'Выберыце эмоджы для двайнога націскання';

  @override
  String get messagesMediaGesturesSectionTitle => 'Жэсты';

  @override
  String get messagesMediaGesturesSectionDescription =>
      'Наладзьце двайное націсканне і правядзенне па паведамленнях.';

  @override
  String get messagesMediaGesturesReactionLabel => 'Эмоджы рэакцыі';

  @override
  String get messagesMediaGesturesReactionDescription =>
      'Выкарыстоўваецца, калі двайное націсканне дадае рэакцыю.';

  @override
  String get messagesMediaGesturesDoubleTapActionLabel =>
      'Дзеянне пры двайным націсканні';

  @override
  String get messagesMediaGesturesDoubleTapActionReactName => 'Дадаць рэакцыю';

  @override
  String get messagesMediaGesturesDoubleTapActionReactDescription =>
      'Дадае ваша эмоджы для двайнога націскання як рэакцыю.';

  @override
  String get messagesMediaGesturesDoubleTapActionEditName =>
      'Рэдагаваць паведамленне';

  @override
  String get messagesMediaGesturesDoubleTapActionEditDescription =>
      'Адкрывае рэдактар для паведамленняў, якія вы адправілі. На іншыя паведамленні не ўплывае.';

  @override
  String get messagesMediaGesturesDoubleTapActionNoneName => 'Нічога';

  @override
  String get messagesMediaGesturesDoubleTapActionNoneDescription =>
      'Двайное націсканне выключана.';

  @override
  String get messagesMediaGesturesSwipeRightToLeftLabel =>
      'Правядзенне справа налева';

  @override
  String get messagesMediaGesturesSwipeRightToLeftReplyName =>
      'Адказ правядзеннем';

  @override
  String get messagesMediaGesturesSwipeRightToLeftReplyDescription =>
      'Правядзіце па паведамленні, каб адказаць, а каб адрэдагаваць сваё паведамленне, утрымлівайце яго.';

  @override
  String get messagesMediaGesturesSwipeRightToLeftChannelDetailsName =>
      'Паказаць звесткі пра канал';

  @override
  String get messagesMediaGesturesSwipeRightToLeftChannelDetailsDescription =>
      'Правядзіце па паведамленні або націсніце на загаловак канала, каб адкрыць звесткі пра канал на бакавой панэлі.';

  @override
  String get chatMessageEdit => 'Рэдагаваць паведамленне';

  @override
  String get chatMessageReply => 'Адказаць';

  @override
  String get notificationReplyPlaceholder => 'Паведамленне';

  @override
  String get notificationReplyFailed => 'Не ўдалося адправіць адказ';

  @override
  String get notificationMarkReadFailed => 'Couldn\'t mark as read';

  @override
  String get notificationChannelMessages => 'Паведамленні';

  @override
  String get notificationChannelDirectMessages => 'Асабістыя паведамленні';

  @override
  String get notificationChannelForumPosts => 'Новыя допісы на форуме';

  @override
  String get notificationChannelMessagesSilent => 'Паведамленні без гуку';

  @override
  String get notificationChannelDirectMessagesSilent =>
      'Асабістыя паведамленні без гуку';

  @override
  String get notificationChannelDescription => 'Паведамленні і апавяшчэнні';

  @override
  String get notificationNewMessageFallback => 'Новае паведамленне';

  @override
  String get notificationLocalUserName => 'Я';

  @override
  String get notificationGroupDmTitle => 'Групавы чат';

  @override
  String get notificationUnknownSender => 'Невядома';

  @override
  String notificationAttachmentPreview(String filename) {
    return 'Далучэнне: $filename';
  }

  @override
  String notificationStickerPreview(String name) {
    return 'Стыкер: $name';
  }

  @override
  String get chatMessageForward => 'Пераслаць';

  @override
  String get forwardMessageTitle => 'Пераслаць паведамленне';

  @override
  String get forwardSearchHint => 'Пошук каналаў або асабістых чатаў';

  @override
  String get forwardDirectMessagesSection => 'Асабістыя паведамленні';

  @override
  String get forwardCommentHint => 'Дадаць каментарый (неабавязкова)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Адправіць ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Каналы не знойдзены';

  @override
  String get forwardSuccessToast => 'Паведамленне перасланае';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Каментарыі недаступныя, бо ў адным з выбраных каналаў уключаны павольны рэжым.';

  @override
  String get forwardSendSlowmodeBlocked =>
      'Чакаем, пакуль скончыцца павольны рэжым у адным або некалькіх выбраных каналах.';

  @override
  String get slowmodeRateLimitedTitle => 'Павольны рэжым актыўны';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'Уключаны павольны рэжым: пачакайце $duration, перш чым адправіць наступнае паведамленне.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'Падчас павольнага рэжыму прамая загрузка адключана.';

  @override
  String get shareMediaTitle => 'Падзяліцца ў';

  @override
  String get shareMediaMessageHint => 'Дадайце паведамленне (неабавязкова)…';

  @override
  String get shareMediaSendButton => 'Адправіць';

  @override
  String get shareMediaSuccessToast => 'Медыя адпраўлены';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'Адпраўлена адрасатам: $count';
  }

  @override
  String get shareMediaFailedToast => 'Не ўдалося адправіць медыя';

  @override
  String get forwardDestinationNoSendPermission =>
      'Тут нельга адпраўляць паведамленні';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Тут нельга ўбудоўваць спасылкі';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Тут нельга далучаць файлы';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Адпраўка паведамленняў у гэтай суполцы адключана';

  @override
  String get forwardDestinationTimedOut => 'У вас тайм-аўт у гэтай суполцы';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Павольны рэжым · пачакайце $remaining';
  }

  @override
  String get chatMessageCopyText => 'Скапіраваць паведамленне';

  @override
  String get chatMessageCopyEmbedText => 'Скапіраваць тэкст убудавання';

  @override
  String get chatMessageTranslate => 'Перакласці';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Перакладзена з мовы: $language';
  }

  @override
  String get chatMessageSeeOriginal => 'Паказаць арыгінал';

  @override
  String get chatMessageSeeTranslation => 'Паказаць пераклад';

  @override
  String get chatMessageTranslating => 'Перакладаецца…';

  @override
  String get chatMessageTranslateFailed =>
      'Не ўдалося перакласці гэта паведамленне.';

  @override
  String get chatMessageTranslateUnavailable =>
      'На гэтай прыладзе пераклад недаступны.';

  @override
  String get chatMessageSpeak => 'Агучыць паведамленне';

  @override
  String get chatMessageStopSpeaking => 'Спыніць агучванне';

  @override
  String get chatMessagePin => 'Замацаваць паведамленне';

  @override
  String get chatMessageUnpin => 'Адмацаваць паведамленне';

  @override
  String get chatMessageUnpinIt => 'Адмацаваць';

  @override
  String get chatMessageBookmark => 'Дадаць у закладкі';

  @override
  String get chatMessageRemoveBookmark => 'Прыбраць з закладак';

  @override
  String get chatMessageMarkAsUnread => 'Пазначыць як непрачытанае';

  @override
  String get chatMessageCopyMessageLink =>
      'Скапіраваць спасылку на паведамленне';

  @override
  String get chatMessageOpenLink => 'Адкрыць спасылку';

  @override
  String get chatMessageCopyLink => 'Скапіраваць спасылку';

  @override
  String get chatMessageCopyMessageId => 'Скапіраваць ID паведамлення';

  @override
  String get chatMessageViewReactions => 'Паглядзець рэакцыі';

  @override
  String get chatMessageRemoveAllReactions => 'Прыбраць усе рэакцыі';

  @override
  String get chatMessageDebug => 'Адладка паведамлення';

  @override
  String get messageAlertNote => 'Заўвага';

  @override
  String get messageAlertTip => 'Парада';

  @override
  String get messageAlertImportant => 'Важна';

  @override
  String get messageAlertWarning => 'Папярэджанне';

  @override
  String get messageAlertCaution => 'Асцярожна';

  @override
  String get chatMessageDebugSheetTitle => 'Адладка паведамлення';

  @override
  String get chatMessageDebugCopyJson => 'Скапіраваць JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'JSON паведамлення скапіраваны ў буфер абмену';

  @override
  String get chatReactionsSheetTitle => 'Рэакцыі';

  @override
  String get chatReactionsSheetEmpty =>
      'Такую рэакцыю пакуль ніхто не паставіў.';

  @override
  String get chatReactionAddFailed => 'Не ўдалося дадаць рэакцыю';

  @override
  String get chatReactionRemoveFailed => 'Не ўдалося прыбраць рэакцыю';

  @override
  String get chatMessageReport => 'Паскардзіцца на паведамленне';

  @override
  String get reportFlowTitleMessage => 'Паскардзіцца на паведамленне';

  @override
  String get reportFlowTitleUserProfile => 'Паскардзіцца на профіль';

  @override
  String get reportFlowTitleCommunity => 'Паскардзіцца на суполку';

  @override
  String get reportFlowSummaryTitle => 'Праверце сваю скаргу';

  @override
  String get reportFlowSummarySubtitle =>
      'Перш чым адправіць, праверце, ці ўсё правільна.';

  @override
  String reportFlowDisclaimer(String guidelines) {
    return 'Скардзіцеся толькі на тое, што, на вашу шчырую думку, парушае правілы. Злоўжыванне скаргамі супярэчыць нашым $guidelines.';
  }

  @override
  String get reportFlowCommunityGuidelinesLink => 'правілам супольнасці';

  @override
  String get reportFlowDisclaimerNoLink =>
      'Скардзіцеся толькі на тое, што, на вашу шчырую думку, парушае правілы, і, калі ласка, не адпраўляйце адну і тую ж скаргу двойчы.';

  @override
  String get reportFlowSelectedMessage =>
      'Паведамленне, на якое вы скардзіцеся';

  @override
  String get reportFlowSelectedPerson => 'Чалавек, на якога вы скардзіцеся';

  @override
  String get reportFlowSelectedCommunity => 'Суполка, на якую вы скардзіцеся';

  @override
  String get reportFlowReportCategory => 'Вашы адказы';

  @override
  String get reportFlowSubmit => 'Адправіць скаргу';

  @override
  String get reportFlowBack => 'Назад';

  @override
  String get reportFlowNext => 'Далей';

  @override
  String get reportFlowDone => 'Гатова';

  @override
  String get reportFlowThankYouTitle => 'Скарга адпраўлена';

  @override
  String get reportFlowThankYouNoReportTitle => 'Дзякуй, што паведамілі';

  @override
  String reportFlowThankYouBody(String productName) {
    return 'Каманда бяспекі $productName разгледзіць вашу скаргу. Мы не раскрыем, што яна ад вас.';
  }

  @override
  String get reportFlowThankYouBodySelfHosted =>
      'Адміністратары гэтага экзэмпляра разгледзяць вашу скаргу. Мы не раскрыем, што яна ад вас.';

  @override
  String get reportFlowThankYouNoReportBody =>
      'Дзякуй, што паведамілі. Само па сабе гэта не парушае нашых правіл, таму скаргу мы не адправілі. Калі гэта скіравана супраць каго-небудзь або змяшчае абразлівыя словы, паскардзіцеся яшчэ раз і выберыце «Абразлівае або шкоднае змесціва».';

  @override
  String get reportFlowThankYouNoReportBodyShort =>
      'Дзякуй, што паведамілі. Само па сабе гэта не парушае нашых правіл, таму скаргу мы не адправілі.';

  @override
  String get reportFlowMoreYouCanDo => 'Вашы варыянты';

  @override
  String reportFlowBlockName(String name) {
    return 'Заблакіраваць $name';
  }

  @override
  String get reportFlowBlockDescription =>
      'Хавае паведамленні гэтага карыстальніка і забараняе яму пісаць вам';

  @override
  String get reportFlowBlockButton => 'Заблакіраваць';

  @override
  String get reportFlowBlockedButton => 'Заблакіравана';

  @override
  String get reportFlowUrgentBanner =>
      'Калі камусьці пагражае непасрэдная небяспека, спачатку звярніцеся ў мясцовыя экстранныя службы.';

  @override
  String get reportFlowLoadFailed => 'Не ўдалося загрузіць форму скаргі.';

  @override
  String get reportFlowTryAgain => 'Паспрабаваць яшчэ раз';

  @override
  String get reportFlowOutdated =>
      'Форма скаргі змянілася. Калі ласка, пачніце спачатку.';

  @override
  String get reportFlowAlreadyReported =>
      'Вы ўжо скардзіліся на гэта паведамленне.';

  @override
  String get reportFlowAlreadyReportedProfile =>
      'Вы ўжо скардзіліся на гэты профіль сёння.';

  @override
  String get reportFlowAlreadyReportedCommunity =>
      'Вы ўжо скардзіліся на гэту суполку.';

  @override
  String get reportFlowRateLimited =>
      'Вы адпраўляеце скаргі занадта хутка. Паспрабуйце пазней.';

  @override
  String get reportFlowSubmitFailed =>
      'Вашу скаргу не ўдалося адправіць. Паспрабуйце яшчэ раз.';

  @override
  String get reportFlowAccountSetupRequired =>
      'Каб адпраўляць скаргі, замацуйце за сабой уліковы запіс і пацвердзіце электронную пошту.';

  @override
  String get chatMessageSuppressEmbeds => 'Схаваць убудаванні';

  @override
  String get chatMessageUnsuppressEmbeds => 'Паказаць убудаванні';

  @override
  String get chatMessageDelete => 'Выдаліць паведамленне';

  @override
  String get chatMessageDeleteConfirmTitle => 'Выдаліць паведамленне';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Вы сапраўды хочаце выдаліць гэта паведамленне?';

  @override
  String get chatMessageDeleteAttachment => 'Выдаліць далучэнне';

  @override
  String get chatMessageDeleteAttachmentConfirmDescription =>
      'Вы сапраўды хочаце выдаліць гэта далучэнне?';

  @override
  String get chatMessageEditAttachmentAltText =>
      'Рэдагаваць альтэрнатыўны тэкст';

  @override
  String get chatMessageMore => 'Яшчэ';

  @override
  String get chatEditingMessage => 'Рэдагаванне паведамлення';

  @override
  String get chatReplyOriginalDeleted => 'Зыходнае паведамленне выдалена';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Не ўдалося загрузіць зыходнае паведамленне';

  @override
  String get chatReplyAttachedMedia => 'Паведамленне змяшчае далучаныя медыя';

  @override
  String chatBlockedMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count заблакіраванага паведамлення',
      many: '$count заблакіраваных паведамленняў',
      few: '$count заблакіраваныя паведамленні',
      one: '$count заблакіраванае паведамленне',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count паведамлення магчымых спамераў',
      many: '$count паведамленняў магчымых спамераў',
      few: '$count паведамленні магчымых спамераў',
      one: '$count паведамленне магчымага спамера',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Адказ схаваны, бо аўтар зыходнага паведамлення заблакіраваны.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Адказ схаваны, бо аўтар зыходнага паведамлення пазначаны як спамер.';

  @override
  String get devMarkAsSpamLocally => 'Пазначыць як спам лакальна';

  @override
  String get devIgnoreSpamFlag => 'Ігнараваць адзнаку спаму';

  @override
  String get chatMessagesLoadError => 'Не ўдалося загрузіць паведамленні.';

  @override
  String get dmEmptyStateTitle => 'Паведамленняў пакуль няма';

  @override
  String get dmEmptyStateBody => 'Адпраўце паведамленне, каб пачаць размову.';

  @override
  String get chatMessagesFailedToLoad => 'Не ўдалося загрузіць паведамленні';

  @override
  String get chatReplyMentionOverrideTitle =>
      'Перавызначыць наладу згадванняў?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname аддае перавагу адказам з @згадваннем. Усё роўна адправіць без згадвання?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname аддае перавагу адказам без @згадвання. Усё роўна адправіць са згадваннем?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ігнараваць наладу';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Націсніце, каб выключыць згадванне карыстальніка, якому вы адказваеце.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Націсніце, каб уключыць згадванне карыстальніка, якому вы адказваеце.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Згадаць аўтара паведамлення, на якое вы адказваеце';

  @override
  String get chatReplyMentionOn => 'УКЛ';

  @override
  String get chatReplyMentionOff => 'ВЫКЛ';

  @override
  String chatReplyingTo(String authorName) {
    return 'Адказ для $authorName';
  }

  @override
  String chatForwardedFrom(String source) {
    return 'Пераслана з $source';
  }

  @override
  String get chatForwardedLabel => 'Пераслана';

  @override
  String get chatForwardedFromLabel => 'Пераслана з';

  @override
  String get chatReplyCancel => 'Скасаваць адказ';

  @override
  String get chatEditMessageHint => 'Рэдагаваць паведамленне';

  @override
  String get chatEditNoChanges => 'Няма змен для захавання';

  @override
  String get chatEditFailed => 'Ваша паведамленне не абнавілася';

  @override
  String get chatEditFailedEditAgain => 'Рэдагаваць зноў';

  @override
  String get chatChannelNotReady =>
      'Гэты канал яшчэ не гатовы. Паспрабуйце яшчэ раз праз хвіліну.';

  @override
  String get chatMessageEdited => '(зменена)';

  @override
  String get chatMessageSilent => 'Гэта было паведамленне @silent.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Сёння ў $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Учора ў $time';
  }

  @override
  String get mediaViewerImagePreview => 'Папярэдні прагляд выявы';

  @override
  String get mediaViewerClose => 'Закрыць прагляд медыя';

  @override
  String get mediaViewerOpenInBrowser => 'Адкрыць у браўзеры';

  @override
  String get mediaViewerOptions => 'Параметры медыя';

  @override
  String get mediaViewerCopyLink => 'Скапіраваць спасылку';

  @override
  String get mediaViewerForward => 'Пераслаць';

  @override
  String get mediaViewerZoomIn => 'Павялічыць';

  @override
  String get mediaViewerZoomOut => 'Паменшыць';

  @override
  String get mediaViewerPreviousAttachment => 'Папярэдняе далучэнне';

  @override
  String get mediaViewerNextAttachment => 'Наступнае далучэнне';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String mediaViewerAttachmentThumbnail(int index) {
    return 'Далучэнне $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Закрыць';

  @override
  String get videoPlayerPlay => 'Прайграць';

  @override
  String get videoPlayerPause => 'Паўза';

  @override
  String get videoPlayerVolume => 'Гучнасць';

  @override
  String videoPlayerPlaybackSpeed(String speed) {
    return 'Хуткасць прайгравання ${speed}x';
  }

  @override
  String get videoPlayerFullScreen => 'На ўвесь экран';

  @override
  String get chatAttachmentVideoToggleControls =>
      'Паказаць або схаваць кіраванне відэа';

  @override
  String get chatAttachmentVideoMute => 'Выключыць гук відэа';

  @override
  String get chatAttachmentVideoUnmute => 'Уключыць гук відэа';

  @override
  String get chatAttachmentVideoPlay => 'Прайграць відэа';

  @override
  String get chatAttachmentVideoPause => 'Прыпыніць відэа';

  @override
  String get chatAttachmentVideoProgress => 'Прагрэс відэа';

  @override
  String get chatVideoPlaybackFailed => 'Не ўдалося прайграць гэта відэа.';

  @override
  String get chatImageCouldNotLoad => 'Не ўдалося загрузіць гэту выяву.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Апавясціць карыстальнікаў з гэтай роляй, якія маюць дазвол праглядаць гэты канал.';

  @override
  String get composerAutocompleteSuggestions => 'Падказкі';

  @override
  String get composerAutocompleteCommandsHeading => 'Каманды';

  @override
  String get composerAutocompleteChoicesHeading => 'Варыянты';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'Неабавязковыя аргументы';

  @override
  String get composerAutocompleteMediaHeading => 'Медыя';

  @override
  String get composerAutocompleteStickersHeading => 'Стыкеры';

  @override
  String get composerAutocompleteEmojisHeading => 'Эмоджы';

  @override
  String get composerAutocompleteGifsHeading => 'GIF';

  @override
  String get composerAutocompleteNoGifs => 'GIF не знойдзены';

  @override
  String get composerCommandShrugDescription =>
      'Дадае ¯\\_(ツ)_/¯ да вашага паведамлення.';

  @override
  String get composerCommandTableflipDescription =>
      'Дадае (╯°□°)╯︵ ┻━┻ да вашага паведамлення.';

  @override
  String get composerCommandUnflipDescription =>
      'Дадае ┬─┬ ノ( ゜-゜ノ) да вашага паведамлення.';

  @override
  String get composerCommandMeDescription =>
      'Адправіць паведамленне-дзеянне (курсівам).';

  @override
  String get composerCommandSpoilerDescription =>
      'Адправіць паведамленне са спойлерам (абгортвае ў тэгі спойлера).';

  @override
  String get composerCommandTtsDescription =>
      'Адправіць паведамленне з агучваннем тэксту.';

  @override
  String get composerCommandNickDescription =>
      'Змяняць свой псеўданім у гэтай суполцы.';

  @override
  String get composerCommandKickDescription =>
      'Выгнаць удзельніка з гэтай суполкі.';

  @override
  String get composerCommandBanDescription =>
      'Забаніць удзельніка ў гэтай суполцы.';

  @override
  String get composerCommandMsgDescription =>
      'Адправіць асабістае паведамленне карыстальніку.';

  @override
  String get composerCommandSavedDescription => 'Адправіць захаванае медыя.';

  @override
  String get composerCommandStickerDescription => 'Адправіць стыкер.';

  @override
  String get composerCommandGifDescription => 'Знайсці і адправіць GIF.';

  @override
  String get composerCommandMemberOption =>
      'Удзельнік, да якога трэба ўжыць каманду.';

  @override
  String get composerCommandReasonOption => 'Прычына (неабавязкова).';

  @override
  String get composerCommandMessageOption =>
      'Паведамленне, якое трэба адправіць.';

  @override
  String get composerCommandQueryOption => 'Што шукаць.';

  @override
  String get composerCommandNicknameOption =>
      'Ваш новы псеўданім. Пакіньце пустым, каб скінуць.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'Колькі нядаўніх паведамленняў удзельніка выдаліць.';

  @override
  String get composerCommandDeleteMessagesNone => 'Нічога не выдаляць';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Апошнія дні: $count';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'За апошнія 24 гадзіны';

  @override
  String get composerCommandOptionRequired =>
      'Гэты параметр абавязковы. Укажыце значэнне.';

  @override
  String get composerCommandClear => 'Ачысціць каманду';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'Вы змянілі свой псеўданім у гэтай суполцы з **$previousNickname** на **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'Невядомы карыстальнік';

  @override
  String composerCommandMsgFailed(String username) {
    return 'Не ўдалося адправіць паведамленне карыстальніку **$username**. Магчыма, гэты карыстальнік выключыў асабістыя паведамленні або заблакіраваў вас.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return 'яшчэ +$count';
  }

  @override
  String get addGuildModalTitle => 'Дадаць суполку';

  @override
  String get addGuildModalLandingDescription =>
      'Стварыце новую суполку або далучыцеся да наяўнай.';

  @override
  String get addGuildCreateCommunity => 'Стварыць суполку';

  @override
  String get addGuildJoinCommunity => 'Далучыцца да суполкі';

  @override
  String get addGuildImportDiscordTemplate => 'Імпартаваць шаблон Discord';

  @override
  String get addGuildJoinTitle => 'Далучыцца да суполкі';

  @override
  String get addGuildJoinDescription =>
      'Увядзіце спасылку-запрашэнне, каб далучыцца да суполкі.';

  @override
  String get addGuildInviteLinkLabel => 'Спасылка-запрашэнне';

  @override
  String get addGuildJoinSubmit => 'Далучыцца да суполкі';

  @override
  String get addGuildInviteInvalid =>
      'Гэта запрашэнне несапраўднае або тэрмін яго дзеяння скончыўся.';

  @override
  String get addGuildCreateTitle => 'Стварыць суполку';

  @override
  String get addGuildCreateDescription =>
      'Стварыце суполку, дзе вы з сябрамі зможаце размаўляць.';

  @override
  String get addGuildCreateNameLabel => 'Назва суполкі';

  @override
  String get addGuildCreateSubmit => 'Стварыць суполку';

  @override
  String get addGuildCreateFailed =>
      'Не ўдалося стварыць суполку. Паспрабуйце яшчэ раз.';

  @override
  String get addGuildCreateClaimTitle => 'Замацуйце за сабой уліковы запіс';

  @override
  String get addGuildCreateClaimDescription =>
      'Каб стварыць суполку, замацуйце за сабой уліковы запіс.';

  @override
  String get addGuildCreateVerifyTitle => 'Пацвердзіце электронную пошту';

  @override
  String get addGuildCreateVerifyDescription =>
      'Каб стварыць суполку, пацвердзіце адрас электроннай пошты.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Аніміраваныя значкі не падтрымліваюцца пры стварэнні новай суполкі. Выкарыстайце статычную выяву.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'Ствараючы суполку, вы згаджаецеся выконваць і падтрымліваць ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return 'правілы супольнасці $productName';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'Гэты экзэмпляр складаецца з адной суполкі, таму ствараць дадатковыя суполкі нельга.';

  @override
  String get addGuildCreateChangeIcon => 'Змяніць значок';

  @override
  String get addGuildCreateIconLabel => 'Значок суполкі';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Да 10 МБ. Рэкамендавана: 512×512 пкс';

  @override
  String get addGuildImportDescription =>
      'Устаўце URL шаблону Discord, каб імпартаваць яго структуру ў новую суполку.';

  @override
  String get addGuildImportUrlLabel => 'URL шаблона';

  @override
  String get addGuildImportUrlInvalid =>
      'Увядзіце правільны URL або код шаблону Discord.';

  @override
  String get addGuildImportFetchFailed =>
      'Не ўдалося атрымаць шаблон суполкі. Магчыма, шаблон не існуе або знешні сэрвіс недаступны.';

  @override
  String get addGuildImportInvalidResponse =>
      'Гэта не падобна на правільны адказ з шаблонам.';

  @override
  String get addGuildImportTemplateLabel => 'Шаблон';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return 'Тэкставыя каналы: $textChannelCount, галасавыя: $voiceChannelCount, катэгорыі: $categoryCount, ролі: $roleCount';
  }

  @override
  String get addGuildImportRemoveIcon => 'Выдаліць значок';

  @override
  String get addGuildImportTemplateInvalid =>
      'Даныя шаблона суполкі няправільныя або пашкоджаныя.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Прыбраць усе рэакцыі';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Вы сапраўды хочаце прыбраць усе рэакцыі з гэтага паведамлення?';

  @override
  String get chatMessagePinConfirm => 'Замацаваць';

  @override
  String get chatMessagePinConfirmDescription =>
      'Замацаваць гэта паведамленне ў канале, каб яго бачылі ўсе.';

  @override
  String get chatMessageUnpinConfirmTitle => 'Адмацаваць паведамленне';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Адправіць гэта замацаванае паведамленне назад у мінулае?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username замацоўвае ў гэтым канале $messageLink. Глядзіце $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'паведамленне';

  @override
  String get systemPinMessageAllPinsLink => 'усе замацаваныя паведамленні';

  @override
  String get channelPinsEmptyTitle => 'Няма замацаваных паведамленняў';

  @override
  String get channelPinsEmptyDescription =>
      'Тут паказваюцца замацаваныя паведамленні.';

  @override
  String get channelDetailsFallbackTitle => 'Падрабязнасці';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'Групавы чат · удзельнікаў: $count';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'Закрыць размову з $name?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'Пакінуць $name?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Налады канала';

  @override
  String get channelDetailsGroupSettingsTitle => 'Налады групы';

  @override
  String get channelDetailsDmSettingsTitle => 'Налады асабістага чата';

  @override
  String get channelDetailsInvitePeople => 'Запрасіць людзей';

  @override
  String get channelDetailsCopyLink => 'Скапіраваць спасылку';

  @override
  String get channelMenuCopyChannelLink => 'Скапіраваць спасылку на канал';

  @override
  String get channelMenuCopyRedirectLink =>
      'Скапіраваць спасылку перанакіравання';

  @override
  String get channelDetailsAddFriendsToGroup => 'Дадаць сяброў у групу';

  @override
  String get channelDetailsGroupInvites => 'Запрашэнні ў групу';

  @override
  String get channelDetailsEditChannel => 'Рэдагаваць канал';

  @override
  String get channelDetailsDeleteChannel => 'Выдаліць канал';

  @override
  String get channelSettingsEditCategory => 'Рэдагаваць катэгорыю';

  @override
  String get channelSettingsTabOverview => 'Агульныя звесткі';

  @override
  String get channelSettingsTabPermissions => 'Дазволы';

  @override
  String get channelSettingsTabInvites => 'Запрашэнні';

  @override
  String get channelSettingsTabWebhooks => 'Вэб-хукі';

  @override
  String get channelSettingsDeleteChannel => 'Выдаліць канал';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'Вы сапраўды хочаце выдаліць $channelName? Гэта нельга адмяніць.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'Вы сапраўды хочаце выдаліць $categoryName? Гэта нельга адмяніць.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Выдаліць катэгорыю';

  @override
  String get channelSettingsChannelUpdated => 'Канал абноўлены';

  @override
  String get channelSettingsChannelName => 'Назва канала';

  @override
  String get channelSettingsCategoryName => 'Назва катэгорыі';

  @override
  String get channelSettingsMyCategory => 'Мая катэгорыя';

  @override
  String get categoryExpandCategory => 'Разгарнуць катэгорыю';

  @override
  String get categoryCollapseCategory => 'Згарнуць катэгорыю';

  @override
  String get categoryExpandAllCategories => 'Разгарнуць усе катэгорыі';

  @override
  String get categoryCollapseAllCategories => 'Згарнуць усе катэгорыі';

  @override
  String get categoryMuteCategory => 'Заглушыць катэгорыю';

  @override
  String get categoryUnmuteCategory => 'Уключыць апавяшчэнні катэгорыі';

  @override
  String get categoryCopyCategoryId => 'Скапіраваць ID катэгорыі';

  @override
  String get categoryIdCopied => 'ID катэгорыі скапіраваны';

  @override
  String get channelSettingsChannelNamePlaceholder => 'агульны';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'Тэма';

  @override
  String get channelSettingsTopicPlaceholder => 'Дадаць тэму гэтаму каналу';

  @override
  String get channelSettingsInsertEmoji => 'Уставіць эмоджы';

  @override
  String get channelSettingsTopicTooLongTitle => 'Тэма канала занадта доўгая.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'Скараціце тэму і паспрабуйце яшчэ раз.';

  @override
  String get channelSettingsSlowmode => 'Павольны рэжым';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Інтэрвал паміж паведамленнямі. Удзельнікі з дазволам «$bypassSlowmodePermissionLabel» могуць яго абыходзіць.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Выключана';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds с';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes хв';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours гадз';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute хвіліна';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour гадзіна';
  }

  @override
  String get channelSettingsVoiceQuality => 'Якасць голасу';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'Вышэйшы бітрэйт = лепшая якасць і большы расход трафіку.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits кбіт/с';
  }

  @override
  String get channelSettingsParticipantLimit => 'Ліміт удзельнікаў';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Максімальная колькасць удзельнікаў, якія могуць далучыцца адначасова. 0 — без абмежаванняў.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count удзельніка',
      many: '$count удзельнікаў',
      few: '$count удзельнікі',
      one: '$count удзельнік',
      zero: '∞ Без абмежаванняў',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Ліміт падключэнняў';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Максімальная колькасць актыўных падключэнняў аднаго ўдзельніка ў гэтым канале.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count падключэння',
      many: '$count падключэнняў',
      few: '$count падключэнні',
      one: '$count падключэнне',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Галасавы рэгіён';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Выберыце галасавы рэгіён для гэтага канала. Пры аўтаматычным выбары выкарыстоўваецца бліжэйшы рэгіён.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Аўтаматычна';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'Не ўдалося загрузіць галасавыя рэгіёны';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Паспрабуйце яшчэ раз праз хвіліну.';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Перавызначыць наладу ўзроўню «$scopeLevel» для гэтага канала. Змесціва для дарослых паказваецца толькі пасля бар’ера на ўваходзе.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Успадкаваць';

  @override
  String get channelSettingsMatureContentOn => 'Уключана';

  @override
  String get channelSettingsMatureContentOff => 'Выключана';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Пазначае гэты канал як канал са змесцівам для дарослых.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Не ставіць для гэтага канала бар’ер змесціва для дарослых.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Успадкавана ад $inheritedSourceLabel: уключана';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Успадкавана ад $inheritedSourceLabel: выключана';
  }

  @override
  String get channelSettingsMatureContentCategoryScope => 'Катэгорыя';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Суполка';

  @override
  String get channelSettingsContentWarningToggle =>
      'Паказваць папярэджанне аб змесціве ў гэтым канале';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Уключае запыт згоды перад уваходам у гэты канал.';

  @override
  String get channelSettingsContentWarningText => 'Уласны тэкст папярэджання';

  @override
  String get channelSettingsContentWarningDefault =>
      'Тут ёсць адчувальнае змесціва.';

  @override
  String get channelSettingsUnknownRole => 'Невядомая роля';

  @override
  String get channelSettingsUnknownUser => 'Невядомы карыстальнік';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides =>
      'Перавызначэнні доступу';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Змяніць доступ для $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'Назад да перавызначэнняў';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Наладзьце базавы доступ да гэтага канала';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Наладзьце перавызначэнні для гэтай ролі';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Наладзьце перавызначэнні для гэтага ўдзельніка';

  @override
  String get channelSettingsPermissionsSearchPlaceholder => 'Пошук дазволаў…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Доступ да канала абноўлены';

  @override
  String get channelSettingsPermissionsTitle => 'Кіраванне доступам';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'Гэты канал сінхранізаваны з бацькоўскай катэгорыяй ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'Гэты канал не сінхранізаваны з бацькоўскай катэгорыяй ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory =>
      'Сінхранізаваць з катэгорыяй';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'Канал сінхранізаваны з бацькоўскай катэгорыяй';

  @override
  String get channelSettingsPermissionsAddOverride => 'Дадаць перавызначэнне';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Пошук роляў або ўдзельнікаў…';

  @override
  String get channelSettingsDeleteInvite => 'Выдаліць запрашэнне';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Выдаліць гэта запрашэнне? Гэта дзеянне нельга адмяніць.';

  @override
  String get channelSettingsCopyInviteCode => 'Скапіраваць код запрашэння';

  @override
  String get channelSettingsCopyInviteUrl => 'Скапіраваць URL запрашэння';

  @override
  String get channelSettingsWebhookCreated => 'Вэб-хук створаны';

  @override
  String get channelSettingsWebhookCreateFailed =>
      'Не ўдалося стварыць вэб-хук';

  @override
  String get channelSettingsCreateWebhook => 'Стварыць вэб-хук';

  @override
  String get channelSettingsInvitesDescription =>
      'Кіраваць спасылкамі-запрашэннямі ў гэты канал.';

  @override
  String get channelSettingsInvitesCreate => 'Стварыць запрашэнне';

  @override
  String get channelSettingsInvitesEmpty => 'Няма спасылак-запрашэнняў';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'У гэтага канала пакуль няма спасылак-запрашэнняў. Стварыце спасылку, каб запрашаць людзей у гэты канал.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Пры загрузцы спасылак-запрашэнняў гэтага канала адбылася памылка. Паспрабуйце яшчэ раз.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Кіраваць уваходнымі вэб-хукамі, якія могуць публікаваць паведамленні ў гэты канал.';

  @override
  String get channelSettingsWebhooksEmpty => 'Няма вэб-хукаў';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'Для гэтага канала не наладжана ніводнага вэб-хука. Стварыце вэб-хук, каб знешнія праграмы маглі публікаваць паведамленні.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Гэты канал не падтрымлівае вэб-хукі.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'Каб праглядаць і змяняць вэб-хукі гэтага канала, патрэбны дазвол «$permission».';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'Не ўдалося загрузіць вэб-хукі';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Пры загрузцы вэб-хукаў гэтага канала адбылася памылка. Паспрабуйце яшчэ раз.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Аўтар: $creator, $date';
  }

  @override
  String get channelSettingsWebhooksAvatar => 'Аватар';

  @override
  String get channelSettingsWebhooksUploadImage => 'Загрузіць выяву';

  @override
  String get channelSettingsWebhooksRemove => 'Прыбраць';

  @override
  String get channelSettingsWebhooksName => 'Імя';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Назва вэб-хука';

  @override
  String get channelSettingsWebhooksChannel => 'Канал';

  @override
  String get channelSettingsWebhooksUrl => 'URL вэб-хука';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Скапіраваць URL вэб-хука';

  @override
  String get channelSettingsWebhooksDelete => 'Выдаліць вэб-хук';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'Не ўдалося выдаліць гэты вэб-хук';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'Выдаліць гэты вэб-хук? Гэта нельга адмяніць.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Паспрабуйце яшчэ раз праз хвіліну.';

  @override
  String get channelMenuOpenChat => 'Адкрыць чат';

  @override
  String get channelMenuDuplicateChannel => 'Стварыць копію канала';

  @override
  String channelDuplicateHelper(String channelName) {
    return 'Новы канал атрымае дазволы канала $channelName.';
  }

  @override
  String channelDuplicateVoiceHelper(String channelName) {
    return 'Новы галасавы канал атрымае дазволы, ліміт карыстальнікаў і бітрэйт канала $channelName.';
  }

  @override
  String get channelMenuMoveToCategory => 'Перамясціць у катэгорыю';

  @override
  String get channelMenuNoCategory => 'Без катэгорыі';

  @override
  String get channelMoveCategoryFullTitle => 'Катэгорыя запоўнена';

  @override
  String channelMoveCategoryFullMessage(int maxChannelsPerCategory) {
    return 'Гэта катэгорыя ўжо змяшчае максімальную колькасць каналаў: $maxChannelsPerCategory.';
  }

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Скінуць стан згоды на змесціва для дарослых';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Выдаліць вашы паведамленні ў гэтым канале?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Будуць назаўсёды выдалены ўсе паведамленні, якія вы калі-небудзь адпраўлялі ў гэтым канале. Гэта дзеянне нельга адмяніць.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Выдаліць мае паведамленні';

  @override
  String get channelMenuDeletedYourMessages => 'Вашы паведамленні выдалены';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'Не ўдалося выдаліць вашы паведамленні';

  @override
  String get channelDetailsSystemMessage => 'Сістэмнае паведамленне';

  @override
  String get channelDetailsTextChannel => 'Тэкставы канал';

  @override
  String get channelDetailsVoiceChannel => 'Галасавы канал';

  @override
  String get channelDetailsCategory => 'Катэгорыя';

  @override
  String get channelDetailsLinkChannel => 'Канал-спасылка';

  @override
  String get channelDetailsGenericChannel => 'Канал';

  @override
  String get channelDetailsMutedConversation => 'Размова заглушана';

  @override
  String get channelDetailsUnmutedConversation => 'Заглушэнне размовы знята';

  @override
  String get channelDetailsMutedChannel => 'Канал заглушаны';

  @override
  String get channelDetailsUnmutedChannel => 'Заглушэнне канала знята';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Налады апавяшчэнняў абноўлены';

  @override
  String get channelDetailsTabMembers => 'Удзельнікі';

  @override
  String get channelDetailsTabPins => 'Замацаваныя';

  @override
  String get channelDetailsActionMute => 'Заглушыць';

  @override
  String get channelDetailsActionUnmute => 'Уключыць апавяшчэнні';

  @override
  String get channelDetailsActionSearch => 'Пошук';

  @override
  String get channelDetailsActionMore => 'Яшчэ';

  @override
  String get channelDetailsMembersEmptyTitle => 'Няма ўдзельнікаў для паказу';

  @override
  String get channelDetailsMembersEmptyBody =>
      'Удзельнікі з’явяцца тут, калі загрузяцца даныя суполкі.';

  @override
  String get memberListPermissionDeniedTitle =>
      'Вы не можаце праглядаць удзельнікаў';

  @override
  String get memberListPermissionDeniedBody =>
      'Вы не можаце праглядаць удзельнікаў гэтага канала ў гэтай суполцы';

  @override
  String get memberListUnavailableTitle => 'Спіс удзельнікаў недаступны';

  @override
  String get memberListUnavailableBody =>
      'Спісы ўдзельнікаў часова недаступныя ў гэтай суполцы';

  @override
  String get channelDetailsPinsLoadFailedTitle =>
      'Не ўдалося загрузіць замацаваныя паведамленні';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'Удзельнікі з дазволам «Замацоўваць паведамленні» могуць замацоўваць паведамленні, каб іх бачылі ўсе.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'У гэтай размове вы можаце замацоўваць паведамленні, каб іх бачылі ўсе.';

  @override
  String get channelDetailsPinsEndReached => 'Вы дайшлі да канца';

  @override
  String get channelHeaderPinnedMessages => 'Замацаваныя паведамленні';

  @override
  String get channelHeaderPinnedMessagesUnread =>
      'Замацаваныя паведамленні, ёсць непрачытаныя';

  @override
  String get channelHeaderMemberList => 'Спіс удзельнікаў';

  @override
  String get channelHeaderInbox => 'Уваходныя';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Налады апавяшчэнняў, заглушана';

  @override
  String get channelHeaderOpenDetails => 'Адкрыць звесткі пра канал';

  @override
  String get channelDetailsSearchTitle => 'Пошук';

  @override
  String get channelDetailsSearchHint => 'Пошук паведамленняў';

  @override
  String get channelDetailsSearchFilterFrom => 'Ад';

  @override
  String get channelDetailsSearchFilterHas => 'Змяшчае';

  @override
  String get channelDetailsSearchFilterIn => 'У';

  @override
  String get channelDetailsSearchFilterMentions => 'Згадванні';

  @override
  String get channelDetailsSearchFilterMore => 'Яшчэ';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Актыўна';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return 'Каналаў: $count';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return 'Карыстальнікаў: $count';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'Карыстальнік';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Бот';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Вэб-хук';

  @override
  String get channelDetailsSearchFilterByChannel => 'Фільтраваць па канале';

  @override
  String get channelDetailsSearchChannelsHint => 'Пошук каналаў';

  @override
  String get channelDetailsSearchChannelsEmpty => 'Каналы не знойдзены';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Замацавана';

  @override
  String get channelDetailsSearchPinnedTrue => 'Толькі замацаваныя';

  @override
  String get channelDetailsSearchPinnedFalse => 'Без замацаваных';

  @override
  String get channelDetailsSearchClearFilter => 'Ачысціць';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Тып аўтара';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Дата';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Рэжым даты';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Выберыце дату';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Хост спасылкі';

  @override
  String get channelDetailsSearchMoreFiltersFileName => 'Назва файла змяшчае';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'Пашырэнне файла';

  @override
  String get channelDetailsSearchContentPoll => 'Апытанне';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'Паведамленні з апытаннем';

  @override
  String get channelDetailsSearchContentForward => 'Пераслаць';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Перасланыя паведамленні';

  @override
  String get channelDetailsSearchFilterSort => 'Сартаванне';

  @override
  String get channelHeaderSearchFiltersTitle => 'Фільтры пошуку';

  @override
  String get channelHeaderSearchRecentTitle => 'Нядаўнія пошукі';

  @override
  String get channelHeaderSearchUsersTitle => 'Карыстальнікі';

  @override
  String get channelHeaderSearchChannelsTitle => 'Каналы';

  @override
  String get channelHeaderSearchValuesTitle => 'Значэнні';

  @override
  String get channelHeaderSearchDatesTitle => 'Даты';

  @override
  String get channelHeaderSearchDefaultBadge => 'Прадвызначана';

  @override
  String get channelHeaderSearchClearHistory => 'Ачысціць';

  @override
  String get channelSearchRemoveRecent => 'Выдаліць з нядаўніх пошукаў';

  @override
  String get channelSearchFiltersButton => 'Фільтры';

  @override
  String get channelSearchFilterMenuTitle => 'Фільтраваць вынікі';

  @override
  String get channelSearchFilterFromLabel => 'Ад пэўнага чалавека';

  @override
  String get channelSearchFilterMentionsLabel => 'Згадвае пэўнага чалавека';

  @override
  String get channelSearchFilterHasLabel =>
      'Ёсць спасылка, файл або ўбудаванне';

  @override
  String get channelSearchFilterInLabel => 'У пэўным канале';

  @override
  String get channelSearchFilterDuringLabel => 'Адпраўлена ў пэўны дзень';

  @override
  String get channelSearchFilterBeforeLabel => 'Адпраўлена да пэўнай даты';

  @override
  String get channelSearchFilterAfterLabel => 'Адпраўлена пасля пэўнай даты';

  @override
  String get channelSearchFilterPinnedLabel => 'Замацаванае ці не';

  @override
  String get channelSearchFilterAuthorTypeLabel => 'Па тыпе аўтара';

  @override
  String get channelSearchDateToday => 'Сёння';

  @override
  String get channelSearchDateYesterday => 'Учора';

  @override
  String get channelSearchTabMessages => 'Паведамленні';

  @override
  String get channelSearchTabImages => 'Выявы';

  @override
  String get channelSearchTabPins => 'Замацаваныя';

  @override
  String get channelSearchTabLinks => 'Спасылкі';

  @override
  String get channelSearchTabFiles => 'Файлы';

  @override
  String channelSearchTabCount(String label, int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '$label ($countString)';
  }

  @override
  String get channelHeaderSearchFilterDescFrom => 'карыстальнік';

  @override
  String get channelHeaderSearchFilterDescMentions => 'карыстальнік';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'спасылка, убудаванне, выява, відэа, гук, файл, стыкер, …';

  @override
  String get channelHeaderSearchFilterDescBefore => 'дата або дыяпазон дат';

  @override
  String get channelHeaderSearchFilterDescOn => 'дата або дыяпазон дат';

  @override
  String get channelHeaderSearchFilterDescDuring => 'дата або дыяпазон дат';

  @override
  String get channelHeaderSearchFilterDescAfter => 'дата або дыяпазон дат';

  @override
  String get channelHeaderSearchFilterDescIn => 'канал';

  @override
  String get channelHeaderSearchFilterDescPinned => 'так або не';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'карыстальнік, бот або вэб-хук';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'імя хоста, напрыклад example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'частка назвы файла далучэння';

  @override
  String get channelHeaderSearchFilterDescFileType =>
      'пашырэнне файла, напрыклад png';

  @override
  String get channelHeaderSearchFilterDescSort =>
      'па часе або па рэлевантнасці';

  @override
  String get channelHeaderSearchFilterDescOrder =>
      'па ўзрастанні або па змяншэнні';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString выніку',
      many: '$countString вынікаў',
      few: '$countString вынікі',
      one: '$countString вынік',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'Фільтраваць па карыстальніку';

  @override
  String get channelDetailsSearchFilterByContent => 'Фільтраваць па змесціве';

  @override
  String get channelDetailsSearchSortBy => 'Сартаваць вынікі па';

  @override
  String get channelDetailsSearchIn => 'Шукаць у';

  @override
  String get channelDetailsSearchEmptyTitle => 'Пошук у гэтай размове';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Увядзіце тэкст, аўтара або фільтр змесціва, каб знайсці паведамленні.';

  @override
  String get channelDetailsSearchIndexingTitle => 'Паведамленні індэксуюцца';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Паспрабуйце яшчэ раз крыху пазней, калі пошук скончыць індэксаваць гэту вобласць.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Няма вынікаў';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Паспрабуйце іншыя пошукавыя запыты або фільтры.';

  @override
  String get channelDetailsMembersOnline => 'У сетцы';

  @override
  String get channelDetailsMembersOffline => 'Не ў сетцы';

  @override
  String get channelDetailsMemberYou => 'Вы';

  @override
  String get channelDetailsSearchUsersHint => 'Шукаць карыстальнікаў';

  @override
  String get channelDetailsSearchUsersTypeToSearch =>
      'Пачніце ўводзіць, каб шукаць удзельнікаў';

  @override
  String get channelDetailsSearchUsersEmpty => 'Карыстальнікі не знойдзены';

  @override
  String get channelDetailsSearchUsersNoAvailable =>
      'Няма даступных карыстальнікаў';

  @override
  String get channelDetailsDone => 'Гатова';

  @override
  String get channelDetailsHasFilterPrompt =>
      'Паказаць паведамленні, якія змяшчаюць:';

  @override
  String get channelDetailsRetry => 'Паўтарыць';

  @override
  String get channelDetailsPinnedMessageTitle => 'Замацаванае паведамленне';

  @override
  String get channelDetailsSearchResultTitle => 'Вынік пошуку';

  @override
  String get channelDetailsJumpToMessage => 'Перайсці да паведамлення';

  @override
  String get channelDetailsUnpinMessage => 'Адмацаваць паведамленне';

  @override
  String get channelDetailsCopyMessageLink =>
      'Скапіраваць спасылку на паведамленне';

  @override
  String get channelDetailsCopyMessageId => 'Скапіраваць ID паведамлення';

  @override
  String get channelDetailsMessageUnpinned => 'Паведамленне адмацавана';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Цяперашняя суполка';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'Цяперашні асабісты чат';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Усе суполкі';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild =>
      'Толькі ўсе асабістыя чаты';

  @override
  String get channelDetailsSearchScopeAllDms => 'Усе асабістыя чаты';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild =>
      'Толькі адкрытыя асабістыя чаты';

  @override
  String get channelDetailsSearchScopeOpenDms => 'Адкрытыя асабістыя чаты';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Усе асабістыя чаты + суполкі';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Адкрытыя асабістыя чаты + суполкі';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Шукаць толькі ў цяперашняй суполцы';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Шукаць толькі ў цяперашнім асабістым чаце';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'Ва ўсіх суполках, у якіх вы зараз ёсць';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Толькі ва ўсіх асабістых чатах, у якіх вы калі-небудзь былі';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'Ва ўсіх асабістых чатах, у якіх вы калі-небудзь былі';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'Толькі ва ўсіх асабістых чатах, адкрытых зараз';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'Ва ўсіх асабістых чатах, адкрытых зараз';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'Ва ўсіх асабістых чатах, у якіх вы калі-небудзь былі, і ва ўсіх суполках, у якіх вы зараз ёсць';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'Ва ўсіх адкрытых зараз асабістых чатах і ва ўсіх суполках, у якіх вы зараз ёсць';

  @override
  String get channelDetailsSearchSortNewest => 'Спачатку найноўшыя';

  @override
  String get channelDetailsSearchSortOldest => 'Спачатку найстарэйшыя';

  @override
  String get channelDetailsSearchSortRelevance => 'Найбольш адпаведныя';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Спачатку паказваць найноўшыя паведамленні';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Спачатку паказваць найстарэйшыя паведамленні';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Спачатку паказваць найбольш адпаведныя паведамленні';

  @override
  String get channelDetailsSearchContentImage => 'Загрузка выявы';

  @override
  String get channelDetailsSearchContentVideo => 'Загрузка відэа';

  @override
  String get channelDetailsSearchContentAudio => 'Загрузка аўдыя';

  @override
  String get channelDetailsSearchContentFile => 'Загрузка файла';

  @override
  String get channelDetailsSearchContentLink => 'Спасылка';

  @override
  String get channelDetailsSearchContentEmbed =>
      'Папярэдні прагляд спасылкі або ўбудаванне';

  @override
  String get channelDetailsSearchContentSticker => 'Стыкер';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Толькі загружаныя выявы';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Толькі загружаныя відэафайлы';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Толькі загружаныя аўдыяфайлы';

  @override
  String get channelDetailsSearchContentFileDescription =>
      'Любое загружанае далучэнне';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'URL, набраны ў тэксце паведамлення';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Згенераваныя папярэднія прагляды і разгорнутыя ўбудаванні, а не загружаныя файлы';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Стыкер, далучаны да паведамлення';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return 'Тыпаў: $count';
  }

  @override
  String get personalNotesTitle => 'Асабістыя нататкі';

  @override
  String get personalNotesSubtitle =>
      'Ваша прыватная прастора для думак і напамінаў';

  @override
  String groupDmWelcome(String displayName) {
    return 'Сардэчна запрашаем у $displayName. Дадайце сяброў, каб група ажыла.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Рэдагаваць групу';

  @override
  String get groupDmWelcomeAddFriends => 'Дадаць сяброў у групу';

  @override
  String get dmGroupInvites => 'Запрашэнні';

  @override
  String get groupDmEditTitle => 'Рэдагаваць групу';

  @override
  String get groupDmGroupName => 'Назва групы';

  @override
  String get groupDmMyGroup => 'Мая група';

  @override
  String get groupDmGroupNameMaxLength =>
      'Назва групы мусіць змяшчаць не больш за 100 сімвалаў';

  @override
  String get groupDmGroupIcon => 'Значок групы';

  @override
  String get groupDmUploadIcon => 'Загрузіць значок';

  @override
  String get groupDmChangeIcon => 'Змяніць значок';

  @override
  String get groupDmRemoveIcon => 'Выдаліць значок';

  @override
  String get groupDmUpdated => 'Група абноўлена';

  @override
  String get groupDmUpdateFailed =>
      'Не ўдалося абнавіць групу. Паспрабуйце яшчэ раз.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Аніміраваныя значкі не падтрымліваюцца. Выкарыстайце статычную выяву.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Аніміраваныя значкі не падтрымліваюцца';

  @override
  String get groupDmIconFileTooLargeTitle => 'Файл значка занадта вялікі';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'Файл значка занадта вялікі. Выберыце файл меншы за $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'Фармат значка не падтрымліваецца';

  @override
  String get groupDmUnsupportedIconFormatBody =>
      'Тып файла не падтрымліваецца.';

  @override
  String get groupDmInvalidImage => 'Няправільная выява';

  @override
  String get groupDmInvalidImageBody =>
      'Гэта выява няправільная. Паспрабуйце іншую.';

  @override
  String get groupDmAddFriends => 'Дадаць';

  @override
  String get groupDmOrSendInvite => 'або адпраўце сябру запрашэнне:';

  @override
  String get groupDmGenerateInviteLink => 'Стварыць спасылку-запрашэнне';

  @override
  String get groupDmCreateInvite => 'Стварыць';

  @override
  String get groupDmInviteExpires24Hours =>
      'Ваша запрашэнне дзейнічае 24 гадзіны';

  @override
  String get groupDmAddFriendFailed =>
      'Не ўдалося дадаць гэтага сябра ў групу. Паспрабуйце яшчэ раз.';

  @override
  String get groupDmGroupFull =>
      'Гэта група запоўнена. Каб дадаць іншых людзей, спачатку выдаліце кагосьці.';

  @override
  String get groupDmRateLimited =>
      'Вы занадта спяшаецеся. Пачакайце крыху і паспрабуйце яшчэ раз.';

  @override
  String get groupDmCreateInviteFailedBody =>
      'Не ўдалося стварыць спасылку-запрашэнне. Паспрабуйце яшчэ раз.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'Не ўдалося стварыць спасылку-запрашэнне. Паспрабуйце яшчэ раз.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'У вас няма дазволу ствараць запрашэнні ў гэтым канале.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'Суполка дасягнула ліміту запрашэнняў.';

  @override
  String get groupDmCopyInviteFailed =>
      'Не ўдалося скапіраваць спасылку-запрашэнне';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Кіраваць запрашэннямі можа толькі ўладальнік групы.';

  @override
  String get groupDmNoInvitesCreated => 'Запрашэнні не створаны';

  @override
  String get groupDmLoadingInvites => 'Загрузка запрашэнняў...';

  @override
  String get groupDmInvitesLoadFailed =>
      'Не ўдалося загрузіць запрашэнні. Паспрабуйце яшчэ раз.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Адклікаць гэта запрашэнне? Гэта дзеянне нельга адмяніць.';

  @override
  String get groupDmInviteRevoked => 'Запрашэнне адклікана';

  @override
  String get groupDmRemoveFromGroup => 'Выдаліць з групы';

  @override
  String groupDmRemoveFromGroupConfirm(String userName) {
    return 'Выдаліць $userName з групы?';
  }

  @override
  String get groupDmRemoveFromGroupAction => 'Прыбраць';

  @override
  String get groupDmRemovedFromGroup => 'Выдалены з групы';

  @override
  String groupDmRemoveFromGroupFailed(String userName) {
    return 'Карыстальнік $userName яшчэ ў групе. Паспрабуйце яшчэ раз праз хвіліну.';
  }

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Аўтар: $name. Тэрмін дзеяння сканчаецца праз $time.';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'У канале $channelName больш ранніх паведамленняў няма.';
  }

  @override
  String get personalNotesComposerHint => 'Напішыце сабе';

  @override
  String channelComposerHint(String channelName) {
    return 'Напісаць у #$channelName';
  }

  @override
  String dmComposerHint(String recipientName) {
    return 'Напісаць @$recipientName';
  }

  @override
  String groupDmNamedComposerHint(String groupName) {
    return 'Напісаць у $groupName';
  }

  @override
  String get groupDmComposerHint => 'Група паведамленняў';

  @override
  String get composerHint => 'Паведамленне';

  @override
  String get composerOpenExpressionPicker => 'Адкрыць панэль выразаў';

  @override
  String get composerShowKeyboard => 'Паказаць клавіятуру';

  @override
  String get composerCloseAttachmentPanel => 'Закрыць выбар далучэнняў';

  @override
  String get composerSendMessage => 'Адправіць паведамленне';

  @override
  String get chatAttachmentPanelPhotos => 'Фота';

  @override
  String get chatAttachmentPanelFiles => 'Файлы';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Патрэбны доступ да фотатэкі';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Дайце доступ да фотатэкі, каб праглядаць і далучаць нядаўнія фота і відэа.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Адкрыць налады';

  @override
  String get chatAttachmentLibraryLimitedBody =>
      'Тут паказаны толькі фота і відэа, якімі вы дазволілі дзяліцца.';

  @override
  String get chatAttachmentLibraryLimitedManage => 'Кіраваць';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', адпраўляецца';

  @override
  String get messageAccessibilityFailedSuffix => ', не ўдалося адправіць';

  @override
  String get messageAccessibilityAttachmentSummary => 'далучэнне';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return 'далучэнні: $count';
  }

  @override
  String get messageAccessibilityImageSummary => 'выява';

  @override
  String get messageAccessibilityVideoSummary => 'відэа';

  @override
  String get messageAccessibilityAudioSummary => 'аўдыяфайл';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'стыкер $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'файл $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'далучэнне-спойлер';

  @override
  String get messageAccessibilityEmbedSummary => 'убудаванне';

  @override
  String get messageAccessibilityEmptySummary => 'паведамленне';

  @override
  String get personalNotesPrivateSpace => 'Ваша прыватная прастора';

  @override
  String get purgePersonalNotes => 'Ачысціць асабістыя нататкі';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Усе паведамленні і далучэнні ў вашых асабістых нататках будуць выдалены назаўсёды. Гэта нельга адмяніць.';

  @override
  String get purgePersonalNotesConfirmButton => 'Ачысціць';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Выдалена паведамленняў з асабістых нататак: $count';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Асабістыя нататкі ўжо былі пустыя';

  @override
  String get purgePersonalNotesFailed =>
      'Не ўдалося ачысціць асабістыя нататкі';

  @override
  String get userSettingsGroupYourAccount => 'Ваш уліковы запіс';

  @override
  String get userSettingsGroupBilling => 'Аплата';

  @override
  String get userSettingsGroupApplication => 'Праграма';

  @override
  String get userSettingsGroupDeveloper => 'Распрацоўшчык';

  @override
  String get userSettingsGroupStaffOnly => 'Толькі для супрацоўнікаў';

  @override
  String get userSettingsSearchPlaceholder => 'Пошук налад...';

  @override
  String get userSettingsSearchClear => 'Ачысціць пошук';

  @override
  String get userSettingsSearchNoResults => 'Налады не знойдзены';

  @override
  String get userSettingsCopyLinkToSection => 'Скапіраваць спасылку на раздзел';

  @override
  String get userSettingsCopyLinkToPage => 'Скапіраваць спасылку на старонку';

  @override
  String userSettingsJumpLinkPremiumPage(String productName) {
    return 'Старонка $productName';
  }

  @override
  String get userSettingsNavProfile => 'Профіль';

  @override
  String get userSettingsNavSecurityLogin => 'Бяспека і ўваход';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Падарункі';

  @override
  String get giftSettingsClaimAccountTitle =>
      'Замацуйце за сабой уліковы запіс';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Замацуйце за сабой уліковы запіс, каб актываваць падарункавыя коды Plutonium або кіраваць імі.';

  @override
  String get giftSettingsRedeemTitle => 'Актываваць падарунак';

  @override
  String get giftSettingsRedeemDescription =>
      'Увядзіце падарункавы код, каб актываваць Plutonium для свайго ўліковага запісу.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Увядзіце падарункавы код…';

  @override
  String get giftSettingsRedeemButton => 'Актываваць';

  @override
  String get giftSettingsRedeemSuccess =>
      'Падарунак актываваны. Карыстайцеся Plutonium з задавальненнем.';

  @override
  String get giftSettingsPurchasedTitle => 'Купленыя падарункі';

  @override
  String get giftSettingsPurchasedDescription =>
      'Кіруйце купленымі падарункавымі кодамі Plutonium. Падзяліцеся спасылкай на падарунак з кімсьці асаблівым або актывуйце яго для сябе!';

  @override
  String get giftSettingsEmptyTitle => 'Пакуль няма падарункаў';

  @override
  String get giftSettingsEmptyDescription =>
      'Купіце падарунак Plutonium на ўкладцы Plutonium, каб падзяліцца з сябрамі.';

  @override
  String get giftSettingsGoToPlutonium => 'Перайсці да Plutonium';

  @override
  String get giftSettingsLoadFailedTitle =>
      'Не ўдалося загрузіць інвентар падарункаў';

  @override
  String get giftSettingsLoadFailedDescription => 'Паспрабуйце пазней.';

  @override
  String get giftSettingsTryAgain => 'Паспрабаваць яшчэ раз';

  @override
  String get giftSettingsGiftUrl => 'URL падарунка';

  @override
  String get giftSettingsCopy => 'Скапіраваць';

  @override
  String get giftSettingsCopied => 'Скапіравана';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Куплены $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Актываваны $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Актываваны карыстальнікам $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'Гэты падарунак ужо актываваны';

  @override
  String get giftSettingsRedeemForYourself => 'Актываваць для сябе';

  @override
  String get giftSettingsShareWithFriend => 'Падзяліцца з сябрам';

  @override
  String get premiumPlutoniumTagline =>
      'Атрымайце вышэйшыя ліміты і эксклюзіўныя функцыі і падтрымайце незалежную платформу для зносін.';

  @override
  String get premiumPurchaseMode => 'Рэжым пакупкі';

  @override
  String get premiumForMe => 'Для сябе';

  @override
  String get premiumAsAGift => 'У падарунак';

  @override
  String get premiumMonthly => 'Штомесяц';

  @override
  String get premiumYearly => 'Штогод';

  @override
  String get premiumPerMonth => 'у месяц';

  @override
  String get premiumPerYear => 'у год';

  @override
  String get premiumOneTimePurchase => 'аднаразовая пакупка';

  @override
  String get premiumSave17 => 'Эканомія 17%';

  @override
  String get premiumUpgradeNow => 'Аформіць зараз';

  @override
  String get premiumBuyGift => 'Купіць падарунак';

  @override
  String get premiumOneYearGift => 'Падарунак на 1 год';

  @override
  String get premiumOneMonthGift => 'Падарунак на 1 месяц';

  @override
  String get premiumScrollPrompt =>
      'Пракруціце ўніз, каб убачыць усе перавагі Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'Бясплатна ці Plutonium';

  @override
  String get premiumFreeColumn => 'Бясплатна';

  @override
  String get premiumGiftSectionTitle => 'Падараваць Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'Падзяліцеся Plutonium з сябрамі: купіце падарункавую падпіску.';

  @override
  String get premiumGiftBannerOne => 'Вас чакае новы падарункавы код!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'Новыя падарункавыя коды, якія вас чакаюць: $count!';
  }

  @override
  String get premiumViewGifts => 'Паглядзець падарункі';

  @override
  String get premiumReadyToUpgrade => 'Гатовыя да паляпшэння?';

  @override
  String get premiumReadyToBuyGift => 'Гатовыя купіць падарунак?';

  @override
  String get premiumManageSubscription => 'Кіраваць падпіскай';

  @override
  String get premiumRedeemGiftCode => 'Актываваць падарункавы код';

  @override
  String get premiumGiftBadge => 'Падарунак';

  @override
  String get premiumCancelSubscriptionTitle => 'Скасаваць падпіску?';

  @override
  String get premiumCancelSubscriptionBody =>
      'Перавагі застаюцца ў вас да наступнай даты працягнення, а потым у вас будзе 3-дзённы льготны перыяд, каб падпісацца зноў і захаваць гісторыю падпіскі.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Скасаваць падпіску';

  @override
  String get premiumPurchaseHistoryTitle => 'Гісторыя пакупак';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Вашы апошнія рахункі. Каб змяніць спосаб аплаты падпіскі, дадайце або выберыце яго ў плацежным партале і зрабіце прадвызначаным.';

  @override
  String get premiumManagePaymentMethods => 'Кіраваць спосабамі аплаты';

  @override
  String get premiumSelfServeRefundButton => 'Вярнуць грошы за апошнюю пакупку';

  @override
  String premiumDisclaimerAgreement(String links) {
    String _temp0 = intl.Intl.selectLogic(links, {
      'both':
          'Купляючы, вы згаджаецеся з нашымі <terms>Умовамі выкарыстання</terms> і <privacy>Палітыкай прыватнасці</privacy>.',
      'terms':
          'Купляючы, вы згаджаецеся з нашымі <terms>Умовамі выкарыстання</terms>.',
      'other':
          'Купляючы, вы згаджаецеся з нашай <privacy>Палітыкай прыватнасці</privacy>.',
    });
    return '$_temp0';
  }

  @override
  String premiumDisclaimerAgreementPast(String links) {
    String _temp0 = intl.Intl.selectLogic(links, {
      'both':
          'Купляючы, вы пагадзіліся з нашымі <terms>Умовамі выкарыстання</terms> і <privacy>Палітыкай прыватнасці</privacy>.',
      'terms':
          'Купляючы, вы пагадзіліся з нашымі <terms>Умовамі выкарыстання</terms>.',
      'other':
          'Купляючы, вы пагадзіліся з нашай <privacy>Палітыкай прыватнасці</privacy>.',
    });
    return '$_temp0';
  }

  @override
  String instanceLegalLinksList(String links) {
    String _temp0 = intl.Intl.selectLogic(links, {
      'both':
          '<terms>Умовы выкарыстання</terms> і <privacy>Палітыка прыватнасці</privacy>',
      'terms': '<terms>Умовы выкарыстання</terms>',
      'other': '<privacy>Палітыка прыватнасці</privacy>',
    });
    return '$_temp0';
  }

  @override
  String premiumActiveUntil(String date) {
    return 'Актыўная да $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Скасоўваецца';

  @override
  String premiumCancelsOn(String date) {
    return 'Скасуецца $date. Да гэтага часу перавагі застаюцца актыўнымі.';
  }

  @override
  String get premiumReactivateSubscription => 'Аднавіць';

  @override
  String premiumGiftedUntil(String date) {
    return 'Падаравана да $date. Аўтаматычна не працягваецца.';
  }

  @override
  String get premiumGiftGraceEnded =>
      'Падараваны час скончыўся. Падпішыцеся, каб захаваць Plutonium.';

  @override
  String get premiumGiftTimeAddedAfterSubscription =>
      'Пры афармленні падпіскі аплата спісваецца адразу. Рэшта падараванага часу дадасца пасля аплачанага перыяду.';

  @override
  String get premiumComparisonFeatureColumn => 'Функцыя';

  @override
  String get premiumDisclaimerRefund =>
      'Вярнуць грошы самастойна можна на працягу 3 дзён пасля аплаты, не часцей за раз у 30 дзён. Пасля вяртання грошай падпіска скасоўваецца. Пакупнікі з ЕС/ЕЭП пры афармленні пакупкі адмаўляюцца ад 14-дзённага права на адмову ад дагавора, каб атрымаць доступ адразу. Замест апратэставання плацяжу праз банк карыстайцеся кнопкай вяртання грошай у праграме. Апратэставанне плацяжу можа назаўсёды абмежаваць ваш уліковы запіс. Stripe бяспечна апрацоўвае плацяжы. Мы ніколі не бачым поўны нумар вашай карткі.';

  @override
  String get premiumTermsOfService => 'Умовы выкарыстання';

  @override
  String get premiumPrivacyPolicy => 'Палітыка прыватнасці';

  @override
  String get premiumCheckoutStartFailedTitle =>
      'Не ўдалося пачаць афармленне заказу';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Пры пачатку афармлення заказу штосьці пайшло не так. Паспрабуйце яшчэ раз праз хвіліну.';

  @override
  String get premiumPlanUnavailable =>
      'Гэты план недаступны. Звярніцеся ў службу падтрымкі.';

  @override
  String get premiumPlanUnavailableSelfHosted =>
      'Гэты план недаступны. Звярніцеся да адміністратараў гэтага экзэмпляра.';

  @override
  String premiumDistributionPriceNote(String percent) {
    return 'Цэны ў гэтай версіі праграмы крыху вышэйшыя, бо $percent кожнага плацяжу ідзе на выдаткі на яе распаўсюджванне.';
  }

  @override
  String get premiumCompletePaymentTitle => 'Завяршыць аплату';

  @override
  String get premiumCompletePaymentBody =>
      'Цяпер вы пяройдзеце ў Stripe, каб завяршыць аплату. Пасля аплаты вярніцеся ў Fluxer.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Выберыце спосаб аплаты';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Плаціце праз Pix automático, каб дазволіць рэгулярныя спісанні проста з вашага бразільскага банка. Або выберыце «Аплата карткай», каб увесці даныя крэдытнай карткі на наступным экране Stripe.';

  @override
  String get premiumUsePix => 'Выкарыстаць Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Плаціце праз UPI, каб аформіць у вашым індыйскім банку электроннае даручэнне паводле правіл RBI. Або выберыце «Аплата карткай», каб увесці даныя крэдытнай карткі на наступным экране Stripe.';

  @override
  String get premiumUseUpi => 'Выкарыстаць UPI';

  @override
  String get premiumUseCard => 'Выкарыстаць картку';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Не ўдалося адкрыць плацежны партал';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Пры адкрыцці плацежнага партала штосьці пайшло не так. Паспрабуйце яшчэ раз праз хвіліну.';

  @override
  String get premiumAlreadyVisionaryTitle => 'Вы ўжо Visionary';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary ужо дае бестэрміновы доступ, таму рэгулярная падпіска не патрэбна. Купляць падарункі для іншых па-ранейшаму можна.';

  @override
  String get premiumExistingSubscriptionTitle => 'Падпіска ўжо ёсць';

  @override
  String get premiumExistingSubscriptionBody =>
      'Мы знайшлі ў гэтага ўліковага запісу наяўную падпіску Fluxer Plutonium. Кіруйце ёю ў абароненым плацежным партале, каб абнавіць плацежныя даныя або праверыць стан працягнення. Калі вы толькі што аплацілі, пачакайце хвіліну і зноў адкрыйце гэту старонку.';

  @override
  String get premiumPurchasesDisabledTitle => 'Пакупкі недаступныя';

  @override
  String premiumPurchasesDisabledBody(String supportEmail) {
    return 'Пакупкі для гэтага ўліковага запісу адключаны. Калі гэта падобна на памылку, напішыце на $supportEmail.';
  }

  @override
  String get premiumPurchasesDisabledBodySelfHosted =>
      'Пакупкі для гэтага ўліковага запісу адключаны. Калі вам здаецца, што гэта памылка, звярніцеся да адміністратараў гэтага экзэмпляра.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Каб купіць Fluxer Plutonium, замацуйце за сабой уліковы запіс.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Каб купіць Fluxer Plutonium, пацвердзіце адрас электроннай пошты.';

  @override
  String get premiumPerkCommunities => 'Суполкі';

  @override
  String get premiumPerkMessageCharacterLimit =>
      'Ліміт сімвалаў у паведамленні';

  @override
  String get premiumPerkBookmarkedMessages => 'Закладкі на паведамленні';

  @override
  String get premiumPerkFileUploadSize => 'Памер файла для загрузкі';

  @override
  String get premiumPerkUseAnimatedEmojis =>
      'Выкарыстоўваць аніміраваныя эмоджы';

  @override
  String get premiumPerkVideoQuality => 'Якасць відэа';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Аніміраваныя аватары і банеры профілю';

  @override
  String get premiumPerkEarlyAccess => 'Ранні доступ да новых функцый';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30 кадр/с';

  @override
  String get premiumPerkVideoQualityStock => 'Да 4K/60 кадр/с';

  @override
  String storePlutoniumPriceLine(String monthly, String yearly) {
    return '$monthly або $yearly';
  }

  @override
  String get storePlutoniumMonthSuffix => '/мес';

  @override
  String get storePlutoniumYearSuffix => '/год';

  @override
  String get storePlutoniumPriceOr => 'або';

  @override
  String get storePlutoniumEmojiTitle => 'Вашы эмоджы — паўсюль';

  @override
  String get storePlutoniumEmojiBody =>
      'Выкарыстоўвайце ўласныя эмоджы і стыкеры з любой сваёй суполкі ў кожным чаце і кожнай суполцы, дзе вы ёсць.';

  @override
  String get storePlutoniumProfileTitle => 'Профіль, які вылучаецца';

  @override
  String get storePlutoniumProfileBody =>
      'Аніміраваныя аватар і банер, бэйдж падпісчыка, жаданы чатырохзначны тэг пасля імя карыстальніка* і асобны профіль для кожнай суполкі.';

  @override
  String get storePlutoniumFilesTitle => 'Адпраўляйце файлы да 500 МБ';

  @override
  String get storePlutoniumFilesBody =>
      'Дзяліцеся поўнымі відэа і вялікімі файламі без папярэдняга сціскання. Бясплатныя ўліковыя запісы могуць адпраўляць файлы да 25 МБ.';

  @override
  String get storePlutoniumStreamTitle => 'Трансліруйце ў 4K пры 60 FPS';

  @override
  String get storePlutoniumStreamBody =>
      'Транслюйце экран або камеру ў якасці да 4K пры 60 кадрах у секунду. Бясплатныя ўліковыя запісы трансліруюць да 720p пры 30.';

  @override
  String get storePlutoniumStreamTitleIos => 'Трансліруйце ў лепшай якасці';

  @override
  String get storePlutoniumStreamBodyIos =>
      'Паказвайце экран або камеру ў якасці да 1080p з 60 кадрамі ў секунду ў праграме і да 4K з 60 кадрамі ў настольнай праграме. Бясплатныя ўліковыя запісы трансліруюць у якасці да 720p з 30 кадрамі.';

  @override
  String get storePlutoniumManageHeading => 'Ваша падпіска';

  @override
  String get storePlutoniumCompareTitle =>
      'Параўнайце бясплатны план і Plutonium';

  @override
  String get storePlutoniumCompareMobileNote =>
      'Не ўсе гэтыя функцыі ёсць у мабільнай праграме. Некаторыя даступныя толькі на камп’ютары.';

  @override
  String get storePlutoniumNotAvailable => 'Недаступна';

  @override
  String get storePlutoniumAvailable => 'Даступна';

  @override
  String get storePlutoniumCompareTag =>
      'Выбірайце 4-значны нумар пасля імя карыстальніка*';

  @override
  String get storePlutoniumCompareProfile =>
      'Асобны профіль для кожнай суполкі';

  @override
  String get storePlutoniumCompareBadge => 'Бэйдж падпісчыка ў вашым профілі';

  @override
  String get storePlutoniumCompareBackgrounds =>
      'Фоны для відэавыклікаў, якія можна захаваць';

  @override
  String get storePlutoniumCompareCommunities =>
      'Суполкі, да якіх можна далучыцца';

  @override
  String get storePlutoniumCompareCharacters => 'Сімвалаў у адным паведамленні';

  @override
  String get storePlutoniumCompareBookmarks =>
      'Паведамленні, якія можна дадаць у закладкі';

  @override
  String get storePlutoniumCompareUpload =>
      'Найбольшы файл, які можна загрузіць';

  @override
  String get storePlutoniumCompareSavedMedia =>
      'Медыя, якія можна захаваць на потым';

  @override
  String get storePlutoniumCompareAnimatedEmoji =>
      'Выкарыстоўвайце аніміраваныя эмоджы ў паведамленнях';

  @override
  String get storePlutoniumCompareCustomEmoji =>
      'Выкарыстоўвайце ўласныя эмоджы і стыкеры ў любой суполцы';

  @override
  String get storePlutoniumCompareVideo =>
      'Якасць відэавыклікаў і дэманстрацыі экрана';

  @override
  String get storePlutoniumCompareAvatar =>
      'Аніміраваныя аватар і банер профілю';

  @override
  String get storePlutoniumCompareEarlyAccess =>
      'Ранні доступ да новых функцый';

  @override
  String get storePlutoniumCompareThemes => 'Уласныя тэмы для праграмы';

  @override
  String get storePlutoniumVideoFree => 'Да 720p пры 30 FPS';

  @override
  String get storePlutoniumVideoPlutonium => 'Да 4K пры 60 FPS';

  @override
  String get storePlutoniumVideoPlutoniumIos =>
      'Да 1080p з 60 FPS у праграме, да 4K з 60 FPS на камп’ютары';

  @override
  String get storePlutoniumTagFootnote =>
      'Можна выбраць толькі тэг, якога яшчэ няма ў іншага карыстальніка з такім самым імем. Вялікія і малыя літары ў імёнах не адрозніваюцца, таму Mina#4821 і mina#4821 лічацца аднолькавымі. Тэг #0000 зарэзерваваны для ўдзельнікаў Fluxer Visionary.';

  @override
  String get storePlutoniumTagFootnoteIos =>
      'Можна выбраць толькі тэг, якога яшчэ няма ў іншага карыстальніка з такім самым імем. Вялікія і малыя літары ў імёнах не адрозніваюцца, таму Mina#4821 і mina#4821 лічацца аднолькавымі.';

  @override
  String get storePlutoniumLearnVisionary => 'Даведайцеся больш пра Visionary.';

  @override
  String get storePlutoniumDonatePrompt =>
      'Хочаце проста падтрымаць распрацоўку Fluxer з адкрытым кодам? ';

  @override
  String get storePlutoniumDonateLink => 'Лепш зрабіце ахвяраванне.';

  @override
  String get storePlutoniumHighlightsLead =>
      'Падпіска фінансуе Fluxer і адкрывае';

  @override
  String get storePlutoniumHighlightEmoji =>
      'Уласныя эмоджы і стыкеры ў любым чаце';

  @override
  String get storePlutoniumHighlightProfile =>
      'Аніміраваны профіль і бэйдж, а таксама ўласны нумар тэга';

  @override
  String get storePlutoniumHighlightFiles => 'Загрузка файлаў да 500 МБ';

  @override
  String get storePlutoniumHighlightMessages => 'Паведамленні да 4000 сімвалаў';

  @override
  String get storePlutoniumHighlightCommunityProfile =>
      'Асобны профіль для кожнай суполкі';

  @override
  String get storePlutoniumHighlightsMore => 'І яшчэ шмат чаго';

  @override
  String get storePlutoniumRenewsThroughPlay =>
      'Аўтаматычна працягваецца праз Google Play, пакуль вы не скасуеце падпіску.';

  @override
  String get storePlutoniumRenewsThroughAppStore =>
      'Аўтаматычна працягваецца праз App Store, пакуль вы не скасуеце падпіску.';

  @override
  String get storePlutoniumAppleEula =>
      'Стандартныя ўмовы выкарыстання Apple (EULA)';

  @override
  String get storePlutoniumRestorePurchases => 'Аднавіць пакупкі';

  @override
  String get storePlutoniumRestoreDone => 'Вашу падпіску Plutonium адноўлена.';

  @override
  String get storePlutoniumRestoreNothing =>
      'Для гэтага Apple Account няма падпіскі Plutonium, якую можна аднавіць.';

  @override
  String get storePlutoniumRestoreFailed =>
      'Не ўдалося аднавіць пакупкі. Паспрабуйце яшчэ раз праз хвіліну.';

  @override
  String get storePlutoniumAlreadySubscribed =>
      'У вас ужо ёсць падпіска Fluxer Plutonium.';

  @override
  String get storePlutoniumOwnedByOtherAccount =>
      'Apple Account на гэтай прыладзе ўжо аплачвае Plutonium для іншага ўліковага запісу Fluxer.';

  @override
  String get storePlutoniumClaimFailedTitle => 'Plutonium не дададзены';

  @override
  String get storePlutoniumClaimFailedBody =>
      'App Store пацвердзіў вашу пакупку, але дадаць Plutonium да гэтага ўліковага запісу не ўдалося. Націсніце «Аднавіць пакупкі», каб паспрабаваць яшчэ раз, або звярніцеся ў службу падтрымкі, калі гэта не дапаможа.';

  @override
  String storePlutoniumSavePercent(int percent) {
    return 'Эканомія $percent%';
  }

  @override
  String get storePlutoniumWaiting =>
      'Пакупка атрымана. Plutonium з’явіцца тут, як толькі актывуецца.';

  @override
  String get storePlutoniumApprovalPending =>
      'Ваша пакупка чакае ўхвалення. Plutonium дададуць да вашага ўліковага запісу, як толькі яе ўхваляць.';

  @override
  String get storePlutoniumLoadFailed =>
      'Не ўдалося загрузіць планы Plutonium. Праверце злучэнне і паспрабуйце яшчэ раз.';

  @override
  String get storePlutoniumRetry => 'Паспрабаваць яшчэ раз';

  @override
  String get storePlutoniumVisionaryStatus =>
      'Visionary ужо дае бестэрміновы доступ, таму рэгулярная падпіска не патрэбна.';

  @override
  String get userSettingsNavPrivacyDashboard => 'Панэль прыватнасці';

  @override
  String get userSettingsNavAuthorizedApps => 'Аўтарызаваныя праграмы';

  @override
  String get userSettingsNavBlockedUsers => 'Заблакіраваныя карыстальнікі';

  @override
  String get userSettingsNavLinkedDevices => 'Падключаныя прылады';

  @override
  String get userSettingsNavConnections => 'Падключэнні';

  @override
  String get userSettingsNavLookAndFeel => 'Выгляд';

  @override
  String get userSettingsNavAccessibility => 'Даступнасць';

  @override
  String get userSettingsNavChat => 'Чат';

  @override
  String get userSettingsNavAudioAndVideo => 'Аўдыя і відэа';

  @override
  String get userSettingsNavShortcuts => 'Спалучэнні клавіш';

  @override
  String get audioAndVideoAudioSectionTitle => 'Аўдыя';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'Наладзьце мікрафон, дынамікі і апрацоўку голасу.';

  @override
  String get audioAndVideoVideoSectionTitle => 'Відэа';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'Наладзьце якасць камеры і дэманстрацыі экрана.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle =>
      'Паводзіны падчас выкліку';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Кіруйце запытамі на пацвярджэнне падчас галасавых і відэавыклікаў.';

  @override
  String get audioAndVideoInputDeviceLabel => 'Прылада ўводу';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Прылада вываду';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'Прадвызначана';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Выводзіць гук праз гучны дынамік';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'Калі выключана, гук прайграецца праз размоўны дынамік або падключаныя навушнікі.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Гучнасць уваходнага сігналу';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Гучнасць вываду';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Апрацоўка голасу';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Сфакусіраваны голас';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Рэкамендуецца. Ачышчае гук мікрафона, каб маўленне было выразным.';

  @override
  String get audioAndVideoDirectInputLabel => 'Прамы ўвод';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Адпраўляе ваш гук без змен. Найлепш падыходзіць, калі вы карыстаецеся знешнімі праграмамі для гуку.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Уласны';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Наладжвайце кожны параметр самі: шумапрыглушэнне, прыглушэнне рэха і ўзмацненне.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Шумапрыглушэнне';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Няма';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Прыглушэнне рэха';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Аўтаматычнае рэгуляванне ўзмацнення';

  @override
  String get audioAndVideoAutoGainControlDescription =>
      'Evens out your mic volume so you are not too quiet.';

  @override
  String get audioAndVideoNoiseSuppressionGateLabel => 'Noise gate';

  @override
  String get audioAndVideoNoiseSuppressionNoneDescription =>
      'Keeps all background noise.';

  @override
  String get audioAndVideoNoiseSuppressionStandardDescription =>
      'Reduces steady sounds like fans.';

  @override
  String get audioAndVideoNoiseSuppressionGateDescription =>
      'Mutes your mic while you\'re quiet. Doesn\'t remove noise while you talk.';

  @override
  String get audioAndVideoNoiseSuppressionRnnoiseDescription =>
      'Recommended. Removes noise like typing and fans while you talk.';

  @override
  String audioAndVideoNoiseSuppressionFallback(
    String requested,
    String effective,
  ) {
    return '$requested could not start. Using $effective instead.';
  }

  @override
  String get audioAndVideoEchoCancellationDescription =>
      'Stops your speakers from looping back into your mic.';

  @override
  String get voiceAudioProcessingDirectInput =>
      'Audio processing (direct input, raw)';

  @override
  String get voiceAudioProcessingFocusedVoice =>
      'Audio processing (focused voice)';

  @override
  String get voiceAudioProcessingCustomEnhanced =>
      'Audio processing (custom, enhanced)';

  @override
  String get voiceAudioProcessingCustom => 'Audio processing (custom)';

  @override
  String get voiceAudioProcessingCustomNoSuppression =>
      'Audio processing (custom, no suppression)';

  @override
  String audioAndVideoExternalProcessorWarning(String processor) {
    return 'Looks like you\'re using $processor. Stacking Fluxer\'s processing on top can cause pumping or distortion. Direct input passes your audio through untouched.';
  }

  @override
  String get audioAndVideoSwitchToDirectInput => 'Switch to direct input';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Праверка мікрафона';

  @override
  String get audioAndVideoMicTestStartLabel => 'Пачаць праверку мікрафона';

  @override
  String get audioAndVideoMicTestStopLabel => 'Спыніць праверку мікрафона';

  @override
  String get audioAndVideoCameraLabel => 'Камера';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Люстраны выгляд камеры';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'Якасць камеры';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'Якасць дэманстрацыі экрана';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Частата кадраў';

  @override
  String get audioAndVideoFrameRate15Label => '15 кадр/с';

  @override
  String get audioAndVideoFrameRate30Label => '30 кадр/с';

  @override
  String get audioAndVideoFrameRate60Label => '60 кадр/с';

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Зараз гэты экзэмпляр дазваляе дэманстрацыю экрана ў якасці да 720p з 30 FPS.';

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'Не пытаць, калі я хаваю сваю камеру';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'Не пытаць, калі я хаваю дэманстрацыю свайго экрана';

  @override
  String get userSettingsNavNotifications => 'Апавяшчэнні';

  @override
  String get notificationsGeneralSectionTitle => 'Агульны';

  @override
  String get notificationsEnableNotificationsLabel => 'Уключыць апавяшчэнні';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Атрымлівайце апавяшчэнні пра новыя паведамленні. Магчыма, трэба будзе дазволіць апавяшчэнні для $productName у наладах прылады. Каб наладжваць апавяшчэнні для асобных каналаў або суполак, адкрыйце налады апавяшчэнняў у меню суполкі.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Уключыць апавяшчэнні на камп’ютары';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Выкарыстоўвае цэнтр апавяшчэнняў АС. Каб наладжваць апавяшчэнні для асобных каналаў або суполак, націсніце правай кнопкай мышы на значок суполкі і адкрыйце налады апавяшчэнняў.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Час бяздзейнасці для push-апавяшчэнняў';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName не адпраўляе push-апавяшчэнні на мабільныя прылады, пакуль вы за камп’ютарам. Выберыце, колькі часу вы мусіце быць неактыўныя на камп’ютары, перш чым пачнуць прыходзіць push-апавяшчэнні.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute хвіліна';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes хв';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle => 'Налада згадванняў';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Налада згадванняў у адказах';

  @override
  String get notificationsMentionNoPreferenceName => 'Без перавагі';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Паважаць намер адпраўніка, без папярэджання, калі ў паведамленні ўключана або выключана @згадванне';

  @override
  String get notificationsMentionPreferMentionName => 'Са згадваннем праз @';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Прадвызначана ўключаць у адказах згадванне праз @ і папярэджваць адпраўніка, калі яго выключаюць';

  @override
  String get notificationsMentionPreferNoMentionName => 'Без згадвання праз @';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Прадвызначана не ўключаць у адказах згадванне праз @ і папярэджваць адпраўніка, калі яго ўключаюць';

  @override
  String get notificationsTtsSectionTitle => 'Апавяшчэнні з агучваннем тэксту';

  @override
  String get notificationsTtsEnableCommandLabel => 'Уключыць агучванне /tts';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'Дазволіць камандзе /tts зачытваць ваша паведамленне ўголас. Калі гэта выключыць, такія каманды застануцца звычайным тэкстам.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Хуткасць прайгравання можна змяніць у раздзеле ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Даступнасць';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle =>
      'Аўтаматычнае агучванне паведамленняў';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Агучвае ўваходнае змесціва незалежна ад таго, ці прыйшло яно праз /tts.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Кожны канал';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Агучваць кожнае ўваходнае паведамленне незалежна ад таго, які канал адкрыты.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Толькі актыўны канал';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Агучваецца толькі канал, які вы праглядаеце. Агучванне пераходзіць разам з вамі паміж каналамі.';

  @override
  String get notificationsTtsModeNeverName => 'Ніколі аўтаматычна';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Нічога не агучваць, пакуль хтосьці не запусціць /tts уручную.';

  @override
  String get notificationsTtsModeAriaLabel => 'Агучваць усе паведамленні';

  @override
  String get notificationsSoundsSectionTitle => 'Гукі';

  @override
  String get notificationsMasterVolumeLabel => 'Агульная гучнасць';

  @override
  String get notificationsMasterVolumeDescription =>
      'Задае ўзровень для кожнага гукавога эфекту. Перавызначэнні для асобных гукаў гэта ігнаруюць.';

  @override
  String get notificationsResetToDefaultVolume =>
      'Скінуць гучнасць да прадвызначанай';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Адключыць усе гукі апавяшчэнняў';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Вашы цяперашнія налады гукаў апавяшчэнняў будуць захаваны.';

  @override
  String get notificationsShowMoreSoundEffects =>
      'Паказаць больш гукавых эфектаў';

  @override
  String get notificationsShowFewerSoundEffects =>
      'Паказаць менш гукавых эфектаў';

  @override
  String get notificationsPreviewSound => 'Праслухаць гук';

  @override
  String get notificationsPerSoundVolumeTitle => 'Гучнасць для кожнага гуку';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Задайце ўласную гучнасць для асобных гукаў. Гукі без перавызначэння выкарыстоўваюць агульную гучнасць.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Актыўныя перавызначэнні гучнасці ўласных гукаў: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Як агульная • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'Скінуць $label да агульнай гучнасці';
  }

  @override
  String get notificationsResetAllOverrides => 'Скінуць усе перавызначэнні';

  @override
  String notificationsMuteSound(String label) {
    return 'Выключыць гук: $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'Уключыць гук: $label';
  }

  @override
  String get notificationsSoundMessage =>
      'Апавяшчэнні пра паведамленні суполкі';

  @override
  String get notificationsSoundDirectMessage =>
      'Апавяшчэнні пра асабістыя паведамленні';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Апавяшчэнні пра паведамленні цяперашняга канала';

  @override
  String get notificationsSoundMute => 'Выключэнне мікрафона';

  @override
  String get notificationsSoundUnmute => 'Уключэнне мікрафона';

  @override
  String get notificationsSoundDeaf => 'Выключэнне гуку ў галасавым чаце';

  @override
  String get notificationsSoundUndeaf => 'Уключэнне гуку ў галасавым чаце';

  @override
  String get notificationsSoundUserJoin => 'Карыстальнік далучаецца да канала';

  @override
  String get notificationsSoundUserLeave => 'Карыстальнік пакідае канал';

  @override
  String get notificationsSoundUserMove =>
      'Карыстальніка перамясцілі ў іншы канал';

  @override
  String get notificationsSoundViewerJoin => 'Глядач далучаецца да трансляцыі';

  @override
  String get notificationsSoundViewerLeave => 'Глядач пакідае трансляцыю';

  @override
  String get notificationsSoundVoiceDisconnect =>
      'Галасавое падключэнне перарвана';

  @override
  String get notificationsSoundIncomingRing => 'Уваходны выклік';

  @override
  String get notificationsSoundCameraOn => 'Камера ўключана';

  @override
  String get notificationsSoundCameraOff => 'Камера выключана';

  @override
  String get notificationsSoundScreenShareStart =>
      'Пачатак дэманстрацыі экрана';

  @override
  String get notificationsSoundScreenShareStop =>
      'Спыненне дэманстрацыі экрана';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'Не ўдалося абнавіць час бяздзейнасці для push-апавяшчэнняў. Паспрабуйце яшчэ раз.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Не ўдалося абнавіць наладу згадванняў. Паспрабуйце яшчэ раз.';

  @override
  String get notificationsPermissionDeniedTitle => 'Апавяшчэнні заблакіраваны';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'Не ўдалося ўключыць апавяшчэнні. Каб працягнуць, дайце дазвол на апавяшчэнні.';

  @override
  String get notificationsPushDeliveryProviderLabel =>
      'Пастаўшчык push-апавяшчэнняў';

  @override
  String get notificationsPushDeliveryDistributorLabel => 'Дыстрыб’ютар';

  @override
  String get notificationsPushDeliveryDistributorNone => 'Не выбраны';

  @override
  String get notificationsPushDeliveryDistributorSheetTitle =>
      'Выберыце дыстрыб’ютара';

  @override
  String get notificationsPushDeliveryDistributorPickAccessibility =>
      'Змяніць дыстрыб’ютара push-апавяшчэнняў';

  @override
  String get notificationsPushDeliveryGatewayLabel => 'Шлюз';

  @override
  String get notificationsPushDeliveryRelayLabel => 'Рэтранслятар Fluxer Push';

  @override
  String get notificationsPushDeliveryRelayInUse => 'Выкарыстоўваецца';

  @override
  String get notificationsPushDeliveryRelayOff => 'Выключана';

  @override
  String get notificationsPushDeliveryRelayNotUsed => 'Не выкарыстоўваецца';

  @override
  String get notificationsPushRelaySectionTitle =>
      'Рэтранслятар push-апавяшчэнняў';

  @override
  String notificationsPushRelaySectionDescription(String pushProvider) {
    return '$pushProvider дастаўляе push-апавяшчэнні толькі праз уласны сэрвіс, таму апавяшчэнні для гэтай прылады праходзяць праз рэтранслятар Fluxer.';
  }

  @override
  String get notificationsPushRelayConsentLabel =>
      'Выкарыстоўваць push-рэтранслятар Fluxer';

  @override
  String get notificationsPushRelayConsentDescription =>
      'Калі выключыць, рэгістрацыя push для гэтай прылады будзе выдалена і прылада перастане атрымліваць push-апавяшчэнні.';

  @override
  String get pushRelayConsentTitle => 'Рэтранслятар push-апавяшчэнняў';

  @override
  String pushRelayConsentDescription(String pushProvider) {
    return '$pushProvider дастаўляе push-апавяшчэнні толькі праз уласны сэрвіс, таму апавяшчэнні для гэтай прылады праходзяць праз рэтранслятар Fluxer.';
  }

  @override
  String get pushRelayConsentNoticePrefix => 'Прыміце ';

  @override
  String get pushRelayConsentNoticeLink =>
      'паведамленне пра прыватнасць push-рэтранслятара';

  @override
  String get pushRelayConsentNoticeSuffix =>
      ' , каб уключыць push-апавяшчэнні на гэтай прыладзе. Прыняць яго трэба толькі адзін раз на кожнай прыладзе.';

  @override
  String get pushRelayConsentAgree => 'Прыняць і працягнуць';

  @override
  String get pushRelayConsentDecline => 'Не зараз';

  @override
  String pushRelayConsentDeclinedToast(String settingLabel) {
    return 'Для гэтага ўліковага запісу на гэтай прыладзе push-апавяшчэнні застаюцца выключанымі. Уключыць іх пазней можна наладай «$settingLabel» у наладах апавяшчэнняў.';
  }

  @override
  String get pushRelayConsentDeclinedToastAction => 'Адкрыць налады';

  @override
  String get userSettingsNavLanguageAndTime => 'Мова і час';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Мова інтэрфейсу';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Выберыце мову ўсёй праграмы';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Фармат часу';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Выберыце, як паказваецца час ва ўсёй праграме';

  @override
  String get languageAndTimeTimeFormatSelectionLabel => 'Выбар фармату часу';

  @override
  String get languageAndTimeTimeFormatAuto => 'Аўта';

  @override
  String get languageAndTimeTimeFormat12Hour => '12-гадзінны';

  @override
  String get languageAndTimeTimeFormat24Hour => '24-гадзінны';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'Мова праграмы: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Рэгіянальныя налады сістэмы: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Выкарыстоўваць фармат часу з рэгіянальных налад сістэмы';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'Не ўдалося абнавіць фармат часу';

  @override
  String get userSettingsNavDefaultApps => 'Прадвызначаныя праграмы';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Вэб-браўзер';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Выберыце браўзер, у якім адкрываюцца спасылкі.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'Калі для сайта ўсталявана праграма, спасылкі спачатку адкрываюцца ў ёй.';

  @override
  String get defaultAppsWebBrowserInApp => 'Браўзер у праграме';

  @override
  String get defaultAppsWebBrowserExternal => 'Знешні браўзер';

  @override
  String get userSettingsNavAppIcon => 'Значок праграмы';

  @override
  String get appIconSectionTitle => 'Значок праграмы';

  @override
  String get appIconSectionDescription =>
      'Выберыце значок для галоўнага экрана.';

  @override
  String get appIconSectionDescriptionAndroid =>
      'Выберыце значок для галоўнага экрана. Пры змене значка праграма перазапусціцца.';

  @override
  String get appIconAndroidChangeTitle => 'Змяніць значок праграмы?';

  @override
  String get appIconAndroidChangeDescription =>
      'Fluxer перазапусціцца, каб прымяніць новы значок на галоўным экране.';

  @override
  String get appIconAndroidChangeConfirm => 'Змяніць значок';

  @override
  String get appIconOptionDefault => 'Прадвызначана';

  @override
  String get appIconOptionStarfield => 'Зорнае поле';

  @override
  String get appIconOptionSweden => 'Швецыя';

  @override
  String get appIconOptionGreyscale => 'Адценні шэрага';

  @override
  String get appIconOptionRainbow => 'Вясёлка';

  @override
  String get appIconOptionWaves => 'Хвалі';

  @override
  String get appIconOptionChromaticAberration => 'Храматычная аберацыя';

  @override
  String get appIconOptionDefaultBrutalist => 'Бруталізм';

  @override
  String get appIconOptionGreyscaleBrutalist => 'Бруталізм у адценнях шэрага';

  @override
  String get appIconUnsupported =>
      'На гэтай прыладзе нельга змяніць значок праграмы.';

  @override
  String get userSettingsNavAdvanced => 'Дадаткова';

  @override
  String get advancedPerformanceReportingTitle =>
      'Справаздачы пра прадукцыйнасць';

  @override
  String get advancedCrashReportingSectionDescription =>
      'Дапамажыце Fluxer выпраўляць памылкі ў гэтай праграме: дзяліцеся данымі пра збоі і прадукцыйнасць. Прадвызначана гэта выключана.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Адпраўляць справаздачы пра збоі і прадукцыйнасць';

  @override
  String get advancedCrashReportingDescription =>
      'Справаздачы трапляюць у сістэму адсочвання памылак Fluxer, нават калі вы ўвайшлі на іншым экзэмпляры. Яны звязаны з выпадковым ID гэтага ўсталявання і не ўтрымліваюць ID вашага ўліковага запісу, назваў экзэмпляраў або змесціва паведамленняў.';

  @override
  String get observabilityReportingConsentTitle => 'Дапамажыце выправіць збоі';

  @override
  String get observabilityReportingConsentSubtitle =>
      'Fluxer нечакана закрыўся. Справаздача пра збой дапаможа нам хутчэй знайсці і выправіць праблему.';

  @override
  String get observabilityReportingConsentBody =>
      'Справаздачы ўтрымліваюць журналы збояў, памылкі, даныя пра прадукцыйнасць, час выканання сеткавых запытаў, а таксама экраны і націсканні, якія папярэднічалі праблеме, і звязаны з выпадковым ID гэтага ўсталявання. Яны ніколі не ўтрымліваюць змесціва паведамленняў і трапляюць толькі ва ўласную сістэму адсочвання памылак Fluxer. Выключыць гэта можна ў любы час.';

  @override
  String observabilityReportingConsentEnableLater(String reportingToggle) {
    return 'Каб уключыць пазней, адкрыйце Налады → Дадаткова → $reportingToggle.';
  }

  @override
  String get observabilityReportingConsentAgree =>
      'Адправіць справаздачы пра збоі';

  @override
  String get observabilityReportingConsentDecline => 'Больш не пытаць';

  @override
  String get observabilityReportingConsentNotNow => 'Не зараз';

  @override
  String get advancedSettingsConfigure => 'Наладзіць';

  @override
  String get advancedSettingsCategoryPrivacy => 'Прыватнасць';

  @override
  String get advancedSettingsCategoryAppearance => 'Выгляд';

  @override
  String get advancedSettingsCategoryAccessibility => 'Даступнасць';

  @override
  String get advancedSettingsCategoryChat => 'Чат';

  @override
  String get advancedSettingsCategoryMedia => 'Медыя';

  @override
  String get advancedSettingsCategoryVoice => 'Галасавы';

  @override
  String get advancedSettingsCategoryDeveloper => 'Распрацоўшчык';

  @override
  String get advancedSettingEnableTextSelectionLabel =>
      'Уключыць вылучэнне тэксту';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Дазволіць вылучэнне тэксту ў праграме';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Уключыць мініяцюры перамоткі відэа';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Мініяцюра або жывы кадр пры перамотцы відэа';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Тактыльны водгук';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Вібрацыя пры націсканнях і дзеяннях. Не сінхранізуецца паміж прыладамі.';

  @override
  String get advancedSettingShowNekoLabel => 'Паказваць Нэка';

  @override
  String get advancedSettingShowNekoDescription =>
      'Кот Нэка, які гоніцца за курсорам';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Паказваць Нэка ў полі ўводу чата';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Анімацыя маштабу на застаўцы';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Памяншаць лагатып пры выхадзе з застаўкі';

  @override
  String get advancedSettingSplashQuotesLabel => 'Цытаты на застаўцы';

  @override
  String get advancedSettingSplashQuotesDescription =>
      'Паказваць выпадковую цытату на застаўцы. Не сінхранізуецца паміж прыладамі.';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Падказкі для клавіятуры';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Спалучэнні клавіш у падказках';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Уключыць абранае';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Паказваць абранае ва ўсёй праграме';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Паводзіны пры далучэнні да галасавога канала';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Пацвярджэнне або падвойнае націсканне для далучэння да галасавых каналаў суполак';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Патрабаваць падвойнага націскання для далучэння да галасавых каналаў';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Пытаць пацвярджэнне перад далучэннем да галасавых каналаў';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Аўтаматычна адпраўляць GIF пасля выбару';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Аўтаматычна адпраўляць GIF з панэлі выбару без пацвярджэння';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Захоўваць абраныя GIF як захаваныя медыя';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Выберыце, як захоўваюцца абраныя GIF';

  @override
  String get advancedSettingMediaButtonsLabel => 'Кнопкі медыя';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Наладзьце, якія кнопкі і індыкатары паказваюцца на медыядалучэннях і ўбудаваннях';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Загружаць далучэнні перад адпраўкай';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Пачынаць загрузку далучэнняў, як толькі яны дададзены ў поле ўводу паведамлення';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Прыбіраць з URL параметры адсочвання';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Аўтаматычна выдаляць параметры адсочвання з URL у паведамленнях, якія вы адпраўляеце';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'Давяраць усім знешнім спасылкам';

  @override
  String get advancedSettingSearchEnginesLabel => 'Пошукавыя сістэмы';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Наладзьце пошукавыя сістэмы для пошуку вылучанага тэксту';

  @override
  String get advancedSettingTranslatorsLabel => 'Перакладчыкі';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Наладзьце пастаўшчыкоў перакладу для вылучанага тэксту';

  @override
  String get advancedSettingReverseImageSearchLabel => 'Зваротны пошук выяў';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Пастаўшчыкі зваротнага пошуку выяў';

  @override
  String get advancedSettingMessageActionBarLabel =>
      'Панэль дзеянняў з паведамленнем';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Наладзьце панэль дзеянняў, якая з’яўляецца пры навядзенні на паведамленні';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Аўтадапаўненне выразаў';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Выберыце, што паказваецца, калі вы ўводзіце двукроп’е ў поле паведамлення';

  @override
  String get advancedSettingInputButtonsLabel =>
      'Кнопкі поля ўводу паведамлення';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Выберыце, якія кнопкі паказваюцца ў полі ўводу паведамлення';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Пракручваць уніз пры адпраўцы паведамлення';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Выберыце, як пракручваецца чат пасля адпраўкі паведамлення';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Прапускаць пацвярджэнне «Пазначыць усё як прачытанае»';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Пазначаць усе непрачытаныя каналы ва ўваходных як прачытаныя адразу, без пацвярджэння';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Прадвызначана хаваць заглушаныя каналы';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Не паказваць заглушаныя каналы на бакавых панэлях суполак';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'Паказваць індыкатар GIF';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Паказваць індыкатар заканчэння тэрміну дзеяння далучэння';

  @override
  String get advancedSettingShowMediaDeleteLabel =>
      'Паказваць кнопку выдалення';

  @override
  String get advancedSettingShowMediaDownloadLabel =>
      'Паказваць кнопку спампоўкі';

  @override
  String get advancedSettingShowMediaFavoriteLabel =>
      'Паказваць кнопку «У абранае»';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Паказваць кнопку хавання ўбудаванняў';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Паказваць панэль дзеянняў з паведамленнем';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel =>
      'Паказваць толькі кнопку «Яшчэ»';

  @override
  String get advancedSettingShowQuickReactionsLabel =>
      'Паказваць хуткія рэакцыі';

  @override
  String get advancedSettingEnableShiftToExpandLabel => 'Разгортванне па Shift';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Паказваць стандартныя эмоджы ў аўтадапаўненні выразаў';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Паказваць уласныя эмоджы ў аўтадапаўненні выразаў';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Паказваць стыкеры ў аўтадапаўненні выразаў';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Паказваць захаваныя медыя ў аўтадапаўненні выразаў';

  @override
  String get advancedSettingShowGifsButtonLabel => 'Паказваць кнопку GIF';

  @override
  String get advancedSettingShowMediaButtonLabel => 'Паказваць кнопку медыя';

  @override
  String get advancedSettingShowStickersButtonLabel =>
      'Паказваць кнопку стыкераў';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Паказваць кнопку эмоджы';

  @override
  String get advancedSettingShowSendButtonLabel => 'Паказваць кнопку адпраўкі';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Паказваць абвесткі пра новыя прылады';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Пытаць пра новыя аўдыяпрылады';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Элементы кіравання гучнасцю падключэння';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Паказваць у галасавых меню паўзункі гучнасці ўдзельнікаў для кожнай прылады';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Паводзіны папярэдняга прагляду дэманстрацыі экрана';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Паводзіны папярэдняга прагляду, выплыўных вокнаў і мініяцюр трансляцыі';

  @override
  String get advancedSettingScreenShareCodecLabel =>
      'Кодэк дэманстрацыі экрана';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Відэакодэк для дэманстрацыі экрана';

  @override
  String get advancedSettingScreenShareCodecAuto =>
      'Аўтаматычна (рэкамендуецца)';

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
      'Прыпыняць папярэдні прагляд маёй дэманстрацыі экрана ў фоне';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Схаваць мініяцюру папярэдняга прагляду маёй трансляцыі';

  @override
  String get advancedSettingDeveloperModeLabel =>
      'Уключыць рэжым распрацоўшчыка';

  @override
  String get advancedSettingDeveloperModeDescription =>
      'Уключыць рэжым распрацоўшчыка';

  @override
  String get advancedSettingDefaultSearchEngineLabel =>
      'Прадвызначаная пошукавая сістэма';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Выберыце, якая пошукавая сістэма выкарыстоўваецца прадвызначана пры пошуку вылучанага тэксту.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Убудаваныя пошукавыя сістэмы';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Уключайце або адключайце ўбудаваныя пошукавыя сістэмы. Уключаныя сістэмы з’яўляюцца ў кантэкстным меню паведамлення, калі вылучаны тэкст.';

  @override
  String get advancedSettingCustomSearchEnginesLabel =>
      'Уласныя пошукавыя сістэмы';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Дадавайце ўласныя пошукавыя сістэмы з уласным шаблонам URL. Выкарыстоўвайце \'$query\' як заменнік для тэксту пошуку.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Дадаць пошукавую сістэму';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Уключыце ніжэй хаця б адну пошукавую сістэму.';

  @override
  String get advancedSettingRemoveSearchEngineLabel =>
      'Выдаліць пошукавую сістэму';

  @override
  String get advancedSettingDefaultTranslatorLabel =>
      'Прадвызначаны перакладчык';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Выберыце, які перакладчык выкарыстоўваецца прадвызначана пры перакладзе вылучанага тэксту.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel =>
      'Убудаваныя перакладчыкі';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Уключайце або адключайце ўбудаваныя перакладчыкі. Уключаныя перакладчыкі з’яўляюцца ў кантэкстным меню паведамлення, калі вылучаны тэкст.';

  @override
  String get advancedSettingCustomTranslatorsLabel => 'Уласныя перакладчыкі';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Дадавайце ўласныя перакладчыкі з уласным шаблонам URL. Выкарыстоўвайце \'$query\' як заменнік для тэксту, які трэба перакласці.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Дадаць перакладчык';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Уключыце ніжэй хаця б адзін перакладчык.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Выдаліць перакладчык';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Прадвызначаны зваротны пошук выяў';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Выберыце, які сэрвіс зваротнага пошуку выяў выкарыстоўваецца прадвызначана пры пошуку выявы.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Убудаваны зваротны пошук выяў';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Уключайце або выключайце ўбудаваных пастаўшчыкоў зваротнага пошуку выяў. Уключаныя пастаўшчыкі з’яўляюцца ў параметрах выяў.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Уласны зваротны пошук выяў';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Дадавайце ўласных пастаўшчыкоў зваротнага пошуку выяў з уласным шаблонам URL. Выкарыстоўвайце \'$url\' як заменнік для URL выявы.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Дадаць зваротны пошук выяў';

  @override
  String searchProviderSearchWith(String engine) {
    return 'Шукаць праз $engine';
  }

  @override
  String searchProviderTranslateWith(String engine) {
    return 'Перакласці праз $engine';
  }

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Уключыце ніжэй хаця б адзін сэрвіс зваротнага пошуку выяў.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Выдаліць зваротны пошук выяў';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Дадаць пошукавую сістэму';

  @override
  String get advancedSettingEditSearchEngineTitle =>
      'Рэдагаваць пошукавую сістэму';

  @override
  String get advancedSettingAddTranslatorTitle =>
      'Дадаць пастаўшчыка перакладу';

  @override
  String get advancedSettingEditTranslatorTitle =>
      'Рэдагаваць пастаўшчыка перакладу';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Дадаць сістэму зваротнага пошуку выяў';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Рэдагаваць сістэму зваротнага пошуку выяў';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Імя';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'Шаблон URL';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'Мая пошукавая сістэма';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Мой перакладчык';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'Мой зваротны пошук выяў';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Выкарыстоўвайце \'$query\' там, дзе трэба ўставіць тэкст пошуку.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Выкарыстоўвайце \'$query\' там, дзе трэба ўставіць тэкст для перакладу.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Выкарыстоўвайце \'$url\' там, дзе трэба ўставіць URL выявы.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired => 'Увядзіце назву.';

  @override
  String get advancedSettingSearchProviderUrlRequired => 'Патрэбны шаблон URL.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'Шаблон URL мусіць змяшчаць заменнік \'$query\'.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'Шаблон URL мусіць змяшчаць заменнік \'$url\'.';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'Шаблон URL мусіць быць правільным URL.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Дадаць';

  @override
  String get advancedSettingEditSearchProviderAction => 'Рэдагаваць';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Прыбраць';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'Вы сапраўды хочаце выдаліць $engineName?';
  }

  @override
  String get userSettingsNavApplications => 'Праграмы';

  @override
  String get userSettingsNavAppLogs => 'Журналы праграмы';

  @override
  String get userSettingsNavFluxerAppPrivacyPolicy =>
      'Палітыка прыватнасці праграмы Fluxer';

  @override
  String get userSettingsTitle => 'Налады';

  @override
  String get userSettingsCopyAppInfo => 'Скапіраваць звесткі пра праграму';

  @override
  String get userSettingsNavDeveloperTools => 'Інструменты распрацоўшчыка';

  @override
  String get userSettingsNavLimitsConfig => 'Канфігурацыя лімітаў';

  @override
  String get userSettingsNavFeatureFlags => 'Сцягі функцый';

  @override
  String get userSettingsNavHelp => 'Даведка і падтрымка';

  @override
  String get userSettingsNavWhatsNew => 'Што новага';

  @override
  String get userSettingsJoinFluxerLabs => 'Далучыцца да Fluxer Labs';

  @override
  String get userSettingsGiveFeedback => 'Пакінуць водгук';

  @override
  String get userSettingsNavAppLicenses => 'Ліцэнзіі праграмы';

  @override
  String get userSettingsAppLicensesDescription =>
      'Праграмнае забеспячэнне з адкрытым кодам, якое выкарыстоўвае гэта праграма. Праграма створана на Flutter.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'Не ўдалося загрузіць ліцэнзіі праграмы.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ліцэнзіі',
      many: '$count ліцэнзій',
      few: '$count ліцэнзіі',
      one: '$count ліцэнзія',
    );
    return '$_temp0';
  }

  @override
  String get userSettingsNavLogOut => 'Выйсці';

  @override
  String get userSettingsLogOutConfirmTitle => 'Выйсці?';

  @override
  String get userSettingsLogOutConfirmDescription =>
      'Увайсці зноў можна ў любы час.';

  @override
  String get quickSwitcherTabSearch => 'Пошук';

  @override
  String get quickSwitcherTabFriends => 'Сябры';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Шукаць каналы, людзей або суполкі';

  @override
  String get quickSwitcherSearchFriends => 'Пошук сяброў';

  @override
  String get quickSwitcherNoMatchesFound => 'Нічога не знойдзена';

  @override
  String get quickSwitcherEmptyHint =>
      'Паспрабуйце іншую назву або выкарыстайце прэфіксы @ / # / ! / *, каб адфільтраваць вынікі.';

  @override
  String get quickSwitcherTitle => 'Хуткі пераключальнік';

  @override
  String quickSwitcherFooterPrefixHint(
    String peoplePrefix,
    String textChannelPrefix,
    String voiceChannelPrefix,
    String communityPrefix,
  ) {
    return 'Пачынайце пошук з $peoplePrefix $textChannelPrefix $voiceChannelPrefix $communityPrefix, каб звузіць вынікі.';
  }

  @override
  String get discoverySidebarApps => 'Праграмы';

  @override
  String get discoverySidebarThemes => 'Тэмы';

  @override
  String get discoverySidebarComingSoon => 'Хутка будзе';

  @override
  String discoverySidebarComingSoonItem(String itemLabel) {
    return '$itemLabel, хутка';
  }

  @override
  String get quickSwitcherSectionPeople => 'Людзі';

  @override
  String get quickSwitcherSectionGroupMessages => 'Групавыя чаты';

  @override
  String get quickSwitcherSectionTextChannels => 'Тэкставыя каналы';

  @override
  String get quickSwitcherSectionThreads => 'Галіны';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Галасавыя каналы';

  @override
  String get quickSwitcherSectionCommunities => 'Суполкі';

  @override
  String get quickSwitcherSectionSettings => 'Налады';

  @override
  String get quickSwitcherHomeLabel => 'Галоўная';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Асабістыя паведамленні';

  @override
  String get quickSwitcherFavoritesLabel => 'Абранае';

  @override
  String get quickSwitcherUserSettingsLabel => 'Налады карыстальніка';

  @override
  String get quickSwitcherNotificationsLabel => 'Апавяшчэнні';

  @override
  String get quickSwitcherBookmarksLabel => 'Закладкі';

  @override
  String get savedMessagesEmptyTitle => 'Няма закладак';

  @override
  String get savedMessagesEmptyBody =>
      'Дадавайце паведамленні ў закладкі, каб захаваць іх на потым.';

  @override
  String get savedMessagesEndBody => 'Тут больш нічога няма.';

  @override
  String get savedMessagesRemoveTooltip => 'Прыбраць з закладак';

  @override
  String get savedMessagesAddedToast => 'Дададзена ў закладкі';

  @override
  String get savedMessagesRemovedToast => 'Прыбрана з закладак';

  @override
  String get quickSwitcherMentionsLabel => 'Згадванні';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Пакуль няма сяброў';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Дадайце сябра, каб пачаць.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Няма сяброў, якія адпавядаюць гэтаму пошуку';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Паспрабуйце іншае імя.';

  @override
  String get quickSwitcherSearchAliasUser => 'Карыстальнік';

  @override
  String get quickSwitcherSearchAliasYou => 'Вы';

  @override
  String get quickSwitcherSearchAliasDm => 'Асабісты чат';

  @override
  String get quickSwitcherSearchAliasDms => 'АЧ';

  @override
  String get quickSwitcherSearchAliasMessages => 'Паведамленні';

  @override
  String get quickSwitcherSearchAliasFav => 'Абр';

  @override
  String get quickSwitcherSearchAliasStarred => 'Абранае';

  @override
  String get quickSwitcherSearchAliasInbox => 'Уваходныя';

  @override
  String get quickSwitcherSearchAliasSaved => 'Захаванае';

  @override
  String get uiClose => 'Закрыць';

  @override
  String get chatJumpToBottom => 'Перайсці ўніз';

  @override
  String get chatUnreadDividerNew => 'Новы';

  @override
  String get uiConfirm => 'Пацвердзіць';

  @override
  String get uiUnderstood => 'Зразумела';

  @override
  String get uiLoading => 'Загрузка';

  @override
  String get uiSearch => 'Пошук';

  @override
  String get uiStartCall => 'Пачаць выклік';

  @override
  String get uiStartVideoCall => 'Пачаць відэавыклік';

  @override
  String get uiPlay => 'Прайграць';

  @override
  String get uiPause => 'Паўза';

  @override
  String get uiDownload => 'Спампаваць';

  @override
  String get uiMoreActions => 'Іншыя дзеянні';

  @override
  String get uiUnsavedChanges => 'Незахаваныя змены';

  @override
  String get uiReset => 'Скінуць';

  @override
  String get uiOpenColorPicker => 'Адкрыць выбар колеру';

  @override
  String get uiSelectPlaceholder => 'Выбраць';

  @override
  String get uiSearchPlaceholder => 'Пошук';

  @override
  String get uiNoOptionsFound => 'Варыянтаў не знойдзена';

  @override
  String get uiDismissNotification => 'Закрыць апавяшчэнне';

  @override
  String get uiColorPickerTitle => 'Выбар колеру';

  @override
  String get mentionConfirmTitle => 'Згадаць усіх?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Апавяшчэнне атрымаюць удзельнікі: $count. Працягнуць?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Апавяшчэнне атрымаюць удзельнікі ў сетцы: $count. Працягнуць?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'Апавяшчэнне атрымаюць удзельнікі з роляй $roleName: $count. Працягнуць?';
  }

  @override
  String get mentionConfirmButton => 'Згадаць';

  @override
  String get composerEmojiUnavailable =>
      'Тут нельга выкарыстоўваць гэта эмоджы.';

  @override
  String get instanceUrlLabel => 'URL экзэмпляра';

  @override
  String get instanceUrlPlaceholder => 'fluxer.com';

  @override
  String get instanceUrlHelper =>
      'Для афіцыйнага экзэмпляра ўвядзіце fluxer.com, а для ўласнага — дакладны URL экзэмпляра.';

  @override
  String get resetToDefaultInstance => 'Вярнуць Fluxer';

  @override
  String get instanceConnect => 'Падключыць';

  @override
  String get instanceConnecting => 'Падключэнне…';

  @override
  String get instanceConnectFailed => 'Не ўдалося падключыцца да экзэмпляра';

  @override
  String instanceConnectFailedDomain(String domain) {
    return 'Не ўдалося падключыцца да $domain. Паспрабуйце яшчэ раз.';
  }

  @override
  String get instanceInvalidDiscoveryResponse =>
      'Не ўдалося прачытаць канфігурацыю гэтага экзэмпляра. Праверце адрас і паспрабуйце яшчэ раз.';

  @override
  String instanceOutdatedForClient(String domain) {
    return 'Гэты экзэмпляр састарэў для гэтай праграмы. Папрасіце адміністратара $domain абнавіць Fluxer.';
  }

  @override
  String instanceRequiresNewerClient(String domain) {
    return 'На $domain працуе навейшая версія Fluxer, чым гэта праграма. Абнавіце праграму і паспрабуйце яшчэ раз.';
  }

  @override
  String instanceInsecureConnection(String domain) {
    return '$domain не выкарыстоўвае абароненае злучэнне (https). Па http Fluxer падключаецца толькі да экзэмпляраў у вашай лакальнай сетцы.';
  }

  @override
  String get instanceCompatibilityTitle => 'Гэты экзэмпляр нельга выкарыстаць';

  @override
  String get instanceCompatibilityRetry => 'Паспрабаваць яшчэ раз';

  @override
  String get instanceCompatibilityUpdateApp => 'Абнавіць праграму';

  @override
  String get instanceCompatibilityStatusPagePrompt =>
      'Сачыце за навінамі на старонцы стану.';

  @override
  String get instanceCompatibilityStatusPageLink => 'старонка стану';

  @override
  String get recentInstances => 'Нядаўнія экзэмпляры';

  @override
  String removeRecentInstance(String domain) {
    return 'Выдаліць $domain з нядаўніх экзэмпляраў';
  }

  @override
  String get instanceSheetTitle => 'Падключыцца да экзэмпляра';

  @override
  String get changeInstance => 'Змяніць';

  @override
  String get instanceConnectionRequired =>
      'Каб увайсці, падключыцеся да экзэмпляра';

  @override
  String get guildNavbarDirectMessages => 'Асабістыя паведамленні';

  @override
  String get guildNavbarExploreDiscoverableCommunities => 'Шукаць суполкі';

  @override
  String get discoveryExplore => 'Агляд';

  @override
  String get discoveryExplorePublicCommunities => 'Агляд публічных суполак';

  @override
  String get discoveryListingSubheading =>
      'Хочаце, каб ваша суполка была тут? Падайце заяўку, калі суполка адпавядае патрабаванням у раздзеле «Налады суполкі > Агляд».';

  @override
  String get discoverySearchCommunities => 'Пошук суполак';

  @override
  String get discoveryFilterByLanguage => 'Фільтраваць па мове';

  @override
  String discoveryFilteringByLanguage(String language) {
    return 'Filtering by $language';
  }

  @override
  String discoverySearchResultsFor(String query) {
    return 'Search results for “$query”';
  }

  @override
  String get discoveryAllLanguages => 'Усе мовы';

  @override
  String get discoveryAllCategories => 'Усе';

  @override
  String get discoveryCategoryGaming => 'Гульні';

  @override
  String get discoveryCategoryMusic => 'Музыка';

  @override
  String get discoveryCategoryEntertainment => 'Забавы';

  @override
  String get discoveryCategoryEducation => 'Адукацыя';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Навука і тэхналогіі';

  @override
  String get discoveryCategoryContentCreator => 'Стваральнік кантэнту';

  @override
  String get discoveryCategoryAnimeAndManga => 'Анімэ і манга';

  @override
  String get discoveryCategoryMoviesAndTv => 'Фільмы і ТБ';

  @override
  String get discoveryCategoryOther => 'Іншае';

  @override
  String get discoveryNoCommunitiesMatch => 'Няма адпаведных суполак.';

  @override
  String get discoveryJoinCommunity => 'Далучыцца да суполкі';

  @override
  String get discoveryOpenCommunity => 'Open community';

  @override
  String get discoveryPublicCommunity => 'Public community';

  @override
  String discoveryPreviewCommunity(String communityName) {
    return 'Preview $communityName';
  }

  @override
  String get discoveryJoined => 'Вы далучыліся';

  @override
  String discoveryOnlineCount(String count) {
    return '$count у сетцы';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString удзельніка',
      many: '$countString удзельнікаў',
      few: '$countString удзельнікі',
      one: '# удзельнік',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Няма апісання.';

  @override
  String get discoveryCommunities => 'Суполкі';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Не ўдалося далучыцца да гэтай суполкі';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Штосьці пайшло не так. Паспрабуйце яшчэ раз праз хвіліну.';

  @override
  String get discoveryJoinErrorFullTitle => 'Гэта суполка запоўнена';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Суполка дасягнула ліміту ўдзельнікаў, таму зараз далучыцца нельга.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle => 'Вы дасягнулі ліміту суполак';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Вы ўжо ў максімальнай колькасці суполак. Пакіньце адну і паспрабуйце яшчэ раз.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Вы не можаце далучыцца да гэтай суполкі';

  @override
  String get discoveryJoinErrorBannedMessage => 'У гэтай суполцы ў вас бан.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Гэта суполка больш недаступная';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Магчыма, суполка пакінула раздзел «Агляд» або адключыла новыя далучэнні. Абнавіце старонку, і яна больш не будзе паказвацца.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Вы занадта спяшаецеся';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Пачакайце крыху і паспрабуйце яшчэ раз.';

  @override
  String get guildNavbarAddCommunity => 'Дадаць суполку';

  @override
  String get guildNavbarHelp => 'Даведка';

  @override
  String get scrollIndicatorNew => 'Новы';

  @override
  String get scrollIndicatorNewMessages => 'Новыя паведамленні';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Згарнуць $folderName';
  }

  @override
  String get guildNavbarGuildSelected => 'выбрана';

  @override
  String get guildNavbarGuildUnread => 'непрачытанае';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count згадвання',
      many: '$count згадванняў',
      few: '$count згадванні',
      one: '$count згадванне',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'заглушана';

  @override
  String get authShowPassword => 'Паказаць пароль';

  @override
  String get authHidePassword => 'Схаваць пароль';

  @override
  String get authCheckStillWorking => 'Яшчэ працуем…';

  @override
  String get authVerificationFailed =>
      'Не ўдалося завяршыць праверку. Паспрабуйце яшчэ раз.';

  @override
  String get chatLoadingMessages => 'Загрузка паведамленняў';

  @override
  String get friendsMessageFriend => 'Паведамленне';

  @override
  String get friendsFriendActions => 'Дзеянні з сябрам';

  @override
  String get friendsAcceptRequest => 'Прыняць запыт у сябры';

  @override
  String get friendsDeclineRequest => 'Адхіліць запыт у сябры';

  @override
  String get friendsCancelRequest => 'Скасаваць запыт у сябры';

  @override
  String get friendsOpenInbox => 'Уваходныя';

  @override
  String get friendsPageTitle => 'Мае сябры';

  @override
  String get friendsActiveNowTitle => 'Зараз у галасавых каналах';

  @override
  String get friendsActiveNowEmptyTitle => 'Нікога няма ў галасавых каналах';

  @override
  String get friendsActiveNowEmptyBody =>
      'Тут будуць паказвацца сябры, якія далучацца да галасавога канала.';

  @override
  String get friendsTabOnline => 'У сетцы';

  @override
  String get friendsTabAll => 'Усе';

  @override
  String get friendsTabPending => 'Чакае';

  @override
  String get friendsTabBlocked => 'Заблакіравана';

  @override
  String get friendsSearchOnline => 'Шукаць сяброў у сетцы';

  @override
  String get friendsSearchAll => 'Пошук сяброў';

  @override
  String get friendsSearchPending => 'Пошук запытаў, якія чакаюць адказу';

  @override
  String get friendsSearchBlocked => 'Пошук заблакіраваных карыстальнікаў';

  @override
  String get friendsEmptySearchTitle =>
      'Няма сяброў, якія адпавядаюць гэтаму пошуку';

  @override
  String get friendsEmptySearchBody =>
      'Паспрабуйце іншае імя або праверце правапіс.';

  @override
  String get friendsEmptyOnlineTitle => 'Няма сяброў у сетцы';

  @override
  String get friendsEmptyOnlineBody =>
      'Як толькі яны з’явяцца ў сетцы, вы ўбачыце іх тут.';

  @override
  String get friendsEmptyAllTitle => 'Пакуль няма сяброў';

  @override
  String get friendsEmptyAllBody =>
      'Дадайце сябра па імені карыстальніка і тэгу.';

  @override
  String get friendsEmptyPendingTitle => 'Няма запытаў, якія чакаюць адказу';

  @override
  String get friendsEmptyPendingBody =>
      'Тут паказваюцца запыты ў сябры, якія чакаюць адказу.';

  @override
  String get friendsEmptyBlockedBody => 'Вы нікога не заблакіравалі.';

  @override
  String get friendsOutgoingStatus => 'Выходны запыт у сябры';

  @override
  String get friendsBlockedStatus => 'Заблакіравана';

  @override
  String get profileRemoveFriend => 'Выдаліць з сяброў';

  @override
  String get profileUnblockUser => 'Разблакіраваць карыстальніка';

  @override
  String get profileAcceptFriendRequest => 'Прыняць запыт у сябры';

  @override
  String get profileCancelFriendRequest => 'Скасаваць запыт у сябры';

  @override
  String get profileSendFriendRequest => 'Дадаць у сябры';

  @override
  String get accountOverflowMenu => 'Параметры ўліковага запісу';

  @override
  String get navHome => 'Галоўная';

  @override
  String get navNotifications => 'Апавяшчэнні';

  @override
  String get navYou => 'Вы';

  @override
  String get guildFolderSettingsTitle => 'Налады папкі';

  @override
  String get guildFolderNameLabel => 'Назва папкі';

  @override
  String get guildFolderColorLabel => 'Колер папкі';

  @override
  String get guildFolderShowIconWhenCollapsed =>
      'Паказваць значок, калі згорнута';

  @override
  String get guildFolderIconLabel => 'Значок папкі';

  @override
  String get guildFolderDelete => 'Выдаліць папку';

  @override
  String get guildFolderIconFolder => 'Папка';

  @override
  String get guildFolderIconStar => 'Зорка';

  @override
  String get guildFolderIconHeart => 'Сэрца';

  @override
  String get guildFolderIconBookmark => 'Закладка';

  @override
  String get guildFolderIconGameController => 'Гульнявы кантролер';

  @override
  String get guildFolderIconShield => 'Шчыт';

  @override
  String get guildFolderIconMusicNote => 'Нота';

  @override
  String get guildFolderMarkAsRead => 'Пазначыць папку як прачытаную';

  @override
  String get guildBulkMuteCommunities => 'Заглушыць суполкі';

  @override
  String get guildBulkUnmuteCommunities => 'Уключыць апавяшчэнні суполак';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Налады апавяшчэнняў суполкі';

  @override
  String get guildBulkCommunityPrivacySettings => 'Налады прыватнасці суполкі';

  @override
  String get guildBulkAllowEveryoneAndHere => 'Дазволіць @everyone і @here';

  @override
  String get guildBulkAllowRoleMentions => 'Дазволіць згадванні роляў';

  @override
  String get guildBulkEnableMobilePush => 'Уключыць мабільныя push-апавяшчэнні';

  @override
  String get guildBulkDisableMobilePush =>
      'Адключыць мабільныя push-апавяшчэнні';

  @override
  String get guildBulkAllowDirectMessages => 'Дазволіць асабістыя паведамленні';

  @override
  String get guildBulkBlockDirectMessages =>
      'Блакіраваць асабістыя паведамленні';

  @override
  String get guildBulkAllowBotDirectMessages =>
      'Дазволіць асабістыя паведамленні ад ботаў';

  @override
  String get guildBulkBlockBotDirectMessages =>
      'Блакіраваць асабістыя паведамленні ад ботаў';

  @override
  String get guildNavbarGroupDm => 'Групавы чат';

  @override
  String get guildNavbarCreateChannel => 'Стварыць канал';

  @override
  String get guildNavbarChannelType => 'Тып канала';

  @override
  String get guildNavbarTextChannel => 'Тэкст';

  @override
  String get guildNavbarTextChannelDescription =>
      'Адпраўляйце паведамленні, выявы, GIF і эмоджы';

  @override
  String get guildNavbarVoiceChannel => 'Галасавы';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Размаўляйце голасам, з відэа і дэманстрацыяй экрана';

  @override
  String get guildNavbarLinkChannel => 'Спасылка';

  @override
  String get guildNavbarLinkChannelDescription => 'Спасылка на знешні сайт';

  @override
  String get guildNavbarNameLabel => 'Імя';

  @override
  String get guildNavbarNewChannelHint => 'новы-канал';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Выбар тыпу канала';

  @override
  String get guildNavbarPrivateChannel => 'Прыватны канал';

  @override
  String get guildNavbarPrivateChannelDescription =>
      'Праглядаць гэты канал змогуць толькі выбраныя ўдзельнікі і ролі.';

  @override
  String get guildNavbarAddMembersOrRoles => 'Дадаць удзельнікаў або ролі';

  @override
  String get guildNavbarAddMembersOrRolesHint => 'Шукаць удзельнікаў або ролі';

  @override
  String get guildNavbarCreateCategory => 'Стварыць катэгорыю';

  @override
  String get guildNavbarNewCategoryHint => 'Новая катэгорыя';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Запрасіце сяброў у $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Атрымальнікі патрапяць у #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Пошук сяброў';

  @override
  String get guildNavbarNoFriendsYet => 'Пакуль няма сяброў';

  @override
  String get guildNavbarNoResults => 'Няма вынікаў';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Або адпраўце сябру спасылку-запрашэнне:';

  @override
  String get guildNavbarInviteLink => 'Спасылка-запрашэнне';

  @override
  String get guildNavbarCopy => 'Скапіраваць';

  @override
  String get guildNavbarCopied => 'Скапіравана!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Тэрмін дзеяння вашай спасылкі-запрашэння скончыцца праз 7 дзён.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Гэта спасылка-запрашэнне бестэрміновая.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Тэрмін дзеяння вашай спасылкі-запрашэння скончыцца праз $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Рэдагаваць спасылку-запрашэнне';

  @override
  String get guildNavbarInviteLinkSettings => 'Налады спасылкі-запрашэння';

  @override
  String get guildNavbarExpireAfter => 'Тэрмін дзеяння';

  @override
  String get guildNavbarMaxUses => 'Максімальная колькасць выкарыстанняў';

  @override
  String get guildNavbarGrantTemporaryMembership => 'Даць часовае членства';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Удзельнікі, якім не прызначылі ролю, будуць выдалены, калі выйдуць з сеткі';

  @override
  String get guildNavbarCreateNewLink => 'Стварыць новую спасылку';

  @override
  String get guildNavbarSent => 'Адпраўлена';

  @override
  String get guildNavbarInvite => 'Запрасіць';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Пакінуць суполку';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Вы сапраўды хочаце пакінуць гэту суполку? Вы больш не зможаце бачыць яе паведамленні.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Пакінуць суполку';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Выдаліць вашы паведамленні ў гэтай суполцы?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Назаўсёды выдаліць усе паведамленні, якія вы адправілі тут, ва ўсіх каналах. Гэта нельга адмяніць.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Выдаліць мае паведамленні';

  @override
  String get guildNavbarDeletedYourMessages => 'Вашы паведамленні выдалены';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Не ўдалося выдаліць вашы паведамленні';

  @override
  String get guildNavbarRemoveOverride => 'Прыбраць перавызначэнне';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Заглушана да $formattedDate';
  }

  @override
  String get channelMutedHint => 'Заглушана';

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'Даступна толькі супрацоўнікам $productName';
  }

  @override
  String get guildNavbarInvitesPaused =>
      'Запрашэнні ў гэту суполку зараз прыпынены';

  @override
  String get guildNavbarInvitesPausedRaid =>
      'Запрашэнні прыпынены праз падазрэнне на рэйд';

  @override
  String get guildNavbarDurationNever => 'ніколі';

  @override
  String get guildNavbarDuration30Minutes => '30 хвілін';

  @override
  String get guildNavbarDuration1Hour => '1 гадзіна';

  @override
  String get guildNavbarDuration6Hours => '6 гадзін';

  @override
  String get guildNavbarDuration12Hours => '12 гадзін';

  @override
  String get guildNavbarDuration1Day => '1 дзень';

  @override
  String get guildNavbarDuration7Days => '7 дзён';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count с';
  }

  @override
  String get guildNavbarNever => 'Ніколі';

  @override
  String get guildNavbarNoLimit => 'Без абмежаванняў';

  @override
  String get guildNavbarOneUse => '1 выкарыстанне';

  @override
  String guildNavbarUses(int count) {
    return 'Выкарыстанняў: $count';
  }

  @override
  String get guildMenuMarkAsRead => 'Пазначыць як прачытанае';

  @override
  String get guildMenuInviteMembers => 'Запрасіць удзельнікаў';

  @override
  String get guildMenuCommunitySettings => 'Налады суполкі';

  @override
  String get guildMenuEditCommunityProfile => 'Рэдагаваць профіль у суполцы';

  @override
  String get guildMenuUnmuteCommunity => 'Уключыць апавяшчэнні суполкі';

  @override
  String get guildMenuMuteCommunity => 'Заглушыць суполку';

  @override
  String get guildMenuHideMutedChannels => 'Схаваць заглушаныя каналы';

  @override
  String get guildMenuDebugCommunity => 'Адладка суполкі';

  @override
  String get guildMenuCopyCommunityId => 'Скапіраваць ID суполкі';

  @override
  String get guildMenuReportCommunity => 'Паскардзіцца на суполку';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Да $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Агульны';

  @override
  String get guildMenuSettingsRoles => 'Ролі і дазволы';

  @override
  String get guildMenuSettingsEmoji => 'Эмоджы';

  @override
  String get guildMenuSettingsStickers => 'Стыкеры';

  @override
  String get guildMenuSettingsSafetyModeration => 'Бяспека і мадэрацыя';

  @override
  String get guildMenuSettingsActivityLog => 'Журнал дзеянняў';

  @override
  String get guildMenuSettingsWebhooks => 'Вэб-хукі';

  @override
  String get guildMenuSettingsDiscovery => 'Агляд';

  @override
  String get guildMenuSettingsMembers => 'Удзельнікі';

  @override
  String get guildMenuSettingsInviteLinks => 'Запрашэнні';

  @override
  String get guildMenuSettingsBans => 'Баны';

  @override
  String get guildMenuSettingsChannels => 'Каналы';

  @override
  String get guildSettingsNoPermission =>
      'У вас няма дазволу праглядаць гэту ўкладку налад.';

  @override
  String get guildSettingsOverviewIconTitle => 'Значок';

  @override
  String get guildSettingsOverviewBannerTitle => 'Банер';

  @override
  String get guildSettingsOverviewNameTitle => 'Імя';

  @override
  String get guildSettingsOverviewNameHint => 'Мая выдатная суполка';

  @override
  String get guildSettingsCreateRole => 'Стварыць ролю';

  @override
  String get guildSettingsRolesListTitle => 'Ролі';

  @override
  String get guildSettingsRolesNewRole => 'Новая роля';

  @override
  String get guildSettingsRolesDeleteRole => 'Выдаліць ролю';

  @override
  String get guildSettingsRolesBackToRoles => 'Назад да роляў';

  @override
  String get guildSettingsBackToSettings => 'Назад да налад';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Рэдагаваць «$name»';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Наладзьце параметры і дазволы ролі';

  @override
  String get guildSettingsRolesDisplaySection => 'Дысплэй';

  @override
  String get guildSettingsRolesRoleName => 'Назва ролі';

  @override
  String get guildSettingsRolesRoleColor => 'Колер ролі';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Увядзіце колер (hex, rgb(), hsl() або назву) або выберыце колер на палітры.';

  @override
  String get guildSettingsRolesShowSeparately => 'Паказваць гэту ролю асобна';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Паказвае ўдзельнікаў з гэтай роляй у асобным раздзеле спіса ўдзельнікаў.';

  @override
  String get guildSettingsRolesAllowMentions =>
      'Дазволіць згадванні гэтай ролі';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'Удзельнікі з дазволам «$permission» заўсёды могуць згадваць ролі незалежна ад гэтай налады.';
  }

  @override
  String get guildSettingsRolesRoleIcon => 'Значок ролі';

  @override
  String get guildSettingsRolesRoleIconHelper =>
      'Загрузіце выяву або выберыце эмоджы. Удзельнікі атрымліваюць значок сваёй найвышэйшай ролі, у якой ён ёсць.';

  @override
  String guildSettingsRolesRoleIconUploadHint(
    String formats,
    String minimumSize,
    String maxSize,
  ) {
    return '$formats. Не менш за $minimumSize, да $maxSize.';
  }

  @override
  String get guildSettingsRolesRoleIconUploadAccessibility =>
      'Загрузіць значок ролі';

  @override
  String guildSettingsRolesRoleIconCurrentEmojiAccessibility(String emojiName) {
    return 'Цяперашні значок ролі, $emojiName';
  }

  @override
  String get guildSettingsRolesRoleIconCurrentImageAccessibility =>
      'Цяперашні значок ролі, загружаная выява';

  @override
  String get guildSettingsRolesRoleIconChooseEmoji => 'Выбраць эмоджы';

  @override
  String get guildSettingsRolesRoleIconUploadImage => 'Загрузіць выяву';

  @override
  String get guildSettingsRolesRoleIconRemove => 'Выдаліць значок';

  @override
  String get guildSettingsRolesRoleIconAnimatedError =>
      'Аніміраваныя значкі не падтрымліваюцца. Выкарыстайце статычную выяву.';

  @override
  String guildSettingsRolesRoleIconUnsupportedTypeError(String formats) {
    return 'Гэты тып файла не падтрымліваецца. Падтрымліваюцца: $formats.';
  }

  @override
  String get guildSettingsRolesRoleIconLoadError =>
      'Не ўдалося загрузіць гэту выяву. Паспрабуйце іншую.';

  @override
  String get guildSettingsRolesRoleIconUsagePreviewMessage =>
      'Так выглядаюць паведамленні';

  @override
  String roleIconAccessibilityLabel(String roleName) {
    return 'Значок ролі, $roleName';
  }

  @override
  String get roleIconCropTitle => 'Абрэзаць значок ролі';

  @override
  String get roleIconCropSave => 'Захаваць значок';

  @override
  String get roleIconCropSkip => 'Прапусціць абрэзку';

  @override
  String get roleIconCropFailed =>
      'Не ўдалося абрэзаць значок. Паспрабуйце яшчэ раз.';

  @override
  String roleIconCropDescription(int minimumWidth, int minimumHeight) {
    return 'Перацягвайце, каб змяніць размяшчэнне значка ролі, і выкарыстоўвайце кола пракруткі або жэст звядзення пальцаў для маштабавання. Рэкамендаваны мінімальны памер — $minimumWidth×$minimumHeight пкс.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Выкарыстоўвайце гэту кнопку, каб хутка ачысціць усе дазволы.';

  @override
  String get guildSettingsRolesClearPermissions => 'Ачысціць дазволы';

  @override
  String get guildSettingsRolesPermissionsSection => 'Дазволы';

  @override
  String get guildSettingsRolesSearchPermissions => 'Пошук дазволаў';

  @override
  String get guildSettingsRolesDenseLayout => 'Шчыльны макет';

  @override
  String get guildSettingsRolesComfyLayout => 'Зручны макет';

  @override
  String get guildSettingsRolesSingleColumn => 'Адзін слупок';

  @override
  String get guildSettingsRolesTwoColumns => 'Два слупкі';

  @override
  String get guildSettingsRolesNoPermissionsFound => 'Дазволы не знойдзены';

  @override
  String get guildSettingsRolesHoistOrder => 'Парадак адлюстравання';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Скінуць да прадвызначанага';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Перацягвайце ролі, каб змяніць парадак, у якім яны паказваюцца ў спісе ўдзельнікаў.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Няма роляў, якія паказваюцца асобна. Уключыце для ролі «Паказваць гэту ролю асобна», каб яна з’явілася тут.';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Каб рэдагаваць гэтыя дазволы, патрэбны дазвол «$permission»';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'Нельга рэдагаваць ролю, якая на адным узроўні з вашай найвышэйшай роляй або вышэй за яе';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'Нельга даць дазвол, якога ў вас няма';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'Нельга прыбраць гэты дазвол, бо тады вы страціце яго самі';

  @override
  String get guildSettingsRolesUpdatedSuccess => 'Ролі паспяхова абноўлены';

  @override
  String get guildSettingsRolesCreatedSuccess => 'Роля паспяхова створана';

  @override
  String get guildSettingsRolesDeletedSuccess => 'Роля паспяхова выдалена';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'Парадак адлюстравання скінуты да прадвызначанага';

  @override
  String get guildSettingsRolesNameRequiredTitle => 'Патрэбна назва ролі';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Перш чым захаваць, дайце ролі назву.';

  @override
  String get guildSettingsRolesCreateFailedTitle => 'Не ўдалося стварыць ролю';

  @override
  String get guildSettingsRolesUpdateFailedTitle => 'Не ўдалося абнавіць ролі';

  @override
  String get guildSettingsRolesDeleteFailedTitle => 'Не ўдалося выдаліць ролю';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return 'Не ўдалося выдаліць «$name». Паспрабуйце яшчэ раз.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'Не ўдалося скінуць парадак адлюстравання';

  @override
  String get guildSettingsRolesTryAgainInAMoment =>
      'Паспрабуйце яшчэ раз праз хвіліну.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'Вы сапраўды хочаце выдаліць ролю $name? Усе ўдзельнікі з гэтай роляй страцяць яе.';
  }

  @override
  String get permissionCategoryCommunityWide => 'Для ўсёй суполкі';

  @override
  String get permissionCategoryMessagesMedia => 'Паведамленні і медыя';

  @override
  String get permissionCategoryModeration => 'Мадэрацыя';

  @override
  String get permissionCategoryChannelAccess => 'Доступ да канала';

  @override
  String get permissionCategoryChannelManagement => 'Кіраванне каналамі';

  @override
  String get permissionCategoryAudioVideo => 'Аўдыя і відэа';

  @override
  String get permissionAdministrator => 'Адміністратар';

  @override
  String get permissionAdministratorDescription =>
      'Дае ўсе дазволы і абыходзіць абмежаванні каналаў. Вельмі небяспечна.';

  @override
  String get permissionViewActivityLog => 'Праглядаць журнал дзеянняў';

  @override
  String get permissionViewActivityLogDescription =>
      'Праглядаць журнал дзеянняў суполкі са зменамі і дзеяннямі мадэрацыі.';

  @override
  String get permissionManageCommunity => 'Кіраваць суполкай';

  @override
  String get permissionManageCommunityDescription =>
      'Рэдагуйце глабальныя налады, такія як назва, апісанне і значок.';

  @override
  String get permissionManageRoles => 'Кіраваць ролямі';

  @override
  String get permissionManageRolesDescription =>
      'Ствараць, рэдагаваць або выдаляць ролі, ніжэйшыя за вашу найвышэйшую ролю. Таксама дазваляе рэдагаваць перавызначэнні дазволаў каналаў.';

  @override
  String get permissionManageChannels => 'Кіраваць каналамі';

  @override
  String get permissionManageChannel => 'Кіраваць каналам';

  @override
  String get permissionManageChannelDescription =>
      'Пераймяноўваць канал і змяняць яго налады.';

  @override
  String get permissionManagePermissions => 'Кіраваць дазволамі';

  @override
  String get permissionManagePermissionsDescription =>
      'Рэдагаваць перавызначэнні дазволаў для роляў і ўдзельнікаў у гэтым канале.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Ствараць, рэдагаваць або выдаляць вэб-хукі гэтага канала.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Бачыць спіс удзельнікаў гэтага канала.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Кіраваць спасылкамі-запрашэннямі ў гэты канал.';

  @override
  String get permissionOverwriteDeny => 'Забараніць';

  @override
  String get permissionOverwriteInherit => 'Нейтральна (успадкаваць)';

  @override
  String get permissionOverwriteAllow => 'Дазволіць';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Выкарыстоўвайце гэтыя кнопкі, каб хутка задаць усе дазволы.';

  @override
  String get permissionManageChannelsDescription =>
      'Ствараць, рэдагаваць або выдаляць каналы і катэгорыі.';

  @override
  String get permissionKickMembers => 'Выганяць удзельнікаў';

  @override
  String get permissionBanMembers => 'Баніць удзельнікаў';

  @override
  String get permissionCreateInviteLinks => 'Ствараць спасылкі-запрашэнні';

  @override
  String get permissionChangeOwnNickname => 'Змяніць уласны псеўданім';

  @override
  String get permissionChangeOwnNicknameDescription =>
      'Змяняць свой псеўданім.';

  @override
  String get permissionManageNicknames => 'Кіраваць псеўданімамі';

  @override
  String get permissionManageNicknamesDescription =>
      'Змяняць псеўданімы іншых удзельнікаў.';

  @override
  String get permissionCreateEmojiStickers => 'Ствараць эмоджы і стыкеры';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Загружаць новыя эмоджы і стыкеры і кіраваць уласнымі.';

  @override
  String get permissionManageEmojiStickers => 'Кіраваць эмоджы і стыкерамі';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Рэдагаваць або выдаляць эмоджы і стыкеры, створаныя іншымі ўдзельнікамі.';

  @override
  String get permissionManageWebhooks => 'Кіраваць вэб-хукамі';

  @override
  String get permissionManageWebhooksDescription =>
      'Ствараць, рэдагаваць або выдаляць вэб-хукі.';

  @override
  String get permissionSendMessages => 'Адпраўляць паведамленні';

  @override
  String get permissionSendTtsMessages => 'Адпраўляць TTS-паведамленні';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Адпраўляць паведамленні з агучваннем тэксту.';

  @override
  String get permissionManageMessages => 'Кіраваць паведамленнямі';

  @override
  String get permissionManageMessagesDescription =>
      'Выдаляць паведамленні іншых удзельнікаў. Замацаванне наладжваецца асобна.';

  @override
  String get permissionPinMessages => 'Замацоўваць паведамленні';

  @override
  String get permissionEmbedLinks => 'Убудоўваць спасылкі';

  @override
  String get permissionAttachFiles => 'Далучаць файлы';

  @override
  String get permissionMentionEveryone =>
      'Выкарыстоўваць @everyone/@here і @роля';

  @override
  String get permissionMentionEveryoneDescription =>
      'Згадваць усіх або любую ролю (нават калі ролю не дазволена згадваць).';

  @override
  String get permissionUseExternalEmoji => 'Выкарыстоўваць знешнія эмоджы';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Выкарыстоўваць эмоджы з іншых суполак.';

  @override
  String get permissionUseExternalStickers => 'Выкарыстоўваць знешнія стыкеры';

  @override
  String get permissionAddReactions => 'Дадаваць рэакцыі';

  @override
  String get permissionAddReactionsDescription =>
      'Дадаваць новыя рэакцыі да паведамленняў.';

  @override
  String get permissionBypassSlowmode => 'Абыход павольнага рэжыму';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Не ўлічваць абмежаванні частаты паведамленняў у каналах.';

  @override
  String get permissionTimeOutMembers => 'Даваць тайм-аўт удзельнікам';

  @override
  String get permissionTimeOutMembersDescription =>
      'Забараняць удзельнікам на пэўны час адпраўляць паведамленні, рэагаваць і далучацца да галасавых каналаў.';

  @override
  String get permissionViewChannel => 'Праглядаць канал';

  @override
  String get permissionViewChannelMembers => 'Праглядаць удзельнікаў канала';

  @override
  String get permissionViewChannelMembersDescription =>
      'Бачыць спіс удзельнікаў каналаў у гэтай суполцы.';

  @override
  String get permissionConnect => 'Падключыць';

  @override
  String get permissionSpeak => 'Гаварыць';

  @override
  String get permissionStreamVideo => 'Трансляваць відэа';

  @override
  String get permissionUseVoiceActivity =>
      'Выкарыстоўваць галасавую актыўнасць';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Без гэтага дазволу абавязковы рэжым рацыі.';

  @override
  String get permissionPrioritySpeaker => 'Прыярытэтны голас';

  @override
  String get permissionMuteMembers => 'Выключаць мікрафон удзельнікам';

  @override
  String get permissionDeafenMembers => 'Выключаць гук удзельнікам';

  @override
  String get permissionMoveMembers => 'Перамяшчаць удзельнікаў';

  @override
  String get permissionMoveMembersDescription =>
      'Перацягваць удзельнікаў паміж каналамі, да якіх у іх ёсць доступ.';

  @override
  String get permissionSetVoiceRegion => 'Змяняць галасавы рэгіён';

  @override
  String get permissionManageThreads => 'Кіраваць галінамі';

  @override
  String get permissionManageThreadsDescription =>
      'Пераймяноўваць, архіваваць, блакіраваць і выдаляць галіны, задаваць для іх павольны рэжым і праглядаць прыватныя галіны.';

  @override
  String get permissionCreatePublicThreads => 'Ствараць публічныя галіны';

  @override
  String get permissionCreatePublicThreadsDescription =>
      'Ствараць галіны, якія бачаць усе, хто можа праглядаць канал.';

  @override
  String get permissionCreatePrivateThreads => 'Ствараць прыватныя галіны';

  @override
  String get permissionCreatePrivateThreadsDescription =>
      'Ствараць галіны толькі па запрашэнні.';

  @override
  String get permissionSendMessagesInThreads =>
      'Адпраўляць паведамленні ў галінах';

  @override
  String get permissionSendMessagesInThreadsDescription =>
      'Адпраўляць паведамленні ў галінах і допісах на форуме.';

  @override
  String get permissionCreatePosts => 'Create posts';

  @override
  String get permissionCreatePostsDescription =>
      'Allows members to create posts in this channel.';

  @override
  String get permissionSendMessagesInPosts => 'Send messages in posts';

  @override
  String get permissionSendMessagesInPostsDescription =>
      'Allows members to send messages in posts.';

  @override
  String get permissionManagePosts => 'Manage posts';

  @override
  String get permissionManagePostsDescription =>
      'Allows members to rename, close, lock, pin and delete posts, and to edit their tags.';

  @override
  String get threadErrorArchived => 'Гэта галіна архіваваная.';

  @override
  String get threadErrorLocked =>
      'Гэта галіна заблакіравана. Пісаць у ёй або зноў адкрыць яе могуць толькі мадэратары.';

  @override
  String get threadErrorAlreadyCreated =>
      'Для гэтага паведамлення ўжо ёсць галіна.';

  @override
  String get threadErrorMaxActiveThreads =>
      'Суполка дасягнула ліміту актыўных галін.';

  @override
  String get threadErrorMaxMembers => 'Галіна дасягнула ліміту ўдзельнікаў.';

  @override
  String get threadErrorMaxPinnedPosts =>
      'На гэтым форуме можна замацаваць толькі адзін допіс.';

  @override
  String get threadErrorMaxForumTags =>
      'На форуме можа быць не больш за 20 тэгаў.';

  @override
  String get threadErrorTagNamesUnique =>
      'Назвы тэгаў мусяць быць унікальнымі.';

  @override
  String get threadErrorNoTagsForEveryone =>
      'Перш чым патрабаваць тэгі, дадайце тэг, якім могуць карыстацца ўсе.';

  @override
  String get threadErrorTagRequired =>
      'Выберыце хаця б адзін тэг для гэтага допісу.';

  @override
  String get threadErrorUnknownTag => 'Аднаго з выбраных тэгаў больш не існуе.';

  @override
  String get threadErrorInvalidNotificationSettings =>
      'Гэтыя налады апавяшчэнняў нельга прымяніць да галіны.';

  @override
  String get threadErrorSearchIndexNotReady =>
      'Допісы яшчэ індэксуюцца. Паспрабуйце яшчэ раз праз хвіліну.';

  @override
  String get threadErrorInvalidChannelType =>
      'Гэта дзеянне недаступнае ў гэтым канале.';

  @override
  String get threadCreate => 'Стварыць галіну';

  @override
  String get threadName => 'Назва галіны';

  @override
  String get threadNameRequired => 'Дайце галіне назву.';

  @override
  String get threadNewThreadPlaceholder => 'Новая галіна';

  @override
  String get threadPrivate => 'Прыватная галіна';

  @override
  String get threadPrivateDescription =>
      'Гэту галіну могуць бачыць толькі людзі, якіх вы запросіце, і мадэратары.';

  @override
  String get threadStarterMessage => 'Паведамленне';

  @override
  String get threadStarterMessagePlaceholder =>
      'Увядзіце паведамленне, каб пачаць размову!';

  @override
  String threadCreateCooldown(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'Стварыць яшчэ адну галіну можна будзе праз $seconds секунды.',
      many: 'Стварыць яшчэ адну галіну можна будзе праз $seconds секунд.',
      few: 'Стварыць яшчэ адну галіну можна будзе праз $seconds секунды.',
      one: 'Стварыць яшчэ адну галіну можна будзе праз $seconds секунду.',
    );
    return '$_temp0';
  }

  @override
  String threadCreateFailed(String detail) {
    return 'Не ўдалося стварыць галіну: $detail';
  }

  @override
  String get threadBrowserTitle => 'Галіны';

  @override
  String get threadBrowserActive => 'Актыўна';

  @override
  String get threadBrowserArchived => 'Закрытыя';

  @override
  String get threadBrowserJoined => 'Вы далучыліся';

  @override
  String get threadBrowserOtherActive => 'Іншыя актыўныя галіны';

  @override
  String get threadBrowserPublic => 'Публічныя галіны';

  @override
  String get threadBrowserPrivate => 'Прыватныя галіны';

  @override
  String get threadBrowserEmpty =>
      'Галін няма. Галіна — гэта часовы тэкставы канал, які дапамагае засяродзіцца на адной размове.';

  @override
  String get threadBrowserArchivedEmpty => 'Закрытых галін няма.';

  @override
  String get threadBrowserLoadMore => 'Загрузіць яшчэ';

  @override
  String get threadBrowserSearch => 'Пошук галін';

  @override
  String get threadBrowserSearchEmpty => 'Няма адпаведных галін';

  @override
  String get threadBrowserSearchEmptyHint =>
      'Паспрабуйце іншую назву або праверце іншую ўкладку.';

  @override
  String get threadBrowserSearchFailed =>
      'Не ўдалося выканаць пошук па галінах. Паспрабуйце пазней.';

  @override
  String get threadBrowserSearchIndexing =>
      'Пошук у гэтай суполцы яшчэ рыхтуецца. Хутка паспрабуем зноў...';

  @override
  String threadMessageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count паведамлення',
      many: '$count паведамленняў',
      few: '$count паведамленні',
      one: '$count паведамленне',
    );
    return '$_temp0';
  }

  @override
  String get threadFailedToMentionSomeRoles =>
      'Некаторыя згаданыя ролі не дададзены ў гэту галіну.';

  @override
  String get threadMembers => 'Удзельнікі галіны';

  @override
  String threadMembersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count удзельніка',
      many: '$count удзельнікаў',
      few: '$count удзельнікі',
      one: '$count удзельнік',
    );
    return '$_temp0';
  }

  @override
  String get threadMembersEmpty => 'Да гэтай галіны яшчэ ніхто не далучыўся.';

  @override
  String threadRemoveMember(String name) {
    return 'Выдаліць $name з галіны';
  }

  @override
  String get threadJoin => 'Далучыцца да галіны';

  @override
  String get threadLeave => 'Пакінуць галіну';

  @override
  String get threadJoinNotice =>
      'Далучыцеся да гэтай галіны, каб бачыць яе ў спісе каналаў і атрымліваць апавяшчэнні.';

  @override
  String get threadArchivedNotice =>
      'Гэта галіна закрыта. Калі адправіць паведамленне, яна зноў адкрыецца.';

  @override
  String get threadLockedNotice =>
      'Гэта галіна заблакіравана. Адпраўляць паведамленні могуць толькі мадэратары.';

  @override
  String get threadArchive => 'Закрыць галіну';

  @override
  String get threadUnarchive => 'Зноў адкрыць галіну';

  @override
  String get threadLock => 'Заблакіраваць галіну';

  @override
  String get threadUnlock => 'Разблакіраваць галіну';

  @override
  String get threadDelete => 'Выдаліць галіну';

  @override
  String threadDeleteConfirm(String threadName) {
    return 'Вы сапраўды хочаце выдаліць $threadName? Гэта дзеянне нельга адмяніць.';
  }

  @override
  String get threadDeleted => 'Галіна выдалена';

  @override
  String get threadMarkAsRead => 'Пазначыць як прачытанае';

  @override
  String get threadMute => 'Заглушыць галіну';

  @override
  String get threadUnmute => 'Уключыць апавяшчэнні галіны';

  @override
  String get threadMuted => 'Галіна заглушана';

  @override
  String get threadUnmuted => 'Заглушэнне галіны знята';

  @override
  String get threadNotificationSettings => 'Налады апавяшчэнняў';

  @override
  String get threadNotificationParentDefault => 'Як у канале';

  @override
  String get threadCopyLink => 'Скапіраваць спасылку';

  @override
  String get threadCopyId => 'Скапіраваць ID галіны';

  @override
  String get threadMoreOptions => 'Іншыя параметры';

  @override
  String get threadSettings => 'Налады галіны';

  @override
  String get threadSettingsSaved => 'Налады галіны захаваны';

  @override
  String get threadAutoArchive => 'Хаваць пасля бяздзейнасці';

  @override
  String get threadAutoArchiveDescription =>
      'Пасля такога перыяду бяздзейнасці галіна перастае паказвацца ў спісе каналаў.';

  @override
  String get threadDefaultAutoArchive =>
      'Прадвызначаны час схавання пасля бяздзейнасці';

  @override
  String get threadDefaultAutoArchiveDescription =>
      'Пасля такога перыяду бяздзейнасці новыя галіны перастаюць паказвацца ў спісе каналаў.';

  @override
  String get threadDefaultSlowmode => 'Прадвызначаны павольны рэжым у галінах';

  @override
  String get threadAutoArchiveOneHour => '1 гадзіна';

  @override
  String get threadAutoArchiveOneDay => '24 гадзіны';

  @override
  String get threadAutoArchiveThreeDays => '3 дні';

  @override
  String get threadAutoArchiveOneWeek => '1 тыдзень';

  @override
  String get threadInvitable => 'Дазволіць запрашаць усім';

  @override
  String get threadInvitableDescription =>
      'Удзельнікі гэтай прыватнай галіны могуць дадаваць іншых людзей.';

  @override
  String threadStartedBy(String name) {
    return 'Аўтар галіны: $name';
  }

  @override
  String get threadStarterDeleted => 'Зыходнае паведамленне выдалена.';

  @override
  String systemThreadCreated(
    String username,
    String threadLink,
    String allThreadsLink,
  ) {
    return '$username стварае галіну: $threadLink. Глядзіце $allThreadsLink.';
  }

  @override
  String get systemThreadCreatedAllThreadsLink => 'усе галіны';

  @override
  String get systemThreadCreatedThreadFallback => 'галіна';

  @override
  String systemPreviewThreadCreated(String username) {
    return '$username стварае галіну.';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Уласных эмоджы пакуль няма.';

  @override
  String get guildSettingsStickersEmpty => 'Уласных стыкераў пакуль няма.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Праверка ўдзельнікаў';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Выберыце, што павінна быць ва ўдзельнікаў, перш чым яны змогуць пісаць у суполцы або адпраўляць асабістыя паведамленні яе ўдзельнікам.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Удзельнікі з ролямі могуць абыходзіць гэтыя праверкі. Для публічных прастор рэкамендуем уключыць праверку.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Суполкам з раздзела «Агляд» патрэбна прынамсі пацвярджэнне электроннай пошты. Варыянт «Няма» нельга выбраць, пакуль ваша суполка ёсць у раздзеле «Агляд».';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Змесціва для дарослых і папярэджанні аб змесціве';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Наладзьце адзнаку змесціва для дарослых і неабавязковыя папярэджанні аб змесціве для ўдзельнікаў.';

  @override
  String get guildSettingsModerationMatureToggle => 'Змесціва для дарослых';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Пазначыць гэту суполку як суполку са змесцівам для дарослых.';

  @override
  String get guildSettingsVerificationNone => 'Няма';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Праверка не патрабуецца.';

  @override
  String get guildSettingsVerificationLow => 'Нізкі';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Патрэбны пацверджаны адрас электроннай пошты.';

  @override
  String get guildSettingsVerificationMedium => 'Сярэдні';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Патрабуецца пацверджаны адрас электроннай пошты і ўліковы запіс, створаны не менш за 5 хвілін таму.';

  @override
  String get guildSettingsVerificationHigh => 'Высокі';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Патрэбна ўсё з узроўню «Сярэдні», а таксама членства ў суполцы не менш за 10 хвілін.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Сачыце за дзеяннямі мадэратараў у суполцы.';

  @override
  String get guildSettingsAuditLogEmpty => 'Журнал пакуль пусты';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Тут будуць паказвацца дзеянні мадэрацыі і змены ў суполцы.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Усе карыстальнікі';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Усе дзеянні';

  @override
  String get guildSettingsAuditLogNoReason => 'Прычына не ўказана.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Невядомы карыстальнік';

  @override
  String get guildSettingsAuditLogReason => 'Прычына';

  @override
  String get guildSettingsAuditLogSomeone => 'хтосьці';

  @override
  String get guildSettingsAuditLogSomething => 'штосьці';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'невядомы аб’ект';

  @override
  String get guildSettingsAuditLogNothing => 'нічога';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Невядомая мэта';

  @override
  String get auditLogActionGuildUpdate => 'Суполка абноўлена';

  @override
  String get auditLogActionChannelCreate => 'Канал створаны';

  @override
  String get auditLogActionChannelUpdate => 'Канал абноўлены';

  @override
  String get auditLogActionChannelDelete => 'Канал выдалены';

  @override
  String get auditLogActionThreadCreate => 'Галіна створана';

  @override
  String get auditLogActionThreadUpdate => 'Галіна абноўлена';

  @override
  String get auditLogActionThreadDelete => 'Галіна выдалена';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Дададзена перавызначэнне дазволаў канала';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Абноўлена перавызначэнне дазволаў канала';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Выдалена перавызначэнне дазволаў канала';

  @override
  String get auditLogActionMemberKick => 'Удзельнік выгнаны';

  @override
  String get auditLogActionMemberPrune => 'Неактыўныя ўдзельнікі выдалены';

  @override
  String get auditLogActionMemberBanAdd => 'Удзельнік забанены';

  @override
  String get auditLogActionMemberBanRemove => 'З удзельніка зняты бан';

  @override
  String get auditLogActionMemberUpdate => 'Удзельнік абноўлены';

  @override
  String get auditLogActionMemberRoleUpdate => 'Ролі ўдзельніка абноўлены';

  @override
  String get auditLogActionMemberMove => 'Удзельнік перамешчаны';

  @override
  String get auditLogActionMemberDisconnect => 'Удзельнік адключаны';

  @override
  String get auditLogActionBotAdd => 'Бот дададзены';

  @override
  String get auditLogActionRoleCreate => 'Роля створана';

  @override
  String get auditLogActionRoleUpdate => 'Роля абноўлена';

  @override
  String get auditLogActionRoleDelete => 'Роля выдалена';

  @override
  String get auditLogActionInviteCreate => 'Запрашэнне створана';

  @override
  String get auditLogActionInviteUpdate => 'Запрашэнне абноўлена';

  @override
  String get auditLogActionInviteDelete => 'Запрашэнне выдалена';

  @override
  String get auditLogActionWebhookCreate => 'Вэб-хук створаны';

  @override
  String get auditLogActionWebhookUpdate => 'Вэб-хук абноўлены';

  @override
  String get auditLogActionWebhookDelete => 'Вэб-хук выдалены';

  @override
  String get auditLogActionEmojiCreate => 'Эмоджы створана';

  @override
  String get auditLogActionEmojiUpdate => 'Эмоджы абноўлена';

  @override
  String get auditLogActionEmojiDelete => 'Эмоджы выдалена';

  @override
  String get auditLogActionStickerCreate => 'Стыкер створаны';

  @override
  String get auditLogActionStickerUpdate => 'Стыкер абноўлены';

  @override
  String get auditLogActionStickerDelete => 'Стыкер выдалены';

  @override
  String get auditLogActionMessageDelete => 'Паведамленне выдалена';

  @override
  String get auditLogActionMessageBulkDelete => 'Паведамленні выдалены';

  @override
  String get auditLogActionMessagePin => 'Паведамленне замацавана';

  @override
  String get auditLogActionMessageUnpin => 'Паведамленне адмацавана';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor абнаўляе налады суполкі.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor стварае канал $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor абнаўляе канал $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor выдаляе канал $target.';
  }

  @override
  String auditLogSummaryThreadCreate(String actor, String target) {
    return '$actor стварае галіну $target.';
  }

  @override
  String auditLogSummaryThreadUpdate(String actor, String target) {
    return '$actor абнаўляе галіну $target.';
  }

  @override
  String auditLogSummaryThreadDelete(String actor, String target) {
    return '$actor выдаляе галіну $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor дадае дазволы канала для $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor дадае дазволы для $target у канале $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor абнаўляе дазволы канала для $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor абнаўляе дазволы для $target у канале $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor выдаляе дазволы канала для $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor выдаляе дазволы для $target у канале $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor выганяе $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor баніць $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor знімае бан з $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor абнаўляе $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor абнаўляе ролі $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor выдаляе неактыўных удзельнікаў.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor выдаляе ўдзельнікаў без актыўнасці на працягу дзён: $days.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor перамяшчае $target у іншы галасавы канал.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor перамяшчае $target у $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor адключае $target ад галасавога канала.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor дадае бота $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor стварае ролю $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor абнаўляе ролю $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor выдаляе ролю $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor стварае запрашэнне $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor стварае запрашэнне $target для канала $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor абнаўляе запрашэнне $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor абнаўляе запрашэнне $target для канала $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor выдаляе запрашэнне $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor выдаляе запрашэнне $target для канала $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor стварае вэб-хук $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor абнаўляе вэб-хук $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor выдаляе вэб-хук $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor дадае эмоджы $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor абнаўляе эмоджы $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor выдаляе эмоджы $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor дадае стыкер $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor абнаўляе стыкер $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor выдаляе стыкер $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor выдаляе паведамленне.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor выдаляе паведамленне ў канале $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor выдаляе некалькі паведамленняў.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor выдаляе паведамленні: $count.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor выдаляе некалькі паведамленняў у канале $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor выдаляе паведамленні ў канале $channel: $count.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor замацоўвае паведамленне.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor замацоўвае паведамленне ў канале $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor адмацоўвае паведамленне.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor адмацоўвае паведамленне ў канале $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor выконвае дзеянне над $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Поле $field зменена з $oldValue на $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Для поля $field зададзена значэнне $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Поле $field ачышчана (было $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Поле $field абноўлена.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Суполка перайменавана ў $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon => 'Значок суполкі абноўлены.';

  @override
  String get auditLogChangePausedInvites => 'Запрашэнні прыпынены.';

  @override
  String get auditLogChangeResumedInvites => 'Запрашэнні адноўлены.';

  @override
  String get auditLogChangeTurnedOnDetachedBanner => 'Асобны банер уключаны.';

  @override
  String get auditLogChangeTurnedOffDetachedBanner => 'Асобны банер выключаны.';

  @override
  String get auditLogChangeAllowedFlexibleChannelNames =>
      'Дазволены гнуткія назвы тэкставых каналаў.';

  @override
  String get auditLogChangeDisallowedFlexibleChannelNames =>
      'Больш не дазволены гнуткія назвы тэкставых каналаў.';

  @override
  String get auditLogChangeHidOwnerCrown =>
      'Схавана карона ўладальніка суполкі.';

  @override
  String get auditLogChangeShowedOwnerCrown =>
      'Карона ўладальніка суполкі больш не хаваецца.';

  @override
  String get auditLogChangeAllowedEmojiCloning =>
      'Іншым дазволена кланіраваць эмоджы гэтай суполкі.';

  @override
  String get auditLogChangeStoppedEmojiCloning =>
      'Іншым больш не дазволена кланіраваць эмоджы гэтай суполкі.';

  @override
  String get auditLogChangeAllowedStickerCloning =>
      'Іншым дазволена кланіраваць стыкеры гэтай суполкі.';

  @override
  String get auditLogChangeStoppedStickerCloning =>
      'Іншым больш не дазволена кланіраваць стыкеры гэтай суполкі.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Канал перайменаваны ў $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Тэма ачышчана.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Тэма зменена на $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'Змесціва для дарослых уключана.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Змесціва для дарослых выключана.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Зададзены псеўданім $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Псеўданім $nickname прыбраны.';
  }

  @override
  String get auditLogChangeMutedMember => 'Удзельніку выключаны мікрафон.';

  @override
  String get auditLogChangeUnmutedMember => 'Удзельніку ўключаны мікрафон.';

  @override
  String get auditLogChangeDeafenedMember => 'Удзельніку выключаны гук.';

  @override
  String get auditLogChangeUndeafenedMember => 'Удзельніку ўключаны гук.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Дададзена: $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Прыбрана: $roles.';
  }

  @override
  String auditLogChangeRoleEmojiSet(String emoji) {
    return 'Значок ролі зададзены: $emoji';
  }

  @override
  String auditLogChangeRoleEmojiChanged(String oldEmoji, String newEmoji) {
    return 'Значок ролі зменены з $oldEmoji на $newEmoji';
  }

  @override
  String get auditLogChangeRoleEmojiRemoved => 'Значок ролі прыбраны';

  @override
  String get auditLogChangeRoleIconSet => 'Зададзены ўласны значок ролі';

  @override
  String get auditLogChangeRoleIconChanged => 'Уласны значок ролі зменены';

  @override
  String get auditLogChangeRoleIconRemoved => 'Уласны значок ролі выдалены';

  @override
  String auditLogOptionChannel(String value) {
    return 'Канал: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Паведамленне: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Хто запрасіў: $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Выдалена $count паведамлення.',
      many: 'Выдалена $count паведамленняў.',
      few: 'Выдалена $count паведамленні.',
      one: 'Выдалена $count паведамленне.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Выдалена $count удзельніка.',
      many: 'Выдалена $count удзельнікаў.',
      few: 'Выдалены $count удзельнікі.',
      one: 'Выдалены $count удзельнік.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'Гэта запрашэнне бестэрміновае.';

  @override
  String get auditLogOptionTemporaryMembership => 'Дае часовае членства.';

  @override
  String get auditLogOptionPermanentMembership => 'Дае пастаяннае членства.';

  @override
  String get guildSettingsWebhooksDescription =>
      'Праглядайце ўсе вэб-хукі, наладжаныя ў вашай суполцы, і кіруйце імі.';

  @override
  String get guildSettingsWebhooksEmpty => 'Няма вэб-хукаў';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'У гэтай суполцы пакуль няма вэб-хукаў. Каб стварыць вэб-хук, перайдзіце ў раздзел $channelSettingsPath.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'Каб праглядаць і змяняць вэб-хукі гэтай суполкі, патрэбны дазвол «$permission».';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle =>
      'Не ўдалося загрузіць вэб-хукі';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'Пры загрузцы вэб-хукаў адбылася памылка. Паспрабуйце яшчэ раз.';

  @override
  String get guildSettingsWebhooksUpdated => 'Вэб-хукі абноўлены';

  @override
  String get guildSettingsWebhooksUpdateFailed =>
      'Не ўдалося абнавіць вэб-хукі';

  @override
  String get guildSettingsUnknownChannel => 'Невядомы канал';

  @override
  String get guildSettingsCopiedUrl => 'URL скапіраваны ў буфер абмену';

  @override
  String get guildSettingsDiscoveryDescription =>
      'Дадайце сваю суполку ў раздзел «Агляд», каб іншыя маглі знайсці яе і далучыцца.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Недастаткова ўдзельнікаў';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count удзельніка',
      many: '$count удзельнікаў',
      few: '$count удзельнікаў',
      one: '$count удзельніка',
    );
    return 'Каб суполку можна было паказаць у раздзеле «Агляд», у ёй павінна быць не менш за $_temp0.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Статус:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'Чакае';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Ухвалена';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Адхілена';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Выдалена';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Прычына: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'Ваша суполка ёсць у раздзеле «Агляд». Ніжэй можна абнавіць звесткі пра яе або адклікаць заяўку, каб прыбраць суполку адтуль.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Ваша заяўка чакае разгляду. Вы па-ранейшаму можаце абнавіць звесткі заяўкі або адклікаць яе.';

  @override
  String get guildSettingsDiscoveryCategory => 'Катэгорыя';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Выберыце катэгорыю, якая найлепш апісвае вашу суполку. Гэта можна змяніць у любы час.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Асноўная мова';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'Мова, на якой размаўляе большасць вашай суполкі. Па ёй фільтруюцца вынікі ў раздзеле «Агляд».';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Апісанне';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Апішыце, пра што ваша суполка';

  @override
  String get guildSettingsDiscoveryDescriptionRequired => 'Патрэбна апісанне.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'Апісанне павінна змяшчаць не менш за $minLength сімв.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'Апісанне павінна змяшчаць не больш за $maxLength сімв.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Уласныя тэгі';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Тэгі (да $maxTags) дапамагаюць людзям знайсці вашу суполку. Яны ўлічваюцца пры пошуку ў раздзеле «Агляд».';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'Дадайце тэг і націсніце Enter';

  @override
  String get guildSettingsDiscoveryAddTag => 'Дадаць';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Прыбраць тэг $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle => 'Не ўдалося дадаць тэг';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'Тэгі мусяць змяшчаць ад 2 да $maxLength сімвалаў і складацца з літар і лічбаў.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'Максімальная колькасць тэгаў: $maxTags.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Ужыць';

  @override
  String get guildSettingsDiscoverySave => 'Захаваць';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Адклікаць';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Заяўка ў раздзел «Агляд» адпраўлена';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Заяўка ў раздзеле «Агляд» абноўлена';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Заяўка ў раздзел «Агляд» адклікана';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Не ўдалося адклікаць заяўку';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Паспрабуйце яшчэ раз праз хвіліну.';

  @override
  String get guildSettingsMembersSearchHint =>
      'Пошук па імені карыстальніка або ID';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return 'Удзельнікаў: $count';
  }

  @override
  String get guildMembersRecentTitle => 'Нядаўнія ўдзельнікі';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Паказана $displayedCount з $totalCount удзельнікаў';
  }

  @override
  String get guildMembersSort => 'Сартаванне';

  @override
  String get guildSettingsMembersSortNewest => 'Спачатку найноўшыя';

  @override
  String get guildMembersSortOldest => 'Спачатку найстарэйшыя';

  @override
  String get guildMembersColumnName => 'Імя';

  @override
  String get guildMembersColumnMemberSince => 'Дата далучэння';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'Дата далучэння да $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Спосаб далучэння';

  @override
  String get guildMembersColumnRoles => 'Ролі';

  @override
  String get guildMembersFilterMemberSince => 'Фільтраваць па даце далучэння';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Фільтраваць па даце стварэння ўліковага запісу';

  @override
  String get guildMembersFilterJoinMethod => 'Фільтраваць па спосабе далучэння';

  @override
  String get guildMembersFilterRoles => 'Фільтраваць па ролях';

  @override
  String get guildMembersFilterAll => 'Усе';

  @override
  String get guildMembersFilterPast1Hour => 'Апошняя гадзіна';

  @override
  String get guildMembersFilterPast24Hours => 'Апошнія 24 гадзіны';

  @override
  String get guildMembersFilterPast7Days => 'Апошнія 7 дзён';

  @override
  String get guildMembersFilterPast2Weeks => 'Апошнія 2 тыдні';

  @override
  String get guildMembersFilterPast3Weeks => 'Апошнія 3 тыдні';

  @override
  String get guildMembersFilterPast4Weeks => 'Апошнія 4 тыдні';

  @override
  String get guildMembersFilterPast3Months => 'Апошнія 3 месяцы';

  @override
  String get guildMembersFilterCustomRange => 'Уласны дыяпазон...';

  @override
  String get guildMembersDateRangeTitle => 'Уласны дыяпазон дат';

  @override
  String get guildMembersDateAfter => 'Пасля даты';

  @override
  String get guildMembersDateBefore => 'Да даты';

  @override
  String get guildMembersClearAll => 'Ачысціць усё';

  @override
  String get guildMembersRowsPerPage => 'Радкоў на старонцы';

  @override
  String get guildMembersEmptySearch => 'Па гэтым пошуку нікога не знойдзена.';

  @override
  String get guildMembersLoadError =>
      'Пры загрузцы ўдзельнікаў штосьці пайшло не так. Паспрабуйце пазней.';

  @override
  String get guildMembersIndexing => 'Індэксацыя ўдзельнікаў…';

  @override
  String get guildMembersJoinSourceCreator => 'Стваральнік суполкі';

  @override
  String get guildMembersJoinSourceInvite => 'Запрасіць';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Запрашэнне ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Запрашэнне ад $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'Персаналізаваны URL';

  @override
  String get guildMembersJoinSourceBotInvite => 'Запрашэнне бота';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'Адміністратар платформы';

  @override
  String get guildMembersJoinSourceDiscovery => 'Агляд';

  @override
  String get guildMembersJoinMethodUnknown => 'Невядома';

  @override
  String get guildMembersCommunityOwner => 'Уладальнік суполкі';

  @override
  String get guildMembersViewAllRoles => 'Паглядзець усе ролі';

  @override
  String get guildMembersJoinedJustNow => 'Толькі што';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count хвіліны таму',
      many: '$count хвілін таму',
      few: '$count хвіліны таму',
      one: '# хвіліну таму',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count гадзіны таму',
      many: '$count гадзін таму',
      few: '$count гадзіны таму',
      one: '# гадзіну таму',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Удзельнікі';

  @override
  String get guildSettingsInvitesTitle => 'Запрашэнні';

  @override
  String get guildSettingsInvitesDescription =>
      'Праглядайце ўсе запрашэнні ў гэту суполку. Каб стварыць новае запрашэнне, перайдзіце ў канал і націсніце кнопку запрашэння.';

  @override
  String get guildSettingsInvitesEmpty => 'Няма спасылак-запрашэнняў';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'У гэтай суполкі пакуль няма спасылак-запрашэнняў. Перайдзіце ў канал і стварыце запрашэнне, каб запрашаць людзей.';

  @override
  String get guildSettingsInvitesLoadFailedTitle =>
      'Не ўдалося загрузіць запрашэнні';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Пры загрузцы запрашэнняў адбылася памылка. Паспрабуйце яшчэ раз.';

  @override
  String get guildSettingsInvitesTryAgain => 'Паспрабаваць яшчэ раз';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Паказваць дату стварэння замест даты заканчэння';

  @override
  String get guildSettingsInvitesPauseInvites => 'Прыпыніць запрашэнні';

  @override
  String get guildSettingsInvitesEnableInvites => 'Уключыць запрашэнні';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Прыпыніць запрашэнні ў гэту суполку';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Уключыць запрашэнні ў гэту суполку';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Прыпыніць запрашэнні? Новыя карыстальнікі не змогуць далучацца па спасылках-запрашэннях, пакуль вы іх зноў не ўключыце. На цяперашніх удзельнікаў гэта не паўплывае.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Уключыць запрашэнні? Карыстальнікі зноў змогуць далучацца да гэтай суполкі па спасылках-запрашэннях.';

  @override
  String get guildSettingsInvitesPause => 'Паўза';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Запрашэнні ў гэту суполку прыпынены.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Запрашэнні прыпынены, бо $productName выявіў магчымы рэйд. Новыя карыстальнікі зараз не могуць далучыцца.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Хто запрасіў:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Канал:';

  @override
  String get guildSettingsInvitesLabelCode => 'Код:';

  @override
  String get guildSettingsInvitesLabelUses => 'Выкарыстана разоў:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Створана:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Сканчаецца:';

  @override
  String get guildSettingsInvitesUnknown => 'Невядома';

  @override
  String get guildSettingsInvitesNoCategory => 'Без катэгорыі';

  @override
  String get guildSettingsInvitesExpired => 'Тэрмін дзеяння скончыўся';

  @override
  String get guildSettingsInvitesNever => 'Ніколі';

  @override
  String get guildSettingsInvitesCopyLink => 'Скапіраваць спасылку-запрашэнне';

  @override
  String get guildSettingsInvitesRevoke => 'Адклікаць запрашэнне';

  @override
  String get guildSettingsInvitesRevokeFailedTitle =>
      'Не ўдалося адклікаць запрашэнне';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'Магчыма, спасылка яшчэ працуе. Паспрабуйце яшчэ раз праз хвіліну.';

  @override
  String get guildSettingsBansDescription =>
      'Праглядайце забаненых карыстальнікаў і кіруйце імі.';

  @override
  String get guildSettingsBansSearchHint => 'Пошук у банах';

  @override
  String get guildSettingsBansEmpty => 'Забаненых карыстальнікаў няма.';

  @override
  String get guildSettingsBanExpiresLabel => 'Сканчаецца';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Па вашым запыце баны не знойдзены.';

  @override
  String get guildSettingsBanDetailsTitle => 'Звесткі пра бан';

  @override
  String get guildSettingsBanViewDetails => 'Паглядзець падрабязнасці';

  @override
  String get guildSettingsBannedOn => 'Дата бану';

  @override
  String get guildSettingsBannedBy => 'Хто забаніў';

  @override
  String get guildSettingsRevokeBanTitle => 'Зняць бан';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Вы сапраўды хочаце зняць бан з $displayName? Гэты карыстальнік зможа зноў далучыцца да суполкі.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Бан з $displayName зняты';
  }

  @override
  String get guildSettingsCommunitySettings => 'Налады суполкі';

  @override
  String get guildSettingsDeleteCommunity => 'Выдаліць суполку';

  @override
  String get guildSettingsDeleteCommunityConfirm =>
      'Вы сапраўды хочаце выдаліць гэту суполку? Гэта дзеянне нельга адмяніць. Усе каналы, паведамленні і налады будуць выдалены назаўсёды.';

  @override
  String get guildSettingsCommunityDeleted => 'Суполка выдалена';

  @override
  String get guildSettingsDeleteCommunityFailed =>
      'Не ўдалося выдаліць гэту суполку';

  @override
  String get guildSettingsCategoryExpressions => 'Выразы';

  @override
  String get guildSettingsCategoryCommunity => 'Суполка';

  @override
  String get guildSettingsCategoryIntegrations => 'Інтэграцыі';

  @override
  String get guildSettingsCategoryPeople => 'Людзі';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Брэндынг';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Абнавіце значок, назву, банер і фон запрашэння';

  @override
  String get guildSettingsOverviewBannerUpload => 'Загрузіць банер';

  @override
  String get guildSettingsOverviewIdleTitle => 'Налады бяздзейнасці';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Наладзьце AFK-канал і час бяздзейнасці';

  @override
  String get guildSettingsOverviewSystemTitle => 'Сістэма і прывітанні';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Выберыце, куды трапляюць сістэмныя і вітальныя паведамленні';

  @override
  String get guildSettingsOverviewNotificationsTitle =>
      'Прадвызначаныя апавяшчэнні';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Суполкі, дзе больш за 250 чалавек, прымусова пераводзяцца на наладу «Толькі згадванні». Ваша першапачатковая налада захоўваецца і будзе вернута, калі ў суполцы стане менш за 250 удзельнікаў.';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Дазволіць гнуткія назвы тэкставых каналаў';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Схаваць карону ўладальніка суполкі';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Асобны банер';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Паказвае банер у асобным раздзеле пад загалоўкам суполкі.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Загрузіць значок';

  @override
  String get guildSettingsOverviewRemoveImage => 'Прыбраць';

  @override
  String get guildSettingsOverviewSplashTitle => 'Фон запрашэння';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'Фон убудаванага чата';

  @override
  String get guildSettingsOverviewUploadBackground => 'Загрузіць фон';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'Няма банера суполкі';

  @override
  String get guildSettingsOverviewNoInviteBackground => 'Няма фону запрашэння';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Папярэдні прагляд';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Паглядзіце, як ваша запрашэнне выглядае для наведвальнікаў.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Назвы тэкставых каналаў';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Карона ўладальніка суполкі';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Выберыце, ці паказваць карону побач з уладальнікам суполкі';

  @override
  String get guildSettingsSplashCardAlignment => 'Выраўноўванне карткі';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Па цэнтры';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Злева';

  @override
  String get guildSettingsSplashAlignmentRight => 'Справа';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Ужываецца толькі на шырокіх экранах.';

  @override
  String get permissionReadMessageHistory => 'Чытаць гісторыю паведамленняў';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Змяніць, што бачаць карыстальнікі без дазволу «$permission»';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Задайце ў асобным акне парог гісторыі паведамленняў для ўдзельнікаў без дазволу $permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Адкрыць парог гісторыі паведамленняў';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Парог гісторыі паведамленняў';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Уключыць парог гісторыі паведамленняў';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Парогавая дата';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Удзельнікі без дазволу «Чытаць гісторыю паведамленняў» могуць праглядаць паведамленні, адпраўленыя пасля гэтай даты.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Парог гісторыі паведамленняў абноўлены';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Дазволіць вялікія літары і прабелы ў назвах тэкставых каналаў. Калі выключана, у назвах дазволены толькі малыя літары, злучкі і знакі падкрэслівання.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Хавае карону побач з уладальнікам суполкі ўсюды.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Для аніміраваных значкоў суполцы патрэбна функцыя «Аніміраваны значок».';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Для аніміраваных банераў суполцы патрэбна функцыя «Аніміраваны банер».';

  @override
  String get guildSettingsAfkChannel => 'Канал AFK / неактыўных';

  @override
  String get guildSettingsAfkChannelHint =>
      'Перамяшчаць удзельнікаў у гэты канал, калі яны AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Няма AFK-канала';

  @override
  String get guildSettingsAfkTimeout => 'Час бяздзейнасці (AFK)';

  @override
  String get guildSettingsAfkTimeout1Min => '1 хвіліна';

  @override
  String get guildSettingsAfkTimeout5Min => '5 хвілін';

  @override
  String get guildSettingsAfkTimeout15Min => '15 хвілін';

  @override
  String get guildSettingsAfkTimeout30Min => '30 хвілін';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 гадзіна';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds с';
  }

  @override
  String get guildSettingsSystemChannel => 'Канал прызначэння';

  @override
  String get guildSettingsSystemChannelHint =>
      'Тут будуць з’яўляцца вітальныя і сістэмныя паведамленні.';

  @override
  String get guildSettingsNoSystemChannel => 'Няма сістэмнага канала';

  @override
  String get guildSettingsHideJoinMessages =>
      'Схаваць паведамленні пра далучэнне';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Хавае паведамленні пра далучэнне ў выбраным канале.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Прадвызначаныя налады апавяшчэнняў';

  @override
  String get guildSettingsNotificationsAll => 'Усе паведамленні';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Апавяшчаць пра ўсе паведамленні';

  @override
  String get guildSettingsNotificationsMentions => 'Толькі згадванні';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Апавяшчаць толькі пра згадванні';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Да 10 МБ. Мінімум: 960×540 пкс (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Да 10 МБ. Мінімум: 960×540 пкс (16:9). Паказваецца ва ўбудаваных запрашэннях у чаце.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Фільтрацыя змесціва';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Аўтаматычна правяраць паведамленні на змесціва адкрытага характару ў каналах, не пазначаных як каналы для дарослых.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Суполкі ў раздзеле «Агляд» павінны правяраць паведамленні ўсіх удзельнікаў. Пакуль ваша суполка ёсць у раздзеле «Агляд», гэту наладу змяніць нельга.';

  @override
  String get guildSettingsContentFilterOff => 'Выключана';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Даверыць мадэрацыю самой суполцы';

  @override
  String get guildSettingsContentFilterNoRole =>
      'Фільтраваць удзельнікаў без роляў';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Рэкамендуецца для большасці суполак';

  @override
  String get guildSettingsContentFilterAll => 'Фільтраваць усіх';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Максімальная абарона для сямейных прастор';

  @override
  String get guildSettingsContentWarningToggle =>
      'Паказваць папярэджанне аб змесціве';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Уключае запыт згоды перад уваходам у любы канал.';

  @override
  String get guildSettingsContentWarningText => 'Уласны тэкст папярэджання';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Тут ёсць адчувальнае змесціва.';

  @override
  String get guildSettingsModeration2faTitle => 'Патрабаванне 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'Патрабаваць ад мадэратараў двухфактарную аўтэнтыфікацыю, перш чым яны змогуць баніць, выганяць, даваць тайм-аўт або выдаляць паведамленні.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Патрабаваць 2FA для дзеянняў мадэрацыі';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Каб змяніць гэту наладу, уключыце 2FA у сваім уліковым запісе';

  @override
  String get guildSettingsEmojiSearchHint => 'Пошук эмоджы';

  @override
  String get guildSettingsEmojiUploadTitle => 'Загрузіць эмоджы';

  @override
  String get guildSettingsEmojiSlotsTitle => 'Месцы для эмоджы';

  @override
  String get guildSettingsEmojiDropZone => 'Перацягніце сюды файлы эмоджы';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Не ўдалося загрузіць эмоджы. Паспрабуйце пазней.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'Па вашым запыце эмоджы не знойдзены.';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Вы дасягнулі максімальнай колькасці эмоджы. Каб вызваліць месца, выдаліце некаторыя з іх.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Назвы эмоджы мусяць змяшчаць не менш за 2 сімвалы і могуць складацца з літар, лічбаў і падкрэсліванняў. Памер эмоджы мусіць быць меншы за $maxSize. Статычныя выявы аўтаматычна памяншаюцца да 128x128 пікселяў і сціскаюцца. Аніміраваныя эмоджы і SVG мусяць адразу ўкладвацца ў ліміт.';
  }

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Некаторыя эмоджы не ўдалося дадаць';

  @override
  String get guildSettingsEmojiRenameTitle => 'Перайменаваць эмоджы';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2–32 сімвалы: літары, лічбы, знакі падкрэслівання.';

  @override
  String get guildSettingsEmojiColumnName => 'Імя';

  @override
  String get guildSettingsEmojiColumnUploader => 'Хто загрузіў';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Выдаліць эмоджы';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'Выдаліць :$name:? Гэта нельга адмяніць.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Выдаліць гэта эмоджы са сховішча і CDN';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'Назва эмоджы мусіць змяшчаць не менш за 2 сімвалы';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'Назва эмоджы мусіць змяшчаць не больш за 32 сімвалы';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Няправільная назва эмоджы';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Не ўдалося перайменаваць гэта эмоджы';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Не ўдалося выдаліць гэта эмоджы';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'Дазволіць іншым кланіраваць вашы эмоджы';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'Калі ўключана, удзельнікі іншых суполак могуць кланіраваць вашы ўласныя эмоджы адным націсканнем кнопкі «Кланіраваць» у праграме. Гэта не перашкаджае ім захаваць выяву і загрузіць яе самастойна.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Дазволіць іншым кланіраваць вашы стыкеры';

  @override
  String get guildSettingsCloneStickerDescription =>
      'Калі ўключана, удзельнікі іншых суполак могуць кланіраваць вашы ўласныя стыкеры адным націсканнем кнопкі «Кланіраваць» у праграме. Гэта не перашкаджае ім захаваць выяву і загрузіць яе самастойна.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Змяніць гэта могуць толькі ўдзельнікі з дазволам «$permission».';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'Не ўдалося абнавіць кланіраванне эмоджы';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Не ўдалося абнавіць кланіраванне стыкераў';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Неаніміраваныя эмоджы ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Аніміраваныя эмоджы ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Пошук стыкераў';

  @override
  String get guildSettingsStickerSlotsTitle => 'Месцы для стыкераў';

  @override
  String get guildSettingsStickerUploadTitle => 'Загрузіць стыкер';

  @override
  String get guildSettingsStickerDropZone =>
      'Перацягніце сюды файл стыкера (па адным)';

  @override
  String get guildSettingsStickerDensity => 'Шчыльнасць стыкераў';

  @override
  String get guildSettingsStickerDensityCozy => 'Утульны';

  @override
  String get guildSettingsStickerDensityCompact => 'Кампактны';

  @override
  String get guildSettingsStickersLoadFailedTitle =>
      'Не ўдалося загрузіць стыкеры';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Пры загрузцы стыкераў адбылася памылка. Паспрабуйце яшчэ раз.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Па вашым запыце стыкеры не знойдзены.';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Вы дасягнулі максімальнай колькасці стыкераў. Каб вызваліць месца, выдаліце некаторыя з іх.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Стыкеры захоўваюцца памерам 320x320 пікселяў і мусяць быць меншыя за $maxSize. Статычныя выявы аўтаматычна памяншаюцца і сціскаюцца. Аніміраваныя стыкеры і SVG мусяць адразу ўкладвацца ў ліміт.';
  }

  @override
  String get guildSettingsStickerAddTitle => 'Дадаць стыкер';

  @override
  String get guildSettingsStickerEditTitle => 'Рэдагаваць стыкер';

  @override
  String get guildSettingsStickerNameLabel => 'Імя';

  @override
  String get guildSettingsStickerNameHint => 'Мой выдатны стыкер';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Апісанне';

  @override
  String get guildSettingsStickerDescriptionHint => 'Апішыце стыкер';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Тэгі ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Дадаць тэг';

  @override
  String get guildSettingsStickerTagAdd => 'Дадаць';

  @override
  String get guildSettingsStickerNameRequired => 'Патрэбна назва';

  @override
  String get guildSettingsStickerNameTooShort =>
      'Назва мусіць змяшчаць не менш за 2 сімвалы';

  @override
  String get guildSettingsStickerNameTooLong =>
      'Назва павінна змяшчаць не больш за 30 сімвалаў';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'Апісанне павінна змяшчаць не больш за 500 сімвалаў';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'Не ўдалося стварыць гэты стыкер';

  @override
  String get guildSettingsStickerDeleteTitle => 'Выдаліць стыкер';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'Выдаліць «$name»? Гэта нельга адмяніць.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Выдаліць гэты стыкер са сховішча і CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Не ўдалося выдаліць гэты стыкер';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Каб стварыць вэб-хук, адкрыйце $channelSettingsPath. Тут можна рэдагаваць і ўпарадкоўваць усе наяўныя вэб-хукі.';
  }

  @override
  String get guildSettingsBannedUsersTitle => 'Забаненыя карыстальнікі';

  @override
  String get guildSettingsInvitesTableInviter => 'Хто запрасіў';

  @override
  String get guildSettingsInvitesTableChannel => 'Канал';

  @override
  String get guildSettingsInvitesTableCode => 'Код';

  @override
  String get guildSettingsInvitesTableUses => 'Выкарыстанні';

  @override
  String get guildSettingsInvitesTableCreated => 'Створана';

  @override
  String get guildSettingsInvitesTableExpires => 'Сканчаецца';

  @override
  String get guildSettingsAuditLogFilterUser => 'Фільтраваць па карыстальніку';

  @override
  String get guildSettingsAuditLogFilterAction => 'Фільтраваць па дзеянні';

  @override
  String get createDm => 'Стварыць асабісты чат';

  @override
  String get createGroupDm => 'Стварыць групавы чат';

  @override
  String get createDmNewMessage => 'Новае паведамленне';

  @override
  String get createDmSelectFriends => 'Выбраць сяброў';

  @override
  String get createDmChooseFriendsSubtitle =>
      'Выберыце сяброў, якім хочаце напісаць.';

  @override
  String get createDmSearchFriends => 'Пошук сяброў';

  @override
  String get createDmNoFriendsFound => 'Сябры не знойдзены';

  @override
  String get createDmNoFriendsYet => 'У вас пакуль няма сяброў';

  @override
  String get createDmClaimToStartDms =>
      'Каб пісаць асабістыя паведамленні, замацуйце за сабой уліковы запіс.';

  @override
  String get createDmVerifyToStartDms =>
      'Каб пісаць асабістыя паведамленні, пацвердзіце электронную пошту.';

  @override
  String get createDmVerifyYourEmail => 'Пацвердзіце электронную пошту';

  @override
  String get createDmNewGroup => 'Новая група';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Стварыць новую групу з $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'Пацвердзіць новую групу';

  @override
  String get createDmCreateNewGroup => 'Стварыць новую групу';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'Прыбраць $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'У вас ужо ёсць група з гэтымі карыстальнікамі. Сапраўды хочаце стварыць новую? Гэта таксама можна!';

  @override
  String get createDmNoActivityYet => 'Пакуль няма актыўнасці';

  @override
  String get createDmSomeUsersCantBeAdded =>
      'Некаторых карыстальнікаў нельга дадаць';

  @override
  String get createDmCreateWithoutThem => 'Стварыць без іх';

  @override
  String get createDmUnaddableIntro =>
      'Гэтых людзей нельга дадаць у гэты групавы чат:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Стварыць групавы чат з астатнімі ўдзельнікамі ($count) і прапусціць іншых?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Не засталося атрымальнікаў, з якімі можна стварыць групавы чат.';

  @override
  String get createDmUnaddableUserNotFound => 'Карыстальнік не знойдзены';

  @override
  String get createDmUnaddableBlocked => 'Гэтаму карыстальніку нельга напісаць';

  @override
  String get createDmUnaddableNotFriends => 'Не ў вашым спісе сяброў';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Не дазваляе дадаваць сябе ў групавыя чаты';

  @override
  String get dmListMessagesTitle => 'Паведамленні';

  @override
  String get dmListDirectMessagesTitle => 'Асабістыя паведамленні';

  @override
  String get dmListFriendsButton => 'Сябры';

  @override
  String get keybindsSearchShortcuts => 'Пошук спалучэнняў клавіш';

  @override
  String get keybindSectionDefaults => 'Прадвызначаныя';

  @override
  String get keybindSectionMessages => 'Паведамленні';

  @override
  String get keybindSectionNavigation => 'Навігацыя';

  @override
  String get keybindSectionDragAndDrop => 'Перацягванне';

  @override
  String get keybindSectionChat => 'Чат';

  @override
  String get keybindSectionVoiceAndVideo => 'Гук і відэа';

  @override
  String get keybindSectionMisc => 'Рознае';

  @override
  String get keybindActionShowShortcutsList =>
      'Паказаць спіс спалучэнняў клавіш';

  @override
  String get keybindActionCopyText => 'Скапіраваць тэкст';

  @override
  String get keybindActionMarkUnread => 'Пазначыць як непрачытанае';

  @override
  String get keybindActionFocusTextarea => 'Перавесці фокус на тэкставае поле';

  @override
  String get keybindActionSwitchCommunities => 'Пераключацца паміж суполкамі';

  @override
  String get keybindActionSwitchChannels => 'Пераключацца паміж каналамі';

  @override
  String get keybindActionHistoryBack =>
      'Назад па гісторыі прагледжаных каналаў';

  @override
  String get keybindActionHistoryForward =>
      'Наперад па гісторыі прагледжаных каналаў';

  @override
  String get keybindActionJumpUnreadChannels =>
      'Пераходзіць паміж непрачытанымі каналамі';

  @override
  String get keybindActionJumpMentionChannels =>
      'Пераходзіць паміж непрачытанымі каналамі са згадваннямі';

  @override
  String get keybindActionJumpCurrentCall => 'Перайсці да цяперашняга выкліку';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Пераключацца паміж апошняй суполкай і асабістымі чатамі';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Перайсці да папярэдняй суполкі або асабістых чатаў';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Перайсці да наступнай суполкі або асабістых чатаў';

  @override
  String get keybindActionGoToDms => 'Перайсці да асабістых паведамленняў';

  @override
  String get keybindActionGoToFirstCommunity => 'Перайсці ў першую суполку';

  @override
  String get keybindActionGoToSecondCommunity => 'Перайсці ў другую суполку';

  @override
  String get keybindActionGoToThirdCommunity => 'Перайсці ў трэцюю суполку';

  @override
  String get keybindActionGoToFourthCommunity => 'Перайсці ў чацвёртую суполку';

  @override
  String get keybindActionGoToFifthCommunity => 'Перайсці ў пятую суполку';

  @override
  String get keybindActionGoToSixthCommunity => 'Перайсці ў шостую суполку';

  @override
  String get keybindActionGoToSeventhCommunity => 'Перайсці ў сёмую суполку';

  @override
  String get keybindActionGoToEighthCommunity => 'Перайсці ў восьмую суполку';

  @override
  String get keybindActionToggleQuickSwitcher =>
      'Адкрыць або закрыць хуткі пераключальнік';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'Стварыць суполку або далучыцца да наяўнай';

  @override
  String get keybindActionStartDragAndDrop => 'Пачаць перацягванне';

  @override
  String get keybindActionMove => 'Перамясціць';

  @override
  String get keybindActionDropItem => 'Апусціць элемент';

  @override
  String get keybindActionCancel => 'Скасаваць';

  @override
  String get keybindActionMarkCommunityRead =>
      'Пазначыць суполку як прачытаную';

  @override
  String get keybindActionMarkChannelRead => 'Пазначыць канал як прачытаны';

  @override
  String get keybindActionStartGroupDm => 'Стварыць групавы чат';

  @override
  String get keybindActionTogglePinnedMessages =>
      'Паказаць або схаваць замацаваныя паведамленні';

  @override
  String get keybindActionToggleInbox => 'Паказаць або схаваць уваходныя';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Пазначыць верхні канал ва ўваходных як прачытаны';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Пазначыць усе каналы ва ўваходных як прачытаныя';

  @override
  String get keybindActionToggleMemberList =>
      'Паказаць або схаваць спіс удзельнікаў або галасавы чат';

  @override
  String get keybindActionToggleEmojiPicker =>
      'Адкрыць або закрыць панэль эмоджы';

  @override
  String get keybindActionToggleGifPicker => 'Адкрыць або закрыць панэль GIF';

  @override
  String get keybindActionToggleStickerPicker =>
      'Адкрыць або закрыць панэль стыкераў';

  @override
  String get keybindActionScrollChatUp => 'Пракруціць чат уверх';

  @override
  String get keybindActionScrollChatDown => 'Пракруціць чат уніз';

  @override
  String get keybindActionJumpOldestUnread =>
      'Перайсці да найстарэйшага непрачытанага паведамлення';

  @override
  String get keybindActionFocusComposer => 'Перавесці фокус на тэкставае поле';

  @override
  String get keybindActionUploadFile => 'Загрузіць файл';

  @override
  String get keybindActionCopyChannelLink => 'Скапіраваць спасылку на канал';

  @override
  String get keybindActionToggleSavedMedia =>
      'Паказаць або схаваць захаваныя медыя';

  @override
  String get keybindActionSendVoiceMessage =>
      'Адправіць галасавое паведамленне';

  @override
  String get keybindActionAnswerCall => 'Адказаць на ўваходны выклік';

  @override
  String get keybindActionDeclineCall => 'Адхіліць уваходны выклік';

  @override
  String get keybindActionStartDmCall =>
      'Пачаць выклік у асабістым або групавым чаце';

  @override
  String get keybindActionToggleSoundboard =>
      'Адкрыць або закрыць гукавую панэль';

  @override
  String get keybindActionToggleCompactCallView =>
      'Разгарнуць або згарнуць кампактны выгляд выкліку';

  @override
  String get keybindActionPushToTalkPriority => 'Рэжым рацыі (прыярытэт)';

  @override
  String get keybindActionVoiceActivityPriority =>
      'Прыярытэт галасавой актыўнасці';

  @override
  String get keybindActionOpenHelp => 'Адкрыць даведку';

  @override
  String get keybindActionSearchMessages => 'Пошук паведамленняў';

  @override
  String get keybindActionOpenContextMenu => 'Адкрыць кантэкстнае меню';

  @override
  String get keybindActionOpenSettings => 'Адкрыць налады';

  @override
  String get keybindActionOpenThemeStudio =>
      'Адкрыць асобнае акно Theme Studio';

  @override
  String get keybindActionZoomIn => 'Павялічыць';

  @override
  String get keybindActionZoomOut => 'Паменшыць';

  @override
  String get keybindActionZoomReset => 'Скінуць маштаб';

  @override
  String get clipboardPasteFailed =>
      'Не ўдалося ўставіць. Буфер абмену пусты або заблакіраваны для гэтай праграмы.';

  @override
  String get homeQuickActionDms => 'АЧ';

  @override
  String get assistantNeedsLogin => 'Спачатку адкрыйце Fluxer і ўвайдзіце.';

  @override
  String get assistantNotInVoice => 'Вы не ў выкліку.';

  @override
  String get assistantNotFound => 'Fluxer не ўдалося гэта знайсці.';

  @override
  String get assistantDmsDisabled =>
      'Асабістыя паведамленні адключаны на гэтым экзэмпляры.';

  @override
  String get assistantFailed => 'Fluxer не ўдалося гэта выканаць.';

  @override
  String get assistantOkMuted => 'Мікрафон выключаны.';

  @override
  String get assistantOkUnmuted => 'Мікрафон уключаны.';

  @override
  String get assistantOkLeftVoice => 'Вы выйшлі з галасавога канала.';

  @override
  String get assistantOkJoinedVoice => 'Падключэнне да галасавога канала.';

  @override
  String get assistantOkStartedCall => 'Пачынаецца выклік.';

  @override
  String assistantOkStatusSet(String status) {
    return 'Статус зменены на «$status».';
  }

  @override
  String get assistantOkOpened => 'Fluxer адкрываецца.';

  @override
  String get assistantOkMessageSent => 'Паведамленне адпраўлена.';

  @override
  String get assistantOkCustomStatusSet => 'Уласны статус абноўлены.';

  @override
  String get assistantOkCustomStatusCleared => 'Уласны статус ачышчаны.';

  @override
  String get guildNavbarAnnouncementChannel => 'Аб’ява';

  @override
  String get guildNavbarAnnouncementChannelDescription =>
      'Публікуйце абнаўленні, на якія могуць падпісвацца іншыя суполкі';

  @override
  String get channelDetailsAnnouncementChannel => 'Канал аб’яў';

  @override
  String get channelSettingsAnnouncementChannel => 'Канал аб’яў';

  @override
  String get channelSettingsAnnouncementChannelDescription =>
      'Дазваляе іншым суполкам падпісвацца на гэты канал і атрымліваць копіі таго, што вы публікуеце.';

  @override
  String get channelSettingsStopAnnouncementTitle => 'Адключыць канал аб’яў?';

  @override
  String channelSettingsStopAnnouncementBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'На гэты канал падпісана $count канала. Калі пераўтварыць яго ў тэкставы канал, гэтыя падпіскі будуць скасаваны.',
      many:
          'На гэты канал падпісана $count каналаў. Калі пераўтварыць яго ў тэкставы канал, гэтыя падпіскі будуць скасаваны.',
      few:
          'На гэты канал падпісаны $count каналы. Калі пераўтварыць яго ў тэкставы канал, гэтыя падпіскі будуць скасаваны.',
      one:
          'На гэты канал падпісаны $count канал. Калі пераўтварыць яго ў тэкставы канал, гэтыя падпіскі будуць скасаваны.',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsStopAnnouncementUnknown =>
      'Калі пераўтварыць гэты канал у тэкставы, будуць прыбраны ўсе падпіскі каналаў на яго.';

  @override
  String get channelSettingsConvertChannel => 'Пераўтварыць';

  @override
  String get channelSettingsConvertFailed =>
      'Не ўдалося пераўтварыць гэты канал';

  @override
  String get channelSettingsChannelHasFollowers =>
      'На гэты канал яшчэ падпісаны іншыя каналы. Перш чым пераўтварыць яго, скасуйце гэтыя падпіскі.';

  @override
  String get channelMenuFollow => 'Падпісацца на канал';

  @override
  String get channelFollowTitle => 'Падпісацца на гэты канал';

  @override
  String get channelFollowBody =>
      'Выберыце, куды будуць трапляць яго апублікаваныя паведамленні. Адпісацца можна ў любы час: Налады суполкі → Вэб-хукі.';

  @override
  String get channelFollowCommunity => 'Суполка';

  @override
  String get channelFollowChannel => 'Канал';

  @override
  String get channelFollowAgeWarning =>
      'Гэта канал з узроставым абмежаваннем. Абнаўленні можна адпраўляць толькі ў каналы з узроставым абмежаваннем.';

  @override
  String get channelFollowContentWarning =>
      'У гэтага канала ёсць папярэджанне аб змесціве. Абнаўленні можна адпраўляць толькі ў каналы з папярэджаннем аб змесціве або ўзроставым абмежаваннем.';

  @override
  String get channelFollowHiddenHint =>
      'Суполкі і каналы, дзе вы не можаце кіраваць вэб-хукамі, схаваны.';

  @override
  String get channelFollowEmpty =>
      'Вы не можаце кіраваць вэб-хукамі ні ў адной суполцы. Папрасіце адміністратара падпісацца на гэты канал.';

  @override
  String get channelFollowSubmit => 'Падпісацца';

  @override
  String get channelFollowFailed => 'Не ўдалося падпісацца на гэты канал.';

  @override
  String get channelFollowSuccessTitle => 'Абнаўленні ўжо ў дарозе!';

  @override
  String channelFollowSuccessBody(String sourceName, String targetName) {
    return 'Паведамленні, апублікаваныя ў $sourceName, будуць з’яўляцца ў #$targetName.';
  }

  @override
  String get channelFollowSuccessDismiss => 'Зразумела!';

  @override
  String get channelFollowBarrier =>
      'Падпішыцеся, каб атрымліваць гэтыя аб’явы ў выбраны вамі канал.';

  @override
  String get channelHeaderFollow => 'Падпісацца на канал';

  @override
  String get chatMessagePublish => 'Апублікаваць';

  @override
  String get chatMessagePublished => 'Апублікавана';

  @override
  String get chatMessagePublishConfirmTitle => 'Апублікаваць паведамленне?';

  @override
  String get chatMessagePublishConfirmBody =>
      'Копія будзе адпраўлена ва ўсе каналы, падпісаныя на гэты.';

  @override
  String get chatMessagePublishedToast => 'Паведамленне апублікавана';

  @override
  String get chatMessageAlreadyPublished =>
      'Гэта паведамленне ўжо апублікавана.';

  @override
  String get chatMessagePublishFailedTitle =>
      'Не ўдалося апублікаваць гэта паведамленне';

  @override
  String get chatMessagePublishFailedBody =>
      'Нешта пайшло не так. Паспрабуйце яшчэ раз праз хвіліну.';

  @override
  String get chatMessagePublishLimitTitle => 'Не так хутка';

  @override
  String chatMessagePublishLimitBody(String duration) {
    return 'Апублікаваць зноў можна будзе праз $duration.';
  }

  @override
  String get chatMessagePublishLimitUnknown =>
      'Вы публікуеце занадта хутка. Паспрабуйце яшчэ раз праз хвіліну.';

  @override
  String get chatMessageDeletePublished =>
      'Таксама будуць выдалены копіі, адпраўленыя ў каналы, падпісаныя на гэты.';

  @override
  String get chatMessageEditPublishedTitle =>
      'Рэдагаваць апублікаванае паведамленне?';

  @override
  String get chatMessageEditPublishedBody =>
      'Таксама будуць абноўлены копіі, адпраўленыя ў каналы, падпісаныя на гэты.';

  @override
  String get chatMessageEditPublishedSave => 'Захаваць';

  @override
  String get chatMessageEditLimitTitle => 'Не так хутка';

  @override
  String chatMessageEditLimitBody(String duration) {
    return 'Рэдагаваць гэта апублікаванае паведамленне зноў можна будзе праз $duration.';
  }

  @override
  String get chatMessageEditLimitUnknown =>
      'Вы рэдагуеце гэта апублікаванае паведамленне занадта хутка. Паспрабуйце яшчэ раз праз хвіліну.';

  @override
  String get chatMessageOriginalDeleted => '[Зыходнае паведамленне выдалена]';

  @override
  String get userTagCommunity => 'Суполка';

  @override
  String systemFollowAdd(String username, String source) {
    return '$username падпісвае гэты канал на $source. Паведамленні, апублікаваныя там, будуць з’яўляцца тут.';
  }

  @override
  String systemPreviewFollowAdd(String username, String source) {
    return '$username падпісвае гэты канал на $source.';
  }

  @override
  String get publishNudgeNotSent => 'Яшчэ не адпраўлена падпісчыкам.';

  @override
  String get publishNudgeHideForever => 'Больш не паказваць';

  @override
  String get publishNudgeDismiss => 'Закрыць';

  @override
  String get channelSettingsFollowedChannels => 'Каналы, на якія ёсць падпіска';

  @override
  String get channelSettingsFollowedChannelsDescription =>
      'Каналы аб’яў, на якія падпісаны гэты канал. Каб больш не атрымліваць копіі, адпішыцеся.';

  @override
  String get guildSettingsFollowedChannelsDescription =>
      'Каналы аб’яў, на якія падпісаны каналы гэтай суполкі.';

  @override
  String channelSettingsFollowedFrom(String guildName, String channelName) {
    return 'З $guildName #$channelName';
  }

  @override
  String get channelSettingsFollowedPaused =>
      'Абнаўленні прыпынены, бо канал-крыніца больш недаступны.';

  @override
  String channelSettingsUnfollowTitle(String name) {
    return 'Адпісацца ад $name?';
  }

  @override
  String get channelSettingsUnfollowBody =>
      'Гэты канал перастане атрымліваць копіі з таго канала аб’яў.';

  @override
  String get channelSettingsUnfollow => 'Адпісацца';

  @override
  String get crosspostCommunityTitle => 'Суполка';

  @override
  String get crosspostGoToCommunity => 'Перайсці ў суполку';

  @override
  String get crosspostJoinCommunity => 'Далучыцца да суполкі';

  @override
  String get crosspostSourceFailed =>
      'Не ўдалося загрузіць гэту суполку. Паспрабуйце яшчэ раз праз хвіліну.';

  @override
  String crosspostMembers(int count) {
    return 'Удзельнікаў: $count';
  }

  @override
  String crosspostOnline(int count) {
    return '$count у сетцы';
  }

  @override
  String durationMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count хвіліны',
      many: '$count хвілін',
      few: '$count хвіліны',
      one: '$count хвіліна',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count секунды',
      many: '$count секунд',
      few: '$count секунды',
      one: '$count секунда',
    );
    return '$_temp0';
  }

  @override
  String get channelUnsupportedTitle => 'Тып канала не падтрымліваецца';

  @override
  String get channelUnsupportedBody =>
      'Гэта версія праграмы не падтрымлівае такі тып канала.';

  @override
  String get channelDetailsUnsupportedChannel => 'Канал не падтрымліваецца';

  @override
  String get forumChannelTypeForum => 'Форум';

  @override
  String get forumChannelTypeForumDescription =>
      'Допісы, упарадкаваныя па тэмах і тэгах';

  @override
  String get forumChannelTypeMedia => 'Медыя';

  @override
  String get forumChannelTypeMediaDescription =>
      'Допісы, пабудаваныя вакол выяў і відэа';

  @override
  String get forumNewPost => 'Новы допіс';

  @override
  String get forumNewMediaPost => 'Новы медыядопіс';

  @override
  String get forumSearchPosts => 'Шукаць допісы';

  @override
  String get forumViewOptions => 'Сартаванне і выгляд';

  @override
  String get forumSearchIndexing =>
      'Пошук для гэтай суполкі яшчэ рыхтуецца. Допісы з’явяцца тут, як толькі ён будзе гатовы.';

  @override
  String get forumNoPosts => 'Пакуль няма допісаў';

  @override
  String get forumNoPostsHint => 'Пачніце размову тут першымі.';

  @override
  String get forumNoSearchResults =>
      'Няма допісаў, якія адпавядаюць вашаму пошуку';

  @override
  String get forumNoSearchResultsHint =>
      'Паспрабуйце іншыя словы або ачысціце фільтр тэгаў.';

  @override
  String get forumCreateFirstPost => 'Стварыце першы допіс';

  @override
  String get forumOlderPosts => 'Старэйшыя допісы';

  @override
  String get forumPostsLoadFailed => 'Не ўдалося загрузіць допісы.';

  @override
  String get forumRetry => 'Паспрабаваць яшчэ раз';

  @override
  String get forumPostPinned => 'Замацавана';

  @override
  String get forumPostLocked => 'Заблакіравана';

  @override
  String get forumPostArchived => 'У архіве';

  @override
  String get forumPostNewBadge => 'Новы';

  @override
  String get forumPostStarterDeleted => 'Зыходнае паведамленне выдалена.';

  @override
  String get forumPostBlockedAuthor =>
      'Допіс ад карыстальніка, якога вы заблакіравалі';

  @override
  String get threadBlockedAuthor =>
      'Галіна ад карыстальніка, якога вы заблакіравалі';

  @override
  String forumPostSnippet(String author, String content) {
    return '$author: $content';
  }

  @override
  String forumPostNewMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count новага паведамлення',
      many: '$count новых паведамленняў',
      few: '$count новыя паведамленні',
      one: '$count новае паведамленне',
    );
    return '$_temp0';
  }

  @override
  String forumPostNewMessagesShort(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count новага',
      many: '$count новых',
      few: '$count новыя',
      one: '$count новае',
    );
    return '$_temp0';
  }

  @override
  String get forumPostHasNewMessagesShort => 'Новае';

  @override
  String get forumPostHasNewMessages => 'Новыя паведамленні';

  @override
  String get forumPostReact => 'Дадаць прадвызначаную рэакцыю';

  @override
  String get forumOpenPost => 'Адкрыць допіс';

  @override
  String get forumEditTags => 'Рэдагаваць тэгі';

  @override
  String get forumSaveTags => 'Захаваць тэгі';

  @override
  String forumTagsLimitHint(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Выберыце не больш за $count тэга.',
      many: 'Выберыце не больш за $count тэгаў.',
      few: 'Выберыце не больш за $count тэгі.',
      one: 'Выберыце не больш за $count тэг.',
    );
    return '$_temp0';
  }

  @override
  String get forumPinPost => 'Замацаваць допіс';

  @override
  String get forumUnpinPost => 'Адмацаваць допіс';

  @override
  String get forumMarkPostRead => 'Пазначыць як прачытанае';

  @override
  String get forumReportPost => 'Паскардзіцца на допіс';

  @override
  String get forumCopyPostLink => 'Скапіраваць спасылку';

  @override
  String get forumPostGuidelines => 'Правілы допісаў';

  @override
  String get forumGuidelinesPlaceholder =>
      'Раскажыце, што тут публікаваць і як гэта рабіць.';

  @override
  String get forumPostTitle => 'Назва';

  @override
  String get forumPostMessage => 'Паведамленне';

  @override
  String get forumPostMessagePlaceholder =>
      'Напішыце першае паведамленне свайго допісу';

  @override
  String get forumPostMediaPlaceholder => 'Дадайце подпіс';

  @override
  String get forumPostTags => 'Тэгі';

  @override
  String get forumPostTagsRequired => 'Тэгі (абавязкова)';

  @override
  String get forumPostAddMedia => 'Дадаць медыя';

  @override
  String get forumPostAddFile => 'Дадаць файл';

  @override
  String get forumPostRemoveAttachment => 'Прыбраць далучэнне';

  @override
  String get forumPostSubmit => 'Апублікаваць';

  @override
  String get forumPostTitleRequired => 'Дайце свайму допісу назву.';

  @override
  String get forumPostMediaRequired =>
      'Каб апублікаваць тут, дадайце хаця б адну выяву або відэа.';

  @override
  String get forumPostContentRequired =>
      'Напішыце паведамленне або дадайце файл.';

  @override
  String get forumSortLatestActivity => 'Нядаўна актыўныя';

  @override
  String get forumSortCreationTime => 'Дата публікацыі';

  @override
  String get forumLayoutList => 'Спіс';

  @override
  String get forumLayoutGallery => 'Галерэя';

  @override
  String get forumNewPostsUnread => 'Пазначаць новыя допісы як непрачытаныя';

  @override
  String get forumNewPostsUnreadDescription =>
      'Пазначаць гэты канал як непрачытаны, калі хтосьці стварае допіс.';

  @override
  String get forumPostSlowmode => 'Павольны рэжым для допісаў';

  @override
  String forumPostSlowmodeDescription(String bypassSlowmodePermissionLabel) {
    return 'Інтэрвал паміж стварэннем допісаў. Удзельнікі з дазволам «$bypassSlowmodePermissionLabel» могуць яго абыходзіць.';
  }

  @override
  String get forumMessageSlowmode => 'Павольны рэжым паведамленняў у допісах';

  @override
  String get forumMessageSlowmodeDescription =>
      'Павольны рэжым для паведамленняў у новых допісах.';

  @override
  String get forumDefaultAutoArchive => 'Хаваць пасля бяздзейнасці';

  @override
  String get forumDefaultAutoArchiveDescription =>
      'Новыя допісы архівуюцца пасля такога перыяду без актыўнасці.';

  @override
  String get forumDefaultReaction => 'Прадвызначаная рэакцыя';

  @override
  String get forumSetDefaultReaction => 'Выбраць эмоджы';

  @override
  String get forumChangeDefaultReaction => 'Змяніць';

  @override
  String get forumRemoveDefaultReaction => 'Прыбраць';

  @override
  String get forumDefaultSortOrder => 'Прадвызначаны парадак сартавання';

  @override
  String get forumDefaultLayout => 'Прадвызначаны макет';

  @override
  String get forumTagMatchSetting => 'Фільтр па тэгах';

  @override
  String get forumTagMatchSome => 'Супадае з любым выбраным тэгам';

  @override
  String get forumTagMatchAll => 'Супадае з усімі выбранымі тэгамі';

  @override
  String get forumRequireTag => 'Патрабаваць тэгі';

  @override
  String get forumRequireTagDescription =>
      'Пры стварэнні допісу трэба выбраць хаця б адзін тэг.';

  @override
  String get forumHideMediaDownloads => 'Хаваць параметры спампоўкі медыя';

  @override
  String get forumHideMediaDownloadsDescription =>
      'Схаваць спампоўку, адкрыццё ў браўзеры і капіраванне спасылкі для выяў і відэа ў допісах.';

  @override
  String forumTagsTitle(int count, int max) {
    return 'Тэгі ($count/$max)';
  }

  @override
  String get forumTagsDescription =>
      'Тэгі дапамагаюць знаходзіць і фільтраваць допісы. Мадэраваныя тэгі могуць ставіць толькі мадэратары.';

  @override
  String get forumCreateTag => 'Стварыць тэг';

  @override
  String get forumEditTag => 'Рэдагаваць тэг';

  @override
  String get forumSaveTag => 'Захаваць тэг';

  @override
  String get forumDeleteTag => 'Выдаліць тэг';

  @override
  String get forumTagName => 'Назва тэга';

  @override
  String get forumTagEmoji => 'Эмоджы';

  @override
  String get forumTagRemoveEmoji => 'Прыбраць эмоджы';

  @override
  String get forumTagModerated => 'Ставіць могуць толькі мадэратары';

  @override
  String get forumTagModeratedDescription =>
      'Ставіць і прыбіраць гэты тэг могуць толькі ўдзельнікі, якія могуць кіраваць галінамі.';

  @override
  String get forumTagModeratedBadge => 'Мадэраваны';

  @override
  String forumPostCooldown(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'Апублікаваць зноў можна будзе праз $seconds секунды.',
      many: 'Апублікаваць зноў можна будзе праз $seconds секунд.',
      few: 'Апублікаваць зноў можна будзе праз $seconds секунды.',
      one: 'Апублікаваць зноў можна будзе праз $seconds секунду.',
    );
    return '$_temp0';
  }

  @override
  String get voiceP2pStartTitle => 'Пачаць у рэжыме P2P?';

  @override
  String voiceP2pStartDescription(int maxParticipants) {
    return 'Аўдыя і відэа перадаюцца напрамую паміж удзельнікамі з меншай затрымкай. Іншыя ўдзельнікі бачаць ваш IP-адрас. Удзельнічаць могуць да $maxParticipants чалавек. Хто не можа падключыцца напрамую, не зможа ўдзельнічаць, пакуль хтосьці не пераключыць выклік на стандартны.';
  }

  @override
  String get voiceP2pStartConfirm => 'Пачаць у рэжыме P2P';

  @override
  String get voiceP2pStartStandard => 'Пачаць звычайны выклік';

  @override
  String get voiceP2pJoinTitle => 'Далучыцца да P2P-выкліку?';

  @override
  String voiceP2pJoinDescription(int maxParticipants) {
    return 'Гэты выклік злучае ўдзельнікаў напрамую. Іншыя ўдзельнікі бачаць ваш IP-адрас. Удзельнічаць могуць да $maxParticipants чалавек. Калі вы не можаце падключыцца напрамую, вы не зможаце ўдзельнічаць, пакуль хтосьці не пераключыць выклік на стандартны.';
  }

  @override
  String voiceP2pPinnedJoinDescription(int maxParticipants) {
    return 'У гэтым канале дазволены толькі P2P-выклікі. Удзельнікі злучаюцца напрамую і бачаць ваш IP-адрас. Удзельнічаць могуць да $maxParticipants чалавек. Калі вы не можаце падключыцца напрамую, вы не зможаце ўдзельнічаць.';
  }

  @override
  String get voiceP2pJoinConfirm => 'Далучыцца';

  @override
  String get voiceP2pAlwaysAgreeLabel => 'Больш не пытаць, заўсёды згаджацца';

  @override
  String get voiceP2pAlwaysAgreeSettingLabel =>
      'Заўсёды пагаджацца далучацца да P2P-выклікаў';

  @override
  String get voiceP2pAlwaysAgreeSettingDescription =>
      'Далучацца да P2P-выклікаў без пацвярджэння. Іншыя ўдзельнікі бачаць ваш IP-адрас.';

  @override
  String get voiceP2pIndicatorLabel => 'P2P';

  @override
  String get voiceP2pIndicatorDescription =>
      'Прамое злучэнне. Медыя шыфруюцца паміж удзельнікамі.';

  @override
  String get voiceP2pSwitchToStandard => 'Перайсці на звычайны выклік';

  @override
  String get voiceP2pSwitchToStandardDescription =>
      'Усе ўдзельнікі выкліку пяройдуць на стандартны выклік праз сервер.';

  @override
  String get voiceP2pPeerFailedDescription =>
      'Не ўдалося ўсталяваць прамое злучэнне. Выйдзіце з выкліку або пераключыце ўсіх на стандартны выклік.';

  @override
  String get voiceP2pUnavailableError => 'P2P-выклікі зараз недаступныя.';

  @override
  String get voiceP2pConsentRequiredError =>
      'Гэта P2P-выклік, і каб далучыцца, патрэбна ваша згода.';

  @override
  String get voiceChannelFullError => 'Гэты выклік запоўнены.';

  @override
  String get voiceP2pScreenShareUnavailable =>
      'У P2P-выкліках дэманстрацыя экрана з гэтай прылады недаступная.';

  @override
  String get channelMenuJoinP2p => 'Пачаць P2P-выклік';

  @override
  String get channelSettingsRtcP2pLabel => 'Толькі P2P-выклікі';

  @override
  String channelSettingsRtcP2pDescription(int maxParticipants) {
    return 'Удзельнікі злучаюцца напрамую і бачаць IP-адрасы адно аднаго. Перад далучэннем кожны павінен даць згоду. Удзельнічаць могуць да $maxParticipants чалавек.';
  }

  @override
  String voiceP2pPeerFailedTitle(String name) {
    return 'Не ўдаецца злучыцца напрамую з $name';
  }

  @override
  String get favoritesRenameCategory => 'Перайменаваць катэгорыю';

  @override
  String get friendAcceptFailedTitle => 'Не ўдалося прыняць запыт у сябры';

  @override
  String get friendAcceptUnavailable =>
      'Гэты запыт у сябры больш недаступны. Абнавіце старонку і паспрабуйце яшчэ раз.';

  @override
  String get friendAcceptClaimToAccept =>
      'Завяршыце рэгістрацыю, каб прымаць запыты ў сябры.';

  @override
  String get friendAcceptFailedMessage =>
      'Не ўдалося прыняць запыт у сябры. Паспрабуйце яшчэ раз.';

  @override
  String get friendCancelFailedTitle => 'Не ўдалося скасаваць запыт у сябры';

  @override
  String get friendIgnoreFailedTitle =>
      'Не ўдалося праігнараваць запыт у сябры';

  @override
  String get friendIgnoreFailedMessage =>
      'Не ўдалося праігнараваць запыт у сябры. Паспрабуйце яшчэ раз.';

  @override
  String get friendRemoveFailedTitle => 'Не ўдалося выдаліць з сяброў';

  @override
  String get friendRemoveFailedMessage =>
      'Не ўдалося выдаліць гэтага сябра. Паспрабуйце яшчэ раз.';

  @override
  String get userBlockFailedTitle => 'Не ўдалося заблакіраваць карыстальніка';

  @override
  String get userBlockSystemAccount =>
      'Гэты ўліковы запіс нельга заблакіраваць.';

  @override
  String get userBlockFailedMessage =>
      'Не ўдалося заблакіраваць гэтага карыстальніка. Паспрабуйце яшчэ раз.';

  @override
  String get userUnblockFailedTitle =>
      'Не ўдалося разблакіраваць карыстальніка';

  @override
  String get userUnblockFailedMessage =>
      'Не ўдалося разблакіраваць гэтага карыстальніка. Паспрабуйце яшчэ раз.';

  @override
  String friendCancelRequestConfirmDescription(String userName) {
    return 'Скасаваць запыт у сябры для $userName?';
  }

  @override
  String get errorSomethingWentWrongTitle => 'Штосьці пайшло не так';

  @override
  String get errorUnexpectedTryAgain =>
      'Адбылася нечаканая памылка. Паспрабуйце яшчэ раз.';

  @override
  String get errorTwoFactorRequiredTitle =>
      'Патрэбна двухфактарная аўтэнтыфікацыя';

  @override
  String get errorTwoFactorRequiredMessage =>
      'Гэта суполка патрабуе двухфактарнай аўтэнтыфікацыі для дзеянняў мадэрацыі. Каб працягнуць, наладзьце 2FA для свайго ўліковага запісу.';

  @override
  String get errorTwoFactorRequiredSetUp => 'Наладзіць 2FA';

  @override
  String get memberRolesUpdateFailed =>
      'Не ўдалося абнавіць ролі гэтага ўдзельніка. Паспрабуйце яшчэ раз.';

  @override
  String get errorMessagingPausedTitle => 'Адпраўка паведамленняў прыпынена';

  @override
  String get errorMessagingPausedMessage =>
      'Адпраўка паведамленняў у вашым уліковым запісе прыпынена. Праверце электронную пошту: каб працягнуць, трэба зрабіць адзін хуткі крок.';

  @override
  String get errorFeatureDisabledTitle => 'Функцыя часова адключана';

  @override
  String get errorFeatureDisabledMessage =>
      'Гэта функцыя прыпынена. Паспрабуйце пазней.';

  @override
  String get dmErrorStartConversationTitle => 'Не ўдалося пачаць гэту размову';

  @override
  String get dmErrorCannotMessageMessage =>
      'Магчыма, гэты чалавек не прымае ад вас паведамленні або ў вас больш няма агульнай суполкі.';

  @override
  String get dmErrorUnknownUserMessage =>
      'Гэтага карыстальніка больш не існуе. Абнавіце старонку і паспрабуйце яшчэ раз.';

  @override
  String get dmErrorClaimMessage =>
      'Каб пачаць асабістую перапіску, трэба замацаваць за сабой уліковы запіс.';

  @override
  String get dmErrorVerifyEmailMessage =>
      'Каб пачаць асабісты чат, пацвердзіце адрас электроннай пошты.';

  @override
  String get dmErrorTooManyRecipientsTitle =>
      'У гэтай групе занадта шмат людзей';

  @override
  String get dmErrorTooManyRecipientsMessage =>
      'Вы дадалі больш людзей, чым дазваляе групавы чат. Выдаліце некалькі і паспрабуйце яшчэ раз.';

  @override
  String get dmErrorMaxGroupDmsTitle => 'Вы дасягнулі ліміту групавых чатаў';

  @override
  String get dmErrorMaxGroupDmsMessage =>
      'У вас або ў кагосьці з тых, каго вы дадаяце, ужо адкрыта максімальная колькасць групавых чатаў. Пакіньце адзін і паспрабуйце яшчэ раз.';

  @override
  String get groupDmAddFailedTitle => 'Не ўдалося дадаць у групу';

  @override
  String get groupDmInviteFailedTitle =>
      'Не ўдалося стварыць спасылку-запрашэнне';

  @override
  String get dmCloseFailedTitle => 'Не ўдалося закрыць асабісты чат';

  @override
  String get groupDmLeaveFailedTitle => 'Не ўдалося пакінуць групу';

  @override
  String get inviteJoinFailedTitle => 'Не ўдалося далучыцца да суполкі';

  @override
  String get inviteErrorPausedMessage =>
      'Адміністратары прыпынілі запрашэнні, таму зараз далучыцца нельга.';

  @override
  String get inviteErrorAtCapacityTitle => 'Суполка запоўнена';

  @override
  String get inviteErrorAtCapacityMessage =>
      'Суполка дасягнула максімальнай колькасці ўдзельнікаў і зараз не прымае новых.';

  @override
  String get inviteErrorPresenceTitle => 'Патрэбна падключэнне да шлюза';

  @override
  String get inviteErrorPresenceMessage =>
      'Для часовых запрашэнняў патрэбна актыўнае злучэнне. Праверце яго і паспрабуйце яшчэ раз.';

  @override
  String get inviteErrorBannedTitle => 'У вас бан';

  @override
  String get inviteErrorBannedMessage =>
      'У гэтай суполцы ў вас бан, таму далучыцца нельга.';

  @override
  String get inviteErrorIpBannedTitle => 'Ваш IP-адрас забанены';

  @override
  String get inviteErrorIpBannedMessage =>
      'Ваш IP-адрас забанены ў гэтай суполцы, і вы не можаце далучыцца.';

  @override
  String get inviteErrorClaimTitle => 'Патрэбна пацвярджэнне ўліковага запісу';

  @override
  String get inviteErrorClaimMessage =>
      'Спачатку дадайце да ўліковага запісу электронную пошту і пароль.';

  @override
  String get leaveCommunityFailedTitle => 'Не ўдалося пакінуць суполку';

  @override
  String get leaveCommunityFailedMessage =>
      'Зараз не ўдалося выйсці. Паспрабуйце яшчэ раз праз хвіліну.';

  @override
  String get chatSendFailedTitle => 'Ваша паведамленне не адпраўлена';

  @override
  String get chatSendFailedMessage =>
      'Паспрабуйце адправіць паведамленне яшчэ раз.';

  @override
  String get chatSendTooQuickTitle =>
      'Вы адпраўляеце паведамленні занадта хутка';

  @override
  String get chatRateLimitedMessage =>
      'Не так хутка: пачакайце крыху, перш чым паспрабаваць зноў.';

  @override
  String get chatMatureContentTitle => 'Змесціва для дарослых забаронена';

  @override
  String get chatMatureContentGuildMessage =>
      'Гэты канал не пазначаны як канал са змесцівам для дарослых. Змесціва для дарослых можна адпраўляць толькі ў такія каналы. Калі трэба, папрасіце мадэратара змяніць наладу канала.';

  @override
  String chatMatureContentDmMessage(String settingsPath) {
    return 'Вы або ваш суразмоўца вырашылі блакіраваць адчувальныя медыя ў асабістых паведамленнях. Кожны з вас можа змяніць гэта ў раздзеле $settingsPath.';
  }

  @override
  String get chatMatureContentGroupDmMessage =>
      'Гэта група не пазначана як група са змесцівам для дарослых. Уладальнік групы можа ўключыць «Змесціва для дарослых» у наладах групы, калі ўсім удзельнікам 18 гадоў або больш.';

  @override
  String get chatFileTooLargeTitle => 'Файл занадта вялікі';

  @override
  String chatFileTooLargeMessage(String maxSize) {
    return 'Адзін або некалькі файлаў, якія вы спрабуеце загрузіць, перавышаюць максімальны памер $maxSize на файл.';
  }

  @override
  String get chatHeavyTitle => 'Ого, гэта цяжка';

  @override
  String get chatReactionsHeavyMessage =>
      'Гэта вельмі «цяжкае» паведамленне. Каб дадаць новыя рэакцыі, спачатку трэба прыбраць некаторыя.';

  @override
  String get chatReactionTimedOut =>
      'Пакуль у вас тайм-аўт, дадаваць новыя рэакцыі нельга.';

  @override
  String chatTooManyAttachmentsMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файла',
      many: '$count файлаў',
      few: '$count файлы',
      one: '$count файл',
    );
    return 'За адзін раз можна загрузіць не больш за $_temp0. Паспрабуйце яшчэ раз з меншай колькасцю файлаў.';
  }

  @override
  String get chatEditTooQuickTitle => 'Вы рэдагуеце паведамленні занадта хутка';

  @override
  String get chatEditFailedMessage =>
      'Паспрабуйце адрэдагаваць паведамленне яшчэ раз.';

  @override
  String get chatDeleteTooQuickTitle =>
      'Вы выдаляеце паведамленні занадта хутка';

  @override
  String get chatDeleteTooQuickMessage =>
      'Пачакайце крыху, перш чым выдаляць іншыя паведамленні.';

  @override
  String get chatDeleteFailedTitle => 'Не ўдалося выдаліць паведамленне';

  @override
  String get chatDeleteFailedMessage =>
      'Паспрабуйце выдаліць гэта паведамленне яшчэ раз.';

  @override
  String get chatAttachmentDeleteFailedTitle => 'Не ўдалося выдаліць далучэнне';

  @override
  String get chatAttachmentDeleteFailedMessage =>
      'Паспрабуйце выдаліць гэта далучэнне яшчэ раз.';

  @override
  String get chatAltTextFailedTitle =>
      'Не ўдалося абнавіць альтэрнатыўны тэкст';

  @override
  String get chatAltTextUnknownMessage => 'Гэтага паведамлення больш няма.';

  @override
  String get chatAltTextNoPermission =>
      'Вы не можаце рэдагаваць гэта паведамленне.';

  @override
  String get chatAltTextUnavailable =>
      'Рэдагаванне часова недаступнае. Паспрабуйце пазней.';

  @override
  String get chatAltTextFailedMessage =>
      'Не ўдалося абнавіць альтэрнатыўны тэкст. Паспрабуйце яшчэ раз.';

  @override
  String get chatPinFailedTitle => 'Не ўдалося замацаваць паведамленне';

  @override
  String get chatUnpinFailedTitle => 'Не ўдалося адмацаваць паведамленне';

  @override
  String get chatPinFailedMessage =>
      'Штосьці пайшло не так. Паспрабуйце пазней.';

  @override
  String get chatPinBlockedMessage =>
      'Зараз вы не можаце ўзаемадзейнічаць з гэтым карыстальнікам.';

  @override
  String get bookmarkLimitTitle => 'Дасягнуты ліміт закладак';

  @override
  String bookmarkLimitMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count закладкі',
      many: '$count закладак',
      few: '$count закладкі',
      one: '$count закладка',
    );
    return 'У вас ужо $_temp0. Выдаліце адну, каб дадаць новую.';
  }

  @override
  String get savedMediaLimitTitle => 'Дасягнуты ліміт захаваных медыя';

  @override
  String savedMediaLimitMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файла',
      many: '$count файлаў',
      few: '$count файлы',
      one: '$count файл',
    );
    return 'Вы дасягнулі ліміту захаваных медыя: $_temp0. Выдаліце адзін, каб дадаць новы.';
  }

  @override
  String get errorContentBlockedTitle => 'Змесціва заблакіравана';

  @override
  String get errorContentBlockedMessage =>
      'Ваша дзеянне не выканана, бо яго пазначылі нашы сістэмы бяспекі. Калі вы лічыце, што гэта памылка, звярніцеся ў службу падтрымкі.';

  @override
  String get errorContentBlockedSelfHostedMessage =>
      'Ваша дзеянне не выканана, бо яго пазначылі нашы сістэмы бяспекі. Калі вы лічыце, што гэта памылка, звярніцеся да адміністратараў гэтага экзэмпляра.';

  @override
  String get channelDeletedToast => 'Канал выдалены';

  @override
  String get categoryDeletedToast => 'Катэгорыя выдалена';

  @override
  String get channelDeleteNoPermissionTitle => 'Вы не можаце гэта выдаліць';

  @override
  String get channelDeleteNoPermissionChannel =>
      'У вас няма дазволу выдаляць гэты канал.';

  @override
  String get channelDeleteNoPermissionCategory =>
      'У вас няма дазволу выдаляць гэту катэгорыю.';

  @override
  String get channelDeleteAlreadyDeletedTitle => 'Ужо выдалена';

  @override
  String get channelDeleteAlreadyDeletedChannel =>
      'Гэтага канала больш няма. Магчыма, яго ўжо выдалілі.';

  @override
  String get channelDeleteAlreadyDeletedCategory =>
      'Гэтай катэгорыі больш няма. Магчыма, яе ўжо выдалілі.';

  @override
  String get channelDeleteFailedChannelTitle =>
      'Не ўдалося выдаліць гэты канал';

  @override
  String get channelDeleteFailedCategoryTitle =>
      'Не ўдалося выдаліць гэту катэгорыю';

  @override
  String get channelPermissionsUpdateFailedTitle =>
      'Не ўдалося абнавіць дазволы канала';

  @override
  String get channelSettingsSaveFailedTitle =>
      'Не ўдалося захаваць налады канала';

  @override
  String get emojiSlotsFullTitle => 'Няма вольных месцаў для эмоджы';

  @override
  String get stickerSlotsFullTitle => 'Няма вольных месцаў для стыкераў';

  @override
  String get emojiSomeFailedMessage =>
      'Праверце гэтыя файлы і паспрабуйце яшчэ раз з меншымі або прасцейшымі выявамі.';

  @override
  String get emojiNameInvalidCharacters =>
      'Назвы эмоджы могуць змяшчаць толькі літары, лічбы і знакі падкрэслівання.';

  @override
  String get emojiErrorGoneTitle => 'Гэтага эмоджы больш няма';

  @override
  String get emojiRenameGoneMessage =>
      'Магчыма, яго выдалілі. Назва вернута да ранейшай.';

  @override
  String get emojiRenameNoPermissionTitle =>
      'Вы не можаце перайменаваць гэта эмоджы';

  @override
  String get emojiRenameNoPermissionMessage =>
      'У вас няма дазволу пераймяноўваць гэта эмоджы. Назва вернута да ранейшай.';

  @override
  String get emojiRenameRateLimitedMessage =>
      'Пачакайце крыху і паспрабуйце перайменаваць яшчэ раз.';

  @override
  String get emojiRenameFailedMessage =>
      'Назва вернута да ранейшай. Паспрабуйце яшчэ раз праз хвіліну.';

  @override
  String get emojiDeleteGoneMessage => 'Падобна, яго ўжо выдалілі.';

  @override
  String get emojiDeleteNoPermissionTitle =>
      'Вы не можаце выдаліць гэта эмоджы';

  @override
  String get emojiDeleteNoPermissionMessage =>
      'У вас няма дазволу выдаляць гэта эмоджы.';

  @override
  String get emojiDeleteRateLimitedMessage =>
      'Пачакайце крыху і паспрабуйце выдаліць яшчэ раз.';

  @override
  String get stickerTooLargeTitle => 'Стыкер занадта вялікі';

  @override
  String stickerTooLargeMessage(String maxSize) {
    return 'Сэрвіс загрузкі адхіліў гэты стыкер як большы за $maxSize. Паспрабуйце меншы файл, прасцейшую выяву або карацейшую анімацыю.';
  }

  @override
  String get stickerCreateFailedMessage =>
      'Пры падрыхтоўцы гэтага стыкера штосьці пайшло не так. Паспрабуйце іншы файл або паўтарыце спробу праз хвіліну.';

  @override
  String get stickerUpdateFailedTitle => 'Не ўдалося абнавіць гэты стыкер';

  @override
  String get moderationTimeoutFailed =>
      'Не ўдалося даць удзельніку тайм-аўт. Паспрабуйце яшчэ раз.';

  @override
  String get moderationRemoveTimeoutFailed =>
      'Не ўдалося зняць тайм-аўт. Паспрабуйце яшчэ раз.';

  @override
  String get moderationKickFailed =>
      'Не ўдалося выгнаць удзельніка. Паспрабуйце яшчэ раз.';

  @override
  String get moderationBanFailed =>
      'Не ўдалося забаніць удзельніка. Паспрабуйце яшчэ раз.';

  @override
  String get transferOwnershipFailedTitle =>
      'Не ўдалося перадаць правы ўладальніка';

  @override
  String transferOwnershipFailedMessage(String username) {
    return 'Зараз не ўдалося перадаць правы ўладальніка карыстальніку $username.';
  }

  @override
  String get revokeBanFailedTitle => 'Не ўдалося зняць бан';

  @override
  String get voiceModerationNoPermissionTitle => 'Вы не можаце гэтага зрабіць';

  @override
  String get voiceModerationNoPermissionMessage =>
      'У вас няма дазволу рабіць гэта з гэтым удзельнікам.';

  @override
  String get voiceModerationLeftTitle => 'Удзельніка ўжо няма ў выкліку';

  @override
  String get voiceModerationLeftMessage =>
      'Гэты ўдзельнік больш не падключаны да галасавога канала.';

  @override
  String get voiceModerationUnknownMemberTitle => 'Удзельнік не знойдзены';

  @override
  String get voiceModerationUnknownMemberMessage =>
      'Гэтага ўдзельніка больш няма ў суполцы. Абнавіце старонку і паспрабуйце яшчэ раз.';

  @override
  String get voiceJoinTimedOut => 'Пакуль у вас тайм-аўт, далучацца нельга.';

  @override
  String get voiceJoinClaimAccount =>
      'Каб далучыцца да гэтага галасавога канала, замацуйце за сабой уліковы запіс.';

  @override
  String get voiceJoinClaimAccountDirectCall =>
      'Каб пачынаць асабістыя выклікі або далучацца да іх, замацуйце за сабой уліковы запіс.';

  @override
  String get voiceJoinUserLimit =>
      'Гэты галасавы канал дасягнуў ліміту карыстальнікаў. Паспрабуйце пазней або далучыцеся да іншага канала.';

  @override
  String get voiceJoinConnectionLimit =>
      'Вы дасягнулі ліміту падключэнняў да гэтага галасавога канала.';

  @override
  String get voiceJoinChannelUnavailable =>
      'Гэты галасавы канал больш недаступны.';

  @override
  String get avatarUploadFailedTitle => 'Не ўдалося загрузіць аватар';

  @override
  String get bannerUploadFailedTitle => 'Не ўдалося загрузіць банер';

  @override
  String get animatedImageUseStatic => 'Загрузіце замест яе статычную выяву.';

  @override
  String get passkeyDeleteFailedTitle => 'Не ўдалося выдаліць ключ доступу';

  @override
  String get premiumPaymentsUnavailableTitle => 'Плацяжы недаступныя';

  @override
  String get premiumPaymentsUnavailableMessage =>
      'Плацяжы часова недаступныя. Паспрабуйце яшчэ раз праз хвіліну.';

  @override
  String get premiumNoSubscriptionTitle => 'Няма актыўнай падпіскі';

  @override
  String get premiumNoSubscriptionMessage =>
      'На гэтым уліковым запісе не знойдзена актыўнай падпіскі. Абнавіце старонку і паспрабуйце яшчэ раз.';

  @override
  String get premiumAlreadyCancelingTitle => 'Скасаванне ўжо запланавана';

  @override
  String get premiumAlreadyCancelingMessage =>
      'Скасаванне вашай падпіскі ўжо запланавана на канец плацежнага перыяду.';

  @override
  String get premiumNotCancelingTitle => 'Скасаванне падпіскі не запланавана';

  @override
  String get premiumNotCancelingMessage =>
      'Скасаванне вашай падпіскі не запланавана, таму аднаўляць няма чаго.';

  @override
  String get premiumCancelFailedTitle => 'Не ўдалося скасаваць падпіску';

  @override
  String get premiumCancelFailedMessage =>
      'Пры скасаванні падпіскі штосьці пайшло не так. Паспрабуйце яшчэ раз праз хвіліну.';

  @override
  String get premiumReactivateFailedTitle => 'Не ўдалося аднавіць падпіску';

  @override
  String get premiumReactivateFailedMessage =>
      'Пры аднаўленні падпіскі штосьці пайшло не так. Паспрабуйце яшчэ раз праз хвіліну.';

  @override
  String get premiumRefundConfirmTitle => 'Вярнуць грошы за апошнюю пакупку?';

  @override
  String get premiumRefundConfirmBody =>
      'Грошы за ваш апошні рахунак будуць вернуты, а звязаная з ім падпіска — скасавана. Наступныя 30 дзён вярнуць грошы самастойна яшчэ раз будзе нельга.';

  @override
  String get premiumRefundConfirm => 'Вярнуць грошы за пакупку';

  @override
  String get premiumRefundIssuedToast =>
      'Вяртанне грошай аформлена. Грошы могуць паступіць на працягу некалькіх рабочых дзён.';

  @override
  String get premiumRefundOutsideWindowTitle => 'Тэрмін вяртання грошай мінуў';

  @override
  String get premiumRefundOutsideWindowMessage =>
      'Ваша апошняя пакупка ўжо па-за тэрмінам вяртання грошай. Па пытаннях аплаты звяртайцеся ў службу падтрымкі.';

  @override
  String get premiumRefundCooldownTitle => 'Вы нядаўна ўжо вярталі грошы';

  @override
  String get premiumRefundCooldownMessage =>
      'Вы ўжо нядаўна самастойна вярталі грошы. Зноў вярнуць грошы можна будзе пасля перыяду чакання.';

  @override
  String get premiumRefundNothingTitle => 'Няма чаго вяртаць';

  @override
  String get premiumRefundNothingMessage =>
      'На гэтым уліковым запісе не знойдзена нядаўняй пакупкі, за якую можна вярнуць грошы.';

  @override
  String get premiumRefundFailedTitle =>
      'Не ўдалося вярнуць грошы за гэту пакупку';

  @override
  String get premiumRefundFailedMessage =>
      'Пры вяртанні грошай штосьці пайшло не так. Калі гэта паўтараецца, звярніцеся ў службу падтрымкі.';

  @override
  String get premiumVerifyEmailTitle =>
      'Спачатку пацвердзіце электронную пошту';

  @override
  String premiumVerifyEmailBody(String productName) {
    return 'Каб купіць $productName, пацвердзіце адрас электроннай пошты.';
  }

  @override
  String get premiumCheckoutBlockedTitle => 'Афармленне заказу недаступнае';

  @override
  String premiumCheckoutBlockedBody(String supportEmail) {
    return 'Афармленне заказу для гэтага ўліковага запісу заблакіравана. Калі патрэбна дапамога, напішыце на $supportEmail.';
  }

  @override
  String get premiumCheckoutBlockedBodySelfHosted =>
      'Афармленне заказу для гэтага ўліковага запісу заблакіравана.';

  @override
  String splashGatewayUnreachable(String domain) {
    return 'Не ўдаецца падключыцца да $domain. Праверце злучэнне з інтэрнэтам і паспрабуйце яшчэ раз.';
  }

  @override
  String get appLockSettingTitle => 'Блакіроўка праграмы';

  @override
  String get appLockConfigure => 'Наладзіць';

  @override
  String get appLockSettingDescription =>
      'Fluxer будзе пытацца ваш PIN-код, калі праграма прабудзе ў фоне выбраны вамі час. Блакіроўка дзейнічае для ўсіх уліковых запісаў на гэтай прыладзе.';

  @override
  String get appLockTimeoutLabel => 'Блакіраваць праз';

  @override
  String get appLockTimeoutImmediately => 'Адразу';

  @override
  String get appLockTimeoutThirtySeconds => '30 секунд';

  @override
  String get appLockTimeoutOneMinute => '1 хвіліна';

  @override
  String get appLockTimeoutFiveMinutes => '5 хвілін';

  @override
  String get appLockTimeoutFifteenMinutes => '15 хвілін';

  @override
  String get appLockTimeoutOneHour => '1 гадзіна';

  @override
  String get appLockTurnOff => 'Выключыць блакіроўку праграмы';

  @override
  String get appLockTurnOffConfirmTitle => 'Выключыць блакіроўку праграмы?';

  @override
  String get appLockTurnOffConfirmBody =>
      'Fluxer будзе адкрывацца без PIN-кода.';

  @override
  String get appLockEnterCurrentPinTitle => 'Увядзіце PIN-код';

  @override
  String appLockEnterCurrentPinSubtitle(int digits) {
    return 'Каб працягнуць, увядзіце цяперашні PIN-код (колькасць лічбаў: $digits).';
  }

  @override
  String get appLockSetPinTitle => 'Задайце PIN-код';

  @override
  String appLockCreatePinSubtitle(int digits) {
    return 'Прыдумайце PIN-код з такой колькасці лічбаў: $digits.';
  }

  @override
  String get appLockConfirmPinSubtitle =>
      'Увядзіце PIN-код яшчэ раз для пацвярджэння';

  @override
  String get appLockPinMismatch =>
      'PIN-коды не супадаюць. Паспрабуйце яшчэ раз.';

  @override
  String get appLockTooManyAttemptsShort =>
      'Занадта шмат спроб. Пачакайце, перш чым паспрабаваць зноў.';

  @override
  String get appLockUnlockTitle => 'Разблакіраваць Fluxer';

  @override
  String appLockUnlockSubtitlePin(int digits) {
    return 'Увядзіце PIN-код (колькасць лічбаў: $digits)';
  }

  @override
  String appLockCooldownMessage(String time) {
    return 'Занадта шмат спроб. Паспрабуйце яшчэ раз праз $time.';
  }

  @override
  String get appLockWrongPin => 'Няправільны PIN-код';

  @override
  String get appLockForgotPin => 'Забылі PIN-код? Выйдзіце';

  @override
  String get appLockSignOutConfirmTitle =>
      'Выйсці і выключыць блакіроўку праграмы?';

  @override
  String get appLockSignOutConfirmBody =>
      'З усіх уліковых запісаў на гэтай прыладзе будзе выкананы выхад, а блакіроўка праграмы будзе выключана.';

  @override
  String get appLockBiometricReason => 'Разблакіраваць Fluxer';

  @override
  String get appLockPinFieldLabel => 'PIN-код';

  @override
  String get appLockBiometricFailed => 'Не супала. Паспрабуйце яшчэ раз.';

  @override
  String get appLockBiometricFaceId => 'Face ID';

  @override
  String get appLockBiometricFaceUnlock => 'распазнаванне твару';

  @override
  String get appLockBiometricFingerprint => 'адбітак пальца';

  @override
  String get appLockBiometricTouchId => 'Touch ID';

  @override
  String get appLockBiometricGeneric => 'біяметрычныя даныя';

  @override
  String appLockUseBiometric(String method) {
    return 'Скарыстаць $method';
  }

  @override
  String appLockUnlockSubtitleWithBiometric(String method) {
    return 'Скарыстайце $method або ўвядзіце PIN-код';
  }

  @override
  String appLockBiometricSwitchLabel(String method) {
    return 'Разблакіраваць праз $method';
  }

  @override
  String get appLockSetPinButton => 'Задаць PIN-код';

  @override
  String get appLockChangePinButton => 'Змяніць PIN-код';

  @override
  String get appLockRowDescription => 'Патрабаваць PIN-код для адкрыцця Fluxer';

  @override
  String appLockRowDescriptionEnabled(String duration) {
    return 'Уключана. Блакіруецца пасля $duration у фоне.';
  }

  @override
  String get appLockRowDescriptionEnabledImmediately =>
      'Уключана. Блакіруецца адразу, як толькі вы выходзіце з Fluxer.';

  @override
  String appLockRowDescriptionWithBiometric(String method) {
    return 'Патрабаваць PIN-код або $method для адкрыцця Fluxer';
  }

  @override
  String get appLockBiometricSwitchHint => 'PIN-код таксама працуе';

  @override
  String appLockBiometricEither(String first, String second) {
    return '$first або $second';
  }

  @override
  String get voiceDiagnosticsCopy => 'Скапіраваць галасавую дыягностыку';

  @override
  String get voiceDiagnosticsCopyDescription =>
      'Падзяліцеся з распрацоўшчыкамі, каб дапамагчы выправіць праблемы з выклікамі';

  @override
  String get voiceDiagnosticsCopied =>
      'Дыягностыка галасавой сувязі скапіравана ў буфер абмену';

  @override
  String get voiceDiagnosticsInCallHint => 'У выкліку';

  @override
  String get oxygenUpdateAvailable => 'Ёсць абнаўленне';

  @override
  String get oxygenUpdating => 'Абнаўленне…';

  @override
  String oxygenUpdatingProgress(int percent) {
    return 'Абнаўленне… $percent%';
  }

  @override
  String get desktopDownloadsView => 'View downloads';

  @override
  String desktopDownloadsViewActive(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString downloads in progress',
      one: '$countString download in progress',
    );
    return 'View downloads. $_temp0';
  }

  @override
  String get desktopDownloadsTitle => 'Downloads';

  @override
  String get desktopDownloadsClear => 'Clear list';

  @override
  String get desktopDownloadsShowInFolder => 'Show in folder';

  @override
  String get desktopDownloadsCancel => 'Cancel download';

  @override
  String get desktopDownloadsRemove => 'Remove from list';

  @override
  String get desktopDownloadsCompleted => 'Completed';

  @override
  String get desktopDownloadsCancelled =>
      'Cancelled. The partial file was deleted.';

  @override
  String get desktopDownloadsFileMissing => 'The file was moved or deleted.';

  @override
  String get desktopDownloadsFailed => 'Failed';

  @override
  String get desktopDownloadsStarting => 'Starting';

  @override
  String desktopDownloadsProgress(String progress, String total) {
    return '$progress of $total';
  }

  @override
  String get desktopDownloadCompleteToast => 'Download complete';

  @override
  String desktopTrayShow(String productName) {
    return 'Паказаць $productName';
  }

  @override
  String desktopTrayHide(String productName) {
    return 'Схаваць $productName';
  }

  @override
  String desktopBadgeUnreadMessages(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Непрачытаныя паведамленні: $countString';
  }

  @override
  String get desktopTrayOpenSettings => 'Адкрыць налады';

  @override
  String get desktopTrayStatus => 'Статус';

  @override
  String get desktopTrayAccounts => 'Уліковыя запісы';

  @override
  String get desktopTrayMuteMic => 'Выключыць мікрафон';

  @override
  String get desktopTrayUnmuteMic => 'Уключыць мікрафон';

  @override
  String get desktopTrayDeafen => 'Выключыць гук';

  @override
  String get desktopTrayUndeafen => 'Уключыць гук';

  @override
  String desktopTrayDisconnectFrom(String channel) {
    return 'Адключыцца ад $channel';
  }

  @override
  String get desktopTrayDisconnectVoice => 'Адключыцца ад галасавога канала';

  @override
  String get desktopTrayCheckForUpdates => 'Праверыць абнаўленні';

  @override
  String desktopTrayUpdateNow(String productName) {
    return 'Абнавіць $productName зараз';
  }

  @override
  String get desktopTrayCopyBuildInfo => 'Скапіраваць звесткі пра зборку';

  @override
  String desktopTrayRestart(String productName) {
    return 'Перазапусціць $productName';
  }

  @override
  String desktopTrayQuit(String productName) {
    return 'Выйсці з $productName';
  }

  @override
  String get userSettingsNavDesktop => 'Камп’ютар';

  @override
  String get desktopSettingsWindowSectionTitle => 'Акно настольнай праграмы';

  @override
  String get desktopSettingsShowTrayIcon => 'Паказваць значок у сістэмным трэі';

  @override
  String get desktopSettingsShowMenuBarIcon => 'Паказваць значок у радку меню';

  @override
  String get desktopSettingsMinimizeToTray => 'Згортваць у трэй';

  @override
  String get desktopSettingsMinimizeToMenuBar => 'Згортваць у радок меню';

  @override
  String get desktopSettingsCloseToTray => 'Закрываць у трэй';

  @override
  String get desktopSettingsCloseToMenuBar => 'Закрываць у радок меню';

  @override
  String get desktopSettingsLaunchAtLogin => 'Launch at login';

  @override
  String get desktopSettingsStartMinimized => 'Start minimized';

  @override
  String get desktopSettingsStartMinimizedTrayDescription =>
      'When launched at login, start in the system tray instead of opening the window';

  @override
  String get desktopSettingsStartMinimizedMenuBarDescription =>
      'When launched at login, start in the menu bar instead of opening the window';

  @override
  String get desktopSettingsRememberWindowState =>
      'Remember window size and position';

  @override
  String get desktopSettingsColoredTrayIcon => 'Use colored tray icon';

  @override
  String get desktopSettingsColoredTrayIconDescription =>
      'Show the full-color icon instead of a monochrome one that matches your taskbar.';

  @override
  String get desktopSettingsUnreadLauncherBadge =>
      'Badge the app icon for unread messages';

  @override
  String get desktopSettingsUnreadLauncherBadgeDescription =>
      'Linux taskbars can only show a number, so unread messages without mentions show as 1. Mentions always show their count.';

  @override
  String get desktopSettingsDarkTaskbarBadge => 'Use dark taskbar badge';

  @override
  String get desktopSettingsDarkTaskbarBadgeDescription =>
      'Draw the unread badge on the taskbar button in dark gray instead of red.';

  @override
  String get desktopSettingsUseNativeTitleBar => 'Use native title bar';

  @override
  String get desktopSettingsRestartRequiredDescription =>
      'Takes effect after you restart the app.';

  @override
  String get desktopSettingsTrayIconColorTitle => 'Tray icon color';

  @override
  String get desktopSettingsTrayIconColorColoredNotice =>
      'Turn off the colored tray icon to choose a color here.';

  @override
  String get desktopSettingsTrayIconColorAuto => 'Match the taskbar';

  @override
  String get desktopSettingsTrayIconColorAutoDescription =>
      'Pick white or black from the color of your taskbar or panel.';

  @override
  String get desktopSettingsTrayIconColorWhite => 'White';

  @override
  String get desktopSettingsTrayIconColorBlack => 'Black';

  @override
  String get desktopBadgeUnreadMessagesNoCount => 'Unread messages';

  @override
  String get notificationsUnreadMessageBadgeLabel =>
      'Enable unread message badge';

  @override
  String get keybindActionPushToTalk => 'Push to talk';

  @override
  String get keybindActionPushToMute => 'Push to mute';

  @override
  String get keybindActionToggleVoiceActivity =>
      'Toggle voice activity / push-to-talk';

  @override
  String get keybindRecorderSemanticLabel => 'Record keybind';

  @override
  String get keybindRecorderRecording => 'Press a key combination…';

  @override
  String get keybindRecorderUnassigned => 'Not assigned';

  @override
  String get keybindsCustomSectionTitle => 'Custom keybinds';

  @override
  String get keybindsCustomSectionDescription =>
      'Add your own keybinds. A custom keybind replaces the built-in shortcut for the same action.';

  @override
  String get keybindsAddKeybind => 'Add keybind';

  @override
  String get keybindsRemoveKeybind => 'Remove keybind';

  @override
  String get keybindsChooseAction => 'Choose an action';

  @override
  String get keybindsDisableBuiltinLabel => 'Disable built-in shortcuts';

  @override
  String get keybindsDisableBuiltinDescription =>
      'Only your custom keybinds will work.';

  @override
  String get keybindsSyncAcrossDevicesLabel => 'Sync keybinds across devices';

  @override
  String get keybindsSyncAcrossDevicesDescription =>
      'Use the same custom keybinds and push-to-talk settings on every device signed in to this account.';

  @override
  String get audioAndVideoInputModeTitle => 'Input mode';

  @override
  String get audioAndVideoPushToTalkLabel => 'Push-to-talk';

  @override
  String get audioAndVideoPushToTalkDescription =>
      'Your microphone only transmits while you hold the push-to-talk key and the app is focused.';

  @override
  String get audioAndVideoPushToTalkKeybindLabel => 'Push-to-talk keybind';

  @override
  String get audioAndVideoReleaseDelayLabel => 'Release delay';

  @override
  String get audioAndVideoReleaseDelayDescription =>
      'How long your microphone stays on after you let go of the key.';

  @override
  String audioAndVideoReleaseDelayMilliseconds(int milliseconds) {
    return '$milliseconds ms';
  }

  @override
  String audioAndVideoReleaseDelaySeconds(String seconds) {
    return '$seconds s';
  }

  @override
  String get audioAndVideoAutoActivityThresholdLabel =>
      'Auto-set activity threshold';

  @override
  String get audioAndVideoAutoActivityThresholdDescription =>
      'Turn off to choose how loud you need to be before your microphone transmits.';

  @override
  String get audioAndVideoActivityThresholdLabel => 'Activity threshold';

  @override
  String get audioAndVideoActivityThresholdDescription =>
      'Your microphone transmits when your input is above this level. Use the mic test to check your levels.';

  @override
  String get audioAndVideoShowConnectionIdsLabel => 'Show connection IDs';

  @override
  String get audioAndVideoShowConnectionIdsDescription =>
      'Show the connection ID in the voice connection panel, useful when reporting call problems.';

  @override
  String get advancedSettingDisableScreenSharePipLabel =>
      'Disable picture-in-picture popout for screen shares';

  @override
  String get advancedSettingScreenShareAv1OptInLabel =>
      'Allow AV1 screen sharing';

  @override
  String get advancedSettingScreenShareHevcOptInLabel =>
      'Allow H.265 (HEVC) screen sharing';

  @override
  String get advancedSettingScreenShareOptInDescription =>
      'Off by default because it may cause compatibility issues for viewers.';

  @override
  String get entranceSoundSectionTitle => 'Entrance sound';

  @override
  String get entranceSoundSectionDescription =>
      'Play a short sound for everyone when you join a voice channel.';

  @override
  String get entranceSoundUnavailable =>
      'Custom entrance sounds aren\'t available on your account.';

  @override
  String get entranceSoundLoadFailed => 'Couldn\'t load your entrance sounds.';

  @override
  String get entranceSoundUploadFailed =>
      'Couldn\'t upload that sound. Use an MP3, OGG, M4A or WAV clip up to 5.2 seconds.';

  @override
  String get entranceSoundUpdateFailed =>
      'Couldn\'t update your entrance sound.';

  @override
  String get entranceSoundTooLarge => 'That file is larger than 1 MB.';

  @override
  String get entranceSoundAppliesTo => 'Applies to';

  @override
  String get entranceSoundScopeGlobal => 'All communities and DMs';

  @override
  String get entranceSoundScopeGlobalDescription =>
      'Used by default unless a community or DM sound overrides it.';

  @override
  String get entranceSoundScopeGuilds => 'All communities';

  @override
  String get entranceSoundScopeGuildsDescription =>
      'Used in communities that do not have their own sound.';

  @override
  String get entranceSoundScopeDms => 'Direct messages';

  @override
  String get entranceSoundScopeDmsDescription =>
      'Used for all direct-message calls.';

  @override
  String get entranceSoundScopeGuildDescription =>
      'Used only in this community.';

  @override
  String get entranceSoundNone => 'No sound';

  @override
  String entranceSoundDuration(String seconds) {
    return '$seconds s';
  }

  @override
  String get entranceSoundPreview => 'Play sound';

  @override
  String get entranceSoundDelete => 'Delete from library';

  @override
  String get entranceSoundUpload => 'Upload new';

  @override
  String entranceSoundLibraryCount(int count, int max) {
    return 'Library: $count of $max';
  }

  @override
  String get streamerModeSectionTitle => 'Streamer mode';

  @override
  String get streamerModeSectionDescription =>
      'Hide personal details and quiet the app while you stream or share your screen.';

  @override
  String get streamerModeEnableLabel => 'Enable streamer mode';

  @override
  String get streamerModeAutoEnableLabel =>
      'Automatically enable streamer mode';

  @override
  String get streamerModeAutoEnableDescription =>
      'Turns on when OBS or XSplit is running.';

  @override
  String get streamerModeHidePersonalLabel => 'Hide personal information';

  @override
  String get streamerModeHidePersonalDescription =>
      'Hides your email, profile connections and notes.';

  @override
  String get streamerModeHideInviteLinksLabel => 'Hide invite links';

  @override
  String get streamerModeHideInviteLinksDescription =>
      'Invite links are hidden but can still be copied.';

  @override
  String get streamerModeDisableSoundsLabel => 'Disable all sound effects';

  @override
  String get streamerModeDisableNotificationsLabel => 'Disable notifications';

  @override
  String get streamerModeNagbarMessage =>
      'Streamer mode is on. Personal details are hidden.';

  @override
  String get streamerModeNagbarDisable => 'Turn off';

  @override
  String get languageAndTimeRegionalFormatTitle => 'Regional format';

  @override
  String get languageAndTimeRegionalFormatDescription =>
      'Dates, times and numbers follow this format. Prices stay in the currency of your billing country.';

  @override
  String get languageAndTimeRegionalFormatSearch => 'Search formats…';

  @override
  String get languageAndTimeRegionalFormatSameAsLanguage => 'Same as language';

  @override
  String get languageAndTimeRegionalFormatSystem => 'System format';

  @override
  String get languageAndTimeDateFormatTitle => 'Date format';

  @override
  String get languageAndTimeDateFormatAuto => 'Auto';

  @override
  String get languageAndTimeDateFormatIso => 'ISO 8601';

  @override
  String get languageAndTimeDateFormatDayFirst => 'Day first';

  @override
  String get languageAndTimeDateFormatMonthFirst => 'Month first';

  @override
  String get languageAndTimeFormatSyncFailed =>
      'Couldn\'t save your format. Try again.';

  @override
  String get advancedSettingSequentialFileSendLabel =>
      'Send file messages in order';

  @override
  String get advancedSettingSequentialFileSendDescription =>
      'Wait for earlier uploads to finish so messages with files arrive in the order you sent them.';

  @override
  String get advancedSettingKeepAttachmentsOnEmptyEditLabel =>
      'Keep attachments when clearing an edit';

  @override
  String get advancedSettingKeepAttachmentsOnEmptyEditDescription =>
      'Saving an edit with no text keeps the attachments instead of doing nothing.';

  @override
  String get advancedSettingDoubleClickActionsLabel =>
      'Double-click a message to edit or reply';

  @override
  String get advancedSettingDoubleClickActionsDescription =>
      'Double-click your own message to edit it, or someone else\'s to reply.';

  @override
  String get messagesMediaConvertEmoticonsLabel => 'Convert emoticons to emoji';

  @override
  String get messagesMediaConvertEmoticonsDescription =>
      'Turns text like :) into 🙂 when you send a message.';

  @override
  String get languageAndTimeSpellcheckTitle => 'Spellcheck';

  @override
  String get languageAndTimeSpellcheckLabel => 'Enable spellcheck';

  @override
  String get languageAndTimeSpellcheckDescription =>
      'Underline misspelled words while you type messages.';

  @override
  String get securityPasskeyTwoFactorLabel =>
      'Require a passkey as your second factor';

  @override
  String get securityPasskeyTwoFactorDescription =>
      'Ask for a passkey after your password when you sign in.';

  @override
  String get securityPasskeyTwoFactorFailed =>
      'Couldn\'t update passkey two-factor authentication.';

  @override
  String get advancedSettingShowHelpButtonLabel => 'Show help center button';

  @override
  String get advancedSettingShowHelpButtonDescription =>
      'Show the question mark button at the bottom of the community list.';

  @override
  String get advancedSettingsCategoryExperimental => 'Experimental';

  @override
  String get advancedSettingHideBlockedMessagesLabel =>
      'Hide messages from blocked users';

  @override
  String get advancedSettingHideBlockedMessagesDescription =>
      'Blocked messages are removed from the chat instead of showing a collapsed row.';

  @override
  String get accessibilityAnimateGifPickerLabel =>
      'Play GIFs in the GIF picker';

  @override
  String get guildVanityUrlTitle => 'Vanity URL';

  @override
  String get guildVanityUrlDescription =>
      'Give your community a custom invite link. Leave it empty to remove it.';

  @override
  String get guildVanityUrlHint => 'your-community';

  @override
  String get guildVanityUrlSave => 'Save';

  @override
  String guildVanityUrlUses(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count uses',
      one: '1 use',
    );
    return '$_temp0';
  }

  @override
  String get guildVanityUrlSaved => 'Vanity URL saved.';

  @override
  String get guildVanityUrlRemoved => 'Your vanity URL has been removed.';

  @override
  String get guildVanityUrlSaveFailed =>
      'Couldn\'t save the vanity URL. It may already be taken.';

  @override
  String get guildVanityUrlLoadFailed =>
      'Failed to load vanity URL. Try again.';

  @override
  String get guildVanityUrlTooShort =>
      'Vanity URL must be at least 2 characters long.';

  @override
  String get guildVanityUrlTooLong =>
      'Vanity URL must be no more than 32 characters long.';

  @override
  String get guildVanityUrlInvalidCharacters =>
      'Vanity URL can only contain letters, numbers and hyphens between them.';

  @override
  String get operatorPassWallTitle => 'Operators\' wall';

  @override
  String get operatorPassWallShowMeLabel => 'Show me on the wall';

  @override
  String get operatorPassWallSendChangesLabel =>
      'Send profile changes to the wall';

  @override
  String get operatorPassWallReleaseListLabel =>
      'Add my name to the yearly Operators list';

  @override
  String get operatorPassWallReleaseListDescription =>
      'Each yearly list goes into the notes of a Fluxer release and a file in its source code. Earlier versions and copies others made can\'t be recalled.';

  @override
  String get operatorPassLabsTitle => 'Fluxer Labs';

  @override
  String get operatorPassLabsDescription =>
      'Your pass opens #operators in Fluxer Labs, where you can talk about self-hosting, bots and the API.';

  @override
  String get operatorPassShowOperatorsLabel => 'Show #operators';

  @override
  String get operatorPassShowOperatorsDescription =>
      'Turning this off takes away your access to #operators until you turn it on again.';

  @override
  String get operatorPassGreetingLabel => 'Welcome me in #operators';

  @override
  String get operatorPassGreetingDescription =>
      'We welcome you by name in #operators once, soon after your pass is delivered or you turn this on.';

  @override
  String get operatorPassUpdateFailed =>
      'Couldn\'t update your Operator Pass settings.';

  @override
  String get macPermissionMicrophone => 'Microphone';

  @override
  String get macPermissionCamera => 'Camera';

  @override
  String get macPermissionScreenRecording => 'Screen Recording';

  @override
  String get macPermissionInputMonitoring => 'Input Monitoring';

  @override
  String get macPermissionMicrophonePurpose => 'Lets people hear you in calls.';

  @override
  String get macPermissionCameraPurpose => 'Lets people see you on video.';

  @override
  String get macPermissionScreenRecordingPurpose =>
      'Lets you share your screen or a window.';

  @override
  String get macPermissionInputMonitoringPurpose =>
      'Lets push-to-talk and keybinds work in other apps.';

  @override
  String get macPermissionAllow => 'Allow';

  @override
  String get macPermissionOpenSystemSettings => 'Open System Settings';

  @override
  String macPermissionQuitPromptAdvice(String productName) {
    return 'If macOS asks to quit and reopen $productName, choose Later.';
  }

  @override
  String get macPermissionAllowed => 'Allowed';

  @override
  String get macPermissionNotAllowed => 'Not allowed';

  @override
  String get macPermissionNotNow => 'Not now';

  @override
  String get macPermissionRelaunchToApply => 'Relaunch to apply';

  @override
  String macPermissionProgress(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String get macPermissionsSettingsTitle => 'macOS permissions';

  @override
  String macPermissionsSettingsDescription(String productName) {
    return 'Review the permissions $productName uses for voice, video, screen sharing, and keybinds.';
  }

  @override
  String audioAndVideoEnablePlatformPermission(String permissionName) {
    return 'Enable $permissionName permission';
  }

  @override
  String audioAndVideoPushToTalkPermissionLimited(
    String productName,
    String permissionName,
  ) {
    return 'Push-to-talk only works while $productName is focused until $permissionName is enabled.';
  }

  @override
  String get audioAndVideoPushToTalkGlobalDescription =>
      'Your microphone only transmits while you hold the push-to-talk key.';

  @override
  String get mediaPermissionBlockedMicrophoneTitle =>
      'Microphone permission required';

  @override
  String get mediaPermissionBlockedCameraTitle => 'Camera permission required';

  @override
  String get mediaPermissionBlockedScreenTitle =>
      'Screen recording permission required';

  @override
  String mediaPermissionBlockedMicrophoneBody(String productName) {
    return '$productName needs access to your microphone. Allow microphone access in your operating system privacy settings and restart the app.';
  }

  @override
  String mediaPermissionBlockedCameraBody(String productName) {
    return '$productName needs access to your camera. Allow camera access in your operating system privacy settings and restart the app.';
  }

  @override
  String mediaPermissionBlockedScreenBody(String productName) {
    return '$productName needs screen recording access. Allow screen recording in your operating system privacy settings and restart the app.';
  }
}
