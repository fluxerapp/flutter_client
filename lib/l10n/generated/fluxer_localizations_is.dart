// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Icelandic (`is`).
class FluxerLocalizationsIs extends FluxerLocalizations {
  FluxerLocalizationsIs([String locale = 'is']) : super(locale);

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
  String get changeYourFluxerTag => 'Change Your FluxerTag';

  @override
  String get fluxerTagInputLabel => 'FluxerTag';

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
  String get fluxerTagAlreadyTaken => 'FluxerTag Already Taken';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'The FluxerTag $username#$discriminator is already taken. Continuing will reroll your discriminator automatically.';
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
      'If you save this FluxerTag, your custom 4-digit tag will revert to a random number when your Plutonium subscription ends. If your subscription fails to renew, you\'ll have a 3-day grace period before the tag changes.';

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
  String get fluxerTagUpdated => 'FluxerTag updated';

  @override
  String get fluxerTagUpdateFailed =>
      'Failed to update FluxerTag. Please try again.';

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
      'Claim your account to change your FluxerTag';

  @override
  String get changeFluxerTag => 'Change FluxerTag';

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
      'JPEG, PNG, GIF, WebP. Max 10MB. Recommended: 512×512px';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get changeBanner => 'Change Banner';

  @override
  String get removeBanner => 'Remove Banner';

  @override
  String get bannerDescription =>
      'JPEG, PNG, GIF, WebP. Max 10MB. Minimum: 680×240px (17:6)';

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
  String get blockedUsersCopyTag => 'Copy FluxerTag';

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
  String get accessibilityUnreadGroupTitle => 'Unread indicators';

  @override
  String get accessibilityUnreadGroupDescription =>
      'Control how unread message indicators are displayed.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'Show faded unread indicator on muted channels';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'Display a dimmed unread indicator next to muted direct messages and channels so you can still see at a glance when there\'s activity.';

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
  String get chatMessagePin => 'Pin Message';

  @override
  String get chatMessageUnpin => 'Unpin Message';

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
  String get chatReplyMentionOn => 'On';

  @override
  String get chatReplyMentionOff => 'Off';

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
  String get chatMessageUnpinConfirmTitle => 'Unpin Message';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Are you sure you want to unpin this message?';

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
  String get userSettingsNavExpressionPacks => 'Expression Packs';

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
  String get userSettingsNavMessagesAndMedia => 'Messages & Media';

  @override
  String get userSettingsNavAudioAndVideo => 'Audio & Video';

  @override
  String get userSettingsNavSoundsAndAlerts => 'Sounds & Alerts';

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
  String get betaWarningTitle => 'Beta software';

  @override
  String get betaWarningMessage =>
      'This is beta software. Not everything is finished or added yet.';

  @override
  String get betaWarningReportIssues =>
      'Please report any issues you find to the Fluxer Mobile community (you must have Plutonium to be able to join the community currently).';

  @override
  String get betaWarningRepoLink => 'View source on GitHub';

  @override
  String get betaWarningGotIt => 'Got it';

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
}
