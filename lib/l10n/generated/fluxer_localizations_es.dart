// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class FluxerLocalizationsEs extends FluxerLocalizations {
  FluxerLocalizationsEs([String locale = 'es']) : super(locale);

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

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get guildNavbarDirectMessages => 'Direct Messages';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Explore Discoverable Communities';

  @override
  String get guildNavbarAddCommunity => 'Add a Community';

  @override
  String get guildNavbarHelp => 'Help';

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
  String get guildSettingsDiscoveryFormTitle => 'Application';

  @override
  String get guildSettingsDiscoveryStatusTitle => 'Status';

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
  String get guildSettingsUnban => 'Unban';

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
  String get guildSettingsWebhooksInfo =>
      'Create webhooks from Channel settings. Edit them here.';

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
  String get guildSettingsMembersSortNewest => 'Newest first';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filter by user';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filter by action';
}

/// The translations for Spanish Castilian, as used in Latin America and the Caribbean (`es_419`).
class FluxerLocalizationsEs419 extends FluxerLocalizationsEs {
  FluxerLocalizationsEs419() : super('es_419');

  @override
  String get reconnectingTitle => '¡Fluxer ha dejado el grupo!';

  @override
  String get reconnectingBody =>
      'Hay un problema con los servidores.\n¡Se solucionara en breve!';

  @override
  String get gatewayReconnectingToast => 'Reconectando…';

  @override
  String get gatewayConnectedToast => 'Conexión Restablecida';

  @override
  String splashStartupFailed(String error) {
    return 'Error al iniciar: $error';
  }

  @override
  String get retry => 'Reintentar';

  @override
  String get connectingCaps => 'CONECTANDO';

  @override
  String get splashConnectionLost => 'Conexión perdida';

  @override
  String get splashViewOnStatusPage => 'Ver página de estado';

  @override
  String get splashConnectionIssuesPrompt => '¿Problemas de conexión?';

  @override
  String get splashStatusPageLink => 'Página de estado';

  @override
  String get splashReadIncident => 'Ver reporte del incidente';

  @override
  String get splashIncidentHistory => 'Historial de incidentes';

  @override
  String get welcomeBack => 'Hola de nuevo';

  @override
  String get email => 'Correo electrónico';

  @override
  String get emailInvalid => 'Por favor, ingresa un correo electrónico valido.';

  @override
  String get password => 'Contraseña';

  @override
  String get forgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get logIn => 'Iniciar sesión';

  @override
  String get logInWithPasskey => 'Iniciar sesión con llave de acceso';

  @override
  String continueWithSso(String provider) {
    return 'Continuar con $provider';
  }

  @override
  String get ssoRequired => 'Se requiere SSO para acceder a esta instancia.';

  @override
  String get organizationSsoProvider =>
      'Inicia sesión con el proveedor de inicio de sesión único de tu organización.';

  @override
  String get failedToStartSso => 'No se pudo iniciar el SSO';

  @override
  String get ssoCancelled => 'Se canceló el inicio de sesión con SSO';

  @override
  String preferSso(String provider) {
    return '¿Prefieres usar SSO? Continúa con $provider.';
  }

  @override
  String get logInViaBrowser => 'Iniciar sesión en el navegador';

  @override
  String get needAccountPrompt => '¿No tienes una cuenta? ';

  @override
  String get register => 'Registrarse';

  @override
  String get orDivider => 'O';

  @override
  String get captchaTitle => 'Verifica que eres humano';

  @override
  String get captchaDescription =>
      'Necesitamos asegurarnos de que no eres un robot. Por favor, completa la verificación a continuación.';

  @override
  String get captchaSwitchToHcaptcha =>
      '¿Tienes problemas? Intenta con hCaptcha';

  @override
  String get captchaSwitchToTurnstile => 'Intenta con Turnstile';

  @override
  String get cancel => 'Cancelar';

  @override
  String get ipAuthCheckEmail => 'Revisa tu correo';

  @override
  String ipAuthDescription(String email) {
    return 'Enviamos un enlace por correo para autorizar este inicio de sesión. Por favor, abre tu bandeja de entrada en $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Se perdió la conexión';

  @override
  String get ipAuthConnectionLostDescription =>
      'Se perdió la conexión mientras se esperaba la autorización. Por favor, inténtalo de nuevo.';

  @override
  String get ipAuthLinkExpired => 'El enlace de inicio de sesión ha caducado';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Este enlace de autorización ha caducado. Por favor, inicia sesión de nuevo.';

  @override
  String get ipAuthResendEmail => 'Reenviar correo';

  @override
  String get ipAuthResent => 'Reenviado';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Volver';

  @override
  String get mfaTitle => 'Autenticación en dos pasos';

  @override
  String get mfaChooseMethod => 'Elige un método de verificación';

  @override
  String get mfaMethodTotp => 'Aplicación de Autenticación';

  @override
  String get mfaMethodWebauthn => 'Llave de Seguridad / Llave de acceso';

  @override
  String get mfaTotpDescription =>
      'Ingresa el código de 6 dígitos de tu aplicación de autenticación o uno de tus códigos de respaldo.';

  @override
  String get mfaCodeLabel => 'Código';

  @override
  String get mfaTryAnotherMethod => 'Probar otro método';

  @override
  String get mfaUseSecurityKey =>
      'Llave de seguridad / Llave de acceso en su lugar';

  @override
  String get accountSelectorTitle => 'Elige una cuenta';

  @override
  String get accountSelectorDescription =>
      'Selecciona una cuenta para continuar o añade una diferente.';

  @override
  String get accountAdd => 'Añadir una cuenta';

  @override
  String get accountRemove => 'Eliminar';

  @override
  String accountRemoveTitle(String username) {
    return 'Eliminar $username';
  }

  @override
  String get accountRemoveDescription =>
      'Esto eliminará la sesión guardada para esta cuenta.';

  @override
  String get accountRemoveOnlyDescription =>
      'Esto eliminara la única cuenta guardada en este dispositivo.';

  @override
  String get accountExpired => 'Expirada';

  @override
  String accountSessionExpired(String identifier) {
    return 'La sesión para $identifier ha expirado. Por favor, inicia sesión otra vez.';
  }

  @override
  String get accountManageTitle => 'Administrar cuentas';

  @override
  String get accountSwitchFailed =>
      'No se pudo cambiar de cuenta. Inténtalo de nuevo.';

  @override
  String get profileTabMenuSwitchAccounts => 'Cambiar de cuenta';

  @override
  String get statusChangeSheetTitle => 'Establecer estado';

  @override
  String get statusOnlineStatusSection => 'Estado en línea';

  @override
  String get statusOnline => 'En línea';

  @override
  String get statusIdle => 'Ausente';

  @override
  String get statusDnd => 'No molestar';

  @override
  String get statusInvisible => 'Invisible';

  @override
  String get statusOffline => 'Desconectado';

  @override
  String get statusUntilIChangeIt => 'Hasta que lo cambie';

  @override
  String get statusDontClear => 'No borrar';

  @override
  String get statusFor10Seconds => 'Durante 10 segundos';

  @override
  String get statusClearAfter10Seconds => '10 segundos';

  @override
  String get statusClearAfter15Minutes => '15 minutos';

  @override
  String get statusClearAfter30Minutes => '30 minutos';

  @override
  String get statusClearAfter1Hour => '1 hora';

  @override
  String get statusClearAfter3Hours => '3 horas';

  @override
  String get statusClearAfter4Hours => '4 horas';

  @override
  String get statusClearAfter8Hours => '8 horas';

  @override
  String get statusClearAfter24Hours => '24 horas';

  @override
  String get statusClearAfter3Days => '3 días';

  @override
  String get statusDndDescription =>
      'No recibirás notificaciones en el escritorio';

  @override
  String get statusInvisibleDescription => 'Aparecerás como desconectado';

  @override
  String get customStatusSetTitle => 'Establecer estado personalizado';

  @override
  String get customStatusCurrentHint => 'Estado personalizado';

  @override
  String get customStatusClear => 'Borrar estado personalizado';

  @override
  String get customStatusPlaceholder => '¿Que esta pasando?';

  @override
  String get customStatusChooseEmoji => 'elegir un emoji';

  @override
  String get customStatusClearAfter => 'Borrar después de';

  @override
  String get customStatusSave => 'Guardar';

  @override
  String get accountActive => 'Cuenta activa';

  @override
  String get signOut => 'Cerrar sesión';

  @override
  String get suspendedPermanentTitle => 'Cuenta Suspendida Permanentemente';

  @override
  String get suspendedTemporaryTitle => 'Cuenta Suspendida';

  @override
  String get suspendedPermanentDescription =>
      'Tu cuenta ha sido suspendida de forma permanente por infringir nuestros Términos de Servicio.';

  @override
  String get suspendedTemporaryDescription =>
      'Tu cuenta ha sido suspendida temporalmente. Podrás acceder a ella una vez que finalice el periodo de suspensión.';

  @override
  String get suspendedIssuedAt => 'Emitido';

  @override
  String get suspendedEndsAt => 'Finaliza';

  @override
  String get suspendedDuration => 'Duración';

  @override
  String get suspendedPermanent => 'Permanente';

  @override
  String get suspendedReason => 'Razón';

  @override
  String get suspendedAppealDeadline => 'Fecha limite de apelación';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Tu cuenta está programada para ser eliminada el $date.';
  }

  @override
  String get suspendedRecheck => 'Buscar Actualizaciones';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Volver a intentar en ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Volver al Inicio de sesión';

  @override
  String get suspendedAppealTitle => 'Apelar';

  @override
  String get suspendedAppealHint =>
      'Explica por qué deberíamos reconsiderar tu suspensión (mínimo 50 caracteres)...';

  @override
  String get suspendedAppealSubmit => 'Enviar Apelación';

  @override
  String get suspendedAppealPending => 'Pendiente de revisión';

  @override
  String get suspendedAppealAccepted => 'Apelación aceptada';

  @override
  String get suspendedAppealRejected => 'Apelación rechazada';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Tu apelación ha sido aceptada y tu cuenta ha sido restablecida.';

  @override
  String get suspendedSignIn => 'Iniciar sesión en tu cuenta';

  @override
  String get forgotPasswordTitle => '¿Olvidaste tu contraseña?';

  @override
  String get forgotPasswordDescription =>
      'Ingresa tu correo electrónico y te enviaremos un enlace para restablecer tu contraseña.';

  @override
  String get forgotPasswordSubmit => 'Enviar enlace de restablecimiento';

  @override
  String get forgotPasswordSentTitle => 'Revisa tu correo';

  @override
  String get forgotPasswordSentDescription =>
      'Hemos enviado las instrucciones para restablecer tu contraseña a tu correo electrónico. Por favor, revisa tu bandeja de entrada y sigue el enlace para restablecer tu contraseña.';

  @override
  String get forgotPasswordBackToLogin => 'Regresar al inicio de sesión';

  @override
  String get resetPasswordTitle => 'Establecer nueva contraseña';

  @override
  String get resetPasswordDescription =>
      'Ingresa tu nueva contraseña a continuación para completar el proceso de restablecimiento.';

  @override
  String get resetPasswordNewPassword => 'Nueva contraseña';

  @override
  String get resetPasswordConfirm => 'Confirmar nueva contraseña';

