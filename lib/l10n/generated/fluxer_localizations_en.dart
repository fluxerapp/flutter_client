// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class FluxerLocalizationsEn extends FluxerLocalizations {
  FluxerLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get reconnectingTitle => 'We fluxed up!';

  @override
  String get reconnectingBody =>
      'Something is wrong with the servers.\nShould be fixed in a second!';

  @override
  String get gatewayReconnectingToast => 'Reconnecting…';

  @override
  String get gatewayConnectedToast => 'Connected';

  @override
  String get sessionExpiredToast =>
      'Your session has expired. Please sign in again.';

  @override
  String splashStartupFailed(String error) {
    return 'Failed to start: $error';
  }

  @override
  String get retry => 'Retry';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Connection lost';

  @override
  String get splashViewOnStatusPage => 'View on status page';

  @override
  String get splashConnectionIssuesPrompt => 'Connection issues?';

  @override
  String get splashStatusPageLink => 'Status page';

  @override
  String get splashReadIncident => 'Read incident';

  @override
  String get splashIncidentHistory => 'Incident history';

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
  String get welcomeBack => 'Welcome back';

  @override
  String get email => 'Email';

  @override
  String get emailInvalid => 'Please enter a valid email address.';

  @override
  String get password => 'Password';

  @override
  String get forgotPassword => 'Forgot your password?';

  @override
  String get logIn => 'Log in';

  @override
  String get logInWithPasskey => 'Log in with a passkey';

  @override
  String continueWithSso(String provider) {
    return 'Continue with $provider';
  }

  @override
  String get ssoRequired => 'SSO is required to access this instance.';

  @override
  String get organizationSsoProvider =>
      'Sign in with your organization\'s single sign-on provider.';

  @override
  String get failedToStartSso => 'Failed to start SSO';

  @override
  String get ssoCancelled => 'SSO login was cancelled';

  @override
  String preferSso(String provider) {
    return 'Prefer using SSO? Continue with $provider.';
  }

  @override
  String get logInViaBrowser => 'Log in via browser';

  @override
  String get needAccountPrompt => 'Need an account? ';

  @override
  String get register => 'Register';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Verify you\'re human';

  @override
  String get captchaDescription =>
      'We need to make sure you\'re not a bot. Please complete the verification below.';

  @override
  String get captchaSwitchToHcaptcha => 'Having issues? Try hCaptcha instead';

  @override
  String get captchaSwitchToTurnstile => 'Try Turnstile instead';

  @override
  String get cancel => 'Cancel';

  @override
  String get ipAuthCheckEmail => 'Check your email';

  @override
  String ipAuthDescription(String email) {
    return 'We emailed a link to authorize this login. Please open your inbox for $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Connection lost';

  @override
  String get ipAuthConnectionLostDescription =>
      'We lost the connection while waiting for authorization. Please try again.';

  @override
  String get ipAuthLinkExpired => 'Sign-in link expired';

  @override
  String get ipAuthLinkExpiredDescription =>
      'This authorization link expired. Please sign in again.';

  @override
  String get ipAuthResendEmail => 'Resend email';

  @override
  String get ipAuthResent => 'Resent';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Back';

  @override
  String get mfaTitle => 'Two-factor authentication';

  @override
  String get mfaChooseMethod => 'Choose a verification method';

  @override
  String get mfaMethodTotp => 'Authenticator App';

  @override
  String get mfaMethodWebauthn => 'Security Key / Passkey';

  @override
  String get mfaTotpDescription =>
      'Enter the 6-digit code from your authenticator app or one of your backup codes.';

  @override
  String get mfaCodeLabel => 'Code';

  @override
  String get mfaTryAnotherMethod => 'Try another method';

  @override
  String get mfaUseSecurityKey => 'Try security key / passkey instead';

  @override
  String get accountSelectorTitle => 'Choose an account';

  @override
  String get accountSelectorDescription =>
      'Select an account to continue, or add a different one.';

  @override
  String get accountAdd => 'Add an account';

  @override
  String get accountRemove => 'Remove';

  @override
  String accountRemoveTitle(String username) {
    return 'Remove $username';
  }

  @override
  String get accountRemoveDescription =>
      'This will remove the saved session for this account.';

  @override
  String get accountRemoveOnlyDescription =>
      'This will remove the only saved account on this device.';

  @override
  String get accountExpired => 'Expired';

  @override
  String accountSessionExpired(String identifier) {
    return 'Session expired for $identifier. Please log in again.';
  }

  @override
  String get accountManageTitle => 'Manage accounts';

  @override
  String get accountSwitchFailed => 'Couldn\'t switch accounts. Try again.';

  @override
  String get profileTabMenuSwitchAccounts => 'Switch accounts';

  @override
  String get statusChangeSheetTitle => 'Set status';

  @override
  String get statusOnlineStatusSection => 'Online status';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusIdle => 'Idle';

  @override
  String get statusDnd => 'Do not disturb';

  @override
  String get statusInvisible => 'Invisible';

  @override
  String get statusOffline => 'Offline';

  @override
  String get statusUntilIChangeIt => 'Until I change it';

  @override
  String get statusDontClear => 'Don\'t clear';

  @override
  String get statusFor10Seconds => 'For 10 seconds';

  @override
  String get statusClearAfter10Seconds => '10 seconds';

  @override
  String get statusClearAfter15Minutes => '15 minutes';

  @override
  String get statusClearAfter30Minutes => '30 minutes';

  @override
  String get statusClearAfter1Hour => '1 hour';

  @override
  String get statusClearAfter3Hours => '3 hours';

  @override
  String get statusClearAfter4Hours => '4 hours';

  @override
  String get statusClearAfter8Hours => '8 hours';

  @override
  String get statusClearAfter24Hours => '24 hours';

  @override
  String get statusClearAfter3Days => '3 days';

  @override
  String get statusDndDescription =>
      'You won\'t receive notifications on desktop';

  @override
  String get statusInvisibleDescription => 'You\'ll appear offline';

  @override
  String get customStatusSetTitle => 'Set custom status';

  @override
  String get customStatusCurrentHint => 'Custom status';

  @override
  String get customStatusClear => 'Clear custom status';

  @override
  String get customStatusPlaceholder => 'What\'s happening?';

  @override
  String get customStatusChooseEmoji => 'Choose an emoji';

  @override
  String get customStatusClearAfter => 'Clear after';

  @override
  String get customStatusSave => 'Save';

  @override
  String get accountActive => 'Active account';

  @override
  String get signOut => 'Sign out';

  @override
  String get suspendedPermanentTitle => 'Account Permanently Suspended';

  @override
  String get suspendedTemporaryTitle => 'Account Suspended';

  @override
  String get suspendedPermanentDescription =>
      'Your account has been permanently suspended for violating our Terms of Service.';

  @override
  String get suspendedTemporaryDescription =>
      'Your account has been temporarily suspended. You will be able to access your account once the suspension period ends.';

  @override
  String get suspendedIssuedAt => 'Issued';

  @override
  String get suspendedEndsAt => 'Ends';

  @override
  String get suspendedDuration => 'Duration';

  @override
  String get suspendedPermanent => 'Permanent';

  @override
  String get suspendedReason => 'Reason';

  @override
  String get suspendedAppealDeadline => 'Appeal Deadline';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Your account is scheduled for deletion on $date.';
  }

  @override
  String get suspendedRecheck => 'Check for Updates';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Check again in ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Back to Login';

  @override
  String get suspendedAppealTitle => 'Appeal';

  @override
  String get suspendedAppealHint =>
      'Explain why your suspension should be reconsidered (minimum 50 characters)...';

  @override
  String get suspendedAppealSubmit => 'Submit Appeal';

  @override
  String get suspendedAppealPending => 'Pending Review';

  @override
  String get suspendedAppealAccepted => 'Appeal Accepted';

  @override
  String get suspendedAppealRejected => 'Appeal Rejected';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Your appeal has been accepted and your account has been reinstated.';

  @override
  String get suspendedSignIn => 'Sign In to Your Account';

  @override
  String get forgotPasswordTitle => 'Forgot your password?';

  @override
  String get forgotPasswordDescription =>
      'Enter your email address and we\'ll send you a link to reset your password.';

  @override
  String get forgotPasswordSubmit => 'Send reset link';

  @override
  String get forgotPasswordSentTitle => 'Check your email';

  @override
  String get forgotPasswordSentDescription =>
      'We\'ve sent password reset instructions to your email address. Please check your inbox and follow the link to reset your password.';

  @override
  String get forgotPasswordBackToLogin => 'Return to login';

  @override
  String get resetPasswordTitle => 'Set new password';

  @override
  String get resetPasswordDescription =>
      'Enter your new password below to complete the reset process.';

  @override
  String get resetPasswordNewPassword => 'New password';

  @override
  String get resetPasswordConfirm => 'Confirm new password';

  @override
  String get resetPasswordSubmit => 'Reset password';

  @override
  String get resetPasswordMismatch => 'Passwords do not match.';

  @override
  String get registerTitle => 'Create an account';

  @override
  String get registerDisplayName => 'Display Name (Optional)';

  @override
  String get registerDisplayNameHint => 'What should people call you?';

  @override
  String get registerUsername => 'Username (Optional)';

  @override
  String get registerUsernameHint => 'Leave blank for a random username';

  @override
  String get registerUsernameTagHint =>
      'A 4-digit tag will be added automatically to ensure uniqueness';

  @override
  String get registerDateOfBirth => 'Date of birth';

  @override
  String get registerMonth => 'Month';

  @override
  String get registerDay => 'Day';

  @override
  String get registerYear => 'Year';

  @override
  String get registerConsent =>
      'I agree to the Terms of Service and Privacy Policy';

  @override
  String get registerConsentPrefix => 'I agree to the ';

  @override
  String get registerConsentTerms => 'Terms of Service';

  @override
  String get registerConsentAnd => ' and ';

  @override
  String get registerConsentPrivacy => 'Privacy Policy';

  @override
  String get registerConfirmPassword => 'Confirm Password';

  @override
  String get registerSubmit => 'Create account';

  @override
  String get registerHaveAccount => 'Already have an account? ';

  @override
  String get passkeyNoCredentials =>
      'No passkeys found for this app. Log in with email and password instead.';

  @override
  String get passkeyDeviceNotSupported =>
      'Passkeys are not supported on this device.';

  @override
  String get passkeyDomainNotAssociated =>
      'Passkeys are not configured for this app. Log in with email and password instead.';

  @override
  String get passkeyTimeout =>
      'Passkey authentication timed out. Please try again.';

  @override
  String get passkeyNotAvailable =>
      'Passkeys are not available for this app. Log in with email and password instead.';

  @override
  String get passkeyFailed =>
      'Passkey authentication failed. Please try again.';

  @override
  String get errorUnableToCreateAccount =>
      'Unable to create account. Please try again.';

  @override
  String get errorUnableToSignIn =>
      'Unable to sign in right now. Please try again.';

  @override
  String get errorInvalidEmailOrPassword => 'Invalid email or password.';

  @override
  String get errorUnableToSendResetLink =>
      'Unable to send reset link. Please try again.';

  @override
  String get errorUnableToResetPassword =>
      'Unable to reset password. Please try again.';

  @override
  String get embedInviteJoin => 'Join Community';

  @override
  String get embedInviteGoTo => 'Go to Community';

  @override
  String embedInviteOnline(String count) {
    return '$count Online';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count Members';
  }

  @override
  String get embedInviteUnknownTitle => 'Unknown Invite';

  @override
  String get embedInviteUnknownSubtitle => 'Try asking for a new invite.';

  @override
  String get embedInviteUnavailable => 'Invite Unavailable';

  @override
  String get embedInviteJoinGroup => 'Join group';

  @override
  String get embedInviteAlreadyJoined => 'Already joined';

  @override
  String get inviteAcceptTitle => 'You\'ve been invited to join';

  @override
  String get inviteAcceptJoinButton => 'Join Community';

  @override
  String get inviteAcceptGoToButton => 'Go to Community';

  @override
  String get inviteAcceptInvitesPaused => 'Invites Paused';

  @override
  String get inviteAcceptNotFoundTitle => 'Invite Invalid';

  @override
  String get inviteAcceptNotFoundDescription =>
      'This invite may be expired or invalid.';

  @override
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'Join group';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'You\'ve been invited to join a group DM by $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'someone';

  @override
  String get inviteAcceptEmojiPack => 'Emoji pack';

  @override
  String get inviteAcceptStickerPack => 'Sticker pack';

  @override
  String get inviteAcceptInstallEmojiPack => 'Install emoji pack';

  @override
  String get inviteAcceptInstallStickerPack => 'Install sticker pack';

  @override
  String get inviteAcceptPackInstallNote =>
      'Accepting this invite installs the pack automatically.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Channel Access Denied';

  @override
  String get channelAccessDeniedDescription =>
      'You do not have access to the channel where this message was sent.';

  @override
  String get messageJumpLinkNoAccess => 'No access';

  @override
  String get okay => 'Okay';

  @override
  String get embedThemeTitle => 'Shared theme';

  @override
  String get embedThemeSubtitle =>
      'This client doesn\'t support custom themes.';

  @override
  String get embedThemeUnavailableButton => 'Themes unavailable';

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
  String get privacySettings => 'Privacy Settings';

  @override
  String get privacyDirectMessages => 'Direct Messages';

  @override
  String get privacyDirectMessagesDescription =>
      'Allow direct messages from other members in this community';

  @override
  String get privacyBotDirectMessages => 'Bot Direct Messages';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Allow bots from this community to send you direct messages';

  @override
  String get privacyMutualDmsDisabled =>
      'The community admins have disabled receiving direct messages solely from mutual members in this community.';

  @override
  String get communityDebug => 'Community Debug';

  @override
  String get copiedToClipboard => 'Copied to clipboard';

  @override
  String get notificationSettings => 'Notification Settings';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Mute $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Muting a community prevents unread indicators and notifications from appearing unless you are mentioned';

  @override
  String get notificationCommunitySettings => 'Community Notification Settings';

  @override
  String get notificationAllMessages => 'All Messages';

  @override
  String get notificationOnlyMentions => 'Only Mentions';

  @override
  String get notificationNothing => 'Nothing';

  @override
  String get notificationSuppressEveryone => 'Suppress @everyone and @here';

  @override
  String get notificationSuppressRoles => 'Suppress All Role @mentions';

  @override
  String get notificationMobilePush => 'Mobile Push Notifications';

  @override
  String get notificationOverrides => 'Notification Overrides';

  @override
  String get notificationSelectChannel => 'Select a channel or category';

  @override
  String get notificationOnlyAtMentions => 'Only @mentions';

  @override
  String get notificationMuteChannel => 'Mute Channel';

  @override
  String get notificationUnmuteChannel => 'Unmute Channel';

  @override
  String get notificationUseCategoryDefault => 'Use Category Default';

  @override
  String get notificationUseCommunityDefault => 'Use Community Default';

  @override
  String get notificationNoCategory => 'No Category';

  @override
  String get dmMarkAsRead => 'Mark as Read';

  @override
  String get dmMuteConversation => 'Mute DM';

  @override
  String get dmUnmuteConversation => 'Unmute DM';

  @override
  String get dmPinDm => 'Pin DM';

  @override
  String get dmUnpinDm => 'Unpin DM';

  @override
  String get dmAlwaysShowInSidebar => 'Always Show in Sidebar';

  @override
  String get dmRemoveFromAlwaysShown => 'Remove from Always Shown';

  @override
  String get dmCloseDm => 'Close DM';

  @override
  String get dmCloseDmConfirmTitle => 'Close DM';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Are you sure you want to close your DM with $username? You can always reopen it later.';
  }

  @override
  String get dmCopyChannelId => 'Copy Channel ID';

  @override
  String get dmChannelIdCopied => 'Channel ID copied';

  @override
  String get dmCopyUserId => 'Copy User ID';

  @override
  String get dmUserIdCopied => 'User ID copied';

  @override
  String get dmViewProfile => 'View Profile';

  @override
  String get dmVoiceCall => 'Start Voice Call';

  @override
  String get incomingVoiceCallTitle => 'Incoming voice call';

  @override
  String get incomingVoiceCallAccept => 'Accept';

  @override
  String get incomingVoiceCallDecline => 'Reject';

  @override
  String get incomingVoiceCallLabel => 'Incoming call';

  @override
  String get incomingVoiceCallIgnore => 'Ignore';

  @override
  String get directVoiceCallNotEligible =>
      'This call can\'t be started right now. Try again in a moment.';

  @override
  String get voiceJoinCallFailed =>
      'Couldn\'t connect to this call. Check your connection and try again.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Couldn\'t join this call. Check your connection and try again.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Couldn\'t update this call on the server. Check your connection and try again.';

  @override
  String get dmAddNote => 'Add Note';

  @override
  String get dmEditGroup => 'Edit group';

  @override
  String get dmInviteToCommunity => 'Invite to Community';

  @override
  String get dmBlock => 'Block';

  @override
  String get dmLeaveGroup => 'Leave Group';

  @override
  String get dmNoCommunitiesAvailable => 'No communities available';

  @override
  String dmGroupMemberCount(int count) {
    return '$count Members';
  }

  @override
  String get dmMuteFor15Min => 'For 15 minutes';

  @override
  String get dmMuteFor30Min => 'For 30 minutes';

  @override
  String get dmMuteFor1Hour => 'For 1 hour';

  @override
  String get dmMuteFor3Hours => 'For 3 hours';

  @override
  String get dmMuteFor4Hours => 'For 4 hours';

  @override
  String get dmMuteFor8Hours => 'For 8 hours';

  @override
  String get dmMuteFor24Hours => 'For 24 hours';

  @override
  String get dmMuteFor3Days => 'For 3 days';

  @override
  String get dmMuteForever => 'Until I turn it back on';

  @override
  String get dmPinGroupDm => 'Pin Group DM';

  @override
  String get dmUnpinGroupDm => 'Unpin Group DM';

  @override
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
  }

  @override
  String get dmFavoriteDm => 'Favorite DM';

  @override
  String get dmUnfavoriteDm => 'Unfavorite DM';

  @override
  String get dmFavoriteGroupDm => 'Favorite Group DM';

  @override
  String get dmUnfavoriteGroupDm => 'Unfavorite Group DM';

  @override
  String get dmChangeFriendNickname => 'Change Friend Nickname';

  @override
  String get dmRemoveFriend => 'Remove Friend';

  @override
  String get dmAddFriend => 'Add Friend';

  @override
  String get dmAcceptFriendRequest => 'Accept Friend Request';

  @override
  String get dmIgnoreFriendRequest => 'Ignore Friend Request';

  @override
  String get dmFriendRequestSent => 'Friend Request Sent';

  @override
  String get dmUnblock => 'Unblock';

  @override
  String get dmDebugUser => 'Debug User';

  @override
  String get dmDebugChannel => 'Debug Channel';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => 'Pinned DM';

  @override
  String get dmUnpinned => 'Unpinned DM';

  @override
  String get dmMuted => 'Muted DM';

  @override
  String get dmUnmuted => 'Unmuted DM';

  @override
  String get dmRemoveFriendConfirmTitle => 'Remove Friend';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Are you sure you want to remove $username as a friend?';
  }

  @override
  String get dmBlockConfirmTitle => 'Block User';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Are you sure you want to block $username? They won\'t be able to message you or send you friend requests.';
  }

  @override
  String get dmFriendRequestSentToast => 'Friend request sent';

  @override
  String get dmFriendRequestFailed => 'Failed to send friend request';

  @override
  String get dmAcceptFriendRequestFailed => 'Failed to accept friend request';

  @override
  String get dmRemoveFriendFailed => 'Failed to remove friend';

  @override
  String get dmBlockFailed => 'Failed to block user';

  @override
  String get dmUnblockFailed => 'Failed to unblock user';

  @override
  String get dmIgnoreFriendRequestFailed => 'Failed to ignore friend request';

  @override
  String get dmAddFriends => 'Add friends';

  @override
  String get addFriendSheetTitle => 'Add friend';

  @override
  String get addFriendUsernameHint => 'Username#0000';

  @override
  String get addFriendUsernameLabel => 'Friend\'s username';

  @override
  String get addFriendSendRequest => 'Send request';

  @override
  String get addFriendNoUserFound => 'No user found with that username.';

  @override
  String get addFriendInvalidUsername =>
      'Enter a valid username (Username#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Friend request sent';

  @override
  String get addFriendClaimTitle => 'Claim your account';

  @override
  String get addFriendClaimDescription =>
      'Claim your account to send friend requests.';

  @override
  String get addFriendVerifyTitle => 'Verify your email';

  @override
  String get addFriendVerifyDescription =>
      'You need to verify your email address before you can send friend requests.';

  @override
  String get addFriendVerifyEmail => 'Verify email';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Incoming friend requests ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Outgoing friend requests ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Incoming friend request';

  @override
  String get addFriendOutgoingStatus => 'Friend request sent';

  @override
  String get addFriendViewProfile => 'View profile';

  @override
  String get addFriendAccept => 'Accept';

  @override
  String get addFriendIgnore => 'Ignore';

  @override
  String get addFriendAcceptTitle => 'Accept friend request';

  @override
  String get addFriendIgnoreTitle => 'Ignore friend request';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Accept the friend request from $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Ignore the friend request from $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Cancel request';

  @override
  String get addFriendCancelRequestFailed =>
      'Couldn\'t cancel the friend request. Try again.';

  @override
  String get addFriendNotAcceptingRequests =>
      'They\'re not accepting friend requests right now.';

  @override
  String get addFriendUnblockFirst =>
      'Unblock them first to send a friend request.';

  @override
  String get addFriendCannotSendToSelf =>
      'You can\'t send a friend request to yourself.';

  @override
  String get addFriendAlreadyFriends =>
      'You\'re already friends with this user.';

  @override
  String get addFriendClaimToSend =>
      'Finish signing up to send friend requests.';

  @override
  String get addFriendSendFailedGeneric =>
      'Couldn\'t send the friend request. Try again.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'System';

  @override
  String get emojiSearchPlaceholder => 'Find the emoji of your dreams';

  @override
  String get emojiSearchEmpty => 'No emojis match your search';

  @override
  String get emojiAutocompleteDefaultLabel => 'Default emoji';

  @override
  String get emojiFrequentlyUsed => 'Frequently Used';

  @override
  String get emojiTabGifs => 'GIFs';

  @override
  String get emojiTabMedia => 'Media';

  @override
  String get emojiTabStickers => 'Stickers';

  @override
  String get emojiTabEmojis => 'Emojis';

  @override
  String get gifPickerSearch => 'Search GIFs';

  @override
  String get gifPickerSearchKlipy => 'Search KLIPY';

  @override
  String get gifPickerSearchTenor => 'Search Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Favorites';

  @override
  String get gifPickerTrending => 'Trending GIFs';

  @override
  String get gifPickerNoResultsTitle => 'No Search Results';

  @override
  String get gifPickerNoResultsDescription => 'Try another search term';

  @override
  String get gifPickerLoadFailedTitle => 'Couldn\'t load GIFs';

  @override
  String get gifPickerLoadFailedBody => 'Check your connection and try again.';

  @override
  String get emojiCategoryPeople => 'People';

  @override
  String get emojiCategoryNature => 'Nature';

  @override
  String get emojiCategoryFood => 'Food & Drink';

  @override
  String get emojiCategoryActivity => 'Activities';

  @override
  String get emojiCategoryTravel => 'Travel & Places';

  @override
  String get emojiCategoryObjects => 'Objects';

  @override
  String get emojiCategorySymbols => 'Symbols';

  @override
  String get emojiCategoryFlags => 'Flags';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Unlock $emojiCount from $communityCount with Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Get Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Don\'t show this again';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count custom emojis',
      one: '1 custom emoji',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count communities',
      one: '1 community',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'External Link Warning';

  @override
  String get externalLinkWarningLeaving => 'You are about to leave Fluxer';

  @override
  String get externalLinkWarningDescription =>
      'External links can be dangerous. Please be careful.';

  @override
  String get externalLinkWarningDestinationUrl => 'Destination URL:';

  @override
  String get externalLinksSectionTitle => 'External Links';

  @override
  String get externalLinksSectionDescription =>
      'Configure how external link warnings are handled.';

  @override
  String get externalLinkWarningTrustPrefix => 'Always trust ';

  @override
  String get externalLinkWarningTrustSuffix => ' — skip this warning next time';

  @override
  String get externalLinkVisitSite => 'Visit Site';

  @override
  String get externalLinkTrustAllLabel => 'Trust all external links';

  @override
  String get externalLinkStripTrackingLabel =>
      'Strip tracking parameters from URLs';

  @override
  String get externalLinkStripTrackingDescription =>
      'Automatically remove tracking parameters (like utm_source, fbclid, gclid) from URLs in messages you send. Cleans the link before it reaches anyone else.';

  @override
  String get externalLinkTrustAllConfirmTitle => 'Trust all external links?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'This will trust all external links and skip the warning for every domain. Your existing trusted domains will be replaced. This is less secure.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Trust All';

  @override
  String get externalLinkStopTrustingAllTitle => 'Stop trusting all links?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'External link warnings will be shown again. You will need to add trusted domains individually.';

  @override
  String get externalLinkStopTrustingAllAction => 'Disable Trust All';

  @override
  String get externalLinkTrustedAllDescription =>
      'All external links are trusted. Warnings will not be shown.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'You have $count trusted domain(s). Add more by checking the box when visiting external links.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'When enabled, no external link warnings will be shown. This is less secure.';

  @override
  String get imageFileTooLarge =>
      'Image file is too large. Please choose a file smaller than 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Animated avatars require Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Animated banners require Plutonium';

  @override
  String get animatedAvifNotSupported => 'Animated AVIF Not Supported';

  @override
  String get animatedAvifNotSupportedBody =>
      'Cropping and rotating animated AVIF files isn\'t supported yet. If you proceed, it will be uploaded in its original form.';

  @override
  String get uploadAsIs => 'Upload As-Is';

  @override
  String get croppingAnimatedNotSupported =>
      'Cropping animated images isn\'t supported yet. The original upload will be used.';

  @override
  String get cropAvatar => 'Crop Avatar';

  @override
  String get cropBanner => 'Crop Banner';

  @override
  String get skip => 'Skip';

  @override
  String get crop => 'Crop';

  @override
  String get changeYourFluxerTag => 'Change Your Username';

  @override
  String get fluxerTagInputLabel => 'Username';

  @override
  String get fluxerTagDescriptionBase =>
      'Usernames can only contain letters (a-z, A-Z), numbers (0-9), and underscores. Usernames are case-insensitive.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Usernames can only contain letters (a-z, A-Z), numbers (0-9), and underscores. Usernames are case-insensitive. You can pick any available 4-digit tag from #0000 to #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Usernames can only contain letters (a-z, A-Z), numbers (0-9), and underscores. Usernames are case-insensitive. You can pick any available 4-digit tag from #0001 to #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Between $min and $max characters';
  }

  @override
  String get validationAllowedChars =>
      'Letters (a-z, A-Z), numbers (0-9), and underscores (_) only';

  @override
  String get discriminatorPremiumTooltip =>
      'Get Plutonium to customize your tag or keep it when changing your username';

  @override
  String get fluxerTagAlreadyTaken => 'Username Already Taken';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'The username $username#$discriminator is already taken. Continuing will reroll your discriminator automatically.';
  }

  @override
  String get customTagIsTemporary => 'Custom Tag Is Temporary';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Your custom 4-digit tag is only available while your Plutonium subscription is active. When your subscription expires on $date, your tag will revert to a randomly assigned number after a 3-day grace period.';
  }

  @override
  String get customTagTemporaryBody =>
      'Your custom 4-digit tag is only available while your Plutonium subscription is active. When your subscription expires, your tag will revert to a randomly assigned number after a 3-day grace period.';

  @override
  String get iUnderstandContinue => 'I Understand, Continue';

  @override
  String get premiumWarningPendingDiscriminator =>
      'If you save this username, your custom 4-digit tag will revert to a random number when your Plutonium subscription ends. If your subscription fails to renew, you\'ll have a 3-day grace period before the tag changes.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Your custom 4-digit tag (#$discriminator) is active while your Plutonium subscription is active. If your subscription ends or fails to renew after a 3-day grace period, your tag will revert to a random number.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Customize your 4-digit tag or keep it when changing your username';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Your Plutonium trial expires on $date. Upgrade to keep your custom tag and earn a badge on your profile.';
  }

  @override
  String get premiumTrialActive =>
      'You\'re on a Plutonium trial. Upgrade to keep your custom tag and earn a badge on your profile.';

  @override
  String get fluxerTagUpdated => 'Username updated';

  @override
  String get fluxerTagUpdateFailed =>
      'Failed to update username. Please try again.';

  @override
  String get continueAction => 'Continue';

  @override
  String get profileCustomizationTitle => 'Profile Customization';

  @override
  String get profileCustomizationDescription =>
      'Edit your profile appearance and see a live preview';

  @override
  String get usernameLabel => 'Username';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Claim your account to change your username';

  @override
  String get changeFluxerTag => 'Change Username';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Customize your 4-digit tag (#$discriminator) to your liking with Plutonium';
  }

  @override
  String get changeUsernameAndTagHint => 'Change your username and 4-digit tag';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Your custom tag (#$discriminator) is tied to your Plutonium subscription and will revert to a random tag if it expires.';
  }

  @override
  String get displayNameLabel => 'Display Name';

  @override
  String get pronounsLabel => 'Pronouns';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Change Avatar';

  @override
  String get removeAvatar => 'Remove Avatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Max 10MB. Recommended: 512×512px';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get changeBanner => 'Change Banner';

  @override
  String get removeBanner => 'Remove Banner';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Max 10MB. Minimum: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Accent Color';

  @override
  String get accentColorDescription =>
      'Customizes the border and banner color on your profile';

  @override
  String get aboutMeLabel => 'About Me';

  @override
  String get aboutMeHelperText => 'You can use links, emoji, and Markdown.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle => 'Plutonium Badge Privacy';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Control how your Plutonium badge is displayed to others';

  @override
  String get hidePlutoniumBadgeLabel => 'Hide Plutonium badge entirely';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Completely hide your Plutonium badge from other users';

  @override
  String get hidePlutoniumPurchaseDate => 'Hide Plutonium purchase date';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Hide Plutonium purchase date ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Remove when you first bought Plutonium from your badge';

  @override
  String get maskVisionaryAsSubscription => 'Mask Visionary as subscription';

  @override
  String get maskVisionaryDescription =>
      'Show your Visionary as a regular subscription instead';

  @override
  String get hideVisionaryIdBadge => 'Hide Visionary ID badge';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Hide Visionary ID badge (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Remove your Visionary ID badge';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'You\'re on a Plutonium trial — your subscription starts on $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Your subscription will automatically begin when your trial ends. No action needed.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'You\'re on a Plutonium trial that expires on $date';
  }

  @override
  String get premiumTrialActiveProfile => 'You\'re on a Plutonium trial';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Max 10MB. Recommended: 512×512px. Animated avatars (GIF) require Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Customize your profile with a static or animated banner image to make it stand out.';

  @override
  String get getPlutonium => 'Get Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'In-app purchases are not available on this platform yet. Stay tuned — coming soon!';

  @override
  String get profilePreviewLabel => 'Preview';

  @override
  String get profilePreviewMessage => 'Message';

  @override
  String get profilePreviewMemberSince => 'Fluxer Member Since';

  @override
  String get unclaimedAccountTitle => 'Unclaimed Account';

  @override
  String get unclaimedAccountDescription =>
      'Your account is not yet claimed. Without an email and password, you could lose access. Claim your account now to secure it.';

  @override
  String get claimAccount => 'Claim Account';

  @override
  String get profileTypeLabel => 'Profile Type';

  @override
  String get profileTypeGlobal => 'Global Profile';

  @override
  String get profileTypeGuildDescription =>
      'You are editing your per-community profile. This profile will only be visible in this community and will override your global profile.';

  @override
  String get communityNicknameLabel => 'Community Nickname';

  @override
  String get perGuildPremiumUpsellText =>
      'Customizing your avatar, banner, accent color, and bio for individual communities requires Plutonium. Community nickname and pronouns are free for everyone.';

  @override
  String get avatarModeInherit => 'Use Global Profile';

  @override
  String get avatarModeCustom => 'Use Custom Image';

  @override
  String get avatarModeUnset => 'Don\'t Show';

  @override
  String get profileSavedToast => 'Profile updated';

  @override
  String get profileEditButton => 'Edit Profile';

  @override
  String get profileNoteLabel => 'Note';

  @override
  String get profileNoteVisibility => '(only visible to you)';

  @override
  String get profileNoteEmpty => 'No note yet.';

  @override
  String get sudoTitle => 'Verify Your Identity';

  @override
  String get sudoDescription =>
      'This action requires verification to continue.';

  @override
  String get sudoAuthenticatorCode => 'Authenticator Code';

  @override
  String get sudoMethodPassword => 'Password';

  @override
  String get sudoMethodTotp => 'Authenticator';

  @override
  String get sudoVerificationFailed => 'Verification failed. Please try again.';

  @override
  String get securityAccountTitle => 'Account';

  @override
  String get securityAccountDescription =>
      'Manage your email, password, and account settings';

  @override
  String get securitySectionTitle => 'Security';

  @override
  String get securitySectionDescription =>
      'Protect your account with two-factor authentication and passkeys';

  @override
  String get securityLoginEmailSectionTitle => 'Email Settings';

  @override
  String get securityLoginEmailSectionDescription =>
      'Manage the email address you use to sign in to Fluxer';

  @override
  String get securityLoginEmailAddressLabel => 'Email Address';

  @override
  String get securityLoginNoEmailSet => 'No email address set';

  @override
  String get securityLoginChangeEmail => 'Change Email';

  @override
  String get securityLoginAddEmail => 'Add Email';

  @override
  String get securityLoginReveal => 'Reveal';

  @override
  String get securityLoginHide => 'Hide';

  @override
  String get securityLoginPasswordSectionTitle => 'Password';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Change your password to keep your account secure';

  @override
  String get securityLoginCurrentPasswordLabel => 'Current Password';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Last changed: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Last changed: Never';

  @override
  String get securityLoginNoPasswordSet => 'No password set';

  @override
  String get securityLoginChangePassword => 'Change Password';

  @override
  String get securityLoginSetPassword => 'Set Password';

  @override
  String get passwordChangeTitle => 'Change Password';

  @override
  String get passwordChangeIntroDescription =>
      'We\'ll send a verification code to your email address to confirm your identity before changing your password.';

  @override
  String get passwordChangeStart => 'Start';

  @override
  String get passwordChangeVerifyTitle => 'Verify Your Email';

  @override
  String get passwordChangeVerifyDescription =>
      'Enter the verification code sent to your email address.';

  @override
  String get passwordChangeVerificationCode => 'Verification Code';

  @override
  String get passwordChangeVerify => 'Verify';

  @override
  String get passwordChangeNewPasswordTitle => 'Set New Password';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Enter your new password below.';

  @override
  String get passwordChangeNewPassword => 'New Password';

  @override
  String get passwordChangeConfirmPassword => 'Confirm New Password';

  @override
  String get passwordChangeSubmit => 'Change Password';

  @override
  String get passwordChangeSuccess => 'Password changed';

  @override
  String get passwordChangePasswordsDoNotMatch => 'Passwords do not match';

  @override
  String get passwordChangeInvalidCode => 'Invalid or expired code';

  @override
  String get emailChangeTitle => 'Change Email';

  @override
  String get emailChangeIntroDescription =>
      'We\'ll send verification codes to verify your identity before changing your email address.';

  @override
  String get emailChangeStart => 'Start';

  @override
  String get emailChangeVerifyOriginalTitle => 'Verify Current Email';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Enter the verification code sent to your current email address.';

  @override
  String get emailChangeNewEmailTitle => 'Enter New Email';

  @override
  String get emailChangeNewEmailDescription =>
      'Enter the new email address you\'d like to use.';

  @override
  String get emailChangeNewEmailLabel => 'New Email';

  @override
  String get emailChangeNewEmailSubmit => 'Send Verification Code';

  @override
  String get emailChangeVerifyNewTitle => 'Verify New Email';

  @override
  String get emailChangeVerifyNewDescription =>
      'Enter the verification code sent to your new email address.';

  @override
  String get emailChangeSuccess => 'Email changed';

  @override
  String get emailChangeInvalidCode => 'Invalid or expired code';

  @override
  String get resend => 'Resend';

  @override
  String resendCountdown(int seconds) {
    return 'Resend (${seconds}s)';
  }

  @override
  String get verificationCode => 'Verification Code';

  @override
  String get verify => 'Verify';

  @override
  String get enable => 'Enable';

  @override
  String get disable => 'Disable';

  @override
  String get delete => 'Delete';

  @override
  String get save => 'Save';

  @override
  String get securityTfaSectionTitle => 'Two-Factor Authentication';

  @override
  String get securityTfaSectionDescription =>
      'Add an extra layer of security to your account';

  @override
  String get securityTfaAuthenticatorApp => 'Authenticator App';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Two-factor authentication is enabled';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Use an authenticator app to generate codes for two-factor authentication';

  @override
  String get securityTfaBackupCodes => 'Backup Codes';

  @override
  String get securityTfaBackupCodesDescription =>
      'View and manage your backup codes for account recovery';

  @override
  String get securityTfaViewCodes => 'View Codes';

  @override
  String get securityPasskeysSectionTitle => 'Passkeys';

  @override
  String get securityPasskeysSectionDescription =>
      'Use passkeys for passwordless sign-in and two-factor authentication';

  @override
  String get securityPasskeysRegistered => 'Registered Passkeys';

  @override
  String get securityPasskeysNone => 'No passkeys registered';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'passkeys',
      one: 'passkey',
    );
    return '$count $_temp0 registered (max 10)';
  }

  @override
  String get securityPasskeysAdd => 'Add Passkey';

  @override
  String securityPasskeysAdded(String date) {
    return 'Added: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Last used: $date';
  }

  @override
  String get securityPasskeysRename => 'Rename';

  @override
  String get securityPasskeysDeleteTitle => 'Delete Passkey';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Are you sure you want to delete the passkey \"$name\"?';
  }

  @override
  String get securityPasskeyNameTitle => 'Name Passkey';

  @override
  String get securityPasskeyNameLabel => 'Passkey Name';

  @override
  String get securityPasskeyNameHint => 'e.g., YubiKey, iPhone, Work Computer';

  @override
  String get securityPhoneSectionTitle => 'Phone Number';

  @override
  String get securityPhoneSectionDescription => 'Manage your phone number.';

  @override
  String get securityPhoneLabel => 'Phone Number';

  @override
  String get securityPhoneNone => 'No phone number added.';

  @override
  String get securityPhoneAdd => 'Add Phone';

  @override
  String get securityPhoneRemove => 'Remove';

  @override
  String get securityPhoneRemoveTitle => 'Remove Phone Number';

  @override
  String get securityPhoneRemoveDescription =>
      'Are you sure you want to remove your phone number?';

  @override
  String get securityPhoneRemoved => 'Phone number removed';

  @override
  String get securityClaimTitle => 'Security Features';

  @override
  String get securityClaimDescription =>
      'Claim your account to access security features like two-factor authentication and passkeys.';

  @override
  String get securityVerifyEmailRequired =>
      'You must verify your email address before you can set up two-factor authentication, passkeys, or SMS verification.';

  @override
  String get totpEnableTitle => 'Setup Authenticator App';

  @override
  String get totpEnableDescription =>
      'Scan the QR code with your authenticator app to generate codes for two-factor authentication.';

  @override
  String get totpEnableCodeLabel => 'Code';

  @override
  String get totpEnableCodeHint =>
      'Enter the 6-digit code from your authenticator app';

  @override
  String get totpEnableSuccess => 'Two-factor authentication has been enabled';

  @override
  String get totpDisableTitle => 'Remove Authenticator App';

  @override
  String get totpDisableDescription =>
      'Enter the 6-digit code from your authenticator app to disable two-factor authentication.';

  @override
  String get totpDisableSuccess => 'Two-factor authentication disabled';

  @override
  String get backupCodesTitle => 'Backup Codes';

  @override
  String get backupCodesWarning =>
      'If you lose access to your authenticator app and don\'t have these codes, you will be permanently locked out of your account. Download or copy them now and store them somewhere safe.';

  @override
  String get backupCodesDownload => 'Download';

  @override
  String get backupCodesCopy => 'Copy';

  @override
  String get backupCodesCopied => 'Backup codes copied to clipboard';

  @override
  String get backupCodesAcknowledge =>
      'I have downloaded or copied my backup codes and stored them in a safe place.';

  @override
  String get backupCodesDone => 'Done';

  @override
  String get backupCodesViewTitle => 'View Backup Codes';

  @override
  String get backupCodesViewDescription =>
      'Verification may be required before viewing your backup codes.';

  @override
  String get phoneAddTitle => 'Add Phone Number';

  @override
  String get phoneAddLabel => 'Phone Number';

  @override
  String get phoneAddHint => 'Enter your phone number';

  @override
  String get phoneAddFooter =>
      'We\'ll send an SMS code when available. Your number is not linked to your account. We keep only an encrypted marker, with no user ID, to allow at most 2 verifications in about 30 days.';

  @override
  String get phoneAddSendCode => 'Send Code';

  @override
  String get phoneVerifyTitle => 'Verify Phone Number';

  @override
  String get phoneVerifyDescription =>
      'Enter the verification code sent to your phone number.';

  @override
  String get phoneAddSuccess => 'Phone number verified';

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
  String get dangerZoneSectionTitle => 'Danger Zone';

  @override
  String get dangerZoneSectionDescription =>
      'Irreversible and destructive actions';

  @override
  String get dangerZoneDisableTitle => 'Disable Account';

  @override
  String get dangerZoneDisableDescription =>
      'Temporarily disable your account. You can reactivate it later by signing back in.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Disabling your account will log you out of all sessions. You can re-enable your account at any time by logging in again.';

  @override
  String get dangerZoneDeleteTitle => 'Delete Account';

  @override
  String get dangerZoneDeleteDescription =>
      'Permanently delete your account and all associated data. This action cannot be undone.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Cancel your active Plutonium subscription in Plutonium settings before deleting your account.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'Cannot delete account';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'You cannot delete your account while you own communities. Transfer ownership of the following communities first:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'and $count more';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'To transfer ownership, go to $settingsPath and use the transfer ownership option.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Are you sure you want to delete your account? This action will schedule your account for permanent deletion.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'You can cancel the deletion process within 14 days';

  @override
  String get dangerZoneDeleteBullet2 =>
      'After 14 days, your account will be permanently deleted';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Once deletion is processed, you cannot recover access to your account';

  @override
  String get dangerZoneDeleteBullet4 =>
      'You will not be able to delete your sent messages after your account is deleted';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'If you want to export your data or delete your messages first, please visit the Privacy Dashboard section in User Settings before proceeding.';

  @override
  String get claimAccountTitle => 'Claim Your Account';

  @override
  String get claimAccountDescription =>
      'Claim your account by adding an email and password. We will send a verification code to confirm your email before finishing.';

  @override
  String get claimAccountEmailLabel => 'Email';

  @override
  String get claimAccountPasswordLabel => 'Password';

  @override
  String get claimAccountSendCode => 'Send Code';

  @override
  String get claimAccountVerifyDescription =>
      'Enter the code we sent to your email to verify it. Your password will be set once the code is confirmed.';

  @override
  String get claimAccountSuccess => 'Account claimed successfully';

  @override
  String get importantInformation => 'Important information:';

  @override
  String get genericError => 'An error occurred';

  @override
  String get invalidCode => 'Invalid code';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count years ago',
      one: '1 year ago',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count months ago',
      one: '1 month ago',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days ago',
      one: '1 day ago',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hours ago',
      one: '1 hour ago',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes ago',
      one: '1 minute ago',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'just now';

  @override
  String get authorizedAppsTitle => 'Authorized Applications';

  @override
  String get authorizedAppsDescription =>
      'These applications have been granted access to your Fluxer account.';

  @override
  String get authorizedAppsEmptyTitle => 'No Authorized Applications';

  @override
  String get authorizedAppsEmptyDescription =>
      'You haven\'t authorized any applications to access your account.';

  @override
  String get authorizedAppsLoadError =>
      'Failed to Load Authorized Applications';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Authorized on $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Permissions granted';

  @override
  String get authorizedAppsRevoke => 'Revoke';

  @override
  String get authorizedAppsRevokeTitle => 'Revoke application access';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Are you sure you want to revoke access for $appName? This application will no longer have access to your account.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Access your basic profile information (username, avatar, etc.)';

  @override
  String get authorizedAppsScopeEmail => 'View your email address';

  @override
  String get authorizedAppsScopeGuilds =>
      'View the communities you are a member of';

  @override
  String get authorizedAppsScopeConnections => 'View your connected accounts';

  @override
  String get authorizedAppsScopeBot =>
      'Add a bot to a community with requested permissions';

  @override
  String get authorizedAppsScopeAdmin => 'Access administrative endpoints';

  @override
  String get privacyPendingDeletionTitle => 'Pending Deletion';

  @override
  String get blockedUsersTitle => 'Blocked Users';

  @override
  String get blockedUsersDescription =>
      'Blocked users can\'t send you friend requests or message you directly.';

  @override
  String get blockedUsersEmptyTitle => 'No Blocked Users';

  @override
  String get blockedUsersEmptyDescription => 'You haven\'t blocked anyone yet.';

  @override
  String get blockedUsersLoadError => 'Failed to Load Blocked Users';

  @override
  String get blockedUsersUnblock => 'Unblock';

  @override
  String get blockedUsersUnblockTitle => 'Unblock User';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Are you sure you want to unblock $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Copy username';

  @override
  String get blockedUsersCopyId => 'Copy User ID';

  @override
  String get userProfileLoadError => 'Couldn\'t load profile';

  @override
  String get userProfileLoading => 'Loading profile';

  @override
  String get userProfileRetry => 'Retry';

  @override
  String get userProfileMessage => 'Message';

  @override
  String get userProfileVoiceCall => 'Voice Call';

  @override
  String get userProfileVideoCall => 'Video Call';

  @override
  String get userProfileEditProfile => 'Edit Profile';

  @override
  String get userProfileStaffBadgeTooltip => 'Fluxer Staff';

  @override
  String get userProfileCtpBadgeTooltip => 'Fluxer Community Team';

  @override
  String get userProfilePartnerBadgeTooltip => 'Fluxer Partner';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Fluxer Bug Hunter';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer Plutonium';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Fluxer Plutonium subscriber since $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Fluxer Visionary';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Fluxer Visionary since $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'Visionary ID #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Mutual Friends ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Mutual Communities ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Mutual Friends';

  @override
  String get userProfileMutualCommunitiesTitle => 'Mutual Communities';

  @override
  String get userProfileNoMutualFriends => 'No mutual friends found.';

  @override
  String get userProfileNoMutualCommunities => 'No mutual communities found.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Nickname: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Open DM';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'You blocked $username. You won\'t be able to send messages unless you unblock them.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Unblock';

  @override
  String get userProfileOpenDm => 'Open DM';

  @override
  String get userProfileNoteTitle => 'Note';

  @override
  String get userProfileNoteVisibility => '(only visible to you)';

  @override
  String get userProfileNoteSave => 'Save';

  @override
  String get userProfileNoteDelete => 'Delete';

  @override
  String get userProfileNoteEmpty => 'Click to add a note';

  @override
  String get userProfileMemberSince => 'Member Since';

  @override
  String get userProfileAboutMe => 'About Me';

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
  String get userProfileCopyUsername => 'Copy Username';

  @override
  String get userProfileCopyUserId => 'Copy User ID';

  @override
  String get userProfileViewMainProfile => 'View Main Profile';

  @override
  String get userProfileViewCommunityProfile => 'View Community Profile';

  @override
  String get userProfileBlockUser => 'Block User';

  @override
  String get userProfileUnblockUser => 'Unblock User';

  @override
  String get userProfileRemoveFriend => 'Remove Friend';

  @override
  String get userProfileBlockConfirmTitle => 'Block User';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Are you sure you want to block $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Unblock User';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Are you sure you want to unblock $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Remove Friend';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Are you sure you want to remove $username as a friend?';
  }

  @override
  String get userProfileFailedOpenDm => 'Failed to open DM';

  @override
  String get userProfileFailedSaveNote => 'Failed to save note';

  @override
  String get userProfileActionFailed => 'Action failed, please try again';

  @override
  String get userProfileChangeNickname => 'Change nickname';

  @override
  String get userProfileKick => 'Kick';

  @override
  String get userProfileBan => 'Ban';

  @override
  String get userProfileTimeout => 'Timeout';

  @override
  String get userProfileRemoveTimeout => 'Remove timeout';

  @override
  String get userProfileTransferOwnership => 'Transfer ownership';

  @override
  String get userProfileReportUser => 'Report user';

  @override
  String get userProfileReportMessage => 'Report message';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Kick $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Are you sure you want to kick $username? They can rejoin with a new invite.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Remove timeout?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Removing the timeout will allow $username to send messages, react, and join voice channels again.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Transfer ownership?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Transfer ownership of this community to $username? This is irreversible and you will lose all owner privileges.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Ban $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Ban duration';

  @override
  String get userProfileBanCustomSecondsLabel => 'Custom duration (seconds)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Any value from $min to $max seconds';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Delete message history';

  @override
  String get userProfileBanDeleteNone => 'Don\'t delete any';

  @override
  String get userProfileBanDelete24h => 'Previous 24 hours';

  @override
  String get userProfileBanDelete7d => 'Previous 7 days';

  @override
  String get userProfileBanReasonLabel => 'Reason (optional)';

  @override
  String get userProfileBanReasonHint => 'Enter a reason for the ban';

  @override
  String get userProfileBanSubmit => 'Ban member';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Timeout $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Timeout duration';

  @override
  String get userProfileTimeoutSubmit => 'Time out member';

  @override
  String get userProfileNicknameLabel => 'Nickname';

  @override
  String get userProfileNicknameHint => 'Enter a nickname';

  @override
  String get userProfileNicknameSave => 'Save';

  @override
  String userProfileKickSuccess(String username) {
    return 'Kicked $username';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Banned $username';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Timed out $username';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Removed timeout for $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Nickname updated';

  @override
  String get userProfileTransferSuccess => 'Ownership transferred';

  @override
  String get durationPermanent => 'Permanent';

  @override
  String get duration60Seconds => '60 seconds';

  @override
  String get duration5Minutes => '5 minutes';

  @override
  String get duration10Minutes => '10 minutes';

  @override
  String get duration1Hour => '1 hour';

  @override
  String get duration12Hours => '12 hours';

  @override
  String get duration1Day => '1 day';

  @override
  String get duration3Days => '3 days';

  @override
  String get duration5Days => '5 days';

  @override
  String get duration1Week => '1 week';

  @override
  String get duration2Weeks => '2 weeks';

  @override
  String get duration1Month => '1 month';

  @override
  String get durationCustom => 'Custom…';

  @override
  String get iarReportUserTitle => 'Report user';

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
  String get iarReasonInappropriateProfile => 'Inappropriate profile';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'This user\'s profile contains inappropriate content';

  @override
  String typingIndicatorOne(String name) {
    return '$name is typing...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 and $name2 are typing...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 and $name3 are typing...';
  }

  @override
  String get typingIndicatorMultiple => 'Several people are typing...';

  @override
  String get typingIndicatorHandful =>
      'A handful of keyboard warriors are assembling...';

  @override
  String get typingIndicatorSymphony =>
      'A symphony of clacking keys is underway...';

  @override
  String get typingIndicatorFiesta =>
      'It\'s a full-blown typing fiesta in here';

  @override
  String get typingIndicatorApocalypse => 'Whoa, it\'s a typing apocalypse';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Glad you\'re here, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Welcome, $username! Make yourself at home.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Hello, $username! Nice to have you here.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Hello, $username! Jump in whenever you\'re ready.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Hey $username, great to see you here!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Hey there, $username! Hope you enjoy your stay.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Hey, $username, welcome aboard!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Glad you made it, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Welcome in, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Welcome, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Welcome, $username! We\'re glad you\'re here.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Welcome, $username! Hope you enjoy your time here.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Welcome, $username! Your next conversation starts here.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Welcome, $username. We\'re happy to have you here.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Great to see you, $username! Welcome in.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'You\'re here, $username! Good to have you with us.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'You\'ve arrived, $username! Let\'s get started.';
  }

  @override
  String get relativeTimeShortNow => 'now';

  @override
  String relativeTimeShortMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}m',
      one: '1m',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}h',
      one: '1h',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}d',
      one: '1d',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}mo',
      one: '1mo',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}y',
      one: '1y',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'My Devices';

  @override
  String get linkedDevicesDescription =>
      'See all devices that are currently logged into your account. Revoke any sessions that you don\'t recognize.';

  @override
  String get linkedDevicesCurrentDevice => 'Current Device';

  @override
  String get linkedDevicesOtherDevices => 'Other Devices';

  @override
  String get linkedDevicesEnterSelection => 'Enter Selection Mode';

  @override
  String get linkedDevicesExitSelection => 'Exit Selection Mode';

  @override
  String get linkedDevicesSelectAll => 'Select All';

  @override
  String get linkedDevicesClearSelection => 'Clear Selection';

  @override
  String get linkedDevicesRevokeTooltip => 'Revoke device';

  @override
  String get linkedDevicesSignOutAll => 'Sign out all other devices';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sign out $count devices',
      one: 'Sign out 1 device',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sign out $count devices',
      one: 'Sign out 1 device',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle => 'Sign out all other devices';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'This will log out the selected devices from your account. You will need to log in again on those devices.',
      one:
          'This will log out the selected device from your account. You will need to log in again on that device.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'This will log out the selected devices from your account. You will need to log in again on those devices.';

  @override
  String get linkedDevicesSignOutConfirm => 'Continue';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'You\'ll have to log back in on all logged out devices';

  @override
  String get linkedDevicesLoadErrorTitle => 'Network Error';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'We\'re having trouble connecting to the space-time continuum. Please check your connection and try again.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Device revoked',
      one: 'Device revoked',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError => 'Couldn\'t sign out. Try again.';

  @override
  String get linkedDevicesUnknownOs => 'Unknown OS';

  @override
  String get linkedDevicesUnknownPlatform => 'Unknown Platform';

  @override
  String slowmodeLabel(String duration) {
    return '$duration slowmode';
  }

  @override
  String get slowmodeTooltipActive =>
      'You are in slowmode. Please wait before sending another message.';

  @override
  String get slowmodeTooltipImmune =>
      'Slowmode is enabled, but you are immune.';

  @override
  String get channelNoSendPermissionHint =>
      'You can\'t send messages in this channel.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'System announcements from $productName staff. You can\'t reply here.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Messaging is temporarily paused in this community.';

  @override
  String get channelComposerBarrierTimedOut =>
      'You\'re timed out. Messaging, reactions, and voice are paused until the timeout expires.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'You need to claim your account to send messages in this community.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'You need to verify your email to send messages in this community.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Your account is too new to send messages in this community.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'You haven\'t been a member of this community long enough to send messages.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'You need to verify a phone number to send messages in this community.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Verify email';

  @override
  String get channelComposerBarrierVerifyPhone => 'Verify phone';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Too many attachments (max $max)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'One or more files exceed the size limit';

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Those files are too large to send together';

  @override
  String get chatAttachmentDropToUpload => 'Drop files to upload';

  @override
  String get chatAttachmentDropToSend => 'Drop files to send now';

  @override
  String get chatAttachmentSendVoiceMessage => 'Send voice message';

  @override
  String get voiceMessageTitle => 'Voice message';

  @override
  String get voiceMessageHoldHint =>
      'Hold to record. Drag up to lock, or release to send.';

  @override
  String get voiceMessageDiscard => 'Discard voice message';

  @override
  String get voiceMessageSend => 'Send voice message';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Unable to start recording. Allow microphone access.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Voice recording is not supported on this device.';

  @override
  String get voiceMessageMicInUse =>
      'Leave the voice call to record a voice message.';

  @override
  String get voiceMessageRecordingFailed => 'Recording failed. Try again.';

  @override
  String get voiceMessageSendFailed =>
      'Unable to send voice message. Try again.';

  @override
  String get voiceMessageRecordingHint =>
      'Speak now. Press Stop when you are done — you can trim afterwards.';

  @override
  String get voiceMessageReviewHint =>
      'Drag the handles to trim, then press Send.';

  @override
  String get voiceMessageStop => 'Stop';

  @override
  String get voiceMessageStartRecording => 'Start recording';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Play';

  @override
  String get voiceMessagePause => 'Pause';

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

    return 'Selection must be at least ${secondsString}s.';
  }

  @override
  String get chatAttachmentEditTitle => 'Edit attachment';

  @override
  String get chatAttachmentFilenameLabel => 'Filename';

  @override
  String get chatAttachmentDescriptionLabel => 'Description';

  @override
  String get chatAttachmentDescriptionHint => 'Optional alt text';

  @override
  String get chatAttachmentSpoilerLabel => 'Mark as spoiler';

  @override
  String get chatAttachmentRemove => 'Remove attachment';

  @override
  String get chatAttachmentDownload => 'Download';

  @override
  String get chatAttachmentDownloadedToast => 'Saved to photos';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Couldn\'t download attachment';

  @override
  String get chatAttachmentExpiredTooltip => 'Attachment expired';

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
  String get chatAttachmentSourceGallery => 'Gallery';

  @override
  String get chatAttachmentSourceCamera => 'Camera';

  @override
  String get chatAttachmentSourceBrowse => 'Browse files';

  @override
  String get chatAttachmentPasteTooltip => 'Paste file from clipboard';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Reveal spoiler';

  @override
  String get matureMediaRevealButton => 'Reveal';

  @override
  String get matureMediaRevealHint => 'Click to reveal';

  @override
  String get matureContentTitle => 'Mature content';

  @override
  String get matureCommunityTitle => 'Mature community';

  @override
  String get matureCategoryTitle => 'Mature category';

  @override
  String get matureChannelTitle => 'Mature channel';

  @override
  String get communityContentWarningTitle => 'Community content warning';

  @override
  String get categoryContentWarningTitle => 'Category content warning';

  @override
  String get channelContentWarningTitle => 'Channel content warning';

  @override
  String get defaultContentWarningBody => 'This contains sensitive content.';

  @override
  String get matureCommunityBody =>
      'This community is marked for mature content and may contain material that may be inappropriate for some users.';

  @override
  String get matureCategoryBody =>
      'This category is marked for mature content and may contain material that may be inappropriate for some users.';

  @override
  String get matureChannelBody =>
      'This channel is marked for mature content and may contain material that may be inappropriate for some users.';

  @override
  String get matureVoiceChannelBody =>
      'This voice channel is marked for mature content and may contain material that may be inappropriate for some users.';

  @override
  String get matureLinkChannelBody =>
      'This link channel is marked for mature content and may open material that may be inappropriate for some users.';

  @override
  String get matureCommunityUnavailableBody =>
      'This mature community is not available to your account.';

  @override
  String get matureCategoryUnavailableBody =>
      'This mature category is not available to your account.';

  @override
  String get matureChannelUnavailableBody =>
      'This mature channel is not available to your account.';

  @override
  String get matureContentProceedButton => 'Proceed';

  @override
  String get matureContentUnderstandButton => 'I understand';

  @override
  String get matureContentOpenLinkButton => 'Open link';

  @override
  String get sensitiveContentSectionTitle => 'Sensitive content';

  @override
  String get sensitiveContentSectionDescription =>
      'Control how mature or sensitive media is filtered in different contexts';

  @override
  String get sensitiveContentFriendDmLabel => 'Direct messages from friends';

  @override
  String get sensitiveContentNonFriendDmLabel => 'Direct messages from others';

  @override
  String get sensitiveContentGuildLabel => 'Messages in community channels';

  @override
  String get sensitiveContentFilterShow => 'Show';

  @override
  String get sensitiveContentFilterBlur => 'Blur';

  @override
  String get sensitiveContentFilterBlock => 'Block';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Blur media until safety scan completes';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'When enabled, images and videos are blurred until the content safety scan finishes.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'This setting is always on for your account.';

  @override
  String get sensitiveContentResetButton => 'Reset';

  @override
  String get sensitiveContentSaveButton => 'Save';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count files',
      one: '1 file',
    );
    return 'Uploading $_temp0';
  }

  @override
  String get chatCancelUpload => 'Cancel upload';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Expires on $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Expires between $start and $end';
  }

  @override
  String get connectionsTitle => 'Connections';

  @override
  String get connectionsDescription =>
      'Link external accounts and domains to your Fluxer profile. Verified connections will be displayed on your profile for others to see.';

  @override
  String get connectionsEmptyTitle => 'No connections yet';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Link your Bluesky account or verify domain ownership to display them on your profile.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Verify domain ownership to display it on your profile.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Domain';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Add Bluesky connection';

  @override
  String get connectionsAddDomainAriaLabel => 'Add domain connection';

  @override
  String get connectionEdit => 'Edit';

  @override
  String get connectionRemove => 'Remove';

  @override
  String get connectionVerifiedLabel => 'This connection has been verified.';

  @override
  String get connectionUnverifiedLabel =>
      'This connection has not been verified.';

  @override
  String get connectionAddTitle => 'Add Connection';

  @override
  String get connectionTypeLabel => 'Connection Type';

  @override
  String get connectionHandleLabel => 'Handle';

  @override
  String get connectionDomainLabel => 'Domain';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'You already have this connection.';

  @override
  String get connectionConnectBluesky => 'Connect with Bluesky';

  @override
  String get connectionContinue => 'Continue';

  @override
  String get connectionVerifyTitle => 'Verify Connection';

  @override
  String get connectionVerifyInstructions =>
      'Use the record below to prove domain ownership.';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT record';

  @override
  String get connectionDnsHostLabel => 'Host';

  @override
  String get connectionDnsValueLabel => 'Value';

  @override
  String get connectionCopyHost => 'Copy host';

  @override
  String get connectionCopyValue => 'Copy value';

  @override
  String get connectionCopied => 'Copied!';

  @override
  String get connectionTokenFileTitle => 'Serve the token file';

  @override
  String get connectionTokenFileDescription =>
      'Download **fluxer-verification** and place it in your **.well-known** folder so we can validate the domain.';

  @override
  String get connectionTokenFileDownload => 'Download fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'The file contains the verification token we will fetch from **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Save fluxer-verification';

  @override
  String get connectionVerifyButton => 'Verify';

  @override
  String get connectionBack => 'Back';

  @override
  String get connectionEditTitle => 'Edit Connection';

  @override
  String get connectionEditDescription =>
      'Choose who can see this connection on your profile.';

  @override
  String get connectionVisibilityEveryone => 'Everyone';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Allow anyone to see this connection on your profile';

  @override
  String get connectionVisibilityFriends => 'Friends';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Allow your friends to see this connection';

  @override
  String get connectionVisibilityCommunityMembers => 'Community Members';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Allow members from communities you\'re in to see this connection';

  @override
  String get connectionRemoveTitle => 'Remove Connection';

  @override
  String get connectionRemoveDescription =>
      'Are you sure you want to remove this connection? This action cannot be undone.';

  @override
  String get connectionRemoveConfirm => 'Remove';

  @override
  String get connectionsLoadError => 'Failed to load connections';

  @override
  String get connectionsReorderError => 'Failed to update order';

  @override
  String get connectionInitiateFailed =>
      'Couldn\'t start verification. Try again.';

  @override
  String get connectionVerifyFailed =>
      'Couldn\'t verify. Check your DNS record and try again.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Couldn\'t start Bluesky authorization.';

  @override
  String get connectionUpdateFailed => 'Couldn\'t update connection';

  @override
  String get connectionRemoveFailed => 'Couldn\'t remove connection';

  @override
  String get connectionTokenSavedToast => 'Saved fluxer-verification';

  @override
  String get connectionTokenSaveFailedToast => 'Couldn\'t save file';

  @override
  String get connectionEnterHandle => 'Enter a Bluesky handle.';

  @override
  String get connectionEnterDomain => 'Enter a domain.';

  @override
  String get lookAndFeelTitle => 'Look & Feel';

  @override
  String get lookAndFeelThemeSectionTitle => 'Theme';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Choose between dark, coal, or light appearance.';

  @override
  String get lookAndFeelThemeDark => 'Dark Theme';

  @override
  String get lookAndFeelThemeCoal => 'Coal Theme';

  @override
  String get lookAndFeelThemeLight => 'Light Theme';

  @override
  String get lookAndFeelThemeSystem => 'System Theme';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Sync theme across devices';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'When enabled, theme changes will sync to all your devices. When disabled, this device will use its own theme setting.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'System theme automatically disables sync to track your system\'s preference on this device.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Couldn\'t sync theme to your account. Please try again.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Chat Font Scaling';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Adjust the font size in the chat area.';

  @override
  String get lookAndFeelInterfaceTitle => 'Interface';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Customize interface elements and behaviors.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Channel list typing indicators';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Choose how typing indicators appear in the channel list when someone is typing in a channel.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Typing Indicator + Avatars';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Show typing indicator with user avatars in the channel list';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Typing Indicator Only';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Show just the typing indicator without avatars';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Hidden';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Don\'t show typing indicators in the channel list';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Show typing on selected channel';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'When disabled (default), typing indicators won\'t appear on the channel you\'re currently viewing.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'general';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Keyboard Hints';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Control whether keyboard shortcut hints appear inside tooltips.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Hide keyboard hints in tooltips';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'When enabled, shortcut badges are hidden in tooltip popups.';

  @override
  String get lookAndFeelNekoTitle => 'Miscellaneous';

  @override
  String get lookAndFeelNekoDescription => 'Miscellaneous interface options.';

  @override
  String get lookAndFeelShowNekoLabel => 'Show Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'When enabled, Neko appears near the chat input bar.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle => 'Voice channel join behavior';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Control how you join voice channels in communities.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Require double-click to join voice channels';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'When enabled, you\'ll need to double-click on voice channels to join them. When disabled (default), single-clicking will join the channel immediately.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'The quick brown fox jumps over the lazy dog.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Guild sidebar';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Configure how the guild sidebar displays direct messages.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count communities are temporarily unavailable due to a flux capacitor malfunction.',
      one:
          '1 community is temporarily unavailable due to a flux capacitor malfunction.',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel => 'Collapse DMs Into Folder';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'When enabled, unread DMs in the guild sidebar are collapsed into a folder on the Fluxer button. Click the Fluxer button while on the DMs page to expand or collapse the folder.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Channel List';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Control unread indicator behavior for muted channels in channel lists.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Show unread indicator on muted channels';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'When enabled, muted channels show a faded unread indicator on the left side. Mentions still appear regardless of this setting.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Active Now';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Control how Active Now surfaces across the app.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Show Active Now on the home screen';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Show Active Now on the home screen to surface friends active in voice. You\'ll see a preview, the channel context, who\'s already there, and a quick way to join in.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Favorites';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Control the visibility of favorites throughout the app.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Enable Favorites';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'When enabled, you can favorite channels and they\'ll appear in the Favorites section. When disabled, all favorite-related UI elements (buttons, menu items) will be hidden. Your existing favorites will be preserved.';

  @override
  String get favoritesTitle => 'Favorites';

  @override
  String get favoritesEmptyTitle => 'No favorites yet';

  @override
  String get favoritesEmptyDescription =>
      'Star channels from the chat header to keep them here.';

  @override
  String get favoritesWelcomeTitle => 'Welcome to favorites';

  @override
  String get favoritesWelcomeDescription =>
      'Your personal space for quick access to channels, DMs, and groups you love. Press the star on any channel to add it here.';

  @override
  String get favoritesWelcomeTip => 'Not for you? Turn it off anytime.';

  @override
  String get favoritesDisableButton => 'Disable favorites';

  @override
  String get favoritesAddedToast => 'Added to Favorites';

  @override
  String get favoritesRemovedToast => 'Removed from Favorites';

  @override
  String get favoritesHiddenToast => 'Favorites hidden';

  @override
  String get favoritesMute => 'Mute favorites';

  @override
  String get favoritesUnmute => 'Unmute favorites';

  @override
  String get favoritesHeaderMenu => 'Favorites menu';

  @override
  String get favoritesCreateCategory => 'Create category';

  @override
  String get favoritesCategoryNameLabel => 'Category name';

  @override
  String get favoritesHideMutedChannels => 'Hide muted channels';

  @override
  String get favoritesShowMutedChannels => 'Show muted channels';

  @override
  String get favoritesSetNickname => 'Set nickname';

  @override
  String get favoritesNicknameLabel => 'Nickname';

  @override
  String get favoritesSaveNickname => 'Save nickname';

  @override
  String get favoritesMoveToCategory => 'Move to category';

  @override
  String get favoritesUncategorized => 'Uncategorized';

  @override
  String get favoritesOtherCategory => 'Other';

  @override
  String get favoritesRemoveFromFavorites => 'Remove from Favorites';

  @override
  String get favoritesAddToFavorites => 'Add to Favorites';

  @override
  String get favoritesHideConfirmTitle => 'Hide favorites';

  @override
  String get favoritesHideConfirmDescription =>
      'This will hide all favorites-related UI elements including buttons and menu items. Your existing favorites will be preserved and can be re-enabled anytime from Settings > Advanced > Appearance.';

  @override
  String get favoritesDirectMessageSubtitle => 'Direct Message';

  @override
  String get messagesMediaDisplayGroupTitle => 'Display';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Control how messages, media, and other content are displayed.';

  @override
  String get messagesMediaMediaGroupTitle => 'Media';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Customize media size preferences and buttons.';

  @override
  String get messagesMediaInputGroupTitle => 'Input';

  @override
  String get messagesMediaInputGroupDescription =>
      'Customize message input settings.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Sidebar';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Configure how the community sidebar is displayed.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Hide muted channels by default';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Automatically hide muted channels in the sidebar when you join new communities';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Hide muted channels by default?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'New communities you join will automatically have muted channels hidden. Would you also like to apply this setting to all your existing communities?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Stop hiding muted channels by default?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'New communities you join will no longer have muted channels hidden automatically. Would you also like to show muted channels in all your existing communities?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Apply to all communities';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Show in all communities';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'New communities only';

  @override
  String get messagesMediaDisplaySectionTitle => 'Media Display';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Control how images, videos and other media are shown. All media is resized and converted. Extremely large files that cannot be compressed into a preview will not embed regardless of these settings.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'When posted as links to chat';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'When uploaded directly to Fluxer';

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Link Previews';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Control how website links are previewed in chat';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Show embeds and preview website links';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reactions';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Configure emoji reactions on messages';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Show emoji reactions on messages';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Spoiler Content';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Control how spoiler content is displayed';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Show spoiler content';

  @override
  String get messagesMediaSpoilersOnClickName => 'On click';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Show spoiler content when clicked';

  @override
  String get messagesMediaSpoilersIfModeratorName => 'In channels I moderate';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Always show spoiler content in channels where you have the \"Manage Messages\" permission';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Always';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Always show spoiler content';

  @override
  String get messagesMediaSizeSectionTitle => 'Media Size Preferences';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Customize the maximum display size for embedded and attached media. Smaller sizes use less screen space, while larger sizes show more detail.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Media from links (embeds)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Uploaded attachments';

  @override
  String get messagesMediaSizeCompactName => 'Compact (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Smaller media size';

  @override
  String get messagesMediaSizeComfortableName => 'Comfortable (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Larger media size with more detail';

  @override
  String get messagesMediaGifsSectionTitle => 'GIF Behavior';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Control how GIFs are inserted into chat';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Automatically send GIFs when selected';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Expression autocomplete (colon autocomplete)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Control what appears in the expression autocomplete when you type colon. Customize what suggestions show up to match your preferences.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Show default emojis in expression autocomplete';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Show custom emojis in expression autocomplete';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Show stickers in expression autocomplete';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Show saved media in expression autocomplete';

  @override
  String get messagesMediaEditingSectionTitle => 'Message Editing';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Control what happens to your edit draft when you cancel.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Preserve edit draft on cancel';

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
  String get accessibilityDmMessagePreviewGroupTitle => 'DM message previews';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Control when message previews are shown in the DM list.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'DM message preview mode';

  @override
  String get accessibilityDmMessagePreviewAllName => 'All messages';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Show message previews for all DM conversations';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName => 'Unread DMs only';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Only show message previews for DMs with unread messages';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'None';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Don\'t show message previews in the DM list';

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
  String get dmListSentAnAttachment => 'Sent an attachment';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username pinned a message to this channel.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username added $userName to the group.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username added someone to the group.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username has left the group.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username removed $userName from the group.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username removed someone from the group.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username changed the channel name to $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username changed the channel name.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username changed the channel icon.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username started a call.';
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
  String get voiceConnectionConfirmTitle => 'Voice Connection Confirmation';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'You\'re already connected to this voice channel from $count other devices. What would you like to do?',
      one:
          'You\'re already connected to this voice channel from 1 other device. What would you like to do?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Switch to This Device';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Just Join (Keep Other Connections)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Do nothing, I don\'t want to join';

  @override
  String get voiceJoinFailedTitle => 'Couldn\'t Join Voice';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Couldn\'t disconnect your other devices. Try again in a moment.';

  @override
  String get voiceChannelEmptyDescription =>
      'This is a voice channel. Connect to start talking!';

  @override
  String get voiceChannelJoin => 'Join voice channel';

  @override
  String get voiceCallJoin => 'Join call';

  @override
  String get voiceChannelJoinConnect => 'Connect to Voice';

  @override
  String get voiceChannelNoConnectPermission =>
      'You don\'t have permission to join this voice channel';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Microphone, camera, and screen share content are end-to-end encrypted.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Microphone, camera, and screen share content are end-to-end encrypted.';

  @override
  String get voiceChannelE2eeBroken =>
      'End-to-end encryption is unavailable because an unsupported participant is in this voice channel.';

  @override
  String get voiceCallE2eeBroken =>
      'End-to-end encryption is unavailable because an unsupported participant is in this call.';

  @override
  String get voiceE2eeUpdateRequired =>
      'This client must be updated before joining this encrypted call.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Couldn\'t start your microphone. You\'re still in the call.';

  @override
  String get voiceChannelStatusConnecting => 'Connecting…';

  @override
  String get voiceChannelStatusConnected => 'Connected';

  @override
  String get voiceChannelStatusError => 'Error';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Mobile device';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Desktop device';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Community muted';

  @override
  String get voiceParticipantTooltipMuted => 'Muted';

  @override
  String get voiceParticipantTooltipCommunityDeafened => 'Community deafened';

  @override
  String get voiceParticipantTooltipDeafened => 'Deafened';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Connection: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count participants',
      one: '1 participant',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Leave';

  @override
  String get voiceControlMute => 'Mute';

  @override
  String get voiceControlUnmute => 'Unmute';

  @override
  String get voiceControlDeafen => 'Deafen';

  @override
  String get voiceControlUndeafen => 'Undeafen';

  @override
  String get voiceControlVideo => 'Video';

  @override
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'Screen share';

  @override
  String get voiceScreenShareNotificationText => 'Sharing your screen.';

  @override
  String get voiceControlMore => 'More';

  @override
  String get voiceControlDisconnect => 'Disconnect';

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
  String get voiceControlChat => 'Chat';

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
  String get voiceTextChatShow => 'Show chat';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# unread messages',
      one: '# unread message',
    );
    return 'Show chat with $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Camera permission is required for video.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Couldn\'t start screen sharing. Please try again.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Screen-sharing permission was denied.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Screen sharing isn\'t available on this device.';

  @override
  String get voiceWatchStream => 'Watch Stream';

  @override
  String get voiceStopWatching => 'Stop Watching';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Stop watching the current stream';

  @override
  String get voiceOwnScreenShareTitle => 'You are broadcasting';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Your stream is live for participants.';

  @override
  String get voiceLiveBadge => 'Live';

  @override
  String get dmVoiceViewCall => 'View call';

  @override
  String get dmVoiceCallFullScreen => 'Full screen';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Open call in full screen';

  @override
  String get dmVoiceStripStatusConnecting => 'Connecting…';

  @override
  String get dmVoiceStripStatusInCall => 'In call';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Voice call';

  @override
  String get dmVoiceCallBarConnecting => 'Connecting…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Direct call';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Group call';

  @override
  String get dmVoiceCallBarIssueFallback => 'Voice issue';

  @override
  String get dmVoiceFullscreenTitle => 'Voice';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Voice connected';

  @override
  String get notificationsPageTitle => 'Notifications';

  @override
  String get notificationsFilterUnreads => 'Unreads';

  @override
  String get notificationsFilterMentions => 'Mentions';

  @override
  String get notificationsBookmarksTooltip => 'Bookmarks';

  @override
  String get notificationsMentionFilterTooltip => 'Filter mentions';

  @override
  String get notificationsMentionFiltersTitle => 'Mention filters';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Include @everyone and @here mentions';

  @override
  String get notificationsMentionIncludeRoles => 'Include role mentions';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Include all community mentions';

  @override
  String get notificationsNoUnreadTitle => 'No Unread Messages';

  @override
  String get notificationsNoUnreadBody => 'You\'re all caught up.';

  @override
  String get notificationsNoMentionsTitle => 'No Recent Mentions';

  @override
  String get notificationsNoMentionsBody =>
      'All @mentions of you will appear here for 7 days.';

  @override
  String get notificationsMentionsEndTitle => 'You\'ve reached the end';

  @override
  String get notificationsMentionsEndBody =>
      'You\'ve seen all your recent mentions. Don\'t fret, more will appear here soon.';

  @override
  String get notificationsJump => 'Jump';

  @override
  String get notificationsRemoveMentionTooltip => 'Remove mention';

  @override
  String get notificationsViewAllUnread => 'View all unread';

  @override
  String get notificationsMarkAsRead => 'Mark as read';

  @override
  String get notificationsExpand => 'Expand';

  @override
  String get notificationsCollapse => 'Collapse';

  @override
  String get notificationsMessageUnavailable =>
      'This message couldn\'t be loaded.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining characters left';
  }

  @override
  String get characterCounterTooLong => 'Message is too long';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining characters left. Get $productName to write up to $premiumMaxLength characters.';
  }

  @override
  String get chatMessageFailedToSend => 'Failed to send message';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Your message could not be delivered. This is usually because you don\'t share a community with the recipient or the recipient is only accepting direct messages from friends. You may also need to adjust your own direct message privacy settings in $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Your message could not be delivered. You need to claim your account to send direct messages.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Your message could not be delivered. You need to claim your account to send messages.';

  @override
  String get chatSendFailureContentBlocked =>
      'Your message could not be delivered because it was flagged by our safety systems. If you believe this is a mistake, please contact support.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Your message could not be delivered because it contains mature emoji or stickers that are not allowed in this context.';

  @override
  String get chatClientSystemOnlyYouCanSee => 'Only you can see this message.';

  @override
  String get chatClientSystemDismiss => 'Dismiss';

  @override
  String get privacyDashboardCommunicationSection => 'Communication';

  @override
  String get chatMessageDeleteFailed => 'Delete Failed Message';

  @override
  String get chatMessageAddReaction => 'Add Reaction';

  @override
  String get chatMessageEdit => 'Edit Message';

  @override
  String get chatMessageReply => 'Reply';

  @override
  String get chatMessageForward => 'Forward';

  @override
  String get forwardMessageTitle => 'Forward message';

  @override
  String get forwardSearchHint => 'Search channels or DMs';

  @override
  String get forwardDirectMessagesSection => 'Direct Messages';

  @override
  String get forwardCommentHint => 'Add a comment (optional)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Send ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'No channels found';

  @override
  String get forwardSuccessToast => 'Message forwarded';

  @override
  String get forwardFailed => 'Failed to forward message';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Comments are unavailable because a selected channel has slowmode enabled.';

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
      'You can\'t send messages here';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'You can\'t embed links here';

  @override
  String get forwardDestinationNoAttachPermission =>
      'You can\'t attach files here';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Sending messages is disabled in this community';

  @override
  String get forwardDestinationTimedOut =>
      'You\'re on timeout in this community';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Slowmode - wait $remaining';
  }

  @override
  String get chatMessageCopyText => 'Copy Message';

  @override
  String get chatMessageSpeak => 'Speak message';

  @override
  String get chatMessageStopSpeaking => 'Stop speaking';

  @override
  String get chatMessagePin => 'Pin message';

  @override
  String get chatMessageUnpin => 'Unpin message';

  @override
  String get chatMessageUnpinIt => 'Unpin it';

  @override
  String get chatMessageBookmark => 'Bookmark Message';

  @override
  String get chatMessageRemoveBookmark => 'Remove Bookmark';

  @override
  String get chatMessageMarkAsUnread => 'Mark as Unread';

  @override
  String get chatMessageCopyMessageLink => 'Copy Message Link';

  @override
  String get chatMessageCopyMessageId => 'Copy Message ID';

  @override
  String get chatMessageViewReactions => 'View reactions';

  @override
  String get chatMessageRemoveAllReactions => 'Remove all reactions';

  @override
  String get chatMessageDebug => 'Debug Message';

  @override
  String get chatMessageDebugSheetTitle => 'Debug message';

  @override
  String get chatMessageDebugCopyJson => 'Copy JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'Message JSON copied to clipboard';

  @override
  String get chatReactionsSheetTitle => 'Reactions';

  @override
  String get chatReactionsSheetEmpty => 'Nobody has reacted with this yet.';

  @override
  String get chatReactionAddFailed => 'Failed to add reaction';

  @override
  String get chatReactionRemoveFailed => 'Failed to remove reaction';

  @override
  String get chatMessageReport => 'Report Message';

  @override
  String get iarReportMessageTitle => 'Report message';

  @override
  String get iarThisUserFallback => 'this user';

  @override
  String get iarModalDescription =>
      'Report a rule violation, or find tools to manage contact and preferences.';

  @override
  String get iarPathStepAriaLabel => 'What do you need?';

  @override
  String get iarCategoryStepTitle => 'What kind of rule was broken?';

  @override
  String get iarReasonStepTitle => 'Which rule was broken?';

  @override
  String get iarReasonSelectHint => 'Select a reason';

  @override
  String get iarPickAnOptionToast => 'Pick an option to continue.';

  @override
  String get iarPickARuleToast => 'Pick the rule that was broken.';

  @override
  String get iarPathPlatform => 'Report a platform rule violation';

  @override
  String get iarPathCommunity => 'Report to the moderators of this community';

  @override
  String get iarPathPreferenceMessage => 'I don\'t like this content';

  @override
  String get iarCategoryTargetedHarmLabel => 'Threats, harassment, or harm';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Bullying, threats, hate, violence, raids, or content that pushes self-harm.';

  @override
  String get iarCategorySafetyMinorsLabel => 'Child safety or mature content';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Minors at risk, mature content in the wrong place, or unwanted conduct.';

  @override
  String get iarCategoryPrivacyIdentityLabel => 'Privacy or impersonation';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxxing, stalking, pretending to be someone, or an inappropriate profile.';

  @override
  String get iarCategoryDeceptionLabel => 'Scams, malware, or misinformation';

  @override
  String get iarCategoryDeceptionDescription =>
      'Phishing, fraud, malicious links, or false claims likely to cause real-world harm.';

  @override
  String get iarCategoryIllegalOtherLabel =>
      'Illegal activity or something else';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Illegal sales, criminal facilitation, or a clear rule violation that doesn\'t fit above.';

  @override
  String get iarReasonHarassmentLabel => 'Harassment or threats';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Bullying, repeated unwanted contact, stalking, or targeted abuse.';

  @override
  String get iarReasonHateLabel => 'Hate speech';

  @override
  String get iarReasonHateMessageDescription =>
      'Slurs, dehumanizing language, or attacks on protected groups.';

  @override
  String get iarReasonViolenceLabel => 'Violence or violent threats';

  @override
  String get iarReasonViolenceDescription =>
      'Credible threats, graphic violence, or glorification of violence.';

  @override
  String get iarReasonMatureContentLabel => 'Mature content or harassment';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Unwanted conduct or mature content in the wrong place.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Child safety or exploitation of minors';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Grooming or child-exploitation content.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Harmful misinformation';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'False claims likely to cause real-world harm.';

  @override
  String get iarReasonSpamLabel => 'Spam, scams, or phishing';

  @override
  String get iarReasonSpamMessageDescription =>
      'Mass spam, fraud, fake giveaways, or account abuse.';

  @override
  String get iarReasonMalwareLabel => 'Malware or dangerous links';

  @override
  String get iarReasonMalwareDescription =>
      'Malware, credential theft, or harmful files.';

  @override
  String get iarReasonPrivacyLabel => 'Privacy violation';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxxing, exposed private info, or stalking.';

  @override
  String get iarReasonImpersonationLabel => 'Impersonation or deceptive media';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Pretending to be someone else, including deceptive AI-generated content.';

  @override
  String get iarReasonIllegalLabel => 'Illegal activity';

  @override
  String get iarReasonIllegalDescription =>
      'Illegal sales, criminal facilitation, or unlawful activity.';

  @override
  String get iarReasonSelfHarmLabel => 'Self-harm or suicide';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Promotion or instructions encouraging self-harm or eating disorders.';

  @override
  String get iarReasonOtherLabel => 'Another clear rule violation';

  @override
  String get iarReasonOtherDescription =>
      'Use only if it clearly breaks Fluxer\'s rules and doesn\'t fit above.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'If a minor is involved, use \"$childSafetyReason\" instead.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'If this involves CSAM or exploitation of a minor, send it now and don\'t reshare the material.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'If someone may be in immediate danger, contact local emergency services if you can do so safely.';

  @override
  String get iarSafetyNoteViolence =>
      'If this is a credible imminent threat, contact local emergency services too.';

  @override
  String get iarSafetyNoteTerrorism =>
      'If this is an imminent terrorist threat, contact local emergency services too.';

  @override
  String get iarActionBlockUserTitle => 'Block this user';

  @override
  String get iarActionBlockUserDescription =>
      'Stop messages and friend requests.';

  @override
  String get iarActionBlockUserButton => 'Block';

  @override
  String get iarActionCopyMessageLinkTitle => 'Copy message link';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Share with community mods.';

  @override
  String get iarActionCopyMessageLinkButton => 'Copy';

  @override
  String get iarActionCloseDmTitle => 'Close this DM';

  @override
  String get iarActionCloseDmDescription =>
      'Doesn\'t block. You can reopen later.';

  @override
  String get iarActionCloseDmButton => 'Close DM';

  @override
  String get iarActionLeaveCommunityTitle => 'Leave the community';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Stop seeing its content and members.';

  @override
  String get iarActionLeaveCommunityButton => 'Leave';

  @override
  String get iarActionDmSettingsTitle => 'DM & friend request settings';

  @override
  String get iarActionDmSettingsDescription => 'Change who can reach you.';

  @override
  String get iarActionCallSettingsTitle => 'Call & group chat settings';

  @override
  String get iarActionCallSettingsDescription =>
      'Change who can call or add you.';

  @override
  String get iarActionOpenButton => 'Open';

  @override
  String get iarActionDeleteMessageTitle => 'Delete this message';

  @override
  String get iarActionDeleteMessageDescription =>
      'Remove it from the channel for everyone.';

  @override
  String get iarActionDeleteMessageButton => 'Delete';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Deleted';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'This message has already been deleted.';

  @override
  String get iarActionBanUserTitle => 'Ban this user';

  @override
  String get iarActionBanUserDescription =>
      'Open the ban dialog for this community.';

  @override
  String get iarActionBanUserButton => 'Ban';

  @override
  String get iarActionBanUserBannedButton => 'Banned';

  @override
  String get iarActionBanUserBannedTooltip =>
      'This user is already banned from the community.';

  @override
  String get iarCloseDmConfirmTitle => 'Close DM';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Close your current DM with $name. This doesn\'t block them; you can reopen later.';
  }

  @override
  String get iarSuccessTitle => 'Report sent';

  @override
  String get iarSuccessBody =>
      'Our safety team is reviewing it. We\'ll send you a DM and email once we\'ve reached a verdict.';

  @override
  String get iarAlreadyReportedTitle => 'Already reported';

  @override
  String get iarAlreadyReportedBody =>
      'You\'ve already reported this message. Our safety team is reviewing it.';

  @override
  String get iarBackButton => 'Back';

  @override
  String get iarContinueButton => 'Continue';

  @override
  String get iarSendReportButton => 'Send report';

  @override
  String get iarDoneButton => 'Done';

  @override
  String get iarCouldntSendToast =>
      'Couldn\'t send the report. Please try again.';

  @override
  String get iarRateLimitedToast =>
      'You\'re reporting too quickly. Please wait a moment and try again.';

  @override
  String get iarReportSentToast =>
      'Report sent. Our safety team will review it.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Block $name? They won\'t be able to message you or send you friend requests. You can unblock them later.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Couldn\'t block this user. Please try again.';

  @override
  String get iarCloseDmSuccessToast => 'DM closed.';

  @override
  String get iarCloseDmFailedToast =>
      'Couldn\'t close this DM. Please try again.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Couldn\'t leave this community. Please try again.';

  @override
  String get chatMessageSuppressEmbeds => 'Suppress Embeds';

  @override
  String get chatMessageUnsuppressEmbeds => 'Unsuppress Embeds';

  @override
  String get chatMessageDelete => 'Delete Message';

  @override
  String get chatMessageDeleteConfirmTitle => 'Delete Message';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Are you sure you want to delete this message?';

  @override
  String get chatMessageDeleteAttachment => 'Delete Attachment';

  @override
  String get chatMessageEditAttachmentAltText => 'Edit Alt Text';

  @override
  String get chatMessageMore => 'More';

  @override
  String get chatEditingMessage => 'Editing message';

  @override
  String get chatReplyOriginalDeleted => 'Original message was deleted';

  @override
  String get chatReplyOriginalFailedToLoad => 'Original message failed to load';

  @override
  String get chatReplyAttachedMedia => 'Message contains attached media';

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
  String get chatMessagesLoadError => 'Couldn\'t load messages.';

  @override
  String get chatReplyMentionOverrideTitle => 'Override mention preference?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname prefers to be @mentioned on replies. Send without the mention anyway?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname prefers replies without an @mention. Send with the mention anyway?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ignore preference';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Click to disable pinging the user you\'re replying to.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Click to enable pinging the user you\'re replying to.';

  @override
  String get chatReplyMentionAccessibilityLabel => 'Mention replied user';

  @override
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

  @override
  String get chatReplyCancel => 'Cancel reply';

  @override
  String get chatEditMessageHint => 'Edit message';

  @override
  String get chatEditNoChanges => 'No changes to save';

  @override
  String get chatChannelNotReady =>
      'This channel is not ready yet. Try again in a moment.';

  @override
  String get chatMessageEdited => '(edited)';

  @override
  String get chatMessageSilent => 'This was a @silent message.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Today at $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Yesterday at $time';
  }

  @override
  String get mediaViewerImagePreview => 'Image preview';

  @override
  String get mediaViewerClose => 'Close media viewer';

  @override
  String get mediaViewerOpenInBrowser => 'Open in browser';

  @override
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

  @override
  String get mediaViewerForward => 'Forward';

  @override
  String get mediaViewerZoomIn => 'Zoom in';

  @override
  String get mediaViewerZoomOut => 'Zoom out';

  @override
  String get mediaViewerPreviousAttachment => 'Previous attachment';

  @override
  String get mediaViewerNextAttachment => 'Next attachment';

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
  String get chatAttachmentVideoToggleControls => 'Toggle video controls';

  @override
  String get chatAttachmentVideoMute => 'Mute video';

  @override
  String get chatAttachmentVideoUnmute => 'Unmute video';

  @override
  String get chatAttachmentVideoPlay => 'Play video';

  @override
  String get chatAttachmentVideoPause => 'Pause video';

  @override
  String get chatAttachmentVideoProgress => 'Video progress';

  @override
  String get chatVideoPlaybackFailed => 'Could not play this video.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Notify users with this role who have permission to view this channel.';

  @override
  String get addGuildModalTitle => 'Add a community';

  @override
  String get addGuildModalLandingDescription =>
      'Create a new community or join an existing one.';

  @override
  String get addGuildCreateCommunity => 'Create community';

  @override
  String get addGuildJoinCommunity => 'Join community';

  @override
  String get addGuildImportDiscordTemplate => 'Import Discord template';

  @override
  String get addGuildJoinTitle => 'Join a community';

  @override
  String get addGuildJoinDescription =>
      'Enter the invite link to join a community.';

  @override
  String get addGuildInviteLinkLabel => 'Invite link';

  @override
  String get addGuildJoinSubmit => 'Join community';

  @override
  String get addGuildInviteInvalid => 'This invite is invalid or has expired.';

  @override
  String get addGuildJoinFailed =>
      'Could not join community. Please try again.';

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
  String get addGuildPackInstalled => 'Pack installed successfully.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Remove All Reactions';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Are you sure you want to remove all reactions from this message?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Unpin message';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Send this pin back in time?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username pinned $messageLink to this channel. See $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'a message';

  @override
  String get systemPinMessageAllPinsLink => 'all pinned messages';

  @override
  String get channelPinsEmptyTitle => 'No pinned messages';

  @override
  String get channelPinsEmptyDescription => 'Pinned messages show up here.';

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
  String get personalNotesTitle => 'Personal notes';

  @override
  String get personalNotesSubtitle =>
      'Your private space for thoughts and reminders';

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
    return 'Welcome to $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'In the beginning, there was nothing. Then, there was $channelName. And it was good.';
  }

  @override
  String get personalNotesComposerHint => 'Message yourself';

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
  String get personalNotesPrivateSpace => 'Your private space';

  @override
  String get purgePersonalNotes => 'Purge personal notes';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'This will permanently delete every message and attachment in your personal notes. This cannot be undone.';

  @override
  String get purgePersonalNotesConfirmButton => 'Purge';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Purged $count messages from personal notes';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Personal notes were already empty';

  @override
  String get purgePersonalNotesFailed => 'Could not clear personal notes';

  @override
  String get userSettingsGroupYourAccount => 'YOUR ACCOUNT';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'Profile';

  @override
  String get userSettingsNavSecurityLogin => 'Security & Login';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Gifts & Codes';

  @override
  String get userSettingsNavPrivacyDashboard => 'Privacy Dashboard';

  @override
  String get userSettingsNavAuthorizedApps => 'Authorized Apps';

  @override
  String get userSettingsNavBlockedUsers => 'Blocked Users';

  @override
  String get userSettingsNavLinkedDevices => 'Linked Devices';

  @override
  String get userSettingsNavConnections => 'Connections';

  @override
  String get userSettingsNavLookAndFeel => 'Look & Feel';

  @override
  String get userSettingsNavAccessibility => 'Accessibility';

  @override
  String get userSettingsNavChat => 'Chat';

  @override
  String get userSettingsNavAudioAndVideo => 'Audio & Video';

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
  String get userSettingsNavLanguageAndTime => 'Language & Time';

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
  String get userSettingsNavAdvanced => 'Advanced';

  @override
  String get advancedPerformanceReportingTitle => 'Performance reporting';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Help improve Fluxer by sharing anonymous crash and performance data.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Send crash and performance reports';

  @override
  String get advancedPerformanceReportingDescription =>
      'All reported data is anonymous and is sent only to Fluxer\'s own monitoring service — no third-party providers are used.';

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
  String get advancedSettingShowNekoLabel => 'Show Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'Neko cat that chases your cursor';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Show Neko on your chat input';

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
  String get userSettingsNavApplications => 'Applications';

  @override
  String get userSettingsNavAppLogs => 'App Logs';

  @override
  String get userSettingsNavDeveloperTools => 'Developer Tools';

  @override
  String get userSettingsNavLimitsConfig => 'Limits Config';

  @override
  String get userSettingsNavFeatureFlags => 'Feature Flags';

  @override
  String get userSettingsNavWhatsNew => 'What\'s New';

  @override
  String get userSettingsNavLogOut => 'Log Out';

  @override
  String get quickSwitcherTabSearch => 'Search';

  @override
  String get quickSwitcherTabFriends => 'Friends';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Search for channels, people, or communities';

  @override
  String get quickSwitcherSearchFriends => 'Search friends';

  @override
  String get quickSwitcherNoMatchesFound => 'No matches found';

  @override
  String get quickSwitcherEmptyHint =>
      'Try a different name or use @ / # / ! / * prefixes to filter results.';

  @override
  String get quickSwitcherSectionPeople => 'People';

  @override
  String get quickSwitcherSectionGroupMessages => 'Group messages';

  @override
  String get quickSwitcherSectionTextChannels => 'Text channels';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Voice channels';

  @override
  String get quickSwitcherSectionCommunities => 'Communities';

  @override
  String get quickSwitcherSectionSettings => 'Settings';

  @override
  String get quickSwitcherHomeLabel => 'Home';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Direct Messages';

  @override
  String get quickSwitcherFavoritesLabel => 'Favorites';

  @override
  String get quickSwitcherUserSettingsLabel => 'User Settings';

  @override
  String get quickSwitcherNotificationsLabel => 'Notifications';

  @override
  String get quickSwitcherBookmarksLabel => 'Bookmarks';

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
  String get quickSwitcherMentionsLabel => 'Mentions';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'No friends yet';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Add a friend to get started.';

  @override
  String get quickSwitcherFriendsNoMatchTitle => 'No friends match that search';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Try a different name.';

  @override
  String get quickSwitcherSearchAliasUser => 'User';

  @override
  String get quickSwitcherSearchAliasYou => 'You';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'DMs';

  @override
  String get quickSwitcherSearchAliasMessages => 'Messages';

  @override
  String get quickSwitcherSearchAliasFav => 'Fav';

  @override
  String get quickSwitcherSearchAliasStarred => 'Starred';

  @override
  String get quickSwitcherSearchAliasInbox => 'Inbox';

  @override
  String get quickSwitcherSearchAliasSaved => 'Saved';

  @override
  String get uiClose => 'Close';

  @override
  String get chatJumpToBottom => 'Jump to bottom';

  @override
  String get uiConfirm => 'Confirm';

  @override
  String get uiLoading => 'Loading';

  @override
  String get uiUnsavedChanges => 'Unsaved changes';

  @override
  String get uiReset => 'Reset';

  @override
  String get uiOpenColorPicker => 'Open color picker';

  @override
  String get uiSelectPlaceholder => 'Select';

  @override
  String get uiSearchPlaceholder => 'Search';

  @override
  String get uiNoOptionsFound => 'No options found';

  @override
  String get uiDismissNotification => 'Dismiss notification';

  @override
  String get uiColorPickerTitle => 'Color picker';

  @override
  String get mentionConfirmTitle => 'Mention everyone?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'This will notify $count members. Continue?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'This will notify $count online members. Continue?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'This will notify $count members with the $roleName role. Continue?';
  }

  @override
  String get mentionConfirmButton => 'Mention';

  @override
  String get composerEmojiUnavailable => 'You can\'t use that emoji here.';

  @override
  String get instanceUrlLabel => 'Instance URL';

  @override
  String get instanceUrlPlaceholder => 'Enter instance URL (e.g. fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Reset to Fluxer';

  @override
  String get instanceConnect => 'Connect';

  @override
  String get instanceConnecting => 'Connecting…';

  @override
  String get instanceConnectFailed => 'Failed to connect to instance';

  @override
  String get recentInstances => 'Recent instances';

  @override
  String removeRecentInstance(String domain) {
    return 'Remove $domain from recent instances';
  }

  @override
  String get instanceSheetTitle => 'Connect to instance';

  @override
  String get connectToDifferentInstance => 'Connect to a different instance';

  @override
  String get changeInstance => 'Change';

  @override
  String get instanceConnectionRequired => 'Connect to the instance to sign in';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get guildNavbarDirectMessages => 'Direct Messages';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Explore Discoverable Communities';

  @override
  String get discoveryExplore => 'Explore';

  @override
  String get discoveryExplorePublicCommunities => 'Explore public communities';

  @override
  String get discoveryListingSubheading =>
      'Want to list your community on here? Apply if you meet the requirements in your community\'s settings > Discovery.';

  @override
  String get discoverySearchCommunities => 'Search communities';

  @override
  String get discoveryFilterByLanguage => 'Filter by language';

  @override
  String get discoveryAllLanguages => 'All languages';

  @override
  String get discoveryAllCategories => 'All';

  @override
  String get discoveryCategoryGaming => 'Gaming';

  @override
  String get discoveryCategoryMusic => 'Music';

  @override
  String get discoveryCategoryEntertainment => 'Entertainment';

  @override
  String get discoveryCategoryEducation => 'Education';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Science & Technology';

  @override
  String get discoveryCategoryContentCreator => 'Content Creator';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime & Manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Movies & TV';

  @override
  String get discoveryCategoryOther => 'Other';

  @override
  String get discoveryNoCommunitiesMatch => 'No communities match.';

  @override
  String get discoveryJoinCommunity => 'Join community';

  @override
  String get discoveryJoined => 'Joined';

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
      other: '$countString members',
      one: '1 member',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'No description.';

  @override
  String get discoveryCommunities => 'Communities';

  @override
  String get discoveryApps => 'Apps';

  @override
  String get discoveryJoinErrorGenericTitle => 'Couldn\'t join this community';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Something went wrong. Please try again in a moment.';

  @override
  String get discoveryJoinErrorFullTitle => 'This community is full';

  @override
  String get discoveryJoinErrorFullMessage =>
      'This community has reached its member limit, so you can\'t join right now.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'You\'ve reached the community limit';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'You\'re in the maximum number of communities. Leave one and try again.';

  @override
  String get discoveryJoinErrorBannedTitle => 'You can\'t join this community';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'You have been banned from this community.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'This community is no longer available';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'It may have left discovery or turned off new joins. Refresh the page and you won\'t see it again.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'You\'re going too fast';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Please wait a moment and try again.';

  @override
  String get guildNavbarAddCommunity => 'Add a Community';

  @override
  String get guildNavbarHelp => 'Help';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'NEW MESSAGE';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Collapse $folderName';
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
  String get guildNavbarGroupDm => 'Group DM';

  @override
  String get guildNavbarCreateChannel => 'Create channel';

  @override
  String get guildNavbarChannelType => 'Channel type';

  @override
  String get guildNavbarTextChannel => 'Text Channel';

  @override
  String get guildNavbarTextChannelDescription =>
      'Send messages, images, GIFs, and emoji';

  @override
  String get guildNavbarVoiceChannel => 'Voice Channel';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Hang out together with voice, video, and screen share';

  @override
  String get guildNavbarLinkChannel => 'Link Channel';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Quick access to an external website or resource';

  @override
  String get guildNavbarNameLabel => 'Name';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

  @override
  String get guildNavbarCreateCategory => 'Create category';

  @override
  String get guildNavbarNewCategoryHint => 'New category';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Invite friends to $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Recipients will be taken to #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Search friends';

  @override
  String get guildNavbarNoFriendsYet => 'No friends yet';

  @override
  String get guildNavbarNoResults => 'No results';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Or, send an invite link to a friend:';

  @override
  String get guildNavbarInviteLink => 'Invite link';

  @override
  String get guildNavbarCopy => 'Copy';

  @override
  String get guildNavbarCopied => 'Copied!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Your invite link expires in 7 days.';

  @override
  String get guildNavbarInviteNeverExpires => 'This invite link never expires.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Your invite link expires in $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Edit invite link';

  @override
  String get guildNavbarInviteLinkSettings => 'Invite link settings';

  @override
  String get guildNavbarExpireAfter => 'Expire After';

  @override
  String get guildNavbarMaxUses => 'Max Number of Uses';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Grant Temporary Membership';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Members will be removed when they go offline unless a role is assigned';

  @override
  String get guildNavbarCreateNewLink => 'Create New Link';

  @override
  String get guildNavbarSent => 'Sent';

  @override
  String get guildNavbarInvite => 'Invite';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Leave Community';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Are you sure you want to leave this community? You will no longer be able to see any messages.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Leave Community';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Delete your messages in this community?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Permanently delete every message you\'ve sent here, across every channel. Cannot be undone.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Delete My Messages';

  @override
  String get guildNavbarDeletedYourMessages => 'Deleted your messages';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Couldn\'t delete your messages';

  @override
  String get guildNavbarRemoveOverride => 'Remove override';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Muted until $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible =>
      'Only accessible to Fluxer staff';

  @override
  String get guildNavbarInvitesPaused =>
      'Invites are currently paused in this community';

  @override
  String get guildNavbarDurationNever => 'never';

  @override
  String get guildNavbarDuration30Minutes => '30 minutes';

  @override
  String get guildNavbarDuration1Hour => '1 hour';

  @override
  String get guildNavbarDuration6Hours => '6 hours';

  @override
  String get guildNavbarDuration12Hours => '12 hours';

  @override
  String get guildNavbarDuration1Day => '1 day';

  @override
  String get guildNavbarDuration7Days => '7 days';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count seconds';
  }

  @override
  String get guildNavbarNever => 'Never';

  @override
  String get guildNavbarNoLimit => 'No limit';

  @override
  String get guildNavbarOneUse => '1 use';

  @override
  String guildNavbarUses(int count) {
    return '$count uses';
  }

  @override
  String get guildMenuMarkAsRead => 'Mark as Read';

  @override
  String get guildPeekMoreOptions => 'More Options';

  @override
  String get guildMenuInviteMembers => 'Invite Members';

  @override
  String get guildMenuCommunitySettings => 'Community Settings';

  @override
  String get guildMenuEditCommunityProfile => 'Edit Community Profile';

  @override
  String get guildMenuUnmuteCommunity => 'Unmute Community';

  @override
  String get guildMenuMuteCommunity => 'Mute Community';

  @override
  String get guildMenuHideMutedChannels => 'Hide Muted Channels';

  @override
  String get guildMenuReportCommunity => 'Report Community';

  @override
  String get guildMenuDebugCommunity => 'Debug Community';

  @override
  String get guildMenuCopyCommunityId => 'Copy Community ID';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Until $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'General';

  @override
  String get guildMenuSettingsRoles => 'Roles & Permissions';

  @override
  String get guildMenuSettingsEmoji => 'Emoji';

  @override
  String get guildMenuSettingsStickers => 'Stickers';

  @override
  String get guildMenuSettingsSafetyModeration => 'Safety & Moderation';

  @override
  String get guildMenuSettingsActivityLog => 'Activity log';

  @override
  String get guildMenuSettingsWebhooks => 'Webhooks';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'Custom Invite URL';

  @override
  String get guildMenuSettingsDiscovery => 'Discovery';

  @override
  String get guildMenuSettingsMembers => 'Members';

  @override
  String get guildMenuSettingsInviteLinks => 'Invites';

  @override
  String get guildMenuSettingsBans => 'Bans';

  @override
  String get guildMenuSettingsChannels => 'Channels';

  @override
  String get guildSettingsNoPermission =>
      'You do not have permission to view this settings tab.';

  @override
  String get guildSettingsOverviewIconTitle => 'Icon';

  @override
  String get guildSettingsUploadImage => 'Upload Image';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Upload a banner for your server.';

  @override
  String get guildSettingsOverviewNameTitle => 'Name';

  @override
  String get guildSettingsOverviewNameHint => 'My awesome community';

  @override
  String get guildSettingsOverviewStatsTitle => 'Statistics';

  @override
  String get guildSettingsOverviewMembers => 'Members';

  @override
  String get guildSettingsOverviewOnline => 'Online';

  @override
  String get guildSettingsRolesDescription =>
      'Use roles to group members and assign permissions.';

  @override
  String get guildSettingsCreateRole => 'Create role';

  @override
  String get guildSettingsRolesListTitle => 'Roles';

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
    return '$staticCount static, $animatedCount animated emoji slots used';
  }

  @override
  String get guildSettingsEmojiEmpty => 'No custom emoji yet.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count stickers uploaded';
  }

  @override
  String get guildSettingsStickersEmpty => 'No custom stickers yet.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Member verification';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Choose what members must have before they can post or DM community members.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Members with roles can bypass these checks. For public spaces, we recommend enabling verification.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Communities listed in Discovery require at least verified email. None cannot be selected while Discovery is enabled.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Mature content & content warnings';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Configure mature content labeling and optional content warnings for members.';

  @override
  String get guildSettingsModerationMatureToggle => 'Mature content';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Mark this community as containing mature content.';

  @override
  String get guildSettingsVerificationNone => 'None';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'No verification is required.';

  @override
  String get guildSettingsVerificationLow => 'Low';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Requires a verified email address.';

  @override
  String get guildSettingsVerificationMedium => 'Medium';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Requires a verified email address, and an account that\'s at least 5 minutes old.';

  @override
  String get guildSettingsVerificationHigh => 'High';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Requires everything in medium, plus being a member of the community for at least 10 minutes.';

  @override
  String get guildSettingsVerificationHighest => 'Very high';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Requires a verified phone number.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Track moderator actions across the community.';

  @override
  String get guildSettingsAuditLogEmpty => 'No logs yet';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Moderation actions and community changes will appear here.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'All users';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'All actions';

  @override
  String get guildSettingsAuditLogNoReason => 'No reason was provided.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Unknown user';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Something went wrong while loading the activity log.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Unable to load activity logs';

  @override
  String get guildSettingsAuditLogReason => 'Reason';

  @override
  String get guildSettingsAuditLogSomeone => 'someone';

  @override
  String get guildSettingsAuditLogSomething => 'something';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'unknown entity';

  @override
  String get guildSettingsAuditLogNothing => 'nothing';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Unknown target';

  @override
  String get auditLogActionGuildUpdate => 'Community updated';

  @override
  String get auditLogActionChannelCreate => 'Channel created';

  @override
  String get auditLogActionChannelUpdate => 'Channel updated';

  @override
  String get auditLogActionChannelDelete => 'Channel deleted';

  @override
  String get auditLogActionChannelOverwriteCreate => 'Channel overwrite added';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Channel overwrite updated';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Channel overwrite removed';

  @override
  String get auditLogActionMemberKick => 'Member kicked';

  @override
  String get auditLogActionMemberPrune => 'Members pruned';

  @override
  String get auditLogActionMemberBanAdd => 'Member banned';

  @override
  String get auditLogActionMemberBanRemove => 'Member unbanned';

  @override
  String get auditLogActionMemberUpdate => 'Member updated';

  @override
  String get auditLogActionMemberRoleUpdate => 'Member roles updated';

  @override
  String get auditLogActionMemberMove => 'Member moved';

  @override
  String get auditLogActionMemberDisconnect => 'Member disconnected';

  @override
  String get auditLogActionBotAdd => 'Bot added';

  @override
  String get auditLogActionRoleCreate => 'Role created';

  @override
  String get auditLogActionRoleUpdate => 'Role updated';

  @override
  String get auditLogActionRoleDelete => 'Role deleted';

  @override
  String get auditLogActionInviteCreate => 'Invite created';

  @override
  String get auditLogActionInviteUpdate => 'Invite updated';

  @override
  String get auditLogActionInviteDelete => 'Invite deleted';

  @override
  String get auditLogActionWebhookCreate => 'Webhook created';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook updated';

  @override
  String get auditLogActionWebhookDelete => 'Webhook deleted';

  @override
  String get auditLogActionEmojiCreate => 'Emoji created';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji updated';

  @override
  String get auditLogActionEmojiDelete => 'Emoji deleted';

  @override
  String get auditLogActionStickerCreate => 'Sticker created';

  @override
  String get auditLogActionStickerUpdate => 'Sticker updated';

  @override
  String get auditLogActionStickerDelete => 'Sticker deleted';

  @override
  String get auditLogActionMessageDelete => 'Message deleted';

  @override
  String get auditLogActionMessageBulkDelete => 'Messages deleted';

  @override
  String get auditLogActionMessagePin => 'Message pinned';

  @override
  String get auditLogActionMessageUnpin => 'Message unpinned';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor updated the community settings.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor created the channel $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor updated the channel $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor deleted the channel $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor added channel permissions for $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor added channel permissions for $target in $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor updated channel permissions for $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor updated channel permissions for $target in $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor removed channel permissions for $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor removed channel permissions for $target in $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor kicked $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor banned $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor unbanned $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor updated $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor updated roles for $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor pruned inactive members.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor pruned members inactive for $days days.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor moved $target to another voice channel.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor moved $target to $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor disconnected $target from voice.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor added the bot $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor created the role $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor updated the role $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor deleted the role $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor created the invite $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor created the invite $target for $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor updated the invite $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor updated the invite $target for $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor deleted the invite $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor deleted the invite $target for $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor created the webhook $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor updated the webhook $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor deleted the webhook $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor added the emoji $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor updated the emoji $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor deleted the emoji $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor added the sticker $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor updated the sticker $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor deleted the sticker $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor deleted a message.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor deleted a message in $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor deleted multiple messages.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor deleted $count messages.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor deleted multiple messages in $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor deleted $count messages in $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor pinned a message.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor pinned a message in $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor unpinned a message.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor unpinned a message in $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor performed an audit action on $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Updated $field from $oldValue to $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Set $field to $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Cleared $field (was $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Updated $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Renamed the community to $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Updated the community icon.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Renamed the channel to $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Cleared the topic.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Updated the topic to $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent => 'Enabled mature content.';

  @override
  String get auditLogChangeDisabledMatureContent => 'Disabled mature content.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Set nickname to $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Removed nickname $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Muted the member.';

  @override
  String get auditLogChangeUnmutedMember => 'Unmuted the member.';

  @override
  String get auditLogChangeDeafenedMember => 'Deafened the member.';

  @override
  String get auditLogChangeUndeafenedMember => 'Undeafened the member.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Added $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Removed $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Channel: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Message: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Invited by $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Deleted # messages.',
      one: 'Deleted # message.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Removed # members.',
      one: 'Removed # member.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires => 'This invite never expires.';

  @override
  String get auditLogOptionTemporaryMembership =>
      'Grants temporary membership.';

  @override
  String get auditLogOptionPermanentMembership =>
      'Grants permanent membership.';

  @override
  String get guildSettingsLoadMore => 'Load more';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'View and manage every webhook configured across your community.';

  @override
  String get guildSettingsWebhooksEmpty => 'No webhooks';

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
  String get guildSettingsCopyUrl => 'Copy URL';

  @override
  String get guildSettingsCopiedUrl => 'URL copied to clipboard';

  @override
  String get guildSettingsDeleteWebhook => 'Delete webhook';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Set a custom invite link for your server.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Save';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Usage';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count uses';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'List your community in Discovery so others can find and join it.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Not enough members';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Your community needs at least $count members before it can be listed in Discovery.';
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
  String get guildSettingsDiscoveryCategory => 'Category';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Choose the category that best describes your community. You can change this any time.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Primary language';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'The language most of your community speaks. Used to filter Discovery results.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Description';

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
  String get guildSettingsDiscoveryTags => 'Custom tags';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Up to $maxTags tags help people find your community. They show up in Discovery search.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'Add a tag and press Enter';

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
  String get guildSettingsDiscoveryApply => 'Apply';

  @override
  String get guildSettingsDiscoverySave => 'Save';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Withdraw';

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
      'Search and manage server members.';

  @override
  String get guildSettingsMembersSearchHint => 'Search by username or ID';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count members';
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
  String get guildSettingsMembersSortNewest => 'Newest first';

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
      'View all invites for this community. To create a new invite, go to a channel and use the invite button.';

  @override
  String get guildSettingsInvitesEmpty => 'No invite links';

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
    return '$uses / $maxUses uses';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Expires $date';
  }

  @override
  String get guildSettingsBansDescription => 'View and manage banned users.';

  @override
  String get guildSettingsBansSearchHint => 'Search bans';

  @override
  String get guildSettingsBansEmpty => 'No banned users.';

  @override
  String get guildSettingsBanPermanent => 'Permanent ban';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Expires $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Expires';

  @override
  String get guildSettingsUnban => 'Unban';

  @override
  String get guildSettingsBansLoading => 'Loading banned users';

  @override
  String get guildSettingsBansNoSearchResults =>
      'No bans found matching your search.';

  @override
  String get guildSettingsBanDetailsTitle => 'Ban details';

  @override
  String get guildSettingsBanViewDetails => 'View details';

  @override
  String get guildSettingsBannedOn => 'Banned on';

  @override
  String get guildSettingsBannedBy => 'Banned by';

  @override
  String get guildSettingsRevokeBanTitle => 'Revoke ban';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Are you sure you want to revoke the ban for $displayName? They will be able to rejoin the community.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Revoked ban for $displayName';
  }

  @override
  String get guildSettingsBansLoadError => 'Couldn\'t load bans. Try again.';

  @override
  String get guildSettingsRevokeBanError => 'Couldn\'t revoke ban. Try again.';

  @override
  String get guildSettingsCommunitySettings => 'Community Settings';

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
      'Manage your community\'s profile, channels, and default settings.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Branding';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Update your icon, name, banner, and invite background';

  @override
  String get guildSettingsOverviewBannerUpload => 'Upload banner';

  @override
  String get guildSettingsOverviewIdleTitle => 'Idle settings';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Configure AFK channel and timeout';

  @override
  String get guildSettingsOverviewSystemTitle => 'System & welcome';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Choose destination for system and welcome messages';

  @override
  String get guildSettingsOverviewNotificationsTitle => 'Default notifications';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Communities with over 250 people are forced onto the \"mentions only\" setting. Your original setting is preserved and will be restored if the community drops below 250 members.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Advanced';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Allow flexible text channel names';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Hide community owner crown';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Detached banner';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Shows the banner in its own section below the community header.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Upload icon';

  @override
  String get guildSettingsOverviewRemoveImage => 'Remove';

  @override
  String get guildSettingsOverviewSplashTitle => 'Invite background';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'Chat embed background';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Shown in invite embeds in chat.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Upload background';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'No community banner';

  @override
  String get guildSettingsOverviewNoInviteBackground => 'No invite background';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Preview';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'See how your invite looks to visitors.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle => 'Text channel names';

  @override
  String get guildSettingsOverviewOwnerCrownTitle => 'Community owner crown';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Configure whether the crown icon is shown next to the community owner';

  @override
  String get guildSettingsSplashCardAlignment => 'Card alignment';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Center';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Left';

  @override
  String get guildSettingsSplashAlignmentRight => 'Right';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Only applies on wide screens.';

  @override
  String get permissionReadMessageHistory => 'Read message history';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Change what users without \"$permission\" can see';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Use a dedicated modal to set a message history threshold date for members who don\'t have the $permission permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Open message history threshold';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Message history threshold';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Enable message history threshold';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Threshold date';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Members without Read Message History can view messages sent after this date.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Message history threshold updated';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Allow capital letters and spaces in text channel names. Off restricts names to lowercase with hyphens and underscores.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Hides the crown icon next to the community owner across all surfaces.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Animated icons require the Animated Icon community feature.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Animated banners require the Animated Banner community feature.';

  @override
  String get guildSettingsAfkChannel => 'AFK / idle channel';

  @override
  String get guildSettingsAfkChannelHint =>
      'Move members to this channel when they\'re AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'No AFK channel';

  @override
  String get guildSettingsAfkTimeout => 'AFK timeout';

  @override
  String get guildSettingsAfkTimeout1Min => '1 minute';

  @override
  String get guildSettingsAfkTimeout5Min => '5 minutes';

  @override
  String get guildSettingsAfkTimeout15Min => '15 minutes';

  @override
  String get guildSettingsAfkTimeout30Min => '30 minutes';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 hour';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get guildSettingsSystemChannel => 'Destination channel';

  @override
  String get guildSettingsSystemChannelHint =>
      'Welcome and system messages will appear here.';

  @override
  String get guildSettingsNoSystemChannel => 'No system channel';

  @override
  String get guildSettingsHideJoinMessages => 'Hide join messages';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Suppresses join messages in the destination channel.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Default notification settings';

  @override
  String get guildSettingsNotificationsAll => 'All messages';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Notify on all messages';

  @override
  String get guildSettingsNotificationsMentions => 'Mentions only';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Notify only on mentions';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max 10MB. Minimum: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max 10MB. Minimum: 960×540px (16:9). Shown in invite embeds in chat.';

  @override
  String get guildSettingsModerationDescription =>
      'Configure verification, content filtering, and mature content settings.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Discovery-listed communities have restricted moderation options.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Content filtering';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Automatically screen messages for explicit content in channels not marked for mature content.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Communities listed in Discovery are required to scan all members. This setting cannot be changed while Discovery is enabled.';

  @override
  String get guildSettingsContentFilterOff => 'Off';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Let the community self-moderate';

  @override
  String get guildSettingsContentFilterNoRole => 'Filter members without roles';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Suggested for most communities';

  @override
  String get guildSettingsContentFilterAll => 'Filter everyone';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Maximum protection for family-friendly spaces';

  @override
  String get guildSettingsModerationMatureOff => 'Off';

  @override
  String get guildSettingsModerationMatureOn => 'On';

  @override
  String get guildSettingsContentWarningToggle => 'Show a content warning';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Toggles a consent prompt before entering any channel.';

  @override
  String get guildSettingsContentWarningText => 'Custom warning text';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'This contains sensitive content.';

  @override
  String get guildSettingsModeration2faTitle => '2FA requirement';

  @override
  String get guildSettingsModeration2faDescription =>
      'Require two-factor authentication for moderators before they can ban, kick, timeout, or remove messages.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Require 2FA for moderation actions';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Only the community owner can change this setting';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Enable 2FA on your account to change this setting';

  @override
  String get guildSettingsEmojiSearchHint => 'Search emojis';

  @override
  String get guildSettingsEmojiUploadTitle => 'Upload emoji';

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
    return 'Non-animated emoji ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Animated emoji ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Search stickers';

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
    return 'To create a webhook, open $channelSettingsPath. You can still edit and organize all existing webhooks here.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'Your vanity URL won\'t work unless at least one channel is visible to everyone.';

  @override
  String get guildSettingsVanityUrlRemove => 'Remove';

  @override
  String get guildSettingsBannedUsersTitle => 'Banned users';

  @override
  String get guildSettingsInvitesTableInviter => 'Inviter';

  @override
  String get guildSettingsInvitesTableChannel => 'Channel';

  @override
  String get guildSettingsInvitesTableCode => 'Code';

  @override
  String get guildSettingsInvitesTableUses => 'Uses';

  @override
  String get guildSettingsInvitesTableCreated => 'Created';

  @override
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filter by user';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filter by action';

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

/// The translations for English, as used in the United Kingdom (`en_GB`).
class FluxerLocalizationsEnGb extends FluxerLocalizationsEn {
  FluxerLocalizationsEnGb() : super('en_GB');

  @override
  String get reconnectingTitle => 'We fluxed up!';

  @override
  String get reconnectingBody =>
      'Something is wrong with the servers.\nShould be fixed in a second!';

  @override
  String get gatewayReconnectingToast => 'Reconnecting…';

  @override
  String get gatewayConnectedToast => 'Connected';

  @override
  String get sessionExpiredToast =>
      'Your session has expired. Please sign in again.';

  @override
  String splashStartupFailed(String error) {
    return 'Failed to start: $error';
  }

  @override
  String get retry => 'Retry';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Connection lost';

  @override
  String get splashViewOnStatusPage => 'View on status page';

  @override
  String get splashConnectionIssuesPrompt => 'Connection issues?';

  @override
  String get splashStatusPageLink => 'Status page';

  @override
  String get splashReadIncident => 'Read incident';

  @override
  String get splashIncidentHistory => 'Incident history';

  @override
  String get welcomeBack => 'Welcome back';

  @override
  String get email => 'Email';

  @override
  String get emailInvalid => 'Please enter a valid email address.';

  @override
  String get password => 'Password';

  @override
  String get forgotPassword => 'Forgot your password?';

  @override
  String get logIn => 'Log in';

  @override
  String get logInWithPasskey => 'Log in with a passkey';

  @override
  String continueWithSso(String provider) {
    return 'Continue with $provider';
  }

  @override
  String get ssoRequired => 'SSO is required to access this instance.';

  @override
  String get organizationSsoProvider =>
      'Sign in with your organisation\'s single sign-on provider.';

  @override
  String get failedToStartSso => 'Failed to start SSO';

  @override
  String get ssoCancelled => 'SSO login was cancelled';

  @override
  String preferSso(String provider) {
    return 'Prefer using SSO? Continue with $provider.';
  }

  @override
  String get logInViaBrowser => 'Log in via browser';

  @override
  String get needAccountPrompt => 'Need an account? ';

  @override
  String get register => 'Register';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Verify you\'re human';

  @override
  String get captchaDescription =>
      'We need to make sure you\'re not a bot. Please complete the verification below.';

  @override
  String get captchaSwitchToHcaptcha => 'Having issues? Try hCaptcha instead';

  @override
  String get captchaSwitchToTurnstile => 'Try Turnstile instead';

  @override
  String get cancel => 'Cancel';

  @override
  String get ipAuthCheckEmail => 'Check your email';

  @override
  String ipAuthDescription(String email) {
    return 'We emailed a link to authorise this login. Please open your inbox for $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Connection lost';

  @override
  String get ipAuthConnectionLostDescription =>
      'We lost the connection while waiting for authorisation. Please try again.';

  @override
  String get ipAuthLinkExpired => 'Sign-in link expired';

  @override
  String get ipAuthLinkExpiredDescription =>
      'This authorisation link expired. Please sign in again.';

  @override
  String get ipAuthResendEmail => 'Resend email';

  @override
  String get ipAuthResent => 'Resent';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Back';

  @override
  String get mfaTitle => 'Two-factor authentication';

  @override
  String get mfaChooseMethod => 'Choose a verification method';

  @override
  String get mfaMethodTotp => 'Authenticator App';

  @override
  String get mfaMethodWebauthn => 'Security Key / Passkey';

  @override
  String get mfaTotpDescription =>
      'Enter the 6-digit code from your authenticator app or one of your backup codes.';

  @override
  String get mfaCodeLabel => 'Code';

  @override
  String get mfaTryAnotherMethod => 'Try another method';

  @override
  String get mfaUseSecurityKey => 'Try security key / passkey instead';

  @override
  String get accountSelectorTitle => 'Choose an account';

  @override
  String get accountSelectorDescription =>
      'Select an account to continue, or add a different one.';

  @override
  String get accountAdd => 'Add an account';

  @override
  String get accountRemove => 'Remove';

  @override
  String accountRemoveTitle(String username) {
    return 'Remove $username';
  }

  @override
  String get accountRemoveDescription =>
      'This will remove the saved session for this account.';

  @override
  String get accountRemoveOnlyDescription =>
      'This will remove the only saved account on this device.';

  @override
  String get accountExpired => 'Expired';

  @override
  String accountSessionExpired(String identifier) {
    return 'Session expired for $identifier. Please log in again.';
  }

  @override
  String get accountManageTitle => 'Manage accounts';

  @override
  String get accountSwitchFailed => 'Couldn\'t switch accounts. Try again.';

  @override
  String get profileTabMenuSwitchAccounts => 'Switch accounts';

  @override
  String get statusChangeSheetTitle => 'Set status';

  @override
  String get statusOnlineStatusSection => 'Online status';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusIdle => 'Idle';

  @override
  String get statusDnd => 'Do not disturb';

  @override
  String get statusInvisible => 'Invisible';

  @override
  String get statusOffline => 'Offline';

  @override
  String get statusUntilIChangeIt => 'Until I change it';

  @override
  String get statusDontClear => 'Don\'t clear';

  @override
  String get statusFor10Seconds => 'For 10 seconds';

  @override
  String get statusClearAfter10Seconds => '10 seconds';

  @override
  String get statusClearAfter15Minutes => '15 minutes';

  @override
  String get statusClearAfter30Minutes => '30 minutes';

  @override
  String get statusClearAfter1Hour => '1 hour';

  @override
  String get statusClearAfter3Hours => '3 hours';

  @override
  String get statusClearAfter4Hours => '4 hours';

  @override
  String get statusClearAfter8Hours => '8 hours';

  @override
  String get statusClearAfter24Hours => '24 hours';

  @override
  String get statusClearAfter3Days => '3 days';

  @override
  String get statusDndDescription =>
      'You won\'t receive notifications on desktop';

  @override
  String get statusInvisibleDescription => 'You\'ll appear offline';

  @override
  String get customStatusSetTitle => 'Set custom status';

  @override
  String get customStatusCurrentHint => 'Custom status';

  @override
  String get customStatusClear => 'Clear custom status';

  @override
  String get customStatusPlaceholder => 'What\'s happening?';

  @override
  String get customStatusChooseEmoji => 'Choose an emoji';

  @override
  String get customStatusClearAfter => 'Clear after';

  @override
  String get customStatusSave => 'Save';

  @override
  String get accountActive => 'Active account';

  @override
  String get signOut => 'Sign out';

  @override
  String get suspendedPermanentTitle => 'Account Permanently Suspended';

  @override
  String get suspendedTemporaryTitle => 'Account Suspended';

  @override
  String get suspendedPermanentDescription =>
      'Your account has been permanently suspended for violating our Terms of Service.';

  @override
  String get suspendedTemporaryDescription =>
      'Your account has been temporarily suspended. You will be able to access your account once the suspension period ends.';

  @override
  String get suspendedIssuedAt => 'Issued';

  @override
  String get suspendedEndsAt => 'Ends';

  @override
  String get suspendedDuration => 'Duration';

  @override
  String get suspendedPermanent => 'Permanent';

  @override
  String get suspendedReason => 'Reason';

  @override
  String get suspendedAppealDeadline => 'Appeal Deadline';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Your account is scheduled for deletion on $date.';
  }

  @override
  String get suspendedRecheck => 'Check for Updates';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Check again in ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Back to Login';

  @override
  String get suspendedAppealTitle => 'Appeal';

  @override
  String get suspendedAppealHint =>
      'Explain why your suspension should be reconsidered (minimum 50 characters)...';

  @override
  String get suspendedAppealSubmit => 'Submit Appeal';

  @override
  String get suspendedAppealPending => 'Pending Review';

  @override
  String get suspendedAppealAccepted => 'Appeal Accepted';

  @override
  String get suspendedAppealRejected => 'Appeal Rejected';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Your appeal has been accepted and your account has been reinstated.';

  @override
  String get suspendedSignIn => 'Sign In to Your Account';

  @override
  String get forgotPasswordTitle => 'Forgot your password?';

  @override
  String get forgotPasswordDescription =>
      'Enter your email address and we\'ll send you a link to reset your password.';

  @override
  String get forgotPasswordSubmit => 'Send reset link';

  @override
  String get forgotPasswordSentTitle => 'Check your email';

  @override
  String get forgotPasswordSentDescription =>
      'We\'ve sent password reset instructions to your email address. Please check your inbox and follow the link to reset your password.';

  @override
  String get forgotPasswordBackToLogin => 'Return to login';

  @override
  String get resetPasswordTitle => 'Set new password';

  @override
  String get resetPasswordDescription =>
      'Enter your new password below to complete the reset process.';

  @override
  String get resetPasswordNewPassword => 'New password';

  @override
  String get resetPasswordConfirm => 'Confirm new password';

  @override
  String get resetPasswordSubmit => 'Reset password';

  @override
  String get resetPasswordMismatch => 'Passwords do not match.';

  @override
  String get registerTitle => 'Create an account';

  @override
  String get registerDisplayName => 'Display Name (Optional)';

  @override
  String get registerDisplayNameHint => 'What should people call you?';

  @override
  String get registerUsername => 'Username (Optional)';

  @override
  String get registerUsernameHint => 'Leave blank for a random username';

  @override
  String get registerUsernameTagHint =>
      'A 4-digit tag will be added automatically to ensure uniqueness';

  @override
  String get registerDateOfBirth => 'Date of birth';

  @override
  String get registerMonth => 'Month';

  @override
  String get registerDay => 'Day';

  @override
  String get registerYear => 'Year';

  @override
  String get registerConsent =>
      'I agree to the Terms of Service and Privacy Policy';

  @override
  String get registerConsentPrefix => 'I agree to the ';

  @override
  String get registerConsentTerms => 'Terms of Service';

  @override
  String get registerConsentAnd => ' and ';

  @override
  String get registerConsentPrivacy => 'Privacy Policy';

  @override
  String get registerConfirmPassword => 'Confirm Password';

  @override
  String get registerSubmit => 'Create account';

  @override
  String get registerHaveAccount => 'Already have an account? ';

  @override
  String get passkeyNoCredentials =>
      'No passkeys found for this app. Log in with email and password instead.';

  @override
  String get passkeyDeviceNotSupported =>
      'Passkeys are not supported on this device.';

  @override
  String get passkeyDomainNotAssociated =>
      'Passkeys are not configured for this app. Log in with email and password instead.';

  @override
  String get passkeyTimeout =>
      'Passkey authentication timed out. Please try again.';

  @override
  String get passkeyNotAvailable =>
      'Passkeys are not available for this app. Log in with email and password instead.';

  @override
  String get passkeyFailed =>
      'Passkey authentication failed. Please try again.';

  @override
  String get errorUnableToCreateAccount =>
      'Unable to create account. Please try again.';

  @override
  String get errorUnableToSignIn =>
      'Unable to sign in right now. Please try again.';

  @override
  String get errorInvalidEmailOrPassword => 'Invalid email or password.';

  @override
  String get errorUnableToSendResetLink =>
      'Unable to send reset link. Please try again.';

  @override
  String get errorUnableToResetPassword =>
      'Unable to reset password. Please try again.';

  @override
  String get embedInviteJoin => 'Join Community';

  @override
  String get embedInviteGoTo => 'Go to Community';

  @override
  String embedInviteOnline(String count) {
    return '$count Online';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count Members';
  }

  @override
  String get embedInviteUnknownTitle => 'Unknown Invite';

  @override
  String get embedInviteUnknownSubtitle => 'Try asking for a new invite.';

  @override
  String get embedInviteUnavailable => 'Invite Unavailable';

  @override
  String get inviteAcceptTitle => 'You\'ve been invited to join';

  @override
  String get inviteAcceptJoinButton => 'Join Community';

  @override
  String get inviteAcceptGoToButton => 'Go to Community';

  @override
  String get inviteAcceptInvitesPaused => 'Invites Paused';

  @override
  String get inviteAcceptNotFoundTitle => 'Invite Invalid';

  @override
  String get inviteAcceptNotFoundDescription =>
      'This invite may be expired or invalid.';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'Join group';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'You\'ve been invited to join a group DM by $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'someone';

  @override
  String get inviteAcceptEmojiPack => 'Emoji pack';

  @override
  String get inviteAcceptStickerPack => 'Sticker pack';

  @override
  String get inviteAcceptInstallEmojiPack => 'Install emoji pack';

  @override
  String get inviteAcceptInstallStickerPack => 'Install sticker pack';

  @override
  String get inviteAcceptPackInstallNote =>
      'Accepting this invite installs the pack automatically.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Channel Access Denied';

  @override
  String get channelAccessDeniedDescription =>
      'You do not have access to the channel where this message was sent.';

  @override
  String get messageJumpLinkNoAccess => 'No access';

  @override
  String get okay => 'Okay';

  @override
  String get embedThemeTitle => 'Shared theme';

  @override
  String get embedThemeSubtitle =>
      'This client doesn\'t support custom themes.';

  @override
  String get embedThemeUnavailableButton => 'Themes unavailable';

  @override
  String get privacySettings => 'Privacy Settings';

  @override
  String get privacyDirectMessages => 'Direct Messages';

  @override
  String get privacyDirectMessagesDescription =>
      'Allow direct messages from other members in this community';

  @override
  String get privacyBotDirectMessages => 'Bot Direct Messages';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Allow bots from this community to send you direct messages';

  @override
  String get privacyMutualDmsDisabled =>
      'The community admins have disabled receiving direct messages solely from mutual members in this community.';

  @override
  String get communityDebug => 'Community Debug';

  @override
  String get copiedToClipboard => 'Copied to clipboard';

  @override
  String get notificationSettings => 'Notification Settings';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Mute $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Muting a community prevents unread indicators and notifications from appearing unless you are mentioned';

  @override
  String get notificationCommunitySettings => 'Community Notification Settings';

  @override
  String get notificationAllMessages => 'All Messages';

  @override
  String get notificationOnlyMentions => 'Only Mentions';

  @override
  String get notificationNothing => 'Nothing';

  @override
  String get notificationSuppressEveryone => 'Suppress @everyone and @here';

  @override
  String get notificationSuppressRoles => 'Suppress All Role @mentions';

  @override
  String get notificationMobilePush => 'Mobile Push Notifications';

  @override
  String get notificationOverrides => 'Notification Overrides';

  @override
  String get notificationSelectChannel => 'Select a channel or category';

  @override
  String get notificationOnlyAtMentions => 'Only @mentions';

  @override
  String get notificationMuteChannel => 'Mute Channel';

  @override
  String get notificationUnmuteChannel => 'Unmute Channel';

  @override
  String get notificationNoCategory => 'No Category';

  @override
  String get dmMarkAsRead => 'Mark as Read';

  @override
  String get dmMuteConversation => 'Mute DM';

  @override
  String get dmUnmuteConversation => 'Unmute DM';

  @override
  String get dmPinDm => 'Pin DM';

  @override
  String get dmUnpinDm => 'Unpin DM';

  @override
  String get dmAlwaysShowInSidebar => 'Always Show in Sidebar';

  @override
  String get dmRemoveFromAlwaysShown => 'Remove from Always Shown';

  @override
  String get dmCloseDm => 'Close DM';

  @override
  String get dmCloseDmConfirmTitle => 'Close DM';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Are you sure you want to close your DM with $username? You can always reopen it later.';
  }

  @override
  String get dmCopyChannelId => 'Copy Channel ID';

  @override
  String get dmChannelIdCopied => 'Channel ID copied';

  @override
  String get dmCopyUserId => 'Copy User ID';

  @override
  String get dmUserIdCopied => 'User ID copied';

  @override
  String get dmViewProfile => 'View Profile';

  @override
  String get dmVoiceCall => 'Start Voice Call';

  @override
  String get incomingVoiceCallTitle => 'Incoming voice call';

  @override
  String get incomingVoiceCallAccept => 'Accept';

  @override
  String get incomingVoiceCallDecline => 'Reject';

  @override
  String get incomingVoiceCallLabel => 'Incoming call';

  @override
  String get incomingVoiceCallIgnore => 'Ignore';

  @override
  String get directVoiceCallNotEligible =>
      'This call can\'t be started right now. Try again in a moment.';

  @override
  String get voiceJoinCallFailed =>
      'Couldn\'t connect to this call. Check your connection and try again.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Couldn\'t join this call. Check your connection and try again.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Couldn\'t update this call on the server. Check your connection and try again.';

  @override
  String get dmAddNote => 'Add Note';

  @override
  String get dmEditGroup => 'Edit group';

  @override
  String get dmInviteToCommunity => 'Invite to Community';

  @override
  String get dmBlock => 'Block';

  @override
  String get dmLeaveGroup => 'Leave Group';

  @override
  String get dmNoCommunitiesAvailable => 'No communities available';

  @override
  String dmGroupMemberCount(int count) {
    return '$count Members';
  }

  @override
  String get dmMuteFor15Min => 'For 15 minutes';

  @override
  String get dmMuteFor30Min => 'For 30 minutes';

  @override
  String get dmMuteFor1Hour => 'For 1 hour';

  @override
  String get dmMuteFor3Hours => 'For 3 hours';

  @override
  String get dmMuteFor4Hours => 'For 4 hours';

  @override
  String get dmMuteFor8Hours => 'For 8 hours';

  @override
  String get dmMuteFor24Hours => 'For 24 hours';

  @override
  String get dmMuteFor3Days => 'For 3 days';

  @override
  String get dmMuteForever => 'Until I turn it back on';

  @override
  String get dmPinGroupDm => 'Pin Group DM';

  @override
  String get dmUnpinGroupDm => 'Unpin group DM';

  @override
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
  }

  @override
  String get dmFavoriteDm => 'Favorite DM';

  @override
  String get dmUnfavoriteDm => 'Unfavorite DM';

  @override
  String get dmFavoriteGroupDm => 'Favorite group DM';

  @override
  String get dmUnfavoriteGroupDm => 'Unfavorite group DM';

  @override
  String get dmChangeFriendNickname => 'Change friend nickname';

  @override
  String get dmRemoveFriend => 'Remove friend';

  @override
  String get dmAddFriend => 'Add friend';

  @override
  String get dmAcceptFriendRequest => 'Accept friend request';

  @override
  String get dmIgnoreFriendRequest => 'Ignore friend request';

  @override
  String get dmFriendRequestSent => 'Friend request sent';

  @override
  String get dmUnblock => 'Unblock';

  @override
  String get dmDebugUser => 'Debug user';

  @override
  String get dmDebugChannel => 'Debug channel';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => 'Pinned DM';

  @override
  String get dmUnpinned => 'Unpinned DM';

  @override
  String get dmMuted => 'Muted DM';

  @override
  String get dmUnmuted => 'Unmuted DM';

  @override
  String get dmRemoveFriendConfirmTitle => 'Remove friend';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Are you sure you want to remove $username as a friend?';
  }

  @override
  String get dmBlockConfirmTitle => 'Block user';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Are you sure you want to block $username? They won\'t be able to message you or send you friend requests.';
  }

  @override
  String get dmFriendRequestSentToast => 'Friend request sent';

  @override
  String get dmFriendRequestFailed => 'Failed to send friend request';

  @override
  String get dmAcceptFriendRequestFailed => 'Failed to accept friend request';

  @override
  String get dmRemoveFriendFailed => 'Failed to remove friend';

  @override
  String get dmBlockFailed => 'Failed to block user';

  @override
  String get dmUnblockFailed => 'Failed to unblock user';

  @override
  String get dmIgnoreFriendRequestFailed => 'Failed to ignore friend request';

  @override
  String get dmAddFriends => 'Add friends';

  @override
  String get addFriendSheetTitle => 'Add friend';

  @override
  String get addFriendUsernameHint => 'Username#0000';

  @override
  String get addFriendUsernameLabel => 'Friend\'s username';

  @override
  String get addFriendSendRequest => 'Send request';

  @override
  String get addFriendNoUserFound => 'No user found with that username.';

  @override
  String get addFriendInvalidUsername =>
      'Enter a valid username (Username#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Friend request sent';

  @override
  String get addFriendClaimTitle => 'Claim your account';

  @override
  String get addFriendClaimDescription =>
      'Claim your account to send friend requests.';

  @override
  String get addFriendVerifyTitle => 'Verify your email';

  @override
  String get addFriendVerifyDescription =>
      'You need to verify your email address before you can send friend requests.';

  @override
  String get addFriendVerifyEmail => 'Verify email';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Incoming friend requests ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Outgoing friend requests ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Incoming friend request';

  @override
  String get addFriendOutgoingStatus => 'Friend request sent';

  @override
  String get addFriendViewProfile => 'View profile';

  @override
  String get addFriendAccept => 'Accept';

  @override
  String get addFriendIgnore => 'Ignore';

  @override
  String get addFriendAcceptTitle => 'Accept friend request';

  @override
  String get addFriendIgnoreTitle => 'Ignore friend request';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Accept the friend request from $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Ignore the friend request from $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Cancel request';

  @override
  String get addFriendCancelRequestFailed =>
      'Couldn\'t cancel the friend request. Try again.';

  @override
  String get addFriendNotAcceptingRequests =>
      'They\'re not accepting friend requests right now.';

  @override
  String get addFriendUnblockFirst =>
      'Unblock them first to send a friend request.';

  @override
  String get addFriendCannotSendToSelf =>
      'You can\'t send a friend request to yourself.';

  @override
  String get addFriendAlreadyFriends =>
      'You\'re already friends with this user.';

  @override
  String get addFriendClaimToSend =>
      'Finish signing up to send friend requests.';

  @override
  String get addFriendSendFailedGeneric =>
      'Couldn\'t send the friend request. Try again.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'System';

  @override
  String get emojiSearchPlaceholder => 'Find the emoji of your dreams';

  @override
  String get emojiSearchEmpty => 'No emojis match your search';

  @override
  String get emojiAutocompleteDefaultLabel => 'Default emoji';

  @override
  String get emojiFrequentlyUsed => 'Frequently Used';

  @override
  String get emojiTabGifs => 'GIFs';

  @override
  String get emojiTabMedia => 'Media';

  @override
  String get emojiTabStickers => 'Stickers';

  @override
  String get emojiTabEmojis => 'Emojis';

  @override
  String get gifPickerSearch => 'Search GIFs';

  @override
  String get gifPickerSearchKlipy => 'Search KLIPY';

  @override
  String get gifPickerSearchTenor => 'Search Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Favorites';

  @override
  String get gifPickerTrending => 'Trending GIFs';

  @override
  String get gifPickerNoResultsTitle => 'No Search Results';

  @override
  String get gifPickerNoResultsDescription => 'Try another search term';

  @override
  String get gifPickerLoadFailedTitle => 'Couldn\'t load GIFs';

  @override
  String get gifPickerLoadFailedBody => 'Check your connection and try again.';

  @override
  String get emojiCategoryPeople => 'People';

  @override
  String get emojiCategoryNature => 'Nature';

  @override
  String get emojiCategoryFood => 'Food & Drink';

  @override
  String get emojiCategoryActivity => 'Activities';

  @override
  String get emojiCategoryTravel => 'Travel & Places';

  @override
  String get emojiCategoryObjects => 'Objects';

  @override
  String get emojiCategorySymbols => 'Symbols';

  @override
  String get emojiCategoryFlags => 'Flags';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Unlock $emojiCount from $communityCount with Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Get Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Don\'t show this again';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count custom emojis',
      one: '1 custom emoji',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count communities',
      one: '1 community',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'External Link Warning';

  @override
  String get externalLinkWarningLeaving => 'You are about to leave Fluxer';

  @override
  String get externalLinkWarningDescription =>
      'External links can be dangerous. Please be careful.';

  @override
  String get externalLinkWarningDestinationUrl => 'Destination URL:';

  @override
  String get externalLinksSectionTitle => 'External Links';

  @override
  String get externalLinksSectionDescription =>
      'Configure how external link warnings are handled.';

  @override
  String get externalLinkWarningTrustPrefix => 'Always trust ';

  @override
  String get externalLinkWarningTrustSuffix => ' — skip this warning next time';

  @override
  String get externalLinkVisitSite => 'Visit Site';

  @override
  String get externalLinkTrustAllLabel => 'Trust all external links';

  @override
  String get externalLinkStripTrackingLabel =>
      'Strip tracking parameters from URLs';

  @override
  String get externalLinkStripTrackingDescription =>
      'Automatically remove tracking parameters (like utm_source, fbclid, gclid) from URLs in messages you send. Cleans the link before it reaches anyone else.';

  @override
  String get externalLinkTrustAllConfirmTitle => 'Trust all external links?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'This will trust all external links and skip the warning for every domain. Your existing trusted domains will be replaced. This is less secure.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Trust All';

  @override
  String get externalLinkStopTrustingAllTitle => 'Stop trusting all links?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'External link warnings will be shown again. You will need to add trusted domains individually.';

  @override
  String get externalLinkStopTrustingAllAction => 'Disable Trust All';

  @override
  String get externalLinkTrustedAllDescription =>
      'All external links are trusted. Warnings will not be shown.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'You have $count trusted domain(s). Add more by checking the box when visiting external links.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'When enabled, no external link warnings will be shown. This is less secure.';

  @override
  String get imageFileTooLarge =>
      'Image file is too large. Please choose a file smaller than 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Animated avatars require Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Animated banners require Plutonium';

  @override
  String get animatedAvifNotSupported => 'Animated AVIF Not Supported';

  @override
  String get animatedAvifNotSupportedBody =>
      'Cropping and rotating animated AVIF files isn\'t supported yet. If you proceed, it will be uploaded in its original form.';

  @override
  String get uploadAsIs => 'Upload As-Is';

  @override
  String get croppingAnimatedNotSupported =>
      'Cropping animated images isn\'t supported yet. The original upload will be used.';

  @override
  String get cropAvatar => 'Crop Avatar';

  @override
  String get cropBanner => 'Crop Banner';

  @override
  String get skip => 'Skip';

  @override
  String get crop => 'Crop';

  @override
  String get changeYourFluxerTag => 'Change Your Username';

  @override
  String get fluxerTagInputLabel => 'Username';

  @override
  String get fluxerTagDescriptionBase =>
      'Usernames can only contain letters (a-z, A-Z), numbers (0-9), and underscores. Usernames are case-insensitive.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Usernames can only contain letters (a-z, A-Z), numbers (0-9), and underscores. Usernames are case-insensitive. You can pick any available 4-digit tag from #0000 to #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Usernames can only contain letters (a-z, A-Z), numbers (0-9), and underscores. Usernames are case-insensitive. You can pick any available 4-digit tag from #0001 to #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Between $min and $max characters';
  }

  @override
  String get validationAllowedChars =>
      'Letters (a-z, A-Z), numbers (0-9), and underscores (_) only';

  @override
  String get discriminatorPremiumTooltip =>
      'Get Plutonium to customise your tag or keep it when changing your username';

  @override
  String get fluxerTagAlreadyTaken => 'Username Already Taken';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'The username $username#$discriminator is already taken. Continuing will reroll your discriminator automatically.';
  }

  @override
  String get customTagIsTemporary => 'Custom Tag Is Temporary';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Your custom 4-digit tag is only available while your Plutonium subscription is active. When your subscription expires on $date, your tag will revert to a randomly assigned number after a 3-day grace period.';
  }

  @override
  String get customTagTemporaryBody =>
      'Your custom 4-digit tag is only available while your Plutonium subscription is active. When your subscription expires, your tag will revert to a randomly assigned number after a 3-day grace period.';

  @override
  String get iUnderstandContinue => 'I Understand, Continue';

  @override
  String get premiumWarningPendingDiscriminator =>
      'If you save this username, your custom 4-digit tag will revert to a random number when your Plutonium subscription ends. If your subscription fails to renew, you\'ll have a 3-day grace period before the tag changes.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Your custom 4-digit tag (#$discriminator) is active while your Plutonium subscription is active. If your subscription ends or fails to renew after a 3-day grace period, your tag will revert to a random number.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Customise your 4-digit tag or keep it when changing your username';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Your Plutonium trial expires on $date. Upgrade to keep your custom tag and earn a badge on your profile.';
  }

  @override
  String get premiumTrialActive =>
      'You\'re on a Plutonium trial. Upgrade to keep your custom tag and earn a badge on your profile.';

  @override
  String get fluxerTagUpdated => 'Username updated';

  @override
  String get fluxerTagUpdateFailed =>
      'Failed to update username. Please try again.';

  @override
  String get continueAction => 'Continue';

  @override
  String get profileCustomizationTitle => 'Profile Customisation';

  @override
  String get profileCustomizationDescription =>
      'Edit your profile appearance and see a live preview';

  @override
  String get usernameLabel => 'Username';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Claim your account to change your username';

  @override
  String get changeFluxerTag => 'Change Username';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Customize your 4-digit tag (#$discriminator) to your liking with Plutonium';
  }

  @override
  String get changeUsernameAndTagHint => 'Change your username and 4-digit tag';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Your custom tag (#$discriminator) is tied to your Plutonium subscription and will revert to a random tag if it expires.';
  }

  @override
  String get displayNameLabel => 'Display Name';

  @override
  String get pronounsLabel => 'Pronouns';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Change Avatar';

  @override
  String get removeAvatar => 'Remove Avatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Max 10MB. Recommended: 512×512px';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get changeBanner => 'Change Banner';

  @override
  String get removeBanner => 'Remove Banner';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Max 10MB. Minimum: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Accent Colour';

  @override
  String get accentColorDescription =>
      'Customises the border and banner colour on your profile';

  @override
  String get aboutMeLabel => 'About Me';

  @override
  String get aboutMeHelperText => 'You can use links, emoji, and Markdown.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle => 'Plutonium Badge Privacy';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Control how your Plutonium badge is displayed to others';

  @override
  String get hidePlutoniumBadgeLabel => 'Hide Plutonium badge entirely';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Completely hide your Plutonium badge from other users';

  @override
  String get hidePlutoniumPurchaseDate => 'Hide Plutonium purchase date';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Hide Plutonium purchase date ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Remove when you first bought Plutonium from your badge';

  @override
  String get maskVisionaryAsSubscription => 'Mask Visionary as subscription';

  @override
  String get maskVisionaryDescription =>
      'Show your Visionary as a regular subscription instead';

  @override
  String get hideVisionaryIdBadge => 'Hide Visionary ID badge';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Hide Visionary ID badge (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Remove your Visionary ID badge';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'You\'re on a Plutonium trial — your subscription starts on $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Your subscription will automatically begin when your trial ends. No action needed.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'You\'re on a Plutonium trial that expires on $date';
  }

  @override
  String get premiumTrialActiveProfile => 'You\'re on a Plutonium trial';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Max 10MB. Recommended: 512×512px. Animated avatars (GIF) require Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Customise your profile with a static or animated banner image to make it stand out.';

  @override
  String get getPlutonium => 'Get Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'In-app purchases are not available on this platform yet. Stay tuned — coming soon!';

  @override
  String get profilePreviewLabel => 'Preview';

  @override
  String get profilePreviewMessage => 'Message';

  @override
  String get profilePreviewMemberSince => 'Fluxer Member Since';

  @override
  String get unclaimedAccountTitle => 'Unclaimed Account';

  @override
  String get unclaimedAccountDescription =>
      'Your account is not yet claimed. Without an email and password, you could lose access. Claim your account now to secure it.';

  @override
  String get claimAccount => 'Claim Account';

  @override
  String get profileTypeLabel => 'Profile Type';

  @override
  String get profileTypeGlobal => 'Global Profile';

  @override
  String get profileTypeGuildDescription =>
      'You are editing your per-community profile. This profile will only be visible in this community and will override your global profile.';

  @override
  String get communityNicknameLabel => 'Community Nickname';

  @override
  String get perGuildPremiumUpsellText =>
      'Customising your avatar, banner, accent colour, and bio for individual communities requires Plutonium. Community nickname and pronouns are free for everyone.';

  @override
  String get avatarModeInherit => 'Use Global Profile';

  @override
  String get avatarModeCustom => 'Use Custom Image';

  @override
  String get avatarModeUnset => 'Don\'t Show';

  @override
  String get profileSavedToast => 'Profile updated';

  @override
  String get profileEditButton => 'Edit Profile';

  @override
  String get profileNoteLabel => 'Note';

  @override
  String get profileNoteVisibility => '(only visible to you)';

  @override
  String get profileNoteEmpty => 'No note yet.';

  @override
  String get sudoTitle => 'Verify Your Identity';

  @override
  String get sudoDescription =>
      'This action requires verification to continue.';

  @override
  String get sudoAuthenticatorCode => 'Authenticator Code';

  @override
  String get sudoMethodPassword => 'Password';

  @override
  String get sudoMethodTotp => 'Authenticator';

  @override
  String get sudoVerificationFailed => 'Verification failed. Please try again.';

  @override
  String get securityAccountTitle => 'Account';

  @override
  String get securityAccountDescription =>
      'Manage your email, password, and account settings';

  @override
  String get securitySectionTitle => 'Security';

  @override
  String get securitySectionDescription =>
      'Protect your account with two-factor authentication and passkeys';

  @override
  String get securityLoginEmailSectionTitle => 'Email Settings';

  @override
  String get securityLoginEmailSectionDescription =>
      'Manage the email address you use to sign in to Fluxer';

  @override
  String get securityLoginEmailAddressLabel => 'Email Address';

  @override
  String get securityLoginNoEmailSet => 'No email address set';

  @override
  String get securityLoginChangeEmail => 'Change Email';

  @override
  String get securityLoginAddEmail => 'Add Email';

  @override
  String get securityLoginReveal => 'Reveal';

  @override
  String get securityLoginHide => 'Hide';

  @override
  String get securityLoginPasswordSectionTitle => 'Password';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Change your password to keep your account secure';

  @override
  String get securityLoginCurrentPasswordLabel => 'Current Password';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Last changed: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Last changed: Never';

  @override
  String get securityLoginNoPasswordSet => 'No password set';

  @override
  String get securityLoginChangePassword => 'Change Password';

  @override
  String get securityLoginSetPassword => 'Set Password';

  @override
  String get passwordChangeTitle => 'Change Password';

  @override
  String get passwordChangeIntroDescription =>
      'We\'ll send a verification code to your email address to confirm your identity before changing your password.';

  @override
  String get passwordChangeStart => 'Start';

  @override
  String get passwordChangeVerifyTitle => 'Verify Your Email';

  @override
  String get passwordChangeVerifyDescription =>
      'Enter the verification code sent to your email address.';

  @override
  String get passwordChangeVerificationCode => 'Verification Code';

  @override
  String get passwordChangeVerify => 'Verify';

  @override
  String get passwordChangeNewPasswordTitle => 'Set New Password';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Enter your new password below.';

  @override
  String get passwordChangeNewPassword => 'New Password';

  @override
  String get passwordChangeConfirmPassword => 'Confirm New Password';

  @override
  String get passwordChangeSubmit => 'Change Password';

  @override
  String get passwordChangeSuccess => 'Password changed';

  @override
  String get passwordChangePasswordsDoNotMatch => 'Passwords do not match';

  @override
  String get passwordChangeInvalidCode => 'Invalid or expired code';

  @override
  String get emailChangeTitle => 'Change Email';

  @override
  String get emailChangeIntroDescription =>
      'We\'ll send verification codes to verify your identity before changing your email address.';

  @override
  String get emailChangeStart => 'Start';

  @override
  String get emailChangeVerifyOriginalTitle => 'Verify Current Email';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Enter the verification code sent to your current email address.';

  @override
  String get emailChangeNewEmailTitle => 'Enter New Email';

  @override
  String get emailChangeNewEmailDescription =>
      'Enter the new email address you\'d like to use.';

  @override
  String get emailChangeNewEmailLabel => 'New Email';

  @override
  String get emailChangeNewEmailSubmit => 'Send Verification Code';

  @override
  String get emailChangeVerifyNewTitle => 'Verify New Email';

  @override
  String get emailChangeVerifyNewDescription =>
      'Enter the verification code sent to your new email address.';

  @override
  String get emailChangeSuccess => 'Email changed';

  @override
  String get emailChangeInvalidCode => 'Invalid or expired code';

  @override
  String get resend => 'Resend';

  @override
  String resendCountdown(int seconds) {
    return 'Resend (${seconds}s)';
  }

  @override
  String get verificationCode => 'Verification Code';

  @override
  String get verify => 'Verify';

  @override
  String get enable => 'Enable';

  @override
  String get disable => 'Disable';

  @override
  String get delete => 'Delete';

  @override
  String get save => 'Save';

  @override
  String get securityTfaSectionTitle => 'Two-Factor Authentication';

  @override
  String get securityTfaSectionDescription =>
      'Add an extra layer of security to your account';

  @override
  String get securityTfaAuthenticatorApp => 'Authenticator App';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Two-factor authentication is enabled';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Use an authenticator app to generate codes for two-factor authentication';

  @override
  String get securityTfaBackupCodes => 'Backup Codes';

  @override
  String get securityTfaBackupCodesDescription =>
      'View and manage your backup codes for account recovery';

  @override
  String get securityTfaViewCodes => 'View Codes';

  @override
  String get securityPasskeysSectionTitle => 'Passkeys';

  @override
  String get securityPasskeysSectionDescription =>
      'Use passkeys for passwordless sign-in and two-factor authentication';

  @override
  String get securityPasskeysRegistered => 'Registered Passkeys';

  @override
  String get securityPasskeysNone => 'No passkeys registered';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'passkeys',
      one: 'passkey',
    );
    return '$count $_temp0 registered (max 10)';
  }

  @override
  String get securityPasskeysAdd => 'Add Passkey';

  @override
  String securityPasskeysAdded(String date) {
    return 'Added: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Last used: $date';
  }

  @override
  String get securityPasskeysRename => 'Rename';

  @override
  String get securityPasskeysDeleteTitle => 'Delete Passkey';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Are you sure you want to delete the passkey \"$name\"?';
  }

  @override
  String get securityPasskeyNameTitle => 'Name Passkey';

  @override
  String get securityPasskeyNameLabel => 'Passkey Name';

  @override
  String get securityPasskeyNameHint => 'e.g., YubiKey, iPhone, Work Computer';

  @override
  String get securityPhoneSectionTitle => 'Phone Number';

  @override
  String get securityPhoneSectionDescription => 'Manage your phone number.';

  @override
  String get securityPhoneLabel => 'Phone Number';

  @override
  String get securityPhoneNone => 'No phone number added.';

  @override
  String get securityPhoneAdd => 'Add Phone';

  @override
  String get securityPhoneRemove => 'Remove';

  @override
  String get securityPhoneRemoveTitle => 'Remove Phone Number';

  @override
  String get securityPhoneRemoveDescription =>
      'Are you sure you want to remove your phone number?';

  @override
  String get securityPhoneRemoved => 'Phone number removed';

  @override
  String get securityClaimTitle => 'Security Features';

  @override
  String get securityClaimDescription =>
      'Claim your account to access security features like two-factor authentication and passkeys.';

  @override
  String get securityVerifyEmailRequired =>
      'You must verify your email address before you can set up two-factor authentication, passkeys, or SMS verification.';

  @override
  String get totpEnableTitle => 'Setup Authenticator App';

  @override
  String get totpEnableDescription =>
      'Scan the QR code with your authenticator app to generate codes for two-factor authentication.';

  @override
  String get totpEnableCodeLabel => 'Code';

  @override
  String get totpEnableCodeHint =>
      'Enter the 6-digit code from your authenticator app';

  @override
  String get totpEnableSuccess => 'Two-factor authentication has been enabled';

  @override
  String get totpDisableTitle => 'Remove Authenticator App';

  @override
  String get totpDisableDescription =>
      'Enter the 6-digit code from your authenticator app to disable two-factor authentication.';

  @override
  String get totpDisableSuccess => 'Two-factor authentication disabled';

  @override
  String get backupCodesTitle => 'Backup Codes';

  @override
  String get backupCodesWarning =>
      'If you lose access to your authenticator app and don\'t have these codes, you will be permanently locked out of your account. Download or copy them now and store them somewhere safe.';

  @override
  String get backupCodesDownload => 'Download';

  @override
  String get backupCodesCopy => 'Copy';

  @override
  String get backupCodesCopied => 'Backup codes copied to clipboard';

  @override
  String get backupCodesAcknowledge =>
      'I have downloaded or copied my backup codes and stored them in a safe place.';

  @override
  String get backupCodesDone => 'Done';

  @override
  String get backupCodesViewTitle => 'View Backup Codes';

  @override
  String get backupCodesViewDescription =>
      'Verification may be required before viewing your backup codes.';

  @override
  String get phoneAddTitle => 'Add Phone Number';

  @override
  String get phoneAddLabel => 'Phone Number';

  @override
  String get phoneAddHint => 'Enter your phone number';

  @override
  String get phoneAddFooter =>
      'Enter your phone number. We\'ll send you a verification code via SMS.';

  @override
  String get phoneAddSendCode => 'Send Code';

  @override
  String get phoneVerifyTitle => 'Verify Phone Number';

  @override
  String get phoneVerifyDescription =>
      'Enter the verification code sent to your phone number.';

  @override
  String get phoneAddSuccess => 'Phone number added';

  @override
  String get dangerZoneSectionTitle => 'Danger Zone';

  @override
  String get dangerZoneSectionDescription =>
      'Irreversible and destructive actions';

  @override
  String get dangerZoneDisableTitle => 'Disable Account';

  @override
  String get dangerZoneDisableDescription =>
      'Temporarily disable your account. You can reactivate it later by signing back in.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Disabling your account will log you out of all sessions. You can re-enable your account at any time by logging in again.';

  @override
  String get dangerZoneDeleteTitle => 'Delete Account';

  @override
  String get dangerZoneDeleteDescription =>
      'Permanently delete your account and all associated data. This action cannot be undone.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Cancel your active Plutonium subscription in Plutonium settings before deleting your account.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'Cannot delete account';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'You cannot delete your account while you own communities. Transfer ownership of the following communities first:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'and $count more';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'To transfer ownership, go to $settingsPath and use the transfer ownership option.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Are you sure you want to delete your account? This action will schedule your account for permanent deletion.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'You can cancel the deletion process within 14 days';

  @override
  String get dangerZoneDeleteBullet2 =>
      'After 14 days, your account will be permanently deleted';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Once deletion is processed, you cannot recover access to your account';

  @override
  String get dangerZoneDeleteBullet4 =>
      'You will not be able to delete your sent messages after your account is deleted';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'If you want to export your data or delete your messages first, please visit the Privacy Dashboard section in User Settings before proceeding.';

  @override
  String get claimAccountTitle => 'Claim Your Account';

  @override
  String get claimAccountDescription =>
      'Claim your account by adding an email and password. We will send a verification code to confirm your email before finishing.';

  @override
  String get claimAccountEmailLabel => 'Email';

  @override
  String get claimAccountPasswordLabel => 'Password';

  @override
  String get claimAccountSendCode => 'Send Code';

  @override
  String get claimAccountVerifyDescription =>
      'Enter the code we sent to your email to verify it. Your password will be set once the code is confirmed.';

  @override
  String get claimAccountSuccess => 'Account claimed successfully';

  @override
  String get importantInformation => 'Important information:';

  @override
  String get genericError => 'An error occurred';

  @override
  String get invalidCode => 'Invalid code';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count years ago',
      one: '1 year ago',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count months ago',
      one: '1 month ago',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days ago',
      one: '1 day ago',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hours ago',
      one: '1 hour ago',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes ago',
      one: '1 minute ago',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'just now';

  @override
  String get authorizedAppsTitle => 'Authorized Applications';

  @override
  String get authorizedAppsDescription =>
      'These applications have been granted access to your Fluxer account.';

  @override
  String get authorizedAppsEmptyTitle => 'No Authorized Applications';

  @override
  String get authorizedAppsEmptyDescription =>
      'You haven\'t authorised any applications to access your account.';

  @override
  String get authorizedAppsLoadError =>
      'Failed to load authorised applications';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Authorised on $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Permissions granted';

  @override
  String get authorizedAppsRevoke => 'Revoke';

  @override
  String get authorizedAppsRevokeTitle => 'Revoke application access';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Are you sure you want to revoke access for $appName? This application will no longer have access to your account.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Access your basic profile information (username, avatar, etc.)';

  @override
  String get authorizedAppsScopeEmail => 'View your email address';

  @override
  String get authorizedAppsScopeGuilds =>
      'View the communities you are a member of';

  @override
  String get authorizedAppsScopeConnections => 'View your connected accounts';

  @override
  String get authorizedAppsScopeBot =>
      'Add a bot to a community with requested permissions';

  @override
  String get authorizedAppsScopeAdmin => 'Access administrative endpoints';

  @override
  String get privacyPendingDeletionTitle => 'Pending Deletion';

  @override
  String get blockedUsersTitle => 'Blocked Users';

  @override
  String get blockedUsersDescription =>
      'Blocked users can\'t send you friend requests or message you directly.';

  @override
  String get blockedUsersEmptyTitle => 'No Blocked Users';

  @override
  String get blockedUsersEmptyDescription => 'You haven\'t blocked anyone yet.';

  @override
  String get blockedUsersLoadError => 'Failed to load blocked users';

  @override
  String get blockedUsersUnblock => 'Unblock';

  @override
  String get blockedUsersUnblockTitle => 'Unblock User';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Are you sure you want to unblock $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Copy username';

  @override
  String get blockedUsersCopyId => 'Copy User ID';

  @override
  String get userProfileLoadError => 'Couldn\'t load profile';

  @override
  String get userProfileRetry => 'Retry';

  @override
  String get userProfileMessage => 'Message';

  @override
  String get userProfileVoiceCall => 'Voice Call';

  @override
  String get userProfileVideoCall => 'Video Call';

  @override
  String get userProfileEditProfile => 'Edit Profile';

  @override
  String get userProfileStaffBadgeTooltip => 'Fluxer Staff';

  @override
  String get userProfileCtpBadgeTooltip => 'Fluxer Community Team';

  @override
  String get userProfilePartnerBadgeTooltip => 'Fluxer Partner';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Fluxer Bug Hunter';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer Plutonium';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Fluxer Plutonium subscriber since $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Fluxer Visionary';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Fluxer Visionary since $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'Visionary ID #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Mutual Friends ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Mutual Communities ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Mutual Friends';

  @override
  String get userProfileMutualCommunitiesTitle => 'Mutual Communities';

  @override
  String get userProfileNoMutualFriends => 'No mutual friends found.';

  @override
  String get userProfileNoMutualCommunities => 'No mutual communities found.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Nickname: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Open DM';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'You blocked $username. You won\'t be able to send messages unless you unblock them.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Unblock';

  @override
  String get userProfileOpenDm => 'Open DM';

  @override
  String get userProfileNoteTitle => 'Note';

  @override
  String get userProfileNoteVisibility => '(only visible to you)';

  @override
  String get userProfileNoteSave => 'Save';

  @override
  String get userProfileNoteDelete => 'Delete';

  @override
  String get userProfileNoteEmpty => 'Click to add a note';

  @override
  String get userProfileMemberSince => 'Member Since';

  @override
  String get userProfileAboutMe => 'About Me';

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
  String get userProfileCopyUsername => 'Copy Username';

  @override
  String get userProfileCopyUserId => 'Copy User ID';

  @override
  String get userProfileViewMainProfile => 'View Main Profile';

  @override
  String get userProfileViewCommunityProfile => 'View Community Profile';

  @override
  String get userProfileBlockUser => 'Block User';

  @override
  String get userProfileUnblockUser => 'Unblock User';

  @override
  String get userProfileRemoveFriend => 'Remove Friend';

  @override
  String get userProfileBlockConfirmTitle => 'Block User';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Are you sure you want to block $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Unblock User';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Are you sure you want to unblock $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Remove Friend';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Are you sure you want to remove $username as a friend?';
  }

  @override
  String get userProfileFailedOpenDm => 'Failed to open DM';

  @override
  String get userProfileFailedSaveNote => 'Failed to save note';

  @override
  String get userProfileActionFailed => 'Action failed, please try again';

  @override
  String get userProfileChangeNickname => 'Change nickname';

  @override
  String get userProfileKick => 'Kick';

  @override
  String get userProfileBan => 'Ban';

  @override
  String get userProfileTimeout => 'Timeout';

  @override
  String get userProfileRemoveTimeout => 'Remove timeout';

  @override
  String get userProfileTransferOwnership => 'Transfer ownership';

  @override
  String get userProfileReportUser => 'Report user';

  @override
  String get userProfileReportMessage => 'Report message';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Kick $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Are you sure you want to kick $username? They can rejoin with a new invite.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Remove timeout?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Removing the timeout will allow $username to send messages, react, and join voice channels again.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Transfer ownership?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Transfer ownership of this community to $username? This is irreversible and you will lose all owner privileges.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Ban $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Ban duration';

  @override
  String get userProfileBanCustomSecondsLabel => 'Custom duration (seconds)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Any value from $min to $max seconds';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Delete message history';

  @override
  String get userProfileBanDeleteNone => 'Don\'t delete any';

  @override
  String get userProfileBanDelete24h => 'Previous 24 hours';

  @override
  String get userProfileBanDelete7d => 'Previous 7 days';

  @override
  String get userProfileBanReasonLabel => 'Reason (optional)';

  @override
  String get userProfileBanReasonHint => 'Enter a reason for the ban';

  @override
  String get userProfileBanSubmit => 'Ban member';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Timeout $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Timeout duration';

  @override
  String get userProfileTimeoutSubmit => 'Time out member';

  @override
  String get userProfileNicknameLabel => 'Nickname';

  @override
  String get userProfileNicknameHint => 'Enter a nickname';

  @override
  String get userProfileNicknameSave => 'Save';

  @override
  String userProfileKickSuccess(String username) {
    return 'Kicked $username';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Banned $username';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Timed out $username';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Removed timeout for $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Nickname updated';

  @override
  String get userProfileTransferSuccess => 'Ownership transferred';

  @override
  String get durationPermanent => 'Permanent';

  @override
  String get duration60Seconds => '60 seconds';

  @override
  String get duration5Minutes => '5 minutes';

  @override
  String get duration10Minutes => '10 minutes';

  @override
  String get duration1Hour => '1 hour';

  @override
  String get duration12Hours => '12 hours';

  @override
  String get duration1Day => '1 day';

  @override
  String get duration3Days => '3 days';

  @override
  String get duration5Days => '5 days';

  @override
  String get duration1Week => '1 week';

  @override
  String get duration2Weeks => '2 weeks';

  @override
  String get duration1Month => '1 month';

  @override
  String get durationCustom => 'Custom…';

  @override
  String get iarReportUserTitle => 'Report user';

  @override
  String get iarReportGuildTitle => 'Report community';

  @override
  String get iarReportGuildPreconfirmBody =>
      'If this report is about a specific message in this community, report that message instead. Message reports give our safety team the clearest context, and adding details in the comments can help us review it faster. Only continue with reporting the community as a whole if reporting a message would not capture the broader issue.';

  @override
  String get iarReasonInappropriateProfile => 'Inappropriate profile';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'This user\'s profile contains inappropriate content';

  @override
  String typingIndicatorOne(String name) {
    return '$name is typing...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 and $name2 are typing...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 and $name3 are typing...';
  }

  @override
  String get typingIndicatorMultiple => 'Several people are typing...';

  @override
  String get typingIndicatorHandful =>
      'A handful of keyboard warriors are assembling...';

  @override
  String get typingIndicatorSymphony =>
      'A symphony of clacking keys is underway...';

  @override
  String get typingIndicatorFiesta =>
      'It\'s a full-blown typing fiesta in here';

  @override
  String get typingIndicatorApocalypse => 'Whoa, it\'s a typing apocalypse';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Glad you\'re here, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Welcome, $username! Make yourself at home.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Hello, $username! Nice to have you here.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Hello, $username! Jump in whenever you\'re ready.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Hey $username, great to see you here!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Hey there, $username! Hope you enjoy your stay.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Hey, $username, welcome aboard!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Glad you made it, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Welcome in, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Welcome, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Welcome, $username! We\'re glad you\'re here.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Welcome, $username! Hope you enjoy your time here.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Welcome, $username! Your next conversation starts here.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Welcome, $username. We\'re happy to have you here.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Great to see you, $username! Welcome in.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'You\'re here, $username! Good to have you with us.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'You\'ve arrived, $username! Let\'s get started.';
  }

  @override
  String get relativeTimeShortNow => 'now';

  @override
  String relativeTimeShortMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}m',
      one: '1m',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}h',
      one: '1h',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}d',
      one: '1d',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}mo',
      one: '1mo',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}y',
      one: '1y',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'My Devices';

  @override
  String get linkedDevicesDescription =>
      'See all devices that are currently logged into your account. Revoke any sessions that you don\'t recognise.';

  @override
  String get linkedDevicesCurrentDevice => 'Current Device';

  @override
  String get linkedDevicesOtherDevices => 'Other Devices';

  @override
  String get linkedDevicesEnterSelection => 'Enter Selection Mode';

  @override
  String get linkedDevicesExitSelection => 'Exit Selection Mode';

  @override
  String get linkedDevicesSelectAll => 'Select All';

  @override
  String get linkedDevicesClearSelection => 'Clear Selection';

  @override
  String get linkedDevicesRevokeTooltip => 'Revoke device';

  @override
  String get linkedDevicesSignOutAll => 'Sign out all other devices';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sign out $count devices',
      one: 'Sign out 1 device',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sign out $count devices',
      one: 'Sign out 1 device',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle => 'Sign out all other devices';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'This will log out the selected devices from your account. You will need to log in again on those devices.',
      one:
          'This will log out the selected device from your account. You will need to log in again on that device.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'This will log out the selected devices from your account. You will need to log in again on those devices.';

  @override
  String get linkedDevicesSignOutConfirm => 'Continue';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'You\'ll have to log back in on all logged out devices';

  @override
  String get linkedDevicesLoadErrorTitle => 'Network Error';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'We\'re having trouble connecting to the space-time continuum. Please check your connection and try again.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Device revoked',
      one: 'Device revoked',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError => 'Couldn\'t sign out. Try again.';

  @override
  String get linkedDevicesUnknownOs => 'Unknown OS';

  @override
  String get linkedDevicesUnknownPlatform => 'Unknown Platform';

  @override
  String slowmodeLabel(String duration) {
    return '$duration slowmode';
  }

  @override
  String get slowmodeTooltipActive =>
      'You are in slowmode. Please wait before sending another message.';

  @override
  String get slowmodeTooltipImmune =>
      'Slowmode is enabled, but you are immune.';

  @override
  String get channelNoSendPermissionHint =>
      'You can\'t send messages in this channel.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'System announcements from $productName staff. You can\'t reply here.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Messaging is temporarily paused in this community.';

  @override
  String get channelComposerBarrierTimedOut =>
      'You\'re timed out. Messaging, reactions, and voice are paused until the timeout expires.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'You need to claim your account to send messages in this community.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'You need to verify your email to send messages in this community.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Your account is too new to send messages in this community.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'You haven\'t been a member of this community long enough to send messages.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'You need to verify a phone number to send messages in this community.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Verify email';

  @override
  String get channelComposerBarrierVerifyPhone => 'Verify phone';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Too many attachments (max $max)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'One or more files exceed the size limit';

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Those files are too large to send together';

  @override
  String get chatAttachmentDropToUpload => 'Drop files to upload';

  @override
  String get chatAttachmentDropToSend => 'Drop files to send now';

  @override
  String get chatAttachmentSendVoiceMessage => 'Send voice message';

  @override
  String get voiceMessageTitle => 'Voice message';

  @override
  String get voiceMessageHoldHint =>
      'Hold to record. Drag up to lock, or release to send.';

  @override
  String get voiceMessageDiscard => 'Discard voice message';

  @override
  String get voiceMessageSend => 'Send voice message';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Unable to start recording. Allow microphone access.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Voice recording is not supported on this device.';

  @override
  String get voiceMessageMicInUse =>
      'Leave the voice call to record a voice message.';

  @override
  String get voiceMessageRecordingFailed => 'Recording failed. Try again.';

  @override
  String get voiceMessageSendFailed =>
      'Unable to send voice message. Try again.';

  @override
  String get voiceMessageRecordingHint =>
      'Speak now. Press Stop when you are done — you can trim afterwards.';

  @override
  String get voiceMessageReviewHint =>
      'Drag the handles to trim, then press Send.';

  @override
  String get voiceMessageStop => 'Stop';

  @override
  String get voiceMessageStartRecording => 'Start recording';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Play';

  @override
  String get voiceMessagePause => 'Pause';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Selection must be at least ${secondsString}s.';
  }

  @override
  String get chatAttachmentEditTitle => 'Edit attachment';

  @override
  String get chatAttachmentFilenameLabel => 'Filename';

  @override
  String get chatAttachmentDescriptionLabel => 'Description';

  @override
  String get chatAttachmentDescriptionHint => 'Optional alt text';

  @override
  String get chatAttachmentSpoilerLabel => 'Mark as spoiler';

  @override
  String get chatAttachmentRemove => 'Remove attachment';

  @override
  String get chatAttachmentDownload => 'Download';

  @override
  String get chatAttachmentExpiredTooltip => 'Attachment expired';

  @override
  String get chatAttachmentSourceGallery => 'Gallery';

  @override
  String get chatAttachmentSourceCamera => 'Camera';

  @override
  String get chatAttachmentSourceBrowse => 'Browse files';

  @override
  String get chatAttachmentPasteTooltip => 'Paste image from clipboard';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Reveal spoiler';

  @override
  String get matureMediaRevealButton => 'Reveal';

  @override
  String get matureMediaRevealHint => 'Click to reveal';

  @override
  String get matureContentTitle => 'Mature content';

  @override
  String get matureCommunityTitle => 'Mature community';

  @override
  String get matureCategoryTitle => 'Mature category';

  @override
  String get matureChannelTitle => 'Mature channel';

  @override
  String get communityContentWarningTitle => 'Community content warning';

  @override
  String get categoryContentWarningTitle => 'Category content warning';

  @override
  String get channelContentWarningTitle => 'Channel content warning';

  @override
  String get defaultContentWarningBody => 'This contains sensitive content.';

  @override
  String get matureCommunityBody =>
      'This community is marked for mature content and may contain material that may be inappropriate for some users.';

  @override
  String get matureCategoryBody =>
      'This category is marked for mature content and may contain material that may be inappropriate for some users.';

  @override
  String get matureChannelBody =>
      'This channel is marked for mature content and may contain material that may be inappropriate for some users.';

  @override
  String get matureVoiceChannelBody =>
      'This voice channel is marked for mature content and may contain material that may be inappropriate for some users.';

  @override
  String get matureLinkChannelBody =>
      'This link channel is marked for mature content and may open material that may be inappropriate for some users.';

  @override
  String get matureCommunityUnavailableBody =>
      'This mature community is not available to your account.';

  @override
  String get matureCategoryUnavailableBody =>
      'This mature category is not available to your account.';

  @override
  String get matureChannelUnavailableBody =>
      'This mature channel is not available to your account.';

  @override
  String get matureContentProceedButton => 'Proceed';

  @override
  String get matureContentUnderstandButton => 'I understand';

  @override
  String get matureContentOpenLinkButton => 'Open link';

  @override
  String get sensitiveContentSectionTitle => 'Sensitive content';

  @override
  String get sensitiveContentSectionDescription =>
      'Control how mature or sensitive media is filtered in different contexts';

  @override
  String get sensitiveContentFriendDmLabel => 'Direct messages from friends';

  @override
  String get sensitiveContentNonFriendDmLabel => 'Direct messages from others';

  @override
  String get sensitiveContentGuildLabel => 'Messages in community channels';

  @override
  String get sensitiveContentFilterShow => 'Show';

  @override
  String get sensitiveContentFilterBlur => 'Blur';

  @override
  String get sensitiveContentFilterBlock => 'Block';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Blur media until safety scan completes';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'When enabled, images and videos are blurred until the content safety scan finishes.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'This setting is always on for your account.';

  @override
  String get sensitiveContentResetButton => 'Reset';

  @override
  String get sensitiveContentSaveButton => 'Save';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count files',
      one: '1 file',
    );
    return 'Uploading $_temp0';
  }

  @override
  String get chatCancelUpload => 'Cancel upload';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Expires on $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Expires between $start and $end';
  }

  @override
  String get connectionsTitle => 'Connections';

  @override
  String get connectionsDescription =>
      'Link external accounts and domains to your Fluxer profile. Verified connections will be displayed on your profile for others to see.';

  @override
  String get connectionsEmptyTitle => 'No connections yet';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Link your Bluesky account or verify domain ownership to display them on your profile.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Verify domain ownership to display it on your profile.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Domain';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Add Bluesky connection';

  @override
  String get connectionsAddDomainAriaLabel => 'Add domain connection';

  @override
  String get connectionEdit => 'Edit';

  @override
  String get connectionRemove => 'Remove';

  @override
  String get connectionVerifiedLabel => 'This connection has been verified.';

  @override
  String get connectionUnverifiedLabel =>
      'This connection has not been verified.';

  @override
  String get connectionAddTitle => 'Add Connection';

  @override
  String get connectionTypeLabel => 'Connection Type';

  @override
  String get connectionHandleLabel => 'Handle';

  @override
  String get connectionDomainLabel => 'Domain';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'You already have this connection.';

  @override
  String get connectionConnectBluesky => 'Connect with Bluesky';

  @override
  String get connectionContinue => 'Continue';

  @override
  String get connectionVerifyTitle => 'Verify Connection';

  @override
  String get connectionVerifyInstructions =>
      'Use the record below to prove domain ownership.';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT record';

  @override
  String get connectionDnsHostLabel => 'Host';

  @override
  String get connectionDnsValueLabel => 'Value';

  @override
  String get connectionCopyHost => 'Copy host';

  @override
  String get connectionCopyValue => 'Copy value';

  @override
  String get connectionCopied => 'Copied!';

  @override
  String get connectionTokenFileTitle => 'Serve the token file';

  @override
  String get connectionTokenFileDescription =>
      'Download **fluxer-verification** and place it in your **.well-known** folder so we can validate the domain.';

  @override
  String get connectionTokenFileDownload => 'Download fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'The file contains the verification token we will fetch from **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Save fluxer-verification';

  @override
  String get connectionVerifyButton => 'Verify';

  @override
  String get connectionBack => 'Back';

  @override
  String get connectionEditTitle => 'Edit Connection';

  @override
  String get connectionEditDescription =>
      'Choose who can see this connection on your profile.';

  @override
  String get connectionVisibilityEveryone => 'Everyone';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Allow anyone to see this connection on your profile';

  @override
  String get connectionVisibilityFriends => 'Friends';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Allow your friends to see this connection';

  @override
  String get connectionVisibilityCommunityMembers => 'Community Members';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Allow members from communities you\'re in to see this connection';

  @override
  String get connectionRemoveTitle => 'Remove Connection';

  @override
  String get connectionRemoveDescription =>
      'Are you sure you want to remove this connection? This action cannot be undone.';

  @override
  String get connectionRemoveConfirm => 'Remove';

  @override
  String get connectionsLoadError => 'Failed to load connections';

  @override
  String get connectionsReorderError => 'Failed to update order';

  @override
  String get connectionInitiateFailed =>
      'Couldn\'t start verification. Try again.';

  @override
  String get connectionVerifyFailed =>
      'Couldn\'t verify. Check your DNS record and try again.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Couldn\'t start Bluesky authorization.';

  @override
  String get connectionUpdateFailed => 'Couldn\'t update connection';

  @override
  String get connectionRemoveFailed => 'Couldn\'t remove connection';

  @override
  String get connectionTokenSavedToast => 'Saved fluxer-verification';

  @override
  String get connectionTokenSaveFailedToast => 'Couldn\'t save file';

  @override
  String get connectionEnterHandle => 'Enter a Bluesky handle.';

  @override
  String get connectionEnterDomain => 'Enter a domain.';

  @override
  String get lookAndFeelTitle => 'Look & Feel';

  @override
  String get lookAndFeelThemeSectionTitle => 'Theme';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Choose between dark, coal, or light appearance.';

  @override
  String get lookAndFeelThemeDark => 'Dark Theme';

  @override
  String get lookAndFeelThemeCoal => 'Coal Theme';

  @override
  String get lookAndFeelThemeLight => 'Light Theme';

  @override
  String get lookAndFeelThemeSystem => 'System Theme';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Sync theme across devices';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'When enabled, theme changes will sync to all your devices. When disabled, this device will use its own theme setting.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'System theme automatically disables sync to track your system\'s preference on this device.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Couldn\'t sync theme to your account. Please try again.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Chat Font Scaling';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Adjust the font size in the chat area.';

  @override
  String get lookAndFeelInterfaceTitle => 'Interface';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Customise interface elements and behaviours.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Channel list typing indicators';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Choose how typing indicators appear in the channel list when someone is typing in a channel.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Typing Indicator + Avatars';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Show typing indicator with user avatars in the channel list';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Typing Indicator Only';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Show just the typing indicator without avatars';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Hidden';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Don\'t show typing indicators in the channel list';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Show typing on selected channel';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'When disabled (default), typing indicators won\'t appear on the channel you\'re currently viewing.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'general';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Keyboard Hints';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Control whether keyboard shortcut hints appear inside tooltips.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Hide keyboard hints in tooltips';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'When enabled, shortcut badges are hidden in tooltip popups.';

  @override
  String get lookAndFeelNekoTitle => 'Miscellaneous';

  @override
  String get lookAndFeelNekoDescription => 'Miscellaneous interface options.';

  @override
  String get lookAndFeelShowNekoLabel => 'Show Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'When enabled, Neko appears near the chat input bar.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle => 'Voice channel join behaviour';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Control how you join voice channels in communities.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Require double-click to join voice channels';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'When enabled, you\'ll need to double-click on voice channels to join them. When disabled (default), single-clicking will join the channel immediately.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'The quick brown fox jumps over the lazy dog.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Guild sidebar';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Configure how the guild sidebar displays direct messages.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count communities are temporarily unavailable due to a flux capacitor malfunction.',
      one:
          '1 community is temporarily unavailable due to a flux capacitor malfunction.',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel => 'Collapse DMs Into Folder';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'When enabled, unread DMs in the guild sidebar are collapsed into a folder on the Fluxer button. Click the Fluxer button while on the DMs page to expand or collapse the folder.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Channel List';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Control unread indicator behaviour for muted channels in channel lists.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Show unread indicator on muted channels';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'When enabled, muted channels show a faded unread indicator on the left side. Mentions still appear regardless of this setting.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Active Now';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Control how Active Now surfaces across the app.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Show Active Now on the home screen';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Show Active Now on the home screen to surface friends active in voice. You\'ll see a preview, the channel context, who\'s already there, and a quick way to join in.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Favorites';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Control the visibility of favourites throughout the app.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Enable Favorites';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'When enabled, you can favourite channels and they\'ll appear in the Favorites section. When disabled, all favourite-related UI elements (buttons, menu items) will be hidden. Your existing favourites will be preserved.';

  @override
  String get favoritesTitle => 'Favorites';

  @override
  String get favoritesEmptyTitle => 'No favourites yet';

  @override
  String get favoritesEmptyDescription =>
      'Star channels from the chat header to keep them here.';

  @override
  String get favoritesWelcomeTitle => 'Welcome to favorites';

  @override
  String get favoritesWelcomeDescription =>
      'Your personal space for quick access to channels, DMs, and groups you love. Press the star on any channel to add it here.';

  @override
  String get favoritesWelcomeTip => 'Not for you? Turn it off anytime.';

  @override
  String get favoritesDisableButton => 'Disable favorites';

  @override
  String get favoritesAddedToast => 'Added to Favorites';

  @override
  String get favoritesRemovedToast => 'Removed from Favorites';

  @override
  String get favoritesHiddenToast => 'Favorites hidden';

  @override
  String get favoritesMute => 'Mute favorites';

  @override
  String get favoritesUnmute => 'Unmute favorites';

  @override
  String get favoritesHeaderMenu => 'Favorites menu';

  @override
  String get favoritesCreateCategory => 'Create category';

  @override
  String get favoritesCategoryNameLabel => 'Category name';

  @override
  String get favoritesHideMutedChannels => 'Hide muted channels';

  @override
  String get favoritesShowMutedChannels => 'Show muted channels';

  @override
  String get favoritesSetNickname => 'Set nickname';

  @override
  String get favoritesNicknameLabel => 'Nickname';

  @override
  String get favoritesSaveNickname => 'Save nickname';

  @override
  String get favoritesMoveToCategory => 'Move to category';

  @override
  String get favoritesUncategorized => 'Uncategorized';

  @override
  String get favoritesOtherCategory => 'Other';

  @override
  String get favoritesRemoveFromFavorites => 'Remove from Favorites';

  @override
  String get favoritesAddToFavorites => 'Add to Favorites';

  @override
  String get favoritesHideConfirmTitle => 'Hide favorites';

  @override
  String get favoritesHideConfirmDescription =>
      'This will hide all favorites-related UI elements including buttons and menu items. Your existing favorites will be preserved and can be re-enabled anytime from Settings > Advanced > Appearance.';

  @override
  String get favoritesDirectMessageSubtitle => 'Direct Message';

  @override
  String get messagesMediaDisplayGroupTitle => 'Display';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Control how messages, media, and other content are displayed.';

  @override
  String get messagesMediaMediaGroupTitle => 'Media';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Customise media size preferences and buttons.';

  @override
  String get messagesMediaInputGroupTitle => 'Input';

  @override
  String get messagesMediaInputGroupDescription =>
      'Customise message input settings.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Sidebar';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Configure how the community sidebar is displayed.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Hide muted channels by default';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Automatically hide muted channels in the sidebar when you join new communities';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Hide muted channels by default?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'New communities you join will automatically have muted channels hidden. Would you also like to apply this setting to all your existing communities?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Stop hiding muted channels by default?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'New communities you join will no longer have muted channels hidden automatically. Would you also like to show muted channels in all your existing communities?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Apply to all communities';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Show in all communities';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'New communities only';

  @override
  String get messagesMediaDisplaySectionTitle => 'Media Display';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Control how images, videos and other media are shown. All media is resized and converted. Extremely large files that cannot be compressed into a preview will not embed regardless of these settings.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'When posted as links to chat';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'When uploaded directly to Fluxer';

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Link Previews';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Control how website links are previewed in chat';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Show embeds and preview website links';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reactions';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Configure emoji reactions on messages';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Show emoji reactions on messages';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Spoiler Content';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Control how spoiler content is displayed';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Show spoiler content';

  @override
  String get messagesMediaSpoilersOnClickName => 'On click';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Show spoiler content when clicked';

  @override
  String get messagesMediaSpoilersIfModeratorName => 'In channels I moderate';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Always show spoiler content in channels where you have the \"Manage Messages\" permission';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Always';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Always show spoiler content';

  @override
  String get messagesMediaSizeSectionTitle => 'Media Size Preferences';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Customize the maximum display size for embedded and attached media. Smaller sizes use less screen space, while larger sizes show more detail.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Media from links (embeds)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Uploaded attachments';

  @override
  String get messagesMediaSizeCompactName => 'Compact (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Smaller media size';

  @override
  String get messagesMediaSizeComfortableName => 'Comfortable (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Larger media size with more detail';

  @override
  String get messagesMediaGifsSectionTitle => 'GIF Behaviour';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Control how GIFs are inserted into chat';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Automatically send GIFs when selected';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Expression autocomplete (colon autocomplete)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Control what appears in the expression autocomplete when you type colon. Customise what suggestions show up to match your preferences.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Show default emojis in expression autocomplete';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Show custom emojis in expression autocomplete';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Show stickers in expression autocomplete';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Show saved media in expression autocomplete';

  @override
  String get messagesMediaEditingSectionTitle => 'Message Editing';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Control what happens to your edit draft when you cancel.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Preserve edit draft on cancel';

  @override
  String get accessibilityDmMessagePreviewGroupTitle => 'DM message previews';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Control when message previews are shown in the DM list.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'DM message preview mode';

  @override
  String get accessibilityDmMessagePreviewAllName => 'All messages';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Show message previews for all DM conversations';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName => 'Unread DMs only';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Only show message previews for DMs with unread messages';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'None';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Don\'t show message previews in the DM list';

  @override
  String get dmListSentAnAttachment => 'Sent an attachment';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username pinned a message to this channel.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username added $userName to the group.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username added someone to the group.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username has left the group.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username removed $userName from the group.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username removed someone from the group.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username changed the channel name to $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username changed the channel name.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username changed the channel icon.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username started a call.';
  }

  @override
  String get voiceConnectionConfirmTitle => 'Voice Connection Confirmation';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'You\'re already connected to this voice channel from $count other devices. What would you like to do?',
      one:
          'You\'re already connected to this voice channel from 1 other device. What would you like to do?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Switch to This Device';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Just Join (Keep Other Connections)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Do nothing, I don\'t want to join';

  @override
  String get voiceChannelEmptyDescription =>
      'This is a voice channel. Connect to start talking!';

  @override
  String get voiceChannelJoin => 'Join Voice Channel';

  @override
  String get voiceChannelJoinConnect => 'Connect to Voice';

  @override
  String get voiceChannelNoConnectPermission =>
      'You don\'t have permission to join this voice channel';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Microphone, camera, and screen share content are end-to-end encrypted.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Microphone, camera, and screen share content are end-to-end encrypted.';

  @override
  String get voiceChannelE2eeBroken =>
      'End-to-end encryption is unavailable because an unsupported participant is in this voice channel.';

  @override
  String get voiceCallE2eeBroken =>
      'End-to-end encryption is unavailable because an unsupported participant is in this call.';

  @override
  String get voiceE2eeUpdateRequired =>
      'This client must be updated before joining this encrypted call.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Couldn\'t start your microphone. You\'re still in the call.';

  @override
  String get voiceChannelStatusConnecting => 'Connecting…';

  @override
  String get voiceChannelStatusConnected => 'Connected';

  @override
  String get voiceChannelStatusError => 'Error';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Mobile device';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Desktop device';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Community muted';

  @override
  String get voiceParticipantTooltipMuted => 'Muted';

  @override
  String get voiceParticipantTooltipCommunityDeafened => 'Community deafened';

  @override
  String get voiceParticipantTooltipDeafened => 'Deafened';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Connection: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count participants',
      one: '1 participant',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Leave';

  @override
  String get voiceControlMute => 'Mute';

  @override
  String get voiceControlUnmute => 'Unmute';

  @override
  String get voiceControlDeafen => 'Deafen';

  @override
  String get voiceControlUndeafen => 'Undeafen';

  @override
  String get voiceControlVideo => 'Video';

  @override
  String get voiceControlScreenShare => 'Screen share';

  @override
  String get voiceScreenShareNotificationText => 'Sharing your screen.';

  @override
  String get voiceControlMore => 'More';

  @override
  String get voiceControlDisconnect => 'Disconnect';

  @override
  String get voiceControlChat => 'Chat';

  @override
  String get voiceTextChatShow => 'Show chat';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# unread messages',
      one: '# unread message',
    );
    return 'Show chat with $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Camera permission is required for video.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Couldn\'t start screen sharing. Please try again.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Screen-sharing permission was denied.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Screen sharing isn\'t available on this device.';

  @override
  String get voiceWatchStream => 'Watch Stream';

  @override
  String get voiceStopWatching => 'Stop watching';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Stop watching the current stream';

  @override
  String get voiceOwnScreenShareTitle => 'You are broadcasting';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Your stream is live for participants.';

  @override
  String get voiceLiveBadge => 'Live';

  @override
  String get dmVoiceViewCall => 'View call';

  @override
  String get dmVoiceCallFullScreen => 'Full screen';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Open call in full screen';

  @override
  String get dmVoiceStripStatusConnecting => 'Connecting…';

  @override
  String get dmVoiceStripStatusInCall => 'In call';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Voice call';

  @override
  String get dmVoiceCallBarConnecting => 'Connecting…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Direct call';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Group call';

  @override
  String get dmVoiceCallBarIssueFallback => 'Voice issue';

  @override
  String get dmVoiceFullscreenTitle => 'Voice';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Voice connected';

  @override
  String get notificationsPageTitle => 'Notifications';

  @override
  String get notificationsFilterUnreads => 'Unreads';

  @override
  String get notificationsFilterMentions => 'Mentions';

  @override
  String get notificationsBookmarksTooltip => 'Bookmarks';

  @override
  String get notificationsMentionFilterTooltip => 'Filter mentions';

  @override
  String get notificationsMentionFiltersTitle => 'Mention filters';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Include @everyone and @here mentions';

  @override
  String get notificationsMentionIncludeRoles => 'Include role mentions';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Include all community mentions';

  @override
  String get notificationsNoUnreadTitle => 'No Unread Messages';

  @override
  String get notificationsNoUnreadBody => 'You\'re all caught up.';

  @override
  String get notificationsNoMentionsTitle => 'No Recent Mentions';

  @override
  String get notificationsNoMentionsBody =>
      'All @mentions of you will appear here for 7 days.';

  @override
  String get notificationsMentionsEndTitle => 'You\'ve reached the end';

  @override
  String get notificationsMentionsEndBody =>
      'You\'ve seen all your recent mentions. Don\'t fret, more will appear here soon.';

  @override
  String get notificationsJump => 'Jump';

  @override
  String get notificationsRemoveMentionTooltip => 'Remove mention';

  @override
  String get notificationsViewAllUnread => 'View all unread';

  @override
  String get notificationsMarkAsRead => 'Mark as read';

  @override
  String get notificationsExpand => 'Expand';

  @override
  String get notificationsCollapse => 'Collapse';

  @override
  String get notificationsMessageUnavailable =>
      'This message couldn\'t be loaded.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining characters left';
  }

  @override
  String get characterCounterTooLong => 'Message is too long';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining characters left. Get $productName to write up to $premiumMaxLength characters.';
  }

  @override
  String get chatMessageFailedToSend => 'Failed to send message';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Your message could not be delivered. This is usually because you don\'t share a community with the recipient or the recipient is only accepting direct messages from friends. You may also need to adjust your own direct message privacy settings in $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Your message could not be delivered. You need to claim your account to send direct messages.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Your message could not be delivered. You need to claim your account to send messages.';

  @override
  String get chatSendFailureContentBlocked =>
      'Your message could not be delivered because it was flagged by our safety systems. If you believe this is a mistake, please contact support.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Your message could not be delivered because it contains mature emoji or stickers that are not allowed in this context.';

  @override
  String get chatClientSystemOnlyYouCanSee => 'Only you can see this message.';

  @override
  String get chatClientSystemDismiss => 'Dismiss';

  @override
  String get privacyDashboardCommunicationSection => 'Communication';

  @override
  String get chatMessageDeleteFailed => 'Delete failed message';

  @override
  String get chatMessageAddReaction => 'Add reaction';

  @override
  String get chatMessageEdit => 'Edit message';

  @override
  String get chatMessageReply => 'Reply';

  @override
  String get chatMessageForward => 'Forward';

  @override
  String get forwardMessageTitle => 'Forward message';

  @override
  String get forwardSearchHint => 'Search channels or DMs';

  @override
  String get forwardDirectMessagesSection => 'Direct messages';

  @override
  String get forwardCommentHint => 'Add a comment (optional)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Send ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'No channels found';

  @override
  String get forwardSuccessToast => 'Message forwarded';

  @override
  String get forwardFailed => 'Failed to forward message';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Comments are unavailable because a selected channel has slowmode enabled.';

  @override
  String get forwardDestinationNoSendPermission =>
      'You can\'t send messages here';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'You can\'t embed links here';

  @override
  String get forwardDestinationNoAttachPermission =>
      'You can\'t attach files here';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Sending messages is disabled in this community';

  @override
  String get forwardDestinationTimedOut =>
      'You\'re on timeout in this community';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Slowmode - wait $remaining';
  }

  @override
  String get chatMessageCopyText => 'Copy message';

  @override
  String get chatMessagePin => 'Pin message';

  @override
  String get chatMessageUnpin => 'Unpin message';

  @override
  String get chatMessageUnpinIt => 'Unpin it';

  @override
  String get chatMessageBookmark => 'Bookmark message';

  @override
  String get chatMessageRemoveBookmark => 'Remove bookmark';

  @override
  String get chatMessageMarkAsUnread => 'Mark as unread';

  @override
  String get chatMessageCopyMessageLink => 'Copy message link';

  @override
  String get chatMessageCopyMessageId => 'Copy message ID';

  @override
  String get chatMessageViewReactions => 'View reactions';

  @override
  String get chatMessageRemoveAllReactions => 'Remove all reactions';

  @override
  String get chatMessageDebug => 'Debug message';

  @override
  String get chatMessageDebugSheetTitle => 'Debug message';

  @override
  String get chatMessageDebugCopyJson => 'Copy JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'Message JSON copied to clipboard';

  @override
  String get chatReactionsSheetTitle => 'Reactions';

  @override
  String get chatReactionsSheetEmpty => 'Nobody has reacted with this yet.';

  @override
  String get chatMessageReport => 'Report message';

  @override
  String get iarReportMessageTitle => 'Report message';

  @override
  String get iarThisUserFallback => 'this user';

  @override
  String get iarModalDescription =>
      'Report a rule violation, or find tools to manage contact and preferences.';

  @override
  String get iarPathStepAriaLabel => 'What do you need?';

  @override
  String get iarCategoryStepTitle => 'What kind of rule was broken?';

  @override
  String get iarReasonStepTitle => 'Which rule was broken?';

  @override
  String get iarReasonSelectHint => 'Select a reason';

  @override
  String get iarPickAnOptionToast => 'Pick an option to continue.';

  @override
  String get iarPickARuleToast => 'Pick the rule that was broken.';

  @override
  String get iarPathPlatform => 'Report a platform rule violation';

  @override
  String get iarPathCommunity => 'Report to the moderators of this community';

  @override
  String get iarPathPreferenceMessage => 'I don\'t like this content';

  @override
  String get iarCategoryTargetedHarmLabel => 'Threats, harassment, or harm';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Bullying, threats, hate, violence, raids, or content that pushes self-harm.';

  @override
  String get iarCategorySafetyMinorsLabel => 'Child safety or mature content';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Minors at risk, mature content in the wrong place, or unwanted conduct.';

  @override
  String get iarCategoryPrivacyIdentityLabel => 'Privacy or impersonation';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxxing, stalking, pretending to be someone, or an inappropriate profile.';

  @override
  String get iarCategoryDeceptionLabel => 'Scams, malware, or misinformation';

  @override
  String get iarCategoryDeceptionDescription =>
      'Phishing, fraud, malicious links, or false claims likely to cause real-world harm.';

  @override
  String get iarCategoryIllegalOtherLabel =>
      'Illegal activity or something else';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Illegal sales, criminal facilitation, or a clear rule violation that doesn\'t fit above.';

  @override
  String get iarReasonHarassmentLabel => 'Harassment or threats';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Bullying, repeated unwanted contact, stalking, or targeted abuse.';

  @override
  String get iarReasonHateLabel => 'Hate speech';

  @override
  String get iarReasonHateMessageDescription =>
      'Slurs, dehumanising language, or attacks on protected groups.';

  @override
  String get iarReasonViolenceLabel => 'Violence or violent threats';

  @override
  String get iarReasonViolenceDescription =>
      'Credible threats, graphic violence, or glorification of violence.';

  @override
  String get iarReasonMatureContentLabel => 'Mature content or harassment';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Unwanted conduct or mature content in the wrong place.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Child safety or exploitation of minors';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Grooming or child-exploitation content.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Harmful misinformation';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'False claims likely to cause real-world harm.';

  @override
  String get iarReasonSpamLabel => 'Spam, scams, or phishing';

  @override
  String get iarReasonSpamMessageDescription =>
      'Mass spam, fraud, fake giveaways, or account abuse.';

  @override
  String get iarReasonMalwareLabel => 'Malware or dangerous links';

  @override
  String get iarReasonMalwareDescription =>
      'Malware, credential theft, or harmful files.';

  @override
  String get iarReasonPrivacyLabel => 'Privacy violation';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxxing, exposed private info, or stalking.';

  @override
  String get iarReasonImpersonationLabel => 'Impersonation or deceptive media';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Pretending to be someone else, including deceptive AI-generated content.';

  @override
  String get iarReasonIllegalLabel => 'Illegal activity';

  @override
  String get iarReasonIllegalDescription =>
      'Illegal sales, criminal facilitation, or unlawful activity.';

  @override
  String get iarReasonSelfHarmLabel => 'Self-harm or suicide';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Promotion or instructions encouraging self-harm or eating disorders.';

  @override
  String get iarReasonOtherLabel => 'Another clear rule violation';

  @override
  String get iarReasonOtherDescription =>
      'Use only if it clearly breaks Fluxer\'s rules and doesn\'t fit above.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'If a minor is involved, use \"$childSafetyReason\" instead.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'If this involves CSAM or exploitation of a minor, send it now and don\'t reshare the material.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'If someone may be in immediate danger, contact local emergency services if you can do so safely.';

  @override
  String get iarSafetyNoteViolence =>
      'If this is a credible imminent threat, contact local emergency services too.';

  @override
  String get iarSafetyNoteTerrorism =>
      'If this is an imminent terrorist threat, contact local emergency services too.';

  @override
  String get iarActionBlockUserTitle => 'Block this user';

  @override
  String get iarActionBlockUserDescription =>
      'Stop messages and friend requests.';

  @override
  String get iarActionBlockUserButton => 'Block';

  @override
  String get iarActionCopyMessageLinkTitle => 'Copy message link';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Share with community mods.';

  @override
  String get iarActionCopyMessageLinkButton => 'Copy';

  @override
  String get iarActionCloseDmTitle => 'Close this DM';

  @override
  String get iarActionCloseDmDescription =>
      'Doesn\'t block. You can reopen later.';

  @override
  String get iarActionCloseDmButton => 'Close DM';

  @override
  String get iarActionLeaveCommunityTitle => 'Leave the community';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Stop seeing its content and members.';

  @override
  String get iarActionLeaveCommunityButton => 'Leave';

  @override
  String get iarActionDmSettingsTitle => 'DM & friend request settings';

  @override
  String get iarActionDmSettingsDescription => 'Change who can reach you.';

  @override
  String get iarActionCallSettingsTitle => 'Call & group chat settings';

  @override
  String get iarActionCallSettingsDescription =>
      'Change who can call or add you.';

  @override
  String get iarActionOpenButton => 'Open';

  @override
  String get iarActionDeleteMessageTitle => 'Delete this message';

  @override
  String get iarActionDeleteMessageDescription =>
      'Remove it from the channel for everyone.';

  @override
  String get iarActionDeleteMessageButton => 'Delete';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Deleted';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'This message has already been deleted.';

  @override
  String get iarActionBanUserTitle => 'Ban this user';

  @override
  String get iarActionBanUserDescription =>
      'Open the ban dialog for this community.';

  @override
  String get iarActionBanUserButton => 'Ban';

  @override
  String get iarActionBanUserBannedButton => 'Banned';

  @override
  String get iarActionBanUserBannedTooltip =>
      'This user is already banned from the community.';

  @override
  String get iarCloseDmConfirmTitle => 'Close DM';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Close your current DM with $name. This doesn\'t block them; you can reopen later.';
  }

  @override
  String get iarSuccessTitle => 'Report sent';

  @override
  String get iarSuccessBody =>
      'Our safety team is reviewing it. We\'ll send you a DM and email once we\'ve reached a verdict.';

  @override
  String get iarAlreadyReportedTitle => 'Already reported';

  @override
  String get iarAlreadyReportedBody =>
      'You\'ve already reported this message. Our safety team is reviewing it.';

  @override
  String get iarBackButton => 'Back';

  @override
  String get iarContinueButton => 'Continue';

  @override
  String get iarSendReportButton => 'Send report';

  @override
  String get iarDoneButton => 'Done';

  @override
  String get iarCouldntSendToast =>
      'Couldn\'t send the report. Please try again.';

  @override
  String get iarRateLimitedToast =>
      'You\'re reporting too quickly. Please wait a moment and try again.';

  @override
  String get iarReportSentToast =>
      'Report sent. Our safety team will review it.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Block $name? They won\'t be able to message you or send you friend requests. You can unblock them later.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Couldn\'t block this user. Please try again.';

  @override
  String get iarCloseDmSuccessToast => 'DM closed.';

  @override
  String get iarCloseDmFailedToast =>
      'Couldn\'t close this DM. Please try again.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Couldn\'t leave this community. Please try again.';

  @override
  String get chatMessageSuppressEmbeds => 'Suppress Embeds';

  @override
  String get chatMessageUnsuppressEmbeds => 'Unsuppress Embeds';

  @override
  String get chatMessageDelete => 'Delete Message';

  @override
  String get chatMessageDeleteConfirmTitle => 'Delete Message';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Are you sure you want to delete this message?';

  @override
  String get chatMessageMore => 'More';

  @override
  String get chatEditingMessage => 'Editing message';

  @override
  String get chatReplyOriginalDeleted => 'Original message was deleted';

  @override
  String get chatReplyOriginalFailedToLoad => 'Original message failed to load';

  @override
  String get chatReplyAttachedMedia => 'Message contains attached media';

  @override
  String get chatMessagesLoadError => 'Couldn\'t load messages.';

  @override
  String get chatReplyMentionOverrideTitle => 'Override mention preference?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname prefers to be @mentioned on replies. Send without the mention anyway?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname prefers replies without an @mention. Send with the mention anyway?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ignore preference';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Click to disable pinging the user you\'re replying to.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Click to enable pinging the user you\'re replying to.';

  @override
  String get chatReplyMentionAccessibilityLabel => 'Mention replied user';

  @override
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

  @override
  String get chatReplyCancel => 'Cancel reply';

  @override
  String get chatEditMessageHint => 'Edit message';

  @override
  String get chatEditNoChanges => 'No changes to save';

  @override
  String get chatChannelNotReady =>
      'This channel is not ready yet. Try again in a moment.';

  @override
  String get chatMessageEdited => '(edited)';

  @override
  String get chatMessageSilent => 'This was a @silent message.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Today at $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Yesterday at $time';
  }

  @override
  String get mediaViewerImagePreview => 'Image preview';

  @override
  String get mediaViewerClose => 'Close media viewer';

  @override
  String get mediaViewerOpenInBrowser => 'Open in browser';

  @override
  String get mediaViewerForward => 'Forward';

  @override
  String get mediaViewerZoomIn => 'Zoom in';

  @override
  String get mediaViewerZoomOut => 'Zoom out';

  @override
  String get mediaViewerPreviousAttachment => 'Previous attachment';

  @override
  String get mediaViewerNextAttachment => 'Next attachment';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String get chatAttachmentVideoToggleControls => 'Toggle video controls';

  @override
  String get chatAttachmentVideoMute => 'Mute video';

  @override
  String get chatAttachmentVideoUnmute => 'Unmute video';

  @override
  String get chatAttachmentVideoPlay => 'Play video';

  @override
  String get chatAttachmentVideoPause => 'Pause video';

  @override
  String get chatAttachmentVideoProgress => 'Video progress';

  @override
  String get chatVideoPlaybackFailed => 'Could not play this video.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Notify users with this role who have permission to view this channel.';

  @override
  String get addGuildModalTitle => 'Add a community';

  @override
  String get addGuildModalLandingDescription =>
      'Create a new community or join an existing one.';

  @override
  String get addGuildCreateCommunity => 'Create community';

  @override
  String get addGuildJoinCommunity => 'Join community';

  @override
  String get addGuildImportDiscordTemplate => 'Import Discord template';

  @override
  String get addGuildJoinTitle => 'Join a community';

  @override
  String get addGuildJoinDescription =>
      'Enter the invite link to join a community.';

  @override
  String get addGuildInviteLinkLabel => 'Invite link';

  @override
  String get addGuildJoinSubmit => 'Join community';

  @override
  String get addGuildInviteInvalid => 'This invite is invalid or has expired.';

  @override
  String get addGuildJoinFailed =>
      'Could not join community. Please try again.';

  @override
  String get addGuildPackInstalled => 'Pack installed successfully.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Remove All Reactions';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Are you sure you want to remove all reactions from this message?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Unpin message';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Send this pin back in time?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username pinned $messageLink to this channel. See $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'a message';

  @override
  String get systemPinMessageAllPinsLink => 'all pinned messages';

  @override
  String get channelPinsEmptyTitle => 'No pinned messages';

  @override
  String get channelPinsEmptyDescription => 'Pinned messages show up here.';

  @override
  String get personalNotesTitle => 'Personal notes';

  @override
  String get personalNotesSubtitle =>
      'Your private space for thoughts and reminders';

  @override
  String channelWelcomeHeading(String channelName) {
    return 'Welcome to $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'In the beginning, there was nothing. Then, there was $channelName. And it was good.';
  }

  @override
  String get personalNotesComposerHint => 'Message yourself';

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
  String get personalNotesPrivateSpace => 'Your private space';

  @override
  String get purgePersonalNotes => 'Purge personal notes';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'This will permanently delete every message and attachment in your personal notes. This cannot be undone.';

  @override
  String get purgePersonalNotesConfirmButton => 'Purge';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Purged $count messages from personal notes';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Personal notes were already empty';

  @override
  String get purgePersonalNotesFailed => 'Could not clear personal notes';

  @override
  String get userSettingsGroupYourAccount => 'YOUR ACCOUNT';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'Profile';

  @override
  String get userSettingsNavSecurityLogin => 'Security & Login';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Gifts & Codes';

  @override
  String get userSettingsNavPrivacyDashboard => 'Privacy Dashboard';

  @override
  String get userSettingsNavAuthorizedApps => 'Authorized Apps';

  @override
  String get userSettingsNavBlockedUsers => 'Blocked Users';

  @override
  String get userSettingsNavLinkedDevices => 'Linked Devices';

  @override
  String get userSettingsNavConnections => 'Connections';

  @override
  String get userSettingsNavLookAndFeel => 'Look & Feel';

  @override
  String get userSettingsNavAccessibility => 'Accessibility';

  @override
  String get userSettingsNavChat => 'Chat';

  @override
  String get userSettingsNavAudioAndVideo => 'Audio & Video';

  @override
  String get userSettingsNavLanguageAndTime => 'Language & Time';

  @override
  String get userSettingsNavAdvanced => 'Advanced';

  @override
  String get advancedPerformanceReportingTitle => 'Performance reporting';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Help improve Fluxer by sharing anonymous crash and performance data.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Send crash and performance reports';

  @override
  String get advancedPerformanceReportingDescription =>
      'All reported data is anonymous and is sent only to Fluxer\'s own monitoring service — no third-party providers are used.';

  @override
  String get userSettingsNavApplications => 'Applications';

  @override
  String get userSettingsNavAppLogs => 'App Logs';

  @override
  String get userSettingsNavDeveloperTools => 'Developer Tools';

  @override
  String get userSettingsNavLimitsConfig => 'Limits Config';

  @override
  String get userSettingsNavFeatureFlags => 'Feature Flags';

  @override
  String get userSettingsNavWhatsNew => 'What\'s New';

  @override
  String get userSettingsNavLogOut => 'Log Out';

  @override
  String get quickSwitcherTabSearch => 'Search';

  @override
  String get quickSwitcherTabFriends => 'Friends';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Search for channels, people, or communities';

  @override
  String get quickSwitcherSearchFriends => 'Search friends';

  @override
  String get quickSwitcherNoMatchesFound => 'No matches found';

  @override
  String get quickSwitcherEmptyHint =>
      'Try a different name or use @ / # / ! / * prefixes to filter results.';

  @override
  String get quickSwitcherSectionPeople => 'People';

  @override
  String get quickSwitcherSectionGroupMessages => 'Group messages';

  @override
  String get quickSwitcherSectionTextChannels => 'Text channels';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Voice channels';

  @override
  String get quickSwitcherSectionCommunities => 'Communities';

  @override
  String get quickSwitcherSectionSettings => 'Settings';

  @override
  String get quickSwitcherHomeLabel => 'Home';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Direct Messages';

  @override
  String get quickSwitcherFavoritesLabel => 'Favorites';

  @override
  String get quickSwitcherUserSettingsLabel => 'User Settings';

  @override
  String get quickSwitcherNotificationsLabel => 'Notifications';

  @override
  String get quickSwitcherBookmarksLabel => 'Bookmarks';

  @override
  String get quickSwitcherMentionsLabel => 'Mentions';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'No friends yet';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Add a friend to get started.';

  @override
  String get quickSwitcherFriendsNoMatchTitle => 'No friends match that search';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Try a different name.';

  @override
  String get quickSwitcherSearchAliasUser => 'User';

  @override
  String get quickSwitcherSearchAliasYou => 'You';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'DMs';

  @override
  String get quickSwitcherSearchAliasMessages => 'Messages';

  @override
  String get quickSwitcherSearchAliasFav => 'Fav';

  @override
  String get quickSwitcherSearchAliasStarred => 'Starred';

  @override
  String get quickSwitcherSearchAliasInbox => 'Inbox';

  @override
  String get quickSwitcherSearchAliasSaved => 'Saved';

  @override
  String get uiClose => 'Close';

  @override
  String get chatJumpToBottom => 'Jump to bottom';

  @override
  String get uiConfirm => 'Confirm';

  @override
  String get uiLoading => 'Loading';

  @override
  String get uiUnsavedChanges => 'Unsaved changes';

  @override
  String get uiReset => 'Reset';

  @override
  String get uiOpenColorPicker => 'Open colour picker';

  @override
  String get uiSelectPlaceholder => 'Select';

  @override
  String get uiSearchPlaceholder => 'Search';

  @override
  String get uiNoOptionsFound => 'No options found';

  @override
  String get uiDismissNotification => 'Dismiss notification';

  @override
  String get uiColorPickerTitle => 'Colour picker';

  @override
  String get mentionConfirmTitle => 'Mention everyone?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'This will notify $count members. Continue?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'This will notify $count online members. Continue?';
  }

  @override
  String get mentionConfirmButton => 'Mention';

  @override
  String get composerEmojiUnavailable => 'You can\'t use that emoji here.';

  @override
  String get instanceUrlLabel => 'Instance URL';

  @override
  String get instanceUrlPlaceholder => 'Enter instance URL (e.g. fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Reset to Fluxer';

  @override
  String get instanceConnect => 'Connect';

  @override
  String get instanceConnecting => 'Connecting…';

  @override
  String get instanceConnectFailed => 'Failed to connect to instance';

  @override
  String get recentInstances => 'Recent instances';

  @override
  String removeRecentInstance(String domain) {
    return 'Remove $domain from recent instances';
  }

  @override
  String get instanceSheetTitle => 'Connect to instance';

  @override
  String get connectToDifferentInstance => 'Connect to a different instance';

  @override
  String get changeInstance => 'Change';

  @override
  String get instanceConnectionRequired => 'Connect to the instance to sign in';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get guildNavbarDirectMessages => 'Direct Messages';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Explore Discoverable Communities';

  @override
  String get discoveryExplore => 'Explore';

  @override
  String get discoveryExplorePublicCommunities => 'Explore public communities';

  @override
  String get discoveryListingSubheading =>
      'Want to list your community on here? Apply if you meet the requirements in your community\'s settings > Discovery.';

  @override
  String get discoverySearchCommunities => 'Search communities';

  @override
  String get discoveryFilterByLanguage => 'Filter by language';

  @override
  String get discoveryAllLanguages => 'All languages';

  @override
  String get discoveryAllCategories => 'All';

  @override
  String get discoveryCategoryGaming => 'Gaming';

  @override
  String get discoveryCategoryMusic => 'Music';

  @override
  String get discoveryCategoryEntertainment => 'Entertainment';

  @override
  String get discoveryCategoryEducation => 'Education';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Science & Technology';

  @override
  String get discoveryCategoryContentCreator => 'Content Creator';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime & Manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Movies & TV';

  @override
  String get discoveryCategoryOther => 'Other';

  @override
  String get discoveryNoCommunitiesMatch => 'No communities match.';

  @override
  String get discoveryJoinCommunity => 'Join community';

  @override
  String get discoveryJoined => 'Joined';

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
      other: '$countString members',
      one: '1 member',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'No description.';

  @override
  String get discoveryCommunities => 'Communities';

  @override
  String get discoveryApps => 'Apps';

  @override
  String get discoveryJoinErrorGenericTitle => 'Couldn\'t join this community';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Something went wrong. Please try again in a moment.';

  @override
  String get discoveryJoinErrorFullTitle => 'This community is full';

  @override
  String get discoveryJoinErrorFullMessage =>
      'This community has reached its member limit, so you can\'t join right now.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'You\'ve reached the community limit';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'You\'re in the maximum number of communities. Leave one and try again.';

  @override
  String get discoveryJoinErrorBannedTitle => 'You can\'t join this community';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'You have been banned from this community.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'This community is no longer available';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'It may have left discovery or turned off new joins. Refresh the page and you won\'t see it again.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'You\'re going too fast';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Please wait a moment and try again.';

  @override
  String get guildNavbarAddCommunity => 'Add a Community';

  @override
  String get guildNavbarHelp => 'Help';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'NEW MESSAGE';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Collapse $folderName';
  }

  @override
  String get guildNavbarGroupDm => 'Group DM';

  @override
  String get guildNavbarCreateChannel => 'Create Channel';

  @override
  String get guildNavbarChannelType => 'Channel Type';

  @override
  String get guildNavbarTextChannel => 'Text Channel';

  @override
  String get guildNavbarTextChannelDescription =>
      'Send messages, images, GIFs, and emoji';

  @override
  String get guildNavbarVoiceChannel => 'Voice Channel';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Hang out together with voice, video, and screen share';

  @override
  String get guildNavbarLinkChannel => 'Link Channel';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Quick access to an external website or resource';

  @override
  String get guildNavbarNameLabel => 'Name';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarCreateCategory => 'Create Category';

  @override
  String get guildNavbarNewCategoryHint => 'New Category';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Invite friends to $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Recipients will be taken to #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Search friends';

  @override
  String get guildNavbarNoFriendsYet => 'No friends yet';

  @override
  String get guildNavbarNoResults => 'No results';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Or, send an invite link to a friend:';

  @override
  String get guildNavbarInviteLink => 'Invite link';

  @override
  String get guildNavbarCopy => 'Copy';

  @override
  String get guildNavbarCopied => 'Copied!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Your invite link expires in 7 days.';

  @override
  String get guildNavbarInviteNeverExpires => 'This invite link never expires.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Your invite link expires in $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Edit invite link';

  @override
  String get guildNavbarInviteLinkSettings => 'Invite link settings';

  @override
  String get guildNavbarExpireAfter => 'Expire After';

  @override
  String get guildNavbarMaxUses => 'Max Number of Uses';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Grant Temporary Membership';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Members will be removed when they go offline unless a role is assigned';

  @override
  String get guildNavbarCreateNewLink => 'Create New Link';

  @override
  String get guildNavbarSent => 'Sent';

  @override
  String get guildNavbarInvite => 'Invite';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Leave Community';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Are you sure you want to leave this community? You will no longer be able to see any messages.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Leave Community';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Delete your messages in this community?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Permanently delete every message you\'ve sent here, across every channel. Cannot be undone.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Delete My Messages';

  @override
  String get guildNavbarDeletedYourMessages => 'Deleted your messages';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Couldn\'t delete your messages';

  @override
  String get guildNavbarRemoveOverride => 'Remove override';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Muted until $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible =>
      'Only accessible to Fluxer staff';

  @override
  String get guildNavbarInvitesPaused =>
      'Invites are currently paused in this community';

  @override
  String get guildNavbarDurationNever => 'never';

  @override
  String get guildNavbarDuration30Minutes => '30 minutes';

  @override
  String get guildNavbarDuration1Hour => '1 hour';

  @override
  String get guildNavbarDuration6Hours => '6 hours';

  @override
  String get guildNavbarDuration12Hours => '12 hours';

  @override
  String get guildNavbarDuration1Day => '1 day';

  @override
  String get guildNavbarDuration7Days => '7 days';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count seconds';
  }

  @override
  String get guildNavbarNever => 'Never';

  @override
  String get guildNavbarNoLimit => 'No limit';

  @override
  String get guildNavbarOneUse => '1 use';

  @override
  String guildNavbarUses(int count) {
    return '$count uses';
  }

  @override
  String get guildMenuMarkAsRead => 'Mark as Read';

  @override
  String get guildPeekMoreOptions => 'More Options';

  @override
  String get guildMenuInviteMembers => 'Invite Members';

  @override
  String get guildMenuCommunitySettings => 'Community Settings';

  @override
  String get guildMenuEditCommunityProfile => 'Edit Community Profile';

  @override
  String get guildMenuUnmuteCommunity => 'Unmute Community';

  @override
  String get guildMenuMuteCommunity => 'Mute Community';

  @override
  String get guildMenuHideMutedChannels => 'Hide Muted Channels';

  @override
  String get guildMenuReportCommunity => 'Report Community';

  @override
  String get guildMenuDebugCommunity => 'Debug Community';

  @override
  String get guildMenuCopyCommunityId => 'Copy Community ID';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Until $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'General';

  @override
  String get guildMenuSettingsRoles => 'Roles & Permissions';

  @override
  String get guildMenuSettingsEmoji => 'Custom Emoji';

  @override
  String get guildMenuSettingsStickers => 'Custom Stickers';

  @override
  String get guildMenuSettingsSafetyModeration => 'Safety & Moderation';

  @override
  String get guildMenuSettingsActivityLog => 'Activity log';

  @override
  String get guildMenuSettingsWebhooks => 'Webhooks';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'Custom Invite URL';

  @override
  String get guildMenuSettingsDiscovery => 'Discovery';

  @override
  String get guildMenuSettingsMembers => 'Members';

  @override
  String get guildMenuSettingsInviteLinks => 'Invite Links';

  @override
  String get guildMenuSettingsBans => 'Bans';

  @override
  String get guildSettingsNoPermission =>
      'You do not have permission to view this settings tab.';

  @override
  String get guildSettingsOverviewIconTitle => 'Icon';

  @override
  String get guildSettingsUploadImage => 'Upload Image';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Upload a banner for your server.';

  @override
  String get guildSettingsOverviewNameTitle => 'Name';

  @override
  String get guildSettingsOverviewNameHint => 'My awesome community';

  @override
  String get guildSettingsOverviewStatsTitle => 'Statistics';

  @override
  String get guildSettingsOverviewMembers => 'Members';

  @override
  String get guildSettingsOverviewOnline => 'Online';

  @override
  String get guildSettingsRolesDescription =>
      'Use roles to group members and assign permissions.';

  @override
  String get guildSettingsCreateRole => 'Create Role';

  @override
  String get guildSettingsRolesListTitle => 'Roles';

  @override
  String guildSettingsEmojiSlotInfo(int staticCount, int animatedCount) {
    return '$staticCount static, $animatedCount animated emoji slots used';
  }

  @override
  String get guildSettingsEmojiEmpty => 'No custom emoji yet.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count stickers uploaded';
  }

  @override
  String get guildSettingsStickersEmpty => 'No custom stickers yet.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Member verification';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Choose what members must have before they can post or DM community members.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Members with roles can bypass these checks. For public spaces, we recommend enabling verification.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Communities listed in Discovery require at least verified email. None cannot be selected while Discovery is enabled.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Mature content & content warnings';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Configure mature content labelling and optional content warnings for members.';

  @override
  String get guildSettingsModerationMatureToggle => 'Mature content';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Mark this community as containing mature content.';

  @override
  String get guildSettingsVerificationNone => 'None';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'No verification is required.';

  @override
  String get guildSettingsVerificationLow => 'Low';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Requires a verified email address.';

  @override
  String get guildSettingsVerificationMedium => 'Medium';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Requires a verified email address, and an account that\'s at least 5 minutes old.';

  @override
  String get guildSettingsVerificationHigh => 'High';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Requires everything in medium, plus being a member of the community for at least 10 minutes.';

  @override
  String get guildSettingsVerificationHighest => 'Very high';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Requires a verified phone number.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Track moderator actions across the community.';

  @override
  String get guildSettingsAuditLogEmpty => 'No logs yet';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Moderation actions and community changes will appear here.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'All users';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'All actions';

  @override
  String get guildSettingsAuditLogNoReason => 'No reason was provided.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Unknown user';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Something went wrong while loading the activity log.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Unable to load activity logs';

  @override
  String get guildSettingsAuditLogReason => 'Reason';

  @override
  String get guildSettingsAuditLogSomeone => 'someone';

  @override
  String get guildSettingsAuditLogSomething => 'something';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'unknown entity';

  @override
  String get guildSettingsAuditLogNothing => 'nothing';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Unknown target';

  @override
  String get auditLogActionGuildUpdate => 'Community updated';

  @override
  String get auditLogActionChannelCreate => 'Channel created';

  @override
  String get auditLogActionChannelUpdate => 'Channel updated';

  @override
  String get auditLogActionChannelDelete => 'Channel deleted';

  @override
  String get auditLogActionChannelOverwriteCreate => 'Channel overwrite added';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Channel overwrite updated';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Channel overwrite removed';

  @override
  String get auditLogActionMemberKick => 'Member kicked';

  @override
  String get auditLogActionMemberPrune => 'Members pruned';

  @override
  String get auditLogActionMemberBanAdd => 'Member banned';

  @override
  String get auditLogActionMemberBanRemove => 'Member unbanned';

  @override
  String get auditLogActionMemberUpdate => 'Member updated';

  @override
  String get auditLogActionMemberRoleUpdate => 'Member roles updated';

  @override
  String get auditLogActionMemberMove => 'Member moved';

  @override
  String get auditLogActionMemberDisconnect => 'Member disconnected';

  @override
  String get auditLogActionBotAdd => 'Bot added';

  @override
  String get auditLogActionRoleCreate => 'Role created';

  @override
  String get auditLogActionRoleUpdate => 'Role updated';

  @override
  String get auditLogActionRoleDelete => 'Role deleted';

  @override
  String get auditLogActionInviteCreate => 'Invite created';

  @override
  String get auditLogActionInviteUpdate => 'Invite updated';

  @override
  String get auditLogActionInviteDelete => 'Invite deleted';

  @override
  String get auditLogActionWebhookCreate => 'Webhook created';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook updated';

  @override
  String get auditLogActionWebhookDelete => 'Webhook deleted';

  @override
  String get auditLogActionEmojiCreate => 'Emoji created';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji updated';

  @override
  String get auditLogActionEmojiDelete => 'Emoji deleted';

  @override
  String get auditLogActionStickerCreate => 'Sticker created';

  @override
  String get auditLogActionStickerUpdate => 'Sticker updated';

  @override
  String get auditLogActionStickerDelete => 'Sticker deleted';

  @override
  String get auditLogActionMessageDelete => 'Message deleted';

  @override
  String get auditLogActionMessageBulkDelete => 'Messages deleted';

  @override
  String get auditLogActionMessagePin => 'Message pinned';

  @override
  String get auditLogActionMessageUnpin => 'Message unpinned';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor updated the community settings.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor created the channel $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor updated the channel $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor deleted the channel $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor added channel permissions for $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor added channel permissions for $target in $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor updated channel permissions for $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor updated channel permissions for $target in $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor removed channel permissions for $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor removed channel permissions for $target in $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor kicked $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor banned $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor unbanned $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor updated $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor updated roles for $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor pruned inactive members.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor pruned members inactive for $days days.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor moved $target to another voice channel.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor moved $target to $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor disconnected $target from voice.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor added the bot $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor created the role $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor updated the role $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor deleted the role $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor created the invite $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor created the invite $target for $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor updated the invite $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor updated the invite $target for $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor deleted the invite $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor deleted the invite $target for $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor created the webhook $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor updated the webhook $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor deleted the webhook $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor added the emoji $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor updated the emoji $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor deleted the emoji $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor added the sticker $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor updated the sticker $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor deleted the sticker $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor deleted a message.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor deleted a message in $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor deleted multiple messages.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor deleted $count messages.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor deleted multiple messages in $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor deleted $count messages in $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor pinned a message.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor pinned a message in $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor unpinned a message.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor unpinned a message in $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor performed an audit action on $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Updated $field from $oldValue to $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Set $field to $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Cleared $field (was $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Updated $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Renamed the community to $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Updated the community icon.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Renamed the channel to $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Cleared the topic.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Updated the topic to $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent => 'Enabled mature content.';

  @override
  String get auditLogChangeDisabledMatureContent => 'Disabled mature content.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Set nickname to $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Removed nickname $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Muted the member.';

  @override
  String get auditLogChangeUnmutedMember => 'Unmuted the member.';

  @override
  String get auditLogChangeDeafenedMember => 'Deafened the member.';

  @override
  String get auditLogChangeUndeafenedMember => 'Undeafened the member.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Added $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Removed $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Channel: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Message: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Invited by $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Deleted # messages.',
      one: 'Deleted # message.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Removed # members.',
      one: 'Removed # member.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires => 'This invite never expires.';

  @override
  String get auditLogOptionTemporaryMembership =>
      'Grants temporary membership.';

  @override
  String get auditLogOptionPermanentMembership =>
      'Grants permanent membership.';

  @override
  String get guildSettingsLoadMore => 'Load more';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Manage webhooks that post messages to channels.';

  @override
  String get guildSettingsWebhooksEmpty => 'No webhooks configured.';

  @override
  String get guildSettingsCopyUrl => 'Copy URL';

  @override
  String get guildSettingsCopiedUrl => 'URL copied to clipboard';

  @override
  String get guildSettingsDeleteWebhook => 'Delete webhook';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Set a custom invite link for your server.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Save';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Usage';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count uses';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Apply to be listed in server discovery.';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Requires at least $count members to apply.';
  }

  @override
  String get guildSettingsDiscoveryCategory => 'Category';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Description';

  @override
  String get guildSettingsDiscoveryTags => 'Tags';

  @override
  String get guildSettingsDiscoveryTagsHint => 'gaming, art, music';

  @override
  String get guildSettingsDiscoveryApply => 'Submit Application';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Withdraw';

  @override
  String get guildSettingsMembersDescription =>
      'Search and manage server members.';

  @override
  String get guildSettingsMembersSearchHint => 'Search members';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count members';
  }

  @override
  String get guildSettingsMembersSortNewest => 'Newest first';

  @override
  String get guildSettingsInvitesDescription =>
      'View and revoke active invite links.';

  @override
  String get guildSettingsInvitesEmpty => 'No active invites.';

  @override
  String guildSettingsInviteUses(int uses, int maxUses) {
    return '$uses / $maxUses uses';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Expires $date';
  }

  @override
  String get guildSettingsBansDescription => 'View and manage banned users.';

  @override
  String get guildSettingsBansSearchHint => 'Search bans';

  @override
  String get guildSettingsBansEmpty => 'No banned users.';

  @override
  String get guildSettingsBanPermanent => 'Permanent ban';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Expires $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Expires';

  @override
  String get guildSettingsUnban => 'Unban';

  @override
  String get guildSettingsBansLoading => 'Loading banned users';

  @override
  String get guildSettingsBansNoSearchResults =>
      'No bans found matching your search.';

  @override
  String get guildSettingsBanDetailsTitle => 'Ban details';

  @override
  String get guildSettingsBanViewDetails => 'View details';

  @override
  String get guildSettingsBannedOn => 'Banned on';

  @override
  String get guildSettingsBannedBy => 'Banned by';

  @override
  String get guildSettingsRevokeBanTitle => 'Revoke ban';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Are you sure you want to revoke the ban for $displayName? They will be able to rejoin the community.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Revoked ban for $displayName';
  }

  @override
  String get guildSettingsBansLoadError => 'Couldn\'t load bans. Try again.';

  @override
  String get guildSettingsRevokeBanError => 'Couldn\'t revoke ban. Try again.';

  @override
  String get guildSettingsCommunitySettings => 'Community Settings';

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
      'Manage your community\'s profile, channels, and default settings.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Branding';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Update your icon, name, banner, and invite background';

  @override
  String get guildSettingsOverviewBannerUpload => 'Upload banner';

  @override
  String get guildSettingsOverviewIdleTitle => 'Idle settings';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Configure AFK channel and timeout';

  @override
  String get guildSettingsOverviewSystemTitle => 'System & welcome';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Choose destination for system and welcome messages';

  @override
  String get guildSettingsOverviewNotificationsTitle => 'Default notifications';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Communities with over 250 people are forced onto the \"mentions only\" setting. Your original setting is preserved and will be restored if the community drops below 250 members.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Advanced';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Allow flexible text channel names';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Hide community owner crown';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Detached banner';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Shows the banner in its own section below the community header.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Upload icon';

  @override
  String get guildSettingsOverviewRemoveImage => 'Remove';

  @override
  String get guildSettingsOverviewSplashTitle => 'Invite background';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'Chat embed background';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Shown in invite embeds in chat.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Upload background';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'No community banner';

  @override
  String get guildSettingsOverviewNoInviteBackground => 'No invite background';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Preview';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'See how your invite looks to visitors.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle => 'Text channel names';

  @override
  String get guildSettingsOverviewOwnerCrownTitle => 'Community owner crown';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Configure whether the crown icon is shown next to the community owner';

  @override
  String get guildSettingsSplashCardAlignment => 'Card alignment';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Center';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Left';

  @override
  String get guildSettingsSplashAlignmentRight => 'Right';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Only applies on wide screens.';

  @override
  String get permissionReadMessageHistory => 'Read message history';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Change what users without \"$permission\" can see';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Use a dedicated modal to set a message history threshold date for members who don\'t have the $permission permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Open message history threshold';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Message history threshold';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Enable message history threshold';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Threshold date';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Members without Read Message History can view messages sent after this date.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Message history threshold updated';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Allow capital letters and spaces in text channel names. Off restricts names to lowercase with hyphens and underscores.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Hides the crown icon next to the community owner across all surfaces.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Animated icons require the Animated Icon community feature.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Animated banners require the Animated Banner community feature.';

  @override
  String get guildSettingsAfkChannel => 'AFK / idle channel';

  @override
  String get guildSettingsAfkChannelHint =>
      'Move members to this channel when they\'re AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'No AFK channel';

  @override
  String get guildSettingsAfkTimeout => 'AFK timeout';

  @override
  String get guildSettingsAfkTimeout1Min => '1 minute';

  @override
  String get guildSettingsAfkTimeout5Min => '5 minutes';

  @override
  String get guildSettingsAfkTimeout15Min => '15 minutes';

  @override
  String get guildSettingsAfkTimeout30Min => '30 minutes';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 hour';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get guildSettingsSystemChannel => 'Destination channel';

  @override
  String get guildSettingsSystemChannelHint =>
      'Welcome and system messages will appear here.';

  @override
  String get guildSettingsNoSystemChannel => 'No system channel';

  @override
  String get guildSettingsHideJoinMessages => 'Hide join messages';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Suppresses join messages in the destination channel.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Default notification settings';

  @override
  String get guildSettingsNotificationsAll => 'All messages';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Notify on all messages';

  @override
  String get guildSettingsNotificationsMentions => 'Mentions only';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Notify only on mentions';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max 10MB. Minimum: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max 10MB. Minimum: 960×540px (16:9). Shown in invite embeds in chat.';

  @override
  String get guildSettingsModerationDescription =>
      'Configure verification, content filtering, and mature content settings.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Discovery-listed communities have restricted moderation options.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Content filtering';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Automatically screen messages for explicit content in channels not marked for mature content.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Communities listed in Discovery are required to scan all members. This setting cannot be changed while Discovery is enabled.';

  @override
  String get guildSettingsContentFilterOff => 'Off';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Let the community self-moderate';

  @override
  String get guildSettingsContentFilterNoRole => 'Filter members without roles';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Suggested for most communities';

  @override
  String get guildSettingsContentFilterAll => 'Filter everyone';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Maximum protection for family-friendly spaces';

  @override
  String get guildSettingsModerationMatureOff => 'Off';

  @override
  String get guildSettingsModerationMatureOn => 'On';

  @override
  String get guildSettingsContentWarningToggle => 'Show a content warning';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Toggles a consent prompt before entering any channel.';

  @override
  String get guildSettingsContentWarningText => 'Custom warning text';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'This contains sensitive content.';

  @override
  String get guildSettingsModeration2faTitle => '2FA requirement';

  @override
  String get guildSettingsModeration2faDescription =>
      'Require two-factor authentication for moderators before they can ban, kick, timeout, or remove messages.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Require 2FA for moderation actions';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Only the community owner can change this setting';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Enable 2FA on your account to change this setting';

  @override
  String get guildSettingsEmojiSearchHint => 'Search emojis';

  @override
  String get guildSettingsEmojiUploadTitle => 'Upload Emoji';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Non-animated emoji ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Animated emoji ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Search stickers';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Create webhooks from Channel settings. Edit them here.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'Your vanity URL won\'t work unless at least one channel is visible to everyone.';

  @override
  String get guildSettingsVanityUrlRemove => 'Remove';

  @override
  String get guildSettingsBannedUsersTitle => 'Banned users';

  @override
  String get guildSettingsInvitesTableInviter => 'Inviter';

  @override
  String get guildSettingsInvitesTableChannel => 'Channel';

  @override
  String get guildSettingsInvitesTableCode => 'Code';

  @override
  String get guildSettingsInvitesTableUses => 'Uses';

  @override
  String get guildSettingsInvitesTableCreated => 'Created';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filter by user';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filter by action';
}

/// The translations for English, as used in the United States (`en_US`).
class FluxerLocalizationsEnUs extends FluxerLocalizationsEn {
  FluxerLocalizationsEnUs() : super('en_US');

  @override
  String get reconnectingTitle => 'We fluxed up!';

  @override
  String get reconnectingBody =>
      'Something is wrong with the servers.\nShould be fixed in a second!';

  @override
  String get gatewayReconnectingToast => 'Reconnecting…';

  @override
  String get gatewayConnectedToast => 'Connected';

  @override
  String splashStartupFailed(String error) {
    return 'Failed to start: $error';
  }

  @override
  String get retry => 'Retry';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Connection lost';

  @override
  String get splashViewOnStatusPage => 'View on status page';

  @override
  String get splashConnectionIssuesPrompt => 'Connection issues?';

  @override
  String get splashStatusPageLink => 'Status page';

  @override
  String get splashReadIncident => 'Read incident';

  @override
  String get splashIncidentHistory => 'Incident history';

  @override
  String get welcomeBack => 'Welcome back';

  @override
  String get email => 'Email';

  @override
  String get emailInvalid => 'Please enter a valid email address.';

  @override
  String get password => 'Password';

  @override
  String get forgotPassword => 'Forgot your password?';

  @override
  String get logIn => 'Log in';

  @override
  String get logInWithPasskey => 'Log in with a passkey';

  @override
  String continueWithSso(String provider) {
    return 'Continue with $provider';
  }

  @override
  String get ssoRequired => 'SSO is required to access this instance.';

  @override
  String get organizationSsoProvider =>
      'Sign in with your organization\'s single sign-on provider.';

  @override
  String get failedToStartSso => 'Failed to start SSO';

  @override
  String get ssoCancelled => 'SSO login was cancelled';

  @override
  String preferSso(String provider) {
    return 'Prefer using SSO? Continue with $provider.';
  }

  @override
  String get logInViaBrowser => 'Log in via browser';

  @override
  String get needAccountPrompt => 'Need an account? ';

  @override
  String get register => 'Register';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Verify you\'re human';

  @override
  String get captchaDescription =>
      'We need to make sure you\'re not a bot. Please complete the verification below.';

  @override
  String get captchaSwitchToHcaptcha => 'Having issues? Try hCaptcha instead';

  @override
  String get captchaSwitchToTurnstile => 'Try Turnstile instead';

  @override
  String get cancel => 'Cancel';

  @override
  String get ipAuthCheckEmail => 'Check your email';

  @override
  String ipAuthDescription(String email) {
    return 'We emailed a link to authorize this login. Please open your inbox for $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Connection lost';

  @override
  String get ipAuthConnectionLostDescription =>
      'We lost the connection while waiting for authorization. Please try again.';

  @override
  String get ipAuthLinkExpired => 'Sign-in link expired';

  @override
  String get ipAuthLinkExpiredDescription =>
      'This authorization link expired. Please sign in again.';

  @override
  String get ipAuthResendEmail => 'Resend email';

  @override
  String get ipAuthResent => 'Resent';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Back';

  @override
  String get mfaTitle => 'Two-factor authentication';

  @override
  String get mfaChooseMethod => 'Choose a verification method';

  @override
  String get mfaMethodTotp => 'Authenticator App';

  @override
  String get mfaMethodWebauthn => 'Security Key / Passkey';

  @override
  String get mfaTotpDescription =>
      'Enter the 6-digit code from your authenticator app or one of your backup codes.';

  @override
  String get mfaCodeLabel => 'Code';

  @override
  String get mfaTryAnotherMethod => 'Try another method';

  @override
  String get mfaUseSecurityKey => 'Try security key / passkey instead';

  @override
  String get accountSelectorTitle => 'Choose an account';

  @override
  String get accountSelectorDescription =>
      'Select an account to continue, or add a different one.';

  @override
  String get accountAdd => 'Add an account';

  @override
  String get accountRemove => 'Remove';

  @override
  String accountRemoveTitle(String username) {
    return 'Remove $username';
  }

  @override
  String get accountRemoveDescription =>
      'This will remove the saved session for this account.';

  @override
  String get accountRemoveOnlyDescription =>
      'This will remove the only saved account on this device.';

  @override
  String get accountExpired => 'Expired';

  @override
  String accountSessionExpired(String identifier) {
    return 'Session expired for $identifier. Please log in again.';
  }

  @override
  String get accountManageTitle => 'Manage accounts';

  @override
  String get accountSwitchFailed => 'Couldn\'t switch accounts. Try again.';

  @override
  String get profileTabMenuSwitchAccounts => 'Switch accounts';

  @override
  String get statusChangeSheetTitle => 'Set status';

  @override
  String get statusOnlineStatusSection => 'Online status';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusIdle => 'Idle';

  @override
  String get statusDnd => 'Do not disturb';

  @override
  String get statusInvisible => 'Invisible';

  @override
  String get statusOffline => 'Offline';

  @override
  String get statusUntilIChangeIt => 'Until I change it';

  @override
  String get statusDontClear => 'Don\'t clear';

  @override
  String get statusFor10Seconds => 'For 10 seconds';

  @override
  String get statusClearAfter10Seconds => '10 seconds';

  @override
  String get statusClearAfter15Minutes => '15 minutes';

  @override
  String get statusClearAfter30Minutes => '30 minutes';

  @override
  String get statusClearAfter1Hour => '1 hour';

  @override
  String get statusClearAfter3Hours => '3 hours';

  @override
  String get statusClearAfter4Hours => '4 hours';

  @override
  String get statusClearAfter8Hours => '8 hours';

  @override
  String get statusClearAfter24Hours => '24 hours';

  @override
  String get statusClearAfter3Days => '3 days';

  @override
  String get statusDndDescription =>
      'You won\'t receive notifications on desktop';

  @override
  String get statusInvisibleDescription => 'You\'ll appear offline';

  @override
  String get customStatusSetTitle => 'Set custom status';

  @override
  String get customStatusCurrentHint => 'Custom status';

  @override
  String get customStatusClear => 'Clear custom status';

  @override
  String get customStatusPlaceholder => 'What\'s happening?';

  @override
  String get customStatusChooseEmoji => 'Choose an emoji';

  @override
  String get customStatusClearAfter => 'Clear after';

  @override
  String get customStatusSave => 'Save';

  @override
  String get accountActive => 'Active account';

  @override
  String get signOut => 'Sign out';

  @override
  String get suspendedPermanentTitle => 'Account Permanently Suspended';

  @override
  String get suspendedTemporaryTitle => 'Account Suspended';

  @override
  String get suspendedPermanentDescription =>
      'Your account has been permanently suspended for violating our Terms of Service.';

  @override
  String get suspendedTemporaryDescription =>
      'Your account has been temporarily suspended. You will be able to access your account once the suspension period ends.';

  @override
  String get suspendedIssuedAt => 'Issued';

  @override
  String get suspendedEndsAt => 'Ends';

  @override
  String get suspendedDuration => 'Duration';

  @override
  String get suspendedPermanent => 'Permanent';

  @override
  String get suspendedReason => 'Reason';

  @override
  String get suspendedAppealDeadline => 'Appeal Deadline';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Your account is scheduled for deletion on $date.';
  }

  @override
  String get suspendedRecheck => 'Check for Updates';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Check again in ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Back to Login';

  @override
  String get suspendedAppealTitle => 'Appeal';

  @override
  String get suspendedAppealHint =>
      'Explain why your suspension should be reconsidered (minimum 50 characters)...';

  @override
  String get suspendedAppealSubmit => 'Submit Appeal';

  @override
  String get suspendedAppealPending => 'Pending Review';

  @override
  String get suspendedAppealAccepted => 'Appeal Accepted';

  @override
  String get suspendedAppealRejected => 'Appeal Rejected';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Your appeal has been accepted and your account has been reinstated.';

  @override
  String get suspendedSignIn => 'Sign In to Your Account';

  @override
  String get forgotPasswordTitle => 'Forgot your password?';

  @override
  String get forgotPasswordDescription =>
      'Enter your email address and we\'ll send you a link to reset your password.';

  @override
  String get forgotPasswordSubmit => 'Send reset link';

  @override
  String get forgotPasswordSentTitle => 'Check your email';

  @override
  String get forgotPasswordSentDescription =>
      'We\'ve sent password reset instructions to your email address. Please check your inbox and follow the link to reset your password.';

  @override
  String get forgotPasswordBackToLogin => 'Return to login';

  @override
  String get resetPasswordTitle => 'Set new password';

  @override
  String get resetPasswordDescription =>
      'Enter your new password below to complete the reset process.';

  @override
  String get resetPasswordNewPassword => 'New password';

  @override
  String get resetPasswordConfirm => 'Confirm new password';

  @override
  String get resetPasswordSubmit => 'Reset password';

  @override
  String get resetPasswordMismatch => 'Passwords do not match.';

  @override
  String get registerTitle => 'Create an account';

  @override
  String get registerDisplayName => 'Display Name (Optional)';

  @override
  String get registerDisplayNameHint => 'What should people call you?';

  @override
  String get registerUsername => 'Username (Optional)';

  @override
  String get registerUsernameHint => 'Leave blank for a random username';

  @override
  String get registerUsernameTagHint =>
      'A 4-digit tag will be added automatically to ensure uniqueness';

  @override
  String get registerDateOfBirth => 'Date of birth';

  @override
  String get registerMonth => 'Month';

  @override
  String get registerDay => 'Day';

  @override
  String get registerYear => 'Year';

  @override
  String get registerConsent =>
      'I agree to the Terms of Service and Privacy Policy';

  @override
  String get registerConsentPrefix => 'I agree to the ';

  @override
  String get registerConsentTerms => 'Terms of Service';

  @override
  String get registerConsentAnd => ' and ';

  @override
  String get registerConsentPrivacy => 'Privacy Policy';

  @override
  String get registerConfirmPassword => 'Confirm Password';

  @override
  String get registerSubmit => 'Create account';

  @override
  String get registerHaveAccount => 'Already have an account? ';

  @override
  String get passkeyNoCredentials =>
      'No passkeys found for this app. Log in with email and password instead.';

  @override
  String get passkeyDeviceNotSupported =>
      'Passkeys are not supported on this device.';

  @override
  String get passkeyDomainNotAssociated =>
      'Passkeys are not configured for this app. Log in with email and password instead.';

  @override
  String get passkeyTimeout =>
      'Passkey authentication timed out. Please try again.';

  @override
  String get passkeyNotAvailable =>
      'Passkeys are not available for this app. Log in with email and password instead.';

  @override
  String get passkeyFailed =>
      'Passkey authentication failed. Please try again.';

  @override
  String get errorUnableToCreateAccount =>
      'Unable to create account. Please try again.';

  @override
  String get errorUnableToSignIn =>
      'Unable to sign in right now. Please try again.';

  @override
  String get errorInvalidEmailOrPassword => 'Invalid email or password.';

  @override
  String get errorUnableToSendResetLink =>
      'Unable to send reset link. Please try again.';

  @override
  String get errorUnableToResetPassword =>
      'Unable to reset password. Please try again.';

  @override
  String get embedInviteJoin => 'Join Community';

  @override
  String get embedInviteGoTo => 'Go to Community';

  @override
  String embedInviteOnline(String count) {
    return '$count Online';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count Members';
  }

  @override
  String get embedInviteUnknownTitle => 'Unknown Invite';

  @override
  String get embedInviteUnknownSubtitle => 'Try asking for a new invite.';

  @override
  String get embedInviteUnavailable => 'Invite Unavailable';

  @override
  String get inviteAcceptTitle => 'You\'ve been invited to join';

  @override
  String get inviteAcceptJoinButton => 'Join Community';

  @override
  String get inviteAcceptGoToButton => 'Go to Community';

  @override
  String get inviteAcceptInvitesPaused => 'Invites Paused';

  @override
  String get inviteAcceptNotFoundTitle => 'Invite Invalid';

  @override
  String get inviteAcceptNotFoundDescription =>
      'This invite may be expired or invalid.';

  @override
  String get inviteAcceptJoinGroupButton => 'Join group';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'You\'ve been invited to join a group DM by $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'someone';

  @override
  String get inviteAcceptEmojiPack => 'Emoji pack';

  @override
  String get inviteAcceptStickerPack => 'Sticker pack';

  @override
  String get inviteAcceptInstallEmojiPack => 'Install emoji pack';

  @override
  String get inviteAcceptInstallStickerPack => 'Install sticker pack';

  @override
  String get inviteAcceptPackInstallNote =>
      'Accepting this invite installs the pack automatically.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Channel Access Denied';

  @override
  String get channelAccessDeniedDescription =>
      'You do not have access to the channel where this message was sent.';

  @override
  String get messageJumpLinkNoAccess => 'No access';

  @override
  String get okay => 'Okay';

  @override
  String get embedThemeTitle => 'Shared theme';

  @override
  String get embedThemeSubtitle =>
      'This client doesn\'t support custom themes.';

  @override
  String get embedThemeUnavailableButton => 'Themes unavailable';

  @override
  String get privacySettings => 'Privacy Settings';

  @override
  String get privacyDirectMessages => 'Direct Messages';

  @override
  String get privacyDirectMessagesDescription =>
      'Allow direct messages from other members in this community';

  @override
  String get privacyBotDirectMessages => 'Bot Direct Messages';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Allow bots from this community to send you direct messages';

  @override
  String get privacyMutualDmsDisabled =>
      'The community admins have disabled receiving direct messages solely from mutual members in this community.';

  @override
  String get communityDebug => 'Community Debug';

  @override
  String get copiedToClipboard => 'Copied to clipboard';

  @override
  String get notificationSettings => 'Notification Settings';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Mute $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Muting a community prevents unread indicators and notifications from appearing unless you are mentioned';

  @override
  String get notificationCommunitySettings => 'Community Notification Settings';

  @override
  String get notificationAllMessages => 'All Messages';

  @override
  String get notificationOnlyMentions => 'Only Mentions';

  @override
  String get notificationNothing => 'Nothing';

  @override
  String get notificationSuppressEveryone => 'Suppress @everyone and @here';

  @override
  String get notificationSuppressRoles => 'Suppress All Role @mentions';

  @override
  String get notificationMobilePush => 'Mobile Push Notifications';

  @override
  String get notificationOverrides => 'Notification Overrides';

  @override
  String get notificationSelectChannel => 'Select a channel or category';

  @override
  String get notificationOnlyAtMentions => 'Only @mentions';

  @override
  String get notificationMuteChannel => 'Mute Channel';

  @override
  String get notificationUnmuteChannel => 'Unmute Channel';

  @override
  String get notificationNoCategory => 'No Category';

  @override
  String get dmMarkAsRead => 'Mark as Read';

  @override
  String get dmMuteConversation => 'Mute DM';

  @override
  String get dmUnmuteConversation => 'Unmute DM';

  @override
  String get dmPinDm => 'Pin DM';

  @override
  String get dmUnpinDm => 'Unpin DM';

  @override
  String get dmAlwaysShowInSidebar => 'Always Show in Sidebar';

  @override
  String get dmRemoveFromAlwaysShown => 'Remove from Always Shown';

  @override
  String get dmCloseDm => 'Close DM';

  @override
  String get dmCloseDmConfirmTitle => 'Close DM';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Are you sure you want to close your DM with $username? You can always reopen it later.';
  }

  @override
  String get dmCopyChannelId => 'Copy Channel ID';

  @override
  String get dmChannelIdCopied => 'Channel ID copied';

  @override
  String get dmCopyUserId => 'Copy User ID';

  @override
  String get dmUserIdCopied => 'User ID copied';

  @override
  String get dmViewProfile => 'View Profile';

  @override
  String get dmVoiceCall => 'Start Voice Call';

  @override
  String get incomingVoiceCallTitle => 'Incoming voice call';

  @override
  String get incomingVoiceCallAccept => 'Accept';

  @override
  String get incomingVoiceCallDecline => 'Reject';

  @override
  String get incomingVoiceCallLabel => 'Incoming call';

  @override
  String get incomingVoiceCallIgnore => 'Ignore';

  @override
  String get directVoiceCallNotEligible =>
      'This call can\'t be started right now. Try again in a moment.';

  @override
  String get voiceJoinCallFailed =>
      'Couldn\'t connect to this call. Check your connection and try again.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Couldn\'t join this call. Check your connection and try again.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Couldn\'t update this call on the server. Check your connection and try again.';

  @override
  String get dmAddNote => 'Add Note';

  @override
  String get dmEditGroup => 'Edit Group';

  @override
  String get dmInviteToCommunity => 'Invite to Community';

  @override
  String get dmBlock => 'Block';

  @override
  String get dmLeaveGroup => 'Leave Group';

  @override
  String get dmNoCommunitiesAvailable => 'No communities available';

  @override
  String dmGroupMemberCount(int count) {
    return '$count Members';
  }

  @override
  String get dmMuteFor15Min => 'For 15 minutes';

  @override
  String get dmMuteFor30Min => 'For 30 minutes';

  @override
  String get dmMuteFor1Hour => 'For 1 hour';

  @override
  String get dmMuteFor3Hours => 'For 3 hours';

  @override
  String get dmMuteFor4Hours => 'For 4 hours';

  @override
  String get dmMuteFor8Hours => 'For 8 hours';

  @override
  String get dmMuteFor24Hours => 'For 24 hours';

  @override
  String get dmMuteFor3Days => 'For 3 days';

  @override
  String get dmMuteForever => 'Until I turn it back on';

  @override
  String get dmPinGroupDm => 'Pin Group DM';

  @override
  String get dmUnpinGroupDm => 'Unpin Group DM';

  @override
  String get dmFavoriteDm => 'Favorite DM';

  @override
  String get dmUnfavoriteDm => 'Unfavorite DM';

  @override
  String get dmFavoriteGroupDm => 'Favorite Group DM';

  @override
  String get dmUnfavoriteGroupDm => 'Unfavorite Group DM';

  @override
  String get dmChangeFriendNickname => 'Change Friend Nickname';

  @override
  String get dmRemoveFriend => 'Remove Friend';

  @override
  String get dmAddFriend => 'Add Friend';

  @override
  String get dmAcceptFriendRequest => 'Accept Friend Request';

  @override
  String get dmIgnoreFriendRequest => 'Ignore Friend Request';

  @override
  String get dmFriendRequestSent => 'Friend Request Sent';

  @override
  String get dmUnblock => 'Unblock';

  @override
  String get dmDebugUser => 'Debug User';

  @override
  String get dmDebugChannel => 'Debug Channel';

  @override
  String get dmPinned => 'Pinned DM';

  @override
  String get dmUnpinned => 'Unpinned DM';

  @override
  String get dmMuted => 'Muted DM';

  @override
  String get dmUnmuted => 'Unmuted DM';

  @override
  String get dmRemoveFriendConfirmTitle => 'Remove Friend';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Are you sure you want to remove $username as a friend?';
  }

  @override
  String get dmBlockConfirmTitle => 'Block User';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Are you sure you want to block $username? They won\'t be able to message you or send you friend requests.';
  }

  @override
  String get dmFriendRequestSentToast => 'Friend request sent';

  @override
  String get dmFriendRequestFailed => 'Failed to send friend request';

  @override
  String get dmAcceptFriendRequestFailed => 'Failed to accept friend request';

  @override
  String get dmRemoveFriendFailed => 'Failed to remove friend';

  @override
  String get dmBlockFailed => 'Failed to block user';

  @override
  String get dmUnblockFailed => 'Failed to unblock user';

  @override
  String get dmIgnoreFriendRequestFailed => 'Failed to ignore friend request';

  @override
  String get dmAddFriends => 'Add friends';

  @override
  String get addFriendSheetTitle => 'Add friend';

  @override
  String get addFriendUsernameHint => 'Username#0000';

  @override
  String get addFriendUsernameLabel => 'Friend\'s username';

  @override
  String get addFriendSendRequest => 'Send request';

  @override
  String get addFriendNoUserFound => 'No user found with that username.';

  @override
  String get addFriendInvalidUsername =>
      'Enter a valid username (Username#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Friend request sent';

  @override
  String get addFriendClaimTitle => 'Claim your account';

  @override
  String get addFriendClaimDescription =>
      'Claim your account to send friend requests.';

  @override
  String get addFriendVerifyTitle => 'Verify your email';

  @override
  String get addFriendVerifyDescription =>
      'You need to verify your email address before you can send friend requests.';

  @override
  String get addFriendVerifyEmail => 'Verify email';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Incoming friend requests ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Outgoing friend requests ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Incoming friend request';

  @override
  String get addFriendOutgoingStatus => 'Friend request sent';

  @override
  String get addFriendViewProfile => 'View profile';

  @override
  String get addFriendAccept => 'Accept';

  @override
  String get addFriendIgnore => 'Ignore';

  @override
  String get addFriendAcceptTitle => 'Accept friend request';

  @override
  String get addFriendIgnoreTitle => 'Ignore friend request';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Accept the friend request from $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Ignore the friend request from $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Cancel request';

  @override
  String get addFriendCancelRequestFailed =>
      'Couldn\'t cancel the friend request. Try again.';

  @override
  String get addFriendNotAcceptingRequests =>
      'They\'re not accepting friend requests right now.';

  @override
  String get addFriendUnblockFirst =>
      'Unblock them first to send a friend request.';

  @override
  String get addFriendCannotSendToSelf =>
      'You can\'t send a friend request to yourself.';

  @override
  String get addFriendAlreadyFriends =>
      'You\'re already friends with this user.';

  @override
  String get addFriendClaimToSend =>
      'Finish signing up to send friend requests.';

  @override
  String get addFriendSendFailedGeneric =>
      'Couldn\'t send the friend request. Try again.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'System';

  @override
  String get emojiSearchPlaceholder => 'Find the emoji of your dreams';

  @override
  String get emojiSearchEmpty => 'No emojis match your search';

  @override
  String get emojiAutocompleteDefaultLabel => 'Default emoji';

  @override
  String get emojiFrequentlyUsed => 'Frequently Used';

  @override
  String get emojiTabGifs => 'GIFs';

  @override
  String get emojiTabMedia => 'Media';

  @override
  String get emojiTabStickers => 'Stickers';

  @override
  String get emojiTabEmojis => 'Emojis';

  @override
  String get gifPickerSearch => 'Search GIFs';

  @override
  String get gifPickerSearchKlipy => 'Search KLIPY';

  @override
  String get gifPickerSearchTenor => 'Search Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Favorites';

  @override
  String get gifPickerTrending => 'Trending GIFs';

  @override
  String get gifPickerNoResultsTitle => 'No Search Results';

  @override
  String get gifPickerNoResultsDescription => 'Try another search term';

  @override
  String get gifPickerLoadFailedTitle => 'Couldn\'t load GIFs';

  @override
  String get gifPickerLoadFailedBody => 'Check your connection and try again.';

  @override
  String get emojiCategoryPeople => 'People';

  @override
  String get emojiCategoryNature => 'Nature';

  @override
  String get emojiCategoryFood => 'Food & Drink';

  @override
  String get emojiCategoryActivity => 'Activities';

  @override
  String get emojiCategoryTravel => 'Travel & Places';

  @override
  String get emojiCategoryObjects => 'Objects';

  @override
  String get emojiCategorySymbols => 'Symbols';

  @override
  String get emojiCategoryFlags => 'Flags';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Unlock $emojiCount from $communityCount with Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Get Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Don\'t show this again';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count custom emojis',
      one: '1 custom emoji',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count communities',
      one: '1 community',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'External Link Warning';

  @override
  String get externalLinkWarningLeaving => 'You are about to leave Fluxer';

  @override
  String get externalLinkWarningDescription =>
      'External links can be dangerous. Please be careful.';

  @override
  String get externalLinkWarningDestinationUrl => 'Destination URL:';

  @override
  String get externalLinksSectionTitle => 'External Links';

  @override
  String get externalLinksSectionDescription =>
      'Configure how external link warnings are handled.';

  @override
  String get externalLinkWarningTrustPrefix => 'Always trust ';

  @override
  String get externalLinkWarningTrustSuffix => ' — skip this warning next time';

  @override
  String get externalLinkVisitSite => 'Visit Site';

  @override
  String get externalLinkTrustAllLabel => 'Trust all external links';

  @override
  String get externalLinkStripTrackingLabel =>
      'Strip tracking parameters from URLs';

  @override
  String get externalLinkStripTrackingDescription =>
      'Automatically remove tracking parameters (like utm_source, fbclid, gclid) from URLs in messages you send. Cleans the link before it reaches anyone else.';

  @override
  String get externalLinkTrustAllConfirmTitle => 'Trust all external links?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'This will trust all external links and skip the warning for every domain. Your existing trusted domains will be replaced. This is less secure.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Trust All';

  @override
  String get externalLinkStopTrustingAllTitle => 'Stop trusting all links?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'External link warnings will be shown again. You will need to add trusted domains individually.';

  @override
  String get externalLinkStopTrustingAllAction => 'Disable Trust All';

  @override
  String get externalLinkTrustedAllDescription =>
      'All external links are trusted. Warnings will not be shown.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'You have $count trusted domain(s). Add more by checking the box when visiting external links.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'When enabled, no external link warnings will be shown. This is less secure.';

  @override
  String get imageFileTooLarge =>
      'Image file is too large. Please choose a file smaller than 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Animated avatars require Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Animated banners require Plutonium';

  @override
  String get animatedAvifNotSupported => 'Animated AVIF Not Supported';

  @override
  String get animatedAvifNotSupportedBody =>
      'Cropping and rotating animated AVIF files isn\'t supported yet. If you proceed, it will be uploaded in its original form.';

  @override
  String get uploadAsIs => 'Upload As-Is';

  @override
  String get croppingAnimatedNotSupported =>
      'Cropping animated images isn\'t supported yet. The original upload will be used.';

  @override
  String get cropAvatar => 'Crop Avatar';

  @override
  String get cropBanner => 'Crop Banner';

  @override
  String get skip => 'Skip';

  @override
  String get crop => 'Crop';

  @override
  String get changeYourFluxerTag => 'Change Your Username';

  @override
  String get fluxerTagInputLabel => 'Username';

  @override
  String get fluxerTagDescriptionBase =>
      'Usernames can only contain letters (a-z, A-Z), numbers (0-9), and underscores. Usernames are case-insensitive.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Usernames can only contain letters (a-z, A-Z), numbers (0-9), and underscores. Usernames are case-insensitive. You can pick any available 4-digit tag from #0000 to #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Usernames can only contain letters (a-z, A-Z), numbers (0-9), and underscores. Usernames are case-insensitive. You can pick any available 4-digit tag from #0001 to #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Between $min and $max characters';
  }

  @override
  String get validationAllowedChars =>
      'Letters (a-z, A-Z), numbers (0-9), and underscores (_) only';

  @override
  String get discriminatorPremiumTooltip =>
      'Get Plutonium to customize your tag or keep it when changing your username';

  @override
  String get fluxerTagAlreadyTaken => 'Username Already Taken';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'The username $username#$discriminator is already taken. Continuing will reroll your discriminator automatically.';
  }

  @override
  String get customTagIsTemporary => 'Custom Tag Is Temporary';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Your custom 4-digit tag is only available while your Plutonium subscription is active. When your subscription expires on $date, your tag will revert to a randomly assigned number after a 3-day grace period.';
  }

  @override
  String get customTagTemporaryBody =>
      'Your custom 4-digit tag is only available while your Plutonium subscription is active. When your subscription expires, your tag will revert to a randomly assigned number after a 3-day grace period.';

  @override
  String get iUnderstandContinue => 'I Understand, Continue';

  @override
  String get premiumWarningPendingDiscriminator =>
      'If you save this username, your custom 4-digit tag will revert to a random number when your Plutonium subscription ends. If your subscription fails to renew, you\'ll have a 3-day grace period before the tag changes.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Your custom 4-digit tag (#$discriminator) is active while your Plutonium subscription is active. If your subscription ends or fails to renew after a 3-day grace period, your tag will revert to a random number.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Customize your 4-digit tag or keep it when changing your username';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Your Plutonium trial expires on $date. Upgrade to keep your custom tag and earn a badge on your profile.';
  }

  @override
  String get premiumTrialActive =>
      'You\'re on a Plutonium trial. Upgrade to keep your custom tag and earn a badge on your profile.';

  @override
  String get fluxerTagUpdated => 'Username updated';

  @override
  String get fluxerTagUpdateFailed =>
      'Failed to update username. Please try again.';

  @override
  String get continueAction => 'Continue';

  @override
  String get profileCustomizationTitle => 'Profile Customization';

  @override
  String get profileCustomizationDescription =>
      'Edit your profile appearance and see a live preview';

  @override
  String get usernameLabel => 'Username';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Claim your account to change your username';

  @override
  String get changeFluxerTag => 'Change Username';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Customize your 4-digit tag (#$discriminator) to your liking with Plutonium';
  }

  @override
  String get changeUsernameAndTagHint => 'Change your username and 4-digit tag';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Your custom tag (#$discriminator) is tied to your Plutonium subscription and will revert to a random tag if it expires.';
  }

  @override
  String get displayNameLabel => 'Display Name';

  @override
  String get pronounsLabel => 'Pronouns';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Change Avatar';

  @override
  String get removeAvatar => 'Remove Avatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Max 10MB. Recommended: 512×512px';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get changeBanner => 'Change Banner';

  @override
  String get removeBanner => 'Remove Banner';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Max 10MB. Minimum: 680×240px (17:6)';

  @override
  String get accentColorLabel => 'Accent Color';

  @override
  String get accentColorDescription =>
      'Customizes the border and banner color on your profile';

  @override
  String get aboutMeLabel => 'About Me';

  @override
  String get aboutMeHelperText => 'You can use links, emoji, and Markdown.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle => 'Plutonium Badge Privacy';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Control how your Plutonium badge is displayed to others';

  @override
  String get hidePlutoniumBadgeLabel => 'Hide Plutonium badge entirely';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Completely hide your Plutonium badge from other users';

  @override
  String get hidePlutoniumPurchaseDate => 'Hide Plutonium purchase date';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Hide Plutonium purchase date ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Remove when you first bought Plutonium from your badge';

  @override
  String get maskVisionaryAsSubscription => 'Mask Visionary as subscription';

  @override
  String get maskVisionaryDescription =>
      'Show your Visionary as a regular subscription instead';

  @override
  String get hideVisionaryIdBadge => 'Hide Visionary ID badge';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Hide Visionary ID badge (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Remove your Visionary ID badge';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'You\'re on a Plutonium trial — your subscription starts on $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Your subscription will automatically begin when your trial ends. No action needed.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'You\'re on a Plutonium trial that expires on $date';
  }

  @override
  String get premiumTrialActiveProfile => 'You\'re on a Plutonium trial';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Max 10MB. Recommended: 512×512px. Animated avatars (GIF) require Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Customize your profile with a static or animated banner image to make it stand out.';

  @override
  String get getPlutonium => 'Get Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'In-app purchases are not available on this platform yet. Stay tuned — coming soon!';

  @override
  String get profilePreviewLabel => 'Preview';

  @override
  String get profilePreviewMessage => 'Message';

  @override
  String get profilePreviewMemberSince => 'Fluxer Member Since';

  @override
  String get unclaimedAccountTitle => 'Unclaimed Account';

  @override
  String get unclaimedAccountDescription =>
      'Your account is not yet claimed. Without an email and password, you could lose access. Claim your account now to secure it.';

  @override
  String get claimAccount => 'Claim Account';

  @override
  String get profileTypeLabel => 'Profile Type';

  @override
  String get profileTypeGlobal => 'Global Profile';

  @override
  String get profileTypeGuildDescription =>
      'You are editing your per-community profile. This profile will only be visible in this community and will override your global profile.';

  @override
  String get communityNicknameLabel => 'Community Nickname';

  @override
  String get perGuildPremiumUpsellText =>
      'Customizing your avatar, banner, accent color, and bio for individual communities requires Plutonium. Community nickname and pronouns are free for everyone.';

  @override
  String get avatarModeInherit => 'Use Global Profile';

  @override
  String get avatarModeCustom => 'Use Custom Image';

  @override
  String get avatarModeUnset => 'Don\'t Show';

  @override
  String get profileSavedToast => 'Profile updated';

  @override
  String get profileEditButton => 'Edit Profile';

  @override
  String get profileNoteLabel => 'Note';

  @override
  String get profileNoteVisibility => '(only visible to you)';

  @override
  String get profileNoteEmpty => 'No note yet.';

  @override
  String get sudoTitle => 'Verify Your Identity';

  @override
  String get sudoDescription =>
      'This action requires verification to continue.';

  @override
  String get sudoAuthenticatorCode => 'Authenticator Code';

  @override
  String get sudoMethodPassword => 'Password';

  @override
  String get sudoMethodTotp => 'Authenticator';

  @override
  String get sudoVerificationFailed => 'Verification failed. Please try again.';

  @override
  String get securityAccountTitle => 'Account';

  @override
  String get securityAccountDescription =>
      'Manage your email, password, and account settings';

  @override
  String get securitySectionTitle => 'Security';

  @override
  String get securitySectionDescription =>
      'Protect your account with two-factor authentication and passkeys';

  @override
  String get securityLoginEmailSectionTitle => 'Email Settings';

  @override
  String get securityLoginEmailSectionDescription =>
      'Manage the email address you use to sign in to Fluxer';

  @override
  String get securityLoginEmailAddressLabel => 'Email Address';

  @override
  String get securityLoginNoEmailSet => 'No email address set';

  @override
  String get securityLoginChangeEmail => 'Change Email';

  @override
  String get securityLoginAddEmail => 'Add Email';

  @override
  String get securityLoginReveal => 'Reveal';

  @override
  String get securityLoginHide => 'Hide';

  @override
  String get securityLoginPasswordSectionTitle => 'Password';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Change your password to keep your account secure';

  @override
  String get securityLoginCurrentPasswordLabel => 'Current Password';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Last changed: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Last changed: Never';

  @override
  String get securityLoginNoPasswordSet => 'No password set';

  @override
  String get securityLoginChangePassword => 'Change Password';

  @override
  String get securityLoginSetPassword => 'Set Password';

  @override
  String get passwordChangeTitle => 'Change Password';

  @override
  String get passwordChangeIntroDescription =>
      'We\'ll send a verification code to your email address to confirm your identity before changing your password.';

  @override
  String get passwordChangeStart => 'Start';

  @override
  String get passwordChangeVerifyTitle => 'Verify Your Email';

  @override
  String get passwordChangeVerifyDescription =>
      'Enter the verification code sent to your email address.';

  @override
  String get passwordChangeVerificationCode => 'Verification Code';

  @override
  String get passwordChangeVerify => 'Verify';

  @override
  String get passwordChangeNewPasswordTitle => 'Set New Password';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Enter your new password below.';

  @override
  String get passwordChangeNewPassword => 'New Password';

  @override
  String get passwordChangeConfirmPassword => 'Confirm New Password';

  @override
  String get passwordChangeSubmit => 'Change Password';

  @override
  String get passwordChangeSuccess => 'Password changed';

  @override
  String get passwordChangePasswordsDoNotMatch => 'Passwords do not match';

  @override
  String get passwordChangeInvalidCode => 'Invalid or expired code';

  @override
  String get emailChangeTitle => 'Change Email';

  @override
  String get emailChangeIntroDescription =>
      'We\'ll send verification codes to verify your identity before changing your email address.';

  @override
  String get emailChangeStart => 'Start';

  @override
  String get emailChangeVerifyOriginalTitle => 'Verify Current Email';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Enter the verification code sent to your current email address.';

  @override
  String get emailChangeNewEmailTitle => 'Enter New Email';

  @override
  String get emailChangeNewEmailDescription =>
      'Enter the new email address you\'d like to use.';

  @override
  String get emailChangeNewEmailLabel => 'New Email';

  @override
  String get emailChangeNewEmailSubmit => 'Send Verification Code';

  @override
  String get emailChangeVerifyNewTitle => 'Verify New Email';

  @override
  String get emailChangeVerifyNewDescription =>
      'Enter the verification code sent to your new email address.';

  @override
  String get emailChangeSuccess => 'Email changed';

  @override
  String get emailChangeInvalidCode => 'Invalid or expired code';

  @override
  String get resend => 'Resend';

  @override
  String resendCountdown(int seconds) {
    return 'Resend (${seconds}s)';
  }

  @override
  String get verificationCode => 'Verification Code';

  @override
  String get verify => 'Verify';

  @override
  String get enable => 'Enable';

  @override
  String get disable => 'Disable';

  @override
  String get delete => 'Delete';

  @override
  String get save => 'Save';

  @override
  String get securityTfaSectionTitle => 'Two-Factor Authentication';

  @override
  String get securityTfaSectionDescription =>
      'Add an extra layer of security to your account';

  @override
  String get securityTfaAuthenticatorApp => 'Authenticator App';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Two-factor authentication is enabled';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Use an authenticator app to generate codes for two-factor authentication';

  @override
  String get securityTfaBackupCodes => 'Backup Codes';

  @override
  String get securityTfaBackupCodesDescription =>
      'View and manage your backup codes for account recovery';

  @override
  String get securityTfaViewCodes => 'View Codes';

  @override
  String get securityPasskeysSectionTitle => 'Passkeys';

  @override
  String get securityPasskeysSectionDescription =>
      'Use passkeys for passwordless sign-in and two-factor authentication';

  @override
  String get securityPasskeysRegistered => 'Registered Passkeys';

  @override
  String get securityPasskeysNone => 'No passkeys registered';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'passkeys',
      one: 'passkey',
    );
    return '$count $_temp0 registered (max 10)';
  }

  @override
  String get securityPasskeysAdd => 'Add Passkey';

  @override
  String securityPasskeysAdded(String date) {
    return 'Added: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Last used: $date';
  }

  @override
  String get securityPasskeysRename => 'Rename';

  @override
  String get securityPasskeysDeleteTitle => 'Delete Passkey';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Are you sure you want to delete the passkey \"$name\"?';
  }

  @override
  String get securityPasskeyNameTitle => 'Name Passkey';

  @override
  String get securityPasskeyNameLabel => 'Passkey Name';

  @override
  String get securityPasskeyNameHint => 'e.g., YubiKey, iPhone, Work Computer';

  @override
  String get securityPhoneSectionTitle => 'Phone Number';

  @override
  String get securityPhoneSectionDescription => 'Manage your phone number.';

  @override
  String get securityPhoneLabel => 'Phone Number';

  @override
  String get securityPhoneNone => 'No phone number added.';

  @override
  String get securityPhoneAdd => 'Add Phone';

  @override
  String get securityPhoneRemove => 'Remove';

  @override
  String get securityPhoneRemoveTitle => 'Remove Phone Number';

  @override
  String get securityPhoneRemoveDescription =>
      'Are you sure you want to remove your phone number?';

  @override
  String get securityPhoneRemoved => 'Phone number removed';

  @override
  String get securityClaimTitle => 'Security Features';

  @override
  String get securityClaimDescription =>
      'Claim your account to access security features like two-factor authentication and passkeys.';

  @override
  String get securityVerifyEmailRequired =>
      'You must verify your email address before you can set up two-factor authentication, passkeys, or SMS verification.';

  @override
  String get totpEnableTitle => 'Setup Authenticator App';

  @override
  String get totpEnableDescription =>
      'Scan the QR code with your authenticator app to generate codes for two-factor authentication.';

  @override
  String get totpEnableCodeLabel => 'Code';

  @override
  String get totpEnableCodeHint =>
      'Enter the 6-digit code from your authenticator app';

  @override
  String get totpEnableSuccess => 'Two-factor authentication has been enabled';

  @override
  String get totpDisableTitle => 'Remove Authenticator App';

  @override
  String get totpDisableDescription =>
      'Enter the 6-digit code from your authenticator app to disable two-factor authentication.';

  @override
  String get totpDisableSuccess => 'Two-factor authentication disabled';

  @override
  String get backupCodesTitle => 'Backup Codes';

  @override
  String get backupCodesWarning =>
      'If you lose access to your authenticator app and don\'t have these codes, you will be permanently locked out of your account. Download or copy them now and store them somewhere safe.';

  @override
  String get backupCodesDownload => 'Download';

  @override
  String get backupCodesCopy => 'Copy';

  @override
  String get backupCodesCopied => 'Backup codes copied to clipboard';

  @override
  String get backupCodesAcknowledge =>
      'I have downloaded or copied my backup codes and stored them in a safe place.';

  @override
  String get backupCodesDone => 'Done';

  @override
  String get backupCodesViewTitle => 'View Backup Codes';

  @override
  String get backupCodesViewDescription =>
      'Verification may be required before viewing your backup codes.';

  @override
  String get phoneAddTitle => 'Add Phone Number';

  @override
  String get phoneAddLabel => 'Phone Number';

  @override
  String get phoneAddHint => 'Enter your phone number';

  @override
  String get phoneAddFooter =>
      'Enter your phone number. We\'ll send you a verification code via SMS.';

  @override
  String get phoneAddSendCode => 'Send Code';

  @override
  String get phoneVerifyTitle => 'Verify Phone Number';

  @override
  String get phoneVerifyDescription =>
      'Enter the verification code sent to your phone number.';

  @override
  String get phoneAddSuccess => 'Phone number added';

  @override
  String get dangerZoneSectionTitle => 'Danger Zone';

  @override
  String get dangerZoneSectionDescription =>
      'Irreversible and destructive actions';

  @override
  String get dangerZoneDisableTitle => 'Disable Account';

  @override
  String get dangerZoneDisableDescription =>
      'Temporarily disable your account. You can reactivate it later by signing back in.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Disabling your account will log you out of all sessions. You can re-enable your account at any time by logging in again.';

  @override
  String get dangerZoneDeleteTitle => 'Delete Account';

  @override
  String get dangerZoneDeleteDescription =>
      'Permanently delete your account and all associated data. This action cannot be undone.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Cancel your active Plutonium subscription in Plutonium settings before deleting your account.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'Cannot delete account';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'You cannot delete your account while you own communities. Transfer ownership of the following communities first:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'and $count more';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'To transfer ownership, go to $settingsPath and use the transfer ownership option.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Are you sure you want to delete your account? This action will schedule your account for permanent deletion.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'You can cancel the deletion process within 14 days';

  @override
  String get dangerZoneDeleteBullet2 =>
      'After 14 days, your account will be permanently deleted';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Once deletion is processed, you cannot recover access to your account';

  @override
  String get dangerZoneDeleteBullet4 =>
      'You will not be able to delete your sent messages after your account is deleted';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'If you want to export your data or delete your messages first, please visit the Privacy Dashboard section in User Settings before proceeding.';

  @override
  String get claimAccountTitle => 'Claim Your Account';

  @override
  String get claimAccountDescription =>
      'Claim your account by adding an email and password. We will send a verification code to confirm your email before finishing.';

  @override
  String get claimAccountEmailLabel => 'Email';

  @override
  String get claimAccountPasswordLabel => 'Password';

  @override
  String get claimAccountSendCode => 'Send Code';

  @override
  String get claimAccountVerifyDescription =>
      'Enter the code we sent to your email to verify it. Your password will be set once the code is confirmed.';

  @override
  String get claimAccountSuccess => 'Account claimed successfully';

  @override
  String get importantInformation => 'Important information:';

  @override
  String get genericError => 'An error occurred';

  @override
  String get invalidCode => 'Invalid code';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count years ago',
      one: '1 year ago',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count months ago',
      one: '1 month ago',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days ago',
      one: '1 day ago',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hours ago',
      one: '1 hour ago',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes ago',
      one: '1 minute ago',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'just now';

  @override
  String get authorizedAppsTitle => 'Authorized Applications';

  @override
  String get authorizedAppsDescription =>
      'These applications have been granted access to your Fluxer account.';

  @override
  String get authorizedAppsEmptyTitle => 'No Authorized Applications';

  @override
  String get authorizedAppsEmptyDescription =>
      'You haven\'t authorized any applications to access your account.';

  @override
  String get authorizedAppsLoadError =>
      'Failed to Load Authorized Applications';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Authorized on $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Permissions granted';

  @override
  String get authorizedAppsRevoke => 'Revoke';

  @override
  String get authorizedAppsRevokeTitle => 'Revoke application access';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Are you sure you want to revoke access for $appName? This application will no longer have access to your account.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Access your basic profile information (username, avatar, etc.)';

  @override
  String get authorizedAppsScopeEmail => 'View your email address';

  @override
  String get authorizedAppsScopeGuilds =>
      'View the communities you are a member of';

  @override
  String get authorizedAppsScopeConnections => 'View your connected accounts';

  @override
  String get authorizedAppsScopeBot =>
      'Add a bot to a community with requested permissions';

  @override
  String get authorizedAppsScopeAdmin => 'Access administrative endpoints';

  @override
  String get privacyPendingDeletionTitle => 'Pending Deletion';

  @override
  String get blockedUsersTitle => 'Blocked Users';

  @override
  String get blockedUsersDescription =>
      'Blocked users can\'t send you friend requests or message you directly.';

  @override
  String get blockedUsersEmptyTitle => 'No Blocked Users';

  @override
  String get blockedUsersEmptyDescription => 'You haven\'t blocked anyone yet.';

  @override
  String get blockedUsersLoadError => 'Failed to Load Blocked Users';

  @override
  String get blockedUsersUnblock => 'Unblock';

  @override
  String get blockedUsersUnblockTitle => 'Unblock User';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Are you sure you want to unblock $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Copy username';

  @override
  String get blockedUsersCopyId => 'Copy User ID';

  @override
  String get userProfileLoadError => 'Couldn\'t load profile';

  @override
  String get userProfileRetry => 'Retry';

  @override
  String get userProfileMessage => 'Message';

  @override
  String get userProfileVoiceCall => 'Voice Call';

  @override
  String get userProfileVideoCall => 'Video Call';

  @override
  String get userProfileEditProfile => 'Edit Profile';

  @override
  String get userProfileStaffBadgeTooltip => 'Fluxer Staff';

  @override
  String get userProfileCtpBadgeTooltip => 'Fluxer Community Team';

  @override
  String get userProfilePartnerBadgeTooltip => 'Fluxer Partner';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Fluxer Bug Hunter';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer Plutonium';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Fluxer Plutonium subscriber since $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Fluxer Visionary';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Fluxer Visionary since $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'Visionary ID #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Mutual Friends ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Mutual Communities ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Mutual Friends';

  @override
  String get userProfileMutualCommunitiesTitle => 'Mutual Communities';

  @override
  String get userProfileNoMutualFriends => 'No mutual friends found.';

  @override
  String get userProfileNoMutualCommunities => 'No mutual communities found.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Nickname: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Open DM';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'You blocked $username. You won\'t be able to send messages unless you unblock them.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Unblock';

  @override
  String get userProfileOpenDm => 'Open DM';

  @override
  String get userProfileNoteTitle => 'Note';

  @override
  String get userProfileNoteVisibility => '(only visible to you)';

  @override
  String get userProfileNoteSave => 'Save';

  @override
  String get userProfileNoteDelete => 'Delete';

  @override
  String get userProfileNoteEmpty => 'Click to add a note';

  @override
  String get userProfileMemberSince => 'Member Since';

  @override
  String get userProfileAboutMe => 'About Me';

  @override
  String get userProfileCopyUsername => 'Copy Username';

  @override
  String get userProfileCopyUserId => 'Copy User ID';

  @override
  String get userProfileViewMainProfile => 'View Main Profile';

  @override
  String get userProfileViewCommunityProfile => 'View Community Profile';

  @override
  String get userProfileBlockUser => 'Block User';

  @override
  String get userProfileUnblockUser => 'Unblock User';

  @override
  String get userProfileRemoveFriend => 'Remove Friend';

  @override
  String get userProfileBlockConfirmTitle => 'Block User';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Are you sure you want to block $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Unblock User';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Are you sure you want to unblock $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Remove Friend';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Are you sure you want to remove $username as a friend?';
  }

  @override
  String get userProfileFailedOpenDm => 'Failed to open DM';

  @override
  String get userProfileFailedSaveNote => 'Failed to save note';

  @override
  String get userProfileActionFailed => 'Action failed, please try again';

  @override
  String get userProfileChangeNickname => 'Change nickname';

  @override
  String get userProfileKick => 'Kick';

  @override
  String get userProfileBan => 'Ban';

  @override
  String get userProfileTimeout => 'Timeout';

  @override
  String get userProfileRemoveTimeout => 'Remove timeout';

  @override
  String get userProfileTransferOwnership => 'Transfer ownership';

  @override
  String get userProfileReportUser => 'Report user';

  @override
  String get userProfileReportMessage => 'Report message';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Kick $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Are you sure you want to kick $username? They can rejoin with a new invite.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Remove timeout?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Removing the timeout will allow $username to send messages, react, and join voice channels again.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Transfer ownership?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Transfer ownership of this community to $username? This is irreversible and you will lose all owner privileges.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Ban $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Ban duration';

  @override
  String get userProfileBanCustomSecondsLabel => 'Custom duration (seconds)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Any value from $min to $max seconds';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Delete message history';

  @override
  String get userProfileBanDeleteNone => 'Don\'t delete any';

  @override
  String get userProfileBanDelete24h => 'Previous 24 hours';

  @override
  String get userProfileBanDelete7d => 'Previous 7 days';

  @override
  String get userProfileBanReasonLabel => 'Reason (optional)';

  @override
  String get userProfileBanReasonHint => 'Enter a reason for the ban';

  @override
  String get userProfileBanSubmit => 'Ban member';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Timeout $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Timeout duration';

  @override
  String get userProfileTimeoutSubmit => 'Time out member';

  @override
  String get userProfileNicknameLabel => 'Nickname';

  @override
  String get userProfileNicknameHint => 'Enter a nickname';

  @override
  String get userProfileNicknameSave => 'Save';

  @override
  String userProfileKickSuccess(String username) {
    return 'Kicked $username';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Banned $username';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Timed out $username';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Removed timeout for $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Nickname updated';

  @override
  String get userProfileTransferSuccess => 'Ownership transferred';

  @override
  String get durationPermanent => 'Permanent';

  @override
  String get duration60Seconds => '60 seconds';

  @override
  String get duration5Minutes => '5 minutes';

  @override
  String get duration10Minutes => '10 minutes';

  @override
  String get duration1Hour => '1 hour';

  @override
  String get duration12Hours => '12 hours';

  @override
  String get duration1Day => '1 day';

  @override
  String get duration3Days => '3 days';

  @override
  String get duration5Days => '5 days';

  @override
  String get duration1Week => '1 week';

  @override
  String get duration2Weeks => '2 weeks';

  @override
  String get duration1Month => '1 month';

  @override
  String get durationCustom => 'Custom…';

  @override
  String get iarReportUserTitle => 'Report user';

  @override
  String get iarReasonInappropriateProfile => 'Inappropriate profile';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'This user\'s profile contains inappropriate content';

  @override
  String typingIndicatorOne(String name) {
    return '$name is typing...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 and $name2 are typing...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 and $name3 are typing...';
  }

  @override
  String get typingIndicatorMultiple => 'Several people are typing...';

  @override
  String get typingIndicatorHandful =>
      'A handful of keyboard warriors are assembling...';

  @override
  String get typingIndicatorSymphony =>
      'A symphony of clacking keys is underway...';

  @override
  String get typingIndicatorFiesta =>
      'It\'s a full-blown typing fiesta in here';

  @override
  String get typingIndicatorApocalypse => 'Whoa, it\'s a typing apocalypse';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Glad you\'re here, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Welcome, $username! Make yourself at home.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Hello, $username! Nice to have you here.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Hello, $username! Jump in whenever you\'re ready.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Hey $username, great to see you here!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Hey there, $username! Hope you enjoy your stay.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Hey, $username, welcome aboard!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Glad you made it, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Welcome in, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Welcome, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Welcome, $username! We\'re glad you\'re here.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Welcome, $username! Hope you enjoy your time here.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Welcome, $username! Your next conversation starts here.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Welcome, $username. We\'re happy to have you here.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Great to see you, $username! Welcome in.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'You\'re here, $username! Good to have you with us.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'You\'ve arrived, $username! Let\'s get started.';
  }

  @override
  String get relativeTimeShortNow => 'now';

  @override
  String relativeTimeShortMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}m',
      one: '1m',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}h',
      one: '1h',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}d',
      one: '1d',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}mo',
      one: '1mo',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}y',
      one: '1y',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'My Devices';

  @override
  String get linkedDevicesDescription =>
      'See all devices that are currently logged into your account. Revoke any sessions that you don\'t recognize.';

  @override
  String get linkedDevicesCurrentDevice => 'Current Device';

  @override
  String get linkedDevicesOtherDevices => 'Other Devices';

  @override
  String get linkedDevicesEnterSelection => 'Enter Selection Mode';

  @override
  String get linkedDevicesExitSelection => 'Exit Selection Mode';

  @override
  String get linkedDevicesSelectAll => 'Select All';

  @override
  String get linkedDevicesClearSelection => 'Clear Selection';

  @override
  String get linkedDevicesRevokeTooltip => 'Revoke device';

  @override
  String get linkedDevicesSignOutAll => 'Sign out all other devices';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sign out $count devices',
      one: 'Sign out 1 device',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sign out $count devices',
      one: 'Sign out 1 device',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle => 'Sign out all other devices';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'This will log out the selected devices from your account. You will need to log in again on those devices.',
      one:
          'This will log out the selected device from your account. You will need to log in again on that device.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'This will log out the selected devices from your account. You will need to log in again on those devices.';

  @override
  String get linkedDevicesSignOutConfirm => 'Continue';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'You\'ll have to log back in on all logged out devices';

  @override
  String get linkedDevicesLoadErrorTitle => 'Network Error';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'We\'re having trouble connecting to the space-time continuum. Please check your connection and try again.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Device revoked',
      one: 'Device revoked',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError => 'Couldn\'t sign out. Try again.';

  @override
  String get linkedDevicesUnknownOs => 'Unknown OS';

  @override
  String get linkedDevicesUnknownPlatform => 'Unknown Platform';

  @override
  String slowmodeLabel(String duration) {
    return '$duration slowmode';
  }

  @override
  String get slowmodeTooltipActive =>
      'You are in slowmode. Please wait before sending another message.';

  @override
  String get slowmodeTooltipImmune =>
      'Slowmode is enabled, but you are immune.';

  @override
  String get channelNoSendPermissionHint =>
      'You can\'t send messages in this channel.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'System announcements from $productName staff. You can\'t reply here.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Messaging is temporarily paused in this community.';

  @override
  String get channelComposerBarrierTimedOut =>
      'You\'re timed out. Messaging, reactions, and voice are paused until the timeout expires.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'You need to claim your account to send messages in this community.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'You need to verify your email to send messages in this community.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Your account is too new to send messages in this community.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'You haven\'t been a member of this community long enough to send messages.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'You need to verify a phone number to send messages in this community.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Verify email';

  @override
  String get channelComposerBarrierVerifyPhone => 'Verify phone';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Too many attachments (max $max)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'One or more files exceed the size limit';

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Those files are too large to send together';

  @override
  String get chatAttachmentDropToUpload => 'Drop files to upload';

  @override
  String get chatAttachmentDropToSend => 'Drop files to send now';

  @override
  String get chatAttachmentSendVoiceMessage => 'Send voice message';

  @override
  String get voiceMessageTitle => 'Voice message';

  @override
  String get voiceMessageHoldHint =>
      'Hold to record. Drag up to lock, or release to send.';

  @override
  String get voiceMessageDiscard => 'Discard voice message';

  @override
  String get voiceMessageSend => 'Send voice message';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Unable to start recording. Allow microphone access.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Voice recording is not supported on this device.';

  @override
  String get voiceMessageMicInUse =>
      'Leave the voice call to record a voice message.';

  @override
  String get voiceMessageRecordingFailed => 'Recording failed. Try again.';

  @override
  String get voiceMessageSendFailed =>
      'Unable to send voice message. Try again.';

  @override
  String get voiceMessageRecordingHint =>
      'Speak now. Press Stop when you are done — you can trim afterwards.';

  @override
  String get voiceMessageReviewHint =>
      'Drag the handles to trim, then press Send.';

  @override
  String get voiceMessageStop => 'Stop';

  @override
  String get voiceMessageStartRecording => 'Start recording';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Play';

  @override
  String get voiceMessagePause => 'Pause';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Selection must be at least ${secondsString}s.';
  }

  @override
  String get chatAttachmentEditTitle => 'Edit attachment';

  @override
  String get chatAttachmentFilenameLabel => 'Filename';

  @override
  String get chatAttachmentDescriptionLabel => 'Description';

  @override
  String get chatAttachmentDescriptionHint => 'Optional alt text';

  @override
  String get chatAttachmentSpoilerLabel => 'Mark as spoiler';

  @override
  String get chatAttachmentRemove => 'Remove attachment';

  @override
  String get chatAttachmentDownload => 'Download';

  @override
  String get chatAttachmentExpiredTooltip => 'Attachment expired';

  @override
  String get chatAttachmentSourceGallery => 'Gallery';

  @override
  String get chatAttachmentSourceCamera => 'Camera';

  @override
  String get chatAttachmentSourceBrowse => 'Browse files';

  @override
  String get chatAttachmentPasteTooltip => 'Paste image from clipboard';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Reveal spoiler';

  @override
  String get matureMediaRevealButton => 'Reveal';

  @override
  String get matureMediaRevealHint => 'Click to reveal';

  @override
  String get matureContentTitle => 'Mature content';

  @override
  String get matureCommunityTitle => 'Mature community';

  @override
  String get matureCategoryTitle => 'Mature category';

  @override
  String get matureChannelTitle => 'Mature channel';

  @override
  String get communityContentWarningTitle => 'Community content warning';

  @override
  String get categoryContentWarningTitle => 'Category content warning';

  @override
  String get channelContentWarningTitle => 'Channel content warning';

  @override
  String get defaultContentWarningBody => 'This contains sensitive content.';

  @override
  String get matureCommunityBody =>
      'This community is marked for mature content and may contain material that may be inappropriate for some users.';

  @override
  String get matureCategoryBody =>
      'This category is marked for mature content and may contain material that may be inappropriate for some users.';

  @override
  String get matureChannelBody =>
      'This channel is marked for mature content and may contain material that may be inappropriate for some users.';

  @override
  String get matureVoiceChannelBody =>
      'This voice channel is marked for mature content and may contain material that may be inappropriate for some users.';

  @override
  String get matureLinkChannelBody =>
      'This link channel is marked for mature content and may open material that may be inappropriate for some users.';

  @override
  String get matureCommunityUnavailableBody =>
      'This mature community is not available to your account.';

  @override
  String get matureCategoryUnavailableBody =>
      'This mature category is not available to your account.';

  @override
  String get matureChannelUnavailableBody =>
      'This mature channel is not available to your account.';

  @override
  String get matureContentProceedButton => 'Proceed';

  @override
  String get matureContentUnderstandButton => 'I understand';

  @override
  String get matureContentOpenLinkButton => 'Open link';

  @override
  String get sensitiveContentSectionTitle => 'Sensitive content';

  @override
  String get sensitiveContentSectionDescription =>
      'Control how mature or sensitive media is filtered in different contexts';

  @override
  String get sensitiveContentFriendDmLabel => 'Direct messages from friends';

  @override
  String get sensitiveContentNonFriendDmLabel => 'Direct messages from others';

  @override
  String get sensitiveContentGuildLabel => 'Messages in community channels';

  @override
  String get sensitiveContentFilterShow => 'Show';

  @override
  String get sensitiveContentFilterBlur => 'Blur';

  @override
  String get sensitiveContentFilterBlock => 'Block';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Blur media until safety scan completes';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'When enabled, images and videos are blurred until the content safety scan finishes.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'This setting is always on for your account.';

  @override
  String get sensitiveContentResetButton => 'Reset';

  @override
  String get sensitiveContentSaveButton => 'Save';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count files',
      one: '1 file',
    );
    return 'Uploading $_temp0';
  }

  @override
  String get chatCancelUpload => 'Cancel upload';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Expires on $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Expires between $start and $end';
  }

  @override
  String get connectionsTitle => 'Connections';

  @override
  String get connectionsDescription =>
      'Link external accounts and domains to your Fluxer profile. Verified connections will be displayed on your profile for others to see.';

  @override
  String get connectionsEmptyTitle => 'No connections yet';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Link your Bluesky account or verify domain ownership to display them on your profile.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Verify domain ownership to display it on your profile.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Domain';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Add Bluesky connection';

  @override
  String get connectionsAddDomainAriaLabel => 'Add domain connection';

  @override
  String get connectionEdit => 'Edit';

  @override
  String get connectionRemove => 'Remove';

  @override
  String get connectionVerifiedLabel => 'This connection has been verified.';

  @override
  String get connectionUnverifiedLabel =>
      'This connection has not been verified.';

  @override
  String get connectionAddTitle => 'Add Connection';

  @override
  String get connectionTypeLabel => 'Connection Type';

  @override
  String get connectionHandleLabel => 'Handle';

  @override
  String get connectionDomainLabel => 'Domain';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'You already have this connection.';

  @override
  String get connectionConnectBluesky => 'Connect with Bluesky';

  @override
  String get connectionContinue => 'Continue';

  @override
  String get connectionVerifyTitle => 'Verify Connection';

  @override
  String get connectionVerifyInstructions =>
      'Use the record below to prove domain ownership.';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT record';

  @override
  String get connectionDnsHostLabel => 'Host';

  @override
  String get connectionDnsValueLabel => 'Value';

  @override
  String get connectionCopyHost => 'Copy host';

  @override
  String get connectionCopyValue => 'Copy value';

  @override
  String get connectionCopied => 'Copied!';

  @override
  String get connectionTokenFileTitle => 'Serve the token file';

  @override
  String get connectionTokenFileDescription =>
      'Download **fluxer-verification** and place it in your **.well-known** folder so we can validate the domain.';

  @override
  String get connectionTokenFileDownload => 'Download fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'The file contains the verification token we will fetch from **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Save fluxer-verification';

  @override
  String get connectionVerifyButton => 'Verify';

  @override
  String get connectionBack => 'Back';

  @override
  String get connectionEditTitle => 'Edit Connection';

  @override
  String get connectionEditDescription =>
      'Choose who can see this connection on your profile.';

  @override
  String get connectionVisibilityEveryone => 'Everyone';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Allow anyone to see this connection on your profile';

  @override
  String get connectionVisibilityFriends => 'Friends';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Allow your friends to see this connection';

  @override
  String get connectionVisibilityCommunityMembers => 'Community Members';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Allow members from communities you\'re in to see this connection';

  @override
  String get connectionRemoveTitle => 'Remove Connection';

  @override
  String get connectionRemoveDescription =>
      'Are you sure you want to remove this connection? This action cannot be undone.';

  @override
  String get connectionRemoveConfirm => 'Remove';

  @override
  String get connectionsLoadError => 'Failed to load connections';

  @override
  String get connectionsReorderError => 'Failed to update order';

  @override
  String get connectionInitiateFailed =>
      'Couldn\'t start verification. Try again.';

  @override
  String get connectionVerifyFailed =>
      'Couldn\'t verify. Check your DNS record and try again.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Couldn\'t start Bluesky authorization.';

  @override
  String get connectionUpdateFailed => 'Couldn\'t update connection';

  @override
  String get connectionRemoveFailed => 'Couldn\'t remove connection';

  @override
  String get connectionTokenSavedToast => 'Saved fluxer-verification';

  @override
  String get connectionTokenSaveFailedToast => 'Couldn\'t save file';

  @override
  String get connectionEnterHandle => 'Enter a Bluesky handle.';

  @override
  String get connectionEnterDomain => 'Enter a domain.';

  @override
  String get lookAndFeelTitle => 'Look & Feel';

  @override
  String get lookAndFeelThemeSectionTitle => 'Theme';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Choose between dark, coal, or light appearance.';

  @override
  String get lookAndFeelThemeDark => 'Dark Theme';

  @override
  String get lookAndFeelThemeCoal => 'Coal Theme';

  @override
  String get lookAndFeelThemeLight => 'Light Theme';

  @override
  String get lookAndFeelThemeSystem => 'System Theme';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Sync theme across devices';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'When enabled, theme changes will sync to all your devices. When disabled, this device will use its own theme setting.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'System theme automatically disables sync to track your system\'s preference on this device.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Couldn\'t sync theme to your account. Please try again.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Chat Font Scaling';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Adjust the font size in the chat area.';

  @override
  String get lookAndFeelInterfaceTitle => 'Interface';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Customize interface elements and behaviors.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Channel list typing indicators';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Choose how typing indicators appear in the channel list when someone is typing in a channel.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Typing Indicator + Avatars';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Show typing indicator with user avatars in the channel list';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Typing Indicator Only';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Show just the typing indicator without avatars';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Hidden';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Don\'t show typing indicators in the channel list';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Show typing on selected channel';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'When disabled (default), typing indicators won\'t appear on the channel you\'re currently viewing.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'general';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Keyboard Hints';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Control whether keyboard shortcut hints appear inside tooltips.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Hide keyboard hints in tooltips';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'When enabled, shortcut badges are hidden in tooltip popups.';

  @override
  String get lookAndFeelNekoTitle => 'Miscellaneous';

  @override
  String get lookAndFeelNekoDescription => 'Miscellaneous interface options.';

  @override
  String get lookAndFeelShowNekoLabel => 'Show Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'When enabled, Neko appears near the chat input bar.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle => 'Voice channel join behavior';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Control how you join voice channels in communities.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Require double-click to join voice channels';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'When enabled, you\'ll need to double-click on voice channels to join them. When disabled (default), single-clicking will join the channel immediately.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'The quick brown fox jumps over the lazy dog.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Guild sidebar';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Configure how the guild sidebar displays direct messages.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count communities are temporarily unavailable due to a flux capacitor malfunction.',
      one:
          '1 community is temporarily unavailable due to a flux capacitor malfunction.',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel => 'Collapse DMs Into Folder';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'When enabled, unread DMs in the guild sidebar are collapsed into a folder on the Fluxer button. Click the Fluxer button while on the DMs page to expand or collapse the folder.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Channel List';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Control unread indicator behavior for muted channels in channel lists.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Show unread indicator on muted channels';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'When enabled, muted channels show a faded unread indicator on the left side. Mentions still appear regardless of this setting.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Active Now';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Control how Active Now surfaces across the app.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Show Active Now on the home screen';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Show Active Now on the home screen to surface friends active in voice. You\'ll see a preview, the channel context, who\'s already there, and a quick way to join in.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Favorites';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Control the visibility of favorites throughout the app.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Enable Favorites';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'When enabled, you can favorite channels and they\'ll appear in the Favorites section. When disabled, all favorite-related UI elements (buttons, menu items) will be hidden. Your existing favorites will be preserved.';

  @override
  String get favoritesTitle => 'Favorites';

  @override
  String get favoritesEmptyTitle => 'No favorites yet';

  @override
  String get favoritesEmptyDescription =>
      'Star channels from the chat header to keep them here.';

  @override
  String get favoritesWelcomeTitle => 'Welcome to favorites';

  @override
  String get favoritesWelcomeDescription =>
      'Your personal space for quick access to channels, DMs, and groups you love. Press the star on any channel to add it here.';

  @override
  String get favoritesWelcomeTip => 'Not for you? Turn it off anytime.';

  @override
  String get favoritesDisableButton => 'Disable favorites';

  @override
  String get favoritesAddedToast => 'Added to Favorites';

  @override
  String get favoritesRemovedToast => 'Removed from Favorites';

  @override
  String get favoritesHiddenToast => 'Favorites hidden';

  @override
  String get favoritesMute => 'Mute favorites';

  @override
  String get favoritesUnmute => 'Unmute favorites';

  @override
  String get favoritesHeaderMenu => 'Favorites menu';

  @override
  String get favoritesCreateCategory => 'Create category';

  @override
  String get favoritesCategoryNameLabel => 'Category name';

  @override
  String get favoritesHideMutedChannels => 'Hide muted channels';

  @override
  String get favoritesShowMutedChannels => 'Show muted channels';

  @override
  String get favoritesSetNickname => 'Set nickname';

  @override
  String get favoritesNicknameLabel => 'Nickname';

  @override
  String get favoritesSaveNickname => 'Save nickname';

  @override
  String get favoritesMoveToCategory => 'Move to category';

  @override
  String get favoritesUncategorized => 'Uncategorized';

  @override
  String get favoritesOtherCategory => 'Other';

  @override
  String get favoritesRemoveFromFavorites => 'Remove from Favorites';

  @override
  String get favoritesAddToFavorites => 'Add to Favorites';

  @override
  String get favoritesHideConfirmTitle => 'Hide favorites';

  @override
  String get favoritesHideConfirmDescription =>
      'This will hide all favorites-related UI elements including buttons and menu items. Your existing favorites will be preserved and can be re-enabled anytime from Settings > Advanced > Appearance.';

  @override
  String get favoritesDirectMessageSubtitle => 'Direct Message';

  @override
  String get messagesMediaDisplayGroupTitle => 'Display';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Control how messages, media, and other content are displayed.';

  @override
  String get messagesMediaMediaGroupTitle => 'Media';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Customize media size preferences and buttons.';

  @override
  String get messagesMediaInputGroupTitle => 'Input';

  @override
  String get messagesMediaInputGroupDescription =>
      'Customize message input settings.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Sidebar';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Configure how the community sidebar is displayed.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Hide muted channels by default';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Automatically hide muted channels in the sidebar when you join new communities';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Hide muted channels by default?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'New communities you join will automatically have muted channels hidden. Would you also like to apply this setting to all your existing communities?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Stop hiding muted channels by default?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'New communities you join will no longer have muted channels hidden automatically. Would you also like to show muted channels in all your existing communities?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Apply to all communities';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Show in all communities';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'New communities only';

  @override
  String get messagesMediaDisplaySectionTitle => 'Media Display';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Control how images, videos and other media are shown. All media is resized and converted. Extremely large files that cannot be compressed into a preview will not embed regardless of these settings.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'When posted as links to chat';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'When uploaded directly to Fluxer';

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Link Previews';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Control how website links are previewed in chat';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Show embeds and preview website links';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reactions';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Configure emoji reactions on messages';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Show emoji reactions on messages';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Spoiler Content';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Control how spoiler content is displayed';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Show spoiler content';

  @override
  String get messagesMediaSpoilersOnClickName => 'On click';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Show spoiler content when clicked';

  @override
  String get messagesMediaSpoilersIfModeratorName => 'In channels I moderate';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Always show spoiler content in channels where you have the \"Manage Messages\" permission';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Always';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Always show spoiler content';

  @override
  String get messagesMediaSizeSectionTitle => 'Media Size Preferences';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Customize the maximum display size for embedded and attached media. Smaller sizes use less screen space, while larger sizes show more detail.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Media from links (embeds)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Uploaded attachments';

  @override
  String get messagesMediaSizeCompactName => 'Compact (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Smaller media size';

  @override
  String get messagesMediaSizeComfortableName => 'Comfortable (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Larger media size with more detail';

  @override
  String get messagesMediaGifsSectionTitle => 'GIF Behavior';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Control how GIFs are inserted into chat';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Automatically send GIFs when selected';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Expression autocomplete (colon autocomplete)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Control what appears in the expression autocomplete when you type colon. Customize what suggestions show up to match your preferences.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Show default emojis in expression autocomplete';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Show custom emojis in expression autocomplete';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Show stickers in expression autocomplete';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Show saved media in expression autocomplete';

  @override
  String get messagesMediaEditingSectionTitle => 'Message Editing';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Control what happens to your edit draft when you cancel.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Preserve edit draft on cancel';

  @override
  String get accessibilityDmMessagePreviewGroupTitle => 'DM message previews';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Control when message previews are shown in the DM list.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'DM message preview mode';

  @override
  String get accessibilityDmMessagePreviewAllName => 'All messages';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Show message previews for all DM conversations';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName => 'Unread DMs only';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Only show message previews for DMs with unread messages';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'None';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Don\'t show message previews in the DM list';

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
      'Read new messages aloud when they arrive in the active channel.';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Sync with system reduced motion';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Use your device\'s reduced motion setting to limit animations in Fluxer.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Always reduce motion';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author sent $summary';
  }

  @override
  String get dmListSentAnAttachment => 'Sent an attachment';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username pinned a message to this channel.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username added $userName to the group.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username added someone to the group.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username has left the group.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username removed $userName from the group.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username removed someone from the group.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username changed the channel name to $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username changed the channel name.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username changed the channel icon.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username started a call.';
  }

  @override
  String get voiceConnectionConfirmTitle => 'Voice Connection Confirmation';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'You\'re already connected to this voice channel from $count other devices. What would you like to do?',
      one:
          'You\'re already connected to this voice channel from 1 other device. What would you like to do?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Switch to This Device';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Just Join (Keep Other Connections)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Do nothing, I don\'t want to join';

  @override
  String get voiceChannelEmptyDescription =>
      'This is a voice channel. Connect to start talking!';

  @override
  String get voiceChannelJoin => 'Join Voice Channel';

  @override
  String get voiceChannelJoinConnect => 'Connect to Voice';

  @override
  String get voiceChannelNoConnectPermission =>
      'You don\'t have permission to join this voice channel';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Microphone, camera, and screen share content are end-to-end encrypted.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Microphone, camera, and screen share content are end-to-end encrypted.';

  @override
  String get voiceChannelE2eeBroken =>
      'End-to-end encryption is unavailable because an unsupported participant is in this voice channel.';

  @override
  String get voiceCallE2eeBroken =>
      'End-to-end encryption is unavailable because an unsupported participant is in this call.';

  @override
  String get voiceE2eeUpdateRequired =>
      'This client must be updated before joining this encrypted call.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Couldn\'t start your microphone. You\'re still in the call.';

  @override
  String get voiceChannelStatusConnecting => 'Connecting…';

  @override
  String get voiceChannelStatusConnected => 'Connected';

  @override
  String get voiceChannelStatusError => 'Error';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Mobile device';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Desktop device';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Community muted';

  @override
  String get voiceParticipantTooltipMuted => 'Muted';

  @override
  String get voiceParticipantTooltipCommunityDeafened => 'Community deafened';

  @override
  String get voiceParticipantTooltipDeafened => 'Deafened';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Connection: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count participants',
      one: '1 participant',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Leave';

  @override
  String get voiceControlMute => 'Mute';

  @override
  String get voiceControlUnmute => 'Unmute';

  @override
  String get voiceControlDeafen => 'Deafen';

  @override
  String get voiceControlUndeafen => 'Undeafen';

  @override
  String get voiceControlVideo => 'Video';

  @override
  String get voiceControlScreenShare => 'Screen share';

  @override
  String get voiceScreenShareNotificationText => 'Sharing your screen.';

  @override
  String get voiceControlMore => 'More';

  @override
  String get voiceControlDisconnect => 'Disconnect';

  @override
  String get voiceControlChat => 'Chat';

  @override
  String get voiceTextChatShow => 'Show chat';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# unread messages',
      one: '# unread message',
    );
    return 'Show chat with $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Camera permission is required for video.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Couldn\'t start screen sharing. Please try again.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Screen-sharing permission was denied.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Screen sharing isn\'t available on this device.';

  @override
  String get voiceWatchStream => 'Watch Stream';

  @override
  String get voiceStopWatching => 'Stop Watching';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Stop watching the current stream';

  @override
  String get voiceOwnScreenShareTitle => 'You are broadcasting';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Your stream is live for participants.';

  @override
  String get voiceLiveBadge => 'Live';

  @override
  String get dmVoiceViewCall => 'View call';

  @override
  String get dmVoiceCallFullScreen => 'Full screen';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Open call in full screen';

  @override
  String get dmVoiceStripStatusConnecting => 'Connecting…';

  @override
  String get dmVoiceStripStatusInCall => 'In call';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Voice call';

  @override
  String get dmVoiceCallBarConnecting => 'Connecting…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Direct call';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Group call';

  @override
  String get dmVoiceCallBarIssueFallback => 'Voice issue';

  @override
  String get dmVoiceFullscreenTitle => 'Voice';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Voice connected';

  @override
  String get notificationsPageTitle => 'Notifications';

  @override
  String get notificationsFilterUnreads => 'Unreads';

  @override
  String get notificationsFilterMentions => 'Mentions';

  @override
  String get notificationsBookmarksTooltip => 'Bookmarks';

  @override
  String get notificationsMentionFilterTooltip => 'Filter mentions';

  @override
  String get notificationsMentionFiltersTitle => 'Mention filters';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Include @everyone and @here mentions';

  @override
  String get notificationsMentionIncludeRoles => 'Include role mentions';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Include all community mentions';

  @override
  String get notificationsNoUnreadTitle => 'No Unread Messages';

  @override
  String get notificationsNoUnreadBody => 'You\'re all caught up.';

  @override
  String get notificationsNoMentionsTitle => 'No Recent Mentions';

  @override
  String get notificationsNoMentionsBody =>
      'All @mentions of you will appear here for 7 days.';

  @override
  String get notificationsMentionsEndTitle => 'You\'ve reached the end';

  @override
  String get notificationsMentionsEndBody =>
      'You\'ve seen all your recent mentions. Don\'t fret, more will appear here soon.';

  @override
  String get notificationsJump => 'Jump';

  @override
  String get notificationsRemoveMentionTooltip => 'Remove mention';

  @override
  String get notificationsViewAllUnread => 'View all unread';

  @override
  String get notificationsMarkAsRead => 'Mark as read';

  @override
  String get notificationsExpand => 'Expand';

  @override
  String get notificationsCollapse => 'Collapse';

  @override
  String get notificationsMessageUnavailable =>
      'This message couldn\'t be loaded.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining characters left';
  }

  @override
  String get characterCounterTooLong => 'Message is too long';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining characters left. Get $productName to write up to $premiumMaxLength characters.';
  }

  @override
  String get chatMessageFailedToSend => 'Failed to send message';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Your message could not be delivered. This is usually because you don\'t share a community with the recipient or the recipient is only accepting direct messages from friends. You may also need to adjust your own direct message privacy settings in $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Your message could not be delivered. You need to claim your account to send direct messages.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Your message could not be delivered. You need to claim your account to send messages.';

  @override
  String get chatSendFailureContentBlocked =>
      'Your message could not be delivered because it was flagged by our safety systems. If you believe this is a mistake, please contact support.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Your message could not be delivered because it contains mature emoji or stickers that are not allowed in this context.';

  @override
  String get chatClientSystemOnlyYouCanSee => 'Only you can see this message.';

  @override
  String get chatClientSystemDismiss => 'Dismiss';

  @override
  String get privacyDashboardCommunicationSection => 'Communication';

  @override
  String get chatMessageDeleteFailed => 'Delete Failed Message';

  @override
  String get chatMessageAddReaction => 'Add Reaction';

  @override
  String get chatMessageEdit => 'Edit Message';

  @override
  String get chatMessageReply => 'Reply';

  @override
  String get chatMessageForward => 'Forward';

  @override
  String get forwardMessageTitle => 'Forward message';

  @override
  String get forwardSearchHint => 'Search channels or DMs';

  @override
  String get forwardDirectMessagesSection => 'Direct Messages';

  @override
  String get forwardCommentHint => 'Add a comment (optional)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Send ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'No channels found';

  @override
  String get forwardSuccessToast => 'Message forwarded';

  @override
  String get forwardFailed => 'Failed to forward message';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Comments are unavailable because a selected channel has slowmode enabled.';

  @override
  String get forwardDestinationNoSendPermission =>
      'You can\'t send messages here';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'You can\'t embed links here';

  @override
  String get forwardDestinationNoAttachPermission =>
      'You can\'t attach files here';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Sending messages is disabled in this community';

  @override
  String get forwardDestinationTimedOut =>
      'You\'re on timeout in this community';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Slowmode - wait $remaining';
  }

  @override
  String get chatMessageCopyText => 'Copy Message';

  @override
  String get chatMessagePin => 'Pin message';

  @override
  String get chatMessageUnpin => 'Unpin message';

  @override
  String get chatMessageUnpinIt => 'Unpin it';

  @override
  String get chatMessageBookmark => 'Bookmark Message';

  @override
  String get chatMessageRemoveBookmark => 'Remove Bookmark';

  @override
  String get chatMessageMarkAsUnread => 'Mark as Unread';

  @override
  String get chatMessageCopyMessageLink => 'Copy Message Link';

  @override
  String get chatMessageCopyMessageId => 'Copy Message ID';

  @override
  String get chatMessageViewReactions => 'View reactions';

  @override
  String get chatMessageRemoveAllReactions => 'Remove all reactions';

  @override
  String get chatMessageDebug => 'Debug Message';

  @override
  String get chatMessageDebugSheetTitle => 'Debug message';

  @override
  String get chatMessageDebugCopyJson => 'Copy JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'Message JSON copied to clipboard';

  @override
  String get chatReactionsSheetTitle => 'Reactions';

  @override
  String get chatReactionsSheetEmpty => 'Nobody has reacted with this yet.';

  @override
  String get chatMessageReport => 'Report Message';

  @override
  String get iarReportMessageTitle => 'Report message';

  @override
  String get iarThisUserFallback => 'this user';

  @override
  String get iarModalDescription =>
      'Report a rule violation, or find tools to manage contact and preferences.';

  @override
  String get iarPathStepAriaLabel => 'What do you need?';

  @override
  String get iarCategoryStepTitle => 'What kind of rule was broken?';

  @override
  String get iarReasonStepTitle => 'Which rule was broken?';

  @override
  String get iarReasonSelectHint => 'Select a reason';

  @override
  String get iarPickAnOptionToast => 'Pick an option to continue.';

  @override
  String get iarPickARuleToast => 'Pick the rule that was broken.';

  @override
  String get iarPathPlatform => 'Report a platform rule violation';

  @override
  String get iarPathCommunity => 'Report to the moderators of this community';

  @override
  String get iarPathPreferenceMessage => 'I don\'t like this content';

  @override
  String get iarCategoryTargetedHarmLabel => 'Threats, harassment, or harm';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Bullying, threats, hate, violence, raids, or content that pushes self-harm.';

  @override
  String get iarCategorySafetyMinorsLabel => 'Child safety or mature content';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Minors at risk, mature content in the wrong place, or unwanted conduct.';

  @override
  String get iarCategoryPrivacyIdentityLabel => 'Privacy or impersonation';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxxing, stalking, pretending to be someone, or an inappropriate profile.';

  @override
  String get iarCategoryDeceptionLabel => 'Scams, malware, or misinformation';

  @override
  String get iarCategoryDeceptionDescription =>
      'Phishing, fraud, malicious links, or false claims likely to cause real-world harm.';

  @override
  String get iarCategoryIllegalOtherLabel =>
      'Illegal activity or something else';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Illegal sales, criminal facilitation, or a clear rule violation that doesn\'t fit above.';

  @override
  String get iarReasonHarassmentLabel => 'Harassment or threats';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Bullying, repeated unwanted contact, stalking, or targeted abuse.';

  @override
  String get iarReasonHateLabel => 'Hate speech';

  @override
  String get iarReasonHateMessageDescription =>
      'Slurs, dehumanizing language, or attacks on protected groups.';

  @override
  String get iarReasonViolenceLabel => 'Violence or violent threats';

  @override
  String get iarReasonViolenceDescription =>
      'Credible threats, graphic violence, or glorification of violence.';

  @override
  String get iarReasonMatureContentLabel => 'Mature content or harassment';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Unwanted conduct or mature content in the wrong place.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Child safety or exploitation of minors';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Grooming or child-exploitation content.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Harmful misinformation';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'False claims likely to cause real-world harm.';

  @override
  String get iarReasonSpamLabel => 'Spam, scams, or phishing';

  @override
  String get iarReasonSpamMessageDescription =>
      'Mass spam, fraud, fake giveaways, or account abuse.';

  @override
  String get iarReasonMalwareLabel => 'Malware or dangerous links';

  @override
  String get iarReasonMalwareDescription =>
      'Malware, credential theft, or harmful files.';

  @override
  String get iarReasonPrivacyLabel => 'Privacy violation';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxxing, exposed private info, or stalking.';

  @override
  String get iarReasonImpersonationLabel => 'Impersonation or deceptive media';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Pretending to be someone else, including deceptive AI-generated content.';

  @override
  String get iarReasonIllegalLabel => 'Illegal activity';

  @override
  String get iarReasonIllegalDescription =>
      'Illegal sales, criminal facilitation, or unlawful activity.';

  @override
  String get iarReasonSelfHarmLabel => 'Self-harm or suicide';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Promotion or instructions encouraging self-harm or eating disorders.';

  @override
  String get iarReasonOtherLabel => 'Another clear rule violation';

  @override
  String get iarReasonOtherDescription =>
      'Use only if it clearly breaks Fluxer\'s rules and doesn\'t fit above.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'If a minor is involved, use \"$childSafetyReason\" instead.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'If this involves CSAM or exploitation of a minor, send it now and don\'t reshare the material.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'If someone may be in immediate danger, contact local emergency services if you can do so safely.';

  @override
  String get iarSafetyNoteViolence =>
      'If this is a credible imminent threat, contact local emergency services too.';

  @override
  String get iarSafetyNoteTerrorism =>
      'If this is an imminent terrorist threat, contact local emergency services too.';

  @override
  String get iarActionBlockUserTitle => 'Block this user';

  @override
  String get iarActionBlockUserDescription =>
      'Stop messages and friend requests.';

  @override
  String get iarActionBlockUserButton => 'Block';

  @override
  String get iarActionCopyMessageLinkTitle => 'Copy message link';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Share with community mods.';

  @override
  String get iarActionCopyMessageLinkButton => 'Copy';

  @override
  String get iarActionCloseDmTitle => 'Close this DM';

  @override
  String get iarActionCloseDmDescription =>
      'Doesn\'t block. You can reopen later.';

  @override
  String get iarActionCloseDmButton => 'Close DM';

  @override
  String get iarActionLeaveCommunityTitle => 'Leave the community';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Stop seeing its content and members.';

  @override
  String get iarActionLeaveCommunityButton => 'Leave';

  @override
  String get iarActionDmSettingsTitle => 'DM & friend request settings';

  @override
  String get iarActionDmSettingsDescription => 'Change who can reach you.';

  @override
  String get iarActionCallSettingsTitle => 'Call & group chat settings';

  @override
  String get iarActionCallSettingsDescription =>
      'Change who can call or add you.';

  @override
  String get iarActionOpenButton => 'Open';

  @override
  String get iarActionDeleteMessageTitle => 'Delete this message';

  @override
  String get iarActionDeleteMessageDescription =>
      'Remove it from the channel for everyone.';

  @override
  String get iarActionDeleteMessageButton => 'Delete';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Deleted';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'This message has already been deleted.';

  @override
  String get iarActionBanUserTitle => 'Ban this user';

  @override
  String get iarActionBanUserDescription =>
      'Open the ban dialog for this community.';

  @override
  String get iarActionBanUserButton => 'Ban';

  @override
  String get iarActionBanUserBannedButton => 'Banned';

  @override
  String get iarActionBanUserBannedTooltip =>
      'This user is already banned from the community.';

  @override
  String get iarCloseDmConfirmTitle => 'Close DM';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Close your current DM with $name. This doesn\'t block them; you can reopen later.';
  }

  @override
  String get iarSuccessTitle => 'Report sent';

  @override
  String get iarSuccessBody =>
      'Our safety team is reviewing it. We\'ll send you a DM and email once we\'ve reached a verdict.';

  @override
  String get iarAlreadyReportedTitle => 'Already reported';

  @override
  String get iarAlreadyReportedBody =>
      'You\'ve already reported this message. Our safety team is reviewing it.';

  @override
  String get iarBackButton => 'Back';

  @override
  String get iarContinueButton => 'Continue';

  @override
  String get iarSendReportButton => 'Send report';

  @override
  String get iarDoneButton => 'Done';

  @override
  String get iarCouldntSendToast =>
      'Couldn\'t send the report. Please try again.';

  @override
  String get iarRateLimitedToast =>
      'You\'re reporting too quickly. Please wait a moment and try again.';

  @override
  String get iarReportSentToast =>
      'Report sent. Our safety team will review it.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Block $name? They won\'t be able to message you or send you friend requests. You can unblock them later.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Couldn\'t block this user. Please try again.';

  @override
  String get iarCloseDmSuccessToast => 'DM closed.';

  @override
  String get iarCloseDmFailedToast =>
      'Couldn\'t close this DM. Please try again.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Couldn\'t leave this community. Please try again.';

  @override
  String get chatMessageSuppressEmbeds => 'Suppress Embeds';

  @override
  String get chatMessageUnsuppressEmbeds => 'Unsuppress Embeds';

  @override
  String get chatMessageDelete => 'Delete Message';

  @override
  String get chatMessageDeleteConfirmTitle => 'Delete Message';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Are you sure you want to delete this message?';

  @override
  String get chatMessageMore => 'More';

  @override
  String get chatEditingMessage => 'Editing message';

  @override
  String get chatReplyOriginalDeleted => 'Original message was deleted';

  @override
  String get chatReplyOriginalFailedToLoad => 'Original message failed to load';

  @override
  String get chatReplyAttachedMedia => 'Message contains attached media';

  @override
  String get chatMessagesLoadError => 'Couldn\'t load messages.';

  @override
  String get chatReplyMentionOverrideTitle => 'Override mention preference?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname prefers to be @mentioned on replies. Send without the mention anyway?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname prefers replies without an @mention. Send with the mention anyway?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ignore preference';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Click to disable pinging the user you\'re replying to.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Click to enable pinging the user you\'re replying to.';

  @override
  String get chatReplyMentionAccessibilityLabel => 'Mention replied user';

  @override
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

  @override
  String get chatReplyCancel => 'Cancel reply';

  @override
  String get chatEditMessageHint => 'Edit message';

  @override
  String get chatEditNoChanges => 'No changes to save';

  @override
  String get chatChannelNotReady =>
      'This channel is not ready yet. Try again in a moment.';

  @override
  String get chatMessageEdited => '(edited)';

  @override
  String get chatMessageSilent => 'This was a @silent message.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Today at $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Yesterday at $time';
  }

  @override
  String get mediaViewerImagePreview => 'Image preview';

  @override
  String get mediaViewerClose => 'Close media viewer';

  @override
  String get mediaViewerOpenInBrowser => 'Open in browser';

  @override
  String get mediaViewerForward => 'Forward';

  @override
  String get mediaViewerZoomIn => 'Zoom in';

  @override
  String get mediaViewerZoomOut => 'Zoom out';

  @override
  String get mediaViewerPreviousAttachment => 'Previous attachment';

  @override
  String get mediaViewerNextAttachment => 'Next attachment';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String get chatAttachmentVideoToggleControls => 'Toggle video controls';

  @override
  String get chatAttachmentVideoMute => 'Mute video';

  @override
  String get chatAttachmentVideoUnmute => 'Unmute video';

  @override
  String get chatAttachmentVideoPlay => 'Play video';

  @override
  String get chatAttachmentVideoPause => 'Pause video';

  @override
  String get chatAttachmentVideoProgress => 'Video progress';

  @override
  String get chatVideoPlaybackFailed => 'Could not play this video.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Notify users with this role who have permission to view this channel.';

  @override
  String get addGuildModalTitle => 'Add a community';

  @override
  String get addGuildModalLandingDescription =>
      'Create a new community or join an existing one.';

  @override
  String get addGuildCreateCommunity => 'Create community';

  @override
  String get addGuildJoinCommunity => 'Join community';

  @override
  String get addGuildImportDiscordTemplate => 'Import Discord template';

  @override
  String get addGuildJoinTitle => 'Join a community';

  @override
  String get addGuildJoinDescription =>
      'Enter the invite link to join a community.';

  @override
  String get addGuildInviteLinkLabel => 'Invite link';

  @override
  String get addGuildJoinSubmit => 'Join community';

  @override
  String get addGuildInviteInvalid => 'This invite is invalid or has expired.';

  @override
  String get addGuildJoinFailed =>
      'Could not join community. Please try again.';

  @override
  String get addGuildPackInstalled => 'Pack installed successfully.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Remove All Reactions';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Are you sure you want to remove all reactions from this message?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Unpin message';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Send this pin back in time?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username pinned $messageLink to this channel. See $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'a message';

  @override
  String get systemPinMessageAllPinsLink => 'all pinned messages';

  @override
  String get channelPinsEmptyTitle => 'No pinned messages';

  @override
  String get channelPinsEmptyDescription => 'Pinned messages show up here.';

  @override
  String get personalNotesTitle => 'Personal notes';

  @override
  String get personalNotesSubtitle =>
      'Your private space for thoughts and reminders';

  @override
  String channelWelcomeHeading(String channelName) {
    return 'Welcome to $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'In the beginning, there was nothing. Then, there was $channelName. And it was good.';
  }

  @override
  String get personalNotesComposerHint => 'Message yourself';

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
  String get personalNotesPrivateSpace => 'Your private space';

  @override
  String get purgePersonalNotes => 'Purge personal notes';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'This will permanently delete every message and attachment in your personal notes. This cannot be undone.';

  @override
  String get purgePersonalNotesConfirmButton => 'Purge';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Purged $count messages from personal notes';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Personal notes were already empty';

  @override
  String get purgePersonalNotesFailed => 'Could not clear personal notes';

  @override
  String get userSettingsGroupYourAccount => 'YOUR ACCOUNT';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'Profile';

  @override
  String get userSettingsNavSecurityLogin => 'Security & Login';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Gifts & Codes';

  @override
  String get userSettingsNavPrivacyDashboard => 'Privacy Dashboard';

  @override
  String get userSettingsNavAuthorizedApps => 'Authorized Apps';

  @override
  String get userSettingsNavBlockedUsers => 'Blocked Users';

  @override
  String get userSettingsNavLinkedDevices => 'Linked Devices';

  @override
  String get userSettingsNavConnections => 'Connections';

  @override
  String get userSettingsNavLookAndFeel => 'Look & Feel';

  @override
  String get userSettingsNavAccessibility => 'Accessibility';

  @override
  String get userSettingsNavChat => 'Chat';

  @override
  String get userSettingsNavAudioAndVideo => 'Audio & Video';

  @override
  String get userSettingsNavLanguageAndTime => 'Language & Time';

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
  String get userSettingsNavAdvanced => 'Advanced';

  @override
  String get advancedPerformanceReportingTitle => 'Performance reporting';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Help improve Fluxer by sharing anonymous crash and performance data.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Send crash and performance reports';

  @override
  String get advancedPerformanceReportingDescription =>
      'All reported data is anonymous and is sent only to Fluxer\'s own monitoring service — no third-party providers are used.';

  @override
  String get userSettingsNavApplications => 'Applications';

  @override
  String get userSettingsNavAppLogs => 'App Logs';

  @override
  String get userSettingsNavDeveloperTools => 'Developer Tools';

  @override
  String get userSettingsNavLimitsConfig => 'Limits Config';

  @override
  String get userSettingsNavFeatureFlags => 'Feature Flags';

  @override
  String get userSettingsNavWhatsNew => 'What\'s New';

  @override
  String get userSettingsNavLogOut => 'Log Out';

  @override
  String get quickSwitcherTabSearch => 'Search';

  @override
  String get quickSwitcherTabFriends => 'Friends';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Search for channels, people, or communities';

  @override
  String get quickSwitcherSearchFriends => 'Search friends';

  @override
  String get quickSwitcherNoMatchesFound => 'No matches found';

  @override
  String get quickSwitcherEmptyHint =>
      'Try a different name or use @ / # / ! / * prefixes to filter results.';

  @override
  String get quickSwitcherSectionPeople => 'People';

  @override
  String get quickSwitcherSectionGroupMessages => 'Group messages';

  @override
  String get quickSwitcherSectionTextChannels => 'Text channels';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Voice channels';

  @override
  String get quickSwitcherSectionCommunities => 'Communities';

  @override
  String get quickSwitcherSectionSettings => 'Settings';

  @override
  String get quickSwitcherHomeLabel => 'Home';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Direct Messages';

  @override
  String get quickSwitcherFavoritesLabel => 'Favorites';

  @override
  String get quickSwitcherUserSettingsLabel => 'User Settings';

  @override
  String get quickSwitcherNotificationsLabel => 'Notifications';

  @override
  String get quickSwitcherBookmarksLabel => 'Bookmarks';

  @override
  String get quickSwitcherMentionsLabel => 'Mentions';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'No friends yet';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Add a friend to get started.';

  @override
  String get quickSwitcherFriendsNoMatchTitle => 'No friends match that search';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Try a different name.';

  @override
  String get quickSwitcherSearchAliasUser => 'User';

  @override
  String get quickSwitcherSearchAliasYou => 'You';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'DMs';

  @override
  String get quickSwitcherSearchAliasMessages => 'Messages';

  @override
  String get quickSwitcherSearchAliasFav => 'Fav';

  @override
  String get quickSwitcherSearchAliasStarred => 'Starred';

  @override
  String get quickSwitcherSearchAliasInbox => 'Inbox';

  @override
  String get quickSwitcherSearchAliasSaved => 'Saved';

  @override
  String get uiClose => 'Close';

  @override
  String get chatJumpToBottom => 'Jump to bottom';

  @override
  String get uiConfirm => 'Confirm';

  @override
  String get uiLoading => 'Loading';

  @override
  String get uiUnsavedChanges => 'Unsaved changes';

  @override
  String get uiReset => 'Reset';

  @override
  String get uiOpenColorPicker => 'Open color picker';

  @override
  String get uiSelectPlaceholder => 'Select';

  @override
  String get uiSearchPlaceholder => 'Search';

  @override
  String get uiNoOptionsFound => 'No options found';

  @override
  String get uiDismissNotification => 'Dismiss notification';

  @override
  String get uiColorPickerTitle => 'Color picker';

  @override
  String get mentionConfirmTitle => 'Mention everyone?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'This will notify $count members. Continue?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'This will notify $count online members. Continue?';
  }

  @override
  String get mentionConfirmButton => 'Mention';

  @override
  String get composerEmojiUnavailable => 'You can\'t use that emoji here.';

  @override
  String get instanceUrlLabel => 'Instance URL';

  @override
  String get instanceUrlPlaceholder => 'Enter instance URL (e.g. fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Reset to Fluxer';

  @override
  String get instanceConnect => 'Connect';

  @override
  String get instanceConnecting => 'Connecting…';

  @override
  String get instanceConnectFailed => 'Failed to connect to instance';

  @override
  String get recentInstances => 'Recent instances';

  @override
  String removeRecentInstance(String domain) {
    return 'Remove $domain from recent instances';
  }

  @override
  String get instanceSheetTitle => 'Connect to instance';

  @override
  String get connectToDifferentInstance => 'Connect to a different instance';

  @override
  String get changeInstance => 'Change';

  @override
  String get instanceConnectionRequired => 'Connect to the instance to sign in';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get guildNavbarDirectMessages => 'Direct Messages';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Explore Discoverable Communities';

  @override
  String get discoveryExplore => 'Explore';

  @override
  String get discoveryExplorePublicCommunities => 'Explore public communities';

  @override
  String get discoveryListingSubheading =>
      'Want to list your community on here? Apply if you meet the requirements in your community\'s settings > Discovery.';

  @override
  String get discoverySearchCommunities => 'Search communities';

  @override
  String get discoveryFilterByLanguage => 'Filter by language';

  @override
  String get discoveryAllLanguages => 'All languages';

  @override
  String get discoveryAllCategories => 'All';

  @override
  String get discoveryCategoryGaming => 'Gaming';

  @override
  String get discoveryCategoryMusic => 'Music';

  @override
  String get discoveryCategoryEntertainment => 'Entertainment';

  @override
  String get discoveryCategoryEducation => 'Education';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Science & Technology';

  @override
  String get discoveryCategoryContentCreator => 'Content Creator';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime & Manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Movies & TV';

  @override
  String get discoveryCategoryOther => 'Other';

  @override
  String get discoveryNoCommunitiesMatch => 'No communities match.';

  @override
  String get discoveryJoinCommunity => 'Join community';

  @override
  String get discoveryJoined => 'Joined';

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
      other: '$countString members',
      one: '1 member',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'No description.';

  @override
  String get discoveryCommunities => 'Communities';

  @override
  String get discoveryApps => 'Apps';

  @override
  String get discoveryJoinErrorGenericTitle => 'Couldn\'t join this community';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Something went wrong. Please try again in a moment.';

  @override
  String get discoveryJoinErrorFullTitle => 'This community is full';

  @override
  String get discoveryJoinErrorFullMessage =>
      'This community has reached its member limit, so you can\'t join right now.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'You\'ve reached the community limit';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'You\'re in the maximum number of communities. Leave one and try again.';

  @override
  String get discoveryJoinErrorBannedTitle => 'You can\'t join this community';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'You have been banned from this community.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'This community is no longer available';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'It may have left discovery or turned off new joins. Refresh the page and you won\'t see it again.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'You\'re going too fast';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Please wait a moment and try again.';

  @override
  String get guildNavbarAddCommunity => 'Add a Community';

  @override
  String get guildNavbarHelp => 'Help';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'NEW MESSAGE';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Collapse $folderName';
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
  String get guildNavbarGroupDm => 'Group DM';

  @override
  String get guildNavbarCreateChannel => 'Create Channel';

  @override
  String get guildNavbarChannelType => 'Channel Type';

  @override
  String get guildNavbarTextChannel => 'Text Channel';

  @override
  String get guildNavbarTextChannelDescription =>
      'Send messages, images, GIFs, and emoji';

  @override
  String get guildNavbarVoiceChannel => 'Voice Channel';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Hang out together with voice, video, and screen share';

  @override
  String get guildNavbarLinkChannel => 'Link Channel';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Quick access to an external website or resource';

  @override
  String get guildNavbarNameLabel => 'Name';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarCreateCategory => 'Create Category';

  @override
  String get guildNavbarNewCategoryHint => 'New Category';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Invite friends to $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Recipients will be taken to #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Search friends';

  @override
  String get guildNavbarNoFriendsYet => 'No friends yet';

  @override
  String get guildNavbarNoResults => 'No results';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Or, send an invite link to a friend:';

  @override
  String get guildNavbarInviteLink => 'Invite link';

  @override
  String get guildNavbarCopy => 'Copy';

  @override
  String get guildNavbarCopied => 'Copied!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Your invite link expires in 7 days.';

  @override
  String get guildNavbarInviteNeverExpires => 'This invite link never expires.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Your invite link expires in $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Edit invite link';

  @override
  String get guildNavbarInviteLinkSettings => 'Invite link settings';

  @override
  String get guildNavbarExpireAfter => 'Expire After';

  @override
  String get guildNavbarMaxUses => 'Max Number of Uses';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Grant Temporary Membership';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Members will be removed when they go offline unless a role is assigned';

  @override
  String get guildNavbarCreateNewLink => 'Create New Link';

  @override
  String get guildNavbarSent => 'Sent';

  @override
  String get guildNavbarInvite => 'Invite';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Leave Community';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Are you sure you want to leave this community? You will no longer be able to see any messages.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Leave Community';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Delete your messages in this community?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Permanently delete every message you\'ve sent here, across every channel. Cannot be undone.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Delete My Messages';

  @override
  String get guildNavbarDeletedYourMessages => 'Deleted your messages';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Couldn\'t delete your messages';

  @override
  String get guildNavbarRemoveOverride => 'Remove override';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Muted until $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible =>
      'Only accessible to Fluxer staff';

  @override
  String get guildNavbarInvitesPaused =>
      'Invites are currently paused in this community';

  @override
  String get guildNavbarDurationNever => 'never';

  @override
  String get guildNavbarDuration30Minutes => '30 minutes';

  @override
  String get guildNavbarDuration1Hour => '1 hour';

  @override
  String get guildNavbarDuration6Hours => '6 hours';

  @override
  String get guildNavbarDuration12Hours => '12 hours';

  @override
  String get guildNavbarDuration1Day => '1 day';

  @override
  String get guildNavbarDuration7Days => '7 days';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count seconds';
  }

  @override
  String get guildNavbarNever => 'Never';

  @override
  String get guildNavbarNoLimit => 'No limit';

  @override
  String get guildNavbarOneUse => '1 use';

  @override
  String guildNavbarUses(int count) {
    return '$count uses';
  }

  @override
  String get guildMenuMarkAsRead => 'Mark as Read';

  @override
  String get guildPeekMoreOptions => 'More Options';

  @override
  String get guildMenuInviteMembers => 'Invite Members';

  @override
  String get guildMenuCommunitySettings => 'Community Settings';

  @override
  String get guildMenuEditCommunityProfile => 'Edit Community Profile';

  @override
  String get guildMenuUnmuteCommunity => 'Unmute Community';

  @override
  String get guildMenuMuteCommunity => 'Mute Community';

  @override
  String get guildMenuHideMutedChannels => 'Hide Muted Channels';

  @override
  String get guildMenuReportCommunity => 'Report Community';

  @override
  String get guildMenuDebugCommunity => 'Debug Community';

  @override
  String get guildMenuCopyCommunityId => 'Copy Community ID';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Until $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'General';

  @override
  String get guildMenuSettingsRoles => 'Roles & Permissions';

  @override
  String get guildMenuSettingsEmoji => 'Custom Emoji';

  @override
  String get guildMenuSettingsStickers => 'Custom Stickers';

  @override
  String get guildMenuSettingsSafetyModeration => 'Safety & Moderation';

  @override
  String get guildMenuSettingsActivityLog => 'Activity Log';

  @override
  String get guildMenuSettingsWebhooks => 'Webhooks';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'Custom Invite URL';

  @override
  String get guildMenuSettingsDiscovery => 'Discovery';

  @override
  String get guildMenuSettingsMembers => 'Members';

  @override
  String get guildMenuSettingsInviteLinks => 'Invite Links';

  @override
  String get guildMenuSettingsBans => 'Bans';

  @override
  String get guildSettingsNoPermission =>
      'You do not have permission to view this settings tab.';

  @override
  String get guildSettingsOverviewIconTitle => 'Icon';

  @override
  String get guildSettingsUploadImage => 'Upload Image';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Upload a banner for your server.';

  @override
  String get guildSettingsOverviewNameTitle => 'Name';

  @override
  String get guildSettingsOverviewNameHint => 'My awesome community';

  @override
  String get guildSettingsOverviewStatsTitle => 'Statistics';

  @override
  String get guildSettingsOverviewMembers => 'Members';

  @override
  String get guildSettingsOverviewOnline => 'Online';

  @override
  String get guildSettingsRolesDescription =>
      'Use roles to group members and assign permissions.';

  @override
  String get guildSettingsCreateRole => 'Create Role';

  @override
  String get guildSettingsRolesListTitle => 'Roles';

  @override
  String guildSettingsEmojiSlotInfo(int staticCount, int animatedCount) {
    return '$staticCount static, $animatedCount animated emoji slots used';
  }

  @override
  String get guildSettingsEmojiEmpty => 'No custom emoji yet.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count stickers uploaded';
  }

  @override
  String get guildSettingsStickersEmpty => 'No custom stickers yet.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Member verification';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Choose what members must have before they can post or DM community members.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Members with roles can bypass these checks. For public spaces, we recommend enabling verification.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Communities listed in Discovery require at least verified email. None cannot be selected while Discovery is enabled.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Mature content & content warnings';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Configure mature content labeling and optional content warnings for members.';

  @override
  String get guildSettingsModerationMatureToggle => 'Mature content';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Mark this community as containing mature content.';

  @override
  String get guildSettingsVerificationNone => 'None';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'No verification is required.';

  @override
  String get guildSettingsVerificationLow => 'Low';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Requires a verified email address.';

  @override
  String get guildSettingsVerificationMedium => 'Medium';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Requires a verified email address, and an account that\'s at least 5 minutes old.';

  @override
  String get guildSettingsVerificationHigh => 'High';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Requires everything in medium, plus being a member of the community for at least 10 minutes.';

  @override
  String get guildSettingsVerificationHighest => 'Very high';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Requires a verified phone number.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Track moderator actions across the community.';

  @override
  String get guildSettingsAuditLogEmpty => 'No logs yet';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Moderation actions and community changes will appear here.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'All users';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'All actions';

  @override
  String get guildSettingsAuditLogNoReason => 'No reason was provided.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Unknown user';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Something went wrong while loading the activity log.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Unable to load activity logs';

  @override
  String get guildSettingsAuditLogReason => 'Reason';

  @override
  String get guildSettingsAuditLogSomeone => 'someone';

  @override
  String get guildSettingsAuditLogSomething => 'something';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'unknown entity';

  @override
  String get guildSettingsAuditLogNothing => 'nothing';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Unknown target';

  @override
  String get auditLogActionGuildUpdate => 'Community updated';

  @override
  String get auditLogActionChannelCreate => 'Channel created';

  @override
  String get auditLogActionChannelUpdate => 'Channel updated';

  @override
  String get auditLogActionChannelDelete => 'Channel deleted';

  @override
  String get auditLogActionChannelOverwriteCreate => 'Channel overwrite added';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Channel overwrite updated';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Channel overwrite removed';

  @override
  String get auditLogActionMemberKick => 'Member kicked';

  @override
  String get auditLogActionMemberPrune => 'Members pruned';

  @override
  String get auditLogActionMemberBanAdd => 'Member banned';

  @override
  String get auditLogActionMemberBanRemove => 'Member unbanned';

  @override
  String get auditLogActionMemberUpdate => 'Member updated';

  @override
  String get auditLogActionMemberRoleUpdate => 'Member roles updated';

  @override
  String get auditLogActionMemberMove => 'Member moved';

  @override
  String get auditLogActionMemberDisconnect => 'Member disconnected';

  @override
  String get auditLogActionBotAdd => 'Bot added';

  @override
  String get auditLogActionRoleCreate => 'Role created';

  @override
  String get auditLogActionRoleUpdate => 'Role updated';

  @override
  String get auditLogActionRoleDelete => 'Role deleted';

  @override
  String get auditLogActionInviteCreate => 'Invite created';

  @override
  String get auditLogActionInviteUpdate => 'Invite updated';

  @override
  String get auditLogActionInviteDelete => 'Invite deleted';

  @override
  String get auditLogActionWebhookCreate => 'Webhook created';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook updated';

  @override
  String get auditLogActionWebhookDelete => 'Webhook deleted';

  @override
  String get auditLogActionEmojiCreate => 'Emoji created';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji updated';

  @override
  String get auditLogActionEmojiDelete => 'Emoji deleted';

  @override
  String get auditLogActionStickerCreate => 'Sticker created';

  @override
  String get auditLogActionStickerUpdate => 'Sticker updated';

  @override
  String get auditLogActionStickerDelete => 'Sticker deleted';

  @override
  String get auditLogActionMessageDelete => 'Message deleted';

  @override
  String get auditLogActionMessageBulkDelete => 'Messages deleted';

  @override
  String get auditLogActionMessagePin => 'Message pinned';

  @override
  String get auditLogActionMessageUnpin => 'Message unpinned';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor updated the community settings.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor created the channel $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor updated the channel $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor deleted the channel $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor added channel permissions for $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor added channel permissions for $target in $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor updated channel permissions for $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor updated channel permissions for $target in $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor removed channel permissions for $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor removed channel permissions for $target in $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor kicked $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor banned $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor unbanned $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor updated $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor updated roles for $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor pruned inactive members.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor pruned members inactive for $days days.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor moved $target to another voice channel.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor moved $target to $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor disconnected $target from voice.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor added the bot $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor created the role $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor updated the role $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor deleted the role $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor created the invite $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor created the invite $target for $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor updated the invite $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor updated the invite $target for $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor deleted the invite $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor deleted the invite $target for $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor created the webhook $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor updated the webhook $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor deleted the webhook $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor added the emoji $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor updated the emoji $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor deleted the emoji $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor added the sticker $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor updated the sticker $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor deleted the sticker $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor deleted a message.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor deleted a message in $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor deleted multiple messages.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor deleted $count messages.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor deleted multiple messages in $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor deleted $count messages in $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor pinned a message.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor pinned a message in $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor unpinned a message.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor unpinned a message in $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor performed an audit action on $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Updated $field from $oldValue to $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Set $field to $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Cleared $field (was $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Updated $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Renamed the community to $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Updated the community icon.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Renamed the channel to $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Cleared the topic.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Updated the topic to $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent => 'Enabled mature content.';

  @override
  String get auditLogChangeDisabledMatureContent => 'Disabled mature content.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Set nickname to $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Removed nickname $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Muted the member.';

  @override
  String get auditLogChangeUnmutedMember => 'Unmuted the member.';

  @override
  String get auditLogChangeDeafenedMember => 'Deafened the member.';

  @override
  String get auditLogChangeUndeafenedMember => 'Undeafened the member.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Added $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Removed $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Channel: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Message: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Invited by $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Deleted # messages.',
      one: 'Deleted # message.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Removed # members.',
      one: 'Removed # member.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires => 'This invite never expires.';

  @override
  String get auditLogOptionTemporaryMembership =>
      'Grants temporary membership.';

  @override
  String get auditLogOptionPermanentMembership =>
      'Grants permanent membership.';

  @override
  String get guildSettingsLoadMore => 'Load more';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Manage webhooks that post messages to channels.';

  @override
  String get guildSettingsWebhooksEmpty => 'No webhooks configured.';

  @override
  String get guildSettingsCopyUrl => 'Copy URL';

  @override
  String get guildSettingsCopiedUrl => 'URL copied to clipboard';

  @override
  String get guildSettingsDeleteWebhook => 'Delete webhook';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Set a custom invite link for your server.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Save';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Usage';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count uses';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Apply to be listed in server discovery.';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Requires at least $count members to apply.';
  }

  @override
  String get guildSettingsDiscoveryCategory => 'Category';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Description';

  @override
  String get guildSettingsDiscoveryTags => 'Tags';

  @override
  String get guildSettingsDiscoveryTagsHint => 'gaming, art, music';

  @override
  String get guildSettingsDiscoveryApply => 'Submit Application';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Withdraw';

  @override
  String get guildSettingsMembersDescription =>
      'Search and manage server members.';

  @override
  String get guildSettingsMembersSearchHint => 'Search members';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count members';
  }

  @override
  String get guildSettingsMembersSortNewest => 'Newest first';

  @override
  String get guildSettingsInvitesDescription =>
      'View and revoke active invite links.';

  @override
  String get guildSettingsInvitesEmpty => 'No active invites.';

  @override
  String guildSettingsInviteUses(int uses, int maxUses) {
    return '$uses / $maxUses uses';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Expires $date';
  }

  @override
  String get guildSettingsBansDescription => 'View and manage banned users.';

  @override
  String get guildSettingsBansSearchHint => 'Search bans';

  @override
  String get guildSettingsBansEmpty => 'No banned users.';

  @override
  String get guildSettingsBanPermanent => 'Permanent ban';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Expires $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Expires';

  @override
  String get guildSettingsUnban => 'Unban';

  @override
  String get guildSettingsBansLoading => 'Loading banned users';

  @override
  String get guildSettingsBansNoSearchResults =>
      'No bans found matching your search.';

  @override
  String get guildSettingsBanDetailsTitle => 'Ban details';

  @override
  String get guildSettingsBanViewDetails => 'View details';

  @override
  String get guildSettingsBannedOn => 'Banned on';

  @override
  String get guildSettingsBannedBy => 'Banned by';

  @override
  String get guildSettingsRevokeBanTitle => 'Revoke ban';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Are you sure you want to revoke the ban for $displayName? They will be able to rejoin the community.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Revoked ban for $displayName';
  }

  @override
  String get guildSettingsBansLoadError => 'Couldn\'t load bans. Try again.';

  @override
  String get guildSettingsRevokeBanError => 'Couldn\'t revoke ban. Try again.';

  @override
  String get guildSettingsCommunitySettings => 'Community Settings';

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
      'Manage your community\'s profile, channels, and default settings.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Branding';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Update your icon, name, banner, and invite background';

  @override
  String get guildSettingsOverviewBannerUpload => 'Upload banner';

  @override
  String get guildSettingsOverviewIdleTitle => 'Idle settings';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Configure AFK channel and timeout';

  @override
  String get guildSettingsOverviewSystemTitle => 'System & welcome';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Choose destination for system and welcome messages';

  @override
  String get guildSettingsOverviewNotificationsTitle => 'Default notifications';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Communities with over 250 people are forced onto the \"mentions only\" setting. Your original setting is preserved and will be restored if the community drops below 250 members.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Advanced';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Allow flexible text channel names';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Hide community owner crown';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Detached banner';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Shows the banner in its own section below the community header.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Upload icon';

  @override
  String get guildSettingsOverviewRemoveImage => 'Remove';

  @override
  String get guildSettingsOverviewSplashTitle => 'Invite background';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'Chat embed background';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Shown in invite embeds in chat.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Upload background';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'No community banner';

  @override
  String get guildSettingsOverviewNoInviteBackground => 'No invite background';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Preview';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'See how your invite looks to visitors.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle => 'Text channel names';

  @override
  String get guildSettingsOverviewOwnerCrownTitle => 'Community owner crown';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Configure whether the crown icon is shown next to the community owner';

  @override
  String get guildSettingsSplashCardAlignment => 'Card alignment';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Center';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Left';

  @override
  String get guildSettingsSplashAlignmentRight => 'Right';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Only applies on wide screens.';

  @override
  String get permissionReadMessageHistory => 'Read message history';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Change what users without \"$permission\" can see';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Use a dedicated modal to set a message history threshold date for members who don\'t have the $permission permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Open message history threshold';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Message history threshold';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Enable message history threshold';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Threshold date';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Members without Read Message History can view messages sent after this date.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Message history threshold updated';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Allow capital letters and spaces in text channel names. Off restricts names to lowercase with hyphens and underscores.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Hides the crown icon next to the community owner across all surfaces.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Animated icons require the Animated Icon community feature.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Animated banners require the Animated Banner community feature.';

  @override
  String get guildSettingsAfkChannel => 'AFK / idle channel';

  @override
  String get guildSettingsAfkChannelHint =>
      'Move members to this channel when they\'re AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'No AFK channel';

  @override
  String get guildSettingsAfkTimeout => 'AFK timeout';

  @override
  String get guildSettingsAfkTimeout1Min => '1 minute';

  @override
  String get guildSettingsAfkTimeout5Min => '5 minutes';

  @override
  String get guildSettingsAfkTimeout15Min => '15 minutes';

  @override
  String get guildSettingsAfkTimeout30Min => '30 minutes';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 hour';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get guildSettingsSystemChannel => 'Destination channel';

  @override
  String get guildSettingsSystemChannelHint =>
      'Welcome and system messages will appear here.';

  @override
  String get guildSettingsNoSystemChannel => 'No system channel';

  @override
  String get guildSettingsHideJoinMessages => 'Hide join messages';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Suppresses join messages in the destination channel.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Default notification settings';

  @override
  String get guildSettingsNotificationsAll => 'All messages';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Notify on all messages';

  @override
  String get guildSettingsNotificationsMentions => 'Mentions only';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Notify only on mentions';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max 10MB. Minimum: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max 10MB. Minimum: 960×540px (16:9). Shown in invite embeds in chat.';

  @override
  String get guildSettingsModerationDescription =>
      'Configure verification, content filtering, and mature content settings.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Discovery-listed communities have restricted moderation options.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Content filtering';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Automatically screen messages for explicit content in channels not marked for mature content.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Communities listed in Discovery are required to scan all members. This setting cannot be changed while Discovery is enabled.';

  @override
  String get guildSettingsContentFilterOff => 'Off';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Let the community self-moderate';

  @override
  String get guildSettingsContentFilterNoRole => 'Filter members without roles';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Suggested for most communities';

  @override
  String get guildSettingsContentFilterAll => 'Filter everyone';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Maximum protection for family-friendly spaces';

  @override
  String get guildSettingsModerationMatureOff => 'Off';

  @override
  String get guildSettingsModerationMatureOn => 'On';

  @override
  String get guildSettingsContentWarningToggle => 'Show a content warning';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Toggles a consent prompt before entering any channel.';

  @override
  String get guildSettingsContentWarningText => 'Custom warning text';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'This contains sensitive content.';

  @override
  String get guildSettingsModeration2faTitle => '2FA requirement';

  @override
  String get guildSettingsModeration2faDescription =>
      'Require two-factor authentication for moderators before they can ban, kick, timeout, or remove messages.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Require 2FA for moderation actions';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Only the community owner can change this setting';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Enable 2FA on your account to change this setting';

  @override
  String get guildSettingsEmojiSearchHint => 'Search emojis';

  @override
  String get guildSettingsEmojiUploadTitle => 'Upload Emoji';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Non-animated emoji ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Animated emoji ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Search stickers';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Create webhooks from Channel settings. Edit them here.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'Your vanity URL won\'t work unless at least one channel is visible to everyone.';

  @override
  String get guildSettingsVanityUrlRemove => 'Remove';

  @override
  String get guildSettingsBannedUsersTitle => 'Banned users';

  @override
  String get guildSettingsInvitesTableInviter => 'Inviter';

  @override
  String get guildSettingsInvitesTableChannel => 'Channel';

  @override
  String get guildSettingsInvitesTableCode => 'Code';

  @override
  String get guildSettingsInvitesTableUses => 'Uses';

  @override
  String get guildSettingsInvitesTableCreated => 'Created';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filter by user';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filter by action';
}
