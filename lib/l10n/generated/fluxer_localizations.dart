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

  /// Generic cancel action label.
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

  /// Generic back navigation label.
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
  /// **'Bot'**
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
