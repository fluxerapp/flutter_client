import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'fluxer_localizations_af.dart';
import 'fluxer_localizations_ar.dart';
import 'fluxer_localizations_cs.dart';
import 'fluxer_localizations_cy.dart';
import 'fluxer_localizations_da.dart';
import 'fluxer_localizations_de.dart';
import 'fluxer_localizations_el.dart';
import 'fluxer_localizations_en.dart';
import 'fluxer_localizations_es.dart';
import 'fluxer_localizations_et.dart';
import 'fluxer_localizations_fa.dart';
import 'fluxer_localizations_fi.dart';
import 'fluxer_localizations_fr.dart';
import 'fluxer_localizations_ga.dart';
import 'fluxer_localizations_gl.dart';
import 'fluxer_localizations_hu.dart';
import 'fluxer_localizations_is.dart';
import 'fluxer_localizations_it.dart';
import 'fluxer_localizations_ja.dart';
import 'fluxer_localizations_ko.dart';
import 'fluxer_localizations_lt.dart';
import 'fluxer_localizations_lv.dart';
import 'fluxer_localizations_nb.dart';
import 'fluxer_localizations_pl.dart';
import 'fluxer_localizations_pt.dart';
import 'fluxer_localizations_ru.dart';
import 'fluxer_localizations_sk.dart';
import 'fluxer_localizations_sl.dart';
import 'fluxer_localizations_sr.dart';
import 'fluxer_localizations_sv.dart';
import 'fluxer_localizations_th.dart';
import 'fluxer_localizations_tr.dart';
import 'fluxer_localizations_uk.dart';
import 'fluxer_localizations_zh.dart';

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
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('af'),
    Locale('ar'),
    Locale('cs'),
    Locale('cy'),
    Locale('da'),
    Locale('de'),
    Locale('de', 'CH'),
    Locale('el'),
    Locale('en', 'GB'),
    Locale('en', 'US'),
    Locale('es'),
    Locale('es', '419'),
    Locale('et'),
    Locale('fa'),
    Locale('fi'),
    Locale('fr'),
    Locale('fr', 'CA'),
    Locale('ga'),
    Locale('gl'),
    Locale('hu'),
    Locale('is'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('lt'),
    Locale('lv'),
    Locale('nb'),
    Locale('nb', 'NO'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('ru'),
    Locale('sk'),
    Locale('sl'),
    Locale('sr'),
    Locale('sv'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
  ];

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

  /// Toast shown when the gateway connection is lost and reconnecting.
  ///
  /// In en, this message translates to:
  /// **'Reconnecting…'**
  String get gatewayReconnectingToast;

  /// Toast shown when the gateway connection is restored.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get gatewayConnectedToast;

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

  /// Fallback headline on splash when gateway is unavailable (web parity).
  ///
  /// In en, this message translates to:
  /// **'Connection lost'**
  String get splashConnectionLost;

  /// Link under incident title on splash to open the status page.
  ///
  /// In en, this message translates to:
  /// **'View on status page'**
  String get splashViewOnStatusPage;

  /// Prompt above status links on splash after a long wait.
  ///
  /// In en, this message translates to:
  /// **'Connection issues?'**
  String get splashConnectionIssuesPrompt;

  /// Link label to the public service status site.
  ///
  /// In en, this message translates to:
  /// **'Status page'**
  String get splashStatusPageLink;

  /// Link label when an active incident exists.
  ///
  /// In en, this message translates to:
  /// **'Read incident'**
  String get splashReadIncident;

  /// Link label to incident history when no active incident.
  ///
  /// In en, this message translates to:
  /// **'Incident history'**
  String get splashIncidentHistory;

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

  /// Title shown when the IP authorization ticket has expired and the user must sign in again.
  ///
  /// In en, this message translates to:
  /// **'Sign-in link expired'**
  String get ipAuthLinkExpired;

  /// Body shown when the IP authorization ticket has expired.
  ///
  /// In en, this message translates to:
  /// **'This authorization link expired. Please sign in again.'**
  String get ipAuthLinkExpiredDescription;

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

  /// Title for the in-app account switcher sheet.
  ///
  /// In en, this message translates to:
  /// **'Manage accounts'**
  String get accountManageTitle;

  /// Error when switching accounts from the account switcher.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t switch accounts. Try again.'**
  String get accountSwitchFailed;

  /// Menu item to open the account switcher from the profile tab.
  ///
  /// In en, this message translates to:
  /// **'Switch accounts'**
  String get profileTabMenuSwitchAccounts;

  /// Title for the status change bottom sheet.
  ///
  /// In en, this message translates to:
  /// **'Set status'**
  String get statusChangeSheetTitle;

  /// Section header for presence status options.
  ///
  /// In en, this message translates to:
  /// **'Online status'**
  String get statusOnlineStatusSection;

  /// Online presence status label.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get statusOnline;

  /// Idle presence status label.
  ///
  /// In en, this message translates to:
  /// **'Idle'**
  String get statusIdle;

  /// Do not disturb presence status label.
  ///
  /// In en, this message translates to:
  /// **'Do not disturb'**
  String get statusDnd;

  /// Invisible presence status label.
  ///
  /// In en, this message translates to:
  /// **'Invisible'**
  String get statusInvisible;

  /// Offline presence status label.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get statusOffline;

  /// Presence status expiry option for a permanent status.
  ///
  /// In en, this message translates to:
  /// **'Until I change it'**
  String get statusUntilIChangeIt;

  /// Custom status expiry option to never auto-clear.
  ///
  /// In en, this message translates to:
  /// **'Don\'t clear'**
  String get statusDontClear;

  /// Presence status expiry option for 10 seconds.
  ///
  /// In en, this message translates to:
  /// **'For 10 seconds'**
  String get statusFor10Seconds;

  /// Custom status clear-after option for 10 seconds.
  ///
  /// In en, this message translates to:
  /// **'10 seconds'**
  String get statusClearAfter10Seconds;

  /// Custom status clear-after option for 15 minutes.
  ///
  /// In en, this message translates to:
  /// **'15 minutes'**
  String get statusClearAfter15Minutes;

  /// Custom status clear-after option for 30 minutes.
  ///
  /// In en, this message translates to:
  /// **'30 minutes'**
  String get statusClearAfter30Minutes;

  /// Custom status clear-after option for 1 hour.
  ///
  /// In en, this message translates to:
  /// **'1 hour'**
  String get statusClearAfter1Hour;

  /// Custom status clear-after option for 3 hours.
  ///
  /// In en, this message translates to:
  /// **'3 hours'**
  String get statusClearAfter3Hours;

  /// Custom status clear-after option for 4 hours.
  ///
  /// In en, this message translates to:
  /// **'4 hours'**
  String get statusClearAfter4Hours;

  /// Custom status clear-after option for 8 hours.
  ///
  /// In en, this message translates to:
  /// **'8 hours'**
  String get statusClearAfter8Hours;

  /// Custom status clear-after option for 24 hours.
  ///
  /// In en, this message translates to:
  /// **'24 hours'**
  String get statusClearAfter24Hours;

  /// Custom status clear-after option for 3 days.
  ///
  /// In en, this message translates to:
  /// **'3 days'**
  String get statusClearAfter3Days;

  /// Description shown for the do not disturb status option.
  ///
  /// In en, this message translates to:
  /// **'You won\'t receive notifications on desktop'**
  String get statusDndDescription;

  /// Description shown for the invisible status option.
  ///
  /// In en, this message translates to:
  /// **'You\'ll appear offline'**
  String get statusInvisibleDescription;

  /// Title for the custom status editor.
  ///
  /// In en, this message translates to:
  /// **'Set custom status'**
  String get customStatusSetTitle;

  /// Hint label for the current custom status row.
  ///
  /// In en, this message translates to:
  /// **'Custom status'**
  String get customStatusCurrentHint;

  /// Action to remove the current custom status.
  ///
  /// In en, this message translates to:
  /// **'Clear custom status'**
  String get customStatusClear;

  /// Placeholder for the custom status text field.
  ///
  /// In en, this message translates to:
  /// **'What\'s happening?'**
  String get customStatusPlaceholder;

  /// Button to pick an emoji for custom status.
  ///
  /// In en, this message translates to:
  /// **'Choose an emoji'**
  String get customStatusChooseEmoji;

  /// Label for the custom status expiry picker.
  ///
  /// In en, this message translates to:
  /// **'Clear after'**
  String get customStatusClearAfter;

  /// Button to save custom status changes.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get customStatusSave;

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

  /// Error shown on the login screen when the email and password combination is incorrect.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password.'**
  String get errorInvalidEmailOrPassword;

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

  /// Inline label shown on message jump links when the target channel is inaccessible.
  ///
  /// In en, this message translates to:
  /// **'No access'**
  String get messageJumpLinkNoAccess;

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

  /// Action label for unmuting a channel from the context menu.
  ///
  /// In en, this message translates to:
  /// **'Unmute Channel'**
  String get notificationUnmuteChannel;

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

  /// Title shown on the overlay when receiving a ringing voice call.
  ///
  /// In en, this message translates to:
  /// **'Incoming voice call'**
  String get incomingVoiceCallTitle;

  /// Button to answer an incoming ringing voice call.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get incomingVoiceCallAccept;

  /// Primary reject action on an incoming call (parity with web “Reject”).
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get incomingVoiceCallDecline;

  /// Short label above the avatar in the incoming call bottom sheet (web mobile parity).
  ///
  /// In en, this message translates to:
  /// **'Incoming call'**
  String get incomingVoiceCallLabel;

  /// Button to ignore ringing for the current account without rejecting for others.
  ///
  /// In en, this message translates to:
  /// **'Ignore'**
  String get incomingVoiceCallIgnore;

  /// Shown when the server reports outbound DM voice call isn't allowed (not ringable).
  ///
  /// In en, this message translates to:
  /// **'This call can\'t be started right now. Try again in a moment.'**
  String get directVoiceCallNotEligible;

  /// Snack when joining voice fails unexpectedly during outbound call start.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t connect to this call. Check your connection and try again.'**
  String get voiceJoinCallFailed;

  /// Snack when accepting an incoming ringing voice call fails to connect.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t join this call. Check your connection and try again.'**
  String get voiceJoinIncomingCallFailed;

  /// Snack when decline or ignore fails to notify the server about ringing.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t update this call on the server. Check your connection and try again.'**
  String get incomingVoiceRingingUpdateFailed;

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

  /// Mobile DM list header button to open the add friends sheet.
  ///
  /// In en, this message translates to:
  /// **'Add friends'**
  String get dmAddFriends;

  /// Title for the mobile add friends bottom sheet.
  ///
  /// In en, this message translates to:
  /// **'Add friend'**
  String get addFriendSheetTitle;

  /// Placeholder for the add friend username input.
  ///
  /// In en, this message translates to:
  /// **'Username#0000'**
  String get addFriendUsernameHint;

  /// Accessibility label for the add friend username input.
  ///
  /// In en, this message translates to:
  /// **'Friend\'s username'**
  String get addFriendUsernameLabel;

  /// Submit button on the add friend form.
  ///
  /// In en, this message translates to:
  /// **'Send request'**
  String get addFriendSendRequest;

  /// Error when no user matches the entered FluxerTag.
  ///
  /// In en, this message translates to:
  /// **'No user found with that username.'**
  String get addFriendNoUserFound;

  /// Error when the FluxerTag format is invalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid username (Username#0000).'**
  String get addFriendInvalidUsername;

  /// Success message after sending a friend request by tag.
  ///
  /// In en, this message translates to:
  /// **'Friend request sent'**
  String get addFriendOutgoingSuccess;

  /// Title when unclaimed users try to send friend requests.
  ///
  /// In en, this message translates to:
  /// **'Claim your account'**
  String get addFriendClaimTitle;

  /// Description when unclaimed users try to send friend requests.
  ///
  /// In en, this message translates to:
  /// **'Claim your account to send friend requests.'**
  String get addFriendClaimDescription;

  /// Title when unverified users try to send friend requests.
  ///
  /// In en, this message translates to:
  /// **'Verify your email'**
  String get addFriendVerifyTitle;

  /// Description when unverified users try to send friend requests.
  ///
  /// In en, this message translates to:
  /// **'You need to verify your email address before you can send friend requests.'**
  String get addFriendVerifyDescription;

  /// Button to open settings for email verification.
  ///
  /// In en, this message translates to:
  /// **'Verify email'**
  String get addFriendVerifyEmail;

  /// Section header for incoming friend requests in the add friend sheet.
  ///
  /// In en, this message translates to:
  /// **'Incoming friend requests ({count})'**
  String addFriendIncomingRequests(int count);

  /// Section header for outgoing friend requests in the add friend sheet.
  ///
  /// In en, this message translates to:
  /// **'Outgoing friend requests ({count})'**
  String addFriendOutgoingRequests(int count);

  /// Subtitle on an incoming friend request row in the add friend sheet.
  ///
  /// In en, this message translates to:
  /// **'Incoming friend request'**
  String get addFriendIncomingStatus;

  /// Subtitle on an outgoing friend request row in the add friend sheet.
  ///
  /// In en, this message translates to:
  /// **'Friend request sent'**
  String get addFriendOutgoingStatus;

  /// Menu action to open a user's profile from a friend request row.
  ///
  /// In en, this message translates to:
  /// **'View profile'**
  String get addFriendViewProfile;

  /// Menu action to accept an incoming friend request.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get addFriendAccept;

  /// Menu action to ignore an incoming friend request.
  ///
  /// In en, this message translates to:
  /// **'Ignore'**
  String get addFriendIgnore;

  /// Title for the accept friend request confirmation modal.
  ///
  /// In en, this message translates to:
  /// **'Accept friend request'**
  String get addFriendAcceptTitle;

  /// Title for the ignore friend request confirmation modal.
  ///
  /// In en, this message translates to:
  /// **'Ignore friend request'**
  String get addFriendIgnoreTitle;

  /// Confirmation body before accepting a friend request from the add friend sheet.
  ///
  /// In en, this message translates to:
  /// **'Accept the friend request from {userName}?'**
  String addFriendAcceptConfirmDescription(String userName);

  /// Confirmation body before ignoring a friend request from the add friend sheet.
  ///
  /// In en, this message translates to:
  /// **'Ignore the friend request from {displayName}?'**
  String addFriendIgnoreConfirmDescription(String displayName);

  /// Menu action to cancel an outgoing friend request.
  ///
  /// In en, this message translates to:
  /// **'Cancel request'**
  String get addFriendCancelRequest;

  /// Toast when canceling an outgoing friend request fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t cancel the friend request. Try again.'**
  String get addFriendCancelRequestFailed;

  /// Error when the target user has disabled friend requests.
  ///
  /// In en, this message translates to:
  /// **'They\'re not accepting friend requests right now.'**
  String get addFriendNotAcceptingRequests;

  /// Error when trying to friend a blocked user.
  ///
  /// In en, this message translates to:
  /// **'Unblock them first to send a friend request.'**
  String get addFriendUnblockFirst;

  /// Error when trying to friend yourself.
  ///
  /// In en, this message translates to:
  /// **'You can\'t send a friend request to yourself.'**
  String get addFriendCannotSendToSelf;

  /// Error when users are already friends.
  ///
  /// In en, this message translates to:
  /// **'You\'re already friends with this user.'**
  String get addFriendAlreadyFriends;

  /// Error when an unclaimed account tries to send a friend request.
  ///
  /// In en, this message translates to:
  /// **'Finish signing up to send friend requests.'**
  String get addFriendClaimToSend;

  /// Generic error when sending a friend request fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t send the friend request. Try again.'**
  String get addFriendSendFailedGeneric;

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

  /// Short right-side label in the chat composer emoji autocomplete shown for built-in (unicode) emoji; custom emoji show their guild name instead. Keep it concise.
  ///
  /// In en, this message translates to:
  /// **'Default emoji'**
  String get emojiAutocompleteDefaultLabel;

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

  /// Label for the setting that strips tracking parameters from URLs in outgoing messages.
  ///
  /// In en, this message translates to:
  /// **'Strip tracking parameters from URLs'**
  String get externalLinkStripTrackingLabel;

  /// Description for the setting that strips tracking parameters from URLs in outgoing messages.
  ///
  /// In en, this message translates to:
  /// **'Automatically remove tracking parameters (like utm_source, fbclid, gclid) from URLs in messages you send. Cleans the link before it reaches anyone else.'**
  String get externalLinkStripTrackingDescription;

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

  /// Action card label that starts a voice call with the user.
  ///
  /// In en, this message translates to:
  /// **'Voice Call'**
  String get userProfileVoiceCall;

  /// Action card label that starts a video call with the user.
  ///
  /// In en, this message translates to:
  /// **'Video Call'**
  String get userProfileVideoCall;

  /// Action card label shown on the current user's own profile sheet.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get userProfileEditProfile;

  /// Short badge title in the user profile badges popout. English locales use Title Case for official badge titles; other locales should use natural local capitalization.
  ///
  /// In en, this message translates to:
  /// **'Fluxer Staff'**
  String get userProfileStaffBadgeTooltip;

  /// Short badge title in the user profile badges popout. English locales use Title Case for official badge titles; other locales should use natural local capitalization.
  ///
  /// In en, this message translates to:
  /// **'Fluxer Community Team'**
  String get userProfileCtpBadgeTooltip;

  /// Short badge title in the user profile badges popout. English locales use Title Case for official badge titles; other locales should use natural local capitalization.
  ///
  /// In en, this message translates to:
  /// **'Fluxer Partner'**
  String get userProfilePartnerBadgeTooltip;

  /// Short badge title in the user profile badges popout. English locales use Title Case for official badge titles; other locales should use natural local capitalization.
  ///
  /// In en, this message translates to:
  /// **'Fluxer Bug Hunter'**
  String get userProfileBugHunterBadgeTooltip;

  /// Short badge title in the user profile badges popout. English locales use Title Case for official badge titles; other locales should use natural local capitalization.
  ///
  /// In en, this message translates to:
  /// **'Fluxer Plutonium'**
  String get userProfilePlutoniumBadgeTooltip;

  /// Badge label with a date in the user profile badges popout. Preserve {date}; it is inserted by code. In English, keep "subscriber since" lowercase. Other locales should use natural local capitalization.
  ///
  /// In en, this message translates to:
  /// **'Fluxer Plutonium subscriber since {date}'**
  String userProfilePlutoniumSubscriberSinceTooltip(String date);

  /// Short badge title in the user profile badges popout. English locales use Title Case for official badge titles; other locales should use natural local capitalization.
  ///
  /// In en, this message translates to:
  /// **'Fluxer Visionary'**
  String get userProfileVisionaryBadgeTooltip;

  /// Badge title with a date in the user profile badges popout. Preserve {date}; it is inserted by code. English locales use Title Case for the badge title part; other locales should use natural local capitalization.
  ///
  /// In en, this message translates to:
  /// **'Fluxer Visionary since {date}'**
  String userProfileVisionaryBadgeSinceTooltip(String date);

  /// Short label in the user profile badges popout. Keep it concise. Preserve {sequence}; it is inserted by code.
  ///
  /// In en, this message translates to:
  /// **'Visionary ID #{sequence}'**
  String userProfileVisionaryIdTooltip(int sequence);

  /// Profile mutual friends entry label with count.
  ///
  /// In en, this message translates to:
  /// **'Mutual Friends ({count})'**
  String userProfileMutualFriends(int count);

  /// Profile mutual communities entry label with count.
  ///
  /// In en, this message translates to:
  /// **'Mutual Communities ({count})'**
  String userProfileMutualCommunities(int count);

  /// Bottom sheet title for mutual friends.
  ///
  /// In en, this message translates to:
  /// **'Mutual Friends'**
  String get userProfileMutualFriendsTitle;

  /// Bottom sheet title for mutual communities.
  ///
  /// In en, this message translates to:
  /// **'Mutual Communities'**
  String get userProfileMutualCommunitiesTitle;

  /// Empty state shown when a profile has no mutual friends.
  ///
  /// In en, this message translates to:
  /// **'No mutual friends found.'**
  String get userProfileNoMutualFriends;

  /// Empty state shown when a profile has no mutual communities.
  ///
  /// In en, this message translates to:
  /// **'No mutual communities found.'**
  String get userProfileNoMutualCommunities;

  /// Subtitle showing the profiled user's nickname in a mutual community.
  ///
  /// In en, this message translates to:
  /// **'Nickname: {nickname}'**
  String userProfileMutualCommunityNickname(String nickname);

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

  /// Three-dot menu item shown from a community profile that switches to the user's main profile.
  ///
  /// In en, this message translates to:
  /// **'View Main Profile'**
  String get userProfileViewMainProfile;

  /// Three-dot menu item shown from a main profile that switches back to the user's community profile.
  ///
  /// In en, this message translates to:
  /// **'View Community Profile'**
  String get userProfileViewCommunityProfile;

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

  /// Three-dot menu item to change a member's nickname.
  ///
  /// In en, this message translates to:
  /// **'Change nickname'**
  String get userProfileChangeNickname;

  /// Three-dot menu item to kick a member from the community.
  ///
  /// In en, this message translates to:
  /// **'Kick'**
  String get userProfileKick;

  /// Three-dot menu item to ban a member from the community.
  ///
  /// In en, this message translates to:
  /// **'Ban'**
  String get userProfileBan;

  /// Three-dot menu item to time out a member.
  ///
  /// In en, this message translates to:
  /// **'Timeout'**
  String get userProfileTimeout;

  /// Three-dot menu item to remove an active timeout from a member.
  ///
  /// In en, this message translates to:
  /// **'Remove timeout'**
  String get userProfileRemoveTimeout;

  /// Three-dot menu item to transfer community ownership to the member.
  ///
  /// In en, this message translates to:
  /// **'Transfer ownership'**
  String get userProfileTransferOwnership;

  /// Three-dot menu item to report the user.
  ///
  /// In en, this message translates to:
  /// **'Report user'**
  String get userProfileReportUser;

  /// Three-dot menu item to report the message that opened this profile.
  ///
  /// In en, this message translates to:
  /// **'Report message'**
  String get userProfileReportMessage;

  /// Confirmation sheet title before kicking a member.
  ///
  /// In en, this message translates to:
  /// **'Kick {username}?'**
  String userProfileKickConfirmTitle(String username);

  /// Confirmation sheet body before kicking a member.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to kick {username}? They can rejoin with a new invite.'**
  String userProfileKickConfirmDescription(String username);

  /// Confirmation sheet title before removing a member's timeout.
  ///
  /// In en, this message translates to:
  /// **'Remove timeout?'**
  String get userProfileRemoveTimeoutConfirmTitle;

  /// Confirmation sheet body before removing a member's timeout.
  ///
  /// In en, this message translates to:
  /// **'Removing the timeout will allow {username} to send messages, react, and join voice channels again.'**
  String userProfileRemoveTimeoutConfirmDescription(String username);

  /// Confirmation sheet title before transferring community ownership.
  ///
  /// In en, this message translates to:
  /// **'Transfer ownership?'**
  String get userProfileTransferConfirmTitle;

  /// Confirmation sheet body before transferring community ownership.
  ///
  /// In en, this message translates to:
  /// **'Transfer ownership of this community to {username}? This is irreversible and you will lose all owner privileges.'**
  String userProfileTransferConfirmDescription(String username);

  /// Title of the ban member sheet.
  ///
  /// In en, this message translates to:
  /// **'Ban {username}'**
  String userProfileBanSheetTitle(String username);

  /// Label for the ban duration selector.
  ///
  /// In en, this message translates to:
  /// **'Ban duration'**
  String get userProfileBanDurationLabel;

  /// Label for the custom ban duration input.
  ///
  /// In en, this message translates to:
  /// **'Custom duration (seconds)'**
  String get userProfileBanCustomSecondsLabel;

  /// Helper text for the custom ban duration input.
  ///
  /// In en, this message translates to:
  /// **'Any value from {min} to {max} seconds'**
  String userProfileBanCustomSecondsHelper(int min, int max);

  /// Label for the ban delete-message-history selector.
  ///
  /// In en, this message translates to:
  /// **'Delete message history'**
  String get userProfileBanDeleteHistoryLabel;

  /// Ban delete-history option: delete no messages.
  ///
  /// In en, this message translates to:
  /// **'Don\'t delete any'**
  String get userProfileBanDeleteNone;

  /// Ban delete-history option: delete the previous 24 hours of messages.
  ///
  /// In en, this message translates to:
  /// **'Previous 24 hours'**
  String get userProfileBanDelete24h;

  /// Ban delete-history option: delete the previous 7 days of messages.
  ///
  /// In en, this message translates to:
  /// **'Previous 7 days'**
  String get userProfileBanDelete7d;

  /// Label for the optional ban reason input.
  ///
  /// In en, this message translates to:
  /// **'Reason (optional)'**
  String get userProfileBanReasonLabel;

  /// Placeholder for the optional ban reason input.
  ///
  /// In en, this message translates to:
  /// **'Enter a reason for the ban'**
  String get userProfileBanReasonHint;

  /// Submit button on the ban member sheet.
  ///
  /// In en, this message translates to:
  /// **'Ban member'**
  String get userProfileBanSubmit;

  /// Title of the timeout member sheet.
  ///
  /// In en, this message translates to:
  /// **'Timeout {username}'**
  String userProfileTimeoutSheetTitle(String username);

  /// Label for the timeout duration selector.
  ///
  /// In en, this message translates to:
  /// **'Timeout duration'**
  String get userProfileTimeoutDurationLabel;

  /// Submit button on the timeout member sheet.
  ///
  /// In en, this message translates to:
  /// **'Time out member'**
  String get userProfileTimeoutSubmit;

  /// Label for the change nickname input.
  ///
  /// In en, this message translates to:
  /// **'Nickname'**
  String get userProfileNicknameLabel;

  /// Placeholder for the change nickname input.
  ///
  /// In en, this message translates to:
  /// **'Enter a nickname'**
  String get userProfileNicknameHint;

  /// Save button on the change nickname sheet.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get userProfileNicknameSave;

  /// Toast shown after kicking a member.
  ///
  /// In en, this message translates to:
  /// **'Kicked {username}'**
  String userProfileKickSuccess(String username);

  /// Toast shown after banning a member.
  ///
  /// In en, this message translates to:
  /// **'Banned {username}'**
  String userProfileBanSuccess(String username);

  /// Toast shown after timing out a member.
  ///
  /// In en, this message translates to:
  /// **'Timed out {username}'**
  String userProfileTimeoutSuccess(String username);

  /// Toast shown after removing a member's timeout.
  ///
  /// In en, this message translates to:
  /// **'Removed timeout for {username}'**
  String userProfileRemoveTimeoutSuccess(String username);

  /// Toast shown after updating a member's nickname.
  ///
  /// In en, this message translates to:
  /// **'Nickname updated'**
  String get userProfileNicknameSuccess;

  /// Toast shown after transferring community ownership.
  ///
  /// In en, this message translates to:
  /// **'Ownership transferred'**
  String get userProfileTransferSuccess;

  /// Duration option label for a permanent (non-expiring) duration.
  ///
  /// In en, this message translates to:
  /// **'Permanent'**
  String get durationPermanent;

  /// Duration option label for 60 seconds.
  ///
  /// In en, this message translates to:
  /// **'60 seconds'**
  String get duration60Seconds;

  /// Duration option label for 5 minutes.
  ///
  /// In en, this message translates to:
  /// **'5 minutes'**
  String get duration5Minutes;

  /// Duration option label for 10 minutes.
  ///
  /// In en, this message translates to:
  /// **'10 minutes'**
  String get duration10Minutes;

  /// Duration option label for 1 hour.
  ///
  /// In en, this message translates to:
  /// **'1 hour'**
  String get duration1Hour;

  /// Duration option label for 12 hours.
  ///
  /// In en, this message translates to:
  /// **'12 hours'**
  String get duration12Hours;

  /// Duration option label for 1 day.
  ///
  /// In en, this message translates to:
  /// **'1 day'**
  String get duration1Day;

  /// Duration option label for 3 days.
  ///
  /// In en, this message translates to:
  /// **'3 days'**
  String get duration3Days;

  /// Duration option label for 5 days.
  ///
  /// In en, this message translates to:
  /// **'5 days'**
  String get duration5Days;

  /// Duration option label for 1 week.
  ///
  /// In en, this message translates to:
  /// **'1 week'**
  String get duration1Week;

  /// Duration option label for 2 weeks.
  ///
  /// In en, this message translates to:
  /// **'2 weeks'**
  String get duration2Weeks;

  /// Duration option label for 1 month.
  ///
  /// In en, this message translates to:
  /// **'1 month'**
  String get duration1Month;

  /// Duration option label for a user-specified custom duration.
  ///
  /// In en, this message translates to:
  /// **'Custom…'**
  String get durationCustom;

  /// Title of the simple user-report sheet.
  ///
  /// In en, this message translates to:
  /// **'Report user'**
  String get iarReportUserTitle;

  /// User-report reason: the user's profile contains inappropriate content.
  ///
  /// In en, this message translates to:
  /// **'Inappropriate profile'**
  String get iarReasonInappropriateProfile;

  /// Description for the inappropriate-profile user-report reason.
  ///
  /// In en, this message translates to:
  /// **'This user\'s profile contains inappropriate content'**
  String get iarReasonInappropriateProfileDescription;

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
  /// **'Several people are typing...'**
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

  /// Randomly selected welcome message that appears as a system message when a user joins a community. Plural placeholder is the new member username. Tone is friendly and warm; keep variety across these strings..
  ///
  /// In en, this message translates to:
  /// **'Glad you\'re here, {username}!'**
  String systemJoinGladYoureHere(String username);

  /// Randomly selected welcome message that appears as a system message when a user joins a community. Plural placeholder is the new member username. Tone is friendly and warm; keep variety across these strings..
  ///
  /// In en, this message translates to:
  /// **'Welcome, {username}! Make yourself at home.'**
  String systemJoinWelcomeMakeYourselfAtHome(String username);

  /// Randomly selected welcome message that appears as a system message when a user joins a community. Plural placeholder is the new member username. Tone is friendly and warm; keep variety across these strings..
  ///
  /// In en, this message translates to:
  /// **'Hello, {username}! Nice to have you here.'**
  String systemJoinHelloNiceToHaveYouHere(String username);

  /// Randomly selected welcome message that appears as a system message when a user joins a community. Plural placeholder is the new member username. Tone is friendly and warm; keep variety across these strings..
  ///
  /// In en, this message translates to:
  /// **'Hello, {username}! Jump in whenever you\'re ready.'**
  String systemJoinHelloJumpInWheneverYoureReady(String username);

  /// Randomly selected welcome message that appears as a system message when a user joins a community. Plural placeholder is the new member username. Tone is friendly and warm; keep variety across these strings..
  ///
  /// In en, this message translates to:
  /// **'Hey {username}, great to see you here!'**
  String systemJoinHeyGreatToSeeYouHere(String username);

  /// Randomly selected welcome message that appears as a system message when a user joins a community. Plural placeholder is the new member username. Tone is friendly and warm; keep variety across these strings..
  ///
  /// In en, this message translates to:
  /// **'Hey there, {username}! Hope you enjoy your stay.'**
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username);

  /// Randomly selected welcome message that appears as a system message when a user joins a community. Plural placeholder is the new member username. Tone is friendly and warm; keep variety across these strings..
  ///
  /// In en, this message translates to:
  /// **'Hey, {username}, welcome aboard!'**
  String systemJoinHeyWelcomeAboard(String username);

  /// Randomly selected welcome message that appears as a system message when a user joins a community. Plural placeholder is the new member username. Tone is friendly and warm; keep variety across these strings..
  ///
  /// In en, this message translates to:
  /// **'Glad you made it, {username}!'**
  String systemJoinGladYouMadeIt(String username);

  /// Randomly selected welcome message that appears as a system message when a user joins a community. Plural placeholder is the new member username. Tone is friendly and warm; keep variety across these strings..
  ///
  /// In en, this message translates to:
  /// **'Welcome in, {username}!'**
  String systemJoinWelcomeIn(String username);

  /// Randomly selected welcome message that appears as a system message when a user joins a community. Plural placeholder is the new member username. Tone is friendly and warm; keep variety across these strings..
  ///
  /// In en, this message translates to:
  /// **'Welcome, {username}!'**
  String systemJoinWelcome(String username);

  /// Randomly selected welcome message that appears as a system message when a user joins a community. Plural placeholder is the new member username. Tone is friendly and warm; keep variety across these strings..
  ///
  /// In en, this message translates to:
  /// **'Welcome, {username}! We\'re glad you\'re here.'**
  String systemJoinWelcomeWereGladYoureHere(String username);

  /// Randomly selected welcome message that appears as a system message when a user joins a community. Plural placeholder is the new member username. Tone is friendly and warm; keep variety across these strings..
  ///
  /// In en, this message translates to:
  /// **'Welcome, {username}! Hope you enjoy your time here.'**
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username);

  /// Randomly selected welcome message that appears as a system message when a user joins a community. Plural placeholder is the new member username. Tone is friendly and warm; keep variety across these strings..
  ///
  /// In en, this message translates to:
  /// **'Welcome, {username}! Your next conversation starts here.'**
  String systemJoinWelcomeYourNextConversationStartsHere(String username);

  /// Randomly selected welcome message that appears as a system message when a user joins a community. Plural placeholder is the new member username. Tone is friendly and warm; keep variety across these strings..
  ///
  /// In en, this message translates to:
  /// **'Welcome, {username}. We\'re happy to have you here.'**
  String systemJoinWelcomeWereHappyToHaveYouHere(String username);

  /// Randomly selected welcome message that appears as a system message when a user joins a community. Plural placeholder is the new member username. Tone is friendly and warm; keep variety across these strings..
  ///
  /// In en, this message translates to:
  /// **'Great to see you, {username}! Welcome in.'**
  String systemJoinGreatToSeeYouWelcomeIn(String username);

  /// Randomly selected welcome message that appears as a system message when a user joins a community. Plural placeholder is the new member username. Tone is friendly and warm; keep variety across these strings..
  ///
  /// In en, this message translates to:
  /// **'You\'re here, {username}! Good to have you with us.'**
  String systemJoinYoureHereGoodToHaveYouWithUs(String username);

  /// Randomly selected welcome message that appears as a system message when a user joins a community. Plural placeholder is the new member username. Tone is friendly and warm; keep variety across these strings..
  ///
  /// In en, this message translates to:
  /// **'You\'ve arrived, {username}! Let\'s get started.'**
  String systemJoinYouveArrivedLetsGetStarted(String username);

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
  /// **'You can\'t send messages in this channel.'**
  String get channelNoSendPermissionHint;

  /// Read-only system DM barrier message. productName is the Fluxer product name.
  ///
  /// In en, this message translates to:
  /// **'System announcements from {productName} staff. You can\'t reply here.'**
  String systemDmComposerBarrier(String productName);

  /// Composer barrier when guild-wide messaging is disabled.
  ///
  /// In en, this message translates to:
  /// **'Messaging is temporarily paused in this community.'**
  String get channelComposerBarrierGuildSendDisabled;

  /// Composer barrier when the current user is timed out in the guild.
  ///
  /// In en, this message translates to:
  /// **'You\'re timed out. Messaging, reactions, and voice are paused until the timeout expires.'**
  String get channelComposerBarrierTimedOut;

  /// Composer barrier when the user must claim their account before messaging.
  ///
  /// In en, this message translates to:
  /// **'You need to claim your account to send messages in this community.'**
  String get channelComposerBarrierUnclaimedAccount;

  /// Composer barrier when the user must verify their email before messaging.
  ///
  /// In en, this message translates to:
  /// **'You need to verify your email to send messages in this community.'**
  String get channelComposerBarrierUnverifiedEmail;

  /// Composer barrier when the user's account is younger than the guild verification requirement.
  ///
  /// In en, this message translates to:
  /// **'Your account is too new to send messages in this community.'**
  String get channelComposerBarrierAccountTooNew;

  /// Composer barrier when the user's guild membership is too recent.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t been a member of this community long enough to send messages.'**
  String get channelComposerBarrierNotMemberLongEnough;

  /// Composer barrier when the user must verify a phone number before messaging.
  ///
  /// In en, this message translates to:
  /// **'You need to verify a phone number to send messages in this community.'**
  String get channelComposerBarrierNoPhoneNumber;

  /// Action button on the composer barrier for unverified email.
  ///
  /// In en, this message translates to:
  /// **'Verify email'**
  String get channelComposerBarrierVerifyEmail;

  /// Action button on the composer barrier for missing phone verification.
  ///
  /// In en, this message translates to:
  /// **'Verify phone'**
  String get channelComposerBarrierVerifyPhone;

  /// Shown when adding files would exceed the per-message attachment limit.
  ///
  /// In en, this message translates to:
  /// **'Too many attachments (max {max})'**
  String chatAttachmentTooMany(int max);

  /// Shown when a selected file is larger than allowed.
  ///
  /// In en, this message translates to:
  /// **'One or more files exceed the size limit'**
  String get chatAttachmentFileTooLarge;

  /// Shown when the estimated multipart request exceeds the limit.
  ///
  /// In en, this message translates to:
  /// **'Those files are too large to send together'**
  String get chatAttachmentPayloadTooLarge;

  /// Overlay hint when dragging files over chat without Shift.
  ///
  /// In en, this message translates to:
  /// **'Drop files to upload'**
  String get chatAttachmentDropToUpload;

  /// Overlay hint when dragging files over chat with Shift held.
  ///
  /// In en, this message translates to:
  /// **'Drop files to send now'**
  String get chatAttachmentDropToSend;

  /// Menu item to open the voice message recorder.
  ///
  /// In en, this message translates to:
  /// **'Send voice message'**
  String get chatAttachmentSendVoiceMessage;

  /// Title for voice message recording UI.
  ///
  /// In en, this message translates to:
  /// **'Voice message'**
  String get voiceMessageTitle;

  /// Hint shown next to the hold-to-record microphone button.
  ///
  /// In en, this message translates to:
  /// **'Hold to record. Drag up to lock, or release to send.'**
  String get voiceMessageHoldHint;

  /// Accessibility label for discarding a voice recording.
  ///
  /// In en, this message translates to:
  /// **'Discard voice message'**
  String get voiceMessageDiscard;

  /// Accessibility label for sending a voice recording.
  ///
  /// In en, this message translates to:
  /// **'Send voice message'**
  String get voiceMessageSend;

  /// Shown when microphone permission is denied for voice messages.
  ///
  /// In en, this message translates to:
  /// **'Unable to start recording. Allow microphone access.'**
  String get voiceMessageMicPermissionDenied;

  /// Shown when the device cannot record voice messages.
  ///
  /// In en, this message translates to:
  /// **'Voice recording is not supported on this device.'**
  String get voiceMessageRecordingNotSupported;

  /// Shown when the microphone is already used by an active voice call.
  ///
  /// In en, this message translates to:
  /// **'Leave the voice call to record a voice message.'**
  String get voiceMessageMicInUse;

  /// Shown when voice recording fails.
  ///
  /// In en, this message translates to:
  /// **'Recording failed. Try again.'**
  String get voiceMessageRecordingFailed;

  /// Shown when sending a voice message fails.
  ///
  /// In en, this message translates to:
  /// **'Unable to send voice message. Try again.'**
  String get voiceMessageSendFailed;

  /// Help text while recording a voice message on desktop.
  ///
  /// In en, this message translates to:
  /// **'Speak now. Press Stop when you are done — you can trim afterwards.'**
  String get voiceMessageRecordingHint;

  /// Help text while reviewing a voice message before send.
  ///
  /// In en, this message translates to:
  /// **'Drag the handles to trim, then press Send.'**
  String get voiceMessageReviewHint;

  /// Stop recording button in voice message composer.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get voiceMessageStop;

  /// Button to retry voice recording after permission error.
  ///
  /// In en, this message translates to:
  /// **'Start recording'**
  String get voiceMessageStartRecording;

  /// Button to discard review and record again.
  ///
  /// In en, this message translates to:
  /// **'Re-record'**
  String get voiceMessageRerecord;

  /// Play voice message preview.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get voiceMessagePlay;

  /// Pause voice message preview.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get voiceMessagePause;

  /// Error when trimmed voice message is too short.
  ///
  /// In en, this message translates to:
  /// **'Selection must be at least {seconds}s.'**
  String voiceMessageSelectionTooShort(num seconds);

  /// Title for the attachment edit sheet.
  ///
  /// In en, this message translates to:
  /// **'Edit attachment'**
  String get chatAttachmentEditTitle;

  /// Label for attachment filename field.
  ///
  /// In en, this message translates to:
  /// **'Filename'**
  String get chatAttachmentFilenameLabel;

  /// Label for attachment description / alt text.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get chatAttachmentDescriptionLabel;

  /// Hint for attachment description field.
  ///
  /// In en, this message translates to:
  /// **'Optional alt text'**
  String get chatAttachmentDescriptionHint;

  /// Toggle to mark an attachment as spoiler.
  ///
  /// In en, this message translates to:
  /// **'Mark as spoiler'**
  String get chatAttachmentSpoilerLabel;

  /// Accessibility label for removing a pending attachment.
  ///
  /// In en, this message translates to:
  /// **'Remove attachment'**
  String get chatAttachmentRemove;

  /// Tooltip and accessibility label for downloading a non-media file attachment.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get chatAttachmentDownload;

  /// Tooltip when a file attachment link is no longer available.
  ///
  /// In en, this message translates to:
  /// **'Attachment expired'**
  String get chatAttachmentExpiredTooltip;

  /// Option to pick photos and videos from the device gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get chatAttachmentSourceGallery;

  /// Option to capture a photo with the camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get chatAttachmentSourceCamera;

  /// Option to pick arbitrary files from storage.
  ///
  /// In en, this message translates to:
  /// **'Browse files'**
  String get chatAttachmentSourceBrowse;

  /// Tooltip for pasting an image attachment from the clipboard.
  ///
  /// In en, this message translates to:
  /// **'Paste image from clipboard'**
  String get chatAttachmentPasteTooltip;

  /// Badge text for spoiler attachments.
  ///
  /// In en, this message translates to:
  /// **'Spoiler'**
  String get chatAttachmentSpoiler;

  /// Label shown on the overlay that conceals spoiler attachment and embed image media.
  ///
  /// In en, this message translates to:
  /// **'SPOILER'**
  String get chatMediaSpoilerOverlayLabel;

  /// Accessibility label for the button that reveals concealed spoiler attachment and embed image media.
  ///
  /// In en, this message translates to:
  /// **'Reveal spoiler'**
  String get chatMediaSpoilerRevealLabel;

  /// Short label on the mature media blur overlay.
  ///
  /// In en, this message translates to:
  /// **'Reveal'**
  String get matureMediaRevealButton;

  /// Accessibility label for the mature media reveal button.
  ///
  /// In en, this message translates to:
  /// **'Click to reveal'**
  String get matureMediaRevealHint;

  /// Title for mature content gates and warnings.
  ///
  /// In en, this message translates to:
  /// **'Mature content'**
  String get matureContentTitle;

  /// Title for a mature community gate.
  ///
  /// In en, this message translates to:
  /// **'Mature community'**
  String get matureCommunityTitle;

  /// Title for a mature category gate.
  ///
  /// In en, this message translates to:
  /// **'Mature category'**
  String get matureCategoryTitle;

  /// Title for a mature channel gate.
  ///
  /// In en, this message translates to:
  /// **'Mature channel'**
  String get matureChannelTitle;

  /// Title for a community content warning gate.
  ///
  /// In en, this message translates to:
  /// **'Community content warning'**
  String get communityContentWarningTitle;

  /// Title for a category content warning gate.
  ///
  /// In en, this message translates to:
  /// **'Category content warning'**
  String get categoryContentWarningTitle;

  /// Title for a channel content warning gate.
  ///
  /// In en, this message translates to:
  /// **'Channel content warning'**
  String get channelContentWarningTitle;

  /// Default body text for content warning gates.
  ///
  /// In en, this message translates to:
  /// **'This contains sensitive content.'**
  String get defaultContentWarningBody;

  /// Body for a mature community gate without custom warning text.
  ///
  /// In en, this message translates to:
  /// **'This community is marked for mature content and may contain material that may be inappropriate for some users.'**
  String get matureCommunityBody;

  /// Body for a mature category gate without custom warning text.
  ///
  /// In en, this message translates to:
  /// **'This category is marked for mature content and may contain material that may be inappropriate for some users.'**
  String get matureCategoryBody;

  /// Body for a mature text channel gate without custom warning text.
  ///
  /// In en, this message translates to:
  /// **'This channel is marked for mature content and may contain material that may be inappropriate for some users.'**
  String get matureChannelBody;

  /// Body for a mature voice channel gate without custom warning text.
  ///
  /// In en, this message translates to:
  /// **'This voice channel is marked for mature content and may contain material that may be inappropriate for some users.'**
  String get matureVoiceChannelBody;

  /// Body for a mature link channel gate without custom warning text.
  ///
  /// In en, this message translates to:
  /// **'This link channel is marked for mature content and may open material that may be inappropriate for some users.'**
  String get matureLinkChannelBody;

  /// Body when a minor cannot access a mature community.
  ///
  /// In en, this message translates to:
  /// **'This mature community is not available to your account.'**
  String get matureCommunityUnavailableBody;

  /// Body when a minor cannot access a mature category.
  ///
  /// In en, this message translates to:
  /// **'This mature category is not available to your account.'**
  String get matureCategoryUnavailableBody;

  /// Body when a minor cannot access a mature channel.
  ///
  /// In en, this message translates to:
  /// **'This mature channel is not available to your account.'**
  String get matureChannelUnavailableBody;

  /// Primary action on mature content gates.
  ///
  /// In en, this message translates to:
  /// **'Proceed'**
  String get matureContentProceedButton;

  /// Primary action on content-warning-only gates.
  ///
  /// In en, this message translates to:
  /// **'I understand'**
  String get matureContentUnderstandButton;

  /// Primary action on mature link channel gates.
  ///
  /// In en, this message translates to:
  /// **'Open link'**
  String get matureContentOpenLinkButton;

  /// Privacy settings section title for sensitive content filters.
  ///
  /// In en, this message translates to:
  /// **'Sensitive content'**
  String get sensitiveContentSectionTitle;

  /// Privacy settings section description for sensitive content filters.
  ///
  /// In en, this message translates to:
  /// **'Control how mature or sensitive media is filtered in different contexts'**
  String get sensitiveContentSectionDescription;

  /// Label for friend DM sensitive content filter.
  ///
  /// In en, this message translates to:
  /// **'Direct messages from friends'**
  String get sensitiveContentFriendDmLabel;

  /// Label for non-friend DM sensitive content filter.
  ///
  /// In en, this message translates to:
  /// **'Direct messages from others'**
  String get sensitiveContentNonFriendDmLabel;

  /// Label for guild channel sensitive content filter.
  ///
  /// In en, this message translates to:
  /// **'Messages in community channels'**
  String get sensitiveContentGuildLabel;

  /// Sensitive content filter option to show media.
  ///
  /// In en, this message translates to:
  /// **'Show'**
  String get sensitiveContentFilterShow;

  /// Sensitive content filter option to blur media.
  ///
  /// In en, this message translates to:
  /// **'Blur'**
  String get sensitiveContentFilterBlur;

  /// Sensitive content filter option to block media.
  ///
  /// In en, this message translates to:
  /// **'Block'**
  String get sensitiveContentFilterBlock;

  /// Toggle label for blurring unscanned media.
  ///
  /// In en, this message translates to:
  /// **'Blur media until safety scan completes'**
  String get sensitiveContentBlurUnscannedLabel;

  /// Description for blur-unscanned toggle for adult accounts.
  ///
  /// In en, this message translates to:
  /// **'When enabled, images and videos are blurred until the content safety scan finishes.'**
  String get sensitiveContentBlurUnscannedDescriptionAdult;

  /// Description for blur-unscanned toggle for minor accounts.
  ///
  /// In en, this message translates to:
  /// **'This setting is always on for your account.'**
  String get sensitiveContentBlurUnscannedDescriptionMinor;

  /// Reset button for sensitive content settings.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get sensitiveContentResetButton;

  /// Save button for sensitive content settings.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get sensitiveContentSaveButton;

  /// Filename-like progress label for a temporary message attachment while multiple selected files are uploading.
  ///
  /// In en, this message translates to:
  /// **'Uploading {count, plural, =1{1 file} other{{count} files}}'**
  String chatUploadingAttachmentsSummary(int count);

  /// Button or menu action label for canceling an in-flight message attachment upload.
  ///
  /// In en, this message translates to:
  /// **'Cancel upload'**
  String get chatCancelUpload;

  /// Footnote when attachment(s) share one expiry date. {date} is already formatted for the locale.
  ///
  /// In en, this message translates to:
  /// **'Expires on {date}'**
  String chatAttachmentExpiresOn(String date);

  /// Footnote when attachments expire across a range. {start} and {end} are formatted for the locale.
  ///
  /// In en, this message translates to:
  /// **'Expires between {start} and {end}'**
  String chatAttachmentExpiresBetween(String start, String end);

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

  /// Subsection title under Interface for Neko appearance settings.
  ///
  /// In en, this message translates to:
  /// **'Miscellaneous'**
  String get lookAndFeelNekoTitle;

  /// Subsection description for Neko appearance settings.
  ///
  /// In en, this message translates to:
  /// **'Miscellaneous interface options.'**
  String get lookAndFeelNekoDescription;

  /// Toggle label for showing Neko in the chat footer.
  ///
  /// In en, this message translates to:
  /// **'Show Neko'**
  String get lookAndFeelShowNekoLabel;

  /// Toggle description for showing Neko in chat.
  ///
  /// In en, this message translates to:
  /// **'When enabled, Neko appears near the chat input bar.'**
  String get lookAndFeelShowNekoDescription;

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

  /// Tooltip on the aggregate outage badge in the guild sidebar when one or more communities are unavailable.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 community is temporarily unavailable due to a flux capacitor malfunction.} other{{count} communities are temporarily unavailable due to a flux capacitor malfunction.}}'**
  String guildUnavailableOutageTooltip(int count);

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

  /// Title for the favorites section.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favoritesTitle;

  /// Empty state title when no channels are favorited.
  ///
  /// In en, this message translates to:
  /// **'No favorites yet'**
  String get favoritesEmptyTitle;

  /// Empty state description for favorites.
  ///
  /// In en, this message translates to:
  /// **'Star channels from the chat header to keep them here.'**
  String get favoritesEmptyDescription;

  /// Welcome screen title for favorites.
  ///
  /// In en, this message translates to:
  /// **'Welcome to favorites'**
  String get favoritesWelcomeTitle;

  /// Welcome screen description for favorites.
  ///
  /// In en, this message translates to:
  /// **'Your personal space for quick access to channels, DMs, and groups you love. Press the star on any channel to add it here.'**
  String get favoritesWelcomeDescription;

  /// Welcome screen tip for disabling favorites.
  ///
  /// In en, this message translates to:
  /// **'Not for you? Turn it off anytime.'**
  String get favoritesWelcomeTip;

  /// Button to disable favorites from welcome screen.
  ///
  /// In en, this message translates to:
  /// **'Disable favorites'**
  String get favoritesDisableButton;

  /// Toast when a channel is added to favorites.
  ///
  /// In en, this message translates to:
  /// **'Added to Favorites'**
  String get favoritesAddedToast;

  /// Toast when a channel is removed from favorites.
  ///
  /// In en, this message translates to:
  /// **'Removed from Favorites'**
  String get favoritesRemovedToast;

  /// Toast when favorites UI is hidden.
  ///
  /// In en, this message translates to:
  /// **'Favorites hidden'**
  String get favoritesHiddenToast;

  /// Action to mute the favorites section.
  ///
  /// In en, this message translates to:
  /// **'Mute favorites'**
  String get favoritesMute;

  /// Action to unmute the favorites section.
  ///
  /// In en, this message translates to:
  /// **'Unmute favorites'**
  String get favoritesUnmute;

  /// Accessibility label for favorites header menu.
  ///
  /// In en, this message translates to:
  /// **'Favorites menu'**
  String get favoritesHeaderMenu;

  /// Action to create a favorites category.
  ///
  /// In en, this message translates to:
  /// **'Create category'**
  String get favoritesCreateCategory;

  /// Label for favorites category name input.
  ///
  /// In en, this message translates to:
  /// **'Category name'**
  String get favoritesCategoryNameLabel;

  /// Toggle to hide muted channels in favorites.
  ///
  /// In en, this message translates to:
  /// **'Hide muted channels'**
  String get favoritesHideMutedChannels;

  /// Toggle to show muted channels in favorites.
  ///
  /// In en, this message translates to:
  /// **'Show muted channels'**
  String get favoritesShowMutedChannels;

  /// Action to set a favorite channel nickname.
  ///
  /// In en, this message translates to:
  /// **'Set nickname'**
  String get favoritesSetNickname;

  /// Label for favorite channel nickname input.
  ///
  /// In en, this message translates to:
  /// **'Nickname'**
  String get favoritesNicknameLabel;

  /// Button to save favorite channel nickname.
  ///
  /// In en, this message translates to:
  /// **'Save nickname'**
  String get favoritesSaveNickname;

  /// Action to move a favorite to a category.
  ///
  /// In en, this message translates to:
  /// **'Move to category'**
  String get favoritesMoveToCategory;

  /// Label for uncategorized favorites.
  ///
  /// In en, this message translates to:
  /// **'Uncategorized'**
  String get favoritesUncategorized;

  /// Label for favorites in deleted categories.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get favoritesOtherCategory;

  /// Action to remove a channel from favorites.
  ///
  /// In en, this message translates to:
  /// **'Remove from Favorites'**
  String get favoritesRemoveFromFavorites;

  /// Action to add a channel to favorites.
  ///
  /// In en, this message translates to:
  /// **'Add to Favorites'**
  String get favoritesAddToFavorites;

  /// Title for hide favorites confirmation.
  ///
  /// In en, this message translates to:
  /// **'Hide favorites'**
  String get favoritesHideConfirmTitle;

  /// Description for hide favorites confirmation.
  ///
  /// In en, this message translates to:
  /// **'This will hide all favorites-related UI elements including buttons and menu items. Your existing favorites will be preserved and can be re-enabled anytime from Settings > Advanced > Appearance.'**
  String get favoritesHideConfirmDescription;

  /// Subtitle for a 1:1 DM in the favorites channel list.
  ///
  /// In en, this message translates to:
  /// **'Direct Message'**
  String get favoritesDirectMessageSubtitle;

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

  /// Section title for unread-indicator accessibility settings.
  ///
  /// In en, this message translates to:
  /// **'Unread indicators'**
  String get accessibilityUnreadGroupTitle;

  /// Section description for unread-indicator accessibility settings.
  ///
  /// In en, this message translates to:
  /// **'Control how unread message indicators are displayed.'**
  String get accessibilityUnreadGroupDescription;

  /// Toggle label for showing a faded unread indicator on muted channels.
  ///
  /// In en, this message translates to:
  /// **'Show faded unread indicator on muted channels'**
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel;

  /// Toggle description for showing a faded unread indicator on muted channels.
  ///
  /// In en, this message translates to:
  /// **'Display a dimmed unread indicator next to muted direct messages and channels so you can still see at a glance when there\'s activity.'**
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription;

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

  /// Primary action in the mobile bottom sheet before joining a voice channel from the channel list.
  ///
  /// In en, this message translates to:
  /// **'Connect to Voice'**
  String get voiceChannelJoinConnect;

  /// Tooltip on the disabled join voice channel button when the user lacks Connect permission.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permission to join this voice channel'**
  String get voiceChannelNoConnectPermission;

  /// Pre-join banner on a guild voice channel where every connected participant supports E2EE.
  ///
  /// In en, this message translates to:
  /// **'Microphone, camera, and screen share content are end-to-end encrypted.'**
  String get voiceChannelE2eeEncrypted;

  /// Pre-join banner on a DM or group DM call where every connected participant supports E2EE.
  ///
  /// In en, this message translates to:
  /// **'Microphone, camera, and screen share content are end-to-end encrypted.'**
  String get voiceCallE2eeEncrypted;

  /// Pre-join banner on a guild voice channel where E2EE capability is mixed among participants.
  ///
  /// In en, this message translates to:
  /// **'End-to-end encryption is unavailable because an unsupported participant is in this voice channel.'**
  String get voiceChannelE2eeBroken;

  /// Pre-join banner on a DM or group DM call where E2EE capability is mixed among participants.
  ///
  /// In en, this message translates to:
  /// **'End-to-end encryption is unavailable because an unsupported participant is in this call.'**
  String get voiceCallE2eeBroken;

  /// Shown when the gateway rejects a voice join with VOICE_E2EE_REQUIRED.
  ///
  /// In en, this message translates to:
  /// **'This client must be updated before joining this encrypted call.'**
  String get voiceE2eeUpdateRequired;

  /// Non-fatal voice error when LiveKit mic publish fails but the room connection remains active.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t start your microphone. You\'re still in the call.'**
  String get voiceMicPublishFailedStayConnected;

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

  /// Body text for the Android foreground notification shown while screen sharing.
  ///
  /// In en, this message translates to:
  /// **'Sharing your screen.'**
  String get voiceScreenShareNotificationText;

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

  /// Label for the chat button in voice lobby and call control surfaces.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get voiceControlChat;

  /// Accessibility label for opening voice channel text chat.
  ///
  /// In en, this message translates to:
  /// **'Show chat'**
  String get voiceTextChatShow;

  /// Accessibility label when voice channel text chat has unread messages.
  ///
  /// In en, this message translates to:
  /// **'Show chat with {count, plural, one {# unread message} other {# unread messages}}'**
  String voiceTextChatShowUnread(int count);

  /// Error when the user enables video but camera access is denied.
  ///
  /// In en, this message translates to:
  /// **'Camera permission is required for video.'**
  String get voiceCameraPermissionRequired;

  /// Error shown when toggling screen sharing fails for an unknown reason.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t start screen sharing. Please try again.'**
  String get voiceErrorScreenShareToggle;

  /// Error shown when the OS denies screen-capture permission.
  ///
  /// In en, this message translates to:
  /// **'Screen-sharing permission was denied.'**
  String get voiceErrorScreenSharePermissionDenied;

  /// Error shown when screen sharing is invoked on a platform that does not support it.
  ///
  /// In en, this message translates to:
  /// **'Screen sharing isn\'t available on this device.'**
  String get voiceErrorScreenShareUnsupported;

  /// Primary button on a screen-share tile to subscribe to the remote stream.
  ///
  /// In en, this message translates to:
  /// **'Watch Stream'**
  String get voiceWatchStream;

  /// Control-bar action to unsubscribe from the focused screen-share stream.
  ///
  /// In en, this message translates to:
  /// **'Stop Watching'**
  String get voiceStopWatching;

  /// Tooltip for the Stop Watching control in the voice bar.
  ///
  /// In en, this message translates to:
  /// **'Stop watching the current stream'**
  String get voiceStopWatchingCurrentStreamTooltip;

  /// Title on the participant's own screen-share tile when they are sharing their screen.
  ///
  /// In en, this message translates to:
  /// **'You are broadcasting'**
  String get voiceOwnScreenShareTitle;

  /// Subtitle on the participant's own screen-share tile confirming the stream is live.
  ///
  /// In en, this message translates to:
  /// **'Your stream is live for participants.'**
  String get voiceOwnScreenShareSubtitle;

  /// Compact LIVE indicator on a screen-share tile (shown uppercase).
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get voiceLiveBadge;

  /// Primary action on the DM voice banner to open the full-screen DM call UI.
  ///
  /// In en, this message translates to:
  /// **'View call'**
  String get dmVoiceViewCall;

  /// Button label to expand the DM call from the embedded desktop panel.
  ///
  /// In en, this message translates to:
  /// **'Full screen'**
  String get dmVoiceCallFullScreen;

  /// Tooltip for expanding the DM voice call.
  ///
  /// In en, this message translates to:
  /// **'Open call in full screen'**
  String get dmVoiceCallFullScreenTooltip;

  /// Banner status while the DM voice session is establishing.
  ///
  /// In en, this message translates to:
  /// **'Connecting…'**
  String get dmVoiceStripStatusConnecting;

  /// Banner status when connected to DM voice.
  ///
  /// In en, this message translates to:
  /// **'In call'**
  String get dmVoiceStripStatusInCall;

  /// Title on the DM embedded voice panel when conversation name is unknown.
  ///
  /// In en, this message translates to:
  /// **'Voice call'**
  String get dmVoiceEmbeddedFallbackTitle;

  /// Primary bar line during private-call connection.
  ///
  /// In en, this message translates to:
  /// **'Connecting…'**
  String get dmVoiceCallBarConnecting;

  /// Primary bar title for connected 1:1 DM voice.
  ///
  /// In en, this message translates to:
  /// **'Direct call'**
  String get dmVoiceCallBarDirectPrimary;

  /// Primary bar title for connected group DM voice.
  ///
  /// In en, this message translates to:
  /// **'Group call'**
  String get dmVoiceCallBarGroupPrimary;

  /// Fallback bar title when a voice error has no guild name.
  ///
  /// In en, this message translates to:
  /// **'Voice issue'**
  String get dmVoiceCallBarIssueFallback;

  /// Fallback AppBar title for the fullscreen DM voice page.
  ///
  /// In en, this message translates to:
  /// **'Voice'**
  String get dmVoiceFullscreenTitle;

  /// Primary line on the compact voice bar when in a guild call but guild name is not loaded.
  ///
  /// In en, this message translates to:
  /// **'Voice connected'**
  String get voiceCallBarGuildConnectedFallback;

  /// Title on the Notifications tab header.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsPageTitle;

  /// Notifications tab segment: unread channel list.
  ///
  /// In en, this message translates to:
  /// **'Unreads'**
  String get notificationsFilterUnreads;

  /// Notifications tab segment: recent mentions.
  ///
  /// In en, this message translates to:
  /// **'Mentions'**
  String get notificationsFilterMentions;

  /// Tooltip for bookmarks icon from notifications tab.
  ///
  /// In en, this message translates to:
  /// **'Bookmarks'**
  String get notificationsBookmarksTooltip;

  /// Tooltip for recent-mentions filter control.
  ///
  /// In en, this message translates to:
  /// **'Filter mentions'**
  String get notificationsMentionFilterTooltip;

  /// Title for mention filter bottom sheet.
  ///
  /// In en, this message translates to:
  /// **'Mention filters'**
  String get notificationsMentionFiltersTitle;

  /// Checkbox label for everybody mentions in mentions filter.
  ///
  /// In en, this message translates to:
  /// **'Include @everyone and @here mentions'**
  String get notificationsMentionIncludeEveryone;

  /// Checkbox label for role mentions in mentions filter.
  ///
  /// In en, this message translates to:
  /// **'Include role mentions'**
  String get notificationsMentionIncludeRoles;

  /// Checkbox label for all guild/community mentions filter.
  ///
  /// In en, this message translates to:
  /// **'Include all community mentions'**
  String get notificationsMentionIncludeGuilds;

  /// Empty-state title when there are no unreads.
  ///
  /// In en, this message translates to:
  /// **'No Unread Messages'**
  String get notificationsNoUnreadTitle;

  /// Empty-state body when there are no unreads.
  ///
  /// In en, this message translates to:
  /// **'You\'re all caught up.'**
  String get notificationsNoUnreadBody;

  /// Empty-state title when there are no recent mentions.
  ///
  /// In en, this message translates to:
  /// **'No Recent Mentions'**
  String get notificationsNoMentionsTitle;

  /// Empty-state body for mentions tab.
  ///
  /// In en, this message translates to:
  /// **'All @mentions of you will appear here for 7 days.'**
  String get notificationsNoMentionsBody;

  /// Footer title when mentions pagination is exhausted.
  ///
  /// In en, this message translates to:
  /// **'You\'ve reached the end'**
  String get notificationsMentionsEndTitle;

  /// Footer body when mentions pagination is exhausted.
  ///
  /// In en, this message translates to:
  /// **'You\'ve seen all your recent mentions. Don\'t fret, more will appear here soon.'**
  String get notificationsMentionsEndBody;

  /// Button to navigate to channel message.
  ///
  /// In en, this message translates to:
  /// **'Jump'**
  String get notificationsJump;

  /// Tooltip to dismiss a mention from the feed.
  ///
  /// In en, this message translates to:
  /// **'Remove mention'**
  String get notificationsRemoveMentionTooltip;

  /// Button to open unread channel location.
  ///
  /// In en, this message translates to:
  /// **'View all unread'**
  String get notificationsViewAllUnread;

  /// Mark inbox channel unread as read.
  ///
  /// In en, this message translates to:
  /// **'Mark as read'**
  String get notificationsMarkAsRead;

  /// Expand collapsed unread inbox card.
  ///
  /// In en, this message translates to:
  /// **'Expand'**
  String get notificationsExpand;

  /// Collapse unread inbox card preview.
  ///
  /// In en, this message translates to:
  /// **'Collapse'**
  String get notificationsCollapse;

  /// Shown when an inbox mention row has no backing message row.
  ///
  /// In en, this message translates to:
  /// **'This message couldn\'t be loaded.'**
  String get notificationsMessageUnavailable;

  /// Character counter tooltip showing how many characters remain.
  ///
  /// In en, this message translates to:
  /// **'{remaining} characters left'**
  String characterCounterRemaining(int remaining);

  /// Character counter tooltip when the message exceeds the allowed length.
  ///
  /// In en, this message translates to:
  /// **'Message is too long'**
  String get characterCounterTooLong;

  /// Character counter tooltip with a Plutonium upsell when nearing the limit.
  ///
  /// In en, this message translates to:
  /// **'{remaining} characters left. Get {productName} to write up to {premiumMaxLength} characters.'**
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  );

  /// Status label shown under a failed outgoing chat message.
  ///
  /// In en, this message translates to:
  /// **'Failed to send message'**
  String get chatMessageFailedToSend;

  /// Action label for deleting a failed outgoing chat message.
  ///
  /// In en, this message translates to:
  /// **'Delete Failed Message'**
  String get chatMessageDeleteFailed;

  /// Action label for opening reaction picker for a message.
  ///
  /// In en, this message translates to:
  /// **'Add Reaction'**
  String get chatMessageAddReaction;

  /// Action label for editing a sent message.
  ///
  /// In en, this message translates to:
  /// **'Edit Message'**
  String get chatMessageEdit;

  /// Action label for replying to a message.
  ///
  /// In en, this message translates to:
  /// **'Reply'**
  String get chatMessageReply;

  /// Action label for forwarding a message.
  ///
  /// In en, this message translates to:
  /// **'Forward'**
  String get chatMessageForward;

  /// Title of the forward-message bottom sheet.
  ///
  /// In en, this message translates to:
  /// **'Forward message'**
  String get forwardMessageTitle;

  /// Placeholder for the destination search field in the forward sheet.
  ///
  /// In en, this message translates to:
  /// **'Search channels or DMs'**
  String get forwardSearchHint;

  /// Section header for direct-message destinations in the forward sheet.
  ///
  /// In en, this message translates to:
  /// **'Direct Messages'**
  String get forwardDirectMessagesSection;

  /// Placeholder for the optional comment field in the forward sheet.
  ///
  /// In en, this message translates to:
  /// **'Add a comment (optional)'**
  String get forwardCommentHint;

  /// Forward sheet send button label with the selected destination count and the selection limit.
  ///
  /// In en, this message translates to:
  /// **'Send ({count}/{limit})'**
  String forwardSendButton(int count, int limit);

  /// Shown in the forward sheet when no destinations match the search.
  ///
  /// In en, this message translates to:
  /// **'No channels found'**
  String get forwardEmptyState;

  /// Toast shown after a message is successfully forwarded.
  ///
  /// In en, this message translates to:
  /// **'Message forwarded'**
  String get forwardSuccessToast;

  /// Toast shown when forwarding a message fails.
  ///
  /// In en, this message translates to:
  /// **'Failed to forward message'**
  String get forwardFailed;

  /// Notice shown in the forward sheet when the optional comment is disabled due to slowmode on a selected destination.
  ///
  /// In en, this message translates to:
  /// **'Comments are unavailable because a selected channel has slowmode enabled.'**
  String get forwardCommentSlowmodeDisabled;

  /// Reason shown on a disabled forward destination when the user lacks the send-messages permission.
  ///
  /// In en, this message translates to:
  /// **'You can\'t send messages here'**
  String get forwardDestinationNoSendPermission;

  /// Reason shown on a disabled forward destination when the user lacks embed-links permission and the message has embeds.
  ///
  /// In en, this message translates to:
  /// **'You can\'t embed links here'**
  String get forwardDestinationNoEmbedPermission;

  /// Reason shown on a disabled forward destination when the user lacks attach-files permission and the message has attachments.
  ///
  /// In en, this message translates to:
  /// **'You can\'t attach files here'**
  String get forwardDestinationNoAttachPermission;

  /// Reason shown on a disabled forward destination when the destination guild has sending disabled server-wide.
  ///
  /// In en, this message translates to:
  /// **'Sending messages is disabled in this community'**
  String get forwardDestinationGuildSendDisabled;

  /// Reason shown on a disabled forward destination when the current user is timed out (communication disabled) in the destination guild.
  ///
  /// In en, this message translates to:
  /// **'You\'re on timeout in this community'**
  String get forwardDestinationTimedOut;

  /// Reason shown on a disabled forward destination currently within its slowmode cool-down window. Preserve {remaining}; it is the formatted MM:SS countdown inserted by code.
  ///
  /// In en, this message translates to:
  /// **'Slowmode - wait {remaining}'**
  String forwardDestinationSlowmodeCoolingDown(String remaining);

  /// Action label for copying message text.
  ///
  /// In en, this message translates to:
  /// **'Copy Message'**
  String get chatMessageCopyText;

  /// Action label for pinning a message.
  ///
  /// In en, this message translates to:
  /// **'Pin Message'**
  String get chatMessagePin;

  /// Action label for unpinning a message.
  ///
  /// In en, this message translates to:
  /// **'Unpin Message'**
  String get chatMessageUnpin;

  /// Action label for bookmarking a message.
  ///
  /// In en, this message translates to:
  /// **'Bookmark Message'**
  String get chatMessageBookmark;

  /// Action label for removing a message bookmark.
  ///
  /// In en, this message translates to:
  /// **'Remove Bookmark'**
  String get chatMessageRemoveBookmark;

  /// Action label for marking a message as unread.
  ///
  /// In en, this message translates to:
  /// **'Mark as Unread'**
  String get chatMessageMarkAsUnread;

  /// Action label for copying a message's deep link.
  ///
  /// In en, this message translates to:
  /// **'Copy Message Link'**
  String get chatMessageCopyMessageLink;

  /// Action label for copying the message's snowflake ID to the clipboard.
  ///
  /// In en, this message translates to:
  /// **'Copy Message ID'**
  String get chatMessageCopyMessageId;

  /// Action label that opens the message reactions list sheet showing who reacted with each emoji.
  ///
  /// In en, this message translates to:
  /// **'View reactions'**
  String get chatMessageViewReactions;

  /// Danger action label for clearing every reaction from a message; requires MANAGE_MESSAGES.
  ///
  /// In en, this message translates to:
  /// **'Remove all reactions'**
  String get chatMessageRemoveAllReactions;

  /// Developer-mode action label that opens a JSON viewer for the underlying message data.
  ///
  /// In en, this message translates to:
  /// **'Debug Message'**
  String get chatMessageDebug;

  /// Title for the developer-mode message debug sheet that shows raw message JSON.
  ///
  /// In en, this message translates to:
  /// **'Debug message'**
  String get chatMessageDebugSheetTitle;

  /// Action label that copies the raw message JSON to the clipboard from the debug sheet.
  ///
  /// In en, this message translates to:
  /// **'Copy JSON'**
  String get chatMessageDebugCopyJson;

  /// Toast confirming the raw message JSON was copied to clipboard from the debug sheet.
  ///
  /// In en, this message translates to:
  /// **'Message JSON copied to clipboard'**
  String get chatMessageDebugJsonCopiedToast;

  /// Title shown at the top of the message reactions sheet that lists who reacted with each emoji.
  ///
  /// In en, this message translates to:
  /// **'Reactions'**
  String get chatReactionsSheetTitle;

  /// Empty state shown in the message reactions sheet when no users have reacted with the currently selected emoji.
  ///
  /// In en, this message translates to:
  /// **'Nobody has reacted with this yet.'**
  String get chatReactionsSheetEmpty;

  /// Action label that opens the report-message sheet so the user can flag the message to moderators.
  ///
  /// In en, this message translates to:
  /// **'Report Message'**
  String get chatMessageReport;

  /// Title shown at the top of the In-App Reporting (IAR) sheet when the user is reporting a specific message.
  ///
  /// In en, this message translates to:
  /// **'Report message'**
  String get iarReportMessageTitle;

  /// Lowercase phrase used mid-sentence in IAR copy when referring to the reported user without a name (e.g. inside the close-DM confirmation).
  ///
  /// In en, this message translates to:
  /// **'this user'**
  String get iarThisUserFallback;

  /// Screen-reader description for the IAR sheet announcing what the flow is for.
  ///
  /// In en, this message translates to:
  /// **'Report a rule violation, or find tools to manage contact and preferences.'**
  String get iarModalDescription;

  /// Accessible label for the primary-path radio group on the first step of the IAR sheet. Not shown visually; the radios are labelled inline.
  ///
  /// In en, this message translates to:
  /// **'What do you need?'**
  String get iarPathStepAriaLabel;

  /// Title shown on the category step of the IAR sheet (platform-report path).
  ///
  /// In en, this message translates to:
  /// **'What kind of rule was broken?'**
  String get iarCategoryStepTitle;

  /// Title shown on the reason step of the IAR sheet after the user has picked a rule category.
  ///
  /// In en, this message translates to:
  /// **'Which rule was broken?'**
  String get iarReasonStepTitle;

  /// Placeholder shown in the message-report reason dropdown before the user picks a rule.
  ///
  /// In en, this message translates to:
  /// **'Select a reason'**
  String get iarReasonSelectHint;

  /// Toast shown when the user taps Continue on a step without selecting any radio option.
  ///
  /// In en, this message translates to:
  /// **'Pick an option to continue.'**
  String get iarPickAnOptionToast;

  /// Toast shown when the user taps Send report without selecting a rule reason.
  ///
  /// In en, this message translates to:
  /// **'Pick the rule that was broken.'**
  String get iarPickARuleToast;

  /// Primary-path radio label: file a real DSA / platform-level report.
  ///
  /// In en, this message translates to:
  /// **'Report a platform rule violation'**
  String get iarPathPlatform;

  /// Primary-path radio label: surface this to community moderators rather than platform safety.
  ///
  /// In en, this message translates to:
  /// **'Report to the moderators of this community'**
  String get iarPathCommunity;

  /// Primary-path radio label: the user doesn't want platform action, they want self-service tools (block, leave, settings).
  ///
  /// In en, this message translates to:
  /// **'I don\'t like this content'**
  String get iarPathPreferenceMessage;

  /// Rule-category label grouping harassment, hate, violence, terrorism, raids, and self-harm content.
  ///
  /// In en, this message translates to:
  /// **'Threats, harassment, or harm'**
  String get iarCategoryTargetedHarmLabel;

  /// One-line description for the targeted-harm rule category.
  ///
  /// In en, this message translates to:
  /// **'Bullying, threats, hate, violence, raids, or content that pushes self-harm.'**
  String get iarCategoryTargetedHarmDescription;

  /// Rule-category label grouping child-safety and mature-content reports.
  ///
  /// In en, this message translates to:
  /// **'Child safety or mature content'**
  String get iarCategorySafetyMinorsLabel;

  /// One-line description for the child-safety / mature-content rule category.
  ///
  /// In en, this message translates to:
  /// **'Minors at risk, mature content in the wrong place, or unwanted conduct.'**
  String get iarCategorySafetyMinorsDescription;

  /// Rule-category label grouping privacy violations and impersonation.
  ///
  /// In en, this message translates to:
  /// **'Privacy or impersonation'**
  String get iarCategoryPrivacyIdentityLabel;

  /// One-line description for the privacy / impersonation rule category.
  ///
  /// In en, this message translates to:
  /// **'Doxxing, stalking, pretending to be someone, or an inappropriate profile.'**
  String get iarCategoryPrivacyIdentityDescription;

  /// Rule-category label grouping spam/scams, malware, and harmful misinformation.
  ///
  /// In en, this message translates to:
  /// **'Scams, malware, or misinformation'**
  String get iarCategoryDeceptionLabel;

  /// One-line description for the scams / malware / misinformation rule category.
  ///
  /// In en, this message translates to:
  /// **'Phishing, fraud, malicious links, or false claims likely to cause real-world harm.'**
  String get iarCategoryDeceptionDescription;

  /// Rule-category label grouping illegal activity and the catch-all Other reason.
  ///
  /// In en, this message translates to:
  /// **'Illegal activity or something else'**
  String get iarCategoryIllegalOtherLabel;

  /// One-line description for the illegal / other rule category.
  ///
  /// In en, this message translates to:
  /// **'Illegal sales, criminal facilitation, or a clear rule violation that doesn\'t fit above.'**
  String get iarCategoryIllegalOtherDescription;

  /// Rule-reason label for harassment in the IAR message flow.
  ///
  /// In en, this message translates to:
  /// **'Harassment or threats'**
  String get iarReasonHarassmentLabel;

  /// Rule-reason description for harassment in the IAR message flow.
  ///
  /// In en, this message translates to:
  /// **'Bullying, repeated unwanted contact, stalking, or targeted abuse.'**
  String get iarReasonHarassmentMessageDescription;

  /// Rule-reason label for hate speech in the IAR message flow.
  ///
  /// In en, this message translates to:
  /// **'Hate speech'**
  String get iarReasonHateLabel;

  /// Rule-reason description for hate speech in the IAR message flow.
  ///
  /// In en, this message translates to:
  /// **'Slurs, dehumanizing language, or attacks on protected groups.'**
  String get iarReasonHateMessageDescription;

  /// Rule-reason label for violence in the IAR message flow.
  ///
  /// In en, this message translates to:
  /// **'Violence or violent threats'**
  String get iarReasonViolenceLabel;

  /// Rule-reason description for violence in the IAR message flow.
  ///
  /// In en, this message translates to:
  /// **'Credible threats, graphic violence, or glorification of violence.'**
  String get iarReasonViolenceDescription;

  /// Rule-reason label for mature content / unwanted conduct in the IAR message flow.
  ///
  /// In en, this message translates to:
  /// **'Mature content or harassment'**
  String get iarReasonMatureContentLabel;

  /// Rule-reason description for mature content in the IAR message flow.
  ///
  /// In en, this message translates to:
  /// **'Unwanted conduct or mature content in the wrong place.'**
  String get iarReasonMatureContentMessageDescription;

  /// Rule-reason label for child-safety reports in the IAR message flow. Also used as the {childSafetyReason} placeholder in iarUseChildSafetyInstead.
  ///
  /// In en, this message translates to:
  /// **'Child safety or exploitation of minors'**
  String get iarReasonChildSafetyLabel;

  /// Rule-reason description for child-safety reports in the IAR message flow.
  ///
  /// In en, this message translates to:
  /// **'Grooming or child-exploitation content.'**
  String get iarReasonChildSafetyMessageDescription;

  /// Rule-reason label for harmful misinformation in the IAR message flow.
  ///
  /// In en, this message translates to:
  /// **'Harmful misinformation'**
  String get iarReasonHarmfulMisinfoLabel;

  /// Rule-reason description for harmful misinformation.
  ///
  /// In en, this message translates to:
  /// **'False claims likely to cause real-world harm.'**
  String get iarReasonHarmfulMisinfoDescription;

  /// Rule-reason label for spam/scams/phishing in the IAR message flow.
  ///
  /// In en, this message translates to:
  /// **'Spam, scams, or phishing'**
  String get iarReasonSpamLabel;

  /// Rule-reason description for spam/scams in the IAR message flow.
  ///
  /// In en, this message translates to:
  /// **'Mass spam, fraud, fake giveaways, or account abuse.'**
  String get iarReasonSpamMessageDescription;

  /// Rule-reason label for malware / dangerous links in the IAR message flow.
  ///
  /// In en, this message translates to:
  /// **'Malware or dangerous links'**
  String get iarReasonMalwareLabel;

  /// Rule-reason description for malware.
  ///
  /// In en, this message translates to:
  /// **'Malware, credential theft, or harmful files.'**
  String get iarReasonMalwareDescription;

  /// Rule-reason label for privacy violations in the IAR message flow.
  ///
  /// In en, this message translates to:
  /// **'Privacy violation'**
  String get iarReasonPrivacyLabel;

  /// Rule-reason description for privacy violations.
  ///
  /// In en, this message translates to:
  /// **'Doxxing, exposed private info, or stalking.'**
  String get iarReasonPrivacyDescription;

  /// Rule-reason label for impersonation in the IAR message flow.
  ///
  /// In en, this message translates to:
  /// **'Impersonation or deceptive media'**
  String get iarReasonImpersonationLabel;

  /// Rule-reason description for impersonation in the IAR message flow.
  ///
  /// In en, this message translates to:
  /// **'Pretending to be someone else, including deceptive AI-generated content.'**
  String get iarReasonImpersonationMessageDescription;

  /// Rule-reason label for illegal activity in the IAR message flow.
  ///
  /// In en, this message translates to:
  /// **'Illegal activity'**
  String get iarReasonIllegalLabel;

  /// Rule-reason description for illegal activity.
  ///
  /// In en, this message translates to:
  /// **'Illegal sales, criminal facilitation, or unlawful activity.'**
  String get iarReasonIllegalDescription;

  /// Rule-reason label for self-harm content in the IAR message flow.
  ///
  /// In en, this message translates to:
  /// **'Self-harm or suicide'**
  String get iarReasonSelfHarmLabel;

  /// Rule-reason description for self-harm content in the IAR message flow.
  ///
  /// In en, this message translates to:
  /// **'Promotion or instructions encouraging self-harm or eating disorders.'**
  String get iarReasonSelfHarmMessageDescription;

  /// Rule-reason label for the catch-all option in the IAR message flow.
  ///
  /// In en, this message translates to:
  /// **'Another clear rule violation'**
  String get iarReasonOtherLabel;

  /// Rule-reason description for the catch-all option.
  ///
  /// In en, this message translates to:
  /// **'Use only if it clearly breaks Fluxer\'s rules and doesn\'t fit above.'**
  String get iarReasonOtherDescription;

  /// Inline routing nudge shown under reasons (e.g. mature content) that overlap with child safety.
  ///
  /// In en, this message translates to:
  /// **'If a minor is involved, use \"{childSafetyReason}\" instead.'**
  String iarUseChildSafetyInstead(String childSafetyReason);

  /// Inline safety note shown for child-safety reports on the reason step.
  ///
  /// In en, this message translates to:
  /// **'If this involves CSAM or exploitation of a minor, send it now and don\'t reshare the material.'**
  String get iarSafetyNoteChildSafety;

  /// Inline safety note shown for self-harm reports on the reason step.
  ///
  /// In en, this message translates to:
  /// **'If someone may be in immediate danger, contact local emergency services if you can do so safely.'**
  String get iarSafetyNoteSelfHarm;

  /// Inline safety note shown for violence reports on the reason step.
  ///
  /// In en, this message translates to:
  /// **'If this is a credible imminent threat, contact local emergency services too.'**
  String get iarSafetyNoteViolence;

  /// Inline safety note shown for terrorism reports on the reason step.
  ///
  /// In en, this message translates to:
  /// **'If this is an imminent terrorist threat, contact local emergency services too.'**
  String get iarSafetyNoteTerrorism;

  /// Action card title for blocking the reported user.
  ///
  /// In en, this message translates to:
  /// **'Block this user'**
  String get iarActionBlockUserTitle;

  /// Action card description for blocking the reported user.
  ///
  /// In en, this message translates to:
  /// **'Stop messages and friend requests.'**
  String get iarActionBlockUserDescription;

  /// Trailing button label on the block-user action card.
  ///
  /// In en, this message translates to:
  /// **'Block'**
  String get iarActionBlockUserButton;

  /// Action card title for copying a link to the reported message so the user can share it with community moderators.
  ///
  /// In en, this message translates to:
  /// **'Copy message link'**
  String get iarActionCopyMessageLinkTitle;

  /// Action card description for copying a message link.
  ///
  /// In en, this message translates to:
  /// **'Share with community mods.'**
  String get iarActionCopyMessageLinkDescription;

  /// Trailing button label on the copy-message-link action card.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get iarActionCopyMessageLinkButton;

  /// Action card title for closing the DM with the reported user.
  ///
  /// In en, this message translates to:
  /// **'Close this DM'**
  String get iarActionCloseDmTitle;

  /// Action card description for closing the DM.
  ///
  /// In en, this message translates to:
  /// **'Doesn\'t block. You can reopen later.'**
  String get iarActionCloseDmDescription;

  /// Trailing button label on the close-DM action card.
  ///
  /// In en, this message translates to:
  /// **'Close DM'**
  String get iarActionCloseDmButton;

  /// Action card title for leaving the guild the reported message was sent in.
  ///
  /// In en, this message translates to:
  /// **'Leave the community'**
  String get iarActionLeaveCommunityTitle;

  /// Action card description for leaving the community.
  ///
  /// In en, this message translates to:
  /// **'Stop seeing its content and members.'**
  String get iarActionLeaveCommunityDescription;

  /// Trailing button label on the leave-community action card.
  ///
  /// In en, this message translates to:
  /// **'Leave'**
  String get iarActionLeaveCommunityButton;

  /// Action card title for opening the DM / friend-request privacy settings.
  ///
  /// In en, this message translates to:
  /// **'DM & friend request settings'**
  String get iarActionDmSettingsTitle;

  /// Action card description for DM / friend-request privacy settings.
  ///
  /// In en, this message translates to:
  /// **'Change who can reach you.'**
  String get iarActionDmSettingsDescription;

  /// Action card title for opening the call / group-chat privacy settings.
  ///
  /// In en, this message translates to:
  /// **'Call & group chat settings'**
  String get iarActionCallSettingsTitle;

  /// Action card description for call / group-chat privacy settings.
  ///
  /// In en, this message translates to:
  /// **'Change who can call or add you.'**
  String get iarActionCallSettingsDescription;

  /// Trailing button label for action cards that navigate the user into a settings section.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get iarActionOpenButton;

  /// Action card title (moderator-only) for deleting the reported message.
  ///
  /// In en, this message translates to:
  /// **'Delete this message'**
  String get iarActionDeleteMessageTitle;

  /// Action card description (moderator-only) for deleting the reported message.
  ///
  /// In en, this message translates to:
  /// **'Remove it from the channel for everyone.'**
  String get iarActionDeleteMessageDescription;

  /// Trailing button label on the delete-message action card.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get iarActionDeleteMessageButton;

  /// Disabled-state trailing button label on the delete-message action card after the message is already gone.
  ///
  /// In en, this message translates to:
  /// **'Deleted'**
  String get iarActionDeleteMessageDeletedButton;

  /// Tooltip on the disabled delete-message action card.
  ///
  /// In en, this message translates to:
  /// **'This message has already been deleted.'**
  String get iarActionDeleteMessageDeletedTooltip;

  /// Action card title (moderator-only) for opening the ban dialog against the reported user.
  ///
  /// In en, this message translates to:
  /// **'Ban this user'**
  String get iarActionBanUserTitle;

  /// Action card description (moderator-only) for banning the reported user.
  ///
  /// In en, this message translates to:
  /// **'Open the ban dialog for this community.'**
  String get iarActionBanUserDescription;

  /// Trailing button label on the ban-user action card.
  ///
  /// In en, this message translates to:
  /// **'Ban'**
  String get iarActionBanUserButton;

  /// Disabled-state trailing button label on the ban-user action card after the target is already banned.
  ///
  /// In en, this message translates to:
  /// **'Banned'**
  String get iarActionBanUserBannedButton;

  /// Tooltip on the disabled ban-user action card.
  ///
  /// In en, this message translates to:
  /// **'This user is already banned from the community.'**
  String get iarActionBanUserBannedTooltip;

  /// Title of the confirm-close-DM bottom sheet shown after the user taps Close DM on the action card.
  ///
  /// In en, this message translates to:
  /// **'Close DM'**
  String get iarCloseDmConfirmTitle;

  /// Body of the confirm-close-DM bottom sheet.
  ///
  /// In en, this message translates to:
  /// **'Close your current DM with {name}. This doesn\'t block them; you can reopen later.'**
  String iarCloseDmConfirmDescription(String name);

  /// Title shown on the success step after a platform report is submitted.
  ///
  /// In en, this message translates to:
  /// **'Report sent'**
  String get iarSuccessTitle;

  /// Body shown on the success step after a platform report is submitted.
  ///
  /// In en, this message translates to:
  /// **'Our safety team is reviewing it. We\'ll send you a DM and email once we\'ve reached a verdict.'**
  String get iarSuccessBody;

  /// Title shown on the IAR success step when the message had already been reported by this user (HTTP 409); the existing report is under review.
  ///
  /// In en, this message translates to:
  /// **'Already reported'**
  String get iarAlreadyReportedTitle;

  /// Body shown on the IAR success step when the message had already been reported by this user (HTTP 409).
  ///
  /// In en, this message translates to:
  /// **'You\'ve already reported this message. Our safety team is reviewing it.'**
  String get iarAlreadyReportedBody;

  /// Footer button label that returns the user to the previous IAR step.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get iarBackButton;

  /// Footer button label that advances the user to the next IAR step.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get iarContinueButton;

  /// Footer button label that submits the IAR report.
  ///
  /// In en, this message translates to:
  /// **'Send report'**
  String get iarSendReportButton;

  /// Footer button label that closes the IAR sheet from the success or guidance step.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get iarDoneButton;

  /// Toast shown when the IAR report submission fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t send the report. Please try again.'**
  String get iarCouldntSendToast;

  /// Toast shown when an IAR report submission is rejected for rate limiting (HTTP 429).
  ///
  /// In en, this message translates to:
  /// **'You\'re reporting too quickly. Please wait a moment and try again.'**
  String get iarRateLimitedToast;

  /// Toast shown after a message report is submitted successfully from the simple mobile report sheet.
  ///
  /// In en, this message translates to:
  /// **'Report sent. Our safety team will review it.'**
  String get iarReportSentToast;

  /// Body of the confirm-block-user bottom sheet shown after the user taps Block on the IAR action card.
  ///
  /// In en, this message translates to:
  /// **'Block {name}? They won\'t be able to message you or send you friend requests. You can unblock them later.'**
  String iarBlockUserConfirmDescription(String name);

  /// Toast shown when blocking the reported user from the IAR action card fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t block this user. Please try again.'**
  String get iarBlockUserFailedToast;

  /// Toast shown after the DM with the reported user is closed from the IAR action card.
  ///
  /// In en, this message translates to:
  /// **'DM closed.'**
  String get iarCloseDmSuccessToast;

  /// Toast shown when closing the DM from the IAR action card fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t close this DM. Please try again.'**
  String get iarCloseDmFailedToast;

  /// Toast shown when leaving the community from the IAR action card fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t leave this community. Please try again.'**
  String get iarLeaveCommunityFailedToast;

  /// Action label that hides link previews / embeds on the message.
  ///
  /// In en, this message translates to:
  /// **'Suppress Embeds'**
  String get chatMessageSuppressEmbeds;

  /// Action label that re-enables previously hidden link previews / embeds on the message.
  ///
  /// In en, this message translates to:
  /// **'Unsuppress Embeds'**
  String get chatMessageUnsuppressEmbeds;

  /// Action label for deleting a message.
  ///
  /// In en, this message translates to:
  /// **'Delete Message'**
  String get chatMessageDelete;

  /// Title for the delete message confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'Delete Message'**
  String get chatMessageDeleteConfirmTitle;

  /// Body text for the delete message confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this message?'**
  String get chatMessageDeleteConfirmDescription;

  /// Tooltip label for additional message actions.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get chatMessageMore;

  /// Banner text shown above composer while editing a message.
  ///
  /// In en, this message translates to:
  /// **'Editing message'**
  String get chatEditingMessage;

  /// Placeholder in the inline reply preview when the parent message was deleted.
  ///
  /// In en, this message translates to:
  /// **'Original message was deleted'**
  String get chatReplyOriginalDeleted;

  /// Placeholder in the inline reply preview when the parent message could not be loaded.
  ///
  /// In en, this message translates to:
  /// **'Original message failed to load'**
  String get chatReplyOriginalFailedToLoad;

  /// Shown in the chat message list when the initial message history request fails. The user can retry from the same screen.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load messages.'**
  String get chatMessagesLoadError;

  /// Title of the confirmation alert shown when toggling reply mention against the recipient preference.
  ///
  /// In en, this message translates to:
  /// **'Override mention preference?'**
  String get chatReplyMentionOverrideTitle;

  /// Confirmation body when the recipient prefers @mentions on replies but the user disabled it.
  ///
  /// In en, this message translates to:
  /// **'{authorNickname} prefers to be @mentioned on replies. Send without the mention anyway?'**
  String chatReplyMentionPrefersMentionBody(String authorNickname);

  /// Confirmation body when the recipient prefers no @mention on replies but the user enabled it.
  ///
  /// In en, this message translates to:
  /// **'{authorNickname} prefers replies without an @mention. Send with the mention anyway?'**
  String chatReplyMentionPrefersNoMentionBody(String authorNickname);

  /// Confirm button label on the override-mention-preference alert.
  ///
  /// In en, this message translates to:
  /// **'Ignore preference'**
  String get chatReplyMentionIgnorePreference;

  /// Tooltip on the reply bar mention toggle when mention-on-reply is currently on.
  ///
  /// In en, this message translates to:
  /// **'Click to disable pinging the user you\'re replying to.'**
  String get chatReplyMentionDisableTooltip;

  /// Tooltip on the reply bar mention toggle when mention-on-reply is currently off.
  ///
  /// In en, this message translates to:
  /// **'Click to enable pinging the user you\'re replying to.'**
  String get chatReplyMentionEnableTooltip;

  /// Accessibility label for the reply bar mention toggle.
  ///
  /// In en, this message translates to:
  /// **'Mention replied user'**
  String get chatReplyMentionAccessibilityLabel;

  /// On state suffix appended to the reply bar mention toggle label.
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get chatReplyMentionOn;

  /// Off state suffix appended to the reply bar mention toggle label.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get chatReplyMentionOff;

  /// Accessible label for the cancel-reply button in the reply bar.
  ///
  /// In en, this message translates to:
  /// **'Cancel reply'**
  String get chatReplyCancel;

  /// Composer hint text while editing a message.
  ///
  /// In en, this message translates to:
  /// **'Edit message'**
  String get chatEditMessageHint;

  /// Toast when the user tries to save an edit without changing the message.
  ///
  /// In en, this message translates to:
  /// **'No changes to save'**
  String get chatEditNoChanges;

  /// Toast when send is attempted before the channel has finished loading.
  ///
  /// In en, this message translates to:
  /// **'This channel is not ready yet. Try again in a moment.'**
  String get chatChannelNotReady;

  /// Message metadata label displayed after edited messages.
  ///
  /// In en, this message translates to:
  /// **'(edited)'**
  String get chatMessageEdited;

  /// Inline chat message timestamp when the message was sent today. {time} is locale-formatted.
  ///
  /// In en, this message translates to:
  /// **'Today at {time}'**
  String chatMessageTimestampToday(String time);

  /// Inline chat message timestamp when the message was sent yesterday. {time} is locale-formatted.
  ///
  /// In en, this message translates to:
  /// **'Yesterday at {time}'**
  String chatMessageTimestampYesterday(String time);

  /// Accessible barrier label for the attachment media viewer dialog.
  ///
  /// In en, this message translates to:
  /// **'Image preview'**
  String get mediaViewerImagePreview;

  /// Tooltip and accessibility label for closing the attachment media viewer.
  ///
  /// In en, this message translates to:
  /// **'Close media viewer'**
  String get mediaViewerClose;

  /// Tooltip and accessibility label to open the current media item in an external browser.
  ///
  /// In en, this message translates to:
  /// **'Open in browser'**
  String get mediaViewerOpenInBrowser;

  /// Tooltip and accessibility label for the media viewer Forward action, which forwards the current attachment or embed.
  ///
  /// In en, this message translates to:
  /// **'Forward'**
  String get mediaViewerForward;

  /// Tooltip and accessibility label for the media viewer zoom-in action.
  ///
  /// In en, this message translates to:
  /// **'Zoom in'**
  String get mediaViewerZoomIn;

  /// Tooltip and accessibility label for the media viewer zoom-out action.
  ///
  /// In en, this message translates to:
  /// **'Zoom out'**
  String get mediaViewerZoomOut;

  /// Tooltip and accessibility label for navigating to the previous attachment in the media viewer.
  ///
  /// In en, this message translates to:
  /// **'Previous attachment'**
  String get mediaViewerPreviousAttachment;

  /// Tooltip and accessibility label for navigating to the next attachment in the media viewer.
  ///
  /// In en, this message translates to:
  /// **'Next attachment'**
  String get mediaViewerNextAttachment;

  /// Index label shown in the media viewer to indicate the current attachment position.
  ///
  /// In en, this message translates to:
  /// **'{current}/{total}'**
  String mediaViewerAttachmentIndex(int current, int total);

  /// Accessibility label for the tap surface that shows or hides inline video playback controls.
  ///
  /// In en, this message translates to:
  /// **'Toggle video controls'**
  String get chatAttachmentVideoToggleControls;

  /// Accessibility label for muting playback in mobile attachment fullscreen video.
  ///
  /// In en, this message translates to:
  /// **'Mute video'**
  String get chatAttachmentVideoMute;

  /// Accessibility label for unmuting playback in mobile attachment fullscreen video.
  ///
  /// In en, this message translates to:
  /// **'Unmute video'**
  String get chatAttachmentVideoUnmute;

  /// Accessibility label for the play button in mobile attachment fullscreen video.
  ///
  /// In en, this message translates to:
  /// **'Play video'**
  String get chatAttachmentVideoPlay;

  /// Accessibility label for the pause button in mobile attachment fullscreen video.
  ///
  /// In en, this message translates to:
  /// **'Pause video'**
  String get chatAttachmentVideoPause;

  /// Accessibility label for the seek bar in mobile attachment fullscreen video.
  ///
  /// In en, this message translates to:
  /// **'Video progress'**
  String get chatAttachmentVideoProgress;

  /// Secondary line in the @ mention autocomplete when the row is a mentionable guild role.
  ///
  /// In en, this message translates to:
  /// **'Notify users with this role who have permission to view this channel.'**
  String get composerAutocompleteRoleMentionDescription;

  /// Landing-view title of the add community modal.
  ///
  /// In en, this message translates to:
  /// **'Add a community'**
  String get addGuildModalTitle;

  /// Intro text on the add community modal landing view.
  ///
  /// In en, this message translates to:
  /// **'Create a new community or join an existing one.'**
  String get addGuildModalLandingDescription;

  /// Action button label to create a new community.
  ///
  /// In en, this message translates to:
  /// **'Create community'**
  String get addGuildCreateCommunity;

  /// Action button label to join a community via invite link.
  ///
  /// In en, this message translates to:
  /// **'Join community'**
  String get addGuildJoinCommunity;

  /// Action button label to import a Discord community template.
  ///
  /// In en, this message translates to:
  /// **'Import Discord template'**
  String get addGuildImportDiscordTemplate;

  /// Title of the join-by-invite sub-view in the add community modal.
  ///
  /// In en, this message translates to:
  /// **'Join a community'**
  String get addGuildJoinTitle;

  /// Body text on the join-by-invite sub-view.
  ///
  /// In en, this message translates to:
  /// **'Enter the invite link to join a community.'**
  String get addGuildJoinDescription;

  /// Label for the invite link input on the join sub-view.
  ///
  /// In en, this message translates to:
  /// **'Invite link'**
  String get addGuildInviteLinkLabel;

  /// Primary button label to submit the join-by-invite form.
  ///
  /// In en, this message translates to:
  /// **'Join community'**
  String get addGuildJoinSubmit;

  /// Error when the entered invite code cannot be resolved.
  ///
  /// In en, this message translates to:
  /// **'This invite is invalid or has expired.'**
  String get addGuildInviteInvalid;

  /// Generic error when joining a community via invite fails.
  ///
  /// In en, this message translates to:
  /// **'Could not join community. Please try again.'**
  String get addGuildJoinFailed;

  /// Toast shown after accepting an emoji or sticker pack invite.
  ///
  /// In en, this message translates to:
  /// **'Pack installed successfully.'**
  String get addGuildPackInstalled;

  /// Title for the remove-all-reactions confirmation sheet.
  ///
  /// In en, this message translates to:
  /// **'Remove All Reactions'**
  String get chatMessageRemoveAllReactionsConfirmTitle;

  /// Body text for the remove-all-reactions confirmation sheet.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove all reactions from this message?'**
  String get chatMessageRemoveAllReactionsConfirmDescription;

  /// Title for the unpin message confirmation sheet.
  ///
  /// In en, this message translates to:
  /// **'Unpin Message'**
  String get chatMessageUnpinConfirmTitle;

  /// Body text for the unpin message confirmation sheet.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to unpin this message?'**
  String get chatMessageUnpinConfirmDescription;

  /// Title for the self-DM personal notes channel in the sidebar and chat header.
  ///
  /// In en, this message translates to:
  /// **'Personal notes'**
  String get personalNotesTitle;

  /// Subtitle on the personal notes welcome empty state.
  ///
  /// In en, this message translates to:
  /// **'Your private space for thoughts and reminders'**
  String get personalNotesSubtitle;

  /// Heading on the start-of-channel welcome shown at the top of a guild channel's loaded message history and as its empty state. {channelName} already includes the leading # (e.g. #general).
  ///
  /// In en, this message translates to:
  /// **'Welcome to {channelName}'**
  String channelWelcomeHeading(String channelName);

  /// Whimsical body text on the start-of-channel welcome. {channelName} already includes the leading # (e.g. #general).
  ///
  /// In en, this message translates to:
  /// **'In the beginning, there was nothing. Then, there was {channelName}. And it was good.'**
  String channelWelcomeDescription(String channelName);

  /// Placeholder in the message composer when viewing personal notes.
  ///
  /// In en, this message translates to:
  /// **'Message yourself'**
  String get personalNotesComposerHint;

  /// Short subtitle in channel details for personal notes.
  ///
  /// In en, this message translates to:
  /// **'Your private space'**
  String get personalNotesPrivateSpace;

  /// Menu action to delete all messages in personal notes.
  ///
  /// In en, this message translates to:
  /// **'Purge personal notes'**
  String get purgePersonalNotes;

  /// Body of the destructive purge personal notes confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'This will permanently delete every message and attachment in your personal notes. This cannot be undone.'**
  String get purgePersonalNotesConfirmDescription;

  /// Confirm button on the purge personal notes dialog.
  ///
  /// In en, this message translates to:
  /// **'Purge'**
  String get purgePersonalNotesConfirmButton;

  /// Toast after purging personal notes with one or more messages deleted.
  ///
  /// In en, this message translates to:
  /// **'Purged {count} messages from personal notes'**
  String purgePersonalNotesSuccess(int count);

  /// Toast when purge runs on an already empty personal notes channel.
  ///
  /// In en, this message translates to:
  /// **'Personal notes were already empty'**
  String get purgePersonalNotesAlreadyEmpty;

  /// Toast or error title when the purge personal notes API call fails.
  ///
  /// In en, this message translates to:
  /// **'Could not clear personal notes'**
  String get purgePersonalNotesFailed;

  /// Section heading for account-related items in user settings navigation.
  ///
  /// In en, this message translates to:
  /// **'YOUR ACCOUNT'**
  String get userSettingsGroupYourAccount;

  /// Section heading for app preference items in user settings navigation.
  ///
  /// In en, this message translates to:
  /// **'APPLICATION'**
  String get userSettingsGroupApplication;

  /// Section heading for developer items in user settings navigation.
  ///
  /// In en, this message translates to:
  /// **'DEVELOPER'**
  String get userSettingsGroupDeveloper;

  /// Section heading for staff-only items in user settings navigation.
  ///
  /// In en, this message translates to:
  /// **'STAFF-ONLY'**
  String get userSettingsGroupStaffOnly;

  /// User settings navigation item for profile settings.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get userSettingsNavProfile;

  /// User settings navigation item for security and login settings.
  ///
  /// In en, this message translates to:
  /// **'Security & Login'**
  String get userSettingsNavSecurityLogin;

  /// User settings navigation item for Fluxer Plutonium subscription settings.
  ///
  /// In en, this message translates to:
  /// **'Fluxer Plutonium'**
  String get userSettingsNavFluxerPlutonium;

  /// User settings navigation item for gifts and promo codes.
  ///
  /// In en, this message translates to:
  /// **'Gifts & Codes'**
  String get userSettingsNavGiftsAndCodes;

  /// User settings navigation item for expression pack settings.
  ///
  /// In en, this message translates to:
  /// **'Expression Packs'**
  String get userSettingsNavExpressionPacks;

  /// User settings navigation item for the privacy dashboard.
  ///
  /// In en, this message translates to:
  /// **'Privacy Dashboard'**
  String get userSettingsNavPrivacyDashboard;

  /// User settings navigation item for authorized applications.
  ///
  /// In en, this message translates to:
  /// **'Authorized Apps'**
  String get userSettingsNavAuthorizedApps;

  /// User settings navigation item for blocked users.
  ///
  /// In en, this message translates to:
  /// **'Blocked Users'**
  String get userSettingsNavBlockedUsers;

  /// User settings navigation item for linked devices.
  ///
  /// In en, this message translates to:
  /// **'Linked Devices'**
  String get userSettingsNavLinkedDevices;

  /// User settings navigation item for connected accounts.
  ///
  /// In en, this message translates to:
  /// **'Connections'**
  String get userSettingsNavConnections;

  /// User settings navigation item for appearance settings.
  ///
  /// In en, this message translates to:
  /// **'Look & Feel'**
  String get userSettingsNavLookAndFeel;

  /// User settings navigation item for accessibility settings.
  ///
  /// In en, this message translates to:
  /// **'Accessibility'**
  String get userSettingsNavAccessibility;

  /// User settings navigation item for messages and media settings.
  ///
  /// In en, this message translates to:
  /// **'Messages & Media'**
  String get userSettingsNavMessagesAndMedia;

  /// User settings navigation item for audio and video settings.
  ///
  /// In en, this message translates to:
  /// **'Audio & Video'**
  String get userSettingsNavAudioAndVideo;

  /// User settings navigation item for sounds and alert settings.
  ///
  /// In en, this message translates to:
  /// **'Sounds & Alerts'**
  String get userSettingsNavSoundsAndAlerts;

  /// User settings navigation item for language and time settings.
  ///
  /// In en, this message translates to:
  /// **'Language & Time'**
  String get userSettingsNavLanguageAndTime;

  /// User settings navigation item for advanced settings.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get userSettingsNavAdvanced;

  /// User settings navigation item for developer applications.
  ///
  /// In en, this message translates to:
  /// **'Applications'**
  String get userSettingsNavApplications;

  /// User settings navigation item for in-app logs.
  ///
  /// In en, this message translates to:
  /// **'App Logs'**
  String get userSettingsNavAppLogs;

  /// User settings navigation item for staff developer tools.
  ///
  /// In en, this message translates to:
  /// **'Developer Tools'**
  String get userSettingsNavDeveloperTools;

  /// User settings navigation item for staff limits configuration.
  ///
  /// In en, this message translates to:
  /// **'Limits Config'**
  String get userSettingsNavLimitsConfig;

  /// User settings navigation item for staff feature flags.
  ///
  /// In en, this message translates to:
  /// **'Feature Flags'**
  String get userSettingsNavFeatureFlags;

  /// User settings navigation item for release notes.
  ///
  /// In en, this message translates to:
  /// **'What\'s New'**
  String get userSettingsNavWhatsNew;

  /// User settings navigation item to sign out of the account.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get userSettingsNavLogOut;

  /// Title on the beta warning bottom sheet shown on first launch and after each build update.
  ///
  /// In en, this message translates to:
  /// **'Beta software'**
  String get betaWarningTitle;

  /// Main warning message on the beta warning bottom sheet.
  ///
  /// In en, this message translates to:
  /// **'This is beta software. Not everything is finished or added yet.'**
  String get betaWarningMessage;

  /// Secondary message on the beta warning sheet about reporting issues.
  ///
  /// In en, this message translates to:
  /// **'Please report any issues you find to the Fluxer Mobile community (you must have Plutonium to be able to join the community currently).'**
  String get betaWarningReportIssues;

  /// Link label on the beta warning sheet to the open-source repository.
  ///
  /// In en, this message translates to:
  /// **'View source on GitHub'**
  String get betaWarningRepoLink;

  /// Primary button on the beta warning sheet to acknowledge the message.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get betaWarningGotIt;

  /// Quick switcher bottom sheet tab for search results.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get quickSwitcherTabSearch;

  /// Quick switcher bottom sheet tab for the friends list.
  ///
  /// In en, this message translates to:
  /// **'Friends'**
  String get quickSwitcherTabFriends;

  /// Placeholder in the mobile quick switcher search input.
  ///
  /// In en, this message translates to:
  /// **'Search for channels, people, or communities'**
  String get quickSwitcherSearchPlaceholder;

  /// Placeholder in the friends tab search input.
  ///
  /// In en, this message translates to:
  /// **'Search friends'**
  String get quickSwitcherSearchFriends;

  /// Empty state title when quick switcher search has no results.
  ///
  /// In en, this message translates to:
  /// **'No matches found'**
  String get quickSwitcherNoMatchesFound;

  /// Empty state hint describing quick switcher prefix filters.
  ///
  /// In en, this message translates to:
  /// **'Try a different name or use @ / # / ! / * prefixes to filter results.'**
  String get quickSwitcherEmptyHint;

  /// Quick switcher section header for user results.
  ///
  /// In en, this message translates to:
  /// **'People'**
  String get quickSwitcherSectionPeople;

  /// Quick switcher section header for group DM results.
  ///
  /// In en, this message translates to:
  /// **'Group messages'**
  String get quickSwitcherSectionGroupMessages;

  /// Quick switcher section header for text channel results.
  ///
  /// In en, this message translates to:
  /// **'Text channels'**
  String get quickSwitcherSectionTextChannels;

  /// Quick switcher section header for voice channel results.
  ///
  /// In en, this message translates to:
  /// **'Voice channels'**
  String get quickSwitcherSectionVoiceChannels;

  /// Quick switcher section header for guild results.
  ///
  /// In en, this message translates to:
  /// **'Communities'**
  String get quickSwitcherSectionCommunities;

  /// Quick switcher section header for settings results.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get quickSwitcherSectionSettings;

  /// Quick switcher label for navigating to the home DM list.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get quickSwitcherHomeLabel;

  /// Quick switcher subtitle for the home virtual guild entry.
  ///
  /// In en, this message translates to:
  /// **'Direct Messages'**
  String get quickSwitcherDirectMessagesLabel;

  /// Quick switcher label for the favorites virtual guild entry.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get quickSwitcherFavoritesLabel;

  /// Quick switcher settings entry for user settings.
  ///
  /// In en, this message translates to:
  /// **'User Settings'**
  String get quickSwitcherUserSettingsLabel;

  /// Quick switcher settings entry for notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get quickSwitcherNotificationsLabel;

  /// Quick switcher settings entry for bookmarks.
  ///
  /// In en, this message translates to:
  /// **'Bookmarks'**
  String get quickSwitcherBookmarksLabel;

  /// Quick switcher settings entry for mentions.
  ///
  /// In en, this message translates to:
  /// **'Mentions'**
  String get quickSwitcherMentionsLabel;

  /// Empty state in quick switcher friends tab when the user has no friends.
  ///
  /// In en, this message translates to:
  /// **'No friends yet'**
  String get quickSwitcherFriendsEmptyTitle;

  /// Empty state hint in quick switcher friends tab.
  ///
  /// In en, this message translates to:
  /// **'Add a friend to get started.'**
  String get quickSwitcherFriendsEmptyHint;

  /// Empty state when friends tab search has no matches.
  ///
  /// In en, this message translates to:
  /// **'No friends match that search'**
  String get quickSwitcherFriendsNoMatchTitle;

  /// Empty state hint when friends tab search has no matches.
  ///
  /// In en, this message translates to:
  /// **'Try a different name.'**
  String get quickSwitcherFriendsNoMatchHint;

  /// Quick switcher search alias for user settings.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get quickSwitcherSearchAliasUser;

  /// Quick switcher search alias for user settings.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get quickSwitcherSearchAliasYou;

  /// Quick switcher search alias for the home DM list.
  ///
  /// In en, this message translates to:
  /// **'DM'**
  String get quickSwitcherSearchAliasDm;

  /// Quick switcher search alias for the home DM list.
  ///
  /// In en, this message translates to:
  /// **'DMs'**
  String get quickSwitcherSearchAliasDms;

  /// Quick switcher search alias for the home DM list.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get quickSwitcherSearchAliasMessages;

  /// Quick switcher search alias for favorites.
  ///
  /// In en, this message translates to:
  /// **'Fav'**
  String get quickSwitcherSearchAliasFav;

  /// Quick switcher search alias for favorites.
  ///
  /// In en, this message translates to:
  /// **'Starred'**
  String get quickSwitcherSearchAliasStarred;

  /// Quick switcher search alias for notifications.
  ///
  /// In en, this message translates to:
  /// **'Inbox'**
  String get quickSwitcherSearchAliasInbox;

  /// Quick switcher search alias for bookmarks.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get quickSwitcherSearchAliasSaved;

  /// Accessible label for icon-only close buttons.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get uiClose;

  /// Generic confirm action label for modals and sheets.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get uiConfirm;

  /// Accessible label announced while a control is loading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get uiLoading;

  /// Status label shown when settings have unsaved edits.
  ///
  /// In en, this message translates to:
  /// **'Unsaved changes'**
  String get uiUnsavedChanges;

  /// Reset action label for settings save bars.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get uiReset;

  /// Accessible label for the color picker trigger button.
  ///
  /// In en, this message translates to:
  /// **'Open color picker'**
  String get uiOpenColorPicker;

  /// Fallback accessible label for select fields without a label.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get uiSelectPlaceholder;

  /// Placeholder and accessible label for search fields in select sheets.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get uiSearchPlaceholder;

  /// Empty state shown when a select search returns no matches.
  ///
  /// In en, this message translates to:
  /// **'No options found'**
  String get uiNoOptionsFound;

  /// Accessible label for dismissing a toast notification.
  ///
  /// In en, this message translates to:
  /// **'Dismiss notification'**
  String get uiDismissNotification;

  /// Title for the mobile color picker sheet.
  ///
  /// In en, this message translates to:
  /// **'Color picker'**
  String get uiColorPickerTitle;

  /// Title of the confirmation dialog shown before sending a message that mentions @everyone or @here in a large server.
  ///
  /// In en, this message translates to:
  /// **'Mention everyone?'**
  String get mentionConfirmTitle;

  /// Body of the @everyone mention confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'This will notify {count} members. Continue?'**
  String mentionConfirmEveryoneBody(int count);

  /// Body of the @here mention confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'This will notify {count} online members. Continue?'**
  String mentionConfirmHereBody(int count);

  /// Confirm button label on the mention confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'Mention'**
  String get mentionConfirmButton;

  /// Toast shown when a message contains a custom emoji the user cannot use in this channel.
  ///
  /// In en, this message translates to:
  /// **'You can\'t use that emoji here.'**
  String get composerEmojiUnavailable;

  /// Label for the self-hosted instance URL input on the login screen.
  ///
  /// In en, this message translates to:
  /// **'Instance URL'**
  String get instanceUrlLabel;

  /// Placeholder for the self-hosted instance URL input.
  ///
  /// In en, this message translates to:
  /// **'Enter instance URL (e.g. fluxer.app)'**
  String get instanceUrlPlaceholder;

  /// Button label to connect to a custom Fluxer instance.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get instanceConnect;

  /// Status text while discovering a custom Fluxer instance.
  ///
  /// In en, this message translates to:
  /// **'Connecting…'**
  String get instanceConnecting;

  /// Fallback error when instance discovery fails.
  ///
  /// In en, this message translates to:
  /// **'Failed to connect to instance'**
  String get instanceConnectFailed;

  /// Label for the recent self-hosted instances list.
  ///
  /// In en, this message translates to:
  /// **'Recent instances'**
  String get recentInstances;

  /// Accessibility label for removing a recent instance.
  ///
  /// In en, this message translates to:
  /// **'Remove {domain} from recent instances'**
  String removeRecentInstance(String domain);

  /// Title for the self-hosted instance connection bottom sheet.
  ///
  /// In en, this message translates to:
  /// **'Connect to instance'**
  String get instanceSheetTitle;

  /// Subtle link on the login screen to open the instance connection sheet.
  ///
  /// In en, this message translates to:
  /// **'Connect to a different instance'**
  String get connectToDifferentInstance;

  /// Link to change the connected Fluxer instance.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get changeInstance;

  /// Hint shown when login is blocked until instance discovery succeeds.
  ///
  /// In en, this message translates to:
  /// **'Connect to the instance to sign in'**
  String get instanceConnectionRequired;
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
  bool isSupported(Locale locale) => <String>[
    'af',
    'ar',
    'cs',
    'cy',
    'da',
    'de',
    'el',
    'en',
    'es',
    'et',
    'fa',
    'fi',
    'fr',
    'ga',
    'gl',
    'hu',
    'is',
    'it',
    'ja',
    'ko',
    'lt',
    'lv',
    'nb',
    'pl',
    'pt',
    'ru',
    'sk',
    'sl',
    'sr',
    'sv',
    'th',
    'tr',
    'uk',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_FluxerLocalizationsDelegate old) => false;
}

