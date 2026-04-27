import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'fluxer_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of FluxerLocalizations
/// returned by `FluxerLocalizations.of(context)`.
///
/// Applications need to include `FluxerLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/fluxer_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: FluxerLocalizations.localizationsDelegates,
///   supportedLocales: FluxerLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the FluxerLocalizations.supportedLocales
/// property.
abstract class FluxerLocalizations {
  FluxerLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static FluxerLocalizations of(BuildContext context) {
    return Localizations.of<FluxerLocalizations>(context, FluxerLocalizations)!;
  }

  static const LocalizationsDelegate<FluxerLocalizations> delegate =
      _FluxerLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// Title on the reconnecting / server error screen.
  ///
  /// In en, this message translates to:
  /// **'We fluxed up!'**
  String get reconnectingTitle;

  /// Subtitle on the reconnecting screen explaining temporary server issues.
  ///
  /// In en, this message translates to:
  /// **'Something is wrong with the servers.\nShould be fixed in a second!'**
  String get reconnectingBody;

  /// Error message on the splash screen when app startup fails.
  ///
  /// In en, this message translates to:
  /// **'Failed to start: {error}'**
  String splashStartupFailed(String error);

  /// Generic label for retry actions (splash, errors, network, etc.).
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Connecting text on the splash screen
  ///
  /// In en, this message translates to:
  /// **'CONNECTING'**
  String get connectingCaps;

  /// Greeting on the login screen; usable wherever returning users are welcomed.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get welcomeBack;

  /// Generic label for an email field.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Error shown when the email field contains an invalid email format.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address.'**
  String get emailInvalid;

  /// Generic label for a password field.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Link or button to start password recovery.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get forgotPassword;

  /// Primary login submit action.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get logIn;

  /// Secondary login using a passkey.
  ///
  /// In en, this message translates to:
  /// **'Log in with a passkey'**
  String get logInWithPasskey;

  /// Secondary login that opens or uses the system browser.
  ///
  /// In en, this message translates to:
  /// **'Log in via browser'**
  String get logInViaBrowser;

  /// Lead text before a register link; trailing space keeps spacing before the link.
  ///
  /// In en, this message translates to:
  /// **'Need an account? '**
  String get needAccountPrompt;

  /// Generic label to create a new account.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// Divider between alternative actions (e.g. email login vs SSO).
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get orDivider;

  /// Title for the captcha verification modal.
  ///
  /// In en, this message translates to:
  /// **'Verify you\'re human'**
  String get captchaTitle;

  /// Explanatory text in the captcha modal body.
  ///
  /// In en, this message translates to:
  /// **'We need to make sure you\'re not a bot. Please complete the verification below.'**
  String get captchaDescription;

  /// Link to switch from Turnstile to hCaptcha provider.
  ///
  /// In en, this message translates to:
  /// **'Having issues? Try hCaptcha instead'**
  String get captchaSwitchToHcaptcha;

  /// Link to switch from hCaptcha to Turnstile provider.
  ///
  /// In en, this message translates to:
  /// **'Try Turnstile instead'**
  String get captchaSwitchToTurnstile;

  /// Generic cancel button label.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Title when IP authorization email has been sent.
  ///
  /// In en, this message translates to:
  /// **'Check your email'**
  String get ipAuthCheckEmail;

  /// Description telling the user to check their email for IP auth.
  ///
  /// In en, this message translates to:
  /// **'We emailed a link to authorize this login. Please open your inbox for {email}.'**
  String ipAuthDescription(String email);

  /// Title when polling for IP authorization fails.
  ///
  /// In en, this message translates to:
  /// **'Connection lost'**
  String get ipAuthConnectionLost;

  /// Description when IP authorization polling fails.
  ///
  /// In en, this message translates to:
  /// **'We lost the connection while waiting for authorization. Please try again.'**
  String get ipAuthConnectionLostDescription;

  /// Button to resend the IP authorization email.
  ///
  /// In en, this message translates to:
  /// **'Resend email'**
  String get ipAuthResendEmail;

  /// Button label after IP authorization email has been resent.
  ///
  /// In en, this message translates to:
  /// **'Resent'**
  String get ipAuthResent;

  /// Countdown suffix for the resend button cooldown.
  ///
  /// In en, this message translates to:
  /// **'{seconds}s'**
  String ipAuthResendCountdown(int seconds);

  /// Generic back button label.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// Title for the MFA challenge screen.
  ///
  /// In en, this message translates to:
  /// **'Two-factor authentication'**
  String get mfaTitle;

  /// Description text when multiple MFA methods are available.
  ///
  /// In en, this message translates to:
  /// **'Choose a verification method'**
  String get mfaChooseMethod;

  /// Label for the TOTP authenticator method.
  ///
  /// In en, this message translates to:
  /// **'Authenticator App'**
  String get mfaMethodTotp;

  /// Label for the SMS code method.
  ///
  /// In en, this message translates to:
  /// **'SMS Code'**
  String get mfaMethodSms;

  /// Label for the WebAuthn security key method.
  ///
  /// In en, this message translates to:
  /// **'Security Key / Passkey'**
  String get mfaMethodWebauthn;

  /// Description for the TOTP code entry screen.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code from your authenticator app or one of your backup codes.'**
  String get mfaTotpDescription;

  /// Description for the SMS code entry screen.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code sent to your phone.'**
  String get mfaSmsDescription;

  /// Button label to send an SMS verification code.
  ///
  /// In en, this message translates to:
  /// **'Send SMS Code'**
  String get mfaSendSmsCode;

  /// Label for the MFA code input field.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get mfaCodeLabel;

  /// Link to switch to a different MFA method.
  ///
  /// In en, this message translates to:
  /// **'Try another method'**
  String get mfaTryAnotherMethod;

  /// Link to switch to WebAuthn from code entry.
  ///
  /// In en, this message translates to:
  /// **'Try security key / passkey instead'**
  String get mfaUseSecurityKey;

  /// Title for the account selector on the login screen.
  ///
  /// In en, this message translates to:
  /// **'Choose an account'**
  String get accountSelectorTitle;

  /// Description for the account selector.
  ///
  /// In en, this message translates to:
  /// **'Select an account to continue, or add a different one.'**
  String get accountSelectorDescription;

  /// Button to add a new account.
  ///
  /// In en, this message translates to:
  /// **'Add an account'**
  String get accountAdd;

  /// Context menu option to remove a stored account.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get accountRemove;

  /// Title for the remove account confirmation modal.
  ///
  /// In en, this message translates to:
  /// **'Remove {username}'**
  String accountRemoveTitle(String username);

  /// Description for the remove account confirmation modal.
  ///
  /// In en, this message translates to:
  /// **'This will remove the saved session for this account.'**
  String get accountRemoveDescription;

  /// Description when removing the last stored account.
  ///
  /// In en, this message translates to:
  /// **'This will remove the only saved account on this device.'**
  String get accountRemoveOnlyDescription;

  /// Label shown on accounts with expired sessions.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get accountExpired;

  /// Message when selecting an expired account.
  ///
  /// In en, this message translates to:
  /// **'Session expired for {identifier}. Please log in again.'**
  String accountSessionExpired(String identifier);

  /// Badge shown on the currently active account.
  ///
  /// In en, this message translates to:
  /// **'Active account'**
  String get accountActive;

  /// Context menu option to sign out of current account.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOut;

  /// Title when account is permanently banned.
  ///
  /// In en, this message translates to:
  /// **'Account Permanently Suspended'**
  String get suspendedPermanentTitle;

  /// Title when account is temporarily suspended.
  ///
  /// In en, this message translates to:
  /// **'Account Suspended'**
  String get suspendedTemporaryTitle;

  /// Description for permanent suspension.
  ///
  /// In en, this message translates to:
  /// **'Your account has been permanently suspended for violating our Terms of Service.'**
  String get suspendedPermanentDescription;

  /// Description for temporary suspension.
  ///
  /// In en, this message translates to:
  /// **'Your account has been temporarily suspended. You will be able to access your account once the suspension period ends.'**
  String get suspendedTemporaryDescription;

  /// Label for when the ban was issued.
  ///
  /// In en, this message translates to:
  /// **'Issued'**
  String get suspendedIssuedAt;

  /// Label for when a temporary ban ends.
  ///
  /// In en, this message translates to:
  /// **'Ends'**
  String get suspendedEndsAt;

  /// Label for ban duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get suspendedDuration;

  /// Value shown for permanent ban duration.
  ///
  /// In en, this message translates to:
  /// **'Permanent'**
  String get suspendedPermanent;

  /// Label for ban reason.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get suspendedReason;

  /// Label for appeal deadline date.
  ///
  /// In en, this message translates to:
  /// **'Appeal Deadline'**
  String get suspendedAppealDeadline;

  /// Warning about scheduled account deletion.
  ///
  /// In en, this message translates to:
  /// **'Your account is scheduled for deletion on {date}.'**
  String suspendedDeletionWarning(String date);

  /// Button to recheck ban status.
  ///
  /// In en, this message translates to:
  /// **'Check for Updates'**
  String get suspendedRecheck;

  /// Recheck button with cooldown timer.
  ///
  /// In en, this message translates to:
  /// **'Check again in {seconds}s'**
  String suspendedRecheckCooldown(int seconds);

  /// Button to return to login screen.
  ///
  /// In en, this message translates to:
  /// **'Back to Login'**
  String get suspendedBackToLogin;

  /// Title for the appeal section.
  ///
  /// In en, this message translates to:
  /// **'Appeal'**
  String get suspendedAppealTitle;

  /// Placeholder text for the appeal textarea.
  ///
  /// In en, this message translates to:
  /// **'Explain why your suspension should be reconsidered (minimum 50 characters)...'**
  String get suspendedAppealHint;

  /// Button to submit an appeal.
  ///
  /// In en, this message translates to:
  /// **'Submit Appeal'**
  String get suspendedAppealSubmit;

  /// Badge for appeal with pending status.
  ///
  /// In en, this message translates to:
  /// **'Pending Review'**
  String get suspendedAppealPending;

  /// Badge for accepted appeal.
  ///
  /// In en, this message translates to:
  /// **'Appeal Accepted'**
  String get suspendedAppealAccepted;

  /// Badge for rejected appeal.
  ///
  /// In en, this message translates to:
  /// **'Appeal Rejected'**
  String get suspendedAppealRejected;

  /// Message when appeal is accepted.
  ///
  /// In en, this message translates to:
  /// **'Your appeal has been accepted and your account has been reinstated.'**
  String get suspendedAppealAcceptedDescription;

  /// Button to sign in after appeal is accepted.
  ///
  /// In en, this message translates to:
  /// **'Sign In to Your Account'**
  String get suspendedSignIn;

  /// Title for the forgot password screen.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get forgotPasswordTitle;

  /// Description for the forgot password screen.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address and we\'ll send you a link to reset your password.'**
  String get forgotPasswordDescription;

  /// Button to submit the forgot password form.
  ///
  /// In en, this message translates to:
  /// **'Send reset link'**
  String get forgotPasswordSubmit;

  /// Title after forgot password email is sent.
  ///
  /// In en, this message translates to:
  /// **'Check your email'**
  String get forgotPasswordSentTitle;

  /// Description after forgot password email is sent.
  ///
  /// In en, this message translates to:
  /// **'We\'ve sent password reset instructions to your email address. Please check your inbox and follow the link to reset your password.'**
  String get forgotPasswordSentDescription;

  /// Link to go back to login from forgot password.
  ///
  /// In en, this message translates to:
  /// **'Return to login'**
  String get forgotPasswordBackToLogin;

  /// Title for the reset password screen.
  ///
  /// In en, this message translates to:
  /// **'Set new password'**
  String get resetPasswordTitle;

  /// Description for the reset password screen.
  ///
  /// In en, this message translates to:
  /// **'Enter your new password below to complete the reset process.'**
  String get resetPasswordDescription;

  /// Label for the new password field.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get resetPasswordNewPassword;

  /// Label for the confirm password field.
  ///
  /// In en, this message translates to:
  /// **'Confirm new password'**
  String get resetPasswordConfirm;

  /// Button to submit the password reset form.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetPasswordSubmit;

  /// Error when password and confirmation don't match.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match.'**
  String get resetPasswordMismatch;

  /// Title for the registration screen.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get registerTitle;

  /// Label for the display name field.
  ///
  /// In en, this message translates to:
  /// **'Display Name (Optional)'**
  String get registerDisplayName;

  /// Hint for the display name field.
  ///
  /// In en, this message translates to:
  /// **'What should people call you?'**
  String get registerDisplayNameHint;

  /// Label for the username field.
  ///
  /// In en, this message translates to:
  /// **'Username (Optional)'**
  String get registerUsername;

  /// Hint for the username field.
  ///
  /// In en, this message translates to:
  /// **'Leave blank for a random username'**
  String get registerUsernameHint;

  /// Helper text shown below the username field explaining automatic tag generation.
  ///
  /// In en, this message translates to:
  /// **'A 4-digit tag will be added automatically to ensure uniqueness'**
  String get registerUsernameTagHint;

  /// Label for the date of birth field.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get registerDateOfBirth;

  /// Placeholder for the month select.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get registerMonth;

  /// Placeholder for the day select.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get registerDay;

  /// Placeholder for the year select.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get registerYear;

  /// Consent checkbox label for registration (plain text fallback).
  ///
  /// In en, this message translates to:
  /// **'I agree to the Terms of Service and Privacy Policy'**
  String get registerConsent;

  /// Text before the Terms of Service link in the consent checkbox.
  ///
  /// In en, this message translates to:
  /// **'I agree to the '**
  String get registerConsentPrefix;

  /// Terms of Service link text in the consent checkbox.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get registerConsentTerms;

  /// Conjunction between Terms and Privacy links.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get registerConsentAnd;

  /// Privacy Policy link text in the consent checkbox.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get registerConsentPrivacy;

  /// Label for the confirm password field on the register screen.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get registerConfirmPassword;

  /// Button to submit the registration form.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get registerSubmit;

  /// Text before the login link on the register screen.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get registerHaveAccount;

  /// Error when user has no passkeys registered and tries passkey login.
  ///
  /// In en, this message translates to:
  /// **'No passkeys found for this app. Log in with email and password instead.'**
  String get passkeyNoCredentials;

  /// Error when device does not support passkeys.
  ///
  /// In en, this message translates to:
  /// **'Passkeys are not supported on this device.'**
  String get passkeyDeviceNotSupported;

  /// Error when passkey domain association is missing.
  ///
  /// In en, this message translates to:
  /// **'Passkeys are not configured for this app. Log in with email and password instead.'**
  String get passkeyDomainNotAssociated;

  /// Error when passkey authentication times out.
  ///
  /// In en, this message translates to:
  /// **'Passkey authentication timed out. Please try again.'**
  String get passkeyTimeout;

  /// Error for unknown passkey provider errors (e.g. TYPE_UNKNOWN).
  ///
  /// In en, this message translates to:
  /// **'Passkeys are not available for this app. Log in with email and password instead.'**
  String get passkeyNotAvailable;

  /// Generic fallback error for passkey authentication.
  ///
  /// In en, this message translates to:
  /// **'Passkey authentication failed. Please try again.'**
  String get passkeyFailed;

  /// Generic fallback error when registration fails unexpectedly.
  ///
  /// In en, this message translates to:
  /// **'Unable to create account. Please try again.'**
  String get errorUnableToCreateAccount;

  /// Generic fallback error when login fails unexpectedly.
  ///
  /// In en, this message translates to:
  /// **'Unable to sign in right now. Please try again.'**
  String get errorUnableToSignIn;

  /// Generic fallback error when forgot password request fails.
  ///
  /// In en, this message translates to:
  /// **'Unable to send reset link. Please try again.'**
  String get errorUnableToSendResetLink;

  /// Generic fallback error when password reset fails unexpectedly.
  ///
  /// In en, this message translates to:
  /// **'Unable to reset password. Please try again.'**
  String get errorUnableToResetPassword;

  /// Button to join a guild from an invite embed card.
  ///
  /// In en, this message translates to:
  /// **'Join Community'**
  String get embedInviteJoin;

  /// Button when user is already a member of the guild.
  ///
  /// In en, this message translates to:
  /// **'Go to Community'**
  String get embedInviteGoTo;

  /// Online member count on the invite embed card.
  ///
  /// In en, this message translates to:
  /// **'{count} Online'**
  String embedInviteOnline(String count);