  @override
  String get resetPasswordSubmit => 'Restablecer contraseña';

  @override
  String get resetPasswordMismatch => 'Las contraseñas no coinciden.';

  @override
  String get registerTitle => 'Crear una cuenta';

  @override
  String get registerDisplayName => 'Nombre visible (Opcional)';

  @override
  String get registerDisplayNameHint => '¿Cómo quieres que te llamen?';

  @override
  String get registerUsername => 'Nombre de usuario (Opcional)';

  @override
  String get registerUsernameHint =>
      'Deja en blanco para un nombre de usuario aleatorio';

  @override
  String get registerUsernameTagHint =>
      'Se añadirá automáticamente una etiqueta de 4 dígitos para garantizar que sea único';

  @override
  String get registerDateOfBirth => 'Fecha de nacimiento';

  @override
  String get registerMonth => 'Mes';

  @override
  String get registerDay => 'Día';

  @override
  String get registerYear => 'Año';

  @override
  String get registerConsent =>
      'Acepto los Términos de Servicio y las Políticas de Privacidad';

  @override
  String get registerConsentPrefix => 'Acepto los ';

  @override
  String get registerConsentTerms => 'Términos de Servicio';

  @override
  String get registerConsentAnd => ' y ';

  @override
  String get registerConsentPrivacy => 'Políticas de Privacidad';

  @override
  String get registerConfirmPassword => 'Confirmar Contraseña';

  @override
  String get registerSubmit => 'Crear cuenta';

  @override
  String get registerHaveAccount => '¿Ya tienes una cuenta? ';

  @override
  String get passkeyNoCredentials =>
      'No se encontraron llaves de acceso para esta aplicación. En su lugar, inicia sesión con tu correo y contraseña.';

  @override
  String get passkeyDeviceNotSupported =>
      'Este dispositivo no admite llaves de acceso.';

  @override
  String get passkeyDomainNotAssociated =>
      'Las llaves de acceso no están configuradas para esta app. En su lugar, inicia sesión con tu correo y contraseña.';

  @override
  String get passkeyTimeout =>
      'Se agotó el tiempo de autenticación con llave de acceso. Por favor, inténtalo de nuevo.';

  @override
  String get passkeyNotAvailable =>
      'Las llaves de acceso no están disponibles para esta app. En su lugar, inicia sesión con tu correo y contraseña.';

  @override
  String get passkeyFailed =>
      'Falló la autenticación con llave de acceso. Por favor, inténtalo de nuevo.';

  @override
  String get errorUnableToCreateAccount =>
      'No se pudo crear la cuenta. Por favor, inténtalo de nuevo.';

  @override
  String get errorUnableToSignIn =>
      'No se puede iniciar sesión en este momento. Por favor, inténtelo de nuevo.';

  @override
  String get errorInvalidEmailOrPassword =>
      'Correo electrónico o contraseña no válidos.';

  @override
  String get errorUnableToSendResetLink =>
      'No se pudo enviar el enlace de restablecimiento. Por favor, Inténtalo de nuevo.';

  @override
  String get errorUnableToResetPassword =>
      'No se pudo restablecer la contraseña. Por favor, inténtalo de nuevo.';

  @override
  String get embedInviteJoin => 'Unirse a la Comunidad';

  @override
  String get embedInviteGoTo => 'Ir a la Comunidad';

  @override
  String embedInviteOnline(String count) {
    return '$count En linea';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count Miembros';
  }

  @override
  String get embedInviteUnknownTitle => 'Invitación desconocida';

  @override
  String get embedInviteUnknownSubtitle =>
      'Intenta pedir una nueva invitación.';

  @override
  String get embedInviteUnavailable => 'Invitación no disponible';

  @override
  String get mentionUnknownChannel => 'canal-desconocido';

  @override
  String get channelAccessDeniedTitle => 'No tienes acceso a este canal';

  @override
  String get channelAccessDeniedDescription =>
      'No tienes acceso al canal donde se envió este mensaje.';

  @override
  String get messageJumpLinkNoAccess => 'No tienes acceso';

  @override
  String get okay => 'Aceptar';

  @override
  String get embedThemeTitle => 'Tema compartido';

  @override
  String get embedThemeSubtitle =>
      'Este cliente no admite temas personalizados.';

  @override
  String get embedThemeUnavailableButton => 'Temas no disponibles';

  @override
  String get privacySettings => 'Ajustes de privacidad';

  @override
  String get privacyDirectMessages => 'Mensajes directos';

  @override
  String get privacyDirectMessagesDescription =>
      'Permitir mensajes directos de otros miembros de esta comunidad';

  @override
  String get privacyBotDirectMessages => 'Mensajes directos de Bots';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Permitir que los bots de esta comunidad te envíen mensajes directos';

  @override
  String get privacyMutualDmsDisabled =>
      'Los administradores de la comunidad desactivaron la opción de recibir mensajes directos únicamente de miembros mutuos en esta comunidad.';

  @override
  String get communityDebug => 'Depuración de la comunidad';

  @override
  String get copiedToClipboard => 'Copiado en el portapapeles';

  @override
  String get notificationSettings => 'Ajustes de notificación';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Silenciar $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Silenciar una comunidad evita que aparezcan indicadores de no leídos y notificaciones, a menos que te mencionen';

  @override
  String get notificationCommunitySettings =>
      'Ajustes de notificación de la comunidad';

  @override
  String get notificationAllMessages => 'Todos los mensajes';

  @override
  String get notificationOnlyMentions => 'Solo menciones';

  @override
  String get notificationNothing => 'Nada';

  @override
  String get notificationSuppressEveryone => 'Silenciar @everyone y @here';

  @override
  String get notificationSuppressRoles =>
      'Silenciar todas las @menciones de roles';

  @override
  String get notificationMobilePush => 'Notificaciones push móviles';

  @override
  String get notificationOverrides => 'Excepciones de notificación';

  @override
  String get notificationSelectChannel => 'Seleccionar un canal o categoría';

  @override
  String get notificationOnlyAtMentions => 'Solo @menciones';

  @override
  String get notificationMuteChannel => 'Silenciar canal';

  @override
  String get notificationUnmuteChannel => 'Reactivar sonido del canal';

  @override
  String get notificationNoCategory => 'Sin categoría';

  @override
  String get dmMarkAsRead => 'Marcar como leído';

  @override
  String get dmMuteConversation => 'Silenciar chat';

  @override
  String get dmUnmuteConversation => 'Desactivar silencio de chat';

  @override
  String get dmPinDm => 'Fijar chat';

  @override
  String get dmUnpinDm => 'Desfijar chat';

  @override
  String get dmAlwaysShowInSidebar => 'Mostrar siempre en la barra lateral';

  @override
  String get dmRemoveFromAlwaysShown => 'Quitar de mostrar siempre';

  @override
  String get dmCloseDm => 'Cerrar chat';

