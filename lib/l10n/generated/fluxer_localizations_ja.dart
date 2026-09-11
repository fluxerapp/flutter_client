// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class FluxerLocalizationsJa extends FluxerLocalizations {
  FluxerLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get reconnectingTitle => '接続に失敗しました！';

  @override
  String get reconnectingBody => 'サーバーに問題が発生しています。\nすぐに修正されるはずです！';

  @override
  String get gatewayReconnectingToast => '再接続中…';

  @override
  String get gatewayConnectedToast => '接続済み';

  @override
  String get sessionExpiredToast => 'セッションの有効期限が切れました。もう一度サインインしてください。';

  @override
  String splashStartupFailed(String error) {
    return '起動に失敗しました: $error';
  }

  @override
  String get retry => '再試行';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => '接続が失われました';

  @override
  String get splashViewOnStatusPage => 'ステータスページで表示';

  @override
  String get splashConnectionIssuesPrompt => '接続に問題がありますか？';

  @override
  String get splashStatusPageLink => 'ステータスページ';

  @override
  String get splashReadIncident => 'インシデントを読む';

  @override
  String get splashIncidentHistory => 'インシデント履歴';

  @override
  String get nagbarLearnMore => '詳細はこちら';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'メンテナンスは$localizedTimeに予定されています。所要時間：$duration。';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'メンテナンス実施中です。所要時間: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'メンテナンスが完了しました。';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return '$displayNameさん、アカウントを認証してアクセス権を失わないようにしましょう。';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return '$displayNameさん、メールアドレスの認証をお願いします。';
  }

  @override
  String get nagbarOpenSettings => '設定を開く';

  @override
  String get systemPermissionSettingsTitle => '権限を有効にする';

  @override
  String get systemPermissionSettingsOpenSettings => '設定を開く';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productNameはマイクにアクセスできません。デバイスのプライバシー設定で有効にできます。';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productNameはカメラにアクセスできません。デバイスのプライバシー設定で有効にできます。';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productNameはフォトライブラリにアクセスできません。デバイスのプライバシー設定で有効にできます。';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName は通知の送信権限がありません。デバイスの設定で有効にできます。';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'サブスクリプションの更新に失敗しましたが、$productName の特典は $graceDate まで引き続きご利用いただけます。今すぐ対応しないと、すべての特典を失います。';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return '$productNameのサブスクリプションが期限切れになりました。特典を維持するには、今すぐ更新してください。';
  }

  @override
  String get nagbarManageSubscription => 'サブスクリプションを管理';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return '$productFullNameへようこそ。$productNameの特典を確認し、サブスクリプションを管理しましょう。';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return '$productName の機能を見る';
  }

  @override
  String get nagbarGiftInventoryOne => 'ギフトインベントリに新しいギフトコードが届いています。';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'ギフトインベントリに $count 件の新しいギフトコードがあります。';
  }

  @override
  String get nagbarViewGiftInventory => 'ギフトを見る';

  @override
  String get nagbarVisionaryMfa => 'Visionary アカウントを保護するために 2 要素認証を有効にしてください。';

  @override
  String get nagbarEnableMfa => '2段階認証を有効にする';

  @override
  String get nagbarTermsAcceptance => '利用規約を更新しました。続行するには、内容を確認して同意してください。';

  @override
  String get nagbarReviewTerms => '利用規約を確認';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'チームとのチャットや最新情報の確認は、$communityNameに参加しましょう。';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return '$communityNameに参加';
  }

  @override
  String get nagbarPushNotification => 'メッセージやメンションを見逃さないように、通知をオンにしましょう。';

  @override
  String get nagbarEnableNotifications => '通知をオンにする';

  @override
  String get nagbarBillingPortalFailed =>
      '請求ポータルを開けませんでした。しばらくしてからもう一度お試しください。';

  @override
  String get welcomeBack => 'おかえりなさい';

  @override
  String get email => 'メールアドレス';

  @override
  String get emailInvalid => '有効なメールアドレスを入力してください。';

  @override
  String get password => 'パスワード';

  @override
  String get forgotPassword => 'パスワードをお忘れですか？';

  @override
  String get logIn => 'ログイン';

  @override
  String get logInWithPasskey => 'パスキーでログイン';

  @override
  String continueWithSso(String provider) {
    return '$providerで続行';
  }

  @override
  String get ssoRequired => 'このインスタンスにアクセスするにはSSOが必要です。';

  @override
  String get organizationSsoProvider => '組織のシングルサインオンプロバイダーでサインインしてください。';

  @override
  String get failedToStartSso => 'SSOの開始に失敗しました';

  @override
  String get ssoCancelled => 'SSOログインがキャンセルされました';

  @override
  String preferSso(String provider) {
    return 'SSOの使用を優先しますか？ $providerで続行してください。';
  }

  @override
  String get logInViaBrowser => 'ブラウザでログイン';

  @override
  String get needAccountPrompt => 'アカウントが必要ですか？ ';

  @override
  String get register => '登録';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => '人間であることを確認';

  @override
  String get captchaDescription => 'あなたがボットではないことを確認する必要があります。以下の認証を完了してください。';

  @override
  String get captchaSwitchToHcaptcha => '問題がありますか？代わりにhCaptchaを試してください';

  @override
  String get captchaSwitchToTurnstile => '代わりにTurnstileを試してください';

  @override
  String get cancel => 'キャンセル';

  @override
  String get ipAuthCheckEmail => 'メールを確認してください';

  @override
  String ipAuthDescription(String email) {
    return 'このログインを承認するためのリンクをメールで送信しました。$emailの受信トレイを開いてください。';
  }

  @override
  String get ipAuthConnectionLost => '接続が失われました';

  @override
  String get ipAuthConnectionLostDescription =>
      '承認を待っている間に接続が失われました。もう一度お試しください。';

  @override
  String get ipAuthLinkExpired => 'サインインリンクが期限切れました';

  @override
  String get ipAuthLinkExpiredDescription => 'この承認リンクは期限切れました。もう一度サインインしてください。';

  @override
  String get ipAuthResendEmail => 'メールを再送信';

  @override
  String get ipAuthResent => '再送信済み';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '$seconds秒';
  }

  @override
  String get back => '戻る';

  @override
  String get next => '次へ';

  @override
  String get mfaTitle => '2要素認証';

  @override
  String get mfaChooseMethod => '認証方法を選択してください';

  @override
  String get mfaMethodTotp => '認証アプリ';

  @override
  String get mfaMethodWebauthn => 'セキュリティキー / パスキー';

  @override
  String get mfaTotpDescription => '認証アプリの6桁のコードまたはバックアップコードのいずれかを入力してください。';

  @override
  String get mfaCodeLabel => 'コード';

  @override
  String get mfaTryAnotherMethod => '別の方法を試す';

  @override
  String get mfaUseSecurityKey => 'セキュリティキーまたはパスキーを試す';

  @override
  String get accountSelectorTitle => 'アカウントを選択';

  @override
  String get accountSelectorDescription =>
      '続行するにはアカウントを選択するか、別のアカウントを追加してください。';

  @override
  String get accountAdd => 'アカウントを追加';

  @override
  String get accountRemove => '削除';

  @override
  String accountRemoveTitle(String username) {
    return '$username を削除';
  }

  @override
  String get accountRemoveDescription => 'このアカウントの保存済みセッションが削除されます。';

  @override
  String get accountRemoveOnlyDescription => 'このデバイスに保存されている唯一のアカウントが削除されます。';

  @override
  String get accountExpired => '期限切れ';

  @override
  String accountSessionExpired(String identifier) {
    return '$identifier のセッションが期限切れました。再度ログインしてください。';
  }

  @override
  String get accountManageTitle => 'アカウントを管理';

  @override
  String get accountSwitchFailed => 'アカウントの切り替えに失敗しました。再試行してください。';

  @override
  String get profileTabMenuSwitchAccounts => 'アカウントを切り替える';

  @override
  String get statusChangeSheetTitle => 'ステータスを設定';

  @override
  String get statusOnlineStatusSection => 'オンラインステータス';

  @override
  String get statusOnline => 'オンライン';

  @override
  String get statusIdle => 'アイドル';

  @override
  String get statusDnd => '取り込み中';

  @override
  String get statusInvisible => 'オフライン表示';

  @override
  String get statusOffline => 'オフライン';

  @override
  String get statusUntilIChangeIt => '変更するまで';

  @override
  String get statusDontClear => 'クリアしない';

  @override
  String get statusFor10Seconds => '10秒間';

  @override
  String get statusClearAfter10Seconds => '10秒';

  @override
  String get statusClearAfter15Minutes => '15分';

  @override
  String get statusClearAfter30Minutes => '30分';

  @override
  String get statusClearAfter1Hour => '1時間';

  @override
  String get statusClearAfter3Hours => '3時間';

  @override
  String get statusClearAfter4Hours => '4時間';

  @override
  String get statusClearAfter8Hours => '8時間';

  @override
  String get statusClearAfter24Hours => '24時間';

  @override
  String get statusClearAfter3Days => '3日';

  @override
  String get statusDndDescription => 'デスクトップで通知は受信しません';

  @override
  String get statusInvisibleDescription => 'オフラインとして表示されます';

  @override
  String get customStatusSetTitle => 'カスタムステータスを設定';

  @override
  String get customStatusCurrentHint => '現在のカスタムステータス';

  @override
  String get customStatusClear => 'カスタムステータスをクリア';

  @override
  String get customStatusPlaceholder => '何してる？';

  @override
  String get customStatusChooseEmoji => '絵文字を選択';

  @override
  String get customStatusClearAfter => 'クリアするタイミング';

  @override
  String get customStatusSave => '保存';

  @override
  String get accountActive => 'アクティブなアカウント';

  @override
  String get signOut => 'サインアウト';

  @override
  String get suspendedPermanentTitle => 'アカウントが永久に停止されました';

  @override
  String get suspendedTemporaryTitle => 'アカウントが停止されました';

  @override
  String get suspendedPermanentDescription => '利用規約への違反により、アカウントは永久に停止されました。';

  @override
  String get suspendedTemporaryDescription =>
      'アカウントは一時的に停止されました。停止期間が終了すると、アカウントにアクセスできるようになります。';

  @override
  String get suspendedIssuedAt => '発行日';

  @override
  String get suspendedEndsAt => '終了日';

  @override
  String get suspendedDuration => '期間';

  @override
  String get suspendedPermanent => '無期限';

  @override
  String get suspendedReason => '理由';

  @override
  String get suspendedAppealDeadline => '異議申し立て期限';

  @override
  String suspendedDeletionWarning(String date) {
    return 'アカウントは$dateに削除される予定です。';
  }

  @override
  String get suspendedRecheck => '更新を確認';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return '$seconds秒後に再確認';
  }

  @override
  String get suspendedBackToLogin => 'ログインに戻る';

  @override
  String get suspendedAppealTitle => '異議申し立て';

  @override
  String get suspendedAppealHint => 'アカウント停止の再検討理由を説明してください（最低50文字）...';

  @override
  String get suspendedAppealSubmit => '異議申し立てを送信';

  @override
  String get suspendedAppealPending => '審査待ち';

  @override
  String get suspendedAppealAccepted => '異議申し立て承認済み';

  @override
  String get suspendedAppealRejected => '異議申し立て却下';

  @override
  String get suspendedAppealAcceptedDescription => '異議申し立てが承認され、アカウントが復元されました。';

  @override
  String get suspendedSignIn => 'アカウントにサインイン';

  @override
  String get forgotPasswordTitle => 'パスワードをお忘れですか？';

  @override
  String get forgotPasswordDescription =>
      'メールアドレスを入力すると、パスワードをリセットするためのリンクをお送りします。';

  @override
  String get forgotPasswordSubmit => 'リセットリンクを送信';

  @override
  String get forgotPasswordSentTitle => 'メールをご確認ください';

  @override
  String get forgotPasswordSentDescription =>
      'パスワードリセットの手順をメールアドレス宛に送信しました。受信トレイを確認し、パスワードをリセットするためのリンクに従ってください。';

  @override
  String get forgotPasswordBackToLogin => 'ログインに戻る';

  @override
  String get resetPasswordTitle => '新しいパスワードを設定';

  @override
  String get resetPasswordDescription =>
      'リセットプロセスを完了するには、以下の新しいパスワードを入力してください。';

  @override
  String get resetPasswordNewPassword => '新しいパスワード';

  @override
  String get resetPasswordConfirm => '新しいパスワードを確認';

  @override
  String get resetPasswordSubmit => 'パスワードをリセット';

  @override
  String get resetPasswordMismatch => 'パスワードが一致しません。';

  @override
  String get registerTitle => 'アカウントを作成';

  @override
  String get registerDisplayName => '表示名（任意）';

  @override
  String get registerDisplayNameHint => 'あなたのことを何と呼びましょうか？';

  @override
  String get registerUsername => 'ユーザー名（任意）';

  @override
  String get registerUsernameHint => '空欄のままにするとランダムなユーザー名になります';

  @override
  String get registerUsernameTagHint => '一意性を確保するため、4桁のタグが自動的に追加されます';

  @override
  String get registerDateOfBirth => '生年月日';

  @override
  String get registerMonth => '月';

  @override
  String get registerDay => '日';

  @override
  String get registerYear => '年';

  @override
  String get registerConsent => '利用規約とプライバシーポリシーに同意します';

  @override
  String get registerConsentPrefix => '同意する';

  @override
  String get registerConsentTerms => '利用規約';

  @override
  String get registerConsentAnd => 'と';

  @override
  String get registerConsentPrivacy => 'プライバシーポリシー';

  @override
  String get registerConfirmPassword => 'パスワードを確認';

  @override
  String get registerSubmit => 'アカウントを作成';

  @override
  String get registerHaveAccount => 'すでにアカウントをお持ちですか？ ';

  @override
  String get registerPendingApproval => 'アカウント申請は承認待ちです。管理者が承認するとサインインできます。';

  @override
  String get registerClosed =>
      '現在、登録は停止されています。アカウントを作成するには、管理者から受け取った登録リンクを使用してください。';

  @override
  String get passkeyNoCredentials =>
      'このアプリのパスキーが見つかりませんでした。代わりにメールとパスワードでログインしてください。';

  @override
  String get passkeyDeviceNotSupported => 'このデバイスではパスキーはサポートされていません。';

  @override
  String get passkeyDomainNotAssociated =>
      'このアプリのパスキーが設定されていません。代わりにメールとパスワードでログインしてください。';

  @override
  String get passkeyTimeout => 'パスキー認証がタイムアウトしました。もう一度お試しください。';

  @override
  String get passkeyNotAvailable =>
      'このアプリではパスキーが利用できません。代わりにメールとパスワードでログインしてください。';

  @override
  String get passkeyFailed => 'パスキー認証に失敗しました。もう一度お試しください。';

  @override
  String get errorUnableToCreateAccount => 'アカウントを作成できませんでした。もう一度お試しください。';

  @override
  String get errorUnableToSignIn => '現在サインインできません。もう一度お試しください。';

  @override
  String get errorServiceUnavailable =>
      'このインスタンスは一時的に利用できません。しばらくしてからもう一度お試しください。';

  @override
  String get errorInvalidEmailOrPassword => 'メールアドレスまたはパスワードが無効です。';

  @override
  String get errorUnableToSendResetLink => 'リセットリンクを送信できませんでした。もう一度お試しください。';

  @override
  String get errorUnableToResetPassword => 'パスワードをリセットできませんでした。もう一度お試しください。';

  @override
  String get embedInviteJoin => 'コミュニティに参加';

  @override
  String get embedInviteGoTo => 'コミュニティへ移動';

  @override
  String embedInviteOnline(String count) {
    return '$count オンライン';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count メンバー';
  }

  @override
  String get embedInviteUnknownTitle => '不明な招待';

  @override
  String get embedInviteUnknownSubtitle => '新しい招待を再度リクエストしてください。';

  @override
  String get embedInviteUnavailable => '招待が無効です';

  @override
  String get embedInviteJoinGroup => 'グループに参加';

  @override
  String get embedInviteAlreadyJoined => '参加済み';

  @override
  String get embedInviteDisabled => '招待が無効です';

  @override
  String get embedInvitePaused => 'このコミュニティへの招待は一時停止されています。';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productNameが攻撃の可能性を検知したため、現在、新しいユーザーは参加できません。';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'このコミュニティは現在、招待を一時停止しています。後でもう一度お試しください。';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productNameがこのコミュニティで潜在的なレイドを検出しました。招待は一時停止されているため、現在新しいユーザーは参加できません。';
  }

  @override
  String get inviteAcceptTitle => '参加のご招待がありました';

  @override
  String get inviteAcceptJoinButton => 'コミュニティに参加';

  @override
  String get inviteAcceptGoToButton => 'コミュニティへ移動';

  @override
  String get inviteAcceptInvitesPaused => '招待が一時停止されています';

  @override
  String get inviteAcceptNotFoundTitle => '招待が無効です';

  @override
  String get inviteAcceptNotFoundDescription => 'この招待は期限切れか無効になっている可能性があります。';

  @override
  String get invalidDeepLinkTitle => 'リンクを開けませんでした';

  @override
  String get invalidDeepLinkDescription =>
      'このリンクは壊れているか、ウェブでのみ利用可能か、アクセス権がない可能性があります。リンクを確認して、もう一度お試しください。';

  @override
  String get invalidDeepLinkGoHomeButton => 'ホームへ';

  @override
  String get inviteAcceptJoinGroupButton => 'グループに参加';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return '$inviterName さんからグループDMへの招待がありました';
  }

  @override
  String get inviteAcceptSomeone => '不明なユーザー';

  @override
  String get inviteAcceptEmojiPack => '絵文字パック';

  @override
  String get inviteAcceptStickerPack => 'スタンプパック';

  @override
  String get inviteAcceptInstallEmojiPack => '絵文字パックをインストール';

  @override
  String get inviteAcceptInstallStickerPack => 'スタンプパックをインストール';

  @override
  String get inviteAcceptPackInstallNote => 'この招待を承認すると、パックが自動的にインストールされます。';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'チャンネルへのアクセスが拒否されました';

  @override
  String get channelAccessDeniedDescription =>
      'このメッセージが送信されたチャンネルへのアクセス権がありません。';

  @override
  String get messageJumpLinkNoAccess => 'アクセス不可';

  @override
  String get okay => 'OK';

  @override
  String get embedThemeTitle => '共有テーマ';

  @override
  String get embedThemeSubtitle => 'このクライアントではカスタムテーマはサポートされていません。';

  @override
  String get embedThemeUnavailableButton => 'テーマは利用できません';

  @override
  String embedGiftVisionaryLifetime(String productName) {
    return 'ビジョナリー（$productName無期限）';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count日間 $productName',
      one: '1日間 $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count週間 $productName',
      one: '1週間 $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countか月間 $productName',
      one: '1か月間 $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count年間の$productName',
      one: '1年間の$productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return '$creatorTagさんから';
  }

  @override
  String get embedGiftClaimHelp => 'ギフトを受け取る!';

  @override
  String get embedGiftAlreadyRedeemed => '使用済み';

  @override
  String get embedGiftClaimAccountHelp => 'ギフトを受け取るにはアカウントを登録してください。';

  @override
  String get embedGiftClaim => 'ギフトを受け取る';

  @override
  String get embedGiftClaimed => 'ギフトを獲得しました';

  @override
  String get embedGiftClaimAccount => 'アカウントを登録して受け取る';

  @override
  String get embedGiftUnknownTitle => '不明なギフト';

  @override
  String get embedGiftUnknownSubtitle => 'このギフトコードは無効であるか、すでに使用されています。';

  @override
  String get embedGiftUnavailable => 'ギフトは利用できません';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return '$productNameサブスクリプションを有効にするために、ギフトを受け取ってください！';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'このギフトはすでに受け取られています。';

  @override
  String get giftAcceptMaybeLater => 'また今度';

  @override
  String get giftRedeemedToast => 'ギフトを交換しました！';

  @override
  String get giftRedeemInvalidTitle => '無効なギフトコード';

  @override
  String get giftRedeemInvalidMessage => 'このコードは無効であるか、既に使用されています。';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'ギフトはすでに使用されています';

  @override
  String get giftRedeemAlreadyRedeemedMessage => 'このコードは既に使用されています。';

  @override
  String get giftRedeemNotFoundTitle => 'ギフトが見つかりません';

  @override
  String get giftRedeemNotFoundMessage => 'このコードは存在しません。';

  @override
  String get giftRedeemFailedTitle => 'ギフトの引き換えに失敗しました';

  @override
  String get giftRedeemFailedMessage => 'ギフトを引き換えできませんでした。もう一度お試しください。';

  @override
  String get giftVisionaryCannotRedeemTitle => 'このギフトは引き換えられません';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'ビジョナリーアカウントでは、Plutoniumギフトを交換できません。代わりに、リンクをコピーして友達と共有してください。';

  @override
  String get giftCopyLink => 'ギフトリンクをコピー';

  @override
  String get privacySettings => 'プライバシー設定';

  @override
  String get privacyDirectMessages => 'ダイレクトメッセージ';

  @override
  String get privacyDirectMessagesDescription =>
      'このコミュニティの他のメンバーからのダイレクトメッセージを許可する';

  @override
  String get privacyBotDirectMessages => 'ボットのダイレクトメッセージ';

  @override
  String get privacyBotDirectMessagesDescription =>
      'このコミュニティのボットからのダイレクトメッセージを許可する';

  @override
  String get privacyMutualDmsDisabled =>
      'コミュニティ管理者は、このコミュニティ内での相互メンバーのみからのダイレクトメッセージの受信を無効にしました。';

  @override
  String get communityDebug => 'コミュニティデバッグ';

  @override
  String get copiedToClipboard => 'クリップボードにコピーしました';

  @override
  String get notificationSettings => '通知設定';

  @override
  String notificationMuteGuild(String guildName) {
    return '$guildName をミュート';
  }

  @override
  String get notificationMuteDescription =>
      'コミュニティをミュートすると、メンションされない限り、未読インジケーターや通知が表示されなくなります';

  @override
  String get notificationCommunitySettings => 'コミュニティ通知設定';

  @override
  String get notificationAllMessages => 'すべてのメッセージ';

  @override
  String get notificationOnlyMentions => 'メンションのみ';

  @override
  String get notificationNothing => 'なし';

  @override
  String get notificationSuppressEveryone => '@everyone および @here のメンションを抑制する';

  @override
  String get notificationSuppressRoles => 'すべてのロールメンションを抑制';

  @override
  String get notificationMobilePush => 'モバイルプッシュ通知';

  @override
  String get notificationOverrides => '通知オーバーライド';

  @override
  String get notificationSelectChannel => 'チャンネルまたはカテゴリを選択';

  @override
  String get notificationOnlyAtMentions => 'メンションのみ';

  @override
  String get notificationMuteChannel => 'チャンネルをミュート';

  @override
  String get notificationUnmuteChannel => 'チャンネルのミュート解除';

  @override
  String get notificationUseCategoryDefault => 'カテゴリのデフォルトを使用';

  @override
  String get notificationUseCommunityDefault => 'コミュニティのデフォルトを使用';

  @override
  String get notificationNoCategory => 'カテゴリなし';

  @override
  String get dmMarkAsRead => '既読にする';

  @override
  String get dmMuteConversation => 'DMをミュート';

  @override
  String get dmUnmuteConversation => 'DMのミュート解除';

  @override
  String get dmPinDm => 'DMをピン留め';

  @override
  String get dmUnpinDm => 'DMのピン留め解除';

  @override
  String get dmAlwaysShowInSidebar => '常にサイドバーに表示';

  @override
  String get dmRemoveFromAlwaysShown => '常に表示から削除';

  @override
  String get dmCloseDm => 'DMを閉じる';

  @override
  String get dmCloseDmConfirmTitle => 'DMを閉じる';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return '$usernameさんとのDMを閉じますか？後でいつでも再開できます。';
  }

  @override
  String get dmDeleteMyMessagesTitle => 'この会話内のメッセージをすべて削除しますか？';

  @override
  String get dmDeleteMyMessagesDescription =>
      'この会話であなたが送信したすべてのメッセージが完全に削除されます。この操作は元に戻せません。';

  @override
  String get dmCopyChannelId => 'チャンネルIDをコピー';

  @override
  String get dmChannelIdCopied => 'チャンネルIDをコピーしました';

  @override
  String get dmCopyUserId => 'ユーザーIDをコピー';

  @override
  String get dmUserIdCopied => 'ユーザーIDをコピーしました';

  @override
  String get dmViewProfile => 'プロフィールを表示';

  @override
  String get dmVoiceCall => 'ボイスコールを開始';

  @override
  String get incomingVoiceCallTitle => '着信ボイスコール';

  @override
  String get incomingVoiceCallAccept => '応答';

  @override
  String get incomingVoiceCallDecline => '拒否';

  @override
  String get incomingVoiceCallLabel => '着信コール';

  @override
  String get incomingVoiceCallIgnore => '無視';

  @override
  String get directVoiceCallNotEligible =>
      'この通話は現在開始できません。しばらくしてからもう一度お試しください。';

  @override
  String get voiceJoinCallFailed => 'この通話に接続できませんでした。接続を確認して、もう一度お試しください。';

  @override
  String get voiceJoinIncomingCallFailed =>
      'この通話に参加できませんでした。接続を確認して、もう一度お試しください。';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'サーバーへのこの通話の更新に失敗しました。接続を確認して、もう一度お試しください。';

  @override
  String get dmAddNote => 'メモを追加';

  @override
  String get dmEditGroup => 'グループDMを編集';

  @override
  String get dmInviteToCommunity => 'コミュニティに招待';

  @override
  String get dmBlock => 'ブロック';

  @override
  String get dmLeaveGroup => 'グループDMを退出';

  @override
  String get dmNoCommunitiesAvailable => 'コミュニティがありません';

  @override
  String dmGroupMemberCount(int count) {
    return '$count人';
  }

  @override
  String get dmMuteFor15Min => '15分間';

  @override
  String get dmMuteFor30Min => '30分間';

  @override
  String get dmMuteFor1Hour => '1時間';

  @override
  String get dmMuteFor3Hours => '3時間';

  @override
  String get dmMuteFor4Hours => '4時間';

  @override
  String get dmMuteFor8Hours => '8時間';

  @override
  String get dmMuteFor24Hours => '24時間';

  @override
  String get dmMuteFor3Days => '3日間';

  @override
  String get dmMuteForever => '再度有効にするまで';

  @override
  String get dmPinGroupDm => 'グループDMをピン留め';

  @override
  String get dmUnpinGroupDm => 'グループDMのピン留めを解除';

  @override
  String get dmUnnamedGroup => '名前のないグループ';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedNameのグループ';
  }

  @override
  String get dmFavoriteDm => 'DMをお気に入りに追加';

  @override
  String get dmUnfavoriteDm => 'DMのお気に入り解除';

  @override
  String get dmFavoriteGroupDm => 'グループDMをお気に入りに追加';

  @override
  String get dmUnfavoriteGroupDm => 'グループDMのお気に入り解除';

  @override
  String get dmChangeFriendNickname => 'フレンドのニックネームを変更';

  @override
  String get dmRemoveFriend => 'フレンドを削除';

  @override
  String get dmAddFriend => 'フレンドを追加';

  @override
  String get dmAcceptFriendRequest => 'フレンドリクエストを承認';

  @override
  String get dmIgnoreFriendRequest => 'フレンドリクエストを無視';

  @override
  String get dmFriendRequestSent => 'フレンドリクエスト送信済み';

  @override
  String get dmUnblock => 'ブロック解除';

  @override
  String get dmDebugUser => 'ユーザーをデバッグ';

  @override
  String get dmDebugChannel => 'チャンネルをデバッグ';

  @override
  String get dmDebugCategory => 'カテゴリーをデバッグ';

  @override
  String get dmPinned => 'DMをピン留めしました';

  @override
  String get dmUnpinned => 'DMのピン留めを解除しました';

  @override
  String get dmMuted => 'DMをミュートしました';

  @override
  String get dmUnmuted => 'DMのミュートを解除しました';

  @override
  String get dmRemoveFriendConfirmTitle => 'フレンドを削除';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return '$usernameさんをフレンドから削除しますか？';
  }

  @override
  String get dmBlockConfirmTitle => 'ユーザーをブロック';

  @override
  String dmBlockConfirmDescription(String username) {
    return '$usernameさんをブロックしますか？メッセージやフレンドリクエストを送れなくなります。';
  }

  @override
  String get dmFriendRequestSentToast => 'フレンドリクエストを送信しました';

  @override
  String get dmFriendRequestFailed => 'フレンドリクエストの送信に失敗しました';

  @override
  String get dmAcceptFriendRequestFailed => 'フレンドリクエストの承認に失敗しました';

  @override
  String get dmRemoveFriendFailed => 'フレンドの削除に失敗しました';

  @override
  String get dmBlockFailed => 'ユーザーのブロックに失敗しました';

  @override
  String get dmUnblockFailed => 'ユーザーのブロック解除に失敗しました';

  @override
  String get dmIgnoreFriendRequestFailed => 'フレンドリクエストの無視に失敗しました';

  @override
  String get dmAddFriends => 'フレンドを追加';

  @override
  String get addFriendSheetTitle => 'フレンドを追加';

  @override
  String get addFriendUsernameHint => 'ユーザー名#0000';

  @override
  String get addFriendUsernameLabel => 'フレンドのユーザー名';

  @override
  String get addFriendSendRequest => 'リクエストを送信';

  @override
  String get addFriendNoUserFound => 'そのユーザー名ではユーザーが見つかりませんでした。';

  @override
  String get addFriendInvalidUsername => '有効なユーザー名（ユーザー名#0000）を入力してください。';

  @override
  String get addFriendOutgoingSuccess => 'フレンドリクエストを送信しました';

  @override
  String get addFriendClaimTitle => 'アカウントを請求';

  @override
  String get addFriendClaimDescription => 'フレンドリクエストを送信するには、アカウントを請求してください。';

  @override
  String get addFriendVerifyTitle => 'メールアドレスを確認';

  @override
  String get addFriendVerifyDescription =>
      'フレンドリクエストを送信する前に、メールアドレスを確認する必要があります。';

  @override
  String get addFriendVerifyEmail => 'メールを確認';

  @override
  String addFriendIncomingRequests(int count) {
    return '受信したフレンドリクエスト ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return '送信済みフレンドリクエスト ($count)';
  }

  @override
  String get addFriendIncomingStatus => '受信したフレンドリクエスト';

  @override
  String get addFriendOutgoingStatus => 'フレンドリクエスト送信済み';

  @override
  String get addFriendViewProfile => 'プロフィールを表示';

  @override
  String get addFriendAccept => '承認';

  @override
  String get addFriendIgnore => '無視';

  @override
  String get addFriendAcceptTitle => 'フレンドリクエストを承認';

  @override
  String get addFriendIgnoreTitle => '友達リクエストを無視';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return '$userNameさんからの友達リクエストを受け入れますか？';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return '$displayNameさんからの友達リクエストを無視しますか？';
  }

  @override
  String get addFriendCancelRequest => 'リクエストをキャンセル';

  @override
  String get addFriendCancelRequestFailed =>
      '友達リクエストをキャンセルできませんでした。もう一度お試しください。';

  @override
  String get addFriendNotAcceptingRequests => '現在、友達リクエストを受け付けていません。';

  @override
  String get addFriendUnblockFirst => '友達リクエストを送信するには、まずブロックを解除してください。';

  @override
  String get addFriendCannotSendToSelf => '自分自身に友達リクエストを送信することはできません。';

  @override
  String get addFriendAlreadyFriends => 'このユーザーとはすでに友達です。';

  @override
  String get addFriendClaimToSend => '友達リクエストを送信するには、サインアップを完了してください。';

  @override
  String get addFriendVerifyToSend => 'フレンドリクエストを送信する前にメールアドレスを確認してください。';

  @override
  String get addFriendFriendsListFull =>
      '友だちリストが上限に達しているか、相手の友だちリストが上限に達しています。誰かを削除してから、もう一度お試しください。';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'システム';

  @override
  String get emojiSearchPlaceholder => '夢の絵文字を探す';

  @override
  String get emojiSearchEmpty => '検索に一致する絵文字はありません';

  @override
  String get emojiAutocompleteDefaultLabel => 'デフォルトの絵文字';

  @override
  String emojiInfoDefaultDescription(String productName) {
    return 'これは$productNameのデフォルトの絵文字です。';
  }

  @override
  String get emojiInfoCustomGuildDescription => 'この絵文字はコミュニティのものです。どこでも使えます。';

  @override
  String get emojiInfoCustomUnknownDescription => 'この絵文字はコミュニティで作成されました。';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'これはコミュニティのカスタム絵文字です。この絵文字を使うには、作者に招待をリクエストしてください。';

  @override
  String get emojiInfoFromHeader => 'この絵文字は';

  @override
  String get emojiInfoDiscoverableCommunity => '見つけやすいコミュニティ';

  @override
  String get emojiInfoPrivateCommunity => '非公開コミュニティ';

  @override
  String get emojiInfoVerifiedCommunity => '認証済みコミュニティ';

  @override
  String get emojiInfoAddToFavorites => 'お気に入りに追加';

  @override
  String get emojiInfoRemoveFromFavorites => 'お気に入りから削除';

  @override
  String get emojiFrequentlyUsed => 'よく使うもの';

  @override
  String get emojiTabGifs => 'GIF';

  @override
  String get emojiTabMedia => 'メディア';

  @override
  String get emojiTabStickers => 'ステッカー';

  @override
  String get emojiTabEmojis => '絵文字';

  @override
  String get gifPickerSearch => 'GIFを検索';

  @override
  String get gifPickerSearchKlipy => 'KLIPYを検索';

  @override
  String get gifPickerSearchTenor => 'Tenorを検索';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'お気に入り';

  @override
  String get gifPickerFavoritesEmptyTitle => 'お気に入りのGIFはまだありません';

  @override
  String get gifPickerFavoritesEmptyDescription => 'GIFにスターを付けて、ここに表示しましょう。';

  @override
  String get gifPickerTrending => '人気のGIF';

  @override
  String get gifPickerNoResultsTitle => '検索結果がありません';

  @override
  String get gifPickerNoResultsDescription => '別の検索語を試してください';

  @override
  String get gifPickerLoadFailedTitle => 'GIFを読み込めませんでした';

  @override
  String get gifPickerLoadFailedBody => '接続を確認して、もう一度お試しください。';

  @override
  String get emojiCategoryPeople => '人';

  @override
  String get emojiCategoryNature => '自然';

  @override
  String get emojiCategoryFood => '食べ物と飲み物';

  @override
  String get emojiCategoryActivity => 'アクティビティ';

  @override
  String get emojiCategoryTravel => '旅行と場所';

  @override
  String get emojiCategoryObjects => 'オブジェクト';

  @override
  String get emojiCategorySymbols => '記号';

  @override
  String get emojiCategoryFlags => 'フラグ';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Plutoniumで$emojiCount個の絵文字を$communityCount個のコミュニティからアンロック。';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Plutoniumを入手';

  @override
  String get emojiPlutoniumUpsellDismiss => 'これを再度表示しない';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'カスタム絵文字#個',
      one: 'カスタム絵文字1個',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'コミュニティ#個',
      one: 'コミュニティ1個',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => '外部リンクに関する警告';

  @override
  String externalLinkWarningLeaving(String productName) {
    return '$productNameを離れようとしています';
  }

  @override
  String get externalLinkWarningDescription => '外部リンクは危険な場合があります。ご注意ください。';

  @override
  String get externalLinkWarningDestinationUrl => '移動先URL:';

  @override
  String get externalLinksSectionTitle => '外部リンク';

  @override
  String get externalLinksSectionDescription => '外部リンク警告の処理方法を設定します。';

  @override
  String get externalLinkWarningTrustPrefix => '常に信頼する ';

  @override
  String get externalLinkWarningTrustSuffix => ' — 次回からこの警告をスキップ';

  @override
  String get externalLinkVisitSite => 'サイトにアクセス';

  @override
  String get externalLinkTrustAllLabel => 'すべての外部リンクを信頼する';

  @override
  String get externalLinkStripTrackingLabel => 'URLからトラッキングパラメータを削除する';

  @override
  String get externalLinkStripTrackingDescription =>
      '送信メッセージ内のURLからトラッキングパラメータ（utm_source、fbclid、gclidなど）を自動的に削除します。リンクが他の人に届く前にクリーニングされます。';

  @override
  String get externalLinkTrustAllConfirmTitle => 'すべての外部リンクを信頼しますか？';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'これにより、すべての外部リンクが信頼され、すべてのドメインの警告がスキップされます。既存の信頼済みドメインは置き換えられます。これは安全性が低くなります。';

  @override
  String get externalLinkTrustAllConfirmAction => 'すべて信頼';

  @override
  String get externalLinkStopTrustingAllTitle => 'すべてのリンクの信頼を停止しますか？';

  @override
  String get externalLinkStopTrustingAllDescription =>
      '外部リンクの警告が再び表示されます。ドメインを個別に信頼済みとして追加する必要があります。';

  @override
  String get externalLinkStopTrustingAllAction => 'すべて信頼を無効にする';

  @override
  String get externalLinkTrustedAllDescription =>
      'すべての外部リンクが信頼されています。警告は表示されません。';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return '$count件の信頼済みドメインがあります。外部リンクにアクセスしたときにチェックボックスをオンにして、さらに追加してください。';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      '有効にすると、外部リンクの警告は表示されません。これは安全性が低くなります。';

  @override
  String get imageFileTooLarge => '画像ファイルが大きすぎます。10MB未満のファイルを選択してください。';

  @override
  String get animatedAvatarsRequirePlutonium => 'アニメーションアバターにはPlutoniumが必要です';

  @override
  String get animatedBannersRequirePlutonium => 'アニメーションバナーにはPlutoniumが必要です';

  @override
  String get animatedAvifNotSupported => 'アニメーションAVIFはサポートされていません';

  @override
  String get animatedAvifNotSupportedBody =>
      'アニメーションAVIFファイルの切り抜きと回転はまだサポートされていません。続行すると、元の形式でアップロードされます。';

  @override
  String get uploadAsIs => 'そのままアップロード';

  @override
  String get croppingAnimatedNotSupported =>
      'アニメーション画像の切り抜きはまだサポートされていません。元のアップロードが使用されます。';

  @override
  String get cropAvatar => 'アバターを切り抜く';

  @override
  String get cropBanner => 'バナーを切り抜く';

  @override
  String get skip => 'スキップ';

  @override
  String get crop => '切り抜く';

  @override
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => 'ユーザー名';

  @override
  String get fluxerTagInputLabel => 'ユーザー名';

  @override
  String get fluxerTagDescriptionBase =>
      'ユーザー名は、文字（a-z、A-Z）、数字（0-9）、およびアンダースコアのみを含むことができます。ユーザー名は大文字と小文字を区別しません。';

  @override
  String get fluxerTagDescriptionVisionary =>
      'ユーザー名は、文字（a-z、A-Z）、数字（0-9）、およびアンダースコアのみを含むことができます。ユーザー名は大文字と小文字を区別しません。#0000から#9999までの任意の4桁のタグを選択できます。';

  @override
  String get fluxerTagDescriptionPremium =>
      'ユーザー名は、文字（a-z、A-Z）、数字（0-9）、およびアンダースコアのみを含むことができます。ユーザー名は大文字と小文字を区別しません。#0001から#9999までの任意の4桁のタグを選択できます。';

  @override
  String validationLengthRange(int min, int max) {
    return '$minから$max文字の間';
  }

  @override
  String get validationAllowedChars => '文字（a-z、A-Z）、数字（0-9）、およびアンダースコア（_）のみ';

  @override
  String get discriminatorPremiumTooltip =>
      'Plutoniumを入手してタグをカスタマイズするか、ユーザー名を変更するときに保持してください';

  @override
  String get fluxerTagAlreadyTaken => 'ユーザー名';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'ユーザー名 $username#$discriminatorは既に使用されています。続行すると、ディスクリミネータは自動的に再ロールされます。';
  }

  @override
  String get customTagIsTemporary => 'カスタムタグは一時的です';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'カスタムの4桁タグは、Plutoniumサブスクリプションがアクティブな間のみ利用可能です。サブスクリプションが$dateに期限切れになると、3日間の猶予期間の後、タグはランダムに割り当てられた番号に戻ります。';
  }

  @override
  String get customTagTemporaryBody =>
      'カスタムの4桁タグは、Plutoniumサブスクリプションがアクティブな間のみ利用可能です。サブスクリプションが期限切れになると、3日間の猶予期間の後、タグはランダムに割り当てられた番号に戻ります。';

  @override
  String get iUnderstandContinue => '理解しました、続行';

  @override
  String get premiumWarningPendingDiscriminator =>
      'このユーザー名、Plutoniumサブスクリプションが終了したときにカスタムの4桁タグはランダムな番号に戻ります。サブスクリプションの更新に失敗した場合、タグが変更される前に3日間の猶予期間があります。';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'カスタムの4桁タグ（#$discriminator）は、Plutoniumサブスクリプションがアクティブな間有効です。サブスクリプションが終了するか、3日間の猶予期間後に更新に失敗した場合、タグはランダムな番号に戻ります。';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      '4桁のタグをカスタマイズするか、ユーザー名を変更するときに保持してください';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Plutoniumトライアルは$dateに期限切れになります。カスタムタグを保持し、プロフィールにバッジを獲得するにはアップグレードしてください。';
  }

  @override
  String get premiumTrialActive =>
      'Plutoniumトライアル中です。カスタムタグを保持し、プロフィールにバッジを獲得するにはアップグレードしてください。';

  @override
  String get fluxerTagUpdated => 'ユーザー名';

  @override
  String get fluxerTagUpdateFailed => 'ユーザー名。もう一度お試しください。';

  @override
  String get continueAction => '続行';

  @override
  String get profileCustomizationTitle => 'プロフィールカスタマイズ';

  @override
  String get profileCustomizationDescription => 'プロフィール外観を編集し、ライブプレビューを表示します';

  @override
  String get usernameLabel => 'ユーザー名';

  @override
  String get claimAccountToChangeFluxerTag => 'アカウントを請求してユーザー名';

  @override
  String get changeFluxerTag => 'ユーザー名';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Plutoniumを使って、お好みの4桁のタグ（#$discriminator）にカスタマイズ';
  }

  @override
  String get changeUsernameAndTagHint => 'ユーザー名と4桁のタグを変更';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'カスタムタグ（#$discriminator）はPlutoniumサブスクリプションに紐づいています。期限が切れるとランダムなタグに戻ります。';
  }

  @override
  String get displayNameLabel => '表示名';

  @override
  String get pronounsLabel => '代名詞';

  @override
  String get avatarLabel => 'アバター';

  @override
  String get changeAvatar => 'アバターを変更';

  @override
  String get removeAvatar => 'アバターを削除';

  @override
  String get avatarDescription => 'PNG、JPEG、WebP、GIF。最大10MB。推奨：512×512px';

  @override
  String get bannerLabel => 'バナー';

  @override
  String get changeBanner => 'バナーを変更';

  @override
  String get removeBanner => 'バナーを削除';

  @override
  String get bannerDescription => 'PNG、JPEG、WebP、GIF。最大10MB。最小：960×540px（16:9）';

  @override
  String get accentColorLabel => 'アクセントカラー';

  @override
  String get accentColorDescription => 'プロフィール上の境界線とバナーの色をカスタマイズ';

  @override
  String get aboutMeLabel => '自己紹介';

  @override
  String get aboutMeHelperText => 'リンク、絵文字、Markdownを使用できます。';

  @override
  String get emojiPickerTitle => '絵文字';

  @override
  String get plutoniumBadgePrivacyTitle => 'Plutoniumバッジのプライバシー';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Plutoniumバッジが他者にどのように表示されるかを制御';

  @override
  String get hidePlutoniumBadgeLabel => 'Plutoniumバッジを完全に非表示';

  @override
  String get hidePlutoniumBadgeDescription => 'Plutoniumバッジを他のユーザーから完全に非表示にする';

  @override
  String get hidePlutoniumPurchaseDate => 'Plutonium購入日を非表示';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Plutonium購入日（$date）を非表示';
  }

  @override
  String get hidePurchaseDateDescription => 'Plutoniumを最初に購入した日付をバッジから削除';

  @override
  String get maskVisionaryAsSubscription => 'Visionaryをサブスクリプションとしてマスク';

  @override
  String get maskVisionaryDescription => 'Visionaryを通常のサブスクリプションとして表示';

  @override
  String get hideVisionaryIdBadge => 'Visionary IDバッジを非表示';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Visionary IDバッジ（#$sequence）を非表示';
  }

  @override
  String get hideVisionaryIdDescription => 'Visionary IDバッジを削除';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Plutoniumのトライアル中です — サブスクリプションは$dateから開始されます';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'トライアル終了時にサブスクリプションが自動的に開始されます。操作は不要です。';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Plutoniumのトライアルは$dateに期限切れになります';
  }

  @override
  String get premiumTrialActiveProfile => 'Plutoniumのトライアル中です';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG、PNG、WebP。最大10MB。推奨：512×512px。アニメーションアバター（GIF）にはPlutoniumが必要です。';

  @override
  String get bannerPlutoniumUpsell =>
      '静止画またはアニメーションバナー画像でプロフィールをカスタマイズして目立たせましょう。';

  @override
  String get getPlutonium => 'Plutoniumを入手';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'このプラットフォームでは、アプリ内購入はまだ利用できません。近日公開予定ですので、続報にご期待ください！';

  @override
  String get profilePreviewLabel => 'プレビュー';

  @override
  String get profilePreviewMessage => 'メッセージ';

  @override
  String profilePreviewMemberSince(String productName) {
    return '$productNameメンバーシップ開始日';
  }

  @override
  String get unclaimedAccountTitle => '未請求アカウント';

  @override
  String get unclaimedAccountDescription =>
      'アカウントはまだ請求されていません。メールアドレスとパスワードがないと、アクセスを失う可能性があります。今すぐアカウントを請求して保護してください。';

  @override
  String get claimAccount => 'アカウントを請求';

  @override
  String get profileTypeLabel => 'プロフィールタイプ';

  @override
  String get profileTypeGlobal => 'グローバルプロフィール';

  @override
  String get profileTypeGuildDescription =>
      'コミュニティごとのプロフィールを編集しています。このプロフィールはこのコミュニティでのみ表示され、グローバルプロフィールを上書きします。';

  @override
  String get communityNicknameLabel => 'コミュニティニックネーム';

  @override
  String get perGuildPremiumUpsellText =>
      'コミュニティごとのアバター、バナー、アクセントカラー、自己紹介のカスタマイズにはPlutoniumが必要です。コミュニティのニックネームと代名詞は誰でも無料で利用できます。';

  @override
  String get avatarModeInherit => 'グローバルプロフィールを使用';

  @override
  String get avatarModeCustom => 'カスタム画像を使用';

  @override
  String get avatarModeUnset => '表示しない';

  @override
  String get profileSavedToast => 'プロフィールが更新されました';

  @override
  String get profileEditButton => 'プロフィールを編集';

  @override
  String get profileNoteLabel => 'メモ';

  @override
  String get profileNoteVisibility => '（あなたのみ表示）';

  @override
  String get profileNoteEmpty => 'まだメモがありません。';

  @override
  String get sudoTitle => '本人確認';

  @override
  String get sudoDescription => 'この操作を続行するには確認が必要です。';

  @override
  String get sudoAuthenticatorCode => '認証コード';

  @override
  String get sudoMethodPassword => 'パスワード';

  @override
  String get sudoMethodTotp => '認証アプリ';

  @override
  String get sudoVerificationFailed => '確認に失敗しました。もう一度お試しください。';

  @override
  String get securityAccountTitle => 'アカウント';

  @override
  String get securityAccountDescription => 'メールアドレス、パスワード、アカウント設定を管理する';

  @override
  String get securitySectionTitle => 'セキュリティ';

  @override
  String get securitySectionDescription => '2段階認証とパスキーでアカウントを保護する';

  @override
  String get securityLoginEmailSectionTitle => 'メール設定';

  @override
  String securityLoginEmailSectionDescription(String productName) {
    return '$productNameへのサインインに使用するメールアドレスを管理する';
  }

  @override
  String get securityLoginEmailAddressLabel => 'メールアドレス';

  @override
  String get securityLoginNoEmailSet => 'メールアドレスが設定されていません';

  @override
  String get securityLoginChangeEmail => 'メールアドレスを変更';

  @override
  String get securityLoginAddEmail => 'メールアドレスを追加';

  @override
  String get securityLoginReveal => '表示';

  @override
  String get securityLoginHide => '非表示';

  @override
  String get securityLoginPasswordSectionTitle => 'パスワード';

  @override
  String get securityLoginPasswordSectionDescription =>
      'アカウントを安全に保つためにパスワードを変更する';

  @override
  String get securityLoginCurrentPasswordLabel => '現在のパスワード';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return '$dateに変更しました';
  }

  @override
  String get securityLoginPasswordNeverChanged => '変更履歴：なし';

  @override
  String get securityLoginNoPasswordSet => 'パスワードが設定されていません';

  @override
  String get securityLoginChangePassword => 'パスワードを変更';

  @override
  String get securityLoginSetPassword => 'パスワードを設定';

  @override
  String get passwordChangeTitle => 'パスワードを変更';

  @override
  String get passwordChangeIntroDescription =>
      'パスワードを変更する前に、本人確認のため、ご登録のメールアドレスに確認コードを送信します。';

  @override
  String get passwordChangeStart => '開始';

  @override
  String get passwordChangeVerifyTitle => 'メールを確認';

  @override
  String get passwordChangeVerifyDescription => 'メールアドレスに送信された確認コードを入力してください。';

  @override
  String get passwordChangeVerificationCode => '確認コード';

  @override
  String get passwordChangeVerify => '確認';

  @override
  String get passwordChangeNewPasswordTitle => '新しいパスワードを設定';

  @override
  String get passwordChangeNewPasswordDescription => '以下の新しいパスワードを入力してください。';

  @override
  String get passwordChangeNewPassword => '新しいパスワード';

  @override
  String get passwordChangeConfirmPassword => '新しいパスワードを確認';

  @override
  String get passwordChangeSubmit => 'パスワードを変更';

  @override
  String get passwordChangeSuccess => 'パスワードが変更されました';

  @override
  String get passwordChangePasswordsDoNotMatch => 'パスワードが一致しません';

  @override
  String get passwordChangeInvalidCode => 'コードが無効または期限切れです';

  @override
  String get emailChangeTitle => 'メールアドレスの変更';

  @override
  String get emailChangeIntroDescription =>
      'メールアドレスを変更する前に、本人確認のための認証コードをお送りします。';

  @override
  String get emailChangeStart => '開始';

  @override
  String get emailChangeVerifyOriginalTitle => '現在のメールアドレスを確認';

  @override
  String get emailChangeVerifyOriginalDescription =>
      '現在登録されているメールアドレスに送信された認証コードを入力してください。';

  @override
  String get emailChangeNewEmailTitle => '新しいメールアドレスを入力';

  @override
  String get emailChangeNewEmailDescription => '使用したい新しいメールアドレスを入力してください。';

  @override
  String get emailChangeNewEmailLabel => '新しいメールアドレス';

  @override
  String get emailChangeNewEmailSubmit => '認証コードを送信';

  @override
  String get emailChangeVerifyNewTitle => '新しいメールアドレスを確認';

  @override
  String get emailChangeVerifyNewDescription =>
      '新しいメールアドレスに送信された認証コードを入力してください。';

  @override
  String get emailChangeSuccess => 'メールアドレスが変更されました';

  @override
  String get emailChangeInvalidCode => 'コードが無効か、有効期限が切れています';

  @override
  String get resend => '再送信';

  @override
  String resendCountdown(int seconds) {
    return '再送信 ($seconds秒)';
  }

  @override
  String get verificationCode => '認証コード';

  @override
  String get verify => '確認';

  @override
  String get enable => '有効にする';

  @override
  String get disable => '無効にする';

  @override
  String get delete => '削除';

  @override
  String get save => '保存';

  @override
  String get securityTfaSectionTitle => '2段階認証';

  @override
  String get securityTfaSectionDescription => 'アカウントにセキュリティレイヤーを追加します';

  @override
  String get securityTfaAuthenticatorApp => '認証アプリ';

  @override
  String get securityTfaAuthenticatorEnabled => '2段階認証が有効です';

  @override
  String get securityTfaAuthenticatorDisabled =>
      '2段階認証のためにコードを生成するには、認証アプリを使用してください';

  @override
  String get securityTfaBackupCodes => 'バックアップコード';

  @override
  String get securityTfaBackupCodesDescription => 'アカウント復旧用のバックアップコードを表示・管理する';

  @override
  String get securityTfaViewCodes => 'コードを表示';

  @override
  String get securityPasskeysSectionTitle => 'パスキー';

  @override
  String get securityPasskeysSectionDescription =>
      'パスワードなしのサインインと2段階認証にパスキーを使用する';

  @override
  String get securityPasskeysRegistered => '登録済みパスキー';

  @override
  String get securityPasskeysNone => 'パスキーは登録されていません';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'パスキー#件',
      one: 'パスキー1件',
    );
    return '$_temp0登録済み (最大10件)';
  }

  @override
  String get securityPasskeysAdd => 'パスキーを追加';

  @override
  String securityPasskeysAdded(String date) {
    return '追加日: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return '最終使用日: $date';
  }

  @override
  String get securityPasskeysRename => '名前を変更';

  @override
  String get securityPasskeysDeleteTitle => 'パスキーを削除';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'パスキー「$name」を削除してもよろしいですか？';
  }

  @override
  String get securityPasskeyNameTitle => 'パスキーの名前';

  @override
  String get securityPasskeyNameLabel => 'パスキー名';

  @override
  String get securityPasskeyNameHint => '例: YubiKey、iPhone、会社のPC';

  @override
  String get securityPhoneSectionTitle => '電話番号';

  @override
  String get securityPhoneSectionDescription => '電話番号を管理する';

  @override
  String get securityPhoneLabel => '電話番号';

  @override
  String get securityPhoneNone => '電話番号は追加されていません。';

  @override
  String get securityPhoneAdd => '電話番号を追加';

  @override
  String get securityPhoneRemove => '削除';

  @override
  String get securityPhoneRemoveTitle => '電話番号を削除';

  @override
  String get securityPhoneRemoveDescription => '電話番号を削除してもよろしいですか？';

  @override
  String get securityPhoneRemoved => '電話番号を削除しました';

  @override
  String get securityClaimTitle => 'セキュリティ機能';

  @override
  String get securityClaimDescription =>
      'アカウントを請求して、2段階認証やパスキーなどのセキュリティ機能にアクセスしてください。';

  @override
  String get securityVerifyEmailRequired =>
      '2段階認証、パスキー、またはSMS認証を設定する前に、メールアドレスを確認する必要があります。';

  @override
  String get totpEnableTitle => '認証アプリを設定';

  @override
  String get totpEnableDescription => '認証アプリでQRコードをスキャンして、2段階認証用のコードを生成してください。';

  @override
  String get totpEnableCodeLabel => 'コード';

  @override
  String get totpEnableCodeHint => '認証アプリから6桁のコードを入力してください';

  @override
  String get totpEnableSuccess => '2段階認証が有効になりました';

  @override
  String get totpDisableTitle => '認証アプリを削除';

  @override
  String get totpDisableDescription => '2段階認証を無効にするには、認証アプリから6桁のコードを入力してください。';

  @override
  String get totpDisableSuccess => '2段階認証が無効になりました';

  @override
  String get backupCodesTitle => 'バックアップコード';

  @override
  String get backupCodesWarning =>
      '認証アプリにアクセスできなくなり、これらのコードがない場合、アカウントに永久にアクセスできなくなります。今すぐダウンロードまたはコピーして、安全な場所に保管してください。';

  @override
  String get backupCodesDownload => 'ダウンロード';

  @override
  String get backupCodesCopy => 'コピー';

  @override
  String get backupCodesCopied => 'バックアップコードをクリップボードにコピーしました';

  @override
  String get backupCodesAcknowledge => 'バックアップコードをダウンロードまたはコピーし、安全な場所に保管しました。';

  @override
  String get backupCodesDone => '完了';

  @override
  String get backupCodesViewTitle => 'バックアップコードを表示';

  @override
  String get backupCodesViewDescription => 'バックアップコードを表示する前に、確認が必要になる場合があります。';

  @override
  String get phoneAddTitle => '電話番号を追加';

  @override
  String get phoneAddLabel => '電話番号';

  @override
  String get phoneAddHint => '電話番号を入力してください';

  @override
  String get phoneAddFooter => '電話番号を入力してください。SMSで確認コードをお送りします。';

  @override
  String get phoneAddSendCode => 'コードを送信';

  @override
  String get phoneVerifyTitle => '電話番号を確認';

  @override
  String get phoneVerifyDescription => 'お使いの電話番号に送信された確認コードを入力してください。';

  @override
  String get phoneAddSuccess => '電話番号を追加しました';

  @override
  String get phoneCountryLabel => '国';

  @override
  String get phoneSearchCountries => '国を検索...';

  @override
  String get phoneNumberRequired => '電話番号は必須です';

  @override
  String get phoneEnterValidNumber => '有効な携帯電話番号を入力してください。';

  @override
  String get phoneCannotBeUsed =>
      'この電話番号は使用できません。別の携帯電話番号を試すか、サポートにお問い合わせください。';

  @override
  String get phoneAlreadyUsed => 'この電話番号はすでに使用されています。別の番号を試すか、サポートにお問い合わせください。';

  @override
  String get phoneCodeDidNotWork => 'コードが正しくありません。確認してもう一度お試しください。';

  @override
  String get phoneTooManyAttempts => '試行回数が多すぎます。しばらく待ってから、もう一度お試しください。';

  @override
  String get phoneSmsUnavailable =>
      '現在、SMS認証をご利用いただけません。しばらくしてからもう一度お試しいただくか、サポートにお問い合わせください。';

  @override
  String get phoneNotEligible =>
      'このアカウントでは電話番号認証をご利用いただけません。別の方法を使用するか、サポートにお問い合わせください。';

  @override
  String get phoneCaptchaRequired =>
      '電話番号認証の前にブラウザチェックが必要です。サインインページからやり直すか、サポートにお問い合わせください。';

  @override
  String get phoneSomethingWentWrong => '問題が発生しました。もう一度お試しください。';

  @override
  String get phoneInboundExpensiveDescription =>
      'この電話番号へのSMS送信は高額になるため、代わりに私たちにSMSを送信していただく必要があります。サポートに連絡して、この要件をアカウントから解除してもらうこともできます。';

  @override
  String get phoneInboundDefaultDescription => 'SMSを送信して、電話番号を確認してください。';

  @override
  String get phoneInboundStepOpenMessaging =>
      'スマートフォンのメッセージアプリを開き、新しいメッセージを作成してください。';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'コード $code を $number に送信します。';
  }

  @override
  String get phoneInboundStepWait => 'メッセージの受信をお待ちください。1分ほどかかる場合があります。';

  @override
  String get phoneInboundGetNewCode => '新しいコードを取得';

  @override
  String get phoneInboundChallengeCodeLabel => '送信コード';

  @override
  String get phoneInboundOurNumberLabel => '送信先';

  @override
  String get requiredActionTitle => 'アカウント認証が必要です';

  @override
  String requiredActionIntroGeneric(String productName) {
    return '$productNameを継続して利用するには、必要な認証を完了してください。';
  }

  @override
  String get requiredActionIntroPhone => '引き続きご利用いただくには、追加のスパム対策認証が必要です。';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return '$productNameを使い続けるには、メールアドレスまたは電話番号を確認してください。';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return '$productNameを継続して利用するには、以下のメールと電話番号の認証ステップを完了してください。';
  }

  @override
  String get requiredActionChooseMethodTitle => '確認方法を選択';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return '$productNameを継続して利用するには、以下のいずれかの認証方法を完了してください。';
  }

  @override
  String get requiredActionUseEmail => 'メールアドレスを使う';

  @override
  String get requiredActionUsePhone => '電話番号を使用';

  @override
  String get requiredActionCheckEmailTitle => 'メールを確認してください';

  @override
  String get requiredActionCheckEmailDescription =>
      '確認リンクをメールアドレスに送信しました。続行するには、メールを開いてください。';

  @override
  String get requiredActionResendVerificationEmail => '確認メールを再送信';

  @override
  String get requiredActionVerificationEmailSent =>
      '確認メールを送信しました。受信トレイをご確認ください。';

  @override
  String get requiredActionSignOut => 'ログアウト';

  @override
  String get dangerZoneSectionTitle => '危険ゾーン';

  @override
  String get dangerZoneSectionDescription => '元に戻せない破壊的な操作';

  @override
  String get dangerZoneDisableTitle => 'アカウントを無効にする';

  @override
  String get dangerZoneDisableDescription =>
      'アカウントを一時的に無効にします。後でサインインし直すことで再アクティブ化できます。';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'アカウントを無効にすると、すべてのセッションからログアウトされます。再度ログインすることで、いつでもアカウントを再有効化できます。';

  @override
  String get dangerZoneDeleteTitle => 'アカウントを削除';

  @override
  String get dangerZoneDeleteDescription =>
      'アカウントと関連データをすべて完全に削除します。この操作は元に戻せません。';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'アカウントを削除する前に、Plutoniumの設定でアクティブなPlutoniumサブスクリプションをキャンセルしてください。';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'アカウントを削除できません';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'コミュニティを所有している間はアカウントを削除できません。まず、以下のコミュニティの所有権を譲渡してください。';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return '$count件その他';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return '所有権を譲渡するには、$settingsPathに移動し、所有権譲渡オプションを使用してください。';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'アカウントを削除してもよろしいですか？この操作により、アカウントの永久削除がスケジュールされます。';

  @override
  String get dangerZoneDeleteBullet1 => '削除プロセスは14日以内であればキャンセルできます';

  @override
  String get dangerZoneDeleteBullet2 => '14日後、アカウントは永久に削除されます';

  @override
  String get dangerZoneDeleteBullet3 => '削除処理後、アカウントへのアクセスを回復することはできません';

  @override
  String get dangerZoneDeleteBullet4 => 'アカウントが削除された後、送信したメッセージを削除することはできません';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'データをエクスポートしたい場合や、先にメッセージを削除したい場合は、続行する前にユーザー設定のプライバシーダッシュボードセクションにアクセスしてください。';

  @override
  String get claimAccountTitle => 'アカウントを請求';

  @override
  String get claimAccountDescription =>
      'メールアドレスとパスワードを追加してアカウントを請求してください。完了前に確認するために、確認コードをメールでお送りします。';

  @override
  String get claimAccountEmailLabel => 'メールアドレス';

  @override
  String get claimAccountPasswordLabel => 'パスワード';

  @override
  String get claimAccountSendCode => 'コードを送信';

  @override
  String get claimAccountVerifyDescription =>
      '送信されたコードをメールから入力して確認してください。コードが確認されるとパスワードが設定されます。';

  @override
  String get claimAccountSuccess => 'アカウントの取得に成功しました';

  @override
  String get importantInformation => '重要なお知らせ：';

  @override
  String get genericError => 'エラーが発生しました';

  @override
  String get networkErrorMessage => 'エラーが発生しました。もう一度お試しください。';

  @override
  String get invalidCode => 'コードが無効です';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count年前',
      one: '1年前',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countか月前',
      one: '1か月前',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count日前',
      one: '1日前',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count時間前',
      one: '1時間前',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count分前',
      one: '1分前',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count週間前',
      one: '1週間前',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count分後',
      one: '1分後',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count時間後',
      one: '1時間後',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: ' $count日後',
      one: '1日後',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: ' $count 週間後',
      one: '1週間後',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countか月後',
      one: '1か月後',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: ' $count年後',
      one: '1年後',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'たった今';

  @override
  String get authorizedAppsTitle => '承認済みアプリ';

  @override
  String authorizedAppsDescription(String productName) {
    return 'これらのアプリはあなたの$productNameアカウントへのアクセスを許可されています。';
  }

  @override
  String get authorizedAppsEmptyTitle => '承認済みアプリはありません';

  @override
  String get authorizedAppsEmptyDescription => 'アカウントへのアクセスを承認したアプリはありません。';

  @override
  String get authorizedAppsLoadError => '承認済みアプリの読み込みに失敗しました';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return '$dateに承認済み';
  }

  @override
  String get authorizedAppsPermissionsGranted => '付与された権限';

  @override
  String get authorizedAppsRevoke => '取り消す';

  @override
  String get authorizedAppsRevokeTitle => 'アプリのアクセスを取り消す';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return '$appNameのアクセスを取り消してもよろしいですか？このアプリはあなたのアカウントにアクセスできなくなります。';
  }

  @override
  String get authorizedAppsScopeIdentify => '基本的なプロフィール情報（ユーザー名、アバターなど）にアクセスする';

  @override
  String get authorizedAppsScopeEmail => 'あなたのメールアドレスを表示する';

  @override
  String get authorizedAppsScopeGuilds => 'あなたがメンバーであるコミュニティを表示する';

  @override
  String get authorizedAppsScopeConnections => '接続済みのアカウントを表示する';

  @override
  String get authorizedAppsScopeBot => '要求された権限を持つボットをコミュニティに追加する';

  @override
  String get authorizedAppsScopeAdmin => '管理者エンドポイントにアクセスする';

  @override
  String get privacyPendingDeletionTitle => '削除保留中';

  @override
  String get blockedUsersTitle => 'ブロックしたユーザー';

  @override
  String get blockedUsersDescription =>
      'ブロックしたユーザーは、あなたにフレンドリクエストを送信したり、直接メッセージを送信したりできなくなります。';

  @override
  String get blockedUsersEmptyTitle => 'ブロックしたユーザーはいません';

  @override
  String get blockedUsersEmptyDescription => 'まだ誰もブロックしていません。';

  @override
  String get blockedUsersLoadError => 'ブロックしたユーザーの読み込みに失敗しました';

  @override
  String get blockedUsersUnblock => 'ブロック解除';

  @override
  String get blockedUsersUnblockTitle => 'ユーザーのブロックを解除';

  @override
  String blockedUsersUnblockDescription(String username) {
    return '$usernameのブロックを解除してもよろしいですか？';
  }

  @override
  String get blockedUsersCopyTag => 'Fluxerタグをコピー';

  @override
  String get blockedUsersCopyId => 'ユーザーIDをコピー';

  @override
  String get userProfileLoadError => 'プロフィールを読み込めませんでした';

  @override
  String get userProfileLoading => 'プロフィールを読み込み中';

  @override
  String get userProfileRetry => '再試行';

  @override
  String get userProfileMessage => 'メッセージ';

  @override
  String get userProfileVoiceCall => 'ボイスコール';

  @override
  String get userProfileVideoCall => 'ビデオコール';

  @override
  String get userProfileEditProfile => 'プロフィールを編集';

  @override
  String userProfileStaffBadgeTooltip(String productName) {
    return '$productNameスタッフ';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return '$productNameコミュニティチーム';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return '$productNameパートナー';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return '$productName Bug Hunter';
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
    return '$dateより$productName Plutonium subscriber';
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
    return '$dateより$productName Visionary';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'Visionary ID #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return '共通の友達 ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return '共通のコミュニティ ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => '共通の友達';

  @override
  String get userProfileMutualCommunitiesTitle => '共通のコミュニティ';

  @override
  String get userProfileNoMutualFriends => '共通の友達は見つかりませんでした。';

  @override
  String get userProfileNoMutualCommunities => '共通のコミュニティは見つかりませんでした。';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'ニックネーム: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'DMを開く';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return '$usernameをブロックしました。ブロックを解除しない限り、メッセージを送信できません。';
  }

  @override
  String get blockedUserComposerBarrierAction => 'ブロック解除';

  @override
  String get userProfileOpenDm => 'DMを開く';

  @override
  String get userProfileNoteTitle => 'メモ';

  @override
  String get userProfileNoteVisibility => '(あなたのみ表示)';

  @override
  String get userProfileNoteSave => '保存';

  @override
  String get userProfileNoteDelete => '削除';

  @override
  String get userProfileNoteEmpty => 'クリックしてメモを追加';

  @override
  String get userProfileMemberSince => 'メンバーになった日';

  @override
  String get userProfileAboutMe => '自己紹介';

  @override
  String get userProfileRoles => '役割';

  @override
  String get memberRoleAdd => 'ロールを追加';

  @override
  String memberRoleRemove(String roleName) {
    return 'ロール「$roleName」を削除';
  }

  @override
  String get userProfileNoRolesInCommunity => 'このユーザーはコミュニティで役割を持っていません。';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'まだロールがありません。$rolesSettingsPathでロールを追加してください';
  }

  @override
  String get memberRolesNoRolesAvailable => '利用できるロールはありません';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return '現在、このコミュニティには割り当てられるロールがありませんが、$rolesSettingsPath で新しいロールを作成できます。';
  }

  @override
  String get guildSettingsTitle => 'コミュニティ設定';

  @override
  String get guildSettingsRolesTab => 'ロール';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => '現地時間';

  @override
  String get userProfileSameTimeAsYou => 'あなたと同じタイムゾーン';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return 'あなたより$duration進んでいます';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return 'あなたより$duration遅れています';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours 時間',
      one: '1 時間',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes 分',
      one: '1 分',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours時間',
      one: '1時間',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes分',
      one: '1分',
    );
    return '$_temp0';
  }

  @override
  String get userProfileCopyUsername => 'ユーザー名をコピー';

  @override
  String get userProfileCopyUserId => 'ユーザーIDをコピー';

  @override
  String get userProfileViewMainProfile => 'メインプロフィールを表示';

  @override
  String get userProfileViewCommunityProfile => 'コミュニティプロフィールを表示';

  @override
  String get userProfileBlockUser => 'ユーザーをブロック';

  @override
  String get userProfileUnblockUser => 'ブロック解除';

  @override
  String get userProfileRemoveFriend => '友達を削除';

  @override
  String get userProfileBlockConfirmTitle => 'ユーザーをブロックしますか？';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return '$usernameをブロックしますか？';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'ブロックを解除しますか？';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return '$usernameのブロックを解除しますか？';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => '友達を削除しますか？';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return '$usernameを友達から削除しますか？';
  }

  @override
  String get userProfileFailedOpenDm => 'DMを開けませんでした';

  @override
  String get userProfileFailedSaveNote => 'メモを保存できませんでした';

  @override
  String get userProfileActionFailed => 'アクションに失敗しました。もう一度お試しください';

  @override
  String get userProfileChangeNickname => 'ニックネームを変更';

  @override
  String get userProfileKick => 'キック';

  @override
  String get userProfileBan => 'BAN';

  @override
  String get userProfileTimeout => 'タイムアウト';

  @override
  String get userProfileRemoveTimeout => 'タイムアウト解除';

  @override
  String get userProfileTransferOwnership => 'オーナーシップを譲渡';

  @override
  String get userProfileReportUser => 'ユーザーを報告';

  @override
  String get userProfileReportMessage => 'メッセージを報告';

  @override
  String userProfileKickConfirmTitle(String username) {
    return '$usernameをキックしますか？';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return '$usernameをキックしますか？招待があれば再参加できます。';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'タイムアウトを解除しますか？';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'タイムアウトを解除すると、$usernameは再びメッセージの送信、リアクション、ボイスチャンネルへの参加ができるようになります。';
  }

  @override
  String get userProfileTransferConfirmTitle => 'オーナー権限を譲渡しますか？';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'このコミュニティのオーナー権限を$usernameに譲渡しますか？この操作は取り消しできません。オーナー権限はすべて失われます。';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return '$usernameをBAN';
  }

  @override
  String get userProfileBanDurationLabel => 'BAN期間';

  @override
  String get userProfileBanCustomSecondsLabel => 'カスタム期間（秒）';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return '$min秒から$max秒までの任意の値を入力';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'メッセージ履歴を削除';

  @override
  String get userProfileBanDeleteNone => 'すべて削除しない';

  @override
  String get userProfileBanDelete24h => '過去24時間';

  @override
  String get userProfileBanDelete7d => '過去7日間';

  @override
  String get userProfileBanReasonLabel => '理由（任意）';

  @override
  String get userProfileBanReasonHint => 'BANの理由を入力';

  @override
  String get userProfileBanSubmit => 'メンバーをBAN';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return '$usernameをタイムアウト';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'タイムアウト期間';

  @override
  String get userProfileTimeoutSubmit => 'メンバーをタイムアウト';

  @override
  String get userProfileNicknameLabel => 'ニックネーム';

  @override
  String get userProfileNicknameHint => 'ニックネームを入力';

  @override
  String get userProfileNicknameSave => '保存';

  @override
  String userProfileKickSuccess(String username) {
    return '$usernameをキックしました';
  }

  @override
  String userProfileBanSuccess(String username) {
    return '$usernameをBANしました';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return '$usernameをタイムアウトしました';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return '$usernameのタイムアウトを解除しました';
  }

  @override
  String get userProfileNicknameSuccess => 'ニックネームを更新しました';

  @override
  String get userProfileTransferSuccess => 'オーナー権限を譲渡しました';

  @override
  String get durationPermanent => '無期限';

  @override
  String get duration60Seconds => '60秒';

  @override
  String get duration5Minutes => '5分';

  @override
  String get duration10Minutes => '10分';

  @override
  String get duration1Hour => '1時間';

  @override
  String get duration12Hours => '12時間';

  @override
  String get duration1Day => '1日';

  @override
  String get duration3Days => '3日';

  @override
  String get duration5Days => '5日';

  @override
  String get duration1Week => '1週間';

  @override
  String get duration2Weeks => '2週間';

  @override
  String get duration1Month => '1ヶ月';

  @override
  String get durationCustom => 'カスタム…';

  @override
  String get iarReportUserTitle => 'ユーザーを報告';

  @override
  String get iarReportGuildTitle => 'コミュニティを報告';

  @override
  String get iarReportGuildPreconfirmBody =>
      'このコミュニティ内の特定のメッセージに関する報告の場合は、そのメッセージを直接報告してください。メッセージを報告していただくと、安全チームが状況をより正確に把握できます。コメントで詳細を追加していただけると、より迅速に確認できます。メッセージの報告では問題の全体像を伝えきれない場合にのみ、コミュニティ全体の報告に進んでください。';

  @override
  String get iarContinueToReportCommunity => 'コミュニティの報告を続ける';

  @override
  String get iarPreviewCommunitySubtitle => 'コミュニティ';

  @override
  String get iarReasonHarassmentGuildLabel => 'ハラスメントまたは標的型嫌がらせ';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'コミュニティは、集団攻撃や標的型嫌がらせを助長する可能性があります。';

  @override
  String get iarReasonHateGuildDescription => '保護されたグループに対する憎悪を助長する.';

  @override
  String get iarReasonTerrorismLabel => 'テロまたは暴力的過激主義';

  @override
  String get iarReasonTerrorismDescription => '暴力的過激派活動を助長、勧誘、または調整する行為.';

  @override
  String get iarReasonMatureContentGuildLabel => '成人向けコンテンツまたは不適切なコンテンツの制限';

  @override
  String get iarReasonMatureContentGuildDescription =>
      '適切な制限が設定されていない成人向けコンテンツ。';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      '未成年者を危険にさらしたり、児童搾取コンテンツをホストしたりする行為。';

  @override
  String get iarReasonRaidLabel => 'レイドの調整';

  @override
  String get iarReasonRaidDescription =>
      '個人またはコミュニティに対する襲撃、集団的嫌がらせ、またはハラスメントを調整する行為。';

  @override
  String get iarReasonSpamGuildDescription =>
      'コミュニティはスパム、詐欺、またはプラットフォームの悪用を目的として存在します。';

  @override
  String get iarReasonMalwareGuildLabel => 'マルウェア配布';

  @override
  String get iarReasonMalwareGuildDescription => 'マルウェア、認証情報、または有害なファイルを配布する。';

  @override
  String get iarReasonPrivacyGuildLabel => 'プライバシー侵害または個人情報漏洩';

  @override
  String get iarReasonPrivacyGuildDescription =>
      '個人情報共有、ストーカー行為、プライバシー侵害の共謀など.';

  @override
  String get iarReasonSelfHarmGuildLabel => '自傷行為を助長するおそれ';

  @override
  String get iarReasonSelfHarmGuildDescription => '自殺、自傷行為、摂食障害を助長するコンテンツ.';

  @override
  String get iarReasonInappropriateProfile => '不適切なプロフィール';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'このユーザーのプロフィールには不適切なコンテンツが含まれています';

  @override
  String typingIndicatorOne(String name) {
    return '$nameが入力中です…';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1と$name2が入力中です…';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1、$name2、$name3が入力中です…';
  }

  @override
  String get typingIndicatorMultiple => '数名が入力中です…';

  @override
  String get typingIndicatorHandful => 'キーボード戦士たちが集結中です…';

  @override
  String get typingIndicatorSymphony => 'キーボードのシンフォニーが奏でられています…';

  @override
  String get typingIndicatorFiesta => 'ここでは本格的なタイピングフェスタが開催されています';

  @override
  String get typingIndicatorApocalypse => 'うわー、タイピングの嵐だ';

  @override
  String systemJoinGladYoureHere(String username) {
    return '$usernameさん、ようこそ！';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return '$usernameさん、ようこそ！くつろいでくださいね。';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return '$usernameさん、こんにちは！来てくれて嬉しいです。';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return '$usernameさん、こんにちは！いつでも気軽に参加してくださいね。';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return '$usernameさん、来てくれて嬉しいです！';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return '$usernameさん、こんにちは！滞在を楽しんでくださいね。';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return '$usernameさん、ようこそ！';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return '$usernameさん、来てくれて嬉しいです！';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return '$usernameさん、ようこそ！';
  }

  @override
  String systemJoinWelcome(String username) {
    return '$usernameさん、ようこそ！';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return '$usernameさん、ようこそ！来てくれて嬉しいです。';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return '$usernameさん、ようこそ！ここで過ごす時間を楽しんでくださいね。';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return '$usernameさん、ようこそ！次の会話がここから始まります。';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return '$usernameさん、ようこそ。来てくれて嬉しいです。';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return '$usernameさん、来てくれて嬉しいです！ようこそ。';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return '$usernameさん、来たんですね！一緒にいられて嬉しいです。';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return '$usernameさん、到着しました！始めましょう。';
  }

  @override
  String get relativeTimeShortNow => '今';

  @override
  String relativeTimeShortMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count分',
      one: '1分',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count時間',
      one: '1時間',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count日',
      one: '1日',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countヶ月',
      one: '1ヶ月',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count年',
      one: '1年',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => '連携中のデバイス';

  @override
  String get linkedDevicesDescription =>
      '現在アカウントにログインしているすべてのデバイスを確認できます。認識できないセッションはすべて取り消してください。';

  @override
  String get linkedDevicesCurrentDevice => '現在のデバイス';

  @override
  String get linkedDevicesOtherDevices => 'その他のデバイス';

  @override
  String get linkedDevicesEnterSelection => '選択モードに入る';

  @override
  String get linkedDevicesExitSelection => '選択モードを終了';

  @override
  String get linkedDevicesSelectAll => 'すべて選択';

  @override
  String get linkedDevicesClearSelection => '選択をクリア';

  @override
  String get linkedDevicesRevokeTooltip => 'デバイスを取り消す';

  @override
  String get linkedDevicesSignOutAll => '他のすべてのデバイスからサインアウト';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'デバイス$count件からサインアウト',
      one: 'デバイス1件からサインアウト',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'デバイス$count件からサインアウト',
      one: 'デバイス1件からサインアウト',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle => '他のすべてのデバイスからサインアウト';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '選択したデバイスはアカウントからログアウトされます。それらのデバイスで再度ログインする必要があります。',
      one: '選択したデバイスはアカウントからログアウトされます。そのデバイスで再度ログインする必要があります。',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      '選択したデバイスはアカウントからログアウトされます。それらのデバイスで再度ログインする必要があります。';

  @override
  String get linkedDevicesSignOutConfirm => '続行';

  @override
  String get linkedDevicesLogoutDisclaimer => 'ログアウトしたすべてのデバイスで再度ログインする必要があります';

  @override
  String get linkedDevicesLoadErrorTitle => 'ネットワークエラー';

  @override
  String get linkedDevicesLoadErrorDescription =>
      '時空の連続体への接続に問題が発生しています。接続を確認して、もう一度お試しください。';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'デバイスを取り消しました',
      one: 'デバイスを取り消しました',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError => 'サインアウトできませんでした。もう一度お試しください。';

  @override
  String get linkedDevicesUnknownOs => '不明なOS';

  @override
  String get linkedDevicesUnknownPlatform => '不明なプラットフォーム';

  @override
  String slowmodeLabel(String duration) {
    return '$duration スローモード';
  }

  @override
  String get slowmodeTooltipActive => 'スローモード中です。メッセージを送信する前にしばらくお待ちください。';

  @override
  String get slowmodeTooltipImmune => 'スローモードが有効ですが、あなたは対象外です。';

  @override
  String get slowmodeStatusEnabled => 'スローモードがオンです';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'スローモードがオンです（$remaining）';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'スローモードは$durationLabelに設定されていますが、あなたは免除されています。';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'スローモードが$durationLabelに設定されています。次のメッセージを送信する前にお待ちください。';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'このチャンネルではスローモードが$durationLabelに設定されています。';
  }

  @override
  String get channelNoSendPermissionHint => 'このチャンネルではメッセージを送信できません。';

  @override
  String systemDmComposerBarrier(String productName) {
    return '$productNameスタッフからのシステムアナウンスです。返信はできません。';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'このコミュニティでは一時的にメッセージの送信が停止されています。';

  @override
  String get channelComposerBarrierTimedOut =>
      'タイムアウト中です。タイムアウトが終了するまで、メッセージ、リアクション、ボイス機能は一時停止されます。';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'このコミュニティでメッセージを送信するには、アカウントの引き継ぎが必要です。';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'このコミュニティでメッセージを送信するには、メールアドレスの認証が必要です。';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'アカウントが新しすぎるため、このコミュニティでメッセージを送信できません。';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'このコミュニティのメンバーになってから十分な期間が経過していないため、メッセージを送信できません。';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'このコミュニティでメッセージを送信するには、電話番号の認証が必要です。';

  @override
  String get channelComposerBarrierVerifyEmail => 'メールアドレスを認証';

  @override
  String get channelComposerBarrierVerifyPhone => '電話番号を認証';

  @override
  String chatAttachmentTooMany(int max) {
    return '添付ファイルが多すぎます（最大 $max 個）';
  }

  @override
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName はサイズ制限を超えています ($fileSize)';
  }

  @override
  String get chatAttachmentPayloadTooLarge => 'これらのファイルは一緒に送信するには大きすぎます';

  @override
  String get chatAttachmentDropToUpload => 'ファイルをドロップしてアップロード';

  @override
  String get chatAttachmentDropToSend => 'ファイルをドロップして今すぐ送信';

  @override
  String get chatAttachmentSendVoiceMessage => 'ボイスメッセージを送信';

  @override
  String get voiceMessageTitle => 'ボイスメッセージ';

  @override
  String get voiceMessageHoldHint => '長押しで録音。上にドラッグしてロックするか、離して送信します。';

  @override
  String get voiceMessageDiscard => 'ボイスメッセージを破棄';

  @override
  String get voiceMessageSend => 'ボイスメッセージを送信';

  @override
  String get voiceMessageMicPermissionDenied =>
      '録音が開始できません。マイクへのアクセスを許可してください。';

  @override
  String get voiceMessageRecordingNotSupported =>
      'このデバイスではボイスメッセージの録音はサポートされていません。';

  @override
  String get voiceMessageMicInUse => 'ボイスメッセージを録音するには、ボイス通話を終了してください。';

  @override
  String get voiceMessageRecordingFailed => '録音が失敗しました。もう一度お試しください。';

  @override
  String get voiceMessageSendFailed => 'ボイスメッセージを送信できませんでした。もう一度お試しください。';

  @override
  String get voiceMessageRecordingHint =>
      '話してください。終了したら停止を押してください。後でトリミングできます。';

  @override
  String get voiceMessageReviewHint => 'ハンドルをドラッグしてトリミングし、送信を押してください。';

  @override
  String get voiceMessageStop => '停止';

  @override
  String get voiceMessageStartRecording => '録音を開始';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => '再生';

  @override
  String get voiceMessagePause => '一時停止';

  @override
  String get voiceMessageSeekForward => '早送り';

  @override
  String get voiceMessageSeekBackward => '巻き戻す';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return '選択範囲は少なくとも $secondsString 秒必要です。';
  }

  @override
  String get chatAttachmentEditTitle => '添付ファイルを編集';

  @override
  String get chatAttachmentFilenameLabel => 'ファイル名';

  @override
  String get chatAttachmentDescriptionLabel => '説明';

  @override
  String get chatAttachmentDescriptionHint => 'オプションの代替テキスト';

  @override
  String get chatAttachmentSpoilerLabel => 'ネタバレとしてマーク';

  @override
  String get chatAttachmentRemove => '添付ファイルを削除';

  @override
  String get chatAttachmentDownload => 'ダウンロード';

  @override
  String get chatAttachmentDownloadedToast => '写真に保存しました';

  @override
  String get chatAttachmentDownloadFailedToast => '添付ファイルをダウンロードできませんでした';

  @override
  String get chatAttachmentExpiredTooltip => '添付ファイルの有効期限が切れました';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '($count行を表示)',
      one: '($count行を表示)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '($count行を隠す)',
      one: '($count行を隠す)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '($count行を表示)',
      one: '($count行を表示)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '($count行を折りたたむ)',
      one: '($count行を折りたたむ)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '…（残り$count行）',
      one: '…（残り$count行）',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '… ($count行残っています)',
      one: '… ($count行残っています)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'ファイル全体を表示';

  @override
  String get chatTextualPreviewChangeLanguage => '言語を変更';

  @override
  String get chatTextualPreviewSearchLanguage => '言語を検索…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => '構文ハイライト';

  @override
  String get chatTextualPreviewNoLanguagesFound => '結果が見つかりませんでした';

  @override
  String get chatTextualPreviewMoreOptions => 'その他のオプション';

  @override
  String get chatTextualPreviewWrapText => 'テキストを折り返す';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'ファイルが大きすぎてインラインプレビューできません（上限: $previewLimitKb KB）。';
  }

  @override
  String get chatTextualPreviewLoadError => 'プレビューを読み込めません。';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'プレーンテキスト';

  @override
  String get chatTextualPreviewCopy => 'コピー';

  @override
  String get chatAttachmentSourceGallery => 'ギャラリー';

  @override
  String get chatAttachmentSourceCamera => 'カメラ';

  @override
  String get chatAttachmentSourceBrowse => 'ファイルをブラウズ';

  @override
  String get chatAttachmentPasteTooltip => 'クリップボードから画像を貼り付け';

  @override
  String get chatAttachmentSpoiler => 'ネタバレ';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'ネタバレを表示';

  @override
  String get matureMediaRevealButton => '表示';

  @override
  String get matureMediaRevealHint => 'クリックして表示';

  @override
  String get matureContentTitle => '成人向けコンテンツ';

  @override
  String get matureCommunityTitle => '年齢制限のあるコミュニティ';

  @override
  String get matureCategoryTitle => '年齢制限のあるカテゴリ';

  @override
  String get matureChannelTitle => '年齢制限のあるチャンネル';

  @override
  String get communityContentWarningTitle => 'コミュニティコンテンツに関する警告';

  @override
  String get categoryContentWarningTitle => 'カテゴリコンテンツに関する警告';

  @override
  String get channelContentWarningTitle => 'チャンネルコンテンツに関する警告';

  @override
  String get defaultContentWarningBody => 'このコンテンツには機密情報が含まれています。';

  @override
  String get matureCommunityBody =>
      'このコミュニティは年齢制限のあるコンテンツとしてマークされており、一部のユーザーには不適切な素材が含まれている可能性があります。';

  @override
  String get matureCategoryBody =>
      'このカテゴリは年齢制限のあるコンテンツとしてマークされており、一部のユーザーには不適切な素材が含まれている可能性があります。';

  @override
  String get matureChannelBody =>
      'このチャンネルは年齢制限のあるコンテンツとしてマークされており、一部のユーザーには不適切な素材が含まれている可能性があります。';

  @override
  String get matureVoiceChannelBody =>
      'このボイスチャンネルは年齢制限のあるコンテンツとしてマークされており、一部のユーザーには不適切な素材が含まれている可能性があります。';

  @override
  String get matureLinkChannelBody =>
      'このリンクチャンネルは年齢制限のあるコンテンツとしてマークされており、一部のユーザーには不適切な素材が含まれている可能性があります。';

  @override
  String get matureCommunityUnavailableBody =>
      'この年齢制限のあるコミュニティは、あなたのアカウントでは利用できません。';

  @override
  String get matureCategoryUnavailableBody =>
      'この年齢制限のあるカテゴリは、あなたのアカウントでは利用できません。';

  @override
  String get matureChannelUnavailableBody =>
      'この年齢制限のあるチャンネルは、あなたのアカウントでは利用できません。';

  @override
  String get matureContentProceedButton => '続行';

  @override
  String get matureContentUnderstandButton => '理解しました';

  @override
  String get matureContentOpenLinkButton => 'リンクを開く';

  @override
  String get sensitiveContentSectionTitle => '機密コンテンツ';

  @override
  String get sensitiveContentSectionDescription =>
      'さまざまなコンテキストで年齢制限のある、または機密性の高いメディアがどのようにフィルタリングされるかを制御します';

  @override
  String get sensitiveContentFriendDmLabel => '友達からのダイレクトメッセージ';

  @override
  String get sensitiveContentNonFriendDmLabel => '他のユーザーからのダイレクトメッセージ';

  @override
  String get sensitiveContentGuildLabel => 'コミュニティチャンネルでのメッセージ';

  @override
  String get sensitiveContentFilterShow => '表示';

  @override
  String get sensitiveContentFilterBlur => 'ぼかす';

  @override
  String get sensitiveContentFilterBlock => 'ブロック';

  @override
  String get sensitiveContentBlurUnscannedLabel => '安全スキャン完了までメディアをぼかす';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      '有効にすると、コンテンツ安全スキャンが完了するまで画像と動画がぼかされます。';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'この設定はアカウントで常にオンになっています。';

  @override
  String get sensitiveContentResetButton => 'リセット';

  @override
  String get sensitiveContentSaveButton => '保存';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のファイルをアップロード中',
      one: 'ファイルを1件アップロード中',
    );
    return '$_temp0';
  }

  @override
  String get chatCancelUpload => 'アップロードをキャンセル';

  @override
  String chatAttachmentExpiresOn(String date) {
    return '$dateに期限切れ';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return '$startから$endの間に期限切れ';
  }

  @override
  String get connectionsTitle => '接続';

  @override
  String connectionsDescription(String productName) {
    return '外部アカウントとドメインを$productNameプロフィールにリンクします。確認済みの接続はプロフィールに表示され、他のユーザーも確認できるようになります。';
  }

  @override
  String get connectionsEmptyTitle => 'まだ接続がありません';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Blueskyアカウントをリンクするか、ドメインの所有権を確認してプロフィールに表示してください。';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'ドメインの所有権を確認してプロフィールに表示してください。';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'ドメイン';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Bluesky接続を追加';

  @override
  String get connectionsAddDomainAriaLabel => 'ドメイン接続を追加';

  @override
  String get connectionEdit => '編集';

  @override
  String get connectionRemove => '削除';

  @override
  String get connectionVerifiedLabel => 'この接続は確認済みです。';

  @override
  String get connectionUnverifiedLabel => 'この接続は確認されていません。';

  @override
  String get connectionAddTitle => '接続を追加';

  @override
  String get connectionTypeLabel => '接続タイプ';

  @override
  String get connectionHandleLabel => 'ハンドル';

  @override
  String get connectionDomainLabel => 'ドメイン';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'この接続は既に追加されています。';

  @override
  String get connectionConnectBluesky => 'Blueskyで接続';

  @override
  String get connectionContinue => '続行';

  @override
  String get connectionVerifyTitle => '接続の確認';

  @override
  String get connectionVerifyInstructions => '以下のレコードを使用してドメインの所有権を証明してください。';

  @override
  String get connectionDnsRecordTitle => 'DNS TXTレコード';

  @override
  String get connectionDnsHostLabel => 'ホスト';

  @override
  String get connectionDnsValueLabel => '値';

  @override
  String get connectionCopyHost => 'ホストをコピー';

  @override
  String get connectionCopyValue => '値をコピー';

  @override
  String get connectionCopied => 'コピーしました！';

  @override
  String get connectionTokenFileTitle => 'トークンファイルを配置';

  @override
  String get connectionTokenFileDescription =>
      '**fluxer-verification**をダウンロードし、**well-known**フォルダに配置してドメインを検証できるようにしてください。';

  @override
  String get connectionTokenFileDownload => 'fluxer-verificationをダウンロード';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'ファイルには、**$dnsUrl**から取得する検証トークンが含まれています。';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'fluxer-verificationを保存';

  @override
  String get connectionVerifyButton => '確認';

  @override
  String get connectionBack => '戻る';

  @override
  String get connectionEditTitle => '接続の編集';

  @override
  String get connectionEditDescription => 'この接続をプロフィールで誰に見せるかを選択してください。';

  @override
  String get connectionVisibilityEveryone => '全員';

  @override
  String get connectionVisibilityEveryoneDesc => 'この接続をプロフィールで誰でも表示できるようにする';

  @override
  String get connectionVisibilityFriends => '友達';

  @override
  String get connectionVisibilityFriendsDesc => '友達にこの接続を表示させる';

  @override
  String get connectionVisibilityCommunityMembers => 'コミュニティメンバー';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      '参加中のコミュニティのメンバーにこの接続を表示させる';

  @override
  String get connectionRemoveTitle => '接続の削除';

  @override
  String get connectionRemoveDescription => 'この接続を削除してもよろしいですか？この操作は元に戻せません。';

  @override
  String get connectionRemoveConfirm => '削除';

  @override
  String get connectionsLoadError => '接続の読み込みに失敗しました';

  @override
  String get connectionsReorderError => '順序の更新に失敗しました';

  @override
  String get connectionInitiateFailed => '確認を開始できませんでした。もう一度お試しください。';

  @override
  String get connectionVerifyFailed => '確認できませんでした。DNSレコードを確認して、もう一度お試しください。';

  @override
  String get connectionBlueskyAuthorizeFailed => 'Blueskyの認証を開始できませんでした。';

  @override
  String get connectionUpdateFailed => '接続を更新できませんでした';

  @override
  String get connectionRemoveFailed => '接続を削除できませんでした';

  @override
  String get connectionTokenSavedToast => 'fluxer-verificationを保存しました';

  @override
  String get connectionTokenSaveFailedToast => 'ファイルの保存に失敗しました';

  @override
  String get connectionEnterHandle => 'Blueskyのハンドルを入力してください。';

  @override
  String get connectionEnterDomain => 'ドメインを入力してください。';

  @override
  String get lookAndFeelTitle => '見た目';

  @override
  String get lookAndFeelThemeSectionTitle => 'テーマ';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'ダーク、コール、ライトのいずれかの外観を選択してください。';

  @override
  String get lookAndFeelHdrSectionTitle => 'ハイダイナミックレンジ';

  @override
  String get lookAndFeelHdrSectionDescription => 'HDR対応モニターでのHDR画像の表示方法を設定します。';

  @override
  String get lookAndFeelHdrFullName => 'フルダイナミックレンジ';

  @override
  String get lookAndFeelHdrFullDescription => 'HDR画像を最高の明るさと色域で表示します。';

  @override
  String get lookAndFeelHdrStandardName => '標準';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'HDR画像を標準範囲にトーンマップし、ピーク輝度を下げます。';

  @override
  String get lookAndFeelHdrDisplayModeLabel => 'HDR表示モード';

  @override
  String get lookAndFeelThemeDark => 'ダークテーマ';

  @override
  String get lookAndFeelThemeCoal => 'コールテーマ';

  @override
  String get lookAndFeelThemeLight => 'ライトテーマ';

  @override
  String get lookAndFeelThemeSystem => 'システムテーマ';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel => 'テーマをデバイス間で同期する';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      '有効にすると、テーマの変更がすべてのデバイスに同期されます。無効にすると、このデバイスは独自のテーマ設定を使用します。';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'システムテーマは、このデバイスでのシステムの設定を追跡するために、自動的に同期を無効にします。';

  @override
  String get lookAndFeelThemeSyncFailed => 'テーマをアカウントに同期できませんでした。もう一度お試しください。';

  @override
  String get lookAndFeelChatFontScalingTitle => 'チャットフォントの拡大縮小';

  @override
  String get lookAndFeelChatFontScalingDescription => 'チャットエリアのフォントサイズを調整します。';

  @override
  String get lookAndFeelChatFontSizeLabel => 'チャットのフォントサイズ';

  @override
  String get lookAndFeelAppZoomTitle => 'アプリの表示サイズ';

  @override
  String get lookAndFeelAppZoomDescription => 'アプリのズームレベルを調整します。';

  @override
  String get lookAndFeelChatWallpaperTitle => 'チャットの壁紙';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'チャットの背景を選択します。この設定はデバイスに残ります。';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip => 'この設定は、このデバイスに残ります';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'チャットの壁紙は、このデバイスにのみ保存され、他のデバイスとは同期されません。';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'デフォルト';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'カスタム画像';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'カラー $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'グラデーション $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => '壁紙を暗くする';

  @override
  String get lookAndFeelChatWallpaperPickFailed => 'その画像を壁紙に設定できませんでした。';

  @override
  String get lookAndFeelMessagesSectionTitle => 'メッセージ';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'チャットチャンネルでのメッセージ表示方法を選択します。';

  @override
  String get lookAndFeelMessageGroupSpacingLabel => 'メッセージグループ間のスペース';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => 'メッセージ表示モード';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'ゆったり';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'メッセージがはっきりと区別できる、ゆったりとしたレイアウト。';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'コンパクト';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'メッセージの表示数を最大化し、間隔を最小限に抑えます。';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'ユーザーアバターを非表示';

  @override
  String get lookAndFeelInterfaceTitle => 'インターフェース';

  @override
  String get lookAndFeelInterfaceDescription => 'インターフェース要素と動作をカスタマイズします。';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle => 'チャンネルリストの入力中インジケーター';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      '誰かがチャンネルで入力しているときに、チャンネルリストに表示される入力中インジケーターの表示方法を選択します。';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      '入力中インジケーター + アバター';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'チャンネルリストで、ユーザーアバターと共に表示される入力中インジケーター';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName => '入力中インジケーターのみ';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'アバターなしで、入力中インジケーターのみを表示';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => '非表示';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'チャンネルリストで入力中インジケーターを表示しない';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      '選択中のチャンネルの入力中インジケーターを表示';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      '無効（デフォルト）の場合、現在表示中のチャンネルには入力中インジケーターが表示されません。';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'general';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'キーボードヒント';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'ツールチップにキーボードショートカットヒントが表示されるかどうかを制御します。';

  @override
  String get lookAndFeelHideKeyboardHintsLabel => 'ツールチップのキーボードヒントを非表示';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      '有効にすると、ツールチップのポップアップでショートカットバッジが非表示になります。';

  @override
  String get lookAndFeelNekoTitle => 'その他';

  @override
  String get lookAndFeelNekoDescription => 'その他のインターフェースオプション。';

  @override
  String get lookAndFeelShowNekoLabel => 'Nekoを表示';

  @override
  String get lookAndFeelShowNekoDescription =>
      '有効にすると、Nekoがチャット入力バーの近くに表示されます。';

  @override
  String get lookAndFeelVoiceChannelJoinTitle => 'ボイスチャンネル参加時の動作';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'コミュニティでのボイスチャンネルへの参加方法を制御します。';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel => 'ボイスチャンネル参加にはダブルクリックが必要';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      '有効にすると、ボイスチャンネルに参加するにはダブルクリックが必要になります。無効（デフォルト）の場合、シングルクリックで即座に参加できます。';

  @override
  String get lookAndFeelChatFontPreviewSample => 'すばやい茶色のキツネは怠惰な犬を飛び越える。';

  @override
  String get lookAndFeelGuildSidebarTitle => 'サーバーサイドバー';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'サーバーサイドバーでダイレクトメッセージを表示する方法を設定します。';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countのコミュニティは、フラックスキャパシタの誤作動により一時的に利用できません。',
      one: '1つのコミュニティは、フラックスキャパシタの誤作動により一時的に利用できません。',
    );
    return '$_temp0';
  }

  @override
  String get communityTemporarilyUnavailable => 'コミュニティは一時的に利用できません';

  @override
  String get guildUnavailableDescription => '問題が発生しました。現在対応中です。';

  @override
  String get guildNotFoundTitle => 'お探しのコミュニティではありません。';

  @override
  String get guildNotFoundDescription => 'お探しのコミュニティは削除されたか、アクセス権がない可能性があります。';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return '$communityNameは現在、$productNameのスタッフメンバーのみがアクセスできます';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => '一時的に利用できません';

  @override
  String get lookAndFeelCollapseDMsLabel => 'DMをフォルダにまとめる';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return '有効にすると、サーバーサイドバーの未読DMが$productNameボタンのフォルダにまとめられます。フォルダを展開または折りたたむには、DMページで$productNameボタンをクリックしてください。';
  }

  @override
  String get lookAndFeelChannelListSectionTitle => 'チャンネルリスト';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'ミュートされたチャンネルの未読インジケーターの動作を制御します。';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'ミュートされたチャンネルに未読インジケーターを表示';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      '有効にすると、ミュートされたチャンネルの左側に薄い未読インジケーターが表示されます。メンションは、この設定に関係なく表示されます。';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'アクティブユーザー';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'アプリ全体でのアクティブユーザーの表示方法を制御します。';

  @override
  String get lookAndFeelShowActiveNowLabel => 'ホーム画面にアクティブユーザーを表示';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'ホーム画面にアクティブユーザーを表示して、ボイスチャンネルでアクティブな友達を見つけやすくします。プレビュー、チャンネルのコンテキスト、参加中のユーザー、そして参加するための簡単な方法が表示されます。';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'お気に入り';

  @override
  String get lookAndFeelFavoritesSectionDescription => 'アプリ全体でお気に入りの表示を制御します。';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'お気に入りを有効にする';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      '有効にすると、チャンネルをお気に入りに登録でき、お気に入りセクションに表示されます。無効にすると、お気に入り関連のUI要素（ボタン、メニュー項目）はすべて非表示になります。既存のお気に入りは保持されます。';

  @override
  String get favoritesTitle => 'お気に入り';

  @override
  String get favoritesEmptyTitle => 'まだお気に入りはありません';

  @override
  String get favoritesEmptyDescription => 'チャンネルをチャットヘッダーからスター付けすると、ここに表示されます。';

  @override
  String get favoritesWelcomeTitle => 'お気に入りへようこそ';

  @override
  String get favoritesWelcomeDescription =>
      'お気に入りのチャンネル、DM、グループにすばやくアクセスできるプライベートスペースです。任意のチャンネルのスターを押してお気に入りに追加してください。';

  @override
  String get favoritesWelcomeTip => '必要ないですか？いつでもオフにできます。';

  @override
  String get favoritesDisableButton => 'お気に入りを無効にする';

  @override
  String get favoritesAddedToast => 'お気に入りに登録しました';

  @override
  String get favoritesRemovedToast => 'お気に入りから削除しました';

  @override
  String get favoritesHiddenToast => 'お気に入りが非表示になりました';

  @override
  String get favoritesMute => 'お気に入りをミュート';

  @override
  String get favoritesUnmute => 'お気に入りのミュートを解除';

  @override
  String get favoritesHeaderMenu => 'お気に入りメニュー';

  @override
  String get favoritesCreateCategory => 'カテゴリを作成';

  @override
  String get favoritesCategoryNameLabel => 'カテゴリ名';

  @override
  String get favoritesHideMutedChannels => 'ミュート中のチャンネルを非表示';

  @override
  String get favoritesShowMutedChannels => 'ミュート中のチャンネルを表示';

  @override
  String get favoritesSetNickname => 'ニックネームを設定';

  @override
  String get favoritesNicknameLabel => 'ニックネーム';

  @override
  String get favoritesSaveNickname => 'ニックネームを保存';

  @override
  String get favoritesMoveToCategory => 'カテゴリに移動';

  @override
  String get favoritesUncategorized => '未分類';

  @override
  String get favoritesOtherCategory => 'その他';

  @override
  String get favoritesRemoveFromFavorites => 'お気に入りから削除';

  @override
  String get favoritesAddToFavorites => 'お気に入りに追加';

  @override
  String get favoritesAddToSavedMedia => '保存済みメディアに追加';

  @override
  String get favoritesRemoveFromSavedMedia => '保存済みのメディアから削除';

  @override
  String get favoritesAddToUrlOnlyGifFavorites => 'URLのみのアニメーションGIFのお気に入りに追加';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'URLのみで保存された GIF をお気に入りから削除';

  @override
  String get savedMediaAddTitle => '保存済みメディアに追加';

  @override
  String get savedMediaFormNameLabel => '名前';

  @override
  String get savedMediaFormNameHint => 'マイメディア';

  @override
  String get savedMediaFormAltTextLabel => '代替テキスト';

  @override
  String get savedMediaFormAltTextHint => 'メディアの説明';

  @override
  String get savedMediaFormTagsLabel => 'タグ';

  @override
  String get savedMediaFormTagsHint => '面白い、リアクション、仕事';

  @override
  String get savedMediaSaveError => '保存済みメディアを更新できませんでした。';

  @override
  String get savedMediaNameRequired => '名前は必須です。';

  @override
  String get gifFavoriteFirstTimeTitle => 'GIFの「お気に入り」をどのように保存しますか？';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'お気に入りのGIFは、URLのみのお気に入りとして保存するか、保存済みメディアにアップロードできます。使い方に合わせて選択してください。設定 > 詳細設定 > メディアでいつでも変更できます。';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'URLのみのお気に入り（デフォルト）：デバイス間で同期され、アップロード不要で、保存済みメディアの容量を消費しません。ホストが削除した場合、元のメディアは消える可能性があります。';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      '保存されたメディア：アップロード、タグ付け、検索、永続化が可能ですが、保存メディアの上限にカウントされます。';

  @override
  String get gifFavoriteFirstTimeHint => '一度だけお伺いします。';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly => 'URLのみを使用する（推奨）';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => '保存されたメディアを使用';

  @override
  String get favoritesHideConfirmTitle => 'お気に入りを非表示にする';

  @override
  String get favoritesHideConfirmDescription =>
      'これにより、ボタンやメニュー項目を含む、お気に入りに関連するすべてのUI要素が非表示になります。既存のお気に入りは保持され、いつでも設定 > 詳細 > 外観から再度有効にできます。';

  @override
  String get favoritesDirectMessageSubtitle => 'ダイレクトメッセージ';

  @override
  String get messagesMediaDisplayGroupTitle => '表示';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'メッセージ、メディア、その他のコンテンツの表示方法を制御します。';

  @override
  String get messagesMediaMediaGroupTitle => 'メディア';

  @override
  String get messagesMediaMediaGroupDescription => 'メディアのサイズ設定とボタンをカスタマイズします。';

  @override
  String get messagesMediaInputGroupTitle => '入力';

  @override
  String get messagesMediaInputGroupDescription => 'メッセージ入力設定をカスタマイズします。';

  @override
  String get messagesMediaSidebarGroupTitle => 'サイドバー';

  @override
  String get messagesMediaSidebarGroupDescription => 'コミュニティサイドバーの表示方法を設定します。';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'デフォルトでミュート中のチャンネルを非表示';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      '新しいコミュニティに参加したときに、サイドバーでミュート中のチャンネルを自動的に非表示にします';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'デフォルトでミュート中のチャンネルを非表示にしますか？';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      '参加する新しいコミュニティでは、ミュート中のチャンネルが自動的に非表示になります。既存のすべてのコミュニティにもこの設定を適用しますか？';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'デフォルトでミュート中のチャンネルを非表示にするのをやめますか？';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      '参加する新しいコミュニティでは、ミュート中のチャンネルは自動的に非表示にならなくなります。既存のすべてのコミュニティでもミュート中のチャンネルを表示しますか？';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'すべてのコミュニティに適用';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'すべてのコミュニティに表示';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      '新しいコミュニティのみ';

  @override
  String get messagesMediaDisplaySectionTitle => 'メディア表示';

  @override
  String get messagesMediaDisplaySectionDescription =>
      '画像、動画、その他のメディアの表示方法を制御します。すべてのメディアはサイズ変更され、変換されます。プレビューに圧縮できない非常に大きなファイルは、これらの設定に関係なく埋め込まれません。';

  @override
  String get messagesMediaDisplayInlineEmbedLabel => 'チャットへのリンクとして投稿された場合';

  @override
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return '$productNameに直接アップロードされた場合';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'リンクプレビュー';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'チャットでのウェブサイトリンクのプレビュー方法を制御します';

  @override
  String get messagesMediaLinkPreviewsToggleLabel => 'リンクの埋め込みとプレビューを表示';

  @override
  String get messagesMediaReactionsSectionTitle => 'リアクション';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'メッセージのリアクション（絵文字）を設定します';

  @override
  String get messagesMediaReactionsToggleLabel => 'メッセージに絵文字リアクションを表示';

  @override
  String get messagesMediaSpoilersSectionTitle => 'ネタバレコンテンツ';

  @override
  String get messagesMediaSpoilersSectionDescription => 'ネタバレコンテンツの表示方法を制御します';

  @override
  String get messagesMediaSpoilersRadioLabel => 'ネタバレコンテンツを表示';

  @override
  String get messagesMediaSpoilersOnClickName => 'クリック時';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'クリックするとネタバレコンテンツを表示します';

  @override
  String get messagesMediaSpoilersIfModeratorName => '管理中のチャンネル';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      '「メッセージ管理」権限を持つチャンネルでは、常にネタバレコンテンツを表示します';

  @override
  String get messagesMediaSpoilersAlwaysName => '常に表示';

  @override
  String get messagesMediaSpoilersAlwaysDescription => '常にネタバレコンテンツを表示します';

  @override
  String get messagesMediaSizeSectionTitle => 'メディアサイズの表示設定';

  @override
  String get messagesMediaSizeSectionDescription =>
      '埋め込みメディアと添付メディアの最大表示サイズをカスタマイズします。小さいサイズは画面スペースを節約し、大きいサイズは詳細を表示します。';

  @override
  String get messagesMediaSizeEmbedLabel => 'リンクからのメディア（埋め込み）';

  @override
  String get messagesMediaSizeAttachmentLabel => 'アップロードされた添付ファイル';

  @override
  String get messagesMediaSizeCompactName => 'コンパクト (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'メディアサイズを小さく表示';

  @override
  String get messagesMediaSizeComfortableName => '快適 (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription => 'メディアサイズを大きく表示し、詳細を表示';

  @override
  String get messagesMediaGifsSectionTitle => 'GIFの動作';

  @override
  String get messagesMediaGifsSectionDescription => 'チャットへのGIFの挿入方法を制御します';

  @override
  String get messagesMediaGifsAutoSendLabel => '選択したGIFを自動送信';

  @override
  String get messagesMediaCameraUploadsSectionTitle => 'カメラアップロード';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'アプリ内カメラで撮影した写真や動画をデバイスに保存するかどうかを選択します';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel => 'デバイスに保存';

  @override
  String get messagesMediaAutocompleteSectionTitle => 'エクスプレッションの自動補完（コロン補完）';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'コロンを入力した際のエクスプレッション自動補完に表示される内容を制御します。好みに合わせて表示される候補をカスタマイズできます。';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'デフォルトの絵文字をエクスプレッション自動補完に表示';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'カスタム絵文字をエクスプレッション自動補完に表示';

  @override
  String get messagesMediaAutocompleteStickersLabel => 'ステッカーをエクスプレッション自動補完に表示';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      '保存済みメディアをエクスプレッション自動補完に表示';

  @override
  String get messagesMediaEditingSectionTitle => 'メッセージ編集';

  @override
  String get messagesMediaEditingSectionDescription =>
      'キャンセル時に編集中の下書きがどうなるかを制御します。';

  @override
  String get messagesMediaEditingPreserveDraftLabel => 'キャンセル時に編集下書きを保持';

  @override
  String get accessibilitySaturationTitle => '彩度';

  @override
  String get accessibilitySaturationDescription => 'アプリ全体のテーマカラーの鮮やかさを調整します。';

  @override
  String get accessibilityVisualGroupTitle => '表示';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel => 'リンクに常に下線を表示';

  @override
  String get accessibilityDimStrikethroughTextLabel => '取り消し線のテキストを薄く表示する';

  @override
  String get accessibilityDmMessagePreviewGroupTitle => 'DMメッセージプレビュー';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'DMリストにメッセージプレビューが表示されるタイミングを制御します。';

  @override
  String get accessibilityDmMessagePreviewModeLabel => 'DMメッセージプレビューモード';

  @override
  String get accessibilityDmMessagePreviewAllName => 'すべて';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'すべてのDM会話のメッセージプレビューを表示';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName => '未読DMのみ';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      '未読メッセージのあるDMのみメッセージプレビューを表示';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'なし';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'DMリストにメッセージプレビューを表示しない';

  @override
  String get accessibilityScreenReaderGroupTitle => 'スクリーンリーダー';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return '$productNameのスクリーンリーダーとの連携方法を制御します。';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      '新着メッセージを読み上げる';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      '開いているチャンネルに新しいメッセージが届いたときに、スクリーンリーダーで読み上げます。通知音には影響しません。';

  @override
  String get accessibilityTtsGroupTitle => 'テキスト読み上げ';

  @override
  String get accessibilityTtsGroupDescription => '音声テキストの速度を選択します。';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel => '音声再生速度';

  @override
  String get accessibilityTtsPlaySampleLabel => 'サンプルを再生';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'サンプルをミュート';

  @override
  String get accessibilityPreviewButtonLabel => 'プレビューボタン';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'リンクの表示例: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'プレビューユーザー';

  @override
  String get accessibilityKeyboardGroupTitle => 'キーボード';

  @override
  String get accessibilityShowTextareaFocusRingLabel => 'チャット入力欄にフォーカスリングを表示';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel => 'Escキーでキーボードモードを終了';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'コンテキストメニューのショートカットを表示';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel => '通話開始前に確認する';

  @override
  String get accessibilityAnimationGroupTitle => 'アニメーション';

  @override
  String get accessibilityReducedMotionActiveNote =>
      '視差効果を減らす設定がオンのため、コンテンツのアニメーションはデフォルトで一時停止しています。必要に応じて、個別にアニメーションをオンにできます。';

  @override
  String get accessibilityPlayAnimatedEmojisLabel => 'アニメーション絵文字を再生';

  @override
  String get accessibilityAutoPlayGifsMobileLabel => 'GIFを自動再生';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return '$productNameにフォーカスがあるときにGIFを自動再生する';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion => '視差効果を減らす設定でも再生されます。';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      '動作軽減機能により一時停止されています。オンにすると、アニメーション絵文字が再生され続けます。';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      '動作軽減機能により一時停止されています。オンにするとGIFが再生されます。';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'バッテリーとデータ使用量を節約するため、モバイルではデフォルトでオフになっています。';

  @override
  String get accessibilityStickerAnimationsTitle => 'スタンプアニメーション';

  @override
  String get accessibilityStickerAnimationPreferenceLabel => 'スタンプアニメーションの設定';

  @override
  String get accessibilityStickerAlwaysAnimateName => '常にアニメーション';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'スタンプは常にアニメーション表示されます';

  @override
  String get accessibilityStickerAnimateOnInteractionName => '操作時にアニメーション';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'スタンプをタップするとアニメーションします';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'スタンプにカーソルを合わせたり、操作したりするとアニメーションが再生されます';

  @override
  String get accessibilityStickerNeverAnimateName => '常にアニメーションをオフにする';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'スタンプは常にアニメーションなしで表示されます';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      '動作を減らす設定でも常にアニメーション表示されます。';

  @override
  String get accessibilityStickersReducedMotionHint =>
      '動作軽減モードでは、スタンプは操作時にアニメーション表示されます。常にアニメーション表示するには、「常にアニメーション表示」を選択してください。';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'バッテリーを節約するため、モバイルでは操作時にアニメーションを再生します。';

  @override
  String get accessibilityMotionGroupTitle => 'モーション';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'システムの視差効果設定に合わせる';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'このデバイスのシステム設定で「視差効果を減らす」をオンにするか、以下でカスタマイズしてください。';

  @override
  String get accessibilityReducedMotionOverrideLabel => '動きを減らす';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'アニメーションと画面切り替えを無効にします。現在、システム設定によって制御されています。';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'アプリ全体のアニメーションと画面遷移を無効にします。';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'アニメーションタブで、アニメーション絵文字、GIF、スタンプの表示を管理できます。';

  @override
  String get accessibilityConfirmStartCallTitle => '通話を開始しますか？';

  @override
  String get accessibilityConfirmStartCallDescription => 'この通話を開始してもよろしいですか？';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => '通話を開始';

  @override
  String get accessibilityTtsSampleDescription => '選択した速度でサンプル行が読み上げられます。';

  @override
  String get accessibilityTtsSampleText =>
      '博士、私は未来から来ました。あなたが発明したタイムマシンに乗って。1985年に戻るには、あなたの助けが必要です。';

  @override
  String get accessibilityTtsUnsupportedDescription => 'このデバイスでは音声合成が利用できません。';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      '音声の再生に失敗しました。もう一度お試しいただくか、音声出力が機能しているかご確認ください。';

  @override
  String get ttsSubstitutionUnknownUser => '不明なユーザー';

  @override
  String get ttsSubstitutionUnknownRole => '不明な役割';

  @override
  String get ttsSubstitutionUnknownChannel => '不明なチャンネル';

  @override
  String get ttsSubstitutionCodeBlock => 'コードブロック';

  @override
  String get ttsSubstitutionSpoiler => 'ネタバレ';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return '絵文字 $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return '/$commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName：$formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return '$replyAuthorNameへの返信で、$authorNameさんが次のように言いました: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorNameが$description';
  }

  @override
  String get ttsSentSticker => 'スタンプを送信';

  @override
  String get ttsSentAttachment => '添付ファイルを送信しました';

  @override
  String ttsSentAttachments(int count) {
    return '$count 件の添付ファイルを送信しました';
  }

  @override
  String get ttsSentEmbed => '埋め込みを送信しました';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author が $summary を送信しました';
  }

  @override
  String get dmListSentAnAttachment => '添付ファイルを送信しました';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$usernameがこのチャンネルにメッセージをピン留めしました。';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$usernameが$userNameをグループに追加しました。';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$usernameが誰かをグループに追加しました。';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$usernameがグループを退出しました。';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$usernameさんが$userNameさんをグループから削除しました。';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$usernameさんが誰かをグループから削除しました。';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$usernameさんがチャンネル名を$newNameに変更しました。';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$usernameさんがチャンネル名を変更しました。';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$usernameさんがチャンネルアイコンを変更しました。';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$usernameさんが通話を開始しました。';
  }

  @override
  String get systemCallJoinTheCall => '通話に参加';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$usernameさんが通話を開始しました。通話時間は$durationでした。';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return '$usernameさんからの通話に出られませんでした。通話時間は$durationでした。';
  }

  @override
  String systemCallMissed(String username) {
    return '$usernameさんからの通話を見逃しました。';
  }

  @override
  String get systemCallDurationFewSeconds => '数秒';

  @override
  String get systemCallDurationMinute => '1分';

  @override
  String get systemCallDurationOneYear => '1年';

  @override
  String get systemCallDurationOneMonth => '1か月';

  @override
  String get systemCallDurationOneWeek => '1週間';

  @override
  String get systemCallDurationOneDay => '1日';

  @override
  String get systemCallDurationOneHour => '1時間';

  @override
  String systemCallDurationYears(int count) {
    return '$count年';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$countか月';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count週間';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count 日';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count 時間';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count分';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'このメッセージを表示するには、$productNameをアップデートしてください。';
  }

  @override
  String get voiceConnectionConfirmTitle => 'ボイス接続の確認';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'このボイスチャンネルにはすでに$count台の他のデバイスから接続されています。どうしますか？',
      one: 'このボイスチャンネルにはすでに1台の他のデバイスから接続されています。どうしますか？',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'このデバイスに切り替える';

  @override
  String get voiceConnectionConfirmJustJoin => '参加する（他の接続を維持）';

  @override
  String get voiceConnectionConfirmDoNothing => '何もしない（参加しない）';

  @override
  String get voiceJoinFailedTitle => 'ボイスに参加できませんでした';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      '他のデバイスから切断できませんでした。しばらくしてからもう一度お試しください。';

  @override
  String get voiceChannelEmptyDescription => 'これはボイスチャンネルです。話すには接続してください！';

  @override
  String get voiceChannelJoin => 'ボイスチャンネルに参加';

  @override
  String get voiceCallJoin => '通話に参加';

  @override
  String get voiceChannelJoinConnect => 'ボイスに接続';

  @override
  String get voiceChannelNoConnectPermission => 'このボイスチャンネルに参加する権限がありません';

  @override
  String get voiceChannelE2eeEncrypted => 'マイク、カメラ、画面共有の内容はエンドツーエンドで暗号化されます。';

  @override
  String get voiceCallE2eeEncrypted => 'マイク、カメラ、画面共有の内容はエンドツーエンドで暗号化されます。';

  @override
  String get voiceChannelE2eeBroken =>
      'サポートされていない参加者がこのボイスチャンネルにいるため、エンドツーエンド暗号化は利用できません。';

  @override
  String get voiceCallE2eeBroken =>
      'サポートされていない参加者がこの通話に含まれているため、エンドツーエンド暗号化は利用できません。';

  @override
  String get voiceE2eeUpdateRequired =>
      'この暗号化された通話に参加する前に、このクライアントを更新する必要があります。';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'マイクを開始できませんでした。通話には接続されたままです。';

  @override
  String get voiceChannelStatusConnecting => '接続中…';

  @override
  String get voiceChannelStatusConnected => '接続済み';

  @override
  String get voiceChannelStatusError => 'エラー';

  @override
  String get voiceParticipantTooltipMobileDevice => 'モバイルデバイス';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'デスクトップデバイス';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'コミュニティによってミュートされています';

  @override
  String get voiceParticipantTooltipMuted => 'ミュート中';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'コミュニティによってミュート解除不可にされています';

  @override
  String get voiceParticipantTooltipDeafened => 'ミュート解除不可';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return '接続: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '参加者$count名',
      one: '参加者1名',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => '退出';

  @override
  String get voiceControlMute => 'ミュート';

  @override
  String get voiceControlUnmute => 'ミュート解除';

  @override
  String get voiceControlDeafen => 'ミュート解除不可';

  @override
  String get voiceControlUndeafen => 'ミュート解除不可解除';

  @override
  String get voiceControlVideo => 'ビデオ';

  @override
  String get voiceControlFlipCamera => 'カメラを切り替える';

  @override
  String get voiceControlScreenShare => '画面共有';

  @override
  String get voiceScreenShareNotificationText => '画面を共有しています。';

  @override
  String get voiceControlMore => 'その他';

  @override
  String get voiceControlDisconnect => '切断';

  @override
  String get voiceInChat => 'ボイスチャットに参加中';

  @override
  String get voiceConnectionFailed => '接続に失敗しました';

  @override
  String get voiceConnectionRetry => 'もう一度お試しください';

  @override
  String get voiceConnectionDismiss => '閉じる';

  @override
  String get voiceConnectionDisconnected => '切断されました';

  @override
  String voicePingMs(int currentLatency) {
    return 'Ping: ${currentLatency}ms';
  }

  @override
  String get voiceMeasuringLatency => '遅延を測定中…';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return '$channelSourceLabelへ移動';
  }

  @override
  String get voiceConnectionTitle => '音声接続';

  @override
  String get voiceConnectionAdvancedStats => '詳細設定';

  @override
  String get voiceShowCallAvatars => '通話アバターを表示';

  @override
  String get voiceShowConnectionId => '接続IDを表示';

  @override
  String get voiceAudioProcessing => '音声処理中';

  @override
  String get voiceConnectionSessionSection => 'セッション';

  @override
  String get voiceConnectionDurationLabel => '時間';

  @override
  String get voiceConnectionParticipantsLabel => '参加者';

  @override
  String get voiceConnectionNetworkSection => 'ネットワーク';

  @override
  String get voiceConnectionPingLabel => 'Ping';

  @override
  String get voiceConnectionJitterLabel => 'ジッター';

  @override
  String get voiceConnectionSendLabel => '送信';

  @override
  String get voiceConnectionReceiveLabel => '受信';

  @override
  String get voiceConnectionUnavailable => '—';

  @override
  String voiceConnectionDuration(int minutes, int seconds) {
    return '$minutes分 $seconds秒';
  }

  @override
  String voiceConnectionLatencyMs(int latency) {
    return '$latency ミリ秒';
  }

  @override
  String voiceConnectionJitterMs(String jitter) {
    return '$jitter ミリ秒';
  }

  @override
  String voiceConnectionBandwidthKbps(String bandwidth) {
    return '$bandwidth kbps';
  }

  @override
  String get userAreaMuteMicrophone => 'マイクをミュート';

  @override
  String get userAreaUnmuteMicrophone => 'マイクのミュートを解除';

  @override
  String get userAreaUserSettings => 'ユーザー設定';

  @override
  String get voiceParticipantMenuViewProfile => 'プロフィールを見る';

  @override
  String get voiceParticipantMenuFocus => 'この人にフォーカス';

  @override
  String get voiceParticipantMenuUnfocus => 'フォーカスを外す';

  @override
  String get voiceParticipantMenuCommunityMute => 'コミュニティミュート';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'コミュニティ側スピーカーミュート';

  @override
  String get voiceParticipantMenuUserVolume => 'ユーザーの音量';

  @override
  String get voiceParticipantMenuStreamVolume => 'ストリーム音量';

  @override
  String get voiceParticipantMenuStopStreaming => 'ストリーミングを停止';

  @override
  String get voiceParticipantModerationFailed => 'メンバーを更新できませんでした。もう一度お試しください。';

  @override
  String get voiceControlChat => 'チャット';

  @override
  String get voiceCallViewModeLabel => '表示';

  @override
  String get voiceCallViewModeGrid => 'グリッド';

  @override
  String get voiceCallViewModeFocus => '集中モード';

  @override
  String get voicePanelSettingsSectionTitle => '音声設定';

  @override
  String get voicePanelUseEarpieceLabel => 'イヤースピーカーを使用';

  @override
  String get voicePanelOnlyShowVideosLabel => '動画のみ表示';

  @override
  String get voicePanelOnlyShowVideosDescription => 'カメラをオンにしている参加者のみを表示';

  @override
  String get voicePanelShowOwnCameraLabel => '自分のカメラを表示';

  @override
  String get voicePrioritizeSpeakersLabel => '発言者を優先表示';

  @override
  String get voiceTextChatShow => 'チャットを表示';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '#件の未読メッセージがあります',
      one: '#件の未読メッセージがあります',
    );
    return '$_temp0 チャットを表示';
  }

  @override
  String get voiceCameraPermissionRequired => 'ビデオにはカメラの権限が必要です。';

  @override
  String get voiceErrorScreenShareToggle => '画面共有を開始できませんでした。もう一度お試しください。';

  @override
  String get voiceErrorScreenSharePermissionDenied => '画面共有の権限が拒否されました。';

  @override
  String get voiceErrorScreenShareUnsupported => 'このデバイスでは画面共有は利用できません。';

  @override
  String get voiceWatchStream => 'ストリームを視聴';

  @override
  String get voiceStopWatching => '視聴を停止';

  @override
  String get voiceStopWatchingCurrentStreamTooltip => '現在のストリームの視聴を停止';

  @override
  String get voiceOwnScreenShareTitle => 'ブロードキャスト中です';

  @override
  String get voiceOwnScreenShareSubtitle => 'あなたのストリームは参加者に公開されています。';

  @override
  String get voiceLiveBadge => 'ライブ';

  @override
  String get dmVoiceViewCall => '通話を表示';

  @override
  String get dmVoiceCallFullScreen => 'フルスクリーン';

  @override
  String get dmVoiceCallFullScreenTooltip => '通話をフルスクリーンで開く';

  @override
  String get dmVoiceStripStatusConnecting => '接続中…';

  @override
  String get dmVoiceStripStatusInCall => '通話中';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'ボイス通話';

  @override
  String get dmVoiceCallBarConnecting => '接続中…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'ダイレクト通話';

  @override
  String get dmVoiceCallBarGroupPrimary => 'グループ通話';

  @override
  String get dmVoiceCallBarIssueFallback => 'ボイスの問題';

  @override
  String get dmVoiceFullscreenTitle => 'ボイス';

  @override
  String get voiceCallBarGuildConnectedFallback => 'ボイス接続済み';

  @override
  String get notificationsPageTitle => '通知';

  @override
  String get notificationsFilterUnreads => '未読';

  @override
  String get notificationsFilterMentions => 'メンション';

  @override
  String get notificationsBookmarksTooltip => 'ブックマーク';

  @override
  String get notificationsMentionFilterTooltip => 'メンションをフィルタリング';

  @override
  String get notificationsMentionFiltersTitle => 'メンションフィルタ';

  @override
  String get notificationsMentionIncludeEveryone => '@everyoneと@hereメンションを含める';

  @override
  String get notificationsMentionIncludeRoles => 'ロールメンションを含める';

  @override
  String get notificationsMentionIncludeGuilds => 'すべてのコミュニティメンションを含める';

  @override
  String get notificationsNoUnreadTitle => '未読メッセージはありません';

  @override
  String get notificationsNoUnreadBody => 'すべて確認済みです。';

  @override
  String get notificationsNoMentionsTitle => '最近のメンションはありません';

  @override
  String get notificationsNoMentionsBody => 'あなたへの@メンションはすべて7日間ここに表示されます。';

  @override
  String get notificationsMentionsEndTitle => '最後まで表示しました';

  @override
  String get notificationsMentionsEndBody => '最近のメンションはすべて確認しました。すぐにまた表示されます。';

  @override
  String get notificationsJump => '移動';

  @override
  String get notificationsRemoveMentionTooltip => 'メンションを削除';

  @override
  String get notificationsViewAllUnread => 'すべて未読を表示';

  @override
  String get notificationsMarkAsRead => '既読にする';

  @override
  String get notificationsExpand => '展開';

  @override
  String get notificationsCollapse => '折りたたむ';

  @override
  String get notificationsMessageUnavailable => 'このメッセージを読み込めませんでした。';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining文字残っています';
  }

  @override
  String get characterCounterTooLong => 'メッセージが長すぎます';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining文字残っています。$productNameを入手すると、最大$premiumMaxLength文字まで書けます。';
  }

  @override
  String get chatMessageFailedToSend => 'メッセージの送信に失敗しました';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'メッセージを配信できませんでした。これは通常、受信者とコミュニティを共有していないか、受信者が友人からのダイレクトメッセージのみを受け付けているためです。また、$settingsPathでご自身のダイレクトメッセージのプライバシー設定を調整する必要がある場合もあります。';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'メッセージを配信できませんでした。ダイレクトメッセージを送信するには、アカウントの請求を完了する必要があります。';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'メッセージを配信できませんでした。メッセージを送信するには、アカウントの請求を完了する必要があります。';

  @override
  String get chatSendFailureContentBlocked =>
      '安全システムによってフラグが付けられたため、メッセージを配信できませんでした。これが間違いであると思われる場合は、サポートにお問い合わせください。';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'このコンテキストで許可されていない成人向け絵文字またはステッカーが含まれているため、メッセージを配信できませんでした。';

  @override
  String get chatClientSystemOnlyYouCanSee => 'あなただけがこのメッセージを見ることができます。';

  @override
  String get chatClientSystemDismiss => '閉じる';

  @override
  String get privacyDashboardCommunicationSection => 'コミュニケーション';

  @override
  String get privacyDashboardProfilePrivacySection => 'プロフィールプライバシー';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection => '友達とダイレクトメッセージ';

  @override
  String get privacyDashboardActivitySharingSection => 'アクティビティの共有';

  @override
  String get privacyDashboardSensitiveContentSection => 'センシティブなコンテンツ';

  @override
  String get privacyDashboardDataExportSection => 'データのエクスポート';

  @override
  String get privacyDashboardDataDeletionSection => 'データ削除';

  @override
  String get privacyDashboardProfilePrivacyTitle => 'あなたのプロフィール全体を閲覧できるユーザー';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities => '友達とすべてのコミュニティ';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'プロフィール全体が友達とコミュニティのメンバーに公開されます';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities => '友達と小規模コミュニティのみ';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'あなたの完全なプロフィールは、友達とメンバー数が200人以下のコミュニティのメンバーに表示されます';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => '友だちのみ';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'プロフィール全体は友達にのみ表示されます';

  @override
  String get privacyDashboardFriendRequestsTitle => '友だち追加';

  @override
  String get privacyDashboardFriendRequestsEveryone => '全員';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      '誰でもあなたに友達リクエストを送信できるようにする';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends => '友達の友達';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      '友達の友達からのリクエストを許可する';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers => 'コミュニティメンバー';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      '参加中のコミュニティのメンバーからのリクエストを許可する';

  @override
  String get privacyDashboardDirectMessagesTitle => 'ダイレクトメッセージ';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'コミュニティメンバーからのダイレクトメッセージを許可';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      '参加中のコミュニティのメンバーからのダイレクトメッセージを許可する';

  @override
  String get privacyDashboardDirectMessagesBots => 'コミュニティボットからのダイレクトメッセージを許可';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      '参加中のコミュニティのボットからのダイレクトメッセージを許可する';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      '友達リクエストやダイレクトメッセージを送信できるユーザーを管理します';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      '通話やグループチャットへの追加を許可する相手を管理';

  @override
  String get privacyDashboardIncomingCallsTitle => '着信';

  @override
  String get privacyDashboardIncomingCallsDesc => '誰があなたに電話できるかを管理する';

  @override
  String get privacyDashboardAllowedCallers => '許可された発信元';

  @override
  String get privacyDashboardIncomingCallNobody => '誰も';

  @override
  String get privacyDashboardIncomingCallNobodyDesc => 'すべての着信をブロックする';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => '友達のみ';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      '友達からの通話のみを許可する（推奨）';

  @override
  String get privacyDashboardIncomingCallCustom => '友達 + カスタム';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      '友達と、追加で選択したグループからの通話を許可する';

  @override
  String get privacyDashboardIncomingCallEveryone => '全員';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc => '知らない人からの着信も許可する';

  @override
  String get privacyDashboardAdditionalGroups => '追加のグループ';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      '友達の友達から電話がかかってくることがあります';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'お互いが参加しているコミュニティのメンバーから電話がかかってきます';

  @override
  String get privacyDashboardRingBehavior => 'リングの動作';

  @override
  String get privacyDashboardSilentCalls => '全員からの着信をサイレントにする';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'すべての通話は、鳴る代わりにサイレントで通知されます。デフォルトでは、友達以外からの通話は常にサイレントになります。';

  @override
  String get privacyDashboardGroupDmTitle => 'グループチャットに招待できるユーザー';

  @override
  String get privacyDashboardGroupDmDesc =>
      '誰があなたをグループチャットに追加できるかを管理します。招待リンクは引き続き送信できます。';

  @override
  String get privacyDashboardAllowedInvites => '許可された招待';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'グループチャットへの追加を許可するかどうか、全員に確認する';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      '友達のみがあなたを招待できるようにする（推奨）';

  @override
  String get privacyDashboardGroupDmCustomDesc => '友達やその他のグループからの追加を許可する';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      '誰でも確認なしでグループチャットに追加できるようにする';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      '友達の友達があなたをグループチャットに追加できるようになります';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'お互いが参加しているコミュニティのメンバーが、あなたをグループチャットに追加できるようになります';

  @override
  String get privacyDashboardVoiceActivityTitle => 'オンライン状況での音声アクティビティ';

  @override
  String get privacyDashboardShareVoiceActivity => '音声アクティビティを友達と共有する';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'すべての友達に音声アクティビティを共有しますか？';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'すべてのフレンドとの音声アクティビティの共有を停止しますか？';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'これから、あなたの音声アクティビティがすべてのフレンド（将来のフレンドも含む）に共有されます。これにより、全員に更新情報が送信され、次に変更できるのは24時間後になります。';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      '音声アクティビティの共有を停止すると、現在のすべてのフレンドと今後追加されるフレンドにその情報が送信されます。この設定は24時間後に再度変更できます。';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm => 'はい、すべての友達と共有します';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm => 'はい、共有を停止します';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return '$time後に再度利用可能になります';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated => '音声アクティビティの共有設定を更新しました';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      '音声アクティビティの共有を更新できませんでした';

  @override
  String get privacyDashboardDataExportDesc =>
      'メッセージや添付ファイルのURLなど、アカウントデータのダウンロード可能なアーカイブを作成します。ほとんどのユーザーはすべてのデータを希望しますが、以下で範囲を絞り込むこともできます。';

  @override
  String get privacyDashboardExportMyData => 'データをエクスポート';

  @override
  String get privacyDashboardDataDeletionDesc =>
      '送信したメッセージをDM、グループDM、コミュニティから完全に削除します。この処理はバックグラウンドで実行され、完了するとDMでお知らせします。';

  @override
  String get privacyDashboardDeleteMyMessages => '自分のメッセージを削除';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'コミュニティメンバーからのダイレクトメッセージを許可しますか？';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'コミュニティメンバーからのダイレクトメッセージをブロックしますか？';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'ボットからのダイレクトメッセージを許可しますか？';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'ボットからのダイレクトメッセージをブロックしますか？';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      '既存のコミュニティのメンバーからのダイレクトメッセージも許可しますか？';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      '既存のコミュニティメンバーからのダイレクトメッセージもブロックしますか？';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      '既存のコミュニティのボットからダイレクトメッセージを受信することも許可しますか？';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      '既存のコミュニティにいるbotもブロックしますか？';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'コミュニティごとにこの設定を変更することもできます。コミュニティ名を長押しして「プライバシー設定」を選択してください。';

  @override
  String get privacyDashboardDmConfirmAllowAll => 'すべてのコミュニティを許可';

  @override
  String get privacyDashboardDmConfirmBlockAll => 'すべてのコミュニティでブロック';

  @override
  String get privacyDashboardDmConfirmSkip => 'スキップ';

  @override
  String get privacyDashboardDataRequestGoBack => '戻る';

  @override
  String get privacyDashboardDataRequestExportTitle => 'データをエクスポート';

  @override
  String get privacyDashboardDataRequestDeleteTitle => '自分のメッセージを削除';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'できるだけ早く処理します。アーカイブの準備ができましたら、メールでお知らせします。';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'できるだけ早く処理します。完了したらDMでお知らせします。';

  @override
  String get privacyDashboardDataRequestScopeTitle => '含めるもの';

  @override
  String get privacyDashboardDataRequestExportEverything => 'すべて';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      '送信したすべてのメッセージ、アカウント設定、メンバーシップ、メタデータをエクスポートします。';

  @override
  String get privacyDashboardDataRequestExportCustom => 'カスタム選択';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'アーカイブに含める会話の種類、コミュニティ、期間を選択してください。';

  @override
  String get privacyDashboardDataRequestDeleteSelected => '含めるものを選択';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      '削除する会話の種類を選択してください。';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible => 'アクセスできなくなった場所のみ';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      '退会済みまたは削除済みのコミュニティとグループDMのメッセージのみを削除します。';

  @override
  String get privacyDashboardDataRequestKindsTitle => '会話の種類';

  @override
  String get privacyDashboardDataRequestKindsBody => '含める会話の種類を切り替えます。';

  @override
  String get privacyDashboardDataRequestKindDms => 'DMを開く';

  @override
  String get privacyDashboardDataRequestKindDmsClosed => 'クローズしたDM';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'グループDM';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'コミュニティ';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'コミュニティを選択';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'コミュニティフィルター';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      '選択したものを除くすべてを含める';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude => '選択した項目のみ';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      '現在、コミュニティに参加していません。';

  @override
  String get privacyDashboardDataRequestWhenTitle => '期間';

  @override
  String get privacyDashboardDataRequestDateMode => '期間';

  @override
  String get privacyDashboardDataRequestAllTime => 'すべて';

  @override
  String get privacyDashboardDataRequestCustomRange => '期間を指定';

  @override
  String get privacyDashboardDataRequestStartDate => '開始日';

  @override
  String get privacyDashboardDataRequestEndDate => '終了日';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'どちらかの項目を空欄にすると、その期間の指定がなくなります。';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      '少なくとも1種類の会話を選択してください。';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      '開始日は終了日より前に設定してください。';

  @override
  String get privacyDashboardDataRequestConfirmTitle => '内容を確認して確定';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'これまでに送信したすべてのメッセージをダウンロード可能なアーカイブとして作成し、準備ができたらメールでお知らせします。メール内のダウンロードリンクは7日間で期限切れになります。';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      '指定されたフィルターに一致するダウンロード可能なアーカイブを作成し、準備ができたらメールでお知らせします。メール内のダウンロードリンクは7日後に期限切れになります。';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      '以下のフィルターに一致するメッセージを完全に削除します。この操作は元に戻せません。';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      '一度開始すると元に戻せません。完了したらDMでお知らせします。';

  @override
  String get privacyDashboardDataRequestRequestExport => 'データエクスポートをリクエスト';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'メッセージを削除';

  @override
  String get privacyDashboardDataRequestSummaryScope => '範囲';

  @override
  String get privacyDashboardDataRequestSummaryConversations => '会話';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'コミュニティ';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => '期間';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'なし';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return '$startから';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return '$endまで';
  }

  @override
  String privacyDashboardDataRequestSummaryBetween(String start, String end) {
    return '$start～$end';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildExclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '#コミュニティを除くすべて',
      one: '#コミュニティを除くすべて',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '#コミュニティのみ',
      one: '#コミュニティのみ',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen => '開いているダイレクトメッセージ';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed => 'クローズしたダイレクトメッセージ';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'ダイレクトメッセージ（オープンおよびクローズ済み）';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'グループDM';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded => 'コミュニティ';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '#時間',
      one: '#時間',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '#分',
      one: '#分',
    );
    return '$_temp0と$_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '#時間',
      one: '#時間',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '#分',
      one: '#分',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '#秒',
      one: '#秒',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed => 'プライバシー設定の読み込みに失敗しました';

  @override
  String get privacyDashboardRetry => '再試行';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      '機密コンテンツの設定の保存に失敗しました。';

  @override
  String get privacyDashboardDataRequestFailed => 'リクエストを完了できませんでした。';

  @override
  String get chatMessageDeleteFailed => 'メッセージの削除に失敗しました';

  @override
  String get chatMessageAddReaction => 'リアクションを追加';

  @override
  String get chatMessageEdit => 'メッセージを編集';

  @override
  String get chatMessageReply => '返信する';

  @override
  String get chatMessageForward => '転送する';

  @override
  String get forwardMessageTitle => 'メッセージを転送';

  @override
  String get forwardSearchHint => 'チャンネルまたはDMを検索';

  @override
  String get forwardDirectMessagesSection => 'ダイレクトメッセージ';

  @override
  String get forwardCommentHint => 'コメントを追加（任意）';

  @override
  String forwardSendButton(int count, int limit) {
    return '送信 ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'チャンネルが見つかりません';

  @override
  String get forwardSuccessToast => 'メッセージを転送しました';

  @override
  String get forwardFailed => 'メッセージの転送に失敗しました';

  @override
  String get forwardCommentSlowmodeDisabled =>
      '選択したチャンネルでスローモードが有効になっているため、コメントは利用できません。';

  @override
  String get forwardSendSlowmodeBlocked => '選択したチャンネルの低速モードが解除されるまで待機しています.';

  @override
  String get slowmodeRateLimitedTitle => '低速モードがオンです';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'スローモードがオンです。次のメッセージを送信するまで$durationお待ちください。';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'スローモード中はダイレクトアップロードが無効になります。';

  @override
  String get shareMediaTitle => '共有';

  @override
  String get shareMediaMessageHint => 'メッセージを追加（任意）…';

  @override
  String get shareMediaSendButton => '送信';

  @override
  String get shareMediaSuccessToast => 'メディアを共有しました';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return '$count 件先に共有しました';
  }

  @override
  String get shareMediaFailedToast => 'メディアの共有に失敗しました';

  @override
  String get forwardDestinationNoSendPermission => 'ここにメッセージを送信できません';

  @override
  String get forwardDestinationNoEmbedPermission => 'ここにリンクを埋め込めません';

  @override
  String get forwardDestinationNoAttachPermission => 'ここにファイルを添付できません';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'このコミュニティではメッセージの送信が無効になっています';

  @override
  String get forwardDestinationTimedOut => 'このコミュニティではタイムアウト中です';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'スローモード - $remaining待機';
  }

  @override
  String get chatMessageCopyText => 'メッセージをコピー';

  @override
  String get chatMessageCopyEmbedText => '埋め込みテキストをコピー';

  @override
  String get chatMessageTranslate => '翻訳';

  @override
  String chatMessageTranslatedFrom(String language) {
    return '$languageから翻訳';
  }

  @override
  String get chatMessageSeeOriginal => '元のメッセージを表示';

  @override
  String get chatMessageSeeTranslation => '翻訳を表示';

  @override
  String get chatMessageTranslating => '翻訳中…';

  @override
  String get chatMessageTranslateFailed => 'このメッセージを翻訳できませんでした。';

  @override
  String get chatMessageTranslateUnavailable => 'このデバイスでは翻訳を利用できません。';

  @override
  String get chatMessageSpeak => 'メッセージを読み上げる';

  @override
  String get chatMessageStopSpeaking => '発言をやめる';

  @override
  String get chatMessagePin => 'メッセージをピン留め';

  @override
  String get chatMessageUnpin => 'ピン留めを解除';

  @override
  String get chatMessageUnpinIt => 'ピン留めを解除';

  @override
  String get chatMessageBookmark => 'メッセージをブックマーク';

  @override
  String get chatMessageRemoveBookmark => 'ブックマークを削除';

  @override
  String get chatMessageMarkAsUnread => '未読にする';

  @override
  String get chatMessageCopyMessageLink => 'メッセージリンクをコピー';

  @override
  String get chatMessageOpenLink => 'リンクを開く';

  @override
  String get chatMessageCopyLink => 'リンクをコピー';

  @override
  String get chatMessageCopyMessageId => 'メッセージIDをコピー';

  @override
  String get chatMessageViewReactions => 'リアクションを表示';

  @override
  String get chatMessageRemoveAllReactions => 'すべてのリアクションを削除';

  @override
  String get chatMessageDebug => 'メッセージをデバッグ';

  @override
  String get chatMessageDebugSheetTitle => 'メッセージのデバッグ';

  @override
  String get chatMessageDebugCopyJson => 'JSONをコピー';

  @override
  String get chatMessageDebugJsonCopiedToast => 'メッセージJSONをクリップボードにコピーしました';

  @override
  String get chatReactionsSheetTitle => 'リアクション';

  @override
  String get chatReactionsSheetEmpty => 'まだ誰もリアクションしていません。';

  @override
  String get chatReactionAddFailed => 'リアクションの追加に失敗しました';

  @override
  String get chatReactionRemoveFailed => 'リアクションの削除に失敗しました';

  @override
  String get chatMessageReport => 'メッセージを報告';

  @override
  String get iarReportMessageTitle => 'メッセージを報告';

  @override
  String get iarThisUserFallback => 'このユーザー';

  @override
  String get iarModalDescription => 'ルール違反を報告するか、連絡先や設定を管理するツールを見つけます。';

  @override
  String get iarPathStepAriaLabel => '何が必要ですか？';

  @override
  String get iarCategoryStepTitle => 'どのようなルールが違反されましたか？';

  @override
  String get iarReasonStepTitle => 'どのルールが違反されましたか？';

  @override
  String get iarReasonSelectHint => '理由を選択';

  @override
  String get iarPickAnOptionToast => '続行するにはオプションを選択してください。';

  @override
  String get iarPickARuleToast => '違反されたルールを選択してください。';

  @override
  String get iarPathPlatform => 'プラットフォームのルール違反を報告';

  @override
  String get iarPathCommunity => 'このコミュニティのモデレーターに報告';

  @override
  String get iarPathPreferenceMessage => 'このコンテンツは好きではありません';

  @override
  String get iarCategoryTargetedHarmLabel => '脅迫、嫌がらせ、または危害';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'いじめ、脅迫、ヘイトスピーチ、暴力、荒らし、または自傷行為を助長するコンテンツ。';

  @override
  String get iarCategorySafetyMinorsLabel => '児童の安全または不適切なコンテンツ';

  @override
  String get iarCategorySafetyMinorsDescription =>
      '未成年者の危険、不適切な場所での不適切コンテンツ、または望まない行為。';

  @override
  String get iarCategoryPrivacyIdentityLabel => 'プライバシーまたはなりすまし';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      '個人情報の暴露、ストーキング、他人のふり、または不適切なプロフィール。';

  @override
  String get iarCategoryDeceptionLabel => '詐欺、マルウェア、または誤情報';

  @override
  String get iarCategoryDeceptionDescription =>
      'フィッシング、詐欺、悪意のあるリンク、または現実世界での危害を引き起こす可能性のある虚偽の主張。';

  @override
  String get iarCategoryIllegalOtherLabel => '違法行為またはその他の問題';

  @override
  String get iarCategoryIllegalOtherDescription =>
      '違法な販売、犯罪の幇助、または上記に当てはまらない明確なルール違反。';

  @override
  String get iarReasonHarassmentLabel => '嫌がらせまたは脅迫';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'いじめ、繰り返し行われる迷惑行為、ストーキング、または標的を絞った虐待。';

  @override
  String get iarReasonHateLabel => 'ヘイトスピーチ';

  @override
  String get iarReasonHateMessageDescription =>
      '差別用語、非人間的な言葉遣い、または保護されたグループへの攻撃。';

  @override
  String get iarReasonViolenceLabel => '暴力または暴力的な脅迫';

  @override
  String get iarReasonViolenceDescription => '信憑性のある脅迫、過激な暴力、または暴力の賛美。';

  @override
  String get iarReasonMatureContentLabel => '不適切なコンテンツまたは嫌がらせ';

  @override
  String get iarReasonMatureContentMessageDescription =>
      '不適切な場所での望まない行為または不適切なコンテンツ。';

  @override
  String get iarReasonChildSafetyLabel => '児童の安全または未成年者の搾取';

  @override
  String get iarReasonChildSafetyMessageDescription => 'グルーミングまたは未成年者搾取のコンテンツ。';

  @override
  String get iarReasonHarmfulMisinfoLabel => '有害な誤情報';

  @override
  String get iarReasonHarmfulMisinfoDescription => '現実世界での危害を引き起こす可能性のある虚偽の主張。';

  @override
  String get iarReasonSpamLabel => 'スパム、詐欺、またはフィッシング';

  @override
  String get iarReasonSpamMessageDescription => '大量のスパム、詐欺、偽の景品、またはアカウントの悪用。';

  @override
  String get iarReasonMalwareLabel => 'マルウェアまたは危険なリンク';

  @override
  String get iarReasonMalwareDescription => 'マルウェア、認証情報窃盗、または有害なファイル。';

  @override
  String get iarReasonPrivacyLabel => 'プライバシー侵害';

  @override
  String get iarReasonPrivacyDescription => '個人情報の暴露、プライベート情報の漏洩、またはストーキング。';

  @override
  String get iarReasonImpersonationLabel => 'なりすましまたは詐欺的なメディア';

  @override
  String get iarReasonImpersonationMessageDescription =>
      '他人になりすますこと、AI生成の詐欺的コンテンツを含む。';

  @override
  String get iarReasonIllegalLabel => '違法行為';

  @override
  String get iarReasonIllegalDescription => '違法な販売、犯罪の幇助、または違法行為。';

  @override
  String get iarReasonSelfHarmLabel => '自傷行為または自殺';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      '自傷行為または摂食障害を助長または指示するコンテンツ。';

  @override
  String get iarReasonOtherLabel => 'その他の明確なルール違反';

  @override
  String iarReasonOtherDescription(String productName) {
    return '$productNameのルールに明確に違反し、上記に当てはまらない場合のみ使用してください。';
  }

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return '未成年者が関与している場合は、代わりに「$childSafetyReason」を使用してください。';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'CSAMまたは未成年者の搾取が関わる場合は、すぐに送信し、資料を再共有しないでください。';

  @override
  String get iarSafetyNoteSelfHarm =>
      '誰かが差し迫った危険にさらされている可能性がある場合は、安全にできる限り、現地の緊急サービスに連絡してください。';

  @override
  String get iarSafetyNoteViolence => '差し迫った脅迫である場合は、現地の緊急サービスにも連絡してください。';

  @override
  String get iarSafetyNoteTerrorism => '差し迫ったテロの脅威である場合は、現地の緊急サービスにも連絡してください。';

  @override
  String get iarActionBlockUserTitle => 'このユーザーをブロック';

  @override
  String get iarActionBlockUserDescription => 'メッセージとフレンドリクエストを停止します。';

  @override
  String get iarActionBlockUserButton => 'ブロック';

  @override
  String get iarActionCopyMessageLinkTitle => 'メッセージリンクをコピー';

  @override
  String get iarActionCopyMessageLinkDescription => 'コミュニティモデレーターと共有します。';

  @override
  String get iarActionCopyMessageLinkButton => 'コピー';

  @override
  String get iarActionCloseDmTitle => 'このDMを閉じる';

  @override
  String get iarActionCloseDmDescription => 'ブロックはしません。後で再開できます。';

  @override
  String get iarActionCloseDmButton => 'DMを閉じる';

  @override
  String get iarActionLeaveCommunityTitle => 'コミュニティを退出';

  @override
  String get iarActionLeaveCommunityDescription => 'コンテンツとメンバーの表示を停止します。';

  @override
  String get iarActionLeaveCommunityButton => '退出';

  @override
  String get iarActionDmSettingsTitle => 'DMとフレンドリクエストの設定';

  @override
  String get iarActionDmSettingsDescription => 'あなたに連絡できるユーザーを変更します。';

  @override
  String get iarActionCallSettingsTitle => '通話とグループチャットの設定';

  @override
  String get iarActionCallSettingsDescription => 'あなたに通話または追加できるユーザーを変更します。';

  @override
  String get iarActionOpenButton => '開く';

  @override
  String get iarActionDeleteMessageTitle => 'このメッセージを削除';

  @override
  String get iarActionDeleteMessageDescription => '全員のためにチャンネルから削除します。';

  @override
  String get iarActionDeleteMessageButton => '削除';

  @override
  String get iarActionDeleteMessageDeletedButton => '削除済み';

  @override
  String get iarActionDeleteMessageDeletedTooltip => 'このメッセージはすでに削除されています。';

  @override
  String get iarActionBanUserTitle => 'このユーザーをBAN';

  @override
  String get iarActionBanUserDescription => 'このコミュニティのBANダイアログを開きます。';

  @override
  String get iarActionBanUserButton => 'BAN';

  @override
  String get iarActionBanUserBannedButton => 'BAN済み';

  @override
  String get iarActionBanUserBannedTooltip => 'このユーザーはすでにコミュニティからBANされています。';

  @override
  String get iarCloseDmConfirmTitle => 'DMを閉じる';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return '$nameとの現在のDMを閉じます。ブロックされるわけではありません。後で再開できます。';
  }

  @override
  String get iarSuccessTitle => 'レポートを送信しました';

  @override
  String get iarSuccessBody => '安全チームが確認中です。判定に達したらDMとメールでお知らせします。';

  @override
  String get iarAlreadyReportedTitle => 'すでに報告済み';

  @override
  String get iarAlreadyReportedBody => 'このメッセージはすでに報告されています。安全チームが確認中です。';

  @override
  String get iarBackButton => '戻る';

  @override
  String get iarContinueButton => '続行';

  @override
  String get iarSendReportButton => 'レポートを送信';

  @override
  String get iarDoneButton => '完了';

  @override
  String get iarCouldntSendToast => 'レポートを送信できませんでした。もう一度お試しください。';

  @override
  String get iarRateLimitedToast => '報告が速すぎます。しばらく待ってからもう一度お試しください。';

  @override
  String get iarReportSentToast => 'レポートを送信しました。安全チームが確認します。';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return '$nameをブロックしますか？相手はあなたにメッセージを送ったり、フレンドリクエストを送ったりできなくなります。後でブロック解除できます。';
  }

  @override
  String get iarBlockUserFailedToast => 'このユーザーをブロックできませんでした。もう一度お試しください。';

  @override
  String get iarCloseDmSuccessToast => 'DMを閉じました。';

  @override
  String get iarCloseDmFailedToast => 'このDMを閉じることができませんでした。もう一度お試しください。';

  @override
  String get iarLeaveCommunityFailedToast => 'このコミュニティを退出できませんでした。もう一度お試しください。';

  @override
  String get chatMessageSuppressEmbeds => '埋め込みを抑制';

  @override
  String get chatMessageUnsuppressEmbeds => '埋め込みを解除';

  @override
  String get chatMessageDelete => 'メッセージを削除';

  @override
  String get chatMessageDeleteConfirmTitle => 'メッセージを削除';

  @override
  String get chatMessageDeleteConfirmDescription => 'このメッセージを削除してもよろしいですか？';

  @override
  String get chatMessageDeleteAttachment => '添付ファイルを削除';

  @override
  String get chatMessageEditAttachmentAltText => '代替テキストを編集';

  @override
  String get chatMessageMore => 'その他';

  @override
  String get chatEditingMessage => 'メッセージを編集中';

  @override
  String get chatReplyOriginalDeleted => '元のメッセージは削除されました';

  @override
  String get chatReplyOriginalFailedToLoad => '元のメッセージを読み込めませんでした';

  @override
  String get chatReplyAttachedMedia => 'メッセージにメディアが添付されています';

  @override
  String chatBlockedMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ブロックされたメッセージ$count件',
      one: 'ブロックされたメッセージ1件',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のスパムメッセージの可能性',
      one: 'スパムメッセージの可能性が1件',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor => '元の投稿者がブロックされているため、返信は非表示です。';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      '元の投稿者がスパムユーザーとしてマークされているため、返信は非表示になっています。';

  @override
  String get devMarkAsSpamLocally => 'スパムとしてローカルでマーク';

  @override
  String get devIgnoreSpamFlag => 'スパム報告を無視';

  @override
  String get chatMessagesLoadError => 'メッセージを読み込めませんでした。';

  @override
  String get chatReplyMentionOverrideTitle => 'メンション設定を上書きしますか？';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNicknameは返信時にメンションされることを希望しています。それでもメンションなしで送信しますか？';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNicknameさんは返信時にメンションを希望していません。メンションを付けて送信しますか？';
  }

  @override
  String get chatReplyMentionIgnorePreference => '設定を無視';

  @override
  String get chatReplyMentionDisableTooltip => '返信相手へのメンションを無効にするにはクリックしてください';

  @override
  String get chatReplyMentionEnableTooltip => '返信相手へのメンションを有効にするにはクリックしてください';

  @override
  String get chatReplyMentionAccessibilityLabel => '返信相手をメンション';

  @override
  String get chatReplyMentionOn => 'オン';

  @override
  String get chatReplyMentionOff => 'オフ';

  @override
  String get chatReplyCancel => '返信をキャンセル';

  @override
  String get chatEditMessageHint => 'メッセージを編集';

  @override
  String get chatEditNoChanges => '変更がありません';

  @override
  String get chatChannelNotReady => 'このチャンネルはまだ準備ができていません。しばらくしてからもう一度お試しください。';

  @override
  String get chatMessageEdited => '（編集済み）';

  @override
  String get chatMessageSilent => 'これは@silentメッセージです。';

  @override
  String chatMessageTimestampToday(String time) {
    return '今日 $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return '昨日 $time';
  }

  @override
  String get mediaViewerImagePreview => '画像のプレビュー';

  @override
  String get mediaViewerClose => 'メディアビューアを閉じる';

  @override
  String get mediaViewerOpenInBrowser => 'ブラウザで開く';

  @override
  String get mediaViewerOptions => 'メディアオプション';

  @override
  String get mediaViewerCopyLink => 'リンクをコピー';

  @override
  String get mediaViewerForward => '転送';

  @override
  String get mediaViewerZoomIn => '拡大';

  @override
  String get mediaViewerZoomOut => '縮小';

  @override
  String get mediaViewerPreviousAttachment => '前の添付ファイル';

  @override
  String get mediaViewerNextAttachment => '次の添付ファイル';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String mediaViewerAttachmentThumbnail(int index) {
    return '添付ファイル $index';
  }

  @override
  String get mediaViewerDismissBackdrop => '閉じる';

  @override
  String get chatAttachmentVideoToggleControls => '動画コントロールの切り替え';

  @override
  String get chatAttachmentVideoMute => '動画をミュート';

  @override
  String get chatAttachmentVideoUnmute => '動画のミュートを解除';

  @override
  String get chatAttachmentVideoPlay => '動画を再生';

  @override
  String get chatAttachmentVideoPause => '動画を一時停止';

  @override
  String get chatAttachmentVideoProgress => '動画の進捗';

  @override
  String get chatVideoPlaybackFailed => 'この動画を再生できませんでした。';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'このロールを持ち、このチャンネルを表示する権限を持つユーザーに通知します。';

  @override
  String get composerAutocompleteSuggestions => '候補';

  @override
  String get composerAutocompleteCommandsHeading => 'コマンド';

  @override
  String get composerAutocompleteChoicesHeading => '選択肢';

  @override
  String get composerAutocompleteOptionalArgumentsHeading => 'オプション引数';

  @override
  String get composerAutocompleteChannelsHeading => 'チャンネル';

  @override
  String get composerAutocompleteMembersHeading => 'メンバー';

  @override
  String get composerAutocompleteUsersHeading => 'ユーザー';

  @override
  String get composerAutocompleteMentionsHeading => 'メンション';

  @override
  String get composerAutocompleteRolesHeading => 'ロール';

  @override
  String get composerAutocompleteMediaHeading => 'メディア';

  @override
  String get composerAutocompleteStickersHeading => 'スタンプ';

  @override
  String get composerAutocompleteGifsHeading => 'GIF';

  @override
  String get composerAutocompleteNoGifs => 'GIFが見つかりませんでした';

  @override
  String get composerCommandShrugDescription => 'メッセージに ¯\\_(ツ)_/¯ を追加します。';

  @override
  String get composerCommandTableflipDescription =>
      'メッセージに (╯°□°)╯︵ ┻━┻ を追加します。';

  @override
  String get composerCommandUnflipDescription => 'メッセージに ┬─┬ ノ( ゜-゜ノ) を追加します。';

  @override
  String get composerCommandMeDescription => 'アクションメッセージを送信（斜体で表示）.';

  @override
  String get composerCommandSpoilerDescription => 'ネタバレメッセージを送信（ネタバレタグで囲みます）.';

  @override
  String get composerCommandTtsDescription => 'テキスト読み上げメッセージを送信.';

  @override
  String get composerCommandNickDescription => 'このコミュニティでのニックネームを変更します。';

  @override
  String get composerCommandKickDescription => 'このコミュニティからメンバーをキックする.';

  @override
  String get composerCommandBanDescription => 'このコミュニティからメンバーをBANする.';

  @override
  String get composerCommandMsgDescription => 'ユーザーにダイレクトメッセージを送信.';

  @override
  String get composerCommandSavedDescription => '保存したメディアを送信.';

  @override
  String get composerCommandStickerDescription => 'スタンプを送信.';

  @override
  String get composerCommandGifDescription => 'GIFを検索して送信.';

  @override
  String get composerCommandMemberOption => '対象のメンバー';

  @override
  String get composerCommandReasonOption => '理由（任意）';

  @override
  String get composerCommandMessageOption => '送信するメッセージ';

  @override
  String get composerCommandQueryOption => '検索対象。';

  @override
  String get composerCommandNicknameOption => '新しいニックネーム。空白のままにするとリセットされます。';

  @override
  String get composerCommandDeleteMessagesOption =>
      'メンバーの最近のメッセージ履歴をどれだけ削除するか。';

  @override
  String get composerCommandDeleteMessagesNone => '削除しない';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return '過去$count日間';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => '過去24時間';

  @override
  String get composerCommandOptionRequired => 'このオプションは必須です。値を入力してください。';

  @override
  String get composerCommandClear => 'コマンドをクリア';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'このコミュニティでのニックネームを**$previousNickname**から**$newNickname**に変更しました。';
  }

  @override
  String get composerCommandUnknownUser => '不明なユーザー';

  @override
  String composerCommandMsgFailed(String username) {
    return '**$username** へのメッセージの送信に失敗しました。DMが無効になっているか、ブロックされている可能性があります。';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count件追加';
  }

  @override
  String get addGuildModalTitle => 'コミュニティを追加';

  @override
  String get addGuildModalLandingDescription =>
      '新しいコミュニティを作成するか、既存のコミュニティに参加します。';

  @override
  String get addGuildCreateCommunity => 'コミュニティを作成';

  @override
  String get addGuildJoinCommunity => 'コミュニティに参加';

  @override
  String get addGuildImportDiscordTemplate => 'Discordテンプレートをインポート';

  @override
  String get addGuildJoinTitle => 'コミュニティに参加';

  @override
  String get addGuildJoinDescription => '招待リンクを入力してコミュニティに参加します。';

  @override
  String get addGuildInviteLinkLabel => '招待リンク';

  @override
  String get addGuildJoinSubmit => 'コミュニティに参加';

  @override
  String get addGuildInviteInvalid => 'この招待は無効か、期限切れです。';

  @override
  String get addGuildJoinFailed => 'コミュニティに参加できませんでした。もう一度お試しください。';

  @override
  String get addGuildCreateTitle => 'コミュニティを作成';

  @override
  String get addGuildCreateDescription => '友だちとチャットするコミュニティを作成.';

  @override
  String get addGuildCreateNameLabel => 'コミュニティ名';

  @override
  String get addGuildCreateSubmit => 'コミュニティを作成';

  @override
  String get addGuildCreateFailed => 'コミュニティを作成できませんでした。もう一度お試しください。';

  @override
  String get addGuildCreateClaimTitle => 'アカウントを登録';

  @override
  String get addGuildCreateClaimDescription => 'コミュニティを作成する前に、アカウントの登録が必要です。';

  @override
  String get addGuildCreateVerifyTitle => 'メールアドレスを確認';

  @override
  String get addGuildCreateVerifyDescription =>
      'コミュニティを作成する前に、メールアドレスの認証が必要です。';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      '新しいコミュニティを作成する際に、アニメーション化された画像は使用できません。静止画像を使用してください。';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'コミュニティを作成することにより、お客様は以下の内容に従い、遵守することに同意するものとします。 ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return '$productNameのコミュニティガイドライン';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'このインスタンスはコミュニティが1つしか許可されていないため、追加のコミュニティを作成することはできません。';

  @override
  String get addGuildCreateChangeIcon => 'アイコンを変更';

  @override
  String get addGuildCreateIconLabel => 'コミュニティアイコン';

  @override
  String get addGuildCreateIconHint =>
      'PNG、JPEG、WebP、AVIF、HEIC、HEIF、JXL、SVG。最大10MB。推奨：512×512px';

  @override
  String get addGuildImportDescription =>
      'DiscordテンプレートのURLを貼り付けて、その構造を新しいコミュニティにインポートします。';

  @override
  String get addGuildImportUrlLabel => 'テンプレートURL';

  @override
  String get addGuildImportUrlInvalid => '有効なDiscordテンプレートのURLまたはコードを入力してください。';

  @override
  String get addGuildImportFetchFailed =>
      'コミュニティテンプレートの取得に失敗しました。テンプレートが存在しないか、外部サービスが利用できない可能性があります。';

  @override
  String get addGuildImportInvalidResponse => 'これは有効なテンプレートの応答ではないようです。';

  @override
  String get addGuildImportTemplateLabel => 'テンプレート';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return 'テキストチャンネル$textChannelCount件、ボイスチャンネル$voiceChannelCount件、カテゴリー$categoryCount件、ロール$roleCount件';
  }

  @override
  String get addGuildImportRemoveIcon => 'アイコンを削除';

  @override
  String get addGuildImportTemplateInvalid => 'コミュニティテンプレートのデータが無効または破損しています。';

  @override
  String get addGuildPackInstalled => 'パックが正常にインストールされました。';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle => 'すべてのリアクションを削除';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'このメッセージからすべてのリアクションを削除してもよろしいですか？';

  @override
  String get chatMessageUnpinConfirmTitle => 'メッセージのピン留めを解除';

  @override
  String get chatMessageUnpinConfirmDescription => 'このピンを過去に戻しますか？';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$usernameさんがこのチャンネルに$messageLinkをピン留めしました。$allPinsLinkを表示。';
  }

  @override
  String get systemPinMessageMessageLink => 'メッセージ';

  @override
  String get systemPinMessageAllPinsLink => 'すべてのピン留めされたメッセージ';

  @override
  String get channelPinsEmptyTitle => 'ピン留めされたメッセージはありません';

  @override
  String get channelPinsEmptyDescription => 'ここにピン留めされたメッセージが表示されます。';

  @override
  String get channelDetailsFallbackTitle => '詳細';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'グループDM · $count人のメンバー';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return '$nameさんとの会話を終了しますか？';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return '$name を退会しますか？';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'チャンネル設定';

  @override
  String get channelDetailsGroupSettingsTitle => 'グループ設定';

  @override
  String get channelDetailsDmSettingsTitle => 'DM設定';

  @override
  String get channelDetailsInvitePeople => '人を招待';

  @override
  String get channelDetailsCopyLink => 'リンクをコピー';

  @override
  String get channelMenuCopyChannelLink => 'チャンネルリンクをコピー';

  @override
  String get channelMenuCopyRedirectLink => 'リダイレクトリンクをコピー';

  @override
  String get channelDetailsAddFriendsToGroup => 'グループに友達を招待';

  @override
  String get channelDetailsGroupInvites => 'グループへの招待';

  @override
  String get channelDetailsEditChannel => 'チャンネルを編集';

  @override
  String get channelDetailsDeleteChannel => 'チャンネルを削除';

  @override
  String get channelSettingsCategorySettingsTitle => 'カテゴリー設定';

  @override
  String get channelSettingsEditCategory => 'カテゴリを編集';

  @override
  String get channelSettingsTabOverview => '概要';

  @override
  String get channelSettingsTabPermissions => '権限';

  @override
  String get channelSettingsTabInvites => '招待';

  @override
  String get channelSettingsTabWebhooks => 'ウェブフック';

  @override
  String get channelSettingsDeleteChannel => 'チャンネルを削除';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return '「$channelName」を削除してもよろしいですか？この操作は元に戻せません。';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return '$categoryNameを削除してもよろしいですか？この操作は元に戻せません。';
  }

  @override
  String get channelSettingsDeleteCategory => 'カテゴリを削除';

  @override
  String get channelSettingsChannelUpdated => 'チャンネルを更新しました';

  @override
  String get channelSettingsChannelName => 'チャンネル名';

  @override
  String get channelSettingsCategoryName => 'カテゴリ名';

  @override
  String get channelSettingsMyCategory => '自分のカテゴリ';

  @override
  String get categoryExpandCategory => 'カテゴリを展開';

  @override
  String get categoryCollapseCategory => 'カテゴリを折りたたむ';

  @override
  String get categoryExpandAllCategories => 'すべてのカテゴリを展開';

  @override
  String get categoryCollapseAllCategories => 'すべてのカテゴリを折りたたむ';

  @override
  String get categoryMuteCategory => 'カテゴリをミュート';

  @override
  String get categoryUnmuteCategory => 'カテゴリのミュートを解除';

  @override
  String get categoryCopyCategoryId => 'カテゴリIDをコピー';

  @override
  String get categoryIdCopied => 'カテゴリIDをコピーしました';

  @override
  String get channelSettingsChannelNamePlaceholder => '一般';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'トピック';

  @override
  String get channelSettingsTopicPlaceholder => 'このチャンネルにトピックを追加';

  @override
  String get channelSettingsInsertEmoji => '絵文字を挿入';

  @override
  String get channelSettingsTopicTooLongTitle => 'チャンネルのトピックが長すぎます。';

  @override
  String get channelSettingsTopicTooLongMessage => 'トピックを短くして、もう一度お試しください。';

  @override
  String get channelSettingsSlowmode => 'スローモード';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'メッセージ間の待機時間。\"$bypassSlowmodePermissionLabel\" はそれをバイパスできます。';
  }

  @override
  String get channelSettingsSlowmodeOff => 'オフ';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds秒';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes分';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours時間';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute分';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour時間';
  }

  @override
  String get channelSettingsVoiceQuality => '音声品質';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'ビットレートが高いほど、品質は向上しますが、帯域幅の使用量も増えます。';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbps';
  }

  @override
  String get channelSettingsParticipantLimit => '参加者上限';

  @override
  String get channelSettingsParticipantLimitDescription =>
      '一度に参加できる最大メンバー数です。0は無制限を意味します。';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 人の参加者',
      one: '1 人の参加者',
      zero: '∞ 無制限',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => '接続制限';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'このチャンネルで1人のメンバーが維持できるアクティブな接続の最大数です。';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count接続',
      one: '1接続',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => '音声地域';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'このチャンネルのボイスリージョンを選択してください。自動にすると、最も近いリージョンが使用されます。';

  @override
  String get channelSettingsVoiceRegionAutomatic => '自動';

  @override
  String get channelSettingsVoiceRegionsLoadFailed => '音声地域を読み込めませんでした';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'しばらくしてからもう一度お試しください。';

  @override
  String get channelSettingsResetSlider => 'スライダーを初期値にリセット';

  @override
  String get channelSettingsAdvanced => '詳細設定';

  @override
  String get channelSettingsMatureContentOverride => '成人向けコンテンツのオーバーライド';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'このチャンネルの$scopeLevelレベルの設定を上書きします。不適切なコンテンツは、参加前にゲートの後ろに表示されます。';
  }

  @override
  String get channelSettingsMatureContentInherit => '引き継ぐ';

  @override
  String get channelSettingsMatureContentOn => 'オン';

  @override
  String get channelSettingsMatureContentOff => 'オフ';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'このチャンネルを成人向けコンテンツとしてマークします。';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'このチャンネルの成人向けコンテンツへのアクセスを制限しない';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return '$inheritedSourceLabel からの継承：オン';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return '$inheritedSourceLabel からの継承: オフ';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'カテゴリ';

  @override
  String get channelSettingsMatureContentCommunitySource => 'コミュニティ';

  @override
  String get channelSettingsMatureContentCategoryScope => 'カテゴリ';

  @override
  String get channelSettingsMatureContentCommunityScope => 'コミュニティ';

  @override
  String get channelSettingsContentWarningToggle => 'このチャンネルにコンテンツ警告を表示';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'このチャンネルに入る前に同意を求めるプロンプトをオンにします。';

  @override
  String get channelSettingsContentWarningText => 'カスタム警告文';

  @override
  String get channelSettingsContentWarningDefault => '不適切な内容が含まれています.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'これらの権限を編集するには、「$manageChannelsPermissionLabel」の権限が必要です。';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'これらの権限を編集するには、「$manageRolesPermissionLabel」の権限が必要です。';
  }

  @override
  String get channelSettingsUnknownRole => '不明なロール';

  @override
  String get channelSettingsUnknownUser => '不明なユーザー';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides => 'アクセス権限の変更';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return '$name のアクセスを編集';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides => '上書き設定に戻る';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'このチャンネルの基本アクセスを設定';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides => 'このロールの権限を編集';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'このメンバーの権限を編集';

  @override
  String get channelSettingsPermissionsSearchPlaceholder => '権限を検索…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'チャンネルアクセスを更新しました';

  @override
  String get channelSettingsPermissionsTitle => 'アクセス制御';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'このチャンネルは親カテゴリと同期されています ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'このチャンネルは親カテゴリと同期していません ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory => 'カテゴリと同期';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast => '親カテゴリと同期済み';

  @override
  String get channelSettingsPermissionsAddOverride => '権限を上書き';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers => 'ロールまたはメンバーを検索…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => 'ロールとメンバー';

  @override
  String get channelSettingsDeleteInvite => '招待を削除';

  @override
  String get channelSettingsDeleteInviteConfirm => 'この招待を削除しますか？元に戻すことはできません。';

  @override
  String get channelSettingsCopyInviteCode => '招待コードをコピー';

  @override
  String get channelSettingsCopyInviteUrl => '招待URLをコピー';

  @override
  String get channelSettingsWebhookCreated => 'Webhookを作成しました';

  @override
  String get channelSettingsWebhookCreateFailed => 'ウェブフックの作成に失敗しました';

  @override
  String get channelSettingsCreateWebhook => 'ウェブフックを作成';

  @override
  String get channelSettingsInvitesDescription => 'このチャンネルの招待リンクを管理します。';

  @override
  String get channelSettingsInvitesCreate => '招待を作成';

  @override
  String get channelSettingsInvitesEmpty => '招待リンクがありません';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'このチャンネルにはまだ招待リンクがありません。招待リンクを作成して、メンバーを招待しましょう。';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'このチャンネルの招待リンクを読み込めませんでした。もう一度お試しください。';

  @override
  String get channelSettingsWebhooksDescription =>
      'このチャンネルにメッセージを投稿できる受信ウェブフックを管理します。';

  @override
  String get channelSettingsWebhooksEmpty => 'ウェブフックなし';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'このチャンネルにはウェブフックが設定されていません。外部アプリがメッセージを投稿できるように、ウェブフックを作成してください。';

  @override
  String get channelSettingsWebhooksUnsupported => 'このチャンネルはウェブフックに対応していません。';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'このチャンネルのWebhookを表示・編集するには、「$permission」権限が必要です。';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle => 'ウェブフックの読み込みに失敗しました';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'このチャンネルのウェブフックの読み込み中にエラーが発生しました。もう一度お試しください。';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return '$creatorさんが$dateに作成しました';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => '不明なユーザー';

  @override
  String get channelSettingsWebhooksAvatar => 'アバター';

  @override
  String get channelSettingsWebhooksUploadImage => '画像をアップロード';

  @override
  String get channelSettingsWebhooksRemove => '削除';

  @override
  String get channelSettingsWebhooksName => '名前';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Webhook名';

  @override
  String get channelSettingsWebhooksChannel => 'チャンネル';

  @override
  String get channelSettingsWebhooksUrl => 'Webhook URL';

  @override
  String get channelSettingsWebhooksCopyUrl => 'ウェブフックURLをコピー';

  @override
  String get channelSettingsWebhooksDelete => 'ウェブフックを削除';

  @override
  String get channelSettingsWebhooksDeleteFailed => 'このウェブフックを削除できませんでした';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'このWebhookを削除しますか？元に戻すことはできません。';

  @override
  String get channelSettingsWebhookTryAgainInAMoment => 'しばらくしてからもう一度お試しください。';

  @override
  String get channelMenuOpenChat => 'チャットを開く';

  @override
  String get channelMenuDuplicateChannel => 'チャンネルを複製';

  @override
  String get channelMenuResetMatureContentAgreeState => '成人向けコンテンツの同意状況をリセット';

  @override
  String get channelMenuDeleteMyMessagesTitle => 'このチャンネルのメッセージをすべて削除しますか？';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'このチャンネルであなたが送信したすべてのメッセージが完全に削除されます。この操作は元に戻せません。';

  @override
  String get channelMenuDeleteMyMessagesConfirm => '自分のメッセージを削除';

  @override
  String get channelMenuDeletedYourMessages => 'メッセージを削除しました';

  @override
  String get channelMenuCouldNotDeleteYourMessages => 'メッセージを削除できませんでした';

  @override
  String get channelDetailsSystemMessage => 'システムメッセージ';

  @override
  String get channelDetailsTextChannel => 'テキストチャンネル';

  @override
  String get channelDetailsVoiceChannel => '音声チャンネル';

  @override
  String get channelDetailsCategory => 'カテゴリ';

  @override
  String get channelDetailsLinkChannel => 'チャンネルをリンク';

  @override
  String get channelDetailsGenericChannel => 'チャンネル';

  @override
  String get channelDetailsMutedConversation => 'ミュートされた会話';

  @override
  String get channelDetailsUnmutedConversation => '会話のミュートを解除しました';

  @override
  String get channelDetailsMutedChannel => 'チャンネルをミュートしました';

  @override
  String get channelDetailsUnmutedChannel => 'チャンネルのミュートを解除しました';

  @override
  String get channelDetailsNotificationSettingsUpdated => '通知設定を更新しました';

  @override
  String get channelDetailsTabMembers => 'メンバー';

  @override
  String get channelDetailsTabPins => 'ピン留め';

  @override
  String get channelDetailsActionMute => 'ミュート';

  @override
  String get channelDetailsActionUnmute => 'ミュート解除';

  @override
  String get channelDetailsActionSearch => '検索';

  @override
  String get channelDetailsActionMore => 'その他';

  @override
  String get channelDetailsMembersEmptyTitle => 'メンバーがいません';

  @override
  String get channelDetailsMembersEmptyBody =>
      'メンバーはコミュニティのデータが読み込まれるとここに表示されます。';

  @override
  String get memberListPermissionDeniedTitle => 'メンバーを表示できません';

  @override
  String get memberListPermissionDeniedBody =>
      'このコミュニティでは、このチャンネルのメンバーを表示できません';

  @override
  String get memberListUnavailableTitle => 'メンバーリストを利用できません';

  @override
  String get memberListUnavailableBody => 'このコミュニティでは、メンバーリストを一時的に利用できません';

  @override
  String get channelDetailsPinsLoadFailedTitle => 'ピンを読み込めませんでした';

  @override
  String get channelDetailsPinsGuildEndHint =>
      '「メッセージを固定する」権限を持つメンバーは、全員が見られるようにメッセージを固定できます。';

  @override
  String get channelDetailsPinsDmEndHint => 'この会話のメッセージを全員が見られるようにピン留めできます。';

  @override
  String get channelDetailsPinsEndReached => 'これ以上表示するメッセージはありません';

  @override
  String get channelHeaderOpenDetails => 'チャンネル詳細を開く';

  @override
  String get channelHeaderPinnedMessages => 'ピン留め済みメッセージ';

  @override
  String get channelHeaderPinnedMessagesUnread => '未読のピン留めメッセージ';

  @override
  String get channelHeaderMemberList => 'メンバーリスト';

  @override
  String get channelHeaderInbox => '受信箱';

  @override
  String get channelHeaderNotificationSettingsMuted => '通知設定、ミュート中';

  @override
  String get channelDetailsSearchTitle => '検索';

  @override
  String get channelDetailsSearchHint => 'メッセージを検索';

  @override
  String get channelDetailsSearchFilterFrom => '送信者';

  @override
  String get channelDetailsSearchFilterHas => 'あり';

  @override
  String get channelDetailsSearchFilterIn => 'チャンネル内';

  @override
  String get channelDetailsSearchFilterMentions => 'メンション';

  @override
  String get channelDetailsSearchFilterMore => 'その他';

  @override
  String get channelDetailsSearchMoreFiltersActive => '有効';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count チャンネル';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count人のユーザー';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'ユーザー';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'ボット';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => 'チャンネルで絞り込む';

  @override
  String get channelDetailsSearchChannelsHint => 'チャンネルを検索';

  @override
  String get channelDetailsSearchChannelsEmpty => 'チャンネルが見つかりませんでした';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'ピン留め';

  @override
  String get channelDetailsSearchPinnedTrue => 'ピン留めのみ';

  @override
  String get channelDetailsSearchPinnedFalse => 'ピン留めを除く';

  @override
  String get channelDetailsSearchClearFilter => 'クリア';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => '作成者タイプ';

  @override
  String get channelDetailsSearchMoreFiltersDate => '日付';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => '日付モード';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => '日付を選択';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'ホスト名を表示';

  @override
  String get channelDetailsSearchMoreFiltersFileName => 'ファイル名に「」が含まれる';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'ファイル拡張子';

  @override
  String get channelDetailsSearchContentPoll => 'アンケート';

  @override
  String get channelDetailsSearchContentPollDescription => '投票付きのメッセージ';

  @override
  String get channelDetailsSearchContentForward => '転送';

  @override
  String get channelDetailsSearchContentForwardDescription => '転送されたメッセージ';

  @override
  String get channelDetailsSearchFilterSort => '並べ替え';

  @override
  String get channelHeaderSearchFiltersTitle => '検索フィルター';

  @override
  String get channelHeaderSearchRecentTitle => '最近の検索';

  @override
  String get channelHeaderSearchUsersTitle => 'ユーザー';

  @override
  String get channelHeaderSearchChannelsTitle => 'チャンネル';

  @override
  String get channelHeaderSearchValuesTitle => '値';

  @override
  String get channelHeaderSearchDatesTitle => '日付';

  @override
  String get channelHeaderSearchDefaultBadge => 'デフォルト';

  @override
  String get channelHeaderSearchClearHistory => 'クリア';

  @override
  String get channelHeaderSearchFilterDescFrom => 'ユーザー';

  @override
  String get channelHeaderSearchFilterDescMentions => 'ユーザー';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'リンク、埋め込み、画像、動画、音声、ファイル、スタンプなど';

  @override
  String get channelHeaderSearchFilterDescBefore => '日付または日付の範囲';

  @override
  String get channelHeaderSearchFilterDescOn => '日付または日付の範囲';

  @override
  String get channelHeaderSearchFilterDescDuring => '日付または日付の範囲';

  @override
  String get channelHeaderSearchFilterDescAfter => '日付または日付の範囲';

  @override
  String get channelHeaderSearchFilterDescIn => 'チャンネル';

  @override
  String get channelHeaderSearchFilterDescPinned => '真偽';

  @override
  String get channelHeaderSearchFilterDescAuthorType => 'ユーザー、ボット、またはWebhook';

  @override
  String get channelHeaderSearchFilterDescLinkFrom => 'ホスト名（例: example.com）';

  @override
  String get channelHeaderSearchFilterDescFileName => '添付ファイル名の一部';

  @override
  String get channelHeaderSearchFilterDescFileType => 'ファイル拡張子 (例: png)';

  @override
  String get channelHeaderSearchFilterDescSort => 'タイムスタンプまたは関連性';

  @override
  String get channelHeaderSearchFilterDescOrder => '昇順または降順';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString件の結果',
      one: '1件の結果',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'ユーザーで絞り込む';

  @override
  String get channelDetailsSearchFilterByContent => 'コンテンツで絞り込む';

  @override
  String get channelDetailsSearchSortBy => '並べ替え';

  @override
  String get channelDetailsSearchIn => 'チャンネル内を検索';

  @override
  String get channelDetailsSearchEmptyTitle => 'この会話を検索';

  @override
  String get channelDetailsSearchEmptyBody =>
      'メッセージを検索するには、テキスト、作成者、またはコンテンツフィルターを入力してください。';

  @override
  String get channelDetailsSearchIndexingTitle => 'メッセージをインデックス化しています';

  @override
  String get channelDetailsSearchIndexingBody =>
      'しばらくしてから、この範囲の検索インデックス作成が完了したら、もう一度お試しください。';

  @override
  String get channelDetailsSearchNoResultsTitle => '結果なし';

  @override
  String get channelDetailsSearchNoResultsBody => '別の検索語やフィルターを試してください。';

  @override
  String get channelDetailsMembersOnline => 'オンライン';

  @override
  String get channelDetailsMembersOffline => 'オフライン';

  @override
  String get channelDetailsMemberYou => '自分';

  @override
  String get channelDetailsSearchUsersHint => 'ユーザーを検索';

  @override
  String get channelDetailsSearchUsersTypeToSearch => 'メンバーを検索するには入力してください';

  @override
  String get channelDetailsSearchUsersEmpty => 'ユーザーが見つかりませんでした';

  @override
  String get channelDetailsSearchUsersNoAvailable => 'ユーザーがいません';

  @override
  String get channelDetailsDone => '完了';

  @override
  String get channelDetailsHasFilterPrompt => '次の条件を含むメッセージを表示:';

  @override
  String get channelDetailsRetry => '再試行';

  @override
  String get channelDetailsPinnedMessageTitle => 'ピン留めされたメッセージ';

  @override
  String get channelDetailsSearchResultTitle => '検索結果';

  @override
  String get channelDetailsJumpToMessage => 'メッセージに移動';

  @override
  String get channelDetailsUnpinMessage => 'メッセージのピン留めを解除';

  @override
  String get channelDetailsCopyMessageLink => 'メッセージリンクをコピー';

  @override
  String get channelDetailsCopyMessageId => 'メッセージIDをコピー';

  @override
  String get channelDetailsMessageUnpinned => 'メッセージのピン留めを解除しました';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => '現在のコミュニティ';

  @override
  String get channelDetailsSearchScopeCurrentDm => '現在のDM';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'すべてのコミュニティ';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild => 'すべてのダイレクトメッセージのみ';

  @override
  String get channelDetailsSearchScopeAllDms => 'すべてのDM';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild => 'DMのみ';

  @override
  String get channelDetailsSearchScopeOpenDms => 'DMを開く';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities => 'すべてのDMとコミュニティ';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities => 'DMとコミュニティ';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'このコミュニティ内のみを検索';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription => '現在のDMのみを検索';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      '参加中の全コミュニティを対象';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription => 'すべてのDM';

  @override
  String get channelDetailsSearchScopeAllDmsDescription => '参加したことのあるすべてのDM';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      '開いているすべてのダイレクトメッセージで';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      '開いているすべてのダイレクトメッセージ';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'これまでのすべてのダイレクトメッセージと、現在参加中のすべてのコミュニティ';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      '開いているすべてのダイレクトメッセージと参加中のすべてのコミュニティ';

  @override
  String get channelDetailsSearchSortNewest => '新しい順';

  @override
  String get channelDetailsSearchSortOldest => '古い順';

  @override
  String get channelDetailsSearchSortRelevance => '関連性の高い順';

  @override
  String get channelDetailsSearchSortNewestDescription => '最新のメッセージを上位に表示';

  @override
  String get channelDetailsSearchSortOldestDescription => '古いメッセージを上位に表示';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      '関連度の高いメッセージを上位に表示';

  @override
  String get channelDetailsSearchContentImage => '画像のアップロード';

  @override
  String get channelDetailsSearchContentVideo => '動画アップロード';

  @override
  String get channelDetailsSearchContentAudio => '音声アップロード';

  @override
  String get channelDetailsSearchContentFile => 'ファイルアップロード';

  @override
  String get channelDetailsSearchContentLink => 'リンク';

  @override
  String get channelDetailsSearchContentEmbed => 'リンクプレビューまたは埋め込み';

  @override
  String get channelDetailsSearchContentSticker => 'スタンプ';

  @override
  String get channelDetailsSearchContentImageDescription => '画像ファイルのみ';

  @override
  String get channelDetailsSearchContentVideoDescription => 'アップロードされた動画ファイルのみ';

  @override
  String get channelDetailsSearchContentAudioDescription => '音声ファイルのみ';

  @override
  String get channelDetailsSearchContentFileDescription => '添付ファイル';

  @override
  String get channelDetailsSearchContentLinkDescription => 'メッセージ本文に入力されたURL';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      '解決済みのプレビューとリッチな埋め込み。アップロードは含みません';

  @override
  String get channelDetailsSearchContentStickerDescription => 'メッセージに添付されたスタンプ';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count 件のタイプ';
  }

  @override
  String get personalNotesTitle => '個人メモ';

  @override
  String get personalNotesSubtitle => '考えやリマインダーのためのプライベートスペース';

  @override
  String groupDmWelcome(String displayName) {
    return '$displayNameへようこそ。友達を追加してグループを盛り上げましょう。';
  }

  @override
  String get groupDmWelcomeEditGroup => 'グループを編集';

  @override
  String get groupDmWelcomeAddFriends => 'グループに友達を招待';

  @override
  String get dmGroupInvites => '招待';

  @override
  String get groupDmEditTitle => 'グループを編集';

  @override
  String get groupDmEditDetailsTooltip => 'グループ情報を編集';

  @override
  String get groupDmGroupName => 'グループ名';

  @override
  String get groupDmMyGroup => '自分のグループ';

  @override
  String get groupDmGroupNameMaxLength => 'グループ名は100文字以内で入力してください';

  @override
  String get groupDmGroupIcon => 'グループアイコン';

  @override
  String get groupDmUploadIcon => 'アイコンをアップロード';

  @override
  String get groupDmChangeIcon => 'アイコンを変更';

  @override
  String get groupDmRemoveIcon => 'アイコンを削除';

  @override
  String get groupDmUpdated => 'グループを更新しました';

  @override
  String get groupDmUpdateFailed => 'グループを更新できませんでした。もう一度お試しください。';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'アニメーション化されたアイコンはサポートされていません。静止画像を使用してください。';

  @override
  String get groupDmAnimatedIconNotSupportedTitle => 'アニメーションアイコンはサポートされていません';

  @override
  String get groupDmIconFileTooLargeTitle => 'アイコンファイルが大きすぎます';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'アイコンファイルが大きすぎます。$maxSize より小さいファイルを選択してください。';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'サポートされていないアイコン形式';

  @override
  String get groupDmUnsupportedIconFormatBody => 'サポートされていないファイルタイプです。';

  @override
  String get groupDmCouldntProcessImage => '画像を処理できませんでした';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'トリミングした画像の処理に失敗しました。もう一度お試しください。';

  @override
  String get groupDmInvalidImage => '無効な画像';

  @override
  String get groupDmInvalidImageBody => 'この画像は無効です。別の画像を試してください。';

  @override
  String get groupDmAddFriends => '追加';

  @override
  String get groupDmOrSendInvite => 'または友達を招待:';

  @override
  String get groupDmGenerateInviteLink => '招待リンクを生成';

  @override
  String get groupDmCreateInvite => '作成';

  @override
  String get groupDmInviteExpires24Hours => '招待の有効期限は24時間です';

  @override
  String get groupDmAddFriendFailed => 'グループにこのフレンドを追加できませんでした。もう一度お試しください。';

  @override
  String get groupDmAddFailed => 'グループに追加できませんでした';

  @override
  String get groupDmGroupFull => 'このグループは満員です。メンバーを追加する前に、誰かを削除してください。';

  @override
  String get groupDmRateLimited => '速すぎます。少し待ってからもう一度お試しください。';

  @override
  String get groupDmCreateInviteFailed => '招待リンクを作成できませんでした';

  @override
  String get groupDmCreateInviteFailedBody => '招待リンクを生成できませんでした。もう一度お試しください。';

  @override
  String get guildNavbarCreateInviteFailed => '招待リンクを作成できませんでした。もう一度お試しください。';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'このチャンネルで招待を作成する権限がありません。';

  @override
  String get guildNavbarCreateInviteMaxInvites => 'このコミュニティは招待上限に達しました。';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'このコミュニティでは、招待の作成が一時的に無効になっています。';

  @override
  String get groupDmCopyInviteFailed => '招待リンクのコピーに失敗しました';

  @override
  String get groupDmInvitesOwnerOnly => '招待を管理できるのはグループのオーナーのみです。';

  @override
  String get groupDmNoInvitesCreated => '招待はまだありません';

  @override
  String get groupDmLoadingInvites => '招待を読み込み中…';

  @override
  String get groupDmInvitesLoadFailed => '招待の読み込みに失敗しました。もう一度お試しください。';

  @override
  String get groupDmInvitesRevokeConfirm => 'この招待を取り消しますか？元に戻すことはできません。';

  @override
  String get groupDmInviteRevoked => '招待を取り消しました';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return '$nameさんが作成しました。$time後に期限切れです。';
  }

  @override
  String channelWelcomeHeading(String channelName) {
    return '$channelNameへようこそ';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return '始まりには何もなく、その後$channelNameが現れました。そしてそれは素晴らしかった。';
  }

  @override
  String get personalNotesComposerHint => '自分にメッセージを送る';

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
  String get composerOpenExpressionPicker => '絵文字ピッカーを開く';

  @override
  String get composerShowKeyboard => 'キーボードを表示';

  @override
  String get composerCloseAttachmentPanel => '添付ファイルピッカーを閉じる';

  @override
  String get chatAttachmentPanelPhotos => '写真';

  @override
  String get chatAttachmentPanelFiles => 'ファイル';

  @override
  String get chatAttachmentLibraryPermissionTitle => '写真ライブラリへのアクセスが必要です';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      '写真ライブラリへのアクセスを許可すると、最近の写真や動画を参照して添付できるようになります。';

  @override
  String get chatAttachmentLibraryPermissionSettings => '設定を開く';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => '送信中';

  @override
  String get messageAccessibilityFailedSuffix => '、送信に失敗しました';

  @override
  String get messageAccessibilityAttachmentSummary => '添付ファイル';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count 件の添付ファイル';
  }

  @override
  String get messageAccessibilityImageSummary => '画像';

  @override
  String get messageAccessibilityVideoSummary => '動画';

  @override
  String get messageAccessibilityAudioSummary => '音声ファイル';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return '$nameさんのスタンプ';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'ファイル $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary => 'ネタバレの添付ファイル';

  @override
  String get messageAccessibilityEmbedSummary => '埋め込み';

  @override
  String get messageAccessibilityEmptySummary => 'メッセージ';

  @override
  String get personalNotesPrivateSpace => 'あなたのプライベートスペース';

  @override
  String get purgePersonalNotes => '個人メモを削除';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'これにより、個人メモ内のすべてのメッセージと添付ファイルが完全に削除されます。元に戻すことはできません。';

  @override
  String get purgePersonalNotesConfirmButton => '削除';

  @override
  String purgePersonalNotesSuccess(int count) {
    return '$count件のメッセージを個人メモから削除しました';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty => '個人メモはすでに空でした';

  @override
  String get purgePersonalNotesFailed => '個人メモをクリアできませんでした';

  @override
  String get userSettingsGroupYourAccount => 'アカウント';

  @override
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => '設定を検索...';

  @override
  String get userSettingsSearchFieldLabel => '設定を検索';

  @override
  String get userSettingsSearchClear => '検索をクリア';

  @override
  String get userSettingsSearchNoResults => '設定が見つかりませんでした';

  @override
  String get userSettingsNavProfile => 'プロフィール';

  @override
  String get userSettingsNavSecurityLogin => 'セキュリティとログイン';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'ギフトとコード';

  @override
  String get giftSettingsClaimAccountTitle => 'アカウントを登録';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Plutoniumギフトコードの引き換えや管理のためにアカウントを請求してください。';

  @override
  String get giftSettingsRedeemTitle => 'ギフトを交換';

  @override
  String get giftSettingsRedeemDescription =>
      'アカウントにPlutoniumを適用するには、ギフトコードを入力してください。';

  @override
  String get giftSettingsRedeemPlaceholder => 'ギフトコードを入力…';

  @override
  String get giftSettingsRedeemButton => '使用する';

  @override
  String get giftSettingsRedeemSuccess => 'Plutoniumの引き換えに成功しました。お楽しみください。';

  @override
  String get giftSettingsPurchasedTitle => '購入済みギフト';

  @override
  String get giftSettingsPurchasedDescription =>
      '購入したPlutoniumギフトコードを管理します。ギフトURLを特別な人に共有するか、自分で引き換えてください！';

  @override
  String get giftSettingsEmptyTitle => 'まだギフトがありません';

  @override
  String get giftSettingsEmptyDescription =>
      'PlutoniumタブからPlutoniumギフトを購入して、友達と共有しましょう。';

  @override
  String get giftSettingsGoToPlutonium => 'Plutoniumに移動';

  @override
  String get giftSettingsLoadFailedTitle => 'ギフトの在庫を読み込めませんでした';

  @override
  String get giftSettingsLoadFailedDescription => '後でもう一度お試しください。';

  @override
  String get giftSettingsTryAgain => 'もう一度お試しください';

  @override
  String get giftSettingsGiftUrl => 'ギフトURL';

  @override
  String get giftSettingsCopy => 'コピー';

  @override
  String get giftSettingsCopied => 'コピーしました';

  @override
  String get giftSettingsGiftUrlCopied => 'ギフトURLをクリップボードにコピーしました！';

  @override
  String get giftSettingsGiftUrlCopyFailed => 'ギフトURLをコピーできませんでした';

  @override
  String giftSettingsPurchasedDate(String date) {
    return '$dateに購入';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return '$dateに引き換えられました';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return '$nameさんが受け取りました';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'このギフトは使用済みです';

  @override
  String get giftSettingsRedeemForYourself => '自分で使用';

  @override
  String get giftSettingsShareWithFriend => '友達にシェア';

  @override
  String get premiumPlutoniumTagline =>
      '独立したコミュニケーションプラットフォームを支援しながら、上限アップや限定機能をご利用いただけます。';

  @override
  String get premiumPurchaseMode => '購入方法';

  @override
  String get premiumForMe => '自分用';

  @override
  String get premiumAsAGift => 'ギフトとして贈る';

  @override
  String get premiumMonthly => '月額';

  @override
  String get premiumYearly => '年間';

  @override
  String get premiumPerMonth => '/月';

  @override
  String get premiumPerYear => '年額';

  @override
  String get premiumOneTimePurchase => '1回限りの購入';

  @override
  String get premiumSave17 => '17%お得';

  @override
  String get premiumUpgradeNow => '今すぐアップグレード';

  @override
  String get premiumBuyGift => 'ギフトを購入';

  @override
  String get premiumOneYearGift => '1年ギフト';

  @override
  String get premiumOneMonthGift => '1ヶ月ギフト';

  @override
  String get premiumMostPopular => '一番人気';

  @override
  String get premiumScrollPrompt => 'Plutoniumに含まれる特典をすべて表示するには、下にスクロールしてください';

  @override
  String get premiumFreeVsPlutonium => '無料版とPlutonium版';

  @override
  String get premiumFreeColumn => '無料';

  @override
  String get premiumGiftSectionTitle => 'Plutoniumを贈る';

  @override
  String get premiumGiftSectionDescription =>
      '友達にPlutoniumをプレゼントしませんか？ギフトサブスクリプションを購入できます。';

  @override
  String get premiumGiftBannerOne => 'ギフトコードが届いています！';

  @override
  String premiumGiftBannerMany(int count) {
    return '$count件の新しいギフトコードが届いています！';
  }

  @override
  String get premiumViewGifts => 'ギフトを見る';

  @override
  String get premiumReadyToUpgrade => 'アップグレードしますか？';

  @override
  String get premiumReadyToBuyGift => 'ギフトを購入しますか？';

  @override
  String premiumMonthlyPrice(String price) {
    return '月額 $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return '年間 $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1年 $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1か月 $price';
  }

  @override
  String get premiumManageSubscription => 'サブスクリプションを管理';

  @override
  String get premiumRedeemGiftCode => 'ギフトコードを使う';

  @override
  String get premiumGiftBadge => 'ギフト';

  @override
  String get premiumCancelSubscriptionTitle => 'サブスクリプションをキャンセルしますか？';

  @override
  String get premiumCancelSubscriptionBody =>
      '特典は次回の更新日まで保持され、その後3日間の猶予期間中に再登録すると、購読履歴を引き継ぐことができます。';

  @override
  String get premiumCancelSubscriptionConfirm => 'サブスクリプションをキャンセル';

  @override
  String get premiumKeepSubscription => 'サブスクリプションを継続';

  @override
  String get premiumPurchaseHistoryTitle => '購入履歴';

  @override
  String get premiumPurchaseHistoryDescription =>
      'サブスクリプションの支払い方法を変更するには、請求ポータルで支払い方法を追加または選択し、デフォルトに設定してください。';

  @override
  String get premiumManagePaymentMethods => '支払い方法を管理';

  @override
  String get premiumBillingHistory => '請求履歴';

  @override
  String get premiumSelfServeRefundTitle => 'セルフサービス返金';

  @override
  String get premiumSelfServeRefundButton => '最新の購入を返金';

  @override
  String get premiumDisclaimerAgreementPrefix => '購入することで、お客様は当社の ';

  @override
  String get premiumDisclaimerAgreementPastPrefix => '購入することで、お客様は当社の ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' と ';

  @override
  String premiumActiveUntil(String date) {
    return '$dateまで有効';
  }

  @override
  String get premiumSubscriptionCanceling => 'キャンセル中';

  @override
  String premiumCancelsOn(String date) {
    return '$dateにキャンセルされます。それまで特典は有効です。';
  }

  @override
  String get premiumReactivateSubscription => '再開する';

  @override
  String premiumGiftedUntil(String date) {
    return '$dateまでギフトとして付与されます。自動更新されません。';
  }

  @override
  String get premiumComparisonFeatureColumn => '機能';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return '購入することで、$termsおよび$privacyに同意したことになります。';
  }

  @override
  String get premiumDisclaimerRefund =>
      'お支払いから3日以内、かつ30日に1回まで、ご自身で返金手続きが可能です。サブスクリプションを返金すると、サブスクリプションはキャンセルされます。EU/EEA圏の購入者は、コンテンツにすぐにアクセスするため、チェックアウト時に14日間の撤回権を放棄します。チャージバックではなく、アプリ内の返金ボタンをご利用ください。チャージバックはアカウントの永久的な制限につながる可能性があります。Stripeが支払いを安全に処理します。お客様のカード番号全体が当社に表示されることはありません。';

  @override
  String get premiumTermsOfService => '利用規約';

  @override
  String get premiumPrivacyPolicy => 'プライバシーポリシー';

  @override
  String get premiumCheckoutStartFailedTitle => 'チェックアウトを開始できませんでした';

  @override
  String get premiumCheckoutStartFailedBody =>
      'チェックアウトの開始中に問題が発生しました。しばらくしてからもう一度お試しください。';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      '現在、ギフトサブスクリプションをご利用中です。自動更新はされません。ギフトコードを追加して期間を延長できます。ギフト期間終了後、定期購入を開始できます。';

  @override
  String get premiumPlanUnavailable => 'このプランはご利用いただけません。サポートにお問い合わせください。';

  @override
  String get premiumCompletePaymentTitle => '支払いを完了';

  @override
  String get premiumCompletePaymentBody =>
      '支払いを完了するためにStripeに移動します。完了したらFluxerに戻ってください。';

  @override
  String get premiumChoosePaymentMethodTitle => '支払い方法を選択';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Pix自動払いで、ブラジル国内銀行から直接定期請求を承認します。または、カードを使用を選択して、次の画面でStripeにクレジットカード情報を入力してください。';

  @override
  String get premiumUsePix => 'Pix を使う';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'インドの銀行からRBI（インド準備銀行）に準拠したeマンデートを設定するには、UPIで支払いを行うか、カードを使用を選択して次の画面でクレジットカード情報を入力してください。';

  @override
  String get premiumUseUpi => 'UPIを使用';

  @override
  String get premiumUseCard => 'カードを使う';

  @override
  String get premiumCustomerPortalOpenFailedTitle => '請求ポータルを開けませんでした';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      '請求ポータルを開く際に問題が発生しました。しばらくしてからもう一度お試しください。';

  @override
  String get premiumAlreadyVisionaryTitle => 'すでにVisionaryです';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionaryには永続的なアクセス権がすでに含まれているため、月額プランは不要です。他のユーザーへのギフトは引き続き購入できます。';

  @override
  String get premiumExistingSubscriptionTitle => 'すでに登録済みです';

  @override
  String get premiumExistingSubscriptionBody =>
      'このアカウントには、既存のFluxer Plutoniumサブスクリプションが見つかりました。支払い方法の更新や更新状況の確認は、安全な請求ポータルで管理してください。最近お支払いいただいた場合は、1分ほど待ってからこのページを再度開いてください。';

  @override
  String get premiumPurchasesDisabledTitle => '購入できません';

  @override
  String get premiumPurchasesDisabledBody =>
      'このアカウントでは購入が無効になっています。問題があると思われる場合は、support@fluxer.app までお問い合わせください。';

  @override
  String get premiumClaimAccountToPurchase =>
      'Fluxer Plutonium を購入するためにアカウントを請求してください。';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Fluxer Plutonium を購入するには、メールアドレスの認証が必要です。';

  @override
  String get premiumPerkCustomUsernameTag => 'カスタムユーザー名タグ';

  @override
  String get premiumPerkPerCommunityProfiles => 'コミュニティごとのプロフィール';

  @override
  String get premiumPerkMessageScheduling => 'メッセージの予約送信';

  @override
  String get premiumPerkProfileBadge => 'プロフィールバッジ';

  @override
  String get premiumPerkCustomVideoBackgrounds => 'カスタムビデオ背景';

  @override
  String get premiumPerkEntranceSounds => '入室音';

  @override
  String get premiumPerkCommunities => 'コミュニティ';

  @override
  String get premiumPerkMessageCharacterLimit => 'メッセージの文字数制限';

  @override
  String get premiumPerkBookmarkedMessages => 'ブックマークしたメッセージ';

  @override
  String get premiumPerkFileUploadSize => 'ファイルアップロードサイズ';

  @override
  String get premiumPerkEmojiStickerPacks => '絵文字＆スタンプパック';

  @override
  String get premiumPerkSavedMedia => '保存したメディア';

  @override
  String get premiumPerkUseAnimatedEmojis => 'アニメーション絵文字を使う';

  @override
  String get premiumPerkGlobalEmojiStickerAccess => 'グローバル絵文字・スタンプアクセス';

  @override
  String get premiumPerkVideoQuality => 'ビデオ品質';

  @override
  String get premiumPerkAnimatedAvatarsBanners => '動くアバターとプロフィールバナー';

  @override
  String get premiumPerkEarlyAccess => '新機能への早期アクセス';

  @override
  String get premiumPerkCustomThemes => 'カスタムテーマ';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => '最大4K/60fps';

  @override
  String get userSettingsNavPrivacyDashboard => 'プライバシーダッシュボード';

  @override
  String get userSettingsNavAuthorizedApps => '承認済みアプリ';

  @override
  String get userSettingsNavBlockedUsers => 'ブロックされたユーザー';

  @override
  String get userSettingsNavLinkedDevices => 'リンクされたデバイス';

  @override
  String get userSettingsNavConnections => '接続';

  @override
  String get userSettingsNavLookAndFeel => '見た目';

  @override
  String get userSettingsNavAccessibility => 'アクセシビリティ';

  @override
  String get userSettingsNavChat => 'メッセージとメディア';

  @override
  String get userSettingsNavAudioAndVideo => 'オーディオとビデオ';

  @override
  String get userSettingsNavShortcuts => 'ショートカット';

  @override
  String get audioAndVideoAudioSectionTitle => 'オーディオ';

  @override
  String get audioAndVideoAudioSectionDescription => 'マイク、スピーカー、音声処理を設定します。';

  @override
  String get audioAndVideoVideoSectionTitle => 'ビデオ';

  @override
  String get audioAndVideoVideoSectionDescription => 'カメラと画面共有の品質を設定します。';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle => '通話中の確認';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      '音声通話やビデオ通話中に表示する確認メッセージを設定します。';

  @override
  String get audioAndVideoInputDeviceLabel => '入力デバイス';

  @override
  String get audioAndVideoOutputDeviceLabel => '出力デバイス';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'デフォルト';

  @override
  String get audioAndVideoUseSpeakerLabel => 'スピーカーを使用';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'オフにすると、オーディオはイヤースピーカーまたは接続されたヘッドフォンから再生されます。';

  @override
  String get audioAndVideoInputVolumeLabel => '入力音量';

  @override
  String get audioAndVideoOutputVolumeLabel => '出力音量';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => '音声処理';

  @override
  String get audioAndVideoFocusedVoiceLabel => '音声にフォーカス';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'おすすめ。マイクの音声をクリアにして、聞き取りやすくします。';

  @override
  String get audioAndVideoDirectInputLabel => 'ダイレクト入力';

  @override
  String get audioAndVideoDirectInputDescription =>
      '音声を加工せずに送信します。外部のオーディオソフトウェアを使用している場合に最適です。';

  @override
  String get audioAndVideoCustomProfileLabel => 'カスタム';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'ノイズ抑制、エコーキャンセル、ゲインなど、各設定をご自身で調整してください。';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'ノイズ抑制';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => '高音質';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => '標準';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'なし';

  @override
  String get audioAndVideoEchoCancellationLabel => 'エコーキャンセレーション';

  @override
  String get audioAndVideoAutomaticGainControlLabel => '自動音量調整';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'マイクの音量を均一にします。強化されたノイズ抑制がオンのときはオフになります。';

  @override
  String get audioAndVideoMicTestSectionTitle => 'マイクテスト';

  @override
  String get audioAndVideoMicTestStartLabel => 'マイクテストを開始';

  @override
  String get audioAndVideoMicTestStopLabel => 'マイクテストを停止';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '$productName は、入力テストのためにマイクへのアクセスが必要です。';
  }

  @override
  String get audioAndVideoCameraLabel => 'カメラ';

  @override
  String get audioAndVideoMirrorCameraLabel => 'カメラを反転';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'カメラの品質';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle => '画面共有の品質';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'フレームレート';

  @override
  String get audioAndVideoFrameRate15Label => '15 FPS';

  @override
  String get audioAndVideoFrameRate30Label => '30 FPS';

  @override
  String get audioAndVideoFrameRate60Label => '60 FPS';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080pと60FPSには$premiumProductNameが必要です。';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'このインスタンスでは現在、最大720p、30FPSで画面共有が可能です。';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return '$productNameがデバイスを一覧表示するには、マイクへのアクセスが必要です。';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return '$productNameがデバイスを一覧表示するには、カメラへのアクセスが必要です。';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel => 'カメラを非表示にする際に確認しない';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      '自分の画面共有を非表示にする際に確認しない';

  @override
  String get userSettingsNavNotifications => '通知';

  @override
  String get notificationsGeneralSectionTitle => '一般';

  @override
  String get notificationsEnableNotificationsLabel => '通知をオンにする';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'メッセージを受信したときに通知を受け取ります。デバイスの設定で$productNameの通知を許可する必要がある場合があります。チャンネルごと、コミュニティごとの設定については、コミュニティのメニューから通知設定を開いてください。';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel => 'デスクトップ通知をオンにする';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'OSの通知センターを使用します。チャンネルごと、コミュニティごとの設定は、コミュニティアイコンを右クリックして通知設定を開いてください。';

  @override
  String get notificationsEnableBrowserNotificationsLabel => 'ブラウザ通知を有効にする';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'メッセージ受信時に通知を受け取れます。ブラウザの設定で通知を許可する必要がある場合があります。チャンネルごと/コミュニティごとの設定は、コミュニティアイコンを右クリックして通知設定を開いてください。';

  @override
  String get notificationsPushInactiveTimeoutLabel => 'プッシュ通知の無効化タイムアウト';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName は、コンピューターを使用しているときにモバイルデバイスにプッシュ通知を送信しないようにします。デスクトップでどのくらいの時間非アクティブ状態が続くと、プッシュ通知を受信するかを選択してください。';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute分';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes分';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle => 'メンション設定';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel => 'メンション返信設定';

  @override
  String get notificationsMentionNoPreferenceName => '設定しない';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      '@メンションのオンオフに関わらず、送信者の意図を尊重する';

  @override
  String get notificationsMentionPreferMentionName => 'メンション設定';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'デフォルトではあなたへの@メンションに返信し、送信者がメンションを無効にしている場合は警告します';

  @override
  String get notificationsMentionPreferNoMentionName => 'メンションしない';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      '返信時に@メンションを自動で削除し、有効にした場合は送信者に警告する';

  @override
  String get notificationsTtsSectionTitle => 'テキスト読み上げ通知';

  @override
  String get notificationsTtsEnableCommandLabel => '/tts 音声読み上げを有効にする';

  @override
  String get notificationsTtsEnableCommandDescription =>
      '/ttsでメッセージを読み上げます。この設定をオフにすると、コマンドは通常のテキストとして表示されます。';

  @override
  String get notificationsTtsAccessibilityLinkPrefix => '再生速度を調整する ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'アクセシビリティ';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle => 'メッセージ自動読み上げ';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      '/ttsコマンドで送信されたかどうかにかかわらず、受信したコンテンツを音声に変換します。';

  @override
  String get notificationsTtsModeAllChannelsName => 'すべてのチャンネル';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'どのチャンネルが開いていても、すべての受信メッセージを読み上げます。';

  @override
  String get notificationsTtsModeCurrentChannelName => 'アクティブなチャンネルのみ';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      '現在表示しているチャンネルのみを読み上げます。チャンネルを移動しても読み上げは継続されます。';

  @override
  String get notificationsTtsModeNeverName => '常にオフ';

  @override
  String get notificationsTtsModeNeverDescription =>
      '誰かが手動で /tts を実行しない限り、通知は届きません。';

  @override
  String get notificationsTtsModeAriaLabel => 'すべてのメッセージを読み上げる';

  @override
  String get notificationsSoundsSectionTitle => 'サウンド';

  @override
  String get notificationsMasterVolumeLabel => 'マスター音量';

  @override
  String get notificationsMasterVolumeDescription =>
      'すべての効果音の音量を設定します。個別の音量設定はこれを上書きします。';

  @override
  String get notificationsResetToDefaultVolume => 'デフォルトの音量にリセット';

  @override
  String get notificationsDisableAllSoundsLabel => 'すべての通知音をオフにする';

  @override
  String get notificationsDisableAllSoundsDescription => '既存の通知サウンド設定は維持されます。';

  @override
  String get notificationsShowMoreSoundEffects => 'より多くのサウンドエフェクトを表示する';

  @override
  String get notificationsShowFewerSoundEffects => '表示するサウンドエフェクトを減らす';

  @override
  String get notificationsPreviewSound => 'サウンドをプレビュー';

  @override
  String get notificationsPerSoundVolumeTitle => 'サウンドごとの音量';

  @override
  String get notificationsPerSoundVolumeDescription =>
      '個別のサウンドにカスタム音量を設定できます。設定されていないサウンドはマスター音量に従います。';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'カスタムサウンドボリュームの上書き設定数：$overrideCount。';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'マスターに従う • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return '$labelをマスター音量にリセット';
  }

  @override
  String get notificationsResetAllOverrides => 'すべてのカスタム設定をリセット';

  @override
  String notificationsMuteSound(String label) {
    return '$labelをミュート';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return '$labelをミュート解除';
  }

  @override
  String get notificationsSoundMessage => 'コミュニティメッセージ通知';

  @override
  String get notificationsSoundDirectMessage => 'ダイレクトメッセージ通知';

  @override
  String get notificationsSoundSameChannelMessage => '現在のチャンネルメッセージ通知';

  @override
  String get notificationsSoundMute => '音声ミュート';

  @override
  String get notificationsSoundUnmute => '音声ミュート解除';

  @override
  String get notificationsSoundDeaf => 'ボイスチャットのミュート';

  @override
  String get notificationsSoundUndeaf => 'ミュート解除';

  @override
  String get notificationsSoundUserJoin => 'ユーザーがチャンネルに参加';

  @override
  String get notificationsSoundUserLeave => 'ユーザーがチャンネルを退出';

  @override
  String get notificationsSoundUserMove => 'ユーザーがチャンネルを移動しました';

  @override
  String get notificationsSoundViewerJoin => '視聴者が配信に参加';

  @override
  String get notificationsSoundViewerLeave => '視聴者が配信を退出';

  @override
  String get notificationsSoundVoiceDisconnect => '音声接続を切断しました';

  @override
  String get notificationsSoundIncomingRing => '着信';

  @override
  String get notificationsSoundCameraOn => 'カメラオン';

  @override
  String get notificationsSoundCameraOff => 'カメラオフ';

  @override
  String get notificationsSoundScreenShareStart => '画面共有を開始';

  @override
  String get notificationsSoundScreenShareStop => '画面共有を停止';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'プッシュ通知のタイムアウトを更新できませんでした。もう一度お試しください。';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'メンション設定の更新に失敗しました。もう一度お試しください。';

  @override
  String get notificationsPermissionDeniedTitle => '通知をブロックしました';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      '通知を有効にできませんでした。続行するには、通知の許可が必要です。';

  @override
  String get userSettingsNavLanguageAndTime => '言語と時刻';

  @override
  String get languageAndTimeLanguageSectionTitle => '表示言語';

  @override
  String get languageAndTimeLanguageSectionDescription => 'アプリの表示に使用する言語を選択します';

  @override
  String get languageAndTimeOpenLanguageSettings => '言語設定を開く';

  @override
  String get languageAndTimeTimeFormatSectionTitle => '時刻表示';

  @override
  String get languageAndTimeTimeFormatSectionDescription => 'アプリ全体での時刻表示形式を選択';

  @override
  String get languageAndTimeTimeFormatSelectionLabel => '時刻表示形式の選択';

  @override
  String get languageAndTimeTimeFormatAuto => '自動';

  @override
  String get languageAndTimeTimeFormat12Hour => '12時間制';

  @override
  String get languageAndTimeTimeFormat24Hour => '24時間制';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'アプリの言語: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'システムのロケール: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat => 'システムロケールを時刻形式に使用';

  @override
  String get languageAndTimeTimeFormatSyncFailed => '時刻フォーマットの更新に失敗しました';

  @override
  String get userSettingsNavDefaultApps => 'デフォルトのアプリ';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'ウェブブラウザ';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'リンクをタップしたときに開くブラウザを選択します。';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'アプリがインストールされているサイトの場合、リンクはそのアプリで最初に開かれます。';

  @override
  String get defaultAppsWebBrowserInApp => 'アプリ内ブラウザ';

  @override
  String get defaultAppsWebBrowserExternal => '外部ブラウザ';

  @override
  String get userSettingsNavAdvanced => '詳細設定';

  @override
  String get advancedPerformanceReportingTitle => 'パフォーマンスレポート';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return '匿名化されたクラッシュおよびパフォーマンスデータを共有することで、$productNameの改善にご協力ください。';
  }

  @override
  String get advancedPerformanceReportingLabel => 'クラッシュおよびパフォーマンスレポートを送信する';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return '報告されるすべてのデータは匿名であり、$productName独自の監視サービスにのみ送信されます。サードパーティプロバイダーは使用しません。';
  }

  @override
  String get advancedSettingsConfigure => '設定';

  @override
  String get advancedSettingsCategoryPrivacy => 'プライバシー';

  @override
  String get advancedSettingsCategoryAppearance => '表示設定';

  @override
  String get advancedSettingsCategoryAccessibility => 'アクセシビリティ';

  @override
  String get advancedSettingsCategoryChat => 'チャット';

  @override
  String get advancedSettingsCategoryMedia => 'メディア';

  @override
  String get advancedSettingsCategoryVoice => '音声';

  @override
  String get advancedSettingsCategoryDeveloper => '開発者向け';

  @override
  String get advancedSettingEnableTextSelectionLabel => 'テキスト選択を有効にする';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'アプリ内のテキスト選択を許可する';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel => 'ビデオシークサムネイルを有効にする';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'ビデオをスクラブする際のサムネイルまたはライブフレーム';

  @override
  String get advancedSettingHapticFeedbackLabel => '触覚フィードバック';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'タップや操作時の振動フィードバックです。デバイス間で同期されません。';

  @override
  String get advancedSettingShowNekoLabel => 'ネコを表示';

  @override
  String get advancedSettingShowNekoDescription => 'カーソルを追いかける猫';

  @override
  String get advancedSettingShowNekoDescriptionTouch => 'チャット入力欄にネコを表示';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'スプラッシュズームアニメーション';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'スプラッシュ画面を終了するときにロゴを縮小表示します';

  @override
  String get advancedSettingKeyboardHintsLabel => 'キーボードのヒント';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'ツールチップに表示されるキーボードショートカットのヒント';

  @override
  String get advancedSettingEnableFavoritesLabel => 'お気に入りを有効にする';

  @override
  String get advancedSettingEnableFavoritesDescription => 'アプリ全体で「お気に入り」を表示する';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel => '音声チャンネル参加時の動作';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'コミュニティボイスへの参加時の確認またはダブルクリック';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      '音声チャンネル参加時にダブルクリックを要求';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel => '音声チャンネル参加時に確認する';

  @override
  String get advancedSettingAutoSendGifsLabel => '選択時にGIFを自動送信';

  @override
  String get advancedSettingAutoSendGifsDescription => 'GIFピッカーから確認なしで自動送信';

  @override
  String get advancedSettingSaveGifFavoritesLabel => 'GIFのお気に入りを保存済みメディアとして保存';

  @override
  String get advancedSettingSaveGifFavoritesDescription => 'お気に入りのGIFの保存方法を選択';

  @override
  String get advancedSettingMediaButtonsLabel => 'メディアボタン';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'メディア添付ファイルと埋め込みに表示されるボタンやインジケーターをカスタマイズします';

  @override
  String get advancedSettingPreuploadAttachmentsLabel => '送信前に添付ファイルをアップロード';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'メッセージ入力欄に添付ファイルが追加され次第、アップロードを開始します';

  @override
  String get advancedSettingStripTrackingLabel => 'URLからトラッキングパラメーターを削除';

  @override
  String get advancedSettingStripTrackingDescription =>
      '送信するメッセージ内のURLからトラッキングパラメータを自動的に削除';

  @override
  String get advancedSettingTrustAllLinksLabel => 'すべての外部リンクを信頼する';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'すべてのドメインで外部リンクの警告をスキップ';

  @override
  String get advancedSettingSearchEnginesLabel => '検索エンジン';

  @override
  String get advancedSettingSearchEnginesDescription =>
      '選択したテキストから使用する検索エンジンを設定します';

  @override
  String get advancedSettingTranslatorsLabel => '翻訳者';

  @override
  String get advancedSettingTranslatorsDescription =>
      '選択したテキストから使用する翻訳プロバイダーを設定します';

  @override
  String get advancedSettingReverseImageSearchLabel => '画像検索';

  @override
  String get advancedSettingReverseImageSearchDescription => 'リバース画像検索プロバイダー';

  @override
  String get advancedSettingMessageActionBarLabel => 'メッセージアクションバー';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'メッセージにカーソルを合わせたときに表示されるアクションバーをカスタマイズ';

  @override
  String get advancedSettingExpressionAutocompleteLabel => '表現のオートコンプリート';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'メッセージ入力欄でコロンを入力すると、何が表示されるかを選択します';

  @override
  String get advancedSettingInputButtonsLabel => 'メッセージ入力ボタン';

  @override
  String get advancedSettingInputButtonsDescription => 'メッセージ入力欄に表示するボタンを選択します';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'メッセージ送信時に一番下までスクロールする';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'メッセージ送信後にチャットがどのように進むかを選択します';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel => '「すべて既読にする」の確認をスキップ';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      '未読の受信チャンネルをすべて既読にする（確認なし）';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'ミュートしたチャンネルをデフォルトで非表示にする';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'ミュートしたチャンネルをコミュニティのサイドバーに表示しない';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'GIFインジケーターを表示';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      '添付ファイルの有効期限インジケーターを表示';

  @override
  String get advancedSettingShowMediaDeleteLabel => '削除ボタンを表示';

  @override
  String get advancedSettingShowMediaDownloadLabel => 'ダウンロードボタンを表示';

  @override
  String get advancedSettingShowMediaFavoriteLabel => 'お気に入りボタンを表示';

  @override
  String get advancedSettingShowSuppressEmbedsLabel => '埋め込みを非表示にするボタンを表示';

  @override
  String get advancedSettingShowMessageActionBarLabel => 'メッセージアクションバーを表示';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel => 'その他ボタンのみ表示';

  @override
  String get advancedSettingShowQuickReactionsLabel => 'クイックリアクションを表示';

  @override
  String get advancedSettingEnableShiftToExpandLabel => 'Shiftキーで展開';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      '入力候補にデフォルトの絵文字を表示';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      '表現のオートコンプリートでカスタム絵文字を表示';

  @override
  String get advancedSettingShowStickersAutocompleteLabel => '入力候補にスタンプを表示';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      '表現のオートコンプリートで保存済みメディアを表示';

  @override
  String get advancedSettingShowGifsButtonLabel => 'GIFボタンを表示';

  @override
  String get advancedSettingShowMediaButtonLabel => 'メディアボタンを表示';

  @override
  String get advancedSettingShowStickersButtonLabel => 'スタンプボタンを表示';

  @override
  String get advancedSettingShowEmojiButtonLabel => '絵文字ボタンを表示';

  @override
  String get advancedSettingShowSendButtonLabel => '送信ボタンを表示';

  @override
  String get advancedSettingNewDeviceAlertsLabel => '新しいデバイスの通知を表示';

  @override
  String get advancedSettingNewDeviceAlertsDescription => '新しいオーディオデバイスを要求する';

  @override
  String get advancedSettingConnectionVolumeControlsLabel => '接続音量コントロール';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'デバイスごとの参加者の音量スライダーを音声メニューに表示';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel => '画面共有プレビューの動作';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'プレビュー、ポップアウト、およびストリーミングサムネイルの動作';

  @override
  String get advancedSettingScreenShareCodecLabel => '画面共有コーデック';

  @override
  String get advancedSettingScreenShareCodecDescription => '画面共有のビデオコーデック';

  @override
  String get advancedSettingScreenShareCodecAuto => '自動（推奨）';

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
      'バックグラウンドで画面共有プレビューを一時停止する';

  @override
  String get advancedSettingHideStreamPreviewLabel => 'ストリームプレビューのサムネイルを非表示にする';

  @override
  String get advancedSettingDeveloperModeLabel => '開発者モードを有効にする';

  @override
  String get advancedSettingDeveloperModeDescription => '開発者モードを有効にする';

  @override
  String get advancedSettingSearchEngineGoogle => 'Google';

  @override
  String get advancedSettingSearchEngineDuckDuckGo => 'DuckDuckGo';

  @override
  String get advancedSettingSearchEngineBing => 'Bing';

  @override
  String get advancedSettingSearchEngineGoogleLens => 'Google レンズ';

  @override
  String get advancedSettingSearchEngineTinEye => 'TinEye';

  @override
  String get advancedSettingTranslatorGoogle => 'Google翻訳';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel => 'デフォルト検索エンジン';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      '選択したテキストを検索する際に、デフォルトで使用する検索エンジンを選択します。';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel => '内蔵検索エンジン';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      '内蔵の検索エンジンを有効または無効にします。有効にしたエンジンは、テキストを選択したときにメッセージのコンテキストメニューに表示されます。';

  @override
  String get advancedSettingCustomSearchEnginesLabel => 'カスタム検索エンジン';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'カスタムURLパターンで独自の検索エンジンを追加します。検索テキストのプレースホルダーとして「$query」を使用してください。';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => '検索エンジンを追加';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      '以下の検索エンジンを1つ以上有効にしてください。';

  @override
  String get advancedSettingRemoveSearchEngineLabel => '検索エンジンを削除';

  @override
  String get advancedSettingDefaultTranslatorLabel => '既定の翻訳';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      '選択したテキストを翻訳する際に、既定でどの翻訳ツールを使用するかを選択します。';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => '翻訳機能';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      '内蔵翻訳ツールの有効/無効を切り替えます。有効にすると、テキスト選択時のメッセージのコンテキストメニューに表示されます。';

  @override
  String get advancedSettingCustomTranslatorsLabel => 'カスタム翻訳';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'カスタムURLパターンで独自の翻訳者を追加します。「$query」を翻訳対象のプレースホルダーとして使用します。';
  }

  @override
  String get advancedSettingAddTranslatorLabel => '翻訳者を追加';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      '以下の翻訳ツールを1つ以上有効にしてください。';

  @override
  String get advancedSettingRemoveTranslatorLabel => '翻訳機能を削除';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel => '既定の画像検索';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      '画像を検索する際に、どの画像検索サービスをデフォルトで使用するかを選択します。';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel => '画像検索機能';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      '内蔵の画像検索プロバイダーを有効または無効にします。有効なプロバイダーは、画像、アバター、バナー、スタンプ、絵文字のコンテキストメニューに表示されます。';

  @override
  String get advancedSettingCustomReverseImageSearchLabel => 'カスタム画像検索';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'カスタムURLパターンで独自の画像検索プロバイダーを追加します。画像URLのプレースホルダーとして「$url」を使用してください。';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel => '画像検索を追加';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      '以下の画像検索プロバイダーを1つ以上有効にしてください。';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel => '画像検索を削除';

  @override
  String get advancedSettingAddSearchEngineTitle => '検索エンジンを追加';

  @override
  String get advancedSettingEditSearchEngineTitle => '検索エンジンを編集';

  @override
  String get advancedSettingAddTranslatorTitle => '翻訳プロバイダーを追加';

  @override
  String get advancedSettingEditTranslatorTitle => '翻訳プロバイダーを編集';

  @override
  String get advancedSettingAddReverseImageSearchTitle => '画像検索エンジンを追加';

  @override
  String get advancedSettingEditReverseImageSearchTitle => '画像検索エンジンを編集';

  @override
  String get advancedSettingSearchProviderNameLabel => '名前';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'URLパターン';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder => 'マイ検索エンジン';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder => '自分の翻訳';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder => '画像検索';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return '\'$query を検索テキストとして使用します。\'';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return '「$query」と入力して検索';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return '画像のURLは「$url」を入力してください。';
  }

  @override
  String get advancedSettingSearchProviderNameRequired => '名前は必須です。';

  @override
  String get advancedSettingSearchProviderUrlRequired => 'URLパターンは必須です。';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'URLパターンには「$query」を含める必要があります。';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'URLパターンには「$url」を含める必要があります。';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'URLパターンは有効なURLである必要があります。';

  @override
  String get advancedSettingAddSearchProviderAction => '追加';

  @override
  String get advancedSettingEditSearchProviderAction => '編集';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => '削除';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return '$engineName を削除してもよろしいですか？';
  }

  @override
  String get userSettingsNavApplications => 'アプリケーション';

  @override
  String get userSettingsNavAppLogs => 'アプリログ';

  @override
  String get userSettingsNavDeveloperTools => '開発者ツール';

  @override
  String get userSettingsNavLimitsConfig => '制限設定';

  @override
  String get userSettingsNavFeatureFlags => '機能フラグ';

  @override
  String get userSettingsNavWhatsNew => '新着情報';

  @override
  String get userSettingsJoinFluxerLabs => 'Fluxer Labsに参加する';

  @override
  String get userSettingsNavAppLicenses => 'アプリのライセンス';

  @override
  String get userSettingsAppLicensesDescription =>
      'このアプリではオープンソースソフトウェアを使用しています。このアプリはFlutterで構築されています。';

  @override
  String get userSettingsAppLicensesLoadError => 'アプリのライセンスを読み込めませんでした。';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countライセンス',
      one: '1ライセンス',
    );
    return '$_temp0';
  }

  @override
  String get userSettingsNavLogOut => 'ログアウト';

  @override
  String get quickSwitcherTabSearch => '検索';

  @override
  String get quickSwitcherTabFriends => '友達';

  @override
  String get quickSwitcherSearchPlaceholder => 'チャンネル、ユーザー、またはコミュニティを検索';

  @override
  String get quickSwitcherSearchFriends => '友達を検索';

  @override
  String get quickSwitcherNoMatchesFound => '一致するものが見つかりませんでした';

  @override
  String get quickSwitcherEmptyHint =>
      '別の名前を試すか、@ / # / ! / * プレフィックスを使用して結果を絞り込みます。';

  @override
  String get quickSwitcherSectionPeople => 'ユーザー';

  @override
  String get quickSwitcherSectionGroupMessages => 'グループメッセージ';

  @override
  String get quickSwitcherSectionTextChannels => 'テキストチャンネル';

  @override
  String get quickSwitcherSectionVoiceChannels => 'ボイスチャンネル';

  @override
  String get quickSwitcherSectionCommunities => 'コミュニティ';

  @override
  String get quickSwitcherSectionSettings => '設定';

  @override
  String get quickSwitcherHomeLabel => 'ホーム';

  @override
  String get quickSwitcherDirectMessagesLabel => 'ダイレクトメッセージ';

  @override
  String get quickSwitcherFavoritesLabel => 'お気に入り';

  @override
  String get quickSwitcherUserSettingsLabel => 'ユーザー設定';

  @override
  String get quickSwitcherNotificationsLabel => '通知';

  @override
  String get quickSwitcherBookmarksLabel => 'ブックマーク';

  @override
  String get savedMessagesEmptyTitle => 'ブックマークなし';

  @override
  String get savedMessagesEmptyBody => 'メッセージをブックマークして後で見返しましょう。';

  @override
  String get savedMessagesEndBody => 'これ以上表示するものはありません。';

  @override
  String get savedMessagesRemoveTooltip => 'ブックマークを削除';

  @override
  String get quickSwitcherMentionsLabel => 'メンション';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'まだ友達がいません';

  @override
  String get quickSwitcherFriendsEmptyHint => '友達を追加して始めましょう。';

  @override
  String get quickSwitcherFriendsNoMatchTitle => '検索に一致する友達がいません';

  @override
  String get quickSwitcherFriendsNoMatchHint => '別の名前を試してください。';

  @override
  String get quickSwitcherSearchAliasUser => 'ユーザー';

  @override
  String get quickSwitcherSearchAliasYou => 'あなた';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'DM';

  @override
  String get quickSwitcherSearchAliasMessages => 'メッセージ';

  @override
  String get quickSwitcherSearchAliasFav => 'お気に入り';

  @override
  String get quickSwitcherSearchAliasStarred => 'スター付き';

  @override
  String get quickSwitcherSearchAliasInbox => '受信トレイ';

  @override
  String get quickSwitcherSearchAliasSaved => '保存済み';

  @override
  String get uiClose => '閉じる';

  @override
  String get chatJumpToBottom => '一番下へ移動';

  @override
  String get uiConfirm => '確認';

  @override
  String get uiLoading => '読み込み中';

  @override
  String get uiSearch => '検索';

  @override
  String get uiStartCall => '通話を開始';

  @override
  String get uiStartVideoCall => 'ビデオ通話を開始';

  @override
  String get uiPlay => '再生';

  @override
  String get uiPause => '一時停止';

  @override
  String get uiDownload => 'ダウンロード';

  @override
  String get uiMoreActions => 'その他';

  @override
  String get uiUnsavedChanges => '変更が保存されていません';

  @override
  String get uiReset => 'リセット';

  @override
  String get uiOpenColorPicker => 'カラーピッカーを開く';

  @override
  String get uiSelectPlaceholder => '選択';

  @override
  String get uiSearchPlaceholder => '検索';

  @override
  String get uiNoOptionsFound => 'オプションが見つかりません';

  @override
  String get uiDismissNotification => '通知を閉じる';

  @override
  String get uiColorPickerTitle => 'カラーピッカー';

  @override
  String get mentionConfirmTitle => '全員にメンションしますか？';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return '$count人のメンバーに通知されます。続行しますか？';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return '$count人のオンラインメンバーに通知されます。続行しますか？';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return '$count人のメンバーに$roleNameロールを通知します。続行しますか？';
  }

  @override
  String get mentionConfirmButton => 'メンション';

  @override
  String get composerEmojiUnavailable => 'この絵文字はここでは使用できません。';

  @override
  String get instanceUrlLabel => 'インスタンスURL';

  @override
  String get instanceUrlPlaceholder => 'インスタンスURLを入力 (例: fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Fluxerにリセット';

  @override
  String get instanceConnect => '接続';

  @override
  String get instanceConnecting => '接続中…';

  @override
  String get instanceConnectFailed => 'インスタンスに接続できませんでした';

  @override
  String get recentInstances => '最近使ったインスタンス';

  @override
  String removeRecentInstance(String domain) {
    return '$domain を最近使ったインスタンスから削除';
  }

  @override
  String get instanceSheetTitle => 'インスタンスに接続';

  @override
  String get connectToDifferentInstance => '別のインスタンスに接続';

  @override
  String get changeInstance => '変更';

  @override
  String get instanceConnectionRequired => 'サインインするにはインスタンスに接続してください';

  @override
  String get comingSoon => '近日公開';

  @override
  String get guildNavbarDirectMessages => 'ダイレクトメッセージ';

  @override
  String get guildNavbarExploreDiscoverableCommunities => '公開コミュニティを探す';

  @override
  String get discoveryExplore => '探す';

  @override
  String get discoveryExplorePublicCommunities => '公開コミュニティを探す';

  @override
  String get discoveryListingSubheading =>
      'ここにコミュニティを掲載したいですか？ コミュニティの設定 > ディスカバリーで要件を確認し、申請してください。';

  @override
  String get discoverySearchCommunities => 'コミュニティを検索';

  @override
  String get discoveryFilterByLanguage => '言語で絞り込む';

  @override
  String get discoveryAllLanguages => 'すべての言語';

  @override
  String get discoveryAllCategories => 'すべて';

  @override
  String get discoveryCategoryGaming => 'ゲーム';

  @override
  String get discoveryCategoryMusic => '音楽';

  @override
  String get discoveryCategoryEntertainment => 'エンターテイメント';

  @override
  String get discoveryCategoryEducation => '教育';

  @override
  String get discoveryCategoryScienceAndTechnology => '科学とテクノロジー';

  @override
  String get discoveryCategoryContentCreator => 'コンテンツクリエイター';

  @override
  String get discoveryCategoryAnimeAndManga => 'アニメとマンガ';

  @override
  String get discoveryCategoryMoviesAndTv => '映画とテレビ';

  @override
  String get discoveryCategoryOther => 'その他';

  @override
  String get discoveryNoCommunitiesMatch => 'コミュニティが見つかりません。';

  @override
  String get discoveryJoinCommunity => 'コミュニティに参加';

  @override
  String get discoveryJoined => '参加済み';

  @override
  String discoveryOnlineCount(String count) {
    return '$count 人オンライン';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'メンバー $countString 人',
      one: 'メンバー 1 人',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => '説明がありません。';

  @override
  String get discoveryCommunities => 'コミュニティ';

  @override
  String get discoveryApps => 'アプリ';

  @override
  String get discoveryJoinErrorGenericTitle => 'このコミュニティに参加できませんでした';

  @override
  String get discoveryJoinErrorGenericMessage =>
      '問題が発生しました。しばらくしてからもう一度お試しください。';

  @override
  String get discoveryJoinErrorFullTitle => 'このコミュニティは満員です';

  @override
  String get discoveryJoinErrorFullMessage =>
      'このコミュニティはメンバーの上限に達しているため、現在参加できません。';

  @override
  String get discoveryJoinErrorMaxGuildsTitle => 'コミュニティの上限に達しました';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'コミュニティの上限に達しています。いずれかのコミュニティを退出してから、もう一度お試しください。';

  @override
  String get discoveryJoinErrorBannedTitle => 'このコミュニティには参加できません';

  @override
  String get discoveryJoinErrorBannedMessage => 'このコミュニティから追放されました。';

  @override
  String get discoveryJoinErrorNotAvailableTitle => 'このコミュニティは利用できなくなりました';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'ディスカバリーから削除されたか、新規参加を停止した可能性があります。ページを更新すると、このコミュニティは表示されなくなります。';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'ペースが速すぎます';

  @override
  String get discoveryJoinErrorRateLimitMessage => 'しばらく待ってから、もう一度お試しください。';

  @override
  String get guildNavbarAddCommunity => 'コミュニティを追加';

  @override
  String get guildNavbarHelp => 'ヘルプ';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => '新しいメッセージ';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return '$folderNameをフォールドする';
  }

  @override
  String get guildNavbarGuildSelected => '選択中';

  @override
  String get guildNavbarGuildUnread => '未読';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のメンション',
      one: 'メンション1件',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'ミュート中';

  @override
  String get authShowPassword => 'パスワードを表示';

  @override
  String get authHidePassword => 'パスワードを非表示';

  @override
  String get chatLoadingMessages => 'メッセージを読み込み中';

  @override
  String get friendsMessageFriend => 'メッセージ';

  @override
  String get friendsFriendActions => '友達のアクション';

  @override
  String get friendsAcceptRequest => '友達リクエストを承認';

  @override
  String get friendsDeclineRequest => '友達リクエストを拒否';

  @override
  String get friendsCancelRequest => '友達リクエストをキャンセル';

  @override
  String get friendsOpenInbox => '受信箱';

  @override
  String get profileRemoveFriend => '友達から削除';

  @override
  String get profileUnblockUser => 'ブロック解除';

  @override
  String get profileAcceptFriendRequest => '友達リクエストを承認';

  @override
  String get profileCancelFriendRequest => '友達リクエストをキャンセル';

  @override
  String get profileSendFriendRequest => '友達に追加';

  @override
  String get accountOverflowMenu => 'アカウントオプション';

  @override
  String get navHome => 'ホーム';

  @override
  String get navNotifications => '通知';

  @override
  String get navYou => '自分';

  @override
  String get guildFolderSettingsTitle => 'フォルダー設定';

  @override
  String get guildFolderNameLabel => 'フォルダー名';

  @override
  String get guildFolderColorLabel => 'フォルダーの色';

  @override
  String get guildFolderShowIconWhenCollapsed => '折りたたみ時にアイコンを表示';

  @override
  String get guildFolderIconLabel => 'フォルダーアイコン';

  @override
  String get guildFolderDelete => 'フォルダーを削除';

  @override
  String get guildFolderIconFolder => 'フォルダー';

  @override
  String get guildFolderIconStar => 'スター';

  @override
  String get guildFolderIconHeart => 'ハート';

  @override
  String get guildFolderIconBookmark => 'ブックマーク';

  @override
  String get guildFolderIconGameController => 'ゲームコントローラー';

  @override
  String get guildFolderIconShield => 'シールド';

  @override
  String get guildFolderIconMusicNote => '音符';

  @override
  String get guildFolderMarkAsRead => 'フォルダーをすべて既読にする';

  @override
  String get guildBulkMuteCommunities => 'コミュニティをミュート';

  @override
  String get guildBulkUnmuteCommunities => 'コミュニティのミュートを解除';

  @override
  String get guildBulkCommunityNotificationSettings => 'コミュニティの通知設定';

  @override
  String get guildBulkCommunityPrivacySettings => 'コミュニティのプライバシー設定';

  @override
  String get guildBulkAllowEveryoneAndHere => '@everyone と @here を許可する';

  @override
  String get guildBulkAllowRoleMentions => 'ロールメンションを許可';

  @override
  String get guildBulkEnableMobilePush => 'モバイルプッシュ通知をオンにする';

  @override
  String get guildBulkDisableMobilePush => 'モバイルプッシュ通知をオフにする';

  @override
  String get guildBulkAllowDirectMessages => 'ダイレクトメッセージを許可';

  @override
  String get guildBulkBlockDirectMessages => 'ダイレクトメッセージをブロック';

  @override
  String get guildBulkAllowBotDirectMessages => 'ボットからのDMを許可';

  @override
  String get guildBulkBlockBotDirectMessages => 'ボットからのDMをブロック';

  @override
  String get guildNavbarGroupDm => 'グループDM';

  @override
  String get guildNavbarCreateChannel => 'チャンネルを作成';

  @override
  String get guildNavbarChannelType => 'チャンネルタイプ';

  @override
  String get guildNavbarTextChannel => 'テキストチャンネル';

  @override
  String get guildNavbarTextChannelDescription => 'メッセージ、画像、GIF、絵文字を送信';

  @override
  String get guildNavbarVoiceChannel => 'ボイスチャンネル';

  @override
  String get guildNavbarVoiceChannelDescription => 'ボイス、ビデオ、画面共有で一緒に過ごす';

  @override
  String get guildNavbarLinkChannel => 'リンクチャンネル';

  @override
  String get guildNavbarLinkChannelDescription => '外部ウェブサイトやリソースへのクイックアクセス';

  @override
  String get guildNavbarNameLabel => '名前';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'チャンネルの種類を選択';

  @override
  String get guildNavbarCreateCategory => 'カテゴリーを作成';

  @override
  String get guildNavbarNewCategoryHint => '新しいカテゴリー';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return '$communityNameに友達を招待';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return '招待された受信者は#$channelNameに移動します';
  }

  @override
  String get guildNavbarSearchFriends => '友達を検索';

  @override
  String get guildNavbarNoFriendsYet => 'まだ友達がいません';

  @override
  String get guildNavbarNoResults => '結果がありません';

  @override
  String get guildNavbarInviteLinkPrompt => 'または、友達に招待リンクを送信してください:';

  @override
  String get guildNavbarInviteLink => '招待リンク';

  @override
  String get guildNavbarCopy => 'コピー';

  @override
  String get guildNavbarCopied => 'コピーしました！';

  @override
  String get guildNavbarInviteExpiresSevenDays => '招待リンクは7日で期限切れになります。';

  @override
  String get guildNavbarInviteNeverExpires => 'この招待リンクは期限切れになりません。';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return '招待リンクは$durationで期限切れになります。';
  }

  @override
  String get guildNavbarEditInviteLink => '招待リンクを編集';

  @override
  String get guildNavbarInviteLinkSettings => '招待リンク設定';

  @override
  String get guildNavbarExpireAfter => '期限切れまでの時間';

  @override
  String get guildNavbarMaxUses => '最大使用回数';

  @override
  String get guildNavbarGrantTemporaryMembership => '一時的なメンバーシップを付与';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'ロールが割り当てられていない限り、メンバーはオフラインになると削除されます';

  @override
  String get guildNavbarCreateNewLink => '新規リンクを作成';

  @override
  String get guildNavbarSent => '送信済み';

  @override
  String get guildNavbarInvite => '招待';

  @override
  String get guildNavbarLeaveCommunityTitle => 'コミュニティを退会';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'このコミュニティを退会してもよろしいですか？メッセージは一切表示されなくなります。';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'コミュニティを退会';

  @override
  String get guildNavbarDeleteMyMessagesTitle => 'このコミュニティでのあなたのメッセージを削除しますか？';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'すべてのチャンネルで、あなたがここに送信したすべてのメッセージを完全に削除します。元に戻すことはできません。';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'メッセージを削除';

  @override
  String get guildNavbarDeletedYourMessages => 'あなたのメッセージを削除しました';

  @override
  String get guildNavbarCouldNotDeleteYourMessages => 'あなたのメッセージを削除できませんでした';

  @override
  String get guildNavbarRemoveOverride => 'オーバーライドを削除';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return '$formattedDateまでミュート中';
  }

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return '$productNameスタッフのみアクセス可能';
  }

  @override
  String get guildNavbarInvitesPaused => 'このコミュニティでは現在、招待が無効になっています';

  @override
  String get guildNavbarDurationNever => '無期限';

  @override
  String get guildNavbarDuration30Minutes => '30分';

  @override
  String get guildNavbarDuration1Hour => '1時間';

  @override
  String get guildNavbarDuration6Hours => '6時間';

  @override
  String get guildNavbarDuration12Hours => '12時間';

  @override
  String get guildNavbarDuration1Day => '1日';

  @override
  String get guildNavbarDuration7Days => '7日';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count秒';
  }

  @override
  String get guildNavbarNever => '無期限';

  @override
  String get guildNavbarNoLimit => '無制限';

  @override
  String get guildNavbarOneUse => '1回';

  @override
  String guildNavbarUses(int count) {
    return '$count回';
  }

  @override
  String get guildMenuMarkAsRead => 'すべて既読にする';

  @override
  String get guildPeekMoreOptions => 'その他のオプション';

  @override
  String get guildMenuInviteMembers => 'メンバーを招待';

  @override
  String get guildMenuCommunitySettings => 'コミュニティ設定';

  @override
  String get guildMenuEditCommunityProfile => 'コミュニティプロフィールを編集';

  @override
  String get guildMenuUnmuteCommunity => 'コミュニティのミュート解除';

  @override
  String get guildMenuMuteCommunity => 'コミュニティをミュート';

  @override
  String get guildMenuHideMutedChannels => 'ミュートされたチャンネルを非表示';

  @override
  String get guildMenuReportCommunity => 'コミュニティを報告';

  @override
  String get guildMenuDebugCommunity => 'コミュニティのデバッグ';

  @override
  String get guildMenuCopyCommunityId => 'コミュニティIDをコピー';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return '$formattedTimeまで';
  }

  @override
  String get guildMenuSettingsGeneral => '概要';

  @override
  String get guildMenuSettingsRoles => 'ロールと権限';

  @override
  String get guildMenuSettingsEmoji => 'カスタム絵文字';

  @override
  String get guildMenuSettingsStickers => 'カスタムステッカー';

  @override
  String get guildMenuSettingsSafetyModeration => '安全性とモデレーション';

  @override
  String get guildMenuSettingsActivityLog => 'アクティビティログ';

  @override
  String get guildMenuSettingsWebhooks => 'Webhooks';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'カスタム招待URL';

  @override
  String get guildMenuSettingsDiscovery => 'ディスカバリー';

  @override
  String get guildMenuSettingsMembers => 'メンバー';

  @override
  String get guildMenuSettingsInviteLinks => '招待リンク';

  @override
  String get guildMenuSettingsBans => '禁止';

  @override
  String get guildMenuSettingsChannels => 'チャンネル';

  @override
  String get guildSettingsNoPermission => 'この設定タブを表示する権限がありません。';

  @override
  String get guildSettingsOverviewIconTitle => 'アイコン';

  @override
  String get guildSettingsUploadImage => '画像をアップロード';

  @override
  String get guildSettingsOverviewBannerTitle => 'バナー';

  @override
  String get guildSettingsOverviewBannerHint => 'サーバーのバナーをアップロードしてください。';

  @override
  String get guildSettingsOverviewNameTitle => '名前';

  @override
  String get guildSettingsOverviewNameHint => '私の素晴らしいコミュニティ';

  @override
  String get guildSettingsOverviewStatsTitle => '統計';

  @override
  String get guildSettingsOverviewMembers => 'メンバー';

  @override
  String get guildSettingsOverviewOnline => 'オンライン';

  @override
  String get guildSettingsRolesDescription => 'ロールを使用してメンバーをグループ化し、権限を割り当てます。';

  @override
  String get guildSettingsCreateRole => 'ロールを作成';

  @override
  String get guildSettingsRolesListTitle => 'ロール';

  @override
  String get guildSettingsRolesNewRole => '新しいロール';

  @override
  String get guildSettingsRolesDeleteRole => 'ロールを削除';

  @override
  String get guildSettingsRolesBackToRoles => 'ロールに戻る';

  @override
  String get guildSettingsBackToSettings => '設定に戻る';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return '「$name」を編集';
  }

  @override
  String get guildSettingsRolesEditSubtitle => 'ロール設定と権限を構成';

  @override
  String get guildSettingsRolesDisplaySection => '表示';

  @override
  String get guildSettingsRolesRoleName => 'ロール名';

  @override
  String get guildSettingsRolesRoleColor => 'ロールの色';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      '色（16進数、rgb()、hsl()、または名前）を入力するか、ピッカーを使用してください。';

  @override
  String get guildSettingsRolesShowSeparately => 'このロールを個別に表示';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'このロールを持つメンバーは、メンバーリスト内で専用のセクションに表示されます。';

  @override
  String get guildSettingsRolesAllowMentions => 'このロールへのメンションを許可';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return '「$permission」権限を持つメンバーは、この設定に関わらず、常にロールをメンションできます。';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'このボタンで、すべての権限を素早くクリアできます。';

  @override
  String get guildSettingsRolesClearPermissions => '権限をクリア';

  @override
  String get guildSettingsRolesPermissionsSection => '権限';

  @override
  String get guildSettingsRolesSearchPermissions => '権限を検索';

  @override
  String get guildSettingsRolesDenseLayout => 'コンパクト表示';

  @override
  String get guildSettingsRolesComfyLayout => 'ゆったりレイアウト';

  @override
  String get guildSettingsRolesSwitchToDenseLayout => 'コンパクト表示に切り替える';

  @override
  String get guildSettingsRolesSwitchToComfyLayout => '快適なレイアウトに切り替える';

  @override
  String get guildSettingsRolesSingleColumn => '1列';

  @override
  String get guildSettingsRolesTwoColumns => '2列';

  @override
  String get guildSettingsRolesSwitchToSingleColumn => '1列表示に切り替え';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => '2列表示に切り替え';

  @override
  String get guildSettingsRolesNoPermissionsFound => '権限が見つかりませんでした';

  @override
  String get guildSettingsRolesCustomHoistOrder => 'カスタム表示順';

  @override
  String get guildSettingsRolesHoistOrder => '表示順';

  @override
  String get guildSettingsRolesResetHoistOrder => 'デフォルトにリセット';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      '役割をドラッグして、メンバーリストでの表示順をカスタマイズできます。';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      '表示するロールがありません。「ロールを個別に表示」を有効にすると、ここに表示されます。';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'このロールは、あなたの最高ロールであるか、あなたより上位のロールであるため編集できません';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'これらの権限を編集するには、「$permission」権限が必要です';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole => '自分の最高ロール以上のロールは編集できません';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'あなたが持っていない権限を付与することはできません';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'この権限を削除すると、あなた自身から権限が削除されるため、削除できません';

  @override
  String get guildSettingsRolesUpdatedSuccess => 'ロールを更新しました';

  @override
  String get guildSettingsRolesCreatedSuccess => 'ロールを作成しました';

  @override
  String get guildSettingsRolesDeletedSuccess => 'ロールを削除しました';

  @override
  String get guildSettingsRolesHoistResetSuccess => '表示順をデフォルトにリセットしました';

  @override
  String get guildSettingsRolesNameRequiredTitle => 'ロール名は必須です';

  @override
  String get guildSettingsRolesNameRequiredBody => '保存する前に、ロールに名前を付けてください。';

  @override
  String get guildSettingsRolesCreateFailedTitle => 'ロールを作成できませんでした';

  @override
  String get guildSettingsRolesUpdateFailedTitle => 'ロールを更新できませんでした';

  @override
  String get guildSettingsRolesDeleteFailedTitle => 'ロールを削除できませんでした';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '「$name」を削除できませんでした。もう一度お試しください。';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle => '表示順をリセットできませんでした';

  @override
  String get guildSettingsRolesTryAgainInAMoment => 'しばらくしてからもう一度お試しください。';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return '「$name」ロールを削除してもよろしいですか？このロールを持つメンバーは、ロールを失います。';
  }

  @override
  String get permissionCategoryCommunityWide => 'コミュニティ全体';

  @override
  String get permissionCategoryMessagesMedia => 'メッセージとメディア';

  @override
  String get permissionCategoryModeration => 'モデレーション';

  @override
  String get permissionCategoryChannelAccess => 'チャンネルアクセス';

  @override
  String get permissionCategoryChannelManagement => 'チャンネル管理';

  @override
  String get permissionCategoryAudioVideo => 'オーディオとビデオ';

  @override
  String get permissionUnknown => '不明な権限';

  @override
  String get permissionAdministrator => '管理者';

  @override
  String get permissionAdministratorDescription =>
      'すべての権限を付与し、チャンネル制限をバイパスします。機密性の高い操作です。';

  @override
  String get permissionViewActivityLog => 'アクティビティログを表示';

  @override
  String get permissionViewActivityLogDescription =>
      'コミュニティの変更履歴やモデレーション操作のログを閲覧する。';

  @override
  String get permissionManageCommunity => 'コミュニティを管理';

  @override
  String get permissionManageCommunityDescription => '名前、説明、アイコンなどの全体設定を編集.';

  @override
  String get permissionManageRoles => 'ロールを管理';

  @override
  String get permissionManageRolesDescription =>
      '自分の最高ロールより下位のロールを作成、編集、または削除できます。チャンネルの権限オーバーライドの編集も許可します。';

  @override
  String get permissionManageChannels => 'チャンネルを管理';

  @override
  String get permissionManageChannel => 'チャンネルを管理';

  @override
  String get permissionManageChannelDescription => 'このチャンネルの名前変更と設定編集.';

  @override
  String get permissionManagePermissions => '権限を管理';

  @override
  String get permissionManagePermissionsDescription =>
      'このチャンネルでのロールとメンバーの上書き設定を編集.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'このチャンネルのウェブフックを作成、編集、または削除します。';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'このチャンネルのメンバーリストを見る.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'このチャンネルの招待リンクを管理します。';

  @override
  String get permissionOverwriteDeny => '拒否';

  @override
  String get permissionOverwriteInherit => '中立 (継承)';

  @override
  String get permissionOverwriteAllow => '許可';

  @override
  String get permissionOverwriteSetAllHelp => 'これらのボタンですべての権限を素早く設定できます。';

  @override
  String get permissionManageChannelsDescription => 'チャンネルやカテゴリを作成、編集、削除する.';

  @override
  String get permissionKickMembers => 'メンバーを追放';

  @override
  String get permissionBanMembers => 'メンバーをBANする';

  @override
  String get permissionCreateInviteLinks => '招待リンクを作成';

  @override
  String get permissionChangeOwnNickname => '自分のニックネームを変更';

  @override
  String get permissionChangeOwnNicknameDescription => '自分のニックネームを更新.';

  @override
  String get permissionManageNicknames => 'ニックネームを管理';

  @override
  String get permissionManageNicknamesDescription => '他のメンバーのニックネームを変更.';

  @override
  String get permissionCreateEmojiStickers => '絵文字とステッカーを作成';

  @override
  String get permissionCreateEmojiStickersDescription =>
      '新しい絵文字やスタンプをアップロードしたり、自分で作成したものを管理できます。';

  @override
  String get permissionManageEmojiStickers => '絵文字とステッカーを管理';

  @override
  String get permissionManageEmojiStickersDescription =>
      '他のメンバーが作成した絵文字やスタンプを編集または削除する.';

  @override
  String get permissionManageWebhooks => 'ウェブフックを管理';

  @override
  String get permissionManageWebhooksDescription => 'ウェブフックを作成、編集、または削除.';

  @override
  String get permissionSendMessages => 'メッセージを送信';

  @override
  String get permissionSendTtsMessages => 'TTSメッセージを送信';

  @override
  String get permissionSendTtsMessagesDescription => '読み上げメッセージを送信';

  @override
  String get permissionManageMessages => 'メッセージを管理';

  @override
  String get permissionManageMessagesDescription =>
      '他のメンバーのメッセージを削除。ピン留めは別途管理されます。';

  @override
  String get permissionPinMessages => 'メッセージをピン留めする';

  @override
  String get permissionEmbedLinks => 'リンクを埋め込む';

  @override
  String get permissionAttachFiles => 'ファイルを添付';

  @override
  String get permissionMentionEveryone => '@everyone/@here および @ロールを使用';

  @override
  String get permissionMentionEveryoneDescription =>
      '全員または任意のロールにメンションできます（メンション不可に設定されているロールも含む）。';

  @override
  String get permissionUseExternalEmoji => '外部の絵文字を使用';

  @override
  String get permissionUseExternalEmojiDescription => '他のコミュニティの絵文字を使用.';

  @override
  String get permissionUseExternalStickers => '外部スタンプを使用';

  @override
  String get permissionAddReactions => 'リアクションを追加';

  @override
  String get permissionAddReactionsDescription => 'メッセージに新しいリアクションを追加.';

  @override
  String get permissionBypassSlowmode => '低速モードをバイパス';

  @override
  String get permissionBypassSlowmodeDescription => 'チャンネルごとのメッセージ送信制限を無視.';

  @override
  String get permissionTimeOutMembers => 'メンバーをタイムアウトにする';

  @override
  String get permissionTimeOutMembersDescription =>
      'メンバーのメッセージ送信、リアクション、音声通話への参加を一定期間禁止します。';

  @override
  String get permissionViewChannel => 'チャンネルを表示';

  @override
  String get permissionViewChannelMembers => 'チャンネルメンバーを表示';

  @override
  String get permissionViewChannelMembersDescription =>
      'このコミュニティのチャンネルメンバーリストを見る.';

  @override
  String get permissionConnect => '接続';

  @override
  String get permissionSpeak => '発言';

  @override
  String get permissionStreamVideo => '動画を配信';

  @override
  String get permissionUseVoiceActivity => '音声認識を使用';

  @override
  String get permissionUseVoiceActivityDescription =>
      'この権限がない場合、プッシュトゥトークが必要です。';

  @override
  String get permissionPrioritySpeaker => '優先スピーカー';

  @override
  String get permissionMuteMembers => 'メンバーをミュート';

  @override
  String get permissionDeafenMembers => 'メンバーをスピーカーミュートにする';

  @override
  String get permissionMoveMembers => 'メンバーを移動';

  @override
  String get permissionMoveMembersDescription =>
      'アクセス可能なチャンネル間でメンバーをドラッグ＆ドロップします。';

  @override
  String get permissionSetVoiceRegion => '音声リージョンを設定';

  @override
  String guildSettingsEmojiSlotInfo(int staticCount, int animatedCount) {
    return '$staticCount個の静的絵文字、$animatedCount個のアニメーション絵文字を使用中';
  }

  @override
  String get guildSettingsEmojiEmpty => 'カスタム絵文字はまだありません。';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count個のステッカーをアップロード済み';
  }

  @override
  String get guildSettingsStickersEmpty => 'カスタムステッカーはまだありません。';

  @override
  String get guildSettingsModerationVerificationTitle => 'メンバー認証';

  @override
  String get guildSettingsModerationVerificationDescription =>
      '投稿またはコミュニティメンバーへのDMを送信する前に、メンバーが満たす必要がある条件を選択します。';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'ロールを持つメンバーはこれらのチェックをバイパスできます。公開スペースでは、認証を有効にすることをお勧めします。';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Discoveryに表示されるコミュニティは、少なくともメール認証が必要です。Discoveryが有効な場合、Noneは選択できません。';

  @override
  String get guildSettingsModerationMatureTitle => '不適切コンテンツとコンテンツ警告';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'メンバー向けの不適切コンテンツのラベリングとオプションのコンテンツ警告を設定します。';

  @override
  String get guildSettingsModerationMatureToggle => '不適切コンテンツ';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'このコミュニティを不適切コンテンツを含むものとしてマークします。';

  @override
  String get guildSettingsVerificationNone => 'なし';

  @override
  String get guildSettingsVerificationNoneDescription => '認証は不要です。';

  @override
  String get guildSettingsVerificationLow => '低';

  @override
  String get guildSettingsVerificationLowDescription => '認証済みメールアドレスが必要です。';

  @override
  String get guildSettingsVerificationMedium => '中';

  @override
  String get guildSettingsVerificationMediumDescription =>
      '認証済みメールアドレスと、5分以上経過したアカウントが必要です。';

  @override
  String get guildSettingsVerificationHigh => '高';

  @override
  String get guildSettingsVerificationHighDescription =>
      '中レベルのすべての条件に加え、コミュニティに10分以上参加している必要があります。';

  @override
  String get guildSettingsVerificationHighest => '最高';

  @override
  String get guildSettingsVerificationHighestDescription => '認証済み電話番号が必要です。';

  @override
  String get guildSettingsAuditLogDescription =>
      'コミュニティ全体でのモデレーターのアクションを追跡します。';

  @override
  String get guildSettingsAuditLogEmpty => 'ログはまだありません';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'モデレーションアクションとコミュニティの変更はここに表示されます。';

  @override
  String get guildSettingsAuditLogFilterAllUsers => '全ユーザー';

  @override
  String get guildSettingsAuditLogFilterAllActions => '全アクション';

  @override
  String get guildSettingsAuditLogNoReason => '理由が提供されませんでした。';

  @override
  String get guildSettingsAuditLogUnknownUser => '不明なユーザー';

  @override
  String get guildSettingsAuditLogLoadError => 'アクティビティログの読み込み中に問題が発生しました。';

  @override
  String get guildSettingsAuditLogLoadErrorTitle => 'アクティビティログを読み込めませんでした';

  @override
  String get guildSettingsAuditLogReason => '理由';

  @override
  String get guildSettingsAuditLogSomeone => '誰か';

  @override
  String get guildSettingsAuditLogSomething => '何か';

  @override
  String get guildSettingsAuditLogUnknownEntity => '不明なエンティティ';

  @override
  String get guildSettingsAuditLogNothing => 'なし';

  @override
  String get guildSettingsAuditLogUnknownTarget => '不明なターゲット';

  @override
  String get auditLogActionGuildUpdate => 'コミュニティが更新されました';

  @override
  String get auditLogActionChannelCreate => 'チャンネルが作成されました';

  @override
  String get auditLogActionChannelUpdate => 'チャンネルが更新されました';

  @override
  String get auditLogActionChannelDelete => 'チャンネルが削除されました';

  @override
  String get auditLogActionChannelOverwriteCreate => 'チャンネルのオーバーライトが追加されました';

  @override
  String get auditLogActionChannelOverwriteUpdate => 'チャンネルのオーバーライトが更新されました';

  @override
  String get auditLogActionChannelOverwriteDelete => 'チャンネルのオーバーライトが削除されました';

  @override
  String get auditLogActionMemberKick => 'メンバーがキックされました';

  @override
  String get auditLogActionMemberPrune => 'メンバーが削除されました';

  @override
  String get auditLogActionMemberBanAdd => 'メンバーが禁止されました';

  @override
  String get auditLogActionMemberBanRemove => 'メンバーの禁止が解除されました';

  @override
  String get auditLogActionMemberUpdate => 'メンバーが更新されました';

  @override
  String get auditLogActionMemberRoleUpdate => 'メンバーのロールが更新されました';

  @override
  String get auditLogActionMemberMove => 'メンバーが移動しました';

  @override
  String get auditLogActionMemberDisconnect => 'メンバーが切断されました';

  @override
  String get auditLogActionBotAdd => 'ボットが追加されました';

  @override
  String get auditLogActionRoleCreate => 'ロールが作成されました';

  @override
  String get auditLogActionRoleUpdate => 'ロールが更新されました';

  @override
  String get auditLogActionRoleDelete => 'ロールを削除しました';

  @override
  String get auditLogActionInviteCreate => '招待を作成しました';

  @override
  String get auditLogActionInviteUpdate => '招待を更新しました';

  @override
  String get auditLogActionInviteDelete => '招待を削除しました';

  @override
  String get auditLogActionWebhookCreate => 'Webhookを作成しました';

  @override
  String get auditLogActionWebhookUpdate => 'Webhookを更新しました';

  @override
  String get auditLogActionWebhookDelete => 'Webhookを削除しました';

  @override
  String get auditLogActionEmojiCreate => '絵文字を作成しました';

  @override
  String get auditLogActionEmojiUpdate => '絵文字を更新しました';

  @override
  String get auditLogActionEmojiDelete => '絵文字を削除しました';

  @override
  String get auditLogActionStickerCreate => 'ステッカーを作成しました';

  @override
  String get auditLogActionStickerUpdate => 'ステッカーを更新しました';

  @override
  String get auditLogActionStickerDelete => 'ステッカーを削除しました';

  @override
  String get auditLogActionMessageDelete => 'メッセージを削除しました';

  @override
  String get auditLogActionMessageBulkDelete => 'メッセージを一括削除しました';

  @override
  String get auditLogActionMessagePin => 'メッセージをピン留めしました';

  @override
  String get auditLogActionMessageUnpin => 'メッセージのピン留めを解除しました';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actorがコミュニティ設定を更新しました。';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actorがチャンネル$targetを作成しました。';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actorがチャンネル$targetを更新しました。';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actorがチャンネル$targetを削除しました。';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actorが$targetのチャンネル権限を追加しました。';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actorが$channelで$targetのチャンネル権限を追加しました。';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actorが$targetのチャンネル権限を更新しました。';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actorが$channelで$targetのチャンネル権限を更新しました。';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actorが$targetのチャンネル権限を削除しました。';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actorが$channelで$targetのチャンネル権限を削除しました。';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actorが$targetをキックしました。';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actorが$targetをBANしました。';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actorが$targetのBANを解除しました。';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actorが$targetを更新しました。';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actorが$targetのロールを更新しました。';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actorが非アクティブなメンバーを削除しました。';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actorが$days日間非アクティブなメンバーを削除しました。';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actorが$targetを別のボイスチャンネルに移動しました。';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actorが$targetを$channelに移動しました。';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actorが$targetをボイスから切断しました。';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actorがボット$targetを追加しました。';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actorがロール$targetを作成しました。';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actorがロール$targetを更新しました。';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actorがロール$targetを削除しました。';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actorが招待$targetを作成しました。';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actorが$channelの招待$targetを作成しました。';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actorが招待$targetを更新しました。';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actorが$channelの招待$targetを更新しました。';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actorが招待$targetを削除しました。';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actorが$channelの招待$targetを削除しました。';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actorがWebhook$targetを作成しました。';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actorがWebhook$targetを更新しました。';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actorがWebhook$targetを削除しました。';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor が絵文字 $target を追加しました。';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor が絵文字 $target を更新しました。';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor が絵文字 $target を削除しました。';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor がステッカー $target を追加しました。';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor がステッカー $target を更新しました。';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor がステッカー $target を削除しました。';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor がメッセージを削除しました。';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor が $channel でメッセージを削除しました。';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor が複数のメッセージを削除しました。';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor が $count 件のメッセージを削除しました。';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor が $channel で複数のメッセージを削除しました。';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor が $channel で $count 件のメッセージを削除しました。';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor がメッセージをピン留めしました。';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor が $channel でメッセージをピン留めしました。';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor がメッセージのピン留めを解除しました。';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor が $channel でメッセージのピン留めを解除しました。';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor が $target に対して監査アクションを実行しました。';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return '$field を $oldValue から $newValue に更新しました。';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return '$field を $newValue に設定しました。';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return '$field をクリアしました（以前は $oldValue でした）。';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return '$field を更新しました。';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'コミュニティ名を $name に変更しました。';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon => 'コミュニティアイコンを更新しました。';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'チャンネル名を $name に変更しました。';
  }

  @override
  String get auditLogChangeClearedTopic => 'トピックをクリアしました。';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return '$topic にトピックを変更しました。';
  }

  @override
  String get auditLogChangeEnabledMatureContent => '成人向けコンテンツを有効にしました。';

  @override
  String get auditLogChangeDisabledMatureContent => '成人向けコンテンツを無効にしました。';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return '$nickname にニックネームを設定しました。';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return '$nickname のニックネームを削除しました。';
  }

  @override
  String get auditLogChangeMutedMember => 'メンバーをミュートしました。';

  @override
  String get auditLogChangeUnmutedMember => 'メンバーのミュートを解除しました。';

  @override
  String get auditLogChangeDeafenedMember => 'メンバーのボイスをミュートしました。';

  @override
  String get auditLogChangeUndeafenedMember => 'メンバーのボイスミュートを解除しました。';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return '$roles を追加しました。';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return '$roles を削除しました。';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'チャンネル: $value。';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'メッセージ: $value。';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return '$valueさんが招待しました。';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# 件のメッセージを削除しました。',
      one: '# 件のメッセージを削除しました。',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# 人のメンバーを削除しました。',
      one: '# 人のメンバーを削除しました。',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires => 'この招待は期限がありません。';

  @override
  String get auditLogOptionTemporaryMembership => '一時的なメンバーシップを付与します。';

  @override
  String get auditLogOptionPermanentMembership => '永続的なメンバーシップを付与します。';

  @override
  String get guildSettingsLoadMore => 'さらに読み込む';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'チャンネルにメッセージを投稿するWebhookを管理します。';

  @override
  String get guildSettingsWebhooksEmpty => 'Webhookは設定されていません。';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'このコミュニティには、まだウェブフックがありません。作成するには $channelSettingsPath にアクセスしてください。';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'このコミュニティのウェブフックを表示および編集するには、「$permission」権限が必要です。';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle => 'ウェブフックの読み込みに失敗しました';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'ウェブフックの読み込み中にエラーが発生しました。もう一度お試しください。';

  @override
  String get guildSettingsWebhooksUpdated => 'Webhookを更新しました';

  @override
  String get guildSettingsWebhooksUpdateFailed => 'ウェブフックの更新に失敗しました';

  @override
  String get guildSettingsUnknownChannel => '不明なチャンネル';

  @override
  String get guildSettingsCopyUrl => 'URLをコピー';

  @override
  String get guildSettingsCopiedUrl => 'URLをクリップボードにコピーしました';

  @override
  String get guildSettingsDeleteWebhook => 'Webhookを削除';

  @override
  String get guildSettingsVanityUrlDescription => 'サーバーのカスタム招待リンクを設定します。';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => '保存';

  @override
  String get guildSettingsVanityUrlUsageTitle => '使用状況';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count 回使用';
  }

  @override
  String get guildSettingsDiscoveryDescription => 'サーバーディスカバリーに掲載されるように申請します。';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle => 'メンバーが足りません';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return '$count 人以上のメンバーが必要です。';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'ステータス:';

  @override
  String get guildSettingsDiscoveryStatusPending => '保留中';

  @override
  String get guildSettingsDiscoveryStatusApproved => '承認済み';

  @override
  String get guildSettingsDiscoveryStatusRejected => '拒否されました';

  @override
  String get guildSettingsDiscoveryStatusRemoved => '削除済み';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return '理由: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'コミュニティは「見つける」に掲載されています。掲載内容を編集したり、掲載を取り下げることができます。';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      '現在、申請内容を審査中です。引き続き掲載内容を更新したり、申請を取り下げたりすることができます。';

  @override
  String get guildSettingsDiscoveryCategory => 'カテゴリ';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'あなたのコミュニティに最も合うカテゴリを選択してください。カテゴリはいつでも変更できます。';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => '主な使用言語';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'コミュニティで最も話されている言語です。見つけやすくするために、この言語で検索結果を絞り込みます。';

  @override
  String get guildSettingsDiscoveryDescriptionField => '説明';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'コミュニティの内容を説明してください';

  @override
  String get guildSettingsDiscoveryDescriptionRequired => '説明は必須です。';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return '説明は$minLength文字以上である必要があります。';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return '説明は$maxLength文字以内で入力してください。';
  }

  @override
  String get guildSettingsDiscoveryTags => 'タグ';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return '最大$maxTags個のタグで、コミュニティを見つけやすくしましょう。Discovery検索に表示されます。';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'ゲーム、アート、音楽';

  @override
  String get guildSettingsDiscoveryAddTag => '追加';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'タグを削除 $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle => 'タグを追加できませんでした';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'タグは2～$maxLength文字の半角英数字で入力してください。';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return '追加できるタグは$maxTags個までです。';
  }

  @override
  String get guildSettingsDiscoveryApply => '申請を送信';

  @override
  String get guildSettingsDiscoverySave => '保存';

  @override
  String get guildSettingsDiscoveryWithdraw => '取り消す';

  @override
  String get guildSettingsDiscoveryApplicationSent => 'コミュニティ申請を送信しました';

  @override
  String get guildSettingsDiscoveryListingUpdated => 'ディスカバリーリストを更新しました';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn => '発見タブへの掲載申請を取り下げました';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle => '申請を撤回できませんでした';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'しばらくしてからもう一度お試しください。';

  @override
  String get guildSettingsMembersDescription => 'サーバーメンバーを検索して管理します。';

  @override
  String get guildSettingsMembersSearchHint => 'メンバーを検索';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count 人のメンバー';
  }

  @override
  String get guildMembersRecentTitle => '最近のメンバー';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return '$totalCount人のメンバー中$displayedCount人を表示';
  }

  @override
  String get guildMembersSort => '並べ替え';

  @override
  String get guildSettingsMembersSortNewest => '新しい順';

  @override
  String get guildMembersSortOldest => '古い順';

  @override
  String get guildMembersColumnName => '名前';

  @override
  String get guildMembersColumnMemberSince => '参加日';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return '$productNameへの参加日';
  }

  @override
  String get guildMembersColumnJoinMethod => '参加方法';

  @override
  String get guildMembersColumnRoles => 'ロール';

  @override
  String get guildMembersColumnActions => 'アクション';

  @override
  String get guildMembersFilterMemberSince => 'メンバー参加日で絞り込む';

  @override
  String get guildMembersFilterJoinedProduct => 'アカウント作成日で絞り込む';

  @override
  String get guildMembersFilterJoinMethod => '参加方法で絞り込む';

  @override
  String get guildMembersFilterRoles => 'ロールで絞り込む';

  @override
  String get guildMembersFilterAll => 'すべて';

  @override
  String get guildMembersFilterPast1Hour => '過去1時間';

  @override
  String get guildMembersFilterPast24Hours => '過去24時間';

  @override
  String get guildMembersFilterPast7Days => '過去7日間';

  @override
  String get guildMembersFilterPast2Weeks => '過去2週間';

  @override
  String get guildMembersFilterPast3Weeks => '過去3週間';

  @override
  String get guildMembersFilterPast4Weeks => '過去4週間';

  @override
  String get guildMembersFilterPast3Months => '過去3ヶ月';

  @override
  String get guildMembersFilterCustomRange => 'カスタム範囲...';

  @override
  String get guildMembersDateRangeTitle => '期間を指定';

  @override
  String get guildMembersDateAfter => '以降';

  @override
  String get guildMembersDateBefore => '以前の日付';

  @override
  String get guildMembersClearAll => 'すべてクリア';

  @override
  String get guildMembersRowsPerPage => 'ページあたりの行数';

  @override
  String get guildMembersEmptySearch => '検索条件に一致するメンバーはいません。';

  @override
  String get guildMembersLoadError => 'メンバーの読み込み中に問題が発生しました。後でもう一度お試しください。';

  @override
  String get guildMembersIndexing => 'メンバーをインデックス化しています…';

  @override
  String get guildMembersGoToPage => 'ページへ移動';

  @override
  String guildMembersGoToPageItem(int page) {
    return '$pageページへ';
  }

  @override
  String get guildMembersJumpToPage => 'ページに移動';

  @override
  String get guildMembersJoinSourceCreator => 'コミュニティ作成者';

  @override
  String get guildMembersJoinSourceInvite => '招待';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return '招待 ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return '$nameさんが招待しました';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'バニティURL';

  @override
  String get guildMembersJoinSourceBotInvite => 'ボットを招待';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'プラットフォーム管理者';

  @override
  String get guildMembersJoinSourceDiscovery => 'ディスカバリー';

  @override
  String get guildMembersJoinMethodUnknown => '不明';

  @override
  String get guildMembersCommunityOwner => 'コミュニティのオーナー';

  @override
  String get guildMembersViewAllRoles => 'すべてのロールを表示';

  @override
  String get guildMembersJoinedJustNow => 'たった今';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count分前',
      one: '1分前',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count時間前',
      one: '1時間前',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count日前',
      one: '1日前',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'メンバー';

  @override
  String get guildMembersChannelListSelected => 'メンバー、選択済み';

  @override
  String get guildSettingsInvitesTitle => '招待';

  @override
  String get guildSettingsInvitesDescription => 'アクティブな招待リンクを表示および取り消します。';

  @override
  String get guildSettingsInvitesEmpty => 'アクティブな招待はありません。';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'このコミュニティにはまだ招待リンクがありません。チャンネルに移動して、招待を作成し、メンバーを招待しましょう。';

  @override
  String get guildSettingsInvitesLoadFailedTitle => '招待の読み込みに失敗しました';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      '招待の読み込み中にエラーが発生しました。もう一度お試しください。';

  @override
  String get guildSettingsInvitesTryAgain => 'もう一度お試しください';

  @override
  String get guildSettingsInvitesShowCreatedDate => '有効期限ではなく作成日を表示';

  @override
  String get guildSettingsInvitesPauseInvites => '招待を一時停止';

  @override
  String get guildSettingsInvitesEnableInvites => '招待を有効にする';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle => 'このコミュニティへの招待を一時停止';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'このコミュニティへの招待を有効にする';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      '招待を一時停止しますか？再開するまで、新しいユーザーは招待リンクから参加できなくなります。既存のメンバーには影響しません。';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      '招待を有効にしますか？招待リンクからこのコミュニティに参加できるようになります。';

  @override
  String get guildSettingsInvitesPause => '一時停止';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'このコミュニティへの招待は一時停止されています。';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return '$productNameが潜在的なレイドを検知したため、招待は一時停止されています。現在、新しいユーザーは参加できません。';
  }

  @override
  String get guildSettingsInvitesLabelInviter => '招待者:';

  @override
  String get guildSettingsInvitesLabelChannel => 'チャンネル:';

  @override
  String get guildSettingsInvitesLabelCode => 'コード:';

  @override
  String get guildSettingsInvitesLabelUses => '使用:';

  @override
  String get guildSettingsInvitesLabelCreated => '作成日:';

  @override
  String get guildSettingsInvitesLabelExpires => '有効期限:';

  @override
  String get guildSettingsInvitesUnknown => '不明';

  @override
  String get guildSettingsInvitesNoCategory => 'カテゴリーなし';

  @override
  String get guildSettingsInvitesExpired => '期限切れ';

  @override
  String get guildSettingsInvitesNever => 'しない';

  @override
  String get guildSettingsInvitesCopyLink => '招待リンクをコピー';

  @override
  String get guildSettingsInvitesRevoke => '招待を取り消し';

  @override
  String get guildSettingsInvitesRevokeFailedTitle => '招待を取り消せませんでした';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'リンクがまだ有効な可能性があります。しばらくしてからもう一度お試しください。';

  @override
  String guildSettingsInviteUses(int uses, int maxUses) {
    return '$uses / $maxUses 回使用';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return '$date に期限切れ';
  }

  @override
  String get guildSettingsBansDescription => '禁止されているユーザーを表示および管理します。';

  @override
  String get guildSettingsBansSearchHint => '禁止ユーザーを検索';

  @override
  String get guildSettingsBansEmpty => '禁止されているユーザーはいません。';

  @override
  String get guildSettingsBanPermanent => '無期限禁止';

  @override
  String guildSettingsBanExpires(String date) {
    return '$date に期限切れ';
  }

  @override
  String get guildSettingsBanExpiresLabel => '期限切れ';

  @override
  String get guildSettingsUnban => '禁止解除';

  @override
  String get guildSettingsBansLoading => '禁止ユーザーを読み込み中';

  @override
  String get guildSettingsBansNoSearchResults => '検索条件に一致する禁止ユーザーは見つかりませんでした。';

  @override
  String get guildSettingsBanDetailsTitle => '禁止の詳細';

  @override
  String get guildSettingsBanViewDetails => '詳細を表示';

  @override
  String get guildSettingsBannedOn => '禁止された日時';

  @override
  String get guildSettingsBannedBy => '禁止したユーザー';

  @override
  String get guildSettingsRevokeBanTitle => '禁止を解除';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return '$displayName の禁止を解除しますか？ コミュニティに再参加できるようになります。';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return '$displayName の禁止を解除しました';
  }

  @override
  String get guildSettingsBansLoadError => '禁止ユーザーを読み込めませんでした。 再試行してください。';

  @override
  String get guildSettingsRevokeBanError => '禁止を解除できませんでした。 再試行してください。';

  @override
  String get guildSettingsCommunitySettings => 'コミュニティ設定';

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
      'コミュニティのプロフィール、チャンネル、デフォルト設定を管理します。';

  @override
  String get guildSettingsOverviewBrandingTitle => 'ブランディング';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'アイコン、名前、バナー、招待背景を更新します';

  @override
  String get guildSettingsOverviewBannerUpload => 'バナーをアップロード';

  @override
  String get guildSettingsOverviewIdleTitle => 'アイドル設定';

  @override
  String get guildSettingsOverviewIdleDescription => 'AFKチャンネルとタイムアウトを設定します';

  @override
  String get guildSettingsOverviewSystemTitle => 'システムとウェルカムメッセージ';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'システムメッセージとウェルカムメッセージの送信先を選択します';

  @override
  String get guildSettingsOverviewNotificationsTitle => 'デフォルトの通知';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      '250人を超えるコミュニティでは、「メンションのみ」設定が強制されます。 元の設定は保持され、コミュニティのメンバー数が250人未満になった場合に復元されます。';

  @override
  String get guildSettingsOverviewAdvancedTitle => '高度な設定';

  @override
  String get guildSettingsOverviewFlexibleNames => 'テキストチャンネル名の自由な設定を許可';

  @override
  String get guildSettingsOverviewHideOwnerCrown => 'コミュニティオーナーの王冠を非表示';

  @override
  String get guildSettingsOverviewDetachedBanner => '分離型バナー';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'コミュニティヘッダーの下のセクションにバナーを表示します。';

  @override
  String get guildSettingsOverviewUploadIcon => 'アイコンをアップロード';

  @override
  String get guildSettingsOverviewRemoveImage => '削除';

  @override
  String get guildSettingsOverviewSplashTitle => '招待背景';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'チャット埋め込み背景';

  @override
  String get guildSettingsOverviewEmbedSplashHint => 'チャットの招待埋め込みに表示されます。';

  @override
  String get guildSettingsOverviewUploadBackground => '背景をアップロード';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'コミュニティバナーなし';

  @override
  String get guildSettingsOverviewNoInviteBackground => '招待背景なし';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'プレビュー';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      '訪問者に招待がどのように表示されるかを確認します。';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle => 'テキストチャンネル名';

  @override
  String get guildSettingsOverviewOwnerCrownTitle => 'コミュニティオーナーの王冠';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'コミュニティオーナーの横に王冠アイコンが表示されるかどうかを設定します';

  @override
  String get guildSettingsSplashCardAlignment => 'カードの配置';

  @override
  String get guildSettingsSplashAlignmentCenter => '中央揃え';

  @override
  String get guildSettingsSplashAlignmentLeft => '左揃え';

  @override
  String get guildSettingsSplashAlignmentRight => '右揃え';

  @override
  String get guildSettingsSplashAlignmentHint => 'ワイドスクリーンでのみ適用されます。';

  @override
  String get permissionReadMessageHistory => 'メッセージ履歴を読む';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return '「$permission」権限を持たないユーザーが見れるものを変更';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return '「$permission」権限を持たないメンバーのために、メッセージ履歴のしきい値の日付を設定するには、専用のモーダルを使用します。';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen => 'メッセージ履歴のしきい値を開く';

  @override
  String get guildSettingsMessageHistoryThresholdTitle => 'メッセージ履歴のしきい値';

  @override
  String get guildSettingsMessageHistoryThresholdEnable => 'メッセージ履歴のしきい値を有効にする';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'しきい値の日付';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'メッセージ履歴を読む権限を持たないメンバーは、この日付以降に送信されたメッセージを表示できます。';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'メッセージ履歴のしきい値が更新されました';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'テキストチャンネル名に大文字とスペースを許可します。オフの場合、名前は小文字のハイフンとアンダースコアに制限されます。';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'すべての画面でコミュニティオーナーの横にある王冠アイコンを非表示にします。';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'アニメーションアイコンには、アニメーションアイコンのコミュニティ機能が必要です。';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'アニメーションバナーには、アニメーションバナーのコミュニティ機能が必要です。';

  @override
  String get guildSettingsAfkChannel => 'AFK / アイドルチャンネル';

  @override
  String get guildSettingsAfkChannelHint => 'AFK中のメンバーをこのチャンネルに移動します。';

  @override
  String get guildSettingsNoAfkChannel => 'AFKチャンネルなし';

  @override
  String get guildSettingsAfkTimeout => 'AFKタイムアウト';

  @override
  String get guildSettingsAfkTimeout1Min => '1分';

  @override
  String get guildSettingsAfkTimeout5Min => '5分';

  @override
  String get guildSettingsAfkTimeout15Min => '15分';

  @override
  String get guildSettingsAfkTimeout30Min => '30分';

  @override
  String get guildSettingsAfkTimeout1Hour => '1時間';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds秒';
  }

  @override
  String get guildSettingsSystemChannel => 'システムメッセージチャンネル';

  @override
  String get guildSettingsSystemChannelHint => 'ようこそメッセージとシステムメッセージがここに表示されます。';

  @override
  String get guildSettingsNoSystemChannel => 'システムチャンネルなし';

  @override
  String get guildSettingsHideJoinMessages => '参加メッセージを非表示';

  @override
  String get guildSettingsHideJoinMessagesHint => '参加メッセージを対象チャンネルで非表示にします。';

  @override
  String get guildSettingsDefaultNotifications => '通知設定';

  @override
  String get guildSettingsNotificationsAll => 'すべて';

  @override
  String get guildSettingsNotificationsAllDescription => 'すべてのメッセージで通知する';

  @override
  String get guildSettingsNotificationsMentions => 'メンションのみ';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'メンションがあった場合のみ通知する';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG、PNG、WebP、AVIF。最大10MB。最小: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG、PNG、WebP、AVIF。最大10MB。最小: 960×540px (16:9)。チャットの招待リンクに表示されます。';

  @override
  String get guildSettingsModerationDescription =>
      '認証、コンテンツフィルタリング、不適切コンテンツの設定を行います。';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Discoveryに掲載されているコミュニティは、モデレーションオプションが制限されています。';

  @override
  String get guildSettingsModerationContentFilterTitle => 'コンテンツフィルタリング';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      '不適切コンテンツとしてマークされていないチャンネルのメッセージを自動的にスクリーニングします。';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Discoveryに掲載されているコミュニティは、すべてのメンバーをスキャンする必要があります。Discoveryが有効な間はこの設定を変更できません。';

  @override
  String get guildSettingsContentFilterOff => 'オフ';

  @override
  String get guildSettingsContentFilterOffDescription => 'コミュニティが自主的にモデレートする';

  @override
  String get guildSettingsContentFilterNoRole => 'ロールのないメンバーをフィルタリング';

  @override
  String get guildSettingsContentFilterNoRoleDescription => 'ほとんどのコミュニティに推奨';

  @override
  String get guildSettingsContentFilterAll => '全員をフィルタリング';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'ファミリーフレンドリーなスペースに最大限の保護';

  @override
  String get guildSettingsModerationMatureOff => 'オフ';

  @override
  String get guildSettingsModerationMatureOn => 'オン';

  @override
  String get guildSettingsContentWarningToggle => 'コンテンツ警告を表示';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'どのチャンネルに入る前にも同意プロンプトを表示します。';

  @override
  String get guildSettingsContentWarningText => 'カスタム警告テキスト';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'このコンテンツにはセンシティブな情報が含まれています。';

  @override
  String get guildSettingsModeration2faTitle => '2段階認証の要件';

  @override
  String get guildSettingsModeration2faDescription =>
      'モデレーターが禁止、キック、タイムアウト、またはメッセージを削除する前に、2段階認証を要求します。';

  @override
  String get guildSettingsModeration2faSwitchLabel => 'モデレーションアクションに2段階認証を要求';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'コミュニティオーナーのみがこの設定を変更できます';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'この設定を変更するには、アカウントで2段階認証を有効にしてください';

  @override
  String get guildSettingsEmojiSearchHint => '絵文字を検索';

  @override
  String get guildSettingsEmojiUploadTitle => '絵文字をアップロード';

  @override
  String get guildSettingsEmojiSlotsTitle => '絵文字スロット';

  @override
  String get guildSettingsEmojiDropZone => '絵文字ファイルをここにドラッグ＆ドロップ';

  @override
  String get guildSettingsEmojiLoadFailed => '絵文字の読み込みに失敗しました。後でもう一度お試しください。';

  @override
  String get guildSettingsEmojiSearchEmpty => '検索条件に一致する絵文字は見つかりませんでした。';

  @override
  String get guildSettingsEmojiNoSlots => '利用可能な絵文字スロットがありません';

  @override
  String get guildSettingsEmojiSlotsFull =>
      '絵文字の最大数に達しました。既存の絵文字を削除して空き容量を確保してください。';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return '絵文字の名前は、少なくとも 2 文字必要で、文字、数字、アンダースコアを使用できます。絵文字のサイズは $maxSize 未満である必要があります。静止画像は自動的に 128x128 ピクセルにリサイズおよび圧縮されます。アニメーション化された絵文字と SVG は、すでに制限内に収まるようにする必要があります。';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => '絵文字をアップロード中';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# 絵文字',
      one: '# 絵文字',
    );
    return '$_temp0をアップロードしています。少々お待ちください。';
  }

  @override
  String get guildSettingsEmojiUploadFailed => '絵文字のアップロードに失敗しました。もう一度お試しください。';

  @override
  String get guildSettingsEmojiSomeFailedTitle => '一部の絵文字を追加できませんでした';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'これらのファイルを確認し、より小さいかシンプルな画像で再試行してください。';

  @override
  String get guildSettingsEmojiRenameTitle => '絵文字の名前を変更';

  @override
  String get guildSettingsEmojiRenameHint => '2～32文字（半角英数字、アンダースコア）.';

  @override
  String get guildSettingsEmojiColumnEmoji => '絵文字';

  @override
  String get guildSettingsEmojiColumnName => '名前';

  @override
  String get guildSettingsEmojiColumnUploader => 'アップロード元';

  @override
  String get guildSettingsEmojiUnknownUploader => '不明';

  @override
  String get guildSettingsEmojiDeleteTitle => '絵文字を削除';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return '「$name」を削除しますか？元に戻すことはできません。';
  }

  @override
  String get guildSettingsEmojiPurgeLabel => 'この絵文字をストレージとCDNから完全に削除';

  @override
  String get guildSettingsEmojiNameTooShort => '絵文字の名前は2文字以上で入力してください';

  @override
  String get guildSettingsEmojiNameTooLong => '絵文字の名前は32文字以内にする必要があります';

  @override
  String get guildSettingsEmojiInvalidNameTitle => '無効な絵文字名';

  @override
  String get guildSettingsEmojiRenameFailedTitle => 'この絵文字の名前を変更できませんでした';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      '名前は以前のものに戻されました。しばらくしてからもう一度お試しください。';

  @override
  String get guildSettingsEmojiGoneTitle => 'この絵文字はすでに削除されています';

  @override
  String get guildSettingsEmojiGoneBody => '削除された可能性があります。名前は以前のものに戻されました。';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle => 'この絵文字の名前は変更できません';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'この絵文字の名前を変更する権限がありません。名前は以前のものに戻されました。';

  @override
  String get guildSettingsEmojiRateLimitedTitle => '処理が速すぎます';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'しばらく待ってから、もう一度名前の変更をお試しください。';

  @override
  String get guildSettingsEmojiDeleteFailedTitle => 'この絵文字を削除できませんでした';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle => 'この絵文字は削除できません';

  @override
  String get guildSettingsCloneEmojiTitle => '他のユーザーによる絵文字のクローン作成を許可する';

  @override
  String get guildSettingsCloneEmojiDescription =>
      '有効にすると、他のコミュニティのメンバーがアプリ内のワンクリック「クローン」ショートカットを使って、あなたのカスタム絵文字を利用できるようになります。これは、メンバーが画像を保存して自分でアップロードするのを防ぐものではありません。';

  @override
  String get guildSettingsCloneStickerTitle => '他のユーザーによるスタンプのクローン作成を許可する';

  @override
  String get guildSettingsCloneStickerDescription =>
      '有効にすると、他のコミュニティのメンバーがアプリ内のワンクリック「クローン」ショートカットを使って、あなたのカスタムスタンプを利用できるようになります。ただし、これによりメンバーが画像を保存して自分でアップロードすることを防ぐことはできません。';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return '「$permission」権限を持つメンバーのみがこれを変更できます。';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed => '絵文字のクローン作成設定を更新できませんでした';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'スタンプのクローン作成設定を更新できませんでした';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return '静止絵文字 ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'アニメーション絵文字 ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'ステッカーを検索';

  @override
  String get guildSettingsStickerSlotsTitle => 'スタンプスロット';

  @override
  String get guildSettingsStickerUploadTitle => 'スタンプをアップロード';

  @override
  String get guildSettingsStickerDropZone =>
      'ここにスタンプファイルをドラッグ＆ドロップしてください（一度に1つ）';

  @override
  String get guildSettingsStickerDensity => 'スタンプ密度';

  @override
  String get guildSettingsStickerDensityCozy => '居心地の良い';

  @override
  String get guildSettingsStickerDensityCompact => 'コンパクト';

  @override
  String get guildSettingsStickersLoadFailedTitle => 'スタンプの読み込みに失敗しました';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'スタンプの読み込み中にエラーが発生しました。もう一度お試しください。';

  @override
  String get guildSettingsStickersSearchEmpty => '検索条件に一致するスタンプは見つかりませんでした。';

  @override
  String get guildSettingsStickersEmptySearch => 'スタンプが見つかりませんでした';

  @override
  String get guildSettingsStickerNoSlots => '利用可能なスタンプスロットがありません';

  @override
  String get guildSettingsStickerSlotsFull =>
      'ステッカーの最大数に達しました。既存のステッカーを削除して空き容量を確保してください。';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'ステッカーは 320x320 ピクセルで保存され、$maxSize 未満である必要があります。静止画像は自動的にリサイズおよび圧縮されます。アニメーション化されたステッカーと SVG は、すでに制限内に収まるようにする必要があります。';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle => 'サポートされていないスタンプファイル';

  @override
  String get guildSettingsStickerAddTitle => 'スタンプを追加';

  @override
  String get guildSettingsStickerEditTitle => 'スタンプを編集';

  @override
  String get guildSettingsStickerNameLabel => '名前';

  @override
  String get guildSettingsStickerNameHint => 'マイスタンプ';

  @override
  String get guildSettingsStickerDescriptionLabel => '説明';

  @override
  String get guildSettingsStickerDescriptionHint => 'スタンプの説明';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'タグ ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'タグを追加';

  @override
  String get guildSettingsStickerTagAdd => '追加';

  @override
  String get guildSettingsStickerNameRequired => '名前は必須です';

  @override
  String get guildSettingsStickerNameTooShort => '名前は2文字以上で入力してください';

  @override
  String get guildSettingsStickerNameTooLong => '名前は30文字以内で入力してください';

  @override
  String get guildSettingsStickerDescriptionTooLong => '説明は500文字以内で入力してください';

  @override
  String get guildSettingsStickerCreateFailedTitle => 'スタンプを作成できませんでした';

  @override
  String get guildSettingsStickerTooLargeTitle => 'ステッカーが大きすぎます';

  @override
  String get guildSettingsStickerCompressFailedTitle => 'スタンプを十分に圧縮できませんでした';

  @override
  String get guildSettingsStickerDeleteTitle => 'ステッカーを削除';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return '「$name」を削除しますか？元に戻すことはできません。';
  }

  @override
  String get guildSettingsStickerPurgeLabel => 'このスタンプをストレージとCDNから消去';

  @override
  String get guildSettingsStickerDeleteFailedTitle => 'このスタンプを削除できませんでした';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle => 'このスタンプは削除できません';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'チャンネル設定からWebhookを作成します。ここで編集します。';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      '少なくとも1つのチャンネルが全員に表示されていないと、カスタムURLは機能しません。';

  @override
  String get guildSettingsVanityUrlRemove => '削除';

  @override
  String get guildSettingsBannedUsersTitle => '禁止ユーザー';

  @override
  String get guildSettingsInvitesTableInviter => '招待者';

  @override
  String get guildSettingsInvitesTableChannel => 'チャンネル';

  @override
  String get guildSettingsInvitesTableCode => 'コード';

  @override
  String get guildSettingsInvitesTableUses => '使用回数';

  @override
  String get guildSettingsInvitesTableCreated => '作成日';

  @override
  String get guildSettingsInvitesTableExpires => '有効期限';

  @override
  String get guildSettingsAuditLogFilterUser => 'ユーザーでフィルタリング';

  @override
  String get guildSettingsAuditLogFilterAction => 'アクションでフィルタリング';

  @override
  String get createDm => 'DMを作成';

  @override
  String get createGroupDm => 'グループDMを作成';

  @override
  String get createDmNewMessage => '新着メッセージ';

  @override
  String get createDmSelectFriends => '友達を選択';

  @override
  String get createDmChooseFriendsSubtitle => 'メッセージを送る友達を選択.';

  @override
  String get createDmSearchFriends => '友だちを検索';

  @override
  String get createDmNoFriendsFound => '友だちが見つかりませんでした';

  @override
  String get createDmNoFriendsYet => 'まだ友達がいません';

  @override
  String get createDmClaimToStartDms => 'DMを開始するにはアカウントを登録してください。';

  @override
  String get createDmVerifyToStartDms => 'DMを開始するにはメールアドレスを確認してください。';

  @override
  String get createDmVerifyYourEmail => 'メールアドレスを確認';

  @override
  String get createDmNewGroup => '新しいグループ';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return '$userNameとの新しいグループを作成';
  }

  @override
  String get createDmConfirmNewGroup => '新しいグループの確認';

  @override
  String get createDmCreateNewGroup => '新しいグループを作成';

  @override
  String createDmRemoveFriend(String displayName) {
    return '$displayNameを削除';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'これらのユーザーを含むグループがすでに存在します。新しいグループを作成してもよろしいですか？もちろん、それでも問題ありません！';

  @override
  String get createDmNoActivityYet => 'まだアクティビティがありません';

  @override
  String get createDmSomeUsersCantBeAdded => '追加できないユーザーがいます';

  @override
  String get createDmCreateWithoutThem => 'このまま作成';

  @override
  String get createDmUnaddableIntro => '以下のメンバーはグループDMに追加できません:';

  @override
  String createDmUnaddableProceed(int count) {
    return '残りの$count人の受信者でグループDMを作成し、他はスキップしますか？';
  }

  @override
  String get createDmUnaddableNoneRemaining => 'グループDMを作成できる相手がいません。';

  @override
  String get createDmUnaddableUserNotFound => 'ユーザーが見つかりません';

  @override
  String get createDmUnaddableBlocked => 'このユーザーにはメッセージを送信できません';

  @override
  String get createDmUnaddableNotFriends => '友だちリストにいません';

  @override
  String get createDmUnaddableGroupDisabled => 'グループDMに追加できません';

  @override
  String get createDmFailed => '会話を作成できませんでした。もう一度お試しください。';

  @override
  String get dmListMessagesTitle => 'メッセージ';

  @override
  String get dmListDirectMessagesTitle => 'ダイレクトメッセージ';

  @override
  String get keybindsSearchShortcuts => 'ショートカットを検索';

  @override
  String get keybindSectionDefaults => 'デフォルト';

  @override
  String get keybindSectionMessages => 'メッセージ';

  @override
  String get keybindSectionNavigation => 'ナビゲーション';

  @override
  String get keybindSectionDragAndDrop => 'ドラッグ＆ドロップ';

  @override
  String get keybindSectionChat => 'チャット';

  @override
  String get keybindSectionVoiceAndVideo => '音声とビデオ';

  @override
  String get keybindSectionMisc => 'その他';

  @override
  String get keybindActionShowShortcutsList => 'キーボードショートカット一覧を表示';

  @override
  String get keybindActionCopyText => 'テキストをコピー';

  @override
  String get keybindActionMarkUnread => '未読にする';

  @override
  String get keybindActionFocusTextarea => 'テキスト入力欄にフォーカス';

  @override
  String get keybindActionSwitchCommunities => 'コミュニティを切り替える';

  @override
  String get keybindActionSwitchChannels => 'チャンネルを切り替える';

  @override
  String get keybindActionHistoryBack => 'チャンネル履歴を前に戻る';

  @override
  String get keybindActionHistoryForward => '閲覧したチャンネル履歴を前に進む';

  @override
  String get keybindActionJumpUnreadChannels => '未読チャンネル間を移動';

  @override
  String get keybindActionJumpMentionChannels => '未読のメンションがあるチャンネルに移動';

  @override
  String get keybindActionJumpCurrentCall => '通話に移動';

  @override
  String get keybindActionToggleLastGuildDms => '前回のコミュニティとDMを切り替える';

  @override
  String get keybindActionPreviousCommunityOrDms => '前のコミュニティまたはDMに切り替える';

  @override
  String get keybindActionNextCommunityOrDms => '次のコミュニティまたはDMに切り替え';

  @override
  String get keybindActionGoToDms => 'ダイレクトメッセージに移動';

  @override
  String get keybindActionGoToFirstCommunity => '最初のコミュニティへ';

  @override
  String get keybindActionGoToSecondCommunity => '2番目のコミュニティへ';

  @override
  String get keybindActionGoToThirdCommunity => '3番目のコミュニティへ';

  @override
  String get keybindActionGoToFourthCommunity => '4番目のコミュニティへ';

  @override
  String get keybindActionGoToFifthCommunity => '5番目のコミュニティへ移動';

  @override
  String get keybindActionGoToSixthCommunity => '6番目のコミュニティへ移動';

  @override
  String get keybindActionGoToSeventhCommunity => '7番目のコミュニティへ移動';

  @override
  String get keybindActionGoToEighthCommunity => '8番目のコミュニティへ移動';

  @override
  String get keybindActionToggleQuickSwitcher => 'クイックスイッチャーを切り替え';

  @override
  String get keybindActionCreateOrJoinCommunity => 'コミュニティを作成または参加';

  @override
  String get keybindActionStartDragAndDrop => 'ドラッグ＆ドロップを開始';

  @override
  String get keybindActionMove => '移動';

  @override
  String get keybindActionDropItem => 'アイテムをドロップ';

  @override
  String get keybindActionCancel => 'キャンセル';

  @override
  String get keybindActionMarkCommunityRead => 'コミュニティを既読にする';

  @override
  String get keybindActionMarkChannelRead => 'チャンネルを既読にする';

  @override
  String get keybindActionStartGroupDm => 'グループDMを開始';

  @override
  String get keybindActionTogglePinnedMessages => 'ピン留めメッセージを切り替え';

  @override
  String get keybindActionToggleInbox => '受信箱の表示を切り替える';

  @override
  String get keybindActionMarkTopInboxRead => '受信トレイの一番上のチャンネルを既読にする';

  @override
  String get keybindActionMarkAllInboxRead => '受信トレイのすべてのチャンネルを既読にする';

  @override
  String get keybindActionToggleMemberList => 'メンバーリストまたはボイスチャットを切り替える';

  @override
  String get keybindActionToggleEmojiPicker => '絵文字ピッカーを切り替える';

  @override
  String get keybindActionToggleGifPicker => 'GIFピッカーを切り替え';

  @override
  String get keybindActionToggleStickerPicker => 'スタンプピッカーを切り替え';

  @override
  String get keybindActionScrollChatUp => 'チャットを上にスクロール';

  @override
  String get keybindActionScrollChatDown => 'チャットを下にスクロール';

  @override
  String get keybindActionJumpOldestUnread => '未読の最古のメッセージに移動';

  @override
  String get keybindActionFocusComposer => 'テキスト入力欄にフォーカスする';

  @override
  String get keybindActionUploadFile => 'ファイルをアップロード';

  @override
  String get keybindActionCopyChannelLink => 'チャンネルリンクをコピー';

  @override
  String get keybindActionToggleSavedMedia => '保存したメディアを切り替え';

  @override
  String get keybindActionSendVoiceMessage => 'ボイスメッセージを送信';

  @override
  String get keybindActionAnswerCall => '着信に応答';

  @override
  String get keybindActionDeclineCall => '着信を拒否';

  @override
  String get keybindActionStartDmCall => 'DMやグループで通話を開始';

  @override
  String get keybindActionToggleSoundboard => 'サウンドボードを切り替える';

  @override
  String get keybindActionToggleCompactCallView => 'コンパクトな通話表示を展開または折りたたむ';

  @override
  String get keybindActionPushToTalkPriority => 'プッシュトゥトーク（優先）';

  @override
  String get keybindActionVoiceActivityPriority => '音声認識の優先度';

  @override
  String get keybindActionOpenHelp => 'ヘルプを開く';

  @override
  String get keybindActionSearchMessages => 'メッセージを検索';

  @override
  String get keybindActionOpenContextMenu => 'コンテキストメニューを開く';

  @override
  String get keybindActionOpenSettings => '設定を開く';

  @override
  String get keybindActionOpenThemeStudio => 'テーマスタジオのポップアウトを開く';

  @override
  String get keybindActionZoomIn => '拡大';

  @override
  String get keybindActionZoomOut => '縮小';

  @override
  String get keybindActionZoomReset => 'ズームをリセット';

  @override
  String get clipboardPasteFailed =>
      '貼り付けられませんでした。クリップボードが空か、このアプリでの貼り付けがブロックされています。';

  @override
  String get homeQuickActionDms => 'ダイレクトメッセージ';
}