  /// Total member count on the invite embed card.
  ///
  /// In en, this message translates to:
  /// **'{count} Members'**
  String embedInviteMembers(String count);

  /// Title when an invite is expired or invalid.
  ///
  /// In en, this message translates to:
  /// **'Unknown Invite'**
  String get embedInviteUnknownTitle;

  /// Subtitle when an invite is expired or invalid.
  ///
  /// In en, this message translates to:
  /// **'Try asking for a new invite.'**
  String get embedInviteUnknownSubtitle;

  /// Disabled button label when an invite is unavailable.
  ///
  /// In en, this message translates to:
  /// **'Invite Unavailable'**
  String get embedInviteUnavailable;

  /// Fallback name shown in a channel mention pill when the channel is not found.
  ///
  /// In en, this message translates to:
  /// **'unknown-channel'**
  String get mentionUnknownChannel;

  /// Title of the modal shown when clicking a jump link to an inaccessible channel.
  ///
  /// In en, this message translates to:
  /// **'Channel Access Denied'**
  String get channelAccessDeniedTitle;

  /// Body of the channel access denied modal.
  ///
  /// In en, this message translates to:
  /// **'You do not have access to the channel where this message was sent.'**
  String get channelAccessDeniedDescription;

  /// Generic confirmation button label.
  ///
  /// In en, this message translates to:
  /// **'Okay'**
  String get okay;

  /// Title on the theme embed card in chat.
  ///
  /// In en, this message translates to:
  /// **'Shared theme'**
  String get embedThemeTitle;

  /// Subtitle on the theme embed card.
  ///
  /// In en, this message translates to:
  /// **'This client doesn\'t support custom themes.'**
  String get embedThemeSubtitle;

  /// Button on the theme embed card - themes aren't supported in the client.
  ///
  /// In en, this message translates to:
  /// **'Themes unavailable'**
  String get embedThemeUnavailableButton;

  /// Title for guild privacy settings bottom sheet.
  ///
  /// In en, this message translates to:
  /// **'Privacy Settings'**
  String get privacySettings;

  /// Label for the DM toggle in guild privacy settings.
  ///
  /// In en, this message translates to:
  /// **'Direct Messages'**
  String get privacyDirectMessages;

  /// Description for the DM toggle in guild privacy settings.
  ///
  /// In en, this message translates to:
  /// **'Allow direct messages from other members in this community'**
  String get privacyDirectMessagesDescription;

  /// Label for the bot DM toggle in guild privacy settings.
  ///
  /// In en, this message translates to:
  /// **'Bot Direct Messages'**
  String get privacyBotDirectMessages;

  /// Description for the bot DM toggle in guild privacy settings.
  ///
  /// In en, this message translates to:
  /// **'Allow bots from this community to send you direct messages'**
  String get privacyBotDirectMessagesDescription;

  /// Warning shown when guild has DISABLE_MUTUAL_DMS feature.
  ///
  /// In en, this message translates to:
  /// **'The community admins have disabled receiving direct messages solely from mutual members in this community.'**
  String get privacyMutualDmsDisabled;

  /// Title for the debug community bottom sheet.
  ///
  /// In en, this message translates to:
  /// **'Community Debug'**
  String get communityDebug;

  /// Toast message after copying text to clipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get copiedToClipboard;

  /// Title for guild notification settings bottom sheet.
  ///
  /// In en, this message translates to:
  /// **'Notification Settings'**
  String get notificationSettings;

  /// Label for the mute toggle in guild notification settings.
  ///
  /// In en, this message translates to:
  /// **'Mute {guildName}'**
  String notificationMuteGuild(String guildName);

  /// Description for the mute toggle in guild notification settings.
  ///
  /// In en, this message translates to:
  /// **'Muting a community prevents unread indicators and notifications from appearing unless you are mentioned'**
  String get notificationMuteDescription;

  /// Section title for notification frequency options.
  ///
  /// In en, this message translates to:
  /// **'Community Notification Settings'**
  String get notificationCommunitySettings;

  /// Radio option for receiving all message notifications.
  ///
  /// In en, this message translates to:
  /// **'All Messages'**
  String get notificationAllMessages;

  /// Radio option for receiving only mention notifications.
  ///
  /// In en, this message translates to:
  /// **'Only Mentions'**
  String get notificationOnlyMentions;

  /// Radio option for receiving no notifications.
  ///
  /// In en, this message translates to:
  /// **'Nothing'**
  String get notificationNothing;

  /// Toggle label to suppress everyone and here mentions.
  ///
  /// In en, this message translates to:
  /// **'Suppress @everyone and @here'**
  String get notificationSuppressEveryone;

  /// Toggle label to suppress all role mentions.
  ///
  /// In en, this message translates to:
  /// **'Suppress All Role @mentions'**
  String get notificationSuppressRoles;

  /// Toggle label for mobile push notifications.
  ///
  /// In en, this message translates to:
  /// **'Mobile Push Notifications'**
  String get notificationMobilePush;

  /// Section title for per-channel notification overrides.
  ///
  /// In en, this message translates to:
  /// **'Notification Overrides'**
  String get notificationOverrides;

  /// Placeholder for the channel/category override selector.
  ///
  /// In en, this message translates to:
  /// **'Select a channel or category'**
  String get notificationSelectChannel;

  /// Switch label for only mentions override option.
  ///
  /// In en, this message translates to:
  /// **'Only @mentions'**
  String get notificationOnlyAtMentions;

  /// Switch label for muting a channel override.
  ///
  /// In en, this message translates to:
  /// **'Mute Channel'**
  String get notificationMuteChannel;

  /// Fallback category name for channels without a parent category.
  ///
  /// In en, this message translates to:
  /// **'No Category'**
  String get notificationNoCategory;

  /// DM context menu action to mark conversation as read.
  ///
  /// In en, this message translates to:
  /// **'Mark as Read'**
  String get dmMarkAsRead;

  /// DM context menu action to mute a DM.
  ///
  /// In en, this message translates to:
  /// **'Mute DM'**
  String get dmMuteConversation;

  /// DM context menu action to unmute a DM.
  ///
  /// In en, this message translates to:
  /// **'Unmute DM'**
  String get dmUnmuteConversation;

  /// DM context menu action to pin a DM.
  ///
  /// In en, this message translates to:
  /// **'Pin DM'**
  String get dmPinDm;

  /// DM context menu action to unpin a DM.
  ///
  /// In en, this message translates to:
  /// **'Unpin DM'**
  String get dmUnpinDm;

  /// DM context menu action to always show in sidebar.
  ///
  /// In en, this message translates to:
  /// **'Always Show in Sidebar'**
  String get dmAlwaysShowInSidebar;

  /// DM context menu action to remove from always shown.
  ///
  /// In en, this message translates to:
  /// **'Remove from Always Shown'**
  String get dmRemoveFromAlwaysShown;

  /// DM context menu action to close a DM conversation.
  ///
  /// In en, this message translates to:
  /// **'Close DM'**
  String get dmCloseDm;

  /// Title for close DM confirmation modal.
  ///
  /// In en, this message translates to:
  /// **'Close DM'**
  String get dmCloseDmConfirmTitle;

  /// Description for close DM confirmation modal.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to close your DM with {username}? You can always reopen it later.'**
  String dmCloseDmConfirmDescription(String username);

  /// DM context menu action to copy the channel ID.
  ///
  /// In en, this message translates to:
  /// **'Copy Channel ID'**
  String get dmCopyChannelId;

  /// Toast message after copying a channel ID.
  ///
  /// In en, this message translates to:
  /// **'Channel ID copied'**
  String get dmChannelIdCopied;

  /// DM context menu action to copy the recipient user ID.
  ///
  /// In en, this message translates to:
  /// **'Copy User ID'**
  String get dmCopyUserId;

  /// Toast message after copying a user ID.
  ///
  /// In en, this message translates to:
  /// **'User ID copied'**
  String get dmUserIdCopied;

  /// DM context menu action to view recipient profile.
  ///
  /// In en, this message translates to:
  /// **'View Profile'**
  String get dmViewProfile;

  /// DM context menu action to start a voice call.
  ///
  /// In en, this message translates to:
  /// **'Start Voice Call'**
  String get dmVoiceCall;

  /// DM context menu action to add a note about the user.
  ///
  /// In en, this message translates to:
  /// **'Add Note'**
  String get dmAddNote;

  /// DM context menu action to edit a group DM.
  ///
  /// In en, this message translates to:
  /// **'Edit Group'**
  String get dmEditGroup;

  /// DM context menu action to invite user to a community.
  ///
  /// In en, this message translates to:
  /// **'Invite to Community'**
  String get dmInviteToCommunity;

  /// DM context menu action to block a user.
  ///
  /// In en, this message translates to:
  /// **'Block'**
  String get dmBlock;

  /// DM context menu action to leave a group DM.
  ///
  /// In en, this message translates to:
  /// **'Leave Group'**
  String get dmLeaveGroup;

  /// Shown when no communities are available to invite to.
  ///
  /// In en, this message translates to:
  /// **'No communities available'**
  String get dmNoCommunitiesAvailable;

  /// Member count label for group DMs.
  ///
  /// In en, this message translates to:
  /// **'{count} Members'**
  String dmGroupMemberCount(int count);

  /// Mute duration option: 15 minutes.
  ///
  /// In en, this message translates to:
  /// **'For 15 minutes'**
  String get dmMuteFor15Min;

  /// Mute duration option: 30 minutes.
  ///
  /// In en, this message translates to:
  /// **'For 30 minutes'**
  String get dmMuteFor30Min;

  /// Mute duration option: 1 hour.
  ///
  /// In en, this message translates to:
  /// **'For 1 hour'**
  String get dmMuteFor1Hour;

  /// Mute duration option: 3 hours.
  ///
  /// In en, this message translates to:
  /// **'For 3 hours'**
  String get dmMuteFor3Hours;

  /// Mute duration option: 4 hours.
  ///
  /// In en, this message translates to:
  /// **'For 4 hours'**
  String get dmMuteFor4Hours;

  /// Mute duration option: 8 hours.
  ///
  /// In en, this message translates to:
  /// **'For 8 hours'**
  String get dmMuteFor8Hours;

  /// Mute duration option: 24 hours.
  ///
  /// In en, this message translates to:
  /// **'For 24 hours'**
  String get dmMuteFor24Hours;

  /// Mute duration option: 3 days.
  ///
  /// In en, this message translates to:
  /// **'For 3 days'**
  String get dmMuteFor3Days;

  /// Mute duration option: indefinite.
  ///
  /// In en, this message translates to:
  /// **'Until I turn it back on'**
  String get dmMuteForever;

  /// DM context menu action to pin a group DM.
  ///
  /// In en, this message translates to:
  /// **'Pin Group DM'**
  String get dmPinGroupDm;

  /// DM context menu action to unpin a group DM.
  ///
  /// In en, this message translates to:
  /// **'Unpin Group DM'**
  String get dmUnpinGroupDm;

  /// DM context menu action to favorite a DM.
  ///
  /// In en, this message translates to:
  /// **'Favorite DM'**
  String get dmFavoriteDm;

  /// DM context menu action to unfavorite a DM.
  ///
  /// In en, this message translates to:
  /// **'Unfavorite DM'**
  String get dmUnfavoriteDm;

  /// DM context menu action to favorite a group DM.
  ///
  /// In en, this message translates to:
  /// **'Favorite Group DM'**
  String get dmFavoriteGroupDm;

  /// DM context menu action to unfavorite a group DM.
  ///
  /// In en, this message translates to:
  /// **'Unfavorite Group DM'**
  String get dmUnfavoriteGroupDm;

  /// DM context menu action to change friend nickname.
  ///
  /// In en, this message translates to:
  /// **'Change Friend Nickname'**
  String get dmChangeFriendNickname;

  /// DM context menu action to remove a friend.
  ///
  /// In en, this message translates to:
  /// **'Remove Friend'**
  String get dmRemoveFriend;

  /// DM context menu action to send a friend request.
  ///
  /// In en, this message translates to:
  /// **'Add Friend'**
  String get dmAddFriend;

  /// DM context menu action to accept a friend request.
  ///
  /// In en, this message translates to:
  /// **'Accept Friend Request'**
  String get dmAcceptFriendRequest;

  /// DM context menu action to ignore a friend request.
  ///
  /// In en, this message translates to:
  /// **'Ignore Friend Request'**
  String get dmIgnoreFriendRequest;

  /// DM context menu label when a friend request is pending.
  ///
  /// In en, this message translates to:
  /// **'Friend Request Sent'**
  String get dmFriendRequestSent;

  /// DM context menu action to unblock a user.
  ///
  /// In en, this message translates to:
  /// **'Unblock'**
  String get dmUnblock;

  /// DM context menu action to debug user data.
  ///
  /// In en, this message translates to:
  /// **'Debug User'**
  String get dmDebugUser;

  /// DM context menu action to debug channel data.
  ///
  /// In en, this message translates to:
  /// **'Debug Channel'**
  String get dmDebugChannel;

  /// Toast message when a DM is pinned.
  ///
  /// In en, this message translates to:
  /// **'Pinned DM'**
  String get dmPinned;

  /// Toast message when a DM is unpinned.
  ///
  /// In en, this message translates to:
  /// **'Unpinned DM'**
  String get dmUnpinned;

  /// Toast message when a DM conversation is muted.
  ///
  /// In en, this message translates to:
  /// **'Muted DM'**
  String get dmMuted;

  /// Toast message when a DM conversation is unmuted.
  ///
  /// In en, this message translates to:
  /// **'Unmuted DM'**
  String get dmUnmuted;

  /// Title for the remove friend confirmation modal.
  ///
  /// In en, this message translates to:
  /// **'Remove Friend'**
  String get dmRemoveFriendConfirmTitle;

  /// Description for the remove friend confirmation modal.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove {username} as a friend?'**
  String dmRemoveFriendConfirmDescription(String username);

  /// Title for the block user confirmation modal.
  ///
  /// In en, this message translates to:
  /// **'Block User'**
  String get dmBlockConfirmTitle;

  /// Description for the block user confirmation modal.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to block {username}? They won\'t be able to message you or send you friend requests.'**
  String dmBlockConfirmDescription(String username);

  /// Toast message when a friend request is sent.
  ///
  /// In en, this message translates to:
  /// **'Friend request sent'**
  String get dmFriendRequestSentToast;

  /// Toast message when sending a friend request fails.
  ///
  /// In en, this message translates to:
  /// **'Failed to send friend request'**
  String get dmFriendRequestFailed;

  /// Toast message when accepting a friend request fails.
  ///
  /// In en, this message translates to:
  /// **'Failed to accept friend request'**
  String get dmAcceptFriendRequestFailed;

  /// Toast message when removing a friend fails.
  ///
  /// In en, this message translates to:
  /// **'Failed to remove friend'**
  String get dmRemoveFriendFailed;

  /// Toast message when blocking a user fails.
  ///
  /// In en, this message translates to:
  /// **'Failed to block user'**
  String get dmBlockFailed;

  /// Toast message when unblocking a user fails.
  ///
  /// In en, this message translates to:
  /// **'Failed to unblock user'**
  String get dmUnblockFailed;

  /// Toast message when ignoring a friend request fails.
  ///
  /// In en, this message translates to:
  /// **'Failed to ignore friend request'**
  String get dmIgnoreFriendRequestFailed;

  /// Tag label shown next to bot user names.
  ///
  /// In en, this message translates to:
  /// **'BOT'**
  String get userTagBot;

  /// Tag label shown next to system user names.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get userTagSystem;

  /// Emoji picker search bar placeholder.
  ///
  /// In en, this message translates to:
  /// **'Find the emoji of your dreams'**
  String get emojiSearchPlaceholder;

  /// Emoji picker empty search state.
  ///
  /// In en, this message translates to:
  /// **'No emojis match your search'**
  String get emojiSearchEmpty;

  /// Frequently used emojis section.
  ///
  /// In en, this message translates to:
  /// **'Frequently Used'**
  String get emojiFrequentlyUsed;

  /// GIFs tab.
  ///
  /// In en, this message translates to:
  /// **'GIFs'**
  String get emojiTabGifs;

  /// Media tab.
  ///
  /// In en, this message translates to:
  /// **'Media'**
  String get emojiTabMedia;

  /// Stickers tab.
  ///
  /// In en, this message translates to:
  /// **'Stickers'**
  String get emojiTabStickers;

  /// Emojis tab.
  ///
  /// In en, this message translates to:
  /// **'Emojis'**
  String get emojiTabEmojis;