  @override
  String get dmCloseDmConfirmTitle => 'Cerrar chat';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return '¿Estás seguro de que quieres cerrar el chat con $username? Puedes volver a abrirlo más tarde.';
  }

  @override
  String get dmCopyChannelId => 'Copiar ID del Canal';

  @override
  String get dmChannelIdCopied => 'ID del canal copiado';

  @override
  String get dmCopyUserId => 'Copiar ID de usuario';

  @override
  String get dmUserIdCopied => 'ID de usuario copiado';

  @override
  String get dmViewProfile => 'Ver perfil';

  @override
  String get dmVoiceCall => 'Iniciar llamada de voz';

  @override
  String get incomingVoiceCallTitle => 'Llamada de voz entrante';

  @override
  String get incomingVoiceCallAccept => 'Aceptar';

  @override
  String get incomingVoiceCallDecline => 'Rechazar';

  @override
  String get incomingVoiceCallLabel => 'Llamada entrante';

  @override
  String get incomingVoiceCallIgnore => 'Ignorar';

  @override
  String get directVoiceCallNotEligible =>
      'No se puede iniciar la llamada ahora mismo. Por favor, inténtalo de nuevo en un momento.';

  @override
  String get voiceJoinCallFailed =>
      'No se pudo conectar a esta llamada. Revisa tu conexión e inténtalo de nuevo.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'No fue posible entrar a esta llamada. Revisa tu conexión e inténtalo de nuevo.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'No se pudo actualizar esta llamada en el servidor. Revisa tu conexión e inténtalo de nuevo.';

  @override
  String get dmAddNote => 'Añadir nota';

  @override
  String get dmEditGroup => 'Editar grupo';

  @override
  String get dmInviteToCommunity => 'Invitar a la comunidad';

  @override
  String get dmBlock => 'Bloquear';

  @override
  String get dmLeaveGroup => 'Abandonar grupo';

  @override
  String get dmNoCommunitiesAvailable => 'No hay comunidades disponibles';

  @override
  String dmGroupMemberCount(int count) {
    return '$count Miembros';
  }

  @override
  String get dmMuteFor15Min => 'Por 15 minutos';

  @override
  String get dmMuteFor30Min => 'Por 30 minutos';

  @override
  String get dmMuteFor1Hour => 'Por 1 hora';

  @override
  String get dmMuteFor3Hours => 'Por 3 horas';

  @override
  String get dmMuteFor4Hours => 'Por 4 horas';

  @override
  String get dmMuteFor8Hours => 'Por 8 horas';

  @override
  String get dmMuteFor24Hours => 'Por 24 horas';

  @override
  String get dmMuteFor3Days => 'Por 3 días';

  @override
  String get dmMuteForever => 'Hasta que lo vuelva a activar';

  @override
  String get dmPinGroupDm => 'Fijar chat grupal';

  @override
  String get dmUnpinGroupDm => 'Desfijar chat grupal';

  @override
  String get dmFavoriteDm => 'Añadir chat a favoritos';

  @override
  String get dmUnfavoriteDm => 'Quitar chat de favoritos';

  @override
  String get dmFavoriteGroupDm => 'Añadir chat grupal a favoritos';

  @override
  String get dmUnfavoriteGroupDm => 'Quitar chat grupal de favoritos';

  @override
  String get dmChangeFriendNickname => 'Cambiar apodo de amigo';

  @override
  String get dmRemoveFriend => 'Eliminar amigo';

  @override
  String get dmAddFriend => 'Añadir amigo';

  @override
  String get dmAcceptFriendRequest => 'Aceptar solicitud de amistad';

  @override
  String get dmIgnoreFriendRequest => 'Ignorar solicitud de amistad';

  @override
  String get dmFriendRequestSent => 'Solicitud de amistad enviada';

  @override
  String get dmUnblock => 'Desbloquear';

  @override
  String get dmDebugUser => 'Depurar usuario';

  @override
  String get dmDebugChannel => 'Depurar canal';

  @override
  String get dmPinned => 'Chat fijado';

  @override
  String get dmUnpinned => 'Chat desfijado';

  @override
  String get dmMuted => 'Chat silenciado';

  @override
  String get dmUnmuted => 'Sonido de chat activado';

  @override
  String get dmRemoveFriendConfirmTitle => 'Eliminar amigo';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return '¿Estás seguro de que quieres eliminar a $username de tus amigos?';
  }

  @override
  String get dmBlockConfirmTitle => 'Bloquear usuario';

  @override
  String dmBlockConfirmDescription(String username) {
    return '¿Estás seguro de que quieres bloquear a $username? No podrá enviarte mensajes ni solicitudes de amistad.';
  }

  @override
  String get dmFriendRequestSentToast => 'Solicitud de amistad enviada';

  @override
  String get dmFriendRequestFailed => 'No se pudo enviar solicitud de amistad';

  @override
  String get dmAcceptFriendRequestFailed =>
      'No se pudo aceptar la solicitud de amistad';

  @override
  String get dmRemoveFriendFailed => 'No se pudo eliminar de tus amigos';

  @override
  String get dmBlockFailed => 'No se pudo bloquear al usuario';

  @override
  String get dmUnblockFailed => 'No se pudo desbloquear al usuario';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'No se pudo ignorar la solicitud de amistad';

  @override
  String get dmAddFriends => 'Añadir amigos';

  @override
  String get addFriendSheetTitle => 'Añadir amigo';

  @override
  String get addFriendUsernameHint => 'Username#0000';

  @override
  String get addFriendUsernameLabel => 'Nombre de usuario del amigo';

  @override
  String get addFriendSendRequest => 'Enviar solicitud';

  @override
  String get addFriendNoUserFound =>
      'No se encontró ningún usuario con ese nombre de usuario.';

  @override
  String get addFriendInvalidUsername =>
      'Ingresa un nombre de usuario valido (Username#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Solicitud de amistad enviada';

  @override
  String get addFriendClaimTitle => 'Reclama tu cuenta';

  @override
  String get addFriendClaimDescription =>
      'Reclama tu cuenta para enviar solicitudes de amistad.';

  @override
  String get addFriendVerifyTitle => 'Verifica tu correo';

  @override
  String get addFriendVerifyDescription =>
      'Debes verificar tu correo electrónico antes de poder enviar solicitudes de amistad.';

  @override
  String get addFriendVerifyEmail => 'Verificar correo';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Solicitudes de amistad recibidas ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Solicitudes de amistad enviadas ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Solicitud de amistad recibida';

  @override
  String get addFriendOutgoingStatus => 'Solicitud de amistad enviada';

  @override
  String get addFriendViewProfile => 'Ver perfil';

  @override
  String get addFriendAccept => 'Aceptar';

  @override
  String get addFriendIgnore => 'Ignorar';

  @override
  String get addFriendAcceptTitle => 'Aceptar solicitud de amistad';

  @override
  String get addFriendIgnoreTitle => 'Ignorar solicitud de amistad';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return '¿Aceptar solicitud de amistad de $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return '¿Ignorar solicitud de amistad de $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Cancelar solicitud';

  @override
  String get addFriendCancelRequestFailed =>
      'No se pudo cancelar la solicitud de amistad. Inténtalo de nuevo.';

  @override
  String get addFriendNotAcceptingRequests =>
      'No se están aceptando solicitudes de amistad en este momento.';

  @override
  String get addFriendUnblockFirst =>
      'Desbloquea a este usuario para enviar una solicitud de amistad.';

  @override
  String get addFriendCannotSendToSelf =>
      'No puedes enviarte una solicitud de amistad a ti mismo.';

  @override
  String get addFriendAlreadyFriends => 'Ya eres amigo de este usuario.';

  @override
  String get addFriendClaimToSend =>
      'Termina de registrarte para enviar solicitudes de amistad.';

  @override
  String get addFriendSendFailedGeneric =>
      'No se pudo enviar la solicitud de amistad. Inténtalo de nuevo.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Sistema';

  @override
  String get emojiSearchPlaceholder => 'Encuentra el emoji de tus sueños';

  @override
  String get emojiSearchEmpty => 'Ningún emoji coincide con tu búsqueda';

  @override
  String get emojiAutocompleteDefaultLabel => 'Emojis predeterminados';

  @override
  String get emojiFrequentlyUsed => 'Usados frecuentemente';

  @override
  String get emojiTabGifs => 'GIFs';

  @override
  String get emojiTabMedia => 'Multimedia';

  @override
  String get emojiTabStickers => 'Stickers';

  @override
  String get emojiTabEmojis => 'Emojis';

  @override
  String get gifPickerSearch => 'Buscar GIFs';

  @override
  String get gifPickerSearchKlipy => 'Buscar KLIPY';

  @override
  String get gifPickerSearchTenor => 'Buscar Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Favoritos';

  @override
  String get gifPickerTrending => 'GIFs en tendencia';

  @override
  String get gifPickerNoResultsTitle => 'Sin resultados de búsqueda';

  @override
  String get gifPickerNoResultsDescription =>
      'Intenta con otro termino de búsqueda';

  @override
  String get gifPickerLoadFailedTitle => 'No se pudieron cargar los GIFs';

  @override
  String get gifPickerLoadFailedBody =>
      'Revisa tu conexión e inténtalo de nuevo.';

  @override
  String get emojiCategoryPeople => 'Personas';

  @override
  String get emojiCategoryNature => 'Naturaleza';

  @override
  String get emojiCategoryFood => 'Comida y bebida';

  @override
  String get emojiCategoryActivity => 'Actividades';

  @override
  String get emojiCategoryTravel => 'Viajes y lugares';

  @override
  String get emojiCategoryObjects => 'Objetos';

  @override
  String get emojiCategorySymbols => 'Símbolos';

  @override
  String get emojiCategoryFlags => 'Banderas';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Desbloquea $emojiCount de $communityCount con Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Obtener Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'No volver a mostrar esto';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count emojis personalizados',
      one: '1 emoji personalizado',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count comunidades',
      one: '1 comunidad',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Aviso de enlace externo';

  @override
  String get externalLinkWarningLeaving => 'Estás a punto de salir de Fluxer';

  @override
  String get externalLinkWarningDescription =>
      'Los enlaces externos pueden ser peligrosos. Por favor, ten cuidado.';

  @override
  String get externalLinkWarningDestinationUrl => 'URL de destino:';

  @override
  String get externalLinksSectionTitle => 'Enlaces externos';

  @override
  String get externalLinksSectionDescription =>
      'Configurar cómo se manejan los avisos de enlaces externos.';

  @override
  String get externalLinkWarningTrustPrefix => 'Confiar siempre en ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — omitir este aviso la próxima vez';

  @override
  String get externalLinkVisitSite => 'Visitar sitio';

  @override
  String get externalLinkTrustAllLabel =>
      'Confiar en todos los enlaces externos';

  @override
  String get externalLinkStripTrackingLabel =>
      'Eliminar parámetros de seguimiento de las URLs';

  @override
  String get externalLinkStripTrackingDescription =>
      'Eliminar automáticamente los parámetros de seguimiento (como utm_source, fbclid, gclid) de las URLs en los mensajes enviados. Limpia el enlace antes de que llegue a otros usuarios.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      '¿Confiar en todos los enlaces externos?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Esto confiará en todos los enlaces externos y omitirá el aviso para cada dominio. Tus dominios confiables existentes serán reemplazados. Esto es menos seguro.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Confiar en todos';

  @override
  String get externalLinkStopTrustingAllTitle =>
      '¿Dejar de confiar en todos los enlaces?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Se volverán a mostrar los avisos de enlaces externos. Tendrás que añadir los dominios confiables de forma individual.';

  @override
  String get externalLinkStopTrustingAllAction =>
      'Desactivar \'Confiar en todos\'';

  @override
  String get externalLinkTrustedAllDescription =>
      'Todos los enlaces externos son de confianza. No se mostrarán avisos.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Tienes $count dominio(s) confiable(s). Puedes añadir más marcando la casilla al visitar enlaces externos.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Cuando está activado, no se mostrarán avisos de enlaces externos. Esto es menos seguro.';

  @override
  String get imageFileTooLarge =>
      'El archivo de imagen es demasiado grande. Por favor, elige un archivo inferior a 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Los avatares animados requieren Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Los banners animados requieren Plutonium';

  @override
  String get animatedAvifNotSupported => 'Formato AVIF animado no compatible';

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
  String get plutoniumBadgePrivacyTitle =>
      'Privacidad de la insignia de Plutonium';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Controla cómo se muestra tu insignia de Plutonio a los demás';

  @override
  String get hidePlutoniumBadgeLabel =>
      'Ocultar la insignia de Plutonium por completo';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Ocultar completamente tu insignia de Plutonium a otros usuarios';

  @override
  String get hidePlutoniumPurchaseDate =>
      'Ocultar la fecha de compra de Plutonium';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Ocultar fecha de compra de Plutonium ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Eliminar la fecha de compra de Plutonium de tu insignia';

  @override
  String get maskVisionaryAsSubscription =>
      'Ocultar la insignia de Visionario como suscripción';

  @override
  String get maskVisionaryDescription =>
      'Mostrar Visionario como una suscripción normal';

  @override
  String get hideVisionaryIdBadge => 'Ocultar ID de la insignia de Visionario';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Ocultar ID de Visionario (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription =>
      'Eliminar ID de tu insignia de Visionario';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Estás en una prueba de Plutonium; tu suscripción comienza el $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Tu suscripción comenzará automáticamente cuando finalice tu prueba. No es necesario realizar ninguna acción.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Estás en una prueba de Plutonium que finaliza el $date';
  }

  @override
  String get premiumTrialActiveProfile => 'Estás en una prueba de Plutonium';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Máx. 10 MB. Recomendado: 512×512 px. Los avatares animados (GIF) requieren Plutonio.';

  @override
  String get bannerPlutoniumUpsell =>
      'Personaliza tu perfil con una imagen de fondo, estática o animada, para que destaque.';

  @override
  String get getPlutonium => 'Obtener Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Las compras integradas aún no están disponibles en esta plataforma. ¡Mantente atento, muy pronto estarán aquí!';

  @override
  String get profilePreviewLabel => 'Vista previa';

  @override
  String get profilePreviewMessage => 'Mensaje';

  @override
  String get profilePreviewMemberSince => 'Miembro de Fluxer desde';

  @override
  String get unclaimedAccountTitle => 'Cuenta sin reclamar';

  @override
  String get unclaimedAccountDescription =>
      'Tu cuenta aún no ha sido activada. Sin un correo electrónico y una contraseña, podrías perder el acceso. Activa tu cuenta ahora para protegerla.';

  @override
  String get claimAccount => 'Activar cuenta';

  @override
  String get profileTypeLabel => 'Tipo de perfil';

  @override
  String get profileTypeGlobal => 'Perfil global';

  @override
  String get profileTypeGuildDescription =>
      'Estás editando tu perfil de esta comunidad. Este perfil solo será visible aquí y sobrescribirá tu perfil.';

  @override
  String get communityNicknameLabel => 'Apodo en la comunidad';

  @override
  String get perGuildPremiumUpsellText =>
      'Personalizar tu avatar, banner, color de acento y biografía para comunidades individuales requiere Plutonium. El apodo y los pronombres de la comunidad son gratuitos para todos.';

  @override
  String get avatarModeInherit => 'Usar perfil global';

  @override
  String get avatarModeCustom => 'Usar imagen personalizada';

  @override
  String get avatarModeUnset => 'No mostrar';

  @override
  String get profileSavedToast => 'Perfil actualizado';

  @override
  String get profileEditButton => 'Editar perfil';

  @override
  String get profileNoteLabel => 'Nota';

  @override
  String get profileNoteVisibility => '(Solo visible para ti)';

  @override
  String get profileNoteEmpty => 'Aún sin notas.';

  @override
  String get sudoTitle => 'Verifica tu identidad';

  @override
  String get sudoDescription =>
      'Esta acción requiere verificación para continuar.';

  @override
  String get sudoAuthenticatorCode => 'Código de autenticación';

  @override
  String get sudoMethodPassword => 'Contraseña';

  @override
  String get sudoMethodTotp => 'Autenticador';

  @override
  String get sudoVerificationFailed =>
      'Error de verificación. Por favor, inténtalo de nuevo.';

  @override
  String get securityAccountTitle => 'Cuenta';

  @override
  String get securityAccountDescription =>
      'Gestiona tu correo electrónico, contraseña y la configuración de tu cuenta';

  @override
  String get securitySectionTitle => 'Seguridad';

  @override
  String get securitySectionDescription =>
      'Protege tu cuenta con autenticación de dos factores y llaves de acceso';

  @override
  String get securityLoginEmailSectionTitle => 'Ajustes de correo electrónico';

  @override
  String get securityLoginEmailSectionDescription =>
      'Gestiona la dirección de correo electrónico que usas para iniciar sesión en Fluxer';

  @override
  String get securityLoginEmailAddressLabel => 'Correo electrónico';

  @override
  String get securityLoginNoEmailSet => 'Sin correo electrónico';

  @override
  String get securityLoginChangeEmail => 'Cambiar correo electrónico';

  @override
  String get securityLoginAddEmail => 'Añadir correo electrónico';

  @override
  String get securityLoginReveal => 'Revelar';

  @override
  String get securityLoginHide => 'Ocultar';

  @override
  String get securityLoginPasswordSectionTitle => 'Contraseña';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Cambia tu contraseña para mantener tu cuenta segura';

  @override
  String get securityLoginCurrentPasswordLabel => 'Contraseña actual';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Última modificación: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Última modificación: Nunca';

  @override
  String get securityLoginNoPasswordSet => 'Sin contraseña establecida';

  @override
  String get securityLoginChangePassword => 'Cambiar contraseña';

  @override
  String get securityLoginSetPassword => 'Establecer contraseña';

  @override
  String get passwordChangeTitle => 'Cambiar contraseña';

  @override
  String get passwordChangeIntroDescription =>
      'Te enviaremos un código de verificación a tu correo electrónico para confirmar tu identidad antes de cambiar tu contraseña.';

  @override
  String get passwordChangeStart => 'Iniciar';

  @override
  String get passwordChangeVerifyTitle => 'Verifica tu correo electrónico';

  @override
  String get passwordChangeVerifyDescription =>
      'Introduce el código de verificación que enviamos a tu dirección de correo electrónico.';

  @override
  String get passwordChangeVerificationCode => 'Código de verificación';

  @override
  String get passwordChangeVerify => 'Verificar';

  @override
  String get passwordChangeNewPasswordTitle => 'Establecer nueva contraseña';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Introduce tu nueva contraseña a continuación.';

  @override
  String get passwordChangeNewPassword => 'Nueva contraseña';

  @override
  String get passwordChangeConfirmPassword => 'Confirmar nueva contraseña';

  @override
  String get passwordChangeSubmit => 'Cambiar contraseña';

  @override
  String get passwordChangeSuccess => 'Contraseña actualizada';

  @override
  String get passwordChangePasswordsDoNotMatch =>
      'Las contraseñas no coinciden';

  @override
  String get passwordChangeInvalidCode => 'Código invalido o caducado';

  @override
  String get emailChangeTitle => 'Cambiar correo electrónico';

  @override
  String get emailChangeIntroDescription =>
      'Te enviaremos códigos de verificación para confirmar tu identidad antes de cambiar tu dirección de correo electrónico.';

  @override
  String get emailChangeStart => 'Iniciar';

  @override
  String get emailChangeVerifyOriginalTitle =>
      'Verificar correo electrónico actual';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Ingresa el código de verificación enviado a tu correo electrónico actual.';

  @override
  String get emailChangeNewEmailTitle => 'Ingresa el nuevo correo electrónico';

  @override
  String get emailChangeNewEmailDescription =>
      'Ingresa la nueva dirección de correo electrónico que desees usar.';

  @override
  String get emailChangeNewEmailLabel => 'Nuevo correo electrónico';

  @override
  String get emailChangeNewEmailSubmit => 'Enviar código de verificación';

  @override
  String get emailChangeVerifyNewTitle => 'Verificar nuevo correo electronico';

  @override
  String get emailChangeVerifyNewDescription =>
      'Ingresa el código de verificación enviado a tu nuevo correo electrónico.';

  @override
  String get emailChangeSuccess => 'Se cambió el correo electrónico';

  @override
  String get emailChangeInvalidCode => 'Código inválido o vencido';

  @override
  String get resend => 'Volver a enviar';

  @override
  String resendCountdown(int seconds) {
    return 'Volver a enviar (${seconds}s)';
  }

  @override
  String get verificationCode => 'Código de verificación';

  @override
  String get verify => 'Verificar';

  @override
  String get enable => 'Activar';

  @override
  String get disable => 'Desactivar';

  @override
  String get delete => 'Borrar';

  @override
  String get save => 'Guardar';

  @override
  String get securityTfaSectionTitle => 'Verificación en dos pasos';

  @override
  String get securityTfaSectionDescription =>
      'Añadir una capa adicional de seguridad a tu cuenta';

  @override
  String get securityTfaAuthenticatorApp => 'Aplicación de autenticación';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'La verificación en dos pasos está activada';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Usa una aplicación de autenticación para generar códigos de autenticación en dos pasos';

  @override
  String get securityTfaBackupCodes => 'Códigos de respaldo';

  @override
  String get securityTfaBackupCodesDescription =>
      'Consulta y gestiona tus códigos de respaldo para la recuperación de la cuenta';

  @override
  String get securityTfaViewCodes => 'Ver códigos';

  @override
  String get securityPasskeysSectionTitle => 'Llaves de acceso';

  @override
  String get securityPasskeysSectionDescription =>
      'Usa llaves de acceso para iniciar sesión sin contraseña y para la autenticación en dos pasos';

  @override
  String get securityPasskeysRegistered => 'Llaves de acceso registradas';

  @override
  String get securityPasskeysNone => 'No hay llaves de acceso registradas';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# llaves de acceso',
      one: '# llave de acceso',
    );
    return '$_temp0 registradas (máx. 10)';
  }

  @override
  String get securityPasskeysAdd => 'Añadir llave de acceso';

  @override
  String securityPasskeysAdded(String date) {
    return 'Añadido el: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Último uso: $date';
  }

  @override
  String get securityPasskeysRename => 'Renombrar';

  @override
  String get securityPasskeysDeleteTitle => 'Eliminar llave de acceso';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return '¿Estás seguro de que quieres eliminar la llave de acceso \"$name\"?';
  }

  @override
  String get securityPasskeyNameTitle => 'Nombre de llave de acceso';

  @override
  String get securityPasskeyNameLabel => 'Passkey Name';

  @override
  String get securityPasskeyNameHint => 'e.g., YubiKey, iPhone, Work Computer';

  @override
  String get securityPhoneSectionTitle => 'Phone Number';

  @override
  String get securityPhoneSectionDescription =>
      'Manage your phone number for SMS two-factor authenticatio.';

  @override
  String get securityPhoneLabel => 'Phone Number';

  @override
  String get securityPhoneNone =>
      'Add a phone number to enable SMS two-factor authentication.';

  @override
  String get securityPhoneAdd => 'Añadir teléfono';

  @override
  String get securityPhoneRemove => 'Eliminar';

  @override
  String get securityPhoneRemoveTitle => 'Eliminar número de teléfono';

  @override
  String get securityPhoneRemoveDescription =>
      '¿Seguro que quieres eliminar tu número de teléfono?';

  @override
  String get securityPhoneRemoved => 'Número de teléfono eliminado';

  @override
  String get securityClaimTitle => 'Funciones de seguridad';

  @override
  String get securityClaimDescription =>
      'Reclama tu cuenta para acceder a funciones de seguridad como la autenticación de dos factores y las llaves de acceso.';

  @override
  String get securityVerifyEmailRequired =>
      'Debes verificar tu correo electrónico antes de poder configurar la autenticación de dos factores, llaves de acceso o la verificación por SMS.';

  @override
  String get totpEnableTitle => 'Configurar app de autenticación';

  @override
  String get totpEnableDescription =>
      'Escanea el código QR con tu app de autenticación para generar los códigos de la autenticación de dos factores.';

  @override
  String get totpEnableCodeLabel => 'Código';

  @override
  String get totpEnableCodeHint =>
      'Ingresa el código de 6 dígitos de tu app de autenticación';

  @override
  String get totpEnableSuccess => 'Se activó la autenticación de dos factores';

  @override
  String get totpDisableTitle => 'Eliminar app de autenticación';

  @override
  String get totpDisableDescription =>
      'Ingresa el código de 6 dígitos de tu app de autenticación para desactivar la autenticación de dos factores.';

  @override
  String get totpDisableSuccess =>
      'Se desactivó la autenticación de dos factores';

  @override
  String get backupCodesTitle => 'Códigos de respaldo';

  @override
  String get backupCodesWarning =>
      'Si pierdes el acceso a tu app de autenticación y no tienes estos códigos, se te bloqueara el acceso a tu cuenta de forma permanente. Descárgalos o cópialos ahora y guárdalos en un lugar seguro.';

  @override
  String get backupCodesDownload => 'Descargar';

  @override
  String get backupCodesCopy => 'Copiar';

  @override
  String get backupCodesCopied =>
      'Códigos de respaldo copiados al portapapeles';

  @override
  String get backupCodesAcknowledge =>
      'Descargué o copié mis códigos de respaldo y los guardé en un lugar seguro.';

  @override
  String get backupCodesDone => 'Listo';

  @override
  String get backupCodesViewTitle => 'Ver códigos de respaldo';

  @override
  String get backupCodesViewDescription =>
      'Es posible que se requiera una verificación antes de ver tus códigos de respaldo.';

  @override
  String get phoneAddTitle => 'Añadir número de teléfono';

  @override
  String get phoneAddLabel => 'Número de teléfono';

  @override
  String get phoneAddHint => 'Ingresa tu número de teléfono';

  @override
  String get phoneAddFooter =>
      'Ingresa tu número de teléfono. Te enviaremos un código de verificación por SMS.';

  @override
  String get phoneAddSendCode => 'Enviar código';

  @override
  String get phoneVerifyTitle => 'Verificar número de teléfono';

  @override
  String get phoneVerifyDescription =>
      'Ingresa el código de verificación enviado a tu número de teléfono.';

  @override
  String get phoneAddSuccess => 'Número de teléfono añadido';

  @override
  String get dangerZoneSectionTitle => 'Zona de peligro';

  @override
  String get dangerZoneSectionDescription =>
      'Acciones irreversibles y destructivas';

  @override
  String get dangerZoneDisableTitle => 'Desactivar cuenta';

  @override
  String get dangerZoneDisableDescription =>
      'Desactiva tu cuenta temporalmente. Puedes reactivarla más tarde volviendo a iniciar sesión.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Al desactivar tu cuenta, se cerrarán todas tus sesiones. Puedes volver a activarla en cualquier momento iniciando sesión de nuevo.';

  @override
  String get dangerZoneDeleteTitle => 'Eliminar cuenta';

  @override
  String get dangerZoneDeleteDescription =>
      'Elimina tu cuenta y todos los datos asociados de forma permanente. Esta acción no se puede deshacer.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Cancela tu suscripción activa de Plutonium en los ajustes de Plutonium antes de eliminar tu cuenta.';

  @override
  String get dangerZoneDeleteConfirmDescription =>
      '¿Estas seguro de que quieres eliminar tu cuenta? Esta acción programara tu cuenta para su eliminación permanente.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Puedes cancelar el proceso de eliminación dentro de los próximos 14 días';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Después de 14 días, tu cuenta se eliminará de forma permanente';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Una vez procesada la eliminación, no podrás recuperar el acceso a tu cuenta';

  @override
  String get dangerZoneDeleteBullet4 =>
      'No podrás eliminar tus mensajes enviados después de que se elimine tu cuenta';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Si primero quieres exportar tus datos o eliminar tus mensajes, visita la sección Panel de privacidad en los Ajustes de usuario antes de proceder.';

  @override
  String get claimAccountTitle => 'Reclama tu cuenta';

  @override
  String get claimAccountDescription =>
      'Reclama tu cuenta agregando un correo electrónico y una contraseña. Te enviaremos un código de verificación para confirmar tu correo antes de terminar.';

  @override
  String get claimAccountEmailLabel => 'Correo electrónico';

  @override
  String get claimAccountPasswordLabel => 'Contraseña';

  @override
  String get claimAccountSendCode => 'Enviar código';

  @override
  String get claimAccountVerifyDescription =>
      'Ingresa el código que enviamos a tu correo para verificarlo. Tu contraseña se configurará una vez que se confirme el código.';

  @override
  String get claimAccountSuccess => 'Cuenta reclamada con éxito';

  @override
  String get importantInformation => 'Información importante:';

  @override
  String get genericError => 'Ocurrió un error';

  @override
  String get invalidCode => 'Código inválido';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace $count años',
      one: 'hace 1 año',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace $count meses',
      one: 'hace 1 mes',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace $count días',
      one: 'hace 1 día',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace $count horas',
      one: 'hace 1 hora',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace $count minutos',
      one: 'hace 1 minuto',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'Hace un momento';

  @override
  String get authorizedAppsTitle => 'Aplicaciones autorizadas';

  @override
  String get authorizedAppsDescription =>
      'Estas aplicaciones tienen acceso a tu cuenta de Fluxer.';

  @override
  String get authorizedAppsEmptyTitle => 'Aplicaciones no autorizadas';

  @override
  String get authorizedAppsEmptyDescription =>
      'No has autorizado ninguna aplicación para que acceda a tu cuenta.';

  @override
  String get authorizedAppsLoadError =>
      'No se pudieron cargar las aplicaciones autorizadas';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Autorizada el $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Permisos concedidos';

  @override
  String get authorizedAppsRevoke => 'Revocar';

  @override
  String get authorizedAppsRevokeTitle => 'Revocar acceso de la aplicación';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return '¿Seguro que quieres revocar el acceso de $appName? Esta aplicación ya no tendrá acceso a tu cuenta.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Acceder a la información básica de tu perfil (nombre de usuario, avatar, etc.)';

  @override
  String get authorizedAppsScopeEmail =>
      'Ver tu dirección de correo electrónico';

  @override
  String get authorizedAppsScopeGuilds =>
      'Ver las comunidades de las que eres miembro';

  @override
  String get authorizedAppsScopeConnections => 'Ver tus cuentas conectadas';

  @override
  String get authorizedAppsScopeBot =>
      'Añadir un bot a una comunidad con los permisos solicitados';

  @override
  String get authorizedAppsScopeAdmin =>
      'Acceder a las funciones administrativas de la API';

  @override
  String get privacyPendingDeletionTitle => 'Eliminación pendiente';

  @override
  String get blockedUsersTitle => 'Usuarios bloqueados';

  @override
  String get blockedUsersDescription =>
      'Los usuarios bloqueados no pueden enviarte solicitudes de amistad ni mensajes directos.';

  @override
  String get blockedUsersEmptyTitle => 'No hay usuarios bloqueados';

  @override
  String get blockedUsersEmptyDescription => 'Aún no has bloqueado a nadie.';

  @override
  String get blockedUsersLoadError =>
      'No se pudieron cargar los usuarios bloqueados';

  @override
  String get blockedUsersUnblock => 'Desbloquear';

  @override
  String get blockedUsersUnblockTitle => 'Desbloquear usuario';

  @override
  String blockedUsersUnblockDescription(String username) {
    return '¿Seguro que quieres desbloquear a $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Copiar FluxerTag';

  @override
  String get blockedUsersCopyId => 'Copiar ID de usuario';

  @override
  String get userProfileLoadError => 'No se pudo cargar el perfil';

  @override
  String get userProfileRetry => 'Reintentar';

  @override
  String get userProfileMessage => 'Mensaje';

  @override
  String get userProfileVoiceCall => 'Llamada de voz';

  @override
  String get userProfileVideoCall => 'Videollamada';

  @override
  String get userProfileEditProfile => 'Editar perfil';

  @override
  String get userProfileStaffBadgeTooltip => 'Personal de Fluxer';

  @override
  String get userProfileCtpBadgeTooltip => 'Equipo de Comunidad de Fluxer';

  @override
  String get userProfilePartnerBadgeTooltip => 'Socio de Fluxer';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Cazador de errores de Fluxer';

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
    return 'ID de Visionario #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Amigos en común ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Comunidades en común ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Amigos en común';

  @override
  String get userProfileMutualCommunitiesTitle => 'Comunidades en común';

  @override
  String get userProfileNoMutualFriends => 'No se encontraron amigos en común.';

  @override
  String get userProfileNoMutualCommunities =>
      'No se encontraron comunidades en común.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Apodo: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Abrir chat';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Bloqueaste a $username. No podrás enviar mensajes a menos que lo desbloquees.';
  }

  @override
  String get userProfileOpenDm => 'Abrir chat';

  @override
  String get userProfileNoteTitle => 'Nota';

  @override
  String get userProfileNoteVisibility => '(Solo visible para ti)';

  @override
  String get userProfileNoteSave => 'Guardar';

  @override
  String get userProfileNoteDelete => 'Eliminar';

  @override
  String get userProfileNoteEmpty => 'Haz clic para agregar una nota';

  @override
  String get userProfileMemberSince => 'Miembro desde';

  @override
  String get userProfileAboutMe => 'Sobre mí';

  @override
  String get userProfileCopyUsername => 'Copiar nombre de usuario';

  @override
  String get userProfileCopyUserId => 'Copiar ID de usuario';

  @override
  String get userProfileViewMainProfile => 'Ver perfil principal';

  @override
  String get userProfileViewCommunityProfile => 'Ver perfil de la comunidad';

  @override
  String get userProfileBlockUser => 'Bloquear usuario';

  @override
  String get userProfileUnblockUser => 'Desbloquear usuario';

  @override
  String get userProfileRemoveFriend => 'Eliminar amigo';

  @override
  String get userProfileBlockConfirmTitle => 'Bloquear usuario';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return '¿Estas seguro de que quieres bloquear a $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Desbloquear usuario';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return '¿Estas seguro de que quieres desbloquear a $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Eliminar amigo';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return '¿Estas seguro de que quieres eliminar a $username de tus amigos?';
  }

  @override
  String get userProfileFailedOpenDm => 'No se pudo abrir el chat';

  @override
  String get userProfileFailedSaveNote => 'No se pudo guardar la nota';

  @override
  String get userProfileActionFailed => 'La acción falló, intenta de nuevo';

  @override
  String get userProfileChangeNickname => 'Cambiar apodo';

  @override
  String get userProfileKick => 'Expulsar';

  @override
  String get userProfileBan => 'Banear';

  @override
  String get userProfileTimeout => 'Silenciar';

  @override
  String get userProfileRemoveTimeout => 'Remover silencio';

  @override
  String get userProfileTransferOwnership => 'Transferir propiedad';

  @override
  String get userProfileReportUser => 'Reportar usuario';

  @override
  String get userProfileReportMessage => 'Reportar mensaje';

  @override
  String userProfileKickConfirmTitle(String username) {
    return '¿Expulsar a $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return '¿Estas seguro de quieres expulsar a $username? Podrá volver a unirse con una nueva invitación.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => '¿Remover silencio?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Al remover el silencio, $username podrá volver a enviar mensajes, reaccionar y unirse a canales de voz.';
  }

  @override
  String get userProfileTransferConfirmTitle => '¿Transferir la propiedad?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return '¿Transferir la propiedad de esta comunidad a $username? Esta acción es irreversible y perderás todos tus privilegios de dueño.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Banear a $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Duracion del baneo';

  @override
  String get userProfileBanCustomSecondsLabel =>
      'Duración personalizada (segundos)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Cualquier valor de $min a $max segundos';
  }

  @override
  String get userProfileBanDeleteHistoryLabel =>
      'Eliminar historial de mensajes';

  @override
  String get userProfileBanDeleteNone => 'No eliminar nada';

  @override
  String get userProfileBanDelete24h => 'Últimas 24 horas';

  @override
  String get userProfileBanDelete7d => 'Últimos 7 días';

  @override
  String get userProfileBanReasonLabel => 'Razón (opcional)';

  @override
  String get userProfileBanReasonHint => 'Escribe el motivo del baneo';

  @override
  String get userProfileBanSubmit => 'Banear miembro';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Silenciar a $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Duración del silencio';

  @override
  String get userProfileTimeoutSubmit => 'Silenciar miembro';

  @override
  String get userProfileNicknameLabel => 'Apodo';

  @override
  String get userProfileNicknameHint => 'Escribe un apodo';

  @override
  String get userProfileNicknameSave => 'Guardar';

  @override
  String userProfileKickSuccess(String username) {
    return 'Se ha expulsado a $username';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Se ha baneado a $username';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Se ha silenciado a $username';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Se ha eliminado el silencio a $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Apodo actualizado';

  @override
  String get userProfileTransferSuccess => 'Propiedad transferida';

  @override
  String get durationPermanent => 'Permanente';

  @override
  String get duration60Seconds => '60 segundos';

  @override
  String get duration5Minutes => '5 minutos';

  @override
  String get duration10Minutes => '10 minutos';

  @override
  String get duration1Hour => '1 hora';

  @override
  String get duration12Hours => '12 horas';

  @override
  String get duration1Day => '1 día';

  @override
  String get duration3Days => '3 días';

  @override
  String get duration5Days => '5 días';

  @override
  String get duration1Week => '1 semana';

  @override
  String get duration2Weeks => '2 semanas';

  @override
  String get duration1Month => '1 mes';

  @override
  String get durationCustom => 'Personalizado…';

  @override
  String get iarReportUserTitle => 'Reportar usuario';

  @override
  String get iarReasonInappropriateProfile => 'Perfil inapropiado';

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
  String get voiceMessageTitle => 'Mensaje de voz';

  @override
  String get voiceMessageHoldHint =>
      'Mantén presionado para grabar. Desliza hacia arriba para bloquear o suelta para enviar.';

  @override
  String get voiceMessageDiscard => 'Descartar mensaje de voz';

  @override
  String get voiceMessageSend => 'Enviar mensaje de voz';

  @override
  String get voiceMessageMicPermissionDenied =>
      'No se puede iniciar la grabación. Permite el acceso al micrófono.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'La grabación de voz no es compatible con este dispositivo.';

  @override
  String get voiceMessageMicInUse =>
      'Sal de la llamada para enviar un mensaje de voz.';

  @override
  String get voiceMessageRecordingFailed =>
      'Error al grabar. Inténtalo de nuevo.';

  @override
  String get voiceMessageSendFailed =>
      'No se puede enviar el mensaje de voz. Inténtalo de nuevo.';

  @override
  String get voiceMessageRecordingHint =>
      'Habla ahora. Presiona Detener cuando termines; podrás editar el mensaje después.';

  @override
  String get voiceMessageReviewHint =>
      'Arrastra los controladores para recortar, luego presiona Enviar.';

  @override
  String get voiceMessageStop => 'Detener';

  @override
  String get voiceMessageStartRecording => 'Iniciar grabación';

  @override
  String get voiceMessageRerecord => 'Volver a grabar';

  @override
  String get voiceMessagePlay => 'Reproducir';

  @override
  String get voiceMessagePause => 'Pausar';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'La selección debe durar al menos $secondsString segundos.';
  }

  @override
  String get chatAttachmentEditTitle => 'Editar archivo adjunto';

  @override
  String get chatAttachmentFilenameLabel => 'Nombre del archivo';

  @override
  String get chatAttachmentDescriptionLabel => 'Descripción';

  @override
  String get chatAttachmentDescriptionHint => 'Texto alternativo opcional';

  @override
  String get chatAttachmentSpoilerLabel => 'Marcar como spoiler';

  @override
  String get chatAttachmentRemove => 'Eliminar archivo adjunto';

  @override
  String get chatAttachmentDownload => 'Descargar';

  @override
  String get chatAttachmentExpiredTooltip => 'El archivo adjunto ha caducado';

  @override
  String get chatAttachmentSourceGallery => 'Galería';

  @override
  String get chatAttachmentSourceCamera => 'Cámara';

  @override
  String get chatAttachmentSourceBrowse => 'Explorar archivos';

  @override
  String get chatAttachmentPasteTooltip => 'Pegar imagen del portapapeles';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Revelar spoiler';

  @override
  String get matureMediaRevealButton => 'Revelar';

  @override
  String get matureMediaRevealHint => 'Haz clic para revelar';

  @override
  String get matureContentTitle => 'Contenido para adultos';

  @override
  String get matureCommunityTitle => 'Comunidad para adultos';

  @override
  String get matureCategoryTitle => 'Categoría para adultos';

  @override
  String get matureChannelTitle => 'Canal para adultos';

  @override
  String get communityContentWarningTitle =>
      'Advertencia de contenido de la comunidad';

  @override
  String get categoryContentWarningTitle =>
      'Advertencia de contenido de la categoría';

  @override
  String get channelContentWarningTitle => 'Advertencia de contenido del canal';

  @override
  String get defaultContentWarningBody =>
      'Este contenido contiene material sensible.';

  @override
  String get matureCommunityBody =>
      'Esta comunidad está marcada como contenido para adultos y puede incluir material inapropiado para algunos usuarios.';

  @override
  String get matureCategoryBody =>
      'Esta categoría está marcada como contenido para adultos y puede incluir material inapropiado para algunos usuarios.';

  @override
  String get matureChannelBody =>
      'Este canal está marcado como contenido para adultos y puede incluir material inapropiado para algunos usuarios.';

  @override
  String get matureVoiceChannelBody =>
      'Este canal de voz está marcado como contenido para adultos y puede incluir material inapropiado para algunos usuarios.';

  @override
  String get matureLinkChannelBody =>
      'Este canal de enlaces está marcado como contenido para adultos y puede abrir material que podría resultar inapropiado para algunos usuarios.';

  @override
  String get matureCommunityUnavailableBody =>
      'Esta comunidad para adultos no está disponible para tu cuenta.';

  @override
  String get matureCategoryUnavailableBody =>
      'Esta categoría para adultos no está disponible para tu cuenta.';

  @override
  String get matureChannelUnavailableBody =>
      'Este canal para adultos no está disponible para tu cuenta.';

  @override
  String get matureContentProceedButton => 'Continuar';

  @override
  String get matureContentUnderstandButton => 'Ententido';

  @override
  String get matureContentOpenLinkButton => 'Abrir enlace';

  @override
  String get sensitiveContentSectionTitle => 'Contenido sensible';

  @override
  String get sensitiveContentSectionDescription =>
      'Controla cómo se filtra el contenido para adultos o sensible en diferentes contextos';

  @override
  String get sensitiveContentFriendDmLabel => 'Mensajes directos de amigos';

  @override
  String get sensitiveContentNonFriendDmLabel =>
      'Mensajes directos de otros usuarios';

  @override
  String get sensitiveContentGuildLabel =>
      'Mensajes en canales de la comunidad';

  @override
  String get sensitiveContentFilterShow => 'Mostrar';

  @override
  String get sensitiveContentFilterBlur => 'Desenfocar';

  @override
  String get sensitiveContentFilterBlock => 'Bloquear';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Desenfocar archivos multimedia hasta que se complete el análisis de seguridad';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Cuando está activado, las imágenes y videos se desenfocan hasta que finalice el análisis de seguridad del contenido.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Esta configuración está siempre activada en tu cuenta.';

  @override
  String get sensitiveContentResetButton => 'Restablecer';

  @override
  String get sensitiveContentSaveButton => 'Guardar';

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
  String get chatCancelUpload => 'Cancelar subida';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Expira el $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Expira entre el $start y el $end';
  }

  @override
  String get connectionsTitle => 'Conexiones';

  @override
  String get connectionsDescription =>
      'Vincula cuentas y dominios externos a tu perfil de Fluxer. Las conexiones verificadas se mostrarán en tu perfil para que otros las vean.';

  @override
  String get connectionsEmptyTitle => 'Aún no hay conexiones';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Vincula tu cuenta de Bluesky o verifica la propiedad del dominio para mostrarlos en tu perfil.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Verifica la propiedad del dominio para mostrarlo en tu perfil.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Dominio';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Añadir conexión de Bluesky';

  @override
  String get connectionsAddDomainAriaLabel => 'Añadir conexión de dominio';

  @override
  String get connectionEdit => 'Editar';

  @override
  String get connectionRemove => 'Eliminar';

  @override
  String get connectionVerifiedLabel => 'Esta conexión ha sido verificada.';

  @override
  String get connectionUnverifiedLabel =>
      'Esta conexión no ha sido verificada.';

  @override
  String get connectionAddTitle => 'Añadir conexión';

  @override
  String get connectionTypeLabel => 'Tipo de conexión';

  @override
  String get connectionHandleLabel => 'Nombre de usuario';

  @override
  String get connectionDomainLabel => 'Dominio';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'ejemplo.com';

  @override
  String get connectionAlreadyExists => 'Ya tienes esta conexión.';

  @override
  String get connectionConnectBluesky => 'Conectar con Bluesky';

  @override
  String get connectionContinue => 'Continuar';

  @override
  String get connectionVerifyTitle => 'Verificar conexión';

  @override
  String get connectionVerifyInstructions =>
      'Utiliza el registro a continuación para probar la propiedad del dominio.';

  @override
  String get connectionDnsRecordTitle => 'Registro DNS TXT';

  @override
  String get connectionDnsHostLabel => 'Host';

  @override
  String get connectionDnsValueLabel => 'Valor';

  @override
  String get connectionCopyHost => 'Copiar host';

  @override
  String get connectionCopyValue => 'Copiar valor';

  @override
  String get connectionCopied => '¡Copiado!';

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
      'Permitir que cualquiera vea esta conexión en tu perfil';

  @override
  String get connectionVisibilityFriends => 'Amigos';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Permitir que tus amigos vean esta conexión';

  @override
  String get connectionVisibilityCommunityMembers => 'Miembros de la comunidad';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Permitir que los miembros de tus comunidades vean esta conexión';

  @override
  String get connectionRemoveTitle => 'Eliminar conexión';

  @override
  String get connectionRemoveDescription =>
      '¿Estás seguro de que deseas eliminar esta conexión? Esta acción no se puede deshacer.';

  @override
  String get connectionRemoveConfirm => 'Eliminar';

  @override
  String get connectionsLoadError => 'Error al cargar las conexiones';

  @override
  String get connectionsReorderError => 'No se pudo actualizar el orden';

  @override
  String get connectionInitiateFailed =>
      'No se pudo iniciar la verificación. Inténtalo de nuevo.';

  @override
  String get connectionVerifyFailed =>
      'No se pudo verificar. Comprueba tu registro DNS e inténtalo de nuevo.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'No se pudo iniciar la autorización de Bluesky.';

  @override
  String get connectionUpdateFailed => 'No se pudo actualizar la conexión';

  @override
  String get connectionRemoveFailed => 'No se pudo eliminar la conexión';

  @override
  String get connectionTokenSavedToast => 'Verificación de Fluxer guardada';

  @override
  String get connectionTokenSaveFailedToast => 'No se pudo guardar el archivo';

  @override
  String get connectionEnterHandle => 'Ingresa un usuario de Bluesky.';

  @override
  String get connectionEnterDomain => 'Ingresa un dominio.';

  @override
  String get lookAndFeelTitle => 'Apariencia y estilo';

  @override
  String get lookAndFeelThemeSectionTitle => 'Tema';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Escoge el aspecto oscuro, carbón o claro.';

  @override
  String get lookAndFeelThemeDark => 'Tema oscuro';

  @override
  String get lookAndFeelThemeCoal => 'Tema carbón';

  @override
  String get lookAndFeelThemeLight => 'Tema claro';

  @override
  String get lookAndFeelThemeSystem => 'Tema del sistema';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Sincronizar tema en todos los dispositivos';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Cuando está activado, los cambios de tema se sincronizarán en todos tus dispositivos. Cuando está desactivado, este dispositivo usará su propia configuración de tema.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'El tema del sistema desactiva automáticamente la sincronización para seguir la preferencia de tu sistema en este dispositivo.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'No se pudo sincronizar el tema con tu cuenta. Por favor, inténtalo de nuevo.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Tamaño de letra del chat';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Ajusta el tamaño de la fuente en el área de chat.';

  @override
  String get lookAndFeelInterfaceTitle => 'Interfaz';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Personaliza los elementos y el comportamiento de la interfaz.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Indicadores de escritura en la lista de canales';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Elige cómo aparecen los indicadores de escritura en la lista de canales cuando alguien está escribiendo en un canal.';

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
      'Muestra \"Activos ahora\" en la pantalla de inicio para ver amigos que están activos en voz. Verás una vista previa, el contexto del canal, quién está ya allí y una forma rápida de unirte.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Favoritos';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Controla la visibilidad de los favoritos en toda la aplicación.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Habilitar favoritos';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Cuando está activado, puedes marcar canales como favoritos y aparecerán en la sección de Favoritos. Cuando está desactivado, todos los elementos de la interfaz relacionados con los favoritos (botones, opciones de menú) se ocultaran. Tus favoritos existentes se conservarán.';

  @override
  String get favoritesTitle => 'Favoritos';

  @override
  String get favoritesEmptyTitle => 'Aún no tienes favoritos';

  @override
  String get favoritesEmptyDescription =>
      'Marca canales como favoritos desde el encabezado del chat para mantenerlos aquí.';

  @override
  String get favoritesWelcomeTitle => 'Bienvenido a Favoritos';

  @override
  String get favoritesWelcomeDescription =>
      'Tu espacio personal para acceder rápidamente a los canales, mensajes directos y grupos que más te gustan. Presiona la estrella en cualquier canal para añadirlo aquí.';

  @override
  String get favoritesWelcomeTip =>
      '¿No es para ti? Puedes desactivarlo en cualquier momento.';

  @override
  String get favoritesDisableButton => 'Desactivar favoritos';

  @override
  String get favoritesAddedToast => 'Añadido a favoritos';

  @override
  String get favoritesRemovedToast => 'Eliminado de favoritos';

  @override
  String get favoritesHiddenToast => 'Favoritos ocultos';

  @override
  String get favoritesMute => 'Silenciar favoritos';

  @override
  String get favoritesUnmute => 'Reactivar notificaciones de favoritos';

  @override
  String get favoritesHeaderMenu => 'Menú de favoritos';

  @override
  String get favoritesCreateCategory => 'Crear categoría';

  @override
  String get favoritesCategoryNameLabel => 'Nombre de la categoría';

  @override
  String get favoritesHideMutedChannels => 'Ocultar canales silenciados';

  @override
  String get favoritesShowMutedChannels => 'Mostrar canales silenciados';

  @override
  String get favoritesSetNickname => 'Establecer apodo';

  @override
  String get favoritesNicknameLabel => 'Apodo';

  @override
  String get favoritesSaveNickname => 'Guardar apodo';

  @override
  String get favoritesMoveToCategory => 'Mover a categoría';

  @override
  String get favoritesUncategorized => 'Sin categoría';

  @override
  String get favoritesOtherCategory => 'Otros';

  @override
  String get favoritesRemoveFromFavorites => 'Quitar de favoritos';

  @override
  String get favoritesAddToFavorites => 'Añadir a favoritos';

  @override
  String get favoritesHideConfirmTitle => 'Ocultar favoritos';

  @override
  String get favoritesHideConfirmDescription =>
      'Esto ocultará todos los elementos de la interfaz relacionados con favoritos, incluidos los botones y las opciones del menú. Tus favoritos actuales se conservarán y podrás volver a activarlos en cualquier momento desde Ajustes > Avanzado > Apariencia.';

  @override
  String get favoritesDirectMessageSubtitle => 'Mensaje directo';

  @override
  String get messagesMediaDisplayGroupTitle => 'Visualización';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Controla como se muestran los mensajes, archivos multimedia y otros contenidos.';

  @override
  String get messagesMediaMediaGroupTitle => 'Multimedia';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Personaliza los botones y las preferencias de tamaño de los archivos multimedia.';

  @override
  String get messagesMediaInputGroupTitle => 'Entrada';

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
  String get messagesMediaSizeComfortableName => 'Cómodo';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Tamaño de archivos multimedia más grande con más detalles';

  @override
  String get messagesMediaGifsSectionTitle => 'Comportamiento de los GIF';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Controla cómo se insertan los GIF en el chat';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Enviar automáticamente los GIF al seleccionarlos';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Autocompletar expresiones (autocompletar con dos puntos)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Controla qué aparece al autocompletar expresiones cuando escribes dos puntos. Personaliza las sugerencias que se muestran según tus preferencias.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Mostrar emojis predeterminados al autocompletar expresiones';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Mostrar emojis personalizados al autocompletar expresiones';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Mostrar stickers al autocompletar expresiones';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Mostrar archivos multimedia guardados al autocompletar expresiones';

  @override
  String get messagesMediaEditingSectionTitle => 'Edición de mensajes';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Controla que sucede con el borrador de edición cuando cancelas.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Conservar el borrador de edición al cancelar';

  @override
  String get accessibilityUnreadGroupTitle => 'Indicadores de no leídos';

  @override
  String get accessibilityUnreadGroupDescription =>
      'Controla como se muestran los indicadores de mensajes no leídos.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'Mostrar el indicador de no leídos difuminado en canales silenciados';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'Muestra un indicador de no leídos difuminado junto a los canales y mensajes directos silenciados para que puedas ver de un vistazo si hay actividad.';

  @override
  String get voiceConnectionConfirmTitle => 'Confirmación de conexión de voz';

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
  String get voiceParticipantTooltipDesktopDevice =>
      'Dispositivo de escritorio';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Comunidad silenciada';

  @override
  String get voiceParticipantTooltipMuted => 'Silenciado';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Comunidad ensordecida';

  @override
  String get voiceParticipantTooltipDeafened => 'Ensordecido';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Conexión: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count participantes',
      one: '1 participante',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Desconectar';

  @override
  String get voiceControlMute => 'Silenciar';

  @override
  String get voiceControlUnmute => 'Desactivar silencio';

  @override
  String get voiceControlDeafen => 'Ensordecer';

  @override
  String get voiceControlUndeafen => 'Desactivar ensordecimiento';

  @override
  String get voiceControlVideo => 'Activar cámara';

  @override
  String get voiceControlScreenShare => 'Compartir pantalla';

  @override
  String get voiceScreenShareNotificationText => 'Compartiendo tu pantalla.';

  @override
  String get voiceControlMore => 'Más';

  @override
  String get voiceControlDisconnect => 'Desconectar';

  @override
  String get voiceControlChat => 'Chat';

  @override
  String get voiceTextChatShow => 'Mostrar chat';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# mensajes sin leer',
      one: '# mensaje sin leer',
    );
    return 'Mostrar chat con $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Necesitas permitir el acceso a la cámara para el video.';

  @override
  String get voiceErrorScreenShareToggle =>
      'No se pudo compartir pantalla. Inténtalo de nuevo.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Se denegó el permiso para compartir pantalla.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'La transmisión de pantalla no está disponible en este dispositivo.';

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
  String get notificationsMentionIncludeRoles => 'Incluir mención de roles';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Incluir todas las menciones de la comunidad';

  @override
  String get notificationsNoUnreadTitle => 'No hay mensajes sin leer';

  @override
  String get notificationsNoUnreadBody => 'Estás al día.';

  @override
  String get notificationsNoMentionsTitle => 'No hay menciones recientes';

  @override
  String get notificationsNoMentionsBody =>
      'Todas las menciones con @ aparecerán aquí por 7 días.';

  @override
  String get notificationsMentionsEndTitle => 'Has llegado al final';

  @override
  String get notificationsMentionsEndBody =>
      'Has visto todas tus menciones recientes. No te preocupes, pronto aparecerán más aquí.';

  @override
  String get notificationsJump => 'Ir a';

  @override
  String get notificationsRemoveMentionTooltip => 'Quitar mención';

  @override
  String get notificationsViewAllUnread => 'Ver mensajes sin leer';

  @override
  String get notificationsMarkAsRead => 'Marcar como leído';

  @override
  String get notificationsExpand => 'Ver más';

  @override
  String get notificationsCollapse => 'Ver menos';

  @override
  String get notificationsMessageUnavailable =>
      'No se pudo cargar este mensaje.';

  @override
  String characterCounterRemaining(int remaining) {
    return 'Quedan $remaining caracteres';
  }

  @override
  String get characterCounterTooLong => 'El mensaje es demasiado largo';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return 'Quedan $remaining caracteres. Consigue $productName para escribir hasta $premiumMaxLength caracteres.';
  }

  @override
  String get chatMessageFailedToSend => 'Error al enviar el mensaje';

  @override
  String get chatMessageDeleteFailed => 'Eliminar mensaje fallido';

  @override
  String get chatMessageAddReaction => 'Añadir reacción';

  @override
  String get chatMessageEdit => 'Editar mensaje';

  @override
  String get chatMessageReply => 'Responder';

  @override
  String get chatMessageForward => 'Reenviar';

  @override
  String get forwardMessageTitle => 'Reenviar mensaje';

  @override
  String get forwardSearchHint => 'Buscar canales o chats';

  @override
  String get forwardDirectMessagesSection => 'Mensajes directos';

  @override
  String get forwardCommentHint => 'Añadir un comentario (opcional)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Enviar ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'No se encontraron canales';

  @override
  String get forwardSuccessToast => 'Mensaje reenviado';

  @override
  String get forwardFailed => 'Error al reenviar mensaje';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Los comentarios no están disponibles porque el canal seleccionado tiene modo lento activado.';

  @override
  String get forwardDestinationNoSendPermission =>
      'No puedes enviar mensajes aquí';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'No puedes incluir enlaces aquí';

  @override
  String get forwardDestinationNoAttachPermission =>
      'No puedes adjuntar archivos aquí';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'El envío de mensajes está desactivado en esta comunidad';

  @override
  String get forwardDestinationTimedOut =>
      'Estás en aislamiento en esta comunidad';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Modo lento: espera $remaining';
  }

  @override
  String get chatMessageCopyText => 'Copiar mensaje';

  @override
  String get chatMessagePin => 'Fijar mensaje';

  @override
  String get chatMessageUnpin => 'Desfijar mensaje';

  @override
  String get chatMessageBookmark => 'Marcar mensaje';

  @override
  String get chatMessageRemoveBookmark => 'Eliminar marcador';

  @override
  String get chatMessageMarkAsUnread => 'Marcar como no leído';

  @override
  String get chatMessageCopyMessageLink => 'Copiar enlace del mensaje';

  @override
  String get chatMessageCopyMessageId => 'Copiar ID del mensaje';

  @override
  String get chatMessageViewReactions => 'Ver reacciones';

  @override
  String get chatMessageRemoveAllReactions => 'Eliminar todas las reacciones';

  @override
  String get chatMessageDebug => 'Depurar mensaje';

  @override
  String get chatMessageDebugSheetTitle => 'Depurar mensaje';

  @override
  String get chatMessageDebugCopyJson => 'Copiar JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'JSON del mensaje copiado al portapapeles';

  @override
  String get chatReactionsSheetTitle => 'Reacciones';

  @override
  String get chatReactionsSheetEmpty => 'Nadie ha reaccionado a esto todavía.';

  @override
  String get chatMessageReport => 'Reportar mensaje';

  @override
  String get iarReportMessageTitle => 'Reportar mensaje';

  @override
  String get iarThisUserFallback => 'Este usuario';

  @override
  String get iarModalDescription =>
      'Reportar una infracción a las reglas o encontrar herramientas para gestionar el contacto y las preferencias.';

  @override
  String get iarPathStepAriaLabel => '¿Que necesitas?';

  @override
  String get iarCategoryStepTitle => '¿Qué clase de regla se infringió?';

  @override
  String get iarReasonStepTitle => '¿Qué regla se infringió?';

  @override
  String get iarReasonSelectHint => 'Selecciona un motivo';

  @override
  String get iarPickAnOptionToast => 'Elige una opción para continuar.';

  @override
  String get iarPickARuleToast => 'Elige la regla que se infringió.';

  @override
  String get iarPathPlatform =>
      'Reporta una infracción a las reglas de la plataforma';

  @override
  String get iarPathCommunity => 'Reportar a los moderadores de esta comunidad';

  @override
  String get iarPathPreferenceMessage => 'No me gusta este contenido';

  @override
  String get iarCategoryTargetedHarmLabel => 'Amenazas, acoso o daño';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Bullying, amenazas, odio, violencia, raids o contenido que promueva la autolesión.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Seguridad infantil o material explicito';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Menores en riesgo, contenido explícito en el lugar equivocado o conducta no deseada.';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'Privacidad o suplantación de identidad';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxxing, acecho, hacerse pasar por alguien o un perfil inapropiado.';

  @override
  String get iarCategoryDeceptionLabel => 'Estafas, malware o desinformación';

  @override
  String get iarCategoryDeceptionDescription =>
      'Phishing, fraude, enlaces maliciosos o afirmaciones falsas que puedan causar daños en el mundo real.';

  @override
  String get iarCategoryIllegalOtherLabel => 'Actividad ilegal u otro motivo';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Ventas ilegales, facilitación de actividades criminales o una infracción clara de las reglas que no encaje en las categorías anteriores.';

  @override
  String get iarReasonHarassmentLabel => 'Acoso o amenazas';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Bullying, contacto no deseado repetido, acecho o abuso dirigido.';

  @override
  String get iarReasonHateLabel => 'Discurso de odio';

  @override
  String get iarReasonHateMessageDescription =>
      'Insultos, lenguaje denigrante o ataques a grupos protegidos.';

  @override
  String get iarReasonViolenceLabel => 'Violencia o amenazas violentas';

  @override
  String get iarReasonViolenceDescription =>
      'Amenazas creíbles, violencia gráfica o apología de la violencia.';

  @override
  String get iarReasonMatureContentLabel => 'Contenido para adultos o acoso';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Conducta inapropiada o contenido explícito fuera de lugar.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Seguridad infantil o explotación de menores';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Grooming o contenido de explotación infantil.';

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
  String get chatReplyMentionOn => 'Activado';

  @override
  String get chatReplyMentionOff => 'Desactivado';

  @override
  String get chatReplyCancel => 'Cancelar respuesta';

  @override
  String get chatEditMessageHint => 'Editar mensaje';

  @override
  String get chatEditNoChanges => 'No hay cambios que guardar';

  @override
  String get chatChannelNotReady =>
      'Este canal aún no esta listo. Inténtalo de nuevo en un momento.';

  @override
  String get chatMessageEdited => '(Editado)';

  @override
  String get chatMessageSilent => 'This was a @silent message.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Hoy a las $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Ayer a las $time';
  }

  @override
  String get mediaViewerImagePreview => 'Vista previa de imagen';

  @override
  String get mediaViewerClose => 'Cerrar visor de archivos adjuntos';

  @override
  String get mediaViewerOpenInBrowser => 'Abrir en el navegador';

  @override
  String get mediaViewerForward => 'Reenviar';

  @override
  String get mediaViewerZoomIn => 'Ampliar';

  @override
  String get mediaViewerZoomOut => 'Alejar';

  @override
  String get mediaViewerPreviousAttachment => 'Archivo adjunto anterior';

  @override
  String get mediaViewerNextAttachment => 'Siguiente archivo adjunto';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String get chatAttachmentVideoToggleControls => 'Alternar controles de video';

  @override
  String get chatAttachmentVideoMute => 'Silenciar video';

  @override
  String get chatAttachmentVideoUnmute => 'Reactivar sonido del video';

  @override
  String get chatAttachmentVideoPlay => 'Reproducir video';

  @override
  String get chatAttachmentVideoPause => 'Pausar video';

  @override
  String get chatAttachmentVideoProgress => 'Progreso del video';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Notificar a los usuarios con este rol que tienen permiso para ver este canal.';

  @override
  String get addGuildModalTitle => 'Añadir comunidad';

  @override
  String get addGuildModalLandingDescription =>
      'Crear una nueva comunidad o unirse a una existente.';

  @override
  String get addGuildCreateCommunity => 'Crear comunidad';

  @override
  String get addGuildJoinCommunity => 'Unirse a la comunidad';

  @override
  String get addGuildImportDiscordTemplate => 'Importar plantilla de Discord';

  @override
  String get addGuildJoinTitle => 'Unirse a una comunidad';

  @override
  String get addGuildJoinDescription =>
      'Introduce el enlace de invitación para unirte a la comunidad.';

  @override
  String get addGuildInviteLinkLabel => 'Enlace de invitación';

  @override
  String get addGuildJoinSubmit => 'Unirse a la comunidad';

  @override
  String get addGuildInviteInvalid =>
      'Esta invitación no es validad o ha caducado.';

  @override
  String get addGuildJoinFailed =>
      'No se pudo unir a la comunidad. Por favor, inténtalo de nuevo.';

  @override
  String get addGuildPackInstalled =>
      'El paquete se ha instalado correctamente.';

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
  String get advancedPerformanceReportingTitle => 'Informes de rendimiento';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Ayuda a mejorar Fluxer compartiendo datos anónimos sobre errores y rendimiento.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Enviar informes de errores y rendimiento';

  @override
  String get advancedPerformanceReportingDescription =>
      'Todos los datos reportados son anónimos y se envían únicamente al servicio de monitoreo de Fluxer; no se utilizan proveedores externos.';

  @override
  String get userSettingsNavApplications => 'Aplicaciones';

  @override
  String get userSettingsNavAppLogs => 'Registros de la aplicación';

  @override
  String get userSettingsNavDeveloperTools => 'Herramientas de desarrollador';

  @override
  String get userSettingsNavLimitsConfig => 'Configuración de límites';

  @override
  String get userSettingsNavFeatureFlags => 'Indicadores de funciones';

  @override
  String get userSettingsNavWhatsNew => 'Novedades';

  @override
  String get userSettingsNavLogOut => 'Cerrar sesión';

  @override
  String get betaWarningTitle => 'Software en versión beta';

  @override
  String get betaWarningMessage =>
      'Este software está en versión beta. No todo está terminado o añadido todavía.';

  @override
  String get betaWarningReportIssues =>
      'Por favor, informa de cualquier problema que encuentres a la comunidad de Fluxer Mobile (debes tener Plutonium para poder unirte a la comunidad actualmente).';

  @override
  String get betaWarningRepoLink => 'Ver código fuente en GitHub';

  @override
  String get betaWarningGotIt => 'Entendido';

  @override
  String get quickSwitcherTabSearch => 'Buscar';

  @override
  String get quickSwitcherTabFriends => 'Amigos';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Buscar canales, personas o comunidades';

  @override
  String get quickSwitcherSearchFriends => 'Buscar amigos';

  @override
  String get quickSwitcherNoMatchesFound => 'No se encontraron coincidencias';

  @override
  String get quickSwitcherEmptyHint =>
      'Intenta con otro nombre o utiliza los prefijos @ / # / ! / * para filtrar los resultados.';

  @override
  String get quickSwitcherSectionPeople => 'Personas';

  @override
  String get quickSwitcherSectionGroupMessages => 'Mensajes grupales';

  @override
  String get quickSwitcherSectionTextChannels => 'Canales de texto';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Canales de voz';

  @override
  String get quickSwitcherSectionCommunities => 'Comunidades';

  @override
  String get quickSwitcherSectionSettings => 'Ajustes';

  @override
  String get quickSwitcherHomeLabel => 'Inicio';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Mensajes directos';

  @override
  String get quickSwitcherFavoritesLabel => 'Favoritos';

  @override
  String get quickSwitcherUserSettingsLabel => 'Ajustes de usuario';

  @override
  String get quickSwitcherNotificationsLabel => 'Notificaciones';

  @override
  String get quickSwitcherBookmarksLabel => 'Marcadores';

  @override
  String get quickSwitcherMentionsLabel => 'Menciones';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Aún no tienes amigos';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Agrega a un amigo para empezar.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'No hay amigos que coincidan con esa búsqueda';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Prueba con otro nombre.';

  @override
  String get quickSwitcherSearchAliasUser => 'Usuario';

  @override
  String get quickSwitcherSearchAliasYou => 'Tú';

  @override
  String get quickSwitcherSearchAliasDm => 'Chat';

  @override
  String get quickSwitcherSearchAliasDms => 'Chats';

  @override
  String get quickSwitcherSearchAliasMessages => 'Mensajes';

  @override
  String get quickSwitcherSearchAliasFav => 'Fav';

  @override
  String get quickSwitcherSearchAliasStarred => 'Destacado';

  @override
  String get quickSwitcherSearchAliasInbox => 'Bandeja de entrada';

  @override
  String get quickSwitcherSearchAliasSaved => 'Guardado';

  @override
  String get uiClose => 'Cerrar';

  @override
  String get chatJumpToBottom => 'Jump to bottom';

  @override
  String get uiConfirm => 'Confirmar';

  @override
  String get uiLoading => 'Cargando';

  @override
  String get uiUnsavedChanges => 'Cambios sin guardar';

  @override
  String get uiReset => 'Restablecer';

  @override
  String get uiOpenColorPicker => 'Abrir selector de color';

  @override
  String get uiSelectPlaceholder => 'Seleccionar';

  @override
  String get uiSearchPlaceholder => 'Buscar';

  @override
  String get uiNoOptionsFound => 'No se encontraron opciones';

  @override
  String get uiDismissNotification => 'Descartar notificación';

  @override
  String get uiColorPickerTitle => 'Selector de color';

  @override
  String get mentionConfirmTitle => 'Mencionar a todos';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Esto notificará a $count miembros. ¿Continuar?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Esto notificará a $count miembros conectados. ¿Continuar?';
  }

  @override
  String get mentionConfirmButton => 'Mencionar';

  @override
  String get composerEmojiUnavailable => 'No puedes usar ese emoji aquí.';

  @override
  String get instanceUrlLabel => 'URL de la instancia';

  @override
  String get instanceUrlPlaceholder =>
      'Introduce la URL de la instancia (ej. fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Restablecer a Fluxer';

  @override
  String get instanceConnect => 'Conectar';

  @override
  String get instanceConnecting => 'Conectando…';

  @override
  String get instanceConnectFailed => 'No se pudo conectar a la instancia';

  @override
  String get recentInstances => 'Instancias recientes';

  @override
  String removeRecentInstance(String domain) {
    return 'Eliminar $domain de las instancias recientes';
  }

  @override
  String get instanceSheetTitle => 'Conectarse a la instancia';

  @override
  String get connectToDifferentInstance =>
      'Conectarse a una instancia diferente';

  @override
  String get changeInstance => 'Cambiar';

  @override
  String get instanceConnectionRequired =>
      'Conecta a la instancia para iniciar sesión';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get guildNavbarDirectMessages => 'Direct Messages';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Explore Discoverable Communities';

  @override
  String get guildNavbarAddCommunity => 'Add a Community';

  @override
  String get guildNavbarHelp => 'Help';

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
  String get guildSettingsDiscoveryFormTitle => 'Application';

  @override
  String get guildSettingsDiscoveryStatusTitle => 'Status';

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
  String get guildSettingsUnban => 'Unban';

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
  String get guildSettingsWebhooksInfo =>
      'Create webhooks from Channel settings. Edit them here.';

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
  String get guildSettingsMembersSortNewest => 'Newest first';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filter by user';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filter by action';
}