FluxerLocalizations lookupFluxerLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hans':
            return FluxerLocalizationsZhHans();
          case 'Hant':
            return FluxerLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'de':
      {
        switch (locale.countryCode) {
          case 'CH':
            return FluxerLocalizationsDeCh();
        }
        break;
      }
    case 'en':
      {
        switch (locale.countryCode) {
          case 'GB':
            return FluxerLocalizationsEnGb();
          case 'US':
            return FluxerLocalizationsEnUs();
        }
        break;
      }
    case 'es':
      {
        switch (locale.countryCode) {
          case '419':
            return FluxerLocalizationsEs419();
        }
        break;
      }
    case 'fr':
      {
        switch (locale.countryCode) {
          case 'CA':
            return FluxerLocalizationsFrCa();
        }
        break;
      }
    case 'nb':
      {
        switch (locale.countryCode) {
          case 'NO':
            return FluxerLocalizationsNbNo();
        }
        break;
      }
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return FluxerLocalizationsPtBr();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'af':
      return FluxerLocalizationsAf();
    case 'ar':
      return FluxerLocalizationsAr();
    case 'cs':
      return FluxerLocalizationsCs();
    case 'cy':
      return FluxerLocalizationsCy();
    case 'da':
      return FluxerLocalizationsDa();
    case 'de':
      return FluxerLocalizationsDe();
    case 'el':
      return FluxerLocalizationsEl();
    case 'en':
      return FluxerLocalizationsEn();
    case 'es':
      return FluxerLocalizationsEs();
    case 'et':
      return FluxerLocalizationsEt();
    case 'fa':
      return FluxerLocalizationsFa();
    case 'fi':
      return FluxerLocalizationsFi();
    case 'fr':
      return FluxerLocalizationsFr();
    case 'ga':
      return FluxerLocalizationsGa();
    case 'gl':
      return FluxerLocalizationsGl();
    case 'hu':
      return FluxerLocalizationsHu();
    case 'is':
      return FluxerLocalizationsIs();
    case 'it':
      return FluxerLocalizationsIt();
    case 'ja':
      return FluxerLocalizationsJa();
    case 'ko':
      return FluxerLocalizationsKo();
    case 'lt':
      return FluxerLocalizationsLt();
    case 'lv':
      return FluxerLocalizationsLv();
    case 'nb':
      return FluxerLocalizationsNb();
    case 'pl':
      return FluxerLocalizationsPl();
    case 'pt':
      return FluxerLocalizationsPt();
    case 'ru':
      return FluxerLocalizationsRu();
    case 'sk':
      return FluxerLocalizationsSk();
    case 'sl':
      return FluxerLocalizationsSl();
    case 'sr':
      return FluxerLocalizationsSr();
    case 'sv':
      return FluxerLocalizationsSv();
    case 'th':
      return FluxerLocalizationsTh();
    case 'tr':
      return FluxerLocalizationsTr();
    case 'uk':
      return FluxerLocalizationsUk();
    case 'zh':
      return FluxerLocalizationsZh();
  }

  throw FlutterError(
    'FluxerLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
