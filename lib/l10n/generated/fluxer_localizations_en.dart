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
  String splashStartupFailed(String error) {
    return 'Failed to start: $error';
  }

  @override
  String get retry => 'Retry';

  @override
  String get connectingCaps => 'CONNECTING';

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
  String get mfaMethodSms => 'SMS Code';

  @override
  String get mfaMethodWebauthn => 'Security Key / Passkey';

  @override
  String get mfaTotpDescription =>
      'Enter the 6-digit code from your authenticator app or one of your backup codes.';

  @override
  String get mfaSmsDescription => 'Enter the 6-digit code sent to your phone.';

  @override
  String get mfaSendSmsCode => 'Send SMS Code';

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
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Channel Access Denied';

  @override
  String get channelAccessDeniedDescription =>
      'You do not have access to the channel where this message was sent.';

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
  String get userTagBot => 'Bot';

  @override
  String get userTagSystem => 'System';

  @override
  String get emojiSearchPlaceholder => 'Find the emoji of your dreams';

  @override
  String get emojiSearchEmpty => 'No emojis match your search';

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
}
