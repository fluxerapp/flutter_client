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
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

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
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
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
  String get addFriendSendFailedGeneric => '友達リクエストを送信できませんでした。もう一度お試しください。';

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
  String get externalLinkWarningLeaving => 'Fluxerを離れようとしています';

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
  String get changeYourFluxerTag => 'FluxerTagを変更する';

  @override
  String get fluxerTagInputLabel => 'FluxerTag';

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
  String get fluxerTagAlreadyTaken => 'FluxerTagは既に使用されています';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'FluxerTag $username#$discriminatorは既に使用されています。続行すると、ディスクリミネータは自動的に再ロールされます。';
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
      'このFluxerTagを保存すると、Plutoniumサブスクリプションが終了したときにカスタムの4桁タグはランダムな番号に戻ります。サブスクリプションの更新に失敗した場合、タグが変更される前に3日間の猶予期間があります。';

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
  String get fluxerTagUpdated => 'FluxerTagが更新されました';

  @override
  String get fluxerTagUpdateFailed => 'FluxerTagの更新に失敗しました。もう一度お試しください。';

  @override
  String get continueAction => '続行';

  @override
  String get profileCustomizationTitle => 'プロフィールカスタマイズ';

  @override
  String get profileCustomizationDescription => 'プロフィール外観を編集し、ライブプレビューを表示します';

  @override
  String get usernameLabel => 'ユーザー名';

  @override
  String get claimAccountToChangeFluxerTag => 'アカウントを請求してFluxerTagを変更してください';

  @override
  String get changeFluxerTag => 'FluxerTagを変更';

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
  String get profilePreviewMemberSince => 'Fluxerメンバーシップ開始日';

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
  String get securityLoginEmailSectionDescription =>
      'Fluxerへのサインインに使用するメールアドレスを管理する';

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
  String get relativeTimeJustNow => 'たった今';

  @override
  String get authorizedAppsTitle => '承認済みアプリ';

  @override
  String get authorizedAppsDescription =>
      'これらのアプリはあなたのFluxerアカウントへのアクセスを許可されています。';

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
  String get userProfileStaffBadgeTooltip => 'Fluxerスタッフ';

  @override
  String get userProfileCtpBadgeTooltip => 'Fluxerコミュニティチーム';

  @override
  String get userProfilePartnerBadgeTooltip => 'Fluxerパートナー';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Fluxer Bug Hunter';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer Plutonium';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return '$dateよりFluxer Plutonium subscriber';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Fluxer Visionary';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return '$dateよりFluxer Visionary';
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
  String get userProfileLocalTime => '現地時間';

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
  String get chatAttachmentFileTooLarge => '1つ以上のファイルがサイズ制限を超えています';

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
  String get chatAttachmentExpiredTooltip => '添付ファイルの有効期限が切れました';

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
  String get connectionsDescription =>
      '外部アカウントとドメインをFluxerプロフィールにリンクします。確認済みの接続はプロフィールに表示され、他のユーザーも確認できるようになります。';

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
  String get lookAndFeelCollapseDMsLabel => 'DMをフォルダにまとめる';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      '有効にすると、サーバーサイドバーの未読DMがFluxerボタンのフォルダにまとめられます。フォルダを展開または折りたたむには、DMページでFluxerボタンをクリックしてください。';

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
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'Fluxerに直接アップロードされた場合';

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
  String get accessibilitySaturationTitle => 'Saturation';

  @override
  String get accessibilitySaturationDescription =>
      'Adjust how vivid theme colors appear across the app.';

  @override
  String get accessibilityUnreadGroupTitle => '未読インジケーター';

  @override
  String get accessibilityUnreadGroupDescription =>
      '未読メッセージインジケーターの表示方法を制御します。';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'ミュート中のチャンネルに薄い未読インジケーターを表示';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'ミュート中のダイレクトメッセージやチャンネルの横に薄い未読インジケーターを表示し、アクティビティがあった場合に一目でわかるようにします。';

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
  String get voiceChannelEmptyDescription => 'これはボイスチャンネルです。話すには接続してください！';

  @override
  String get voiceChannelJoin => 'ボイスチャンネルに参加';

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
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => '画面共有';

  @override
  String get voiceScreenShareNotificationText => '画面を共有しています。';

  @override
  String get voiceControlMore => 'その他';

  @override
  String get voiceControlDisconnect => '切断';

  @override
  String get voiceParticipantMenuViewProfile => 'View profile';

  @override
  String get voiceParticipantMenuFocus => 'Focus this person';

  @override
  String get voiceParticipantMenuUnfocus => 'Unfocus';

  @override
  String get voiceParticipantMenuCommunityMute => 'Mute';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Deafen';

  @override
  String get voiceParticipantMenuUserVolume => 'User volume';

  @override
  String get voiceParticipantMenuStreamVolume => 'Stream volume';

  @override
  String get voiceParticipantModerationFailed =>
      'Couldn\'t update that member. Please try again.';

  @override
  String get voiceControlChat => 'チャット';

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
  String get iarReasonOtherDescription =>
      'Fluxerのルールに明確に違反し、上記に当てはまらない場合のみ使用してください。';

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
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

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
  String get personalNotesTitle => '個人メモ';

  @override
  String get personalNotesSubtitle => '考えやリマインダーのためのプライベートスペース';

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
    return '$channelNameへようこそ';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return '始まりには何もなく、その後$channelNameが現れました。そしてそれは素晴らしかった。';
  }

  @override
  String get personalNotesComposerHint => '自分にメッセージを送る';

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
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'プロフィール';

  @override
  String get userSettingsNavSecurityLogin => 'セキュリティとログイン';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'ギフトとコード';

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
  String get userSettingsNavLanguageAndTime => '言語と時刻';

  @override
  String get languageAndTimeLanguageSectionTitle => '表示言語';

  @override
  String get languageAndTimeLanguageSectionDescription => 'アプリの表示に使用する言語を選択します';

  @override
  String get languageAndTimeOpenLanguageSettings => '言語設定を開く';

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
  String get languageAndTimeTimeFormat12Hour => '12時間制';

  @override
  String get languageAndTimeTimeFormat24Hour => '24時間制';

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
  String get userSettingsNavAdvanced => '詳細設定';

  @override
  String get advancedPerformanceReportingTitle => 'パフォーマンスレポート';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      '匿名化されたクラッシュおよびパフォーマンスデータを共有することで、Fluxerの改善にご協力ください。';

  @override
  String get advancedPerformanceReportingLabel => 'クラッシュおよびパフォーマンスレポートを送信する';

  @override
  String get advancedPerformanceReportingDescription =>
      '報告されるすべてのデータは匿名であり、Fluxer独自の監視サービスにのみ送信されます。サードパーティプロバイダーは使用しません。';

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
  String get userSettingsNavLogOut => 'ログアウト';

  @override
  String get betaWarningTitle => 'ベータ版ソフトウェア';

  @override
  String get betaWarningMessage =>
      'これはベータ版ソフトウェアです。まだ完了していない、または追加されていない機能があります。';

  @override
  String get betaWarningReportIssues =>
      '見つかった問題は、Fluxer Mobileコミュニティに報告してください（現在、コミュニティに参加するにはPlutoniumが必要です）。';

  @override
  String get betaWarningRepoLink => 'GitHubでソースを表示';

  @override
  String get betaWarningGotIt => '了解しました';

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
  String get savedMessagesEmptyTitle => 'No bookmarks';

  @override
  String get savedMessagesEmptyBody =>
      'Bookmark messages to save them for later.';

  @override
  String get savedMessagesEndBody => 'There\'s nothing more to see here.';

  @override
  String get savedMessagesRemoveTooltip => 'Remove bookmark';

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
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

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
  String get guildNavbarStaffOnlyAccessible => 'Fluxerスタッフのみアクセス可能';

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
  String get guildMenuSettingsChannels => 'Channels';

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
  String guildSettingsDiscoveryNotEligible(int count) {
    return '$count 人以上のメンバーが必要です。';
  }

  @override
  String get guildSettingsDiscoveryFormTitle => '申請';

  @override
  String get guildSettingsDiscoveryStatusTitle => 'ステータス';

  @override
  String get guildSettingsDiscoveryCategory => 'カテゴリ';

  @override
  String get guildSettingsDiscoveryDescriptionField => '説明';

  @override
  String get guildSettingsDiscoveryTags => 'タグ';

  @override
  String get guildSettingsDiscoveryTagsHint => 'ゲーム、アート、音楽';

  @override
  String get guildSettingsDiscoveryApply => '申請を送信';

  @override
  String get guildSettingsDiscoveryWithdraw => '取り消す';

  @override
  String get guildSettingsMembersDescription => 'サーバーメンバーを検索して管理します。';

  @override
  String get guildSettingsMembersSearchHint => 'メンバーを検索';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count 人のメンバー';
  }

  @override
  String get guildSettingsInvitesTitle => 'Invites';

  @override
  String get guildSettingsInvitesDescription => 'アクティブな招待リンクを表示および取り消します。';

  @override
  String get guildSettingsInvitesEmpty => 'アクティブな招待はありません。';

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
  String get guildSettingsWebhooksInfo => 'チャンネル設定からWebhookを作成します。ここで編集します。';

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
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsMembersSortNewest => '新しい順';

  @override
  String get guildSettingsAuditLogFilterUser => 'ユーザーでフィルタリング';

  @override
  String get guildSettingsAuditLogFilterAction => 'アクションでフィルタリング';

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
