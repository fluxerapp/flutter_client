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
  String get userTagBot => 'BOT';

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
  String get securityPhoneSectionDescription =>
      'Manage your phone number for SMS two-factor authentication';

  @override
  String get securityPhoneLabel => 'Phone Number';

  @override
  String get securityPhoneNone =>
      'Add a phone number to enable SMS two-factor authentication';

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
  String get securityPhoneRemoveWarning =>
      'This will also disable SMS two-factor authentication.';

  @override
  String get securityPhoneRemoved => 'Phone number removed';

  @override
  String get securitySmsSectionTitle => 'SMS Two-Factor Authentication';

  @override
  String get securitySmsSectionDescription =>
      'Receive verification codes via SMS as a backup authentication method';

  @override
  String get securitySmsBackup => 'SMS Backup';

  @override
  String get securitySmsEnabled => 'SMS two-factor authentication is enabled';

  @override
  String get securitySmsDisabled =>
      'Enable SMS codes as a backup for your authenticator app';

  @override
  String get securitySmsEnableTitle => 'Enable SMS Two-Factor Authentication';

  @override
  String get securitySmsEnableDescription =>
      'SMS two-factor authentication adds an additional layer of security by requiring a verification code sent to your phone number when signing in.';

  @override
  String get securitySmsDisableTitle => 'Disable SMS Two-Factor Authentication';

  @override
  String get securitySmsDisableDescription =>
      'Are you sure you want to disable SMS two-factor authentication? This will make your account less secure.';

  @override
  String get securitySmsDisabledForPartners =>
      'SMS backup is disabled for partners';

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
  String get userProfileEditProfile => 'Edit Profile';

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
  String get typingIndicatorMultiple => 'Multiple people are typing...';

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
      'You do not have permission to send messages';

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
  String get voiceControlMore => 'More';

  @override
  String get voiceControlDisconnect => 'Disconnect';

  @override
  String get voiceCameraPermissionRequired =>
      'Camera permission is required for video.';

  @override
  String get voiceWatchStream => 'Watch Stream';

  @override
  String get voiceStopWatching => 'Stop Watching';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Stop watching the current stream';

  @override
  String get voiceLiveBadge => 'Live';
}