  /// Generic GIF picker search placeholder while provider configuration loads.
  ///
  /// In en, this message translates to:
  /// **'Search GIFs'**
  String get gifPickerSearch;

  /// GIF picker search placeholder for KLIPY.
  ///
  /// In en, this message translates to:
  /// **'Search KLIPY'**
  String get gifPickerSearchKlipy;

  /// GIF picker search placeholder for Tenor.
  ///
  /// In en, this message translates to:
  /// **'Search Tenor'**
  String get gifPickerSearchTenor;

  /// Short powered-by KLIPY label in the GIF picker search field.
  ///
  /// In en, this message translates to:
  /// **'KLIPY'**
  String get gifPickerPoweredByKlipy;

  /// Favorites category tile in the GIF picker.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get gifPickerFavorites;

  /// Trending GIFs category and view title.
  ///
  /// In en, this message translates to:
  /// **'Trending GIFs'**
  String get gifPickerTrending;

  /// GIF picker empty search title.
  ///
  /// In en, this message translates to:
  /// **'No Search Results'**
  String get gifPickerNoResultsTitle;

  /// GIF picker empty search description.
  ///
  /// In en, this message translates to:
  /// **'Try another search term'**
  String get gifPickerNoResultsDescription;

  /// GIF picker load failure title.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load GIFs'**
  String get gifPickerLoadFailedTitle;

  /// GIF picker load failure description.
  ///
  /// In en, this message translates to:
  /// **'Check your connection and try again.'**
  String get gifPickerLoadFailedBody;

  /// People & smileys category.
  ///
  /// In en, this message translates to:
  /// **'People'**
  String get emojiCategoryPeople;

  /// Animals & nature category.
  ///
  /// In en, this message translates to:
  /// **'Nature'**
  String get emojiCategoryNature;

  /// Food & drink category.
  ///
  /// In en, this message translates to:
  /// **'Food & Drink'**
  String get emojiCategoryFood;

  /// Activities & sports category.
  ///
  /// In en, this message translates to:
  /// **'Activities'**
  String get emojiCategoryActivity;

  /// Travel & places category.
  ///
  /// In en, this message translates to:
  /// **'Travel & Places'**
  String get emojiCategoryTravel;

  /// Objects category.
  ///
  /// In en, this message translates to:
  /// **'Objects'**
  String get emojiCategoryObjects;

  /// Symbols category.
  ///
  /// In en, this message translates to:
  /// **'Symbols'**
  String get emojiCategorySymbols;

  /// Flags category.
  ///
  /// In en, this message translates to:
  /// **'Flags'**
  String get emojiCategoryFlags;

  /// Upsell banner text in emoji picker for non-premium users.
  ///
  /// In en, this message translates to:
  /// **'Unlock {emojiCount} from {communityCount} with Plutonium.'**
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount);

  /// Button label on the Plutonium upsell banner.
  ///
  /// In en, this message translates to:
  /// **'Get Plutonium'**
  String get emojiPlutoniumUpsellButton;

  /// Dismiss link on the Plutonium upsell banner.
  ///
  /// In en, this message translates to:
  /// **'Don\'t show this again'**
  String get emojiPlutoniumUpsellDismiss;

  /// Emoji count label in upsell banner.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 custom emoji} other{{count} custom emojis}}'**
  String emojiPlutoniumUpsellCustomEmoji(int count);

  /// Community count label in upsell banner.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 community} other{{count} communities}}'**
  String emojiPlutoniumUpsellCommunity(int count);

  /// Title of the external link warning modal.
  ///
  /// In en, this message translates to:
  /// **'External Link Warning'**
  String get externalLinkWarningTitle;

  /// Primary warning text shown in the external link warning modal.
  ///
  /// In en, this message translates to:
  /// **'You are about to leave Fluxer'**
  String get externalLinkWarningLeaving;

  /// Supporting text shown in the external link warning modal.
  ///
  /// In en, this message translates to:
  /// **'External links can be dangerous. Please be careful.'**
  String get externalLinkWarningDescription;

  /// Label above the destination URL in the external link warning modal.
  ///
  /// In en, this message translates to:
  /// **'Destination URL:'**
  String get externalLinkWarningDestinationUrl;

  /// Heading for the external links settings section.
  ///
  /// In en, this message translates to:
  /// **'External Links'**
  String get externalLinksSectionTitle;

  /// Description for the external links settings section.
  ///
  /// In en, this message translates to:
  /// **'Configure how external link warnings are handled.'**
  String get externalLinksSectionDescription;

  /// Prefix before the hostname in the trust-domain checkbox label.
  ///
  /// In en, this message translates to:
  /// **'Always trust '**
  String get externalLinkWarningTrustPrefix;

  /// Suffix after the hostname in the trust-domain checkbox label.
  ///
  /// In en, this message translates to:
  /// **' — skip this warning next time'**
  String get externalLinkWarningTrustSuffix;

  /// Primary action to continue to an external site.
  ///
  /// In en, this message translates to:
  /// **'Visit Site'**
  String get externalLinkVisitSite;

  /// Label for the setting that trusts all external links.
  ///
  /// In en, this message translates to:
  /// **'Trust all external links'**
  String get externalLinkTrustAllLabel;

  /// Title of the confirmation modal for trusting all external links.
  ///
  /// In en, this message translates to:
  /// **'Trust all external links?'**
  String get externalLinkTrustAllConfirmTitle;

  /// Description of the confirmation modal for trusting all external links.
  ///
  /// In en, this message translates to:
  /// **'This will trust all external links and skip the warning for every domain. Your existing trusted domains will be replaced. This is less secure.'**
  String get externalLinkTrustAllConfirmDescription;

  /// Confirm action for trusting all external links.
  ///
  /// In en, this message translates to:
  /// **'Trust All'**
  String get externalLinkTrustAllConfirmAction;

  /// Title of the confirmation modal for disabling trust-all external links.
  ///
  /// In en, this message translates to:
  /// **'Stop trusting all links?'**
  String get externalLinkStopTrustingAllTitle;

  /// Description of the confirmation modal for disabling trust-all external links.
  ///
  /// In en, this message translates to:
  /// **'External link warnings will be shown again. You will need to add trusted domains individually.'**
  String get externalLinkStopTrustingAllDescription;

  /// Confirm action for disabling trust-all external links.
  ///
  /// In en, this message translates to:
  /// **'Disable Trust All'**
  String get externalLinkStopTrustingAllAction;

  /// Description shown when trust-all external links is enabled.
  ///
  /// In en, this message translates to:
  /// **'All external links are trusted. Warnings will not be shown.'**
  String get externalLinkTrustedAllDescription;

  /// Description shown when one or more trusted domains have been added.
  ///
  /// In en, this message translates to:
  /// **'You have {count} trusted domain(s). Add more by checking the box when visiting external links.'**
  String externalLinkTrustedDomainsDescription(int count);

  /// Description shown when trust-all external links is disabled and no trusted domains exist.
  ///
  /// In en, this message translates to:
  /// **'When enabled, no external link warnings will be shown. This is less secure.'**
  String get externalLinkTrustAllDisabledDescription;

  /// Error when a selected image exceeds the maximum file size.
  ///
  /// In en, this message translates to:
  /// **'Image file is too large. Please choose a file smaller than 10 MB.'**
  String get imageFileTooLarge;

  /// Toast shown when non-premium user tries uploading animated avatar.
  ///
  /// In en, this message translates to:
  /// **'Animated avatars require Plutonium'**
  String get animatedAvatarsRequirePlutonium;

  /// Toast shown when non-premium user tries uploading animated banner.
  ///
  /// In en, this message translates to:
  /// **'Animated banners require Plutonium'**
  String get animatedBannersRequirePlutonium;

  /// Title for animated AVIF confirmation sheet.
  ///
  /// In en, this message translates to:
  /// **'Animated AVIF Not Supported'**
  String get animatedAvifNotSupported;

  /// Body text explaining animated AVIF limitation.
  ///
  /// In en, this message translates to:
  /// **'Cropping and rotating animated AVIF files isn\'t supported yet. If you proceed, it will be uploaded in its original form.'**
  String get animatedAvifNotSupportedBody;

  /// Button to upload an animated image without cropping.
  ///
  /// In en, this message translates to:
  /// **'Upload As-Is'**
  String get uploadAsIs;

  /// Toast when premium user uploads animated image that can't be cropped.
  ///
  /// In en, this message translates to:
  /// **'Cropping animated images isn\'t supported yet. The original upload will be used.'**
  String get croppingAnimatedNotSupported;

  /// Title for the avatar crop bottom sheet.
  ///
  /// In en, this message translates to:
  /// **'Crop Avatar'**
  String get cropAvatar;

  /// Title for the banner crop bottom sheet.
  ///
  /// In en, this message translates to:
  /// **'Crop Banner'**
  String get cropBanner;

  /// Button to skip image cropping and use the original.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// Button to confirm image crop.
  ///
  /// In en, this message translates to:
  /// **'Crop'**
  String get crop;

  /// Title for the FluxerTag change bottom sheet.
  ///
  /// In en, this message translates to:
  /// **'Change Your FluxerTag'**
  String get changeYourFluxerTag;

  /// Label above the username and discriminator input fields.
  ///
  /// In en, this message translates to:
  /// **'FluxerTag'**
  String get fluxerTagInputLabel;

  /// Base description text on the FluxerTag change sheet.
  ///
  /// In en, this message translates to:
  /// **'Usernames can only contain letters (a-z, A-Z), numbers (0-9), and underscores. Usernames are case-insensitive.'**
  String get fluxerTagDescriptionBase;

  /// Description for Visionary (lifetime premium) users who can pick any 4-digit tag.
  ///
  /// In en, this message translates to:
  /// **'Usernames can only contain letters (a-z, A-Z), numbers (0-9), and underscores. Usernames are case-insensitive. You can pick any available 4-digit tag from #0000 to #9999.'**
  String get fluxerTagDescriptionVisionary;

  /// Description for premium users who can pick a 4-digit tag.
  ///
  /// In en, this message translates to:
  /// **'Usernames can only contain letters (a-z, A-Z), numbers (0-9), and underscores. Usernames are case-insensitive. You can pick any available 4-digit tag from #0001 to #9999.'**
  String get fluxerTagDescriptionPremium;

  /// Validation rule for username character length.
  ///
  /// In en, this message translates to:
  /// **'Between {min} and {max} characters'**
  String validationLengthRange(int min, int max);

  /// Validation rule for allowed username characters.
  ///
  /// In en, this message translates to:
  /// **'Letters (a-z, A-Z), numbers (0-9), and underscores (_) only'**
  String get validationAllowedChars;

  /// Tooltip on disabled discriminator field for non-premium users.
  ///
  /// In en, this message translates to:
  /// **'Get Plutonium to customize your tag or keep it when changing your username'**
  String get discriminatorPremiumTooltip;

  /// Title for the tag-taken confirmation sheet.
  ///
  /// In en, this message translates to:
  /// **'FluxerTag Already Taken'**
  String get fluxerTagAlreadyTaken;

  /// Body text when the requested FluxerTag is taken.
  ///
  /// In en, this message translates to:
  /// **'The FluxerTag {username}#{discriminator} is already taken. Continuing will reroll your discriminator automatically.'**
  String fluxerTagAlreadyTakenBody(String username, String discriminator);

  /// Title for the temporary tag warning sheet.
  ///
  /// In en, this message translates to:
  /// **'Custom Tag Is Temporary'**
  String get customTagIsTemporary;

  /// Warning body when premium subscription has a known expiry date.
  ///
  /// In en, this message translates to:
  /// **'Your custom 4-digit tag is only available while your Plutonium subscription is active. When your subscription expires on {date}, your tag will revert to a randomly assigned number after a 3-day grace period.'**
  String customTagTemporaryBodyWithDate(String date);

  /// Warning body when premium subscription expiry date is unknown.
  ///
  /// In en, this message translates to:
  /// **'Your custom 4-digit tag is only available while your Plutonium subscription is active. When your subscription expires, your tag will revert to a randomly assigned number after a 3-day grace period.'**
  String get customTagTemporaryBody;

  /// Button to acknowledge a warning and proceed.
  ///
  /// In en, this message translates to:
  /// **'I Understand, Continue'**
  String get iUnderstandContinue;

  /// Warning shown when premium user is about to change their discriminator.
  ///
  /// In en, this message translates to:
  /// **'If you save this FluxerTag, your custom 4-digit tag will revert to a random number when your Plutonium subscription ends. If your subscription fails to renew, you\'ll have a 3-day grace period before the tag changes.'**
  String get premiumWarningPendingDiscriminator;

  /// Warning shown when premium user already has a custom discriminator.
  ///
  /// In en, this message translates to:
  /// **'Your custom 4-digit tag (#{discriminator}) is active while your Plutonium subscription is active. If your subscription ends or fails to renew after a 3-day grace period, your tag will revert to a random number.'**
  String premiumWarningActiveDiscriminator(String discriminator);

  /// Upsell text encouraging non-premium users to get Plutonium for tag customization.
  ///
  /// In en, this message translates to:
  /// **'Customize your 4-digit tag or keep it when changing your username'**
  String get premiumUpsellCustomizeTag;

  /// Trial upsell with expiry date.
  ///
  /// In en, this message translates to:
  /// **'Your Plutonium trial expires on {date}. Upgrade to keep your custom tag and earn a badge on your profile.'**
  String premiumTrialExpiresOn(String date);

  /// Trial upsell without specific expiry date.
  ///
  /// In en, this message translates to:
  /// **'You\'re on a Plutonium trial. Upgrade to keep your custom tag and earn a badge on your profile.'**
  String get premiumTrialActive;

  /// Success toast after FluxerTag change.
  ///
  /// In en, this message translates to:
  /// **'FluxerTag updated'**
  String get fluxerTagUpdated;

  /// Error message when FluxerTag update fails.
  ///
  /// In en, this message translates to:
  /// **'Failed to update FluxerTag. Please try again.'**
  String get fluxerTagUpdateFailed;

  /// Generic continue button label.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueAction;

  /// Heading for the profile customization settings section.
  ///
  /// In en, this message translates to:
  /// **'Profile Customization'**
  String get profileCustomizationTitle;

  /// Subheading for the profile customization settings section.
  ///
  /// In en, this message translates to:
  /// **'Edit your profile appearance and see a live preview'**
  String get profileCustomizationDescription;

  /// Label for the username field in profile settings.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get usernameLabel;

  /// Tooltip when unverified user hovers the disabled Change FluxerTag button.
  ///
  /// In en, this message translates to:
  /// **'Claim your account to change your FluxerTag'**
  String get claimAccountToChangeFluxerTag;

  /// Button label to open the FluxerTag change flow.
  ///
  /// In en, this message translates to:
  /// **'Change FluxerTag'**
  String get changeFluxerTag;

  /// Tooltip on the crown upsell button next to the FluxerTag button.
  ///
  /// In en, this message translates to:
  /// **'Customize your 4-digit tag (#{discriminator}) to your liking with Plutonium'**
  String customizeTagWithPlutoniumTooltip(String discriminator);

  /// Hint text below the username buttons.
  ///
  /// In en, this message translates to:
  /// **'Change your username and 4-digit tag'**
  String get changeUsernameAndTagHint;

  /// Warning shown when user has a premium discriminator that is not lifetime.
  ///
  /// In en, this message translates to:
  /// **'Your custom tag (#{discriminator}) is tied to your Plutonium subscription and will revert to a random tag if it expires.'**
  String customTagSubscriptionWarning(String discriminator);

  /// Label for the display name input.
  ///
  /// In en, this message translates to:
  /// **'Display Name'**
  String get displayNameLabel;

  /// Label for the pronouns input.
  ///
  /// In en, this message translates to:
  /// **'Pronouns'**
  String get pronounsLabel;

  /// Label for the avatar upload section.
  ///
  /// In en, this message translates to:
  /// **'Avatar'**
  String get avatarLabel;

  /// Button to upload a new avatar image.
  ///
  /// In en, this message translates to:
  /// **'Change Avatar'**
  String get changeAvatar;

  /// Button to remove the current avatar.
  ///
  /// In en, this message translates to:
  /// **'Remove Avatar'**
  String get removeAvatar;

  /// Helper text describing avatar image requirements.
  ///
  /// In en, this message translates to:
  /// **'JPEG, PNG, GIF, WebP. Max 10MB. Recommended: 512×512px'**
  String get avatarDescription;

  /// Label for the banner upload section.
  ///
  /// In en, this message translates to:
  /// **'Banner'**
  String get bannerLabel;

  /// Button to upload a new banner image.
  ///
  /// In en, this message translates to:
  /// **'Change Banner'**
  String get changeBanner;

  /// Button to remove the current banner.
  ///
  /// In en, this message translates to:
  /// **'Remove Banner'**
  String get removeBanner;

  /// Helper text describing banner image requirements.
  ///
  /// In en, this message translates to:
  /// **'JPEG, PNG, GIF, WebP. Max 10MB. Minimum: 680×240px (17:6)'**
  String get bannerDescription;

  /// Label for the accent color picker.
  ///
  /// In en, this message translates to:
  /// **'Accent Color'**
  String get accentColorLabel;

  /// Helper text for the accent color picker.
  ///
  /// In en, this message translates to:
  /// **'Customizes the border and banner color on your profile'**
  String get accentColorDescription;

  /// Label for the bio text area.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get aboutMeLabel;

  /// Helper text below the bio text area.
  ///
  /// In en, this message translates to:
  /// **'You can use links, emoji, and Markdown.'**
  String get aboutMeHelperText;

  /// Title for the emoji picker sheet.
  ///
  /// In en, this message translates to:
  /// **'Emoji'**
  String get emojiPickerTitle;

  /// Heading for the premium badge privacy settings section.
  ///
  /// In en, this message translates to:
  /// **'Plutonium Badge Privacy'**
  String get plutoniumBadgePrivacyTitle;

  /// Subheading for the premium badge privacy settings section.
  ///
  /// In en, this message translates to:
  /// **'Control how your Plutonium badge is displayed to others'**
  String get plutoniumBadgePrivacyDescription;

  /// Label for the toggle to hide the Plutonium badge.
  ///
  /// In en, this message translates to:
  /// **'Hide Plutonium badge entirely'**
  String get hidePlutoniumBadgeLabel;

  /// Description for the toggle to hide the Plutonium badge.
  ///
  /// In en, this message translates to:
  /// **'Completely hide your Plutonium badge from other users'**
  String get hidePlutoniumBadgeDescription;

  /// Label for the toggle to hide the Plutonium purchase date.
  ///
  /// In en, this message translates to:
  /// **'Hide Plutonium purchase date'**
  String get hidePlutoniumPurchaseDate;

  /// Label for the toggle to hide the Plutonium purchase date, showing the actual date.
  ///
  /// In en, this message translates to:
  /// **'Hide Plutonium purchase date ({date})'**
  String hidePlutoniumPurchaseDateWithDate(String date);

  /// Description for the toggle to hide the Plutonium purchase date.
  ///
  /// In en, this message translates to:
  /// **'Remove when you first bought Plutonium from your badge'**
  String get hidePurchaseDateDescription;

  /// Label for the toggle to mask Visionary as a regular subscription.
  ///
  /// In en, this message translates to:
  /// **'Mask Visionary as subscription'**
  String get maskVisionaryAsSubscription;

  /// Description for the toggle to mask Visionary as a regular subscription.
  ///
  /// In en, this message translates to:
  /// **'Show your Visionary as a regular subscription instead'**
  String get maskVisionaryDescription;

  /// Label for the toggle to hide the Visionary ID badge.
  ///
  /// In en, this message translates to:
  /// **'Hide Visionary ID badge'**
  String get hideVisionaryIdBadge;

  /// Label for the toggle to hide the Visionary ID badge, showing the sequence number.
  ///
  /// In en, this message translates to:
  /// **'Hide Visionary ID badge (#{sequence})'**
  String hideVisionaryIdBadgeWithSequence(int sequence);

  /// Description for the toggle to hide the Visionary ID badge.
  ///
  /// In en, this message translates to:
  /// **'Remove your Visionary ID badge'**
  String get hideVisionaryIdDescription;

  /// Trial banner title when user has an active subscription pending after trial.
  ///
  /// In en, this message translates to:
  /// **'You\'re on a Plutonium trial — your subscription starts on {date}'**
  String premiumTrialSubscriptionStarts(String date);

  /// Trial banner description when user has an active subscription pending after trial.
  ///
  /// In en, this message translates to:
  /// **'Your subscription will automatically begin when your trial ends. No action needed.'**
  String get premiumTrialSubscriptionStartsDescription;

  /// Trial banner title with expiry date.
  ///
  /// In en, this message translates to:
  /// **'You\'re on a Plutonium trial that expires on {date}'**
  String premiumTrialExpiresOnProfile(String date);

  /// Trial banner title without specific expiry date.
  ///
  /// In en, this message translates to:
  /// **'You\'re on a Plutonium trial'**
  String get premiumTrialActiveProfile;

  /// Avatar helper text for non-premium users, mentioning Plutonium requirement for animated avatars.
  ///
  /// In en, this message translates to:
  /// **'JPEG, PNG, WebP. Max 10MB. Recommended: 512×512px. Animated avatars (GIF) require Plutonium.'**
  String get avatarDescriptionNonPremium;

  /// Upsell text shown in place of banner upload for non-premium users.
  ///
  /// In en, this message translates to:
  /// **'Customize your profile with a static or animated banner image to make it stand out.'**
  String get bannerPlutoniumUpsell;

  /// Button label for the Plutonium upsell call-to-action.
  ///
  /// In en, this message translates to:
  /// **'Get Plutonium'**
  String get getPlutonium;

  /// Title for the Plutonium not-available-yet bottom sheet.
  ///
  /// In en, this message translates to:
  /// **'Plutonium'**
  String get plutoniumNotAvailableTitle;

  /// Body text for the Plutonium not-available-yet bottom sheet.
  ///
  /// In en, this message translates to:
  /// **'In-app purchases are not available on this platform yet. Stay tuned — coming soon!'**
  String get plutoniumNotAvailableBody;

  /// Label shown above the profile preview card in settings.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get profilePreviewLabel;

  /// Disabled message button in the profile preview card.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get profilePreviewMessage;

  /// Label for the member-since date in the profile preview card.
  ///
  /// In en, this message translates to:
  /// **'Fluxer Member Since'**
  String get profilePreviewMemberSince;

  /// Title for the unclaimed account warning bar.
  ///
  /// In en, this message translates to:
  /// **'Unclaimed Account'**
  String get unclaimedAccountTitle;

  /// Description for the unclaimed account warning bar.
  ///
  /// In en, this message translates to:
  /// **'Your account is not yet claimed. Without an email and password, you could lose access. Claim your account now to secure it.'**
  String get unclaimedAccountDescription;

  /// Button to start the account claiming flow.
  ///
  /// In en, this message translates to:
  /// **'Claim Account'**
  String get claimAccount;

  /// Label for the profile type dropdown
  ///
  /// In en, this message translates to:
  /// **'Profile Type'**
  String get profileTypeLabel;

  /// Option for global profile in profile type selector
  ///
  /// In en, this message translates to:
  /// **'Global Profile'**
  String get profileTypeGlobal;

  /// Description shown when editing a per-guild profile
  ///
  /// In en, this message translates to:
  /// **'You are editing your per-community profile. This profile will only be visible in this community and will override your global profile.'**
  String get profileTypeGuildDescription;

  /// Label for the community nickname field
  ///
  /// In en, this message translates to:
  /// **'Community Nickname'**
  String get communityNicknameLabel;

  /// Upsell text for per-guild premium features
  ///
  /// In en, this message translates to:
  /// **'Customizing your avatar, banner, accent color, and bio for individual communities requires Plutonium. Community nickname and pronouns are free for everyone.'**
  String get perGuildPremiumUpsellText;

  /// Avatar/banner mode: inherit from global profile
  ///
  /// In en, this message translates to:
  /// **'Use Global Profile'**
  String get avatarModeInherit;

  /// Avatar/banner mode: use a custom image
  ///
  /// In en, this message translates to:
  /// **'Use Custom Image'**
  String get avatarModeCustom;

  /// Avatar/banner mode: hide even if global exists
  ///
  /// In en, this message translates to:
  /// **'Don\'t Show'**
  String get avatarModeUnset;

  /// Toast message shown after successfully saving profile changes.
  ///
  /// In en, this message translates to:
  /// **'Profile updated'**
  String get profileSavedToast;

  /// Button label to open profile editing from the profile content card.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get profileEditButton;

  /// Label for the personal note section on a user profile.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get profileNoteLabel;

  /// Hint that the note is private and only visible to the current user.
  ///
  /// In en, this message translates to:
  /// **'(only visible to you)'**
  String get profileNoteVisibility;

  /// Placeholder shown when no personal note has been set for a user.
  ///
  /// In en, this message translates to:
  /// **'No note yet.'**
  String get profileNoteEmpty;

  /// Title for the sudo verification bottom sheet shown for sensitive operations.
  ///
  /// In en, this message translates to:
  /// **'Verify Your Identity'**
  String get sudoTitle;

  /// Description text in the sudo verification bottom sheet.
  ///
  /// In en, this message translates to:
  /// **'This action requires verification to continue.'**
  String get sudoDescription;

  /// Label for the TOTP authenticator code input field in sudo verification.
  ///
  /// In en, this message translates to:
  /// **'Authenticator Code'**
  String get sudoAuthenticatorCode;

  /// Label for the password verification method tab in sudo verification.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get sudoMethodPassword;

  /// Label for the TOTP authenticator method tab in sudo verification.
  ///
  /// In en, this message translates to:
  /// **'Authenticator'**
  String get sudoMethodTotp;

  /// Error message shown when sudo verification attempt fails.
  ///
  /// In en, this message translates to:
  /// **'Verification failed. Please try again.'**
  String get sudoVerificationFailed;

  /// Top-level Account section heading in Security & Login settings.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get securityAccountTitle;

  /// Description for Account section heading.
  ///
  /// In en, this message translates to:
  /// **'Manage your email, password, and account settings'**
  String get securityAccountDescription;

  /// Top-level Security section heading in Security & Login settings.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get securitySectionTitle;

  /// Description for Security section heading.
  ///
  /// In en, this message translates to:
  /// **'Protect your account with two-factor authentication and passkeys'**
  String get securitySectionDescription;

  /// Title for email settings section in Security & Login.
  ///
  /// In en, this message translates to:
  /// **'Email Settings'**
  String get securityLoginEmailSectionTitle;

  /// Description for email settings section.
  ///
  /// In en, this message translates to:
  /// **'Manage the email address you use to sign in to Fluxer'**
  String get securityLoginEmailSectionDescription;

  /// Label for email address row.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get securityLoginEmailAddressLabel;

  /// Shown when the user has no email address set.
  ///
  /// In en, this message translates to:
  /// **'No email address set'**
  String get securityLoginNoEmailSet;

  /// Button label to change email address.
  ///
  /// In en, this message translates to:
  /// **'Change Email'**
  String get securityLoginChangeEmail;

  /// Button label to add an email address.
  ///
  /// In en, this message translates to:
  /// **'Add Email'**
  String get securityLoginAddEmail;

  /// Button label to reveal masked email or phone.
  ///
  /// In en, this message translates to:
  /// **'Reveal'**
  String get securityLoginReveal;

  /// Button label to hide revealed email or phone.
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get securityLoginHide;

  /// Title for password section in Security & Login.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get securityLoginPasswordSectionTitle;

  /// Description for password section.
  ///
  /// In en, this message translates to:
  /// **'Change your password to keep your account secure'**
  String get securityLoginPasswordSectionDescription;

  /// Label for current password row.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get securityLoginCurrentPasswordLabel;

  /// Shows when the password was last changed.
  ///
  /// In en, this message translates to:
  /// **'Last changed: {date}'**
  String securityLoginPasswordLastChanged(String date);

  /// Shown when the password has never been changed.
  ///
  /// In en, this message translates to:
  /// **'Last changed: Never'**
  String get securityLoginPasswordNeverChanged;

  /// Shown when the user has no password set.
  ///
  /// In en, this message translates to:
  /// **'No password set'**
  String get securityLoginNoPasswordSet;

  /// Button label to change password.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get securityLoginChangePassword;

  /// Button label to set a password.
  ///
  /// In en, this message translates to:
  /// **'Set Password'**
  String get securityLoginSetPassword;

  /// Title for password change flow.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get passwordChangeTitle;

  /// Description shown on the intro step of password change.
  ///
  /// In en, this message translates to:
  /// **'We\'ll send a verification code to your email address to confirm your identity before changing your password.'**
  String get passwordChangeIntroDescription;

  /// Button label to start password change flow.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get passwordChangeStart;

  /// Title for email verification step in password change.
  ///
  /// In en, this message translates to:
  /// **'Verify Your Email'**
  String get passwordChangeVerifyTitle;

  /// Description for email verification step.
  ///
  /// In en, this message translates to:
  /// **'Enter the verification code sent to your email address.'**
  String get passwordChangeVerifyDescription;

  /// Label for verification code input.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get passwordChangeVerificationCode;

  /// Button label to verify the code.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get passwordChangeVerify;

  /// Title for new password entry step.
  ///
  /// In en, this message translates to:
  /// **'Set New Password'**
  String get passwordChangeNewPasswordTitle;

  /// Description for new password entry step.
  ///
  /// In en, this message translates to:
  /// **'Enter your new password below.'**
  String get passwordChangeNewPasswordDescription;

  /// Label for new password input.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get passwordChangeNewPassword;

  /// Label for confirm password input.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get passwordChangeConfirmPassword;

  /// Button label to submit password change.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get passwordChangeSubmit;

  /// Toast shown after successful password change.
  ///
  /// In en, this message translates to:
  /// **'Password changed'**
  String get passwordChangeSuccess;

  /// Error shown when new password and confirmation don't match.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordChangePasswordsDoNotMatch;

  /// Error shown when verification code is invalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid or expired code'**
  String get passwordChangeInvalidCode;

  /// Title for email change flow.
  ///
  /// In en, this message translates to:
  /// **'Change Email'**
  String get emailChangeTitle;

  /// Description shown on the intro step of email change.
  ///
  /// In en, this message translates to:
  /// **'We\'ll send verification codes to verify your identity before changing your email address.'**
  String get emailChangeIntroDescription;

  /// Button label to start email change flow.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get emailChangeStart;

  /// Title for verifying original email step.
  ///
  /// In en, this message translates to:
  /// **'Verify Current Email'**
  String get emailChangeVerifyOriginalTitle;

  /// Description for original email verification step.
  ///
  /// In en, this message translates to:
  /// **'Enter the verification code sent to your current email address.'**
  String get emailChangeVerifyOriginalDescription;

  /// Title for new email entry step.
  ///
  /// In en, this message translates to:
  /// **'Enter New Email'**
  String get emailChangeNewEmailTitle;

  /// Description for new email entry step.
  ///
  /// In en, this message translates to:
  /// **'Enter the new email address you\'d like to use.'**
  String get emailChangeNewEmailDescription;

  /// Label for new email input.
  ///
  /// In en, this message translates to:
  /// **'New Email'**
  String get emailChangeNewEmailLabel;

  /// Button label to submit new email and send verification code.
  ///
  /// In en, this message translates to:
  /// **'Send Verification Code'**
  String get emailChangeNewEmailSubmit;

  /// Title for verifying new email step.
  ///
  /// In en, this message translates to:
  /// **'Verify New Email'**
  String get emailChangeVerifyNewTitle;

  /// Description for new email verification step.
  ///
  /// In en, this message translates to:
  /// **'Enter the verification code sent to your new email address.'**
  String get emailChangeVerifyNewDescription;

  /// Toast shown after successful email change.
  ///
  /// In en, this message translates to:
  /// **'Email changed'**
  String get emailChangeSuccess;

  /// Error shown when email verification code is invalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid or expired code'**
  String get emailChangeInvalidCode;

  /// Generic resend button label.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// Resend button with countdown timer.
  ///
  /// In en, this message translates to:
  /// **'Resend ({seconds}s)'**
  String resendCountdown(int seconds);

  /// Generic label for verification code input.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get verificationCode;

  /// Generic verify button label.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// Generic enable button label.
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get enable;

  /// Generic disable button label.
  ///
  /// In en, this message translates to:
  /// **'Disable'**
  String get disable;

  /// Generic delete button label.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Generic save button label.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Title for the 2FA section.
  ///
  /// In en, this message translates to:
  /// **'Two-Factor Authentication'**
  String get securityTfaSectionTitle;

  /// Description for 2FA section.
  ///
  /// In en, this message translates to:
  /// **'Add an extra layer of security to your account'**
  String get securityTfaSectionDescription;

  /// Label for authenticator app row.
  ///
  /// In en, this message translates to:
  /// **'Authenticator App'**
  String get securityTfaAuthenticatorApp;

  /// Status when TOTP is enabled.
  ///
  /// In en, this message translates to:
  /// **'Two-factor authentication is enabled'**
  String get securityTfaAuthenticatorEnabled;

  /// Status when TOTP is disabled.
  ///
  /// In en, this message translates to:
  /// **'Use an authenticator app to generate codes for two-factor authentication'**
  String get securityTfaAuthenticatorDisabled;

  /// Label for backup codes row.
  ///
  /// In en, this message translates to:
  /// **'Backup Codes'**
  String get securityTfaBackupCodes;

  /// Description for backup codes.
  ///
  /// In en, this message translates to:
  /// **'View and manage your backup codes for account recovery'**
  String get securityTfaBackupCodesDescription;

  /// Button to view backup codes.
  ///
  /// In en, this message translates to:
  /// **'View Codes'**
  String get securityTfaViewCodes;

  /// Title for passkeys section.
  ///
  /// In en, this message translates to:
  /// **'Passkeys'**
  String get securityPasskeysSectionTitle;

  /// Description for passkeys section.
  ///
  /// In en, this message translates to:
  /// **'Use passkeys for passwordless sign-in and two-factor authentication'**
  String get securityPasskeysSectionDescription;

  /// Label for registered passkeys row.
  ///
  /// In en, this message translates to:
  /// **'Registered Passkeys'**
  String get securityPasskeysRegistered;

  /// Shown when no passkeys are registered.
  ///
  /// In en, this message translates to:
  /// **'No passkeys registered'**
  String get securityPasskeysNone;

  /// Shows passkey count.
  ///
  /// In en, this message translates to:
  /// **'{count} {count, plural, =1{passkey} other{passkeys}} registered (max 10)'**
  String securityPasskeysCount(int count);

  /// Button to add a passkey.
  ///
  /// In en, this message translates to:
  /// **'Add Passkey'**
  String get securityPasskeysAdd;

  /// Shows when passkey was added.
  ///
  /// In en, this message translates to:
  /// **'Added: {date}'**
  String securityPasskeysAdded(String date);

  /// Shows when passkey was last used.
  ///
  /// In en, this message translates to:
  /// **'Last used: {date}'**
  String securityPasskeysLastUsed(String date);

  /// Button to rename a passkey.
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get securityPasskeysRename;

  /// Title for passkey delete confirmation.
  ///
  /// In en, this message translates to:
  /// **'Delete Passkey'**
  String get securityPasskeysDeleteTitle;

  /// Description for passkey delete confirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the passkey \"{name}\"?'**
  String securityPasskeysDeleteDescription(String name);

  /// Title for passkey naming sheet.
  ///
  /// In en, this message translates to:
  /// **'Name Passkey'**
  String get securityPasskeyNameTitle;

  /// Label for passkey name input.
  ///
  /// In en, this message translates to:
  /// **'Passkey Name'**
  String get securityPasskeyNameLabel;

  /// Hint for passkey name input.
  ///
  /// In en, this message translates to:
  /// **'e.g., YubiKey, iPhone, Work Computer'**
  String get securityPasskeyNameHint;

  /// Title for phone number section.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get securityPhoneSectionTitle;

  /// Description for phone number section.
  ///
  /// In en, this message translates to:
  /// **'Manage your phone number for SMS two-factor authentication'**
  String get securityPhoneSectionDescription;

  /// Label for phone number row.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get securityPhoneLabel;

  /// Shown when no phone number is set.
  ///
  /// In en, this message translates to:
  /// **'Add a phone number to enable SMS two-factor authentication'**
  String get securityPhoneNone;

  /// Button to add phone number.
  ///
  /// In en, this message translates to:
  /// **'Add Phone'**
  String get securityPhoneAdd;

  /// Button to remove phone number.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get securityPhoneRemove;

  /// Title for phone remove confirmation.
  ///
  /// In en, this message translates to:
  /// **'Remove Phone Number'**
  String get securityPhoneRemoveTitle;

  /// Description for phone remove confirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove your phone number?'**
  String get securityPhoneRemoveDescription;

  /// Warning when removing phone with SMS MFA.
  ///
  /// In en, this message translates to:
  /// **'This will also disable SMS two-factor authentication.'**
  String get securityPhoneRemoveWarning;

  /// Toast after phone removed.
  ///
  /// In en, this message translates to:
  /// **'Phone number removed'**
  String get securityPhoneRemoved;

  /// Title for SMS MFA section.
  ///
  /// In en, this message translates to:
  /// **'SMS Two-Factor Authentication'**
  String get securitySmsSectionTitle;

  /// Description for SMS MFA section.
  ///
  /// In en, this message translates to:
  /// **'Receive verification codes via SMS as a backup authentication method'**
  String get securitySmsSectionDescription;

  /// Label for SMS backup row.
  ///
  /// In en, this message translates to:
  /// **'SMS Backup'**
  String get securitySmsBackup;

  /// Status when SMS MFA is enabled.
  ///
  /// In en, this message translates to:
  /// **'SMS two-factor authentication is enabled'**
  String get securitySmsEnabled;

  /// Status when SMS MFA is disabled.
  ///
  /// In en, this message translates to:
  /// **'Enable SMS codes as a backup for your authenticator app'**
  String get securitySmsDisabled;

  /// Title for SMS MFA enable confirmation.
  ///
  /// In en, this message translates to:
  /// **'Enable SMS Two-Factor Authentication'**
  String get securitySmsEnableTitle;

  /// Description for SMS MFA enable.
  ///
  /// In en, this message translates to:
  /// **'SMS two-factor authentication adds an additional layer of security by requiring a verification code sent to your phone number when signing in.'**
  String get securitySmsEnableDescription;

  /// Title for SMS MFA disable confirmation.
  ///
  /// In en, this message translates to:
  /// **'Disable SMS Two-Factor Authentication'**
  String get securitySmsDisableTitle;

  /// Description for SMS MFA disable.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to disable SMS two-factor authentication? This will make your account less secure.'**
  String get securitySmsDisableDescription;

  /// Tooltip when SMS MFA is not available for partner accounts.
  ///
  /// In en, this message translates to:
  /// **'SMS backup is disabled for partners'**
  String get securitySmsDisabledForPartners;

  /// Title when user needs to claim account for security.
  ///
  /// In en, this message translates to:
  /// **'Security Features'**
  String get securityClaimTitle;

  /// Description prompting user to claim account.
  ///
  /// In en, this message translates to:
  /// **'Claim your account to access security features like two-factor authentication and passkeys.'**
  String get securityClaimDescription;

  /// Warning when email is not verified.
  ///
  /// In en, this message translates to:
  /// **'You must verify your email address before you can set up two-factor authentication, passkeys, or SMS verification.'**
  String get securityVerifyEmailRequired;

  /// Title for TOTP enable sheet.
  ///
  /// In en, this message translates to:
  /// **'Setup Authenticator App'**
  String get totpEnableTitle;

  /// Description for TOTP enable sheet.
  ///
  /// In en, this message translates to:
  /// **'Scan the QR code with your authenticator app to generate codes for two-factor authentication.'**
  String get totpEnableDescription;

  /// Label for TOTP code input.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get totpEnableCodeLabel;

  /// Hint for TOTP code input.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code from your authenticator app'**
  String get totpEnableCodeHint;

  /// Toast after TOTP enabled.
  ///
  /// In en, this message translates to:
  /// **'Two-factor authentication has been enabled'**
  String get totpEnableSuccess;

  /// Title for TOTP disable sheet.
  ///
  /// In en, this message translates to:
  /// **'Remove Authenticator App'**
  String get totpDisableTitle;

  /// Description for TOTP disable sheet.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code from your authenticator app to disable two-factor authentication.'**
  String get totpDisableDescription;

  /// Toast after TOTP disabled.
  ///
  /// In en, this message translates to:
  /// **'Two-factor authentication disabled'**
  String get totpDisableSuccess;

  /// Title for backup codes sheet.
  ///
  /// In en, this message translates to:
  /// **'Backup Codes'**
  String get backupCodesTitle;

  /// Warning about backup codes.
  ///
  /// In en, this message translates to:
  /// **'If you lose access to your authenticator app and don\'t have these codes, you will be permanently locked out of your account. Download or copy them now and store them somewhere safe.'**
  String get backupCodesWarning;

  /// Button to download backup codes.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get backupCodesDownload;

  /// Button to copy backup codes.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get backupCodesCopy;

  /// Toast after codes copied.
  ///
  /// In en, this message translates to:
  /// **'Backup codes copied to clipboard'**
  String get backupCodesCopied;

  /// Acknowledgement checkbox text.
  ///
  /// In en, this message translates to:
  /// **'I have downloaded or copied my backup codes and stored them in a safe place.'**
  String get backupCodesAcknowledge;

  /// Button to close backup codes sheet.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get backupCodesDone;

  /// Title for viewing existing backup codes.
  ///
  /// In en, this message translates to:
  /// **'View Backup Codes'**
  String get backupCodesViewTitle;

  /// Description for view backup codes.
  ///
  /// In en, this message translates to:
  /// **'Verification may be required before viewing your backup codes.'**
  String get backupCodesViewDescription;

  /// Title for phone add sheet.
  ///
  /// In en, this message translates to:
  /// **'Add Phone Number'**
  String get phoneAddTitle;

  /// Label for phone input.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneAddLabel;

  /// Hint for phone input.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get phoneAddHint;

  /// Footer text for phone input.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number. We\'ll send you a verification code via SMS.'**
  String get phoneAddFooter;

  /// Button to send phone verification code.
  ///
  /// In en, this message translates to:
  /// **'Send Code'**
  String get phoneAddSendCode;

  /// Title for phone verify step.
  ///
  /// In en, this message translates to:
  /// **'Verify Phone Number'**
  String get phoneVerifyTitle;

  /// Description for phone verify step.
  ///
  /// In en, this message translates to:
  /// **'Enter the verification code sent to your phone number.'**
  String get phoneVerifyDescription;

  /// Toast after phone added.
  ///
  /// In en, this message translates to:
  /// **'Phone number added'**
  String get phoneAddSuccess;

  /// Title for danger zone section.
  ///
  /// In en, this message translates to:
  /// **'Danger Zone'**
  String get dangerZoneSectionTitle;

  /// Description for danger zone section heading.
  ///
  /// In en, this message translates to:
  /// **'Irreversible and destructive actions'**
  String get dangerZoneSectionDescription;

  /// Title for account disable.
  ///
  /// In en, this message translates to:
  /// **'Disable Account'**
  String get dangerZoneDisableTitle;

  /// Description for account disable.
  ///
  /// In en, this message translates to:
  /// **'Temporarily disable your account. You can reactivate it later by signing back in.'**
  String get dangerZoneDisableDescription;

  /// Confirmation description for account disable.
  ///
  /// In en, this message translates to:
  /// **'Disabling your account will log you out of all sessions. You can re-enable your account at any time by logging in again.'**
  String get dangerZoneDisableConfirmDescription;

  /// Title for account delete.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get dangerZoneDeleteTitle;

  /// Description for account delete.
  ///
  /// In en, this message translates to:
  /// **'Permanently delete your account and all associated data. This action cannot be undone.'**
  String get dangerZoneDeleteDescription;

  /// Warning about active subscription before deletion.
  ///
  /// In en, this message translates to:
  /// **'Cancel your active Plutonium subscription in Plutonium settings before deleting your account.'**
  String get dangerZoneDeleteCancelSubscription;

  /// Confirmation description for account delete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account? This action will schedule your account for permanent deletion.'**
  String get dangerZoneDeleteConfirmDescription;

  /// First bullet point in delete confirmation.
  ///
  /// In en, this message translates to:
  /// **'You can cancel the deletion process within 14 days'**
  String get dangerZoneDeleteBullet1;

  /// Second bullet point.
  ///
  /// In en, this message translates to:
  /// **'After 14 days, your account will be permanently deleted'**
  String get dangerZoneDeleteBullet2;

  /// Third bullet point.
  ///
  /// In en, this message translates to:
  /// **'Once deletion is processed, you cannot recover access to your account'**
  String get dangerZoneDeleteBullet3;

  /// Fourth bullet point.
  ///
  /// In en, this message translates to:
  /// **'You will not be able to delete your sent messages after your account is deleted'**
  String get dangerZoneDeleteBullet4;

  /// Disclaimer about data export before deletion.
  ///
  /// In en, this message translates to:
  /// **'If you want to export your data or delete your messages first, please visit the Privacy Dashboard section in User Settings before proceeding.'**
  String get dangerZoneDeleteDisclaimer;

  /// Title for claim account sheet.
  ///
  /// In en, this message translates to:
  /// **'Claim Your Account'**
  String get claimAccountTitle;

  /// Description for claim account sheet.
  ///
  /// In en, this message translates to:
  /// **'Claim your account by adding an email and password. We will send a verification code to confirm your email before finishing.'**
  String get claimAccountDescription;

  /// Label for email input in claim account.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get claimAccountEmailLabel;

  /// Label for password input in claim account.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get claimAccountPasswordLabel;

  /// Button to send verification code.
  ///
  /// In en, this message translates to:
  /// **'Send Code'**
  String get claimAccountSendCode;

  /// Description for verify step.
  ///
  /// In en, this message translates to:
  /// **'Enter the code we sent to your email to verify it. Your password will be set once the code is confirmed.'**
  String get claimAccountVerifyDescription;

  /// Toast after account claimed.
  ///
  /// In en, this message translates to:
  /// **'Account claimed successfully'**
  String get claimAccountSuccess;

  /// Header for important information section.
  ///
  /// In en, this message translates to:
  /// **'Important information:'**
  String get importantInformation;

  /// Generic fallback error message.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get genericError;

  /// Error message when a verification code is invalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid code'**
  String get invalidCode;

  /// Relative time in years.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 year ago} other{{count} years ago}}'**
  String relativeTimeYears(int count);

  /// Relative time in months.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 month ago} other{{count} months ago}}'**
  String relativeTimeMonths(int count);

  /// Relative time in days.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 day ago} other{{count} days ago}}'**
  String relativeTimeDays(int count);

  /// Relative time in hours.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 hour ago} other{{count} hours ago}}'**
  String relativeTimeHours(int count);

  /// Relative time in minutes.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 minute ago} other{{count} minutes ago}}'**
  String relativeTimeMinutes(int count);

  /// Relative time for very recent events.
  ///
  /// In en, this message translates to:
  /// **'just now'**
  String get relativeTimeJustNow;

  /// Title for the Authorized Applications settings section.
  ///
  /// In en, this message translates to:
  /// **'Authorized Applications'**
  String get authorizedAppsTitle;

  /// Description under the Authorized Applications section title.
  ///
  /// In en, this message translates to:
  /// **'These applications have been granted access to your Fluxer account.'**
  String get authorizedAppsDescription;

  /// Title shown when the user has no authorized OAuth2 applications.
  ///
  /// In en, this message translates to:
  /// **'No Authorized Applications'**
  String get authorizedAppsEmptyTitle;

  /// Body text shown when the user has no authorized OAuth2 applications.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t authorized any applications to access your account.'**
  String get authorizedAppsEmptyDescription;

  /// Error message shown when loading authorized applications fails.
  ///
  /// In en, this message translates to:
  /// **'Failed to Load Authorized Applications'**
  String get authorizedAppsLoadError;

  /// Shows when an application was authorized.
  ///
  /// In en, this message translates to:
  /// **'Authorized on {date}'**
  String authorizedAppsAuthorizedOn(String date);

  /// Subsection label listing OAuth2 scopes granted to an application.
  ///
  /// In en, this message translates to:
  /// **'Permissions granted'**
  String get authorizedAppsPermissionsGranted;

  /// Button label to revoke an authorized application's access.
  ///
  /// In en, this message translates to:
  /// **'Revoke'**
  String get authorizedAppsRevoke;

  /// Confirmation modal title when revoking an authorized application.
  ///
  /// In en, this message translates to:
  /// **'Revoke application access'**
  String get authorizedAppsRevokeTitle;

  /// Confirmation modal body when revoking an authorized application.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to revoke access for {appName}? This application will no longer have access to your account.'**
  String authorizedAppsRevokeDescription(String appName);

  /// OAuth2 scope description: identify.
  ///
  /// In en, this message translates to:
  /// **'Access your basic profile information (username, avatar, etc.)'**
  String get authorizedAppsScopeIdentify;

  /// OAuth2 scope description: email.
  ///
  /// In en, this message translates to:
  /// **'View your email address'**
  String get authorizedAppsScopeEmail;

  /// OAuth2 scope description: guilds.
  ///
  /// In en, this message translates to:
  /// **'View the communities you are a member of'**
  String get authorizedAppsScopeGuilds;

  /// OAuth2 scope description: connections.
  ///
  /// In en, this message translates to:
  /// **'View your connected accounts'**
  String get authorizedAppsScopeConnections;

  /// OAuth2 scope description: bot.
  ///
  /// In en, this message translates to:
  /// **'Add a bot to a community with requested permissions'**
  String get authorizedAppsScopeBot;

  /// OAuth2 scope description: admin.
  ///
  /// In en, this message translates to:
  /// **'Access administrative endpoints'**
  String get authorizedAppsScopeAdmin;

  /// Title of the warning alert shown when a bulk message deletion is pending.
  ///
  /// In en, this message translates to:
  /// **'Pending Deletion'**
  String get privacyPendingDeletionTitle;

  /// Header title of the Blocked Users settings page.
  ///
  /// In en, this message translates to:
  /// **'Blocked Users'**
  String get blockedUsersTitle;

  /// Subtitle under the Blocked Users header.
  ///
  /// In en, this message translates to:
  /// **'Blocked users can\'t send you friend requests or message you directly.'**
  String get blockedUsersDescription;

  /// Empty state title shown when the user has not blocked anyone.
  ///
  /// In en, this message translates to:
  /// **'No Blocked Users'**
  String get blockedUsersEmptyTitle;

  /// Empty state description for blocked users.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t blocked anyone yet.'**
  String get blockedUsersEmptyDescription;

  /// Error message shown when blocked users fail to load.
  ///
  /// In en, this message translates to:
  /// **'Failed to Load Blocked Users'**
  String get blockedUsersLoadError;

  /// Button label that unblocks a user.
  ///
  /// In en, this message translates to:
  /// **'Unblock'**
  String get blockedUsersUnblock;

  /// Title of the bottom sheet that confirms unblocking a user.
  ///
  /// In en, this message translates to:
  /// **'Unblock User'**
  String get blockedUsersUnblockTitle;

  /// Body of the unblock confirmation sheet.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to unblock {username}?'**
  String blockedUsersUnblockDescription(String username);

  /// Context menu item that copies the user's tag.
  ///
  /// In en, this message translates to:
  /// **'Copy FluxerTag'**
  String get blockedUsersCopyTag;

  /// Context menu item that copies the user's ID.
  ///
  /// In en, this message translates to:
  /// **'Copy User ID'**
  String get blockedUsersCopyId;

  /// Empty-state title shown when the user profile sheet fails to fetch.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load profile'**
  String get userProfileLoadError;

  /// Retry button on the profile load-error state.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get userProfileRetry;

  /// Action card label that opens a DM with the user.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get userProfileMessage;

  /// Action card label shown on the current user's own profile sheet.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get userProfileEditProfile;

  /// Title of the confirmation sheet shown when opening a DM with a blocked user.
  ///
  /// In en, this message translates to:
  /// **'Open DM'**
  String get userProfileOpenBlockedDmTitle;

  /// Body of the open-DM-while-blocked confirmation.
  ///
  /// In en, this message translates to:
  /// **'You blocked {username}. You won\'t be able to send messages unless you unblock them.'**
  String userProfileOpenBlockedDmDescription(String username);

  /// Primary button label on the open-DM-while-blocked confirmation.
  ///
  /// In en, this message translates to:
  /// **'Open DM'**
  String get userProfileOpenDm;

  /// Note section title on the profile sheet.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get userProfileNoteTitle;

  /// Subtitle clarifying the note is private.
  ///
  /// In en, this message translates to:
  /// **'(only visible to you)'**
  String get userProfileNoteVisibility;

  /// Save button in the note editor sheet.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get userProfileNoteSave;

  /// Delete button in the note editor sheet.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get userProfileNoteDelete;

  /// Hint text when no note has been written yet.
  ///
  /// In en, this message translates to:
  /// **'Click to add a note'**
  String get userProfileNoteEmpty;

  /// Header of the member-since section in the bio card.
  ///
  /// In en, this message translates to:
  /// **'Member Since'**
  String get userProfileMemberSince;

  /// Header of the bio section in the bio card.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get userProfileAboutMe;

  /// Three-dot menu item: copy username#discriminator to clipboard.
  ///
  /// In en, this message translates to:
  /// **'Copy Username'**
  String get userProfileCopyUsername;

  /// Three-dot menu item: copy user snowflake to clipboard.
  ///
  /// In en, this message translates to:
  /// **'Copy User ID'**
  String get userProfileCopyUserId;

  /// Three-dot menu item to block the user.
  ///
  /// In en, this message translates to:
  /// **'Block User'**
  String get userProfileBlockUser;

  /// Three-dot menu item to unblock the user.
  ///
  /// In en, this message translates to:
  /// **'Unblock User'**
  String get userProfileUnblockUser;

  /// Three-dot menu item to remove the friendship.
  ///
  /// In en, this message translates to:
  /// **'Remove Friend'**
  String get userProfileRemoveFriend;

  /// Confirmation sheet title before blocking a user.
  ///
  /// In en, this message translates to:
  /// **'Block User'**
  String get userProfileBlockConfirmTitle;

  /// Confirmation sheet body before blocking a user.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to block {username}?'**
  String userProfileBlockConfirmDescription(String username);

  /// Confirmation sheet title before unblocking a user.
  ///
  /// In en, this message translates to:
  /// **'Unblock User'**
  String get userProfileUnblockConfirmTitle;

  /// Confirmation sheet body before unblocking a user.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to unblock {username}?'**
  String userProfileUnblockConfirmDescription(String username);

  /// Confirmation sheet title before removing a friend.
  ///
  /// In en, this message translates to:
  /// **'Remove Friend'**
  String get userProfileRemoveFriendConfirmTitle;

  /// Confirmation sheet body before removing a friend.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove {username} as a friend?'**
  String userProfileRemoveFriendConfirmDescription(String username);

  /// Toast shown when opening a DM channel fails.
  ///
  /// In en, this message translates to:
  /// **'Failed to open DM'**
  String get userProfileFailedOpenDm;

  /// Toast shown when saving the user note fails.
  ///
  /// In en, this message translates to:
  /// **'Failed to save note'**
  String get userProfileFailedSaveNote;

  /// Toast shown when a relationship action (block, unblock, friend request, etc.) fails.
  ///
  /// In en, this message translates to:
  /// **'Action failed, please try again'**
  String get userProfileActionFailed;

  /// Typing indicator shown above the chat input when exactly one other user is typing.
  ///
  /// In en, this message translates to:
  /// **'{name} is typing...'**
  String typingIndicatorOne(String name);

  /// Typing indicator shown above the chat input when two other users are typing.
  ///
  /// In en, this message translates to:
  /// **'{name1} and {name2} are typing...'**
  String typingIndicatorTwo(String name1, String name2);

  /// Typing indicator shown above the chat input when three other users are typing.
  ///
  /// In en, this message translates to:
  /// **'{name1}, {name2} and {name3} are typing...'**
  String typingIndicatorThree(String name1, String name2, String name3);

  /// Typing indicator shown when exactly four other users are typing.
  ///
  /// In en, this message translates to:
  /// **'Multiple people are typing...'**
  String get typingIndicatorMultiple;

  /// Typing indicator shown when 5-9 other users are typing.
  ///
  /// In en, this message translates to:
  /// **'A handful of keyboard warriors are assembling...'**
  String get typingIndicatorHandful;

  /// Typing indicator shown when 10-14 other users are typing.
  ///
  /// In en, this message translates to:
  /// **'A symphony of clacking keys is underway...'**
  String get typingIndicatorSymphony;

  /// Typing indicator shown when 15-19 other users are typing.
  ///
  /// In en, this message translates to:
  /// **'It\'s a full-blown typing fiesta in here'**
  String get typingIndicatorFiesta;

  /// Typing indicator shown when 20 or more other users are typing.
  ///
  /// In en, this message translates to:
  /// **'Whoa, it\'s a typing apocalypse'**
  String get typingIndicatorApocalypse;

  /// Short-form relative time for events less than a minute ago.
  ///
  /// In en, this message translates to:
  /// **'now'**
  String get relativeTimeShortNow;

  /// Short-form relative time in minutes (e.g. '5m').
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1m} other{{count}m}}'**
  String relativeTimeShortMinutes(int count);

  /// Short-form relative time in hours (e.g. '2h').
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1h} other{{count}h}}'**
  String relativeTimeShortHours(int count);

  /// Short-form relative time in days (e.g. '3d').
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1d} other{{count}d}}'**
  String relativeTimeShortDays(int count);

  /// Short-form relative time in months (e.g. '2mo').
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1mo} other{{count}mo}}'**
  String relativeTimeShortMonths(int count);

  /// Short-form relative time in years (e.g. '2y').
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1y} other{{count}y}}'**
  String relativeTimeShortYears(int count);

  /// Heading for the Linked Devices settings page.
  ///
  /// In en, this message translates to:
  /// **'My Devices'**
  String get linkedDevicesTitle;

  /// Description shown under the Linked Devices heading.
  ///
  /// In en, this message translates to:
  /// **'See all devices that are currently logged into your account. Revoke any sessions that you don\'t recognize.'**
  String get linkedDevicesDescription;

  /// Group label for the session currently making the request.
  ///
  /// In en, this message translates to:
  /// **'Current Device'**
  String get linkedDevicesCurrentDevice;

  /// Group label for sessions other than the current one.
  ///
  /// In en, this message translates to:
  /// **'Other Devices'**
  String get linkedDevicesOtherDevices;

  /// Tooltip on the button that enables bulk-revoke selection mode.
  ///
  /// In en, this message translates to:
  /// **'Enter Selection Mode'**
  String get linkedDevicesEnterSelection;

  /// Tooltip on the button that disables bulk-revoke selection mode.
  ///
  /// In en, this message translates to:
  /// **'Exit Selection Mode'**
  String get linkedDevicesExitSelection;

  /// Tooltip on the select-all button while in selection mode.
  ///
  /// In en, this message translates to:
  /// **'Select All'**
  String get linkedDevicesSelectAll;

  /// Tooltip on the clear-selection button while in selection mode.
  ///
  /// In en, this message translates to:
  /// **'Clear Selection'**
  String get linkedDevicesClearSelection;

  /// Tooltip on the per-card X button that opens the single-revoke sheet.
  ///
  /// In en, this message translates to:
  /// **'Revoke device'**
  String get linkedDevicesRevokeTooltip;

  /// Label for the bulk action when no selection is active.
  ///
  /// In en, this message translates to:
  /// **'Sign out all other devices'**
  String get linkedDevicesSignOutAll;

  /// Label for the bulk action button when devices are selected.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Sign out 1 device} other{Sign out {count} devices}}'**
  String linkedDevicesSignOutN(int count);

  /// Title of the confirmation bottom sheet for selected devices (same wording as the button label but used as a heading).
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Sign out 1 device} other{Sign out {count} devices}}'**
  String linkedDevicesSignOutSheetTitle(int count);

  /// Title of the confirmation bottom sheet when revoking all other devices.
  ///
  /// In en, this message translates to:
  /// **'Sign out all other devices'**
  String get linkedDevicesSignOutAllSheetTitle;

  /// Body of the confirmation bottom sheet for selected devices.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{This will log out the selected device from your account. You will need to log in again on that device.} other{This will log out the selected devices from your account. You will need to log in again on those devices.}}'**
  String linkedDevicesSignOutSheetDescription(int count);

  /// Body of the confirmation bottom sheet when revoking all other devices.
  ///
  /// In en, this message translates to:
  /// **'This will log out the selected devices from your account. You will need to log in again on those devices.'**
  String get linkedDevicesSignOutAllSheetDescription;

  /// Destructive confirm button inside the sign-out bottom sheet.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get linkedDevicesSignOutConfirm;

  /// Disclaimer shown beneath the bulk-action button.
  ///
  /// In en, this message translates to:
  /// **'You\'ll have to log back in on all logged out devices'**
  String get linkedDevicesLogoutDisclaimer;

  /// Title shown when loading the sessions list fails.
  ///
  /// In en, this message translates to:
  /// **'Network Error'**
  String get linkedDevicesLoadErrorTitle;

  /// Body shown when loading the sessions list fails.
  ///
  /// In en, this message translates to:
  /// **'We\'re having trouble connecting to the space-time continuum. Please check your connection and try again.'**
  String get linkedDevicesLoadErrorDescription;

  /// Toast shown after successfully signing devices out.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Device revoked} other{Device revoked}}'**
  String linkedDevicesRevokeSuccess(int count);

  /// Toast shown when the sign-out request fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t sign out. Try again.'**
  String get linkedDevicesRevokeError;

  /// Fallback shown when the session's OS field is missing.
  ///
  /// In en, this message translates to:
  /// **'Unknown OS'**
  String get linkedDevicesUnknownOs;

  /// Fallback shown when the session's platform field is missing.
  ///
  /// In en, this message translates to:
  /// **'Unknown Platform'**
  String get linkedDevicesUnknownPlatform;

  /// Label shown in the slowmode indicator pill when slowmode is enabled for the channel but no cooldown is actively counting down.
  ///
  /// In en, this message translates to:
  /// **'{duration} slowmode'**
  String slowmodeLabel(String duration);

  /// Tooltip shown on the slowmode indicator while the current user is still serving their slowmode cooldown.
  ///
  /// In en, this message translates to:
  /// **'You are in slowmode. Please wait before sending another message.'**
  String get slowmodeTooltipActive;

  /// Tooltip shown on the slowmode indicator when slowmode is on but the current user bypasses it.
  ///
  /// In en, this message translates to:
  /// **'Slowmode is enabled, but you are immune.'**
  String get slowmodeTooltipImmune;

  /// Placeholder text in the channel message input when the user lacks Send Messages permission.
  ///
  /// In en, this message translates to:
  /// **'You do not have permission to send messages'**
  String get channelNoSendPermissionHint;

  /// Title of the Connections settings page.
  ///
  /// In en, this message translates to:
  /// **'Connections'**
  String get connectionsTitle;

  /// Description shown under the Connections settings page title.
  ///
  /// In en, this message translates to:
  /// **'Link external accounts and domains to your Fluxer profile. Verified connections will be displayed on your profile for others to see.'**
  String get connectionsDescription;

  /// Empty-state title when the user has no connections.
  ///
  /// In en, this message translates to:
  /// **'No connections yet'**
  String get connectionsEmptyTitle;

  /// Empty-state description when Bluesky is enabled.
  ///
  /// In en, this message translates to:
  /// **'Link your Bluesky account or verify domain ownership to display them on your profile.'**
  String get connectionsEmptyDescriptionBluesky;

  /// Empty-state description when Bluesky is disabled.
  ///
  /// In en, this message translates to:
  /// **'Verify domain ownership to display it on your profile.'**
  String get connectionsEmptyDescriptionDomainOnly;

  /// Label on the Bluesky add-connection tile.
  ///
  /// In en, this message translates to:
  /// **'Bluesky'**
  String get connectionsAddBluesky;

  /// Label on the Domain add-connection tile.
  ///
  /// In en, this message translates to:
  /// **'Domain'**
  String get connectionsAddDomain;

  /// Semantic label for the Bluesky add-connection tile.
  ///
  /// In en, this message translates to:
  /// **'Add Bluesky connection'**
  String get connectionsAddBlueskyAriaLabel;

  /// Semantic label for the Domain add-connection tile.
  ///
  /// In en, this message translates to:
  /// **'Add domain connection'**
  String get connectionsAddDomainAriaLabel;

  /// Label for the edit button on a connection card.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get connectionEdit;

  /// Label for the remove button on a connection card.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get connectionRemove;

  /// Semantic label / tooltip for the verified badge on a connection card.
  ///
  /// In en, this message translates to:
  /// **'This connection has been verified.'**
  String get connectionVerifiedLabel;

  /// Semantic label / tooltip for the unverified badge on a connection card.
  ///
  /// In en, this message translates to:
  /// **'This connection has not been verified.'**
  String get connectionUnverifiedLabel;

  /// Title of the add-connection bottom sheet (step 1).
  ///
  /// In en, this message translates to:
  /// **'Add Connection'**
  String get connectionAddTitle;

  /// Label for the connection-type select in the add-connection sheet.
  ///
  /// In en, this message translates to:
  /// **'Connection Type'**
  String get connectionTypeLabel;

  /// Input field label when adding a Bluesky connection.
  ///
  /// In en, this message translates to:
  /// **'Handle'**
  String get connectionHandleLabel;

  /// Input field label when adding a domain connection.
  ///
  /// In en, this message translates to:
  /// **'Domain'**
  String get connectionDomainLabel;

  /// Placeholder text for the Bluesky handle input.
  ///
  /// In en, this message translates to:
  /// **'username.bsky.social'**
  String get connectionHandlePlaceholder;

  /// Placeholder text for the domain input.
  ///
  /// In en, this message translates to:
  /// **'example.com'**
  String get connectionDomainPlaceholder;

  /// Inline error shown when the identifier is already in the user's connections list.
  ///
  /// In en, this message translates to:
  /// **'You already have this connection.'**
  String get connectionAlreadyExists;

  /// Primary button label on the add-connection sheet when Bluesky is selected.
  ///
  /// In en, this message translates to:
  /// **'Connect with Bluesky'**
  String get connectionConnectBluesky;

  /// Primary button label on the add-connection sheet for the domain flow.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get connectionContinue;

  /// Title of the verify-connection bottom sheet (step 2).
  ///
  /// In en, this message translates to:
  /// **'Verify Connection'**
  String get connectionVerifyTitle;

  /// Instructional text at the top of the domain verification step.
  ///
  /// In en, this message translates to:
  /// **'Use the record below to prove domain ownership.'**
  String get connectionVerifyInstructions;

  /// Title of the DNS TXT record card.
  ///
  /// In en, this message translates to:
  /// **'DNS TXT record'**
  String get connectionDnsRecordTitle;

  /// Label for the DNS record host field.
  ///
  /// In en, this message translates to:
  /// **'Host'**
  String get connectionDnsHostLabel;

  /// Label for the DNS record value field.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get connectionDnsValueLabel;

  /// Accessible label for the host copy button.
  ///
  /// In en, this message translates to:
  /// **'Copy host'**
  String get connectionCopyHost;

  /// Accessible label for the value copy button.
  ///
  /// In en, this message translates to:
  /// **'Copy value'**
  String get connectionCopyValue;

  /// Short feedback text shown on copy buttons after successful copy.
  ///
  /// In en, this message translates to:
  /// **'Copied!'**
  String get connectionCopied;

  /// Title of the token-file section in the verify step.
  ///
  /// In en, this message translates to:
  /// **'Serve the token file'**
  String get connectionTokenFileTitle;

  /// Explanatory text for the token-file step. **bold markers** indicate inline-code styling applied by the widget.
  ///
  /// In en, this message translates to:
  /// **'Download **fluxer-verification** and place it in your **.well-known** folder so we can validate the domain.'**
  String get connectionTokenFileDescription;

  /// Label on the download button for the verification token file.
  ///
  /// In en, this message translates to:
  /// **'Download fluxer-verification'**
  String get connectionTokenFileDownload;

  /// Meta text below the download button with the fetch URL. **markers** indicate inline-code styling.
  ///
  /// In en, this message translates to:
  /// **'The file contains the verification token we will fetch from **{dnsUrl}**.'**
  String connectionTokenFileMeta(String dnsUrl);

  /// Title of the save-file dialog opened by the download button.
  ///
  /// In en, this message translates to:
  /// **'Save fluxer-verification'**
  String get connectionSaveTokenDialogTitle;

  /// Primary button on the verify step.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get connectionVerifyButton;

  /// Secondary button on the verify step that returns to step 1.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get connectionBack;

  /// Title of the edit-connection bottom sheet.
  ///
  /// In en, this message translates to:
  /// **'Edit Connection'**
  String get connectionEditTitle;

  /// Description at the top of the edit-connection sheet.
  ///
  /// In en, this message translates to:
  /// **'Choose who can see this connection on your profile.'**
  String get connectionEditDescription;

  /// Label for the Everyone visibility toggle.
  ///
  /// In en, this message translates to:
  /// **'Everyone'**
  String get connectionVisibilityEveryone;

  /// Description under the Everyone visibility toggle.
  ///
  /// In en, this message translates to:
  /// **'Allow anyone to see this connection on your profile'**
  String get connectionVisibilityEveryoneDesc;

  /// Label for the Friends visibility toggle.
  ///
  /// In en, this message translates to:
  /// **'Friends'**
  String get connectionVisibilityFriends;

  /// Description under the Friends visibility toggle.
  ///
  /// In en, this message translates to:
  /// **'Allow your friends to see this connection'**
  String get connectionVisibilityFriendsDesc;

  /// Label for the Community Members visibility toggle.
  ///
  /// In en, this message translates to:
  /// **'Community Members'**
  String get connectionVisibilityCommunityMembers;

  /// Description under the Community Members visibility toggle.
  ///
  /// In en, this message translates to:
  /// **'Allow members from communities you\'re in to see this connection'**
  String get connectionVisibilityCommunityMembersDesc;

  /// Title of the remove-connection confirmation sheet.
  ///
  /// In en, this message translates to:
  /// **'Remove Connection'**
  String get connectionRemoveTitle;

  /// Body text of the remove-connection confirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove this connection? This action cannot be undone.'**
  String get connectionRemoveDescription;

  /// Primary (danger) button on the remove-connection sheet.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get connectionRemoveConfirm;

  /// Error message shown when the connections list fails to load.
  ///
  /// In en, this message translates to:
  /// **'Failed to load connections'**
  String get connectionsLoadError;

  /// Toast message when the reorder PATCH request fails.
  ///
  /// In en, this message translates to:
  /// **'Failed to update order'**
  String get connectionsReorderError;

  /// Error message shown in the add-connection sheet when the initiate request fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t start verification. Try again.'**
  String get connectionInitiateFailed;

  /// Error message shown in the verify step when the verify request fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t verify. Check your DNS record and try again.'**
  String get connectionVerifyFailed;

  /// Error shown when the Bluesky authorize endpoint or url_launcher fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t start Bluesky authorization.'**
  String get connectionBlueskyAuthorizeFailed;

  /// Toast shown when the visibility update fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t update connection'**
  String get connectionUpdateFailed;

  /// Toast shown when the delete request fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t remove connection'**
  String get connectionRemoveFailed;

  /// Toast shown after the token file is saved successfully.
  ///
  /// In en, this message translates to:
  /// **'Saved fluxer-verification'**
  String get connectionTokenSavedToast;

  /// Toast shown if saving the token file fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t save file'**
  String get connectionTokenSaveFailedToast;

  /// Inline error shown when the Bluesky handle input is empty.
  ///
  /// In en, this message translates to:
  /// **'Enter a Bluesky handle.'**
  String get connectionEnterHandle;

  /// Inline error shown when the domain input is empty.
  ///
  /// In en, this message translates to:
  /// **'Enter a domain.'**
  String get connectionEnterDomain;

  /// Title of the Look & Feel (Appearance) settings page.
  ///
  /// In en, this message translates to:
  /// **'Look & Feel'**
  String get lookAndFeelTitle;

  /// Section title for theme selection.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get lookAndFeelThemeSectionTitle;

  /// Section description for theme selection.
  ///
  /// In en, this message translates to:
  /// **'Choose between dark, coal, or light appearance.'**
  String get lookAndFeelThemeSectionDescription;

  /// Label on the dark theme swatch button.
  ///
  /// In en, this message translates to:
  /// **'Dark Theme'**
  String get lookAndFeelThemeDark;

  /// Label on the coal (pitch-black) theme swatch button.
  ///
  /// In en, this message translates to:
  /// **'Coal Theme'**
  String get lookAndFeelThemeCoal;

  /// Label on the light theme swatch button.
  ///
  /// In en, this message translates to:
  /// **'Light Theme'**
  String get lookAndFeelThemeLight;

  /// Label on the system (OS-driven) theme swatch button.
  ///
  /// In en, this message translates to:
  /// **'System Theme'**
  String get lookAndFeelThemeSystem;

  /// Toggle label — sync the selected theme to the user's other devices.
  ///
  /// In en, this message translates to:
  /// **'Sync theme across devices'**
  String get lookAndFeelSyncThemeAcrossDevicesLabel;

  /// Default description for the sync-theme-across-devices toggle.
  ///
  /// In en, this message translates to:
  /// **'When enabled, theme changes will sync to all your devices. When disabled, this device will use its own theme setting.'**
  String get lookAndFeelSyncThemeAcrossDevicesDescription;

  /// Description shown under the sync toggle when System theme is active and the toggle is therefore disabled.
  ///
  /// In en, this message translates to:
  /// **'System theme automatically disables sync to track your system\'s preference on this device.'**
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription;

  /// Toast message shown when the server PATCH for a theme change or sync toggle fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t sync theme to your account. Please try again.'**
  String get lookAndFeelThemeSyncFailed;

  /// Section title for the chat font size slider.
  ///
  /// In en, this message translates to:
  /// **'Chat Font Scaling'**
  String get lookAndFeelChatFontScalingTitle;

  /// Section description for the chat font size slider.
  ///
  /// In en, this message translates to:
  /// **'Adjust the font size in the chat area.'**
  String get lookAndFeelChatFontScalingDescription;

  /// Section title for interface customization.
  ///
  /// In en, this message translates to:
  /// **'Interface'**
  String get lookAndFeelInterfaceTitle;

  /// Section description for interface customization.
  ///
  /// In en, this message translates to:
  /// **'Customize interface elements and behaviors.'**
  String get lookAndFeelInterfaceDescription;

  /// Subsection title under Interface.
  ///
  /// In en, this message translates to:
  /// **'Channel list typing indicators'**
  String get lookAndFeelChannelTypingIndicatorsTitle;

  /// Subsection description for channel typing indicators.
  ///
  /// In en, this message translates to:
  /// **'Choose how typing indicators appear in the channel list when someone is typing in a channel.'**
  String get lookAndFeelChannelTypingIndicatorsDescription;

  /// Radio option label for showing the typing indicator with user avatars.
  ///
  /// In en, this message translates to:
  /// **'Typing Indicator + Avatars'**
  String get lookAndFeelChannelTypingIndicatorAvatarsName;

  /// Radio option description for typing indicator + avatars.
  ///
  /// In en, this message translates to:
  /// **'Show typing indicator with user avatars in the channel list'**
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription;

  /// Radio option label for typing indicator without avatars.
  ///
  /// In en, this message translates to:
  /// **'Typing Indicator Only'**
  String get lookAndFeelChannelTypingIndicatorOnlyName;

  /// Radio option description for typing indicator only.
  ///
  /// In en, this message translates to:
  /// **'Show just the typing indicator without avatars'**
  String get lookAndFeelChannelTypingIndicatorOnlyDescription;

  /// Radio option label for hiding the typing indicator entirely.
  ///
  /// In en, this message translates to:
  /// **'Hidden'**
  String get lookAndFeelChannelTypingIndicatorHiddenName;

  /// Radio option description for hidden typing indicators.
  ///
  /// In en, this message translates to:
  /// **'Don\'t show typing indicators in the channel list'**
  String get lookAndFeelChannelTypingIndicatorHiddenDescription;

  /// Toggle label — whether to also show the typing indicator on the currently viewed channel.
  ///
  /// In en, this message translates to:
  /// **'Show typing on selected channel'**
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel;

  /// Toggle description for show-typing-on-selected-channel.
  ///
  /// In en, this message translates to:
  /// **'When disabled (default), typing indicators won\'t appear on the channel you\'re currently viewing.'**
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription;

  /// Placeholder channel name shown in the typing-indicator preview card.
  ///
  /// In en, this message translates to:
  /// **'general'**
  String get lookAndFeelTypingIndicatorPreviewChannelName;

  /// Section title for keyboard shortcut hint visibility settings.
  ///
  /// In en, this message translates to:
  /// **'Keyboard Hints'**
  String get lookAndFeelKeyboardHintsTitle;

  /// Section description for keyboard shortcut hint visibility settings.
  ///
  /// In en, this message translates to:
  /// **'Control whether keyboard shortcut hints appear inside tooltips.'**
  String get lookAndFeelKeyboardHintsDescription;

  /// Toggle label — hide keyboard shortcut badges in tooltips.
  ///
  /// In en, this message translates to:
  /// **'Hide keyboard hints in tooltips'**
  String get lookAndFeelHideKeyboardHintsLabel;

  /// Toggle description for the hide-keyboard-hints switch.
  ///
  /// In en, this message translates to:
  /// **'When enabled, shortcut badges are hidden in tooltip popups.'**
  String get lookAndFeelHideKeyboardHintsDescription;

  /// Subsection title under Interface — voice channel join behavior.
  ///
  /// In en, this message translates to:
  /// **'Voice channel join behavior'**
  String get lookAndFeelVoiceChannelJoinTitle;

  /// Subsection description for voice channel join behavior.
  ///
  /// In en, this message translates to:
  /// **'Control how you join voice channels in communities.'**
  String get lookAndFeelVoiceChannelJoinDescription;

  /// Toggle label — require double-click to join voice channels.
  ///
  /// In en, this message translates to:
  /// **'Require double-click to join voice channels'**
  String get lookAndFeelRequireDoubleClickJoinLabel;

  /// Toggle description for the require-double-click voice channel join switch.
  ///
  /// In en, this message translates to:
  /// **'When enabled, you\'ll need to double-click on voice channels to join them. When disabled (default), single-clicking will join the channel immediately.'**
  String get lookAndFeelRequireDoubleClickJoinDescription;

  /// Sample text rendered at the selected chat font size to preview scaling.
  ///
  /// In en, this message translates to:
  /// **'The quick brown fox jumps over the lazy dog.'**
  String get lookAndFeelChatFontPreviewSample;

  /// Subsection title under Interface — guild sidebar config.
  ///
  /// In en, this message translates to:
  /// **'Guild sidebar'**
  String get lookAndFeelGuildSidebarTitle;

  /// Subsection description for guild sidebar config.
  ///
  /// In en, this message translates to:
  /// **'Configure how the guild sidebar displays direct messages.'**
  String get lookAndFeelGuildSidebarDescription;

  /// Toggle label — collapse unread DMs into the Fluxer button folder.
  ///
  /// In en, this message translates to:
  /// **'Collapse DMs Into Folder'**
  String get lookAndFeelCollapseDMsLabel;

  /// Toggle description for the DM folder collapse behavior.
  ///
  /// In en, this message translates to:
  /// **'When enabled, unread DMs in the guild sidebar are collapsed into a folder on the Fluxer button. Click the Fluxer button while on the DMs page to expand or collapse the folder.'**
  String get lookAndFeelCollapseDMsDescription;

  /// Section title for channel list options.
  ///
  /// In en, this message translates to:
  /// **'Channel List'**
  String get lookAndFeelChannelListSectionTitle;

  /// Section description for channel list options.
  ///
  /// In en, this message translates to:
  /// **'Control unread indicator behavior for muted channels in channel lists.'**
  String get lookAndFeelChannelListSectionDescription;

  /// Toggle label — show a faded unread bar on muted channels.
  ///
  /// In en, this message translates to:
  /// **'Show unread indicator on muted channels'**
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel;

  /// Toggle description for faded unread on muted channels.
  ///
  /// In en, this message translates to:
  /// **'When enabled, muted channels show a faded unread indicator on the left side. Mentions still appear regardless of this setting.'**
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription;

  /// Section title for Active Now visibility.
  ///
  /// In en, this message translates to:
  /// **'Active Now'**
  String get lookAndFeelActiveNowSectionTitle;

  /// Section description for Active Now visibility.
  ///
  /// In en, this message translates to:
  /// **'Control how Active Now surfaces across the app.'**
  String get lookAndFeelActiveNowSectionDescription;

  /// Toggle label — show Active Now on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Show Active Now on the home screen'**
  String get lookAndFeelShowActiveNowLabel;

  /// Toggle description for show-active-now.
  ///
  /// In en, this message translates to:
  /// **'Show Active Now on the home screen to surface friends active in voice. You\'ll see a preview, the channel context, who\'s already there, and a quick way to join in.'**
  String get lookAndFeelShowActiveNowDescription;

  /// Section title for favorites visibility.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get lookAndFeelFavoritesSectionTitle;

  /// Section description for favorites visibility.
  ///
  /// In en, this message translates to:
  /// **'Control the visibility of favorites throughout the app.'**
  String get lookAndFeelFavoritesSectionDescription;

  /// Toggle label — enable the Favorites feature.
  ///
  /// In en, this message translates to:
  /// **'Enable Favorites'**
  String get lookAndFeelEnableFavoritesLabel;

  /// Toggle description for the Enable Favorites switch.
  ///
  /// In en, this message translates to:
  /// **'When enabled, you can favorite channels and they\'ll appear in the Favorites section. When disabled, all favorite-related UI elements (buttons, menu items) will be hidden. Your existing favorites will be preserved.'**
  String get lookAndFeelEnableFavoritesDescription;

  /// Top-level section title for message display settings.
  ///
  /// In en, this message translates to:
  /// **'Display'**
  String get messagesMediaDisplayGroupTitle;

  /// Top-level section description for message display settings.
  ///
  /// In en, this message translates to:
  /// **'Control how messages, media, and other content are displayed.'**
  String get messagesMediaDisplayGroupDescription;

  /// Top-level section title for media settings.
  ///
  /// In en, this message translates to:
  /// **'Media'**
  String get messagesMediaMediaGroupTitle;

  /// Top-level section description for media settings.
  ///
  /// In en, this message translates to:
  /// **'Customize media size preferences and buttons.'**
  String get messagesMediaMediaGroupDescription;

  /// Top-level section title for message input settings.
  ///
  /// In en, this message translates to:
  /// **'Input'**
  String get messagesMediaInputGroupTitle;

  /// Top-level section description for message input settings.
  ///
  /// In en, this message translates to:
  /// **'Customize message input settings.'**
  String get messagesMediaInputGroupDescription;

  /// Top-level section title for sidebar settings.
  ///
  /// In en, this message translates to:
  /// **'Sidebar'**
  String get messagesMediaSidebarGroupTitle;

  /// Top-level section description for sidebar settings.
  ///
  /// In en, this message translates to:
  /// **'Configure how the community sidebar is displayed.'**
  String get messagesMediaSidebarGroupDescription;

  /// Toggle label for hiding muted channels by default in new communities.
  ///
  /// In en, this message translates to:
  /// **'Hide muted channels by default'**
  String get messagesMediaDefaultHideMutedChannelsLabel;

  /// Toggle description for hiding muted channels by default in new communities.
  ///
  /// In en, this message translates to:
  /// **'Automatically hide muted channels in the sidebar when you join new communities'**
  String get messagesMediaDefaultHideMutedChannelsDescription;

  /// Confirmation title when enabling default hidden muted channels.
  ///
  /// In en, this message translates to:
  /// **'Hide muted channels by default?'**
  String get messagesMediaDefaultHideMutedChannelsEnableTitle;

  /// Confirmation description when enabling default hidden muted channels.
  ///
  /// In en, this message translates to:
  /// **'New communities you join will automatically have muted channels hidden. Would you also like to apply this setting to all your existing communities?'**
  String get messagesMediaDefaultHideMutedChannelsEnableDescription;

  /// Confirmation title when disabling default hidden muted channels.
  ///
  /// In en, this message translates to:
  /// **'Stop hiding muted channels by default?'**
  String get messagesMediaDefaultHideMutedChannelsDisableTitle;

  /// Confirmation description when disabling default hidden muted channels.
  ///
  /// In en, this message translates to:
  /// **'New communities you join will no longer have muted channels hidden automatically. Would you also like to show muted channels in all your existing communities?'**
  String get messagesMediaDefaultHideMutedChannelsDisableDescription;

  /// Primary confirmation action when enabling default hidden muted channels.
  ///
  /// In en, this message translates to:
  /// **'Apply to all communities'**
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction;

  /// Primary confirmation action when disabling default hidden muted channels.
  ///
  /// In en, this message translates to:
  /// **'Show in all communities'**
  String get messagesMediaDefaultHideMutedChannelsShowAllAction;

  /// Secondary confirmation action to only affect new communities.
  ///
  /// In en, this message translates to:
  /// **'New communities only'**
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction;

  /// Section title for media display settings.
  ///
  /// In en, this message translates to:
  /// **'Media Display'**
  String get messagesMediaDisplaySectionTitle;

  /// Section description for media display settings.
  ///
  /// In en, this message translates to:
  /// **'Control how images, videos and other media are shown. All media is resized and converted. Extremely large files that cannot be compressed into a preview will not embed regardless of these settings.'**
  String get messagesMediaDisplaySectionDescription;

  /// Toggle label for inlining media when posted as links.
  ///
  /// In en, this message translates to:
  /// **'When posted as links to chat'**
  String get messagesMediaDisplayInlineEmbedLabel;

  /// Toggle label for inlining media for direct uploads.
  ///
  /// In en, this message translates to:
  /// **'When uploaded directly to Fluxer'**
  String get messagesMediaDisplayInlineAttachmentLabel;

  /// Section title for link preview settings.
  ///
  /// In en, this message translates to:
  /// **'Link Previews'**
  String get messagesMediaLinkPreviewsSectionTitle;

  /// Section description for link preview settings.
  ///
  /// In en, this message translates to:
  /// **'Control how website links are previewed in chat'**
  String get messagesMediaLinkPreviewsSectionDescription;

  /// Toggle label for showing link embeds and previews.
  ///
  /// In en, this message translates to:
  /// **'Show embeds and preview website links'**
  String get messagesMediaLinkPreviewsToggleLabel;

  /// Section title for reactions settings.
  ///
  /// In en, this message translates to:
  /// **'Reactions'**
  String get messagesMediaReactionsSectionTitle;

  /// Section description for reactions settings.
  ///
  /// In en, this message translates to:
  /// **'Configure emoji reactions on messages'**
  String get messagesMediaReactionsSectionDescription;

  /// Toggle label for displaying emoji reactions.
  ///
  /// In en, this message translates to:
  /// **'Show emoji reactions on messages'**
  String get messagesMediaReactionsToggleLabel;

  /// Section title for spoiler content settings.
  ///
  /// In en, this message translates to:
  /// **'Spoiler Content'**
  String get messagesMediaSpoilersSectionTitle;

  /// Section description for spoiler content settings.
  ///
  /// In en, this message translates to:
  /// **'Control how spoiler content is displayed'**
  String get messagesMediaSpoilersSectionDescription;

  /// Subsection label above the spoiler reveal radio group.
  ///
  /// In en, this message translates to:
  /// **'Show spoiler content'**
  String get messagesMediaSpoilersRadioLabel;

  /// Spoiler reveal option — only show when tapped.
  ///
  /// In en, this message translates to:
  /// **'On click'**
  String get messagesMediaSpoilersOnClickName;

  /// Spoiler reveal option description for on-click.
  ///
  /// In en, this message translates to:
  /// **'Show spoiler content when clicked'**
  String get messagesMediaSpoilersOnClickDescription;

  /// Spoiler reveal option — auto-show in channels with Manage Messages.
  ///
  /// In en, this message translates to:
  /// **'In channels I moderate'**
  String get messagesMediaSpoilersIfModeratorName;

  /// Spoiler reveal option description for moderator-only auto-show.
  ///
  /// In en, this message translates to:
  /// **'Always show spoiler content in channels where you have the \"Manage Messages\" permission'**
  String get messagesMediaSpoilersIfModeratorDescription;

  /// Spoiler reveal option — always show spoilers.
  ///
  /// In en, this message translates to:
  /// **'Always'**
  String get messagesMediaSpoilersAlwaysName;

  /// Spoiler reveal option description for always-show.
  ///
  /// In en, this message translates to:
  /// **'Always show spoiler content'**
  String get messagesMediaSpoilersAlwaysDescription;

  /// Section title for media size preferences.
  ///
  /// In en, this message translates to:
  /// **'Media Size Preferences'**
  String get messagesMediaSizeSectionTitle;

  /// Section description for media size preferences.
  ///
  /// In en, this message translates to:
  /// **'Customize the maximum display size for embedded and attached media. Smaller sizes use less screen space, while larger sizes show more detail.'**
  String get messagesMediaSizeSectionDescription;

  /// Subsection label for embed media size.
  ///
  /// In en, this message translates to:
  /// **'Media from links (embeds)'**
  String get messagesMediaSizeEmbedLabel;

  /// Subsection label for attachment media size.
  ///
  /// In en, this message translates to:
  /// **'Uploaded attachments'**
  String get messagesMediaSizeAttachmentLabel;

  /// Media size option — small.
  ///
  /// In en, this message translates to:
  /// **'Compact (400x300)'**
  String get messagesMediaSizeCompactName;

  /// Description for the small media size option.
  ///
  /// In en, this message translates to:
  /// **'Smaller media size'**
  String get messagesMediaSizeCompactDescription;

  /// Media size option — large.
  ///
  /// In en, this message translates to:
  /// **'Comfortable (550x400)'**
  String get messagesMediaSizeComfortableName;

  /// Description for the large media size option.
  ///
  /// In en, this message translates to:
  /// **'Larger media size with more detail'**
  String get messagesMediaSizeComfortableDescription;

  /// Section title for GIF behavior.
  ///
  /// In en, this message translates to:
  /// **'GIF Behavior'**
  String get messagesMediaGifsSectionTitle;

  /// Section description for GIF behavior.
  ///
  /// In en, this message translates to:
  /// **'Control how GIFs are inserted into chat'**
  String get messagesMediaGifsSectionDescription;

  /// Toggle label for auto-sending GIFs from picker.
  ///
  /// In en, this message translates to:
  /// **'Automatically send GIFs when selected'**
  String get messagesMediaGifsAutoSendLabel;

  /// Section title for expression autocomplete settings.
  ///
  /// In en, this message translates to:
  /// **'Expression autocomplete (colon autocomplete)'**
  String get messagesMediaAutocompleteSectionTitle;

  /// Section description for expression autocomplete settings.
  ///
  /// In en, this message translates to:
  /// **'Control what appears in the expression autocomplete when you type colon. Customize what suggestions show up to match your preferences.'**
  String get messagesMediaAutocompleteSectionDescription;

  /// Toggle label for default emojis in expression autocomplete.
  ///
  /// In en, this message translates to:
  /// **'Show default emojis in expression autocomplete'**
  String get messagesMediaAutocompleteDefaultEmojisLabel;

  /// Toggle label for custom emojis in expression autocomplete.
  ///
  /// In en, this message translates to:
  /// **'Show custom emojis in expression autocomplete'**
  String get messagesMediaAutocompleteCustomEmojisLabel;

  /// Toggle label for stickers in expression autocomplete.
  ///
  /// In en, this message translates to:
  /// **'Show stickers in expression autocomplete'**
  String get messagesMediaAutocompleteStickersLabel;

  /// Toggle label for saved media in expression autocomplete.
  ///
  /// In en, this message translates to:
  /// **'Show saved media in expression autocomplete'**
  String get messagesMediaAutocompleteSavedMediaLabel;

  /// Section title for message editing settings.
  ///
  /// In en, this message translates to:
  /// **'Message Editing'**
  String get messagesMediaEditingSectionTitle;

  /// Section description for message editing settings.
  ///
  /// In en, this message translates to:
  /// **'Control what happens to your edit draft when you cancel.'**
  String get messagesMediaEditingSectionDescription;

  /// Toggle label for preserving edit drafts on cancel.
  ///
  /// In en, this message translates to:
  /// **'Preserve edit draft on cancel'**
  String get messagesMediaEditingPreserveDraftLabel;
  /// Title of the multi-device voice join confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'Voice Connection Confirmation'**
  String get voiceConnectionConfirmTitle;

  /// Body of the multi-device voice join confirmation; count is the number of other device connections.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{You\'re already connected to this voice channel from 1 other device. What would you like to do?} other{You\'re already connected to this voice channel from {count} other devices. What would you like to do?}}'**
  String voiceConnectionConfirmDescription(int count);

  /// Primary action: disconnect other devices and use this one.
  ///
  /// In en, this message translates to:
  /// **'Switch to This Device'**
  String get voiceConnectionConfirmSwitch;

  /// Secondary action: add this device without ending other sessions.
  ///
  /// In en, this message translates to:
  /// **'Just Join (Keep Other Connections)'**
  String get voiceConnectionConfirmJustJoin;

  /// Dismiss the dialog without joining voice.
  ///
  /// In en, this message translates to:
  /// **'Do nothing, I don\'t want to join'**
  String get voiceConnectionConfirmDoNothing;

  /// Empty state body when viewing a guild voice channel while not in the call.
  ///
  /// In en, this message translates to:
  /// **'This is a voice channel. Connect to start talking!'**
  String get voiceChannelEmptyDescription;

  /// Primary action to connect to a voice channel from the empty state.
  ///
  /// In en, this message translates to:
  /// **'Join Voice Channel'**
  String get voiceChannelJoin;

  /// Status in the in-page voice view while LiveKit is connecting.
  ///
  /// In en, this message translates to:
  /// **'Connecting…'**
  String get voiceChannelStatusConnecting;

  /// Status in the in-page voice view when the voice session is active.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get voiceChannelStatusConnected;

  /// Short label in the channel header when the voice session reports an error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get voiceChannelStatusError;

  /// Tooltip on the device icon in the voice participant nameplate when the connection is mobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile device'**
  String get voiceParticipantTooltipMobileDevice;

  /// Tooltip on the device icon in the voice participant nameplate when the connection is desktop.
  ///
  /// In en, this message translates to:
  /// **'Desktop device'**
  String get voiceParticipantTooltipDesktopDevice;

  /// Tooltip when the participant is muted by the community (server-side).
  ///
  /// In en, this message translates to:
  /// **'Community muted'**
  String get voiceParticipantTooltipCommunityMuted;

  /// Tooltip when the participant is self-muted.
  ///
  /// In en, this message translates to:
  /// **'Muted'**
  String get voiceParticipantTooltipMuted;

  /// Tooltip when the participant is deafened by the community (server-side).
  ///
  /// In en, this message translates to:
  /// **'Community deafened'**
  String get voiceParticipantTooltipCommunityDeafened;

  /// Tooltip when the participant is self-deafened.
  ///
  /// In en, this message translates to:
  /// **'Deafened'**
  String get voiceParticipantTooltipDeafened;

  /// Tooltip for the short connection id shown in the participant nameplate.
  ///
  /// In en, this message translates to:
  /// **'Connection: {connectionId}'**
  String voiceParticipantTooltipConnection(String connectionId);

  /// Participant count label in the guild voice channel in-call view.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 participant} other{{count} participants}}'**
  String voiceChannelParticipantCount(int count);

  /// Button to leave the voice call from the in-page voice view.
  ///
  /// In en, this message translates to:
  /// **'Leave'**
  String get voiceChannelLeave;

  /// Tooltip: mute the microphone in the voice call control bar.
  ///
  /// In en, this message translates to:
  /// **'Mute'**
  String get voiceControlMute;

  /// Tooltip: unmute the microphone in the voice call control bar.
  ///
  /// In en, this message translates to:
  /// **'Unmute'**
  String get voiceControlUnmute;

  /// Tooltip: deafen (mute + disable incoming audio) in the voice call control bar.
  ///
  /// In en, this message translates to:
  /// **'Deafen'**
  String get voiceControlDeafen;

  /// Tooltip: undeafen in the voice call control bar.
  ///
  /// In en, this message translates to:
  /// **'Undeafen'**
  String get voiceControlUndeafen;

  /// Tooltip: camera in the voice call control bar (when supported).
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get voiceControlVideo;

  /// Tooltip: share screen in the voice call control bar (when supported).
  ///
  /// In en, this message translates to:
  /// **'Screen share'**
  String get voiceControlScreenShare;

  /// Tooltip: more voice actions in the voice call control bar.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get voiceControlMore;

  /// Tooltip: leave the voice call in the voice call control bar.
  ///
  /// In en, this message translates to:
  /// **'Disconnect'**
  String get voiceControlDisconnect;

  /// Error when the user enables video but camera access is denied.
  ///
  /// In en, this message translates to:
  /// **'Camera permission is required for video.'**
  String get voiceCameraPermissionRequired;
}

class _FluxerLocalizationsDelegate
    extends LocalizationsDelegate<FluxerLocalizations> {
  const _FluxerLocalizationsDelegate();

  @override
  Future<FluxerLocalizations> load(Locale locale) {
    return SynchronousFuture<FluxerLocalizations>(
      lookupFluxerLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_FluxerLocalizationsDelegate old) => false;
}

FluxerLocalizations lookupFluxerLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return FluxerLocalizationsEn();
  }

  throw FlutterError(
    'FluxerLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
